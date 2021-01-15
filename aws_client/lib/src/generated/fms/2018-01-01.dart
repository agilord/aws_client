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

part '2018-01-01.g.dart';

/// This is the <i>AWS Firewall Manager API Reference</i>. This guide is for
/// developers who need detailed information about the AWS Firewall Manager API
/// actions, data types, and errors. For detailed information about AWS Firewall
/// Manager features, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html">AWS
/// Firewall Manager Developer Guide</a>.
class Fms {
  final _s.JsonProtocol _protocol;
  Fms({
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

  /// Permanently deletes an AWS Firewall Manager applications list.
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
    @_s.required String listId,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'listId',
      listId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteAppsList'
    };
    final jsonResponse = await _protocol.send(
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

  /// Permanently deletes an AWS Firewall Manager protocols list.
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
    @_s.required String listId,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'listId',
      listId,
      r'''^[a-z0-9A-Z-]{36}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteProtocolsList'
    };
    final jsonResponse = await _protocol.send(
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

  /// Returns information about the specified AWS Firewall Manager applications
  /// list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the AWS Firewall Manager applications list that you want the
  /// details for.
  ///
  /// Parameter [defaultList] :
  /// Specifies whether the list to retrieve is a default list owned by AWS
  /// Firewall Manager.
  Future<GetAppsListResponse> getAppsList({
    @_s.required String listId,
    bool defaultList,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'listId',
      listId,
      r'''^[a-z0-9A-Z-]{36}$''',
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
  /// the specified policy. Resources are considered noncompliant for AWS WAF
  /// and Shield Advanced policies if the specified policy has not been applied
  /// to them. Resources are considered noncompliant for security group policies
  /// if they are in scope of the policy, they violate one or more of the policy
  /// rules, and remediation is disabled or not possible. Resources are
  /// considered noncompliant for Network Firewall policies if a firewall is
  /// missing in the VPC, if the firewall endpoint isn't set up in an expected
  /// Availability Zone and subnet, if a subnet created by the Firewall Manager
  /// doesn't have the expected route table, and for modifications to a firewall
  /// policy that violate the Firewall Manager policy's rules.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidOperationException].
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
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (memberAccountId != null) 'MemberAccountId': memberAccountId,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return GetProtectionStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified AWS Firewall Manager protocols
  /// list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [listId] :
  /// The ID of the AWS Firewall Manager protocols list that you want the
  /// details for.
  ///
  /// Parameter [defaultList] :
  /// Specifies whether the list to retrieve is a default list owned by AWS
  /// Firewall Manager.
  Future<GetProtocolsListResponse> getProtocolsList({
    @_s.required String listId,
    bool defaultList,
  }) async {
    ArgumentError.checkNotNull(listId, 'listId');
    _s.validateStringLength(
      'listId',
      listId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'listId',
      listId,
      r'''^[a-z0-9A-Z-]{36}$''',
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

  /// Retrieves violations for a resource based on the specified AWS Firewall
  /// Manager policy and AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [memberAccount] :
  /// The AWS account ID that you want the details for.
  ///
  /// Parameter [policyId] :
  /// The ID of the AWS Firewall Manager policy that you want the details for.
  /// This currently only supports security group content audit policies.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource that has violations.
  ///
  /// Parameter [resourceType] :
  /// The resource type. This is in the format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS
  /// Resource Types Reference</a>. Supported resource types are:
  /// <code>AWS::EC2::Instance</code>, <code>AWS::EC2::NetworkInterface</code>,
  /// <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::NetworkFirewall::FirewallPolicy</code>, and
  /// <code>AWS::EC2::Subnet</code>.
  Future<GetViolationDetailsResponse> getViolationDetails({
    @_s.required String memberAccount,
    @_s.required String policyId,
    @_s.required String resourceId,
    @_s.required String resourceType,
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
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
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
    _s.validateStringPattern(
      'resourceType',
      resourceType,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
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
  /// The maximum number of objects that you want AWS Firewall Manager to return
  /// for this request. If more objects are available, in the response, AWS
  /// Firewall Manager provides a <code>NextToken</code> value that you can use
  /// in a subsequent call to get the next batch of objects.
  ///
  /// If you don't specify this, AWS Firewall Manager returns all available
  /// objects.
  ///
  /// Parameter [defaultLists] :
  /// Specifies whether the lists to retrieve are default lists owned by AWS
  /// Firewall Manager.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> in your list request,
  /// and you have more objects than the maximum, AWS Firewall Manager returns
  /// this token in the response. For all but the first request, you provide the
  /// token returned by the prior request in the request parameters, to retrieve
  /// the next batch of objects.
  Future<ListAppsListsResponse> listAppsLists({
    @_s.required int maxResults,
    bool defaultLists,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
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

  /// Returns an array of <code>PolicySummary</code> objects.
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

  /// Returns an array of <code>ProtocolsListDataSummary</code> objects.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want AWS Firewall Manager to return
  /// for this request. If more objects are available, in the response, AWS
  /// Firewall Manager provides a <code>NextToken</code> value that you can use
  /// in a subsequent call to get the next batch of objects.
  ///
  /// If you don't specify this, AWS Firewall Manager returns all available
  /// objects.
  ///
  /// Parameter [defaultLists] :
  /// Specifies whether the lists to retrieve are default lists owned by AWS
  /// Firewall Manager.
  ///
  /// Parameter [nextToken] :
  /// If you specify a value for <code>MaxResults</code> in your list request,
  /// and you have more objects than the maximum, AWS Firewall Manager returns
  /// this token in the response. For all but the first request, you provide the
  /// token returned by the prior request in the request parameters, to retrieve
  /// the next batch of objects.
  Future<ListProtocolsListsResponse> listProtocolsLists({
    @_s.required int maxResults,
    bool defaultLists,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$''',
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

  /// Retrieves the list of tags for the specified AWS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The AWS
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
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

  /// Creates an AWS Firewall Manager applications list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [appsList] :
  /// The details of the AWS Firewall Manager applications list to be created.
  ///
  /// Parameter [tagList] :
  /// The tags associated with the resource.
  Future<PutAppsListResponse> putAppsList({
    @_s.required AppsListData appsList,
    List<Tag> tagList,
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
  /// that AWS Firewall Manager uses to record SNS logs.
  ///
  /// To perform this action outside of the console, you must configure the SNS
  /// topic to allow the Firewall Manager role <code>AWSServiceRoleForFMS</code>
  /// to publish SNS logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-api-permissions-ref.html">Firewall
  /// Manager required permissions for API actions</a> in the <i>AWS Firewall
  /// Manager Developer Guide</i>.
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
  /// An AWS WAF policy (type WAFV2), which defines rule groups to run first in
  /// the corresponding AWS WAF web ACL and rule groups to run last in the web
  /// ACL.
  /// </li>
  /// <li>
  /// An AWS WAF Classic policy (type WAF), which defines a rule group.
  /// </li>
  /// <li>
  /// A Shield Advanced policy, which applies Shield Advanced protection to
  /// specified accounts and resources.
  /// </li>
  /// <li>
  /// A security group policy, which manages VPC security groups across your AWS
  /// organization.
  /// </li>
  /// <li>
  /// An AWS Network Firewall policy, which provides firewall rules to filter
  /// network traffic in specified Amazon VPCs.
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

  /// Creates an AWS Firewall Manager protocols list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [protocolsList] :
  /// The details of the AWS Firewall Manager protocols list to be created.
  ///
  /// Parameter [tagList] :
  /// The tags associated with the resource.
  Future<PutProtocolsListResponse> putProtocolsList({
    @_s.required ProtocolsListData protocolsList,
    List<Tag> tagList,
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

  /// Adds one or more tags to an AWS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The AWS
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
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
  /// The Amazon Resource Name (ARN) of the resource to return tags for. The AWS
  /// Firewall Manager resources that support tagging are policies, applications
  /// lists, and protocols lists.
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

/// An individual AWS Firewall Manager application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class App {
  /// The application's name.
  @_s.JsonKey(name: 'AppName')
  final String appName;

  /// The application's port number, for example <code>80</code>.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// The IP protocol name or number. The name can be one of <code>tcp</code>,
  /// <code>udp</code>, or <code>icmp</code>. For information on possible numbers,
  /// see <a
  /// href="https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol
  /// Numbers</a>.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  App({
    @_s.required this.appName,
    @_s.required this.port,
    @_s.required this.protocol,
  });
  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);
}

/// An AWS Firewall Manager applications list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppsListData {
  /// An array of applications in the AWS Firewall Manager applications list.
  @_s.JsonKey(name: 'AppsList')
  final List<App> appsList;

  /// The name of the AWS Firewall Manager applications list.
  @_s.JsonKey(name: 'ListName')
  final String listName;

  /// The time that the AWS Firewall Manager applications list was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The time that the AWS Firewall Manager applications list was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// The ID of the AWS Firewall Manager applications list.
  @_s.JsonKey(name: 'ListId')
  final String listId;

  /// A unique identifier for each update to the list. When you update the list,
  /// the update token must match the token of the current version of the
  /// application list. You can retrieve the update token by getting the list.
  @_s.JsonKey(name: 'ListUpdateToken')
  final String listUpdateToken;

  /// A map of previous version numbers to their corresponding <code>App</code>
  /// object arrays.
  @_s.JsonKey(name: 'PreviousAppsList')
  final Map<String, List<App>> previousAppsList;

  AppsListData({
    @_s.required this.appsList,
    @_s.required this.listName,
    this.createTime,
    this.lastUpdateTime,
    this.listId,
    this.listUpdateToken,
    this.previousAppsList,
  });
  factory AppsListData.fromJson(Map<String, dynamic> json) =>
      _$AppsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppsListDataToJson(this);
}

/// Details of the AWS Firewall Manager applications list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppsListDataSummary {
  /// An array of <code>App</code> objects in the AWS Firewall Manager
  /// applications list.
  @_s.JsonKey(name: 'AppsList')
  final List<App> appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  @_s.JsonKey(name: 'ListArn')
  final String listArn;

  /// The ID of the applications list.
  @_s.JsonKey(name: 'ListId')
  final String listId;

  /// The name of the applications list.
  @_s.JsonKey(name: 'ListName')
  final String listName;

  AppsListDataSummary({
    this.appsList,
    this.listArn,
    this.listId,
    this.listName,
  });
  factory AppsListDataSummary.fromJson(Map<String, dynamic> json) =>
      _$AppsListDataSummaryFromJson(json);
}

/// Violations for an EC2 instance resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsEc2InstanceViolation {
  /// Violations for network interfaces associated with the EC2 instance.
  @_s.JsonKey(name: 'AwsEc2NetworkInterfaceViolations')
  final List<AwsEc2NetworkInterfaceViolation> awsEc2NetworkInterfaceViolations;

