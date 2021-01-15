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

part '2018-10-26.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// Security Hub master account that the invitation was sent from.
  ///
  /// This operation is only used by member accounts that are not added through
  /// Organizations.
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
  /// <code>BatchImportFindings</code> can be used to update the following
  /// finding fields and objects only if they have not been updated using
  /// <code>BatchUpdateFindings</code>. After they are updated using
  /// <code>BatchUpdateFindings</code>, these fields cannot be updated using
  /// <code>BatchImportFindings</code>.
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
  /// Master and member accounts can use <code>BatchUpdateFindings</code> to
  /// update the following finding fields and objects.
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
  /// account. If you are integrated with Organizations, then the master account
  /// is the Security Hub administrator account that is designated by the
  /// organization management account.
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
  /// A permissions policy is added that permits the master account to view the
  /// findings generated in the member account. When Security Hub is enabled in
  /// a member account, findings are sent to both the member and master
  /// accounts.
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
  /// For each account, the list includes the account ID and optionally the
  /// email address.
  Future<CreateMembersResponse> createMembers({
    @_s.required List<AccountDetails> accountDetails,
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
    @_s.required List<String> accountIds,
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
    String hubArn,
  }) async {
    _s.validateStringPattern(
      'hubArn',
      hubArn,
      r'''.*\S.*''',
    );
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
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
    int maxResults,
    String nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/productSubscriptions/${productSubscriptionArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return DisableImportFindingsForProductResponse.fromJson(response);
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
    @_s.required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    _s.validateStringPattern(
      'adminAccountId',
      adminAccountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AdminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/admin/disable',
      exceptionFnMap: _exceptionFns,
    );
    return DisableOrganizationAdminAccountResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
    return DisableSecurityHubResponse.fromJson(response);
  }

  /// Disassociates the current Security Hub member account from the associated
  /// master account.
  ///
  /// This operation is only used by accounts that are not part of an
  /// organization. For organization accounts, only the master account (the
  /// designated Security Hub administrator) can disassociate a member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<void> disassociateFromMasterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateFromMasterAccountResponse.fromJson(response);
  }

  /// Disassociates the specified member accounts from the associated master
  /// account.
  ///
  /// Can be used to disassociate both accounts that are in an organization and
  /// accounts that were invited manually.
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
    @_s.required List<String> accountIds,
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
    return DisassociateMembersResponse.fromJson(response);
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
    @_s.required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    _s.validateStringPattern(
      'adminAccountId',
      adminAccountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AdminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organization/admin/enable',
      exceptionFnMap: _exceptionFns,
    );
    return EnableOrganizationAdminAccountResponse.fromJson(response);
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
    bool enableDefaultStandards,
    Map<String, String> tags,
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

  /// Provides the details for the Security Hub master account for the current
  /// member account.
  ///
  /// Can be used by both member accounts that are in an organization and
  /// accounts that were invited manually.
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
  /// A master account can be either a delegated Security Hub administrator
  /// account for an organization or a master account that enabled Security Hub
  /// manually.
  ///
  /// The results include both member accounts that are in an organization and
  /// accounts that were invited manually.
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
  /// This operation is only used to invite accounts that do not belong to an
  /// organization. Organization accounts do not receive invitations.
  ///
  /// Before you can use this action to invite a member, you must first use the
  /// <code> <a>CreateMembers</a> </code> action to create the member account in
  /// Security Hub.
  ///
  /// When the account owner enables Security Hub and accepts the invitation to
  /// become a member account, the master account can view the findings
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
    @_s.required List<String> accountIds,
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
    int maxResults,
    String nextToken,
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
  /// This operation is only used by accounts that do not belong to an
  /// organization. Organization accounts do not receive invitations.
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
  /// master account.
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
  /// relationship status with the master account. The default value is
  /// <code>TRUE</code>.
  ///
  /// If <code>OnlyAssociated</code> is set to <code>TRUE</code>, the response
  /// includes member accounts whose relationship status with the master is set
  /// to <code>ENABLED</code>.
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
    int maxResults,
    String nextToken,
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
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
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
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
      if (note != null) 'Note': note,
      if (recordState != null) 'RecordState': recordState.toValue(),
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
    return UpdateInsightResponse.fromJson(response);
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
    @_s.required bool autoEnable,
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
    return UpdateOrganizationConfigurationResponse.fromJson(response);
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
    bool autoEnableControls,
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
    return UpdateSecurityHubConfigurationResponse.fromJson(response);
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
    @_s.required this.accountId,
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

/// Represents a Security Hub administrator account designated by an
/// organization management account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminAccount {
  /// The AWS account identifier of the Security Hub administrator account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The current status of the Security Hub administrator account. Indicates
  /// whether the account is currently enabled as a Security Hub administrator.
  @_s.JsonKey(name: 'Status')
  final AdminStatus status;

  AdminAccount({
    this.accountId,
    this.status,
  });
  factory AdminAccount.fromJson(Map<String, dynamic> json) =>
      _$AdminAccountFromJson(json);
}

enum AdminStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLE_IN_PROGRESS')
  disableInProgress,
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

/// Contains information about settings for logging access for the stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayAccessLogSettings {
  /// The ARN of the CloudWatch Logs log group that receives the access logs.
  @_s.JsonKey(name: 'DestinationArn')
  final String destinationArn;

  /// A single-line format of the access logs of data, as specified by selected
  /// <code>$context</code> variables. The format must include at least
  /// <code>$context.requestId</code>.
  @_s.JsonKey(name: 'Format')
  final String format;

  AwsApiGatewayAccessLogSettings({
    this.destinationArn,
    this.format,
  });
  factory AwsApiGatewayAccessLogSettings.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayAccessLogSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayAccessLogSettingsToJson(this);
}

/// Contains information about settings for canary deployment in the stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayCanarySettings {
  /// The deployment identifier for the canary deployment.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The percentage of traffic that is diverted to a canary deployment.
  @_s.JsonKey(name: 'PercentTraffic')
  final double percentTraffic;

  /// Stage variables that are overridden in the canary release deployment. The
  /// variables include new stage variables that are introduced in the canary.
  ///
  /// Each variable is represented as a string-to-string map between the stage
  /// variable name and the variable value.
  @_s.JsonKey(name: 'StageVariableOverrides')
  final Map<String, String> stageVariableOverrides;

  /// Indicates whether the canary deployment uses the stage cache.
  @_s.JsonKey(name: 'UseStageCache')
  final bool useStageCache;

  AwsApiGatewayCanarySettings({
    this.deploymentId,
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });
  factory AwsApiGatewayCanarySettings.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayCanarySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayCanarySettingsToJson(this);
}

/// Contains information about the endpoints for the API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayEndpointConfiguration {
  /// A list of endpoint types for the REST API.
  ///
  /// For an edge-optimized API, the endpoint type is <code>EDGE</code>. For a
  /// Regional API, the endpoint type is <code>REGIONAL</code>. For a private API,
  /// the endpoint type is <code>PRIVATE</code>.
  @_s.JsonKey(name: 'Types')
  final List<String> types;

  AwsApiGatewayEndpointConfiguration({
    this.types,
  });
  factory AwsApiGatewayEndpointConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$AwsApiGatewayEndpointConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsApiGatewayEndpointConfigurationToJson(this);
}

/// Defines settings for a method for the stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayMethodSettings {
  /// Indicates whether the cached responses are encrypted.
  @_s.JsonKey(name: 'CacheDataEncrypted')
  final bool cacheDataEncrypted;

  /// Specifies the time to live (TTL), in seconds, for cached responses. The
  /// higher the TTL, the longer the response is cached.
  @_s.JsonKey(name: 'CacheTtlInSeconds')
  final int cacheTtlInSeconds;

  /// Indicates whether responses are cached and returned for requests. For
  /// responses to be cached, a cache cluster must be enabled on the stage.
  @_s.JsonKey(name: 'CachingEnabled')
  final bool cachingEnabled;

  /// Indicates whether data trace logging is enabled for the method. Data trace
  /// logging affects the log entries that are pushed to CloudWatch Logs.
  @_s.JsonKey(name: 'DataTraceEnabled')
  final bool dataTraceEnabled;

  /// The HTTP method. You can use an asterisk (*) as a wildcard to apply method
  /// settings to multiple methods.
  @_s.JsonKey(name: 'HttpMethod')
  final String httpMethod;

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
  @_s.JsonKey(name: 'LoggingLevel')
  final String loggingLevel;

  /// Indicates whether CloudWatch metrics are enabled for the method.
  @_s.JsonKey(name: 'MetricsEnabled')
  final bool metricsEnabled;

  /// Indicates whether authorization is required for a cache invalidation
  /// request.
  @_s.JsonKey(name: 'RequireAuthorizationForCacheControl')
  final bool requireAuthorizationForCacheControl;

  /// The resource path for this method. Forward slashes (/) are encoded as ~1 .
  /// The initial slash must include a forward slash.
  ///
  /// For example, the path value <code>/resource/subresource</code> must be
  /// encoded as <code>/~1resource~1subresource</code>.
  ///
  /// To specify the root path, use only a slash (/). You can use an asterisk (*)
  /// as a wildcard to apply method settings to multiple methods.
  @_s.JsonKey(name: 'ResourcePath')
  final String resourcePath;

  /// The throttling burst limit for the method.
  @_s.JsonKey(name: 'ThrottlingBurstLimit')
  final int throttlingBurstLimit;

  /// The throttling rate limit for the method.
  @_s.JsonKey(name: 'ThrottlingRateLimit')
  final double throttlingRateLimit;

  /// Indicates how to handle unauthorized requests for cache invalidation.
  ///
  /// Valid values: <code>FAIL_WITH_403</code> |
  /// <code>SUCCEED_WITH_RESPONSE_HEADER</code> |
  /// <code>SUCCEED_WITHOUT_RESPONSE_HEADER</code>
  @_s.JsonKey(name: 'UnauthorizedCacheControlHeaderStrategy')
  final String unauthorizedCacheControlHeaderStrategy;

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
  factory AwsApiGatewayMethodSettings.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayMethodSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayMethodSettingsToJson(this);
}

/// contains information about a REST API in version 1 of Amazon API Gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayRestApiDetails {
  /// The source of the API key for metering requests according to a usage plan.
  ///
  /// <code>HEADER</code> indicates whether to read the API key from the X-API-Key
  /// header of a request.
  ///
  /// <code>AUTHORIZER</code> indicates whether to read the API key from the
  /// <code>UsageIdentifierKey</code> from a custom authorizer.
  @_s.JsonKey(name: 'ApiKeySource')
  final String apiKeySource;

  /// The list of binary media types supported by the REST API.
  @_s.JsonKey(name: 'BinaryMediaTypes')
  final List<String> binaryMediaTypes;

  /// Indicates when the API was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// A description of the REST API.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The endpoint configuration of the REST API.
  @_s.JsonKey(name: 'EndpointConfiguration')
  final AwsApiGatewayEndpointConfiguration endpointConfiguration;

  /// The identifier of the REST API.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The minimum size in bytes of a payload before compression is enabled.
  ///
  /// If <code>null</code>, then compression is disabled.
  ///
  /// If 0, then all payloads are compressed.
  @_s.JsonKey(name: 'MinimumCompressionSize')
  final int minimumCompressionSize;

  /// The name of the REST API.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The version identifier for the REST API.
  @_s.JsonKey(name: 'Version')
  final String version;

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
  factory AwsApiGatewayRestApiDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayRestApiDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayRestApiDetailsToJson(this);
}

/// Provides information about a version 1 Amazon API Gateway stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayStageDetails {
  /// Settings for logging access for the stage.
  @_s.JsonKey(name: 'AccessLogSettings')
  final AwsApiGatewayAccessLogSettings accessLogSettings;

  /// Indicates whether a cache cluster is enabled for the stage.
  @_s.JsonKey(name: 'CacheClusterEnabled')
  final bool cacheClusterEnabled;

  /// If a cache cluster is enabled, the size of the cache cluster.
  @_s.JsonKey(name: 'CacheClusterSize')
  final String cacheClusterSize;

  /// If a cache cluster is enabled, the status of the cache cluster.
  @_s.JsonKey(name: 'CacheClusterStatus')
  final String cacheClusterStatus;

  /// Information about settings for canary deployment in the stage.
  @_s.JsonKey(name: 'CanarySettings')
  final AwsApiGatewayCanarySettings canarySettings;

  /// The identifier of the client certificate for the stage.
  @_s.JsonKey(name: 'ClientCertificateId')
  final String clientCertificateId;

  /// Indicates when the stage was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The identifier of the deployment that the stage points to.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// A description of the stage.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The version of the API documentation that is associated with the stage.
  @_s.JsonKey(name: 'DocumentationVersion')
  final String documentationVersion;

  /// Indicates when the stage was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastUpdatedDate')
  final String lastUpdatedDate;

  /// Defines the method settings for the stage.
  @_s.JsonKey(name: 'MethodSettings')
  final List<AwsApiGatewayMethodSettings> methodSettings;

  /// The name of the stage.
  @_s.JsonKey(name: 'StageName')
  final String stageName;

  /// Indicates whether active tracing with AWS X-Ray is enabled for the stage.
  @_s.JsonKey(name: 'TracingEnabled')
  final bool tracingEnabled;

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
  @_s.JsonKey(name: 'Variables')
  final Map<String, String> variables;

  /// The ARN of the web ACL associated with the stage.
  @_s.JsonKey(name: 'WebAclArn')
  final String webAclArn;

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
  factory AwsApiGatewayStageDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayStageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayStageDetailsToJson(this);
}

/// Contains information about a version 2 API in Amazon API Gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayV2ApiDetails {
  /// The URI of the API.
  ///
  /// Uses the format <code>
  /// <i>&lt;api-id&gt;</i>.execute-api.<i>&lt;region&gt;</i>.amazonaws.com</code>
  ///
  /// The stage name is typically appended to the URI to form a complete path to a
  /// deployed API stage.
  @_s.JsonKey(name: 'ApiEndpoint')
  final String apiEndpoint;

  /// The identifier of the API.
  @_s.JsonKey(name: 'ApiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'ApiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A cross-origin resource sharing (CORS) configuration. Supported only for
  /// HTTP APIs.
  @_s.JsonKey(name: 'CorsConfiguration')
  final AwsCorsConfiguration corsConfiguration;

  /// Indicates when the API was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// A description of the API.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the API.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The API protocol for the API.
  ///
  /// Valid values: <code>WEBSOCKET</code> | <code>HTTP</code>
  @_s.JsonKey(name: 'ProtocolType')
  final String protocolType;

  /// The route selection expression for the API.
  ///
  /// For HTTP APIs, must be <code>${request.method} ${request.path}</code>. This
  /// is the default value for HTTP APIs.
  ///
  /// For WebSocket APIs, there is no default value.
  @_s.JsonKey(name: 'RouteSelectionExpression')
  final String routeSelectionExpression;

  /// The version identifier for the API.
  @_s.JsonKey(name: 'Version')
  final String version;

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
  factory AwsApiGatewayV2ApiDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayV2ApiDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayV2ApiDetailsToJson(this);
}

/// Contains route settings for a stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayV2RouteSettings {
  /// Indicates whether data trace logging is enabled. Data trace logging affects
  /// the log entries that are pushed to CloudWatch Logs. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'DataTraceEnabled')
  final bool dataTraceEnabled;

  /// Indicates whether detailed metrics are enabled.
  @_s.JsonKey(name: 'DetailedMetricsEnabled')
  final bool detailedMetricsEnabled;

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
  @_s.JsonKey(name: 'LoggingLevel')
  final String loggingLevel;

  /// The throttling burst limit.
  @_s.JsonKey(name: 'ThrottlingBurstLimit')
  final int throttlingBurstLimit;

  /// The throttling rate limit.
  @_s.JsonKey(name: 'ThrottlingRateLimit')
  final double throttlingRateLimit;

  AwsApiGatewayV2RouteSettings({
    this.dataTraceEnabled,
    this.detailedMetricsEnabled,
    this.loggingLevel,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
  });
  factory AwsApiGatewayV2RouteSettings.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayV2RouteSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayV2RouteSettingsToJson(this);
}

/// Contains information about a version 2 stage for Amazon API Gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsApiGatewayV2StageDetails {
  /// Information about settings for logging access for the stage.
  @_s.JsonKey(name: 'AccessLogSettings')
  final AwsApiGatewayAccessLogSettings accessLogSettings;

  /// Indicates whether the stage is managed by API Gateway.
  @_s.JsonKey(name: 'ApiGatewayManaged')
  final bool apiGatewayManaged;

  /// Indicates whether updates to an API automatically trigger a new deployment.
  @_s.JsonKey(name: 'AutoDeploy')
  final bool autoDeploy;

  /// Indicates when the stage was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// Default route settings for the stage.
  @_s.JsonKey(name: 'DefaultRouteSettings')
  final AwsApiGatewayV2RouteSettings defaultRouteSettings;

  /// The identifier of the deployment that the stage is associated with.
  @_s.JsonKey(name: 'DeploymentId')
  final String deploymentId;

  /// The description of the stage.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The status of the last deployment of a stage. Supported only if the stage
  /// has automatic deployment enabled.
  @_s.JsonKey(name: 'LastDeploymentStatusMessage')
  final String lastDeploymentStatusMessage;

  /// Indicates when the stage was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastUpdatedDate')
  final String lastUpdatedDate;

  /// The route settings for the stage.
  @_s.JsonKey(name: 'RouteSettings')
  final AwsApiGatewayV2RouteSettings routeSettings;

  /// The name of the stage.
  @_s.JsonKey(name: 'StageName')
  final String stageName;

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
  @_s.JsonKey(name: 'StageVariables')
  final Map<String, String> stageVariables;

  AwsApiGatewayV2StageDetails({
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
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
  factory AwsApiGatewayV2StageDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayV2StageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayV2StageDetailsToJson(this);
}

/// Provides details about an auto scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsAutoScalingAutoScalingGroupDetails {
  /// Indicates when the auto scaling group was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedTime')
  final String createdTime;

  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before it
  /// checks the health status of an EC2 instance that has come into service.
  @_s.JsonKey(name: 'HealthCheckGracePeriod')
  final int healthCheckGracePeriod;

  /// The service to use for the health checks.
  @_s.JsonKey(name: 'HealthCheckType')
  final String healthCheckType;

  /// The name of the launch configuration.
  @_s.JsonKey(name: 'LaunchConfigurationName')
  final String launchConfigurationName;

  /// The list of load balancers associated with the group.
  @_s.JsonKey(name: 'LoadBalancerNames')
  final List<String> loadBalancerNames;

  AwsAutoScalingAutoScalingGroupDetails({
    this.createdTime,
    this.healthCheckGracePeriod,
    this.healthCheckType,
    this.launchConfigurationName,
    this.loadBalancerNames,
  });
  factory AwsAutoScalingAutoScalingGroupDetails.fromJson(
          Map<String, dynamic> json) =>
      _$AwsAutoScalingAutoScalingGroupDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsAutoScalingAutoScalingGroupDetailsToJson(this);
}

