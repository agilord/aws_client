// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
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
/// analyze and investigate security issues across your Amazon Web Services
/// (AWS) workloads. Detective automatically extracts time-based events such as
/// login attempts, API calls, and network traffic from AWS CloudTrail and
/// Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also extracts
/// findings detected by Amazon GuardDuty.
///
/// The Detective API primarily supports the creation and management of behavior
/// graphs. A behavior graph contains the extracted data from a set of member
/// accounts, and is created and managed by a master account.
///
/// Every behavior graph is specific to a Region. You can only use the API to
/// manage graphs that belong to the Region that is associated with the
/// currently selected endpoint.
///
/// A Detective master account can use the Detective API to do the following:
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
/// </ul>
/// A member account can use the Detective API to do the following:
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
class Detective {
  final _s.RestJsonProtocol _protocol;
  Detective({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
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
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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

  /// Creates a new behavior graph for the calling account, and sets that
  /// account as the master account. This operation is called by the account
  /// that is enabling Detective.
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
  /// An account can only be the master account for one behavior graph within a
  /// Region. If the same account calls <code>CreateGraph</code> with the same
  /// master account, it always returns the same behavior graph ARN. It does not
  /// create a new behavior graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  Future<CreateGraphResponse> createGraph() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/graph',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphResponse.fromJson(response);
  }

  /// Sends a request to invite the specified AWS accounts to be member accounts
  /// in the behavior graph. This operation can only be called by the master
  /// account for a behavior graph.
  ///
  /// <code>CreateMembers</code> verifies the accounts and then sends
  /// invitations to the verified accounts.
  ///
  /// The request provides the behavior graph ARN and the list of accounts to
  /// invite.
  ///
  /// The response separates the requested accounts into two lists:
  ///
  /// <ul>
  /// <li>
  /// The accounts that <code>CreateMembers</code> was able to start the
  /// verification for. This list includes member accounts that are being
  /// verified, that have passed verification and are being sent an invitation,
  /// and that have failed verification.
  /// </li>
  /// <li>
  /// The accounts that <code>CreateMembers</code> was unable to process. This
  /// list includes accounts that were already invited to be member accounts in
  /// the behavior graph.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [accounts] :
  /// The list of AWS accounts to invite to become member accounts in the
  /// behavior graph. For each invited account, the account list contains the
  /// account identifier and the AWS account root user email address.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to invite the member accounts to contribute
  /// their data to.
  ///
  /// Parameter [message] :
  /// Customized message text to include in the invitation email message to the
  /// invited member accounts.
  Future<CreateMembersResponse> createMembers({
    required List<Account> accounts,
    required String graphArn,
    String? message,
  }) async {
    ArgumentError.checkNotNull(accounts, 'accounts');
    ArgumentError.checkNotNull(graphArn, 'graphArn');
    _s.validateStringLength(
      'message',
      message,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'Accounts': accounts,
      'GraphArn': graphArn,
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
  /// operation removes the graph from each member account's list of behavior
  /// graphs.
  ///
  /// <code>DeleteGraph</code> can only be called by the master account for a
  /// behavior graph.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to disable.
  Future<void> deleteGraph({
    required String graphArn,
  }) async {
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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

  /// Deletes one or more member accounts from the master account behavior
  /// graph. This operation can only be called by a Detective master account.
  /// That account cannot use <code>DeleteMembers</code> to delete their own
  /// account from the behavior graph. To disable a behavior graph, the master
  /// account uses the <code>DeleteGraph</code> API method.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of AWS account identifiers for the member accounts to delete from
  /// the behavior graph.
  ///
  /// Parameter [graphArn] :
  /// The ARN of the behavior graph to delete members from.
  Future<DeleteMembersResponse> deleteMembers({
    required List<String> accountIds,
    required String graphArn,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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

  /// Removes the member account from the specified behavior graph. This
  /// operation can only be called by a member account that has the
  /// <code>ENABLED</code> status.
  ///
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
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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

  /// Returns the membership details for specified member accounts for a
  /// behavior graph.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The list of AWS account identifiers for the member account for which to
  /// return member details.
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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

  /// Returns the list of behavior graphs that the calling account is a master
  /// of. This operation can only be called by a master account.
  ///
  /// Because an account can currently only be the master of one behavior graph
  /// within a Region, the results always contain a single graph.
  ///
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
  /// member account. This operation can only be called by a member account.
  ///
  /// Open invitations are invitations that the member account has not responded
  /// to.
  ///
  /// The results do not include behavior graphs for which the member account
  /// declined the invitation. The results also do not include behavior graphs
  /// that the member account resigned from or was removed from.
  ///
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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

  /// Retrieves the list of member accounts for a behavior graph. Does not
  /// return member accounts that were removed from the behavior graph.
  ///
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
    ArgumentError.checkNotNull(graphArn, 'graphArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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

  /// Rejects an invitation to contribute the account data to a behavior graph.
  /// This operation must be called by a member account that has the
  /// <code>INVITED</code> status.
  ///
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
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(graphArn, 'graphArn');
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
}

/// An AWS account that is the master of or a member of a behavior graph.
class Account {
  /// The account identifier of the AWS account.
  final String accountId;

  /// The AWS account root user email address for the AWS account.
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
  /// The set of member account invitation requests that Detective was able to
  /// process. This includes accounts that are being verified, that failed
  /// verification, and that passed verification and are being sent an invitation.
  final List<MemberDetail>? members;

  /// The list of accounts for which Detective was unable to process the
  /// invitation request. For each account, the list provides the reason why the
  /// request could not be processed. The list includes accounts that are already
  /// member accounts in the behavior graph.
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

class DeleteMembersResponse {
  /// The list of AWS account identifiers for the member accounts that Detective
  /// successfully deleted from the behavior graph.
  final List<String>? accountIds;

  /// The list of member accounts that Detective was not able to delete from the
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

  /// The date and time that the behavior graph was created. The value is in
  /// milliseconds since the epoch.
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

class ListGraphsResponse {
  /// A list of behavior graphs that the account is a master for.
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
  /// The results include member accounts that did not pass verification and
  /// member accounts that have not yet accepted the invitation to the behavior
  /// graph. The results do not include member accounts that were removed from the
  /// behavior graph.
  final List<MemberDetail>? memberDetails;

  /// If there are more member accounts remaining in the results, then this is the
  /// pagination token to use to request the next page of member accounts.
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

/// Details about a member account that was invited to contribute to a behavior
/// graph.
class MemberDetail {
  /// The AWS account identifier for the member account.
  final String? accountId;

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

  /// The AWS account root user email address for the member account.
  final String? emailAddress;

  /// The ARN of the behavior graph that the member account was invited to.
  final String? graphArn;

  /// The date and time that Detective sent the invitation to the member account.
  /// The value is in milliseconds since the epoch.
  final DateTime? invitedTime;

  /// The AWS account identifier of the master account for the behavior graph.
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
  final DateTime? percentOfGraphUtilizationUpdatedTime;

  /// The current membership status of the member account. The status can have one
  /// of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>INVITED</code> - Indicates that the member was sent an invitation but
  /// has not yet responded.
  /// </li>
  /// <li>
  /// <code>VERIFICATION_IN_PROGRESS</code> - Indicates that Detective is
  /// verifying that the account identifier and email address provided for the
  /// member account match. If they do match, then Detective sends the invitation.
  /// If the email address and account identifier don't match, then the member
  /// cannot be added to the behavior graph.
  /// </li>
  /// <li>
  /// <code>VERIFICATION_FAILED</code> - Indicates that the account and email
  /// address provided for the member account do not match, and Detective did not
  /// send an invitation to the account.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Indicates that the member account accepted the
  /// invitation to contribute to the behavior graph.
  /// </li>
  /// <li>
  /// <code>ACCEPTED_BUT_DISABLED</code> - Indicates that the member account
  /// accepted the invitation but is prevented from contributing data to the
  /// behavior graph. <code>DisabledReason</code> provides the reason why the
  /// member account is not enabled.
  /// </li>
  /// </ul>
  /// Member accounts that declined an invitation or that were removed from the
  /// behavior graph are not included.
  final MemberStatus? status;

  /// The date and time that the member account was last updated. The value is in
  /// milliseconds since the epoch.
  final DateTime? updatedTime;

  MemberDetail({
    this.accountId,
    this.disabledReason,
    this.emailAddress,
    this.graphArn,
    this.invitedTime,
    this.masterId,
    this.percentOfGraphUtilization,
    this.percentOfGraphUtilizationUpdatedTime,
    this.status,
    this.updatedTime,
  });
  factory MemberDetail.fromJson(Map<String, dynamic> json) {
    return MemberDetail(
      accountId: json['AccountId'] as String?,
      disabledReason:
          (json['DisabledReason'] as String?)?.toMemberDisabledReason(),
      emailAddress: json['EmailAddress'] as String?,
      graphArn: json['GraphArn'] as String?,
      invitedTime: timeStampFromJson(json['InvitedTime']),
      masterId: json['MasterId'] as String?,
      percentOfGraphUtilization: json['PercentOfGraphUtilization'] as double?,
      percentOfGraphUtilizationUpdatedTime:
          timeStampFromJson(json['PercentOfGraphUtilizationUpdatedTime']),
      status: (json['Status'] as String?)?.toMemberStatus(),
      updatedTime: timeStampFromJson(json['UpdatedTime']),
    );
  }
}

enum MemberDisabledReason {
  volumeTooHigh,
  volumeUnknown,
}

extension on MemberDisabledReason {
  String toValue() {
    switch (this) {
      case MemberDisabledReason.volumeTooHigh:
        return 'VOLUME_TOO_HIGH';
      case MemberDisabledReason.volumeUnknown:
        return 'VOLUME_UNKNOWN';
    }
  }
}

extension on String {
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

extension on MemberStatus {
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

extension on String {
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

/// A member account that was included in a request but for which the request
/// could not be processed.
class UnprocessedAccount {
  /// The AWS account identifier of the member account that was not processed.
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
