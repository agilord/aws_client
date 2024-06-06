// ignore_for_file: deprecated_member_use_from_same_package
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

/// This is the <i>Firewall Manager API Reference</i>. This guide is for
/// developers who need detailed information about the Firewall Manager API
/// actions, data types, and errors. For detailed information about Firewall
/// Manager features, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html">Firewall
/// Manager Developer Guide</a>.
///
/// Some API actions require explicit resource permissions. For information, see
/// the developer guide topic <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service">Service
/// roles for Firewall Manager</a>.
class Fms {
  final _s.JsonProtocol _protocol;
  Fms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'fms',
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

  /// Sets a Firewall Manager default administrator account. The Firewall
  /// Manager default administrator account can manage third-party firewalls and
  /// has full administrative scope that allows administration of all policy
  /// types, accounts, organizational units, and Regions. This account must be a
  /// member account of the organization in Organizations whose resources you
  /// want to protect.
  ///
  /// For information about working with Firewall Manager administrator
  /// accounts, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/fms-administrators.html">Managing
  /// Firewall Manager administrators</a> in the <i>Firewall Manager Developer
  /// Guide</i>.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccount] :
  /// The Amazon Web Services account ID to associate with Firewall Manager as
  /// the Firewall Manager default administrator account. This account must be a
  /// member account of the organization in Organizations whose resources you
  /// want to protect. For more information about Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing
  /// the Amazon Web Services Accounts in Your Organization</a>.
  Future<void> associateAdminAccount({
    required String adminAccount,
  }) async {
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

  /// Sets the Firewall Manager policy administrator as a tenant administrator
  /// of a third-party firewall service. A tenant is an instance of the
  /// third-party firewall service that's associated with your Amazon Web
  /// Services customer account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [thirdPartyFirewall] :
  /// The name of the third-party firewall vendor.
  Future<AssociateThirdPartyFirewallResponse> associateThirdPartyFirewall({
    required ThirdPartyFirewall thirdPartyFirewall,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.AssociateThirdPartyFirewall'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ThirdPartyFirewall': thirdPartyFirewall.toValue(),
      },
    );

    return AssociateThirdPartyFirewallResponse.fromJson(jsonResponse.body);
  }

  /// Associate resources to a Firewall Manager resource set.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [items] :
  /// The uniform resource identifiers (URIs) of resources that should be
  /// associated to the resource set. The URIs must be Amazon Resource Names
  /// (ARNs).
  ///
  /// Parameter [resourceSetIdentifier] :
  /// A unique identifier for the resource set, used in a request to refer to
  /// the resource set.
  Future<BatchAssociateResourceResponse> batchAssociateResource({
    required List<String> items,
    required String resourceSetIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.BatchAssociateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Items': items,
        'ResourceSetIdentifier': resourceSetIdentifier,
      },
    );

    return BatchAssociateResourceResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates resources from a Firewall Manager resource set.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [items] :
  /// The uniform resource identifiers (URI) of resources that should be
  /// disassociated from the resource set. The URIs must be Amazon Resource
  /// Names (ARNs).
  ///
  /// Parameter [resourceSetIdentifier] :
  /// A unique identifier for the resource set, used in a request to refer to
  /// the resource set.
  Future<BatchDisassociateResourceResponse> batchDisassociateResource({
    required List<String> items,
    required String resourceSetIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.BatchDisassociateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Items': items,
        'ResourceSetIdentifier': resourceSetIdentifier,
      },
    );

    return BatchDisassociateResourceResponse.fromJson(jsonResponse.body);
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
  /// </ul> <note>
  /// For security group common policies, even if set to <code>False</code>,
  /// Firewall Manager deletes all security groups created by Firewall Manager
  /// that aren't associated with any other resources through another policy.
  /// </note>
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