/// Provides details about an AWS Certificate Manager certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateDetails {
  /// The ARN of the private certificate authority (CA) that will be used to issue
  /// the certificate.
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  /// Indicates when the certificate was requested.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The fully qualified domain name (FQDN), such as www.example.com, that is
  /// secured by the certificate.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// Contains information about the initial validation of each domain name that
  /// occurs as a result of the <code>RequestCertificate</code> request.
  ///
  /// Only provided if the certificate type is <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'DomainValidationOptions')
  final List<AwsCertificateManagerCertificateDomainValidationOption>
      domainValidationOptions;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  @_s.JsonKey(name: 'ExtendedKeyUsages')
  final List<AwsCertificateManagerCertificateExtendedKeyUsage>
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
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Indicates when the certificate was imported. Provided if the certificate
  /// type is <code>IMPORTED</code>.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'ImportedAt')
  final String importedAt;

  /// The list of ARNs for the AWS resources that use the certificate.
  @_s.JsonKey(name: 'InUseBy')
  final List<String> inUseBy;

  /// Indicates when the certificate was issued. Provided if the certificate type
  /// is <code>AMAZON_ISSUED</code>.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'IssuedAt')
  final String issuedAt;

  /// The name of the certificate authority that issued and signed the
  /// certificate.
  @_s.JsonKey(name: 'Issuer')
  final String issuer;

  /// The algorithm that was used to generate the public-private key pair.
  ///
  /// Valid values: <code>RSA_2048</code> | <code>RSA_1024</code> |<code>
  /// RSA_4096</code> | <code>EC_prime256v1</code> | <code>EC_secp384r1</code> |
  /// <code>EC_secp521r1</code>
  @_s.JsonKey(name: 'KeyAlgorithm')
  final String keyAlgorithm;

  /// A list of key usage X.509 v3 extension objects.
  @_s.JsonKey(name: 'KeyUsages')
  final List<AwsCertificateManagerCertificateKeyUsage> keyUsages;

  /// The time after which the certificate becomes invalid.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'NotAfter')
  final String notAfter;

  /// The time before which the certificate is not valid.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'NotBefore')
  final String notBefore;

  /// Provides a value that specifies whether to add the certificate to a
  /// transparency log.
  @_s.JsonKey(name: 'Options')
  final AwsCertificateManagerCertificateOptions options;

  /// Whether the certificate is eligible for renewal.
  ///
  /// Valid values: <code>ELIGIBLE</code> | <code>INELIGIBLE</code>
  @_s.JsonKey(name: 'RenewalEligibility')
  final String renewalEligibility;

  /// Information about the status of the AWS Certificate Manager managed renewal
  /// for the certificate. Provided only when the certificate type is
  /// <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'RenewalSummary')
  final AwsCertificateManagerCertificateRenewalSummary renewalSummary;

  /// The serial number of the certificate.
  @_s.JsonKey(name: 'Serial')
  final String serial;

  /// The algorithm that was used to sign the certificate.
  @_s.JsonKey(name: 'SignatureAlgorithm')
  final String signatureAlgorithm;

  /// The status of the certificate.
  ///
  /// Valid values: <code>PENDING_VALIDATION</code> | <code>ISSUED</code> |
  /// <code>INACTIVE</code> | <code>EXPIRED</code> |
  /// <code>VALIDATION_TIMED_OUT</code> | <code>REVOKED</code> |
  /// <code>FAILED</code>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate.
  ///
  /// The subject alternative names include the canonical domain name (CN) of the
  /// certificate and additional domain names that can be used to connect to the
  /// website.
  @_s.JsonKey(name: 'SubjectAlternativeNames')
  final List<String> subjectAlternativeNames;

  /// The source of the certificate. For certificates that AWS Certificate Manager
  /// provides, <code>Type</code> is <code>AMAZON_ISSUED</code>. For certificates
  /// that are imported with <code>ImportCertificate</code>, <code>Type</code> is
  /// <code>IMPORTED</code>.
  ///
  /// Valid values: <code>IMPORTED</code> | <code>AMAZON_ISSUED</code> |
  /// <code>PRIVATE</code>
  @_s.JsonKey(name: 'Type')
  final String type;

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
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateDetailsToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateDomainValidationOption {
  /// A fully qualified domain name (FQDN) in the certificate.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The CNAME record that is added to the DNS database for domain validation.
  @_s.JsonKey(name: 'ResourceRecord')
  final AwsCertificateManagerCertificateResourceRecord resourceRecord;

  /// The domain name that AWS Certificate Manager uses to send domain validation
  /// emails.
  @_s.JsonKey(name: 'ValidationDomain')
  final String validationDomain;

  /// A list of email addresses that AWS Certificate Manager uses to send domain
  /// validation emails.
  @_s.JsonKey(name: 'ValidationEmails')
  final List<String> validationEmails;

  /// The method used to validate the domain name.
  @_s.JsonKey(name: 'ValidationMethod')
  final String validationMethod;

  /// The validation status of the domain name.
  @_s.JsonKey(name: 'ValidationStatus')
  final String validationStatus;

  AwsCertificateManagerCertificateDomainValidationOption({
    this.domainName,
    this.resourceRecord,
    this.validationDomain,
    this.validationEmails,
    this.validationMethod,
    this.validationStatus,
  });
  factory AwsCertificateManagerCertificateDomainValidationOption.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateDomainValidationOptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateDomainValidationOptionToJson(this);
}

/// Contains information about an extended key usage X.509 v3 extension object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateExtendedKeyUsage {
  /// The name of an extension value. Indicates the purpose for which the
  /// certificate public key can be used.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An object identifier (OID) for the extension value.
  ///
  /// The format is numbers separated by periods.
  @_s.JsonKey(name: 'OId')
  final String oId;

  AwsCertificateManagerCertificateExtendedKeyUsage({
    this.name,
    this.oId,
  });
  factory AwsCertificateManagerCertificateExtendedKeyUsage.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateExtendedKeyUsageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateExtendedKeyUsageToJson(this);
}

/// Contains information about a key usage X.509 v3 extension object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateKeyUsage {
  /// The key usage extension name.
  @_s.JsonKey(name: 'Name')
  final String name;

  AwsCertificateManagerCertificateKeyUsage({
    this.name,
  });
  factory AwsCertificateManagerCertificateKeyUsage.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateKeyUsageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateKeyUsageToJson(this);
}

/// Contains other options for the certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateOptions {
  /// Whether to add the certificate to a transparency log.
  ///
  /// Valid values: <code>DISABLED</code> | <code>ENABLED</code>
  @_s.JsonKey(name: 'CertificateTransparencyLoggingPreference')
  final String certificateTransparencyLoggingPreference;

  AwsCertificateManagerCertificateOptions({
    this.certificateTransparencyLoggingPreference,
  });
  factory AwsCertificateManagerCertificateOptions.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateOptionsToJson(this);
}

/// Contains information about the AWS Certificate Manager managed renewal for
/// an <code>AMAZON_ISSUED</code> certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateRenewalSummary {
  /// Information about the validation of each domain name in the certificate, as
  /// it pertains to AWS Certificate Manager managed renewal. Provided only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'DomainValidationOptions')
  final List<AwsCertificateManagerCertificateDomainValidationOption>
      domainValidationOptions;

  /// The status of the AWS Certificate Manager managed renewal of the
  /// certificate.
  ///
  /// Valid values: <code>PENDING_AUTO_RENEWAL</code> |
  /// <code>PENDING_VALIDATION</code> | <code>SUCCESS</code> | <code>FAILED</code>
  @_s.JsonKey(name: 'RenewalStatus')
  final String renewalStatus;

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
  @_s.JsonKey(name: 'RenewalStatusReason')
  final String renewalStatusReason;

  /// Indicates when the renewal summary was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  AwsCertificateManagerCertificateRenewalSummary({
    this.domainValidationOptions,
    this.renewalStatus,
    this.renewalStatusReason,
    this.updatedAt,
  });
  factory AwsCertificateManagerCertificateRenewalSummary.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateRenewalSummaryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateRenewalSummaryToJson(this);
}

/// Provides details about the CNAME record that is added to the DNS database
/// for domain validation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCertificateManagerCertificateResourceRecord {
  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of resource.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The value of the resource.
  @_s.JsonKey(name: 'Value')
  final String value;

  AwsCertificateManagerCertificateResourceRecord({
    this.name,
    this.type,
    this.value,
  });
  factory AwsCertificateManagerCertificateResourceRecord.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCertificateManagerCertificateResourceRecordFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCertificateManagerCertificateResourceRecordToJson(this);
}

/// Information about a cache behavior for the distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'ViewerProtocolPolicy')
  final String viewerProtocolPolicy;

  AwsCloudFrontDistributionCacheBehavior({
    this.viewerProtocolPolicy,
  });
  factory AwsCloudFrontDistributionCacheBehavior.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionCacheBehaviorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionCacheBehaviorToJson(this);
}

/// Provides information about caching for the distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionCacheBehaviors {
  /// The cache behaviors for the distribution.
  @_s.JsonKey(name: 'Items')
  final List<AwsCloudFrontDistributionCacheBehavior> items;

  AwsCloudFrontDistributionCacheBehaviors({
    this.items,
  });
  factory AwsCloudFrontDistributionCacheBehaviors.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionCacheBehaviorsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionCacheBehaviorsToJson(this);
}

/// Contains information about the default cache configuration for the
/// distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'ViewerProtocolPolicy')
  final String viewerProtocolPolicy;

  AwsCloudFrontDistributionDefaultCacheBehavior({
    this.viewerProtocolPolicy,
  });
  factory AwsCloudFrontDistributionDefaultCacheBehavior.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionDefaultCacheBehaviorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionDefaultCacheBehaviorToJson(this);
}

/// A distribution configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionDetails {
  /// Provides information about the cache configuration for the distribution.
  @_s.JsonKey(name: 'CacheBehaviors')
  final AwsCloudFrontDistributionCacheBehaviors cacheBehaviors;

  /// The default cache behavior for the configuration.
  @_s.JsonKey(name: 'DefaultCacheBehavior')
  final AwsCloudFrontDistributionDefaultCacheBehavior defaultCacheBehavior;

  /// The object that CloudFront sends in response to requests from the origin
  /// (for example, index.html) when a viewer requests the root URL for the
  /// distribution (http://www.example.com) instead of an object in your
  /// distribution (http://www.example.com/product-description.html).
  @_s.JsonKey(name: 'DefaultRootObject')
  final String defaultRootObject;

  /// The domain name corresponding to the distribution.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The entity tag is a hash of the object.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// Indicates when that the distribution was last modified.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastModifiedTime')
  final String lastModifiedTime;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  @_s.JsonKey(name: 'Logging')
  final AwsCloudFrontDistributionLogging logging;

  /// Provides information about the origin groups in the distribution.
  @_s.JsonKey(name: 'OriginGroups')
  final AwsCloudFrontDistributionOriginGroups originGroups;

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

/// Information about an origin group for the distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginGroup {
  /// Provides the criteria for an origin group to fail over.
  @_s.JsonKey(name: 'FailoverCriteria')
  final AwsCloudFrontDistributionOriginGroupFailover failoverCriteria;

  AwsCloudFrontDistributionOriginGroup({
    this.failoverCriteria,
  });
  factory AwsCloudFrontDistributionOriginGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginGroupToJson(this);
}

/// Provides information about when an origin group fails over.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginGroupFailover {
  /// Information about the status codes that cause an origin group to fail over.
  @_s.JsonKey(name: 'StatusCodes')
  final AwsCloudFrontDistributionOriginGroupFailoverStatusCodes statusCodes;

  AwsCloudFrontDistributionOriginGroupFailover({
    this.statusCodes,
  });
  factory AwsCloudFrontDistributionOriginGroupFailover.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginGroupFailoverFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginGroupFailoverToJson(this);
}

/// The status codes that cause an origin group to fail over.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginGroupFailoverStatusCodes {
  /// The list of status code values that can cause a failover to the next origin.
  @_s.JsonKey(name: 'Items')
  final List<int> items;

  /// The number of status codes that can cause a failover.
  @_s.JsonKey(name: 'Quantity')
  final int quantity;

  AwsCloudFrontDistributionOriginGroupFailoverStatusCodes({
    this.items,
    this.quantity,
  });
  factory AwsCloudFrontDistributionOriginGroupFailoverStatusCodes.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginGroupFailoverStatusCodesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginGroupFailoverStatusCodesToJson(this);
}

/// Provides information about origin groups that are associated with the
/// distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginGroups {
  /// The list of origin groups.
  @_s.JsonKey(name: 'Items')
  final List<AwsCloudFrontDistributionOriginGroup> items;

  AwsCloudFrontDistributionOriginGroups({
    this.items,
  });
  factory AwsCloudFrontDistributionOriginGroups.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginGroupsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginGroupsToJson(this);
}

/// A complex type that describes the Amazon S3 bucket, HTTP server (for
/// example, a web server), Amazon Elemental MediaStore, or other server from
/// which CloudFront gets your files.
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

  /// An origin that is an S3 bucket that is not configured with static website
  /// hosting.
  @_s.JsonKey(name: 'S3OriginConfig')
  final AwsCloudFrontDistributionOriginS3OriginConfig s3OriginConfig;

  AwsCloudFrontDistributionOriginItem({
    this.domainName,
    this.id,
    this.originPath,
    this.s3OriginConfig,
  });
  factory AwsCloudFrontDistributionOriginItem.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginItemToJson(this);
}

/// Information about an origin that is an S3 bucket that is not configured with
/// static website hosting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginS3OriginConfig {
  /// The CloudFront origin access identity to associate with the origin.
  @_s.JsonKey(name: 'OriginAccessIdentity')
  final String originAccessIdentity;

  AwsCloudFrontDistributionOriginS3OriginConfig({
    this.originAccessIdentity,
  });
  factory AwsCloudFrontDistributionOriginS3OriginConfig.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginS3OriginConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginS3OriginConfigToJson(this);
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

/// Provides details about a CloudTrail trail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudTrailTrailDetails {
  /// The ARN of the log group that CloudTrail logs are delivered to.
  @_s.JsonKey(name: 'CloudWatchLogsLogGroupArn')
  final String cloudWatchLogsLogGroupArn;

  /// The ARN of the role that the CloudWatch Logs endpoint assumes when it writes
  /// to the log group.
  @_s.JsonKey(name: 'CloudWatchLogsRoleArn')
  final String cloudWatchLogsRoleArn;

  /// Indicates whether the trail has custom event selectors.
  @_s.JsonKey(name: 'HasCustomEventSelectors')
  final bool hasCustomEventSelectors;

  /// The Region where the trail was created.
  @_s.JsonKey(name: 'HomeRegion')
  final String homeRegion;

  /// Indicates whether the trail publishes events from global services such as
  /// IAM to the log files.
  @_s.JsonKey(name: 'IncludeGlobalServiceEvents')
  final bool includeGlobalServiceEvents;

  /// Indicates whether the trail applies only to the current Region or to all
  /// Regions.
  @_s.JsonKey(name: 'IsMultiRegionTrail')
  final bool isMultiRegionTrail;

  /// Whether the trail is created for all accounts in an organization in AWS
  /// Organizations, or only for the current AWS account.
  @_s.JsonKey(name: 'IsOrganizationTrail')
  final bool isOrganizationTrail;

  /// The AWS KMS key ID to use to encrypt the logs.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Indicates whether CloudTrail log file validation is enabled.
  @_s.JsonKey(name: 'LogFileValidationEnabled')
  final bool logFileValidationEnabled;

  /// The name of the trail.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of the S3 bucket where the log files are published.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The S3 key prefix. The key prefix is added after the name of the S3 bucket
  /// where the log files are published.
  @_s.JsonKey(name: 'S3KeyPrefix')
  final String s3KeyPrefix;

  /// The ARN of the SNS topic that is used for notifications of log file
  /// delivery.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  /// The name of the SNS topic that is used for notifications of log file
  /// delivery.
  @_s.JsonKey(name: 'SnsTopicName')
  final String snsTopicName;

  /// The ARN of the trail.
  @_s.JsonKey(name: 'TrailArn')
  final String trailArn;

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
  factory AwsCloudTrailTrailDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsCloudTrailTrailDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCloudTrailTrailDetailsToJson(this);
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

/// Contains the cross-origin resource sharing (CORS) configuration for the API.
/// CORS is only supported for HTTP APIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCorsConfiguration {
  /// Indicates whether the CORS request includes credentials.
  @_s.JsonKey(name: 'AllowCredentials')
  final bool allowCredentials;

  /// The allowed headers for CORS requests.
  @_s.JsonKey(name: 'AllowHeaders')
  final List<String> allowHeaders;

  /// The allowed methods for CORS requests.
  @_s.JsonKey(name: 'AllowMethods')
  final List<String> allowMethods;

  /// The allowed origins for CORS requests.
  @_s.JsonKey(name: 'AllowOrigins')
  final List<String> allowOrigins;

  /// The exposed headers for CORS requests.
  @_s.JsonKey(name: 'ExposeHeaders')
  final List<String> exposeHeaders;

  /// The number of seconds for which the browser caches preflight request
  /// results.
  @_s.JsonKey(name: 'MaxAge')
  final int maxAge;

  AwsCorsConfiguration({
    this.allowCredentials,
    this.allowHeaders,
    this.allowMethods,
    this.allowOrigins,
    this.exposeHeaders,
    this.maxAge,
  });
  factory AwsCorsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AwsCorsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCorsConfigurationToJson(this);
}

/// Contains a definition of an attribute for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableAttributeDefinition {
  /// The name of the attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The type of the attribute.
  @_s.JsonKey(name: 'AttributeType')
  final String attributeType;

  AwsDynamoDbTableAttributeDefinition({
    this.attributeName,
    this.attributeType,
  });
  factory AwsDynamoDbTableAttributeDefinition.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableAttributeDefinitionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableAttributeDefinitionToJson(this);
}

/// Provides information about the billing for read/write capacity on the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableBillingModeSummary {
  /// The method used to charge for read and write throughput and to manage
  /// capacity.
  @_s.JsonKey(name: 'BillingMode')
  final String billingMode;

  /// If the billing mode is <code>PAY_PER_REQUEST</code>, indicates when the
  /// billing mode was set to that value.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastUpdateToPayPerRequestDateTime')
  final String lastUpdateToPayPerRequestDateTime;

  AwsDynamoDbTableBillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });
  factory AwsDynamoDbTableBillingModeSummary.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableBillingModeSummaryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableBillingModeSummaryToJson(this);
}

