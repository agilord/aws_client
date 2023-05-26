// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Detective uses machine learning and purpose-built visualizations to help you
/// to analyze and investigate security issues across your Amazon Web Services
/// (Amazon Web Services) workloads. Detective automatically extracts time-based
/// events such as login attempts, API calls, and network traffic from
/// CloudTrail and Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also
/// extracts findings detected by Amazon GuardDuty.
///
/// The Detective API primarily supports the creation and management of behavior
/// graphs. A behavior graph contains the extracted data from a set of member
/// accounts, and is created and managed by an administrator account.
///
/// To add a member account to the behavior graph, the administrator account
/// sends an invitation to the account. When the account accepts the invitation,
/// it becomes a member account in the behavior graph.
///
/// Detective is also integrated with Organizations. The organization management
/// account designates the Detective administrator account for the organization.
/// That account becomes the administrator account for the organization behavior
/// graph. The Detective administrator account is also the delegated
/// administrator account for Detective in Organizations.
///
/// The Detective administrator account can enable any organization account as a
/// member account in the organization behavior graph. The organization accounts
/// do not receive invitations. The Detective administrator account can also
/// invite other accounts to the organization behavior graph.
///
/// Every behavior graph is specific to a Region. You can only use the API to
/// manage behavior graphs that belong to the Region that is associated with the
/// currently selected endpoint.
///
/// The administrator account for a behavior graph can use the Detective API to
/// do the following:
///
/// <ul>
/// <li>
/// Enable and disable Detective. Enabling Detective creates a new behavior
/// graph.
/// </li>
/// <li>
/// View the list of member accounts in a behavior graph.
/// </li>
/// <li>
/// Add member accounts to a behavior graph.
/// </li>
/// <li>
/// Remove member accounts from a behavior graph.
/// </li>
/// <li>
/// Apply tags to a behavior graph.
/// </li>
/// </ul>
/// The organization management account can use the Detective API to select the
/// delegated administrator for Detective.
///
/// The Detective administrator account for an organization can use the
/// Detective API to do the following:
///
/// <ul>
/// <li>
/// Perform all of the functions of an administrator account.
/// </li>
/// <li>
/// Determine whether to automatically enable new organization accounts as
/// member accounts in the organization behavior graph.
/// </li>
/// </ul>
/// An invited member account can use the Detective API to do the following:
///
/// <ul>
/// <li>
/// View the list of behavior graphs that they are invited to.
/// </li>
/// <li>
/// Accept an invitation to contribute to a behavior graph.
/// </li>
/// <li>
/// Decline an invitation to contribute to a behavior graph.
/// </li>
/// <li>
/// Remove their account from a behavior graph.
/// </li>
/// </ul>
/// All API actions are logged as CloudTrail events. See <a
/// href="https://docs.aws.amazon.com/detective/latest/adminguide/logging-using-cloudtrail.html">Logging
/// Detective API Calls with CloudTrail</a>.
/// <note>
/// We replaced the term "master account" with the term "administrator account."
/// An administrator account is used to centrally manage multiple accounts. In
/// the case of Detective, the administrator account manages the accounts in
/// their behavior graph.
/// </note>
class Detective {
  final _s.RestJsonProtocol _protocol;
  Detective({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.detective',
            signingName: 'detective',
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

  /// Accepts an invitation for the member account to contribute data to a
  /// behavior graph. This operation can only be called by an invited member
  /// account.
  ///
  /// The request provides the ARN of behavior graph.
  ///
  /// The member account status in the graph must be <code>INVITED</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph that the member account is accepting the
  /// invitation for.
  ///
  /// The member account status in the behavior graph must be
  /// <code>INVITED</code>.
  Future<void> acceptInvitation({
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/invitation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets data source package information for the behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of Amazon Web Services accounts to get data source package
  /// information on.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph.
  Future<BatchGetGraphMemberDatasourcesResponse>
      batchGetGraphMemberDatasources({
    required List<String> accountIds,
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'GraphArn': graphArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/datasources/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetGraphMemberDatasourcesResponse.fromJson(response);
  }

  /// Gets information on the data source package history for an account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArns] :
  /// The ARN of the behavior graph.
  Future<BatchGetMembershipDatasourcesResponse> batchGetMembershipDatasources({
    required List<String> graphArns,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArns': graphArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/membership/datasources/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetMembershipDatasourcesResponse.fromJson(response);
  }

  /// Creates a new behavior graph for the calling account, and sets that
  /// account as the administrator account. This operation is called by the
  /// account that is enabling Detective.
  ///
  /// Before you try to enable Detective, make sure that your account has been
  /// enrolled in Amazon GuardDuty for at least 48 hours. If you do not meet
  /// this requirement, you cannot enable Detective. If you do meet the
  /// GuardDuty prerequisite, then when you make the request to enable
  /// Detective, it checks whether your data volume is within the Detective
  /// quota. If it exceeds the quota, then you cannot enable Detective.
  ///
  /// The operation also enables Detective for the calling account in the
  /// currently selected Region. It returns the ARN of the new behavior graph.
  ///
  /// <code>CreateGraph</code> triggers a process to create the corresponding
  /// data tables for the new behavior graph.
  ///
  /// An account can only be the administrator account for one behavior graph
  /// within a Region. If the same account calls <code>CreateGraph</code> with
  /// the same administrator account, it always returns the same behavior graph
  /// ARN. It does not create a new behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [tags] :
  /// The tags to assign to the new behavior graph. You can add up to 50 tags.
  /// For each tag, you provide the tag key and the tag value. Each tag key can
  /// contain up to 128 characters. Each tag value can contain up to 256
  /// characters.
  Future<CreateGraphResponse> createGraph({
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphResponse.fromJson(response);
  }

  /// <code>CreateMembers</code> is used to send invitations to accounts. For
  /// the organization behavior graph, the Detective administrator account uses
  /// <code>CreateMembers</code> to enable organization accounts as member
  /// accounts.
  ///
  /// For invited accounts, <code>CreateMembers</code> sends a request to invite
  /// the specified Amazon Web Services accounts to be member accounts in the
  /// behavior graph. This operation can only be called by the administrator
  /// account for a behavior graph.
  ///
  /// <code>CreateMembers</code> verifies the accounts and then invites the
  /// verified accounts. The administrator can optionally specify to not send
  /// invitation emails to the member accounts. This would be used when the
  /// administrator manages their member accounts centrally.
  ///
  /// For organization accounts in the organization behavior graph,
  /// <code>CreateMembers</code> attempts to enable the accounts. The
  /// organization accounts do not receive invitations.
  ///
  /// The request provides the behavior graph ARN and the list of accounts to
  /// invite or to enable.
  ///
  /// The response separates the requested accounts into two lists:
  ///
  /// <ul>
  /// <li>
  /// The accounts that <code>CreateMembers</code> was able to process. For
  /// invited accounts, includes member accounts that are being verified, that
  /// have passed verification and are to be invited, and that have failed
  /// verification. For organization accounts in the organization behavior
  /// graph, includes accounts that can be enabled and that cannot be enabled.
  /// </li>
  /// <li>
  /// The accounts that <code>CreateMembers</code> was unable to process. This
  /// list includes accounts that were already invited to be member accounts in
  /// the behavior graph.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [accounts] :
  /// The list of Amazon Web Services accounts to invite or to enable. You can
  /// invite or enable up to 50 accounts at a time. For each invited account,
  /// the account list contains the account identifier and the Amazon Web
  /// Services account root user email address. For organization accounts in the
  /// organization behavior graph, the email address is not required.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph.
  ///
  /// Parameter [disableEmailNotification] :
  /// if set to <code>true</code>, then the invited accounts do not receive
  /// email notifications. By default, this is set to <code>false</code>, and
  /// the invited accounts receive email notifications.
  ///
  /// Organization accounts in the organization behavior graph do not receive
  /// email notifications.
  ///
  /// Parameter [message] :
  /// Customized message text to include in the invitation email message to the
  /// invited member accounts.
  Future<CreateMembersResponse> createMembers({
    required List<Account> accounts,
    required String graphArn,
    bool? disableEmailNotification,
    String? message,
  }) async {
    final $payload = <String, dynamic>{
      'Accounts': accounts,
      'GraphArn': graphArn,
      if (disableEmailNotification != null)
        'DisableEmailNotification': disableEmailNotification,
      if (message != null) 'Message': message,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/members',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembersResponse.fromJson(response);
  }

  /// Disables the specified behavior graph and queues it to be deleted. This
  /// operation removes the behavior graph from each member account's list of
  /// behavior graphs.
  ///
  /// <code>DeleteGraph</code> can only be called by the administrator account
  /// for a behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to disable.
  Future<void> deleteGraph({
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified member accounts from the behavior graph. The removed
  /// accounts no longer contribute data to the behavior graph. This operation
  /// can only be called by the administrator account for the behavior graph.
  ///
  /// For invited accounts, the removed accounts are deleted from the list of
  /// accounts in the behavior graph. To restore the account, the administrator
  /// account must send another invitation.
  ///
  /// For organization accounts in the organization behavior graph, the
  /// Detective administrator account can always enable the organization account
  /// again. Organization accounts that are not enabled as member accounts are
  /// not included in the <code>ListMembers</code> results for the organization
  /// behavior graph.
  ///
  /// An administrator account cannot use <code>DeleteMembers</code> to remove
  /// their own account from the behavior graph. To disable a behavior graph,
  /// the administrator account uses the <code>DeleteGraph</code> API method.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of Amazon Web Services account identifiers for the member
  /// accounts to remove from the behavior graph. You can remove up to 50 member
  /// accounts at a time.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to remove members from.
  Future<DeleteMembersResponse> deleteMembers({
    required List<String> accountIds,
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'GraphArn': graphArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/members/removal',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMembersResponse.fromJson(response);
  }

  /// Returns information about the configuration for the organization behavior
  /// graph. Currently indicates whether to automatically enable new
  /// organization accounts as member accounts.
  ///
  /// Can only be called by the Detective administrator account for the
  /// organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the organization behavior graph.
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration({
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/orgs/describeOrganizationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Removes the Detective administrator account in the current Region. Deletes
  /// the organization behavior graph.
  ///
  /// Can only be called by the organization management account.
  ///
  /// Removing the Detective administrator account does not affect the delegated
  /// administrator account for Detective in Organizations.
  ///
  /// To remove the delegated administrator account in Organizations, use the
  /// Organizations API. Removing the delegated administrator account also
  /// removes the Detective administrator account in all Regions, except for
  /// Regions where the Detective administrator account is the organization
  /// management account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  Future<void> disableOrganizationAdminAccount() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/orgs/disableAdminAccount',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the member account from the specified behavior graph. This
  /// operation can only be called by an invited member account that has the
  /// <code>ENABLED</code> status.
  ///
  /// <code>DisassociateMembership</code> cannot be called by an organization
  /// account in the organization behavior graph. For the organization behavior
  /// graph, the Detective administrator account determines which organization
  /// accounts to enable or disable as member accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to remove the member account from.
  ///
  /// The member account's member status in the behavior graph must be
  /// <code>ENABLED</code>.
  Future<void> disassociateMembership({
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/membership/removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Designates the Detective administrator account for the organization in the
  /// current Region.
  ///
  /// If the account does not have Detective enabled, then enables Detective for
  /// that account and creates a new behavior graph.
  ///
  /// Can only be called by the organization management account.
  ///
  /// If the organization has a delegated administrator account in
  /// Organizations, then the Detective administrator account must be either the
  /// delegated administrator account or the organization management account.
  ///
  /// If the organization does not have a delegated administrator account in
  /// Organizations, then you can choose any account in the organization. If you
  /// choose an account other than the organization management account,
  /// Detective calls Organizations to make that account the delegated
  /// administrator account for Detective. The organization management account
  /// cannot be the delegated administrator account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account identifier of the account to designate as
  /// the Detective administrator account for the organization.
  Future<void> enableOrganizationAdminAccount({
    required String accountId,
  }) async {
    final $payload = <String, dynamic>{
      'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/orgs/enableAdminAccount',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the membership details for specified member accounts for a
  /// behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of Amazon Web Services account identifiers for the member account
  /// for which to return member details. You can request details for up to 50
  /// member accounts at a time.
  ///
  /// You cannot use <code>GetMembers</code> to retrieve information about
  /// member accounts that were removed from the behavior graph.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph for which to request the member details.
  Future<GetMembersResponse> getMembers({
    required List<String> accountIds,
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'GraphArn': graphArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/members/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetMembersResponse.fromJson(response);
  }

  /// Lists data source packages in the behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// For requests to get the next page of results, the pagination token that
  /// was returned with the previous set of results. The initial request does
  /// not include a pagination token.
  Future<ListDatasourcePackagesResponse> listDatasourcePackages({
    required String graphArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/datasources/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasourcePackagesResponse.fromJson(response);
  }

  /// Returns the list of behavior graphs that the calling account is an
  /// administrator account of. This operation can only be called by an
  /// administrator account.
  ///
  /// Because an account can currently only be the administrator of one behavior
  /// graph within a Region, the results always contain a single behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of graphs to return at a time. The total must be less
  /// than the overall limit on the number of results to return, which is
  /// currently 200.
  ///
  /// Parameter [nextToken] :
  /// For requests to get the next page of results, the pagination token that
  /// was returned with the previous set of results. The initial request does
  /// not include a pagination token.
  Future<ListGraphsResponse> listGraphs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graphs/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListGraphsResponse.fromJson(response);
  }

  /// Retrieves the list of open and accepted behavior graph invitations for the
  /// member account. This operation can only be called by an invited member
  /// account.
  ///
  /// Open invitations are invitations that the member account has not responded
  /// to.
  ///
  /// The results do not include behavior graphs for which the member account
  /// declined the invitation. The results also do not include behavior graphs
  /// that the member account resigned from or was removed from.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of behavior graph invitations to return in the
  /// response. The total must be less than the overall limit on the number of
  /// results to return, which is currently 200.
  ///
  /// Parameter [nextToken] :
  /// For requests to retrieve the next page of results, the pagination token
  /// that was returned with the previous page of results. The initial request
  /// does not include a pagination token.
  Future<ListInvitationsResponse> listInvitations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Retrieves the list of member accounts for a behavior graph.
  ///
  /// For invited accounts, the results do not include member accounts that were
  /// removed from the behavior graph.
  ///
  /// For the organization behavior graph, the results do not include
  /// organization accounts that the Detective administrator account has not
  /// enabled as member accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph for which to retrieve the list of member
  /// accounts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of member accounts to include in the response. The
  /// total must be less than the overall limit on the number of results to
  /// return, which is currently 200.
  ///
  /// Parameter [nextToken] :
  /// For requests to retrieve the next page of member account results, the
  /// pagination token that was returned with the previous page of results. The
  /// initial request does not include a pagination token.
  Future<ListMembersResponse> listMembers({
    required String graphArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/members/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Returns information about the Detective administrator account for an
  /// organization. Can only be called by the organization management account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// For requests to get the next page of results, the pagination token that
  /// was returned with the previous set of results. The initial request does
  /// not include a pagination token.
  Future<ListOrganizationAdminAccountsResponse> listOrganizationAdminAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/orgs/adminAccountslist',
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationAdminAccountsResponse.fromJson(response);
  }

  /// Returns the tag values that are assigned to a behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the behavior graph for which to retrieve the tag values.
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

  /// Rejects an invitation to contribute the account data to a behavior graph.
  /// This operation must be called by an invited member account that has the
  /// <code>INVITED</code> status.
  ///
  /// <code>RejectInvitation</code> cannot be called by an organization account
  /// in the organization behavior graph. In the organization behavior graph,
  /// organization accounts do not receive an invitation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to reject the invitation to.
  ///
  /// The member account's current member status in the behavior graph must be
  /// <code>INVITED</code>.
  Future<void> rejectInvitation({
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitation/removal',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends a request to enable data ingest for a member account that has a
  /// status of <code>ACCEPTED_BUT_DISABLED</code>.
  ///
  /// For valid member accounts, the status is updated as follows.
  ///
  /// <ul>
  /// <li>
  /// If Detective enabled the member account, then the new status is
  /// <code>ENABLED</code>.
  /// </li>
  /// <li>
  /// If Detective cannot enable the member account, the status remains
  /// <code>ACCEPTED_BUT_DISABLED</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The account ID of the member account to try to enable.
  ///
  /// The account must be an invited member account with a status of
  /// <code>ACCEPTED_BUT_DISABLED</code>.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph.
  Future<void> startMonitoringMember({
    required String accountId,
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountId': accountId,
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/member/monitoringstate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies tag values to a behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the behavior graph to assign the tags to.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the behavior graph. You can add up to 50 tags. For
  /// each tag, you provide the tag key and the tag value. Each tag key can
  /// contain up to 128 characters. Each tag value can contain up to 256
  /// characters.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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

  /// Removes tags from a behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the behavior graph to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the tags to remove from the behavior graph. You can remove
  /// up to 50 tags at a time.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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

  /// Starts a data source packages for the behavior graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datasourcePackages] :
  /// The data source package start for the behavior graph.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph.
  Future<void> updateDatasourcePackages({
    required List<DatasourcePackage> datasourcePackages,
    required String graphArn,
  }) async {
    final $payload = <String, dynamic>{
      'DatasourcePackages': datasourcePackages.map((e) => e.toValue()).toList(),
      'GraphArn': graphArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graph/datasources/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration for the Organizations integration in the current
  /// Region. Can only be called by the Detective administrator account for the
  /// organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the organization behavior graph.
  ///
  /// Parameter [autoEnable] :
  /// Indicates whether to automatically enable new organization accounts as
  /// member accounts in the organization behavior graph.
  Future<void> updateOrganizationConfiguration({
    required String graphArn,
    bool? autoEnable,
  }) async {
    final $payload = <String, dynamic>{
      'GraphArn': graphArn,
      if (autoEnable != null) 'AutoEnable': autoEnable,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/orgs/updateOrganizationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An Amazon Web Services account that is the administrator account of or a
/// member of a behavior graph.
class Account {
  /// The account identifier of the Amazon Web Services account.
  final String accountId;

  /// The Amazon Web Services account root user email address for the Amazon Web
  /// Services account.
  final String emailAddress;

  Account({
    required this.accountId,
    required this.emailAddress,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final emailAddress = this.emailAddress;
    return {
      'AccountId': accountId,
      'EmailAddress': emailAddress,
    };
  }
}

/// Information about the Detective administrator account for an organization.
class Administrator {
  /// The Amazon Web Services account identifier of the Detective administrator
  /// account for the organization.
  final String? accountId;

  /// The date and time when the Detective administrator account was enabled. The
  /// value is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? delegationTime;

  /// The ARN of the organization behavior graph.
  final String? graphArn;

  Administrator({
    this.accountId,
    this.delegationTime,
    this.graphArn,
  });

  factory Administrator.fromJson(Map<String, dynamic> json) {
    return Administrator(
      accountId: json['AccountId'] as String?,
      delegationTime: timeStampFromJson(json['DelegationTime']),
      graphArn: json['GraphArn'] as String?,
    );
  }
}

class BatchGetGraphMemberDatasourcesResponse {
  /// Details on the status of data source packages for members of the behavior
  /// graph.
  final List<MembershipDatasources>? memberDatasources;

  /// Accounts that data source package information could not be retrieved for.
  final List<UnprocessedAccount>? unprocessedAccounts;

  BatchGetGraphMemberDatasourcesResponse({
    this.memberDatasources,
    this.unprocessedAccounts,
  });

  factory BatchGetGraphMemberDatasourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetGraphMemberDatasourcesResponse(
      memberDatasources: (json['MemberDatasources'] as List?)
          ?.whereNotNull()
          .map((e) => MembershipDatasources.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchGetMembershipDatasourcesResponse {
  /// Details on the data source package history for an member of the behavior
  /// graph.
  final List<MembershipDatasources>? membershipDatasources;

  /// Graphs that data source package information could not be retrieved for.
  final List<UnprocessedGraph>? unprocessedGraphs;

  BatchGetMembershipDatasourcesResponse({
    this.membershipDatasources,
    this.unprocessedGraphs,
  });

  factory BatchGetMembershipDatasourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetMembershipDatasourcesResponse(
      membershipDatasources: (json['MembershipDatasources'] as List?)
          ?.whereNotNull()
          .map((e) => MembershipDatasources.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedGraphs: (json['UnprocessedGraphs'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedGraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CreateGraphResponse {
  /// The ARN of the new behavior graph.
  final String? graphArn;

  CreateGraphResponse({
    this.graphArn,
  });

  factory CreateGraphResponse.fromJson(Map<String, dynamic> json) {
    return CreateGraphResponse(
      graphArn: json['GraphArn'] as String?,
    );
  }
}

class CreateMembersResponse {
  /// The set of member account invitation or enablement requests that Detective
  /// was able to process. This includes accounts that are being verified, that
  /// failed verification, and that passed verification and are being sent an
  /// invitation or are being enabled.
  final List<MemberDetail>? members;

  /// The list of accounts for which Detective was unable to process the
  /// invitation or enablement request. For each account, the list provides the
  /// reason why the request could not be processed. The list includes accounts
  /// that are already member accounts in the behavior graph.
  final List<UnprocessedAccount>? unprocessedAccounts;

  CreateMembersResponse({
    this.members,
    this.unprocessedAccounts,
  });

  factory CreateMembersResponse.fromJson(Map<String, dynamic> json) {
    return CreateMembersResponse(
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum DatasourcePackage {
  detectiveCore,
  eksAudit,
  asffSecurityhubFinding,
}

extension DatasourcePackageValueExtension on DatasourcePackage {
  String toValue() {
    switch (this) {
      case DatasourcePackage.detectiveCore:
        return 'DETECTIVE_CORE';
      case DatasourcePackage.eksAudit:
        return 'EKS_AUDIT';
      case DatasourcePackage.asffSecurityhubFinding:
        return 'ASFF_SECURITYHUB_FINDING';
    }
  }
}

extension DatasourcePackageFromString on String {
  DatasourcePackage toDatasourcePackage() {
    switch (this) {
      case 'DETECTIVE_CORE':
        return DatasourcePackage.detectiveCore;
      case 'EKS_AUDIT':
        return DatasourcePackage.eksAudit;
      case 'ASFF_SECURITYHUB_FINDING':
        return DatasourcePackage.asffSecurityhubFinding;
    }
    throw Exception('$this is not known in enum DatasourcePackage');
  }
}

/// Details about the data source packages ingested by your behavior graph.
class DatasourcePackageIngestDetail {
  /// Details on which data source packages are ingested for a member account.
  final DatasourcePackageIngestState? datasourcePackageIngestState;

  /// The date a data source package was enabled for this account
  final Map<DatasourcePackageIngestState, TimestampForCollection>?
      lastIngestStateChange;

  DatasourcePackageIngestDetail({
    this.datasourcePackageIngestState,
    this.lastIngestStateChange,
  });

  factory DatasourcePackageIngestDetail.fromJson(Map<String, dynamic> json) {
    return DatasourcePackageIngestDetail(
      datasourcePackageIngestState:
          (json['DatasourcePackageIngestState'] as String?)
              ?.toDatasourcePackageIngestState(),
      lastIngestStateChange:
          (json['LastIngestStateChange'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k.toDatasourcePackageIngestState(),
                  TimestampForCollection.fromJson(e as Map<String, dynamic>))),
    );
  }
}

enum DatasourcePackageIngestState {
  started,
  stopped,
  disabled,
}

extension DatasourcePackageIngestStateValueExtension
    on DatasourcePackageIngestState {
  String toValue() {
    switch (this) {
      case DatasourcePackageIngestState.started:
        return 'STARTED';
      case DatasourcePackageIngestState.stopped:
        return 'STOPPED';
      case DatasourcePackageIngestState.disabled:
        return 'DISABLED';
    }
  }
}

extension DatasourcePackageIngestStateFromString on String {
  DatasourcePackageIngestState toDatasourcePackageIngestState() {
    switch (this) {
      case 'STARTED':
        return DatasourcePackageIngestState.started;
      case 'STOPPED':
        return DatasourcePackageIngestState.stopped;
      case 'DISABLED':
        return DatasourcePackageIngestState.disabled;
    }
    throw Exception('$this is not known in enum DatasourcePackageIngestState');
  }
}

/// Information on the usage of a data source package in the behavior graph.
class DatasourcePackageUsageInfo {
  /// Total volume of data in bytes per day ingested for a given data source
  /// package.
  final int? volumeUsageInBytes;

  /// The data and time when the member account data volume was last updated. The
  /// value is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? volumeUsageUpdateTime;

  DatasourcePackageUsageInfo({
    this.volumeUsageInBytes,
    this.volumeUsageUpdateTime,
  });

  factory DatasourcePackageUsageInfo.fromJson(Map<String, dynamic> json) {
    return DatasourcePackageUsageInfo(
      volumeUsageInBytes: json['VolumeUsageInBytes'] as int?,
      volumeUsageUpdateTime: timeStampFromJson(json['VolumeUsageUpdateTime']),
    );
  }
}

class DeleteMembersResponse {
  /// The list of Amazon Web Services account identifiers for the member accounts
  /// that Detective successfully removed from the behavior graph.
  final List<String>? accountIds;

  /// The list of member accounts that Detective was not able to remove from the
  /// behavior graph. For each member account, provides the reason that the
  /// deletion could not be processed.
  final List<UnprocessedAccount>? unprocessedAccounts;

  DeleteMembersResponse({
    this.accountIds,
    this.unprocessedAccounts,
  });

  factory DeleteMembersResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMembersResponse(
      accountIds: (json['AccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeOrganizationConfigurationResponse {
  /// Indicates whether to automatically enable new organization accounts as
  /// member accounts in the organization behavior graph.
  final bool? autoEnable;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      autoEnable: json['AutoEnable'] as bool?,
    );
  }
}

class GetMembersResponse {
  /// The member account details that Detective is returning in response to the
  /// request.
  final List<MemberDetail>? memberDetails;

  /// The requested member accounts for which Detective was unable to return
  /// member details.
  ///
  /// For each account, provides the reason why the request could not be
  /// processed.
  final List<UnprocessedAccount>? unprocessedAccounts;

  GetMembersResponse({
    this.memberDetails,
    this.unprocessedAccounts,
  });

  factory GetMembersResponse.fromJson(Map<String, dynamic> json) {
    return GetMembersResponse(
      memberDetails: (json['MemberDetails'] as List?)
          ?.whereNotNull()
          .map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['UnprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A behavior graph in Detective.
class Graph {
  /// The ARN of the behavior graph.
  final String? arn;

  /// The date and time that the behavior graph was created. The value is an
  /// ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? createdTime;

  Graph({
    this.arn,
    this.createdTime,
  });

  factory Graph.fromJson(Map<String, dynamic> json) {
    return Graph(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
    );
  }
}

enum InvitationType {
  invitation,
  organization,
}

extension InvitationTypeValueExtension on InvitationType {
  String toValue() {
    switch (this) {
      case InvitationType.invitation:
        return 'INVITATION';
      case InvitationType.organization:
        return 'ORGANIZATION';
    }
  }
}

extension InvitationTypeFromString on String {
  InvitationType toInvitationType() {
    switch (this) {
      case 'INVITATION':
        return InvitationType.invitation;
      case 'ORGANIZATION':
        return InvitationType.organization;
    }
    throw Exception('$this is not known in enum InvitationType');
  }
}

class ListDatasourcePackagesResponse {
  /// Details on the data source packages active in the behavior graph.
  final Map<DatasourcePackage, DatasourcePackageIngestDetail>?
      datasourcePackages;

  /// For requests to get the next page of results, the pagination token that was
  /// returned with the previous set of results. The initial request does not
  /// include a pagination token.
  final String? nextToken;

  ListDatasourcePackagesResponse({
    this.datasourcePackages,
    this.nextToken,
  });

  factory ListDatasourcePackagesResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasourcePackagesResponse(
      datasourcePackages: (json['DatasourcePackages'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k.toDatasourcePackage(),
              DatasourcePackageIngestDetail.fromJson(
                  e as Map<String, dynamic>))),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListGraphsResponse {
  /// A list of behavior graphs that the account is an administrator account for.
  final List<Graph>? graphList;

  /// If there are more behavior graphs remaining in the results, then this is the
  /// pagination token to use to request the next page of behavior graphs.
  final String? nextToken;

  ListGraphsResponse({
    this.graphList,
    this.nextToken,
  });

  factory ListGraphsResponse.fromJson(Map<String, dynamic> json) {
    return ListGraphsResponse(
      graphList: (json['GraphList'] as List?)
          ?.whereNotNull()
          .map((e) => Graph.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListInvitationsResponse {
  /// The list of behavior graphs for which the member account has open or
  /// accepted invitations.
  final List<MemberDetail>? invitations;

  /// If there are more behavior graphs remaining in the results, then this is the
  /// pagination token to use to request the next page of behavior graphs.
  final String? nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });

  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvitationsResponse(
      invitations: (json['Invitations'] as List?)
          ?.whereNotNull()
          .map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListMembersResponse {
  /// The list of member accounts in the behavior graph.
  ///
  /// For invited accounts, the results include member accounts that did not pass
  /// verification and member accounts that have not yet accepted the invitation
  /// to the behavior graph. The results do not include member accounts that were
  /// removed from the behavior graph.
  ///
  /// For the organization behavior graph, the results do not include organization
  /// accounts that the Detective administrator account has not enabled as member
  /// accounts.
  final List<MemberDetail>? memberDetails;

  /// If there are more member accounts remaining in the results, then use this
  /// pagination token to request the next page of member accounts.
  final String? nextToken;

  ListMembersResponse({
    this.memberDetails,
    this.nextToken,
  });

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersResponse(
      memberDetails: (json['MemberDetails'] as List?)
          ?.whereNotNull()
          .map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListOrganizationAdminAccountsResponse {
  /// The list of Detective administrator accounts.
  final List<Administrator>? administrators;

  /// If there are more accounts remaining in the results, then this is the
  /// pagination token to use to request the next page of accounts.
  final String? nextToken;

  ListOrganizationAdminAccountsResponse({
    this.administrators,
    this.nextToken,
  });

  factory ListOrganizationAdminAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationAdminAccountsResponse(
      administrators: (json['Administrators'] as List?)
          ?.whereNotNull()
          .map((e) => Administrator.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// The tag values that are assigned to the behavior graph. The request returns
  /// up to 50 tag values.
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
}

/// Details about a member account in a behavior graph.
class MemberDetail {
  /// The Amazon Web Services account identifier for the member account.
  final String? accountId;

  /// The Amazon Web Services account identifier of the administrator account for
  /// the behavior graph.
  final String? administratorId;

  /// The state of a data source package for the behavior graph.
  final Map<DatasourcePackage, DatasourcePackageIngestState>?
      datasourcePackageIngestStates;

  /// For member accounts with a status of <code>ACCEPTED_BUT_DISABLED</code>, the
  /// reason that the member account is not enabled.
  ///
  /// The reason can have one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>VOLUME_TOO_HIGH</code> - Indicates that adding the member account
  /// would cause the data volume for the behavior graph to be too high.
  /// </li>
  /// <li>
  /// <code>VOLUME_UNKNOWN</code> - Indicates that Detective is unable to verify
  /// the data volume for the member account. This is usually because the member
  /// account is not enrolled in Amazon GuardDuty.
  /// </li>
  /// </ul>
  final MemberDisabledReason? disabledReason;

  /// The Amazon Web Services account root user email address for the member
  /// account.
  final String? emailAddress;

  /// The ARN of the behavior graph.
  final String? graphArn;

  /// The type of behavior graph membership.
  ///
  /// For an organization account in the organization behavior graph, the type is
  /// <code>ORGANIZATION</code>.
  ///
  /// For an account that was invited to a behavior graph, the type is
  /// <code>INVITATION</code>.
  final InvitationType? invitationType;

  /// For invited accounts, the date and time that Detective sent the invitation
  /// to the account. The value is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? invitedTime;

  /// The Amazon Web Services account identifier of the administrator account for
  /// the behavior graph.
  final String? masterId;

  /// The member account data volume as a percentage of the maximum allowed data
  /// volume. 0 indicates 0 percent, and 100 indicates 100 percent.
  ///
  /// Note that this is not the percentage of the behavior graph data volume.
  ///
  /// For example, the data volume for the behavior graph is 80 GB per day. The
  /// maximum data volume is 160 GB per day. If the data volume for the member
  /// account is 40 GB per day, then <code>PercentOfGraphUtilization</code> is 25.
  /// It represents 25% of the maximum allowed data volume.
  final double? percentOfGraphUtilization;

  /// The date and time when the graph utilization percentage was last updated.
  /// The value is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? percentOfGraphUtilizationUpdatedTime;

  /// The current membership status of the member account. The status can have one
  /// of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>INVITED</code> - For invited accounts only. Indicates that the member
  /// was sent an invitation but has not yet responded.
  /// </li>
  /// <li>
  /// <code>VERIFICATION_IN_PROGRESS</code> - For invited accounts only, indicates
  /// that Detective is verifying that the account identifier and email address
  /// provided for the member account match. If they do match, then Detective
  /// sends the invitation. If the email address and account identifier don't
  /// match, then the member cannot be added to the behavior graph.
  ///
  /// For organization accounts in the organization behavior graph, indicates that
  /// Detective is verifying that the account belongs to the organization.
  /// </li>
  /// <li>
  /// <code>VERIFICATION_FAILED</code> - For invited accounts only. Indicates that
  /// the account and email address provided for the member account do not match,
  /// and Detective did not send an invitation to the account.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Indicates that the member account currently
  /// contributes data to the behavior graph. For invited accounts, the member
  /// account accepted the invitation. For organization accounts in the
  /// organization behavior graph, the Detective administrator account enabled the
  /// organization account as a member account.
  /// </li>
  /// <li>
  /// <code>ACCEPTED_BUT_DISABLED</code> - The account accepted the invitation, or
  /// was enabled by the Detective administrator account, but is prevented from
  /// contributing data to the behavior graph. <code>DisabledReason</code>
  /// provides the reason why the member account is not enabled.
  /// </li>
  /// </ul>
  /// Invited accounts that declined an invitation or that were removed from the
  /// behavior graph are not included. In the organization behavior graph,
  /// organization accounts that the Detective administrator account did not
  /// enable are not included.
  final MemberStatus? status;

  /// The date and time that the member account was last updated. The value is an
  /// ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? updatedTime;

  /// Details on the volume of usage for each data source package in a behavior
  /// graph.
  final Map<DatasourcePackage, DatasourcePackageUsageInfo>?
      volumeUsageByDatasourcePackage;

  /// The data volume in bytes per day for the member account.
  final int? volumeUsageInBytes;

  /// The data and time when the member account data volume was last updated. The
  /// value is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? volumeUsageUpdatedTime;

  MemberDetail({
    this.accountId,
    this.administratorId,
    this.datasourcePackageIngestStates,
    this.disabledReason,
    this.emailAddress,
    this.graphArn,
    this.invitationType,
    this.invitedTime,
    this.masterId,
    this.percentOfGraphUtilization,
    this.percentOfGraphUtilizationUpdatedTime,
    this.status,
    this.updatedTime,
    this.volumeUsageByDatasourcePackage,
    this.volumeUsageInBytes,
    this.volumeUsageUpdatedTime,
  });

  factory MemberDetail.fromJson(Map<String, dynamic> json) {
    return MemberDetail(
      accountId: json['AccountId'] as String?,
      administratorId: json['AdministratorId'] as String?,
      datasourcePackageIngestStates:
          (json['DatasourcePackageIngestStates'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k.toDatasourcePackage(),
                  (e as String).toDatasourcePackageIngestState())),
      disabledReason:
          (json['DisabledReason'] as String?)?.toMemberDisabledReason(),
      emailAddress: json['EmailAddress'] as String?,
      graphArn: json['GraphArn'] as String?,
      invitationType: (json['InvitationType'] as String?)?.toInvitationType(),
      invitedTime: timeStampFromJson(json['InvitedTime']),
      masterId: json['MasterId'] as String?,
      percentOfGraphUtilization: json['PercentOfGraphUtilization'] as double?,
      percentOfGraphUtilizationUpdatedTime:
          timeStampFromJson(json['PercentOfGraphUtilizationUpdatedTime']),
      status: (json['Status'] as String?)?.toMemberStatus(),
      updatedTime: timeStampFromJson(json['UpdatedTime']),
      volumeUsageByDatasourcePackage: (json['VolumeUsageByDatasourcePackage']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDatasourcePackage(),
              DatasourcePackageUsageInfo.fromJson(e as Map<String, dynamic>))),
      volumeUsageInBytes: json['VolumeUsageInBytes'] as int?,
      volumeUsageUpdatedTime: timeStampFromJson(json['VolumeUsageUpdatedTime']),
    );
  }
}

enum MemberDisabledReason {
  volumeTooHigh,
  volumeUnknown,
}

extension MemberDisabledReasonValueExtension on MemberDisabledReason {
  String toValue() {
    switch (this) {
      case MemberDisabledReason.volumeTooHigh:
        return 'VOLUME_TOO_HIGH';
      case MemberDisabledReason.volumeUnknown:
        return 'VOLUME_UNKNOWN';
    }
  }
}

extension MemberDisabledReasonFromString on String {
  MemberDisabledReason toMemberDisabledReason() {
    switch (this) {
      case 'VOLUME_TOO_HIGH':
        return MemberDisabledReason.volumeTooHigh;
      case 'VOLUME_UNKNOWN':
        return MemberDisabledReason.volumeUnknown;
    }
    throw Exception('$this is not known in enum MemberDisabledReason');
  }
}

enum MemberStatus {
  invited,
  verificationInProgress,
  verificationFailed,
  enabled,
  acceptedButDisabled,
}

extension MemberStatusValueExtension on MemberStatus {
  String toValue() {
    switch (this) {
      case MemberStatus.invited:
        return 'INVITED';
      case MemberStatus.verificationInProgress:
        return 'VERIFICATION_IN_PROGRESS';
      case MemberStatus.verificationFailed:
        return 'VERIFICATION_FAILED';
      case MemberStatus.enabled:
        return 'ENABLED';
      case MemberStatus.acceptedButDisabled:
        return 'ACCEPTED_BUT_DISABLED';
    }
  }
}

extension MemberStatusFromString on String {
  MemberStatus toMemberStatus() {
    switch (this) {
      case 'INVITED':
        return MemberStatus.invited;
      case 'VERIFICATION_IN_PROGRESS':
        return MemberStatus.verificationInProgress;
      case 'VERIFICATION_FAILED':
        return MemberStatus.verificationFailed;
      case 'ENABLED':
        return MemberStatus.enabled;
      case 'ACCEPTED_BUT_DISABLED':
        return MemberStatus.acceptedButDisabled;
    }
    throw Exception('$this is not known in enum MemberStatus');
  }
}

/// Details on data source packages for members of the behavior graph.
class MembershipDatasources {
  /// The account identifier of the Amazon Web Services account.
  final String? accountId;

  /// Details on when a data source package was added to a behavior graph.
  final Map<DatasourcePackage,
          Map<DatasourcePackageIngestState, TimestampForCollection>>?
      datasourcePackageIngestHistory;

  /// The ARN of the organization behavior graph.
  final String? graphArn;

  MembershipDatasources({
    this.accountId,
    this.datasourcePackageIngestHistory,
    this.graphArn,
  });

  factory MembershipDatasources.fromJson(Map<String, dynamic> json) {
    return MembershipDatasources(
      accountId: json['AccountId'] as String?,
      datasourcePackageIngestHistory:
          (json['DatasourcePackageIngestHistory'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(
                  k.toDatasourcePackage(),
                  (e as Map<String, dynamic>).map((k, e) => MapEntry(
                      k.toDatasourcePackageIngestState(),
                      TimestampForCollection.fromJson(
                          e as Map<String, dynamic>))))),
      graphArn: json['GraphArn'] as String?,
    );
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Details on when data collection began for a source package.
class TimestampForCollection {
  /// The data and time when data collection began for a source package. The value
  /// is an ISO8601 formatted string. For example,
  /// <code>2021-08-18T16:35:56.284Z</code>.
  final DateTime? timestamp;

  TimestampForCollection({
    this.timestamp,
  });

  factory TimestampForCollection.fromJson(Map<String, dynamic> json) {
    return TimestampForCollection(
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }
}

/// A member account that was included in a request but for which the request
/// could not be processed.
class UnprocessedAccount {
  /// The Amazon Web Services account identifier of the member account that was
  /// not processed.
  final String? accountId;

  /// The reason that the member account request could not be processed.
  final String? reason;

  UnprocessedAccount({
    this.accountId,
    this.reason,
  });

  factory UnprocessedAccount.fromJson(Map<String, dynamic> json) {
    return UnprocessedAccount(
      accountId: json['AccountId'] as String?,
      reason: json['Reason'] as String?,
    );
  }
}

/// Behavior graphs that could not be processed in the request.
class UnprocessedGraph {
  /// The ARN of the organization behavior graph.
  final String? graphArn;

  /// The reason data source package information could not be processed for a
  /// behavior graph.
  final String? reason;

  UnprocessedGraph({
    this.graphArn,
    this.reason,
  });

  factory UnprocessedGraph.fromJson(Map<String, dynamic> json) {
    return UnprocessedGraph(
      graphArn: json['GraphArn'] as String?,
      reason: json['Reason'] as String?,
    );
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

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
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
