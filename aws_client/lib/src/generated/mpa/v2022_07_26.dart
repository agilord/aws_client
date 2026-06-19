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

/// Multi-party approval is a capability of <a
/// href="http://aws.amazon.com/organizations">Organizations</a> that allows you
/// to protect a predefined list of operations through a distributed approval
/// process. Use Multi-party approval to establish approval workflows and
/// transform security processes into team-based decisions.
///
/// <b>When to use Multi-party approval</b>:
///
/// <ul>
/// <li>
/// You need to align with the Zero Trust principle of "never trust, always
/// verify"
/// </li>
/// <li>
/// You need to make sure that the right humans have access to the right things
/// in the right way
/// </li>
/// <li>
/// You need distributed decision-making for sensitive or critical operations
/// </li>
/// <li>
/// You need to protect against unintended operations on sensitive or critical
/// resources
/// </li>
/// <li>
/// You need formal reviews and approvals for auditing or compliance reasons
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/mpa/latest/userguide/what-is.html">What is
/// Multi-party approval</a> in the <i>Multi-party approval User Guide</i>.
class Mpa {
  final _s.RestJsonProtocol _protocol;
  Mpa({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mpa',
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

  /// Returns details for the version of a policy. Policies define the
  /// permissions for team resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyVersionArn] :
  /// Amazon Resource Name (ARN) for the policy.
  Future<GetPolicyVersionResponse> getPolicyVersion({
    required String policyVersionArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy-versions/${Uri.encodeComponent(policyVersionArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyVersionResponse.fromJson(response);
  }

  /// Returns details about a policy for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyName] :
  /// Name of the policy.
  ///
  /// Parameter [policyType] :
  /// The type of policy.
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String policyName,
    required PolicyType policyType,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyName': policyName,
      'PolicyType': policyType.value,
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Returns a list of policies. Policies define the permissions for team
  /// resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListPoliciesResponse> listPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/policies/?List',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPoliciesResponse.fromJson(response);
  }

  /// Returns a list of the versions for policies. Policies define the
  /// permissions for team resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// Amazon Resource Name (ARN) for the policy.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListPolicyVersionsResponse> listPolicyVersions({
    required String policyArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/policies/${Uri.encodeComponent(policyArn)}/?List',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyVersionsResponse.fromJson(response);
  }

  /// Returns a list of policies for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListResourcePoliciesResponse> listResourcePolicies({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/resource-policies/${Uri.encodeComponent(resourceArn)}/?List',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcePoliciesResponse.fromJson(response);
  }

  /// Returns a list of the tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates or updates a resource tag. Each tag is a label consisting of a
  /// user-defined key and value. Tags can help you manage, identify, organize,
  /// search for, and filter resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource you want to tag.
  ///
  /// Parameter [tags] :
  /// Tags that you have added to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a resource tag. Each tag is a label consisting of a user-defined
  /// key and value. Tags can help you manage, identify, organize, search for,
  /// and filter resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) for the resource you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// Array of tag key-value pairs that you want to untag.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new approval team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Approval
  /// team</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [approvalStrategy] :
  /// An <code>ApprovalStrategy</code> object. Contains details for how the team
  /// grants approval.
  ///
  /// Parameter [approvers] :
  /// An array of <code>ApprovalTeamRequesterApprovers</code> objects. Contains
  /// details for the approvers in the team.
  ///
  /// Parameter [description] :
  /// Description for the team.
  ///
  /// Parameter [name] :
  /// Name of the team.
  ///
  /// Parameter [policies] :
  /// An array of <code>PolicyReference</code> objects. Contains a list of
  /// policies that define the permissions for team resources.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services
  /// populates this field.
  /// <note>
  /// <b>What is idempotency?</b>
  ///
  /// When you make a mutating API request, the request typically returns a
  /// result before the operation's asynchronous workflows have completed.
  /// Operations might also time out or encounter other server issues before
  /// they complete, even though the request has already returned a result. This
  /// could make it difficult to determine whether the request succeeded or not,
  /// and could lead to multiple retries to ensure that the operation completes
  /// successfully. However, if the original request and the subsequent retries
  /// are successful, the operation is completed multiple times. This means that
  /// you might create more resources than you intended.
  ///
  /// <i>Idempotency</i> ensures that an API request completes no more than one
  /// time. With an idempotent request, if the original request completes
  /// successfully, any subsequent retries complete successfully without
  /// performing any further actions.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Tags you want to attach to the team.
  Future<CreateApprovalTeamResponse> createApprovalTeam({
    required ApprovalStrategy approvalStrategy,
    required List<ApprovalTeamRequestApprover> approvers,
    required String description,
    required String name,
    required List<PolicyReference> policies,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApprovalStrategy': approvalStrategy,
      'Approvers': approvers,
      'Description': description,
      'Name': name,
      'Policies': policies,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/approval-teams',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApprovalTeamResponse.fromJson(response);
  }

  /// Returns details for an approval team.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// Amazon Resource Name (ARN) for the team.
  Future<GetApprovalTeamResponse> getApprovalTeam({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/approval-teams/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApprovalTeamResponse.fromJson(response);
  }

  /// Updates an approval team. You can request to update the team description,
  /// approval threshold, and approvers in the team.
  /// <note>
  /// <b>Updates require team approval</b>
  ///
  /// Updates to an active team must be approved by the team.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// Amazon Resource Name (ARN) for the team.
  ///
  /// Parameter [approvalStrategy] :
  /// An <code>ApprovalStrategy</code> object. Contains details for how the team
  /// grants approval.
  ///
  /// Parameter [approvers] :
  /// An array of <code>ApprovalTeamRequestApprover</code> objects. Contains
  /// details for the approvers in the team.
  ///
  /// Parameter [description] :
  /// Description for the team.
  ///
  /// Parameter [updateActions] :
  /// A list of <code>UpdateAction</code> to perform when updating the team.
  Future<UpdateApprovalTeamResponse> updateApprovalTeam({
    required String arn,
    ApprovalStrategy? approvalStrategy,
    List<ApprovalTeamRequestApprover>? approvers,
    String? description,
    List<UpdateAction>? updateActions,
  }) async {
    final $payload = <String, dynamic>{
      if (approvalStrategy != null) 'ApprovalStrategy': approvalStrategy,
      if (approvers != null) 'Approvers': approvers,
      if (description != null) 'Description': description,
      if (updateActions != null)
        'UpdateActions': updateActions.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/approval-teams/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApprovalTeamResponse.fromJson(response);
  }

  /// Deletes an inactive approval team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// You can also use this operation to delete a team draft. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/update-team.html#update-team-draft-status">Interacting
  /// with drafts</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// Amaazon Resource Name (ARN) for the team.
  ///
  /// Parameter [versionId] :
  /// Version ID for the team.
  Future<void> deleteInactiveApprovalTeamVersion({
    required String arn,
    required String versionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/approval-teams/${Uri.encodeComponent(arn)}/${Uri.encodeComponent(versionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of approval teams.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListApprovalTeamsResponse> listApprovalTeams({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/approval-teams/?List',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApprovalTeamsResponse.fromJson(response);
  }

  /// Starts the deletion process for an active approval team.
  /// <note>
  /// <b>Deletions require team approval</b>
  ///
  /// Requests to delete an active team must be approved by the team.
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
  /// Amazon Resource Name (ARN) for the team.
  ///
  /// Parameter [pendingWindowDays] :
  /// Number of days between when the team approves the delete request and when
  /// the team is deleted.
  Future<StartActiveApprovalTeamDeletionResponse>
      startActiveApprovalTeamDeletion({
    required String arn,
    int? pendingWindowDays,
  }) async {
    final $payload = <String, dynamic>{
      if (pendingWindowDays != null) 'PendingWindowDays': pendingWindowDays,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/approval-teams/${Uri.encodeComponent(arn)}?Delete',
      exceptionFnMap: _exceptionFns,
    );
    return StartActiveApprovalTeamDeletionResponse.fromJson(response);
  }

  /// Starts a baseline session for specified approvers on an
  /// <code>ACTIVE</code> approval team.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// Amazon Resource Name (ARN) for the approval team.
  ///
  /// Parameter [approverIds] :
  /// Array of approver IDs.
  Future<StartApprovalTeamBaselineResponse> startApprovalTeamBaseline({
    required String arn,
    List<String>? approverIds,
  }) async {
    final $payload = <String, dynamic>{
      if (approverIds != null) 'ApproverIds': approverIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/approval-teams/${Uri.encodeComponent(arn)}/baseline',
      exceptionFnMap: _exceptionFns,
    );
    return StartApprovalTeamBaselineResponse.fromJson(response);
  }

  /// Creates a new identity source. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
  /// Source</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identitySourceParameters] :
  /// A <code> IdentitySourceParameters</code> object. Contains details for the
  /// resource that provides identities to the identity source. For example, an
  /// IAM Identity Center instance.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If not provided, the Amazon Web Services
  /// populates this field.
  /// <note>
  /// <b>What is idempotency?</b>
  ///
  /// When you make a mutating API request, the request typically returns a
  /// result before the operation's asynchronous workflows have completed.
  /// Operations might also time out or encounter other server issues before
  /// they complete, even though the request has already returned a result. This
  /// could make it difficult to determine whether the request succeeded or not,
  /// and could lead to multiple retries to ensure that the operation completes
  /// successfully. However, if the original request and the subsequent retries
  /// are successful, the operation is completed multiple times. This means that
  /// you might create more resources than you intended.
  ///
  /// <i>Idempotency</i> ensures that an API request completes no more than one
  /// time. With an idempotent request, if the original request completes
  /// successfully, any subsequent retries complete successfully without
  /// performing any further actions.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Tag you want to attach to the identity source.
  Future<CreateIdentitySourceResponse> createIdentitySource({
    required IdentitySourceParameters identitySourceParameters,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IdentitySourceParameters': identitySourceParameters,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identity-sources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIdentitySourceResponse.fromJson(response);
  }

  /// Returns details for an identity source. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
  /// Source</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identitySourceArn] :
  /// Amazon Resource Name (ARN) for the identity source.
  Future<GetIdentitySourceResponse> getIdentitySource({
    required String identitySourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/identity-sources/${Uri.encodeComponent(identitySourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdentitySourceResponse.fromJson(response);
  }

  /// Deletes an identity source. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
  /// Source</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identitySourceArn] :
  /// Amazon Resource Name (ARN) for identity source.
  Future<void> deleteIdentitySource({
    required String identitySourceArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/identity-sources/${Uri.encodeComponent(identitySourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of identity sources. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
  /// Source</a> in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListIdentitySourcesResponse> listIdentitySources({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/identity-sources/?List',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentitySourcesResponse.fromJson(response);
  }

  /// Returns details for an approval session. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Session</a>
  /// in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionArn] :
  /// Amazon Resource Name (ARN) for the session.
  Future<GetSessionResponse> getSession({
    required String sessionArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sessions/${Uri.encodeComponent(sessionArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Cancels an approval session. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Session</a>
  /// in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionArn] :
  /// Amazon Resource Name (ARN) for the session.
  Future<void> cancelSession({
    required String sessionArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/sessions/${Uri.encodeComponent(sessionArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of approval sessions. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Session</a>
  /// in the <i>Multi-party approval User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [approvalTeamArn] :
  /// Amazon Resource Name (ARN) for the approval team.
  ///
  /// Parameter [filters] :
  /// An array of <code>Filter</code> objects. Contains the filter to apply when
  /// listing sessions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that you can retrieve the remaining results.
  ///
  /// Parameter [nextToken] :
  /// If present, indicates that more output is available than is included in
  /// the current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can
  /// repeat this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  Future<ListSessionsResponse> listSessions({
    required String approvalTeamArn,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/approval-teams/${Uri.encodeComponent(approvalTeamArn)}/sessions/?List',
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }
}

/// @nodoc
class GetPolicyVersionResponse {
  /// A <code>PolicyVersion</code> object. Contains details for the version of the
  /// policy. Policies define the permissions for team resources.
  final PolicyVersion policyVersion;

  GetPolicyVersionResponse({
    required this.policyVersion,
  });

  factory GetPolicyVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyVersionResponse(
      policyVersion: PolicyVersion.fromJson(
          (json['PolicyVersion'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policyVersion = this.policyVersion;
    return {
      'PolicyVersion': policyVersion,
    };
  }
}

/// @nodoc
class GetResourcePolicyResponse {
  /// Document that contains the contents for the policy.
  final String policyDocument;

  /// Name of the policy.
  final String policyName;

  /// The type of policy
  final PolicyType policyType;

  /// Amazon Resource Name (ARN) for the resource.
  final String resourceArn;

  /// Amazon Resource Name (ARN) for the policy version.
  final String? policyVersionArn;

  GetResourcePolicyResponse({
    required this.policyDocument,
    required this.policyName,
    required this.policyType,
    required this.resourceArn,
    this.policyVersionArn,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policyDocument: (json['PolicyDocument'] as String?) ?? '',
      policyName: (json['PolicyName'] as String?) ?? '',
      policyType: PolicyType.fromString((json['PolicyType'] as String?) ?? ''),
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      policyVersionArn: json['PolicyVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final policyType = this.policyType;
    final resourceArn = this.resourceArn;
    final policyVersionArn = this.policyVersionArn;
    return {
      'PolicyDocument': policyDocument,
      'PolicyName': policyName,
      'PolicyType': policyType.value,
      'ResourceArn': resourceArn,
      if (policyVersionArn != null) 'PolicyVersionArn': policyVersionArn,
    };
  }
}

/// @nodoc
class ListPoliciesResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  /// An array of <code>Policy</code> objects. Contains a list of policies that
  /// define the permissions for team resources.
  final List<Policy>? policies;

  ListPoliciesResponse({
    this.nextToken,
    this.policies,
  });

  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      policies: (json['Policies'] as List?)
          ?.nonNulls
          .map((e) => Policy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policies = this.policies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policies != null) 'Policies': policies,
    };
  }
}

/// @nodoc
class ListPolicyVersionsResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  /// An array of <code>PolicyVersionSummary</code> objects. Contains details for
  /// the version of the policies that define the permissions for team resources.
  final List<PolicyVersionSummary>? policyVersions;

  ListPolicyVersionsResponse({
    this.nextToken,
    this.policyVersions,
  });

  factory ListPolicyVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPolicyVersionsResponse(
      nextToken: json['NextToken'] as String?,
      policyVersions: (json['PolicyVersions'] as List?)
          ?.nonNulls
          .map((e) => PolicyVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policyVersions = this.policyVersions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policyVersions != null) 'PolicyVersions': policyVersions,
    };
  }
}

/// @nodoc
class ListResourcePoliciesResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  /// An array of <code>ListResourcePoliciesResponseResourcePolicy</code> objects.
  /// Contains details about the policy for the resource.
  final List<ListResourcePoliciesResponseResourcePolicy>? resourcePolicies;

  ListResourcePoliciesResponse({
    this.nextToken,
    this.resourcePolicies,
  });

  factory ListResourcePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcePoliciesResponse(
      nextToken: json['NextToken'] as String?,
      resourcePolicies: (json['ResourcePolicies'] as List?)
          ?.nonNulls
          .map((e) => ListResourcePoliciesResponseResourcePolicy.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourcePolicies = this.resourcePolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourcePolicies != null) 'ResourcePolicies': resourcePolicies,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Tags attached to the resource.
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
class CreateApprovalTeamResponse {
  /// Amazon Resource Name (ARN) for the team that was created.
  final String? arn;

  /// Timestamp when the team was created.
  final DateTime? creationTime;

  /// Name of the team that was created.
  final String? name;

  /// Version ID for the team that was created. When a team is updated, the
  /// version ID changes.
  final String? versionId;

  CreateApprovalTeamResponse({
    this.arn,
    this.creationTime,
    this.name,
    this.versionId,
  });

  factory CreateApprovalTeamResponse.fromJson(Map<String, dynamic> json) {
    return CreateApprovalTeamResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      name: json['Name'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final name = this.name;
    final versionId = this.versionId;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (name != null) 'Name': name,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// @nodoc
class GetApprovalTeamResponse {
  /// An <code>ApprovalStrategyResponse</code> object. Contains details for how
  /// the team grants approval.
  final ApprovalStrategyResponse? approvalStrategy;

  /// An array of <code>GetApprovalTeamResponseApprover </code> objects. Contains
  /// details for the approvers in the team.
  final List<GetApprovalTeamResponseApprover>? approvers;

  /// Amazon Resource Name (ARN) for the team.
  final String? arn;

  /// Timestamp when the team was created.
  final DateTime? creationTime;

  /// Description for the team.
  final String? description;

  /// Timestamp when the team was last updated.
  final DateTime? lastUpdateTime;

  /// Name of the approval team.
  final String? name;

  /// Total number of approvers in the team.
  final int? numberOfApprovers;

  /// A <code>PendingUpdate</code> object. Contains details for the pending
  /// updates for the team, if applicable.
  final PendingUpdate? pendingUpdate;

  /// An array of <code>PolicyReference</code> objects. Contains a list of
  /// policies that define the permissions for team resources.
  final List<PolicyReference>? policies;

  /// Status for the team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatus? status;

  /// Status code for the approval team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatusCode? statusCode;

  /// Message describing the status for the team.
  final String? statusMessage;

  /// Amazon Resource Name (ARN) for the session.
  final String? updateSessionArn;

  /// Version ID for the team.
  final String? versionId;

  GetApprovalTeamResponse({
    this.approvalStrategy,
    this.approvers,
    this.arn,
    this.creationTime,
    this.description,
    this.lastUpdateTime,
    this.name,
    this.numberOfApprovers,
    this.pendingUpdate,
    this.policies,
    this.status,
    this.statusCode,
    this.statusMessage,
    this.updateSessionArn,
    this.versionId,
  });

  factory GetApprovalTeamResponse.fromJson(Map<String, dynamic> json) {
    return GetApprovalTeamResponse(
      approvalStrategy: json['ApprovalStrategy'] != null
          ? ApprovalStrategyResponse.fromJson(
              json['ApprovalStrategy'] as Map<String, dynamic>)
          : null,
      approvers: (json['Approvers'] as List?)
          ?.nonNulls
          .map((e) => GetApprovalTeamResponseApprover.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      name: json['Name'] as String?,
      numberOfApprovers: json['NumberOfApprovers'] as int?,
      pendingUpdate: json['PendingUpdate'] != null
          ? PendingUpdate.fromJson(
              json['PendingUpdate'] as Map<String, dynamic>)
          : null,
      policies: (json['Policies'] as List?)
          ?.nonNulls
          .map((e) => PolicyReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(ApprovalTeamStatus.fromString),
      statusCode: (json['StatusCode'] as String?)
          ?.let(ApprovalTeamStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
      updateSessionArn: json['UpdateSessionArn'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalStrategy = this.approvalStrategy;
    final approvers = this.approvers;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final numberOfApprovers = this.numberOfApprovers;
    final pendingUpdate = this.pendingUpdate;
    final policies = this.policies;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final updateSessionArn = this.updateSessionArn;
    final versionId = this.versionId;
    return {
      if (approvalStrategy != null) 'ApprovalStrategy': approvalStrategy,
      if (approvers != null) 'Approvers': approvers,
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (lastUpdateTime != null)
        'LastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (name != null) 'Name': name,
      if (numberOfApprovers != null) 'NumberOfApprovers': numberOfApprovers,
      if (pendingUpdate != null) 'PendingUpdate': pendingUpdate,
      if (policies != null) 'Policies': policies,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updateSessionArn != null) 'UpdateSessionArn': updateSessionArn,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// @nodoc
class UpdateApprovalTeamResponse {
  /// Version ID for the team that was created. When an approval team is updated,
  /// the version ID changes.
  final String? versionId;

  UpdateApprovalTeamResponse({
    this.versionId,
  });

  factory UpdateApprovalTeamResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApprovalTeamResponse(
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final versionId = this.versionId;
    return {
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// @nodoc
class DeleteInactiveApprovalTeamVersionResponse {
  DeleteInactiveApprovalTeamVersionResponse();

  factory DeleteInactiveApprovalTeamVersionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteInactiveApprovalTeamVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListApprovalTeamsResponse {
  /// An array of <code>ListApprovalTeamsResponseApprovalTeam</code> objects.
  /// Contains details for approval teams.
  final List<ListApprovalTeamsResponseApprovalTeam>? approvalTeams;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  ListApprovalTeamsResponse({
    this.approvalTeams,
    this.nextToken,
  });

  factory ListApprovalTeamsResponse.fromJson(Map<String, dynamic> json) {
    return ListApprovalTeamsResponse(
      approvalTeams: (json['ApprovalTeams'] as List?)
          ?.nonNulls
          .map((e) => ListApprovalTeamsResponseApprovalTeam.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalTeams = this.approvalTeams;
    final nextToken = this.nextToken;
    return {
      if (approvalTeams != null) 'ApprovalTeams': approvalTeams,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class StartActiveApprovalTeamDeletionResponse {
  /// Timestamp when the deletion process is scheduled to complete.
  final DateTime? deletionCompletionTime;

  /// Timestamp when the deletion process was initiated.
  final DateTime? deletionStartTime;

  StartActiveApprovalTeamDeletionResponse({
    this.deletionCompletionTime,
    this.deletionStartTime,
  });

  factory StartActiveApprovalTeamDeletionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartActiveApprovalTeamDeletionResponse(
      deletionCompletionTime: timeStampFromJson(json['DeletionCompletionTime']),
      deletionStartTime: timeStampFromJson(json['DeletionStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionCompletionTime = this.deletionCompletionTime;
    final deletionStartTime = this.deletionStartTime;
    return {
      if (deletionCompletionTime != null)
        'DeletionCompletionTime': iso8601ToJson(deletionCompletionTime),
      if (deletionStartTime != null)
        'DeletionStartTime': iso8601ToJson(deletionStartTime),
    };
  }
}

/// @nodoc
class StartApprovalTeamBaselineResponse {
  /// Amazon Resource Name (ARN) for the session.
  final String? baselineSessionArn;

  StartApprovalTeamBaselineResponse({
    this.baselineSessionArn,
  });

  factory StartApprovalTeamBaselineResponse.fromJson(
      Map<String, dynamic> json) {
    return StartApprovalTeamBaselineResponse(
      baselineSessionArn: json['BaselineSessionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baselineSessionArn = this.baselineSessionArn;
    return {
      if (baselineSessionArn != null) 'BaselineSessionArn': baselineSessionArn,
    };
  }
}

/// @nodoc
class CreateIdentitySourceResponse {
  /// Timestamp when the identity source was created.
  final DateTime? creationTime;

  /// Amazon Resource Name (ARN) for the identity source that was created.
  final String? identitySourceArn;

  /// The type of resource that provided identities to the identity source. For
  /// example, an IAM Identity Center instance.
  final IdentitySourceType? identitySourceType;

  CreateIdentitySourceResponse({
    this.creationTime,
    this.identitySourceArn,
    this.identitySourceType,
  });

  factory CreateIdentitySourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateIdentitySourceResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      identitySourceArn: json['IdentitySourceArn'] as String?,
      identitySourceType: (json['IdentitySourceType'] as String?)
          ?.let(IdentitySourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identitySourceArn = this.identitySourceArn;
    final identitySourceType = this.identitySourceType;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (identitySourceArn != null) 'IdentitySourceArn': identitySourceArn,
      if (identitySourceType != null)
        'IdentitySourceType': identitySourceType.value,
    };
  }
}

/// @nodoc
class GetIdentitySourceResponse {
  /// Timestamp when the identity source was created.
  final DateTime? creationTime;

  /// Amazon Resource Name (ARN) for the identity source.
  final String? identitySourceArn;

  /// A <code> IdentitySourceParameters</code> object. Contains details for the
  /// resource that provides identities to the identity source. For example, an
  /// IAM Identity Center instance.
  final IdentitySourceParametersForGet? identitySourceParameters;

  /// The type of resource that provided identities to the identity source. For
  /// example, an IAM Identity Center instance.
  final IdentitySourceType? identitySourceType;

  /// Status for the identity source. For example, if the identity source is
  /// <code>ACTIVE</code>.
  final IdentitySourceStatus? status;

  /// Status code of the identity source.
  final IdentitySourceStatusCode? statusCode;

  /// Message describing the status for the identity source.
  final String? statusMessage;

  GetIdentitySourceResponse({
    this.creationTime,
    this.identitySourceArn,
    this.identitySourceParameters,
    this.identitySourceType,
    this.status,
    this.statusCode,
    this.statusMessage,
  });

  factory GetIdentitySourceResponse.fromJson(Map<String, dynamic> json) {
    return GetIdentitySourceResponse(
      creationTime: timeStampFromJson(json['CreationTime']),
      identitySourceArn: json['IdentitySourceArn'] as String?,
      identitySourceParameters: json['IdentitySourceParameters'] != null
          ? IdentitySourceParametersForGet.fromJson(
              json['IdentitySourceParameters'] as Map<String, dynamic>)
          : null,
      identitySourceType: (json['IdentitySourceType'] as String?)
          ?.let(IdentitySourceType.fromString),
      status: (json['Status'] as String?)?.let(IdentitySourceStatus.fromString),
      statusCode: (json['StatusCode'] as String?)
          ?.let(IdentitySourceStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identitySourceArn = this.identitySourceArn;
    final identitySourceParameters = this.identitySourceParameters;
    final identitySourceType = this.identitySourceType;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (identitySourceArn != null) 'IdentitySourceArn': identitySourceArn,
      if (identitySourceParameters != null)
        'IdentitySourceParameters': identitySourceParameters,
      if (identitySourceType != null)
        'IdentitySourceType': identitySourceType.value,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ListIdentitySourcesResponse {
  /// A <code>IdentitySources</code>. Contains details for identity sources.
  final List<IdentitySourceForList>? identitySources;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  ListIdentitySourcesResponse({
    this.identitySources,
    this.nextToken,
  });

  factory ListIdentitySourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentitySourcesResponse(
      identitySources: (json['IdentitySources'] as List?)
          ?.nonNulls
          .map((e) => IdentitySourceForList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identitySources = this.identitySources;
    final nextToken = this.nextToken;
    return {
      if (identitySources != null) 'IdentitySources': identitySources,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class GetSessionResponse {
  /// Strategy for executing the protected operation.
  /// <code>AUTO_COMPLETION_UPON_APPROVAL</code> means the operation is
  /// automatically executed using the requester's permissions, if approved.
  final ActionCompletionStrategy? actionCompletionStrategy;

  /// Name of the protected operation.
  final String? actionName;

  /// A list of <code>AdditionalSecurityRequirement</code> applied to the session.
  final List<AdditionalSecurityRequirement>? additionalSecurityRequirements;

  /// An <code>ApprovalStrategyResponse</code> object. Contains details for how
  /// the team grants approval
  final ApprovalStrategyResponse? approvalStrategy;

  /// Amazon Resource Name (ARN) for the approval team.
  final String? approvalTeamArn;

  /// Name of the approval team.
  final String? approvalTeamName;

  /// An array of <code>GetSessionResponseApproverResponse</code> objects.
  /// Contains details for approver responses in the session.
  final List<GetSessionResponseApproverResponse>? approverResponses;

  /// Timestamp when the session completed.
  final DateTime? completionTime;

  /// Description for the session.
  final String? description;

  /// Status for the protected operation. For example, if the operation is
  /// <code>PENDING</code>.
  final SessionExecutionStatus? executionStatus;

  /// Timestamp when the session will expire.
  final DateTime? expirationTime;

  /// Timestamp when the session was initiated.
  final DateTime? initiationTime;

  /// Metadata for the session.
  final Map<String, String>? metadata;

  /// Total number of approvers in the session.
  final int? numberOfApprovers;

  /// Amazon Resource Name (ARN) for the protected operation.
  final String? protectedResourceArn;

  /// ID for the account that made the operation request.
  final String? requesterAccountId;

  /// Message from the account that made the operation request
  final String? requesterComment;

  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-request">IAM
  /// principal</a> that made the operation request.
  final String? requesterPrincipalArn;

  /// Amazon Web Services Region where the operation request originated.
  final String? requesterRegion;

  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">Service
  /// principal</a> for the service associated with the protected operation.
  final String? requesterServicePrincipal;

  /// Amazon Resource Name (ARN) for the session.
  final String? sessionArn;

  /// Status for the session. For example, if the team has approved the requested
  /// operation.
  final SessionStatus? status;

  /// Status code of the session.
  final SessionStatusCode? statusCode;

  /// Message describing the status for session.
  final String? statusMessage;

  GetSessionResponse({
    this.actionCompletionStrategy,
    this.actionName,
    this.additionalSecurityRequirements,
    this.approvalStrategy,
    this.approvalTeamArn,
    this.approvalTeamName,
    this.approverResponses,
    this.completionTime,
    this.description,
    this.executionStatus,
    this.expirationTime,
    this.initiationTime,
    this.metadata,
    this.numberOfApprovers,
    this.protectedResourceArn,
    this.requesterAccountId,
    this.requesterComment,
    this.requesterPrincipalArn,
    this.requesterRegion,
    this.requesterServicePrincipal,
    this.sessionArn,
    this.status,
    this.statusCode,
    this.statusMessage,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      actionCompletionStrategy: (json['ActionCompletionStrategy'] as String?)
          ?.let(ActionCompletionStrategy.fromString),
      actionName: json['ActionName'] as String?,
      additionalSecurityRequirements: (json['AdditionalSecurityRequirements']
              as List?)
          ?.nonNulls
          .map((e) => AdditionalSecurityRequirement.fromString((e as String)))
          .toList(),
      approvalStrategy: json['ApprovalStrategy'] != null
          ? ApprovalStrategyResponse.fromJson(
              json['ApprovalStrategy'] as Map<String, dynamic>)
          : null,
      approvalTeamArn: json['ApprovalTeamArn'] as String?,
      approvalTeamName: json['ApprovalTeamName'] as String?,
      approverResponses: (json['ApproverResponses'] as List?)
          ?.nonNulls
          .map((e) => GetSessionResponseApproverResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      completionTime: timeStampFromJson(json['CompletionTime']),
      description: json['Description'] as String?,
      executionStatus: (json['ExecutionStatus'] as String?)
          ?.let(SessionExecutionStatus.fromString),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      initiationTime: timeStampFromJson(json['InitiationTime']),
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      numberOfApprovers: json['NumberOfApprovers'] as int?,
      protectedResourceArn: json['ProtectedResourceArn'] as String?,
      requesterAccountId: json['RequesterAccountId'] as String?,
      requesterComment: json['RequesterComment'] as String?,
      requesterPrincipalArn: json['RequesterPrincipalArn'] as String?,
      requesterRegion: json['RequesterRegion'] as String?,
      requesterServicePrincipal: json['RequesterServicePrincipal'] as String?,
      sessionArn: json['SessionArn'] as String?,
      status: (json['Status'] as String?)?.let(SessionStatus.fromString),
      statusCode:
          (json['StatusCode'] as String?)?.let(SessionStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionCompletionStrategy = this.actionCompletionStrategy;
    final actionName = this.actionName;
    final additionalSecurityRequirements = this.additionalSecurityRequirements;
    final approvalStrategy = this.approvalStrategy;
    final approvalTeamArn = this.approvalTeamArn;
    final approvalTeamName = this.approvalTeamName;
    final approverResponses = this.approverResponses;
    final completionTime = this.completionTime;
    final description = this.description;
    final executionStatus = this.executionStatus;
    final expirationTime = this.expirationTime;
    final initiationTime = this.initiationTime;
    final metadata = this.metadata;
    final numberOfApprovers = this.numberOfApprovers;
    final protectedResourceArn = this.protectedResourceArn;
    final requesterAccountId = this.requesterAccountId;
    final requesterComment = this.requesterComment;
    final requesterPrincipalArn = this.requesterPrincipalArn;
    final requesterRegion = this.requesterRegion;
    final requesterServicePrincipal = this.requesterServicePrincipal;
    final sessionArn = this.sessionArn;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (actionCompletionStrategy != null)
        'ActionCompletionStrategy': actionCompletionStrategy.value,
      if (actionName != null) 'ActionName': actionName,
      if (additionalSecurityRequirements != null)
        'AdditionalSecurityRequirements':
            additionalSecurityRequirements.map((e) => e.value).toList(),
      if (approvalStrategy != null) 'ApprovalStrategy': approvalStrategy,
      if (approvalTeamArn != null) 'ApprovalTeamArn': approvalTeamArn,
      if (approvalTeamName != null) 'ApprovalTeamName': approvalTeamName,
      if (approverResponses != null) 'ApproverResponses': approverResponses,
      if (completionTime != null)
        'CompletionTime': iso8601ToJson(completionTime),
      if (description != null) 'Description': description,
      if (executionStatus != null) 'ExecutionStatus': executionStatus.value,
      if (expirationTime != null)
        'ExpirationTime': iso8601ToJson(expirationTime),
      if (initiationTime != null)
        'InitiationTime': iso8601ToJson(initiationTime),
      if (metadata != null) 'Metadata': metadata,
      if (numberOfApprovers != null) 'NumberOfApprovers': numberOfApprovers,
      if (protectedResourceArn != null)
        'ProtectedResourceArn': protectedResourceArn,
      if (requesterAccountId != null) 'RequesterAccountId': requesterAccountId,
      if (requesterComment != null) 'RequesterComment': requesterComment,
      if (requesterPrincipalArn != null)
        'RequesterPrincipalArn': requesterPrincipalArn,
      if (requesterRegion != null) 'RequesterRegion': requesterRegion,
      if (requesterServicePrincipal != null)
        'RequesterServicePrincipal': requesterServicePrincipal,
      if (sessionArn != null) 'SessionArn': sessionArn,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class CancelSessionResponse {
  CancelSessionResponse();

  factory CancelSessionResponse.fromJson(Map<String, dynamic> _) {
    return CancelSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListSessionsResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a next call to the operation to get more output. You can repeat
  /// this until the <code>NextToken</code> response element returns
  /// <code>null</code>.
  final String? nextToken;

  /// An array of <code>ListSessionsResponseSession</code> objects. Contains
  /// details for the sessions.
  final List<ListSessionsResponseSession>? sessions;

  ListSessionsResponse({
    this.nextToken,
    this.sessions,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      nextToken: json['NextToken'] as String?,
      sessions: (json['Sessions'] as List?)
          ?.nonNulls
          .map((e) =>
              ListSessionsResponseSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sessions != null) 'Sessions': sessions,
    };
  }
}

/// Contains details for an approval session. For more information, see <a
/// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Session</a>
/// in the <i>Multi-party approval User Guide</i>
///
/// @nodoc
class ListSessionsResponseSession {
  /// Strategy for executing the protected operation.
  /// <code>AUTO_COMPLETION_UPON_APPROVAL</code> means the operation is executed
  /// automatically using the requester's permissions, if approved.
  final ActionCompletionStrategy? actionCompletionStrategy;

  /// Name of the protected operation.
  final String? actionName;

  /// A list of <code>AdditionalSecurityRequirement</code> applied to the session.
  final List<AdditionalSecurityRequirement>? additionalSecurityRequirements;

  /// Amazon Resource Name (ARN) for the approval team.
  final String? approvalTeamArn;

  /// Name of the approval team.
  final String? approvalTeamName;

  /// Timestamp when the session was completed.
  final DateTime? completionTime;

  /// Description for the team.
  final String? description;

  /// Timestamp when the session was expire.
  final DateTime? expirationTime;

  /// Timestamp when the session was initiated.
  final DateTime? initiationTime;

  /// Amazon Resource Name (ARN) for the protected operation.
  final String? protectedResourceArn;

  /// ID for the account that made the operation request.
  final String? requesterAccountId;

  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-request">IAM
  /// principal</a> that made the operation request.
  final String? requesterPrincipalArn;

  /// Amazon Web Services Region where the operation request originated.
  final String? requesterRegion;

  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">Service
  /// principal</a> for the service associated with the protected operation.
  final String? requesterServicePrincipal;

  /// Amazon Resource Name (ARN) for the session.
  final String? sessionArn;

  /// Status for the protected operation. For example, if the operation is
  /// <code>PENDING</code>.
  final SessionStatus? status;

  /// Status code of the session.
  final SessionStatusCode? statusCode;

  /// Message describing the status for session.
  final String? statusMessage;

  ListSessionsResponseSession({
    this.actionCompletionStrategy,
    this.actionName,
    this.additionalSecurityRequirements,
    this.approvalTeamArn,
    this.approvalTeamName,
    this.completionTime,
    this.description,
    this.expirationTime,
    this.initiationTime,
    this.protectedResourceArn,
    this.requesterAccountId,
    this.requesterPrincipalArn,
    this.requesterRegion,
    this.requesterServicePrincipal,
    this.sessionArn,
    this.status,
    this.statusCode,
    this.statusMessage,
  });

  factory ListSessionsResponseSession.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponseSession(
      actionCompletionStrategy: (json['ActionCompletionStrategy'] as String?)
          ?.let(ActionCompletionStrategy.fromString),
      actionName: json['ActionName'] as String?,
      additionalSecurityRequirements: (json['AdditionalSecurityRequirements']
              as List?)
          ?.nonNulls
          .map((e) => AdditionalSecurityRequirement.fromString((e as String)))
          .toList(),
      approvalTeamArn: json['ApprovalTeamArn'] as String?,
      approvalTeamName: json['ApprovalTeamName'] as String?,
      completionTime: timeStampFromJson(json['CompletionTime']),
      description: json['Description'] as String?,
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      initiationTime: timeStampFromJson(json['InitiationTime']),
      protectedResourceArn: json['ProtectedResourceArn'] as String?,
      requesterAccountId: json['RequesterAccountId'] as String?,
      requesterPrincipalArn: json['RequesterPrincipalArn'] as String?,
      requesterRegion: json['RequesterRegion'] as String?,
      requesterServicePrincipal: json['RequesterServicePrincipal'] as String?,
      sessionArn: json['SessionArn'] as String?,
      status: (json['Status'] as String?)?.let(SessionStatus.fromString),
      statusCode:
          (json['StatusCode'] as String?)?.let(SessionStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionCompletionStrategy = this.actionCompletionStrategy;
    final actionName = this.actionName;
    final additionalSecurityRequirements = this.additionalSecurityRequirements;
    final approvalTeamArn = this.approvalTeamArn;
    final approvalTeamName = this.approvalTeamName;
    final completionTime = this.completionTime;
    final description = this.description;
    final expirationTime = this.expirationTime;
    final initiationTime = this.initiationTime;
    final protectedResourceArn = this.protectedResourceArn;
    final requesterAccountId = this.requesterAccountId;
    final requesterPrincipalArn = this.requesterPrincipalArn;
    final requesterRegion = this.requesterRegion;
    final requesterServicePrincipal = this.requesterServicePrincipal;
    final sessionArn = this.sessionArn;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (actionCompletionStrategy != null)
        'ActionCompletionStrategy': actionCompletionStrategy.value,
      if (actionName != null) 'ActionName': actionName,
      if (additionalSecurityRequirements != null)
        'AdditionalSecurityRequirements':
            additionalSecurityRequirements.map((e) => e.value).toList(),
      if (approvalTeamArn != null) 'ApprovalTeamArn': approvalTeamArn,
      if (approvalTeamName != null) 'ApprovalTeamName': approvalTeamName,
      if (completionTime != null)
        'CompletionTime': iso8601ToJson(completionTime),
      if (description != null) 'Description': description,
      if (expirationTime != null)
        'ExpirationTime': iso8601ToJson(expirationTime),
      if (initiationTime != null)
        'InitiationTime': iso8601ToJson(initiationTime),
      if (protectedResourceArn != null)
        'ProtectedResourceArn': protectedResourceArn,
      if (requesterAccountId != null) 'RequesterAccountId': requesterAccountId,
      if (requesterPrincipalArn != null)
        'RequesterPrincipalArn': requesterPrincipalArn,
      if (requesterRegion != null) 'RequesterRegion': requesterRegion,
      if (requesterServicePrincipal != null)
        'RequesterServicePrincipal': requesterServicePrincipal,
      if (sessionArn != null) 'SessionArn': sessionArn,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class SessionStatus {
  static const pending = SessionStatus._('PENDING');
  static const cancelled = SessionStatus._('CANCELLED');
  static const approved = SessionStatus._('APPROVED');
  static const failed = SessionStatus._('FAILED');
  static const creating = SessionStatus._('CREATING');

  final String value;

  const SessionStatus._(this.value);

  static const values = [pending, cancelled, approved, failed, creating];

  static SessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionStatus._(value));

  @override
  bool operator ==(other) => other is SessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SessionStatusCode {
  static const rejected = SessionStatusCode._('REJECTED');
  static const expired = SessionStatusCode._('EXPIRED');
  static const configurationChanged =
      SessionStatusCode._('CONFIGURATION_CHANGED');
  static const allApproversInSession =
      SessionStatusCode._('ALL_APPROVERS_IN_SESSION');

  final String value;

  const SessionStatusCode._(this.value);

  static const values = [
    rejected,
    expired,
    configurationChanged,
    allApproversInSession
  ];

  static SessionStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionStatusCode._(value));

  @override
  bool operator ==(other) => other is SessionStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ActionCompletionStrategy {
  static const autoCompletionUponApproval =
      ActionCompletionStrategy._('AUTO_COMPLETION_UPON_APPROVAL');

  final String value;

  const ActionCompletionStrategy._(this.value);

  static const values = [autoCompletionUponApproval];

  static ActionCompletionStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionCompletionStrategy._(value));

  @override
  bool operator ==(other) =>
      other is ActionCompletionStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional security requirements applied to a session or invitation
///
/// <ul>
/// <li>
/// <code>APPROVER_VERIFICATION_REQUIRED</code>: Approvers will be required to
/// perform an MFA challenge to vote
/// </li>
/// </ul>
///
/// @nodoc
class AdditionalSecurityRequirement {
  static const approverVerificationRequired =
      AdditionalSecurityRequirement._('APPROVER_VERIFICATION_REQUIRED');

  final String value;

  const AdditionalSecurityRequirement._(this.value);

  static const values = [approverVerificationRequired];

  static AdditionalSecurityRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdditionalSecurityRequirement._(value));

  @override
  bool operator ==(other) =>
      other is AdditionalSecurityRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the filter to apply to requests. You can specify up to 10 filters
/// for a request.
///
/// @nodoc
class Filter {
  /// Name of the filter to use.
  /// <note>
  /// <b>Supported filters</b>
  ///
  /// The supported filters for <a>ListSessions</a> are: <code>ActionName</code>,
  /// <code>SessionStatus</code>, and <code>InitationTime</code>.
  /// </note>
  final FilterField? fieldName;

  /// Operator to use for filtering.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code>: Equal to the specified value
  /// </li>
  /// <li>
  /// <code>NE</code>: Not equal to the specified value
  /// </li>
  /// <li>
  /// <code>GT</code>: Greater than the specified value
  /// </li>
  /// <li>
  /// <code>LT</code>: Less than the specified value
  /// </li>
  /// <li>
  /// <code>GTE</code>: Greater than or equal to the specified value
  /// </li>
  /// <li>
  /// <code>LTE</code>: Less than or equal to the specified value
  /// </li>
  /// <li>
  /// <code>CONTAINS</code>: Contains the specified value
  /// </li>
  /// <li>
  /// <code>NOT_CONTAINS</code>: Does not contain the specified value
  /// </li>
  /// <li>
  /// <code>BETWEEN</code>: Between two values, inclusive of the specified values.
  /// </li>
  /// </ul> <note>
  /// <b>Supported operators for each filter</b>:
  ///
  /// <ul>
  /// <li>
  /// <code>ActionName</code>: <code>EQ</code> | <code>NE</code> |
  /// <code>CONTAINS</code> | <code>NOT_CONTAINS</code>
  /// </li>
  /// <li>
  /// <code>SessionStatus</code>: <code>EQ</code> | <code>NE</code>
  /// </li>
  /// <li>
  /// <code>InitiationTime</code>: <code>GT</code> | <code>LT</code> |
  /// <code>GTE</code> | <code>LTE</code> | <code>BETWEEN</code>
  /// </li>
  /// </ul> </note>
  final Operator? operator;

  /// Value to use for filtering. For the <code>BETWEEN</code> operator, specify
  /// values in the format <code>a AND b</code> (<code>AND</code> is
  /// case-insensitive).
  final String? value;

  Filter({
    this.fieldName,
    this.operator,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    final operator = this.operator;
    final value = this.value;
    return {
      if (fieldName != null) 'FieldName': fieldName.value,
      if (operator != null) 'Operator': operator.value,
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class FilterField {
  static const actionName = FilterField._('ActionName');
  static const approvalTeamName = FilterField._('ApprovalTeamName');
  static const votingTime = FilterField._('VotingTime');
  static const vote = FilterField._('Vote');
  static const sessionStatus = FilterField._('SessionStatus');
  static const initiationTime = FilterField._('InitiationTime');

  final String value;

  const FilterField._(this.value);

  static const values = [
    actionName,
    approvalTeamName,
    votingTime,
    vote,
    sessionStatus,
    initiationTime
  ];

  static FilterField fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterField._(value));

  @override
  bool operator ==(other) => other is FilterField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Operator {
  static const eq = Operator._('EQ');
  static const ne = Operator._('NE');
  static const gt = Operator._('GT');
  static const lt = Operator._('LT');
  static const gte = Operator._('GTE');
  static const lte = Operator._('LTE');
  static const contains = Operator._('CONTAINS');
  static const notContains = Operator._('NOT_CONTAINS');
  static const between = Operator._('BETWEEN');

  final String value;

  const Operator._(this.value);

  static const values = [
    eq,
    ne,
    gt,
    lt,
    gte,
    lte,
    contains,
    notContains,
    between
  ];

  static Operator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operator._(value));

  @override
  bool operator ==(other) => other is Operator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for how an approval team grants approval.
///
/// @nodoc
class ApprovalStrategyResponse {
  /// Minimum number of approvals (M) required for a total number of approvers
  /// (N).
  final MofNApprovalStrategy? mofN;

  ApprovalStrategyResponse({
    this.mofN,
  });

  factory ApprovalStrategyResponse.fromJson(Map<String, dynamic> json) {
    return ApprovalStrategyResponse(
      mofN: json['MofN'] != null
          ? MofNApprovalStrategy.fromJson(json['MofN'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mofN = this.mofN;
    return {
      if (mofN != null) 'MofN': mofN,
    };
  }
}

/// @nodoc
class SessionExecutionStatus {
  static const executed = SessionExecutionStatus._('EXECUTED');
  static const failed = SessionExecutionStatus._('FAILED');
  static const pending = SessionExecutionStatus._('PENDING');

  final String value;

  const SessionExecutionStatus._(this.value);

  static const values = [executed, failed, pending];

  static SessionExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is SessionExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for an approver response in an approval session.
///
/// @nodoc
class GetSessionResponseApproverResponse {
  /// ID for the approver.
  final String? approverId;

  /// ID for the identity source. The identity source manages the user
  /// authentication for approvers.
  final String? identityId;

  /// Amazon Resource Name (ARN) for the identity source. The identity source
  /// manages the user authentication for approvers.
  final String? identitySourceArn;

  /// Response to the operation request.
  final SessionResponse? response;

  /// Timestamp when a approver responded to the operation request.
  final DateTime? responseTime;

  GetSessionResponseApproverResponse({
    this.approverId,
    this.identityId,
    this.identitySourceArn,
    this.response,
    this.responseTime,
  });

  factory GetSessionResponseApproverResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSessionResponseApproverResponse(
      approverId: json['ApproverId'] as String?,
      identityId: json['IdentityId'] as String?,
      identitySourceArn: json['IdentitySourceArn'] as String?,
      response: (json['Response'] as String?)?.let(SessionResponse.fromString),
      responseTime: timeStampFromJson(json['ResponseTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final approverId = this.approverId;
    final identityId = this.identityId;
    final identitySourceArn = this.identitySourceArn;
    final response = this.response;
    final responseTime = this.responseTime;
    return {
      if (approverId != null) 'ApproverId': approverId,
      if (identityId != null) 'IdentityId': identityId,
      if (identitySourceArn != null) 'IdentitySourceArn': identitySourceArn,
      if (response != null) 'Response': response.value,
      if (responseTime != null) 'ResponseTime': iso8601ToJson(responseTime),
    };
  }
}

/// @nodoc
class SessionResponse {
  static const approved = SessionResponse._('APPROVED');
  static const rejected = SessionResponse._('REJECTED');
  static const noResponse = SessionResponse._('NO_RESPONSE');

  final String value;

  const SessionResponse._(this.value);

  static const values = [approved, rejected, noResponse];

  static SessionResponse fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionResponse._(value));

  @override
  bool operator ==(other) => other is SessionResponse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Strategy for how an approval team grants approval.
///
/// @nodoc
class MofNApprovalStrategy {
  /// Minimum number of approvals (M) required for a total number of approvers
  /// (N).
  final int minApprovalsRequired;

  MofNApprovalStrategy({
    required this.minApprovalsRequired,
  });

  factory MofNApprovalStrategy.fromJson(Map<String, dynamic> json) {
    return MofNApprovalStrategy(
      minApprovalsRequired: (json['MinApprovalsRequired'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final minApprovalsRequired = this.minApprovalsRequired;
    return {
      'MinApprovalsRequired': minApprovalsRequired,
    };
  }
}

/// Contains details for an identity source. For more information, see <a
/// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
/// source</a> in the <i>Multi-party approval User Guide</i>.
///
/// @nodoc
class IdentitySourceForList {
  /// Timestamp when the identity source was created.
  final DateTime? creationTime;

  /// Amazon Resource Name (ARN) for the identity source.
  final String? identitySourceArn;

  /// A <code>IdentitySourceParametersForList</code> object. Contains details for
  /// the resource that provides identities to the identity source. For example,
  /// an IAM Identity Center instance.
  final IdentitySourceParametersForList? identitySourceParameters;

  /// The type of resource that provided identities to the identity source. For
  /// example, an IAM Identity Center instance.
  final IdentitySourceType? identitySourceType;

  /// Status for the identity source. For example, if the identity source is
  /// <code>ACTIVE</code>.
  final IdentitySourceStatus? status;

  /// Status code of the identity source.
  final IdentitySourceStatusCode? statusCode;

  /// Message describing the status for the identity source.
  final String? statusMessage;

  IdentitySourceForList({
    this.creationTime,
    this.identitySourceArn,
    this.identitySourceParameters,
    this.identitySourceType,
    this.status,
    this.statusCode,
    this.statusMessage,
  });

  factory IdentitySourceForList.fromJson(Map<String, dynamic> json) {
    return IdentitySourceForList(
      creationTime: timeStampFromJson(json['CreationTime']),
      identitySourceArn: json['IdentitySourceArn'] as String?,
      identitySourceParameters: json['IdentitySourceParameters'] != null
          ? IdentitySourceParametersForList.fromJson(
              json['IdentitySourceParameters'] as Map<String, dynamic>)
          : null,
      identitySourceType: (json['IdentitySourceType'] as String?)
          ?.let(IdentitySourceType.fromString),
      status: (json['Status'] as String?)?.let(IdentitySourceStatus.fromString),
      statusCode: (json['StatusCode'] as String?)
          ?.let(IdentitySourceStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identitySourceArn = this.identitySourceArn;
    final identitySourceParameters = this.identitySourceParameters;
    final identitySourceType = this.identitySourceType;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (identitySourceArn != null) 'IdentitySourceArn': identitySourceArn,
      if (identitySourceParameters != null)
        'IdentitySourceParameters': identitySourceParameters,
      if (identitySourceType != null)
        'IdentitySourceType': identitySourceType.value,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class IdentitySourceType {
  static const iamIdentityCenter = IdentitySourceType._('IAM_IDENTITY_CENTER');

  final String value;

  const IdentitySourceType._(this.value);

  static const values = [iamIdentityCenter];

  static IdentitySourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentitySourceType._(value));

  @override
  bool operator ==(other) =>
      other is IdentitySourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for the resource that provides identities to the identity
/// source. For example, an IAM Identity Center instance. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
/// source</a> in the <i>Multi-party approval User Guide</i>.
///
/// @nodoc
class IdentitySourceParametersForList {
  /// IAM Identity Center credentials.
  final IamIdentityCenterForList? iamIdentityCenter;

  IdentitySourceParametersForList({
    this.iamIdentityCenter,
  });

  factory IdentitySourceParametersForList.fromJson(Map<String, dynamic> json) {
    return IdentitySourceParametersForList(
      iamIdentityCenter: json['IamIdentityCenter'] != null
          ? IamIdentityCenterForList.fromJson(
              json['IamIdentityCenter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamIdentityCenter = this.iamIdentityCenter;
    return {
      if (iamIdentityCenter != null) 'IamIdentityCenter': iamIdentityCenter,
    };
  }
}

/// @nodoc
class IdentitySourceStatus {
  static const creating = IdentitySourceStatus._('CREATING');
  static const active = IdentitySourceStatus._('ACTIVE');
  static const deleting = IdentitySourceStatus._('DELETING');
  static const error = IdentitySourceStatus._('ERROR');

  final String value;

  const IdentitySourceStatus._(this.value);

  static const values = [creating, active, deleting, error];

  static IdentitySourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentitySourceStatus._(value));

  @override
  bool operator ==(other) =>
      other is IdentitySourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IdentitySourceStatusCode {
  static const accessDenied = IdentitySourceStatusCode._('ACCESS_DENIED');
  static const deletionFailed = IdentitySourceStatusCode._('DELETION_FAILED');
  static const idcInstanceNotFound =
      IdentitySourceStatusCode._('IDC_INSTANCE_NOT_FOUND');
  static const idcInstanceNotValid =
      IdentitySourceStatusCode._('IDC_INSTANCE_NOT_VALID');

  final String value;

  const IdentitySourceStatusCode._(this.value);

  static const values = [
    accessDenied,
    deletionFailed,
    idcInstanceNotFound,
    idcInstanceNotValid
  ];

  static IdentitySourceStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentitySourceStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is IdentitySourceStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// IAM Identity Center credentials. For more information see, <a
/// href="http://aws.amazon.com/identity-center/">IAM Identity Center</a> .
///
/// @nodoc
class IamIdentityCenterForList {
  /// URL for the approval portal associated with the IAM Identity Center
  /// instance.
  final String? approvalPortalUrl;

  /// Amazon Resource Name (ARN) for the IAM Identity Center instance.
  final String? instanceArn;

  /// Amazon Web Services Region where the IAM Identity Center instance is
  /// located.
  final String? region;

  IamIdentityCenterForList({
    this.approvalPortalUrl,
    this.instanceArn,
    this.region,
  });

  factory IamIdentityCenterForList.fromJson(Map<String, dynamic> json) {
    return IamIdentityCenterForList(
      approvalPortalUrl: json['ApprovalPortalUrl'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalPortalUrl = this.approvalPortalUrl;
    final instanceArn = this.instanceArn;
    final region = this.region;
    return {
      if (approvalPortalUrl != null) 'ApprovalPortalUrl': approvalPortalUrl,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (region != null) 'Region': region,
    };
  }
}

/// Contains details for the resource that provides identities to the identity
/// source. For example, an IAM Identity Center instance. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-concepts.html">Identity
/// source</a> in the <i>Multi-party approval User Guide</i>.
///
/// @nodoc
class IdentitySourceParametersForGet {
  /// IAM Identity Center credentials.
  final IamIdentityCenterForGet? iamIdentityCenter;

  IdentitySourceParametersForGet({
    this.iamIdentityCenter,
  });

  factory IdentitySourceParametersForGet.fromJson(Map<String, dynamic> json) {
    return IdentitySourceParametersForGet(
      iamIdentityCenter: json['IamIdentityCenter'] != null
          ? IamIdentityCenterForGet.fromJson(
              json['IamIdentityCenter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamIdentityCenter = this.iamIdentityCenter;
    return {
      if (iamIdentityCenter != null) 'IamIdentityCenter': iamIdentityCenter,
    };
  }
}

/// IAM Identity Center credentials. For more information see, <a
/// href="http://aws.amazon.com/identity-center/">IAM Identity Center</a> .
///
/// @nodoc
class IamIdentityCenterForGet {
  /// URL for the approval portal associated with the IAM Identity Center
  /// instance.
  final String? approvalPortalUrl;

  /// Amazon Resource Name (ARN) for the IAM Identity Center instance.
  final String? instanceArn;

  /// Amazon Web Services Region where the IAM Identity Center instance is
  /// located.
  final String? region;

  IamIdentityCenterForGet({
    this.approvalPortalUrl,
    this.instanceArn,
    this.region,
  });

  factory IamIdentityCenterForGet.fromJson(Map<String, dynamic> json) {
    return IamIdentityCenterForGet(
      approvalPortalUrl: json['ApprovalPortalUrl'] as String?,
      instanceArn: json['InstanceArn'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalPortalUrl = this.approvalPortalUrl;
    final instanceArn = this.instanceArn;
    final region = this.region;
    return {
      if (approvalPortalUrl != null) 'ApprovalPortalUrl': approvalPortalUrl,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (region != null) 'Region': region,
    };
  }
}

/// Contains details for the resource that provides identities to the identity
/// source. For example, an IAM Identity Center instance.
///
/// @nodoc
class IdentitySourceParameters {
  /// IAM Identity Center credentials.
  final IamIdentityCenter? iamIdentityCenter;

  IdentitySourceParameters({
    this.iamIdentityCenter,
  });

  Map<String, dynamic> toJson() {
    final iamIdentityCenter = this.iamIdentityCenter;
    return {
      if (iamIdentityCenter != null) 'IamIdentityCenter': iamIdentityCenter,
    };
  }
}

/// IAM Identity Center credentials. For more information see, <a
/// href="http://aws.amazon.com/identity-center/">IAM Identity Center</a> .
///
/// @nodoc
class IamIdentityCenter {
  /// Amazon Resource Name (ARN) for the IAM Identity Center instance.
  final String instanceArn;

  /// Amazon Web Services Region where the IAM Identity Center instance is
  /// located.
  final String region;

  IamIdentityCenter({
    required this.instanceArn,
    required this.region,
  });

  Map<String, dynamic> toJson() {
    final instanceArn = this.instanceArn;
    final region = this.region;
    return {
      'InstanceArn': instanceArn,
      'Region': region,
    };
  }
}

/// Contains details for an approval team
///
/// @nodoc
class ListApprovalTeamsResponseApprovalTeam {
  /// An <code>ApprovalStrategyResponse</code> object. Contains details for how an
  /// approval team grants approval.
  final ApprovalStrategyResponse? approvalStrategy;

  /// Amazon Resource Name (ARN) for the team.
  final String? arn;

  /// Timestamp when the team was created.
  final DateTime? creationTime;

  /// Description for the team.
  final String? description;

  /// Name of the team.
  final String? name;

  /// Total number of approvers in the team.
  final int? numberOfApprovers;

  /// Status for the team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatus? status;

  /// Status code for the team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatusCode? statusCode;

  /// Message describing the status for the team.
  final String? statusMessage;

  ListApprovalTeamsResponseApprovalTeam({
    this.approvalStrategy,
    this.arn,
    this.creationTime,
    this.description,
    this.name,
    this.numberOfApprovers,
    this.status,
    this.statusCode,
    this.statusMessage,
  });

  factory ListApprovalTeamsResponseApprovalTeam.fromJson(
      Map<String, dynamic> json) {
    return ListApprovalTeamsResponseApprovalTeam(
      approvalStrategy: json['ApprovalStrategy'] != null
          ? ApprovalStrategyResponse.fromJson(
              json['ApprovalStrategy'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      numberOfApprovers: json['NumberOfApprovers'] as int?,
      status: (json['Status'] as String?)?.let(ApprovalTeamStatus.fromString),
      statusCode: (json['StatusCode'] as String?)
          ?.let(ApprovalTeamStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalStrategy = this.approvalStrategy;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final numberOfApprovers = this.numberOfApprovers;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (approvalStrategy != null) 'ApprovalStrategy': approvalStrategy,
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (numberOfApprovers != null) 'NumberOfApprovers': numberOfApprovers,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ApprovalTeamStatus {
  static const active = ApprovalTeamStatus._('ACTIVE');
  static const inactive = ApprovalTeamStatus._('INACTIVE');
  static const deleting = ApprovalTeamStatus._('DELETING');
  static const pending = ApprovalTeamStatus._('PENDING');

  final String value;

  const ApprovalTeamStatus._(this.value);

  static const values = [active, inactive, deleting, pending];

  static ApprovalTeamStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApprovalTeamStatus._(value));

  @override
  bool operator ==(other) =>
      other is ApprovalTeamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApprovalTeamStatusCode {
  static const validating = ApprovalTeamStatusCode._('VALIDATING');
  static const pendingActivation =
      ApprovalTeamStatusCode._('PENDING_ACTIVATION');
  static const failedValidation = ApprovalTeamStatusCode._('FAILED_VALIDATION');
  static const failedActivation = ApprovalTeamStatusCode._('FAILED_ACTIVATION');
  static const updatePendingApproval =
      ApprovalTeamStatusCode._('UPDATE_PENDING_APPROVAL');
  static const updatePendingActivation =
      ApprovalTeamStatusCode._('UPDATE_PENDING_ACTIVATION');
  static const updateFailedApproval =
      ApprovalTeamStatusCode._('UPDATE_FAILED_APPROVAL');
  static const updateFailedActivation =
      ApprovalTeamStatusCode._('UPDATE_FAILED_ACTIVATION');
  static const updateFailedValidation =
      ApprovalTeamStatusCode._('UPDATE_FAILED_VALIDATION');
  static const deletePendingApproval =
      ApprovalTeamStatusCode._('DELETE_PENDING_APPROVAL');
  static const deleteFailedApproval =
      ApprovalTeamStatusCode._('DELETE_FAILED_APPROVAL');
  static const deleteFailedValidation =
      ApprovalTeamStatusCode._('DELETE_FAILED_VALIDATION');

  final String value;

  const ApprovalTeamStatusCode._(this.value);

  static const values = [
    validating,
    pendingActivation,
    failedValidation,
    failedActivation,
    updatePendingApproval,
    updatePendingActivation,
    updateFailedApproval,
    updateFailedActivation,
    updateFailedValidation,
    deletePendingApproval,
    deleteFailedApproval,
    deleteFailedValidation
  ];

  static ApprovalTeamStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApprovalTeamStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is ApprovalTeamStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Strategy for how an approval team grants approval.
///
/// @nodoc
class ApprovalStrategy {
  /// Minimum number of approvals (M) required for a total number of approvers
  /// (N).
  final MofNApprovalStrategy? mofN;

  ApprovalStrategy({
    this.mofN,
  });

  Map<String, dynamic> toJson() {
    final mofN = this.mofN;
    return {
      if (mofN != null) 'MofN': mofN,
    };
  }
}

/// Actions that can be taken when updating an approval team
///
/// <ul>
/// <li>
/// <code>SYNCHRONIZE_MFA_DEVICES</code>: Synchronize MFA devices for all
/// approvers on the team
/// </li>
/// </ul>
///
/// @nodoc
class UpdateAction {
  static const synchronizeMfaDevices =
      UpdateAction._('SYNCHRONIZE_MFA_DEVICES');

  final String value;

  const UpdateAction._(this.value);

  static const values = [synchronizeMfaDevices];

  static UpdateAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateAction._(value));

  @override
  bool operator ==(other) => other is UpdateAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for an approver.
///
/// @nodoc
class ApprovalTeamRequestApprover {
  /// ID for the user.
  final String primaryIdentityId;

  /// Amazon Resource Name (ARN) for the identity source. The identity source
  /// manages the user authentication for approvers.
  final String primaryIdentitySourceArn;

  ApprovalTeamRequestApprover({
    required this.primaryIdentityId,
    required this.primaryIdentitySourceArn,
  });

  Map<String, dynamic> toJson() {
    final primaryIdentityId = this.primaryIdentityId;
    final primaryIdentitySourceArn = this.primaryIdentitySourceArn;
    return {
      'PrimaryIdentityId': primaryIdentityId,
      'PrimaryIdentitySourceArn': primaryIdentitySourceArn,
    };
  }
}

/// Contains details for the pending updates for an approval team, if
/// applicable.
///
/// @nodoc
class PendingUpdate {
  /// An <code>ApprovalStrategyResponse</code> object. Contains details for how
  /// the team grants approval.
  final ApprovalStrategyResponse? approvalStrategy;

  /// An array of <code>GetApprovalTeamResponseApprover </code> objects. Contains
  /// details for the approvers in the team.
  final List<GetApprovalTeamResponseApprover>? approvers;

  /// Description for the team.
  final String? description;

  /// Total number of approvers in the team.
  final int? numberOfApprovers;

  /// Status for the team. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatus? status;

  /// Status code for the update. For more information, see <a
  /// href="https://docs.aws.amazon.com/mpa/latest/userguide/mpa-health.html">Team
  /// health</a> in the <i>Multi-party approval User Guide</i>.
  final ApprovalTeamStatusCode? statusCode;

  /// Message describing the status for the team.
  final String? statusMessage;

  /// Timestamp when the update request was initiated.
  final DateTime? updateInitiationTime;

  /// Version ID for the team.
  final String? versionId;

  PendingUpdate({
    this.approvalStrategy,
    this.approvers,
    this.description,
    this.numberOfApprovers,
    this.status,
    this.statusCode,
    this.statusMessage,
    this.updateInitiationTime,
    this.versionId,
  });

  factory PendingUpdate.fromJson(Map<String, dynamic> json) {
    return PendingUpdate(
      approvalStrategy: json['ApprovalStrategy'] != null
          ? ApprovalStrategyResponse.fromJson(
              json['ApprovalStrategy'] as Map<String, dynamic>)
          : null,
      approvers: (json['Approvers'] as List?)
          ?.nonNulls
          .map((e) => GetApprovalTeamResponseApprover.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      numberOfApprovers: json['NumberOfApprovers'] as int?,
      status: (json['Status'] as String?)?.let(ApprovalTeamStatus.fromString),
      statusCode: (json['StatusCode'] as String?)
          ?.let(ApprovalTeamStatusCode.fromString),
      statusMessage: json['StatusMessage'] as String?,
      updateInitiationTime: timeStampFromJson(json['UpdateInitiationTime']),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalStrategy = this.approvalStrategy;
    final approvers = this.approvers;
    final description = this.description;
    final numberOfApprovers = this.numberOfApprovers;
    final status = this.status;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final updateInitiationTime = this.updateInitiationTime;
    final versionId = this.versionId;
    return {
      if (approvalStrategy != null) 'ApprovalStrategy': approvalStrategy,
      if (approvers != null) 'Approvers': approvers,
      if (description != null) 'Description': description,
      if (numberOfApprovers != null) 'NumberOfApprovers': numberOfApprovers,
      if (status != null) 'Status': status.value,
      if (statusCode != null) 'StatusCode': statusCode.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updateInitiationTime != null)
        'UpdateInitiationTime': iso8601ToJson(updateInitiationTime),
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Contains the Amazon Resource Name (ARN) for a policy. Policies define what
/// operations a team that define the permissions for team resources.
///
/// @nodoc
class PolicyReference {
  /// Amazon Resource Name (ARN) for the policy.
  final String policyArn;

  PolicyReference({
    required this.policyArn,
  });

  factory PolicyReference.fromJson(Map<String, dynamic> json) {
    return PolicyReference(
      policyArn: (json['PolicyArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    return {
      'PolicyArn': policyArn,
    };
  }
}

/// Contains details for an approver.
///
/// @nodoc
class GetApprovalTeamResponseApprover {
  /// ID for the approver.
  final String? approverId;

  /// Last Activity performed by the approver.
  final ApproverLastActivity? lastActivity;

  /// Timestamp when the approver last responded to an operation or invitation
  /// request.
  final DateTime? lastActivityTime;

  /// Multi-factor authentication configuration for the approver
  final List<MfaMethod>? mfaMethods;

  /// Amazon Resource Name (ARN) for the pending baseline session.
  final String? pendingBaselineSessionArn;

  /// ID for the user.
  final String? primaryIdentityId;

  /// Amazon Resource Name (ARN) for the identity source. The identity source
  /// manages the user authentication for approvers.
  final String? primaryIdentitySourceArn;

  /// Status for the identity source. For example, if an approver has accepted a
  /// team invitation with a user authentication method managed by the identity
  /// source.
  final IdentityStatus? primaryIdentityStatus;

  /// Timestamp when the approver responded to an approval team invitation.
  final DateTime? responseTime;

  GetApprovalTeamResponseApprover({
    this.approverId,
    this.lastActivity,
    this.lastActivityTime,
    this.mfaMethods,
    this.pendingBaselineSessionArn,
    this.primaryIdentityId,
    this.primaryIdentitySourceArn,
    this.primaryIdentityStatus,
    this.responseTime,
  });

  factory GetApprovalTeamResponseApprover.fromJson(Map<String, dynamic> json) {
    return GetApprovalTeamResponseApprover(
      approverId: json['ApproverId'] as String?,
      lastActivity: (json['LastActivity'] as String?)
          ?.let(ApproverLastActivity.fromString),
      lastActivityTime: timeStampFromJson(json['LastActivityTime']),
      mfaMethods: (json['MfaMethods'] as List?)
          ?.nonNulls
          .map((e) => MfaMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingBaselineSessionArn: json['PendingBaselineSessionArn'] as String?,
      primaryIdentityId: json['PrimaryIdentityId'] as String?,
      primaryIdentitySourceArn: json['PrimaryIdentitySourceArn'] as String?,
      primaryIdentityStatus: (json['PrimaryIdentityStatus'] as String?)
          ?.let(IdentityStatus.fromString),
      responseTime: timeStampFromJson(json['ResponseTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final approverId = this.approverId;
    final lastActivity = this.lastActivity;
    final lastActivityTime = this.lastActivityTime;
    final mfaMethods = this.mfaMethods;
    final pendingBaselineSessionArn = this.pendingBaselineSessionArn;
    final primaryIdentityId = this.primaryIdentityId;
    final primaryIdentitySourceArn = this.primaryIdentitySourceArn;
    final primaryIdentityStatus = this.primaryIdentityStatus;
    final responseTime = this.responseTime;
    return {
      if (approverId != null) 'ApproverId': approverId,
      if (lastActivity != null) 'LastActivity': lastActivity.value,
      if (lastActivityTime != null)
        'LastActivityTime': iso8601ToJson(lastActivityTime),
      if (mfaMethods != null) 'MfaMethods': mfaMethods,
      if (pendingBaselineSessionArn != null)
        'PendingBaselineSessionArn': pendingBaselineSessionArn,
      if (primaryIdentityId != null) 'PrimaryIdentityId': primaryIdentityId,
      if (primaryIdentitySourceArn != null)
        'PrimaryIdentitySourceArn': primaryIdentitySourceArn,
      if (primaryIdentityStatus != null)
        'PrimaryIdentityStatus': primaryIdentityStatus.value,
      if (responseTime != null) 'ResponseTime': iso8601ToJson(responseTime),
    };
  }
}

/// @nodoc
class IdentityStatus {
  static const pending = IdentityStatus._('PENDING');
  static const accepted = IdentityStatus._('ACCEPTED');
  static const rejected = IdentityStatus._('REJECTED');
  static const invalid = IdentityStatus._('INVALID');

  final String value;

  const IdentityStatus._(this.value);

  static const values = [pending, accepted, rejected, invalid];

  static IdentityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentityStatus._(value));

  @override
  bool operator ==(other) => other is IdentityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApproverLastActivity {
  static const voted = ApproverLastActivity._('VOTED');
  static const baselined = ApproverLastActivity._('BASELINED');
  static const respondedToInvitation =
      ApproverLastActivity._('RESPONDED_TO_INVITATION');

  final String value;

  const ApproverLastActivity._(this.value);

  static const values = [voted, baselined, respondedToInvitation];

  static ApproverLastActivity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApproverLastActivity._(value));

  @override
  bool operator ==(other) =>
      other is ApproverLastActivity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// MFA configuration and sycnronization status for an approver
///
/// @nodoc
class MfaMethod {
  /// Indicates if the approver's MFA device is in-sync with the Identity Source
  final MfaSyncStatus syncStatus;

  /// The type of MFA configuration used by the approver
  final MfaType type;

  MfaMethod({
    required this.syncStatus,
    required this.type,
  });

  factory MfaMethod.fromJson(Map<String, dynamic> json) {
    return MfaMethod(
      syncStatus:
          MfaSyncStatus.fromString((json['SyncStatus'] as String?) ?? ''),
      type: MfaType.fromString((json['Type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final syncStatus = this.syncStatus;
    final type = this.type;
    return {
      'SyncStatus': syncStatus.value,
      'Type': type.value,
    };
  }
}

/// The type of MFA device used by the approver
///
/// <ul>
/// <li>
/// <code>EMAIL_OTP</code>: The approver will receive emailed one-time passwords
/// to their primary email
/// </li>
/// </ul>
///
/// @nodoc
class MfaType {
  static const emailOtp = MfaType._('EMAIL_OTP');

  final String value;

  const MfaType._(this.value);

  static const values = [emailOtp];

  static MfaType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MfaType._(value));

  @override
  bool operator ==(other) => other is MfaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Indicates if the approver's MFA device is in-sync with the Identity Source
///
/// <ul>
/// <li>
/// <code>IN_SYNC</code>: The approver's MFA device is in-sync with the Identity
/// Source
/// </li>
/// <li>
/// <code>OUT_OF_SYNC</code>: The approver's MFA device is out-of-sync with the
/// Identity Source
/// </li>
/// </ul>
///
/// @nodoc
class MfaSyncStatus {
  static const inSync = MfaSyncStatus._('IN_SYNC');
  static const outOfSync = MfaSyncStatus._('OUT_OF_SYNC');

  final String value;

  const MfaSyncStatus._(this.value);

  static const values = [inSync, outOfSync];

  static MfaSyncStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MfaSyncStatus._(value));

  @override
  bool operator ==(other) => other is MfaSyncStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a policy for a resource.
///
/// @nodoc
class ListResourcePoliciesResponseResourcePolicy {
  /// Amazon Resource Name (ARN) for policy.
  final String? policyArn;

  /// Name of the policy.
  final String? policyName;

  /// The type of policy.
  final PolicyType? policyType;

  ListResourcePoliciesResponseResourcePolicy({
    this.policyArn,
    this.policyName,
    this.policyType,
  });

  factory ListResourcePoliciesResponseResourcePolicy.fromJson(
      Map<String, dynamic> json) {
    return ListResourcePoliciesResponseResourcePolicy(
      policyArn: json['PolicyArn'] as String?,
      policyName: json['PolicyName'] as String?,
      policyType: (json['PolicyType'] as String?)?.let(PolicyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    final policyType = this.policyType;
    return {
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyName != null) 'PolicyName': policyName,
      if (policyType != null) 'PolicyType': policyType.value,
    };
  }
}

/// @nodoc
class PolicyType {
  static const awsManaged = PolicyType._('AWS_MANAGED');
  static const awsRam = PolicyType._('AWS_RAM');

  final String value;

  const PolicyType._(this.value);

  static const values = [awsManaged, awsRam];

  static PolicyType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PolicyType._(value));

  @override
  bool operator ==(other) => other is PolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for the version of a policy. Policies define what
/// operations a team that define the permissions for team resources.
///
/// @nodoc
class PolicyVersionSummary {
  /// Amazon Resource Name (ARN) for the team.
  final String arn;

  /// Timestamp when the policy was created.
  final DateTime creationTime;

  /// Determines if the specified policy is the default for the team.
  final bool isDefault;

  /// Timestamp when the policy was last updated.
  final DateTime lastUpdatedTime;

  /// Name of the policy
  final String name;

  /// Amazon Resource Name (ARN) for the policy.
  final String policyArn;

  /// The type of policy.
  final PolicyType policyType;

  /// Status for the policy. For example, if the policy is <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_attach-policy.html">attachable</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-deprecated.html">deprecated</a>.
  final PolicyStatus status;

  /// Version ID for the policy.
  final int versionId;

  PolicyVersionSummary({
    required this.arn,
    required this.creationTime,
    required this.isDefault,
    required this.lastUpdatedTime,
    required this.name,
    required this.policyArn,
    required this.policyType,
    required this.status,
    required this.versionId,
  });

  factory PolicyVersionSummary.fromJson(Map<String, dynamic> json) {
    return PolicyVersionSummary(
      arn: (json['Arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      isDefault: (json['IsDefault'] as bool?) ?? false,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
      policyArn: (json['PolicyArn'] as String?) ?? '',
      policyType: PolicyType.fromString((json['PolicyType'] as String?) ?? ''),
      status: PolicyStatus.fromString((json['Status'] as String?) ?? ''),
      versionId: (json['VersionId'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final isDefault = this.isDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final policyArn = this.policyArn;
    final policyType = this.policyType;
    final status = this.status;
    final versionId = this.versionId;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'IsDefault': isDefault,
      'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'Name': name,
      'PolicyArn': policyArn,
      'PolicyType': policyType.value,
      'Status': status.value,
      'VersionId': versionId,
    };
  }
}

/// @nodoc
class PolicyStatus {
  static const attachable = PolicyStatus._('ATTACHABLE');
  static const deprecated = PolicyStatus._('DEPRECATED');

  final String value;

  const PolicyStatus._(this.value);

  static const values = [attachable, deprecated];

  static PolicyStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PolicyStatus._(value));

  @override
  bool operator ==(other) => other is PolicyStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for a policy. Policies define what operations a team that
/// define the permissions for team resources.
///
/// @nodoc
class Policy {
  /// Amazon Resource Name (ARN) for the policy.
  final String arn;

  /// Determines if the specified policy is the default for the team.
  final int defaultVersion;

  /// Name of the policy.
  final String name;

  /// The type of policy.
  final PolicyType policyType;

  Policy({
    required this.arn,
    required this.defaultVersion,
    required this.name,
    required this.policyType,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      arn: (json['Arn'] as String?) ?? '',
      defaultVersion: (json['DefaultVersion'] as int?) ?? 0,
      name: (json['Name'] as String?) ?? '',
      policyType: PolicyType.fromString((json['PolicyType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final defaultVersion = this.defaultVersion;
    final name = this.name;
    final policyType = this.policyType;
    return {
      'Arn': arn,
      'DefaultVersion': defaultVersion,
      'Name': name,
      'PolicyType': policyType.value,
    };
  }
}

/// Contains details for the version of a policy. Policies define what
/// operations a team that define the permissions for team resources.
///
/// @nodoc
class PolicyVersion {
  /// Amazon Resource Name (ARN) for the team.
  final String arn;

  /// Timestamp when the policy was created.
  final DateTime creationTime;

  /// Document that contains the policy contents.
  final String document;

  /// Determines if the specified policy is the default for the team.
  final bool isDefault;

  /// Timestamp when the policy was last updated.
  final DateTime lastUpdatedTime;

  /// Name of the policy.
  final String name;

  /// Amazon Resource Name (ARN) for the policy.
  final String policyArn;

  /// The type of policy.
  final PolicyType policyType;

  /// Status for the policy. For example, if the policy is <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_attach-policy.html">attachable</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-deprecated.html">deprecated</a>.
  final PolicyStatus status;

  /// Verison ID
  final int versionId;

  PolicyVersion({
    required this.arn,
    required this.creationTime,
    required this.document,
    required this.isDefault,
    required this.lastUpdatedTime,
    required this.name,
    required this.policyArn,
    required this.policyType,
    required this.status,
    required this.versionId,
  });

  factory PolicyVersion.fromJson(Map<String, dynamic> json) {
    return PolicyVersion(
      arn: (json['Arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      document: (json['Document'] as String?) ?? '',
      isDefault: (json['IsDefault'] as bool?) ?? false,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
      policyArn: (json['PolicyArn'] as String?) ?? '',
      policyType: PolicyType.fromString((json['PolicyType'] as String?) ?? ''),
      status: PolicyStatus.fromString((json['Status'] as String?) ?? ''),
      versionId: (json['VersionId'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final document = this.document;
    final isDefault = this.isDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final policyArn = this.policyArn;
    final policyType = this.policyType;
    final status = this.status;
    final versionId = this.versionId;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'Document': document,
      'IsDefault': isDefault,
      'LastUpdatedTime': iso8601ToJson(lastUpdatedTime),
      'Name': name,
      'PolicyArn': policyArn,
      'PolicyType': policyType.value,
      'Status': status.value,
      'VersionId': versionId,
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
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
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
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
