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

/// Amazon Elastic Container Service (Amazon ECS) is a highly scalable, fast,
/// container management service that makes it easy to run, stop, and manage
/// Docker containers on a cluster. You can host your cluster on a serverless
/// infrastructure that is managed by Amazon ECS by launching your services or
/// tasks on AWS Fargate. For more control, you can host your tasks on a cluster
/// of Amazon Elastic Compute Cloud (Amazon EC2) instances that you manage.
class Ecs {
  final _s.JsonProtocol _protocol;
  Ecs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ecs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new capacity provider. Capacity providers are associated with an
  /// Amazon ECS cluster and are used in capacity provider strategies to
  /// facilitate cluster auto scaling.
  ///
  /// Only capacity providers using an Auto Scaling group can be created. Amazon
  /// ECS tasks on AWS Fargate use the <code>FARGATE</code> and
  /// <code>FARGATE_SPOT</code> capacity providers which are already created and
  /// available to all accounts in Regions supported by AWS Fargate.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [UpdateInProgressException].
  ///
  /// Parameter [autoScalingGroupProvider] :
  /// The details of the Auto Scaling group for the capacity provider.
  ///
  /// Parameter [name] :
  /// The name of the capacity provider. Up to 255 characters are allowed,
  /// including letters (upper and lowercase), numbers, underscores, and
  /// hyphens. The name cannot be prefixed with "<code>aws</code>",
  /// "<code>ecs</code>", or "<code>fargate</code>".
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the capacity provider to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<CreateCapacityProviderResponse> createCapacityProvider({
    required AutoScalingGroupProvider autoScalingGroupProvider,
    required String name,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(
        autoScalingGroupProvider, 'autoScalingGroupProvider');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.CreateCapacityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'autoScalingGroupProvider': autoScalingGroupProvider,
        'name': name,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCapacityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon ECS cluster. By default, your account receives a
  /// <code>default</code> cluster when you launch your first container
  /// instance. However, you can create your own cluster with a unique name with
  /// the <code>CreateCluster</code> action.
  /// <note>
  /// When you call the <a>CreateCluster</a> API operation, Amazon ECS attempts
  /// to create the Amazon ECS service-linked role for your account so that
  /// required resources in other AWS services can be managed on your behalf.
  /// However, if the IAM user that makes the call does not have permissions to
  /// create the service-linked role, it is not created. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
  /// Service-Linked Roles for Amazon ECS</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [capacityProviders] :
  /// The short name of one or more capacity providers to associate with the
  /// cluster. A capacity provider must be associated with a cluster before it
  /// can be included as part of the default capacity provider strategy of the
  /// cluster or used in a capacity provider strategy when calling the
  /// <a>CreateService</a> or <a>RunTask</a> actions.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must already be created and not already associated with
  /// another cluster. New Auto Scaling group capacity providers can be created
  /// with the <a>CreateCapacityProvider</a> API operation.
  ///
  /// To use a AWS Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// AWS Fargate capacity providers are available to all accounts and only need
  /// to be associated with a cluster to be used.
  ///
  /// The <a>PutClusterCapacityProviders</a> API operation is used to update the
  /// list of available capacity providers for a cluster after the cluster is
  /// created.
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster. If you do not specify a name for your cluster,
  /// you create a cluster named <code>default</code>. Up to 255 letters
  /// (uppercase and lowercase), numbers, underscores, and hyphens are allowed.
  ///
  /// Parameter [configuration] :
  /// The execute command configuration for the cluster.
  ///
  /// Parameter [defaultCapacityProviderStrategy] :
  /// The capacity provider strategy to set as the default for the cluster. When
  /// a default capacity provider strategy is set for a cluster, when calling
  /// the <a>RunTask</a> or <a>CreateService</a> APIs wtih no capacity provider
  /// strategy or launch type specified, the default capacity provider strategy
  /// for the cluster is used.
  ///
  /// If a default capacity provider strategy is not defined for a cluster
  /// during creation, it can be defined later with the
  /// <a>PutClusterCapacityProviders</a> API operation.
  ///
  /// Parameter [settings] :
  /// The setting to use when creating a cluster. This parameter is used to
  /// enable CloudWatch Container Insights for a cluster. If this value is
  /// specified, it will override the <code>containerInsights</code> value set
  /// with <a>PutAccountSetting</a> or <a>PutAccountSettingDefault</a>.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the cluster to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<CreateClusterResponse> createCluster({
    List<String>? capacityProviders,
    String? clusterName,
    ClusterConfiguration? configuration,
    List<CapacityProviderStrategyItem>? defaultCapacityProviderStrategy,
    List<ClusterSetting>? settings,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (capacityProviders != null) 'capacityProviders': capacityProviders,
        if (clusterName != null) 'clusterName': clusterName,
        if (configuration != null) 'configuration': configuration,
        if (defaultCapacityProviderStrategy != null)
          'defaultCapacityProviderStrategy': defaultCapacityProviderStrategy,
        if (settings != null) 'settings': settings,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Runs and maintains a desired number of tasks from a specified task
  /// definition. If the number of tasks running in a service drops below the
  /// <code>desiredCount</code>, Amazon ECS runs another copy of the task in the
  /// specified cluster. To update an existing service, see the UpdateService
  /// action.
  ///
  /// In addition to maintaining the desired count of tasks in your service, you
  /// can optionally run your service behind one or more load balancers. The
  /// load balancers distribute traffic across the tasks that are associated
  /// with the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html">Service
  /// Load Balancing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Tasks for services that <i>do not</i> use a load balancer are considered
  /// healthy if they're in the <code>RUNNING</code> state. Tasks for services
  /// that <i>do</i> use a load balancer are considered healthy if they're in
  /// the <code>RUNNING</code> state and the container instance that they're
  /// hosted on is reported as healthy by the load balancer.
  ///
  /// There are two service scheduler strategies available:
  ///
  /// <ul>
  /// <li>
  /// <code>REPLICA</code> - The replica scheduling strategy places and
  /// maintains the desired number of tasks across your cluster. By default, the
  /// service scheduler spreads tasks across Availability Zones. You can use
  /// task placement strategies and constraints to customize task placement
  /// decisions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Service
  /// Scheduler Concepts</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>DAEMON</code> - The daemon scheduling strategy deploys exactly one
  /// task on each active container instance that meets all of the task
  /// placement constraints that you specify in your cluster. The service
  /// scheduler also evaluates the task placement constraints for running tasks
  /// and will stop tasks that do not meet the placement constraints. When using
  /// this strategy, you don't need to specify a desired number of tasks, a task
  /// placement strategy, or use Service Auto Scaling policies. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Service
  /// Scheduler Concepts</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// </ul>
  /// You can optionally specify a deployment configuration for your service.
  /// The deployment is triggered by changing properties, such as the task
  /// definition or the desired count of a service, with an <a>UpdateService</a>
  /// operation. The default value for a replica service for
  /// <code>minimumHealthyPercent</code> is 100%. The default value for a daemon
  /// service for <code>minimumHealthyPercent</code> is 0%.
  ///
  /// If a service is using the <code>ECS</code> deployment controller, the
  /// minimum healthy percent represents a lower limit on the number of tasks in
  /// a service that must remain in the <code>RUNNING</code> state during a
  /// deployment, as a percentage of the desired number of tasks (rounded up to
  /// the nearest integer), and while any container instances are in the
  /// <code>DRAINING</code> state if the service contains tasks using the EC2
  /// launch type. This parameter enables you to deploy without using additional
  /// cluster capacity. For example, if your service has a desired number of
  /// four tasks and a minimum healthy percent of 50%, the scheduler might stop
  /// two existing tasks to free up cluster capacity before starting two new
  /// tasks. Tasks for services that <i>do not</i> use a load balancer are
  /// considered healthy if they're in the <code>RUNNING</code> state. Tasks for
  /// services that <i>do</i> use a load balancer are considered healthy if
  /// they're in the <code>RUNNING</code> state and they're reported as healthy
  /// by the load balancer. The default value for minimum healthy percent is
  /// 100%.
  ///
  /// If a service is using the <code>ECS</code> deployment controller, the
  /// <b>maximum percent</b> parameter represents an upper limit on the number
  /// of tasks in a service that are allowed in the <code>RUNNING</code> or
  /// <code>PENDING</code> state during a deployment, as a percentage of the
  /// desired number of tasks (rounded down to the nearest integer), and while
  /// any container instances are in the <code>DRAINING</code> state if the
  /// service contains tasks using the EC2 launch type. This parameter enables
  /// you to define the deployment batch size. For example, if your service has
  /// a desired number of four tasks and a maximum percent value of 200%, the
  /// scheduler may start four new tasks before stopping the four older tasks
  /// (provided that the cluster resources required to do this are available).
  /// The default value for maximum percent is 200%.
  ///
  /// If a service is using either the <code>CODE_DEPLOY</code> or
  /// <code>EXTERNAL</code> deployment controller types and tasks that use the
  /// EC2 launch type, the <b>minimum healthy percent</b> and <b>maximum
  /// percent</b> values are used only to define the lower and upper limit on
  /// the number of the tasks in the service that remain in the
  /// <code>RUNNING</code> state while the container instances are in the
  /// <code>DRAINING</code> state. If the tasks in the service use the Fargate
  /// launch type, the minimum healthy percent and maximum percent values aren't
  /// used, although they're currently visible when describing your service.
  ///
  /// When creating a service that uses the <code>EXTERNAL</code> deployment
  /// controller, you can specify only parameters that aren't controlled at the
  /// task set level. The only required parameter is the service name. You
  /// control your services using the <a>CreateTaskSet</a> operation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement in your cluster using the following logic:
  ///
  /// <ul>
  /// <li>
  /// Determine which of the container instances in your cluster can support
  /// your service's task definition (for example, they have the required CPU,
  /// memory, ports, and container instance attributes).
  /// </li>
  /// <li>
  /// By default, the service scheduler attempts to balance tasks across
  /// Availability Zones in this manner (although you can choose a different
  /// placement strategy) with the <code>placementStrategy</code> parameter):
  ///
  /// <ul>
  /// <li>
  /// Sort the valid container instances, giving priority to instances that have
  /// the fewest number of running tasks for this service in their respective
  /// Availability Zone. For example, if zone A has one running service task and
  /// zones B and C each have zero, valid container instances in either zone B
  /// or C are considered optimal for placement.
  /// </li>
  /// <li>
  /// Place the new service task on a valid container instance in an optimal
  /// Availability Zone (based on the previous steps), favoring container
  /// instances with the fewest number of running tasks for this service.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [PlatformUnknownException].
  /// May throw [PlatformTaskDefinitionIncompatibilityException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [serviceName] :
  /// The name of your service. Up to 255 letters (uppercase and lowercase),
  /// numbers, underscores, and hyphens are allowed. Service names must be
  /// unique within a cluster, but you can have similarly named services in
  /// multiple clusters within a Region or across multiple Regions.
  ///
  /// Parameter [capacityProviderStrategy] :
  /// The capacity provider strategy to use for the service.
  ///
  /// If a <code>capacityProviderStrategy</code> is specified, the
  /// <code>launchType</code> parameter must be omitted. If no
  /// <code>capacityProviderStrategy</code> or <code>launchType</code> is
  /// specified, the <code>defaultCapacityProviderStrategy</code> for the
  /// cluster is used.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 32 ASCII characters are allowed.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster on which
  /// to run your service. If you do not specify a cluster, the default cluster
  /// is assumed.
  ///
  /// Parameter [deploymentConfiguration] :
  /// Optional deployment parameters that control how many tasks run during the
  /// deployment and the ordering of stopping and starting tasks.
  ///
  /// Parameter [deploymentController] :
  /// The deployment controller to use for the service. If no deployment
  /// controller is specified, the default value of <code>ECS</code> is used.
  ///
  /// Parameter [desiredCount] :
  /// The number of instantiations of the specified task definition to place and
  /// keep running on your cluster.
  ///
  /// This is required if <code>schedulingStrategy</code> is
  /// <code>REPLICA</code> or is not specified. If
  /// <code>schedulingStrategy</code> is <code>DAEMON</code> then this is not
  /// required.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to enable Amazon ECS managed tags for the tasks within
  /// the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Whether or not the execute command functionality is enabled for the
  /// service. If <code>true</code>, this enables execute command functionality
  /// on all containers in the service tasks.
  ///
  /// Parameter [healthCheckGracePeriodSeconds] :
  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// should ignore unhealthy Elastic Load Balancing target health checks after
  /// a task has first started. This is only used when your service is
  /// configured to use a load balancer. If your service has a load balancer
  /// defined and you don't specify a health check grace period value, the
  /// default value of <code>0</code> is used.
  ///
  /// If your service's tasks take a while to start and respond to Elastic Load
  /// Balancing health checks, you can specify a health check grace period of up
  /// to 2,147,483,647 seconds. During that time, the Amazon ECS service
  /// scheduler ignores health check status. This grace period can prevent the
  /// service scheduler from marking tasks as unhealthy and stopping them before
  /// they have time to come up.
  ///
  /// Parameter [launchType] :
  /// The infrastructure on which to run your service. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The <code>FARGATE</code> launch type runs your tasks on AWS Fargate
  /// On-Demand infrastructure.
  /// <note>
  /// Fargate Spot infrastructure is available for use but a capacity provider
  /// strategy must be used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/fargate-capacity-providers.html">AWS
  /// Fargate capacity providers</a> in the <i>Amazon ECS User Guide for AWS
  /// Fargate</i>.
  /// </note>
  /// The <code>EC2</code> launch type runs your tasks on Amazon EC2 instances
  /// registered to your cluster.
  ///
  /// The <code>EXTERNAL</code> launch type runs your tasks on your on-premise
  /// server or virtual machine (VM) capacity registered to your cluster.
  ///
  /// A service can use either a launch type or a capacity provider strategy. If
  /// a <code>launchType</code> is specified, the
  /// <code>capacityProviderStrategy</code> parameter must be omitted.
  ///
  /// Parameter [loadBalancers] :
  /// A load balancer object representing the load balancers to use with your
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html">Service
  /// Load Balancing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// If the service is using the rolling update (<code>ECS</code>) deployment
  /// controller and using either an Application Load Balancer or Network Load
  /// Balancer, you must specify one or more target group ARNs to attach to the
  /// service. The service-linked role is required for services that make use of
  /// multiple target groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
  /// service-linked roles for Amazon ECS</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  ///
  /// If the service is using the <code>CODE_DEPLOY</code> deployment
  /// controller, the service is required to use either an Application Load
  /// Balancer or Network Load Balancer. When creating an AWS CodeDeploy
  /// deployment group, you specify two target groups (referred to as a
  /// <code>targetGroupPair</code>). During a deployment, AWS CodeDeploy
  /// determines which task set in your service has the status
  /// <code>PRIMARY</code> and associates one target group with it, and then
  /// associates the other target group with the replacement task set. The load
  /// balancer can also have up to two listeners: a required listener for
  /// production traffic and an optional listener that allows you perform
  /// validation tests with Lambda functions before routing production traffic
  /// to it.
  ///
  /// After you create a service using the <code>ECS</code> deployment
  /// controller, the load balancer name or target group ARN, container name,
  /// and container port specified in the service definition are immutable. If
  /// you are using the <code>CODE_DEPLOY</code> deployment controller, these
  /// values can be changed when updating the service.
  ///
  /// For Application Load Balancers and Network Load Balancers, this object
  /// must contain the load balancer target group ARN, the container name (as it
  /// appears in a container definition), and the container port to access from
  /// the load balancer. The load balancer name parameter must be omitted. When
  /// a task from this service is placed on a container instance, the container
  /// instance and port combination is registered as a target in the target
  /// group specified here.
  ///
  /// For Classic Load Balancers, this object must contain the load balancer
  /// name, the container name (as it appears in a container definition), and
  /// the container port to access from the load balancer. The target group ARN
  /// parameter must be omitted. When a task from this service is placed on a
  /// container instance, the container instance is registered with the load
  /// balancer specified here.
  ///
  /// Services with tasks that use the <code>awsvpc</code> network mode (for
  /// example, those with the Fargate launch type) only support Application Load
  /// Balancers and Network Load Balancers. Classic Load Balancers are not
  /// supported. Also, when you create any target groups for these services, you
  /// must choose <code>ip</code> as the target type, not <code>instance</code>,
  /// because tasks that use the <code>awsvpc</code> network mode are associated
  /// with an elastic network interface, not an Amazon EC2 instance.
  ///
  /// Parameter [networkConfiguration] :
  /// The network configuration for the service. This parameter is required for
  /// task definitions that use the <code>awsvpc</code> network mode to receive
  /// their own elastic network interface, and it is not supported for other
  /// network modes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for tasks in your service.
  /// You can specify a maximum of 10 constraints per task (this limit includes
  /// constraints in the task definition and those specified at runtime).
  ///
  /// Parameter [placementStrategy] :
  /// The placement strategy objects to use for tasks in your service. You can
  /// specify a maximum of five strategy rules per service.
  ///
  /// Parameter [platformVersion] :
  /// The platform version that your tasks in the service are running on. A
  /// platform version is specified only for tasks using the Fargate launch
  /// type. If one isn't specified, the <code>LATEST</code> platform version is
  /// used by default. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate platform versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition or the
  /// service to the tasks in the service. If no value is specified, the tags
  /// are not propagated. Tags can only be propagated to the tasks within the
  /// service during service creation. To add tags to a task after service
  /// creation, use the <a>TagResource</a> API action.
  ///
  /// Parameter [role] :
  /// The name or full Amazon Resource Name (ARN) of the IAM role that allows
  /// Amazon ECS to make calls to your load balancer on your behalf. This
  /// parameter is only permitted if you are using a load balancer with your
  /// service and your task definition does not use the <code>awsvpc</code>
  /// network mode. If you specify the <code>role</code> parameter, you must
  /// also specify a load balancer object with the <code>loadBalancers</code>
  /// parameter.
  /// <important>
  /// If your account has already created the Amazon ECS service-linked role,
  /// that role is used by default for your service unless you specify a role
  /// here. The service-linked role is required if your task definition uses the
  /// <code>awsvpc</code> network mode or if the service is configured to use
  /// service discovery, an external deployment controller, multiple target
  /// groups, or Elastic Inference accelerators in which case you should not
  /// specify a role here. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
  /// service-linked roles for Amazon ECS</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </important>
  /// If your specified role has a path other than <code>/</code>, then you must
  /// either specify the full role ARN (this is recommended) or prefix the role
  /// name with the path. For example, if a role with the name <code>bar</code>
  /// has a path of <code>/foo/</code> then you would specify
  /// <code>/foo/bar</code> as the role name. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names">Friendly
  /// names and paths</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [schedulingStrategy] :
  /// The scheduling strategy to use for the service. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Services</a>.
  ///
  /// There are two service scheduler strategies available:
  ///
  /// <ul>
  /// <li>
  /// <code>REPLICA</code>-The replica scheduling strategy places and maintains
  /// the desired number of tasks across your cluster. By default, the service
  /// scheduler spreads tasks across Availability Zones. You can use task
  /// placement strategies and constraints to customize task placement
  /// decisions. This scheduler strategy is required if the service is using the
  /// <code>CODE_DEPLOY</code> or <code>EXTERNAL</code> deployment controller
  /// types.
  /// </li>
  /// <li>
  /// <code>DAEMON</code>-The daemon scheduling strategy deploys exactly one
  /// task on each active container instance that meets all of the task
  /// placement constraints that you specify in your cluster. The service
  /// scheduler also evaluates the task placement constraints for running tasks
  /// and will stop tasks that do not meet the placement constraints. When
  /// you're using this strategy, you don't need to specify a desired number of
  /// tasks, a task placement strategy, or use Service Auto Scaling policies.
  /// <note>
  /// Tasks using the Fargate launch type or the <code>CODE_DEPLOY</code> or
  /// <code>EXTERNAL</code> deployment controller types don't support the
  /// <code>DAEMON</code> scheduling strategy.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [serviceRegistries] :
  /// The details of the service discovery registry to associate with this
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// discovery</a>.
  /// <note>
  /// Each service may be associated with one service registry. Multiple service
  /// registries per service isn't supported.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the service to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define. When a service is deleted, the tags are deleted as well.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run
  /// in your service. If a <code>revision</code> is not specified, the latest
  /// <code>ACTIVE</code> revision is used.
  ///
  /// A task definition must be specified if the service is using either the
  /// <code>ECS</code> or <code>CODE_DEPLOY</code> deployment controllers.
  Future<CreateServiceResponse> createService({
    required String serviceName,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? clientToken,
    String? cluster,
    DeploymentConfiguration? deploymentConfiguration,
    DeploymentController? deploymentController,
    int? desiredCount,
    bool? enableECSManagedTags,
    bool? enableExecuteCommand,
    int? healthCheckGracePeriodSeconds,
    LaunchType? launchType,
    List<LoadBalancer>? loadBalancers,
    NetworkConfiguration? networkConfiguration,
    List<PlacementConstraint>? placementConstraints,
    List<PlacementStrategy>? placementStrategy,
    String? platformVersion,
    PropagateTags? propagateTags,
    String? role,
    SchedulingStrategy? schedulingStrategy,
    List<ServiceRegistry>? serviceRegistries,
    List<Tag>? tags,
    String? taskDefinition,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.CreateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (capacityProviderStrategy != null)
          'capacityProviderStrategy': capacityProviderStrategy,
        if (clientToken != null) 'clientToken': clientToken,
        if (cluster != null) 'cluster': cluster,
        if (deploymentConfiguration != null)
          'deploymentConfiguration': deploymentConfiguration,
        if (deploymentController != null)
          'deploymentController': deploymentController,
        if (desiredCount != null) 'desiredCount': desiredCount,
        if (enableECSManagedTags != null)
          'enableECSManagedTags': enableECSManagedTags,
        if (enableExecuteCommand != null)
          'enableExecuteCommand': enableExecuteCommand,
        if (healthCheckGracePeriodSeconds != null)
          'healthCheckGracePeriodSeconds': healthCheckGracePeriodSeconds,
        if (launchType != null) 'launchType': launchType.toValue(),
        if (loadBalancers != null) 'loadBalancers': loadBalancers,
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (placementConstraints != null)
          'placementConstraints': placementConstraints,
        if (placementStrategy != null) 'placementStrategy': placementStrategy,
        if (platformVersion != null) 'platformVersion': platformVersion,
        if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
        if (role != null) 'role': role,
        if (schedulingStrategy != null)
          'schedulingStrategy': schedulingStrategy.toValue(),
        if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
        if (tags != null) 'tags': tags,
        if (taskDefinition != null) 'taskDefinition': taskDefinition,
      },
    );

    return CreateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Create a task set in the specified cluster and service. This is used when
  /// a service uses the <code>EXTERNAL</code> deployment controller type. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [PlatformUnknownException].
  /// May throw [PlatformTaskDefinitionIncompatibilityException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service to create the task set in.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service to create
  /// the task set in.
  ///
  /// Parameter [taskDefinition] :
  /// The task definition for the tasks in the task set to use.
  ///
  /// Parameter [capacityProviderStrategy] :
  /// The capacity provider strategy to use for the task set.
  ///
  /// A capacity provider strategy consists of one or more capacity providers
  /// along with the <code>base</code> and <code>weight</code> to assign to
  /// them. A capacity provider must be associated with the cluster to be used
  /// in a capacity provider strategy. The <a>PutClusterCapacityProviders</a>
  /// API is used to associate a capacity provider with a cluster. Only capacity
  /// providers with an <code>ACTIVE</code> or <code>UPDATING</code> status can
  /// be used.
  ///
  /// If a <code>capacityProviderStrategy</code> is specified, the
  /// <code>launchType</code> parameter must be omitted. If no
  /// <code>capacityProviderStrategy</code> or <code>launchType</code> is
  /// specified, the <code>defaultCapacityProviderStrategy</code> for the
  /// cluster is used.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must already be created. New capacity providers can be
  /// created with the <a>CreateCapacityProvider</a> API operation.
  ///
  /// To use a AWS Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// AWS Fargate capacity providers are available to all accounts and only need
  /// to be associated with a cluster to be used.
  ///
  /// The <a>PutClusterCapacityProviders</a> API operation is used to update the
  /// list of available capacity providers for a cluster after the cluster is
  /// created.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 32 ASCII characters are allowed.
  ///
  /// Parameter [externalId] :
  /// An optional non-unique tag that identifies this task set in external
  /// systems. If the task set is associated with a service discovery registry,
  /// the tasks in this task set will have the
  /// <code>ECS_TASK_SET_EXTERNAL_ID</code> AWS Cloud Map attribute set to the
  /// provided value.
  ///
  /// Parameter [launchType] :
  /// The launch type that new tasks in the task set will use. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS Launch Types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// If a <code>launchType</code> is specified, the
  /// <code>capacityProviderStrategy</code> parameter must be omitted.
  ///
  /// Parameter [loadBalancers] :
  /// A load balancer object representing the load balancer to use with the task
  /// set. The supported load balancer types are either an Application Load
  /// Balancer or a Network Load Balancer.
  ///
  /// Parameter [networkConfiguration] :
  /// An object representing the network configuration for a task set.
  ///
  /// Parameter [platformVersion] :
  /// The platform version that the tasks in the task set should use. A platform
  /// version is specified only for tasks using the Fargate launch type. If one
  /// isn't specified, the <code>LATEST</code> platform version is used by
  /// default.
  ///
  /// Parameter [scale] :
  /// A floating-point percentage of the desired number of tasks to place and
  /// keep running in the task set.
  ///
  /// Parameter [serviceRegistries] :
  /// The details of the service discovery registries to assign to this task
  /// set. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// Discovery</a>.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task set to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define. When a service is deleted, the tags are deleted as well.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<CreateTaskSetResponse> createTaskSet({
    required String cluster,
    required String service,
    required String taskDefinition,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? clientToken,
    String? externalId,
    LaunchType? launchType,
    List<LoadBalancer>? loadBalancers,
    NetworkConfiguration? networkConfiguration,
    String? platformVersion,
    Scale? scale,
    List<ServiceRegistry>? serviceRegistries,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(service, 'service');
    ArgumentError.checkNotNull(taskDefinition, 'taskDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.CreateTaskSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'service': service,
        'taskDefinition': taskDefinition,
        if (capacityProviderStrategy != null)
          'capacityProviderStrategy': capacityProviderStrategy,
        if (clientToken != null) 'clientToken': clientToken,
        if (externalId != null) 'externalId': externalId,
        if (launchType != null) 'launchType': launchType.toValue(),
        if (loadBalancers != null) 'loadBalancers': loadBalancers,
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (platformVersion != null) 'platformVersion': platformVersion,
        if (scale != null) 'scale': scale,
        if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateTaskSetResponse.fromJson(jsonResponse.body);
  }

  /// Disables an account setting for a specified IAM user, IAM role, or the
  /// root user for an account.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The resource name for which to disable the account setting. If
  /// <code>serviceLongArnFormat</code> is specified, the ARN for your Amazon
  /// ECS services is affected. If <code>taskLongArnFormat</code> is specified,
  /// the ARN and resource ID for your Amazon ECS tasks is affected. If
  /// <code>containerInstanceLongArnFormat</code> is specified, the ARN and
  /// resource ID for your Amazon ECS container instances is affected. If
  /// <code>awsvpcTrunking</code> is specified, the ENI limit for your Amazon
  /// ECS container instances is affected.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the principal, which can be an IAM user, IAM role, or the root
  /// user. If you specify the root user, it disables the account setting for
  /// all IAM users, IAM roles, and the root user of the account unless an IAM
  /// user or role explicitly overrides these settings. If this field is
  /// omitted, the setting is changed only for the authenticated user.
  Future<DeleteAccountSettingResponse> deleteAccountSetting({
    required SettingName name,
    String? principalArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteAccountSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name.toValue(),
        if (principalArn != null) 'principalArn': principalArn,
      },
    );

    return DeleteAccountSettingResponse.fromJson(jsonResponse.body);
  }

  /// Deletes one or more custom attributes from an Amazon ECS resource.
  ///
  /// May throw [ClusterNotFoundException].
  /// May throw [TargetNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attributes] :
  /// The attributes to delete from your resource. You can specify up to 10
  /// attributes per request. For custom attributes, specify the attribute name
  /// and target ID, but do not specify the value. If you specify the target ID
  /// using the short form, you must also specify the target type.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// contains the resource to delete attributes. If you do not specify a
  /// cluster, the default cluster is assumed.
  Future<DeleteAttributesResponse> deleteAttributes({
    required List<Attribute> attributes,
    String? cluster,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attributes': attributes,
        if (cluster != null) 'cluster': cluster,
      },
    );

    return DeleteAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified capacity provider.
  /// <note>
  /// The <code>FARGATE</code> and <code>FARGATE_SPOT</code> capacity providers
  /// are reserved and cannot be deleted. You can disassociate them from a
  /// cluster using either the <a>PutClusterCapacityProviders</a> API or by
  /// deleting the cluster.
  /// </note>
  /// Prior to a capacity provider being deleted, the capacity provider must be
  /// removed from the capacity provider strategy from all services. The
  /// <a>UpdateService</a> API can be used to remove a capacity provider from a
  /// service's capacity provider strategy. When updating a service, the
  /// <code>forceNewDeployment</code> option can be used to ensure that any
  /// tasks using the Amazon EC2 instance capacity provided by the capacity
  /// provider are transitioned to use the capacity from the remaining capacity
  /// providers. Only capacity providers that are not associated with a cluster
  /// can be deleted. To remove a capacity provider from a cluster, you can
  /// either use <a>PutClusterCapacityProviders</a> or delete the cluster.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [capacityProvider] :
  /// The short name or full Amazon Resource Name (ARN) of the capacity provider
  /// to delete.
  Future<DeleteCapacityProviderResponse> deleteCapacityProvider({
    required String capacityProvider,
  }) async {
    ArgumentError.checkNotNull(capacityProvider, 'capacityProvider');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DeleteCapacityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capacityProvider': capacityProvider,
      },
    );

    return DeleteCapacityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified cluster. The cluster will transition to the
  /// <code>INACTIVE</code> state. Clusters with an <code>INACTIVE</code> status
  /// may remain discoverable in your account for a period of time. However,
  /// this behavior is subject to change in the future, so you should not rely
  /// on <code>INACTIVE</code> clusters persisting.
  ///
  /// You must deregister all container instances from this cluster before you
  /// may delete it. You can list the container instances in a cluster with
  /// <a>ListContainerInstances</a> and deregister them with
  /// <a>DeregisterContainerInstance</a>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ClusterContainsContainerInstancesException].
  /// May throw [ClusterContainsServicesException].
  /// May throw [ClusterContainsTasksException].
  /// May throw [UpdateInProgressException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to
  /// delete.
  Future<DeleteClusterResponse> deleteCluster({
    required String cluster,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
      },
    );

    return DeleteClusterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified service within a cluster. You can delete a service if
  /// you have no running tasks in it and the desired task count is zero. If the
  /// service is actively maintaining tasks, you cannot delete it, and you must
  /// update the service to a desired task count of zero. For more information,
  /// see <a>UpdateService</a>.
  /// <note>
  /// When you delete a service, if there are still running tasks that require
  /// cleanup, the service status moves from <code>ACTIVE</code> to
  /// <code>DRAINING</code>, and the service is no longer visible in the console
  /// or in the <a>ListServices</a> API operation. After all tasks have
  /// transitioned to either <code>STOPPING</code> or <code>STOPPED</code>
  /// status, the service status moves from <code>DRAINING</code> to
  /// <code>INACTIVE</code>. Services in the <code>DRAINING</code> or
  /// <code>INACTIVE</code> status can still be viewed with the
  /// <a>DescribeServices</a> API operation. However, in the future,
  /// <code>INACTIVE</code> services may be cleaned up and purged from Amazon
  /// ECS record keeping, and <a>DescribeServices</a> calls on those services
  /// return a <code>ServiceNotFoundException</code> error.
  /// </note> <important>
  /// If you attempt to create a new service with the same name as an existing
  /// service in either <code>ACTIVE</code> or <code>DRAINING</code> status, you
  /// receive an error.
  /// </important>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ServiceNotFoundException].
  ///
  /// Parameter [service] :
  /// The name of the service to delete.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service to delete. If you do not specify a cluster, the default
  /// cluster is assumed.
  ///
  /// Parameter [force] :
  /// If <code>true</code>, allows you to delete a service even if it has not
  /// been scaled down to zero tasks. It is only necessary to use this if the
  /// service is using the <code>REPLICA</code> scheduling strategy.
  Future<DeleteServiceResponse> deleteService({
    required String service,
    String? cluster,
    bool? force,
  }) async {
    ArgumentError.checkNotNull(service, 'service');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'service': service,
        if (cluster != null) 'cluster': cluster,
        if (force != null) 'force': force,
      },
    );

    return DeleteServiceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified task set within a service. This is used when a service
  /// uses the <code>EXTERNAL</code> deployment controller type. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  /// May throw [TaskSetNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task set exists in to delete.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service that
  /// hosts the task set to delete.
  ///
  /// Parameter [taskSet] :
  /// The task set ID or full Amazon Resource Name (ARN) of the task set to
  /// delete.
  ///
  /// Parameter [force] :
  /// If <code>true</code>, this allows you to delete a task set even if it
  /// hasn't been scaled down to zero.
  Future<DeleteTaskSetResponse> deleteTaskSet({
    required String cluster,
    required String service,
    required String taskSet,
    bool? force,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(service, 'service');
    ArgumentError.checkNotNull(taskSet, 'taskSet');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteTaskSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'service': service,
        'taskSet': taskSet,
        if (force != null) 'force': force,
      },
    );

    return DeleteTaskSetResponse.fromJson(jsonResponse.body);
  }

  /// Deregisters an Amazon ECS container instance from the specified cluster.
  /// This instance is no longer available to run tasks.
  ///
  /// If you intend to use the container instance for some other purpose after
  /// deregistration, you should stop all of the tasks running on the container
  /// instance before deregistration. That prevents any orphaned tasks from
  /// consuming resources.
  ///
  /// Deregistering a container instance removes the instance from a cluster,
  /// but it does not terminate the EC2 instance. If you are finished using the
  /// instance, be sure to terminate it in the Amazon EC2 console to stop
  /// billing.
  /// <note>
  /// If you terminate a running container instance, Amazon ECS automatically
  /// deregisters the instance from your cluster (stopped container instances or
  /// instances with disconnected agents are not automatically deregistered when
  /// terminated).
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [containerInstance] :
  /// The container instance ID or full ARN of the container instance to
  /// deregister. The ARN contains the <code>arn:aws:ecs</code> namespace,
  /// followed by the Region of the container instance, the AWS account ID of
  /// the container instance owner, the <code>container-instance</code>
  /// namespace, and then the container instance ID. For example,
  /// <code>arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID</code>.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the container instance to deregister. If you do not specify a
  /// cluster, the default cluster is assumed.
  ///
  /// Parameter [force] :
  /// Forces the deregistration of the container instance. If you have tasks
  /// running on the container instance when you deregister it with the
  /// <code>force</code> option, these tasks remain running until you terminate
  /// the instance or the tasks stop through some other means, but they are
  /// orphaned (no longer monitored or accounted for by Amazon ECS). If an
  /// orphaned task on your container instance is part of an Amazon ECS service,
  /// then the service scheduler starts another copy of that task, on a
  /// different container instance if possible.
  ///
  /// Any containers in orphaned service tasks that are registered with a
  /// Classic Load Balancer or an Application Load Balancer target group are
  /// deregistered. They begin connection draining according to the settings on
  /// the load balancer or target group.
  Future<DeregisterContainerInstanceResponse> deregisterContainerInstance({
    required String containerInstance,
    String? cluster,
    bool? force,
  }) async {
    ArgumentError.checkNotNull(containerInstance, 'containerInstance');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DeregisterContainerInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerInstance': containerInstance,
        if (cluster != null) 'cluster': cluster,
        if (force != null) 'force': force,
      },
    );

    return DeregisterContainerInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Deregisters the specified task definition by family and revision. Upon
  /// deregistration, the task definition is marked as <code>INACTIVE</code>.
  /// Existing tasks and services that reference an <code>INACTIVE</code> task
  /// definition continue to run without disruption. Existing services that
  /// reference an <code>INACTIVE</code> task definition can still scale up or
  /// down by modifying the service's desired count.
  ///
  /// You cannot use an <code>INACTIVE</code> task definition to run new tasks
  /// or create new services, and you cannot update an existing service to
  /// reference an <code>INACTIVE</code> task definition. However, there may be
  /// up to a 10-minute window following deregistration where these restrictions
  /// have not yet taken effect.
  /// <note>
  /// At this time, <code>INACTIVE</code> task definitions remain discoverable
  /// in your account indefinitely. However, this behavior is subject to change
  /// in the future, so you should not rely on <code>INACTIVE</code> task
  /// definitions persisting beyond the lifecycle of any associated tasks and
  /// services.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full Amazon Resource Name (ARN) of the
  /// task definition to deregister. You must specify a <code>revision</code>.
  Future<DeregisterTaskDefinitionResponse> deregisterTaskDefinition({
    required String taskDefinition,
  }) async {
    ArgumentError.checkNotNull(taskDefinition, 'taskDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DeregisterTaskDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskDefinition': taskDefinition,
      },
    );

    return DeregisterTaskDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more of your capacity providers.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [capacityProviders] :
  /// The short name or full Amazon Resource Name (ARN) of one or more capacity
  /// providers. Up to <code>100</code> capacity providers can be described in
  /// an action.
  ///
  /// Parameter [include] :
  /// Specifies whether or not you want to see the resource tags for the
  /// capacity provider. If <code>TAGS</code> is specified, the tags are
  /// included in the response. If this field is omitted, tags are not included
  /// in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of account setting results returned by
  /// <code>DescribeCapacityProviders</code> in paginated output. When this
  /// parameter is used, <code>DescribeCapacityProviders</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeCapacityProviders</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 10. If this
  /// parameter is not used, then <code>DescribeCapacityProviders</code> returns
  /// up to 10 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeCapacityProviders</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeCapacityProvidersResponse> describeCapacityProviders({
    List<String>? capacityProviders,
    List<CapacityProviderField>? include,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DescribeCapacityProviders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (capacityProviders != null) 'capacityProviders': capacityProviders,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeCapacityProvidersResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more of your clusters.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusters] :
  /// A list of up to 100 cluster names or full cluster Amazon Resource Name
  /// (ARN) entries. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [include] :
  /// Whether to include additional information about the clusters in the
  /// response. If this field is omitted, this information isn't included.
  ///
  /// If <code>ATTACHMENTS</code> is specified, the attachments for the
  /// container instances or tasks within the cluster are included.
  ///
  /// If <code>SETTINGS</code> is specified, the settings for the cluster are
  /// included.
  ///
  /// If <code>STATISTICS</code> is specified, the task and service count is
  /// included, separated by launch type.
  ///
  /// If <code>TAGS</code> is specified, the metadata tags associated with the
  /// cluster are included.
  Future<DescribeClustersResponse> describeClusters({
    List<String>? clusters,
    List<ClusterField>? include,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DescribeClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusters != null) 'clusters': clusters,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeClustersResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more container instances. Returns metadata about each
  /// container instance requested.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [containerInstances] :
  /// A list of up to 100 container instance IDs or full Amazon Resource Name
  /// (ARN) entries.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the container instances to describe. If you do not specify a
  /// cluster, the default cluster is assumed. This parameter is required if the
  /// container instance or container instances you are describing were launched
  /// in any cluster other than the default cluster.
  ///
  /// Parameter [include] :
  /// Specifies whether you want to see the resource tags for the container
  /// instance. If <code>TAGS</code> is specified, the tags are included in the
  /// response. If this field is omitted, tags are not included in the response.
  Future<DescribeContainerInstancesResponse> describeContainerInstances({
    required List<String> containerInstances,
    String? cluster,
    List<ContainerInstanceField>? include,
  }) async {
    ArgumentError.checkNotNull(containerInstances, 'containerInstances');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DescribeContainerInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerInstances': containerInstances,
        if (cluster != null) 'cluster': cluster,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeContainerInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified services running in your cluster.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [services] :
  /// A list of services to describe. You may specify up to 10 services to
  /// describe in a single operation.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN)the cluster that hosts
  /// the service to describe. If you do not specify a cluster, the default
  /// cluster is assumed. This parameter is required if the service or services
  /// you are describing were launched in any cluster other than the default
  /// cluster.
  ///
  /// Parameter [include] :
  /// Specifies whether you want to see the resource tags for the service. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags are not included in the response.
  Future<DescribeServicesResponse> describeServices({
    required List<String> services,
    String? cluster,
    List<ServiceField>? include,
  }) async {
    ArgumentError.checkNotNull(services, 'services');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DescribeServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'services': services,
        if (cluster != null) 'cluster': cluster,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeServicesResponse.fromJson(jsonResponse.body);
  }

  /// Describes a task definition. You can specify a <code>family</code> and
  /// <code>revision</code> to find information about a specific task
  /// definition, or you can simply specify the family to find the latest
  /// <code>ACTIVE</code> revision in that family.
  /// <note>
  /// You can only describe <code>INACTIVE</code> task definitions while an
  /// active task or service references them.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> for the latest <code>ACTIVE</code> revision,
  /// <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) for a specific revision in the family, or
  /// full Amazon Resource Name (ARN) of the task definition to describe.
  ///
  /// Parameter [include] :
  /// Specifies whether to see the resource tags for the task definition. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags are not included in the response.
  Future<DescribeTaskDefinitionResponse> describeTaskDefinition({
    required String taskDefinition,
    List<TaskDefinitionField>? include,
  }) async {
    ArgumentError.checkNotNull(taskDefinition, 'taskDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.DescribeTaskDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskDefinition': taskDefinition,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeTaskDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Describes the task sets in the specified cluster and service. This is used
  /// when a service uses the <code>EXTERNAL</code> deployment controller type.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task sets exist in.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service that the
  /// task sets exist in.
  ///
  /// Parameter [include] :
  /// Specifies whether to see the resource tags for the task set. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags are not included in the response.
  ///
  /// Parameter [taskSets] :
  /// The ID or full Amazon Resource Name (ARN) of task sets to describe.
  Future<DescribeTaskSetsResponse> describeTaskSets({
    required String cluster,
    required String service,
    List<TaskSetField>? include,
    List<String>? taskSets,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(service, 'service');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DescribeTaskSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'service': service,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
        if (taskSets != null) 'taskSets': taskSets,
      },
    );

    return DescribeTaskSetsResponse.fromJson(jsonResponse.body);
  }

  /// Describes a specified task or tasks.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [tasks] :
  /// A list of up to 100 task IDs or full ARN entries.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the task or tasks to describe. If you do not specify a cluster, the
  /// default cluster is assumed. This parameter is required if the task or
  /// tasks you are describing were launched in any cluster other than the
  /// default cluster.
  ///
  /// Parameter [include] :
  /// Specifies whether you want to see the resource tags for the task. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags are not included in the response.
  Future<DescribeTasksResponse> describeTasks({
    required List<String> tasks,
    String? cluster,
    List<TaskField>? include,
  }) async {
    ArgumentError.checkNotNull(tasks, 'tasks');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DescribeTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'tasks': tasks,
        if (cluster != null) 'cluster': cluster,
        if (include != null)
          'include': include.map((e) => e.toValue()).toList(),
      },
    );

    return DescribeTasksResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  /// </note>
  /// Returns an endpoint for the Amazon ECS agent to poll for updates.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to which
  /// the container instance belongs.
  ///
  /// Parameter [containerInstance] :
  /// The container instance ID or full ARN of the container instance. The ARN
  /// contains the <code>arn:aws:ecs</code> namespace, followed by the Region of
  /// the container instance, the AWS account ID of the container instance
  /// owner, the <code>container-instance</code> namespace, and then the
  /// container instance ID. For example,
  /// <code>arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID</code>.
  Future<DiscoverPollEndpointResponse> discoverPollEndpoint({
    String? cluster,
    String? containerInstance,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DiscoverPollEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (cluster != null) 'cluster': cluster,
        if (containerInstance != null) 'containerInstance': containerInstance,
      },
    );

    return DiscoverPollEndpointResponse.fromJson(jsonResponse.body);
  }

  /// Runs a command remotely on a container within a task.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [ClusterNotFoundException].
  /// May throw [TargetNotConnectedException].
  ///
  /// Parameter [command] :
  /// The command to run on the container.
  ///
  /// Parameter [interactive] :
  /// Use this flag to run your command in interactive mode.
  ///
  /// Parameter [task] :
  /// The Amazon Resource Name (ARN) or ID of the task the container is part of.
  ///
  /// Parameter [cluster] :
  /// The Amazon Resource Name (ARN) or short name of the cluster the task is
  /// running in. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [container] :
  /// The name of the container to execute the command on. A container name only
  /// needs to be specified for tasks containing multiple containers.
  Future<ExecuteCommandResponse> executeCommand({
    required String command,
    required bool interactive,
    required String task,
    String? cluster,
    String? container,
  }) async {
    ArgumentError.checkNotNull(command, 'command');
    ArgumentError.checkNotNull(interactive, 'interactive');
    ArgumentError.checkNotNull(task, 'task');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ExecuteCommand'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'command': command,
        'interactive': interactive,
        'task': task,
        if (cluster != null) 'cluster': cluster,
        if (container != null) 'container': container,
      },
    );

    return ExecuteCommandResponse.fromJson(jsonResponse.body);
  }

  /// Lists the account settings for a specified principal.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [effectiveSettings] :
  /// Specifies whether to return the effective settings. If <code>true</code>,
  /// the account settings for the root user or the default setting for the
  /// <code>principalArn</code> are returned. If <code>false</code>, the account
  /// settings for the <code>principalArn</code> are returned if they are set.
  /// Otherwise, no account settings are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of account setting results returned by
  /// <code>ListAccountSettings</code> in paginated output. When this parameter
  /// is used, <code>ListAccountSettings</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListAccountSettings</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 10. If this
  /// parameter is not used, then <code>ListAccountSettings</code> returns up to
  /// 10 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [name] :
  /// The name of the account setting you want to list the settings for.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListAccountSettings</code> request indicating that more results are
  /// available to fulfill the request and further calls will be needed. If
  /// <code>maxResults</code> was provided, it is possible the number of results
  /// to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [principalArn] :
  /// The ARN of the principal, which can be an IAM user, IAM role, or the root
  /// user. If this field is omitted, the account settings are listed only for
  /// the authenticated user.
  /// <note>
  /// Federated users assume the account setting of the root user and can't have
  /// explicit account settings set for them.
  /// </note>
  ///
  /// Parameter [value] :
  /// The value of the account settings with which to filter results. You must
  /// also specify an account setting name to use this parameter.
  Future<ListAccountSettingsResponse> listAccountSettings({
    bool? effectiveSettings,
    int? maxResults,
    SettingName? name,
    String? nextToken,
    String? principalArn,
    String? value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListAccountSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (effectiveSettings != null) 'effectiveSettings': effectiveSettings,
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
        if (principalArn != null) 'principalArn': principalArn,
        if (value != null) 'value': value,
      },
    );

    return ListAccountSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the attributes for Amazon ECS resources within a specified target
  /// type and cluster. When you specify a target type and cluster,
  /// <code>ListAttributes</code> returns a list of attribute objects, one for
  /// each attribute on each resource. You can filter the list of results to a
  /// single attribute name to only return results that have that name. You can
  /// also filter the results by attribute name and value, for example, to see
  /// which container instances in a cluster are running a Linux AMI
  /// (<code>ecs.os-type=linux</code>).
  ///
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [targetType] :
  /// The type of the target with which to list attributes.
  ///
  /// Parameter [attributeName] :
  /// The name of the attribute with which to filter the results.
  ///
  /// Parameter [attributeValue] :
  /// The value of the attribute with which to filter results. You must also
  /// specify an attribute name to use this parameter.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to list
  /// attributes. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results returned by
  /// <code>ListAttributes</code> in paginated output. When this parameter is
  /// used, <code>ListAttributes</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>ListAttributes</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListAttributes</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListAttributes</code> request indicating that more results are
  /// available to fulfill the request and further calls will be needed. If
  /// <code>maxResults</code> was provided, it is possible the number of results
  /// to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAttributesResponse> listAttributes({
    required TargetType targetType,
    String? attributeName,
    String? attributeValue,
    String? cluster,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(targetType, 'targetType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'targetType': targetType.toValue(),
        if (attributeName != null) 'attributeName': attributeName,
        if (attributeValue != null) 'attributeValue': attributeValue,
        if (cluster != null) 'cluster': cluster,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of existing clusters.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results returned by
  /// <code>ListClusters</code> in paginated output. When this parameter is
  /// used, <code>ListClusters</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>ListClusters</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListClusters</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a <code>ListClusters</code>
  /// request indicating that more results are available to fulfill the request
  /// and further calls will be needed. If <code>maxResults</code> was provided,
  /// it is possible the number of results to be fewer than
  /// <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListClustersResponse> listClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListClustersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of container instances in a specified cluster. You can
  /// filter the results of a <code>ListContainerInstances</code> operation with
  /// cluster query language statements inside the <code>filter</code>
  /// parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// Query Language</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the container instances to list. If you do not specify a cluster,
  /// the default cluster is assumed.
  ///
  /// Parameter [filter] :
  /// You can filter the results of a <code>ListContainerInstances</code>
  /// operation with cluster query language statements. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// Query Language</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of container instance results returned by
  /// <code>ListContainerInstances</code> in paginated output. When this
  /// parameter is used, <code>ListContainerInstances</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListContainerInstances</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListContainerInstances</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListContainerInstances</code> request indicating that more results
  /// are available to fulfill the request and further calls will be needed. If
  /// <code>maxResults</code> was provided, it is possible the number of results
  /// to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [status] :
  /// Filters the container instances by status. For example, if you specify the
  /// <code>DRAINING</code> status, the results include only container instances
  /// that have been set to <code>DRAINING</code> using
  /// <a>UpdateContainerInstancesState</a>. If you do not specify this
  /// parameter, the default is to include container instances set to all states
  /// other than <code>INACTIVE</code>.
  Future<ListContainerInstancesResponse> listContainerInstances({
    String? cluster,
    String? filter,
    int? maxResults,
    String? nextToken,
    ContainerInstanceStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.ListContainerInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (cluster != null) 'cluster': cluster,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.toValue(),
      },
    );

    return ListContainerInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of services. You can filter the results by cluster, launch
  /// type, and scheduling strategy.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to use
  /// when filtering the <code>ListServices</code> results. If you do not
  /// specify a cluster, the default cluster is assumed.
  ///
  /// Parameter [launchType] :
  /// The launch type to use when filtering the <code>ListServices</code>
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service results returned by
  /// <code>ListServices</code> in paginated output. When this parameter is
  /// used, <code>ListServices</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>ListServices</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListServices</code> returns up to 10
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a <code>ListServices</code>
  /// request indicating that more results are available to fulfill the request
  /// and further calls will be needed. If <code>maxResults</code> was provided,
  /// it is possible the number of results to be fewer than
  /// <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [schedulingStrategy] :
  /// The scheduling strategy to use when filtering the
  /// <code>ListServices</code> results.
  Future<ListServicesResponse> listServices({
    String? cluster,
    LaunchType? launchType,
    int? maxResults,
    String? nextToken,
    SchedulingStrategy? schedulingStrategy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (cluster != null) 'cluster': cluster,
        if (launchType != null) 'launchType': launchType.toValue(),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (schedulingStrategy != null)
          'schedulingStrategy': schedulingStrategy.toValue(),
      },
    );

    return ListServicesResponse.fromJson(jsonResponse.body);
  }

  /// List the tags for an Amazon ECS resource.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the supported resources are Amazon ECS tasks,
  /// services, task definitions, clusters, and container instances.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of task definition families that are registered to your
  /// account (which may include task definition families that no longer have
  /// any <code>ACTIVE</code> task definition revisions).
  ///
  /// You can filter out task definition families that do not contain any
  /// <code>ACTIVE</code> task definition revisions by setting the
  /// <code>status</code> parameter to <code>ACTIVE</code>. You can also filter
  /// the results with the <code>familyPrefix</code> parameter.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [familyPrefix] :
  /// The <code>familyPrefix</code> is a string that is used to filter the
  /// results of <code>ListTaskDefinitionFamilies</code>. If you specify a
  /// <code>familyPrefix</code>, only task definition family names that begin
  /// with the <code>familyPrefix</code> string are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task definition family results returned by
  /// <code>ListTaskDefinitionFamilies</code> in paginated output. When this
  /// parameter is used, <code>ListTaskDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListTaskDefinitionFamilies</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListTaskDefinitionFamilies</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListTaskDefinitionFamilies</code> request indicating that more
  /// results are available to fulfill the request and further calls will be
  /// needed. If <code>maxResults</code> was provided, it is possible the number
  /// of results to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [status] :
  /// The task definition family status with which to filter the
  /// <code>ListTaskDefinitionFamilies</code> results. By default, both
  /// <code>ACTIVE</code> and <code>INACTIVE</code> task definition families are
  /// listed. If this parameter is set to <code>ACTIVE</code>, only task
  /// definition families that have an <code>ACTIVE</code> task definition
  /// revision are returned. If this parameter is set to <code>INACTIVE</code>,
  /// only task definition families that do not have any <code>ACTIVE</code>
  /// task definition revisions are returned. If you paginate the resulting
  /// output, be sure to keep the <code>status</code> value constant in each
  /// subsequent request.
  Future<ListTaskDefinitionFamiliesResponse> listTaskDefinitionFamilies({
    String? familyPrefix,
    int? maxResults,
    String? nextToken,
    TaskDefinitionFamilyStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.ListTaskDefinitionFamilies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (familyPrefix != null) 'familyPrefix': familyPrefix,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.toValue(),
      },
    );

    return ListTaskDefinitionFamiliesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of task definitions that are registered to your account.
  /// You can filter the results by family name with the
  /// <code>familyPrefix</code> parameter or by status with the
  /// <code>status</code> parameter.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [familyPrefix] :
  /// The full family name with which to filter the
  /// <code>ListTaskDefinitions</code> results. Specifying a
  /// <code>familyPrefix</code> limits the listed task definitions to task
  /// definition revisions that belong to that family.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task definition results returned by
  /// <code>ListTaskDefinitions</code> in paginated output. When this parameter
  /// is used, <code>ListTaskDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListTaskDefinitions</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListTaskDefinitions</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListTaskDefinitions</code> request indicating that more results are
  /// available to fulfill the request and further calls will be needed. If
  /// <code>maxResults</code> was provided, it is possible the number of results
  /// to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [sort] :
  /// The order in which to sort the results. Valid values are <code>ASC</code>
  /// and <code>DESC</code>. By default (<code>ASC</code>), task definitions are
  /// listed lexicographically by family name and in ascending numerical order
  /// by revision so that the newest task definitions in a family are listed
  /// last. Setting this parameter to <code>DESC</code> reverses the sort order
  /// on family name and revision so that the newest task definitions in a
  /// family are listed first.
  ///
  /// Parameter [status] :
  /// The task definition status with which to filter the
  /// <code>ListTaskDefinitions</code> results. By default, only
  /// <code>ACTIVE</code> task definitions are listed. By setting this parameter
  /// to <code>INACTIVE</code>, you can view task definitions that are
  /// <code>INACTIVE</code> as long as an active task or service still
  /// references them. If you paginate the resulting output, be sure to keep the
  /// <code>status</code> value constant in each subsequent request.
  Future<ListTaskDefinitionsResponse> listTaskDefinitions({
    String? familyPrefix,
    int? maxResults,
    String? nextToken,
    SortOrder? sort,
    TaskDefinitionStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListTaskDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (familyPrefix != null) 'familyPrefix': familyPrefix,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (sort != null) 'sort': sort.toValue(),
        if (status != null) 'status': status.toValue(),
      },
    );

    return ListTaskDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of tasks. You can filter the results by cluster, task
  /// definition family, container instance, launch type, what IAM principal
  /// started the task, or by the desired status of the task.
  ///
  /// Recently stopped tasks might appear in the returned results. Currently,
  /// stopped tasks appear in the returned results for at least one hour.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ServiceNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to use
  /// when filtering the <code>ListTasks</code> results. If you do not specify a
  /// cluster, the default cluster is assumed.
  ///
  /// Parameter [containerInstance] :
  /// The container instance ID or full ARN of the container instance to use
  /// when filtering the <code>ListTasks</code> results. Specifying a
  /// <code>containerInstance</code> limits the results to tasks that belong to
  /// that container instance.
  ///
  /// Parameter [desiredStatus] :
  /// The task desired status to use when filtering the <code>ListTasks</code>
  /// results. Specifying a <code>desiredStatus</code> of <code>STOPPED</code>
  /// limits the results to tasks that Amazon ECS has set the desired status to
  /// <code>STOPPED</code>. This can be useful for debugging tasks that are not
  /// starting properly or have died or finished. The default status filter is
  /// <code>RUNNING</code>, which shows tasks that Amazon ECS has set the
  /// desired status to <code>RUNNING</code>.
  /// <note>
  /// Although you can filter results based on a desired status of
  /// <code>PENDING</code>, this does not return any results. Amazon ECS never
  /// sets the desired status of a task to that value (only a task's
  /// <code>lastStatus</code> may have a value of <code>PENDING</code>).
  /// </note>
  ///
  /// Parameter [family] :
  /// The name of the task definition family to use when filtering the
  /// <code>ListTasks</code> results. Specifying a <code>family</code> limits
  /// the results to tasks that belong to that family.
  ///
  /// Parameter [launchType] :
  /// The launch type to use when filtering the <code>ListTasks</code> results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task results returned by <code>ListTasks</code> in
  /// paginated output. When this parameter is used, <code>ListTasks</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListTasks</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If this parameter is not used, then
  /// <code>ListTasks</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a <code>ListTasks</code>
  /// request indicating that more results are available to fulfill the request
  /// and further calls will be needed. If <code>maxResults</code> was provided,
  /// it is possible the number of results to be fewer than
  /// <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [serviceName] :
  /// The name of the service to use when filtering the <code>ListTasks</code>
  /// results. Specifying a <code>serviceName</code> limits the results to tasks
  /// that belong to that service.
  ///
  /// Parameter [startedBy] :
  /// The <code>startedBy</code> value with which to filter the task results.
  /// Specifying a <code>startedBy</code> value limits the results to tasks that
  /// were started with that value.
  Future<ListTasksResponse> listTasks({
    String? cluster,
    String? containerInstance,
    DesiredStatus? desiredStatus,
    String? family,
    LaunchType? launchType,
    int? maxResults,
    String? nextToken,
    String? serviceName,
    String? startedBy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.ListTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (cluster != null) 'cluster': cluster,
        if (containerInstance != null) 'containerInstance': containerInstance,
        if (desiredStatus != null) 'desiredStatus': desiredStatus.toValue(),
        if (family != null) 'family': family,
        if (launchType != null) 'launchType': launchType.toValue(),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (serviceName != null) 'serviceName': serviceName,
        if (startedBy != null) 'startedBy': startedBy,
      },
    );

    return ListTasksResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an account setting. Account settings are set on a per-Region
  /// basis.
  ///
  /// If you change the account setting for the root user, the default settings
  /// for all of the IAM users and roles for which no individual account setting
  /// has been specified are reset. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html">Account
  /// Settings</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// When <code>serviceLongArnFormat</code>, <code>taskLongArnFormat</code>, or
  /// <code>containerInstanceLongArnFormat</code> are specified, the Amazon
  /// Resource Name (ARN) and resource ID format of the resource type for a
  /// specified IAM user, IAM role, or the root user for an account is affected.
  /// The opt-in and opt-out account setting must be set for each Amazon ECS
  /// resource separately. The ARN and resource ID format of a resource will be
  /// defined by the opt-in status of the IAM user or role that created the
  /// resource. You must enable this setting to use Amazon ECS features such as
  /// resource tagging.
  ///
  /// When <code>awsvpcTrunking</code> is specified, the elastic network
  /// interface (ENI) limit for any new container instances that support the
  /// feature is changed. If <code>awsvpcTrunking</code> is enabled, any new
  /// container instances that support the feature are launched have the
  /// increased ENI limits available to them. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html">Elastic
  /// Network Interface Trunking</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// When <code>containerInsights</code> is specified, the default setting
  /// indicating whether CloudWatch Container Insights is enabled for your
  /// clusters is changed. If <code>containerInsights</code> is enabled, any new
  /// clusters that are created will have Container Insights enabled unless you
  /// disable it during cluster creation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html">CloudWatch
  /// Container Insights</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The Amazon ECS resource name for which to modify the account setting. If
  /// <code>serviceLongArnFormat</code> is specified, the ARN for your Amazon
  /// ECS services is affected. If <code>taskLongArnFormat</code> is specified,
  /// the ARN and resource ID for your Amazon ECS tasks is affected. If
  /// <code>containerInstanceLongArnFormat</code> is specified, the ARN and
  /// resource ID for your Amazon ECS container instances is affected. If
  /// <code>awsvpcTrunking</code> is specified, the elastic network interface
  /// (ENI) limit for your Amazon ECS container instances is affected. If
  /// <code>containerInsights</code> is specified, the default setting for
  /// CloudWatch Container Insights for your clusters is affected.
  ///
  /// Parameter [value] :
  /// The account setting value for the specified principal ARN. Accepted values
  /// are <code>enabled</code> and <code>disabled</code>.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the principal, which can be an IAM user, IAM role, or the root
  /// user. If you specify the root user, it modifies the account setting for
  /// all IAM users, IAM roles, and the root user of the account unless an IAM
  /// user or role explicitly overrides these settings. If this field is
  /// omitted, the setting is changed only for the authenticated user.
  /// <note>
  /// Federated users assume the account setting of the root user and can't have
  /// explicit account settings set for them.
  /// </note>
  Future<PutAccountSettingResponse> putAccountSetting({
    required SettingName name,
    required String value,
    String? principalArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(value, 'value');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.PutAccountSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name.toValue(),
        'value': value,
        if (principalArn != null) 'principalArn': principalArn,
      },
    );

    return PutAccountSettingResponse.fromJson(jsonResponse.body);
  }

  /// Modifies an account setting for all IAM users on an account for whom no
  /// individual account setting has been specified. Account settings are set on
  /// a per-Region basis.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The resource name for which to modify the account setting. If
  /// <code>serviceLongArnFormat</code> is specified, the ARN for your Amazon
  /// ECS services is affected. If <code>taskLongArnFormat</code> is specified,
  /// the ARN and resource ID for your Amazon ECS tasks is affected. If
  /// <code>containerInstanceLongArnFormat</code> is specified, the ARN and
  /// resource ID for your Amazon ECS container instances is affected. If
  /// <code>awsvpcTrunking</code> is specified, the ENI limit for your Amazon
  /// ECS container instances is affected. If <code>containerInsights</code> is
  /// specified, the default setting for CloudWatch Container Insights for your
  /// clusters is affected.
  ///
  /// Parameter [value] :
  /// The account setting value for the specified principal ARN. Accepted values
  /// are <code>enabled</code> and <code>disabled</code>.
  Future<PutAccountSettingDefaultResponse> putAccountSettingDefault({
    required SettingName name,
    required String value,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(value, 'value');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.PutAccountSettingDefault'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name.toValue(),
        'value': value,
      },
    );

    return PutAccountSettingDefaultResponse.fromJson(jsonResponse.body);
  }

  /// Create or update an attribute on an Amazon ECS resource. If the attribute
  /// does not exist, it is created. If the attribute exists, its value is
  /// replaced with the specified value. To delete an attribute, use
  /// <a>DeleteAttributes</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes">Attributes</a>
  /// in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// May throw [ClusterNotFoundException].
  /// May throw [TargetNotFoundException].
  /// May throw [AttributeLimitExceededException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attributes] :
  /// The attributes to apply to your resource. You can specify up to 10 custom
  /// attributes per resource. You can specify up to 10 attributes in a single
  /// call.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// contains the resource to apply attributes. If you do not specify a
  /// cluster, the default cluster is assumed.
  Future<PutAttributesResponse> putAttributes({
    required List<Attribute> attributes,
    String? cluster,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.PutAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attributes': attributes,
        if (cluster != null) 'cluster': cluster,
      },
    );

    return PutAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the available capacity providers and the default capacity
  /// provider strategy for a cluster.
  ///
  /// You must specify both the available capacity providers and a default
  /// capacity provider strategy for the cluster. If the specified cluster has
  /// existing capacity providers associated with it, you must specify all
  /// existing capacity providers in addition to any new ones you want to add.
  /// Any existing capacity providers associated with a cluster that are omitted
  /// from a <a>PutClusterCapacityProviders</a> API call will be disassociated
  /// with the cluster. You can only disassociate an existing capacity provider
  /// from a cluster if it's not being used by any existing tasks.
  ///
  /// When creating a service or running a task on a cluster, if no capacity
  /// provider or launch type is specified, then the cluster's default capacity
  /// provider strategy is used. It is recommended to define a default capacity
  /// provider strategy for your cluster, however you may specify an empty array
  /// (<code>[]</code>) to bypass defining a default strategy.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [UpdateInProgressException].
  ///
  /// Parameter [capacityProviders] :
  /// The name of one or more capacity providers to associate with the cluster.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must already be created. New capacity providers can be
  /// created with the <a>CreateCapacityProvider</a> API operation.
  ///
  /// To use a AWS Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// AWS Fargate capacity providers are available to all accounts and only need
  /// to be associated with a cluster to be used.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to modify
  /// the capacity provider settings for. If you do not specify a cluster, the
  /// default cluster is assumed.
  ///
  /// Parameter [defaultCapacityProviderStrategy] :
  /// The capacity provider strategy to use by default for the cluster.
  ///
  /// When creating a service or running a task on a cluster, if no capacity
  /// provider or launch type is specified then the default capacity provider
  /// strategy for the cluster is used.
  ///
  /// A capacity provider strategy consists of one or more capacity providers
  /// along with the <code>base</code> and <code>weight</code> to assign to
  /// them. A capacity provider must be associated with the cluster to be used
  /// in a capacity provider strategy. The <a>PutClusterCapacityProviders</a>
  /// API is used to associate a capacity provider with a cluster. Only capacity
  /// providers with an <code>ACTIVE</code> or <code>UPDATING</code> status can
  /// be used.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must already be created. New capacity providers can be
  /// created with the <a>CreateCapacityProvider</a> API operation.
  ///
  /// To use a AWS Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// AWS Fargate capacity providers are available to all accounts and only need
  /// to be associated with a cluster to be used.
  Future<PutClusterCapacityProvidersResponse> putClusterCapacityProviders({
    required List<String> capacityProviders,
    required String cluster,
    required List<CapacityProviderStrategyItem> defaultCapacityProviderStrategy,
  }) async {
    ArgumentError.checkNotNull(capacityProviders, 'capacityProviders');
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(
        defaultCapacityProviderStrategy, 'defaultCapacityProviderStrategy');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.PutClusterCapacityProviders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'capacityProviders': capacityProviders,
        'cluster': cluster,
        'defaultCapacityProviderStrategy': defaultCapacityProviderStrategy,
      },
    );

    return PutClusterCapacityProvidersResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  /// </note>
  /// Registers an EC2 instance into the specified cluster. This instance
  /// becomes available to place containers on.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attributes] :
  /// The container instance attributes that this container instance supports.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster with
  /// which to register your container instance. If you do not specify a
  /// cluster, the default cluster is assumed.
  ///
  /// Parameter [containerInstanceArn] :
  /// The ARN of the container instance (if it was previously registered).
  ///
  /// Parameter [instanceIdentityDocument] :
  /// The instance identity document for the EC2 instance to register. This
  /// document can be found by running the following command from the instance:
  /// <code>curl
  /// http://169.254.169.254/latest/dynamic/instance-identity/document/</code>
  ///
  /// Parameter [instanceIdentityDocumentSignature] :
  /// The instance identity document signature for the EC2 instance to register.
  /// This signature can be found by running the following command from the
  /// instance: <code>curl
  /// http://169.254.169.254/latest/dynamic/instance-identity/signature/</code>
  ///
  /// Parameter [platformDevices] :
  /// The devices that are available on the container instance. The only
  /// supported device type is a GPU.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the container instance to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [totalResources] :
  /// The resources available on the instance.
  ///
  /// Parameter [versionInfo] :
  /// The version information for the Amazon ECS container agent and Docker
  /// daemon running on the container instance.
  Future<RegisterContainerInstanceResponse> registerContainerInstance({
    List<Attribute>? attributes,
    String? cluster,
    String? containerInstanceArn,
    String? instanceIdentityDocument,
    String? instanceIdentityDocumentSignature,
    List<PlatformDevice>? platformDevices,
    List<Tag>? tags,
    List<Resource>? totalResources,
    VersionInfo? versionInfo,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.RegisterContainerInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attributes != null) 'attributes': attributes,
        if (cluster != null) 'cluster': cluster,
        if (containerInstanceArn != null)
          'containerInstanceArn': containerInstanceArn,
        if (instanceIdentityDocument != null)
          'instanceIdentityDocument': instanceIdentityDocument,
        if (instanceIdentityDocumentSignature != null)
          'instanceIdentityDocumentSignature':
              instanceIdentityDocumentSignature,
        if (platformDevices != null) 'platformDevices': platformDevices,
        if (tags != null) 'tags': tags,
        if (totalResources != null) 'totalResources': totalResources,
        if (versionInfo != null) 'versionInfo': versionInfo,
      },
    );

    return RegisterContainerInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Registers a new task definition from the supplied <code>family</code> and
  /// <code>containerDefinitions</code>. Optionally, you can add data volumes to
  /// your containers with the <code>volumes</code> parameter. For more
  /// information about task definition parameters and defaults, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html">Amazon
  /// ECS Task Definitions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// You can specify an IAM role for your task with the
  /// <code>taskRoleArn</code> parameter. When you specify an IAM role for a
  /// task, its containers can then use the latest versions of the AWS CLI or
  /// SDKs to make API requests to the AWS services that are specified in the
  /// IAM policy associated with the role. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// Roles for Tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// You can specify a Docker networking mode for the containers in your task
  /// definition with the <code>networkMode</code> parameter. The available
  /// network modes correspond to those described in <a
  /// href="https://docs.docker.com/engine/reference/run/#/network-settings">Network
  /// settings</a> in the Docker run reference. If you specify the
  /// <code>awsvpc</code> network mode, the task is allocated an elastic network
  /// interface, and you must specify a <a>NetworkConfiguration</a> when you
  /// create a service or run a task with the task definition. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// Networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [containerDefinitions] :
  /// A list of container definitions in JSON format that describe the different
  /// containers that make up your task.
  ///
  /// Parameter [family] :
  /// You must specify a <code>family</code> for a task definition, which allows
  /// you to track multiple versions of the same task definition. The
  /// <code>family</code> is used as a name for your task definition. Up to 255
  /// letters (uppercase and lowercase), numbers, underscores, and hyphens are
  /// allowed.
  ///
  /// Parameter [cpu] :
  /// The number of CPU units used by the task. It can be expressed as an
  /// integer using CPU units, for example <code>1024</code>, or as a string
  /// using vCPUs, for example <code>1 vCPU</code> or <code>1 vcpu</code>, in a
  /// task definition. String values are converted to an integer indicating the
  /// CPU units when the task definition is registered.
  /// <note>
  /// Task-level CPU and memory parameters are ignored for Windows containers.
  /// We recommend specifying container-level resources for Windows containers.
  /// </note>
  /// If you are using the EC2 launch type, this field is optional. Supported
  /// values are between <code>128</code> CPU units (<code>0.125</code> vCPUs)
  /// and <code>10240</code> CPU units (<code>10</code> vCPUs).
  ///
  /// If you are using the Fargate launch type, this field is required and you
  /// must use one of the following values, which determines your range of
  /// supported values for the <code>memory</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 256 (.25 vCPU) - Available <code>memory</code> values: 512 (0.5 GB), 1024
  /// (1 GB), 2048 (2 GB)
  /// </li>
  /// <li>
  /// 512 (.5 vCPU) - Available <code>memory</code> values: 1024 (1 GB), 2048 (2
  /// GB), 3072 (3 GB), 4096 (4 GB)
  /// </li>
  /// <li>
  /// 1024 (1 vCPU) - Available <code>memory</code> values: 2048 (2 GB), 3072 (3
  /// GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 GB), 8192 (8 GB)
  /// </li>
  /// <li>
  /// 2048 (2 vCPU) - Available <code>memory</code> values: Between 4096 (4 GB)
  /// and 16384 (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: Between 8192 (8 GB)
  /// and 30720 (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// </ul>
  ///
  /// Parameter [ephemeralStorage] :
  /// The amount of ephemeral storage to allocate for the task. This parameter
  /// is used to expand the total amount of ephemeral storage available, beyond
  /// the default amount, for tasks hosted on AWS Fargate. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/using_data_volumes.html">Fargate
  /// task storage</a> in the <i>Amazon ECS User Guide for AWS Fargate</i>.
  /// <note>
  /// This parameter is only supported for tasks hosted on AWS Fargate using
  /// platform version <code>1.4.0</code> or later.
  /// </note>
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the task execution role that grants the
  /// Amazon ECS container agent permission to make AWS API calls on your
  /// behalf. The task execution IAM role is required depending on the
  /// requirements of your task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html">Amazon
  /// ECS task execution IAM role</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [inferenceAccelerators] :
  /// The Elastic Inference accelerators to use for the containers in the task.
  ///
  /// Parameter [ipcMode] :
  /// The IPC resource namespace to use for the containers in the task. The
  /// valid values are <code>host</code>, <code>task</code>, or
  /// <code>none</code>. If <code>host</code> is specified, then all containers
  /// within the tasks that specified the <code>host</code> IPC mode on the same
  /// container instance share the same IPC resources with the host Amazon EC2
  /// instance. If <code>task</code> is specified, all containers within the
  /// specified task share the same IPC resources. If <code>none</code> is
  /// specified, then IPC resources within the containers of a task are private
  /// and not shared with other containers in a task or on the container
  /// instance. If no value is specified, then the IPC resource namespace
  /// sharing depends on the Docker daemon setting on the container instance.
  /// For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#ipc-settings---ipc">IPC
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> IPC mode is used, be aware that there is a
  /// heightened risk of undesired IPC namespace expose. For more information,
  /// see <a href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  ///
  /// If you are setting namespaced kernel parameters using
  /// <code>systemControls</code> for the containers in the task, the following
  /// will apply to your IPC resource namespace. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html">System
  /// Controls</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// For tasks that use the <code>host</code> IPC mode, IPC namespace related
  /// <code>systemControls</code> are not supported.
  /// </li>
  /// <li>
  /// For tasks that use the <code>task</code> IPC mode, IPC namespace related
  /// <code>systemControls</code> will apply to all containers within a task.
  /// </li>
  /// </ul> <note>
  /// This parameter is not supported for Windows containers or tasks run on AWS
  /// Fargate.
  /// </note>
  ///
  /// Parameter [memory] :
  /// The amount of memory (in MiB) used by the task. It can be expressed as an
  /// integer using MiB, for example <code>1024</code>, or as a string using GB,
  /// for example <code>1GB</code> or <code>1 GB</code>, in a task definition.
  /// String values are converted to an integer indicating the MiB when the task
  /// definition is registered.
  /// <note>
  /// Task-level CPU and memory parameters are ignored for Windows containers.
  /// We recommend specifying container-level resources for Windows containers.
  /// </note>
  /// If using the EC2 launch type, this field is optional.
  ///
  /// If using the Fargate launch type, this field is required and you must use
  /// one of the following values, which determines your range of supported
  /// values for the <code>cpu</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available <code>cpu</code>
  /// values: 256 (.25 vCPU)
  /// </li>
  /// <li>
  /// 1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available
  /// <code>cpu</code> values: 512 (.5 vCPU)
  /// </li>
  /// <li>
  /// 2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7
  /// GB), 8192 (8 GB) - Available <code>cpu</code> values: 1024 (1 vCPU)
  /// </li>
  /// <li>
  /// Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 2048 (2 vCPU)
  /// </li>
  /// <li>
  /// Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 4096 (4 vCPU)
  /// </li>
  /// </ul>
  ///
  /// Parameter [networkMode] :
  /// The Docker networking mode to use for the containers in the task. The
  /// valid values are <code>none</code>, <code>bridge</code>,
  /// <code>awsvpc</code>, and <code>host</code>. If no network mode is
  /// specified, the default is <code>bridge</code>.
  ///
  /// For Amazon ECS tasks on Fargate, the <code>awsvpc</code> network mode is
  /// required. For Amazon ECS tasks on Amazon EC2 instances, any network mode
  /// can be used. If the network mode is set to <code>none</code>, you cannot
  /// specify port mappings in your container definitions, and the tasks
  /// containers do not have external connectivity. The <code>host</code> and
  /// <code>awsvpc</code> network modes offer the highest networking performance
  /// for containers because they use the EC2 network stack instead of the
  /// virtualized network stack provided by the <code>bridge</code> mode.
  ///
  /// With the <code>host</code> and <code>awsvpc</code> network modes, exposed
  /// container ports are mapped directly to the corresponding host port (for
  /// the <code>host</code> network mode) or the attached elastic network
  /// interface port (for the <code>awsvpc</code> network mode), so you cannot
  /// take advantage of dynamic host port mappings.
  /// <important>
  /// When using the <code>host</code> network mode, you should not run
  /// containers using the root user (UID 0). It is considered best practice to
  /// use a non-root user.
  /// </important>
  /// If the network mode is <code>awsvpc</code>, the task is allocated an
  /// elastic network interface, and you must specify a
  /// <a>NetworkConfiguration</a> value when you create a service or run a task
  /// with the task definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// Networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  /// <note>
  /// Currently, only Amazon ECS-optimized AMIs, other Amazon Linux variants
  /// with the <code>ecs-init</code> package, or AWS Fargate infrastructure
  /// support the <code>awsvpc</code> network mode.
  /// </note>
  /// If the network mode is <code>host</code>, you cannot run multiple
  /// instantiations of the same task on a single container instance when port
  /// mappings are used.
  ///
  /// Docker for Windows uses different network modes than Docker for Linux.
  /// When you register a task definition with Windows containers, you must not
  /// specify a network mode. If you use the console to register a task
  /// definition with Windows containers, you must choose the
  /// <code>&lt;default&gt;</code> network mode object.
  ///
  /// For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#network-settings">Network
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// Parameter [pidMode] :
  /// The process namespace to use for the containers in the task. The valid
  /// values are <code>host</code> or <code>task</code>. If <code>host</code> is
  /// specified, then all containers within the tasks that specified the
  /// <code>host</code> PID mode on the same container instance share the same
  /// process namespace with the host Amazon EC2 instance. If <code>task</code>
  /// is specified, all containers within the specified task share the same
  /// process namespace. If no value is specified, the default is a private
  /// namespace. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#pid-settings---pid">PID
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> PID mode is used, be aware that there is a
  /// heightened risk of undesired process namespace expose. For more
  /// information, see <a
  /// href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  /// <note>
  /// This parameter is not supported for Windows containers or tasks run on AWS
  /// Fargate.
  /// </note>
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for the task. You can
  /// specify a maximum of 10 constraints per task (this limit includes
  /// constraints in the task definition and those specified at runtime).
  ///
  /// Parameter [proxyConfiguration] :
  /// The configuration details for the App Mesh proxy.
  ///
  /// For tasks hosted on Amazon EC2 instances, the container instances require
  /// at least version <code>1.26.0</code> of the container agent and at least
  /// version <code>1.26.0-1</code> of the <code>ecs-init</code> package to
  /// enable a proxy configuration. If your container instances are launched
  /// from the Amazon ECS-optimized AMI version <code>20190301</code> or later,
  /// then they contain the required versions of the container agent and
  /// <code>ecs-init</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-ami-versions.html">Amazon
  /// ECS-optimized AMI versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [requiresCompatibilities] :
  /// The task launch type that Amazon ECS should validate the task definition
  /// against. A client exception is returned if the task definition doesn't
  /// validate against the compatibilities specified. If no value is specified,
  /// the parameter is omitted from the response.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task definition to help you categorize
  /// and organize them. Each tag consists of a key and an optional value, both
  /// of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [taskRoleArn] :
  /// The short name or full Amazon Resource Name (ARN) of the IAM role that
  /// containers in this task can assume. All containers in this task are
  /// granted the permissions that are specified in this role. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// Roles for Tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [volumes] :
  /// A list of volume definitions in JSON format that containers in your task
  /// may use.
  Future<RegisterTaskDefinitionResponse> registerTaskDefinition({
    required List<ContainerDefinition> containerDefinitions,
    required String family,
    String? cpu,
    EphemeralStorage? ephemeralStorage,
    String? executionRoleArn,
    List<InferenceAccelerator>? inferenceAccelerators,
    IpcMode? ipcMode,
    String? memory,
    NetworkMode? networkMode,
    PidMode? pidMode,
    List<TaskDefinitionPlacementConstraint>? placementConstraints,
    ProxyConfiguration? proxyConfiguration,
    List<Compatibility>? requiresCompatibilities,
    List<Tag>? tags,
    String? taskRoleArn,
    List<Volume>? volumes,
  }) async {
    ArgumentError.checkNotNull(containerDefinitions, 'containerDefinitions');
    ArgumentError.checkNotNull(family, 'family');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.RegisterTaskDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerDefinitions': containerDefinitions,
        'family': family,
        if (cpu != null) 'cpu': cpu,
        if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
        if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
        if (inferenceAccelerators != null)
          'inferenceAccelerators': inferenceAccelerators,
        if (ipcMode != null) 'ipcMode': ipcMode.toValue(),
        if (memory != null) 'memory': memory,
        if (networkMode != null) 'networkMode': networkMode.toValue(),
        if (pidMode != null) 'pidMode': pidMode.toValue(),
        if (placementConstraints != null)
          'placementConstraints': placementConstraints,
        if (proxyConfiguration != null)
          'proxyConfiguration': proxyConfiguration,
        if (requiresCompatibilities != null)
          'requiresCompatibilities':
              requiresCompatibilities.map((e) => e.toValue()).toList(),
        if (tags != null) 'tags': tags,
        if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
        if (volumes != null) 'volumes': volumes,
      },
    );

    return RegisterTaskDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new task using the specified task definition.
  ///
  /// You can allow Amazon ECS to place tasks for you, or you can customize how
  /// Amazon ECS places tasks using placement constraints and placement
  /// strategies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html">Scheduling
  /// Tasks</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// Alternatively, you can use <a>StartTask</a> to use your own scheduler or
  /// place tasks manually on specific container instances.
  ///
  /// The Amazon ECS API follows an eventual consistency model, due to the
  /// distributed nature of the system supporting the API. This means that the
  /// result of an API command you run that affects your Amazon ECS resources
  /// might not be immediately visible to all subsequent commands you run. Keep
  /// this in mind when you carry out an API command that immediately follows a
  /// previous API command.
  ///
  /// To manage eventual consistency, you can do the following:
  ///
  /// <ul>
  /// <li>
  /// Confirm the state of the resource before you run a command to modify it.
  /// Run the DescribeTasks command using an exponential backoff algorithm to
  /// ensure that you allow enough time for the previous command to propagate
  /// through the system. To do this, run the DescribeTasks command repeatedly,
  /// starting with a couple of seconds of wait time and increasing gradually up
  /// to five minutes of wait time.
  /// </li>
  /// <li>
  /// Add wait time between subsequent commands, even if the DescribeTasks
  /// command returns an accurate response. Apply an exponential backoff
  /// algorithm starting with a couple of seconds of wait time, and increase
  /// gradually up to about five minutes of wait time.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [PlatformUnknownException].
  /// May throw [PlatformTaskDefinitionIncompatibilityException].
  /// May throw [AccessDeniedException].
  /// May throw [BlockedException].
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run.
  /// If a <code>revision</code> is not specified, the latest
  /// <code>ACTIVE</code> revision is used.
  ///
  /// Parameter [capacityProviderStrategy] :
  /// The capacity provider strategy to use for the task.
  ///
  /// If a <code>capacityProviderStrategy</code> is specified, the
  /// <code>launchType</code> parameter must be omitted. If no
  /// <code>capacityProviderStrategy</code> or <code>launchType</code> is
  /// specified, the <code>defaultCapacityProviderStrategy</code> for the
  /// cluster is used.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster on which
  /// to run your task. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [count] :
  /// The number of instantiations of the specified task to place on your
  /// cluster. You can specify up to 10 tasks per call.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to enable Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Whether or not to enable the execute command functionality for the
  /// containers in this task. If <code>true</code>, this enables execute
  /// command functionality on all containers in the task.
  ///
  /// Parameter [group] :
  /// The name of the task group to associate with the task. The default value
  /// is the family name of the task definition (for example,
  /// family:my-family-name).
  ///
  /// Parameter [launchType] :
  /// The infrastructure on which to run your standalone task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The <code>FARGATE</code> launch type runs your tasks on AWS Fargate
  /// On-Demand infrastructure.
  /// <note>
  /// Fargate Spot infrastructure is available for use but a capacity provider
  /// strategy must be used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/fargate-capacity-providers.html">AWS
  /// Fargate capacity providers</a> in the <i>Amazon ECS User Guide for AWS
  /// Fargate</i>.
  /// </note>
  /// The <code>EC2</code> launch type runs your tasks on Amazon EC2 instances
  /// registered to your cluster.
  ///
  /// The <code>EXTERNAL</code> launch type runs your tasks on your on-premise
  /// server or virtual machine (VM) capacity registered to your cluster.
  ///
  /// A task can use either a launch type or a capacity provider strategy. If a
  /// <code>launchType</code> is specified, the
  /// <code>capacityProviderStrategy</code> parameter must be omitted.
  ///
  /// Parameter [networkConfiguration] :
  /// The network configuration for the task. This parameter is required for
  /// task definitions that use the <code>awsvpc</code> network mode to receive
  /// their own elastic network interface, and it is not supported for other
  /// network modes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// Networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [overrides] :
  /// A list of container overrides in JSON format that specify the name of a
  /// container in the specified task definition and the overrides it should
  /// receive. You can override the default command for a container (that is
  /// specified in the task definition or Docker image) with a
  /// <code>command</code> override. You can also override existing environment
  /// variables (that are specified in the task definition or Docker image) on a
  /// container or add new environment variables to it with an
  /// <code>environment</code> override.
  /// <note>
  /// A total of 8192 characters are allowed for overrides. This limit includes
  /// the JSON formatting characters of the override structure.
  /// </note>
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for the task. You can
  /// specify up to 10 constraints per task (including constraints in the task
  /// definition and those specified at runtime).
  ///
  /// Parameter [placementStrategy] :
  /// The placement strategy objects to use for the task. You can specify a
  /// maximum of five strategy rules per task.
  ///
  /// Parameter [platformVersion] :
  /// The platform version the task should run. A platform version is only
  /// specified for tasks using the Fargate launch type. If one is not
  /// specified, the <code>LATEST</code> platform version is used by default.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags are not propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task
  /// after task creation, use the <a>TagResource</a> API action.
  /// <note>
  /// An error will be received if you specify the <code>SERVICE</code> option
  /// when running a task.
  /// </note>
  ///
  /// Parameter [referenceId] :
  /// The reference ID to use for the task.
  ///
  /// Parameter [startedBy] :
  /// An optional tag specified when a task is started. For example, if you
  /// automatically trigger a task to run a batch process job, you could apply a
  /// unique identifier for that job to your task with the
  /// <code>startedBy</code> parameter. You can then identify which tasks belong
  /// to that job by filtering the results of a <a>ListTasks</a> call with the
  /// <code>startedBy</code> value. Up to 36 letters (uppercase and lowercase),
  /// numbers, hyphens, and underscores are allowed.
  ///
  /// If a task is started by an Amazon ECS service, then the
  /// <code>startedBy</code> parameter contains the deployment ID of the service
  /// that starts it.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<RunTaskResponse> runTask({
    required String taskDefinition,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? cluster,
    int? count,
    bool? enableECSManagedTags,
    bool? enableExecuteCommand,
    String? group,
    LaunchType? launchType,
    NetworkConfiguration? networkConfiguration,
    TaskOverride? overrides,
    List<PlacementConstraint>? placementConstraints,
    List<PlacementStrategy>? placementStrategy,
    String? platformVersion,
    PropagateTags? propagateTags,
    String? referenceId,
    String? startedBy,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(taskDefinition, 'taskDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.RunTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskDefinition': taskDefinition,
        if (capacityProviderStrategy != null)
          'capacityProviderStrategy': capacityProviderStrategy,
        if (cluster != null) 'cluster': cluster,
        if (count != null) 'count': count,
        if (enableECSManagedTags != null)
          'enableECSManagedTags': enableECSManagedTags,
        if (enableExecuteCommand != null)
          'enableExecuteCommand': enableExecuteCommand,
        if (group != null) 'group': group,
        if (launchType != null) 'launchType': launchType.toValue(),
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (overrides != null) 'overrides': overrides,
        if (placementConstraints != null)
          'placementConstraints': placementConstraints,
        if (placementStrategy != null) 'placementStrategy': placementStrategy,
        if (platformVersion != null) 'platformVersion': platformVersion,
        if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
        if (referenceId != null) 'referenceId': referenceId,
        if (startedBy != null) 'startedBy': startedBy,
        if (tags != null) 'tags': tags,
      },
    );

    return RunTaskResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new task from the specified task definition on the specified
  /// container instance or instances.
  ///
  /// Alternatively, you can use <a>RunTask</a> to place tasks for you. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html">Scheduling
  /// Tasks</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [containerInstances] :
  /// The container instance IDs or full ARN entries for the container instances
  /// on which you would like to place your task. You can specify up to 10
  /// container instances.
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to
  /// start. If a <code>revision</code> is not specified, the latest
  /// <code>ACTIVE</code> revision is used.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster on which
  /// to start your task. If you do not specify a cluster, the default cluster
  /// is assumed.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to enable Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Whether or not the execute command functionality is enabled for the task.
  /// If <code>true</code>, this enables execute command functionality on all
  /// containers in the task.
  ///
  /// Parameter [group] :
  /// The name of the task group to associate with the task. The default value
  /// is the family name of the task definition (for example,
  /// family:my-family-name).
  ///
  /// Parameter [networkConfiguration] :
  /// The VPC subnet and security group configuration for tasks that receive
  /// their own elastic network interface by using the <code>awsvpc</code>
  /// networking mode.
  ///
  /// Parameter [overrides] :
  /// A list of container overrides in JSON format that specify the name of a
  /// container in the specified task definition and the overrides it should
  /// receive. You can override the default command for a container (that is
  /// specified in the task definition or Docker image) with a
  /// <code>command</code> override. You can also override existing environment
  /// variables (that are specified in the task definition or Docker image) on a
  /// container or add new environment variables to it with an
  /// <code>environment</code> override.
  /// <note>
  /// A total of 8192 characters are allowed for overrides. This limit includes
  /// the JSON formatting characters of the override structure.
  /// </note>
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition or the
  /// service to the task. If no value is specified, the tags are not
  /// propagated.
  ///
  /// Parameter [referenceId] :
  /// The reference ID to use for the task.
  ///
  /// Parameter [startedBy] :
  /// An optional tag specified when a task is started. For example, if you
  /// automatically trigger a task to run a batch process job, you could apply a
  /// unique identifier for that job to your task with the
  /// <code>startedBy</code> parameter. You can then identify which tasks belong
  /// to that job by filtering the results of a <a>ListTasks</a> call with the
  /// <code>startedBy</code> value. Up to 36 letters (uppercase and lowercase),
  /// numbers, hyphens, and underscores are allowed.
  ///
  /// If a task is started by an Amazon ECS service, then the
  /// <code>startedBy</code> parameter contains the deployment ID of the service
  /// that starts it.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<StartTaskResponse> startTask({
    required List<String> containerInstances,
    required String taskDefinition,
    String? cluster,
    bool? enableECSManagedTags,
    bool? enableExecuteCommand,
    String? group,
    NetworkConfiguration? networkConfiguration,
    TaskOverride? overrides,
    PropagateTags? propagateTags,
    String? referenceId,
    String? startedBy,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(containerInstances, 'containerInstances');
    ArgumentError.checkNotNull(taskDefinition, 'taskDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.StartTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerInstances': containerInstances,
        'taskDefinition': taskDefinition,
        if (cluster != null) 'cluster': cluster,
        if (enableECSManagedTags != null)
          'enableECSManagedTags': enableECSManagedTags,
        if (enableExecuteCommand != null)
          'enableExecuteCommand': enableExecuteCommand,
        if (group != null) 'group': group,
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (overrides != null) 'overrides': overrides,
        if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
        if (referenceId != null) 'referenceId': referenceId,
        if (startedBy != null) 'startedBy': startedBy,
        if (tags != null) 'tags': tags,
      },
    );

    return StartTaskResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running task. Any tags associated with the task will be deleted.
  ///
  /// When <a>StopTask</a> is called on a task, the equivalent of <code>docker
  /// stop</code> is issued to the containers running in the task. This results
  /// in a <code>SIGTERM</code> value and a default 30-second timeout, after
  /// which the <code>SIGKILL</code> value is sent and the containers are
  /// forcibly stopped. If the container handles the <code>SIGTERM</code> value
  /// gracefully and exits within 30 seconds from receiving it, no
  /// <code>SIGKILL</code> value is sent.
  /// <note>
  /// The default 30-second timeout can be configured on the Amazon ECS
  /// container agent with the <code>ECS_CONTAINER_STOP_TIMEOUT</code> variable.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS Container Agent Configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [task] :
  /// The task ID or full Amazon Resource Name (ARN) of the task to stop.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the task to stop. If you do not specify a cluster, the default
  /// cluster is assumed.
  ///
  /// Parameter [reason] :
  /// An optional message specified when a task is stopped. For example, if you
  /// are using a custom scheduler, you can use this parameter to specify the
  /// reason for stopping the task here, and the message appears in subsequent
  /// <a>DescribeTasks</a> API operations on this task. Up to 255 characters are
  /// allowed in this message.
  Future<StopTaskResponse> stopTask({
    required String task,
    String? cluster,
    String? reason,
  }) async {
    ArgumentError.checkNotNull(task, 'task');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.StopTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'task': task,
        if (cluster != null) 'cluster': cluster,
        if (reason != null) 'reason': reason,
      },
    );

    return StopTaskResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  /// </note>
  /// Sent to acknowledge that an attachment changed states.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attachments] :
  /// Any attachments associated with the state change request.
  ///
  /// Parameter [cluster] :
  /// The short name or full ARN of the cluster that hosts the container
  /// instance the attachment belongs to.
  Future<SubmitAttachmentStateChangesResponse> submitAttachmentStateChanges({
    required List<AttachmentStateChange> attachments,
    String? cluster,
  }) async {
    ArgumentError.checkNotNull(attachments, 'attachments');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.SubmitAttachmentStateChanges'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attachments': attachments,
        if (cluster != null) 'cluster': cluster,
      },
    );

    return SubmitAttachmentStateChangesResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  /// </note>
  /// Sent to acknowledge that a container changed states.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cluster] :
  /// The short name or full ARN of the cluster that hosts the container.
  ///
  /// Parameter [containerName] :
  /// The name of the container.
  ///
  /// Parameter [exitCode] :
  /// The exit code returned for the state change request.
  ///
  /// Parameter [networkBindings] :
  /// The network bindings of the container.
  ///
  /// Parameter [reason] :
  /// The reason for the state change request.
  ///
  /// Parameter [runtimeId] :
  /// The ID of the Docker container.
  ///
  /// Parameter [status] :
  /// The status of the state change request.
  ///
  /// Parameter [task] :
  /// The task ID or full Amazon Resource Name (ARN) of the task that hosts the
  /// container.
  Future<SubmitContainerStateChangeResponse> submitContainerStateChange({
    String? cluster,
    String? containerName,
    int? exitCode,
    List<NetworkBinding>? networkBindings,
    String? reason,
    String? runtimeId,
    String? status,
    String? task,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.SubmitContainerStateChange'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (cluster != null) 'cluster': cluster,
        if (containerName != null) 'containerName': containerName,
        if (exitCode != null) 'exitCode': exitCode,
        if (networkBindings != null) 'networkBindings': networkBindings,
        if (reason != null) 'reason': reason,
        if (runtimeId != null) 'runtimeId': runtimeId,
        if (status != null) 'status': status,
        if (task != null) 'task': task,
      },
    );

    return SubmitContainerStateChangeResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This action is only used by the Amazon ECS agent, and it is not intended
  /// for use outside of the agent.
  /// </note>
  /// Sent to acknowledge that a task changed states.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attachments] :
  /// Any attachments associated with the state change request.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the task.
  ///
  /// Parameter [containers] :
  /// Any containers associated with the state change request.
  ///
  /// Parameter [executionStoppedAt] :
  /// The Unix timestamp for when the task execution stopped.
  ///
  /// Parameter [managedAgents] :
  /// The details for the managed agent associated with the task.
  ///
  /// Parameter [pullStartedAt] :
  /// The Unix timestamp for when the container image pull began.
  ///
  /// Parameter [pullStoppedAt] :
  /// The Unix timestamp for when the container image pull completed.
  ///
  /// Parameter [reason] :
  /// The reason for the state change request.
  ///
  /// Parameter [status] :
  /// The status of the state change request.
  ///
  /// Parameter [task] :
  /// The task ID or full ARN of the task in the state change request.
  Future<SubmitTaskStateChangeResponse> submitTaskStateChange({
    List<AttachmentStateChange>? attachments,
    String? cluster,
    List<ContainerStateChange>? containers,
    DateTime? executionStoppedAt,
    List<ManagedAgentStateChange>? managedAgents,
    DateTime? pullStartedAt,
    DateTime? pullStoppedAt,
    String? reason,
    String? status,
    String? task,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.SubmitTaskStateChange'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attachments != null) 'attachments': attachments,
        if (cluster != null) 'cluster': cluster,
        if (containers != null) 'containers': containers,
        if (executionStoppedAt != null)
          'executionStoppedAt': unixTimestampToJson(executionStoppedAt),
        if (managedAgents != null) 'managedAgents': managedAgents,
        if (pullStartedAt != null)
          'pullStartedAt': unixTimestampToJson(pullStartedAt),
        if (pullStoppedAt != null)
          'pullStoppedAt': unixTimestampToJson(pullStoppedAt),
        if (reason != null) 'reason': reason,
        if (status != null) 'status': status,
        if (task != null) 'task': task,
      },
    );

    return SubmitTaskStateChangeResponse.fromJson(jsonResponse.body);
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they are not changed. When a resource is
  /// deleted, the tags associated with that resource are deleted as well.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to add tags.
  /// Currently, the supported resources are Amazon ECS capacity providers,
  /// tasks, services, task definitions, clusters, and container instances.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is
  /// reserved for AWS use. You cannot edit or delete tag keys or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to delete tags.
  /// Currently, the supported resources are Amazon ECS capacity providers,
  /// tasks, services, task definitions, clusters, and container instances.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Modifies the parameters for a capacity provider.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [autoScalingGroupProvider] :
  /// An object representing the parameters to update for the Auto Scaling group
  /// capacity provider.
  ///
  /// Parameter [name] :
  /// The name of the capacity provider to update.
  Future<UpdateCapacityProviderResponse> updateCapacityProvider({
    required AutoScalingGroupProviderUpdate autoScalingGroupProvider,
    required String name,
  }) async {
    ArgumentError.checkNotNull(
        autoScalingGroupProvider, 'autoScalingGroupProvider');
    ArgumentError.checkNotNull(name, 'name');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.UpdateCapacityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'autoScalingGroupProvider': autoScalingGroupProvider,
        'name': name,
      },
    );

    return UpdateCapacityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Updates the cluster.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [cluster] :
  /// The name of the cluster to modify the settings for.
  ///
  /// Parameter [configuration] :
  /// The execute command configuration for the cluster.
  ///
  /// Parameter [settings] :
  /// The cluster settings for your cluster.
  Future<UpdateClusterResponse> updateCluster({
    required String cluster,
    ClusterConfiguration? configuration,
    List<ClusterSetting>? settings,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        if (configuration != null) 'configuration': configuration,
        if (settings != null) 'settings': settings,
      },
    );

    return UpdateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the settings to use for a cluster.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [cluster] :
  /// The name of the cluster to modify the settings for.
  ///
  /// Parameter [settings] :
  /// The setting to use by default for a cluster. This parameter is used to
  /// enable CloudWatch Container Insights for a cluster. If this value is
  /// specified, it will override the <code>containerInsights</code> value set
  /// with <a>PutAccountSetting</a> or <a>PutAccountSettingDefault</a>.
  Future<UpdateClusterSettingsResponse> updateClusterSettings({
    required String cluster,
    required List<ClusterSetting> settings,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(settings, 'settings');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateClusterSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'settings': settings,
      },
    );

    return UpdateClusterSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Updates the Amazon ECS container agent on a specified container instance.
  /// Updating the Amazon ECS container agent does not interrupt running tasks
  /// or services on the container instance. The process for updating the agent
  /// differs depending on whether your container instance was launched with the
  /// Amazon ECS-optimized AMI or another operating system.
  /// <note>
  /// The <code>UpdateContainerAgent</code> API isn't supported for container
  /// instances using the Amazon ECS-optimized Amazon Linux 2 (arm64) AMI. To
  /// update the container agent, you can update the <code>ecs-init</code>
  /// package which will update the agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/agent-update-ecs-ami.html">Updating
  /// the Amazon ECS container agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  /// The <code>UpdateContainerAgent</code> API requires an Amazon ECS-optimized
  /// AMI or Amazon Linux AMI with the <code>ecs-init</code> service installed
  /// and running. For help updating the Amazon ECS container agent on other
  /// operating systems, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html#manually_update_agent">Manually
  /// updating the Amazon ECS container agent</a> in the <i>Amazon Elastic
  /// Container Service Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UpdateInProgressException].
  /// May throw [NoUpdateAvailableException].
  /// May throw [MissingVersionException].
  ///
  /// Parameter [containerInstance] :
  /// The container instance ID or full ARN entries for the container instance
  /// on which you would like to update the Amazon ECS container agent.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that your
  /// container instance is running on. If you do not specify a cluster, the
  /// default cluster is assumed.
  Future<UpdateContainerAgentResponse> updateContainerAgent({
    required String containerInstance,
    String? cluster,
  }) async {
    ArgumentError.checkNotNull(containerInstance, 'containerInstance');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateContainerAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerInstance': containerInstance,
        if (cluster != null) 'cluster': cluster,
      },
    );

    return UpdateContainerAgentResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the status of an Amazon ECS container instance.
  ///
  /// Once a container instance has reached an <code>ACTIVE</code> state, you
  /// can change the status of a container instance to <code>DRAINING</code> to
  /// manually remove an instance from a cluster, for example to perform system
  /// updates, update the Docker daemon, or scale down the cluster size.
  /// <important>
  /// A container instance cannot be changed to <code>DRAINING</code> until it
  /// has reached an <code>ACTIVE</code> status. If the instance is in any other
  /// status, an error will be received.
  /// </important>
  /// When you set a container instance to <code>DRAINING</code>, Amazon ECS
  /// prevents new tasks from being scheduled for placement on the container
  /// instance and replacement service tasks are started on other container
  /// instances in the cluster if the resources are available. Service tasks on
  /// the container instance that are in the <code>PENDING</code> state are
  /// stopped immediately.
  ///
  /// Service tasks on the container instance that are in the
  /// <code>RUNNING</code> state are stopped and replaced according to the
  /// service's deployment configuration parameters,
  /// <code>minimumHealthyPercent</code> and <code>maximumPercent</code>. You
  /// can change the deployment configuration of your service using
  /// <a>UpdateService</a>.
  ///
  /// <ul>
  /// <li>
  /// If <code>minimumHealthyPercent</code> is below 100%, the scheduler can
  /// ignore <code>desiredCount</code> temporarily during task replacement. For
  /// example, <code>desiredCount</code> is four tasks, a minimum of 50% allows
  /// the scheduler to stop two existing tasks before starting two new tasks. If
  /// the minimum is 100%, the service scheduler can't remove existing tasks
  /// until the replacement tasks are considered healthy. Tasks for services
  /// that do not use a load balancer are considered healthy if they are in the
  /// <code>RUNNING</code> state. Tasks for services that use a load balancer
  /// are considered healthy if they are in the <code>RUNNING</code> state and
  /// the container instance they are hosted on is reported as healthy by the
  /// load balancer.
  /// </li>
  /// <li>
  /// The <code>maximumPercent</code> parameter represents an upper limit on the
  /// number of running tasks during task replacement, which enables you to
  /// define the replacement batch size. For example, if
  /// <code>desiredCount</code> is four tasks, a maximum of 200% starts four new
  /// tasks before stopping the four tasks to be drained, provided that the
  /// cluster resources required to do this are available. If the maximum is
  /// 100%, then replacement tasks can't start until the draining tasks have
  /// stopped.
  /// </li>
  /// </ul>
  /// Any <code>PENDING</code> or <code>RUNNING</code> tasks that do not belong
  /// to a service are not affected. You must wait for them to finish or stop
  /// them manually.
  ///
  /// A container instance has completed draining when it has no more
  /// <code>RUNNING</code> tasks. You can verify this using <a>ListTasks</a>.
  ///
  /// When a container instance has been drained, you can set a container
  /// instance to <code>ACTIVE</code> status and once it has reached that status
  /// the Amazon ECS scheduler can begin scheduling tasks on the instance again.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  ///
  /// Parameter [containerInstances] :
  /// A list of container instance IDs or full ARN entries.
  ///
  /// Parameter [status] :
  /// The container instance state with which to update the container instance.
  /// The only valid values for this action are <code>ACTIVE</code> and
  /// <code>DRAINING</code>. A container instance can only be updated to
  /// <code>DRAINING</code> status once it has reached an <code>ACTIVE</code>
  /// state. If a container instance is in <code>REGISTERING</code>,
  /// <code>DEREGISTERING</code>, or <code>REGISTRATION_FAILED</code> state you
  /// can describe the container instance but will be unable to update the
  /// container instance state.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the container instance to update. If you do not specify a cluster,
  /// the default cluster is assumed.
  Future<UpdateContainerInstancesStateResponse> updateContainerInstancesState({
    required List<String> containerInstances,
    required ContainerInstanceStatus status,
    String? cluster,
  }) async {
    ArgumentError.checkNotNull(containerInstances, 'containerInstances');
    ArgumentError.checkNotNull(status, 'status');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.UpdateContainerInstancesState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerInstances': containerInstances,
        'status': status.toValue(),
        if (cluster != null) 'cluster': cluster,
      },
    );

    return UpdateContainerInstancesStateResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// Updating the task placement strategies and constraints on an Amazon ECS
  /// service remains in preview and is a Beta Service as defined by and subject
  /// to the Beta Service Participation Service Terms located at <a
  /// href="https://aws.amazon.com/service-terms">https://aws.amazon.com/service-terms</a>
  /// ("Beta Terms"). These Beta Terms apply to your participation in this
  /// preview.
  /// </important>
  /// Modifies the parameters of a service.
  ///
  /// For services using the rolling update (<code>ECS</code>) deployment
  /// controller, the desired count, deployment configuration, network
  /// configuration, task placement constraints and strategies, or task
  /// definition used can be updated.
  ///
  /// For services using the blue/green (<code>CODE_DEPLOY</code>) deployment
  /// controller, only the desired count, deployment configuration, task
  /// placement constraints and strategies, and health check grace period can be
  /// updated using this API. If the network configuration, platform version, or
  /// task definition need to be updated, a new AWS CodeDeploy deployment should
  /// be created. For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html">CreateDeployment</a>
  /// in the <i>AWS CodeDeploy API Reference</i>.
  ///
  /// For services using an external deployment controller, you can update only
  /// the desired count, task placement constraints and strategies, and health
  /// check grace period using this API. If the launch type, load balancer,
  /// network configuration, platform version, or task definition need to be
  /// updated, you should create a new task set. For more information, see
  /// <a>CreateTaskSet</a>.
  ///
  /// You can add to or subtract from the number of instantiations of a task
  /// definition in a service by specifying the cluster that the service is
  /// running in and a new <code>desiredCount</code> parameter.
  ///
  /// If you have updated the Docker image of your application, you can create a
  /// new task definition with that image and deploy it to your service. The
  /// service scheduler uses the minimum healthy percent and maximum percent
  /// parameters (in the service's deployment configuration) to determine the
  /// deployment strategy.
  /// <note>
  /// If your updated Docker image uses the same tag as what is in the existing
  /// task definition for your service (for example,
  /// <code>my_image:latest</code>), you do not need to create a new revision of
  /// your task definition. You can update the service using the
  /// <code>forceNewDeployment</code> option. The new tasks launched by the
  /// deployment pull the current image/tag combination from your repository
  /// when they start.
  /// </note>
  /// You can also update the deployment configuration of a service. When a
  /// deployment is triggered by updating the task definition of a service, the
  /// service scheduler uses the deployment configuration parameters,
  /// <code>minimumHealthyPercent</code> and <code>maximumPercent</code>, to
  /// determine the deployment strategy.
  ///
  /// <ul>
  /// <li>
  /// If <code>minimumHealthyPercent</code> is below 100%, the scheduler can
  /// ignore <code>desiredCount</code> temporarily during a deployment. For
  /// example, if <code>desiredCount</code> is four tasks, a minimum of 50%
  /// allows the scheduler to stop two existing tasks before starting two new
  /// tasks. Tasks for services that do not use a load balancer are considered
  /// healthy if they are in the <code>RUNNING</code> state. Tasks for services
  /// that use a load balancer are considered healthy if they are in the
  /// <code>RUNNING</code> state and the container instance they are hosted on
  /// is reported as healthy by the load balancer.
  /// </li>
  /// <li>
  /// The <code>maximumPercent</code> parameter represents an upper limit on the
  /// number of running tasks during a deployment, which enables you to define
  /// the deployment batch size. For example, if <code>desiredCount</code> is
  /// four tasks, a maximum of 200% starts four new tasks before stopping the
  /// four older tasks (provided that the cluster resources required to do this
  /// are available).
  /// </li>
  /// </ul>
  /// When <a>UpdateService</a> stops a task during a deployment, the equivalent
  /// of <code>docker stop</code> is issued to the containers running in the
  /// task. This results in a <code>SIGTERM</code> and a 30-second timeout,
  /// after which <code>SIGKILL</code> is sent and the containers are forcibly
  /// stopped. If the container handles the <code>SIGTERM</code> gracefully and
  /// exits within 30 seconds from receiving it, no <code>SIGKILL</code> is
  /// sent.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement in your cluster with the following logic:
  ///
  /// <ul>
  /// <li>
  /// Determine which of the container instances in your cluster can support
  /// your service's task definition (for example, they have the required CPU,
  /// memory, ports, and container instance attributes).
  /// </li>
  /// <li>
  /// By default, the service scheduler attempts to balance tasks across
  /// Availability Zones in this manner (although you can choose a different
  /// placement strategy):
  ///
  /// <ul>
  /// <li>
  /// Sort the valid container instances by the fewest number of running tasks
  /// for this service in the same Availability Zone as the instance. For
  /// example, if zone A has one running service task and zones B and C each
  /// have zero, valid container instances in either zone B or C are considered
  /// optimal for placement.
  /// </li>
  /// <li>
  /// Place the new service task on a valid container instance in an optimal
  /// Availability Zone (based on the previous steps), favoring container
  /// instances with the fewest number of running tasks for this service.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// When the service scheduler stops running tasks, it attempts to maintain
  /// balance across the Availability Zones in your cluster using the following
  /// logic:
  ///
  /// <ul>
  /// <li>
  /// Sort the container instances by the largest number of running tasks for
  /// this service in the same Availability Zone as the instance. For example,
  /// if zone A has one running service task and zones B and C each have two,
  /// container instances in either zone B or C are considered optimal for
  /// termination.
  /// </li>
  /// <li>
  /// Stop the task on a container instance in an optimal Availability Zone
  /// (based on the previous steps), favoring container instances with the
  /// largest number of running tasks for this service.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  /// May throw [PlatformUnknownException].
  /// May throw [PlatformTaskDefinitionIncompatibilityException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [service] :
  /// The name of the service to update.
  ///
  /// Parameter [capacityProviderStrategy] :
  /// The capacity provider strategy to update the service to use.
  ///
  /// If the service is using the default capacity provider strategy for the
  /// cluster, the service can be updated to use one or more capacity providers
  /// as opposed to the default capacity provider strategy. However, when a
  /// service is using a capacity provider strategy that is not the default
  /// capacity provider strategy, the service cannot be updated to use the
  /// cluster's default capacity provider strategy.
  ///
  /// A capacity provider strategy consists of one or more capacity providers
  /// along with the <code>base</code> and <code>weight</code> to assign to
  /// them. A capacity provider must be associated with the cluster to be used
  /// in a capacity provider strategy. The <a>PutClusterCapacityProviders</a>
  /// API is used to associate a capacity provider with a cluster. Only capacity
  /// providers with an <code>ACTIVE</code> or <code>UPDATING</code> status can
  /// be used.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must already be created. New capacity providers can be
  /// created with the <a>CreateCapacityProvider</a> API operation.
  ///
  /// To use a AWS Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// AWS Fargate capacity providers are available to all accounts and only need
  /// to be associated with a cluster to be used.
  ///
  /// The <a>PutClusterCapacityProviders</a> API operation is used to update the
  /// list of available capacity providers for a cluster after the cluster is
  /// created.
  /// <p/>
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that your
  /// service is running on. If you do not specify a cluster, the default
  /// cluster is assumed.
  ///
  /// Parameter [deploymentConfiguration] :
  /// Optional deployment parameters that control how many tasks run during the
  /// deployment and the ordering of stopping and starting tasks.
  ///
  /// Parameter [desiredCount] :
  /// The number of instantiations of the task to place and keep running in your
  /// service.
  ///
  /// Parameter [enableExecuteCommand] :
  /// If <code>true</code>, this enables execute command functionality on all
  /// task containers.
  ///
  /// If you do not want to override the value that was set when the service was
  /// created, you can set this to <code>null</code> when performing this
  /// action.
  ///
  /// Parameter [forceNewDeployment] :
  /// Whether to force a new deployment of the service. Deployments are not
  /// forced by default. You can use this option to trigger a new deployment
  /// with no service definition changes. For example, you can update a
  /// service's tasks to use a newer Docker image with the same image/tag
  /// combination (<code>my_image:latest</code>) or to roll Fargate tasks onto a
  /// newer platform version.
  ///
  /// Parameter [healthCheckGracePeriodSeconds] :
  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// should ignore unhealthy Elastic Load Balancing target health checks after
  /// a task has first started. This is only valid if your service is configured
  /// to use a load balancer. If your service's tasks take a while to start and
  /// respond to Elastic Load Balancing health checks, you can specify a health
  /// check grace period of up to 2,147,483,647 seconds. During that time, the
  /// Amazon ECS service scheduler ignores the Elastic Load Balancing health
  /// check status. This grace period can prevent the ECS service scheduler from
  /// marking tasks as unhealthy and stopping them before they have time to come
  /// up.
  ///
  /// Parameter [networkConfiguration] :
  /// An object representing the network configuration for the service.
  ///
  /// Parameter [placementConstraints] :
  /// An array of task placement constraint objects to update the service to
  /// use. If no value is specified, the existing placement constraints for the
  /// service will remain unchanged. If this value is specified, it will
  /// override any existing placement constraints defined for the service. To
  /// remove all existing placement constraints, specify an empty array.
  ///
  /// You can specify a maximum of 10 constraints per task (this limit includes
  /// constraints in the task definition and those specified at runtime).
  ///
  /// Parameter [placementStrategy] :
  /// The task placement strategy objects to update the service to use. If no
  /// value is specified, the existing placement strategy for the service will
  /// remain unchanged. If this value is specified, it will override the
  /// existing placement strategy defined for the service. To remove an existing
  /// placement strategy, specify an empty object.
  ///
  /// You can specify a maximum of five strategy rules per service.
  ///
  /// Parameter [platformVersion] :
  /// The platform version on which your tasks in the service are running. A
  /// platform version is only specified for tasks using the Fargate launch
  /// type. If a platform version is not specified, the <code>LATEST</code>
  /// platform version is used by default. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run
  /// in your service. If a <code>revision</code> is not specified, the latest
  /// <code>ACTIVE</code> revision is used. If you modify the task definition
  /// with <code>UpdateService</code>, Amazon ECS spawns a task with the new
  /// version of the task definition and then stops an old task after the new
  /// version is running.
  Future<UpdateServiceResponse> updateService({
    required String service,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? cluster,
    DeploymentConfiguration? deploymentConfiguration,
    int? desiredCount,
    bool? enableExecuteCommand,
    bool? forceNewDeployment,
    int? healthCheckGracePeriodSeconds,
    NetworkConfiguration? networkConfiguration,
    List<PlacementConstraint>? placementConstraints,
    List<PlacementStrategy>? placementStrategy,
    String? platformVersion,
    String? taskDefinition,
  }) async {
    ArgumentError.checkNotNull(service, 'service');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'service': service,
        if (capacityProviderStrategy != null)
          'capacityProviderStrategy': capacityProviderStrategy,
        if (cluster != null) 'cluster': cluster,
        if (deploymentConfiguration != null)
          'deploymentConfiguration': deploymentConfiguration,
        if (desiredCount != null) 'desiredCount': desiredCount,
        if (enableExecuteCommand != null)
          'enableExecuteCommand': enableExecuteCommand,
        if (forceNewDeployment != null)
          'forceNewDeployment': forceNewDeployment,
        if (healthCheckGracePeriodSeconds != null)
          'healthCheckGracePeriodSeconds': healthCheckGracePeriodSeconds,
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (placementConstraints != null)
          'placementConstraints': placementConstraints,
        if (placementStrategy != null) 'placementStrategy': placementStrategy,
        if (platformVersion != null) 'platformVersion': platformVersion,
        if (taskDefinition != null) 'taskDefinition': taskDefinition,
      },
    );

    return UpdateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Modifies which task set in a service is the primary task set. Any
  /// parameters that are updated on the primary task set in a service will
  /// transition to the service. This is used when a service uses the
  /// <code>EXTERNAL</code> deployment controller type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  /// May throw [TaskSetNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task set exists in.
  ///
  /// Parameter [primaryTaskSet] :
  /// The short name or full Amazon Resource Name (ARN) of the task set to set
  /// as the primary task set in the deployment.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service that the
  /// task set exists in.
  Future<UpdateServicePrimaryTaskSetResponse> updateServicePrimaryTaskSet({
    required String cluster,
    required String primaryTaskSet,
    required String service,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(primaryTaskSet, 'primaryTaskSet');
    ArgumentError.checkNotNull(service, 'service');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.UpdateServicePrimaryTaskSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'primaryTaskSet': primaryTaskSet,
        'service': service,
      },
    );

    return UpdateServicePrimaryTaskSetResponse.fromJson(jsonResponse.body);
  }

  /// Modifies a task set. This is used when a service uses the
  /// <code>EXTERNAL</code> deployment controller type. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceNotFoundException].
  /// May throw [ServiceNotActiveException].
  /// May throw [TaskSetNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task set exists in.
  ///
  /// Parameter [scale] :
  /// A floating-point percentage of the desired number of tasks to place and
  /// keep running in the task set.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service that the
  /// task set exists in.
  ///
  /// Parameter [taskSet] :
  /// The short name or full Amazon Resource Name (ARN) of the task set to
  /// update.
  Future<UpdateTaskSetResponse> updateTaskSet({
    required String cluster,
    required Scale scale,
    required String service,
    required String taskSet,
  }) async {
    ArgumentError.checkNotNull(cluster, 'cluster');
    ArgumentError.checkNotNull(scale, 'scale');
    ArgumentError.checkNotNull(service, 'service');
    ArgumentError.checkNotNull(taskSet, 'taskSet');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateTaskSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'scale': scale,
        'service': service,
        'taskSet': taskSet,
      },
    );

    return UpdateTaskSetResponse.fromJson(jsonResponse.body);
  }
}

enum AgentUpdateStatus {
  pending,
  staging,
  staged,
  updating,
  updated,
  failed,
}

extension on AgentUpdateStatus {
  String toValue() {
    switch (this) {
      case AgentUpdateStatus.pending:
        return 'PENDING';
      case AgentUpdateStatus.staging:
        return 'STAGING';
      case AgentUpdateStatus.staged:
        return 'STAGED';
      case AgentUpdateStatus.updating:
        return 'UPDATING';
      case AgentUpdateStatus.updated:
        return 'UPDATED';
      case AgentUpdateStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  AgentUpdateStatus toAgentUpdateStatus() {
    switch (this) {
      case 'PENDING':
        return AgentUpdateStatus.pending;
      case 'STAGING':
        return AgentUpdateStatus.staging;
      case 'STAGED':
        return AgentUpdateStatus.staged;
      case 'UPDATING':
        return AgentUpdateStatus.updating;
      case 'UPDATED':
        return AgentUpdateStatus.updated;
      case 'FAILED':
        return AgentUpdateStatus.failed;
    }
    throw Exception('$this is not known in enum AgentUpdateStatus');
  }
}

enum AssignPublicIp {
  enabled,
  disabled,
}

extension on AssignPublicIp {
  String toValue() {
    switch (this) {
      case AssignPublicIp.enabled:
        return 'ENABLED';
      case AssignPublicIp.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  AssignPublicIp toAssignPublicIp() {
    switch (this) {
      case 'ENABLED':
        return AssignPublicIp.enabled;
      case 'DISABLED':
        return AssignPublicIp.disabled;
    }
    throw Exception('$this is not known in enum AssignPublicIp');
  }
}

/// An object representing a container instance or task attachment.
class Attachment {
  /// Details of the attachment. For elastic network interfaces, this includes the
  /// network interface ID, the MAC address, the subnet ID, and the private IPv4
  /// address.
  final List<KeyValuePair>? details;

  /// The unique identifier for the attachment.
  final String? id;

  /// The status of the attachment. Valid values are <code>PRECREATED</code>,
  /// <code>CREATED</code>, <code>ATTACHING</code>, <code>ATTACHED</code>,
  /// <code>DETACHING</code>, <code>DETACHED</code>, and <code>DELETED</code>.
  final String? status;

  /// The type of the attachment, such as <code>ElasticNetworkInterface</code>.
  final String? type;

  Attachment({
    this.details,
    this.id,
    this.status,
    this.type,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      details: (json['details'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (type != null) 'type': type,
    };
  }
}

/// An object representing a change in state for a task attachment.
class AttachmentStateChange {
  /// The Amazon Resource Name (ARN) of the attachment.
  final String attachmentArn;

  /// The status of the attachment.
  final String status;

  AttachmentStateChange({
    required this.attachmentArn,
    required this.status,
  });

  factory AttachmentStateChange.fromJson(Map<String, dynamic> json) {
    return AttachmentStateChange(
      attachmentArn: json['attachmentArn'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentArn = this.attachmentArn;
    final status = this.status;
    return {
      'attachmentArn': attachmentArn,
      'status': status,
    };
  }
}

/// An attribute is a name-value pair associated with an Amazon ECS object.
/// Attributes enable you to extend the Amazon ECS data model by adding custom
/// metadata to your resources. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes">Attributes</a>
/// in the <i>Amazon Elastic Container Service Developer Guide</i>.
class Attribute {
  /// The name of the attribute. The <code>name</code> must contain between 1 and
  /// 128 characters and name may contain letters (uppercase and lowercase),
  /// numbers, hyphens, underscores, forward slashes, back slashes, or periods.
  final String name;

  /// The ID of the target. You can specify the short form ID for a resource or
  /// the full Amazon Resource Name (ARN).
  final String? targetId;

  /// The type of the target with which to attach the attribute. This parameter is
  /// required if you use the short form ID for a resource instead of the full
  /// ARN.
  final TargetType? targetType;

  /// The value of the attribute. The <code>value</code> must contain between 1
  /// and 128 characters and may contain letters (uppercase and lowercase),
  /// numbers, hyphens, underscores, periods, at signs (@), forward slashes, back
  /// slashes, colons, or spaces. The value cannot contain any leading or trailing
  /// whitespace.
  final String? value;

  Attribute({
    required this.name,
    this.targetId,
    this.targetType,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      name: json['name'] as String,
      targetId: json['targetId'] as String?,
      targetType: (json['targetType'] as String?)?.toTargetType(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final targetId = this.targetId;
    final targetType = this.targetType;
    final value = this.value;
    return {
      'name': name,
      if (targetId != null) 'targetId': targetId,
      if (targetType != null) 'targetType': targetType.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// The details of the Auto Scaling group for the capacity provider.
class AutoScalingGroupProvider {
  /// The Amazon Resource Name (ARN) that identifies the Auto Scaling group.
  final String autoScalingGroupArn;

  /// The managed scaling settings for the Auto Scaling group capacity provider.
  final ManagedScaling? managedScaling;

  /// The managed termination protection setting to use for the Auto Scaling group
  /// capacity provider. This determines whether the Auto Scaling group has
  /// managed termination protection.
  /// <important>
  /// When using managed termination protection, managed scaling must also be used
  /// otherwise managed termination protection will not work.
  /// </important>
  /// When managed termination protection is enabled, Amazon ECS prevents the
  /// Amazon EC2 instances in an Auto Scaling group that contain tasks from being
  /// terminated during a scale-in action. The Auto Scaling group and each
  /// instance in the Auto Scaling group must have instance protection from
  /// scale-in actions enabled as well. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// Protection</a> in the <i>AWS Auto Scaling User Guide</i>.
  ///
  /// When managed termination protection is disabled, your Amazon EC2 instances
  /// are not protected from termination when the Auto Scaling group scales in.
  final ManagedTerminationProtection? managedTerminationProtection;

  AutoScalingGroupProvider({
    required this.autoScalingGroupArn,
    this.managedScaling,
    this.managedTerminationProtection,
  });

  factory AutoScalingGroupProvider.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupProvider(
      autoScalingGroupArn: json['autoScalingGroupArn'] as String,
      managedScaling: json['managedScaling'] != null
          ? ManagedScaling.fromJson(
              json['managedScaling'] as Map<String, dynamic>)
          : null,
      managedTerminationProtection:
          (json['managedTerminationProtection'] as String?)
              ?.toManagedTerminationProtection(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroupArn = this.autoScalingGroupArn;
    final managedScaling = this.managedScaling;
    final managedTerminationProtection = this.managedTerminationProtection;
    return {
      'autoScalingGroupArn': autoScalingGroupArn,
      if (managedScaling != null) 'managedScaling': managedScaling,
      if (managedTerminationProtection != null)
        'managedTerminationProtection': managedTerminationProtection.toValue(),
    };
  }
}

/// The details of the Auto Scaling group capacity provider to update.
class AutoScalingGroupProviderUpdate {
  /// The managed scaling settings for the Auto Scaling group capacity provider.
  final ManagedScaling? managedScaling;

  /// The managed termination protection setting to use for the Auto Scaling group
  /// capacity provider. This determines whether the Auto Scaling group has
  /// managed termination protection.
  /// <important>
  /// When using managed termination protection, managed scaling must also be used
  /// otherwise managed termination protection will not work.
  /// </important>
  /// When managed termination protection is enabled, Amazon ECS prevents the
  /// Amazon EC2 instances in an Auto Scaling group that contain tasks from being
  /// terminated during a scale-in action. The Auto Scaling group and each
  /// instance in the Auto Scaling group must have instance protection from
  /// scale-in actions enabled as well. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// Protection</a> in the <i>AWS Auto Scaling User Guide</i>.
  ///
  /// When managed termination protection is disabled, your Amazon EC2 instances
  /// are not protected from termination when the Auto Scaling group scales in.
  final ManagedTerminationProtection? managedTerminationProtection;

  AutoScalingGroupProviderUpdate({
    this.managedScaling,
    this.managedTerminationProtection,
  });

  factory AutoScalingGroupProviderUpdate.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupProviderUpdate(
      managedScaling: json['managedScaling'] != null
          ? ManagedScaling.fromJson(
              json['managedScaling'] as Map<String, dynamic>)
          : null,
      managedTerminationProtection:
          (json['managedTerminationProtection'] as String?)
              ?.toManagedTerminationProtection(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedScaling = this.managedScaling;
    final managedTerminationProtection = this.managedTerminationProtection;
    return {
      if (managedScaling != null) 'managedScaling': managedScaling,
      if (managedTerminationProtection != null)
        'managedTerminationProtection': managedTerminationProtection.toValue(),
    };
  }
}

/// An object representing the networking details for a task or service.
class AwsVpcConfiguration {
  /// The IDs of the subnets associated with the task or service. There is a limit
  /// of 16 subnets that can be specified per <code>AwsVpcConfiguration</code>.
  /// <note>
  /// All specified subnets must be from the same VPC.
  /// </note>
  final List<String> subnets;

  /// Whether the task's elastic network interface receives a public IP address.
  /// The default value is <code>DISABLED</code>.
  final AssignPublicIp? assignPublicIp;

  /// The IDs of the security groups associated with the task or service. If you
  /// do not specify a security group, the default security group for the VPC is
  /// used. There is a limit of 5 security groups that can be specified per
  /// <code>AwsVpcConfiguration</code>.
  /// <note>
  /// All specified security groups must be from the same VPC.
  /// </note>
  final List<String>? securityGroups;

  AwsVpcConfiguration({
    required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });

  factory AwsVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return AwsVpcConfiguration(
      subnets: (json['subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignPublicIp: (json['assignPublicIp'] as String?)?.toAssignPublicIp(),
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    return {
      'subnets': subnets,
      if (assignPublicIp != null) 'assignPublicIp': assignPublicIp.toValue(),
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

/// The details of a capacity provider.
class CapacityProvider {
  /// The Auto Scaling group settings for the capacity provider.
  final AutoScalingGroupProvider? autoScalingGroupProvider;

  /// The Amazon Resource Name (ARN) that identifies the capacity provider.
  final String? capacityProviderArn;

  /// The name of the capacity provider.
  final String? name;

  /// The current status of the capacity provider. Only capacity providers in an
  /// <code>ACTIVE</code> state can be used in a cluster. When a capacity provider
  /// is successfully deleted, it will have an <code>INACTIVE</code> status.
  final CapacityProviderStatus? status;

  /// The metadata that you apply to the capacity provider to help you categorize
  /// and organize it. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The update status of the capacity provider. The following are the possible
  /// states that will be returned.
  /// <dl> <dt>DELETE_IN_PROGRESS</dt> <dd>
  /// The capacity provider is in the process of being deleted.
  /// </dd> <dt>DELETE_COMPLETE</dt> <dd>
  /// The capacity provider has been successfully deleted and will have an
  /// <code>INACTIVE</code> status.
  /// </dd> <dt>DELETE_FAILED</dt> <dd>
  /// The capacity provider was unable to be deleted. The update status reason
  /// will provide further details about why the delete failed.
  /// </dd> </dl>
  final CapacityProviderUpdateStatus? updateStatus;

  /// The update status reason. This provides further details about the update
  /// status for the capacity provider.
  final String? updateStatusReason;

  CapacityProvider({
    this.autoScalingGroupProvider,
    this.capacityProviderArn,
    this.name,
    this.status,
    this.tags,
    this.updateStatus,
    this.updateStatusReason,
  });

  factory CapacityProvider.fromJson(Map<String, dynamic> json) {
    return CapacityProvider(
      autoScalingGroupProvider: json['autoScalingGroupProvider'] != null
          ? AutoScalingGroupProvider.fromJson(
              json['autoScalingGroupProvider'] as Map<String, dynamic>)
          : null,
      capacityProviderArn: json['capacityProviderArn'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toCapacityProviderStatus(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateStatus:
          (json['updateStatus'] as String?)?.toCapacityProviderUpdateStatus(),
      updateStatusReason: json['updateStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroupProvider = this.autoScalingGroupProvider;
    final capacityProviderArn = this.capacityProviderArn;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    final updateStatus = this.updateStatus;
    final updateStatusReason = this.updateStatusReason;
    return {
      if (autoScalingGroupProvider != null)
        'autoScalingGroupProvider': autoScalingGroupProvider,
      if (capacityProviderArn != null)
        'capacityProviderArn': capacityProviderArn,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (updateStatus != null) 'updateStatus': updateStatus.toValue(),
      if (updateStatusReason != null) 'updateStatusReason': updateStatusReason,
    };
  }
}

enum CapacityProviderField {
  tags,
}

extension on CapacityProviderField {
  String toValue() {
    switch (this) {
      case CapacityProviderField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  CapacityProviderField toCapacityProviderField() {
    switch (this) {
      case 'TAGS':
        return CapacityProviderField.tags;
    }
    throw Exception('$this is not known in enum CapacityProviderField');
  }
}

enum CapacityProviderStatus {
  active,
  inactive,
}

extension on CapacityProviderStatus {
  String toValue() {
    switch (this) {
      case CapacityProviderStatus.active:
        return 'ACTIVE';
      case CapacityProviderStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
  CapacityProviderStatus toCapacityProviderStatus() {
    switch (this) {
      case 'ACTIVE':
        return CapacityProviderStatus.active;
      case 'INACTIVE':
        return CapacityProviderStatus.inactive;
    }
    throw Exception('$this is not known in enum CapacityProviderStatus');
  }
}

/// The details of a capacity provider strategy. A capacity provider strategy
/// can be set when using the <a>RunTask</a> or <a>CreateCluster</a> APIs or as
/// the default capacity provider strategy for a cluster with the
/// <a>CreateCluster</a> API.
///
/// Only capacity providers that are already associated with a cluster and have
/// an <code>ACTIVE</code> or <code>UPDATING</code> status can be used in a
/// capacity provider strategy. The <a>PutClusterCapacityProviders</a> API is
/// used to associate a capacity provider with a cluster.
///
/// If specifying a capacity provider that uses an Auto Scaling group, the
/// capacity provider must already be created. New Auto Scaling group capacity
/// providers can be created with the <a>CreateCapacityProvider</a> API
/// operation.
///
/// To use a AWS Fargate capacity provider, specify either the
/// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
/// AWS Fargate capacity providers are available to all accounts and only need
/// to be associated with a cluster to be used in a capacity provider strategy.
class CapacityProviderStrategyItem {
  /// The short name of the capacity provider.
  final String capacityProvider;

  /// The <i>base</i> value designates how many tasks, at a minimum, to run on the
  /// specified capacity provider. Only one capacity provider in a capacity
  /// provider strategy can have a <i>base</i> defined. If no value is specified,
  /// the default value of <code>0</code> is used.
  final int? base;

  /// The <i>weight</i> value designates the relative percentage of the total
  /// number of tasks launched that should use the specified capacity provider.
  /// The <code>weight</code> value is taken into consideration after the
  /// <code>base</code> value, if defined, is satisfied.
  ///
  /// If no <code>weight</code> value is specified, the default value of
  /// <code>0</code> is used. When multiple capacity providers are specified
  /// within a capacity provider strategy, at least one of the capacity providers
  /// must have a weight value greater than zero and any capacity providers with a
  /// weight of <code>0</code> will not be used to place tasks. If you specify
  /// multiple capacity providers in a strategy that all have a weight of
  /// <code>0</code>, any <code>RunTask</code> or <code>CreateService</code>
  /// actions using the capacity provider strategy will fail.
  ///
  /// An example scenario for using weights is defining a strategy that contains
  /// two capacity providers and both have a weight of <code>1</code>, then when
  /// the <code>base</code> is satisfied, the tasks will be split evenly across
  /// the two capacity providers. Using that same logic, if you specify a weight
  /// of <code>1</code> for <i>capacityProviderA</i> and a weight of
  /// <code>4</code> for <i>capacityProviderB</i>, then for every one task that is
  /// run using <i>capacityProviderA</i>, four tasks would use
  /// <i>capacityProviderB</i>.
  final int? weight;

  CapacityProviderStrategyItem({
    required this.capacityProvider,
    this.base,
    this.weight,
  });

  factory CapacityProviderStrategyItem.fromJson(Map<String, dynamic> json) {
    return CapacityProviderStrategyItem(
      capacityProvider: json['capacityProvider'] as String,
      base: json['base'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    final base = this.base;
    final weight = this.weight;
    return {
      'capacityProvider': capacityProvider,
      if (base != null) 'base': base,
      if (weight != null) 'weight': weight,
    };
  }
}

enum CapacityProviderUpdateStatus {
  deleteInProgress,
  deleteComplete,
  deleteFailed,
  updateInProgress,
  updateComplete,
  updateFailed,
}

extension on CapacityProviderUpdateStatus {
  String toValue() {
    switch (this) {
      case CapacityProviderUpdateStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case CapacityProviderUpdateStatus.deleteComplete:
        return 'DELETE_COMPLETE';
      case CapacityProviderUpdateStatus.deleteFailed:
        return 'DELETE_FAILED';
      case CapacityProviderUpdateStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case CapacityProviderUpdateStatus.updateComplete:
        return 'UPDATE_COMPLETE';
      case CapacityProviderUpdateStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  CapacityProviderUpdateStatus toCapacityProviderUpdateStatus() {
    switch (this) {
      case 'DELETE_IN_PROGRESS':
        return CapacityProviderUpdateStatus.deleteInProgress;
      case 'DELETE_COMPLETE':
        return CapacityProviderUpdateStatus.deleteComplete;
      case 'DELETE_FAILED':
        return CapacityProviderUpdateStatus.deleteFailed;
      case 'UPDATE_IN_PROGRESS':
        return CapacityProviderUpdateStatus.updateInProgress;
      case 'UPDATE_COMPLETE':
        return CapacityProviderUpdateStatus.updateComplete;
      case 'UPDATE_FAILED':
        return CapacityProviderUpdateStatus.updateFailed;
    }
    throw Exception('$this is not known in enum CapacityProviderUpdateStatus');
  }
}

/// A regional grouping of one or more container instances on which you can run
/// task requests. Each account receives a default cluster the first time you
/// use the Amazon ECS service, but you may also create other clusters. Clusters
/// may contain more than one instance type simultaneously.
class Cluster {
  /// The number of services that are running on the cluster in an
  /// <code>ACTIVE</code> state. You can view these services with
  /// <a>ListServices</a>.
  final int? activeServicesCount;

  /// The resources attached to a cluster. When using a capacity provider with a
  /// cluster, the Auto Scaling plan that is created will be returned as a cluster
  /// attachment.
  final List<Attachment>? attachments;

  /// The status of the capacity providers associated with the cluster. The
  /// following are the states that will be returned:
  /// <dl> <dt>UPDATE_IN_PROGRESS</dt> <dd>
  /// The available capacity providers for the cluster are updating. This occurs
  /// when the Auto Scaling plan is provisioning or deprovisioning.
  /// </dd> <dt>UPDATE_COMPLETE</dt> <dd>
  /// The capacity providers have successfully updated.
  /// </dd> <dt>UPDATE_FAILED</dt> <dd>
  /// The capacity provider updates failed.
  /// </dd> </dl>
  final String? attachmentsStatus;

  /// The capacity providers associated with the cluster.
  final List<String>? capacityProviders;

  /// The Amazon Resource Name (ARN) that identifies the cluster. The ARN contains
  /// the <code>arn:aws:ecs</code> namespace, followed by the Region of the
  /// cluster, the AWS account ID of the cluster owner, the <code>cluster</code>
  /// namespace, and then the cluster name. For example,
  /// <code>arn:aws:ecs:region:012345678910:cluster/test</code>.
  final String? clusterArn;

  /// A user-generated string that you use to identify your cluster.
  final String? clusterName;

  /// The execute command configuration for the cluster.
  final ClusterConfiguration? configuration;

  /// The default capacity provider strategy for the cluster. When services or
  /// tasks are run in the cluster with no launch type or capacity provider
  /// strategy specified, the default capacity provider strategy is used.
  final List<CapacityProviderStrategyItem>? defaultCapacityProviderStrategy;

  /// The number of tasks in the cluster that are in the <code>PENDING</code>
  /// state.
  final int? pendingTasksCount;

  /// The number of container instances registered into the cluster. This includes
  /// container instances in both <code>ACTIVE</code> and <code>DRAINING</code>
  /// status.
  final int? registeredContainerInstancesCount;

  /// The number of tasks in the cluster that are in the <code>RUNNING</code>
  /// state.
  final int? runningTasksCount;

  /// The settings for the cluster. This parameter indicates whether CloudWatch
  /// Container Insights is enabled or disabled for a cluster.
  final List<ClusterSetting>? settings;

  /// Additional information about your clusters that are separated by launch
  /// type, including:
  ///
  /// <ul>
  /// <li>
  /// runningEC2TasksCount
  /// </li>
  /// <li>
  /// RunningFargateTasksCount
  /// </li>
  /// <li>
  /// pendingEC2TasksCount
  /// </li>
  /// <li>
  /// pendingFargateTasksCount
  /// </li>
  /// <li>
  /// activeEC2ServiceCount
  /// </li>
  /// <li>
  /// activeFargateServiceCount
  /// </li>
  /// <li>
  /// drainingEC2ServiceCount
  /// </li>
  /// <li>
  /// drainingFargateServiceCount
  /// </li>
  /// </ul>
  final List<KeyValuePair>? statistics;

  /// The status of the cluster. The following are the possible states that will
  /// be returned.
  /// <dl> <dt>ACTIVE</dt> <dd>
  /// The cluster is ready to accept tasks and if applicable you can register
  /// container instances with the cluster.
  /// </dd> <dt>PROVISIONING</dt> <dd>
  /// The cluster has capacity providers associated with it and the resources
  /// needed for the capacity provider are being created.
  /// </dd> <dt>DEPROVISIONING</dt> <dd>
  /// The cluster has capacity providers associated with it and the resources
  /// needed for the capacity provider are being deleted.
  /// </dd> <dt>FAILED</dt> <dd>
  /// The cluster has capacity providers associated with it and the resources
  /// needed for the capacity provider have failed to create.
  /// </dd> <dt>INACTIVE</dt> <dd>
  /// The cluster has been deleted. Clusters with an <code>INACTIVE</code> status
  /// may remain discoverable in your account for a period of time. However, this
  /// behavior is subject to change in the future, so you should not rely on
  /// <code>INACTIVE</code> clusters persisting.
  /// </dd> </dl>
  final String? status;

  /// The metadata that you apply to the cluster to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  Cluster({
    this.activeServicesCount,
    this.attachments,
    this.attachmentsStatus,
    this.capacityProviders,
    this.clusterArn,
    this.clusterName,
    this.configuration,
    this.defaultCapacityProviderStrategy,
    this.pendingTasksCount,
    this.registeredContainerInstancesCount,
    this.runningTasksCount,
    this.settings,
    this.statistics,
    this.status,
    this.tags,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      activeServicesCount: json['activeServicesCount'] as int?,
      attachments: (json['attachments'] as List?)
          ?.whereNotNull()
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachmentsStatus: json['attachmentsStatus'] as String?,
      capacityProviders: (json['capacityProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      clusterArn: json['clusterArn'] as String?,
      clusterName: json['clusterName'] as String?,
      configuration: json['configuration'] != null
          ? ClusterConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      defaultCapacityProviderStrategy: (json['defaultCapacityProviderStrategy']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingTasksCount: json['pendingTasksCount'] as int?,
      registeredContainerInstancesCount:
          json['registeredContainerInstancesCount'] as int?,
      runningTasksCount: json['runningTasksCount'] as int?,
      settings: (json['settings'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistics: (json['statistics'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeServicesCount = this.activeServicesCount;
    final attachments = this.attachments;
    final attachmentsStatus = this.attachmentsStatus;
    final capacityProviders = this.capacityProviders;
    final clusterArn = this.clusterArn;
    final clusterName = this.clusterName;
    final configuration = this.configuration;
    final defaultCapacityProviderStrategy =
        this.defaultCapacityProviderStrategy;
    final pendingTasksCount = this.pendingTasksCount;
    final registeredContainerInstancesCount =
        this.registeredContainerInstancesCount;
    final runningTasksCount = this.runningTasksCount;
    final settings = this.settings;
    final statistics = this.statistics;
    final status = this.status;
    final tags = this.tags;
    return {
      if (activeServicesCount != null)
        'activeServicesCount': activeServicesCount,
      if (attachments != null) 'attachments': attachments,
      if (attachmentsStatus != null) 'attachmentsStatus': attachmentsStatus,
      if (capacityProviders != null) 'capacityProviders': capacityProviders,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (configuration != null) 'configuration': configuration,
      if (defaultCapacityProviderStrategy != null)
        'defaultCapacityProviderStrategy': defaultCapacityProviderStrategy,
      if (pendingTasksCount != null) 'pendingTasksCount': pendingTasksCount,
      if (registeredContainerInstancesCount != null)
        'registeredContainerInstancesCount': registeredContainerInstancesCount,
      if (runningTasksCount != null) 'runningTasksCount': runningTasksCount,
      if (settings != null) 'settings': settings,
      if (statistics != null) 'statistics': statistics,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The execute command configuration for the cluster.
class ClusterConfiguration {
  /// The details of the execute command configuration.
  final ExecuteCommandConfiguration? executeCommandConfiguration;

  ClusterConfiguration({
    this.executeCommandConfiguration,
  });

  factory ClusterConfiguration.fromJson(Map<String, dynamic> json) {
    return ClusterConfiguration(
      executeCommandConfiguration: json['executeCommandConfiguration'] != null
          ? ExecuteCommandConfiguration.fromJson(
              json['executeCommandConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executeCommandConfiguration = this.executeCommandConfiguration;
    return {
      if (executeCommandConfiguration != null)
        'executeCommandConfiguration': executeCommandConfiguration,
    };
  }
}

enum ClusterField {
  attachments,
  configurations,
  settings,
  statistics,
  tags,
}

extension on ClusterField {
  String toValue() {
    switch (this) {
      case ClusterField.attachments:
        return 'ATTACHMENTS';
      case ClusterField.configurations:
        return 'CONFIGURATIONS';
      case ClusterField.settings:
        return 'SETTINGS';
      case ClusterField.statistics:
        return 'STATISTICS';
      case ClusterField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  ClusterField toClusterField() {
    switch (this) {
      case 'ATTACHMENTS':
        return ClusterField.attachments;
      case 'CONFIGURATIONS':
        return ClusterField.configurations;
      case 'SETTINGS':
        return ClusterField.settings;
      case 'STATISTICS':
        return ClusterField.statistics;
      case 'TAGS':
        return ClusterField.tags;
    }
    throw Exception('$this is not known in enum ClusterField');
  }
}

/// The settings to use when creating a cluster. This parameter is used to
/// enable CloudWatch Container Insights for a cluster.
class ClusterSetting {
  /// The name of the cluster setting. The only supported value is
  /// <code>containerInsights</code>.
  final ClusterSettingName? name;

  /// The value to set for the cluster setting. The supported values are
  /// <code>enabled</code> and <code>disabled</code>. If <code>enabled</code> is
  /// specified, CloudWatch Container Insights will be enabled for the cluster,
  /// otherwise it will be disabled unless the <code>containerInsights</code>
  /// account setting is enabled. If a cluster value is specified, it will
  /// override the <code>containerInsights</code> value set with
  /// <a>PutAccountSetting</a> or <a>PutAccountSettingDefault</a>.
  final String? value;

  ClusterSetting({
    this.name,
    this.value,
  });

  factory ClusterSetting.fromJson(Map<String, dynamic> json) {
    return ClusterSetting(
      name: (json['name'] as String?)?.toClusterSettingName(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum ClusterSettingName {
  containerInsights,
}

extension on ClusterSettingName {
  String toValue() {
    switch (this) {
      case ClusterSettingName.containerInsights:
        return 'containerInsights';
    }
  }
}

extension on String {
  ClusterSettingName toClusterSettingName() {
    switch (this) {
      case 'containerInsights':
        return ClusterSettingName.containerInsights;
    }
    throw Exception('$this is not known in enum ClusterSettingName');
  }
}

enum Compatibility {
  ec2,
  fargate,
  external,
}

extension on Compatibility {
  String toValue() {
    switch (this) {
      case Compatibility.ec2:
        return 'EC2';
      case Compatibility.fargate:
        return 'FARGATE';
      case Compatibility.external:
        return 'EXTERNAL';
    }
  }
}

extension on String {
  Compatibility toCompatibility() {
    switch (this) {
      case 'EC2':
        return Compatibility.ec2;
      case 'FARGATE':
        return Compatibility.fargate;
      case 'EXTERNAL':
        return Compatibility.external;
    }
    throw Exception('$this is not known in enum Compatibility');
  }
}

enum Connectivity {
  connected,
  disconnected,
}

extension on Connectivity {
  String toValue() {
    switch (this) {
      case Connectivity.connected:
        return 'CONNECTED';
      case Connectivity.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension on String {
  Connectivity toConnectivity() {
    switch (this) {
      case 'CONNECTED':
        return Connectivity.connected;
      case 'DISCONNECTED':
        return Connectivity.disconnected;
    }
    throw Exception('$this is not known in enum Connectivity');
  }
}

/// A Docker container that is part of a task.
class Container {
  /// The Amazon Resource Name (ARN) of the container.
  final String? containerArn;

  /// The number of CPU units set for the container. The value will be
  /// <code>0</code> if no value was specified in the container definition when
  /// the task definition was registered.
  final String? cpu;

  /// The exit code returned from the container.
  final int? exitCode;

  /// The IDs of each GPU assigned to the container.
  final List<String>? gpuIds;

  /// The health status of the container. If health checks are not configured for
  /// this container in its task definition, then it reports the health status as
  /// <code>UNKNOWN</code>.
  final HealthStatus? healthStatus;

  /// The image used for the container.
  final String? image;

  /// The container image manifest digest.
  /// <note>
  /// The <code>imageDigest</code> is only returned if the container is using an
  /// image hosted in Amazon ECR, otherwise it is omitted.
  /// </note>
  final String? imageDigest;

  /// The last known status of the container.
  final String? lastStatus;

  /// The details of any Amazon ECS managed agents associated with the container.
  final List<ManagedAgent>? managedAgents;

  /// The hard limit (in MiB) of memory set for the container.
  final String? memory;

  /// The soft limit (in MiB) of memory set for the container.
  final String? memoryReservation;

  /// The name of the container.
  final String? name;

  /// The network bindings associated with the container.
  final List<NetworkBinding>? networkBindings;

  /// The network interfaces associated with the container.
  final List<NetworkInterface>? networkInterfaces;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  final String? reason;

  /// The ID of the Docker container.
  final String? runtimeId;

  /// The ARN of the task.
  final String? taskArn;

  Container({
    this.containerArn,
    this.cpu,
    this.exitCode,
    this.gpuIds,
    this.healthStatus,
    this.image,
    this.imageDigest,
    this.lastStatus,
    this.managedAgents,
    this.memory,
    this.memoryReservation,
    this.name,
    this.networkBindings,
    this.networkInterfaces,
    this.reason,
    this.runtimeId,
    this.taskArn,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      containerArn: json['containerArn'] as String?,
      cpu: json['cpu'] as String?,
      exitCode: json['exitCode'] as int?,
      gpuIds: (json['gpuIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      healthStatus: (json['healthStatus'] as String?)?.toHealthStatus(),
      image: json['image'] as String?,
      imageDigest: json['imageDigest'] as String?,
      lastStatus: json['lastStatus'] as String?,
      managedAgents: (json['managedAgents'] as List?)
          ?.whereNotNull()
          .map((e) => ManagedAgent.fromJson(e as Map<String, dynamic>))
          .toList(),
      memory: json['memory'] as String?,
      memoryReservation: json['memoryReservation'] as String?,
      name: json['name'] as String?,
      networkBindings: (json['networkBindings'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkBinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      reason: json['reason'] as String?,
      runtimeId: json['runtimeId'] as String?,
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerArn = this.containerArn;
    final cpu = this.cpu;
    final exitCode = this.exitCode;
    final gpuIds = this.gpuIds;
    final healthStatus = this.healthStatus;
    final image = this.image;
    final imageDigest = this.imageDigest;
    final lastStatus = this.lastStatus;
    final managedAgents = this.managedAgents;
    final memory = this.memory;
    final memoryReservation = this.memoryReservation;
    final name = this.name;
    final networkBindings = this.networkBindings;
    final networkInterfaces = this.networkInterfaces;
    final reason = this.reason;
    final runtimeId = this.runtimeId;
    final taskArn = this.taskArn;
    return {
      if (containerArn != null) 'containerArn': containerArn,
      if (cpu != null) 'cpu': cpu,
      if (exitCode != null) 'exitCode': exitCode,
      if (gpuIds != null) 'gpuIds': gpuIds,
      if (healthStatus != null) 'healthStatus': healthStatus.toValue(),
      if (image != null) 'image': image,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (lastStatus != null) 'lastStatus': lastStatus,
      if (managedAgents != null) 'managedAgents': managedAgents,
      if (memory != null) 'memory': memory,
      if (memoryReservation != null) 'memoryReservation': memoryReservation,
      if (name != null) 'name': name,
      if (networkBindings != null) 'networkBindings': networkBindings,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (reason != null) 'reason': reason,
      if (runtimeId != null) 'runtimeId': runtimeId,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

enum ContainerCondition {
  start,
  complete,
  success,
  healthy,
}

extension on ContainerCondition {
  String toValue() {
    switch (this) {
      case ContainerCondition.start:
        return 'START';
      case ContainerCondition.complete:
        return 'COMPLETE';
      case ContainerCondition.success:
        return 'SUCCESS';
      case ContainerCondition.healthy:
        return 'HEALTHY';
    }
  }
}

extension on String {
  ContainerCondition toContainerCondition() {
    switch (this) {
      case 'START':
        return ContainerCondition.start;
      case 'COMPLETE':
        return ContainerCondition.complete;
      case 'SUCCESS':
        return ContainerCondition.success;
      case 'HEALTHY':
        return ContainerCondition.healthy;
    }
    throw Exception('$this is not known in enum ContainerCondition');
  }
}

/// Container definitions are used in task definitions to describe the different
/// containers that are launched as part of a task.
class ContainerDefinition {
  /// The command that is passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">https://docs.docker.com/engine/reference/builder/#cmd</a>.
  /// If there are multiple arguments, each argument should be a separated string
  /// in the array.
  final List<String>? command;

  /// The number of <code>cpu</code> units reserved for the container. This
  /// parameter maps to <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// This field is optional for tasks using the Fargate launch type, and the only
  /// requirement is that the total amount of CPU reserved for all containers
  /// within a task be lower than the task-level <code>cpu</code> value.
  /// <note>
  /// You can determine the number of CPU units that are available per EC2
  /// instance type by multiplying the vCPUs listed for that instance type on the
  /// <a href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 Instances</a>
  /// detail page by 1,024.
  /// </note>
  /// Linux containers share unallocated CPU units with other containers on the
  /// container instance with the same ratio as their allocated amount. For
  /// example, if you run a single-container task on a single-core instance type
  /// with 512 CPU units specified for that container, and that is the only task
  /// running on the container instance, that container could use the full 1,024
  /// CPU unit share at any given time. However, if you launched another copy of
  /// the same task on that container instance, each task would be guaranteed a
  /// minimum of 512 CPU units when needed, and each container could float to
  /// higher CPU usage if the other container was not using it, but if both tasks
  /// were 100% active all of the time, they would be limited to 512 CPU units.
  ///
  /// On Linux container instances, the Docker daemon on the container instance
  /// uses the CPU value to calculate the relative CPU share ratios for running
  /// containers. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#cpu-share-constraint">CPU
  /// share constraint</a> in the Docker documentation. The minimum valid CPU
  /// share value that the Linux kernel allows is 2. However, the CPU parameter is
  /// not required, and you can use CPU values below 2 in your container
  /// definitions. For CPU values below 2 (including null), the behavior varies
  /// based on your Amazon ECS container agent version:
  ///
  /// <ul>
  /// <li>
  /// <b>Agent versions less than or equal to 1.1.0:</b> Null and zero CPU values
  /// are passed to Docker as 0, which Docker then converts to 1,024 CPU shares.
  /// CPU values of 1 are passed to Docker as 1, which the Linux kernel converts
  /// to two CPU shares.
  /// </li>
  /// <li>
  /// <b>Agent versions greater than or equal to 1.2.0:</b> Null, zero, and CPU
  /// values of 1 are passed to Docker as 2.
  /// </li>
  /// </ul>
  /// On Windows container instances, the CPU limit is enforced as an absolute
  /// limit, or a quota. Windows containers only have access to the specified
  /// amount of CPU that is described in the task definition. A null or zero CPU
  /// value is passed to Docker as <code>0</code>, which Windows interprets as 1%
  /// of one CPU.
  final int? cpu;

  /// The dependencies defined for container startup and shutdown. A container can
  /// contain multiple dependencies. When a dependency is defined for container
  /// startup, for container shutdown it is reversed.
  ///
  /// For tasks using the EC2 launch type, the container instances require at
  /// least version 1.26.0 of the container agent to enable container
  /// dependencies. However, we recommend using the latest container agent
  /// version. For information about checking your agent version and updating to
  /// the latest version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you are using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version 1.26.0-1 of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// For tasks using the Fargate launch type, the task or service requires
  /// platform version <code>1.3.0</code> or later.
  final List<ContainerDependency>? dependsOn;

  /// When this parameter is true, networking is disabled within the container.
  /// This parameter maps to <code>NetworkDisabled</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final bool? disableNetworking;

  /// A list of DNS search domains that are presented to the container. This
  /// parameter maps to <code>DnsSearch</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--dns-search</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final List<String>? dnsSearchDomains;

  /// A list of DNS servers that are presented to the container. This parameter
  /// maps to <code>Dns</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--dns</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final List<String>? dnsServers;

  /// A key/value map of labels to add to the container. This parameter maps to
  /// <code>Labels</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--label</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. This parameter requires version 1.18 of the Docker Remote API or
  /// greater on your container instance. To check the Docker Remote API version
  /// on your container instance, log in to your container instance and run the
  /// following command: <code>sudo docker version --format
  /// '{{.Server.APIVersion}}'</code>
  final Map<String, String>? dockerLabels;

  /// A list of strings to provide custom labels for SELinux and AppArmor
  /// multi-level security systems. This field is not valid for containers in
  /// tasks using the Fargate launch type.
  ///
  /// With Windows containers, this parameter can be used to reference a
  /// credential spec file when configuring a container for Active Directory
  /// authentication. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows-gmsa.html">Using
  /// gMSAs for Windows Containers</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// This parameter maps to <code>SecurityOpt</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--security-opt</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// with the <code>ECS_SELINUX_CAPABLE=true</code> or
  /// <code>ECS_APPARMOR_CAPABLE=true</code> environment variables before
  /// containers placed on that instance can use these security options. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS Container Agent Configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  /// For more information about valid values, see <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">Docker
  /// Run Security Configuration</a>.
  ///
  /// Valid values: "no-new-privileges" | "apparmor:PROFILE" | "label:value" |
  /// "credentialspec:CredentialSpecFilePath"
  final List<String>? dockerSecurityOptions;

  /// <important>
  /// Early versions of the Amazon ECS container agent do not properly handle
  /// <code>entryPoint</code> parameters. If you have problems using
  /// <code>entryPoint</code>, update your container agent or enter your commands
  /// and arguments as <code>command</code> array items instead.
  /// </important>
  /// The entry point that is passed to the container. This parameter maps to
  /// <code>Entrypoint</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--entrypoint</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#entrypoint">https://docs.docker.com/engine/reference/builder/#entrypoint</a>.
  final List<String>? entryPoint;

  /// The environment variables to pass to a container. This parameter maps to
  /// <code>Env</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--env</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <important>
  /// We do not recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  /// </important>
  final List<KeyValuePair>? environment;

  /// A list of files containing the environment variables to pass to a container.
  /// This parameter maps to the <code>--env-file</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// You can specify up to ten environment files. The file must have a
  /// <code>.env</code> file extension. Each line in an environment file should
  /// contain an environment variable in <code>VARIABLE=VALUE</code> format. Lines
  /// beginning with <code>#</code> are treated as comments and are ignored. For
  /// more information on the environment variable file syntax, see <a
  /// href="https://docs.docker.com/compose/env-file/">Declare default environment
  /// variables in file</a>.
  ///
  /// If there are environment variables specified using the
  /// <code>environment</code> parameter in a container definition, they take
  /// precedence over the variables contained within an environment file. If
  /// multiple environment files are specified that contain the same variable,
  /// they are processed from the top down. It is recommended to use unique
  /// variable names. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/taskdef-envfiles.html">Specifying
  /// Environment Variables</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final List<EnvironmentFile>? environmentFiles;

  /// If the <code>essential</code> parameter of a container is marked as
  /// <code>true</code>, and that container fails or stops for any reason, all
  /// other containers that are part of the task are stopped. If the
  /// <code>essential</code> parameter of a container is marked as
  /// <code>false</code>, then its failure does not affect the rest of the
  /// containers in a task. If this parameter is omitted, a container is assumed
  /// to be essential.
  ///
  /// All tasks must have at least one essential container. If you have an
  /// application that is composed of multiple containers, you should group
  /// containers that are used for a common purpose into components, and separate
  /// the different components into multiple task definitions. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/application_architecture.html">Application
  /// Architecture</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final bool? essential;

  /// A list of hostnames and IP address mappings to append to the
  /// <code>/etc/hosts</code> file on the container. This parameter maps to
  /// <code>ExtraHosts</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--add-host</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers or tasks that use the
  /// <code>awsvpc</code> network mode.
  /// </note>
  final List<HostEntry>? extraHosts;

  /// The FireLens configuration for the container. This is used to specify and
  /// configure a log router for container logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html">Custom
  /// Log Routing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final FirelensConfiguration? firelensConfiguration;

  /// The container health check command and associated configuration parameters
  /// for the container. This parameter maps to <code>HealthCheck</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>HEALTHCHECK</code> parameter of <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final HealthCheck? healthCheck;

  /// The hostname to use for your container. This parameter maps to
  /// <code>Hostname</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--hostname</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// The <code>hostname</code> parameter is not supported if you are using the
  /// <code>awsvpc</code> network mode.
  /// </note>
  final String? hostname;

  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. Images in the Docker Hub registry are available by default.
  /// Other repositories are specified with either <code>
  /// <i>repository-url</i>/<i>image</i>:<i>tag</i> </code> or <code>
  /// <i>repository-url</i>/<i>image</i>@<i>digest</i> </code>. Up to 255 letters
  /// (uppercase and lowercase), numbers, hyphens, underscores, colons, periods,
  /// forward slashes, and number signs are allowed. This parameter maps to
  /// <code>Image</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>IMAGE</code> parameter of <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// <ul>
  /// <li>
  /// When a new task starts, the Amazon ECS container agent pulls the latest
  /// version of the specified image and tag for the container to use. However,
  /// subsequent updates to a repository image are not propagated to already
  /// running tasks.
  /// </li>
  /// <li>
  /// Images in Amazon ECR repositories can be specified by either using the full
  /// <code>registry/repository:tag</code> or
  /// <code>registry/repository@digest</code>. For example,
  /// <code>012345678910.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;:latest</code>
  /// or
  /// <code>012345678910.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;@sha256:94afd1f2e64d908bc90dbca0035a5b567EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Images in official repositories on Docker Hub use a single name (for
  /// example, <code>ubuntu</code> or <code>mongo</code>).
  /// </li>
  /// <li>
  /// Images in other repositories on Docker Hub are qualified with an
  /// organization name (for example, <code>amazon/amazon-ecs-agent</code>).
  /// </li>
  /// <li>
  /// Images in other online repositories are qualified further by a domain name
  /// (for example, <code>quay.io/assemblyline/ubuntu</code>).
  /// </li>
  /// </ul>
  final String? image;

  /// When this parameter is <code>true</code>, this allows you to deploy
  /// containerized applications that require <code>stdin</code> or a
  /// <code>tty</code> to be allocated. This parameter maps to
  /// <code>OpenStdin</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--interactive</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final bool? interactive;

  /// The <code>links</code> parameter allows containers to communicate with each
  /// other without the need for port mappings. This parameter is only supported
  /// if the network mode of a task definition is <code>bridge</code>. The
  /// <code>name:internalName</code> construct is analogous to
  /// <code>name:alias</code> in Docker links. Up to 255 letters (uppercase and
  /// lowercase), numbers, underscores, and hyphens are allowed. For more
  /// information about linking Docker containers, go to <a
  /// href="https://docs.docker.com/network/links/">Legacy container links</a> in
  /// the Docker documentation. This parameter maps to <code>Links</code> in the
  /// <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--link</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note> <important>
  /// Containers that are collocated on a single container instance may be able to
  /// communicate with each other without requiring links or host port mappings.
  /// Network isolation is achieved on the container instance using security
  /// groups and VPC settings.
  /// </important>
  final List<String>? links;

  /// Linux-specific modifications that are applied to the container, such as
  /// Linux kernel capabilities. For more information see
  /// <a>KernelCapabilities</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final LinuxParameters? linuxParameters;

  /// The log configuration specification for the container.
  ///
  /// This parameter maps to <code>LogConfig</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--log-driver</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. By default, containers use the same logging driver that the Docker
  /// daemon uses. However the container may use a different logging driver than
  /// the Docker daemon by specifying a log driver with this parameter in the
  /// container definition. To use a different logging driver for a container, the
  /// log system must be configured properly on the container instance (or on a
  /// different log server for remote logging options). For more information on
  /// the options for different supported log drivers, see <a
  /// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
  /// logging drivers</a> in the Docker documentation.
  /// <note>
  /// Amazon ECS currently supports a subset of the logging drivers available to
  /// the Docker daemon (shown in the <a>LogConfiguration</a> data type).
  /// Additional log drivers may be available in future releases of the Amazon ECS
  /// container agent.
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: <code>sudo docker version --format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// the logging drivers available on that instance with the
  /// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
  /// containers placed on that instance can use these log configuration options.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS Container Agent Configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final LogConfiguration? logConfiguration;

  /// The amount (in MiB) of memory to present to the container. If your container
  /// attempts to exceed the memory specified here, the container is killed. The
  /// total amount of memory reserved for all containers within a task must be
  /// lower than the task <code>memory</code> value, if one is specified. This
  /// parameter maps to <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// If using the Fargate launch type, this parameter is optional.
  ///
  /// If using the EC2 launch type, you must specify either a task-level memory
  /// value or a container-level memory value. If you specify both a
  /// container-level <code>memory</code> and <code>memoryReservation</code>
  /// value, <code>memory</code> must be greater than
  /// <code>memoryReservation</code>. If you specify
  /// <code>memoryReservation</code>, then that value is subtracted from the
  /// available memory resources for the container instance on which the container
  /// is placed. Otherwise, the value of <code>memory</code> is used.
  ///
  /// The Docker daemon reserves a minimum of 4 MiB of memory for a container, so
  /// you should not specify fewer than 4 MiB of memory for your containers.
  final int? memory;

  /// The soft limit (in MiB) of memory to reserve for the container. When system
  /// memory is under heavy contention, Docker attempts to keep the container
  /// memory to this soft limit. However, your container can consume more memory
  /// when it needs to, up to either the hard limit specified with the
  /// <code>memory</code> parameter (if applicable), or all of the available
  /// memory on the container instance, whichever comes first. This parameter maps
  /// to <code>MemoryReservation</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--memory-reservation</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// If a task-level memory value is not specified, you must specify a non-zero
  /// integer for one or both of <code>memory</code> or
  /// <code>memoryReservation</code> in a container definition. If you specify
  /// both, <code>memory</code> must be greater than
  /// <code>memoryReservation</code>. If you specify
  /// <code>memoryReservation</code>, then that value is subtracted from the
  /// available memory resources for the container instance on which the container
  /// is placed. Otherwise, the value of <code>memory</code> is used.
  ///
  /// For example, if your container normally uses 128 MiB of memory, but
  /// occasionally bursts to 256 MiB of memory for short periods of time, you can
  /// set a <code>memoryReservation</code> of 128 MiB, and a <code>memory</code>
  /// hard limit of 300 MiB. This configuration would allow the container to only
  /// reserve 128 MiB of memory from the remaining resources on the container
  /// instance, but also allow the container to consume more memory resources when
  /// needed.
  ///
  /// The Docker daemon reserves a minimum of 4 MiB of memory for a container, so
  /// you should not specify fewer than 4 MiB of memory for your containers.
  final int? memoryReservation;

  /// The mount points for data volumes in your container.
  ///
  /// This parameter maps to <code>Volumes</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--volume</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Windows containers can mount whole directories on the same drive as
  /// <code>$env:ProgramData</code>. Windows containers cannot mount directories
  /// on a different drive, and mount point cannot be across drives.
  final List<MountPoint>? mountPoints;

  /// The name of a container. If you are linking multiple containers together in
  /// a task definition, the <code>name</code> of one container can be entered in
  /// the <code>links</code> of another container to connect the containers. Up to
  /// 255 letters (uppercase and lowercase), numbers, underscores, and hyphens are
  /// allowed. This parameter maps to <code>name</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--name</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final String? name;

  /// The list of port mappings for the container. Port mappings allow containers
  /// to access ports on the host container instance to send or receive traffic.
  ///
  /// For task definitions that use the <code>awsvpc</code> network mode, you
  /// should only specify the <code>containerPort</code>. The
  /// <code>hostPort</code> can be left blank or it must be the same value as the
  /// <code>containerPort</code>.
  ///
  /// Port mappings on Windows use the <code>NetNAT</code> gateway address rather
  /// than <code>localhost</code>. There is no loopback for port mappings on
  /// Windows, so you cannot access a container's mapped port from the host
  /// itself.
  ///
  /// This parameter maps to <code>PortBindings</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--publish</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. If the network mode of a task definition is set to
  /// <code>none</code>, then you can't specify port mappings. If the network mode
  /// of a task definition is set to <code>host</code>, then host ports must
  /// either be undefined or they must match the container port in the port
  /// mapping.
  /// <note>
  /// After a task reaches the <code>RUNNING</code> status, manual and automatic
  /// host and container port assignments are visible in the <b>Network
  /// Bindings</b> section of a container description for a selected task in the
  /// Amazon ECS console. The assignments are also visible in the
  /// <code>networkBindings</code> section <a>DescribeTasks</a> responses.
  /// </note>
  final List<PortMapping>? portMappings;

  /// When this parameter is true, the container is given elevated privileges on
  /// the host container instance (similar to the <code>root</code> user). This
  /// parameter maps to <code>Privileged</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--privileged</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers or tasks run on AWS
  /// Fargate.
  /// </note>
  final bool? privileged;

  /// When this parameter is <code>true</code>, a TTY is allocated. This parameter
  /// maps to <code>Tty</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--tty</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final bool? pseudoTerminal;

  /// When this parameter is true, the container is given read-only access to its
  /// root file system. This parameter maps to <code>ReadonlyRootfs</code> in the
  /// <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--read-only</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final bool? readonlyRootFilesystem;

  /// The private repository authentication credentials to use.
  final RepositoryCredentials? repositoryCredentials;

  /// The type and amount of a resource to assign to a container. The only
  /// supported resource is a GPU.
  final List<ResourceRequirement>? resourceRequirements;

  /// The secrets to pass to the container. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html">Specifying
  /// Sensitive Data</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final List<Secret>? secrets;

  /// Time duration (in seconds) to wait before giving up on resolving
  /// dependencies for a container. For example, you specify two containers in a
  /// task definition with containerA having a dependency on containerB reaching a
  /// <code>COMPLETE</code>, <code>SUCCESS</code>, or <code>HEALTHY</code> status.
  /// If a <code>startTimeout</code> value is specified for containerB and it does
  /// not reach the desired status within that time then containerA will give up
  /// and not start. This results in the task transitioning to a
  /// <code>STOPPED</code> state.
  /// <note>
  /// When the <code>ECS_CONTAINER_START_TIMEOUT</code> container agent
  /// configuration variable is used, it is enforced indendently from this start
  /// timeout value.
  /// </note>
  /// For tasks using the Fargate launch type, this parameter requires that the
  /// task or service uses platform version 1.3.0 or later.
  ///
  /// For tasks using the EC2 launch type, your container instances require at
  /// least version <code>1.26.0</code> of the container agent to enable a
  /// container start timeout value. However, we recommend using the latest
  /// container agent version. For information about checking your agent version
  /// and updating to the latest version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you are using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version <code>1.26.0-1</code> of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final int? startTimeout;

  /// Time duration (in seconds) to wait before the container is forcefully killed
  /// if it doesn't exit normally on its own.
  ///
  /// For tasks using the Fargate launch type, the task or service requires
  /// platform version 1.3.0 or later. The max stop timeout value is 120 seconds
  /// and if the parameter is not specified, the default value of 30 seconds is
  /// used.
  ///
  /// For tasks using the EC2 launch type, if the <code>stopTimeout</code>
  /// parameter is not specified, the value set for the Amazon ECS container agent
  /// configuration variable <code>ECS_CONTAINER_STOP_TIMEOUT</code> is used by
  /// default. If neither the <code>stopTimeout</code> parameter or the
  /// <code>ECS_CONTAINER_STOP_TIMEOUT</code> agent configuration variable are
  /// set, then the default values of 30 seconds for Linux containers and 30
  /// seconds on Windows containers are used. Your container instances require at
  /// least version 1.26.0 of the container agent to enable a container stop
  /// timeout value. However, we recommend using the latest container agent
  /// version. For information about checking your agent version and updating to
  /// the latest version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you are using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version 1.26.0-1 of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final int? stopTimeout;

  /// A list of namespaced kernel parameters to set in the container. This
  /// parameter maps to <code>Sysctls</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--sysctl</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// It is not recommended that you specify network-related
  /// <code>systemControls</code> parameters for multiple containers in a single
  /// task that also uses either the <code>awsvpc</code> or <code>host</code>
  /// network modes. For tasks that use the <code>awsvpc</code> network mode, the
  /// container that is started last determines which <code>systemControls</code>
  /// parameters take effect. For tasks that use the <code>host</code> network
  /// mode, it changes the container instance's namespaced kernel parameters as
  /// well as the containers.
  /// </note>
  final List<SystemControl>? systemControls;

  /// A list of <code>ulimits</code> to set in the container. If a ulimit value is
  /// specified in a task definition, it will override the default values set by
  /// Docker. This parameter maps to <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. Valid naming values are displayed in the <a>Ulimit</a> data type.
  ///
  /// Amazon ECS tasks hosted on Fargate use the default resource limit values set
  /// by the operating system with the exception of the <code>nofile</code>
  /// resource limit parameter which Fargate overrides. The <code>nofile</code>
  /// resource limit sets a restriction on the number of open files that a
  /// container can use. The default <code>nofile</code> soft limit is
  /// <code>1024</code> and hard limit is <code>4096</code>.
  ///
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: <code>sudo docker version --format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final List<Ulimit>? ulimits;

  /// The user to use inside the container. This parameter maps to
  /// <code>User</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--user</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <important>
  /// When running tasks using the <code>host</code> network mode, you should not
  /// run containers using the root user (UID 0). It is considered best practice
  /// to use a non-root user.
  /// </important>
  /// You can specify the <code>user</code> using the following formats. If
  /// specifying a UID or GID, you must specify it as a positive integer.
  ///
  /// <ul>
  /// <li>
  /// <code>user</code>
  /// </li>
  /// <li>
  /// <code>user:group</code>
  /// </li>
  /// <li>
  /// <code>uid</code>
  /// </li>
  /// <li>
  /// <code>uid:gid</code>
  /// </li>
  /// <li>
  /// <code>user:gid</code>
  /// </li>
  /// <li>
  /// <code>uid:group</code>
  /// </li>
  /// </ul> <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final String? user;

  /// Data volumes to mount from another container. This parameter maps to
  /// <code>VolumesFrom</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--volumes-from</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final List<VolumeFrom>? volumesFrom;

  /// The working directory in which to run commands inside the container. This
  /// parameter maps to <code>WorkingDir</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--workdir</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  final String? workingDirectory;

  ContainerDefinition({
    this.command,
    this.cpu,
    this.dependsOn,
    this.disableNetworking,
    this.dnsSearchDomains,
    this.dnsServers,
    this.dockerLabels,
    this.dockerSecurityOptions,
    this.entryPoint,
    this.environment,
    this.environmentFiles,
    this.essential,
    this.extraHosts,
    this.firelensConfiguration,
    this.healthCheck,
    this.hostname,
    this.image,
    this.interactive,
    this.links,
    this.linuxParameters,
    this.logConfiguration,
    this.memory,
    this.memoryReservation,
    this.mountPoints,
    this.name,
    this.portMappings,
    this.privileged,
    this.pseudoTerminal,
    this.readonlyRootFilesystem,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.secrets,
    this.startTimeout,
    this.stopTimeout,
    this.systemControls,
    this.ulimits,
    this.user,
    this.volumesFrom,
    this.workingDirectory,
  });

  factory ContainerDefinition.fromJson(Map<String, dynamic> json) {
    return ContainerDefinition(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpu: json['cpu'] as int?,
      dependsOn: (json['dependsOn'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      disableNetworking: json['disableNetworking'] as bool?,
      dnsSearchDomains: (json['dnsSearchDomains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dnsServers: (json['dnsServers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dockerLabels: (json['dockerLabels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      dockerSecurityOptions: (json['dockerSecurityOptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entryPoint: (json['entryPoint'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentFiles: (json['environmentFiles'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      essential: json['essential'] as bool?,
      extraHosts: (json['extraHosts'] as List?)
          ?.whereNotNull()
          .map((e) => HostEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      firelensConfiguration: json['firelensConfiguration'] != null
          ? FirelensConfiguration.fromJson(
              json['firelensConfiguration'] as Map<String, dynamic>)
          : null,
      healthCheck: json['healthCheck'] != null
          ? HealthCheck.fromJson(json['healthCheck'] as Map<String, dynamic>)
          : null,
      hostname: json['hostname'] as String?,
      image: json['image'] as String?,
      interactive: json['interactive'] as bool?,
      links: (json['links'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      linuxParameters: json['linuxParameters'] != null
          ? LinuxParameters.fromJson(
              json['linuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      memory: json['memory'] as int?,
      memoryReservation: json['memoryReservation'] as int?,
      mountPoints: (json['mountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MountPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      portMappings: (json['portMappings'] as List?)
          ?.whereNotNull()
          .map((e) => PortMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      privileged: json['privileged'] as bool?,
      pseudoTerminal: json['pseudoTerminal'] as bool?,
      readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool?,
      repositoryCredentials: json['repositoryCredentials'] != null
          ? RepositoryCredentials.fromJson(
              json['repositoryCredentials'] as Map<String, dynamic>)
          : null,
      resourceRequirements: (json['resourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
      secrets: (json['secrets'] as List?)
          ?.whereNotNull()
          .map((e) => Secret.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTimeout: json['startTimeout'] as int?,
      stopTimeout: json['stopTimeout'] as int?,
      systemControls: (json['systemControls'] as List?)
          ?.whereNotNull()
          .map((e) => SystemControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      ulimits: (json['ulimits'] as List?)
          ?.whereNotNull()
          .map((e) => Ulimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
      volumesFrom: (json['volumesFrom'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeFrom.fromJson(e as Map<String, dynamic>))
          .toList(),
      workingDirectory: json['workingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final cpu = this.cpu;
    final dependsOn = this.dependsOn;
    final disableNetworking = this.disableNetworking;
    final dnsSearchDomains = this.dnsSearchDomains;
    final dnsServers = this.dnsServers;
    final dockerLabels = this.dockerLabels;
    final dockerSecurityOptions = this.dockerSecurityOptions;
    final entryPoint = this.entryPoint;
    final environment = this.environment;
    final environmentFiles = this.environmentFiles;
    final essential = this.essential;
    final extraHosts = this.extraHosts;
    final firelensConfiguration = this.firelensConfiguration;
    final healthCheck = this.healthCheck;
    final hostname = this.hostname;
    final image = this.image;
    final interactive = this.interactive;
    final links = this.links;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final memory = this.memory;
    final memoryReservation = this.memoryReservation;
    final mountPoints = this.mountPoints;
    final name = this.name;
    final portMappings = this.portMappings;
    final privileged = this.privileged;
    final pseudoTerminal = this.pseudoTerminal;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final secrets = this.secrets;
    final startTimeout = this.startTimeout;
    final stopTimeout = this.stopTimeout;
    final systemControls = this.systemControls;
    final ulimits = this.ulimits;
    final user = this.user;
    final volumesFrom = this.volumesFrom;
    final workingDirectory = this.workingDirectory;
    return {
      if (command != null) 'command': command,
      if (cpu != null) 'cpu': cpu,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (disableNetworking != null) 'disableNetworking': disableNetworking,
      if (dnsSearchDomains != null) 'dnsSearchDomains': dnsSearchDomains,
      if (dnsServers != null) 'dnsServers': dnsServers,
      if (dockerLabels != null) 'dockerLabels': dockerLabels,
      if (dockerSecurityOptions != null)
        'dockerSecurityOptions': dockerSecurityOptions,
      if (entryPoint != null) 'entryPoint': entryPoint,
      if (environment != null) 'environment': environment,
      if (environmentFiles != null) 'environmentFiles': environmentFiles,
      if (essential != null) 'essential': essential,
      if (extraHosts != null) 'extraHosts': extraHosts,
      if (firelensConfiguration != null)
        'firelensConfiguration': firelensConfiguration,
      if (healthCheck != null) 'healthCheck': healthCheck,
      if (hostname != null) 'hostname': hostname,
      if (image != null) 'image': image,
      if (interactive != null) 'interactive': interactive,
      if (links != null) 'links': links,
      if (linuxParameters != null) 'linuxParameters': linuxParameters,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (memory != null) 'memory': memory,
      if (memoryReservation != null) 'memoryReservation': memoryReservation,
      if (mountPoints != null) 'mountPoints': mountPoints,
      if (name != null) 'name': name,
      if (portMappings != null) 'portMappings': portMappings,
      if (privileged != null) 'privileged': privileged,
      if (pseudoTerminal != null) 'pseudoTerminal': pseudoTerminal,
      if (readonlyRootFilesystem != null)
        'readonlyRootFilesystem': readonlyRootFilesystem,
      if (repositoryCredentials != null)
        'repositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (secrets != null) 'secrets': secrets,
      if (startTimeout != null) 'startTimeout': startTimeout,
      if (stopTimeout != null) 'stopTimeout': stopTimeout,
      if (systemControls != null) 'systemControls': systemControls,
      if (ulimits != null) 'ulimits': ulimits,
      if (user != null) 'user': user,
      if (volumesFrom != null) 'volumesFrom': volumesFrom,
      if (workingDirectory != null) 'workingDirectory': workingDirectory,
    };
  }
}

/// The dependencies defined for container startup and shutdown. A container can
/// contain multiple dependencies. When a dependency is defined for container
/// startup, for container shutdown it is reversed.
///
/// Your Amazon ECS container instances require at least version 1.26.0 of the
/// container agent to enable container dependencies. However, we recommend
/// using the latest container agent version. For information about checking
/// your agent version and updating to the latest version, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
/// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>. If you are using an Amazon ECS-optimized Linux
/// AMI, your instance needs at least version 1.26.0-1 of the
/// <code>ecs-init</code> package. If your container instances are launched from
/// version <code>20190301</code> or later, then they contain the required
/// versions of the container agent and <code>ecs-init</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
/// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// For tasks using the Fargate launch type, this parameter requires that the
/// task or service uses platform version 1.3.0 or later.
/// </note>
class ContainerDependency {
  /// The dependency condition of the container. The following are the available
  /// conditions and their behavior:
  ///
  /// <ul>
  /// <li>
  /// <code>START</code> - This condition emulates the behavior of links and
  /// volumes today. It validates that a dependent container is started before
  /// permitting other containers to start.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code> - This condition validates that a dependent container
  /// runs to completion (exits) before permitting other containers to start. This
  /// can be useful for nonessential containers that run a script and then exit.
  /// This condition cannot be set on an essential container.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> - This condition is the same as <code>COMPLETE</code>,
  /// but it also requires that the container exits with a <code>zero</code>
  /// status. This condition cannot be set on an essential container.
  /// </li>
  /// <li>
  /// <code>HEALTHY</code> - This condition validates that the dependent container
  /// passes its Docker health check before permitting other containers to start.
  /// This requires that the dependent container has health checks configured.
  /// This condition is confirmed only at task startup.
  /// </li>
  /// </ul>
  final ContainerCondition condition;

  /// The name of a container.
  final String containerName;

  ContainerDependency({
    required this.condition,
    required this.containerName,
  });

  factory ContainerDependency.fromJson(Map<String, dynamic> json) {
    return ContainerDependency(
      condition: (json['condition'] as String).toContainerCondition(),
      containerName: json['containerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final containerName = this.containerName;
    return {
      'condition': condition.toValue(),
      'containerName': containerName,
    };
  }
}

/// An EC2 instance that is running the Amazon ECS agent and has been registered
/// with a cluster.
class ContainerInstance {
  /// This parameter returns <code>true</code> if the agent is connected to Amazon
  /// ECS. Registered instances with an agent that may be unhealthy or stopped
  /// return <code>false</code>. Only instances connected to an agent can accept
  /// placement requests.
  final bool? agentConnected;

  /// The status of the most recent agent update. If an update has never been
  /// requested, this value is <code>NULL</code>.
  final AgentUpdateStatus? agentUpdateStatus;

  /// The resources attached to a container instance, such as elastic network
  /// interfaces.
  final List<Attachment>? attachments;

  /// The attributes set for the container instance, either by the Amazon ECS
  /// container agent at instance registration or manually with the
  /// <a>PutAttributes</a> operation.
  final List<Attribute>? attributes;

  /// The capacity provider associated with the container instance.
  final String? capacityProviderName;

  /// The Amazon Resource Name (ARN) of the container instance. The ARN contains
  /// the <code>arn:aws:ecs</code> namespace, followed by the Region of the
  /// container instance, the AWS account ID of the container instance owner, the
  /// <code>container-instance</code> namespace, and then the container instance
  /// ID. For example,
  /// <code>arn:aws:ecs:region:aws_account_id:container-instance/container_instance_ID</code>.
  final String? containerInstanceArn;

  /// The ID of the container instance. For Amazon EC2 instances, this value is
  /// the Amazon EC2 instance ID. For external instances, this value is the AWS
  /// Systems Manager managed instance ID.
  final String? ec2InstanceId;

  /// The number of tasks on the container instance that are in the
  /// <code>PENDING</code> status.
  final int? pendingTasksCount;

  /// The Unix timestamp for when the container instance was registered.
  final DateTime? registeredAt;

  /// For CPU and memory resource types, this parameter describes the amount of
  /// each resource that was available on the container instance when the
  /// container agent registered it with Amazon ECS. This value represents the
  /// total amount of CPU and memory that can be allocated on this container
  /// instance to tasks. For port resource types, this parameter describes the
  /// ports that were reserved by the Amazon ECS container agent when it
  /// registered the container instance with Amazon ECS.
  final List<Resource>? registeredResources;

  /// For CPU and memory resource types, this parameter describes the remaining
  /// CPU and memory that has not already been allocated to tasks and is therefore
  /// available for new tasks. For port resource types, this parameter describes
  /// the ports that were reserved by the Amazon ECS container agent (at instance
  /// registration time) and any task containers that have reserved port mappings
  /// on the host (with the <code>host</code> or <code>bridge</code> network
  /// mode). Any port that is not specified here is available for new tasks.
  final List<Resource>? remainingResources;

  /// The number of tasks on the container instance that are in the
  /// <code>RUNNING</code> status.
  final int? runningTasksCount;

  /// The status of the container instance. The valid values are
  /// <code>REGISTERING</code>, <code>REGISTRATION_FAILED</code>,
  /// <code>ACTIVE</code>, <code>INACTIVE</code>, <code>DEREGISTERING</code>, or
  /// <code>DRAINING</code>.
  ///
  /// If your account has opted in to the <code>awsvpcTrunking</code> account
  /// setting, then any newly registered container instance will transition to a
  /// <code>REGISTERING</code> status while the trunk elastic network interface is
  /// provisioned for the instance. If the registration fails, the instance will
  /// transition to a <code>REGISTRATION_FAILED</code> status. You can describe
  /// the container instance and see the reason for failure in the
  /// <code>statusReason</code> parameter. Once the container instance is
  /// terminated, the instance transitions to a <code>DEREGISTERING</code> status
  /// while the trunk elastic network interface is deprovisioned. The instance
  /// then transitions to an <code>INACTIVE</code> status.
  ///
  /// The <code>ACTIVE</code> status indicates that the container instance can
  /// accept tasks. The <code>DRAINING</code> indicates that new tasks are not
  /// placed on the container instance and any service tasks running on the
  /// container instance are removed if possible. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-draining.html">Container
  /// Instance Draining</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? status;

  /// The reason that the container instance reached its current status.
  final String? statusReason;

  /// The metadata that you apply to the container instance to help you categorize
  /// and organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The version counter for the container instance. Every time a container
  /// instance experiences a change that triggers a CloudWatch event, the version
  /// counter is incremented. If you are replicating your Amazon ECS container
  /// instance state with CloudWatch Events, you can compare the version of a
  /// container instance reported by the Amazon ECS APIs with the version reported
  /// in CloudWatch Events for the container instance (inside the
  /// <code>detail</code> object) to verify that the version in your event stream
  /// is current.
  final int? version;

  /// The version information for the Amazon ECS container agent and Docker daemon
  /// running on the container instance.
  final VersionInfo? versionInfo;

  ContainerInstance({
    this.agentConnected,
    this.agentUpdateStatus,
    this.attachments,
    this.attributes,
    this.capacityProviderName,
    this.containerInstanceArn,
    this.ec2InstanceId,
    this.pendingTasksCount,
    this.registeredAt,
    this.registeredResources,
    this.remainingResources,
    this.runningTasksCount,
    this.status,
    this.statusReason,
    this.tags,
    this.version,
    this.versionInfo,
  });

  factory ContainerInstance.fromJson(Map<String, dynamic> json) {
    return ContainerInstance(
      agentConnected: json['agentConnected'] as bool?,
      agentUpdateStatus:
          (json['agentUpdateStatus'] as String?)?.toAgentUpdateStatus(),
      attachments: (json['attachments'] as List?)
          ?.whereNotNull()
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityProviderName: json['capacityProviderName'] as String?,
      containerInstanceArn: json['containerInstanceArn'] as String?,
      ec2InstanceId: json['ec2InstanceId'] as String?,
      pendingTasksCount: json['pendingTasksCount'] as int?,
      registeredAt: timeStampFromJson(json['registeredAt']),
      registeredResources: (json['registeredResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      remainingResources: (json['remainingResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      runningTasksCount: json['runningTasksCount'] as int?,
      status: json['status'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as int?,
      versionInfo: json['versionInfo'] != null
          ? VersionInfo.fromJson(json['versionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentConnected = this.agentConnected;
    final agentUpdateStatus = this.agentUpdateStatus;
    final attachments = this.attachments;
    final attributes = this.attributes;
    final capacityProviderName = this.capacityProviderName;
    final containerInstanceArn = this.containerInstanceArn;
    final ec2InstanceId = this.ec2InstanceId;
    final pendingTasksCount = this.pendingTasksCount;
    final registeredAt = this.registeredAt;
    final registeredResources = this.registeredResources;
    final remainingResources = this.remainingResources;
    final runningTasksCount = this.runningTasksCount;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final version = this.version;
    final versionInfo = this.versionInfo;
    return {
      if (agentConnected != null) 'agentConnected': agentConnected,
      if (agentUpdateStatus != null)
        'agentUpdateStatus': agentUpdateStatus.toValue(),
      if (attachments != null) 'attachments': attachments,
      if (attributes != null) 'attributes': attributes,
      if (capacityProviderName != null)
        'capacityProviderName': capacityProviderName,
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (ec2InstanceId != null) 'ec2InstanceId': ec2InstanceId,
      if (pendingTasksCount != null) 'pendingTasksCount': pendingTasksCount,
      if (registeredAt != null)
        'registeredAt': unixTimestampToJson(registeredAt),
      if (registeredResources != null)
        'registeredResources': registeredResources,
      if (remainingResources != null) 'remainingResources': remainingResources,
      if (runningTasksCount != null) 'runningTasksCount': runningTasksCount,
      if (status != null) 'status': status,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (versionInfo != null) 'versionInfo': versionInfo,
    };
  }
}

enum ContainerInstanceField {
  tags,
}

extension on ContainerInstanceField {
  String toValue() {
    switch (this) {
      case ContainerInstanceField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  ContainerInstanceField toContainerInstanceField() {
    switch (this) {
      case 'TAGS':
        return ContainerInstanceField.tags;
    }
    throw Exception('$this is not known in enum ContainerInstanceField');
  }
}

enum ContainerInstanceStatus {
  active,
  draining,
  registering,
  deregistering,
  registrationFailed,
}

extension on ContainerInstanceStatus {
  String toValue() {
    switch (this) {
      case ContainerInstanceStatus.active:
        return 'ACTIVE';
      case ContainerInstanceStatus.draining:
        return 'DRAINING';
      case ContainerInstanceStatus.registering:
        return 'REGISTERING';
      case ContainerInstanceStatus.deregistering:
        return 'DEREGISTERING';
      case ContainerInstanceStatus.registrationFailed:
        return 'REGISTRATION_FAILED';
    }
  }
}

extension on String {
  ContainerInstanceStatus toContainerInstanceStatus() {
    switch (this) {
      case 'ACTIVE':
        return ContainerInstanceStatus.active;
      case 'DRAINING':
        return ContainerInstanceStatus.draining;
      case 'REGISTERING':
        return ContainerInstanceStatus.registering;
      case 'DEREGISTERING':
        return ContainerInstanceStatus.deregistering;
      case 'REGISTRATION_FAILED':
        return ContainerInstanceStatus.registrationFailed;
    }
    throw Exception('$this is not known in enum ContainerInstanceStatus');
  }
}

/// The overrides that should be sent to a container. An empty container
/// override can be passed in. An example of an empty container override would
/// be <code>{"containerOverrides": [ ] }</code>. If a non-empty container
/// override is specified, the <code>name</code> parameter must be included.
class ContainerOverride {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the task definition. You must also specify a container
  /// name.
  final List<String>? command;

  /// The number of <code>cpu</code> units reserved for the container, instead of
  /// the default value from the task definition. You must also specify a
  /// container name.
  final int? cpu;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// task definition. You must also specify a container name.
  final List<KeyValuePair>? environment;

  /// A list of files containing the environment variables to pass to a container,
  /// instead of the value from the container definition.
  final List<EnvironmentFile>? environmentFiles;

  /// The hard limit (in MiB) of memory to present to the container, instead of
  /// the default value from the task definition. If your container attempts to
  /// exceed the memory specified here, the container is killed. You must also
  /// specify a container name.
  final int? memory;

  /// The soft limit (in MiB) of memory to reserve for the container, instead of
  /// the default value from the task definition. You must also specify a
  /// container name.
  final int? memoryReservation;

  /// The name of the container that receives the override. This parameter is
  /// required if any override is specified.
  final String? name;

  /// The type and amount of a resource to assign to a container, instead of the
  /// default value from the task definition. The only supported resource is a
  /// GPU.
  final List<ResourceRequirement>? resourceRequirements;

  ContainerOverride({
    this.command,
    this.cpu,
    this.environment,
    this.environmentFiles,
    this.memory,
    this.memoryReservation,
    this.name,
    this.resourceRequirements,
  });

  factory ContainerOverride.fromJson(Map<String, dynamic> json) {
    return ContainerOverride(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpu: json['cpu'] as int?,
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentFiles: (json['environmentFiles'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      memory: json['memory'] as int?,
      memoryReservation: json['memoryReservation'] as int?,
      name: json['name'] as String?,
      resourceRequirements: (json['resourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final cpu = this.cpu;
    final environment = this.environment;
    final environmentFiles = this.environmentFiles;
    final memory = this.memory;
    final memoryReservation = this.memoryReservation;
    final name = this.name;
    final resourceRequirements = this.resourceRequirements;
    return {
      if (command != null) 'command': command,
      if (cpu != null) 'cpu': cpu,
      if (environment != null) 'environment': environment,
      if (environmentFiles != null) 'environmentFiles': environmentFiles,
      if (memory != null) 'memory': memory,
      if (memoryReservation != null) 'memoryReservation': memoryReservation,
      if (name != null) 'name': name,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
    };
  }
}

/// An object representing a change in state for a container.
class ContainerStateChange {
  /// The name of the container.
  final String? containerName;

  /// The exit code for the container, if the state change is a result of the
  /// container exiting.
  final int? exitCode;

  /// The container image SHA 256 digest.
  final String? imageDigest;

  /// Any network bindings associated with the container.
  final List<NetworkBinding>? networkBindings;

  /// The reason for the state change.
  final String? reason;

  /// The ID of the Docker container.
  final String? runtimeId;

  /// The status of the container.
  final String? status;

  ContainerStateChange({
    this.containerName,
    this.exitCode,
    this.imageDigest,
    this.networkBindings,
    this.reason,
    this.runtimeId,
    this.status,
  });

  factory ContainerStateChange.fromJson(Map<String, dynamic> json) {
    return ContainerStateChange(
      containerName: json['containerName'] as String?,
      exitCode: json['exitCode'] as int?,
      imageDigest: json['imageDigest'] as String?,
      networkBindings: (json['networkBindings'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkBinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      reason: json['reason'] as String?,
      runtimeId: json['runtimeId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final exitCode = this.exitCode;
    final imageDigest = this.imageDigest;
    final networkBindings = this.networkBindings;
    final reason = this.reason;
    final runtimeId = this.runtimeId;
    final status = this.status;
    return {
      if (containerName != null) 'containerName': containerName,
      if (exitCode != null) 'exitCode': exitCode,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (networkBindings != null) 'networkBindings': networkBindings,
      if (reason != null) 'reason': reason,
      if (runtimeId != null) 'runtimeId': runtimeId,
      if (status != null) 'status': status,
    };
  }
}

class CreateCapacityProviderResponse {
  /// The full description of the new capacity provider.
  final CapacityProvider? capacityProvider;

  CreateCapacityProviderResponse({
    this.capacityProvider,
  });

  factory CreateCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return CreateCapacityProviderResponse(
      capacityProvider: json['capacityProvider'] != null
          ? CapacityProvider.fromJson(
              json['capacityProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      if (capacityProvider != null) 'capacityProvider': capacityProvider,
    };
  }
}

class CreateClusterResponse {
  /// The full description of your new cluster.
  final Cluster? cluster;

  CreateClusterResponse({
    this.cluster,
  });

  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateClusterResponse(
      cluster: json['cluster'] != null
          ? Cluster.fromJson(json['cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'cluster': cluster,
    };
  }
}

class CreateServiceResponse {
  /// The full description of your service following the create call.
  ///
  /// If a service is using the <code>ECS</code> deployment controller, the
  /// <code>deploymentController</code> and <code>taskSets</code> parameters will
  /// not be returned.
  ///
  /// If the service is using the <code>CODE_DEPLOY</code> deployment controller,
  /// the <code>deploymentController</code>, <code>taskSets</code> and
  /// <code>deployments</code> parameters will be returned, however the
  /// <code>deployments</code> parameter will be an empty list.
  final Service? service;

  CreateServiceResponse({
    this.service,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'service': service,
    };
  }
}

class CreateTaskSetResponse {
  /// Information about a set of Amazon ECS tasks in either an AWS CodeDeploy or
  /// an <code>EXTERNAL</code> deployment. A task set includes details such as the
  /// desired number of tasks, how many tasks are running, and whether the task
  /// set serves production traffic.
  final TaskSet? taskSet;

  CreateTaskSetResponse({
    this.taskSet,
  });

  factory CreateTaskSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateTaskSetResponse(
      taskSet: json['taskSet'] != null
          ? TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskSet = this.taskSet;
    return {
      if (taskSet != null) 'taskSet': taskSet,
    };
  }
}

class DeleteAccountSettingResponse {
  /// The account setting for the specified principal ARN.
  final Setting? setting;

  DeleteAccountSettingResponse({
    this.setting,
  });

  factory DeleteAccountSettingResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAccountSettingResponse(
      setting: json['setting'] != null
          ? Setting.fromJson(json['setting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final setting = this.setting;
    return {
      if (setting != null) 'setting': setting,
    };
  }
}

class DeleteAttributesResponse {
  /// A list of attribute objects that were successfully deleted from your
  /// resource.
  final List<Attribute>? attributes;

  DeleteAttributesResponse({
    this.attributes,
  });

  factory DeleteAttributesResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAttributesResponse(
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'attributes': attributes,
    };
  }
}

class DeleteCapacityProviderResponse {
  /// The details of the capacity provider.
  final CapacityProvider? capacityProvider;

  DeleteCapacityProviderResponse({
    this.capacityProvider,
  });

  factory DeleteCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCapacityProviderResponse(
      capacityProvider: json['capacityProvider'] != null
          ? CapacityProvider.fromJson(
              json['capacityProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      if (capacityProvider != null) 'capacityProvider': capacityProvider,
    };
  }
}

class DeleteClusterResponse {
  /// The full description of the deleted cluster.
  final Cluster? cluster;

  DeleteClusterResponse({
    this.cluster,
  });

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteClusterResponse(
      cluster: json['cluster'] != null
          ? Cluster.fromJson(json['cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'cluster': cluster,
    };
  }
}

class DeleteServiceResponse {
  /// The full description of the deleted service.
  final Service? service;

  DeleteServiceResponse({
    this.service,
  });

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'service': service,
    };
  }
}

class DeleteTaskSetResponse {
  /// Details about the task set.
  final TaskSet? taskSet;

  DeleteTaskSetResponse({
    this.taskSet,
  });

  factory DeleteTaskSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTaskSetResponse(
      taskSet: json['taskSet'] != null
          ? TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskSet = this.taskSet;
    return {
      if (taskSet != null) 'taskSet': taskSet,
    };
  }
}

/// The details of an Amazon ECS service deployment. This is used only when a
/// service uses the <code>ECS</code> deployment controller type.
class Deployment {
  /// The capacity provider strategy that the deployment is using.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// The Unix timestamp for when the service deployment was created.
  final DateTime? createdAt;

  /// The most recent desired count of tasks that was specified for the service to
  /// deploy or maintain.
  final int? desiredCount;

  /// The number of consecutively failed tasks in the deployment. A task is
  /// considered a failure if the service scheduler can't launch the task, the
  /// task doesn't transition to a <code>RUNNING</code> state, or if it fails any
  /// of its defined health checks and is stopped.
  /// <note>
  /// Once a service deployment has one or more successfully running tasks, the
  /// failed task count resets to zero and stops being evaluated.
  /// </note>
  final int? failedTasks;

  /// The ID of the deployment.
  final String? id;

  /// The launch type the tasks in the service are using. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS Launch Types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// The VPC subnet and security group configuration for tasks that receive their
  /// own elastic network interface by using the <code>awsvpc</code> networking
  /// mode.
  final NetworkConfiguration? networkConfiguration;

  /// The number of tasks in the deployment that are in the <code>PENDING</code>
  /// status.
  final int? pendingCount;

  /// The platform version on which your tasks in the service are running. A
  /// platform version is only specified for tasks using the Fargate launch type.
  /// If one is not specified, the <code>LATEST</code> platform version is used by
  /// default. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? platformVersion;

  /// <note>
  /// The <code>rolloutState</code> of a service is only returned for services
  /// that use the rolling update (<code>ECS</code>) deployment type that are not
  /// behind a Classic Load Balancer.
  /// </note>
  /// The rollout state of the deployment. When a service deployment is started,
  /// it begins in an <code>IN_PROGRESS</code> state. When the service reaches a
  /// steady state, the deployment will transition to a <code>COMPLETED</code>
  /// state. If the service fails to reach a steady state and circuit breaker is
  /// enabled, the deployment will transition to a <code>FAILED</code> state. A
  /// deployment in <code>FAILED</code> state will launch no new tasks. For more
  /// information, see <a>DeploymentCircuitBreaker</a>.
  final DeploymentRolloutState? rolloutState;

  /// A description of the rollout state of a deployment.
  final String? rolloutStateReason;

  /// The number of tasks in the deployment that are in the <code>RUNNING</code>
  /// status.
  final int? runningCount;

  /// The status of the deployment. The following describes each state:
  /// <dl> <dt>PRIMARY</dt> <dd>
  /// The most recent deployment of a service.
  /// </dd> <dt>ACTIVE</dt> <dd>
  /// A service deployment that still has running tasks, but are in the process of
  /// being replaced with a new <code>PRIMARY</code> deployment.
  /// </dd> <dt>INACTIVE</dt> <dd>
  /// A deployment that has been completely replaced.
  /// </dd> </dl>
  final String? status;

  /// The most recent task definition that was specified for the tasks in the
  /// service to use.
  final String? taskDefinition;

  /// The Unix timestamp for when the service deployment was last updated.
  final DateTime? updatedAt;

  Deployment({
    this.capacityProviderStrategy,
    this.createdAt,
    this.desiredCount,
    this.failedTasks,
    this.id,
    this.launchType,
    this.networkConfiguration,
    this.pendingCount,
    this.platformVersion,
    this.rolloutState,
    this.rolloutStateReason,
    this.runningCount,
    this.status,
    this.taskDefinition,
    this.updatedAt,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      capacityProviderStrategy: (json['capacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      desiredCount: json['desiredCount'] as int?,
      failedTasks: json['failedTasks'] as int?,
      id: json['id'] as String?,
      launchType: (json['launchType'] as String?)?.toLaunchType(),
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      pendingCount: json['pendingCount'] as int?,
      platformVersion: json['platformVersion'] as String?,
      rolloutState:
          (json['rolloutState'] as String?)?.toDeploymentRolloutState(),
      rolloutStateReason: json['rolloutStateReason'] as String?,
      runningCount: json['runningCount'] as int?,
      status: json['status'] as String?,
      taskDefinition: json['taskDefinition'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final createdAt = this.createdAt;
    final desiredCount = this.desiredCount;
    final failedTasks = this.failedTasks;
    final id = this.id;
    final launchType = this.launchType;
    final networkConfiguration = this.networkConfiguration;
    final pendingCount = this.pendingCount;
    final platformVersion = this.platformVersion;
    final rolloutState = this.rolloutState;
    final rolloutStateReason = this.rolloutStateReason;
    final runningCount = this.runningCount;
    final status = this.status;
    final taskDefinition = this.taskDefinition;
    final updatedAt = this.updatedAt;
    return {
      if (capacityProviderStrategy != null)
        'capacityProviderStrategy': capacityProviderStrategy,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (desiredCount != null) 'desiredCount': desiredCount,
      if (failedTasks != null) 'failedTasks': failedTasks,
      if (id != null) 'id': id,
      if (launchType != null) 'launchType': launchType.toValue(),
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (pendingCount != null) 'pendingCount': pendingCount,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (rolloutState != null) 'rolloutState': rolloutState.toValue(),
      if (rolloutStateReason != null) 'rolloutStateReason': rolloutStateReason,
      if (runningCount != null) 'runningCount': runningCount,
      if (status != null) 'status': status,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// <note>
/// The deployment circuit breaker can only be used for services using the
/// rolling update (<code>ECS</code>) deployment type that are not behind a
/// Classic Load Balancer.
/// </note>
/// The <b>deployment circuit breaker</b> determines whether a service
/// deployment will fail if the service can't reach a steady state. If enabled,
/// a service deployment will transition to a failed state and stop launching
/// new tasks. You can also enable Amazon ECS to roll back your service to the
/// last completed deployment after a failure. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html">Rolling
/// update</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class DeploymentCircuitBreaker {
  /// Whether to enable the deployment circuit breaker logic for the service.
  final bool enable;

  /// Whether to enable Amazon ECS to roll back the service if a service
  /// deployment fails. If rollback is enabled, when a service deployment fails,
  /// the service is rolled back to the last deployment that completed
  /// successfully.
  final bool rollback;

  DeploymentCircuitBreaker({
    required this.enable,
    required this.rollback,
  });

  factory DeploymentCircuitBreaker.fromJson(Map<String, dynamic> json) {
    return DeploymentCircuitBreaker(
      enable: json['enable'] as bool,
      rollback: json['rollback'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enable = this.enable;
    final rollback = this.rollback;
    return {
      'enable': enable,
      'rollback': rollback,
    };
  }
}

/// Optional deployment parameters that control how many tasks run during a
/// deployment and the ordering of stopping and starting tasks.
class DeploymentConfiguration {
  /// <note>
  /// The deployment circuit breaker can only be used for services using the
  /// rolling update (<code>ECS</code>) deployment type.
  /// </note>
  /// The <b>deployment circuit breaker</b> determines whether a service
  /// deployment will fail if the service can't reach a steady state. If
  /// deployment circuit breaker is enabled, a service deployment will transition
  /// to a failed state and stop launching new tasks. If rollback is enabled, when
  /// a service deployment fails, the service is rolled back to the last
  /// deployment that completed successfully.
  final DeploymentCircuitBreaker? deploymentCircuitBreaker;

  /// If a service is using the rolling update (<code>ECS</code>) deployment type,
  /// the <b>maximum percent</b> parameter represents an upper limit on the number
  /// of tasks in a service that are allowed in the <code>RUNNING</code> or
  /// <code>PENDING</code> state during a deployment, as a percentage of the
  /// desired number of tasks (rounded down to the nearest integer), and while any
  /// container instances are in the <code>DRAINING</code> state if the service
  /// contains tasks using the EC2 launch type. This parameter enables you to
  /// define the deployment batch size. For example, if your service has a desired
  /// number of four tasks and a maximum percent value of 200%, the scheduler may
  /// start four new tasks before stopping the four older tasks (provided that the
  /// cluster resources required to do this are available). The default value for
  /// maximum percent is 200%.
  ///
  /// If a service is using the blue/green (<code>CODE_DEPLOY</code>) or
  /// <code>EXTERNAL</code> deployment types and tasks that use the EC2 launch
  /// type, the <b>maximum percent</b> value is set to the default value and is
  /// used to define the upper limit on the number of the tasks in the service
  /// that remain in the <code>RUNNING</code> state while the container instances
  /// are in the <code>DRAINING</code> state. If the tasks in the service use the
  /// Fargate launch type, the maximum percent value is not used, although it is
  /// returned when describing your service.
  final int? maximumPercent;

  /// If a service is using the rolling update (<code>ECS</code>) deployment type,
  /// the <b>minimum healthy percent</b> represents a lower limit on the number of
  /// tasks in a service that must remain in the <code>RUNNING</code> state during
  /// a deployment, as a percentage of the desired number of tasks (rounded up to
  /// the nearest integer), and while any container instances are in the
  /// <code>DRAINING</code> state if the service contains tasks using the EC2
  /// launch type. This parameter enables you to deploy without using additional
  /// cluster capacity. For example, if your service has a desired number of four
  /// tasks and a minimum healthy percent of 50%, the scheduler may stop two
  /// existing tasks to free up cluster capacity before starting two new tasks.
  /// Tasks for services that <i>do not</i> use a load balancer are considered
  /// healthy if they are in the <code>RUNNING</code> state; tasks for services
  /// that <i>do</i> use a load balancer are considered healthy if they are in the
  /// <code>RUNNING</code> state and they are reported as healthy by the load
  /// balancer. The default value for minimum healthy percent is 100%.
  ///
  /// If a service is using the blue/green (<code>CODE_DEPLOY</code>) or
  /// <code>EXTERNAL</code> deployment types and tasks that use the EC2 launch
  /// type, the <b>minimum healthy percent</b> value is set to the default value
  /// and is used to define the lower limit on the number of the tasks in the
  /// service that remain in the <code>RUNNING</code> state while the container
  /// instances are in the <code>DRAINING</code> state. If the tasks in the
  /// service use the Fargate launch type, the minimum healthy percent value is
  /// not used, although it is returned when describing your service.
  final int? minimumHealthyPercent;

  DeploymentConfiguration({
    this.deploymentCircuitBreaker,
    this.maximumPercent,
    this.minimumHealthyPercent,
  });

  factory DeploymentConfiguration.fromJson(Map<String, dynamic> json) {
    return DeploymentConfiguration(
      deploymentCircuitBreaker: json['deploymentCircuitBreaker'] != null
          ? DeploymentCircuitBreaker.fromJson(
              json['deploymentCircuitBreaker'] as Map<String, dynamic>)
          : null,
      maximumPercent: json['maximumPercent'] as int?,
      minimumHealthyPercent: json['minimumHealthyPercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentCircuitBreaker = this.deploymentCircuitBreaker;
    final maximumPercent = this.maximumPercent;
    final minimumHealthyPercent = this.minimumHealthyPercent;
    return {
      if (deploymentCircuitBreaker != null)
        'deploymentCircuitBreaker': deploymentCircuitBreaker,
      if (maximumPercent != null) 'maximumPercent': maximumPercent,
      if (minimumHealthyPercent != null)
        'minimumHealthyPercent': minimumHealthyPercent,
    };
  }
}

/// The deployment controller to use for the service. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
/// ECS Deployment Types</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
class DeploymentController {
  /// The deployment controller type to use.
  ///
  /// There are three deployment controller types available:
  /// <dl> <dt>ECS</dt> <dd>
  /// The rolling update (<code>ECS</code>) deployment type involves replacing the
  /// current running version of the container with the latest version. The number
  /// of containers Amazon ECS adds or removes from the service during a rolling
  /// update is controlled by adjusting the minimum and maximum number of healthy
  /// tasks allowed during a service deployment, as specified in the
  /// <a>DeploymentConfiguration</a>.
  /// </dd> <dt>CODE_DEPLOY</dt> <dd>
  /// The blue/green (<code>CODE_DEPLOY</code>) deployment type uses the
  /// blue/green deployment model powered by AWS CodeDeploy, which allows you to
  /// verify a new deployment of a service before sending production traffic to
  /// it.
  /// </dd> <dt>EXTERNAL</dt> <dd>
  /// The external (<code>EXTERNAL</code>) deployment type enables you to use any
  /// third-party deployment controller for full control over the deployment
  /// process for an Amazon ECS service.
  /// </dd> </dl>
  final DeploymentControllerType type;

  DeploymentController({
    required this.type,
  });

  factory DeploymentController.fromJson(Map<String, dynamic> json) {
    return DeploymentController(
      type: (json['type'] as String).toDeploymentControllerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
}

enum DeploymentControllerType {
  ecs,
  codeDeploy,
  external,
}

extension on DeploymentControllerType {
  String toValue() {
    switch (this) {
      case DeploymentControllerType.ecs:
        return 'ECS';
      case DeploymentControllerType.codeDeploy:
        return 'CODE_DEPLOY';
      case DeploymentControllerType.external:
        return 'EXTERNAL';
    }
  }
}

extension on String {
  DeploymentControllerType toDeploymentControllerType() {
    switch (this) {
      case 'ECS':
        return DeploymentControllerType.ecs;
      case 'CODE_DEPLOY':
        return DeploymentControllerType.codeDeploy;
      case 'EXTERNAL':
        return DeploymentControllerType.external;
    }
    throw Exception('$this is not known in enum DeploymentControllerType');
  }
}

enum DeploymentRolloutState {
  completed,
  failed,
  inProgress,
}

extension on DeploymentRolloutState {
  String toValue() {
    switch (this) {
      case DeploymentRolloutState.completed:
        return 'COMPLETED';
      case DeploymentRolloutState.failed:
        return 'FAILED';
      case DeploymentRolloutState.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension on String {
  DeploymentRolloutState toDeploymentRolloutState() {
    switch (this) {
      case 'COMPLETED':
        return DeploymentRolloutState.completed;
      case 'FAILED':
        return DeploymentRolloutState.failed;
      case 'IN_PROGRESS':
        return DeploymentRolloutState.inProgress;
    }
    throw Exception('$this is not known in enum DeploymentRolloutState');
  }
}

class DeregisterContainerInstanceResponse {
  /// The container instance that was deregistered.
  final ContainerInstance? containerInstance;

  DeregisterContainerInstanceResponse({
    this.containerInstance,
  });

  factory DeregisterContainerInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeregisterContainerInstanceResponse(
      containerInstance: json['containerInstance'] != null
          ? ContainerInstance.fromJson(
              json['containerInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstance = this.containerInstance;
    return {
      if (containerInstance != null) 'containerInstance': containerInstance,
    };
  }
}

class DeregisterTaskDefinitionResponse {
  /// The full description of the deregistered task.
  final TaskDefinition? taskDefinition;

  DeregisterTaskDefinitionResponse({
    this.taskDefinition,
  });

  factory DeregisterTaskDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterTaskDefinitionResponse(
      taskDefinition: json['taskDefinition'] != null
          ? TaskDefinition.fromJson(
              json['taskDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskDefinition = this.taskDefinition;
    return {
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
    };
  }
}

class DescribeCapacityProvidersResponse {
  /// The list of capacity providers.
  final List<CapacityProvider>? capacityProviders;

  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeCapacityProviders</code> request. When the results of a
  /// <code>DescribeCapacityProviders</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  DescribeCapacityProvidersResponse({
    this.capacityProviders,
    this.failures,
    this.nextToken,
  });

  factory DescribeCapacityProvidersResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCapacityProvidersResponse(
      capacityProviders: (json['capacityProviders'] as List?)
          ?.whereNotNull()
          .map((e) => CapacityProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviders = this.capacityProviders;
    final failures = this.failures;
    final nextToken = this.nextToken;
    return {
      if (capacityProviders != null) 'capacityProviders': capacityProviders,
      if (failures != null) 'failures': failures,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeClustersResponse {
  /// The list of clusters.
  final List<Cluster>? clusters;

  /// Any failures associated with the call.
  final List<Failure>? failures;

  DescribeClustersResponse({
    this.clusters,
    this.failures,
  });

  factory DescribeClustersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClustersResponse(
      clusters: (json['clusters'] as List?)
          ?.whereNotNull()
          .map((e) => Cluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final failures = this.failures;
    return {
      if (clusters != null) 'clusters': clusters,
      if (failures != null) 'failures': failures,
    };
  }
}

class DescribeContainerInstancesResponse {
  /// The list of container instances.
  final List<ContainerInstance>? containerInstances;

  /// Any failures associated with the call.
  final List<Failure>? failures;

  DescribeContainerInstancesResponse({
    this.containerInstances,
    this.failures,
  });

  factory DescribeContainerInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeContainerInstancesResponse(
      containerInstances: (json['containerInstances'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstances = this.containerInstances;
    final failures = this.failures;
    return {
      if (containerInstances != null) 'containerInstances': containerInstances,
      if (failures != null) 'failures': failures,
    };
  }
}

class DescribeServicesResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// The list of services described.
  final List<Service>? services;

  DescribeServicesResponse({
    this.failures,
    this.services,
  });

  factory DescribeServicesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServicesResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final services = this.services;
    return {
      if (failures != null) 'failures': failures,
      if (services != null) 'services': services,
    };
  }
}

class DescribeTaskDefinitionResponse {
  /// The metadata that is applied to the task definition to help you categorize
  /// and organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The full task definition description.
  final TaskDefinition? taskDefinition;

  DescribeTaskDefinitionResponse({
    this.tags,
    this.taskDefinition,
  });

  factory DescribeTaskDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskDefinitionResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDefinition: json['taskDefinition'] != null
          ? TaskDefinition.fromJson(
              json['taskDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final taskDefinition = this.taskDefinition;
    return {
      if (tags != null) 'tags': tags,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
    };
  }
}

class DescribeTaskSetsResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// The list of task sets described.
  final List<TaskSet>? taskSets;

  DescribeTaskSetsResponse({
    this.failures,
    this.taskSets,
  });

  factory DescribeTaskSetsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTaskSetsResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskSets: (json['taskSets'] as List?)
          ?.whereNotNull()
          .map((e) => TaskSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final taskSets = this.taskSets;
    return {
      if (failures != null) 'failures': failures,
      if (taskSets != null) 'taskSets': taskSets,
    };
  }
}

class DescribeTasksResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// The list of tasks.
  final List<Task>? tasks;

  DescribeTasksResponse({
    this.failures,
    this.tasks,
  });

  factory DescribeTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTasksResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final tasks = this.tasks;
    return {
      if (failures != null) 'failures': failures,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

enum DesiredStatus {
  running,
  pending,
  stopped,
}

extension on DesiredStatus {
  String toValue() {
    switch (this) {
      case DesiredStatus.running:
        return 'RUNNING';
      case DesiredStatus.pending:
        return 'PENDING';
      case DesiredStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension on String {
  DesiredStatus toDesiredStatus() {
    switch (this) {
      case 'RUNNING':
        return DesiredStatus.running;
      case 'PENDING':
        return DesiredStatus.pending;
      case 'STOPPED':
        return DesiredStatus.stopped;
    }
    throw Exception('$this is not known in enum DesiredStatus');
  }
}

/// An object representing a container instance host device.
class Device {
  /// The path for the device on the host container instance.
  final String hostPath;

  /// The path inside the container at which to expose the host device.
  final String? containerPath;

  /// The explicit permissions to provide to the container for the device. By
  /// default, the container has permissions for <code>read</code>,
  /// <code>write</code>, and <code>mknod</code> for the device.
  final List<DeviceCgroupPermission>? permissions;

  Device({
    required this.hostPath,
    this.containerPath,
    this.permissions,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      hostPath: json['hostPath'] as String,
      containerPath: json['containerPath'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toDeviceCgroupPermission())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hostPath = this.hostPath;
    final containerPath = this.containerPath;
    final permissions = this.permissions;
    return {
      'hostPath': hostPath,
      if (containerPath != null) 'containerPath': containerPath,
      if (permissions != null)
        'permissions': permissions.map((e) => e.toValue()).toList(),
    };
  }
}

enum DeviceCgroupPermission {
  read,
  write,
  mknod,
}

extension on DeviceCgroupPermission {
  String toValue() {
    switch (this) {
      case DeviceCgroupPermission.read:
        return 'read';
      case DeviceCgroupPermission.write:
        return 'write';
      case DeviceCgroupPermission.mknod:
        return 'mknod';
    }
  }
}

extension on String {
  DeviceCgroupPermission toDeviceCgroupPermission() {
    switch (this) {
      case 'read':
        return DeviceCgroupPermission.read;
      case 'write':
        return DeviceCgroupPermission.write;
      case 'mknod':
        return DeviceCgroupPermission.mknod;
    }
    throw Exception('$this is not known in enum DeviceCgroupPermission');
  }
}

class DiscoverPollEndpointResponse {
  /// The endpoint for the Amazon ECS agent to poll.
  final String? endpoint;

  /// The telemetry endpoint for the Amazon ECS agent.
  final String? telemetryEndpoint;

  DiscoverPollEndpointResponse({
    this.endpoint,
    this.telemetryEndpoint,
  });

  factory DiscoverPollEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DiscoverPollEndpointResponse(
      endpoint: json['endpoint'] as String?,
      telemetryEndpoint: json['telemetryEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final telemetryEndpoint = this.telemetryEndpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (telemetryEndpoint != null) 'telemetryEndpoint': telemetryEndpoint,
    };
  }
}

/// This parameter is specified when you are using Docker volumes. Docker
/// volumes are only supported when you are using the EC2 launch type. Windows
/// containers only support the use of the <code>local</code> driver. To use
/// bind mounts, specify a <code>host</code> instead.
class DockerVolumeConfiguration {
  /// If this value is <code>true</code>, the Docker volume is created if it does
  /// not already exist.
  /// <note>
  /// This field is only used if the <code>scope</code> is <code>shared</code>.
  /// </note>
  final bool? autoprovision;

  /// The Docker volume driver to use. The driver value must match the driver name
  /// provided by Docker because it is used for task placement. If the driver was
  /// installed using the Docker plugin CLI, use <code>docker plugin ls</code> to
  /// retrieve the driver name from your container instance. If the driver was
  /// installed using another method, use Docker plugin discovery to retrieve the
  /// driver name. For more information, see <a
  /// href="https://docs.docker.com/engine/extend/plugin_api/#plugin-discovery">Docker
  /// plugin discovery</a>. This parameter maps to <code>Driver</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/VolumeCreate">Create
  /// a volume</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>xxdriver</code> option to <a
  /// href="https://docs.docker.com/engine/reference/commandline/volume_create/">docker
  /// volume create</a>.
  final String? driver;

  /// A map of Docker driver-specific options passed through. This parameter maps
  /// to <code>DriverOpts</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/VolumeCreate">Create
  /// a volume</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>xxopt</code> option to <a
  /// href="https://docs.docker.com/engine/reference/commandline/volume_create/">docker
  /// volume create</a>.
  final Map<String, String>? driverOpts;

  /// Custom metadata to add to your Docker volume. This parameter maps to
  /// <code>Labels</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/VolumeCreate">Create
  /// a volume</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>xxlabel</code> option to <a
  /// href="https://docs.docker.com/engine/reference/commandline/volume_create/">docker
  /// volume create</a>.
  final Map<String, String>? labels;

  /// The scope for the Docker volume that determines its lifecycle. Docker
  /// volumes that are scoped to a <code>task</code> are automatically provisioned
  /// when the task starts and destroyed when the task stops. Docker volumes that
  /// are scoped as <code>shared</code> persist after the task stops.
  final Scope? scope;

  DockerVolumeConfiguration({
    this.autoprovision,
    this.driver,
    this.driverOpts,
    this.labels,
    this.scope,
  });

  factory DockerVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return DockerVolumeConfiguration(
      autoprovision: json['autoprovision'] as bool?,
      driver: json['driver'] as String?,
      driverOpts: (json['driverOpts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      scope: (json['scope'] as String?)?.toScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoprovision = this.autoprovision;
    final driver = this.driver;
    final driverOpts = this.driverOpts;
    final labels = this.labels;
    final scope = this.scope;
    return {
      if (autoprovision != null) 'autoprovision': autoprovision,
      if (driver != null) 'driver': driver,
      if (driverOpts != null) 'driverOpts': driverOpts,
      if (labels != null) 'labels': labels,
      if (scope != null) 'scope': scope.toValue(),
    };
  }
}

/// The authorization configuration details for the Amazon EFS file system.
class EFSAuthorizationConfig {
  /// The Amazon EFS access point ID to use. If an access point is specified, the
  /// root directory value specified in the <code>EFSVolumeConfiguration</code>
  /// must either be omitted or set to <code>/</code> which will enforce the path
  /// set on the EFS access point. If an access point is used, transit encryption
  /// must be enabled in the <code>EFSVolumeConfiguration</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">Working
  /// with Amazon EFS Access Points</a> in the <i>Amazon Elastic File System User
  /// Guide</i>.
  final String? accessPointId;

  /// Whether or not to use the Amazon ECS task IAM role defined in a task
  /// definition when mounting the Amazon EFS file system. If enabled, transit
  /// encryption must be enabled in the <code>EFSVolumeConfiguration</code>. If
  /// this parameter is omitted, the default value of <code>DISABLED</code> is
  /// used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html#efs-volume-accesspoints">Using
  /// Amazon EFS Access Points</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final EFSAuthorizationConfigIAM? iam;

  EFSAuthorizationConfig({
    this.accessPointId,
    this.iam,
  });

  factory EFSAuthorizationConfig.fromJson(Map<String, dynamic> json) {
    return EFSAuthorizationConfig(
      accessPointId: json['accessPointId'] as String?,
      iam: (json['iam'] as String?)?.toEFSAuthorizationConfigIAM(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointId = this.accessPointId;
    final iam = this.iam;
    return {
      if (accessPointId != null) 'accessPointId': accessPointId,
      if (iam != null) 'iam': iam.toValue(),
    };
  }
}

enum EFSAuthorizationConfigIAM {
  enabled,
  disabled,
}

extension on EFSAuthorizationConfigIAM {
  String toValue() {
    switch (this) {
      case EFSAuthorizationConfigIAM.enabled:
        return 'ENABLED';
      case EFSAuthorizationConfigIAM.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  EFSAuthorizationConfigIAM toEFSAuthorizationConfigIAM() {
    switch (this) {
      case 'ENABLED':
        return EFSAuthorizationConfigIAM.enabled;
      case 'DISABLED':
        return EFSAuthorizationConfigIAM.disabled;
    }
    throw Exception('$this is not known in enum EFSAuthorizationConfigIAM');
  }
}

enum EFSTransitEncryption {
  enabled,
  disabled,
}

extension on EFSTransitEncryption {
  String toValue() {
    switch (this) {
      case EFSTransitEncryption.enabled:
        return 'ENABLED';
      case EFSTransitEncryption.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  EFSTransitEncryption toEFSTransitEncryption() {
    switch (this) {
      case 'ENABLED':
        return EFSTransitEncryption.enabled;
      case 'DISABLED':
        return EFSTransitEncryption.disabled;
    }
    throw Exception('$this is not known in enum EFSTransitEncryption');
  }
}

/// This parameter is specified when you are using an Amazon Elastic File System
/// file system for task storage. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html">Amazon
/// EFS Volumes</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class EFSVolumeConfiguration {
  /// The Amazon EFS file system ID to use.
  final String fileSystemId;

  /// The authorization configuration details for the Amazon EFS file system.
  final EFSAuthorizationConfig? authorizationConfig;

  /// The directory within the Amazon EFS file system to mount as the root
  /// directory inside the host. If this parameter is omitted, the root of the
  /// Amazon EFS volume will be used. Specifying <code>/</code> will have the same
  /// effect as omitting this parameter.
  /// <important>
  /// If an EFS access point is specified in the <code>authorizationConfig</code>,
  /// the root directory parameter must either be omitted or set to <code>/</code>
  /// which will enforce the path set on the EFS access point.
  /// </important>
  final String? rootDirectory;

  /// Whether or not to enable encryption for Amazon EFS data in transit between
  /// the Amazon ECS host and the Amazon EFS server. Transit encryption must be
  /// enabled if Amazon EFS IAM authorization is used. If this parameter is
  /// omitted, the default value of <code>DISABLED</code> is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/encryption-in-transit.html">Encrypting
  /// Data in Transit</a> in the <i>Amazon Elastic File System User Guide</i>.
  final EFSTransitEncryption? transitEncryption;

  /// The port to use when sending encrypted data between the Amazon ECS host and
  /// the Amazon EFS server. If you do not specify a transit encryption port, it
  /// will use the port selection strategy that the Amazon EFS mount helper uses.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-mount-helper.html">EFS
  /// Mount Helper</a> in the <i>Amazon Elastic File System User Guide</i>.
  final int? transitEncryptionPort;

  EFSVolumeConfiguration({
    required this.fileSystemId,
    this.authorizationConfig,
    this.rootDirectory,
    this.transitEncryption,
    this.transitEncryptionPort,
  });

  factory EFSVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return EFSVolumeConfiguration(
      fileSystemId: json['fileSystemId'] as String,
      authorizationConfig: json['authorizationConfig'] != null
          ? EFSAuthorizationConfig.fromJson(
              json['authorizationConfig'] as Map<String, dynamic>)
          : null,
      rootDirectory: json['rootDirectory'] as String?,
      transitEncryption:
          (json['transitEncryption'] as String?)?.toEFSTransitEncryption(),
      transitEncryptionPort: json['transitEncryptionPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final authorizationConfig = this.authorizationConfig;
    final rootDirectory = this.rootDirectory;
    final transitEncryption = this.transitEncryption;
    final transitEncryptionPort = this.transitEncryptionPort;
    return {
      'fileSystemId': fileSystemId,
      if (authorizationConfig != null)
        'authorizationConfig': authorizationConfig,
      if (rootDirectory != null) 'rootDirectory': rootDirectory,
      if (transitEncryption != null)
        'transitEncryption': transitEncryption.toValue(),
      if (transitEncryptionPort != null)
        'transitEncryptionPort': transitEncryptionPort,
    };
  }
}

/// A list of files containing the environment variables to pass to a container.
/// You can specify up to ten environment files. The file must have a
/// <code>.env</code> file extension. Each line in an environment file should
/// contain an environment variable in <code>VARIABLE=VALUE</code> format. Lines
/// beginning with <code>#</code> are treated as comments and are ignored. For
/// more information on the environment variable file syntax, see <a
/// href="https://docs.docker.com/compose/env-file/">Declare default environment
/// variables in file</a>.
///
/// If there are environment variables specified using the
/// <code>environment</code> parameter in a container definition, they take
/// precedence over the variables contained within an environment file. If
/// multiple environment files are specified that contain the same variable,
/// they are processed from the top down. It is recommended to use unique
/// variable names. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/taskdef-envfiles.html">Specifying
/// environment variables</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
///
/// This field is only valid for containers in Fargate tasks that use platform
/// version <code>1.4.0</code> or later.
class EnvironmentFile {
  /// The file type to use. The only supported value is <code>s3</code>.
  final EnvironmentFileType type;

  /// The Amazon Resource Name (ARN) of the Amazon S3 object containing the
  /// environment variable file.
  final String value;

  EnvironmentFile({
    required this.type,
    required this.value,
  });

  factory EnvironmentFile.fromJson(Map<String, dynamic> json) {
    return EnvironmentFile(
      type: (json['type'] as String).toEnvironmentFileType(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

enum EnvironmentFileType {
  s3,
}

extension on EnvironmentFileType {
  String toValue() {
    switch (this) {
      case EnvironmentFileType.s3:
        return 's3';
    }
  }
}

extension on String {
  EnvironmentFileType toEnvironmentFileType() {
    switch (this) {
      case 's3':
        return EnvironmentFileType.s3;
    }
    throw Exception('$this is not known in enum EnvironmentFileType');
  }
}

/// The amount of ephemeral storage to allocate for the task. This parameter is
/// used to expand the total amount of ephemeral storage available, beyond the
/// default amount, for tasks hosted on AWS Fargate. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/userguide/using_data_volumes.html">Fargate
/// task storage</a> in the <i>Amazon ECS User Guide for AWS Fargate</i>.
/// <note>
/// This parameter is only supported for tasks hosted on AWS Fargate using
/// platform version <code>1.4.0</code> or later.
/// </note>
class EphemeralStorage {
  /// The total amount, in GiB, of ephemeral storage to set for the task. The
  /// minimum supported value is <code>21</code> GiB and the maximum supported
  /// value is <code>200</code> GiB.
  final int sizeInGiB;

  EphemeralStorage({
    required this.sizeInGiB,
  });

  factory EphemeralStorage.fromJson(Map<String, dynamic> json) {
    return EphemeralStorage(
      sizeInGiB: json['sizeInGiB'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGiB = this.sizeInGiB;
    return {
      'sizeInGiB': sizeInGiB,
    };
  }
}

/// The details of the execute command configuration.
class ExecuteCommandConfiguration {
  /// Specify an AWS Key Management Service key ID to encrypt the data between the
  /// local client and the container.
  final String? kmsKeyId;

  /// The log configuration for the results of the execute command actions. The
  /// logs can be sent to CloudWatch Logs or an Amazon S3 bucket. When
  /// <code>logging=OVERRIDE</code> is specified, a <code>logConfiguration</code>
  /// must be provided.
  final ExecuteCommandLogConfiguration? logConfiguration;

  /// The log setting to use for redirecting logs for your execute command
  /// results. The following log settings are available.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: The execute command session is not logged.
  /// </li>
  /// <li>
  /// <code>DEFAULT</code>: The <code>awslogs</code> configuration in the task
  /// definition is used. If no logging parameter is specified, it defaults to
  /// this value. If no <code>awslogs</code> log driver is configured in the task
  /// definition, the output won't be logged.
  /// </li>
  /// <li>
  /// <code>OVERRIDE</code>: Specify the logging details as a part of
  /// <code>logConfiguration</code>. If the <code>OVERRIDE</code> logging option
  /// is specified, the <code>logConfiguration</code> is required.
  /// </li>
  /// </ul>
  final ExecuteCommandLogging? logging;

  ExecuteCommandConfiguration({
    this.kmsKeyId,
    this.logConfiguration,
    this.logging,
  });

  factory ExecuteCommandConfiguration.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandConfiguration(
      kmsKeyId: json['kmsKeyId'] as String?,
      logConfiguration: json['logConfiguration'] != null
          ? ExecuteCommandLogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      logging: (json['logging'] as String?)?.toExecuteCommandLogging(),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final logConfiguration = this.logConfiguration;
    final logging = this.logging;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (logging != null) 'logging': logging.toValue(),
    };
  }
}

/// The log configuration for the results of the execute command actions. The
/// logs can be sent to CloudWatch Logs or an Amazon S3 bucket.
class ExecuteCommandLogConfiguration {
  /// Whether or not to enable encryption on the CloudWatch logs. If not
  /// specified, encryption will be disabled.
  final bool? cloudWatchEncryptionEnabled;

  /// The name of the CloudWatch log group to send logs to.
  /// <note>
  /// The CloudWatch log group must already be created.
  /// </note>
  final String? cloudWatchLogGroupName;

  /// The name of the S3 bucket to send logs to.
  /// <note>
  /// The S3 bucket must already be created.
  /// </note>
  final String? s3BucketName;

  /// Whether or not to enable encryption on the CloudWatch logs. If not
  /// specified, encryption will be disabled.
  final bool? s3EncryptionEnabled;

  /// An optional folder in the S3 bucket to place logs in.
  final String? s3KeyPrefix;

  ExecuteCommandLogConfiguration({
    this.cloudWatchEncryptionEnabled,
    this.cloudWatchLogGroupName,
    this.s3BucketName,
    this.s3EncryptionEnabled,
    this.s3KeyPrefix,
  });

  factory ExecuteCommandLogConfiguration.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandLogConfiguration(
      cloudWatchEncryptionEnabled: json['cloudWatchEncryptionEnabled'] as bool?,
      cloudWatchLogGroupName: json['cloudWatchLogGroupName'] as String?,
      s3BucketName: json['s3BucketName'] as String?,
      s3EncryptionEnabled: json['s3EncryptionEnabled'] as bool?,
      s3KeyPrefix: json['s3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchEncryptionEnabled = this.cloudWatchEncryptionEnabled;
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final s3BucketName = this.s3BucketName;
    final s3EncryptionEnabled = this.s3EncryptionEnabled;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      if (cloudWatchEncryptionEnabled != null)
        'cloudWatchEncryptionEnabled': cloudWatchEncryptionEnabled,
      if (cloudWatchLogGroupName != null)
        'cloudWatchLogGroupName': cloudWatchLogGroupName,
      if (s3BucketName != null) 's3BucketName': s3BucketName,
      if (s3EncryptionEnabled != null)
        's3EncryptionEnabled': s3EncryptionEnabled,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
    };
  }
}

enum ExecuteCommandLogging {
  none,
  $default,
  override,
}

extension on ExecuteCommandLogging {
  String toValue() {
    switch (this) {
      case ExecuteCommandLogging.none:
        return 'NONE';
      case ExecuteCommandLogging.$default:
        return 'DEFAULT';
      case ExecuteCommandLogging.override:
        return 'OVERRIDE';
    }
  }
}

extension on String {
  ExecuteCommandLogging toExecuteCommandLogging() {
    switch (this) {
      case 'NONE':
        return ExecuteCommandLogging.none;
      case 'DEFAULT':
        return ExecuteCommandLogging.$default;
      case 'OVERRIDE':
        return ExecuteCommandLogging.override;
    }
    throw Exception('$this is not known in enum ExecuteCommandLogging');
  }
}

class ExecuteCommandResponse {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// The Amazon Resource Name (ARN) of the container.
  final String? containerArn;

  /// The name of the container.
  final String? containerName;

  /// Whether or not the execute command session is running in interactive mode.
  /// Amazon ECS only supports initiating interactive sessions, so you must
  /// specify <code>true</code> for this value.
  final bool? interactive;

  /// The details of the SSM session that was created for this instance of
  /// execute-command.
  final Session? session;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  ExecuteCommandResponse({
    this.clusterArn,
    this.containerArn,
    this.containerName,
    this.interactive,
    this.session,
    this.taskArn,
  });

  factory ExecuteCommandResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteCommandResponse(
      clusterArn: json['clusterArn'] as String?,
      containerArn: json['containerArn'] as String?,
      containerName: json['containerName'] as String?,
      interactive: json['interactive'] as bool?,
      session: json['session'] != null
          ? Session.fromJson(json['session'] as Map<String, dynamic>)
          : null,
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final containerArn = this.containerArn;
    final containerName = this.containerName;
    final interactive = this.interactive;
    final session = this.session;
    final taskArn = this.taskArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (containerArn != null) 'containerArn': containerArn,
      if (containerName != null) 'containerName': containerName,
      if (interactive != null) 'interactive': interactive,
      if (session != null) 'session': session,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// The authorization configuration details for Amazon FSx for Windows File
/// Server file system. See <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FSxWindowsFileServerVolumeConfiguration.html">FSxWindowsFileServerVolumeConfiguration</a>
/// in the <i>Amazon Elastic Container Service API Reference</i>.
///
/// For more information and the input format, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html">Amazon
/// FSx for Windows File Server Volumes</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>.
class FSxWindowsFileServerAuthorizationConfig {
  /// The authorization credential option to use. The authorization credential
  /// options can be provided using either the Amazon Resource Name (ARN) of an
  /// AWS Secrets Manager secret or AWS Systems Manager Parameter Store parameter.
  /// The ARNs refer to the stored credentials.
  final String credentialsParameter;

  /// A fully qualified domain name hosted by an <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html">AWS
  /// Directory Service</a> Managed Microsoft AD (Active Directory) or self-hosted
  /// AD on Amazon EC2.
  final String domain;

  FSxWindowsFileServerAuthorizationConfig({
    required this.credentialsParameter,
    required this.domain,
  });

  factory FSxWindowsFileServerAuthorizationConfig.fromJson(
      Map<String, dynamic> json) {
    return FSxWindowsFileServerAuthorizationConfig(
      credentialsParameter: json['credentialsParameter'] as String,
      domain: json['domain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialsParameter = this.credentialsParameter;
    final domain = this.domain;
    return {
      'credentialsParameter': credentialsParameter,
      'domain': domain,
    };
  }
}

/// This parameter is specified when you are using <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html">Amazon
/// FSx for Windows File Server</a> file system for task storage.
///
/// For more information and the input format, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html">Amazon
/// FSx for Windows File Server Volumes</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>.
class FSxWindowsFileServerVolumeConfiguration {
  /// The authorization configuration details for the Amazon FSx for Windows File
  /// Server file system.
  final FSxWindowsFileServerAuthorizationConfig authorizationConfig;

  /// The Amazon FSx for Windows File Server file system ID to use.
  final String fileSystemId;

  /// The directory within the Amazon FSx for Windows File Server file system to
  /// mount as the root directory inside the host.
  final String rootDirectory;

  FSxWindowsFileServerVolumeConfiguration({
    required this.authorizationConfig,
    required this.fileSystemId,
    required this.rootDirectory,
  });

  factory FSxWindowsFileServerVolumeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FSxWindowsFileServerVolumeConfiguration(
      authorizationConfig: FSxWindowsFileServerAuthorizationConfig.fromJson(
          json['authorizationConfig'] as Map<String, dynamic>),
      fileSystemId: json['fileSystemId'] as String,
      rootDirectory: json['rootDirectory'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final fileSystemId = this.fileSystemId;
    final rootDirectory = this.rootDirectory;
    return {
      'authorizationConfig': authorizationConfig,
      'fileSystemId': fileSystemId,
      'rootDirectory': rootDirectory,
    };
  }
}

/// A failed resource. For a list of common causes, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html">API
/// failure reasons</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class Failure {
  /// The Amazon Resource Name (ARN) of the failed resource.
  final String? arn;

  /// The details of the failure.
  final String? detail;

  /// The reason for the failure.
  final String? reason;

  Failure({
    this.arn,
    this.detail,
    this.reason,
  });

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      arn: json['arn'] as String?,
      detail: json['detail'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final detail = this.detail;
    final reason = this.reason;
    return {
      if (arn != null) 'arn': arn,
      if (detail != null) 'detail': detail,
      if (reason != null) 'reason': reason,
    };
  }
}

/// The FireLens configuration for the container. This is used to specify and
/// configure a log router for container logs. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html">Custom
/// Log Routing</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class FirelensConfiguration {
  /// The log router to use. The valid values are <code>fluentd</code> or
  /// <code>fluentbit</code>.
  final FirelensConfigurationType type;

  /// The options to use when configuring the log router. This field is optional
  /// and can be used to specify a custom configuration file or to add additional
  /// metadata, such as the task, task definition, cluster, and container instance
  /// details to the log event. If specified, the syntax to use is
  /// <code>"options":{"enable-ecs-log-metadata":"true|false","config-file-type:"s3|file","config-file-value":"arn:aws:s3:::mybucket/fluent.conf|filepath"}</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html#firelens-taskdef">Creating
  /// a Task Definition that Uses a FireLens Configuration</a> in the <i>Amazon
  /// Elastic Container Service Developer Guide</i>.
  /// <note>
  /// Tasks hosted on AWS Fargate only support the <code>file</code> configuration
  /// file type.
  /// </note>
  final Map<String, String>? options;

  FirelensConfiguration({
    required this.type,
    this.options,
  });

  factory FirelensConfiguration.fromJson(Map<String, dynamic> json) {
    return FirelensConfiguration(
      type: (json['type'] as String).toFirelensConfigurationType(),
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final options = this.options;
    return {
      'type': type.toValue(),
      if (options != null) 'options': options,
    };
  }
}

enum FirelensConfigurationType {
  fluentd,
  fluentbit,
}

extension on FirelensConfigurationType {
  String toValue() {
    switch (this) {
      case FirelensConfigurationType.fluentd:
        return 'fluentd';
      case FirelensConfigurationType.fluentbit:
        return 'fluentbit';
    }
  }
}

extension on String {
  FirelensConfigurationType toFirelensConfigurationType() {
    switch (this) {
      case 'fluentd':
        return FirelensConfigurationType.fluentd;
      case 'fluentbit':
        return FirelensConfigurationType.fluentbit;
    }
    throw Exception('$this is not known in enum FirelensConfigurationType');
  }
}

/// An object representing a container health check. Health check parameters
/// that are specified in a container definition override any Docker health
/// checks that exist in the container image (such as those specified in a
/// parent image or from the image's Dockerfile).
///
/// You can view the health status of both individual containers and a task with
/// the DescribeTasks API operation or when viewing the task details in the
/// console.
///
/// The following describes the possible <code>healthStatus</code> values for a
/// container:
///
/// <ul>
/// <li>
/// <code>HEALTHY</code>-The container health check has passed successfully.
/// </li>
/// <li>
/// <code>UNHEALTHY</code>-The container health check has failed.
/// </li>
/// <li>
/// <code>UNKNOWN</code>-The container health check is being evaluated or there
/// is no container health check defined.
/// </li>
/// </ul>
/// The following describes the possible <code>healthStatus</code> values for a
/// task. The container health check status of nonessential containers do not
/// have an effect on the health status of a task.
///
/// <ul>
/// <li>
/// <code>HEALTHY</code>-All essential containers within the task have passed
/// their health checks.
/// </li>
/// <li>
/// <code>UNHEALTHY</code>-One or more essential containers have failed their
/// health check.
/// </li>
/// <li>
/// <code>UNKNOWN</code>-The essential containers within the task are still
/// having their health checks evaluated or there are no container health checks
/// defined.
/// </li>
/// </ul>
/// If a task is run manually, and not as part of a service, the task will
/// continue its lifecycle regardless of its health status. For tasks that are
/// part of a service, if the task reports as unhealthy then the task will be
/// stopped and the service scheduler will replace it.
///
/// The following are notes about container health check support:
///
/// <ul>
/// <li>
/// Container health checks require version 1.17.0 or greater of the Amazon ECS
/// container agent. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
/// the Amazon ECS Container Agent</a>.
/// </li>
/// <li>
/// Container health checks are supported for Fargate tasks if you are using
/// platform version 1.1.0 or greater. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
/// Fargate Platform Versions</a>.
/// </li>
/// <li>
/// Container health checks are not supported for tasks that are part of a
/// service that is configured to use a Classic Load Balancer.
/// </li>
/// </ul>
class HealthCheck {
  /// A string array representing the command that the container runs to determine
  /// if it is healthy. The string array must start with <code>CMD</code> to
  /// execute the command arguments directly, or <code>CMD-SHELL</code> to run the
  /// command with the container's default shell. For example:
  ///
  /// <code>[ "CMD-SHELL", "curl -f http://localhost/ || exit 1" ]</code>
  ///
  /// An exit code of 0 indicates success, and non-zero exit code indicates
  /// failure. For more information, see <code>HealthCheck</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a>.
  final List<String> command;

  /// The time period in seconds between each health check execution. You may
  /// specify between 5 and 300 seconds. The default value is 30 seconds.
  final int? interval;

  /// The number of times to retry a failed health check before the container is
  /// considered unhealthy. You may specify between 1 and 10 retries. The default
  /// value is 3.
  final int? retries;

  /// The optional grace period within which to provide containers time to
  /// bootstrap before failed health checks count towards the maximum number of
  /// retries. You may specify between 0 and 300 seconds. The
  /// <code>startPeriod</code> is disabled by default.
  /// <note>
  /// If a health check succeeds within the <code>startPeriod</code>, then the
  /// container is considered healthy and any subsequent failures count toward the
  /// maximum number of retries.
  /// </note>
  final int? startPeriod;

  /// The time period in seconds to wait for a health check to succeed before it
  /// is considered a failure. You may specify between 2 and 60 seconds. The
  /// default value is 5.
  final int? timeout;

  HealthCheck({
    required this.command,
    this.interval,
    this.retries,
    this.startPeriod,
    this.timeout,
  });

  factory HealthCheck.fromJson(Map<String, dynamic> json) {
    return HealthCheck(
      command: (json['command'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      interval: json['interval'] as int?,
      retries: json['retries'] as int?,
      startPeriod: json['startPeriod'] as int?,
      timeout: json['timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final interval = this.interval;
    final retries = this.retries;
    final startPeriod = this.startPeriod;
    final timeout = this.timeout;
    return {
      'command': command,
      if (interval != null) 'interval': interval,
      if (retries != null) 'retries': retries,
      if (startPeriod != null) 'startPeriod': startPeriod,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

enum HealthStatus {
  healthy,
  unhealthy,
  unknown,
}

extension on HealthStatus {
  String toValue() {
    switch (this) {
      case HealthStatus.healthy:
        return 'HEALTHY';
      case HealthStatus.unhealthy:
        return 'UNHEALTHY';
      case HealthStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  HealthStatus toHealthStatus() {
    switch (this) {
      case 'HEALTHY':
        return HealthStatus.healthy;
      case 'UNHEALTHY':
        return HealthStatus.unhealthy;
      case 'UNKNOWN':
        return HealthStatus.unknown;
    }
    throw Exception('$this is not known in enum HealthStatus');
  }
}

/// Hostnames and IP address entries that are added to the
/// <code>/etc/hosts</code> file of a container via the <code>extraHosts</code>
/// parameter of its <a>ContainerDefinition</a>.
class HostEntry {
  /// The hostname to use in the <code>/etc/hosts</code> entry.
  final String hostname;

  /// The IP address to use in the <code>/etc/hosts</code> entry.
  final String ipAddress;

  HostEntry({
    required this.hostname,
    required this.ipAddress,
  });

  factory HostEntry.fromJson(Map<String, dynamic> json) {
    return HostEntry(
      hostname: json['hostname'] as String,
      ipAddress: json['ipAddress'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final ipAddress = this.ipAddress;
    return {
      'hostname': hostname,
      'ipAddress': ipAddress,
    };
  }
}

/// Details on a container instance bind mount host volume.
class HostVolumeProperties {
  /// When the <code>host</code> parameter is used, specify a
  /// <code>sourcePath</code> to declare the path on the host container instance
  /// that is presented to the container. If this parameter is empty, then the
  /// Docker daemon has assigned a host path for you. If the <code>host</code>
  /// parameter contains a <code>sourcePath</code> file location, then the data
  /// volume persists at the specified location on the host container instance
  /// until you delete it manually. If the <code>sourcePath</code> value does not
  /// exist on the host container instance, the Docker daemon creates it. If the
  /// location does exist, the contents of the source path folder are exported.
  ///
  /// If you are using the Fargate launch type, the <code>sourcePath</code>
  /// parameter is not supported.
  final String? sourcePath;

  HostVolumeProperties({
    this.sourcePath,
  });

  factory HostVolumeProperties.fromJson(Map<String, dynamic> json) {
    return HostVolumeProperties(
      sourcePath: json['sourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourcePath = this.sourcePath;
    return {
      if (sourcePath != null) 'sourcePath': sourcePath,
    };
  }
}

/// Details on a Elastic Inference accelerator. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-eia.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>.
class InferenceAccelerator {
  /// The Elastic Inference accelerator device name. The <code>deviceName</code>
  /// must also be referenced in a container definition as a
  /// <a>ResourceRequirement</a>.
  final String deviceName;

  /// The Elastic Inference accelerator type to use.
  final String deviceType;

  InferenceAccelerator({
    required this.deviceName,
    required this.deviceType,
  });

  factory InferenceAccelerator.fromJson(Map<String, dynamic> json) {
    return InferenceAccelerator(
      deviceName: json['deviceName'] as String,
      deviceType: json['deviceType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final deviceType = this.deviceType;
    return {
      'deviceName': deviceName,
      'deviceType': deviceType,
    };
  }
}

/// Details on an Elastic Inference accelerator task override. This parameter is
/// used to override the Elastic Inference accelerator specified in the task
/// definition. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-eia.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>.
class InferenceAcceleratorOverride {
  /// The Elastic Inference accelerator device name to override for the task. This
  /// parameter must match a <code>deviceName</code> specified in the task
  /// definition.
  final String? deviceName;

  /// The Elastic Inference accelerator type to use.
  final String? deviceType;

  InferenceAcceleratorOverride({
    this.deviceName,
    this.deviceType,
  });

  factory InferenceAcceleratorOverride.fromJson(Map<String, dynamic> json) {
    return InferenceAcceleratorOverride(
      deviceName: json['deviceName'] as String?,
      deviceType: json['deviceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final deviceType = this.deviceType;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (deviceType != null) 'deviceType': deviceType,
    };
  }
}

enum IpcMode {
  host,
  task,
  none,
}

extension on IpcMode {
  String toValue() {
    switch (this) {
      case IpcMode.host:
        return 'host';
      case IpcMode.task:
        return 'task';
      case IpcMode.none:
        return 'none';
    }
  }
}

extension on String {
  IpcMode toIpcMode() {
    switch (this) {
      case 'host':
        return IpcMode.host;
      case 'task':
        return IpcMode.task;
      case 'none':
        return IpcMode.none;
    }
    throw Exception('$this is not known in enum IpcMode');
  }
}

/// The Linux capabilities for the container that are added to or dropped from
/// the default configuration provided by Docker. For more information on the
/// default capabilities and the non-default available capabilities, see <a
/// href="https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities">Runtime
/// privilege and Linux capabilities</a> in the <i>Docker run reference</i>. For
/// more detailed information on these Linux capabilities, see the <a
/// href="http://man7.org/linux/man-pages/man7/capabilities.7.html">capabilities(7)</a>
/// Linux manual page.
class KernelCapabilities {
  /// The Linux capabilities for the container that have been added to the default
  /// configuration provided by Docker. This parameter maps to <code>CapAdd</code>
  /// in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--cap-add</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// Tasks launched on AWS Fargate only support adding the
  /// <code>SYS_PTRACE</code> kernel capability.
  /// </note>
  /// Valid values: <code>"ALL" | "AUDIT_CONTROL" | "AUDIT_WRITE" |
  /// "BLOCK_SUSPEND" | "CHOWN" | "DAC_OVERRIDE" | "DAC_READ_SEARCH" | "FOWNER" |
  /// "FSETID" | "IPC_LOCK" | "IPC_OWNER" | "KILL" | "LEASE" | "LINUX_IMMUTABLE" |
  /// "MAC_ADMIN" | "MAC_OVERRIDE" | "MKNOD" | "NET_ADMIN" | "NET_BIND_SERVICE" |
  /// "NET_BROADCAST" | "NET_RAW" | "SETFCAP" | "SETGID" | "SETPCAP" | "SETUID" |
  /// "SYS_ADMIN" | "SYS_BOOT" | "SYS_CHROOT" | "SYS_MODULE" | "SYS_NICE" |
  /// "SYS_PACCT" | "SYS_PTRACE" | "SYS_RAWIO" | "SYS_RESOURCE" | "SYS_TIME" |
  /// "SYS_TTY_CONFIG" | "SYSLOG" | "WAKE_ALARM"</code>
  final List<String>? add;

  /// The Linux capabilities for the container that have been removed from the
  /// default configuration provided by Docker. This parameter maps to
  /// <code>CapDrop</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--cap-drop</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Valid values: <code>"ALL" | "AUDIT_CONTROL" | "AUDIT_WRITE" |
  /// "BLOCK_SUSPEND" | "CHOWN" | "DAC_OVERRIDE" | "DAC_READ_SEARCH" | "FOWNER" |
  /// "FSETID" | "IPC_LOCK" | "IPC_OWNER" | "KILL" | "LEASE" | "LINUX_IMMUTABLE" |
  /// "MAC_ADMIN" | "MAC_OVERRIDE" | "MKNOD" | "NET_ADMIN" | "NET_BIND_SERVICE" |
  /// "NET_BROADCAST" | "NET_RAW" | "SETFCAP" | "SETGID" | "SETPCAP" | "SETUID" |
  /// "SYS_ADMIN" | "SYS_BOOT" | "SYS_CHROOT" | "SYS_MODULE" | "SYS_NICE" |
  /// "SYS_PACCT" | "SYS_PTRACE" | "SYS_RAWIO" | "SYS_RESOURCE" | "SYS_TIME" |
  /// "SYS_TTY_CONFIG" | "SYSLOG" | "WAKE_ALARM"</code>
  final List<String>? drop;

  KernelCapabilities({
    this.add,
    this.drop,
  });

  factory KernelCapabilities.fromJson(Map<String, dynamic> json) {
    return KernelCapabilities(
      add: (json['add'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      drop: (json['drop'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final add = this.add;
    final drop = this.drop;
    return {
      if (add != null) 'add': add,
      if (drop != null) 'drop': drop,
    };
  }
}

/// A key-value pair object.
class KeyValuePair {
  /// The name of the key-value pair. For environment variables, this is the name
  /// of the environment variable.
  final String? name;

  /// The value of the key-value pair. For environment variables, this is the
  /// value of the environment variable.
  final String? value;

  KeyValuePair({
    this.name,
    this.value,
  });

  factory KeyValuePair.fromJson(Map<String, dynamic> json) {
    return KeyValuePair(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

enum LaunchType {
  ec2,
  fargate,
  external,
}

extension on LaunchType {
  String toValue() {
    switch (this) {
      case LaunchType.ec2:
        return 'EC2';
      case LaunchType.fargate:
        return 'FARGATE';
      case LaunchType.external:
        return 'EXTERNAL';
    }
  }
}

extension on String {
  LaunchType toLaunchType() {
    switch (this) {
      case 'EC2':
        return LaunchType.ec2;
      case 'FARGATE':
        return LaunchType.fargate;
      case 'EXTERNAL':
        return LaunchType.external;
    }
    throw Exception('$this is not known in enum LaunchType');
  }
}

/// Linux-specific options that are applied to the container, such as Linux
/// <a>KernelCapabilities</a>.
class LinuxParameters {
  /// The Linux capabilities for the container that are added to or dropped from
  /// the default configuration provided by Docker.
  /// <note>
  /// For tasks that use the Fargate launch type, <code>capabilities</code> is
  /// supported for all platform versions but the <code>add</code> parameter is
  /// only supported if using platform version 1.4.0 or later.
  /// </note>
  final KernelCapabilities? capabilities;

  /// Any host devices to expose to the container. This parameter maps to
  /// <code>Devices</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--device</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// If you are using tasks that use the Fargate launch type, the
  /// <code>devices</code> parameter is not supported.
  /// </note>
  final List<Device>? devices;

  /// Run an <code>init</code> process inside the container that forwards signals
  /// and reaps processes. This parameter maps to the <code>--init</code> option
  /// to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. This parameter requires version 1.25 of the Docker Remote API or
  /// greater on your container instance. To check the Docker Remote API version
  /// on your container instance, log in to your container instance and run the
  /// following command: <code>sudo docker version --format
  /// '{{.Server.APIVersion}}'</code>
  final bool? initProcessEnabled;

  /// The total amount of swap memory (in MiB) a container can use. This parameter
  /// will be translated to the <code>--memory-swap</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a> where the value would be the sum of the container memory plus the
  /// <code>maxSwap</code> value.
  ///
  /// If a <code>maxSwap</code> value of <code>0</code> is specified, the
  /// container will not use swap. Accepted values are <code>0</code> or any
  /// positive integer. If the <code>maxSwap</code> parameter is omitted, the
  /// container will use the swap configuration for the container instance it is
  /// running on. A <code>maxSwap</code> value must be set for the
  /// <code>swappiness</code> parameter to be used.
  /// <note>
  /// If you are using tasks that use the Fargate launch type, the
  /// <code>maxSwap</code> parameter is not supported.
  /// </note>
  final int? maxSwap;

  /// The value for the size (in MiB) of the <code>/dev/shm</code> volume. This
  /// parameter maps to the <code>--shm-size</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// If you are using tasks that use the Fargate launch type, the
  /// <code>sharedMemorySize</code> parameter is not supported.
  /// </note>
  final int? sharedMemorySize;

  /// This allows you to tune a container's memory swappiness behavior. A
  /// <code>swappiness</code> value of <code>0</code> will cause swapping to not
  /// happen unless absolutely necessary. A <code>swappiness</code> value of
  /// <code>100</code> will cause pages to be swapped very aggressively. Accepted
  /// values are whole numbers between <code>0</code> and <code>100</code>. If the
  /// <code>swappiness</code> parameter is not specified, a default value of
  /// <code>60</code> is used. If a value is not specified for
  /// <code>maxSwap</code> then this parameter is ignored. This parameter maps to
  /// the <code>--memory-swappiness</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// If you are using tasks that use the Fargate launch type, the
  /// <code>swappiness</code> parameter is not supported.
  /// </note>
  final int? swappiness;

  /// The container path, mount options, and size (in MiB) of the tmpfs mount.
  /// This parameter maps to the <code>--tmpfs</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// If you are using tasks that use the Fargate launch type, the
  /// <code>tmpfs</code> parameter is not supported.
  /// </note>
  final List<Tmpfs>? tmpfs;

  LinuxParameters({
    this.capabilities,
    this.devices,
    this.initProcessEnabled,
    this.maxSwap,
    this.sharedMemorySize,
    this.swappiness,
    this.tmpfs,
  });

  factory LinuxParameters.fromJson(Map<String, dynamic> json) {
    return LinuxParameters(
      capabilities: json['capabilities'] != null
          ? KernelCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>)
          : null,
      devices: (json['devices'] as List?)
          ?.whereNotNull()
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      initProcessEnabled: json['initProcessEnabled'] as bool?,
      maxSwap: json['maxSwap'] as int?,
      sharedMemorySize: json['sharedMemorySize'] as int?,
      swappiness: json['swappiness'] as int?,
      tmpfs: (json['tmpfs'] as List?)
          ?.whereNotNull()
          .map((e) => Tmpfs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final devices = this.devices;
    final initProcessEnabled = this.initProcessEnabled;
    final maxSwap = this.maxSwap;
    final sharedMemorySize = this.sharedMemorySize;
    final swappiness = this.swappiness;
    final tmpfs = this.tmpfs;
    return {
      if (capabilities != null) 'capabilities': capabilities,
      if (devices != null) 'devices': devices,
      if (initProcessEnabled != null) 'initProcessEnabled': initProcessEnabled,
      if (maxSwap != null) 'maxSwap': maxSwap,
      if (sharedMemorySize != null) 'sharedMemorySize': sharedMemorySize,
      if (swappiness != null) 'swappiness': swappiness,
      if (tmpfs != null) 'tmpfs': tmpfs,
    };
  }
}

class ListAccountSettingsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListAccountSettings</code> request. When the results of a
  /// <code>ListAccountSettings</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The account settings for the resource.
  final List<Setting>? settings;

  ListAccountSettingsResponse({
    this.nextToken,
    this.settings,
  });

  factory ListAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountSettingsResponse(
      nextToken: json['nextToken'] as String?,
      settings: (json['settings'] as List?)
          ?.whereNotNull()
          .map((e) => Setting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final settings = this.settings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (settings != null) 'settings': settings,
    };
  }
}

class ListAttributesResponse {
  /// A list of attribute objects that meet the criteria of the request.
  final List<Attribute>? attributes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListAttributes</code> request. When the results of a
  /// <code>ListAttributes</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory ListAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ListAttributesResponse(
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'attributes': attributes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListClustersResponse {
  /// The list of full Amazon Resource Name (ARN) entries for each cluster
  /// associated with your account.
  final List<String>? clusterArns;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListClusters</code> request. When the results of a
  /// <code>ListClusters</code> request exceed <code>maxResults</code>, this value
  /// can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListClustersResponse({
    this.clusterArns,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusterArns: (json['clusterArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArns = this.clusterArns;
    final nextToken = this.nextToken;
    return {
      if (clusterArns != null) 'clusterArns': clusterArns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListContainerInstancesResponse {
  /// The list of container instances with full ARN entries for each container
  /// instance associated with the specified cluster.
  final List<String>? containerInstanceArns;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListContainerInstances</code> request. When the results of a
  /// <code>ListContainerInstances</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListContainerInstancesResponse({
    this.containerInstanceArns,
    this.nextToken,
  });

  factory ListContainerInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListContainerInstancesResponse(
      containerInstanceArns: (json['containerInstanceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstanceArns = this.containerInstanceArns;
    final nextToken = this.nextToken;
    return {
      if (containerInstanceArns != null)
        'containerInstanceArns': containerInstanceArns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListServicesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListServices</code> request. When the results of a
  /// <code>ListServices</code> request exceed <code>maxResults</code>, this value
  /// can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The list of full ARN entries for each service associated with the specified
  /// cluster.
  final List<String>? serviceArns;

  ListServicesResponse({
    this.nextToken,
    this.serviceArns,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      nextToken: json['nextToken'] as String?,
      serviceArns: (json['serviceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceArns = this.serviceArns;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (serviceArns != null) 'serviceArns': serviceArns,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTaskDefinitionFamiliesResponse {
  /// The list of task definition family names that match the
  /// <code>ListTaskDefinitionFamilies</code> request.
  final List<String>? families;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListTaskDefinitionFamilies</code> request. When the results of a
  /// <code>ListTaskDefinitionFamilies</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  ListTaskDefinitionFamiliesResponse({
    this.families,
    this.nextToken,
  });

  factory ListTaskDefinitionFamiliesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTaskDefinitionFamiliesResponse(
      families: (json['families'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final families = this.families;
    final nextToken = this.nextToken;
    return {
      if (families != null) 'families': families,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTaskDefinitionsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListTaskDefinitions</code> request. When the results of a
  /// <code>ListTaskDefinitions</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The list of task definition Amazon Resource Name (ARN) entries for the
  /// <code>ListTaskDefinitions</code> request.
  final List<String>? taskDefinitionArns;

  ListTaskDefinitionsResponse({
    this.nextToken,
    this.taskDefinitionArns,
  });

  factory ListTaskDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTaskDefinitionsResponse(
      nextToken: json['nextToken'] as String?,
      taskDefinitionArns: (json['taskDefinitionArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskDefinitionArns = this.taskDefinitionArns;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (taskDefinitionArns != null) 'taskDefinitionArns': taskDefinitionArns,
    };
  }
}

class ListTasksResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListTasks</code> request. When the results of a <code>ListTasks</code>
  /// request exceed <code>maxResults</code>, this value can be used to retrieve
  /// the next page of results. This value is <code>null</code> when there are no
  /// more results to return.
  final String? nextToken;

  /// The list of task ARN entries for the <code>ListTasks</code> request.
  final List<String>? taskArns;

  ListTasksResponse({
    this.nextToken,
    this.taskArns,
  });

  factory ListTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListTasksResponse(
      nextToken: json['nextToken'] as String?,
      taskArns: (json['taskArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskArns = this.taskArns;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (taskArns != null) 'taskArns': taskArns,
    };
  }
}

/// The load balancer configuration to use with a service or task set.
///
/// For specific notes and restrictions regarding the use of load balancers with
/// services and task sets, see the CreateService and CreateTaskSet actions.
class LoadBalancer {
  /// The name of the container (as it appears in a container definition) to
  /// associate with the load balancer.
  final String? containerName;

  /// The port on the container to associate with the load balancer. This port
  /// must correspond to a <code>containerPort</code> in the task definition the
  /// tasks in the service are using. For tasks that use the EC2 launch type, the
  /// container instance they are launched on must allow ingress traffic on the
  /// <code>hostPort</code> of the port mapping.
  final int? containerPort;

  /// The name of the load balancer to associate with the Amazon ECS service or
  /// task set.
  ///
  /// A load balancer name is only specified when using a Classic Load Balancer.
  /// If you are using an Application Load Balancer or a Network Load Balancer the
  /// load balancer name parameter should be omitted.
  final String? loadBalancerName;

  /// The full Amazon Resource Name (ARN) of the Elastic Load Balancing target
  /// group or groups associated with a service or task set.
  ///
  /// A target group ARN is only specified when using an Application Load Balancer
  /// or Network Load Balancer. If you are using a Classic Load Balancer the
  /// target group ARN should be omitted.
  ///
  /// For services using the <code>ECS</code> deployment controller, you can
  /// specify one or multiple target groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html">Registering
  /// Multiple Target Groups with a Service</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  ///
  /// For services using the <code>CODE_DEPLOY</code> deployment controller, you
  /// are required to define two target groups for the load balancer. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-bluegreen.html">Blue/Green
  /// Deployment with CodeDeploy</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// <important>
  /// If your service's task definition uses the <code>awsvpc</code> network mode
  /// (which is required for the Fargate launch type), you must choose
  /// <code>ip</code> as the target type, not <code>instance</code>, when creating
  /// your target groups because tasks that use the <code>awsvpc</code> network
  /// mode are associated with an elastic network interface, not an Amazon EC2
  /// instance.
  /// </important>
  final String? targetGroupArn;

  LoadBalancer({
    this.containerName,
    this.containerPort,
    this.loadBalancerName,
    this.targetGroupArn,
  });

  factory LoadBalancer.fromJson(Map<String, dynamic> json) {
    return LoadBalancer(
      containerName: json['containerName'] as String?,
      containerPort: json['containerPort'] as int?,
      loadBalancerName: json['loadBalancerName'] as String?,
      targetGroupArn: json['targetGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final containerPort = this.containerPort;
    final loadBalancerName = this.loadBalancerName;
    final targetGroupArn = this.targetGroupArn;
    return {
      if (containerName != null) 'containerName': containerName,
      if (containerPort != null) 'containerPort': containerPort,
      if (loadBalancerName != null) 'loadBalancerName': loadBalancerName,
      if (targetGroupArn != null) 'targetGroupArn': targetGroupArn,
    };
  }
}

/// The log configuration for the container. This parameter maps to
/// <code>LogConfig</code> in the <a
/// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
/// a container</a> section of the <a
/// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
/// the <code>--log-driver</code> option to <a
/// href="https://docs.docker.com/engine/reference/commandline/run/">
/// <code>docker run</code> </a>.
///
/// By default, containers use the same logging driver that the Docker daemon
/// uses; however the container may use a different logging driver than the
/// Docker daemon by specifying a log driver configuration in the container
/// definition. For more information on the options for different supported log
/// drivers, see <a
/// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
/// logging drivers</a> in the Docker documentation.
///
/// The following should be noted when specifying a log configuration for your
/// containers:
///
/// <ul>
/// <li>
/// Amazon ECS currently supports a subset of the logging drivers available to
/// the Docker daemon (shown in the valid values below). Additional log drivers
/// may be available in future releases of the Amazon ECS container agent.
/// </li>
/// <li>
/// This parameter requires version 1.18 of the Docker Remote API or greater on
/// your container instance.
/// </li>
/// <li>
/// For tasks hosted on Amazon EC2 instances, the Amazon ECS container agent
/// must register the available logging drivers with the
/// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
/// containers placed on that instance can use these log configuration options.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
/// ECS container agent configuration</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>.
/// </li>
/// <li>
/// For tasks on AWS Fargate, because you do not have access to the underlying
/// infrastructure your tasks are hosted on, any additional software needed will
/// have to be installed outside of the task. For example, the Fluentd output
/// aggregators or a remote host running Logstash to send Gelf logs to.
/// </li>
/// </ul>
class LogConfiguration {
  /// The log driver to use for the container.
  ///
  /// For tasks on AWS Fargate, the supported log drivers are
  /// <code>awslogs</code>, <code>splunk</code>, and <code>awsfirelens</code>.
  ///
  /// For tasks hosted on Amazon EC2 instances, the supported log drivers are
  /// <code>awslogs</code>, <code>fluentd</code>, <code>gelf</code>,
  /// <code>json-file</code>, <code>journald</code>,
  /// <code>logentries</code>,<code>syslog</code>, <code>splunk</code>, and
  /// <code>awsfirelens</code>.
  ///
  /// For more information about using the <code>awslogs</code> log driver, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_awslogs.html">Using
  /// the awslogs log driver</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// For more information about using the <code>awsfirelens</code> log driver,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_firelens.html">Custom
  /// log routing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  /// <note>
  /// If you have a custom driver that is not listed, you can fork the Amazon ECS
  /// container agent project that is <a
  /// href="https://github.com/aws/amazon-ecs-agent">available on GitHub</a> and
  /// customize it to work with that driver. We encourage you to submit pull
  /// requests for changes that you would like to have included. However, we do
  /// not currently provide support for running modified copies of this software.
  /// </note>
  final LogDriver logDriver;

  /// The configuration options to send to the log driver. This parameter requires
  /// version 1.19 of the Docker Remote API or greater on your container instance.
  /// To check the Docker Remote API version on your container instance, log in to
  /// your container instance and run the following command: <code>sudo docker
  /// version --format '{{.Server.APIVersion}}'</code>
  final Map<String, String>? options;

  /// The secrets to pass to the log configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html">Specifying
  /// Sensitive Data</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final List<Secret>? secretOptions;

  LogConfiguration({
    required this.logDriver,
    this.options,
    this.secretOptions,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      logDriver: (json['logDriver'] as String).toLogDriver(),
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      secretOptions: (json['secretOptions'] as List?)
          ?.whereNotNull()
          .map((e) => Secret.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logDriver = this.logDriver;
    final options = this.options;
    final secretOptions = this.secretOptions;
    return {
      'logDriver': logDriver.toValue(),
      if (options != null) 'options': options,
      if (secretOptions != null) 'secretOptions': secretOptions,
    };
  }
}

enum LogDriver {
  jsonFile,
  syslog,
  journald,
  gelf,
  fluentd,
  awslogs,
  splunk,
  awsfirelens,
}

extension on LogDriver {
  String toValue() {
    switch (this) {
      case LogDriver.jsonFile:
        return 'json-file';
      case LogDriver.syslog:
        return 'syslog';
      case LogDriver.journald:
        return 'journald';
      case LogDriver.gelf:
        return 'gelf';
      case LogDriver.fluentd:
        return 'fluentd';
      case LogDriver.awslogs:
        return 'awslogs';
      case LogDriver.splunk:
        return 'splunk';
      case LogDriver.awsfirelens:
        return 'awsfirelens';
    }
  }
}

extension on String {
  LogDriver toLogDriver() {
    switch (this) {
      case 'json-file':
        return LogDriver.jsonFile;
      case 'syslog':
        return LogDriver.syslog;
      case 'journald':
        return LogDriver.journald;
      case 'gelf':
        return LogDriver.gelf;
      case 'fluentd':
        return LogDriver.fluentd;
      case 'awslogs':
        return LogDriver.awslogs;
      case 'splunk':
        return LogDriver.splunk;
      case 'awsfirelens':
        return LogDriver.awsfirelens;
    }
    throw Exception('$this is not known in enum LogDriver');
  }
}

/// Details about the managed agent status for the container.
class ManagedAgent {
  /// The Unix timestamp for when the managed agent was last started.
  final DateTime? lastStartedAt;

  /// The last known status of the managed agent.
  final String? lastStatus;

  /// The name of the managed agent. When the execute command feature is enabled,
  /// the managed agent name is <code>ExecuteCommandAgent</code>.
  final ManagedAgentName? name;

  /// The reason for why the managed agent is in the state it is in.
  final String? reason;

  ManagedAgent({
    this.lastStartedAt,
    this.lastStatus,
    this.name,
    this.reason,
  });

  factory ManagedAgent.fromJson(Map<String, dynamic> json) {
    return ManagedAgent(
      lastStartedAt: timeStampFromJson(json['lastStartedAt']),
      lastStatus: json['lastStatus'] as String?,
      name: (json['name'] as String?)?.toManagedAgentName(),
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastStartedAt = this.lastStartedAt;
    final lastStatus = this.lastStatus;
    final name = this.name;
    final reason = this.reason;
    return {
      if (lastStartedAt != null)
        'lastStartedAt': unixTimestampToJson(lastStartedAt),
      if (lastStatus != null) 'lastStatus': lastStatus,
      if (name != null) 'name': name.toValue(),
      if (reason != null) 'reason': reason,
    };
  }
}

enum ManagedAgentName {
  executeCommandAgent,
}

extension on ManagedAgentName {
  String toValue() {
    switch (this) {
      case ManagedAgentName.executeCommandAgent:
        return 'ExecuteCommandAgent';
    }
  }
}

extension on String {
  ManagedAgentName toManagedAgentName() {
    switch (this) {
      case 'ExecuteCommandAgent':
        return ManagedAgentName.executeCommandAgent;
    }
    throw Exception('$this is not known in enum ManagedAgentName');
  }
}

/// An object representing a change in state for a managed agent.
class ManagedAgentStateChange {
  /// The name of the container associated with the managed agent.
  final String containerName;

  /// The name of the managed agent.
  final ManagedAgentName managedAgentName;

  /// The status of the managed agent.
  final String status;

  /// The reason for the status of the managed agent.
  final String? reason;

  ManagedAgentStateChange({
    required this.containerName,
    required this.managedAgentName,
    required this.status,
    this.reason,
  });

  factory ManagedAgentStateChange.fromJson(Map<String, dynamic> json) {
    return ManagedAgentStateChange(
      containerName: json['containerName'] as String,
      managedAgentName:
          (json['managedAgentName'] as String).toManagedAgentName(),
      status: json['status'] as String,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final managedAgentName = this.managedAgentName;
    final status = this.status;
    final reason = this.reason;
    return {
      'containerName': containerName,
      'managedAgentName': managedAgentName.toValue(),
      'status': status,
      if (reason != null) 'reason': reason,
    };
  }
}

/// The managed scaling settings for the Auto Scaling group capacity provider.
///
/// When managed scaling is enabled, Amazon ECS manages the scale-in and
/// scale-out actions of the Auto Scaling group. Amazon ECS manages a target
/// tracking scaling policy using an Amazon ECS-managed CloudWatch metric with
/// the specified <code>targetCapacity</code> value as the target value for the
/// metric. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/asg-capacity-providers.html#asg-capacity-providers-managed-scaling">Using
/// Managed Scaling</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
///
/// If managed scaling is disabled, the user must manage the scaling of the Auto
/// Scaling group.
class ManagedScaling {
  /// The period of time, in seconds, after a newly launched Amazon EC2 instance
  /// can contribute to CloudWatch metrics for Auto Scaling group. If this
  /// parameter is omitted, the default value of <code>300</code> seconds is used.
  final int? instanceWarmupPeriod;

  /// The maximum number of container instances that Amazon ECS will scale in or
  /// scale out at one time. If this parameter is omitted, the default value of
  /// <code>10000</code> is used.
  final int? maximumScalingStepSize;

  /// The minimum number of container instances that Amazon ECS will scale in or
  /// scale out at one time. If this parameter is omitted, the default value of
  /// <code>1</code> is used.
  final int? minimumScalingStepSize;

  /// Whether or not to enable managed scaling for the capacity provider.
  final ManagedScalingStatus? status;

  /// The target capacity value for the capacity provider. The specified value
  /// must be greater than <code>0</code> and less than or equal to
  /// <code>100</code>. A value of <code>100</code> will result in the Amazon EC2
  /// instances in your Auto Scaling group being completely utilized.
  final int? targetCapacity;

  ManagedScaling({
    this.instanceWarmupPeriod,
    this.maximumScalingStepSize,
    this.minimumScalingStepSize,
    this.status,
    this.targetCapacity,
  });

  factory ManagedScaling.fromJson(Map<String, dynamic> json) {
    return ManagedScaling(
      instanceWarmupPeriod: json['instanceWarmupPeriod'] as int?,
      maximumScalingStepSize: json['maximumScalingStepSize'] as int?,
      minimumScalingStepSize: json['minimumScalingStepSize'] as int?,
      status: (json['status'] as String?)?.toManagedScalingStatus(),
      targetCapacity: json['targetCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceWarmupPeriod = this.instanceWarmupPeriod;
    final maximumScalingStepSize = this.maximumScalingStepSize;
    final minimumScalingStepSize = this.minimumScalingStepSize;
    final status = this.status;
    final targetCapacity = this.targetCapacity;
    return {
      if (instanceWarmupPeriod != null)
        'instanceWarmupPeriod': instanceWarmupPeriod,
      if (maximumScalingStepSize != null)
        'maximumScalingStepSize': maximumScalingStepSize,
      if (minimumScalingStepSize != null)
        'minimumScalingStepSize': minimumScalingStepSize,
      if (status != null) 'status': status.toValue(),
      if (targetCapacity != null) 'targetCapacity': targetCapacity,
    };
  }
}

enum ManagedScalingStatus {
  enabled,
  disabled,
}

extension on ManagedScalingStatus {
  String toValue() {
    switch (this) {
      case ManagedScalingStatus.enabled:
        return 'ENABLED';
      case ManagedScalingStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  ManagedScalingStatus toManagedScalingStatus() {
    switch (this) {
      case 'ENABLED':
        return ManagedScalingStatus.enabled;
      case 'DISABLED':
        return ManagedScalingStatus.disabled;
    }
    throw Exception('$this is not known in enum ManagedScalingStatus');
  }
}

enum ManagedTerminationProtection {
  enabled,
  disabled,
}

extension on ManagedTerminationProtection {
  String toValue() {
    switch (this) {
      case ManagedTerminationProtection.enabled:
        return 'ENABLED';
      case ManagedTerminationProtection.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  ManagedTerminationProtection toManagedTerminationProtection() {
    switch (this) {
      case 'ENABLED':
        return ManagedTerminationProtection.enabled;
      case 'DISABLED':
        return ManagedTerminationProtection.disabled;
    }
    throw Exception('$this is not known in enum ManagedTerminationProtection');
  }
}

/// Details on a volume mount point that is used in a container definition.
class MountPoint {
  /// The path on the container to mount the host volume at.
  final String? containerPath;

  /// If this value is <code>true</code>, the container has read-only access to
  /// the volume. If this value is <code>false</code>, then the container can
  /// write to the volume. The default value is <code>false</code>.
  final bool? readOnly;

  /// The name of the volume to mount. Must be a volume name referenced in the
  /// <code>name</code> parameter of task definition <code>volume</code>.
  final String? sourceVolume;

  MountPoint({
    this.containerPath,
    this.readOnly,
    this.sourceVolume,
  });

  factory MountPoint.fromJson(Map<String, dynamic> json) {
    return MountPoint(
      containerPath: json['containerPath'] as String?,
      readOnly: json['readOnly'] as bool?,
      sourceVolume: json['sourceVolume'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerPath = this.containerPath;
    final readOnly = this.readOnly;
    final sourceVolume = this.sourceVolume;
    return {
      if (containerPath != null) 'containerPath': containerPath,
      if (readOnly != null) 'readOnly': readOnly,
      if (sourceVolume != null) 'sourceVolume': sourceVolume,
    };
  }
}

/// Details on the network bindings between a container and its host container
/// instance. After a task reaches the <code>RUNNING</code> status, manual and
/// automatic host and container port assignments are visible in the
/// <code>networkBindings</code> section of <a>DescribeTasks</a> API responses.
class NetworkBinding {
  /// The IP address that the container is bound to on the container instance.
  final String? bindIP;

  /// The port number on the container that is used with the network binding.
  final int? containerPort;

  /// The port number on the host that is used with the network binding.
  final int? hostPort;

  /// The protocol used for the network binding.
  final TransportProtocol? protocol;

  NetworkBinding({
    this.bindIP,
    this.containerPort,
    this.hostPort,
    this.protocol,
  });

  factory NetworkBinding.fromJson(Map<String, dynamic> json) {
    return NetworkBinding(
      bindIP: json['bindIP'] as String?,
      containerPort: json['containerPort'] as int?,
      hostPort: json['hostPort'] as int?,
      protocol: (json['protocol'] as String?)?.toTransportProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final bindIP = this.bindIP;
    final containerPort = this.containerPort;
    final hostPort = this.hostPort;
    final protocol = this.protocol;
    return {
      if (bindIP != null) 'bindIP': bindIP,
      if (containerPort != null) 'containerPort': containerPort,
      if (hostPort != null) 'hostPort': hostPort,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

/// An object representing the network configuration for a task or service.
class NetworkConfiguration {
  /// The VPC subnets and security groups associated with a task.
  /// <note>
  /// All specified subnets and security groups must be from the same VPC.
  /// </note>
  final AwsVpcConfiguration? awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      awsvpcConfiguration: json['awsvpcConfiguration'] != null
          ? AwsVpcConfiguration.fromJson(
              json['awsvpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsvpcConfiguration = this.awsvpcConfiguration;
    return {
      if (awsvpcConfiguration != null)
        'awsvpcConfiguration': awsvpcConfiguration,
    };
  }
}

/// An object representing the elastic network interface for tasks that use the
/// <code>awsvpc</code> network mode.
class NetworkInterface {
  /// The attachment ID for the network interface.
  final String? attachmentId;

  /// The private IPv6 address for the network interface.
  final String? ipv6Address;

  /// The private IPv4 address for the network interface.
  final String? privateIpv4Address;

  NetworkInterface({
    this.attachmentId,
    this.ipv6Address,
    this.privateIpv4Address,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      attachmentId: json['attachmentId'] as String?,
      ipv6Address: json['ipv6Address'] as String?,
      privateIpv4Address: json['privateIpv4Address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final ipv6Address = this.ipv6Address;
    final privateIpv4Address = this.privateIpv4Address;
    return {
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (privateIpv4Address != null) 'privateIpv4Address': privateIpv4Address,
    };
  }
}

enum NetworkMode {
  bridge,
  host,
  awsvpc,
  none,
}

extension on NetworkMode {
  String toValue() {
    switch (this) {
      case NetworkMode.bridge:
        return 'bridge';
      case NetworkMode.host:
        return 'host';
      case NetworkMode.awsvpc:
        return 'awsvpc';
      case NetworkMode.none:
        return 'none';
    }
  }
}

extension on String {
  NetworkMode toNetworkMode() {
    switch (this) {
      case 'bridge':
        return NetworkMode.bridge;
      case 'host':
        return NetworkMode.host;
      case 'awsvpc':
        return NetworkMode.awsvpc;
      case 'none':
        return NetworkMode.none;
    }
    throw Exception('$this is not known in enum NetworkMode');
  }
}

enum PidMode {
  host,
  task,
}

extension on PidMode {
  String toValue() {
    switch (this) {
      case PidMode.host:
        return 'host';
      case PidMode.task:
        return 'task';
    }
  }
}

extension on String {
  PidMode toPidMode() {
    switch (this) {
      case 'host':
        return PidMode.host;
      case 'task':
        return PidMode.task;
    }
    throw Exception('$this is not known in enum PidMode');
  }
}

/// An object representing a constraint on task placement. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// Placement Constraints</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// If you are using the Fargate launch type, task placement constraints are not
/// supported.
/// </note>
class PlacementConstraint {
  /// A cluster query language expression to apply to the constraint. You cannot
  /// specify an expression if the constraint type is
  /// <code>distinctInstance</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// Query Language</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? expression;

  /// The type of constraint. Use <code>distinctInstance</code> to ensure that
  /// each task in a particular group is running on a different container
  /// instance. Use <code>memberOf</code> to restrict the selection to a group of
  /// valid candidates.
  final PlacementConstraintType? type;

  PlacementConstraint({
    this.expression,
    this.type,
  });

  factory PlacementConstraint.fromJson(Map<String, dynamic> json) {
    return PlacementConstraint(
      expression: json['expression'] as String?,
      type: (json['type'] as String?)?.toPlacementConstraintType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementConstraintType {
  distinctInstance,
  memberOf,
}

extension on PlacementConstraintType {
  String toValue() {
    switch (this) {
      case PlacementConstraintType.distinctInstance:
        return 'distinctInstance';
      case PlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension on String {
  PlacementConstraintType toPlacementConstraintType() {
    switch (this) {
      case 'distinctInstance':
        return PlacementConstraintType.distinctInstance;
      case 'memberOf':
        return PlacementConstraintType.memberOf;
    }
    throw Exception('$this is not known in enum PlacementConstraintType');
  }
}

/// The task placement strategy for a task or service. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html">Task
/// Placement Strategies</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
class PlacementStrategy {
  /// The field to apply the placement strategy against. For the
  /// <code>spread</code> placement strategy, valid values are
  /// <code>instanceId</code> (or <code>host</code>, which has the same effect),
  /// or any platform or custom attribute that is applied to a container instance,
  /// such as <code>attribute:ecs.availability-zone</code>. For the
  /// <code>binpack</code> placement strategy, valid values are <code>cpu</code>
  /// and <code>memory</code>. For the <code>random</code> placement strategy,
  /// this field is not used.
  final String? field;

  /// The type of placement strategy. The <code>random</code> placement strategy
  /// randomly places tasks on available candidates. The <code>spread</code>
  /// placement strategy spreads placement across available candidates evenly
  /// based on the <code>field</code> parameter. The <code>binpack</code> strategy
  /// places tasks on available candidates that have the least available amount of
  /// the resource that is specified with the <code>field</code> parameter. For
  /// example, if you binpack on memory, a task is placed on the instance with the
  /// least amount of remaining memory (but still enough to run the task).
  final PlacementStrategyType? type;

  PlacementStrategy({
    this.field,
    this.type,
  });

  factory PlacementStrategy.fromJson(Map<String, dynamic> json) {
    return PlacementStrategy(
      field: json['field'] as String?,
      type: (json['type'] as String?)?.toPlacementStrategyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    return {
      if (field != null) 'field': field,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementStrategyType {
  random,
  spread,
  binpack,
}

extension on PlacementStrategyType {
  String toValue() {
    switch (this) {
      case PlacementStrategyType.random:
        return 'random';
      case PlacementStrategyType.spread:
        return 'spread';
      case PlacementStrategyType.binpack:
        return 'binpack';
    }
  }
}

extension on String {
  PlacementStrategyType toPlacementStrategyType() {
    switch (this) {
      case 'random':
        return PlacementStrategyType.random;
      case 'spread':
        return PlacementStrategyType.spread;
      case 'binpack':
        return PlacementStrategyType.binpack;
    }
    throw Exception('$this is not known in enum PlacementStrategyType');
  }
}

/// The devices that are available on the container instance. The only supported
/// device type is a GPU.
class PlatformDevice {
  /// The ID for the GPU(s) on the container instance. The available GPU IDs can
  /// also be obtained on the container instance in the
  /// <code>/var/lib/ecs/gpu/nvidia_gpu_info.json</code> file.
  final String id;

  /// The type of device that is available on the container instance. The only
  /// supported value is <code>GPU</code>.
  final PlatformDeviceType type;

  PlatformDevice({
    required this.id,
    required this.type,
  });

  factory PlatformDevice.fromJson(Map<String, dynamic> json) {
    return PlatformDevice(
      id: json['id'] as String,
      type: (json['type'] as String).toPlatformDeviceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.toValue(),
    };
  }
}

enum PlatformDeviceType {
  gpu,
}

extension on PlatformDeviceType {
  String toValue() {
    switch (this) {
      case PlatformDeviceType.gpu:
        return 'GPU';
    }
  }
}

extension on String {
  PlatformDeviceType toPlatformDeviceType() {
    switch (this) {
      case 'GPU':
        return PlatformDeviceType.gpu;
    }
    throw Exception('$this is not known in enum PlatformDeviceType');
  }
}

/// Port mappings allow containers to access ports on the host container
/// instance to send or receive traffic. Port mappings are specified as part of
/// the container definition.
///
/// If you are using containers in a task with the <code>awsvpc</code> or
/// <code>host</code> network mode, exposed ports should be specified using
/// <code>containerPort</code>. The <code>hostPort</code> can be left blank or
/// it must be the same value as the <code>containerPort</code>.
/// <note>
/// You cannot expose the same container port for multiple protocols. An error
/// will be returned if this is attempted
/// </note>
/// After a task reaches the <code>RUNNING</code> status, manual and automatic
/// host and container port assignments are visible in the
/// <code>networkBindings</code> section of <a>DescribeTasks</a> API responses.
class PortMapping {
  /// The port number on the container that is bound to the user-specified or
  /// automatically assigned host port.
  ///
  /// If you are using containers in a task with the <code>awsvpc</code> or
  /// <code>host</code> network mode, exposed ports should be specified using
  /// <code>containerPort</code>.
  ///
  /// If you are using containers in a task with the <code>bridge</code> network
  /// mode and you specify a container port and not a host port, your container
  /// automatically receives a host port in the ephemeral port range. For more
  /// information, see <code>hostPort</code>. Port mappings that are automatically
  /// assigned in this way do not count toward the 100 reserved ports limit of a
  /// container instance.
  final int? containerPort;

  /// The port number on the container instance to reserve for your container.
  ///
  /// If you are using containers in a task with the <code>awsvpc</code> or
  /// <code>host</code> network mode, the <code>hostPort</code> can either be left
  /// blank or set to the same value as the <code>containerPort</code>.
  ///
  /// If you are using containers in a task with the <code>bridge</code> network
  /// mode, you can specify a non-reserved host port for your container port
  /// mapping, or you can omit the <code>hostPort</code> (or set it to
  /// <code>0</code>) while specifying a <code>containerPort</code> and your
  /// container automatically receives a port in the ephemeral port range for your
  /// container instance operating system and Docker version.
  ///
  /// The default ephemeral port range for Docker version 1.6.0 and later is
  /// listed on the instance under
  /// <code>/proc/sys/net/ipv4/ip_local_port_range</code>. If this kernel
  /// parameter is unavailable, the default ephemeral port range from 49153
  /// through 65535 is used. Do not attempt to specify a host port in the
  /// ephemeral port range as these are reserved for automatic assignment. In
  /// general, ports below 32768 are outside of the ephemeral port range.
  /// <note>
  /// The default ephemeral port range from 49153 through 65535 is always used for
  /// Docker versions before 1.6.0.
  /// </note>
  /// The default reserved ports are 22 for SSH, the Docker ports 2375 and 2376,
  /// and the Amazon ECS container agent ports 51678-51680. Any host port that was
  /// previously specified in a running task is also reserved while the task is
  /// running (after a task stops, the host port is released). The current
  /// reserved ports are displayed in the <code>remainingResources</code> of
  /// <a>DescribeContainerInstances</a> output. A container instance can have up
  /// to 100 reserved ports at a time, including the default reserved ports.
  /// Automatically assigned ports don't count toward the 100 reserved ports
  /// limit.
  final int? hostPort;

  /// The protocol used for the port mapping. Valid values are <code>tcp</code>
  /// and <code>udp</code>. The default is <code>tcp</code>.
  final TransportProtocol? protocol;

  PortMapping({
    this.containerPort,
    this.hostPort,
    this.protocol,
  });

  factory PortMapping.fromJson(Map<String, dynamic> json) {
    return PortMapping(
      containerPort: json['containerPort'] as int?,
      hostPort: json['hostPort'] as int?,
      protocol: (json['protocol'] as String?)?.toTransportProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerPort = this.containerPort;
    final hostPort = this.hostPort;
    final protocol = this.protocol;
    return {
      if (containerPort != null) 'containerPort': containerPort,
      if (hostPort != null) 'hostPort': hostPort,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

enum PropagateTags {
  taskDefinition,
  service,
}

extension on PropagateTags {
  String toValue() {
    switch (this) {
      case PropagateTags.taskDefinition:
        return 'TASK_DEFINITION';
      case PropagateTags.service:
        return 'SERVICE';
    }
  }
}

extension on String {
  PropagateTags toPropagateTags() {
    switch (this) {
      case 'TASK_DEFINITION':
        return PropagateTags.taskDefinition;
      case 'SERVICE':
        return PropagateTags.service;
    }
    throw Exception('$this is not known in enum PropagateTags');
  }
}

/// The configuration details for the App Mesh proxy.
///
/// For tasks using the EC2 launch type, the container instances require at
/// least version 1.26.0 of the container agent and at least version 1.26.0-1 of
/// the <code>ecs-init</code> package to enable a proxy configuration. If your
/// container instances are launched from the Amazon ECS-optimized AMI version
/// <code>20190301</code> or later, then they contain the required versions of
/// the container agent and <code>ecs-init</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
/// ECS-optimized Linux AMI</a>
class ProxyConfiguration {
  /// The name of the container that will serve as the App Mesh proxy.
  final String containerName;

  /// The set of network configuration parameters to provide the Container Network
  /// Interface (CNI) plugin, specified as key-value pairs.
  ///
  /// <ul>
  /// <li>
  /// <code>IgnoredUID</code> - (Required) The user ID (UID) of the proxy
  /// container as defined by the <code>user</code> parameter in a container
  /// definition. This is used to ensure the proxy ignores its own traffic. If
  /// <code>IgnoredGID</code> is specified, this field can be empty.
  /// </li>
  /// <li>
  /// <code>IgnoredGID</code> - (Required) The group ID (GID) of the proxy
  /// container as defined by the <code>user</code> parameter in a container
  /// definition. This is used to ensure the proxy ignores its own traffic. If
  /// <code>IgnoredUID</code> is specified, this field can be empty.
  /// </li>
  /// <li>
  /// <code>AppPorts</code> - (Required) The list of ports that the application
  /// uses. Network traffic to these ports is forwarded to the
  /// <code>ProxyIngressPort</code> and <code>ProxyEgressPort</code>.
  /// </li>
  /// <li>
  /// <code>ProxyIngressPort</code> - (Required) Specifies the port that incoming
  /// traffic to the <code>AppPorts</code> is directed to.
  /// </li>
  /// <li>
  /// <code>ProxyEgressPort</code> - (Required) Specifies the port that outgoing
  /// traffic from the <code>AppPorts</code> is directed to.
  /// </li>
  /// <li>
  /// <code>EgressIgnoredPorts</code> - (Required) The egress traffic going to the
  /// specified ports is ignored and not redirected to the
  /// <code>ProxyEgressPort</code>. It can be an empty list.
  /// </li>
  /// <li>
  /// <code>EgressIgnoredIPs</code> - (Required) The egress traffic going to the
  /// specified IP addresses is ignored and not redirected to the
  /// <code>ProxyEgressPort</code>. It can be an empty list.
  /// </li>
  /// </ul>
  final List<KeyValuePair>? properties;

  /// The proxy type. The only supported value is <code>APPMESH</code>.
  final ProxyConfigurationType? type;

  ProxyConfiguration({
    required this.containerName,
    this.properties,
    this.type,
  });

  factory ProxyConfiguration.fromJson(Map<String, dynamic> json) {
    return ProxyConfiguration(
      containerName: json['containerName'] as String,
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.toProxyConfigurationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final properties = this.properties;
    final type = this.type;
    return {
      'containerName': containerName,
      if (properties != null) 'properties': properties,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ProxyConfigurationType {
  appmesh,
}

extension on ProxyConfigurationType {
  String toValue() {
    switch (this) {
      case ProxyConfigurationType.appmesh:
        return 'APPMESH';
    }
  }
}

extension on String {
  ProxyConfigurationType toProxyConfigurationType() {
    switch (this) {
      case 'APPMESH':
        return ProxyConfigurationType.appmesh;
    }
    throw Exception('$this is not known in enum ProxyConfigurationType');
  }
}

class PutAccountSettingDefaultResponse {
  /// The current setting for a resource.
  final Setting? setting;

  PutAccountSettingDefaultResponse({
    this.setting,
  });

  factory PutAccountSettingDefaultResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountSettingDefaultResponse(
      setting: json['setting'] != null
          ? Setting.fromJson(json['setting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final setting = this.setting;
    return {
      if (setting != null) 'setting': setting,
    };
  }
}

class PutAccountSettingResponse {
  /// The current account setting for a resource.
  final Setting? setting;

  PutAccountSettingResponse({
    this.setting,
  });

  factory PutAccountSettingResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountSettingResponse(
      setting: json['setting'] != null
          ? Setting.fromJson(json['setting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final setting = this.setting;
    return {
      if (setting != null) 'setting': setting,
    };
  }
}

class PutAttributesResponse {
  /// The attributes applied to your resource.
  final List<Attribute>? attributes;

  PutAttributesResponse({
    this.attributes,
  });

  factory PutAttributesResponse.fromJson(Map<String, dynamic> json) {
    return PutAttributesResponse(
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'attributes': attributes,
    };
  }
}

class PutClusterCapacityProvidersResponse {
  /// Details about the cluster.
  final Cluster? cluster;

  PutClusterCapacityProvidersResponse({
    this.cluster,
  });

  factory PutClusterCapacityProvidersResponse.fromJson(
      Map<String, dynamic> json) {
    return PutClusterCapacityProvidersResponse(
      cluster: json['cluster'] != null
          ? Cluster.fromJson(json['cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'cluster': cluster,
    };
  }
}

class RegisterContainerInstanceResponse {
  /// The container instance that was registered.
  final ContainerInstance? containerInstance;

  RegisterContainerInstanceResponse({
    this.containerInstance,
  });

  factory RegisterContainerInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterContainerInstanceResponse(
      containerInstance: json['containerInstance'] != null
          ? ContainerInstance.fromJson(
              json['containerInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstance = this.containerInstance;
    return {
      if (containerInstance != null) 'containerInstance': containerInstance,
    };
  }
}

class RegisterTaskDefinitionResponse {
  /// The list of tags associated with the task definition.
  final List<Tag>? tags;

  /// The full description of the registered task definition.
  final TaskDefinition? taskDefinition;

  RegisterTaskDefinitionResponse({
    this.tags,
    this.taskDefinition,
  });

  factory RegisterTaskDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return RegisterTaskDefinitionResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDefinition: json['taskDefinition'] != null
          ? TaskDefinition.fromJson(
              json['taskDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final taskDefinition = this.taskDefinition;
    return {
      if (tags != null) 'tags': tags,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
    };
  }
}

/// The repository credentials for private registry authentication.
class RepositoryCredentials {
  /// The Amazon Resource Name (ARN) of the secret containing the private
  /// repository credentials.
  /// <note>
  /// When you are using the Amazon ECS API, AWS CLI, or AWS SDK, if the secret
  /// exists in the same Region as the task that you are launching then you can
  /// use either the full ARN or the name of the secret. When you are using the
  /// AWS Management Console, you must specify the full ARN of the secret.
  /// </note>
  final String credentialsParameter;

  RepositoryCredentials({
    required this.credentialsParameter,
  });

  factory RepositoryCredentials.fromJson(Map<String, dynamic> json) {
    return RepositoryCredentials(
      credentialsParameter: json['credentialsParameter'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialsParameter = this.credentialsParameter;
    return {
      'credentialsParameter': credentialsParameter,
    };
  }
}

/// Describes the resources available for a container instance.
class Resource {
  /// When the <code>doubleValue</code> type is set, the value of the resource
  /// must be a double precision floating-point type.
  final double? doubleValue;

  /// When the <code>integerValue</code> type is set, the value of the resource
  /// must be an integer.
  final int? integerValue;

  /// When the <code>longValue</code> type is set, the value of the resource must
  /// be an extended precision floating-point type.
  final int? longValue;

  /// The name of the resource, such as <code>CPU</code>, <code>MEMORY</code>,
  /// <code>PORTS</code>, <code>PORTS_UDP</code>, or a user-defined resource.
  final String? name;

  /// When the <code>stringSetValue</code> type is set, the value of the resource
  /// must be a string type.
  final List<String>? stringSetValue;

  /// The type of the resource, such as <code>INTEGER</code>, <code>DOUBLE</code>,
  /// <code>LONG</code>, or <code>STRINGSET</code>.
  final String? type;

  Resource({
    this.doubleValue,
    this.integerValue,
    this.longValue,
    this.name,
    this.stringSetValue,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      doubleValue: json['doubleValue'] as double?,
      integerValue: json['integerValue'] as int?,
      longValue: json['longValue'] as int?,
      name: json['name'] as String?,
      stringSetValue: (json['stringSetValue'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final name = this.name;
    final stringSetValue = this.stringSetValue;
    final type = this.type;
    return {
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (longValue != null) 'longValue': longValue,
      if (name != null) 'name': name,
      if (stringSetValue != null) 'stringSetValue': stringSetValue,
      if (type != null) 'type': type,
    };
  }
}

/// The type and amount of a resource to assign to a container. The supported
/// resource types are GPUs and Elastic Inference accelerators. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html">Working
/// with GPUs on Amazon ECS</a> or <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-eia.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>
class ResourceRequirement {
  /// The type of resource to assign to a container. The supported values are
  /// <code>GPU</code> or <code>InferenceAccelerator</code>.
  final ResourceType type;

  /// The value for the specified resource type.
  ///
  /// If the <code>GPU</code> type is used, the value is the number of physical
  /// <code>GPUs</code> the Amazon ECS container agent will reserve for the
  /// container. The number of GPUs reserved for all containers in a task should
  /// not exceed the number of available GPUs on the container instance the task
  /// is launched on.
  ///
  /// If the <code>InferenceAccelerator</code> type is used, the
  /// <code>value</code> should match the <code>deviceName</code> for an
  /// <a>InferenceAccelerator</a> specified in a task definition.
  final String value;

  ResourceRequirement({
    required this.type,
    required this.value,
  });

  factory ResourceRequirement.fromJson(Map<String, dynamic> json) {
    return ResourceRequirement(
      type: (json['type'] as String).toResourceType(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

enum ResourceType {
  gpu,
  inferenceAccelerator,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.gpu:
        return 'GPU';
      case ResourceType.inferenceAccelerator:
        return 'InferenceAccelerator';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'GPU':
        return ResourceType.gpu;
      case 'InferenceAccelerator':
        return ResourceType.inferenceAccelerator;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class RunTaskResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// A full description of the tasks that were run. The tasks that were
  /// successfully placed on your cluster are described here.
  final List<Task>? tasks;

  RunTaskResponse({
    this.failures,
    this.tasks,
  });

  factory RunTaskResponse.fromJson(Map<String, dynamic> json) {
    return RunTaskResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final tasks = this.tasks;
    return {
      if (failures != null) 'failures': failures,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

/// A floating-point percentage of the desired number of tasks to place and keep
/// running in the task set.
class Scale {
  /// The unit of measure for the scale value.
  final ScaleUnit? unit;

  /// The value, specified as a percent total of a service's
  /// <code>desiredCount</code>, to scale the task set. Accepted values are
  /// numbers between 0 and 100.
  final double? value;

  Scale({
    this.unit,
    this.value,
  });

  factory Scale.fromJson(Map<String, dynamic> json) {
    return Scale(
      unit: (json['unit'] as String?)?.toScaleUnit(),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      if (unit != null) 'unit': unit.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum ScaleUnit {
  percent,
}

extension on ScaleUnit {
  String toValue() {
    switch (this) {
      case ScaleUnit.percent:
        return 'PERCENT';
    }
  }
}

extension on String {
  ScaleUnit toScaleUnit() {
    switch (this) {
      case 'PERCENT':
        return ScaleUnit.percent;
    }
    throw Exception('$this is not known in enum ScaleUnit');
  }
}

enum SchedulingStrategy {
  replica,
  daemon,
}

extension on SchedulingStrategy {
  String toValue() {
    switch (this) {
      case SchedulingStrategy.replica:
        return 'REPLICA';
      case SchedulingStrategy.daemon:
        return 'DAEMON';
    }
  }
}

extension on String {
  SchedulingStrategy toSchedulingStrategy() {
    switch (this) {
      case 'REPLICA':
        return SchedulingStrategy.replica;
      case 'DAEMON':
        return SchedulingStrategy.daemon;
    }
    throw Exception('$this is not known in enum SchedulingStrategy');
  }
}

enum Scope {
  task,
  shared,
}

extension on Scope {
  String toValue() {
    switch (this) {
      case Scope.task:
        return 'task';
      case Scope.shared:
        return 'shared';
    }
  }
}

extension on String {
  Scope toScope() {
    switch (this) {
      case 'task':
        return Scope.task;
      case 'shared':
        return Scope.shared;
    }
    throw Exception('$this is not known in enum Scope');
  }
}

/// An object representing the secret to expose to your container. Secrets can
/// be exposed to a container in the following ways:
///
/// <ul>
/// <li>
/// To inject sensitive data into your containers as environment variables, use
/// the <code>secrets</code> container definition parameter.
/// </li>
/// <li>
/// To reference sensitive information in the log configuration of a container,
/// use the <code>secretOptions</code> container definition parameter.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html">Specifying
/// Sensitive Data</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class Secret {
  /// The name of the secret.
  final String name;

  /// The secret to expose to the container. The supported values are either the
  /// full ARN of the AWS Secrets Manager secret or the full ARN of the parameter
  /// in the AWS Systems Manager Parameter Store.
  /// <note>
  /// If the AWS Systems Manager Parameter Store parameter exists in the same
  /// Region as the task you are launching, then you can use either the full ARN
  /// or name of the parameter. If the parameter exists in a different Region,
  /// then the full ARN must be specified.
  /// </note>
  final String valueFrom;

  Secret({
    required this.name,
    required this.valueFrom,
  });

  factory Secret.fromJson(Map<String, dynamic> json) {
    return Secret(
      name: json['name'] as String,
      valueFrom: json['valueFrom'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final valueFrom = this.valueFrom;
    return {
      'name': name,
      'valueFrom': valueFrom,
    };
  }
}

/// Details on a service within a cluster
class Service {
  /// The capacity provider strategy associated with the service.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// The Amazon Resource Name (ARN) of the cluster that hosts the service.
  final String? clusterArn;

  /// The Unix timestamp for when the service was created.
  final DateTime? createdAt;

  /// The principal that created the service.
  final String? createdBy;

  /// Optional deployment parameters that control how many tasks run during the
  /// deployment and the ordering of stopping and starting tasks.
  final DeploymentConfiguration? deploymentConfiguration;

  /// The deployment controller type the service is using. When using the
  /// DescribeServices API, this field is omitted if the service is using the
  /// <code>ECS</code> deployment controller type.
  final DeploymentController? deploymentController;

  /// The current state of deployments for the service.
  final List<Deployment>? deployments;

  /// The desired number of instantiations of the task definition to keep running
  /// on the service. This value is specified when the service is created with
  /// <a>CreateService</a>, and it can be modified with <a>UpdateService</a>.
  final int? desiredCount;

  /// Specifies whether to enable Amazon ECS managed tags for the tasks in the
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final bool? enableECSManagedTags;

  /// Whether or not the execute command functionality is enabled for the service.
  /// If <code>true</code>, the execute command functionality is enabled for all
  /// containers in tasks as part of the service.
  final bool? enableExecuteCommand;

  /// The event stream for your service. A maximum of 100 of the latest events are
  /// displayed.
  final List<ServiceEvent>? events;

  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// ignores unhealthy Elastic Load Balancing target health checks after a task
  /// has first started.
  final int? healthCheckGracePeriodSeconds;

  /// The infrastructure on which your service is running. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// A list of Elastic Load Balancing load balancer objects, containing the load
  /// balancer name, the container name (as it appears in a container definition),
  /// and the container port to access from the load balancer.
  final List<LoadBalancer>? loadBalancers;

  /// The VPC subnet and security group configuration for tasks that receive their
  /// own elastic network interface by using the <code>awsvpc</code> networking
  /// mode.
  final NetworkConfiguration? networkConfiguration;

  /// The number of tasks in the cluster that are in the <code>PENDING</code>
  /// state.
  final int? pendingCount;

  /// The placement constraints for the tasks in the service.
  final List<PlacementConstraint>? placementConstraints;

  /// The placement strategy that determines how tasks for the service are placed.
  final List<PlacementStrategy>? placementStrategy;

  /// The platform version on which to run your service. A platform version is
  /// only specified for tasks using the Fargate launch type. If one is not
  /// specified, the <code>LATEST</code> platform version is used by default. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? platformVersion;

  /// Specifies whether to propagate the tags from the task definition or the
  /// service to the task. If no value is specified, the tags are not propagated.
  final PropagateTags? propagateTags;

  /// The ARN of the IAM role associated with the service that allows the Amazon
  /// ECS container agent to register container instances with an Elastic Load
  /// Balancing load balancer.
  final String? roleArn;

  /// The number of tasks in the cluster that are in the <code>RUNNING</code>
  /// state.
  final int? runningCount;

  /// The scheduling strategy to use for the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Services</a>.
  ///
  /// There are two service scheduler strategies available:
  ///
  /// <ul>
  /// <li>
  /// <code>REPLICA</code>-The replica scheduling strategy places and maintains
  /// the desired number of tasks across your cluster. By default, the service
  /// scheduler spreads tasks across Availability Zones. You can use task
  /// placement strategies and constraints to customize task placement decisions.
  /// </li>
  /// <li>
  /// <code>DAEMON</code>-The daemon scheduling strategy deploys exactly one task
  /// on each active container instance that meets all of the task placement
  /// constraints that you specify in your cluster. The service scheduler also
  /// evaluates the task placement constraints for running tasks and will stop
  /// tasks that do not meet the placement constraints.
  /// <note>
  /// Fargate tasks do not support the <code>DAEMON</code> scheduling strategy.
  /// </note> </li>
  /// </ul>
  final SchedulingStrategy? schedulingStrategy;

  /// The ARN that identifies the service. The ARN contains the
  /// <code>arn:aws:ecs</code> namespace, followed by the Region of the service,
  /// the AWS account ID of the service owner, the <code>service</code> namespace,
  /// and then the service name. For example,
  /// <code>arn:aws:ecs:region:012345678910:service/my-service</code>.
  final String? serviceArn;

  /// The name of your service. Up to 255 letters (uppercase and lowercase),
  /// numbers, underscores, and hyphens are allowed. Service names must be unique
  /// within a cluster, but you can have similarly named services in multiple
  /// clusters within a Region or across multiple Regions.
  final String? serviceName;

  /// The details of the service discovery registries to assign to this service.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// Discovery</a>.
  final List<ServiceRegistry>? serviceRegistries;

  /// The status of the service. The valid values are <code>ACTIVE</code>,
  /// <code>DRAINING</code>, or <code>INACTIVE</code>.
  final String? status;

  /// The metadata that you apply to the service to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The task definition to use for tasks in the service. This value is specified
  /// when the service is created with <a>CreateService</a>, and it can be
  /// modified with <a>UpdateService</a>.
  final String? taskDefinition;

  /// Information about a set of Amazon ECS tasks in either an AWS CodeDeploy or
  /// an <code>EXTERNAL</code> deployment. An Amazon ECS task set includes details
  /// such as the desired number of tasks, how many tasks are running, and whether
  /// the task set serves production traffic.
  final List<TaskSet>? taskSets;

  Service({
    this.capacityProviderStrategy,
    this.clusterArn,
    this.createdAt,
    this.createdBy,
    this.deploymentConfiguration,
    this.deploymentController,
    this.deployments,
    this.desiredCount,
    this.enableECSManagedTags,
    this.enableExecuteCommand,
    this.events,
    this.healthCheckGracePeriodSeconds,
    this.launchType,
    this.loadBalancers,
    this.networkConfiguration,
    this.pendingCount,
    this.placementConstraints,
    this.placementStrategy,
    this.platformVersion,
    this.propagateTags,
    this.roleArn,
    this.runningCount,
    this.schedulingStrategy,
    this.serviceArn,
    this.serviceName,
    this.serviceRegistries,
    this.status,
    this.tags,
    this.taskDefinition,
    this.taskSets,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      capacityProviderStrategy: (json['capacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusterArn: json['clusterArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      deploymentConfiguration: json['deploymentConfiguration'] != null
          ? DeploymentConfiguration.fromJson(
              json['deploymentConfiguration'] as Map<String, dynamic>)
          : null,
      deploymentController: json['deploymentController'] != null
          ? DeploymentController.fromJson(
              json['deploymentController'] as Map<String, dynamic>)
          : null,
      deployments: (json['deployments'] as List?)
          ?.whereNotNull()
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      desiredCount: json['desiredCount'] as int?,
      enableECSManagedTags: json['enableECSManagedTags'] as bool?,
      enableExecuteCommand: json['enableExecuteCommand'] as bool?,
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      healthCheckGracePeriodSeconds:
          json['healthCheckGracePeriodSeconds'] as int?,
      launchType: (json['launchType'] as String?)?.toLaunchType(),
      loadBalancers: (json['loadBalancers'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancer.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      pendingCount: json['pendingCount'] as int?,
      placementConstraints: (json['placementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementStrategy: (json['placementStrategy'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      platformVersion: json['platformVersion'] as String?,
      propagateTags: (json['propagateTags'] as String?)?.toPropagateTags(),
      roleArn: json['roleArn'] as String?,
      runningCount: json['runningCount'] as int?,
      schedulingStrategy:
          (json['schedulingStrategy'] as String?)?.toSchedulingStrategy(),
      serviceArn: json['serviceArn'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceRegistries: (json['serviceRegistries'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceRegistry.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDefinition: json['taskDefinition'] as String?,
      taskSets: (json['taskSets'] as List?)
          ?.whereNotNull()
          .map((e) => TaskSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final clusterArn = this.clusterArn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final deploymentConfiguration = this.deploymentConfiguration;
    final deploymentController = this.deploymentController;
    final deployments = this.deployments;
    final desiredCount = this.desiredCount;
    final enableECSManagedTags = this.enableECSManagedTags;
    final enableExecuteCommand = this.enableExecuteCommand;
    final events = this.events;
    final healthCheckGracePeriodSeconds = this.healthCheckGracePeriodSeconds;
    final launchType = this.launchType;
    final loadBalancers = this.loadBalancers;
    final networkConfiguration = this.networkConfiguration;
    final pendingCount = this.pendingCount;
    final placementConstraints = this.placementConstraints;
    final placementStrategy = this.placementStrategy;
    final platformVersion = this.platformVersion;
    final propagateTags = this.propagateTags;
    final roleArn = this.roleArn;
    final runningCount = this.runningCount;
    final schedulingStrategy = this.schedulingStrategy;
    final serviceArn = this.serviceArn;
    final serviceName = this.serviceName;
    final serviceRegistries = this.serviceRegistries;
    final status = this.status;
    final tags = this.tags;
    final taskDefinition = this.taskDefinition;
    final taskSets = this.taskSets;
    return {
      if (capacityProviderStrategy != null)
        'capacityProviderStrategy': capacityProviderStrategy,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (deploymentConfiguration != null)
        'deploymentConfiguration': deploymentConfiguration,
      if (deploymentController != null)
        'deploymentController': deploymentController,
      if (deployments != null) 'deployments': deployments,
      if (desiredCount != null) 'desiredCount': desiredCount,
      if (enableECSManagedTags != null)
        'enableECSManagedTags': enableECSManagedTags,
      if (enableExecuteCommand != null)
        'enableExecuteCommand': enableExecuteCommand,
      if (events != null) 'events': events,
      if (healthCheckGracePeriodSeconds != null)
        'healthCheckGracePeriodSeconds': healthCheckGracePeriodSeconds,
      if (launchType != null) 'launchType': launchType.toValue(),
      if (loadBalancers != null) 'loadBalancers': loadBalancers,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (pendingCount != null) 'pendingCount': pendingCount,
      if (placementConstraints != null)
        'placementConstraints': placementConstraints,
      if (placementStrategy != null) 'placementStrategy': placementStrategy,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
      if (roleArn != null) 'roleArn': roleArn,
      if (runningCount != null) 'runningCount': runningCount,
      if (schedulingStrategy != null)
        'schedulingStrategy': schedulingStrategy.toValue(),
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
      if (taskSets != null) 'taskSets': taskSets,
    };
  }
}

/// Details on an event associated with a service.
class ServiceEvent {
  /// The Unix timestamp for when the event was triggered.
  final DateTime? createdAt;

  /// The ID string of the event.
  final String? id;

  /// The event message.
  final String? message;

  ServiceEvent({
    this.createdAt,
    this.id,
    this.message,
  });

  factory ServiceEvent.fromJson(Map<String, dynamic> json) {
    return ServiceEvent(
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final message = this.message;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (message != null) 'message': message,
    };
  }
}

enum ServiceField {
  tags,
}

extension on ServiceField {
  String toValue() {
    switch (this) {
      case ServiceField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  ServiceField toServiceField() {
    switch (this) {
      case 'TAGS':
        return ServiceField.tags;
    }
    throw Exception('$this is not known in enum ServiceField');
  }
}

/// Details of the service registry.
class ServiceRegistry {
  /// The container name value, already specified in the task definition, to be
  /// used for your service discovery service. If the task definition that your
  /// service task specifies uses the <code>bridge</code> or <code>host</code>
  /// network mode, you must specify a <code>containerName</code> and
  /// <code>containerPort</code> combination from the task definition. If the task
  /// definition that your service task specifies uses the <code>awsvpc</code>
  /// network mode and a type SRV DNS record is used, you must specify either a
  /// <code>containerName</code> and <code>containerPort</code> combination or a
  /// <code>port</code> value, but not both.
  final String? containerName;

  /// The port value, already specified in the task definition, to be used for
  /// your service discovery service. If the task definition your service task
  /// specifies uses the <code>bridge</code> or <code>host</code> network mode,
  /// you must specify a <code>containerName</code> and <code>containerPort</code>
  /// combination from the task definition. If the task definition your service
  /// task specifies uses the <code>awsvpc</code> network mode and a type SRV DNS
  /// record is used, you must specify either a <code>containerName</code> and
  /// <code>containerPort</code> combination or a <code>port</code> value, but not
  /// both.
  final int? containerPort;

  /// The port value used if your service discovery service specified an SRV
  /// record. This field may be used if both the <code>awsvpc</code> network mode
  /// and SRV records are used.
  final int? port;

  /// The Amazon Resource Name (ARN) of the service registry. The currently
  /// supported service registry is AWS Cloud Map. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html">CreateService</a>.
  final String? registryArn;

  ServiceRegistry({
    this.containerName,
    this.containerPort,
    this.port,
    this.registryArn,
  });

  factory ServiceRegistry.fromJson(Map<String, dynamic> json) {
    return ServiceRegistry(
      containerName: json['containerName'] as String?,
      containerPort: json['containerPort'] as int?,
      port: json['port'] as int?,
      registryArn: json['registryArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final containerPort = this.containerPort;
    final port = this.port;
    final registryArn = this.registryArn;
    return {
      if (containerName != null) 'containerName': containerName,
      if (containerPort != null) 'containerPort': containerPort,
      if (port != null) 'port': port,
      if (registryArn != null) 'registryArn': registryArn,
    };
  }
}

/// The details of the execute command session.
class Session {
  /// The ID of the execute command session.
  final String? sessionId;

  /// A URL back to managed agent on the container that the SSM Session Manager
  /// client uses to send commands and receive output from the container.
  final String? streamUrl;

  /// An encrypted token value containing session and caller information. Used to
  /// authenticate the connection to the container.
  final String? tokenValue;

  Session({
    this.sessionId,
    this.streamUrl,
    this.tokenValue,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionId: json['sessionId'] as String?,
      streamUrl: json['streamUrl'] as String?,
      tokenValue: json['tokenValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final streamUrl = this.streamUrl;
    final tokenValue = this.tokenValue;
    return {
      if (sessionId != null) 'sessionId': sessionId,
      if (streamUrl != null) 'streamUrl': streamUrl,
      if (tokenValue != null) 'tokenValue': tokenValue,
    };
  }
}

/// The current account setting for a resource.
class Setting {
  /// The Amazon ECS resource name.
  final SettingName? name;

  /// The ARN of the principal, which can be an IAM user, IAM role, or the root
  /// user. If this field is omitted, the authenticated user is assumed.
  final String? principalArn;

  /// Whether the account setting is enabled or disabled for the specified
  /// resource.
  final String? value;

  Setting({
    this.name,
    this.principalArn,
    this.value,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      name: (json['name'] as String?)?.toSettingName(),
      principalArn: json['principalArn'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final principalArn = this.principalArn;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (principalArn != null) 'principalArn': principalArn,
      if (value != null) 'value': value,
    };
  }
}

enum SettingName {
  serviceLongArnFormat,
  taskLongArnFormat,
  containerInstanceLongArnFormat,
  awsvpcTrunking,
  containerInsights,
}

extension on SettingName {
  String toValue() {
    switch (this) {
      case SettingName.serviceLongArnFormat:
        return 'serviceLongArnFormat';
      case SettingName.taskLongArnFormat:
        return 'taskLongArnFormat';
      case SettingName.containerInstanceLongArnFormat:
        return 'containerInstanceLongArnFormat';
      case SettingName.awsvpcTrunking:
        return 'awsvpcTrunking';
      case SettingName.containerInsights:
        return 'containerInsights';
    }
  }
}

extension on String {
  SettingName toSettingName() {
    switch (this) {
      case 'serviceLongArnFormat':
        return SettingName.serviceLongArnFormat;
      case 'taskLongArnFormat':
        return SettingName.taskLongArnFormat;
      case 'containerInstanceLongArnFormat':
        return SettingName.containerInstanceLongArnFormat;
      case 'awsvpcTrunking':
        return SettingName.awsvpcTrunking;
      case 'containerInsights':
        return SettingName.containerInsights;
    }
    throw Exception('$this is not known in enum SettingName');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASC':
        return SortOrder.asc;
      case 'DESC':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

enum StabilityStatus {
  steadyState,
  stabilizing,
}

extension on StabilityStatus {
  String toValue() {
    switch (this) {
      case StabilityStatus.steadyState:
        return 'STEADY_STATE';
      case StabilityStatus.stabilizing:
        return 'STABILIZING';
    }
  }
}

extension on String {
  StabilityStatus toStabilityStatus() {
    switch (this) {
      case 'STEADY_STATE':
        return StabilityStatus.steadyState;
      case 'STABILIZING':
        return StabilityStatus.stabilizing;
    }
    throw Exception('$this is not known in enum StabilityStatus');
  }
}

class StartTaskResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// A full description of the tasks that were started. Each task that was
  /// successfully placed on your container instances is described.
  final List<Task>? tasks;

  StartTaskResponse({
    this.failures,
    this.tasks,
  });

  factory StartTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartTaskResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List?)
          ?.whereNotNull()
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final tasks = this.tasks;
    return {
      if (failures != null) 'failures': failures,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

class StopTaskResponse {
  /// The task that was stopped.
  final Task? task;

  StopTaskResponse({
    this.task,
  });

  factory StopTaskResponse.fromJson(Map<String, dynamic> json) {
    return StopTaskResponse(
      task: json['task'] != null
          ? Task.fromJson(json['task'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final task = this.task;
    return {
      if (task != null) 'task': task,
    };
  }
}

class SubmitAttachmentStateChangesResponse {
  /// Acknowledgement of the state change.
  final String? acknowledgment;

  SubmitAttachmentStateChangesResponse({
    this.acknowledgment,
  });

  factory SubmitAttachmentStateChangesResponse.fromJson(
      Map<String, dynamic> json) {
    return SubmitAttachmentStateChangesResponse(
      acknowledgment: json['acknowledgment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgment = this.acknowledgment;
    return {
      if (acknowledgment != null) 'acknowledgment': acknowledgment,
    };
  }
}

class SubmitContainerStateChangeResponse {
  /// Acknowledgement of the state change.
  final String? acknowledgment;

  SubmitContainerStateChangeResponse({
    this.acknowledgment,
  });

  factory SubmitContainerStateChangeResponse.fromJson(
      Map<String, dynamic> json) {
    return SubmitContainerStateChangeResponse(
      acknowledgment: json['acknowledgment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgment = this.acknowledgment;
    return {
      if (acknowledgment != null) 'acknowledgment': acknowledgment,
    };
  }
}

class SubmitTaskStateChangeResponse {
  /// Acknowledgement of the state change.
  final String? acknowledgment;

  SubmitTaskStateChangeResponse({
    this.acknowledgment,
  });

  factory SubmitTaskStateChangeResponse.fromJson(Map<String, dynamic> json) {
    return SubmitTaskStateChangeResponse(
      acknowledgment: json['acknowledgment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgment = this.acknowledgment;
    return {
      if (acknowledgment != null) 'acknowledgment': acknowledgment,
    };
  }
}

/// A list of namespaced kernel parameters to set in the container. This
/// parameter maps to <code>Sysctls</code> in the <a
/// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
/// a container</a> section of the <a
/// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
/// the <code>--sysctl</code> option to <a
/// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
/// run</a>.
///
/// It is not recommended that you specify network-related
/// <code>systemControls</code> parameters for multiple containers in a single
/// task that also uses either the <code>awsvpc</code> or <code>host</code>
/// network mode for the following reasons:
///
/// <ul>
/// <li>
/// For tasks that use the <code>awsvpc</code> network mode, if you set
/// <code>systemControls</code> for any container, it applies to all containers
/// in the task. If you set different <code>systemControls</code> for multiple
/// containers in a single task, the container that is started last determines
/// which <code>systemControls</code> take effect.
/// </li>
/// <li>
/// For tasks that use the <code>host</code> network mode, the
/// <code>systemControls</code> parameter applies to the container instance's
/// kernel parameter as well as that of all containers of any tasks running on
/// that container instance.
/// </li>
/// </ul>
class SystemControl {
  /// The namespaced kernel parameter for which to set a <code>value</code>.
  final String? namespace;

  /// The value for the namespaced kernel parameter specified in
  /// <code>namespace</code>.
  final String? value;

  SystemControl({
    this.namespace,
    this.value,
  });

  factory SystemControl.fromJson(Map<String, dynamic> json) {
    return SystemControl(
      namespace: json['namespace'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final value = this.value;
    return {
      if (namespace != null) 'namespace': namespace,
      if (value != null) 'value': value,
    };
  }
}

/// The metadata that you apply to a resource to help you categorize and
/// organize them. Each tag consists of a key and an optional value, both of
/// which you define.
///
/// The following basic restrictions apply to tags:
///
/// <ul>
/// <li>
/// Maximum number of tags per resource - 50
/// </li>
/// <li>
/// For each resource, each tag key must be unique, and each tag key can have
/// only one value.
/// </li>
/// <li>
/// Maximum key length - 128 Unicode characters in UTF-8
/// </li>
/// <li>
/// Maximum value length - 256 Unicode characters in UTF-8
/// </li>
/// <li>
/// If your tagging schema is used across multiple services and resources,
/// remember that other services may have restrictions on allowed characters.
/// Generally allowed characters are: letters, numbers, and spaces representable
/// in UTF-8, and the following characters: + - = . _ : / @.
/// </li>
/// <li>
/// Tag keys and values are case-sensitive.
/// </li>
/// <li>
/// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
/// combination of such as a prefix for either keys or values as it is reserved
/// for AWS use. You cannot edit or delete tag keys or values with this prefix.
/// Tags with this prefix do not count against your tags per resource limit.
/// </li>
/// </ul>
class Tag {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String? key;

  /// The optional part of a key-value pair that make up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
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
  containerInstance,
}

extension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.containerInstance:
        return 'container-instance';
    }
  }
}

extension on String {
  TargetType toTargetType() {
    switch (this) {
      case 'container-instance':
        return TargetType.containerInstance;
    }
    throw Exception('$this is not known in enum TargetType');
  }
}

/// Details on a task in a cluster.
class Task {
  /// The Elastic Network Adapter associated with the task if the task uses the
  /// <code>awsvpc</code> network mode.
  final List<Attachment>? attachments;

  /// The attributes of the task
  final List<Attribute>? attributes;

  /// The availability zone of the task.
  final String? availabilityZone;

  /// The capacity provider associated with the task.
  final String? capacityProviderName;

  /// The ARN of the cluster that hosts the task.
  final String? clusterArn;

  /// The connectivity status of a task.
  final Connectivity? connectivity;

  /// The Unix timestamp for when the task last went into <code>CONNECTED</code>
  /// status.
  final DateTime? connectivityAt;

  /// The ARN of the container instances that host the task.
  final String? containerInstanceArn;

  /// The containers associated with the task.
  final List<Container>? containers;

  /// The number of CPU units used by the task as expressed in a task definition.
  /// It can be expressed as an integer using CPU units, for example
  /// <code>1024</code>. It can also be expressed as a string using vCPUs, for
  /// example <code>1 vCPU</code> or <code>1 vcpu</code>. String values are
  /// converted to an integer indicating the CPU units when the task definition is
  /// registered.
  ///
  /// If you are using the EC2 launch type, this field is optional. Supported
  /// values are between <code>128</code> CPU units (<code>0.125</code> vCPUs) and
  /// <code>10240</code> CPU units (<code>10</code> vCPUs).
  ///
  /// If you are using the Fargate launch type, this field is required and you
  /// must use one of the following values, which determines your range of
  /// supported values for the <code>memory</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 256 (.25 vCPU) - Available <code>memory</code> values: 512 (0.5 GB), 1024 (1
  /// GB), 2048 (2 GB)
  /// </li>
  /// <li>
  /// 512 (.5 vCPU) - Available <code>memory</code> values: 1024 (1 GB), 2048 (2
  /// GB), 3072 (3 GB), 4096 (4 GB)
  /// </li>
  /// <li>
  /// 1024 (1 vCPU) - Available <code>memory</code> values: 2048 (2 GB), 3072 (3
  /// GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 GB), 8192 (8 GB)
  /// </li>
  /// <li>
  /// 2048 (2 vCPU) - Available <code>memory</code> values: Between 4096 (4 GB)
  /// and 16384 (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: Between 8192 (8 GB)
  /// and 30720 (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// </ul>
  final String? cpu;

  /// The Unix timestamp for when the task was created (the task entered the
  /// <code>PENDING</code> state).
  final DateTime? createdAt;

  /// The desired status of the task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html">Task
  /// Lifecycle</a>.
  final String? desiredStatus;

  /// Whether or not execute command functionality is enabled for this task. If
  /// <code>true</code>, this enables execute command functionality on all
  /// containers in the task.
  final bool? enableExecuteCommand;

  /// The ephemeral storage settings for the task.
  final EphemeralStorage? ephemeralStorage;

  /// The Unix timestamp for when the task execution stopped.
  final DateTime? executionStoppedAt;

  /// The name of the task group associated with the task.
  final String? group;

  /// The health status for the task, which is determined by the health of the
  /// essential containers in the task. If all essential containers in the task
  /// are reporting as <code>HEALTHY</code>, then the task status also reports as
  /// <code>HEALTHY</code>. If any essential containers in the task are reporting
  /// as <code>UNHEALTHY</code> or <code>UNKNOWN</code>, then the task status also
  /// reports as <code>UNHEALTHY</code> or <code>UNKNOWN</code>, accordingly.
  /// <note>
  /// The Amazon ECS container agent does not monitor or report on Docker health
  /// checks that are embedded in a container image (such as those specified in a
  /// parent image or from the image's Dockerfile) and not specified in the
  /// container definition. Health check parameters that are specified in a
  /// container definition override any Docker health checks that exist in the
  /// container image.
  /// </note>
  final HealthStatus? healthStatus;

  /// The Elastic Inference accelerator associated with the task.
  final List<InferenceAccelerator>? inferenceAccelerators;

  /// The last known status of the task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html">Task
  /// Lifecycle</a>.
  final String? lastStatus;

  /// The infrastructure on which your task is running. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// The amount of memory (in MiB) used by the task as expressed in a task
  /// definition. It can be expressed as an integer using MiB, for example
  /// <code>1024</code>. It can also be expressed as a string using GB, for
  /// example <code>1GB</code> or <code>1 GB</code>. String values are converted
  /// to an integer indicating the MiB when the task definition is registered.
  ///
  /// If you are using the EC2 launch type, this field is optional.
  ///
  /// If you are using the Fargate launch type, this field is required and you
  /// must use one of the following values, which determines your range of
  /// supported values for the <code>cpu</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available <code>cpu</code> values:
  /// 256 (.25 vCPU)
  /// </li>
  /// <li>
  /// 1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available
  /// <code>cpu</code> values: 512 (.5 vCPU)
  /// </li>
  /// <li>
  /// 2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7
  /// GB), 8192 (8 GB) - Available <code>cpu</code> values: 1024 (1 vCPU)
  /// </li>
  /// <li>
  /// Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 2048 (2 vCPU)
  /// </li>
  /// <li>
  /// Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 4096 (4 vCPU)
  /// </li>
  /// </ul>
  final String? memory;

  /// One or more container overrides.
  final TaskOverride? overrides;

  /// The platform version on which your task is running. A platform version is
  /// only specified for tasks using the Fargate launch type. If one is not
  /// specified, the <code>LATEST</code> platform version is used by default. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate Platform Versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? platformVersion;

  /// The Unix timestamp for when the container image pull began.
  final DateTime? pullStartedAt;

  /// The Unix timestamp for when the container image pull completed.
  final DateTime? pullStoppedAt;

  /// The Unix timestamp for when the task started (the task transitioned from the
  /// <code>PENDING</code> state to the <code>RUNNING</code> state).
  final DateTime? startedAt;

  /// The tag specified when a task is started. If the task is started by an
  /// Amazon ECS service, then the <code>startedBy</code> parameter contains the
  /// deployment ID of the service that starts it.
  final String? startedBy;

  /// The stop code indicating why a task was stopped. The
  /// <code>stoppedReason</code> may contain additional details.
  final TaskStopCode? stopCode;

  /// The Unix timestamp for when the task was stopped (the task transitioned from
  /// the <code>RUNNING</code> state to the <code>STOPPED</code> state).
  final DateTime? stoppedAt;

  /// The reason that the task was stopped.
  final String? stoppedReason;

  /// The Unix timestamp for when the task stops (transitions from the
  /// <code>RUNNING</code> state to <code>STOPPED</code>).
  final DateTime? stoppingAt;

  /// The metadata that you apply to the task to help you categorize and organize
  /// them. Each tag consists of a key and an optional value, both of which you
  /// define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  /// The ARN of the task definition that creates the task.
  final String? taskDefinitionArn;

  /// The version counter for the task. Every time a task experiences a change
  /// that triggers a CloudWatch event, the version counter is incremented. If you
  /// are replicating your Amazon ECS task state with CloudWatch Events, you can
  /// compare the version of a task reported by the Amazon ECS API actions with
  /// the version reported in CloudWatch Events for the task (inside the
  /// <code>detail</code> object) to verify that the version in your event stream
  /// is current.
  final int? version;

  Task({
    this.attachments,
    this.attributes,
    this.availabilityZone,
    this.capacityProviderName,
    this.clusterArn,
    this.connectivity,
    this.connectivityAt,
    this.containerInstanceArn,
    this.containers,
    this.cpu,
    this.createdAt,
    this.desiredStatus,
    this.enableExecuteCommand,
    this.ephemeralStorage,
    this.executionStoppedAt,
    this.group,
    this.healthStatus,
    this.inferenceAccelerators,
    this.lastStatus,
    this.launchType,
    this.memory,
    this.overrides,
    this.platformVersion,
    this.pullStartedAt,
    this.pullStoppedAt,
    this.startedAt,
    this.startedBy,
    this.stopCode,
    this.stoppedAt,
    this.stoppedReason,
    this.stoppingAt,
    this.tags,
    this.taskArn,
    this.taskDefinitionArn,
    this.version,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      attachments: (json['attachments'] as List?)
          ?.whereNotNull()
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      availabilityZone: json['availabilityZone'] as String?,
      capacityProviderName: json['capacityProviderName'] as String?,
      clusterArn: json['clusterArn'] as String?,
      connectivity: (json['connectivity'] as String?)?.toConnectivity(),
      connectivityAt: timeStampFromJson(json['connectivityAt']),
      containerInstanceArn: json['containerInstanceArn'] as String?,
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['cpu'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      desiredStatus: json['desiredStatus'] as String?,
      enableExecuteCommand: json['enableExecuteCommand'] as bool?,
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionStoppedAt: timeStampFromJson(json['executionStoppedAt']),
      group: json['group'] as String?,
      healthStatus: (json['healthStatus'] as String?)?.toHealthStatus(),
      inferenceAccelerators: (json['inferenceAccelerators'] as List?)
          ?.whereNotNull()
          .map((e) => InferenceAccelerator.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastStatus: json['lastStatus'] as String?,
      launchType: (json['launchType'] as String?)?.toLaunchType(),
      memory: json['memory'] as String?,
      overrides: json['overrides'] != null
          ? TaskOverride.fromJson(json['overrides'] as Map<String, dynamic>)
          : null,
      platformVersion: json['platformVersion'] as String?,
      pullStartedAt: timeStampFromJson(json['pullStartedAt']),
      pullStoppedAt: timeStampFromJson(json['pullStoppedAt']),
      startedAt: timeStampFromJson(json['startedAt']),
      startedBy: json['startedBy'] as String?,
      stopCode: (json['stopCode'] as String?)?.toTaskStopCode(),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
      stoppedReason: json['stoppedReason'] as String?,
      stoppingAt: timeStampFromJson(json['stoppingAt']),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskArn: json['taskArn'] as String?,
      taskDefinitionArn: json['taskDefinitionArn'] as String?,
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final attributes = this.attributes;
    final availabilityZone = this.availabilityZone;
    final capacityProviderName = this.capacityProviderName;
    final clusterArn = this.clusterArn;
    final connectivity = this.connectivity;
    final connectivityAt = this.connectivityAt;
    final containerInstanceArn = this.containerInstanceArn;
    final containers = this.containers;
    final cpu = this.cpu;
    final createdAt = this.createdAt;
    final desiredStatus = this.desiredStatus;
    final enableExecuteCommand = this.enableExecuteCommand;
    final ephemeralStorage = this.ephemeralStorage;
    final executionStoppedAt = this.executionStoppedAt;
    final group = this.group;
    final healthStatus = this.healthStatus;
    final inferenceAccelerators = this.inferenceAccelerators;
    final lastStatus = this.lastStatus;
    final launchType = this.launchType;
    final memory = this.memory;
    final overrides = this.overrides;
    final platformVersion = this.platformVersion;
    final pullStartedAt = this.pullStartedAt;
    final pullStoppedAt = this.pullStoppedAt;
    final startedAt = this.startedAt;
    final startedBy = this.startedBy;
    final stopCode = this.stopCode;
    final stoppedAt = this.stoppedAt;
    final stoppedReason = this.stoppedReason;
    final stoppingAt = this.stoppingAt;
    final tags = this.tags;
    final taskArn = this.taskArn;
    final taskDefinitionArn = this.taskDefinitionArn;
    final version = this.version;
    return {
      if (attachments != null) 'attachments': attachments,
      if (attributes != null) 'attributes': attributes,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (capacityProviderName != null)
        'capacityProviderName': capacityProviderName,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (connectivity != null) 'connectivity': connectivity.toValue(),
      if (connectivityAt != null)
        'connectivityAt': unixTimestampToJson(connectivityAt),
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (containers != null) 'containers': containers,
      if (cpu != null) 'cpu': cpu,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (desiredStatus != null) 'desiredStatus': desiredStatus,
      if (enableExecuteCommand != null)
        'enableExecuteCommand': enableExecuteCommand,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionStoppedAt != null)
        'executionStoppedAt': unixTimestampToJson(executionStoppedAt),
      if (group != null) 'group': group,
      if (healthStatus != null) 'healthStatus': healthStatus.toValue(),
      if (inferenceAccelerators != null)
        'inferenceAccelerators': inferenceAccelerators,
      if (lastStatus != null) 'lastStatus': lastStatus,
      if (launchType != null) 'launchType': launchType.toValue(),
      if (memory != null) 'memory': memory,
      if (overrides != null) 'overrides': overrides,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (pullStartedAt != null)
        'pullStartedAt': unixTimestampToJson(pullStartedAt),
      if (pullStoppedAt != null)
        'pullStoppedAt': unixTimestampToJson(pullStoppedAt),
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (startedBy != null) 'startedBy': startedBy,
      if (stopCode != null) 'stopCode': stopCode.toValue(),
      if (stoppedAt != null) 'stoppedAt': unixTimestampToJson(stoppedAt),
      if (stoppedReason != null) 'stoppedReason': stoppedReason,
      if (stoppingAt != null) 'stoppingAt': unixTimestampToJson(stoppingAt),
      if (tags != null) 'tags': tags,
      if (taskArn != null) 'taskArn': taskArn,
      if (taskDefinitionArn != null) 'taskDefinitionArn': taskDefinitionArn,
      if (version != null) 'version': version,
    };
  }
}

/// The details of a task definition which describes the container and volume
/// definitions of an Amazon Elastic Container Service task. You can specify
/// which Docker images to use, the required resources, and other configurations
/// related to launching the task definition through an Amazon ECS service or
/// task.
class TaskDefinition {
  /// The task launch types the task definition validated against during task
  /// definition registration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final List<Compatibility>? compatibilities;

  /// A list of container definitions in JSON format that describe the different
  /// containers that make up your task. For more information about container
  /// definition parameters and defaults, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html">Amazon
  /// ECS Task Definitions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final List<ContainerDefinition>? containerDefinitions;

  /// The number of <code>cpu</code> units used by the task. If you are using the
  /// EC2 launch type, this field is optional and any value can be used. If you
  /// are using the Fargate launch type, this field is required and you must use
  /// one of the following values, which determines your range of valid values for
  /// the <code>memory</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 256 (.25 vCPU) - Available <code>memory</code> values: 512 (0.5 GB), 1024 (1
  /// GB), 2048 (2 GB)
  /// </li>
  /// <li>
  /// 512 (.5 vCPU) - Available <code>memory</code> values: 1024 (1 GB), 2048 (2
  /// GB), 3072 (3 GB), 4096 (4 GB)
  /// </li>
  /// <li>
  /// 1024 (1 vCPU) - Available <code>memory</code> values: 2048 (2 GB), 3072 (3
  /// GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 GB), 8192 (8 GB)
  /// </li>
  /// <li>
  /// 2048 (2 vCPU) - Available <code>memory</code> values: Between 4096 (4 GB)
  /// and 16384 (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: Between 8192 (8 GB)
  /// and 30720 (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// </ul>
  final String? cpu;

  /// The Unix timestamp for when the task definition was deregistered.
  final DateTime? deregisteredAt;

  /// The ephemeral storage settings to use for tasks run with the task
  /// definition.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the task execution role that grants the
  /// Amazon ECS container agent permission to make AWS API calls on your behalf.
  /// The task execution IAM role is required depending on the requirements of
  /// your task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html">Amazon
  /// ECS task execution IAM role</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? executionRoleArn;

  /// The name of a family that this task definition is registered to. Up to 255
  /// letters (uppercase and lowercase), numbers, hyphens, and underscores are
  /// allowed.
  ///
  /// A family groups multiple versions of a task definition. Amazon ECS gives the
  /// first task definition that you registered to a family a revision number of
  /// 1. Amazon ECS gives sequential revision numbers to each task definition that
  /// you add.
  final String? family;

  /// The Elastic Inference accelerator associated with the task.
  final List<InferenceAccelerator>? inferenceAccelerators;

  /// The IPC resource namespace to use for the containers in the task. The valid
  /// values are <code>host</code>, <code>task</code>, or <code>none</code>. If
  /// <code>host</code> is specified, then all containers within the tasks that
  /// specified the <code>host</code> IPC mode on the same container instance
  /// share the same IPC resources with the host Amazon EC2 instance. If
  /// <code>task</code> is specified, all containers within the specified task
  /// share the same IPC resources. If <code>none</code> is specified, then IPC
  /// resources within the containers of a task are private and not shared with
  /// other containers in a task or on the container instance. If no value is
  /// specified, then the IPC resource namespace sharing depends on the Docker
  /// daemon setting on the container instance. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#ipc-settings---ipc">IPC
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> IPC mode is used, be aware that there is a
  /// heightened risk of undesired IPC namespace expose. For more information, see
  /// <a href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  ///
  /// If you are setting namespaced kernel parameters using
  /// <code>systemControls</code> for the containers in the task, the following
  /// will apply to your IPC resource namespace. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html">System
  /// Controls</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// For tasks that use the <code>host</code> IPC mode, IPC namespace related
  /// <code>systemControls</code> are not supported.
  /// </li>
  /// <li>
  /// For tasks that use the <code>task</code> IPC mode, IPC namespace related
  /// <code>systemControls</code> will apply to all containers within a task.
  /// </li>
  /// </ul> <note>
  /// This parameter is not supported for Windows containers or tasks run on AWS
  /// Fargate.
  /// </note>
  final IpcMode? ipcMode;

  /// The amount (in MiB) of memory used by the task.
  ///
  /// If your tasks will be run on Amazon EC2 instances, you must specify either a
  /// task-level memory value or a container-level memory value. This field is
  /// optional and any value can be used. If a task-level memory value is
  /// specified then the container-level memory value is optional. For more
  /// information regarding container-level memory and memory reservation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html">ContainerDefinition</a>.
  ///
  /// If your tasks will be run on AWS Fargate, this field is required and you
  /// must use one of the following values, which determines your range of valid
  /// values for the <code>cpu</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// 512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available <code>cpu</code> values:
  /// 256 (.25 vCPU)
  /// </li>
  /// <li>
  /// 1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) - Available
  /// <code>cpu</code> values: 512 (.5 vCPU)
  /// </li>
  /// <li>
  /// 2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7
  /// GB), 8192 (8 GB) - Available <code>cpu</code> values: 1024 (1 vCPU)
  /// </li>
  /// <li>
  /// Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 2048 (2 vCPU)
  /// </li>
  /// <li>
  /// Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) -
  /// Available <code>cpu</code> values: 4096 (4 vCPU)
  /// </li>
  /// </ul>
  final String? memory;

  /// The Docker networking mode to use for the containers in the task. The valid
  /// values are <code>none</code>, <code>bridge</code>, <code>awsvpc</code>, and
  /// <code>host</code>. If no network mode is specified, the default is
  /// <code>bridge</code>.
  ///
  /// For Amazon ECS tasks on Fargate, the <code>awsvpc</code> network mode is
  /// required. For Amazon ECS tasks on Amazon EC2 instances, any network mode can
  /// be used. If the network mode is set to <code>none</code>, you cannot specify
  /// port mappings in your container definitions, and the tasks containers do not
  /// have external connectivity. The <code>host</code> and <code>awsvpc</code>
  /// network modes offer the highest networking performance for containers
  /// because they use the EC2 network stack instead of the virtualized network
  /// stack provided by the <code>bridge</code> mode.
  ///
  /// With the <code>host</code> and <code>awsvpc</code> network modes, exposed
  /// container ports are mapped directly to the corresponding host port (for the
  /// <code>host</code> network mode) or the attached elastic network interface
  /// port (for the <code>awsvpc</code> network mode), so you cannot take
  /// advantage of dynamic host port mappings.
  /// <important>
  /// When using the <code>host</code> network mode, you should not run containers
  /// using the root user (UID 0). It is considered best practice to use a
  /// non-root user.
  /// </important>
  /// If the network mode is <code>awsvpc</code>, the task is allocated an elastic
  /// network interface, and you must specify a <a>NetworkConfiguration</a> value
  /// when you create a service or run a task with the task definition. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// Networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  /// <note>
  /// Currently, only Amazon ECS-optimized AMIs, other Amazon Linux variants with
  /// the <code>ecs-init</code> package, or AWS Fargate infrastructure support the
  /// <code>awsvpc</code> network mode.
  /// </note>
  /// If the network mode is <code>host</code>, you cannot run multiple
  /// instantiations of the same task on a single container instance when port
  /// mappings are used.
  ///
  /// Docker for Windows uses different network modes than Docker for Linux. When
  /// you register a task definition with Windows containers, you must not specify
  /// a network mode. If you use the console to register a task definition with
  /// Windows containers, you must choose the <code>&lt;default&gt;</code> network
  /// mode object.
  ///
  /// For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#network-settings">Network
  /// settings</a> in the <i>Docker run reference</i>.
  final NetworkMode? networkMode;

  /// The process namespace to use for the containers in the task. The valid
  /// values are <code>host</code> or <code>task</code>. If <code>host</code> is
  /// specified, then all containers within the tasks that specified the
  /// <code>host</code> PID mode on the same container instance share the same
  /// process namespace with the host Amazon EC2 instance. If <code>task</code> is
  /// specified, all containers within the specified task share the same process
  /// namespace. If no value is specified, the default is a private namespace. For
  /// more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#pid-settings---pid">PID
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> PID mode is used, be aware that there is a
  /// heightened risk of undesired process namespace expose. For more information,
  /// see <a href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  /// <note>
  /// This parameter is not supported for Windows containers or tasks run on AWS
  /// Fargate.
  /// </note>
  final PidMode? pidMode;

  /// An array of placement constraint objects to use for tasks.
  /// <note>
  /// This parameter is not supported for tasks run on AWS Fargate.
  /// </note>
  final List<TaskDefinitionPlacementConstraint>? placementConstraints;

  /// The configuration details for the App Mesh proxy.
  ///
  /// Your Amazon ECS container instances require at least version 1.26.0 of the
  /// container agent and at least version 1.26.0-1 of the <code>ecs-init</code>
  /// package to enable a proxy configuration. If your container instances are
  /// launched from the Amazon ECS-optimized AMI version <code>20190301</code> or
  /// later, then they contain the required versions of the container agent and
  /// <code>ecs-init</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final ProxyConfiguration? proxyConfiguration;

  /// The Unix timestamp for when the task definition was registered.
  final DateTime? registeredAt;

  /// The principal that registered the task definition.
  final String? registeredBy;

  /// The container instance attributes required by your task. When an Amazon EC2
  /// instance is registered to your cluster, the Amazon ECS container agent
  /// assigns some standard attributes to the instance. You can apply custom
  /// attributes, specified as key-value pairs using the Amazon ECS console or the
  /// <a>PutAttributes</a> API. These attributes are used when considering task
  /// placement for tasks hosted on Amazon EC2 instances. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes">Attributes</a>
  /// in the <i>Amazon Elastic Container Service Developer Guide</i>.
  /// <note>
  /// This parameter is not supported for tasks run on AWS Fargate.
  /// </note>
  final List<Attribute>? requiresAttributes;

  /// The task launch types the task definition was validated against. To
  /// determine which task launch types the task definition is validated for, see
  /// the <a>TaskDefinition$compatibilities</a> parameter.
  final List<Compatibility>? requiresCompatibilities;

  /// The revision of the task in a particular family. The revision is a version
  /// number of a task definition in a family. When you register a task definition
  /// for the first time, the revision is <code>1</code>. Each time that you
  /// register a new revision of a task definition in the same family, the
  /// revision value always increases by one, even if you have deregistered
  /// previous revisions in this family.
  final int? revision;

  /// The status of the task definition.
  final TaskDefinitionStatus? status;

  /// The full Amazon Resource Name (ARN) of the task definition.
  final String? taskDefinitionArn;

  /// The short name or full Amazon Resource Name (ARN) of the AWS Identity and
  /// Access Management (IAM) role that grants containers in the task permission
  /// to call AWS APIs on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">Amazon
  /// ECS Task Role</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// IAM roles for tasks on Windows require that the
  /// <code>-EnableTaskIAMRole</code> option is set when you launch the Amazon
  /// ECS-optimized Windows AMI. Your containers must also run some configuration
  /// code in order to take advantage of the feature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows_task_IAM_roles.html">Windows
  /// IAM roles for tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? taskRoleArn;

  /// The list of data volume definitions for the task. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html">Using
  /// data volumes in tasks</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// <note>
  /// The <code>host</code> and <code>sourcePath</code> parameters are not
  /// supported for tasks run on AWS Fargate.
  /// </note>
  final List<Volume>? volumes;

  TaskDefinition({
    this.compatibilities,
    this.containerDefinitions,
    this.cpu,
    this.deregisteredAt,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.family,
    this.inferenceAccelerators,
    this.ipcMode,
    this.memory,
    this.networkMode,
    this.pidMode,
    this.placementConstraints,
    this.proxyConfiguration,
    this.registeredAt,
    this.registeredBy,
    this.requiresAttributes,
    this.requiresCompatibilities,
    this.revision,
    this.status,
    this.taskDefinitionArn,
    this.taskRoleArn,
    this.volumes,
  });

  factory TaskDefinition.fromJson(Map<String, dynamic> json) {
    return TaskDefinition(
      compatibilities: (json['compatibilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCompatibility())
          .toList(),
      containerDefinitions: (json['containerDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['cpu'] as String?,
      deregisteredAt: timeStampFromJson(json['deregisteredAt']),
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      family: json['family'] as String?,
      inferenceAccelerators: (json['inferenceAccelerators'] as List?)
          ?.whereNotNull()
          .map((e) => InferenceAccelerator.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipcMode: (json['ipcMode'] as String?)?.toIpcMode(),
      memory: json['memory'] as String?,
      networkMode: (json['networkMode'] as String?)?.toNetworkMode(),
      pidMode: (json['pidMode'] as String?)?.toPidMode(),
      placementConstraints: (json['placementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => TaskDefinitionPlacementConstraint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      proxyConfiguration: json['proxyConfiguration'] != null
          ? ProxyConfiguration.fromJson(
              json['proxyConfiguration'] as Map<String, dynamic>)
          : null,
      registeredAt: timeStampFromJson(json['registeredAt']),
      registeredBy: json['registeredBy'] as String?,
      requiresAttributes: (json['requiresAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiresCompatibilities: (json['requiresCompatibilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCompatibility())
          .toList(),
      revision: json['revision'] as int?,
      status: (json['status'] as String?)?.toTaskDefinitionStatus(),
      taskDefinitionArn: json['taskDefinitionArn'] as String?,
      taskRoleArn: json['taskRoleArn'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibilities = this.compatibilities;
    final containerDefinitions = this.containerDefinitions;
    final cpu = this.cpu;
    final deregisteredAt = this.deregisteredAt;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final family = this.family;
    final inferenceAccelerators = this.inferenceAccelerators;
    final ipcMode = this.ipcMode;
    final memory = this.memory;
    final networkMode = this.networkMode;
    final pidMode = this.pidMode;
    final placementConstraints = this.placementConstraints;
    final proxyConfiguration = this.proxyConfiguration;
    final registeredAt = this.registeredAt;
    final registeredBy = this.registeredBy;
    final requiresAttributes = this.requiresAttributes;
    final requiresCompatibilities = this.requiresCompatibilities;
    final revision = this.revision;
    final status = this.status;
    final taskDefinitionArn = this.taskDefinitionArn;
    final taskRoleArn = this.taskRoleArn;
    final volumes = this.volumes;
    return {
      if (compatibilities != null)
        'compatibilities': compatibilities.map((e) => e.toValue()).toList(),
      if (containerDefinitions != null)
        'containerDefinitions': containerDefinitions,
      if (cpu != null) 'cpu': cpu,
      if (deregisteredAt != null)
        'deregisteredAt': unixTimestampToJson(deregisteredAt),
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (family != null) 'family': family,
      if (inferenceAccelerators != null)
        'inferenceAccelerators': inferenceAccelerators,
      if (ipcMode != null) 'ipcMode': ipcMode.toValue(),
      if (memory != null) 'memory': memory,
      if (networkMode != null) 'networkMode': networkMode.toValue(),
      if (pidMode != null) 'pidMode': pidMode.toValue(),
      if (placementConstraints != null)
        'placementConstraints': placementConstraints,
      if (proxyConfiguration != null) 'proxyConfiguration': proxyConfiguration,
      if (registeredAt != null)
        'registeredAt': unixTimestampToJson(registeredAt),
      if (registeredBy != null) 'registeredBy': registeredBy,
      if (requiresAttributes != null) 'requiresAttributes': requiresAttributes,
      if (requiresCompatibilities != null)
        'requiresCompatibilities':
            requiresCompatibilities.map((e) => e.toValue()).toList(),
      if (revision != null) 'revision': revision,
      if (status != null) 'status': status.toValue(),
      if (taskDefinitionArn != null) 'taskDefinitionArn': taskDefinitionArn,
      if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

enum TaskDefinitionFamilyStatus {
  active,
  inactive,
  all,
}

extension on TaskDefinitionFamilyStatus {
  String toValue() {
    switch (this) {
      case TaskDefinitionFamilyStatus.active:
        return 'ACTIVE';
      case TaskDefinitionFamilyStatus.inactive:
        return 'INACTIVE';
      case TaskDefinitionFamilyStatus.all:
        return 'ALL';
    }
  }
}

extension on String {
  TaskDefinitionFamilyStatus toTaskDefinitionFamilyStatus() {
    switch (this) {
      case 'ACTIVE':
        return TaskDefinitionFamilyStatus.active;
      case 'INACTIVE':
        return TaskDefinitionFamilyStatus.inactive;
      case 'ALL':
        return TaskDefinitionFamilyStatus.all;
    }
    throw Exception('$this is not known in enum TaskDefinitionFamilyStatus');
  }
}

enum TaskDefinitionField {
  tags,
}

extension on TaskDefinitionField {
  String toValue() {
    switch (this) {
      case TaskDefinitionField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  TaskDefinitionField toTaskDefinitionField() {
    switch (this) {
      case 'TAGS':
        return TaskDefinitionField.tags;
    }
    throw Exception('$this is not known in enum TaskDefinitionField');
  }
}

/// An object representing a constraint on task placement in the task
/// definition. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// placement constraints</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// Task placement constraints are not supported for tasks run on AWS Fargate.
/// </note>
class TaskDefinitionPlacementConstraint {
  /// A cluster query language expression to apply to the constraint. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// query language</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? expression;

  /// The type of constraint. The <code>MemberOf</code> constraint restricts
  /// selection to be from a group of valid candidates.
  final TaskDefinitionPlacementConstraintType? type;

  TaskDefinitionPlacementConstraint({
    this.expression,
    this.type,
  });

  factory TaskDefinitionPlacementConstraint.fromJson(
      Map<String, dynamic> json) {
    return TaskDefinitionPlacementConstraint(
      expression: json['expression'] as String?,
      type:
          (json['type'] as String?)?.toTaskDefinitionPlacementConstraintType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum TaskDefinitionPlacementConstraintType {
  memberOf,
}

extension on TaskDefinitionPlacementConstraintType {
  String toValue() {
    switch (this) {
      case TaskDefinitionPlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension on String {
  TaskDefinitionPlacementConstraintType
      toTaskDefinitionPlacementConstraintType() {
    switch (this) {
      case 'memberOf':
        return TaskDefinitionPlacementConstraintType.memberOf;
    }
    throw Exception(
        '$this is not known in enum TaskDefinitionPlacementConstraintType');
  }
}

enum TaskDefinitionStatus {
  active,
  inactive,
}

extension on TaskDefinitionStatus {
  String toValue() {
    switch (this) {
      case TaskDefinitionStatus.active:
        return 'ACTIVE';
      case TaskDefinitionStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
  TaskDefinitionStatus toTaskDefinitionStatus() {
    switch (this) {
      case 'ACTIVE':
        return TaskDefinitionStatus.active;
      case 'INACTIVE':
        return TaskDefinitionStatus.inactive;
    }
    throw Exception('$this is not known in enum TaskDefinitionStatus');
  }
}

enum TaskField {
  tags,
}

extension on TaskField {
  String toValue() {
    switch (this) {
      case TaskField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  TaskField toTaskField() {
    switch (this) {
      case 'TAGS':
        return TaskField.tags;
    }
    throw Exception('$this is not known in enum TaskField');
  }
}

/// The overrides associated with a task.
class TaskOverride {
  /// One or more container overrides sent to a task.
  final List<ContainerOverride>? containerOverrides;

  /// The cpu override for the task.
  final String? cpu;

  /// The ephemeral storage setting override for the task.
  /// <note>
  /// This parameter is only supported for tasks hosted on AWS Fargate using
  /// platform version <code>1.4.0</code> or later.
  /// </note>
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the task execution IAM role override for
  /// the task.
  final String? executionRoleArn;

  /// The Elastic Inference accelerator override for the task.
  final List<InferenceAcceleratorOverride>? inferenceAcceleratorOverrides;

  /// The memory override for the task.
  final String? memory;

  /// The Amazon Resource Name (ARN) of the IAM role that containers in this task
  /// can assume. All containers in this task are granted the permissions that are
  /// specified in this role.
  final String? taskRoleArn;

  TaskOverride({
    this.containerOverrides,
    this.cpu,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.inferenceAcceleratorOverrides,
    this.memory,
    this.taskRoleArn,
  });

  factory TaskOverride.fromJson(Map<String, dynamic> json) {
    return TaskOverride(
      containerOverrides: (json['containerOverrides'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpu: json['cpu'] as String?,
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      inferenceAcceleratorOverrides: (json['inferenceAcceleratorOverrides']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              InferenceAcceleratorOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      memory: json['memory'] as String?,
      taskRoleArn: json['taskRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerOverrides = this.containerOverrides;
    final cpu = this.cpu;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final inferenceAcceleratorOverrides = this.inferenceAcceleratorOverrides;
    final memory = this.memory;
    final taskRoleArn = this.taskRoleArn;
    return {
      if (containerOverrides != null) 'containerOverrides': containerOverrides,
      if (cpu != null) 'cpu': cpu,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (inferenceAcceleratorOverrides != null)
        'inferenceAcceleratorOverrides': inferenceAcceleratorOverrides,
      if (memory != null) 'memory': memory,
      if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
    };
  }
}

/// Information about a set of Amazon ECS tasks in either an AWS CodeDeploy or
/// an <code>EXTERNAL</code> deployment. An Amazon ECS task set includes details
/// such as the desired number of tasks, how many tasks are running, and whether
/// the task set serves production traffic.
class TaskSet {
  /// The capacity provider strategy associated with the task set.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// The Amazon Resource Name (ARN) of the cluster that the service that hosts
  /// the task set exists in.
  final String? clusterArn;

  /// The computed desired count for the task set. This is calculated by
  /// multiplying the service's <code>desiredCount</code> by the task set's
  /// <code>scale</code> percentage. The result is always rounded up. For example,
  /// if the computed desired count is 1.2, it rounds up to 2 tasks.
  final int? computedDesiredCount;

  /// The Unix timestamp for when the task set was created.
  final DateTime? createdAt;

  /// The external ID associated with the task set.
  ///
  /// If a task set is created by an AWS CodeDeploy deployment, the
  /// <code>externalId</code> parameter contains the AWS CodeDeploy deployment ID.
  ///
  /// If a task set is created for an external deployment and is associated with a
  /// service discovery registry, the <code>externalId</code> parameter contains
  /// the <code>ECS_TASK_SET_EXTERNAL_ID</code> AWS Cloud Map attribute.
  final String? externalId;

  /// The ID of the task set.
  final String? id;

  /// The launch type the tasks in the task set are using. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// Details on a load balancer that is used with a task set.
  final List<LoadBalancer>? loadBalancers;

  /// The network configuration for the task set.
  final NetworkConfiguration? networkConfiguration;

  /// The number of tasks in the task set that are in the <code>PENDING</code>
  /// status during a deployment. A task in the <code>PENDING</code> state is
  /// preparing to enter the <code>RUNNING</code> state. A task set enters the
  /// <code>PENDING</code> status when it launches for the first time or when it
  /// is restarted after being in the <code>STOPPED</code> state.
  final int? pendingCount;

  /// The AWS Fargate platform version on which the tasks in the task set are
  /// running. A platform version is only specified for tasks run on AWS Fargate.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">AWS
  /// Fargate platform versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? platformVersion;

  /// The number of tasks in the task set that are in the <code>RUNNING</code>
  /// status during a deployment. A task in the <code>RUNNING</code> state is
  /// running and ready for use.
  final int? runningCount;

  /// A floating-point percentage of the desired number of tasks to place and keep
  /// running in the task set.
  final Scale? scale;

  /// The Amazon Resource Name (ARN) of the service the task set exists in.
  final String? serviceArn;

  /// The details of the service discovery registries to assign to this task set.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// discovery</a>.
  final List<ServiceRegistry>? serviceRegistries;

  /// The stability status, which indicates whether the task set has reached a
  /// steady state. If the following conditions are met, the task set will be in
  /// <code>STEADY_STATE</code>:
  ///
  /// <ul>
  /// <li>
  /// The task <code>runningCount</code> is equal to the
  /// <code>computedDesiredCount</code>.
  /// </li>
  /// <li>
  /// The <code>pendingCount</code> is <code>0</code>.
  /// </li>
  /// <li>
  /// There are no tasks running on container instances in the
  /// <code>DRAINING</code> status.
  /// </li>
  /// <li>
  /// All tasks are reporting a healthy status from the load balancers, service
  /// discovery, and container health checks.
  /// </li>
  /// </ul>
  /// If any of those conditions are not met, the stability status returns
  /// <code>STABILIZING</code>.
  final StabilityStatus? stabilityStatus;

  /// The Unix timestamp for when the task set stability status was retrieved.
  final DateTime? stabilityStatusAt;

  /// The tag specified when a task set is started. If the task set is created by
  /// an AWS CodeDeploy deployment, the <code>startedBy</code> parameter is
  /// <code>CODE_DEPLOY</code>. For a task set created for an external deployment,
  /// the startedBy field isn't used.
  final String? startedBy;

  /// The status of the task set. The following describes each state:
  /// <dl> <dt>PRIMARY</dt> <dd>
  /// The task set is serving production traffic.
  /// </dd> <dt>ACTIVE</dt> <dd>
  /// The task set is not serving production traffic.
  /// </dd> <dt>DRAINING</dt> <dd>
  /// The tasks in the task set are being stopped and their corresponding targets
  /// are being deregistered from their target group.
  /// </dd> </dl>
  final String? status;

  /// The metadata that you apply to the task set to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case-sensitive.
  /// </li>
  /// <li>
  /// Do not use <code>aws:</code>, <code>AWS:</code>, or any upper or lowercase
  /// combination of such as a prefix for either keys or values as it is reserved
  /// for AWS use. You cannot edit or delete tag keys or values with this prefix.
  /// Tags with this prefix do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The task definition the task set is using.
  final String? taskDefinition;

  /// The Amazon Resource Name (ARN) of the task set.
  final String? taskSetArn;

  /// The Unix timestamp for when the task set was last updated.
  final DateTime? updatedAt;

  TaskSet({
    this.capacityProviderStrategy,
    this.clusterArn,
    this.computedDesiredCount,
    this.createdAt,
    this.externalId,
    this.id,
    this.launchType,
    this.loadBalancers,
    this.networkConfiguration,
    this.pendingCount,
    this.platformVersion,
    this.runningCount,
    this.scale,
    this.serviceArn,
    this.serviceRegistries,
    this.stabilityStatus,
    this.stabilityStatusAt,
    this.startedBy,
    this.status,
    this.tags,
    this.taskDefinition,
    this.taskSetArn,
    this.updatedAt,
  });

  factory TaskSet.fromJson(Map<String, dynamic> json) {
    return TaskSet(
      capacityProviderStrategy: (json['capacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusterArn: json['clusterArn'] as String?,
      computedDesiredCount: json['computedDesiredCount'] as int?,
      createdAt: timeStampFromJson(json['createdAt']),
      externalId: json['externalId'] as String?,
      id: json['id'] as String?,
      launchType: (json['launchType'] as String?)?.toLaunchType(),
      loadBalancers: (json['loadBalancers'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancer.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      pendingCount: json['pendingCount'] as int?,
      platformVersion: json['platformVersion'] as String?,
      runningCount: json['runningCount'] as int?,
      scale: json['scale'] != null
          ? Scale.fromJson(json['scale'] as Map<String, dynamic>)
          : null,
      serviceArn: json['serviceArn'] as String?,
      serviceRegistries: (json['serviceRegistries'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceRegistry.fromJson(e as Map<String, dynamic>))
          .toList(),
      stabilityStatus:
          (json['stabilityStatus'] as String?)?.toStabilityStatus(),
      stabilityStatusAt: timeStampFromJson(json['stabilityStatusAt']),
      startedBy: json['startedBy'] as String?,
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDefinition: json['taskDefinition'] as String?,
      taskSetArn: json['taskSetArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final clusterArn = this.clusterArn;
    final computedDesiredCount = this.computedDesiredCount;
    final createdAt = this.createdAt;
    final externalId = this.externalId;
    final id = this.id;
    final launchType = this.launchType;
    final loadBalancers = this.loadBalancers;
    final networkConfiguration = this.networkConfiguration;
    final pendingCount = this.pendingCount;
    final platformVersion = this.platformVersion;
    final runningCount = this.runningCount;
    final scale = this.scale;
    final serviceArn = this.serviceArn;
    final serviceRegistries = this.serviceRegistries;
    final stabilityStatus = this.stabilityStatus;
    final stabilityStatusAt = this.stabilityStatusAt;
    final startedBy = this.startedBy;
    final status = this.status;
    final tags = this.tags;
    final taskDefinition = this.taskDefinition;
    final taskSetArn = this.taskSetArn;
    final updatedAt = this.updatedAt;
    return {
      if (capacityProviderStrategy != null)
        'capacityProviderStrategy': capacityProviderStrategy,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (computedDesiredCount != null)
        'computedDesiredCount': computedDesiredCount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (externalId != null) 'externalId': externalId,
      if (id != null) 'id': id,
      if (launchType != null) 'launchType': launchType.toValue(),
      if (loadBalancers != null) 'loadBalancers': loadBalancers,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (pendingCount != null) 'pendingCount': pendingCount,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (runningCount != null) 'runningCount': runningCount,
      if (scale != null) 'scale': scale,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
      if (stabilityStatus != null) 'stabilityStatus': stabilityStatus.toValue(),
      if (stabilityStatusAt != null)
        'stabilityStatusAt': unixTimestampToJson(stabilityStatusAt),
      if (startedBy != null) 'startedBy': startedBy,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
      if (taskSetArn != null) 'taskSetArn': taskSetArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum TaskSetField {
  tags,
}

extension on TaskSetField {
  String toValue() {
    switch (this) {
      case TaskSetField.tags:
        return 'TAGS';
    }
  }
}

extension on String {
  TaskSetField toTaskSetField() {
    switch (this) {
      case 'TAGS':
        return TaskSetField.tags;
    }
    throw Exception('$this is not known in enum TaskSetField');
  }
}

enum TaskStopCode {
  taskFailedToStart,
  essentialContainerExited,
  userInitiated,
}

extension on TaskStopCode {
  String toValue() {
    switch (this) {
      case TaskStopCode.taskFailedToStart:
        return 'TaskFailedToStart';
      case TaskStopCode.essentialContainerExited:
        return 'EssentialContainerExited';
      case TaskStopCode.userInitiated:
        return 'UserInitiated';
    }
  }
}

extension on String {
  TaskStopCode toTaskStopCode() {
    switch (this) {
      case 'TaskFailedToStart':
        return TaskStopCode.taskFailedToStart;
      case 'EssentialContainerExited':
        return TaskStopCode.essentialContainerExited;
      case 'UserInitiated':
        return TaskStopCode.userInitiated;
    }
    throw Exception('$this is not known in enum TaskStopCode');
  }
}

/// The container path, mount options, and size of the tmpfs mount.
class Tmpfs {
  /// The absolute file path where the tmpfs volume is to be mounted.
  final String containerPath;

  /// The maximum size (in MiB) of the tmpfs volume.
  final int size;

  /// The list of tmpfs volume mount options.
  ///
  /// Valid values: <code>"defaults" | "ro" | "rw" | "suid" | "nosuid" | "dev" |
  /// "nodev" | "exec" | "noexec" | "sync" | "async" | "dirsync" | "remount" |
  /// "mand" | "nomand" | "atime" | "noatime" | "diratime" | "nodiratime" | "bind"
  /// | "rbind" | "unbindable" | "runbindable" | "private" | "rprivate" | "shared"
  /// | "rshared" | "slave" | "rslave" | "relatime" | "norelatime" | "strictatime"
  /// | "nostrictatime" | "mode" | "uid" | "gid" | "nr_inodes" | "nr_blocks" |
  /// "mpol"</code>
  final List<String>? mountOptions;

  Tmpfs({
    required this.containerPath,
    required this.size,
    this.mountOptions,
  });

  factory Tmpfs.fromJson(Map<String, dynamic> json) {
    return Tmpfs(
      containerPath: json['containerPath'] as String,
      size: json['size'] as int,
      mountOptions: (json['mountOptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerPath = this.containerPath;
    final size = this.size;
    final mountOptions = this.mountOptions;
    return {
      'containerPath': containerPath,
      'size': size,
      if (mountOptions != null) 'mountOptions': mountOptions,
    };
  }
}

enum TransportProtocol {
  tcp,
  udp,
}

extension on TransportProtocol {
  String toValue() {
    switch (this) {
      case TransportProtocol.tcp:
        return 'tcp';
      case TransportProtocol.udp:
        return 'udp';
    }
  }
}

extension on String {
  TransportProtocol toTransportProtocol() {
    switch (this) {
      case 'tcp':
        return TransportProtocol.tcp;
      case 'udp':
        return TransportProtocol.udp;
    }
    throw Exception('$this is not known in enum TransportProtocol');
  }
}

/// The <code>ulimit</code> settings to pass to the container.
///
/// Amazon ECS tasks hosted on Fargate use the default resource limit values set
/// by the operating system with the exception of the <code>nofile</code>
/// resource limit parameter which Fargate overrides. The <code>nofile</code>
/// resource limit sets a restriction on the number of open files that a
/// container can use. The default <code>nofile</code> soft limit is
/// <code>1024</code> and hard limit is <code>4096</code>.
class Ulimit {
  /// The hard limit for the ulimit type.
  final int hardLimit;

  /// The <code>type</code> of the <code>ulimit</code>.
  final UlimitName name;

  /// The soft limit for the ulimit type.
  final int softLimit;

  Ulimit({
    required this.hardLimit,
    required this.name,
    required this.softLimit,
  });

  factory Ulimit.fromJson(Map<String, dynamic> json) {
    return Ulimit(
      hardLimit: json['hardLimit'] as int,
      name: (json['name'] as String).toUlimitName(),
      softLimit: json['softLimit'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hardLimit = this.hardLimit;
    final name = this.name;
    final softLimit = this.softLimit;
    return {
      'hardLimit': hardLimit,
      'name': name.toValue(),
      'softLimit': softLimit,
    };
  }
}

enum UlimitName {
  core,
  cpu,
  data,
  fsize,
  locks,
  memlock,
  msgqueue,
  nice,
  nofile,
  nproc,
  rss,
  rtprio,
  rttime,
  sigpending,
  stack,
}

extension on UlimitName {
  String toValue() {
    switch (this) {
      case UlimitName.core:
        return 'core';
      case UlimitName.cpu:
        return 'cpu';
      case UlimitName.data:
        return 'data';
      case UlimitName.fsize:
        return 'fsize';
      case UlimitName.locks:
        return 'locks';
      case UlimitName.memlock:
        return 'memlock';
      case UlimitName.msgqueue:
        return 'msgqueue';
      case UlimitName.nice:
        return 'nice';
      case UlimitName.nofile:
        return 'nofile';
      case UlimitName.nproc:
        return 'nproc';
      case UlimitName.rss:
        return 'rss';
      case UlimitName.rtprio:
        return 'rtprio';
      case UlimitName.rttime:
        return 'rttime';
      case UlimitName.sigpending:
        return 'sigpending';
      case UlimitName.stack:
        return 'stack';
    }
  }
}

extension on String {
  UlimitName toUlimitName() {
    switch (this) {
      case 'core':
        return UlimitName.core;
      case 'cpu':
        return UlimitName.cpu;
      case 'data':
        return UlimitName.data;
      case 'fsize':
        return UlimitName.fsize;
      case 'locks':
        return UlimitName.locks;
      case 'memlock':
        return UlimitName.memlock;
      case 'msgqueue':
        return UlimitName.msgqueue;
      case 'nice':
        return UlimitName.nice;
      case 'nofile':
        return UlimitName.nofile;
      case 'nproc':
        return UlimitName.nproc;
      case 'rss':
        return UlimitName.rss;
      case 'rtprio':
        return UlimitName.rtprio;
      case 'rttime':
        return UlimitName.rttime;
      case 'sigpending':
        return UlimitName.sigpending;
      case 'stack':
        return UlimitName.stack;
    }
    throw Exception('$this is not known in enum UlimitName');
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

class UpdateCapacityProviderResponse {
  /// Details about the capacity provider.
  final CapacityProvider? capacityProvider;

  UpdateCapacityProviderResponse({
    this.capacityProvider,
  });

  factory UpdateCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCapacityProviderResponse(
      capacityProvider: json['capacityProvider'] != null
          ? CapacityProvider.fromJson(
              json['capacityProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      if (capacityProvider != null) 'capacityProvider': capacityProvider,
    };
  }
}

class UpdateClusterResponse {
  /// Details about the cluster.
  final Cluster? cluster;

  UpdateClusterResponse({
    this.cluster,
  });

  factory UpdateClusterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterResponse(
      cluster: json['cluster'] != null
          ? Cluster.fromJson(json['cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'cluster': cluster,
    };
  }
}

class UpdateClusterSettingsResponse {
  /// Details about the cluster
  final Cluster? cluster;

  UpdateClusterSettingsResponse({
    this.cluster,
  });

  factory UpdateClusterSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterSettingsResponse(
      cluster: json['cluster'] != null
          ? Cluster.fromJson(json['cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'cluster': cluster,
    };
  }
}

class UpdateContainerAgentResponse {
  /// The container instance for which the container agent was updated.
  final ContainerInstance? containerInstance;

  UpdateContainerAgentResponse({
    this.containerInstance,
  });

  factory UpdateContainerAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateContainerAgentResponse(
      containerInstance: json['containerInstance'] != null
          ? ContainerInstance.fromJson(
              json['containerInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstance = this.containerInstance;
    return {
      if (containerInstance != null) 'containerInstance': containerInstance,
    };
  }
}

class UpdateContainerInstancesStateResponse {
  /// The list of container instances.
  final List<ContainerInstance>? containerInstances;

  /// Any failures associated with the call.
  final List<Failure>? failures;

  UpdateContainerInstancesStateResponse({
    this.containerInstances,
    this.failures,
  });

  factory UpdateContainerInstancesStateResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateContainerInstancesStateResponse(
      containerInstances: (json['containerInstances'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstances = this.containerInstances;
    final failures = this.failures;
    return {
      if (containerInstances != null) 'containerInstances': containerInstances,
      if (failures != null) 'failures': failures,
    };
  }
}

class UpdateServicePrimaryTaskSetResponse {
  /// Details about the task set.
  final TaskSet? taskSet;

  UpdateServicePrimaryTaskSetResponse({
    this.taskSet,
  });

  factory UpdateServicePrimaryTaskSetResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateServicePrimaryTaskSetResponse(
      taskSet: json['taskSet'] != null
          ? TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskSet = this.taskSet;
    return {
      if (taskSet != null) 'taskSet': taskSet,
    };
  }
}

class UpdateServiceResponse {
  /// The full description of your service following the update call.
  final Service? service;

  UpdateServiceResponse({
    this.service,
  });

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      if (service != null) 'service': service,
    };
  }
}

class UpdateTaskSetResponse {
  /// Details about the task set.
  final TaskSet? taskSet;

  UpdateTaskSetResponse({
    this.taskSet,
  });

  factory UpdateTaskSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTaskSetResponse(
      taskSet: json['taskSet'] != null
          ? TaskSet.fromJson(json['taskSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final taskSet = this.taskSet;
    return {
      if (taskSet != null) 'taskSet': taskSet,
    };
  }
}

/// The Docker and Amazon ECS container agent version information about a
/// container instance.
class VersionInfo {
  /// The Git commit hash for the Amazon ECS container agent build on the <a
  /// href="https://github.com/aws/amazon-ecs-agent/commits/master">amazon-ecs-agent
  /// </a> GitHub repository.
  final String? agentHash;

  /// The version number of the Amazon ECS container agent.
  final String? agentVersion;

  /// The Docker version running on the container instance.
  final String? dockerVersion;

  VersionInfo({
    this.agentHash,
    this.agentVersion,
    this.dockerVersion,
  });

  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    return VersionInfo(
      agentHash: json['agentHash'] as String?,
      agentVersion: json['agentVersion'] as String?,
      dockerVersion: json['dockerVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentHash = this.agentHash;
    final agentVersion = this.agentVersion;
    final dockerVersion = this.dockerVersion;
    return {
      if (agentHash != null) 'agentHash': agentHash,
      if (agentVersion != null) 'agentVersion': agentVersion,
      if (dockerVersion != null) 'dockerVersion': dockerVersion,
    };
  }
}

/// A data volume used in a task definition. For tasks that use the Amazon
/// Elastic File System (Amazon EFS), specify an
/// <code>efsVolumeConfiguration</code>. For Windows tasks that use Amazon FSx
/// for Windows File Server file system, specify a
/// <code>fsxWindowsFileServerVolumeConfiguration</code>. For tasks that use a
/// Docker volume, specify a <code>DockerVolumeConfiguration</code>. For tasks
/// that use a bind mount host volume, specify a <code>host</code> and optional
/// <code>sourcePath</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html">Using
/// Data Volumes in Tasks</a>.
class Volume {
  /// This parameter is specified when you are using Docker volumes.
  ///
  /// Windows containers only support the use of the <code>local</code> driver. To
  /// use bind mounts, specify the <code>host</code> parameter instead.
  /// <note>
  /// Docker volumes are not supported by tasks run on AWS Fargate.
  /// </note>
  final DockerVolumeConfiguration? dockerVolumeConfiguration;

  /// This parameter is specified when you are using an Amazon Elastic File System
  /// file system for task storage.
  final EFSVolumeConfiguration? efsVolumeConfiguration;

  /// This parameter is specified when you are using Amazon FSx for Windows File
  /// Server file system for task storage.
  final FSxWindowsFileServerVolumeConfiguration?
      fsxWindowsFileServerVolumeConfiguration;

  /// This parameter is specified when you are using bind mount host volumes. The
  /// contents of the <code>host</code> parameter determine whether your bind
  /// mount host volume persists on the host container instance and where it is
  /// stored. If the <code>host</code> parameter is empty, then the Docker daemon
  /// assigns a host path for your data volume. However, the data is not
  /// guaranteed to persist after the containers associated with it stop running.
  ///
  /// Windows containers can mount whole directories on the same drive as
  /// <code>$env:ProgramData</code>. Windows containers cannot mount directories
  /// on a different drive, and mount point cannot be across drives. For example,
  /// you can mount <code>C:\my\path:C:\my\path</code> and <code>D:\:D:\</code>,
  /// but not <code>D:\my\path:C:\my\path</code> or <code>D:\:C:\my\path</code>.
  final HostVolumeProperties? host;

  /// The name of the volume. Up to 255 letters (uppercase and lowercase),
  /// numbers, underscores, and hyphens are allowed. This name is referenced in
  /// the <code>sourceVolume</code> parameter of container definition
  /// <code>mountPoints</code>.
  final String? name;

  Volume({
    this.dockerVolumeConfiguration,
    this.efsVolumeConfiguration,
    this.fsxWindowsFileServerVolumeConfiguration,
    this.host,
    this.name,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      dockerVolumeConfiguration: json['dockerVolumeConfiguration'] != null
          ? DockerVolumeConfiguration.fromJson(
              json['dockerVolumeConfiguration'] as Map<String, dynamic>)
          : null,
      efsVolumeConfiguration: json['efsVolumeConfiguration'] != null
          ? EFSVolumeConfiguration.fromJson(
              json['efsVolumeConfiguration'] as Map<String, dynamic>)
          : null,
      fsxWindowsFileServerVolumeConfiguration:
          json['fsxWindowsFileServerVolumeConfiguration'] != null
              ? FSxWindowsFileServerVolumeConfiguration.fromJson(
                  json['fsxWindowsFileServerVolumeConfiguration']
                      as Map<String, dynamic>)
              : null,
      host: json['host'] != null
          ? HostVolumeProperties.fromJson(json['host'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dockerVolumeConfiguration = this.dockerVolumeConfiguration;
    final efsVolumeConfiguration = this.efsVolumeConfiguration;
    final fsxWindowsFileServerVolumeConfiguration =
        this.fsxWindowsFileServerVolumeConfiguration;
    final host = this.host;
    final name = this.name;
    return {
      if (dockerVolumeConfiguration != null)
        'dockerVolumeConfiguration': dockerVolumeConfiguration,
      if (efsVolumeConfiguration != null)
        'efsVolumeConfiguration': efsVolumeConfiguration,
      if (fsxWindowsFileServerVolumeConfiguration != null)
        'fsxWindowsFileServerVolumeConfiguration':
            fsxWindowsFileServerVolumeConfiguration,
      if (host != null) 'host': host,
      if (name != null) 'name': name,
    };
  }
}

/// Details on a data volume from another container in the same task definition.
class VolumeFrom {
  /// If this value is <code>true</code>, the container has read-only access to
  /// the volume. If this value is <code>false</code>, then the container can
  /// write to the volume. The default value is <code>false</code>.
  final bool? readOnly;

  /// The name of another container within the same task definition from which to
  /// mount volumes.
  final String? sourceContainer;

  VolumeFrom({
    this.readOnly,
    this.sourceContainer,
  });

  factory VolumeFrom.fromJson(Map<String, dynamic> json) {
    return VolumeFrom(
      readOnly: json['readOnly'] as bool?,
      sourceContainer: json['sourceContainer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readOnly = this.readOnly;
    final sourceContainer = this.sourceContainer;
    return {
      if (readOnly != null) 'readOnly': readOnly,
      if (sourceContainer != null) 'sourceContainer': sourceContainer,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AttributeLimitExceededException extends _s.GenericAwsException {
  AttributeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'AttributeLimitExceededException',
            message: message);
}

class BlockedException extends _s.GenericAwsException {
  BlockedException({String? type, String? message})
      : super(type: type, code: 'BlockedException', message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

class ClusterContainsContainerInstancesException
    extends _s.GenericAwsException {
  ClusterContainsContainerInstancesException({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterContainsContainerInstancesException',
            message: message);
}

class ClusterContainsServicesException extends _s.GenericAwsException {
  ClusterContainsServicesException({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterContainsServicesException',
            message: message);
}

class ClusterContainsTasksException extends _s.GenericAwsException {
  ClusterContainsTasksException({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterContainsTasksException',
            message: message);
}

class ClusterNotFoundException extends _s.GenericAwsException {
  ClusterNotFoundException({String? type, String? message})
      : super(type: type, code: 'ClusterNotFoundException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MissingVersionException extends _s.GenericAwsException {
  MissingVersionException({String? type, String? message})
      : super(type: type, code: 'MissingVersionException', message: message);
}

class NoUpdateAvailableException extends _s.GenericAwsException {
  NoUpdateAvailableException({String? type, String? message})
      : super(type: type, code: 'NoUpdateAvailableException', message: message);
}

class PlatformTaskDefinitionIncompatibilityException
    extends _s.GenericAwsException {
  PlatformTaskDefinitionIncompatibilityException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'PlatformTaskDefinitionIncompatibilityException',
            message: message);
}

class PlatformUnknownException extends _s.GenericAwsException {
  PlatformUnknownException({String? type, String? message})
      : super(type: type, code: 'PlatformUnknownException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

class ServiceNotActiveException extends _s.GenericAwsException {
  ServiceNotActiveException({String? type, String? message})
      : super(type: type, code: 'ServiceNotActiveException', message: message);
}

class ServiceNotFoundException extends _s.GenericAwsException {
  ServiceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ServiceNotFoundException', message: message);
}

class TargetNotConnectedException extends _s.GenericAwsException {
  TargetNotConnectedException({String? type, String? message})
      : super(
            type: type, code: 'TargetNotConnectedException', message: message);
}

class TargetNotFoundException extends _s.GenericAwsException {
  TargetNotFoundException({String? type, String? message})
      : super(type: type, code: 'TargetNotFoundException', message: message);
}

class TaskSetNotFoundException extends _s.GenericAwsException {
  TaskSetNotFoundException({String? type, String? message})
      : super(type: type, code: 'TaskSetNotFoundException', message: message);
}

class UnsupportedFeatureException extends _s.GenericAwsException {
  UnsupportedFeatureException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedFeatureException', message: message);
}

class UpdateInProgressException extends _s.GenericAwsException {
  UpdateInProgressException({String? type, String? message})
      : super(type: type, code: 'UpdateInProgressException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AttributeLimitExceededException': (type, message) =>
      AttributeLimitExceededException(type: type, message: message),
  'BlockedException': (type, message) =>
      BlockedException(type: type, message: message),
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'ClusterContainsContainerInstancesException': (type, message) =>
      ClusterContainsContainerInstancesException(type: type, message: message),
  'ClusterContainsServicesException': (type, message) =>
      ClusterContainsServicesException(type: type, message: message),
  'ClusterContainsTasksException': (type, message) =>
      ClusterContainsTasksException(type: type, message: message),
  'ClusterNotFoundException': (type, message) =>
      ClusterNotFoundException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingVersionException': (type, message) =>
      MissingVersionException(type: type, message: message),
  'NoUpdateAvailableException': (type, message) =>
      NoUpdateAvailableException(type: type, message: message),
  'PlatformTaskDefinitionIncompatibilityException': (type, message) =>
      PlatformTaskDefinitionIncompatibilityException(
          type: type, message: message),
  'PlatformUnknownException': (type, message) =>
      PlatformUnknownException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'ServiceNotActiveException': (type, message) =>
      ServiceNotActiveException(type: type, message: message),
  'ServiceNotFoundException': (type, message) =>
      ServiceNotFoundException(type: type, message: message),
  'TargetNotConnectedException': (type, message) =>
      TargetNotConnectedException(type: type, message: message),
  'TargetNotFoundException': (type, message) =>
      TargetNotFoundException(type: type, message: message),
  'TaskSetNotFoundException': (type, message) =>
      TaskSetNotFoundException(type: type, message: message),
  'UnsupportedFeatureException': (type, message) =>
      UnsupportedFeatureException(type: type, message: message),
  'UpdateInProgressException': (type, message) =>
      UpdateInProgressException(type: type, message: message),
};