  /// Deletes the specified <a>ResourceSet</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [identifier] :
  /// A unique identifier for the resource set, used in a request to refer to
  /// the resource set.
  Future<void> deleteResourceSet({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DeleteResourceSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
      },
    );
  }

  /// Disassociates an Firewall Manager administrator account. To set a
  /// different account as an Firewall Manager administrator, submit a
  /// <a>PutAdminAccount</a> request. To set an account as a default
  /// administrator account, you must submit an <a>AssociateAdminAccount</a>
  /// request.
  ///
  /// Disassociation of the default administrator account follows the first in,
  /// last out principle. If you are the default administrator, all Firewall
  /// Manager administrators within the organization must first disassociate
  /// their accounts before you can disassociate your account.
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

  /// Disassociates a Firewall Manager policy administrator from a third-party
  /// firewall tenant. When you call
  /// <code>DisassociateThirdPartyFirewall</code>, the third-party firewall
  /// vendor deletes all of the firewalls that are associated with the account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [thirdPartyFirewall] :
  /// The name of the third-party firewall vendor.
  Future<DisassociateThirdPartyFirewallResponse>
      disassociateThirdPartyFirewall({
    required ThirdPartyFirewall thirdPartyFirewall,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.DisassociateThirdPartyFirewall'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ThirdPartyFirewall': thirdPartyFirewall.toValue(),
      },
    );

    return DisassociateThirdPartyFirewallResponse.fromJson(jsonResponse.body);
  }

  /// Returns the Organizations account that is associated with Firewall Manager
  /// as the Firewall Manager default administrator.
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

  /// Returns information about the specified account's administrative scope.
  /// The administrative scope defines the resources that an Firewall Manager
  /// administrator can manage.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccount] :
  /// The administrator account that you want to get the details for.
  Future<GetAdminScopeResponse> getAdminScope({
    required String adminAccount,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetAdminScope'
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

    return GetAdminScopeResponse.fromJson(jsonResponse.body);
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
  /// The reasons for resources being considered compliant depend on the
  /// Firewall Manager policy type.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Gets information about a specific resource set.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identifier] :
  /// A unique identifier for the resource set, used in a request to refer to
  /// the resource set.
  Future<GetResourceSetResponse> getResourceSet({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetResourceSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
      },
    );

    return GetResourceSetResponse.fromJson(jsonResponse.body);
  }

  /// The onboarding status of a Firewall Manager admin account to third-party
  /// firewall vendor tenant.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [thirdPartyFirewall] :
  /// The name of the third-party firewall vendor.
  Future<GetThirdPartyFirewallAssociationStatusResponse>
      getThirdPartyFirewallAssociationStatus({
    required ThirdPartyFirewall thirdPartyFirewall,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.GetThirdPartyFirewallAssociationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ThirdPartyFirewall': thirdPartyFirewall.toValue(),
      },
    );

    return GetThirdPartyFirewallAssociationStatusResponse.fromJson(
        jsonResponse.body);
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
  /// The ID of the Firewall Manager policy that you want the details for. You
  /// can get violation details for the following policy types:
  ///
  /// <ul>
  /// <li>
  /// DNS Firewall
  /// </li>
  /// <li>
  /// Imported Network Firewall
  /// </li>
  /// <li>
  /// Network Firewall
  /// </li>
  /// <li>
  /// Security group content audit
  /// </li>
  /// <li>
  /// Network ACL
  /// </li>
  /// <li>
  /// Third-party firewall
  /// </li>
  /// </ul>
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

  /// Returns a <code>AdminAccounts</code> object that lists the Firewall
  /// Manager administrators within the organization that are onboarded to
  /// Firewall Manager by <a>AssociateAdminAccount</a>.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Firewall Manager returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListAdminAccountsForOrganizationResponse>
      listAdminAccountsForOrganization({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListAdminAccountsForOrganization'
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

    return ListAdminAccountsForOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Lists the accounts that are managing the specified Organizations member
  /// account. This is useful for any member account so that they can view the
  /// accounts who are managing their account. This operation only returns the
  /// managing administrators that have the requested account within their
  /// <a>AdminScope</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Firewall Manager returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListAdminsManagingAccountResponse> listAdminsManagingAccount({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListAdminsManagingAccount'
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

    return ListAdminsManagingAccountResponse.fromJson(jsonResponse.body);
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Returns an array of resources in the organization's accounts that are
  /// available to be associated with a resource set.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [memberAccountIds] :
  /// The Amazon Web Services account IDs to discover resources in. Only one
  /// account is supported per request. The account must be a member of your
  /// organization.
  ///
  /// Parameter [resourceType] :
  /// The type of resources to discover.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Firewall Manager returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListDiscoveredResourcesResponse> listDiscoveredResources({
    required List<String> memberAccountIds,
    required String resourceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListDiscoveredResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MemberAccountIds': memberAccountIds,
        'ResourceType': resourceType,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDiscoveredResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a <code>MemberAccounts</code> object that lists the member
  /// accounts in the administrator's Amazon Web Services organization.
  ///
  /// Either an Firewall Manager administrator or the organization's management
  /// account can make this request.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
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

  /// Returns an array of resources that are currently associated to a resource
  /// set.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// A unique identifier for the resource set, used in a request to refer to
  /// the resource set.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Firewall Manager returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListResourceSetResourcesResponse> listResourceSetResources({
    required String identifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListResourceSetResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourceSetResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>ResourceSetSummary</code> objects.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want Firewall Manager to return for
  /// this request. If more objects are available, in the response, Firewall
  /// Manager provides a <code>NextToken</code> value that you can use in a
  /// subsequent call to get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds
  /// the maximum you requested, Firewall Manager returns a
  /// <code>NextToken</code> value in the response. To retrieve the next batch
  /// of objects, use the token returned from the prior request in your next
  /// request.
  Future<ListResourceSetsResponse> listResourceSets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListResourceSets'
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

    return ListResourceSetsResponse.fromJson(jsonResponse.body);
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

  /// Retrieves a list of all of the third-party firewall policies that are
  /// associated with the third-party firewall administrator's account.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of third-party firewall policies that you want Firewall
  /// Manager to return. If the specified third-party firewall vendor is
  /// associated with more than <code>MaxResults</code> firewall policies, the
  /// response includes a <code>NextToken</code> element. <code>NextToken</code>
  /// contains an encrypted token that identifies the first third-party firewall
  /// policies that Firewall Manager will return if you submit another request.
  ///
  /// Parameter [thirdPartyFirewall] :
  /// The name of the third-party firewall vendor.
  ///
  /// Parameter [nextToken] :
  /// If the previous response included a <code>NextToken</code> element, the
  /// specified third-party firewall vendor is associated with more third-party
  /// firewall policies. To get more third-party firewall policies, submit
  /// another <code>ListThirdPartyFirewallFirewallPoliciesRequest</code>
  /// request.
  ///
  /// For the value of <code>NextToken</code>, specify the value of
  /// <code>NextToken</code> from the previous response. If the previous
  /// response didn't include a <code>NextToken</code> element, there are no
  /// more third-party firewall policies to get.
  Future<ListThirdPartyFirewallFirewallPoliciesResponse>
      listThirdPartyFirewallFirewallPolicies({
    required int maxResults,
    required ThirdPartyFirewall thirdPartyFirewall,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.ListThirdPartyFirewallFirewallPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'ThirdPartyFirewall': thirdPartyFirewall.toValue(),
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListThirdPartyFirewallFirewallPoliciesResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates or updates an Firewall Manager administrator account. The account
  /// must be a member of the organization that was onboarded to Firewall
  /// Manager by <a>AssociateAdminAccount</a>. Only the organization's
  /// management account can create an Firewall Manager administrator account.
  /// When you create an Firewall Manager administrator account, the service
  /// checks to see if the account is already a delegated administrator within
  /// Organizations. If the account isn't a delegated administrator, Firewall
  /// Manager calls Organizations to delegate the account within Organizations.
  /// For more information about administrator accounts within Organizations,
  /// see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing
  /// the Amazon Web Services Accounts in Your Organization</a>.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [InternalErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adminAccount] :
  /// The Amazon Web Services account ID to add as an Firewall Manager
  /// administrator account. The account must be a member of the organization
  /// that was onboarded to Firewall Manager by <a>AssociateAdminAccount</a>.
  /// For more information about Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing
  /// the Amazon Web Services Accounts in Your Organization</a>.
  ///
  /// Parameter [adminScope] :
  /// Configures the resources that the specified Firewall Manager administrator
  /// can manage. As a best practice, set the administrative scope according to
  /// the principles of least privilege. Only grant the administrator the
  /// specific resources or permissions that they need to perform the duties of
  /// their role.
  Future<void> putAdminAccount({
    required String adminAccount,
    AdminScope? adminScope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutAdminAccount'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdminAccount': adminAccount,
        if (adminScope != null) 'AdminScope': adminScope,
      },
    );
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
  /// To perform this action outside of the console, you must first configure
  /// the SNS topic's access policy to allow the <code>SnsRoleName</code> to
  /// publish SNS logs. If the <code>SnsRoleName</code> provided is a role other
  /// than the <code>AWSServiceRoleForFMS</code> service-linked role, this role
  /// must have a trust relationship configured to allow the Firewall Manager
  /// service principal <code>fms.amazonaws.com</code> to assume this role. For
  /// information about configuring an SNS access policy, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service">Service
  /// roles for Firewall Manager</a> in the <i>Firewall Manager Developer
  /// Guide</i>.
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
  /// A Firewall Manager policy is specific to the individual policy type. If
  /// you want to enforce multiple policy types across accounts, you can create
  /// multiple policies. You can create more than one policy for each type.
  ///
  /// If you add a new account to an organization that you created with
  /// Organizations, Firewall Manager automatically applies the policy to the
  /// resources in that account that are within scope of the policy.
  ///
  /// Firewall Manager provides the following types of policies:
  ///
  /// <ul>
  /// <li>
  /// <b>WAF policy</b> - This policy applies WAF web ACL protections to
  /// specified accounts and resources.
  /// </li>
  /// <li>
  /// <b>Shield Advanced policy</b> - This policy applies Shield Advanced
  /// protection to specified accounts and resources.
  /// </li>
  /// <li>
  /// <b>Security Groups policy</b> - This type of policy gives you control over
  /// security groups that are in use throughout your organization in
  /// Organizations and lets you enforce a baseline set of rules across your
  /// organization.
  /// </li>
  /// <li>
  /// <b>Network ACL policy</b> - This type of policy gives you control over the
  /// network ACLs that are in use throughout your organization in Organizations
  /// and lets you enforce a baseline set of first and last network ACL rules
  /// across your organization.
  /// </li>
  /// <li>
  /// <b>Network Firewall policy</b> - This policy applies Network Firewall
  /// protection to your organization's VPCs.
  /// </li>
  /// <li>
  /// <b>DNS Firewall policy</b> - This policy applies Amazon Route 53 Resolver
  /// DNS Firewall protections to your organization's VPCs.
  /// </li>
  /// <li>
  /// <b>Third-party firewall policy</b> - This policy applies third-party
  /// firewall protections. Third-party firewalls are available by subscription
  /// through the Amazon Web Services Marketplace console at <a
  /// href="http://aws.amazon.com/marketplace">Amazon Web Services
  /// Marketplace</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>Palo Alto Networks Cloud NGFW policy</b> - This policy applies Palo
  /// Alto Networks Cloud Next Generation Firewall (NGFW) protections and Palo
  /// Alto Networks Cloud NGFW rulestacks to your organization's VPCs.
  /// </li>
  /// <li>
  /// <b>Fortigate CNF policy</b> - This policy applies Fortigate Cloud Native
  /// Firewall (CNF) protections. Fortigate CNF is a cloud-centered solution
  /// that blocks Zero-Day threats and secures cloud infrastructures with
  /// industry-leading advanced threat prevention, smart web application
  /// firewalls (WAF), and API protection.
  /// </li>
  /// </ul> </li>
  /// </ul>
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

  /// Creates the resource set.
  ///
  /// An Firewall Manager resource set defines the resources to import into an
  /// Firewall Manager policy from another Amazon Web Services service.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceSet] :
  /// Details about the resource set to be created or updated.&gt;
  ///
  /// Parameter [tagList] :
  /// Retrieves the tags associated with the specified resource set. Tags are
  /// key:value pairs that you can use to categorize and manage your resources,
  /// for purposes like billing. For example, you might set the tag key to
  /// "customer" and the value to the customer name or ID. You can specify one
  /// or more tags to add to each Amazon Web Services resource, up to 50 tags
  /// for a resource.
  Future<PutResourceSetResponse> putResourceSet({
    required ResourceSet resourceSet,
    List<Tag>? tagList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSFMS_20180101.PutResourceSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceSet': resourceSet,
        if (tagList != null) 'TagList': tagList,
      },
    );

    return PutResourceSetResponse.fromJson(jsonResponse.body);
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

extension AccountRoleStatusValueExtension on AccountRoleStatus {
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

extension AccountRoleStatusFromString on String {
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

/// Configures the accounts within the administrator's Organizations
/// organization that the specified Firewall Manager administrator can apply
/// policies to.
class AccountScope {
  /// The list of accounts within the organization that the specified Firewall
  /// Manager administrator either can or cannot apply policies to, based on the
  /// value of <code>ExcludeSpecifiedAccounts</code>. If
  /// <code>ExcludeSpecifiedAccounts</code> is set to <code>true</code>, then the
  /// Firewall Manager administrator can apply policies to all members of the
  /// organization except for the accounts in this list. If
  /// <code>ExcludeSpecifiedAccounts</code> is set to <code>false</code>, then the
  /// Firewall Manager administrator can only apply policies to the accounts in
  /// this list.
  final List<String>? accounts;

  /// A boolean value that indicates if the administrator can apply policies to
  /// all accounts within an organization. If true, the administrator can apply
  /// policies to all accounts within the organization. You can either enable
  /// management of all accounts through this operation, or you can specify a list
  /// of accounts to manage in <code>AccountScope$Accounts</code>. You cannot
  /// specify both.
  final bool? allAccountsEnabled;

  /// A boolean value that excludes the accounts in
  /// <code>AccountScope$Accounts</code> from the administrator's scope. If true,
  /// the Firewall Manager administrator can apply policies to all members of the
  /// organization except for the accounts listed in
  /// <code>AccountScope$Accounts</code>. You can either specify a list of
  /// accounts to exclude by <code>AccountScope$Accounts</code>, or you can enable
  /// management of all accounts by <code>AccountScope$AllAccountsEnabled</code>.
  /// You cannot specify both.
  final bool? excludeSpecifiedAccounts;

  AccountScope({
    this.accounts,
    this.allAccountsEnabled,
    this.excludeSpecifiedAccounts,
  });

  factory AccountScope.fromJson(Map<String, dynamic> json) {
    return AccountScope(
      accounts: (json['Accounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      allAccountsEnabled: json['AllAccountsEnabled'] as bool?,
      excludeSpecifiedAccounts: json['ExcludeSpecifiedAccounts'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final allAccountsEnabled = this.allAccountsEnabled;
    final excludeSpecifiedAccounts = this.excludeSpecifiedAccounts;
    return {
      if (accounts != null) 'Accounts': accounts,
      if (allAccountsEnabled != null) 'AllAccountsEnabled': allAccountsEnabled,
      if (excludeSpecifiedAccounts != null)
        'ExcludeSpecifiedAccounts': excludeSpecifiedAccounts,
    };
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

/// Contains high level information about the Firewall Manager administrator
/// account.
class AdminAccountSummary {
  /// The Amazon Web Services account ID of the Firewall Manager administrator's
  /// account.
  final String? adminAccount;

  /// A boolean value that indicates if the administrator is the default
  /// administrator. If true, then this is the default administrator account. The
  /// default administrator can manage third-party firewalls and has full
  /// administrative scope. There is only one default administrator account per
  /// organization. For information about Firewall Manager default administrator
  /// accounts, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html">Managing
  /// Firewall Manager administrators</a> in the <i>Firewall Manager Developer
  /// Guide</i>.
  final bool? defaultAdmin;

  /// The current status of the request to onboard a member account as an Firewall
  /// Manager administrator.
  ///
  /// <ul>
  /// <li>
  /// <code>ONBOARDING</code> - The account is onboarding to Firewall Manager as
  /// an administrator.
  /// </li>
  /// <li>
  /// <code>ONBOARDING_COMPLETE</code> - Firewall Manager The account is onboarded
  /// to Firewall Manager as an administrator, and can perform actions on the
  /// resources defined in their <a>AdminScope</a>.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING</code> - The account is being removed as an Firewall
  /// Manager administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING_COMPLETE</code> - The account has been removed as an
  /// Firewall Manager administrator.
  /// </li>
  /// </ul>
  final OrganizationStatus? status;

  AdminAccountSummary({
    this.adminAccount,
    this.defaultAdmin,
    this.status,
  });

  factory AdminAccountSummary.fromJson(Map<String, dynamic> json) {
    return AdminAccountSummary(
      adminAccount: json['AdminAccount'] as String?,
      defaultAdmin: json['DefaultAdmin'] as bool?,
      status: (json['Status'] as String?)?.toOrganizationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccount = this.adminAccount;
    final defaultAdmin = this.defaultAdmin;
    final status = this.status;
    return {
      if (adminAccount != null) 'AdminAccount': adminAccount,
      if (defaultAdmin != null) 'DefaultAdmin': defaultAdmin,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Defines the resources that the Firewall Manager administrator can manage.
/// For more information about administrative scope, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/fms-administrators.html">Managing
/// Firewall Manager administrators</a> in the <i>Firewall Manager Developer
/// Guide</i>.
class AdminScope {
  /// Defines the accounts that the specified Firewall Manager administrator can
  /// apply policies to.
  final AccountScope? accountScope;

  /// Defines the Organizations organizational units that the specified Firewall
  /// Manager administrator can apply policies to. For more information about OUs
  /// in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html">Managing
  /// organizational units (OUs) </a> in the <i>Organizations User Guide</i>.
  final OrganizationalUnitScope? organizationalUnitScope;

  /// Defines the Firewall Manager policy types that the specified Firewall
  /// Manager administrator can create and manage.
  final PolicyTypeScope? policyTypeScope;

  /// Defines the Amazon Web Services Regions that the specified Firewall Manager
  /// administrator can perform actions in.
  final RegionScope? regionScope;

  AdminScope({
    this.accountScope,
    this.organizationalUnitScope,
    this.policyTypeScope,
    this.regionScope,
  });

  factory AdminScope.fromJson(Map<String, dynamic> json) {
    return AdminScope(
      accountScope: json['AccountScope'] != null
          ? AccountScope.fromJson(json['AccountScope'] as Map<String, dynamic>)
          : null,
      organizationalUnitScope: json['OrganizationalUnitScope'] != null
          ? OrganizationalUnitScope.fromJson(
              json['OrganizationalUnitScope'] as Map<String, dynamic>)
          : null,
      policyTypeScope: json['PolicyTypeScope'] != null
          ? PolicyTypeScope.fromJson(
              json['PolicyTypeScope'] as Map<String, dynamic>)
          : null,
      regionScope: json['RegionScope'] != null
          ? RegionScope.fromJson(json['RegionScope'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final organizationalUnitScope = this.organizationalUnitScope;
    final policyTypeScope = this.policyTypeScope;
    final regionScope = this.regionScope;
    return {
      if (accountScope != null) 'AccountScope': accountScope,
      if (organizationalUnitScope != null)
        'OrganizationalUnitScope': organizationalUnitScope,
      if (policyTypeScope != null) 'PolicyTypeScope': policyTypeScope,
      if (regionScope != null) 'RegionScope': regionScope,
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

class AssociateThirdPartyFirewallResponse {
  /// The current status for setting a Firewall Manager policy administrator's
  /// account as an administrator of the third-party firewall tenant.
  ///
  /// <ul>
  /// <li>
  /// <code>ONBOARDING</code> - The Firewall Manager policy administrator is being
  /// designated as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>ONBOARD_COMPLETE</code> - The Firewall Manager policy administrator is
  /// designated as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING</code> - The Firewall Manager policy administrator is
  /// being removed as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARD_COMPLETE</code> - The Firewall Manager policy administrator
  /// has been removed as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>NOT_EXIST</code> - The Firewall Manager policy administrator doesn't
  /// exist as a tenant administrator.
  /// </li>
  /// </ul>
  final ThirdPartyFirewallAssociationStatus? thirdPartyFirewallStatus;

  AssociateThirdPartyFirewallResponse({
    this.thirdPartyFirewallStatus,
  });

  factory AssociateThirdPartyFirewallResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateThirdPartyFirewallResponse(
      thirdPartyFirewallStatus: (json['ThirdPartyFirewallStatus'] as String?)
          ?.toThirdPartyFirewallAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final thirdPartyFirewallStatus = this.thirdPartyFirewallStatus;
    return {
      if (thirdPartyFirewallStatus != null)
        'ThirdPartyFirewallStatus': thirdPartyFirewallStatus.toValue(),
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

class BatchAssociateResourceResponse {
  /// The resources that failed to associate to the resource set.
  final List<FailedItem> failedItems;

  /// A unique identifier for the resource set, used in a request to refer to the
  /// resource set.
  final String resourceSetIdentifier;

  BatchAssociateResourceResponse({
    required this.failedItems,
    required this.resourceSetIdentifier,
  });

  factory BatchAssociateResourceResponse.fromJson(Map<String, dynamic> json) {
    return BatchAssociateResourceResponse(
      failedItems: (json['FailedItems'] as List)
          .whereNotNull()
          .map((e) => FailedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceSetIdentifier: json['ResourceSetIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final resourceSetIdentifier = this.resourceSetIdentifier;
    return {
      'FailedItems': failedItems,
      'ResourceSetIdentifier': resourceSetIdentifier,
    };
  }
}

class BatchDisassociateResourceResponse {
  /// The resources that failed to disassociate from the resource set.
  final List<FailedItem> failedItems;

  /// A unique identifier for the resource set, used in a request to refer to the
  /// resource set.
  final String resourceSetIdentifier;

  BatchDisassociateResourceResponse({
    required this.failedItems,
    required this.resourceSetIdentifier,
  });

  factory BatchDisassociateResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateResourceResponse(
      failedItems: (json['FailedItems'] as List)
          .whereNotNull()
          .map((e) => FailedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceSetIdentifier: json['ResourceSetIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final failedItems = this.failedItems;
    final resourceSetIdentifier = this.resourceSetIdentifier;
    return {
      'FailedItems': failedItems,
      'ResourceSetIdentifier': resourceSetIdentifier,
    };
  }
}

/// Details of the resource that is not protected by the policy.
class ComplianceViolator {
  /// Metadata about the resource that doesn't comply with the policy scope.
  final Map<String, String>? metadata;

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
    this.metadata,
    this.resourceId,
    this.resourceType,
    this.violationReason,
  });

  factory ComplianceViolator.fromJson(Map<String, dynamic> json) {
    return ComplianceViolator(
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
      violationReason:
          (json['ViolationReason'] as String?)?.toViolationReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final violationReason = this.violationReason;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (violationReason != null) 'ViolationReason': violationReason.toValue(),
    };
  }
}

/// Information about the <code>CreateNetworkAcl</code> action in Amazon EC2.
/// This is a remediation option in <code>RemediationAction</code>.
class CreateNetworkAclAction {
  /// Brief description of this remediation action.
  final String? description;

  /// Indicates whether it is possible for Firewall Manager to perform this
  /// remediation action. A false value indicates that auto remediation is
  /// disabled or Firewall Manager is unable to perform the action due to a
  /// conflict of some kind.
  final bool? fMSCanRemediate;

  /// The VPC that's associated with the remediation action.
  final ActionTarget? vpc;

  CreateNetworkAclAction({
    this.description,
    this.fMSCanRemediate,
    this.vpc,
  });

  factory CreateNetworkAclAction.fromJson(Map<String, dynamic> json) {
    return CreateNetworkAclAction(
      description: json['Description'] as String?,
      fMSCanRemediate: json['FMSCanRemediate'] as bool?,
      vpc: json['Vpc'] != null
          ? ActionTarget.fromJson(json['Vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final fMSCanRemediate = this.fMSCanRemediate;
    final vpc = this.vpc;
    return {
      if (description != null) 'Description': description,
      if (fMSCanRemediate != null) 'FMSCanRemediate': fMSCanRemediate,
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

/// Information about the <code>CreateNetworkAclEntries</code> action in Amazon
/// EC2. This is a remediation option in <code>RemediationAction</code>.
class CreateNetworkAclEntriesAction {
  /// Brief description of this remediation action.
  final String? description;

  /// Indicates whether it is possible for Firewall Manager to perform this
  /// remediation action. A false value indicates that auto remediation is
  /// disabled or Firewall Manager is unable to perform the action due to a
  /// conflict of some kind.
  final bool? fMSCanRemediate;

  /// Lists the entries that the remediation action would create.
  final List<EntryDescription>? networkAclEntriesToBeCreated;

  /// The network ACL that's associated with the remediation action.
  final ActionTarget? networkAclId;

  CreateNetworkAclEntriesAction({
    this.description,
    this.fMSCanRemediate,
    this.networkAclEntriesToBeCreated,
    this.networkAclId,
  });

  factory CreateNetworkAclEntriesAction.fromJson(Map<String, dynamic> json) {
    return CreateNetworkAclEntriesAction(
      description: json['Description'] as String?,
      fMSCanRemediate: json['FMSCanRemediate'] as bool?,
      networkAclEntriesToBeCreated:
          (json['NetworkAclEntriesToBeCreated'] as List?)
              ?.whereNotNull()
              .map((e) => EntryDescription.fromJson(e as Map<String, dynamic>))
              .toList(),
      networkAclId: json['NetworkAclId'] != null
          ? ActionTarget.fromJson(json['NetworkAclId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final fMSCanRemediate = this.fMSCanRemediate;
    final networkAclEntriesToBeCreated = this.networkAclEntriesToBeCreated;
    final networkAclId = this.networkAclId;
    return {
      if (description != null) 'Description': description,
      if (fMSCanRemediate != null) 'FMSCanRemediate': fMSCanRemediate,
      if (networkAclEntriesToBeCreated != null)
        'NetworkAclEntriesToBeCreated': networkAclEntriesToBeCreated,
      if (networkAclId != null) 'NetworkAclId': networkAclId,
    };
  }
}

enum CustomerPolicyScopeIdType {
  account,
  orgUnit,
}

extension CustomerPolicyScopeIdTypeValueExtension on CustomerPolicyScopeIdType {
  String toValue() {
    switch (this) {
      case CustomerPolicyScopeIdType.account:
        return 'ACCOUNT';
      case CustomerPolicyScopeIdType.orgUnit:
        return 'ORG_UNIT';
    }
  }
}

extension CustomerPolicyScopeIdTypeFromString on String {
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

enum CustomerPolicyStatus {
  active,
  outOfAdminScope,
}

extension CustomerPolicyStatusValueExtension on CustomerPolicyStatus {
  String toValue() {
    switch (this) {
      case CustomerPolicyStatus.active:
        return 'ACTIVE';
      case CustomerPolicyStatus.outOfAdminScope:
        return 'OUT_OF_ADMIN_SCOPE';
    }
  }
}

extension CustomerPolicyStatusFromString on String {
  CustomerPolicyStatus toCustomerPolicyStatus() {
    switch (this) {
      case 'ACTIVE':
        return CustomerPolicyStatus.active;
      case 'OUT_OF_ADMIN_SCOPE':
        return CustomerPolicyStatus.outOfAdminScope;
    }
    throw Exception('$this is not known in enum CustomerPolicyStatus');
  }
}

/// Information about the <code>DeleteNetworkAclEntries</code> action in Amazon
/// EC2. This is a remediation option in <code>RemediationAction</code>.
class DeleteNetworkAclEntriesAction {
  /// Brief description of this remediation action.
  final String? description;

  /// Indicates whether it is possible for Firewall Manager to perform this
  /// remediation action. A false value indicates that auto remediation is
  /// disabled or Firewall Manager is unable to perform the action due to a
  /// conflict of some kind.
  final bool? fMSCanRemediate;

  /// Lists the entries that the remediation action would delete.
  final List<EntryDescription>? networkAclEntriesToBeDeleted;

  /// The network ACL that's associated with the remediation action.
  final ActionTarget? networkAclId;

  DeleteNetworkAclEntriesAction({
    this.description,
    this.fMSCanRemediate,
    this.networkAclEntriesToBeDeleted,
    this.networkAclId,
  });

  factory DeleteNetworkAclEntriesAction.fromJson(Map<String, dynamic> json) {
    return DeleteNetworkAclEntriesAction(
      description: json['Description'] as String?,
      fMSCanRemediate: json['FMSCanRemediate'] as bool?,
      networkAclEntriesToBeDeleted:
          (json['NetworkAclEntriesToBeDeleted'] as List?)
              ?.whereNotNull()
              .map((e) => EntryDescription.fromJson(e as Map<String, dynamic>))
              .toList(),
      networkAclId: json['NetworkAclId'] != null
          ? ActionTarget.fromJson(json['NetworkAclId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final fMSCanRemediate = this.fMSCanRemediate;
    final networkAclEntriesToBeDeleted = this.networkAclEntriesToBeDeleted;
    final networkAclId = this.networkAclId;
    return {
      if (description != null) 'Description': description,
      if (fMSCanRemediate != null) 'FMSCanRemediate': fMSCanRemediate,
      if (networkAclEntriesToBeDeleted != null)
        'NetworkAclEntriesToBeDeleted': networkAclEntriesToBeDeleted,
      if (networkAclId != null) 'NetworkAclId': networkAclId,
    };
  }
}

enum DependentServiceName {
  awsconfig,
  awswaf,
  awsshieldAdvanced,
  awsvpc,
}

extension DependentServiceNameValueExtension on DependentServiceName {
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

extension DependentServiceNameFromString on String {
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

extension DestinationTypeValueExtension on DestinationType {
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

extension DestinationTypeFromString on String {
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

class DisassociateThirdPartyFirewallResponse {
  /// The current status for the disassociation of a Firewall Manager
  /// administrators account with a third-party firewall.
  final ThirdPartyFirewallAssociationStatus? thirdPartyFirewallStatus;

  DisassociateThirdPartyFirewallResponse({
    this.thirdPartyFirewallStatus,
  });

  factory DisassociateThirdPartyFirewallResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateThirdPartyFirewallResponse(
      thirdPartyFirewallStatus: (json['ThirdPartyFirewallStatus'] as String?)
          ?.toThirdPartyFirewallAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final thirdPartyFirewallStatus = this.thirdPartyFirewallStatus;
    return {
      if (thirdPartyFirewallStatus != null)
        'ThirdPartyFirewallStatus': thirdPartyFirewallStatus.toValue(),
    };
  }
}

/// A resource in the organization that's available to be associated with a
/// Firewall Manager resource set.
class DiscoveredResource {
  /// The Amazon Web Services account ID associated with the discovered resource.
  final String? accountId;

  /// The name of the discovered resource.
  final String? name;

  /// The type of the discovered resource.
  final String? type;

  /// The universal resource identifier (URI) of the discovered resource.
  final String? uri;

  DiscoveredResource({
    this.accountId,
    this.name,
    this.type,
    this.uri,
  });

  factory DiscoveredResource.fromJson(Map<String, dynamic> json) {
    return DiscoveredResource(
      accountId: json['AccountId'] as String?,
      name: json['Name'] as String?,
      type: json['Type'] as String?,
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final name = this.name;
    final type = this.type;
    final uri = this.uri;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
      if (uri != null) 'URI': uri,
    };
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

/// Describes a single rule in a network ACL.
class EntryDescription {
  /// Describes a rule in a network ACL.
  ///
  /// Each network ACL has a set of numbered ingress rules and a separate set of
  /// numbered egress rules. When determining whether a packet should be allowed
  /// in or out of a subnet associated with the network ACL, Amazon Web Services
  /// processes the entries in the network ACL according to the rule numbers, in
  /// ascending order.
  ///
  /// When you manage an individual network ACL, you explicitly specify the rule
  /// numbers. When you specify the network ACL rules in a Firewall Manager
  /// policy, you provide the rules to run first, in the order that you want them
  /// to run, and the rules to run last, in the order that you want them to run.
  /// Firewall Manager assigns the rule numbers for you when you save the network
  /// ACL policy specification.
  final NetworkAclEntry? entryDetail;

  /// The rule number for the entry. ACL entries are processed in ascending order
  /// by rule number. In a Firewall Manager network ACL policy, Firewall Manager
  /// assigns rule numbers.
  final int? entryRuleNumber;

  /// Specifies whether the entry is managed by Firewall Manager or by a user,
  /// and, for Firewall Manager-managed entries, specifies whether the entry is
  /// among those that run first in the network ACL or those that run last.
  final EntryType? entryType;

  EntryDescription({
    this.entryDetail,
    this.entryRuleNumber,
    this.entryType,
  });

  factory EntryDescription.fromJson(Map<String, dynamic> json) {
    return EntryDescription(
      entryDetail: json['EntryDetail'] != null
          ? NetworkAclEntry.fromJson(
              json['EntryDetail'] as Map<String, dynamic>)
          : null,
      entryRuleNumber: json['EntryRuleNumber'] as int?,
      entryType: (json['EntryType'] as String?)?.toEntryType(),
    );
  }

  Map<String, dynamic> toJson() {
    final entryDetail = this.entryDetail;
    final entryRuleNumber = this.entryRuleNumber;
    final entryType = this.entryType;
    return {
      if (entryDetail != null) 'EntryDetail': entryDetail,
      if (entryRuleNumber != null) 'EntryRuleNumber': entryRuleNumber,
      if (entryType != null) 'EntryType': entryType.toValue(),
    };
  }
}

enum EntryType {
  fmsManagedFirstEntry,
  fmsManagedLastEntry,
  customEntry,
}

extension EntryTypeValueExtension on EntryType {
  String toValue() {
    switch (this) {
      case EntryType.fmsManagedFirstEntry:
        return 'FMS_MANAGED_FIRST_ENTRY';
      case EntryType.fmsManagedLastEntry:
        return 'FMS_MANAGED_LAST_ENTRY';
      case EntryType.customEntry:
        return 'CUSTOM_ENTRY';
    }
  }
}

extension EntryTypeFromString on String {
  EntryType toEntryType() {
    switch (this) {
      case 'FMS_MANAGED_FIRST_ENTRY':
        return EntryType.fmsManagedFirstEntry;
      case 'FMS_MANAGED_LAST_ENTRY':
        return EntryType.fmsManagedLastEntry;
      case 'CUSTOM_ENTRY':
        return EntryType.customEntry;
    }
    throw Exception('$this is not known in enum EntryType');
  }
}

/// Detailed information about an entry violation in a network ACL. The
/// violation is against the network ACL specification inside the Firewall
/// Manager network ACL policy. This data object is part of
/// <code>InvalidNetworkAclEntriesViolation</code>.
class EntryViolation {
  /// The evaluation location within the ordered list of entries where the
  /// <code>ExpectedEntry</code> is currently located.
  final String? actualEvaluationOrder;

  /// The list of entries that are in conflict with <code>ExpectedEntry</code>.
  final List<EntryDescription>? entriesWithConflicts;

  /// The entry that's currently in the <code>ExpectedEvaluationOrder</code>
  /// location, in place of the expected entry.
  final EntryDescription? entryAtExpectedEvaluationOrder;

  /// Descriptions of the violations that Firewall Manager found for these
  /// entries.
  final List<EntryViolationReason>? entryViolationReasons;

  /// The Firewall Manager-managed network ACL entry that is involved in the entry
  /// violation.
  final EntryDescription? expectedEntry;

  /// The evaluation location within the ordered list of entries where the
  /// <code>ExpectedEntry</code> should be, according to the network ACL policy
  /// specifications.
  final String? expectedEvaluationOrder;

  EntryViolation({
    this.actualEvaluationOrder,
    this.entriesWithConflicts,
    this.entryAtExpectedEvaluationOrder,
    this.entryViolationReasons,
    this.expectedEntry,
    this.expectedEvaluationOrder,
  });

  factory EntryViolation.fromJson(Map<String, dynamic> json) {
    return EntryViolation(
      actualEvaluationOrder: json['ActualEvaluationOrder'] as String?,
      entriesWithConflicts: (json['EntriesWithConflicts'] as List?)
          ?.whereNotNull()
          .map((e) => EntryDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryAtExpectedEvaluationOrder: json['EntryAtExpectedEvaluationOrder'] !=
              null
          ? EntryDescription.fromJson(
              json['EntryAtExpectedEvaluationOrder'] as Map<String, dynamic>)
          : null,
      entryViolationReasons: (json['EntryViolationReasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEntryViolationReason())
          .toList(),
      expectedEntry: json['ExpectedEntry'] != null
          ? EntryDescription.fromJson(
              json['ExpectedEntry'] as Map<String, dynamic>)
          : null,
      expectedEvaluationOrder: json['ExpectedEvaluationOrder'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actualEvaluationOrder = this.actualEvaluationOrder;
    final entriesWithConflicts = this.entriesWithConflicts;
    final entryAtExpectedEvaluationOrder = this.entryAtExpectedEvaluationOrder;
    final entryViolationReasons = this.entryViolationReasons;
    final expectedEntry = this.expectedEntry;
    final expectedEvaluationOrder = this.expectedEvaluationOrder;
    return {
      if (actualEvaluationOrder != null)
        'ActualEvaluationOrder': actualEvaluationOrder,
      if (entriesWithConflicts != null)
        'EntriesWithConflicts': entriesWithConflicts,
      if (entryAtExpectedEvaluationOrder != null)
        'EntryAtExpectedEvaluationOrder': entryAtExpectedEvaluationOrder,
      if (entryViolationReasons != null)
        'EntryViolationReasons':
            entryViolationReasons.map((e) => e.toValue()).toList(),
      if (expectedEntry != null) 'ExpectedEntry': expectedEntry,
      if (expectedEvaluationOrder != null)
        'ExpectedEvaluationOrder': expectedEvaluationOrder,
    };
  }
}

enum EntryViolationReason {
  missingExpectedEntry,
  incorrectEntryOrder,
  entryConflict,
}

extension EntryViolationReasonValueExtension on EntryViolationReason {
  String toValue() {
    switch (this) {
      case EntryViolationReason.missingExpectedEntry:
        return 'MISSING_EXPECTED_ENTRY';
      case EntryViolationReason.incorrectEntryOrder:
        return 'INCORRECT_ENTRY_ORDER';
      case EntryViolationReason.entryConflict:
        return 'ENTRY_CONFLICT';
    }
  }
}

extension EntryViolationReasonFromString on String {
  EntryViolationReason toEntryViolationReason() {
    switch (this) {
      case 'MISSING_EXPECTED_ENTRY':
        return EntryViolationReason.missingExpectedEntry;
      case 'INCORRECT_ENTRY_ORDER':
        return EntryViolationReason.incorrectEntryOrder;
      case 'ENTRY_CONFLICT':
        return EntryViolationReason.entryConflict;
    }
    throw Exception('$this is not known in enum EntryViolationReason');
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

/// Contains information about the actions that you can take to remediate scope
/// violations caused by your policy's <code>FirewallCreationConfig</code>.
/// <code>FirewallCreationConfig</code> is an optional configuration that you
/// can use to choose which Availability Zones Firewall Manager creates Network
/// Firewall endpoints in.
class FMSPolicyUpdateFirewallCreationConfigAction {
  /// Describes the remedial action.
  final String? description;

  /// A <code>FirewallCreationConfig</code> that you can copy into your current
  /// policy's <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_SecurityServicePolicyData.html">SecurityServiceData</a>
  /// in order to remedy scope violations.
  final String? firewallCreationConfig;

  FMSPolicyUpdateFirewallCreationConfigAction({
    this.description,
    this.firewallCreationConfig,
  });

  factory FMSPolicyUpdateFirewallCreationConfigAction.fromJson(
      Map<String, dynamic> json) {
    return FMSPolicyUpdateFirewallCreationConfigAction(
      description: json['Description'] as String?,
      firewallCreationConfig: json['FirewallCreationConfig'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final firewallCreationConfig = this.firewallCreationConfig;
    return {
      if (description != null) 'Description': description,
      if (firewallCreationConfig != null)
        'FirewallCreationConfig': firewallCreationConfig,
    };
  }
}

/// Details of a resource that failed when trying to update it's association to
/// a resource set.
class FailedItem {
  /// The reason the resource's association could not be updated.
  final FailedItemReason? reason;

  /// The univeral resource indicator (URI) of the resource that failed.
  final String? uri;

  FailedItem({
    this.reason,
    this.uri,
  });

  factory FailedItem.fromJson(Map<String, dynamic> json) {
    return FailedItem(
      reason: (json['Reason'] as String?)?.toFailedItemReason(),
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final uri = this.uri;
    return {
      if (reason != null) 'Reason': reason.toValue(),
      if (uri != null) 'URI': uri,
    };
  }
}

enum FailedItemReason {
  notValidArn,
  notValidPartition,
  notValidRegion,
  notValidService,
  notValidResourceType,
  notValidAccountId,
}

extension FailedItemReasonValueExtension on FailedItemReason {
  String toValue() {
    switch (this) {
      case FailedItemReason.notValidArn:
        return 'NOT_VALID_ARN';
      case FailedItemReason.notValidPartition:
        return 'NOT_VALID_PARTITION';
      case FailedItemReason.notValidRegion:
        return 'NOT_VALID_REGION';
      case FailedItemReason.notValidService:
        return 'NOT_VALID_SERVICE';
      case FailedItemReason.notValidResourceType:
        return 'NOT_VALID_RESOURCE_TYPE';
      case FailedItemReason.notValidAccountId:
        return 'NOT_VALID_ACCOUNT_ID';
    }
  }
}

extension FailedItemReasonFromString on String {
  FailedItemReason toFailedItemReason() {
    switch (this) {
      case 'NOT_VALID_ARN':
        return FailedItemReason.notValidArn;
      case 'NOT_VALID_PARTITION':
        return FailedItemReason.notValidPartition;
      case 'NOT_VALID_REGION':
        return FailedItemReason.notValidRegion;
      case 'NOT_VALID_SERVICE':
        return FailedItemReason.notValidService;
      case 'NOT_VALID_RESOURCE_TYPE':
        return FailedItemReason.notValidResourceType;
      case 'NOT_VALID_ACCOUNT_ID':
        return FailedItemReason.notValidAccountId;
    }
    throw Exception('$this is not known in enum FailedItemReason');
  }
}

enum FirewallDeploymentModel {
  centralized,
  distributed,
}

extension FirewallDeploymentModelValueExtension on FirewallDeploymentModel {
  String toValue() {
    switch (this) {
      case FirewallDeploymentModel.centralized:
        return 'CENTRALIZED';
      case FirewallDeploymentModel.distributed:
        return 'DISTRIBUTED';
    }
  }
}

extension FirewallDeploymentModelFromString on String {
  FirewallDeploymentModel toFirewallDeploymentModel() {
    switch (this) {
      case 'CENTRALIZED':
        return FirewallDeploymentModel.centralized;
      case 'DISTRIBUTED':
        return FirewallDeploymentModel.distributed;
    }
    throw Exception('$this is not known in enum FirewallDeploymentModel');
  }
}

/// Contains details about the firewall subnet that violates the policy scope.
class FirewallSubnetIsOutOfScopeViolation {
  /// The ID of the firewall subnet that violates the policy scope.
  final String? firewallSubnetId;

  /// The Availability Zone of the firewall subnet that violates the policy scope.
  final String? subnetAvailabilityZone;

  /// The Availability Zone ID of the firewall subnet that violates the policy
  /// scope.
  final String? subnetAvailabilityZoneId;

  /// The VPC endpoint ID of the firewall subnet that violates the policy scope.
  final String? vpcEndpointId;

  /// The VPC ID of the firewall subnet that violates the policy scope.
  final String? vpcId;

  FirewallSubnetIsOutOfScopeViolation({
    this.firewallSubnetId,
    this.subnetAvailabilityZone,
    this.subnetAvailabilityZoneId,
    this.vpcEndpointId,
    this.vpcId,
  });

  factory FirewallSubnetIsOutOfScopeViolation.fromJson(
      Map<String, dynamic> json) {
    return FirewallSubnetIsOutOfScopeViolation(
      firewallSubnetId: json['FirewallSubnetId'] as String?,
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      subnetAvailabilityZoneId: json['SubnetAvailabilityZoneId'] as String?,
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallSubnetId = this.firewallSubnetId;
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetAvailabilityZoneId = this.subnetAvailabilityZoneId;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (firewallSubnetId != null) 'FirewallSubnetId': firewallSubnetId,
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetAvailabilityZoneId != null)
        'SubnetAvailabilityZoneId': subnetAvailabilityZoneId,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The violation details for a firewall subnet's VPC endpoint that's deleted or
/// missing.
class FirewallSubnetMissingVPCEndpointViolation {
  /// The ID of the firewall that this VPC endpoint is associated with.
  final String? firewallSubnetId;

  /// The name of the Availability Zone of the deleted VPC subnet.
  final String? subnetAvailabilityZone;

  /// The ID of the Availability Zone of the deleted VPC subnet.
  final String? subnetAvailabilityZoneId;

  /// The resource ID of the VPC associated with the deleted VPC subnet.
  final String? vpcId;

  FirewallSubnetMissingVPCEndpointViolation({
    this.firewallSubnetId,
    this.subnetAvailabilityZone,
    this.subnetAvailabilityZoneId,
    this.vpcId,
  });

  factory FirewallSubnetMissingVPCEndpointViolation.fromJson(
      Map<String, dynamic> json) {
    return FirewallSubnetMissingVPCEndpointViolation(
      firewallSubnetId: json['FirewallSubnetId'] as String?,
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      subnetAvailabilityZoneId: json['SubnetAvailabilityZoneId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallSubnetId = this.firewallSubnetId;
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetAvailabilityZoneId = this.subnetAvailabilityZoneId;
    final vpcId = this.vpcId;
    return {
      if (firewallSubnetId != null) 'FirewallSubnetId': firewallSubnetId,
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetAvailabilityZoneId != null)
        'SubnetAvailabilityZoneId': subnetAvailabilityZoneId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class GetAdminAccountResponse {
  /// The account that is set as the Firewall Manager default administrator.
  final String? adminAccount;

  /// The status of the account that you set as the Firewall Manager default
  /// administrator.
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

class GetAdminScopeResponse {
  /// Contains details about the administrative scope of the requested account.
  final AdminScope? adminScope;

  /// The current status of the request to onboard a member account as an Firewall
  /// Manager administrator.
  ///
  /// <ul>
  /// <li>
  /// <code>ONBOARDING</code> - The account is onboarding to Firewall Manager as
  /// an administrator.
  /// </li>
  /// <li>
  /// <code>ONBOARDING_COMPLETE</code> - Firewall Manager The account is onboarded
  /// to Firewall Manager as an administrator, and can perform actions on the
  /// resources defined in their <a>AdminScope</a>.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING</code> - The account is being removed as an Firewall
  /// Manager administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING_COMPLETE</code> - The account has been removed as an
  /// Firewall Manager administrator.
  /// </li>
  /// </ul>
  final OrganizationStatus? status;

  GetAdminScopeResponse({
    this.adminScope,
    this.status,
  });

  factory GetAdminScopeResponse.fromJson(Map<String, dynamic> json) {
    return GetAdminScopeResponse(
      adminScope: json['AdminScope'] != null
          ? AdminScope.fromJson(json['AdminScope'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toOrganizationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminScope = this.adminScope;
    final status = this.status;
    return {
      if (adminScope != null) 'AdminScope': adminScope,
      if (status != null) 'Status': status.toValue(),
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

class GetResourceSetResponse {
  /// Information about the specified resource set.
  final ResourceSet resourceSet;

  /// The Amazon Resource Name (ARN) of the resource set.
  final String resourceSetArn;

  GetResourceSetResponse({
    required this.resourceSet,
    required this.resourceSetArn,
  });

  factory GetResourceSetResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSetResponse(
      resourceSet:
          ResourceSet.fromJson(json['ResourceSet'] as Map<String, dynamic>),
      resourceSetArn: json['ResourceSetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSet = this.resourceSet;
    final resourceSetArn = this.resourceSetArn;
    return {
      'ResourceSet': resourceSet,
      'ResourceSetArn': resourceSetArn,
    };
  }
}

class GetThirdPartyFirewallAssociationStatusResponse {
  /// The status for subscribing to the third-party firewall vendor in the Amazon
  /// Web Services Marketplace.
  ///
  /// <ul>
  /// <li>
  /// <code>NO_SUBSCRIPTION</code> - The Firewall Manager policy administrator
  /// isn't subscribed to the third-party firewall service in the Amazon Web
  /// Services Marketplace.
  /// </li>
  /// <li>
  /// <code>NOT_COMPLETE</code> - The Firewall Manager policy administrator is in
  /// the process of subscribing to the third-party firewall service in the Amazon
  /// Web Services Marketplace, but doesn't yet have an active subscription.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code> - The Firewall Manager policy administrator has an
  /// active subscription to the third-party firewall service in the Amazon Web
  /// Services Marketplace.
  /// </li>
  /// </ul>
  final MarketplaceSubscriptionOnboardingStatus? marketplaceOnboardingStatus;

  /// The current status for setting a Firewall Manager policy administrators
  /// account as an administrator of the third-party firewall tenant.
  ///
  /// <ul>
  /// <li>
  /// <code>ONBOARDING</code> - The Firewall Manager policy administrator is being
  /// designated as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>ONBOARD_COMPLETE</code> - The Firewall Manager policy administrator is
  /// designated as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARDING</code> - The Firewall Manager policy administrator is
  /// being removed as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>OFFBOARD_COMPLETE</code> - The Firewall Manager policy administrator
  /// has been removed as a tenant administrator.
  /// </li>
  /// <li>
  /// <code>NOT_EXIST</code> - The Firewall Manager policy administrator doesn't
  /// exist as a tenant administrator.
  /// </li>
  /// </ul>
  final ThirdPartyFirewallAssociationStatus? thirdPartyFirewallStatus;

  GetThirdPartyFirewallAssociationStatusResponse({
    this.marketplaceOnboardingStatus,
    this.thirdPartyFirewallStatus,
  });

  factory GetThirdPartyFirewallAssociationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetThirdPartyFirewallAssociationStatusResponse(
      marketplaceOnboardingStatus:
          (json['MarketplaceOnboardingStatus'] as String?)
              ?.toMarketplaceSubscriptionOnboardingStatus(),
      thirdPartyFirewallStatus: (json['ThirdPartyFirewallStatus'] as String?)
          ?.toThirdPartyFirewallAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceOnboardingStatus = this.marketplaceOnboardingStatus;
    final thirdPartyFirewallStatus = this.thirdPartyFirewallStatus;
    return {
      if (marketplaceOnboardingStatus != null)
        'MarketplaceOnboardingStatus': marketplaceOnboardingStatus.toValue(),
      if (thirdPartyFirewallStatus != null)
        'ThirdPartyFirewallStatus': thirdPartyFirewallStatus.toValue(),
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

/// Violation detail for the entries in a network ACL resource.
class InvalidNetworkAclEntriesViolation {
  /// The network ACL containing the entry violations.
  final String? currentAssociatedNetworkAcl;

  /// Detailed information about the entry violations in the network ACL.
  final List<EntryViolation>? entryViolations;

  /// The subnet that's associated with the network ACL.
  final String? subnet;

  /// The Availability Zone where the network ACL is in use.
  final String? subnetAvailabilityZone;

  /// The VPC where the violation was found.
  final String? vpc;

  InvalidNetworkAclEntriesViolation({
    this.currentAssociatedNetworkAcl,
    this.entryViolations,
    this.subnet,
    this.subnetAvailabilityZone,
    this.vpc,
  });

  factory InvalidNetworkAclEntriesViolation.fromJson(
      Map<String, dynamic> json) {
    return InvalidNetworkAclEntriesViolation(
      currentAssociatedNetworkAcl:
          json['CurrentAssociatedNetworkAcl'] as String?,
      entryViolations: (json['EntryViolations'] as List?)
          ?.whereNotNull()
          .map((e) => EntryViolation.fromJson(e as Map<String, dynamic>))
          .toList(),
      subnet: json['Subnet'] as String?,
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      vpc: json['Vpc'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentAssociatedNetworkAcl = this.currentAssociatedNetworkAcl;
    final entryViolations = this.entryViolations;
    final subnet = this.subnet;
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final vpc = this.vpc;
    return {
      if (currentAssociatedNetworkAcl != null)
        'CurrentAssociatedNetworkAcl': currentAssociatedNetworkAcl,
      if (entryViolations != null) 'EntryViolations': entryViolations,
      if (subnet != null) 'Subnet': subnet,
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

class ListAdminAccountsForOrganizationResponse {
  /// A list of Firewall Manager administrator accounts within the organization
  /// that were onboarded as administrators by <a>AssociateAdminAccount</a> or
  /// <a>PutAdminAccount</a>.
  final List<AdminAccountSummary>? adminAccounts;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Firewall Manager returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListAdminAccountsForOrganizationResponse({
    this.adminAccounts,
    this.nextToken,
  });

  factory ListAdminAccountsForOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAdminAccountsForOrganizationResponse(
      adminAccounts: (json['AdminAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AdminAccountSummary.fromJson(e as Map<String, dynamic>))
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

class ListAdminsManagingAccountResponse {
  /// The list of accounts who manage member accounts within their
  /// <a>AdminScope</a>.
  final List<String>? adminAccounts;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Firewall Manager returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListAdminsManagingAccountResponse({
    this.adminAccounts,
    this.nextToken,
  });

  factory ListAdminsManagingAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAdminsManagingAccountResponse(
      adminAccounts: (json['AdminAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
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

class ListDiscoveredResourcesResponse {
  /// Details of the resources that were discovered.
  final List<DiscoveredResource>? items;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Firewall Manager returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListDiscoveredResourcesResponse({
    this.items,
    this.nextToken,
  });

  factory ListDiscoveredResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredResourcesResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => DiscoveredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
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

class ListResourceSetResourcesResponse {
  /// An array of the associated resources' uniform resource identifiers (URI).
  final List<Resource> items;

  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Firewall Manager returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  ListResourceSetResourcesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListResourceSetResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceSetResourcesResponse(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListResourceSetsResponse {
  /// When you request a list of objects with a <code>MaxResults</code> setting,
  /// if the number of objects that are still available for retrieval exceeds the
  /// maximum you requested, Firewall Manager returns a <code>NextToken</code>
  /// value in the response. To retrieve the next batch of objects, use the token
  /// returned from the prior request in your next request.
  final String? nextToken;

  /// An array of <code>ResourceSetSummary</code> objects.
  final List<ResourceSetSummary>? resourceSets;

  ListResourceSetsResponse({
    this.nextToken,
    this.resourceSets,
  });

  factory ListResourceSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceSetsResponse(
      nextToken: json['NextToken'] as String?,
      resourceSets: (json['ResourceSets'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceSets = this.resourceSets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceSets != null) 'ResourceSets': resourceSets,
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

class ListThirdPartyFirewallFirewallPoliciesResponse {
  /// The value that you will use for <code>NextToken</code> in the next
  /// <code>ListThirdPartyFirewallFirewallPolicies</code> request.
  final String? nextToken;

  /// A list that contains one <code>ThirdPartyFirewallFirewallPolicies</code>
  /// element for each third-party firewall policies that the specified
  /// third-party firewall vendor is associated with. Each
  /// <code>ThirdPartyFirewallFirewallPolicies</code> element contains the
  /// firewall policy name and ID.
  final List<ThirdPartyFirewallFirewallPolicy>?
      thirdPartyFirewallFirewallPolicies;

  ListThirdPartyFirewallFirewallPoliciesResponse({
    this.nextToken,
    this.thirdPartyFirewallFirewallPolicies,
  });

  factory ListThirdPartyFirewallFirewallPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListThirdPartyFirewallFirewallPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      thirdPartyFirewallFirewallPolicies:
          (json['ThirdPartyFirewallFirewallPolicies'] as List?)
              ?.whereNotNull()
              .map((e) => ThirdPartyFirewallFirewallPolicy.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final thirdPartyFirewallFirewallPolicies =
        this.thirdPartyFirewallFirewallPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (thirdPartyFirewallFirewallPolicies != null)
        'ThirdPartyFirewallFirewallPolicies':
            thirdPartyFirewallFirewallPolicies,
    };
  }
}

enum MarketplaceSubscriptionOnboardingStatus {
  noSubscription,
  notComplete,
  complete,
}

extension MarketplaceSubscriptionOnboardingStatusValueExtension
    on MarketplaceSubscriptionOnboardingStatus {
  String toValue() {
    switch (this) {
      case MarketplaceSubscriptionOnboardingStatus.noSubscription:
        return 'NO_SUBSCRIPTION';
      case MarketplaceSubscriptionOnboardingStatus.notComplete:
        return 'NOT_COMPLETE';
      case MarketplaceSubscriptionOnboardingStatus.complete:
        return 'COMPLETE';
    }
  }
}

extension MarketplaceSubscriptionOnboardingStatusFromString on String {
  MarketplaceSubscriptionOnboardingStatus
      toMarketplaceSubscriptionOnboardingStatus() {
    switch (this) {
      case 'NO_SUBSCRIPTION':
        return MarketplaceSubscriptionOnboardingStatus.noSubscription;
      case 'NOT_COMPLETE':
        return MarketplaceSubscriptionOnboardingStatus.notComplete;
      case 'COMPLETE':
        return MarketplaceSubscriptionOnboardingStatus.complete;
    }
    throw Exception(
        '$this is not known in enum MarketplaceSubscriptionOnboardingStatus');
  }
}

/// Defines a Firewall Manager network ACL policy. This is used in the
/// <code>PolicyOption</code> of a <code>SecurityServicePolicyData</code> for a
/// <code>Policy</code>, when the <code>SecurityServicePolicyData</code> type is
/// set to <code>NETWORK_ACL_COMMON</code>.
///
/// For information about network ACLs, see <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html">Control
/// traffic to subnets using network ACLs</a> in the <i>Amazon Virtual Private
/// Cloud User Guide</i>.
class NetworkAclCommonPolicy {
  /// The definition of the first and last rules for the network ACL policy.
  final NetworkAclEntrySet networkAclEntrySet;

  NetworkAclCommonPolicy({
    required this.networkAclEntrySet,
  });

  factory NetworkAclCommonPolicy.fromJson(Map<String, dynamic> json) {
    return NetworkAclCommonPolicy(
      networkAclEntrySet: NetworkAclEntrySet.fromJson(
          json['NetworkAclEntrySet'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final networkAclEntrySet = this.networkAclEntrySet;
    return {
      'NetworkAclEntrySet': networkAclEntrySet,
    };
  }
}

/// Describes a rule in a network ACL.
///
/// Each network ACL has a set of numbered ingress rules and a separate set of
/// numbered egress rules. When determining whether a packet should be allowed
/// in or out of a subnet associated with the network ACL, Amazon Web Services
/// processes the entries in the network ACL according to the rule numbers, in
/// ascending order.
///
/// When you manage an individual network ACL, you explicitly specify the rule
/// numbers. When you specify the network ACL rules in a Firewall Manager
/// policy, you provide the rules to run first, in the order that you want them
/// to run, and the rules to run last, in the order that you want them to run.
/// Firewall Manager assigns the rule numbers for you when you save the network
/// ACL policy specification.
class NetworkAclEntry {
  /// Indicates whether the rule is an egress, or outbound, rule (applied to
  /// traffic leaving the subnet). If it's not an egress rule, then it's an
  /// ingress, or inbound, rule.
  final bool egress;

  /// The protocol number. A value of "-1" means all protocols.
  final String protocol;

  /// Indicates whether to allow or deny the traffic that matches the rule.
  final NetworkAclRuleAction ruleAction;

  /// The IPv4 network range to allow or deny, in CIDR notation.
  final String? cidrBlock;

  /// ICMP protocol: The ICMP type and code.
  final NetworkAclIcmpTypeCode? icmpTypeCode;

  /// The IPv6 network range to allow or deny, in CIDR notation.
  final String? ipv6CidrBlock;

  /// TCP or UDP protocols: The range of ports the rule applies to.
  final NetworkAclPortRange? portRange;

  NetworkAclEntry({
    required this.egress,
    required this.protocol,
    required this.ruleAction,
    this.cidrBlock,
    this.icmpTypeCode,
    this.ipv6CidrBlock,
    this.portRange,
  });

  factory NetworkAclEntry.fromJson(Map<String, dynamic> json) {
    return NetworkAclEntry(
      egress: json['Egress'] as bool,
      protocol: json['Protocol'] as String,
      ruleAction: (json['RuleAction'] as String).toNetworkAclRuleAction(),
      cidrBlock: json['CidrBlock'] as String?,
      icmpTypeCode: json['IcmpTypeCode'] != null
          ? NetworkAclIcmpTypeCode.fromJson(
              json['IcmpTypeCode'] as Map<String, dynamic>)
          : null,
      ipv6CidrBlock: json['Ipv6CidrBlock'] as String?,
      portRange: json['PortRange'] != null
          ? NetworkAclPortRange.fromJson(
              json['PortRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final egress = this.egress;
    final protocol = this.protocol;
    final ruleAction = this.ruleAction;
    final cidrBlock = this.cidrBlock;
    final icmpTypeCode = this.icmpTypeCode;
    final ipv6CidrBlock = this.ipv6CidrBlock;
    final portRange = this.portRange;
    return {
      'Egress': egress,
      'Protocol': protocol,
      'RuleAction': ruleAction.toValue(),
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
      if (icmpTypeCode != null) 'IcmpTypeCode': icmpTypeCode,
      if (ipv6CidrBlock != null) 'Ipv6CidrBlock': ipv6CidrBlock,
      if (portRange != null) 'PortRange': portRange,
    };
  }
}

/// The configuration of the first and last rules for the network ACL policy,
/// and the remediation settings for each.
class NetworkAclEntrySet {
  /// Applies only when remediation is enabled for the policy as a whole. Firewall
  /// Manager uses this setting when it finds policy violations that involve
  /// conflicts between the custom entries and the policy entries.
  ///
  /// If forced remediation is disabled, Firewall Manager marks the network ACL as
  /// noncompliant and does not try to remediate. For more information about the
  /// remediation behavior, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation">Remediation
  /// for managed network ACLs</a> in the <i>Firewall Manager Developer Guide</i>.
  final bool forceRemediateForFirstEntries;

  /// Applies only when remediation is enabled for the policy as a whole. Firewall
  /// Manager uses this setting when it finds policy violations that involve
  /// conflicts between the custom entries and the policy entries.
  ///
  /// If forced remediation is disabled, Firewall Manager marks the network ACL as
  /// noncompliant and does not try to remediate. For more information about the
  /// remediation behavior, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/network-acl-policies.html#network-acls-remediation">Remediation
  /// for managed network ACLs</a> in the <i>Firewall Manager Developer Guide</i>.
  final bool forceRemediateForLastEntries;

  /// The rules that you want to run first in the Firewall Manager managed network
  /// ACLs.
  /// <note>
  /// Provide these in the order in which you want them to run. Firewall Manager
  /// will assign the specific rule numbers for you, in the network ACLs that it
  /// creates.
  /// </note>
  /// You must specify at least one first entry or one last entry in any network
  /// ACL policy.
  final List<NetworkAclEntry>? firstEntries;

  /// The rules that you want to run last in the Firewall Manager managed network
  /// ACLs.
  /// <note>
  /// Provide these in the order in which you want them to run. Firewall Manager
  /// will assign the specific rule numbers for you, in the network ACLs that it
  /// creates.
  /// </note>
  /// You must specify at least one first entry or one last entry in any network
  /// ACL policy.
  final List<NetworkAclEntry>? lastEntries;

  NetworkAclEntrySet({
    required this.forceRemediateForFirstEntries,
    required this.forceRemediateForLastEntries,
    this.firstEntries,
    this.lastEntries,
  });

  factory NetworkAclEntrySet.fromJson(Map<String, dynamic> json) {
    return NetworkAclEntrySet(
      forceRemediateForFirstEntries:
          json['ForceRemediateForFirstEntries'] as bool,
      forceRemediateForLastEntries:
          json['ForceRemediateForLastEntries'] as bool,
      firstEntries: (json['FirstEntries'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkAclEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEntries: (json['LastEntries'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkAclEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final forceRemediateForFirstEntries = this.forceRemediateForFirstEntries;
    final forceRemediateForLastEntries = this.forceRemediateForLastEntries;
    final firstEntries = this.firstEntries;
    final lastEntries = this.lastEntries;
    return {
      'ForceRemediateForFirstEntries': forceRemediateForFirstEntries,
      'ForceRemediateForLastEntries': forceRemediateForLastEntries,
      if (firstEntries != null) 'FirstEntries': firstEntries,
      if (lastEntries != null) 'LastEntries': lastEntries,
    };
  }
}

/// ICMP protocol: The ICMP type and code.
class NetworkAclIcmpTypeCode {
  /// ICMP code.
  final int? code;

  /// ICMP type.
  final int? type;

  NetworkAclIcmpTypeCode({
    this.code,
    this.type,
  });

  factory NetworkAclIcmpTypeCode.fromJson(Map<String, dynamic> json) {
    return NetworkAclIcmpTypeCode(
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

/// TCP or UDP protocols: The range of ports the rule applies to.
class NetworkAclPortRange {
  /// The beginning port number of the range.
  final int? from;

  /// The ending port number of the range.
  final int? to;

  NetworkAclPortRange({
    this.from,
    this.to,
  });

  factory NetworkAclPortRange.fromJson(Map<String, dynamic> json) {
    return NetworkAclPortRange(
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

enum NetworkAclRuleAction {
  allow,
  deny,
}

extension NetworkAclRuleActionValueExtension on NetworkAclRuleAction {
  String toValue() {
    switch (this) {
      case NetworkAclRuleAction.allow:
        return 'allow';
      case NetworkAclRuleAction.deny:
        return 'deny';
    }
  }
}

extension NetworkAclRuleActionFromString on String {
  NetworkAclRuleAction toNetworkAclRuleAction() {
    switch (this) {
      case 'allow':
        return NetworkAclRuleAction.allow;
      case 'deny':
        return NetworkAclRuleAction.deny;
    }
    throw Exception('$this is not known in enum NetworkAclRuleAction');
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

enum NetworkFirewallOverrideAction {
  dropToAlert,
}

extension NetworkFirewallOverrideActionValueExtension
    on NetworkFirewallOverrideAction {
  String toValue() {
    switch (this) {
      case NetworkFirewallOverrideAction.dropToAlert:
        return 'DROP_TO_ALERT';
    }
  }
}

extension NetworkFirewallOverrideActionFromString on String {
  NetworkFirewallOverrideAction toNetworkFirewallOverrideAction() {
    switch (this) {
      case 'DROP_TO_ALERT':
        return NetworkFirewallOverrideAction.dropToAlert;
    }
    throw Exception('$this is not known in enum NetworkFirewallOverrideAction');
  }
}

/// Configures the firewall policy deployment model of Network Firewall. For
/// information about Network Firewall deployment models, see <a
/// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/architectures.html">Network
/// Firewall example architectures with routing</a> in the <i>Network Firewall
/// Developer Guide</i>.
class NetworkFirewallPolicy {
  /// Defines the deployment model to use for the firewall policy. To use a
  /// distributed model, set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>NULL</code>.
  final FirewallDeploymentModel? firewallDeploymentModel;

  NetworkFirewallPolicy({
    this.firewallDeploymentModel,
  });

  factory NetworkFirewallPolicy.fromJson(Map<String, dynamic> json) {
    return NetworkFirewallPolicy(
      firewallDeploymentModel: (json['FirewallDeploymentModel'] as String?)
          ?.toFirewallDeploymentModel(),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDeploymentModel = this.firewallDeploymentModel;
    return {
      if (firewallDeploymentModel != null)
        'FirewallDeploymentModel': firewallDeploymentModel.toValue(),
    };
  }
}

/// The definition of the Network Firewall firewall policy.
class NetworkFirewallPolicyDescription {
  /// The default actions to take on a packet that doesn't match any stateful
  /// rules. The stateful default action is optional, and is only valid when using
  /// the strict rule order.
  ///
  /// Valid values of the stateful default action:
  ///
  /// <ul>
  /// <li>
  /// aws:drop_strict
  /// </li>
  /// <li>
  /// aws:drop_established
  /// </li>
  /// <li>
  /// aws:alert_strict
  /// </li>
  /// <li>
  /// aws:alert_established
  /// </li>
  /// </ul>
  final List<String>? statefulDefaultActions;

  /// Additional options governing how Network Firewall handles stateful rules.
  /// The stateful rule groups that you use in your policy must have stateful rule
  /// options settings that are compatible with these settings.
  final StatefulEngineOptions? statefulEngineOptions;

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
    this.statefulDefaultActions,
    this.statefulEngineOptions,
    this.statefulRuleGroups,
    this.statelessCustomActions,
    this.statelessDefaultActions,
    this.statelessFragmentDefaultActions,
    this.statelessRuleGroups,
  });

  factory NetworkFirewallPolicyDescription.fromJson(Map<String, dynamic> json) {
    return NetworkFirewallPolicyDescription(
      statefulDefaultActions: (json['StatefulDefaultActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statefulEngineOptions: json['StatefulEngineOptions'] != null
          ? StatefulEngineOptions.fromJson(
              json['StatefulEngineOptions'] as Map<String, dynamic>)
          : null,
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
    final statefulDefaultActions = this.statefulDefaultActions;
    final statefulEngineOptions = this.statefulEngineOptions;
    final statefulRuleGroups = this.statefulRuleGroups;
    final statelessCustomActions = this.statelessCustomActions;
    final statelessDefaultActions = this.statelessDefaultActions;
    final statelessFragmentDefaultActions =
        this.statelessFragmentDefaultActions;
    final statelessRuleGroups = this.statelessRuleGroups;
    return {
      if (statefulDefaultActions != null)
        'StatefulDefaultActions': statefulDefaultActions,
      if (statefulEngineOptions != null)
        'StatefulEngineOptions': statefulEngineOptions,
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

/// The setting that allows the policy owner to change the behavior of the rule
/// group within a policy.
class NetworkFirewallStatefulRuleGroupOverride {
  /// The action that changes the rule group from <code>DROP</code> to
  /// <code>ALERT</code>. This only applies to managed rule groups.
  final NetworkFirewallOverrideAction? action;

  NetworkFirewallStatefulRuleGroupOverride({
    this.action,
  });

  factory NetworkFirewallStatefulRuleGroupOverride.fromJson(
      Map<String, dynamic> json) {
    return NetworkFirewallStatefulRuleGroupOverride(
      action: (json['Action'] as String?)?.toNetworkFirewallOverrideAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'Action': action.toValue(),
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

enum OrganizationStatus {
  onboarding,
  onboardingComplete,
  offboarding,
  offboardingComplete,
}

extension OrganizationStatusValueExtension on OrganizationStatus {
  String toValue() {
    switch (this) {
      case OrganizationStatus.onboarding:
        return 'ONBOARDING';
      case OrganizationStatus.onboardingComplete:
        return 'ONBOARDING_COMPLETE';
      case OrganizationStatus.offboarding:
        return 'OFFBOARDING';
      case OrganizationStatus.offboardingComplete:
        return 'OFFBOARDING_COMPLETE';
    }
  }
}

extension OrganizationStatusFromString on String {
  OrganizationStatus toOrganizationStatus() {
    switch (this) {
      case 'ONBOARDING':
        return OrganizationStatus.onboarding;
      case 'ONBOARDING_COMPLETE':
        return OrganizationStatus.onboardingComplete;
      case 'OFFBOARDING':
        return OrganizationStatus.offboarding;
      case 'OFFBOARDING_COMPLETE':
        return OrganizationStatus.offboardingComplete;
    }
    throw Exception('$this is not known in enum OrganizationStatus');
  }
}

/// Defines the Organizations organizational units (OUs) that the specified
/// Firewall Manager administrator can apply policies to. For more information
/// about OUs in Organizations, see <a
/// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html">Managing
/// organizational units (OUs) </a> in the <i>Organizations User Guide</i>.
class OrganizationalUnitScope {
  /// A boolean value that indicates if the administrator can apply policies to
  /// all OUs within an organization. If true, the administrator can manage all
  /// OUs within the organization. You can either enable management of all OUs
  /// through this operation, or you can specify OUs to manage in
  /// <code>OrganizationalUnitScope$OrganizationalUnits</code>. You cannot specify
  /// both.
  final bool? allOrganizationalUnitsEnabled;

  /// A boolean value that excludes the OUs in
  /// <code>OrganizationalUnitScope$OrganizationalUnits</code> from the
  /// administrator's scope. If true, the Firewall Manager administrator can apply
  /// policies to all OUs in the organization except for the OUs listed in
  /// <code>OrganizationalUnitScope$OrganizationalUnits</code>. You can either
  /// specify a list of OUs to exclude by
  /// <code>OrganizationalUnitScope$OrganizationalUnits</code>, or you can enable
  /// management of all OUs by
  /// <code>OrganizationalUnitScope$AllOrganizationalUnitsEnabled</code>. You
  /// cannot specify both.
  final bool? excludeSpecifiedOrganizationalUnits;

  /// The list of OUs within the organization that the specified Firewall Manager
  /// administrator either can or cannot apply policies to, based on the value of
  /// <code>OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits</code>. If
  /// <code>OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits</code> is
  /// set to <code>true</code>, then the Firewall Manager administrator can apply
  /// policies to all OUs in the organization except for the OUs in this list. If
  /// <code>OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits</code> is
  /// set to <code>false</code>, then the Firewall Manager administrator can only
  /// apply policies to the OUs in this list.
  final List<String>? organizationalUnits;

  OrganizationalUnitScope({
    this.allOrganizationalUnitsEnabled,
    this.excludeSpecifiedOrganizationalUnits,
    this.organizationalUnits,
  });

  factory OrganizationalUnitScope.fromJson(Map<String, dynamic> json) {
    return OrganizationalUnitScope(
      allOrganizationalUnitsEnabled:
          json['AllOrganizationalUnitsEnabled'] as bool?,
      excludeSpecifiedOrganizationalUnits:
          json['ExcludeSpecifiedOrganizationalUnits'] as bool?,
      organizationalUnits: (json['OrganizationalUnits'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allOrganizationalUnitsEnabled = this.allOrganizationalUnitsEnabled;
    final excludeSpecifiedOrganizationalUnits =
        this.excludeSpecifiedOrganizationalUnits;
    final organizationalUnits = this.organizationalUnits;
    return {
      if (allOrganizationalUnitsEnabled != null)
        'AllOrganizationalUnitsEnabled': allOrganizationalUnitsEnabled,
      if (excludeSpecifiedOrganizationalUnits != null)
        'ExcludeSpecifiedOrganizationalUnits':
            excludeSpecifiedOrganizationalUnits,
      if (organizationalUnits != null)
        'OrganizationalUnits': organizationalUnits,
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
  /// The following are valid resource types for each Firewall Manager policy
  /// type:
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services WAF Classic - <code>AWS::ApiGateway::Stage</code>,
  /// <code>AWS::CloudFront::Distribution</code>, and
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>.
  /// </li>
  /// <li>
  /// WAF - <code>AWS::ApiGateway::Stage</code>,
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>, and
  /// <code>AWS::CloudFront::Distribution</code>.
  /// </li>
  /// <li>
  /// Shield Advanced - <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>,
  /// <code>AWS::ElasticLoadBalancing::LoadBalancer</code>,
  /// <code>AWS::EC2::EIP</code>, and <code>AWS::CloudFront::Distribution</code>.
  /// </li>
  /// <li>
  /// Network ACL - <code>AWS::EC2::Subnet</code>.
  /// </li>
  /// <li>
  /// Security group usage audit - <code>AWS::EC2::SecurityGroup</code>.
  /// </li>
  /// <li>
  /// Security group content audit - <code>AWS::EC2::SecurityGroup</code>,
  /// <code>AWS::EC2::NetworkInterface</code>, and
  /// <code>AWS::EC2::Instance</code>.
  /// </li>
  /// <li>
  /// DNS Firewall, Network Firewall, and third-party firewall -
  /// <code>AWS::EC2::VPC</code>.
  /// </li>
  /// </ul>
  final String resourceType;

  /// Details about the security service that is being used to protect the
  /// resources.
  final SecurityServicePolicyData securityServicePolicyData;

  /// Indicates whether Firewall Manager should automatically remove protections
  /// from resources that leave the policy scope and clean up resources that
  /// Firewall Manager is managing for accounts when those accounts leave policy
  /// scope. For example, Firewall Manager will disassociate a Firewall Manager
  /// managed web ACL from a protected customer resource when the customer
  /// resource leaves policy scope.
  ///
  /// By default, Firewall Manager doesn't remove protections or delete Firewall
  /// Manager managed resources.
  ///
  /// This option is not available for Shield Advanced or WAF Classic policies.
  final bool? deleteUnusedFMManagedResources;

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

  /// Your description of the Firewall Manager policy.
  final String? policyDescription;

  /// The ID of the Firewall Manager policy.
  final String? policyId;

  /// Indicates whether the policy is in or out of an admin's policy or Region
  /// scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The administrator can manage and delete the policy.
  /// </li>
  /// <li>
  /// <code>OUT_OF_ADMIN_SCOPE</code> - The administrator can view the policy, but
  /// they can't edit or delete the policy. Existing policy protections stay in
  /// place. Any new resources that come into scope of the policy won't be
  /// protected.
  /// </li>
  /// </ul>
  final CustomerPolicyStatus? policyStatus;

  /// A unique identifier for each update to the policy. When issuing a
  /// <code>PutPolicy</code> request, the <code>PolicyUpdateToken</code> in the
  /// request must match the <code>PolicyUpdateToken</code> of the current policy
  /// version. To get the <code>PolicyUpdateToken</code> of the current policy
  /// version, use a <code>GetPolicy</code> request.
  final String? policyUpdateToken;

  /// The unique identifiers of the resource sets used by the policy.
  final List<String>? resourceSetIds;

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
    this.deleteUnusedFMManagedResources,
    this.excludeMap,
    this.includeMap,
    this.policyDescription,
    this.policyId,
    this.policyStatus,
    this.policyUpdateToken,
    this.resourceSetIds,
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
      deleteUnusedFMManagedResources:
          json['DeleteUnusedFMManagedResources'] as bool?,
      excludeMap: (json['ExcludeMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toCustomerPolicyScopeIdType(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
      includeMap: (json['IncludeMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toCustomerPolicyScopeIdType(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
      policyDescription: json['PolicyDescription'] as String?,
      policyId: json['PolicyId'] as String?,
      policyStatus: (json['PolicyStatus'] as String?)?.toCustomerPolicyStatus(),
      policyUpdateToken: json['PolicyUpdateToken'] as String?,
      resourceSetIds: (json['ResourceSetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final deleteUnusedFMManagedResources = this.deleteUnusedFMManagedResources;
    final excludeMap = this.excludeMap;
    final includeMap = this.includeMap;
    final policyDescription = this.policyDescription;
    final policyId = this.policyId;
    final policyStatus = this.policyStatus;
    final policyUpdateToken = this.policyUpdateToken;
    final resourceSetIds = this.resourceSetIds;
    final resourceTags = this.resourceTags;
    final resourceTypeList = this.resourceTypeList;
    return {
      'ExcludeResourceTags': excludeResourceTags,
      'PolicyName': policyName,
      'RemediationEnabled': remediationEnabled,
      'ResourceType': resourceType,
      'SecurityServicePolicyData': securityServicePolicyData,
      if (deleteUnusedFMManagedResources != null)
        'DeleteUnusedFMManagedResources': deleteUnusedFMManagedResources,
      if (excludeMap != null)
        'ExcludeMap': excludeMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (includeMap != null)
        'IncludeMap': includeMap.map((k, e) => MapEntry(k.toValue(), e)),
      if (policyDescription != null) 'PolicyDescription': policyDescription,
      if (policyId != null) 'PolicyId': policyId,
      if (policyStatus != null) 'PolicyStatus': policyStatus.toValue(),
      if (policyUpdateToken != null) 'PolicyUpdateToken': policyUpdateToken,
      if (resourceSetIds != null) 'ResourceSetIds': resourceSetIds,
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

extension PolicyComplianceStatusTypeValueExtension
    on PolicyComplianceStatusType {
  String toValue() {
    switch (this) {
      case PolicyComplianceStatusType.compliant:
        return 'COMPLIANT';
      case PolicyComplianceStatusType.nonCompliant:
        return 'NON_COMPLIANT';
    }
  }
}

extension PolicyComplianceStatusTypeFromString on String {
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

/// Contains the settings to configure a network ACL policy, a Network Firewall
/// firewall policy deployment model, or a third-party firewall policy.
class PolicyOption {
  /// Defines a Firewall Manager network ACL policy.
  final NetworkAclCommonPolicy? networkAclCommonPolicy;

  /// Defines the deployment model to use for the firewall policy.
  final NetworkFirewallPolicy? networkFirewallPolicy;

  /// Defines the policy options for a third-party firewall policy.
  final ThirdPartyFirewallPolicy? thirdPartyFirewallPolicy;

  PolicyOption({
    this.networkAclCommonPolicy,
    this.networkFirewallPolicy,
    this.thirdPartyFirewallPolicy,
  });

  factory PolicyOption.fromJson(Map<String, dynamic> json) {
    return PolicyOption(
      networkAclCommonPolicy: json['NetworkAclCommonPolicy'] != null
          ? NetworkAclCommonPolicy.fromJson(
              json['NetworkAclCommonPolicy'] as Map<String, dynamic>)
          : null,
      networkFirewallPolicy: json['NetworkFirewallPolicy'] != null
          ? NetworkFirewallPolicy.fromJson(
              json['NetworkFirewallPolicy'] as Map<String, dynamic>)
          : null,
      thirdPartyFirewallPolicy: json['ThirdPartyFirewallPolicy'] != null
          ? ThirdPartyFirewallPolicy.fromJson(
              json['ThirdPartyFirewallPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkAclCommonPolicy = this.networkAclCommonPolicy;
    final networkFirewallPolicy = this.networkFirewallPolicy;
    final thirdPartyFirewallPolicy = this.thirdPartyFirewallPolicy;
    return {
      if (networkAclCommonPolicy != null)
        'NetworkAclCommonPolicy': networkAclCommonPolicy,
      if (networkFirewallPolicy != null)
        'NetworkFirewallPolicy': networkFirewallPolicy,
      if (thirdPartyFirewallPolicy != null)
        'ThirdPartyFirewallPolicy': thirdPartyFirewallPolicy,
    };
  }
}

/// Details of the Firewall Manager policy.
class PolicySummary {
  /// Indicates whether Firewall Manager should automatically remove protections
  /// from resources that leave the policy scope and clean up resources that
  /// Firewall Manager is managing for accounts when those accounts leave policy
  /// scope. For example, Firewall Manager will disassociate a Firewall Manager
  /// managed web ACL from a protected customer resource when the customer
  /// resource leaves policy scope.
  ///
  /// By default, Firewall Manager doesn't remove protections or delete Firewall
  /// Manager managed resources.
  ///
  /// This option is not available for Shield Advanced or WAF Classic policies.
  final bool? deleteUnusedFMManagedResources;

  /// The Amazon Resource Name (ARN) of the specified policy.
  final String? policyArn;

  /// The ID of the specified policy.
  final String? policyId;

  /// The name of the specified policy.
  final String? policyName;

  /// Indicates whether the policy is in or out of an admin's policy or Region
  /// scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The administrator can manage and delete the policy.
  /// </li>
  /// <li>
  /// <code>OUT_OF_ADMIN_SCOPE</code> - The administrator can view the policy, but
  /// they can't edit or delete the policy. Existing policy protections stay in
  /// place. Any new resources that come into scope of the policy won't be
  /// protected.
  /// </li>
  /// </ul>
  final CustomerPolicyStatus? policyStatus;

  /// Indicates if the policy should be automatically applied to new resources.
  final bool? remediationEnabled;

  /// The type of resource protected by or in scope of the policy. This is in the
  /// format shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Amazon
  /// Web Services Resource Types Reference</a>.
  final String? resourceType;

  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either an WAF policy, a Shield
  /// Advanced policy, or a security group policy.
  final SecurityServiceType? securityServiceType;

  PolicySummary({
    this.deleteUnusedFMManagedResources,
    this.policyArn,
    this.policyId,
    this.policyName,
    this.policyStatus,
    this.remediationEnabled,
    this.resourceType,
    this.securityServiceType,
  });

  factory PolicySummary.fromJson(Map<String, dynamic> json) {
    return PolicySummary(
      deleteUnusedFMManagedResources:
          json['DeleteUnusedFMManagedResources'] as bool?,
      policyArn: json['PolicyArn'] as String?,
      policyId: json['PolicyId'] as String?,
      policyName: json['PolicyName'] as String?,
      policyStatus: (json['PolicyStatus'] as String?)?.toCustomerPolicyStatus(),
      remediationEnabled: json['RemediationEnabled'] as bool?,
      resourceType: json['ResourceType'] as String?,
      securityServiceType:
          (json['SecurityServiceType'] as String?)?.toSecurityServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteUnusedFMManagedResources = this.deleteUnusedFMManagedResources;
    final policyArn = this.policyArn;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final policyStatus = this.policyStatus;
    final remediationEnabled = this.remediationEnabled;
    final resourceType = this.resourceType;
    final securityServiceType = this.securityServiceType;
    return {
      if (deleteUnusedFMManagedResources != null)
        'DeleteUnusedFMManagedResources': deleteUnusedFMManagedResources,
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (policyStatus != null) 'PolicyStatus': policyStatus.toValue(),
      if (remediationEnabled != null) 'RemediationEnabled': remediationEnabled,
      if (resourceType != null) 'ResourceType': resourceType,
      if (securityServiceType != null)
        'SecurityServiceType': securityServiceType.toValue(),
    };
  }
}

/// Defines the policy types that the specified Firewall Manager administrator
/// can manage.
class PolicyTypeScope {
  /// Allows the specified Firewall Manager administrator to manage all Firewall
  /// Manager policy types, except for third-party policy types. Third-party
  /// policy types can only be managed by the Firewall Manager default
  /// administrator.
  final bool? allPolicyTypesEnabled;

  /// The list of policy types that the specified Firewall Manager administrator
  /// can manage.
  final List<SecurityServiceType>? policyTypes;

  PolicyTypeScope({
    this.allPolicyTypesEnabled,
    this.policyTypes,
  });

  factory PolicyTypeScope.fromJson(Map<String, dynamic> json) {
    return PolicyTypeScope(
      allPolicyTypesEnabled: json['AllPolicyTypesEnabled'] as bool?,
      policyTypes: (json['PolicyTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSecurityServiceType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allPolicyTypesEnabled = this.allPolicyTypesEnabled;
    final policyTypes = this.policyTypes;
    return {
      if (allPolicyTypesEnabled != null)
        'AllPolicyTypesEnabled': allPolicyTypesEnabled,
      if (policyTypes != null)
        'PolicyTypes': policyTypes.map((e) => e.toValue()).toList(),
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

class PutResourceSetResponse {
  /// Details about the resource set.
  final ResourceSet resourceSet;

  /// The Amazon Resource Name (ARN) of the resource set.
  final String resourceSetArn;

  PutResourceSetResponse({
    required this.resourceSet,
    required this.resourceSetArn,
  });

  factory PutResourceSetResponse.fromJson(Map<String, dynamic> json) {
    return PutResourceSetResponse(
      resourceSet:
          ResourceSet.fromJson(json['ResourceSet'] as Map<String, dynamic>),
      resourceSetArn: json['ResourceSetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceSet = this.resourceSet;
    final resourceSetArn = this.resourceSetArn;
    return {
      'ResourceSet': resourceSet,
      'ResourceSetArn': resourceSetArn,
    };
  }
}

/// Defines the Amazon Web Services Regions that the specified Firewall Manager
/// administrator can manage.
class RegionScope {
  /// Allows the specified Firewall Manager administrator to manage all Amazon Web
  /// Services Regions.
  final bool? allRegionsEnabled;

  /// The Amazon Web Services Regions that the specified Firewall Manager
  /// administrator can perform actions in.
  final List<String>? regions;

  RegionScope({
    this.allRegionsEnabled,
    this.regions,
  });

  factory RegionScope.fromJson(Map<String, dynamic> json) {
    return RegionScope(
      allRegionsEnabled: json['AllRegionsEnabled'] as bool?,
      regions: (json['Regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allRegionsEnabled = this.allRegionsEnabled;
    final regions = this.regions;
    return {
      if (allRegionsEnabled != null) 'AllRegionsEnabled': allRegionsEnabled,
      if (regions != null) 'Regions': regions,
    };
  }
}

/// Information about an individual action you can take to remediate a
/// violation.
class RemediationAction {
  /// Information about the <code>CreateNetworkAcl</code> action in Amazon EC2.
  final CreateNetworkAclAction? createNetworkAclAction;

  /// Information about the <code>CreateNetworkAclEntries</code> action in Amazon
  /// EC2.
  final CreateNetworkAclEntriesAction? createNetworkAclEntriesAction;

  /// Information about the <code>DeleteNetworkAclEntries</code> action in Amazon
  /// EC2.
  final DeleteNetworkAclEntriesAction? deleteNetworkAclEntriesAction;

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

  /// The remedial action to take when updating a firewall configuration.
  final FMSPolicyUpdateFirewallCreationConfigAction?
      fMSPolicyUpdateFirewallCreationConfigAction;

  /// Information about the <code>ReplaceNetworkAclAssociation</code> action in
  /// Amazon EC2.
  final ReplaceNetworkAclAssociationAction? replaceNetworkAclAssociationAction;

  RemediationAction({
    this.createNetworkAclAction,
    this.createNetworkAclEntriesAction,
    this.deleteNetworkAclEntriesAction,
    this.description,
    this.eC2AssociateRouteTableAction,
    this.eC2CopyRouteTableAction,
    this.eC2CreateRouteAction,
    this.eC2CreateRouteTableAction,
    this.eC2DeleteRouteAction,
    this.eC2ReplaceRouteAction,
    this.eC2ReplaceRouteTableAssociationAction,
    this.fMSPolicyUpdateFirewallCreationConfigAction,
    this.replaceNetworkAclAssociationAction,
  });

  factory RemediationAction.fromJson(Map<String, dynamic> json) {
    return RemediationAction(
      createNetworkAclAction: json['CreateNetworkAclAction'] != null
          ? CreateNetworkAclAction.fromJson(
              json['CreateNetworkAclAction'] as Map<String, dynamic>)
          : null,
      createNetworkAclEntriesAction:
          json['CreateNetworkAclEntriesAction'] != null
              ? CreateNetworkAclEntriesAction.fromJson(
                  json['CreateNetworkAclEntriesAction'] as Map<String, dynamic>)
              : null,
      deleteNetworkAclEntriesAction:
          json['DeleteNetworkAclEntriesAction'] != null
              ? DeleteNetworkAclEntriesAction.fromJson(
                  json['DeleteNetworkAclEntriesAction'] as Map<String, dynamic>)
              : null,
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
      fMSPolicyUpdateFirewallCreationConfigAction:
          json['FMSPolicyUpdateFirewallCreationConfigAction'] != null
              ? FMSPolicyUpdateFirewallCreationConfigAction.fromJson(
                  json['FMSPolicyUpdateFirewallCreationConfigAction']
                      as Map<String, dynamic>)
              : null,
      replaceNetworkAclAssociationAction:
          json['ReplaceNetworkAclAssociationAction'] != null
              ? ReplaceNetworkAclAssociationAction.fromJson(
                  json['ReplaceNetworkAclAssociationAction']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createNetworkAclAction = this.createNetworkAclAction;
    final createNetworkAclEntriesAction = this.createNetworkAclEntriesAction;
    final deleteNetworkAclEntriesAction = this.deleteNetworkAclEntriesAction;
    final description = this.description;
    final eC2AssociateRouteTableAction = this.eC2AssociateRouteTableAction;
    final eC2CopyRouteTableAction = this.eC2CopyRouteTableAction;
    final eC2CreateRouteAction = this.eC2CreateRouteAction;
    final eC2CreateRouteTableAction = this.eC2CreateRouteTableAction;
    final eC2DeleteRouteAction = this.eC2DeleteRouteAction;
    final eC2ReplaceRouteAction = this.eC2ReplaceRouteAction;
    final eC2ReplaceRouteTableAssociationAction =
        this.eC2ReplaceRouteTableAssociationAction;
    final fMSPolicyUpdateFirewallCreationConfigAction =
        this.fMSPolicyUpdateFirewallCreationConfigAction;
    final replaceNetworkAclAssociationAction =
        this.replaceNetworkAclAssociationAction;
    return {
      if (createNetworkAclAction != null)
        'CreateNetworkAclAction': createNetworkAclAction,
      if (createNetworkAclEntriesAction != null)
        'CreateNetworkAclEntriesAction': createNetworkAclEntriesAction,
      if (deleteNetworkAclEntriesAction != null)
        'DeleteNetworkAclEntriesAction': deleteNetworkAclEntriesAction,
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
      if (fMSPolicyUpdateFirewallCreationConfigAction != null)
        'FMSPolicyUpdateFirewallCreationConfigAction':
            fMSPolicyUpdateFirewallCreationConfigAction,
      if (replaceNetworkAclAssociationAction != null)
        'ReplaceNetworkAclAssociationAction':
            replaceNetworkAclAssociationAction,
    };
  }
}

enum RemediationActionType {
  remove,
  modify,
}

extension RemediationActionTypeValueExtension on RemediationActionType {
  String toValue() {
    switch (this) {
      case RemediationActionType.remove:
        return 'REMOVE';
      case RemediationActionType.modify:
        return 'MODIFY';
    }
  }
}

extension RemediationActionTypeFromString on String {
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

/// Information about the <code>ReplaceNetworkAclAssociation</code> action in
/// Amazon EC2. This is a remediation option in <code>RemediationAction</code>.
class ReplaceNetworkAclAssociationAction {
  final ActionTarget? associationId;

  /// Brief description of this remediation action.
  final String? description;

  /// Indicates whether it is possible for Firewall Manager to perform this
  /// remediation action. A false value indicates that auto remediation is
  /// disabled or Firewall Manager is unable to perform the action due to a
  /// conflict of some kind.
  final bool? fMSCanRemediate;

  /// The network ACL that's associated with the remediation action.
  final ActionTarget? networkAclId;

  ReplaceNetworkAclAssociationAction({
    this.associationId,
    this.description,
    this.fMSCanRemediate,
    this.networkAclId,
  });

  factory ReplaceNetworkAclAssociationAction.fromJson(
      Map<String, dynamic> json) {
    return ReplaceNetworkAclAssociationAction(
      associationId: json['AssociationId'] != null
          ? ActionTarget.fromJson(json['AssociationId'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      fMSCanRemediate: json['FMSCanRemediate'] as bool?,
      networkAclId: json['NetworkAclId'] != null
          ? ActionTarget.fromJson(json['NetworkAclId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final description = this.description;
    final fMSCanRemediate = this.fMSCanRemediate;
    final networkAclId = this.networkAclId;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (description != null) 'Description': description,
      if (fMSCanRemediate != null) 'FMSCanRemediate': fMSCanRemediate,
      if (networkAclId != null) 'NetworkAclId': networkAclId,
    };
  }
}

/// Details of a resource that is associated to an Firewall Manager resource
/// set.
class Resource {
  /// The resource's universal resource indicator (URI).
  final String uri;

  /// The Amazon Web Services account ID that the associated resource belongs to.
  final String? accountId;

  Resource({
    required this.uri,
    this.accountId,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      uri: json['URI'] as String,
      accountId: json['AccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final accountId = this.accountId;
    return {
      'URI': uri,
      if (accountId != null) 'AccountId': accountId,
    };
  }
}

/// A set of resources to include in a policy.
class ResourceSet {
  /// The descriptive name of the resource set. You can't change the name of a
  /// resource set after you create it.
  final String name;

  /// Determines the resources that can be associated to the resource set.
  /// Depending on your setting for max results and the number of resource sets, a
  /// single call might not return the full list.
  final List<String> resourceTypeList;

  /// A description of the resource set.
  final String? description;

  /// A unique identifier for the resource set. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  final String? id;

  /// The last time that the resource set was changed.
  final DateTime? lastUpdateTime;

  /// Indicates whether the resource set is in or out of an admin's Region scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The administrator can manage and delete the resource
  /// set.
  /// </li>
  /// <li>
  /// <code>OUT_OF_ADMIN_SCOPE</code> - The administrator can view the resource
  /// set, but they can't edit or delete the resource set. Existing protections
  /// stay in place. Any new resource that come into scope of the resource set
  /// won't be protected.
  /// </li>
  /// </ul>
  final ResourceSetStatus? resourceSetStatus;

  /// An optional token that you can use for optimistic locking. Firewall Manager
  /// returns a token to your requests that access the resource set. The token
  /// marks the state of the resource set resource at the time of the request.
  /// Update tokens are not allowed when creating a resource set. After creation,
  /// each subsequent update call to the resource set requires the update token.
  ///
  /// To make an unconditional change to the resource set, omit the token in your
  /// update request. Without the token, Firewall Manager performs your updates
  /// regardless of whether the resource set has changed since you last retrieved
  /// it.
  ///
  /// To make a conditional change to the resource set, provide the token in your
  /// update request. Firewall Manager uses the token to ensure that the resource
  /// set hasn't changed since you last retrieved it. If it has changed, the
  /// operation fails with an <code>InvalidTokenException</code>. If this happens,
  /// retrieve the resource set again to get a current copy of it with a new
  /// token. Reapply your changes as needed, then try the operation again using
  /// the new token.
  final String? updateToken;

  ResourceSet({
    required this.name,
    required this.resourceTypeList,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.resourceSetStatus,
    this.updateToken,
  });

  factory ResourceSet.fromJson(Map<String, dynamic> json) {
    return ResourceSet(
      name: json['Name'] as String,
      resourceTypeList: (json['ResourceTypeList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      resourceSetStatus:
          (json['ResourceSetStatus'] as String?)?.toResourceSetStatus(),
      updateToken: json['UpdateToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final resourceTypeList = this.resourceTypeList;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final resourceSetStatus = this.resourceSetStatus;
    final updateToken = this.updateToken;
    return {
      'Name': name,
      'ResourceTypeList': resourceTypeList,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (resourceSetStatus != null)
        'ResourceSetStatus': resourceSetStatus.toValue(),
      if (updateToken != null) 'UpdateToken': updateToken,
    };
  }
}

enum ResourceSetStatus {
  active,
  outOfAdminScope,
}

extension ResourceSetStatusValueExtension on ResourceSetStatus {
  String toValue() {
    switch (this) {
      case ResourceSetStatus.active:
        return 'ACTIVE';
      case ResourceSetStatus.outOfAdminScope:
        return 'OUT_OF_ADMIN_SCOPE';
    }
  }
}

extension ResourceSetStatusFromString on String {
  ResourceSetStatus toResourceSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return ResourceSetStatus.active;
      case 'OUT_OF_ADMIN_SCOPE':
        return ResourceSetStatus.outOfAdminScope;
    }
    throw Exception('$this is not known in enum ResourceSetStatus');
  }
}

/// Summarizes the resource sets used in a policy.
class ResourceSetSummary {
  /// A description of the resource set.
  final String? description;

  /// A unique identifier for the resource set. This ID is returned in the
  /// responses to create and list commands. You provide it to operations like
  /// update and delete.
  final String? id;

  /// The last time that the resource set was changed.
  final DateTime? lastUpdateTime;

  /// The descriptive name of the resource set. You can't change the name of a
  /// resource set after you create it.
  final String? name;

  /// Indicates whether the resource set is in or out of an admin's Region scope.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The administrator can manage and delete the resource
  /// set.
  /// </li>
  /// <li>
  /// <code>OUT_OF_ADMIN_SCOPE</code> - The administrator can view the resource
  /// set, but they can't edit or delete the resource set. Existing protections
  /// stay in place. Any new resource that come into scope of the resource set
  /// won't be protected.
  /// </li>
  /// </ul>
  final ResourceSetStatus? resourceSetStatus;

  ResourceSetSummary({
    this.description,
    this.id,
    this.lastUpdateTime,
    this.name,
    this.resourceSetStatus,
  });

  factory ResourceSetSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSetSummary(
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      name: json['Name'] as String?,
      resourceSetStatus:
          (json['ResourceSetStatus'] as String?)?.toResourceSetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final name = this.name;
    final resourceSetStatus = this.resourceSetStatus;
    return {
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (name != null) 'Name': name,
      if (resourceSetStatus != null)
        'ResourceSetStatus': resourceSetStatus.toValue(),
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
///
/// Every resource tag must have a string value, either a non-empty string or an
/// empty string. If you don't provide a value for a resource tag, Firewall
/// Manager saves the value as an empty string: "". When Firewall Manager
/// compares tags, it only matches two tags if they have the same key and the
/// same value. A tag with an empty string value only matches with tags that
/// also have an empty string value.
class ResourceTag {
  /// The resource tag key.
  final String key;

  /// The resource tag value. To specify an empty string value, either don't
  /// provide this or specify it as "".
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

  /// Contains details about the firewall subnet that violates the policy scope.
  final FirewallSubnetIsOutOfScopeViolation?
      firewallSubnetIsOutOfScopeViolation;

  /// The violation details for a third-party firewall's VPC endpoint subnet that
  /// was deleted.
  final FirewallSubnetMissingVPCEndpointViolation?
      firewallSubnetMissingVPCEndpointViolation;

  /// Violation detail for the entries in a network ACL resource.
  final InvalidNetworkAclEntriesViolation? invalidNetworkAclEntriesViolation;
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

  /// Contains details about the route endpoint that violates the policy scope.
  final RouteHasOutOfScopeEndpointViolation?
      routeHasOutOfScopeEndpointViolation;

  /// The violation details for a third-party firewall that has the Firewall
  /// Manager managed route table that was associated with the third-party
  /// firewall has been deleted.
  final ThirdPartyFirewallMissingExpectedRouteTableViolation?
      thirdPartyFirewallMissingExpectedRouteTableViolation;

  /// The violation details for a third-party firewall that's been deleted.
  final ThirdPartyFirewallMissingFirewallViolation?
      thirdPartyFirewallMissingFirewallViolation;

  /// The violation details for a third-party firewall's subnet that's been
  /// deleted.
  final ThirdPartyFirewallMissingSubnetViolation?
      thirdPartyFirewallMissingSubnetViolation;

  ResourceViolation({
    this.awsEc2InstanceViolation,
    this.awsEc2NetworkInterfaceViolation,
    this.awsVPCSecurityGroupViolation,
    this.dnsDuplicateRuleGroupViolation,
    this.dnsRuleGroupLimitExceededViolation,
    this.dnsRuleGroupPriorityConflictViolation,
    this.firewallSubnetIsOutOfScopeViolation,
    this.firewallSubnetMissingVPCEndpointViolation,
    this.invalidNetworkAclEntriesViolation,
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
    this.routeHasOutOfScopeEndpointViolation,
    this.thirdPartyFirewallMissingExpectedRouteTableViolation,
    this.thirdPartyFirewallMissingFirewallViolation,
    this.thirdPartyFirewallMissingSubnetViolation,
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
      firewallSubnetIsOutOfScopeViolation:
          json['FirewallSubnetIsOutOfScopeViolation'] != null
              ? FirewallSubnetIsOutOfScopeViolation.fromJson(
                  json['FirewallSubnetIsOutOfScopeViolation']
                      as Map<String, dynamic>)
              : null,
      firewallSubnetMissingVPCEndpointViolation:
          json['FirewallSubnetMissingVPCEndpointViolation'] != null
              ? FirewallSubnetMissingVPCEndpointViolation.fromJson(
                  json['FirewallSubnetMissingVPCEndpointViolation']
                      as Map<String, dynamic>)
              : null,
      invalidNetworkAclEntriesViolation:
          json['InvalidNetworkAclEntriesViolation'] != null
              ? InvalidNetworkAclEntriesViolation.fromJson(
                  json['InvalidNetworkAclEntriesViolation']
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
      routeHasOutOfScopeEndpointViolation:
          json['RouteHasOutOfScopeEndpointViolation'] != null
              ? RouteHasOutOfScopeEndpointViolation.fromJson(
                  json['RouteHasOutOfScopeEndpointViolation']
                      as Map<String, dynamic>)
              : null,
      thirdPartyFirewallMissingExpectedRouteTableViolation:
          json['ThirdPartyFirewallMissingExpectedRouteTableViolation'] != null
              ? ThirdPartyFirewallMissingExpectedRouteTableViolation.fromJson(
                  json['ThirdPartyFirewallMissingExpectedRouteTableViolation']
                      as Map<String, dynamic>)
              : null,
      thirdPartyFirewallMissingFirewallViolation:
          json['ThirdPartyFirewallMissingFirewallViolation'] != null
              ? ThirdPartyFirewallMissingFirewallViolation.fromJson(
                  json['ThirdPartyFirewallMissingFirewallViolation']
                      as Map<String, dynamic>)
              : null,
      thirdPartyFirewallMissingSubnetViolation:
          json['ThirdPartyFirewallMissingSubnetViolation'] != null
              ? ThirdPartyFirewallMissingSubnetViolation.fromJson(
                  json['ThirdPartyFirewallMissingSubnetViolation']
                      as Map<String, dynamic>)
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
    final firewallSubnetIsOutOfScopeViolation =
        this.firewallSubnetIsOutOfScopeViolation;
    final firewallSubnetMissingVPCEndpointViolation =
        this.firewallSubnetMissingVPCEndpointViolation;
    final invalidNetworkAclEntriesViolation =
        this.invalidNetworkAclEntriesViolation;
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
    final routeHasOutOfScopeEndpointViolation =
        this.routeHasOutOfScopeEndpointViolation;
    final thirdPartyFirewallMissingExpectedRouteTableViolation =
        this.thirdPartyFirewallMissingExpectedRouteTableViolation;
    final thirdPartyFirewallMissingFirewallViolation =
        this.thirdPartyFirewallMissingFirewallViolation;
    final thirdPartyFirewallMissingSubnetViolation =
        this.thirdPartyFirewallMissingSubnetViolation;
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
      if (firewallSubnetIsOutOfScopeViolation != null)
        'FirewallSubnetIsOutOfScopeViolation':
            firewallSubnetIsOutOfScopeViolation,
      if (firewallSubnetMissingVPCEndpointViolation != null)
        'FirewallSubnetMissingVPCEndpointViolation':
            firewallSubnetMissingVPCEndpointViolation,
      if (invalidNetworkAclEntriesViolation != null)
        'InvalidNetworkAclEntriesViolation': invalidNetworkAclEntriesViolation,
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
      if (routeHasOutOfScopeEndpointViolation != null)
        'RouteHasOutOfScopeEndpointViolation':
            routeHasOutOfScopeEndpointViolation,
      if (thirdPartyFirewallMissingExpectedRouteTableViolation != null)
        'ThirdPartyFirewallMissingExpectedRouteTableViolation':
            thirdPartyFirewallMissingExpectedRouteTableViolation,
      if (thirdPartyFirewallMissingFirewallViolation != null)
        'ThirdPartyFirewallMissingFirewallViolation':
            thirdPartyFirewallMissingFirewallViolation,
      if (thirdPartyFirewallMissingSubnetViolation != null)
        'ThirdPartyFirewallMissingSubnetViolation':
            thirdPartyFirewallMissingSubnetViolation,
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

/// Contains details about the route endpoint that violates the policy scope.
class RouteHasOutOfScopeEndpointViolation {
  /// The route table associated with the current firewall subnet.
  final String? currentFirewallSubnetRouteTable;

  /// The current route table associated with the Internet Gateway.
  final String? currentInternetGatewayRouteTable;

  /// The ID of the firewall subnet.
  final String? firewallSubnetId;

  /// The list of firewall subnet routes.
  final List<Route>? firewallSubnetRoutes;

  /// The ID of the Internet Gateway.
  final String? internetGatewayId;

  /// The routes in the route table associated with the Internet Gateway.
  final List<Route>? internetGatewayRoutes;

  /// The ID of the route table.
  final String? routeTableId;

  /// The subnet's Availability Zone.
  final String? subnetAvailabilityZone;

  /// The ID of the subnet's Availability Zone.
  final String? subnetAvailabilityZoneId;

  /// The ID of the subnet associated with the route that violates the policy
  /// scope.
  final String? subnetId;

  /// The list of routes that violate the route table.
  final List<Route>? violatingRoutes;

  /// The VPC ID of the route that violates the policy scope.
  final String? vpcId;

  RouteHasOutOfScopeEndpointViolation({
    this.currentFirewallSubnetRouteTable,
    this.currentInternetGatewayRouteTable,
    this.firewallSubnetId,
    this.firewallSubnetRoutes,
    this.internetGatewayId,
    this.internetGatewayRoutes,
    this.routeTableId,
    this.subnetAvailabilityZone,
    this.subnetAvailabilityZoneId,
    this.subnetId,
    this.violatingRoutes,
    this.vpcId,
  });

  factory RouteHasOutOfScopeEndpointViolation.fromJson(
      Map<String, dynamic> json) {
    return RouteHasOutOfScopeEndpointViolation(
      currentFirewallSubnetRouteTable:
          json['CurrentFirewallSubnetRouteTable'] as String?,
      currentInternetGatewayRouteTable:
          json['CurrentInternetGatewayRouteTable'] as String?,
      firewallSubnetId: json['FirewallSubnetId'] as String?,
      firewallSubnetRoutes: (json['FirewallSubnetRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      internetGatewayId: json['InternetGatewayId'] as String?,
      internetGatewayRoutes: (json['InternetGatewayRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeTableId: json['RouteTableId'] as String?,
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] as String?,
      subnetAvailabilityZoneId: json['SubnetAvailabilityZoneId'] as String?,
      subnetId: json['SubnetId'] as String?,
      violatingRoutes: (json['ViolatingRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentFirewallSubnetRouteTable =
        this.currentFirewallSubnetRouteTable;
    final currentInternetGatewayRouteTable =
        this.currentInternetGatewayRouteTable;
    final firewallSubnetId = this.firewallSubnetId;
    final firewallSubnetRoutes = this.firewallSubnetRoutes;
    final internetGatewayId = this.internetGatewayId;
    final internetGatewayRoutes = this.internetGatewayRoutes;
    final routeTableId = this.routeTableId;
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetAvailabilityZoneId = this.subnetAvailabilityZoneId;
    final subnetId = this.subnetId;
    final violatingRoutes = this.violatingRoutes;
    final vpcId = this.vpcId;
    return {
      if (currentFirewallSubnetRouteTable != null)
        'CurrentFirewallSubnetRouteTable': currentFirewallSubnetRouteTable,
      if (currentInternetGatewayRouteTable != null)
        'CurrentInternetGatewayRouteTable': currentInternetGatewayRouteTable,
      if (firewallSubnetId != null) 'FirewallSubnetId': firewallSubnetId,
      if (firewallSubnetRoutes != null)
        'FirewallSubnetRoutes': firewallSubnetRoutes,
      if (internetGatewayId != null) 'InternetGatewayId': internetGatewayId,
      if (internetGatewayRoutes != null)
        'InternetGatewayRoutes': internetGatewayRoutes,
      if (routeTableId != null) 'RouteTableId': routeTableId,
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetAvailabilityZoneId != null)
        'SubnetAvailabilityZoneId': subnetAvailabilityZoneId,
      if (subnetId != null) 'SubnetId': subnetId,
      if (violatingRoutes != null) 'ViolatingRoutes': violatingRoutes,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum RuleOrder {
  strictOrder,
  defaultActionOrder,
}

extension RuleOrderValueExtension on RuleOrder {
  String toValue() {
    switch (this) {
      case RuleOrder.strictOrder:
        return 'STRICT_ORDER';
      case RuleOrder.defaultActionOrder:
        return 'DEFAULT_ACTION_ORDER';
    }
  }
}

extension RuleOrderFromString on String {
  RuleOrder toRuleOrder() {
    switch (this) {
      case 'STRICT_ORDER':
        return RuleOrder.strictOrder;
      case 'DEFAULT_ACTION_ORDER':
        return RuleOrder.defaultActionOrder;
    }
    throw Exception('$this is not known in enum RuleOrder');
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
  /// format.
  ///
  /// <ul>
  /// <li>
  /// Example: <code>DNS_FIREWALL</code>
  ///
  /// <code>"{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"</code>
  /// <note>
  /// Valid values for <code>preProcessRuleGroups</code> are between 1 and 99.
  /// Valid values for <code>postProcessRuleGroups</code> are between 9901 and
  /// 10000.
  /// </note> </li>
  /// <li>
  /// Example: <code>IMPORT_NETWORK_FIREWALL</code>
  ///
  /// <code>"{\"type\":\"IMPORT_NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:000000000000:stateless-rulegroup\/rg1\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:drop\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:pass\"],\"networkFirewallStatelessCustomActions\":[],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:aws-managed:stateful-rulegroup\/ThreatSignaturesEmergingEventsStrictOrder\",\"priority\":8}],\"networkFirewallStatefulEngineOptions\":{\"ruleOrder\":\"STRICT_ORDER\"},\"networkFirewallStatefulDefaultActions\":[\"aws:drop_strict\"]}}"</code>
  ///
  /// <code>"{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"</code>
  /// <note>
  /// Valid values for <code>preProcessRuleGroups</code> are between 1 and 99.
  /// Valid values for <code>postProcessRuleGroups</code> are between 9901 and
  /// 10000.
  /// </note> </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code> - Centralized deployment model
  ///
  /// <code>"{\"type\":\"NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}},\"firewallDeploymentModel\":{\"centralizedFirewallDeploymentModel\":{\"centralizedFirewallOrchestrationConfig\":{\"inspectionVpcIds\":[{\"resourceId\":\"vpc-1234\",\"accountId\":\"123456789011\"}],\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneId\":null,\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"allowedIPV4CidrList\":[]}}}}"</code>
  ///
  /// To use the centralized deployment model, you must set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>CENTRALIZED</code>.
  /// </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code> - Distributed deployment model with
  /// automatic Availability Zone configuration
  ///
  /// <code>
  /// "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"OFF\"},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"
  /// </code>
  ///
  /// With automatic Availbility Zone configuration, Firewall Manager chooses
  /// which Availability Zones to create the endpoints in. To use the distributed
  /// deployment model, you must set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>NULL</code>.
  /// </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code> - Distributed deployment model with
  /// automatic Availability Zone configuration and route management
  ///
  /// <code>
  /// "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"]},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":
  /// \"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"
  /// </code>
  ///
  /// To use the distributed deployment model, you must set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>NULL</code>.
  /// </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code> - Distributed deployment model with
  /// custom Availability Zone configuration
  ///
  /// <code>"{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",
  /// \"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{
  /// \"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[
  /// \"10.0.0.0/28\"]}]}
  /// },\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"OFF\",\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"
  /// </code>
  ///
  /// With custom Availability Zone configuration, you define which specific
  /// Availability Zones to create endpoints in by configuring
  /// <code>firewallCreationConfig</code>. To configure the Availability Zones in
  /// <code>firewallCreationConfig</code>, specify either the
  /// <code>availabilityZoneName</code> or <code>availabilityZoneId</code>
  /// parameter, not both parameters.
  ///
  /// To use the distributed deployment model, you must set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>NULL</code>.
  /// </li>
  /// <li>
  /// Example: <code>NETWORK_FIREWALL</code> - Distributed deployment model with
  /// custom Availability Zone configuration and route management
  ///
  /// <code>"{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"],\"routeManagementConfig\":{\"allowCrossAZTrafficIfNoEndpoint\":true}},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"
  /// </code>
  ///
  /// To use the distributed deployment model, you must set <a
  /// href="https://docs.aws.amazon.com/fms/2018-01-01/APIReference/API_PolicyOption.html">PolicyOption</a>
  /// to <code>NULL</code>.
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_COMMON</code>
  ///
  /// <code>"{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
  /// \"applyToAllEC2InstanceENIs\":false,\"securityGroups\":[{\"id\":\"
  /// sg-000e55995d61a06bd\"}]}"</code>
  /// </li>
  /// <li>
  /// Example: <code>SECURITY_GROUPS_COMMON</code> - Security group tag
  /// distribution
  ///
  /// <code>""{\"type\":\"SECURITY_GROUPS_COMMON\",\"securityGroups\":[{\"id\":\"sg-000e55995d61a06bd\"}],\"revertManualSecurityGroupChanges\":true,\"exclusiveResourceSecurityGroupManagement\":false,\"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":false,\"enableTagDistribution\":true}""</code>
  ///
  /// Firewall Manager automatically distributes tags from the primary group to
  /// the security groups created by this policy. To use security group tag
  /// distribution, you must also set
  /// <code>revertManualSecurityGroupChanges</code> to <code>true</code>,
  /// otherwise Firewall Manager won't be able to create the policy. When you
  /// enable <code>revertManualSecurityGroupChanges</code>, Firewall Manager
  /// identifies and reports when the security groups created by this policy
  /// become non-compliant.
  ///
  /// Firewall Manager won't distribute system tags added by Amazon Web Services
  /// services into the replica security groups. System tags begin with the
  /// <code>aws:</code> prefix.
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
  /// <li>
  /// Example: <code>SHIELD_ADVANCED</code> with web ACL management
  ///
  /// <code>"{\"type\":\"SHIELD_ADVANCED\",\"optimizeUnassociatedWebACL\":true}"</code>
  ///
  /// If you set <code>optimizeUnassociatedWebACL</code> to <code>true</code>,
  /// Firewall Manager creates web ACLs in accounts within the policy scope if the
  /// web ACLs will be used by at least one resource. Firewall Manager creates web
  /// ACLs in the accounts within policy scope only if the web ACLs will be used
  /// by at least one resource. If at any time an account comes into policy scope,
  /// Firewall Manager automatically creates a web ACL in the account if at least
  /// one resource will use the web ACL.
  ///
  /// Upon enablement, Firewall Manager performs a one-time cleanup of unused web
  /// ACLs in your account. The cleanup process can take several hours. If a
  /// resource leaves policy scope after Firewall Manager creates a web ACL,
  /// Firewall Manager doesn't disassociate the resource from the web ACL. If you
  /// want Firewall Manager to clean up the web ACL, you must first manually
  /// disassociate the resources from the web ACL, and then enable the manage
  /// unused web ACLs option in your policy.
  ///
  /// If you set <code>optimizeUnassociatedWebACL</code> to <code>false</code>,
  /// and Firewall Manager automatically creates an empty web ACL in each account
  /// that's within policy scope.
  /// </li>
  /// <li>
  /// Specification for <code>SHIELD_ADVANCED</code> for Amazon CloudFront
  /// distributions
  ///
  /// <code>"{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
  /// {\"automaticResponseStatus\":\"ENABLED|IGNORED|DISABLED\",
  /// \"automaticResponseAction\":\"BLOCK|COUNT\"},
  /// \"overrideCustomerWebaclClassic\":true|false,
  /// \"optimizeUnassociatedWebACL\":true|false}"</code>
  ///
  /// For example:
  /// <code>"{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
  /// {\"automaticResponseStatus\":\"ENABLED\",
  /// \"automaticResponseAction\":\"COUNT\"}}"</code>
  ///
  /// The default value for <code>automaticResponseStatus</code> is
  /// <code>IGNORED</code>. The value for <code>automaticResponseAction</code> is
  /// only required when <code>automaticResponseStatus</code> is set to
  /// <code>ENABLED</code>. The default value for
  /// <code>overrideCustomerWebaclClassic</code> is <code>false</code>.
  ///
  /// For other resource types that you can protect with a Shield Advanced policy,
  /// this <code>ManagedServiceData</code> configuration is an empty string.
  /// </li>
  /// <li>
  /// Example: <code>THIRD_PARTY_FIREWALL</code>
  ///
  /// Replace <code>THIRD_PARTY_FIREWALL_NAME</code> with the name of the
  /// third-party firewall.
  ///
  /// <code>"{ "type":"THIRD_PARTY_FIREWALL",
  /// "thirdPartyFirewall":"THIRD_PARTY_FIREWALL_NAME",
  /// "thirdPartyFirewallConfig":{ "thirdPartyFirewallPolicyList":["global-1"] },
  /// "firewallDeploymentModel":{ "distributedFirewallDeploymentModel":{
  /// "distributedFirewallOrchestrationConfig":{ "firewallCreationConfig":{
  /// "endpointLocation":{ "availabilityZoneConfigList":[ {
  /// "availabilityZoneName":"${AvailabilityZone}" } ] } },
  /// "allowedIPV4CidrList":[ ] } } } }"</code>
  /// </li>
  /// <li>
  /// Example: <code>WAFV2</code> - Account takeover prevention, Bot Control
  /// managed rule groups, optimize unassociated web ACL, and rule action override
  ///
  /// <code>"{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesATPRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesATPRuleSet\":{\"loginPath\":\"/loginpath\",\"requestInspection\":{\"payloadType\":\"FORM_ENCODED|JSON\",\"usernameField\":{\"identifier\":\"/form/username\"},\"passwordField\":{\"identifier\":\"/form/password\"}}}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true},{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesBotControlRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesBotControlRuleSet\":{\"inspectionLevel\":\"TARGETED|COMMON\"}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true,\"ruleActionOverrides\":[{\"name\":\"Rule1\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}},{\"name\":\"Rule2\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"optimizeUnassociatedWebACL\":true}"</code>
  ///
  /// <ul>
  /// <li>
  /// Bot Control - For information about
  /// <code>AWSManagedRulesBotControlRuleSet</code> managed rule groups, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesBotControlRuleSet.html">AWSManagedRulesBotControlRuleSet</a>
  /// in the <i>WAF API Reference</i>.
  /// </li>
  /// <li>
  /// Fraud Control account takeover prevention (ATP) - For information about the
  /// properties available for <code>AWSManagedRulesATPRuleSet</code> managed rule
  /// groups, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_AWSManagedRulesATPRuleSet.html">AWSManagedRulesATPRuleSet</a>
  /// in the <i>WAF API Reference</i>.
  /// </li>
  /// <li>
  /// Optimize unassociated web ACL - If you set
  /// <code>optimizeUnassociatedWebACL</code> to <code>true</code>, Firewall
  /// Manager creates web ACLs in accounts within the policy scope if the web ACLs
  /// will be used by at least one resource. Firewall Manager creates web ACLs in
  /// the accounts within policy scope only if the web ACLs will be used by at
  /// least one resource. If at any time an account comes into policy scope,
  /// Firewall Manager automatically creates a web ACL in the account if at least
  /// one resource will use the web ACL.
  ///
  /// Upon enablement, Firewall Manager performs a one-time cleanup of unused web
  /// ACLs in your account. The cleanup process can take several hours. If a
  /// resource leaves policy scope after Firewall Manager creates a web ACL,
  /// Firewall Manager disassociates the resource from the web ACL, but won't
  /// clean up the unused web ACL. Firewall Manager only cleans up unused web ACLs
  /// when you first enable management of unused web ACLs in a policy.
  ///
  /// If you set <code>optimizeUnassociatedWebACL</code> to <code>false</code>
  /// Firewall Manager doesn't manage unused web ACLs, and Firewall Manager
  /// automatically creates an empty web ACL in each account that's within policy
  /// scope.
  /// </li>
  /// <li>
  /// Rule action overrides - Firewall Manager supports rule action overrides only
  /// for managed rule groups. To configure a <code>RuleActionOverrides</code> add
  /// the <code>Name</code> of the rule to override, and <code>ActionToUse</code>,
  /// which is the new action to use for the rule. For information about using
  /// rule action override, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_RuleActionOverride.html">RuleActionOverride</a>
  /// in the <i>WAF API Reference</i>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Example: <code>WAFV2</code> - <code>CAPTCHA</code> and
  /// <code>Challenge</code> configs
  ///
  /// <code>"{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"captchaConfig\":{\"immunityTimeProperty\":{\"immunityTime\":500}},\"challengeConfig\":{\"immunityTimeProperty\":{\"immunityTime\":800}},\"tokenDomains\":[\"google.com\",\"amazon.com\"],\"associationConfig\":{\"requestBody\":{\"CLOUDFRONT\":{\"defaultSizeInspectionLimit\":\"KB_16\"}}}}"</code>
  ///
  /// <ul>
  /// <li>
  /// <code>CAPTCHA</code> and <code>Challenge</code> configs - If you update the
  /// policy's values for <code>associationConfig</code>,
  /// <code>captchaConfig</code>, <code>challengeConfig</code>, or
  /// <code>tokenDomains</code>, Firewall Manager will overwrite your local web
  /// ACLs to contain the new value(s). However, if you don't update the policy's
  /// <code>associationConfig</code>, <code>captchaConfig</code>,
  /// <code>challengeConfig</code>, or <code>tokenDomains</code> values, the
  /// values in your local web ACLs will remain unchanged. For information about
  /// association configs, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_AssociationConfig.html">AssociationConfig</a>.
  /// For information about CAPTCHA and Challenge configs, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_CaptchaConfig.html">CaptchaConfig</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_ChallengeConfig.html">ChallengeConfig</a>
  /// in the <i>WAF API Reference</i>.
  /// </li>
  /// <li>
  /// <code>defaultSizeInspectionLimit</code> - Specifies the maximum size of the
  /// web request body component that an associated Amazon CloudFront distribution
  /// should send to WAF for inspection. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_RequestBodyAssociatedResourceTypeConfig.html#WAF-Type-RequestBodyAssociatedResourceTypeConfig-DefaultSizeInspectionLimit">DefaultSizeInspectionLimit</a>
  /// in the <i>WAF API Reference</i>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Example: <code>WAFV2</code> - Firewall Manager support for WAF managed rule
  /// group versioning
  ///
  /// <code>"{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":true,\"version\":\"Version_2.0\",\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesCommonRuleSet\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[{\"name\":\"NoUserAgent_HEADER\"}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":{\"logDestinationConfigs\":[\"arn:aws:firehose:us-west-2:12345678912:deliverystream/aws-waf-logs-fms-admin-destination\"],\"redactedFields\":[{\"redactedFieldType\":\"SingleHeader\",\"redactedFieldValue\":\"Cookies\"},{\"redactedFieldType\":\"Method\"}]}}"</code>
  ///
  /// To use a specific version of a WAF managed rule group in your Firewall
  /// Manager policy, you must set <code>versionEnabled</code> to
  /// <code>true</code>, and set <code>version</code> to the version you'd like to
  /// use. If you don't set <code>versionEnabled</code> to <code>true</code>, or
  /// if you omit <code>versionEnabled</code>, then Firewall Manager uses the
  /// default version of the WAF managed rule group.
  /// </li>
  /// <li>
  /// Example: <code>WAFV2</code> - Logging configurations
  ///
  /// <code>"{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,
  /// \"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":
  /// {\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",
  /// \"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"}
  /// ,\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],
  /// \"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],
  /// \"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\"
  /// :null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\"
  /// :false,\"loggingConfiguration\":{\"logDestinationConfigs\":
  /// [\"arn:aws:s3:::aws-waf-logs-example-bucket\"]
  /// ,\"redactedFields\":[],\"loggingFilterConfigs\":{\"defaultBehavior\":\"KEEP\",
  /// \"filters\":[{\"behavior\":\"KEEP\",\"requirement\":\"MEETS_ALL\",
  /// \"conditions\":[{\"actionCondition\":\"CAPTCHA\"},{\"actionCondition\":
  /// \"CHALLENGE\"},
  /// {\"actionCondition\":\"EXCLUDED_AS_COUNT\"}]}]}},\"sampledRequestsEnabledForDefaultActions\":true}"</code>
  ///
  /// Firewall Manager supports Amazon Kinesis Data Firehose and Amazon S3 as the
  /// <code>logDestinationConfigs</code> in your
  /// <code>loggingConfiguration</code>. For information about WAF logging
  /// configurations, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/APIReference/API_LoggingConfiguration.html">LoggingConfiguration</a>
  /// in the <i>WAF API Reference</i>
  ///
  /// In the <code>loggingConfiguration</code>, you can specify one
  /// <code>logDestinationConfigs</code>. Optionally provide as many as 20
  /// <code>redactedFields</code>. The <code>RedactedFieldType</code> must be one
  /// of <code>URI</code>, <code>QUERY_STRING</code>, <code>HEADER</code>, or
  /// <code>METHOD</code>.
  /// </li>
  /// <li>
  /// Example: <code>WAF Classic</code>
  ///
  /// <code>"{\"type\": \"WAF\", \"ruleGroups\":
  /// [{\"id\":\"12345678-1bcd-9012-efga-0987654321ab\", \"overrideAction\" :
  /// {\"type\": \"COUNT\"}}], \"defaultAction\": {\"type\": \"BLOCK\"}}"</code>
  /// </li>
  /// </ul>
  final String? managedServiceData;

  /// Contains the settings to configure a network ACL policy, a Network Firewall
  /// firewall policy deployment model, or a third-party firewall policy.
  final PolicyOption? policyOption;

  SecurityServicePolicyData({
    required this.type,
    this.managedServiceData,
    this.policyOption,
  });

  factory SecurityServicePolicyData.fromJson(Map<String, dynamic> json) {
    return SecurityServicePolicyData(
      type: (json['Type'] as String).toSecurityServiceType(),
      managedServiceData: json['ManagedServiceData'] as String?,
      policyOption: json['PolicyOption'] != null
          ? PolicyOption.fromJson(json['PolicyOption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final managedServiceData = this.managedServiceData;
    final policyOption = this.policyOption;
    return {
      'Type': type.toValue(),
      if (managedServiceData != null) 'ManagedServiceData': managedServiceData,
      if (policyOption != null) 'PolicyOption': policyOption,
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
  thirdPartyFirewall,
  importNetworkFirewall,
  networkAclCommon,
}

extension SecurityServiceTypeValueExtension on SecurityServiceType {
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
      case SecurityServiceType.thirdPartyFirewall:
        return 'THIRD_PARTY_FIREWALL';
      case SecurityServiceType.importNetworkFirewall:
        return 'IMPORT_NETWORK_FIREWALL';
      case SecurityServiceType.networkAclCommon:
        return 'NETWORK_ACL_COMMON';
    }
  }
}

extension SecurityServiceTypeFromString on String {
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
      case 'THIRD_PARTY_FIREWALL':
        return SecurityServiceType.thirdPartyFirewall;
      case 'IMPORT_NETWORK_FIREWALL':
        return SecurityServiceType.importNetworkFirewall;
      case 'NETWORK_ACL_COMMON':
        return SecurityServiceType.networkAclCommon;
    }
    throw Exception('$this is not known in enum SecurityServiceType');
  }
}

/// Configuration settings for the handling of the stateful rule groups in a
/// Network Firewall firewall policy.
class StatefulEngineOptions {
  /// Indicates how to manage the order of stateful rule evaluation for the
  /// policy. Stateful rules are provided to the rule engine as Suricata
  /// compatible strings, and Suricata evaluates them based on certain settings.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html">Evaluation
  /// order for stateful rules</a> in the <i>Network Firewall Developer Guide</i>.
  ///
  /// Default: <code>DEFAULT_ACTION_ORDER</code>
  final RuleOrder? ruleOrder;

  /// Indicates how Network Firewall should handle traffic when a network
  /// connection breaks midstream.
  ///
  /// <ul>
  /// <li>
  /// <code>DROP</code> - Fail closed and drop all subsequent traffic going to the
  /// firewall.
  /// </li>
  /// <li>
  /// <code>CONTINUE</code> - Continue to apply rules to subsequent traffic
  /// without context from traffic before the break. This impacts the behavior of
  /// rules that depend on context. For example, with a stateful rule that drops
  /// HTTP traffic, Network Firewall won't match subsequent traffic because the it
  /// won't have the context from session initialization, which defines the
  /// application layer protocol as HTTP. However, a TCP-layer rule using a
  /// <code>flow:stateless</code> rule would still match, and so would the
  /// <code>aws:drop_strict</code> default action.
  /// </li>
  /// <li>
  /// <code>REJECT</code> - Fail closed and drop all subsequent traffic going to
  /// the firewall. With this option, Network Firewall also sends a TCP reject
  /// packet back to the client so the client can immediately establish a new
  /// session. With the new session, Network Firewall will have context and will
  /// apply rules appropriately.
  ///
  /// For applications that are reliant on long-lived TCP connections that trigger
  /// Gateway Load Balancer idle timeouts, this is the recommended setting.
  /// </li>
  /// <li>
  /// <code>FMS_IGNORE</code> - Firewall Manager doesn't monitor or modify the
  /// Network Firewall stream exception policy settings.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/stream-exception-policy.html">Stream
  /// exception policy in your firewall policy</a> in the <i>Network Firewall
  /// Developer Guide</i>.
  ///
  /// Default: <code>FMS_IGNORE</code>
  final StreamExceptionPolicy? streamExceptionPolicy;

  StatefulEngineOptions({
    this.ruleOrder,
    this.streamExceptionPolicy,
  });

  factory StatefulEngineOptions.fromJson(Map<String, dynamic> json) {
    return StatefulEngineOptions(
      ruleOrder: (json['RuleOrder'] as String?)?.toRuleOrder(),
      streamExceptionPolicy:
          (json['StreamExceptionPolicy'] as String?)?.toStreamExceptionPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleOrder = this.ruleOrder;
    final streamExceptionPolicy = this.streamExceptionPolicy;
    return {
      if (ruleOrder != null) 'RuleOrder': ruleOrder.toValue(),
      if (streamExceptionPolicy != null)
        'StreamExceptionPolicy': streamExceptionPolicy.toValue(),
    };
  }
}

/// Network Firewall stateful rule group, used in a
/// <a>NetworkFirewallPolicyDescription</a>.
class StatefulRuleGroup {
  /// The action that allows the policy owner to override the behavior of the rule
  /// group within a policy.
  final NetworkFirewallStatefulRuleGroupOverride? override;

  /// An integer setting that indicates the order in which to run the stateful
  /// rule groups in a single Network Firewall firewall policy. This setting only
  /// applies to firewall policies that specify the <code>STRICT_ORDER</code> rule
  /// order in the stateful engine options settings.
  ///
  /// Network Firewall evalutes each stateful rule group against a packet starting
  /// with the group that has the lowest priority setting. You must ensure that
  /// the priority settings are unique within each policy. For information about
  ///
  /// You can change the priority settings of your rule groups at any time. To
  /// make it easier to insert rule groups later, number them so there's a wide
  /// range in between, for example use 100, 200, and so on.
  final int? priority;

  /// The resource ID of the rule group.
  final String? resourceId;

  /// The name of the rule group.
  final String? ruleGroupName;

  StatefulRuleGroup({
    this.override,
    this.priority,
    this.resourceId,
    this.ruleGroupName,
  });

  factory StatefulRuleGroup.fromJson(Map<String, dynamic> json) {
    return StatefulRuleGroup(
      override: json['Override'] != null
          ? NetworkFirewallStatefulRuleGroupOverride.fromJson(
              json['Override'] as Map<String, dynamic>)
          : null,
      priority: json['Priority'] as int?,
      resourceId: json['ResourceId'] as String?,
      ruleGroupName: json['RuleGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final override = this.override;
    final priority = this.priority;
    final resourceId = this.resourceId;
    final ruleGroupName = this.ruleGroupName;
    return {
      if (override != null) 'Override': override,
      if (priority != null) 'Priority': priority,
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

enum StreamExceptionPolicy {
  drop,
  $continue,
  reject,
  fmsIgnore,
}

extension StreamExceptionPolicyValueExtension on StreamExceptionPolicy {
  String toValue() {
    switch (this) {
      case StreamExceptionPolicy.drop:
        return 'DROP';
      case StreamExceptionPolicy.$continue:
        return 'CONTINUE';
      case StreamExceptionPolicy.reject:
        return 'REJECT';
      case StreamExceptionPolicy.fmsIgnore:
        return 'FMS_IGNORE';
    }
  }
}

extension StreamExceptionPolicyFromString on String {
  StreamExceptionPolicy toStreamExceptionPolicy() {
    switch (this) {
      case 'DROP':
        return StreamExceptionPolicy.drop;
      case 'CONTINUE':
        return StreamExceptionPolicy.$continue;
      case 'REJECT':
        return StreamExceptionPolicy.reject;
      case 'FMS_IGNORE':
        return StreamExceptionPolicy.fmsIgnore;
    }
    throw Exception('$this is not known in enum StreamExceptionPolicy');
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

extension TargetTypeValueExtension on TargetType {
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

extension TargetTypeFromString on String {
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

enum ThirdPartyFirewall {
  paloAltoNetworksCloudNgfw,
  fortigateCloudNativeFirewall,
}

extension ThirdPartyFirewallValueExtension on ThirdPartyFirewall {
  String toValue() {
    switch (this) {
      case ThirdPartyFirewall.paloAltoNetworksCloudNgfw:
        return 'PALO_ALTO_NETWORKS_CLOUD_NGFW';
      case ThirdPartyFirewall.fortigateCloudNativeFirewall:
        return 'FORTIGATE_CLOUD_NATIVE_FIREWALL';
    }
  }
}

extension ThirdPartyFirewallFromString on String {
  ThirdPartyFirewall toThirdPartyFirewall() {
    switch (this) {
      case 'PALO_ALTO_NETWORKS_CLOUD_NGFW':
        return ThirdPartyFirewall.paloAltoNetworksCloudNgfw;
      case 'FORTIGATE_CLOUD_NATIVE_FIREWALL':
        return ThirdPartyFirewall.fortigateCloudNativeFirewall;
    }
    throw Exception('$this is not known in enum ThirdPartyFirewall');
  }
}

enum ThirdPartyFirewallAssociationStatus {
  onboarding,
  onboardComplete,
  offboarding,
  offboardComplete,
  notExist,
}

extension ThirdPartyFirewallAssociationStatusValueExtension
    on ThirdPartyFirewallAssociationStatus {
  String toValue() {
    switch (this) {
      case ThirdPartyFirewallAssociationStatus.onboarding:
        return 'ONBOARDING';
      case ThirdPartyFirewallAssociationStatus.onboardComplete:
        return 'ONBOARD_COMPLETE';
      case ThirdPartyFirewallAssociationStatus.offboarding:
        return 'OFFBOARDING';
      case ThirdPartyFirewallAssociationStatus.offboardComplete:
        return 'OFFBOARD_COMPLETE';
      case ThirdPartyFirewallAssociationStatus.notExist:
        return 'NOT_EXIST';
    }
  }
}

extension ThirdPartyFirewallAssociationStatusFromString on String {
  ThirdPartyFirewallAssociationStatus toThirdPartyFirewallAssociationStatus() {
    switch (this) {
      case 'ONBOARDING':
        return ThirdPartyFirewallAssociationStatus.onboarding;
      case 'ONBOARD_COMPLETE':
        return ThirdPartyFirewallAssociationStatus.onboardComplete;
      case 'OFFBOARDING':
        return ThirdPartyFirewallAssociationStatus.offboarding;
      case 'OFFBOARD_COMPLETE':
        return ThirdPartyFirewallAssociationStatus.offboardComplete;
      case 'NOT_EXIST':
        return ThirdPartyFirewallAssociationStatus.notExist;
    }
    throw Exception(
        '$this is not known in enum ThirdPartyFirewallAssociationStatus');
  }
}

/// Configures the third-party firewall's firewall policy.
class ThirdPartyFirewallFirewallPolicy {
  /// The ID of the specified firewall policy.
  final String? firewallPolicyId;

  /// The name of the specified firewall policy.
  final String? firewallPolicyName;

  ThirdPartyFirewallFirewallPolicy({
    this.firewallPolicyId,
    this.firewallPolicyName,
  });

  factory ThirdPartyFirewallFirewallPolicy.fromJson(Map<String, dynamic> json) {
    return ThirdPartyFirewallFirewallPolicy(
      firewallPolicyId: json['FirewallPolicyId'] as String?,
      firewallPolicyName: json['FirewallPolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firewallPolicyId = this.firewallPolicyId;
    final firewallPolicyName = this.firewallPolicyName;
    return {
      if (firewallPolicyId != null) 'FirewallPolicyId': firewallPolicyId,
      if (firewallPolicyName != null) 'FirewallPolicyName': firewallPolicyName,
    };
  }
}

/// The violation details for a third-party firewall that's not associated with
/// an Firewall Manager managed route table.
class ThirdPartyFirewallMissingExpectedRouteTableViolation {
  /// The Availability Zone of the firewall subnet that's causing the violation.
  final String? availabilityZone;

  /// The resource ID of the current route table that's associated with the
  /// subnet, if one is available.
  final String? currentRouteTable;

  /// The resource ID of the route table that should be associated with the
  /// subnet.
  final String? expectedRouteTable;

  /// The resource ID of the VPC associated with a fireawll subnet that's causing
  /// the violation.
  final String? vpc;

  /// The ID of the third-party firewall or VPC resource that's causing the
  /// violation.
  final String? violationTarget;

  ThirdPartyFirewallMissingExpectedRouteTableViolation({
    this.availabilityZone,
    this.currentRouteTable,
    this.expectedRouteTable,
    this.vpc,
    this.violationTarget,
  });

  factory ThirdPartyFirewallMissingExpectedRouteTableViolation.fromJson(
      Map<String, dynamic> json) {
    return ThirdPartyFirewallMissingExpectedRouteTableViolation(
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

/// The violation details about a third-party firewall's subnet that doesn't
/// have a Firewall Manager managed firewall in its VPC.
class ThirdPartyFirewallMissingFirewallViolation {
  /// The Availability Zone of the third-party firewall that's causing the
  /// violation.
  final String? availabilityZone;

  /// The reason the resource is causing this violation, if a reason is available.
  final String? targetViolationReason;

  /// The resource ID of the VPC associated with a third-party firewall.
  final String? vpc;

  /// The ID of the third-party firewall that's causing the violation.
  final String? violationTarget;

  ThirdPartyFirewallMissingFirewallViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });

  factory ThirdPartyFirewallMissingFirewallViolation.fromJson(
      Map<String, dynamic> json) {
    return ThirdPartyFirewallMissingFirewallViolation(
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

/// The violation details for a third-party firewall for an Availability Zone
/// that's missing the Firewall Manager managed subnet.
class ThirdPartyFirewallMissingSubnetViolation {
  /// The Availability Zone of a subnet that's causing the violation.
  final String? availabilityZone;

  /// The reason the resource is causing the violation, if a reason is available.
  final String? targetViolationReason;

  /// The resource ID of the VPC associated with a subnet that's causing the
  /// violation.
  final String? vpc;

  /// The ID of the third-party firewall or VPC resource that's causing the
  /// violation.
  final String? violationTarget;

  ThirdPartyFirewallMissingSubnetViolation({
    this.availabilityZone,
    this.targetViolationReason,
    this.vpc,
    this.violationTarget,
  });

  factory ThirdPartyFirewallMissingSubnetViolation.fromJson(
      Map<String, dynamic> json) {
    return ThirdPartyFirewallMissingSubnetViolation(
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

/// Configures the deployment model for the third-party firewall.
class ThirdPartyFirewallPolicy {
  /// Defines the deployment model to use for the third-party firewall policy.
  final FirewallDeploymentModel? firewallDeploymentModel;

  ThirdPartyFirewallPolicy({
    this.firewallDeploymentModel,
  });

  factory ThirdPartyFirewallPolicy.fromJson(Map<String, dynamic> json) {
    return ThirdPartyFirewallPolicy(
      firewallDeploymentModel: (json['FirewallDeploymentModel'] as String?)
          ?.toFirewallDeploymentModel(),
    );
  }

  Map<String, dynamic> toJson() {
    final firewallDeploymentModel = this.firewallDeploymentModel;
    return {
      if (firewallDeploymentModel != null)
        'FirewallDeploymentModel': firewallDeploymentModel.toValue(),
    };
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
  firewallSubnetIsOutOfScope,
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
  routeHasOutOfScopeEndpoint,
  firewallSubnetMissingVpceEndpoint,
  invalidNetworkAclEntry,
}

extension ViolationReasonValueExtension on ViolationReason {
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
      case ViolationReason.firewallSubnetIsOutOfScope:
        return 'FIREWALL_SUBNET_IS_OUT_OF_SCOPE';
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
      case ViolationReason.routeHasOutOfScopeEndpoint:
        return 'ROUTE_HAS_OUT_OF_SCOPE_ENDPOINT';
      case ViolationReason.firewallSubnetMissingVpceEndpoint:
        return 'FIREWALL_SUBNET_MISSING_VPCE_ENDPOINT';
      case ViolationReason.invalidNetworkAclEntry:
        return 'INVALID_NETWORK_ACL_ENTRY';
    }
  }
}

extension ViolationReasonFromString on String {
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
      case 'FIREWALL_SUBNET_IS_OUT_OF_SCOPE':
        return ViolationReason.firewallSubnetIsOutOfScope;
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
      case 'ROUTE_HAS_OUT_OF_SCOPE_ENDPOINT':
        return ViolationReason.routeHasOutOfScopeEndpoint;
      case 'FIREWALL_SUBNET_MISSING_VPCE_ENDPOINT':
        return ViolationReason.firewallSubnetMissingVpceEndpoint;
      case 'INVALID_NETWORK_ACL_ENTRY':
        return ViolationReason.invalidNetworkAclEntry;
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
