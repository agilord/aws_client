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

/// This is the <i>Firewall Manager API Reference</i>. This guide is for
/// developers who need detailed information about the Firewall Manager API
/// actions, data types, and errors. For detailed information about Firewall
/// Manager features, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html">Firewall
/// Manager Developer Guide</a>.
///
/// Some API actions require explicit resource permissions. For information, see
/// the developer guide topic <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-api-permissions-ref.html">Firewall
/// Manager required permissions for API actions</a>.
class Fms {
  final _s.JsonProtocol _protocol;
  Fms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'fms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Sets the Firewall Manager administrator account. The account must be a
  /// member of the organization in Organizations whose resources you want to
  /// protect. Firewall Manager sets the permissions that allow the account to
  /// administer your Firewall Manager policies.
  ///
  /// The account that you associate with Firewall Manager is called the
  /// Firewall Manager administrator account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccount] :
  /// The Amazon Web Services account ID to associate with Firewall Manager as
  /// the Firewall Manager administrator account. This must be an Organizations
  /// member account. For more information about Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing
  /// the Amazon Web Services Accounts in Your Organization</a>.
  Future<void> associateAdminAccount({
    required String adminAccount,
  }) async {
    ArgumentError.checkNotNull(adminAccount, 'adminAccount');
    _s.validateStringLength(
      'adminAccount',
      adminAccount,
      1,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.AssociateAdminAccount'
    };
    await _protocol.send(
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

  /// Permanently deletes an Firewall Manager applications list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the applications list that you want to delete. You can retrieve
  /// this ID from <code>PutAppsList</code>, <code>ListAppsLists</code>, and
  /// <code>GetAppsList</code>.
  Future<void> deleteAppsList({
    required String listId,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteAppsList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListId': listId,
      },
    );
  }

  /// Deletes an Firewall Manager association with the IAM role and the Amazon
  /// Simple Notification Service (SNS) topic that is used to record Firewall
  /// Manager SNS logs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  Future<void> deleteNotificationChannel() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteNotificationChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Permanently deletes an Firewall Manager policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyId] :
  /// The ID of the policy that you want to delete. You can retrieve this ID
  /// from <code>PutPolicy</code> and <code>ListPolicies</code>.
  ///
  /// Parameter [deleteAllPolicyResources] :
  /// If <code>True</code>, the request performs cleanup according to the policy
  /// type.
  ///
  /// For WAF and Shield Advanced policies, the cleanup does the following:
  ///
  /// <ul>
  /// <li>
  /// Deletes rule groups created by Firewall Manager
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
    required String policyId,
    bool? deleteAllPolicyResources,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeletePolicy'
    };
    await _protocol.send(
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

  /// Permanently deletes an Firewall Manager protocols list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the protocols list that you want to delete. You can retrieve
  /// this ID from <code>PutProtocolsList</code>,
  /// <code>ListProtocolsLists</code>, and <code>GetProtocolsLost</code>.
  Future<void> deleteProtocolsList({
    required String listId,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteProtocolsList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListId': listId,
      },
    );
  }

  /// Disassociates the account that has been set as the Firewall Manager
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Returns the Organizations account that is associated with Firewall Manager
  /// as the Firewall Manager administrator.
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

  /// Returns information about the specified Firewall Manager applications
  /// list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the Firewall Manager applications list that you want the details
  /// for.
  ///
  /// Parameter [defaultList] :
  /// Specifies whether the list to retrieve is a default list owned by Firewall
  /// Manager.
  Future<GetAppsListResponse> getAppsList({
    required String listId,
    bool? defaultList,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetAppsList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListId': listId,
        if (defaultList != null) 'DefaultList': defaultList,
      },
    );

