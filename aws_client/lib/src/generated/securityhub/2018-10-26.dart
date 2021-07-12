// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
/// the association of the member account with the administrator account is
/// created only in the <code>us-west-2</code> Region. Security Hub must be
/// enabled for the member account in the same Region that the invitation was
/// sent from.
///
/// The following throttling limits apply to using Security Hub API operations.
///
/// <ul>
/// <li>
/// <code> <a>BatchEnableStandards</a> </code> - <code>RateLimit</code> of 1
/// request per second, <code>BurstLimit</code> of 1 request per second.
/// </li>
/// <li>
/// <code> <a>GetFindings</a> </code> - <code>RateLimit</code> of 3 requests per
/// second. <code>BurstLimit</code> of 6 requests per second.
/// </li>
/// <li>
/// <code> <a>UpdateFindings</a> </code> - <code>RateLimit</code> of 1 request
/// per second. <code>BurstLimit</code> of 5 requests per second.
/// </li>
/// <li>
/// <code> <a>UpdateStandardsControl</a> </code> - <code>RateLimit</code> of 1
/// request per second, <code>BurstLimit</code> of 5 requests per second.
/// </li>
/// <li>
/// All other operations - <code>RateLimit</code> of 10 requests per second.
/// <code>BurstLimit</code> of 30 requests per second.
/// </li>
/// </ul>
class SecurityHub {
  final _s.RestJsonProtocol _protocol;
  SecurityHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'securityhub',
            signingName: 'securityhub',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts the invitation to be a member account and be monitored by the
  /// Security Hub administrator account that the invitation was sent from.
  ///
  /// This operation is only used by member accounts that are not added through
  /// Organizations.
  ///
  /// When the member account accepts the invitation, permission is granted to
  /// the administrator account to view findings generated in the member
  /// account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [administratorId] :
  /// The account ID of the Security Hub administrator account that sent the
  /// invitation.
  ///
  /// Parameter [invitationId] :
  /// The identifier of the invitation sent from the Security Hub administrator
  /// account.
  Future<void> acceptAdministratorInvitation({
    required String administratorId,
    required String invitationId,
  }) async {
    ArgumentError.checkNotNull(administratorId, 'administratorId');
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    final $payload = <String, dynamic>{
      'AdministratorId': administratorId,
      'InvitationId': invitationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/administrator',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This method is deprecated. Instead, use
  /// <code>AcceptAdministratorInvitation</code>.
  ///
  /// The Security Hub console continues to use <code>AcceptInvitation</code>.
  /// It will eventually change to use
  /// <code>AcceptAdministratorInvitation</code>. Any IAM policies that
  /// specifically control access to this function must continue to use
  /// <code>AcceptInvitation</code>. You should also add
  /// <code>AcceptAdministratorInvitation</code> to your policies to ensure that
  /// the correct permissions are in place after the console begins to use
  /// <code>AcceptAdministratorInvitation</code>.
  ///
  /// Accepts the invitation to be a member account and be monitored by the
  /// Security Hub administrator account that the invitation was sent from.
  ///
  /// This operation is only used by member accounts that are not added through
  /// Organizations.
  ///
  /// When the member account accepts the invitation, permission is granted to
  /// the administrator account to view findings generated in the member
  /// account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [invitationId] :
  /// The identifier of the invitation sent from the Security Hub administrator
  /// account.
  ///
  /// Parameter [masterId] :
  /// The account ID of the Security Hub administrator account that sent the
  /// invitation.
  @Deprecated('Deprecated')
  Future<void> acceptInvitation({
    required String invitationId,
    required String masterId,
  }) async {
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    ArgumentError.checkNotNull(masterId, 'masterId');
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
    required List<String> standardsSubscriptionArns,
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
    required List<StandardsSubscriptionRequest> standardsSubscriptionRequests,
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

  /// Imports security findings generated from an integrated product into
  /// Security Hub. This action is requested by the integrated product to import
  /// its findings into Security Hub.
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
  /// <code>Note</code>
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
  /// Finding providers also should not use <code>BatchImportFindings</code> to
  /// update the following attributes.
  ///
  /// <ul>
  /// <li>
  /// <code>Confidence</code>
  /// </li>
  /// <li>
  /// <code>Criticality</code>
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
  /// </ul>
  /// Instead, finding providers use <code>FindingProviderFields</code> to
  /// provide values for these attributes.
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
    required List<AwsSecurityFinding> findings,
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
  /// investigation into a finding. Requested by administrator accounts or
  /// member accounts. Administrator accounts can update findings for their
  /// account and their member accounts. Member accounts can update findings for
  /// their account.
  ///
  /// Updates from <code>BatchUpdateFindings</code> do not affect the value of
  /// <code>UpdatedAt</code> for a finding.
  ///
  /// Administrator and member accounts can use <code>BatchUpdateFindings</code>
  /// to update the following finding fields and objects.
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
  /// You can configure IAM policies to restrict access to fields and field
  /// values. For example, you might not want member accounts to be able to
  /// suppress findings or change the finding severity. See <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/finding-update-batchupdatefindings.html#batchupdatefindings-configure-access">Configuring
  /// access to BatchUpdateFindings</a> in the <i>AWS Security Hub User
  /// Guide</i>.
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
    required List<AwsSecurityFindingIdentifier> findingIdentifiers,
    int? confidence,
    int? criticality,
    NoteUpdate? note,
    List<RelatedFinding>? relatedFindings,
    SeverityUpdate? severity,
    List<String>? types,
    Map<String, String>? userDefinedFields,
    VerificationState? verificationState,
    WorkflowUpdate? workflow,
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
      if (confidence != null) 'Confidence': confidence,
      if (criticality != null) 'Criticality': criticality,
      if (note != null) 'Note': note,
      if (relatedFindings != null) 'RelatedFindings': relatedFindings,
      if (severity != null) 'Severity': severity,
      if (types != null) 'Types': types,
      if (userDefinedFields != null) 'UserDefinedFields': userDefinedFields,
      if (verificationState != null)
        'VerificationState': verificationState.toValue(),
      if (workflow != null) 'Workflow': workflow,
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
  /// The ID for the custom action target. Can contain up to 20 alphanumeric
  /// characters.
  ///
  /// Parameter [name] :
  /// The name of the custom action target. Can contain up to 20 characters.
  Future<CreateActionTargetResponse> createActionTarget({
    required String description,
    required String id,
    required String name,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(name, 'name');
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
    required AwsSecurityFindingFilters filters,
    required String groupByAttribute,
    required String name,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(groupByAttribute, 'groupByAttribute');
    ArgumentError.checkNotNull(name, 'name');
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
  /// accounts and the account used to make the request, which is the
  /// administrator account. If you are integrated with Organizations, then the
  /// administrator account is designated by the organization management
  /// account.
  ///
  /// <code>CreateMembers</code> is always used to add accounts that are not
  /// organization members.
  ///
  /// For accounts that are part of an organization, <code>CreateMembers</code>
  /// is only used in the following cases:
  ///
  /// <ul>
  /// <li>
  /// Security Hub is not configured to automatically add new accounts in an
  /// organization.
  /// </li>
  /// <li>
  /// The account was disassociated or deleted in Security Hub.
  /// </li>
  /// </ul>
  /// This action can only be used by an account that has Security Hub enabled.
  /// To enable Security Hub, you can use the <code> <a>EnableSecurityHub</a>
  /// </code> operation.
  ///
  /// For accounts that are not organization members, you create the account
  /// association and then send an invitation to the member account. To send the
  /// invitation, you use the <code> <a>InviteMembers</a> </code> operation. If
  /// the account owner accepts the invitation, the account becomes a member
  /// account in Security Hub.
  ///
  /// Accounts that are part of an organization do not receive an invitation.
  /// They automatically become a member account in Security Hub.
  ///
  /// A permissions policy is added that permits the administrator account to
  /// view the findings generated in the member account. When Security Hub is
  /// enabled in a member account, the member account findings are also visible
  /// to the administrator account.
  ///
  /// To remove the association between the administrator and member accounts,
  /// use the <code> <a>DisassociateFromMasterAccount</a> </code> or <code>
  /// <a>DisassociateMembers</a> </code> operation.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [accountDetails] :
  /// The list of accounts to associate with the Security Hub administrator
  /// account. For each account, the list includes the account ID and optionally
  /// the email address.
  Future<CreateMembersResponse> createMembers({
    required List<AccountDetails> accountDetails,
  }) async {
    ArgumentError.checkNotNull(accountDetails, 'accountDetails');
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
  /// This operation is only used by accounts that are not part of an
  /// organization. Organization accounts do not receive invitations.
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
    required List<String> accountIds,
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
    required String actionTargetArn,
  }) async {
    ArgumentError.checkNotNull(actionTargetArn, 'actionTargetArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/actionTargets/${actionTargetArn.split('/').map(Uri.encodeComponent).join('/')}',
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
    required String insightArn,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/insights/${insightArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInsightResponse.fromJson(response);
  }

  /// Deletes invitations received by the AWS account to become a member
  /// account.
  ///
  /// This operation is only used by accounts that are not part of an
  /// organization. Organization accounts do not receive invitations.
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
    required List<String> accountIds,
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
  /// Can be used to delete member accounts that belong to an organization as
  /// well as member accounts that were invited manually.
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
    required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
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
    List<String>? actionTargetArns,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (actionTargetArns != null) 'ActionTargetArns': actionTargetArns,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
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
    String? hubArn,
  }) async {
    final $query = <String, List<String>>{
      if (hubArn != null) 'HubArn': [hubArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeHubResponse.fromJson(response);
  }

  /// Returns information about the Organizations configuration for Security
  /// Hub. Can only be called from a Security Hub administrator account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organization/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Returns information about product integrations in Security Hub.
  ///
  /// You can optionally provide an integration ARN. If you provide an
  /// integration ARN, then the results only include that integration.
  ///
  /// If you do not provide an integration ARN, then the results include all of
  /// the available product integrations.
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
  ///
  /// Parameter [productArn] :
  /// The ARN of the integration to return.
  Future<DescribeProductsResponse> describeProducts({
    int? maxResults,
    String? nextToken,
    String? productArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (productArn != null) 'ProductArn': [productArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/products',
      queryParams: $query,
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
    int? maxResults,
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
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/standards',
      queryParams: $query,
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
  /// standard. To get the subscription ARNs of the standards you have enabled,
  /// use the <code> <a>GetEnabledStandards</a> </code> operation.
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
    required String standardsSubscriptionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        standardsSubscriptionArn, 'standardsSubscriptionArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/standards/controls/${standardsSubscriptionArn.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
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
    required String productSubscriptionArn,
  }) async {
    ArgumentError.checkNotNull(
        productSubscriptionArn, 'productSubscriptionArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/productSubscriptions/${productSubscriptionArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables a Security Hub administrator account. Can only be called by the
  /// organization management account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS account identifier of the Security Hub administrator account.
  Future<void> disableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    final $payload = <String, dynamic>{
      'AdminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/admin/disable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables Security Hub in your account only in the current Region. To
  /// disable Security Hub in all Regions, you must submit one request per
  /// Region where you have enabled Security Hub.
  ///
  /// When you disable Security Hub for an administrator account, it doesn't
  /// disable Security Hub for any associated member accounts.
  ///
  /// When you disable Security Hub, your existing findings and insights and any
  /// Security Hub configuration settings are deleted after 90 days and cannot
  /// be recovered. Any standards that were enabled are disabled, and your
  /// administrator and member account associations are removed.
  ///
  /// If you want to save your existing findings, you must export them before
  /// you disable Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  Future<void> disableSecurityHub() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the current Security Hub member account from the associated
  /// administrator account.
  ///
  /// This operation is only used by accounts that are not part of an
  /// organization. For organization accounts, only the administrator account
  /// can disassociate a member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<void> disassociateFromAdministratorAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/administrator/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This method is deprecated. Instead, use
  /// <code>DisassociateFromAdministratorAccount</code>.
  ///
  /// The Security Hub console continues to use
  /// <code>DisassociateFromMasterAccount</code>. It will eventually change to
  /// use <code>DisassociateFromAdministratorAccount</code>. Any IAM policies
  /// that specifically control access to this function must continue to use
  /// <code>DisassociateFromMasterAccount</code>. You should also add
  /// <code>DisassociateFromAdministratorAccount</code> to your policies to
  /// ensure that the correct permissions are in place after the console begins
  /// to use <code>DisassociateFromAdministratorAccount</code>.
  ///
  /// Disassociates the current Security Hub member account from the associated
  /// administrator account.
  ///
  /// This operation is only used by accounts that are not part of an
  /// organization. For organization accounts, only the administrator account
  /// can disassociate a member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  @Deprecated('Deprecated')
  Future<void> disassociateFromMasterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the specified member accounts from the associated
  /// administrator account.
  ///
  /// Can be used to disassociate both accounts that are managed using
  /// Organizations and accounts that were invited manually.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The account IDs of the member accounts to disassociate from the
  /// administrator account.
  Future<void> disassociateMembers({
    required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables the integration of a partner product with Security Hub. Integrated
  /// products send findings to Security Hub.
  ///
  /// When you enable a product integration, a permissions policy that grants
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
    required String productArn,
  }) async {
    ArgumentError.checkNotNull(productArn, 'productArn');
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

  /// Designates the Security Hub administrator account for an organization. Can
  /// only be called by the organization management account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS account identifier of the account to designate as the Security Hub
  /// administrator account.
  Future<void> enableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    final $payload = <String, dynamic>{
      'AdminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/admin/enable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables Security Hub for your account in the current Region or the Region
  /// you specify in the request.
  ///
  /// When you enable Security Hub, you grant to Security Hub the permissions
  /// necessary to gather findings from other services that are integrated with
  /// Security Hub.
  ///
  /// When you use the <code>EnableSecurityHub</code> operation to enable
  /// Security Hub, you also automatically enable the following standards.
  ///
  /// <ul>
  /// <li>
  /// CIS AWS Foundations
  /// </li>
  /// <li>
  /// AWS Foundational Security Best Practices
  /// </li>
  /// </ul>
  /// You do not enable the Payment Card Industry Data Security Standard (PCI
  /// DSS) standard.
  ///
  /// To not enable the automatically enabled standards, set
  /// <code>EnableDefaultStandards</code> to <code>false</code>.
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
  /// The tags to add to the hub resource when you enable Security Hub.
  Future<void> enableSecurityHub({
    bool? enableDefaultStandards,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (enableDefaultStandards != null)
        'EnableDefaultStandards': enableDefaultStandards,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Provides the details for the Security Hub administrator account for the
  /// current member account.
  ///
  /// Can be used by both member accounts that are managed using Organizations
  /// and accounts that were invited manually.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<GetAdministratorAccountResponse> getAdministratorAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/administrator',
      exceptionFnMap: _exceptionFns,
    );
    return GetAdministratorAccountResponse.fromJson(response);
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
    int? maxResults,
    String? nextToken,
    List<String>? standardsSubscriptionArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (standardsSubscriptionArns != null)
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
  /// You can filter by up to 10 finding attributes. For each attribute, you can
  /// provide up to 20 filter values.
  ///
  /// Note that in the available filter fields, <code>WorkflowState</code> is
  /// deprecated. To search for a finding based on its workflow status, use
  /// <code>WorkflowStatus</code>.
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
    AwsSecurityFindingFilters? filters,
    int? maxResults,
    String? nextToken,
    List<SortCriterion>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
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
    required String insightArn,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/insights/results/${insightArn.split('/').map(Uri.encodeComponent).join('/')}',
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
    List<String>? insightArns,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (insightArns != null) 'InsightArns': insightArns,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
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

  /// This method is deprecated. Instead, use
  /// <code>GetAdministratorAccount</code>.
  ///
  /// The Security Hub console continues to use <code>GetMasterAccount</code>.
  /// It will eventually change to use <code>GetAdministratorAccount</code>. Any
  /// IAM policies that specifically control access to this function must
  /// continue to use <code>GetMasterAccount</code>. You should also add
  /// <code>GetAdministratorAccount</code> to your policies to ensure that the
  /// correct permissions are in place after the console begins to use
  /// <code>GetAdministratorAccount</code>.
  ///
  /// Provides the details for the Security Hub administrator account for the
  /// current member account.
  ///
  /// Can be used by both member accounts that are managed using Organizations
  /// and accounts that were invited manually.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  @Deprecated('Deprecated')
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
  /// An administrator account can be either the delegated Security Hub
  /// administrator account for an organization or an administrator account that
  /// enabled Security Hub manually.
  ///
  /// The results include both member accounts that are managed using
  /// Organizations and accounts that were invited manually.
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
    required List<String> accountIds,
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
  /// administrator account that the invitation is sent from.
  ///
  /// This operation is only used to invite accounts that do not belong to an
  /// organization. Organization accounts do not receive invitations.
  ///
  /// Before you can use this action to invite a member, you must first use the
  /// <code> <a>CreateMembers</a> </code> action to create the member account in
  /// Security Hub.
  ///
  /// When the account owner enables Security Hub and accepts the invitation to
  /// become a member account, the administrator account can view the findings
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
    required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
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
    int? maxResults,
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
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/productSubscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnabledProductsForImportResponse.fromJson(response);
  }

  /// Lists all Security Hub membership invitations that were sent to the
  /// current AWS account.
  ///
  /// This operation is only used by accounts that are managed by invitation.
  /// Accounts that are managed using the integration with AWS Organizations do
  /// not receive invitations.
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Lists details about all member accounts for the current Security Hub
  /// administrator account.
  ///
  /// The results include both member accounts that belong to an organization
  /// and member accounts that were invited manually.
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
  /// relationship status with the administrator account. The default value is
  /// <code>TRUE</code>.
  ///
  /// If <code>OnlyAssociated</code> is set to <code>TRUE</code>, the response
  /// includes member accounts whose relationship status with the administrator
  /// account is set to <code>ENABLED</code>.
  ///
  /// If <code>OnlyAssociated</code> is set to <code>FALSE</code>, the response
  /// includes all existing member accounts.
  Future<ListMembersResponse> listMembers({
    int? maxResults,
    String? nextToken,
    bool? onlyAssociated,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (onlyAssociated != null) 'OnlyAssociated': [onlyAssociated.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Lists the Security Hub administrator accounts. Can only be called by the
  /// organization management account.
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
  /// <code>ListOrganizationAdminAccounts</code> operation, set the value of
  /// this parameter to <code>NULL</code>. For subsequent calls to the
  /// operation, to continue listing data, set the value of this parameter to
  /// the value returned from the previous response.
  Future<ListOrganizationAdminAccountsResponse> listOrganizationAdminAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organization/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationAdminAccountsResponse.fromJson(response);
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
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
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
  /// The tags to add to the resource. You can add up to 50 tags at a time. The
  /// tag keys can be no longer than 128 characters. The tag values can be no
  /// longer than 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
  /// The tag keys associated with the tags to remove from the resource. You can
  /// remove up to 50 tags at a time.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
    required String actionTargetArn,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(actionTargetArn, 'actionTargetArn');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/actionTargets/${actionTargetArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
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
    required AwsSecurityFindingFilters filters,
    NoteUpdate? note,
    RecordState? recordState,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    final $payload = <String, dynamic>{
      'Filters': filters,
      if (note != null) 'Note': note,
      if (recordState != null) 'RecordState': recordState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/findings',
      exceptionFnMap: _exceptionFns,
    );
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
    required String insightArn,
    AwsSecurityFindingFilters? filters,
    String? groupByAttribute,
    String? name,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (groupByAttribute != null) 'GroupByAttribute': groupByAttribute,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/insights/${insightArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Used to update the configuration related to Organizations. Can only be
  /// called from a Security Hub administrator account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [autoEnable] :
  /// Whether to automatically enable Security Hub for new accounts in the
  /// organization.
  ///
  /// By default, this is <code>false</code>, and new accounts are not added
  /// automatically.
  ///
  /// To automatically enable Security Hub for new accounts, set this to
  /// <code>true</code>.
  Future<void> updateOrganizationConfiguration({
    required bool autoEnable,
  }) async {
    ArgumentError.checkNotNull(autoEnable, 'autoEnable');
    final $payload = <String, dynamic>{
      'AutoEnable': autoEnable,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates configuration options for Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [autoEnableControls] :
  /// Whether to automatically enable new controls when they are added to
  /// standards that are enabled.
  ///
  /// By default, this is set to <code>true</code>, and new controls are enabled
  /// automatically. To not automatically enable new controls, set this to
  /// <code>false</code>.
  Future<void> updateSecurityHubConfiguration({
    bool? autoEnableControls,
  }) async {
    final $payload = <String, dynamic>{
      if (autoEnableControls != null) 'AutoEnableControls': autoEnableControls,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
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
  /// control. If you are disabling a control, then this is required.
  Future<void> updateStandardsControl({
    required String standardsControlArn,
    ControlStatus? controlStatus,
    String? disabledReason,
  }) async {
    ArgumentError.checkNotNull(standardsControlArn, 'standardsControlArn');
    final $payload = <String, dynamic>{
      if (controlStatus != null) 'ControlStatus': controlStatus.toValue(),
      if (disabledReason != null) 'DisabledReason': disabledReason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/standards/control/${standardsControlArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AcceptAdministratorInvitationResponse {
  AcceptAdministratorInvitationResponse();

  factory AcceptAdministratorInvitationResponse.fromJson(
      Map<String, dynamic> _) {
    return AcceptAdministratorInvitationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AcceptInvitationResponse {
  AcceptInvitationResponse();

  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> _) {
    return AcceptInvitationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The details of an AWS account.
class AccountDetails {
  /// The ID of an AWS account.
  final String accountId;

  /// The email of an AWS account.
  final String? email;

  AccountDetails({
    required this.accountId,
    this.email,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
      accountId: json['AccountId'] as String,
      email: json['Email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    return {
      'AccountId': accountId,
      if (email != null) 'Email': email,
    };
  }
}

/// Provides details about one of the following actions that affects or that was
/// taken on a resource:
///
/// <ul>
/// <li>
/// A remote IP address issued an AWS API call
/// </li>
/// <li>
/// A DNS request was received
/// </li>
/// <li>
/// A remote IP address attempted to connect to an EC2 instance
/// </li>
/// <li>
/// A remote IP address attempted a port probe on an EC2 instance
/// </li>
/// </ul>
class Action {
  /// The type of action that was detected. The possible action types are:
  ///
  /// <ul>
  /// <li>
  /// <code>NETWORK_CONNECTION</code>
  /// </li>
  /// <li>
  /// <code>AWS_API_CALL</code>
  /// </li>
  /// <li>
  /// <code>DNS_REQUEST</code>
  /// </li>
  /// <li>
  /// <code>PORT_PROBE</code>
  /// </li>
  /// </ul>
  final String? actionType;

  /// Included if <code>ActionType</code> is <code>AWS_API_CALL</code>. Provides
  /// details about the API call that was detected.
  final AwsApiCallAction? awsApiCallAction;

  /// Included if <code>ActionType</code> is <code>DNS_REQUEST</code>. Provides
  /// details about the DNS request that was detected.
  final DnsRequestAction? dnsRequestAction;

  /// Included if <code>ActionType</code> is <code>NETWORK_CONNECTION</code>.
  /// Provides details about the network connection that was detected.
  final NetworkConnectionAction? networkConnectionAction;

  /// Included if <code>ActionType</code> is <code>PORT_PROBE</code>. Provides
  /// details about the port probe that was detected.
  final PortProbeAction? portProbeAction;

  Action({
    this.actionType,
    this.awsApiCallAction,
    this.dnsRequestAction,
    this.networkConnectionAction,
    this.portProbeAction,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      actionType: json['ActionType'] as String?,
      awsApiCallAction: json['AwsApiCallAction'] != null
          ? AwsApiCallAction.fromJson(
              json['AwsApiCallAction'] as Map<String, dynamic>)
          : null,
      dnsRequestAction: json['DnsRequestAction'] != null
          ? DnsRequestAction.fromJson(
              json['DnsRequestAction'] as Map<String, dynamic>)
          : null,
      networkConnectionAction: json['NetworkConnectionAction'] != null
          ? NetworkConnectionAction.fromJson(
              json['NetworkConnectionAction'] as Map<String, dynamic>)
          : null,
      portProbeAction: json['PortProbeAction'] != null
          ? PortProbeAction.fromJson(
              json['PortProbeAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final awsApiCallAction = this.awsApiCallAction;
    final dnsRequestAction = this.dnsRequestAction;
    final networkConnectionAction = this.networkConnectionAction;
    final portProbeAction = this.portProbeAction;
    return {
      if (actionType != null) 'ActionType': actionType,
      if (awsApiCallAction != null) 'AwsApiCallAction': awsApiCallAction,
      if (dnsRequestAction != null) 'DnsRequestAction': dnsRequestAction,
      if (networkConnectionAction != null)
        'NetworkConnectionAction': networkConnectionAction,
      if (portProbeAction != null) 'PortProbeAction': portProbeAction,
    };
  }
}

/// Provides information about the IP address where the scanned port is located.
class ActionLocalIpDetails {
  /// The IP address.
  final String? ipAddressV4;

  ActionLocalIpDetails({
    this.ipAddressV4,
  });

  factory ActionLocalIpDetails.fromJson(Map<String, dynamic> json) {
    return ActionLocalIpDetails(
      ipAddressV4: json['IpAddressV4'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressV4 = this.ipAddressV4;
    return {
      if (ipAddressV4 != null) 'IpAddressV4': ipAddressV4,
    };
  }
}

/// For <code>NetworkConnectionAction</code> and <code>PortProbeDetails</code>,
/// <code>LocalPortDetails</code> provides information about the local port that
/// was involved in the action.
class ActionLocalPortDetails {
  /// The number of the port.
  final int? port;

  /// The port name of the local connection.
  final String? portName;

  ActionLocalPortDetails({
    this.port,
    this.portName,
  });

  factory ActionLocalPortDetails.fromJson(Map<String, dynamic> json) {
    return ActionLocalPortDetails(
      port: json['Port'] as int?,
      portName: json['PortName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final portName = this.portName;
    return {
      if (port != null) 'Port': port,
      if (portName != null) 'PortName': portName,
    };
  }
}

/// For <code>AwsApiAction</code>, <code>NetworkConnectionAction</code>, and
/// <code>PortProbeAction</code>, <code>RemoteIpDetails</code> provides
/// information about the remote IP address that was involved in the action.
class ActionRemoteIpDetails {
  /// The city where the remote IP address is located.
  final City? city;

  /// The country where the remote IP address is located.
  final Country? country;

  /// The coordinates of the location of the remote IP address.
  final GeoLocation? geoLocation;

  /// The IP address.
  final String? ipAddressV4;

  /// The internet service provider (ISP) organization associated with the remote
  /// IP address.
  final IpOrganizationDetails? organization;

  ActionRemoteIpDetails({
    this.city,
    this.country,
    this.geoLocation,
    this.ipAddressV4,
    this.organization,
  });

  factory ActionRemoteIpDetails.fromJson(Map<String, dynamic> json) {
    return ActionRemoteIpDetails(
      city: json['City'] != null
          ? City.fromJson(json['City'] as Map<String, dynamic>)
          : null,
      country: json['Country'] != null
          ? Country.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      geoLocation: json['GeoLocation'] != null
          ? GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>)
          : null,
      ipAddressV4: json['IpAddressV4'] as String?,
      organization: json['Organization'] != null
          ? IpOrganizationDetails.fromJson(
              json['Organization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final geoLocation = this.geoLocation;
    final ipAddressV4 = this.ipAddressV4;
    final organization = this.organization;
    return {
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (geoLocation != null) 'GeoLocation': geoLocation,
      if (ipAddressV4 != null) 'IpAddressV4': ipAddressV4,
      if (organization != null) 'Organization': organization,
    };
  }
}

/// Provides information about the remote port that was involved in an attempted
/// network connection.
class ActionRemotePortDetails {
  /// The number of the port.
  final int? port;

  /// The port name of the remote connection.
  final String? portName;

  ActionRemotePortDetails({
    this.port,
    this.portName,
  });

  factory ActionRemotePortDetails.fromJson(Map<String, dynamic> json) {
    return ActionRemotePortDetails(
      port: json['Port'] as int?,
      portName: json['PortName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final portName = this.portName;
    return {
      if (port != null) 'Port': port,
      if (portName != null) 'PortName': portName,
    };
  }
}

/// An <code>ActionTarget</code> object.
class ActionTarget {
  /// The ARN for the target action.
  final String actionTargetArn;

  /// The description of the target action.
  final String description;

  /// The name of the action target.
  final String name;

  ActionTarget({
    required this.actionTargetArn,
    required this.description,
    required this.name,
  });

  factory ActionTarget.fromJson(Map<String, dynamic> json) {
    return ActionTarget(
      actionTargetArn: json['ActionTargetArn'] as String,
      description: json['Description'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTargetArn = this.actionTargetArn;
    final description = this.description;
    final name = this.name;
    return {
      'ActionTargetArn': actionTargetArn,
      'Description': description,
      'Name': name,
    };
  }
}

/// Represents a Security Hub administrator account designated by an
/// organization management account.
class AdminAccount {
  /// The AWS account identifier of the Security Hub administrator account.
  final String? accountId;

  /// The current status of the Security Hub administrator account. Indicates
  /// whether the account is currently enabled as a Security Hub administrator.
  final AdminStatus? status;

  AdminAccount({
    this.accountId,
    this.status,
  });

  factory AdminAccount.fromJson(Map<String, dynamic> json) {
    return AdminAccount(
      accountId: json['AccountId'] as String?,
      status: (json['Status'] as String?)?.toAdminStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum AdminStatus {
  enabled,
  disableInProgress,
}

extension on AdminStatus {
  String toValue() {
    switch (this) {
      case AdminStatus.enabled:
        return 'ENABLED';
      case AdminStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension on String {
  AdminStatus toAdminStatus() {
    switch (this) {
      case 'ENABLED':
        return AdminStatus.enabled;
      case 'DISABLE_IN_PROGRESS':
        return AdminStatus.disableInProgress;
    }
    throw Exception('$this is not known in enum AdminStatus');
  }
}

/// Information about an Availability Zone.
class AvailabilityZone {
  /// The ID of the subnet. You can specify one subnet per Availability Zone.
  final String? subnetId;

  /// The name of the Availability Zone.
  final String? zoneName;

  AvailabilityZone({
    this.subnetId,
    this.zoneName,
  });

  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      subnetId: json['SubnetId'] as String?,
      zoneName: json['ZoneName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetId = this.subnetId;
    final zoneName = this.zoneName;
    return {
      if (subnetId != null) 'SubnetId': subnetId,
      if (zoneName != null) 'ZoneName': zoneName,
    };
  }
}

/// Provided if <code>ActionType</code> is <code>AWS_API_CALL</code>. It
/// provides details about the API call that was detected.
class AwsApiCallAction {
  /// Identifies the resources that were affected by the API call.
  final Map<String, String>? affectedResources;

  /// The name of the API method that was issued.
  final String? api;

  /// Indicates whether the API call originated from a remote IP address
  /// (<code>remoteip</code>) or from a DNS domain (<code>domain</code>).
  final String? callerType;

  /// Provided if <code>CallerType</code> is <code>domain</code>. Provides
  /// information about the DNS domain that the API call originated from.
  final AwsApiCallActionDomainDetails? domainDetails;

  /// An ISO8601-formatted timestamp that indicates when the API call was first
  /// observed.
  final String? firstSeen;

  /// An ISO8601-formatted timestamp that indicates when the API call was most
  /// recently observed.
  final String? lastSeen;

  /// Provided if <code>CallerType</code> is <code>remoteIp</code>. Provides
  /// information about the remote IP address that the API call originated from.
  final ActionRemoteIpDetails? remoteIpDetails;

  /// The name of the AWS service that the API method belongs to.
  final String? serviceName;

  AwsApiCallAction({
    this.affectedResources,
    this.api,
    this.callerType,
    this.domainDetails,
    this.firstSeen,
    this.lastSeen,
    this.remoteIpDetails,
    this.serviceName,
  });

  factory AwsApiCallAction.fromJson(Map<String, dynamic> json) {
    return AwsApiCallAction(
      affectedResources: (json['AffectedResources'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      api: json['Api'] as String?,
      callerType: json['CallerType'] as String?,
      domainDetails: json['DomainDetails'] != null
          ? AwsApiCallActionDomainDetails.fromJson(
              json['DomainDetails'] as Map<String, dynamic>)
          : null,
      firstSeen: json['FirstSeen'] as String?,
      lastSeen: json['LastSeen'] as String?,
      remoteIpDetails: json['RemoteIpDetails'] != null
          ? ActionRemoteIpDetails.fromJson(
              json['RemoteIpDetails'] as Map<String, dynamic>)
          : null,
      serviceName: json['ServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final affectedResources = this.affectedResources;
    final api = this.api;
    final callerType = this.callerType;
    final domainDetails = this.domainDetails;
    final firstSeen = this.firstSeen;
    final lastSeen = this.lastSeen;
    final remoteIpDetails = this.remoteIpDetails;
    final serviceName = this.serviceName;
    return {
      if (affectedResources != null) 'AffectedResources': affectedResources,
      if (api != null) 'Api': api,
      if (callerType != null) 'CallerType': callerType,
      if (domainDetails != null) 'DomainDetails': domainDetails,
      if (firstSeen != null) 'FirstSeen': firstSeen,
      if (lastSeen != null) 'LastSeen': lastSeen,
      if (remoteIpDetails != null) 'RemoteIpDetails': remoteIpDetails,
      if (serviceName != null) 'ServiceName': serviceName,
    };
  }
}

/// Provided if <code>CallerType</code> is <code>domain</code>. It provides
/// information about the DNS domain that issued the API call.
class AwsApiCallActionDomainDetails {
  /// The name of the DNS domain that issued the API call.
  final String? domain;

  AwsApiCallActionDomainDetails({
    this.domain,
  });

  factory AwsApiCallActionDomainDetails.fromJson(Map<String, dynamic> json) {
    return AwsApiCallActionDomainDetails(
      domain: json['Domain'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'Domain': domain,
    };
  }
}

/// Contains information about settings for logging access for the stage.
class AwsApiGatewayAccessLogSettings {
  /// The ARN of the CloudWatch Logs log group that receives the access logs.
  final String? destinationArn;

  /// A single-line format of the access logs of data, as specified by selected
  /// <code>$context</code> variables. The format must include at least
  /// <code>$context.requestId</code>.
  final String? format;

  AwsApiGatewayAccessLogSettings({
    this.destinationArn,
    this.format,
  });

  factory AwsApiGatewayAccessLogSettings.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayAccessLogSettings(
      destinationArn: json['DestinationArn'] as String?,
      format: json['Format'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationArn = this.destinationArn;
    final format = this.format;
    return {
      if (destinationArn != null) 'DestinationArn': destinationArn,
      if (format != null) 'Format': format,
    };
  }
}

/// Contains information about settings for canary deployment in the stage.
class AwsApiGatewayCanarySettings {
  /// The deployment identifier for the canary deployment.
  final String? deploymentId;

  /// The percentage of traffic that is diverted to a canary deployment.
  final double? percentTraffic;

  /// Stage variables that are overridden in the canary release deployment. The
  /// variables include new stage variables that are introduced in the canary.
  ///
  /// Each variable is represented as a string-to-string map between the stage
  /// variable name and the variable value.
  final Map<String, String>? stageVariableOverrides;

  /// Indicates whether the canary deployment uses the stage cache.
  final bool? useStageCache;

  AwsApiGatewayCanarySettings({
    this.deploymentId,
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });

  factory AwsApiGatewayCanarySettings.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayCanarySettings(
      deploymentId: json['DeploymentId'] as String?,
      percentTraffic: json['PercentTraffic'] as double?,
      stageVariableOverrides:
          (json['StageVariableOverrides'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      useStageCache: json['UseStageCache'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final percentTraffic = this.percentTraffic;
    final stageVariableOverrides = this.stageVariableOverrides;
    final useStageCache = this.useStageCache;
    return {
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (percentTraffic != null) 'PercentTraffic': percentTraffic,
      if (stageVariableOverrides != null)
        'StageVariableOverrides': stageVariableOverrides,
      if (useStageCache != null) 'UseStageCache': useStageCache,
    };
  }
}

/// Contains information about the endpoints for the API.
class AwsApiGatewayEndpointConfiguration {
  /// A list of endpoint types for the REST API.
  ///
  /// For an edge-optimized API, the endpoint type is <code>EDGE</code>. For a
  /// Regional API, the endpoint type is <code>REGIONAL</code>. For a private API,
  /// the endpoint type is <code>PRIVATE</code>.
  final List<String>? types;

  AwsApiGatewayEndpointConfiguration({
    this.types,
  });

  factory AwsApiGatewayEndpointConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AwsApiGatewayEndpointConfiguration(
      types: (json['Types'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final types = this.types;
    return {
      if (types != null) 'Types': types,
    };
  }
}

/// Defines settings for a method for the stage.
class AwsApiGatewayMethodSettings {
  /// Indicates whether the cached responses are encrypted.
  final bool? cacheDataEncrypted;

  /// Specifies the time to live (TTL), in seconds, for cached responses. The
  /// higher the TTL, the longer the response is cached.
  final int? cacheTtlInSeconds;

  /// Indicates whether responses are cached and returned for requests. For
  /// responses to be cached, a cache cluster must be enabled on the stage.
  final bool? cachingEnabled;

  /// Indicates whether data trace logging is enabled for the method. Data trace
  /// logging affects the log entries that are pushed to CloudWatch Logs.
  final bool? dataTraceEnabled;

  /// The HTTP method. You can use an asterisk (*) as a wildcard to apply method
  /// settings to multiple methods.
  final String? httpMethod;

  /// The logging level for this method. The logging level affects the log entries
  /// that are pushed to CloudWatch Logs.
  ///
  /// If the logging level is <code>ERROR</code>, then the logs only include
  /// error-level entries.
  ///
  /// If the logging level is <code>INFO</code>, then the logs include both
  /// <code>ERROR</code> events and extra informational events.
  ///
  /// Valid values: <code>OFF</code> | <code>ERROR</code> | <code>INFO</code>
  final String? loggingLevel;

  /// Indicates whether CloudWatch metrics are enabled for the method.
  final bool? metricsEnabled;

  /// Indicates whether authorization is required for a cache invalidation
  /// request.
  final bool? requireAuthorizationForCacheControl;

  /// The resource path for this method. Forward slashes (/) are encoded as ~1 .
  /// The initial slash must include a forward slash.
  ///
  /// For example, the path value <code>/resource/subresource</code> must be
  /// encoded as <code>/~1resource~1subresource</code>.
  ///
  /// To specify the root path, use only a slash (/). You can use an asterisk (*)
  /// as a wildcard to apply method settings to multiple methods.
  final String? resourcePath;

  /// The throttling burst limit for the method.
  final int? throttlingBurstLimit;

  /// The throttling rate limit for the method.
  final double? throttlingRateLimit;

  /// Indicates how to handle unauthorized requests for cache invalidation.
  ///
  /// Valid values: <code>FAIL_WITH_403</code> |
  /// <code>SUCCEED_WITH_RESPONSE_HEADER</code> |
  /// <code>SUCCEED_WITHOUT_RESPONSE_HEADER</code>
  final String? unauthorizedCacheControlHeaderStrategy;

  AwsApiGatewayMethodSettings({
    this.cacheDataEncrypted,
    this.cacheTtlInSeconds,
    this.cachingEnabled,
    this.dataTraceEnabled,
    this.httpMethod,
    this.loggingLevel,
    this.metricsEnabled,
    this.requireAuthorizationForCacheControl,
    this.resourcePath,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
    this.unauthorizedCacheControlHeaderStrategy,
  });

  factory AwsApiGatewayMethodSettings.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayMethodSettings(
      cacheDataEncrypted: json['CacheDataEncrypted'] as bool?,
      cacheTtlInSeconds: json['CacheTtlInSeconds'] as int?,
      cachingEnabled: json['CachingEnabled'] as bool?,
      dataTraceEnabled: json['DataTraceEnabled'] as bool?,
      httpMethod: json['HttpMethod'] as String?,
      loggingLevel: json['LoggingLevel'] as String?,
      metricsEnabled: json['MetricsEnabled'] as bool?,
      requireAuthorizationForCacheControl:
          json['RequireAuthorizationForCacheControl'] as bool?,
      resourcePath: json['ResourcePath'] as String?,
      throttlingBurstLimit: json['ThrottlingBurstLimit'] as int?,
      throttlingRateLimit: json['ThrottlingRateLimit'] as double?,
      unauthorizedCacheControlHeaderStrategy:
          json['UnauthorizedCacheControlHeaderStrategy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheDataEncrypted = this.cacheDataEncrypted;
    final cacheTtlInSeconds = this.cacheTtlInSeconds;
    final cachingEnabled = this.cachingEnabled;
    final dataTraceEnabled = this.dataTraceEnabled;
    final httpMethod = this.httpMethod;
    final loggingLevel = this.loggingLevel;
    final metricsEnabled = this.metricsEnabled;
    final requireAuthorizationForCacheControl =
        this.requireAuthorizationForCacheControl;
    final resourcePath = this.resourcePath;
    final throttlingBurstLimit = this.throttlingBurstLimit;
    final throttlingRateLimit = this.throttlingRateLimit;
    final unauthorizedCacheControlHeaderStrategy =
        this.unauthorizedCacheControlHeaderStrategy;
    return {
      if (cacheDataEncrypted != null) 'CacheDataEncrypted': cacheDataEncrypted,
      if (cacheTtlInSeconds != null) 'CacheTtlInSeconds': cacheTtlInSeconds,
      if (cachingEnabled != null) 'CachingEnabled': cachingEnabled,
      if (dataTraceEnabled != null) 'DataTraceEnabled': dataTraceEnabled,
      if (httpMethod != null) 'HttpMethod': httpMethod,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (metricsEnabled != null) 'MetricsEnabled': metricsEnabled,
      if (requireAuthorizationForCacheControl != null)
        'RequireAuthorizationForCacheControl':
            requireAuthorizationForCacheControl,
      if (resourcePath != null) 'ResourcePath': resourcePath,
      if (throttlingBurstLimit != null)
        'ThrottlingBurstLimit': throttlingBurstLimit,
      if (throttlingRateLimit != null)
        'ThrottlingRateLimit': throttlingRateLimit,
      if (unauthorizedCacheControlHeaderStrategy != null)
        'UnauthorizedCacheControlHeaderStrategy':
            unauthorizedCacheControlHeaderStrategy,
    };
  }
}

/// Contains information about a REST API in version 1 of Amazon API Gateway.
class AwsApiGatewayRestApiDetails {
  /// The source of the API key for metering requests according to a usage plan.
  ///
  /// <code>HEADER</code> indicates whether to read the API key from the X-API-Key
  /// header of a request.
  ///
  /// <code>AUTHORIZER</code> indicates whether to read the API key from the
  /// <code>UsageIdentifierKey</code> from a custom authorizer.
  final String? apiKeySource;

  /// The list of binary media types supported by the REST API.
  final List<String>? binaryMediaTypes;

  /// Indicates when the API was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdDate;

  /// A description of the REST API.
  final String? description;

  /// The endpoint configuration of the REST API.
  final AwsApiGatewayEndpointConfiguration? endpointConfiguration;

  /// The identifier of the REST API.
  final String? id;

  /// The minimum size in bytes of a payload before compression is enabled.
  ///
  /// If <code>null</code>, then compression is disabled.
  ///
  /// If 0, then all payloads are compressed.
  final int? minimumCompressionSize;

  /// The name of the REST API.
  final String? name;

  /// The version identifier for the REST API.
  final String? version;

  AwsApiGatewayRestApiDetails({
    this.apiKeySource,
    this.binaryMediaTypes,
    this.createdDate,
    this.description,
    this.endpointConfiguration,
    this.id,
    this.minimumCompressionSize,
    this.name,
    this.version,
  });

  factory AwsApiGatewayRestApiDetails.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayRestApiDetails(
      apiKeySource: json['ApiKeySource'] as String?,
      binaryMediaTypes: (json['BinaryMediaTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      endpointConfiguration: json['EndpointConfiguration'] != null
          ? AwsApiGatewayEndpointConfiguration.fromJson(
              json['EndpointConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      minimumCompressionSize: json['MinimumCompressionSize'] as int?,
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKeySource = this.apiKeySource;
    final binaryMediaTypes = this.binaryMediaTypes;
    final createdDate = this.createdDate;
    final description = this.description;
    final endpointConfiguration = this.endpointConfiguration;
    final id = this.id;
    final minimumCompressionSize = this.minimumCompressionSize;
    final name = this.name;
    final version = this.version;
    return {
      if (apiKeySource != null) 'ApiKeySource': apiKeySource,
      if (binaryMediaTypes != null) 'BinaryMediaTypes': binaryMediaTypes,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (endpointConfiguration != null)
        'EndpointConfiguration': endpointConfiguration,
      if (id != null) 'Id': id,
      if (minimumCompressionSize != null)
        'MinimumCompressionSize': minimumCompressionSize,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// Provides information about a version 1 Amazon API Gateway stage.
class AwsApiGatewayStageDetails {
  /// Settings for logging access for the stage.
  final AwsApiGatewayAccessLogSettings? accessLogSettings;

  /// Indicates whether a cache cluster is enabled for the stage.
  final bool? cacheClusterEnabled;

  /// If a cache cluster is enabled, the size of the cache cluster.
  final String? cacheClusterSize;

  /// If a cache cluster is enabled, the status of the cache cluster.
  final String? cacheClusterStatus;

  /// Information about settings for canary deployment in the stage.
  final AwsApiGatewayCanarySettings? canarySettings;

  /// The identifier of the client certificate for the stage.
  final String? clientCertificateId;

  /// Indicates when the stage was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdDate;

  /// The identifier of the deployment that the stage points to.
  final String? deploymentId;

  /// A description of the stage.
  final String? description;

  /// The version of the API documentation that is associated with the stage.
  final String? documentationVersion;

  /// Indicates when the stage was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastUpdatedDate;

  /// Defines the method settings for the stage.
  final List<AwsApiGatewayMethodSettings>? methodSettings;

  /// The name of the stage.
  final String? stageName;

  /// Indicates whether active tracing with AWS X-Ray is enabled for the stage.
  final bool? tracingEnabled;

  /// A map that defines the stage variables for the stage.
  ///
  /// Variable names can have alphanumeric and underscore characters.
  ///
  /// Variable values can contain the following characters:
  ///
  /// <ul>
  /// <li>
  /// Uppercase and lowercase letters
  /// </li>
  /// <li>
  /// Numbers
  /// </li>
  /// <li>
  /// Special characters -._~:/?#&amp;=,
  /// </li>
  /// </ul>
  final Map<String, String>? variables;

  /// The ARN of the web ACL associated with the stage.
  final String? webAclArn;

  AwsApiGatewayStageDetails({
    this.accessLogSettings,
    this.cacheClusterEnabled,
    this.cacheClusterSize,
    this.cacheClusterStatus,
    this.canarySettings,
    this.clientCertificateId,
    this.createdDate,
    this.deploymentId,
    this.description,
    this.documentationVersion,
    this.lastUpdatedDate,
    this.methodSettings,
    this.stageName,
    this.tracingEnabled,
    this.variables,
    this.webAclArn,
  });

  factory AwsApiGatewayStageDetails.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayStageDetails(
      accessLogSettings: json['AccessLogSettings'] != null
          ? AwsApiGatewayAccessLogSettings.fromJson(
              json['AccessLogSettings'] as Map<String, dynamic>)
          : null,
      cacheClusterEnabled: json['CacheClusterEnabled'] as bool?,
      cacheClusterSize: json['CacheClusterSize'] as String?,
      cacheClusterStatus: json['CacheClusterStatus'] as String?,
      canarySettings: json['CanarySettings'] != null
          ? AwsApiGatewayCanarySettings.fromJson(
              json['CanarySettings'] as Map<String, dynamic>)
          : null,
      clientCertificateId: json['ClientCertificateId'] as String?,
      createdDate: json['CreatedDate'] as String?,
      deploymentId: json['DeploymentId'] as String?,
      description: json['Description'] as String?,
      documentationVersion: json['DocumentationVersion'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      methodSettings: (json['MethodSettings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsApiGatewayMethodSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
      stageName: json['StageName'] as String?,
      tracingEnabled: json['TracingEnabled'] as bool?,
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      webAclArn: json['WebAclArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogSettings = this.accessLogSettings;
    final cacheClusterEnabled = this.cacheClusterEnabled;
    final cacheClusterSize = this.cacheClusterSize;
    final cacheClusterStatus = this.cacheClusterStatus;
    final canarySettings = this.canarySettings;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final documentationVersion = this.documentationVersion;
    final lastUpdatedDate = this.lastUpdatedDate;
    final methodSettings = this.methodSettings;
    final stageName = this.stageName;
    final tracingEnabled = this.tracingEnabled;
    final variables = this.variables;
    final webAclArn = this.webAclArn;
    return {
      if (accessLogSettings != null) 'AccessLogSettings': accessLogSettings,
      if (cacheClusterEnabled != null)
        'CacheClusterEnabled': cacheClusterEnabled,
      if (cacheClusterSize != null) 'CacheClusterSize': cacheClusterSize,
      if (cacheClusterStatus != null) 'CacheClusterStatus': cacheClusterStatus,
      if (canarySettings != null) 'CanarySettings': canarySettings,
      if (clientCertificateId != null)
        'ClientCertificateId': clientCertificateId,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (description != null) 'Description': description,
      if (documentationVersion != null)
        'DocumentationVersion': documentationVersion,
      if (lastUpdatedDate != null) 'LastUpdatedDate': lastUpdatedDate,
      if (methodSettings != null) 'MethodSettings': methodSettings,
      if (stageName != null) 'StageName': stageName,
      if (tracingEnabled != null) 'TracingEnabled': tracingEnabled,
      if (variables != null) 'Variables': variables,
      if (webAclArn != null) 'WebAclArn': webAclArn,
    };
  }
}

/// Contains information about a version 2 API in Amazon API Gateway.
class AwsApiGatewayV2ApiDetails {
  /// The URI of the API.
  ///
  /// Uses the format <code>
  /// <i>&lt;api-id&gt;</i>.execute-api.<i>&lt;region&gt;</i>.amazonaws.com</code>
  ///
  /// The stage name is typically appended to the URI to form a complete path to a
  /// deployed API stage.
  final String? apiEndpoint;

  /// The identifier of the API.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs.
  final String? apiKeySelectionExpression;

  /// A cross-origin resource sharing (CORS) configuration. Supported only for
  /// HTTP APIs.
  final AwsCorsConfiguration? corsConfiguration;

  /// Indicates when the API was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdDate;

  /// A description of the API.
  final String? description;

  /// The name of the API.
  final String? name;

  /// The API protocol for the API.
  ///
  /// Valid values: <code>WEBSOCKET</code> | <code>HTTP</code>
  final String? protocolType;

  /// The route selection expression for the API.
  ///
  /// For HTTP APIs, must be <code>${request.method} ${request.path}</code>. This
  /// is the default value for HTTP APIs.
  ///
  /// For WebSocket APIs, there is no default value.
  final String? routeSelectionExpression;

  /// The version identifier for the API.
  final String? version;

  AwsApiGatewayV2ApiDetails({
    this.apiEndpoint,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.version,
  });

  factory AwsApiGatewayV2ApiDetails.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayV2ApiDetails(
      apiEndpoint: json['ApiEndpoint'] as String?,
      apiId: json['ApiId'] as String?,
      apiKeySelectionExpression: json['ApiKeySelectionExpression'] as String?,
      corsConfiguration: json['CorsConfiguration'] != null
          ? AwsCorsConfiguration.fromJson(
              json['CorsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      protocolType: json['ProtocolType'] as String?,
      routeSelectionExpression: json['RouteSelectionExpression'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final version = this.version;
    return {
      if (apiEndpoint != null) 'ApiEndpoint': apiEndpoint,
      if (apiId != null) 'ApiId': apiId,
      if (apiKeySelectionExpression != null)
        'ApiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'CorsConfiguration': corsConfiguration,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (protocolType != null) 'ProtocolType': protocolType,
      if (routeSelectionExpression != null)
        'RouteSelectionExpression': routeSelectionExpression,
      if (version != null) 'Version': version,
    };
  }
}

/// Contains route settings for a stage.
class AwsApiGatewayV2RouteSettings {
  /// Indicates whether data trace logging is enabled. Data trace logging affects
  /// the log entries that are pushed to CloudWatch Logs. Supported only for
  /// WebSocket APIs.
  final bool? dataTraceEnabled;

  /// Indicates whether detailed metrics are enabled.
  final bool? detailedMetricsEnabled;

  /// The logging level. The logging level affects the log entries that are pushed
  /// to CloudWatch Logs. Supported only for WebSocket APIs.
  ///
  /// If the logging level is <code>ERROR</code>, then the logs only include
  /// error-level entries.
  ///
  /// If the logging level is <code>INFO</code>, then the logs include both
  /// <code>ERROR</code> events and extra informational events.
  ///
  /// Valid values: <code>OFF</code> | <code>ERROR</code> | <code>INFO</code>
  final String? loggingLevel;

  /// The throttling burst limit.
  final int? throttlingBurstLimit;

  /// The throttling rate limit.
  final double? throttlingRateLimit;

  AwsApiGatewayV2RouteSettings({
    this.dataTraceEnabled,
    this.detailedMetricsEnabled,
    this.loggingLevel,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
  });

  factory AwsApiGatewayV2RouteSettings.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayV2RouteSettings(
      dataTraceEnabled: json['DataTraceEnabled'] as bool?,
      detailedMetricsEnabled: json['DetailedMetricsEnabled'] as bool?,
      loggingLevel: json['LoggingLevel'] as String?,
      throttlingBurstLimit: json['ThrottlingBurstLimit'] as int?,
      throttlingRateLimit: json['ThrottlingRateLimit'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataTraceEnabled = this.dataTraceEnabled;
    final detailedMetricsEnabled = this.detailedMetricsEnabled;
    final loggingLevel = this.loggingLevel;
    final throttlingBurstLimit = this.throttlingBurstLimit;
    final throttlingRateLimit = this.throttlingRateLimit;
    return {
      if (dataTraceEnabled != null) 'DataTraceEnabled': dataTraceEnabled,
      if (detailedMetricsEnabled != null)
        'DetailedMetricsEnabled': detailedMetricsEnabled,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (throttlingBurstLimit != null)
        'ThrottlingBurstLimit': throttlingBurstLimit,
      if (throttlingRateLimit != null)
        'ThrottlingRateLimit': throttlingRateLimit,
    };
  }
}

/// Contains information about a version 2 stage for Amazon API Gateway.
class AwsApiGatewayV2StageDetails {
  /// Information about settings for logging access for the stage.
  final AwsApiGatewayAccessLogSettings? accessLogSettings;

  /// Indicates whether the stage is managed by API Gateway.
  final bool? apiGatewayManaged;

  /// Indicates whether updates to an API automatically trigger a new deployment.
  final bool? autoDeploy;

  /// The identifier of a client certificate for a stage. Supported only for
  /// WebSocket API calls.
  final String? clientCertificateId;

  /// Indicates when the stage was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdDate;

  /// Default route settings for the stage.
  final AwsApiGatewayV2RouteSettings? defaultRouteSettings;

  /// The identifier of the deployment that the stage is associated with.
  final String? deploymentId;

  /// The description of the stage.
  final String? description;

  /// The status of the last deployment of a stage. Supported only if the stage
  /// has automatic deployment enabled.
  final String? lastDeploymentStatusMessage;

  /// Indicates when the stage was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastUpdatedDate;

  /// The route settings for the stage.
  final AwsApiGatewayV2RouteSettings? routeSettings;

  /// The name of the stage.
  final String? stageName;

  /// A map that defines the stage variables for the stage.
  ///
  /// Variable names can have alphanumeric and underscore characters.
  ///
  /// Variable values can contain the following characters:
  ///
  /// <ul>
  /// <li>
  /// Uppercase and lowercase letters
  /// </li>
  /// <li>
  /// Numbers
  /// </li>
  /// <li>
  /// Special characters -._~:/?#&amp;=,
  /// </li>
  /// </ul>
  final Map<String, String>? stageVariables;

  AwsApiGatewayV2StageDetails({
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastDeploymentStatusMessage,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
  });

  factory AwsApiGatewayV2StageDetails.fromJson(Map<String, dynamic> json) {
    return AwsApiGatewayV2StageDetails(
      accessLogSettings: json['AccessLogSettings'] != null
          ? AwsApiGatewayAccessLogSettings.fromJson(
              json['AccessLogSettings'] as Map<String, dynamic>)
          : null,
      apiGatewayManaged: json['ApiGatewayManaged'] as bool?,
      autoDeploy: json['AutoDeploy'] as bool?,
      clientCertificateId: json['ClientCertificateId'] as String?,
      createdDate: json['CreatedDate'] as String?,
      defaultRouteSettings: json['DefaultRouteSettings'] != null
          ? AwsApiGatewayV2RouteSettings.fromJson(
              json['DefaultRouteSettings'] as Map<String, dynamic>)
          : null,
      deploymentId: json['DeploymentId'] as String?,
      description: json['Description'] as String?,
      lastDeploymentStatusMessage:
          json['LastDeploymentStatusMessage'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      routeSettings: json['RouteSettings'] != null
          ? AwsApiGatewayV2RouteSettings.fromJson(
              json['RouteSettings'] as Map<String, dynamic>)
          : null,
      stageName: json['StageName'] as String?,
      stageVariables: (json['StageVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogSettings = this.accessLogSettings;
    final apiGatewayManaged = this.apiGatewayManaged;
    final autoDeploy = this.autoDeploy;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final defaultRouteSettings = this.defaultRouteSettings;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final lastDeploymentStatusMessage = this.lastDeploymentStatusMessage;
    final lastUpdatedDate = this.lastUpdatedDate;
    final routeSettings = this.routeSettings;
    final stageName = this.stageName;
    final stageVariables = this.stageVariables;
    return {
      if (accessLogSettings != null) 'AccessLogSettings': accessLogSettings,
      if (apiGatewayManaged != null) 'ApiGatewayManaged': apiGatewayManaged,
      if (autoDeploy != null) 'AutoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'ClientCertificateId': clientCertificateId,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (defaultRouteSettings != null)
        'DefaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (description != null) 'Description': description,
      if (lastDeploymentStatusMessage != null)
        'LastDeploymentStatusMessage': lastDeploymentStatusMessage,
      if (lastUpdatedDate != null) 'LastUpdatedDate': lastUpdatedDate,
      if (routeSettings != null) 'RouteSettings': routeSettings,
      if (stageName != null) 'StageName': stageName,
      if (stageVariables != null) 'StageVariables': stageVariables,
    };
  }
}

/// Provides details about an auto scaling group.
class AwsAutoScalingAutoScalingGroupDetails {
  /// Indicates when the auto scaling group was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdTime;

  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before it
  /// checks the health status of an EC2 instance that has come into service.
  final int? healthCheckGracePeriod;

  /// The service to use for the health checks.
  final String? healthCheckType;

  /// The name of the launch configuration.
  final String? launchConfigurationName;

  /// The list of load balancers associated with the group.
  final List<String>? loadBalancerNames;

  AwsAutoScalingAutoScalingGroupDetails({
    this.createdTime,
    this.healthCheckGracePeriod,
    this.healthCheckType,
    this.launchConfigurationName,
    this.loadBalancerNames,
  });

  factory AwsAutoScalingAutoScalingGroupDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsAutoScalingAutoScalingGroupDetails(
      createdTime: json['CreatedTime'] as String?,
      healthCheckGracePeriod: json['HealthCheckGracePeriod'] as int?,
      healthCheckType: json['HealthCheckType'] as String?,
      launchConfigurationName: json['LaunchConfigurationName'] as String?,
      loadBalancerNames: (json['LoadBalancerNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final healthCheckGracePeriod = this.healthCheckGracePeriod;
    final healthCheckType = this.healthCheckType;
    final launchConfigurationName = this.launchConfigurationName;
    final loadBalancerNames = this.loadBalancerNames;
    return {
      if (createdTime != null) 'CreatedTime': createdTime,
      if (healthCheckGracePeriod != null)
        'HealthCheckGracePeriod': healthCheckGracePeriod,
      if (healthCheckType != null) 'HealthCheckType': healthCheckType,
      if (launchConfigurationName != null)
        'LaunchConfigurationName': launchConfigurationName,
      if (loadBalancerNames != null) 'LoadBalancerNames': loadBalancerNames,
    };
  }
}

/// Provides details about an AWS Certificate Manager certificate.
class AwsCertificateManagerCertificateDetails {
  /// The ARN of the private certificate authority (CA) that will be used to issue
  /// the certificate.
  final String? certificateAuthorityArn;

  /// Indicates when the certificate was requested.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdAt;

  /// The fully qualified domain name (FQDN), such as www.example.com, that is
  /// secured by the certificate.
  final String? domainName;

  /// Contains information about the initial validation of each domain name that
  /// occurs as a result of the <code>RequestCertificate</code> request.
  ///
  /// Only provided if the certificate type is <code>AMAZON_ISSUED</code>.
  final List<AwsCertificateManagerCertificateDomainValidationOption>?
      domainValidationOptions;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  final List<AwsCertificateManagerCertificateExtendedKeyUsage>?
      extendedKeyUsages;

  /// For a failed certificate request, the reason for the failure.
  ///
  /// Valid values: <code>NO_AVAILABLE_CONTACTS</code> |
  /// <code>ADDITIONAL_VERIFICATION_REQUIRED</code> |
  /// <code>DOMAIN_NOT_ALLOWED</code> | <code>INVALID_PUBLIC_DOMAIN</code> |
  /// <code>DOMAIN_VALIDATION_DENIED</code> | <code>CAA_ERROR</code> |
  /// <code>PCA_LIMIT_EXCEEDED</code> | <code>PCA_INVALID_ARN</code> |
  /// <code>PCA_INVALID_STATE</code> | <code>PCA_REQUEST_FAILED</code> |
  /// <code>PCA_NAME_CONSTRAINTS_VALIDATION</code> |
  /// <code>PCA_RESOURCE_NOT_FOUND</code> | <code>PCA_INVALID_ARGS</code> |
  /// <code>PCA_INVALID_DURATION</code> | <code>PCA_ACCESS_DENIED</code> |
  /// <code>SLR_NOT_FOUND</code> | <code>OTHER</code>
  final String? failureReason;

  /// Indicates when the certificate was imported. Provided if the certificate
  /// type is <code>IMPORTED</code>.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? importedAt;

  /// The list of ARNs for the AWS resources that use the certificate.
  final List<String>? inUseBy;

  /// Indicates when the certificate was issued. Provided if the certificate type
  /// is <code>AMAZON_ISSUED</code>.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? issuedAt;

  /// The name of the certificate authority that issued and signed the
  /// certificate.
  final String? issuer;

  /// The algorithm that was used to generate the public-private key pair.
  ///
  /// Valid values: <code>RSA_2048</code> | <code>RSA_1024</code> |<code>
  /// RSA_4096</code> | <code>EC_prime256v1</code> | <code>EC_secp384r1</code> |
  /// <code>EC_secp521r1</code>
  final String? keyAlgorithm;

  /// A list of key usage X.509 v3 extension objects.
  final List<AwsCertificateManagerCertificateKeyUsage>? keyUsages;

  /// The time after which the certificate becomes invalid.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? notAfter;

  /// The time before which the certificate is not valid.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? notBefore;

  /// Provides a value that specifies whether to add the certificate to a
  /// transparency log.
  final AwsCertificateManagerCertificateOptions? options;

  /// Whether the certificate is eligible for renewal.
  ///
  /// Valid values: <code>ELIGIBLE</code> | <code>INELIGIBLE</code>
  final String? renewalEligibility;

  /// Information about the status of the AWS Certificate Manager managed renewal
  /// for the certificate. Provided only when the certificate type is
  /// <code>AMAZON_ISSUED</code>.
  final AwsCertificateManagerCertificateRenewalSummary? renewalSummary;

  /// The serial number of the certificate.
  final String? serial;

  /// The algorithm that was used to sign the certificate.
  final String? signatureAlgorithm;

  /// The status of the certificate.
  ///
  /// Valid values: <code>PENDING_VALIDATION</code> | <code>ISSUED</code> |
  /// <code>INACTIVE</code> | <code>EXPIRED</code> |
  /// <code>VALIDATION_TIMED_OUT</code> | <code>REVOKED</code> |
  /// <code>FAILED</code>
  final String? status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  final String? subject;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate.
  ///
  /// The subject alternative names include the canonical domain name (CN) of the
  /// certificate and additional domain names that can be used to connect to the
  /// website.
  final List<String>? subjectAlternativeNames;

  /// The source of the certificate. For certificates that AWS Certificate Manager
  /// provides, <code>Type</code> is <code>AMAZON_ISSUED</code>. For certificates
  /// that are imported with <code>ImportCertificate</code>, <code>Type</code> is
  /// <code>IMPORTED</code>.
  ///
  /// Valid values: <code>IMPORTED</code> | <code>AMAZON_ISSUED</code> |
  /// <code>PRIVATE</code>
  final String? type;

  AwsCertificateManagerCertificateDetails({
    this.certificateAuthorityArn,
    this.createdAt,
    this.domainName,
    this.domainValidationOptions,
    this.extendedKeyUsages,
    this.failureReason,
    this.importedAt,
    this.inUseBy,
    this.issuedAt,
    this.issuer,
    this.keyAlgorithm,
    this.keyUsages,
    this.notAfter,
    this.notBefore,
    this.options,
    this.renewalEligibility,
    this.renewalSummary,
    this.serial,
    this.signatureAlgorithm,
    this.status,
    this.subject,
    this.subjectAlternativeNames,
    this.type,
  });

  factory AwsCertificateManagerCertificateDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateDetails(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      createdAt: json['CreatedAt'] as String?,
      domainName: json['DomainName'] as String?,
      domainValidationOptions: (json['DomainValidationOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsCertificateManagerCertificateDomainValidationOption.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => AwsCertificateManagerCertificateExtendedKeyUsage.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureReason: json['FailureReason'] as String?,
      importedAt: json['ImportedAt'] as String?,
      inUseBy: (json['InUseBy'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      issuedAt: json['IssuedAt'] as String?,
      issuer: json['Issuer'] as String?,
      keyAlgorithm: json['KeyAlgorithm'] as String?,
      keyUsages: (json['KeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => AwsCertificateManagerCertificateKeyUsage.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      notAfter: json['NotAfter'] as String?,
      notBefore: json['NotBefore'] as String?,
      options: json['Options'] != null
          ? AwsCertificateManagerCertificateOptions.fromJson(
              json['Options'] as Map<String, dynamic>)
          : null,
      renewalEligibility: json['RenewalEligibility'] as String?,
      renewalSummary: json['RenewalSummary'] != null
          ? AwsCertificateManagerCertificateRenewalSummary.fromJson(
              json['RenewalSummary'] as Map<String, dynamic>)
          : null,
      serial: json['Serial'] as String?,
      signatureAlgorithm: json['SignatureAlgorithm'] as String?,
      status: json['Status'] as String?,
      subject: json['Subject'] as String?,
      subjectAlternativeNames: (json['SubjectAlternativeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final domainValidationOptions = this.domainValidationOptions;
    final extendedKeyUsages = this.extendedKeyUsages;
    final failureReason = this.failureReason;
    final importedAt = this.importedAt;
    final inUseBy = this.inUseBy;
    final issuedAt = this.issuedAt;
    final issuer = this.issuer;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsages = this.keyUsages;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final options = this.options;
    final renewalEligibility = this.renewalEligibility;
    final renewalSummary = this.renewalSummary;
    final serial = this.serial;
    final signatureAlgorithm = this.signatureAlgorithm;
    final status = this.status;
    final subject = this.subject;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    final type = this.type;
    return {
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (domainName != null) 'DomainName': domainName,
      if (domainValidationOptions != null)
        'DomainValidationOptions': domainValidationOptions,
      if (extendedKeyUsages != null) 'ExtendedKeyUsages': extendedKeyUsages,
      if (failureReason != null) 'FailureReason': failureReason,
      if (importedAt != null) 'ImportedAt': importedAt,
      if (inUseBy != null) 'InUseBy': inUseBy,
      if (issuedAt != null) 'IssuedAt': issuedAt,
      if (issuer != null) 'Issuer': issuer,
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm,
      if (keyUsages != null) 'KeyUsages': keyUsages,
      if (notAfter != null) 'NotAfter': notAfter,
      if (notBefore != null) 'NotBefore': notBefore,
      if (options != null) 'Options': options,
      if (renewalEligibility != null) 'RenewalEligibility': renewalEligibility,
      if (renewalSummary != null) 'RenewalSummary': renewalSummary,
      if (serial != null) 'Serial': serial,
      if (signatureAlgorithm != null) 'SignatureAlgorithm': signatureAlgorithm,
      if (status != null) 'Status': status,
      if (subject != null) 'Subject': subject,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
      if (type != null) 'Type': type,
    };
  }
}

/// Contains information about one of the following:
///
/// <ul>
/// <li>
/// The initial validation of each domain name that occurs as a result of the
/// <code>RequestCertificate</code> request
/// </li>
/// <li>
/// The validation of each domain name in the certificate, as it pertains to AWS
/// Certificate Manager managed renewal
/// </li>
/// </ul>
class AwsCertificateManagerCertificateDomainValidationOption {
  /// A fully qualified domain name (FQDN) in the certificate.
  final String? domainName;

  /// The CNAME record that is added to the DNS database for domain validation.
  final AwsCertificateManagerCertificateResourceRecord? resourceRecord;

  /// The domain name that AWS Certificate Manager uses to send domain validation
  /// emails.
  final String? validationDomain;

  /// A list of email addresses that AWS Certificate Manager uses to send domain
  /// validation emails.
  final List<String>? validationEmails;

  /// The method used to validate the domain name.
  final String? validationMethod;

  /// The validation status of the domain name.
  final String? validationStatus;

  AwsCertificateManagerCertificateDomainValidationOption({
    this.domainName,
    this.resourceRecord,
    this.validationDomain,
    this.validationEmails,
    this.validationMethod,
    this.validationStatus,
  });

  factory AwsCertificateManagerCertificateDomainValidationOption.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateDomainValidationOption(
      domainName: json['DomainName'] as String?,
      resourceRecord: json['ResourceRecord'] != null
          ? AwsCertificateManagerCertificateResourceRecord.fromJson(
              json['ResourceRecord'] as Map<String, dynamic>)
          : null,
      validationDomain: json['ValidationDomain'] as String?,
      validationEmails: (json['ValidationEmails'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      validationMethod: json['ValidationMethod'] as String?,
      validationStatus: json['ValidationStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final resourceRecord = this.resourceRecord;
    final validationDomain = this.validationDomain;
    final validationEmails = this.validationEmails;
    final validationMethod = this.validationMethod;
    final validationStatus = this.validationStatus;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (resourceRecord != null) 'ResourceRecord': resourceRecord,
      if (validationDomain != null) 'ValidationDomain': validationDomain,
      if (validationEmails != null) 'ValidationEmails': validationEmails,
      if (validationMethod != null) 'ValidationMethod': validationMethod,
      if (validationStatus != null) 'ValidationStatus': validationStatus,
    };
  }
}

/// Contains information about an extended key usage X.509 v3 extension object.
class AwsCertificateManagerCertificateExtendedKeyUsage {
  /// The name of an extension value. Indicates the purpose for which the
  /// certificate public key can be used.
  final String? name;

  /// An object identifier (OID) for the extension value.
  ///
  /// The format is numbers separated by periods.
  final String? oId;

  AwsCertificateManagerCertificateExtendedKeyUsage({
    this.name,
    this.oId,
  });

  factory AwsCertificateManagerCertificateExtendedKeyUsage.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateExtendedKeyUsage(
      name: json['Name'] as String?,
      oId: json['OId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final oId = this.oId;
    return {
      if (name != null) 'Name': name,
      if (oId != null) 'OId': oId,
    };
  }
}

/// Contains information about a key usage X.509 v3 extension object.
class AwsCertificateManagerCertificateKeyUsage {
  /// The key usage extension name.
  final String? name;

  AwsCertificateManagerCertificateKeyUsage({
    this.name,
  });

  factory AwsCertificateManagerCertificateKeyUsage.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateKeyUsage(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Contains other options for the certificate.
class AwsCertificateManagerCertificateOptions {
  /// Whether to add the certificate to a transparency log.
  ///
  /// Valid values: <code>DISABLED</code> | <code>ENABLED</code>
  final String? certificateTransparencyLoggingPreference;

  AwsCertificateManagerCertificateOptions({
    this.certificateTransparencyLoggingPreference,
  });

  factory AwsCertificateManagerCertificateOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateOptions(
      certificateTransparencyLoggingPreference:
          json['CertificateTransparencyLoggingPreference'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateTransparencyLoggingPreference =
        this.certificateTransparencyLoggingPreference;
    return {
      if (certificateTransparencyLoggingPreference != null)
        'CertificateTransparencyLoggingPreference':
            certificateTransparencyLoggingPreference,
    };
  }
}

/// Contains information about the AWS Certificate Manager managed renewal for
/// an <code>AMAZON_ISSUED</code> certificate.
class AwsCertificateManagerCertificateRenewalSummary {
  /// Information about the validation of each domain name in the certificate, as
  /// it pertains to AWS Certificate Manager managed renewal. Provided only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  final List<AwsCertificateManagerCertificateDomainValidationOption>?
      domainValidationOptions;

  /// The status of the AWS Certificate Manager managed renewal of the
  /// certificate.
  ///
  /// Valid values: <code>PENDING_AUTO_RENEWAL</code> |
  /// <code>PENDING_VALIDATION</code> | <code>SUCCESS</code> | <code>FAILED</code>
  final String? renewalStatus;

  /// The reason that a renewal request was unsuccessful.
  ///
  /// Valid values: <code>NO_AVAILABLE_CONTACTS</code> |
  /// <code>ADDITIONAL_VERIFICATION_REQUIRED</code> |
  /// <code>DOMAIN_NOT_ALLOWED</code> | <code>INVALID_PUBLIC_DOMAIN</code> |
  /// <code>DOMAIN_VALIDATION_DENIED</code> | <code>CAA_ERROR</code> |
  /// <code>PCA_LIMIT_EXCEEDED</code> | <code>PCA_INVALID_ARN</code> |
  /// <code>PCA_INVALID_STATE</code> | <code>PCA_REQUEST_FAILED</code> |
  /// <code>PCA_NAME_CONSTRAINTS_VALIDATION</code> |
  /// <code>PCA_RESOURCE_NOT_FOUND</code> | <code>PCA_INVALID_ARGS</code> |
  /// <code>PCA_INVALID_DURATION</code> | <code>PCA_ACCESS_DENIED</code> |
  /// <code>SLR_NOT_FOUND</code> | <code>OTHER</code>
  final String? renewalStatusReason;

  /// Indicates when the renewal summary was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? updatedAt;

  AwsCertificateManagerCertificateRenewalSummary({
    this.domainValidationOptions,
    this.renewalStatus,
    this.renewalStatusReason,
    this.updatedAt,
  });

  factory AwsCertificateManagerCertificateRenewalSummary.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateRenewalSummary(
      domainValidationOptions: (json['DomainValidationOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsCertificateManagerCertificateDomainValidationOption.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      renewalStatus: json['RenewalStatus'] as String?,
      renewalStatusReason: json['RenewalStatusReason'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainValidationOptions = this.domainValidationOptions;
    final renewalStatus = this.renewalStatus;
    final renewalStatusReason = this.renewalStatusReason;
    final updatedAt = this.updatedAt;
    return {
      if (domainValidationOptions != null)
        'DomainValidationOptions': domainValidationOptions,
      if (renewalStatus != null) 'RenewalStatus': renewalStatus,
      if (renewalStatusReason != null)
        'RenewalStatusReason': renewalStatusReason,
      if (updatedAt != null) 'UpdatedAt': updatedAt,
    };
  }
}

/// Provides details about the CNAME record that is added to the DNS database
/// for domain validation.
class AwsCertificateManagerCertificateResourceRecord {
  /// The name of the resource.
  final String? name;

  /// The type of resource.
  final String? type;

  /// The value of the resource.
  final String? value;

  AwsCertificateManagerCertificateResourceRecord({
    this.name,
    this.type,
    this.value,
  });

  factory AwsCertificateManagerCertificateResourceRecord.fromJson(
      Map<String, dynamic> json) {
    return AwsCertificateManagerCertificateResourceRecord(
      name: json['Name'] as String?,
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about a cache behavior for the distribution.
class AwsCloudFrontDistributionCacheBehavior {
  /// The protocol that viewers can use to access the files in an origin. You can
  /// specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>allow-all</code> - Viewers can use HTTP or HTTPS.
  /// </li>
  /// <li>
  /// <code>redirect-to-https</code> - CloudFront responds to HTTP requests with
  /// an HTTP status code of 301 (Moved Permanently) and the HTTPS URL. The viewer
  /// then uses the new URL to resubmit.
  /// </li>
  /// <li>
  /// <code>https-only</code> - CloudFront responds to HTTP request with an HTTP
  /// status code of 403 (Forbidden).
  /// </li>
  /// </ul>
  final String? viewerProtocolPolicy;

  AwsCloudFrontDistributionCacheBehavior({
    this.viewerProtocolPolicy,
  });

  factory AwsCloudFrontDistributionCacheBehavior.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionCacheBehavior(
      viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    return {
      if (viewerProtocolPolicy != null)
        'ViewerProtocolPolicy': viewerProtocolPolicy,
    };
  }
}

/// Provides information about caching for the distribution.
class AwsCloudFrontDistributionCacheBehaviors {
  /// The cache behaviors for the distribution.
  final List<AwsCloudFrontDistributionCacheBehavior>? items;

  AwsCloudFrontDistributionCacheBehaviors({
    this.items,
  });

  factory AwsCloudFrontDistributionCacheBehaviors.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionCacheBehaviors(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => AwsCloudFrontDistributionCacheBehavior.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      if (items != null) 'Items': items,
    };
  }
}

/// Contains information about the default cache configuration for the
/// distribution.
class AwsCloudFrontDistributionDefaultCacheBehavior {
  /// The protocol that viewers can use to access the files in an origin. You can
  /// specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>allow-all</code> - Viewers can use HTTP or HTTPS.
  /// </li>
  /// <li>
  /// <code>redirect-to-https</code> - CloudFront responds to HTTP requests with
  /// an HTTP status code of 301 (Moved Permanently) and the HTTPS URL. The viewer
  /// then uses the new URL to resubmit.
  /// </li>
  /// <li>
  /// <code>https-only</code> - CloudFront responds to HTTP request with an HTTP
  /// status code of 403 (Forbidden).
  /// </li>
  /// </ul>
  final String? viewerProtocolPolicy;

  AwsCloudFrontDistributionDefaultCacheBehavior({
    this.viewerProtocolPolicy,
  });

  factory AwsCloudFrontDistributionDefaultCacheBehavior.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionDefaultCacheBehavior(
      viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    return {
      if (viewerProtocolPolicy != null)
        'ViewerProtocolPolicy': viewerProtocolPolicy,
    };
  }
}

/// A distribution configuration.
class AwsCloudFrontDistributionDetails {
  /// Provides information about the cache configuration for the distribution.
  final AwsCloudFrontDistributionCacheBehaviors? cacheBehaviors;

  /// The default cache behavior for the configuration.
  final AwsCloudFrontDistributionDefaultCacheBehavior? defaultCacheBehavior;

  /// The object that CloudFront sends in response to requests from the origin
  /// (for example, index.html) when a viewer requests the root URL for the
  /// distribution (http://www.example.com) instead of an object in your
  /// distribution (http://www.example.com/product-description.html).
  final String? defaultRootObject;

  /// The domain name corresponding to the distribution.
  final String? domainName;

  /// The entity tag is a hash of the object.
  final String? eTag;

  /// Indicates when that the distribution was last modified.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastModifiedTime;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  final AwsCloudFrontDistributionLogging? logging;

  /// Provides information about the origin groups in the distribution.
  final AwsCloudFrontDistributionOriginGroups? originGroups;

  /// A complex type that contains information about origins for this
  /// distribution.
  final AwsCloudFrontDistributionOrigins? origins;

  /// Indicates the current status of the distribution.
  final String? status;

  /// A unique identifier that specifies the AWS WAF web ACL, if any, to associate
  /// with this distribution.
  final String? webAclId;

  AwsCloudFrontDistributionDetails({
    this.cacheBehaviors,
    this.defaultCacheBehavior,
    this.defaultRootObject,
    this.domainName,
    this.eTag,
    this.lastModifiedTime,
    this.logging,
    this.originGroups,
    this.origins,
    this.status,
    this.webAclId,
  });

  factory AwsCloudFrontDistributionDetails.fromJson(Map<String, dynamic> json) {
    return AwsCloudFrontDistributionDetails(
      cacheBehaviors: json['CacheBehaviors'] != null
          ? AwsCloudFrontDistributionCacheBehaviors.fromJson(
              json['CacheBehaviors'] as Map<String, dynamic>)
          : null,
      defaultCacheBehavior: json['DefaultCacheBehavior'] != null
          ? AwsCloudFrontDistributionDefaultCacheBehavior.fromJson(
              json['DefaultCacheBehavior'] as Map<String, dynamic>)
          : null,
      defaultRootObject: json['DefaultRootObject'] as String?,
      domainName: json['DomainName'] as String?,
      eTag: json['ETag'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as String?,
      logging: json['Logging'] != null
          ? AwsCloudFrontDistributionLogging.fromJson(
              json['Logging'] as Map<String, dynamic>)
          : null,
      originGroups: json['OriginGroups'] != null
          ? AwsCloudFrontDistributionOriginGroups.fromJson(
              json['OriginGroups'] as Map<String, dynamic>)
          : null,
      origins: json['Origins'] != null
          ? AwsCloudFrontDistributionOrigins.fromJson(
              json['Origins'] as Map<String, dynamic>)
          : null,
      status: json['Status'] as String?,
      webAclId: json['WebAclId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheBehaviors = this.cacheBehaviors;
    final defaultCacheBehavior = this.defaultCacheBehavior;
    final defaultRootObject = this.defaultRootObject;
    final domainName = this.domainName;
    final eTag = this.eTag;
    final lastModifiedTime = this.lastModifiedTime;
    final logging = this.logging;
    final originGroups = this.originGroups;
    final origins = this.origins;
    final status = this.status;
    final webAclId = this.webAclId;
    return {
      if (cacheBehaviors != null) 'CacheBehaviors': cacheBehaviors,
      if (defaultCacheBehavior != null)
        'DefaultCacheBehavior': defaultCacheBehavior,
      if (defaultRootObject != null) 'DefaultRootObject': defaultRootObject,
      if (domainName != null) 'DomainName': domainName,
      if (eTag != null) 'ETag': eTag,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (logging != null) 'Logging': logging,
      if (originGroups != null) 'OriginGroups': originGroups,
      if (origins != null) 'Origins': origins,
      if (status != null) 'Status': status,
      if (webAclId != null) 'WebAclId': webAclId,
    };
  }
}

/// A complex type that controls whether access logs are written for the
/// distribution.
class AwsCloudFrontDistributionLogging {
  /// The Amazon S3 bucket to store the access logs in.
  final String? bucket;

  /// With this field, you can enable or disable the selected distribution.
  final bool? enabled;

  /// Specifies whether you want CloudFront to include cookies in access logs.
  final bool? includeCookies;

  /// An optional string that you want CloudFront to use as a prefix to the access
  /// log filenames for this distribution.
  final String? prefix;

  AwsCloudFrontDistributionLogging({
    this.bucket,
    this.enabled,
    this.includeCookies,
    this.prefix,
  });

  factory AwsCloudFrontDistributionLogging.fromJson(Map<String, dynamic> json) {
    return AwsCloudFrontDistributionLogging(
      bucket: json['Bucket'] as String?,
      enabled: json['Enabled'] as bool?,
      includeCookies: json['IncludeCookies'] as bool?,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final includeCookies = this.includeCookies;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (enabled != null) 'Enabled': enabled,
      if (includeCookies != null) 'IncludeCookies': includeCookies,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Information about an origin group for the distribution.
class AwsCloudFrontDistributionOriginGroup {
  /// Provides the criteria for an origin group to fail over.
  final AwsCloudFrontDistributionOriginGroupFailover? failoverCriteria;

  AwsCloudFrontDistributionOriginGroup({
    this.failoverCriteria,
  });

  factory AwsCloudFrontDistributionOriginGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginGroup(
      failoverCriteria: json['FailoverCriteria'] != null
          ? AwsCloudFrontDistributionOriginGroupFailover.fromJson(
              json['FailoverCriteria'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failoverCriteria = this.failoverCriteria;
    return {
      if (failoverCriteria != null) 'FailoverCriteria': failoverCriteria,
    };
  }
}

/// Provides information about when an origin group fails over.
class AwsCloudFrontDistributionOriginGroupFailover {
  /// Information about the status codes that cause an origin group to fail over.
  final AwsCloudFrontDistributionOriginGroupFailoverStatusCodes? statusCodes;

  AwsCloudFrontDistributionOriginGroupFailover({
    this.statusCodes,
  });

  factory AwsCloudFrontDistributionOriginGroupFailover.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginGroupFailover(
      statusCodes: json['StatusCodes'] != null
          ? AwsCloudFrontDistributionOriginGroupFailoverStatusCodes.fromJson(
              json['StatusCodes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCodes = this.statusCodes;
    return {
      if (statusCodes != null) 'StatusCodes': statusCodes,
    };
  }
}

/// The status codes that cause an origin group to fail over.
class AwsCloudFrontDistributionOriginGroupFailoverStatusCodes {
  /// The list of status code values that can cause a failover to the next origin.
  final List<int>? items;

  /// The number of status codes that can cause a failover.
  final int? quantity;

  AwsCloudFrontDistributionOriginGroupFailoverStatusCodes({
    this.items,
    this.quantity,
  });

  factory AwsCloudFrontDistributionOriginGroupFailoverStatusCodes.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginGroupFailoverStatusCodes(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      quantity: json['Quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final quantity = this.quantity;
    return {
      if (items != null) 'Items': items,
      if (quantity != null) 'Quantity': quantity,
    };
  }
}

/// Provides information about origin groups that are associated with the
/// distribution.
class AwsCloudFrontDistributionOriginGroups {
  /// The list of origin groups.
  final List<AwsCloudFrontDistributionOriginGroup>? items;

  AwsCloudFrontDistributionOriginGroups({
    this.items,
  });

  factory AwsCloudFrontDistributionOriginGroups.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginGroups(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => AwsCloudFrontDistributionOriginGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      if (items != null) 'Items': items,
    };
  }
}

/// A complex type that describes the Amazon S3 bucket, HTTP server (for
/// example, a web server), Amazon Elemental MediaStore, or other server from
/// which CloudFront gets your files.
class AwsCloudFrontDistributionOriginItem {
  /// Amazon S3 origins: The DNS name of the Amazon S3 bucket from which you want
  /// CloudFront to get objects for this origin.
  final String? domainName;

  /// A unique identifier for the origin or origin group.
  final String? id;

  /// An optional element that causes CloudFront to request your content from a
  /// directory in your Amazon S3 bucket or your custom origin.
  final String? originPath;

  /// An origin that is an S3 bucket that is not configured with static website
  /// hosting.
  final AwsCloudFrontDistributionOriginS3OriginConfig? s3OriginConfig;

  AwsCloudFrontDistributionOriginItem({
    this.domainName,
    this.id,
    this.originPath,
    this.s3OriginConfig,
  });

  factory AwsCloudFrontDistributionOriginItem.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginItem(
      domainName: json['DomainName'] as String?,
      id: json['Id'] as String?,
      originPath: json['OriginPath'] as String?,
      s3OriginConfig: json['S3OriginConfig'] != null
          ? AwsCloudFrontDistributionOriginS3OriginConfig.fromJson(
              json['S3OriginConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final id = this.id;
    final originPath = this.originPath;
    final s3OriginConfig = this.s3OriginConfig;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (id != null) 'Id': id,
      if (originPath != null) 'OriginPath': originPath,
      if (s3OriginConfig != null) 'S3OriginConfig': s3OriginConfig,
    };
  }
}

/// Information about an origin that is an S3 bucket that is not configured with
/// static website hosting.
class AwsCloudFrontDistributionOriginS3OriginConfig {
  /// The CloudFront origin access identity to associate with the origin.
  final String? originAccessIdentity;

  AwsCloudFrontDistributionOriginS3OriginConfig({
    this.originAccessIdentity,
  });

  factory AwsCloudFrontDistributionOriginS3OriginConfig.fromJson(
      Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOriginS3OriginConfig(
      originAccessIdentity: json['OriginAccessIdentity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final originAccessIdentity = this.originAccessIdentity;
    return {
      if (originAccessIdentity != null)
        'OriginAccessIdentity': originAccessIdentity,
    };
  }
}

/// A complex type that contains information about origins and origin groups for
/// this distribution.
class AwsCloudFrontDistributionOrigins {
  /// A complex type that contains origins or origin groups for this distribution.
  final List<AwsCloudFrontDistributionOriginItem>? items;

  AwsCloudFrontDistributionOrigins({
    this.items,
  });

  factory AwsCloudFrontDistributionOrigins.fromJson(Map<String, dynamic> json) {
    return AwsCloudFrontDistributionOrigins(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => AwsCloudFrontDistributionOriginItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      if (items != null) 'Items': items,
    };
  }
}

/// Provides details about a CloudTrail trail.
class AwsCloudTrailTrailDetails {
  /// The ARN of the log group that CloudTrail logs are delivered to.
  final String? cloudWatchLogsLogGroupArn;

  /// The ARN of the role that the CloudWatch Logs endpoint assumes when it writes
  /// to the log group.
  final String? cloudWatchLogsRoleArn;

  /// Indicates whether the trail has custom event selectors.
  final bool? hasCustomEventSelectors;

  /// The Region where the trail was created.
  final String? homeRegion;

  /// Indicates whether the trail publishes events from global services such as
  /// IAM to the log files.
  final bool? includeGlobalServiceEvents;

  /// Indicates whether the trail applies only to the current Region or to all
  /// Regions.
  final bool? isMultiRegionTrail;

  /// Whether the trail is created for all accounts in an organization in AWS
  /// Organizations, or only for the current AWS account.
  final bool? isOrganizationTrail;

  /// The AWS KMS key ID to use to encrypt the logs.
  final String? kmsKeyId;

  /// Indicates whether CloudTrail log file validation is enabled.
  final bool? logFileValidationEnabled;

  /// The name of the trail.
  final String? name;

  /// The name of the S3 bucket where the log files are published.
  final String? s3BucketName;

  /// The S3 key prefix. The key prefix is added after the name of the S3 bucket
  /// where the log files are published.
  final String? s3KeyPrefix;

  /// The ARN of the SNS topic that is used for notifications of log file
  /// delivery.
  final String? snsTopicArn;

  /// The name of the SNS topic that is used for notifications of log file
  /// delivery.
  final String? snsTopicName;

  /// The ARN of the trail.
  final String? trailArn;

  AwsCloudTrailTrailDetails({
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.hasCustomEventSelectors,
    this.homeRegion,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.isOrganizationTrail,
    this.kmsKeyId,
    this.logFileValidationEnabled,
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicArn,
    this.snsTopicName,
    this.trailArn,
  });

  factory AwsCloudTrailTrailDetails.fromJson(Map<String, dynamic> json) {
    return AwsCloudTrailTrailDetails(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String?,
      hasCustomEventSelectors: json['HasCustomEventSelectors'] as bool?,
      homeRegion: json['HomeRegion'] as String?,
      includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool?,
      isMultiRegionTrail: json['IsMultiRegionTrail'] as bool?,
      isOrganizationTrail: json['IsOrganizationTrail'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      logFileValidationEnabled: json['LogFileValidationEnabled'] as bool?,
      name: json['Name'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      snsTopicName: json['SnsTopicName'] as String?,
      trailArn: json['TrailArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final cloudWatchLogsRoleArn = this.cloudWatchLogsRoleArn;
    final hasCustomEventSelectors = this.hasCustomEventSelectors;
    final homeRegion = this.homeRegion;
    final includeGlobalServiceEvents = this.includeGlobalServiceEvents;
    final isMultiRegionTrail = this.isMultiRegionTrail;
    final isOrganizationTrail = this.isOrganizationTrail;
    final kmsKeyId = this.kmsKeyId;
    final logFileValidationEnabled = this.logFileValidationEnabled;
    final name = this.name;
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    final snsTopicArn = this.snsTopicArn;
    final snsTopicName = this.snsTopicName;
    final trailArn = this.trailArn;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (hasCustomEventSelectors != null)
        'HasCustomEventSelectors': hasCustomEventSelectors,
      if (homeRegion != null) 'HomeRegion': homeRegion,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logFileValidationEnabled != null)
        'LogFileValidationEnabled': logFileValidationEnabled,
      if (name != null) 'Name': name,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (trailArn != null) 'TrailArn': trailArn,
    };
  }
}

/// Information about an AWS CodeBuild project.
class AwsCodeBuildProjectDetails {
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) used to
  /// encrypt the build output artifacts.
  ///
  /// You can specify either the ARN of the CMK or, if available, the CMK alias
  /// (using the format alias/alias-name).
  final String? encryptionKey;

  /// Information about the build environment for this build project.
  final AwsCodeBuildProjectEnvironment? environment;

  /// The name of the build project.
  final String? name;

  /// The ARN of the IAM role that enables AWS CodeBuild to interact with
  /// dependent AWS services on behalf of the AWS account.
  final String? serviceRole;

  /// Information about the build input source code for this build project.
  final AwsCodeBuildProjectSource? source;

  /// Information about the VPC configuration that AWS CodeBuild accesses.
  final AwsCodeBuildProjectVpcConfig? vpcConfig;

  AwsCodeBuildProjectDetails({
    this.encryptionKey,
    this.environment,
    this.name,
    this.serviceRole,
    this.source,
    this.vpcConfig,
  });

  factory AwsCodeBuildProjectDetails.fromJson(Map<String, dynamic> json) {
    return AwsCodeBuildProjectDetails(
      encryptionKey: json['EncryptionKey'] as String?,
      environment: json['Environment'] != null
          ? AwsCodeBuildProjectEnvironment.fromJson(
              json['Environment'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      serviceRole: json['ServiceRole'] as String?,
      source: json['Source'] != null
          ? AwsCodeBuildProjectSource.fromJson(
              json['Source'] as Map<String, dynamic>)
          : null,
      vpcConfig: json['VpcConfig'] != null
          ? AwsCodeBuildProjectVpcConfig.fromJson(
              json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    final environment = this.environment;
    final name = this.name;
    final serviceRole = this.serviceRole;
    final source = this.source;
    final vpcConfig = this.vpcConfig;
    return {
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (environment != null) 'Environment': environment,
      if (name != null) 'Name': name,
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (source != null) 'Source': source,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// Information about the build environment for this build project.
class AwsCodeBuildProjectEnvironment {
  /// The certificate to use with this build project.
  final String? certificate;

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
  final String? imagePullCredentialsType;

  /// The credentials for access to a private registry.
  final AwsCodeBuildProjectEnvironmentRegistryCredential? registryCredential;

  /// The type of build environment to use for related builds.
  ///
  /// The environment type <code>ARM_CONTAINER</code> is available only in Regions
  /// US East (N. Virginia), US East (Ohio), US West (Oregon), Europe (Ireland),
  /// Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and
  /// Europe (Frankfurt).
  ///
  /// The environment type <code>LINUX_CONTAINER</code> with compute type
  /// build.general1.2xlarge is available only in Regions US East (N. Virginia),
  /// US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland),
  /// Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific
  /// (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing),
  /// and China (Ningxia).
  ///
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// Regions US East (N. Virginia), US East (N. Virginia), US West (Oregon),
  /// Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt),
  /// Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia
  /// Pacific (Sydney), China (Beijing), and China (Ningxia).
  ///
  /// Valid values: <code>WINDOWS_CONTAINER</code> | <code>LINUX_CONTAINER</code>
  /// | <code>LINUX_GPU_CONTAINER</code> | <code>ARM_CONTAINER</code>
  final String? type;

  AwsCodeBuildProjectEnvironment({
    this.certificate,
    this.imagePullCredentialsType,
    this.registryCredential,
    this.type,
  });

  factory AwsCodeBuildProjectEnvironment.fromJson(Map<String, dynamic> json) {
    return AwsCodeBuildProjectEnvironment(
      certificate: json['Certificate'] as String?,
      imagePullCredentialsType: json['ImagePullCredentialsType'] as String?,
      registryCredential: json['RegistryCredential'] != null
          ? AwsCodeBuildProjectEnvironmentRegistryCredential.fromJson(
              json['RegistryCredential'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final imagePullCredentialsType = this.imagePullCredentialsType;
    final registryCredential = this.registryCredential;
    final type = this.type;
    return {
      if (certificate != null) 'Certificate': certificate,
      if (imagePullCredentialsType != null)
        'ImagePullCredentialsType': imagePullCredentialsType,
      if (registryCredential != null) 'RegistryCredential': registryCredential,
      if (type != null) 'Type': type,
    };
  }
}

/// The credentials for access to a private registry.
class AwsCodeBuildProjectEnvironmentRegistryCredential {
  /// The ARN or name of credentials created using AWS Secrets Manager.
  /// <note>
  /// The credential can use the name of the credentials only if they exist in
  /// your current AWS Region.
  /// </note>
  final String? credential;

  /// The service that created the credentials to access a private Docker
  /// registry.
  ///
  /// The valid value,<code> SECRETS_MANAGER</code>, is for AWS Secrets Manager.
  final String? credentialProvider;

  AwsCodeBuildProjectEnvironmentRegistryCredential({
    this.credential,
    this.credentialProvider,
  });

  factory AwsCodeBuildProjectEnvironmentRegistryCredential.fromJson(
      Map<String, dynamic> json) {
    return AwsCodeBuildProjectEnvironmentRegistryCredential(
      credential: json['Credential'] as String?,
      credentialProvider: json['CredentialProvider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credential = this.credential;
    final credentialProvider = this.credentialProvider;
    return {
      if (credential != null) 'Credential': credential,
      if (credentialProvider != null) 'CredentialProvider': credentialProvider,
    };
  }
}

/// Information about the build input source code for this build project.
class AwsCodeBuildProjectSource {
  /// Information about the Git clone depth for the build project.
  final int? gitCloneDepth;

  /// Whether to ignore SSL warnings while connecting to the project source code.
  final bool? insecureSsl;

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
  /// repository that contains the source code and the build spec file (for
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
  /// repository that contains the source and the build spec file.
  /// </li>
  /// <li>
  /// For source code in a Bitbucket repository, the HTTPS clone URL to the
  /// repository that contains the source and the build spec file.
  /// </li>
  /// </ul>
  final String? location;

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
  final String? type;

  AwsCodeBuildProjectSource({
    this.gitCloneDepth,
    this.insecureSsl,
    this.location,
    this.type,
  });

  factory AwsCodeBuildProjectSource.fromJson(Map<String, dynamic> json) {
    return AwsCodeBuildProjectSource(
      gitCloneDepth: json['GitCloneDepth'] as int?,
      insecureSsl: json['InsecureSsl'] as bool?,
      location: json['Location'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gitCloneDepth = this.gitCloneDepth;
    final insecureSsl = this.insecureSsl;
    final location = this.location;
    final type = this.type;
    return {
      if (gitCloneDepth != null) 'GitCloneDepth': gitCloneDepth,
      if (insecureSsl != null) 'InsecureSsl': insecureSsl,
      if (location != null) 'Location': location,
      if (type != null) 'Type': type,
    };
  }
}

/// Information about the VPC configuration that AWS CodeBuild accesses.
class AwsCodeBuildProjectVpcConfig {
  /// A list of one or more security group IDs in your Amazon VPC.
  final List<String>? securityGroupIds;

  /// A list of one or more subnet IDs in your Amazon VPC.
  final List<String>? subnets;

  /// The ID of the VPC.
  final String? vpcId;

  AwsCodeBuildProjectVpcConfig({
    this.securityGroupIds,
    this.subnets,
    this.vpcId,
  });

  factory AwsCodeBuildProjectVpcConfig.fromJson(Map<String, dynamic> json) {
    return AwsCodeBuildProjectVpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains the cross-origin resource sharing (CORS) configuration for the API.
/// CORS is only supported for HTTP APIs.
class AwsCorsConfiguration {
  /// Indicates whether the CORS request includes credentials.
  final bool? allowCredentials;

  /// The allowed headers for CORS requests.
  final List<String>? allowHeaders;

  /// The allowed methods for CORS requests.
  final List<String>? allowMethods;

  /// The allowed origins for CORS requests.
  final List<String>? allowOrigins;

  /// The exposed headers for CORS requests.
  final List<String>? exposeHeaders;

  /// The number of seconds for which the browser caches preflight request
  /// results.
  final int? maxAge;

  AwsCorsConfiguration({
    this.allowCredentials,
    this.allowHeaders,
    this.allowMethods,
    this.allowOrigins,
    this.exposeHeaders,
    this.maxAge,
  });

  factory AwsCorsConfiguration.fromJson(Map<String, dynamic> json) {
    return AwsCorsConfiguration(
      allowCredentials: json['AllowCredentials'] as bool?,
      allowHeaders: (json['AllowHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowMethods: (json['AllowMethods'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowOrigins: (json['AllowOrigins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exposeHeaders: (json['ExposeHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxAge: json['MaxAge'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowCredentials = this.allowCredentials;
    final allowHeaders = this.allowHeaders;
    final allowMethods = this.allowMethods;
    final allowOrigins = this.allowOrigins;
    final exposeHeaders = this.exposeHeaders;
    final maxAge = this.maxAge;
    return {
      if (allowCredentials != null) 'AllowCredentials': allowCredentials,
      if (allowHeaders != null) 'AllowHeaders': allowHeaders,
      if (allowMethods != null) 'AllowMethods': allowMethods,
      if (allowOrigins != null) 'AllowOrigins': allowOrigins,
      if (exposeHeaders != null) 'ExposeHeaders': exposeHeaders,
      if (maxAge != null) 'MaxAge': maxAge,
    };
  }
}

/// Contains a definition of an attribute for the table.
class AwsDynamoDbTableAttributeDefinition {
  /// The name of the attribute.
  final String? attributeName;

  /// The type of the attribute.
  final String? attributeType;

  AwsDynamoDbTableAttributeDefinition({
    this.attributeName,
    this.attributeType,
  });

  factory AwsDynamoDbTableAttributeDefinition.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableAttributeDefinition(
      attributeName: json['AttributeName'] as String?,
      attributeType: json['AttributeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeType = this.attributeType;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (attributeType != null) 'AttributeType': attributeType,
    };
  }
}

/// Provides information about the billing for read/write capacity on the table.
class AwsDynamoDbTableBillingModeSummary {
  /// The method used to charge for read and write throughput and to manage
  /// capacity.
  final String? billingMode;

  /// If the billing mode is <code>PAY_PER_REQUEST</code>, indicates when the
  /// billing mode was set to that value.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastUpdateToPayPerRequestDateTime;

  AwsDynamoDbTableBillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });

  factory AwsDynamoDbTableBillingModeSummary.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableBillingModeSummary(
      billingMode: json['BillingMode'] as String?,
      lastUpdateToPayPerRequestDateTime:
          json['LastUpdateToPayPerRequestDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingMode = this.billingMode;
    final lastUpdateToPayPerRequestDateTime =
        this.lastUpdateToPayPerRequestDateTime;
    return {
      if (billingMode != null) 'BillingMode': billingMode,
      if (lastUpdateToPayPerRequestDateTime != null)
        'LastUpdateToPayPerRequestDateTime': lastUpdateToPayPerRequestDateTime,
    };
  }
}

/// Provides details about a DynamoDB table.
class AwsDynamoDbTableDetails {
  /// A list of attribute definitions for the table.
  final List<AwsDynamoDbTableAttributeDefinition>? attributeDefinitions;

  /// Information about the billing for read/write capacity on the table.
  final AwsDynamoDbTableBillingModeSummary? billingModeSummary;

  /// Indicates when the table was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? creationDateTime;

  /// List of global secondary indexes for the table.
  final List<AwsDynamoDbTableGlobalSecondaryIndex>? globalSecondaryIndexes;

  /// The version of global tables being used.
  final String? globalTableVersion;

  /// The number of items in the table.
  final int? itemCount;

  /// The primary key structure for the table.
  final List<AwsDynamoDbTableKeySchema>? keySchema;

  /// The ARN of the latest stream for the table.
  final String? latestStreamArn;

  /// The label of the latest stream. The label is not a unique identifier.
  final String? latestStreamLabel;

  /// The list of local secondary indexes for the table.
  final List<AwsDynamoDbTableLocalSecondaryIndex>? localSecondaryIndexes;

  /// Information about the provisioned throughput for the table.
  final AwsDynamoDbTableProvisionedThroughput? provisionedThroughput;

  /// The list of replicas of this table.
  final List<AwsDynamoDbTableReplica>? replicas;

  /// Information about the restore for the table.
  final AwsDynamoDbTableRestoreSummary? restoreSummary;

  /// Information about the server-side encryption for the table.
  final AwsDynamoDbTableSseDescription? sseDescription;

  /// The current DynamoDB Streams configuration for the table.
  final AwsDynamoDbTableStreamSpecification? streamSpecification;

  /// The identifier of the table.
  final String? tableId;

  /// The name of the table.
  final String? tableName;

  /// The total size of the table in bytes.
  final int? tableSizeBytes;

  /// The current status of the table.
  final String? tableStatus;

  AwsDynamoDbTableDetails({
    this.attributeDefinitions,
    this.billingModeSummary,
    this.creationDateTime,
    this.globalSecondaryIndexes,
    this.globalTableVersion,
    this.itemCount,
    this.keySchema,
    this.latestStreamArn,
    this.latestStreamLabel,
    this.localSecondaryIndexes,
    this.provisionedThroughput,
    this.replicas,
    this.restoreSummary,
    this.sseDescription,
    this.streamSpecification,
    this.tableId,
    this.tableName,
    this.tableSizeBytes,
    this.tableStatus,
  });

  factory AwsDynamoDbTableDetails.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableDetails(
      attributeDefinitions: (json['AttributeDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => AwsDynamoDbTableAttributeDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      billingModeSummary: json['BillingModeSummary'] != null
          ? AwsDynamoDbTableBillingModeSummary.fromJson(
              json['BillingModeSummary'] as Map<String, dynamic>)
          : null,
      creationDateTime: json['CreationDateTime'] as String?,
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => AwsDynamoDbTableGlobalSecondaryIndex.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      globalTableVersion: json['GlobalTableVersion'] as String?,
      itemCount: json['ItemCount'] as int?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestStreamArn: json['LatestStreamArn'] as String?,
      latestStreamLabel: json['LatestStreamLabel'] as String?,
      localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => AwsDynamoDbTableLocalSecondaryIndex.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? AwsDynamoDbTableProvisionedThroughput.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
      replicas: (json['Replicas'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsDynamoDbTableReplica.fromJson(e as Map<String, dynamic>))
          .toList(),
      restoreSummary: json['RestoreSummary'] != null
          ? AwsDynamoDbTableRestoreSummary.fromJson(
              json['RestoreSummary'] as Map<String, dynamic>)
          : null,
      sseDescription: json['SseDescription'] != null
          ? AwsDynamoDbTableSseDescription.fromJson(
              json['SseDescription'] as Map<String, dynamic>)
          : null,
      streamSpecification: json['StreamSpecification'] != null
          ? AwsDynamoDbTableStreamSpecification.fromJson(
              json['StreamSpecification'] as Map<String, dynamic>)
          : null,
      tableId: json['TableId'] as String?,
      tableName: json['TableName'] as String?,
      tableSizeBytes: json['TableSizeBytes'] as int?,
      tableStatus: json['TableStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeDefinitions = this.attributeDefinitions;
    final billingModeSummary = this.billingModeSummary;
    final creationDateTime = this.creationDateTime;
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final globalTableVersion = this.globalTableVersion;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final latestStreamArn = this.latestStreamArn;
    final latestStreamLabel = this.latestStreamLabel;
    final localSecondaryIndexes = this.localSecondaryIndexes;
    final provisionedThroughput = this.provisionedThroughput;
    final replicas = this.replicas;
    final restoreSummary = this.restoreSummary;
    final sseDescription = this.sseDescription;
    final streamSpecification = this.streamSpecification;
    final tableId = this.tableId;
    final tableName = this.tableName;
    final tableSizeBytes = this.tableSizeBytes;
    final tableStatus = this.tableStatus;
    return {
      if (attributeDefinitions != null)
        'AttributeDefinitions': attributeDefinitions,
      if (billingModeSummary != null) 'BillingModeSummary': billingModeSummary,
      if (creationDateTime != null) 'CreationDateTime': creationDateTime,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (globalTableVersion != null) 'GlobalTableVersion': globalTableVersion,
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (latestStreamArn != null) 'LatestStreamArn': latestStreamArn,
      if (latestStreamLabel != null) 'LatestStreamLabel': latestStreamLabel,
      if (localSecondaryIndexes != null)
        'LocalSecondaryIndexes': localSecondaryIndexes,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (replicas != null) 'Replicas': replicas,
      if (restoreSummary != null) 'RestoreSummary': restoreSummary,
      if (sseDescription != null) 'SseDescription': sseDescription,
      if (streamSpecification != null)
        'StreamSpecification': streamSpecification,
      if (tableId != null) 'TableId': tableId,
      if (tableName != null) 'TableName': tableName,
      if (tableSizeBytes != null) 'TableSizeBytes': tableSizeBytes,
      if (tableStatus != null) 'TableStatus': tableStatus,
    };
  }
}

/// Information abut a global secondary index for the table.
class AwsDynamoDbTableGlobalSecondaryIndex {
  /// Whether the index is currently backfilling.
  final bool? backfilling;

  /// The ARN of the index.
  final String? indexArn;

  /// The name of the index.
  final String? indexName;

  /// The total size in bytes of the index.
  final int? indexSizeBytes;

  /// The current status of the index.
  final String? indexStatus;

  /// The number of items in the index.
  final int? itemCount;

  /// The key schema for the index.
  final List<AwsDynamoDbTableKeySchema>? keySchema;

  /// Attributes that are copied from the table into an index.
  final AwsDynamoDbTableProjection? projection;

  /// Information about the provisioned throughput settings for the indexes.
  final AwsDynamoDbTableProvisionedThroughput? provisionedThroughput;

  AwsDynamoDbTableGlobalSecondaryIndex({
    this.backfilling,
    this.indexArn,
    this.indexName,
    this.indexSizeBytes,
    this.indexStatus,
    this.itemCount,
    this.keySchema,
    this.projection,
    this.provisionedThroughput,
  });

  factory AwsDynamoDbTableGlobalSecondaryIndex.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableGlobalSecondaryIndex(
      backfilling: json['Backfilling'] as bool?,
      indexArn: json['IndexArn'] as String?,
      indexName: json['IndexName'] as String?,
      indexSizeBytes: json['IndexSizeBytes'] as int?,
      indexStatus: json['IndexStatus'] as String?,
      itemCount: json['ItemCount'] as int?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      projection: json['Projection'] != null
          ? AwsDynamoDbTableProjection.fromJson(
              json['Projection'] as Map<String, dynamic>)
          : null,
      provisionedThroughput: json['ProvisionedThroughput'] != null
          ? AwsDynamoDbTableProvisionedThroughput.fromJson(
              json['ProvisionedThroughput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backfilling = this.backfilling;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final indexSizeBytes = this.indexSizeBytes;
    final indexStatus = this.indexStatus;
    final itemCount = this.itemCount;
    final keySchema = this.keySchema;
    final projection = this.projection;
    final provisionedThroughput = this.provisionedThroughput;
    return {
      if (backfilling != null) 'Backfilling': backfilling,
      if (indexArn != null) 'IndexArn': indexArn,
      if (indexName != null) 'IndexName': indexName,
      if (indexSizeBytes != null) 'IndexSizeBytes': indexSizeBytes,
      if (indexStatus != null) 'IndexStatus': indexStatus,
      if (itemCount != null) 'ItemCount': itemCount,
      if (keySchema != null) 'KeySchema': keySchema,
      if (projection != null) 'Projection': projection,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
    };
  }
}

/// A component of the key schema for the DynamoDB table, a global secondary
/// index, or a local secondary index.
class AwsDynamoDbTableKeySchema {
  /// The name of the key schema attribute.
  final String? attributeName;

  /// The type of key used for the key schema attribute.
  final String? keyType;

  AwsDynamoDbTableKeySchema({
    this.attributeName,
    this.keyType,
  });

  factory AwsDynamoDbTableKeySchema.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableKeySchema(
      attributeName: json['AttributeName'] as String?,
      keyType: json['KeyType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final keyType = this.keyType;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (keyType != null) 'KeyType': keyType,
    };
  }
}

/// Information about a local secondary index for a DynamoDB table.
class AwsDynamoDbTableLocalSecondaryIndex {
  /// The ARN of the index.
  final String? indexArn;

  /// The name of the index.
  final String? indexName;

  /// The complete key schema for the index.
  final List<AwsDynamoDbTableKeySchema>? keySchema;

  /// Attributes that are copied from the table into the index. These are in
  /// addition to the primary key attributes and index key attributes, which are
  /// automatically projected.
  final AwsDynamoDbTableProjection? projection;

  AwsDynamoDbTableLocalSecondaryIndex({
    this.indexArn,
    this.indexName,
    this.keySchema,
    this.projection,
  });

  factory AwsDynamoDbTableLocalSecondaryIndex.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableLocalSecondaryIndex(
      indexArn: json['IndexArn'] as String?,
      indexName: json['IndexName'] as String?,
      keySchema: (json['KeySchema'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      projection: json['Projection'] != null
          ? AwsDynamoDbTableProjection.fromJson(
              json['Projection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final keySchema = this.keySchema;
    final projection = this.projection;
    return {
      if (indexArn != null) 'IndexArn': indexArn,
      if (indexName != null) 'IndexName': indexName,
      if (keySchema != null) 'KeySchema': keySchema,
      if (projection != null) 'Projection': projection,
    };
  }
}

/// For global and local secondary indexes, identifies the attributes that are
/// copied from the table into the index.
class AwsDynamoDbTableProjection {
  /// The nonkey attributes that are projected into the index. For each attribute,
  /// provide the attribute name.
  final List<String>? nonKeyAttributes;

  /// The types of attributes that are projected into the index.
  final String? projectionType;

  AwsDynamoDbTableProjection({
    this.nonKeyAttributes,
    this.projectionType,
  });

  factory AwsDynamoDbTableProjection.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableProjection(
      nonKeyAttributes: (json['NonKeyAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      projectionType: json['ProjectionType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nonKeyAttributes = this.nonKeyAttributes;
    final projectionType = this.projectionType;
    return {
      if (nonKeyAttributes != null) 'NonKeyAttributes': nonKeyAttributes,
      if (projectionType != null) 'ProjectionType': projectionType,
    };
  }
}

/// Information about the provisioned throughput for the table or for a global
/// secondary index.
class AwsDynamoDbTableProvisionedThroughput {
  /// Indicates when the provisioned throughput was last decreased.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastDecreaseDateTime;

  /// Indicates when the provisioned throughput was last increased.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastIncreaseDateTime;

  /// The number of times during the current UTC calendar day that the provisioned
  /// throughput was decreased.
  final int? numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  final int? readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
  final int? writeCapacityUnits;

  AwsDynamoDbTableProvisionedThroughput({
    this.lastDecreaseDateTime,
    this.lastIncreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });

  factory AwsDynamoDbTableProvisionedThroughput.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableProvisionedThroughput(
      lastDecreaseDateTime: json['LastDecreaseDateTime'] as String?,
      lastIncreaseDateTime: json['LastIncreaseDateTime'] as String?,
      numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int?,
      readCapacityUnits: json['ReadCapacityUnits'] as int?,
      writeCapacityUnits: json['WriteCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastDecreaseDateTime = this.lastDecreaseDateTime;
    final lastIncreaseDateTime = this.lastIncreaseDateTime;
    final numberOfDecreasesToday = this.numberOfDecreasesToday;
    final readCapacityUnits = this.readCapacityUnits;
    final writeCapacityUnits = this.writeCapacityUnits;
    return {
      if (lastDecreaseDateTime != null)
        'LastDecreaseDateTime': lastDecreaseDateTime,
      if (lastIncreaseDateTime != null)
        'LastIncreaseDateTime': lastIncreaseDateTime,
      if (numberOfDecreasesToday != null)
        'NumberOfDecreasesToday': numberOfDecreasesToday,
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
      if (writeCapacityUnits != null) 'WriteCapacityUnits': writeCapacityUnits,
    };
  }
}

/// Replica-specific configuration for the provisioned throughput.
class AwsDynamoDbTableProvisionedThroughputOverride {
  /// The read capacity units for the replica.
  final int? readCapacityUnits;

  AwsDynamoDbTableProvisionedThroughputOverride({
    this.readCapacityUnits,
  });

  factory AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableProvisionedThroughputOverride(
      readCapacityUnits: json['ReadCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final readCapacityUnits = this.readCapacityUnits;
    return {
      if (readCapacityUnits != null) 'ReadCapacityUnits': readCapacityUnits,
    };
  }
}

/// Information about a replica of a DynamoDB table.
class AwsDynamoDbTableReplica {
  /// List of global secondary indexes for the replica.
  final List<AwsDynamoDbTableReplicaGlobalSecondaryIndex>?
      globalSecondaryIndexes;

  /// The identifier of the AWS KMS customer master key (CMK) that will be used
  /// for AWS KMS encryption for the replica.
  final String? kmsMasterKeyId;

  /// Replica-specific configuration for the provisioned throughput.
  final AwsDynamoDbTableProvisionedThroughputOverride?
      provisionedThroughputOverride;

  /// The name of the Region where the replica is located.
  final String? regionName;

  /// The current status of the replica.
  final String? replicaStatus;

  /// Detailed information about the replica status.
  final String? replicaStatusDescription;

  AwsDynamoDbTableReplica({
    this.globalSecondaryIndexes,
    this.kmsMasterKeyId,
    this.provisionedThroughputOverride,
    this.regionName,
    this.replicaStatus,
    this.replicaStatusDescription,
  });

  factory AwsDynamoDbTableReplica.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableReplica(
      globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => AwsDynamoDbTableReplicaGlobalSecondaryIndex.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      kmsMasterKeyId: json['KmsMasterKeyId'] as String?,
      provisionedThroughputOverride:
          json['ProvisionedThroughputOverride'] != null
              ? AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
                  json['ProvisionedThroughputOverride'] as Map<String, dynamic>)
              : null,
      regionName: json['RegionName'] as String?,
      replicaStatus: json['ReplicaStatus'] as String?,
      replicaStatusDescription: json['ReplicaStatusDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalSecondaryIndexes = this.globalSecondaryIndexes;
    final kmsMasterKeyId = this.kmsMasterKeyId;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    final regionName = this.regionName;
    final replicaStatus = this.replicaStatus;
    final replicaStatusDescription = this.replicaStatusDescription;
    return {
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (kmsMasterKeyId != null) 'KmsMasterKeyId': kmsMasterKeyId,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
      if (regionName != null) 'RegionName': regionName,
      if (replicaStatus != null) 'ReplicaStatus': replicaStatus,
      if (replicaStatusDescription != null)
        'ReplicaStatusDescription': replicaStatusDescription,
    };
  }
}

/// Information about a global secondary index for a DynamoDB table replica.
class AwsDynamoDbTableReplicaGlobalSecondaryIndex {
  /// The name of the index.
  final String? indexName;

  /// Replica-specific configuration for the provisioned throughput for the index.
  final AwsDynamoDbTableProvisionedThroughputOverride?
      provisionedThroughputOverride;

  AwsDynamoDbTableReplicaGlobalSecondaryIndex({
    this.indexName,
    this.provisionedThroughputOverride,
  });

  factory AwsDynamoDbTableReplicaGlobalSecondaryIndex.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableReplicaGlobalSecondaryIndex(
      indexName: json['IndexName'] as String?,
      provisionedThroughputOverride:
          json['ProvisionedThroughputOverride'] != null
              ? AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
                  json['ProvisionedThroughputOverride'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final provisionedThroughputOverride = this.provisionedThroughputOverride;
    return {
      if (indexName != null) 'IndexName': indexName,
      if (provisionedThroughputOverride != null)
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
    };
  }
}

/// Information about the restore for the table.
class AwsDynamoDbTableRestoreSummary {
  /// Indicates the point in time that the table was restored to.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? restoreDateTime;

  /// Whether a restore is currently in progress.
  final bool? restoreInProgress;

  /// The ARN of the source backup from which the table was restored.
  final String? sourceBackupArn;

  /// The ARN of the source table for the backup.
  final String? sourceTableArn;

  AwsDynamoDbTableRestoreSummary({
    this.restoreDateTime,
    this.restoreInProgress,
    this.sourceBackupArn,
    this.sourceTableArn,
  });

  factory AwsDynamoDbTableRestoreSummary.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableRestoreSummary(
      restoreDateTime: json['RestoreDateTime'] as String?,
      restoreInProgress: json['RestoreInProgress'] as bool?,
      sourceBackupArn: json['SourceBackupArn'] as String?,
      sourceTableArn: json['SourceTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreDateTime = this.restoreDateTime;
    final restoreInProgress = this.restoreInProgress;
    final sourceBackupArn = this.sourceBackupArn;
    final sourceTableArn = this.sourceTableArn;
    return {
      if (restoreDateTime != null) 'RestoreDateTime': restoreDateTime,
      if (restoreInProgress != null) 'RestoreInProgress': restoreInProgress,
      if (sourceBackupArn != null) 'SourceBackupArn': sourceBackupArn,
      if (sourceTableArn != null) 'SourceTableArn': sourceTableArn,
    };
  }
}

/// Information about the server-side encryption for the table.
class AwsDynamoDbTableSseDescription {
  /// If the key is inaccessible, the date and time when DynamoDB detected that
  /// the key was inaccessible.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? inaccessibleEncryptionDateTime;

  /// The ARN of the AWS KMS customer master key (CMK) that is used for the AWS
  /// KMS encryption.
  final String? kmsMasterKeyArn;

  /// The type of server-side encryption.
  final String? sseType;

  /// The status of the server-side encryption.
  final String? status;

  AwsDynamoDbTableSseDescription({
    this.inaccessibleEncryptionDateTime,
    this.kmsMasterKeyArn,
    this.sseType,
    this.status,
  });

  factory AwsDynamoDbTableSseDescription.fromJson(Map<String, dynamic> json) {
    return AwsDynamoDbTableSseDescription(
      inaccessibleEncryptionDateTime:
          json['InaccessibleEncryptionDateTime'] as String?,
      kmsMasterKeyArn: json['KmsMasterKeyArn'] as String?,
      sseType: json['SseType'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inaccessibleEncryptionDateTime = this.inaccessibleEncryptionDateTime;
    final kmsMasterKeyArn = this.kmsMasterKeyArn;
    final sseType = this.sseType;
    final status = this.status;
    return {
      if (inaccessibleEncryptionDateTime != null)
        'InaccessibleEncryptionDateTime': inaccessibleEncryptionDateTime,
      if (kmsMasterKeyArn != null) 'KmsMasterKeyArn': kmsMasterKeyArn,
      if (sseType != null) 'SseType': sseType,
      if (status != null) 'Status': status,
    };
  }
}

/// The current DynamoDB Streams configuration for the table.
class AwsDynamoDbTableStreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled on the table.
  final bool? streamEnabled;

  /// Determines the information that is written to the table.
  final String? streamViewType;

  AwsDynamoDbTableStreamSpecification({
    this.streamEnabled,
    this.streamViewType,
  });

  factory AwsDynamoDbTableStreamSpecification.fromJson(
      Map<String, dynamic> json) {
    return AwsDynamoDbTableStreamSpecification(
      streamEnabled: json['StreamEnabled'] as bool?,
      streamViewType: json['StreamViewType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamEnabled = this.streamEnabled;
    final streamViewType = this.streamViewType;
    return {
      if (streamEnabled != null) 'StreamEnabled': streamEnabled,
      if (streamViewType != null) 'StreamViewType': streamViewType,
    };
  }
}

/// Information about an Elastic IP address.
class AwsEc2EipDetails {
  /// The identifier that AWS assigns to represent the allocation of the Elastic
  /// IP address for use with Amazon VPC.
  final String? allocationId;

  /// The identifier that represents the association of the Elastic IP address
  /// with an EC2 instance.
  final String? associationId;

  /// The domain in which to allocate the address.
  ///
  /// If the address is for use with EC2 instances in a VPC, then
  /// <code>Domain</code> is <code>vpc</code>. Otherwise, <code>Domain</code> is
  /// <code>standard</code>.
  final String? domain;

  /// The identifier of the EC2 instance.
  final String? instanceId;

  /// The name of the location from which the Elastic IP address is advertised.
  final String? networkBorderGroup;

  /// The identifier of the network interface.
  final String? networkInterfaceId;

  /// The AWS account ID of the owner of the network interface.
  final String? networkInterfaceOwnerId;

  /// The private IP address that is associated with the Elastic IP address.
  final String? privateIpAddress;

  /// A public IP address that is associated with the EC2 instance.
  final String? publicIp;

  /// The identifier of an IP address pool. This parameter allows Amazon EC2 to
  /// select an IP address from the address pool.
  final String? publicIpv4Pool;

  AwsEc2EipDetails({
    this.allocationId,
    this.associationId,
    this.domain,
    this.instanceId,
    this.networkBorderGroup,
    this.networkInterfaceId,
    this.networkInterfaceOwnerId,
    this.privateIpAddress,
    this.publicIp,
    this.publicIpv4Pool,
  });

  factory AwsEc2EipDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2EipDetails(
      allocationId: json['AllocationId'] as String?,
      associationId: json['AssociationId'] as String?,
      domain: json['Domain'] as String?,
      instanceId: json['InstanceId'] as String?,
      networkBorderGroup: json['NetworkBorderGroup'] as String?,
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
      networkInterfaceOwnerId: json['NetworkInterfaceOwnerId'] as String?,
      privateIpAddress: json['PrivateIpAddress'] as String?,
      publicIp: json['PublicIp'] as String?,
      publicIpv4Pool: json['PublicIpv4Pool'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationId = this.allocationId;
    final associationId = this.associationId;
    final domain = this.domain;
    final instanceId = this.instanceId;
    final networkBorderGroup = this.networkBorderGroup;
    final networkInterfaceId = this.networkInterfaceId;
    final networkInterfaceOwnerId = this.networkInterfaceOwnerId;
    final privateIpAddress = this.privateIpAddress;
    final publicIp = this.publicIp;
    final publicIpv4Pool = this.publicIpv4Pool;
    return {
      if (allocationId != null) 'AllocationId': allocationId,
      if (associationId != null) 'AssociationId': associationId,
      if (domain != null) 'Domain': domain,
      if (instanceId != null) 'InstanceId': instanceId,
      if (networkBorderGroup != null) 'NetworkBorderGroup': networkBorderGroup,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (networkInterfaceOwnerId != null)
        'NetworkInterfaceOwnerId': networkInterfaceOwnerId,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (publicIp != null) 'PublicIp': publicIp,
      if (publicIpv4Pool != null) 'PublicIpv4Pool': publicIpv4Pool,
    };
  }
}

/// The details of an EC2 instance.
class AwsEc2InstanceDetails {
  /// The IAM profile ARN of the instance.
  final String? iamInstanceProfileArn;

  /// The Amazon Machine Image (AMI) ID of the instance.
  final String? imageId;

  /// The IPv4 addresses associated with the instance.
  final List<String>? ipV4Addresses;

  /// The IPv6 addresses associated with the instance.
  final List<String>? ipV6Addresses;

  /// The key name associated with the instance.
  final String? keyName;

  /// Indicates when the instance was launched.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? launchedAt;

  /// The identifiers of the network interfaces for the EC2 instance. The details
  /// for each network interface are in a corresponding
  /// <code>AwsEc2NetworkInterfacesDetails</code> object.
  final List<AwsEc2InstanceNetworkInterfacesDetails>? networkInterfaces;

  /// The identifier of the subnet that the instance was launched in.
  final String? subnetId;

  /// The instance type of the instance.
  final String? type;

  /// The identifier of the VPC that the instance was launched in.
  final String? vpcId;

  AwsEc2InstanceDetails({
    this.iamInstanceProfileArn,
    this.imageId,
    this.ipV4Addresses,
    this.ipV6Addresses,
    this.keyName,
    this.launchedAt,
    this.networkInterfaces,
    this.subnetId,
    this.type,
    this.vpcId,
  });

  factory AwsEc2InstanceDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2InstanceDetails(
      iamInstanceProfileArn: json['IamInstanceProfileArn'] as String?,
      imageId: json['ImageId'] as String?,
      ipV4Addresses: (json['IpV4Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipV6Addresses: (json['IpV6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keyName: json['KeyName'] as String?,
      launchedAt: json['LaunchedAt'] as String?,
      networkInterfaces: (json['NetworkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2InstanceNetworkInterfacesDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      subnetId: json['SubnetId'] as String?,
      type: json['Type'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iamInstanceProfileArn = this.iamInstanceProfileArn;
    final imageId = this.imageId;
    final ipV4Addresses = this.ipV4Addresses;
    final ipV6Addresses = this.ipV6Addresses;
    final keyName = this.keyName;
    final launchedAt = this.launchedAt;
    final networkInterfaces = this.networkInterfaces;
    final subnetId = this.subnetId;
    final type = this.type;
    final vpcId = this.vpcId;
    return {
      if (iamInstanceProfileArn != null)
        'IamInstanceProfileArn': iamInstanceProfileArn,
      if (imageId != null) 'ImageId': imageId,
      if (ipV4Addresses != null) 'IpV4Addresses': ipV4Addresses,
      if (ipV6Addresses != null) 'IpV6Addresses': ipV6Addresses,
      if (keyName != null) 'KeyName': keyName,
      if (launchedAt != null) 'LaunchedAt': launchedAt,
      if (networkInterfaces != null) 'NetworkInterfaces': networkInterfaces,
      if (subnetId != null) 'SubnetId': subnetId,
      if (type != null) 'Type': type,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Identifies a network interface for the EC2 instance.
class AwsEc2InstanceNetworkInterfacesDetails {
  /// The identifier of the network interface. The details are in a corresponding
  /// <code>AwsEc2NetworkInterfacesDetails</code> object.
  final String? networkInterfaceId;

  AwsEc2InstanceNetworkInterfacesDetails({
    this.networkInterfaceId,
  });

  factory AwsEc2InstanceNetworkInterfacesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEc2InstanceNetworkInterfacesDetails(
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceId = this.networkInterfaceId;
    return {
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
    };
  }
}

/// An association between the network ACL and a subnet.
class AwsEc2NetworkAclAssociation {
  /// The identifier of the association between the network ACL and the subnet.
  final String? networkAclAssociationId;

  /// The identifier of the network ACL.
  final String? networkAclId;

  /// The identifier of the subnet that is associated with the network ACL.
  final String? subnetId;

  AwsEc2NetworkAclAssociation({
    this.networkAclAssociationId,
    this.networkAclId,
    this.subnetId,
  });

  factory AwsEc2NetworkAclAssociation.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkAclAssociation(
      networkAclAssociationId: json['NetworkAclAssociationId'] as String?,
      networkAclId: json['NetworkAclId'] as String?,
      subnetId: json['SubnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkAclAssociationId = this.networkAclAssociationId;
    final networkAclId = this.networkAclId;
    final subnetId = this.subnetId;
    return {
      if (networkAclAssociationId != null)
        'NetworkAclAssociationId': networkAclAssociationId,
      if (networkAclId != null) 'NetworkAclId': networkAclId,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// Contains details about an EC2 network access control list (ACL).
class AwsEc2NetworkAclDetails {
  /// Associations between the network ACL and subnets.
  final List<AwsEc2NetworkAclAssociation>? associations;

  /// The set of rules in the network ACL.
  final List<AwsEc2NetworkAclEntry>? entries;

  /// Whether this is the default network ACL for the VPC.
  final bool? isDefault;

  /// The identifier of the network ACL.
  final String? networkAclId;

  /// The identifier of the AWS account that owns the network ACL.
  final String? ownerId;

  /// The identifier of the VPC for the network ACL.
  final String? vpcId;

  AwsEc2NetworkAclDetails({
    this.associations,
    this.entries,
    this.isDefault,
    this.networkAclId,
    this.ownerId,
    this.vpcId,
  });

  factory AwsEc2NetworkAclDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkAclDetails(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEc2NetworkAclAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      entries: (json['Entries'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2NetworkAclEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDefault: json['IsDefault'] as bool?,
      networkAclId: json['NetworkAclId'] as String?,
      ownerId: json['OwnerId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final entries = this.entries;
    final isDefault = this.isDefault;
    final networkAclId = this.networkAclId;
    final ownerId = this.ownerId;
    final vpcId = this.vpcId;
    return {
      if (associations != null) 'Associations': associations,
      if (entries != null) 'Entries': entries,
      if (isDefault != null) 'IsDefault': isDefault,
      if (networkAclId != null) 'NetworkAclId': networkAclId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// A rule for the network ACL. Each rule allows or denies access based on the
/// IP address, traffic direction, port, and protocol.
class AwsEc2NetworkAclEntry {
  /// The IPV4 network range for which to deny or allow access.
  final String? cidrBlock;

  /// Whether the rule is an egress rule. An egress rule is a rule that applies to
  /// traffic that leaves the subnet.
  final bool? egress;

  /// The Internet Control Message Protocol (ICMP) type and code for which to deny
  /// or allow access.
  final IcmpTypeCode? icmpTypeCode;

  /// The IPV6 network range for which to deny or allow access.
  final String? ipv6CidrBlock;

  /// For TCP or UDP protocols, the range of ports that the rule applies to.
  final PortRangeFromTo? portRange;

  /// The protocol that the rule applies to. To deny or allow access to all
  /// protocols, use the value -1.
  final String? protocol;

  /// Whether the rule is used to allow access or deny access.
  final String? ruleAction;

  /// The rule number. The rules are processed in order by their number.
  final int? ruleNumber;

  AwsEc2NetworkAclEntry({
    this.cidrBlock,
    this.egress,
    this.icmpTypeCode,
    this.ipv6CidrBlock,
    this.portRange,
    this.protocol,
    this.ruleAction,
    this.ruleNumber,
  });

  factory AwsEc2NetworkAclEntry.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkAclEntry(
      cidrBlock: json['CidrBlock'] as String?,
      egress: json['Egress'] as bool?,
      icmpTypeCode: json['IcmpTypeCode'] != null
          ? IcmpTypeCode.fromJson(json['IcmpTypeCode'] as Map<String, dynamic>)
          : null,
      ipv6CidrBlock: json['Ipv6CidrBlock'] as String?,
      portRange: json['PortRange'] != null
          ? PortRangeFromTo.fromJson(json['PortRange'] as Map<String, dynamic>)
          : null,
      protocol: json['Protocol'] as String?,
      ruleAction: json['RuleAction'] as String?,
      ruleNumber: json['RuleNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlock = this.cidrBlock;
    final egress = this.egress;
    final icmpTypeCode = this.icmpTypeCode;
    final ipv6CidrBlock = this.ipv6CidrBlock;
    final portRange = this.portRange;
    final protocol = this.protocol;
    final ruleAction = this.ruleAction;
    final ruleNumber = this.ruleNumber;
    return {
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (egress != null) 'Egress': egress,
      if (icmpTypeCode != null) 'IcmpTypeCode': icmpTypeCode,
      if (ipv6CidrBlock != null) 'Ipv6CidrBlock': ipv6CidrBlock,
      if (portRange != null) 'PortRange': portRange,
      if (protocol != null) 'Protocol': protocol,
      if (ruleAction != null) 'RuleAction': ruleAction,
      if (ruleNumber != null) 'RuleNumber': ruleNumber,
    };
  }
}

/// Information about the network interface attachment.
class AwsEc2NetworkInterfaceAttachment {
  /// Indicates when the attachment initiated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? attachTime;

  /// The identifier of the network interface attachment
  final String? attachmentId;

  /// Indicates whether the network interface is deleted when the instance is
  /// terminated.
  final bool? deleteOnTermination;

  /// The device index of the network interface attachment on the instance.
  final int? deviceIndex;

  /// The ID of the instance.
  final String? instanceId;

  /// The AWS account ID of the owner of the instance.
  final String? instanceOwnerId;

  /// The attachment state.
  ///
  /// Valid values: <code>attaching</code> | <code>attached</code> |
  /// <code>detaching</code> | <code>detached</code>
  final String? status;

  AwsEc2NetworkInterfaceAttachment({
    this.attachTime,
    this.attachmentId,
    this.deleteOnTermination,
    this.deviceIndex,
    this.instanceId,
    this.instanceOwnerId,
    this.status,
  });

  factory AwsEc2NetworkInterfaceAttachment.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkInterfaceAttachment(
      attachTime: json['AttachTime'] as String?,
      attachmentId: json['AttachmentId'] as String?,
      deleteOnTermination: json['DeleteOnTermination'] as bool?,
      deviceIndex: json['DeviceIndex'] as int?,
      instanceId: json['InstanceId'] as String?,
      instanceOwnerId: json['InstanceOwnerId'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachTime = this.attachTime;
    final attachmentId = this.attachmentId;
    final deleteOnTermination = this.deleteOnTermination;
    final deviceIndex = this.deviceIndex;
    final instanceId = this.instanceId;
    final instanceOwnerId = this.instanceOwnerId;
    final status = this.status;
    return {
      if (attachTime != null) 'AttachTime': attachTime,
      if (attachmentId != null) 'AttachmentId': attachmentId,
      if (deleteOnTermination != null)
        'DeleteOnTermination': deleteOnTermination,
      if (deviceIndex != null) 'DeviceIndex': deviceIndex,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceOwnerId != null) 'InstanceOwnerId': instanceOwnerId,
      if (status != null) 'Status': status,
    };
  }
}

/// Details about the network interface
class AwsEc2NetworkInterfaceDetails {
  /// The network interface attachment.
  final AwsEc2NetworkInterfaceAttachment? attachment;

  /// The IPv6 addresses associated with the network interface.
  final List<AwsEc2NetworkInterfaceIpV6AddressDetail>? ipV6Addresses;

  /// The ID of the network interface.
  final String? networkInterfaceId;

  /// The private IPv4 addresses associated with the network interface.
  final List<AwsEc2NetworkInterfacePrivateIpAddressDetail>? privateIpAddresses;

  /// The public DNS name of the network interface.
  final String? publicDnsName;

  /// The address of the Elastic IP address bound to the network interface.
  final String? publicIp;

  /// Security groups for the network interface.
  final List<AwsEc2NetworkInterfaceSecurityGroup>? securityGroups;

  /// Indicates whether traffic to or from the instance is validated.
  final bool? sourceDestCheck;

  AwsEc2NetworkInterfaceDetails({
    this.attachment,
    this.ipV6Addresses,
    this.networkInterfaceId,
    this.privateIpAddresses,
    this.publicDnsName,
    this.publicIp,
    this.securityGroups,
    this.sourceDestCheck,
  });

  factory AwsEc2NetworkInterfaceDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkInterfaceDetails(
      attachment: json['Attachment'] != null
          ? AwsEc2NetworkInterfaceAttachment.fromJson(
              json['Attachment'] as Map<String, dynamic>)
          : null,
      ipV6Addresses: (json['IpV6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2NetworkInterfaceIpV6AddressDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      networkInterfaceId: json['NetworkInterfaceId'] as String?,
      privateIpAddresses: (json['PrivateIpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2NetworkInterfacePrivateIpAddressDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      publicDnsName: json['PublicDnsName'] as String?,
      publicIp: json['PublicIp'] as String?,
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2NetworkInterfaceSecurityGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      sourceDestCheck: json['SourceDestCheck'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final ipV6Addresses = this.ipV6Addresses;
    final networkInterfaceId = this.networkInterfaceId;
    final privateIpAddresses = this.privateIpAddresses;
    final publicDnsName = this.publicDnsName;
    final publicIp = this.publicIp;
    final securityGroups = this.securityGroups;
    final sourceDestCheck = this.sourceDestCheck;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (ipV6Addresses != null) 'IpV6Addresses': ipV6Addresses,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (privateIpAddresses != null) 'PrivateIpAddresses': privateIpAddresses,
      if (publicDnsName != null) 'PublicDnsName': publicDnsName,
      if (publicIp != null) 'PublicIp': publicIp,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (sourceDestCheck != null) 'SourceDestCheck': sourceDestCheck,
    };
  }
}

/// Provides information about an IPV6 address that is associated with the
/// network interface.
class AwsEc2NetworkInterfaceIpV6AddressDetail {
  /// The IPV6 address.
  final String? ipV6Address;

  AwsEc2NetworkInterfaceIpV6AddressDetail({
    this.ipV6Address,
  });

  factory AwsEc2NetworkInterfaceIpV6AddressDetail.fromJson(
      Map<String, dynamic> json) {
    return AwsEc2NetworkInterfaceIpV6AddressDetail(
      ipV6Address: json['IpV6Address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipV6Address = this.ipV6Address;
    return {
      if (ipV6Address != null) 'IpV6Address': ipV6Address,
    };
  }
}

/// Provides information about a private IPv4 address that is with the network
/// interface.
class AwsEc2NetworkInterfacePrivateIpAddressDetail {
  /// The private DNS name for the IP address.
  final String? privateDnsName;

  /// The IP address.
  final String? privateIpAddress;

  AwsEc2NetworkInterfacePrivateIpAddressDetail({
    this.privateDnsName,
    this.privateIpAddress,
  });

  factory AwsEc2NetworkInterfacePrivateIpAddressDetail.fromJson(
      Map<String, dynamic> json) {
    return AwsEc2NetworkInterfacePrivateIpAddressDetail(
      privateDnsName: json['PrivateDnsName'] as String?,
      privateIpAddress: json['PrivateIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final privateDnsName = this.privateDnsName;
    final privateIpAddress = this.privateIpAddress;
    return {
      if (privateDnsName != null) 'PrivateDnsName': privateDnsName,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
    };
  }
}

/// A security group associated with the network interface.
class AwsEc2NetworkInterfaceSecurityGroup {
  /// The ID of the security group.
  final String? groupId;

  /// The name of the security group.
  final String? groupName;

  AwsEc2NetworkInterfaceSecurityGroup({
    this.groupId,
    this.groupName,
  });

  factory AwsEc2NetworkInterfaceSecurityGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsEc2NetworkInterfaceSecurityGroup(
      groupId: json['GroupId'] as String?,
      groupName: json['GroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
    };
  }
}

/// Details about an EC2 security group.
class AwsEc2SecurityGroupDetails {
  /// The ID of the security group.
  final String? groupId;

  /// The name of the security group.
  final String? groupName;

  /// The inbound rules associated with the security group.
  final List<AwsEc2SecurityGroupIpPermission>? ipPermissions;

  /// [VPC only] The outbound rules associated with the security group.
  final List<AwsEc2SecurityGroupIpPermission>? ipPermissionsEgress;

  /// The AWS account ID of the owner of the security group.
  final String? ownerId;

  /// [VPC only] The ID of the VPC for the security group.
  final String? vpcId;

  AwsEc2SecurityGroupDetails({
    this.groupId,
    this.groupName,
    this.ipPermissions,
    this.ipPermissionsEgress,
    this.ownerId,
    this.vpcId,
  });

  factory AwsEc2SecurityGroupDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2SecurityGroupDetails(
      groupId: json['GroupId'] as String?,
      groupName: json['GroupName'] as String?,
      ipPermissions: (json['IpPermissions'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2SecurityGroupIpPermission.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      ipPermissionsEgress: (json['IpPermissionsEgress'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2SecurityGroupIpPermission.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      ownerId: json['OwnerId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    final ipPermissions = this.ipPermissions;
    final ipPermissionsEgress = this.ipPermissionsEgress;
    final ownerId = this.ownerId;
    final vpcId = this.vpcId;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
      if (ipPermissions != null) 'IpPermissions': ipPermissions,
      if (ipPermissionsEgress != null)
        'IpPermissionsEgress': ipPermissionsEgress,
      if (ownerId != null) 'OwnerId': ownerId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// An IP permission for an EC2 security group.
class AwsEc2SecurityGroupIpPermission {
  /// The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// type number.
  ///
  /// A value of -1 indicates all ICMP/ICMPv6 types. If you specify all
  /// ICMP/ICMPv6 types, you must specify all codes.
  final int? fromPort;

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
  final String? ipProtocol;

  /// The IPv4 ranges.
  final List<AwsEc2SecurityGroupIpRange>? ipRanges;

  /// The IPv6 ranges.
  final List<AwsEc2SecurityGroupIpv6Range>? ipv6Ranges;

  /// [VPC only] The prefix list IDs for an AWS service. With outbound rules, this
  /// is the AWS service to access through a VPC endpoint from instances
  /// associated with the security group.
  final List<AwsEc2SecurityGroupPrefixListId>? prefixListIds;

  /// The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// code.
  ///
  /// A value of -1 indicates all ICMP/ICMPv6 codes. If you specify all
  /// ICMP/ICMPv6 types, you must specify all codes.
  final int? toPort;

  /// The security group and AWS account ID pairs.
  final List<AwsEc2SecurityGroupUserIdGroupPair>? userIdGroupPairs;

  AwsEc2SecurityGroupIpPermission({
    this.fromPort,
    this.ipProtocol,
    this.ipRanges,
    this.ipv6Ranges,
    this.prefixListIds,
    this.toPort,
    this.userIdGroupPairs,
  });

  factory AwsEc2SecurityGroupIpPermission.fromJson(Map<String, dynamic> json) {
    return AwsEc2SecurityGroupIpPermission(
      fromPort: json['FromPort'] as int?,
      ipProtocol: json['IpProtocol'] as String?,
      ipRanges: (json['IpRanges'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEc2SecurityGroupIpRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipv6Ranges: (json['Ipv6Ranges'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEc2SecurityGroupIpv6Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      prefixListIds: (json['PrefixListIds'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2SecurityGroupPrefixListId.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      toPort: json['ToPort'] as int?,
      userIdGroupPairs: (json['UserIdGroupPairs'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEc2SecurityGroupUserIdGroupPair.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fromPort = this.fromPort;
    final ipProtocol = this.ipProtocol;
    final ipRanges = this.ipRanges;
    final ipv6Ranges = this.ipv6Ranges;
    final prefixListIds = this.prefixListIds;
    final toPort = this.toPort;
    final userIdGroupPairs = this.userIdGroupPairs;
    return {
      if (fromPort != null) 'FromPort': fromPort,
      if (ipProtocol != null) 'IpProtocol': ipProtocol,
      if (ipRanges != null) 'IpRanges': ipRanges,
      if (ipv6Ranges != null) 'Ipv6Ranges': ipv6Ranges,
      if (prefixListIds != null) 'PrefixListIds': prefixListIds,
      if (toPort != null) 'ToPort': toPort,
      if (userIdGroupPairs != null) 'UserIdGroupPairs': userIdGroupPairs,
    };
  }
}

/// A range of IPv4 addresses.
class AwsEc2SecurityGroupIpRange {
  /// The IPv4 CIDR range. You can specify either a CIDR range or a source
  /// security group, but not both. To specify a single IPv4 address, use the /32
  /// prefix length.
  final String? cidrIp;

  AwsEc2SecurityGroupIpRange({
    this.cidrIp,
  });

  factory AwsEc2SecurityGroupIpRange.fromJson(Map<String, dynamic> json) {
    return AwsEc2SecurityGroupIpRange(
      cidrIp: json['CidrIp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrIp = this.cidrIp;
    return {
      if (cidrIp != null) 'CidrIp': cidrIp,
    };
  }
}

/// A range of IPv6 addresses.
class AwsEc2SecurityGroupIpv6Range {
  /// The IPv6 CIDR range. You can specify either a CIDR range or a source
  /// security group, but not both. To specify a single IPv6 address, use the /128
  /// prefix length.
  final String? cidrIpv6;

  AwsEc2SecurityGroupIpv6Range({
    this.cidrIpv6,
  });

  factory AwsEc2SecurityGroupIpv6Range.fromJson(Map<String, dynamic> json) {
    return AwsEc2SecurityGroupIpv6Range(
      cidrIpv6: json['CidrIpv6'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrIpv6 = this.cidrIpv6;
    return {
      if (cidrIpv6 != null) 'CidrIpv6': cidrIpv6,
    };
  }
}

/// A prefix list ID.
class AwsEc2SecurityGroupPrefixListId {
  /// The ID of the prefix.
  final String? prefixListId;

  AwsEc2SecurityGroupPrefixListId({
    this.prefixListId,
  });

  factory AwsEc2SecurityGroupPrefixListId.fromJson(Map<String, dynamic> json) {
    return AwsEc2SecurityGroupPrefixListId(
      prefixListId: json['PrefixListId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final prefixListId = this.prefixListId;
    return {
      if (prefixListId != null) 'PrefixListId': prefixListId,
    };
  }
}

/// A relationship between a security group and a user.
class AwsEc2SecurityGroupUserIdGroupPair {
  /// The ID of the security group.
  final String? groupId;

  /// The name of the security group.
  final String? groupName;

  /// The status of a VPC peering connection, if applicable.
  final String? peeringStatus;

  /// The ID of an AWS account.
  ///
  /// For a referenced security group in another VPC, the account ID of the
  /// referenced security group is returned in the response. If the referenced
  /// security group is deleted, this value is not returned.
  ///
  /// [EC2-Classic] Required when adding or removing rules that reference a
  /// security group in another VPC.
  final String? userId;

  /// The ID of the VPC for the referenced security group, if applicable.
  final String? vpcId;

  /// The ID of the VPC peering connection, if applicable.
  final String? vpcPeeringConnectionId;

  AwsEc2SecurityGroupUserIdGroupPair({
    this.groupId,
    this.groupName,
    this.peeringStatus,
    this.userId,
    this.vpcId,
    this.vpcPeeringConnectionId,
  });

  factory AwsEc2SecurityGroupUserIdGroupPair.fromJson(
      Map<String, dynamic> json) {
    return AwsEc2SecurityGroupUserIdGroupPair(
      groupId: json['GroupId'] as String?,
      groupName: json['GroupName'] as String?,
      peeringStatus: json['PeeringStatus'] as String?,
      userId: json['UserId'] as String?,
      vpcId: json['VpcId'] as String?,
      vpcPeeringConnectionId: json['VpcPeeringConnectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    final peeringStatus = this.peeringStatus;
    final userId = this.userId;
    final vpcId = this.vpcId;
    final vpcPeeringConnectionId = this.vpcPeeringConnectionId;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
      if (peeringStatus != null) 'PeeringStatus': peeringStatus,
      if (userId != null) 'UserId': userId,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcPeeringConnectionId != null)
        'VpcPeeringConnectionId': vpcPeeringConnectionId,
    };
  }
}

/// Contains information about a subnet in EC2.
class AwsEc2SubnetDetails {
  /// Whether to assign an IPV6 address to a network interface that is created in
  /// this subnet.
  final bool? assignIpv6AddressOnCreation;

  /// The Availability Zone for the subnet.
  final String? availabilityZone;

  /// The identifier of the Availability Zone for the subnet.
  final String? availabilityZoneId;

  /// The number of available IPV4 addresses in the subnet. Does not include
  /// addresses for stopped instances.
  final int? availableIpAddressCount;

  /// The IPV4 CIDR block that is assigned to the subnet.
  final String? cidrBlock;

  /// Whether this subnet is the default subnet for the Availability Zone.
  final bool? defaultForAz;

  /// The IPV6 CIDR blocks that are associated with the subnet.
  final List<Ipv6CidrBlockAssociation>? ipv6CidrBlockAssociationSet;

  /// Whether instances in this subnet receive a public IP address.
  final bool? mapPublicIpOnLaunch;

  /// The identifier of the AWS account that owns the subnet.
  final String? ownerId;

  /// The current state of the subnet.
  final String? state;

  /// The ARN of the subnet.
  final String? subnetArn;

  /// The identifier of the subnet.
  final String? subnetId;

  /// The identifier of the VPC that contains the subnet.
  final String? vpcId;

  AwsEc2SubnetDetails({
    this.assignIpv6AddressOnCreation,
    this.availabilityZone,
    this.availabilityZoneId,
    this.availableIpAddressCount,
    this.cidrBlock,
    this.defaultForAz,
    this.ipv6CidrBlockAssociationSet,
    this.mapPublicIpOnLaunch,
    this.ownerId,
    this.state,
    this.subnetArn,
    this.subnetId,
    this.vpcId,
  });

  factory AwsEc2SubnetDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2SubnetDetails(
      assignIpv6AddressOnCreation: json['AssignIpv6AddressOnCreation'] as bool?,
      availabilityZone: json['AvailabilityZone'] as String?,
      availabilityZoneId: json['AvailabilityZoneId'] as String?,
      availableIpAddressCount: json['AvailableIpAddressCount'] as int?,
      cidrBlock: json['CidrBlock'] as String?,
      defaultForAz: json['DefaultForAz'] as bool?,
      ipv6CidrBlockAssociationSet:
          (json['Ipv6CidrBlockAssociationSet'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  Ipv6CidrBlockAssociation.fromJson(e as Map<String, dynamic>))
              .toList(),
      mapPublicIpOnLaunch: json['MapPublicIpOnLaunch'] as bool?,
      ownerId: json['OwnerId'] as String?,
      state: json['State'] as String?,
      subnetArn: json['SubnetArn'] as String?,
      subnetId: json['SubnetId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignIpv6AddressOnCreation = this.assignIpv6AddressOnCreation;
    final availabilityZone = this.availabilityZone;
    final availabilityZoneId = this.availabilityZoneId;
    final availableIpAddressCount = this.availableIpAddressCount;
    final cidrBlock = this.cidrBlock;
    final defaultForAz = this.defaultForAz;
    final ipv6CidrBlockAssociationSet = this.ipv6CidrBlockAssociationSet;
    final mapPublicIpOnLaunch = this.mapPublicIpOnLaunch;
    final ownerId = this.ownerId;
    final state = this.state;
    final subnetArn = this.subnetArn;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    return {
      if (assignIpv6AddressOnCreation != null)
        'AssignIpv6AddressOnCreation': assignIpv6AddressOnCreation,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (availableIpAddressCount != null)
        'AvailableIpAddressCount': availableIpAddressCount,
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (defaultForAz != null) 'DefaultForAz': defaultForAz,
      if (ipv6CidrBlockAssociationSet != null)
        'Ipv6CidrBlockAssociationSet': ipv6CidrBlockAssociationSet,
      if (mapPublicIpOnLaunch != null)
        'MapPublicIpOnLaunch': mapPublicIpOnLaunch,
      if (ownerId != null) 'OwnerId': ownerId,
      if (state != null) 'State': state,
      if (subnetArn != null) 'SubnetArn': subnetArn,
      if (subnetId != null) 'SubnetId': subnetId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// An attachment to an AWS EC2 volume.
class AwsEc2VolumeAttachment {
  /// The datetime when the attachment initiated.
  final String? attachTime;

  /// Whether the EBS volume is deleted when the EC2 instance is terminated.
  final bool? deleteOnTermination;

  /// The identifier of the EC2 instance.
  final String? instanceId;

  /// The attachment state of the volume.
  final String? status;

  AwsEc2VolumeAttachment({
    this.attachTime,
    this.deleteOnTermination,
    this.instanceId,
    this.status,
  });

  factory AwsEc2VolumeAttachment.fromJson(Map<String, dynamic> json) {
    return AwsEc2VolumeAttachment(
      attachTime: json['AttachTime'] as String?,
      deleteOnTermination: json['DeleteOnTermination'] as bool?,
      instanceId: json['InstanceId'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachTime = this.attachTime;
    final deleteOnTermination = this.deleteOnTermination;
    final instanceId = this.instanceId;
    final status = this.status;
    return {
      if (attachTime != null) 'AttachTime': attachTime,
      if (deleteOnTermination != null)
        'DeleteOnTermination': deleteOnTermination,
      if (instanceId != null) 'InstanceId': instanceId,
      if (status != null) 'Status': status,
    };
  }
}

/// Details about an EC2 volume.
class AwsEc2VolumeDetails {
  /// The volume attachments.
  final List<AwsEc2VolumeAttachment>? attachments;

  /// Indicates when the volume was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createTime;

  /// Whether the volume is encrypted.
  final bool? encrypted;

  /// The ARN of the AWS Key Management Service (AWS KMS) customer master key
  /// (CMK) that was used to protect the volume encryption key for the volume.
  final String? kmsKeyId;

  /// The size of the volume, in GiBs.
  final int? size;

  /// The snapshot from which the volume was created.
  final String? snapshotId;

  /// The volume state.
  final String? status;

  AwsEc2VolumeDetails({
    this.attachments,
    this.createTime,
    this.encrypted,
    this.kmsKeyId,
    this.size,
    this.snapshotId,
    this.status,
  });

  factory AwsEc2VolumeDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2VolumeDetails(
      attachments: (json['Attachments'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AwsEc2VolumeAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: json['CreateTime'] as String?,
      encrypted: json['Encrypted'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      size: json['Size'] as int?,
      snapshotId: json['SnapshotId'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final createTime = this.createTime;
    final encrypted = this.encrypted;
    final kmsKeyId = this.kmsKeyId;
    final size = this.size;
    final snapshotId = this.snapshotId;
    final status = this.status;
    return {
      if (attachments != null) 'Attachments': attachments,
      if (createTime != null) 'CreateTime': createTime,
      if (encrypted != null) 'Encrypted': encrypted,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (size != null) 'Size': size,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (status != null) 'Status': status,
    };
  }
}

/// Details about an EC2 VPC.
class AwsEc2VpcDetails {
  /// Information about the IPv4 CIDR blocks associated with the VPC.
  final List<CidrBlockAssociation>? cidrBlockAssociationSet;

  /// The identifier of the set of Dynamic Host Configuration Protocol (DHCP)
  /// options that are associated with the VPC. If the default options are
  /// associated with the VPC, then this is default.
  final String? dhcpOptionsId;

  /// Information about the IPv6 CIDR blocks associated with the VPC.
  final List<Ipv6CidrBlockAssociation>? ipv6CidrBlockAssociationSet;

  /// The current state of the VPC.
  final String? state;

  AwsEc2VpcDetails({
    this.cidrBlockAssociationSet,
    this.dhcpOptionsId,
    this.ipv6CidrBlockAssociationSet,
    this.state,
  });

  factory AwsEc2VpcDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2VpcDetails(
      cidrBlockAssociationSet: (json['CidrBlockAssociationSet'] as List?)
          ?.whereNotNull()
          .map((e) => CidrBlockAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      dhcpOptionsId: json['DhcpOptionsId'] as String?,
      ipv6CidrBlockAssociationSet:
          (json['Ipv6CidrBlockAssociationSet'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  Ipv6CidrBlockAssociation.fromJson(e as Map<String, dynamic>))
              .toList(),
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlockAssociationSet = this.cidrBlockAssociationSet;
    final dhcpOptionsId = this.dhcpOptionsId;
    final ipv6CidrBlockAssociationSet = this.ipv6CidrBlockAssociationSet;
    final state = this.state;
    return {
      if (cidrBlockAssociationSet != null)
        'CidrBlockAssociationSet': cidrBlockAssociationSet,
      if (dhcpOptionsId != null) 'DhcpOptionsId': dhcpOptionsId,
      if (ipv6CidrBlockAssociationSet != null)
        'Ipv6CidrBlockAssociationSet': ipv6CidrBlockAssociationSet,
      if (state != null) 'State': state,
    };
  }
}

/// Indicates whether to enable CloudWatch Container Insights for the ECS
/// cluster.
class AwsEcsClusterClusterSettingsDetails {
  /// The name of the setting.
  final String? name;

  /// The value of the setting.
  final String? value;

  AwsEcsClusterClusterSettingsDetails({
    this.name,
    this.value,
  });

  factory AwsEcsClusterClusterSettingsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsClusterClusterSettingsDetails(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// The run command configuration for the cluster.
class AwsEcsClusterConfigurationDetails {
  /// Contains the run command configuration for the cluster.
  final AwsEcsClusterConfigurationExecuteCommandConfigurationDetails?
      executeCommandConfiguration;

  AwsEcsClusterConfigurationDetails({
    this.executeCommandConfiguration,
  });

  factory AwsEcsClusterConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsClusterConfigurationDetails(
      executeCommandConfiguration: json['ExecuteCommandConfiguration'] != null
          ? AwsEcsClusterConfigurationExecuteCommandConfigurationDetails
              .fromJson(
                  json['ExecuteCommandConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executeCommandConfiguration = this.executeCommandConfiguration;
    return {
      if (executeCommandConfiguration != null)
        'ExecuteCommandConfiguration': executeCommandConfiguration,
    };
  }
}

/// Contains the run command configuration for the cluster.
class AwsEcsClusterConfigurationExecuteCommandConfigurationDetails {
  /// The identifier of the KMS key that is used to encrypt the data between the
  /// local client and the container.
  final String? kmsKeyId;

  /// The log configuration for the results of the run command actions. Required
  /// if <code>Logging</code> is <code>NONE</code>.
  final AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails?
      logConfiguration;

  /// The log setting to use for redirecting logs for run command results.
  final String? logging;

  AwsEcsClusterConfigurationExecuteCommandConfigurationDetails({
    this.kmsKeyId,
    this.logConfiguration,
    this.logging,
  });

  factory AwsEcsClusterConfigurationExecuteCommandConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsClusterConfigurationExecuteCommandConfigurationDetails(
      kmsKeyId: json['KmsKeyId'] as String?,
      logConfiguration: json['LogConfiguration'] != null
          ? AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails
              .fromJson(json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      logging: json['Logging'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final logConfiguration = this.logConfiguration;
    final logging = this.logging;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (logging != null) 'Logging': logging,
    };
  }
}

/// The log configuration for the results of the run command actions.
class AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails {
  /// Whether to enable encryption on the CloudWatch logs.
  final bool? cloudWatchEncryptionEnabled;

  /// The name of the CloudWatch log group to send the logs to.
  final String? cloudWatchLogGroupName;

  /// The name of the S3 bucket to send logs to.
  final String? s3BucketName;

  /// Whether to encrypt the logs that are sent to the S3 bucket.
  final bool? s3EncryptionEnabled;

  /// Identifies the folder in the S3 bucket to send the logs to.
  final String? s3KeyPrefix;

  AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails({
    this.cloudWatchEncryptionEnabled,
    this.cloudWatchLogGroupName,
    this.s3BucketName,
    this.s3EncryptionEnabled,
    this.s3KeyPrefix,
  });

  factory AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsClusterConfigurationExecuteCommandConfigurationLogConfigurationDetails(
      cloudWatchEncryptionEnabled: json['CloudWatchEncryptionEnabled'] as bool?,
      cloudWatchLogGroupName: json['CloudWatchLogGroupName'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3EncryptionEnabled: json['S3EncryptionEnabled'] as bool?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchEncryptionEnabled = this.cloudWatchEncryptionEnabled;
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final s3BucketName = this.s3BucketName;
    final s3EncryptionEnabled = this.s3EncryptionEnabled;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      if (cloudWatchEncryptionEnabled != null)
        'CloudWatchEncryptionEnabled': cloudWatchEncryptionEnabled,
      if (cloudWatchLogGroupName != null)
        'CloudWatchLogGroupName': cloudWatchLogGroupName,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3EncryptionEnabled != null)
        'S3EncryptionEnabled': s3EncryptionEnabled,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// The default capacity provider strategy for the cluster. The default capacity
/// provider strategy is used when services or tasks are run without a specified
/// launch type or capacity provider strategy.
class AwsEcsClusterDefaultCapacityProviderStrategyDetails {
  /// The minimum number of tasks to run on the specified capacity provider.
  final int? base;

  /// The name of the capacity provider.
  final String? capacityProvider;

  /// The relative percentage of the total number of tasks launched that should
  /// use the capacity provider.
  final int? weight;

  AwsEcsClusterDefaultCapacityProviderStrategyDetails({
    this.base,
    this.capacityProvider,
    this.weight,
  });

  factory AwsEcsClusterDefaultCapacityProviderStrategyDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsClusterDefaultCapacityProviderStrategyDetails(
      base: json['Base'] as int?,
      capacityProvider: json['CapacityProvider'] as String?,
      weight: json['Weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final base = this.base;
    final capacityProvider = this.capacityProvider;
    final weight = this.weight;
    return {
      if (base != null) 'Base': base,
      if (capacityProvider != null) 'CapacityProvider': capacityProvider,
      if (weight != null) 'Weight': weight,
    };
  }
}

/// provides details about an ECS cluster.
class AwsEcsClusterDetails {
  /// The short name of one or more capacity providers to associate with the
  /// cluster.
  final List<String>? capacityProviders;

  /// The setting to use to create the cluster. Specifically used to configure
  /// whether to enable CloudWatch Container Insights for the cluster.
  final List<AwsEcsClusterClusterSettingsDetails>? clusterSettings;

  /// The run command configuration for the cluster.
  final AwsEcsClusterConfigurationDetails? configuration;

  /// The default capacity provider strategy for the cluster. The default capacity
  /// provider strategy is used when services or tasks are run without a specified
  /// launch type or capacity provider strategy.
  final List<AwsEcsClusterDefaultCapacityProviderStrategyDetails>?
      defaultCapacityProviderStrategy;

  AwsEcsClusterDetails({
    this.capacityProviders,
    this.clusterSettings,
    this.configuration,
    this.defaultCapacityProviderStrategy,
  });

  factory AwsEcsClusterDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcsClusterDetails(
      capacityProviders: (json['CapacityProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      clusterSettings: (json['ClusterSettings'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsClusterClusterSettingsDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      configuration: json['Configuration'] != null
          ? AwsEcsClusterConfigurationDetails.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      defaultCapacityProviderStrategy:
          (json['DefaultCapacityProviderStrategy'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  AwsEcsClusterDefaultCapacityProviderStrategyDetails.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviders = this.capacityProviders;
    final clusterSettings = this.clusterSettings;
    final configuration = this.configuration;
    final defaultCapacityProviderStrategy =
        this.defaultCapacityProviderStrategy;
    return {
      if (capacityProviders != null) 'CapacityProviders': capacityProviders,
      if (clusterSettings != null) 'ClusterSettings': clusterSettings,
      if (configuration != null) 'Configuration': configuration,
      if (defaultCapacityProviderStrategy != null)
        'DefaultCapacityProviderStrategy': defaultCapacityProviderStrategy,
    };
  }
}

/// A dependency that is defined for container startup and shutdown.
class AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails {
  /// The dependency condition of the dependent container. Indicates the required
  /// status of the dependent container before the current container can start.
  final String? condition;

  /// The name of the dependent container.
  final String? containerName;

  AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails({
    this.condition,
    this.containerName,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails(
      condition: json['Condition'] as String?,
      containerName: json['ContainerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final containerName = this.containerName;
    return {
      if (condition != null) 'Condition': condition,
      if (containerName != null) 'ContainerName': containerName,
    };
  }
}

/// A container definition that describes a container in the task.
class AwsEcsTaskDefinitionContainerDefinitionsDetails {
  /// The command that is passed to the container.
  final List<String>? command;

  /// The number of CPU units reserved for the container.
  final int? cpu;

  /// The dependencies that are defined for container startup and shutdown.
  final List<AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails>?
      dependsOn;

  /// Whether to disable networking within the container.
  final bool? disableNetworking;

  /// A list of DNS search domains that are presented to the container.
  final List<String>? dnsSearchDomains;

  /// A list of DNS servers that are presented to the container.
  final List<String>? dnsServers;

  /// A key-value map of labels to add to the container.
  final Map<String, String>? dockerLabels;

  /// A list of strings to provide custom labels for SELinux and AppArmor
  /// multi-level security systems.
  final List<String>? dockerSecurityOptions;

  /// The entry point that is passed to the container.
  final List<String>? entryPoint;

  /// The environment variables to pass to a container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails>?
      environment;

  /// A list of files containing the environment variables to pass to a container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails>?
      environmentFiles;

  /// Whether the container is essential. All tasks must have at least one
  /// essential container.
  final bool? essential;

  /// A list of hostnames and IP address mappings to append to the
  /// <b>/etc/hosts</b> file on the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails>?
      extraHosts;

  /// The FireLens configuration for the container. Specifies and configures a log
  /// router for container logs.
  final AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails?
      firelensConfiguration;

  /// The container health check command and associated configuration parameters
  /// for the container.
  final AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails? healthCheck;

  /// The hostname to use for the container.
  final String? hostname;

  /// The image used to start the container.
  final String? image;

  /// If set to true, then containerized applications can be deployed that require
  /// <code>stdin</code> or a <code>tty</code> to be allocated.
  final bool? interactive;

  /// A list of links for the container in the form <code>
  /// <i>container_name</i>:<i>alias</i> </code>. Allows containers to communicate
  /// with each other without the need for port mappings.
  final List<String>? links;

  /// Linux-specific modifications that are applied to the container, such as
  /// Linux kernel capabilities.
  final AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails?
      linuxParameters;

  /// The log configuration specification for the container.
  final AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails?
      logConfiguration;

  /// The amount (in MiB) of memory to present to the container. If the container
  /// attempts to exceed the memory specified here, the container is shut down.
  /// The total amount of memory reserved for all containers within a task must be
  /// lower than the task memory value, if one is specified.
  final int? memory;

  /// The soft limit (in MiB) of memory to reserve for the container.
  final int? memoryReservation;

  /// The mount points for the data volumes in the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails>?
      mountPoints;

  /// The name of the container.
  final String? name;

  /// The list of port mappings for the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails>?
      portMappings;

  /// Whether the container is given elevated privileges on the host container
  /// instance. The elevated privileges are similar to the root user.
  final bool? privileged;

  /// Whether to allocate a TTY to the container.
  final bool? pseudoTerminal;

  /// Whether the container is given read-only access to its root file system.
  final bool? readonlyRootFilesystem;

  /// The private repository authentication credentials to use.
  final AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails?
      repositoryCredentials;

  /// The type and amount of a resource to assign to a container. The only
  /// supported resource is a GPU.
  final List<
          AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails>?
      resourceRequirements;

  /// The secrets to pass to the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails>? secrets;

  /// The number of seconds to wait before giving up on resolving dependencies for
  /// a container.
  final int? startTimeout;

  /// The number of seconds to wait before the container is stopped if it doesn't
  /// shut down normally on its own.
  final int? stopTimeout;

  /// A list of namespaced kernel parameters to set in the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails>?
      systemControls;

  /// A list of ulimits to set in the container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails>? ulimits;

  /// The user to use inside the container.
  ///
  /// The value can use one of the following formats.
  ///
  /// <ul>
  /// <li>
  /// <code> <i>user</i> </code>
  /// </li>
  /// <li>
  /// <code> <i>user</i> </code>:<code> <i>group</i> </code>
  /// </li>
  /// <li>
  /// <code> <i>uid</i> </code>
  /// </li>
  /// <li>
  /// <code> <i>uid</i> </code>:<code> <i>gid</i> </code>
  /// </li>
  /// <li>
  /// <code> <i>user</i> </code>:<code> <i>gid</i> </code>
  /// </li>
  /// <li>
  /// <code> <i>uid</i> </code>:<code> <i>group</i> </code>
  /// </li>
  /// </ul>
  final String? user;

  /// Data volumes to mount from another container.
  final List<AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails>?
      volumesFrom;

  /// The working directory in which to run commands inside the container.
  final String? workingDirectory;

  AwsEcsTaskDefinitionContainerDefinitionsDetails({
    this.command,
    this.cpu,
    this.dependsOn,
    this.disableNetworking,
    this.dnsSearchDomains,
    this.dnsServers,
    this.dockerLabels,
    this.dockerSecurityOptions,
    this.entryPoint,
    this.environment,
    this.environmentFiles,
    this.essential,
    this.extraHosts,
    this.firelensConfiguration,
    this.healthCheck,
    this.hostname,
    this.image,
    this.interactive,
    this.links,
    this.linuxParameters,
    this.logConfiguration,
    this.memory,
    this.memoryReservation,
    this.mountPoints,
    this.name,
    this.portMappings,
    this.privileged,
    this.pseudoTerminal,
    this.readonlyRootFilesystem,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.secrets,
    this.startTimeout,
    this.stopTimeout,
    this.systemControls,
    this.ulimits,
    this.user,
    this.volumesFrom,
    this.workingDirectory,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsDetails(
      command: (json['Command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpu: json['Cpu'] as int?,
      dependsOn: (json['DependsOn'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsDependsOnDetails.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      disableNetworking: json['DisableNetworking'] as bool?,
      dnsSearchDomains: (json['DnsSearchDomains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dnsServers: (json['DnsServers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dockerLabels: (json['DockerLabels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      dockerSecurityOptions: (json['DockerSecurityOptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entryPoint: (json['EntryPoint'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environment: (json['Environment'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentFiles: (json['EnvironmentFiles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      essential: json['Essential'] as bool?,
      extraHosts: (json['ExtraHosts'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      firelensConfiguration: json['FirelensConfiguration'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails
              .fromJson(json['FirelensConfiguration'] as Map<String, dynamic>)
          : null,
      healthCheck: json['HealthCheck'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails.fromJson(
              json['HealthCheck'] as Map<String, dynamic>)
          : null,
      hostname: json['Hostname'] as String?,
      image: json['Image'] as String?,
      interactive: json['Interactive'] as bool?,
      links: (json['Links'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      linuxParameters: json['LinuxParameters'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails
              .fromJson(json['LinuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['LogConfiguration'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails
              .fromJson(json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      memory: json['Memory'] as int?,
      memoryReservation: json['MemoryReservation'] as int?,
      mountPoints: (json['MountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      portMappings: (json['PortMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      privileged: json['Privileged'] as bool?,
      pseudoTerminal: json['PseudoTerminal'] as bool?,
      readonlyRootFilesystem: json['ReadonlyRootFilesystem'] as bool?,
      repositoryCredentials: json['RepositoryCredentials'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails
              .fromJson(json['RepositoryCredentials'] as Map<String, dynamic>)
          : null,
      resourceRequirements: (json['ResourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      secrets: (json['Secrets'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      startTimeout: json['StartTimeout'] as int?,
      stopTimeout: json['StopTimeout'] as int?,
      systemControls: (json['SystemControls'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      ulimits: (json['Ulimits'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      user: json['User'] as String?,
      volumesFrom: (json['VolumesFrom'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final cpu = this.cpu;
    final dependsOn = this.dependsOn;
    final disableNetworking = this.disableNetworking;
    final dnsSearchDomains = this.dnsSearchDomains;
    final dnsServers = this.dnsServers;
    final dockerLabels = this.dockerLabels;
    final dockerSecurityOptions = this.dockerSecurityOptions;
    final entryPoint = this.entryPoint;
    final environment = this.environment;
    final environmentFiles = this.environmentFiles;
    final essential = this.essential;
    final extraHosts = this.extraHosts;
    final firelensConfiguration = this.firelensConfiguration;
    final healthCheck = this.healthCheck;
    final hostname = this.hostname;
    final image = this.image;
    final interactive = this.interactive;
    final links = this.links;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final memory = this.memory;
    final memoryReservation = this.memoryReservation;
    final mountPoints = this.mountPoints;
    final name = this.name;
    final portMappings = this.portMappings;
    final privileged = this.privileged;
    final pseudoTerminal = this.pseudoTerminal;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final secrets = this.secrets;
    final startTimeout = this.startTimeout;
    final stopTimeout = this.stopTimeout;
    final systemControls = this.systemControls;
    final ulimits = this.ulimits;
    final user = this.user;
    final volumesFrom = this.volumesFrom;
    final workingDirectory = this.workingDirectory;
    return {
      if (command != null) 'Command': command,
      if (cpu != null) 'Cpu': cpu,
      if (dependsOn != null) 'DependsOn': dependsOn,
      if (disableNetworking != null) 'DisableNetworking': disableNetworking,
      if (dnsSearchDomains != null) 'DnsSearchDomains': dnsSearchDomains,
      if (dnsServers != null) 'DnsServers': dnsServers,
      if (dockerLabels != null) 'DockerLabels': dockerLabels,
      if (dockerSecurityOptions != null)
        'DockerSecurityOptions': dockerSecurityOptions,
      if (entryPoint != null) 'EntryPoint': entryPoint,
      if (environment != null) 'Environment': environment,
      if (environmentFiles != null) 'EnvironmentFiles': environmentFiles,
      if (essential != null) 'Essential': essential,
      if (extraHosts != null) 'ExtraHosts': extraHosts,
      if (firelensConfiguration != null)
        'FirelensConfiguration': firelensConfiguration,
      if (healthCheck != null) 'HealthCheck': healthCheck,
      if (hostname != null) 'Hostname': hostname,
      if (image != null) 'Image': image,
      if (interactive != null) 'Interactive': interactive,
      if (links != null) 'Links': links,
      if (linuxParameters != null) 'LinuxParameters': linuxParameters,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (memory != null) 'Memory': memory,
      if (memoryReservation != null) 'MemoryReservation': memoryReservation,
      if (mountPoints != null) 'MountPoints': mountPoints,
      if (name != null) 'Name': name,
      if (portMappings != null) 'PortMappings': portMappings,
      if (privileged != null) 'Privileged': privileged,
      if (pseudoTerminal != null) 'PseudoTerminal': pseudoTerminal,
      if (readonlyRootFilesystem != null)
        'ReadonlyRootFilesystem': readonlyRootFilesystem,
      if (repositoryCredentials != null)
        'RepositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'ResourceRequirements': resourceRequirements,
      if (secrets != null) 'Secrets': secrets,
      if (startTimeout != null) 'StartTimeout': startTimeout,
      if (stopTimeout != null) 'StopTimeout': stopTimeout,
      if (systemControls != null) 'SystemControls': systemControls,
      if (ulimits != null) 'Ulimits': ulimits,
      if (user != null) 'User': user,
      if (volumesFrom != null) 'VolumesFrom': volumesFrom,
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

/// An environment variable to pass to the container.
class AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails {
  /// The name of the environment variable.
  final String? name;

  /// The value of the environment variable.
  final String? value;

  AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails({
    this.name,
    this.value,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsEnvironmentDetails(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// A file that contain environment variables to pass to a container.
class AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails {
  /// The type of environment file.
  final String? type;

  /// The ARN of the S3 object that contains the environment variable file.
  final String? value;

  AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails({
    this.type,
    this.value,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsEnvironmentFilesDetails(
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

/// A hostname and IP address mapping to append to the <b>/etc/hosts</b> file on
/// the container.
class AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails {
  /// The hostname to use in the <b>/etc/hosts</b> entry.
  final String? hostname;

  /// The IP address to use in the <b>/etc/hosts</b> entry.
  final String? ipAddress;

  AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails({
    this.hostname,
    this.ipAddress,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsExtraHostsDetails(
      hostname: json['Hostname'] as String?,
      ipAddress: json['IpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final ipAddress = this.ipAddress;
    return {
      if (hostname != null) 'Hostname': hostname,
      if (ipAddress != null) 'IpAddress': ipAddress,
    };
  }
}

/// The FireLens configuration for the container. The configuration specifies
/// and configures a log router for container logs.
class AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails {
  /// The options to use to configure the log router.
  ///
  /// The valid option keys are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>enable-ecs-log-metadata</code>. The value can be <code>true</code> or
  /// <code>false</code>.
  /// </li>
  /// <li>
  /// <code>config-file-type</code>. The value can be <code>s3</code> or
  /// <code>file</code>.
  /// </li>
  /// <li>
  /// <code>config-file-value</code>. The value is either an S3 ARN or a file
  /// path.
  /// </li>
  /// </ul>
  final Map<String, String>? options;

  /// The log router to use.
  final String? type;

  AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails({
    this.options,
    this.type,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsFirelensConfigurationDetails(
      options: (json['Options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final type = this.type;
    return {
      if (options != null) 'Options': options,
      if (type != null) 'Type': type,
    };
  }
}

/// The container health check command and associated configuration parameters
/// for the container.
class AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails {
  /// The command that the container runs to determine whether it is healthy.
  final List<String>? command;

  /// The time period in seconds between each health check execution. The default
  /// value is 30 seconds.
  final int? interval;

  /// The number of times to retry a failed health check before the container is
  /// considered unhealthy. The default value is 3.
  final int? retries;

  /// The optional grace period in seconds that allows containers time to
  /// bootstrap before failed health checks count towards the maximum number of
  /// retries.
  final int? startPeriod;

  /// The time period in seconds to wait for a health check to succeed before it
  /// is considered a failure. The default value is 5.
  final int? timeout;

  AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails({
    this.command,
    this.interval,
    this.retries,
    this.startPeriod,
    this.timeout,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsHealthCheckDetails(
      command: (json['Command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      interval: json['Interval'] as int?,
      retries: json['Retries'] as int?,
      startPeriod: json['StartPeriod'] as int?,
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final interval = this.interval;
    final retries = this.retries;
    final startPeriod = this.startPeriod;
    final timeout = this.timeout;
    return {
      if (command != null) 'Command': command,
      if (interval != null) 'Interval': interval,
      if (retries != null) 'Retries': retries,
      if (startPeriod != null) 'StartPeriod': startPeriod,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// The Linux capabilities for the container that are added to or dropped from
/// the default configuration provided by Docker.
class AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails {
  /// The Linux capabilities for the container that are added to the default
  /// configuration provided by Docker.
  final List<String>? add;

  /// The Linux capabilities for the container that are dropped from the default
  /// configuration provided by Docker.
  final List<String>? drop;

  AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails({
    this.add,
    this.drop,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails(
      add: (json['Add'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      drop: (json['Drop'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final add = this.add;
    final drop = this.drop;
    return {
      if (add != null) 'Add': add,
      if (drop != null) 'Drop': drop,
    };
  }
}

/// &gt;Linux-specific modifications that are applied to the container, such as
/// Linux kernel capabilities.
class AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails {
  /// The Linux capabilities for the container that are added to or dropped from
  /// the default configuration provided by Docker.
  final AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails?
      capabilities;

  /// The host devices to expose to the container.
  final List<
          AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails>?
      devices;

  /// Whether to run an <code>init</code> process inside the container that
  /// forwards signals and reaps processes.
  final bool? initProcessEnabled;

  /// The total amount of swap memory (in MiB) that a container can use.
  final int? maxSwap;

  /// The value for the size (in MiB) of the <b>/dev/shm</b> volume.
  final int? sharedMemorySize;

  /// Configures the container's memory swappiness behavior. Determines how
  /// aggressively pages are swapped. The higher the value, the more aggressive
  /// the swappiness. The default is 60.
  final int? swappiness;

  /// The container path, mount options, and size (in MiB) of the tmpfs mount.
  final List<
          AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails>?
      tmpfs;

  AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails({
    this.capabilities,
    this.devices,
    this.initProcessEnabled,
    this.maxSwap,
    this.sharedMemorySize,
    this.swappiness,
    this.tmpfs,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDetails(
      capabilities: json['Capabilities'] != null
          ? AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersCapabilitiesDetails
              .fromJson(json['Capabilities'] as Map<String, dynamic>)
          : null,
      devices: (json['Devices'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      initProcessEnabled: json['InitProcessEnabled'] as bool?,
      maxSwap: json['MaxSwap'] as int?,
      sharedMemorySize: json['SharedMemorySize'] as int?,
      swappiness: json['Swappiness'] as int?,
      tmpfs: (json['Tmpfs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final devices = this.devices;
    final initProcessEnabled = this.initProcessEnabled;
    final maxSwap = this.maxSwap;
    final sharedMemorySize = this.sharedMemorySize;
    final swappiness = this.swappiness;
    final tmpfs = this.tmpfs;
    return {
      if (capabilities != null) 'Capabilities': capabilities,
      if (devices != null) 'Devices': devices,
      if (initProcessEnabled != null) 'InitProcessEnabled': initProcessEnabled,
      if (maxSwap != null) 'MaxSwap': maxSwap,
      if (sharedMemorySize != null) 'SharedMemorySize': sharedMemorySize,
      if (swappiness != null) 'Swappiness': swappiness,
      if (tmpfs != null) 'Tmpfs': tmpfs,
    };
  }
}

/// A host device to expose to the container.
class AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails {
  /// The path inside the container at which to expose the host device.
  final String? containerPath;

  /// The path for the device on the host container instance.
  final String? hostPath;

  /// The explicit permissions to provide to the container for the device. By
  /// default, the container has permissions for read, write, and
  /// <code>mknod</code> for the device.
  final List<String>? permissions;

  AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails({
    this.containerPath,
    this.hostPath,
    this.permissions,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersDevicesDetails(
      containerPath: json['ContainerPath'] as String?,
      hostPath: json['HostPath'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerPath = this.containerPath;
    final hostPath = this.hostPath;
    final permissions = this.permissions;
    return {
      if (containerPath != null) 'ContainerPath': containerPath,
      if (hostPath != null) 'HostPath': hostPath,
      if (permissions != null) 'Permissions': permissions,
    };
  }
}

/// The container path, mount options, and size (in MiB) of a tmpfs mount.
class AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails {
  /// The absolute file path where the tmpfs volume is to be mounted.
  final String? containerPath;

  /// The list of tmpfs volume mount options.
  final List<String>? mountOptions;

  /// The maximum size (in MiB) of the tmpfs volume.
  final int? size;

  AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails({
    this.containerPath,
    this.mountOptions,
    this.size,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLinuxParametersTmpfsDetails(
      containerPath: json['ContainerPath'] as String?,
      mountOptions: (json['MountOptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerPath = this.containerPath;
    final mountOptions = this.mountOptions;
    final size = this.size;
    return {
      if (containerPath != null) 'ContainerPath': containerPath,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (size != null) 'Size': size,
    };
  }
}

/// The log configuration specification for the container.
class AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails {
  /// The log driver to use for the container.
  final String? logDriver;

  /// The configuration options to send to the log driver. Requires version 1.19
  /// of the Docker Remote API or greater on your container instance.
  final Map<String, String>? options;

  /// The secrets to pass to the log configuration.
  final List<
          AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails>?
      secretOptions;

  AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails({
    this.logDriver,
    this.options,
    this.secretOptions,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationDetails(
      logDriver: json['LogDriver'] as String?,
      options: (json['Options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      secretOptions: (json['SecretOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDriver = this.logDriver;
    final options = this.options;
    final secretOptions = this.secretOptions;
    return {
      if (logDriver != null) 'LogDriver': logDriver,
      if (options != null) 'Options': options,
      if (secretOptions != null) 'SecretOptions': secretOptions,
    };
  }
}

/// A secret to pass to the log configuration.
class AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails {
  /// The name of the secret.
  final String? name;

  /// The secret to expose to the container.
  ///
  /// The value is either the full ARN of the Secrets Manager secret or the full
  /// ARN of the parameter in the Systems Manager Parameter Store.
  final String? valueFrom;

  AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails({
    this.name,
    this.valueFrom,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsLogConfigurationSecretOptionsDetails(
      name: json['Name'] as String?,
      valueFrom: json['ValueFrom'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final valueFrom = this.valueFrom;
    return {
      if (name != null) 'Name': name,
      if (valueFrom != null) 'ValueFrom': valueFrom,
    };
  }
}

/// A mount point for the data volumes in the container.
class AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails {
  /// The path on the container to mount the host volume at.
  final String? containerPath;

  /// Whether the container has read-only access to the volume.
  final bool? readOnly;

  /// The name of the volume to mount. Must match the name of a volume listed in
  /// <code>VolumeDetails</code> for the task definition.
  final String? sourceVolume;

  AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails({
    this.containerPath,
    this.readOnly,
    this.sourceVolume,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsMountPointsDetails(
      containerPath: json['ContainerPath'] as String?,
      readOnly: json['ReadOnly'] as bool?,
      sourceVolume: json['SourceVolume'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerPath = this.containerPath;
    final readOnly = this.readOnly;
    final sourceVolume = this.sourceVolume;
    return {
      if (containerPath != null) 'ContainerPath': containerPath,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (sourceVolume != null) 'SourceVolume': sourceVolume,
    };
  }
}

/// A port mapping for the container.
class AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails {
  /// The port number on the container that is bound to the user-specified or
  /// automatically assigned host port.
  final int? containerPort;

  /// The port number on the container instance to reserve for the container.
  final int? hostPort;

  /// The protocol used for the port mapping. The default is <code>tcp</code>.
  final String? protocol;

  AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails({
    this.containerPort,
    this.hostPort,
    this.protocol,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsPortMappingsDetails(
      containerPort: json['ContainerPort'] as int?,
      hostPort: json['HostPort'] as int?,
      protocol: json['Protocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerPort = this.containerPort;
    final hostPort = this.hostPort;
    final protocol = this.protocol;
    return {
      if (containerPort != null) 'ContainerPort': containerPort,
      if (hostPort != null) 'HostPort': hostPort,
      if (protocol != null) 'Protocol': protocol,
    };
  }
}

/// The private repository authentication credentials to use.
class AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails {
  /// The ARN of the secret that contains the private repository credentials.
  final String? credentialsParameter;

  AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails({
    this.credentialsParameter,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsRepositoryCredentialsDetails(
      credentialsParameter: json['CredentialsParameter'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialsParameter = this.credentialsParameter;
    return {
      if (credentialsParameter != null)
        'CredentialsParameter': credentialsParameter,
    };
  }
}

/// A resource to assign to a container.
class AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails {
  /// The type of resource to assign to a container.
  final String? type;

  /// The value for the specified resource type.
  ///
  /// For <code>GPU</code>, the value is the number of physical GPUs the Amazon
  /// ECS container agent reserves for the container.
  ///
  /// For <code>InferenceAccelerator</code>, the value should match the
  /// <code>DeviceName</code> attribute of an entry in
  /// <code>InferenceAccelerators</code>.
  final String? value;

  AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails({
    this.type,
    this.value,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsResourceRequirementsDetails(
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

/// A secret to pass to the container.
class AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails {
  /// The name of the secret.
  final String? name;

  /// The secret to expose to the container. The value is either the full ARN of
  /// the Secrets Manager secret or the full ARN of the parameter in the Systems
  /// Manager Parameter Store.
  final String? valueFrom;

  AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails({
    this.name,
    this.valueFrom,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsSecretsDetails(
      name: json['Name'] as String?,
      valueFrom: json['ValueFrom'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final valueFrom = this.valueFrom;
    return {
      if (name != null) 'Name': name,
      if (valueFrom != null) 'ValueFrom': valueFrom,
    };
  }
}

/// A namespaced kernel parameter to set in the container.
class AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails {
  /// The namespaced kernel parameter for which to set a value.
  final String? namespace;

  /// The value of the parameter.
  final String? value;

  AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails({
    this.namespace,
    this.value,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsSystemControlsDetails(
      namespace: json['Namespace'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final value = this.value;
    return {
      if (namespace != null) 'Namespace': namespace,
      if (value != null) 'Value': value,
    };
  }
}

/// A ulimit to set in the container.
class AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails {
  /// The hard limit for the ulimit type.
  final int? hardLimit;

  /// The type of the ulimit.
  final String? name;

  /// The soft limit for the ulimit type.
  final int? softLimit;

  AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails({
    this.hardLimit,
    this.name,
    this.softLimit,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsUlimitsDetails(
      hardLimit: json['HardLimit'] as int?,
      name: json['Name'] as String?,
      softLimit: json['SoftLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hardLimit = this.hardLimit;
    final name = this.name;
    final softLimit = this.softLimit;
    return {
      if (hardLimit != null) 'HardLimit': hardLimit,
      if (name != null) 'Name': name,
      if (softLimit != null) 'SoftLimit': softLimit,
    };
  }
}

/// A data volume to mount from another container.
class AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails {
  /// Whether the container has read-only access to the volume.
  final bool? readOnly;

  /// The name of another container within the same task definition from which to
  /// mount volumes.
  final String? sourceContainer;

  AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails({
    this.readOnly,
    this.sourceContainer,
  });

  factory AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionContainerDefinitionsVolumesFromDetails(
      readOnly: json['ReadOnly'] as bool?,
      sourceContainer: json['SourceContainer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readOnly = this.readOnly;
    final sourceContainer = this.sourceContainer;
    return {
      if (readOnly != null) 'ReadOnly': readOnly,
      if (sourceContainer != null) 'SourceContainer': sourceContainer,
    };
  }
}

/// details about a task definition. A task definition describes the container
/// and volume definitions of an Amazon Elastic Container Service task.
class AwsEcsTaskDefinitionDetails {
  /// The container definitions that describe the containers that make up the
  /// task.
  final List<AwsEcsTaskDefinitionContainerDefinitionsDetails>?
      containerDefinitions;

  /// The number of CPU units used by the task.
  final String? cpu;

  /// The ARN of the task execution role that grants the container agent
  /// permission to make API calls on behalf of the container user.
  final String? executionRoleArn;

  /// The name of a family that this task definition is registered to.
  final String? family;

  /// The Elastic Inference accelerators to use for the containers in the task.
  final List<AwsEcsTaskDefinitionInferenceAcceleratorsDetails>?
      inferenceAccelerators;

  /// The IPC resource namespace to use for the containers in the task.
  final String? ipcMode;

  /// The amount (in MiB) of memory used by the task.
  final String? memory;

  /// The Docker networking mode to use for the containers in the task.
  final String? networkMode;

  /// The process namespace to use for the containers in the task.
  final String? pidMode;

  /// The placement constraint objects to use for tasks.
  final List<AwsEcsTaskDefinitionPlacementConstraintsDetails>?
      placementConstraints;

  /// The configuration details for the App Mesh proxy.
  final AwsEcsTaskDefinitionProxyConfigurationDetails? proxyConfiguration;

  /// The task launch types that the task definition was validated against.
  final List<String>? requiresCompatibilities;

  /// The short name or ARN of the IAM role that grants containers in the task
  /// permission to call AWS API operations on your behalf.
  final String? taskRoleArn;

  /// The data volume definitions for the task.
  final List<AwsEcsTaskDefinitionVolumesDetails>? volumes;

  AwsEcsTaskDefinitionDetails({
    this.containerDefinitions,
    this.cpu,
    this.executionRoleArn,
    this.family,
    this.inferenceAccelerators,
    this.ipcMode,
    this.memory,
    this.networkMode,
    this.pidMode,
    this.placementConstraints,
    this.proxyConfiguration,
    this.requiresCompatibilities,
    this.taskRoleArn,
    this.volumes,
  });

  factory AwsEcsTaskDefinitionDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionDetails(
      containerDefinitions: (json['ContainerDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionContainerDefinitionsDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      cpu: json['Cpu'] as String?,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      family: json['Family'] as String?,
      inferenceAccelerators: (json['InferenceAccelerators'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionInferenceAcceleratorsDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      ipcMode: json['IpcMode'] as String?,
      memory: json['Memory'] as String?,
      networkMode: json['NetworkMode'] as String?,
      pidMode: json['PidMode'] as String?,
      placementConstraints: (json['PlacementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionPlacementConstraintsDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      proxyConfiguration: json['ProxyConfiguration'] != null
          ? AwsEcsTaskDefinitionProxyConfigurationDetails.fromJson(
              json['ProxyConfiguration'] as Map<String, dynamic>)
          : null,
      requiresCompatibilities: (json['RequiresCompatibilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskRoleArn: json['TaskRoleArn'] as String?,
      volumes: (json['Volumes'] as List?)
          ?.whereNotNull()
          .map((e) => AwsEcsTaskDefinitionVolumesDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerDefinitions = this.containerDefinitions;
    final cpu = this.cpu;
    final executionRoleArn = this.executionRoleArn;
    final family = this.family;
    final inferenceAccelerators = this.inferenceAccelerators;
    final ipcMode = this.ipcMode;
    final memory = this.memory;
    final networkMode = this.networkMode;
    final pidMode = this.pidMode;
    final placementConstraints = this.placementConstraints;
    final proxyConfiguration = this.proxyConfiguration;
    final requiresCompatibilities = this.requiresCompatibilities;
    final taskRoleArn = this.taskRoleArn;
    final volumes = this.volumes;
    return {
      if (containerDefinitions != null)
        'ContainerDefinitions': containerDefinitions,
      if (cpu != null) 'Cpu': cpu,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (family != null) 'Family': family,
      if (inferenceAccelerators != null)
        'InferenceAccelerators': inferenceAccelerators,
      if (ipcMode != null) 'IpcMode': ipcMode,
      if (memory != null) 'Memory': memory,
      if (networkMode != null) 'NetworkMode': networkMode,
      if (pidMode != null) 'PidMode': pidMode,
      if (placementConstraints != null)
        'PlacementConstraints': placementConstraints,
      if (proxyConfiguration != null) 'ProxyConfiguration': proxyConfiguration,
      if (requiresCompatibilities != null)
        'RequiresCompatibilities': requiresCompatibilities,
      if (taskRoleArn != null) 'TaskRoleArn': taskRoleArn,
      if (volumes != null) 'Volumes': volumes,
    };
  }
}

/// An Elastic Inference accelerator to use for the containers in the task.
class AwsEcsTaskDefinitionInferenceAcceleratorsDetails {
  /// The Elastic Inference accelerator device name.
  final String? deviceName;

  /// The Elastic Inference accelerator type to use.
  final String? deviceType;

  AwsEcsTaskDefinitionInferenceAcceleratorsDetails({
    this.deviceName,
    this.deviceType,
  });

  factory AwsEcsTaskDefinitionInferenceAcceleratorsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionInferenceAcceleratorsDetails(
      deviceName: json['DeviceName'] as String?,
      deviceType: json['DeviceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final deviceType = this.deviceType;
    return {
      if (deviceName != null) 'DeviceName': deviceName,
      if (deviceType != null) 'DeviceType': deviceType,
    };
  }
}

/// A placement constraint object to use for tasks.
class AwsEcsTaskDefinitionPlacementConstraintsDetails {
  /// A cluster query language expression to apply to the constraint.
  final String? expression;

  /// The type of constraint.
  final String? type;

  AwsEcsTaskDefinitionPlacementConstraintsDetails({
    this.expression,
    this.type,
  });

  factory AwsEcsTaskDefinitionPlacementConstraintsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionPlacementConstraintsDetails(
      expression: json['Expression'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'Expression': expression,
      if (type != null) 'Type': type,
    };
  }
}

/// The configuration details for the App Mesh proxy.
class AwsEcsTaskDefinitionProxyConfigurationDetails {
  /// The name of the container that will serve as the App Mesh proxy.
  final String? containerName;

  /// The set of network configuration parameters to provide to the Container
  /// Network Interface (CNI) plugin, specified as key-value pairs.
  final List<
          AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails>?
      proxyConfigurationProperties;

  /// The proxy type.
  final String? type;

  AwsEcsTaskDefinitionProxyConfigurationDetails({
    this.containerName,
    this.proxyConfigurationProperties,
    this.type,
  });

  factory AwsEcsTaskDefinitionProxyConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionProxyConfigurationDetails(
      containerName: json['ContainerName'] as String?,
      proxyConfigurationProperties: (json['ProxyConfigurationProperties']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final proxyConfigurationProperties = this.proxyConfigurationProperties;
    final type = this.type;
    return {
      if (containerName != null) 'ContainerName': containerName,
      if (proxyConfigurationProperties != null)
        'ProxyConfigurationProperties': proxyConfigurationProperties,
      if (type != null) 'Type': type,
    };
  }
}

/// A network configuration parameter to provide to the Container Network
/// Interface (CNI) plugin.
class AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails {
  /// The name of the property.
  final String? name;

  /// The value of the property.
  final String? value;

  AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails({
    this.name,
    this.value,
  });

  factory AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionProxyConfigurationProxyConfigurationPropertiesDetails(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// A data volume to mount from another container.
class AwsEcsTaskDefinitionVolumesDetails {
  /// Information about a Docker volume.
  final AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails?
      dockerVolumeConfiguration;

  /// Information about the Amazon Elastic File System file system that is used
  /// for task storage.
  final AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails?
      efsVolumeConfiguration;

  /// Information about a bind mount host volume.
  final AwsEcsTaskDefinitionVolumesHostDetails? host;

  /// The name of the data volume.
  final String? name;

  AwsEcsTaskDefinitionVolumesDetails({
    this.dockerVolumeConfiguration,
    this.efsVolumeConfiguration,
    this.host,
    this.name,
  });

  factory AwsEcsTaskDefinitionVolumesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionVolumesDetails(
      dockerVolumeConfiguration: json['DockerVolumeConfiguration'] != null
          ? AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails
              .fromJson(
                  json['DockerVolumeConfiguration'] as Map<String, dynamic>)
          : null,
      efsVolumeConfiguration: json['EfsVolumeConfiguration'] != null
          ? AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails.fromJson(
              json['EfsVolumeConfiguration'] as Map<String, dynamic>)
          : null,
      host: json['Host'] != null
          ? AwsEcsTaskDefinitionVolumesHostDetails.fromJson(
              json['Host'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dockerVolumeConfiguration = this.dockerVolumeConfiguration;
    final efsVolumeConfiguration = this.efsVolumeConfiguration;
    final host = this.host;
    final name = this.name;
    return {
      if (dockerVolumeConfiguration != null)
        'DockerVolumeConfiguration': dockerVolumeConfiguration,
      if (efsVolumeConfiguration != null)
        'EfsVolumeConfiguration': efsVolumeConfiguration,
      if (host != null) 'Host': host,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about a Docker volume.
class AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails {
  /// Whether to create the Docker volume automatically if it does not already
  /// exist.
  final bool? autoprovision;

  /// The Docker volume driver to use.
  final String? driver;

  /// A map of Docker driver-specific options that are passed through.
  final Map<String, String>? driverOpts;

  /// Custom metadata to add to the Docker volume.
  final Map<String, String>? labels;

  /// The scope for the Docker volume that determines its lifecycle. Docker
  /// volumes that are scoped to a task are provisioned automatically when the
  /// task starts and destroyed when the task stops. Docker volumes that are
  /// shared persist after the task stops.
  final String? scope;

  AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails({
    this.autoprovision,
    this.driver,
    this.driverOpts,
    this.labels,
    this.scope,
  });

  factory AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionVolumesDockerVolumeConfigurationDetails(
      autoprovision: json['Autoprovision'] as bool?,
      driver: json['Driver'] as String?,
      driverOpts: (json['DriverOpts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      labels: (json['Labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      scope: json['Scope'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoprovision = this.autoprovision;
    final driver = this.driver;
    final driverOpts = this.driverOpts;
    final labels = this.labels;
    final scope = this.scope;
    return {
      if (autoprovision != null) 'Autoprovision': autoprovision,
      if (driver != null) 'Driver': driver,
      if (driverOpts != null) 'DriverOpts': driverOpts,
      if (labels != null) 'Labels': labels,
      if (scope != null) 'Scope': scope,
    };
  }
}

/// <p/>
class AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails {
  /// The Amazon EFS access point identifier to use.
  final String? accessPointId;

  /// Whether to use the Amazon ECS task IAM role defined in a task definition
  /// when mounting the Amazon EFS file system.
  final String? iam;

  AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails({
    this.accessPointId,
    this.iam,
  });

  factory AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails(
      accessPointId: json['AccessPointId'] as String?,
      iam: json['Iam'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointId = this.accessPointId;
    final iam = this.iam;
    return {
      if (accessPointId != null) 'AccessPointId': accessPointId,
      if (iam != null) 'Iam': iam,
    };
  }
}

/// Information about the Amazon Elastic File System file system that is used
/// for task storage.
class AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails {
  /// The authorization configuration details for the Amazon EFS file system.
  final AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails?
      authorizationConfig;

  /// The Amazon EFS file system identifier to use.
  final String? filesystemId;

  /// The directory within the Amazon EFS file system to mount as the root
  /// directory inside the host.
  final String? rootDirectory;

  /// Whether to enable encryption for Amazon EFS data in transit between the
  /// Amazon ECS host and the Amazon EFS server.
  final String? transitEncryption;

  /// The port to use when sending encrypted data between the Amazon ECS host and
  /// the Amazon EFS server.
  final int? transitEncryptionPort;

  AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails({
    this.authorizationConfig,
    this.filesystemId,
    this.rootDirectory,
    this.transitEncryption,
    this.transitEncryptionPort,
  });

  factory AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationDetails(
      authorizationConfig: json['AuthorizationConfig'] != null
          ? AwsEcsTaskDefinitionVolumesEfsVolumeConfigurationAuthorizationConfigDetails
              .fromJson(json['AuthorizationConfig'] as Map<String, dynamic>)
          : null,
      filesystemId: json['FilesystemId'] as String?,
      rootDirectory: json['RootDirectory'] as String?,
      transitEncryption: json['TransitEncryption'] as String?,
      transitEncryptionPort: json['TransitEncryptionPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final filesystemId = this.filesystemId;
    final rootDirectory = this.rootDirectory;
    final transitEncryption = this.transitEncryption;
    final transitEncryptionPort = this.transitEncryptionPort;
    return {
      if (authorizationConfig != null)
        'AuthorizationConfig': authorizationConfig,
      if (filesystemId != null) 'FilesystemId': filesystemId,
      if (rootDirectory != null) 'RootDirectory': rootDirectory,
      if (transitEncryption != null) 'TransitEncryption': transitEncryption,
      if (transitEncryptionPort != null)
        'TransitEncryptionPort': transitEncryptionPort,
    };
  }
}

/// Information about a bind mount host volume.
class AwsEcsTaskDefinitionVolumesHostDetails {
  /// The path on the host container instance that is presented to the container.
  final String? sourcePath;

  AwsEcsTaskDefinitionVolumesHostDetails({
    this.sourcePath,
  });

  factory AwsEcsTaskDefinitionVolumesHostDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsEcsTaskDefinitionVolumesHostDetails(
      sourcePath: json['SourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourcePath = this.sourcePath;
    return {
      if (sourcePath != null) 'SourcePath': sourcePath,
    };
  }
}

/// Contains details about an Elastic Beanstalk environment.
class AwsElasticBeanstalkEnvironmentDetails {
  /// The name of the application that is associated with the environment.
  final String? applicationName;

  /// The URL to the CNAME for this environment.
  final String? cname;

  /// The creation date for this environment.
  final String? dateCreated;

  /// The date when this environment was last modified.
  final String? dateUpdated;

  /// A description of the environment.
  final String? description;

  /// For load-balanced, autoscaling environments, the URL to the load balancer.
  /// For single-instance environments, the IP address of the instance.
  final String? endpointUrl;

  /// The ARN of the environment.
  final String? environmentArn;

  /// The identifier of the environment.
  final String? environmentId;

  /// Links to other environments in the same group.
  final List<AwsElasticBeanstalkEnvironmentEnvironmentLink>? environmentLinks;

  /// The name of the environment.
  final String? environmentName;

  /// The configuration setting for the environment.
  final List<AwsElasticBeanstalkEnvironmentOptionSetting>? optionSettings;

  /// The ARN of the platform version for the environment.
  final String? platformArn;

  /// The name of the solution stack that is deployed with the environment.
  final String? solutionStackName;

  /// The current operational status of the environment.
  final String? status;

  /// The tier of the environment.
  final AwsElasticBeanstalkEnvironmentTier? tier;

  /// The application version of the environment.
  final String? versionLabel;

  AwsElasticBeanstalkEnvironmentDetails({
    this.applicationName,
    this.cname,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.endpointUrl,
    this.environmentArn,
    this.environmentId,
    this.environmentLinks,
    this.environmentName,
    this.optionSettings,
    this.platformArn,
    this.solutionStackName,
    this.status,
    this.tier,
    this.versionLabel,
  });

  factory AwsElasticBeanstalkEnvironmentDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticBeanstalkEnvironmentDetails(
      applicationName: json['ApplicationName'] as String?,
      cname: json['Cname'] as String?,
      dateCreated: json['DateCreated'] as String?,
      dateUpdated: json['DateUpdated'] as String?,
      description: json['Description'] as String?,
      endpointUrl: json['EndpointUrl'] as String?,
      environmentArn: json['EnvironmentArn'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      environmentLinks: (json['EnvironmentLinks'] as List?)
          ?.whereNotNull()
          .map((e) => AwsElasticBeanstalkEnvironmentEnvironmentLink.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      environmentName: json['EnvironmentName'] as String?,
      optionSettings: (json['OptionSettings'] as List?)
          ?.whereNotNull()
          .map((e) => AwsElasticBeanstalkEnvironmentOptionSetting.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      platformArn: json['PlatformArn'] as String?,
      solutionStackName: json['SolutionStackName'] as String?,
      status: json['Status'] as String?,
      tier: json['Tier'] != null
          ? AwsElasticBeanstalkEnvironmentTier.fromJson(
              json['Tier'] as Map<String, dynamic>)
          : null,
      versionLabel: json['VersionLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final cname = this.cname;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final endpointUrl = this.endpointUrl;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentLinks = this.environmentLinks;
    final environmentName = this.environmentName;
    final optionSettings = this.optionSettings;
    final platformArn = this.platformArn;
    final solutionStackName = this.solutionStackName;
    final status = this.status;
    final tier = this.tier;
    final versionLabel = this.versionLabel;
    return {
      if (applicationName != null) 'ApplicationName': applicationName,
      if (cname != null) 'Cname': cname,
      if (dateCreated != null) 'DateCreated': dateCreated,
      if (dateUpdated != null) 'DateUpdated': dateUpdated,
      if (description != null) 'Description': description,
      if (endpointUrl != null) 'EndpointUrl': endpointUrl,
      if (environmentArn != null) 'EnvironmentArn': environmentArn,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (environmentLinks != null) 'EnvironmentLinks': environmentLinks,
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (platformArn != null) 'PlatformArn': platformArn,
      if (solutionStackName != null) 'SolutionStackName': solutionStackName,
      if (status != null) 'Status': status,
      if (tier != null) 'Tier': tier,
      if (versionLabel != null) 'VersionLabel': versionLabel,
    };
  }
}

/// Contains information about a link to another environment that is in the same
/// group.
class AwsElasticBeanstalkEnvironmentEnvironmentLink {
  /// The name of the linked environment.
  final String? environmentName;

  /// The name of the environment link.
  final String? linkName;

  AwsElasticBeanstalkEnvironmentEnvironmentLink({
    this.environmentName,
    this.linkName,
  });

  factory AwsElasticBeanstalkEnvironmentEnvironmentLink.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticBeanstalkEnvironmentEnvironmentLink(
      environmentName: json['EnvironmentName'] as String?,
      linkName: json['LinkName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentName = this.environmentName;
    final linkName = this.linkName;
    return {
      if (environmentName != null) 'EnvironmentName': environmentName,
      if (linkName != null) 'LinkName': linkName,
    };
  }
}

/// A configuration option setting for the environment.
class AwsElasticBeanstalkEnvironmentOptionSetting {
  /// The type of resource that the configuration option is associated with.
  final String? namespace;

  /// The name of the option.
  final String? optionName;

  /// The name of the resource.
  final String? resourceName;

  /// The value of the configuration setting.
  final String? value;

  AwsElasticBeanstalkEnvironmentOptionSetting({
    this.namespace,
    this.optionName,
    this.resourceName,
    this.value,
  });

  factory AwsElasticBeanstalkEnvironmentOptionSetting.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticBeanstalkEnvironmentOptionSetting(
      namespace: json['Namespace'] as String?,
      optionName: json['OptionName'] as String?,
      resourceName: json['ResourceName'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final optionName = this.optionName;
    final resourceName = this.resourceName;
    final value = this.value;
    return {
      if (namespace != null) 'Namespace': namespace,
      if (optionName != null) 'OptionName': optionName,
      if (resourceName != null) 'ResourceName': resourceName,
      if (value != null) 'Value': value,
    };
  }
}

/// Contains information about the tier of the environment.
class AwsElasticBeanstalkEnvironmentTier {
  /// The name of the environment tier.
  final String? name;

  /// The type of environment tier.
  final String? type;

  /// The version of the environment tier.
  final String? version;

  AwsElasticBeanstalkEnvironmentTier({
    this.name,
    this.type,
    this.version,
  });

  factory AwsElasticBeanstalkEnvironmentTier.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticBeanstalkEnvironmentTier(
      name: json['Name'] as String?,
      type: json['Type'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
      if (version != null) 'Version': version,
    };
  }
}

/// Information about an Elasticsearch domain.
class AwsElasticsearchDomainDetails {
  /// IAM policy document specifying the access policies for the new Amazon ES
  /// domain.
  final String? accessPolicies;

  /// Additional options for the domain endpoint.
  final AwsElasticsearchDomainDomainEndpointOptions? domainEndpointOptions;

  /// Unique identifier for an Amazon ES domain.
  final String? domainId;

  /// Name of an Amazon ES domain.
  ///
  /// Domain names are unique across all domains owned by the same account within
  /// an AWS Region.
  ///
  /// Domain names must start with a lowercase letter and must be between 3 and 28
  /// characters.
  ///
  /// Valid characters are a-z (lowercase only), 0-9, and – (hyphen).
  final String? domainName;

  /// Elasticsearch version.
  final String? elasticsearchVersion;

  /// Details about the configuration for encryption at rest.
  final AwsElasticsearchDomainEncryptionAtRestOptions? encryptionAtRestOptions;

  /// Domain-specific endpoint used to submit index, search, and data upload
  /// requests to an Amazon ES domain.
  ///
  /// The endpoint is a service URL.
  final String? endpoint;

  /// The key-value pair that exists if the Amazon ES domain uses VPC endpoints.
  final Map<String, String>? endpoints;

  /// Configures the CloudWatch Logs to publish for the Elasticsearch domain.
  final AwsElasticsearchDomainLogPublishingOptions? logPublishingOptions;

  /// Details about the configuration for node-to-node encryption.
  final AwsElasticsearchDomainNodeToNodeEncryptionOptions?
      nodeToNodeEncryptionOptions;

  /// Information about the status of a domain relative to the latest service
  /// software.
  final AwsElasticsearchDomainServiceSoftwareOptions? serviceSoftwareOptions;

  /// Information that Amazon ES derives based on <code>VPCOptions</code> for the
  /// domain.
  final AwsElasticsearchDomainVPCOptions? vPCOptions;

  AwsElasticsearchDomainDetails({
    this.accessPolicies,
    this.domainEndpointOptions,
    this.domainId,
    this.domainName,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpoints,
    this.logPublishingOptions,
    this.nodeToNodeEncryptionOptions,
    this.serviceSoftwareOptions,
    this.vPCOptions,
  });

  factory AwsElasticsearchDomainDetails.fromJson(Map<String, dynamic> json) {
    return AwsElasticsearchDomainDetails(
      accessPolicies: json['AccessPolicies'] as String?,
      domainEndpointOptions: json['DomainEndpointOptions'] != null
          ? AwsElasticsearchDomainDomainEndpointOptions.fromJson(
              json['DomainEndpointOptions'] as Map<String, dynamic>)
          : null,
      domainId: json['DomainId'] as String?,
      domainName: json['DomainName'] as String?,
      elasticsearchVersion: json['ElasticsearchVersion'] as String?,
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? AwsElasticsearchDomainEncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] as String?,
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      logPublishingOptions: json['LogPublishingOptions'] != null
          ? AwsElasticsearchDomainLogPublishingOptions.fromJson(
              json['LogPublishingOptions'] as Map<String, dynamic>)
          : null,
      nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] != null
          ? AwsElasticsearchDomainNodeToNodeEncryptionOptions.fromJson(
              json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>)
          : null,
      serviceSoftwareOptions: json['ServiceSoftwareOptions'] != null
          ? AwsElasticsearchDomainServiceSoftwareOptions.fromJson(
              json['ServiceSoftwareOptions'] as Map<String, dynamic>)
          : null,
      vPCOptions: json['VPCOptions'] != null
          ? AwsElasticsearchDomainVPCOptions.fromJson(
              json['VPCOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicies = this.accessPolicies;
    final domainEndpointOptions = this.domainEndpointOptions;
    final domainId = this.domainId;
    final domainName = this.domainName;
    final elasticsearchVersion = this.elasticsearchVersion;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final endpoint = this.endpoint;
    final endpoints = this.endpoints;
    final logPublishingOptions = this.logPublishingOptions;
    final nodeToNodeEncryptionOptions = this.nodeToNodeEncryptionOptions;
    final serviceSoftwareOptions = this.serviceSoftwareOptions;
    final vPCOptions = this.vPCOptions;
    return {
      if (accessPolicies != null) 'AccessPolicies': accessPolicies,
      if (domainEndpointOptions != null)
        'DomainEndpointOptions': domainEndpointOptions,
      if (domainId != null) 'DomainId': domainId,
      if (domainName != null) 'DomainName': domainName,
      if (elasticsearchVersion != null)
        'ElasticsearchVersion': elasticsearchVersion,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpoints != null) 'Endpoints': endpoints,
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (nodeToNodeEncryptionOptions != null)
        'NodeToNodeEncryptionOptions': nodeToNodeEncryptionOptions,
      if (serviceSoftwareOptions != null)
        'ServiceSoftwareOptions': serviceSoftwareOptions,
      if (vPCOptions != null) 'VPCOptions': vPCOptions,
    };
  }
}

/// Additional options for the domain endpoint, such as whether to require HTTPS
/// for all traffic.
class AwsElasticsearchDomainDomainEndpointOptions {
  /// Whether to require that all traffic to the domain arrive over HTTPS.
  final bool? enforceHTTPS;

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
  final String? tLSSecurityPolicy;

  AwsElasticsearchDomainDomainEndpointOptions({
    this.enforceHTTPS,
    this.tLSSecurityPolicy,
  });

  factory AwsElasticsearchDomainDomainEndpointOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainDomainEndpointOptions(
      enforceHTTPS: json['EnforceHTTPS'] as bool?,
      tLSSecurityPolicy: json['TLSSecurityPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enforceHTTPS = this.enforceHTTPS;
    final tLSSecurityPolicy = this.tLSSecurityPolicy;
    return {
      if (enforceHTTPS != null) 'EnforceHTTPS': enforceHTTPS,
      if (tLSSecurityPolicy != null) 'TLSSecurityPolicy': tLSSecurityPolicy,
    };
  }
}

/// Details about the configuration for encryption at rest.
class AwsElasticsearchDomainEncryptionAtRestOptions {
  /// Whether encryption at rest is enabled.
  final bool? enabled;

  /// The KMS key ID. Takes the form 1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a.
  final String? kmsKeyId;

  AwsElasticsearchDomainEncryptionAtRestOptions({
    this.enabled,
    this.kmsKeyId,
  });

  factory AwsElasticsearchDomainEncryptionAtRestOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainEncryptionAtRestOptions(
      enabled: json['Enabled'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final kmsKeyId = this.kmsKeyId;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// configures the CloudWatch Logs to publish for the Elasticsearch domain.
class AwsElasticsearchDomainLogPublishingOptions {
  /// Configures the Elasticsearch index logs publishing.
  final AwsElasticsearchDomainLogPublishingOptionsLogConfig? indexSlowLogs;

  /// Configures the Elasticsearch search slow log publishing.
  final AwsElasticsearchDomainLogPublishingOptionsLogConfig? searchSlowLogs;

  AwsElasticsearchDomainLogPublishingOptions({
    this.indexSlowLogs,
    this.searchSlowLogs,
  });

  factory AwsElasticsearchDomainLogPublishingOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainLogPublishingOptions(
      indexSlowLogs: json['IndexSlowLogs'] != null
          ? AwsElasticsearchDomainLogPublishingOptionsLogConfig.fromJson(
              json['IndexSlowLogs'] as Map<String, dynamic>)
          : null,
      searchSlowLogs: json['SearchSlowLogs'] != null
          ? AwsElasticsearchDomainLogPublishingOptionsLogConfig.fromJson(
              json['SearchSlowLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexSlowLogs = this.indexSlowLogs;
    final searchSlowLogs = this.searchSlowLogs;
    return {
      if (indexSlowLogs != null) 'IndexSlowLogs': indexSlowLogs,
      if (searchSlowLogs != null) 'SearchSlowLogs': searchSlowLogs,
    };
  }
}

/// The log configuration.
class AwsElasticsearchDomainLogPublishingOptionsLogConfig {
  /// The ARN of the CloudWatch Logs group to publish the logs to.
  final String? cloudWatchLogsLogGroupArn;

  /// Whether the log publishing is enabled.
  final bool? enabled;

  AwsElasticsearchDomainLogPublishingOptionsLogConfig({
    this.cloudWatchLogsLogGroupArn,
    this.enabled,
  });

  factory AwsElasticsearchDomainLogPublishingOptionsLogConfig.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainLogPublishingOptionsLogConfig(
      cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String?,
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroupArn = this.cloudWatchLogsLogGroupArn;
    final enabled = this.enabled;
    return {
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Details about the configuration for node-to-node encryption.
class AwsElasticsearchDomainNodeToNodeEncryptionOptions {
  /// Whether node-to-node encryption is enabled.
  final bool? enabled;

  AwsElasticsearchDomainNodeToNodeEncryptionOptions({
    this.enabled,
  });

  factory AwsElasticsearchDomainNodeToNodeEncryptionOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainNodeToNodeEncryptionOptions(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Information about the state of the domain relative to the latest service
/// software.
class AwsElasticsearchDomainServiceSoftwareOptions {
  /// The epoch time when the deployment window closes for required updates. After
  /// this time, Amazon Elasticsearch Service schedules the software upgrade
  /// automatically.
  final String? automatedUpdateDate;

  /// Whether a request to update the domain can be canceled.
  final bool? cancellable;

  /// The version of the service software that is currently installed on the
  /// domain.
  final String? currentVersion;

  /// A more detailed description of the service software status.
  final String? description;

  /// The most recent version of the service software.
  final String? newVersion;

  /// Whether a service software update is available for the domain.
  final bool? updateAvailable;

  /// The status of the service software update.
  final String? updateStatus;

  AwsElasticsearchDomainServiceSoftwareOptions({
    this.automatedUpdateDate,
    this.cancellable,
    this.currentVersion,
    this.description,
    this.newVersion,
    this.updateAvailable,
    this.updateStatus,
  });

  factory AwsElasticsearchDomainServiceSoftwareOptions.fromJson(
      Map<String, dynamic> json) {
    return AwsElasticsearchDomainServiceSoftwareOptions(
      automatedUpdateDate: json['AutomatedUpdateDate'] as String?,
      cancellable: json['Cancellable'] as bool?,
      currentVersion: json['CurrentVersion'] as String?,
      description: json['Description'] as String?,
      newVersion: json['NewVersion'] as String?,
      updateAvailable: json['UpdateAvailable'] as bool?,
      updateStatus: json['UpdateStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedUpdateDate = this.automatedUpdateDate;
    final cancellable = this.cancellable;
    final currentVersion = this.currentVersion;
    final description = this.description;
    final newVersion = this.newVersion;
    final updateAvailable = this.updateAvailable;
    final updateStatus = this.updateStatus;
    return {
      if (automatedUpdateDate != null)
        'AutomatedUpdateDate': automatedUpdateDate,
      if (cancellable != null) 'Cancellable': cancellable,
      if (currentVersion != null) 'CurrentVersion': currentVersion,
      if (description != null) 'Description': description,
      if (newVersion != null) 'NewVersion': newVersion,
      if (updateAvailable != null) 'UpdateAvailable': updateAvailable,
      if (updateStatus != null) 'UpdateStatus': updateStatus,
    };
  }
}

/// Information that Amazon ES derives based on <code>VPCOptions</code> for the
/// domain.
class AwsElasticsearchDomainVPCOptions {
  /// The list of Availability Zones associated with the VPC subnets.
  final List<String>? availabilityZones;

  /// The list of security group IDs associated with the VPC endpoints for the
  /// domain.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs associated with the VPC endpoints for the domain.
  final List<String>? subnetIds;

  /// ID for the VPC.
  final String? vPCId;

  AwsElasticsearchDomainVPCOptions({
    this.availabilityZones,
    this.securityGroupIds,
    this.subnetIds,
    this.vPCId,
  });

  factory AwsElasticsearchDomainVPCOptions.fromJson(Map<String, dynamic> json) {
    return AwsElasticsearchDomainVPCOptions(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vPCId: json['VPCId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vPCId = this.vPCId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vPCId != null) 'VPCId': vPCId,
    };
  }
}

/// Contains information about a stickiness policy that was created using
/// <code>CreateAppCookieStickinessPolicy</code>.
class AwsElbAppCookieStickinessPolicy {
  /// The name of the application cookie used for stickiness.
  final String? cookieName;

  /// The mnemonic name for the policy being created. The name must be unique
  /// within the set of policies for the load balancer.
  final String? policyName;

  AwsElbAppCookieStickinessPolicy({
    this.cookieName,
    this.policyName,
  });

  factory AwsElbAppCookieStickinessPolicy.fromJson(Map<String, dynamic> json) {
    return AwsElbAppCookieStickinessPolicy(
      cookieName: json['CookieName'] as String?,
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cookieName = this.cookieName;
    final policyName = this.policyName;
    return {
      if (cookieName != null) 'CookieName': cookieName,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains information about a stickiness policy that was created using
/// <code>CreateLBCookieStickinessPolicy</code>.
class AwsElbLbCookieStickinessPolicy {
  /// The amount of time, in seconds, after which the cookie is considered stale.
  /// If an expiration period is not specified, the stickiness session lasts for
  /// the duration of the browser session.
  final int? cookieExpirationPeriod;

  /// The name of the policy. The name must be unique within the set of policies
  /// for the load balancer.
  final String? policyName;

  AwsElbLbCookieStickinessPolicy({
    this.cookieExpirationPeriod,
    this.policyName,
  });

  factory AwsElbLbCookieStickinessPolicy.fromJson(Map<String, dynamic> json) {
    return AwsElbLbCookieStickinessPolicy(
      cookieExpirationPeriod: json['CookieExpirationPeriod'] as int?,
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cookieExpirationPeriod = this.cookieExpirationPeriod;
    final policyName = this.policyName;
    return {
      if (cookieExpirationPeriod != null)
        'CookieExpirationPeriod': cookieExpirationPeriod,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains information about the access log configuration for the load
/// balancer.
class AwsElbLoadBalancerAccessLog {
  /// The interval in minutes for publishing the access logs.
  ///
  /// You can publish access logs either every 5 minutes or every 60 minutes.
  final int? emitInterval;

  /// Indicates whether access logs are enabled for the load balancer.
  final bool? enabled;

  /// The name of the S3 bucket where the access logs are stored.
  final String? s3BucketName;

  /// The logical hierarchy that was created for the S3 bucket.
  ///
  /// If a prefix is not provided, the log is placed at the root level of the
  /// bucket.
  final String? s3BucketPrefix;

  AwsElbLoadBalancerAccessLog({
    this.emitInterval,
    this.enabled,
    this.s3BucketName,
    this.s3BucketPrefix,
  });

  factory AwsElbLoadBalancerAccessLog.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerAccessLog(
      emitInterval: json['EmitInterval'] as int?,
      enabled: json['Enabled'] as bool?,
      s3BucketName: json['S3BucketName'] as String?,
      s3BucketPrefix: json['S3BucketPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emitInterval = this.emitInterval;
    final enabled = this.enabled;
    final s3BucketName = this.s3BucketName;
    final s3BucketPrefix = this.s3BucketPrefix;
    return {
      if (emitInterval != null) 'EmitInterval': emitInterval,
      if (enabled != null) 'Enabled': enabled,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3BucketPrefix != null) 'S3BucketPrefix': s3BucketPrefix,
    };
  }
}

/// Contains attributes for the load balancer.
class AwsElbLoadBalancerAttributes {
  /// Information about the access log configuration for the load balancer.
  ///
  /// If the access log is enabled, the load balancer captures detailed
  /// information about all requests. It delivers the information to a specified
  /// S3 bucket.
  final AwsElbLoadBalancerAccessLog? accessLog;

  /// Information about the connection draining configuration for the load
  /// balancer.
  ///
  /// If connection draining is enabled, the load balancer allows existing
  /// requests to complete before it shifts traffic away from a deregistered or
  /// unhealthy instance.
  final AwsElbLoadBalancerConnectionDraining? connectionDraining;

  /// Connection settings for the load balancer.
  ///
  /// If an idle timeout is configured, the load balancer allows connections to
  /// remain idle for the specified duration. When a connection is idle, no data
  /// is sent over the connection.
  final AwsElbLoadBalancerConnectionSettings? connectionSettings;

  /// Cross-zone load balancing settings for the load balancer.
  ///
  /// If cross-zone load balancing is enabled, the load balancer routes the
  /// request traffic evenly across all instances regardless of the Availability
  /// Zones.
  final AwsElbLoadBalancerCrossZoneLoadBalancing? crossZoneLoadBalancing;

  AwsElbLoadBalancerAttributes({
    this.accessLog,
    this.connectionDraining,
    this.connectionSettings,
    this.crossZoneLoadBalancing,
  });

  factory AwsElbLoadBalancerAttributes.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerAttributes(
      accessLog: json['AccessLog'] != null
          ? AwsElbLoadBalancerAccessLog.fromJson(
              json['AccessLog'] as Map<String, dynamic>)
          : null,
      connectionDraining: json['ConnectionDraining'] != null
          ? AwsElbLoadBalancerConnectionDraining.fromJson(
              json['ConnectionDraining'] as Map<String, dynamic>)
          : null,
      connectionSettings: json['ConnectionSettings'] != null
          ? AwsElbLoadBalancerConnectionSettings.fromJson(
              json['ConnectionSettings'] as Map<String, dynamic>)
          : null,
      crossZoneLoadBalancing: json['CrossZoneLoadBalancing'] != null
          ? AwsElbLoadBalancerCrossZoneLoadBalancing.fromJson(
              json['CrossZoneLoadBalancing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLog = this.accessLog;
    final connectionDraining = this.connectionDraining;
    final connectionSettings = this.connectionSettings;
    final crossZoneLoadBalancing = this.crossZoneLoadBalancing;
    return {
      if (accessLog != null) 'AccessLog': accessLog,
      if (connectionDraining != null) 'ConnectionDraining': connectionDraining,
      if (connectionSettings != null) 'ConnectionSettings': connectionSettings,
      if (crossZoneLoadBalancing != null)
        'CrossZoneLoadBalancing': crossZoneLoadBalancing,
    };
  }
}

/// Provides information about the configuration of an EC2 instance for the load
/// balancer.
class AwsElbLoadBalancerBackendServerDescription {
  /// The port on which the EC2 instance is listening.
  final int? instancePort;

  /// The names of the policies that are enabled for the EC2 instance.
  final List<String>? policyNames;

  AwsElbLoadBalancerBackendServerDescription({
    this.instancePort,
    this.policyNames,
  });

  factory AwsElbLoadBalancerBackendServerDescription.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerBackendServerDescription(
      instancePort: json['InstancePort'] as int?,
      policyNames: (json['PolicyNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instancePort = this.instancePort;
    final policyNames = this.policyNames;
    return {
      if (instancePort != null) 'InstancePort': instancePort,
      if (policyNames != null) 'PolicyNames': policyNames,
    };
  }
}

/// Contains information about the connection draining configuration for the
/// load balancer.
class AwsElbLoadBalancerConnectionDraining {
  /// Indicates whether connection draining is enabled for the load balancer.
  final bool? enabled;

  /// The maximum time, in seconds, to keep the existing connections open before
  /// deregistering the instances.
  final int? timeout;

  AwsElbLoadBalancerConnectionDraining({
    this.enabled,
    this.timeout,
  });

  factory AwsElbLoadBalancerConnectionDraining.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerConnectionDraining(
      enabled: json['Enabled'] as bool?,
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final timeout = this.timeout;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// Contains connection settings for the load balancer.
class AwsElbLoadBalancerConnectionSettings {
  /// The time, in seconds, that the connection can be idle (no data is sent over
  /// the connection) before it is closed by the load balancer.
  final int? idleTimeout;

  AwsElbLoadBalancerConnectionSettings({
    this.idleTimeout,
  });

  factory AwsElbLoadBalancerConnectionSettings.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerConnectionSettings(
      idleTimeout: json['IdleTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final idleTimeout = this.idleTimeout;
    return {
      if (idleTimeout != null) 'IdleTimeout': idleTimeout,
    };
  }
}

/// Contains cross-zone load balancing settings for the load balancer.
class AwsElbLoadBalancerCrossZoneLoadBalancing {
  /// Indicates whether cross-zone load balancing is enabled for the load
  /// balancer.
  final bool? enabled;

  AwsElbLoadBalancerCrossZoneLoadBalancing({
    this.enabled,
  });

  factory AwsElbLoadBalancerCrossZoneLoadBalancing.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerCrossZoneLoadBalancing(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Contains details about a Classic Load Balancer.
class AwsElbLoadBalancerDetails {
  /// The list of Availability Zones for the load balancer.
  final List<String>? availabilityZones;

  /// Information about the configuration of the EC2 instances.
  final List<AwsElbLoadBalancerBackendServerDescription>?
      backendServerDescriptions;

  /// The name of the Amazon Route 53 hosted zone for the load balancer.
  final String? canonicalHostedZoneName;

  /// The ID of the Amazon Route 53 hosted zone for the load balancer.
  final String? canonicalHostedZoneNameID;

  /// Indicates when the load balancer was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdTime;

  /// The DNS name of the load balancer.
  final String? dnsName;

  /// Information about the health checks that are conducted on the load balancer.
  final AwsElbLoadBalancerHealthCheck? healthCheck;

  /// List of EC2 instances for the load balancer.
  final List<AwsElbLoadBalancerInstance>? instances;

  /// The policies that are enabled for the load balancer listeners.
  final List<AwsElbLoadBalancerListenerDescription>? listenerDescriptions;

  /// The attributes for a load balancer.
  final AwsElbLoadBalancerAttributes? loadBalancerAttributes;

  /// The name of the load balancer.
  final String? loadBalancerName;

  /// The policies for a load balancer.
  final AwsElbLoadBalancerPolicies? policies;

  /// The type of load balancer. Only provided if the load balancer is in a VPC.
  ///
  /// If <code>Scheme</code> is <code>internet-facing</code>, the load balancer
  /// has a public DNS name that resolves to a public IP address.
  ///
  /// If <code>Scheme</code> is <code>internal</code>, the load balancer has a
  /// public DNS name that resolves to a private IP address.
  final String? scheme;

  /// The security groups for the load balancer. Only provided if the load
  /// balancer is in a VPC.
  final List<String>? securityGroups;

  /// Information about the security group for the load balancer. This is the
  /// security group that is used for inbound rules.
  final AwsElbLoadBalancerSourceSecurityGroup? sourceSecurityGroup;

  /// The list of subnet identifiers for the load balancer.
  final List<String>? subnets;

  /// The identifier of the VPC for the load balancer.
  final String? vpcId;

  AwsElbLoadBalancerDetails({
    this.availabilityZones,
    this.backendServerDescriptions,
    this.canonicalHostedZoneName,
    this.canonicalHostedZoneNameID,
    this.createdTime,
    this.dnsName,
    this.healthCheck,
    this.instances,
    this.listenerDescriptions,
    this.loadBalancerAttributes,
    this.loadBalancerName,
    this.policies,
    this.scheme,
    this.securityGroups,
    this.sourceSecurityGroup,
    this.subnets,
    this.vpcId,
  });

  factory AwsElbLoadBalancerDetails.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerDetails(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      backendServerDescriptions: (json['BackendServerDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => AwsElbLoadBalancerBackendServerDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      canonicalHostedZoneName: json['CanonicalHostedZoneName'] as String?,
      canonicalHostedZoneNameID: json['CanonicalHostedZoneNameID'] as String?,
      createdTime: json['CreatedTime'] as String?,
      dnsName: json['DnsName'] as String?,
      healthCheck: json['HealthCheck'] != null
          ? AwsElbLoadBalancerHealthCheck.fromJson(
              json['HealthCheck'] as Map<String, dynamic>)
          : null,
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsElbLoadBalancerInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      listenerDescriptions: (json['ListenerDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => AwsElbLoadBalancerListenerDescription.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      loadBalancerAttributes: json['LoadBalancerAttributes'] != null
          ? AwsElbLoadBalancerAttributes.fromJson(
              json['LoadBalancerAttributes'] as Map<String, dynamic>)
          : null,
      loadBalancerName: json['LoadBalancerName'] as String?,
      policies: json['Policies'] != null
          ? AwsElbLoadBalancerPolicies.fromJson(
              json['Policies'] as Map<String, dynamic>)
          : null,
      scheme: json['Scheme'] as String?,
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceSecurityGroup: json['SourceSecurityGroup'] != null
          ? AwsElbLoadBalancerSourceSecurityGroup.fromJson(
              json['SourceSecurityGroup'] as Map<String, dynamic>)
          : null,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final backendServerDescriptions = this.backendServerDescriptions;
    final canonicalHostedZoneName = this.canonicalHostedZoneName;
    final canonicalHostedZoneNameID = this.canonicalHostedZoneNameID;
    final createdTime = this.createdTime;
    final dnsName = this.dnsName;
    final healthCheck = this.healthCheck;
    final instances = this.instances;
    final listenerDescriptions = this.listenerDescriptions;
    final loadBalancerAttributes = this.loadBalancerAttributes;
    final loadBalancerName = this.loadBalancerName;
    final policies = this.policies;
    final scheme = this.scheme;
    final securityGroups = this.securityGroups;
    final sourceSecurityGroup = this.sourceSecurityGroup;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (backendServerDescriptions != null)
        'BackendServerDescriptions': backendServerDescriptions,
      if (canonicalHostedZoneName != null)
        'CanonicalHostedZoneName': canonicalHostedZoneName,
      if (canonicalHostedZoneNameID != null)
        'CanonicalHostedZoneNameID': canonicalHostedZoneNameID,
      if (createdTime != null) 'CreatedTime': createdTime,
      if (dnsName != null) 'DnsName': dnsName,
      if (healthCheck != null) 'HealthCheck': healthCheck,
      if (instances != null) 'Instances': instances,
      if (listenerDescriptions != null)
        'ListenerDescriptions': listenerDescriptions,
      if (loadBalancerAttributes != null)
        'LoadBalancerAttributes': loadBalancerAttributes,
      if (loadBalancerName != null) 'LoadBalancerName': loadBalancerName,
      if (policies != null) 'Policies': policies,
      if (scheme != null) 'Scheme': scheme,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (sourceSecurityGroup != null)
        'SourceSecurityGroup': sourceSecurityGroup,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Contains information about the health checks that are conducted on the load
/// balancer.
class AwsElbLoadBalancerHealthCheck {
  /// The number of consecutive health check successes required before the
  /// instance is moved to the Healthy state.
  final int? healthyThreshold;

  /// The approximate interval, in seconds, between health checks of an individual
  /// instance.
  final int? interval;

  /// The instance that is being checked. The target specifies the protocol and
  /// port. The available protocols are TCP, SSL, HTTP, and HTTPS. The range of
  /// valid ports is 1 through 65535.
  ///
  /// For the HTTP and HTTPS protocols, the target also specifies the ping path.
  ///
  /// For the TCP protocol, the target is specified as <code>TCP:
  /// <i>&lt;port&gt;</i> </code>.
  ///
  /// For the SSL protocol, the target is specified as
  /// <code>SSL.<i>&lt;port&gt;</i> </code>.
  ///
  /// For the HTTP and HTTPS protocols, the target is specified as <code>
  /// <i>&lt;protocol&gt;</i>:<i>&lt;port&gt;</i>/<i>&lt;path to ping&gt;</i>
  /// </code>.
  final String? target;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  final int? timeout;

  /// The number of consecutive health check failures that must occur before the
  /// instance is moved to the Unhealthy state.
  final int? unhealthyThreshold;

  AwsElbLoadBalancerHealthCheck({
    this.healthyThreshold,
    this.interval,
    this.target,
    this.timeout,
    this.unhealthyThreshold,
  });

  factory AwsElbLoadBalancerHealthCheck.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerHealthCheck(
      healthyThreshold: json['HealthyThreshold'] as int?,
      interval: json['Interval'] as int?,
      target: json['Target'] as String?,
      timeout: json['Timeout'] as int?,
      unhealthyThreshold: json['UnhealthyThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final interval = this.interval;
    final target = this.target;
    final timeout = this.timeout;
    final unhealthyThreshold = this.unhealthyThreshold;
    return {
      if (healthyThreshold != null) 'HealthyThreshold': healthyThreshold,
      if (interval != null) 'Interval': interval,
      if (target != null) 'Target': target,
      if (timeout != null) 'Timeout': timeout,
      if (unhealthyThreshold != null) 'UnhealthyThreshold': unhealthyThreshold,
    };
  }
}

/// Provides information about an EC2 instance for a load balancer.
class AwsElbLoadBalancerInstance {
  /// The instance identifier.
  final String? instanceId;

  AwsElbLoadBalancerInstance({
    this.instanceId,
  });

  factory AwsElbLoadBalancerInstance.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerInstance(
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Information about a load balancer listener.
class AwsElbLoadBalancerListener {
  /// The port on which the instance is listening.
  final int? instancePort;

  /// The protocol to use to route traffic to instances.
  ///
  /// Valid values: <code>HTTP</code> | <code>HTTPS</code> | <code>TCP</code> |
  /// <code>SSL</code>
  final String? instanceProtocol;

  /// The port on which the load balancer is listening.
  ///
  /// On EC2-VPC, you can specify any port from the range 1-65535.
  ///
  /// On EC2-Classic, you can specify any port from the following list: 25, 80,
  /// 443, 465, 587, 1024-65535.
  final int? loadBalancerPort;

  /// The load balancer transport protocol to use for routing.
  ///
  /// Valid values: <code>HTTP</code> | <code>HTTPS</code> | <code>TCP</code> |
  /// <code>SSL</code>
  final String? protocol;

  /// The ARN of the server certificate.
  final String? sslCertificateId;

  AwsElbLoadBalancerListener({
    this.instancePort,
    this.instanceProtocol,
    this.loadBalancerPort,
    this.protocol,
    this.sslCertificateId,
  });

  factory AwsElbLoadBalancerListener.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerListener(
      instancePort: json['InstancePort'] as int?,
      instanceProtocol: json['InstanceProtocol'] as String?,
      loadBalancerPort: json['LoadBalancerPort'] as int?,
      protocol: json['Protocol'] as String?,
      sslCertificateId: json['SslCertificateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instancePort = this.instancePort;
    final instanceProtocol = this.instanceProtocol;
    final loadBalancerPort = this.loadBalancerPort;
    final protocol = this.protocol;
    final sslCertificateId = this.sslCertificateId;
    return {
      if (instancePort != null) 'InstancePort': instancePort,
      if (instanceProtocol != null) 'InstanceProtocol': instanceProtocol,
      if (loadBalancerPort != null) 'LoadBalancerPort': loadBalancerPort,
      if (protocol != null) 'Protocol': protocol,
      if (sslCertificateId != null) 'SslCertificateId': sslCertificateId,
    };
  }
}

/// Lists the policies that are enabled for a load balancer listener.
class AwsElbLoadBalancerListenerDescription {
  /// Information about the listener.
  final AwsElbLoadBalancerListener? listener;

  /// The policies enabled for the listener.
  final List<String>? policyNames;

  AwsElbLoadBalancerListenerDescription({
    this.listener,
    this.policyNames,
  });

  factory AwsElbLoadBalancerListenerDescription.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerListenerDescription(
      listener: json['Listener'] != null
          ? AwsElbLoadBalancerListener.fromJson(
              json['Listener'] as Map<String, dynamic>)
          : null,
      policyNames: (json['PolicyNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listener = this.listener;
    final policyNames = this.policyNames;
    return {
      if (listener != null) 'Listener': listener,
      if (policyNames != null) 'PolicyNames': policyNames,
    };
  }
}

/// Contains information about the policies for a load balancer.
class AwsElbLoadBalancerPolicies {
  /// The stickiness policies that are created using
  /// <code>CreateAppCookieStickinessPolicy</code>.
  final List<AwsElbAppCookieStickinessPolicy>? appCookieStickinessPolicies;

  /// The stickiness policies that are created using
  /// <code>CreateLBCookieStickinessPolicy</code>.
  final List<AwsElbLbCookieStickinessPolicy>? lbCookieStickinessPolicies;

  /// The policies other than the stickiness policies.
  final List<String>? otherPolicies;

  AwsElbLoadBalancerPolicies({
    this.appCookieStickinessPolicies,
    this.lbCookieStickinessPolicies,
    this.otherPolicies,
  });

  factory AwsElbLoadBalancerPolicies.fromJson(Map<String, dynamic> json) {
    return AwsElbLoadBalancerPolicies(
      appCookieStickinessPolicies:
          (json['AppCookieStickinessPolicies'] as List?)
              ?.whereNotNull()
              .map((e) => AwsElbAppCookieStickinessPolicy.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      lbCookieStickinessPolicies: (json['LbCookieStickinessPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => AwsElbLbCookieStickinessPolicy.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      otherPolicies: (json['OtherPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appCookieStickinessPolicies = this.appCookieStickinessPolicies;
    final lbCookieStickinessPolicies = this.lbCookieStickinessPolicies;
    final otherPolicies = this.otherPolicies;
    return {
      if (appCookieStickinessPolicies != null)
        'AppCookieStickinessPolicies': appCookieStickinessPolicies,
      if (lbCookieStickinessPolicies != null)
        'LbCookieStickinessPolicies': lbCookieStickinessPolicies,
      if (otherPolicies != null) 'OtherPolicies': otherPolicies,
    };
  }
}

/// Contains information about the security group for the load balancer.
class AwsElbLoadBalancerSourceSecurityGroup {
  /// The name of the security group.
  final String? groupName;

  /// The owner of the security group.
  final String? ownerAlias;

  AwsElbLoadBalancerSourceSecurityGroup({
    this.groupName,
    this.ownerAlias,
  });

  factory AwsElbLoadBalancerSourceSecurityGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsElbLoadBalancerSourceSecurityGroup(
      groupName: json['GroupName'] as String?,
      ownerAlias: json['OwnerAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final ownerAlias = this.ownerAlias;
    return {
      if (groupName != null) 'GroupName': groupName,
      if (ownerAlias != null) 'OwnerAlias': ownerAlias,
    };
  }
}

/// Information about a load balancer.
class AwsElbv2LoadBalancerDetails {
  /// The Availability Zones for the load balancer.
  final List<AvailabilityZone>? availabilityZones;

  /// The ID of the Amazon Route 53 hosted zone associated with the load balancer.
  final String? canonicalHostedZoneId;

  /// Indicates when the load balancer was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdTime;

  /// The public DNS name of the load balancer.
  final String? dNSName;

  /// The type of IP addresses used by the subnets for your load balancer. The
  /// possible values are <code>ipv4</code> (for IPv4 addresses) and
  /// <code>dualstack</code> (for IPv4 and IPv6 addresses).
  final String? ipAddressType;

  /// The nodes of an Internet-facing load balancer have public IP addresses.
  final String? scheme;

  /// The IDs of the security groups for the load balancer.
  final List<String>? securityGroups;

  /// The state of the load balancer.
  final LoadBalancerState? state;

  /// The type of load balancer.
  final String? type;

  /// The ID of the VPC for the load balancer.
  final String? vpcId;

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

  factory AwsElbv2LoadBalancerDetails.fromJson(Map<String, dynamic> json) {
    return AwsElbv2LoadBalancerDetails(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => AvailabilityZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      canonicalHostedZoneId: json['CanonicalHostedZoneId'] as String?,
      createdTime: json['CreatedTime'] as String?,
      dNSName: json['DNSName'] as String?,
      ipAddressType: json['IpAddressType'] as String?,
      scheme: json['Scheme'] as String?,
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: json['State'] != null
          ? LoadBalancerState.fromJson(json['State'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final canonicalHostedZoneId = this.canonicalHostedZoneId;
    final createdTime = this.createdTime;
    final dNSName = this.dNSName;
    final ipAddressType = this.ipAddressType;
    final scheme = this.scheme;
    final securityGroups = this.securityGroups;
    final state = this.state;
    final type = this.type;
    final vpcId = this.vpcId;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (canonicalHostedZoneId != null)
        'CanonicalHostedZoneId': canonicalHostedZoneId,
      if (createdTime != null) 'CreatedTime': createdTime,
      if (dNSName != null) 'DNSName': dNSName,
      if (ipAddressType != null) 'IpAddressType': ipAddressType,
      if (scheme != null) 'Scheme': scheme,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (state != null) 'State': state,
      if (type != null) 'Type': type,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// IAM access key details related to a finding.
class AwsIamAccessKeyDetails {
  /// The identifier of the access key.
  final String? accessKeyId;

  /// The AWS account ID of the account for the key.
  final String? accountId;

  /// Indicates when the IAM access key was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdAt;

  /// The ID of the principal associated with an access key.
  final String? principalId;

  /// The name of the principal.
  final String? principalName;

  /// The type of principal associated with an access key.
  final String? principalType;

  /// Information about the session that the key was used for.
  final AwsIamAccessKeySessionContext? sessionContext;

  /// The status of the IAM access key related to a finding.
  final AwsIamAccessKeyStatus? status;

  /// The user associated with the IAM access key related to a finding.
  ///
  /// The <code>UserName</code> parameter has been replaced with the
  /// <code>PrincipalName</code> parameter because access keys can also be
  /// assigned to principals that are not IAM users.
  final String? userName;

  AwsIamAccessKeyDetails({
    this.accessKeyId,
    this.accountId,
    this.createdAt,
    this.principalId,
    this.principalName,
    this.principalType,
    this.sessionContext,
    this.status,
    this.userName,
  });

  factory AwsIamAccessKeyDetails.fromJson(Map<String, dynamic> json) {
    return AwsIamAccessKeyDetails(
      accessKeyId: json['AccessKeyId'] as String?,
      accountId: json['AccountId'] as String?,
      createdAt: json['CreatedAt'] as String?,
      principalId: json['PrincipalId'] as String?,
      principalName: json['PrincipalName'] as String?,
      principalType: json['PrincipalType'] as String?,
      sessionContext: json['SessionContext'] != null
          ? AwsIamAccessKeySessionContext.fromJson(
              json['SessionContext'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toAwsIamAccessKeyStatus(),
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final accountId = this.accountId;
    final createdAt = this.createdAt;
    final principalId = this.principalId;
    final principalName = this.principalName;
    final principalType = this.principalType;
    final sessionContext = this.sessionContext;
    final status = this.status;
    final userName = this.userName;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (accountId != null) 'AccountId': accountId,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (principalId != null) 'PrincipalId': principalId,
      if (principalName != null) 'PrincipalName': principalName,
      if (principalType != null) 'PrincipalType': principalType,
      if (sessionContext != null) 'SessionContext': sessionContext,
      if (status != null) 'Status': status.toValue(),
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Provides information about the session that the key was used for.
class AwsIamAccessKeySessionContext {
  /// Attributes of the session that the key was used for.
  final AwsIamAccessKeySessionContextAttributes? attributes;

  /// Information about the entity that created the session.
  final AwsIamAccessKeySessionContextSessionIssuer? sessionIssuer;

  AwsIamAccessKeySessionContext({
    this.attributes,
    this.sessionIssuer,
  });

  factory AwsIamAccessKeySessionContext.fromJson(Map<String, dynamic> json) {
    return AwsIamAccessKeySessionContext(
      attributes: json['Attributes'] != null
          ? AwsIamAccessKeySessionContextAttributes.fromJson(
              json['Attributes'] as Map<String, dynamic>)
          : null,
      sessionIssuer: json['SessionIssuer'] != null
          ? AwsIamAccessKeySessionContextSessionIssuer.fromJson(
              json['SessionIssuer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final sessionIssuer = this.sessionIssuer;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (sessionIssuer != null) 'SessionIssuer': sessionIssuer,
    };
  }
}

/// Attributes of the session that the key was used for.
class AwsIamAccessKeySessionContextAttributes {
  /// Indicates when the session was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? creationDate;

  /// Indicates whether the session used multi-factor authentication (MFA).
  final bool? mfaAuthenticated;

  AwsIamAccessKeySessionContextAttributes({
    this.creationDate,
    this.mfaAuthenticated,
  });

  factory AwsIamAccessKeySessionContextAttributes.fromJson(
      Map<String, dynamic> json) {
    return AwsIamAccessKeySessionContextAttributes(
      creationDate: json['CreationDate'] as String?,
      mfaAuthenticated: json['MfaAuthenticated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final mfaAuthenticated = this.mfaAuthenticated;
    return {
      if (creationDate != null) 'CreationDate': creationDate,
      if (mfaAuthenticated != null) 'MfaAuthenticated': mfaAuthenticated,
    };
  }
}

/// Information about the entity that created the session.
class AwsIamAccessKeySessionContextSessionIssuer {
  /// The identifier of the AWS account that created the session.
  final String? accountId;

  /// The ARN of the session.
  final String? arn;

  /// The principal ID of the principal (user, role, or group) that created the
  /// session.
  final String? principalId;

  /// The type of principal (user, role, or group) that created the session.
  final String? type;

  /// The name of the principal that created the session.
  final String? userName;

  AwsIamAccessKeySessionContextSessionIssuer({
    this.accountId,
    this.arn,
    this.principalId,
    this.type,
    this.userName,
  });

  factory AwsIamAccessKeySessionContextSessionIssuer.fromJson(
      Map<String, dynamic> json) {
    return AwsIamAccessKeySessionContextSessionIssuer(
      accountId: json['AccountId'] as String?,
      arn: json['Arn'] as String?,
      principalId: json['PrincipalId'] as String?,
      type: json['Type'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    final type = this.type;
    final userName = this.userName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (arn != null) 'Arn': arn,
      if (principalId != null) 'PrincipalId': principalId,
      if (type != null) 'Type': type,
      if (userName != null) 'UserName': userName,
    };
  }
}

enum AwsIamAccessKeyStatus {
  active,
  inactive,
}

extension on AwsIamAccessKeyStatus {
  String toValue() {
    switch (this) {
      case AwsIamAccessKeyStatus.active:
        return 'Active';
      case AwsIamAccessKeyStatus.inactive:
        return 'Inactive';
    }
  }
}

extension on String {
  AwsIamAccessKeyStatus toAwsIamAccessKeyStatus() {
    switch (this) {
      case 'Active':
        return AwsIamAccessKeyStatus.active;
      case 'Inactive':
        return AwsIamAccessKeyStatus.inactive;
    }
    throw Exception('$this is not known in enum AwsIamAccessKeyStatus');
  }
}

/// A managed policy that is attached to an IAM principal.
class AwsIamAttachedManagedPolicy {
  /// The ARN of the policy.
  final String? policyArn;

  /// The name of the policy.
  final String? policyName;

  AwsIamAttachedManagedPolicy({
    this.policyArn,
    this.policyName,
  });

  factory AwsIamAttachedManagedPolicy.fromJson(Map<String, dynamic> json) {
    return AwsIamAttachedManagedPolicy(
      policyArn: json['PolicyArn'] as String?,
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains details about an IAM group.
class AwsIamGroupDetails {
  /// A list of the managed policies that are attached to the IAM group.
  final List<AwsIamAttachedManagedPolicy>? attachedManagedPolicies;

  /// Indicates when the IAM group was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// The identifier of the IAM group.
  final String? groupId;

  /// The name of the IAM group.
  final String? groupName;

  /// The list of inline policies that are embedded in the group.
  final List<AwsIamGroupPolicy>? groupPolicyList;

  /// The path to the group.
  final String? path;

  AwsIamGroupDetails({
    this.attachedManagedPolicies,
    this.createDate,
    this.groupId,
    this.groupName,
    this.groupPolicyList,
    this.path,
  });

  factory AwsIamGroupDetails.fromJson(Map<String, dynamic> json) {
    return AwsIamGroupDetails(
      attachedManagedPolicies: (json['AttachedManagedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['CreateDate'] as String?,
      groupId: json['GroupId'] as String?,
      groupName: json['GroupName'] as String?,
      groupPolicyList: (json['GroupPolicyList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsIamGroupPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final groupId = this.groupId;
    final groupName = this.groupName;
    final groupPolicyList = this.groupPolicyList;
    final path = this.path;
    return {
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': createDate,
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
      if (groupPolicyList != null) 'GroupPolicyList': groupPolicyList,
      if (path != null) 'Path': path,
    };
  }
}

/// A managed policy that is attached to the IAM group.
class AwsIamGroupPolicy {
  /// The name of the policy.
  final String? policyName;

  AwsIamGroupPolicy({
    this.policyName,
  });

  factory AwsIamGroupPolicy.fromJson(Map<String, dynamic> json) {
    return AwsIamGroupPolicy(
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    return {
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Information about an instance profile.
class AwsIamInstanceProfile {
  /// The ARN of the instance profile.
  final String? arn;

  /// Indicates when the instance profile was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// The identifier of the instance profile.
  final String? instanceProfileId;

  /// The name of the instance profile.
  final String? instanceProfileName;

  /// The path to the instance profile.
  final String? path;

  /// The roles associated with the instance profile.
  final List<AwsIamInstanceProfileRole>? roles;

  AwsIamInstanceProfile({
    this.arn,
    this.createDate,
    this.instanceProfileId,
    this.instanceProfileName,
    this.path,
    this.roles,
  });

  factory AwsIamInstanceProfile.fromJson(Map<String, dynamic> json) {
    return AwsIamInstanceProfile(
      arn: json['Arn'] as String?,
      createDate: json['CreateDate'] as String?,
      instanceProfileId: json['InstanceProfileId'] as String?,
      instanceProfileName: json['InstanceProfileName'] as String?,
      path: json['Path'] as String?,
      roles: (json['Roles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsIamInstanceProfileRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final instanceProfileId = this.instanceProfileId;
    final instanceProfileName = this.instanceProfileName;
    final path = this.path;
    final roles = this.roles;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': createDate,
      if (instanceProfileId != null) 'InstanceProfileId': instanceProfileId,
      if (instanceProfileName != null)
        'InstanceProfileName': instanceProfileName,
      if (path != null) 'Path': path,
      if (roles != null) 'Roles': roles,
    };
  }
}

/// Information about a role associated with an instance profile.
class AwsIamInstanceProfileRole {
  /// The ARN of the role.
  final String? arn;

  /// The policy that grants an entity permission to assume the role.
  final String? assumeRolePolicyDocument;

  /// Indicates when the role was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// The path to the role.
  final String? path;

  /// The identifier of the role.
  final String? roleId;

  /// The name of the role.
  final String? roleName;

  AwsIamInstanceProfileRole({
    this.arn,
    this.assumeRolePolicyDocument,
    this.createDate,
    this.path,
    this.roleId,
    this.roleName,
  });

  factory AwsIamInstanceProfileRole.fromJson(Map<String, dynamic> json) {
    return AwsIamInstanceProfileRole(
      arn: json['Arn'] as String?,
      assumeRolePolicyDocument: json['AssumeRolePolicyDocument'] as String?,
      createDate: json['CreateDate'] as String?,
      path: json['Path'] as String?,
      roleId: json['RoleId'] as String?,
      roleName: json['RoleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assumeRolePolicyDocument = this.assumeRolePolicyDocument;
    final createDate = this.createDate;
    final path = this.path;
    final roleId = this.roleId;
    final roleName = this.roleName;
    return {
      if (arn != null) 'Arn': arn,
      if (assumeRolePolicyDocument != null)
        'AssumeRolePolicyDocument': assumeRolePolicyDocument,
      if (createDate != null) 'CreateDate': createDate,
      if (path != null) 'Path': path,
      if (roleId != null) 'RoleId': roleId,
      if (roleName != null) 'RoleName': roleName,
    };
  }
}

/// Information about the policy used to set the permissions boundary for an IAM
/// principal.
class AwsIamPermissionsBoundary {
  /// The ARN of the policy used to set the permissions boundary.
  final String? permissionsBoundaryArn;

  /// The usage type for the permissions boundary.
  final String? permissionsBoundaryType;

  AwsIamPermissionsBoundary({
    this.permissionsBoundaryArn,
    this.permissionsBoundaryType,
  });

  factory AwsIamPermissionsBoundary.fromJson(Map<String, dynamic> json) {
    return AwsIamPermissionsBoundary(
      permissionsBoundaryArn: json['PermissionsBoundaryArn'] as String?,
      permissionsBoundaryType: json['PermissionsBoundaryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionsBoundaryArn = this.permissionsBoundaryArn;
    final permissionsBoundaryType = this.permissionsBoundaryType;
    return {
      if (permissionsBoundaryArn != null)
        'PermissionsBoundaryArn': permissionsBoundaryArn,
      if (permissionsBoundaryType != null)
        'PermissionsBoundaryType': permissionsBoundaryType,
    };
  }
}

/// Represents an IAM permissions policy.
class AwsIamPolicyDetails {
  /// The number of users, groups, and roles that the policy is attached to.
  final int? attachmentCount;

  /// When the policy was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// The identifier of the default version of the policy.
  final String? defaultVersionId;

  /// A description of the policy.
  final String? description;

  /// Whether the policy can be attached to a user, group, or role.
  final bool? isAttachable;

  /// The path to the policy.
  final String? path;

  /// The number of users and roles that use the policy to set the permissions
  /// boundary.
  final int? permissionsBoundaryUsageCount;

  /// The unique identifier of the policy.
  final String? policyId;

  /// The name of the policy.
  final String? policyName;

  /// List of versions of the policy.
  final List<AwsIamPolicyVersion>? policyVersionList;

  /// When the policy was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? updateDate;

  AwsIamPolicyDetails({
    this.attachmentCount,
    this.createDate,
    this.defaultVersionId,
    this.description,
    this.isAttachable,
    this.path,
    this.permissionsBoundaryUsageCount,
    this.policyId,
    this.policyName,
    this.policyVersionList,
    this.updateDate,
  });

  factory AwsIamPolicyDetails.fromJson(Map<String, dynamic> json) {
    return AwsIamPolicyDetails(
      attachmentCount: json['AttachmentCount'] as int?,
      createDate: json['CreateDate'] as String?,
      defaultVersionId: json['DefaultVersionId'] as String?,
      description: json['Description'] as String?,
      isAttachable: json['IsAttachable'] as bool?,
      path: json['Path'] as String?,
      permissionsBoundaryUsageCount:
          json['PermissionsBoundaryUsageCount'] as int?,
      policyId: json['PolicyId'] as String?,
      policyName: json['PolicyName'] as String?,
      policyVersionList: (json['PolicyVersionList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsIamPolicyVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateDate: json['UpdateDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentCount = this.attachmentCount;
    final createDate = this.createDate;
    final defaultVersionId = this.defaultVersionId;
    final description = this.description;
    final isAttachable = this.isAttachable;
    final path = this.path;
    final permissionsBoundaryUsageCount = this.permissionsBoundaryUsageCount;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final policyVersionList = this.policyVersionList;
    final updateDate = this.updateDate;
    return {
      if (attachmentCount != null) 'AttachmentCount': attachmentCount,
      if (createDate != null) 'CreateDate': createDate,
      if (defaultVersionId != null) 'DefaultVersionId': defaultVersionId,
      if (description != null) 'Description': description,
      if (isAttachable != null) 'IsAttachable': isAttachable,
      if (path != null) 'Path': path,
      if (permissionsBoundaryUsageCount != null)
        'PermissionsBoundaryUsageCount': permissionsBoundaryUsageCount,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (policyVersionList != null) 'PolicyVersionList': policyVersionList,
      if (updateDate != null) 'UpdateDate': updateDate,
    };
  }
}

/// A version of an IAM policy.
class AwsIamPolicyVersion {
  /// Indicates when the version was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// Whether the version is the default version.
  final bool? isDefaultVersion;

  /// The identifier of the policy version.
  final String? versionId;

  AwsIamPolicyVersion({
    this.createDate,
    this.isDefaultVersion,
    this.versionId,
  });

  factory AwsIamPolicyVersion.fromJson(Map<String, dynamic> json) {
    return AwsIamPolicyVersion(
      createDate: json['CreateDate'] as String?,
      isDefaultVersion: json['IsDefaultVersion'] as bool?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final isDefaultVersion = this.isDefaultVersion;
    final versionId = this.versionId;
    return {
      if (createDate != null) 'CreateDate': createDate,
      if (isDefaultVersion != null) 'IsDefaultVersion': isDefaultVersion,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Contains information about an IAM role, including all of the role's
/// policies.
class AwsIamRoleDetails {
  /// The trust policy that grants permission to assume the role.
  final String? assumeRolePolicyDocument;

  /// The list of the managed policies that are attached to the role.
  final List<AwsIamAttachedManagedPolicy>? attachedManagedPolicies;

  /// Indicates when the role was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// The list of instance profiles that contain this role.
  final List<AwsIamInstanceProfile>? instanceProfileList;

  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role.
  final int? maxSessionDuration;

  /// The path to the role.
  final String? path;
  final AwsIamPermissionsBoundary? permissionsBoundary;

  /// The stable and unique string identifying the role.
  final String? roleId;

  /// The friendly name that identifies the role.
  final String? roleName;

  /// The list of inline policies that are embedded in the role.
  final List<AwsIamRolePolicy>? rolePolicyList;

  AwsIamRoleDetails({
    this.assumeRolePolicyDocument,
    this.attachedManagedPolicies,
    this.createDate,
    this.instanceProfileList,
    this.maxSessionDuration,
    this.path,
    this.permissionsBoundary,
    this.roleId,
    this.roleName,
    this.rolePolicyList,
  });

  factory AwsIamRoleDetails.fromJson(Map<String, dynamic> json) {
    return AwsIamRoleDetails(
      assumeRolePolicyDocument: json['AssumeRolePolicyDocument'] as String?,
      attachedManagedPolicies: (json['AttachedManagedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['CreateDate'] as String?,
      instanceProfileList: (json['InstanceProfileList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsIamInstanceProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxSessionDuration: json['MaxSessionDuration'] as int?,
      path: json['Path'] as String?,
      permissionsBoundary: json['PermissionsBoundary'] != null
          ? AwsIamPermissionsBoundary.fromJson(
              json['PermissionsBoundary'] as Map<String, dynamic>)
          : null,
      roleId: json['RoleId'] as String?,
      roleName: json['RoleName'] as String?,
      rolePolicyList: (json['RolePolicyList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsIamRolePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assumeRolePolicyDocument = this.assumeRolePolicyDocument;
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final instanceProfileList = this.instanceProfileList;
    final maxSessionDuration = this.maxSessionDuration;
    final path = this.path;
    final permissionsBoundary = this.permissionsBoundary;
    final roleId = this.roleId;
    final roleName = this.roleName;
    final rolePolicyList = this.rolePolicyList;
    return {
      if (assumeRolePolicyDocument != null)
        'AssumeRolePolicyDocument': assumeRolePolicyDocument,
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': createDate,
      if (instanceProfileList != null)
        'InstanceProfileList': instanceProfileList,
      if (maxSessionDuration != null) 'MaxSessionDuration': maxSessionDuration,
      if (path != null) 'Path': path,
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (roleId != null) 'RoleId': roleId,
      if (roleName != null) 'RoleName': roleName,
      if (rolePolicyList != null) 'RolePolicyList': rolePolicyList,
    };
  }
}

/// An inline policy that is embedded in the role.
class AwsIamRolePolicy {
  /// The name of the policy.
  final String? policyName;

  AwsIamRolePolicy({
    this.policyName,
  });

  factory AwsIamRolePolicy.fromJson(Map<String, dynamic> json) {
    return AwsIamRolePolicy(
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    return {
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Information about an IAM user.
class AwsIamUserDetails {
  /// A list of the managed policies that are attached to the user.
  final List<AwsIamAttachedManagedPolicy>? attachedManagedPolicies;

  /// Indicates when the user was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createDate;

  /// A list of IAM groups that the user belongs to.
  final List<String>? groupList;

  /// The path to the user.
  final String? path;

  /// The permissions boundary for the user.
  final AwsIamPermissionsBoundary? permissionsBoundary;

  /// The unique identifier for the user.
  final String? userId;

  /// The name of the user.
  final String? userName;

  /// The list of inline policies that are embedded in the user.
  final List<AwsIamUserPolicy>? userPolicyList;

  AwsIamUserDetails({
    this.attachedManagedPolicies,
    this.createDate,
    this.groupList,
    this.path,
    this.permissionsBoundary,
    this.userId,
    this.userName,
    this.userPolicyList,
  });

  factory AwsIamUserDetails.fromJson(Map<String, dynamic> json) {
    return AwsIamUserDetails(
      attachedManagedPolicies: (json['AttachedManagedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['CreateDate'] as String?,
      groupList: (json['GroupList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      path: json['Path'] as String?,
      permissionsBoundary: json['PermissionsBoundary'] != null
          ? AwsIamPermissionsBoundary.fromJson(
              json['PermissionsBoundary'] as Map<String, dynamic>)
          : null,
      userId: json['UserId'] as String?,
      userName: json['UserName'] as String?,
      userPolicyList: (json['UserPolicyList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsIamUserPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final groupList = this.groupList;
    final path = this.path;
    final permissionsBoundary = this.permissionsBoundary;
    final userId = this.userId;
    final userName = this.userName;
    final userPolicyList = this.userPolicyList;
    return {
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': createDate,
      if (groupList != null) 'GroupList': groupList,
      if (path != null) 'Path': path,
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (userId != null) 'UserId': userId,
      if (userName != null) 'UserName': userName,
      if (userPolicyList != null) 'UserPolicyList': userPolicyList,
    };
  }
}

/// Information about an inline policy that is embedded in the user.
class AwsIamUserPolicy {
  /// The name of the policy.
  final String? policyName;

  AwsIamUserPolicy({
    this.policyName,
  });

  factory AwsIamUserPolicy.fromJson(Map<String, dynamic> json) {
    return AwsIamUserPolicy(
      policyName: json['PolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    return {
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains metadata about a customer master key (CMK).
class AwsKmsKeyDetails {
  /// The twelve-digit account ID of the AWS account that owns the CMK.
  final String? awsAccountId;

  /// Indicates when the CMK was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final double? creationDate;

  /// A description of the key.
  final String? description;

  /// The globally unique identifier for the CMK.
  final String? keyId;

  /// The manager of the CMK. CMKs in your AWS account are either customer managed
  /// or AWS managed.
  final String? keyManager;

  /// The state of the CMK.
  final String? keyState;

  /// The source of the CMK's key material.
  ///
  /// When this value is <code>AWS_KMS</code>, AWS KMS created the key material.
  ///
  /// When this value is <code>EXTERNAL</code>, the key material was imported from
  /// your existing key management infrastructure or the CMK lacks key material.
  ///
  /// When this value is <code>AWS_CLOUDHSM</code>, the key material was created
  /// in the AWS CloudHSM cluster associated with a custom key store.
  final String? origin;

  AwsKmsKeyDetails({
    this.awsAccountId,
    this.creationDate,
    this.description,
    this.keyId,
    this.keyManager,
    this.keyState,
    this.origin,
  });

  factory AwsKmsKeyDetails.fromJson(Map<String, dynamic> json) {
    return AwsKmsKeyDetails(
      awsAccountId: json['AWSAccountId'] as String?,
      creationDate: json['CreationDate'] as double?,
      description: json['Description'] as String?,
      keyId: json['KeyId'] as String?,
      keyManager: json['KeyManager'] as String?,
      keyState: json['KeyState'] as String?,
      origin: json['Origin'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final creationDate = this.creationDate;
    final description = this.description;
    final keyId = this.keyId;
    final keyManager = this.keyManager;
    final keyState = this.keyState;
    final origin = this.origin;
    return {
      if (awsAccountId != null) 'AWSAccountId': awsAccountId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (description != null) 'Description': description,
      if (keyId != null) 'KeyId': keyId,
      if (keyManager != null) 'KeyManager': keyManager,
      if (keyState != null) 'KeyState': keyState,
      if (origin != null) 'Origin': origin,
    };
  }
}

/// The code for the Lambda function. You can specify either an object in Amazon
/// S3, or upload a deployment package directly.
class AwsLambdaFunctionCode {
  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket can
  /// be in a different AWS account.
  final String? s3Bucket;

  /// The Amazon S3 key of the deployment package.
  final String? s3Key;

  /// For versioned objects, the version of the deployment package object to use.
  final String? s3ObjectVersion;

  /// The base64-encoded contents of the deployment package. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  final String? zipFile;

  AwsLambdaFunctionCode({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });

  factory AwsLambdaFunctionCode.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionCode(
      s3Bucket: json['S3Bucket'] as String?,
      s3Key: json['S3Key'] as String?,
      s3ObjectVersion: json['S3ObjectVersion'] as String?,
      zipFile: json['ZipFile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    final zipFile = this.zipFile;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (zipFile != null) 'ZipFile': zipFile,
    };
  }
}

/// The dead-letter queue for failed asynchronous invocations.
class AwsLambdaFunctionDeadLetterConfig {
  /// The ARN of an Amazon SQS queue or Amazon SNS topic.
  final String? targetArn;

  AwsLambdaFunctionDeadLetterConfig({
    this.targetArn,
  });

  factory AwsLambdaFunctionDeadLetterConfig.fromJson(
      Map<String, dynamic> json) {
    return AwsLambdaFunctionDeadLetterConfig(
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetArn = this.targetArn;
    return {
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

/// Details about a function's configuration.
class AwsLambdaFunctionDetails {
  /// An <code>AwsLambdaFunctionCode</code> object.
  final AwsLambdaFunctionCode? code;

  /// The SHA256 hash of the function's deployment package.
  final String? codeSha256;

  /// The function's dead letter queue.
  final AwsLambdaFunctionDeadLetterConfig? deadLetterConfig;

  /// The function's environment variables.
  final AwsLambdaFunctionEnvironment? environment;

  /// The name of the function.
  final String? functionName;

  /// The function that Lambda calls to begin executing your function.
  final String? handler;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer managed CMK.
  final String? kmsKeyArn;

  /// Indicates when the function was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastModified;

  /// The function's layers.
  final List<AwsLambdaFunctionLayer>? layers;

  /// For Lambda@Edge functions, the ARN of the master function.
  final String? masterArn;

  /// The memory that is allocated to the function.
  final int? memorySize;

  /// The latest updated revision of the function or alias.
  final String? revisionId;

  /// The function's execution role.
  final String? role;

  /// The runtime environment for the Lambda function.
  final String? runtime;

  /// The amount of time that Lambda allows a function to run before stopping it.
  final int? timeout;

  /// The function's AWS X-Ray tracing configuration.
  final AwsLambdaFunctionTracingConfig? tracingConfig;

  /// The version of the Lambda function.
  final String? version;

  /// The function's networking configuration.
  final AwsLambdaFunctionVpcConfig? vpcConfig;

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

  factory AwsLambdaFunctionDetails.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionDetails(
      code: json['Code'] != null
          ? AwsLambdaFunctionCode.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      codeSha256: json['CodeSha256'] as String?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? AwsLambdaFunctionDeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      environment: json['Environment'] != null
          ? AwsLambdaFunctionEnvironment.fromJson(
              json['Environment'] as Map<String, dynamic>)
          : null,
      functionName: json['FunctionName'] as String?,
      handler: json['Handler'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastModified: json['LastModified'] as String?,
      layers: (json['Layers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AwsLambdaFunctionLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      masterArn: json['MasterArn'] as String?,
      memorySize: json['MemorySize'] as int?,
      revisionId: json['RevisionId'] as String?,
      role: json['Role'] as String?,
      runtime: json['Runtime'] as String?,
      timeout: json['Timeout'] as int?,
      tracingConfig: json['TracingConfig'] != null
          ? AwsLambdaFunctionTracingConfig.fromJson(
              json['TracingConfig'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? AwsLambdaFunctionVpcConfig.fromJson(
              json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final codeSha256 = this.codeSha256;
    final deadLetterConfig = this.deadLetterConfig;
    final environment = this.environment;
    final functionName = this.functionName;
    final handler = this.handler;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModified = this.lastModified;
    final layers = this.layers;
    final masterArn = this.masterArn;
    final memorySize = this.memorySize;
    final revisionId = this.revisionId;
    final role = this.role;
    final runtime = this.runtime;
    final timeout = this.timeout;
    final tracingConfig = this.tracingConfig;
    final version = this.version;
    final vpcConfig = this.vpcConfig;
    return {
      if (code != null) 'Code': code,
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (environment != null) 'Environment': environment,
      if (functionName != null) 'FunctionName': functionName,
      if (handler != null) 'Handler': handler,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (layers != null) 'Layers': layers,
      if (masterArn != null) 'MasterArn': masterArn,
      if (memorySize != null) 'MemorySize': memorySize,
      if (revisionId != null) 'RevisionId': revisionId,
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime,
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (version != null) 'Version': version,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// A function's environment variable settings.
class AwsLambdaFunctionEnvironment {
  /// An <code>AwsLambdaFunctionEnvironmentError</code> object.
  final AwsLambdaFunctionEnvironmentError? error;

  /// Environment variable key-value pairs.
  final Map<String, String>? variables;

  AwsLambdaFunctionEnvironment({
    this.error,
    this.variables,
  });

  factory AwsLambdaFunctionEnvironment.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionEnvironment(
      error: json['Error'] != null
          ? AwsLambdaFunctionEnvironmentError.fromJson(
              json['Error'] as Map<String, dynamic>)
          : null,
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final variables = this.variables;
    return {
      if (error != null) 'Error': error,
      if (variables != null) 'Variables': variables,
    };
  }
}

/// Error messages for environment variables that could not be applied.
class AwsLambdaFunctionEnvironmentError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? message;

  AwsLambdaFunctionEnvironmentError({
    this.errorCode,
    this.message,
  });

  factory AwsLambdaFunctionEnvironmentError.fromJson(
      Map<String, dynamic> json) {
    return AwsLambdaFunctionEnvironmentError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// An AWS Lambda layer.
class AwsLambdaFunctionLayer {
  /// The ARN of the function layer.
  final String? arn;

  /// The size of the layer archive in bytes.
  final int? codeSize;

  AwsLambdaFunctionLayer({
    this.arn,
    this.codeSize,
  });

  factory AwsLambdaFunctionLayer.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionLayer(
      arn: json['Arn'] as String?,
      codeSize: json['CodeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final codeSize = this.codeSize;
    return {
      if (arn != null) 'Arn': arn,
      if (codeSize != null) 'CodeSize': codeSize,
    };
  }
}

/// The function's AWS X-Ray tracing configuration.
class AwsLambdaFunctionTracingConfig {
  /// The tracing mode.
  final String? mode;

  AwsLambdaFunctionTracingConfig({
    this.mode,
  });

  factory AwsLambdaFunctionTracingConfig.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionTracingConfig(
      mode: json['Mode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode,
    };
  }
}

/// The VPC security groups and subnets that are attached to a Lambda function.
class AwsLambdaFunctionVpcConfig {
  /// A list of VPC security groups IDs.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  AwsLambdaFunctionVpcConfig({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory AwsLambdaFunctionVpcConfig.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionVpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Details about a Lambda layer version.
class AwsLambdaLayerVersionDetails {
  /// The layer's compatible runtimes. Maximum number of five items.
  ///
  /// Valid values: <code>nodejs10.x</code> | <code>nodejs12.x</code> |
  /// <code>java8</code> | <code>java11</code> | <code>python2.7</code> |
  /// <code>python3.6</code> | <code>python3.7</code> | <code>python3.8</code> |
  /// <code>dotnetcore1.0</code> | <code>dotnetcore2.1</code> | <code>go1.x</code>
  /// | <code>ruby2.5</code> | <code>provided</code>
  final List<String>? compatibleRuntimes;

  /// Indicates when the version was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdDate;

  /// The version number.
  final int? version;

  AwsLambdaLayerVersionDetails({
    this.compatibleRuntimes,
    this.createdDate,
    this.version,
  });

  factory AwsLambdaLayerVersionDetails.fromJson(Map<String, dynamic> json) {
    return AwsLambdaLayerVersionDetails(
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdDate: json['CreatedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleRuntimes = this.compatibleRuntimes;
    final createdDate = this.createdDate;
    final version = this.version;
    return {
      if (compatibleRuntimes != null) 'CompatibleRuntimes': compatibleRuntimes,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (version != null) 'Version': version,
    };
  }
}

/// An IAM role that is associated with the Amazon RDS DB cluster.
class AwsRdsDbClusterAssociatedRole {
  /// The ARN of the IAM role.
  final String? roleArn;

  /// The status of the association between the IAM role and the DB cluster.
  final String? status;

  AwsRdsDbClusterAssociatedRole({
    this.roleArn,
    this.status,
  });

  factory AwsRdsDbClusterAssociatedRole.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbClusterAssociatedRole(
      roleArn: json['RoleArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status,
    };
  }
}

/// Information about an Amazon RDS DB cluster.
class AwsRdsDbClusterDetails {
  /// The status of the database activity stream.
  final String? activityStreamStatus;

  /// For all database engines except Aurora, specifies the allocated storage size
  /// in gibibytes (GiB).
  final int? allocatedStorage;

  /// A list of the IAM roles that are associated with the DB cluster.
  final List<AwsRdsDbClusterAssociatedRole>? associatedRoles;

  /// A list of Availability Zones (AZs) where instances in the DB cluster can be
  /// created.
  final List<String>? availabilityZones;

  /// The number of days for which automated backups are retained.
  final int? backupRetentionPeriod;

  /// Indicates when the DB cluster was created, in Universal Coordinated Time
  /// (UTC).
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? clusterCreateTime;

  /// Whether tags are copied from the DB cluster to snapshots of the DB cluster.
  final bool? copyTagsToSnapshot;

  /// Whether the DB cluster is a clone of a DB cluster owned by a different AWS
  /// account.
  final bool? crossAccountClone;

  /// A list of custom endpoints for the DB cluster.
  final List<String>? customEndpoints;

  /// The name of the database.
  final String? databaseName;

  /// The DB cluster identifier that the user assigned to the cluster. This
  /// identifier is the unique key that identifies a DB cluster.
  final String? dbClusterIdentifier;

  /// The list of instances that make up the DB cluster.
  final List<AwsRdsDbClusterMember>? dbClusterMembers;

  /// The list of option group memberships for this DB cluster.
  final List<AwsRdsDbClusterOptionGroupMembership>?
      dbClusterOptionGroupMemberships;

  /// The name of the DB cluster parameter group for the DB cluster.
  final String? dbClusterParameterGroup;

  /// The identifier of the DB cluster. The identifier must be unique within each
  /// AWS Region and is immutable.
  final String? dbClusterResourceId;

  /// The subnet group that is associated with the DB cluster, including the name,
  /// description, and subnets in the subnet group.
  final String? dbSubnetGroup;

  /// Whether the DB cluster has deletion protection enabled.
  final bool? deletionProtection;

  /// The Active Directory domain membership records that are associated with the
  /// DB cluster.
  final List<AwsRdsDbDomainMembership>? domainMemberships;

  /// A list of log types that this DB cluster is configured to export to
  /// CloudWatch Logs.
  final List<String>? enabledCloudWatchLogsExports;

  /// The connection endpoint for the primary instance of the DB cluster.
  final String? endpoint;

  /// The name of the database engine to use for this DB cluster.
  final String? engine;

  /// The database engine mode of the DB cluster.
  final String? engineMode;

  /// The version number of the database engine to use.
  final String? engineVersion;

  /// Specifies the identifier that Amazon Route 53 assigns when you create a
  /// hosted zone.
  final String? hostedZoneId;

  /// Whether the HTTP endpoint for an Aurora Serverless DB cluster is enabled.
  final bool? httpEndpointEnabled;

  /// Whether the mapping of IAM accounts to database accounts is enabled.
  final bool? iamDatabaseAuthenticationEnabled;

  /// The ARN of the AWS KMS master key that is used to encrypt the database
  /// instances in the DB cluster.
  final String? kmsKeyId;

  /// The name of the master user for the DB cluster.
  final String? masterUsername;

  /// Whether the DB cluster has instances in multiple Availability Zones.
  final bool? multiAz;

  /// The port number on which the DB instances in the DB cluster accept
  /// connections.
  final int? port;

  /// The range of time each day when automated backups are created, if automated
  /// backups are enabled.
  ///
  /// Uses the format <code>HH:MM-HH:MM</code>. For example,
  /// <code>04:52-05:22</code>.
  final String? preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Uses the format <code>&lt;day&gt;:HH:MM-&lt;day&gt;:HH:MM</code>.
  ///
  /// For the day values, use
  /// <code>mon</code>|<code>tue</code>|<code>wed</code>|<code>thu</code>|<code>fri</code>|<code>sat</code>|<code>sun</code>.
  ///
  /// For example, <code>sun:09:32-sun:10:02</code>.
  final String? preferredMaintenanceWindow;

  /// The identifiers of the read replicas that are associated with this DB
  /// cluster.
  final List<String>? readReplicaIdentifiers;

  /// The reader endpoint for the DB cluster.
  final String? readerEndpoint;

  /// The current status of this DB cluster.
  final String? status;

  /// Whether the DB cluster is encrypted.
  final bool? storageEncrypted;

  /// A list of VPC security groups that the DB cluster belongs to.
  final List<AwsRdsDbInstanceVpcSecurityGroup>? vpcSecurityGroups;

  AwsRdsDbClusterDetails({
    this.activityStreamStatus,
    this.allocatedStorage,
    this.associatedRoles,
    this.availabilityZones,
    this.backupRetentionPeriod,
    this.clusterCreateTime,
    this.copyTagsToSnapshot,
    this.crossAccountClone,
    this.customEndpoints,
    this.databaseName,
    this.dbClusterIdentifier,
    this.dbClusterMembers,
    this.dbClusterOptionGroupMemberships,
    this.dbClusterParameterGroup,
    this.dbClusterResourceId,
    this.dbSubnetGroup,
    this.deletionProtection,
    this.domainMemberships,
    this.enabledCloudWatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineMode,
    this.engineVersion,
    this.hostedZoneId,
    this.httpEndpointEnabled,
    this.iamDatabaseAuthenticationEnabled,
    this.kmsKeyId,
    this.masterUsername,
    this.multiAz,
    this.port,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.readReplicaIdentifiers,
    this.readerEndpoint,
    this.status,
    this.storageEncrypted,
    this.vpcSecurityGroups,
  });

  factory AwsRdsDbClusterDetails.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbClusterDetails(
      activityStreamStatus: json['ActivityStreamStatus'] as String?,
      allocatedStorage: json['AllocatedStorage'] as int?,
      associatedRoles: (json['AssociatedRoles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbClusterAssociatedRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      backupRetentionPeriod: json['BackupRetentionPeriod'] as int?,
      clusterCreateTime: json['ClusterCreateTime'] as String?,
      copyTagsToSnapshot: json['CopyTagsToSnapshot'] as bool?,
      crossAccountClone: json['CrossAccountClone'] as bool?,
      customEndpoints: (json['CustomEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      databaseName: json['DatabaseName'] as String?,
      dbClusterIdentifier: json['DbClusterIdentifier'] as String?,
      dbClusterMembers: (json['DbClusterMembers'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRdsDbClusterMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      dbClusterOptionGroupMemberships:
          (json['DbClusterOptionGroupMemberships'] as List?)
              ?.whereNotNull()
              .map((e) => AwsRdsDbClusterOptionGroupMembership.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      dbClusterParameterGroup: json['DbClusterParameterGroup'] as String?,
      dbClusterResourceId: json['DbClusterResourceId'] as String?,
      dbSubnetGroup: json['DbSubnetGroup'] as String?,
      deletionProtection: json['DeletionProtection'] as bool?,
      domainMemberships: (json['DomainMemberships'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbDomainMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabledCloudWatchLogsExports:
          (json['EnabledCloudWatchLogsExports'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      endpoint: json['Endpoint'] as String?,
      engine: json['Engine'] as String?,
      engineMode: json['EngineMode'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      hostedZoneId: json['HostedZoneId'] as String?,
      httpEndpointEnabled: json['HttpEndpointEnabled'] as bool?,
      iamDatabaseAuthenticationEnabled:
          json['IamDatabaseAuthenticationEnabled'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      masterUsername: json['MasterUsername'] as String?,
      multiAz: json['MultiAz'] as bool?,
      port: json['Port'] as int?,
      preferredBackupWindow: json['PreferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      readReplicaIdentifiers: (json['ReadReplicaIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      readerEndpoint: json['ReaderEndpoint'] as String?,
      status: json['Status'] as String?,
      storageEncrypted: json['StorageEncrypted'] as bool?,
      vpcSecurityGroups: (json['VpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRdsDbInstanceVpcSecurityGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final activityStreamStatus = this.activityStreamStatus;
    final allocatedStorage = this.allocatedStorage;
    final associatedRoles = this.associatedRoles;
    final availabilityZones = this.availabilityZones;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final clusterCreateTime = this.clusterCreateTime;
    final copyTagsToSnapshot = this.copyTagsToSnapshot;
    final crossAccountClone = this.crossAccountClone;
    final customEndpoints = this.customEndpoints;
    final databaseName = this.databaseName;
    final dbClusterIdentifier = this.dbClusterIdentifier;
    final dbClusterMembers = this.dbClusterMembers;
    final dbClusterOptionGroupMemberships =
        this.dbClusterOptionGroupMemberships;
    final dbClusterParameterGroup = this.dbClusterParameterGroup;
    final dbClusterResourceId = this.dbClusterResourceId;
    final dbSubnetGroup = this.dbSubnetGroup;
    final deletionProtection = this.deletionProtection;
    final domainMemberships = this.domainMemberships;
    final enabledCloudWatchLogsExports = this.enabledCloudWatchLogsExports;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineMode = this.engineMode;
    final engineVersion = this.engineVersion;
    final hostedZoneId = this.hostedZoneId;
    final httpEndpointEnabled = this.httpEndpointEnabled;
    final iamDatabaseAuthenticationEnabled =
        this.iamDatabaseAuthenticationEnabled;
    final kmsKeyId = this.kmsKeyId;
    final masterUsername = this.masterUsername;
    final multiAz = this.multiAz;
    final port = this.port;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final readReplicaIdentifiers = this.readReplicaIdentifiers;
    final readerEndpoint = this.readerEndpoint;
    final status = this.status;
    final storageEncrypted = this.storageEncrypted;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (activityStreamStatus != null)
        'ActivityStreamStatus': activityStreamStatus,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (associatedRoles != null) 'AssociatedRoles': associatedRoles,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (clusterCreateTime != null) 'ClusterCreateTime': clusterCreateTime,
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (crossAccountClone != null) 'CrossAccountClone': crossAccountClone,
      if (customEndpoints != null) 'CustomEndpoints': customEndpoints,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (dbClusterIdentifier != null)
        'DbClusterIdentifier': dbClusterIdentifier,
      if (dbClusterMembers != null) 'DbClusterMembers': dbClusterMembers,
      if (dbClusterOptionGroupMemberships != null)
        'DbClusterOptionGroupMemberships': dbClusterOptionGroupMemberships,
      if (dbClusterParameterGroup != null)
        'DbClusterParameterGroup': dbClusterParameterGroup,
      if (dbClusterResourceId != null)
        'DbClusterResourceId': dbClusterResourceId,
      if (dbSubnetGroup != null) 'DbSubnetGroup': dbSubnetGroup,
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (domainMemberships != null) 'DomainMemberships': domainMemberships,
      if (enabledCloudWatchLogsExports != null)
        'EnabledCloudWatchLogsExports': enabledCloudWatchLogsExports,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineMode != null) 'EngineMode': engineMode,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (httpEndpointEnabled != null)
        'HttpEndpointEnabled': httpEndpointEnabled,
      if (iamDatabaseAuthenticationEnabled != null)
        'IamDatabaseAuthenticationEnabled': iamDatabaseAuthenticationEnabled,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (multiAz != null) 'MultiAz': multiAz,
      if (port != null) 'Port': port,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (readReplicaIdentifiers != null)
        'ReadReplicaIdentifiers': readReplicaIdentifiers,
      if (readerEndpoint != null) 'ReaderEndpoint': readerEndpoint,
      if (status != null) 'Status': status,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// Information about an instance in the DB cluster.
class AwsRdsDbClusterMember {
  /// The status of the DB cluster parameter group for this member of the DB
  /// cluster.
  final String? dbClusterParameterGroupStatus;

  /// The instance identifier for this member of the DB cluster.
  final String? dbInstanceIdentifier;

  /// Whether the cluster member is the primary instance for the DB cluster.
  final bool? isClusterWriter;

  /// Specifies the order in which an Aurora replica is promoted to the primary
  /// instance when the existing primary instance fails.
  final int? promotionTier;

  AwsRdsDbClusterMember({
    this.dbClusterParameterGroupStatus,
    this.dbInstanceIdentifier,
    this.isClusterWriter,
    this.promotionTier,
  });

  factory AwsRdsDbClusterMember.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbClusterMember(
      dbClusterParameterGroupStatus:
          json['DbClusterParameterGroupStatus'] as String?,
      dbInstanceIdentifier: json['DbInstanceIdentifier'] as String?,
      isClusterWriter: json['IsClusterWriter'] as bool?,
      promotionTier: json['PromotionTier'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterParameterGroupStatus = this.dbClusterParameterGroupStatus;
    final dbInstanceIdentifier = this.dbInstanceIdentifier;
    final isClusterWriter = this.isClusterWriter;
    final promotionTier = this.promotionTier;
    return {
      if (dbClusterParameterGroupStatus != null)
        'DbClusterParameterGroupStatus': dbClusterParameterGroupStatus,
      if (dbInstanceIdentifier != null)
        'DbInstanceIdentifier': dbInstanceIdentifier,
      if (isClusterWriter != null) 'IsClusterWriter': isClusterWriter,
      if (promotionTier != null) 'PromotionTier': promotionTier,
    };
  }
}

/// Information about an option group membership for a DB cluster.
class AwsRdsDbClusterOptionGroupMembership {
  /// The name of the DB cluster option group.
  final String? dbClusterOptionGroupName;

  /// The status of the DB cluster option group.
  final String? status;

  AwsRdsDbClusterOptionGroupMembership({
    this.dbClusterOptionGroupName,
    this.status,
  });

  factory AwsRdsDbClusterOptionGroupMembership.fromJson(
      Map<String, dynamic> json) {
    return AwsRdsDbClusterOptionGroupMembership(
      dbClusterOptionGroupName: json['DbClusterOptionGroupName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbClusterOptionGroupName = this.dbClusterOptionGroupName;
    final status = this.status;
    return {
      if (dbClusterOptionGroupName != null)
        'DbClusterOptionGroupName': dbClusterOptionGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Information about an Amazon RDS DB cluster snapshot.
class AwsRdsDbClusterSnapshotDetails {
  /// Specifies the allocated storage size in gibibytes (GiB).
  final int? allocatedStorage;

  /// A list of Availability Zones where instances in the DB cluster can be
  /// created.
  final List<String>? availabilityZones;

  /// Indicates when the DB cluster was created, in Universal Coordinated Time
  /// (UTC).
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? clusterCreateTime;

  /// The DB cluster identifier.
  final String? dbClusterIdentifier;

  /// The identifier of the DB cluster snapshot.
  final String? dbClusterSnapshotIdentifier;

  /// The name of the database engine that you want to use for this DB instance.
  final String? engine;

  /// The version of the database engine to use.
  final String? engineVersion;

  /// Whether mapping of IAM accounts to database accounts is enabled.
  final bool? iamDatabaseAuthenticationEnabled;

  /// The ARN of the AWS KMS master key that is used to encrypt the database
  /// instances in the DB cluster.
  final String? kmsKeyId;

  /// The license model information for this DB cluster snapshot.
  final String? licenseModel;

  /// The name of the master user for the DB cluster.
  final String? masterUsername;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int? percentProgress;

  /// The port number on which the DB instances in the DB cluster accept
  /// connections.
  final int? port;

  /// Indicates when the snapshot was taken.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? snapshotCreateTime;

  /// The type of DB cluster snapshot.
  final String? snapshotType;

  /// The status of this DB cluster snapshot.
  final String? status;

  /// Whether the DB cluster is encrypted.
  final bool? storageEncrypted;

  /// The VPC ID that is associated with the DB cluster snapshot.
  final String? vpcId;

  AwsRdsDbClusterSnapshotDetails({
    this.allocatedStorage,
    this.availabilityZones,
    this.clusterCreateTime,
    this.dbClusterIdentifier,
    this.dbClusterSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.iamDatabaseAuthenticationEnabled,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.percentProgress,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.status,
    this.storageEncrypted,
    this.vpcId,
  });

  factory AwsRdsDbClusterSnapshotDetails.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbClusterSnapshotDetails(
      allocatedStorage: json['AllocatedStorage'] as int?,
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      clusterCreateTime: json['ClusterCreateTime'] as String?,
      dbClusterIdentifier: json['DbClusterIdentifier'] as String?,
      dbClusterSnapshotIdentifier:
          json['DbClusterSnapshotIdentifier'] as String?,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      iamDatabaseAuthenticationEnabled:
          json['IamDatabaseAuthenticationEnabled'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      licenseModel: json['LicenseModel'] as String?,
      masterUsername: json['MasterUsername'] as String?,
      percentProgress: json['PercentProgress'] as int?,
      port: json['Port'] as int?,
      snapshotCreateTime: json['SnapshotCreateTime'] as String?,
      snapshotType: json['SnapshotType'] as String?,
      status: json['Status'] as String?,
      storageEncrypted: json['StorageEncrypted'] as bool?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final availabilityZones = this.availabilityZones;
    final clusterCreateTime = this.clusterCreateTime;
    final dbClusterIdentifier = this.dbClusterIdentifier;
    final dbClusterSnapshotIdentifier = this.dbClusterSnapshotIdentifier;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final iamDatabaseAuthenticationEnabled =
        this.iamDatabaseAuthenticationEnabled;
    final kmsKeyId = this.kmsKeyId;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final percentProgress = this.percentProgress;
    final port = this.port;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotType = this.snapshotType;
    final status = this.status;
    final storageEncrypted = this.storageEncrypted;
    final vpcId = this.vpcId;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (clusterCreateTime != null) 'ClusterCreateTime': clusterCreateTime,
      if (dbClusterIdentifier != null)
        'DbClusterIdentifier': dbClusterIdentifier,
      if (dbClusterSnapshotIdentifier != null)
        'DbClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iamDatabaseAuthenticationEnabled != null)
        'IamDatabaseAuthenticationEnabled': iamDatabaseAuthenticationEnabled,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (percentProgress != null) 'PercentProgress': percentProgress,
      if (port != null) 'Port': port,
      if (snapshotCreateTime != null) 'SnapshotCreateTime': snapshotCreateTime,
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (status != null) 'Status': status,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Information about an Active Directory domain membership record associated
/// with the DB instance.
class AwsRdsDbDomainMembership {
  /// The identifier of the Active Directory domain.
  final String? domain;

  /// The fully qualified domain name of the Active Directory domain.
  final String? fqdn;

  /// The name of the IAM role to use when making API calls to the Directory
  /// Service.
  final String? iamRoleName;

  /// The status of the Active Directory Domain membership for the DB instance.
  final String? status;

  AwsRdsDbDomainMembership({
    this.domain,
    this.fqdn,
    this.iamRoleName,
    this.status,
  });

  factory AwsRdsDbDomainMembership.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbDomainMembership(
      domain: json['Domain'] as String?,
      fqdn: json['Fqdn'] as String?,
      iamRoleName: json['IamRoleName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final fqdn = this.fqdn;
    final iamRoleName = this.iamRoleName;
    final status = this.status;
    return {
      if (domain != null) 'Domain': domain,
      if (fqdn != null) 'Fqdn': fqdn,
      if (iamRoleName != null) 'IamRoleName': iamRoleName,
      if (status != null) 'Status': status,
    };
  }
}

/// An AWS Identity and Access Management (IAM) role associated with the DB
/// instance.
class AwsRdsDbInstanceAssociatedRole {
  /// The name of the feature associated with the IAM)role.
  final String? featureName;

  /// The ARN of the IAM role that is associated with the DB instance.
  final String? roleArn;

  /// Describes the state of the association between the IAM role and the DB
  /// instance. The <code>Status</code> property returns one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The IAM role ARN is associated with the DB instance
  /// and can be used to access other AWS services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - The IAM role ARN is being associated with the DB
  /// instance.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - The IAM role ARN is associated with the DB instance.
  /// But the DB instance is unable to assume the IAM role in order to access
  /// other AWS services on your behalf.
  /// </li>
  /// </ul>
  final String? status;

  AwsRdsDbInstanceAssociatedRole({
    this.featureName,
    this.roleArn,
    this.status,
  });

  factory AwsRdsDbInstanceAssociatedRole.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbInstanceAssociatedRole(
      featureName: json['FeatureName'] as String?,
      roleArn: json['RoleArn'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final featureName = this.featureName;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (featureName != null) 'FeatureName': featureName,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status,
    };
  }
}

/// Contains the details of an Amazon RDS DB instance.
class AwsRdsDbInstanceDetails {
  /// The amount of storage (in gigabytes) to initially allocate for the DB
  /// instance.
  final int? allocatedStorage;

  /// The AWS Identity and Access Management (IAM) roles associated with the DB
  /// instance.
  final List<AwsRdsDbInstanceAssociatedRole>? associatedRoles;

  /// Indicates whether minor version patches are applied automatically.
  final bool? autoMinorVersionUpgrade;

  /// The Availability Zone where the DB instance will be created.
  final String? availabilityZone;

  /// The number of days for which to retain automated backups.
  final int? backupRetentionPeriod;

  /// The identifier of the CA certificate for this DB instance.
  final String? cACertificateIdentifier;

  /// The name of the character set that this DB instance is associated with.
  final String? characterSetName;

  /// Whether to copy resource tags to snapshots of the DB instance.
  final bool? copyTagsToSnapshot;

  /// If the DB instance is a member of a DB cluster, contains the name of the DB
  /// cluster that the DB instance is a member of.
  final String? dBClusterIdentifier;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  final String? dBInstanceClass;

  /// Contains a user-supplied database identifier. This identifier is the unique
  /// key that identifies a DB instance.
  final String? dBInstanceIdentifier;

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
  final String? dBName;

  /// Specifies the port that the DB instance listens on. If the DB instance is
  /// part of a DB cluster, this can be a different port than the DB cluster port.
  final int? dbInstancePort;

  /// The current status of the DB instance.
  final String? dbInstanceStatus;

  /// A list of the DB parameter groups to assign to the DB instance.
  final List<AwsRdsDbParameterGroup>? dbParameterGroups;

  /// A list of the DB security groups to assign to the DB instance.
  final List<String>? dbSecurityGroups;

  /// Information about the subnet group that is associated with the DB instance.
  final AwsRdsDbSubnetGroup? dbSubnetGroup;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB instance is accessed.
  final String? dbiResourceId;

  /// Indicates whether the DB instance has deletion protection enabled.
  ///
  /// When deletion protection is enabled, the database cannot be deleted.
  final bool? deletionProtection;

  /// The Active Directory domain membership records associated with the DB
  /// instance.
  final List<AwsRdsDbDomainMembership>? domainMemberships;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  final List<String>? enabledCloudWatchLogsExports;

  /// Specifies the connection endpoint.
  final AwsRdsDbInstanceEndpoint? endpoint;

  /// Provides the name of the database engine to use for this DB instance.
  final String? engine;

  /// Indicates the database engine version.
  final String? engineVersion;

  /// The ARN of the CloudWatch Logs log stream that receives the enhanced
  /// monitoring metrics data for the DB instance.
  final String? enhancedMonitoringResourceArn;

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
  final bool? iAMDatabaseAuthenticationEnabled;

  /// Indicates when the DB instance was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? instanceCreateTime;

  /// Specifies the provisioned IOPS (I/O operations per second) for this DB
  /// instance.
  final int? iops;

  /// If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB instance.
  final String? kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? latestRestorableTime;

  /// License model information for this DB instance.
  final String? licenseModel;
  final AwsRdsDbInstanceEndpoint? listenerEndpoint;

  /// The master user name of the DB instance.
  final String? masterUsername;

  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  final int? maxAllocatedStorage;

  /// The interval, in seconds, between points when enhanced monitoring metrics
  /// are collected for the DB instance.
  final int? monitoringInterval;

  /// The ARN for the IAM role that permits Amazon RDS to send enhanced monitoring
  /// metrics to CloudWatch Logs.
  final String? monitoringRoleArn;

  /// Whether the DB instance is a multiple Availability Zone deployment.
  final bool? multiAz;

  /// The list of option group memberships for this DB instance.
  final List<AwsRdsDbOptionGroupMembership>? optionGroupMemberships;

  /// Changes to the DB instance that are currently pending.
  final AwsRdsDbPendingModifiedValues? pendingModifiedValues;

  /// Indicates whether Performance Insights is enabled for the DB instance.
  final bool? performanceInsightsEnabled;

  /// The identifier of the AWS KMS key used to encrypt the Performance Insights
  /// data.
  final String? performanceInsightsKmsKeyId;

  /// The number of days to retain Performance Insights data.
  final int? performanceInsightsRetentionPeriod;

  /// The range of time each day when automated backups are created, if automated
  /// backups are enabled.
  ///
  /// Uses the format <code>HH:MM-HH:MM</code>. For example,
  /// <code>04:52-05:22</code>.
  final String? preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Uses the format <code>&lt;day&gt;:HH:MM-&lt;day&gt;:HH:MM</code>.
  ///
  /// For the day values, use
  /// <code>mon</code>|<code>tue</code>|<code>wed</code>|<code>thu</code>|<code>fri</code>|<code>sat</code>|<code>sun</code>.
  ///
  /// For example, <code>sun:09:32-sun:10:02</code>.
  final String? preferredMaintenanceWindow;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<AwsRdsDbProcessorFeature>? processorFeatures;

  /// The order in which to promote an Aurora replica to the primary instance
  /// after a failure of the existing primary instance.
  final int? promotionTier;

  /// Specifies the accessibility options for the DB instance.
  ///
  /// A value of true specifies an Internet-facing instance with a publicly
  /// resolvable DNS name, which resolves to a public IP address.
  ///
  /// A value of false specifies an internal instance with a DNS name that
  /// resolves to a private IP address.
  final bool? publiclyAccessible;

  /// List of identifiers of Aurora DB clusters to which the RDS DB instance is
  /// replicated as a read replica.
  final List<String>? readReplicaDBClusterIdentifiers;

  /// List of identifiers of the read replicas associated with this DB instance.
  final List<String>? readReplicaDBInstanceIdentifiers;

  /// If this DB instance is a read replica, contains the identifier of the source
  /// DB instance.
  final String? readReplicaSourceDBInstanceIdentifier;

  /// For a DB instance with multi-Availability Zone support, the name of the
  /// secondary Availability Zone.
  final String? secondaryAvailabilityZone;

  /// The status of a read replica. If the instance isn't a read replica, this is
  /// empty.
  final List<AwsRdsDbStatusInfo>? statusInfos;

  /// Specifies whether the DB instance is encrypted.
  final bool? storageEncrypted;

  /// The storage type for the DB instance.
  final String? storageType;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  final String? tdeCredentialArn;

  /// The time zone of the DB instance.
  final String? timezone;

  /// A list of VPC security groups that the DB instance belongs to.
  final List<AwsRdsDbInstanceVpcSecurityGroup>? vpcSecurityGroups;

  AwsRdsDbInstanceDetails({
    this.allocatedStorage,
    this.associatedRoles,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.cACertificateIdentifier,
    this.characterSetName,
    this.copyTagsToSnapshot,
    this.dBClusterIdentifier,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBName,
    this.dbInstancePort,
    this.dbInstanceStatus,
    this.dbParameterGroups,
    this.dbSecurityGroups,
    this.dbSubnetGroup,
    this.dbiResourceId,
    this.deletionProtection,
    this.domainMemberships,
    this.enabledCloudWatchLogsExports,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.enhancedMonitoringResourceArn,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.latestRestorableTime,
    this.licenseModel,
    this.listenerEndpoint,
    this.masterUsername,
    this.maxAllocatedStorage,
    this.monitoringInterval,
    this.monitoringRoleArn,
    this.multiAz,
    this.optionGroupMemberships,
    this.pendingModifiedValues,
    this.performanceInsightsEnabled,
    this.performanceInsightsKmsKeyId,
    this.performanceInsightsRetentionPeriod,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.processorFeatures,
    this.promotionTier,
    this.publiclyAccessible,
    this.readReplicaDBClusterIdentifiers,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.secondaryAvailabilityZone,
    this.statusInfos,
    this.storageEncrypted,
    this.storageType,
    this.tdeCredentialArn,
    this.timezone,
    this.vpcSecurityGroups,
  });

  factory AwsRdsDbInstanceDetails.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbInstanceDetails(
      allocatedStorage: json['AllocatedStorage'] as int?,
      associatedRoles: (json['AssociatedRoles'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRdsDbInstanceAssociatedRole.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool?,
      availabilityZone: json['AvailabilityZone'] as String?,
      backupRetentionPeriod: json['BackupRetentionPeriod'] as int?,
      cACertificateIdentifier: json['CACertificateIdentifier'] as String?,
      characterSetName: json['CharacterSetName'] as String?,
      copyTagsToSnapshot: json['CopyTagsToSnapshot'] as bool?,
      dBClusterIdentifier: json['DBClusterIdentifier'] as String?,
      dBInstanceClass: json['DBInstanceClass'] as String?,
      dBInstanceIdentifier: json['DBInstanceIdentifier'] as String?,
      dBName: json['DBName'] as String?,
      dbInstancePort: json['DbInstancePort'] as int?,
      dbInstanceStatus: json['DbInstanceStatus'] as String?,
      dbParameterGroups: (json['DbParameterGroups'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AwsRdsDbParameterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      dbSecurityGroups: (json['DbSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dbSubnetGroup: json['DbSubnetGroup'] != null
          ? AwsRdsDbSubnetGroup.fromJson(
              json['DbSubnetGroup'] as Map<String, dynamic>)
          : null,
      dbiResourceId: json['DbiResourceId'] as String?,
      deletionProtection: json['DeletionProtection'] as bool?,
      domainMemberships: (json['DomainMemberships'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbDomainMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabledCloudWatchLogsExports:
          (json['EnabledCloudWatchLogsExports'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      endpoint: json['Endpoint'] != null
          ? AwsRdsDbInstanceEndpoint.fromJson(
              json['Endpoint'] as Map<String, dynamic>)
          : null,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      enhancedMonitoringResourceArn:
          json['EnhancedMonitoringResourceArn'] as String?,
      iAMDatabaseAuthenticationEnabled:
          json['IAMDatabaseAuthenticationEnabled'] as bool?,
      instanceCreateTime: json['InstanceCreateTime'] as String?,
      iops: json['Iops'] as int?,
      kmsKeyId: json['KmsKeyId'] as String?,
      latestRestorableTime: json['LatestRestorableTime'] as String?,
      licenseModel: json['LicenseModel'] as String?,
      listenerEndpoint: json['ListenerEndpoint'] != null
          ? AwsRdsDbInstanceEndpoint.fromJson(
              json['ListenerEndpoint'] as Map<String, dynamic>)
          : null,
      masterUsername: json['MasterUsername'] as String?,
      maxAllocatedStorage: json['MaxAllocatedStorage'] as int?,
      monitoringInterval: json['MonitoringInterval'] as int?,
      monitoringRoleArn: json['MonitoringRoleArn'] as String?,
      multiAz: json['MultiAz'] as bool?,
      optionGroupMemberships: (json['OptionGroupMemberships'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbOptionGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingModifiedValues: json['PendingModifiedValues'] != null
          ? AwsRdsDbPendingModifiedValues.fromJson(
              json['PendingModifiedValues'] as Map<String, dynamic>)
          : null,
      performanceInsightsEnabled: json['PerformanceInsightsEnabled'] as bool?,
      performanceInsightsKmsKeyId:
          json['PerformanceInsightsKmsKeyId'] as String?,
      performanceInsightsRetentionPeriod:
          json['PerformanceInsightsRetentionPeriod'] as int?,
      preferredBackupWindow: json['PreferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      processorFeatures: (json['ProcessorFeatures'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
      promotionTier: json['PromotionTier'] as int?,
      publiclyAccessible: json['PubliclyAccessible'] as bool?,
      readReplicaDBClusterIdentifiers:
          (json['ReadReplicaDBClusterIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      readReplicaDBInstanceIdentifiers:
          (json['ReadReplicaDBInstanceIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      readReplicaSourceDBInstanceIdentifier:
          json['ReadReplicaSourceDBInstanceIdentifier'] as String?,
      secondaryAvailabilityZone: json['SecondaryAvailabilityZone'] as String?,
      statusInfos: (json['StatusInfos'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRdsDbStatusInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      storageEncrypted: json['StorageEncrypted'] as bool?,
      storageType: json['StorageType'] as String?,
      tdeCredentialArn: json['TdeCredentialArn'] as String?,
      timezone: json['Timezone'] as String?,
      vpcSecurityGroups: (json['VpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRdsDbInstanceVpcSecurityGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final associatedRoles = this.associatedRoles;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final availabilityZone = this.availabilityZone;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final cACertificateIdentifier = this.cACertificateIdentifier;
    final characterSetName = this.characterSetName;
    final copyTagsToSnapshot = this.copyTagsToSnapshot;
    final dBClusterIdentifier = this.dBClusterIdentifier;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final dBName = this.dBName;
    final dbInstancePort = this.dbInstancePort;
    final dbInstanceStatus = this.dbInstanceStatus;
    final dbParameterGroups = this.dbParameterGroups;
    final dbSecurityGroups = this.dbSecurityGroups;
    final dbSubnetGroup = this.dbSubnetGroup;
    final dbiResourceId = this.dbiResourceId;
    final deletionProtection = this.deletionProtection;
    final domainMemberships = this.domainMemberships;
    final enabledCloudWatchLogsExports = this.enabledCloudWatchLogsExports;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final enhancedMonitoringResourceArn = this.enhancedMonitoringResourceArn;
    final iAMDatabaseAuthenticationEnabled =
        this.iAMDatabaseAuthenticationEnabled;
    final instanceCreateTime = this.instanceCreateTime;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final latestRestorableTime = this.latestRestorableTime;
    final licenseModel = this.licenseModel;
    final listenerEndpoint = this.listenerEndpoint;
    final masterUsername = this.masterUsername;
    final maxAllocatedStorage = this.maxAllocatedStorage;
    final monitoringInterval = this.monitoringInterval;
    final monitoringRoleArn = this.monitoringRoleArn;
    final multiAz = this.multiAz;
    final optionGroupMemberships = this.optionGroupMemberships;
    final pendingModifiedValues = this.pendingModifiedValues;
    final performanceInsightsEnabled = this.performanceInsightsEnabled;
    final performanceInsightsKmsKeyId = this.performanceInsightsKmsKeyId;
    final performanceInsightsRetentionPeriod =
        this.performanceInsightsRetentionPeriod;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final processorFeatures = this.processorFeatures;
    final promotionTier = this.promotionTier;
    final publiclyAccessible = this.publiclyAccessible;
    final readReplicaDBClusterIdentifiers =
        this.readReplicaDBClusterIdentifiers;
    final readReplicaDBInstanceIdentifiers =
        this.readReplicaDBInstanceIdentifiers;
    final readReplicaSourceDBInstanceIdentifier =
        this.readReplicaSourceDBInstanceIdentifier;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final statusInfos = this.statusInfos;
    final storageEncrypted = this.storageEncrypted;
    final storageType = this.storageType;
    final tdeCredentialArn = this.tdeCredentialArn;
    final timezone = this.timezone;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (associatedRoles != null) 'AssociatedRoles': associatedRoles,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (cACertificateIdentifier != null)
        'CACertificateIdentifier': cACertificateIdentifier,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (dBClusterIdentifier != null)
        'DBClusterIdentifier': dBClusterIdentifier,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBName != null) 'DBName': dBName,
      if (dbInstancePort != null) 'DbInstancePort': dbInstancePort,
      if (dbInstanceStatus != null) 'DbInstanceStatus': dbInstanceStatus,
      if (dbParameterGroups != null) 'DbParameterGroups': dbParameterGroups,
      if (dbSecurityGroups != null) 'DbSecurityGroups': dbSecurityGroups,
      if (dbSubnetGroup != null) 'DbSubnetGroup': dbSubnetGroup,
      if (dbiResourceId != null) 'DbiResourceId': dbiResourceId,
      if (deletionProtection != null) 'DeletionProtection': deletionProtection,
      if (domainMemberships != null) 'DomainMemberships': domainMemberships,
      if (enabledCloudWatchLogsExports != null)
        'EnabledCloudWatchLogsExports': enabledCloudWatchLogsExports,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (enhancedMonitoringResourceArn != null)
        'EnhancedMonitoringResourceArn': enhancedMonitoringResourceArn,
      if (iAMDatabaseAuthenticationEnabled != null)
        'IAMDatabaseAuthenticationEnabled': iAMDatabaseAuthenticationEnabled,
      if (instanceCreateTime != null) 'InstanceCreateTime': instanceCreateTime,
      if (iops != null) 'Iops': iops,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (latestRestorableTime != null)
        'LatestRestorableTime': latestRestorableTime,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (listenerEndpoint != null) 'ListenerEndpoint': listenerEndpoint,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (maxAllocatedStorage != null)
        'MaxAllocatedStorage': maxAllocatedStorage,
      if (monitoringInterval != null) 'MonitoringInterval': monitoringInterval,
      if (monitoringRoleArn != null) 'MonitoringRoleArn': monitoringRoleArn,
      if (multiAz != null) 'MultiAz': multiAz,
      if (optionGroupMemberships != null)
        'OptionGroupMemberships': optionGroupMemberships,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (performanceInsightsEnabled != null)
        'PerformanceInsightsEnabled': performanceInsightsEnabled,
      if (performanceInsightsKmsKeyId != null)
        'PerformanceInsightsKmsKeyId': performanceInsightsKmsKeyId,
      if (performanceInsightsRetentionPeriod != null)
        'PerformanceInsightsRetentionPeriod':
            performanceInsightsRetentionPeriod,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (processorFeatures != null) 'ProcessorFeatures': processorFeatures,
      if (promotionTier != null) 'PromotionTier': promotionTier,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (readReplicaDBClusterIdentifiers != null)
        'ReadReplicaDBClusterIdentifiers': readReplicaDBClusterIdentifiers,
      if (readReplicaDBInstanceIdentifiers != null)
        'ReadReplicaDBInstanceIdentifiers': readReplicaDBInstanceIdentifiers,
      if (readReplicaSourceDBInstanceIdentifier != null)
        'ReadReplicaSourceDBInstanceIdentifier':
            readReplicaSourceDBInstanceIdentifier,
      if (secondaryAvailabilityZone != null)
        'SecondaryAvailabilityZone': secondaryAvailabilityZone,
      if (statusInfos != null) 'StatusInfos': statusInfos,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (timezone != null) 'Timezone': timezone,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// Specifies the connection endpoint.
class AwsRdsDbInstanceEndpoint {
  /// Specifies the DNS address of the DB instance.
  final String? address;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  final String? hostedZoneId;

  /// Specifies the port that the database engine is listening on.
  final int? port;

  AwsRdsDbInstanceEndpoint({
    this.address,
    this.hostedZoneId,
    this.port,
  });

  factory AwsRdsDbInstanceEndpoint.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbInstanceEndpoint(
      address: json['Address'] as String?,
      hostedZoneId: json['HostedZoneId'] as String?,
      port: json['Port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final hostedZoneId = this.hostedZoneId;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
      if (port != null) 'Port': port,
    };
  }
}

/// A VPC security groups that the DB instance belongs to.
class AwsRdsDbInstanceVpcSecurityGroup {
  /// The status of the VPC security group.
  final String? status;

  /// The name of the VPC security group.
  final String? vpcSecurityGroupId;

  AwsRdsDbInstanceVpcSecurityGroup({
    this.status,
    this.vpcSecurityGroupId,
  });

  factory AwsRdsDbInstanceVpcSecurityGroup.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbInstanceVpcSecurityGroup(
      status: json['Status'] as String?,
      vpcSecurityGroupId: json['VpcSecurityGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

/// An option group membership.
class AwsRdsDbOptionGroupMembership {
  /// The name of the option group.
  final String? optionGroupName;

  /// The status of the option group membership.
  final String? status;

  AwsRdsDbOptionGroupMembership({
    this.optionGroupName,
    this.status,
  });

  factory AwsRdsDbOptionGroupMembership.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbOptionGroupMembership(
      optionGroupName: json['OptionGroupName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final optionGroupName = this.optionGroupName;
    final status = this.status;
    return {
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides information about a parameter group for a DB instance.
class AwsRdsDbParameterGroup {
  /// The name of the parameter group.
  final String? dbParameterGroupName;

  /// The status of parameter updates.
  final String? parameterApplyStatus;

  AwsRdsDbParameterGroup({
    this.dbParameterGroupName,
    this.parameterApplyStatus,
  });

  factory AwsRdsDbParameterGroup.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbParameterGroup(
      dbParameterGroupName: json['DbParameterGroupName'] as String?,
      parameterApplyStatus: json['ParameterApplyStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbParameterGroupName = this.dbParameterGroupName;
    final parameterApplyStatus = this.parameterApplyStatus;
    return {
      if (dbParameterGroupName != null)
        'DbParameterGroupName': dbParameterGroupName,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
    };
  }
}

/// Changes to a DB instance that are currently pending.
class AwsRdsDbPendingModifiedValues {
  /// The new value of the allocated storage for the DB instance.
  final int? allocatedStorage;

  /// The new backup retention period for the DB instance.
  final int? backupRetentionPeriod;

  /// The new CA certificate identifier for the DB instance.
  final String? caCertificateIdentifier;

  /// The new DB instance class for the DB instance.
  final String? dbInstanceClass;

  /// The new DB instance identifier for the DB instance.
  final String? dbInstanceIdentifier;

  /// The name of the new subnet group for the DB instance.
  final String? dbSubnetGroupName;

  /// The new engine version for the DB instance.
  final String? engineVersion;

  /// The new provisioned IOPS value for the DB instance.
  final int? iops;

  /// The new license model value for the DB instance.
  final String? licenseModel;

  /// The new master user password for the DB instance.
  final String? masterUserPassword;

  /// Indicates that a single Availability Zone DB instance is changing to a
  /// multiple Availability Zone deployment.
  final bool? multiAZ;

  /// A list of log types that are being enabled or disabled.
  final AwsRdsPendingCloudWatchLogsExports? pendingCloudWatchLogsExports;

  /// The new port for the DB instance.
  final int? port;

  /// Processor features that are being updated.
  final List<AwsRdsDbProcessorFeature>? processorFeatures;

  /// The new storage type for the DB instance.
  final String? storageType;

  AwsRdsDbPendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.caCertificateIdentifier,
    this.dbInstanceClass,
    this.dbInstanceIdentifier,
    this.dbSubnetGroupName,
    this.engineVersion,
    this.iops,
    this.licenseModel,
    this.masterUserPassword,
    this.multiAZ,
    this.pendingCloudWatchLogsExports,
    this.port,
    this.processorFeatures,
    this.storageType,
  });

  factory AwsRdsDbPendingModifiedValues.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbPendingModifiedValues(
      allocatedStorage: json['AllocatedStorage'] as int?,
      backupRetentionPeriod: json['BackupRetentionPeriod'] as int?,
      caCertificateIdentifier: json['CaCertificateIdentifier'] as String?,
      dbInstanceClass: json['DbInstanceClass'] as String?,
      dbInstanceIdentifier: json['DbInstanceIdentifier'] as String?,
      dbSubnetGroupName: json['DbSubnetGroupName'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      iops: json['Iops'] as int?,
      licenseModel: json['LicenseModel'] as String?,
      masterUserPassword: json['MasterUserPassword'] as String?,
      multiAZ: json['MultiAZ'] as bool?,
      pendingCloudWatchLogsExports: json['PendingCloudWatchLogsExports'] != null
          ? AwsRdsPendingCloudWatchLogsExports.fromJson(
              json['PendingCloudWatchLogsExports'] as Map<String, dynamic>)
          : null,
      port: json['Port'] as int?,
      processorFeatures: (json['ProcessorFeatures'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
      storageType: json['StorageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final caCertificateIdentifier = this.caCertificateIdentifier;
    final dbInstanceClass = this.dbInstanceClass;
    final dbInstanceIdentifier = this.dbInstanceIdentifier;
    final dbSubnetGroupName = this.dbSubnetGroupName;
    final engineVersion = this.engineVersion;
    final iops = this.iops;
    final licenseModel = this.licenseModel;
    final masterUserPassword = this.masterUserPassword;
    final multiAZ = this.multiAZ;
    final pendingCloudWatchLogsExports = this.pendingCloudWatchLogsExports;
    final port = this.port;
    final processorFeatures = this.processorFeatures;
    final storageType = this.storageType;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (caCertificateIdentifier != null)
        'CaCertificateIdentifier': caCertificateIdentifier,
      if (dbInstanceClass != null) 'DbInstanceClass': dbInstanceClass,
      if (dbInstanceIdentifier != null)
        'DbInstanceIdentifier': dbInstanceIdentifier,
      if (dbSubnetGroupName != null) 'DbSubnetGroupName': dbSubnetGroupName,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iops != null) 'Iops': iops,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (pendingCloudWatchLogsExports != null)
        'PendingCloudWatchLogsExports': pendingCloudWatchLogsExports,
      if (port != null) 'Port': port,
      if (processorFeatures != null) 'ProcessorFeatures': processorFeatures,
      if (storageType != null) 'StorageType': storageType,
    };
  }
}

/// A processor feature.
class AwsRdsDbProcessorFeature {
  /// The name of the processor feature.
  final String? name;

  /// The value of the processor feature.
  final String? value;

  AwsRdsDbProcessorFeature({
    this.name,
    this.value,
  });

  factory AwsRdsDbProcessorFeature.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbProcessorFeature(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Provides details about an Amazon RDS DB cluster snapshot.
class AwsRdsDbSnapshotDetails {
  /// The amount of storage (in gigabytes) to be initially allocated for the
  /// database instance.
  final int? allocatedStorage;

  /// Specifies the name of the Availability Zone in which the DB instance was
  /// located at the time of the DB snapshot.
  final String? availabilityZone;

  /// A name for the DB instance.
  final String? dbInstanceIdentifier;

  /// The name or ARN of the DB snapshot that is used to restore the DB instance.
  final String? dbSnapshotIdentifier;

  /// The identifier for the source DB instance.
  final String? dbiResourceId;

  /// Whether the DB snapshot is encrypted.
  final bool? encrypted;

  /// The name of the database engine to use for this DB instance.
  final String? engine;

  /// The version of the database engine.
  final String? engineVersion;

  /// Whether mapping of IAM accounts to database accounts is enabled.
  final bool? iamDatabaseAuthenticationEnabled;

  /// Specifies the time in Coordinated Universal Time (UTC) when the DB instance,
  /// from which the snapshot was taken, was created.
  final String? instanceCreateTime;

  /// The provisioned IOPS (I/O operations per second) value of the DB instance at
  /// the time of the snapshot.
  final int? iops;

  /// If <code>Encrypted</code> is <code>true</code>, the AWS KMS key identifier
  /// for the encrypted DB snapshot.
  final String? kmsKeyId;

  /// License model information for the restored DB instance.
  final String? licenseModel;

  /// The master user name for the DB snapshot.
  final String? masterUsername;

  /// The option group name for the DB snapshot.
  final String? optionGroupName;

  /// The percentage of the estimated data that has been transferred.
  final int? percentProgress;

  /// The port that the database engine was listening on at the time of the
  /// snapshot.
  final int? port;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<AwsRdsDbProcessorFeature>? processorFeatures;

  /// When the snapshot was taken in Coordinated Universal Time (UTC).
  final String? snapshotCreateTime;

  /// The type of the DB snapshot.
  final String? snapshotType;

  /// The DB snapshot ARN that the DB snapshot was copied from.
  final String? sourceDbSnapshotIdentifier;

  /// The AWS Region that the DB snapshot was created in or copied from.
  final String? sourceRegion;

  /// The status of this DB snapshot.
  final String? status;

  /// The storage type associated with the DB snapshot.
  final String? storageType;

  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  final String? tdeCredentialArn;

  /// The time zone of the DB snapshot.
  final String? timezone;

  /// The VPC ID associated with the DB snapshot.
  final String? vpcId;

  AwsRdsDbSnapshotDetails({
    this.allocatedStorage,
    this.availabilityZone,
    this.dbInstanceIdentifier,
    this.dbSnapshotIdentifier,
    this.dbiResourceId,
    this.encrypted,
    this.engine,
    this.engineVersion,
    this.iamDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.iops,
    this.kmsKeyId,
    this.licenseModel,
    this.masterUsername,
    this.optionGroupName,
    this.percentProgress,
    this.port,
    this.processorFeatures,
    this.snapshotCreateTime,
    this.snapshotType,
    this.sourceDbSnapshotIdentifier,
    this.sourceRegion,
    this.status,
    this.storageType,
    this.tdeCredentialArn,
    this.timezone,
    this.vpcId,
  });

  factory AwsRdsDbSnapshotDetails.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbSnapshotDetails(
      allocatedStorage: json['AllocatedStorage'] as int?,
      availabilityZone: json['AvailabilityZone'] as String?,
      dbInstanceIdentifier: json['DbInstanceIdentifier'] as String?,
      dbSnapshotIdentifier: json['DbSnapshotIdentifier'] as String?,
      dbiResourceId: json['DbiResourceId'] as String?,
      encrypted: json['Encrypted'] as bool?,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      iamDatabaseAuthenticationEnabled:
          json['IamDatabaseAuthenticationEnabled'] as bool?,
      instanceCreateTime: json['InstanceCreateTime'] as String?,
      iops: json['Iops'] as int?,
      kmsKeyId: json['KmsKeyId'] as String?,
      licenseModel: json['LicenseModel'] as String?,
      masterUsername: json['MasterUsername'] as String?,
      optionGroupName: json['OptionGroupName'] as String?,
      percentProgress: json['PercentProgress'] as int?,
      port: json['Port'] as int?,
      processorFeatures: (json['ProcessorFeatures'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
      snapshotCreateTime: json['SnapshotCreateTime'] as String?,
      snapshotType: json['SnapshotType'] as String?,
      sourceDbSnapshotIdentifier: json['SourceDbSnapshotIdentifier'] as String?,
      sourceRegion: json['SourceRegion'] as String?,
      status: json['Status'] as String?,
      storageType: json['StorageType'] as String?,
      tdeCredentialArn: json['TdeCredentialArn'] as String?,
      timezone: json['Timezone'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dbInstanceIdentifier = this.dbInstanceIdentifier;
    final dbSnapshotIdentifier = this.dbSnapshotIdentifier;
    final dbiResourceId = this.dbiResourceId;
    final encrypted = this.encrypted;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final iamDatabaseAuthenticationEnabled =
        this.iamDatabaseAuthenticationEnabled;
    final instanceCreateTime = this.instanceCreateTime;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final optionGroupName = this.optionGroupName;
    final percentProgress = this.percentProgress;
    final port = this.port;
    final processorFeatures = this.processorFeatures;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotType = this.snapshotType;
    final sourceDbSnapshotIdentifier = this.sourceDbSnapshotIdentifier;
    final sourceRegion = this.sourceRegion;
    final status = this.status;
    final storageType = this.storageType;
    final tdeCredentialArn = this.tdeCredentialArn;
    final timezone = this.timezone;
    final vpcId = this.vpcId;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dbInstanceIdentifier != null)
        'DbInstanceIdentifier': dbInstanceIdentifier,
      if (dbSnapshotIdentifier != null)
        'DbSnapshotIdentifier': dbSnapshotIdentifier,
      if (dbiResourceId != null) 'DbiResourceId': dbiResourceId,
      if (encrypted != null) 'Encrypted': encrypted,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iamDatabaseAuthenticationEnabled != null)
        'IamDatabaseAuthenticationEnabled': iamDatabaseAuthenticationEnabled,
      if (instanceCreateTime != null) 'InstanceCreateTime': instanceCreateTime,
      if (iops != null) 'Iops': iops,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (percentProgress != null) 'PercentProgress': percentProgress,
      if (port != null) 'Port': port,
      if (processorFeatures != null) 'ProcessorFeatures': processorFeatures,
      if (snapshotCreateTime != null) 'SnapshotCreateTime': snapshotCreateTime,
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (sourceDbSnapshotIdentifier != null)
        'SourceDbSnapshotIdentifier': sourceDbSnapshotIdentifier,
      if (sourceRegion != null) 'SourceRegion': sourceRegion,
      if (status != null) 'Status': status,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (timezone != null) 'Timezone': timezone,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Information about the status of a read replica.
class AwsRdsDbStatusInfo {
  /// If the read replica is currently in an error state, provides the error
  /// details.
  final String? message;

  /// Whether the read replica instance is operating normally.
  final bool? normal;

  /// The status of the read replica instance.
  final String? status;

  /// The type of status. For a read replica, the status type is read replication.
  final String? statusType;

  AwsRdsDbStatusInfo({
    this.message,
    this.normal,
    this.status,
    this.statusType,
  });

  factory AwsRdsDbStatusInfo.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbStatusInfo(
      message: json['Message'] as String?,
      normal: json['Normal'] as bool?,
      status: json['Status'] as String?,
      statusType: json['StatusType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final normal = this.normal;
    final status = this.status;
    final statusType = this.statusType;
    return {
      if (message != null) 'Message': message,
      if (normal != null) 'Normal': normal,
      if (status != null) 'Status': status,
      if (statusType != null) 'StatusType': statusType,
    };
  }
}

/// Information about the subnet group for the database instance.
class AwsRdsDbSubnetGroup {
  /// The ARN of the subnet group.
  final String? dbSubnetGroupArn;

  /// The description of the subnet group.
  final String? dbSubnetGroupDescription;

  /// The name of the subnet group.
  final String? dbSubnetGroupName;

  /// The status of the subnet group.
  final String? subnetGroupStatus;

  /// A list of subnets in the subnet group.
  final List<AwsRdsDbSubnetGroupSubnet>? subnets;

  /// The VPC ID of the subnet group.
  final String? vpcId;

  AwsRdsDbSubnetGroup({
    this.dbSubnetGroupArn,
    this.dbSubnetGroupDescription,
    this.dbSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });

  factory AwsRdsDbSubnetGroup.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbSubnetGroup(
      dbSubnetGroupArn: json['DbSubnetGroupArn'] as String?,
      dbSubnetGroupDescription: json['DbSubnetGroupDescription'] as String?,
      dbSubnetGroupName: json['DbSubnetGroupName'] as String?,
      subnetGroupStatus: json['SubnetGroupStatus'] as String?,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRdsDbSubnetGroupSubnet.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbSubnetGroupArn = this.dbSubnetGroupArn;
    final dbSubnetGroupDescription = this.dbSubnetGroupDescription;
    final dbSubnetGroupName = this.dbSubnetGroupName;
    final subnetGroupStatus = this.subnetGroupStatus;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (dbSubnetGroupArn != null) 'DbSubnetGroupArn': dbSubnetGroupArn,
      if (dbSubnetGroupDescription != null)
        'DbSubnetGroupDescription': dbSubnetGroupDescription,
      if (dbSubnetGroupName != null) 'DbSubnetGroupName': dbSubnetGroupName,
      if (subnetGroupStatus != null) 'SubnetGroupStatus': subnetGroupStatus,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Information about a subnet in a subnet group.
class AwsRdsDbSubnetGroupSubnet {
  /// Information about the Availability Zone for a subnet in the subnet group.
  final AwsRdsDbSubnetGroupSubnetAvailabilityZone? subnetAvailabilityZone;

  /// The identifier of a subnet in the subnet group.
  final String? subnetIdentifier;

  /// The status of a subnet in the subnet group.
  final String? subnetStatus;

  AwsRdsDbSubnetGroupSubnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });

  factory AwsRdsDbSubnetGroupSubnet.fromJson(Map<String, dynamic> json) {
    return AwsRdsDbSubnetGroupSubnet(
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] != null
          ? AwsRdsDbSubnetGroupSubnetAvailabilityZone.fromJson(
              json['SubnetAvailabilityZone'] as Map<String, dynamic>)
          : null,
      subnetIdentifier: json['SubnetIdentifier'] as String?,
      subnetStatus: json['SubnetStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    final subnetStatus = this.subnetStatus;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
      if (subnetStatus != null) 'SubnetStatus': subnetStatus,
    };
  }
}

/// An Availability Zone for a subnet in a subnet group.
class AwsRdsDbSubnetGroupSubnetAvailabilityZone {
  /// The name of the Availability Zone for a subnet in the subnet group.
  final String? name;

  AwsRdsDbSubnetGroupSubnetAvailabilityZone({
    this.name,
  });

  factory AwsRdsDbSubnetGroupSubnetAvailabilityZone.fromJson(
      Map<String, dynamic> json) {
    return AwsRdsDbSubnetGroupSubnetAvailabilityZone(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// Identifies the log types to enable and disable.
class AwsRdsPendingCloudWatchLogsExports {
  /// A list of log types that are being disabled.
  final List<String>? logTypesToDisable;

  /// A list of log types that are being enabled.
  final List<String>? logTypesToEnable;

  AwsRdsPendingCloudWatchLogsExports({
    this.logTypesToDisable,
    this.logTypesToEnable,
  });

  factory AwsRdsPendingCloudWatchLogsExports.fromJson(
      Map<String, dynamic> json) {
    return AwsRdsPendingCloudWatchLogsExports(
      logTypesToDisable: (json['LogTypesToDisable'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      logTypesToEnable: (json['LogTypesToEnable'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logTypesToDisable = this.logTypesToDisable;
    final logTypesToEnable = this.logTypesToEnable;
    return {
      if (logTypesToDisable != null) 'LogTypesToDisable': logTypesToDisable,
      if (logTypesToEnable != null) 'LogTypesToEnable': logTypesToEnable,
    };
  }
}

/// A node in an Amazon Redshift cluster.
class AwsRedshiftClusterClusterNode {
  /// The role of the node. A node might be a leader node or a compute node.
  final String? nodeRole;

  /// The private IP address of the node.
  final String? privateIpAddress;

  /// The public IP address of the node.
  final String? publicIpAddress;

  AwsRedshiftClusterClusterNode({
    this.nodeRole,
    this.privateIpAddress,
    this.publicIpAddress,
  });

  factory AwsRedshiftClusterClusterNode.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterClusterNode(
      nodeRole: json['NodeRole'] as String?,
      privateIpAddress: json['PrivateIpAddress'] as String?,
      publicIpAddress: json['PublicIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeRole = this.nodeRole;
    final privateIpAddress = this.privateIpAddress;
    final publicIpAddress = this.publicIpAddress;
    return {
      if (nodeRole != null) 'NodeRole': nodeRole,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (publicIpAddress != null) 'PublicIpAddress': publicIpAddress,
    };
  }
}

/// A cluster parameter group that is associated with an Amazon Redshift
/// cluster.
class AwsRedshiftClusterClusterParameterGroup {
  /// The list of parameter statuses.
  final List<AwsRedshiftClusterClusterParameterStatus>?
      clusterParameterStatusList;

  /// The status of updates to the parameters.
  final String? parameterApplyStatus;

  /// The name of the parameter group.
  final String? parameterGroupName;

  AwsRedshiftClusterClusterParameterGroup({
    this.clusterParameterStatusList,
    this.parameterApplyStatus,
    this.parameterGroupName,
  });

  factory AwsRedshiftClusterClusterParameterGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterClusterParameterGroup(
      clusterParameterStatusList: (json['ClusterParameterStatusList'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRedshiftClusterClusterParameterStatus.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      parameterApplyStatus: json['ParameterApplyStatus'] as String?,
      parameterGroupName: json['ParameterGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterParameterStatusList = this.clusterParameterStatusList;
    final parameterApplyStatus = this.parameterApplyStatus;
    final parameterGroupName = this.parameterGroupName;
    return {
      if (clusterParameterStatusList != null)
        'ClusterParameterStatusList': clusterParameterStatusList,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
    };
  }
}

/// The status of a parameter in a cluster parameter group for an Amazon
/// Redshift cluster.
class AwsRedshiftClusterClusterParameterStatus {
  /// The error that prevented the parameter from being applied to the database.
  final String? parameterApplyErrorDescription;

  /// The status of the parameter. Indicates whether the parameter is in sync with
  /// the database, waiting for a cluster reboot, or encountered an error when it
  /// was applied.
  ///
  /// Valid values: <code>in-sync</code> | <code>pending-reboot</code> |
  /// <code>applying</code> | <code>invalid-parameter</code> |
  /// <code>apply-deferred</code> | <code>apply-error</code> |
  /// <code>unknown-error</code>
  final String? parameterApplyStatus;

  /// The name of the parameter.
  final String? parameterName;

  AwsRedshiftClusterClusterParameterStatus({
    this.parameterApplyErrorDescription,
    this.parameterApplyStatus,
    this.parameterName,
  });

  factory AwsRedshiftClusterClusterParameterStatus.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterClusterParameterStatus(
      parameterApplyErrorDescription:
          json['ParameterApplyErrorDescription'] as String?,
      parameterApplyStatus: json['ParameterApplyStatus'] as String?,
      parameterName: json['ParameterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterApplyErrorDescription = this.parameterApplyErrorDescription;
    final parameterApplyStatus = this.parameterApplyStatus;
    final parameterName = this.parameterName;
    return {
      if (parameterApplyErrorDescription != null)
        'ParameterApplyErrorDescription': parameterApplyErrorDescription,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
      if (parameterName != null) 'ParameterName': parameterName,
    };
  }
}

/// A security group that is associated with the cluster.
class AwsRedshiftClusterClusterSecurityGroup {
  /// The name of the cluster security group.
  final String? clusterSecurityGroupName;

  /// The status of the cluster security group.
  final String? status;

  AwsRedshiftClusterClusterSecurityGroup({
    this.clusterSecurityGroupName,
    this.status,
  });

  factory AwsRedshiftClusterClusterSecurityGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterClusterSecurityGroup(
      clusterSecurityGroupName: json['ClusterSecurityGroupName'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroupName = this.clusterSecurityGroupName;
    final status = this.status;
    return {
      if (clusterSecurityGroupName != null)
        'ClusterSecurityGroupName': clusterSecurityGroupName,
      if (status != null) 'Status': status,
    };
  }
}

/// Information about a cross-Region snapshot copy.
class AwsRedshiftClusterClusterSnapshotCopyStatus {
  /// The destination Region that snapshots are automatically copied to when
  /// cross-Region snapshot copy is enabled.
  final String? destinationRegion;

  /// The number of days that manual snapshots are retained in the destination
  /// region after they are copied from a source region.
  ///
  /// If the value is -1, then the manual snapshot is retained indefinitely.
  ///
  /// Valid values: Either -1 or an integer between 1 and 3,653
  final int? manualSnapshotRetentionPeriod;

  /// The number of days to retain automated snapshots in the destination Region
  /// after they are copied from a source Region.
  final int? retentionPeriod;

  /// The name of the snapshot copy grant.
  final String? snapshotCopyGrantName;

  AwsRedshiftClusterClusterSnapshotCopyStatus({
    this.destinationRegion,
    this.manualSnapshotRetentionPeriod,
    this.retentionPeriod,
    this.snapshotCopyGrantName,
  });

  factory AwsRedshiftClusterClusterSnapshotCopyStatus.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterClusterSnapshotCopyStatus(
      destinationRegion: json['DestinationRegion'] as String?,
      manualSnapshotRetentionPeriod:
          json['ManualSnapshotRetentionPeriod'] as int?,
      retentionPeriod: json['RetentionPeriod'] as int?,
      snapshotCopyGrantName: json['SnapshotCopyGrantName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationRegion = this.destinationRegion;
    final manualSnapshotRetentionPeriod = this.manualSnapshotRetentionPeriod;
    final retentionPeriod = this.retentionPeriod;
    final snapshotCopyGrantName = this.snapshotCopyGrantName;
    return {
      if (destinationRegion != null) 'DestinationRegion': destinationRegion,
      if (manualSnapshotRetentionPeriod != null)
        'ManualSnapshotRetentionPeriod': manualSnapshotRetentionPeriod,
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (snapshotCopyGrantName != null)
        'SnapshotCopyGrantName': snapshotCopyGrantName,
    };
  }
}

/// A time windows during which maintenance was deferred for an Amazon Redshift
/// cluster.
class AwsRedshiftClusterDeferredMaintenanceWindow {
  /// The end of the time window for which maintenance was deferred.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? deferMaintenanceEndTime;

  /// The identifier of the maintenance window.
  final String? deferMaintenanceIdentifier;

  /// The start of the time window for which maintenance was deferred.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? deferMaintenanceStartTime;

  AwsRedshiftClusterDeferredMaintenanceWindow({
    this.deferMaintenanceEndTime,
    this.deferMaintenanceIdentifier,
    this.deferMaintenanceStartTime,
  });

  factory AwsRedshiftClusterDeferredMaintenanceWindow.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterDeferredMaintenanceWindow(
      deferMaintenanceEndTime: json['DeferMaintenanceEndTime'] as String?,
      deferMaintenanceIdentifier: json['DeferMaintenanceIdentifier'] as String?,
      deferMaintenanceStartTime: json['DeferMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deferMaintenanceEndTime = this.deferMaintenanceEndTime;
    final deferMaintenanceIdentifier = this.deferMaintenanceIdentifier;
    final deferMaintenanceStartTime = this.deferMaintenanceStartTime;
    return {
      if (deferMaintenanceEndTime != null)
        'DeferMaintenanceEndTime': deferMaintenanceEndTime,
      if (deferMaintenanceIdentifier != null)
        'DeferMaintenanceIdentifier': deferMaintenanceIdentifier,
      if (deferMaintenanceStartTime != null)
        'DeferMaintenanceStartTime': deferMaintenanceStartTime,
    };
  }
}

/// Details about an Amazon Redshift cluster.
class AwsRedshiftClusterDetails {
  /// Indicates whether major version upgrades are applied automatically to the
  /// cluster during the maintenance window.
  final bool? allowVersionUpgrade;

  /// The number of days that automatic cluster snapshots are retained.
  final int? automatedSnapshotRetentionPeriod;

  /// The name of the Availability Zone in which the cluster is located.
  final String? availabilityZone;

  /// The availability status of the cluster for queries. Possible values are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>Available</code> - The cluster is available for queries.
  /// </li>
  /// <li>
  /// <code>Unavailable</code> - The cluster is not available for queries.
  /// </li>
  /// <li>
  /// <code>Maintenance</code> - The cluster is intermittently available for
  /// queries due to maintenance activities.
  /// </li>
  /// <li>
  /// <code>Modifying</code> -The cluster is intermittently available for queries
  /// due to changes that modify the cluster.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The cluster failed and is not available for queries.
  /// </li>
  /// </ul>
  final String? clusterAvailabilityStatus;

  /// Indicates when the cluster was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? clusterCreateTime;

  /// The unique identifier of the cluster.
  final String? clusterIdentifier;

  /// The nodes in the cluster.
  final List<AwsRedshiftClusterClusterNode>? clusterNodes;

  /// The list of cluster parameter groups that are associated with this cluster.
  final List<AwsRedshiftClusterClusterParameterGroup>? clusterParameterGroups;

  /// The public key for the cluster.
  final String? clusterPublicKey;

  /// The specific revision number of the database in the cluster.
  final String? clusterRevisionNumber;

  /// A list of cluster security groups that are associated with the cluster.
  final List<AwsRedshiftClusterClusterSecurityGroup>? clusterSecurityGroups;

  /// Information about the destination Region and retention period for the
  /// cross-Region snapshot copy.
  final AwsRedshiftClusterClusterSnapshotCopyStatus? clusterSnapshotCopyStatus;

  /// The current status of the cluster.
  ///
  /// Valid values: <code>available</code> | <code>available,
  /// prep-for-resize</code> | <code>available, resize-cleanup</code> |<code>
  /// cancelling-resize</code> | <code>creating</code> | <code>deleting</code> |
  /// <code>final-snapshot</code> | <code>hardware-failure</code> |
  /// <code>incompatible-hsm</code> |<code> incompatible-network</code> |
  /// <code>incompatible-parameters</code> | <code>incompatible-restore</code> |
  /// <code>modifying</code> | <code>paused</code> | <code>rebooting</code> |
  /// <code>renaming</code> | <code>resizing</code> | <code>rotating-keys</code> |
  /// <code>storage-full</code> | <code>updating-hsm</code>
  final String? clusterStatus;

  /// The name of the subnet group that is associated with the cluster. This
  /// parameter is valid only when the cluster is in a VPC.
  final String? clusterSubnetGroupName;

  /// The version ID of the Amazon Redshift engine that runs on the cluster.
  final String? clusterVersion;

  /// The name of the initial database that was created when the cluster was
  /// created.
  ///
  /// The same name is returned for the life of the cluster.
  ///
  /// If an initial database is not specified, a database named
  /// <code>devdev</code> is created by default.
  final String? dBName;

  /// List of time windows during which maintenance was deferred.
  final List<AwsRedshiftClusterDeferredMaintenanceWindow>?
      deferredMaintenanceWindows;

  /// Information about the status of the Elastic IP (EIP) address.
  final AwsRedshiftClusterElasticIpStatus? elasticIpStatus;

  /// The number of nodes that you can use the elastic resize method to resize the
  /// cluster to.
  final String? elasticResizeNumberOfNodeOptions;

  /// Indicates whether the data in the cluster is encrypted at rest.
  final bool? encrypted;

  /// The connection endpoint.
  final AwsRedshiftClusterEndpoint? endpoint;

  /// Indicates whether to create the cluster with enhanced VPC routing enabled.
  final bool? enhancedVpcRouting;

  /// Indicates when the next snapshot is expected to be taken. The cluster must
  /// have a valid snapshot schedule and have backups enabled.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? expectedNextSnapshotScheduleTime;

  /// The status of the next expected snapshot.
  ///
  /// Valid values: <code>OnTrack</code> | <code>Pending</code>
  final String? expectedNextSnapshotScheduleTimeStatus;

  /// Information about whether the Amazon Redshift cluster finished applying any
  /// changes to hardware security module (HSM) settings that were specified in a
  /// modify cluster command.
  final AwsRedshiftClusterHsmStatus? hsmStatus;

  /// A list of IAM roles that the cluster can use to access other AWS services.
  final List<AwsRedshiftClusterIamRole>? iamRoles;

  /// The identifier of the AWS KMS encryption key that is used to encrypt data in
  /// the cluster.
  final String? kmsKeyId;

  /// The name of the maintenance track for the cluster.
  final String? maintenanceTrackName;

  /// The default number of days to retain a manual snapshot.
  ///
  /// If the value is -1, the snapshot is retained indefinitely.
  ///
  /// This setting doesn't change the retention period of existing snapshots.
  ///
  /// Valid values: Either -1 or an integer between 1 and 3,653
  final int? manualSnapshotRetentionPeriod;

  /// The master user name for the cluster. This name is used to connect to the
  /// database that is specified in as the value of <code>DBName</code>.
  final String? masterUsername;

  /// Indicates the start of the next maintenance window.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? nextMaintenanceWindowStartTime;

  /// The node type for the nodes in the cluster.
  final String? nodeType;

  /// The number of compute nodes in the cluster.
  final int? numberOfNodes;

  /// A list of cluster operations that are waiting to start.
  final List<String>? pendingActions;

  /// A list of changes to the cluster that are currently pending.
  final AwsRedshiftClusterPendingModifiedValues? pendingModifiedValues;

  /// The weekly time range, in Universal Coordinated Time (UTC), during which
  /// system maintenance can occur.
  ///
  /// Format: <code> <i>&lt;day&gt;</i>:HH:MM-<i>&lt;day&gt;</i>:HH:MM</code>
  ///
  /// For the day values, use <code>mon</code> | <code>tue</code> |
  /// <code>wed</code> | <code>thu</code> | <code>fri</code> | <code>sat</code> |
  /// <code>sun</code>
  ///
  /// For example, <code>sun:09:32-sun:10:02</code>
  final String? preferredMaintenanceWindow;

  /// Whether the cluster can be accessed from a public network.
  final bool? publiclyAccessible;

  /// Information about the resize operation for the cluster.
  final AwsRedshiftClusterResizeInfo? resizeInfo;

  /// Information about the status of a cluster restore action. Only applies to a
  /// cluster that was created by restoring a snapshot.
  final AwsRedshiftClusterRestoreStatus? restoreStatus;

  /// A unique identifier for the cluster snapshot schedule.
  final String? snapshotScheduleIdentifier;

  /// The current state of the cluster snapshot schedule.
  ///
  /// Valid values: <code>MODIFYING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code>
  final String? snapshotScheduleState;

  /// The identifier of the VPC that the cluster is in, if the cluster is in a
  /// VPC.
  final String? vpcId;

  /// The list of VPC security groups that the cluster belongs to, if the cluster
  /// is in a VPC.
  final List<AwsRedshiftClusterVpcSecurityGroup>? vpcSecurityGroups;

  AwsRedshiftClusterDetails({
    this.allowVersionUpgrade,
    this.automatedSnapshotRetentionPeriod,
    this.availabilityZone,
    this.clusterAvailabilityStatus,
    this.clusterCreateTime,
    this.clusterIdentifier,
    this.clusterNodes,
    this.clusterParameterGroups,
    this.clusterPublicKey,
    this.clusterRevisionNumber,
    this.clusterSecurityGroups,
    this.clusterSnapshotCopyStatus,
    this.clusterStatus,
    this.clusterSubnetGroupName,
    this.clusterVersion,
    this.dBName,
    this.deferredMaintenanceWindows,
    this.elasticIpStatus,
    this.elasticResizeNumberOfNodeOptions,
    this.encrypted,
    this.endpoint,
    this.enhancedVpcRouting,
    this.expectedNextSnapshotScheduleTime,
    this.expectedNextSnapshotScheduleTimeStatus,
    this.hsmStatus,
    this.iamRoles,
    this.kmsKeyId,
    this.maintenanceTrackName,
    this.manualSnapshotRetentionPeriod,
    this.masterUsername,
    this.nextMaintenanceWindowStartTime,
    this.nodeType,
    this.numberOfNodes,
    this.pendingActions,
    this.pendingModifiedValues,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.resizeInfo,
    this.restoreStatus,
    this.snapshotScheduleIdentifier,
    this.snapshotScheduleState,
    this.vpcId,
    this.vpcSecurityGroups,
  });

  factory AwsRedshiftClusterDetails.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterDetails(
      allowVersionUpgrade: json['AllowVersionUpgrade'] as bool?,
      automatedSnapshotRetentionPeriod:
          json['AutomatedSnapshotRetentionPeriod'] as int?,
      availabilityZone: json['AvailabilityZone'] as String?,
      clusterAvailabilityStatus: json['ClusterAvailabilityStatus'] as String?,
      clusterCreateTime: json['ClusterCreateTime'] as String?,
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      clusterNodes: (json['ClusterNodes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRedshiftClusterClusterNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusterParameterGroups: (json['ClusterParameterGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRedshiftClusterClusterParameterGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      clusterPublicKey: json['ClusterPublicKey'] as String?,
      clusterRevisionNumber: json['ClusterRevisionNumber'] as String?,
      clusterSecurityGroups: (json['ClusterSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRedshiftClusterClusterSecurityGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      clusterSnapshotCopyStatus: json['ClusterSnapshotCopyStatus'] != null
          ? AwsRedshiftClusterClusterSnapshotCopyStatus.fromJson(
              json['ClusterSnapshotCopyStatus'] as Map<String, dynamic>)
          : null,
      clusterStatus: json['ClusterStatus'] as String?,
      clusterSubnetGroupName: json['ClusterSubnetGroupName'] as String?,
      clusterVersion: json['ClusterVersion'] as String?,
      dBName: json['DBName'] as String?,
      deferredMaintenanceWindows: (json['DeferredMaintenanceWindows'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRedshiftClusterDeferredMaintenanceWindow.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      elasticIpStatus: json['ElasticIpStatus'] != null
          ? AwsRedshiftClusterElasticIpStatus.fromJson(
              json['ElasticIpStatus'] as Map<String, dynamic>)
          : null,
      elasticResizeNumberOfNodeOptions:
          json['ElasticResizeNumberOfNodeOptions'] as String?,
      encrypted: json['Encrypted'] as bool?,
      endpoint: json['Endpoint'] != null
          ? AwsRedshiftClusterEndpoint.fromJson(
              json['Endpoint'] as Map<String, dynamic>)
          : null,
      enhancedVpcRouting: json['EnhancedVpcRouting'] as bool?,
      expectedNextSnapshotScheduleTime:
          json['ExpectedNextSnapshotScheduleTime'] as String?,
      expectedNextSnapshotScheduleTimeStatus:
          json['ExpectedNextSnapshotScheduleTimeStatus'] as String?,
      hsmStatus: json['HsmStatus'] != null
          ? AwsRedshiftClusterHsmStatus.fromJson(
              json['HsmStatus'] as Map<String, dynamic>)
          : null,
      iamRoles: (json['IamRoles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsRedshiftClusterIamRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      kmsKeyId: json['KmsKeyId'] as String?,
      maintenanceTrackName: json['MaintenanceTrackName'] as String?,
      manualSnapshotRetentionPeriod:
          json['ManualSnapshotRetentionPeriod'] as int?,
      masterUsername: json['MasterUsername'] as String?,
      nextMaintenanceWindowStartTime:
          json['NextMaintenanceWindowStartTime'] as String?,
      nodeType: json['NodeType'] as String?,
      numberOfNodes: json['NumberOfNodes'] as int?,
      pendingActions: (json['PendingActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pendingModifiedValues: json['PendingModifiedValues'] != null
          ? AwsRedshiftClusterPendingModifiedValues.fromJson(
              json['PendingModifiedValues'] as Map<String, dynamic>)
          : null,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      publiclyAccessible: json['PubliclyAccessible'] as bool?,
      resizeInfo: json['ResizeInfo'] != null
          ? AwsRedshiftClusterResizeInfo.fromJson(
              json['ResizeInfo'] as Map<String, dynamic>)
          : null,
      restoreStatus: json['RestoreStatus'] != null
          ? AwsRedshiftClusterRestoreStatus.fromJson(
              json['RestoreStatus'] as Map<String, dynamic>)
          : null,
      snapshotScheduleIdentifier: json['SnapshotScheduleIdentifier'] as String?,
      snapshotScheduleState: json['SnapshotScheduleState'] as String?,
      vpcId: json['VpcId'] as String?,
      vpcSecurityGroups: (json['VpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AwsRedshiftClusterVpcSecurityGroup.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowVersionUpgrade = this.allowVersionUpgrade;
    final automatedSnapshotRetentionPeriod =
        this.automatedSnapshotRetentionPeriod;
    final availabilityZone = this.availabilityZone;
    final clusterAvailabilityStatus = this.clusterAvailabilityStatus;
    final clusterCreateTime = this.clusterCreateTime;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterNodes = this.clusterNodes;
    final clusterParameterGroups = this.clusterParameterGroups;
    final clusterPublicKey = this.clusterPublicKey;
    final clusterRevisionNumber = this.clusterRevisionNumber;
    final clusterSecurityGroups = this.clusterSecurityGroups;
    final clusterSnapshotCopyStatus = this.clusterSnapshotCopyStatus;
    final clusterStatus = this.clusterStatus;
    final clusterSubnetGroupName = this.clusterSubnetGroupName;
    final clusterVersion = this.clusterVersion;
    final dBName = this.dBName;
    final deferredMaintenanceWindows = this.deferredMaintenanceWindows;
    final elasticIpStatus = this.elasticIpStatus;
    final elasticResizeNumberOfNodeOptions =
        this.elasticResizeNumberOfNodeOptions;
    final encrypted = this.encrypted;
    final endpoint = this.endpoint;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final expectedNextSnapshotScheduleTime =
        this.expectedNextSnapshotScheduleTime;
    final expectedNextSnapshotScheduleTimeStatus =
        this.expectedNextSnapshotScheduleTimeStatus;
    final hsmStatus = this.hsmStatus;
    final iamRoles = this.iamRoles;
    final kmsKeyId = this.kmsKeyId;
    final maintenanceTrackName = this.maintenanceTrackName;
    final manualSnapshotRetentionPeriod = this.manualSnapshotRetentionPeriod;
    final masterUsername = this.masterUsername;
    final nextMaintenanceWindowStartTime = this.nextMaintenanceWindowStartTime;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final pendingActions = this.pendingActions;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final resizeInfo = this.resizeInfo;
    final restoreStatus = this.restoreStatus;
    final snapshotScheduleIdentifier = this.snapshotScheduleIdentifier;
    final snapshotScheduleState = this.snapshotScheduleState;
    final vpcId = this.vpcId;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allowVersionUpgrade != null)
        'AllowVersionUpgrade': allowVersionUpgrade,
      if (automatedSnapshotRetentionPeriod != null)
        'AutomatedSnapshotRetentionPeriod': automatedSnapshotRetentionPeriod,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (clusterAvailabilityStatus != null)
        'ClusterAvailabilityStatus': clusterAvailabilityStatus,
      if (clusterCreateTime != null) 'ClusterCreateTime': clusterCreateTime,
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterNodes != null) 'ClusterNodes': clusterNodes,
      if (clusterParameterGroups != null)
        'ClusterParameterGroups': clusterParameterGroups,
      if (clusterPublicKey != null) 'ClusterPublicKey': clusterPublicKey,
      if (clusterRevisionNumber != null)
        'ClusterRevisionNumber': clusterRevisionNumber,
      if (clusterSecurityGroups != null)
        'ClusterSecurityGroups': clusterSecurityGroups,
      if (clusterSnapshotCopyStatus != null)
        'ClusterSnapshotCopyStatus': clusterSnapshotCopyStatus,
      if (clusterStatus != null) 'ClusterStatus': clusterStatus,
      if (clusterSubnetGroupName != null)
        'ClusterSubnetGroupName': clusterSubnetGroupName,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (dBName != null) 'DBName': dBName,
      if (deferredMaintenanceWindows != null)
        'DeferredMaintenanceWindows': deferredMaintenanceWindows,
      if (elasticIpStatus != null) 'ElasticIpStatus': elasticIpStatus,
      if (elasticResizeNumberOfNodeOptions != null)
        'ElasticResizeNumberOfNodeOptions': elasticResizeNumberOfNodeOptions,
      if (encrypted != null) 'Encrypted': encrypted,
      if (endpoint != null) 'Endpoint': endpoint,
      if (enhancedVpcRouting != null) 'EnhancedVpcRouting': enhancedVpcRouting,
      if (expectedNextSnapshotScheduleTime != null)
        'ExpectedNextSnapshotScheduleTime': expectedNextSnapshotScheduleTime,
      if (expectedNextSnapshotScheduleTimeStatus != null)
        'ExpectedNextSnapshotScheduleTimeStatus':
            expectedNextSnapshotScheduleTimeStatus,
      if (hsmStatus != null) 'HsmStatus': hsmStatus,
      if (iamRoles != null) 'IamRoles': iamRoles,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (manualSnapshotRetentionPeriod != null)
        'ManualSnapshotRetentionPeriod': manualSnapshotRetentionPeriod,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (nextMaintenanceWindowStartTime != null)
        'NextMaintenanceWindowStartTime': nextMaintenanceWindowStartTime,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (pendingActions != null) 'PendingActions': pendingActions,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (resizeInfo != null) 'ResizeInfo': resizeInfo,
      if (restoreStatus != null) 'RestoreStatus': restoreStatus,
      if (snapshotScheduleIdentifier != null)
        'SnapshotScheduleIdentifier': snapshotScheduleIdentifier,
      if (snapshotScheduleState != null)
        'SnapshotScheduleState': snapshotScheduleState,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

/// The status of the elastic IP (EIP) address for an Amazon Redshift cluster.
class AwsRedshiftClusterElasticIpStatus {
  /// The elastic IP address for the cluster.
  final String? elasticIp;

  /// The status of the elastic IP address.
  final String? status;

  AwsRedshiftClusterElasticIpStatus({
    this.elasticIp,
    this.status,
  });

  factory AwsRedshiftClusterElasticIpStatus.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterElasticIpStatus(
      elasticIp: json['ElasticIp'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elasticIp = this.elasticIp;
    final status = this.status;
    return {
      if (elasticIp != null) 'ElasticIp': elasticIp,
      if (status != null) 'Status': status,
    };
  }
}

/// The connection endpoint for an Amazon Redshift cluster.
class AwsRedshiftClusterEndpoint {
  /// The DNS address of the cluster.
  final String? address;

  /// The port that the database engine listens on.
  final int? port;

  AwsRedshiftClusterEndpoint({
    this.address,
    this.port,
  });

  factory AwsRedshiftClusterEndpoint.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterEndpoint(
      address: json['Address'] as String?,
      port: json['Port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
    };
  }
}

/// Information about whether an Amazon Redshift cluster finished applying any
/// hardware changes to security module (HSM) settings that were specified in a
/// modify cluster command.
class AwsRedshiftClusterHsmStatus {
  /// The name of the HSM client certificate that the Amazon Redshift cluster uses
  /// to retrieve the data encryption keys that are stored in an HSM.
  final String? hsmClientCertificateIdentifier;

  /// The name of the HSM configuration that contains the information that the
  /// Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  final String? hsmConfigurationIdentifier;

  /// Indicates whether the Amazon Redshift cluster has finished applying any HSM
  /// settings changes specified in a modify cluster command.
  ///
  /// Type: String
  ///
  /// Valid values: <code>active</code> | <code>applying</code>
  final String? status;

  AwsRedshiftClusterHsmStatus({
    this.hsmClientCertificateIdentifier,
    this.hsmConfigurationIdentifier,
    this.status,
  });

  factory AwsRedshiftClusterHsmStatus.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterHsmStatus(
      hsmClientCertificateIdentifier:
          json['HsmClientCertificateIdentifier'] as String?,
      hsmConfigurationIdentifier: json['HsmConfigurationIdentifier'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hsmClientCertificateIdentifier = this.hsmClientCertificateIdentifier;
    final hsmConfigurationIdentifier = this.hsmConfigurationIdentifier;
    final status = this.status;
    return {
      if (hsmClientCertificateIdentifier != null)
        'HsmClientCertificateIdentifier': hsmClientCertificateIdentifier,
      if (hsmConfigurationIdentifier != null)
        'HsmConfigurationIdentifier': hsmConfigurationIdentifier,
      if (status != null) 'Status': status,
    };
  }
}

/// An IAM role that the cluster can use to access other AWS services.
class AwsRedshiftClusterIamRole {
  /// The status of the IAM role's association with the cluster.
  ///
  /// Valid values: <code>in-sync</code> | <code>adding</code> |
  /// <code>removing</code>
  final String? applyStatus;

  /// The ARN of the IAM role.
  final String? iamRoleArn;

  AwsRedshiftClusterIamRole({
    this.applyStatus,
    this.iamRoleArn,
  });

  factory AwsRedshiftClusterIamRole.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterIamRole(
      applyStatus: json['ApplyStatus'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applyStatus = this.applyStatus;
    final iamRoleArn = this.iamRoleArn;
    return {
      if (applyStatus != null) 'ApplyStatus': applyStatus,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
  }
}

/// Changes to the Amazon Redshift cluster that are currently pending.
class AwsRedshiftClusterPendingModifiedValues {
  /// The pending or in-progress change to the automated snapshot retention
  /// period.
  final int? automatedSnapshotRetentionPeriod;

  /// The pending or in-progress change to the identifier for the cluster.
  final String? clusterIdentifier;

  /// The pending or in-progress change to the cluster type.
  final String? clusterType;

  /// The pending or in-progress change to the service version.
  final String? clusterVersion;

  /// The encryption type for a cluster.
  final String? encryptionType;

  /// Indicates whether to create the cluster with enhanced VPC routing enabled.
  final bool? enhancedVpcRouting;

  /// The name of the maintenance track that the cluster changes to during the
  /// next maintenance window.
  final String? maintenanceTrackName;

  /// The pending or in-progress change to the master user password for the
  /// cluster.
  final String? masterUserPassword;

  /// The pending or in-progress change to the cluster's node type.
  final String? nodeType;

  /// The pending or in-progress change to the number of nodes in the cluster.
  final int? numberOfNodes;

  /// The pending or in-progress change to whether the cluster can be connected to
  /// from the public network.
  final bool? publiclyAccessible;

  AwsRedshiftClusterPendingModifiedValues({
    this.automatedSnapshotRetentionPeriod,
    this.clusterIdentifier,
    this.clusterType,
    this.clusterVersion,
    this.encryptionType,
    this.enhancedVpcRouting,
    this.maintenanceTrackName,
    this.masterUserPassword,
    this.nodeType,
    this.numberOfNodes,
    this.publiclyAccessible,
  });

  factory AwsRedshiftClusterPendingModifiedValues.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterPendingModifiedValues(
      automatedSnapshotRetentionPeriod:
          json['AutomatedSnapshotRetentionPeriod'] as int?,
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      clusterType: json['ClusterType'] as String?,
      clusterVersion: json['ClusterVersion'] as String?,
      encryptionType: json['EncryptionType'] as String?,
      enhancedVpcRouting: json['EnhancedVpcRouting'] as bool?,
      maintenanceTrackName: json['MaintenanceTrackName'] as String?,
      masterUserPassword: json['MasterUserPassword'] as String?,
      nodeType: json['NodeType'] as String?,
      numberOfNodes: json['NumberOfNodes'] as int?,
      publiclyAccessible: json['PubliclyAccessible'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedSnapshotRetentionPeriod =
        this.automatedSnapshotRetentionPeriod;
    final clusterIdentifier = this.clusterIdentifier;
    final clusterType = this.clusterType;
    final clusterVersion = this.clusterVersion;
    final encryptionType = this.encryptionType;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final maintenanceTrackName = this.maintenanceTrackName;
    final masterUserPassword = this.masterUserPassword;
    final nodeType = this.nodeType;
    final numberOfNodes = this.numberOfNodes;
    final publiclyAccessible = this.publiclyAccessible;
    return {
      if (automatedSnapshotRetentionPeriod != null)
        'AutomatedSnapshotRetentionPeriod': automatedSnapshotRetentionPeriod,
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (clusterType != null) 'ClusterType': clusterType,
      if (clusterVersion != null) 'ClusterVersion': clusterVersion,
      if (encryptionType != null) 'EncryptionType': encryptionType,
      if (enhancedVpcRouting != null) 'EnhancedVpcRouting': enhancedVpcRouting,
      if (maintenanceTrackName != null)
        'MaintenanceTrackName': maintenanceTrackName,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (nodeType != null) 'NodeType': nodeType,
      if (numberOfNodes != null) 'NumberOfNodes': numberOfNodes,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
    };
  }
}

/// Information about the resize operation for the cluster.
class AwsRedshiftClusterResizeInfo {
  /// Indicates whether the resize operation can be canceled.
  final bool? allowCancelResize;

  /// The type of resize operation.
  ///
  /// Valid values: <code>ClassicResize</code>
  final String? resizeType;

  AwsRedshiftClusterResizeInfo({
    this.allowCancelResize,
    this.resizeType,
  });

  factory AwsRedshiftClusterResizeInfo.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterResizeInfo(
      allowCancelResize: json['AllowCancelResize'] as bool?,
      resizeType: json['ResizeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowCancelResize = this.allowCancelResize;
    final resizeType = this.resizeType;
    return {
      if (allowCancelResize != null) 'AllowCancelResize': allowCancelResize,
      if (resizeType != null) 'ResizeType': resizeType,
    };
  }
}

/// Information about the status of a cluster restore action. It only applies if
/// the cluster was created by restoring a snapshot.
class AwsRedshiftClusterRestoreStatus {
  /// The number of megabytes per second being transferred from the backup
  /// storage. Returns the average rate for a completed backup.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final double? currentRestoreRateInMegaBytesPerSecond;

  /// The amount of time an in-progress restore has been running, or the amount of
  /// time it took a completed restore to finish.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final int? elapsedTimeInSeconds;

  /// The estimate of the time remaining before the restore is complete. Returns 0
  /// for a completed restore.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final int? estimatedTimeToCompletionInSeconds;

  /// The number of megabytes that were transferred from snapshot storage.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final int? progressInMegaBytes;

  /// The size of the set of snapshot data that was used to restore the cluster.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  final int? snapshotSizeInMegaBytes;

  /// The status of the restore action.
  ///
  /// Valid values: <code>starting</code> | <code>restoring</code> |
  /// <code>completed</code> | <code>failed</code>
  final String? status;

  AwsRedshiftClusterRestoreStatus({
    this.currentRestoreRateInMegaBytesPerSecond,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.progressInMegaBytes,
    this.snapshotSizeInMegaBytes,
    this.status,
  });

  factory AwsRedshiftClusterRestoreStatus.fromJson(Map<String, dynamic> json) {
    return AwsRedshiftClusterRestoreStatus(
      currentRestoreRateInMegaBytesPerSecond:
          json['CurrentRestoreRateInMegaBytesPerSecond'] as double?,
      elapsedTimeInSeconds: json['ElapsedTimeInSeconds'] as int?,
      estimatedTimeToCompletionInSeconds:
          json['EstimatedTimeToCompletionInSeconds'] as int?,
      progressInMegaBytes: json['ProgressInMegaBytes'] as int?,
      snapshotSizeInMegaBytes: json['SnapshotSizeInMegaBytes'] as int?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentRestoreRateInMegaBytesPerSecond =
        this.currentRestoreRateInMegaBytesPerSecond;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final estimatedTimeToCompletionInSeconds =
        this.estimatedTimeToCompletionInSeconds;
    final progressInMegaBytes = this.progressInMegaBytes;
    final snapshotSizeInMegaBytes = this.snapshotSizeInMegaBytes;
    final status = this.status;
    return {
      if (currentRestoreRateInMegaBytesPerSecond != null)
        'CurrentRestoreRateInMegaBytesPerSecond':
            currentRestoreRateInMegaBytesPerSecond,
      if (elapsedTimeInSeconds != null)
        'ElapsedTimeInSeconds': elapsedTimeInSeconds,
      if (estimatedTimeToCompletionInSeconds != null)
        'EstimatedTimeToCompletionInSeconds':
            estimatedTimeToCompletionInSeconds,
      if (progressInMegaBytes != null)
        'ProgressInMegaBytes': progressInMegaBytes,
      if (snapshotSizeInMegaBytes != null)
        'SnapshotSizeInMegaBytes': snapshotSizeInMegaBytes,
      if (status != null) 'Status': status,
    };
  }
}

/// A VPC security group that the cluster belongs to, if the cluster is in a
/// VPC.
class AwsRedshiftClusterVpcSecurityGroup {
  /// The status of the VPC security group.
  final String? status;

  /// The identifier of the VPC security group.
  final String? vpcSecurityGroupId;

  AwsRedshiftClusterVpcSecurityGroup({
    this.status,
    this.vpcSecurityGroupId,
  });

  factory AwsRedshiftClusterVpcSecurityGroup.fromJson(
      Map<String, dynamic> json) {
    return AwsRedshiftClusterVpcSecurityGroup(
      status: json['Status'] as String?,
      vpcSecurityGroupId: json['VpcSecurityGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

/// provides information about the Amazon S3 Public Access Block configuration
/// for accounts.
class AwsS3AccountPublicAccessBlockDetails {
  /// Indicates whether to reject calls to update an S3 bucket if the calls
  /// include a public access control list (ACL).
  final bool? blockPublicAcls;

  /// Indicates whether to reject calls to update the access policy for an S3
  /// bucket or access point if the policy allows public access.
  final bool? blockPublicPolicy;

  /// Indicates whether Amazon S3 ignores public ACLs that are associated with an
  /// S3 bucket.
  final bool? ignorePublicAcls;

  /// Indicates whether to restrict access to an access point or S3 bucket that
  /// has a public policy to only AWS service principals and authorized users
  /// within the S3 bucket owner's account.
  final bool? restrictPublicBuckets;

  AwsS3AccountPublicAccessBlockDetails({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });

  factory AwsS3AccountPublicAccessBlockDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3AccountPublicAccessBlockDetails(
      blockPublicAcls: json['BlockPublicAcls'] as bool?,
      blockPublicPolicy: json['BlockPublicPolicy'] as bool?,
      ignorePublicAcls: json['IgnorePublicAcls'] as bool?,
      restrictPublicBuckets: json['RestrictPublicBuckets'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicAcls = this.blockPublicAcls;
    final blockPublicPolicy = this.blockPublicPolicy;
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
    return {
      if (blockPublicAcls != null) 'BlockPublicAcls': blockPublicAcls,
      if (blockPublicPolicy != null) 'BlockPublicPolicy': blockPublicPolicy,
      if (ignorePublicAcls != null) 'IgnorePublicAcls': ignorePublicAcls,
      if (restrictPublicBuckets != null)
        'RestrictPublicBuckets': restrictPublicBuckets,
    };
  }
}

/// The lifecycle configuration for the objects in the S3 bucket.
class AwsS3BucketBucketLifecycleConfigurationDetails {
  /// The lifecycle rules.
  final List<AwsS3BucketBucketLifecycleConfigurationRulesDetails>? rules;

  AwsS3BucketBucketLifecycleConfigurationDetails({
    this.rules,
  });

  factory AwsS3BucketBucketLifecycleConfigurationDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationDetails(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsS3BucketBucketLifecycleConfigurationRulesDetails.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Information about what Amazon S3 does when a multipart upload is incomplete.
class AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails {
  /// The number of days after which Amazon S3 cancels an incomplete multipart
  /// upload.
  final int? daysAfterInitiation;

  AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails({
    this.daysAfterInitiation,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails(
      daysAfterInitiation: json['DaysAfterInitiation'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final daysAfterInitiation = this.daysAfterInitiation;
    return {
      if (daysAfterInitiation != null)
        'DaysAfterInitiation': daysAfterInitiation,
    };
  }
}

/// Configuration for a lifecycle rule.
class AwsS3BucketBucketLifecycleConfigurationRulesDetails {
  /// How Amazon S3 responds when a multipart upload is incomplete. Specifically,
  /// provides a number of days before Amazon S3 cancels the entire upload.
  final AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails?
      abortIncompleteMultipartUpload;

  /// The date when objects are moved or deleted.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? expirationDate;

  /// The length in days of the lifetime for objects that are subject to the rule.
  final int? expirationInDays;

  /// Whether Amazon S3 removes a delete marker that has no noncurrent versions.
  /// If set to <code>true</code>, the delete marker is expired. If set to
  /// <code>false</code>, the policy takes no action.
  ///
  /// If you provide <code>ExpiredObjectDeleteMarker</code>, you cannot provide
  /// <code>ExpirationInDays</code> or <code>ExpirationDate</code>.
  final bool? expiredObjectDeleteMarker;

  /// Identifies the objects that a rule applies to.
  final AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails? filter;

  /// The unique identifier of the rule.
  final String? id;

  /// The number of days that an object is noncurrent before Amazon S3 can perform
  /// the associated action.
  final int? noncurrentVersionExpirationInDays;

  /// Transition rules that describe when noncurrent objects transition to a
  /// specified storage class.
  final List<
          AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails>?
      noncurrentVersionTransitions;

  /// A prefix that identifies one or more objects that the rule applies to.
  final String? prefix;

  /// The current status of the rule. Indicates whether the rule is currently
  /// being applied.
  final String? status;

  /// Transition rules that indicate when objects transition to a specified
  /// storage class.
  final List<AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails>?
      transitions;

  AwsS3BucketBucketLifecycleConfigurationRulesDetails({
    this.abortIncompleteMultipartUpload,
    this.expirationDate,
    this.expirationInDays,
    this.expiredObjectDeleteMarker,
    this.filter,
    this.id,
    this.noncurrentVersionExpirationInDays,
    this.noncurrentVersionTransitions,
    this.prefix,
    this.status,
    this.transitions,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesDetails(
      abortIncompleteMultipartUpload: json['AbortIncompleteMultipartUpload'] !=
              null
          ? AwsS3BucketBucketLifecycleConfigurationRulesAbortIncompleteMultipartUploadDetails
              .fromJson(json['AbortIncompleteMultipartUpload']
                  as Map<String, dynamic>)
          : null,
      expirationDate: json['ExpirationDate'] as String?,
      expirationInDays: json['ExpirationInDays'] as int?,
      expiredObjectDeleteMarker: json['ExpiredObjectDeleteMarker'] as bool?,
      filter: json['Filter'] != null
          ? AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails.fromJson(
              json['Filter'] as Map<String, dynamic>)
          : null,
      id: json['ID'] as String?,
      noncurrentVersionExpirationInDays:
          json['NoncurrentVersionExpirationInDays'] as int?,
      noncurrentVersionTransitions: (json['NoncurrentVersionTransitions']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      prefix: json['Prefix'] as String?,
      status: json['Status'] as String?,
      transitions: (json['Transitions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final abortIncompleteMultipartUpload = this.abortIncompleteMultipartUpload;
    final expirationDate = this.expirationDate;
    final expirationInDays = this.expirationInDays;
    final expiredObjectDeleteMarker = this.expiredObjectDeleteMarker;
    final filter = this.filter;
    final id = this.id;
    final noncurrentVersionExpirationInDays =
        this.noncurrentVersionExpirationInDays;
    final noncurrentVersionTransitions = this.noncurrentVersionTransitions;
    final prefix = this.prefix;
    final status = this.status;
    final transitions = this.transitions;
    return {
      if (abortIncompleteMultipartUpload != null)
        'AbortIncompleteMultipartUpload': abortIncompleteMultipartUpload,
      if (expirationDate != null) 'ExpirationDate': expirationDate,
      if (expirationInDays != null) 'ExpirationInDays': expirationInDays,
      if (expiredObjectDeleteMarker != null)
        'ExpiredObjectDeleteMarker': expiredObjectDeleteMarker,
      if (filter != null) 'Filter': filter,
      if (id != null) 'ID': id,
      if (noncurrentVersionExpirationInDays != null)
        'NoncurrentVersionExpirationInDays': noncurrentVersionExpirationInDays,
      if (noncurrentVersionTransitions != null)
        'NoncurrentVersionTransitions': noncurrentVersionTransitions,
      if (prefix != null) 'Prefix': prefix,
      if (status != null) 'Status': status,
      if (transitions != null) 'Transitions': transitions,
    };
  }
}

/// Identifies the objects that a rule applies to.
class AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails {
  /// The configuration for the filter.
  final AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails?
      predicate;

  AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails({
    this.predicate,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesFilterDetails(
      predicate: json['Predicate'] != null
          ? AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails
              .fromJson(json['Predicate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final predicate = this.predicate;
    return {
      if (predicate != null) 'Predicate': predicate,
    };
  }
}

/// The configuration for the filter.
class AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails {
  /// The values to use for the filter.
  final List<
          AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails>?
      operands;

  /// A prefix filter.
  final String? prefix;

  /// A tag filter.
  final AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails?
      tag;

  /// Whether to use <code>AND</code> or <code>OR</code> to join the operands.
  final String? type;

  AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails({
    this.operands,
    this.prefix,
    this.tag,
    this.type,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateDetails(
      operands: (json['Operands'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails
                  .fromJson(e as Map<String, dynamic>))
          .toList(),
      prefix: json['Prefix'] as String?,
      tag: json['Tag'] != null
          ? AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails
              .fromJson(json['Tag'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operands = this.operands;
    final prefix = this.prefix;
    final tag = this.tag;
    final type = this.type;
    return {
      if (operands != null) 'Operands': operands,
      if (prefix != null) 'Prefix': prefix,
      if (tag != null) 'Tag': tag,
      if (type != null) 'Type': type,
    };
  }
}

/// A value to use for the filter.
class AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails {
  /// Prefix text for matching objects.
  final String? prefix;

  /// A tag that is assigned to matching objects.
  final AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails?
      tag;

  /// The type of filter value.
  final String? type;

  AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails({
    this.prefix,
    this.tag,
    this.type,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsDetails(
      prefix: json['Prefix'] as String?,
      tag: json['Tag'] != null
          ? AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails
              .fromJson(json['Tag'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final prefix = this.prefix;
    final tag = this.tag;
    final type = this.type;
    return {
      if (prefix != null) 'Prefix': prefix,
      if (tag != null) 'Tag': tag,
      if (type != null) 'Type': type,
    };
  }
}

/// A tag that is assigned to matching objects.
class AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails {
  /// The tag key.
  final String? key;

  /// The tag value.
  final String? value;

  AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails({
    this.key,
    this.value,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateOperandsTagDetails(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// A tag filter.
class AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails {
  /// The tag key.
  final String? key;

  /// The tag value
  final String? value;

  AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails({
    this.key,
    this.value,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesFilterPredicateTagDetails(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// A transition rule that describes when noncurrent objects transition to a
/// specified storage class.
class AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails {
  /// The number of days that an object is noncurrent before Amazon S3 can perform
  /// the associated action.
  final int? days;

  /// The class of storage to change the object to after the object is noncurrent
  /// for the specified number of days.
  final String? storageClass;

  AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails({
    this.days,
    this.storageClass,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesNoncurrentVersionTransitionsDetails(
      days: json['Days'] as int?,
      storageClass: json['StorageClass'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    final storageClass = this.storageClass;
    return {
      if (days != null) 'Days': days,
      if (storageClass != null) 'StorageClass': storageClass,
    };
  }
}

/// A rule for when objects transition to specific storage classes.
class AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails {
  /// A date on which to transition objects to the specified storage class. If you
  /// provide <code>Date</code>, you cannot provide <code>Days</code>.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? date;

  /// The number of days after which to transition the object to the specified
  /// storage class. If you provide <code>Days</code>, you cannot provide
  /// <code>Date</code>.
  final int? days;

  /// The storage class to transition the object to.
  final String? storageClass;

  AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails({
    this.date,
    this.days,
    this.storageClass,
  });

  factory AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketBucketLifecycleConfigurationRulesTransitionsDetails(
      date: json['Date'] as String?,
      days: json['Days'] as int?,
      storageClass: json['StorageClass'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final days = this.days;
    final storageClass = this.storageClass;
    return {
      if (date != null) 'Date': date,
      if (days != null) 'Days': days,
      if (storageClass != null) 'StorageClass': storageClass,
    };
  }
}

/// The details of an Amazon S3 bucket.
class AwsS3BucketDetails {
  /// The lifecycle configuration for objects in the S3 bucket.
  final AwsS3BucketBucketLifecycleConfigurationDetails?
      bucketLifecycleConfiguration;

  /// Indicates when the S3 bucket was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? createdAt;

  /// The canonical user ID of the owner of the S3 bucket.
  final String? ownerId;

  /// The display name of the owner of the S3 bucket.
  final String? ownerName;

  /// Provides information about the Amazon S3 Public Access Block configuration
  /// for the S3 bucket.
  final AwsS3AccountPublicAccessBlockDetails? publicAccessBlockConfiguration;

  /// The encryption rules that are applied to the S3 bucket.
  final AwsS3BucketServerSideEncryptionConfiguration?
      serverSideEncryptionConfiguration;

  AwsS3BucketDetails({
    this.bucketLifecycleConfiguration,
    this.createdAt,
    this.ownerId,
    this.ownerName,
    this.publicAccessBlockConfiguration,
    this.serverSideEncryptionConfiguration,
  });

  factory AwsS3BucketDetails.fromJson(Map<String, dynamic> json) {
    return AwsS3BucketDetails(
      bucketLifecycleConfiguration: json['BucketLifecycleConfiguration'] != null
          ? AwsS3BucketBucketLifecycleConfigurationDetails.fromJson(
              json['BucketLifecycleConfiguration'] as Map<String, dynamic>)
          : null,
      createdAt: json['CreatedAt'] as String?,
      ownerId: json['OwnerId'] as String?,
      ownerName: json['OwnerName'] as String?,
      publicAccessBlockConfiguration: json['PublicAccessBlockConfiguration'] !=
              null
          ? AwsS3AccountPublicAccessBlockDetails.fromJson(
              json['PublicAccessBlockConfiguration'] as Map<String, dynamic>)
          : null,
      serverSideEncryptionConfiguration:
          json['ServerSideEncryptionConfiguration'] != null
              ? AwsS3BucketServerSideEncryptionConfiguration.fromJson(
                  json['ServerSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketLifecycleConfiguration = this.bucketLifecycleConfiguration;
    final createdAt = this.createdAt;
    final ownerId = this.ownerId;
    final ownerName = this.ownerName;
    final publicAccessBlockConfiguration = this.publicAccessBlockConfiguration;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    return {
      if (bucketLifecycleConfiguration != null)
        'BucketLifecycleConfiguration': bucketLifecycleConfiguration,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (ownerId != null) 'OwnerId': ownerId,
      if (ownerName != null) 'OwnerName': ownerName,
      if (publicAccessBlockConfiguration != null)
        'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
      if (serverSideEncryptionConfiguration != null)
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
    };
  }
}

/// Specifies the default server-side encryption to apply to new objects in the
/// bucket.
class AwsS3BucketServerSideEncryptionByDefault {
  /// AWS KMS customer master key (CMK) ID to use for the default encryption.
  final String? kMSMasterKeyID;

  /// Server-side encryption algorithm to use for the default encryption.
  final String? sSEAlgorithm;

  AwsS3BucketServerSideEncryptionByDefault({
    this.kMSMasterKeyID,
    this.sSEAlgorithm,
  });

  factory AwsS3BucketServerSideEncryptionByDefault.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketServerSideEncryptionByDefault(
      kMSMasterKeyID: json['KMSMasterKeyID'] as String?,
      sSEAlgorithm: json['SSEAlgorithm'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kMSMasterKeyID = this.kMSMasterKeyID;
    final sSEAlgorithm = this.sSEAlgorithm;
    return {
      if (kMSMasterKeyID != null) 'KMSMasterKeyID': kMSMasterKeyID,
      if (sSEAlgorithm != null) 'SSEAlgorithm': sSEAlgorithm,
    };
  }
}

/// The encryption configuration for the S3 bucket.
class AwsS3BucketServerSideEncryptionConfiguration {
  /// The encryption rules that are applied to the S3 bucket.
  final List<AwsS3BucketServerSideEncryptionRule>? rules;

  AwsS3BucketServerSideEncryptionConfiguration({
    this.rules,
  });

  factory AwsS3BucketServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketServerSideEncryptionConfiguration(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => AwsS3BucketServerSideEncryptionRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

/// An encryption rule to apply to the S3 bucket.
class AwsS3BucketServerSideEncryptionRule {
  /// Specifies the default server-side encryption to apply to new objects in the
  /// bucket. If a <code>PUT</code> object request doesn't specify any server-side
  /// encryption, this default encryption is applied.
  final AwsS3BucketServerSideEncryptionByDefault?
      applyServerSideEncryptionByDefault;

  AwsS3BucketServerSideEncryptionRule({
    this.applyServerSideEncryptionByDefault,
  });

  factory AwsS3BucketServerSideEncryptionRule.fromJson(
      Map<String, dynamic> json) {
    return AwsS3BucketServerSideEncryptionRule(
      applyServerSideEncryptionByDefault:
          json['ApplyServerSideEncryptionByDefault'] != null
              ? AwsS3BucketServerSideEncryptionByDefault.fromJson(
                  json['ApplyServerSideEncryptionByDefault']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applyServerSideEncryptionByDefault =
        this.applyServerSideEncryptionByDefault;
    return {
      if (applyServerSideEncryptionByDefault != null)
        'ApplyServerSideEncryptionByDefault':
            applyServerSideEncryptionByDefault,
    };
  }
}

/// Details about an Amazon S3 object.
class AwsS3ObjectDetails {
  /// A standard MIME type describing the format of the object data.
  final String? contentType;

  /// The opaque identifier assigned by a web server to a specific version of a
  /// resource found at a URL.
  final String? eTag;

  /// Indicates when the object was last modified.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastModified;

  /// The identifier of the AWS Key Management Service (AWS KMS) symmetric
  /// customer managed customer master key (CMK) that was used for the object.
  final String? sSEKMSKeyId;

  /// If the object is stored using server-side encryption, the value of the
  /// server-side encryption algorithm used when storing this object in Amazon S3.
  final String? serverSideEncryption;

  /// The version of the object.
  final String? versionId;

  AwsS3ObjectDetails({
    this.contentType,
    this.eTag,
    this.lastModified,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.versionId,
  });

  factory AwsS3ObjectDetails.fromJson(Map<String, dynamic> json) {
    return AwsS3ObjectDetails(
      contentType: json['ContentType'] as String?,
      eTag: json['ETag'] as String?,
      lastModified: json['LastModified'] as String?,
      sSEKMSKeyId: json['SSEKMSKeyId'] as String?,
      serverSideEncryption: json['ServerSideEncryption'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final eTag = this.eTag;
    final lastModified = this.lastModified;
    final sSEKMSKeyId = this.sSEKMSKeyId;
    final serverSideEncryption = this.serverSideEncryption;
    final versionId = this.versionId;
    return {
      if (contentType != null) 'ContentType': contentType,
      if (eTag != null) 'ETag': eTag,
      if (lastModified != null) 'LastModified': lastModified,
      if (sSEKMSKeyId != null) 'SSEKMSKeyId': sSEKMSKeyId,
      if (serverSideEncryption != null)
        'ServerSideEncryption': serverSideEncryption,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Details about an AWS Secrets Manager secret.
class AwsSecretsManagerSecretDetails {
  /// Whether the secret is deleted.
  final bool? deleted;

  /// The user-provided description of the secret.
  final String? description;

  /// The ARN, Key ID, or alias of the AWS KMS customer master key (CMK) used to
  /// encrypt the <code>SecretString</code> or <code>SecretBinary</code> values
  /// for versions of this secret.
  final String? kmsKeyId;

  /// The name of the secret.
  final String? name;

  /// Whether rotation is enabled.
  final bool? rotationEnabled;

  /// The ARN of the Lambda function that rotates the secret.
  final String? rotationLambdaArn;

  /// Whether the rotation occurred within the specified rotation frequency.
  final bool? rotationOccurredWithinFrequency;

  /// Defines the rotation schedule for the secret.
  final AwsSecretsManagerSecretRotationRules? rotationRules;

  AwsSecretsManagerSecretDetails({
    this.deleted,
    this.description,
    this.kmsKeyId,
    this.name,
    this.rotationEnabled,
    this.rotationLambdaArn,
    this.rotationOccurredWithinFrequency,
    this.rotationRules,
  });

  factory AwsSecretsManagerSecretDetails.fromJson(Map<String, dynamic> json) {
    return AwsSecretsManagerSecretDetails(
      deleted: json['Deleted'] as bool?,
      description: json['Description'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      name: json['Name'] as String?,
      rotationEnabled: json['RotationEnabled'] as bool?,
      rotationLambdaArn: json['RotationLambdaArn'] as String?,
      rotationOccurredWithinFrequency:
          json['RotationOccurredWithinFrequency'] as bool?,
      rotationRules: json['RotationRules'] != null
          ? AwsSecretsManagerSecretRotationRules.fromJson(
              json['RotationRules'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleted = this.deleted;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final rotationEnabled = this.rotationEnabled;
    final rotationLambdaArn = this.rotationLambdaArn;
    final rotationOccurredWithinFrequency =
        this.rotationOccurredWithinFrequency;
    final rotationRules = this.rotationRules;
    return {
      if (deleted != null) 'Deleted': deleted,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (name != null) 'Name': name,
      if (rotationEnabled != null) 'RotationEnabled': rotationEnabled,
      if (rotationLambdaArn != null) 'RotationLambdaArn': rotationLambdaArn,
      if (rotationOccurredWithinFrequency != null)
        'RotationOccurredWithinFrequency': rotationOccurredWithinFrequency,
      if (rotationRules != null) 'RotationRules': rotationRules,
    };
  }
}

/// Defines the rotation schedule for the secret.
class AwsSecretsManagerSecretRotationRules {
  /// The number of days after the previous rotation to rotate the secret.
  final int? automaticallyAfterDays;

  AwsSecretsManagerSecretRotationRules({
    this.automaticallyAfterDays,
  });

  factory AwsSecretsManagerSecretRotationRules.fromJson(
      Map<String, dynamic> json) {
    return AwsSecretsManagerSecretRotationRules(
      automaticallyAfterDays: json['AutomaticallyAfterDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticallyAfterDays = this.automaticallyAfterDays;
    return {
      if (automaticallyAfterDays != null)
        'AutomaticallyAfterDays': automaticallyAfterDays,
    };
  }
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
class AwsSecurityFinding {
  /// The AWS account ID that a finding is generated in.
  final String awsAccountId;

  /// Indicates when the security-findings provider created the potential security
  /// issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String createdAt;

  /// A finding's description.
  /// <note>
  /// In this release, <code>Description</code> is a required property.
  /// </note>
  final String description;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plugin, etc.
  final String generatorId;

  /// The security findings provider-specific identifier for a finding.
  final String id;

  /// The ARN generated by Security Hub that uniquely identifies a product that
  /// generates findings. This can be the ARN for a third-party product that is
  /// integrated with Security Hub, or the ARN for a custom integration.
  final String productArn;

  /// A set of resource data types that describe the resources that the finding
  /// refers to.
  final List<Resource> resources;

  /// The schema version that a finding is formatted for.
  final String schemaVersion;

  /// A finding's title.
  /// <note>
  /// In this release, <code>Title</code> is a required property.
  /// </note>
  final String title;

  /// Indicates when the security-findings provider last updated the finding
  /// record.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String updatedAt;

  /// Provides details about an action that affects or that was taken on a
  /// resource.
  final Action? action;

  /// This data type is exclusive to findings that are generated as the result of
  /// a check run against a specific rule in a supported security standard, such
  /// as CIS AWS Foundations. Contains security standard-related finding details.
  final Compliance? compliance;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended to
  /// identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  final int? confidence;

  /// The level of importance assigned to the resources associated with the
  /// finding.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  final int? criticality;

  /// In a <code>BatchImportFindings</code> request, finding providers use
  /// <code>FindingProviderFields</code> to provide and update their own values
  /// for confidence, criticality, related findings, severity, and types.
  final FindingProviderFields? findingProviderFields;

  /// Indicates when the security-findings provider first observed the potential
  /// security issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? firstObservedAt;

  /// Indicates when the security-findings provider most recently observed the
  /// potential security issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastObservedAt;

  /// A list of malware related to a finding.
  final List<Malware>? malware;

  /// The details of network-related information about a finding.
  final Network? network;

  /// Provides information about a network path that is relevant to a finding.
  /// Each entry under <code>NetworkPath</code> represents a component of that
  /// path.
  final List<NetworkPathComponent>? networkPath;

  /// A user-defined note added to a finding.
  final Note? note;

  /// Provides an overview of the patch compliance status for an instance against
  /// a selected compliance standard.
  final PatchSummary? patchSummary;

  /// The details of process-related information about a finding.
  final ProcessDetails? process;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// <code>AwsSecurityFinding</code> format.
  final Map<String, String>? productFields;

  /// The record state of a finding.
  final RecordState? recordState;

  /// A list of related findings.
  final List<RelatedFinding>? relatedFindings;

  /// A data type that describes the remediation options for a finding.
  final Remediation? remediation;

  /// A finding's severity.
  final Severity? severity;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  final String? sourceUrl;

  /// Threat intelligence details related to a finding.
  final List<ThreatIntelIndicator>? threatIntelIndicators;

  /// One or more finding types in the format of
  /// <code>namespace/category/classifier</code> that classify a finding.
  ///
  /// Valid namespace values are: Software and Configuration Checks | TTPs |
  /// Effects | Unusual Behaviors | Sensitive Data Identifications
  final List<String>? types;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  final Map<String, String>? userDefinedFields;

  /// Indicates the veracity of a finding.
  final VerificationState? verificationState;

  /// Provides a list of vulnerabilities associated with the findings.
  final List<Vulnerability>? vulnerabilities;

  /// Provides information about the status of the investigation into a finding.
  final Workflow? workflow;

  /// The workflow state of a finding.
  final WorkflowState? workflowState;

  AwsSecurityFinding({
    required this.awsAccountId,
    required this.createdAt,
    required this.description,
    required this.generatorId,
    required this.id,
    required this.productArn,
    required this.resources,
    required this.schemaVersion,
    required this.title,
    required this.updatedAt,
    this.action,
    this.compliance,
    this.confidence,
    this.criticality,
    this.findingProviderFields,
    this.firstObservedAt,
    this.lastObservedAt,
    this.malware,
    this.network,
    this.networkPath,
    this.note,
    this.patchSummary,
    this.process,
    this.productFields,
    this.recordState,
    this.relatedFindings,
    this.remediation,
    this.severity,
    this.sourceUrl,
    this.threatIntelIndicators,
    this.types,
    this.userDefinedFields,
    this.verificationState,
    this.vulnerabilities,
    this.workflow,
    this.workflowState,
  });

  factory AwsSecurityFinding.fromJson(Map<String, dynamic> json) {
    return AwsSecurityFinding(
      awsAccountId: json['AwsAccountId'] as String,
      createdAt: json['CreatedAt'] as String,
      description: json['Description'] as String,
      generatorId: json['GeneratorId'] as String,
      id: json['Id'] as String,
      productArn: json['ProductArn'] as String,
      resources: (json['Resources'] as List)
          .whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaVersion: json['SchemaVersion'] as String,
      title: json['Title'] as String,
      updatedAt: json['UpdatedAt'] as String,
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      compliance: json['Compliance'] != null
          ? Compliance.fromJson(json['Compliance'] as Map<String, dynamic>)
          : null,
      confidence: json['Confidence'] as int?,
      criticality: json['Criticality'] as int?,
      findingProviderFields: json['FindingProviderFields'] != null
          ? FindingProviderFields.fromJson(
              json['FindingProviderFields'] as Map<String, dynamic>)
          : null,
      firstObservedAt: json['FirstObservedAt'] as String?,
      lastObservedAt: json['LastObservedAt'] as String?,
      malware: (json['Malware'] as List?)
          ?.whereNotNull()
          .map((e) => Malware.fromJson(e as Map<String, dynamic>))
          .toList(),
      network: json['Network'] != null
          ? Network.fromJson(json['Network'] as Map<String, dynamic>)
          : null,
      networkPath: (json['NetworkPath'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkPathComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['Note'] != null
          ? Note.fromJson(json['Note'] as Map<String, dynamic>)
          : null,
      patchSummary: json['PatchSummary'] != null
          ? PatchSummary.fromJson(json['PatchSummary'] as Map<String, dynamic>)
          : null,
      process: json['Process'] != null
          ? ProcessDetails.fromJson(json['Process'] as Map<String, dynamic>)
          : null,
      productFields: (json['ProductFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      recordState: (json['RecordState'] as String?)?.toRecordState(),
      relatedFindings: (json['RelatedFindings'] as List?)
          ?.whereNotNull()
          .map((e) => RelatedFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      remediation: json['Remediation'] != null
          ? Remediation.fromJson(json['Remediation'] as Map<String, dynamic>)
          : null,
      severity: json['Severity'] != null
          ? Severity.fromJson(json['Severity'] as Map<String, dynamic>)
          : null,
      sourceUrl: json['SourceUrl'] as String?,
      threatIntelIndicators: (json['ThreatIntelIndicators'] as List?)
          ?.whereNotNull()
          .map((e) => ThreatIntelIndicator.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['Types'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userDefinedFields: (json['UserDefinedFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      verificationState:
          (json['VerificationState'] as String?)?.toVerificationState(),
      vulnerabilities: (json['Vulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => Vulnerability.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflow: json['Workflow'] != null
          ? Workflow.fromJson(json['Workflow'] as Map<String, dynamic>)
          : null,
      workflowState: (json['WorkflowState'] as String?)?.toWorkflowState(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final createdAt = this.createdAt;
    final description = this.description;
    final generatorId = this.generatorId;
    final id = this.id;
    final productArn = this.productArn;
    final resources = this.resources;
    final schemaVersion = this.schemaVersion;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final action = this.action;
    final compliance = this.compliance;
    final confidence = this.confidence;
    final criticality = this.criticality;
    final findingProviderFields = this.findingProviderFields;
    final firstObservedAt = this.firstObservedAt;
    final lastObservedAt = this.lastObservedAt;
    final malware = this.malware;
    final network = this.network;
    final networkPath = this.networkPath;
    final note = this.note;
    final patchSummary = this.patchSummary;
    final process = this.process;
    final productFields = this.productFields;
    final recordState = this.recordState;
    final relatedFindings = this.relatedFindings;
    final remediation = this.remediation;
    final severity = this.severity;
    final sourceUrl = this.sourceUrl;
    final threatIntelIndicators = this.threatIntelIndicators;
    final types = this.types;
    final userDefinedFields = this.userDefinedFields;
    final verificationState = this.verificationState;
    final vulnerabilities = this.vulnerabilities;
    final workflow = this.workflow;
    final workflowState = this.workflowState;
    return {
      'AwsAccountId': awsAccountId,
      'CreatedAt': createdAt,
      'Description': description,
      'GeneratorId': generatorId,
      'Id': id,
      'ProductArn': productArn,
      'Resources': resources,
      'SchemaVersion': schemaVersion,
      'Title': title,
      'UpdatedAt': updatedAt,
      if (action != null) 'Action': action,
      if (compliance != null) 'Compliance': compliance,
      if (confidence != null) 'Confidence': confidence,
      if (criticality != null) 'Criticality': criticality,
      if (findingProviderFields != null)
        'FindingProviderFields': findingProviderFields,
      if (firstObservedAt != null) 'FirstObservedAt': firstObservedAt,
      if (lastObservedAt != null) 'LastObservedAt': lastObservedAt,
      if (malware != null) 'Malware': malware,
      if (network != null) 'Network': network,
      if (networkPath != null) 'NetworkPath': networkPath,
      if (note != null) 'Note': note,
      if (patchSummary != null) 'PatchSummary': patchSummary,
      if (process != null) 'Process': process,
      if (productFields != null) 'ProductFields': productFields,
      if (recordState != null) 'RecordState': recordState.toValue(),
      if (relatedFindings != null) 'RelatedFindings': relatedFindings,
      if (remediation != null) 'Remediation': remediation,
      if (severity != null) 'Severity': severity,
      if (sourceUrl != null) 'SourceUrl': sourceUrl,
      if (threatIntelIndicators != null)
        'ThreatIntelIndicators': threatIntelIndicators,
      if (types != null) 'Types': types,
      if (userDefinedFields != null) 'UserDefinedFields': userDefinedFields,
      if (verificationState != null)
        'VerificationState': verificationState.toValue(),
      if (vulnerabilities != null) 'Vulnerabilities': vulnerabilities,
      if (workflow != null) 'Workflow': workflow,
      if (workflowState != null) 'WorkflowState': workflowState.toValue(),
    };
  }
}

/// A collection of attributes that are applied to all active Security
/// Hub-aggregated findings and that result in a subset of findings that are
/// included in this insight.
///
/// You can filter by up to 10 finding attributes. For each attribute, you can
/// provide up to 20 filter values.
class AwsSecurityFindingFilters {
  /// The AWS account ID that a finding is generated in.
  final List<StringFilter>? awsAccountId;

  /// The name of the findings provider (company) that owns the solution (product)
  /// that generates findings.
  final List<StringFilter>? companyName;

  /// Exclusive to findings that are generated as the result of a check run
  /// against a specific rule in a supported standard, such as CIS AWS
  /// Foundations. Contains security standard-related finding details.
  final List<StringFilter>? complianceStatus;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended to
  /// identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  final List<NumberFilter>? confidence;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider captured the potential security issue that a finding captured.
  final List<DateFilter>? createdAt;

  /// The level of importance assigned to the resources associated with the
  /// finding.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  final List<NumberFilter>? criticality;

  /// A finding's description.
  final List<StringFilter>? description;

  /// The finding provider value for the finding confidence. Confidence is defined
  /// as the likelihood that a finding accurately identifies the behavior or issue
  /// that it was intended to identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  final List<NumberFilter>? findingProviderFieldsConfidence;

  /// The finding provider value for the level of importance assigned to the
  /// resources associated with the findings.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  final List<NumberFilter>? findingProviderFieldsCriticality;

  /// The finding identifier of a related finding that is identified by the
  /// finding provider.
  final List<StringFilter>? findingProviderFieldsRelatedFindingsId;

  /// The ARN of the solution that generated a related finding that is identified
  /// by the finding provider.
  final List<StringFilter>? findingProviderFieldsRelatedFindingsProductArn;

  /// The finding provider value for the severity label.
  final List<StringFilter>? findingProviderFieldsSeverityLabel;

  /// The finding provider's original value for the severity.
  final List<StringFilter>? findingProviderFieldsSeverityOriginal;

  /// One or more finding types that the finding provider assigned to the finding.
  /// Uses the format of <code>namespace/category/classifier</code> that classify
  /// a finding.
  ///
  /// Valid namespace values are: Software and Configuration Checks | TTPs |
  /// Effects | Unusual Behaviors | Sensitive Data Identifications
  final List<StringFilter>? findingProviderFieldsTypes;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider first observed the potential security issue that a finding
  /// captured.
  final List<DateFilter>? firstObservedAt;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plugin, etc.
  final List<StringFilter>? generatorId;

  /// The security findings provider-specific identifier for a finding.
  final List<StringFilter>? id;

  /// A keyword for a finding.
  final List<KeywordFilter>? keyword;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider most recently observed the potential security issue that a finding
  /// captured.
  final List<DateFilter>? lastObservedAt;

  /// The name of the malware that was observed.
  final List<StringFilter>? malwareName;

  /// The filesystem path of the malware that was observed.
  final List<StringFilter>? malwarePath;

  /// The state of the malware that was observed.
  final List<StringFilter>? malwareState;

  /// The type of the malware that was observed.
  final List<StringFilter>? malwareType;

  /// The destination domain of network-related information about a finding.
  final List<StringFilter>? networkDestinationDomain;

  /// The destination IPv4 address of network-related information about a finding.
  final List<IpFilter>? networkDestinationIpV4;

  /// The destination IPv6 address of network-related information about a finding.
  final List<IpFilter>? networkDestinationIpV6;

  /// The destination port of network-related information about a finding.
  final List<NumberFilter>? networkDestinationPort;

  /// Indicates the direction of network traffic associated with a finding.
  final List<StringFilter>? networkDirection;

  /// The protocol of network-related information about a finding.
  final List<StringFilter>? networkProtocol;

  /// The source domain of network-related information about a finding.
  final List<StringFilter>? networkSourceDomain;

  /// The source IPv4 address of network-related information about a finding.
  final List<IpFilter>? networkSourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  final List<IpFilter>? networkSourceIpV6;

  /// The source media access control (MAC) address of network-related information
  /// about a finding.
  final List<StringFilter>? networkSourceMac;

  /// The source port of network-related information about a finding.
  final List<NumberFilter>? networkSourcePort;

  /// The text of a note.
  final List<StringFilter>? noteText;

  /// The timestamp of when the note was updated.
  final List<DateFilter>? noteUpdatedAt;

  /// The principal that created a note.
  final List<StringFilter>? noteUpdatedBy;

  /// The date/time that the process was launched.
  final List<DateFilter>? processLaunchedAt;

  /// The name of the process.
  final List<StringFilter>? processName;

  /// The parent process ID.
  final List<NumberFilter>? processParentPid;

  /// The path to the process executable.
  final List<StringFilter>? processPath;

  /// The process ID.
  final List<NumberFilter>? processPid;

  /// The date/time that the process was terminated.
  final List<DateFilter>? processTerminatedAt;

  /// The ARN generated by Security Hub that uniquely identifies a third-party
  /// company (security findings provider) after this provider's product (solution
  /// that generates findings) is registered with Security Hub.
  final List<StringFilter>? productArn;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// <code>AwsSecurityFinding</code> format.
  final List<MapFilter>? productFields;

  /// The name of the solution (product) that generates findings.
  final List<StringFilter>? productName;

  /// The recommendation of what to do about the issue described in a finding.
  final List<StringFilter>? recommendationText;

  /// The updated record state for the finding.
  final List<StringFilter>? recordState;

  /// The solution-generated identifier for a related finding.
  final List<StringFilter>? relatedFindingsId;

  /// The ARN of the solution that generated a related finding.
  final List<StringFilter>? relatedFindingsProductArn;

  /// The IAM profile ARN of the instance.
  final List<StringFilter>? resourceAwsEc2InstanceIamInstanceProfileArn;

  /// The Amazon Machine Image (AMI) ID of the instance.
  final List<StringFilter>? resourceAwsEc2InstanceImageId;

  /// The IPv4 addresses associated with the instance.
  final List<IpFilter>? resourceAwsEc2InstanceIpV4Addresses;

  /// The IPv6 addresses associated with the instance.
  final List<IpFilter>? resourceAwsEc2InstanceIpV6Addresses;

  /// The key name associated with the instance.
  final List<StringFilter>? resourceAwsEc2InstanceKeyName;

  /// The date and time the instance was launched.
  final List<DateFilter>? resourceAwsEc2InstanceLaunchedAt;

  /// The identifier of the subnet that the instance was launched in.
  final List<StringFilter>? resourceAwsEc2InstanceSubnetId;

  /// The instance type of the instance.
  final List<StringFilter>? resourceAwsEc2InstanceType;

  /// The identifier of the VPC that the instance was launched in.
  final List<StringFilter>? resourceAwsEc2InstanceVpcId;

  /// The creation date/time of the IAM access key related to a finding.
  final List<DateFilter>? resourceAwsIamAccessKeyCreatedAt;

  /// The status of the IAM access key related to a finding.
  final List<StringFilter>? resourceAwsIamAccessKeyStatus;

  /// The user associated with the IAM access key related to a finding.
  final List<StringFilter>? resourceAwsIamAccessKeyUserName;

  /// The canonical user ID of the owner of the S3 bucket.
  final List<StringFilter>? resourceAwsS3BucketOwnerId;

  /// The display name of the owner of the S3 bucket.
  final List<StringFilter>? resourceAwsS3BucketOwnerName;

  /// The identifier of the image related to a finding.
  final List<StringFilter>? resourceContainerImageId;

  /// The name of the image related to a finding.
  final List<StringFilter>? resourceContainerImageName;

  /// The date/time that the container was started.
  final List<DateFilter>? resourceContainerLaunchedAt;

  /// The name of the container related to a finding.
  final List<StringFilter>? resourceContainerName;

  /// The details of a resource that doesn't have a specific subfield for the
  /// resource type defined.
  final List<MapFilter>? resourceDetailsOther;

  /// The canonical identifier for the given resource type.
  final List<StringFilter>? resourceId;

  /// The canonical AWS partition name that the Region is assigned to.
  final List<StringFilter>? resourcePartition;

  /// The canonical AWS external Region name where this resource is located.
  final List<StringFilter>? resourceRegion;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  final List<MapFilter>? resourceTags;

  /// Specifies the type of the resource that details are provided for.
  final List<StringFilter>? resourceType;

  /// The label of a finding's severity.
  final List<StringFilter>? severityLabel;

  /// The normalized severity of a finding.
  final List<NumberFilter>? severityNormalized;

  /// The native severity as defined by the security-findings provider's solution
  /// that generated the finding.
  final List<NumberFilter>? severityProduct;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  final List<StringFilter>? sourceUrl;

  /// The category of a threat intelligence indicator.
  final List<StringFilter>? threatIntelIndicatorCategory;

  /// The date/time of the last observation of a threat intelligence indicator.
  final List<DateFilter>? threatIntelIndicatorLastObservedAt;

  /// The source of the threat intelligence.
  final List<StringFilter>? threatIntelIndicatorSource;

  /// The URL for more details from the source of the threat intelligence.
  final List<StringFilter>? threatIntelIndicatorSourceUrl;

  /// The type of a threat intelligence indicator.
  final List<StringFilter>? threatIntelIndicatorType;

  /// The value of a threat intelligence indicator.
  final List<StringFilter>? threatIntelIndicatorValue;

  /// A finding's title.
  final List<StringFilter>? title;

  /// A finding type in the format of <code>namespace/category/classifier</code>
  /// that classifies a finding.
  final List<StringFilter>? type;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider last updated the finding record.
  final List<DateFilter>? updatedAt;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  final List<MapFilter>? userDefinedFields;

  /// The veracity of a finding.
  final List<StringFilter>? verificationState;

  /// The workflow state of a finding.
  ///
  /// Note that this field is deprecated. To search for a finding based on its
  /// workflow status, use <code>WorkflowStatus</code>.
  final List<StringFilter>? workflowState;

  /// The status of the investigation into a finding. Allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  ///
  /// Security Hub also resets the workflow status from <code>NOTIFIED</code> or
  /// <code>RESOLVED</code> to <code>NEW</code> in the following cases:
  ///
  /// <ul>
  /// <li>
  /// The record state changes from <code>ARCHIVED</code> to <code>ACTIVE</code>.
  /// </li>
  /// <li>
  /// The compliance status changes from <code>PASSED</code> to either
  /// <code>WARNING</code>, <code>FAILED</code>, or <code>NOT_AVAILABLE</code>.
  /// </li>
  /// </ul> </li>
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
  final List<StringFilter>? workflowStatus;

  AwsSecurityFindingFilters({
    this.awsAccountId,
    this.companyName,
    this.complianceStatus,
    this.confidence,
    this.createdAt,
    this.criticality,
    this.description,
    this.findingProviderFieldsConfidence,
    this.findingProviderFieldsCriticality,
    this.findingProviderFieldsRelatedFindingsId,
    this.findingProviderFieldsRelatedFindingsProductArn,
    this.findingProviderFieldsSeverityLabel,
    this.findingProviderFieldsSeverityOriginal,
    this.findingProviderFieldsTypes,
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

  factory AwsSecurityFindingFilters.fromJson(Map<String, dynamic> json) {
    return AwsSecurityFindingFilters(
      awsAccountId: (json['AwsAccountId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyName: (json['CompanyName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      complianceStatus: (json['ComplianceStatus'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['Confidence'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: (json['CreatedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      criticality: (json['Criticality'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: (json['Description'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingProviderFieldsConfidence:
          (json['FindingProviderFieldsConfidence'] as List?)
              ?.whereNotNull()
              .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsCriticality:
          (json['FindingProviderFieldsCriticality'] as List?)
              ?.whereNotNull()
              .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsRelatedFindingsId:
          (json['FindingProviderFieldsRelatedFindingsId'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsRelatedFindingsProductArn:
          (json['FindingProviderFieldsRelatedFindingsProductArn'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsSeverityLabel:
          (json['FindingProviderFieldsSeverityLabel'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsSeverityOriginal:
          (json['FindingProviderFieldsSeverityOriginal'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      findingProviderFieldsTypes: (json['FindingProviderFieldsTypes'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstObservedAt: (json['FirstObservedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      generatorId: (json['GeneratorId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['Id'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      keyword: (json['Keyword'] as List?)
          ?.whereNotNull()
          .map((e) => KeywordFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastObservedAt: (json['LastObservedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      malwareName: (json['MalwareName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      malwarePath: (json['MalwarePath'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      malwareState: (json['MalwareState'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      malwareType: (json['MalwareType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkDestinationDomain: (json['NetworkDestinationDomain'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkDestinationIpV4: (json['NetworkDestinationIpV4'] as List?)
          ?.whereNotNull()
          .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkDestinationIpV6: (json['NetworkDestinationIpV6'] as List?)
          ?.whereNotNull()
          .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkDestinationPort: (json['NetworkDestinationPort'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkDirection: (json['NetworkDirection'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkProtocol: (json['NetworkProtocol'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkSourceDomain: (json['NetworkSourceDomain'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkSourceIpV4: (json['NetworkSourceIpV4'] as List?)
          ?.whereNotNull()
          .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkSourceIpV6: (json['NetworkSourceIpV6'] as List?)
          ?.whereNotNull()
          .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkSourceMac: (json['NetworkSourceMac'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkSourcePort: (json['NetworkSourcePort'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      noteText: (json['NoteText'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      noteUpdatedAt: (json['NoteUpdatedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      noteUpdatedBy: (json['NoteUpdatedBy'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processLaunchedAt: (json['ProcessLaunchedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processName: (json['ProcessName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processParentPid: (json['ProcessParentPid'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processPath: (json['ProcessPath'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processPid: (json['ProcessPid'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processTerminatedAt: (json['ProcessTerminatedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      productArn: (json['ProductArn'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      productFields: (json['ProductFields'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      productName: (json['ProductName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationText: (json['RecommendationText'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordState: (json['RecordState'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedFindingsId: (json['RelatedFindingsId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedFindingsProductArn: (json['RelatedFindingsProductArn'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceAwsEc2InstanceIamInstanceProfileArn:
          (json['ResourceAwsEc2InstanceIamInstanceProfileArn'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceImageId:
          (json['ResourceAwsEc2InstanceImageId'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceIpV4Addresses:
          (json['ResourceAwsEc2InstanceIpV4Addresses'] as List?)
              ?.whereNotNull()
              .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceIpV6Addresses:
          (json['ResourceAwsEc2InstanceIpV6Addresses'] as List?)
              ?.whereNotNull()
              .map((e) => IpFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceKeyName:
          (json['ResourceAwsEc2InstanceKeyName'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceLaunchedAt:
          (json['ResourceAwsEc2InstanceLaunchedAt'] as List?)
              ?.whereNotNull()
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceSubnetId:
          (json['ResourceAwsEc2InstanceSubnetId'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsEc2InstanceType: (json['ResourceAwsEc2InstanceType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceAwsEc2InstanceVpcId:
          (json['ResourceAwsEc2InstanceVpcId'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsIamAccessKeyCreatedAt:
          (json['ResourceAwsIamAccessKeyCreatedAt'] as List?)
              ?.whereNotNull()
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsIamAccessKeyStatus:
          (json['ResourceAwsIamAccessKeyStatus'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsIamAccessKeyUserName:
          (json['ResourceAwsIamAccessKeyUserName'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceAwsS3BucketOwnerId: (json['ResourceAwsS3BucketOwnerId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceAwsS3BucketOwnerName:
          (json['ResourceAwsS3BucketOwnerName'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceContainerImageId: (json['ResourceContainerImageId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceContainerImageName: (json['ResourceContainerImageName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceContainerLaunchedAt:
          (json['ResourceContainerLaunchedAt'] as List?)
              ?.whereNotNull()
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      resourceContainerName: (json['ResourceContainerName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceDetailsOther: (json['ResourceDetailsOther'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['ResourceId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourcePartition: (json['ResourcePartition'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceRegion: (json['ResourceRegion'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severityLabel: (json['SeverityLabel'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severityNormalized: (json['SeverityNormalized'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severityProduct: (json['SeverityProduct'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceUrl: (json['SourceUrl'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      threatIntelIndicatorCategory:
          (json['ThreatIntelIndicatorCategory'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      threatIntelIndicatorLastObservedAt:
          (json['ThreatIntelIndicatorLastObservedAt'] as List?)
              ?.whereNotNull()
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      threatIntelIndicatorSource: (json['ThreatIntelIndicatorSource'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      threatIntelIndicatorSourceUrl:
          (json['ThreatIntelIndicatorSourceUrl'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      threatIntelIndicatorType: (json['ThreatIntelIndicatorType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      threatIntelIndicatorValue: (json['ThreatIntelIndicatorValue'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: (json['Title'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: (json['UpdatedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      userDefinedFields: (json['UserDefinedFields'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      verificationState: (json['VerificationState'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowState: (json['WorkflowState'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowStatus: (json['WorkflowStatus'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final companyName = this.companyName;
    final complianceStatus = this.complianceStatus;
    final confidence = this.confidence;
    final createdAt = this.createdAt;
    final criticality = this.criticality;
    final description = this.description;
    final findingProviderFieldsConfidence =
        this.findingProviderFieldsConfidence;
    final findingProviderFieldsCriticality =
        this.findingProviderFieldsCriticality;
    final findingProviderFieldsRelatedFindingsId =
        this.findingProviderFieldsRelatedFindingsId;
    final findingProviderFieldsRelatedFindingsProductArn =
        this.findingProviderFieldsRelatedFindingsProductArn;
    final findingProviderFieldsSeverityLabel =
        this.findingProviderFieldsSeverityLabel;
    final findingProviderFieldsSeverityOriginal =
        this.findingProviderFieldsSeverityOriginal;
    final findingProviderFieldsTypes = this.findingProviderFieldsTypes;
    final firstObservedAt = this.firstObservedAt;
    final generatorId = this.generatorId;
    final id = this.id;
    final keyword = this.keyword;
    final lastObservedAt = this.lastObservedAt;
    final malwareName = this.malwareName;
    final malwarePath = this.malwarePath;
    final malwareState = this.malwareState;
    final malwareType = this.malwareType;
    final networkDestinationDomain = this.networkDestinationDomain;
    final networkDestinationIpV4 = this.networkDestinationIpV4;
    final networkDestinationIpV6 = this.networkDestinationIpV6;
    final networkDestinationPort = this.networkDestinationPort;
    final networkDirection = this.networkDirection;
    final networkProtocol = this.networkProtocol;
    final networkSourceDomain = this.networkSourceDomain;
    final networkSourceIpV4 = this.networkSourceIpV4;
    final networkSourceIpV6 = this.networkSourceIpV6;
    final networkSourceMac = this.networkSourceMac;
    final networkSourcePort = this.networkSourcePort;
    final noteText = this.noteText;
    final noteUpdatedAt = this.noteUpdatedAt;
    final noteUpdatedBy = this.noteUpdatedBy;
    final processLaunchedAt = this.processLaunchedAt;
    final processName = this.processName;
    final processParentPid = this.processParentPid;
    final processPath = this.processPath;
    final processPid = this.processPid;
    final processTerminatedAt = this.processTerminatedAt;
    final productArn = this.productArn;
    final productFields = this.productFields;
    final productName = this.productName;
    final recommendationText = this.recommendationText;
    final recordState = this.recordState;
    final relatedFindingsId = this.relatedFindingsId;
    final relatedFindingsProductArn = this.relatedFindingsProductArn;
    final resourceAwsEc2InstanceIamInstanceProfileArn =
        this.resourceAwsEc2InstanceIamInstanceProfileArn;
    final resourceAwsEc2InstanceImageId = this.resourceAwsEc2InstanceImageId;
    final resourceAwsEc2InstanceIpV4Addresses =
        this.resourceAwsEc2InstanceIpV4Addresses;
    final resourceAwsEc2InstanceIpV6Addresses =
        this.resourceAwsEc2InstanceIpV6Addresses;
    final resourceAwsEc2InstanceKeyName = this.resourceAwsEc2InstanceKeyName;
    final resourceAwsEc2InstanceLaunchedAt =
        this.resourceAwsEc2InstanceLaunchedAt;
    final resourceAwsEc2InstanceSubnetId = this.resourceAwsEc2InstanceSubnetId;
    final resourceAwsEc2InstanceType = this.resourceAwsEc2InstanceType;
    final resourceAwsEc2InstanceVpcId = this.resourceAwsEc2InstanceVpcId;
    final resourceAwsIamAccessKeyCreatedAt =
        this.resourceAwsIamAccessKeyCreatedAt;
    final resourceAwsIamAccessKeyStatus = this.resourceAwsIamAccessKeyStatus;
    final resourceAwsIamAccessKeyUserName =
        this.resourceAwsIamAccessKeyUserName;
    final resourceAwsS3BucketOwnerId = this.resourceAwsS3BucketOwnerId;
    final resourceAwsS3BucketOwnerName = this.resourceAwsS3BucketOwnerName;
    final resourceContainerImageId = this.resourceContainerImageId;
    final resourceContainerImageName = this.resourceContainerImageName;
    final resourceContainerLaunchedAt = this.resourceContainerLaunchedAt;
    final resourceContainerName = this.resourceContainerName;
    final resourceDetailsOther = this.resourceDetailsOther;
    final resourceId = this.resourceId;
    final resourcePartition = this.resourcePartition;
    final resourceRegion = this.resourceRegion;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final severityLabel = this.severityLabel;
    final severityNormalized = this.severityNormalized;
    final severityProduct = this.severityProduct;
    final sourceUrl = this.sourceUrl;
    final threatIntelIndicatorCategory = this.threatIntelIndicatorCategory;
    final threatIntelIndicatorLastObservedAt =
        this.threatIntelIndicatorLastObservedAt;
    final threatIntelIndicatorSource = this.threatIntelIndicatorSource;
    final threatIntelIndicatorSourceUrl = this.threatIntelIndicatorSourceUrl;
    final threatIntelIndicatorType = this.threatIntelIndicatorType;
    final threatIntelIndicatorValue = this.threatIntelIndicatorValue;
    final title = this.title;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final userDefinedFields = this.userDefinedFields;
    final verificationState = this.verificationState;
    final workflowState = this.workflowState;
    final workflowStatus = this.workflowStatus;
    return {
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (companyName != null) 'CompanyName': companyName,
      if (complianceStatus != null) 'ComplianceStatus': complianceStatus,
      if (confidence != null) 'Confidence': confidence,
      if (createdAt != null) 'CreatedAt': createdAt,
      if (criticality != null) 'Criticality': criticality,
      if (description != null) 'Description': description,
      if (findingProviderFieldsConfidence != null)
        'FindingProviderFieldsConfidence': findingProviderFieldsConfidence,
      if (findingProviderFieldsCriticality != null)
        'FindingProviderFieldsCriticality': findingProviderFieldsCriticality,
      if (findingProviderFieldsRelatedFindingsId != null)
        'FindingProviderFieldsRelatedFindingsId':
            findingProviderFieldsRelatedFindingsId,
      if (findingProviderFieldsRelatedFindingsProductArn != null)
        'FindingProviderFieldsRelatedFindingsProductArn':
            findingProviderFieldsRelatedFindingsProductArn,
      if (findingProviderFieldsSeverityLabel != null)
        'FindingProviderFieldsSeverityLabel':
            findingProviderFieldsSeverityLabel,
      if (findingProviderFieldsSeverityOriginal != null)
        'FindingProviderFieldsSeverityOriginal':
            findingProviderFieldsSeverityOriginal,
      if (findingProviderFieldsTypes != null)
        'FindingProviderFieldsTypes': findingProviderFieldsTypes,
      if (firstObservedAt != null) 'FirstObservedAt': firstObservedAt,
      if (generatorId != null) 'GeneratorId': generatorId,
      if (id != null) 'Id': id,
      if (keyword != null) 'Keyword': keyword,
      if (lastObservedAt != null) 'LastObservedAt': lastObservedAt,
      if (malwareName != null) 'MalwareName': malwareName,
      if (malwarePath != null) 'MalwarePath': malwarePath,
      if (malwareState != null) 'MalwareState': malwareState,
      if (malwareType != null) 'MalwareType': malwareType,
      if (networkDestinationDomain != null)
        'NetworkDestinationDomain': networkDestinationDomain,
      if (networkDestinationIpV4 != null)
        'NetworkDestinationIpV4': networkDestinationIpV4,
      if (networkDestinationIpV6 != null)
        'NetworkDestinationIpV6': networkDestinationIpV6,
      if (networkDestinationPort != null)
        'NetworkDestinationPort': networkDestinationPort,
      if (networkDirection != null) 'NetworkDirection': networkDirection,
      if (networkProtocol != null) 'NetworkProtocol': networkProtocol,
      if (networkSourceDomain != null)
        'NetworkSourceDomain': networkSourceDomain,
      if (networkSourceIpV4 != null) 'NetworkSourceIpV4': networkSourceIpV4,
      if (networkSourceIpV6 != null) 'NetworkSourceIpV6': networkSourceIpV6,
      if (networkSourceMac != null) 'NetworkSourceMac': networkSourceMac,
      if (networkSourcePort != null) 'NetworkSourcePort': networkSourcePort,
      if (noteText != null) 'NoteText': noteText,
      if (noteUpdatedAt != null) 'NoteUpdatedAt': noteUpdatedAt,
      if (noteUpdatedBy != null) 'NoteUpdatedBy': noteUpdatedBy,
      if (processLaunchedAt != null) 'ProcessLaunchedAt': processLaunchedAt,
      if (processName != null) 'ProcessName': processName,
      if (processParentPid != null) 'ProcessParentPid': processParentPid,
      if (processPath != null) 'ProcessPath': processPath,
      if (processPid != null) 'ProcessPid': processPid,
      if (processTerminatedAt != null)
        'ProcessTerminatedAt': processTerminatedAt,
      if (productArn != null) 'ProductArn': productArn,
      if (productFields != null) 'ProductFields': productFields,
      if (productName != null) 'ProductName': productName,
      if (recommendationText != null) 'RecommendationText': recommendationText,
      if (recordState != null) 'RecordState': recordState,
      if (relatedFindingsId != null) 'RelatedFindingsId': relatedFindingsId,
      if (relatedFindingsProductArn != null)
        'RelatedFindingsProductArn': relatedFindingsProductArn,
      if (resourceAwsEc2InstanceIamInstanceProfileArn != null)
        'ResourceAwsEc2InstanceIamInstanceProfileArn':
            resourceAwsEc2InstanceIamInstanceProfileArn,
      if (resourceAwsEc2InstanceImageId != null)
        'ResourceAwsEc2InstanceImageId': resourceAwsEc2InstanceImageId,
      if (resourceAwsEc2InstanceIpV4Addresses != null)
        'ResourceAwsEc2InstanceIpV4Addresses':
            resourceAwsEc2InstanceIpV4Addresses,
      if (resourceAwsEc2InstanceIpV6Addresses != null)
        'ResourceAwsEc2InstanceIpV6Addresses':
            resourceAwsEc2InstanceIpV6Addresses,
      if (resourceAwsEc2InstanceKeyName != null)
        'ResourceAwsEc2InstanceKeyName': resourceAwsEc2InstanceKeyName,
      if (resourceAwsEc2InstanceLaunchedAt != null)
        'ResourceAwsEc2InstanceLaunchedAt': resourceAwsEc2InstanceLaunchedAt,
      if (resourceAwsEc2InstanceSubnetId != null)
        'ResourceAwsEc2InstanceSubnetId': resourceAwsEc2InstanceSubnetId,
      if (resourceAwsEc2InstanceType != null)
        'ResourceAwsEc2InstanceType': resourceAwsEc2InstanceType,
      if (resourceAwsEc2InstanceVpcId != null)
        'ResourceAwsEc2InstanceVpcId': resourceAwsEc2InstanceVpcId,
      if (resourceAwsIamAccessKeyCreatedAt != null)
        'ResourceAwsIamAccessKeyCreatedAt': resourceAwsIamAccessKeyCreatedAt,
      if (resourceAwsIamAccessKeyStatus != null)
        'ResourceAwsIamAccessKeyStatus': resourceAwsIamAccessKeyStatus,
      if (resourceAwsIamAccessKeyUserName != null)
        'ResourceAwsIamAccessKeyUserName': resourceAwsIamAccessKeyUserName,
      if (resourceAwsS3BucketOwnerId != null)
        'ResourceAwsS3BucketOwnerId': resourceAwsS3BucketOwnerId,
      if (resourceAwsS3BucketOwnerName != null)
        'ResourceAwsS3BucketOwnerName': resourceAwsS3BucketOwnerName,
      if (resourceContainerImageId != null)
        'ResourceContainerImageId': resourceContainerImageId,
      if (resourceContainerImageName != null)
        'ResourceContainerImageName': resourceContainerImageName,
      if (resourceContainerLaunchedAt != null)
        'ResourceContainerLaunchedAt': resourceContainerLaunchedAt,
      if (resourceContainerName != null)
        'ResourceContainerName': resourceContainerName,
      if (resourceDetailsOther != null)
        'ResourceDetailsOther': resourceDetailsOther,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourcePartition != null) 'ResourcePartition': resourcePartition,
      if (resourceRegion != null) 'ResourceRegion': resourceRegion,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType,
      if (severityLabel != null) 'SeverityLabel': severityLabel,
      if (severityNormalized != null) 'SeverityNormalized': severityNormalized,
      if (severityProduct != null) 'SeverityProduct': severityProduct,
      if (sourceUrl != null) 'SourceUrl': sourceUrl,
      if (threatIntelIndicatorCategory != null)
        'ThreatIntelIndicatorCategory': threatIntelIndicatorCategory,
      if (threatIntelIndicatorLastObservedAt != null)
        'ThreatIntelIndicatorLastObservedAt':
            threatIntelIndicatorLastObservedAt,
      if (threatIntelIndicatorSource != null)
        'ThreatIntelIndicatorSource': threatIntelIndicatorSource,
      if (threatIntelIndicatorSourceUrl != null)
        'ThreatIntelIndicatorSourceUrl': threatIntelIndicatorSourceUrl,
      if (threatIntelIndicatorType != null)
        'ThreatIntelIndicatorType': threatIntelIndicatorType,
      if (threatIntelIndicatorValue != null)
        'ThreatIntelIndicatorValue': threatIntelIndicatorValue,
      if (title != null) 'Title': title,
      if (type != null) 'Type': type,
      if (updatedAt != null) 'UpdatedAt': updatedAt,
      if (userDefinedFields != null) 'UserDefinedFields': userDefinedFields,
      if (verificationState != null) 'VerificationState': verificationState,
      if (workflowState != null) 'WorkflowState': workflowState,
      if (workflowStatus != null) 'WorkflowStatus': workflowStatus,
    };
  }
}

/// Identifies a finding to update using <code>BatchUpdateFindings</code>.
class AwsSecurityFindingIdentifier {
  /// The identifier of the finding that was specified by the finding provider.
  final String id;

  /// The ARN generated by Security Hub that uniquely identifies a product that
  /// generates findings. This can be the ARN for a third-party product that is
  /// integrated with Security Hub, or the ARN for a custom integration.
  final String productArn;

  AwsSecurityFindingIdentifier({
    required this.id,
    required this.productArn,
  });

  factory AwsSecurityFindingIdentifier.fromJson(Map<String, dynamic> json) {
    return AwsSecurityFindingIdentifier(
      id: json['Id'] as String,
      productArn: json['ProductArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final productArn = this.productArn;
    return {
      'Id': id,
      'ProductArn': productArn,
    };
  }
}

/// A wrapper type for the topic's ARN.
class AwsSnsTopicDetails {
  /// The ID of an AWS managed customer master key (CMK) for Amazon SNS or a
  /// custom CMK.
  final String? kmsMasterKeyId;

  /// The subscription's owner.
  final String? owner;

  /// Subscription is an embedded property that describes the subscription
  /// endpoints of an Amazon SNS topic.
  final List<AwsSnsTopicSubscription>? subscription;

  /// The name of the topic.
  final String? topicName;

  AwsSnsTopicDetails({
    this.kmsMasterKeyId,
    this.owner,
    this.subscription,
    this.topicName,
  });

  factory AwsSnsTopicDetails.fromJson(Map<String, dynamic> json) {
    return AwsSnsTopicDetails(
      kmsMasterKeyId: json['KmsMasterKeyId'] as String?,
      owner: json['Owner'] as String?,
      subscription: (json['Subscription'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsSnsTopicSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      topicName: json['TopicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsMasterKeyId = this.kmsMasterKeyId;
    final owner = this.owner;
    final subscription = this.subscription;
    final topicName = this.topicName;
    return {
      if (kmsMasterKeyId != null) 'KmsMasterKeyId': kmsMasterKeyId,
      if (owner != null) 'Owner': owner,
      if (subscription != null) 'Subscription': subscription,
      if (topicName != null) 'TopicName': topicName,
    };
  }
}

/// A wrapper type for the attributes of an Amazon SNS subscription.
class AwsSnsTopicSubscription {
  /// The subscription's endpoint (format depends on the protocol).
  final String? endpoint;

  /// The subscription's protocol.
  final String? protocol;

  AwsSnsTopicSubscription({
    this.endpoint,
    this.protocol,
  });

  factory AwsSnsTopicSubscription.fromJson(Map<String, dynamic> json) {
    return AwsSnsTopicSubscription(
      endpoint: json['Endpoint'] as String?,
      protocol: json['Protocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final protocol = this.protocol;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
      if (protocol != null) 'Protocol': protocol,
    };
  }
}

/// Data about a queue.
class AwsSqsQueueDetails {
  /// The ARN of the dead-letter queue to which Amazon SQS moves messages after
  /// the value of <code>maxReceiveCount</code> is exceeded.
  final String? deadLetterTargetArn;

  /// The length of time, in seconds, for which Amazon SQS can reuse a data key to
  /// encrypt or decrypt messages before calling AWS KMS again.
  final int? kmsDataKeyReusePeriodSeconds;

  /// The ID of an AWS managed customer master key (CMK) for Amazon SQS or a
  /// custom CMK.
  final String? kmsMasterKeyId;

  /// The name of the new queue.
  final String? queueName;

  AwsSqsQueueDetails({
    this.deadLetterTargetArn,
    this.kmsDataKeyReusePeriodSeconds,
    this.kmsMasterKeyId,
    this.queueName,
  });

  factory AwsSqsQueueDetails.fromJson(Map<String, dynamic> json) {
    return AwsSqsQueueDetails(
      deadLetterTargetArn: json['DeadLetterTargetArn'] as String?,
      kmsDataKeyReusePeriodSeconds:
          json['KmsDataKeyReusePeriodSeconds'] as int?,
      kmsMasterKeyId: json['KmsMasterKeyId'] as String?,
      queueName: json['QueueName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deadLetterTargetArn = this.deadLetterTargetArn;
    final kmsDataKeyReusePeriodSeconds = this.kmsDataKeyReusePeriodSeconds;
    final kmsMasterKeyId = this.kmsMasterKeyId;
    final queueName = this.queueName;
    return {
      if (deadLetterTargetArn != null)
        'DeadLetterTargetArn': deadLetterTargetArn,
      if (kmsDataKeyReusePeriodSeconds != null)
        'KmsDataKeyReusePeriodSeconds': kmsDataKeyReusePeriodSeconds,
      if (kmsMasterKeyId != null) 'KmsMasterKeyId': kmsMasterKeyId,
      if (queueName != null) 'QueueName': queueName,
    };
  }
}

/// Provides the details about the compliance status for a patch.
class AwsSsmComplianceSummary {
  /// The type of resource for which the compliance was determined. For
  /// <code>AwsSsmPatchCompliance</code>, <code>ComplianceType</code> is
  /// <code>Patch</code>.
  final String? complianceType;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>CRITICAL</code>.
  final int? compliantCriticalCount;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>HIGH</code>.
  final int? compliantHighCount;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>INFORMATIONAL</code>.
  final int? compliantInformationalCount;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>LOW</code>.
  final int? compliantLowCount;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>MEDIUM</code>.
  final int? compliantMediumCount;

  /// For the patches that are compliant, the number that have a severity of
  /// <code>UNSPECIFIED</code>.
  final int? compliantUnspecifiedCount;

  /// The type of execution that was used determine compliance.
  final String? executionType;

  /// For the patch items that are noncompliant, the number of items that have a
  /// severity of <code>CRITICAL</code>.
  final int? nonCompliantCriticalCount;

  /// For the patches that are noncompliant, the number that have a severity of
  /// <code>HIGH</code>.
  final int? nonCompliantHighCount;

  /// For the patches that are noncompliant, the number that have a severity of
  /// <code>INFORMATIONAL</code>.
  final int? nonCompliantInformationalCount;

  /// For the patches that are noncompliant, the number that have a severity of
  /// <code>LOW</code>.
  final int? nonCompliantLowCount;

  /// For the patches that are noncompliant, the number that have a severity of
  /// <code>MEDIUM</code>.
  final int? nonCompliantMediumCount;

  /// For the patches that are noncompliant, the number that have a severity of
  /// <code>UNSPECIFIED</code>.
  final int? nonCompliantUnspecifiedCount;

  /// The highest severity for the patches.
  final String? overallSeverity;

  /// The identifier of the patch baseline. The patch baseline lists the patches
  /// that are approved for installation.
  final String? patchBaselineId;

  /// The identifier of the patch group for which compliance was determined. A
  /// patch group uses tags to group EC2 instances that should have the same patch
  /// compliance.
  final String? patchGroup;

  /// The current patch compliance status.
  ///
  /// The possible status values are:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLIANT</code>
  /// </li>
  /// <li>
  /// <code>NON_COMPLIANT</code>
  /// </li>
  /// <li>
  /// <code>UNSPECIFIED_DATA</code>
  /// </li>
  /// </ul>
  final String? status;

  AwsSsmComplianceSummary({
    this.complianceType,
    this.compliantCriticalCount,
    this.compliantHighCount,
    this.compliantInformationalCount,
    this.compliantLowCount,
    this.compliantMediumCount,
    this.compliantUnspecifiedCount,
    this.executionType,
    this.nonCompliantCriticalCount,
    this.nonCompliantHighCount,
    this.nonCompliantInformationalCount,
    this.nonCompliantLowCount,
    this.nonCompliantMediumCount,
    this.nonCompliantUnspecifiedCount,
    this.overallSeverity,
    this.patchBaselineId,
    this.patchGroup,
    this.status,
  });

  factory AwsSsmComplianceSummary.fromJson(Map<String, dynamic> json) {
    return AwsSsmComplianceSummary(
      complianceType: json['ComplianceType'] as String?,
      compliantCriticalCount: json['CompliantCriticalCount'] as int?,
      compliantHighCount: json['CompliantHighCount'] as int?,
      compliantInformationalCount: json['CompliantInformationalCount'] as int?,
      compliantLowCount: json['CompliantLowCount'] as int?,
      compliantMediumCount: json['CompliantMediumCount'] as int?,
      compliantUnspecifiedCount: json['CompliantUnspecifiedCount'] as int?,
      executionType: json['ExecutionType'] as String?,
      nonCompliantCriticalCount: json['NonCompliantCriticalCount'] as int?,
      nonCompliantHighCount: json['NonCompliantHighCount'] as int?,
      nonCompliantInformationalCount:
          json['NonCompliantInformationalCount'] as int?,
      nonCompliantLowCount: json['NonCompliantLowCount'] as int?,
      nonCompliantMediumCount: json['NonCompliantMediumCount'] as int?,
      nonCompliantUnspecifiedCount:
          json['NonCompliantUnspecifiedCount'] as int?,
      overallSeverity: json['OverallSeverity'] as String?,
      patchBaselineId: json['PatchBaselineId'] as String?,
      patchGroup: json['PatchGroup'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final compliantCriticalCount = this.compliantCriticalCount;
    final compliantHighCount = this.compliantHighCount;
    final compliantInformationalCount = this.compliantInformationalCount;
    final compliantLowCount = this.compliantLowCount;
    final compliantMediumCount = this.compliantMediumCount;
    final compliantUnspecifiedCount = this.compliantUnspecifiedCount;
    final executionType = this.executionType;
    final nonCompliantCriticalCount = this.nonCompliantCriticalCount;
    final nonCompliantHighCount = this.nonCompliantHighCount;
    final nonCompliantInformationalCount = this.nonCompliantInformationalCount;
    final nonCompliantLowCount = this.nonCompliantLowCount;
    final nonCompliantMediumCount = this.nonCompliantMediumCount;
    final nonCompliantUnspecifiedCount = this.nonCompliantUnspecifiedCount;
    final overallSeverity = this.overallSeverity;
    final patchBaselineId = this.patchBaselineId;
    final patchGroup = this.patchGroup;
    final status = this.status;
    return {
      if (complianceType != null) 'ComplianceType': complianceType,
      if (compliantCriticalCount != null)
        'CompliantCriticalCount': compliantCriticalCount,
      if (compliantHighCount != null) 'CompliantHighCount': compliantHighCount,
      if (compliantInformationalCount != null)
        'CompliantInformationalCount': compliantInformationalCount,
      if (compliantLowCount != null) 'CompliantLowCount': compliantLowCount,
      if (compliantMediumCount != null)
        'CompliantMediumCount': compliantMediumCount,
      if (compliantUnspecifiedCount != null)
        'CompliantUnspecifiedCount': compliantUnspecifiedCount,
      if (executionType != null) 'ExecutionType': executionType,
      if (nonCompliantCriticalCount != null)
        'NonCompliantCriticalCount': nonCompliantCriticalCount,
      if (nonCompliantHighCount != null)
        'NonCompliantHighCount': nonCompliantHighCount,
      if (nonCompliantInformationalCount != null)
        'NonCompliantInformationalCount': nonCompliantInformationalCount,
      if (nonCompliantLowCount != null)
        'NonCompliantLowCount': nonCompliantLowCount,
      if (nonCompliantMediumCount != null)
        'NonCompliantMediumCount': nonCompliantMediumCount,
      if (nonCompliantUnspecifiedCount != null)
        'NonCompliantUnspecifiedCount': nonCompliantUnspecifiedCount,
      if (overallSeverity != null) 'OverallSeverity': overallSeverity,
      if (patchBaselineId != null) 'PatchBaselineId': patchBaselineId,
      if (patchGroup != null) 'PatchGroup': patchGroup,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides details about the compliance for a patch.
class AwsSsmPatch {
  /// The compliance status details for the patch.
  final AwsSsmComplianceSummary? complianceSummary;

  AwsSsmPatch({
    this.complianceSummary,
  });

  factory AwsSsmPatch.fromJson(Map<String, dynamic> json) {
    return AwsSsmPatch(
      complianceSummary: json['ComplianceSummary'] != null
          ? AwsSsmComplianceSummary.fromJson(
              json['ComplianceSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceSummary = this.complianceSummary;
    return {
      if (complianceSummary != null) 'ComplianceSummary': complianceSummary,
    };
  }
}

/// Provides information about the state of a patch on an instance based on the
/// patch baseline that was used to patch the instance.
class AwsSsmPatchComplianceDetails {
  /// Information about the status of a patch.
  final AwsSsmPatch? patch;

  AwsSsmPatchComplianceDetails({
    this.patch,
  });

  factory AwsSsmPatchComplianceDetails.fromJson(Map<String, dynamic> json) {
    return AwsSsmPatchComplianceDetails(
      patch: json['Patch'] != null
          ? AwsSsmPatch.fromJson(json['Patch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final patch = this.patch;
    return {
      if (patch != null) 'Patch': patch,
    };
  }
}

/// Details about a WAF WebACL.
class AwsWafWebAclDetails {
  /// The action to perform if none of the rules contained in the WebACL match.
  final String? defaultAction;

  /// A friendly name or description of the WebACL. You can't change the name of a
  /// WebACL after you create it.
  final String? name;

  /// An array that contains the action for each rule in a WebACL, the priority of
  /// the rule, and the ID of the rule.
  final List<AwsWafWebAclRule>? rules;

  /// A unique identifier for a WebACL.
  final String? webAclId;

  AwsWafWebAclDetails({
    this.defaultAction,
    this.name,
    this.rules,
    this.webAclId,
  });

  factory AwsWafWebAclDetails.fromJson(Map<String, dynamic> json) {
    return AwsWafWebAclDetails(
      defaultAction: json['DefaultAction'] as String?,
      name: json['Name'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => AwsWafWebAclRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      webAclId: json['WebAclId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAction = this.defaultAction;
    final name = this.name;
    final rules = this.rules;
    final webAclId = this.webAclId;
    return {
      if (defaultAction != null) 'DefaultAction': defaultAction,
      if (name != null) 'Name': name,
      if (rules != null) 'Rules': rules,
      if (webAclId != null) 'WebAclId': webAclId,
    };
  }
}

/// Details for a rule in a WAF WebACL.
class AwsWafWebAclRule {
  /// Specifies the action that CloudFront or AWS WAF takes when a web request
  /// matches the conditions in the rule.
  final WafAction? action;

  /// Rules to exclude from a rule group.
  final List<WafExcludedRule>? excludedRules;

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
  final WafOverrideAction? overrideAction;

  /// Specifies the order in which the rules in a WebACL are evaluated. Rules with
  /// a lower value for <code>Priority</code> are evaluated before rules with a
  /// higher value. The value must be a unique integer. If you add multiple rules
  /// to a WebACL, the values do not need to be consecutive.
  final int? priority;

  /// The identifier for a rule.
  final String? ruleId;

  /// The rule type.
  ///
  /// Valid values: <code>REGULAR</code> | <code>RATE_BASED</code> |
  /// <code>GROUP</code>
  ///
  /// The default is <code>REGULAR</code>.
  final String? type;

  AwsWafWebAclRule({
    this.action,
    this.excludedRules,
    this.overrideAction,
    this.priority,
    this.ruleId,
    this.type,
  });

  factory AwsWafWebAclRule.fromJson(Map<String, dynamic> json) {
    return AwsWafWebAclRule(
      action: json['Action'] != null
          ? WafAction.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      excludedRules: (json['ExcludedRules'] as List?)
          ?.whereNotNull()
          .map((e) => WafExcludedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      overrideAction: json['OverrideAction'] != null
          ? WafOverrideAction.fromJson(
              json['OverrideAction'] as Map<String, dynamic>)
          : null,
      priority: json['Priority'] as int?,
      ruleId: json['RuleId'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final excludedRules = this.excludedRules;
    final overrideAction = this.overrideAction;
    final priority = this.priority;
    final ruleId = this.ruleId;
    final type = this.type;
    return {
      if (action != null) 'Action': action,
      if (excludedRules != null) 'ExcludedRules': excludedRules,
      if (overrideAction != null) 'OverrideAction': overrideAction,
      if (priority != null) 'Priority': priority,
      if (ruleId != null) 'RuleId': ruleId,
      if (type != null) 'Type': type,
    };
  }
}

class BatchDisableStandardsResponse {
  /// The details of the standards subscriptions that were disabled.
  final List<StandardsSubscription>? standardsSubscriptions;

  BatchDisableStandardsResponse({
    this.standardsSubscriptions,
  });

  factory BatchDisableStandardsResponse.fromJson(Map<String, dynamic> json) {
    return BatchDisableStandardsResponse(
      standardsSubscriptions: (json['StandardsSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => StandardsSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final standardsSubscriptions = this.standardsSubscriptions;
    return {
      if (standardsSubscriptions != null)
        'StandardsSubscriptions': standardsSubscriptions,
    };
  }
}

class BatchEnableStandardsResponse {
  /// The details of the standards subscriptions that were enabled.
  final List<StandardsSubscription>? standardsSubscriptions;

  BatchEnableStandardsResponse({
    this.standardsSubscriptions,
  });

  factory BatchEnableStandardsResponse.fromJson(Map<String, dynamic> json) {
    return BatchEnableStandardsResponse(
      standardsSubscriptions: (json['StandardsSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => StandardsSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final standardsSubscriptions = this.standardsSubscriptions;
    return {
      if (standardsSubscriptions != null)
        'StandardsSubscriptions': standardsSubscriptions,
    };
  }
}

class BatchImportFindingsResponse {
  /// The number of findings that failed to import.
  final int failedCount;

  /// The number of findings that were successfully imported.
  final int successCount;

  /// The list of findings that failed to import.
  final List<ImportFindingsError>? failedFindings;

  BatchImportFindingsResponse({
    required this.failedCount,
    required this.successCount,
    this.failedFindings,
  });

  factory BatchImportFindingsResponse.fromJson(Map<String, dynamic> json) {
    return BatchImportFindingsResponse(
      failedCount: json['FailedCount'] as int,
      successCount: json['SuccessCount'] as int,
      failedFindings: (json['FailedFindings'] as List?)
          ?.whereNotNull()
          .map((e) => ImportFindingsError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedCount = this.failedCount;
    final successCount = this.successCount;
    final failedFindings = this.failedFindings;
    return {
      'FailedCount': failedCount,
      'SuccessCount': successCount,
      if (failedFindings != null) 'FailedFindings': failedFindings,
    };
  }
}

class BatchUpdateFindingsResponse {
  /// The list of findings that were updated successfully.
  final List<AwsSecurityFindingIdentifier> processedFindings;

  /// The list of findings that were not updated.
  final List<BatchUpdateFindingsUnprocessedFinding> unprocessedFindings;

  BatchUpdateFindingsResponse({
    required this.processedFindings,
    required this.unprocessedFindings,
  });

  factory BatchUpdateFindingsResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateFindingsResponse(
      processedFindings: (json['ProcessedFindings'] as List)
          .whereNotNull()
          .map((e) =>
              AwsSecurityFindingIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedFindings: (json['UnprocessedFindings'] as List)
          .whereNotNull()
          .map((e) => BatchUpdateFindingsUnprocessedFinding.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final processedFindings = this.processedFindings;
    final unprocessedFindings = this.unprocessedFindings;
    return {
      'ProcessedFindings': processedFindings,
      'UnprocessedFindings': unprocessedFindings,
    };
  }
}

/// A finding from a <code>BatchUpdateFindings</code> request that Security Hub
/// was unable to update.
class BatchUpdateFindingsUnprocessedFinding {
  /// The code associated with the error.
  final String errorCode;

  /// The message associated with the error.
  final String errorMessage;

  /// The identifier of the finding that was not updated.
  final AwsSecurityFindingIdentifier findingIdentifier;

  BatchUpdateFindingsUnprocessedFinding({
    required this.errorCode,
    required this.errorMessage,
    required this.findingIdentifier,
  });

  factory BatchUpdateFindingsUnprocessedFinding.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateFindingsUnprocessedFinding(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      findingIdentifier: AwsSecurityFindingIdentifier.fromJson(
          json['FindingIdentifier'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final findingIdentifier = this.findingIdentifier;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'FindingIdentifier': findingIdentifier,
    };
  }
}

/// An occurrence of sensitive data detected in a Microsoft Excel workbook,
/// comma-separated value (CSV) file, or tab-separated value (TSV) file.
class Cell {
  /// For a Microsoft Excel workbook, provides the location of the cell, as an
  /// absolute cell reference, that contains the data. For example, Sheet2!C5 for
  /// cell C5 on Sheet2.
  final String? cellReference;

  /// The column number of the column that contains the data. For a Microsoft
  /// Excel workbook, the column number corresponds to the alphabetical column
  /// identifiers. For example, a value of 1 for Column corresponds to the A
  /// column in the workbook.
  final int? column;

  /// The name of the column that contains the data.
  final String? columnName;

  /// The row number of the row that contains the data.
  final int? row;

  Cell({
    this.cellReference,
    this.column,
    this.columnName,
    this.row,
  });

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      cellReference: json['CellReference'] as String?,
      column: json['Column'] as int?,
      columnName: json['ColumnName'] as String?,
      row: json['Row'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cellReference = this.cellReference;
    final column = this.column;
    final columnName = this.columnName;
    final row = this.row;
    return {
      if (cellReference != null) 'CellReference': cellReference,
      if (column != null) 'Column': column,
      if (columnName != null) 'ColumnName': columnName,
      if (row != null) 'Row': row,
    };
  }
}

/// An IPv4 CIDR block association.
class CidrBlockAssociation {
  /// The association ID for the IPv4 CIDR block.
  final String? associationId;

  /// The IPv4 CIDR block.
  final String? cidrBlock;

  /// Information about the state of the IPv4 CIDR block.
  final String? cidrBlockState;

  CidrBlockAssociation({
    this.associationId,
    this.cidrBlock,
    this.cidrBlockState,
  });

  factory CidrBlockAssociation.fromJson(Map<String, dynamic> json) {
    return CidrBlockAssociation(
      associationId: json['AssociationId'] as String?,
      cidrBlock: json['CidrBlock'] as String?,
      cidrBlockState: json['CidrBlockState'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final cidrBlock = this.cidrBlock;
    final cidrBlockState = this.cidrBlockState;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (cidrBlockState != null) 'CidrBlockState': cidrBlockState,
    };
  }
}

/// Information about a city.
class City {
  /// The name of the city.
  final String? cityName;

  City({
    this.cityName,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['CityName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cityName = this.cityName;
    return {
      if (cityName != null) 'CityName': cityName,
    };
  }
}

/// Details about the sensitive data that was detected on the resource.
class ClassificationResult {
  /// Indicates whether there are additional occurrences of sensitive data that
  /// are not included in the finding. This occurs when the number of occurrences
  /// exceeds the maximum that can be included.
  final bool? additionalOccurrences;

  /// Provides details about sensitive data that was identified based on
  /// customer-defined configuration.
  final CustomDataIdentifiersResult? customDataIdentifiers;

  /// The type of content that the finding applies to.
  final String? mimeType;

  /// Provides details about sensitive data that was identified based on built-in
  /// configuration.
  final List<SensitiveDataResult>? sensitiveData;

  /// The total size in bytes of the affected data.
  final int? sizeClassified;

  /// The current status of the sensitive data detection.
  final ClassificationStatus? status;

  ClassificationResult({
    this.additionalOccurrences,
    this.customDataIdentifiers,
    this.mimeType,
    this.sensitiveData,
    this.sizeClassified,
    this.status,
  });

  factory ClassificationResult.fromJson(Map<String, dynamic> json) {
    return ClassificationResult(
      additionalOccurrences: json['AdditionalOccurrences'] as bool?,
      customDataIdentifiers: json['CustomDataIdentifiers'] != null
          ? CustomDataIdentifiersResult.fromJson(
              json['CustomDataIdentifiers'] as Map<String, dynamic>)
          : null,
      mimeType: json['MimeType'] as String?,
      sensitiveData: (json['SensitiveData'] as List?)
          ?.whereNotNull()
          .map((e) => SensitiveDataResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizeClassified: json['SizeClassified'] as int?,
      status: json['Status'] != null
          ? ClassificationStatus.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalOccurrences = this.additionalOccurrences;
    final customDataIdentifiers = this.customDataIdentifiers;
    final mimeType = this.mimeType;
    final sensitiveData = this.sensitiveData;
    final sizeClassified = this.sizeClassified;
    final status = this.status;
    return {
      if (additionalOccurrences != null)
        'AdditionalOccurrences': additionalOccurrences,
      if (customDataIdentifiers != null)
        'CustomDataIdentifiers': customDataIdentifiers,
      if (mimeType != null) 'MimeType': mimeType,
      if (sensitiveData != null) 'SensitiveData': sensitiveData,
      if (sizeClassified != null) 'SizeClassified': sizeClassified,
      if (status != null) 'Status': status,
    };
  }
}

/// Provides details about the current status of the sensitive data detection.
class ClassificationStatus {
  /// The code that represents the status of the sensitive data detection.
  final String? code;

  /// A longer description of the current status of the sensitive data detection.
  final String? reason;

  ClassificationStatus({
    this.code,
    this.reason,
  });

  factory ClassificationStatus.fromJson(Map<String, dynamic> json) {
    return ClassificationStatus(
      code: json['Code'] as String?,
      reason: json['Reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reason = this.reason;
    return {
      if (code != null) 'Code': code,
      if (reason != null) 'Reason': reason,
    };
  }
}

/// Contains finding details that are specific to control-based findings. Only
/// returned for findings generated from controls.
class Compliance {
  /// For a control, the industry or regulatory framework requirements that are
  /// related to the control. The check for that control is aligned with these
  /// requirements.
  final List<String>? relatedRequirements;

  /// The result of a standards check.
  ///
  /// The valid values for <code>Status</code> are as follows.
  ///
  /// <ul>
  /// <li>
  /// <ul>
  /// <li>
  /// <code>PASSED</code> - Standards check passed for all evaluated resources.
  /// </li>
  /// <li>
  /// <code>WARNING</code> - Some information is missing or this check is not
  /// supported for your configuration.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Standards check failed for at least one evaluated
  /// resource.
  /// </li>
  /// <li>
  /// <code>NOT_AVAILABLE</code> - Check could not be performed due to a service
  /// outage, API error, or because the result of the AWS Config evaluation was
  /// <code>NOT_APPLICABLE</code>. If the AWS Config evaluation result was
  /// <code>NOT_APPLICABLE</code>, then after 3 days, Security Hub automatically
  /// archives the finding.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ComplianceStatus? status;

  /// For findings generated from controls, a list of reasons behind the value of
  /// <code>Status</code>. For the list of status reason codes and their meanings,
  /// see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff">Standards-related
  /// information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>.
  final List<StatusReason>? statusReasons;

  Compliance({
    this.relatedRequirements,
    this.status,
    this.statusReasons,
  });

  factory Compliance.fromJson(Map<String, dynamic> json) {
    return Compliance(
      relatedRequirements: (json['RelatedRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toComplianceStatus(),
      statusReasons: (json['StatusReasons'] as List?)
          ?.whereNotNull()
          .map((e) => StatusReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final relatedRequirements = this.relatedRequirements;
    final status = this.status;
    final statusReasons = this.statusReasons;
    return {
      if (relatedRequirements != null)
        'RelatedRequirements': relatedRequirements,
      if (status != null) 'Status': status.toValue(),
      if (statusReasons != null) 'StatusReasons': statusReasons,
    };
  }
}

enum ComplianceStatus {
  passed,
  warning,
  failed,
  notAvailable,
}

extension on ComplianceStatus {
  String toValue() {
    switch (this) {
      case ComplianceStatus.passed:
        return 'PASSED';
      case ComplianceStatus.warning:
        return 'WARNING';
      case ComplianceStatus.failed:
        return 'FAILED';
      case ComplianceStatus.notAvailable:
        return 'NOT_AVAILABLE';
    }
  }
}

extension on String {
  ComplianceStatus toComplianceStatus() {
    switch (this) {
      case 'PASSED':
        return ComplianceStatus.passed;
      case 'WARNING':
        return ComplianceStatus.warning;
      case 'FAILED':
        return ComplianceStatus.failed;
      case 'NOT_AVAILABLE':
        return ComplianceStatus.notAvailable;
    }
    throw Exception('$this is not known in enum ComplianceStatus');
  }
}

/// Container details related to a finding.
class ContainerDetails {
  /// The identifier of the image related to a finding.
  final String? imageId;

  /// The name of the image related to a finding.
  final String? imageName;

  /// Indicates when the container started.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? launchedAt;

  /// The name of the container related to a finding.
  final String? name;

  ContainerDetails({
    this.imageId,
    this.imageName,
    this.launchedAt,
    this.name,
  });

  factory ContainerDetails.fromJson(Map<String, dynamic> json) {
    return ContainerDetails(
      imageId: json['ImageId'] as String?,
      imageName: json['ImageName'] as String?,
      launchedAt: json['LaunchedAt'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imageName = this.imageName;
    final launchedAt = this.launchedAt;
    final name = this.name;
    return {
      if (imageId != null) 'ImageId': imageId,
      if (imageName != null) 'ImageName': imageName,
      if (launchedAt != null) 'LaunchedAt': launchedAt,
      if (name != null) 'Name': name,
    };
  }
}

enum ControlStatus {
  enabled,
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
  }
}

extension on String {
  ControlStatus toControlStatus() {
    switch (this) {
      case 'ENABLED':
        return ControlStatus.enabled;
      case 'DISABLED':
        return ControlStatus.disabled;
    }
    throw Exception('$this is not known in enum ControlStatus');
  }
}

/// Information about a country.
class Country {
  /// The 2-letter ISO 3166 country code for the country.
  final String? countryCode;

  /// The name of the country.
  final String? countryName;

  Country({
    this.countryCode,
    this.countryName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final countryName = this.countryName;
    return {
      if (countryCode != null) 'CountryCode': countryCode,
      if (countryName != null) 'CountryName': countryName,
    };
  }
}

class CreateActionTargetResponse {
  /// The ARN for the custom action target.
  final String actionTargetArn;

  CreateActionTargetResponse({
    required this.actionTargetArn,
  });

  factory CreateActionTargetResponse.fromJson(Map<String, dynamic> json) {
    return CreateActionTargetResponse(
      actionTargetArn: json['ActionTargetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTargetArn = this.actionTargetArn;
    return {
      'ActionTargetArn': actionTargetArn,
    };
  }
}

class CreateInsightResponse {
  /// The ARN of the insight created.
  final String insightArn;

  CreateInsightResponse({
    required this.insightArn,
  });

  factory CreateInsightResponse.fromJson(Map<String, dynamic> json) {
    return CreateInsightResponse(
      insightArn: json['InsightArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final insightArn = this.insightArn;
    return {
      'InsightArn': insightArn,
    };
  }
}

class CreateMembersResponse {
  /// The list of AWS accounts that were not processed. For each account, the list
  /// includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  CreateMembersResponse({
    this.unprocessedAccounts,
  });

  factory CreateMembersResponse.fromJson(Map<String, dynamic> json) {
    return CreateMembersResponse(
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

/// The list of detected instances of sensitive data.
class CustomDataIdentifiersDetections {
  /// The ARN of the custom identifier that was used to detect the sensitive data.
  final String? arn;

  /// The total number of occurrences of sensitive data that were detected.
  final int? count;

  /// he name of the custom identifier that detected the sensitive data.
  final String? name;

  /// Details about the sensitive data that was detected.
  final Occurrences? occurrences;

  CustomDataIdentifiersDetections({
    this.arn,
    this.count,
    this.name,
    this.occurrences,
  });

  factory CustomDataIdentifiersDetections.fromJson(Map<String, dynamic> json) {
    return CustomDataIdentifiersDetections(
      arn: json['Arn'] as String?,
      count: json['Count'] as int?,
      name: json['Name'] as String?,
      occurrences: json['Occurrences'] != null
          ? Occurrences.fromJson(json['Occurrences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final name = this.name;
    final occurrences = this.occurrences;
    return {
      if (arn != null) 'Arn': arn,
      if (count != null) 'Count': count,
      if (name != null) 'Name': name,
      if (occurrences != null) 'Occurrences': occurrences,
    };
  }
}

/// Contains an instance of sensitive data that was detected by a
/// customer-defined identifier.
class CustomDataIdentifiersResult {
  /// The list of detected instances of sensitive data.
  final List<CustomDataIdentifiersDetections>? detections;

  /// The total number of occurrences of sensitive data.
  final int? totalCount;

  CustomDataIdentifiersResult({
    this.detections,
    this.totalCount,
  });

  factory CustomDataIdentifiersResult.fromJson(Map<String, dynamic> json) {
    return CustomDataIdentifiersResult(
      detections: (json['Detections'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDataIdentifiersDetections.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final detections = this.detections;
    final totalCount = this.totalCount;
    return {
      if (detections != null) 'Detections': detections,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// CVSS scores from the advisory related to the vulnerability.
class Cvss {
  /// The base CVSS score.
  final double? baseScore;

  /// The base scoring vector for the CVSS score.
  final String? baseVector;

  /// The version of CVSS for the CVSS score.
  final String? version;

  Cvss({
    this.baseScore,
    this.baseVector,
    this.version,
  });

  factory Cvss.fromJson(Map<String, dynamic> json) {
    return Cvss(
      baseScore: json['BaseScore'] as double?,
      baseVector: json['BaseVector'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final baseVector = this.baseVector;
    final version = this.version;
    return {
      if (baseScore != null) 'BaseScore': baseScore,
      if (baseVector != null) 'BaseVector': baseVector,
      if (version != null) 'Version': version,
    };
  }
}

/// Provides details about sensitive data that was detected on a resource.
class DataClassificationDetails {
  /// The path to the folder or file that contains the sensitive data.
  final String? detailedResultsLocation;

  /// The details about the sensitive data that was detected on the resource.
  final ClassificationResult? result;

  DataClassificationDetails({
    this.detailedResultsLocation,
    this.result,
  });

  factory DataClassificationDetails.fromJson(Map<String, dynamic> json) {
    return DataClassificationDetails(
      detailedResultsLocation: json['DetailedResultsLocation'] as String?,
      result: json['Result'] != null
          ? ClassificationResult.fromJson(
              json['Result'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detailedResultsLocation = this.detailedResultsLocation;
    final result = this.result;
    return {
      if (detailedResultsLocation != null)
        'DetailedResultsLocation': detailedResultsLocation,
      if (result != null) 'Result': result,
    };
  }
}

/// A date filter for querying findings.
class DateFilter {
  /// A date range for the date filter.
  final DateRange? dateRange;

  /// An end date for the date filter.
  final String? end;

  /// A start date for the date filter.
  final String? start;

  DateFilter({
    this.dateRange,
    this.end,
    this.start,
  });

  factory DateFilter.fromJson(Map<String, dynamic> json) {
    return DateFilter(
      dateRange: json['DateRange'] != null
          ? DateRange.fromJson(json['DateRange'] as Map<String, dynamic>)
          : null,
      end: json['End'] as String?,
      start: json['Start'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    final end = this.end;
    final start = this.start;
    return {
      if (dateRange != null) 'DateRange': dateRange,
      if (end != null) 'End': end,
      if (start != null) 'Start': start,
    };
  }
}

/// A date range for the date filter.
class DateRange {
  /// A date range unit for the date filter.
  final DateRangeUnit? unit;

  /// A date range value for the date filter.
  final int? value;

  DateRange({
    this.unit,
    this.value,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      unit: (json['Unit'] as String?)?.toDateRangeUnit(),
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      if (unit != null) 'Unit': unit.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum DateRangeUnit {
  days,
}

extension on DateRangeUnit {
  String toValue() {
    switch (this) {
      case DateRangeUnit.days:
        return 'DAYS';
    }
  }
}

extension on String {
  DateRangeUnit toDateRangeUnit() {
    switch (this) {
      case 'DAYS':
        return DateRangeUnit.days;
    }
    throw Exception('$this is not known in enum DateRangeUnit');
  }
}

class DeclineInvitationsResponse {
  /// The list of AWS accounts that were not processed. For each account, the list
  /// includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  DeclineInvitationsResponse({
    this.unprocessedAccounts,
  });

  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeclineInvitationsResponse(
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

class DeleteActionTargetResponse {
  /// The ARN of the custom action target that was deleted.
  final String actionTargetArn;

  DeleteActionTargetResponse({
    required this.actionTargetArn,
  });

  factory DeleteActionTargetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteActionTargetResponse(
      actionTargetArn: json['ActionTargetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTargetArn = this.actionTargetArn;
    return {
      'ActionTargetArn': actionTargetArn,
    };
  }
}

class DeleteInsightResponse {
  /// The ARN of the insight that was deleted.
  final String insightArn;

  DeleteInsightResponse({
    required this.insightArn,
  });

  factory DeleteInsightResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInsightResponse(
      insightArn: json['InsightArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final insightArn = this.insightArn;
    return {
      'InsightArn': insightArn,
    };
  }
}

class DeleteInvitationsResponse {
  /// The list of AWS accounts for which the invitations were not deleted. For
  /// each account, the list includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  DeleteInvitationsResponse({
    this.unprocessedAccounts,
  });

  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInvitationsResponse(
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

class DeleteMembersResponse {
  /// The list of AWS accounts that were not deleted. For each account, the list
  /// includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  DeleteMembersResponse({
    this.unprocessedAccounts,
  });

  factory DeleteMembersResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMembersResponse(
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

class DescribeActionTargetsResponse {
  /// A list of <code>ActionTarget</code> objects. Each object includes the
  /// <code>ActionTargetArn</code>, <code>Description</code>, and
  /// <code>Name</code> of a custom action target available in Security Hub.
  final List<ActionTarget> actionTargets;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  DescribeActionTargetsResponse({
    required this.actionTargets,
    this.nextToken,
  });

  factory DescribeActionTargetsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeActionTargetsResponse(
      actionTargets: (json['ActionTargets'] as List)
          .whereNotNull()
          .map((e) => ActionTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTargets = this.actionTargets;
    final nextToken = this.nextToken;
    return {
      'ActionTargets': actionTargets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeHubResponse {
  /// Whether to automatically enable new controls when they are added to
  /// standards that are enabled.
  ///
  /// If set to <code>true</code>, then new controls for enabled standards are
  /// enabled automatically. If set to <code>false</code>, then new controls are
  /// not enabled.
  final bool? autoEnableControls;

  /// The ARN of the Hub resource that was retrieved.
  final String? hubArn;

  /// The date and time when Security Hub was enabled in the account.
  final String? subscribedAt;

  DescribeHubResponse({
    this.autoEnableControls,
    this.hubArn,
    this.subscribedAt,
  });

  factory DescribeHubResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHubResponse(
      autoEnableControls: json['AutoEnableControls'] as bool?,
      hubArn: json['HubArn'] as String?,
      subscribedAt: json['SubscribedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnableControls = this.autoEnableControls;
    final hubArn = this.hubArn;
    final subscribedAt = this.subscribedAt;
    return {
      if (autoEnableControls != null) 'AutoEnableControls': autoEnableControls,
      if (hubArn != null) 'HubArn': hubArn,
      if (subscribedAt != null) 'SubscribedAt': subscribedAt,
    };
  }
}

class DescribeOrganizationConfigurationResponse {
  /// Whether to automatically enable Security Hub for new accounts in the
  /// organization.
  ///
  /// If set to <code>true</code>, then Security Hub is enabled for new accounts.
  /// If set to false, then new accounts are not added automatically.
  final bool? autoEnable;

  /// Whether the maximum number of allowed member accounts are already associated
  /// with the Security Hub administrator account.
  final bool? memberAccountLimitReached;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
    this.memberAccountLimitReached,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      autoEnable: json['AutoEnable'] as bool?,
      memberAccountLimitReached: json['MemberAccountLimitReached'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final memberAccountLimitReached = this.memberAccountLimitReached;
    return {
      if (autoEnable != null) 'AutoEnable': autoEnable,
      if (memberAccountLimitReached != null)
        'MemberAccountLimitReached': memberAccountLimitReached,
    };
  }
}

class DescribeProductsResponse {
  /// A list of products, including details for each product.
  final List<Product> products;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  DescribeProductsResponse({
    required this.products,
    this.nextToken,
  });

  factory DescribeProductsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProductsResponse(
      products: (json['Products'] as List)
          .whereNotNull()
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final products = this.products;
    final nextToken = this.nextToken;
    return {
      'Products': products,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeStandardsControlsResponse {
  /// A list of security standards controls.
  final List<StandardsControl>? controls;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  DescribeStandardsControlsResponse({
    this.controls,
    this.nextToken,
  });

  factory DescribeStandardsControlsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeStandardsControlsResponse(
      controls: (json['Controls'] as List?)
          ?.whereNotNull()
          .map((e) => StandardsControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controls = this.controls;
    final nextToken = this.nextToken;
    return {
      if (controls != null) 'Controls': controls,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeStandardsResponse {
  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  /// A list of available standards.
  final List<Standard>? standards;

  DescribeStandardsResponse({
    this.nextToken,
    this.standards,
  });

  factory DescribeStandardsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeStandardsResponse(
      nextToken: json['NextToken'] as String?,
      standards: (json['Standards'] as List?)
          ?.whereNotNull()
          .map((e) => Standard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final standards = this.standards;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (standards != null) 'Standards': standards,
    };
  }
}

class DisableImportFindingsForProductResponse {
  DisableImportFindingsForProductResponse();

  factory DisableImportFindingsForProductResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableImportFindingsForProductResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();

  factory DisableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableSecurityHubResponse {
  DisableSecurityHubResponse();

  factory DisableSecurityHubResponse.fromJson(Map<String, dynamic> _) {
    return DisableSecurityHubResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFromAdministratorAccountResponse {
  DisassociateFromAdministratorAccountResponse();

  factory DisassociateFromAdministratorAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromAdministratorAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();

  factory DisassociateFromMasterAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromMasterAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMembersResponse {
  DisassociateMembersResponse();

  factory DisassociateMembersResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMembersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provided if <code>ActionType</code> is <code>DNS_REQUEST</code>. It provides
/// details about the DNS request that was detected.
class DnsRequestAction {
  /// Indicates whether the DNS request was blocked.
  final bool? blocked;

  /// The DNS domain that is associated with the DNS request.
  final String? domain;

  /// The protocol that was used for the DNS request.
  final String? protocol;

  DnsRequestAction({
    this.blocked,
    this.domain,
    this.protocol,
  });

  factory DnsRequestAction.fromJson(Map<String, dynamic> json) {
    return DnsRequestAction(
      blocked: json['Blocked'] as bool?,
      domain: json['Domain'] as String?,
      protocol: json['Protocol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final domain = this.domain;
    final protocol = this.protocol;
    return {
      if (blocked != null) 'Blocked': blocked,
      if (domain != null) 'Domain': domain,
      if (protocol != null) 'Protocol': protocol,
    };
  }
}

class EnableImportFindingsForProductResponse {
  /// The ARN of your subscription to the product to enable integrations for.
  final String? productSubscriptionArn;

  EnableImportFindingsForProductResponse({
    this.productSubscriptionArn,
  });

  factory EnableImportFindingsForProductResponse.fromJson(
      Map<String, dynamic> json) {
    return EnableImportFindingsForProductResponse(
      productSubscriptionArn: json['ProductSubscriptionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final productSubscriptionArn = this.productSubscriptionArn;
    return {
      if (productSubscriptionArn != null)
        'ProductSubscriptionArn': productSubscriptionArn,
    };
  }
}

class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();

  factory EnableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EnableSecurityHubResponse {
  EnableSecurityHubResponse();

  factory EnableSecurityHubResponse.fromJson(Map<String, dynamic> _) {
    return EnableSecurityHubResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// In a <code>BatchImportFindings</code> request, finding providers use
/// <code>FindingProviderFields</code> to provide and update values for
/// confidence, criticality, related findings, severity, and types.
class FindingProviderFields {
  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended to
  /// identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  final int? confidence;

  /// The level of importance assigned to the resources associated with the
  /// finding.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  final int? criticality;

  /// A list of findings that are related to the current finding.
  final List<RelatedFinding>? relatedFindings;

  /// The severity of a finding.
  final FindingProviderSeverity? severity;

  /// One or more finding types in the format of
  /// <code>namespace/category/classifier</code> that classify a finding.
  ///
  /// Valid namespace values are: Software and Configuration Checks | TTPs |
  /// Effects | Unusual Behaviors | Sensitive Data Identifications
  final List<String>? types;

  FindingProviderFields({
    this.confidence,
    this.criticality,
    this.relatedFindings,
    this.severity,
    this.types,
  });

  factory FindingProviderFields.fromJson(Map<String, dynamic> json) {
    return FindingProviderFields(
      confidence: json['Confidence'] as int?,
      criticality: json['Criticality'] as int?,
      relatedFindings: (json['RelatedFindings'] as List?)
          ?.whereNotNull()
          .map((e) => RelatedFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: json['Severity'] != null
          ? FindingProviderSeverity.fromJson(
              json['Severity'] as Map<String, dynamic>)
          : null,
      types: (json['Types'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final criticality = this.criticality;
    final relatedFindings = this.relatedFindings;
    final severity = this.severity;
    final types = this.types;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (criticality != null) 'Criticality': criticality,
      if (relatedFindings != null) 'RelatedFindings': relatedFindings,
      if (severity != null) 'Severity': severity,
      if (types != null) 'Types': types,
    };
  }
}

/// The severity assigned to the finding by the finding provider.
class FindingProviderSeverity {
  /// The severity label assigned to the finding by the finding provider.
  final SeverityLabel? label;

  /// The finding provider's original value for the severity.
  final String? original;

  FindingProviderSeverity({
    this.label,
    this.original,
  });

  factory FindingProviderSeverity.fromJson(Map<String, dynamic> json) {
    return FindingProviderSeverity(
      label: (json['Label'] as String?)?.toSeverityLabel(),
      original: json['Original'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final original = this.original;
    return {
      if (label != null) 'Label': label.toValue(),
      if (original != null) 'Original': original,
    };
  }
}

/// Provides the latitude and longitude coordinates of a location.
class GeoLocation {
  /// The latitude of the location.
  final double? lat;

  /// The longitude of the location.
  final double? lon;

  GeoLocation({
    this.lat,
    this.lon,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      lat: json['Lat'] as double?,
      lon: json['Lon'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final lat = this.lat;
    final lon = this.lon;
    return {
      if (lat != null) 'Lat': lat,
      if (lon != null) 'Lon': lon,
    };
  }
}

class GetAdministratorAccountResponse {
  final Invitation? administrator;

  GetAdministratorAccountResponse({
    this.administrator,
  });

  factory GetAdministratorAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAdministratorAccountResponse(
      administrator: json['Administrator'] != null
          ? Invitation.fromJson(json['Administrator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final administrator = this.administrator;
    return {
      if (administrator != null) 'Administrator': administrator,
    };
  }
}

class GetEnabledStandardsResponse {
  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  /// The list of <code>StandardsSubscriptions</code> objects that include
  /// information about the enabled standards.
  final List<StandardsSubscription>? standardsSubscriptions;

  GetEnabledStandardsResponse({
    this.nextToken,
    this.standardsSubscriptions,
  });

  factory GetEnabledStandardsResponse.fromJson(Map<String, dynamic> json) {
    return GetEnabledStandardsResponse(
      nextToken: json['NextToken'] as String?,
      standardsSubscriptions: (json['StandardsSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => StandardsSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final standardsSubscriptions = this.standardsSubscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (standardsSubscriptions != null)
        'StandardsSubscriptions': standardsSubscriptions,
    };
  }
}

class GetFindingsResponse {
  /// The findings that matched the filters specified in the request.
  final List<AwsSecurityFinding> findings;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  GetFindingsResponse({
    required this.findings,
    this.nextToken,
  });

  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsResponse(
      findings: (json['Findings'] as List)
          .whereNotNull()
          .map((e) => AwsSecurityFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      'Findings': findings,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetInsightResultsResponse {
  /// The insight results returned by the operation.
  final InsightResults insightResults;

  GetInsightResultsResponse({
    required this.insightResults,
  });

  factory GetInsightResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightResultsResponse(
      insightResults: InsightResults.fromJson(
          json['InsightResults'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final insightResults = this.insightResults;
    return {
      'InsightResults': insightResults,
    };
  }
}

class GetInsightsResponse {
  /// The insights returned by the operation.
  final List<Insight> insights;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  GetInsightsResponse({
    required this.insights,
    this.nextToken,
  });

  factory GetInsightsResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightsResponse(
      insights: (json['Insights'] as List)
          .whereNotNull()
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insights = this.insights;
    final nextToken = this.nextToken;
    return {
      'Insights': insights,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetInvitationsCountResponse {
  /// The number of all membership invitations sent to this Security Hub member
  /// account, not including the currently accepted invitation.
  final int? invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });

  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) {
    return GetInvitationsCountResponse(
      invitationsCount: json['InvitationsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final invitationsCount = this.invitationsCount;
    return {
      if (invitationsCount != null) 'InvitationsCount': invitationsCount,
    };
  }
}

class GetMasterAccountResponse {
  /// A list of details about the Security Hub administrator account for the
  /// current member account.
  final Invitation? master;

  GetMasterAccountResponse({
    this.master,
  });

  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetMasterAccountResponse(
      master: json['Master'] != null
          ? Invitation.fromJson(json['Master'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final master = this.master;
    return {
      if (master != null) 'Master': master,
    };
  }
}

class GetMembersResponse {
  /// The list of details about the Security Hub member accounts.
  final List<Member>? members;

  /// The list of AWS accounts that could not be processed. For each account, the
  /// list includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  GetMembersResponse({
    this.members,
    this.unprocessedAccounts,
  });

  factory GetMembersResponse.fromJson(Map<String, dynamic> json) {
    return GetMembersResponse(
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (members != null) 'Members': members,
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

/// An Internet Control Message Protocol (ICMP) type and code.
class IcmpTypeCode {
  /// The ICMP code for which to deny or allow access. To deny or allow all codes,
  /// use the value -1.
  final int? code;

  /// The ICMP type for which to deny or allow access. To deny or allow all types,
  /// use the value -1.
  final int? type;

  IcmpTypeCode({
    this.code,
    this.type,
  });

  factory IcmpTypeCode.fromJson(Map<String, dynamic> json) {
    return IcmpTypeCode(
      code: json['Code'] as int?,
      type: json['Type'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final type = this.type;
    return {
      if (code != null) 'Code': code,
      if (type != null) 'Type': type,
    };
  }
}

/// The list of the findings that cannot be imported. For each finding, the list
/// provides the error.
class ImportFindingsError {
  /// The code of the error returned by the <code>BatchImportFindings</code>
  /// operation.
  final String errorCode;

  /// The message of the error returned by the <code>BatchImportFindings</code>
  /// operation.
  final String errorMessage;

  /// The identifier of the finding that could not be updated.
  final String id;

  ImportFindingsError({
    required this.errorCode,
    required this.errorMessage,
    required this.id,
  });

  factory ImportFindingsError.fromJson(Map<String, dynamic> json) {
    return ImportFindingsError(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'Id': id,
    };
  }
}

/// Contains information about a Security Hub insight.
class Insight {
  /// One or more attributes used to filter the findings included in the insight.
  /// The insight only includes findings that match the criteria defined in the
  /// filters.
  final AwsSecurityFindingFilters filters;

  /// The grouping attribute for the insight's findings. Indicates how to group
  /// the matching findings, and identifies the type of item that the insight
  /// applies to. For example, if an insight is grouped by resource identifier,
  /// then the insight produces a list of resource identifiers.
  final String groupByAttribute;

  /// The ARN of a Security Hub insight.
  final String insightArn;

  /// The name of a Security Hub insight.
  final String name;

  Insight({
    required this.filters,
    required this.groupByAttribute,
    required this.insightArn,
    required this.name,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      filters: AwsSecurityFindingFilters.fromJson(
          json['Filters'] as Map<String, dynamic>),
      groupByAttribute: json['GroupByAttribute'] as String,
      insightArn: json['InsightArn'] as String,
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final groupByAttribute = this.groupByAttribute;
    final insightArn = this.insightArn;
    final name = this.name;
    return {
      'Filters': filters,
      'GroupByAttribute': groupByAttribute,
      'InsightArn': insightArn,
      'Name': name,
    };
  }
}

/// The insight result values returned by the <code>GetInsightResults</code>
/// operation.
class InsightResultValue {
  /// The number of findings returned for each <code>GroupByAttributeValue</code>.
  final int count;

  /// The value of the attribute that the findings are grouped by for the insight
  /// whose results are returned by the <code>GetInsightResults</code> operation.
  final String groupByAttributeValue;

  InsightResultValue({
    required this.count,
    required this.groupByAttributeValue,
  });

  factory InsightResultValue.fromJson(Map<String, dynamic> json) {
    return InsightResultValue(
      count: json['Count'] as int,
      groupByAttributeValue: json['GroupByAttributeValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final groupByAttributeValue = this.groupByAttributeValue;
    return {
      'Count': count,
      'GroupByAttributeValue': groupByAttributeValue,
    };
  }
}

/// The insight results returned by the <code>GetInsightResults</code>
/// operation.
class InsightResults {
  /// The attribute that the findings are grouped by for the insight whose results
  /// are returned by the <code>GetInsightResults</code> operation.
  final String groupByAttribute;

  /// The ARN of the insight whose results are returned by the
  /// <code>GetInsightResults</code> operation.
  final String insightArn;

  /// The list of insight result values returned by the
  /// <code>GetInsightResults</code> operation.
  final List<InsightResultValue> resultValues;

  InsightResults({
    required this.groupByAttribute,
    required this.insightArn,
    required this.resultValues,
  });

  factory InsightResults.fromJson(Map<String, dynamic> json) {
    return InsightResults(
      groupByAttribute: json['GroupByAttribute'] as String,
      insightArn: json['InsightArn'] as String,
      resultValues: (json['ResultValues'] as List)
          .whereNotNull()
          .map((e) => InsightResultValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupByAttribute = this.groupByAttribute;
    final insightArn = this.insightArn;
    final resultValues = this.resultValues;
    return {
      'GroupByAttribute': groupByAttribute,
      'InsightArn': insightArn,
      'ResultValues': resultValues,
    };
  }
}

enum IntegrationType {
  sendFindingsToSecurityHub,
  receiveFindingsFromSecurityHub,
  updateFindingsInSecurityHub,
}

extension on IntegrationType {
  String toValue() {
    switch (this) {
      case IntegrationType.sendFindingsToSecurityHub:
        return 'SEND_FINDINGS_TO_SECURITY_HUB';
      case IntegrationType.receiveFindingsFromSecurityHub:
        return 'RECEIVE_FINDINGS_FROM_SECURITY_HUB';
      case IntegrationType.updateFindingsInSecurityHub:
        return 'UPDATE_FINDINGS_IN_SECURITY_HUB';
    }
  }
}

extension on String {
  IntegrationType toIntegrationType() {
    switch (this) {
      case 'SEND_FINDINGS_TO_SECURITY_HUB':
        return IntegrationType.sendFindingsToSecurityHub;
      case 'RECEIVE_FINDINGS_FROM_SECURITY_HUB':
        return IntegrationType.receiveFindingsFromSecurityHub;
      case 'UPDATE_FINDINGS_IN_SECURITY_HUB':
        return IntegrationType.updateFindingsInSecurityHub;
    }
    throw Exception('$this is not known in enum IntegrationType');
  }
}

/// Details about an invitation.
class Invitation {
  /// The account ID of the Security Hub administrator account that the invitation
  /// was sent from.
  final String? accountId;

  /// The ID of the invitation sent to the member account.
  final String? invitationId;

  /// The timestamp of when the invitation was sent.
  final DateTime? invitedAt;

  /// The current status of the association between the member and administrator
  /// accounts.
  final String? memberStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.memberStatus,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      accountId: json['AccountId'] as String?,
      invitationId: json['InvitationId'] as String?,
      invitedAt: timeStampFromJson(json['InvitedAt']),
      memberStatus: json['MemberStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final invitationId = this.invitationId;
    final invitedAt = this.invitedAt;
    final memberStatus = this.memberStatus;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (invitationId != null) 'InvitationId': invitationId,
      if (invitedAt != null) 'InvitedAt': iso8601ToJson(invitedAt),
      if (memberStatus != null) 'MemberStatus': memberStatus,
    };
  }
}

class InviteMembersResponse {
  /// The list of AWS accounts that could not be processed. For each account, the
  /// list includes the account ID and the email address.
  final List<Result>? unprocessedAccounts;

  InviteMembersResponse({
    this.unprocessedAccounts,
  });

  factory InviteMembersResponse.fromJson(Map<String, dynamic> json) {
    return InviteMembersResponse(
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'UnprocessedAccounts': unprocessedAccounts,
    };
  }
}

/// The IP filter for querying findings.
class IpFilter {
  /// A finding's CIDR value.
  final String? cidr;

  IpFilter({
    this.cidr,
  });

  factory IpFilter.fromJson(Map<String, dynamic> json) {
    return IpFilter(
      cidr: json['Cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      if (cidr != null) 'Cidr': cidr,
    };
  }
}

/// Provides information about an internet provider.
class IpOrganizationDetails {
  /// The Autonomous System Number (ASN) of the internet provider
  final int? asn;

  /// The name of the organization that registered the ASN.
  final String? asnOrg;

  /// The ISP information for the internet provider.
  final String? isp;

  /// The name of the internet provider.
  final String? org;

  IpOrganizationDetails({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });

  factory IpOrganizationDetails.fromJson(Map<String, dynamic> json) {
    return IpOrganizationDetails(
      asn: json['Asn'] as int?,
      asnOrg: json['AsnOrg'] as String?,
      isp: json['Isp'] as String?,
      org: json['Org'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final asnOrg = this.asnOrg;
    final isp = this.isp;
    final org = this.org;
    return {
      if (asn != null) 'Asn': asn,
      if (asnOrg != null) 'AsnOrg': asnOrg,
      if (isp != null) 'Isp': isp,
      if (org != null) 'Org': org,
    };
  }
}

/// An IPV6 CIDR block association.
class Ipv6CidrBlockAssociation {
  /// The association ID for the IPv6 CIDR block.
  final String? associationId;

  /// Information about the state of the CIDR block.
  final String? cidrBlockState;

  /// The IPv6 CIDR block.
  final String? ipv6CidrBlock;

  Ipv6CidrBlockAssociation({
    this.associationId,
    this.cidrBlockState,
    this.ipv6CidrBlock,
  });

  factory Ipv6CidrBlockAssociation.fromJson(Map<String, dynamic> json) {
    return Ipv6CidrBlockAssociation(
      associationId: json['AssociationId'] as String?,
      cidrBlockState: json['CidrBlockState'] as String?,
      ipv6CidrBlock: json['Ipv6CidrBlock'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final cidrBlockState = this.cidrBlockState;
    final ipv6CidrBlock = this.ipv6CidrBlock;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (cidrBlockState != null) 'CidrBlockState': cidrBlockState,
      if (ipv6CidrBlock != null) 'Ipv6CidrBlock': ipv6CidrBlock,
    };
  }
}

/// A keyword filter for querying findings.
class KeywordFilter {
  /// A value for the keyword.
  final String? value;

  KeywordFilter({
    this.value,
  });

  factory KeywordFilter.fromJson(Map<String, dynamic> json) {
    return KeywordFilter(
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

class ListEnabledProductsForImportResponse {
  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  /// The list of ARNs for the resources that represent your subscriptions to
  /// products.
  final List<String>? productSubscriptions;

  ListEnabledProductsForImportResponse({
    this.nextToken,
    this.productSubscriptions,
  });

  factory ListEnabledProductsForImportResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEnabledProductsForImportResponse(
      nextToken: json['NextToken'] as String?,
      productSubscriptions: (json['ProductSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final productSubscriptions = this.productSubscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (productSubscriptions != null)
        'ProductSubscriptions': productSubscriptions,
    };
  }
}

class ListInvitationsResponse {
  /// The details of the invitations returned by the operation.
  final List<Invitation>? invitations;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });

  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvitationsResponse(
      invitations: (json['Invitations'] as List?)
          ?.whereNotNull()
          .map((e) => Invitation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invitations = this.invitations;
    final nextToken = this.nextToken;
    return {
      if (invitations != null) 'Invitations': invitations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMembersResponse {
  /// Member details returned by the operation.
  final List<Member>? members;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersResponse(
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'Members': members,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOrganizationAdminAccountsResponse {
  /// The list of Security Hub administrator accounts.
  final List<AdminAccount>? adminAccounts;

  /// The pagination token to use to request the next page of results.
  final String? nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });

  factory ListOrganizationAdminAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationAdminAccountsResponse(
      adminAccounts: (json['AdminAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AdminAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccounts = this.adminAccounts;
    final nextToken = this.nextToken;
    return {
      if (adminAccounts != null) 'AdminAccounts': adminAccounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about the state of the load balancer.
class LoadBalancerState {
  /// The state code. The initial state of the load balancer is provisioning.
  ///
  /// After the load balancer is fully set up and ready to route traffic, its
  /// state is active.
  ///
  /// If the load balancer could not be set up, its state is failed.
  final String? code;

  /// A description of the state.
  final String? reason;

  LoadBalancerState({
    this.code,
    this.reason,
  });

  factory LoadBalancerState.fromJson(Map<String, dynamic> json) {
    return LoadBalancerState(
      code: json['Code'] as String?,
      reason: json['Reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reason = this.reason;
    return {
      if (code != null) 'Code': code,
      if (reason != null) 'Reason': reason,
    };
  }
}

/// A list of malware related to a finding.
class Malware {
  /// The name of the malware that was observed.
  final String name;

  /// The file system path of the malware that was observed.
  final String? path;

  /// The state of the malware that was observed.
  final MalwareState? state;

  /// The type of the malware that was observed.
  final MalwareType? type;

  Malware({
    required this.name,
    this.path,
    this.state,
    this.type,
  });

  factory Malware.fromJson(Map<String, dynamic> json) {
    return Malware(
      name: json['Name'] as String,
      path: json['Path'] as String?,
      state: (json['State'] as String?)?.toMalwareState(),
      type: (json['Type'] as String?)?.toMalwareType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final path = this.path;
    final state = this.state;
    final type = this.type;
    return {
      'Name': name,
      if (path != null) 'Path': path,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum MalwareState {
  observed,
  removalFailed,
  removed,
}

extension on MalwareState {
  String toValue() {
    switch (this) {
      case MalwareState.observed:
        return 'OBSERVED';
      case MalwareState.removalFailed:
        return 'REMOVAL_FAILED';
      case MalwareState.removed:
        return 'REMOVED';
    }
  }
}

extension on String {
  MalwareState toMalwareState() {
    switch (this) {
      case 'OBSERVED':
        return MalwareState.observed;
      case 'REMOVAL_FAILED':
        return MalwareState.removalFailed;
      case 'REMOVED':
        return MalwareState.removed;
    }
    throw Exception('$this is not known in enum MalwareState');
  }
}

enum MalwareType {
  adware,
  blendedThreat,
  botnetAgent,
  coinMiner,
  exploitKit,
  keylogger,
  macro,
  potentiallyUnwanted,
  spyware,
  ransomware,
  remoteAccess,
  rootkit,
  trojan,
  virus,
  worm,
}

extension on MalwareType {
  String toValue() {
    switch (this) {
      case MalwareType.adware:
        return 'ADWARE';
      case MalwareType.blendedThreat:
        return 'BLENDED_THREAT';
      case MalwareType.botnetAgent:
        return 'BOTNET_AGENT';
      case MalwareType.coinMiner:
        return 'COIN_MINER';
      case MalwareType.exploitKit:
        return 'EXPLOIT_KIT';
      case MalwareType.keylogger:
        return 'KEYLOGGER';
      case MalwareType.macro:
        return 'MACRO';
      case MalwareType.potentiallyUnwanted:
        return 'POTENTIALLY_UNWANTED';
      case MalwareType.spyware:
        return 'SPYWARE';
      case MalwareType.ransomware:
        return 'RANSOMWARE';
      case MalwareType.remoteAccess:
        return 'REMOTE_ACCESS';
      case MalwareType.rootkit:
        return 'ROOTKIT';
      case MalwareType.trojan:
        return 'TROJAN';
      case MalwareType.virus:
        return 'VIRUS';
      case MalwareType.worm:
        return 'WORM';
    }
  }
}

extension on String {
  MalwareType toMalwareType() {
    switch (this) {
      case 'ADWARE':
        return MalwareType.adware;
      case 'BLENDED_THREAT':
        return MalwareType.blendedThreat;
      case 'BOTNET_AGENT':
        return MalwareType.botnetAgent;
      case 'COIN_MINER':
        return MalwareType.coinMiner;
      case 'EXPLOIT_KIT':
        return MalwareType.exploitKit;
      case 'KEYLOGGER':
        return MalwareType.keylogger;
      case 'MACRO':
        return MalwareType.macro;
      case 'POTENTIALLY_UNWANTED':
        return MalwareType.potentiallyUnwanted;
      case 'SPYWARE':
        return MalwareType.spyware;
      case 'RANSOMWARE':
        return MalwareType.ransomware;
      case 'REMOTE_ACCESS':
        return MalwareType.remoteAccess;
      case 'ROOTKIT':
        return MalwareType.rootkit;
      case 'TROJAN':
        return MalwareType.trojan;
      case 'VIRUS':
        return MalwareType.virus;
      case 'WORM':
        return MalwareType.worm;
    }
    throw Exception('$this is not known in enum MalwareType');
  }
}

/// A map filter for querying findings. Each map filter provides the field to
/// check, the value to look for, and the comparison operator.
class MapFilter {
  /// The condition to apply to the key value when querying for findings with a
  /// map filter.
  ///
  /// To search for values that exactly match the filter value, use
  /// <code>EQUALS</code>. For example, for the <code>ResourceTags</code> field,
  /// the filter <code>Department EQUALS Security</code> matches findings that
  /// have the value <code>Security</code> for the tag <code>Department</code>.
  ///
  /// To search for values other than the filter value, use
  /// <code>NOT_EQUALS</code>. For example, for the <code>ResourceTags</code>
  /// field, the filter <code>Department NOT_EQUALS Finance</code> matches
  /// findings that do not have the value <code>Finance</code> for the tag
  /// <code>Department</code>.
  ///
  /// <code>EQUALS</code> filters on the same field are joined by <code>OR</code>.
  /// A finding matches if it matches any one of those filters.
  ///
  /// <code>NOT_EQUALS</code> filters on the same field are joined by
  /// <code>AND</code>. A finding matches only if it matches all of those filters.
  ///
  /// You cannot have both an <code>EQUALS</code> filter and a
  /// <code>NOT_EQUALS</code> filter on the same field.
  final MapFilterComparison? comparison;

  /// The key of the map filter. For example, for <code>ResourceTags</code>,
  /// <code>Key</code> identifies the name of the tag. For
  /// <code>UserDefinedFields</code>, <code>Key</code> is the name of the field.
  final String? key;

  /// The value for the key in the map filter. Filter values are case sensitive.
  /// For example, one of the values for a tag called <code>Department</code>
  /// might be <code>Security</code>. If you provide <code>security</code> as the
  /// filter value, then there is no match.
  final String? value;

  MapFilter({
    this.comparison,
    this.key,
    this.value,
  });

  factory MapFilter.fromJson(Map<String, dynamic> json) {
    return MapFilter(
      comparison: (json['Comparison'] as String?)?.toMapFilterComparison(),
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      if (comparison != null) 'Comparison': comparison.toValue(),
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

enum MapFilterComparison {
  equals,
  notEquals,
}

extension on MapFilterComparison {
  String toValue() {
    switch (this) {
      case MapFilterComparison.equals:
        return 'EQUALS';
      case MapFilterComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension on String {
  MapFilterComparison toMapFilterComparison() {
    switch (this) {
      case 'EQUALS':
        return MapFilterComparison.equals;
      case 'NOT_EQUALS':
        return MapFilterComparison.notEquals;
    }
    throw Exception('$this is not known in enum MapFilterComparison');
  }
}

/// The details about a member account.
class Member {
  /// The AWS account ID of the member account.
  final String? accountId;

  /// The AWS account ID of the Security Hub administrator account associated with
  /// this member account.
  final String? administratorId;

  /// The email address of the member account.
  final String? email;

  /// A timestamp for the date and time when the invitation was sent to the member
  /// account.
  final DateTime? invitedAt;

  /// This is replaced by <code>AdministratorID</code>.
  ///
  /// The AWS account ID of the Security Hub administrator account associated with
  /// this member account.
  final String? masterId;

  /// The status of the relationship between the member account and its
  /// administrator account.
  ///
  /// The status can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - Indicates that the administrator account added the
  /// member account, but has not yet invited the member account.
  /// </li>
  /// <li>
  /// <code>INVITED</code> - Indicates that the administrator account invited the
  /// member account. The member account has not yet responded to the invitation.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Indicates that the member account is currently
  /// active. For manually invited member accounts, indicates that the member
  /// account accepted the invitation.
  /// </li>
  /// <li>
  /// <code>REMOVED</code> - Indicates that the administrator account
  /// disassociated the member account.
  /// </li>
  /// <li>
  /// <code>RESIGNED</code> - Indicates that the member account disassociated
  /// themselves from the administrator account.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Indicates that the administrator account deleted the
  /// member account.
  /// </li>
  /// </ul>
  final String? memberStatus;

  /// The timestamp for the date and time when the member account was updated.
  final DateTime? updatedAt;

  Member({
    this.accountId,
    this.administratorId,
    this.email,
    this.invitedAt,
    this.masterId,
    this.memberStatus,
    this.updatedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      accountId: json['AccountId'] as String?,
      administratorId: json['AdministratorId'] as String?,
      email: json['Email'] as String?,
      invitedAt: timeStampFromJson(json['InvitedAt']),
      masterId: json['MasterId'] as String?,
      memberStatus: json['MemberStatus'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final administratorId = this.administratorId;
    final email = this.email;
    final invitedAt = this.invitedAt;
    final masterId = this.masterId;
    final memberStatus = this.memberStatus;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (administratorId != null) 'AdministratorId': administratorId,
      if (email != null) 'Email': email,
      if (invitedAt != null) 'InvitedAt': iso8601ToJson(invitedAt),
      if (masterId != null) 'MasterId': masterId,
      if (memberStatus != null) 'MemberStatus': memberStatus,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The details of network-related information about a finding.
class Network {
  /// The destination domain of network-related information about a finding.
  final String? destinationDomain;

  /// The destination IPv4 address of network-related information about a finding.
  final String? destinationIpV4;

  /// The destination IPv6 address of network-related information about a finding.
  final String? destinationIpV6;

  /// The destination port of network-related information about a finding.
  final int? destinationPort;

  /// The direction of network traffic associated with a finding.
  final NetworkDirection? direction;

  /// The range of open ports that is present on the network.
  final PortRange? openPortRange;

  /// The protocol of network-related information about a finding.
  final String? protocol;

  /// The source domain of network-related information about a finding.
  final String? sourceDomain;

  /// The source IPv4 address of network-related information about a finding.
  final String? sourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  final String? sourceIpV6;

  /// The source media access control (MAC) address of network-related information
  /// about a finding.
  final String? sourceMac;

  /// The source port of network-related information about a finding.
  final int? sourcePort;

  Network({
    this.destinationDomain,
    this.destinationIpV4,
    this.destinationIpV6,
    this.destinationPort,
    this.direction,
    this.openPortRange,
    this.protocol,
    this.sourceDomain,
    this.sourceIpV4,
    this.sourceIpV6,
    this.sourceMac,
    this.sourcePort,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      destinationDomain: json['DestinationDomain'] as String?,
      destinationIpV4: json['DestinationIpV4'] as String?,
      destinationIpV6: json['DestinationIpV6'] as String?,
      destinationPort: json['DestinationPort'] as int?,
      direction: (json['Direction'] as String?)?.toNetworkDirection(),
      openPortRange: json['OpenPortRange'] != null
          ? PortRange.fromJson(json['OpenPortRange'] as Map<String, dynamic>)
          : null,
      protocol: json['Protocol'] as String?,
      sourceDomain: json['SourceDomain'] as String?,
      sourceIpV4: json['SourceIpV4'] as String?,
      sourceIpV6: json['SourceIpV6'] as String?,
      sourceMac: json['SourceMac'] as String?,
      sourcePort: json['SourcePort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationDomain = this.destinationDomain;
    final destinationIpV4 = this.destinationIpV4;
    final destinationIpV6 = this.destinationIpV6;
    final destinationPort = this.destinationPort;
    final direction = this.direction;
    final openPortRange = this.openPortRange;
    final protocol = this.protocol;
    final sourceDomain = this.sourceDomain;
    final sourceIpV4 = this.sourceIpV4;
    final sourceIpV6 = this.sourceIpV6;
    final sourceMac = this.sourceMac;
    final sourcePort = this.sourcePort;
    return {
      if (destinationDomain != null) 'DestinationDomain': destinationDomain,
      if (destinationIpV4 != null) 'DestinationIpV4': destinationIpV4,
      if (destinationIpV6 != null) 'DestinationIpV6': destinationIpV6,
      if (destinationPort != null) 'DestinationPort': destinationPort,
      if (direction != null) 'Direction': direction.toValue(),
      if (openPortRange != null) 'OpenPortRange': openPortRange,
      if (protocol != null) 'Protocol': protocol,
      if (sourceDomain != null) 'SourceDomain': sourceDomain,
      if (sourceIpV4 != null) 'SourceIpV4': sourceIpV4,
      if (sourceIpV6 != null) 'SourceIpV6': sourceIpV6,
      if (sourceMac != null) 'SourceMac': sourceMac,
      if (sourcePort != null) 'SourcePort': sourcePort,
    };
  }
}

/// Provided if <code>ActionType</code> is <code>NETWORK_CONNECTION</code>. It
/// provides details about the attempted network connection that was detected.
class NetworkConnectionAction {
  /// Indicates whether the network connection attempt was blocked.
  final bool? blocked;

  /// The direction of the network connection request (<code>IN</code> or
  /// <code>OUT</code>).
  final String? connectionDirection;

  /// Information about the port on the EC2 instance.
  final ActionLocalPortDetails? localPortDetails;

  /// The protocol used to make the network connection request.
  final String? protocol;

  /// Information about the remote IP address that issued the network connection
  /// request.
  final ActionRemoteIpDetails? remoteIpDetails;

  /// Information about the port on the remote IP address.
  final ActionRemotePortDetails? remotePortDetails;

  NetworkConnectionAction({
    this.blocked,
    this.connectionDirection,
    this.localPortDetails,
    this.protocol,
    this.remoteIpDetails,
    this.remotePortDetails,
  });

  factory NetworkConnectionAction.fromJson(Map<String, dynamic> json) {
    return NetworkConnectionAction(
      blocked: json['Blocked'] as bool?,
      connectionDirection: json['ConnectionDirection'] as String?,
      localPortDetails: json['LocalPortDetails'] != null
          ? ActionLocalPortDetails.fromJson(
              json['LocalPortDetails'] as Map<String, dynamic>)
          : null,
      protocol: json['Protocol'] as String?,
      remoteIpDetails: json['RemoteIpDetails'] != null
          ? ActionRemoteIpDetails.fromJson(
              json['RemoteIpDetails'] as Map<String, dynamic>)
          : null,
      remotePortDetails: json['RemotePortDetails'] != null
          ? ActionRemotePortDetails.fromJson(
              json['RemotePortDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final connectionDirection = this.connectionDirection;
    final localPortDetails = this.localPortDetails;
    final protocol = this.protocol;
    final remoteIpDetails = this.remoteIpDetails;
    final remotePortDetails = this.remotePortDetails;
    return {
      if (blocked != null) 'Blocked': blocked,
      if (connectionDirection != null)
        'ConnectionDirection': connectionDirection,
      if (localPortDetails != null) 'LocalPortDetails': localPortDetails,
      if (protocol != null) 'Protocol': protocol,
      if (remoteIpDetails != null) 'RemoteIpDetails': remoteIpDetails,
      if (remotePortDetails != null) 'RemotePortDetails': remotePortDetails,
    };
  }
}

enum NetworkDirection {
  $in,
  out,
}

extension on NetworkDirection {
  String toValue() {
    switch (this) {
      case NetworkDirection.$in:
        return 'IN';
      case NetworkDirection.out:
        return 'OUT';
    }
  }
}

extension on String {
  NetworkDirection toNetworkDirection() {
    switch (this) {
      case 'IN':
        return NetworkDirection.$in;
      case 'OUT':
        return NetworkDirection.out;
    }
    throw Exception('$this is not known in enum NetworkDirection');
  }
}

/// Details about a network path component that occurs before or after the
/// current component.
class NetworkHeader {
  /// Information about the destination of the component.
  final NetworkPathComponentDetails? destination;

  /// The protocol used for the component.
  final String? protocol;

  /// Information about the origin of the component.
  final NetworkPathComponentDetails? source;

  NetworkHeader({
    this.destination,
    this.protocol,
    this.source,
  });

  factory NetworkHeader.fromJson(Map<String, dynamic> json) {
    return NetworkHeader(
      destination: json['Destination'] != null
          ? NetworkPathComponentDetails.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      protocol: json['Protocol'] as String?,
      source: json['Source'] != null
          ? NetworkPathComponentDetails.fromJson(
              json['Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final protocol = this.protocol;
    final source = this.source;
    return {
      if (destination != null) 'Destination': destination,
      if (protocol != null) 'Protocol': protocol,
      if (source != null) 'Source': source,
    };
  }
}

/// Information about a network path component.
class NetworkPathComponent {
  /// The identifier of a component in the network path.
  final String? componentId;

  /// The type of component.
  final String? componentType;

  /// Information about the component that comes after the current component in
  /// the network path.
  final NetworkHeader? egress;

  /// Information about the component that comes before the current node in the
  /// network path.
  final NetworkHeader? ingress;

  NetworkPathComponent({
    this.componentId,
    this.componentType,
    this.egress,
    this.ingress,
  });

  factory NetworkPathComponent.fromJson(Map<String, dynamic> json) {
    return NetworkPathComponent(
      componentId: json['ComponentId'] as String?,
      componentType: json['ComponentType'] as String?,
      egress: json['Egress'] != null
          ? NetworkHeader.fromJson(json['Egress'] as Map<String, dynamic>)
          : null,
      ingress: json['Ingress'] != null
          ? NetworkHeader.fromJson(json['Ingress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final componentId = this.componentId;
    final componentType = this.componentType;
    final egress = this.egress;
    final ingress = this.ingress;
    return {
      if (componentId != null) 'ComponentId': componentId,
      if (componentType != null) 'ComponentType': componentType,
      if (egress != null) 'Egress': egress,
      if (ingress != null) 'Ingress': ingress,
    };
  }
}

/// Information about the destination of the next component in the network path.
class NetworkPathComponentDetails {
  /// The IP addresses of the destination.
  final List<String>? address;

  /// A list of port ranges for the destination.
  final List<PortRange>? portRanges;

  NetworkPathComponentDetails({
    this.address,
    this.portRanges,
  });

  factory NetworkPathComponentDetails.fromJson(Map<String, dynamic> json) {
    return NetworkPathComponentDetails(
      address: (json['Address'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      portRanges: (json['PortRanges'] as List?)
          ?.whereNotNull()
          .map((e) => PortRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final portRanges = this.portRanges;
    return {
      if (address != null) 'Address': address,
      if (portRanges != null) 'PortRanges': portRanges,
    };
  }
}

/// A user-defined note added to a finding.
class Note {
  /// The text of a note.
  final String text;

  /// The timestamp of when the note was updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String updatedAt;

  /// The principal that created a note.
  final String updatedBy;

  Note({
    required this.text,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      text: json['Text'] as String,
      updatedAt: json['UpdatedAt'] as String,
      updatedBy: json['UpdatedBy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'Text': text,
      'UpdatedAt': updatedAt,
      'UpdatedBy': updatedBy,
    };
  }
}

/// The updated note.
class NoteUpdate {
  /// The updated note text.
  final String text;

  /// The principal that updated the note.
  final String updatedBy;

  NoteUpdate({
    required this.text,
    required this.updatedBy,
  });

  factory NoteUpdate.fromJson(Map<String, dynamic> json) {
    return NoteUpdate(
      text: json['Text'] as String,
      updatedBy: json['UpdatedBy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final updatedBy = this.updatedBy;
    return {
      'Text': text,
      'UpdatedBy': updatedBy,
    };
  }
}

/// A number filter for querying findings.
class NumberFilter {
  /// The equal-to condition to be applied to a single field when querying for
  /// findings.
  final double? eq;

  /// The greater-than-equal condition to be applied to a single field when
  /// querying for findings.
  final double? gte;

  /// The less-than-equal condition to be applied to a single field when querying
  /// for findings.
  final double? lte;

  NumberFilter({
    this.eq,
    this.gte,
    this.lte,
  });

  factory NumberFilter.fromJson(Map<String, dynamic> json) {
    return NumberFilter(
      eq: json['Eq'] as double?,
      gte: json['Gte'] as double?,
      lte: json['Lte'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final eq = this.eq;
    final gte = this.gte;
    final lte = this.lte;
    return {
      if (eq != null) 'Eq': eq,
      if (gte != null) 'Gte': gte,
      if (lte != null) 'Lte': lte,
    };
  }
}

/// The detected occurrences of sensitive data.
class Occurrences {
  /// Occurrences of sensitive data detected in Microsoft Excel workbooks,
  /// comma-separated value (CSV) files, or tab-separated value (TSV) files.
  final List<Cell>? cells;

  /// Occurrences of sensitive data detected in a non-binary text file or a
  /// Microsoft Word file. Non-binary text files include files such as HTML, XML,
  /// JSON, and TXT files.
  final List<Range>? lineRanges;

  /// Occurrences of sensitive data detected in a binary text file.
  final List<Range>? offsetRanges;

  /// Occurrences of sensitive data in an Adobe Portable Document Format (PDF)
  /// file.
  final List<Page>? pages;

  /// Occurrences of sensitive data in an Apache Avro object container or an
  /// Apache Parquet file.
  final List<Record>? records;

  Occurrences({
    this.cells,
    this.lineRanges,
    this.offsetRanges,
    this.pages,
    this.records,
  });

  factory Occurrences.fromJson(Map<String, dynamic> json) {
    return Occurrences(
      cells: (json['Cells'] as List?)
          ?.whereNotNull()
          .map((e) => Cell.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineRanges: (json['LineRanges'] as List?)
          ?.whereNotNull()
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      offsetRanges: (json['OffsetRanges'] as List?)
          ?.whereNotNull()
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      pages: (json['Pages'] as List?)
          ?.whereNotNull()
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      records: (json['Records'] as List?)
          ?.whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final lineRanges = this.lineRanges;
    final offsetRanges = this.offsetRanges;
    final pages = this.pages;
    final records = this.records;
    return {
      if (cells != null) 'Cells': cells,
      if (lineRanges != null) 'LineRanges': lineRanges,
      if (offsetRanges != null) 'OffsetRanges': offsetRanges,
      if (pages != null) 'Pages': pages,
      if (records != null) 'Records': records,
    };
  }
}

/// An occurrence of sensitive data in an Adobe Portable Document Format (PDF)
/// file.
class Page {
  /// An occurrence of sensitive data detected in a non-binary text file or a
  /// Microsoft Word file. Non-binary text files include files such as HTML, XML,
  /// JSON, and TXT files.
  final Range? lineRange;

  /// An occurrence of sensitive data detected in a binary text file.
  final Range? offsetRange;

  /// The page number of the page that contains the sensitive data.
  final int? pageNumber;

  Page({
    this.lineRange,
    this.offsetRange,
    this.pageNumber,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      lineRange: json['LineRange'] != null
          ? Range.fromJson(json['LineRange'] as Map<String, dynamic>)
          : null,
      offsetRange: json['OffsetRange'] != null
          ? Range.fromJson(json['OffsetRange'] as Map<String, dynamic>)
          : null,
      pageNumber: json['PageNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineRange = this.lineRange;
    final offsetRange = this.offsetRange;
    final pageNumber = this.pageNumber;
    return {
      if (lineRange != null) 'LineRange': lineRange,
      if (offsetRange != null) 'OffsetRange': offsetRange,
      if (pageNumber != null) 'PageNumber': pageNumber,
    };
  }
}

enum Partition {
  aws,
  awsCn,
  awsUsGov,
}

extension on Partition {
  String toValue() {
    switch (this) {
      case Partition.aws:
        return 'aws';
      case Partition.awsCn:
        return 'aws-cn';
      case Partition.awsUsGov:
        return 'aws-us-gov';
    }
  }
}

extension on String {
  Partition toPartition() {
    switch (this) {
      case 'aws':
        return Partition.aws;
      case 'aws-cn':
        return Partition.awsCn;
      case 'aws-us-gov':
        return Partition.awsUsGov;
    }
    throw Exception('$this is not known in enum Partition');
  }
}

/// Provides an overview of the patch compliance status for an instance against
/// a selected compliance standard.
class PatchSummary {
  /// The identifier of the compliance standard that was used to determine the
  /// patch compliance status.
  final String id;

  /// The number of patches from the compliance standard that failed to install.
  final int? failedCount;

  /// The number of patches from the compliance standard that were installed
  /// successfully.
  final int? installedCount;

  /// The number of installed patches that are not part of the compliance
  /// standard.
  final int? installedOtherCount;

  /// The number of patches that were applied, but that require the instance to be
  /// rebooted in order to be marked as installed.
  final int? installedPendingReboot;

  /// The number of patches that are installed but are also on a list of patches
  /// that the customer rejected.
  final int? installedRejectedCount;

  /// The number of patches that are part of the compliance standard but are not
  /// installed. The count includes patches that failed to install.
  final int? missingCount;

  /// The type of patch operation performed. For Patch Manager, the values are
  /// <code>SCAN</code> and <code>INSTALL</code>.
  final String? operation;

  /// Indicates when the operation completed.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? operationEndTime;

  /// Indicates when the operation started.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? operationStartTime;

  /// The reboot option specified for the instance.
  final String? rebootOption;

  PatchSummary({
    required this.id,
    this.failedCount,
    this.installedCount,
    this.installedOtherCount,
    this.installedPendingReboot,
    this.installedRejectedCount,
    this.missingCount,
    this.operation,
    this.operationEndTime,
    this.operationStartTime,
    this.rebootOption,
  });

  factory PatchSummary.fromJson(Map<String, dynamic> json) {
    return PatchSummary(
      id: json['Id'] as String,
      failedCount: json['FailedCount'] as int?,
      installedCount: json['InstalledCount'] as int?,
      installedOtherCount: json['InstalledOtherCount'] as int?,
      installedPendingReboot: json['InstalledPendingReboot'] as int?,
      installedRejectedCount: json['InstalledRejectedCount'] as int?,
      missingCount: json['MissingCount'] as int?,
      operation: json['Operation'] as String?,
      operationEndTime: json['OperationEndTime'] as String?,
      operationStartTime: json['OperationStartTime'] as String?,
      rebootOption: json['RebootOption'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final failedCount = this.failedCount;
    final installedCount = this.installedCount;
    final installedOtherCount = this.installedOtherCount;
    final installedPendingReboot = this.installedPendingReboot;
    final installedRejectedCount = this.installedRejectedCount;
    final missingCount = this.missingCount;
    final operation = this.operation;
    final operationEndTime = this.operationEndTime;
    final operationStartTime = this.operationStartTime;
    final rebootOption = this.rebootOption;
    return {
      'Id': id,
      if (failedCount != null) 'FailedCount': failedCount,
      if (installedCount != null) 'InstalledCount': installedCount,
      if (installedOtherCount != null)
        'InstalledOtherCount': installedOtherCount,
      if (installedPendingReboot != null)
        'InstalledPendingReboot': installedPendingReboot,
      if (installedRejectedCount != null)
        'InstalledRejectedCount': installedRejectedCount,
      if (missingCount != null) 'MissingCount': missingCount,
      if (operation != null) 'Operation': operation,
      if (operationEndTime != null) 'OperationEndTime': operationEndTime,
      if (operationStartTime != null) 'OperationStartTime': operationStartTime,
      if (rebootOption != null) 'RebootOption': rebootOption,
    };
  }
}

/// Provided if <code>ActionType</code> is <code>PORT_PROBE</code>. It provides
/// details about the attempted port probe that was detected.
class PortProbeAction {
  /// Indicates whether the port probe was blocked.
  final bool? blocked;

  /// Information about the ports affected by the port probe.
  final List<PortProbeDetail>? portProbeDetails;

  PortProbeAction({
    this.blocked,
    this.portProbeDetails,
  });

  factory PortProbeAction.fromJson(Map<String, dynamic> json) {
    return PortProbeAction(
      blocked: json['Blocked'] as bool?,
      portProbeDetails: (json['PortProbeDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortProbeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final portProbeDetails = this.portProbeDetails;
    return {
      if (blocked != null) 'Blocked': blocked,
      if (portProbeDetails != null) 'PortProbeDetails': portProbeDetails,
    };
  }
}

/// A port scan that was part of the port probe. For each scan, PortProbeDetails
/// provides information about the local IP address and port that were scanned,
/// and the remote IP address that the scan originated from.
class PortProbeDetail {
  /// Provides information about the IP address where the scanned port is located.
  final ActionLocalIpDetails? localIpDetails;

  /// Provides information about the port that was scanned.
  final ActionLocalPortDetails? localPortDetails;

  /// Provides information about the remote IP address that performed the scan.
  final ActionRemoteIpDetails? remoteIpDetails;

  PortProbeDetail({
    this.localIpDetails,
    this.localPortDetails,
    this.remoteIpDetails,
  });

  factory PortProbeDetail.fromJson(Map<String, dynamic> json) {
    return PortProbeDetail(
      localIpDetails: json['LocalIpDetails'] != null
          ? ActionLocalIpDetails.fromJson(
              json['LocalIpDetails'] as Map<String, dynamic>)
          : null,
      localPortDetails: json['LocalPortDetails'] != null
          ? ActionLocalPortDetails.fromJson(
              json['LocalPortDetails'] as Map<String, dynamic>)
          : null,
      remoteIpDetails: json['RemoteIpDetails'] != null
          ? ActionRemoteIpDetails.fromJson(
              json['RemoteIpDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final localIpDetails = this.localIpDetails;
    final localPortDetails = this.localPortDetails;
    final remoteIpDetails = this.remoteIpDetails;
    return {
      if (localIpDetails != null) 'LocalIpDetails': localIpDetails,
      if (localPortDetails != null) 'LocalPortDetails': localPortDetails,
      if (remoteIpDetails != null) 'RemoteIpDetails': remoteIpDetails,
    };
  }
}

/// A range of ports.
class PortRange {
  /// The first port in the port range.
  final int? begin;

  /// The last port in the port range.
  final int? end;

  PortRange({
    this.begin,
    this.end,
  });

  factory PortRange.fromJson(Map<String, dynamic> json) {
    return PortRange(
      begin: json['Begin'] as int?,
      end: json['End'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final begin = this.begin;
    final end = this.end;
    return {
      if (begin != null) 'Begin': begin,
      if (end != null) 'End': end,
    };
  }
}

/// A range of ports.
class PortRangeFromTo {
  /// The first port in the port range.
  final int? from;

  /// The last port in the port range.
  final int? to;

  PortRangeFromTo({
    this.from,
    this.to,
  });

  factory PortRangeFromTo.fromJson(Map<String, dynamic> json) {
    return PortRangeFromTo(
      from: json['From'] as int?,
      to: json['To'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      if (from != null) 'From': from,
      if (to != null) 'To': to,
    };
  }
}

/// The details of process-related information about a finding.
class ProcessDetails {
  /// Indicates when the process was launched.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? launchedAt;

  /// The name of the process.
  final String? name;

  /// The parent process ID.
  final int? parentPid;

  /// The path to the process executable.
  final String? path;

  /// The process ID.
  final int? pid;

  /// Indicates when the process was terminated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? terminatedAt;

  ProcessDetails({
    this.launchedAt,
    this.name,
    this.parentPid,
    this.path,
    this.pid,
    this.terminatedAt,
  });

  factory ProcessDetails.fromJson(Map<String, dynamic> json) {
    return ProcessDetails(
      launchedAt: json['LaunchedAt'] as String?,
      name: json['Name'] as String?,
      parentPid: json['ParentPid'] as int?,
      path: json['Path'] as String?,
      pid: json['Pid'] as int?,
      terminatedAt: json['TerminatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchedAt = this.launchedAt;
    final name = this.name;
    final parentPid = this.parentPid;
    final path = this.path;
    final pid = this.pid;
    final terminatedAt = this.terminatedAt;
    return {
      if (launchedAt != null) 'LaunchedAt': launchedAt,
      if (name != null) 'Name': name,
      if (parentPid != null) 'ParentPid': parentPid,
      if (path != null) 'Path': path,
      if (pid != null) 'Pid': pid,
      if (terminatedAt != null) 'TerminatedAt': terminatedAt,
    };
  }
}

/// Contains details about a product.
class Product {
  /// The ARN assigned to the product.
  final String productArn;

  /// The URL to the service or product documentation about the integration with
  /// Security Hub, including how to activate the integration.
  final String? activationUrl;

  /// The categories assigned to the product.
  final List<String>? categories;

  /// The name of the company that provides the product.
  final String? companyName;

  /// A description of the product.
  final String? description;

  /// The types of integration that the product supports. Available values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>SEND_FINDINGS_TO_SECURITY_HUB</code> - The integration sends findings
  /// to Security Hub.
  /// </li>
  /// <li>
  /// <code>RECEIVE_FINDINGS_FROM_SECURITY_HUB</code> - The integration receives
  /// findings from Security Hub.
  /// </li>
  /// <li>
  /// <code>UPDATE_FINDINGS_IN_SECURITY_HUB</code> - The integration does not send
  /// new findings to Security Hub, but does make updates to the findings that it
  /// receives from Security Hub.
  /// </li>
  /// </ul>
  final List<IntegrationType>? integrationTypes;

  /// For integrations with AWS services, the AWS Console URL from which to
  /// activate the service.
  ///
  /// For integrations with third-party products, the AWS Marketplace URL from
  /// which to subscribe to or purchase the product.
  final String? marketplaceUrl;

  /// The name of the product.
  final String? productName;

  /// The resource policy associated with the product.
  final String? productSubscriptionResourcePolicy;

  Product({
    required this.productArn,
    this.activationUrl,
    this.categories,
    this.companyName,
    this.description,
    this.integrationTypes,
    this.marketplaceUrl,
    this.productName,
    this.productSubscriptionResourcePolicy,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productArn: json['ProductArn'] as String,
      activationUrl: json['ActivationUrl'] as String?,
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      companyName: json['CompanyName'] as String?,
      description: json['Description'] as String?,
      integrationTypes: (json['IntegrationTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toIntegrationType())
          .toList(),
      marketplaceUrl: json['MarketplaceUrl'] as String?,
      productName: json['ProductName'] as String?,
      productSubscriptionResourcePolicy:
          json['ProductSubscriptionResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final productArn = this.productArn;
    final activationUrl = this.activationUrl;
    final categories = this.categories;
    final companyName = this.companyName;
    final description = this.description;
    final integrationTypes = this.integrationTypes;
    final marketplaceUrl = this.marketplaceUrl;
    final productName = this.productName;
    final productSubscriptionResourcePolicy =
        this.productSubscriptionResourcePolicy;
    return {
      'ProductArn': productArn,
      if (activationUrl != null) 'ActivationUrl': activationUrl,
      if (categories != null) 'Categories': categories,
      if (companyName != null) 'CompanyName': companyName,
      if (description != null) 'Description': description,
      if (integrationTypes != null)
        'IntegrationTypes': integrationTypes.map((e) => e.toValue()).toList(),
      if (marketplaceUrl != null) 'MarketplaceUrl': marketplaceUrl,
      if (productName != null) 'ProductName': productName,
      if (productSubscriptionResourcePolicy != null)
        'ProductSubscriptionResourcePolicy': productSubscriptionResourcePolicy,
    };
  }
}

/// Identifies where the sensitive data begins and ends.
class Range {
  /// The number of lines (for a line range) or characters (for an offset range)
  /// from the beginning of the file to the end of the sensitive data.
  final int? end;

  /// The number of lines (for a line range) or characters (for an offset range)
  /// from the beginning of the file to the end of the sensitive data.
  final int? start;

  /// In the line where the sensitive data starts, the column within the line
  /// where the sensitive data starts.
  final int? startColumn;

  Range({
    this.end,
    this.start,
    this.startColumn,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      end: json['End'] as int?,
      start: json['Start'] as int?,
      startColumn: json['StartColumn'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    final startColumn = this.startColumn;
    return {
      if (end != null) 'End': end,
      if (start != null) 'Start': start,
      if (startColumn != null) 'StartColumn': startColumn,
    };
  }
}

/// A recommendation on how to remediate the issue identified in a finding.
class Recommendation {
  /// Describes the recommended steps to take to remediate an issue identified in
  /// a finding.
  final String? text;

  /// A URL to a page or site that contains information about how to remediate a
  /// finding.
  final String? url;

  Recommendation({
    this.text,
    this.url,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      text: json['Text'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final url = this.url;
    return {
      if (text != null) 'Text': text,
      if (url != null) 'Url': url,
    };
  }
}

/// An occurrence of sensitive data in an Apache Avro object container or an
/// Apache Parquet file.
class Record {
  /// The path, as a JSONPath expression, to the field in the record that contains
  /// the data. If the field name is longer than 20 characters, it is truncated.
  /// If the path is longer than 250 characters, it is truncated.
  final String? jsonPath;

  /// The record index, starting from 0, for the record that contains the data.
  final int? recordIndex;

  Record({
    this.jsonPath,
    this.recordIndex,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      jsonPath: json['JsonPath'] as String?,
      recordIndex: json['RecordIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final recordIndex = this.recordIndex;
    return {
      if (jsonPath != null) 'JsonPath': jsonPath,
      if (recordIndex != null) 'RecordIndex': recordIndex,
    };
  }
}

enum RecordState {
  active,
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
  }
}

extension on String {
  RecordState toRecordState() {
    switch (this) {
      case 'ACTIVE':
        return RecordState.active;
      case 'ARCHIVED':
        return RecordState.archived;
    }
    throw Exception('$this is not known in enum RecordState');
  }
}

/// Details about a related finding.
class RelatedFinding {
  /// The product-generated identifier for a related finding.
  final String id;

  /// The ARN of the product that generated a related finding.
  final String productArn;

  RelatedFinding({
    required this.id,
    required this.productArn,
  });

  factory RelatedFinding.fromJson(Map<String, dynamic> json) {
    return RelatedFinding(
      id: json['Id'] as String,
      productArn: json['ProductArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final productArn = this.productArn;
    return {
      'Id': id,
      'ProductArn': productArn,
    };
  }
}

/// Details about the remediation steps for a finding.
class Remediation {
  /// A recommendation on the steps to take to remediate the issue identified by a
  /// finding.
  final Recommendation? recommendation;

  Remediation({
    this.recommendation,
  });

  factory Remediation.fromJson(Map<String, dynamic> json) {
    return Remediation(
      recommendation: json['Recommendation'] != null
          ? Recommendation.fromJson(
              json['Recommendation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      if (recommendation != null) 'Recommendation': recommendation,
    };
  }
}

/// A resource related to a finding.
class Resource {
  /// The canonical identifier for the given resource type.
  final String id;

  /// The type of the resource that details are provided for. If possible, set
  /// <code>Type</code> to one of the supported resource types. For example, if
  /// the resource is an EC2 instance, then set <code>Type</code> to
  /// <code>AwsEc2Instance</code>.
  ///
  /// If the resource does not match any of the provided types, then set
  /// <code>Type</code> to <code>Other</code>.
  final String type;

  /// Contains information about sensitive data that was detected on the resource.
  final DataClassificationDetails? dataClassification;

  /// Additional details about the resource related to a finding.
  final ResourceDetails? details;

  /// The canonical AWS partition name that the Region is assigned to.
  final Partition? partition;

  /// The canonical AWS external Region name where this resource is located.
  final String? region;

  /// Identifies the role of the resource in the finding. A resource is either the
  /// actor or target of the finding activity,
  final String? resourceRole;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  final Map<String, String>? tags;

  Resource({
    required this.id,
    required this.type,
    this.dataClassification,
    this.details,
    this.partition,
    this.region,
    this.resourceRole,
    this.tags,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['Id'] as String,
      type: json['Type'] as String,
      dataClassification: json['DataClassification'] != null
          ? DataClassificationDetails.fromJson(
              json['DataClassification'] as Map<String, dynamic>)
          : null,
      details: json['Details'] != null
          ? ResourceDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      partition: (json['Partition'] as String?)?.toPartition(),
      region: json['Region'] as String?,
      resourceRole: json['ResourceRole'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    final dataClassification = this.dataClassification;
    final details = this.details;
    final partition = this.partition;
    final region = this.region;
    final resourceRole = this.resourceRole;
    final tags = this.tags;
    return {
      'Id': id,
      'Type': type,
      if (dataClassification != null) 'DataClassification': dataClassification,
      if (details != null) 'Details': details,
      if (partition != null) 'Partition': partition.toValue(),
      if (region != null) 'Region': region,
      if (resourceRole != null) 'ResourceRole': resourceRole,
      if (tags != null) 'Tags': tags,
    };
  }
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
class ResourceDetails {
  /// Provides information about a REST API in version 1 of Amazon API Gateway.
  final AwsApiGatewayRestApiDetails? awsApiGatewayRestApi;

  /// Provides information about a version 1 Amazon API Gateway stage.
  final AwsApiGatewayStageDetails? awsApiGatewayStage;

  /// Provides information about a version 2 API in Amazon API Gateway.
  final AwsApiGatewayV2ApiDetails? awsApiGatewayV2Api;

  /// Provides information about a version 2 stage for Amazon API Gateway.
  final AwsApiGatewayV2StageDetails? awsApiGatewayV2Stage;

  /// Details for an autoscaling group.
  final AwsAutoScalingAutoScalingGroupDetails? awsAutoScalingAutoScalingGroup;

  /// Provides details about an AWS Certificate Manager (ACM) certificate.
  final AwsCertificateManagerCertificateDetails?
      awsCertificateManagerCertificate;

  /// Details about a CloudFront distribution.
  final AwsCloudFrontDistributionDetails? awsCloudFrontDistribution;

  /// Provides details about a CloudTrail trail.
  final AwsCloudTrailTrailDetails? awsCloudTrailTrail;

  /// Details for an AWS CodeBuild project.
  final AwsCodeBuildProjectDetails? awsCodeBuildProject;

  /// Details about a DynamoDB table.
  final AwsDynamoDbTableDetails? awsDynamoDbTable;

  /// Details about an Elastic IP address.
  final AwsEc2EipDetails? awsEc2Eip;

  /// Details about an EC2 instance related to a finding.
  final AwsEc2InstanceDetails? awsEc2Instance;

  /// Details about an EC2 network access control list (ACL).
  final AwsEc2NetworkAclDetails? awsEc2NetworkAcl;

  /// Details for an Amazon EC2 network interface.
  final AwsEc2NetworkInterfaceDetails? awsEc2NetworkInterface;

  /// Details for an EC2 security group.
  final AwsEc2SecurityGroupDetails? awsEc2SecurityGroup;

  /// Details about a subnet in EC2.
  final AwsEc2SubnetDetails? awsEc2Subnet;

  /// Details for an EC2 volume.
  final AwsEc2VolumeDetails? awsEc2Volume;

  /// Details for an EC2 VPC.
  final AwsEc2VpcDetails? awsEc2Vpc;

  /// Details about an ECS cluster.
  final AwsEcsClusterDetails? awsEcsCluster;

  /// Details about a task definition. A task definition describes the container
  /// and volume definitions of an Amazon Elastic Container Service task.
  final AwsEcsTaskDefinitionDetails? awsEcsTaskDefinition;

  /// Details about an Elastic Beanstalk environment.
  final AwsElasticBeanstalkEnvironmentDetails? awsElasticBeanstalkEnvironment;

  /// Details for an Elasticsearch domain.
  final AwsElasticsearchDomainDetails? awsElasticsearchDomain;

  /// contains details about a Classic Load Balancer.
  final AwsElbLoadBalancerDetails? awsElbLoadBalancer;

  /// Details about a load balancer.
  final AwsElbv2LoadBalancerDetails? awsElbv2LoadBalancer;

  /// Details about an IAM access key related to a finding.
  final AwsIamAccessKeyDetails? awsIamAccessKey;

  /// Contains details about an IAM group.
  final AwsIamGroupDetails? awsIamGroup;

  /// Details about an IAM permissions policy.
  final AwsIamPolicyDetails? awsIamPolicy;

  /// Details about an IAM role.
  final AwsIamRoleDetails? awsIamRole;

  /// Details about an IAM user.
  final AwsIamUserDetails? awsIamUser;

  /// Details about a KMS key.
  final AwsKmsKeyDetails? awsKmsKey;

  /// Details about a Lambda function.
  final AwsLambdaFunctionDetails? awsLambdaFunction;

  /// Details for a Lambda layer version.
  final AwsLambdaLayerVersionDetails? awsLambdaLayerVersion;

  /// Details about an Amazon RDS database cluster.
  final AwsRdsDbClusterDetails? awsRdsDbCluster;

  /// Details about an Amazon RDS database cluster snapshot.
  final AwsRdsDbClusterSnapshotDetails? awsRdsDbClusterSnapshot;

  /// Details about an Amazon RDS database instance.
  final AwsRdsDbInstanceDetails? awsRdsDbInstance;

  /// Details about an Amazon RDS database snapshot.
  final AwsRdsDbSnapshotDetails? awsRdsDbSnapshot;

  /// Contains details about an Amazon Redshift cluster.
  final AwsRedshiftClusterDetails? awsRedshiftCluster;

  /// Details about the Amazon S3 Public Access Block configuration for an
  /// account.
  final AwsS3AccountPublicAccessBlockDetails? awsS3AccountPublicAccessBlock;

  /// Details about an Amazon S3 bucket related to a finding.
  final AwsS3BucketDetails? awsS3Bucket;

  /// Details about an Amazon S3 object related to a finding.
  final AwsS3ObjectDetails? awsS3Object;

  /// Details about a Secrets Manager secret.
  final AwsSecretsManagerSecretDetails? awsSecretsManagerSecret;

  /// Details about an SNS topic.
  final AwsSnsTopicDetails? awsSnsTopic;

  /// Details about an SQS queue.
  final AwsSqsQueueDetails? awsSqsQueue;

  /// Provides information about the state of a patch on an instance based on the
  /// patch baseline that was used to patch the instance.
  final AwsSsmPatchComplianceDetails? awsSsmPatchCompliance;

  /// Details for a WAF WebACL.
  final AwsWafWebAclDetails? awsWafWebAcl;

  /// Details about a container resource related to a finding.
  final ContainerDetails? container;

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
  final Map<String, String>? other;

  ResourceDetails({
    this.awsApiGatewayRestApi,
    this.awsApiGatewayStage,
    this.awsApiGatewayV2Api,
    this.awsApiGatewayV2Stage,
    this.awsAutoScalingAutoScalingGroup,
    this.awsCertificateManagerCertificate,
    this.awsCloudFrontDistribution,
    this.awsCloudTrailTrail,
    this.awsCodeBuildProject,
    this.awsDynamoDbTable,
    this.awsEc2Eip,
    this.awsEc2Instance,
    this.awsEc2NetworkAcl,
    this.awsEc2NetworkInterface,
    this.awsEc2SecurityGroup,
    this.awsEc2Subnet,
    this.awsEc2Volume,
    this.awsEc2Vpc,
    this.awsEcsCluster,
    this.awsEcsTaskDefinition,
    this.awsElasticBeanstalkEnvironment,
    this.awsElasticsearchDomain,
    this.awsElbLoadBalancer,
    this.awsElbv2LoadBalancer,
    this.awsIamAccessKey,
    this.awsIamGroup,
    this.awsIamPolicy,
    this.awsIamRole,
    this.awsIamUser,
    this.awsKmsKey,
    this.awsLambdaFunction,
    this.awsLambdaLayerVersion,
    this.awsRdsDbCluster,
    this.awsRdsDbClusterSnapshot,
    this.awsRdsDbInstance,
    this.awsRdsDbSnapshot,
    this.awsRedshiftCluster,
    this.awsS3AccountPublicAccessBlock,
    this.awsS3Bucket,
    this.awsS3Object,
    this.awsSecretsManagerSecret,
    this.awsSnsTopic,
    this.awsSqsQueue,
    this.awsSsmPatchCompliance,
    this.awsWafWebAcl,
    this.container,
    this.other,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      awsApiGatewayRestApi: json['AwsApiGatewayRestApi'] != null
          ? AwsApiGatewayRestApiDetails.fromJson(
              json['AwsApiGatewayRestApi'] as Map<String, dynamic>)
          : null,
      awsApiGatewayStage: json['AwsApiGatewayStage'] != null
          ? AwsApiGatewayStageDetails.fromJson(
              json['AwsApiGatewayStage'] as Map<String, dynamic>)
          : null,
      awsApiGatewayV2Api: json['AwsApiGatewayV2Api'] != null
          ? AwsApiGatewayV2ApiDetails.fromJson(
              json['AwsApiGatewayV2Api'] as Map<String, dynamic>)
          : null,
      awsApiGatewayV2Stage: json['AwsApiGatewayV2Stage'] != null
          ? AwsApiGatewayV2StageDetails.fromJson(
              json['AwsApiGatewayV2Stage'] as Map<String, dynamic>)
          : null,
      awsAutoScalingAutoScalingGroup: json['AwsAutoScalingAutoScalingGroup'] !=
              null
          ? AwsAutoScalingAutoScalingGroupDetails.fromJson(
              json['AwsAutoScalingAutoScalingGroup'] as Map<String, dynamic>)
          : null,
      awsCertificateManagerCertificate:
          json['AwsCertificateManagerCertificate'] != null
              ? AwsCertificateManagerCertificateDetails.fromJson(
                  json['AwsCertificateManagerCertificate']
                      as Map<String, dynamic>)
              : null,
      awsCloudFrontDistribution: json['AwsCloudFrontDistribution'] != null
          ? AwsCloudFrontDistributionDetails.fromJson(
              json['AwsCloudFrontDistribution'] as Map<String, dynamic>)
          : null,
      awsCloudTrailTrail: json['AwsCloudTrailTrail'] != null
          ? AwsCloudTrailTrailDetails.fromJson(
              json['AwsCloudTrailTrail'] as Map<String, dynamic>)
          : null,
      awsCodeBuildProject: json['AwsCodeBuildProject'] != null
          ? AwsCodeBuildProjectDetails.fromJson(
              json['AwsCodeBuildProject'] as Map<String, dynamic>)
          : null,
      awsDynamoDbTable: json['AwsDynamoDbTable'] != null
          ? AwsDynamoDbTableDetails.fromJson(
              json['AwsDynamoDbTable'] as Map<String, dynamic>)
          : null,
      awsEc2Eip: json['AwsEc2Eip'] != null
          ? AwsEc2EipDetails.fromJson(json['AwsEc2Eip'] as Map<String, dynamic>)
          : null,
      awsEc2Instance: json['AwsEc2Instance'] != null
          ? AwsEc2InstanceDetails.fromJson(
              json['AwsEc2Instance'] as Map<String, dynamic>)
          : null,
      awsEc2NetworkAcl: json['AwsEc2NetworkAcl'] != null
          ? AwsEc2NetworkAclDetails.fromJson(
              json['AwsEc2NetworkAcl'] as Map<String, dynamic>)
          : null,
      awsEc2NetworkInterface: json['AwsEc2NetworkInterface'] != null
          ? AwsEc2NetworkInterfaceDetails.fromJson(
              json['AwsEc2NetworkInterface'] as Map<String, dynamic>)
          : null,
      awsEc2SecurityGroup: json['AwsEc2SecurityGroup'] != null
          ? AwsEc2SecurityGroupDetails.fromJson(
              json['AwsEc2SecurityGroup'] as Map<String, dynamic>)
          : null,
      awsEc2Subnet: json['AwsEc2Subnet'] != null
          ? AwsEc2SubnetDetails.fromJson(
              json['AwsEc2Subnet'] as Map<String, dynamic>)
          : null,
      awsEc2Volume: json['AwsEc2Volume'] != null
          ? AwsEc2VolumeDetails.fromJson(
              json['AwsEc2Volume'] as Map<String, dynamic>)
          : null,
      awsEc2Vpc: json['AwsEc2Vpc'] != null
          ? AwsEc2VpcDetails.fromJson(json['AwsEc2Vpc'] as Map<String, dynamic>)
          : null,
      awsEcsCluster: json['AwsEcsCluster'] != null
          ? AwsEcsClusterDetails.fromJson(
              json['AwsEcsCluster'] as Map<String, dynamic>)
          : null,
      awsEcsTaskDefinition: json['AwsEcsTaskDefinition'] != null
          ? AwsEcsTaskDefinitionDetails.fromJson(
              json['AwsEcsTaskDefinition'] as Map<String, dynamic>)
          : null,
      awsElasticBeanstalkEnvironment: json['AwsElasticBeanstalkEnvironment'] !=
              null
          ? AwsElasticBeanstalkEnvironmentDetails.fromJson(
              json['AwsElasticBeanstalkEnvironment'] as Map<String, dynamic>)
          : null,
      awsElasticsearchDomain: json['AwsElasticsearchDomain'] != null
          ? AwsElasticsearchDomainDetails.fromJson(
              json['AwsElasticsearchDomain'] as Map<String, dynamic>)
          : null,
      awsElbLoadBalancer: json['AwsElbLoadBalancer'] != null
          ? AwsElbLoadBalancerDetails.fromJson(
              json['AwsElbLoadBalancer'] as Map<String, dynamic>)
          : null,
      awsElbv2LoadBalancer: json['AwsElbv2LoadBalancer'] != null
          ? AwsElbv2LoadBalancerDetails.fromJson(
              json['AwsElbv2LoadBalancer'] as Map<String, dynamic>)
          : null,
      awsIamAccessKey: json['AwsIamAccessKey'] != null
          ? AwsIamAccessKeyDetails.fromJson(
              json['AwsIamAccessKey'] as Map<String, dynamic>)
          : null,
      awsIamGroup: json['AwsIamGroup'] != null
          ? AwsIamGroupDetails.fromJson(
              json['AwsIamGroup'] as Map<String, dynamic>)
          : null,
      awsIamPolicy: json['AwsIamPolicy'] != null
          ? AwsIamPolicyDetails.fromJson(
              json['AwsIamPolicy'] as Map<String, dynamic>)
          : null,
      awsIamRole: json['AwsIamRole'] != null
          ? AwsIamRoleDetails.fromJson(
              json['AwsIamRole'] as Map<String, dynamic>)
          : null,
      awsIamUser: json['AwsIamUser'] != null
          ? AwsIamUserDetails.fromJson(
              json['AwsIamUser'] as Map<String, dynamic>)
          : null,
      awsKmsKey: json['AwsKmsKey'] != null
          ? AwsKmsKeyDetails.fromJson(json['AwsKmsKey'] as Map<String, dynamic>)
          : null,
      awsLambdaFunction: json['AwsLambdaFunction'] != null
          ? AwsLambdaFunctionDetails.fromJson(
              json['AwsLambdaFunction'] as Map<String, dynamic>)
          : null,
      awsLambdaLayerVersion: json['AwsLambdaLayerVersion'] != null
          ? AwsLambdaLayerVersionDetails.fromJson(
              json['AwsLambdaLayerVersion'] as Map<String, dynamic>)
          : null,
      awsRdsDbCluster: json['AwsRdsDbCluster'] != null
          ? AwsRdsDbClusterDetails.fromJson(
              json['AwsRdsDbCluster'] as Map<String, dynamic>)
          : null,
      awsRdsDbClusterSnapshot: json['AwsRdsDbClusterSnapshot'] != null
          ? AwsRdsDbClusterSnapshotDetails.fromJson(
              json['AwsRdsDbClusterSnapshot'] as Map<String, dynamic>)
          : null,
      awsRdsDbInstance: json['AwsRdsDbInstance'] != null
          ? AwsRdsDbInstanceDetails.fromJson(
              json['AwsRdsDbInstance'] as Map<String, dynamic>)
          : null,
      awsRdsDbSnapshot: json['AwsRdsDbSnapshot'] != null
          ? AwsRdsDbSnapshotDetails.fromJson(
              json['AwsRdsDbSnapshot'] as Map<String, dynamic>)
          : null,
      awsRedshiftCluster: json['AwsRedshiftCluster'] != null
          ? AwsRedshiftClusterDetails.fromJson(
              json['AwsRedshiftCluster'] as Map<String, dynamic>)
          : null,
      awsS3AccountPublicAccessBlock:
          json['AwsS3AccountPublicAccessBlock'] != null
              ? AwsS3AccountPublicAccessBlockDetails.fromJson(
                  json['AwsS3AccountPublicAccessBlock'] as Map<String, dynamic>)
              : null,
      awsS3Bucket: json['AwsS3Bucket'] != null
          ? AwsS3BucketDetails.fromJson(
              json['AwsS3Bucket'] as Map<String, dynamic>)
          : null,
      awsS3Object: json['AwsS3Object'] != null
          ? AwsS3ObjectDetails.fromJson(
              json['AwsS3Object'] as Map<String, dynamic>)
          : null,
      awsSecretsManagerSecret: json['AwsSecretsManagerSecret'] != null
          ? AwsSecretsManagerSecretDetails.fromJson(
              json['AwsSecretsManagerSecret'] as Map<String, dynamic>)
          : null,
      awsSnsTopic: json['AwsSnsTopic'] != null
          ? AwsSnsTopicDetails.fromJson(
              json['AwsSnsTopic'] as Map<String, dynamic>)
          : null,
      awsSqsQueue: json['AwsSqsQueue'] != null
          ? AwsSqsQueueDetails.fromJson(
              json['AwsSqsQueue'] as Map<String, dynamic>)
          : null,
      awsSsmPatchCompliance: json['AwsSsmPatchCompliance'] != null
          ? AwsSsmPatchComplianceDetails.fromJson(
              json['AwsSsmPatchCompliance'] as Map<String, dynamic>)
          : null,
      awsWafWebAcl: json['AwsWafWebAcl'] != null
          ? AwsWafWebAclDetails.fromJson(
              json['AwsWafWebAcl'] as Map<String, dynamic>)
          : null,
      container: json['Container'] != null
          ? ContainerDetails.fromJson(json['Container'] as Map<String, dynamic>)
          : null,
      other: (json['Other'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsApiGatewayRestApi = this.awsApiGatewayRestApi;
    final awsApiGatewayStage = this.awsApiGatewayStage;
    final awsApiGatewayV2Api = this.awsApiGatewayV2Api;
    final awsApiGatewayV2Stage = this.awsApiGatewayV2Stage;
    final awsAutoScalingAutoScalingGroup = this.awsAutoScalingAutoScalingGroup;
    final awsCertificateManagerCertificate =
        this.awsCertificateManagerCertificate;
    final awsCloudFrontDistribution = this.awsCloudFrontDistribution;
    final awsCloudTrailTrail = this.awsCloudTrailTrail;
    final awsCodeBuildProject = this.awsCodeBuildProject;
    final awsDynamoDbTable = this.awsDynamoDbTable;
    final awsEc2Eip = this.awsEc2Eip;
    final awsEc2Instance = this.awsEc2Instance;
    final awsEc2NetworkAcl = this.awsEc2NetworkAcl;
    final awsEc2NetworkInterface = this.awsEc2NetworkInterface;
    final awsEc2SecurityGroup = this.awsEc2SecurityGroup;
    final awsEc2Subnet = this.awsEc2Subnet;
    final awsEc2Volume = this.awsEc2Volume;
    final awsEc2Vpc = this.awsEc2Vpc;
    final awsEcsCluster = this.awsEcsCluster;
    final awsEcsTaskDefinition = this.awsEcsTaskDefinition;
    final awsElasticBeanstalkEnvironment = this.awsElasticBeanstalkEnvironment;
    final awsElasticsearchDomain = this.awsElasticsearchDomain;
    final awsElbLoadBalancer = this.awsElbLoadBalancer;
    final awsElbv2LoadBalancer = this.awsElbv2LoadBalancer;
    final awsIamAccessKey = this.awsIamAccessKey;
    final awsIamGroup = this.awsIamGroup;
    final awsIamPolicy = this.awsIamPolicy;
    final awsIamRole = this.awsIamRole;
    final awsIamUser = this.awsIamUser;
    final awsKmsKey = this.awsKmsKey;
    final awsLambdaFunction = this.awsLambdaFunction;
    final awsLambdaLayerVersion = this.awsLambdaLayerVersion;
    final awsRdsDbCluster = this.awsRdsDbCluster;
    final awsRdsDbClusterSnapshot = this.awsRdsDbClusterSnapshot;
    final awsRdsDbInstance = this.awsRdsDbInstance;
    final awsRdsDbSnapshot = this.awsRdsDbSnapshot;
    final awsRedshiftCluster = this.awsRedshiftCluster;
    final awsS3AccountPublicAccessBlock = this.awsS3AccountPublicAccessBlock;
    final awsS3Bucket = this.awsS3Bucket;
    final awsS3Object = this.awsS3Object;
    final awsSecretsManagerSecret = this.awsSecretsManagerSecret;
    final awsSnsTopic = this.awsSnsTopic;
    final awsSqsQueue = this.awsSqsQueue;
    final awsSsmPatchCompliance = this.awsSsmPatchCompliance;
    final awsWafWebAcl = this.awsWafWebAcl;
    final container = this.container;
    final other = this.other;
    return {
      if (awsApiGatewayRestApi != null)
        'AwsApiGatewayRestApi': awsApiGatewayRestApi,
      if (awsApiGatewayStage != null) 'AwsApiGatewayStage': awsApiGatewayStage,
      if (awsApiGatewayV2Api != null) 'AwsApiGatewayV2Api': awsApiGatewayV2Api,
      if (awsApiGatewayV2Stage != null)
        'AwsApiGatewayV2Stage': awsApiGatewayV2Stage,
      if (awsAutoScalingAutoScalingGroup != null)
        'AwsAutoScalingAutoScalingGroup': awsAutoScalingAutoScalingGroup,
      if (awsCertificateManagerCertificate != null)
        'AwsCertificateManagerCertificate': awsCertificateManagerCertificate,
      if (awsCloudFrontDistribution != null)
        'AwsCloudFrontDistribution': awsCloudFrontDistribution,
      if (awsCloudTrailTrail != null) 'AwsCloudTrailTrail': awsCloudTrailTrail,
      if (awsCodeBuildProject != null)
        'AwsCodeBuildProject': awsCodeBuildProject,
      if (awsDynamoDbTable != null) 'AwsDynamoDbTable': awsDynamoDbTable,
      if (awsEc2Eip != null) 'AwsEc2Eip': awsEc2Eip,
      if (awsEc2Instance != null) 'AwsEc2Instance': awsEc2Instance,
      if (awsEc2NetworkAcl != null) 'AwsEc2NetworkAcl': awsEc2NetworkAcl,
      if (awsEc2NetworkInterface != null)
        'AwsEc2NetworkInterface': awsEc2NetworkInterface,
      if (awsEc2SecurityGroup != null)
        'AwsEc2SecurityGroup': awsEc2SecurityGroup,
      if (awsEc2Subnet != null) 'AwsEc2Subnet': awsEc2Subnet,
      if (awsEc2Volume != null) 'AwsEc2Volume': awsEc2Volume,
      if (awsEc2Vpc != null) 'AwsEc2Vpc': awsEc2Vpc,
      if (awsEcsCluster != null) 'AwsEcsCluster': awsEcsCluster,
      if (awsEcsTaskDefinition != null)
        'AwsEcsTaskDefinition': awsEcsTaskDefinition,
      if (awsElasticBeanstalkEnvironment != null)
        'AwsElasticBeanstalkEnvironment': awsElasticBeanstalkEnvironment,
      if (awsElasticsearchDomain != null)
        'AwsElasticsearchDomain': awsElasticsearchDomain,
      if (awsElbLoadBalancer != null) 'AwsElbLoadBalancer': awsElbLoadBalancer,
      if (awsElbv2LoadBalancer != null)
        'AwsElbv2LoadBalancer': awsElbv2LoadBalancer,
      if (awsIamAccessKey != null) 'AwsIamAccessKey': awsIamAccessKey,
      if (awsIamGroup != null) 'AwsIamGroup': awsIamGroup,
      if (awsIamPolicy != null) 'AwsIamPolicy': awsIamPolicy,
      if (awsIamRole != null) 'AwsIamRole': awsIamRole,
      if (awsIamUser != null) 'AwsIamUser': awsIamUser,
      if (awsKmsKey != null) 'AwsKmsKey': awsKmsKey,
      if (awsLambdaFunction != null) 'AwsLambdaFunction': awsLambdaFunction,
      if (awsLambdaLayerVersion != null)
        'AwsLambdaLayerVersion': awsLambdaLayerVersion,
      if (awsRdsDbCluster != null) 'AwsRdsDbCluster': awsRdsDbCluster,
      if (awsRdsDbClusterSnapshot != null)
        'AwsRdsDbClusterSnapshot': awsRdsDbClusterSnapshot,
      if (awsRdsDbInstance != null) 'AwsRdsDbInstance': awsRdsDbInstance,
      if (awsRdsDbSnapshot != null) 'AwsRdsDbSnapshot': awsRdsDbSnapshot,
      if (awsRedshiftCluster != null) 'AwsRedshiftCluster': awsRedshiftCluster,
      if (awsS3AccountPublicAccessBlock != null)
        'AwsS3AccountPublicAccessBlock': awsS3AccountPublicAccessBlock,
      if (awsS3Bucket != null) 'AwsS3Bucket': awsS3Bucket,
      if (awsS3Object != null) 'AwsS3Object': awsS3Object,
      if (awsSecretsManagerSecret != null)
        'AwsSecretsManagerSecret': awsSecretsManagerSecret,
      if (awsSnsTopic != null) 'AwsSnsTopic': awsSnsTopic,
      if (awsSqsQueue != null) 'AwsSqsQueue': awsSqsQueue,
      if (awsSsmPatchCompliance != null)
        'AwsSsmPatchCompliance': awsSsmPatchCompliance,
      if (awsWafWebAcl != null) 'AwsWafWebAcl': awsWafWebAcl,
      if (container != null) 'Container': container,
      if (other != null) 'Other': other,
    };
  }
}

/// Details about the account that was not processed.
class Result {
  /// An AWS account ID of the account that was not processed.
  final String? accountId;

  /// The reason that the account was not processed.
  final String? processingResult;

  Result({
    this.accountId,
    this.processingResult,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      accountId: json['AccountId'] as String?,
      processingResult: json['ProcessingResult'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final processingResult = this.processingResult;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (processingResult != null) 'ProcessingResult': processingResult,
    };
  }
}

/// The list of detected instances of sensitive data.
class SensitiveDataDetections {
  /// The total number of occurrences of sensitive data that were detected.
  final int? count;

  /// Details about the sensitive data that was detected.
  final Occurrences? occurrences;

  /// The type of sensitive data that was detected. For example, the type might
  /// indicate that the data is an email address.
  final String? type;

  SensitiveDataDetections({
    this.count,
    this.occurrences,
    this.type,
  });

  factory SensitiveDataDetections.fromJson(Map<String, dynamic> json) {
    return SensitiveDataDetections(
      count: json['Count'] as int?,
      occurrences: json['Occurrences'] != null
          ? Occurrences.fromJson(json['Occurrences'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final occurrences = this.occurrences;
    final type = this.type;
    return {
      if (count != null) 'Count': count,
      if (occurrences != null) 'Occurrences': occurrences,
      if (type != null) 'Type': type,
    };
  }
}

/// Contains a detected instance of sensitive data that are based on built-in
/// identifiers.
class SensitiveDataResult {
  /// The category of sensitive data that was detected. For example, the category
  /// can indicate that the sensitive data involved credentials, financial
  /// information, or personal information.
  final String? category;

  /// The list of detected instances of sensitive data.
  final List<SensitiveDataDetections>? detections;

  /// The total number of occurrences of sensitive data.
  final int? totalCount;

  SensitiveDataResult({
    this.category,
    this.detections,
    this.totalCount,
  });

  factory SensitiveDataResult.fromJson(Map<String, dynamic> json) {
    return SensitiveDataResult(
      category: json['Category'] as String?,
      detections: (json['Detections'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SensitiveDataDetections.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final detections = this.detections;
    final totalCount = this.totalCount;
    return {
      if (category != null) 'Category': category,
      if (detections != null) 'Detections': detections,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// The severity of the finding.
///
/// The finding provider can provide the initial severity. The finding provider
/// can only update the severity if it has not been updated using
/// <code>BatchUpdateFindings</code>.
///
/// The finding must have either <code>Label</code> or <code>Normalized</code>
/// populated. If only one of these attributes is populated, then Security Hub
/// automatically populates the other one. If neither attribute is populated,
/// then the finding is invalid. <code>Label</code> is the preferred attribute.
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
  /// If you provide <code>Normalized</code> and do not provide
  /// <code>Label</code>, then <code>Label</code> is set automatically as follows.
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
  final SeverityLabel? label;

  /// Deprecated. The normalized severity of a finding. This attribute is being
  /// deprecated. Instead of providing <code>Normalized</code>, provide
  /// <code>Label</code>.
  ///
  /// If you provide <code>Label</code> and do not provide
  /// <code>Normalized</code>, then <code>Normalized</code> is set automatically
  /// as follows.
  ///
  /// <ul>
  /// <li>
  /// <code>INFORMATIONAL</code> - 0
  /// </li>
  /// <li>
  /// <code>LOW</code> - 1
  /// </li>
  /// <li>
  /// <code>MEDIUM</code> - 40
  /// </li>
  /// <li>
  /// <code>HIGH</code> - 70
  /// </li>
  /// <li>
  /// <code>CRITICAL</code> - 90
  /// </li>
  /// </ul>
  final int? normalized;

  /// The native severity from the finding product that generated the finding.
  final String? original;

  /// Deprecated. This attribute is being deprecated. Instead of providing
  /// <code>Product</code>, provide <code>Original</code>.
  ///
  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  final double? product;

  Severity({
    this.label,
    this.normalized,
    this.original,
    this.product,
  });

  factory Severity.fromJson(Map<String, dynamic> json) {
    return Severity(
      label: (json['Label'] as String?)?.toSeverityLabel(),
      normalized: json['Normalized'] as int?,
      original: json['Original'] as String?,
      product: json['Product'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final normalized = this.normalized;
    final original = this.original;
    final product = this.product;
    return {
      if (label != null) 'Label': label.toValue(),
      if (normalized != null) 'Normalized': normalized,
      if (original != null) 'Original': original,
      if (product != null) 'Product': product,
    };
  }
}

enum SeverityLabel {
  informational,
  low,
  medium,
  high,
  critical,
}

extension on SeverityLabel {
  String toValue() {
    switch (this) {
      case SeverityLabel.informational:
        return 'INFORMATIONAL';
      case SeverityLabel.low:
        return 'LOW';
      case SeverityLabel.medium:
        return 'MEDIUM';
      case SeverityLabel.high:
        return 'HIGH';
      case SeverityLabel.critical:
        return 'CRITICAL';
    }
  }
}

extension on String {
  SeverityLabel toSeverityLabel() {
    switch (this) {
      case 'INFORMATIONAL':
        return SeverityLabel.informational;
      case 'LOW':
        return SeverityLabel.low;
      case 'MEDIUM':
        return SeverityLabel.medium;
      case 'HIGH':
        return SeverityLabel.high;
      case 'CRITICAL':
        return SeverityLabel.critical;
    }
    throw Exception('$this is not known in enum SeverityLabel');
  }
}

enum SeverityRating {
  low,
  medium,
  high,
  critical,
}

extension on SeverityRating {
  String toValue() {
    switch (this) {
      case SeverityRating.low:
        return 'LOW';
      case SeverityRating.medium:
        return 'MEDIUM';
      case SeverityRating.high:
        return 'HIGH';
      case SeverityRating.critical:
        return 'CRITICAL';
    }
  }
}

extension on String {
  SeverityRating toSeverityRating() {
    switch (this) {
      case 'LOW':
        return SeverityRating.low;
      case 'MEDIUM':
        return SeverityRating.medium;
      case 'HIGH':
        return SeverityRating.high;
      case 'CRITICAL':
        return SeverityRating.critical;
    }
    throw Exception('$this is not known in enum SeverityRating');
  }
}

/// Updates to the severity information for a finding.
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
  final SeverityLabel? label;

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
  final int? normalized;

  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  final double? product;

  SeverityUpdate({
    this.label,
    this.normalized,
    this.product,
  });

  factory SeverityUpdate.fromJson(Map<String, dynamic> json) {
    return SeverityUpdate(
      label: (json['Label'] as String?)?.toSeverityLabel(),
      normalized: json['Normalized'] as int?,
      product: json['Product'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final normalized = this.normalized;
    final product = this.product;
    return {
      if (label != null) 'Label': label.toValue(),
      if (normalized != null) 'Normalized': normalized,
      if (product != null) 'Product': product,
    };
  }
}

/// Information about a software package.
class SoftwarePackage {
  /// The architecture used for the software package.
  final String? architecture;

  /// The epoch of the software package.
  final String? epoch;

  /// The name of the software package.
  final String? name;

  /// The release of the software package.
  final String? release;

  /// The version of the software package.
  final String? version;

  SoftwarePackage({
    this.architecture,
    this.epoch,
    this.name,
    this.release,
    this.version,
  });

  factory SoftwarePackage.fromJson(Map<String, dynamic> json) {
    return SoftwarePackage(
      architecture: json['Architecture'] as String?,
      epoch: json['Epoch'] as String?,
      name: json['Name'] as String?,
      release: json['Release'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final epoch = this.epoch;
    final name = this.name;
    final release = this.release;
    final version = this.version;
    return {
      if (architecture != null) 'Architecture': architecture,
      if (epoch != null) 'Epoch': epoch,
      if (name != null) 'Name': name,
      if (release != null) 'Release': release,
      if (version != null) 'Version': version,
    };
  }
}

/// A collection of finding attributes used to sort findings.
class SortCriterion {
  /// The finding attribute used to sort findings.
  final String? field;

  /// The order used to sort findings.
  final SortOrder? sortOrder;

  SortCriterion({
    this.field,
    this.sortOrder,
  });

  factory SortCriterion.fromJson(Map<String, dynamic> json) {
    return SortCriterion(
      field: json['Field'] as String?,
      sortOrder: (json['SortOrder'] as String?)?.toSortOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final sortOrder = this.sortOrder;
    return {
      if (field != null) 'Field': field,
      if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
    };
  }
}

enum SortOrder {
  asc,
  desc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'asc';
      case SortOrder.desc:
        return 'desc';
    }
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'asc':
        return SortOrder.asc;
      case 'desc':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Provides information about a specific standard.
class Standard {
  /// A description of the standard.
  final String? description;

  /// Whether the standard is enabled by default. When Security Hub is enabled
  /// from the console, if a standard is enabled by default, the check box for
  /// that standard is selected by default.
  ///
  /// When Security Hub is enabled using the <code>EnableSecurityHub</code> API
  /// operation, the standard is enabled by default unless
  /// <code>EnableDefaultStandards</code> is set to <code>false</code>.
  final bool? enabledByDefault;

  /// The name of the standard.
  final String? name;

  /// The ARN of a standard.
  final String? standardsArn;

  Standard({
    this.description,
    this.enabledByDefault,
    this.name,
    this.standardsArn,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return Standard(
      description: json['Description'] as String?,
      enabledByDefault: json['EnabledByDefault'] as bool?,
      name: json['Name'] as String?,
      standardsArn: json['StandardsArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final enabledByDefault = this.enabledByDefault;
    final name = this.name;
    final standardsArn = this.standardsArn;
    return {
      if (description != null) 'Description': description,
      if (enabledByDefault != null) 'EnabledByDefault': enabledByDefault,
      if (name != null) 'Name': name,
      if (standardsArn != null) 'StandardsArn': standardsArn,
    };
  }
}

/// Details for an individual security standard control.
class StandardsControl {
  /// The identifier of the security standard control.
  final String? controlId;

  /// The current status of the security standard control. Indicates whether the
  /// control is enabled or disabled. Security Hub does not check against disabled
  /// controls.
  final ControlStatus? controlStatus;

  /// The date and time that the status of the security standard control was most
  /// recently updated.
  final DateTime? controlStatusUpdatedAt;

  /// The longer description of the security standard control. Provides
  /// information about what the control is checking for.
  final String? description;

  /// The reason provided for the most recent change in status for the control.
  final String? disabledReason;

  /// The list of requirements that are related to this control.
  final List<String>? relatedRequirements;

  /// A link to remediation information for the control in the Security Hub user
  /// documentation.
  final String? remediationUrl;

  /// The severity of findings generated from this security standard control.
  ///
  /// The finding severity is based on an assessment of how easy it would be to
  /// compromise AWS resources if the issue is detected.
  final SeverityRating? severityRating;

  /// The ARN of the security standard control.
  final String? standardsControlArn;

  /// The title of the security standard control.
  final String? title;

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

  factory StandardsControl.fromJson(Map<String, dynamic> json) {
    return StandardsControl(
      controlId: json['ControlId'] as String?,
      controlStatus: (json['ControlStatus'] as String?)?.toControlStatus(),
      controlStatusUpdatedAt: timeStampFromJson(json['ControlStatusUpdatedAt']),
      description: json['Description'] as String?,
      disabledReason: json['DisabledReason'] as String?,
      relatedRequirements: (json['RelatedRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      remediationUrl: json['RemediationUrl'] as String?,
      severityRating: (json['SeverityRating'] as String?)?.toSeverityRating(),
      standardsControlArn: json['StandardsControlArn'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlId = this.controlId;
    final controlStatus = this.controlStatus;
    final controlStatusUpdatedAt = this.controlStatusUpdatedAt;
    final description = this.description;
    final disabledReason = this.disabledReason;
    final relatedRequirements = this.relatedRequirements;
    final remediationUrl = this.remediationUrl;
    final severityRating = this.severityRating;
    final standardsControlArn = this.standardsControlArn;
    final title = this.title;
    return {
      if (controlId != null) 'ControlId': controlId,
      if (controlStatus != null) 'ControlStatus': controlStatus.toValue(),
      if (controlStatusUpdatedAt != null)
        'ControlStatusUpdatedAt': iso8601ToJson(controlStatusUpdatedAt),
      if (description != null) 'Description': description,
      if (disabledReason != null) 'DisabledReason': disabledReason,
      if (relatedRequirements != null)
        'RelatedRequirements': relatedRequirements,
      if (remediationUrl != null) 'RemediationUrl': remediationUrl,
      if (severityRating != null) 'SeverityRating': severityRating.toValue(),
      if (standardsControlArn != null)
        'StandardsControlArn': standardsControlArn,
      if (title != null) 'Title': title,
    };
  }
}

enum StandardsStatus {
  pending,
  ready,
  failed,
  deleting,
  incomplete,
}

extension on StandardsStatus {
  String toValue() {
    switch (this) {
      case StandardsStatus.pending:
        return 'PENDING';
      case StandardsStatus.ready:
        return 'READY';
      case StandardsStatus.failed:
        return 'FAILED';
      case StandardsStatus.deleting:
        return 'DELETING';
      case StandardsStatus.incomplete:
        return 'INCOMPLETE';
    }
  }
}

extension on String {
  StandardsStatus toStandardsStatus() {
    switch (this) {
      case 'PENDING':
        return StandardsStatus.pending;
      case 'READY':
        return StandardsStatus.ready;
      case 'FAILED':
        return StandardsStatus.failed;
      case 'DELETING':
        return StandardsStatus.deleting;
      case 'INCOMPLETE':
        return StandardsStatus.incomplete;
    }
    throw Exception('$this is not known in enum StandardsStatus');
  }
}

/// A resource that represents your subscription to a supported standard.
class StandardsSubscription {
  /// The ARN of a standard.
  final String standardsArn;

  /// A key-value pair of input for the standard.
  final Map<String, String> standardsInput;

  /// The status of the standard subscription.
  ///
  /// The status values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - Standard is in the process of being enabled.
  /// </li>
  /// <li>
  /// <code>READY</code> - Standard is enabled.
  /// </li>
  /// <li>
  /// <code>INCOMPLETE</code> - Standard could not be enabled completely. Some
  /// controls may not be available.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Standard is in the process of being disabled.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Standard could not be disabled.
  /// </li>
  /// </ul>
  final StandardsStatus standardsStatus;

  /// The ARN of a resource that represents your subscription to a supported
  /// standard.
  final String standardsSubscriptionArn;

  StandardsSubscription({
    required this.standardsArn,
    required this.standardsInput,
    required this.standardsStatus,
    required this.standardsSubscriptionArn,
  });

  factory StandardsSubscription.fromJson(Map<String, dynamic> json) {
    return StandardsSubscription(
      standardsArn: json['StandardsArn'] as String,
      standardsInput: (json['StandardsInput'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      standardsStatus: (json['StandardsStatus'] as String).toStandardsStatus(),
      standardsSubscriptionArn: json['StandardsSubscriptionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final standardsArn = this.standardsArn;
    final standardsInput = this.standardsInput;
    final standardsStatus = this.standardsStatus;
    final standardsSubscriptionArn = this.standardsSubscriptionArn;
    return {
      'StandardsArn': standardsArn,
      'StandardsInput': standardsInput,
      'StandardsStatus': standardsStatus.toValue(),
      'StandardsSubscriptionArn': standardsSubscriptionArn,
    };
  }
}

/// The standard that you want to enable.
class StandardsSubscriptionRequest {
  /// The ARN of the standard that you want to enable. To view the list of
  /// available standards and their ARNs, use the <code> <a>DescribeStandards</a>
  /// </code> operation.
  final String standardsArn;

  /// A key-value pair of input for the standard.
  final Map<String, String>? standardsInput;

  StandardsSubscriptionRequest({
    required this.standardsArn,
    this.standardsInput,
  });

  factory StandardsSubscriptionRequest.fromJson(Map<String, dynamic> json) {
    return StandardsSubscriptionRequest(
      standardsArn: json['StandardsArn'] as String,
      standardsInput: (json['StandardsInput'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final standardsArn = this.standardsArn;
    final standardsInput = this.standardsInput;
    return {
      'StandardsArn': standardsArn,
      if (standardsInput != null) 'StandardsInput': standardsInput,
    };
  }
}

/// Provides additional context for the value of <code>Compliance.Status</code>.
class StatusReason {
  /// A code that represents a reason for the control status. For the list of
  /// status reason codes and their meanings, see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff">Standards-related
  /// information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>.
  final String reasonCode;

  /// The corresponding description for the status reason code.
  final String? description;

  StatusReason({
    required this.reasonCode,
    this.description,
  });

  factory StatusReason.fromJson(Map<String, dynamic> json) {
    return StatusReason(
      reasonCode: json['ReasonCode'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reasonCode = this.reasonCode;
    final description = this.description;
    return {
      'ReasonCode': reasonCode,
      if (description != null) 'Description': description,
    };
  }
}

/// A string filter for querying findings.
class StringFilter {
  /// The condition to apply to a string value when querying for findings. To
  /// search for values that contain the filter criteria value, use one of the
  /// following comparison operators:
  ///
  /// <ul>
  /// <li>
  /// To search for values that exactly match the filter value, use
  /// <code>EQUALS</code>.
  ///
  /// For example, the filter <code>ResourceType EQUALS AwsEc2SecurityGroup</code>
  /// only matches findings that have a resource type of
  /// <code>AwsEc2SecurityGroup</code>.
  /// </li>
  /// <li>
  /// To search for values that start with the filter value, use
  /// <code>PREFIX</code>.
  ///
  /// For example, the filter <code>ResourceType PREFIX AwsIam</code> matches
  /// findings that have a resource type that starts with <code>AwsIam</code>.
  /// Findings with a resource type of <code>AwsIamPolicy</code>,
  /// <code>AwsIamRole</code>, or <code>AwsIamUser</code> would all match.
  /// </li>
  /// </ul>
  /// <code>EQUALS</code> and <code>PREFIX</code> filters on the same field are
  /// joined by <code>OR</code>. A finding matches if it matches any one of those
  /// filters.
  ///
  /// To search for values that do not contain the filter criteria value, use one
  /// of the following comparison operators:
  ///
  /// <ul>
  /// <li>
  /// To search for values that do not exactly match the filter value, use
  /// <code>NOT_EQUALS</code>.
  ///
  /// For example, the filter <code>ResourceType NOT_EQUALS AwsIamPolicy</code>
  /// matches findings that have a resource type other than
  /// <code>AwsIamPolicy</code>.
  /// </li>
  /// <li>
  /// To search for values that do not start with the filter value, use
  /// <code>PREFIX_NOT_EQUALS</code>.
  ///
  /// For example, the filter <code>ResourceType PREFIX_NOT_EQUALS AwsIam</code>
  /// matches findings that have a resource type that does not start with
  /// <code>AwsIam</code>. Findings with a resource type of
  /// <code>AwsIamPolicy</code>, <code>AwsIamRole</code>, or
  /// <code>AwsIamUser</code> would all be excluded from the results.
  /// </li>
  /// </ul>
  /// <code>NOT_EQUALS</code> and <code>PREFIX_NOT_EQUALS</code> filters on the
  /// same field are joined by <code>AND</code>. A finding matches only if it
  /// matches all of those filters.
  ///
  /// For filters on the same field, you cannot provide both an
  /// <code>EQUALS</code> filter and a <code>NOT_EQUALS</code> or
  /// <code>PREFIX_NOT_EQUALS</code> filter. Combining filters in this way always
  /// returns an error, even if the provided filter values would return valid
  /// results.
  ///
  /// You can combine <code>PREFIX</code> filters with <code>NOT_EQUALS</code> or
  /// <code>PREFIX_NOT_EQUALS</code> filters for the same field. Security Hub
  /// first processes the <code>PREFIX</code> filters, then the
  /// <code>NOT_EQUALS</code> or <code>PREFIX_NOT_EQUALS</code> filters.
  ///
  /// For example, for the following filter, Security Hub first identifies
  /// findings that have resource types that start with either <code>AwsIAM</code>
  /// or <code>AwsEc2</code>. It then excludes findings that have a resource type
  /// of <code>AwsIamPolicy</code> and findings that have a resource type of
  /// <code>AwsEc2NetworkInterface</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>ResourceType PREFIX AwsIam</code>
  /// </li>
  /// <li>
  /// <code>ResourceType PREFIX AwsEc2</code>
  /// </li>
  /// <li>
  /// <code>ResourceType NOT_EQUALS AwsIamPolicy</code>
  /// </li>
  /// <li>
  /// <code>ResourceType NOT_EQUALS AwsEc2NetworkInterface</code>
  /// </li>
  /// </ul>
  final StringFilterComparison? comparison;

  /// The string filter value. Filter values are case sensitive. For example, the
  /// product name for control-based findings is <code>Security Hub</code>. If you
  /// provide <code>security hub</code> as the filter text, then there is no
  /// match.
  final String? value;

  StringFilter({
    this.comparison,
    this.value,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) {
    return StringFilter(
      comparison: (json['Comparison'] as String?)?.toStringFilterComparison(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      if (comparison != null) 'Comparison': comparison.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum StringFilterComparison {
  equals,
  prefix,
  notEquals,
  prefixNotEquals,
}

extension on StringFilterComparison {
  String toValue() {
    switch (this) {
      case StringFilterComparison.equals:
        return 'EQUALS';
      case StringFilterComparison.prefix:
        return 'PREFIX';
      case StringFilterComparison.notEquals:
        return 'NOT_EQUALS';
      case StringFilterComparison.prefixNotEquals:
        return 'PREFIX_NOT_EQUALS';
    }
  }
}

extension on String {
  StringFilterComparison toStringFilterComparison() {
    switch (this) {
      case 'EQUALS':
        return StringFilterComparison.equals;
      case 'PREFIX':
        return StringFilterComparison.prefix;
      case 'NOT_EQUALS':
        return StringFilterComparison.notEquals;
      case 'PREFIX_NOT_EQUALS':
        return StringFilterComparison.prefixNotEquals;
    }
    throw Exception('$this is not known in enum StringFilterComparison');
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

/// Details about the threat intelligence related to a finding.
class ThreatIntelIndicator {
  /// The category of a threat intelligence indicator.
  final ThreatIntelIndicatorCategory? category;

  /// Indicates when the most recent instance of a threat intelligence indicator
  /// was observed.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? lastObservedAt;

  /// The source of the threat intelligence indicator.
  final String? source;

  /// The URL to the page or site where you can get more information about the
  /// threat intelligence indicator.
  final String? sourceUrl;

  /// The type of threat intelligence indicator.
  final ThreatIntelIndicatorType? type;

  /// The value of a threat intelligence indicator.
  final String? value;

  ThreatIntelIndicator({
    this.category,
    this.lastObservedAt,
    this.source,
    this.sourceUrl,
    this.type,
    this.value,
  });

  factory ThreatIntelIndicator.fromJson(Map<String, dynamic> json) {
    return ThreatIntelIndicator(
      category: (json['Category'] as String?)?.toThreatIntelIndicatorCategory(),
      lastObservedAt: json['LastObservedAt'] as String?,
      source: json['Source'] as String?,
      sourceUrl: json['SourceUrl'] as String?,
      type: (json['Type'] as String?)?.toThreatIntelIndicatorType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final lastObservedAt = this.lastObservedAt;
    final source = this.source;
    final sourceUrl = this.sourceUrl;
    final type = this.type;
    final value = this.value;
    return {
      if (category != null) 'Category': category.toValue(),
      if (lastObservedAt != null) 'LastObservedAt': lastObservedAt,
      if (source != null) 'Source': source,
      if (sourceUrl != null) 'SourceUrl': sourceUrl,
      if (type != null) 'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum ThreatIntelIndicatorCategory {
  backdoor,
  cardStealer,
  commandAndControl,
  dropSite,
  exploitSite,
  keylogger,
}

extension on ThreatIntelIndicatorCategory {
  String toValue() {
    switch (this) {
      case ThreatIntelIndicatorCategory.backdoor:
        return 'BACKDOOR';
      case ThreatIntelIndicatorCategory.cardStealer:
        return 'CARD_STEALER';
      case ThreatIntelIndicatorCategory.commandAndControl:
        return 'COMMAND_AND_CONTROL';
      case ThreatIntelIndicatorCategory.dropSite:
        return 'DROP_SITE';
      case ThreatIntelIndicatorCategory.exploitSite:
        return 'EXPLOIT_SITE';
      case ThreatIntelIndicatorCategory.keylogger:
        return 'KEYLOGGER';
    }
  }
}

extension on String {
  ThreatIntelIndicatorCategory toThreatIntelIndicatorCategory() {
    switch (this) {
      case 'BACKDOOR':
        return ThreatIntelIndicatorCategory.backdoor;
      case 'CARD_STEALER':
        return ThreatIntelIndicatorCategory.cardStealer;
      case 'COMMAND_AND_CONTROL':
        return ThreatIntelIndicatorCategory.commandAndControl;
      case 'DROP_SITE':
        return ThreatIntelIndicatorCategory.dropSite;
      case 'EXPLOIT_SITE':
        return ThreatIntelIndicatorCategory.exploitSite;
      case 'KEYLOGGER':
        return ThreatIntelIndicatorCategory.keylogger;
    }
    throw Exception('$this is not known in enum ThreatIntelIndicatorCategory');
  }
}

enum ThreatIntelIndicatorType {
  domain,
  emailAddress,
  hashMd5,
  hashSha1,
  hashSha256,
  hashSha512,
  ipv4Address,
  ipv6Address,
  mutex,
  process,
  url,
}

extension on ThreatIntelIndicatorType {
  String toValue() {
    switch (this) {
      case ThreatIntelIndicatorType.domain:
        return 'DOMAIN';
      case ThreatIntelIndicatorType.emailAddress:
        return 'EMAIL_ADDRESS';
      case ThreatIntelIndicatorType.hashMd5:
        return 'HASH_MD5';
      case ThreatIntelIndicatorType.hashSha1:
        return 'HASH_SHA1';
      case ThreatIntelIndicatorType.hashSha256:
        return 'HASH_SHA256';
      case ThreatIntelIndicatorType.hashSha512:
        return 'HASH_SHA512';
      case ThreatIntelIndicatorType.ipv4Address:
        return 'IPV4_ADDRESS';
      case ThreatIntelIndicatorType.ipv6Address:
        return 'IPV6_ADDRESS';
      case ThreatIntelIndicatorType.mutex:
        return 'MUTEX';
      case ThreatIntelIndicatorType.process:
        return 'PROCESS';
      case ThreatIntelIndicatorType.url:
        return 'URL';
    }
  }
}

extension on String {
  ThreatIntelIndicatorType toThreatIntelIndicatorType() {
    switch (this) {
      case 'DOMAIN':
        return ThreatIntelIndicatorType.domain;
      case 'EMAIL_ADDRESS':
        return ThreatIntelIndicatorType.emailAddress;
      case 'HASH_MD5':
        return ThreatIntelIndicatorType.hashMd5;
      case 'HASH_SHA1':
        return ThreatIntelIndicatorType.hashSha1;
      case 'HASH_SHA256':
        return ThreatIntelIndicatorType.hashSha256;
      case 'HASH_SHA512':
        return ThreatIntelIndicatorType.hashSha512;
      case 'IPV4_ADDRESS':
        return ThreatIntelIndicatorType.ipv4Address;
      case 'IPV6_ADDRESS':
        return ThreatIntelIndicatorType.ipv6Address;
      case 'MUTEX':
        return ThreatIntelIndicatorType.mutex;
      case 'PROCESS':
        return ThreatIntelIndicatorType.process;
      case 'URL':
        return ThreatIntelIndicatorType.url;
    }
    throw Exception('$this is not known in enum ThreatIntelIndicatorType');
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

class UpdateActionTargetResponse {
  UpdateActionTargetResponse();

  factory UpdateActionTargetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateActionTargetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFindingsResponse {
  UpdateFindingsResponse();

  factory UpdateFindingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateInsightResponse {
  UpdateInsightResponse();

  factory UpdateInsightResponse.fromJson(Map<String, dynamic> _) {
    return UpdateInsightResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();

  factory UpdateOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateOrganizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSecurityHubConfigurationResponse {
  UpdateSecurityHubConfigurationResponse();

  factory UpdateSecurityHubConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateSecurityHubConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStandardsControlResponse {
  UpdateStandardsControlResponse();

  factory UpdateStandardsControlResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStandardsControlResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum VerificationState {
  unknown,
  truePositive,
  falsePositive,
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
  }
}

extension on String {
  VerificationState toVerificationState() {
    switch (this) {
      case 'UNKNOWN':
        return VerificationState.unknown;
      case 'TRUE_POSITIVE':
        return VerificationState.truePositive;
      case 'FALSE_POSITIVE':
        return VerificationState.falsePositive;
      case 'BENIGN_POSITIVE':
        return VerificationState.benignPositive;
    }
    throw Exception('$this is not known in enum VerificationState');
  }
}

/// A vulnerability associated with a finding.
class Vulnerability {
  /// The identifier of the vulnerability.
  final String id;

  /// CVSS scores from the advisory related to the vulnerability.
  final List<Cvss>? cvss;

  /// A list of URLs that provide additional information about the vulnerability.
  final List<String>? referenceUrls;

  /// List of vulnerabilities that are related to this vulnerability.
  final List<String>? relatedVulnerabilities;

  /// Information about the vendor that generates the vulnerability report.
  final VulnerabilityVendor? vendor;

  /// List of software packages that have the vulnerability.
  final List<SoftwarePackage>? vulnerablePackages;

  Vulnerability({
    required this.id,
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.vendor,
    this.vulnerablePackages,
  });

  factory Vulnerability.fromJson(Map<String, dynamic> json) {
    return Vulnerability(
      id: json['Id'] as String,
      cvss: (json['Cvss'] as List?)
          ?.whereNotNull()
          .map((e) => Cvss.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceUrls: (json['ReferenceUrls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['RelatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vendor: json['Vendor'] != null
          ? VulnerabilityVendor.fromJson(json['Vendor'] as Map<String, dynamic>)
          : null,
      vulnerablePackages: (json['VulnerablePackages'] as List?)
          ?.whereNotNull()
          .map((e) => SoftwarePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final cvss = this.cvss;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final vendor = this.vendor;
    final vulnerablePackages = this.vulnerablePackages;
    return {
      'Id': id,
      if (cvss != null) 'Cvss': cvss,
      if (referenceUrls != null) 'ReferenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'RelatedVulnerabilities': relatedVulnerabilities,
      if (vendor != null) 'Vendor': vendor,
      if (vulnerablePackages != null) 'VulnerablePackages': vulnerablePackages,
    };
  }
}

/// A vendor that generates a vulnerability report.
class VulnerabilityVendor {
  /// The name of the vendor.
  final String name;

  /// The URL of the vulnerability advisory.
  final String? url;

  /// Indicates when the vulnerability advisory was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? vendorCreatedAt;

  /// The severity that the vendor assigned to the vulnerability.
  final String? vendorSeverity;

  /// Indicates when the vulnerability advisory was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  final String? vendorUpdatedAt;

  VulnerabilityVendor({
    required this.name,
    this.url,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
  });

  factory VulnerabilityVendor.fromJson(Map<String, dynamic> json) {
    return VulnerabilityVendor(
      name: json['Name'] as String,
      url: json['Url'] as String?,
      vendorCreatedAt: json['VendorCreatedAt'] as String?,
      vendorSeverity: json['VendorSeverity'] as String?,
      vendorUpdatedAt: json['VendorUpdatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    return {
      'Name': name,
      if (url != null) 'Url': url,
      if (vendorCreatedAt != null) 'VendorCreatedAt': vendorCreatedAt,
      if (vendorSeverity != null) 'VendorSeverity': vendorSeverity,
      if (vendorUpdatedAt != null) 'VendorUpdatedAt': vendorUpdatedAt,
    };
  }
}

/// Details about the action that CloudFront or AWS WAF takes when a web request
/// matches the conditions in the rule.
class WafAction {
  /// Specifies how you want AWS WAF to respond to requests that match the
  /// settings in a rule.
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
  final String? type;

  WafAction({
    this.type,
  });

  factory WafAction.fromJson(Map<String, dynamic> json) {
    return WafAction(
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type,
    };
  }
}

/// Details about a rule to exclude from a rule group.
class WafExcludedRule {
  /// The unique identifier for the rule to exclude from the rule group.
  final String? ruleId;

  WafExcludedRule({
    this.ruleId,
  });

  factory WafExcludedRule.fromJson(Map<String, dynamic> json) {
    return WafExcludedRule(
      ruleId: json['RuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleId = this.ruleId;
    return {
      if (ruleId != null) 'RuleId': ruleId,
    };
  }
}

/// Details about an override action for a rule.
class WafOverrideAction {
  /// <code>COUNT</code> overrides the action specified by the individual rule
  /// within a <code>RuleGroup</code> .
  ///
  /// If set to <code>NONE</code>, the rule's action takes place.
  final String? type;

  WafOverrideAction({
    this.type,
  });

  factory WafOverrideAction.fromJson(Map<String, dynamic> json) {
    return WafOverrideAction(
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'Type': type,
    };
  }
}

/// Provides information about the status of the investigation into a finding.
class Workflow {
  /// The status of the investigation into the finding. The allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  ///
  /// Security Hub also resets the workflow status from <code>NOTIFIED</code> or
  /// <code>RESOLVED</code> to <code>NEW</code> in the following cases:
  ///
  /// <ul>
  /// <li>
  /// <code>RecordState</code> changes from <code>ARCHIVED</code> to
  /// <code>ACTIVE</code>.
  /// </li>
  /// <li>
  /// <code>ComplianceStatus</code> changes from <code>PASSED</code> to either
  /// <code>WARNING</code>, <code>FAILED</code>, or <code>NOT_AVAILABLE</code>.
  /// </li>
  /// </ul> </li>
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
  final WorkflowStatus? status;

  Workflow({
    this.status,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      status: (json['Status'] as String?)?.toWorkflowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

@Deprecated('Deprecated')
enum WorkflowState {
  $new,
  assigned,
  inProgress,
  deferred,
  resolved,
}

extension on WorkflowState {
  String toValue() {
    switch (this) {
      case WorkflowState.$new:
        return 'NEW';
      case WorkflowState.assigned:
        return 'ASSIGNED';
      case WorkflowState.inProgress:
        return 'IN_PROGRESS';
      case WorkflowState.deferred:
        return 'DEFERRED';
      case WorkflowState.resolved:
        return 'RESOLVED';
    }
  }
}

extension on String {
  WorkflowState toWorkflowState() {
    switch (this) {
      case 'NEW':
        return WorkflowState.$new;
      case 'ASSIGNED':
        return WorkflowState.assigned;
      case 'IN_PROGRESS':
        return WorkflowState.inProgress;
      case 'DEFERRED':
        return WorkflowState.deferred;
      case 'RESOLVED':
        return WorkflowState.resolved;
    }
    throw Exception('$this is not known in enum WorkflowState');
  }
}

enum WorkflowStatus {
  $new,
  notified,
  resolved,
  suppressed,
}

extension on WorkflowStatus {
  String toValue() {
    switch (this) {
      case WorkflowStatus.$new:
        return 'NEW';
      case WorkflowStatus.notified:
        return 'NOTIFIED';
      case WorkflowStatus.resolved:
        return 'RESOLVED';
      case WorkflowStatus.suppressed:
        return 'SUPPRESSED';
    }
  }
}

extension on String {
  WorkflowStatus toWorkflowStatus() {
    switch (this) {
      case 'NEW':
        return WorkflowStatus.$new;
      case 'NOTIFIED':
        return WorkflowStatus.notified;
      case 'RESOLVED':
        return WorkflowStatus.resolved;
      case 'SUPPRESSED':
        return WorkflowStatus.suppressed;
    }
    throw Exception('$this is not known in enum WorkflowStatus');
  }
}

/// Used to update information about the investigation into the finding.
class WorkflowUpdate {
  /// The status of the investigation into the finding. The allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  ///
  /// Security Hub also resets <code>WorkFlowStatus</code> from
  /// <code>NOTIFIED</code> or <code>RESOLVED</code> to <code>NEW</code> in the
  /// following cases:
  ///
  /// <ul>
  /// <li>
  /// The record state changes from <code>ARCHIVED</code> to <code>ACTIVE</code>.
  /// </li>
  /// <li>
  /// The compliance status changes from <code>PASSED</code> to either
  /// <code>WARNING</code>, <code>FAILED</code>, or <code>NOT_AVAILABLE</code>.
  /// </li>
  /// </ul> </li>
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
  final WorkflowStatus? status;

  WorkflowUpdate({
    this.status,
  });

  factory WorkflowUpdate.fromJson(Map<String, dynamic> json) {
    return WorkflowUpdate(
      status: (json['Status'] as String?)?.toWorkflowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidAccessException extends _s.GenericAwsException {
  InvalidAccessException({String? type, String? message})
      : super(type: type, code: 'InvalidAccessException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
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