  /// The resource ID of the EC2 instance.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  AwsEc2InstanceViolation({
    this.awsEc2NetworkInterfaceViolations,
    this.violationTarget,
  });
  factory AwsEc2InstanceViolation.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2InstanceViolationFromJson(json);
}

/// Violations for network interfaces associated with an EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsEc2NetworkInterfaceViolation {
  /// List of security groups that violate the rules specified in the master
  /// security group of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'ViolatingSecurityGroups')
  final List<String> violatingSecurityGroups;

  /// The resource ID of the network interface.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  AwsEc2NetworkInterfaceViolation({
    this.violatingSecurityGroups,
    this.violationTarget,
  });
  factory AwsEc2NetworkInterfaceViolation.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2NetworkInterfaceViolationFromJson(json);
}

/// Details of the rule violation in a security group when compared to the
/// master security group of the AWS Firewall Manager policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsVPCSecurityGroupViolation {
  /// List of rules specified in the security group of the AWS Firewall Manager
  /// policy that partially match the <code>ViolationTarget</code> rule.
  @_s.JsonKey(name: 'PartialMatches')
  final List<PartialMatch> partialMatches;

  /// Remediation options for the rule specified in the
  /// <code>ViolationTarget</code>.
  @_s.JsonKey(name: 'PossibleSecurityGroupRemediationActions')
  final List<SecurityGroupRemediationAction>
      possibleSecurityGroupRemediationActions;

  /// The security group rule that is being evaluated.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  /// A description of the security group that violates the policy.
  @_s.JsonKey(name: 'ViolationTargetDescription')
  final String violationTargetDescription;

  AwsVPCSecurityGroupViolation({
    this.partialMatches,
    this.possibleSecurityGroupRemediationActions,
    this.violationTarget,
    this.violationTargetDescription,
  });
  factory AwsVPCSecurityGroupViolation.fromJson(Map<String, dynamic> json) =>
      _$AwsVPCSecurityGroupViolationFromJson(json);
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
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>,
  /// <code>AWS::CloudFront::Distribution</code>, or
  /// <code>AWS::NetworkFirewall::FirewallPolicy</code>.
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
  @_s.JsonValue('ORG_UNIT')
  orgUnit,
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
class GetAppsListResponse {
  /// Information about the specified AWS Firewall Manager applications list.
  @_s.JsonKey(name: 'AppsList')
  final AppsListData appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  @_s.JsonKey(name: 'AppsListArn')
  final String appsListArn;