/// Provides details about a DynamoDB table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableDetails {
  /// A list of attribute definitions for the table.
  @_s.JsonKey(name: 'AttributeDefinitions')
  final List<AwsDynamoDbTableAttributeDefinition> attributeDefinitions;

  /// Information about the billing for read/write capacity on the table.
  @_s.JsonKey(name: 'BillingModeSummary')
  final AwsDynamoDbTableBillingModeSummary billingModeSummary;

  /// Indicates when the table was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreationDateTime')
  final String creationDateTime;

  /// List of global secondary indexes for the table.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<AwsDynamoDbTableGlobalSecondaryIndex> globalSecondaryIndexes;

  /// The version of global tables being used.
  @_s.JsonKey(name: 'GlobalTableVersion')
  final String globalTableVersion;

  /// The number of items in the table.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The primary key structure for the table.
  @_s.JsonKey(name: 'KeySchema')
  final List<AwsDynamoDbTableKeySchema> keySchema;

  /// The ARN of the latest stream for the table.
  @_s.JsonKey(name: 'LatestStreamArn')
  final String latestStreamArn;

  /// The label of the latest stream. The label is not a unique identifier.
  @_s.JsonKey(name: 'LatestStreamLabel')
  final String latestStreamLabel;

  /// The list of local secondary indexes for the table.
  @_s.JsonKey(name: 'LocalSecondaryIndexes')
  final List<AwsDynamoDbTableLocalSecondaryIndex> localSecondaryIndexes;

  /// Information about the provisioned throughput for the table.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final AwsDynamoDbTableProvisionedThroughput provisionedThroughput;

  /// The list of replicas of this table.
  @_s.JsonKey(name: 'Replicas')
  final List<AwsDynamoDbTableReplica> replicas;

  /// Information about the restore for the table.
  @_s.JsonKey(name: 'RestoreSummary')
  final AwsDynamoDbTableRestoreSummary restoreSummary;

  /// Information about the server-side encryption for the table.
  @_s.JsonKey(name: 'SseDescription')
  final AwsDynamoDbTableSseDescription sseDescription;

  /// The current DynamoDB Streams configuration for the table.
  @_s.JsonKey(name: 'StreamSpecification')
  final AwsDynamoDbTableStreamSpecification streamSpecification;

  /// The identifier of the table.
  @_s.JsonKey(name: 'TableId')
  final String tableId;

  /// The name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The total size of the table in bytes.
  @_s.JsonKey(name: 'TableSizeBytes')
  final int tableSizeBytes;

  /// The current status of the table.
  @_s.JsonKey(name: 'TableStatus')
  final String tableStatus;

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
  factory AwsDynamoDbTableDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableDetailsToJson(this);
}

/// Information abut a global secondary index for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableGlobalSecondaryIndex {
  /// Whether the index is currently backfilling.
  @_s.JsonKey(name: 'Backfilling')
  final bool backfilling;

  /// The ARN of the index.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// The name of the index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The total size in bytes of the index.
  @_s.JsonKey(name: 'IndexSizeBytes')
  final int indexSizeBytes;

  /// The current status of the index.
  @_s.JsonKey(name: 'IndexStatus')
  final String indexStatus;

  /// The number of items in the index.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The key schema for the index.
  @_s.JsonKey(name: 'KeySchema')
  final List<AwsDynamoDbTableKeySchema> keySchema;

  /// Attributes that are copied from the table into an index.
  @_s.JsonKey(name: 'Projection')
  final AwsDynamoDbTableProjection projection;

  /// Information about the provisioned throughput settings for the indexes.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final AwsDynamoDbTableProvisionedThroughput provisionedThroughput;

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
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableGlobalSecondaryIndexFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableGlobalSecondaryIndexToJson(this);
}

/// A component of the key schema for the DynamoDB table, a global secondary
/// index, or a local secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableKeySchema {
  /// The name of the key schema attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The type of key used for the key schema attribute.
  @_s.JsonKey(name: 'KeyType')
  final String keyType;

  AwsDynamoDbTableKeySchema({
    this.attributeName,
    this.keyType,
  });
  factory AwsDynamoDbTableKeySchema.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableKeySchemaFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableKeySchemaToJson(this);
}

/// Information about a local secondary index for a DynamoDB table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableLocalSecondaryIndex {
  /// The ARN of the index.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// The name of the index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for the index.
  @_s.JsonKey(name: 'KeySchema')
  final List<AwsDynamoDbTableKeySchema> keySchema;

  /// Attributes that are copied from the table into the index. These are in
  /// addition to the primary key attributes and index key attributes, which are
  /// automatically projected.
  @_s.JsonKey(name: 'Projection')
  final AwsDynamoDbTableProjection projection;

  AwsDynamoDbTableLocalSecondaryIndex({
    this.indexArn,
    this.indexName,
    this.keySchema,
    this.projection,
  });
  factory AwsDynamoDbTableLocalSecondaryIndex.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableLocalSecondaryIndexFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableLocalSecondaryIndexToJson(this);
}

/// For global and local secondary indexes, identifies the attributes that are
/// copied from the table into the index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableProjection {
  /// The nonkey attributes that are projected into the index. For each attribute,
  /// provide the attribute name.
  @_s.JsonKey(name: 'NonKeyAttributes')
  final List<String> nonKeyAttributes;

  /// The types of attributes that are projected into the index.
  @_s.JsonKey(name: 'ProjectionType')
  final String projectionType;

  AwsDynamoDbTableProjection({
    this.nonKeyAttributes,
    this.projectionType,
  });
  factory AwsDynamoDbTableProjection.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableProjectionToJson(this);
}

/// Information about the provisioned throughput for the table or for a global
/// secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableProvisionedThroughput {
  /// Indicates when the provisioned throughput was last decreased.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastDecreaseDateTime')
  final String lastDecreaseDateTime;

  /// Indicates when the provisioned throughput was last increased.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastIncreaseDateTime')
  final String lastIncreaseDateTime;

  /// The number of times during the current UTC calendar day that the provisioned
  /// throughput was decreased.
  @_s.JsonKey(name: 'NumberOfDecreasesToday')
  final int numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'WriteCapacityUnits')
  final int writeCapacityUnits;

  AwsDynamoDbTableProvisionedThroughput({
    this.lastDecreaseDateTime,
    this.lastIncreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });
  factory AwsDynamoDbTableProvisionedThroughput.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableProvisionedThroughputFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableProvisionedThroughputToJson(this);
}

/// Replica-specific configuration for the provisioned throughput.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableProvisionedThroughputOverride {
  /// The read capacity units for the replica.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  AwsDynamoDbTableProvisionedThroughputOverride({
    this.readCapacityUnits,
  });
  factory AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableProvisionedThroughputOverrideFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableProvisionedThroughputOverrideToJson(this);
}

/// Information about a replica of a DynamoDB table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableReplica {
  /// List of global secondary indexes for the replica.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<AwsDynamoDbTableReplicaGlobalSecondaryIndex>
      globalSecondaryIndexes;

  /// The identifier of the AWS KMS customer master key (CMK) that will be used
  /// for AWS KMS encryption for the replica.
  @_s.JsonKey(name: 'KmsMasterKeyId')
  final String kmsMasterKeyId;

  /// Replica-specific configuration for the provisioned throughput.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final AwsDynamoDbTableProvisionedThroughputOverride
      provisionedThroughputOverride;

  /// The name of the Region where the replica is located.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// The current status of the replica.
  @_s.JsonKey(name: 'ReplicaStatus')
  final String replicaStatus;

  /// Detailed information about the replica status.
  @_s.JsonKey(name: 'ReplicaStatusDescription')
  final String replicaStatusDescription;

  AwsDynamoDbTableReplica({
    this.globalSecondaryIndexes,
    this.kmsMasterKeyId,
    this.provisionedThroughputOverride,
    this.regionName,
    this.replicaStatus,
    this.replicaStatusDescription,
  });
  factory AwsDynamoDbTableReplica.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableReplicaToJson(this);
}

/// Information about a global secondary index for a DynamoDB table replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableReplicaGlobalSecondaryIndex {
  /// The name of the index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Replica-specific configuration for the provisioned throughput for the index.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final AwsDynamoDbTableProvisionedThroughputOverride
      provisionedThroughputOverride;

  AwsDynamoDbTableReplicaGlobalSecondaryIndex({
    this.indexName,
    this.provisionedThroughputOverride,
  });
  factory AwsDynamoDbTableReplicaGlobalSecondaryIndex.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableReplicaGlobalSecondaryIndexFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableReplicaGlobalSecondaryIndexToJson(this);
}

/// Information about the restore for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableRestoreSummary {
  /// Indicates the point in time that the table was restored to.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'RestoreDateTime')
  final String restoreDateTime;

  /// Whether a restore is currently in progress.
  @_s.JsonKey(name: 'RestoreInProgress')
  final bool restoreInProgress;

  /// The ARN of the source backup from which the table was restored.
  @_s.JsonKey(name: 'SourceBackupArn')
  final String sourceBackupArn;

  /// The ARN of the source table for the backup.
  @_s.JsonKey(name: 'SourceTableArn')
  final String sourceTableArn;

  AwsDynamoDbTableRestoreSummary({
    this.restoreDateTime,
    this.restoreInProgress,
    this.sourceBackupArn,
    this.sourceTableArn,
  });
  factory AwsDynamoDbTableRestoreSummary.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableRestoreSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableRestoreSummaryToJson(this);
}

/// Information about the server-side encryption for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableSseDescription {
  /// If the key is inaccessible, the date and time when DynamoDB detected that
  /// the key was inaccessible.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'InaccessibleEncryptionDateTime')
  final String inaccessibleEncryptionDateTime;

  /// The ARN of the AWS KMS customer master key (CMK) that is used for the AWS
  /// KMS encryption.
  @_s.JsonKey(name: 'KmsMasterKeyArn')
  final String kmsMasterKeyArn;

  /// The type of server-side encryption.
  @_s.JsonKey(name: 'SseType')
  final String sseType;

  /// The status of the server-side encryption.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsDynamoDbTableSseDescription({
    this.inaccessibleEncryptionDateTime,
    this.kmsMasterKeyArn,
    this.sseType,
    this.status,
  });
  factory AwsDynamoDbTableSseDescription.fromJson(Map<String, dynamic> json) =>
      _$AwsDynamoDbTableSseDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AwsDynamoDbTableSseDescriptionToJson(this);
}

/// The current DynamoDB Streams configuration for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsDynamoDbTableStreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled on the table.
  @_s.JsonKey(name: 'StreamEnabled')
  final bool streamEnabled;

  /// Determines the information that is written to the table.
  @_s.JsonKey(name: 'StreamViewType')
  final String streamViewType;

  AwsDynamoDbTableStreamSpecification({
    this.streamEnabled,
    this.streamViewType,
  });
  factory AwsDynamoDbTableStreamSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$AwsDynamoDbTableStreamSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsDynamoDbTableStreamSpecificationToJson(this);
}

/// Information about an Elastic IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2EipDetails {
  /// The identifier that AWS assigns to represent the allocation of the Elastic
  /// IP address for use with Amazon VPC.
  @_s.JsonKey(name: 'AllocationId')
  final String allocationId;

  /// The identifier that represents the association of the Elastic IP address
  /// with an EC2 instance.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The domain in which to allocate the address.
  ///
  /// If the address is for use with EC2 instances in a VPC, then
  /// <code>Domain</code> is <code>vpc</code>. Otherwise, <code>Domain</code> is
  /// <code>standard</code>.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The identifier of the EC2 instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The name of the location from which the Elastic IP address is advertised.
  @_s.JsonKey(name: 'NetworkBorderGroup')
  final String networkBorderGroup;

  /// The identifier of the network interface.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// The AWS account ID of the owner of the network interface.
  @_s.JsonKey(name: 'NetworkInterfaceOwnerId')
  final String networkInterfaceOwnerId;

  /// The private IP address that is associated with the Elastic IP address.
  @_s.JsonKey(name: 'PrivateIpAddress')
  final String privateIpAddress;

  /// A public IP address that is associated with the EC2 instance.
  @_s.JsonKey(name: 'PublicIp')
  final String publicIp;

  /// The identifier of an IP address pool. This parameter allows Amazon EC2 to
  /// select an IP address from the address pool.
  @_s.JsonKey(name: 'PublicIpv4Pool')
  final String publicIpv4Pool;

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
  factory AwsEc2EipDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2EipDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2EipDetailsToJson(this);
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

  /// Indicates when the instance was launched.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// Indicates when the attachment initiated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// The IPv4 CIDR range. You can specify either a CIDR range or a source
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
  /// The IPv6 CIDR range. You can specify either a CIDR range or a source
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

/// An attachment to an AWS EC2 volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2VolumeAttachment {
  /// The datetime when the attachment initiated.
  @_s.JsonKey(name: 'AttachTime')
  final String attachTime;

  /// Whether the EBS volume is deleted when the EC2 instance is terminated.
  @_s.JsonKey(name: 'DeleteOnTermination')
  final bool deleteOnTermination;

  /// The identifier of the EC2 instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The attachment state of the volume.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsEc2VolumeAttachment({
    this.attachTime,
    this.deleteOnTermination,
    this.instanceId,
    this.status,
  });
  factory AwsEc2VolumeAttachment.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2VolumeAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2VolumeAttachmentToJson(this);
}

/// Details about an EC2 volume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2VolumeDetails {
  /// The volume attachments.
  @_s.JsonKey(name: 'Attachments')
  final List<AwsEc2VolumeAttachment> attachments;

  /// Indicates when the volume was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateTime')
  final String createTime;

  /// Whether the volume is encrypted.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The ARN of the AWS Key Management Service (AWS KMS) customer master key
  /// (CMK) that was used to protect the volume encryption key for the volume.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The size of the volume, in GiBs.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The snapshot from which the volume was created.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The volume state.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsEc2VolumeDetails({
    this.attachments,
    this.createTime,
    this.encrypted,
    this.kmsKeyId,
    this.size,
    this.snapshotId,
    this.status,
  });
  factory AwsEc2VolumeDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2VolumeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2VolumeDetailsToJson(this);
}

/// Details about an EC2 VPC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2VpcDetails {
  /// Information about the IPv4 CIDR blocks associated with the VPC.
  @_s.JsonKey(name: 'CidrBlockAssociationSet')
  final List<CidrBlockAssociation> cidrBlockAssociationSet;

  /// The identifier of the set of Dynamic Host Configuration Protocol (DHCP)
  /// options that are associated with the VPC. If the default options are
  /// associated with the VPC, then this is default.
  @_s.JsonKey(name: 'DhcpOptionsId')
  final String dhcpOptionsId;

  /// Information about the IPv6 CIDR blocks associated with the VPC.
  @_s.JsonKey(name: 'Ipv6CidrBlockAssociationSet')
  final List<Ipv6CidrBlockAssociation> ipv6CidrBlockAssociationSet;

  /// The current state of the VPC.
  @_s.JsonKey(name: 'State')
  final String state;

  AwsEc2VpcDetails({
    this.cidrBlockAssociationSet,
    this.dhcpOptionsId,
    this.ipv6CidrBlockAssociationSet,
    this.state,
  });
  factory AwsEc2VpcDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2VpcDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2VpcDetailsToJson(this);
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

/// Contains information about a stickiness policy that was created using
/// <code>CreateAppCookieStickinessPolicy</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbAppCookieStickinessPolicy {
  /// The name of the application cookie used for stickiness.
  @_s.JsonKey(name: 'CookieName')
  final String cookieName;

  /// The mnemonic name for the policy being created. The name must be unique
  /// within the set of policies for the load balancer.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsElbAppCookieStickinessPolicy({
    this.cookieName,
    this.policyName,
  });
  factory AwsElbAppCookieStickinessPolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsElbAppCookieStickinessPolicyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbAppCookieStickinessPolicyToJson(this);
}

/// Contains information about a stickiness policy that was created using
/// <code>CreateLBCookieStickinessPolicy</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLbCookieStickinessPolicy {
  /// The amount of time, in seconds, after which the cookie is considered stale.
  /// If an expiration period is not specified, the stickiness session lasts for
  /// the duration of the browser session.
  @_s.JsonKey(name: 'CookieExpirationPeriod')
  final int cookieExpirationPeriod;

  /// The name of the policy. The name must be unique within the set of policies
  /// for the load balancer.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsElbLbCookieStickinessPolicy({
    this.cookieExpirationPeriod,
    this.policyName,
  });
  factory AwsElbLbCookieStickinessPolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLbCookieStickinessPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLbCookieStickinessPolicyToJson(this);
}

/// Contains information about the access log configuration for the load
/// balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerAccessLog {
  /// The interval in minutes for publishing the access logs.
  ///
  /// You can publish access logs either every 5 minutes or every 60 minutes.
  @_s.JsonKey(name: 'EmitInterval')
  final int emitInterval;

  /// Indicates whether access logs are enabled for the load balancer.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The name of the S3 bucket where the access logs are stored.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The logical hierarchy that was created for the S3 bucket.
  ///
  /// If a prefix is not provided, the log is placed at the root level of the
  /// bucket.
  @_s.JsonKey(name: 'S3BucketPrefix')
  final String s3BucketPrefix;

  AwsElbLoadBalancerAccessLog({
    this.emitInterval,
    this.enabled,
    this.s3BucketName,
    this.s3BucketPrefix,
  });
  factory AwsElbLoadBalancerAccessLog.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerAccessLogFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerAccessLogToJson(this);
}

/// Contains attributes for the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerAttributes {
  /// Information about the access log configuration for the load balancer.
  ///
  /// If the access log is enabled, the load balancer captures detailed
  /// information about all requests. It delivers the information to a specified
  /// S3 bucket.
  @_s.JsonKey(name: 'AccessLog')
  final AwsElbLoadBalancerAccessLog accessLog;

  /// Information about the connection draining configuration for the load
  /// balancer.
  ///
  /// If connection draining is enabled, the load balancer allows existing
  /// requests to complete before it shifts traffic away from a deregistered or
  /// unhealthy instance.
  @_s.JsonKey(name: 'ConnectionDraining')
  final AwsElbLoadBalancerConnectionDraining connectionDraining;

  /// Connection settings for the load balancer.
  ///
  /// If an idle timeout is configured, the load balancer allows connections to
  /// remain idle for the specified duration. When a connection is idle, no data
  /// is sent over the connection.
  @_s.JsonKey(name: 'ConnectionSettings')
  final AwsElbLoadBalancerConnectionSettings connectionSettings;

  /// Cross-zone load balancing settings for the load balancer.
  ///
  /// If cross-zone load balancing is enabled, the load balancer routes the
  /// request traffic evenly across all instances regardless of the Availability
  /// Zones.
  @_s.JsonKey(name: 'CrossZoneLoadBalancing')
  final AwsElbLoadBalancerCrossZoneLoadBalancing crossZoneLoadBalancing;

  AwsElbLoadBalancerAttributes({
    this.accessLog,
    this.connectionDraining,
    this.connectionSettings,
    this.crossZoneLoadBalancing,
  });
  factory AwsElbLoadBalancerAttributes.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerAttributesToJson(this);
}

