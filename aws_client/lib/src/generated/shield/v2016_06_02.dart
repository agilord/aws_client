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

/// This is the <i>Shield Advanced API Reference</i>. This guide is for
/// developers who need detailed information about the Shield Advanced API
/// actions, data types, and errors. For detailed information about WAF and
/// Shield Advanced features and an overview of how to use the WAF and Shield
/// Advanced APIs, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/">WAF and Shield
/// Developer Guide</a>.
class Shield {
  final _s.JsonProtocol _protocol;
  Shield({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'shield',
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

  /// Authorizes the Shield Response Team (SRT) to access the specified Amazon
  /// S3 bucket containing log data such as Application Load Balancer access
  /// logs, CloudFront logs, or logs from third party sources. You can associate
  /// up to 10 Amazon S3 buckets with your subscription.
  ///
  /// To use the services of the SRT and make an
  /// <code>AssociateDRTLogBucket</code> request, you must be subscribed to the
  /// <a href="http://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="http://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
  /// Support plan</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [NoAssociatedRoleException].
  /// May throw [LimitsExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedForDependencyException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logBucket] :
  /// The Amazon S3 bucket that contains the logs that you want to share.
  Future<void> associateDRTLogBucket({
    required String logBucket,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateDRTLogBucket'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LogBucket': logBucket,
      },
    );
  }

  /// Authorizes the Shield Response Team (SRT) using the specified role, to
  /// access your Amazon Web Services account to assist with DDoS attack
  /// mitigation during potential attacks. This enables the SRT to inspect your
  /// WAF configuration and create or update WAF rules and web ACLs.
  ///
  /// You can associate only one <code>RoleArn</code> with your subscription. If
  /// you submit an <code>AssociateDRTRole</code> request for an account that
  /// already has an associated role, the new <code>RoleArn</code> will replace
  /// the existing <code>RoleArn</code>.
  ///
  /// Prior to making the <code>AssociateDRTRole</code> request, you must attach
  /// the <code>AWSShieldDRTAccessPolicy</code> managed policy to the role that
  /// you'll specify in the request. You can access this policy in the IAM
  /// console at <a
  /// href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a>.
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Adding
  /// and removing IAM identity permissions</a>. The role must also trust the
  /// service principal <code>drt.shield.amazonaws.com</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM
  /// JSON policy elements: Principal</a>.
  ///
  /// The SRT will have access only to your WAF and Shield resources. By
  /// submitting this request, you authorize the SRT to inspect your WAF and
  /// Shield configuration and create and update WAF rules and web ACLs on your
  /// behalf. The SRT takes these actions only if explicitly authorized by you.
  ///
  /// You must have the <code>iam:PassRole</code> permission to make an
  /// <code>AssociateDRTRole</code> request. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">Granting
  /// a user permissions to pass a role to an Amazon Web Services service</a>.
  ///
  /// To use the services of the SRT and make an <code>AssociateDRTRole</code>
  /// request, you must be subscribed to the <a
  /// href="http://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="http://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
  /// Support plan</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedForDependencyException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role the SRT will use to access your
  /// Amazon Web Services account.
  ///
  /// Prior to making the <code>AssociateDRTRole</code> request, you must attach
  /// the <a
  /// href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a>
  /// managed policy to this role. For more information see <a href="
  /// https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching
  /// and Detaching IAM Policies</a>.
  Future<void> associateDRTRole({
    required String roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateDRTRole'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoleArn': roleArn,
      },
    );
  }

