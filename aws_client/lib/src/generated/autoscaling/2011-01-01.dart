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

import '2011-01-01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2011-01-01.g.dart';

/// Amazon EC2 Auto Scaling is designed to automatically launch or terminate EC2
/// instances based on user-defined scaling policies, scheduled actions, and
/// health checks. Use this service with AWS Auto Scaling, Amazon CloudWatch,
/// and Elastic Load Balancing.
class AutoScaling {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  AutoScaling({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'autoscaling',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Attaches one or more EC2 instances to the specified Auto Scaling group.
  ///
  /// When you attach instances, Amazon EC2 Auto Scaling increases the desired
  /// capacity of the group by the number of instances being attached. If the
  /// number of instances being attached plus the desired capacity of the group
  /// exceeds the maximum size of the group, the operation fails.
  ///
  /// If there is a Classic Load Balancer attached to your Auto Scaling group,
  /// the instances are also registered with the load balancer. If there are
  /// target groups attached to your Auto Scaling group, the instances are also
  /// registered with the target groups.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html">Attach
  /// EC2 instances to your Auto Scaling group</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances. You can specify up to 20 instances.
  Future<void> attachInstances({
    @_s.required String autoScalingGroupName,
    List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    instanceIds?.also((arg) => $request['InstanceIds'] = arg);
    await _protocol.send(
      $request,
      action: 'AttachInstances',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachInstancesQuery'],
      shapes: shapes,
    );
  }

  /// Attaches one or more target groups to the specified Auto Scaling group.
  ///
  /// This operation is used with the following load balancer types:
  ///
  /// <ul>
  /// <li>
  /// Application Load Balancer - Operates at the application layer (layer 7)
  /// and supports HTTP and HTTPS.
  /// </li>
  /// <li>
  /// Network Load Balancer - Operates at the transport layer (layer 4) and
  /// supports TCP, TLS, and UDP.
  /// </li>
  /// <li>
  /// Gateway Load Balancer - Operates at the network layer (layer 3).
  /// </li>
  /// </ul>
  /// To describe the target groups for an Auto Scaling group, call the
  /// <a>DescribeLoadBalancerTargetGroups</a> API. To detach the target group
  /// from the Auto Scaling group, call the
  /// <a>DetachLoadBalancerTargetGroups</a> API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Elastic
  /// Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [targetGroupARNs] :
  /// The Amazon Resource Names (ARN) of the target groups. You can specify up
  /// to 10 target groups. To get the ARN of a target group, use the Elastic
  /// Load Balancing <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a>
  /// API operation.
  Future<void> attachLoadBalancerTargetGroups({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> targetGroupARNs,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetGroupARNs, 'targetGroupARNs');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['TargetGroupARNs'] = targetGroupARNs;
    await _protocol.send(
      $request,
      action: 'AttachLoadBalancerTargetGroups',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachLoadBalancerTargetGroupsType'],
      shapes: shapes,
      resultWrapper: 'AttachLoadBalancerTargetGroupsResult',
    );
  }

  /// <note>
  /// To attach an Application Load Balancer, Network Load Balancer, or Gateway
  /// Load Balancer, use the <a>AttachLoadBalancerTargetGroups</a> API operation
  /// instead.
  /// </note>
  /// Attaches one or more Classic Load Balancers to the specified Auto Scaling
  /// group. Amazon EC2 Auto Scaling registers the running instances with these
  /// Classic Load Balancers.
  ///
  /// To describe the load balancers for an Auto Scaling group, call the
  /// <a>DescribeLoadBalancers</a> API. To detach the load balancer from the
  /// Auto Scaling group, call the <a>DetachLoadBalancers</a> API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Elastic
  /// Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [loadBalancerNames] :
  /// The names of the load balancers. You can specify up to 10 load balancers.
  Future<void> attachLoadBalancers({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> loadBalancerNames,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerNames, 'loadBalancerNames');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LoadBalancerNames'] = loadBalancerNames;
    await _protocol.send(
      $request,
      action: 'AttachLoadBalancers',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachLoadBalancersType'],
      shapes: shapes,
      resultWrapper: 'AttachLoadBalancersResult',
    );
  }

  /// Deletes one or more scheduled actions for the specified Auto Scaling
  /// group.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scheduledActionNames] :
  /// The names of the scheduled actions to delete. The maximum number allowed
  /// is 50.
  Future<BatchDeleteScheduledActionAnswer> batchDeleteScheduledAction({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> scheduledActionNames,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scheduledActionNames, 'scheduledActionNames');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ScheduledActionNames'] = scheduledActionNames;
    final $result = await _protocol.send(
      $request,
      action: 'BatchDeleteScheduledAction',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchDeleteScheduledActionType'],
      shapes: shapes,
      resultWrapper: 'BatchDeleteScheduledActionResult',
    );
    return BatchDeleteScheduledActionAnswer.fromXml($result);
  }

  /// Creates or updates one or more scheduled scaling actions for an Auto
  /// Scaling group. If you leave a parameter unspecified when updating a
  /// scheduled scaling action, the corresponding value remains unchanged.
  ///
  /// May throw [AlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scheduledUpdateGroupActions] :
  /// One or more scheduled actions. The maximum number allowed is 50.
  Future<BatchPutScheduledUpdateGroupActionAnswer>
      batchPutScheduledUpdateGroupAction({
    @_s.required String autoScalingGroupName,
    @_s.required
        List<ScheduledUpdateGroupActionRequest> scheduledUpdateGroupActions,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        scheduledUpdateGroupActions, 'scheduledUpdateGroupActions');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ScheduledUpdateGroupActions'] = scheduledUpdateGroupActions;
    final $result = await _protocol.send(
      $request,
      action: 'BatchPutScheduledUpdateGroupAction',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['BatchPutScheduledUpdateGroupActionType'],
      shapes: shapes,
      resultWrapper: 'BatchPutScheduledUpdateGroupActionResult',
    );
    return BatchPutScheduledUpdateGroupActionAnswer.fromXml($result);
  }

  /// Cancels an instance refresh operation in progress. Cancellation does not
  /// roll back any replacements that have already been completed, but it
  /// prevents new replacements from being started.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">Replacing
  /// Auto Scaling Instances Based on an Instance Refresh</a>.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ActiveInstanceRefreshNotFoundFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  Future<CancelInstanceRefreshAnswer> cancelInstanceRefresh({
    @_s.required String autoScalingGroupName,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    final $result = await _protocol.send(
      $request,
      action: 'CancelInstanceRefresh',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CancelInstanceRefreshType'],
      shapes: shapes,
      resultWrapper: 'CancelInstanceRefreshResult',
    );
    return CancelInstanceRefreshAnswer.fromXml($result);
  }

  /// Completes the lifecycle action for the specified token or instance with
  /// the specified result.
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  /// <ol>
  /// <li>
  /// (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  /// </li>
  /// <li>
  /// (Optional) Create a notification target and an IAM role. The target can be
  /// either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon
  /// EC2 Auto Scaling to publish lifecycle notifications to the target.
  /// </li>
  /// <li>
  /// Create the lifecycle hook. Specify whether the hook is used when the
  /// instances launch or terminate.
  /// </li>
  /// <li>
  /// If you need more time, record the lifecycle action heartbeat to keep the
  /// instance in a pending state.
  /// </li>
  /// <li>
  /// <b>If you finish before the timeout period ends, complete the lifecycle
  /// action.</b>
  /// </li> </ol>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon
  /// EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [lifecycleActionResult] :
  /// The action for the group to take. This parameter can be either
  /// <code>CONTINUE</code> or <code>ABANDON</code>.
  ///
  /// Parameter [lifecycleHookName] :
  /// The name of the lifecycle hook.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [lifecycleActionToken] :
  /// A universally unique identifier (UUID) that identifies a specific
  /// lifecycle action associated with an instance. Amazon EC2 Auto Scaling
  /// sends this token to the notification target you specified when you created
  /// the lifecycle hook.
  Future<void> completeLifecycleAction({
    @_s.required String autoScalingGroupName,
    @_s.required String lifecycleActionResult,
    @_s.required String lifecycleHookName,
    String instanceId,
    String lifecycleActionToken,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lifecycleActionResult, 'lifecycleActionResult');
    ArgumentError.checkNotNull(lifecycleHookName, 'lifecycleHookName');
    _s.validateStringLength(
      'lifecycleHookName',
      lifecycleHookName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lifecycleHookName',
      lifecycleHookName,
      r'''[A-Za-z0-9\-_\/]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'lifecycleActionToken',
      lifecycleActionToken,
      36,
      36,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LifecycleActionResult'] = lifecycleActionResult;
    $request['LifecycleHookName'] = lifecycleHookName;
    instanceId?.also((arg) => $request['InstanceId'] = arg);
    lifecycleActionToken?.also((arg) => $request['LifecycleActionToken'] = arg);
    await _protocol.send(
      $request,
      action: 'CompleteLifecycleAction',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CompleteLifecycleActionType'],
      shapes: shapes,
      resultWrapper: 'CompleteLifecycleActionResult',
    );
  }

  /// Creates an Auto Scaling group with the specified name and attributes.
  ///
  /// If you exceed your maximum limit of Auto Scaling groups, the call fails.
  /// To query this limit, call the <a>DescribeAccountLimits</a> API. For
  /// information about updating this limit, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html">Amazon
  /// EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// For introductory exercises for creating an Auto Scaling group, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html">Getting
  /// started with Amazon EC2 Auto Scaling</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html">Tutorial:
  /// Set up a scaled and load-balanced application</a> in the <i>Amazon EC2
  /// Auto Scaling User Guide</i>. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html">Auto
  /// Scaling groups</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Every Auto Scaling group has three size parameters
  /// (<code>DesiredCapacity</code>, <code>MaxSize</code>, and
  /// <code>MinSize</code>). Usually, you set these sizes based on a specific
  /// number of instances. However, if you configure a mixed instances policy
  /// that defines weights for the instance types, you must specify these sizes
  /// with the same units that you use for weighting instances.
  ///
  /// May throw [AlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group. This name must be unique per Region
  /// per account.
  ///
  /// Parameter [maxSize] :
  /// The maximum size of the group.
  /// <note>
  /// With a mixed instances policy that uses instance weighting, Amazon EC2
  /// Auto Scaling may need to go above <code>MaxSize</code> to meet your
  /// capacity requirements. In this event, Amazon EC2 Auto Scaling will never
  /// go above <code>MaxSize</code> by more than your largest instance weight
  /// (weights that define how many units each instance contributes to the
  /// desired capacity of the group).
  /// </note>
  ///
  /// Parameter [minSize] :
  /// The minimum size of the group.
  ///
  /// Parameter [availabilityZones] :
  /// A list of Availability Zones where instances in the Auto Scaling group can
  /// be created. This parameter is optional if you specify one or more subnets
  /// for <code>VPCZoneIdentifier</code>.
  ///
  /// Conditional: If your account supports EC2-Classic and VPC, this parameter
  /// is required to launch instances into EC2-Classic.
  ///
  /// Parameter [capacityRebalance] :
  /// Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity
  /// Rebalancing is disabled. When you turn on Capacity Rebalancing, Amazon EC2
  /// Auto Scaling attempts to launch a Spot Instance whenever Amazon EC2
  /// notifies that a Spot Instance is at an elevated risk of interruption.
  /// After launching a new instance, it then terminates an old instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/capacity-rebalance.html">Amazon
  /// EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [defaultCooldown] :
  /// The amount of time, in seconds, after a scaling activity completes before
  /// another scaling activity can start. The default value is <code>300</code>.
  /// This setting applies when using simple scaling policies, but not when
  /// using other scaling policies or scheduled scaling. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling
  /// cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [desiredCapacity] :
  /// The desired capacity is the initial capacity of the Auto Scaling group at
  /// the time of its creation and the capacity it attempts to maintain. It can
  /// scale beyond this capacity if you configure auto scaling. This number must
  /// be greater than or equal to the minimum size of the group and less than or
  /// equal to the maximum size of the group. If you do not specify a desired
  /// capacity, the default is the minimum size of the group.
  ///
  /// Parameter [healthCheckGracePeriod] :
  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before
  /// checking the health status of an EC2 instance that has come into service.
  /// During this time, any health check failures for the instance are ignored.
  /// The default value is <code>0</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period">Health
  /// check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Conditional: Required if you are adding an <code>ELB</code> health check.
  ///
  /// Parameter [healthCheckType] :
  /// The service to use for the health checks. The valid values are
  /// <code>EC2</code> (default) and <code>ELB</code>. If you configure an Auto
  /// Scaling group to use load balancer (ELB) health checks, it considers the
  /// instance unhealthy if it fails either the EC2 status checks or the load
  /// balancer health checks. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html">Health
  /// checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance used to base the launch configuration on. If
  /// specified, Amazon EC2 Auto Scaling uses the configuration values from the
  /// specified instance to create a new launch configuration. To get the
  /// instance ID, use the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a>
  /// API operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html">Creating
  /// an Auto Scaling group using an EC2 instance</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [launchConfigurationName] :
  /// The name of the launch configuration to use to launch instances.
  ///
  /// Conditional: You must specify either a launch template
  /// (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a
  /// launch configuration (<code>LaunchConfigurationName</code> or
  /// <code>InstanceId</code>).
  ///
  /// Parameter [launchTemplate] :
  /// Parameters used to specify the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-launchtemplate.html">launch
  /// template</a> and version to use to launch instances.
  ///
  /// Conditional: You must specify either a launch template
  /// (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a
  /// launch configuration (<code>LaunchConfigurationName</code> or
  /// <code>InstanceId</code>).
  /// <note>
  /// The launch template that is specified must be configured for use with an
  /// Auto Scaling group. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html">Creating
  /// a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  /// </note>
  ///
  /// Parameter [lifecycleHookSpecificationList] :
  /// One or more lifecycle hooks for the group, which specify actions to
  /// perform when Amazon EC2 Auto Scaling launches or terminates instances.
  ///
  /// Parameter [loadBalancerNames] :
  /// A list of Classic Load Balancers associated with this Auto Scaling group.
  /// For Application Load Balancers, Network Load Balancers, and Gateway Load
  /// Balancers, specify the <code>TargetGroupARNs</code> property instead.
  ///
  /// Parameter [maxInstanceLifetime] :
  /// The maximum amount of time, in seconds, that an instance can be in
  /// service. The default is null. If specified, the value must be either 0 or
  /// a number equal to or greater than 86,400 seconds (1 day). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html">Replacing
  /// Auto Scaling instances based on maximum instance lifetime</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [mixedInstancesPolicy] :
  /// An embedded object that specifies a mixed instances policy. The required
  /// parameters must be specified. If optional parameters are unspecified,
  /// their default values are used.
  ///
  /// The policy includes parameters that not only define the distribution of
  /// On-Demand Instances and Spot Instances, the maximum price to pay for Spot
  /// Instances, and how the Auto Scaling group allocates instance types to
  /// fulfill On-Demand and Spot capacities, but also the parameters that
  /// specify the instance configuration information—the launch template and
  /// instance types. The policy can also include a weight for each instance
  /// type and different launch templates for individual instance types. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html">Auto
  /// Scaling groups with multiple instance types and purchase options</a> in
  /// the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [newInstancesProtectedFromScaleIn] :
  /// Indicates whether newly launched instances are protected from termination
  /// by Amazon EC2 Auto Scaling when scaling in. For more information about
  /// preventing instances from terminating on scale in, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [placementGroup] :
  /// The name of an existing placement group into which to launch your
  /// instances, if any. A placement group is a logical grouping of instances
  /// within a single Availability Zone. You cannot specify multiple
  /// Availability Zones and a placement group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement
  /// Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  ///
  /// Parameter [serviceLinkedRoleARN] :
  /// The Amazon Resource Name (ARN) of the service-linked role that the Auto
  /// Scaling group uses to call other AWS services on your behalf. By default,
  /// Amazon EC2 Auto Scaling uses a service-linked role named
  /// AWSServiceRoleForAutoScaling, which it creates if it does not exist. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html">Service-linked
  /// roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [tags] :
  /// One or more tags. You can tag your Auto Scaling group and propagate the
  /// tags to the Amazon EC2 instances it launches. Tags are not propagated to
  /// Amazon EBS volumes. To add tags to Amazon EBS volumes, specify the tags in
  /// a launch template but use caution. If the launch template specifies an
  /// instance tag with a key that is also specified for the Auto Scaling group,
  /// Amazon EC2 Auto Scaling overrides the value of that instance tag with the
  /// value specified by the Auto Scaling group. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging
  /// Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// Parameter [targetGroupARNs] :
  /// The Amazon Resource Names (ARN) of the target groups to associate with the
  /// Auto Scaling group. Instances are registered as targets in a target group,
  /// and traffic is routed to the target group. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Elastic
  /// Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [terminationPolicies] :
  /// A policy or a list of policies that are used to select the instance to
  /// terminate. These policies are executed in the order that you list them.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html">Controlling
  /// which Auto Scaling instances terminate during scale in</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [vPCZoneIdentifier] :
  /// A comma-separated list of subnet IDs for a virtual private cloud (VPC)
  /// where instances in the Auto Scaling group can be created. If you specify
  /// <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the
  /// subnets that you specify for this parameter must reside in those
  /// Availability Zones.
  ///
  /// Conditional: If your account supports EC2-Classic and VPC, this parameter
  /// is required to launch instances into a VPC.
  Future<void> createAutoScalingGroup({
    @_s.required String autoScalingGroupName,
    @_s.required int maxSize,
    @_s.required int minSize,
    List<String> availabilityZones,
    bool capacityRebalance,
    int defaultCooldown,
    int desiredCapacity,
    int healthCheckGracePeriod,
    String healthCheckType,
    String instanceId,
    String launchConfigurationName,
    LaunchTemplateSpecification launchTemplate,
    List<LifecycleHookSpecification> lifecycleHookSpecificationList,
    List<String> loadBalancerNames,
    int maxInstanceLifetime,
    MixedInstancesPolicy mixedInstancesPolicy,
    bool newInstancesProtectedFromScaleIn,
    String placementGroup,
    String serviceLinkedRoleARN,
    List<Tag> tags,
    List<String> targetGroupARNs,
    List<String> terminationPolicies,
    String vPCZoneIdentifier,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(maxSize, 'maxSize');
    ArgumentError.checkNotNull(minSize, 'minSize');
    _s.validateStringLength(
      'healthCheckType',
      healthCheckType,
      1,
      32,
    );
    _s.validateStringPattern(
      'healthCheckType',
      healthCheckType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'launchConfigurationName',
      launchConfigurationName,
      1,
      255,
    );
    _s.validateStringPattern(
      'launchConfigurationName',
      launchConfigurationName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'placementGroup',
      placementGroup,
      1,
      255,
    );
    _s.validateStringPattern(
      'placementGroup',
      placementGroup,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'serviceLinkedRoleARN',
      serviceLinkedRoleARN,
      1,
      1600,
    );
    _s.validateStringPattern(
      'serviceLinkedRoleARN',
      serviceLinkedRoleARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'vPCZoneIdentifier',
      vPCZoneIdentifier,
      1,
      2047,
    );
    _s.validateStringPattern(
      'vPCZoneIdentifier',
      vPCZoneIdentifier,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['MaxSize'] = maxSize;
    $request['MinSize'] = minSize;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    capacityRebalance?.also((arg) => $request['CapacityRebalance'] = arg);
    defaultCooldown?.also((arg) => $request['DefaultCooldown'] = arg);
    desiredCapacity?.also((arg) => $request['DesiredCapacity'] = arg);
    healthCheckGracePeriod
        ?.also((arg) => $request['HealthCheckGracePeriod'] = arg);
    healthCheckType?.also((arg) => $request['HealthCheckType'] = arg);
    instanceId?.also((arg) => $request['InstanceId'] = arg);
    launchConfigurationName
        ?.also((arg) => $request['LaunchConfigurationName'] = arg);
    launchTemplate?.also((arg) => $request['LaunchTemplate'] = arg);
    lifecycleHookSpecificationList
        ?.also((arg) => $request['LifecycleHookSpecificationList'] = arg);
    loadBalancerNames?.also((arg) => $request['LoadBalancerNames'] = arg);
    maxInstanceLifetime?.also((arg) => $request['MaxInstanceLifetime'] = arg);
    mixedInstancesPolicy?.also((arg) => $request['MixedInstancesPolicy'] = arg);
    newInstancesProtectedFromScaleIn
        ?.also((arg) => $request['NewInstancesProtectedFromScaleIn'] = arg);
    placementGroup?.also((arg) => $request['PlacementGroup'] = arg);
    serviceLinkedRoleARN?.also((arg) => $request['ServiceLinkedRoleARN'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    targetGroupARNs?.also((arg) => $request['TargetGroupARNs'] = arg);
    terminationPolicies?.also((arg) => $request['TerminationPolicies'] = arg);
    vPCZoneIdentifier?.also((arg) => $request['VPCZoneIdentifier'] = arg);
    await _protocol.send(
      $request,
      action: 'CreateAutoScalingGroup',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAutoScalingGroupType'],
      shapes: shapes,
    );
  }

  /// Creates a launch configuration.
  ///
  /// If you exceed your maximum limit of launch configurations, the call fails.
  /// To query this limit, call the <a>DescribeAccountLimits</a> API. For
  /// information about updating this limit, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html">Amazon
  /// EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html">Launch
  /// configurations</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [AlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [launchConfigurationName] :
  /// The name of the launch configuration. This name must be unique per Region
  /// per account.
  ///
  /// Parameter [associatePublicIpAddress] :
  /// For Auto Scaling groups that are running in a virtual private cloud (VPC),
  /// specifies whether to assign a public IP address to the group's instances.
  /// If you specify <code>true</code>, each instance in the Auto Scaling group
  /// receives a unique public IP address. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html">Launching
  /// Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// If you specify this parameter, you must specify at least one subnet for
  /// <code>VPCZoneIdentifier</code> when you create your group.
  /// <note>
  /// If the instance is launched into a default subnet, the default is to
  /// assign a public IP address, unless you disabled the option to assign a
  /// public IP address on the subnet. If the instance is launched into a
  /// nondefault subnet, the default is not to assign a public IP address,
  /// unless you enabled the option to assign a public IP address on the subnet.
  /// </note>
  ///
  /// Parameter [blockDeviceMappings] :
  /// A block device mapping, which specifies the block devices for the
  /// instance. You can specify virtual devices and EBS volumes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block
  /// Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  ///
  /// Parameter [classicLinkVPCId] :
  /// The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a>
  /// in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink">Linking
  /// EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// This parameter can only be used if you are launching EC2-Classic
  /// instances.
  ///
  /// Parameter [classicLinkVPCSecurityGroups] :
  /// The IDs of one or more security groups for the specified
  /// ClassicLink-enabled VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a>
  /// in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink">Linking
  /// EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// If you specify the <code>ClassicLinkVPCId</code> parameter, you must
  /// specify this parameter.
  ///
  /// Parameter [ebsOptimized] :
  /// Specifies whether the launch configuration is optimized for EBS I/O
  /// (<code>true</code>) or not (<code>false</code>). The optimization provides
  /// dedicated throughput to Amazon EBS and an optimized configuration stack to
  /// provide optimal I/O performance. This optimization is not available with
  /// all instance types. Additional fees are incurred when you enable EBS
  /// optimization for an instance type that is not EBS-optimized by default.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html">Amazon
  /// EBS-Optimized Instances</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  ///
  /// The default value is <code>false</code>.
  ///
  /// Parameter [iamInstanceProfile] :
  /// The name or the Amazon Resource Name (ARN) of the instance profile
  /// associated with the IAM role for the instance. The instance profile
  /// contains the IAM role.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html">IAM
  /// role for applications that run on Amazon EC2 instances</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [imageId] :
  /// The ID of the Amazon Machine Image (AMI) that was assigned during
  /// registration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding
  /// an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  ///
  /// If you do not specify <code>InstanceId</code>, you must specify
  /// <code>ImageId</code>.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance to use to create the launch configuration. The new
  /// launch configuration derives attributes from the instance, except for the
  /// block device mapping.
  ///
  /// To create a launch configuration with a block device mapping or override
  /// any other instance attributes, specify them as part of the same request.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-lc-with-instanceID.html">Creating
  /// a launch configuration using an EC2 instance</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// If you do not specify <code>InstanceId</code>, you must specify both
  /// <code>ImageId</code> and <code>InstanceType</code>.
  ///
  /// Parameter [instanceMonitoring] :
  /// Controls whether instances in this group are launched with detailed
  /// (<code>true</code>) or basic (<code>false</code>) monitoring.
  ///
  /// The default value is <code>true</code> (enabled).
  /// <important>
  /// When detailed monitoring is enabled, Amazon CloudWatch generates metrics
  /// every minute and your account is charged a fee. When you disable detailed
  /// monitoring, CloudWatch generates metrics every 5 minutes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html">Configure
  /// Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  /// </important>
  ///
  /// Parameter [instanceType] :
  /// Specifies the instance type of the EC2 instance.
  ///
  /// For information about available instance types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes">Available
  /// Instance Types</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances.</i>
  ///
  /// If you do not specify <code>InstanceId</code>, you must specify
  /// <code>InstanceType</code>.
  ///
  /// Parameter [kernelId] :
  /// The ID of the kernel associated with the AMI.
  ///
  /// Parameter [keyName] :
  /// The name of the key pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon
  /// EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  ///
  /// Parameter [metadataOptions] :
  /// The metadata options for the instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring
  /// the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// Parameter [placementTenancy] :
  /// The tenancy of the instance. An instance with <code>dedicated</code>
  /// tenancy runs on isolated, single-tenant hardware and can only be launched
  /// into a VPC.
  ///
  /// To launch dedicated instances into a shared tenancy VPC (a VPC with the
  /// instance placement tenancy attribute set to <code>default</code>), you
  /// must set the value of this parameter to <code>dedicated</code>.
  ///
  /// If you specify <code>PlacementTenancy</code>, you must specify at least
  /// one subnet for <code>VPCZoneIdentifier</code> when you create your group.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html">Configuring
  /// instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2
  /// Auto Scaling User Guide</i>.
  ///
  /// Valid Values: <code>default</code> | <code>dedicated</code>
  ///
  /// Parameter [ramdiskId] :
  /// The ID of the RAM disk to select.
  ///
  /// Parameter [securityGroups] :
  /// A list that contains the security groups to assign to the instances in the
  /// Auto Scaling group.
  ///
  /// [EC2-VPC] Specify the security group IDs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security
  /// Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User
  /// Guide</i>.
  ///
  /// [EC2-Classic] Specify either the security group names or the security
  /// group IDs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon
  /// EC2 Security Groups</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  ///
  /// Parameter [spotPrice] :
  /// The maximum hourly price to be paid for any Spot Instance launched to
  /// fulfill the request. Spot Instances are launched when the price you
  /// specify exceeds the current Spot price. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html">Requesting
  /// Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  /// <note>
  /// When you change your maximum price by creating a new launch configuration,
  /// running instances will continue to run as long as the maximum price for
  /// those running instances is higher than the current Spot price.
  /// </note>
  ///
  /// Parameter [userData] :
  /// The Base64-encoded user data to make available to the launched EC2
  /// instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance
  /// metadata and user data</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  Future<void> createLaunchConfiguration({
    @_s.required String launchConfigurationName,
    bool associatePublicIpAddress,
    List<BlockDeviceMapping> blockDeviceMappings,
    String classicLinkVPCId,
    List<String> classicLinkVPCSecurityGroups,
    bool ebsOptimized,
    String iamInstanceProfile,
    String imageId,
    String instanceId,
    InstanceMonitoring instanceMonitoring,
    String instanceType,
    String kernelId,
    String keyName,
    InstanceMetadataOptions metadataOptions,
    String placementTenancy,
    String ramdiskId,
    List<String> securityGroups,
    String spotPrice,
    String userData,
  }) async {
    ArgumentError.checkNotNull(
        launchConfigurationName, 'launchConfigurationName');
    _s.validateStringLength(
      'launchConfigurationName',
      launchConfigurationName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'launchConfigurationName',
      launchConfigurationName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'classicLinkVPCId',
      classicLinkVPCId,
      1,
      255,
    );
    _s.validateStringPattern(
      'classicLinkVPCId',
      classicLinkVPCId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'iamInstanceProfile',
      iamInstanceProfile,
      1,
      1600,
    );
    _s.validateStringPattern(
      'iamInstanceProfile',
      iamInstanceProfile,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'imageId',
      imageId,
      1,
      255,
    );
    _s.validateStringPattern(
      'imageId',
      imageId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'instanceType',
      instanceType,
      1,
      255,
    );
    _s.validateStringPattern(
      'instanceType',
      instanceType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'kernelId',
      kernelId,
      1,
      255,
    );
    _s.validateStringPattern(
      'kernelId',
      kernelId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'keyName',
      keyName,
      1,
      255,
    );
    _s.validateStringPattern(
      'keyName',
      keyName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'placementTenancy',
      placementTenancy,
      1,
      64,
    );
    _s.validateStringPattern(
      'placementTenancy',
      placementTenancy,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'ramdiskId',
      ramdiskId,
      1,
      255,
    );
    _s.validateStringPattern(
      'ramdiskId',
      ramdiskId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'spotPrice',
      spotPrice,
      1,
      255,
    );
    _s.validateStringLength(
      'userData',
      userData,
      0,
      21847,
    );
    _s.validateStringPattern(
      'userData',
      userData,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['LaunchConfigurationName'] = launchConfigurationName;
    associatePublicIpAddress
        ?.also((arg) => $request['AssociatePublicIpAddress'] = arg);
    blockDeviceMappings?.also((arg) => $request['BlockDeviceMappings'] = arg);
    classicLinkVPCId?.also((arg) => $request['ClassicLinkVPCId'] = arg);
    classicLinkVPCSecurityGroups
        ?.also((arg) => $request['ClassicLinkVPCSecurityGroups'] = arg);
    ebsOptimized?.also((arg) => $request['EbsOptimized'] = arg);
    iamInstanceProfile?.also((arg) => $request['IamInstanceProfile'] = arg);
    imageId?.also((arg) => $request['ImageId'] = arg);
    instanceId?.also((arg) => $request['InstanceId'] = arg);
    instanceMonitoring?.also((arg) => $request['InstanceMonitoring'] = arg);
    instanceType?.also((arg) => $request['InstanceType'] = arg);
    kernelId?.also((arg) => $request['KernelId'] = arg);
    keyName?.also((arg) => $request['KeyName'] = arg);
    metadataOptions?.also((arg) => $request['MetadataOptions'] = arg);
    placementTenancy?.also((arg) => $request['PlacementTenancy'] = arg);
    ramdiskId?.also((arg) => $request['RamdiskId'] = arg);
    securityGroups?.also((arg) => $request['SecurityGroups'] = arg);
    spotPrice?.also((arg) => $request['SpotPrice'] = arg);
    userData?.also((arg) => $request['UserData'] = arg);
    await _protocol.send(
      $request,
      action: 'CreateLaunchConfiguration',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLaunchConfigurationType'],
      shapes: shapes,
    );
  }

  /// Creates or updates tags for the specified Auto Scaling group.
  ///
  /// When you specify a tag with a key that already exists, the operation
  /// overwrites the previous tag definition, and you do not get an error
  /// message.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging
  /// Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [AlreadyExistsFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ResourceInUseFault].
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> createOrUpdateTags({
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'CreateOrUpdateTags',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateOrUpdateTagsType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified Auto Scaling group.
  ///
  /// If the group has instances or scaling activities in progress, you must
  /// specify the option to force the deletion in order for it to succeed.
  ///
  /// If the group has policies, deleting the group deletes the policies, the
  /// underlying alarm actions, and any alarm that no longer has an associated
  /// action.
  ///
  /// To remove instances from the Auto Scaling group before deleting it, call
  /// the <a>DetachInstances</a> API with the list of instances and the option
  /// to decrement the desired capacity. This ensures that Amazon EC2 Auto
  /// Scaling does not launch replacement instances.
  ///
  /// To terminate all instances before deleting the Auto Scaling group, call
  /// the <a>UpdateAutoScalingGroup</a> API and set the minimum size and desired
  /// capacity of the Auto Scaling group to zero.
  ///
  /// May throw [ScalingActivityInProgressFault].
  /// May throw [ResourceInUseFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [forceDelete] :
  /// Specifies that the group is to be deleted along with all instances
  /// associated with the group, without waiting for all instances to be
  /// terminated. This parameter also deletes any lifecycle actions associated
  /// with the group.
  Future<void> deleteAutoScalingGroup({
    @_s.required String autoScalingGroupName,
    bool forceDelete,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    forceDelete?.also((arg) => $request['ForceDelete'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteAutoScalingGroup',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAutoScalingGroupType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified launch configuration.
  ///
  /// The launch configuration must not be attached to an Auto Scaling group.
  /// When this call completes, the launch configuration is no longer available
  /// for use.
  ///
  /// May throw [ResourceInUseFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [launchConfigurationName] :
  /// The name of the launch configuration.
  Future<void> deleteLaunchConfiguration({
    @_s.required String launchConfigurationName,
  }) async {
    ArgumentError.checkNotNull(
        launchConfigurationName, 'launchConfigurationName');
    _s.validateStringLength(
      'launchConfigurationName',
      launchConfigurationName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'launchConfigurationName',
      launchConfigurationName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['LaunchConfigurationName'] = launchConfigurationName;
    await _protocol.send(
      $request,
      action: 'DeleteLaunchConfiguration',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['LaunchConfigurationNameType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified lifecycle hook.
  ///
  /// If there are any outstanding lifecycle actions, they are completed first
  /// (<code>ABANDON</code> for launching instances, <code>CONTINUE</code> for
  /// terminating instances).
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [lifecycleHookName] :
  /// The name of the lifecycle hook.
  Future<void> deleteLifecycleHook({
    @_s.required String autoScalingGroupName,
    @_s.required String lifecycleHookName,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lifecycleHookName, 'lifecycleHookName');
    _s.validateStringLength(
      'lifecycleHookName',
      lifecycleHookName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lifecycleHookName',
      lifecycleHookName,
      r'''[A-Za-z0-9\-_\/]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LifecycleHookName'] = lifecycleHookName;
    await _protocol.send(
      $request,
      action: 'DeleteLifecycleHook',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLifecycleHookType'],
      shapes: shapes,
      resultWrapper: 'DeleteLifecycleHookResult',
    );
  }

  /// Deletes the specified notification.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [topicARN] :
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (Amazon SNS) topic.
  Future<void> deleteNotificationConfiguration({
    @_s.required String autoScalingGroupName,
    @_s.required String topicARN,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topicARN, 'topicARN');
    _s.validateStringLength(
      'topicARN',
      topicARN,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'topicARN',
      topicARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['TopicARN'] = topicARN;
    await _protocol.send(
      $request,
      action: 'DeleteNotificationConfiguration',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteNotificationConfigurationType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified scaling policy.
  ///
  /// Deleting either a step scaling policy or a simple scaling policy deletes
  /// the underlying alarm action, but does not delete the alarm, even if it no
  /// longer has an associated action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html">Deleting
  /// a scaling policy</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [policyName] :
  /// The name or Amazon Resource Name (ARN) of the policy.
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  Future<void> deletePolicy({
    @_s.required String policyName,
    String autoScalingGroupName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    autoScalingGroupName?.also((arg) => $request['AutoScalingGroupName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeletePolicy',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeletePolicyType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified scheduled action.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the action to delete.
  Future<void> deleteScheduledAction({
    @_s.required String autoScalingGroupName,
    @_s.required String scheduledActionName,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scheduledActionName, 'scheduledActionName');
    _s.validateStringLength(
      'scheduledActionName',
      scheduledActionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledActionName',
      scheduledActionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ScheduledActionName'] = scheduledActionName;
    await _protocol.send(
      $request,
      action: 'DeleteScheduledAction',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteScheduledActionType'],
      shapes: shapes,
    );
  }

  /// Deletes the specified tags.
  ///
  /// May throw [ResourceContentionFault].
  /// May throw [ResourceInUseFault].
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> deleteTags({
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'DeleteTags',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTagsType'],
      shapes: shapes,
    );
  }

  /// Describes the current Amazon EC2 Auto Scaling resource quotas for your AWS
  /// account.
  ///
  /// For information about requesting an increase, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html">Amazon
  /// EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeAccountLimitsAnswer> describeAccountLimits() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountLimits',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeAccountLimitsResult',
    );
    return DescribeAccountLimitsAnswer.fromXml($result);
  }

  /// Describes the available adjustment types for Amazon EC2 Auto Scaling
  /// scaling policies. These settings apply to step scaling policies and simple
  /// scaling policies; they do not apply to target tracking scaling policies.
  ///
  /// The following adjustment types are supported:
  ///
  /// <ul>
  /// <li>
  /// ChangeInCapacity
  /// </li>
  /// <li>
  /// ExactCapacity
  /// </li>
  /// <li>
  /// PercentChangeInCapacity
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeAdjustmentTypesAnswer> describeAdjustmentTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAdjustmentTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeAdjustmentTypesResult',
    );
    return DescribeAdjustmentTypesAnswer.fromXml($result);
  }

  /// Describes one or more Auto Scaling groups.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupNames] :
  /// The names of the Auto Scaling groups. By default, you can only specify up
  /// to 50 names. You can optionally increase this limit using the
  /// <code>MaxRecords</code> parameter.
  ///
  /// If you omit this parameter, all Auto Scaling groups are described.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<AutoScalingGroupsType> describeAutoScalingGroups({
    List<String> autoScalingGroupNames,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    autoScalingGroupNames
        ?.also((arg) => $request['AutoScalingGroupNames'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAutoScalingGroups',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AutoScalingGroupNamesType'],
      shapes: shapes,
      resultWrapper: 'DescribeAutoScalingGroupsResult',
    );
    return AutoScalingGroupsType.fromXml($result);
  }

  /// Describes one or more Auto Scaling instances.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances. You can specify up to <code>MaxRecords</code>
  /// IDs. If you omit this parameter, all Auto Scaling instances are described.
  /// If you specify an ID that does not exist, it is ignored with no error.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>50</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<AutoScalingInstancesType> describeAutoScalingInstances({
    List<String> instanceIds,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    instanceIds?.also((arg) => $request['InstanceIds'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAutoScalingInstances',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAutoScalingInstancesType'],
      shapes: shapes,
      resultWrapper: 'DescribeAutoScalingInstancesResult',
    );
    return AutoScalingInstancesType.fromXml($result);
  }

  /// Describes the notification types that are supported by Amazon EC2 Auto
  /// Scaling.
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeAutoScalingNotificationTypesAnswer>
      describeAutoScalingNotificationTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAutoScalingNotificationTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeAutoScalingNotificationTypesResult',
    );
    return DescribeAutoScalingNotificationTypesAnswer.fromXml($result);
  }

  /// Describes one or more instance refreshes.
  ///
  /// You can determine the status of a request by looking at the
  /// <code>Status</code> parameter. The following are the possible statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code> - The request was created, but the operation has not
  /// started.
  /// </li>
  /// <li>
  /// <code>InProgress</code> - The operation is in progress.
  /// </li>
  /// <li>
  /// <code>Successful</code> - The operation completed successfully.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The operation failed to complete. You can
  /// troubleshoot using the status reason and the scaling activities.
  /// </li>
  /// <li>
  /// <code>Cancelling</code> - An ongoing operation is being cancelled.
  /// Cancellation does not roll back any replacements that have already been
  /// completed, but it prevents new replacements from being started.
  /// </li>
  /// <li>
  /// <code>Cancelled</code> - The operation is cancelled.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">Replacing
  /// Auto Scaling Instances Based on an Instance Refresh</a>.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [instanceRefreshIds] :
  /// One or more instance refresh IDs.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeInstanceRefreshesAnswer> describeInstanceRefreshes({
    @_s.required String autoScalingGroupName,
    List<String> instanceRefreshIds,
    int maxRecords,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    instanceRefreshIds?.also((arg) => $request['InstanceRefreshIds'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInstanceRefreshes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeInstanceRefreshesType'],
      shapes: shapes,
      resultWrapper: 'DescribeInstanceRefreshesResult',
    );
    return DescribeInstanceRefreshesAnswer.fromXml($result);
  }

  /// Describes one or more launch configurations.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [launchConfigurationNames] :
  /// The launch configuration names. If you omit this parameter, all launch
  /// configurations are described.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<LaunchConfigurationsType> describeLaunchConfigurations({
    List<String> launchConfigurationNames,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    launchConfigurationNames
        ?.also((arg) => $request['LaunchConfigurationNames'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLaunchConfigurations',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['LaunchConfigurationNamesType'],
      shapes: shapes,
      resultWrapper: 'DescribeLaunchConfigurationsResult',
    );
    return LaunchConfigurationsType.fromXml($result);
  }

  /// Describes the available types of lifecycle hooks.
  ///
  /// The following hook types are supported:
  ///
  /// <ul>
  /// <li>
  /// autoscaling:EC2_INSTANCE_LAUNCHING
  /// </li>
  /// <li>
  /// autoscaling:EC2_INSTANCE_TERMINATING
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeLifecycleHookTypesAnswer> describeLifecycleHookTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLifecycleHookTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeLifecycleHookTypesResult',
    );
    return DescribeLifecycleHookTypesAnswer.fromXml($result);
  }

  /// Describes the lifecycle hooks for the specified Auto Scaling group.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [lifecycleHookNames] :
  /// The names of one or more lifecycle hooks. If you omit this parameter, all
  /// lifecycle hooks are described.
  Future<DescribeLifecycleHooksAnswer> describeLifecycleHooks({
    @_s.required String autoScalingGroupName,
    List<String> lifecycleHookNames,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    lifecycleHookNames?.also((arg) => $request['LifecycleHookNames'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLifecycleHooks',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLifecycleHooksType'],
      shapes: shapes,
      resultWrapper: 'DescribeLifecycleHooksResult',
    );
    return DescribeLifecycleHooksAnswer.fromXml($result);
  }

  /// Describes the target groups for the specified Auto Scaling group.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>100</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeLoadBalancerTargetGroupsResponse>
      describeLoadBalancerTargetGroups({
    @_s.required String autoScalingGroupName,
    int maxRecords,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerTargetGroups',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerTargetGroupsRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerTargetGroupsResult',
    );
    return DescribeLoadBalancerTargetGroupsResponse.fromXml($result);
  }

  /// Describes the load balancers for the specified Auto Scaling group.
  ///
  /// This operation describes only Classic Load Balancers. If you have
  /// Application Load Balancers, Network Load Balancers, or Gateway Load
  /// Balancers, use the <a>DescribeLoadBalancerTargetGroups</a> API instead.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>100</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeLoadBalancersResponse> describeLoadBalancers({
    @_s.required String autoScalingGroupName,
    int maxRecords,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancers',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancersRequest'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancersResult',
    );
    return DescribeLoadBalancersResponse.fromXml($result);
  }