/// Provides information about the configuration of an EC2 instance for the load
/// balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerBackendServerDescription {
  /// The port on which the EC2 instance is listening.
  @_s.JsonKey(name: 'InstancePort')
  final int instancePort;

  /// The names of the policies that are enabled for the EC2 instance.
  @_s.JsonKey(name: 'PolicyNames')
  final List<String> policyNames;

  AwsElbLoadBalancerBackendServerDescription({
    this.instancePort,
    this.policyNames,
  });
  factory AwsElbLoadBalancerBackendServerDescription.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerBackendServerDescriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerBackendServerDescriptionToJson(this);
}

/// Contains information about the connection draining configuration for the
/// load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerConnectionDraining {
  /// Indicates whether connection draining is enabled for the load balancer.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The maximum time, in seconds, to keep the existing connections open before
  /// deregistering the instances.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  AwsElbLoadBalancerConnectionDraining({
    this.enabled,
    this.timeout,
  });
  factory AwsElbLoadBalancerConnectionDraining.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerConnectionDrainingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerConnectionDrainingToJson(this);
}

/// Contains connection settings for the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerConnectionSettings {
  /// The time, in seconds, that the connection can be idle (no data is sent over
  /// the connection) before it is closed by the load balancer.
  @_s.JsonKey(name: 'IdleTimeout')
  final int idleTimeout;

  AwsElbLoadBalancerConnectionSettings({
    this.idleTimeout,
  });
  factory AwsElbLoadBalancerConnectionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerConnectionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerConnectionSettingsToJson(this);
}

/// Contains cross-zone load balancing settings for the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerCrossZoneLoadBalancing {
  /// Indicates whether cross-zone load balancing is enabled for the load
  /// balancer.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  AwsElbLoadBalancerCrossZoneLoadBalancing({
    this.enabled,
  });
  factory AwsElbLoadBalancerCrossZoneLoadBalancing.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerCrossZoneLoadBalancingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerCrossZoneLoadBalancingToJson(this);
}

/// Contains details about a Classic Load Balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerDetails {
  /// The list of Availability Zones for the load balancer.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// Information about the configuration of the EC2 instances.
  @_s.JsonKey(name: 'BackendServerDescriptions')
  final List<AwsElbLoadBalancerBackendServerDescription>
      backendServerDescriptions;

  /// The name of the Amazon Route 53 hosted zone for the load balancer.
  @_s.JsonKey(name: 'CanonicalHostedZoneName')
  final String canonicalHostedZoneName;

  /// The ID of the Amazon Route 53 hosted zone for the load balancer.
  @_s.JsonKey(name: 'CanonicalHostedZoneNameID')
  final String canonicalHostedZoneNameID;

  /// Indicates when the load balancer was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreatedTime')
  final String createdTime;

  /// The DNS name of the load balancer.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// Information about the health checks that are conducted on the load balancer.
  @_s.JsonKey(name: 'HealthCheck')
  final AwsElbLoadBalancerHealthCheck healthCheck;

  /// List of EC2 instances for the load balancer.
  @_s.JsonKey(name: 'Instances')
  final List<AwsElbLoadBalancerInstance> instances;

  /// The policies that are enabled for the load balancer listeners.
  @_s.JsonKey(name: 'ListenerDescriptions')
  final List<AwsElbLoadBalancerListenerDescription> listenerDescriptions;

  /// The attributes for a load balancer.
  @_s.JsonKey(name: 'LoadBalancerAttributes')
  final AwsElbLoadBalancerAttributes loadBalancerAttributes;

  /// The name of the load balancer.
  @_s.JsonKey(name: 'LoadBalancerName')
  final String loadBalancerName;

  /// The policies for a load balancer.
  @_s.JsonKey(name: 'Policies')
  final AwsElbLoadBalancerPolicies policies;

  /// The type of load balancer. Only provided if the load balancer is in a VPC.
  ///
  /// If <code>Scheme</code> is <code>internet-facing</code>, the load balancer
  /// has a public DNS name that resolves to a public IP address.
  ///
  /// If <code>Scheme</code> is <code>internal</code>, the load balancer has a
  /// public DNS name that resolves to a private IP address.
  @_s.JsonKey(name: 'Scheme')
  final String scheme;

  /// The security groups for the load balancer. Only provided if the load
  /// balancer is in a VPC.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  /// Information about the security group for the load balancer. This is the
  /// security group that is used for inbound rules.
  @_s.JsonKey(name: 'SourceSecurityGroup')
  final AwsElbLoadBalancerSourceSecurityGroup sourceSecurityGroup;

  /// The list of subnet identifiers for the load balancer.
  @_s.JsonKey(name: 'Subnets')
  final List<String> subnets;

  /// The identifier of the VPC for the load balancer.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

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
  factory AwsElbLoadBalancerDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerDetailsToJson(this);
}

/// Contains information about the health checks that are conducted on the load
/// balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerHealthCheck {
  /// The number of consecutive health check successes required before the
  /// instance is moved to the Healthy state.
  @_s.JsonKey(name: 'HealthyThreshold')
  final int healthyThreshold;

  /// The approximate interval, in seconds, between health checks of an individual
  /// instance.
  @_s.JsonKey(name: 'Interval')
  final int interval;

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
  @_s.JsonKey(name: 'Target')
  final String target;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The number of consecutive health check failures that must occur before the
  /// instance is moved to the Unhealthy state.
  @_s.JsonKey(name: 'UnhealthyThreshold')
  final int unhealthyThreshold;

  AwsElbLoadBalancerHealthCheck({
    this.healthyThreshold,
    this.interval,
    this.target,
    this.timeout,
    this.unhealthyThreshold,
  });
  factory AwsElbLoadBalancerHealthCheck.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerHealthCheckFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerHealthCheckToJson(this);
}

/// Provides information about an EC2 instance for a load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerInstance {
  /// The instance identifier.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  AwsElbLoadBalancerInstance({
    this.instanceId,
  });
  factory AwsElbLoadBalancerInstance.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerInstanceFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerInstanceToJson(this);
}

/// Information about a load balancer listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerListener {
  /// The port on which the instance is listening.
  @_s.JsonKey(name: 'InstancePort')
  final int instancePort;

  /// The protocol to use to route traffic to instances.
  ///
  /// Valid values: <code>HTTP</code> | <code>HTTPS</code> | <code>TCP</code> |
  /// <code>SSL</code>
  @_s.JsonKey(name: 'InstanceProtocol')
  final String instanceProtocol;

  /// The port on which the load balancer is listening.
  ///
  /// On EC2-VPC, you can specify any port from the range 1-65535.
  ///
  /// On EC2-Classic, you can specify any port from the following list: 25, 80,
  /// 443, 465, 587, 1024-65535.
  @_s.JsonKey(name: 'LoadBalancerPort')
  final int loadBalancerPort;

  /// The load balancer transport protocol to use for routing.
  ///
  /// Valid values: <code>HTTP</code> | <code>HTTPS</code> | <code>TCP</code> |
  /// <code>SSL</code>
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  /// The ARN of the server certificate.
  @_s.JsonKey(name: 'SslCertificateId')
  final String sslCertificateId;

  AwsElbLoadBalancerListener({
    this.instancePort,
    this.instanceProtocol,
    this.loadBalancerPort,
    this.protocol,
    this.sslCertificateId,
  });
  factory AwsElbLoadBalancerListener.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerListenerFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerListenerToJson(this);
}

/// Lists the policies that are enabled for a load balancer listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerListenerDescription {
  /// Information about the listener.
  @_s.JsonKey(name: 'Listener')
  final AwsElbLoadBalancerListener listener;

  /// The policies enabled for the listener.
  @_s.JsonKey(name: 'PolicyNames')
  final List<String> policyNames;

  AwsElbLoadBalancerListenerDescription({
    this.listener,
    this.policyNames,
  });
  factory AwsElbLoadBalancerListenerDescription.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerListenerDescriptionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerListenerDescriptionToJson(this);
}

/// Contains information about the policies for a load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerPolicies {
  /// The stickiness policies that are created using
  /// <code>CreateAppCookieStickinessPolicy</code>.
  @_s.JsonKey(name: 'AppCookieStickinessPolicies')
  final List<AwsElbAppCookieStickinessPolicy> appCookieStickinessPolicies;

  /// The stickiness policies that are created using
  /// <code>CreateLBCookieStickinessPolicy</code>.
  @_s.JsonKey(name: 'LbCookieStickinessPolicies')
  final List<AwsElbLbCookieStickinessPolicy> lbCookieStickinessPolicies;

  /// The policies other than the stickiness policies.
  @_s.JsonKey(name: 'OtherPolicies')
  final List<String> otherPolicies;

  AwsElbLoadBalancerPolicies({
    this.appCookieStickinessPolicies,
    this.lbCookieStickinessPolicies,
    this.otherPolicies,
  });
  factory AwsElbLoadBalancerPolicies.fromJson(Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerPoliciesFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbLoadBalancerPoliciesToJson(this);
}

/// Contains information about the security group for the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbLoadBalancerSourceSecurityGroup {
  /// The name of the security group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The owner of the security group.
  @_s.JsonKey(name: 'OwnerAlias')
  final String ownerAlias;

  AwsElbLoadBalancerSourceSecurityGroup({
    this.groupName,
    this.ownerAlias,
  });
  factory AwsElbLoadBalancerSourceSecurityGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElbLoadBalancerSourceSecurityGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElbLoadBalancerSourceSecurityGroupToJson(this);
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

  /// Indicates when the load balancer was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// The identifier of the access key.
  @_s.JsonKey(name: 'AccessKeyId')
  final String accessKeyId;

  /// The AWS account ID of the account for the key.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// Indicates when the IAM access key was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

  /// Information about the session that the key was used for.
  @_s.JsonKey(name: 'SessionContext')
  final AwsIamAccessKeySessionContext sessionContext;

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
  factory AwsIamAccessKeyDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamAccessKeyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamAccessKeyDetailsToJson(this);
}

/// Provides information about the session that the key was used for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamAccessKeySessionContext {
  /// Attributes of the session that the key was used for.
  @_s.JsonKey(name: 'Attributes')
  final AwsIamAccessKeySessionContextAttributes attributes;

  /// Information about the entity that created the session.
  @_s.JsonKey(name: 'SessionIssuer')
  final AwsIamAccessKeySessionContextSessionIssuer sessionIssuer;

  AwsIamAccessKeySessionContext({
    this.attributes,
    this.sessionIssuer,
  });
  factory AwsIamAccessKeySessionContext.fromJson(Map<String, dynamic> json) =>
      _$AwsIamAccessKeySessionContextFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamAccessKeySessionContextToJson(this);
}

/// Attributes of the session that the key was used for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamAccessKeySessionContextAttributes {
  /// Indicates when the session was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Indicates whether the session used multi-factor authentication (MFA).
  @_s.JsonKey(name: 'MfaAuthenticated')
  final bool mfaAuthenticated;

  AwsIamAccessKeySessionContextAttributes({
    this.creationDate,
    this.mfaAuthenticated,
  });
  factory AwsIamAccessKeySessionContextAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$AwsIamAccessKeySessionContextAttributesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsIamAccessKeySessionContextAttributesToJson(this);
}

/// Information about the entity that created the session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamAccessKeySessionContextSessionIssuer {
  /// The identifier of the AWS account that created the session.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The ARN of the session.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The principal ID of the principal (user, role, or group) that created the
  /// session.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The type of principal (user, role, or group) that created the session.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The name of the principal that created the session.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  AwsIamAccessKeySessionContextSessionIssuer({
    this.accountId,
    this.arn,
    this.principalId,
    this.type,
    this.userName,
  });
  factory AwsIamAccessKeySessionContextSessionIssuer.fromJson(
          Map<String, dynamic> json) =>
      _$AwsIamAccessKeySessionContextSessionIssuerFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsIamAccessKeySessionContextSessionIssuerToJson(this);
}

enum AwsIamAccessKeyStatus {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inactive')
  inactive,
}

/// A managed policy that is attached to an IAM principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamAttachedManagedPolicy {
  /// The ARN of the policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// The name of the policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsIamAttachedManagedPolicy({
    this.policyArn,
    this.policyName,
  });
  factory AwsIamAttachedManagedPolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsIamAttachedManagedPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamAttachedManagedPolicyToJson(this);
}

/// Contains details about an IAM group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamGroupDetails {
  /// A list of the managed policies that are attached to the IAM group.
  @_s.JsonKey(name: 'AttachedManagedPolicies')
  final List<AwsIamAttachedManagedPolicy> attachedManagedPolicies;

  /// Indicates when the IAM group was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The identifier of the IAM group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  /// The name of the IAM group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The list of inline policies that are embedded in the group.
  @_s.JsonKey(name: 'GroupPolicyList')
  final List<AwsIamGroupPolicy> groupPolicyList;

  /// The path to the group.
  @_s.JsonKey(name: 'Path')
  final String path;

  AwsIamGroupDetails({
    this.attachedManagedPolicies,
    this.createDate,
    this.groupId,
    this.groupName,
    this.groupPolicyList,
    this.path,
  });
  factory AwsIamGroupDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamGroupDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamGroupDetailsToJson(this);
}

/// A managed policy that is attached to the IAM group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamGroupPolicy {
  /// The name of the policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsIamGroupPolicy({
    this.policyName,
  });
  factory AwsIamGroupPolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsIamGroupPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamGroupPolicyToJson(this);
}

/// Information about an instance profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamInstanceProfile {
  /// The ARN of the instance profile.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Indicates when the instance profile was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The identifier of the instance profile.
  @_s.JsonKey(name: 'InstanceProfileId')
  final String instanceProfileId;

  /// The name of the instance profile.
  @_s.JsonKey(name: 'InstanceProfileName')
  final String instanceProfileName;

  /// The path to the instance profile.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The roles associated with the instance profile.
  @_s.JsonKey(name: 'Roles')
  final List<AwsIamInstanceProfileRole> roles;

  AwsIamInstanceProfile({
    this.arn,
    this.createDate,
    this.instanceProfileId,
    this.instanceProfileName,
    this.path,
    this.roles,
  });
  factory AwsIamInstanceProfile.fromJson(Map<String, dynamic> json) =>
      _$AwsIamInstanceProfileFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamInstanceProfileToJson(this);
}

/// Information about a role associated with an instance profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamInstanceProfileRole {
  /// The ARN of the role.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The policy that grants an entity permission to assume the role.
  @_s.JsonKey(name: 'AssumeRolePolicyDocument')
  final String assumeRolePolicyDocument;

  /// Indicates when the role was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The path to the role.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The identifier of the role.
  @_s.JsonKey(name: 'RoleId')
  final String roleId;

  /// The name of the role.
  @_s.JsonKey(name: 'RoleName')
  final String roleName;

  AwsIamInstanceProfileRole({
    this.arn,
    this.assumeRolePolicyDocument,
    this.createDate,
    this.path,
    this.roleId,
    this.roleName,
  });
  factory AwsIamInstanceProfileRole.fromJson(Map<String, dynamic> json) =>
      _$AwsIamInstanceProfileRoleFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamInstanceProfileRoleToJson(this);
}

/// Information about the policy used to set the permissions boundary for an IAM
/// principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamPermissionsBoundary {
  /// The ARN of the policy used to set the permissions boundary.
  @_s.JsonKey(name: 'PermissionsBoundaryArn')
  final String permissionsBoundaryArn;

  /// The usage type for the permissions boundary.
  @_s.JsonKey(name: 'PermissionsBoundaryType')
  final String permissionsBoundaryType;

  AwsIamPermissionsBoundary({
    this.permissionsBoundaryArn,
    this.permissionsBoundaryType,
  });
  factory AwsIamPermissionsBoundary.fromJson(Map<String, dynamic> json) =>
      _$AwsIamPermissionsBoundaryFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamPermissionsBoundaryToJson(this);
}

/// Represents an IAM permissions policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamPolicyDetails {
  /// The number of users, groups, and roles that the policy is attached to.
  @_s.JsonKey(name: 'AttachmentCount')
  final int attachmentCount;

  /// When the policy was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The identifier of the default version of the policy.
  @_s.JsonKey(name: 'DefaultVersionId')
  final String defaultVersionId;

  /// A description of the policy.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Whether the policy can be attached to a user, group, or role.
  @_s.JsonKey(name: 'IsAttachable')
  final bool isAttachable;

  /// The path to the policy.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The number of users and roles that use the policy to set the permissions
  /// boundary.
  @_s.JsonKey(name: 'PermissionsBoundaryUsageCount')
  final int permissionsBoundaryUsageCount;

  /// The unique identifier of the policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The name of the policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// List of versions of the policy.
  @_s.JsonKey(name: 'PolicyVersionList')
  final List<AwsIamPolicyVersion> policyVersionList;

  /// When the policy was most recently updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'UpdateDate')
  final String updateDate;

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
  factory AwsIamPolicyDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamPolicyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamPolicyDetailsToJson(this);
}

/// A version of an IAM policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamPolicyVersion {
  /// Indicates when the version was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// Whether the version is the default version.
  @_s.JsonKey(name: 'IsDefaultVersion')
  final bool isDefaultVersion;

  /// The identifier of the policy version.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  AwsIamPolicyVersion({
    this.createDate,
    this.isDefaultVersion,
    this.versionId,
  });
  factory AwsIamPolicyVersion.fromJson(Map<String, dynamic> json) =>
      _$AwsIamPolicyVersionFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamPolicyVersionToJson(this);
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

  /// The list of the managed policies that are attached to the role.
  @_s.JsonKey(name: 'AttachedManagedPolicies')
  final List<AwsIamAttachedManagedPolicy> attachedManagedPolicies;

  /// Indicates when the role was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The list of instance profiles that contain this role.
  @_s.JsonKey(name: 'InstanceProfileList')
  final List<AwsIamInstanceProfile> instanceProfileList;

  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role.
  @_s.JsonKey(name: 'MaxSessionDuration')
  final int maxSessionDuration;

  /// The path to the role.
  @_s.JsonKey(name: 'Path')
  final String path;
  @_s.JsonKey(name: 'PermissionsBoundary')
  final AwsIamPermissionsBoundary permissionsBoundary;

  /// The stable and unique string identifying the role.
  @_s.JsonKey(name: 'RoleId')
  final String roleId;

  /// The friendly name that identifies the role.
  @_s.JsonKey(name: 'RoleName')
  final String roleName;

  /// The list of inline policies that are embedded in the role.
  @_s.JsonKey(name: 'RolePolicyList')
  final List<AwsIamRolePolicy> rolePolicyList;

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
  factory AwsIamRoleDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamRoleDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamRoleDetailsToJson(this);
}

/// An inline policy that is embedded in the role.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamRolePolicy {
  /// The name of the policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsIamRolePolicy({
    this.policyName,
  });
  factory AwsIamRolePolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsIamRolePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamRolePolicyToJson(this);
}