  GetAppsListResponse({
    this.appsList,
    this.appsListArn,
  });
  factory GetAppsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppsListResponseFromJson(json);
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
class GetProtocolsListResponse {
  /// Information about the specified AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ProtocolsList')
  final ProtocolsListData protocolsList;

  /// The Amazon Resource Name (ARN) of the specified protocols list.
  @_s.JsonKey(name: 'ProtocolsListArn')
  final String protocolsListArn;

  GetProtocolsListResponse({
    this.protocolsList,
    this.protocolsListArn,
  });
  factory GetProtocolsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProtocolsListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetViolationDetailsResponse {
  /// Violation detail for a resource.
  @_s.JsonKey(name: 'ViolationDetail')
  final ViolationDetail violationDetail;

  GetViolationDetailsResponse({
    this.violationDetail,
  });
  factory GetViolationDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetViolationDetailsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppsListsResponse {
  /// An array of <code>AppsListDataSummary</code> objects.
  @_s.JsonKey(name: 'AppsLists')
  final List<AppsListDataSummary> appsLists;

  /// If you specify a value for <code>MaxResults</code> in your list request, and
  /// you have more objects than the maximum, AWS Firewall Manager returns this
  /// token in the response. You can use this token in subsequent requests to
  /// retrieve the next batch of objects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAppsListsResponse({
    this.appsLists,
    this.nextToken,
  });
  factory ListAppsListsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppsListsResponseFromJson(json);
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
class ListProtocolsListsResponse {
  /// If you specify a value for <code>MaxResults</code> in your list request, and
  /// you have more objects than the maximum, AWS Firewall Manager returns this
  /// token in the response. You can use this token in subsequent requests to
  /// retrieve the next batch of objects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>ProtocolsListDataSummary</code> objects.
  @_s.JsonKey(name: 'ProtocolsLists')
  final List<ProtocolsListDataSummary> protocolsLists;

