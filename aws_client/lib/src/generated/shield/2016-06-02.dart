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

part '2016-06-02.g.dart';

/// This is the <i>AWS Shield Advanced API Reference</i>. This guide is for
/// developers who need detailed information about the AWS Shield Advanced API
/// actions, data types, and errors. For detailed information about AWS WAF and
/// AWS Shield Advanced features and an overview of how to use the AWS WAF and
/// AWS Shield Advanced APIs, see the <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and
/// AWS Shield Developer Guide</a>.
class Shield {
  final _s.JsonProtocol _protocol;
  Shield({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'shield',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Authorizes the DDoS Response Team (DRT) to access the specified Amazon S3
  /// bucket containing your AWS WAF logs. You can associate up to 10 Amazon S3
  /// buckets with your subscription.
  ///
  /// To use the services of the DRT and make an
  /// <code>AssociateDRTLogBucket</code> request, you must be subscribed to the
  /// <a href="https://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
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
  /// The Amazon S3 bucket that contains your AWS WAF logs.
  Future<void> associateDRTLogBucket({
    @_s.required String logBucket,
  }) async {
    ArgumentError.checkNotNull(logBucket, 'logBucket');
    _s.validateStringLength(
      'logBucket',
      logBucket,
      3,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logBucket',
      logBucket,
      r'''^([a-z]|(\d(?!\d{0,2}\.\d{1,3}\.\d{1,3}\.\d{1,3})))([a-z\d]|(\.(?!(\.|-)))|(-(?!\.))){1,61}[a-z\d]$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateDRTLogBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LogBucket': logBucket,
      },
    );

    return AssociateDRTLogBucketResponse.fromJson(jsonResponse.body);
  }

  /// Authorizes the DDoS Response Team (DRT), using the specified role, to
  /// access your AWS account to assist with DDoS attack mitigation during
  /// potential attacks. This enables the DRT to inspect your AWS WAF
  /// configuration and create or update AWS WAF rules and web ACLs.
  ///
  /// You can associate only one <code>RoleArn</code> with your subscription. If
  /// you submit an <code>AssociateDRTRole</code> request for an account that
  /// already has an associated role, the new <code>RoleArn</code> will replace
  /// the existing <code>RoleArn</code>.
  ///
  /// Prior to making the <code>AssociateDRTRole</code> request, you must attach
  /// the <a
  /// href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a>
  /// managed policy to the role you will specify in the request. For more
  /// information see <a href="
  /// https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching
  /// and Detaching IAM Policies</a>. The role must also trust the service
  /// principal <code> drt.shield.amazonaws.com</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html">IAM
  /// JSON Policy Elements: Principal</a>.
  ///
  /// The DRT will have access only to your AWS WAF and Shield resources. By
  /// submitting this request, you authorize the DRT to inspect your AWS WAF and
  /// Shield configuration and create and update AWS WAF rules and web ACLs on
  /// your behalf. The DRT takes these actions only if explicitly authorized by
  /// you.
  ///
  /// You must have the <code>iam:PassRole</code> permission to make an
  /// <code>AssociateDRTRole</code> request. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">Granting
  /// a User Permissions to Pass a Role to an AWS Service</a>.
  ///
  /// To use the services of the DRT and make an <code>AssociateDRTRole</code>
  /// request, you must be subscribed to the <a
  /// href="https://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
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
  /// The Amazon Resource Name (ARN) of the role the DRT will use to access your
  /// AWS account.
  ///
  /// Prior to making the <code>AssociateDRTRole</code> request, you must attach
  /// the <a
  /// href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a>
  /// managed policy to this role. For more information see <a href="
  /// https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching
  /// and Detaching IAM Policies</a>.
  Future<void> associateDRTRole({
    @_s.required String roleArn,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateDRTRole'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoleArn': roleArn,
      },
    );

    return AssociateDRTRoleResponse.fromJson(jsonResponse.body);
  }

  /// Adds health-based detection to the Shield Advanced protection for a
  /// resource. Shield Advanced health-based detection uses the health of your
  /// AWS resource to improve responsiveness and accuracy in attack detection
  /// and mitigation.
  ///
  /// You define the health check in Route 53 and then associate it with your
  /// Shield Advanced protection. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield
  /// Advanced Health-Based Detection</a> in the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and
  /// AWS Shield Developer Guide</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [LimitsExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [healthCheckArn] :
  /// The Amazon Resource Name (ARN) of the health check to associate with the
  /// protection.
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to add the
  /// health check association to.
  Future<void> associateHealthCheck({
    @_s.required String healthCheckArn,
    @_s.required String protectionId,
  }) async {
    ArgumentError.checkNotNull(healthCheckArn, 'healthCheckArn');
    _s.validateStringLength(
      'healthCheckArn',
      healthCheckArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'healthCheckArn',
      healthCheckArn,
      r'''^arn:aws:route53:::healthcheck/\S{36}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(protectionId, 'protectionId');
    _s.validateStringLength(
      'protectionId',
      protectionId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionId',
      protectionId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateHealthCheck'
    };
    final jsonResponse = await _protocol.send(
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

    return AssociateHealthCheckResponse.fromJson(jsonResponse.body);
  }

  /// Initializes proactive engagement and sets the list of contacts for the
  /// DDoS Response Team (DRT) to use. You must provide at least one phone
  /// number in the emergency contact list.
  ///
  /// After you have initialized proactive engagement using this call, to
  /// disable or enable proactive engagement, use the calls
  /// <code>DisableProactiveEngagement</code> and
  /// <code>EnableProactiveEngagement</code>.
  /// <note>
  /// This call defines the list of email addresses and phone numbers that the
  /// DDoS Response Team (DRT) can use to contact you for escalations to the DRT
  /// and to initiate proactive customer support.
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
  /// A list of email addresses and phone numbers that the DDoS Response Team
  /// (DRT) can use to contact you for escalations to the DRT and to initiate
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
    @_s.required List<EmergencyContact> emergencyContactList,
  }) async {
    ArgumentError.checkNotNull(emergencyContactList, 'emergencyContactList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.AssociateProactiveEngagementDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EmergencyContactList': emergencyContactList,
      },
    );

    return AssociateProactiveEngagementDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Enables AWS Shield Advanced for a specific AWS resource. The resource can
  /// be an Amazon CloudFront distribution, Elastic Load Balancing load
  /// balancer, AWS Global Accelerator accelerator, Elastic IP Address, or an
  /// Amazon Route 53 hosted zone.
  ///
  /// You can add protection to only a single resource with each
  /// CreateProtection request. If you want to add protection to multiple
  /// resources at once, use the <a
  /// href="https://console.aws.amazon.com/waf/">AWS WAF console</a>. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html">Getting
  /// Started with AWS Shield Advanced</a> and <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html">Add
  /// AWS Shield Advanced Protection to more AWS Resources</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidResourceException].
  /// May throw [InvalidOperationException].
  /// May throw [LimitsExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
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
  /// For an AWS CloudFront distribution:
  /// <code>arn:aws:cloudfront::<i>account-id</i>:distribution/<i>distribution-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For an AWS Global Accelerator accelerator:
  /// <code>arn:aws:globalaccelerator::<i>account-id</i>:accelerator/<i>accelerator-id</i>
  /// </code>
  /// </li>
  /// <li>
  /// For Amazon Route 53:
  /// <code>arn:aws:route53:::hostedzone/<i>hosted-zone-id</i> </code>
  /// </li>
  /// <li>
  /// For an Elastic IP address:
  /// <code>arn:aws:ec2:<i>region</i>:<i>account-id</i>:eip-allocation/<i>allocation-id</i>
  /// </code>
  /// </li>
  /// </ul>
  Future<CreateProtectionResponse> createProtection({
    @_s.required String name,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[ a-zA-Z0-9_\\.\\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
      isRequired: true,
    );
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
  /// Defines how AWS Shield combines resource data for the group in order to
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
  /// traffic in a non-uniform way. Examples include CloudFront distributions
  /// and origin resources for CloudFront distributions.
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
  Future<void> createProtectionGroup({
    @_s.required ProtectionGroupAggregation aggregation,
    @_s.required ProtectionGroupPattern pattern,
    @_s.required String protectionGroupId,
    List<String> members,
    ProtectedResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(aggregation, 'aggregation');
    ArgumentError.checkNotNull(pattern, 'pattern');
    ArgumentError.checkNotNull(protectionGroupId, 'protectionGroupId');
    _s.validateStringLength(
      'protectionGroupId',
      protectionGroupId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionGroupId',
      protectionGroupId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.CreateProtectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aggregation': aggregation?.toValue() ?? '',
        'Pattern': pattern?.toValue() ?? '',
        'ProtectionGroupId': protectionGroupId,
        if (members != null) 'Members': members,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );

    return CreateProtectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Activates AWS Shield Advanced for an account.
  ///
  /// When you initally create a subscription, your subscription is set to be
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return CreateSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an AWS Shield Advanced <a>Protection</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to be deleted.
  Future<void> deleteProtection({
    @_s.required String protectionId,
  }) async {
    ArgumentError.checkNotNull(protectionId, 'protectionId');
    _s.validateStringLength(
      'protectionId',
      protectionId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionId',
      protectionId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DeleteProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectionId': protectionId,
      },
    );

    return DeleteProtectionResponse.fromJson(jsonResponse.body);
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
    @_s.required String protectionGroupId,
  }) async {
    ArgumentError.checkNotNull(protectionGroupId, 'protectionGroupId');
    _s.validateStringLength(
      'protectionGroupId',
      protectionGroupId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionGroupId',
      protectionGroupId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DeleteProtectionGroup'
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

    return DeleteProtectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Removes AWS Shield Advanced from an account. AWS Shield Advanced requires
  /// a 1-year subscription commitment. You cannot delete a subscription prior
  /// to the completion of that commitment.
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Describes the details of a DDoS attack.
  ///
  /// May throw [InternalErrorException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [attackId] :
  /// The unique identifier (ID) for the attack that to be described.
  Future<DescribeAttackResponse> describeAttack({
    @_s.required String attackId,
  }) async {
    ArgumentError.checkNotNull(attackId, 'attackId');
    _s.validateStringLength(
      'attackId',
      attackId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'attackId',
      attackId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
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

  /// Provides information about the number and type of attacks AWS Shield has
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
  /// DDoS Response Team (DRT) to access your AWS account while assisting with
  /// attack mitigation.
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

  /// A list of email addresses and phone numbers that the DDoS Response Team
  /// (DRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the DRT and to initiate proactive customer support.
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
  /// The unique identifier (ID) for the <a>Protection</a> object that is
  /// described. When submitting the <code>DescribeProtection</code> request you
  /// must provide either the <code>ResourceArn</code> or the
  /// <code>ProtectionID</code>, but not both.
  ///
  /// Parameter [resourceArn] :
  /// The ARN (Amazon Resource Name) of the AWS resource for the
  /// <a>Protection</a> object that is described. When submitting the
  /// <code>DescribeProtection</code> request you must provide either the
  /// <code>ResourceArn</code> or the <code>ProtectionID</code>, but not both.
  Future<DescribeProtectionResponse> describeProtection({
    String protectionId,
    String resourceArn,
  }) async {
    _s.validateStringLength(
      'protectionId',
      protectionId,
      1,
      36,
    );
    _s.validateStringPattern(
      'protectionId',
      protectionId,
      r'''[a-zA-Z0-9\\-]*''',
    );
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws.*''',
    );
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
    @_s.required String protectionGroupId,
  }) async {
    ArgumentError.checkNotNull(protectionGroupId, 'protectionGroupId');
    _s.validateStringLength(
      'protectionGroupId',
      protectionGroupId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionGroupId',
      protectionGroupId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
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

  /// Provides details about the AWS Shield Advanced subscription for an
  /// account.
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

  /// Removes authorization from the DDoS Response Team (DRT) to notify contacts
  /// about escalations to the DRT and to initiate proactive customer support.
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DisableProactiveEngagementResponse.fromJson(jsonResponse.body);
  }

  /// Removes the DDoS Response Team's (DRT) access to the specified Amazon S3
  /// bucket containing your AWS WAF logs.
  ///
  /// To make a <code>DisassociateDRTLogBucket</code> request, you must be
  /// subscribed to the <a
  /// href="https://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
  /// Support plan</a>. However, if you are not subscribed to one of these
  /// support plans, but had been previously and had granted the DRT access to
  /// your account, you can submit a <code>DisassociateDRTLogBucket</code>
  /// request to remove this access.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidOperationException].
  /// May throw [NoAssociatedRoleException].
  /// May throw [AccessDeniedForDependencyException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logBucket] :
  /// The Amazon S3 bucket that contains your AWS WAF logs.
  Future<void> disassociateDRTLogBucket({
    @_s.required String logBucket,
  }) async {
    ArgumentError.checkNotNull(logBucket, 'logBucket');
    _s.validateStringLength(
      'logBucket',
      logBucket,
      3,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logBucket',
      logBucket,
      r'''^([a-z]|(\d(?!\d{0,2}\.\d{1,3}\.\d{1,3}\.\d{1,3})))([a-z\d]|(\.(?!(\.|-)))|(-(?!\.))){1,61}[a-z\d]$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisassociateDRTLogBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LogBucket': logBucket,
      },
    );

    return DisassociateDRTLogBucketResponse.fromJson(jsonResponse.body);
  }

  /// Removes the DDoS Response Team's (DRT) access to your AWS account.
  ///
  /// To make a <code>DisassociateDRTRole</code> request, you must be subscribed
  /// to the <a
  /// href="https://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
  /// Support plan</a>. However, if you are not subscribed to one of these
  /// support plans, but had been previously and had granted the DRT access to
  /// your account, you can submit a <code>DisassociateDRTRole</code> request to
  /// remove this access.
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DisassociateDRTRoleResponse.fromJson(jsonResponse.body);
  }

  /// Removes health-based detection from the Shield Advanced protection for a
  /// resource. Shield Advanced health-based detection uses the health of your
  /// AWS resource to improve responsiveness and accuracy in attack detection
  /// and mitigation.
  ///
  /// You define the health check in Route 53 and then associate or disassociate
  /// it with your Shield Advanced protection. For more information, see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option">Shield
  /// Advanced Health-Based Detection</a> in the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF and
  /// AWS Shield Developer Guide</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OptimisticLockException].
  ///
  /// Parameter [healthCheckArn] :
  /// The Amazon Resource Name (ARN) of the health check that is associated with
  /// the protection.
  ///
  /// Parameter [protectionId] :
  /// The unique identifier (ID) for the <a>Protection</a> object to remove the
  /// health check association from.
  Future<void> disassociateHealthCheck({
    @_s.required String healthCheckArn,
    @_s.required String protectionId,
  }) async {
    ArgumentError.checkNotNull(healthCheckArn, 'healthCheckArn');
    _s.validateStringLength(
      'healthCheckArn',
      healthCheckArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'healthCheckArn',
      healthCheckArn,
      r'''^arn:aws:route53:::healthcheck/\S{36}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(protectionId, 'protectionId');
    _s.validateStringLength(
      'protectionId',
      protectionId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionId',
      protectionId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.DisassociateHealthCheck'
    };
    final jsonResponse = await _protocol.send(
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

    return DisassociateHealthCheckResponse.fromJson(jsonResponse.body);
  }

  /// Authorizes the DDoS Response Team (DRT) to use email and phone to notify
  /// contacts about escalations to the DRT and to initiate proactive customer
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return EnableProactiveEngagementResponse.fromJson(jsonResponse.body);
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
  /// <code>timestamp</code> type. The sample request above indicates a
  /// <code>number</code> type because the default used by WAF is Unix time in
  /// seconds. However any valid <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp
  /// format</a> is allowed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <a>AttackSummary</a> objects to return. If you leave
  /// this blank, Shield Advanced returns the first 20 results.
  ///
  /// This is a maximum value. Shield Advanced might return the results in
  /// smaller batches. That is, the number of objects returned could be less
  /// than <code>MaxResults</code>, even if there are still more objects yet to
  /// return. If there are more objects to return, Shield Advanced returns a
  /// value in <code>NextToken</code> that you can use in your next request, to
  /// get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// The <code>ListAttacksRequest.NextMarker</code> value from a previous call
  /// to <code>ListAttacksRequest</code>. Pass null if this is the first call.
  ///
  /// Parameter [resourceArns] :
  /// The ARN (Amazon Resource Name) of the resource that was attacked. If this
  /// is left blank, all applicable resources for this account will be included.
  ///
  /// Parameter [startTime] :
  /// The start of the time period for the attacks. This is a
  /// <code>timestamp</code> type. The sample request above indicates a
  /// <code>number</code> type because the default used by WAF is Unix time in
  /// seconds. However any valid <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp
  /// format</a> is allowed.
  Future<ListAttacksResponse> listAttacks({
    TimeRange endTime,
    int maxResults,
    String nextToken,
    List<String> resourceArns,
    TimeRange startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
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
      r'''^.*$''',
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

  /// Retrieves the <a>ProtectionGroup</a> objects for the account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <a>ProtectionGroup</a> objects to return. If you
  /// leave this blank, Shield Advanced returns the first 20 results.
  ///
  /// This is a maximum value. Shield Advanced might return the results in
  /// smaller batches. That is, the number of objects returned could be less
  /// than <code>MaxResults</code>, even if there are still more objects yet to
  /// return. If there are more objects to return, Shield Advanced returns a
  /// value in <code>NextToken</code> that you can use in your next request, to
  /// get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// The next token value from a previous call to
  /// <code>ListProtectionGroups</code>. Pass null if this is the first call.
  Future<ListProtectionGroupsResponse> listProtectionGroups({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
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
      r'''^.*$''',
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProtectionGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all <a>Protection</a> objects for the account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <a>Protection</a> objects to return. If you leave
  /// this blank, Shield Advanced returns the first 20 results.
  ///
  /// This is a maximum value. Shield Advanced might return the results in
  /// smaller batches. That is, the number of objects returned could be less
  /// than <code>MaxResults</code>, even if there are still more objects yet to
  /// return. If there are more objects to return, Shield Advanced returns a
  /// value in <code>NextToken</code> that you can use in your next request, to
  /// get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// The <code>ListProtectionsRequest.NextToken</code> value from a previous
  /// call to <code>ListProtections</code>. Pass null if this is the first call.
  Future<ListProtectionsResponse> listProtections({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
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
      r'''^.*$''',
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
  /// The maximum number of resource ARN objects to return. If you leave this
  /// blank, Shield Advanced returns the first 20 results.
  ///
  /// This is a maximum value. Shield Advanced might return the results in
  /// smaller batches. That is, the number of objects returned could be less
  /// than <code>MaxResults</code>, even if there are still more objects yet to
  /// return. If there are more objects to return, Shield Advanced returns a
  /// value in <code>NextToken</code> that you can use in your next request, to
  /// get the next batch of objects.
  ///
  /// Parameter [nextToken] :
  /// The next token value from a previous call to
  /// <code>ListResourcesInProtectionGroup</code>. Pass null if this is the
  /// first call.
  Future<ListResourcesInProtectionGroupResponse>
      listResourcesInProtectionGroup({
    @_s.required String protectionGroupId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(protectionGroupId, 'protectionGroupId');
    _s.validateStringLength(
      'protectionGroupId',
      protectionGroupId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionGroupId',
      protectionGroupId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      10000,
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
      r'''^.*$''',
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

  /// Updates the details of the list of email addresses and phone numbers that
  /// the DDoS Response Team (DRT) can use to contact you if you have proactive
  /// engagement enabled, for escalations to the DRT and to initiate proactive
  /// customer support.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [emergencyContactList] :
  /// A list of email addresses and phone numbers that the DDoS Response Team
  /// (DRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the DRT and to initiate proactive customer support.
  ///
  /// If you have proactive engagement enabled, the contact list must include at
  /// least one phone number.
  Future<void> updateEmergencyContactSettings({
    List<EmergencyContact> emergencyContactList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateEmergencyContactSettings'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateEmergencyContactSettingsResponse.fromJson(jsonResponse.body);
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
  /// Defines how AWS Shield combines resource data for the group in order to
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
  /// traffic in a non-uniform way. Examples include CloudFront distributions
  /// and origin resources for CloudFront distributions.
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
    @_s.required ProtectionGroupAggregation aggregation,
    @_s.required ProtectionGroupPattern pattern,
    @_s.required String protectionGroupId,
    List<String> members,
    ProtectedResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(aggregation, 'aggregation');
    ArgumentError.checkNotNull(pattern, 'pattern');
    ArgumentError.checkNotNull(protectionGroupId, 'protectionGroupId');
    _s.validateStringLength(
      'protectionGroupId',
      protectionGroupId,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'protectionGroupId',
      protectionGroupId,
      r'''[a-zA-Z0-9\\-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateProtectionGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aggregation': aggregation?.toValue() ?? '',
        'Pattern': pattern?.toValue() ?? '',
        'ProtectionGroupId': protectionGroupId,
        if (members != null) 'Members': members,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );

    return UpdateProtectionGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates the details of an existing subscription. Only enter values for
  /// parameters you want to change. Empty parameters are not updated.
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
    AutoRenew autoRenew,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShield_20160616.UpdateSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (autoRenew != null) 'AutoRenew': autoRenew.toValue(),
      },
    );

    return UpdateSubscriptionResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDRTLogBucketResponse {
  AssociateDRTLogBucketResponse();
  factory AssociateDRTLogBucketResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateDRTLogBucketResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDRTRoleResponse {
  AssociateDRTRoleResponse();
  factory AssociateDRTRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateDRTRoleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateHealthCheckResponse {
  AssociateHealthCheckResponse();
  factory AssociateHealthCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateHealthCheckResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateProactiveEngagementDetailsResponse {
  AssociateProactiveEngagementDetailsResponse();
  factory AssociateProactiveEngagementDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateProactiveEngagementDetailsResponseFromJson(json);
}

/// The details of a DDoS attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackDetail {
  /// List of counters that describe the attack for the specified time period.
  @_s.JsonKey(name: 'AttackCounters')
  final List<SummarizedCounter> attackCounters;

  /// The unique identifier (ID) of the attack.
  @_s.JsonKey(name: 'AttackId')
  final String attackId;

  /// The array of <a>AttackProperty</a> objects.
  @_s.JsonKey(name: 'AttackProperties')
  final List<AttackProperty> attackProperties;

  /// The time the attack ended, in Unix time in seconds. For more information see
  /// <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// List of mitigation actions taken for the attack.
  @_s.JsonKey(name: 'Mitigations')
  final List<Mitigation> mitigations;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The time the attack started, in Unix time in seconds. For more information
  /// see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// If applicable, additional detail about the resource being attacked, for
  /// example, IP address or URL.
  @_s.JsonKey(name: 'SubResources')
  final List<SubResourceSummary> subResources;

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
  factory AttackDetail.fromJson(Map<String, dynamic> json) =>
      _$AttackDetailFromJson(json);
}

enum AttackLayer {
  @_s.JsonValue('NETWORK')
  network,
  @_s.JsonValue('APPLICATION')
  application,
}

/// Details of the described attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackProperty {
  /// The type of distributed denial of service (DDoS) event that was observed.
  /// <code>NETWORK</code> indicates layer 3 and layer 4 events and
  /// <code>APPLICATION</code> indicates layer 7 events.
  @_s.JsonKey(name: 'AttackLayer')
  final AttackLayer attackLayer;

  /// Defines the DDoS attack property information that is provided. The
  /// <code>WORDPRESS_PINGBACK_REFLECTOR</code> and
  /// <code>WORDPRESS_PINGBACK_SOURCE</code> values are valid only for WordPress
  /// reflective pingback DDoS attacks.
  @_s.JsonKey(name: 'AttackPropertyIdentifier')
  final AttackPropertyIdentifier attackPropertyIdentifier;

  /// The array of contributor objects that includes the top five contributors to
  /// an attack.
  @_s.JsonKey(name: 'TopContributors')
  final List<Contributor> topContributors;

  /// The total contributions made to this attack by all contributors, not just
  /// the five listed in the <code>TopContributors</code> list.
  @_s.JsonKey(name: 'Total')
  final int total;

  /// The unit of the <code>Value</code> of the contributions.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  AttackProperty({
    this.attackLayer,
    this.attackPropertyIdentifier,
    this.topContributors,
    this.total,
    this.unit,
  });
  factory AttackProperty.fromJson(Map<String, dynamic> json) =>
      _$AttackPropertyFromJson(json);
}

enum AttackPropertyIdentifier {
  @_s.JsonValue('DESTINATION_URL')
  destinationUrl,
  @_s.JsonValue('REFERRER')
  referrer,
  @_s.JsonValue('SOURCE_ASN')
  sourceAsn,
  @_s.JsonValue('SOURCE_COUNTRY')
  sourceCountry,
  @_s.JsonValue('SOURCE_IP_ADDRESS')
  sourceIpAddress,
  @_s.JsonValue('SOURCE_USER_AGENT')
  sourceUserAgent,
  @_s.JsonValue('WORDPRESS_PINGBACK_REFLECTOR')
  wordpressPingbackReflector,
  @_s.JsonValue('WORDPRESS_PINGBACK_SOURCE')
  wordpressPingbackSource,
}

/// A single attack statistics data record. This is returned by
/// <a>DescribeAttackStatistics</a> along with a time range indicating the time
/// period that the attack statistics apply to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackStatisticsDataItem {
  /// The number of attacks detected during the time period. This is always
  /// present, but might be zero.
  @_s.JsonKey(name: 'AttackCount')
  final int attackCount;

  /// Information about the volume of attacks during the time period. If the
  /// accompanying <code>AttackCount</code> is zero, this setting might be empty.
  @_s.JsonKey(name: 'AttackVolume')
  final AttackVolume attackVolume;

  AttackStatisticsDataItem({
    @_s.required this.attackCount,
    this.attackVolume,
  });
  factory AttackStatisticsDataItem.fromJson(Map<String, dynamic> json) =>
      _$AttackStatisticsDataItemFromJson(json);
}

/// Summarizes all DDoS attacks for a specified time period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackSummary {
  /// The unique identifier (ID) of the attack.
  @_s.JsonKey(name: 'AttackId')
  final String attackId;

  /// The list of attacks for a specified time period.
  @_s.JsonKey(name: 'AttackVectors')
  final List<AttackVectorDescription> attackVectors;

  /// The end time of the attack, in Unix time in seconds. For more information
  /// see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The start time of the attack, in Unix time in seconds. For more information
  /// see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  AttackSummary({
    this.attackId,
    this.attackVectors,
    this.endTime,
    this.resourceArn,
    this.startTime,
  });
  factory AttackSummary.fromJson(Map<String, dynamic> json) =>
      _$AttackSummaryFromJson(json);
}

/// Describes the attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'VectorType')
  final String vectorType;