  /// Adds health-based detection to the Shield Advanced protection for a
  /// resource. Shield Advanced health-based detection uses the health of your
  /// Amazon Web Services resource to improve responsiveness and accuracy in
  /// attack detection and response.
  ///
  /// You define the health check in Route 53 and then associate it with your
  /// Shield Advanced protection. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield
  /// Advanced Health-Based Detection</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [LimitsExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [healthCheckArn] :
  /// The Amazon Resource Name (ARN) of the health check to associate with the
  /// protection.
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to add the
  /// health check association to.
  Future<void> associateHealthCheck({
    required String healthCheckArn,
    required String protectionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateHealthCheck'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HealthCheckArn': healthCheckArn,
        'ProtectionId': protectionId,
      },
    );
  }

  /// Initializes proactive engagement and sets the list of contacts for the
  /// Shield Response Team (SRT) to use. You must provide at least one phone
  /// number in the emergency contact list.
  ///
  /// After you have initialized proactive engagement using this call, to
  /// disable or enable proactive engagement, use the calls
  /// <code>DisableProactiveEngagement</code> and
  /// <code>EnableProactiveEngagement</code>.
  /// <note>
  /// This call defines the list of email addresses and phone numbers that the
  /// SRT can use to contact you for escalations to the SRT and to initiate
  /// proactive customer support.
  ///
  /// The contacts that you provide in the request replace any contacts that
  /// were already defined. If you already have contacts defined and want to use
  /// them, retrieve the list using
  /// <code>DescribeEmergencyContactSettings</code> and then provide it to this
  /// call.
  /// </note>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [emergencyContactList] :
  /// A list of email addresses and phone numbers that the Shield Response Team
  /// (SRT) can use to contact you for escalations to the SRT and to initiate
  /// proactive customer support.
  ///
  /// To enable proactive engagement, the contact list must include at least one
  /// phone number.
  /// <note>
  /// The contacts that you provide here replace any contacts that were already
  /// defined. If you already have contacts defined and want to use them,
  /// retrieve the list using <code>DescribeEmergencyContactSettings</code> and
  /// then provide it here.
  /// </note>
  Future<void> associateProactiveEngagementDetails({
    required List<EmergencyContact> emergencyContactList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateProactiveEngagementDetails'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EmergencyContactList': emergencyContactList,
      },
    );
  }

  /// Enables Shield Advanced for a specific Amazon Web Services resource. The
  /// resource can be an Amazon CloudFront distribution, Amazon Route 53 hosted
  /// zone, Global Accelerator standard accelerator, Elastic IP Address,
  /// Application Load Balancer, or a Classic Load Balancer. You can protect
  /// Amazon EC2 instances and Network Load Balancers by association with
  /// protected Amazon EC2 Elastic IP addresses.
  ///
  /// You can add protection to only a single resource with each
  /// <code>CreateProtection</code> request. You can add protection to multiple
  /// resources at once through the Shield Advanced console at <a
  /// href="https://console.aws.amazon.com/wafv2/shieldv2#/">https://console.aws.amazon.com/wafv2/shieldv2#/</a>.
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html">Getting
  /// Started with Shield Advanced</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html">Adding
  /// Shield Advanced protection to Amazon Web Services resources</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidResourceException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitsExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// Friendly name for the <code>Protection</code> you are creating.
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the resource to be protected.
  ///
  /// The ARN should be in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an Application Load Balancer:
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Elastic Load Balancer (Classic Load Balancer):
  /// <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/<i>load-balancer-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Amazon CloudFront distribution:
  /// <code>arn:aws:cloudfront::<i>account-id</i>:distribution/<i>distribution-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an Global Accelerator standard accelerator:
  /// <code>arn:aws:globalaccelerator::<i>account-id</i>:accelerator/<i>accelerator-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For Amazon Route 53:
  /// <code>arn:aws:route53:::hostedzone/<i>hosted-zone-id</i> </code>
  /// </li>
  /// <li>
  /// For an Elastic IP address:
  /// <code>arn:aws:ec2:<i>region</i>:<i>account-id</i>:eip-allocation/<i>allocation-id</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the <a>Protection</a> object that is
  /// created.
  Future<CreateProtectionResponse> createProtection({
    required String name,
    required String resourceArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.CreateProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ResourceArn': resourceArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProtectionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a grouping of protected resources so they can be handled as a
  /// collective. This resource grouping improves the accuracy of detection and
  /// reduces false positives.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitsExceededException].
  ///
  /// Parameter [aggregation] :
  /// Defines how Shield combines resource data for the group in order to
  /// detect, mitigate, and report events.
  ///
  /// <ul>
  /// <li>
  /// Sum - Use the total traffic across the group. This is a good choice for
  /// most cases. Examples include Elastic IP addresses for EC2 instances that
  /// scale manually or automatically.
  /// </li>
  /// <li>
  /// Mean - Use the average of the traffic across the group. This is a good
  /// choice for resources that share traffic uniformly. Examples include
  /// accelerators and load balancers.
  /// </li>
  /// <li>
  /// Max - Use the highest traffic from each resource. This is useful for
  /// resources that don't share traffic and for resources that share that
  /// traffic in a non-uniform way. Examples include Amazon CloudFront and
  /// origin resources for CloudFront distributions.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pattern] :
  /// The criteria to use to choose the protected resources for inclusion in the
  /// group. You can include all resources that have protections, provide a list
  /// of resource Amazon Resource Names (ARNs), or include all resources of a
  /// specified resource type.
  ///
  /// Parameter [protectionGroupId] :
  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  ///
  /// Parameter [members] :
  /// The Amazon Resource Names (ARNs) of the resources to include in the
  /// protection group. You must set this when you set <code>Pattern</code> to
  /// <code>ARBITRARY</code> and you must not set it for any other
  /// <code>Pattern</code> setting.
  ///
  /// Parameter [resourceType] :
  /// The resource type to include in the protection group. All protected
  /// resources of this type are included in the protection group. Newly
  /// protected resources of this type are automatically added to the group. You
  /// must set this when you set <code>Pattern</code> to
  /// <code>BY_RESOURCE_TYPE</code> and you must not set it for any other
  /// <code>Pattern</code> setting.
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the protection group.
  Future<void> createProtectionGroup({
    required ProtectionGroupAggregation aggregation,
    required ProtectionGroupPattern pattern,
    required String protectionGroupId,
    List<String>? members,
    ProtectedResourceType? resourceType,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.CreateProtectionGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aggregation': aggregation.toValue(),
        'Pattern': pattern.toValue(),
        'ProtectionGroupId': protectionGroupId,
        if (members != null) 'Members': members,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Activates Shield Advanced for an account.
  /// <note>
  /// For accounts that are members of an Organizations organization, Shield
  /// Advanced subscriptions are billed against the organization's payer
  /// account, regardless of whether the payer account itself is subscribed.
  /// </note>
  /// When you initially create a subscription, your subscription is set to be
  /// automatically renewed at the end of the existing subscription period. You
  /// can change this by submitting an <code>UpdateSubscription</code> request.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceAlreadyExistsException].
  Future<void> createSubscription() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.CreateSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Deletes an Shield Advanced <a>Protection</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to be deleted.
  Future<void> deleteProtection({
    required String protectionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DeleteProtection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectionId': protectionId,
      },
    );
  }

  /// Removes the specified protection group.
  ///
  /// May throw [InternalErrorException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [protectionGroupId] :
  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  Future<void> deleteProtectionGroup({
    required String protectionGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DeleteProtectionGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectionGroupId': protectionGroupId,
      },
    );
  }

  /// Removes Shield Advanced from an account. Shield Advanced requires a 1-year
  /// subscription commitment. You cannot delete a subscription prior to the
  /// completion of that commitment.
  ///
  /// May throw [InternalErrorException].
  /// May throw [LockedSubscriptionException].
  /// May throw [ResourceNotFoundException].
  @Deprecated('Deprecated')
  Future<void> deleteSubscription() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DeleteSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Describes the details of a DDoS attack.
  ///
  /// May throw [InternalErrorException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [attackId] :
  /// The unique identifier (ID) for the attack.
  Future<DescribeAttackResponse> describeAttack({
    required String attackId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeAttack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttackId': attackId,
      },
    );

    return DescribeAttackResponse.fromJson(jsonResponse.body);
  }

  /// Provides information about the number and type of attacks Shield has
  /// detected in the last year for all resources that belong to your account,
  /// regardless of whether you've defined Shield protections for them. This
  /// operation is available to Shield customers as well as to Shield Advanced
  /// customers.
  ///
  /// The operation returns data for the time range of midnight UTC, one year
  /// ago, to midnight UTC, today. For example, if the current time is
  /// <code>2020-10-26 15:39:32 PDT</code>, equal to <code>2020-10-26 22:39:32
  /// UTC</code>, then the time range for the attack data returned is from
  /// <code>2019-10-26 00:00:00 UTC</code> to <code>2020-10-26 00:00:00
  /// UTC</code>.
  ///
  /// The time range indicates the period covered by the attack statistics data
  /// items.
  ///
  /// May throw [InternalErrorException].
  Future<DescribeAttackStatisticsResponse> describeAttackStatistics() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeAttackStatistics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeAttackStatisticsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the current role and list of Amazon S3 log buckets used by the
  /// Shield Response Team (SRT) to access your Amazon Web Services account
  /// while assisting with attack mitigation.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeDRTAccessResponse> describeDRTAccess() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeDRTAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeDRTAccessResponse.fromJson(jsonResponse.body);
  }

  /// A list of email addresses and phone numbers that the Shield Response Team
  /// (SRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the SRT and to initiate proactive customer support.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeEmergencyContactSettingsResponse>
      describeEmergencyContactSettings() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeEmergencyContactSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeEmergencyContactSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the details of a <a>Protection</a> object.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to describe.
  /// You must provide either the <code>ResourceArn</code> of the protected
  /// resource or the <code>ProtectionID</code> of the protection, but not both.
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the protected Amazon Web Services
  /// resource. You must provide either the <code>ResourceArn</code> of the
  /// protected resource or the <code>ProtectionID</code> of the protection, but
  /// not both.
  Future<DescribeProtectionResponse> describeProtection({
    String? protectionId,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (protectionId != null) 'ProtectionId': protectionId,
        if (resourceArn != null) 'ResourceArn': resourceArn,
      },
    );

    return DescribeProtectionResponse.fromJson(jsonResponse.body);
  }

  /// Returns the specification for the specified protection group.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [protectionGroupId] :
  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  Future<DescribeProtectionGroupResponse> describeProtectionGroup({
    required String protectionGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeProtectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectionGroupId': protectionGroupId,
      },
    );

    return DescribeProtectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Provides details about the Shield Advanced subscription for an account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeSubscriptionResponse> describeSubscription() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DescribeSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Disable the Shield Advanced automatic application layer DDoS mitigation
  /// feature for the protected resource. This stops Shield Advanced from
  /// creating, verifying, and applying WAF rules for attacks that it detects
  /// for the resource.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the protected resource.
  Future<void> disableApplicationLayerAutomaticResponse({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSShield_20160616.DisableApplicationLayerAutomaticResponse'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Removes authorization from the Shield Response Team (SRT) to notify
  /// contacts about escalations to the SRT and to initiate proactive customer
  /// support.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  Future<void> disableProactiveEngagement() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisableProactiveEngagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Removes the Shield Response Team's (SRT) access to the specified Amazon S3
  /// bucket containing the logs that you shared previously.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [NoAssociatedRoleException].
  /// May throw [AccessDeniedForDependencyException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logBucket] :
  /// The Amazon S3 bucket that contains the logs that you want to share.
  Future<void> disassociateDRTLogBucket({
    required String logBucket,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisassociateDRTLogBucket'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LogBucket': logBucket,
      },
    );
  }

  /// Removes the Shield Response Team's (SRT) access to your Amazon Web
  /// Services account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  Future<void> disassociateDRTRole() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisassociateDRTRole'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Removes health-based detection from the Shield Advanced protection for a
  /// resource. Shield Advanced health-based detection uses the health of your
  /// Amazon Web Services resource to improve responsiveness and accuracy in
  /// attack detection and response.
  ///
  /// You define the health check in Route 53 and then associate or disassociate
  /// it with your Shield Advanced protection. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield
  /// Advanced Health-Based Detection</a> in the <i>WAF Developer Guide</i>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [healthCheckArn] :
  /// The Amazon Resource Name (ARN) of the health check that is associated with
  /// the protection.
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to remove the
  /// health check association from.
  Future<void> disassociateHealthCheck({
    required String healthCheckArn,
    required String protectionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisassociateHealthCheck'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HealthCheckArn': healthCheckArn,
        'ProtectionId': protectionId,
      },
    );
  }

  /// Enable the Shield Advanced automatic application layer DDoS mitigation for
  /// the protected resource.
  /// <note>
  /// This feature is available for Amazon CloudFront distributions and
  /// Application Load Balancers only.
  /// </note>
  /// This causes Shield Advanced to create, verify, and apply WAF rules for
  /// DDoS attacks that it detects for the resource. Shield Advanced applies the
  /// rules in a Shield rule group inside the web ACL that you've associated
  /// with the resource. For information about how automatic mitigation works
  /// and the requirements for using it, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-automatic-app-layer-response.html">Shield
  /// Advanced automatic application layer DDoS mitigation</a>.
  /// <note>
  /// Don't use this action to make changes to automatic mitigation settings
  /// when it's already enabled for a resource. Instead, use
  /// <a>UpdateApplicationLayerAutomaticResponse</a>.
  /// </note>
  /// To use this feature, you must associate a web ACL with the protected
  /// resource. The web ACL must be created using the latest version of WAF
  /// (v2). You can associate the web ACL through the Shield Advanced console at
  /// <a
  /// href="https://console.aws.amazon.com/wafv2/shieldv2#/">https://console.aws.amazon.com/wafv2/shieldv2#/</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html">Getting
  /// Started with Shield Advanced</a>. You can also associate the web ACL to
  /// the resource through the WAF console or the WAF API, but you must manage
  /// Shield Advanced automatic mitigation through Shield Advanced. For
  /// information about WAF, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">WAF
  /// Developer Guide</a>.
  ///
  /// May throw [LimitsExceededException].
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [action] :
  /// Specifies the action setting that Shield Advanced should use in the WAF
  /// rules that it creates on behalf of the protected resource in response to
  /// DDoS attacks. You specify this as part of the configuration for the
  /// automatic application layer DDoS mitigation feature, when you enable or
  /// update automatic mitigation. Shield Advanced creates the WAF rules in a
  /// Shield Advanced-managed rule group, inside the web ACL that you have
  /// associated with the resource.
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the protected resource.
  Future<void> enableApplicationLayerAutomaticResponse({
    required ResponseAction action,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSShield_20160616.EnableApplicationLayerAutomaticResponse'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action,
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Authorizes the Shield Response Team (SRT) to use email and phone to notify
  /// contacts about escalations to the SRT and to initiate proactive customer
  /// support.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  Future<void> enableProactiveEngagement() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.EnableProactiveEngagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Returns the <code>SubscriptionState</code>, either <code>Active</code> or
  /// <code>Inactive</code>.
  ///
  /// May throw [InternalErrorException].
  Future<GetSubscriptionStateResponse> getSubscriptionState() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.GetSubscriptionState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetSubscriptionStateResponse.fromJson(jsonResponse.body);
  }

  /// Returns all ongoing DDoS attacks or all DDoS attacks during a specified
  /// time period.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for the attacks. This is a
  /// <code>timestamp</code> type. The request syntax listing for this call
  /// indicates a <code>number</code> type, but you can provide the time in any
  /// valid <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp">timestamp
  /// format</a> setting.
  ///
  /// Parameter [maxResults] :
  /// The greatest number of objects that you want Shield Advanced to return to
  /// the list request. Shield Advanced might return fewer objects than you
  /// indicate in this setting, even if more objects are available. If there are
  /// more objects remaining, Shield Advanced will always also return a
  /// <code>NextToken</code> value in the response.
  ///
  /// The default setting is 20.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield
  /// Advanced to return for a single call with the <code>MaxResults</code>
  /// setting. Shield Advanced will not return more than <code>MaxResults</code>
  /// objects, but may return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  ///
  /// On your first call to a list operation, leave this setting empty.
  ///
  /// Parameter [resourceArns] :
  /// The ARNs (Amazon Resource Names) of the resources that were attacked. If
  /// you leave this blank, all applicable resources for this account will be
  /// included.
  ///
  /// Parameter [startTime] :
  /// The start of the time period for the attacks. This is a
  /// <code>timestamp</code> type. The request syntax listing for this call
  /// indicates a <code>number</code> type, but you can provide the time in any
  /// valid <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp">timestamp
  /// format</a> setting.
  Future<ListAttacksResponse> listAttacks({
    TimeRange? endTime,
    int? maxResults,
    String? nextToken,
    List<String>? resourceArns,
    TimeRange? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.ListAttacks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'EndTime': endTime,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceArns != null) 'ResourceArns': resourceArns,
        if (startTime != null) 'StartTime': startTime,
      },
    );

    return ListAttacksResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves <a>ProtectionGroup</a> objects for the account. You can retrieve
  /// all protection groups or you can provide filtering criteria and retrieve
  /// just the subset of protection groups that match the criteria.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [inclusionFilters] :
  /// Narrows the set of protection groups that the call retrieves. You can
  /// retrieve a single protection group by its name and you can retrieve all
  /// protection groups that are configured with specific pattern or aggregation
  /// settings. You can provide up to one criteria per filter type. Shield
  /// Advanced returns the protection groups that exactly match all of the
  /// search criteria that you provide.
  ///
  /// Parameter [maxResults] :
  /// The greatest number of objects that you want Shield Advanced to return to
  /// the list request. Shield Advanced might return fewer objects than you
  /// indicate in this setting, even if more objects are available. If there are
  /// more objects remaining, Shield Advanced will always also return a
  /// <code>NextToken</code> value in the response.
  ///
  /// The default setting is 20.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield
  /// Advanced to return for a single call with the <code>MaxResults</code>
  /// setting. Shield Advanced will not return more than <code>MaxResults</code>
  /// objects, but may return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  ///
  /// On your first call to a list operation, leave this setting empty.
  Future<ListProtectionGroupsResponse> listProtectionGroups({
    InclusionProtectionGroupFilters? inclusionFilters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.ListProtectionGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (inclusionFilters != null) 'InclusionFilters': inclusionFilters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProtectionGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves <a>Protection</a> objects for the account. You can retrieve all
  /// protections or you can provide filtering criteria and retrieve just the
  /// subset of protections that match the criteria.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [inclusionFilters] :
  /// Narrows the set of protections that the call retrieves. You can retrieve a
  /// single protection by providing its name or the ARN (Amazon Resource Name)
  /// of its protected resource. You can also retrieve all protections for a
  /// specific resource type. You can provide up to one criteria per filter
  /// type. Shield Advanced returns protections that exactly match all of the
  /// filter criteria that you provide.
  ///
  /// Parameter [maxResults] :
  /// The greatest number of objects that you want Shield Advanced to return to
  /// the list request. Shield Advanced might return fewer objects than you
  /// indicate in this setting, even if more objects are available. If there are
  /// more objects remaining, Shield Advanced will always also return a
  /// <code>NextToken</code> value in the response.
  ///
  /// The default setting is 20.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield
  /// Advanced to return for a single call with the <code>MaxResults</code>
  /// setting. Shield Advanced will not return more than <code>MaxResults</code>
  /// objects, but may return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  ///
  /// On your first call to a list operation, leave this setting empty.
  Future<ListProtectionsResponse> listProtections({
    InclusionProtectionFilters? inclusionFilters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.ListProtections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (inclusionFilters != null) 'InclusionFilters': inclusionFilters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProtectionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the resources that are included in the protection group.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [protectionGroupId] :
  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  ///
  /// Parameter [maxResults] :
  /// The greatest number of objects that you want Shield Advanced to return to
  /// the list request. Shield Advanced might return fewer objects than you
  /// indicate in this setting, even if more objects are available. If there are
  /// more objects remaining, Shield Advanced will always also return a
  /// <code>NextToken</code> value in the response.
  ///
  /// The default setting is 20.
  ///
  /// Parameter [nextToken] :
  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield
  /// Advanced to return for a single call with the <code>MaxResults</code>
  /// setting. Shield Advanced will not return more than <code>MaxResults</code>
  /// objects, but may return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  ///
  /// On your first call to a list operation, leave this setting empty.
  Future<ListResourcesInProtectionGroupResponse>
      listResourcesInProtectionGroup({
    required String protectionGroupId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.ListResourcesInProtectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectionGroupId': protectionGroupId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourcesInProtectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about Amazon Web Services tags for a specified Amazon
  /// Resource Name (ARN) in Shield.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidResourceException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to get tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for a resource in Shield.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add or
  /// update tags for.
  ///
  /// Parameter [tags] :
  /// The tags that you want to modify or add to the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from a resource in Shield.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag key for each tag that you want to remove from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates an existing Shield Advanced automatic application layer DDoS
  /// mitigation configuration for the specified resource.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [action] :
  /// Specifies the action setting that Shield Advanced should use in the WAF
  /// rules that it creates on behalf of the protected resource in response to
  /// DDoS attacks. You specify this as part of the configuration for the
  /// automatic application layer DDoS mitigation feature, when you enable or
  /// update automatic mitigation. Shield Advanced creates the WAF rules in a
  /// Shield Advanced-managed rule group, inside the web ACL that you have
  /// associated with the resource.
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the resource.
  Future<void> updateApplicationLayerAutomaticResponse({
    required ResponseAction action,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSShield_20160616.UpdateApplicationLayerAutomaticResponse'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action,
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Updates the details of the list of email addresses and phone numbers that
  /// the Shield Response Team (SRT) can use to contact you if you have
  /// proactive engagement enabled, for escalations to the SRT and to initiate
  /// proactive customer support.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [emergencyContactList] :
  /// A list of email addresses and phone numbers that the Shield Response Team
  /// (SRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the SRT and to initiate proactive customer support.
  ///
  /// If you have proactive engagement enabled, the contact list must include at
  /// least one phone number.
  Future<void> updateEmergencyContactSettings({
    List<EmergencyContact>? emergencyContactList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateEmergencyContactSettings'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (emergencyContactList != null)
          'EmergencyContactList': emergencyContactList,
      },
    );
  }

  /// Updates an existing protection group. A protection group is a grouping of
  /// protected resources so they can be handled as a collective. This resource
  /// grouping improves the accuracy of detection and reduces false positives.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [aggregation] :
  /// Defines how Shield combines resource data for the group in order to
  /// detect, mitigate, and report events.
  ///
  /// <ul>
  /// <li>
  /// Sum - Use the total traffic across the group. This is a good choice for
  /// most cases. Examples include Elastic IP addresses for EC2 instances that
  /// scale manually or automatically.
  /// </li>
  /// <li>
  /// Mean - Use the average of the traffic across the group. This is a good
  /// choice for resources that share traffic uniformly. Examples include
  /// accelerators and load balancers.
  /// </li>
  /// <li>
  /// Max - Use the highest traffic from each resource. This is useful for
  /// resources that don't share traffic and for resources that share that
  /// traffic in a non-uniform way. Examples include Amazon CloudFront
  /// distributions and origin resources for CloudFront distributions.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pattern] :
  /// The criteria to use to choose the protected resources for inclusion in the
  /// group. You can include all resources that have protections, provide a list
  /// of resource Amazon Resource Names (ARNs), or include all resources of a
  /// specified resource type.
  ///
  /// Parameter [protectionGroupId] :
  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  ///
  /// Parameter [members] :
  /// The Amazon Resource Names (ARNs) of the resources to include in the
  /// protection group. You must set this when you set <code>Pattern</code> to
  /// <code>ARBITRARY</code> and you must not set it for any other
  /// <code>Pattern</code> setting.
  ///
  /// Parameter [resourceType] :
  /// The resource type to include in the protection group. All protected
  /// resources of this type are included in the protection group. You must set
  /// this when you set <code>Pattern</code> to <code>BY_RESOURCE_TYPE</code>
  /// and you must not set it for any other <code>Pattern</code> setting.
  Future<void> updateProtectionGroup({
    required ProtectionGroupAggregation aggregation,
    required ProtectionGroupPattern pattern,
    required String protectionGroupId,
    List<String>? members,
    ProtectedResourceType? resourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateProtectionGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aggregation': aggregation.toValue(),
        'Pattern': pattern.toValue(),
        'ProtectionGroupId': protectionGroupId,
        if (members != null) 'Members': members,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );
  }

  /// Updates the details of an existing subscription. Only enter values for
  /// parameters you want to change. Empty parameters are not updated.
  /// <note>
  /// For accounts that are members of an Organizations organization, Shield
  /// Advanced subscriptions are billed against the organization's payer
  /// account, regardless of whether the payer account itself is subscribed.
  /// </note>
  ///
  /// May throw [InternalErrorException].
  /// May throw [LockedSubscriptionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [autoRenew] :
  /// When you initally create a subscription, <code>AutoRenew</code> is set to
  /// <code>ENABLED</code>. If <code>ENABLED</code>, the subscription will be
  /// automatically renewed at the end of the existing subscription period. You
  /// can change this by submitting an <code>UpdateSubscription</code> request.
  /// If the <code>UpdateSubscription</code> request does not included a value
  /// for <code>AutoRenew</code>, the existing value for <code>AutoRenew</code>
  /// remains unchanged.
  Future<void> updateSubscription({
    AutoRenew? autoRenew,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (autoRenew != null) 'AutoRenew': autoRenew.toValue(),
      },
    );
  }
}

/// The automatic application layer DDoS mitigation settings for a
/// <a>Protection</a>. This configuration determines whether Shield Advanced
/// automatically manages rules in the web ACL in order to respond to
/// application layer events that Shield Advanced determines to be DDoS attacks.
class ApplicationLayerAutomaticResponseConfiguration {
  /// Specifies the action setting that Shield Advanced should use in the WAF
  /// rules that it creates on behalf of the protected resource in response to
  /// DDoS attacks. You specify this as part of the configuration for the
  /// automatic application layer DDoS mitigation feature, when you enable or
  /// update automatic mitigation. Shield Advanced creates the WAF rules in a
  /// Shield Advanced-managed rule group, inside the web ACL that you have
  /// associated with the resource.
  final ResponseAction action;

  /// Indicates whether automatic application layer DDoS mitigation is enabled for
  /// the protection.
  final ApplicationLayerAutomaticResponseStatus status;

  ApplicationLayerAutomaticResponseConfiguration({
    required this.action,
    required this.status,
  });

  factory ApplicationLayerAutomaticResponseConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ApplicationLayerAutomaticResponseConfiguration(
      action: ResponseAction.fromJson(json['Action'] as Map<String, dynamic>),
      status: (json['Status'] as String)
          .toApplicationLayerAutomaticResponseStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final status = this.status;
    return {
      'Action': action,
      'Status': status.toValue(),
    };
  }
}

enum ApplicationLayerAutomaticResponseStatus {
  enabled,
  disabled,
}

extension ApplicationLayerAutomaticResponseStatusValueExtension
    on ApplicationLayerAutomaticResponseStatus {
  String toValue() {
    switch (this) {
      case ApplicationLayerAutomaticResponseStatus.enabled:
        return 'ENABLED';
      case ApplicationLayerAutomaticResponseStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ApplicationLayerAutomaticResponseStatusFromString on String {
  ApplicationLayerAutomaticResponseStatus
      toApplicationLayerAutomaticResponseStatus() {
    switch (this) {
      case 'ENABLED':
        return ApplicationLayerAutomaticResponseStatus.enabled;
      case 'DISABLED':
        return ApplicationLayerAutomaticResponseStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum ApplicationLayerAutomaticResponseStatus');
  }
}

class AssociateDRTLogBucketResponse {
  AssociateDRTLogBucketResponse();

  factory AssociateDRTLogBucketResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDRTLogBucketResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateDRTRoleResponse {
  AssociateDRTRoleResponse();

  factory AssociateDRTRoleResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDRTRoleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateHealthCheckResponse {
  AssociateHealthCheckResponse();

  factory AssociateHealthCheckResponse.fromJson(Map<String, dynamic> _) {
    return AssociateHealthCheckResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateProactiveEngagementDetailsResponse {
  AssociateProactiveEngagementDetailsResponse();

  factory AssociateProactiveEngagementDetailsResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateProactiveEngagementDetailsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The details of a DDoS attack.
class AttackDetail {
  /// List of counters that describe the attack for the specified time period.
  final List<SummarizedCounter>? attackCounters;

  /// The unique identifier (ID) of the attack.
  final String? attackId;

  /// The array of objects that provide details of the Shield event.
  ///
  /// For infrastructure layer events (L3 and L4 events), you can view metrics for
  /// top contributors in Amazon CloudWatch metrics. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms">Shield
  /// metrics and alarms</a> in the <i>WAF Developer Guide</i>.
  final List<AttackProperty>? attackProperties;

  /// The time the attack ended, in Unix time in seconds.
  final DateTime? endTime;

  /// List of mitigation actions taken for the attack.
  final List<Mitigation>? mitigations;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  final String? resourceArn;

  /// The time the attack started, in Unix time in seconds.
  final DateTime? startTime;

  /// If applicable, additional detail about the resource being attacked, for
  /// example, IP address or URL.
  final List<SubResourceSummary>? subResources;

  AttackDetail({
    this.attackCounters,
    this.attackId,
    this.attackProperties,
    this.endTime,
    this.mitigations,
    this.resourceArn,
    this.startTime,
    this.subResources,
  });

  factory AttackDetail.fromJson(Map<String, dynamic> json) {
    return AttackDetail(
      attackCounters: (json['AttackCounters'] as List?)
          ?.whereNotNull()
          .map((e) => SummarizedCounter.fromJson(e as Map<String, dynamic>))
          .toList(),
      attackId: json['AttackId'] as String?,
      attackProperties: (json['AttackProperties'] as List?)
          ?.whereNotNull()
          .map((e) => AttackProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['EndTime']),
      mitigations: (json['Mitigations'] as List?)
          ?.whereNotNull()
          .map((e) => Mitigation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceArn: json['ResourceArn'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      subResources: (json['SubResources'] as List?)
          ?.whereNotNull()
          .map((e) => SubResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attackCounters = this.attackCounters;
    final attackId = this.attackId;
    final attackProperties = this.attackProperties;
    final endTime = this.endTime;
    final mitigations = this.mitigations;
    final resourceArn = this.resourceArn;
    final startTime = this.startTime;
    final subResources = this.subResources;
    return {
      if (attackCounters != null) 'AttackCounters': attackCounters,
      if (attackId != null) 'AttackId': attackId,
      if (attackProperties != null) 'AttackProperties': attackProperties,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (mitigations != null) 'Mitigations': mitigations,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (subResources != null) 'SubResources': subResources,
    };
  }
}

enum AttackLayer {
  network,
  application,
}

extension AttackLayerValueExtension on AttackLayer {
  String toValue() {
    switch (this) {
      case AttackLayer.network:
        return 'NETWORK';
      case AttackLayer.application:
        return 'APPLICATION';
    }
  }
}

extension AttackLayerFromString on String {
  AttackLayer toAttackLayer() {
    switch (this) {
      case 'NETWORK':
        return AttackLayer.network;
      case 'APPLICATION':
        return AttackLayer.application;
    }
    throw Exception('$this is not known in enum AttackLayer');
  }
}

/// Details of a Shield event. This is provided as part of an
/// <a>AttackDetail</a>.
class AttackProperty {
  /// The type of Shield event that was observed. <code>NETWORK</code> indicates
  /// layer 3 and layer 4 events and <code>APPLICATION</code> indicates layer 7
  /// events.
  ///
  /// For infrastructure layer events (L3 and L4 events), you can view metrics for
  /// top contributors in Amazon CloudWatch metrics. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms">Shield
  /// metrics and alarms</a> in the <i>WAF Developer Guide</i>.
  final AttackLayer? attackLayer;

  /// Defines the Shield event property information that is provided. The
  /// <code>WORDPRESS_PINGBACK_REFLECTOR</code> and
  /// <code>WORDPRESS_PINGBACK_SOURCE</code> values are valid only for WordPress
  /// reflective pingback events.
  final AttackPropertyIdentifier? attackPropertyIdentifier;

  /// Contributor objects for the top five contributors to a Shield event. A
  /// contributor is a source of traffic that Shield Advanced identifies as
  /// responsible for some or all of an event.
  final List<Contributor>? topContributors;

  /// The total contributions made to this Shield event by all contributors.
  final int? total;

  /// The unit used for the <code>Contributor</code> <code>Value</code> property.
  final Unit? unit;

  AttackProperty({
    this.attackLayer,
    this.attackPropertyIdentifier,
    this.topContributors,
    this.total,
    this.unit,
  });

  factory AttackProperty.fromJson(Map<String, dynamic> json) {
    return AttackProperty(
      attackLayer: (json['AttackLayer'] as String?)?.toAttackLayer(),
      attackPropertyIdentifier: (json['AttackPropertyIdentifier'] as String?)
          ?.toAttackPropertyIdentifier(),
      topContributors: (json['TopContributors'] as List?)
          ?.whereNotNull()
          .map((e) => Contributor.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['Total'] as int?,
      unit: (json['Unit'] as String?)?.toUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final attackLayer = this.attackLayer;
    final attackPropertyIdentifier = this.attackPropertyIdentifier;
    final topContributors = this.topContributors;
    final total = this.total;
    final unit = this.unit;
    return {
      if (attackLayer != null) 'AttackLayer': attackLayer.toValue(),
      if (attackPropertyIdentifier != null)
        'AttackPropertyIdentifier': attackPropertyIdentifier.toValue(),
      if (topContributors != null) 'TopContributors': topContributors,
      if (total != null) 'Total': total,
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

enum AttackPropertyIdentifier {
  destinationUrl,
  referrer,
  sourceAsn,
  sourceCountry,
  sourceIpAddress,
  sourceUserAgent,
  wordpressPingbackReflector,
  wordpressPingbackSource,
}

extension AttackPropertyIdentifierValueExtension on AttackPropertyIdentifier {
  String toValue() {
    switch (this) {
      case AttackPropertyIdentifier.destinationUrl:
        return 'DESTINATION_URL';
      case AttackPropertyIdentifier.referrer:
        return 'REFERRER';
      case AttackPropertyIdentifier.sourceAsn:
        return 'SOURCE_ASN';
      case AttackPropertyIdentifier.sourceCountry:
        return 'SOURCE_COUNTRY';
      case AttackPropertyIdentifier.sourceIpAddress:
        return 'SOURCE_IP_ADDRESS';
      case AttackPropertyIdentifier.sourceUserAgent:
        return 'SOURCE_USER_AGENT';
      case AttackPropertyIdentifier.wordpressPingbackReflector:
        return 'WORDPRESS_PINGBACK_REFLECTOR';
      case AttackPropertyIdentifier.wordpressPingbackSource:
        return 'WORDPRESS_PINGBACK_SOURCE';
    }
  }
}

extension AttackPropertyIdentifierFromString on String {
  AttackPropertyIdentifier toAttackPropertyIdentifier() {
    switch (this) {
      case 'DESTINATION_URL':
        return AttackPropertyIdentifier.destinationUrl;
      case 'REFERRER':
        return AttackPropertyIdentifier.referrer;
      case 'SOURCE_ASN':
        return AttackPropertyIdentifier.sourceAsn;
      case 'SOURCE_COUNTRY':
        return AttackPropertyIdentifier.sourceCountry;
      case 'SOURCE_IP_ADDRESS':
        return AttackPropertyIdentifier.sourceIpAddress;
      case 'SOURCE_USER_AGENT':
        return AttackPropertyIdentifier.sourceUserAgent;
      case 'WORDPRESS_PINGBACK_REFLECTOR':
        return AttackPropertyIdentifier.wordpressPingbackReflector;
      case 'WORDPRESS_PINGBACK_SOURCE':
        return AttackPropertyIdentifier.wordpressPingbackSource;
    }
    throw Exception('$this is not known in enum AttackPropertyIdentifier');
  }
}

/// A single attack statistics data record. This is returned by
/// <a>DescribeAttackStatistics</a> along with a time range indicating the time
/// period that the attack statistics apply to.
class AttackStatisticsDataItem {
  /// The number of attacks detected during the time period. This is always
  /// present, but might be zero.
  final int attackCount;

  /// Information about the volume of attacks during the time period. If the
  /// accompanying <code>AttackCount</code> is zero, this setting might be empty.
  final AttackVolume? attackVolume;

  AttackStatisticsDataItem({
    required this.attackCount,
    this.attackVolume,
  });

  factory AttackStatisticsDataItem.fromJson(Map<String, dynamic> json) {
    return AttackStatisticsDataItem(
      attackCount: json['AttackCount'] as int,
      attackVolume: json['AttackVolume'] != null
          ? AttackVolume.fromJson(json['AttackVolume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attackCount = this.attackCount;
    final attackVolume = this.attackVolume;
    return {
      'AttackCount': attackCount,
      if (attackVolume != null) 'AttackVolume': attackVolume,
    };
  }
}

/// Summarizes all DDoS attacks for a specified time period.
class AttackSummary {
  /// The unique identifier (ID) of the attack.
  final String? attackId;

  /// The list of attacks for a specified time period.
  final List<AttackVectorDescription>? attackVectors;

  /// The end time of the attack, in Unix time in seconds.
  final DateTime? endTime;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  final String? resourceArn;

  /// The start time of the attack, in Unix time in seconds.
  final DateTime? startTime;

  AttackSummary({
    this.attackId,
    this.attackVectors,
    this.endTime,
    this.resourceArn,
    this.startTime,
  });

  factory AttackSummary.fromJson(Map<String, dynamic> json) {
    return AttackSummary(
      attackId: json['AttackId'] as String?,
      attackVectors: (json['AttackVectors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AttackVectorDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['EndTime']),
      resourceArn: json['ResourceArn'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final attackId = this.attackId;
    final attackVectors = this.attackVectors;
    final endTime = this.endTime;
    final resourceArn = this.resourceArn;
    final startTime = this.startTime;
    return {
      if (attackId != null) 'AttackId': attackId,
      if (attackVectors != null) 'AttackVectors': attackVectors,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// Describes the attack.
class AttackVectorDescription {
  /// The attack type. Valid values:
  ///
  /// <ul>
  /// <li>
  /// UDP_TRAFFIC
  /// </li>
  /// <li>
  /// UDP_FRAGMENT
  /// </li>
  /// <li>
  /// GENERIC_UDP_REFLECTION
  /// </li>
  /// <li>
  /// DNS_REFLECTION
  /// </li>
  /// <li>
  /// NTP_REFLECTION
  /// </li>
  /// <li>
  /// CHARGEN_REFLECTION
  /// </li>
  /// <li>
  /// SSDP_REFLECTION
  /// </li>
  /// <li>
  /// PORT_MAPPER
  /// </li>
  /// <li>
  /// RIP_REFLECTION
  /// </li>
  /// <li>
  /// SNMP_REFLECTION
  /// </li>
  /// <li>
  /// MSSQL_REFLECTION
  /// </li>
  /// <li>
  /// NET_BIOS_REFLECTION
  /// </li>
  /// <li>
  /// SYN_FLOOD
  /// </li>
  /// <li>
  /// ACK_FLOOD
  /// </li>
  /// <li>
  /// REQUEST_FLOOD
  /// </li>
  /// <li>
  /// HTTP_REFLECTION
  /// </li>
  /// <li>
  /// UDS_REFLECTION
  /// </li>
  /// <li>
  /// MEMCACHED_REFLECTION
  /// </li>
  /// </ul>
  final String vectorType;

  AttackVectorDescription({
    required this.vectorType,
  });

  factory AttackVectorDescription.fromJson(Map<String, dynamic> json) {
    return AttackVectorDescription(
      vectorType: json['VectorType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final vectorType = this.vectorType;
    return {
      'VectorType': vectorType,
    };
  }
}

/// Information about the volume of attacks during the time period, included in
/// an <a>AttackStatisticsDataItem</a>. If the accompanying
/// <code>AttackCount</code> in the statistics object is zero, this setting
/// might be empty.
class AttackVolume {
  /// A statistics object that uses bits per second as the unit. This is included
  /// for network level attacks.
  final AttackVolumeStatistics? bitsPerSecond;

  /// A statistics object that uses packets per second as the unit. This is
  /// included for network level attacks.
  final AttackVolumeStatistics? packetsPerSecond;

  /// A statistics object that uses requests per second as the unit. This is
  /// included for application level attacks, and is only available for accounts
  /// that are subscribed to Shield Advanced.
  final AttackVolumeStatistics? requestsPerSecond;

  AttackVolume({
    this.bitsPerSecond,
    this.packetsPerSecond,
    this.requestsPerSecond,
  });

  factory AttackVolume.fromJson(Map<String, dynamic> json) {
    return AttackVolume(
      bitsPerSecond: json['BitsPerSecond'] != null
          ? AttackVolumeStatistics.fromJson(
              json['BitsPerSecond'] as Map<String, dynamic>)
          : null,
      packetsPerSecond: json['PacketsPerSecond'] != null
          ? AttackVolumeStatistics.fromJson(
              json['PacketsPerSecond'] as Map<String, dynamic>)
          : null,
      requestsPerSecond: json['RequestsPerSecond'] != null
          ? AttackVolumeStatistics.fromJson(
              json['RequestsPerSecond'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bitsPerSecond = this.bitsPerSecond;
    final packetsPerSecond = this.packetsPerSecond;
    final requestsPerSecond = this.requestsPerSecond;
    return {
      if (bitsPerSecond != null) 'BitsPerSecond': bitsPerSecond,
      if (packetsPerSecond != null) 'PacketsPerSecond': packetsPerSecond,
      if (requestsPerSecond != null) 'RequestsPerSecond': requestsPerSecond,
    };
  }
}

/// Statistics objects for the various data types in <a>AttackVolume</a>.
class AttackVolumeStatistics {
  /// The maximum attack volume observed for the given unit.
  final double max;

  AttackVolumeStatistics({
    required this.max,
  });

  factory AttackVolumeStatistics.fromJson(Map<String, dynamic> json) {
    return AttackVolumeStatistics(
      max: json['Max'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    return {
      'Max': max,
    };
  }
}

enum AutoRenew {
  enabled,
  disabled,
}

extension AutoRenewValueExtension on AutoRenew {
  String toValue() {
    switch (this) {
      case AutoRenew.enabled:
        return 'ENABLED';
      case AutoRenew.disabled:
        return 'DISABLED';
    }
  }
}

extension AutoRenewFromString on String {
  AutoRenew toAutoRenew() {
    switch (this) {
      case 'ENABLED':
        return AutoRenew.enabled;
      case 'DISABLED':
        return AutoRenew.disabled;
    }
    throw Exception('$this is not known in enum AutoRenew');
  }
}

/// Specifies that Shield Advanced should configure its WAF rules with the WAF
/// <code>Block</code> action.
///
/// This is only used in the context of the <code>ResponseAction</code> setting.
///
/// JSON specification: <code>"Block": {}</code>
class BlockAction {
  BlockAction();

  factory BlockAction.fromJson(Map<String, dynamic> _) {
    return BlockAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A contributor to the attack and their contribution.
class Contributor {
  /// The name of the contributor. The type of name that you'll find here depends
  /// on the <code>AttackPropertyIdentifier</code> setting in the
  /// <code>AttackProperty</code> where this contributor is defined. For example,
  /// if the <code>AttackPropertyIdentifier</code> is <code>SOURCE_COUNTRY</code>,
  /// the <code>Name</code> could be <code>United States</code>.
  final String? name;

  /// The contribution of this contributor expressed in <a>Protection</a> units.
  /// For example <code>10,000</code>.
  final int? value;

  Contributor({
    this.name,
    this.value,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) {
    return Contributor(
      name: json['Name'] as String?,
      value: json['Value'] as int?,
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

/// Specifies that Shield Advanced should configure its WAF rules with the WAF
/// <code>Count</code> action.
///
/// This is only used in the context of the <code>ResponseAction</code> setting.
///
/// JSON specification: <code>"Count": {}</code>
class CountAction {
  CountAction();

  factory CountAction.fromJson(Map<String, dynamic> _) {
    return CountAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateProtectionGroupResponse {
  CreateProtectionGroupResponse();

  factory CreateProtectionGroupResponse.fromJson(Map<String, dynamic> _) {
    return CreateProtectionGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateProtectionResponse {
  /// The unique identifier (ID) for the <a>Protection</a> object that is created.
  final String? protectionId;

  CreateProtectionResponse({
    this.protectionId,
  });

  factory CreateProtectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateProtectionResponse(
      protectionId: json['ProtectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protectionId = this.protectionId;
    return {
      if (protectionId != null) 'ProtectionId': protectionId,
    };
  }
}

class CreateSubscriptionResponse {
  CreateSubscriptionResponse();

  factory CreateSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return CreateSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProtectionGroupResponse {
  DeleteProtectionGroupResponse();

  factory DeleteProtectionGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProtectionGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProtectionResponse {
  DeleteProtectionResponse();

  factory DeleteProtectionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProtectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

@Deprecated('Deprecated')
class DeleteSubscriptionResponse {
  DeleteSubscriptionResponse();

  factory DeleteSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAttackResponse {
  /// The attack that you requested.
  final AttackDetail? attack;

  DescribeAttackResponse({
    this.attack,
  });

  factory DescribeAttackResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAttackResponse(
      attack: json['Attack'] != null
          ? AttackDetail.fromJson(json['Attack'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attack = this.attack;
    return {
      if (attack != null) 'Attack': attack,
    };
  }
}

class DescribeAttackStatisticsResponse {
  /// The data that describes the attacks detected during the time period.
  final List<AttackStatisticsDataItem> dataItems;

  /// The time range of the attack.
  final TimeRange timeRange;

  DescribeAttackStatisticsResponse({
    required this.dataItems,
    required this.timeRange,
  });

  factory DescribeAttackStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAttackStatisticsResponse(
      dataItems: (json['DataItems'] as List)
          .whereNotNull()
          .map((e) =>
              AttackStatisticsDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeRange: TimeRange.fromJson(json['TimeRange'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dataItems = this.dataItems;
    final timeRange = this.timeRange;
    return {
      'DataItems': dataItems,
      'TimeRange': timeRange,
    };
  }
}

class DescribeDRTAccessResponse {
  /// The list of Amazon S3 buckets accessed by the SRT.
  final List<String>? logBucketList;

  /// The Amazon Resource Name (ARN) of the role the SRT used to access your
  /// Amazon Web Services account.
  final String? roleArn;

  DescribeDRTAccessResponse({
    this.logBucketList,
    this.roleArn,
  });

  factory DescribeDRTAccessResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDRTAccessResponse(
      logBucketList: (json['LogBucketList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logBucketList = this.logBucketList;
    final roleArn = this.roleArn;
    return {
      if (logBucketList != null) 'LogBucketList': logBucketList,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

class DescribeEmergencyContactSettingsResponse {
  /// A list of email addresses and phone numbers that the Shield Response Team
  /// (SRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the SRT and to initiate proactive customer support.
  final List<EmergencyContact>? emergencyContactList;

  DescribeEmergencyContactSettingsResponse({
    this.emergencyContactList,
  });

  factory DescribeEmergencyContactSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEmergencyContactSettingsResponse(
      emergencyContactList: (json['EmergencyContactList'] as List?)
          ?.whereNotNull()
          .map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final emergencyContactList = this.emergencyContactList;
    return {
      if (emergencyContactList != null)
        'EmergencyContactList': emergencyContactList,
    };
  }
}

class DescribeProtectionGroupResponse {
  /// A grouping of protected resources that you and Shield Advanced can monitor
  /// as a collective. This resource grouping improves the accuracy of detection
  /// and reduces false positives.
  final ProtectionGroup protectionGroup;

  DescribeProtectionGroupResponse({
    required this.protectionGroup,
  });

  factory DescribeProtectionGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProtectionGroupResponse(
      protectionGroup: ProtectionGroup.fromJson(
          json['ProtectionGroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protectionGroup = this.protectionGroup;
    return {
      'ProtectionGroup': protectionGroup,
    };
  }
}

class DescribeProtectionResponse {
  /// The <a>Protection</a> that you requested.
  final Protection? protection;

  DescribeProtectionResponse({
    this.protection,
  });

  factory DescribeProtectionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProtectionResponse(
      protection: json['Protection'] != null
          ? Protection.fromJson(json['Protection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final protection = this.protection;
    return {
      if (protection != null) 'Protection': protection,
    };
  }
}

class DescribeSubscriptionResponse {
  /// The Shield Advanced subscription details for an account.
  final Subscription? subscription;

  DescribeSubscriptionResponse({
    this.subscription,
  });

  factory DescribeSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSubscriptionResponse(
      subscription: json['Subscription'] != null
          ? Subscription.fromJson(json['Subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'Subscription': subscription,
    };
  }
}

class DisableApplicationLayerAutomaticResponseResponse {
  DisableApplicationLayerAutomaticResponseResponse();

  factory DisableApplicationLayerAutomaticResponseResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableApplicationLayerAutomaticResponseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableProactiveEngagementResponse {
  DisableProactiveEngagementResponse();

  factory DisableProactiveEngagementResponse.fromJson(Map<String, dynamic> _) {
    return DisableProactiveEngagementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateDRTLogBucketResponse {
  DisassociateDRTLogBucketResponse();

  factory DisassociateDRTLogBucketResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateDRTLogBucketResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateDRTRoleResponse {
  DisassociateDRTRoleResponse();

  factory DisassociateDRTRoleResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateDRTRoleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateHealthCheckResponse {
  DisassociateHealthCheckResponse();

  factory DisassociateHealthCheckResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateHealthCheckResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contact information that the SRT can use to contact you if you have
/// proactive engagement enabled, for escalations to the SRT and to initiate
/// proactive customer support.
class EmergencyContact {
  /// The email address for the contact.
  final String emailAddress;

  /// Additional notes regarding the contact.
  final String? contactNotes;

  /// The phone number for the contact.
  final String? phoneNumber;

  EmergencyContact({
    required this.emailAddress,
    this.contactNotes,
    this.phoneNumber,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      emailAddress: json['EmailAddress'] as String,
      contactNotes: json['ContactNotes'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final contactNotes = this.contactNotes;
    final phoneNumber = this.phoneNumber;
    return {
      'EmailAddress': emailAddress,
      if (contactNotes != null) 'ContactNotes': contactNotes,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class EnableApplicationLayerAutomaticResponseResponse {
  EnableApplicationLayerAutomaticResponseResponse();

  factory EnableApplicationLayerAutomaticResponseResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableApplicationLayerAutomaticResponseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EnableProactiveEngagementResponse {
  EnableProactiveEngagementResponse();

  factory EnableProactiveEngagementResponse.fromJson(Map<String, dynamic> _) {
    return EnableProactiveEngagementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetSubscriptionStateResponse {
  /// The status of the subscription.
  final SubscriptionState subscriptionState;

  GetSubscriptionStateResponse({
    required this.subscriptionState,
  });

  factory GetSubscriptionStateResponse.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionStateResponse(
      subscriptionState:
          (json['SubscriptionState'] as String).toSubscriptionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionState = this.subscriptionState;
    return {
      'SubscriptionState': subscriptionState.toValue(),
    };
  }
}

/// Narrows the set of protections that the call retrieves. You can retrieve a
/// single protection by providing its name or the ARN (Amazon Resource Name) of
/// its protected resource. You can also retrieve all protections for a specific
/// resource type. You can provide up to one criteria per filter type. Shield
/// Advanced returns protections that exactly match all of the filter criteria
/// that you provide.
class InclusionProtectionFilters {
  /// The name of the protection that you want to retrieve.
  final List<String>? protectionNames;

  /// The ARN (Amazon Resource Name) of the resource whose protection you want to
  /// retrieve.
  final List<String>? resourceArns;

  /// The type of protected resource whose protections you want to retrieve.
  final List<ProtectedResourceType>? resourceTypes;

  InclusionProtectionFilters({
    this.protectionNames,
    this.resourceArns,
    this.resourceTypes,
  });

  Map<String, dynamic> toJson() {
    final protectionNames = this.protectionNames;
    final resourceArns = this.resourceArns;
    final resourceTypes = this.resourceTypes;
    return {
      if (protectionNames != null) 'ProtectionNames': protectionNames,
      if (resourceArns != null) 'ResourceArns': resourceArns,
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// Narrows the set of protection groups that the call retrieves. You can
/// retrieve a single protection group by its name and you can retrieve all
/// protection groups that are configured with a specific pattern, aggregation,
/// or resource type. You can provide up to one criteria per filter type. Shield
/// Advanced returns the protection groups that exactly match all of the search
/// criteria that you provide.
class InclusionProtectionGroupFilters {
  /// The aggregation setting of the protection groups that you want to retrieve.
  final List<ProtectionGroupAggregation>? aggregations;

  /// The pattern specification of the protection groups that you want to
  /// retrieve.
  final List<ProtectionGroupPattern>? patterns;

  /// The ID of the protection group that you want to retrieve.
  final List<String>? protectionGroupIds;

  /// The resource type configuration of the protection groups that you want to
  /// retrieve. In the protection group configuration, you specify the resource
  /// type when you set the group's <code>Pattern</code> to
  /// <code>BY_RESOURCE_TYPE</code>.
  final List<ProtectedResourceType>? resourceTypes;

  InclusionProtectionGroupFilters({
    this.aggregations,
    this.patterns,
    this.protectionGroupIds,
    this.resourceTypes,
  });

  Map<String, dynamic> toJson() {
    final aggregations = this.aggregations;
    final patterns = this.patterns;
    final protectionGroupIds = this.protectionGroupIds;
    final resourceTypes = this.resourceTypes;
    return {
      if (aggregations != null)
        'Aggregations': aggregations.map((e) => e.toValue()).toList(),
      if (patterns != null)
        'Patterns': patterns.map((e) => e.toValue()).toList(),
      if (protectionGroupIds != null) 'ProtectionGroupIds': protectionGroupIds,
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// Specifies how many protections of a given type you can create.
class Limit {
  /// The maximum number of protections that can be created for the specified
  /// <code>Type</code>.
  final int? max;

  /// The type of protection.
  final String? type;

  Limit({
    this.max,
    this.type,
  });

  factory Limit.fromJson(Map<String, dynamic> json) {
    return Limit(
      max: json['Max'] as int?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final type = this.type;
    return {
      if (max != null) 'Max': max,
      if (type != null) 'Type': type,
    };
  }
}

class ListAttacksResponse {
  /// The attack information for the specified time range.
  final List<AttackSummary>? attackSummaries;

  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield Advanced
  /// to return for a single call with the <code>MaxResults</code> setting. Shield
  /// Advanced will not return more than <code>MaxResults</code> objects, but may
  /// return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  final String? nextToken;

  ListAttacksResponse({
    this.attackSummaries,
    this.nextToken,
  });

  factory ListAttacksResponse.fromJson(Map<String, dynamic> json) {
    return ListAttacksResponse(
      attackSummaries: (json['AttackSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AttackSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attackSummaries = this.attackSummaries;
    final nextToken = this.nextToken;
    return {
      if (attackSummaries != null) 'AttackSummaries': attackSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProtectionGroupsResponse {
  /// <p/>
  final List<ProtectionGroup> protectionGroups;

  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield Advanced
  /// to return for a single call with the <code>MaxResults</code> setting. Shield
  /// Advanced will not return more than <code>MaxResults</code> objects, but may
  /// return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  final String? nextToken;

  ListProtectionGroupsResponse({
    required this.protectionGroups,
    this.nextToken,
  });

  factory ListProtectionGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListProtectionGroupsResponse(
      protectionGroups: (json['ProtectionGroups'] as List)
          .whereNotNull()
          .map((e) => ProtectionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protectionGroups = this.protectionGroups;
    final nextToken = this.nextToken;
    return {
      'ProtectionGroups': protectionGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProtectionsResponse {
  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield Advanced
  /// to return for a single call with the <code>MaxResults</code> setting. Shield
  /// Advanced will not return more than <code>MaxResults</code> objects, but may
  /// return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  final String? nextToken;

  /// The array of enabled <a>Protection</a> objects.
  final List<Protection>? protections;

  ListProtectionsResponse({
    this.nextToken,
    this.protections,
  });

  factory ListProtectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListProtectionsResponse(
      nextToken: json['NextToken'] as String?,
      protections: (json['Protections'] as List?)
          ?.whereNotNull()
          .map((e) => Protection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final protections = this.protections;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (protections != null) 'Protections': protections,
    };
  }
}

class ListResourcesInProtectionGroupResponse {
  /// The Amazon Resource Names (ARNs) of the resources that are included in the
  /// protection group.
  final List<String> resourceArns;

  /// When you request a list of objects from Shield Advanced, if the response
  /// does not include all of the remaining available objects, Shield Advanced
  /// includes a <code>NextToken</code> value in the response. You can retrieve
  /// the next batch of objects by requesting the list again and providing the
  /// token that was returned by the prior call in your request.
  ///
  /// You can indicate the maximum number of objects that you want Shield Advanced
  /// to return for a single call with the <code>MaxResults</code> setting. Shield
  /// Advanced will not return more than <code>MaxResults</code> objects, but may
  /// return fewer, even if more objects are still available.
  ///
  /// Whenever more objects remain that Shield Advanced has not yet returned to
  /// you, the response will include a <code>NextToken</code> value.
  final String? nextToken;

  ListResourcesInProtectionGroupResponse({
    required this.resourceArns,
    this.nextToken,
  });

  factory ListResourcesInProtectionGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourcesInProtectionGroupResponse(
      resourceArns: (json['ResourceArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArns = this.resourceArns;
    final nextToken = this.nextToken;
    return {
      'ResourceArns': resourceArns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tag key and value pairs associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The mitigation applied to a DDoS attack.
class Mitigation {
  /// The name of the mitigation taken for this attack.
  final String? mitigationName;

  Mitigation({
    this.mitigationName,
  });

  factory Mitigation.fromJson(Map<String, dynamic> json) {
    return Mitigation(
      mitigationName: json['MitigationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mitigationName = this.mitigationName;
    return {
      if (mitigationName != null) 'MitigationName': mitigationName,
    };
  }
}

enum ProactiveEngagementStatus {
  enabled,
  disabled,
  pending,
}

extension ProactiveEngagementStatusValueExtension on ProactiveEngagementStatus {
  String toValue() {
    switch (this) {
      case ProactiveEngagementStatus.enabled:
        return 'ENABLED';
      case ProactiveEngagementStatus.disabled:
        return 'DISABLED';
      case ProactiveEngagementStatus.pending:
        return 'PENDING';
    }
  }
}

extension ProactiveEngagementStatusFromString on String {
  ProactiveEngagementStatus toProactiveEngagementStatus() {
    switch (this) {
      case 'ENABLED':
        return ProactiveEngagementStatus.enabled;
      case 'DISABLED':
        return ProactiveEngagementStatus.disabled;
      case 'PENDING':
        return ProactiveEngagementStatus.pending;
    }
    throw Exception('$this is not known in enum ProactiveEngagementStatus');
  }
}

enum ProtectedResourceType {
  cloudfrontDistribution,
  route_53HostedZone,
  elasticIpAllocation,
  classicLoadBalancer,
  applicationLoadBalancer,
  globalAccelerator,
}

extension ProtectedResourceTypeValueExtension on ProtectedResourceType {
  String toValue() {
    switch (this) {
      case ProtectedResourceType.cloudfrontDistribution:
        return 'CLOUDFRONT_DISTRIBUTION';
      case ProtectedResourceType.route_53HostedZone:
        return 'ROUTE_53_HOSTED_ZONE';
      case ProtectedResourceType.elasticIpAllocation:
        return 'ELASTIC_IP_ALLOCATION';
      case ProtectedResourceType.classicLoadBalancer:
        return 'CLASSIC_LOAD_BALANCER';
      case ProtectedResourceType.applicationLoadBalancer:
        return 'APPLICATION_LOAD_BALANCER';
      case ProtectedResourceType.globalAccelerator:
        return 'GLOBAL_ACCELERATOR';
    }
  }
}

extension ProtectedResourceTypeFromString on String {
  ProtectedResourceType toProtectedResourceType() {
    switch (this) {
      case 'CLOUDFRONT_DISTRIBUTION':
        return ProtectedResourceType.cloudfrontDistribution;
      case 'ROUTE_53_HOSTED_ZONE':
        return ProtectedResourceType.route_53HostedZone;
      case 'ELASTIC_IP_ALLOCATION':
        return ProtectedResourceType.elasticIpAllocation;
      case 'CLASSIC_LOAD_BALANCER':
        return ProtectedResourceType.classicLoadBalancer;
      case 'APPLICATION_LOAD_BALANCER':
        return ProtectedResourceType.applicationLoadBalancer;
      case 'GLOBAL_ACCELERATOR':
        return ProtectedResourceType.globalAccelerator;
    }
    throw Exception('$this is not known in enum ProtectedResourceType');
  }
}

/// An object that represents a resource that is under DDoS protection.
class Protection {
  /// The automatic application layer DDoS mitigation settings for the protection.
  /// This configuration determines whether Shield Advanced automatically manages
  /// rules in the web ACL in order to respond to application layer events that
  /// Shield Advanced determines to be DDoS attacks.
  final ApplicationLayerAutomaticResponseConfiguration?
      applicationLayerAutomaticResponseConfiguration;

  /// The unique identifier (ID) for the Route 53 health check that's associated
  /// with the protection.
  final List<String>? healthCheckIds;

  /// The unique identifier (ID) of the protection.
  final String? id;

  /// The name of the protection. For example, <code>My CloudFront
  /// distributions</code>.
  final String? name;

  /// The ARN (Amazon Resource Name) of the protection.
  final String? protectionArn;

  /// The ARN (Amazon Resource Name) of the Amazon Web Services resource that is
  /// protected.
  final String? resourceArn;

  Protection({
    this.applicationLayerAutomaticResponseConfiguration,
    this.healthCheckIds,
    this.id,
    this.name,
    this.protectionArn,
    this.resourceArn,
  });

  factory Protection.fromJson(Map<String, dynamic> json) {
    return Protection(
      applicationLayerAutomaticResponseConfiguration:
          json['ApplicationLayerAutomaticResponseConfiguration'] != null
              ? ApplicationLayerAutomaticResponseConfiguration.fromJson(
                  json['ApplicationLayerAutomaticResponseConfiguration']
                      as Map<String, dynamic>)
              : null,
      healthCheckIds: (json['HealthCheckIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      protectionArn: json['ProtectionArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationLayerAutomaticResponseConfiguration =
        this.applicationLayerAutomaticResponseConfiguration;
    final healthCheckIds = this.healthCheckIds;
    final id = this.id;
    final name = this.name;
    final protectionArn = this.protectionArn;
    final resourceArn = this.resourceArn;
    return {
      if (applicationLayerAutomaticResponseConfiguration != null)
        'ApplicationLayerAutomaticResponseConfiguration':
            applicationLayerAutomaticResponseConfiguration,
      if (healthCheckIds != null) 'HealthCheckIds': healthCheckIds,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (protectionArn != null) 'ProtectionArn': protectionArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

/// A grouping of protected resources that you and Shield Advanced can monitor
/// as a collective. This resource grouping improves the accuracy of detection
/// and reduces false positives.
class ProtectionGroup {
  /// Defines how Shield combines resource data for the group in order to detect,
  /// mitigate, and report events.
  ///
  /// <ul>
  /// <li>
  /// Sum - Use the total traffic across the group. This is a good choice for most
  /// cases. Examples include Elastic IP addresses for EC2 instances that scale
  /// manually or automatically.
  /// </li>
  /// <li>
  /// Mean - Use the average of the traffic across the group. This is a good
  /// choice for resources that share traffic uniformly. Examples include
  /// accelerators and load balancers.
  /// </li>
  /// <li>
  /// Max - Use the highest traffic from each resource. This is useful for
  /// resources that don't share traffic and for resources that share that traffic
  /// in a non-uniform way. Examples include Amazon CloudFront distributions and
  /// origin resources for CloudFront distributions.
  /// </li>
  /// </ul>
  final ProtectionGroupAggregation aggregation;

  /// The ARNs (Amazon Resource Names) of the resources to include in the
  /// protection group. You must set this when you set <code>Pattern</code> to
  /// <code>ARBITRARY</code> and you must not set it for any other
  /// <code>Pattern</code> setting.
  final List<String> members;

  /// The criteria to use to choose the protected resources for inclusion in the
  /// group. You can include all resources that have protections, provide a list
  /// of resource ARNs (Amazon Resource Names), or include all resources of a
  /// specified resource type.
  final ProtectionGroupPattern pattern;

  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  final String protectionGroupId;

  /// The ARN (Amazon Resource Name) of the protection group.
  final String? protectionGroupArn;

  /// The resource type to include in the protection group. All protected
  /// resources of this type are included in the protection group. You must set
  /// this when you set <code>Pattern</code> to <code>BY_RESOURCE_TYPE</code> and
  /// you must not set it for any other <code>Pattern</code> setting.
  final ProtectedResourceType? resourceType;

  ProtectionGroup({
    required this.aggregation,
    required this.members,
    required this.pattern,
    required this.protectionGroupId,
    this.protectionGroupArn,
    this.resourceType,
  });

  factory ProtectionGroup.fromJson(Map<String, dynamic> json) {
    return ProtectionGroup(
      aggregation:
          (json['Aggregation'] as String).toProtectionGroupAggregation(),
      members: (json['Members'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      pattern: (json['Pattern'] as String).toProtectionGroupPattern(),
      protectionGroupId: json['ProtectionGroupId'] as String,
      protectionGroupArn: json['ProtectionGroupArn'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.toProtectedResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregation = this.aggregation;
    final members = this.members;
    final pattern = this.pattern;
    final protectionGroupId = this.protectionGroupId;
    final protectionGroupArn = this.protectionGroupArn;
    final resourceType = this.resourceType;
    return {
      'Aggregation': aggregation.toValue(),
      'Members': members,
      'Pattern': pattern.toValue(),
      'ProtectionGroupId': protectionGroupId,
      if (protectionGroupArn != null) 'ProtectionGroupArn': protectionGroupArn,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

enum ProtectionGroupAggregation {
  sum,
  mean,
  max,
}

extension ProtectionGroupAggregationValueExtension
    on ProtectionGroupAggregation {
  String toValue() {
    switch (this) {
      case ProtectionGroupAggregation.sum:
        return 'SUM';
      case ProtectionGroupAggregation.mean:
        return 'MEAN';
      case ProtectionGroupAggregation.max:
        return 'MAX';
    }
  }
}

extension ProtectionGroupAggregationFromString on String {
  ProtectionGroupAggregation toProtectionGroupAggregation() {
    switch (this) {
      case 'SUM':
        return ProtectionGroupAggregation.sum;
      case 'MEAN':
        return ProtectionGroupAggregation.mean;
      case 'MAX':
        return ProtectionGroupAggregation.max;
    }
    throw Exception('$this is not known in enum ProtectionGroupAggregation');
  }
}

/// Limits settings on protection groups with arbitrary pattern type.
class ProtectionGroupArbitraryPatternLimits {
  /// The maximum number of resources you can specify for a single arbitrary
  /// pattern in a protection group.
  final int maxMembers;

  ProtectionGroupArbitraryPatternLimits({
    required this.maxMembers,
  });

  factory ProtectionGroupArbitraryPatternLimits.fromJson(
      Map<String, dynamic> json) {
    return ProtectionGroupArbitraryPatternLimits(
      maxMembers: json['MaxMembers'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxMembers = this.maxMembers;
    return {
      'MaxMembers': maxMembers,
    };
  }
}

/// Limits settings on protection groups for your subscription.
class ProtectionGroupLimits {
  /// The maximum number of protection groups that you can have at one time.
  final int maxProtectionGroups;

  /// Limits settings by pattern type in the protection groups for your
  /// subscription.
  final ProtectionGroupPatternTypeLimits patternTypeLimits;

  ProtectionGroupLimits({
    required this.maxProtectionGroups,
    required this.patternTypeLimits,
  });

  factory ProtectionGroupLimits.fromJson(Map<String, dynamic> json) {
    return ProtectionGroupLimits(
      maxProtectionGroups: json['MaxProtectionGroups'] as int,
      patternTypeLimits: ProtectionGroupPatternTypeLimits.fromJson(
          json['PatternTypeLimits'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final maxProtectionGroups = this.maxProtectionGroups;
    final patternTypeLimits = this.patternTypeLimits;
    return {
      'MaxProtectionGroups': maxProtectionGroups,
      'PatternTypeLimits': patternTypeLimits,
    };
  }
}

enum ProtectionGroupPattern {
  all,
  arbitrary,
  byResourceType,
}

extension ProtectionGroupPatternValueExtension on ProtectionGroupPattern {
  String toValue() {
    switch (this) {
      case ProtectionGroupPattern.all:
        return 'ALL';
      case ProtectionGroupPattern.arbitrary:
        return 'ARBITRARY';
      case ProtectionGroupPattern.byResourceType:
        return 'BY_RESOURCE_TYPE';
    }
  }
}

extension ProtectionGroupPatternFromString on String {
  ProtectionGroupPattern toProtectionGroupPattern() {
    switch (this) {
      case 'ALL':
        return ProtectionGroupPattern.all;
      case 'ARBITRARY':
        return ProtectionGroupPattern.arbitrary;
      case 'BY_RESOURCE_TYPE':
        return ProtectionGroupPattern.byResourceType;
    }
    throw Exception('$this is not known in enum ProtectionGroupPattern');
  }
}

/// Limits settings by pattern type in the protection groups for your
/// subscription.
class ProtectionGroupPatternTypeLimits {
  /// Limits settings on protection groups with arbitrary pattern type.
  final ProtectionGroupArbitraryPatternLimits arbitraryPatternLimits;

  ProtectionGroupPatternTypeLimits({
    required this.arbitraryPatternLimits,
  });

  factory ProtectionGroupPatternTypeLimits.fromJson(Map<String, dynamic> json) {
    return ProtectionGroupPatternTypeLimits(
      arbitraryPatternLimits: ProtectionGroupArbitraryPatternLimits.fromJson(
          json['ArbitraryPatternLimits'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final arbitraryPatternLimits = this.arbitraryPatternLimits;
    return {
      'ArbitraryPatternLimits': arbitraryPatternLimits,
    };
  }
}

/// Limits settings on protections for your subscription.
class ProtectionLimits {
  /// The maximum number of resource types that you can specify in a protection.
  final List<Limit> protectedResourceTypeLimits;

  ProtectionLimits({
    required this.protectedResourceTypeLimits,
  });

  factory ProtectionLimits.fromJson(Map<String, dynamic> json) {
    return ProtectionLimits(
      protectedResourceTypeLimits: (json['ProtectedResourceTypeLimits'] as List)
          .whereNotNull()
          .map((e) => Limit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final protectedResourceTypeLimits = this.protectedResourceTypeLimits;
    return {
      'ProtectedResourceTypeLimits': protectedResourceTypeLimits,
    };
  }
}

/// Specifies the action setting that Shield Advanced should use in the WAF
/// rules that it creates on behalf of the protected resource in response to
/// DDoS attacks. You specify this as part of the configuration for the
/// automatic application layer DDoS mitigation feature, when you enable or
/// update automatic mitigation. Shield Advanced creates the WAF rules in a
/// Shield Advanced-managed rule group, inside the web ACL that you have
/// associated with the resource.
class ResponseAction {
  /// Specifies that Shield Advanced should configure its WAF rules with the WAF
  /// <code>Block</code> action.
  ///
  /// You must specify exactly one action, either <code>Block</code> or
  /// <code>Count</code>.
  final BlockAction? block;

  /// Specifies that Shield Advanced should configure its WAF rules with the WAF
  /// <code>Count</code> action.
  ///
  /// You must specify exactly one action, either <code>Block</code> or
  /// <code>Count</code>.
  final CountAction? count;

  ResponseAction({
    this.block,
    this.count,
  });

  factory ResponseAction.fromJson(Map<String, dynamic> json) {
    return ResponseAction(
      block: json['Block'] != null
          ? BlockAction.fromJson(json['Block'] as Map<String, dynamic>)
          : null,
      count: json['Count'] != null
          ? CountAction.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final block = this.block;
    final count = this.count;
    return {
      if (block != null) 'Block': block,
      if (count != null) 'Count': count,
    };
  }
}

/// The attack information for the specified SubResource.
class SubResourceSummary {
  /// The list of attack types and associated counters.
  final List<SummarizedAttackVector>? attackVectors;

  /// The counters that describe the details of the attack.
  final List<SummarizedCounter>? counters;

  /// The unique identifier (ID) of the <code>SubResource</code>.
  final String? id;

  /// The <code>SubResource</code> type.
  final SubResourceType? type;

  SubResourceSummary({
    this.attackVectors,
    this.counters,
    this.id,
    this.type,
  });

  factory SubResourceSummary.fromJson(Map<String, dynamic> json) {
    return SubResourceSummary(
      attackVectors: (json['AttackVectors'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SummarizedAttackVector.fromJson(e as Map<String, dynamic>))
          .toList(),
      counters: (json['Counters'] as List?)
          ?.whereNotNull()
          .map((e) => SummarizedCounter.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      type: (json['Type'] as String?)?.toSubResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attackVectors = this.attackVectors;
    final counters = this.counters;
    final id = this.id;
    final type = this.type;
    return {
      if (attackVectors != null) 'AttackVectors': attackVectors,
      if (counters != null) 'Counters': counters,
      if (id != null) 'Id': id,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum SubResourceType {
  ip,
  url,
}

extension SubResourceTypeValueExtension on SubResourceType {
  String toValue() {
    switch (this) {
      case SubResourceType.ip:
        return 'IP';
      case SubResourceType.url:
        return 'URL';
    }
  }
}

extension SubResourceTypeFromString on String {
  SubResourceType toSubResourceType() {
    switch (this) {
      case 'IP':
        return SubResourceType.ip;
      case 'URL':
        return SubResourceType.url;
    }
    throw Exception('$this is not known in enum SubResourceType');
  }
}

/// Information about the Shield Advanced subscription for an account.
class Subscription {
  /// Limits settings for your subscription.
  final SubscriptionLimits subscriptionLimits;

  /// If <code>ENABLED</code>, the subscription will be automatically renewed at
  /// the end of the existing subscription period.
  ///
  /// When you initally create a subscription, <code>AutoRenew</code> is set to
  /// <code>ENABLED</code>. You can change this by submitting an
  /// <code>UpdateSubscription</code> request. If the
  /// <code>UpdateSubscription</code> request does not included a value for
  /// <code>AutoRenew</code>, the existing value for <code>AutoRenew</code>
  /// remains unchanged.
  final AutoRenew? autoRenew;

  /// The date and time your subscription will end.
  final DateTime? endTime;

  /// Specifies how many protections of a given type you can create.
  final List<Limit>? limits;

  /// If <code>ENABLED</code>, the Shield Response Team (SRT) will use email and
  /// phone to notify contacts about escalations to the SRT and to initiate
  /// proactive customer support.
  ///
  /// If <code>PENDING</code>, you have requested proactive engagement and the
  /// request is pending. The status changes to <code>ENABLED</code> when your
  /// request is fully processed.
  ///
  /// If <code>DISABLED</code>, the SRT will not proactively notify contacts about
  /// escalations or to initiate proactive customer support.
  final ProactiveEngagementStatus? proactiveEngagementStatus;

  /// The start time of the subscription, in Unix time in seconds.
  final DateTime? startTime;

  /// The ARN (Amazon Resource Name) of the subscription.
  final String? subscriptionArn;

  /// The length, in seconds, of the Shield Advanced subscription for the account.
  final int? timeCommitmentInSeconds;

  Subscription({
    required this.subscriptionLimits,
    this.autoRenew,
    this.endTime,
    this.limits,
    this.proactiveEngagementStatus,
    this.startTime,
    this.subscriptionArn,
    this.timeCommitmentInSeconds,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      subscriptionLimits: SubscriptionLimits.fromJson(
          json['SubscriptionLimits'] as Map<String, dynamic>),
      autoRenew: (json['AutoRenew'] as String?)?.toAutoRenew(),
      endTime: timeStampFromJson(json['EndTime']),
      limits: (json['Limits'] as List?)
          ?.whereNotNull()
          .map((e) => Limit.fromJson(e as Map<String, dynamic>))
          .toList(),
      proactiveEngagementStatus: (json['ProactiveEngagementStatus'] as String?)
          ?.toProactiveEngagementStatus(),
      startTime: timeStampFromJson(json['StartTime']),
      subscriptionArn: json['SubscriptionArn'] as String?,
      timeCommitmentInSeconds: json['TimeCommitmentInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionLimits = this.subscriptionLimits;
    final autoRenew = this.autoRenew;
    final endTime = this.endTime;
    final limits = this.limits;
    final proactiveEngagementStatus = this.proactiveEngagementStatus;
    final startTime = this.startTime;
    final subscriptionArn = this.subscriptionArn;
    final timeCommitmentInSeconds = this.timeCommitmentInSeconds;
    return {
      'SubscriptionLimits': subscriptionLimits,
      if (autoRenew != null) 'AutoRenew': autoRenew.toValue(),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (limits != null) 'Limits': limits,
      if (proactiveEngagementStatus != null)
        'ProactiveEngagementStatus': proactiveEngagementStatus.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (subscriptionArn != null) 'SubscriptionArn': subscriptionArn,
      if (timeCommitmentInSeconds != null)
        'TimeCommitmentInSeconds': timeCommitmentInSeconds,
    };
  }
}

/// Limits settings for your subscription.
class SubscriptionLimits {
  /// Limits settings on protection groups for your subscription.
  final ProtectionGroupLimits protectionGroupLimits;

  /// Limits settings on protections for your subscription.
  final ProtectionLimits protectionLimits;

  SubscriptionLimits({
    required this.protectionGroupLimits,
    required this.protectionLimits,
  });

  factory SubscriptionLimits.fromJson(Map<String, dynamic> json) {
    return SubscriptionLimits(
      protectionGroupLimits: ProtectionGroupLimits.fromJson(
          json['ProtectionGroupLimits'] as Map<String, dynamic>),
      protectionLimits: ProtectionLimits.fromJson(
          json['ProtectionLimits'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final protectionGroupLimits = this.protectionGroupLimits;
    final protectionLimits = this.protectionLimits;
    return {
      'ProtectionGroupLimits': protectionGroupLimits,
      'ProtectionLimits': protectionLimits,
    };
  }
}

enum SubscriptionState {
  active,
  inactive,
}

extension SubscriptionStateValueExtension on SubscriptionState {
  String toValue() {
    switch (this) {
      case SubscriptionState.active:
        return 'ACTIVE';
      case SubscriptionState.inactive:
        return 'INACTIVE';
    }
  }
}

extension SubscriptionStateFromString on String {
  SubscriptionState toSubscriptionState() {
    switch (this) {
      case 'ACTIVE':
        return SubscriptionState.active;
      case 'INACTIVE':
        return SubscriptionState.inactive;
    }
    throw Exception('$this is not known in enum SubscriptionState');
  }
}

/// A summary of information about the attack.
class SummarizedAttackVector {
  /// The attack type, for example, SNMP reflection or SYN flood.
  final String vectorType;

  /// The list of counters that describe the details of the attack.
  final List<SummarizedCounter>? vectorCounters;

  SummarizedAttackVector({
    required this.vectorType,
    this.vectorCounters,
  });

  factory SummarizedAttackVector.fromJson(Map<String, dynamic> json) {
    return SummarizedAttackVector(
      vectorType: json['VectorType'] as String,
      vectorCounters: (json['VectorCounters'] as List?)
          ?.whereNotNull()
          .map((e) => SummarizedCounter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vectorType = this.vectorType;
    final vectorCounters = this.vectorCounters;
    return {
      'VectorType': vectorType,
      if (vectorCounters != null) 'VectorCounters': vectorCounters,
    };
  }
}

/// The counter that describes a DDoS attack.
class SummarizedCounter {
  /// The average value of the counter for a specified time period.
  final double? average;

  /// The maximum value of the counter for a specified time period.
  final double? max;

  /// The number of counters for a specified time period.
  final int? n;

  /// The counter name.
  final String? name;

  /// The total of counter values for a specified time period.
  final double? sum;

  /// The unit of the counters.
  final String? unit;

  SummarizedCounter({
    this.average,
    this.max,
    this.n,
    this.name,
    this.sum,
    this.unit,
  });

  factory SummarizedCounter.fromJson(Map<String, dynamic> json) {
    return SummarizedCounter(
      average: json['Average'] as double?,
      max: json['Max'] as double?,
      n: json['N'] as int?,
      name: json['Name'] as String?,
      sum: json['Sum'] as double?,
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final max = this.max;
    final n = this.n;
    final name = this.name;
    final sum = this.sum;
    final unit = this.unit;
    return {
      if (average != null) 'Average': average,
      if (max != null) 'Max': max,
      if (n != null) 'N': n,
      if (name != null) 'Name': name,
      if (sum != null) 'Sum': sum,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// A tag associated with an Amazon Web Services resource. Tags are key:value
/// pairs that you can use to categorize and manage your resources, for purposes
/// like billing or other management. Typically, the tag key represents a
/// category, such as "environment", and the tag value represents a specific
/// value within that category, such as "test," "development," or "production".
/// Or you might set the tag key to "customer" and the value to the customer
/// name or ID. You can specify one or more tags to add to each Amazon Web
/// Services resource, up to 50 tags for a resource.
class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String? key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The time range.
class TimeRange {
  /// The start time, in Unix time in seconds.
  final DateTime? fromInclusive;

  /// The end time, in Unix time in seconds.
  final DateTime? toExclusive;

  TimeRange({
    this.fromInclusive,
    this.toExclusive,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      fromInclusive: timeStampFromJson(json['FromInclusive']),
      toExclusive: timeStampFromJson(json['ToExclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final fromInclusive = this.fromInclusive;
    final toExclusive = this.toExclusive;
    return {
      if (fromInclusive != null)
        'FromInclusive': unixTimestampToJson(fromInclusive),
      if (toExclusive != null) 'ToExclusive': unixTimestampToJson(toExclusive),
    };
  }
}

enum Unit {
  bits,
  bytes,
  packets,
  requests,
}

extension UnitValueExtension on Unit {
  String toValue() {
    switch (this) {
      case Unit.bits:
        return 'BITS';
      case Unit.bytes:
        return 'BYTES';
      case Unit.packets:
        return 'PACKETS';
      case Unit.requests:
        return 'REQUESTS';
    }
  }
}

extension UnitFromString on String {
  Unit toUnit() {
    switch (this) {
      case 'BITS':
        return Unit.bits;
      case 'BYTES':
        return Unit.bytes;
      case 'PACKETS':
        return Unit.packets;
      case 'REQUESTS':
        return Unit.requests;
    }
    throw Exception('$this is not known in enum Unit');
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

class UpdateApplicationLayerAutomaticResponseResponse {
  UpdateApplicationLayerAutomaticResponseResponse();

  factory UpdateApplicationLayerAutomaticResponseResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateApplicationLayerAutomaticResponseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateEmergencyContactSettingsResponse {
  UpdateEmergencyContactSettingsResponse();

  factory UpdateEmergencyContactSettingsResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateEmergencyContactSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateProtectionGroupResponse {
  UpdateProtectionGroupResponse();

  factory UpdateProtectionGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProtectionGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSubscriptionResponse {
  UpdateSubscriptionResponse();

  factory UpdateSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccessDeniedForDependencyException extends _s.GenericAwsException {
  AccessDeniedForDependencyException({String? type, String? message})
      : super(
            type: type,
            code: 'AccessDeniedForDependencyException',
            message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidResourceException extends _s.GenericAwsException {
  InvalidResourceException({String? type, String? message})
      : super(type: type, code: 'InvalidResourceException', message: message);
}

class LimitsExceededException extends _s.GenericAwsException {
  LimitsExceededException({String? type, String? message})
      : super(type: type, code: 'LimitsExceededException', message: message);
}

class LockedSubscriptionException extends _s.GenericAwsException {
  LockedSubscriptionException({String? type, String? message})
      : super(
            type: type, code: 'LockedSubscriptionException', message: message);
}

class NoAssociatedRoleException extends _s.GenericAwsException {
  NoAssociatedRoleException({String? type, String? message})
      : super(type: type, code: 'NoAssociatedRoleException', message: message);
}

class OptimisticLockException extends _s.GenericAwsException {
  OptimisticLockException({String? type, String? message})
      : super(type: type, code: 'OptimisticLockException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AccessDeniedForDependencyException': (type, message) =>
      AccessDeniedForDependencyException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidResourceException': (type, message) =>
      InvalidResourceException(type: type, message: message),
  'LimitsExceededException': (type, message) =>
      LimitsExceededException(type: type, message: message),
  'LockedSubscriptionException': (type, message) =>
      LockedSubscriptionException(type: type, message: message),
  'NoAssociatedRoleException': (type, message) =>
      NoAssociatedRoleException(type: type, message: message),
  'OptimisticLockException': (type, message) =>
      OptimisticLockException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