  ListProtocolsListsResponse({
    this.nextToken,
    this.protocolsLists,
  });
  factory ListProtocolsListsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProtocolsListsResponseFromJson(json);
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

/// Violation details for AWS Network Firewall for a subnet that's not
/// associated to the expected Firewall Manager managed route table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFirewallMissingExpectedRTViolation {
  /// The Availability Zone of a violating subnet.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The resource ID of the current route table that's associated with the
  /// subnet, if one is available.
  @_s.JsonKey(name: 'CurrentRouteTable')
  final String currentRouteTable;

  /// The resource ID of the route table that should be associated with the
  /// subnet.
  @_s.JsonKey(name: 'ExpectedRouteTable')
  final String expectedRouteTable;

  /// The resource ID of the VPC associated with a violating subnet.
  @_s.JsonKey(name: 'VPC')
  final String vpc;

  /// The ID of the AWS Network Firewall or VPC resource that's in violation.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  NetworkFirewallMissingExpectedRTViolation({
    this.availabilityZone,
    this.currentRouteTable,
    this.expectedRouteTable,
    this.vpc,
    this.violationTarget,
  });
  factory NetworkFirewallMissingExpectedRTViolation.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkFirewallMissingExpectedRTViolationFromJson(json);
}

/// Violation details for AWS Network Firewall for a subnet that doesn't have a
/// Firewall Manager managed firewall in its VPC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFirewallMissingFirewallViolation {
  /// The Availability Zone of a violating subnet.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The reason the resource has this violation, if one is available.
  @_s.JsonKey(name: 'TargetViolationReason')
  final String targetViolationReason;

  /// The resource ID of the VPC associated with a violating subnet.
  @_s.JsonKey(name: 'VPC')
  final String vpc;

  /// The ID of the AWS Network Firewall or VPC resource that's in violation.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  NetworkFirewallMissingFirewallViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });
  factory NetworkFirewallMissingFirewallViolation.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkFirewallMissingFirewallViolationFromJson(json);
}