  AttackVectorDescription({
    @_s.required this.vectorType,
  });
  factory AttackVectorDescription.fromJson(Map<String, dynamic> json) =>
      _$AttackVectorDescriptionFromJson(json);
}

/// Information about the volume of attacks during the time period, included in
/// an <a>AttackStatisticsDataItem</a>. If the accompanying
/// <code>AttackCount</code> in the statistics object is zero, this setting
/// might be empty.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackVolume {
  /// A statistics object that uses bits per second as the unit. This is included
  /// for network level attacks.
  @_s.JsonKey(name: 'BitsPerSecond')
  final AttackVolumeStatistics bitsPerSecond;

  /// A statistics object that uses packets per second as the unit. This is
  /// included for network level attacks.
  @_s.JsonKey(name: 'PacketsPerSecond')
  final AttackVolumeStatistics packetsPerSecond;

  /// A statistics object that uses requests per second as the unit. This is
  /// included for application level attacks, and is only available for accounts
  /// that are subscribed to Shield Advanced.
  @_s.JsonKey(name: 'RequestsPerSecond')
  final AttackVolumeStatistics requestsPerSecond;

  AttackVolume({
    this.bitsPerSecond,
    this.packetsPerSecond,
    this.requestsPerSecond,
  });
  factory AttackVolume.fromJson(Map<String, dynamic> json) =>
      _$AttackVolumeFromJson(json);
}

