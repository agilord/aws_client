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
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'shield-2016-06-02.g.dart';

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
          service: 'shield',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Authorizes the DDoS Response team (DRT) to access the specified Amazon S3
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

  /// Authorizes the DDoS Response team (DRT), using the specified role, to
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

  /// Activates AWS Shield Advanced for an account.
  ///
  /// As part of this request you can specify <code>EmergencySettings</code>
  /// that automaticaly grant the DDoS response team (DRT) needed permissions to
  /// assist you during a suspected DDoS attack. For more information see <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/authorize-DRT.html">Authorize
  /// the DDoS Response Team to Create Rules and Web ACLs on Your Behalf</a>.
  ///
  /// To use the services of the DRT, you must be subscribed to the <a
  /// href="https://aws.amazon.com/premiumsupport/business-support/">Business
  /// Support plan</a> or the <a
  /// href="https://aws.amazon.com/premiumsupport/enterprise-support/">Enterprise
  /// Support plan</a>.
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

  /// Returns the current role and list of Amazon S3 log buckets used by the
  /// DDoS Response team (DRT) to access your AWS account while assisting with
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

  /// Lists the email addresses that the DRT can use to contact you during a
  /// suspected attack.
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
        'ProtectionId': protectionId,
        'ResourceArn': resourceArn,
      },
    );

    return DescribeProtectionResponse.fromJson(jsonResponse.body);
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

  /// Removes the DDoS Response team's (DRT) access to the specified Amazon S3
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

  /// Removes the DDoS Response team's (DRT) access to your AWS account.
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
  /// The maximum number of <a>AttackSummary</a> objects to be returned. If this
  /// is left blank, the first 20 results will be returned.
  ///
  /// This is a maximum value; it is possible that AWS WAF will return the
  /// results in smaller batches. That is, the number of <a>AttackSummary</a>
  /// objects returned could be less than <code>MaxResults</code>, even if there
  /// are still more <a>AttackSummary</a> objects yet to return. If there are
  /// more <a>AttackSummary</a> objects to return, AWS WAF will always also
  /// return a <code>NextToken</code>.
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
        'EndTime': endTime,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ResourceArns': resourceArns,
        'StartTime': startTime,
      },
    );

    return ListAttacksResponse.fromJson(jsonResponse.body);
  }

  /// Lists all <a>Protection</a> objects for the account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidPaginationTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <a>Protection</a> objects to be returned. If this is
  /// left blank the first 20 results will be returned.
  ///
  /// This is a maximum value; it is possible that AWS WAF will return the
  /// results in smaller batches. That is, the number of <a>Protection</a>
  /// objects returned could be less than <code>MaxResults</code>, even if there
  /// are still more <a>Protection</a> objects yet to return. If there are more
  /// <a>Protection</a> objects to return, AWS WAF will always also return a
  /// <code>NextToken</code>.
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListProtectionsResponse.fromJson(jsonResponse.body);
  }

  /// Updates the details of the list of email addresses that the DRT can use to
  /// contact you during a suspected attack.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [OptimisticLockException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [emergencyContactList] :
  /// A list of email addresses that the DRT can use to contact you during a
  /// suspected attack.
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
        'EmergencyContactList': emergencyContactList,
      },
    );

    return UpdateEmergencyContactSettingsResponse.fromJson(jsonResponse.body);
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
        'AutoRenew': autoRenew.toValue(),
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
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
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
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
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

  /// The array of <a>Contributor</a> objects that includes the top five
  /// contributors to an attack.
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
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The start time of the attack, in Unix time in seconds. For more information
  /// see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
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
  /// A list of email addresses that the DRT can use to contact you during a
  /// suspected attack.
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

/// Contact information that the DRT can use to contact you during a suspected
/// attack.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmergencyContact {
  /// An email address that the DRT can use to contact you during a suspected
  /// attack.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  EmergencyContact({
    @_s.required this.emailAddress,
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
  /// AWS WAF might return the list of <a>AttackSummary</a> objects in batches
  /// smaller than the number specified by MaxResults. If there are more
  /// <a>AttackSummary</a> objects to return, AWS WAF will always also return a
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
class ListProtectionsResponse {
  /// If you specify a value for <code>MaxResults</code> and you have more
  /// Protections than the value of MaxResults, AWS Shield Advanced returns a
  /// NextToken value in the response that allows you to list another group of
  /// Protections. For the second and subsequent ListProtections requests, specify
  /// the value of NextToken from the previous response to get information about
  /// another batch of Protections.
  ///
  /// AWS WAF might return the list of <a>Protection</a> objects in batches
  /// smaller than the number specified by MaxResults. If there are more
  /// <a>Protection</a> objects to return, AWS WAF will always also return a
  /// <code>NextToken</code>.
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

  /// The friendly name of the protection. For example, <code>My CloudFront
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
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// Specifies how many protections of a given type you can create.
  @_s.JsonKey(name: 'Limits')
  final List<Limit> limits;

  /// The start time of the subscription, in Unix time in seconds. For more
  /// information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// The length, in seconds, of the AWS Shield Advanced subscription for the
  /// account.
  @_s.JsonKey(name: 'TimeCommitmentInSeconds')
  final int timeCommitmentInSeconds;

  Subscription({
    this.autoRenew,
    this.endTime,
    this.limits,
    this.startTime,
    this.timeCommitmentInSeconds,
  });
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
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
    createFactory: false,
    createToJson: true)
class TimeRange {
  /// The start time, in Unix time in seconds. For more information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @_s.JsonKey(name: 'FromInclusive', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime fromInclusive;

  /// The end time, in Unix time in seconds. For more information see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.
  @_s.JsonKey(name: 'ToExclusive', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime toExclusive;

  TimeRange({
    this.fromInclusive,
    this.toExclusive,
  });
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