/// Violation details for AWS Network Firewall for an Availability Zone that's
/// missing the expected Firewall Manager managed subnet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFirewallMissingSubnetViolation {
  /// The Availability Zone of a violating subnet.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The reason the resource has this violation, if one is available.
  @_s.JsonKey(name: 'TargetViolationReason')
  final String targetViolationReason;

  /// The resource ID of the VPC associated with a violating subnet.
  @_s.JsonKey(name: 'VPC')
  final String vpc;

  /// The ID of the AWS Network Firewall or VPC resource that's in violation.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  NetworkFirewallMissingSubnetViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });
  factory NetworkFirewallMissingSubnetViolation.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkFirewallMissingSubnetViolationFromJson(json);
}

/// The definition of the AWS Network Firewall firewall policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFirewallPolicyDescription {
  /// The stateful rule groups that are used in the Network Firewall firewall
  /// policy.
  @_s.JsonKey(name: 'StatefulRuleGroups')
  final List<StatefulRuleGroup> statefulRuleGroups;

  /// Names of custom actions that are available for use in the stateless default
  /// actions settings.
  @_s.JsonKey(name: 'StatelessCustomActions')
  final List<String> statelessCustomActions;

  /// The actions to take on packets that don't match any of the stateless rule
  /// groups.
  @_s.JsonKey(name: 'StatelessDefaultActions')
  final List<String> statelessDefaultActions;

  /// The actions to take on packet fragments that don't match any of the
  /// stateless rule groups.
  @_s.JsonKey(name: 'StatelessFragmentDefaultActions')
  final List<String> statelessFragmentDefaultActions;

  /// The stateless rule groups that are used in the Network Firewall firewall
  /// policy.
  @_s.JsonKey(name: 'StatelessRuleGroups')
  final List<StatelessRuleGroup> statelessRuleGroups;

  NetworkFirewallPolicyDescription({
    this.statefulRuleGroups,
    this.statelessCustomActions,
    this.statelessDefaultActions,
    this.statelessFragmentDefaultActions,
    this.statelessRuleGroups,
  });
  factory NetworkFirewallPolicyDescription.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkFirewallPolicyDescriptionFromJson(json);
}

/// Violation details for AWS Network Firewall for a firewall policy that has a
/// different <a>NetworkFirewallPolicyDescription</a> than is required by the
/// Firewall Manager policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFirewallPolicyModifiedViolation {
  /// The policy that's currently in use in the individual account.
  @_s.JsonKey(name: 'CurrentPolicyDescription')
  final NetworkFirewallPolicyDescription currentPolicyDescription;

  /// The policy that should be in use in the individual account in order to be
  /// compliant.
  @_s.JsonKey(name: 'ExpectedPolicyDescription')
  final NetworkFirewallPolicyDescription expectedPolicyDescription;

  /// The ID of the AWS Network Firewall or VPC resource that's in violation.
  @_s.JsonKey(name: 'ViolationTarget')
  final String violationTarget;

  NetworkFirewallPolicyModifiedViolation({
    this.currentPolicyDescription,
    this.expectedPolicyDescription,
    this.violationTarget,
  });
  factory NetworkFirewallPolicyModifiedViolation.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkFirewallPolicyModifiedViolationFromJson(json);
}