/// Statistics objects for the various data types in <a>AttackVolume</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttackVolumeStatistics {
  /// The maximum attack volume observed for the given unit.
  @_s.JsonKey(name: 'Max')
  final double max;

  AttackVolumeStatistics({
    @_s.required this.max,
  });
  factory AttackVolumeStatistics.fromJson(Map<String, dynamic> json) =>
      _$AttackVolumeStatisticsFromJson(json);
}

enum AutoRenew {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on AutoRenew {
  String toValue() {
    switch (this) {
      case AutoRenew.enabled:
        return 'ENABLED';
      case AutoRenew.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A contributor to the attack and their contribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Contributor {
  /// The name of the contributor. This is dependent on the
  /// <code>AttackPropertyIdentifier</code>. For example, if the
  /// <code>AttackPropertyIdentifier</code> is <code>SOURCE_COUNTRY</code>, the
  /// <code>Name</code> could be <code>United States</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The contribution of this contributor expressed in <a>Protection</a> units.
  /// For example <code>10,000</code>.
  @_s.JsonKey(name: 'Value')
  final int value;

  Contributor({
    this.name,
    this.value,
  });
  factory Contributor.fromJson(Map<String, dynamic> json) =>
      _$ContributorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProtectionGroupResponse {
  CreateProtectionGroupResponse();
  factory CreateProtectionGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProtectionGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProtectionResponse {
  /// The unique identifier (ID) for the <a>Protection</a> object that is created.
  @_s.JsonKey(name: 'ProtectionId')
  final String protectionId;

  CreateProtectionResponse({
    this.protectionId,
  });
  factory CreateProtectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProtectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSubscriptionResponse {
  CreateSubscriptionResponse();
  factory CreateSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProtectionGroupResponse {
  DeleteProtectionGroupResponse();
  factory DeleteProtectionGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProtectionGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProtectionResponse {
  DeleteProtectionResponse();
  factory DeleteProtectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProtectionResponseFromJson(json);
}

@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSubscriptionResponse {
  DeleteSubscriptionResponse();
  factory DeleteSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSubscriptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAttackResponse {
  /// The attack that is described.
  @_s.JsonKey(name: 'Attack')
  final AttackDetail attack;

  DescribeAttackResponse({
    this.attack,
  });
  factory DescribeAttackResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAttackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAttackStatisticsResponse {
  /// The data that describes the attacks detected during the time period.
  @_s.JsonKey(name: 'DataItems')
  final List<AttackStatisticsDataItem> dataItems;
  @_s.JsonKey(name: 'TimeRange')
  final TimeRange timeRange;

  DescribeAttackStatisticsResponse({
    @_s.required this.dataItems,
    @_s.required this.timeRange,
  });
  factory DescribeAttackStatisticsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAttackStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDRTAccessResponse {
  /// The list of Amazon S3 buckets accessed by the DRT.
  @_s.JsonKey(name: 'LogBucketList')
  final List<String> logBucketList;

  /// The Amazon Resource Name (ARN) of the role the DRT used to access your AWS
  /// account.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  DescribeDRTAccessResponse({
    this.logBucketList,
    this.roleArn,
  });
  factory DescribeDRTAccessResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDRTAccessResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEmergencyContactSettingsResponse {
  /// A list of email addresses and phone numbers that the DDoS Response Team
  /// (DRT) can use to contact you if you have proactive engagement enabled, for
  /// escalations to the DRT and to initiate proactive customer support.
  @_s.JsonKey(name: 'EmergencyContactList')
  final List<EmergencyContact> emergencyContactList;

  DescribeEmergencyContactSettingsResponse({
    this.emergencyContactList,
  });
  factory DescribeEmergencyContactSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEmergencyContactSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProtectionGroupResponse {
  /// A grouping of protected resources that you and AWS Shield Advanced can
  /// monitor as a collective. This resource grouping improves the accuracy of
  /// detection and reduces false positives.
  @_s.JsonKey(name: 'ProtectionGroup')
  final ProtectionGroup protectionGroup;

  DescribeProtectionGroupResponse({
    @_s.required this.protectionGroup,
  });
  factory DescribeProtectionGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProtectionGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProtectionResponse {
  /// The <a>Protection</a> object that is described.
  @_s.JsonKey(name: 'Protection')
  final Protection protection;

  DescribeProtectionResponse({
    this.protection,
  });
  factory DescribeProtectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProtectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSubscriptionResponse {
  /// The AWS Shield Advanced subscription details for an account.
  @_s.JsonKey(name: 'Subscription')
  final Subscription subscription;

  DescribeSubscriptionResponse({
    this.subscription,
  });
  factory DescribeSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSubscriptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableProactiveEngagementResponse {
  DisableProactiveEngagementResponse();
  factory DisableProactiveEngagementResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableProactiveEngagementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDRTLogBucketResponse {
  DisassociateDRTLogBucketResponse();
  factory DisassociateDRTLogBucketResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateDRTLogBucketResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDRTRoleResponse {
  DisassociateDRTRoleResponse();
  factory DisassociateDRTRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateDRTRoleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateHealthCheckResponse {
  DisassociateHealthCheckResponse();
  factory DisassociateHealthCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateHealthCheckResponseFromJson(json);
}

/// Contact information that the DRT can use to contact you if you have
/// proactive engagement enabled, for escalations to the DRT and to initiate
/// proactive customer support.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmergencyContact {
  /// The email address for the contact.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// Additional notes regarding the contact.
  @_s.JsonKey(name: 'ContactNotes')
  final String contactNotes;

  /// The phone number for the contact.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  EmergencyContact({
    @_s.required this.emailAddress,
    this.contactNotes,
    this.phoneNumber,
  });
  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableProactiveEngagementResponse {
  EnableProactiveEngagementResponse();
  factory EnableProactiveEngagementResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableProactiveEngagementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSubscriptionStateResponse {
  /// The status of the subscription.
  @_s.JsonKey(name: 'SubscriptionState')
  final SubscriptionState subscriptionState;

  GetSubscriptionStateResponse({
    @_s.required this.subscriptionState,
  });
  factory GetSubscriptionStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubscriptionStateResponseFromJson(json);
}

/// Specifies how many protections of a given type you can create.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Limit {
  /// The maximum number of protections that can be created for the specified
  /// <code>Type</code>.
  @_s.JsonKey(name: 'Max')
  final int max;

  /// The type of protection.
  @_s.JsonKey(name: 'Type')
  final String type;

  Limit({
    this.max,
    this.type,
  });
  factory Limit.fromJson(Map<String, dynamic> json) => _$LimitFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAttacksResponse {
  /// The attack information for the specified time range.
  @_s.JsonKey(name: 'AttackSummaries')
  final List<AttackSummary> attackSummaries;

  /// The token returned by a previous call to indicate that there is more data
  /// available. If not null, more results are available. Pass this value for the
  /// <code>NextMarker</code> parameter in a subsequent call to
  /// <code>ListAttacks</code> to retrieve the next set of items.
  ///
  /// Shield Advanced might return the list of <a>AttackSummary</a> objects in
  /// batches smaller than the number specified by MaxResults. If there are more
  /// attack summary objects to return, Shield Advanced will always also return a
  /// <code>NextToken</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAttacksResponse({
    this.attackSummaries,
    this.nextToken,
  });
  factory ListAttacksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAttacksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProtectionGroupsResponse {
  /// <p/>
  @_s.JsonKey(name: 'ProtectionGroups')
  final List<ProtectionGroup> protectionGroups;

  /// If you specify a value for <code>MaxResults</code> and you have more
  /// protection groups than the value of MaxResults, AWS Shield Advanced returns
  /// this token that you can use in your next request, to get the next batch of
  /// objects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProtectionGroupsResponse({
    @_s.required this.protectionGroups,
    this.nextToken,
  });
  factory ListProtectionGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProtectionGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProtectionsResponse {
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// Protections than the value of MaxResults, AWS Shield Advanced returns a
  /// NextToken value in the response that allows you to list another group of
  /// Protections. For the second and subsequent ListProtections requests, specify
  /// the value of NextToken from the previous response to get information about
  /// another batch of Protections.
  ///
  /// Shield Advanced might return the list of <a>Protection</a> objects in
  /// batches smaller than the number specified by MaxResults. If there are more
  /// <a>Protection</a> objects to return, Shield Advanced will always also return
  /// a <code>NextToken</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The array of enabled <a>Protection</a> objects.
  @_s.JsonKey(name: 'Protections')
  final List<Protection> protections;

  ListProtectionsResponse({
    this.nextToken,
    this.protections,
  });
  factory ListProtectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProtectionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesInProtectionGroupResponse {
  /// The Amazon Resource Names (ARNs) of the resources that are included in the
  /// protection group.
  @_s.JsonKey(name: 'ResourceArns')
  final List<String> resourceArns;

  /// If you specify a value for <code>MaxResults</code> and you have more
  /// resources in the protection group than the value of MaxResults, AWS Shield
  /// Advanced returns this token that you can use in your next request, to get
  /// the next batch of objects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListResourcesInProtectionGroupResponse({
    @_s.required this.resourceArns,
    this.nextToken,
  });
  factory ListResourcesInProtectionGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResourcesInProtectionGroupResponseFromJson(json);
}

/// The mitigation applied to a DDoS attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Mitigation {
  /// The name of the mitigation taken for this attack.
  @_s.JsonKey(name: 'MitigationName')
  final String mitigationName;

  Mitigation({
    this.mitigationName,
  });
  factory Mitigation.fromJson(Map<String, dynamic> json) =>
      _$MitigationFromJson(json);
}

enum ProactiveEngagementStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('PENDING')
  pending,
}

enum ProtectedResourceType {
  @_s.JsonValue('CLOUDFRONT_DISTRIBUTION')
  cloudfrontDistribution,
  @_s.JsonValue('ROUTE_53_HOSTED_ZONE')
  route_53HostedZone,
  @_s.JsonValue('ELASTIC_IP_ALLOCATION')
  elasticIpAllocation,
  @_s.JsonValue('CLASSIC_LOAD_BALANCER')
  classicLoadBalancer,
  @_s.JsonValue('APPLICATION_LOAD_BALANCER')
  applicationLoadBalancer,
  @_s.JsonValue('GLOBAL_ACCELERATOR')
  globalAccelerator,
}

extension on ProtectedResourceType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that represents a resource that is under DDoS protection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Protection {
  /// The unique identifier (ID) for the Route 53 health check that's associated
  /// with the protection.
  @_s.JsonKey(name: 'HealthCheckIds')
  final List<String> healthCheckIds;

  /// The unique identifier (ID) of the protection.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the protection. For example, <code>My CloudFront
  /// distributions</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN (Amazon Resource Name) of the AWS resource that is protected.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  Protection({
    this.healthCheckIds,
    this.id,
    this.name,
    this.resourceArn,
  });
  factory Protection.fromJson(Map<String, dynamic> json) =>
      _$ProtectionFromJson(json);
}

/// A grouping of protected resources that you and AWS Shield Advanced can
/// monitor as a collective. This resource grouping improves the accuracy of
/// detection and reduces false positives.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectionGroup {
  /// Defines how AWS Shield combines resource data for the group in order to
  /// detect, mitigate, and report events.
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
  /// in a non-uniform way. Examples include CloudFront distributions and origin
  /// resources for CloudFront distributions.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Aggregation')
  final ProtectionGroupAggregation aggregation;

  /// The Amazon Resource Names (ARNs) of the resources to include in the
  /// protection group. You must set this when you set <code>Pattern</code> to
  /// <code>ARBITRARY</code> and you must not set it for any other
  /// <code>Pattern</code> setting.
  @_s.JsonKey(name: 'Members')
  final List<String> members;

  /// The criteria to use to choose the protected resources for inclusion in the
  /// group. You can include all resources that have protections, provide a list
  /// of resource Amazon Resource Names (ARNs), or include all resources of a
  /// specified resource type.
  @_s.JsonKey(name: 'Pattern')
  final ProtectionGroupPattern pattern;

  /// The name of the protection group. You use this to identify the protection
  /// group in lists and to manage the protection group, for example to update,
  /// delete, or describe it.
  @_s.JsonKey(name: 'ProtectionGroupId')
  final String protectionGroupId;

  /// The resource type to include in the protection group. All protected
  /// resources of this type are included in the protection group. You must set
  /// this when you set <code>Pattern</code> to <code>BY_RESOURCE_TYPE</code> and
  /// you must not set it for any other <code>Pattern</code> setting.
  @_s.JsonKey(name: 'ResourceType')
  final ProtectedResourceType resourceType;

  ProtectionGroup({
    @_s.required this.aggregation,
    @_s.required this.members,
    @_s.required this.pattern,
    @_s.required this.protectionGroupId,
    this.resourceType,
  });
  factory ProtectionGroup.fromJson(Map<String, dynamic> json) =>
      _$ProtectionGroupFromJson(json);
}

enum ProtectionGroupAggregation {
  @_s.JsonValue('SUM')
  sum,
  @_s.JsonValue('MEAN')
  mean,
  @_s.JsonValue('MAX')
  max,
}

extension on ProtectionGroupAggregation {
  String toValue() {
    switch (this) {
      case ProtectionGroupAggregation.sum:
        return 'SUM';
      case ProtectionGroupAggregation.mean:
        return 'MEAN';
      case ProtectionGroupAggregation.max:
        return 'MAX';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Limits settings on protection groups with arbitrary pattern type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectionGroupArbitraryPatternLimits {
  /// The maximum number of resources you can specify for a single arbitrary
  /// pattern in a protection group.
  @_s.JsonKey(name: 'MaxMembers')
  final int maxMembers;

  ProtectionGroupArbitraryPatternLimits({
    @_s.required this.maxMembers,
  });
  factory ProtectionGroupArbitraryPatternLimits.fromJson(
          Map<String, dynamic> json) =>
      _$ProtectionGroupArbitraryPatternLimitsFromJson(json);
}

/// Limits settings on protection groups for your subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectionGroupLimits {
  /// The maximum number of protection groups that you can have at one time.
  @_s.JsonKey(name: 'MaxProtectionGroups')
  final int maxProtectionGroups;

  /// Limits settings by pattern type in the protection groups for your
  /// subscription.
  @_s.JsonKey(name: 'PatternTypeLimits')
  final ProtectionGroupPatternTypeLimits patternTypeLimits;

  ProtectionGroupLimits({
    @_s.required this.maxProtectionGroups,
    @_s.required this.patternTypeLimits,
  });
  factory ProtectionGroupLimits.fromJson(Map<String, dynamic> json) =>
      _$ProtectionGroupLimitsFromJson(json);
}

enum ProtectionGroupPattern {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ARBITRARY')
  arbitrary,
  @_s.JsonValue('BY_RESOURCE_TYPE')
  byResourceType,
}

extension on ProtectionGroupPattern {
  String toValue() {
    switch (this) {
      case ProtectionGroupPattern.all:
        return 'ALL';
      case ProtectionGroupPattern.arbitrary:
        return 'ARBITRARY';
      case ProtectionGroupPattern.byResourceType:
        return 'BY_RESOURCE_TYPE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Limits settings by pattern type in the protection groups for your
/// subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectionGroupPatternTypeLimits {
  /// Limits settings on protection groups with arbitrary pattern type.
  @_s.JsonKey(name: 'ArbitraryPatternLimits')
  final ProtectionGroupArbitraryPatternLimits arbitraryPatternLimits;

  ProtectionGroupPatternTypeLimits({
    @_s.required this.arbitraryPatternLimits,
  });
  factory ProtectionGroupPatternTypeLimits.fromJson(
          Map<String, dynamic> json) =>
      _$ProtectionGroupPatternTypeLimitsFromJson(json);
}

/// Limits settings on protections for your subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProtectionLimits {
  /// The maximum number of resource types that you can specify in a protection.
  @_s.JsonKey(name: 'ProtectedResourceTypeLimits')
  final List<Limit> protectedResourceTypeLimits;

  ProtectionLimits({
    @_s.required this.protectedResourceTypeLimits,
  });
  factory ProtectionLimits.fromJson(Map<String, dynamic> json) =>
      _$ProtectionLimitsFromJson(json);
}

/// The attack information for the specified SubResource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubResourceSummary {
  /// The list of attack types and associated counters.
  @_s.JsonKey(name: 'AttackVectors')
  final List<SummarizedAttackVector> attackVectors;

  /// The counters that describe the details of the attack.
  @_s.JsonKey(name: 'Counters')
  final List<SummarizedCounter> counters;

  /// The unique identifier (ID) of the <code>SubResource</code>.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The <code>SubResource</code> type.
  @_s.JsonKey(name: 'Type')
  final SubResourceType type;

  SubResourceSummary({
    this.attackVectors,
    this.counters,
    this.id,
    this.type,
  });
  factory SubResourceSummary.fromJson(Map<String, dynamic> json) =>
      _$SubResourceSummaryFromJson(json);
}

enum SubResourceType {
  @_s.JsonValue('IP')
  ip,
  @_s.JsonValue('URL')
  url,
}

/// Information about the AWS Shield Advanced subscription for an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Subscription {
  /// Limits settings for your subscription.
  @_s.JsonKey(name: 'SubscriptionLimits')
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
  @_s.JsonKey(name: 'AutoRenew')
  final AutoRenew autoRenew;

  /// The date and time your subscription will end.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Specifies how many protections of a given type you can create.
  @_s.JsonKey(name: 'Limits')
  final List<Limit> limits;

  /// If <code>ENABLED</code>, the DDoS Response Team (DRT) will use email and
  /// phone to notify contacts about escalations to the DRT and to initiate
  /// proactive customer support.
  ///
  /// If <code>PENDING</code>, you have requested proactive engagement and the
  /// request is pending. The status changes to <code>ENABLED</code> when your
  /// request is fully processed.
  ///
  /// If <code>DISABLED</code>, the DRT will not proactively notify contacts about
  /// escalations or to initiate proactive customer support.
  @_s.JsonKey(name: 'ProactiveEngagementStatus')
  final ProactiveEngagementStatus proactiveEngagementStatus;

  /// The start time of the subscription, in Unix time in seconds. For more
  /// information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The length, in seconds, of the AWS Shield Advanced subscription for the
  /// account.
  @_s.JsonKey(name: 'TimeCommitmentInSeconds')
  final int timeCommitmentInSeconds;

  Subscription({
    @_s.required this.subscriptionLimits,
    this.autoRenew,
    this.endTime,
    this.limits,
    this.proactiveEngagementStatus,
    this.startTime,
    this.timeCommitmentInSeconds,
  });
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

/// Limits settings for your subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubscriptionLimits {
  /// Limits settings on protection groups for your subscription.
  @_s.JsonKey(name: 'ProtectionGroupLimits')
  final ProtectionGroupLimits protectionGroupLimits;

  /// Limits settings on protections for your subscription.
  @_s.JsonKey(name: 'ProtectionLimits')
  final ProtectionLimits protectionLimits;

  SubscriptionLimits({
    @_s.required this.protectionGroupLimits,
    @_s.required this.protectionLimits,
  });
  factory SubscriptionLimits.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionLimitsFromJson(json);
}

enum SubscriptionState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

/// A summary of information about the attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SummarizedAttackVector {
  /// The attack type, for example, SNMP reflection or SYN flood.
  @_s.JsonKey(name: 'VectorType')
  final String vectorType;

  /// The list of counters that describe the details of the attack.
  @_s.JsonKey(name: 'VectorCounters')
  final List<SummarizedCounter> vectorCounters;

  SummarizedAttackVector({
    @_s.required this.vectorType,
    this.vectorCounters,
  });
  factory SummarizedAttackVector.fromJson(Map<String, dynamic> json) =>
      _$SummarizedAttackVectorFromJson(json);
}

/// The counter that describes a DDoS attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SummarizedCounter {
  /// The average value of the counter for a specified time period.
  @_s.JsonKey(name: 'Average')
  final double average;

  /// The maximum value of the counter for a specified time period.
  @_s.JsonKey(name: 'Max')
  final double max;

  /// The number of counters for a specified time period.
  @_s.JsonKey(name: 'N')
  final int n;

  /// The counter name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The total of counter values for a specified time period.
  @_s.JsonKey(name: 'Sum')
  final double sum;

  /// The unit of the counters.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  SummarizedCounter({
    this.average,
    this.max,
    this.n,
    this.name,
    this.sum,
    this.unit,
  });
  factory SummarizedCounter.fromJson(Map<String, dynamic> json) =>
      _$SummarizedCounterFromJson(json);
}

/// The time range.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeRange {
  /// The start time, in Unix time in seconds. For more information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FromInclusive')
  final DateTime fromInclusive;

  /// The end time, in Unix time in seconds. For more information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ToExclusive')
  final DateTime toExclusive;

  TimeRange({
    this.fromInclusive,
    this.toExclusive,
  });
  factory TimeRange.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}

enum Unit {
  @_s.JsonValue('BITS')
  bits,
  @_s.JsonValue('BYTES')
  bytes,
  @_s.JsonValue('PACKETS')
  packets,
  @_s.JsonValue('REQUESTS')
  requests,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEmergencyContactSettingsResponse {
  UpdateEmergencyContactSettingsResponse();
  factory UpdateEmergencyContactSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateEmergencyContactSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProtectionGroupResponse {
  UpdateProtectionGroupResponse();
  factory UpdateProtectionGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProtectionGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSubscriptionResponse {
  UpdateSubscriptionResponse();
  factory UpdateSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubscriptionResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccessDeniedForDependencyException extends _s.GenericAwsException {
  AccessDeniedForDependencyException({String type, String message})
      : super(
            type: type,
            code: 'AccessDeniedForDependencyException',
            message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidResourceException extends _s.GenericAwsException {
  InvalidResourceException({String type, String message})
      : super(type: type, code: 'InvalidResourceException', message: message);
}

class LimitsExceededException extends _s.GenericAwsException {
  LimitsExceededException({String type, String message})
      : super(type: type, code: 'LimitsExceededException', message: message);
}

class LockedSubscriptionException extends _s.GenericAwsException {
  LockedSubscriptionException({String type, String message})
      : super(
            type: type, code: 'LockedSubscriptionException', message: message);
}

class NoAssociatedRoleException extends _s.GenericAwsException {
  NoAssociatedRoleException({String type, String message})
      : super(type: type, code: 'NoAssociatedRoleException', message: message);
}

class OptimisticLockException extends _s.GenericAwsException {
  OptimisticLockException({String type, String message})
      : super(type: type, code: 'OptimisticLockException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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
