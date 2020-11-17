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

part 'fms-2018-01-01.g.dart';

/// This is the <i>AWS Firewall Manager API Reference</i>. This guide is for
/// developers who need detailed information about the AWS Firewall Manager API
/// actions, data types, and errors. For detailed information about AWS Firewall
/// Manager features, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html">AWS
/// Firewall Manager Developer Guide</a>.
class FMS {
  final _s.JsonProtocol _protocol;
  FMS({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'fms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Sets the AWS Firewall Manager administrator account. AWS Firewall Manager
  /// must be associated with the master account of your AWS organization or
  /// associated with a member account that has the appropriate permissions. If
  /// the account ID that you submit is not an AWS Organizations master account,
  /// AWS Firewall Manager will set the appropriate permissions for the given
  /// member account.
  ///
  /// The account that you associate with AWS Firewall Manager is called the AWS
  /// Firewall Manager administrator account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [adminAccount] :
  /// The AWS account ID to associate with AWS Firewall Manager as the AWS
  /// Firewall Manager administrator account. This can be an AWS Organizations
  /// master account or a member account. For more information about AWS
  /// Organizations and master accounts, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing
  /// the AWS Accounts in Your Organization</a>.
  Future<void> associateAdminAccount({
    @_s.required String adminAccount,
  }) async {
    ArgumentError.checkNotNull(adminAccount, 'adminAccount');
    _s.validateStringLength(
      'adminAccount',
      adminAccount,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'adminAccount',
      adminAccount,
      r'''^[0-9]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.AssociateAdminAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdminAccount': adminAccount,
      },
    );
  }

  /// Deletes an AWS Firewall Manager association with the IAM role and the
  /// Amazon Simple Notification Service (SNS) topic that is used to record AWS
  /// Firewall Manager SNS logs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  Future<void> deleteNotificationChannel() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteNotificationChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Permanently deletes an AWS Firewall Manager policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [policyId] :
  /// The ID of the policy that you want to delete. <code>PolicyId</code> is
  /// returned by <code>PutPolicy</code> and by <code>ListPolicies</code>.
  ///
  /// Parameter [deleteAllPolicyResources] :
  /// If <code>True</code>, the request performs cleanup according to the policy
  /// type.
  ///
  /// For AWS WAF and Shield Advanced policies, the cleanup does the following:
  ///
  /// <ul>
  /// <li>
  /// Deletes rule groups created by AWS Firewall Manager
  /// </li>
  /// <li>
  /// Removes web ACLs from in-scope resources
  /// </li>
  /// <li>
  /// Deletes web ACLs that contain no rules or rule groups
  /// </li>
  /// </ul>
  /// For security group policies, the cleanup does the following for each
  /// security group in the policy:
  ///
  /// <ul>
  /// <li>
  /// Disassociates the security group from in-scope resources
  /// </li>
  /// <li>
  /// Deletes the security group if it was created through Firewall Manager and
  /// if it's no longer associated with any resources through another policy
  /// </li>
  /// </ul>
  /// After the cleanup, in-scope resources are no longer protected by web ACLs
  /// in this policy. Protection of out-of-scope resources remains unchanged.
  /// Scope is determined by tags that you create and accounts that you
  /// associate with the policy. When creating the policy, if you specify that
  /// only resources in specific accounts or with specific tags are in scope of
  /// the policy, those accounts and resources are handled by the policy. All
  /// others are out of scope. If you don't specify tags or accounts, all
  /// resources are in scope.
  Future<void> deletePolicy({
    @_s.required String policyId,
    bool deleteAllPolicyResources,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeletePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        if (deleteAllPolicyResources != null)
          'DeleteAllPolicyResources': deleteAllPolicyResources,
      },
    );
  }

  /// Disassociates the account that has been set as the AWS Firewall Manager
  /// administrator account. To set a different account as the administrator
  /// account, you must submit an <code>AssociateAdminAccount</code> request.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  Future<void> disassociateAdminAccount() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DisassociateAdminAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Returns the AWS Organizations master account that is associated with AWS
  /// Firewall Manager as the AWS Firewall Manager administrator.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  Future<GetAdminAccountResponse> getAdminAccount() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetAdminAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAdminAccountResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed compliance information about the specified member
  /// account. Details include resources that are in and out of compliance with
  /// the specified policy. Resources are considered noncompliant for AWS WAF
  /// and Shield Advanced policies if the specified policy has not been applied
  /// to them. Resources are considered noncompliant for security group policies
  /// if they are in scope of the policy, they violate one or more of the policy
  /// rules, and remediation is disabled or not possible.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [memberAccount] :
  /// The AWS account that owns the resources that you want to get the details
  /// for.
  ///
  /// Parameter [policyId] :
  /// The ID of the policy that you want to get the details for.
  /// <code>PolicyId</code> is returned by <code>PutPolicy</code> and by
  /// <code>ListPolicies</code>.
  Future<GetComplianceDetailResponse> getComplianceDetail({
    @_s.required String memberAccount,
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(memberAccount, 'memberAccount');
    _s.validateStringLength(
      'memberAccount',
      memberAccount,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'memberAccount',
      memberAccount,
      r'''^[0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetComplianceDetail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MemberAccount': memberAccount,
        'PolicyId': policyId,
      },
    );

    return GetComplianceDetailResponse.fromJson(jsonResponse.body);
  }

  /// Information about the Amazon Simple Notification Service (SNS) topic that
  /// is used to record AWS Firewall Manager SNS logs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  Future<GetNotificationChannelResponse> getNotificationChannel() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetNotificationChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetNotificationChannelResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified AWS Firewall Manager policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidTypeException].
  ///
  /// Parameter [policyId] :
  /// The ID of the AWS Firewall Manager policy that you want the details for.
  Future<GetPolicyResponse> getPolicy({
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
      },
    );

    return GetPolicyResponse.fromJson(jsonResponse.body);
  }

  /// If you created a Shield Advanced policy, returns policy-level attack
  /// summary information in the event of a potential DDoS attack. Other policy
  /// types are currently unsupported.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [policyId] :
  /// The ID of the policy for which you want to get the attack information.
  ///
  /// Parameter [endTime] :
  /// The end of the time period to query for the attacks. This is a
  /// <code>timestamp</code> type. The request syntax listing indicates a
  /// <code>number</code> type because the default used by AWS Firewall Manager
  /// is Unix time in seconds. However, any valid <code>timestamp</code> format
  /// is allowed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of objects that you want AWS Firewall Manager to
  /// return for this request. If you have more objects than the number that you
  /// specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// objects.
  ///
  /// Parameter [memberAccountId] :
  /// The AWS account that is in scope of the policy that you want to get the
  /// details for.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// objects than the number that you specify for <code>MaxResults</code>, AWS
  /// Firewall Manager returns a <code>NextToken</code> value in the response,
  /// which you can use to retrieve another group of objects. For the second and
  /// subsequent <code>GetProtectionStatus</code> requests, specify the value of
  /// <code>NextToken</code> from the previous response to get information about
  /// another batch of objects.
  ///
  /// Parameter [startTime] :
  /// The start of the time period to query for the attacks. This is a
  /// <code>timestamp</code> type. The request syntax listing indicates a
  /// <code>number</code> type because the default used by AWS Firewall Manager
  /// is Unix time in seconds. However, any valid <code>timestamp</code> format
  /// is allowed.
  Future<GetProtectionStatusResponse> getProtectionStatus({
    @_s.required String policyId,
    DateTime endTime,
    int maxResults,
    String memberAccountId,
    String nextToken,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'memberAccountId',
      memberAccountId,
      1,
      1024,
    );
    _s.validateStringPattern(
      'memberAccountId',
      memberAccountId,
      r'''^[0-9]+$''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetProtectionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        if (endTime != null) 'EndTime': endTime,
        if (maxResults != null) 'MaxResults': maxResults,
        if (memberAccountId != null) 'MemberAccountId': memberAccountId,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': startTime,
      },
    );

    return GetProtectionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>PolicyComplianceStatus</code> objects in the
  /// response. Use <code>PolicyComplianceStatus</code> to get a summary of
  /// which member accounts are protected by the specified policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [policyId] :
  /// The ID of the AWS Firewall Manager policy that you want the details for.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of <code>PolicyComplianceStatus</code> objects that
  /// you want AWS Firewall Manager to return for this request. If you have more
  /// <code>PolicyComplianceStatus</code> objects than the number that you
  /// specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// <code>PolicyComplianceStatus</code> objects.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// <code>PolicyComplianceStatus</code> objects than the number that you
  /// specify for <code>MaxResults</code>, AWS Firewall Manager returns a
  /// <code>NextToken</code> value in the response that allows you to list
  /// another group of <code>PolicyComplianceStatus</code> objects. For the
  /// second and subsequent <code>ListComplianceStatus</code> requests, specify
  /// the value of <code>NextToken</code> from the previous response to get
  /// information about another batch of <code>PolicyComplianceStatus</code>
  /// objects.
  Future<ListComplianceStatusResponse> listComplianceStatus({
    @_s.required String policyId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^[a-z0-9A-Z-]{36}$''',
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
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListComplianceStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListComplianceStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns a <code>MemberAccounts</code> object that lists the member
  /// accounts in the administrator's AWS organization.
  ///
  /// The <code>ListMemberAccounts</code> must be submitted by the account that
  /// is set as the AWS Firewall Manager administrator.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of member account IDs that you want AWS Firewall
  /// Manager to return for this request. If you have more IDs than the number
  /// that you specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// member account IDs.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// account IDs than the number that you specify for <code>MaxResults</code>,
  /// AWS Firewall Manager returns a <code>NextToken</code> value in the
  /// response that allows you to list another group of IDs. For the second and
  /// subsequent <code>ListMemberAccountsRequest</code> requests, specify the
  /// value of <code>NextToken</code> from the previous response to get
  /// information about another batch of member account IDs.
  Future<ListMemberAccountsResponse> listMemberAccounts({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListMemberAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListMemberAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>PolicySummary</code> objects in the response.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of <code>PolicySummary</code> objects that you want
  /// AWS Firewall Manager to return for this request. If you have more
  /// <code>PolicySummary</code> objects than the number that you specify for
  /// <code>MaxResults</code>, the response includes a <code>NextToken</code>
  /// value that you can use to get another batch of <code>PolicySummary</code>
  /// objects.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// <code>PolicySummary</code> objects than the number that you specify for
  /// <code>MaxResults</code>, AWS Firewall Manager returns a
  /// <code>NextToken</code> value in the response that allows you to list
  /// another group of <code>PolicySummary</code> objects. For the second and
  /// subsequent <code>ListPolicies</code> requests, specify the value of
  /// <code>NextToken</code> from the previous response to get information about
  /// another batch of <code>PolicySummary</code> objects.
  Future<ListPoliciesResponse> listPolicies({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of tags for the specified AWS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The
  /// Firewall Manager policy is the only AWS resource that supports tagging, so
  /// this ARN is a policy ARN..
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Designates the IAM role and Amazon Simple Notification Service (SNS) topic
  /// that AWS Firewall Manager uses to record SNS logs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [snsRoleName] :
  /// The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to
  /// record AWS Firewall Manager activity.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic that collects
  /// notifications from AWS Firewall Manager.
  Future<void> putNotificationChannel({
    @_s.required String snsRoleName,
    @_s.required String snsTopicArn,
  }) async {
    ArgumentError.checkNotNull(snsRoleName, 'snsRoleName');
    _s.validateStringLength(
      'snsRoleName',
      snsRoleName,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snsRoleName',
      snsRoleName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(snsTopicArn, 'snsTopicArn');
    _s.validateStringLength(
      'snsTopicArn',
      snsTopicArn,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snsTopicArn',
      snsTopicArn,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutNotificationChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnsRoleName': snsRoleName,
        'SnsTopicArn': snsTopicArn,
      },
    );
  }

  /// Creates an AWS Firewall Manager policy.
  ///
  /// Firewall Manager provides the following types of policies:
  ///
  /// <ul>
  /// <li>
  /// A Shield Advanced policy, which applies Shield Advanced protection to
  /// specified accounts and resources
  /// </li>
  /// <li>
  /// An AWS WAF policy, which contains a rule group and defines which resources
  /// are to be protected by that rule group
  /// </li>
  /// <li>
  /// A security group policy, which manages VPC security groups across your AWS
  /// organization.
  /// </li>
  /// </ul>
  /// Each policy is specific to one of the three types. If you want to enforce
  /// more than one policy type across accounts, you can create multiple
  /// policies. You can create multiple policies for each type.
  ///
  /// You must be subscribed to Shield Advanced to create a Shield Advanced
  /// policy. For more information about subscribing to Shield Advanced, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html">CreateSubscription</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidTypeException].
  ///
  /// Parameter [policy] :
  /// The details of the AWS Firewall Manager policy to be created.
  ///
  /// Parameter [tagList] :
  /// The tags to add to the AWS resource.
  Future<PutPolicyResponse> putPolicy({
    @_s.required Policy policy,
    List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return PutPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to an AWS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. The Firewall Manager
  /// policy is the only AWS resource that supports tagging, so this ARN is a
  /// policy ARN.
  ///
  /// Parameter [tagList] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagList, 'tagList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagList': tagList,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from an AWS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. The Firewall Manager
  /// policy is the only AWS resource that supports tagging, so this ARN is a
  /// policy ARN.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }
}

enum AccountRoleStatus {
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('PENDING_DELETION')
  pendingDeletion,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Details of the resource that is not protected by the policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComplianceViolator {
  /// The resource ID.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The resource type. This is in the format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// Resource Types Reference</a>. For example:
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> or
  /// <code>AWS::CloudFront::Distribution</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The reason that the resource is not protected by the policy.
  @_s.JsonKey(name: 'ViolationReason')
  final ViolationReason violationReason;

  ComplianceViolator({
    this.resourceId,
    this.resourceType,
    this.violationReason,
  });
  factory ComplianceViolator.fromJson(Map<String, dynamic> json) =>
      _$ComplianceViolatorFromJson(json);
}

enum CustomerPolicyScopeIdType {
  @_s.JsonValue('ACCOUNT')
  account,
}

enum DependentServiceName {
  @_s.JsonValue('AWSCONFIG')
  awsconfig,
  @_s.JsonValue('AWSWAF')
  awswaf,
  @_s.JsonValue('AWSSHIELD_ADVANCED')
  awsshieldAdvanced,
  @_s.JsonValue('AWSVPC')
  awsvpc,
}

/// Describes the compliance status for the account. An account is considered
/// noncompliant if it includes resources that are not protected by the
/// specified policy or that don't comply with the policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResult {
  /// Describes an AWS account's compliance with the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'ComplianceStatus')
  final PolicyComplianceStatusType complianceStatus;

  /// Indicates that over 100 resources are noncompliant with the AWS Firewall
  /// Manager policy.
  @_s.JsonKey(name: 'EvaluationLimitExceeded')
  final bool evaluationLimitExceeded;

  /// The number of resources that are noncompliant with the specified policy. For
  /// AWS WAF and Shield Advanced policies, a resource is considered noncompliant
  /// if it is not associated with the policy. For security group policies, a
  /// resource is considered noncompliant if it doesn't comply with the rules of
  /// the policy and remediation is disabled or not possible.
  @_s.JsonKey(name: 'ViolatorCount')
  final int violatorCount;

  EvaluationResult({
    this.complianceStatus,
    this.evaluationLimitExceeded,
    this.violatorCount,
  });
  factory EvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAdminAccountResponse {
  /// The AWS account that is set as the AWS Firewall Manager administrator.
  @_s.JsonKey(name: 'AdminAccount')
  final String adminAccount;

  /// The status of the AWS account that you set as the AWS Firewall Manager
  /// administrator.
  @_s.JsonKey(name: 'RoleStatus')
  final AccountRoleStatus roleStatus;

  GetAdminAccountResponse({
    this.adminAccount,
    this.roleStatus,
  });
  factory GetAdminAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdminAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComplianceDetailResponse {
  /// Information about the resources and the policy that you specified in the
  /// <code>GetComplianceDetail</code> request.
  @_s.JsonKey(name: 'PolicyComplianceDetail')
  final PolicyComplianceDetail policyComplianceDetail;

  GetComplianceDetailResponse({
    this.policyComplianceDetail,
  });
  factory GetComplianceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetComplianceDetailResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNotificationChannelResponse {
  /// The IAM role that is used by AWS Firewall Manager to record activity to SNS.
  @_s.JsonKey(name: 'SnsRoleName')
  final String snsRoleName;

  /// The SNS topic that records AWS Firewall Manager activity.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  GetNotificationChannelResponse({
    this.snsRoleName,
    this.snsTopicArn,
  });
  factory GetNotificationChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyResponse {
  /// Information about the specified AWS Firewall Manager policy.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  /// The Amazon Resource Name (ARN) of the specified policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  GetPolicyResponse({
    this.policy,
    this.policyArn,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProtectionStatusResponse {
  /// The ID of the AWS Firewall administrator account for this policy.
  @_s.JsonKey(name: 'AdminAccountId')
  final String adminAccountId;

  /// Details about the attack, including the following:
  ///
  /// <ul>
  /// <li>
  /// Attack type
  /// </li>
  /// <li>
  /// Account ID
  /// </li>
  /// <li>
  /// ARN of the resource attacked
  /// </li>
  /// <li>
  /// Start time of the attack
  /// </li>
  /// <li>
  /// End time of the attack (ongoing attacks will not have an end time)
  /// </li>
  /// </ul>
  /// The details are in JSON format.
  @_s.JsonKey(name: 'Data')
  final String data;

  /// If you have more objects than the number that you specified for
  /// <code>MaxResults</code> in the request, the response includes a
  /// <code>NextToken</code> value. To list more objects, submit another
  /// <code>GetProtectionStatus</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  ///
  /// AWS SDKs provide auto-pagination that identify <code>NextToken</code> in a
  /// response and make subsequent request calls automatically on your behalf.
  /// However, this feature is not supported by <code>GetProtectionStatus</code>.
  /// You must submit subsequent requests with <code>NextToken</code> using your
  /// own processes.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The service type that is protected by the policy. Currently, this is always
  /// <code>SHIELD_ADVANCED</code>.
  @_s.JsonKey(name: 'ServiceType')
  final SecurityServiceType serviceType;

  GetProtectionStatusResponse({
    this.adminAccountId,
    this.data,
    this.nextToken,
    this.serviceType,
  });
  factory GetProtectionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProtectionStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComplianceStatusResponse {
  /// If you have more <code>PolicyComplianceStatus</code> objects than the number
  /// that you specified for <code>MaxResults</code> in the request, the response
  /// includes a <code>NextToken</code> value. To list more
  /// <code>PolicyComplianceStatus</code> objects, submit another
  /// <code>ListComplianceStatus</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>PolicyComplianceStatus</code> objects.
  @_s.JsonKey(name: 'PolicyComplianceStatusList')
  final List<PolicyComplianceStatus> policyComplianceStatusList;

  ListComplianceStatusResponse({
    this.nextToken,
    this.policyComplianceStatusList,
  });
  factory ListComplianceStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ListComplianceStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMemberAccountsResponse {
  /// An array of account IDs.
  @_s.JsonKey(name: 'MemberAccounts')
  final List<String> memberAccounts;

  /// If you have more member account IDs than the number that you specified for
  /// <code>MaxResults</code> in the request, the response includes a
  /// <code>NextToken</code> value. To list more IDs, submit another
  /// <code>ListMemberAccounts</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMemberAccountsResponse({
    this.memberAccounts,
    this.nextToken,
  });
  factory ListMemberAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMemberAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPoliciesResponse {
  /// If you have more <code>PolicySummary</code> objects than the number that you
  /// specified for <code>MaxResults</code> in the request, the response includes
  /// a <code>NextToken</code> value. To list more <code>PolicySummary</code>
  /// objects, submit another <code>ListPolicies</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>PolicySummary</code> objects.
  @_s.JsonKey(name: 'PolicyList')
  final List<PolicySummary> policyList;

  ListPoliciesResponse({
    this.nextToken,
    this.policyList,
  });
  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// An AWS Firewall Manager policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Policy {
  /// If set to <code>True</code>, resources with the tags that are specified in
  /// the <code>ResourceTag</code> array are not in scope of the policy. If set to
  /// <code>False</code>, and the <code>ResourceTag</code> array is not null, only
  /// resources with the specified tags are in scope of the policy.
  @_s.JsonKey(name: 'ExcludeResourceTags')
  final bool excludeResourceTags;

  /// The friendly name of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// Indicates if the policy should be automatically applied to new resources.
  @_s.JsonKey(name: 'RemediationEnabled')
  final bool remediationEnabled;

  /// The type of resource protected by or in scope of the policy. This is in the
  /// format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples
  /// include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and
  /// <code>AWS::CloudFront::Distribution</code>. For a security group common
  /// policy, valid values are <code>AWS::EC2::NetworkInterface</code> and
  /// <code>AWS::EC2::Instance</code>. For a security group content audit policy,
  /// valid values are <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::EC2::NetworkInterface</code>, and
  /// <code>AWS::EC2::Instance</code>. For a security group usage audit policy,
  /// the value is <code>AWS::EC2::SecurityGroup</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// Details about the security service that is being used to protect the
  /// resources.
  @_s.JsonKey(name: 'SecurityServicePolicyData')
  final SecurityServicePolicyData securityServicePolicyData;

  /// Specifies the AWS account IDs to exclude from the policy. The
  /// <code>IncludeMap</code> values are evaluated first, with all the appropriate
  /// account IDs added to the policy. Then the accounts listed in
  /// <code>ExcludeMap</code> are removed, resulting in the final list of accounts
  /// to add to the policy.
  ///
  /// The key to the map is <code>ACCOUNT</code>. For example, a valid
  /// <code>ExcludeMap</code> would be <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”]}</code>.
  @_s.JsonKey(name: 'ExcludeMap')
  final Map<CustomerPolicyScopeIdType, List<String>> excludeMap;

  /// Specifies the AWS account IDs to include in the policy. If
  /// <code>IncludeMap</code> is null, all accounts in the organization in AWS
  /// Organizations are included in the policy. If <code>IncludeMap</code> is not
  /// null, only values listed in <code>IncludeMap</code> are included in the
  /// policy.
  ///
  /// The key to the map is <code>ACCOUNT</code>. For example, a valid
  /// <code>IncludeMap</code> would be <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”]}</code>.
  @_s.JsonKey(name: 'IncludeMap')
  final Map<CustomerPolicyScopeIdType, List<String>> includeMap;

  /// The ID of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// A unique identifier for each update to the policy. When issuing a
  /// <code>PutPolicy</code> request, the <code>PolicyUpdateToken</code> in the
  /// request must match the <code>PolicyUpdateToken</code> of the current policy
  /// version. To get the <code>PolicyUpdateToken</code> of the current policy
  /// version, use a <code>GetPolicy</code> request.
  @_s.JsonKey(name: 'PolicyUpdateToken')
  final String policyUpdateToken;

  /// An array of <code>ResourceTag</code> objects.
  @_s.JsonKey(name: 'ResourceTags')
  final List<ResourceTag> resourceTags;

  /// An array of <code>ResourceType</code>.
  @_s.JsonKey(name: 'ResourceTypeList')
  final List<String> resourceTypeList;

  Policy({
    @_s.required this.excludeResourceTags,
    @_s.required this.policyName,
    @_s.required this.remediationEnabled,
    @_s.required this.resourceType,
    @_s.required this.securityServicePolicyData,
    this.excludeMap,
    this.includeMap,
    this.policyId,
    this.policyUpdateToken,
    this.resourceTags,
    this.resourceTypeList,
  });
  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyToJson(this);
}

/// Describes the noncompliant resources in a member account for a specific AWS
/// Firewall Manager policy. A maximum of 100 entries are displayed. If more
/// than 100 resources are noncompliant, <code>EvaluationLimitExceeded</code> is
/// set to <code>True</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyComplianceDetail {
  /// Indicates if over 100 resources are noncompliant with the AWS Firewall
  /// Manager policy.
  @_s.JsonKey(name: 'EvaluationLimitExceeded')
  final bool evaluationLimitExceeded;

  /// A timestamp that indicates when the returned information should be
  /// considered out of date.
  @_s.JsonKey(
      name: 'ExpiredAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expiredAt;

  /// Details about problems with dependent services, such as AWS WAF or AWS
  /// Config, that are causing a resource to be noncompliant. The details include
  /// the name of the dependent service and the error message received that
  /// indicates the problem with the service.
  @_s.JsonKey(name: 'IssueInfoMap')
  final Map<DependentServiceName, String> issueInfoMap;

  /// The AWS account ID.
  @_s.JsonKey(name: 'MemberAccount')
  final String memberAccount;

  /// The ID of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The AWS account that created the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyOwner')
  final String policyOwner;

  /// An array of resources that aren't protected by the AWS WAF or Shield
  /// Advanced policy or that aren't in compliance with the security group policy.
  @_s.JsonKey(name: 'Violators')
  final List<ComplianceViolator> violators;

  PolicyComplianceDetail({
    this.evaluationLimitExceeded,
    this.expiredAt,
    this.issueInfoMap,
    this.memberAccount,
    this.policyId,
    this.policyOwner,
    this.violators,
  });
  factory PolicyComplianceDetail.fromJson(Map<String, dynamic> json) =>
      _$PolicyComplianceDetailFromJson(json);
}

/// Indicates whether the account is compliant with the specified policy. An
/// account is considered noncompliant if it includes resources that are not
/// protected by the policy, for AWS WAF and Shield Advanced policies, or that
/// are noncompliant with the policy, for security group policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyComplianceStatus {
  /// An array of <code>EvaluationResult</code> objects.
  @_s.JsonKey(name: 'EvaluationResults')
  final List<EvaluationResult> evaluationResults;

  /// Details about problems with dependent services, such as AWS WAF or AWS
  /// Config, that are causing a resource to be noncompliant. The details include
  /// the name of the dependent service and the error message received that
  /// indicates the problem with the service.
  @_s.JsonKey(name: 'IssueInfoMap')
  final Map<DependentServiceName, String> issueInfoMap;

  /// Timestamp of the last update to the <code>EvaluationResult</code> objects.
  @_s.JsonKey(
      name: 'LastUpdated',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdated;

  /// The member account ID.
  @_s.JsonKey(name: 'MemberAccount')
  final String memberAccount;

  /// The ID of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The friendly name of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// The AWS account that created the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyOwner')
  final String policyOwner;

  PolicyComplianceStatus({
    this.evaluationResults,
    this.issueInfoMap,
    this.lastUpdated,
    this.memberAccount,
    this.policyId,
    this.policyName,
    this.policyOwner,
  });
  factory PolicyComplianceStatus.fromJson(Map<String, dynamic> json) =>
      _$PolicyComplianceStatusFromJson(json);
}

enum PolicyComplianceStatusType {
  @_s.JsonValue('COMPLIANT')
  compliant,
  @_s.JsonValue('NON_COMPLIANT')
  nonCompliant,
}

/// Details of the AWS Firewall Manager policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicySummary {
  /// The Amazon Resource Name (ARN) of the specified policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// The ID of the specified policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The friendly name of the specified policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// Indicates if the policy should be automatically applied to new resources.
  @_s.JsonKey(name: 'RemediationEnabled')
  final bool remediationEnabled;

  /// The type of resource protected by or in scope of the policy. This is in the
  /// format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples
  /// include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and
  /// <code>AWS::CloudFront::Distribution</code>. For a security group common
  /// policy, valid values are <code>AWS::EC2::NetworkInterface</code> and
  /// <code>AWS::EC2::Instance</code>. For a security group content audit policy,
  /// valid values are <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::EC2::NetworkInterface</code>, and
  /// <code>AWS::EC2::Instance</code>. For a security group usage audit policy,
  /// the value is <code>AWS::EC2::SecurityGroup</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either an AWS WAF policy, a
  /// Shield Advanced policy, or a security group policy.
  @_s.JsonKey(name: 'SecurityServiceType')
  final SecurityServiceType securityServiceType;

  PolicySummary({
    this.policyArn,
    this.policyId,
    this.policyName,
    this.remediationEnabled,
    this.resourceType,
    this.securityServiceType,
  });
  factory PolicySummary.fromJson(Map<String, dynamic> json) =>
      _$PolicySummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPolicyResponse {
  /// The details of the AWS Firewall Manager policy that was created.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  /// The Amazon Resource Name (ARN) of the policy that was created.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  PutPolicyResponse({
    this.policy,
    this.policyArn,
  });
  factory PutPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPolicyResponseFromJson(json);
}

/// The resource tags that AWS Firewall Manager uses to determine if a
/// particular resource should be included or excluded from the AWS Firewall
/// Manager policy. Tags enable you to categorize your AWS resources in
/// different ways, for example, by purpose, owner, or environment. Each tag
/// consists of a key and an optional value. Firewall Manager combines the tags
/// with "AND" so that, if you add more than one tag to a policy scope, a
/// resource must have all the specified tags to be included or excluded. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html">Working
/// with Tag Editor</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceTag {
  /// The resource tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The resource tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ResourceTag({
    @_s.required this.key,
    this.value,
  });
  factory ResourceTag.fromJson(Map<String, dynamic> json) =>
      _$ResourceTagFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceTagToJson(this);
}

/// Details about the security service that is being used to protect the
/// resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SecurityServicePolicyData {
  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either an AWS WAF policy, a
  /// Shield Advanced policy, or a security group policy. For security group
  /// policies, Firewall Manager supports one security group for each common
  /// policy and for each content audit policy. This is an adjustable limit that
  /// you can increase by contacting AWS Support.
  @_s.JsonKey(name: 'Type')
  final SecurityServiceType type;

  /// Details about the service that are specific to the service type, in JSON
  /// format. For service type <code>SHIELD_ADVANCED</code>, this is an empty
  /// string.
  ///
  /// <ul>
  /// <li>
  /// Example: <code>WAFV2</code>
  ///
  /// <code>"SecurityServicePolicyData": "{ \"type\": \"WAFV2\",
  /// \"postProcessRuleGroups\": [ { \"managedRuleGroupIdentifier\": {
  /// \"managedRuleGroupName\": \"AWSManagedRulesAdminProtectionRuleSet\",
  /// \"vendor\": \"AWS\" } \"ruleGroupARN\": \"rule group arn",
  /// \"overrideAction\": { \"type\": \"COUNT|\" }, \"excludedRules\": [ {
  /// \"name\" : \"EntityName\" } ], \"type\": \"ManagedRuleGroup|RuleGroup\" } ],
  /// \"preProcessRuleGroups\": [ { \"managedRuleGroupIdentifier\": {
  /// \"managedRuleGroupName\": \"AWSManagedRulesAdminProtectionRuleSet\",
  /// \"vendor\": \"AWS\" } \"ruleGroupARN\": \"rule group arn\",
  /// \"overrideAction\": { \"type\": \"COUNT\" }, \"excludedRules\": [ { \"name\"
  /// : \"EntityName\" } ], \"type\": \"ManagedRuleGroup|RuleGroup\" } ],
  /// \"defaultAction\": { \"type\": \"BLOCK\" }}" </code>
  /// </li>
  /// <li>
  /// Example: <code>WAF</code>
  ///
  /// <code>"ManagedServiceData": "{\"type\": \"WAF\", \"ruleGroups\": [{\"id\":
  /// \"12345678-1bcd-9012-efga-0987654321ab\", \"overrideAction\" : {\"type\":
  /// \"COUNT\"}}], \"defaultAction\": {\"type\": \"BLOCK\"}}</code>
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_COMMON</code>
  ///
  /// <code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_COMMON","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,\"securityGroups\":[{\"id\":\"
  /// sg-000e55995d61a06bd\"}]}"},"RemediationEnabled":false,"ResourceType":"AWS::EC2::NetworkInterface"}</code>
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_CONTENT_AUDIT</code>
  ///
  /// <code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_CONTENT_AUDIT","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_CONTENT_AUDIT\",\"securityGroups\":[{\"id\":\"
  /// sg-000e55995d61a06bd
  /// \"}],\"securityGroupAction\":{\"type\":\"ALLOW\"}}"},"RemediationEnabled":false,"ResourceType":"AWS::EC2::NetworkInterface"}</code>
  ///
  /// The security group action for content audit can be <code>ALLOW</code> or
  /// <code>DENY</code>. For <code>ALLOW</code>, all in-scope security group rules
  /// must be within the allowed range of the policy's security group rules. For
  /// <code>DENY</code>, all in-scope security group rules must not contain a
  /// value or a range that matches a rule value or range in the policy security
  /// group.
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_USAGE_AUDIT</code>
  ///
  /// <code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_USAGE_AUDIT","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_USAGE_AUDIT\",\"deleteUnusedSecurityGroups\":true,\"coalesceRedundantSecurityGroups\":true}"},"RemediationEnabled":false,"Resou
  /// rceType":"AWS::EC2::SecurityGroup"}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ManagedServiceData')
  final String managedServiceData;

  SecurityServicePolicyData({
    @_s.required this.type,
    this.managedServiceData,
  });
  factory SecurityServicePolicyData.fromJson(Map<String, dynamic> json) =>
      _$SecurityServicePolicyDataFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityServicePolicyDataToJson(this);
}

enum SecurityServiceType {
  @_s.JsonValue('WAF')
  waf,
  @_s.JsonValue('WAFV2')
  wafv2,
  @_s.JsonValue('SHIELD_ADVANCED')
  shieldAdvanced,
  @_s.JsonValue('SECURITY_GROUPS_COMMON')
  securityGroupsCommon,
  @_s.JsonValue('SECURITY_GROUPS_CONTENT_AUDIT')
  securityGroupsContentAudit,
  @_s.JsonValue('SECURITY_GROUPS_USAGE_AUDIT')
  securityGroupsUsageAudit,
}

/// A collection of key:value pairs associated with an AWS resource. The
/// key:value pair can be anything you define. Typically, the tag key represents
/// a category (such as "environment") and the tag value represents a specific
/// value within that category (such as "test," "development," or "production").
/// You can add up to 50 tags to each AWS resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

enum ViolationReason {
  @_s.JsonValue('WEB_ACL_MISSING_RULE_GROUP')
  webAclMissingRuleGroup,
  @_s.JsonValue('RESOURCE_MISSING_WEB_ACL')
  resourceMissingWebAcl,
  @_s.JsonValue('RESOURCE_INCORRECT_WEB_ACL')
  resourceIncorrectWebAcl,
  @_s.JsonValue('RESOURCE_MISSING_SHIELD_PROTECTION')
  resourceMissingShieldProtection,
  @_s.JsonValue('RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION')
  resourceMissingWebAclOrShieldProtection,
  @_s.JsonValue('RESOURCE_MISSING_SECURITY_GROUP')
  resourceMissingSecurityGroup,
  @_s.JsonValue('RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP')
  resourceViolatesAuditSecurityGroup,
  @_s.JsonValue('SECURITY_GROUP_UNUSED')
  securityGroupUnused,
  @_s.JsonValue('SECURITY_GROUP_REDUNDANT')
  securityGroupRedundant,
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidTypeException extends _s.GenericAwsException {
  InvalidTypeException({String type, String message})
      : super(type: type, code: 'InvalidTypeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidTypeException': (type, message) =>
      InvalidTypeException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