/// The reference rule that partially matches the <code>ViolationTarget</code>
/// rule and violation reason.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PartialMatch {
  /// The reference rule from the master security group of the AWS Firewall
  /// Manager policy.
  @_s.JsonKey(name: 'Reference')
  final String reference;

  /// The violation reason.
  @_s.JsonKey(name: 'TargetViolationReasons')
  final List<String> targetViolationReasons;

  PartialMatch({
    this.reference,
    this.targetViolationReasons,
  });
  factory PartialMatch.fromJson(Map<String, dynamic> json) =>
      _$PartialMatchFromJson(json);
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

  /// The name of the AWS Firewall Manager policy.
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
  /// the value is <code>AWS::EC2::SecurityGroup</code>. For an AWS Network
  /// Firewall policy, the value is <code>AWS::EC2::VPC</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// Details about the security service that is being used to protect the
  /// resources.
  @_s.JsonKey(name: 'SecurityServicePolicyData')
  final SecurityServicePolicyData securityServicePolicyData;

  /// Specifies the AWS account IDs and AWS Organizations organizational units
  /// (OUs) to exclude from the policy. Specifying an OU is the equivalent of
  /// specifying all accounts in the OU and in any of its child OUs, including any
  /// child OUs and accounts that are added at a later time.
  ///
  /// You can specify inclusions or exclusions, but not both. If you specify an
  /// <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all
  /// accounts specified by the <code>IncludeMap</code>, and does not evaluate any
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
  @_s.JsonKey(name: 'ExcludeMap')
  final Map<CustomerPolicyScopeIdType, List<String>> excludeMap;

  /// Specifies the AWS account IDs and AWS Organizations organizational units
  /// (OUs) to include in the policy. Specifying an OU is the equivalent of
  /// specifying all accounts in the OU and in any of its child OUs, including any
  /// child OUs and accounts that are added at a later time.
  ///
  /// You can specify inclusions or exclusions, but not both. If you specify an
  /// <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all
  /// accounts specified by the <code>IncludeMap</code>, and does not evaluate any
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpiredAt')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdated')
  final DateTime lastUpdated;

  /// The member account ID.
  @_s.JsonKey(name: 'MemberAccount')
  final String memberAccount;

  /// The ID of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The name of the AWS Firewall Manager policy.
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

  /// The name of the specified policy.
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
  /// the value is <code>AWS::EC2::SecurityGroup</code>. For an AWS Network
  /// Firewall policy, the value is <code>AWS::EC2::VPC</code>.
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

/// An AWS Firewall Manager protocols list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProtocolsListData {
  /// The name of the AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ListName')
  final String listName;

  /// An array of protocols in the AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ProtocolsList')
  final List<String> protocolsList;

  /// The time that the AWS Firewall Manager protocols list was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTime')
  final DateTime createTime;

  /// The time that the AWS Firewall Manager protocols list was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;

  /// The ID of the AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ListId')
  final String listId;

  /// A unique identifier for each update to the list. When you update the list,
  /// the update token must match the token of the current version of the
  /// application list. You can retrieve the update token by getting the list.
  @_s.JsonKey(name: 'ListUpdateToken')
  final String listUpdateToken;

  /// A map of previous version numbers to their corresponding protocol arrays.
  @_s.JsonKey(name: 'PreviousProtocolsList')
  final Map<String, List<String>> previousProtocolsList;

  ProtocolsListData({
    @_s.required this.listName,
    @_s.required this.protocolsList,
    this.createTime,
    this.lastUpdateTime,
    this.listId,
    this.listUpdateToken,
    this.previousProtocolsList,
  });
  factory ProtocolsListData.fromJson(Map<String, dynamic> json) =>
      _$ProtocolsListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProtocolsListDataToJson(this);
}

/// Details of the AWS Firewall Manager protocols list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtocolsListDataSummary {
  /// The Amazon Resource Name (ARN) of the specified protocols list.
  @_s.JsonKey(name: 'ListArn')
  final String listArn;

  /// The ID of the specified protocols list.
  @_s.JsonKey(name: 'ListId')
  final String listId;

  /// The name of the specified protocols list.
  @_s.JsonKey(name: 'ListName')
  final String listName;

  /// An array of protocols in the AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ProtocolsList')
  final List<String> protocolsList;

  ProtocolsListDataSummary({
    this.listArn,
    this.listId,
    this.listName,
    this.protocolsList,
  });
  factory ProtocolsListDataSummary.fromJson(Map<String, dynamic> json) =>
      _$ProtocolsListDataSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppsListResponse {
  /// The details of the AWS Firewall Manager applications list.
  @_s.JsonKey(name: 'AppsList')
  final AppsListData appsList;

  /// The Amazon Resource Name (ARN) of the applications list.
  @_s.JsonKey(name: 'AppsListArn')
  final String appsListArn;

  PutAppsListResponse({
    this.appsList,
    this.appsListArn,
  });
  factory PutAppsListResponse.fromJson(Map<String, dynamic> json) =>
      _$PutAppsListResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPolicyResponse {
  /// The details of the AWS Firewall Manager policy.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  /// The Amazon Resource Name (ARN) of the policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  PutPolicyResponse({
    this.policy,
    this.policyArn,
  });
  factory PutPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutProtocolsListResponse {
  /// The details of the AWS Firewall Manager protocols list.
  @_s.JsonKey(name: 'ProtocolsList')
  final ProtocolsListData protocolsList;

  /// The Amazon Resource Name (ARN) of the protocols list.
  @_s.JsonKey(name: 'ProtocolsListArn')
  final String protocolsListArn;

  PutProtocolsListResponse({
    this.protocolsList,
    this.protocolsListArn,
  });
  factory PutProtocolsListResponse.fromJson(Map<String, dynamic> json) =>
      _$PutProtocolsListResponseFromJson(json);
}