/// Information about an IAM user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamUserDetails {
  /// A list of the managed policies that are attached to the user.
  @_s.JsonKey(name: 'AttachedManagedPolicies')
  final List<AwsIamAttachedManagedPolicy> attachedManagedPolicies;

  /// Indicates when the user was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// A list of IAM groups that the user belongs to.
  @_s.JsonKey(name: 'GroupList')
  final List<String> groupList;

  /// The path to the user.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The permissions boundary for the user.
  @_s.JsonKey(name: 'PermissionsBoundary')
  final AwsIamPermissionsBoundary permissionsBoundary;

  /// The unique identifier for the user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// The name of the user.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  /// The list of inline policies that are embedded in the user.
  @_s.JsonKey(name: 'UserPolicyList')
  final List<AwsIamUserPolicy> userPolicyList;

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
  factory AwsIamUserDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamUserDetailsToJson(this);
}

/// Information about an inline policy that is embedded in the user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamUserPolicy {
  /// The name of the policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AwsIamUserPolicy({
    this.policyName,
  });
  factory AwsIamUserPolicy.fromJson(Map<String, dynamic> json) =>
      _$AwsIamUserPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamUserPolicyToJson(this);
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

  /// Indicates when the CMK was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'CreationDate')
  final double creationDate;

  /// A description of the key.
  @_s.JsonKey(name: 'Description')
  final String description;

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
    this.description,
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

  /// Indicates when the function was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// The layer's compatible runtimes. Maximum number of five items.
  ///
  /// Valid values: <code>nodejs10.x</code> | <code>nodejs12.x</code> |
  /// <code>java8</code> | <code>java11</code> | <code>python2.7</code> |
  /// <code>python3.6</code> | <code>python3.7</code> | <code>python3.8</code> |
  /// <code>dotnetcore1.0</code> | <code>dotnetcore2.1</code> | <code>go1.x</code>
  /// | <code>ruby2.5</code> | <code>provided</code>
  @_s.JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// Indicates when the version was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

/// An IAM role that is associated with the Amazon RDS DB cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbClusterAssociatedRole {
  /// The ARN of the IAM role.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The status of the association between the IAM role and the DB cluster.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRdsDbClusterAssociatedRole({
    this.roleArn,
    this.status,
  });
  factory AwsRdsDbClusterAssociatedRole.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbClusterAssociatedRoleFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbClusterAssociatedRoleToJson(this);
}

/// Information about an Amazon RDS DB cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbClusterDetails {
  /// The status of the database activity stream.
  @_s.JsonKey(name: 'ActivityStreamStatus')
  final String activityStreamStatus;

  /// For all database engines except Aurora, specifies the allocated storage size
  /// in gibibytes (GiB).
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// A list of the IAM roles that are associated with the DB cluster.
  @_s.JsonKey(name: 'AssociatedRoles')
  final List<AwsRdsDbClusterAssociatedRole> associatedRoles;

  /// A list of Availability Zones (AZs) where instances in the DB cluster can be
  /// created.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The number of days for which automated backups are retained.
  @_s.JsonKey(name: 'BackupRetentionPeriod')
  final int backupRetentionPeriod;

  /// Indicates when the DB cluster was created, in Universal Coordinated Time
  /// (UTC).
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'ClusterCreateTime')
  final String clusterCreateTime;

  /// Whether tags are copied from the DB cluster to snapshots of the DB cluster.
  @_s.JsonKey(name: 'CopyTagsToSnapshot')
  final bool copyTagsToSnapshot;

  /// Whether the DB cluster is a clone of a DB cluster owned by a different AWS
  /// account.
  @_s.JsonKey(name: 'CrossAccountClone')
  final bool crossAccountClone;

  /// A list of custom endpoints for the DB cluster.
  @_s.JsonKey(name: 'CustomEndpoints')
  final List<String> customEndpoints;

  /// The name of the database.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The DB cluster identifier that the user assigned to the cluster. This
  /// identifier is the unique key that identifies a DB cluster.
  @_s.JsonKey(name: 'DbClusterIdentifier')
  final String dbClusterIdentifier;

  /// The list of instances that make up the DB cluster.
  @_s.JsonKey(name: 'DbClusterMembers')
  final List<AwsRdsDbClusterMember> dbClusterMembers;

  /// The list of option group memberships for this DB cluster.
  @_s.JsonKey(name: 'DbClusterOptionGroupMemberships')
  final List<AwsRdsDbClusterOptionGroupMembership>
      dbClusterOptionGroupMemberships;

  /// The name of the DB cluster parameter group for the DB cluster.
  @_s.JsonKey(name: 'DbClusterParameterGroup')
  final String dbClusterParameterGroup;

  /// The identifier of the DB cluster. The identifier must be unique within each
  /// AWS Region and is immutable.
  @_s.JsonKey(name: 'DbClusterResourceId')
  final String dbClusterResourceId;

  /// The subnet group that is associated with the DB cluster, including the name,
  /// description, and subnets in the subnet group.
  @_s.JsonKey(name: 'DbSubnetGroup')
  final String dbSubnetGroup;

  /// Whether the DB cluster has deletion protection enabled.
  @_s.JsonKey(name: 'DeletionProtection')
  final bool deletionProtection;

  /// The Active Directory domain membership records that are associated with the
  /// DB cluster.
  @_s.JsonKey(name: 'DomainMemberships')
  final List<AwsRdsDbDomainMembership> domainMemberships;

  /// A list of log types that this DB cluster is configured to export to
  /// CloudWatch Logs.
  @_s.JsonKey(name: 'EnabledCloudWatchLogsExports')
  final List<String> enabledCloudWatchLogsExports;

  /// The connection endpoint for the primary instance of the DB cluster.
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  /// The name of the database engine to use for this DB cluster.
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// The database engine mode of the DB cluster.
  @_s.JsonKey(name: 'EngineMode')
  final String engineMode;

  /// The version number of the database engine to use.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// Specifies the identifier that Amazon Route 53 assigns when you create a
  /// hosted zone.
  @_s.JsonKey(name: 'HostedZoneId')
  final String hostedZoneId;

  /// Whether the HTTP endpoint for an Aurora Serverless DB cluster is enabled.
  @_s.JsonKey(name: 'HttpEndpointEnabled')
  final bool httpEndpointEnabled;

  /// Whether the mapping of IAM accounts to database accounts is enabled.
  @_s.JsonKey(name: 'IamDatabaseAuthenticationEnabled')
  final bool iamDatabaseAuthenticationEnabled;

  /// The ARN of the AWS KMS master key that is used to encrypt the database
  /// instances in the DB cluster.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The name of the master user for the DB cluster.
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;

  /// Whether the DB cluster has instances in multiple Availability Zones.
  @_s.JsonKey(name: 'MultiAz')
  final bool multiAz;

  /// The port number on which the DB instances in the DB cluster accept
  /// connections.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// The range of time each day when automated backups are created, if automated
  /// backups are enabled.
  ///
  /// Uses the format <code>HH:MM-HH:MM</code>. For example,
  /// <code>04:52-05:22</code>.
  @_s.JsonKey(name: 'PreferredBackupWindow')
  final String preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Uses the format <code>&lt;day&gt;:HH:MM-&lt;day&gt;:HH:MM</code>.
  ///
  /// For the day values, use
  /// <code>mon</code>|<code>tue</code>|<code>wed</code>|<code>thu</code>|<code>fri</code>|<code>sat</code>|<code>sun</code>.
  ///
  /// For example, <code>sun:09:32-sun:10:02</code>.
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// The identifiers of the read replicas that are associated with this DB
  /// cluster.
  @_s.JsonKey(name: 'ReadReplicaIdentifiers')
  final List<String> readReplicaIdentifiers;

  /// The reader endpoint for the DB cluster.
  @_s.JsonKey(name: 'ReaderEndpoint')
  final String readerEndpoint;

  /// The current status of this DB cluster.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Whether the DB cluster is encrypted.
  @_s.JsonKey(name: 'StorageEncrypted')
  final bool storageEncrypted;

  /// A list of VPC security groups that the DB cluster belongs to.
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<AwsRdsDbInstanceVpcSecurityGroup> vpcSecurityGroups;

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
  factory AwsRdsDbClusterDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbClusterDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbClusterDetailsToJson(this);
}

/// Information about an instance in the DB cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbClusterMember {
  /// The status of the DB cluster parameter group for this member of the DB
  /// cluster.
  @_s.JsonKey(name: 'DbClusterParameterGroupStatus')
  final String dbClusterParameterGroupStatus;

  /// The instance identifier for this member of the DB cluster.
  @_s.JsonKey(name: 'DbInstanceIdentifier')
  final String dbInstanceIdentifier;

  /// Whether the cluster member is the primary instance for the DB cluster.
  @_s.JsonKey(name: 'IsClusterWriter')
  final bool isClusterWriter;

  /// Specifies the order in which an Aurora replica is promoted to the primary
  /// instance when the existing primary instance fails.
  @_s.JsonKey(name: 'PromotionTier')
  final int promotionTier;

  AwsRdsDbClusterMember({
    this.dbClusterParameterGroupStatus,
    this.dbInstanceIdentifier,
    this.isClusterWriter,
    this.promotionTier,
  });
  factory AwsRdsDbClusterMember.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbClusterMemberFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbClusterMemberToJson(this);
}

/// Information about an option group membership for a DB cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbClusterOptionGroupMembership {
  /// The name of the DB cluster option group.
  @_s.JsonKey(name: 'DbClusterOptionGroupName')
  final String dbClusterOptionGroupName;

  /// The status of the DB cluster option group.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRdsDbClusterOptionGroupMembership({
    this.dbClusterOptionGroupName,
    this.status,
  });
  factory AwsRdsDbClusterOptionGroupMembership.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRdsDbClusterOptionGroupMembershipFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRdsDbClusterOptionGroupMembershipToJson(this);
}

/// Information about an Amazon RDS DB cluster snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbClusterSnapshotDetails {
  /// Specifies the allocated storage size in gibibytes (GiB).
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// A list of Availability Zones where instances in the DB cluster can be
  /// created.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// Indicates when the DB cluster was created, in Universal Coordinated Time
  /// (UTC).
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'ClusterCreateTime')
  final String clusterCreateTime;

  /// The DB cluster identifier.
  @_s.JsonKey(name: 'DbClusterIdentifier')
  final String dbClusterIdentifier;

  /// The identifier of the DB cluster snapshot.
  @_s.JsonKey(name: 'DbClusterSnapshotIdentifier')
  final String dbClusterSnapshotIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// The version of the database engine to use.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// Whether mapping of IAM accounts to database accounts is enabled.
  @_s.JsonKey(name: 'IamDatabaseAuthenticationEnabled')
  final bool iamDatabaseAuthenticationEnabled;

  /// The ARN of the AWS KMS master key that is used to encrypt the database
  /// instances in the DB cluster.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The license model information for this DB cluster snapshot.
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;

  /// The name of the master user for the DB cluster.
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;

  /// Specifies the percentage of the estimated data that has been transferred.
  @_s.JsonKey(name: 'PercentProgress')
  final int percentProgress;

  /// The port number on which the DB instances in the DB cluster accept
  /// connections.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// Indicates when the snapshot was taken.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'SnapshotCreateTime')
  final String snapshotCreateTime;

  /// The type of DB cluster snapshot.
  @_s.JsonKey(name: 'SnapshotType')
  final String snapshotType;

  /// The status of this DB cluster snapshot.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// Whether the DB cluster is encrypted.
  @_s.JsonKey(name: 'StorageEncrypted')
  final bool storageEncrypted;

  /// The VPC ID that is associated with the DB cluster snapshot.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

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
  factory AwsRdsDbClusterSnapshotDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbClusterSnapshotDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbClusterSnapshotDetailsToJson(this);
}

/// Information about an Active Directory domain membership record associated
/// with the DB instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbDomainMembership {
  /// The identifier of the Active Directory domain.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The fully qualified domain name of the Active Directory domain.
  @_s.JsonKey(name: 'Fqdn')
  final String fqdn;

  /// The name of the IAM role to use when making API calls to the Directory
  /// Service.
  @_s.JsonKey(name: 'IamRoleName')
  final String iamRoleName;

  /// The status of the Active Directory Domain membership for the DB instance.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRdsDbDomainMembership({
    this.domain,
    this.fqdn,
    this.iamRoleName,
    this.status,
  });
  factory AwsRdsDbDomainMembership.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbDomainMembershipFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbDomainMembershipToJson(this);
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
  /// The amount of storage (in gigabytes) to initially allocate for the DB
  /// instance.
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// The AWS Identity and Access Management (IAM) roles associated with the DB
  /// instance.
  @_s.JsonKey(name: 'AssociatedRoles')
  final List<AwsRdsDbInstanceAssociatedRole> associatedRoles;

  /// Indicates whether minor version patches are applied automatically.
  @_s.JsonKey(name: 'AutoMinorVersionUpgrade')
  final bool autoMinorVersionUpgrade;

  /// The Availability Zone where the DB instance will be created.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The number of days for which to retain automated backups.
  @_s.JsonKey(name: 'BackupRetentionPeriod')
  final int backupRetentionPeriod;

  /// The identifier of the CA certificate for this DB instance.
  @_s.JsonKey(name: 'CACertificateIdentifier')
  final String cACertificateIdentifier;

  /// The name of the character set that this DB instance is associated with.
  @_s.JsonKey(name: 'CharacterSetName')
  final String characterSetName;

  /// Whether to copy resource tags to snapshots of the DB instance.
  @_s.JsonKey(name: 'CopyTagsToSnapshot')
  final bool copyTagsToSnapshot;

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

  /// The current status of the DB instance.
  @_s.JsonKey(name: 'DbInstanceStatus')
  final String dbInstanceStatus;

  /// A list of the DB parameter groups to assign to the DB instance.
  @_s.JsonKey(name: 'DbParameterGroups')
  final List<AwsRdsDbParameterGroup> dbParameterGroups;

  /// A list of the DB security groups to assign to the DB instance.
  @_s.JsonKey(name: 'DbSecurityGroups')
  final List<String> dbSecurityGroups;

  /// Information about the subnet group that is associated with the DB instance.
  @_s.JsonKey(name: 'DbSubnetGroup')
  final AwsRdsDbSubnetGroup dbSubnetGroup;

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

  /// The Active Directory domain membership records associated with the DB
  /// instance.
  @_s.JsonKey(name: 'DomainMemberships')
  final List<AwsRdsDbDomainMembership> domainMemberships;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  @_s.JsonKey(name: 'EnabledCloudWatchLogsExports')
  final List<String> enabledCloudWatchLogsExports;

  /// Specifies the connection endpoint.
  @_s.JsonKey(name: 'Endpoint')
  final AwsRdsDbInstanceEndpoint endpoint;

  /// Provides the name of the database engine to use for this DB instance.
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// Indicates the database engine version.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// The ARN of the CloudWatch Logs log stream that receives the enhanced
  /// monitoring metrics data for the DB instance.
  @_s.JsonKey(name: 'EnhancedMonitoringResourceArn')
  final String enhancedMonitoringResourceArn;

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

  /// Indicates when the DB instance was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'InstanceCreateTime')
  final String instanceCreateTime;

  /// Specifies the provisioned IOPS (I/O operations per second) for this DB
  /// instance.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB instance.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LatestRestorableTime')
  final String latestRestorableTime;

  /// License model information for this DB instance.
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;
  @_s.JsonKey(name: 'ListenerEndpoint')
  final AwsRdsDbInstanceEndpoint listenerEndpoint;

  /// The master user name of the DB instance.
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;

  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  @_s.JsonKey(name: 'MaxAllocatedStorage')
  final int maxAllocatedStorage;

  /// The interval, in seconds, between points when enhanced monitoring metrics
  /// are collected for the DB instance.
  @_s.JsonKey(name: 'MonitoringInterval')
  final int monitoringInterval;

  /// The ARN for the IAM role that permits Amazon RDS to send enhanced monitoring
  /// metrics to CloudWatch Logs.
  @_s.JsonKey(name: 'MonitoringRoleArn')
  final String monitoringRoleArn;

  /// Whether the DB instance is a multiple Availability Zone deployment.
  @_s.JsonKey(name: 'MultiAz')
  final bool multiAz;

  /// The list of option group memberships for this DB instance.
  @_s.JsonKey(name: 'OptionGroupMemberships')
  final List<AwsRdsDbOptionGroupMembership> optionGroupMemberships;

  /// Changes to the DB instance that are currently pending.
  @_s.JsonKey(name: 'PendingModifiedValues')
  final AwsRdsDbPendingModifiedValues pendingModifiedValues;

  /// Indicates whether Performance Insights is enabled for the DB instance.
  @_s.JsonKey(name: 'PerformanceInsightsEnabled')
  final bool performanceInsightsEnabled;

  /// The identifier of the AWS KMS key used to encrypt the Performance Insights
  /// data.
  @_s.JsonKey(name: 'PerformanceInsightsKmsKeyId')
  final String performanceInsightsKmsKeyId;

  /// The number of days to retain Performance Insights data.
  @_s.JsonKey(name: 'PerformanceInsightsRetentionPeriod')
  final int performanceInsightsRetentionPeriod;

  /// The range of time each day when automated backups are created, if automated
  /// backups are enabled.
  ///
  /// Uses the format <code>HH:MM-HH:MM</code>. For example,
  /// <code>04:52-05:22</code>.
  @_s.JsonKey(name: 'PreferredBackupWindow')
  final String preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur, in
  /// Universal Coordinated Time (UTC).
  ///
  /// Uses the format <code>&lt;day&gt;:HH:MM-&lt;day&gt;:HH:MM</code>.
  ///
  /// For the day values, use
  /// <code>mon</code>|<code>tue</code>|<code>wed</code>|<code>thu</code>|<code>fri</code>|<code>sat</code>|<code>sun</code>.
  ///
  /// For example, <code>sun:09:32-sun:10:02</code>.
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  @_s.JsonKey(name: 'ProcessorFeatures')
  final List<AwsRdsDbProcessorFeature> processorFeatures;

  /// The order in which to promote an Aurora replica to the primary instance
  /// after a failure of the existing primary instance.
  @_s.JsonKey(name: 'PromotionTier')
  final int promotionTier;

  /// Specifies the accessibility options for the DB instance.
  ///
  /// A value of true specifies an Internet-facing instance with a publicly
  /// resolvable DNS name, which resolves to a public IP address.
  ///
  /// A value of false specifies an internal instance with a DNS name that
  /// resolves to a private IP address.
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;

  /// List of identifiers of Aurora DB clusters to which the RDS DB instance is
  /// replicated as a read replica.
  @_s.JsonKey(name: 'ReadReplicaDBClusterIdentifiers')
  final List<String> readReplicaDBClusterIdentifiers;

  /// List of identifiers of the read replicas associated with this DB instance.
  @_s.JsonKey(name: 'ReadReplicaDBInstanceIdentifiers')
  final List<String> readReplicaDBInstanceIdentifiers;

  /// If this DB instance is a read replica, contains the identifier of the source
  /// DB instance.
  @_s.JsonKey(name: 'ReadReplicaSourceDBInstanceIdentifier')
  final String readReplicaSourceDBInstanceIdentifier;

  /// For a DB instance with multi-Availability Zone support, the name of the
  /// secondary Availability Zone.
  @_s.JsonKey(name: 'SecondaryAvailabilityZone')
  final String secondaryAvailabilityZone;

  /// The status of a read replica. If the instance isn't a read replica, this is
  /// empty.
  @_s.JsonKey(name: 'StatusInfos')
  final List<AwsRdsDbStatusInfo> statusInfos;

  /// Specifies whether the DB instance is encrypted.
  @_s.JsonKey(name: 'StorageEncrypted')
  final bool storageEncrypted;

  /// The storage type for the DB instance.
  @_s.JsonKey(name: 'StorageType')
  final String storageType;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  @_s.JsonKey(name: 'TdeCredentialArn')
  final String tdeCredentialArn;

  /// The time zone of the DB instance.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// A list of VPC security groups that the DB instance belongs to.
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<AwsRdsDbInstanceVpcSecurityGroup> vpcSecurityGroups;

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

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbOptionGroupMembership {
  /// <p/>
  @_s.JsonKey(name: 'OptionGroupName')
  final String optionGroupName;

  /// <p/>
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRdsDbOptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  factory AwsRdsDbOptionGroupMembership.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbOptionGroupMembershipFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbOptionGroupMembershipToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbParameterGroup {
  /// <p/>
  @_s.JsonKey(name: 'DbParameterGroupName')
  final String dbParameterGroupName;

  /// <p/>
  @_s.JsonKey(name: 'ParameterApplyStatus')
  final String parameterApplyStatus;

  AwsRdsDbParameterGroup({
    this.dbParameterGroupName,
    this.parameterApplyStatus,
  });
  factory AwsRdsDbParameterGroup.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbParameterGroupFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbParameterGroupToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbPendingModifiedValues {
  /// <p/>
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// <p/>
  @_s.JsonKey(name: 'BackupRetentionPeriod')
  final int backupRetentionPeriod;

  /// <p/>
  @_s.JsonKey(name: 'CaCertificateIdentifier')
  final String caCertificateIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'DbInstanceClass')
  final String dbInstanceClass;

  /// <p/>
  @_s.JsonKey(name: 'DbInstanceIdentifier')
  final String dbInstanceIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'DbSubnetGroupName')
  final String dbSubnetGroupName;

  /// <p/>
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// <p/>
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// <p/>
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;

  /// <p/>
  @_s.JsonKey(name: 'MasterUserPassword')
  final String masterUserPassword;

  /// <p/>
  @_s.JsonKey(name: 'MultiAZ')
  final bool multiAZ;

  /// <p/>
  @_s.JsonKey(name: 'PendingCloudWatchLogsExports')
  final AwsRdsPendingCloudWatchLogsExports pendingCloudWatchLogsExports;

  /// <p/>
  @_s.JsonKey(name: 'Port')
  final int port;

  /// <p/>
  @_s.JsonKey(name: 'ProcessorFeatures')
  final List<AwsRdsDbProcessorFeature> processorFeatures;

  /// <p/>
  @_s.JsonKey(name: 'StorageType')
  final String storageType;

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
  factory AwsRdsDbPendingModifiedValues.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbPendingModifiedValuesFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbPendingModifiedValuesToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbProcessorFeature {
  /// <p/>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// <p/>
  @_s.JsonKey(name: 'Value')
  final String value;

  AwsRdsDbProcessorFeature({
    this.name,
    this.value,
  });
  factory AwsRdsDbProcessorFeature.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbProcessorFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbProcessorFeatureToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbSnapshotDetails {
  /// <p/>
  @_s.JsonKey(name: 'AllocatedStorage')
  final int allocatedStorage;

  /// <p/>
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// <p/>
  @_s.JsonKey(name: 'DbInstanceIdentifier')
  final String dbInstanceIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'DbSnapshotIdentifier')
  final String dbSnapshotIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'DbiResourceId')
  final String dbiResourceId;

  /// <p/>
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// <p/>
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// <p/>
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// <p/>
  @_s.JsonKey(name: 'IamDatabaseAuthenticationEnabled')
  final bool iamDatabaseAuthenticationEnabled;

  /// <p/>
  @_s.JsonKey(name: 'InstanceCreateTime')
  final String instanceCreateTime;

  /// <p/>
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// <p/>
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// <p/>
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;

  /// <p/>
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;

  /// <p/>
  @_s.JsonKey(name: 'OptionGroupName')
  final String optionGroupName;

  /// <p/>
  @_s.JsonKey(name: 'PercentProgress')
  final int percentProgress;

  /// <p/>
  @_s.JsonKey(name: 'Port')
  final int port;

  /// <p/>
  @_s.JsonKey(name: 'ProcessorFeatures')
  final List<AwsRdsDbProcessorFeature> processorFeatures;

  /// <p/>
  @_s.JsonKey(name: 'SnapshotCreateTime')
  final String snapshotCreateTime;

  /// <p/>
  @_s.JsonKey(name: 'SnapshotType')
  final String snapshotType;

  /// <p/>
  @_s.JsonKey(name: 'SourceDbSnapshotIdentifier')
  final String sourceDbSnapshotIdentifier;

  /// <p/>
  @_s.JsonKey(name: 'SourceRegion')
  final String sourceRegion;

  /// <p/>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// <p/>
  @_s.JsonKey(name: 'StorageType')
  final String storageType;

  /// <p/>
  @_s.JsonKey(name: 'TdeCredentialArn')
  final String tdeCredentialArn;

  /// <p/>
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// <p/>
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

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
  factory AwsRdsDbSnapshotDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbSnapshotDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbSnapshotDetailsToJson(this);
}