    return GetAppsListResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed compliance information about the specified member
  /// account. Details include resources that are in and out of compliance with
  /// the specified policy.
  ///
  /// <ul>
  /// <li>
  /// Resources are considered noncompliant for WAF and Shield Advanced policies
  /// if the specified policy has not been applied to them.
  /// </li>
  /// <li>
  /// Resources are considered noncompliant for security group policies if they
  /// are in scope of the policy, they violate one or more of the policy rules,
  /// and remediation is disabled or not possible.
  /// </li>
  /// <li>
  /// Resources are considered noncompliant for Network Firewall policies if a
  /// firewall is missing in the VPC, if the firewall endpoint isn't set up in
  /// an expected Availability Zone and subnet, if a subnet created by the
  /// Firewall Manager doesn't have the expected route table, and for
  /// modifications to a firewall policy that violate the Firewall Manager
  /// policy's rules.
  /// </li>
  /// <li>
  /// Resources are considered noncompliant for DNS Firewall policies if a DNS
  /// Firewall rule group is missing from the rule group associations for the
  /// VPC.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [memberAccount] :
  /// The Amazon Web Services account that owns the resources that you want to
  /// get the details for.
  ///
  /// Parameter [policyId] :
  /// The ID of the policy that you want to get the details for.
  /// <code>PolicyId</code> is returned by <code>PutPolicy</code> and by
  /// <code>ListPolicies</code>.
  Future<GetComplianceDetailResponse> getComplianceDetail({
    required String memberAccount,
    required String policyId,
  }) async {
    ArgumentError.checkNotNull(memberAccount, 'memberAccount');
    _s.validateStringLength(
      'memberAccount',
      memberAccount,
      1,
      1024,
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
  /// is used to record Firewall Manager SNS logs.
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

  /// Returns information about the specified Firewall Manager policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidTypeException].
  ///
  /// Parameter [policyId] :
  /// The ID of the Firewall Manager policy that you want the details for.
  Future<GetPolicyResponse> getPolicy({
    required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
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
  /// <code>number</code> type because the default used by Firewall Manager is
  /// Unix time in seconds. However, any valid <code>timestamp</code> format is
  /// allowed.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of objects that you want Firewall Manager to return
  /// for this request. If you have more objects than the number that you
  /// specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// objects.
  ///
  /// Parameter [memberAccountId] :
  /// The Amazon Web Services account that is in scope of the policy that you
  /// want to get the details for.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// objects than the number that you specify for <code>MaxResults</code>,
  /// Firewall Manager returns a <code>NextToken</code> value in the response,
  /// which you can use to retrieve another group of objects. For the second and
  /// subsequent <code>GetProtectionStatus</code> requests, specify the value of
  /// <code>NextToken</code> from the previous response to get information about
  /// another batch of objects.
  ///
  /// Parameter [startTime] :
  /// The start of the time period to query for the attacks. This is a
  /// <code>timestamp</code> type. The request syntax listing indicates a
  /// <code>number</code> type because the default used by Firewall Manager is
  /// Unix time in seconds. However, any valid <code>timestamp</code> format is
  /// allowed.
  Future<GetProtectionStatusResponse> getProtectionStatus({
    required String policyId,
    DateTime? endTime,
    int? maxResults,
    String? memberAccountId,
    String? nextToken,
    DateTime? startTime,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
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
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (memberAccountId != null) 'MemberAccountId': memberAccountId,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return GetProtectionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified Firewall Manager protocols list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the Firewall Manager protocols list that you want the details
  /// for.
  ///
  /// Parameter [defaultList] :
  /// Specifies whether the list to retrieve is a default list owned by Firewall
  /// Manager.
  Future<GetProtocolsListResponse> getProtocolsList({
    required String listId,
    bool? defaultList,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetProtocolsList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ListId': listId,
        if (defaultList != null) 'DefaultList': defaultList,
      },
    );

    return GetProtocolsListResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves violations for a resource based on the specified Firewall
  /// Manager policy and Amazon Web Services account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [memberAccount] :
  /// The Amazon Web Services account ID that you want the details for.
  ///
  /// Parameter [policyId] :
  /// The ID of the Firewall Manager policy that you want the details for. This
  /// currently only supports security group content audit policies.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource that has violations.
  ///
  /// Parameter [resourceType] :
  /// The resource type. This is in the format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a>. Supported resource types are:
  /// <code>AWS::EC2::Instance</code>, <code>AWS::EC2::NetworkInterface</code>,
  /// <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::NetworkFirewall::FirewallPolicy</code>, and
  /// <code>AWS::EC2::Subnet</code>.
  Future<GetViolationDetailsResponse> getViolationDetails({
    required String memberAccount,
    required String policyId,
    required String resourceId,
    required String resourceType,
  }) async {
    ArgumentError.checkNotNull(memberAccount, 'memberAccount');
    _s.validateStringLength(
      'memberAccount',
      memberAccount,
      1,
      1024,
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateStringLength(
      'resourceType',
      resourceType,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetViolationDetails'
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
        'ResourceId': resourceId,
        'ResourceType': resourceType,
      },
    );

    return GetViolationDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>AppsListDataSummary</code> objects.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// If you don't specify this, Firewall Manager returns all available objects.
  ///
  /// Parameter [defaultLists] :
  /// Specifies whether the lists to retrieve are default lists owned by
  /// Firewall Manager.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> in your list request,
  /// and you have more objects than the maximum, Firewall Manager returns this
  /// token in the response. For all but the first request, you provide the
  /// token returned by the prior request in the request parameters, to retrieve
  /// the next batch of objects.
  Future<ListAppsListsResponse> listAppsLists({
    required int maxResults,
    bool? defaultLists,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListAppsLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        if (defaultLists != null) 'DefaultLists': defaultLists,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAppsListsResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>PolicyComplianceStatus</code> objects. Use
  /// <code>PolicyComplianceStatus</code> to get a summary of which member
  /// accounts are protected by the specified policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [policyId] :
  /// The ID of the Firewall Manager policy that you want the details for.
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of <code>PolicyComplianceStatus</code> objects that
  /// you want Firewall Manager to return for this request. If you have more
  /// <code>PolicyComplianceStatus</code> objects than the number that you
  /// specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// <code>PolicyComplianceStatus</code> objects.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// <code>PolicyComplianceStatus</code> objects than the number that you
  /// specify for <code>MaxResults</code>, Firewall Manager returns a
  /// <code>NextToken</code> value in the response that allows you to list
  /// another group of <code>PolicyComplianceStatus</code> objects. For the
  /// second and subsequent <code>ListComplianceStatus</code> requests, specify
  /// the value of <code>NextToken</code> from the previous response to get
  /// information about another batch of <code>PolicyComplianceStatus</code>
  /// objects.
  Future<ListComplianceStatusResponse> listComplianceStatus({
    required String policyId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      36,
      36,
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
  /// accounts in the administrator's Amazon Web Services organization.
  ///
  /// The <code>ListMemberAccounts</code> must be submitted by the account that
  /// is set as the Firewall Manager administrator.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of member account IDs that you want Firewall Manager
  /// to return for this request. If you have more IDs than the number that you
  /// specify for <code>MaxResults</code>, the response includes a
  /// <code>NextToken</code> value that you can use to get another batch of
  /// member account IDs.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// account IDs than the number that you specify for <code>MaxResults</code>,
  /// Firewall Manager returns a <code>NextToken</code> value in the response
  /// that allows you to list another group of IDs. For the second and
  /// subsequent <code>ListMemberAccountsRequest</code> requests, specify the
  /// value of <code>NextToken</code> from the previous response to get
  /// information about another batch of member account IDs.
  Future<ListMemberAccountsResponse> listMemberAccounts({
    int? maxResults,
    String? nextToken,
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

  /// Returns an array of <code>PolicySummary</code> objects.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the number of <code>PolicySummary</code> objects that you want
  /// Firewall Manager to return for this request. If you have more
  /// <code>PolicySummary</code> objects than the number that you specify for
  /// <code>MaxResults</code>, the response includes a <code>NextToken</code>
  /// value that you can use to get another batch of <code>PolicySummary</code>
  /// objects.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// <code>PolicySummary</code> objects than the number that you specify for
  /// <code>MaxResults</code>, Firewall Manager returns a <code>NextToken</code>
  /// value in the response that allows you to list another group of
  /// <code>PolicySummary</code> objects. For the second and subsequent
  /// <code>ListPolicies</code> requests, specify the value of
  /// <code>NextToken</code> from the previous response to get information about
  /// another batch of <code>PolicySummary</code> objects.
  Future<ListPoliciesResponse> listPolicies({
    int? maxResults,
    String? nextToken,
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

  /// Returns an array of <code>ProtocolsListDataSummary</code> objects.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// If you don't specify this, Firewall Manager returns all available objects.
  ///
  /// Parameter [defaultLists] :
  /// Specifies whether the lists to retrieve are default lists owned by
  /// Firewall Manager.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> in your list request,
  /// and you have more objects than the maximum, Firewall Manager returns this
  /// token in the response. For all but the first request, you provide the
  /// token returned by the prior request in the request parameters, to retrieve
  /// the next batch of objects.
  Future<ListProtocolsListsResponse> listProtocolsLists({
    required int maxResults,
    bool? defaultLists,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListProtocolsLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        if (defaultLists != null) 'DefaultLists': defaultLists,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProtocolsListsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of tags for the specified Amazon Web Services resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
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

  /// Creates an Firewall Manager applications list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [appsList] :
  /// The details of the Firewall Manager applications list to be created.
  ///
  /// Parameter [tagList] :
  /// The tags associated with the resource.
  Future<PutAppsListResponse> putAppsList({
    required AppsListData appsList,
    List<Tag>? tagList,
  }) async {
    ArgumentError.checkNotNull(appsList, 'appsList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutAppsList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppsList': appsList,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return PutAppsListResponse.fromJson(jsonResponse.body);
  }

  /// Designates the IAM role and Amazon Simple Notification Service (SNS) topic
  /// that Firewall Manager uses to record SNS logs.
  ///
  /// To perform this action outside of the console, you must configure the SNS
  /// topic to allow the Firewall Manager role <code>AWSServiceRoleForFMS</code>
  /// to publish SNS logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-api-permissions-ref.html">Firewall
  /// Manager required permissions for API actions</a> in the <i>Firewall
  /// Manager Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [snsRoleName] :
  /// The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to
  /// record Firewall Manager activity.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) of the SNS topic that collects
  /// notifications from Firewall Manager.
  Future<void> putNotificationChannel({
    required String snsRoleName,
    required String snsTopicArn,
  }) async {
    ArgumentError.checkNotNull(snsRoleName, 'snsRoleName');
    _s.validateStringLength(
      'snsRoleName',
      snsRoleName,
      1,
      1024,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutNotificationChannel'
    };
    await _protocol.send(
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

  /// Creates an Firewall Manager policy.
  ///
  /// Firewall Manager provides the following types of policies:
  ///
  /// <ul>
  /// <li>
  /// An WAF policy (type WAFV2), which defines rule groups to run first in the
  /// corresponding WAF web ACL and rule groups to run last in the web ACL.
  /// </li>
  /// <li>
  /// An WAF Classic policy (type WAF), which defines a rule group.
  /// </li>
  /// <li>
  /// A Shield Advanced policy, which applies Shield Advanced protection to
  /// specified accounts and resources.
  /// </li>
  /// <li>
  /// A security group policy, which manages VPC security groups across your
  /// Amazon Web Services organization.
  /// </li>
  /// <li>
  /// An Network Firewall policy, which provides firewall rules to filter
  /// network traffic in specified Amazon VPCs.
  /// </li>
  /// <li>
  /// A DNS Firewall policy, which provides Route 53 Resolver DNS Firewall rules
  /// to filter DNS queries for specified VPCs.
  /// </li>
  /// </ul>
  /// Each policy is specific to one of the types. If you want to enforce more
  /// than one policy type across accounts, create multiple policies. You can
  /// create multiple policies for each type.
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
  /// The details of the Firewall Manager policy to be created.
  ///
  /// Parameter [tagList] :
  /// The tags to add to the Amazon Web Services resource.
  Future<PutPolicyResponse> putPolicy({
    required Policy policy,
    List<Tag>? tagList,
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

  /// Creates an Firewall Manager protocols list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [protocolsList] :
  /// The details of the Firewall Manager protocols list to be created.
  ///
  /// Parameter [tagList] :
  /// The tags associated with the resource.
  Future<PutProtocolsListResponse> putProtocolsList({
    required ProtocolsListData protocolsList,
    List<Tag>? tagList,
  }) async {
    ArgumentError.checkNotNull(protocolsList, 'protocolsList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutProtocolsList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtocolsList': protocolsList,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return PutProtocolsListResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to an Amazon Web Services resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
  ///
  /// Parameter [tagList] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tagList,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagList, 'tagList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.TagResource'
    };
    await _protocol.send(
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
  }

  /// Removes one or more tags from an Amazon Web Services resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.UntagResource'
    };
    await _protocol.send(
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
  }
}

enum AccountRoleStatus {
  ready,
  creating,
  pendingDeletion,
  deleting,
  deleted,
}

extension on AccountRoleStatus {
  String toValue() {
    switch (this) {
      case AccountRoleStatus.ready:
        return 'READY';
      case AccountRoleStatus.creating:
        return 'CREATING';
      case AccountRoleStatus.pendingDeletion:
        return 'PENDING_DELETION';
      case AccountRoleStatus.deleting:
        return 'DELETING';
      case AccountRoleStatus.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  AccountRoleStatus toAccountRoleStatus() {
    switch (this) {
      case 'READY':
        return AccountRoleStatus.ready;
      case 'CREATING':
        return AccountRoleStatus.creating;
      case 'PENDING_DELETION':
        return AccountRoleStatus.pendingDeletion;
      case 'DELETING':
        return AccountRoleStatus.deleting;
      case 'DELETED':
        return AccountRoleStatus.deleted;
    }
    throw Exception('$this is not known in enum AccountRoleStatus');
  }
}

/// Describes a remediation action target.
class ActionTarget {
  /// A description of the remediation action target.
  final String? description;

  /// The ID of the remediation target.
  final String? resourceId;

  ActionTarget({
    this.description,
    this.resourceId,
  });

  factory ActionTarget.fromJson(Map<String, dynamic> json) {
    return ActionTarget(
      description: json['Description'] as String?,
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final resourceId = this.resourceId;
    return {
      if (description != null) 'Description': description,
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

/// An individual Firewall Manager application.
class App {
  /// The application's name.
  final String appName;

  /// The application's port number, for example <code>80</code>.
  final int port;

  /// The IP protocol name or number. The name can be one of <code>tcp</code>,
  /// <code>udp</code>, or <code>icmp</code>. For information on possible numbers,
  /// see <a
  /// href="https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol
  /// Numbers</a>.
  final String protocol;

  App({
    required this.appName,
    required this.port,
    required this.protocol,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appName: json['AppName'] as String,
      port: json['Port'] as int,
      protocol: json['Protocol'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appName = this.appName;
    final port = this.port;
    final protocol = this.protocol;
    return {
      'AppName': appName,
      'Port': port,
      'Protocol': protocol,
    };
  }
}

/// An Firewall Manager applications list.
class AppsListData {
  /// An array of applications in the Firewall Manager applications list.
  final List<App> appsList;

  /// The name of the Firewall Manager applications list.
  final String listName;

  /// The time that the Firewall Manager applications list was created.
  final DateTime? createTime;

  /// The time that the Firewall Manager applications list was last updated.
  final DateTime? lastUpdateTime;

  /// The ID of the Firewall Manager applications list.
  final String? listId;

  /// A unique identifier for each update to the list. When you update the list,
  /// the update token must match the token of the current version of the
  /// application list. You can retrieve the update token by getting the list.
  final String? listUpdateToken;

  /// A map of previous version numbers to their corresponding <code>App</code>
  /// object arrays.
  final Map<String, List<App>>? previousAppsList;

  AppsListData({
    required this.appsList,
    required this.listName,
    this.createTime,
    this.lastUpdateTime,
    this.listId,
    this.listUpdateToken,
    this.previousAppsList,
  });

  factory AppsListData.fromJson(Map<String, dynamic> json) {
    return AppsListData(
      appsList: (json['AppsList'] as List)
          .whereNotNull()
          .map((e) => App.fromJson(e as Map<String, dynamic>))
          .toList(),
      listName: json['ListName'] as String,
      createTime: timeStampFromJson(json['CreateTime']),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      listId: json['ListId'] as String?,
      listUpdateToken: json['ListUpdateToken'] as String?,
      previousAppsList: (json['PreviousAppsList'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) => App.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final appsList = this.appsList;
    final listName = this.listName;
    final createTime = this.createTime;
    final lastUpdateTime = this.lastUpdateTime;
    final listId = this.listId;
    final listUpdateToken = this.listUpdateToken;
    final previousAppsList = this.previousAppsList;
    return {
      'AppsList': appsList,
      'ListName': listName,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (listId != null) 'ListId': listId,
      if (listUpdateToken != null) 'ListUpdateToken': listUpdateToken,
      if (previousAppsList != null) 'PreviousAppsList': previousAppsList,
    };
  }
}

/// Details of the Firewall Manager applications list.
class AppsListDataSummary {
  /// An array of <code>App</code> objects in the Firewall Manager applications
  /// list.
  final List<App>? appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  final String? listArn;

  /// The ID of the applications list.
  final String? listId;

  /// The name of the applications list.
  final String? listName;

  AppsListDataSummary({
    this.appsList,
    this.listArn,
    this.listId,
    this.listName,
  });

  factory AppsListDataSummary.fromJson(Map<String, dynamic> json) {
    return AppsListDataSummary(
      appsList: (json['AppsList'] as List?)
          ?.whereNotNull()
          .map((e) => App.fromJson(e as Map<String, dynamic>))
          .toList(),
      listArn: json['ListArn'] as String?,
      listId: json['ListId'] as String?,
      listName: json['ListName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appsList = this.appsList;
    final listArn = this.listArn;
    final listId = this.listId;
    final listName = this.listName;
    return {
      if (appsList != null) 'AppsList': appsList,
      if (listArn != null) 'ListArn': listArn,
      if (listId != null) 'ListId': listId,
      if (listName != null) 'ListName': listName,
    };
  }
}

/// Violation detail for an EC2 instance resource.
class AwsEc2InstanceViolation {
  /// Violation detail for network interfaces associated with the EC2 instance.
  final List<AwsEc2NetworkInterfaceViolation>? awsEc2NetworkInterfaceViolations;

  /// The resource ID of the EC2 instance.
  final String? violationTarget;

  AwsEc2InstanceViolation({
    this.awsEc2NetworkInterfaceViolations,
    this.violationTarget,
  });

  factory AwsEc2InstanceViolation.fromJson(Map<String, dynamic> json) {
    return AwsEc2InstanceViolation(
      awsEc2NetworkInterfaceViolations:
          (json['AwsEc2NetworkInterfaceViolations'] as List?)
              ?.whereNotNull()
              .map((e) => AwsEc2NetworkInterfaceViolation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsEc2NetworkInterfaceViolations =
        this.awsEc2NetworkInterfaceViolations;
    final violationTarget = this.violationTarget;
    return {
      if (awsEc2NetworkInterfaceViolations != null)
        'AwsEc2NetworkInterfaceViolations': awsEc2NetworkInterfaceViolations,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// Violation detail for network interfaces associated with an EC2 instance.
class AwsEc2NetworkInterfaceViolation {
  /// List of security groups that violate the rules specified in the primary
  /// security group of the Firewall Manager policy.
  final List<String>? violatingSecurityGroups;

  /// The resource ID of the network interface.
  final String? violationTarget;

  AwsEc2NetworkInterfaceViolation({
    this.violatingSecurityGroups,
    this.violationTarget,
  });

  factory AwsEc2NetworkInterfaceViolation.fromJson(Map<String, dynamic> json) {
    return AwsEc2NetworkInterfaceViolation(
      violatingSecurityGroups: (json['ViolatingSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final violatingSecurityGroups = this.violatingSecurityGroups;
    final violationTarget = this.violationTarget;
    return {
      if (violatingSecurityGroups != null)
        'ViolatingSecurityGroups': violatingSecurityGroups,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// Violation detail for the rule violation in a security group when compared to
/// the primary security group of the Firewall Manager policy.
class AwsVPCSecurityGroupViolation {
  /// List of rules specified in the security group of the Firewall Manager policy
  /// that partially match the <code>ViolationTarget</code> rule.
  final List<PartialMatch>? partialMatches;

  /// Remediation options for the rule specified in the
  /// <code>ViolationTarget</code>.
  final List<SecurityGroupRemediationAction>?
      possibleSecurityGroupRemediationActions;

  /// The security group rule that is being evaluated.
  final String? violationTarget;

  /// A description of the security group that violates the policy.
  final String? violationTargetDescription;

  AwsVPCSecurityGroupViolation({
    this.partialMatches,
    this.possibleSecurityGroupRemediationActions,
    this.violationTarget,
    this.violationTargetDescription,
  });

  factory AwsVPCSecurityGroupViolation.fromJson(Map<String, dynamic> json) {
    return AwsVPCSecurityGroupViolation(
      partialMatches: (json['PartialMatches'] as List?)
          ?.whereNotNull()
          .map((e) => PartialMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      possibleSecurityGroupRemediationActions:
          (json['PossibleSecurityGroupRemediationActions'] as List?)
              ?.whereNotNull()
              .map((e) => SecurityGroupRemediationAction.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      violationTarget: json['ViolationTarget'] as String?,
      violationTargetDescription: json['ViolationTargetDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partialMatches = this.partialMatches;
    final possibleSecurityGroupRemediationActions =
        this.possibleSecurityGroupRemediationActions;
    final violationTarget = this.violationTarget;
    final violationTargetDescription = this.violationTargetDescription;
    return {
      if (partialMatches != null) 'PartialMatches': partialMatches,
      if (possibleSecurityGroupRemediationActions != null)
        'PossibleSecurityGroupRemediationActions':
            possibleSecurityGroupRemediationActions,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (violationTargetDescription != null)
        'ViolationTargetDescription': violationTargetDescription,
    };
  }
}

/// Details of the resource that is not protected by the policy.
class ComplianceViolator {
  /// The resource ID.
  final String? resourceId;

  /// The resource type. This is in the format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a>. For example:
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>,
  /// <code>AWS::CloudFront::Distribution</code>, or
  /// <code>AWS::NetworkFirewall::FirewallPolicy</code>.
  final String? resourceType;

  /// The reason that the resource is not protected by the policy.
  final ViolationReason? violationReason;

  ComplianceViolator({
    this.resourceId,
    this.resourceType,
    this.violationReason,
  });

  factory ComplianceViolator.fromJson(Map<String, dynamic> json) {
    return ComplianceViolator(
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
      violationReason:
          (json['ViolationReason'] as String?)?.toViolationReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final violationReason = this.violationReason;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (violationReason != null) 'ViolationReason': violationReason.toValue(),
    };
  }
}

enum CustomerPolicyScopeIdType {
  account,
  orgUnit,
}

extension on CustomerPolicyScopeIdType {
  String toValue() {
    switch (this) {
      case CustomerPolicyScopeIdType.account:
        return 'ACCOUNT';
      case CustomerPolicyScopeIdType.orgUnit:
        return 'ORG_UNIT';
    }
  }
}

extension on String {
  CustomerPolicyScopeIdType toCustomerPolicyScopeIdType() {
    switch (this) {
      case 'ACCOUNT':
        return CustomerPolicyScopeIdType.account;
      case 'ORG_UNIT':
        return CustomerPolicyScopeIdType.orgUnit;
    }
    throw Exception('$this is not known in enum CustomerPolicyScopeIdType');
  }
}

enum DependentServiceName {
  awsconfig,
  awswaf,
  awsshieldAdvanced,
  awsvpc,
}

extension on DependentServiceName {
  String toValue() {
    switch (this) {
      case DependentServiceName.awsconfig:
        return 'AWSCONFIG';
      case DependentServiceName.awswaf:
        return 'AWSWAF';
      case DependentServiceName.awsshieldAdvanced:
        return 'AWSSHIELD_ADVANCED';
      case DependentServiceName.awsvpc:
        return 'AWSVPC';
    }
  }
}

extension on String {
  DependentServiceName toDependentServiceName() {
    switch (this) {
      case 'AWSCONFIG':
        return DependentServiceName.awsconfig;
      case 'AWSWAF':
        return DependentServiceName.awswaf;
      case 'AWSSHIELD_ADVANCED':
        return DependentServiceName.awsshieldAdvanced;
      case 'AWSVPC':
        return DependentServiceName.awsvpc;
    }
    throw Exception('$this is not known in enum DependentServiceName');
  }
}

enum DestinationType {
  ipv4,
  ipv6,
  prefixList,
}

extension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.ipv4:
        return 'IPV4';
      case DestinationType.ipv6:
        return 'IPV6';
      case DestinationType.prefixList:
        return 'PREFIX_LIST';
    }
  }
}

extension on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 'IPV4':
        return DestinationType.ipv4;
      case 'IPV6':
        return DestinationType.ipv6;
      case 'PREFIX_LIST':
        return DestinationType.prefixList;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
}

/// A DNS Firewall rule group that Firewall Manager tried to associate with a
/// VPC is already associated with the VPC and can't be associated again.
class DnsDuplicateRuleGroupViolation {
  /// Information about the VPC ID.
  final String? violationTarget;

  /// A description of the violation that specifies the rule group and VPC.
  final String? violationTargetDescription;

  DnsDuplicateRuleGroupViolation({
    this.violationTarget,
    this.violationTargetDescription,
  });

  factory DnsDuplicateRuleGroupViolation.fromJson(Map<String, dynamic> json) {
    return DnsDuplicateRuleGroupViolation(
      violationTarget: json['ViolationTarget'] as String?,
      violationTargetDescription: json['ViolationTargetDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final violationTarget = this.violationTarget;
    final violationTargetDescription = this.violationTargetDescription;
    return {
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (violationTargetDescription != null)
        'ViolationTargetDescription': violationTargetDescription,
    };
  }
}

/// The VPC that Firewall Manager was applying a DNS Fireall policy to reached
/// the limit for associated DNS Firewall rule groups. Firewall Manager tried to
/// associate another rule group with the VPC and failed due to the limit.
class DnsRuleGroupLimitExceededViolation {
  /// The number of rule groups currently associated with the VPC.
  final int? numberOfRuleGroupsAlreadyAssociated;

  /// Information about the VPC ID.
  final String? violationTarget;

  /// A description of the violation that specifies the rule group and VPC.
  final String? violationTargetDescription;

  DnsRuleGroupLimitExceededViolation({
    this.numberOfRuleGroupsAlreadyAssociated,
    this.violationTarget,
    this.violationTargetDescription,
  });

  factory DnsRuleGroupLimitExceededViolation.fromJson(
      Map<String, dynamic> json) {
    return DnsRuleGroupLimitExceededViolation(
      numberOfRuleGroupsAlreadyAssociated:
          json['NumberOfRuleGroupsAlreadyAssociated'] as int?,
      violationTarget: json['ViolationTarget'] as String?,
      violationTargetDescription: json['ViolationTargetDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfRuleGroupsAlreadyAssociated =
        this.numberOfRuleGroupsAlreadyAssociated;
    final violationTarget = this.violationTarget;
    final violationTargetDescription = this.violationTargetDescription;
    return {
      if (numberOfRuleGroupsAlreadyAssociated != null)
        'NumberOfRuleGroupsAlreadyAssociated':
            numberOfRuleGroupsAlreadyAssociated,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (violationTargetDescription != null)
        'ViolationTargetDescription': violationTargetDescription,
    };
  }
}

/// A rule group that Firewall Manager tried to associate with a VPC has the
/// same priority as a rule group that's already associated.
class DnsRuleGroupPriorityConflictViolation {
  /// The ID of the Firewall Manager DNS Firewall policy that was already applied
  /// to the VPC. This policy contains the rule group that's already associated
  /// with the VPC.
  final String? conflictingPolicyId;

  /// The priority setting of the two conflicting rule groups.
  final int? conflictingPriority;

  /// The priorities of rule groups that are already associated with the VPC. To
  /// retry your operation, choose priority settings that aren't in this list for
  /// the rule groups in your new DNS Firewall policy.
  final List<int>? unavailablePriorities;

  /// Information about the VPC ID.
  final String? violationTarget;

  /// A description of the violation that specifies the VPC and the rule group
  /// that's already associated with it.
  final String? violationTargetDescription;

  DnsRuleGroupPriorityConflictViolation({
    this.conflictingPolicyId,
    this.conflictingPriority,
    this.unavailablePriorities,
    this.violationTarget,
    this.violationTargetDescription,
  });

  factory DnsRuleGroupPriorityConflictViolation.fromJson(
      Map<String, dynamic> json) {
    return DnsRuleGroupPriorityConflictViolation(
      conflictingPolicyId: json['ConflictingPolicyId'] as String?,
      conflictingPriority: json['ConflictingPriority'] as int?,
      unavailablePriorities: (json['UnavailablePriorities'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      violationTarget: json['ViolationTarget'] as String?,
      violationTargetDescription: json['ViolationTargetDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictingPolicyId = this.conflictingPolicyId;
    final conflictingPriority = this.conflictingPriority;
    final unavailablePriorities = this.unavailablePriorities;
    final violationTarget = this.violationTarget;
    final violationTargetDescription = this.violationTargetDescription;
    return {
      if (conflictingPolicyId != null)
        'ConflictingPolicyId': conflictingPolicyId,
      if (conflictingPriority != null)
        'ConflictingPriority': conflictingPriority,
      if (unavailablePriorities != null)
        'UnavailablePriorities': unavailablePriorities,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (violationTargetDescription != null)
        'ViolationTargetDescription': violationTargetDescription,
    };
  }
}

/// The action of associating an EC2 resource, such as a subnet or internet
/// gateway, with a route table.
class EC2AssociateRouteTableAction {
  /// The ID of the EC2 route table that is associated with the remediation
  /// action.
  final ActionTarget routeTableId;

  /// A description of the EC2 route table that is associated with the remediation
  /// action.
  final String? description;

  /// The ID of the gateway to be used with the EC2 route table that is associated
  /// with the remediation action.
  final ActionTarget? gatewayId;

  /// The ID of the subnet for the EC2 route table that is associated with the
  /// remediation action.
  final ActionTarget? subnetId;

  EC2AssociateRouteTableAction({
    required this.routeTableId,
    this.description,
    this.gatewayId,
    this.subnetId,
  });

  factory EC2AssociateRouteTableAction.fromJson(Map<String, dynamic> json) {
    return EC2AssociateRouteTableAction(
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      gatewayId: json['GatewayId'] != null
          ? ActionTarget.fromJson(json['GatewayId'] as Map<String, dynamic>)
          : null,
      subnetId: json['SubnetId'] != null
          ? ActionTarget.fromJson(json['SubnetId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final description = this.description;
    final gatewayId = this.gatewayId;
    final subnetId = this.subnetId;
    return {
      'RouteTableId': routeTableId,
      if (description != null) 'Description': description,
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// An action that copies the EC2 route table for use in remediation.
class EC2CopyRouteTableAction {
  /// The ID of the copied EC2 route table that is associated with the remediation
  /// action.
  final ActionTarget routeTableId;

  /// The VPC ID of the copied EC2 route table that is associated with the
  /// remediation action.
  final ActionTarget vpcId;

  /// A description of the copied EC2 route table that is associated with the
  /// remediation action.
  final String? description;

  EC2CopyRouteTableAction({
    required this.routeTableId,
    required this.vpcId,
    this.description,
  });

  factory EC2CopyRouteTableAction.fromJson(Map<String, dynamic> json) {
    return EC2CopyRouteTableAction(
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      vpcId: ActionTarget.fromJson(json['VpcId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final vpcId = this.vpcId;
    final description = this.description;
    return {
      'RouteTableId': routeTableId,
      'VpcId': vpcId,
      if (description != null) 'Description': description,
    };
  }
}

/// Information about the CreateRoute action in Amazon EC2.
class EC2CreateRouteAction {
  /// Information about the ID of the route table for the route.
  final ActionTarget routeTableId;

  /// A description of CreateRoute action in Amazon EC2.
  final String? description;

  /// Information about the IPv4 CIDR address block used for the destination
  /// match.
  final String? destinationCidrBlock;

  /// Information about the IPv6 CIDR block destination.
  final String? destinationIpv6CidrBlock;

  /// Information about the ID of a prefix list used for the destination match.
  final String? destinationPrefixListId;

  /// Information about the ID of an internet gateway or virtual private gateway
  /// attached to your VPC.
  final ActionTarget? gatewayId;

  /// Information about the ID of a VPC endpoint. Supported for Gateway Load
  /// Balancer endpoints only.
  final ActionTarget? vpcEndpointId;

  EC2CreateRouteAction({
    required this.routeTableId,
    this.description,
    this.destinationCidrBlock,
    this.destinationIpv6CidrBlock,
    this.destinationPrefixListId,
    this.gatewayId,
    this.vpcEndpointId,
  });

  factory EC2CreateRouteAction.fromJson(Map<String, dynamic> json) {
    return EC2CreateRouteAction(
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      destinationCidrBlock: json['DestinationCidrBlock'] as String?,
      destinationIpv6CidrBlock: json['DestinationIpv6CidrBlock'] as String?,
      destinationPrefixListId: json['DestinationPrefixListId'] as String?,
      gatewayId: json['GatewayId'] != null
          ? ActionTarget.fromJson(json['GatewayId'] as Map<String, dynamic>)
          : null,
      vpcEndpointId: json['VpcEndpointId'] != null
          ? ActionTarget.fromJson(json['VpcEndpointId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final description = this.description;
    final destinationCidrBlock = this.destinationCidrBlock;
    final destinationIpv6CidrBlock = this.destinationIpv6CidrBlock;
    final destinationPrefixListId = this.destinationPrefixListId;
    final gatewayId = this.gatewayId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'RouteTableId': routeTableId,
      if (description != null) 'Description': description,
      if (destinationCidrBlock != null)
        'DestinationCidrBlock': destinationCidrBlock,
      if (destinationIpv6CidrBlock != null)
        'DestinationIpv6CidrBlock': destinationIpv6CidrBlock,
      if (destinationPrefixListId != null)
        'DestinationPrefixListId': destinationPrefixListId,
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
    };
  }
}

/// Information about the CreateRouteTable action in Amazon EC2.
class EC2CreateRouteTableAction {
  /// Information about the ID of a VPC.
  final ActionTarget vpcId;

  /// A description of the CreateRouteTable action.
  final String? description;

  EC2CreateRouteTableAction({
    required this.vpcId,
    this.description,
  });

  factory EC2CreateRouteTableAction.fromJson(Map<String, dynamic> json) {
    return EC2CreateRouteTableAction(
      vpcId: ActionTarget.fromJson(json['VpcId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcId = this.vpcId;
    final description = this.description;
    return {
      'VpcId': vpcId,
      if (description != null) 'Description': description,
    };
  }
}

/// Information about the DeleteRoute action in Amazon EC2.
class EC2DeleteRouteAction {
  /// Information about the ID of the route table.
  final ActionTarget routeTableId;

  /// A description of the DeleteRoute action.
  final String? description;

  /// Information about the IPv4 CIDR range for the route. The value you specify
  /// must match the CIDR for the route exactly.
  final String? destinationCidrBlock;

  /// Information about the IPv6 CIDR range for the route. The value you specify
  /// must match the CIDR for the route exactly.
  final String? destinationIpv6CidrBlock;

  /// Information about the ID of the prefix list for the route.
  final String? destinationPrefixListId;

  EC2DeleteRouteAction({
    required this.routeTableId,
    this.description,
    this.destinationCidrBlock,
    this.destinationIpv6CidrBlock,
    this.destinationPrefixListId,
  });

  factory EC2DeleteRouteAction.fromJson(Map<String, dynamic> json) {
    return EC2DeleteRouteAction(
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      destinationCidrBlock: json['DestinationCidrBlock'] as String?,
      destinationIpv6CidrBlock: json['DestinationIpv6CidrBlock'] as String?,
      destinationPrefixListId: json['DestinationPrefixListId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final description = this.description;
    final destinationCidrBlock = this.destinationCidrBlock;
    final destinationIpv6CidrBlock = this.destinationIpv6CidrBlock;
    final destinationPrefixListId = this.destinationPrefixListId;
    return {
      'RouteTableId': routeTableId,
      if (description != null) 'Description': description,
      if (destinationCidrBlock != null)
        'DestinationCidrBlock': destinationCidrBlock,
      if (destinationIpv6CidrBlock != null)
        'DestinationIpv6CidrBlock': destinationIpv6CidrBlock,
      if (destinationPrefixListId != null)
        'DestinationPrefixListId': destinationPrefixListId,
    };
  }
}

/// Information about the ReplaceRoute action in Amazon EC2.
class EC2ReplaceRouteAction {
  /// Information about the ID of the route table.
  final ActionTarget routeTableId;

  /// A description of the ReplaceRoute action in Amazon EC2.
  final String? description;

  /// Information about the IPv4 CIDR address block used for the destination
  /// match. The value that you provide must match the CIDR of an existing route
  /// in the table.
  final String? destinationCidrBlock;

  /// Information about the IPv6 CIDR address block used for the destination
  /// match. The value that you provide must match the CIDR of an existing route
  /// in the table.
  final String? destinationIpv6CidrBlock;

  /// Information about the ID of the prefix list for the route.
  final String? destinationPrefixListId;

  /// Information about the ID of an internet gateway or virtual private gateway.
  final ActionTarget? gatewayId;

  EC2ReplaceRouteAction({
    required this.routeTableId,
    this.description,
    this.destinationCidrBlock,
    this.destinationIpv6CidrBlock,
    this.destinationPrefixListId,
    this.gatewayId,
  });

  factory EC2ReplaceRouteAction.fromJson(Map<String, dynamic> json) {
    return EC2ReplaceRouteAction(
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      destinationCidrBlock: json['DestinationCidrBlock'] as String?,
      destinationIpv6CidrBlock: json['DestinationIpv6CidrBlock'] as String?,
      destinationPrefixListId: json['DestinationPrefixListId'] as String?,
      gatewayId: json['GatewayId'] != null
          ? ActionTarget.fromJson(json['GatewayId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final description = this.description;
    final destinationCidrBlock = this.destinationCidrBlock;
    final destinationIpv6CidrBlock = this.destinationIpv6CidrBlock;
    final destinationPrefixListId = this.destinationPrefixListId;
    final gatewayId = this.gatewayId;
    return {
      'RouteTableId': routeTableId,
      if (description != null) 'Description': description,
      if (destinationCidrBlock != null)
        'DestinationCidrBlock': destinationCidrBlock,
      if (destinationIpv6CidrBlock != null)
        'DestinationIpv6CidrBlock': destinationIpv6CidrBlock,
      if (destinationPrefixListId != null)
        'DestinationPrefixListId': destinationPrefixListId,
      if (gatewayId != null) 'GatewayId': gatewayId,
    };
  }
}

/// Information about the ReplaceRouteTableAssociation action in Amazon EC2.
class EC2ReplaceRouteTableAssociationAction {
  /// Information about the association ID.
  final ActionTarget associationId;

  /// Information about the ID of the new route table to associate with the
  /// subnet.
  final ActionTarget routeTableId;

  /// A description of the ReplaceRouteTableAssociation action in Amazon EC2.
  final String? description;

  EC2ReplaceRouteTableAssociationAction({
    required this.associationId,
    required this.routeTableId,
    this.description,
  });

  factory EC2ReplaceRouteTableAssociationAction.fromJson(
      Map<String, dynamic> json) {
    return EC2ReplaceRouteTableAssociationAction(
      associationId:
          ActionTarget.fromJson(json['AssociationId'] as Map<String, dynamic>),
      routeTableId:
          ActionTarget.fromJson(json['RouteTableId'] as Map<String, dynamic>),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final routeTableId = this.routeTableId;
    final description = this.description;
    return {
      'AssociationId': associationId,
      'RouteTableId': routeTableId,
      if (description != null) 'Description': description,
    };
  }
}

/// Describes the compliance status for the account. An account is considered
/// noncompliant if it includes resources that are not protected by the
/// specified policy or that don't comply with the policy.
class EvaluationResult {
  /// Describes an Amazon Web Services account's compliance with the Firewall
  /// Manager policy.
  final PolicyComplianceStatusType? complianceStatus;

  /// Indicates that over 100 resources are noncompliant with the Firewall Manager
  /// policy.
  final bool? evaluationLimitExceeded;

  /// The number of resources that are noncompliant with the specified policy. For
  /// WAF and Shield Advanced policies, a resource is considered noncompliant if
  /// it is not associated with the policy. For security group policies, a
  /// resource is considered noncompliant if it doesn't comply with the rules of
  /// the policy and remediation is disabled or not possible.
  final int? violatorCount;

  EvaluationResult({
    this.complianceStatus,
    this.evaluationLimitExceeded,
    this.violatorCount,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      complianceStatus:
          (json['ComplianceStatus'] as String?)?.toPolicyComplianceStatusType(),
      evaluationLimitExceeded: json['EvaluationLimitExceeded'] as bool?,
      violatorCount: json['ViolatorCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceStatus = this.complianceStatus;
    final evaluationLimitExceeded = this.evaluationLimitExceeded;
    final violatorCount = this.violatorCount;
    return {
      if (complianceStatus != null)
        'ComplianceStatus': complianceStatus.toValue(),
      if (evaluationLimitExceeded != null)
        'EvaluationLimitExceeded': evaluationLimitExceeded,
      if (violatorCount != null) 'ViolatorCount': violatorCount,
    };
  }
}

/// Information about the expected route in the route table.
class ExpectedRoute {
  /// Information about the allowed targets.
  final List<String>? allowedTargets;

  /// Information about the contributing subnets.
  final List<String>? contributingSubnets;

  /// Information about the IPv4 CIDR block.
  final String? ipV4Cidr;

  /// Information about the IPv6 CIDR block.
  final String? ipV6Cidr;

  /// Information about the ID of the prefix list for the route.
  final String? prefixListId;

  /// Information about the route table ID.
  final String? routeTableId;

  ExpectedRoute({
    this.allowedTargets,
    this.contributingSubnets,
    this.ipV4Cidr,
    this.ipV6Cidr,
    this.prefixListId,
    this.routeTableId,
  });

  factory ExpectedRoute.fromJson(Map<String, dynamic> json) {
    return ExpectedRoute(
      allowedTargets: (json['AllowedTargets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      contributingSubnets: (json['ContributingSubnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipV4Cidr: json['IpV4Cidr'] as String?,
      ipV6Cidr: json['IpV6Cidr'] as String?,
      prefixListId: json['PrefixListId'] as String?,
      routeTableId: json['RouteTableId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedTargets = this.allowedTargets;
    final contributingSubnets = this.contributingSubnets;
    final ipV4Cidr = this.ipV4Cidr;
    final ipV6Cidr = this.ipV6Cidr;
    final prefixListId = this.prefixListId;
    final routeTableId = this.routeTableId;
    return {
      if (allowedTargets != null) 'AllowedTargets': allowedTargets,
      if (contributingSubnets != null)
        'ContributingSubnets': contributingSubnets,
      if (ipV4Cidr != null) 'IpV4Cidr': ipV4Cidr,
      if (ipV6Cidr != null) 'IpV6Cidr': ipV6Cidr,
      if (prefixListId != null) 'PrefixListId': prefixListId,
      if (routeTableId != null) 'RouteTableId': routeTableId,
    };
  }
}

class GetAdminAccountResponse {
  /// The Amazon Web Services account that is set as the Firewall Manager
  /// administrator.
  final String? adminAccount;

  /// The status of the Amazon Web Services account that you set as the Firewall
  /// Manager administrator.
  final AccountRoleStatus? roleStatus;

  GetAdminAccountResponse({
    this.adminAccount,
    this.roleStatus,
  });

  factory GetAdminAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAdminAccountResponse(
      adminAccount: json['AdminAccount'] as String?,
      roleStatus: (json['RoleStatus'] as String?)?.toAccountRoleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccount = this.adminAccount;
    final roleStatus = this.roleStatus;
    return {
      if (adminAccount != null) 'AdminAccount': adminAccount,
      if (roleStatus != null) 'RoleStatus': roleStatus.toValue(),
    };
  }
}

class GetAppsListResponse {
  /// Information about the specified Firewall Manager applications list.
  final AppsListData? appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  final String? appsListArn;

  GetAppsListResponse({
    this.appsList,
    this.appsListArn,
  });

  factory GetAppsListResponse.fromJson(Map<String, dynamic> json) {
    return GetAppsListResponse(
      appsList: json['AppsList'] != null
          ? AppsListData.fromJson(json['AppsList'] as Map<String, dynamic>)
          : null,
      appsListArn: json['AppsListArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appsList = this.appsList;
    final appsListArn = this.appsListArn;
    return {
      if (appsList != null) 'AppsList': appsList,
      if (appsListArn != null) 'AppsListArn': appsListArn,
    };
  }
}

class GetComplianceDetailResponse {
  /// Information about the resources and the policy that you specified in the
  /// <code>GetComplianceDetail</code> request.
  final PolicyComplianceDetail? policyComplianceDetail;

  GetComplianceDetailResponse({
    this.policyComplianceDetail,
  });

  factory GetComplianceDetailResponse.fromJson(Map<String, dynamic> json) {
    return GetComplianceDetailResponse(
      policyComplianceDetail: json['PolicyComplianceDetail'] != null
          ? PolicyComplianceDetail.fromJson(
              json['PolicyComplianceDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyComplianceDetail = this.policyComplianceDetail;
    return {
      if (policyComplianceDetail != null)
        'PolicyComplianceDetail': policyComplianceDetail,
    };
  }
}

class GetNotificationChannelResponse {
  /// The IAM role that is used by Firewall Manager to record activity to SNS.
  final String? snsRoleName;

  /// The SNS topic that records Firewall Manager activity.
  final String? snsTopicArn;

  GetNotificationChannelResponse({
    this.snsRoleName,
    this.snsTopicArn,
  });

  factory GetNotificationChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationChannelResponse(
      snsRoleName: json['SnsRoleName'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snsRoleName = this.snsRoleName;
    final snsTopicArn = this.snsTopicArn;
    return {
      if (snsRoleName != null) 'SnsRoleName': snsRoleName,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
    };
  }
}

class GetPolicyResponse {
  /// Information about the specified Firewall Manager policy.
  final Policy? policy;

  /// The Amazon Resource Name (ARN) of the specified policy.
  final String? policyArn;

  GetPolicyResponse({
    this.policy,
    this.policyArn,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['Policy'] != null
          ? Policy.fromJson(json['Policy'] as Map<String, dynamic>)
          : null,
      policyArn: json['PolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final policyArn = this.policyArn;
    return {
      if (policy != null) 'Policy': policy,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
  }
}

class GetProtectionStatusResponse {
  /// The ID of the Firewall Manager administrator account for this policy.
  final String? adminAccountId;

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
  final String? data;

  /// If you have more objects than the number that you specified for
  /// <code>MaxResults</code> in the request, the response includes a
  /// <code>NextToken</code> value. To list more objects, submit another
  /// <code>GetProtectionStatus</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  ///
  /// Amazon Web Services SDKs provide auto-pagination that identify
  /// <code>NextToken</code> in a response and make subsequent request calls
  /// automatically on your behalf. However, this feature is not supported by
  /// <code>GetProtectionStatus</code>. You must submit subsequent requests with
  /// <code>NextToken</code> using your own processes.
  final String? nextToken;

  /// The service type that is protected by the policy. Currently, this is always
  /// <code>SHIELD_ADVANCED</code>.
  final SecurityServiceType? serviceType;

  GetProtectionStatusResponse({
    this.adminAccountId,
    this.data,
    this.nextToken,
    this.serviceType,
  });

  factory GetProtectionStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetProtectionStatusResponse(
      adminAccountId: json['AdminAccountId'] as String?,
      data: json['Data'] as String?,
      nextToken: json['NextToken'] as String?,
      serviceType: (json['ServiceType'] as String?)?.toSecurityServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccountId = this.adminAccountId;
    final data = this.data;
    final nextToken = this.nextToken;
    final serviceType = this.serviceType;
    return {
      if (adminAccountId != null) 'AdminAccountId': adminAccountId,
      if (data != null) 'Data': data,
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceType != null) 'ServiceType': serviceType.toValue(),
    };
  }
}

class GetProtocolsListResponse {
  /// Information about the specified Firewall Manager protocols list.
  final ProtocolsListData? protocolsList;

  /// The Amazon Resource Name (ARN) of the specified protocols list.
  final String? protocolsListArn;

  GetProtocolsListResponse({
    this.protocolsList,
    this.protocolsListArn,
  });

  factory GetProtocolsListResponse.fromJson(Map<String, dynamic> json) {
    return GetProtocolsListResponse(
      protocolsList: json['ProtocolsList'] != null
          ? ProtocolsListData.fromJson(
              json['ProtocolsList'] as Map<String, dynamic>)
          : null,
      protocolsListArn: json['ProtocolsListArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protocolsList = this.protocolsList;
    final protocolsListArn = this.protocolsListArn;
    return {
      if (protocolsList != null) 'ProtocolsList': protocolsList,
      if (protocolsListArn != null) 'ProtocolsListArn': protocolsListArn,
    };
  }
}

class GetViolationDetailsResponse {
  /// Violation detail for a resource.
  final ViolationDetail? violationDetail;

  GetViolationDetailsResponse({
    this.violationDetail,
  });

  factory GetViolationDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetViolationDetailsResponse(
      violationDetail: json['ViolationDetail'] != null
          ? ViolationDetail.fromJson(
              json['ViolationDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final violationDetail = this.violationDetail;
    return {
      if (violationDetail != null) 'ViolationDetail': violationDetail,
    };
  }
}

class ListAppsListsResponse {
  /// An array of <code>AppsListDataSummary</code> objects.
  final List<AppsListDataSummary>? appsLists;

  /// If you specify a value for <code>MaxResults</code> in your list request, and
  /// you have more objects than the maximum, Firewall Manager returns this token
  /// in the response. You can use this token in subsequent requests to retrieve
  /// the next batch of objects.
  final String? nextToken;

  ListAppsListsResponse({
    this.appsLists,
    this.nextToken,
  });

  factory ListAppsListsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppsListsResponse(
      appsLists: (json['AppsLists'] as List?)
          ?.whereNotNull()
          .map((e) => AppsListDataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appsLists = this.appsLists;
    final nextToken = this.nextToken;
    return {
      if (appsLists != null) 'AppsLists': appsLists,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListComplianceStatusResponse {
  /// If you have more <code>PolicyComplianceStatus</code> objects than the number
  /// that you specified for <code>MaxResults</code> in the request, the response
  /// includes a <code>NextToken</code> value. To list more
  /// <code>PolicyComplianceStatus</code> objects, submit another
  /// <code>ListComplianceStatus</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  final String? nextToken;

  /// An array of <code>PolicyComplianceStatus</code> objects.
  final List<PolicyComplianceStatus>? policyComplianceStatusList;

  ListComplianceStatusResponse({
    this.nextToken,
    this.policyComplianceStatusList,
  });

  factory ListComplianceStatusResponse.fromJson(Map<String, dynamic> json) {
    return ListComplianceStatusResponse(
      nextToken: json['NextToken'] as String?,
      policyComplianceStatusList: (json['PolicyComplianceStatusList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PolicyComplianceStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policyComplianceStatusList = this.policyComplianceStatusList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policyComplianceStatusList != null)
        'PolicyComplianceStatusList': policyComplianceStatusList,
    };
  }
}

class ListMemberAccountsResponse {
  /// An array of account IDs.
  final List<String>? memberAccounts;

  /// If you have more member account IDs than the number that you specified for
  /// <code>MaxResults</code> in the request, the response includes a
  /// <code>NextToken</code> value. To list more IDs, submit another
  /// <code>ListMemberAccounts</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  final String? nextToken;

  ListMemberAccountsResponse({
    this.memberAccounts,
    this.nextToken,
  });

  factory ListMemberAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListMemberAccountsResponse(
      memberAccounts: (json['MemberAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccounts = this.memberAccounts;
    final nextToken = this.nextToken;
    return {
      if (memberAccounts != null) 'MemberAccounts': memberAccounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPoliciesResponse {
  /// If you have more <code>PolicySummary</code> objects than the number that you
  /// specified for <code>MaxResults</code> in the request, the response includes
  /// a <code>NextToken</code> value. To list more <code>PolicySummary</code>
  /// objects, submit another <code>ListPolicies</code> request, and specify the
  /// <code>NextToken</code> value from the response in the <code>NextToken</code>
  /// value in the next request.
  final String? nextToken;

  /// An array of <code>PolicySummary</code> objects.
  final List<PolicySummary>? policyList;

  ListPoliciesResponse({
    this.nextToken,
    this.policyList,
  });

  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      policyList: (json['PolicyList'] as List?)
          ?.whereNotNull()
          .map((e) => PolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policyList = this.policyList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (policyList != null) 'PolicyList': policyList,
    };
  }
}

class ListProtocolsListsResponse {
  /// If you specify a value for <code>MaxResults</code> in your list request, and
  /// you have more objects than the maximum, Firewall Manager returns this token
  /// in the response. You can use this token in subsequent requests to retrieve
  /// the next batch of objects.
  final String? nextToken;

  /// An array of <code>ProtocolsListDataSummary</code> objects.
  final List<ProtocolsListDataSummary>? protocolsLists;

  ListProtocolsListsResponse({
    this.nextToken,
    this.protocolsLists,
  });

  factory ListProtocolsListsResponse.fromJson(Map<String, dynamic> json) {
    return ListProtocolsListsResponse(
      nextToken: json['NextToken'] as String?,
      protocolsLists: (json['ProtocolsLists'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProtocolsListDataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final protocolsLists = this.protocolsLists;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (protocolsLists != null) 'ProtocolsLists': protocolsLists,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  final List<Tag>? tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// Violation detail for an internet gateway route with an inactive state in the
/// customer subnet route table or Network Firewall subnet route table.
class NetworkFirewallBlackHoleRouteDetectedViolation {
  /// Information about the route table ID.
  final String? routeTableId;

  /// Information about the route or routes that are in violation.
  final List<Route>? violatingRoutes;

  /// The subnet that has an inactive state.
  final String? violationTarget;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallBlackHoleRouteDetectedViolation({
    this.routeTableId,
    this.violatingRoutes,
    this.violationTarget,
    this.vpcId,
  });

  factory NetworkFirewallBlackHoleRouteDetectedViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallBlackHoleRouteDetectedViolation(
      routeTableId: json['RouteTableId'] as String?,
      violatingRoutes: (json['ViolatingRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      violationTarget: json['ViolationTarget'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routeTableId = this.routeTableId;
    final violatingRoutes = this.violatingRoutes;
    final violationTarget = this.violationTarget;
    final vpcId = this.vpcId;
    return {
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (violatingRoutes != null) 'ViolatingRoutes': violatingRoutes,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Violation detail for the subnet for which internet traffic that hasn't been
/// inspected.
class NetworkFirewallInternetTrafficNotInspectedViolation {
  /// The actual firewall subnet routes.
  final List<Route>? actualFirewallSubnetRoutes;

  /// The actual internet gateway routes.
  final List<Route>? actualInternetGatewayRoutes;

  /// Information about the subnet route table for the current firewall.
  final String? currentFirewallSubnetRouteTable;

  /// The current route table for the internet gateway.
  final String? currentInternetGatewayRouteTable;

  /// The expected endpoint for the current firewall.
  final String? expectedFirewallEndpoint;

  /// The firewall subnet routes that are expected.
  final List<ExpectedRoute>? expectedFirewallSubnetRoutes;

  /// The internet gateway routes that are expected.
  final List<ExpectedRoute>? expectedInternetGatewayRoutes;

  /// The firewall subnet ID.
  final String? firewallSubnetId;

  /// The internet gateway ID.
  final String? internetGatewayId;

  /// Information about whether the route table is used in another Availability
  /// Zone.
  final bool? isRouteTableUsedInDifferentAZ;

  /// Information about the route table ID.
  final String? routeTableId;

  /// The subnet Availability Zone.
  final String? subnetAvailabilityZone;

  /// The subnet ID.
  final String? subnetId;

  /// The route or routes that are in violation.
  final List<Route>? violatingRoutes;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallInternetTrafficNotInspectedViolation({
    this.actualFirewallSubnetRoutes,
    this.actualInternetGatewayRoutes,
    this.currentFirewallSubnetRouteTable,
    this.currentInternetGatewayRouteTable,
    this.expectedFirewallEndpoint,
    this.expectedFirewallSubnetRoutes,
    this.expectedInternetGatewayRoutes,
    this.firewallSubnetId,
    this.internetGatewayId,
    this.isRouteTableUsedInDifferentAZ,
    this.routeTableId,
    this.subnetAvailabilityZone,
    this.subnetId,
    this.violatingRoutes,
    this.vpcId,
  });

  factory NetworkFirewallInternetTrafficNotInspectedViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallInternetTrafficNotInspectedViolation(
      actualFirewallSubnetRoutes: (json['ActualFirewallSubnetRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      actualInternetGatewayRoutes:
          (json['ActualInternetGatewayRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => Route.fromJson(e as Map<String, dynamic>))
              .toList(),
      currentFirewallSubnetRouteTable:
          json['CurrentFirewallSubnetRouteTable'] as String?,
      currentInternetGatewayRouteTable:
          json['CurrentInternetGatewayRouteTable'] as String?,
      expectedFirewallEndpoint: json['ExpectedFirewallEndpoint'] as String?,
      expectedFirewallSubnetRoutes:
          (json['ExpectedFirewallSubnetRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => ExpectedRoute.fromJson(e as Map<String, dynamic>))
              .toList(),
      expectedInternetGatewayRoutes:
          (json['ExpectedInternetGatewayRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => ExpectedRoute.fromJson(e as Map<String, dynamic>))
              .toList(),
      firewallSubnetId: json['FirewallSubnetId'] as String?,
      internetGatewayId: json['InternetGatewayId'] as String?,
      isRouteTableUsedInDifferentAZ:
          json['IsRouteTableUsedInDifferentAZ'] as bool?,
      routeTableId: json['RouteTableId'] as String?,
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      subnetId: json['SubnetId'] as String?,
      violatingRoutes: (json['ViolatingRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actualFirewallSubnetRoutes = this.actualFirewallSubnetRoutes;
    final actualInternetGatewayRoutes = this.actualInternetGatewayRoutes;
    final currentFirewallSubnetRouteTable =
        this.currentFirewallSubnetRouteTable;
    final currentInternetGatewayRouteTable =
        this.currentInternetGatewayRouteTable;
    final expectedFirewallEndpoint = this.expectedFirewallEndpoint;
    final expectedFirewallSubnetRoutes = this.expectedFirewallSubnetRoutes;
    final expectedInternetGatewayRoutes = this.expectedInternetGatewayRoutes;
    final firewallSubnetId = this.firewallSubnetId;
    final internetGatewayId = this.internetGatewayId;
    final isRouteTableUsedInDifferentAZ = this.isRouteTableUsedInDifferentAZ;
    final routeTableId = this.routeTableId;
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetId = this.subnetId;
    final violatingRoutes = this.violatingRoutes;
    final vpcId = this.vpcId;
    return {
      if (actualFirewallSubnetRoutes != null)
        'ActualFirewallSubnetRoutes': actualFirewallSubnetRoutes,
      if (actualInternetGatewayRoutes != null)
        'ActualInternetGatewayRoutes': actualInternetGatewayRoutes,
      if (currentFirewallSubnetRouteTable != null)
        'CurrentFirewallSubnetRouteTable': currentFirewallSubnetRouteTable,
      if (currentInternetGatewayRouteTable != null)
        'CurrentInternetGatewayRouteTable': currentInternetGatewayRouteTable,
      if (expectedFirewallEndpoint != null)
        'ExpectedFirewallEndpoint': expectedFirewallEndpoint,
      if (expectedFirewallSubnetRoutes != null)
        'ExpectedFirewallSubnetRoutes': expectedFirewallSubnetRoutes,
      if (expectedInternetGatewayRoutes != null)
        'ExpectedInternetGatewayRoutes': expectedInternetGatewayRoutes,
      if (firewallSubnetId != null) 'FirewallSubnetId': firewallSubnetId,
      if (internetGatewayId != null) 'InternetGatewayId': internetGatewayId,
      if (isRouteTableUsedInDifferentAZ != null)
        'IsRouteTableUsedInDifferentAZ': isRouteTableUsedInDifferentAZ,
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetId != null) 'SubnetId': subnetId,
      if (violatingRoutes != null) 'ViolatingRoutes': violatingRoutes,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Violation detail for the improperly configured subnet route. It's possible
/// there is a missing route table route, or a configuration that causes traffic
/// to cross an Availability Zone boundary.
class NetworkFirewallInvalidRouteConfigurationViolation {
  /// The actual firewall endpoint.
  final String? actualFirewallEndpoint;

  /// The actual subnet ID for the firewall.
  final String? actualFirewallSubnetId;

  /// The actual firewall subnet routes that are expected.
  final List<Route>? actualFirewallSubnetRoutes;

  /// The actual internet gateway routes.
  final List<Route>? actualInternetGatewayRoutes;

  /// The subnets that are affected.
  final List<String>? affectedSubnets;

  /// The subnet route table for the current firewall.
  final String? currentFirewallSubnetRouteTable;

  /// The route table for the current internet gateway.
  final String? currentInternetGatewayRouteTable;

  /// The firewall endpoint that's expected.
  final String? expectedFirewallEndpoint;

  /// The expected subnet ID for the firewall.
  final String? expectedFirewallSubnetId;

  /// The firewall subnet routes that are expected.
  final List<ExpectedRoute>? expectedFirewallSubnetRoutes;

  /// The expected routes for the internet gateway.
  final List<ExpectedRoute>? expectedInternetGatewayRoutes;

  /// The internet gateway ID.
  final String? internetGatewayId;

  /// Information about whether the route table is used in another Availability
  /// Zone.
  final bool? isRouteTableUsedInDifferentAZ;

  /// The route table ID.
  final String? routeTableId;

  /// The route that's in violation.
  final Route? violatingRoute;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallInvalidRouteConfigurationViolation({
    this.actualFirewallEndpoint,
    this.actualFirewallSubnetId,
    this.actualFirewallSubnetRoutes,
    this.actualInternetGatewayRoutes,
    this.affectedSubnets,
    this.currentFirewallSubnetRouteTable,
    this.currentInternetGatewayRouteTable,
    this.expectedFirewallEndpoint,
    this.expectedFirewallSubnetId,
    this.expectedFirewallSubnetRoutes,
    this.expectedInternetGatewayRoutes,
    this.internetGatewayId,
    this.isRouteTableUsedInDifferentAZ,
    this.routeTableId,
    this.violatingRoute,
    this.vpcId,
  });

  factory NetworkFirewallInvalidRouteConfigurationViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallInvalidRouteConfigurationViolation(
      actualFirewallEndpoint: json['ActualFirewallEndpoint'] as String?,
      actualFirewallSubnetId: json['ActualFirewallSubnetId'] as String?,
      actualFirewallSubnetRoutes: (json['ActualFirewallSubnetRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      actualInternetGatewayRoutes:
          (json['ActualInternetGatewayRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => Route.fromJson(e as Map<String, dynamic>))
              .toList(),
      affectedSubnets: (json['AffectedSubnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      currentFirewallSubnetRouteTable:
          json['CurrentFirewallSubnetRouteTable'] as String?,
      currentInternetGatewayRouteTable:
          json['CurrentInternetGatewayRouteTable'] as String?,
      expectedFirewallEndpoint: json['ExpectedFirewallEndpoint'] as String?,
      expectedFirewallSubnetId: json['ExpectedFirewallSubnetId'] as String?,
      expectedFirewallSubnetRoutes:
          (json['ExpectedFirewallSubnetRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => ExpectedRoute.fromJson(e as Map<String, dynamic>))
              .toList(),
      expectedInternetGatewayRoutes:
          (json['ExpectedInternetGatewayRoutes'] as List?)
              ?.whereNotNull()
              .map((e) => ExpectedRoute.fromJson(e as Map<String, dynamic>))
              .toList(),
      internetGatewayId: json['InternetGatewayId'] as String?,
      isRouteTableUsedInDifferentAZ:
          json['IsRouteTableUsedInDifferentAZ'] as bool?,
      routeTableId: json['RouteTableId'] as String?,
      violatingRoute: json['ViolatingRoute'] != null
          ? Route.fromJson(json['ViolatingRoute'] as Map<String, dynamic>)
          : null,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actualFirewallEndpoint = this.actualFirewallEndpoint;
    final actualFirewallSubnetId = this.actualFirewallSubnetId;
    final actualFirewallSubnetRoutes = this.actualFirewallSubnetRoutes;
    final actualInternetGatewayRoutes = this.actualInternetGatewayRoutes;
    final affectedSubnets = this.affectedSubnets;
    final currentFirewallSubnetRouteTable =
        this.currentFirewallSubnetRouteTable;
    final currentInternetGatewayRouteTable =
        this.currentInternetGatewayRouteTable;
    final expectedFirewallEndpoint = this.expectedFirewallEndpoint;
    final expectedFirewallSubnetId = this.expectedFirewallSubnetId;
    final expectedFirewallSubnetRoutes = this.expectedFirewallSubnetRoutes;
    final expectedInternetGatewayRoutes = this.expectedInternetGatewayRoutes;
    final internetGatewayId = this.internetGatewayId;
    final isRouteTableUsedInDifferentAZ = this.isRouteTableUsedInDifferentAZ;
    final routeTableId = this.routeTableId;
    final violatingRoute = this.violatingRoute;
    final vpcId = this.vpcId;
    return {
      if (actualFirewallEndpoint != null)
        'ActualFirewallEndpoint': actualFirewallEndpoint,
      if (actualFirewallSubnetId != null)
        'ActualFirewallSubnetId': actualFirewallSubnetId,
      if (actualFirewallSubnetRoutes != null)
        'ActualFirewallSubnetRoutes': actualFirewallSubnetRoutes,
      if (actualInternetGatewayRoutes != null)
        'ActualInternetGatewayRoutes': actualInternetGatewayRoutes,
      if (affectedSubnets != null) 'AffectedSubnets': affectedSubnets,
      if (currentFirewallSubnetRouteTable != null)
        'CurrentFirewallSubnetRouteTable': currentFirewallSubnetRouteTable,
      if (currentInternetGatewayRouteTable != null)
        'CurrentInternetGatewayRouteTable': currentInternetGatewayRouteTable,
      if (expectedFirewallEndpoint != null)
        'ExpectedFirewallEndpoint': expectedFirewallEndpoint,
      if (expectedFirewallSubnetId != null)
        'ExpectedFirewallSubnetId': expectedFirewallSubnetId,
      if (expectedFirewallSubnetRoutes != null)
        'ExpectedFirewallSubnetRoutes': expectedFirewallSubnetRoutes,
      if (expectedInternetGatewayRoutes != null)
        'ExpectedInternetGatewayRoutes': expectedInternetGatewayRoutes,
      if (internetGatewayId != null) 'InternetGatewayId': internetGatewayId,
      if (isRouteTableUsedInDifferentAZ != null)
        'IsRouteTableUsedInDifferentAZ': isRouteTableUsedInDifferentAZ,
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (violatingRoute != null) 'ViolatingRoute': violatingRoute,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Violation detail for Network Firewall for a subnet that's not associated to
/// the expected Firewall Manager managed route table.
class NetworkFirewallMissingExpectedRTViolation {
  /// The Availability Zone of a violating subnet.
  final String? availabilityZone;

  /// The resource ID of the current route table that's associated with the
  /// subnet, if one is available.
  final String? currentRouteTable;

  /// The resource ID of the route table that should be associated with the
  /// subnet.
  final String? expectedRouteTable;

  /// The resource ID of the VPC associated with a violating subnet.
  final String? vpc;

  /// The ID of the Network Firewall or VPC resource that's in violation.
  final String? violationTarget;

  NetworkFirewallMissingExpectedRTViolation({
    this.availabilityZone,
    this.currentRouteTable,
    this.expectedRouteTable,
    this.vpc,
    this.violationTarget,
  });

  factory NetworkFirewallMissingExpectedRTViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallMissingExpectedRTViolation(
      availabilityZone: json['AvailabilityZone'] as String?,
      currentRouteTable: json['CurrentRouteTable'] as String?,
      expectedRouteTable: json['ExpectedRouteTable'] as String?,
      vpc: json['VPC'] as String?,
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final currentRouteTable = this.currentRouteTable;
    final expectedRouteTable = this.expectedRouteTable;
    final vpc = this.vpc;
    final violationTarget = this.violationTarget;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (currentRouteTable != null) 'CurrentRouteTable': currentRouteTable,
      if (expectedRouteTable != null) 'ExpectedRouteTable': expectedRouteTable,
      if (vpc != null) 'VPC': vpc,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// Violation detail for an expected route missing in Network Firewall.
class NetworkFirewallMissingExpectedRoutesViolation {
  /// The expected routes.
  final List<ExpectedRoute>? expectedRoutes;

  /// The target of the violation.
  final String? violationTarget;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallMissingExpectedRoutesViolation({
    this.expectedRoutes,
    this.violationTarget,
    this.vpcId,
  });

  factory NetworkFirewallMissingExpectedRoutesViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallMissingExpectedRoutesViolation(
      expectedRoutes: (json['ExpectedRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => ExpectedRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      violationTarget: json['ViolationTarget'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expectedRoutes = this.expectedRoutes;
    final violationTarget = this.violationTarget;
    final vpcId = this.vpcId;
    return {
      if (expectedRoutes != null) 'ExpectedRoutes': expectedRoutes,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Violation detail for Network Firewall for a subnet that doesn't have a
/// Firewall Manager managed firewall in its VPC.
class NetworkFirewallMissingFirewallViolation {
  /// The Availability Zone of a violating subnet.
  final String? availabilityZone;

  /// The reason the resource has this violation, if one is available.
  final String? targetViolationReason;

  /// The resource ID of the VPC associated with a violating subnet.
  final String? vpc;

  /// The ID of the Network Firewall or VPC resource that's in violation.
  final String? violationTarget;

  NetworkFirewallMissingFirewallViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });

  factory NetworkFirewallMissingFirewallViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallMissingFirewallViolation(
      availabilityZone: json['AvailabilityZone'] as String?,
      targetViolationReason: json['TargetViolationReason'] as String?,
      vpc: json['VPC'] as String?,
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final targetViolationReason = this.targetViolationReason;
    final vpc = this.vpc;
    final violationTarget = this.violationTarget;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (targetViolationReason != null)
        'TargetViolationReason': targetViolationReason,
      if (vpc != null) 'VPC': vpc,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// Violation detail for Network Firewall for an Availability Zone that's
/// missing the expected Firewall Manager managed subnet.
class NetworkFirewallMissingSubnetViolation {
  /// The Availability Zone of a violating subnet.
  final String? availabilityZone;

  /// The reason the resource has this violation, if one is available.
  final String? targetViolationReason;

  /// The resource ID of the VPC associated with a violating subnet.
  final String? vpc;

  /// The ID of the Network Firewall or VPC resource that's in violation.
  final String? violationTarget;

  NetworkFirewallMissingSubnetViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });

  factory NetworkFirewallMissingSubnetViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallMissingSubnetViolation(
      availabilityZone: json['AvailabilityZone'] as String?,
      targetViolationReason: json['TargetViolationReason'] as String?,
      vpc: json['VPC'] as String?,
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final targetViolationReason = this.targetViolationReason;
    final vpc = this.vpc;
    final violationTarget = this.violationTarget;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (targetViolationReason != null)
        'TargetViolationReason': targetViolationReason,
      if (vpc != null) 'VPC': vpc,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// The definition of the Network Firewall firewall policy.
class NetworkFirewallPolicyDescription {
  /// The stateful rule groups that are used in the Network Firewall firewall
  /// policy.
  final List<StatefulRuleGroup>? statefulRuleGroups;

  /// Names of custom actions that are available for use in the stateless default
  /// actions settings.
  final List<String>? statelessCustomActions;

  /// The actions to take on packets that don't match any of the stateless rule
  /// groups.
  final List<String>? statelessDefaultActions;

  /// The actions to take on packet fragments that don't match any of the
  /// stateless rule groups.
  final List<String>? statelessFragmentDefaultActions;

  /// The stateless rule groups that are used in the Network Firewall firewall
  /// policy.
  final List<StatelessRuleGroup>? statelessRuleGroups;

  NetworkFirewallPolicyDescription({
    this.statefulRuleGroups,
    this.statelessCustomActions,
    this.statelessDefaultActions,
    this.statelessFragmentDefaultActions,
    this.statelessRuleGroups,
  });

  factory NetworkFirewallPolicyDescription.fromJson(Map<String, dynamic> json) {
    return NetworkFirewallPolicyDescription(
      statefulRuleGroups: (json['StatefulRuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) => StatefulRuleGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      statelessCustomActions: (json['StatelessCustomActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statelessDefaultActions: (json['StatelessDefaultActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statelessFragmentDefaultActions:
          (json['StatelessFragmentDefaultActions'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      statelessRuleGroups: (json['StatelessRuleGroups'] as List?)
          ?.whereNotNull()
          .map((e) => StatelessRuleGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statefulRuleGroups = this.statefulRuleGroups;
    final statelessCustomActions = this.statelessCustomActions;
    final statelessDefaultActions = this.statelessDefaultActions;
    final statelessFragmentDefaultActions =
        this.statelessFragmentDefaultActions;
    final statelessRuleGroups = this.statelessRuleGroups;
    return {
      if (statefulRuleGroups != null) 'StatefulRuleGroups': statefulRuleGroups,
      if (statelessCustomActions != null)
        'StatelessCustomActions': statelessCustomActions,
      if (statelessDefaultActions != null)
        'StatelessDefaultActions': statelessDefaultActions,
      if (statelessFragmentDefaultActions != null)
        'StatelessFragmentDefaultActions': statelessFragmentDefaultActions,
      if (statelessRuleGroups != null)
        'StatelessRuleGroups': statelessRuleGroups,
    };
  }
}

/// Violation detail for Network Firewall for a firewall policy that has a
/// different <a>NetworkFirewallPolicyDescription</a> than is required by the
/// Firewall Manager policy.
class NetworkFirewallPolicyModifiedViolation {
  /// The policy that's currently in use in the individual account.
  final NetworkFirewallPolicyDescription? currentPolicyDescription;

  /// The policy that should be in use in the individual account in order to be
  /// compliant.
  final NetworkFirewallPolicyDescription? expectedPolicyDescription;

  /// The ID of the Network Firewall or VPC resource that's in violation.
  final String? violationTarget;

  NetworkFirewallPolicyModifiedViolation({
    this.currentPolicyDescription,
    this.expectedPolicyDescription,
    this.violationTarget,
  });

  factory NetworkFirewallPolicyModifiedViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallPolicyModifiedViolation(
      currentPolicyDescription: json['CurrentPolicyDescription'] != null
          ? NetworkFirewallPolicyDescription.fromJson(
              json['CurrentPolicyDescription'] as Map<String, dynamic>)
          : null,
      expectedPolicyDescription: json['ExpectedPolicyDescription'] != null
          ? NetworkFirewallPolicyDescription.fromJson(
              json['ExpectedPolicyDescription'] as Map<String, dynamic>)
          : null,
      violationTarget: json['ViolationTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentPolicyDescription = this.currentPolicyDescription;
    final expectedPolicyDescription = this.expectedPolicyDescription;
    final violationTarget = this.violationTarget;
    return {
      if (currentPolicyDescription != null)
        'CurrentPolicyDescription': currentPolicyDescription,
      if (expectedPolicyDescription != null)
        'ExpectedPolicyDescription': expectedPolicyDescription,
      if (violationTarget != null) 'ViolationTarget': violationTarget,
    };
  }
}

/// Violation detail for an unexpected route that's present in a route table.
class NetworkFirewallUnexpectedFirewallRoutesViolation {
  /// The endpoint of the firewall.
  final String? firewallEndpoint;

  /// The subnet ID for the firewall.
  final String? firewallSubnetId;

  /// The ID of the route table.
  final String? routeTableId;

  /// The routes that are in violation.
  final List<Route>? violatingRoutes;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallUnexpectedFirewallRoutesViolation({
    this.firewallEndpoint,
    this.firewallSubnetId,
    this.routeTableId,
    this.violatingRoutes,
    this.vpcId,
  });

  factory NetworkFirewallUnexpectedFirewallRoutesViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallUnexpectedFirewallRoutesViolation(
      firewallEndpoint: json['FirewallEndpoint'] as String?,
      firewallSubnetId: json['FirewallSubnetId'] as String?,
      routeTableId: json['RouteTableId'] as String?,
      violatingRoutes: (json['ViolatingRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallEndpoint = this.firewallEndpoint;
    final firewallSubnetId = this.firewallSubnetId;
    final routeTableId = this.routeTableId;
    final violatingRoutes = this.violatingRoutes;
    final vpcId = this.vpcId;
    return {
      if (firewallEndpoint != null) 'FirewallEndpoint': firewallEndpoint,
      if (firewallSubnetId != null) 'FirewallSubnetId': firewallSubnetId,
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (violatingRoutes != null) 'ViolatingRoutes': violatingRoutes,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// Violation detail for an unexpected gateway route that’s present in a route
/// table.
class NetworkFirewallUnexpectedGatewayRoutesViolation {
  /// Information about the gateway ID.
  final String? gatewayId;

  /// Information about the route table.
  final String? routeTableId;

  /// The routes that are in violation.
  final List<Route>? violatingRoutes;

  /// Information about the VPC ID.
  final String? vpcId;

  NetworkFirewallUnexpectedGatewayRoutesViolation({
    this.gatewayId,
    this.routeTableId,
    this.violatingRoutes,
    this.vpcId,
  });

  factory NetworkFirewallUnexpectedGatewayRoutesViolation.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallUnexpectedGatewayRoutesViolation(
      gatewayId: json['GatewayId'] as String?,
      routeTableId: json['RouteTableId'] as String?,
      violatingRoutes: (json['ViolatingRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayId = this.gatewayId;
    final routeTableId = this.routeTableId;
    final violatingRoutes = this.violatingRoutes;
    final vpcId = this.vpcId;
    return {
      if (gatewayId != null) 'GatewayId': gatewayId,
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (violatingRoutes != null) 'ViolatingRoutes': violatingRoutes,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The reference rule that partially matches the <code>ViolationTarget</code>
/// rule and violation reason.
class PartialMatch {
  /// The reference rule from the primary security group of the Firewall Manager
  /// policy.
  final String? reference;

  /// The violation reason.
  final List<String>? targetViolationReasons;

  PartialMatch({
    this.reference,
    this.targetViolationReasons,
  });

  factory PartialMatch.fromJson(Map<String, dynamic> json) {
    return PartialMatch(
      reference: json['Reference'] as String?,
      targetViolationReasons: (json['TargetViolationReasons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reference = this.reference;
    final targetViolationReasons = this.targetViolationReasons;
    return {
      if (reference != null) 'Reference': reference,
      if (targetViolationReasons != null)
        'TargetViolationReasons': targetViolationReasons,
    };
  }
}

/// An Firewall Manager policy.
class Policy {
  /// If set to <code>True</code>, resources with the tags that are specified in
  /// the <code>ResourceTag</code> array are not in scope of the policy. If set to
  /// <code>False</code>, and the <code>ResourceTag</code> array is not null, only
  /// resources with the specified tags are in scope of the policy.
  final bool excludeResourceTags;

  /// The name of the Firewall Manager policy.
  final String policyName;

  /// Indicates if the policy should be automatically applied to new resources.
  final bool remediationEnabled;

  /// The type of resource protected by or in scope of the policy. This is in the
  /// format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a>. To apply this policy to multiple
  /// resource types, specify a resource type of <code>ResourceTypeList</code> and
  /// then specify the resource types in a <code>ResourceTypeList</code>.
  ///
  /// For WAF and Shield Advanced, example resource types include
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and
  /// <code>AWS::CloudFront::Distribution</code>. For a security group common
  /// policy, valid values are <code>AWS::EC2::NetworkInterface</code> and
  /// <code>AWS::EC2::Instance</code>. For a security group content audit policy,
  /// valid values are <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::EC2::NetworkInterface</code>, and
  /// <code>AWS::EC2::Instance</code>. For a security group usage audit policy,
  /// the value is <code>AWS::EC2::SecurityGroup</code>. For an Network Firewall
  /// policy or DNS Firewall policy, the value is <code>AWS::EC2::VPC</code>.
  final String resourceType;

  /// Details about the security service that is being used to protect the
  /// resources.
  final SecurityServicePolicyData securityServicePolicyData;

  /// Specifies the Amazon Web Services account IDs and Organizations
  /// organizational units (OUs) to exclude from the policy. Specifying an OU is
  /// the equivalent of specifying all accounts in the OU and in any of its child
  /// OUs, including any child OUs and accounts that are added at a later time.
  ///
  /// You can specify inclusions or exclusions, but not both. If you specify an
  /// <code>IncludeMap</code>, Firewall Manager applies the policy to all accounts
  /// specified by the <code>IncludeMap</code>, and does not evaluate any
  /// <code>ExcludeMap</code> specifications. If you do not specify an
  /// <code>IncludeMap</code>, then Firewall Manager applies the policy to all
  /// accounts except for those specified by the <code>ExcludeMap</code>.
  ///
  /// You can specify account IDs, OUs, or a combination:
  ///
  /// <ul>
  /// <li>
  /// Specify account IDs by setting the key to <code>ACCOUNT</code>. For example,
  /// the following is a valid map: <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”]}</code>.
  /// </li>
  /// <li>
  /// Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the
  /// following is a valid map: <code>{“ORG_UNIT” : [“ouid111”,
  /// “ouid112”]}</code>.
  /// </li>
  /// <li>
  /// Specify accounts and OUs together in a single map, separated with a comma.
  /// For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”], “ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.
  /// </li>
  /// </ul>
  final Map<CustomerPolicyScopeIdType, List<String>>? excludeMap;

  /// Specifies the Amazon Web Services account IDs and Organizations
  /// organizational units (OUs) to include in the policy. Specifying an OU is the
  /// equivalent of specifying all accounts in the OU and in any of its child OUs,
  /// including any child OUs and accounts that are added at a later time.
  ///
  /// You can specify inclusions or exclusions, but not both. If you specify an
  /// <code>IncludeMap</code>, Firewall Manager applies the policy to all accounts
  /// specified by the <code>IncludeMap</code>, and does not evaluate any
  /// <code>ExcludeMap</code> specifications. If you do not specify an
  /// <code>IncludeMap</code>, then Firewall Manager applies the policy to all
  /// accounts except for those specified by the <code>ExcludeMap</code>.
  ///
  /// You can specify account IDs, OUs, or a combination:
  ///
  /// <ul>
  /// <li>
  /// Specify account IDs by setting the key to <code>ACCOUNT</code>. For example,
  /// the following is a valid map: <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”]}</code>.
  /// </li>
  /// <li>
  /// Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the
  /// following is a valid map: <code>{“ORG_UNIT” : [“ouid111”,
  /// “ouid112”]}</code>.
  /// </li>
  /// <li>
  /// Specify accounts and OUs together in a single map, separated with a comma.
  /// For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”,
  /// “accountID2”], “ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.
  /// </li>
  /// </ul>
  final Map<CustomerPolicyScopeIdType, List<String>>? includeMap;

  /// The ID of the Firewall Manager policy.
  final String? policyId;

  /// A unique identifier for each update to the policy. When issuing a
  /// <code>PutPolicy</code> request, the <code>PolicyUpdateToken</code> in the
  /// request must match the <code>PolicyUpdateToken</code> of the current policy
  /// version. To get the <code>PolicyUpdateToken</code> of the current policy
  /// version, use a <code>GetPolicy</code> request.
  final String? policyUpdateToken;

  /// An array of <code>ResourceTag</code> objects.
  final List<ResourceTag>? resourceTags;

  /// An array of <code>ResourceType</code> objects. Use this only to specify
  /// multiple resource types. To specify a single resource type, use
  /// <code>ResourceType</code>.
  final List<String>? resourceTypeList;

  Policy({
    required this.excludeResourceTags,
    required this.policyName,
    required this.remediationEnabled,
    required this.resourceType,
    required this.securityServicePolicyData,
    this.excludeMap,
    this.includeMap,
    this.policyId,
    this.policyUpdateToken,
    this.resourceTags,
    this.resourceTypeList,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      excludeResourceTags: json['ExcludeResourceTags'] as bool,
      policyName: json['PolicyName'] as String,
      remediationEnabled: json['RemediationEnabled'] as bool,
      resourceType: json['ResourceType'] as String,
      securityServicePolicyData: SecurityServicePolicyData.fromJson(
          json['SecurityServicePolicyData'] as Map<String, dynamic>),
      excludeMap: (json['ExcludeMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toCustomerPolicyScopeIdType(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
      includeMap: (json['IncludeMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toCustomerPolicyScopeIdType(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
      policyId: json['PolicyId'] as String?,
      policyUpdateToken: json['PolicyUpdateToken'] as String?,
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceTypeList: (json['ResourceTypeList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludeResourceTags = this.excludeResourceTags;
    final policyName = this.policyName;
    final remediationEnabled = this.remediationEnabled;
    final resourceType = this.resourceType;
    final securityServicePolicyData = this.securityServicePolicyData;
    final excludeMap = this.excludeMap;
    final includeMap = this.includeMap;
    final policyId = this.policyId;
    final policyUpdateToken = this.policyUpdateToken;
    final resourceTags = this.resourceTags;
    final resourceTypeList = this.resourceTypeList;
    return {
      'ExcludeResourceTags': excludeResourceTags,
      'PolicyName': policyName,
      'RemediationEnabled': remediationEnabled,
      'ResourceType': resourceType,
      'SecurityServicePolicyData': securityServicePolicyData,
      if (excludeMap != null)
        'ExcludeMap': excludeMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (includeMap != null)
        'IncludeMap': includeMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (policyId != null) 'PolicyId': policyId,
      if (policyUpdateToken != null) 'PolicyUpdateToken': policyUpdateToken,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceTypeList != null) 'ResourceTypeList': resourceTypeList,
    };
  }
}

/// Describes the noncompliant resources in a member account for a specific
/// Firewall Manager policy. A maximum of 100 entries are displayed. If more
/// than 100 resources are noncompliant, <code>EvaluationLimitExceeded</code> is
/// set to <code>True</code>.
class PolicyComplianceDetail {
  /// Indicates if over 100 resources are noncompliant with the Firewall Manager
  /// policy.
  final bool? evaluationLimitExceeded;

  /// A timestamp that indicates when the returned information should be
  /// considered out of date.
  final DateTime? expiredAt;

  /// Details about problems with dependent services, such as WAF or Config, and
  /// the error message received that indicates the problem with the service.
  final Map<DependentServiceName, String>? issueInfoMap;

  /// The Amazon Web Services account ID.
  final String? memberAccount;

  /// The ID of the Firewall Manager policy.
  final String? policyId;

  /// The Amazon Web Services account that created the Firewall Manager policy.
  final String? policyOwner;

  /// An array of resources that aren't protected by the WAF or Shield Advanced
  /// policy or that aren't in compliance with the security group policy.
  final List<ComplianceViolator>? violators;

  PolicyComplianceDetail({
    this.evaluationLimitExceeded,
    this.expiredAt,
    this.issueInfoMap,
    this.memberAccount,
    this.policyId,
    this.policyOwner,
    this.violators,
  });

  factory PolicyComplianceDetail.fromJson(Map<String, dynamic> json) {
    return PolicyComplianceDetail(
      evaluationLimitExceeded: json['EvaluationLimitExceeded'] as bool?,
      expiredAt: timeStampFromJson(json['ExpiredAt']),
      issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDependentServiceName(), e as String)),
      memberAccount: json['MemberAccount'] as String?,
      policyId: json['PolicyId'] as String?,
      policyOwner: json['PolicyOwner'] as String?,
      violators: (json['Violators'] as List?)
          ?.whereNotNull()
          .map((e) => ComplianceViolator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationLimitExceeded = this.evaluationLimitExceeded;
    final expiredAt = this.expiredAt;
    final issueInfoMap = this.issueInfoMap;
    final memberAccount = this.memberAccount;
    final policyId = this.policyId;
    final policyOwner = this.policyOwner;
    final violators = this.violators;
    return {
      if (evaluationLimitExceeded != null)
        'EvaluationLimitExceeded': evaluationLimitExceeded,
      if (expiredAt != null) 'ExpiredAt': unixTimestampToJson(expiredAt),
      if (issueInfoMap != null)
        'IssueInfoMap': issueInfoMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (memberAccount != null) 'MemberAccount': memberAccount,
      if (policyId != null) 'PolicyId': policyId,
      if (policyOwner != null) 'PolicyOwner': policyOwner,
      if (violators != null) 'Violators': violators,
    };
  }
}

/// Indicates whether the account is compliant with the specified policy. An
/// account is considered noncompliant if it includes resources that are not
/// protected by the policy, for WAF and Shield Advanced policies, or that are
/// noncompliant with the policy, for security group policies.
class PolicyComplianceStatus {
  /// An array of <code>EvaluationResult</code> objects.
  final List<EvaluationResult>? evaluationResults;

  /// Details about problems with dependent services, such as WAF or Config, and
  /// the error message received that indicates the problem with the service.
  final Map<DependentServiceName, String>? issueInfoMap;

  /// Timestamp of the last update to the <code>EvaluationResult</code> objects.
  final DateTime? lastUpdated;

  /// The member account ID.
  final String? memberAccount;

  /// The ID of the Firewall Manager policy.
  final String? policyId;

  /// The name of the Firewall Manager policy.
  final String? policyName;

  /// The Amazon Web Services account that created the Firewall Manager policy.
  final String? policyOwner;

  PolicyComplianceStatus({
    this.evaluationResults,
    this.issueInfoMap,
    this.lastUpdated,
    this.memberAccount,
    this.policyId,
    this.policyName,
    this.policyOwner,
  });

  factory PolicyComplianceStatus.fromJson(Map<String, dynamic> json) {
    return PolicyComplianceStatus(
      evaluationResults: (json['EvaluationResults'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueInfoMap: (json['IssueInfoMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toDependentServiceName(), e as String)),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      memberAccount: json['MemberAccount'] as String?,
      policyId: json['PolicyId'] as String?,
      policyName: json['PolicyName'] as String?,
      policyOwner: json['PolicyOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResults = this.evaluationResults;
    final issueInfoMap = this.issueInfoMap;
    final lastUpdated = this.lastUpdated;
    final memberAccount = this.memberAccount;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final policyOwner = this.policyOwner;
    return {
      if (evaluationResults != null) 'EvaluationResults': evaluationResults,
      if (issueInfoMap != null)
        'IssueInfoMap': issueInfoMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (memberAccount != null) 'MemberAccount': memberAccount,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (policyOwner != null) 'PolicyOwner': policyOwner,
    };
  }
}

enum PolicyComplianceStatusType {
  compliant,
  nonCompliant,
}

extension on PolicyComplianceStatusType {
  String toValue() {
    switch (this) {
      case PolicyComplianceStatusType.compliant:
        return 'COMPLIANT';
      case PolicyComplianceStatusType.nonCompliant:
        return 'NON_COMPLIANT';
    }
  }
}

extension on String {
  PolicyComplianceStatusType toPolicyComplianceStatusType() {
    switch (this) {
      case 'COMPLIANT':
        return PolicyComplianceStatusType.compliant;
      case 'NON_COMPLIANT':
        return PolicyComplianceStatusType.nonCompliant;
    }
    throw Exception('$this is not known in enum PolicyComplianceStatusType');
  }
}

/// Details of the Firewall Manager policy.
class PolicySummary {
  /// The Amazon Resource Name (ARN) of the specified policy.
  final String? policyArn;

  /// The ID of the specified policy.
  final String? policyId;

  /// The name of the specified policy.
  final String? policyName;

  /// Indicates if the policy should be automatically applied to new resources.
  final bool? remediationEnabled;

  /// The type of resource protected by or in scope of the policy. This is in the
  /// format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a>. For WAF and Shield Advanced,
  /// examples include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and
  /// <code>AWS::CloudFront::Distribution</code>. For a security group common
  /// policy, valid values are <code>AWS::EC2::NetworkInterface</code> and
  /// <code>AWS::EC2::Instance</code>. For a security group content audit policy,
  /// valid values are <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::EC2::NetworkInterface</code>, and
  /// <code>AWS::EC2::Instance</code>. For a security group usage audit policy,
  /// the value is <code>AWS::EC2::SecurityGroup</code>. For an Network Firewall
  /// policy or DNS Firewall policy, the value is <code>AWS::EC2::VPC</code>.
  final String? resourceType;

  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either an WAF policy, a Shield
  /// Advanced policy, or a security group policy.
  final SecurityServiceType? securityServiceType;

  PolicySummary({
    this.policyArn,
    this.policyId,
    this.policyName,
    this.remediationEnabled,
    this.resourceType,
    this.securityServiceType,
  });

  factory PolicySummary.fromJson(Map<String, dynamic> json) {
    return PolicySummary(
      policyArn: json['PolicyArn'] as String?,
      policyId: json['PolicyId'] as String?,
      policyName: json['PolicyName'] as String?,
      remediationEnabled: json['RemediationEnabled'] as bool?,
      resourceType: json['ResourceType'] as String?,
      securityServiceType:
          (json['SecurityServiceType'] as String?)?.toSecurityServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final remediationEnabled = this.remediationEnabled;
    final resourceType = this.resourceType;
    final securityServiceType = this.securityServiceType;
    return {
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (remediationEnabled != null) 'RemediationEnabled': remediationEnabled,
      if (resourceType != null) 'ResourceType': resourceType,
      if (securityServiceType != null)
        'SecurityServiceType': securityServiceType.toValue(),
    };
  }
}

/// A list of remediation actions.
class PossibleRemediationAction {
  /// The ordered list of remediation actions.
  final List<RemediationActionWithOrder> orderedRemediationActions;

  /// A description of the list of remediation actions.
  final String? description;

  /// Information about whether an action is taken by default.
  final bool? isDefaultAction;

  PossibleRemediationAction({
    required this.orderedRemediationActions,
    this.description,
    this.isDefaultAction,
  });

  factory PossibleRemediationAction.fromJson(Map<String, dynamic> json) {
    return PossibleRemediationAction(
      orderedRemediationActions: (json['OrderedRemediationActions'] as List)
          .whereNotNull()
          .map((e) =>
              RemediationActionWithOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      isDefaultAction: json['IsDefaultAction'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final orderedRemediationActions = this.orderedRemediationActions;
    final description = this.description;
    final isDefaultAction = this.isDefaultAction;
    return {
      'OrderedRemediationActions': orderedRemediationActions,
      if (description != null) 'Description': description,
      if (isDefaultAction != null) 'IsDefaultAction': isDefaultAction,
    };
  }
}

/// A list of possible remediation action lists. Each individual possible
/// remediation action is a list of individual remediation actions.
class PossibleRemediationActions {
  /// Information about the actions.
  final List<PossibleRemediationAction>? actions;

  /// A description of the possible remediation actions list.
  final String? description;

  PossibleRemediationActions({
    this.actions,
    this.description,
  });

  factory PossibleRemediationActions.fromJson(Map<String, dynamic> json) {
    return PossibleRemediationActions(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PossibleRemediationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final description = this.description;
    return {
      if (actions != null) 'Actions': actions,
      if (description != null) 'Description': description,
    };
  }
}

/// An Firewall Manager protocols list.
class ProtocolsListData {
  /// The name of the Firewall Manager protocols list.
  final String listName;

  /// An array of protocols in the Firewall Manager protocols list.
  final List<String> protocolsList;

  /// The time that the Firewall Manager protocols list was created.
  final DateTime? createTime;

  /// The time that the Firewall Manager protocols list was last updated.
  final DateTime? lastUpdateTime;

  /// The ID of the Firewall Manager protocols list.
  final String? listId;

  /// A unique identifier for each update to the list. When you update the list,
  /// the update token must match the token of the current version of the
  /// application list. You can retrieve the update token by getting the list.
  final String? listUpdateToken;

  /// A map of previous version numbers to their corresponding protocol arrays.
  final Map<String, List<String>>? previousProtocolsList;

  ProtocolsListData({
    required this.listName,
    required this.protocolsList,
    this.createTime,
    this.lastUpdateTime,
    this.listId,
    this.listUpdateToken,
    this.previousProtocolsList,
  });

  factory ProtocolsListData.fromJson(Map<String, dynamic> json) {
    return ProtocolsListData(
      listName: json['ListName'] as String,
      protocolsList: (json['ProtocolsList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      createTime: timeStampFromJson(json['CreateTime']),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      listId: json['ListId'] as String?,
      listUpdateToken: json['ListUpdateToken'] as String?,
      previousProtocolsList: (json['PreviousProtocolsList']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final listName = this.listName;
    final protocolsList = this.protocolsList;
    final createTime = this.createTime;
    final lastUpdateTime = this.lastUpdateTime;
    final listId = this.listId;
    final listUpdateToken = this.listUpdateToken;
    final previousProtocolsList = this.previousProtocolsList;
    return {
      'ListName': listName,
      'ProtocolsList': protocolsList,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (listId != null) 'ListId': listId,
      if (listUpdateToken != null) 'ListUpdateToken': listUpdateToken,
      if (previousProtocolsList != null)
        'PreviousProtocolsList': previousProtocolsList,
    };
  }
}

/// Details of the Firewall Manager protocols list.
class ProtocolsListDataSummary {
  /// The Amazon Resource Name (ARN) of the specified protocols list.
  final String? listArn;

  /// The ID of the specified protocols list.
  final String? listId;

  /// The name of the specified protocols list.
  final String? listName;

  /// An array of protocols in the Firewall Manager protocols list.
  final List<String>? protocolsList;

  ProtocolsListDataSummary({
    this.listArn,
    this.listId,
    this.listName,
    this.protocolsList,
  });

  factory ProtocolsListDataSummary.fromJson(Map<String, dynamic> json) {
    return ProtocolsListDataSummary(
      listArn: json['ListArn'] as String?,
      listId: json['ListId'] as String?,
      listName: json['ListName'] as String?,
      protocolsList: (json['ProtocolsList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listArn = this.listArn;
    final listId = this.listId;
    final listName = this.listName;
    final protocolsList = this.protocolsList;
    return {
      if (listArn != null) 'ListArn': listArn,
      if (listId != null) 'ListId': listId,
      if (listName != null) 'ListName': listName,
      if (protocolsList != null) 'ProtocolsList': protocolsList,
    };
  }
}

class PutAppsListResponse {
  /// The details of the Firewall Manager applications list.
  final AppsListData? appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  final String? appsListArn;

  PutAppsListResponse({
    this.appsList,
    this.appsListArn,
  });

  factory PutAppsListResponse.fromJson(Map<String, dynamic> json) {
    return PutAppsListResponse(
      appsList: json['AppsList'] != null
          ? AppsListData.fromJson(json['AppsList'] as Map<String, dynamic>)
          : null,
      appsListArn: json['AppsListArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appsList = this.appsList;
    final appsListArn = this.appsListArn;
    return {
      if (appsList != null) 'AppsList': appsList,
      if (appsListArn != null) 'AppsListArn': appsListArn,
    };
  }
}

class PutPolicyResponse {
  /// The details of the Firewall Manager policy.
  final Policy? policy;

  /// The Amazon Resource Name (ARN) of the policy.
  final String? policyArn;

  PutPolicyResponse({
    this.policy,
    this.policyArn,
  });

  factory PutPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutPolicyResponse(
      policy: json['Policy'] != null
          ? Policy.fromJson(json['Policy'] as Map<String, dynamic>)
          : null,
      policyArn: json['PolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final policyArn = this.policyArn;
    return {
      if (policy != null) 'Policy': policy,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
  }
}

class PutProtocolsListResponse {
  /// The details of the Firewall Manager protocols list.
  final ProtocolsListData? protocolsList;

  /// The Amazon Resource Name (ARN) of the protocols list.
  final String? protocolsListArn;

  PutProtocolsListResponse({
    this.protocolsList,
    this.protocolsListArn,
  });

  factory PutProtocolsListResponse.fromJson(Map<String, dynamic> json) {
    return PutProtocolsListResponse(
      protocolsList: json['ProtocolsList'] != null
          ? ProtocolsListData.fromJson(
              json['ProtocolsList'] as Map<String, dynamic>)
          : null,
      protocolsListArn: json['ProtocolsListArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protocolsList = this.protocolsList;
    final protocolsListArn = this.protocolsListArn;
    return {
      if (protocolsList != null) 'ProtocolsList': protocolsList,
      if (protocolsListArn != null) 'ProtocolsListArn': protocolsListArn,
    };
  }
}

/// Information about an individual action you can take to remediate a
/// violation.
class RemediationAction {
  /// A description of a remediation action.
  final String? description;

  /// Information about the AssociateRouteTable action in the Amazon EC2 API.
  final EC2AssociateRouteTableAction? eC2AssociateRouteTableAction;

  /// Information about the CopyRouteTable action in the Amazon EC2 API.
  final EC2CopyRouteTableAction? eC2CopyRouteTableAction;

  /// Information about the CreateRoute action in the Amazon EC2 API.
  final EC2CreateRouteAction? eC2CreateRouteAction;

  /// Information about the CreateRouteTable action in the Amazon EC2 API.
  final EC2CreateRouteTableAction? eC2CreateRouteTableAction;

  /// Information about the DeleteRoute action in the Amazon EC2 API.
  final EC2DeleteRouteAction? eC2DeleteRouteAction;

  /// Information about the ReplaceRoute action in the Amazon EC2 API.
  final EC2ReplaceRouteAction? eC2ReplaceRouteAction;

  /// Information about the ReplaceRouteTableAssociation action in the Amazon EC2
  /// API.
  final EC2ReplaceRouteTableAssociationAction?
      eC2ReplaceRouteTableAssociationAction;

  RemediationAction({
    this.description,
    this.eC2AssociateRouteTableAction,
    this.eC2CopyRouteTableAction,
    this.eC2CreateRouteAction,
    this.eC2CreateRouteTableAction,
    this.eC2DeleteRouteAction,
    this.eC2ReplaceRouteAction,
    this.eC2ReplaceRouteTableAssociationAction,
  });

  factory RemediationAction.fromJson(Map<String, dynamic> json) {
    return RemediationAction(
      description: json['Description'] as String?,
      eC2AssociateRouteTableAction: json['EC2AssociateRouteTableAction'] != null
          ? EC2AssociateRouteTableAction.fromJson(
              json['EC2AssociateRouteTableAction'] as Map<String, dynamic>)
          : null,
      eC2CopyRouteTableAction: json['EC2CopyRouteTableAction'] != null
          ? EC2CopyRouteTableAction.fromJson(
              json['EC2CopyRouteTableAction'] as Map<String, dynamic>)
          : null,
      eC2CreateRouteAction: json['EC2CreateRouteAction'] != null
          ? EC2CreateRouteAction.fromJson(
              json['EC2CreateRouteAction'] as Map<String, dynamic>)
          : null,
      eC2CreateRouteTableAction: json['EC2CreateRouteTableAction'] != null
          ? EC2CreateRouteTableAction.fromJson(
              json['EC2CreateRouteTableAction'] as Map<String, dynamic>)
          : null,
      eC2DeleteRouteAction: json['EC2DeleteRouteAction'] != null
          ? EC2DeleteRouteAction.fromJson(
              json['EC2DeleteRouteAction'] as Map<String, dynamic>)
          : null,
      eC2ReplaceRouteAction: json['EC2ReplaceRouteAction'] != null
          ? EC2ReplaceRouteAction.fromJson(
              json['EC2ReplaceRouteAction'] as Map<String, dynamic>)
          : null,
      eC2ReplaceRouteTableAssociationAction:
          json['EC2ReplaceRouteTableAssociationAction'] != null
              ? EC2ReplaceRouteTableAssociationAction.fromJson(
                  json['EC2ReplaceRouteTableAssociationAction']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final eC2AssociateRouteTableAction = this.eC2AssociateRouteTableAction;
    final eC2CopyRouteTableAction = this.eC2CopyRouteTableAction;
    final eC2CreateRouteAction = this.eC2CreateRouteAction;
    final eC2CreateRouteTableAction = this.eC2CreateRouteTableAction;
    final eC2DeleteRouteAction = this.eC2DeleteRouteAction;
    final eC2ReplaceRouteAction = this.eC2ReplaceRouteAction;
    final eC2ReplaceRouteTableAssociationAction =
        this.eC2ReplaceRouteTableAssociationAction;
    return {
      if (description != null) 'Description': description,
      if (eC2AssociateRouteTableAction != null)
        'EC2AssociateRouteTableAction': eC2AssociateRouteTableAction,
      if (eC2CopyRouteTableAction != null)
        'EC2CopyRouteTableAction': eC2CopyRouteTableAction,
      if (eC2CreateRouteAction != null)
        'EC2CreateRouteAction': eC2CreateRouteAction,
      if (eC2CreateRouteTableAction != null)
        'EC2CreateRouteTableAction': eC2CreateRouteTableAction,
      if (eC2DeleteRouteAction != null)
        'EC2DeleteRouteAction': eC2DeleteRouteAction,
      if (eC2ReplaceRouteAction != null)
        'EC2ReplaceRouteAction': eC2ReplaceRouteAction,
      if (eC2ReplaceRouteTableAssociationAction != null)
        'EC2ReplaceRouteTableAssociationAction':
            eC2ReplaceRouteTableAssociationAction,
    };
  }
}

enum RemediationActionType {
  remove,
  modify,
}

extension on RemediationActionType {
  String toValue() {
    switch (this) {
      case RemediationActionType.remove:
        return 'REMOVE';
      case RemediationActionType.modify:
        return 'MODIFY';
    }
  }
}

extension on String {
  RemediationActionType toRemediationActionType() {
    switch (this) {
      case 'REMOVE':
        return RemediationActionType.remove;
      case 'MODIFY':
        return RemediationActionType.modify;
    }
    throw Exception('$this is not known in enum RemediationActionType');
  }
}

/// An ordered list of actions you can take to remediate a violation.
class RemediationActionWithOrder {
  /// The order of the remediation actions in the list.
  final int? order;

  /// Information about an action you can take to remediate a violation.
  final RemediationAction? remediationAction;

  RemediationActionWithOrder({
    this.order,
    this.remediationAction,
  });

  factory RemediationActionWithOrder.fromJson(Map<String, dynamic> json) {
    return RemediationActionWithOrder(
      order: json['Order'] as int?,
      remediationAction: json['RemediationAction'] != null
          ? RemediationAction.fromJson(
              json['RemediationAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final order = this.order;
    final remediationAction = this.remediationAction;
    return {
      if (order != null) 'Order': order,
      if (remediationAction != null) 'RemediationAction': remediationAction,
    };
  }
}

/// The resource tags that Firewall Manager uses to determine if a particular
/// resource should be included or excluded from the Firewall Manager policy.
/// Tags enable you to categorize your Amazon Web Services resources in
/// different ways, for example, by purpose, owner, or environment. Each tag
/// consists of a key and an optional value. Firewall Manager combines the tags
/// with "AND" so that, if you add more than one tag to a policy scope, a
/// resource must have all the specified tags to be included or excluded. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html">Working
/// with Tag Editor</a>.
class ResourceTag {
  /// The resource tag key.
  final String key;

  /// The resource tag value.
  final String? value;

  ResourceTag({
    required this.key,
    this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Violation detail based on resource type.
class ResourceViolation {
  /// Violation detail for an EC2 instance.
  final AwsEc2InstanceViolation? awsEc2InstanceViolation;

  /// Violation detail for a network interface.
  final AwsEc2NetworkInterfaceViolation? awsEc2NetworkInterfaceViolation;

  /// Violation detail for security groups.
  final AwsVPCSecurityGroupViolation? awsVPCSecurityGroupViolation;

  /// Violation detail for a DNS Firewall policy that indicates that a rule group
  /// that Firewall Manager tried to associate with a VPC is already associated
  /// with the VPC and can't be associated again.
  final DnsDuplicateRuleGroupViolation? dnsDuplicateRuleGroupViolation;

  /// Violation detail for a DNS Firewall policy that indicates that the VPC
  /// reached the limit for associated DNS Firewall rule groups. Firewall Manager
  /// tried to associate another rule group with the VPC and failed.
  final DnsRuleGroupLimitExceededViolation? dnsRuleGroupLimitExceededViolation;

  /// Violation detail for a DNS Firewall policy that indicates that a rule group
  /// that Firewall Manager tried to associate with a VPC has the same priority as
  /// a rule group that's already associated.
  final DnsRuleGroupPriorityConflictViolation?
      dnsRuleGroupPriorityConflictViolation;
  final NetworkFirewallBlackHoleRouteDetectedViolation?
      networkFirewallBlackHoleRouteDetectedViolation;

  /// Violation detail for the subnet for which internet traffic hasn't been
  /// inspected.
  final NetworkFirewallInternetTrafficNotInspectedViolation?
      networkFirewallInternetTrafficNotInspectedViolation;

  /// The route configuration is invalid.
  final NetworkFirewallInvalidRouteConfigurationViolation?
      networkFirewallInvalidRouteConfigurationViolation;

  /// Violation detail for an Network Firewall policy that indicates that a subnet
  /// is not associated with the expected Firewall Manager managed route table.
  final NetworkFirewallMissingExpectedRTViolation?
      networkFirewallMissingExpectedRTViolation;

  /// Expected routes are missing from Network Firewall.
  final NetworkFirewallMissingExpectedRoutesViolation?
      networkFirewallMissingExpectedRoutesViolation;

  /// Violation detail for an Network Firewall policy that indicates that a subnet
  /// has no Firewall Manager managed firewall in its VPC.
  final NetworkFirewallMissingFirewallViolation?
      networkFirewallMissingFirewallViolation;

  /// Violation detail for an Network Firewall policy that indicates that an
  /// Availability Zone is missing the expected Firewall Manager managed subnet.
  final NetworkFirewallMissingSubnetViolation?
      networkFirewallMissingSubnetViolation;

  /// Violation detail for an Network Firewall policy that indicates that a
  /// firewall policy in an individual account has been modified in a way that
  /// makes it noncompliant. For example, the individual account owner might have
  /// deleted a rule group, changed the priority of a stateless rule group, or
  /// changed a policy default action.
  final NetworkFirewallPolicyModifiedViolation?
      networkFirewallPolicyModifiedViolation;

  /// There's an unexpected firewall route.
  final NetworkFirewallUnexpectedFirewallRoutesViolation?
      networkFirewallUnexpectedFirewallRoutesViolation;

  /// There's an unexpected gateway route.
  final NetworkFirewallUnexpectedGatewayRoutesViolation?
      networkFirewallUnexpectedGatewayRoutesViolation;

  /// A list of possible remediation action lists. Each individual possible
  /// remediation action is a list of individual remediation actions.
  final PossibleRemediationActions? possibleRemediationActions;

  ResourceViolation({
    this.awsEc2InstanceViolation,
    this.awsEc2NetworkInterfaceViolation,
    this.awsVPCSecurityGroupViolation,
    this.dnsDuplicateRuleGroupViolation,
    this.dnsRuleGroupLimitExceededViolation,
    this.dnsRuleGroupPriorityConflictViolation,
    this.networkFirewallBlackHoleRouteDetectedViolation,
    this.networkFirewallInternetTrafficNotInspectedViolation,
    this.networkFirewallInvalidRouteConfigurationViolation,
    this.networkFirewallMissingExpectedRTViolation,
    this.networkFirewallMissingExpectedRoutesViolation,
    this.networkFirewallMissingFirewallViolation,
    this.networkFirewallMissingSubnetViolation,
    this.networkFirewallPolicyModifiedViolation,
    this.networkFirewallUnexpectedFirewallRoutesViolation,
    this.networkFirewallUnexpectedGatewayRoutesViolation,
    this.possibleRemediationActions,
  });

  factory ResourceViolation.fromJson(Map<String, dynamic> json) {
    return ResourceViolation(
      awsEc2InstanceViolation: json['AwsEc2InstanceViolation'] != null
          ? AwsEc2InstanceViolation.fromJson(
              json['AwsEc2InstanceViolation'] as Map<String, dynamic>)
          : null,
      awsEc2NetworkInterfaceViolation:
          json['AwsEc2NetworkInterfaceViolation'] != null
              ? AwsEc2NetworkInterfaceViolation.fromJson(
                  json['AwsEc2NetworkInterfaceViolation']
                      as Map<String, dynamic>)
              : null,
      awsVPCSecurityGroupViolation: json['AwsVPCSecurityGroupViolation'] != null
          ? AwsVPCSecurityGroupViolation.fromJson(
              json['AwsVPCSecurityGroupViolation'] as Map<String, dynamic>)
          : null,
      dnsDuplicateRuleGroupViolation: json['DnsDuplicateRuleGroupViolation'] !=
              null
          ? DnsDuplicateRuleGroupViolation.fromJson(
              json['DnsDuplicateRuleGroupViolation'] as Map<String, dynamic>)
          : null,
      dnsRuleGroupLimitExceededViolation:
          json['DnsRuleGroupLimitExceededViolation'] != null
              ? DnsRuleGroupLimitExceededViolation.fromJson(
                  json['DnsRuleGroupLimitExceededViolation']
                      as Map<String, dynamic>)
              : null,
      dnsRuleGroupPriorityConflictViolation:
          json['DnsRuleGroupPriorityConflictViolation'] != null
              ? DnsRuleGroupPriorityConflictViolation.fromJson(
                  json['DnsRuleGroupPriorityConflictViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallBlackHoleRouteDetectedViolation:
          json['NetworkFirewallBlackHoleRouteDetectedViolation'] != null
              ? NetworkFirewallBlackHoleRouteDetectedViolation.fromJson(
                  json['NetworkFirewallBlackHoleRouteDetectedViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallInternetTrafficNotInspectedViolation:
          json['NetworkFirewallInternetTrafficNotInspectedViolation'] != null
              ? NetworkFirewallInternetTrafficNotInspectedViolation.fromJson(
                  json['NetworkFirewallInternetTrafficNotInspectedViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallInvalidRouteConfigurationViolation:
          json['NetworkFirewallInvalidRouteConfigurationViolation'] != null
              ? NetworkFirewallInvalidRouteConfigurationViolation.fromJson(
                  json['NetworkFirewallInvalidRouteConfigurationViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallMissingExpectedRTViolation:
          json['NetworkFirewallMissingExpectedRTViolation'] != null
              ? NetworkFirewallMissingExpectedRTViolation.fromJson(
                  json['NetworkFirewallMissingExpectedRTViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallMissingExpectedRoutesViolation:
          json['NetworkFirewallMissingExpectedRoutesViolation'] != null
              ? NetworkFirewallMissingExpectedRoutesViolation.fromJson(
                  json['NetworkFirewallMissingExpectedRoutesViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallMissingFirewallViolation:
          json['NetworkFirewallMissingFirewallViolation'] != null
              ? NetworkFirewallMissingFirewallViolation.fromJson(
                  json['NetworkFirewallMissingFirewallViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallMissingSubnetViolation:
          json['NetworkFirewallMissingSubnetViolation'] != null
              ? NetworkFirewallMissingSubnetViolation.fromJson(
                  json['NetworkFirewallMissingSubnetViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallPolicyModifiedViolation:
          json['NetworkFirewallPolicyModifiedViolation'] != null
              ? NetworkFirewallPolicyModifiedViolation.fromJson(
                  json['NetworkFirewallPolicyModifiedViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallUnexpectedFirewallRoutesViolation:
          json['NetworkFirewallUnexpectedFirewallRoutesViolation'] != null
              ? NetworkFirewallUnexpectedFirewallRoutesViolation.fromJson(
                  json['NetworkFirewallUnexpectedFirewallRoutesViolation']
                      as Map<String, dynamic>)
              : null,
      networkFirewallUnexpectedGatewayRoutesViolation:
          json['NetworkFirewallUnexpectedGatewayRoutesViolation'] != null
              ? NetworkFirewallUnexpectedGatewayRoutesViolation.fromJson(
                  json['NetworkFirewallUnexpectedGatewayRoutesViolation']
                      as Map<String, dynamic>)
              : null,
      possibleRemediationActions: json['PossibleRemediationActions'] != null
          ? PossibleRemediationActions.fromJson(
              json['PossibleRemediationActions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsEc2InstanceViolation = this.awsEc2InstanceViolation;
    final awsEc2NetworkInterfaceViolation =
        this.awsEc2NetworkInterfaceViolation;
    final awsVPCSecurityGroupViolation = this.awsVPCSecurityGroupViolation;
    final dnsDuplicateRuleGroupViolation = this.dnsDuplicateRuleGroupViolation;
    final dnsRuleGroupLimitExceededViolation =
        this.dnsRuleGroupLimitExceededViolation;
    final dnsRuleGroupPriorityConflictViolation =
        this.dnsRuleGroupPriorityConflictViolation;
    final networkFirewallBlackHoleRouteDetectedViolation =
        this.networkFirewallBlackHoleRouteDetectedViolation;
    final networkFirewallInternetTrafficNotInspectedViolation =
        this.networkFirewallInternetTrafficNotInspectedViolation;
    final networkFirewallInvalidRouteConfigurationViolation =
        this.networkFirewallInvalidRouteConfigurationViolation;
    final networkFirewallMissingExpectedRTViolation =
        this.networkFirewallMissingExpectedRTViolation;
    final networkFirewallMissingExpectedRoutesViolation =
        this.networkFirewallMissingExpectedRoutesViolation;
    final networkFirewallMissingFirewallViolation =
        this.networkFirewallMissingFirewallViolation;
    final networkFirewallMissingSubnetViolation =
        this.networkFirewallMissingSubnetViolation;
    final networkFirewallPolicyModifiedViolation =
        this.networkFirewallPolicyModifiedViolation;
    final networkFirewallUnexpectedFirewallRoutesViolation =
        this.networkFirewallUnexpectedFirewallRoutesViolation;
    final networkFirewallUnexpectedGatewayRoutesViolation =
        this.networkFirewallUnexpectedGatewayRoutesViolation;
    final possibleRemediationActions = this.possibleRemediationActions;
    return {
      if (awsEc2InstanceViolation != null)
        'AwsEc2InstanceViolation': awsEc2InstanceViolation,
      if (awsEc2NetworkInterfaceViolation != null)
        'AwsEc2NetworkInterfaceViolation': awsEc2NetworkInterfaceViolation,
      if (awsVPCSecurityGroupViolation != null)
        'AwsVPCSecurityGroupViolation': awsVPCSecurityGroupViolation,
      if (dnsDuplicateRuleGroupViolation != null)
        'DnsDuplicateRuleGroupViolation': dnsDuplicateRuleGroupViolation,
      if (dnsRuleGroupLimitExceededViolation != null)
        'DnsRuleGroupLimitExceededViolation':
            dnsRuleGroupLimitExceededViolation,
      if (dnsRuleGroupPriorityConflictViolation != null)
        'DnsRuleGroupPriorityConflictViolation':
            dnsRuleGroupPriorityConflictViolation,
      if (networkFirewallBlackHoleRouteDetectedViolation != null)
        'NetworkFirewallBlackHoleRouteDetectedViolation':
            networkFirewallBlackHoleRouteDetectedViolation,
      if (networkFirewallInternetTrafficNotInspectedViolation != null)
        'NetworkFirewallInternetTrafficNotInspectedViolation':
            networkFirewallInternetTrafficNotInspectedViolation,
      if (networkFirewallInvalidRouteConfigurationViolation != null)
        'NetworkFirewallInvalidRouteConfigurationViolation':
            networkFirewallInvalidRouteConfigurationViolation,
      if (networkFirewallMissingExpectedRTViolation != null)
        'NetworkFirewallMissingExpectedRTViolation':
            networkFirewallMissingExpectedRTViolation,
      if (networkFirewallMissingExpectedRoutesViolation != null)
        'NetworkFirewallMissingExpectedRoutesViolation':
            networkFirewallMissingExpectedRoutesViolation,
      if (networkFirewallMissingFirewallViolation != null)
        'NetworkFirewallMissingFirewallViolation':
            networkFirewallMissingFirewallViolation,
      if (networkFirewallMissingSubnetViolation != null)
        'NetworkFirewallMissingSubnetViolation':
            networkFirewallMissingSubnetViolation,
      if (networkFirewallPolicyModifiedViolation != null)
        'NetworkFirewallPolicyModifiedViolation':
            networkFirewallPolicyModifiedViolation,
      if (networkFirewallUnexpectedFirewallRoutesViolation != null)
        'NetworkFirewallUnexpectedFirewallRoutesViolation':
            networkFirewallUnexpectedFirewallRoutesViolation,
      if (networkFirewallUnexpectedGatewayRoutesViolation != null)
        'NetworkFirewallUnexpectedGatewayRoutesViolation':
            networkFirewallUnexpectedGatewayRoutesViolation,
      if (possibleRemediationActions != null)
        'PossibleRemediationActions': possibleRemediationActions,
    };
  }
}

/// Describes a route in a route table.
class Route {
  /// The destination of the route.
  final String? destination;

  /// The type of destination for the route.
  final DestinationType? destinationType;

  /// The route's target.
  final String? target;

  /// The type of target for the route.
  final TargetType? targetType;

  Route({
    this.destination,
    this.destinationType,
    this.target,
    this.targetType,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      destination: json['Destination'] as String?,
      destinationType:
          (json['DestinationType'] as String?)?.toDestinationType(),
      target: json['Target'] as String?,
      targetType: (json['TargetType'] as String?)?.toTargetType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationType = this.destinationType;
    final target = this.target;
    final targetType = this.targetType;
    return {
      if (destination != null) 'Destination': destination,
      if (destinationType != null) 'DestinationType': destinationType.toValue(),
      if (target != null) 'Target': target,
      if (targetType != null) 'TargetType': targetType.toValue(),
    };
  }
}

/// Remediation option for the rule specified in the
/// <code>ViolationTarget</code>.
class SecurityGroupRemediationAction {
  /// Brief description of the action that will be performed.
  final String? description;

  /// Indicates if the current action is the default action.
  final bool? isDefaultAction;

  /// The remediation action that will be performed.
  final RemediationActionType? remediationActionType;

  /// The final state of the rule specified in the <code>ViolationTarget</code>
  /// after it is remediated.
  final SecurityGroupRuleDescription? remediationResult;

  SecurityGroupRemediationAction({
    this.description,
    this.isDefaultAction,
    this.remediationActionType,
    this.remediationResult,
  });

  factory SecurityGroupRemediationAction.fromJson(Map<String, dynamic> json) {
    return SecurityGroupRemediationAction(
      description: json['Description'] as String?,
      isDefaultAction: json['IsDefaultAction'] as bool?,
      remediationActionType:
          (json['RemediationActionType'] as String?)?.toRemediationActionType(),
      remediationResult: json['RemediationResult'] != null
          ? SecurityGroupRuleDescription.fromJson(
              json['RemediationResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final isDefaultAction = this.isDefaultAction;
    final remediationActionType = this.remediationActionType;
    final remediationResult = this.remediationResult;
    return {
      if (description != null) 'Description': description,
      if (isDefaultAction != null) 'IsDefaultAction': isDefaultAction,
      if (remediationActionType != null)
        'RemediationActionType': remediationActionType.toValue(),
      if (remediationResult != null) 'RemediationResult': remediationResult,
    };
  }
}

/// Describes a set of permissions for a security group rule.
class SecurityGroupRuleDescription {
  /// The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// type number. A value of <code>-1</code> indicates all ICMP/ICMPv6 types.
  final int? fromPort;

  /// The IPv4 ranges for the security group rule.
  final String? iPV4Range;

  /// The IPv6 ranges for the security group rule.
  final String? iPV6Range;

  /// The ID of the prefix list for the security group rule.
  final String? prefixListId;

  /// The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>,
  /// <code>icmpv6</code>) or number.
  final String? protocol;

  /// The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// code. A value of <code>-1</code> indicates all ICMP/ICMPv6 codes.
  final int? toPort;

  SecurityGroupRuleDescription({
    this.fromPort,
    this.iPV4Range,
    this.iPV6Range,
    this.prefixListId,
    this.protocol,
    this.toPort,
  });

  factory SecurityGroupRuleDescription.fromJson(Map<String, dynamic> json) {
    return SecurityGroupRuleDescription(
      fromPort: json['FromPort'] as int?,
      iPV4Range: json['IPV4Range'] as String?,
      iPV6Range: json['IPV6Range'] as String?,
      prefixListId: json['PrefixListId'] as String?,
      protocol: json['Protocol'] as String?,
      toPort: json['ToPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fromPort = this.fromPort;
    final iPV4Range = this.iPV4Range;
    final iPV6Range = this.iPV6Range;
    final prefixListId = this.prefixListId;
    final protocol = this.protocol;
    final toPort = this.toPort;
    return {
      if (fromPort != null) 'FromPort': fromPort,
      if (iPV4Range != null) 'IPV4Range': iPV4Range,
      if (iPV6Range != null) 'IPV6Range': iPV6Range,
      if (prefixListId != null) 'PrefixListId': prefixListId,
      if (protocol != null) 'Protocol': protocol,
      if (toPort != null) 'ToPort': toPort,
    };
  }
}

/// Details about the security service that is being used to protect the
/// resources.
class SecurityServicePolicyData {
  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either an WAF policy, a Shield
  /// Advanced policy, or a security group policy. For security group policies,
  /// Firewall Manager supports one security group for each common policy and for
  /// each content audit policy. This is an adjustable limit that you can increase
  /// by contacting Amazon Web Services Support.
  final SecurityServiceType type;

  /// Details about the service that are specific to the service type, in JSON
  /// format. For service type <code>SHIELD_ADVANCED</code>, this is an empty
  /// string.
  ///
  /// <ul>
  /// <li>
  /// Example: <code>DNS_FIREWALL</code>
  ///
  /// <code>"{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"</code>
  /// </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code>
  ///
  /// <code>"{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-1:1234567891011:stateless-rulegroup/rulegroup2\",\"priority\":10}],\"networkFirewallStatelessDefaultActions\":[\"aws:pass\",\"custom1\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"custom2\",\"aws:pass\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"custom1\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"dimension1\"}]}}},{\"actionName\":\"custom2\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"dimension2\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-1:1234567891011:stateful-rulegroup/rulegroup1\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":true,\"allowedIPV4CidrList\":[\"10.24.34.0/28\"]}
  /// }"</code>
  /// </li>
  /// <li>
  /// Example: <code>WAFV2</code>
  ///
  /// <code>"{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesAmazonIpReputationList\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":{\"logDestinationConfigs\":[\"arn:aws:firehose:us-west-2:12345678912:deliverystream/aws-waf-logs-fms-admin-destination\"],\"redactedFields\":[{\"redactedFieldType\":\"SingleHeader\",\"redactedFieldValue\":\"Cookies\"},{\"redactedFieldType\":\"Method\"}]}}"</code>
  ///
  /// In the <code>loggingConfiguration</code>, you can specify one
  /// <code>logDestinationConfigs</code>, you can optionally provide up to 20
  /// <code>redactedFields</code>, and the <code>RedactedFieldType</code> must be
  /// one of <code>URI</code>, <code>QUERY_STRING</code>, <code>HEADER</code>, or
  /// <code>METHOD</code>.
  /// </li>
  /// <li>
  /// Example: <code>WAF Classic</code>
  ///
  /// <code>"{\"type\": \"WAF\", \"ruleGroups\":
  /// [{\"id\":\"12345678-1bcd-9012-efga-0987654321ab\", \"overrideAction\" :
  /// {\"type\": \"COUNT\"}}], \"defaultAction\": {\"type\": \"BLOCK\"}}"</code>
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_COMMON</code>
  ///
  /// <code>"{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
  /// \"applyToAllEC2InstanceENIs\":false,\"securityGroups\":[{\"id\":\"
  /// sg-000e55995d61a06bd\"}]}"</code>
  /// </li>
  /// <li>
  /// Example: Shared VPCs. Apply the preceding policy to resources in shared VPCs
  /// as well as to those in VPCs that the account owns
  ///
  /// <code>"{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
  /// \"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":true,\"securityGroups\":[{\"id\":\"
  /// sg-000e55995d61a06bd\"}]}"</code>
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_CONTENT_AUDIT</code>
  ///
  /// <code>"{\"type\":\"SECURITY_GROUPS_CONTENT_AUDIT\",\"securityGroups\":[{\"id\":\"sg-000e55995d61a06bd\"}],\"securityGroupAction\":{\"type\":\"ALLOW\"}}"</code>
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
  /// <code>"{\"type\":\"SECURITY_GROUPS_USAGE_AUDIT\",\"deleteUnusedSecurityGroups\":true,\"coalesceRedundantSecurityGroups\":true}"</code>
  /// </li>
  /// </ul>
  final String? managedServiceData;

  SecurityServicePolicyData({
    required this.type,
    this.managedServiceData,
  });

  factory SecurityServicePolicyData.fromJson(Map<String, dynamic> json) {
    return SecurityServicePolicyData(
      type: (json['Type'] as String).toSecurityServiceType(),
      managedServiceData: json['ManagedServiceData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final managedServiceData = this.managedServiceData;
    return {
      'Type': type.toValue(),
      if (managedServiceData != null) 'ManagedServiceData': managedServiceData,
    };
  }
}

enum SecurityServiceType {
  waf,
  wafv2,
  shieldAdvanced,
  securityGroupsCommon,
  securityGroupsContentAudit,
  securityGroupsUsageAudit,
  networkFirewall,
  dnsFirewall,
}

extension on SecurityServiceType {
  String toValue() {
    switch (this) {
      case SecurityServiceType.waf:
        return 'WAF';
      case SecurityServiceType.wafv2:
        return 'WAFV2';
      case SecurityServiceType.shieldAdvanced:
        return 'SHIELD_ADVANCED';
      case SecurityServiceType.securityGroupsCommon:
        return 'SECURITY_GROUPS_COMMON';
      case SecurityServiceType.securityGroupsContentAudit:
        return 'SECURITY_GROUPS_CONTENT_AUDIT';
      case SecurityServiceType.securityGroupsUsageAudit:
        return 'SECURITY_GROUPS_USAGE_AUDIT';
      case SecurityServiceType.networkFirewall:
        return 'NETWORK_FIREWALL';
      case SecurityServiceType.dnsFirewall:
        return 'DNS_FIREWALL';
    }
  }
}

extension on String {
  SecurityServiceType toSecurityServiceType() {
    switch (this) {
      case 'WAF':
        return SecurityServiceType.waf;
      case 'WAFV2':
        return SecurityServiceType.wafv2;
      case 'SHIELD_ADVANCED':
        return SecurityServiceType.shieldAdvanced;
      case 'SECURITY_GROUPS_COMMON':
        return SecurityServiceType.securityGroupsCommon;
      case 'SECURITY_GROUPS_CONTENT_AUDIT':
        return SecurityServiceType.securityGroupsContentAudit;
      case 'SECURITY_GROUPS_USAGE_AUDIT':
        return SecurityServiceType.securityGroupsUsageAudit;
      case 'NETWORK_FIREWALL':
        return SecurityServiceType.networkFirewall;
      case 'DNS_FIREWALL':
        return SecurityServiceType.dnsFirewall;
    }
    throw Exception('$this is not known in enum SecurityServiceType');
  }
}

/// Network Firewall stateful rule group, used in a
/// <a>NetworkFirewallPolicyDescription</a>.
class StatefulRuleGroup {
  /// The resource ID of the rule group.
  final String? resourceId;

  /// The name of the rule group.
  final String? ruleGroupName;

  StatefulRuleGroup({
    this.resourceId,
    this.ruleGroupName,
  });

  factory StatefulRuleGroup.fromJson(Map<String, dynamic> json) {
    return StatefulRuleGroup(
      resourceId: json['ResourceId'] as String?,
      ruleGroupName: json['RuleGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final ruleGroupName = this.ruleGroupName;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
      if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
    };
  }
}

/// Network Firewall stateless rule group, used in a
/// <a>NetworkFirewallPolicyDescription</a>.
class StatelessRuleGroup {
  /// The priority of the rule group. Network Firewall evaluates the stateless
  /// rule groups in a firewall policy starting from the lowest priority setting.
  final int? priority;

  /// The resource ID of the rule group.
  final String? resourceId;

  /// The name of the rule group.
  final String? ruleGroupName;

  StatelessRuleGroup({
    this.priority,
    this.resourceId,
    this.ruleGroupName,
  });

  factory StatelessRuleGroup.fromJson(Map<String, dynamic> json) {
    return StatelessRuleGroup(
      priority: json['Priority'] as int?,
      resourceId: json['ResourceId'] as String?,
      ruleGroupName: json['RuleGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final resourceId = this.resourceId;
    final ruleGroupName = this.ruleGroupName;
    return {
      if (priority != null) 'Priority': priority,
      if (resourceId != null) 'ResourceId': resourceId,
      if (ruleGroupName != null) 'RuleGroupName': ruleGroupName,
    };
  }
}

/// A collection of key:value pairs associated with an Amazon Web Services
/// resource. The key:value pair can be anything you define. Typically, the tag
/// key represents a category (such as "environment") and the tag value
/// represents a specific value within that category (such as "test,"
/// "development," or "production"). You can add up to 50 tags to each Amazon
/// Web Services resource.
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TargetType {
  gateway,
  carrierGateway,
  instance,
  localGateway,
  natGateway,
  networkInterface,
  vpcEndpoint,
  vpcPeeringConnection,
  egressOnlyInternetGateway,
  transitGateway,
}

extension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.gateway:
        return 'GATEWAY';
      case TargetType.carrierGateway:
        return 'CARRIER_GATEWAY';
      case TargetType.instance:
        return 'INSTANCE';
      case TargetType.localGateway:
        return 'LOCAL_GATEWAY';
      case TargetType.natGateway:
        return 'NAT_GATEWAY';
      case TargetType.networkInterface:
        return 'NETWORK_INTERFACE';
      case TargetType.vpcEndpoint:
        return 'VPC_ENDPOINT';
      case TargetType.vpcPeeringConnection:
        return 'VPC_PEERING_CONNECTION';
      case TargetType.egressOnlyInternetGateway:
        return 'EGRESS_ONLY_INTERNET_GATEWAY';
      case TargetType.transitGateway:
        return 'TRANSIT_GATEWAY';
    }
  }
}

extension on String {
  TargetType toTargetType() {
    switch (this) {
      case 'GATEWAY':
        return TargetType.gateway;
      case 'CARRIER_GATEWAY':
        return TargetType.carrierGateway;
      case 'INSTANCE':
        return TargetType.instance;
      case 'LOCAL_GATEWAY':
        return TargetType.localGateway;
      case 'NAT_GATEWAY':
        return TargetType.natGateway;
      case 'NETWORK_INTERFACE':
        return TargetType.networkInterface;
      case 'VPC_ENDPOINT':
        return TargetType.vpcEndpoint;
      case 'VPC_PEERING_CONNECTION':
        return TargetType.vpcPeeringConnection;
      case 'EGRESS_ONLY_INTERNET_GATEWAY':
        return TargetType.egressOnlyInternetGateway;
      case 'TRANSIT_GATEWAY':
        return TargetType.transitGateway;
    }
    throw Exception('$this is not known in enum TargetType');
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

/// Violations for a resource based on the specified Firewall Manager policy and
/// Amazon Web Services account.
class ViolationDetail {
  /// The Amazon Web Services account that the violation details were requested
  /// for.
  final String memberAccount;

  /// The ID of the Firewall Manager policy that the violation details were
  /// requested for.
  final String policyId;

  /// The resource ID that the violation details were requested for.
  final String resourceId;

  /// The resource type that the violation details were requested for.
  final String resourceType;

  /// List of violations for the requested resource.
  final List<ResourceViolation> resourceViolations;

  /// Brief description for the requested resource.
  final String? resourceDescription;

  /// The <code>ResourceTag</code> objects associated with the resource.
  final List<Tag>? resourceTags;

  ViolationDetail({
    required this.memberAccount,
    required this.policyId,
    required this.resourceId,
    required this.resourceType,
    required this.resourceViolations,
    this.resourceDescription,
    this.resourceTags,
  });

  factory ViolationDetail.fromJson(Map<String, dynamic> json) {
    return ViolationDetail(
      memberAccount: json['MemberAccount'] as String,
      policyId: json['PolicyId'] as String,
      resourceId: json['ResourceId'] as String,
      resourceType: json['ResourceType'] as String,
      resourceViolations: (json['ResourceViolations'] as List)
          .whereNotNull()
          .map((e) => ResourceViolation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceDescription: json['ResourceDescription'] as String?,
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccount = this.memberAccount;
    final policyId = this.policyId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final resourceViolations = this.resourceViolations;
    final resourceDescription = this.resourceDescription;
    final resourceTags = this.resourceTags;
    return {
      'MemberAccount': memberAccount,
      'PolicyId': policyId,
      'ResourceId': resourceId,
      'ResourceType': resourceType,
      'ResourceViolations': resourceViolations,
      if (resourceDescription != null)
        'ResourceDescription': resourceDescription,
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

enum ViolationReason {
  webAclMissingRuleGroup,
  resourceMissingWebAcl,
  resourceIncorrectWebAcl,
  resourceMissingShieldProtection,
  resourceMissingWebAclOrShieldProtection,
  resourceMissingSecurityGroup,
  resourceViolatesAuditSecurityGroup,
  securityGroupUnused,
  securityGroupRedundant,
  fmsCreatedSecurityGroupEdited,
  missingFirewall,
  missingFirewallSubnetInAz,
  missingExpectedRouteTable,
  networkFirewallPolicyModified,
  internetGatewayMissingExpectedRoute,
  firewallSubnetMissingExpectedRoute,
  unexpectedFirewallRoutes,
  unexpectedTargetGatewayRoutes,
  trafficInspectionCrossesAzBoundary,
  invalidRouteConfiguration,
  missingTargetGateway,
  internetTrafficNotInspected,
  blackHoleRouteDetected,
  blackHoleRouteDetectedInFirewallSubnet,
  resourceMissingDnsFirewall,
}

extension on ViolationReason {
  String toValue() {
    switch (this) {
      case ViolationReason.webAclMissingRuleGroup:
        return 'WEB_ACL_MISSING_RULE_GROUP';
      case ViolationReason.resourceMissingWebAcl:
        return 'RESOURCE_MISSING_WEB_ACL';
      case ViolationReason.resourceIncorrectWebAcl:
        return 'RESOURCE_INCORRECT_WEB_ACL';
      case ViolationReason.resourceMissingShieldProtection:
        return 'RESOURCE_MISSING_SHIELD_PROTECTION';
      case ViolationReason.resourceMissingWebAclOrShieldProtection:
        return 'RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION';
      case ViolationReason.resourceMissingSecurityGroup:
        return 'RESOURCE_MISSING_SECURITY_GROUP';
      case ViolationReason.resourceViolatesAuditSecurityGroup:
        return 'RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP';
      case ViolationReason.securityGroupUnused:
        return 'SECURITY_GROUP_UNUSED';
      case ViolationReason.securityGroupRedundant:
        return 'SECURITY_GROUP_REDUNDANT';
      case ViolationReason.fmsCreatedSecurityGroupEdited:
        return 'FMS_CREATED_SECURITY_GROUP_EDITED';
      case ViolationReason.missingFirewall:
        return 'MISSING_FIREWALL';
      case ViolationReason.missingFirewallSubnetInAz:
        return 'MISSING_FIREWALL_SUBNET_IN_AZ';
      case ViolationReason.missingExpectedRouteTable:
        return 'MISSING_EXPECTED_ROUTE_TABLE';
      case ViolationReason.networkFirewallPolicyModified:
        return 'NETWORK_FIREWALL_POLICY_MODIFIED';
      case ViolationReason.internetGatewayMissingExpectedRoute:
        return 'INTERNET_GATEWAY_MISSING_EXPECTED_ROUTE';
      case ViolationReason.firewallSubnetMissingExpectedRoute:
        return 'FIREWALL_SUBNET_MISSING_EXPECTED_ROUTE';
      case ViolationReason.unexpectedFirewallRoutes:
        return 'UNEXPECTED_FIREWALL_ROUTES';
      case ViolationReason.unexpectedTargetGatewayRoutes:
        return 'UNEXPECTED_TARGET_GATEWAY_ROUTES';
      case ViolationReason.trafficInspectionCrossesAzBoundary:
        return 'TRAFFIC_INSPECTION_CROSSES_AZ_BOUNDARY';
      case ViolationReason.invalidRouteConfiguration:
        return 'INVALID_ROUTE_CONFIGURATION';
      case ViolationReason.missingTargetGateway:
        return 'MISSING_TARGET_GATEWAY';
      case ViolationReason.internetTrafficNotInspected:
        return 'INTERNET_TRAFFIC_NOT_INSPECTED';
      case ViolationReason.blackHoleRouteDetected:
        return 'BLACK_HOLE_ROUTE_DETECTED';
      case ViolationReason.blackHoleRouteDetectedInFirewallSubnet:
        return 'BLACK_HOLE_ROUTE_DETECTED_IN_FIREWALL_SUBNET';
      case ViolationReason.resourceMissingDnsFirewall:
        return 'RESOURCE_MISSING_DNS_FIREWALL';
    }
  }
}

extension on String {
  ViolationReason toViolationReason() {
    switch (this) {
      case 'WEB_ACL_MISSING_RULE_GROUP':
        return ViolationReason.webAclMissingRuleGroup;
      case 'RESOURCE_MISSING_WEB_ACL':
        return ViolationReason.resourceMissingWebAcl;
      case 'RESOURCE_INCORRECT_WEB_ACL':
        return ViolationReason.resourceIncorrectWebAcl;
      case 'RESOURCE_MISSING_SHIELD_PROTECTION':
        return ViolationReason.resourceMissingShieldProtection;
      case 'RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION':
        return ViolationReason.resourceMissingWebAclOrShieldProtection;
      case 'RESOURCE_MISSING_SECURITY_GROUP':
        return ViolationReason.resourceMissingSecurityGroup;
      case 'RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP':
        return ViolationReason.resourceViolatesAuditSecurityGroup;
      case 'SECURITY_GROUP_UNUSED':
        return ViolationReason.securityGroupUnused;
      case 'SECURITY_GROUP_REDUNDANT':
        return ViolationReason.securityGroupRedundant;
      case 'FMS_CREATED_SECURITY_GROUP_EDITED':
        return ViolationReason.fmsCreatedSecurityGroupEdited;
      case 'MISSING_FIREWALL':
        return ViolationReason.missingFirewall;
      case 'MISSING_FIREWALL_SUBNET_IN_AZ':
        return ViolationReason.missingFirewallSubnetInAz;
      case 'MISSING_EXPECTED_ROUTE_TABLE':
        return ViolationReason.missingExpectedRouteTable;
      case 'NETWORK_FIREWALL_POLICY_MODIFIED':
        return ViolationReason.networkFirewallPolicyModified;
      case 'INTERNET_GATEWAY_MISSING_EXPECTED_ROUTE':
        return ViolationReason.internetGatewayMissingExpectedRoute;
      case 'FIREWALL_SUBNET_MISSING_EXPECTED_ROUTE':
        return ViolationReason.firewallSubnetMissingExpectedRoute;
      case 'UNEXPECTED_FIREWALL_ROUTES':
        return ViolationReason.unexpectedFirewallRoutes;
      case 'UNEXPECTED_TARGET_GATEWAY_ROUTES':
        return ViolationReason.unexpectedTargetGatewayRoutes;
      case 'TRAFFIC_INSPECTION_CROSSES_AZ_BOUNDARY':
        return ViolationReason.trafficInspectionCrossesAzBoundary;
      case 'INVALID_ROUTE_CONFIGURATION':
        return ViolationReason.invalidRouteConfiguration;
      case 'MISSING_TARGET_GATEWAY':
        return ViolationReason.missingTargetGateway;
      case 'INTERNET_TRAFFIC_NOT_INSPECTED':
        return ViolationReason.internetTrafficNotInspected;
      case 'BLACK_HOLE_ROUTE_DETECTED':
        return ViolationReason.blackHoleRouteDetected;
      case 'BLACK_HOLE_ROUTE_DETECTED_IN_FIREWALL_SUBNET':
        return ViolationReason.blackHoleRouteDetectedInFirewallSubnet;
      case 'RESOURCE_MISSING_DNS_FIREWALL':
        return ViolationReason.resourceMissingDnsFirewall;
    }
    throw Exception('$this is not known in enum ViolationReason');
  }
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidTypeException extends _s.GenericAwsException {
  InvalidTypeException({String? type, String? message})
      : super(type: type, code: 'InvalidTypeException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
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