enum RemediationActionType {
  @_s.JsonValue('REMOVE')
  remove,
  @_s.JsonValue('MODIFY')
  modify,
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

/// Violation detail based on resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceViolation {
  /// Violation details for an EC2 instance.
  @_s.JsonKey(name: 'AwsEc2InstanceViolation')
  final AwsEc2InstanceViolation awsEc2InstanceViolation;

  /// Violation details for network interface.
  @_s.JsonKey(name: 'AwsEc2NetworkInterfaceViolation')
  final AwsEc2NetworkInterfaceViolation awsEc2NetworkInterfaceViolation;

  /// Violation details for security groups.
  @_s.JsonKey(name: 'AwsVPCSecurityGroupViolation')
  final AwsVPCSecurityGroupViolation awsVPCSecurityGroupViolation;

  /// Violation detail for an Network Firewall policy that indicates that a subnet
  /// is not associated with the expected Firewall Manager managed route table.
  @_s.JsonKey(name: 'NetworkFirewallMissingExpectedRTViolation')
  final NetworkFirewallMissingExpectedRTViolation
      networkFirewallMissingExpectedRTViolation;

  /// Violation detail for an Network Firewall policy that indicates that a subnet
  /// has no Firewall Manager managed firewall in its VPC.
  @_s.JsonKey(name: 'NetworkFirewallMissingFirewallViolation')
  final NetworkFirewallMissingFirewallViolation
      networkFirewallMissingFirewallViolation;

  /// Violation detail for an Network Firewall policy that indicates that an
  /// Availability Zone is missing the expected Firewall Manager managed subnet.
  @_s.JsonKey(name: 'NetworkFirewallMissingSubnetViolation')
  final NetworkFirewallMissingSubnetViolation
      networkFirewallMissingSubnetViolation;

  /// Violation detail for an Network Firewall policy that indicates that a
  /// firewall policy in an individual account has been modified in a way that
  /// makes it noncompliant. For example, the individual account owner might have
  /// deleted a rule group, changed the priority of a stateless rule group, or
  /// changed a policy default action.
  @_s.JsonKey(name: 'NetworkFirewallPolicyModifiedViolation')
  final NetworkFirewallPolicyModifiedViolation
      networkFirewallPolicyModifiedViolation;

  ResourceViolation({
    this.awsEc2InstanceViolation,
    this.awsEc2NetworkInterfaceViolation,
    this.awsVPCSecurityGroupViolation,
    this.networkFirewallMissingExpectedRTViolation,
    this.networkFirewallMissingFirewallViolation,
    this.networkFirewallMissingSubnetViolation,
    this.networkFirewallPolicyModifiedViolation,
  });
  factory ResourceViolation.fromJson(Map<String, dynamic> json) =>
      _$ResourceViolationFromJson(json);
}

/// Remediation option for the rule specified in the
/// <code>ViolationTarget</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityGroupRemediationAction {
  /// Brief description of the action that will be performed.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates if the current action is the default action.
  @_s.JsonKey(name: 'IsDefaultAction')
  final bool isDefaultAction;

  /// The remediation action that will be performed.
  @_s.JsonKey(name: 'RemediationActionType')
  final RemediationActionType remediationActionType;

  /// The final state of the rule specified in the <code>ViolationTarget</code>
  /// after it is remediated.
  @_s.JsonKey(name: 'RemediationResult')
  final SecurityGroupRuleDescription remediationResult;

  SecurityGroupRemediationAction({
    this.description,
    this.isDefaultAction,
    this.remediationActionType,
    this.remediationResult,
  });
  factory SecurityGroupRemediationAction.fromJson(Map<String, dynamic> json) =>
      _$SecurityGroupRemediationActionFromJson(json);
}