/// Information about the status of a read replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbStatusInfo {
  /// If the read replica is currently in an error state, provides the error
  /// details.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Whether the read replica instance is operating normally.
  @_s.JsonKey(name: 'Normal')
  final bool normal;

  /// The status of the read replica instance.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The type of status. For a read replica, the status type is read replication.
  @_s.JsonKey(name: 'StatusType')
  final String statusType;

  AwsRdsDbStatusInfo({
    this.message,
    this.normal,
    this.status,
    this.statusType,
  });
  factory AwsRdsDbStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbStatusInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbStatusInfoToJson(this);
}

/// Information about the subnet group for the database instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbSubnetGroup {
  /// The ARN of the subnet group.
  @_s.JsonKey(name: 'DbSubnetGroupArn')
  final String dbSubnetGroupArn;

  /// The description of the subnet group.
  @_s.JsonKey(name: 'DbSubnetGroupDescription')
  final String dbSubnetGroupDescription;

  /// The name of the subnet group.
  @_s.JsonKey(name: 'DbSubnetGroupName')
  final String dbSubnetGroupName;

  /// The status of the subnet group.
  @_s.JsonKey(name: 'SubnetGroupStatus')
  final String subnetGroupStatus;

  /// A list of subnets in the subnet group.
  @_s.JsonKey(name: 'Subnets')
  final List<AwsRdsDbSubnetGroupSubnet> subnets;

  /// The VPC ID of the subnet group.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsRdsDbSubnetGroup({
    this.dbSubnetGroupArn,
    this.dbSubnetGroupDescription,
    this.dbSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });
  factory AwsRdsDbSubnetGroup.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbSubnetGroupFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbSubnetGroupToJson(this);
}

/// Information about a subnet in a subnet group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbSubnetGroupSubnet {
  /// Information about the Availability Zone for a subnet in the subnet group.
  @_s.JsonKey(name: 'SubnetAvailabilityZone')
  final AwsRdsDbSubnetGroupSubnetAvailabilityZone subnetAvailabilityZone;

  /// The identifier of a subnet in the subnet group.
  @_s.JsonKey(name: 'SubnetIdentifier')
  final String subnetIdentifier;

  /// The status of a subnet in the subnet group.
  @_s.JsonKey(name: 'SubnetStatus')
  final String subnetStatus;

  AwsRdsDbSubnetGroupSubnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });
  factory AwsRdsDbSubnetGroupSubnet.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbSubnetGroupSubnetFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbSubnetGroupSubnetToJson(this);
}

/// An Availability Zone for a subnet in a subnet group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbSubnetGroupSubnetAvailabilityZone {
  /// The name of the Availability Zone for a subnet in the subnet group.
  @_s.JsonKey(name: 'Name')
  final String name;

  AwsRdsDbSubnetGroupSubnetAvailabilityZone({
    this.name,
  });
  factory AwsRdsDbSubnetGroupSubnetAvailabilityZone.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRdsDbSubnetGroupSubnetAvailabilityZoneFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRdsDbSubnetGroupSubnetAvailabilityZoneToJson(this);
}

/// Identifies the log types to enable and disable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsPendingCloudWatchLogsExports {
  /// A list of log types that are being disabled.
  @_s.JsonKey(name: 'LogTypesToDisable')
  final List<String> logTypesToDisable;

  /// A list of log types that are being enabled.
  @_s.JsonKey(name: 'LogTypesToEnable')
  final List<String> logTypesToEnable;

  AwsRdsPendingCloudWatchLogsExports({
    this.logTypesToDisable,
    this.logTypesToEnable,
  });
  factory AwsRdsPendingCloudWatchLogsExports.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRdsPendingCloudWatchLogsExportsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRdsPendingCloudWatchLogsExportsToJson(this);
}

/// A node in an Amazon Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterClusterNode {
  /// The role of the node. A node might be a leader node or a compute node.
  @_s.JsonKey(name: 'NodeRole')
  final String nodeRole;

  /// The private IP address of the node.
  @_s.JsonKey(name: 'PrivateIpAddress')
  final String privateIpAddress;

  /// The public IP address of the node.
  @_s.JsonKey(name: 'PublicIpAddress')
  final String publicIpAddress;

  AwsRedshiftClusterClusterNode({
    this.nodeRole,
    this.privateIpAddress,
    this.publicIpAddress,
  });
  factory AwsRedshiftClusterClusterNode.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterClusterNodeFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterClusterNodeToJson(this);
}

/// A cluster parameter group that is associated with an Amazon Redshift
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterClusterParameterGroup {
  /// The list of parameter statuses.
  @_s.JsonKey(name: 'ClusterParameterStatusList')
  final List<AwsRedshiftClusterClusterParameterStatus>
      clusterParameterStatusList;

  /// The status of updates to the parameters.
  @_s.JsonKey(name: 'ParameterApplyStatus')
  final String parameterApplyStatus;

  /// The name of the parameter group.
  @_s.JsonKey(name: 'ParameterGroupName')
  final String parameterGroupName;

  AwsRedshiftClusterClusterParameterGroup({
    this.clusterParameterStatusList,
    this.parameterApplyStatus,
    this.parameterGroupName,
  });
  factory AwsRedshiftClusterClusterParameterGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterClusterParameterGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterClusterParameterGroupToJson(this);
}

/// The status of a parameter in a cluster parameter group for an Amazon
/// Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterClusterParameterStatus {
  /// The error that prevented the parameter from being applied to the database.
  @_s.JsonKey(name: 'ParameterApplyErrorDescription')
  final String parameterApplyErrorDescription;

  /// The status of the parameter. Indicates whether the parameter is in sync with
  /// the database, waiting for a cluster reboot, or encountered an error when it
  /// was applied.
  ///
  /// Valid values: <code>in-sync</code> | <code>pending-reboot</code> |
  /// <code>applying</code> | <code>invalid-parameter</code> |
  /// <code>apply-deferred</code> | <code>apply-error</code> |
  /// <code>unknown-error</code>
  @_s.JsonKey(name: 'ParameterApplyStatus')
  final String parameterApplyStatus;

  /// The name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final String parameterName;

  AwsRedshiftClusterClusterParameterStatus({
    this.parameterApplyErrorDescription,
    this.parameterApplyStatus,
    this.parameterName,
  });
  factory AwsRedshiftClusterClusterParameterStatus.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterClusterParameterStatusFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterClusterParameterStatusToJson(this);
}

/// A security group that is associated with the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterClusterSecurityGroup {
  /// The name of the cluster security group.
  @_s.JsonKey(name: 'ClusterSecurityGroupName')
  final String clusterSecurityGroupName;

  /// The status of the cluster security group.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRedshiftClusterClusterSecurityGroup({
    this.clusterSecurityGroupName,
    this.status,
  });
  factory AwsRedshiftClusterClusterSecurityGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterClusterSecurityGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterClusterSecurityGroupToJson(this);
}

/// Information about a cross-Region snapshot copy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterClusterSnapshotCopyStatus {
  /// The destination Region that snapshots are automatically copied to when
  /// cross-Region snapshot copy is enabled.
  @_s.JsonKey(name: 'DestinationRegion')
  final String destinationRegion;

  /// The number of days that manual snapshots are retained in the destination
  /// region after they are copied from a source region.
  ///
  /// If the value is -1, then the manual snapshot is retained indefinitely.
  ///
  /// Valid values: Either -1 or an integer between 1 and 3,653
  @_s.JsonKey(name: 'ManualSnapshotRetentionPeriod')
  final int manualSnapshotRetentionPeriod;

  /// The number of days to retain automated snapshots in the destination Region
  /// after they are copied from a source Region.
  @_s.JsonKey(name: 'RetentionPeriod')
  final int retentionPeriod;

  /// The name of the snapshot copy grant.
  @_s.JsonKey(name: 'SnapshotCopyGrantName')
  final String snapshotCopyGrantName;

  AwsRedshiftClusterClusterSnapshotCopyStatus({
    this.destinationRegion,
    this.manualSnapshotRetentionPeriod,
    this.retentionPeriod,
    this.snapshotCopyGrantName,
  });
  factory AwsRedshiftClusterClusterSnapshotCopyStatus.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterClusterSnapshotCopyStatusFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterClusterSnapshotCopyStatusToJson(this);
}

/// A time windows during which maintenance was deferred for an Amazon Redshift
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterDeferredMaintenanceWindow {
  /// The end of the time window for which maintenance was deferred.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'DeferMaintenanceEndTime')
  final String deferMaintenanceEndTime;

  /// The identifier of the maintenance window.
  @_s.JsonKey(name: 'DeferMaintenanceIdentifier')
  final String deferMaintenanceIdentifier;

  /// The start of the time window for which maintenance was deferred.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'DeferMaintenanceStartTime')
  final String deferMaintenanceStartTime;

  AwsRedshiftClusterDeferredMaintenanceWindow({
    this.deferMaintenanceEndTime,
    this.deferMaintenanceIdentifier,
    this.deferMaintenanceStartTime,
  });
  factory AwsRedshiftClusterDeferredMaintenanceWindow.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterDeferredMaintenanceWindowFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterDeferredMaintenanceWindowToJson(this);
}

/// Details about an Amazon Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterDetails {
  /// Indicates whether major version upgrades are applied automatically to the
  /// cluster during the maintenance window.
  @_s.JsonKey(name: 'AllowVersionUpgrade')
  final bool allowVersionUpgrade;

  /// The number of days that automatic cluster snapshots are retained.
  @_s.JsonKey(name: 'AutomatedSnapshotRetentionPeriod')
  final int automatedSnapshotRetentionPeriod;

  /// The name of the Availability Zone in which the cluster is located.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

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
  @_s.JsonKey(name: 'ClusterAvailabilityStatus')
  final String clusterAvailabilityStatus;

  /// Indicates when the cluster was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'ClusterCreateTime')
  final String clusterCreateTime;

  /// The unique identifier of the cluster.
  @_s.JsonKey(name: 'ClusterIdentifier')
  final String clusterIdentifier;

  /// The nodes in the cluster.
  @_s.JsonKey(name: 'ClusterNodes')
  final List<AwsRedshiftClusterClusterNode> clusterNodes;

  /// The list of cluster parameter groups that are associated with this cluster.
  @_s.JsonKey(name: 'ClusterParameterGroups')
  final List<AwsRedshiftClusterClusterParameterGroup> clusterParameterGroups;

  /// The public key for the cluster.
  @_s.JsonKey(name: 'ClusterPublicKey')
  final String clusterPublicKey;

  /// The specific revision number of the database in the cluster.
  @_s.JsonKey(name: 'ClusterRevisionNumber')
  final String clusterRevisionNumber;

  /// A list of cluster security groups that are associated with the cluster.
  @_s.JsonKey(name: 'ClusterSecurityGroups')
  final List<AwsRedshiftClusterClusterSecurityGroup> clusterSecurityGroups;

  /// Information about the destination Region and retention period for the
  /// cross-Region snapshot copy.
  @_s.JsonKey(name: 'ClusterSnapshotCopyStatus')
  final AwsRedshiftClusterClusterSnapshotCopyStatus clusterSnapshotCopyStatus;

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
  @_s.JsonKey(name: 'ClusterStatus')
  final String clusterStatus;

  /// The name of the subnet group that is associated with the cluster. This
  /// parameter is valid only when the cluster is in a VPC.
  @_s.JsonKey(name: 'ClusterSubnetGroupName')
  final String clusterSubnetGroupName;

  /// The version ID of the Amazon Redshift engine that runs on the cluster.
  @_s.JsonKey(name: 'ClusterVersion')
  final String clusterVersion;

  /// The name of the initial database that was created when the cluster was
  /// created.
  ///
  /// The same name is returned for the life of the cluster.
  ///
  /// If an initial database is not specified, a database named
  /// <code>devdev</code> is created by default.
  @_s.JsonKey(name: 'DBName')
  final String dBName;

  /// List of time windows during which maintenance was deferred.
  @_s.JsonKey(name: 'DeferredMaintenanceWindows')
  final List<AwsRedshiftClusterDeferredMaintenanceWindow>
      deferredMaintenanceWindows;

  /// Information about the status of the Elastic IP (EIP) address.
  @_s.JsonKey(name: 'ElasticIpStatus')
  final AwsRedshiftClusterElasticIpStatus elasticIpStatus;

  /// The number of nodes that you can use the elastic resize method to resize the
  /// cluster to.
  @_s.JsonKey(name: 'ElasticResizeNumberOfNodeOptions')
  final String elasticResizeNumberOfNodeOptions;

  /// Indicates whether the data in the cluster is encrypted at rest.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The connection endpoint.
  @_s.JsonKey(name: 'Endpoint')
  final AwsRedshiftClusterEndpoint endpoint;

  /// Indicates whether to create the cluster with enhanced VPC routing enabled.
  @_s.JsonKey(name: 'EnhancedVpcRouting')
  final bool enhancedVpcRouting;

  /// Indicates when the next snapshot is expected to be taken. The cluster must
  /// have a valid snapshot schedule and have backups enabled.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'ExpectedNextSnapshotScheduleTime')
  final String expectedNextSnapshotScheduleTime;

  /// The status of the next expected snapshot.
  ///
  /// Valid values: <code>OnTrack</code> | <code>Pending</code>
  @_s.JsonKey(name: 'ExpectedNextSnapshotScheduleTimeStatus')
  final String expectedNextSnapshotScheduleTimeStatus;

  /// Information about whether the Amazon Redshift cluster finished applying any
  /// changes to hardware security module (HSM) settings that were specified in a
  /// modify cluster command.
  @_s.JsonKey(name: 'HsmStatus')
  final AwsRedshiftClusterHsmStatus hsmStatus;

  /// A list of IAM roles that the cluster can use to access other AWS services.
  @_s.JsonKey(name: 'IamRoles')
  final List<AwsRedshiftClusterIamRole> iamRoles;

  /// The identifier of the AWS KMS encryption key that is used to encrypt data in
  /// the cluster.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The name of the maintenance track for the cluster.
  @_s.JsonKey(name: 'MaintenanceTrackName')
  final String maintenanceTrackName;

  /// The default number of days to retain a manual snapshot.
  ///
  /// If the value is -1, the snapshot is retained indefinitely.
  ///
  /// This setting doesn't change the retention period of existing snapshots.
  ///
  /// Valid values: Either -1 or an integer between 1 and 3,653
  @_s.JsonKey(name: 'ManualSnapshotRetentionPeriod')
  final int manualSnapshotRetentionPeriod;

  /// The master user name for the cluster. This name is used to connect to the
  /// database that is specified in as the value of <code>DBName</code>.
  @_s.JsonKey(name: 'MasterUsername')
  final String masterUsername;

  /// Indicates the start of the next maintenance window.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'NextMaintenanceWindowStartTime')
  final String nextMaintenanceWindowStartTime;

  /// The node type for the nodes in the cluster.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The number of compute nodes in the cluster.
  @_s.JsonKey(name: 'NumberOfNodes')
  final int numberOfNodes;

  /// A list of cluster operations that are waiting to start.
  @_s.JsonKey(name: 'PendingActions')
  final List<String> pendingActions;

  /// A list of changes to the cluster that are currently pending.
  @_s.JsonKey(name: 'PendingModifiedValues')
  final AwsRedshiftClusterPendingModifiedValues pendingModifiedValues;

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
  @_s.JsonKey(name: 'PreferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// Whether the cluster can be accessed from a public network.
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;

  /// Information about the resize operation for the cluster.
  @_s.JsonKey(name: 'ResizeInfo')
  final AwsRedshiftClusterResizeInfo resizeInfo;

  /// Information about the status of a cluster restore action. Only applies to a
  /// cluster that was created by restoring a snapshot.
  @_s.JsonKey(name: 'RestoreStatus')
  final AwsRedshiftClusterRestoreStatus restoreStatus;

  /// A unique identifier for the cluster snapshot schedule.
  @_s.JsonKey(name: 'SnapshotScheduleIdentifier')
  final String snapshotScheduleIdentifier;

  /// The current state of the cluster snapshot schedule.
  ///
  /// Valid values: <code>MODIFYING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code>
  @_s.JsonKey(name: 'SnapshotScheduleState')
  final String snapshotScheduleState;

  /// The identifier of the VPC that the cluster is in, if the cluster is in a
  /// VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The list of VPC security groups that the cluster belongs to, if the cluster
  /// is in a VPC.
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<AwsRedshiftClusterVpcSecurityGroup> vpcSecurityGroups;

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
  factory AwsRedshiftClusterDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterDetailsToJson(this);
}