  /// Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.
  ///
  /// The <code>GroupStandbyInstances</code> metric is not returned by default.
  /// You must explicitly request this metric when calling the
  /// <a>EnableMetricsCollection</a> API.
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeMetricCollectionTypesAnswer>
      describeMetricCollectionTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeMetricCollectionTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeMetricCollectionTypesResult',
    );
    return DescribeMetricCollectionTypesAnswer.fromXml($result);
  }

  /// Describes the notification actions associated with the specified Auto
  /// Scaling group.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupNames] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeNotificationConfigurationsAnswer>
      describeNotificationConfigurations({
    List<String> autoScalingGroupNames,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    autoScalingGroupNames
        ?.also((arg) => $request['AutoScalingGroupNames'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeNotificationConfigurations',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeNotificationConfigurationsType'],
      shapes: shapes,
      resultWrapper: 'DescribeNotificationConfigurationsResult',
    );
    return DescribeNotificationConfigurationsAnswer.fromXml($result);
  }

  /// Describes the policies for the specified Auto Scaling group.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to be returned with each call. The default
  /// value is <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [policyNames] :
  /// The names of one or more policies. If you omit this parameter, all
  /// policies are described. If a group name is provided, the results are
  /// limited to that group. This list is limited to 50 items. If you specify an
  /// unknown policy name, it is ignored with no error.
  ///
  /// Parameter [policyTypes] :
  /// One or more policy types. The valid values are <code>SimpleScaling</code>,
  /// <code>StepScaling</code>, and <code>TargetTrackingScaling</code>.
  Future<PoliciesType> describePolicies({
    String autoScalingGroupName,
    int maxRecords,
    String nextToken,
    List<String> policyNames,
    List<String> policyTypes,
  }) async {
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    autoScalingGroupName?.also((arg) => $request['AutoScalingGroupName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    policyNames?.also((arg) => $request['PolicyNames'] = arg);
    policyTypes?.also((arg) => $request['PolicyTypes'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribePolicies',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribePoliciesType'],
      shapes: shapes,
      resultWrapper: 'DescribePoliciesResult',
    );
    return PoliciesType.fromXml($result);
  }

  /// Describes one or more scaling activities for the specified Auto Scaling
  /// group.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [activityIds] :
  /// The activity IDs of the desired scaling activities. You can specify up to
  /// 50 IDs. If you omit this parameter, all activities for the past six weeks
  /// are described. If unknown activities are requested, they are ignored with
  /// no error. If you specify an Auto Scaling group, the results are limited to
  /// that group.
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>100</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<ActivitiesType> describeScalingActivities({
    List<String> activityIds,
    String autoScalingGroupName,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    activityIds?.also((arg) => $request['ActivityIds'] = arg);
    autoScalingGroupName?.also((arg) => $request['AutoScalingGroupName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeScalingActivities',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeScalingActivitiesType'],
      shapes: shapes,
      resultWrapper: 'DescribeScalingActivitiesResult',
    );
    return ActivitiesType.fromXml($result);
  }

  /// Describes the scaling process types for use with the
  /// <a>ResumeProcesses</a> and <a>SuspendProcesses</a> APIs.
  ///
  /// May throw [ResourceContentionFault].
  Future<ProcessesType> describeScalingProcessTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeScalingProcessTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeScalingProcessTypesResult',
    );
    return ProcessesType.fromXml($result);
  }

  /// Describes the actions scheduled for your Auto Scaling group that haven't
  /// run or that have not reached their end time. To describe the actions that
  /// have already run, call the <a>DescribeScalingActivities</a> API.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [endTime] :
  /// The latest scheduled start time to return. If scheduled action names are
  /// provided, this parameter is ignored.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [scheduledActionNames] :
  /// The names of one or more scheduled actions. You can specify up to 50
  /// actions. If you omit this parameter, all scheduled actions are described.
  /// If you specify an unknown scheduled action, it is ignored with no error.
  ///
  /// Parameter [startTime] :
  /// The earliest scheduled start time to return. If scheduled action names are
  /// provided, this parameter is ignored.
  Future<ScheduledActionsType> describeScheduledActions({
    String autoScalingGroupName,
    DateTime endTime,
    int maxRecords,
    String nextToken,
    List<String> scheduledActionNames,
    DateTime startTime,
  }) async {
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    autoScalingGroupName?.also((arg) => $request['AutoScalingGroupName'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    scheduledActionNames?.also((arg) => $request['ScheduledActionNames'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeScheduledActions',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeScheduledActionsType'],
      shapes: shapes,
      resultWrapper: 'DescribeScheduledActionsResult',
    );
    return ScheduledActionsType.fromXml($result);
  }

  /// Describes the specified tags.
  ///
  /// You can use filters to limit the results. For example, you can query for
  /// the tags for a specific Auto Scaling group. You can specify multiple
  /// values for a filter. A tag must match at least one of the specified values
  /// for it to be included in the results.
  ///
  /// You can also specify multiple filters. The result includes information for
  /// a particular tag only if it matches all the filters. If there's no match,
  /// no special message is returned.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging
  /// Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [filters] :
  /// One or more filters to scope the tags to return. The maximum number of
  /// filters per filter type (for example, <code>auto-scaling-group</code>) is
  /// 1000.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of items to return with this call. The default value is
  /// <code>50</code> and the maximum value is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<TagsType> describeTags({
    List<Filter> filters,
    int maxRecords,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    filters?.also((arg) => $request['Filters'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTags',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTagsType'],
      shapes: shapes,
      resultWrapper: 'DescribeTagsResult',
    );
    return TagsType.fromXml($result);
  }

  /// Describes the termination policies supported by Amazon EC2 Auto Scaling.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html">Controlling
  /// which Auto Scaling instances terminate during scale in</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  Future<DescribeTerminationPolicyTypesAnswer>
      describeTerminationPolicyTypes() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTerminationPolicyTypes',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'DescribeTerminationPolicyTypesResult',
    );
    return DescribeTerminationPolicyTypesAnswer.fromXml($result);
  }

  /// Removes one or more instances from the specified Auto Scaling group.
  ///
  /// After the instances are detached, you can manage them independent of the
  /// Auto Scaling group.
  ///
  /// If you do not specify the option to decrement the desired capacity, Amazon
  /// EC2 Auto Scaling launches instances to replace the ones that are detached.
  ///
  /// If there is a Classic Load Balancer attached to the Auto Scaling group,
  /// the instances are deregistered from the load balancer. If there are target
  /// groups attached to the Auto Scaling group, the instances are deregistered
  /// from the target groups.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html">Detach
  /// EC2 instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [shouldDecrementDesiredCapacity] :
  /// Indicates whether the Auto Scaling group decrements the desired capacity
  /// value by the number of instances detached.
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances. You can specify up to 20 instances.
  Future<DetachInstancesAnswer> detachInstances({
    @_s.required String autoScalingGroupName,
    @_s.required bool shouldDecrementDesiredCapacity,
    List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        shouldDecrementDesiredCapacity, 'shouldDecrementDesiredCapacity');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ShouldDecrementDesiredCapacity'] = shouldDecrementDesiredCapacity;
    instanceIds?.also((arg) => $request['InstanceIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DetachInstances',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachInstancesQuery'],
      shapes: shapes,
      resultWrapper: 'DetachInstancesResult',
    );
    return DetachInstancesAnswer.fromXml($result);
  }

  /// Detaches one or more target groups from the specified Auto Scaling group.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [targetGroupARNs] :
  /// The Amazon Resource Names (ARN) of the target groups. You can specify up
  /// to 10 target groups.
  Future<void> detachLoadBalancerTargetGroups({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> targetGroupARNs,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetGroupARNs, 'targetGroupARNs');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['TargetGroupARNs'] = targetGroupARNs;
    await _protocol.send(
      $request,
      action: 'DetachLoadBalancerTargetGroups',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachLoadBalancerTargetGroupsType'],
      shapes: shapes,
      resultWrapper: 'DetachLoadBalancerTargetGroupsResult',
    );
  }

  /// Detaches one or more Classic Load Balancers from the specified Auto
  /// Scaling group.
  ///
  /// This operation detaches only Classic Load Balancers. If you have
  /// Application Load Balancers, Network Load Balancers, or Gateway Load
  /// Balancers, use the <a>DetachLoadBalancerTargetGroups</a> API instead.
  ///
  /// When you detach a load balancer, it enters the <code>Removing</code> state
  /// while deregistering the instances in the group. When all instances are
  /// deregistered, then you can no longer describe the load balancer using the
  /// <a>DescribeLoadBalancers</a> API call. The instances remain running.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [loadBalancerNames] :
  /// The names of the load balancers. You can specify up to 10 load balancers.
  Future<void> detachLoadBalancers({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> loadBalancerNames,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerNames, 'loadBalancerNames');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LoadBalancerNames'] = loadBalancerNames;
    await _protocol.send(
      $request,
      action: 'DetachLoadBalancers',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachLoadBalancersType'],
      shapes: shapes,
      resultWrapper: 'DetachLoadBalancersResult',
    );
  }

  /// Disables group metrics for the specified Auto Scaling group.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [metrics] :
  /// Specifies one or more of the following metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>GroupMinSize</code>
  /// </li>
  /// <li>
  /// <code>GroupMaxSize</code>
  /// </li>
  /// <li>
  /// <code>GroupDesiredCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalCapacity</code>
  /// </li>
  /// </ul>
  /// If you omit this parameter, all metrics are disabled.
  Future<void> disableMetricsCollection({
    @_s.required String autoScalingGroupName,
    List<String> metrics,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    metrics?.also((arg) => $request['Metrics'] = arg);
    await _protocol.send(
      $request,
      action: 'DisableMetricsCollection',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisableMetricsCollectionQuery'],
      shapes: shapes,
    );
  }

  /// Enables group metrics for the specified Auto Scaling group. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html">Monitoring
  /// CloudWatch metrics for your Auto Scaling groups and instances</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [granularity] :
  /// The granularity to associate with the metrics to collect. The only valid
  /// value is <code>1Minute</code>.
  ///
  /// Parameter [metrics] :
  /// Specifies which group-level metrics to start collecting. You can specify
  /// one or more of the following metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>GroupMinSize</code>
  /// </li>
  /// <li>
  /// <code>GroupMaxSize</code>
  /// </li>
  /// <li>
  /// <code>GroupDesiredCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalInstances</code>
  /// </li>
  /// </ul>
  /// The instance weighting feature supports the following additional metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>GroupInServiceCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalCapacity</code>
  /// </li>
  /// </ul>
  /// If you omit this parameter, all metrics are enabled.
  Future<void> enableMetricsCollection({
    @_s.required String autoScalingGroupName,
    @_s.required String granularity,
    List<String> metrics,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(granularity, 'granularity');
    _s.validateStringLength(
      'granularity',
      granularity,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'granularity',
      granularity,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['Granularity'] = granularity;
    metrics?.also((arg) => $request['Metrics'] = arg);
    await _protocol.send(
      $request,
      action: 'EnableMetricsCollection',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableMetricsCollectionQuery'],
      shapes: shapes,
    );
  }

  /// Moves the specified instances into the standby state.
  ///
  /// If you choose to decrement the desired capacity of the Auto Scaling group,
  /// the instances can enter standby as long as the desired capacity of the
  /// Auto Scaling group after the instances are placed into standby is equal to
  /// or greater than the minimum capacity of the group.
  ///
  /// If you choose not to decrement the desired capacity of the Auto Scaling
  /// group, the Auto Scaling group launches new instances to replace the
  /// instances on standby.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily
  /// removing instances from your Auto Scaling group</a> in the <i>Amazon EC2
  /// Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [shouldDecrementDesiredCapacity] :
  /// Indicates whether to decrement the desired capacity of the Auto Scaling
  /// group by the number of instances moved to <code>Standby</code> mode.
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances. You can specify up to 20 instances.
  Future<EnterStandbyAnswer> enterStandby({
    @_s.required String autoScalingGroupName,
    @_s.required bool shouldDecrementDesiredCapacity,
    List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        shouldDecrementDesiredCapacity, 'shouldDecrementDesiredCapacity');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ShouldDecrementDesiredCapacity'] = shouldDecrementDesiredCapacity;
    instanceIds?.also((arg) => $request['InstanceIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'EnterStandby',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnterStandbyQuery'],
      shapes: shapes,
      resultWrapper: 'EnterStandbyResult',
    );
    return EnterStandbyAnswer.fromXml($result);
  }

  /// Executes the specified policy. This can be useful for testing the design
  /// of your scaling policy.
  ///
  /// May throw [ScalingActivityInProgressFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [policyName] :
  /// The name or ARN of the policy.
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [breachThreshold] :
  /// The breach threshold for the alarm.
  ///
  /// Required if the policy type is <code>StepScaling</code> and not supported
  /// otherwise.
  ///
  /// Parameter [honorCooldown] :
  /// Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to
  /// complete before executing the policy.
  ///
  /// Valid only if the policy type is <code>SimpleScaling</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling
  /// cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [metricValue] :
  /// The metric value to compare to <code>BreachThreshold</code>. This enables
  /// you to execute a policy of type <code>StepScaling</code> and determine
  /// which step adjustment to use. For example, if the breach threshold is 50
  /// and you want to use a step adjustment with a lower bound of 0 and an upper
  /// bound of 10, you can set the metric value to 59.
  ///
  /// If you specify a metric value that doesn't correspond to a step adjustment
  /// for the policy, the call returns an error.
  ///
  /// Required if the policy type is <code>StepScaling</code> and not supported
  /// otherwise.
  Future<void> executePolicy({
    @_s.required String policyName,
    String autoScalingGroupName,
    double breachThreshold,
    bool honorCooldown,
    double metricValue,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    autoScalingGroupName?.also((arg) => $request['AutoScalingGroupName'] = arg);
    breachThreshold?.also((arg) => $request['BreachThreshold'] = arg);
    honorCooldown?.also((arg) => $request['HonorCooldown'] = arg);
    metricValue?.also((arg) => $request['MetricValue'] = arg);
    await _protocol.send(
      $request,
      action: 'ExecutePolicy',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ExecutePolicyType'],
      shapes: shapes,
    );
  }

  /// Moves the specified instances out of the standby state.
  ///
  /// After you put the instances back in service, the desired capacity is
  /// incremented.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily
  /// removing instances from your Auto Scaling group</a> in the <i>Amazon EC2
  /// Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [instanceIds] :
  /// The IDs of the instances. You can specify up to 20 instances.
  Future<ExitStandbyAnswer> exitStandby({
    @_s.required String autoScalingGroupName,
    List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    instanceIds?.also((arg) => $request['InstanceIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ExitStandby',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ExitStandbyQuery'],
      shapes: shapes,
      resultWrapper: 'ExitStandbyResult',
    );
    return ExitStandbyAnswer.fromXml($result);
  }

  /// Creates or updates a lifecycle hook for the specified Auto Scaling group.
  ///
  /// A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an
  /// instance when the instance launches (before it is put into service) or as
  /// the instance terminates (before it is fully terminated).
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  /// <ol>
  /// <li>
  /// (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  /// </li>
  /// <li>
  /// (Optional) Create a notification target and an IAM role. The target can be
  /// either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon
  /// EC2 Auto Scaling to publish lifecycle notifications to the target.
  /// </li>
  /// <li>
  /// <b>Create the lifecycle hook. Specify whether the hook is used when the
  /// instances launch or terminate.</b>
  /// </li>
  /// <li>
  /// If you need more time, record the lifecycle action heartbeat to keep the
  /// instance in a pending state using the
  /// <a>RecordLifecycleActionHeartbeat</a> API call.
  /// </li>
  /// <li>
  /// If you finish before the timeout period ends, complete the lifecycle
  /// action using the <a>CompleteLifecycleAction</a> API call.
  /// </li> </ol>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon
  /// EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// If you exceed your maximum limit of lifecycle hooks, which by default is
  /// 50 per Auto Scaling group, the call fails.
  ///
  /// You can view the lifecycle hooks for an Auto Scaling group using the
  /// <a>DescribeLifecycleHooks</a> API call. If you are no longer using a
  /// lifecycle hook, you can delete it by calling the
  /// <a>DeleteLifecycleHook</a> API.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [lifecycleHookName] :
  /// The name of the lifecycle hook.
  ///
  /// Parameter [defaultResult] :
  /// Defines the action the Auto Scaling group should take when the lifecycle
  /// hook timeout elapses or if an unexpected failure occurs. This parameter
  /// can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default
  /// value is <code>ABANDON</code>.
  ///
  /// Parameter [heartbeatTimeout] :
  /// The maximum time, in seconds, that can elapse before the lifecycle hook
  /// times out. The range is from <code>30</code> to <code>7200</code> seconds.
  /// The default value is <code>3600</code> seconds (1 hour).
  ///
  /// If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the
  /// action that you specified in the <code>DefaultResult</code> parameter. You
  /// can prevent the lifecycle hook from timing out by calling the
  /// <a>RecordLifecycleActionHeartbeat</a> API.
  ///
  /// Parameter [lifecycleTransition] :
  /// The instance state to which you want to attach the lifecycle hook. The
  /// valid values are:
  ///
  /// <ul>
  /// <li>
  /// autoscaling:EC2_INSTANCE_LAUNCHING
  /// </li>
  /// <li>
  /// autoscaling:EC2_INSTANCE_TERMINATING
  /// </li>
  /// </ul>
  /// Required for new lifecycle hooks, but optional when updating existing
  /// hooks.
  ///
  /// Parameter [notificationMetadata] :
  /// Additional information that you want to include any time Amazon EC2 Auto
  /// Scaling sends a message to the notification target.
  ///
  /// Parameter [notificationTargetARN] :
  /// The ARN of the notification target that Amazon EC2 Auto Scaling uses to
  /// notify you when an instance is in the transition state for the lifecycle
  /// hook. This target can be either an SQS queue or an SNS topic.
  ///
  /// If you specify an empty string, this overrides the current ARN.
  ///
  /// This operation uses the JSON format when sending notifications to an
  /// Amazon SQS queue, and an email key-value pair format when sending
  /// notifications to an Amazon SNS topic.
  ///
  /// When you specify a notification target, Amazon EC2 Auto Scaling sends it a
  /// test message. Test messages contain the following additional key-value
  /// pair: <code>"Event": "autoscaling:TEST_NOTIFICATION"</code>.
  ///
  /// Parameter [roleARN] :
  /// The ARN of the IAM role that allows the Auto Scaling group to publish to
  /// the specified notification target, for example, an Amazon SNS topic or an
  /// Amazon SQS queue.
  ///
  /// Required for new lifecycle hooks, but optional when updating existing
  /// hooks.
  Future<void> putLifecycleHook({
    @_s.required String autoScalingGroupName,
    @_s.required String lifecycleHookName,
    String defaultResult,
    int heartbeatTimeout,
    String lifecycleTransition,
    String notificationMetadata,
    String notificationTargetARN,
    String roleARN,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lifecycleHookName, 'lifecycleHookName');
    _s.validateStringLength(
      'lifecycleHookName',
      lifecycleHookName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lifecycleHookName',
      lifecycleHookName,
      r'''[A-Za-z0-9\-_\/]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'notificationMetadata',
      notificationMetadata,
      1,
      1023,
    );
    _s.validateStringPattern(
      'notificationMetadata',
      notificationMetadata,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'notificationTargetARN',
      notificationTargetARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'notificationTargetARN',
      notificationTargetARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      1,
      255,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LifecycleHookName'] = lifecycleHookName;
    defaultResult?.also((arg) => $request['DefaultResult'] = arg);
    heartbeatTimeout?.also((arg) => $request['HeartbeatTimeout'] = arg);
    lifecycleTransition?.also((arg) => $request['LifecycleTransition'] = arg);
    notificationMetadata?.also((arg) => $request['NotificationMetadata'] = arg);
    notificationTargetARN
        ?.also((arg) => $request['NotificationTargetARN'] = arg);
    roleARN?.also((arg) => $request['RoleARN'] = arg);
    await _protocol.send(
      $request,
      action: 'PutLifecycleHook',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutLifecycleHookType'],
      shapes: shapes,
      resultWrapper: 'PutLifecycleHookResult',
    );
  }

  /// Configures an Auto Scaling group to send notifications when specified
  /// events take place. Subscribers to the specified topic can have messages
  /// delivered to an endpoint such as a web server or an email address.
  ///
  /// This configuration overwrites any existing configuration.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html">Getting
  /// Amazon SNS notifications when your Auto Scaling group scales</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// If you exceed your maximum limit of SNS topics, which is 10 per Auto
  /// Scaling group, the call fails.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [notificationTypes] :
  /// The type of event that causes the notification to be sent. To query the
  /// notification types supported by Amazon EC2 Auto Scaling, call the
  /// <a>DescribeAutoScalingNotificationTypes</a> API.
  ///
  /// Parameter [topicARN] :
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (Amazon SNS) topic.
  Future<void> putNotificationConfiguration({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> notificationTypes,
    @_s.required String topicARN,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notificationTypes, 'notificationTypes');
    ArgumentError.checkNotNull(topicARN, 'topicARN');
    _s.validateStringLength(
      'topicARN',
      topicARN,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'topicARN',
      topicARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['NotificationTypes'] = notificationTypes;
    $request['TopicARN'] = topicARN;
    await _protocol.send(
      $request,
      action: 'PutNotificationConfiguration',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutNotificationConfigurationType'],
      shapes: shapes,
    );
  }

  /// Creates or updates a scaling policy for an Auto Scaling group.
  ///
  /// For more information about using scaling policies to scale your Auto
  /// Scaling group, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html">Target
  /// tracking scaling policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html">Step
  /// and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// Parameter [adjustmentType] :
  /// Specifies how the scaling adjustment is interpreted (for example, an
  /// absolute number or a percentage). The valid values are
  /// <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and
  /// <code>PercentChangeInCapacity</code>.
  ///
  /// Required if the policy type is <code>StepScaling</code> or
  /// <code>SimpleScaling</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment">Scaling
  /// adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [cooldown] :
  /// The duration of the policy's cooldown period, in seconds. When a cooldown
  /// period is specified here, it overrides the default cooldown period defined
  /// for the Auto Scaling group.
  ///
  /// Valid only if the policy type is <code>SimpleScaling</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling
  /// cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [enabled] :
  /// Indicates whether the scaling policy is enabled or disabled. The default
  /// is enabled. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enable-disable-scaling-policy.html">Disabling
  /// a scaling policy for an Auto Scaling group</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [estimatedInstanceWarmup] :
  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics. If not provided, the default is to
  /// use the value from the default cooldown period for the Auto Scaling group.
  ///
  /// Valid only if the policy type is <code>TargetTrackingScaling</code> or
  /// <code>StepScaling</code>.
  ///
  /// Parameter [metricAggregationType] :
  /// The aggregation type for the CloudWatch metrics. The valid values are
  /// <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If
  /// the aggregation type is null, the value is treated as
  /// <code>Average</code>.
  ///
  /// Valid only if the policy type is <code>StepScaling</code>.
  ///
  /// Parameter [minAdjustmentMagnitude] :
  /// The minimum value to scale by when the adjustment type is
  /// <code>PercentChangeInCapacity</code>. For example, suppose that you create
  /// a step scaling policy to scale out an Auto Scaling group by 25 percent and
  /// you specify a <code>MinAdjustmentMagnitude</code> of 2. If the group has 4
  /// instances and the scaling policy is performed, 25 percent of 4 is 1.
  /// However, because you specified a <code>MinAdjustmentMagnitude</code> of 2,
  /// Amazon EC2 Auto Scaling scales out the group by 2 instances.
  ///
  /// Valid only if the policy type is <code>StepScaling</code> or
  /// <code>SimpleScaling</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment">Scaling
  /// adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  /// <note>
  /// Some Auto Scaling groups use instance weights. In this case, set the
  /// <code>MinAdjustmentMagnitude</code> to a value that is at least as large
  /// as your largest instance weight.
  /// </note>
  ///
  /// Parameter [minAdjustmentStep] :
  /// Available for backward compatibility. Use
  /// <code>MinAdjustmentMagnitude</code> instead.
  ///
  /// Parameter [policyType] :
  /// One of the following policy types:
  ///
  /// <ul>
  /// <li>
  /// <code>TargetTrackingScaling</code>
  /// </li>
  /// <li>
  /// <code>StepScaling</code>
  /// </li>
  /// <li>
  /// <code>SimpleScaling</code> (default)
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalingAdjustment] :
  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number
  /// removes from the current capacity. For exact capacity, you must specify a
  /// positive value.
  ///
  /// Required if the policy type is <code>SimpleScaling</code>. (Not used with
  /// any other policy type.)
  ///
  /// Parameter [stepAdjustments] :
  /// A set of adjustments that enable you to scale based on the size of the
  /// alarm breach.
  ///
  /// Required if the policy type is <code>StepScaling</code>. (Not used with
  /// any other policy type.)
  ///
  /// Parameter [targetTrackingConfiguration] :
  /// A target tracking scaling policy. Includes support for predefined or
  /// customized metrics.
  ///
  /// The following predefined metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>ASGAverageCPUUtilization</code>
  /// </li>
  /// <li>
  /// <code>ASGAverageNetworkIn</code>
  /// </li>
  /// <li>
  /// <code>ASGAverageNetworkOut</code>
  /// </li>
  /// <li>
  /// <code>ALBRequestCountPerTarget</code>
  /// </li>
  /// </ul>
  /// If you specify <code>ALBRequestCountPerTarget</code> for the metric, you
  /// must specify the <code>ResourceLabel</code> parameter with the
  /// <code>PredefinedMetricSpecification</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html">TargetTrackingConfiguration</a>
  /// in the <i>Amazon EC2 Auto Scaling API Reference</i>.
  ///
  /// Required if the policy type is <code>TargetTrackingScaling</code>.
  Future<PolicyARNType> putScalingPolicy({
    @_s.required String autoScalingGroupName,
    @_s.required String policyName,
    String adjustmentType,
    int cooldown,
    bool enabled,
    int estimatedInstanceWarmup,
    String metricAggregationType,
    int minAdjustmentMagnitude,
    int minAdjustmentStep,
    String policyType,
    int scalingAdjustment,
    List<StepAdjustment> stepAdjustments,
    TargetTrackingConfiguration targetTrackingConfiguration,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'adjustmentType',
      adjustmentType,
      1,
      255,
    );
    _s.validateStringPattern(
      'adjustmentType',
      adjustmentType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'metricAggregationType',
      metricAggregationType,
      1,
      32,
    );
    _s.validateStringPattern(
      'metricAggregationType',
      metricAggregationType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'policyType',
      policyType,
      1,
      64,
    );
    _s.validateStringPattern(
      'policyType',
      policyType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['PolicyName'] = policyName;
    adjustmentType?.also((arg) => $request['AdjustmentType'] = arg);
    cooldown?.also((arg) => $request['Cooldown'] = arg);
    enabled?.also((arg) => $request['Enabled'] = arg);
    estimatedInstanceWarmup
        ?.also((arg) => $request['EstimatedInstanceWarmup'] = arg);
    metricAggregationType
        ?.also((arg) => $request['MetricAggregationType'] = arg);
    minAdjustmentMagnitude
        ?.also((arg) => $request['MinAdjustmentMagnitude'] = arg);
    minAdjustmentStep?.also((arg) => $request['MinAdjustmentStep'] = arg);
    policyType?.also((arg) => $request['PolicyType'] = arg);
    scalingAdjustment?.also((arg) => $request['ScalingAdjustment'] = arg);
    stepAdjustments?.also((arg) => $request['StepAdjustments'] = arg);
    targetTrackingConfiguration
        ?.also((arg) => $request['TargetTrackingConfiguration'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PutScalingPolicy',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutScalingPolicyType'],
      shapes: shapes,
      resultWrapper: 'PutScalingPolicyResult',
    );
    return PolicyARNType.fromXml($result);
  }

  /// Creates or updates a scheduled scaling action for an Auto Scaling group.
  /// If you leave a parameter unspecified when updating a scheduled scaling
  /// action, the corresponding value remains unchanged.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html">Scheduled
  /// scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [AlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scheduledActionName] :
  /// The name of this scaling action.
  ///
  /// Parameter [desiredCapacity] :
  /// The desired capacity is the initial capacity of the Auto Scaling group
  /// after the scheduled action runs and the capacity it attempts to maintain.
  /// It can scale beyond this capacity if you add more scaling conditions.
  ///
  /// Parameter [endTime] :
  /// The date and time for the recurring schedule to end. Amazon EC2 Auto
  /// Scaling does not perform the action after this time.
  ///
  /// Parameter [maxSize] :
  /// The maximum size of the Auto Scaling group.
  ///
  /// Parameter [minSize] :
  /// The minimum size of the Auto Scaling group.
  ///
  /// Parameter [recurrence] :
  /// The recurring schedule for this action, in Unix cron syntax format. This
  /// format consists of five fields separated by white spaces: [Minute] [Hour]
  /// [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes
  /// (for example, <code>"30 0 1 1,6,12 *"</code>). For more information about
  /// this format, see <a href="http://crontab.org">Crontab</a>.
  ///
  /// When <code>StartTime</code> and <code>EndTime</code> are specified with
  /// <code>Recurrence</code>, they form the boundaries of when the recurring
  /// action starts and stops.
  ///
  /// Parameter [startTime] :
  /// The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format
  /// in UTC/GMT only and in quotes (for example,
  /// <code>"2019-06-01T00:00:00Z"</code>).
  ///
  /// If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon
  /// EC2 Auto Scaling performs the action at this time, and then performs the
  /// action based on the specified recurrence.
  ///
  /// If you try to schedule your action in the past, Amazon EC2 Auto Scaling
  /// returns an error message.
  ///
  /// Parameter [time] :
  /// This parameter is no longer used.
  Future<void> putScheduledUpdateGroupAction({
    @_s.required String autoScalingGroupName,
    @_s.required String scheduledActionName,
    int desiredCapacity,
    DateTime endTime,
    int maxSize,
    int minSize,
    String recurrence,
    DateTime startTime,
    DateTime time,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scheduledActionName, 'scheduledActionName');
    _s.validateStringLength(
      'scheduledActionName',
      scheduledActionName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledActionName',
      scheduledActionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'recurrence',
      recurrence,
      1,
      255,
    );
    _s.validateStringPattern(
      'recurrence',
      recurrence,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['ScheduledActionName'] = scheduledActionName;
    desiredCapacity?.also((arg) => $request['DesiredCapacity'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    maxSize?.also((arg) => $request['MaxSize'] = arg);
    minSize?.also((arg) => $request['MinSize'] = arg);
    recurrence?.also((arg) => $request['Recurrence'] = arg);
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    time?.also((arg) => $request['Time'] = _s.iso8601ToJson(arg));
    await _protocol.send(
      $request,
      action: 'PutScheduledUpdateGroupAction',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutScheduledUpdateGroupActionType'],
      shapes: shapes,
    );
  }

  /// Records a heartbeat for the lifecycle action associated with the specified
  /// token or instance. This extends the timeout by the length of time defined
  /// using the <a>PutLifecycleHook</a> API call.
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  /// <ol>
  /// <li>
  /// (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  /// </li>
  /// <li>
  /// (Optional) Create a notification target and an IAM role. The target can be
  /// either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon
  /// EC2 Auto Scaling to publish lifecycle notifications to the target.
  /// </li>
  /// <li>
  /// Create the lifecycle hook. Specify whether the hook is used when the
  /// instances launch or terminate.
  /// </li>
  /// <li>
  /// <b>If you need more time, record the lifecycle action heartbeat to keep
  /// the instance in a pending state.</b>
  /// </li>
  /// <li>
  /// If you finish before the timeout period ends, complete the lifecycle
  /// action.
  /// </li> </ol>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html">Auto
  /// Scaling lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [lifecycleHookName] :
  /// The name of the lifecycle hook.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [lifecycleActionToken] :
  /// A token that uniquely identifies a specific lifecycle action associated
  /// with an instance. Amazon EC2 Auto Scaling sends this token to the
  /// notification target that you specified when you created the lifecycle
  /// hook.
  Future<void> recordLifecycleActionHeartbeat({
    @_s.required String autoScalingGroupName,
    @_s.required String lifecycleHookName,
    String instanceId,
    String lifecycleActionToken,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(lifecycleHookName, 'lifecycleHookName');
    _s.validateStringLength(
      'lifecycleHookName',
      lifecycleHookName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'lifecycleHookName',
      lifecycleHookName,
      r'''[A-Za-z0-9\-_\/]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'lifecycleActionToken',
      lifecycleActionToken,
      36,
      36,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['LifecycleHookName'] = lifecycleHookName;
    instanceId?.also((arg) => $request['InstanceId'] = arg);
    lifecycleActionToken?.also((arg) => $request['LifecycleActionToken'] = arg);
    await _protocol.send(
      $request,
      action: 'RecordLifecycleActionHeartbeat',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RecordLifecycleActionHeartbeatType'],
      shapes: shapes,
      resultWrapper: 'RecordLifecycleActionHeartbeatResult',
    );
  }

  /// Resumes the specified suspended auto scaling processes, or all suspended
  /// process, for the specified Auto Scaling group.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending
  /// and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// May throw [ResourceInUseFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scalingProcesses] :
  /// One or more of the following processes:
  ///
  /// <ul>
  /// <li>
  /// <code>Launch</code>
  /// </li>
  /// <li>
  /// <code>Terminate</code>
  /// </li>
  /// <li>
  /// <code>AddToLoadBalancer</code>
  /// </li>
  /// <li>
  /// <code>AlarmNotification</code>
  /// </li>
  /// <li>
  /// <code>AZRebalance</code>
  /// </li>
  /// <li>
  /// <code>HealthCheck</code>
  /// </li>
  /// <li>
  /// <code>InstanceRefresh</code>
  /// </li>
  /// <li>
  /// <code>ReplaceUnhealthy</code>
  /// </li>
  /// <li>
  /// <code>ScheduledActions</code>
  /// </li>
  /// </ul>
  /// If you omit this parameter, all processes are specified.
  Future<void> resumeProcesses({
    @_s.required String autoScalingGroupName,
    List<String> scalingProcesses,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    scalingProcesses?.also((arg) => $request['ScalingProcesses'] = arg);
    await _protocol.send(
      $request,
      action: 'ResumeProcesses',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ScalingProcessQuery'],
      shapes: shapes,
    );
  }

  /// Sets the size of the specified Auto Scaling group.
  ///
  /// If a scale-in activity occurs as a result of a new
  /// <code>DesiredCapacity</code> value that is lower than the current size of
  /// the group, the Auto Scaling group uses its termination policy to determine
  /// which instances to terminate.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html">Manual
  /// scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ScalingActivityInProgressFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [desiredCapacity] :
  /// The desired capacity is the initial capacity of the Auto Scaling group
  /// after this operation completes and the capacity it attempts to maintain.
  ///
  /// Parameter [honorCooldown] :
  /// Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to
  /// complete before initiating a scaling activity to set your Auto Scaling
  /// group to its new capacity. By default, Amazon EC2 Auto Scaling does not
  /// honor the cooldown period during manual scaling activities.
  Future<void> setDesiredCapacity({
    @_s.required String autoScalingGroupName,
    @_s.required int desiredCapacity,
    bool honorCooldown,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(desiredCapacity, 'desiredCapacity');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['DesiredCapacity'] = desiredCapacity;
    honorCooldown?.also((arg) => $request['HonorCooldown'] = arg);
    await _protocol.send(
      $request,
      action: 'SetDesiredCapacity',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetDesiredCapacityType'],
      shapes: shapes,
    );
  }

  /// Sets the health status of the specified instance.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html">Health
  /// checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  ///
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [healthStatus] :
  /// The health status of the instance. Set to <code>Healthy</code> to have the
  /// instance remain in service. Set to <code>Unhealthy</code> to have the
  /// instance be out of service. Amazon EC2 Auto Scaling terminates and
  /// replaces the unhealthy instance.
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [shouldRespectGracePeriod] :
  /// If the Auto Scaling group of the specified instance has a
  /// <code>HealthCheckGracePeriod</code> specified for the group, by default,
  /// this call respects the grace period. Set this to <code>False</code>, to
  /// have the call not respect the grace period associated with the group.
  ///
  /// For more information about the health check grace period, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html">CreateAutoScalingGroup</a>
  /// in the <i>Amazon EC2 Auto Scaling API Reference</i>.
  Future<void> setInstanceHealth({
    @_s.required String healthStatus,
    @_s.required String instanceId,
    bool shouldRespectGracePeriod,
  }) async {
    ArgumentError.checkNotNull(healthStatus, 'healthStatus');
    _s.validateStringLength(
      'healthStatus',
      healthStatus,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'healthStatus',
      healthStatus,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['HealthStatus'] = healthStatus;
    $request['InstanceId'] = instanceId;
    shouldRespectGracePeriod
        ?.also((arg) => $request['ShouldRespectGracePeriod'] = arg);
    await _protocol.send(
      $request,
      action: 'SetInstanceHealth',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetInstanceHealthQuery'],
      shapes: shapes,
    );
  }

  /// Updates the instance protection settings of the specified instances.
  ///
  /// For more information about preventing instances that are part of an Auto
  /// Scaling group from terminating on scale in, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// If you exceed your maximum limit of instance IDs, which is 50 per Auto
  /// Scaling group, the call fails.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [instanceIds] :
  /// One or more instance IDs. You can specify up to 50 instances.
  ///
  /// Parameter [protectedFromScaleIn] :
  /// Indicates whether the instance is protected from termination by Amazon EC2
  /// Auto Scaling when scaling in.
  Future<void> setInstanceProtection({
    @_s.required String autoScalingGroupName,
    @_s.required List<String> instanceIds,
    @_s.required bool protectedFromScaleIn,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceIds, 'instanceIds');
    ArgumentError.checkNotNull(protectedFromScaleIn, 'protectedFromScaleIn');
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    $request['InstanceIds'] = instanceIds;
    $request['ProtectedFromScaleIn'] = protectedFromScaleIn;
    await _protocol.send(
      $request,
      action: 'SetInstanceProtection',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetInstanceProtectionQuery'],
      shapes: shapes,
      resultWrapper: 'SetInstanceProtectionResult',
    );
  }

  /// Starts a new instance refresh operation, which triggers a rolling
  /// replacement of all previously launched instances in the Auto Scaling group
  /// with a new group of instances.
  ///
  /// If successful, this call creates a new instance refresh request with a
  /// unique ID that you can use to track its progress. To query its status,
  /// call the <a>DescribeInstanceRefreshes</a> API. To describe the instance
  /// refreshes that have already run, call the <a>DescribeInstanceRefreshes</a>
  /// API. To cancel an instance refresh operation in progress, use the
  /// <a>CancelInstanceRefresh</a> API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">Replacing
  /// Auto Scaling Instances Based on an Instance Refresh</a>.
  ///
  /// May throw [LimitExceededFault].
  /// May throw [ResourceContentionFault].
  /// May throw [InstanceRefreshInProgressFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [preferences] :
  /// Set of preferences associated with the instance refresh request.
  ///
  /// If not provided, the default values are used. For
  /// <code>MinHealthyPercentage</code>, the default value is <code>90</code>.
  /// For <code>InstanceWarmup</code>, the default is to use the value specified
  /// for the health check grace period for the Auto Scaling group.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RefreshPreferences.html">RefreshPreferences</a>
  /// in the <i>Amazon EC2 Auto Scaling API Reference</i>.
  ///
  /// Parameter [strategy] :
  /// The strategy to use for the instance refresh. The only valid value is
  /// <code>Rolling</code>.
  ///
  /// A rolling update is an update that is applied to all instances in an Auto
  /// Scaling group until all instances have been updated. A rolling update can
  /// fail due to failed health checks or if instances are on standby or are
  /// protected from scale in. If the rolling update process fails, any
  /// instances that were already replaced are not rolled back to their previous
  /// configuration.
  Future<StartInstanceRefreshAnswer> startInstanceRefresh({
    @_s.required String autoScalingGroupName,
    RefreshPreferences preferences,
    RefreshStrategy strategy,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    preferences?.also((arg) => $request['Preferences'] = arg);
    strategy?.also((arg) => $request['Strategy'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'StartInstanceRefresh',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartInstanceRefreshType'],
      shapes: shapes,
      resultWrapper: 'StartInstanceRefreshResult',
    );
    return StartInstanceRefreshAnswer.fromXml($result);
  }

  /// Suspends the specified auto scaling processes, or all processes, for the
  /// specified Auto Scaling group.
  ///
  /// If you suspend either the <code>Launch</code> or <code>Terminate</code>
  /// process types, it can prevent other process types from functioning
  /// properly. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending
  /// and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  ///
  /// To resume processes that have been suspended, call the
  /// <a>ResumeProcesses</a> API.
  ///
  /// May throw [ResourceInUseFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [scalingProcesses] :
  /// One or more of the following processes:
  ///
  /// <ul>
  /// <li>
  /// <code>Launch</code>
  /// </li>
  /// <li>
  /// <code>Terminate</code>
  /// </li>
  /// <li>
  /// <code>AddToLoadBalancer</code>
  /// </li>
  /// <li>
  /// <code>AlarmNotification</code>
  /// </li>
  /// <li>
  /// <code>AZRebalance</code>
  /// </li>
  /// <li>
  /// <code>HealthCheck</code>
  /// </li>
  /// <li>
  /// <code>InstanceRefresh</code>
  /// </li>
  /// <li>
  /// <code>ReplaceUnhealthy</code>
  /// </li>
  /// <li>
  /// <code>ScheduledActions</code>
  /// </li>
  /// </ul>
  /// If you omit this parameter, all processes are specified.
  Future<void> suspendProcesses({
    @_s.required String autoScalingGroupName,
    List<String> scalingProcesses,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    scalingProcesses?.also((arg) => $request['ScalingProcesses'] = arg);
    await _protocol.send(
      $request,
      action: 'SuspendProcesses',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ScalingProcessQuery'],
      shapes: shapes,
    );
  }

  /// Terminates the specified instance and optionally adjusts the desired group
  /// size.
  ///
  /// This call simply makes a termination request. The instance is not
  /// terminated immediately. When an instance is terminated, the instance
  /// status changes to <code>terminated</code>. You can't connect to or start
  /// an instance after you've terminated it.
  ///
  /// If you do not specify the option to decrement the desired capacity, Amazon
  /// EC2 Auto Scaling launches instances to replace the ones that are
  /// terminated.
  ///
  /// By default, Amazon EC2 Auto Scaling balances instances across all
  /// Availability Zones. If you decrement the desired capacity, your Auto
  /// Scaling group can become unbalanced between Availability Zones. Amazon EC2
  /// Auto Scaling tries to rebalance the group, and rebalancing might terminate
  /// instances in other zones. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage">Rebalancing
  /// activities</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// May throw [ScalingActivityInProgressFault].
  /// May throw [ResourceContentionFault].
  ///
  /// Parameter [instanceId] :
  /// The ID of the instance.
  ///
  /// Parameter [shouldDecrementDesiredCapacity] :
  /// Indicates whether terminating the instance also decrements the size of the
  /// Auto Scaling group.
  Future<ActivityType> terminateInstanceInAutoScalingGroup({
    @_s.required String instanceId,
    @_s.required bool shouldDecrementDesiredCapacity,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      19,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        shouldDecrementDesiredCapacity, 'shouldDecrementDesiredCapacity');
    final $request = <String, dynamic>{};
    $request['InstanceId'] = instanceId;
    $request['ShouldDecrementDesiredCapacity'] = shouldDecrementDesiredCapacity;
    final $result = await _protocol.send(
      $request,
      action: 'TerminateInstanceInAutoScalingGroup',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TerminateInstanceInAutoScalingGroupType'],
      shapes: shapes,
      resultWrapper: 'TerminateInstanceInAutoScalingGroupResult',
    );
    return ActivityType.fromXml($result);
  }

  /// Updates the configuration for the specified Auto Scaling group.
  ///
  /// To update an Auto Scaling group, specify the name of the group and the
  /// parameter that you want to change. Any parameters that you don't specify
  /// are not changed by this update request. The new settings take effect on
  /// any scaling activities after this call returns.
  ///
  /// If you associate a new launch configuration or template with an Auto
  /// Scaling group, all new instances will get the updated configuration.
  /// Existing instances continue to run with the configuration that they were
  /// originally launched with. When you update a group to specify a mixed
  /// instances policy instead of a launch configuration or template, existing
  /// instances may be replaced to match the new purchasing options that you
  /// specified in the policy. For example, if the group currently has 100%
  /// On-Demand capacity and the policy specifies 50% Spot capacity, this means
  /// that half of your instances will be gradually terminated and relaunched as
  /// Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches
  /// new instances before terminating the old ones, so that updating your group
  /// does not compromise the performance or availability of your application.
  ///
  /// Note the following about changing <code>DesiredCapacity</code>,
  /// <code>MaxSize</code>, or <code>MinSize</code>:
  ///
  /// <ul>
  /// <li>
  /// If a scale-in activity occurs as a result of a new
  /// <code>DesiredCapacity</code> value that is lower than the current size of
  /// the group, the Auto Scaling group uses its termination policy to determine
  /// which instances to terminate.
  /// </li>
  /// <li>
  /// If you specify a new value for <code>MinSize</code> without specifying a
  /// value for <code>DesiredCapacity</code>, and the new <code>MinSize</code>
  /// is larger than the current size of the group, this sets the group's
  /// <code>DesiredCapacity</code> to the new <code>MinSize</code> value.
  /// </li>
  /// <li>
  /// If you specify a new value for <code>MaxSize</code> without specifying a
  /// value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code>
  /// is smaller than the current size of the group, this sets the group's
  /// <code>DesiredCapacity</code> to the new <code>MaxSize</code> value.
  /// </li>
  /// </ul>
  /// To see which parameters have been set, call the
  /// <a>DescribeAutoScalingGroups</a> API. To view the scaling policies for an
  /// Auto Scaling group, call the <a>DescribePolicies</a> API. If the group has
  /// scaling policies, you can update them by calling the
  /// <a>PutScalingPolicy</a> API.
  ///
  /// May throw [ScalingActivityInProgressFault].
  /// May throw [ResourceContentionFault].
  /// May throw [ServiceLinkedRoleFailure].
  ///
  /// Parameter [autoScalingGroupName] :
  /// The name of the Auto Scaling group.
  ///
  /// Parameter [availabilityZones] :
  /// One or more Availability Zones for the group.
  ///
  /// Parameter [capacityRebalance] :
  /// Enables or disables Capacity Rebalancing. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/capacity-rebalance.html">Amazon
  /// EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [defaultCooldown] :
  /// The amount of time, in seconds, after a scaling activity completes before
  /// another scaling activity can start. The default value is <code>300</code>.
  /// This setting applies when using simple scaling policies, but not when
  /// using other scaling policies or scheduled scaling. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling
  /// cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  ///
  /// Parameter [desiredCapacity] :
  /// The desired capacity is the initial capacity of the Auto Scaling group
  /// after this operation completes and the capacity it attempts to maintain.
  /// This number must be greater than or equal to the minimum size of the group
  /// and less than or equal to the maximum size of the group.
  ///
  /// Parameter [healthCheckGracePeriod] :
  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before
  /// checking the health status of an EC2 instance that has come into service.
  /// The default value is <code>0</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period">Health
  /// check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Conditional: Required if you are adding an <code>ELB</code> health check.
  ///
  /// Parameter [healthCheckType] :
  /// The service to use for the health checks. The valid values are
  /// <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling
  /// group to use ELB health checks, it considers the instance unhealthy if it
  /// fails either the EC2 status checks or the load balancer health checks.
  ///
  /// Parameter [launchConfigurationName] :
  /// The name of the launch configuration. If you specify
  /// <code>LaunchConfigurationName</code> in your update request, you can't
  /// specify <code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>.
  ///
  /// Parameter [launchTemplate] :
  /// The launch template and version to use to specify the updates. If you
  /// specify <code>LaunchTemplate</code> in your update request, you can't
  /// specify <code>LaunchConfigurationName</code> or
  /// <code>MixedInstancesPolicy</code>.
  ///
  /// Parameter [maxInstanceLifetime] :
  /// The maximum amount of time, in seconds, that an instance can be in
  /// service. The default is null. If specified, the value must be either 0 or
  /// a number equal to or greater than 86,400 seconds (1 day). To clear a
  /// previously set value, specify a new value of 0. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html">Replacing
  /// Auto Scaling instances based on maximum instance lifetime</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [maxSize] :
  /// The maximum size of the Auto Scaling group.
  /// <note>
  /// With a mixed instances policy that uses instance weighting, Amazon EC2
  /// Auto Scaling may need to go above <code>MaxSize</code> to meet your
  /// capacity requirements. In this event, Amazon EC2 Auto Scaling will never
  /// go above <code>MaxSize</code> by more than your largest instance weight
  /// (weights that define how many units each instance contributes to the
  /// desired capacity of the group).
  /// </note>
  ///
  /// Parameter [minSize] :
  /// The minimum size of the Auto Scaling group.
  ///
  /// Parameter [mixedInstancesPolicy] :
  /// An embedded object that specifies a mixed instances policy. When you make
  /// changes to an existing policy, all optional parameters are left unchanged
  /// if not specified. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html">Auto
  /// Scaling groups with multiple instance types and purchase options</a> in
  /// the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [newInstancesProtectedFromScaleIn] :
  /// Indicates whether newly launched instances are protected from termination
  /// by Amazon EC2 Auto Scaling when scaling in. For more information about
  /// preventing instances from terminating on scale in, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [placementGroup] :
  /// The name of an existing placement group into which to launch your
  /// instances, if any. A placement group is a logical grouping of instances
  /// within a single Availability Zone. You cannot specify multiple
  /// Availability Zones and a placement group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement
  /// Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  ///
  /// Parameter [serviceLinkedRoleARN] :
  /// The Amazon Resource Name (ARN) of the service-linked role that the Auto
  /// Scaling group uses to call other AWS services on your behalf. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html">Service-linked
  /// roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [terminationPolicies] :
  /// A policy or a list of policies that are used to select the instances to
  /// terminate. The policies are executed in the order that you list them. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html">Controlling
  /// which Auto Scaling instances terminate during scale in</a> in the
  /// <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [vPCZoneIdentifier] :
  /// A comma-separated list of subnet IDs for a virtual private cloud (VPC). If
  /// you specify <code>VPCZoneIdentifier</code> with
  /// <code>AvailabilityZones</code>, the subnets that you specify for this
  /// parameter must reside in those Availability Zones.
  Future<void> updateAutoScalingGroup({
    @_s.required String autoScalingGroupName,
    List<String> availabilityZones,
    bool capacityRebalance,
    int defaultCooldown,
    int desiredCapacity,
    int healthCheckGracePeriod,
    String healthCheckType,
    String launchConfigurationName,
    LaunchTemplateSpecification launchTemplate,
    int maxInstanceLifetime,
    int maxSize,
    int minSize,
    MixedInstancesPolicy mixedInstancesPolicy,
    bool newInstancesProtectedFromScaleIn,
    String placementGroup,
    String serviceLinkedRoleARN,
    List<String> terminationPolicies,
    String vPCZoneIdentifier,
  }) async {
    ArgumentError.checkNotNull(autoScalingGroupName, 'autoScalingGroupName');
    _s.validateStringLength(
      'autoScalingGroupName',
      autoScalingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'autoScalingGroupName',
      autoScalingGroupName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'healthCheckType',
      healthCheckType,
      1,
      32,
    );
    _s.validateStringPattern(
      'healthCheckType',
      healthCheckType,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'launchConfigurationName',
      launchConfigurationName,
      1,
      255,
    );
    _s.validateStringPattern(
      'launchConfigurationName',
      launchConfigurationName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'placementGroup',
      placementGroup,
      1,
      255,
    );
    _s.validateStringPattern(
      'placementGroup',
      placementGroup,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'serviceLinkedRoleARN',
      serviceLinkedRoleARN,
      1,
      1600,
    );
    _s.validateStringPattern(
      'serviceLinkedRoleARN',
      serviceLinkedRoleARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'vPCZoneIdentifier',
      vPCZoneIdentifier,
      1,
      2047,
    );
    _s.validateStringPattern(
      'vPCZoneIdentifier',
      vPCZoneIdentifier,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final $request = <String, dynamic>{};
    $request['AutoScalingGroupName'] = autoScalingGroupName;
    availabilityZones?.also((arg) => $request['AvailabilityZones'] = arg);
    capacityRebalance?.also((arg) => $request['CapacityRebalance'] = arg);
    defaultCooldown?.also((arg) => $request['DefaultCooldown'] = arg);
    desiredCapacity?.also((arg) => $request['DesiredCapacity'] = arg);
    healthCheckGracePeriod
        ?.also((arg) => $request['HealthCheckGracePeriod'] = arg);
    healthCheckType?.also((arg) => $request['HealthCheckType'] = arg);
    launchConfigurationName
        ?.also((arg) => $request['LaunchConfigurationName'] = arg);
    launchTemplate?.also((arg) => $request['LaunchTemplate'] = arg);
    maxInstanceLifetime?.also((arg) => $request['MaxInstanceLifetime'] = arg);
    maxSize?.also((arg) => $request['MaxSize'] = arg);
    minSize?.also((arg) => $request['MinSize'] = arg);
    mixedInstancesPolicy?.also((arg) => $request['MixedInstancesPolicy'] = arg);
    newInstancesProtectedFromScaleIn
        ?.also((arg) => $request['NewInstancesProtectedFromScaleIn'] = arg);
    placementGroup?.also((arg) => $request['PlacementGroup'] = arg);
    serviceLinkedRoleARN?.also((arg) => $request['ServiceLinkedRoleARN'] = arg);
    terminationPolicies?.also((arg) => $request['TerminationPolicies'] = arg);
    vPCZoneIdentifier?.also((arg) => $request['VPCZoneIdentifier'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateAutoScalingGroup',
      version: '2011-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAutoScalingGroupType'],
      shapes: shapes,
    );
  }
}

class ActivitiesType {
  /// The scaling activities. Activities are sorted by start time. Activities
  /// still in progress are described first.
  final List<Activity> activities;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  ActivitiesType({
    @_s.required this.activities,
    this.nextToken,
  });
  factory ActivitiesType.fromXml(_s.XmlElement elem) {
    return ActivitiesType(
      activities: _s.extractXmlChild(elem, 'Activities')?.let((elem) =>
          elem.findElements('member').map((c) => Activity.fromXml(c)).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// Describes scaling activity, which is a long-running process that represents
/// a change to your Auto Scaling group, such as changing its size or replacing
/// an instance.
class Activity {
  /// The ID of the activity.
  final String activityId;

  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The reason the activity began.
  final String cause;

  /// The start time of the activity.
  final DateTime startTime;

  /// The current status of the activity.
  final ScalingActivityStatusCode statusCode;

  /// A friendly, more verbose description of the activity.
  final String description;

  /// The details about the activity.
  final String details;

  /// The end time of the activity.
  final DateTime endTime;

  /// A value between 0 and 100 that indicates the progress of the activity.
  final int progress;

  /// A friendly, more verbose description of the activity status.
  final String statusMessage;

  Activity({
    @_s.required this.activityId,
    @_s.required this.autoScalingGroupName,
    @_s.required this.cause,
    @_s.required this.startTime,
    @_s.required this.statusCode,
    this.description,
    this.details,
    this.endTime,
    this.progress,
    this.statusMessage,
  });
  factory Activity.fromXml(_s.XmlElement elem) {
    return Activity(
      activityId: _s.extractXmlStringValue(elem, 'ActivityId'),
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      cause: _s.extractXmlStringValue(elem, 'Cause'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      statusCode: _s
          .extractXmlStringValue(elem, 'StatusCode')
          ?.toScalingActivityStatusCode(),
      description: _s.extractXmlStringValue(elem, 'Description'),
      details: _s.extractXmlStringValue(elem, 'Details'),
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      progress: _s.extractXmlIntValue(elem, 'Progress'),
      statusMessage: _s.extractXmlStringValue(elem, 'StatusMessage'),
    );
  }
}

class ActivityType {
  /// A scaling activity.
  final Activity activity;

  ActivityType({
    this.activity,
  });
  factory ActivityType.fromXml(_s.XmlElement elem) {
    return ActivityType(
      activity:
          _s.extractXmlChild(elem, 'Activity')?.let((e) => Activity.fromXml(e)),
    );
  }
}

/// Describes a policy adjustment type.
class AdjustmentType {
  /// The policy adjustment type. The valid values are
  /// <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and
  /// <code>PercentChangeInCapacity</code>.
  final String adjustmentType;

  AdjustmentType({
    this.adjustmentType,
  });
  factory AdjustmentType.fromXml(_s.XmlElement elem) {
    return AdjustmentType(
      adjustmentType: _s.extractXmlStringValue(elem, 'AdjustmentType'),
    );
  }
}

/// Describes an alarm.
class Alarm {
  /// The Amazon Resource Name (ARN) of the alarm.
  final String alarmARN;

  /// The name of the alarm.
  final String alarmName;

  Alarm({
    this.alarmARN,
    this.alarmName,
  });
  factory Alarm.fromXml(_s.XmlElement elem) {
    return Alarm(
      alarmARN: _s.extractXmlStringValue(elem, 'AlarmARN'),
      alarmName: _s.extractXmlStringValue(elem, 'AlarmName'),
    );
  }
}

class AttachLoadBalancerTargetGroupsResultType {
  AttachLoadBalancerTargetGroupsResultType();
  factory AttachLoadBalancerTargetGroupsResultType.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return AttachLoadBalancerTargetGroupsResultType();
  }
}

class AttachLoadBalancersResultType {
  AttachLoadBalancersResultType();
  factory AttachLoadBalancersResultType.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return AttachLoadBalancersResultType();
  }
}

/// Describes an Auto Scaling group.
class AutoScalingGroup {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// One or more Availability Zones for the group.
  final List<String> availabilityZones;

  /// The date and time the group was created.
  final DateTime createdTime;

  /// The duration of the default cooldown period, in seconds.
  final int defaultCooldown;

  /// The desired size of the group.
  final int desiredCapacity;

  /// The service to use for the health checks. The valid values are
  /// <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling
  /// group to use ELB health checks, it considers the instance unhealthy if it
  /// fails either the EC2 status checks or the load balancer health checks.
  final String healthCheckType;

  /// The maximum size of the group.
  final int maxSize;

  /// The minimum size of the group.
  final int minSize;

  /// The Amazon Resource Name (ARN) of the Auto Scaling group.
  final String autoScalingGroupARN;

  /// Indicates whether Capacity Rebalancing is enabled.
  final bool capacityRebalance;

  /// The metrics enabled for the group.
  final List<EnabledMetric> enabledMetrics;

  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before
  /// checking the health status of an EC2 instance that has come into service.
  final int healthCheckGracePeriod;

  /// The EC2 instances associated with the group.
  final List<Instance> instances;

  /// The name of the associated launch configuration.
  final String launchConfigurationName;

  /// The launch template for the group.
  final LaunchTemplateSpecification launchTemplate;

  /// One or more load balancers associated with the group.
  final List<String> loadBalancerNames;

  /// The maximum amount of time, in seconds, that an instance can be in service.
  ///
  /// Valid Range: Minimum value of 0.
  final int maxInstanceLifetime;

  /// The mixed instances policy for the group.
  final MixedInstancesPolicy mixedInstancesPolicy;

  /// Indicates whether newly launched instances are protected from termination by
  /// Amazon EC2 Auto Scaling when scaling in.
  final bool newInstancesProtectedFromScaleIn;

  /// The name of the placement group into which to launch your instances, if any.
  final String placementGroup;

  /// The Amazon Resource Name (ARN) of the service-linked role that the Auto
  /// Scaling group uses to call other AWS services on your behalf.
  final String serviceLinkedRoleARN;

  /// The current state of the group when the <a>DeleteAutoScalingGroup</a>
  /// operation is in progress.
  final String status;

  /// The suspended processes associated with the group.
  final List<SuspendedProcess> suspendedProcesses;

  /// The tags for the group.
  final List<TagDescription> tags;

  /// The Amazon Resource Names (ARN) of the target groups for your load balancer.
  final List<String> targetGroupARNs;

  /// The termination policies for the group.
  final List<String> terminationPolicies;

  /// One or more subnet IDs, if applicable, separated by commas.
  final String vPCZoneIdentifier;

  AutoScalingGroup({
    @_s.required this.autoScalingGroupName,
    @_s.required this.availabilityZones,
    @_s.required this.createdTime,
    @_s.required this.defaultCooldown,
    @_s.required this.desiredCapacity,
    @_s.required this.healthCheckType,
    @_s.required this.maxSize,
    @_s.required this.minSize,
    this.autoScalingGroupARN,
    this.capacityRebalance,
    this.enabledMetrics,
    this.healthCheckGracePeriod,
    this.instances,
    this.launchConfigurationName,
    this.launchTemplate,
    this.loadBalancerNames,
    this.maxInstanceLifetime,
    this.mixedInstancesPolicy,
    this.newInstancesProtectedFromScaleIn,
    this.placementGroup,
    this.serviceLinkedRoleARN,
    this.status,
    this.suspendedProcesses,
    this.tags,
    this.targetGroupARNs,
    this.terminationPolicies,
    this.vPCZoneIdentifier,
  });
  factory AutoScalingGroup.fromXml(_s.XmlElement elem) {
    return AutoScalingGroup(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      availabilityZones: _s
          .extractXmlChild(elem, 'AvailabilityZones')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      defaultCooldown: _s.extractXmlIntValue(elem, 'DefaultCooldown'),
      desiredCapacity: _s.extractXmlIntValue(elem, 'DesiredCapacity'),
      healthCheckType: _s.extractXmlStringValue(elem, 'HealthCheckType'),
      maxSize: _s.extractXmlIntValue(elem, 'MaxSize'),
      minSize: _s.extractXmlIntValue(elem, 'MinSize'),
      autoScalingGroupARN:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupARN'),
      capacityRebalance: _s.extractXmlBoolValue(elem, 'CapacityRebalance'),
      enabledMetrics: _s.extractXmlChild(elem, 'EnabledMetrics')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => EnabledMetric.fromXml(c))
              .toList()),
      healthCheckGracePeriod:
          _s.extractXmlIntValue(elem, 'HealthCheckGracePeriod'),
      instances: _s.extractXmlChild(elem, 'Instances')?.let((elem) =>
          elem.findElements('member').map((c) => Instance.fromXml(c)).toList()),
      launchConfigurationName:
          _s.extractXmlStringValue(elem, 'LaunchConfigurationName'),
      launchTemplate: _s
          .extractXmlChild(elem, 'LaunchTemplate')
          ?.let((e) => LaunchTemplateSpecification.fromXml(e)),
      loadBalancerNames: _s
          .extractXmlChild(elem, 'LoadBalancerNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      maxInstanceLifetime: _s.extractXmlIntValue(elem, 'MaxInstanceLifetime'),
      mixedInstancesPolicy: _s
          .extractXmlChild(elem, 'MixedInstancesPolicy')
          ?.let((e) => MixedInstancesPolicy.fromXml(e)),
      newInstancesProtectedFromScaleIn:
          _s.extractXmlBoolValue(elem, 'NewInstancesProtectedFromScaleIn'),
      placementGroup: _s.extractXmlStringValue(elem, 'PlacementGroup'),
      serviceLinkedRoleARN:
          _s.extractXmlStringValue(elem, 'ServiceLinkedRoleARN'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      suspendedProcesses: _s.extractXmlChild(elem, 'SuspendedProcesses')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => SuspendedProcess.fromXml(c))
              .toList()),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) => elem
          .findElements('member')
          .map((c) => TagDescription.fromXml(c))
          .toList()),
      targetGroupARNs: _s
          .extractXmlChild(elem, 'TargetGroupARNs')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      terminationPolicies: _s
          .extractXmlChild(elem, 'TerminationPolicies')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      vPCZoneIdentifier: _s.extractXmlStringValue(elem, 'VPCZoneIdentifier'),
    );
  }
}

class AutoScalingGroupsType {
  /// The groups.
  final List<AutoScalingGroup> autoScalingGroups;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  AutoScalingGroupsType({
    @_s.required this.autoScalingGroups,
    this.nextToken,
  });
  factory AutoScalingGroupsType.fromXml(_s.XmlElement elem) {
    return AutoScalingGroupsType(
      autoScalingGroups: _s.extractXmlChild(elem, 'AutoScalingGroups')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AutoScalingGroup.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// Describes an EC2 instance associated with an Auto Scaling group.
class AutoScalingInstanceDetails {
  /// The name of the Auto Scaling group for the instance.
  final String autoScalingGroupName;

  /// The Availability Zone for the instance.
  final String availabilityZone;

  /// The last reported health status of this instance. "Healthy" means that the
  /// instance is healthy and should remain in service. "Unhealthy" means that the
  /// instance is unhealthy and Amazon EC2 Auto Scaling should terminate and
  /// replace it.
  final String healthStatus;

  /// The ID of the instance.
  final String instanceId;

  /// The lifecycle state for the instance.
  final String lifecycleState;

  /// Indicates whether the instance is protected from termination by Amazon EC2
  /// Auto Scaling when scaling in.
  final bool protectedFromScaleIn;

  /// The instance type of the EC2 instance.
  final String instanceType;

  /// The launch configuration used to launch the instance. This value is not
  /// available if you attached the instance to the Auto Scaling group.
  final String launchConfigurationName;

  /// The launch template for the instance.
  final LaunchTemplateSpecification launchTemplate;

  /// The number of capacity units contributed by the instance based on its
  /// instance type.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 999.
  final String weightedCapacity;

  AutoScalingInstanceDetails({
    @_s.required this.autoScalingGroupName,
    @_s.required this.availabilityZone,
    @_s.required this.healthStatus,
    @_s.required this.instanceId,
    @_s.required this.lifecycleState,
    @_s.required this.protectedFromScaleIn,
    this.instanceType,
    this.launchConfigurationName,
    this.launchTemplate,
    this.weightedCapacity,
  });
  factory AutoScalingInstanceDetails.fromXml(_s.XmlElement elem) {
    return AutoScalingInstanceDetails(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
      lifecycleState: _s.extractXmlStringValue(elem, 'LifecycleState'),
      protectedFromScaleIn:
          _s.extractXmlBoolValue(elem, 'ProtectedFromScaleIn'),
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchConfigurationName:
          _s.extractXmlStringValue(elem, 'LaunchConfigurationName'),
      launchTemplate: _s
          .extractXmlChild(elem, 'LaunchTemplate')
          ?.let((e) => LaunchTemplateSpecification.fromXml(e)),
      weightedCapacity: _s.extractXmlStringValue(elem, 'WeightedCapacity'),
    );
  }
}

class AutoScalingInstancesType {
  /// The instances.
  final List<AutoScalingInstanceDetails> autoScalingInstances;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  AutoScalingInstancesType({
    this.autoScalingInstances,
    this.nextToken,
  });
  factory AutoScalingInstancesType.fromXml(_s.XmlElement elem) {
    return AutoScalingInstancesType(
      autoScalingInstances: _s
          .extractXmlChild(elem, 'AutoScalingInstances')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => AutoScalingInstanceDetails.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class BatchDeleteScheduledActionAnswer {
  /// The names of the scheduled actions that could not be deleted, including an
  /// error message.
  final List<FailedScheduledUpdateGroupActionRequest> failedScheduledActions;

  BatchDeleteScheduledActionAnswer({
    this.failedScheduledActions,
  });
  factory BatchDeleteScheduledActionAnswer.fromXml(_s.XmlElement elem) {
    return BatchDeleteScheduledActionAnswer(
      failedScheduledActions: _s
          .extractXmlChild(elem, 'FailedScheduledActions')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => FailedScheduledUpdateGroupActionRequest.fromXml(c))
              .toList()),
    );
  }
}

class BatchPutScheduledUpdateGroupActionAnswer {
  /// The names of the scheduled actions that could not be created or updated,
  /// including an error message.
  final List<FailedScheduledUpdateGroupActionRequest>
      failedScheduledUpdateGroupActions;

  BatchPutScheduledUpdateGroupActionAnswer({
    this.failedScheduledUpdateGroupActions,
  });
  factory BatchPutScheduledUpdateGroupActionAnswer.fromXml(_s.XmlElement elem) {
    return BatchPutScheduledUpdateGroupActionAnswer(
      failedScheduledUpdateGroupActions: _s
          .extractXmlChild(elem, 'FailedScheduledUpdateGroupActions')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => FailedScheduledUpdateGroupActionRequest.fromXml(c))
              .toList()),
    );
  }
}

/// Describes a block device mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BlockDeviceMapping {
  /// The device name exposed to the EC2 instance (for example,
  /// <code>/dev/sdh</code> or <code>xvdh</code>). For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html">Device
  /// Naming on Linux Instances</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// Parameters used to automatically set up EBS volumes when an instance is
  /// launched.
  ///
  /// You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not
  /// both.
  @_s.JsonKey(name: 'Ebs')
  final Ebs ebs;

  /// Setting this value to <code>true</code> suppresses the specified device
  /// included in the block device mapping of the AMI.
  ///
  /// If <code>NoDevice</code> is <code>true</code> for the root device, instances
  /// might fail the EC2 health check. In that case, Amazon EC2 Auto Scaling
  /// launches replacement instances.
  ///
  /// If you specify <code>NoDevice</code>, you cannot specify <code>Ebs</code>.
  @_s.JsonKey(name: 'NoDevice')
  final bool noDevice;

  /// The name of the virtual device (for example, <code>ephemeral0</code>).
  ///
  /// You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not
  /// both.
  @_s.JsonKey(name: 'VirtualName')
  final String virtualName;

  BlockDeviceMapping({
    @_s.required this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });
  factory BlockDeviceMapping.fromXml(_s.XmlElement elem) {
    return BlockDeviceMapping(
      deviceName: _s.extractXmlStringValue(elem, 'DeviceName'),
      ebs: _s.extractXmlChild(elem, 'Ebs')?.let((e) => Ebs.fromXml(e)),
      noDevice: _s.extractXmlBoolValue(elem, 'NoDevice'),
      virtualName: _s.extractXmlStringValue(elem, 'VirtualName'),
    );
  }

  Map<String, dynamic> toJson() => _$BlockDeviceMappingToJson(this);
}

class CancelInstanceRefreshAnswer {
  /// The instance refresh ID.
  final String instanceRefreshId;

  CancelInstanceRefreshAnswer({
    this.instanceRefreshId,
  });
  factory CancelInstanceRefreshAnswer.fromXml(_s.XmlElement elem) {
    return CancelInstanceRefreshAnswer(
      instanceRefreshId: _s.extractXmlStringValue(elem, 'InstanceRefreshId'),
    );
  }
}

class CompleteLifecycleActionAnswer {
  CompleteLifecycleActionAnswer();
  factory CompleteLifecycleActionAnswer.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CompleteLifecycleActionAnswer();
  }
}

/// Represents a CloudWatch metric of your choosing for a target tracking
/// scaling policy to use with Amazon EC2 Auto Scaling.
///
/// To create your customized metric specification:
///
/// <ul>
/// <li>
/// Add values for each required parameter from CloudWatch. You can use an
/// existing metric, or a new metric that you create. To use your own metric,
/// you must first publish the metric to CloudWatch. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publish
/// Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
/// </li>
/// <li>
/// Choose a metric that changes proportionally with capacity. The value of the
/// metric should increase or decrease in inverse proportion to the number of
/// capacity units. That is, the value of the metric should decrease when
/// capacity increases.
/// </li>
/// </ul>
/// For more information about CloudWatch, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CustomizedMetricSpecification {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The statistic of the metric.
  @_s.JsonKey(name: 'Statistic')
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your scaling policy.
  @_s.JsonKey(name: 'Dimensions')
  final List<MetricDimension> dimensions;

  /// The unit of the metric.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  CustomizedMetricSpecification({
    @_s.required this.metricName,
    @_s.required this.namespace,
    @_s.required this.statistic,
    this.dimensions,
    this.unit,
  });
  factory CustomizedMetricSpecification.fromXml(_s.XmlElement elem) {
    return CustomizedMetricSpecification(
      metricName: _s.extractXmlStringValue(elem, 'MetricName'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      statistic:
          _s.extractXmlStringValue(elem, 'Statistic')?.toMetricStatistic(),
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) => elem
          .findElements('member')
          .map((c) => MetricDimension.fromXml(c))
          .toList()),
      unit: _s.extractXmlStringValue(elem, 'Unit'),
    );
  }

  Map<String, dynamic> toJson() => _$CustomizedMetricSpecificationToJson(this);
}

class DeleteLifecycleHookAnswer {
  DeleteLifecycleHookAnswer();
  factory DeleteLifecycleHookAnswer.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteLifecycleHookAnswer();
  }
}

class DescribeAccountLimitsAnswer {
  /// The maximum number of groups allowed for your AWS account. The default is
  /// 200 groups per AWS Region.
  final int maxNumberOfAutoScalingGroups;

  /// The maximum number of launch configurations allowed for your AWS account.
  /// The default is 200 launch configurations per AWS Region.
  final int maxNumberOfLaunchConfigurations;

  /// The current number of groups for your AWS account.
  final int numberOfAutoScalingGroups;

  /// The current number of launch configurations for your AWS account.
  final int numberOfLaunchConfigurations;

  DescribeAccountLimitsAnswer({
    this.maxNumberOfAutoScalingGroups,
    this.maxNumberOfLaunchConfigurations,
    this.numberOfAutoScalingGroups,
    this.numberOfLaunchConfigurations,
  });
  factory DescribeAccountLimitsAnswer.fromXml(_s.XmlElement elem) {
    return DescribeAccountLimitsAnswer(
      maxNumberOfAutoScalingGroups:
          _s.extractXmlIntValue(elem, 'MaxNumberOfAutoScalingGroups'),
      maxNumberOfLaunchConfigurations:
          _s.extractXmlIntValue(elem, 'MaxNumberOfLaunchConfigurations'),
      numberOfAutoScalingGroups:
          _s.extractXmlIntValue(elem, 'NumberOfAutoScalingGroups'),
      numberOfLaunchConfigurations:
          _s.extractXmlIntValue(elem, 'NumberOfLaunchConfigurations'),
    );
  }
}

class DescribeAdjustmentTypesAnswer {
  /// The policy adjustment types.
  final List<AdjustmentType> adjustmentTypes;

  DescribeAdjustmentTypesAnswer({
    this.adjustmentTypes,
  });
  factory DescribeAdjustmentTypesAnswer.fromXml(_s.XmlElement elem) {
    return DescribeAdjustmentTypesAnswer(
      adjustmentTypes: _s.extractXmlChild(elem, 'AdjustmentTypes')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AdjustmentType.fromXml(c))
              .toList()),
    );
  }
}

class DescribeAutoScalingNotificationTypesAnswer {
  /// The notification types.
  final List<String> autoScalingNotificationTypes;

  DescribeAutoScalingNotificationTypesAnswer({
    this.autoScalingNotificationTypes,
  });
  factory DescribeAutoScalingNotificationTypesAnswer.fromXml(
      _s.XmlElement elem) {
    return DescribeAutoScalingNotificationTypesAnswer(
      autoScalingNotificationTypes: _s
          .extractXmlChild(elem, 'AutoScalingNotificationTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class DescribeInstanceRefreshesAnswer {
  /// The instance refreshes for the specified group.
  final List<InstanceRefresh> instanceRefreshes;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  DescribeInstanceRefreshesAnswer({
    this.instanceRefreshes,
    this.nextToken,
  });
  factory DescribeInstanceRefreshesAnswer.fromXml(_s.XmlElement elem) {
    return DescribeInstanceRefreshesAnswer(
      instanceRefreshes: _s.extractXmlChild(elem, 'InstanceRefreshes')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => InstanceRefresh.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class DescribeLifecycleHookTypesAnswer {
  /// The lifecycle hook types.
  final List<String> lifecycleHookTypes;

  DescribeLifecycleHookTypesAnswer({
    this.lifecycleHookTypes,
  });
  factory DescribeLifecycleHookTypesAnswer.fromXml(_s.XmlElement elem) {
    return DescribeLifecycleHookTypesAnswer(
      lifecycleHookTypes: _s
          .extractXmlChild(elem, 'LifecycleHookTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class DescribeLifecycleHooksAnswer {
  /// The lifecycle hooks for the specified group.
  final List<LifecycleHook> lifecycleHooks;

  DescribeLifecycleHooksAnswer({
    this.lifecycleHooks,
  });
  factory DescribeLifecycleHooksAnswer.fromXml(_s.XmlElement elem) {
    return DescribeLifecycleHooksAnswer(
      lifecycleHooks: _s.extractXmlChild(elem, 'LifecycleHooks')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => LifecycleHook.fromXml(c))
              .toList()),
    );
  }
}

class DescribeLoadBalancerTargetGroupsResponse {
  /// Information about the target groups.
  final List<LoadBalancerTargetGroupState> loadBalancerTargetGroups;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  DescribeLoadBalancerTargetGroupsResponse({
    this.loadBalancerTargetGroups,
    this.nextToken,
  });
  factory DescribeLoadBalancerTargetGroupsResponse.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerTargetGroupsResponse(
      loadBalancerTargetGroups: _s
          .extractXmlChild(elem, 'LoadBalancerTargetGroups')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => LoadBalancerTargetGroupState.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class DescribeLoadBalancersResponse {
  /// The load balancers.
  final List<LoadBalancerState> loadBalancers;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  DescribeLoadBalancersResponse({
    this.loadBalancers,
    this.nextToken,
  });
  factory DescribeLoadBalancersResponse.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancersResponse(
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => LoadBalancerState.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class DescribeMetricCollectionTypesAnswer {
  /// The granularities for the metrics.
  final List<MetricGranularityType> granularities;

  /// One or more metrics.
  final List<MetricCollectionType> metrics;

  DescribeMetricCollectionTypesAnswer({
    this.granularities,
    this.metrics,
  });
  factory DescribeMetricCollectionTypesAnswer.fromXml(_s.XmlElement elem) {
    return DescribeMetricCollectionTypesAnswer(
      granularities: _s.extractXmlChild(elem, 'Granularities')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => MetricGranularityType.fromXml(c))
              .toList()),
      metrics: _s.extractXmlChild(elem, 'Metrics')?.let((elem) => elem
          .findElements('member')
          .map((c) => MetricCollectionType.fromXml(c))
          .toList()),
    );
  }
}

class DescribeNotificationConfigurationsAnswer {
  /// The notification configurations.
  final List<NotificationConfiguration> notificationConfigurations;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  DescribeNotificationConfigurationsAnswer({
    @_s.required this.notificationConfigurations,
    this.nextToken,
  });
  factory DescribeNotificationConfigurationsAnswer.fromXml(_s.XmlElement elem) {
    return DescribeNotificationConfigurationsAnswer(
      notificationConfigurations: _s
          .extractXmlChild(elem, 'NotificationConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => NotificationConfiguration.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

class DescribeTerminationPolicyTypesAnswer {
  /// The termination policies supported by Amazon EC2 Auto Scaling:
  /// <code>OldestInstance</code>, <code>OldestLaunchConfiguration</code>,
  /// <code>NewestInstance</code>, <code>ClosestToNextInstanceHour</code>,
  /// <code>Default</code>, <code>OldestLaunchTemplate</code>, and
  /// <code>AllocationStrategy</code>.
  final List<String> terminationPolicyTypes;

  DescribeTerminationPolicyTypesAnswer({
    this.terminationPolicyTypes,
  });
  factory DescribeTerminationPolicyTypesAnswer.fromXml(_s.XmlElement elem) {
    return DescribeTerminationPolicyTypesAnswer(
      terminationPolicyTypes: _s
          .extractXmlChild(elem, 'TerminationPolicyTypes')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class DetachInstancesAnswer {
  /// The activities related to detaching the instances from the Auto Scaling
  /// group.
  final List<Activity> activities;

  DetachInstancesAnswer({
    this.activities,
  });
  factory DetachInstancesAnswer.fromXml(_s.XmlElement elem) {
    return DetachInstancesAnswer(
      activities: _s.extractXmlChild(elem, 'Activities')?.let((elem) =>
          elem.findElements('member').map((c) => Activity.fromXml(c)).toList()),
    );
  }
}

class DetachLoadBalancerTargetGroupsResultType {
  DetachLoadBalancerTargetGroupsResultType();
  factory DetachLoadBalancerTargetGroupsResultType.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DetachLoadBalancerTargetGroupsResultType();
  }
}

class DetachLoadBalancersResultType {
  DetachLoadBalancersResultType();
  factory DetachLoadBalancersResultType.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DetachLoadBalancersResultType();
  }
}

/// Describes information used to set up an Amazon EBS volume specified in a
/// block device mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Ebs {
  /// Indicates whether the volume is deleted on instance termination. For Amazon
  /// EC2 Auto Scaling, the default value is <code>true</code>.
  @_s.JsonKey(name: 'DeleteOnTermination')
  final bool deleteOnTermination;

  /// Specifies whether the volume should be encrypted. Encrypted EBS volumes can
  /// only be attached to instances that support Amazon EBS encryption. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances">Supported
  /// Instance Types</a>. If your AMI uses encrypted volumes, you can also only
  /// launch it on supported instance types.
  /// <note>
  /// If you are creating a volume from a snapshot, you cannot specify an
  /// encryption value. Volumes that are created from encrypted snapshots are
  /// automatically encrypted, and volumes that are created from unencrypted
  /// snapshots are automatically unencrypted. By default, encrypted snapshots use
  /// the AWS managed CMK that is used for EBS encryption, but you can specify a
  /// custom CMK when you create the snapshot. The ability to encrypt a snapshot
  /// during copying also allows you to apply a new CMK to an already-encrypted
  /// snapshot. Volumes restored from the resulting copy are only accessible using
  /// the new CMK.
  ///
  /// Enabling <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default">encryption
  /// by default</a> results in all EBS volumes being encrypted with the AWS
  /// managed CMK or a customer managed CMK, whether or not the snapshot was
  /// encrypted.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIEncryption.html">Using
  /// Encryption with EBS-Backed AMIs</a> in the <i>Amazon EC2 User Guide for
  /// Linux Instances</i> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/key-policy-requirements-EBS-encryption.html">Required
  /// CMK key policy for use with encrypted volumes</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The number of I/O operations per second (IOPS) to provision for the volume.
  /// The maximum ratio of IOPS to volume size (in GiB) is 50:1. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon
  /// EBS Volume Types</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  ///
  /// Required when the volume type is <code>io1</code>. (Not used with
  /// <code>standard</code>, <code>gp2</code>, <code>st1</code>, or
  /// <code>sc1</code> volumes.)
  @_s.JsonKey(name: 'Iops')
  final int iops;

  /// The snapshot ID of the volume to use.
  ///
  /// You must specify either a <code>VolumeSize</code> or a
  /// <code>SnapshotId</code>.
  @_s.JsonKey(name: 'SnapshotId')
  final String snapshotId;

  /// The volume size, in Gibibytes (GiB).
  ///
  /// This can be a number from 1-1,024 for <code>standard</code>, 4-16,384 for
  /// <code>io1</code>, 1-16,384 for <code>gp2</code>, and 500-16,384 for
  /// <code>st1</code> and <code>sc1</code>. If you specify a snapshot, the volume
  /// size must be equal to or larger than the snapshot size.
  ///
  /// Default: If you create a volume from a snapshot and you don't specify a
  /// volume size, the default is the snapshot size.
  ///
  /// You must specify either a <code>VolumeSize</code> or a
  /// <code>SnapshotId</code>. If you specify both <code>SnapshotId</code> and
  /// <code>VolumeSize</code>, the volume size must be equal or greater than the
  /// size of the snapshot.
  @_s.JsonKey(name: 'VolumeSize')
  final int volumeSize;

  /// The volume type, which can be <code>standard</code> for Magnetic,
  /// <code>io1</code> for Provisioned IOPS SSD, <code>gp2</code> for General
  /// Purpose SSD, <code>st1</code> for Throughput Optimized HDD, or
  /// <code>sc1</code> for Cold HDD. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon
  /// EBS Volume Types</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  ///
  /// Valid Values: <code>standard</code> | <code>io1</code> | <code>gp2</code> |
  /// <code>st1</code> | <code>sc1</code>
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  Ebs({
    this.deleteOnTermination,
    this.encrypted,
    this.iops,
    this.snapshotId,
    this.volumeSize,
    this.volumeType,
  });
  factory Ebs.fromXml(_s.XmlElement elem) {
    return Ebs(
      deleteOnTermination: _s.extractXmlBoolValue(elem, 'DeleteOnTermination'),
      encrypted: _s.extractXmlBoolValue(elem, 'Encrypted'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      snapshotId: _s.extractXmlStringValue(elem, 'SnapshotId'),
      volumeSize: _s.extractXmlIntValue(elem, 'VolumeSize'),
      volumeType: _s.extractXmlStringValue(elem, 'VolumeType'),
    );
  }

  Map<String, dynamic> toJson() => _$EbsToJson(this);
}

/// Describes an enabled metric.
class EnabledMetric {
  /// The granularity of the metric. The only valid value is <code>1Minute</code>.
  final String granularity;

  /// One of the following metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>GroupMinSize</code>
  /// </li>
  /// <li>
  /// <code>GroupMaxSize</code>
  /// </li>
  /// <li>
  /// <code>GroupDesiredCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalCapacity</code>
  /// </li>
  /// </ul>
  final String metric;

  EnabledMetric({
    this.granularity,
    this.metric,
  });
  factory EnabledMetric.fromXml(_s.XmlElement elem) {
    return EnabledMetric(
      granularity: _s.extractXmlStringValue(elem, 'Granularity'),
      metric: _s.extractXmlStringValue(elem, 'Metric'),
    );
  }
}

class EnterStandbyAnswer {
  /// The activities related to moving instances into <code>Standby</code> mode.
  final List<Activity> activities;

  EnterStandbyAnswer({
    this.activities,
  });
  factory EnterStandbyAnswer.fromXml(_s.XmlElement elem) {
    return EnterStandbyAnswer(
      activities: _s.extractXmlChild(elem, 'Activities')?.let((elem) =>
          elem.findElements('member').map((c) => Activity.fromXml(c)).toList()),
    );
  }
}

class ExitStandbyAnswer {
  /// The activities related to moving instances out of <code>Standby</code> mode.
  final List<Activity> activities;

  ExitStandbyAnswer({
    this.activities,
  });
  factory ExitStandbyAnswer.fromXml(_s.XmlElement elem) {
    return ExitStandbyAnswer(
      activities: _s.extractXmlChild(elem, 'Activities')?.let((elem) =>
          elem.findElements('member').map((c) => Activity.fromXml(c)).toList()),
    );
  }
}

/// Describes a scheduled action that could not be created, updated, or deleted.
class FailedScheduledUpdateGroupActionRequest {
  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The error code.
  final String errorCode;

  /// The error message accompanying the error code.
  final String errorMessage;

  FailedScheduledUpdateGroupActionRequest({
    @_s.required this.scheduledActionName,
    this.errorCode,
    this.errorMessage,
  });
  factory FailedScheduledUpdateGroupActionRequest.fromXml(_s.XmlElement elem) {
    return FailedScheduledUpdateGroupActionRequest(
      scheduledActionName:
          _s.extractXmlStringValue(elem, 'ScheduledActionName'),
      errorCode: _s.extractXmlStringValue(elem, 'ErrorCode'),
      errorMessage: _s.extractXmlStringValue(elem, 'ErrorMessage'),
    );
  }
}

/// Describes a filter that is used to return a more specific list of results
/// when describing tags.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging
/// Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter. The valid values are:
  /// <code>auto-scaling-group</code>, <code>key</code>, <code>value</code>, and
  /// <code>propagate-at-launch</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// One or more filter values. Filter values are case-sensitive.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// Describes an EC2 instance.
class Instance {
  /// The Availability Zone in which the instance is running.
  final String availabilityZone;

  /// The last reported health status of the instance. "Healthy" means that the
  /// instance is healthy and should remain in service. "Unhealthy" means that the
  /// instance is unhealthy and that Amazon EC2 Auto Scaling should terminate and
  /// replace it.
  final String healthStatus;

  /// The ID of the instance.
  final String instanceId;

  /// A description of the current lifecycle state. The <code>Quarantined</code>
  /// state is not used.
  final LifecycleState lifecycleState;

  /// Indicates whether the instance is protected from termination by Amazon EC2
  /// Auto Scaling when scaling in.
  final bool protectedFromScaleIn;

  /// The instance type of the EC2 instance.
  final String instanceType;

  /// The launch configuration associated with the instance.
  final String launchConfigurationName;

  /// The launch template for the instance.
  final LaunchTemplateSpecification launchTemplate;

  /// The number of capacity units contributed by the instance based on its
  /// instance type.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 999.
  final String weightedCapacity;

  Instance({
    @_s.required this.availabilityZone,
    @_s.required this.healthStatus,
    @_s.required this.instanceId,
    @_s.required this.lifecycleState,
    @_s.required this.protectedFromScaleIn,
    this.instanceType,
    this.launchConfigurationName,
    this.launchTemplate,
    this.weightedCapacity,
  });
  factory Instance.fromXml(_s.XmlElement elem) {
    return Instance(
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      healthStatus: _s.extractXmlStringValue(elem, 'HealthStatus'),
      instanceId: _s.extractXmlStringValue(elem, 'InstanceId'),
      lifecycleState:
          _s.extractXmlStringValue(elem, 'LifecycleState')?.toLifecycleState(),
      protectedFromScaleIn:
          _s.extractXmlBoolValue(elem, 'ProtectedFromScaleIn'),
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchConfigurationName:
          _s.extractXmlStringValue(elem, 'LaunchConfigurationName'),
      launchTemplate: _s
          .extractXmlChild(elem, 'LaunchTemplate')
          ?.let((e) => LaunchTemplateSpecification.fromXml(e)),
      weightedCapacity: _s.extractXmlStringValue(elem, 'WeightedCapacity'),
    );
  }
}

enum InstanceMetadataEndpointState {
  @_s.JsonValue('disabled')
  disabled,
  @_s.JsonValue('enabled')
  enabled,
}

extension on String {
  InstanceMetadataEndpointState toInstanceMetadataEndpointState() {
    switch (this) {
      case 'disabled':
        return InstanceMetadataEndpointState.disabled;
      case 'enabled':
        return InstanceMetadataEndpointState.enabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum InstanceMetadataHttpTokensState {
  @_s.JsonValue('optional')
  optional,
  @_s.JsonValue('required')
  required,
}

extension on String {
  InstanceMetadataHttpTokensState toInstanceMetadataHttpTokensState() {
    switch (this) {
      case 'optional':
        return InstanceMetadataHttpTokensState.optional;
      case 'required':
        return InstanceMetadataHttpTokensState.required;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The metadata options for the instances. For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring
/// the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceMetadataOptions {
  /// This parameter enables or disables the HTTP metadata endpoint on your
  /// instances. If the parameter is not specified, the default state is
  /// <code>enabled</code>.
  /// <note>
  /// If you specify a value of <code>disabled</code>, you will not be able to
  /// access your instance metadata.
  /// </note>
  @_s.JsonKey(name: 'HttpEndpoint')
  final InstanceMetadataEndpointState httpEndpoint;

  /// The desired HTTP PUT response hop limit for instance metadata requests. The
  /// larger the number, the further instance metadata requests can travel.
  ///
  /// Default: 1
  ///
  /// Possible values: Integers from 1 to 64
  @_s.JsonKey(name: 'HttpPutResponseHopLimit')
  final int httpPutResponseHopLimit;

  /// The state of token usage for your instance metadata requests. If the
  /// parameter is not specified in the request, the default state is
  /// <code>optional</code>.
  ///
  /// If the state is <code>optional</code>, you can choose to retrieve instance
  /// metadata with or without a signed token header on your request. If you
  /// retrieve the IAM role credentials without a token, the version 1.0 role
  /// credentials are returned. If you retrieve the IAM role credentials using a
  /// valid signed token, the version 2.0 role credentials are returned.
  ///
  /// If the state is <code>required</code>, you must send a signed token header
  /// with any instance metadata retrieval requests. In this state, retrieving the
  /// IAM role credentials always returns the version 2.0 credentials; the version
  /// 1.0 credentials are not available.
  @_s.JsonKey(name: 'HttpTokens')
  final InstanceMetadataHttpTokensState httpTokens;

  InstanceMetadataOptions({
    this.httpEndpoint,
    this.httpPutResponseHopLimit,
    this.httpTokens,
  });
  factory InstanceMetadataOptions.fromXml(_s.XmlElement elem) {
    return InstanceMetadataOptions(
      httpEndpoint: _s
          .extractXmlStringValue(elem, 'HttpEndpoint')
          ?.toInstanceMetadataEndpointState(),
      httpPutResponseHopLimit:
          _s.extractXmlIntValue(elem, 'HttpPutResponseHopLimit'),
      httpTokens: _s
          .extractXmlStringValue(elem, 'HttpTokens')
          ?.toInstanceMetadataHttpTokensState(),
    );
  }

  Map<String, dynamic> toJson() => _$InstanceMetadataOptionsToJson(this);
}

/// Describes whether detailed monitoring is enabled for the Auto Scaling
/// instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceMonitoring {
  /// If <code>true</code>, detailed monitoring is enabled. Otherwise, basic
  /// monitoring is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  InstanceMonitoring({
    this.enabled,
  });
  factory InstanceMonitoring.fromXml(_s.XmlElement elem) {
    return InstanceMonitoring(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
    );
  }

  Map<String, dynamic> toJson() => _$InstanceMonitoringToJson(this);
}

/// Describes an instance refresh for an Auto Scaling group.
class InstanceRefresh {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The date and time at which the instance refresh ended.
  final DateTime endTime;

  /// The instance refresh ID.
  final String instanceRefreshId;

  /// The number of instances remaining to update before the instance refresh is
  /// complete.
  final int instancesToUpdate;

  /// The percentage of the instance refresh that is complete. For each instance
  /// replacement, Amazon EC2 Auto Scaling tracks the instance's health status and
  /// warm-up time. When the instance's health status changes to healthy and the
  /// specified warm-up time passes, the instance is considered updated and added
  /// to the percentage complete.
  final int percentageComplete;

  /// The date and time at which the instance refresh began.
  final DateTime startTime;

  /// The current status for the instance refresh operation:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code> - The request was created, but the operation has not
  /// started.
  /// </li>
  /// <li>
  /// <code>InProgress</code> - The operation is in progress.
  /// </li>
  /// <li>
  /// <code>Successful</code> - The operation completed successfully.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The operation failed to complete. You can troubleshoot
  /// using the status reason and the scaling activities.
  /// </li>
  /// <li>
  /// <code>Cancelling</code> - An ongoing operation is being cancelled.
  /// Cancellation does not roll back any replacements that have already been
  /// completed, but it prevents new replacements from being started.
  /// </li>
  /// <li>
  /// <code>Cancelled</code> - The operation is cancelled.
  /// </li>
  /// </ul>
  final InstanceRefreshStatus status;

  /// Provides more details about the current status of the instance refresh.
  final String statusReason;

  InstanceRefresh({
    this.autoScalingGroupName,
    this.endTime,
    this.instanceRefreshId,
    this.instancesToUpdate,
    this.percentageComplete,
    this.startTime,
    this.status,
    this.statusReason,
  });
  factory InstanceRefresh.fromXml(_s.XmlElement elem) {
    return InstanceRefresh(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      instanceRefreshId: _s.extractXmlStringValue(elem, 'InstanceRefreshId'),
      instancesToUpdate: _s.extractXmlIntValue(elem, 'InstancesToUpdate'),
      percentageComplete: _s.extractXmlIntValue(elem, 'PercentageComplete'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toInstanceRefreshStatus(),
      statusReason: _s.extractXmlStringValue(elem, 'StatusReason'),
    );
  }
}

enum InstanceRefreshStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelling')
  cancelling,
  @_s.JsonValue('Cancelled')
  cancelled,
}

extension on String {
  InstanceRefreshStatus toInstanceRefreshStatus() {
    switch (this) {
      case 'Pending':
        return InstanceRefreshStatus.pending;
      case 'InProgress':
        return InstanceRefreshStatus.inProgress;
      case 'Successful':
        return InstanceRefreshStatus.successful;
      case 'Failed':
        return InstanceRefreshStatus.failed;
      case 'Cancelling':
        return InstanceRefreshStatus.cancelling;
      case 'Cancelled':
        return InstanceRefreshStatus.cancelled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an instances distribution for an Auto Scaling group with a
/// <a>MixedInstancesPolicy</a>.
///
/// The instances distribution specifies the distribution of On-Demand Instances
/// and Spot Instances, the maximum price to pay for Spot Instances, and how the
/// Auto Scaling group allocates instance types to fulfill On-Demand and Spot
/// capacities.
///
/// When you update <code>SpotAllocationStrategy</code>,
/// <code>SpotInstancePools</code>, or <code>SpotMaxPrice</code>, this update
/// action does not deploy any changes across the running Amazon EC2 instances
/// in the group. Your existing Spot Instances continue to run as long as the
/// maximum price for those instances is higher than the current Spot price.
/// When scale out occurs, Amazon EC2 Auto Scaling launches instances based on
/// the new settings. When scale in occurs, Amazon EC2 Auto Scaling terminates
/// instances according to the group's termination policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstancesDistribution {
  /// Indicates how to allocate instance types to fulfill On-Demand capacity. The
  /// only valid value is <code>prioritized</code>, which is also the default
  /// value. This strategy uses the order of instance types in the overrides to
  /// define the launch priority of each instance type. The first instance type in
  /// the array is prioritized higher than the last. If all your On-Demand
  /// capacity cannot be fulfilled using your highest priority instance, then the
  /// Auto Scaling groups launches the remaining capacity using the second
  /// priority instance type, and so on.
  @_s.JsonKey(name: 'OnDemandAllocationStrategy')
  final String onDemandAllocationStrategy;

  /// The minimum amount of the Auto Scaling group's capacity that must be
  /// fulfilled by On-Demand Instances. This base portion is provisioned first as
  /// your group scales. Defaults to 0 if not specified. If you specify weights
  /// for the instance types in the overrides, set the value of
  /// <code>OnDemandBaseCapacity</code> in terms of the number of capacity units,
  /// and not the number of instances.
  @_s.JsonKey(name: 'OnDemandBaseCapacity')
  final int onDemandBaseCapacity;

  /// Controls the percentages of On-Demand Instances and Spot Instances for your
  /// additional capacity beyond <code>OnDemandBaseCapacity</code>. Expressed as a
  /// number (for example, 20 specifies 20% On-Demand Instances, 80% Spot
  /// Instances). Defaults to 100 if not specified. If set to 100, only On-Demand
  /// Instances are provisioned.
  @_s.JsonKey(name: 'OnDemandPercentageAboveBaseCapacity')
  final int onDemandPercentageAboveBaseCapacity;

  /// Indicates how to allocate instances across Spot Instance pools. If the
  /// allocation strategy is <code>capacity-optimized</code> (recommended), the
  /// Auto Scaling group launches instances using Spot pools that are optimally
  /// chosen based on the available Spot capacity. If the allocation strategy is
  /// <code>lowest-price</code>, the Auto Scaling group launches instances using
  /// the Spot pools with the lowest price, and evenly allocates your instances
  /// across the number of Spot pools that you specify. Defaults to
  /// <code>lowest-price</code> if not specified.
  @_s.JsonKey(name: 'SpotAllocationStrategy')
  final String spotAllocationStrategy;

  /// The number of Spot Instance pools across which to allocate your Spot
  /// Instances. The Spot pools are determined from the different instance types
  /// in the overrides. Valid only when the Spot allocation strategy is
  /// <code>lowest-price</code>. Value must be in the range of 1 to 20. Defaults
  /// to 2 if not specified.
  @_s.JsonKey(name: 'SpotInstancePools')
  final int spotInstancePools;

  /// The maximum price per unit hour that you are willing to pay for a Spot
  /// Instance. If you leave the value at its default (empty), Amazon EC2 Auto
  /// Scaling uses the On-Demand price as the maximum Spot price. To remove a
  /// value that you previously set, include the property but specify an empty
  /// string ("") for the value.
  @_s.JsonKey(name: 'SpotMaxPrice')
  final String spotMaxPrice;

  InstancesDistribution({
    this.onDemandAllocationStrategy,
    this.onDemandBaseCapacity,
    this.onDemandPercentageAboveBaseCapacity,
    this.spotAllocationStrategy,
    this.spotInstancePools,
    this.spotMaxPrice,
  });
  factory InstancesDistribution.fromXml(_s.XmlElement elem) {
    return InstancesDistribution(
      onDemandAllocationStrategy:
          _s.extractXmlStringValue(elem, 'OnDemandAllocationStrategy'),
      onDemandBaseCapacity: _s.extractXmlIntValue(elem, 'OnDemandBaseCapacity'),
      onDemandPercentageAboveBaseCapacity:
          _s.extractXmlIntValue(elem, 'OnDemandPercentageAboveBaseCapacity'),
      spotAllocationStrategy:
          _s.extractXmlStringValue(elem, 'SpotAllocationStrategy'),
      spotInstancePools: _s.extractXmlIntValue(elem, 'SpotInstancePools'),
      spotMaxPrice: _s.extractXmlStringValue(elem, 'SpotMaxPrice'),
    );
  }

  Map<String, dynamic> toJson() => _$InstancesDistributionToJson(this);
}

/// Describes a launch configuration.
class LaunchConfiguration {
  /// The creation date and time for the launch configuration.
  final DateTime createdTime;

  /// The ID of the Amazon Machine Image (AMI) to use to launch your EC2
  /// instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding
  /// an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  final String imageId;

  /// The instance type for the instances.
  ///
  /// For information about available instance types, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes">Available
  /// Instance Types</a> in the <i>Amazon EC2 User Guide for Linux Instances.</i>
  final String instanceType;

  /// The name of the launch configuration.
  final String launchConfigurationName;

  /// For Auto Scaling groups that are running in a VPC, specifies whether to
  /// assign a public IP address to the group's instances. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html">Launching
  /// Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  final bool associatePublicIpAddress;

  /// A block device mapping, which specifies the block devices for the instance.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block
  /// Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  final List<BlockDeviceMapping> blockDeviceMappings;

  /// The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a>
  /// in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink">Linking
  /// EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  final String classicLinkVPCId;

  /// The IDs of one or more security groups for the VPC specified in
  /// <code>ClassicLinkVPCId</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a>
  /// in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink">Linking
  /// EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  final List<String> classicLinkVPCSecurityGroups;

  /// Specifies whether the launch configuration is optimized for EBS I/O
  /// (<code>true</code>) or not (<code>false</code>). For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html">Amazon
  /// EBS-Optimized Instances</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  final bool ebsOptimized;

  /// The name or the Amazon Resource Name (ARN) of the instance profile
  /// associated with the IAM role for the instance. The instance profile contains
  /// the IAM role. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html">IAM
  /// role for applications that run on Amazon EC2 instances</a> in the <i>Amazon
  /// EC2 Auto Scaling User Guide</i>.
  final String iamInstanceProfile;

  /// Controls whether instances in this group are launched with detailed
  /// (<code>true</code>) or basic (<code>false</code>) monitoring.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html">Configure
  /// Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>.
  final InstanceMonitoring instanceMonitoring;

  /// The ID of the kernel associated with the AMI.
  final String kernelId;

  /// The name of the key pair.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon
  /// EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  final String keyName;

  /// The Amazon Resource Name (ARN) of the launch configuration.
  final String launchConfigurationARN;

  /// The metadata options for the instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring
  /// the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  final InstanceMetadataOptions metadataOptions;

  /// The tenancy of the instance, either <code>default</code> or
  /// <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs
  /// on isolated, single-tenant hardware and can only be launched into a VPC.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html">Configuring
  /// instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto
  /// Scaling User Guide</i>.
  final String placementTenancy;

  /// The ID of the RAM disk associated with the AMI.
  final String ramdiskId;

  /// A list that contains the security groups to assign to the instances in the
  /// Auto Scaling group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security
  /// Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User
  /// Guide</i>.
  final List<String> securityGroups;

  /// The maximum hourly price to be paid for any Spot Instance launched to
  /// fulfill the request. Spot Instances are launched when the price you specify
  /// exceeds the current Spot price. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html">Requesting
  /// Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  final String spotPrice;

  /// The Base64-encoded user data to make available to the launched EC2
  /// instances. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance
  /// metadata and user data</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  final String userData;

  LaunchConfiguration({
    @_s.required this.createdTime,
    @_s.required this.imageId,
    @_s.required this.instanceType,
    @_s.required this.launchConfigurationName,
    this.associatePublicIpAddress,
    this.blockDeviceMappings,
    this.classicLinkVPCId,
    this.classicLinkVPCSecurityGroups,
    this.ebsOptimized,
    this.iamInstanceProfile,
    this.instanceMonitoring,
    this.kernelId,
    this.keyName,
    this.launchConfigurationARN,
    this.metadataOptions,
    this.placementTenancy,
    this.ramdiskId,
    this.securityGroups,
    this.spotPrice,
    this.userData,
  });
  factory LaunchConfiguration.fromXml(_s.XmlElement elem) {
    return LaunchConfiguration(
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      imageId: _s.extractXmlStringValue(elem, 'ImageId'),
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchConfigurationName:
          _s.extractXmlStringValue(elem, 'LaunchConfigurationName'),
      associatePublicIpAddress:
          _s.extractXmlBoolValue(elem, 'AssociatePublicIpAddress'),
      blockDeviceMappings: _s.extractXmlChild(elem, 'BlockDeviceMappings')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => BlockDeviceMapping.fromXml(c))
              .toList()),
      classicLinkVPCId: _s.extractXmlStringValue(elem, 'ClassicLinkVPCId'),
      classicLinkVPCSecurityGroups: _s
          .extractXmlChild(elem, 'ClassicLinkVPCSecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      ebsOptimized: _s.extractXmlBoolValue(elem, 'EbsOptimized'),
      iamInstanceProfile: _s.extractXmlStringValue(elem, 'IamInstanceProfile'),
      instanceMonitoring: _s
          .extractXmlChild(elem, 'InstanceMonitoring')
          ?.let((e) => InstanceMonitoring.fromXml(e)),
      kernelId: _s.extractXmlStringValue(elem, 'KernelId'),
      keyName: _s.extractXmlStringValue(elem, 'KeyName'),
      launchConfigurationARN:
          _s.extractXmlStringValue(elem, 'LaunchConfigurationARN'),
      metadataOptions: _s
          .extractXmlChild(elem, 'MetadataOptions')
          ?.let((e) => InstanceMetadataOptions.fromXml(e)),
      placementTenancy: _s.extractXmlStringValue(elem, 'PlacementTenancy'),
      ramdiskId: _s.extractXmlStringValue(elem, 'RamdiskId'),
      securityGroups: _s
          .extractXmlChild(elem, 'SecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      spotPrice: _s.extractXmlStringValue(elem, 'SpotPrice'),
      userData: _s.extractXmlStringValue(elem, 'UserData'),
    );
  }
}

class LaunchConfigurationsType {
  /// The launch configurations.
  final List<LaunchConfiguration> launchConfigurations;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  LaunchConfigurationsType({
    @_s.required this.launchConfigurations,
    this.nextToken,
  });
  factory LaunchConfigurationsType.fromXml(_s.XmlElement elem) {
    return LaunchConfigurationsType(
      launchConfigurations: _s
          .extractXmlChild(elem, 'LaunchConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => LaunchConfiguration.fromXml(c))
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }
}

/// Describes a launch template and overrides.
///
/// You specify these parameters as part of a mixed instances policy.
///
/// When you update the launch template or overrides, existing Amazon EC2
/// instances continue to run. When scale out occurs, Amazon EC2 Auto Scaling
/// launches instances to match the new settings. When scale in occurs, Amazon
/// EC2 Auto Scaling terminates instances according to the group's termination
/// policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LaunchTemplate {
  /// The launch template to use.
  @_s.JsonKey(name: 'LaunchTemplateSpecification')
  final LaunchTemplateSpecification launchTemplateSpecification;

  /// Any parameters that you specify override the same parameters in the launch
  /// template. If not provided, Amazon EC2 Auto Scaling uses the instance type
  /// specified in the launch template when it launches an instance.
  @_s.JsonKey(name: 'Overrides')
  final List<LaunchTemplateOverrides> overrides;

  LaunchTemplate({
    this.launchTemplateSpecification,
    this.overrides,
  });
  factory LaunchTemplate.fromXml(_s.XmlElement elem) {
    return LaunchTemplate(
      launchTemplateSpecification: _s
          .extractXmlChild(elem, 'LaunchTemplateSpecification')
          ?.let((e) => LaunchTemplateSpecification.fromXml(e)),
      overrides: _s.extractXmlChild(elem, 'Overrides')?.let((elem) => elem
          .findElements('member')
          .map((c) => LaunchTemplateOverrides.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() => _$LaunchTemplateToJson(this);
}

/// Describes an override for a launch template. The maximum number of instance
/// types that can be associated with an Auto Scaling group is 20. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-override-options.html">Configuring
/// overrides</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LaunchTemplateOverrides {
  /// The instance type, such as <code>m3.xlarge</code>. You must use an instance
  /// type that is supported in your requested Region and Availability Zones. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance
  /// types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// Provides the launch template to be used when launching the instance type.
  /// For example, some instance types might require a launch template with a
  /// different AMI. If not provided, Amazon EC2 Auto Scaling uses the launch
  /// template that's defined for your mixed instances policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-template-overrides.html">Specifying
  /// a different launch template for an instance type</a> in the <i>Amazon EC2
  /// Auto Scaling User Guide</i>.
  @_s.JsonKey(name: 'LaunchTemplateSpecification')
  final LaunchTemplateSpecification launchTemplateSpecification;

  /// The number of capacity units provided by the specified instance type in
  /// terms of virtual CPUs, memory, storage, throughput, or other relative
  /// performance characteristic. When a Spot or On-Demand Instance is
  /// provisioned, the capacity units count toward the desired capacity. Amazon
  /// EC2 Auto Scaling provisions instances until the desired capacity is totally
  /// fulfilled, even if this results in an overage. For example, if there are 2
  /// units remaining to fulfill capacity, and Amazon EC2 Auto Scaling can only
  /// provision an instance with a <code>WeightedCapacity</code> of 5 units, the
  /// instance is provisioned, and the desired capacity is exceeded by 3 units.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html">Instance
  /// weighting for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling
  /// User Guide</i>. Value must be in the range of 1 to 999.
  @_s.JsonKey(name: 'WeightedCapacity')
  final String weightedCapacity;

  LaunchTemplateOverrides({
    this.instanceType,
    this.launchTemplateSpecification,
    this.weightedCapacity,
  });
  factory LaunchTemplateOverrides.fromXml(_s.XmlElement elem) {
    return LaunchTemplateOverrides(
      instanceType: _s.extractXmlStringValue(elem, 'InstanceType'),
      launchTemplateSpecification: _s
          .extractXmlChild(elem, 'LaunchTemplateSpecification')
          ?.let((e) => LaunchTemplateSpecification.fromXml(e)),
      weightedCapacity: _s.extractXmlStringValue(elem, 'WeightedCapacity'),
    );
  }

  Map<String, dynamic> toJson() => _$LaunchTemplateOverridesToJson(this);
}

/// Describes the Amazon EC2 launch template and the launch template version
/// that can be used by an Auto Scaling group to configure Amazon EC2 instances.
///
/// The launch template that is specified must be configured for use with an
/// Auto Scaling group. For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html">Creating
/// a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto
/// Scaling User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LaunchTemplateSpecification {
  /// The ID of the launch template. To get the template ID, use the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html">DescribeLaunchTemplates</a>
  /// API operation. New launch templates can be created using the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html">CreateLaunchTemplate</a>
  /// API.
  ///
  /// Conditional: You must specify either a <code>LaunchTemplateId</code> or a
  /// <code>LaunchTemplateName</code>.
  @_s.JsonKey(name: 'LaunchTemplateId')
  final String launchTemplateId;

  /// The name of the launch template. To get the template name, use the Amazon
  /// EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html">DescribeLaunchTemplates</a>
  /// API operation. New launch templates can be created using the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html">CreateLaunchTemplate</a>
  /// API.
  ///
  /// Conditional: You must specify either a <code>LaunchTemplateId</code> or a
  /// <code>LaunchTemplateName</code>.
  @_s.JsonKey(name: 'LaunchTemplateName')
  final String launchTemplateName;

  /// The version number, <code>$Latest</code>, or <code>$Default</code>. To get
  /// the version number, use the Amazon EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplateVersions.html">DescribeLaunchTemplateVersions</a>
  /// API operation. New launch template versions can be created using the Amazon
  /// EC2 <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplateVersion.html">CreateLaunchTemplateVersion</a>
  /// API. If the value is <code>$Latest</code>, Amazon EC2 Auto Scaling selects
  /// the latest version of the launch template when launching instances. If the
  /// value is <code>$Default</code>, Amazon EC2 Auto Scaling selects the default
  /// version of the launch template when launching instances. The default value
  /// is <code>$Default</code>.
  @_s.JsonKey(name: 'Version')
  final String version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });
  factory LaunchTemplateSpecification.fromXml(_s.XmlElement elem) {
    return LaunchTemplateSpecification(
      launchTemplateId: _s.extractXmlStringValue(elem, 'LaunchTemplateId'),
      launchTemplateName: _s.extractXmlStringValue(elem, 'LaunchTemplateName'),
      version: _s.extractXmlStringValue(elem, 'Version'),
    );
  }

  Map<String, dynamic> toJson() => _$LaunchTemplateSpecificationToJson(this);
}

/// Describes a lifecycle hook, which tells Amazon EC2 Auto Scaling that you
/// want to perform an action whenever it launches instances or terminates
/// instances.
class LifecycleHook {
  /// The name of the Auto Scaling group for the lifecycle hook.
  final String autoScalingGroupName;

  /// Defines the action the Auto Scaling group should take when the lifecycle
  /// hook timeout elapses or if an unexpected failure occurs. The possible values
  /// are <code>CONTINUE</code> and <code>ABANDON</code>.
  final String defaultResult;

  /// The maximum time, in seconds, that an instance can remain in a
  /// <code>Pending:Wait</code> or <code>Terminating:Wait</code> state. The
  /// maximum is 172800 seconds (48 hours) or 100 times
  /// <code>HeartbeatTimeout</code>, whichever is smaller.
  final int globalTimeout;

  /// The maximum time, in seconds, that can elapse before the lifecycle hook
  /// times out. If the lifecycle hook times out, Amazon EC2 Auto Scaling performs
  /// the action that you specified in the <code>DefaultResult</code> parameter.
  final int heartbeatTimeout;

  /// The name of the lifecycle hook.
  final String lifecycleHookName;

  /// The state of the EC2 instance to which to attach the lifecycle hook. The
  /// following are possible values:
  ///
  /// <ul>
  /// <li>
  /// autoscaling:EC2_INSTANCE_LAUNCHING
  /// </li>
  /// <li>
  /// autoscaling:EC2_INSTANCE_TERMINATING
  /// </li>
  /// </ul>
  final String lifecycleTransition;

  /// Additional information that is included any time Amazon EC2 Auto Scaling
  /// sends a message to the notification target.
  final String notificationMetadata;

  /// The ARN of the target that Amazon EC2 Auto Scaling sends notifications to
  /// when an instance is in the transition state for the lifecycle hook. The
  /// notification target can be either an SQS queue or an SNS topic.
  final String notificationTargetARN;

  /// The ARN of the IAM role that allows the Auto Scaling group to publish to the
  /// specified notification target.
  final String roleARN;

  LifecycleHook({
    this.autoScalingGroupName,
    this.defaultResult,
    this.globalTimeout,
    this.heartbeatTimeout,
    this.lifecycleHookName,
    this.lifecycleTransition,
    this.notificationMetadata,
    this.notificationTargetARN,
    this.roleARN,
  });
  factory LifecycleHook.fromXml(_s.XmlElement elem) {
    return LifecycleHook(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      defaultResult: _s.extractXmlStringValue(elem, 'DefaultResult'),
      globalTimeout: _s.extractXmlIntValue(elem, 'GlobalTimeout'),
      heartbeatTimeout: _s.extractXmlIntValue(elem, 'HeartbeatTimeout'),
      lifecycleHookName: _s.extractXmlStringValue(elem, 'LifecycleHookName'),
      lifecycleTransition:
          _s.extractXmlStringValue(elem, 'LifecycleTransition'),
      notificationMetadata:
          _s.extractXmlStringValue(elem, 'NotificationMetadata'),
      notificationTargetARN:
          _s.extractXmlStringValue(elem, 'NotificationTargetARN'),
      roleARN: _s.extractXmlStringValue(elem, 'RoleARN'),
    );
  }
}

/// Describes information used to specify a lifecycle hook for an Auto Scaling
/// group.
///
/// A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an
/// instance when the instance launches (before it is put into service) or as
/// the instance terminates (before it is fully terminated).
///
/// This step is a part of the procedure for creating a lifecycle hook for an
/// Auto Scaling group:
/// <ol>
/// <li>
/// (Optional) Create a Lambda function and a rule that allows CloudWatch Events
/// to invoke your Lambda function when Amazon EC2 Auto Scaling launches or
/// terminates instances.
/// </li>
/// <li>
/// (Optional) Create a notification target and an IAM role. The target can be
/// either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon
/// EC2 Auto Scaling to publish lifecycle notifications to the target.
/// </li>
/// <li>
/// <b>Create the lifecycle hook. Specify whether the hook is used when the
/// instances launch or terminate.</b>
/// </li>
/// <li>
/// If you need more time, record the lifecycle action heartbeat to keep the
/// instance in a pending state.
/// </li>
/// <li>
/// If you finish before the timeout period ends, complete the lifecycle action.
/// </li> </ol>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon
/// EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LifecycleHookSpecification {
  /// The name of the lifecycle hook.
  @_s.JsonKey(name: 'LifecycleHookName')
  final String lifecycleHookName;

  /// The state of the EC2 instance to which you want to attach the lifecycle
  /// hook. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// autoscaling:EC2_INSTANCE_LAUNCHING
  /// </li>
  /// <li>
  /// autoscaling:EC2_INSTANCE_TERMINATING
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'LifecycleTransition')
  final String lifecycleTransition;

  /// Defines the action the Auto Scaling group should take when the lifecycle
  /// hook timeout elapses or if an unexpected failure occurs. The valid values
  /// are <code>CONTINUE</code> and <code>ABANDON</code>. The default value is
  /// <code>ABANDON</code>.
  @_s.JsonKey(name: 'DefaultResult')
  final String defaultResult;

  /// The maximum time, in seconds, that can elapse before the lifecycle hook
  /// times out.
  ///
  /// If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action
  /// that you specified in the <code>DefaultResult</code> parameter. You can
  /// prevent the lifecycle hook from timing out by calling
  /// <a>RecordLifecycleActionHeartbeat</a>.
  @_s.JsonKey(name: 'HeartbeatTimeout')
  final int heartbeatTimeout;

  /// Additional information that you want to include any time Amazon EC2 Auto
  /// Scaling sends a message to the notification target.
  @_s.JsonKey(name: 'NotificationMetadata')
  final String notificationMetadata;

  /// The ARN of the target that Amazon EC2 Auto Scaling sends notifications to
  /// when an instance is in the transition state for the lifecycle hook. The
  /// notification target can be either an SQS queue or an SNS topic.
  @_s.JsonKey(name: 'NotificationTargetARN')
  final String notificationTargetARN;

  /// The ARN of the IAM role that allows the Auto Scaling group to publish to the
  /// specified notification target, for example, an Amazon SNS topic or an Amazon
  /// SQS queue.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  LifecycleHookSpecification({
    @_s.required this.lifecycleHookName,
    @_s.required this.lifecycleTransition,
    this.defaultResult,
    this.heartbeatTimeout,
    this.notificationMetadata,
    this.notificationTargetARN,
    this.roleARN,
  });
  Map<String, dynamic> toJson() => _$LifecycleHookSpecificationToJson(this);
}

enum LifecycleState {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Pending:Wait')
  pendingWait,
  @_s.JsonValue('Pending:Proceed')
  pendingProceed,
  @_s.JsonValue('Quarantined')
  quarantined,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Terminating')
  terminating,
  @_s.JsonValue('Terminating:Wait')
  terminatingWait,
  @_s.JsonValue('Terminating:Proceed')
  terminatingProceed,
  @_s.JsonValue('Terminated')
  terminated,
  @_s.JsonValue('Detaching')
  detaching,
  @_s.JsonValue('Detached')
  detached,
  @_s.JsonValue('EnteringStandby')
  enteringStandby,
  @_s.JsonValue('Standby')
  standby,
}

extension on String {
  LifecycleState toLifecycleState() {
    switch (this) {
      case 'Pending':
        return LifecycleState.pending;
      case 'Pending:Wait':
        return LifecycleState.pendingWait;
      case 'Pending:Proceed':
        return LifecycleState.pendingProceed;
      case 'Quarantined':
        return LifecycleState.quarantined;
      case 'InService':
        return LifecycleState.inService;
      case 'Terminating':
        return LifecycleState.terminating;
      case 'Terminating:Wait':
        return LifecycleState.terminatingWait;
      case 'Terminating:Proceed':
        return LifecycleState.terminatingProceed;
      case 'Terminated':
        return LifecycleState.terminated;
      case 'Detaching':
        return LifecycleState.detaching;
      case 'Detached':
        return LifecycleState.detached;
      case 'EnteringStandby':
        return LifecycleState.enteringStandby;
      case 'Standby':
        return LifecycleState.standby;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the state of a Classic Load Balancer.
///
/// If you specify a load balancer when creating the Auto Scaling group, the
/// state of the load balancer is <code>InService</code>.
///
/// If you attach a load balancer to an existing Auto Scaling group, the initial
/// state is <code>Adding</code>. The state transitions to <code>Added</code>
/// after all instances in the group are registered with the load balancer. If
/// Elastic Load Balancing health checks are enabled for the load balancer, the
/// state transitions to <code>InService</code> after at least one instance in
/// the group passes the health check. If EC2 health checks are enabled instead,
/// the load balancer remains in the <code>Added</code> state.
class LoadBalancerState {
  /// The name of the load balancer.
  final String loadBalancerName;

  /// One of the following load balancer states:
  ///
  /// <ul>
  /// <li>
  /// <code>Adding</code> - The instances in the group are being registered with
  /// the load balancer.
  /// </li>
  /// <li>
  /// <code>Added</code> - All instances in the group are registered with the load
  /// balancer.
  /// </li>
  /// <li>
  /// <code>InService</code> - At least one instance in the group passed an ELB
  /// health check.
  /// </li>
  /// <li>
  /// <code>Removing</code> - The instances in the group are being deregistered
  /// from the load balancer. If connection draining is enabled, Elastic Load
  /// Balancing waits for in-flight requests to complete before deregistering the
  /// instances.
  /// </li>
  /// <li>
  /// <code>Removed</code> - All instances in the group are deregistered from the
  /// load balancer.
  /// </li>
  /// </ul>
  final String state;

  LoadBalancerState({
    this.loadBalancerName,
    this.state,
  });
  factory LoadBalancerState.fromXml(_s.XmlElement elem) {
    return LoadBalancerState(
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
      state: _s.extractXmlStringValue(elem, 'State'),
    );
  }
}

/// Describes the state of a target group.
///
/// If you attach a target group to an existing Auto Scaling group, the initial
/// state is <code>Adding</code>. The state transitions to <code>Added</code>
/// after all Auto Scaling instances are registered with the target group. If
/// Elastic Load Balancing health checks are enabled, the state transitions to
/// <code>InService</code> after at least one Auto Scaling instance passes the
/// health check. If EC2 health checks are enabled instead, the target group
/// remains in the <code>Added</code> state.
class LoadBalancerTargetGroupState {
  /// The Amazon Resource Name (ARN) of the target group.
  final String loadBalancerTargetGroupARN;

  /// The state of the target group.
  ///
  /// <ul>
  /// <li>
  /// <code>Adding</code> - The Auto Scaling instances are being registered with
  /// the target group.
  /// </li>
  /// <li>
  /// <code>Added</code> - All Auto Scaling instances are registered with the
  /// target group.
  /// </li>
  /// <li>
  /// <code>InService</code> - At least one Auto Scaling instance passed an ELB
  /// health check.
  /// </li>
  /// <li>
  /// <code>Removing</code> - The Auto Scaling instances are being deregistered
  /// from the target group. If connection draining is enabled, Elastic Load
  /// Balancing waits for in-flight requests to complete before deregistering the
  /// instances.
  /// </li>
  /// <li>
  /// <code>Removed</code> - All Auto Scaling instances are deregistered from the
  /// target group.
  /// </li>
  /// </ul>
  final String state;

  LoadBalancerTargetGroupState({
    this.loadBalancerTargetGroupARN,
    this.state,
  });
  factory LoadBalancerTargetGroupState.fromXml(_s.XmlElement elem) {
    return LoadBalancerTargetGroupState(
      loadBalancerTargetGroupARN:
          _s.extractXmlStringValue(elem, 'LoadBalancerTargetGroupARN'),
      state: _s.extractXmlStringValue(elem, 'State'),
    );
  }
}

/// Describes a metric.
class MetricCollectionType {
  /// One of the following metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>GroupMinSize</code>
  /// </li>
  /// <li>
  /// <code>GroupMaxSize</code>
  /// </li>
  /// <li>
  /// <code>GroupDesiredCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalInstances</code>
  /// </li>
  /// <li>
  /// <code>GroupInServiceCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupPendingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupStandbyCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTerminatingCapacity</code>
  /// </li>
  /// <li>
  /// <code>GroupTotalCapacity</code>
  /// </li>
  /// </ul>
  final String metric;

  MetricCollectionType({
    this.metric,
  });
  factory MetricCollectionType.fromXml(_s.XmlElement elem) {
    return MetricCollectionType(
      metric: _s.extractXmlStringValue(elem, 'Metric'),
    );
  }
}

/// Describes the dimension of a metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MetricDimension {
  /// The name of the dimension.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  MetricDimension({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory MetricDimension.fromXml(_s.XmlElement elem) {
    return MetricDimension(
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

/// Describes a granularity of a metric.
class MetricGranularityType {
  /// The granularity. The only valid value is <code>1Minute</code>.
  final String granularity;

  MetricGranularityType({
    this.granularity,
  });
  factory MetricGranularityType.fromXml(_s.XmlElement elem) {
    return MetricGranularityType(
      granularity: _s.extractXmlStringValue(elem, 'Granularity'),
    );
  }
}

enum MetricStatistic {
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('SampleCount')
  sampleCount,
  @_s.JsonValue('Sum')
  sum,
}

extension on String {
  MetricStatistic toMetricStatistic() {
    switch (this) {
      case 'Average':
        return MetricStatistic.average;
      case 'Minimum':
        return MetricStatistic.minimum;
      case 'Maximum':
        return MetricStatistic.maximum;
      case 'SampleCount':
        return MetricStatistic.sampleCount;
      case 'Sum':
        return MetricStatistic.sum;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum MetricType {
  @_s.JsonValue('ASGAverageCPUUtilization')
  aSGAverageCPUUtilization,
  @_s.JsonValue('ASGAverageNetworkIn')
  aSGAverageNetworkIn,
  @_s.JsonValue('ASGAverageNetworkOut')
  aSGAverageNetworkOut,
  @_s.JsonValue('ALBRequestCountPerTarget')
  aLBRequestCountPerTarget,
}

extension on String {
  MetricType toMetricType() {
    switch (this) {
      case 'ASGAverageCPUUtilization':
        return MetricType.aSGAverageCPUUtilization;
      case 'ASGAverageNetworkIn':
        return MetricType.aSGAverageNetworkIn;
      case 'ASGAverageNetworkOut':
        return MetricType.aSGAverageNetworkOut;
      case 'ALBRequestCountPerTarget':
        return MetricType.aLBRequestCountPerTarget;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a mixed instances policy for an Auto Scaling group. With mixed
/// instances, your Auto Scaling group can provision a combination of On-Demand
/// Instances and Spot Instances across multiple instance types. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html">Auto
/// Scaling groups with multiple instance types and purchase options</a> in the
/// <i>Amazon EC2 Auto Scaling User Guide</i>.
///
/// You can create a mixed instances policy for a new Auto Scaling group, or you
/// can create it for an existing group by updating the group to specify
/// <code>MixedInstancesPolicy</code> as the top-level parameter instead of a
/// launch configuration or launch template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MixedInstancesPolicy {
  /// Specifies the instances distribution. If not provided, the value for each
  /// parameter in <code>InstancesDistribution</code> uses a default value.
  @_s.JsonKey(name: 'InstancesDistribution')
  final InstancesDistribution instancesDistribution;

  /// Specifies the launch template to use and optionally the instance types
  /// (overrides) that are used to provision EC2 instances to fulfill On-Demand
  /// and Spot capacities. Required when creating a mixed instances policy.
  @_s.JsonKey(name: 'LaunchTemplate')
  final LaunchTemplate launchTemplate;

  MixedInstancesPolicy({
    this.instancesDistribution,
    this.launchTemplate,
  });
  factory MixedInstancesPolicy.fromXml(_s.XmlElement elem) {
    return MixedInstancesPolicy(
      instancesDistribution: _s
          .extractXmlChild(elem, 'InstancesDistribution')
          ?.let((e) => InstancesDistribution.fromXml(e)),
      launchTemplate: _s
          .extractXmlChild(elem, 'LaunchTemplate')
          ?.let((e) => LaunchTemplate.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$MixedInstancesPolicyToJson(this);
}

/// Describes a notification.
class NotificationConfiguration {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// One of the following event notification types:
  ///
  /// <ul>
  /// <li>
  /// <code>autoscaling:EC2_INSTANCE_LAUNCH</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:EC2_INSTANCE_TERMINATE</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:TEST_NOTIFICATION</code>
  /// </li>
  /// </ul>
  final String notificationType;

  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (Amazon SNS) topic.
  final String topicARN;

  NotificationConfiguration({
    this.autoScalingGroupName,
    this.notificationType,
    this.topicARN,
  });
  factory NotificationConfiguration.fromXml(_s.XmlElement elem) {
    return NotificationConfiguration(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      notificationType: _s.extractXmlStringValue(elem, 'NotificationType'),
      topicARN: _s.extractXmlStringValue(elem, 'TopicARN'),
    );
  }
}

class PoliciesType {
  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  /// The scaling policies.
  final List<ScalingPolicy> scalingPolicies;

  PoliciesType({
    this.nextToken,
    this.scalingPolicies,
  });
  factory PoliciesType.fromXml(_s.XmlElement elem) {
    return PoliciesType(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      scalingPolicies: _s.extractXmlChild(elem, 'ScalingPolicies')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => ScalingPolicy.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the output of PutScalingPolicy.
class PolicyARNType {
  /// The CloudWatch alarms created for the target tracking scaling policy.
  final List<Alarm> alarms;

  /// The Amazon Resource Name (ARN) of the policy.
  final String policyARN;

  PolicyARNType({
    this.alarms,
    this.policyARN,
  });
  factory PolicyARNType.fromXml(_s.XmlElement elem) {
    return PolicyARNType(
      alarms: _s.extractXmlChild(elem, 'Alarms')?.let((elem) =>
          elem.findElements('member').map((c) => Alarm.fromXml(c)).toList()),
      policyARN: _s.extractXmlStringValue(elem, 'PolicyARN'),
    );
  }
}

/// Represents a predefined metric for a target tracking scaling policy to use
/// with Amazon EC2 Auto Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PredefinedMetricSpecification {
  /// The metric type. The following predefined metrics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>ASGAverageCPUUtilization</code> - Average CPU utilization of the Auto
  /// Scaling group.
  /// </li>
  /// <li>
  /// <code>ASGAverageNetworkIn</code> - Average number of bytes received on all
  /// network interfaces by the Auto Scaling group.
  /// </li>
  /// <li>
  /// <code>ASGAverageNetworkOut</code> - Average number of bytes sent out on all
  /// network interfaces by the Auto Scaling group.
  /// </li>
  /// <li>
  /// <code>ALBRequestCountPerTarget</code> - Number of requests completed per
  /// target in an Application Load Balancer target group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'PredefinedMetricType')
  final MetricType predefinedMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group attached
  /// to the Auto Scaling group.
  ///
  /// You create the resource label by appending the final portion of the load
  /// balancer ARN and the final portion of the target group ARN into a single
  /// value, separated by a forward slash (/). The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  /// This is an example:
  /// app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.
  ///
  /// To find the ARN for an Application Load Balancer, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// API operation. To find the ARN for the target group, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a>
  /// API operation.
  @_s.JsonKey(name: 'ResourceLabel')
  final String resourceLabel;

  PredefinedMetricSpecification({
    @_s.required this.predefinedMetricType,
    this.resourceLabel,
  });
  factory PredefinedMetricSpecification.fromXml(_s.XmlElement elem) {
    return PredefinedMetricSpecification(
      predefinedMetricType: _s
          .extractXmlStringValue(elem, 'PredefinedMetricType')
          ?.toMetricType(),
      resourceLabel: _s.extractXmlStringValue(elem, 'ResourceLabel'),
    );
  }

  Map<String, dynamic> toJson() => _$PredefinedMetricSpecificationToJson(this);
}

/// Describes a process type.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types">Scaling
/// processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
class ProcessType {
  /// One of the following processes:
  ///
  /// <ul>
  /// <li>
  /// <code>Launch</code>
  /// </li>
  /// <li>
  /// <code>Terminate</code>
  /// </li>
  /// <li>
  /// <code>AddToLoadBalancer</code>
  /// </li>
  /// <li>
  /// <code>AlarmNotification</code>
  /// </li>
  /// <li>
  /// <code>AZRebalance</code>
  /// </li>
  /// <li>
  /// <code>HealthCheck</code>
  /// </li>
  /// <li>
  /// <code>InstanceRefresh</code>
  /// </li>
  /// <li>
  /// <code>ReplaceUnhealthy</code>
  /// </li>
  /// <li>
  /// <code>ScheduledActions</code>
  /// </li>
  /// </ul>
  final String processName;

  ProcessType({
    @_s.required this.processName,
  });
  factory ProcessType.fromXml(_s.XmlElement elem) {
    return ProcessType(
      processName: _s.extractXmlStringValue(elem, 'ProcessName'),
    );
  }
}

class ProcessesType {
  /// The names of the process types.
  final List<ProcessType> processes;

  ProcessesType({
    this.processes,
  });
  factory ProcessesType.fromXml(_s.XmlElement elem) {
    return ProcessesType(
      processes: _s.extractXmlChild(elem, 'Processes')?.let((elem) => elem
          .findElements('member')
          .map((c) => ProcessType.fromXml(c))
          .toList()),
    );
  }
}

class PutLifecycleHookAnswer {
  PutLifecycleHookAnswer();
  factory PutLifecycleHookAnswer.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutLifecycleHookAnswer();
  }
}

class RecordLifecycleActionHeartbeatAnswer {
  RecordLifecycleActionHeartbeatAnswer();
  factory RecordLifecycleActionHeartbeatAnswer.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RecordLifecycleActionHeartbeatAnswer();
  }
}

/// Describes information used to start an instance refresh.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RefreshPreferences {
  /// The number of seconds until a newly launched instance is configured and
  /// ready to use. During this time, Amazon EC2 Auto Scaling does not immediately
  /// move on to the next replacement. The default is to use the value for the
  /// health check grace period defined for the group.
  @_s.JsonKey(name: 'InstanceWarmup')
  final int instanceWarmup;

  /// The amount of capacity in the Auto Scaling group that must remain healthy
  /// during an instance refresh to allow the operation to continue, as a
  /// percentage of the desired capacity of the Auto Scaling group (rounded up to
  /// the nearest integer). The default is <code>90</code>.
  @_s.JsonKey(name: 'MinHealthyPercentage')
  final int minHealthyPercentage;

  RefreshPreferences({
    this.instanceWarmup,
    this.minHealthyPercentage,
  });
  Map<String, dynamic> toJson() => _$RefreshPreferencesToJson(this);
}

enum RefreshStrategy {
  @_s.JsonValue('Rolling')
  rolling,
}

extension on RefreshStrategy {
  String toValue() {
    switch (this) {
      case RefreshStrategy.rolling:
        return 'Rolling';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RefreshStrategy toRefreshStrategy() {
    switch (this) {
      case 'Rolling':
        return RefreshStrategy.rolling;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ScalingActivityStatusCode {
  @_s.JsonValue('PendingSpotBidPlacement')
  pendingSpotBidPlacement,
  @_s.JsonValue('WaitingForSpotInstanceRequestId')
  waitingForSpotInstanceRequestId,
  @_s.JsonValue('WaitingForSpotInstanceId')
  waitingForSpotInstanceId,
  @_s.JsonValue('WaitingForInstanceId')
  waitingForInstanceId,
  @_s.JsonValue('PreInService')
  preInService,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('WaitingForELBConnectionDraining')
  waitingForELBConnectionDraining,
  @_s.JsonValue('MidLifecycleAction')
  midLifecycleAction,
  @_s.JsonValue('WaitingForInstanceWarmup')
  waitingForInstanceWarmup,
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelled')
  cancelled,
}

extension on String {
  ScalingActivityStatusCode toScalingActivityStatusCode() {
    switch (this) {
      case 'PendingSpotBidPlacement':
        return ScalingActivityStatusCode.pendingSpotBidPlacement;
      case 'WaitingForSpotInstanceRequestId':
        return ScalingActivityStatusCode.waitingForSpotInstanceRequestId;
      case 'WaitingForSpotInstanceId':
        return ScalingActivityStatusCode.waitingForSpotInstanceId;
      case 'WaitingForInstanceId':
        return ScalingActivityStatusCode.waitingForInstanceId;
      case 'PreInService':
        return ScalingActivityStatusCode.preInService;
      case 'InProgress':
        return ScalingActivityStatusCode.inProgress;
      case 'WaitingForELBConnectionDraining':
        return ScalingActivityStatusCode.waitingForELBConnectionDraining;
      case 'MidLifecycleAction':
        return ScalingActivityStatusCode.midLifecycleAction;
      case 'WaitingForInstanceWarmup':
        return ScalingActivityStatusCode.waitingForInstanceWarmup;
      case 'Successful':
        return ScalingActivityStatusCode.successful;
      case 'Failed':
        return ScalingActivityStatusCode.failed;
      case 'Cancelled':
        return ScalingActivityStatusCode.cancelled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a scaling policy.
class ScalingPolicy {
  /// Specifies how the scaling adjustment is interpreted (for example, an
  /// absolute number or a percentage). The valid values are
  /// <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and
  /// <code>PercentChangeInCapacity</code>.
  final String adjustmentType;

  /// The CloudWatch alarms related to the policy.
  final List<Alarm> alarms;

  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The duration of the policy's cooldown period, in seconds.
  final int cooldown;

  /// Indicates whether the policy is enabled (<code>true</code>) or disabled
  /// (<code>false</code>).
  final bool enabled;

  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics.
  final int estimatedInstanceWarmup;

  /// The aggregation type for the CloudWatch metrics. The valid values are
  /// <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>.
  final String metricAggregationType;

  /// The minimum value to scale by when the adjustment type is
  /// <code>PercentChangeInCapacity</code>.
  final int minAdjustmentMagnitude;

  /// Available for backward compatibility. Use
  /// <code>MinAdjustmentMagnitude</code> instead.
  final int minAdjustmentStep;

  /// The Amazon Resource Name (ARN) of the policy.
  final String policyARN;

  /// The name of the scaling policy.
  final String policyName;

  /// One of the following policy types:
  ///
  /// <ul>
  /// <li>
  /// <code>TargetTrackingScaling</code>
  /// </li>
  /// <li>
  /// <code>StepScaling</code>
  /// </li>
  /// <li>
  /// <code>SimpleScaling</code> (default)
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html">Target
  /// tracking scaling policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html">Step
  /// and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User
  /// Guide</i>.
  final String policyType;

  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number removes
  /// from the current capacity.
  final int scalingAdjustment;

  /// A set of adjustments that enable you to scale based on the size of the alarm
  /// breach.
  final List<StepAdjustment> stepAdjustments;

  /// A target tracking scaling policy.
  final TargetTrackingConfiguration targetTrackingConfiguration;

  ScalingPolicy({
    this.adjustmentType,
    this.alarms,
    this.autoScalingGroupName,
    this.cooldown,
    this.enabled,
    this.estimatedInstanceWarmup,
    this.metricAggregationType,
    this.minAdjustmentMagnitude,
    this.minAdjustmentStep,
    this.policyARN,
    this.policyName,
    this.policyType,
    this.scalingAdjustment,
    this.stepAdjustments,
    this.targetTrackingConfiguration,
  });
  factory ScalingPolicy.fromXml(_s.XmlElement elem) {
    return ScalingPolicy(
      adjustmentType: _s.extractXmlStringValue(elem, 'AdjustmentType'),
      alarms: _s.extractXmlChild(elem, 'Alarms')?.let((elem) =>
          elem.findElements('member').map((c) => Alarm.fromXml(c)).toList()),
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      cooldown: _s.extractXmlIntValue(elem, 'Cooldown'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      estimatedInstanceWarmup:
          _s.extractXmlIntValue(elem, 'EstimatedInstanceWarmup'),
      metricAggregationType:
          _s.extractXmlStringValue(elem, 'MetricAggregationType'),
      minAdjustmentMagnitude:
          _s.extractXmlIntValue(elem, 'MinAdjustmentMagnitude'),
      minAdjustmentStep: _s.extractXmlIntValue(elem, 'MinAdjustmentStep'),
      policyARN: _s.extractXmlStringValue(elem, 'PolicyARN'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      policyType: _s.extractXmlStringValue(elem, 'PolicyType'),
      scalingAdjustment: _s.extractXmlIntValue(elem, 'ScalingAdjustment'),
      stepAdjustments: _s.extractXmlChild(elem, 'StepAdjustments')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => StepAdjustment.fromXml(c))
              .toList()),
      targetTrackingConfiguration: _s
          .extractXmlChild(elem, 'TargetTrackingConfiguration')
          ?.let((e) => TargetTrackingConfiguration.fromXml(e)),
    );
  }
}

class ScheduledActionsType {
  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  /// The scheduled actions.
  final List<ScheduledUpdateGroupAction> scheduledUpdateGroupActions;

  ScheduledActionsType({
    this.nextToken,
    this.scheduledUpdateGroupActions,
  });
  factory ScheduledActionsType.fromXml(_s.XmlElement elem) {
    return ScheduledActionsType(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      scheduledUpdateGroupActions: _s
          .extractXmlChild(elem, 'ScheduledUpdateGroupActions')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ScheduledUpdateGroupAction.fromXml(c))
              .toList()),
    );
  }
}

/// Describes a scheduled scaling action.
class ScheduledUpdateGroupAction {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The desired capacity is the initial capacity of the Auto Scaling group after
  /// the scheduled action runs and the capacity it attempts to maintain.
  final int desiredCapacity;

  /// The date and time in UTC for the recurring schedule to end. For example,
  /// <code>"2019-06-01T00:00:00Z"</code>.
  final DateTime endTime;

  /// The maximum size of the Auto Scaling group.
  final int maxSize;

  /// The minimum size of the Auto Scaling group.
  final int minSize;

  /// The recurring schedule for the action, in Unix cron syntax format.
  ///
  /// When <code>StartTime</code> and <code>EndTime</code> are specified with
  /// <code>Recurrence</code>, they form the boundaries of when the recurring
  /// action starts and stops.
  final String recurrence;

  /// The Amazon Resource Name (ARN) of the scheduled action.
  final String scheduledActionARN;

  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The date and time in UTC for this action to start. For example,
  /// <code>"2019-06-01T00:00:00Z"</code>.
  final DateTime startTime;

  /// This parameter is no longer used.
  final DateTime time;

  ScheduledUpdateGroupAction({
    this.autoScalingGroupName,
    this.desiredCapacity,
    this.endTime,
    this.maxSize,
    this.minSize,
    this.recurrence,
    this.scheduledActionARN,
    this.scheduledActionName,
    this.startTime,
    this.time,
  });
  factory ScheduledUpdateGroupAction.fromXml(_s.XmlElement elem) {
    return ScheduledUpdateGroupAction(
      autoScalingGroupName:
          _s.extractXmlStringValue(elem, 'AutoScalingGroupName'),
      desiredCapacity: _s.extractXmlIntValue(elem, 'DesiredCapacity'),
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime'),
      maxSize: _s.extractXmlIntValue(elem, 'MaxSize'),
      minSize: _s.extractXmlIntValue(elem, 'MinSize'),
      recurrence: _s.extractXmlStringValue(elem, 'Recurrence'),
      scheduledActionARN: _s.extractXmlStringValue(elem, 'ScheduledActionARN'),
      scheduledActionName:
          _s.extractXmlStringValue(elem, 'ScheduledActionName'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      time: _s.extractXmlDateTimeValue(elem, 'Time'),
    );
  }
}

/// Describes information used for one or more scheduled scaling action updates
/// in a <a>BatchPutScheduledUpdateGroupAction</a> operation.
///
/// When updating a scheduled scaling action, all optional parameters are left
/// unchanged if not specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ScheduledUpdateGroupActionRequest {
  /// The name of the scaling action.
  @_s.JsonKey(name: 'ScheduledActionName')
  final String scheduledActionName;

  /// The desired capacity is the initial capacity of the Auto Scaling group after
  /// the scheduled action runs and the capacity it attempts to maintain.
  @_s.JsonKey(name: 'DesiredCapacity')
  final int desiredCapacity;

  /// The date and time for the recurring schedule to end. Amazon EC2 Auto Scaling
  /// does not perform the action after this time.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The maximum size of the Auto Scaling group.
  @_s.JsonKey(name: 'MaxSize')
  final int maxSize;

  /// The minimum size of the Auto Scaling group.
  @_s.JsonKey(name: 'MinSize')
  final int minSize;

  /// The recurring schedule for the action, in Unix cron syntax format. This
  /// format consists of five fields separated by white spaces: [Minute] [Hour]
  /// [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes
  /// (for example, <code>"30 0 1 1,6,12 *"</code>). For more information about
  /// this format, see <a href="http://crontab.org">Crontab</a>.
  ///
  /// When <code>StartTime</code> and <code>EndTime</code> are specified with
  /// <code>Recurrence</code>, they form the boundaries of when the recurring
  /// action starts and stops.
  @_s.JsonKey(name: 'Recurrence')
  final String recurrence;

  /// The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format in
  /// UTC/GMT only and in quotes (for example,
  /// <code>"2019-06-01T00:00:00Z"</code>).
  ///
  /// If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon
  /// EC2 Auto Scaling performs the action at this time, and then performs the
  /// action based on the specified recurrence.
  ///
  /// If you try to schedule the action in the past, Amazon EC2 Auto Scaling
  /// returns an error message.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  ScheduledUpdateGroupActionRequest({
    @_s.required this.scheduledActionName,
    this.desiredCapacity,
    this.endTime,
    this.maxSize,
    this.minSize,
    this.recurrence,
    this.startTime,
  });
  Map<String, dynamic> toJson() =>
      _$ScheduledUpdateGroupActionRequestToJson(this);
}

class SetInstanceProtectionAnswer {
  SetInstanceProtectionAnswer();
  factory SetInstanceProtectionAnswer.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetInstanceProtectionAnswer();
  }
}

class StartInstanceRefreshAnswer {
  /// A unique ID for tracking the progress of the request.
  final String instanceRefreshId;

  StartInstanceRefreshAnswer({
    this.instanceRefreshId,
  });
  factory StartInstanceRefreshAnswer.fromXml(_s.XmlElement elem) {
    return StartInstanceRefreshAnswer(
      instanceRefreshId: _s.extractXmlStringValue(elem, 'InstanceRefreshId'),
    );
  }
}

/// Describes information used to create a step adjustment for a step scaling
/// policy.
///
/// For the following examples, suppose that you have an alarm with a breach
/// threshold of 50:
///
/// <ul>
/// <li>
/// To trigger the adjustment when the metric is greater than or equal to 50 and
/// less than 60, specify a lower bound of 0 and an upper bound of 10.
/// </li>
/// <li>
/// To trigger the adjustment when the metric is greater than 40 and less than
/// or equal to 50, specify a lower bound of -10 and an upper bound of 0.
/// </li>
/// </ul>
/// There are a few rules for the step adjustments for your step policy:
///
/// <ul>
/// <li>
/// The ranges of your step adjustments can't overlap or have a gap.
/// </li>
/// <li>
/// At most, one step adjustment can have a null lower bound. If one step
/// adjustment has a negative lower bound, then there must be a step adjustment
/// with a null lower bound.
/// </li>
/// <li>
/// At most, one step adjustment can have a null upper bound. If one step
/// adjustment has a positive upper bound, then there must be a step adjustment
/// with a null upper bound.
/// </li>
/// <li>
/// The upper and lower bound can't be null in the same step adjustment.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-steps">Step
/// adjustments</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StepAdjustment {
  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number removes
  /// from the current capacity.
  @_s.JsonKey(name: 'ScalingAdjustment')
  final int scalingAdjustment;

  /// The lower bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// lower bound is inclusive (the metric must be greater than or equal to the
  /// threshold plus the lower bound). Otherwise, it is exclusive (the metric must
  /// be greater than the threshold plus the lower bound). A null value indicates
  /// negative infinity.
  @_s.JsonKey(name: 'MetricIntervalLowerBound')
  final double metricIntervalLowerBound;

  /// The upper bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// upper bound is exclusive (the metric must be less than the threshold plus
  /// the upper bound). Otherwise, it is inclusive (the metric must be less than
  /// or equal to the threshold plus the upper bound). A null value indicates
  /// positive infinity.
  ///
  /// The upper bound must be greater than the lower bound.
  @_s.JsonKey(name: 'MetricIntervalUpperBound')
  final double metricIntervalUpperBound;

  StepAdjustment({
    @_s.required this.scalingAdjustment,
    this.metricIntervalLowerBound,
    this.metricIntervalUpperBound,
  });
  factory StepAdjustment.fromXml(_s.XmlElement elem) {
    return StepAdjustment(
      scalingAdjustment: _s.extractXmlIntValue(elem, 'ScalingAdjustment'),
      metricIntervalLowerBound:
          _s.extractXmlDoubleValue(elem, 'MetricIntervalLowerBound'),
      metricIntervalUpperBound:
          _s.extractXmlDoubleValue(elem, 'MetricIntervalUpperBound'),
    );
  }

  Map<String, dynamic> toJson() => _$StepAdjustmentToJson(this);
}

/// Describes an auto scaling process that has been suspended.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types">Scaling
/// processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.
class SuspendedProcess {
  /// The name of the suspended process.
  final String processName;

  /// The reason that the process was suspended.
  final String suspensionReason;

  SuspendedProcess({
    this.processName,
    this.suspensionReason,
  });
  factory SuspendedProcess.fromXml(_s.XmlElement elem) {
    return SuspendedProcess(
      processName: _s.extractXmlStringValue(elem, 'ProcessName'),
      suspensionReason: _s.extractXmlStringValue(elem, 'SuspensionReason'),
    );
  }
}

/// Describes a tag for an Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Determines whether the tag is added to new instances as they are launched in
  /// the group.
  @_s.JsonKey(name: 'PropagateAtLaunch')
  final bool propagateAtLaunch;

  /// The name of the group.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of resource. The only supported value is
  /// <code>auto-scaling-group</code>.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.propagateAtLaunch,
    this.resourceId,
    this.resourceType,
    this.value,
  });
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Describes a tag for an Auto Scaling group.
class TagDescription {
  /// The tag key.
  final String key;

  /// Determines whether the tag is added to new instances as they are launched in
  /// the group.
  final bool propagateAtLaunch;

  /// The name of the group.
  final String resourceId;

  /// The type of resource. The only supported value is
  /// <code>auto-scaling-group</code>.
  final String resourceType;

  /// The tag value.
  final String value;

  TagDescription({
    this.key,
    this.propagateAtLaunch,
    this.resourceId,
    this.resourceType,
    this.value,
  });
  factory TagDescription.fromXml(_s.XmlElement elem) {
    return TagDescription(
      key: _s.extractXmlStringValue(elem, 'Key'),
      propagateAtLaunch: _s.extractXmlBoolValue(elem, 'PropagateAtLaunch'),
      resourceId: _s.extractXmlStringValue(elem, 'ResourceId'),
      resourceType: _s.extractXmlStringValue(elem, 'ResourceType'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }
}

class TagsType {
  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the <code>NextToken</code> value when requesting the next set of
  /// items. This value is null when there are no more items to return.
  final String nextToken;

  /// One or more tags.
  final List<TagDescription> tags;

  TagsType({
    this.nextToken,
    this.tags,
  });
  factory TagsType.fromXml(_s.XmlElement elem) {
    return TagsType(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) => elem
          .findElements('member')
          .map((c) => TagDescription.fromXml(c))
          .toList()),
    );
  }
}

/// Represents a target tracking scaling policy configuration to use with Amazon
/// EC2 Auto Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetTrackingConfiguration {
  /// The target value for the metric.
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  /// A customized metric. You must specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'CustomizedMetricSpecification')
  final CustomizedMetricSpecification customizedMetricSpecification;

  /// Indicates whether scaling in by the target tracking scaling policy is
  /// disabled. If scaling in is disabled, the target tracking scaling policy
  /// doesn't remove instances from the Auto Scaling group. Otherwise, the target
  /// tracking scaling policy can remove instances from the Auto Scaling group.
  /// The default is <code>false</code>.
  @_s.JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// A predefined metric. You must specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'PredefinedMetricSpecification')
  final PredefinedMetricSpecification predefinedMetricSpecification;

  TargetTrackingConfiguration({
    @_s.required this.targetValue,
    this.customizedMetricSpecification,
    this.disableScaleIn,
    this.predefinedMetricSpecification,
  });
  factory TargetTrackingConfiguration.fromXml(_s.XmlElement elem) {
    return TargetTrackingConfiguration(
      targetValue: _s.extractXmlDoubleValue(elem, 'TargetValue'),
      customizedMetricSpecification: _s
          .extractXmlChild(elem, 'CustomizedMetricSpecification')
          ?.let((e) => CustomizedMetricSpecification.fromXml(e)),
      disableScaleIn: _s.extractXmlBoolValue(elem, 'DisableScaleIn'),
      predefinedMetricSpecification: _s
          .extractXmlChild(elem, 'PredefinedMetricSpecification')
          ?.let((e) => PredefinedMetricSpecification.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() => _$TargetTrackingConfigurationToJson(this);
}

class ActiveInstanceRefreshNotFoundFault extends _s.GenericAwsException {
  ActiveInstanceRefreshNotFoundFault({String type, String message})
      : super(
            type: type,
            code: 'ActiveInstanceRefreshNotFoundFault',
            message: message);
}

class AlreadyExistsFault extends _s.GenericAwsException {
  AlreadyExistsFault({String type, String message})
      : super(type: type, code: 'AlreadyExistsFault', message: message);
}

class InstanceRefreshInProgressFault extends _s.GenericAwsException {
  InstanceRefreshInProgressFault({String type, String message})
      : super(
            type: type,
            code: 'InstanceRefreshInProgressFault',
            message: message);
}

class InvalidNextToken extends _s.GenericAwsException {
  InvalidNextToken({String type, String message})
      : super(type: type, code: 'InvalidNextToken', message: message);
}

class LimitExceededFault extends _s.GenericAwsException {
  LimitExceededFault({String type, String message})
      : super(type: type, code: 'LimitExceededFault', message: message);
}

class ResourceContentionFault extends _s.GenericAwsException {
  ResourceContentionFault({String type, String message})
      : super(type: type, code: 'ResourceContentionFault', message: message);
}

class ResourceInUseFault extends _s.GenericAwsException {
  ResourceInUseFault({String type, String message})
      : super(type: type, code: 'ResourceInUseFault', message: message);
}

class ScalingActivityInProgressFault extends _s.GenericAwsException {
  ScalingActivityInProgressFault({String type, String message})
      : super(
            type: type,
            code: 'ScalingActivityInProgressFault',
            message: message);
}

class ServiceLinkedRoleFailure extends _s.GenericAwsException {
  ServiceLinkedRoleFailure({String type, String message})
      : super(type: type, code: 'ServiceLinkedRoleFailure', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActiveInstanceRefreshNotFoundFault': (type, message) =>
      ActiveInstanceRefreshNotFoundFault(type: type, message: message),
  'AlreadyExistsFault': (type, message) =>
      AlreadyExistsFault(type: type, message: message),
  'InstanceRefreshInProgressFault': (type, message) =>
      InstanceRefreshInProgressFault(type: type, message: message),
  'InvalidNextToken': (type, message) =>
      InvalidNextToken(type: type, message: message),
  'LimitExceededFault': (type, message) =>
      LimitExceededFault(type: type, message: message),
  'ResourceContentionFault': (type, message) =>
      ResourceContentionFault(type: type, message: message),
  'ResourceInUseFault': (type, message) =>
      ResourceInUseFault(type: type, message: message),
  'ScalingActivityInProgressFault': (type, message) =>
      ScalingActivityInProgressFault(type: type, message: message),
  'ServiceLinkedRoleFailure': (type, message) =>
      ServiceLinkedRoleFailure(type: type, message: message),
};