/// Describes a set of permissions for a security group rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityGroupRuleDescription {
  /// The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// type number. A value of <code>-1</code> indicates all ICMP/ICMPv6 types.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The IPv4 ranges for the security group rule.
  @_s.JsonKey(name: 'IPV4Range')
  final String iPV4Range;

  /// The IPv6 ranges for the security group rule.
  @_s.JsonKey(name: 'IPV6Range')
  final String iPV6Range;

  /// The ID of the prefix list for the security group rule.
  @_s.JsonKey(name: 'PrefixListId')
  final String prefixListId;

  /// The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>,
  /// <code>icmpv6</code>) or number.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  /// The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// code. A value of <code>-1</code> indicates all ICMP/ICMPv6 codes.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  SecurityGroupRuleDescription({
    this.fromPort,
    this.iPV4Range,
    this.iPV6Range,
    this.prefixListId,
    this.protocol,
    this.toPort,
  });
  factory SecurityGroupRuleDescription.fromJson(Map<String, dynamic> json) =>
      _$SecurityGroupRuleDescriptionFromJson(json);
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
  @_s.JsonValue('NETWORK_FIREWALL')
  networkFirewall,
}

/// AWS Network Firewall stateful rule group, used in a
/// <a>NetworkFirewallPolicyDescription</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StatefulRuleGroup {
  /// The resource ID of the rule group.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The name of the rule group.
  @_s.JsonKey(name: 'RuleGroupName')
  final String ruleGroupName;

  StatefulRuleGroup({
    this.resourceId,
    this.ruleGroupName,
  });
  factory StatefulRuleGroup.fromJson(Map<String, dynamic> json) =>
      _$StatefulRuleGroupFromJson(json);
}

/// AWS Network Firewall stateless rule group, used in a
/// <a>NetworkFirewallPolicyDescription</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StatelessRuleGroup {
  /// The priority of the rule group. AWS Network Firewall evaluates the stateless
  /// rule groups in a firewall policy starting from the lowest priority setting.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The resource ID of the rule group.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The name of the rule group.
  @_s.JsonKey(name: 'RuleGroupName')
  final String ruleGroupName;

  StatelessRuleGroup({
    this.priority,
    this.resourceId,
    this.ruleGroupName,
  });
  factory StatelessRuleGroup.fromJson(Map<String, dynamic> json) =>
      _$StatelessRuleGroupFromJson(json);
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

/// Violations for a resource based on the specified AWS Firewall Manager policy
/// and AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ViolationDetail {
  /// The AWS account that the violation details were requested for.
  @_s.JsonKey(name: 'MemberAccount')
  final String memberAccount;

  /// The ID of the AWS Firewall Manager policy that the violation details were
  /// requested for.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The resource ID that the violation details were requested for.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The resource type that the violation details were requested for.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// List of violations for the requested resource.
  @_s.JsonKey(name: 'ResourceViolations')
  final List<ResourceViolation> resourceViolations;

  /// Brief description for the requested resource.
  @_s.JsonKey(name: 'ResourceDescription')
  final String resourceDescription;

  /// The <code>ResourceTag</code> objects associated with the resource.
  @_s.JsonKey(name: 'ResourceTags')
  final List<Tag> resourceTags;

  ViolationDetail({
    @_s.required this.memberAccount,
    @_s.required this.policyId,
    @_s.required this.resourceId,
    @_s.required this.resourceType,
    @_s.required this.resourceViolations,
    this.resourceDescription,
    this.resourceTags,
  });
  factory ViolationDetail.fromJson(Map<String, dynamic> json) =>
      _$ViolationDetailFromJson(json);
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
  @_s.JsonValue('MISSING_FIREWALL')
  missingFirewall,
  @_s.JsonValue('MISSING_FIREWALL_SUBNET_IN_AZ')
  missingFirewallSubnetInAz,
  @_s.JsonValue('MISSING_EXPECTED_ROUTE_TABLE')
  missingExpectedRouteTable,
  @_s.JsonValue('NETWORK_FIREWALL_POLICY_MODIFIED')
  networkFirewallPolicyModified,
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