/// The status of the elastic IP (EIP) address for an Amazon Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterElasticIpStatus {
  /// The elastic IP address for the cluster.
  @_s.JsonKey(name: 'ElasticIp')
  final String elasticIp;

  /// The status of the elastic IP address.
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRedshiftClusterElasticIpStatus({
    this.elasticIp,
    this.status,
  });
  factory AwsRedshiftClusterElasticIpStatus.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterElasticIpStatusFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterElasticIpStatusToJson(this);
}

/// The connection endpoint for an Amazon Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterEndpoint {
  /// The DNS address of the cluster.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The port that the database engine listens on.
  @_s.JsonKey(name: 'Port')
  final int port;

  AwsRedshiftClusterEndpoint({
    this.address,
    this.port,
  });
  factory AwsRedshiftClusterEndpoint.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterEndpointToJson(this);
}

/// Information about whether an Amazon Redshift cluster finished applying any
/// hardware changes to security module (HSM) settings that were specified in a
/// modify cluster command.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterHsmStatus {
  /// The name of the HSM client certificate that the Amazon Redshift cluster uses
  /// to retrieve the data encryption keys that are stored in an HSM.
  @_s.JsonKey(name: 'HsmClientCertificateIdentifier')
  final String hsmClientCertificateIdentifier;

  /// The name of the HSM configuration that contains the information that the
  /// Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  @_s.JsonKey(name: 'HsmConfigurationIdentifier')
  final String hsmConfigurationIdentifier;

  /// Indicates whether the Amazon Redshift cluster has finished applying any HSM
  /// settings changes specified in a modify cluster command.
  ///
  /// Type: String
  ///
  /// Valid values: <code>active</code> | <code>applying</code>
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRedshiftClusterHsmStatus({
    this.hsmClientCertificateIdentifier,
    this.hsmConfigurationIdentifier,
    this.status,
  });
  factory AwsRedshiftClusterHsmStatus.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterHsmStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterHsmStatusToJson(this);
}

/// An IAM role that the cluster can use to access other AWS services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterIamRole {
  /// The status of the IAM role's association with the cluster.
  ///
  /// Valid values: <code>in-sync</code> | <code>adding</code> |
  /// <code>removing</code>
  @_s.JsonKey(name: 'ApplyStatus')
  final String applyStatus;

  /// The ARN of the IAM role.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  AwsRedshiftClusterIamRole({
    this.applyStatus,
    this.iamRoleArn,
  });
  factory AwsRedshiftClusterIamRole.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterIamRoleFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterIamRoleToJson(this);
}

/// Changes to the Amazon Redshift cluster that are currently pending.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterPendingModifiedValues {
  /// The pending or in-progress change to the automated snapshot retention
  /// period.
  @_s.JsonKey(name: 'AutomatedSnapshotRetentionPeriod')
  final int automatedSnapshotRetentionPeriod;

  /// The pending or in-progress change to the identifier for the cluster.
  @_s.JsonKey(name: 'ClusterIdentifier')
  final String clusterIdentifier;

  /// The pending or in-progress change to the cluster type.
  @_s.JsonKey(name: 'ClusterType')
  final String clusterType;

  /// The pending or in-progress change to the service version.
  @_s.JsonKey(name: 'ClusterVersion')
  final String clusterVersion;

  /// The encryption type for a cluster.
  @_s.JsonKey(name: 'EncryptionType')
  final String encryptionType;

  /// Indicates whether to create the cluster with enhanced VPC routing enabled.
  @_s.JsonKey(name: 'EnhancedVpcRouting')
  final bool enhancedVpcRouting;

  /// The name of the maintenance track that the cluster changes to during the
  /// next maintenance window.
  @_s.JsonKey(name: 'MaintenanceTrackName')
  final String maintenanceTrackName;

  /// The pending or in-progress change to the master user password for the
  /// cluster.
  @_s.JsonKey(name: 'MasterUserPassword')
  final String masterUserPassword;

  /// The pending or in-progress change to the cluster's node type.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The pending or in-progress change to the number of nodes in the cluster.
  @_s.JsonKey(name: 'NumberOfNodes')
  final int numberOfNodes;

  /// The pending or in-progress change to whether the cluster can be connected to
  /// from the public network.
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;

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
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterPendingModifiedValuesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterPendingModifiedValuesToJson(this);
}

/// Information about the resize operation for the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterResizeInfo {
  /// Indicates whether the resize operation can be canceled.
  @_s.JsonKey(name: 'AllowCancelResize')
  final bool allowCancelResize;

  /// The type of resize operation.
  ///
  /// Valid values: <code>ClassicResize</code>
  @_s.JsonKey(name: 'ResizeType')
  final String resizeType;

  AwsRedshiftClusterResizeInfo({
    this.allowCancelResize,
    this.resizeType,
  });
  factory AwsRedshiftClusterResizeInfo.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterResizeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRedshiftClusterResizeInfoToJson(this);
}

/// Information about the status of a cluster restore action. It only applies if
/// the cluster was created by restoring a snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterRestoreStatus {
  /// The number of megabytes per second being transferred from the backup
  /// storage. Returns the average rate for a completed backup.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  @_s.JsonKey(name: 'CurrentRestoreRateInMegaBytesPerSecond')
  final double currentRestoreRateInMegaBytesPerSecond;

  /// The amount of time an in-progress restore has been running, or the amount of
  /// time it took a completed restore to finish.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  @_s.JsonKey(name: 'ElapsedTimeInSeconds')
  final int elapsedTimeInSeconds;

  /// The estimate of the time remaining before the restore is complete. Returns 0
  /// for a completed restore.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  @_s.JsonKey(name: 'EstimatedTimeToCompletionInSeconds')
  final int estimatedTimeToCompletionInSeconds;

  /// The number of megabytes that were transferred from snapshot storage.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  @_s.JsonKey(name: 'ProgressInMegaBytes')
  final int progressInMegaBytes;

  /// The size of the set of snapshot data that was used to restore the cluster.
  ///
  /// This field is only updated when you restore to DC2 and DS2 node types.
  @_s.JsonKey(name: 'SnapshotSizeInMegaBytes')
  final int snapshotSizeInMegaBytes;

  /// The status of the restore action.
  ///
  /// Valid values: <code>starting</code> | <code>restoring</code> |
  /// <code>completed</code> | <code>failed</code>
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRedshiftClusterRestoreStatus({
    this.currentRestoreRateInMegaBytesPerSecond,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.progressInMegaBytes,
    this.snapshotSizeInMegaBytes,
    this.status,
  });
  factory AwsRedshiftClusterRestoreStatus.fromJson(Map<String, dynamic> json) =>
      _$AwsRedshiftClusterRestoreStatusFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterRestoreStatusToJson(this);
}

/// A VPC security group that the cluster belongs to, if the cluster is in a
/// VPC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRedshiftClusterVpcSecurityGroup {
  /// The status of the VPC security group.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The identifier of the VPC security group.
  @_s.JsonKey(name: 'VpcSecurityGroupId')
  final String vpcSecurityGroupId;

  AwsRedshiftClusterVpcSecurityGroup({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory AwsRedshiftClusterVpcSecurityGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRedshiftClusterVpcSecurityGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRedshiftClusterVpcSecurityGroupToJson(this);
}

/// The details of an Amazon S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3BucketDetails {
  /// Indicates when the S3 bucket was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// bucket. If a <code>PUT</code> object request doesn't specify any server-side
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

/// Details about an Amazon S3 object.
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

  /// Indicates when the object was last modified.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

/// Details about an AWS Secrets Manager secret.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSecretsManagerSecretDetails {
  /// Whether the secret is deleted.
  @_s.JsonKey(name: 'Deleted')
  final bool deleted;

  /// The user-provided description of the secret.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN, Key ID, or alias of the AWS KMS customer master key (CMK) used to
  /// encrypt the <code>SecretString</code> or <code>SecretBinary</code> values
  /// for versions of this secret.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The name of the secret.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Whether rotation is enabled.
  @_s.JsonKey(name: 'RotationEnabled')
  final bool rotationEnabled;

  /// The ARN of the Lambda function that rotates the secret.
  @_s.JsonKey(name: 'RotationLambdaArn')
  final String rotationLambdaArn;

  /// Whether the rotation occurred within the specified rotation frequency.
  @_s.JsonKey(name: 'RotationOccurredWithinFrequency')
  final bool rotationOccurredWithinFrequency;

  /// Defines the rotation schedule for the secret.
  @_s.JsonKey(name: 'RotationRules')
  final AwsSecretsManagerSecretRotationRules rotationRules;

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
  factory AwsSecretsManagerSecretDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsSecretsManagerSecretDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSecretsManagerSecretDetailsToJson(this);
}

/// Defines the rotation schedule for the secret.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSecretsManagerSecretRotationRules {
  /// The number of days after the previous rotation to rotate the secret.
  @_s.JsonKey(name: 'AutomaticallyAfterDays')
  final int automaticallyAfterDays;

  AwsSecretsManagerSecretRotationRules({
    this.automaticallyAfterDays,
  });
  factory AwsSecretsManagerSecretRotationRules.fromJson(
          Map<String, dynamic> json) =>
      _$AwsSecretsManagerSecretRotationRulesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsSecretsManagerSecretRotationRulesToJson(this);
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

  /// Indicates when the security-findings provider created the potential security
  /// issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  /// plugin, etc.
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

  /// Indicates when the security-findings provider last updated the finding
  /// record.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

  /// Indicates when the security-findings provider first observed the potential
  /// security issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'FirstObservedAt')
  final String firstObservedAt;

  /// Indicates when the security-findings provider most recently observed the
  /// potential security issue that a finding captured.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'LastObservedAt')
  final String lastObservedAt;

  /// A list of malware related to a finding.
  @_s.JsonKey(name: 'Malware')
  final List<Malware> malware;

  /// The details of network-related information about a finding.
  @_s.JsonKey(name: 'Network')
  final Network network;

  /// Provides information about a network path that is relevant to a finding.
  /// Each entry under <code>NetworkPath</code> represents a component of that
  /// path.
  @_s.JsonKey(name: 'NetworkPath')
  final List<NetworkPathComponent> networkPath;

  /// A user-defined note added to a finding.
  @_s.JsonKey(name: 'Note')
  final Note note;

  /// Provides an overview of the patch compliance status for an instance against
  /// a selected compliance standard.
  @_s.JsonKey(name: 'PatchSummary')
  final PatchSummary patchSummary;

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

  /// Provides a list of vulnerabilities associated with the findings.
  @_s.JsonKey(name: 'Vulnerabilities')
  final List<Vulnerability> vulnerabilities;

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
    this.networkPath,
    this.note,
    this.patchSummary,
    this.process,
    this.productFields,
    this.recordState,
    this.relatedFindings,
    this.remediation,
    this.sourceUrl,
    this.threatIntelIndicators,
    this.userDefinedFields,
    this.verificationState,
    this.vulnerabilities,
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
///
/// You can filter by up to 10 finding attributes. For each attribute, you can
/// provide up to 20 filter values.
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
  /// plugin, etc.
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
  ///
  /// Note that this field is deprecated. To search for a finding based on its
  /// workflow status, use <code>WorkflowStatus</code>.
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
  /// The ID of an AWS managed customer master key (CMK) for Amazon SNS or a
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

  /// The ID of an AWS managed customer master key (CMK) for Amazon SQS or a
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
  /// The action to perform if none of the rules contained in the WebACL match.
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
  /// matches the conditions in the rule.
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

  /// Specifies the order in which the rules in a WebACL are evaluated. Rules with
  /// a lower value for <code>Priority</code> are evaluated before rules with a
  /// higher value. The value must be a unique integer. If you add multiple rules
  /// to a WebACL, the values do not need to be consecutive.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The identifier for a rule.
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

/// An IPv4 CIDR block association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CidrBlockAssociation {
  /// The association ID for the IPv4 CIDR block.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The IPv4 CIDR block.
  @_s.JsonKey(name: 'CidrBlock')
  final String cidrBlock;

  /// Information about the state of the IPv4 CIDR block.
  @_s.JsonKey(name: 'CidrBlockState')
  final String cidrBlockState;

  CidrBlockAssociation({
    this.associationId,
    this.cidrBlock,
    this.cidrBlockState,
  });
  factory CidrBlockAssociation.fromJson(Map<String, dynamic> json) =>
      _$CidrBlockAssociationFromJson(json);

  Map<String, dynamic> toJson() => _$CidrBlockAssociationToJson(this);
}

/// Contains finding details that are specific to control-based findings. Only
/// returned for findings generated from controls.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Compliance {
  /// For a control, the industry or regulatory framework requirements that are
  /// related to the control. The check for that control is aligned with these
  /// requirements.
  @_s.JsonKey(name: 'RelatedRequirements')
  final List<String> relatedRequirements;

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
  @_s.JsonKey(name: 'Status')
  final ComplianceStatus status;

  /// For findings generated from controls, a list of reasons behind the value of
  /// <code>Status</code>. For the list of status reason codes and their meanings,
  /// see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff">Standards-related
  /// information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>.
  @_s.JsonKey(name: 'StatusReasons')
  final List<StatusReason> statusReasons;

  Compliance({
    this.relatedRequirements,
    this.status,
    this.statusReasons,
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

  /// Indicates when the container started.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

/// CVSS scores from the advisory related to the vulnerability.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Cvss {
  /// The base CVSS score.
  @_s.JsonKey(name: 'BaseScore')
  final double baseScore;

  /// The base scoring vector for the CVSS score.
  @_s.JsonKey(name: 'BaseVector')
  final String baseVector;

  /// The version of CVSS for the CVSS score.
  @_s.JsonKey(name: 'Version')
  final String version;

  Cvss({
    this.baseScore,
    this.baseVector,
    this.version,
  });
  factory Cvss.fromJson(Map<String, dynamic> json) => _$CvssFromJson(json);

  Map<String, dynamic> toJson() => _$CvssToJson(this);
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
  /// Whether to automatically enable new controls when they are added to
  /// standards that are enabled.
  ///
  /// If set to <code>true</code>, then new controls for enabled standards are
  /// enabled automatically. If set to <code>false</code>, then new controls are
  /// not enabled.
  @_s.JsonKey(name: 'AutoEnableControls')
  final bool autoEnableControls;

  /// The ARN of the Hub resource that was retrieved.
  @_s.JsonKey(name: 'HubArn')
  final String hubArn;

  /// The date and time when Security Hub was enabled in the account.
  @_s.JsonKey(name: 'SubscribedAt')
  final String subscribedAt;

  DescribeHubResponse({
    this.autoEnableControls,
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
class DescribeOrganizationConfigurationResponse {
  /// Whether to automatically enable Security Hub for new accounts in the
  /// organization.
  ///
  /// If set to <code>true</code>, then Security Hub is enabled for new accounts.
  /// If set to false, then new accounts are not added automatically.
  @_s.JsonKey(name: 'AutoEnable')
  final bool autoEnable;

  /// Whether the maximum number of allowed member accounts are already associated
  /// with the Security Hub administrator account.
  @_s.JsonKey(name: 'MemberAccountLimitReached')
  final bool memberAccountLimitReached;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
    this.memberAccountLimitReached,
  });
  factory DescribeOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConfigurationResponseFromJson(json);
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
class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();
  factory DisableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableOrganizationAdminAccountResponseFromJson(json);
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
class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();
  factory EnableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableOrganizationAdminAccountResponseFromJson(json);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'InvitedAt')
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

/// An IPV6 CIDR block association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ipv6CidrBlockAssociation {
  /// The association ID for the IPv6 CIDR block.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// Information about the state of the CIDR block.
  @_s.JsonKey(name: 'CidrBlockState')
  final String cidrBlockState;

  /// The IPv6 CIDR block.
  @_s.JsonKey(name: 'Ipv6CidrBlock')
  final String ipv6CidrBlock;

  Ipv6CidrBlockAssociation({
    this.associationId,
    this.cidrBlockState,
    this.ipv6CidrBlock,
  });
  factory Ipv6CidrBlockAssociation.fromJson(Map<String, dynamic> json) =>
      _$Ipv6CidrBlockAssociationFromJson(json);

  Map<String, dynamic> toJson() => _$Ipv6CidrBlockAssociationToJson(this);
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
class ListOrganizationAdminAccountsResponse {
  /// The list of Security Hub administrator accounts.
  @_s.JsonKey(name: 'AdminAccounts')
  final List<AdminAccount> adminAccounts;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });
  factory ListOrganizationAdminAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListOrganizationAdminAccountsResponseFromJson(json);
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

/// A map filter for querying findings. Each map filter provides the field to
/// check, the value to look for, and the comparison operator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Comparison')
  final MapFilterComparison comparison;

  /// The key of the map filter. For example, for <code>ResourceTags</code>,
  /// <code>Key</code> identifies the name of the tag. For
  /// <code>UserDefinedFields</code>, <code>Key</code> is the name of the field.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the key in the map filter. Filter values are case sensitive.
  /// For example, one of the values for a tag called <code>Department</code>
  /// might be <code>Security</code>. If you provide <code>security</code> as the
  /// filter value, then there is no match.
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
  @_s.JsonValue('NOT_EQUALS')
  notEquals,
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'InvitedAt')
  final DateTime invitedAt;

  /// The AWS account ID of the Security Hub master account associated with this
  /// member account.
  @_s.JsonKey(name: 'MasterId')
  final String masterId;

  /// The status of the relationship between the member account and its master
  /// account.
  ///
  /// The status can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - Indicates that the master account added the member
  /// account, but has not yet invited the member account.
  /// </li>
  /// <li>
  /// <code>INVITED</code> - Indicates that the master account invited the member
  /// account. The member account has not yet responded to the invitation.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Indicates that the member account is currently
  /// active. For manually invited member accounts, indicates that the member
  /// account accepted the invitation.
  /// </li>
  /// <li>
  /// <code>REMOVED</code> - Indicates that the master account disassociated the
  /// member account.
  /// </li>
  /// <li>
  /// <code>RESIGNED</code> - Indicates that the member account disassociated
  /// themselves from the master account.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Indicates that the master account deleted the member
  /// account.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MemberStatus')
  final String memberStatus;

  /// The timestamp for the date and time when the member account was updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
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

  /// The range of open ports that is present on the network.
  @_s.JsonKey(name: 'OpenPortRange')
  final PortRange openPortRange;

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
    this.openPortRange,
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

/// Details about a network path component that occurs before or after the
/// current component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkHeader {
  /// Information about the destination of the component.
  @_s.JsonKey(name: 'Destination')
  final NetworkPathComponentDetails destination;

  /// The protocol used for the component.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  /// Information about the origin of the component.
  @_s.JsonKey(name: 'Source')
  final NetworkPathComponentDetails source;

  NetworkHeader({
    this.destination,
    this.protocol,
    this.source,
  });
  factory NetworkHeader.fromJson(Map<String, dynamic> json) =>
      _$NetworkHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkHeaderToJson(this);
}

/// Information about a network path component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkPathComponent {
  /// The identifier of a component in the network path.
  @_s.JsonKey(name: 'ComponentId')
  final String componentId;

  /// The type of component.
  @_s.JsonKey(name: 'ComponentType')
  final String componentType;

  /// Information about the component that comes after the current component in
  /// the network path.
  @_s.JsonKey(name: 'Egress')
  final NetworkHeader egress;

  /// Information about the component that comes before the current node in the
  /// network path.
  @_s.JsonKey(name: 'Ingress')
  final NetworkHeader ingress;

  NetworkPathComponent({
    this.componentId,
    this.componentType,
    this.egress,
    this.ingress,
  });
  factory NetworkPathComponent.fromJson(Map<String, dynamic> json) =>
      _$NetworkPathComponentFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPathComponentToJson(this);
}

/// Information about the destination of the next component in the network path.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkPathComponentDetails {
  /// The IP addresses of the destination.
  @_s.JsonKey(name: 'Address')
  final List<String> address;

  /// A list of port ranges for the destination.
  @_s.JsonKey(name: 'PortRanges')
  final List<PortRange> portRanges;

  NetworkPathComponentDetails({
    this.address,
    this.portRanges,
  });
  factory NetworkPathComponentDetails.fromJson(Map<String, dynamic> json) =>
      _$NetworkPathComponentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPathComponentDetailsToJson(this);
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
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

/// Provides an overview of the patch compliance status for an instance against
/// a selected compliance standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PatchSummary {
  /// The identifier of the compliance standard that was used to determine the
  /// patch compliance status.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The number of patches from the compliance standard that failed to install.
  @_s.JsonKey(name: 'FailedCount')
  final int failedCount;

  /// The number of patches from the compliance standard that were installed
  /// successfully.
  @_s.JsonKey(name: 'InstalledCount')
  final int installedCount;

  /// The number of installed patches that are not part of the compliance
  /// standard.
  @_s.JsonKey(name: 'InstalledOtherCount')
  final int installedOtherCount;

  /// The number of patches that were applied, but that require the instance to be
  /// rebooted in order to be marked as installed.
  @_s.JsonKey(name: 'InstalledPendingReboot')
  final int installedPendingReboot;

  /// The number of patches that are installed but are also on a list of patches
  /// that the customer rejected.
  @_s.JsonKey(name: 'InstalledRejectedCount')
  final int installedRejectedCount;

  /// The number of patches that are part of the compliance standard but are not
  /// installed. The count includes patches that failed to install.
  @_s.JsonKey(name: 'MissingCount')
  final int missingCount;

  /// The type of patch operation performed. For Patch Manager, the values are
  /// <code>SCAN</code> and <code>INSTALL</code>.
  @_s.JsonKey(name: 'Operation')
  final String operation;

  /// Indicates when the operation completed.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'OperationEndTime')
  final String operationEndTime;

  /// Indicates when the operation started.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'OperationStartTime')
  final String operationStartTime;

  /// The reboot option specified for the instance.
  @_s.JsonKey(name: 'RebootOption')
  final String rebootOption;

  PatchSummary({
    @_s.required this.id,
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
  factory PatchSummary.fromJson(Map<String, dynamic> json) =>
      _$PatchSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$PatchSummaryToJson(this);
}

/// A range of ports.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortRange {
  /// The first port in the port range.
  @_s.JsonKey(name: 'Begin')
  final int begin;

  /// The last port in the port range.
  @_s.JsonKey(name: 'End')
  final int end;

  PortRange({
    this.begin,
    this.end,
  });
  factory PortRange.fromJson(Map<String, dynamic> json) =>
      _$PortRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PortRangeToJson(this);
}

/// The details of process-related information about a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessDetails {
  /// Indicates when the process was launched.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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

  /// Indicates when the process was terminated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
  final List<IntegrationType> integrationTypes;

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

  /// <p/>
  @_s.JsonKey(name: 'ResourceRole')
  final String resourceRole;

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
    this.resourceRole,
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
  /// <p/>
  @_s.JsonKey(name: 'AwsApiGatewayRestApi')
  final AwsApiGatewayRestApiDetails awsApiGatewayRestApi;

  /// <p/>
  @_s.JsonKey(name: 'AwsApiGatewayStage')
  final AwsApiGatewayStageDetails awsApiGatewayStage;

  /// <p/>
  @_s.JsonKey(name: 'AwsApiGatewayV2Api')
  final AwsApiGatewayV2ApiDetails awsApiGatewayV2Api;

  /// <p/>
  @_s.JsonKey(name: 'AwsApiGatewayV2Stage')
  final AwsApiGatewayV2StageDetails awsApiGatewayV2Stage;

  /// Details for an autoscaling group.
  @_s.JsonKey(name: 'AwsAutoScalingAutoScalingGroup')
  final AwsAutoScalingAutoScalingGroupDetails awsAutoScalingAutoScalingGroup;

  /// <p/>
  @_s.JsonKey(name: 'AwsCertificateManagerCertificate')
  final AwsCertificateManagerCertificateDetails
      awsCertificateManagerCertificate;

  /// Details about a CloudFront distribution.
  @_s.JsonKey(name: 'AwsCloudFrontDistribution')
  final AwsCloudFrontDistributionDetails awsCloudFrontDistribution;

  /// <p/>
  @_s.JsonKey(name: 'AwsCloudTrailTrail')
  final AwsCloudTrailTrailDetails awsCloudTrailTrail;

  /// Details for an AWS CodeBuild project.
  @_s.JsonKey(name: 'AwsCodeBuildProject')
  final AwsCodeBuildProjectDetails awsCodeBuildProject;

  /// Details about a DynamoDB table.
  @_s.JsonKey(name: 'AwsDynamoDbTable')
  final AwsDynamoDbTableDetails awsDynamoDbTable;

  /// Details about an Elastic IP address.
  @_s.JsonKey(name: 'AwsEc2Eip')
  final AwsEc2EipDetails awsEc2Eip;

  /// Details about an Amazon EC2 instance related to a finding.
  @_s.JsonKey(name: 'AwsEc2Instance')
  final AwsEc2InstanceDetails awsEc2Instance;

  /// Details for an Amazon EC2 network interface.
  @_s.JsonKey(name: 'AwsEc2NetworkInterface')
  final AwsEc2NetworkInterfaceDetails awsEc2NetworkInterface;

  /// Details for an EC2 security group.
  @_s.JsonKey(name: 'AwsEc2SecurityGroup')
  final AwsEc2SecurityGroupDetails awsEc2SecurityGroup;

  /// Details for an EC2 volume.
  @_s.JsonKey(name: 'AwsEc2Volume')
  final AwsEc2VolumeDetails awsEc2Volume;

  /// Details for an EC2 VPC.
  @_s.JsonKey(name: 'AwsEc2Vpc')
  final AwsEc2VpcDetails awsEc2Vpc;

  /// Details for an Elasticsearch domain.
  @_s.JsonKey(name: 'AwsElasticsearchDomain')
  final AwsElasticsearchDomainDetails awsElasticsearchDomain;

  /// <p/>
  @_s.JsonKey(name: 'AwsElbLoadBalancer')
  final AwsElbLoadBalancerDetails awsElbLoadBalancer;

  /// Details about a load balancer.
  @_s.JsonKey(name: 'AwsElbv2LoadBalancer')
  final AwsElbv2LoadBalancerDetails awsElbv2LoadBalancer;

  /// Details about an IAM access key related to a finding.
  @_s.JsonKey(name: 'AwsIamAccessKey')
  final AwsIamAccessKeyDetails awsIamAccessKey;

  /// <p/>
  @_s.JsonKey(name: 'AwsIamGroup')
  final AwsIamGroupDetails awsIamGroup;

  /// Details about an IAM permissions policy.
  @_s.JsonKey(name: 'AwsIamPolicy')
  final AwsIamPolicyDetails awsIamPolicy;

  /// Details about an IAM role.
  @_s.JsonKey(name: 'AwsIamRole')
  final AwsIamRoleDetails awsIamRole;

  /// Details about an IAM user.
  @_s.JsonKey(name: 'AwsIamUser')
  final AwsIamUserDetails awsIamUser;

  /// Details about a KMS key.
  @_s.JsonKey(name: 'AwsKmsKey')
  final AwsKmsKeyDetails awsKmsKey;

  /// Details about a Lambda function.
  @_s.JsonKey(name: 'AwsLambdaFunction')
  final AwsLambdaFunctionDetails awsLambdaFunction;

  /// Details for a Lambda layer version.
  @_s.JsonKey(name: 'AwsLambdaLayerVersion')
  final AwsLambdaLayerVersionDetails awsLambdaLayerVersion;

  /// Details about an Amazon RDS database cluster.
  @_s.JsonKey(name: 'AwsRdsDbCluster')
  final AwsRdsDbClusterDetails awsRdsDbCluster;

  /// Details about an Amazon RDS database cluster snapshot.
  @_s.JsonKey(name: 'AwsRdsDbClusterSnapshot')
  final AwsRdsDbClusterSnapshotDetails awsRdsDbClusterSnapshot;

  /// Details about an Amazon RDS database instance.
  @_s.JsonKey(name: 'AwsRdsDbInstance')
  final AwsRdsDbInstanceDetails awsRdsDbInstance;

  /// Details about an Amazon RDS database snapshot.
  @_s.JsonKey(name: 'AwsRdsDbSnapshot')
  final AwsRdsDbSnapshotDetails awsRdsDbSnapshot;

  /// <p/>
  @_s.JsonKey(name: 'AwsRedshiftCluster')
  final AwsRedshiftClusterDetails awsRedshiftCluster;

  /// Details about an Amazon S3 bucket related to a finding.
  @_s.JsonKey(name: 'AwsS3Bucket')
  final AwsS3BucketDetails awsS3Bucket;

  /// Details about an Amazon S3 object related to a finding.
  @_s.JsonKey(name: 'AwsS3Object')
  final AwsS3ObjectDetails awsS3Object;

  /// Details about a Secrets Manager secret.
  @_s.JsonKey(name: 'AwsSecretsManagerSecret')
  final AwsSecretsManagerSecretDetails awsSecretsManagerSecret;

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
    this.awsEc2NetworkInterface,
    this.awsEc2SecurityGroup,
    this.awsEc2Volume,
    this.awsEc2Vpc,
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
    this.awsS3Bucket,
    this.awsS3Object,
    this.awsSecretsManagerSecret,
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
///
/// The finding provider can provide the initial severity. The finding provider
/// can only update the severity if it has not been updated using
/// <code>BatchUpdateFindings</code>.
///
/// The finding must have either <code>Label</code> or <code>Normalized</code>
/// populated. If only one of these attributes is populated, then Security Hub
/// automatically populates the other one. If neither attribute is populated,
/// then the finding is invalid. <code>Label</code> is the preferred attribute.
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
  @_s.JsonKey(name: 'Label')
  final SeverityLabel label;

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
  @_s.JsonKey(name: 'Normalized')
  final int normalized;

  /// The native severity from the finding product that generated the finding.
  @_s.JsonKey(name: 'Original')
  final String original;

  /// Deprecated. This attribute is being deprecated. Instead of providing
  /// <code>Product</code>, provide <code>Original</code>.
  ///
  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  @_s.JsonKey(name: 'Product')
  final double product;

  Severity({
    this.label,
    this.normalized,
    this.original,
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

/// Information about a software package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SoftwarePackage {
  /// The architecture used for the software package.
  @_s.JsonKey(name: 'Architecture')
  final String architecture;

  /// The epoch of the software package.
  @_s.JsonKey(name: 'Epoch')
  final String epoch;

  /// The name of the software package.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The release of the software package.
  @_s.JsonKey(name: 'Release')
  final String release;

  /// The version of the software package.
  @_s.JsonKey(name: 'Version')
  final String version;

  SoftwarePackage({
    this.architecture,
    this.epoch,
    this.name,
    this.release,
    this.version,
  });
  factory SoftwarePackage.fromJson(Map<String, dynamic> json) =>
      _$SoftwarePackageFromJson(json);

  Map<String, dynamic> toJson() => _$SoftwarePackageToJson(this);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ControlStatusUpdatedAt')
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

/// Provides additional context for the value of <code>Compliance.Status</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatusReason {
  /// A code that represents a reason for the control status. For the list of
  /// status reason codes and their meanings, see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff">Standards-related
  /// information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>.
  @_s.JsonKey(name: 'ReasonCode')
  final String reasonCode;

  /// The corresponding description for the status reason code.
  @_s.JsonKey(name: 'Description')
  final String description;

  StatusReason({
    @_s.required this.reasonCode,
    this.description,
  });
  factory StatusReason.fromJson(Map<String, dynamic> json) =>
      _$StatusReasonFromJson(json);

  Map<String, dynamic> toJson() => _$StatusReasonToJson(this);
}

/// A string filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Comparison')
  final StringFilterComparison comparison;

  /// The string filter value. Filter values are case sensitive. For example, the
  /// product name for control-based findings is <code>Security Hub</code>. If you
  /// provide <code>security hub</code> as the filter text, then there is no
  /// match.
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
  @_s.JsonValue('NOT_EQUALS')
  notEquals,
  @_s.JsonValue('PREFIX_NOT_EQUALS')
  prefixNotEquals,
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

  /// Indicates when the most recent instance of a threat intelligence indicator
  /// was observed.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
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
class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();
  factory UpdateOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrganizationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSecurityHubConfigurationResponse {
  UpdateSecurityHubConfigurationResponse();
  factory UpdateSecurityHubConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSecurityHubConfigurationResponseFromJson(json);
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

/// A vulnerability associated with a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Vulnerability {
  /// The identifier of the vulnerability.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// CVSS scores from the advisory related to the vulnerability.
  @_s.JsonKey(name: 'Cvss')
  final List<Cvss> cvss;

  /// A list of URLs that provide additional information about the vulnerability.
  @_s.JsonKey(name: 'ReferenceUrls')
  final List<String> referenceUrls;

  /// List of vulnerabilities that are related to this vulnerability.
  @_s.JsonKey(name: 'RelatedVulnerabilities')
  final List<String> relatedVulnerabilities;

  /// Information about the vendor that generates the vulnerability report.
  @_s.JsonKey(name: 'Vendor')
  final VulnerabilityVendor vendor;

  /// List of software packages that have the vulnerability.
  @_s.JsonKey(name: 'VulnerablePackages')
  final List<SoftwarePackage> vulnerablePackages;

  Vulnerability({
    @_s.required this.id,
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.vendor,
    this.vulnerablePackages,
  });
  factory Vulnerability.fromJson(Map<String, dynamic> json) =>
      _$VulnerabilityFromJson(json);

  Map<String, dynamic> toJson() => _$VulnerabilityToJson(this);
}

/// A vendor that generates a vulnerability report.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VulnerabilityVendor {
  /// The name of the vendor.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The URL of the vulnerability advisory.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// Indicates when the vulnerability advisory was created.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'VendorCreatedAt')
  final String vendorCreatedAt;

  /// The severity that the vendor assigned to the vulnerability.
  @_s.JsonKey(name: 'VendorSeverity')
  final String vendorSeverity;

  /// Indicates when the vulnerability advisory was last updated.
  ///
  /// Uses the <code>date-time</code> format specified in <a
  /// href="https://tools.ietf.org/html/rfc3339#section-5.6">RFC 3339 section 5.6,
  /// Internet Date/Time Format</a>. The value cannot contain spaces. For example,
  /// <code>2020-03-22T13:22:13.933Z</code>.
  @_s.JsonKey(name: 'VendorUpdatedAt')
  final String vendorUpdatedAt;

  VulnerabilityVendor({
    @_s.required this.name,
    this.url,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
  });
  factory VulnerabilityVendor.fromJson(Map<String, dynamic> json) =>
      _$VulnerabilityVendorFromJson(json);

  Map<String, dynamic> toJson() => _$VulnerabilityVendorToJson(this);
}

/// Details about the action that CloudFront or AWS WAF takes when a web request
/// matches the conditions in the rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  /// within a <code>RuleGroup</code> .
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
