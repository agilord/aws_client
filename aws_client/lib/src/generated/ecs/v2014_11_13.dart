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

/// Amazon Elastic Container Service (Amazon ECS) is a highly scalable, fast,
/// container management service. It makes it easy to run, stop, and manage
/// Docker containers. You can host your cluster on a serverless infrastructure
/// that's managed by Amazon ECS by launching your services or tasks on Fargate.
/// For more control, you can host your tasks on a cluster of Amazon Elastic
/// Compute Cloud (Amazon EC2) or External (on-premises) instances that you
/// manage.
class Ecs {
  final _s.JsonProtocol _protocol;
  Ecs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ecs',
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

  /// Creates a new capacity provider. Capacity providers are associated with an
  /// Amazon ECS cluster and are used in capacity provider strategies to
  /// facilitate cluster auto scaling.
  ///
  /// Only capacity providers that use an Auto Scaling group can be created.
  /// Amazon ECS tasks on Fargate use the <code>FARGATE</code> and
  /// <code>FARGATE_SPOT</code> capacity providers. These providers are
  /// available to all accounts in the Amazon Web Services Regions that Fargate
  /// supports.
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
  /// The name of the capacity provider. Up to 255 characters are allowed. They
  /// include letters (both upper and lowercase letters), numbers, underscores
  /// (_), and hyphens (-). The name can't be prefixed with "<code>aws</code>",
  /// "<code>ecs</code>", or "<code>fargate</code>".
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the capacity provider to categorize and
  /// organize them more conveniently. Each tag consists of a key and an
  /// optional value. You define both of them.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateCapacityProviderResponse> createCapacityProvider({
    required AutoScalingGroupProvider autoScalingGroupProvider,
    required String name,
    List<Tag>? tags,
  }) async {
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
  /// to create the Amazon ECS service-linked role for your account. This is so
  /// that it can manage required resources in other Amazon Web Services
  /// services on your behalf. However, if the user that makes the call doesn't
  /// have permissions to create the service-linked role, it isn't created. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
  /// service-linked roles for Amazon ECS</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [NamespaceNotFoundException].
  ///
  /// Parameter [capacityProviders] :
  /// The short name of one or more capacity providers to associate with the
  /// cluster. A capacity provider must be associated with a cluster before it
  /// can be included as part of the default capacity provider strategy of the
  /// cluster or used in a capacity provider strategy when calling the <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html">CreateService</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html">RunTask</a>
  /// actions.
  ///
  /// If specifying a capacity provider that uses an Auto Scaling group, the
  /// capacity provider must be created but not associated with another cluster.
  /// New Auto Scaling group capacity providers can be created with the <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCapacityProvider.html">CreateCapacityProvider</a>
  /// API operation.
  ///
  /// To use a Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// Fargate capacity providers are available to all accounts and only need to
  /// be associated with a cluster to be used.
  ///
  /// The <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutCapacityProvider.html">PutCapacityProvider</a>
  /// API operation is used to update the list of available capacity providers
  /// for a cluster after the cluster is created.
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster. If you don't specify a name for your cluster,
  /// you create a cluster that's named <code>default</code>. Up to 255 letters
  /// (uppercase and lowercase), numbers, underscores, and hyphens are allowed.
  ///
  /// Parameter [configuration] :
  /// The <code>execute</code> command configuration for the cluster.
  ///
  /// Parameter [defaultCapacityProviderStrategy] :
  /// The capacity provider strategy to set as the default for the cluster.
  /// After a default capacity provider strategy is set for a cluster, when you
  /// call the <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html">CreateService</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html">RunTask</a>
  /// APIs with no capacity provider strategy or launch type specified, the
  /// default capacity provider strategy for the cluster is used.
  ///
  /// If a default capacity provider strategy isn't defined for a cluster when
  /// it was created, it can be defined later with the
  /// <a>PutClusterCapacityProviders</a> API operation.
  ///
  /// Parameter [serviceConnectDefaults] :
  /// Use this parameter to set a default Service Connect namespace. After you
  /// set a default Service Connect namespace, any new services with Service
  /// Connect turned on that are created in the cluster are added as client
  /// services in the namespace. This setting only applies to new services that
  /// set the <code>enabled</code> parameter to <code>true</code> in the
  /// <code>ServiceConnectConfiguration</code>. You can set the namespace of
  /// each service individually in the <code>ServiceConnectConfiguration</code>
  /// to override this default parameter.
  ///
  /// Tasks that run in a namespace can use short names to connect to services
  /// in the namespace. Tasks can connect to services across all of the clusters
  /// in the namespace. Tasks connect through a managed proxy container that
  /// collects logs and metrics for increased visibility. Only the tasks that
  /// Amazon ECS services create are supported with Service Connect. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [settings] :
  /// The setting to use when creating a cluster. This parameter is used to turn
  /// on CloudWatch Container Insights for a cluster. If this value is
  /// specified, it overrides the <code>containerInsights</code> value set with
  /// <a>PutAccountSetting</a> or <a>PutAccountSettingDefault</a>.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the cluster to help you categorize and
  /// organize them. Each tag consists of a key and an optional value. You
  /// define both.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  Future<CreateClusterResponse> createCluster({
    List<String>? capacityProviders,
    String? clusterName,
    ClusterConfiguration? configuration,
    List<CapacityProviderStrategyItem>? defaultCapacityProviderStrategy,
    ClusterServiceConnectDefaultsRequest? serviceConnectDefaults,
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
        if (serviceConnectDefaults != null)
          'serviceConnectDefaults': serviceConnectDefaults,
        if (settings != null) 'settings': settings,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Runs and maintains your desired number of tasks from a specified task
  /// definition. If the number of tasks running in a service drops below the
  /// <code>desiredCount</code>, Amazon ECS runs another copy of the task in the
  /// specified cluster. To update an existing service, see the
  /// <a>UpdateService</a> action.
  /// <note>
  /// On March 21, 2024, a change was made to resolve the task definition
  /// revision before authorization. When a task definition revision is not
  /// specified, authorization will occur using the latest revision of a task
  /// definition.
  /// </note>
  /// In addition to maintaining the desired count of tasks in your service, you
  /// can optionally run your service behind one or more load balancers. The
  /// load balancers distribute traffic across the tasks that are associated
  /// with the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html">Service
  /// load balancing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
  /// volume when creating or updating a service.
  /// <code>volumeConfigurations</code> is only supported for REPLICA service
  /// and not DAEMON service. For more infomation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Tasks for services that don't use a load balancer are considered healthy
  /// if they're in the <code>RUNNING</code> state. Tasks for services that use
  /// a load balancer are considered healthy if they're in the
  /// <code>RUNNING</code> state and are reported as healthy by the load
  /// balancer.
  ///
  /// There are two service scheduler strategies available:
  ///
  /// <ul>
  /// <li>
  /// <code>REPLICA</code> - The replica scheduling strategy places and
  /// maintains your desired number of tasks across your cluster. By default,
  /// the service scheduler spreads tasks across Availability Zones. You can use
  /// task placement strategies and constraints to customize task placement
  /// decisions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Service
  /// scheduler concepts</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>DAEMON</code> - The daemon scheduling strategy deploys exactly one
  /// task on each active container instance that meets all of the task
  /// placement constraints that you specify in your cluster. The service
  /// scheduler also evaluates the task placement constraints for running tasks.
  /// It also stops tasks that don't meet the placement constraints. When using
  /// this strategy, you don't need to specify a desired number of tasks, a task
  /// placement strategy, or use Service Auto Scaling policies. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Service
  /// scheduler concepts</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// </ul>
  /// You can optionally specify a deployment configuration for your service.
  /// The deployment is initiated by changing properties. For example, the
  /// deployment might be initiated by the task definition or by your desired
  /// count of a service. This is done with an <a>UpdateService</a> operation.
  /// The default value for a replica service for
  /// <code>minimumHealthyPercent</code> is 100%. The default value for a daemon
  /// service for <code>minimumHealthyPercent</code> is 0%.
  ///
  /// If a service uses the <code>ECS</code> deployment controller, the minimum
  /// healthy percent represents a lower limit on the number of tasks in a
  /// service that must remain in the <code>RUNNING</code> state during a
  /// deployment. Specifically, it represents it as a percentage of your desired
  /// number of tasks (rounded up to the nearest integer). This happens when any
  /// of your container instances are in the <code>DRAINING</code> state if the
  /// service contains tasks using the EC2 launch type. Using this parameter,
  /// you can deploy without using additional cluster capacity. For example, if
  /// you set your service to have desired number of four tasks and a minimum
  /// healthy percent of 50%, the scheduler might stop two existing tasks to
  /// free up cluster capacity before starting two new tasks. If they're in the
  /// <code>RUNNING</code> state, tasks for services that don't use a load
  /// balancer are considered healthy . If they're in the <code>RUNNING</code>
  /// state and reported as healthy by the load balancer, tasks for services
  /// that <i>do</i> use a load balancer are considered healthy . The default
  /// value for minimum healthy percent is 100%.
  ///
  /// If a service uses the <code>ECS</code> deployment controller, the
  /// <b>maximum percent</b> parameter represents an upper limit on the number
  /// of tasks in a service that are allowed in the <code>RUNNING</code> or
  /// <code>PENDING</code> state during a deployment. Specifically, it
  /// represents it as a percentage of the desired number of tasks (rounded down
  /// to the nearest integer). This happens when any of your container instances
  /// are in the <code>DRAINING</code> state if the service contains tasks using
  /// the EC2 launch type. Using this parameter, you can define the deployment
  /// batch size. For example, if your service has a desired number of four
  /// tasks and a maximum percent value of 200%, the scheduler may start four
  /// new tasks before stopping the four older tasks (provided that the cluster
  /// resources required to do this are available). The default value for
  /// maximum percent is 200%.
  ///
  /// If a service uses either the <code>CODE_DEPLOY</code> or
  /// <code>EXTERNAL</code> deployment controller types and tasks that use the
  /// EC2 launch type, the <b>minimum healthy percent</b> and <b>maximum
  /// percent</b> values are used only to define the lower and upper limit on
  /// the number of the tasks in the service that remain in the
  /// <code>RUNNING</code> state. This is while the container instances are in
  /// the <code>DRAINING</code> state. If the tasks in the service use the
  /// Fargate launch type, the minimum healthy percent and maximum percent
  /// values aren't used. This is the case even if they're currently visible
  /// when describing your service.
  ///
  /// When creating a service that uses the <code>EXTERNAL</code> deployment
  /// controller, you can specify only parameters that aren't controlled at the
  /// task set level. The only required parameter is the service name. You
  /// control your services using the <a>CreateTaskSet</a> operation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS deployment types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement. For information about task placement and task placement
  /// strategies, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement.html">Amazon
  /// ECS task placement</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>
  ///
  /// Starting April 15, 2023, Amazon Web Services will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  /// May throw [PlatformUnknownException].
  /// May throw [PlatformTaskDefinitionIncompatibilityException].
  /// May throw [AccessDeniedException].
  /// May throw [NamespaceNotFoundException].
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
  /// A capacity provider strategy may contain a maximum of 6 capacity
  /// providers.
  ///
  /// Parameter [clientToken] :
  /// An identifier that you provide to ensure the idempotency of the request.
  /// It must be unique and is case sensitive. Up to 36 ASCII characters in the
  /// range of 33-126 (inclusive) are allowed.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that you
  /// run your service on. If you do not specify a cluster, the default cluster
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
  /// keep running in your service.
  ///
  /// This is required if <code>schedulingStrategy</code> is
  /// <code>REPLICA</code> or isn't specified. If
  /// <code>schedulingStrategy</code> is <code>DAEMON</code> then this isn't
  /// required.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to turn on Amazon ECS managed tags for the tasks within
  /// the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// your Amazon ECS resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// When you use Amazon ECS managed tags, you need to set the
  /// <code>propagateTags</code> request parameter.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Determines whether the execute command functionality is turned on for the
  /// service. If <code>true</code>, this enables execute command functionality
  /// on all containers in the service tasks.
  ///
  /// Parameter [healthCheckGracePeriodSeconds] :
  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// ignores unhealthy Elastic Load Balancing target health checks after a task
  /// has first started. This is only used when your service is configured to
  /// use a load balancer. If your service has a load balancer defined and you
  /// don't specify a health check grace period value, the default value of
  /// <code>0</code> is used.
  ///
  /// If you do not use an Elastic Load Balancing, we recommend that you use the
  /// <code>startPeriod</code> in the task definition health check parameters.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html">Health
  /// check</a>.
  ///
  /// If your service's tasks take a while to start and respond to Elastic Load
  /// Balancing health checks, you can specify a health check grace period of up
  /// to 2,147,483,647 seconds (about 69 years). During that time, the Amazon
  /// ECS service scheduler ignores health check status. This grace period can
  /// prevent the service scheduler from marking tasks as unhealthy and stopping
  /// them before they have time to come up.
  ///
  /// Parameter [launchType] :
  /// The infrastructure that you run your service on. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The <code>FARGATE</code> launch type runs your tasks on Fargate On-Demand
  /// infrastructure.
  /// <note>
  /// Fargate Spot infrastructure is available for use but a capacity provider
  /// strategy must be used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-capacity-providers.html">Fargate
  /// capacity providers</a> in the <i>Amazon ECS Developer Guide</i>.
  /// </note>
  /// The <code>EC2</code> launch type runs your tasks on Amazon EC2 instances
  /// registered to your cluster.
  ///
  /// The <code>EXTERNAL</code> launch type runs your tasks on your on-premises
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
  /// load balancing</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// If the service uses the rolling update (<code>ECS</code>) deployment
  /// controller and using either an Application Load Balancer or Network Load
  /// Balancer, you must specify one or more target group ARNs to attach to the
  /// service. The service-linked role is required for services that use
  /// multiple target groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
  /// service-linked roles for Amazon ECS</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  ///
  /// If the service uses the <code>CODE_DEPLOY</code> deployment controller,
  /// the service is required to use either an Application Load Balancer or
  /// Network Load Balancer. When creating an CodeDeploy deployment group, you
  /// specify two target groups (referred to as a <code>targetGroupPair</code>).
  /// During a deployment, CodeDeploy determines which task set in your service
  /// has the status <code>PRIMARY</code>, and it associates one target group
  /// with it. Then, it also associates the other target group with the
  /// replacement task set. The load balancer can also have up to two listeners:
  /// a required listener for production traffic and an optional listener that
  /// you can use to perform validation tests with Lambda functions before
  /// routing production traffic to it.
  ///
  /// If you use the <code>CODE_DEPLOY</code> deployment controller, these
  /// values can be changed when updating the service.
  ///
  /// For Application Load Balancers and Network Load Balancers, this object
  /// must contain the load balancer target group ARN, the container name, and
  /// the container port to access from the load balancer. The container name
  /// must be as it appears in a container definition. The load balancer name
  /// parameter must be omitted. When a task from this service is placed on a
  /// container instance, the container instance and port combination is
  /// registered as a target in the target group that's specified here.
  ///
  /// For Classic Load Balancers, this object must contain the load balancer
  /// name, the container name , and the container port to access from the load
  /// balancer. The container name must be as it appears in a container
  /// definition. The target group ARN parameter must be omitted. When a task
  /// from this service is placed on a container instance, the container
  /// instance is registered with the load balancer that's specified here.
  ///
  /// Services with tasks that use the <code>awsvpc</code> network mode (for
  /// example, those with the Fargate launch type) only support Application Load
  /// Balancers and Network Load Balancers. Classic Load Balancers aren't
  /// supported. Also, when you create any target groups for these services, you
  /// must choose <code>ip</code> as the target type, not <code>instance</code>.
  /// This is because tasks that use the <code>awsvpc</code> network mode are
  /// associated with an elastic network interface, not an Amazon EC2 instance.
  ///
  /// Parameter [networkConfiguration] :
  /// The network configuration for the service. This parameter is required for
  /// task definitions that use the <code>awsvpc</code> network mode to receive
  /// their own elastic network interface, and it isn't supported for other
  /// network modes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for tasks in your service.
  /// You can specify a maximum of 10 constraints for each task. This limit
  /// includes constraints in the task definition and those specified at
  /// runtime.
  ///
  /// Parameter [placementStrategy] :
  /// The placement strategy objects to use for tasks in your service. You can
  /// specify a maximum of 5 strategy rules for each service.
  ///
  /// Parameter [platformVersion] :
  /// The platform version that your tasks in the service are running on. A
  /// platform version is specified only for tasks using the Fargate launch
  /// type. If one isn't specified, the <code>LATEST</code> platform version is
  /// used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// platform versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags aren't propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task
  /// after task creation, use the <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TagResource.html">TagResource</a>
  /// API action.
  ///
  /// You must set this to a value other than <code>NONE</code> when you use
  /// Cost Explorer. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/usage-reports.html">Amazon
  /// ECS usage reports</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The default is <code>NONE</code>.
  ///
  /// Parameter [role] :
  /// The name or full Amazon Resource Name (ARN) of the IAM role that allows
  /// Amazon ECS to make calls to your load balancer on your behalf. This
  /// parameter is only permitted if you are using a load balancer with your
  /// service and your task definition doesn't use the <code>awsvpc</code>
  /// network mode. If you specify the <code>role</code> parameter, you must
  /// also specify a load balancer object with the <code>loadBalancers</code>
  /// parameter.
  /// <important>
  /// If your account has already created the Amazon ECS service-linked role,
  /// that role is used for your service unless you specify a role here. The
  /// service-linked role is required if your task definition uses the
  /// <code>awsvpc</code> network mode or if the service is configured to use
  /// service discovery, an external deployment controller, multiple target
  /// groups, or Elastic Inference accelerators in which case you don't specify
  /// a role here. For more information, see <a
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
  /// decisions. This scheduler strategy is required if the service uses the
  /// <code>CODE_DEPLOY</code> or <code>EXTERNAL</code> deployment controller
  /// types.
  /// </li>
  /// <li>
  /// <code>DAEMON</code>-The daemon scheduling strategy deploys exactly one
  /// task on each active container instance that meets all of the task
  /// placement constraints that you specify in your cluster. The service
  /// scheduler also evaluates the task placement constraints for running tasks
  /// and will stop tasks that don't meet the placement constraints. When you're
  /// using this strategy, you don't need to specify a desired number of tasks,
  /// a task placement strategy, or use Service Auto Scaling policies.
  /// <note>
  /// Tasks using the Fargate launch type or the <code>CODE_DEPLOY</code> or
  /// <code>EXTERNAL</code> deployment controller types don't support the
  /// <code>DAEMON</code> scheduling strategy.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [serviceConnectConfiguration] :
  /// The configuration for this service to discover and connect to services,
  /// and be discovered by, and connected from, other services within a
  /// namespace.
  ///
  /// Tasks that run in a namespace can use short names to connect to services
  /// in the namespace. Tasks can connect to services across all of the clusters
  /// in the namespace. Tasks connect through a managed proxy container that
  /// collects logs and metrics for increased visibility. Only the tasks that
  /// Amazon ECS services create are supported with Service Connect. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [serviceRegistries] :
  /// The details of the service discovery registry to associate with this
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// discovery</a>.
  /// <note>
  /// Each service may be associated with one service registry. Multiple service
  /// registries for each service isn't supported.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run
  /// in your service. If a <code>revision</code> isn't specified, the latest
  /// <code>ACTIVE</code> revision is used.
  ///
  /// A task definition must be specified if the service uses either the
  /// <code>ECS</code> or <code>CODE_DEPLOY</code> deployment controllers.
  ///
  /// For more information about deployment types, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS deployment types</a>.
  ///
  /// Parameter [volumeConfigurations] :
  /// The configuration for a volume specified in the task definition as a
  /// volume that is configured at launch time. Currently, the only supported
  /// volume type is an Amazon EBS volume.
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
    ServiceConnectConfiguration? serviceConnectConfiguration,
    List<ServiceRegistry>? serviceRegistries,
    List<Tag>? tags,
    String? taskDefinition,
    List<ServiceVolumeConfiguration>? volumeConfigurations,
  }) async {
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
        if (serviceConnectConfiguration != null)
          'serviceConnectConfiguration': serviceConnectConfiguration,
        if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
        if (tags != null) 'tags': tags,
        if (taskDefinition != null) 'taskDefinition': taskDefinition,
        if (volumeConfigurations != null)
          'volumeConfigurations': volumeConfigurations,
      },
    );

    return CreateServiceResponse.fromJson(jsonResponse.body);
  }

  /// Create a task set in the specified cluster and service. This is used when
  /// a service uses the <code>EXTERNAL</code> deployment controller type. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS deployment types</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// <note>
  /// On March 21, 2024, a change was made to resolve the task definition
  /// revision before authorization. When a task definition revision is not
  /// specified, authorization will occur using the latest revision of a task
  /// definition.
  /// </note>
  /// For information about the maximum number of task sets and otther quotas,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-quotas.html">Amazon
  /// ECS service quotas</a> in the <i>Amazon Elastic Container Service
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
  /// May throw [NamespaceNotFoundException].
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
  /// The task definition for the tasks in the task set to use. If a revision
  /// isn't specified, the latest <code>ACTIVE</code> revision is used.
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
  /// To use a Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// Fargate capacity providers are available to all accounts and only need to
  /// be associated with a cluster to be used.
  ///
  /// The <a>PutClusterCapacityProviders</a> API operation is used to update the
  /// list of available capacity providers for a cluster after the cluster is
  /// created.
  ///
  /// Parameter [clientToken] :
  /// An identifier that you provide to ensure the idempotency of the request.
  /// It must be unique and is case sensitive. Up to 36 ASCII characters in the
  /// range of 33-126 (inclusive) are allowed.
  ///
  /// Parameter [externalId] :
  /// An optional non-unique tag that identifies this task set in external
  /// systems. If the task set is associated with a service discovery registry,
  /// the tasks in this task set will have the
  /// <code>ECS_TASK_SET_EXTERNAL_ID</code> Cloud Map attribute set to the
  /// provided value.
  ///
  /// Parameter [launchType] :
  /// The launch type that new tasks in the task set uses. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
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
  /// The platform version that the tasks in the task set uses. A platform
  /// version is specified only for tasks using the Fargate launch type. If one
  /// isn't specified, the <code>LATEST</code> platform version is used.
  ///
  /// Parameter [scale] :
  /// A floating-point percentage of the desired number of tasks to place and
  /// keep running in the task set.
  ///
  /// Parameter [serviceRegistries] :
  /// The details of the service discovery registries to assign to this task
  /// set. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// discovery</a>.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task set to help you categorize and
  /// organize them. Each tag consists of a key and an optional value. You
  /// define both. When a service is deleted, the tags are deleted.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
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

  /// Disables an account setting for a specified user, role, or the root user
  /// for an account.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The resource name to disable the account setting for. If
  /// <code>serviceLongArnFormat</code> is specified, the ARN for your Amazon
  /// ECS services is affected. If <code>taskLongArnFormat</code> is specified,
  /// the ARN and resource ID for your Amazon ECS tasks is affected. If
  /// <code>containerInstanceLongArnFormat</code> is specified, the ARN and
  /// resource ID for your Amazon ECS container instances is affected. If
  /// <code>awsvpcTrunking</code> is specified, the ENI limit for your Amazon
  /// ECS container instances is affected.
  ///
  /// Parameter [principalArn] :
  /// The Amazon Resource Name (ARN) of the principal. It can be an user, role,
  /// or the root user. If you specify the root user, it disables the account
  /// setting for all users, roles, and the root user of the account unless a
  /// user or role explicitly overrides these settings. If this field is
  /// omitted, the setting is changed only for the authenticated user.
  Future<DeleteAccountSettingResponse> deleteAccountSetting({
    required SettingName name,
    String? principalArn,
  }) async {
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
  /// attributes for each request. For custom attributes, specify the attribute
  /// name and target ID, but don't specify the value. If you specify the target
  /// ID using the short form, you must also specify the target type.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// contains the resource to delete attributes. If you do not specify a
  /// cluster, the default cluster is assumed.
  Future<DeleteAttributesResponse> deleteAttributes({
    required List<Attribute> attributes,
    String? cluster,
  }) async {
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
  /// are reserved and can't be deleted. You can disassociate them from a
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
  /// providers. Only capacity providers that aren't associated with a cluster
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

  /// Deletes the specified cluster. The cluster transitions to the
  /// <code>INACTIVE</code> state. Clusters with an <code>INACTIVE</code> status
  /// might remain discoverable in your account for a period of time. However,
  /// this behavior is subject to change in the future. We don't recommend that
  /// you rely on <code>INACTIVE</code> clusters persisting.
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
  /// service is actively maintaining tasks, you can't delete it, and you must
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
  /// If <code>true</code>, allows you to delete a service even if it wasn't
  /// scaled down to zero tasks. It's only necessary to use this if the service
  /// uses the <code>REPLICA</code> scheduling strategy.
  Future<DeleteServiceResponse> deleteService({
    required String service,
    String? cluster,
    bool? force,
  }) async {
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

  /// Deletes one or more task definitions.
  ///
  /// You must deregister a task definition revision before you delete it. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeregisterTaskDefinition.html">DeregisterTaskDefinition</a>.
  ///
  /// When you delete a task definition revision, it is immediately transitions
  /// from the <code>INACTIVE</code> to <code>DELETE_IN_PROGRESS</code>.
  /// Existing tasks and services that reference a
  /// <code>DELETE_IN_PROGRESS</code> task definition revision continue to run
  /// without disruption. Existing services that reference a
  /// <code>DELETE_IN_PROGRESS</code> task definition revision can still scale
  /// up or down by modifying the service's desired count.
  ///
  /// You can't use a <code>DELETE_IN_PROGRESS</code> task definition revision
  /// to run new tasks or create new services. You also can't update an existing
  /// service to reference a <code>DELETE_IN_PROGRESS</code> task definition
  /// revision.
  ///
  /// A task definition revision will stay in <code>DELETE_IN_PROGRESS</code>
  /// status until all the associated tasks and services have been terminated.
  ///
  /// When you delete all <code>INACTIVE</code> task definition revisions, the
  /// task definition name is not displayed in the console and not returned in
  /// the API. If a task definition revisions are in the
  /// <code>DELETE_IN_PROGRESS</code> state, the task definition name is
  /// displayed in the console and returned in the API. The task definition name
  /// is retained by Amazon ECS and the revision is incremented the next time
  /// you create a task definition with that name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  ///
  /// Parameter [taskDefinitions] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full Amazon Resource Name (ARN) of the
  /// task definition to delete. You must specify a <code>revision</code>.
  ///
  /// You can specify up to 10 task definitions as a comma separated list.
  Future<DeleteTaskDefinitionsResponse> deleteTaskDefinitions({
    required List<String> taskDefinitions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.DeleteTaskDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskDefinitions': taskDefinitions,
      },
    );

    return DeleteTaskDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified task set within a service. This is used when a service
  /// uses the <code>EXTERNAL</code> deployment controller type. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">Amazon
  /// ECS deployment types</a> in the <i>Amazon Elastic Container Service
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
  /// hosts the service that the task set found in to delete.
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
  /// If <code>true</code>, you can delete a task set even if it hasn't been
  /// scaled down to zero.
  Future<DeleteTaskSetResponse> deleteTaskSet({
    required String cluster,
    required String service,
    required String taskSet,
    bool? force,
  }) async {
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
  /// deregistration, we recommend that you stop all of the tasks running on the
  /// container instance before deregistration. That prevents any orphaned tasks
  /// from consuming resources.
  ///
  /// Deregistering a container instance removes the instance from a cluster,
  /// but it doesn't terminate the EC2 instance. If you are finished using the
  /// instance, be sure to terminate it in the Amazon EC2 console to stop
  /// billing.
  /// <note>
  /// If you terminate a running container instance, Amazon ECS automatically
  /// deregisters the instance from your cluster (stopped container instances or
  /// instances with disconnected agents aren't automatically deregistered when
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
  /// deregister. For more information about the ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids">Amazon
  /// Resource Name (ARN)</a> in the <i>Amazon ECS Developer Guide</i>.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the container instance to deregister. If you do not specify a
  /// cluster, the default cluster is assumed.
  ///
  /// Parameter [force] :
  /// Forces the container instance to be deregistered. If you have tasks
  /// running on the container instance when you deregister it with the
  /// <code>force</code> option, these tasks remain running until you terminate
  /// the instance or the tasks stop through some other means, but they're
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
  /// down by modifying the service's desired count. If you want to delete a
  /// task definition revision, you must first deregister the task definition
  /// revision.
  ///
  /// You can't use an <code>INACTIVE</code> task definition to run new tasks or
  /// create new services, and you can't update an existing service to reference
  /// an <code>INACTIVE</code> task definition. However, there may be up to a
  /// 10-minute window following deregistration where these restrictions have
  /// not yet taken effect.
  /// <note>
  /// At this time, <code>INACTIVE</code> task definitions remain discoverable
  /// in your account indefinitely. However, this behavior is subject to change
  /// in the future. We don't recommend that you rely on <code>INACTIVE</code>
  /// task definitions persisting beyond the lifecycle of any associated tasks
  /// and services.
  /// </note>
  /// You must deregister a task definition revision before you delete it. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteTaskDefinitions.html">DeleteTaskDefinitions</a>.
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
  /// included in the response. If this field is omitted, tags aren't included
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
  /// Determines whether to include additional information about the clusters in
  /// the response. If this field is omitted, this information isn't included.
  ///
  /// If <code>ATTACHMENTS</code> is specified, the attachments for the
  /// container instances or tasks within the cluster are included, for example
  /// the capacity providers.
  ///
  /// If <code>SETTINGS</code> is specified, the settings for the cluster are
  /// included.
  ///
  /// If <code>CONFIGURATIONS</code> is specified, the configuration for the
  /// cluster is included.
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
  /// response. If <code>CONTAINER_INSTANCE_HEALTH</code> is specified, the
  /// container instance health is included in the response. If this field is
  /// omitted, tags and container instance health status aren't included in the
  /// response.
  Future<DescribeContainerInstancesResponse> describeContainerInstances({
    required List<String> containerInstances,
    String? cluster,
    List<ContainerInstanceField>? include,
  }) async {
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
  /// Determines whether you want to see the resource tags for the service. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags aren't included in the response.
  Future<DescribeServicesResponse> describeServices({
    required List<String> services,
    String? cluster,
    List<ServiceField>? include,
  }) async {
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
  /// Determines whether to see the resource tags for the task definition. If
  /// <code>TAGS</code> is specified, the tags are included in the response. If
  /// this field is omitted, tags aren't included in the response.
  Future<DescribeTaskDefinitionResponse> describeTaskDefinition({
    required String taskDefinition,
    List<TaskDefinitionField>? include,
  }) async {
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
  /// this field is omitted, tags aren't included in the response.
  ///
  /// Parameter [taskSets] :
  /// The ID or full Amazon Resource Name (ARN) of task sets to describe.
  Future<DescribeTaskSetsResponse> describeTaskSets({
    required String cluster,
    required String service,
    List<TaskSetField>? include,
    List<String>? taskSets,
  }) async {
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
  /// Currently, stopped tasks appear in the returned results for at least one
  /// hour.
  ///
  /// If you have tasks with tags, and then delete the cluster, the tagged tasks
  /// are returned in the response. If you create a new cluster with the same
  /// name as the deleted cluster, the tagged tasks are not included in the
  /// response.
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
  /// this field is omitted, tags aren't included in the response.
  Future<DescribeTasksResponse> describeTasks({
    required List<String> tasks,
    String? cluster,
    List<TaskField>? include,
  }) async {
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
  /// The short name or full Amazon Resource Name (ARN) of the cluster that the
  /// container instance belongs to.
  ///
  /// Parameter [containerInstance] :
  /// The container instance ID or full ARN of the container instance. For more
  /// information about the ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids">Amazon
  /// Resource Name (ARN)</a> in the <i>Amazon ECS Developer Guide</i>.
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
  /// If you use a condition key in your IAM policy to refine the conditions for
  /// the policy statement, for example limit the actions to a specific cluster,
  /// you receive an <code>AccessDeniedException</code> when there is a mismatch
  /// between the condition key value and the corresponding parameter value.
  ///
  /// For information about required permissions and considerations, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html">Using
  /// Amazon ECS Exec for debugging</a> in the <i>Amazon ECS Developer
  /// Guide</i>.
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

  /// Retrieves the protection status of tasks in an Amazon ECS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnsupportedFeatureException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task sets exist in.
  ///
  /// Parameter [tasks] :
  /// A list of up to 100 task IDs or full ARN entries.
  Future<GetTaskProtectionResponse> getTaskProtection({
    required String cluster,
    List<String>? tasks,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.GetTaskProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        if (tasks != null) 'tasks': tasks,
      },
    );

    return GetTaskProtectionResponse.fromJson(jsonResponse.body);
  }

  /// Lists the account settings for a specified principal.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [effectiveSettings] :
  /// Determines whether to return the effective settings. If <code>true</code>,
  /// the account settings for the root user or the default setting for the
  /// <code>principalArn</code> are returned. If <code>false</code>, the account
  /// settings for the <code>principalArn</code> are returned if they're set.
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
  /// parameter isn't used, then <code>ListAccountSettings</code> returns up to
  /// 10 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [name] :
  /// The name of the account setting you want to list the settings for.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListAccountSettings</code> request indicating that more results are
  /// available to fulfill the request and further calls will be needed. If
  /// <code>maxResults</code> was provided, it's possible the number of results
  /// to be fewer than <code>maxResults</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [principalArn] :
  /// The ARN of the principal, which can be a user, role, or the root user. If
  /// this field is omitted, the account settings are listed only for the
  /// authenticated user.
  /// <note>
  /// Federated users assume the account setting of the root user and can't have
  /// explicit account settings set for them.
  /// </note>
  ///
  /// Parameter [value] :
  /// The value of the account settings to filter results with. You must also
  /// specify an account setting name to use this parameter.
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
  /// also filter the results by attribute name and value. You can do this, for
  /// example, to see which container instances in a cluster are running a Linux
  /// AMI (<code>ecs.os-type=linux</code>).
  ///
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [targetType] :
  /// The type of the target to list attributes with.
  ///
  /// Parameter [attributeName] :
  /// The name of the attribute to filter the results with.
  ///
  /// Parameter [attributeValue] :
  /// The value of the attribute to filter results with. You must also specify
  /// an attribute name to use this parameter.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to list
  /// attributes. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results that <code>ListAttributes</code>
  /// returned in paginated output. When this parameter is used,
  /// <code>ListAttributes</code> only returns <code>maxResults</code> results
  /// in a single page along with a <code>nextToken</code> response element. The
  /// remaining results of the initial request can be seen by sending another
  /// <code>ListAttributes</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>ListAttributes</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListAttributes</code> request indicating that more results are
  /// available to fulfill the request and further calls are needed. If
  /// <code>maxResults</code> was provided, it's possible the number of results
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
  /// The maximum number of cluster results that <code>ListClusters</code>
  /// returned in paginated output. When this parameter is used,
  /// <code>ListClusters</code> only returns <code>maxResults</code> results in
  /// a single page along with a <code>nextToken</code> response element. The
  /// remaining results of the initial request can be seen by sending another
  /// <code>ListClusters</code> request with the returned <code>nextToken</code>
  /// value. This value can be between 1 and 100. If this parameter isn't used,
  /// then <code>ListClusters</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a <code>ListClusters</code>
  /// request indicating that more results are available to fulfill the request
  /// and further calls are needed. If <code>maxResults</code> was provided,
  /// it's possible the number of results to be fewer than
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
  /// The maximum number of container instance results that
  /// <code>ListContainerInstances</code> returned in paginated output. When
  /// this parameter is used, <code>ListContainerInstances</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListContainerInstances</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>ListContainerInstances</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a
  /// <code>ListContainerInstances</code> request indicating that more results
  /// are available to fulfill the request and further calls are needed. If
  /// <code>maxResults</code> was provided, it's possible the number of results
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
  /// <a>UpdateContainerInstancesState</a>. If you don't specify this parameter,
  /// the default is to include container instances set to all states other than
  /// <code>INACTIVE</code>.
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
  /// The maximum number of service results that <code>ListServices</code>
  /// returned in paginated output. When this parameter is used,
  /// <code>ListServices</code> only returns <code>maxResults</code> results in
  /// a single page along with a <code>nextToken</code> response element. The
  /// remaining results of the initial request can be seen by sending another
  /// <code>ListServices</code> request with the returned <code>nextToken</code>
  /// value. This value can be between 1 and 100. If this parameter isn't used,
  /// then <code>ListServices</code> returns up to 10 results and a
  /// <code>nextToken</code> value if applicable.
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

  /// This operation lists all of the services that are associated with a Cloud
  /// Map namespace. This list might include services in different clusters. In
  /// contrast, <code>ListServices</code> can only list services in one cluster
  /// at a time. If you need to filter the list of services in a single cluster
  /// by various parameters, use <code>ListServices</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [NamespaceNotFoundException].
  ///
  /// Parameter [namespace] :
  /// The namespace name or full Amazon Resource Name (ARN) of the Cloud Map
  /// namespace to list the services in.
  ///
  /// Tasks that run in a namespace can use short names to connect to services
  /// in the namespace. Tasks can connect to services across all of the clusters
  /// in the namespace. Tasks connect through a managed proxy container that
  /// collects logs and metrics for increased visibility. Only the tasks that
  /// Amazon ECS services create are supported with Service Connect. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service results that
  /// <code>ListServicesByNamespace</code> returns in paginated output. When
  /// this parameter is used, <code>ListServicesByNamespace</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListServicesByNamespace</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>ListServicesByNamespace</code> returns up
  /// to 10 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a
  /// <code>ListServicesByNamespace</code> request. It indicates that more
  /// results are available to fulfill the request and further calls are needed.
  /// If <code>maxResults</code> is returned, it is possible the number of
  /// results is less than <code>maxResults</code>.
  Future<ListServicesByNamespaceResponse> listServicesByNamespace({
    required String namespace,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerServiceV20141113.ListServicesByNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespace': namespace,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListServicesByNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// List the tags for an Amazon ECS resource.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for. Currently, the supported resources are Amazon ECS tasks,
  /// services, task definitions, clusters, and container instances.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
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
  /// account. This list includes task definition families that no longer have
  /// any <code>ACTIVE</code> task definition revisions.
  ///
  /// You can filter out task definition families that don't contain any
  /// <code>ACTIVE</code> task definition revisions by setting the
  /// <code>status</code> parameter to <code>ACTIVE</code>. You can also filter
  /// the results with the <code>familyPrefix</code> parameter.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [familyPrefix] :
  /// The <code>familyPrefix</code> is a string that's used to filter the
  /// results of <code>ListTaskDefinitionFamilies</code>. If you specify a
  /// <code>familyPrefix</code>, only task definition family names that begin
  /// with the <code>familyPrefix</code> string are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task definition family results that
  /// <code>ListTaskDefinitionFamilies</code> returned in paginated output. When
  /// this parameter is used, <code>ListTaskDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListTaskDefinitionFamilies</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>ListTaskDefinitionFamilies</code> returns
  /// up to 100 results and a <code>nextToken</code> value if applicable.
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
  /// The task definition family status to filter the
  /// <code>ListTaskDefinitionFamilies</code> results with. By default, both
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
  /// The full family name to filter the <code>ListTaskDefinitions</code>
  /// results with. Specifying a <code>familyPrefix</code> limits the listed
  /// task definitions to task definition revisions that belong to that family.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of task definition results that
  /// <code>ListTaskDefinitions</code> returned in paginated output. When this
  /// parameter is used, <code>ListTaskDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListTaskDefinitions</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>ListTaskDefinitions</code> returns up to
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
  /// The order to sort the results in. Valid values are <code>ASC</code> and
  /// <code>DESC</code>. By default, (<code>ASC</code>) task definitions are
  /// listed lexicographically by family name and in ascending numerical order
  /// by revision so that the newest task definitions in a family are listed
  /// last. Setting this parameter to <code>DESC</code> reverses the sort order
  /// on family name and revision. This is so that the newest task definitions
  /// in a family are listed first.
  ///
  /// Parameter [status] :
  /// The task definition status to filter the <code>ListTaskDefinitions</code>
  /// results with. By default, only <code>ACTIVE</code> task definitions are
  /// listed. By setting this parameter to <code>INACTIVE</code>, you can view
  /// task definitions that are <code>INACTIVE</code> as long as an active task
  /// or service still references them. If you paginate the resulting output, be
  /// sure to keep the <code>status</code> value constant in each subsequent
  /// request.
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
  /// Recently stopped tasks might appear in the returned results.
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
  /// <code>STOPPED</code>. This can be useful for debugging tasks that aren't
  /// starting properly or have died or finished. The default status filter is
  /// <code>RUNNING</code>, which shows tasks that Amazon ECS has set the
  /// desired status to <code>RUNNING</code>.
  /// <note>
  /// Although you can filter results based on a desired status of
  /// <code>PENDING</code>, this doesn't return any results. Amazon ECS never
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
  /// The maximum number of task results that <code>ListTasks</code> returned in
  /// paginated output. When this parameter is used, <code>ListTasks</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListTasks</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If this parameter isn't used, then
  /// <code>ListTasks</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a <code>ListTasks</code>
  /// request indicating that more results are available to fulfill the request
  /// and further calls will be needed. If <code>maxResults</code> was provided,
  /// it's possible the number of results to be fewer than
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
  /// The <code>startedBy</code> value to filter the task results with.
  /// Specifying a <code>startedBy</code> value limits the results to tasks that
  /// were started with that value.
  ///
  /// When you specify <code>startedBy</code> as the filter, it must be the only
  /// filter that you use.
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
  /// If you change the root user account setting, the default settings are
  /// reset for users and roles that do not have specified individual account
  /// settings. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html">Account
  /// Settings</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The Amazon ECS account setting name to modify.
  ///
  /// The following are the valid values for the account setting name.
  ///
  /// <ul>
  /// <li>
  /// <code>serviceLongArnFormat</code> - When modified, the Amazon Resource
  /// Name (ARN) and resource ID format of the resource type for a specified
  /// user, role, or the root user for an account is affected. The opt-in and
  /// opt-out account setting must be set for each Amazon ECS resource
  /// separately. The ARN and resource ID format of a resource is defined by the
  /// opt-in status of the user or role that created the resource. You must turn
  /// on this setting to use Amazon ECS features such as resource tagging.
  /// </li>
  /// <li>
  /// <code>taskLongArnFormat</code> - When modified, the Amazon Resource Name
  /// (ARN) and resource ID format of the resource type for a specified user,
  /// role, or the root user for an account is affected. The opt-in and opt-out
  /// account setting must be set for each Amazon ECS resource separately. The
  /// ARN and resource ID format of a resource is defined by the opt-in status
  /// of the user or role that created the resource. You must turn on this
  /// setting to use Amazon ECS features such as resource tagging.
  /// </li>
  /// <li>
  /// <code>containerInstanceLongArnFormat</code> - When modified, the Amazon
  /// Resource Name (ARN) and resource ID format of the resource type for a
  /// specified user, role, or the root user for an account is affected. The
  /// opt-in and opt-out account setting must be set for each Amazon ECS
  /// resource separately. The ARN and resource ID format of a resource is
  /// defined by the opt-in status of the user or role that created the
  /// resource. You must turn on this setting to use Amazon ECS features such as
  /// resource tagging.
  /// </li>
  /// <li>
  /// <code>awsvpcTrunking</code> - When modified, the elastic network interface
  /// (ENI) limit for any new container instances that support the feature is
  /// changed. If <code>awsvpcTrunking</code> is turned on, any new container
  /// instances that support the feature are launched have the increased ENI
  /// limits available to them. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html">Elastic
  /// Network Interface Trunking</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>containerInsights</code> - When modified, the default setting
  /// indicating whether Amazon Web Services CloudWatch Container Insights is
  /// turned on for your clusters is changed. If <code>containerInsights</code>
  /// is turned on, any new clusters that are created will have Container
  /// Insights turned on unless you disable it during cluster creation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html">CloudWatch
  /// Container Insights</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>dualStackIPv6</code> - When turned on, when using a VPC in dual
  /// stack mode, your tasks using the <code>awsvpc</code> network mode can have
  /// an IPv6 address assigned. For more information on using IPv6 with tasks
  /// launched on Amazon EC2 instances, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking-awsvpc.html#task-networking-vpc-dual-stack">Using
  /// a VPC in dual-stack mode</a>. For more information on using IPv6 with
  /// tasks launched on Fargate, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html#fargate-task-networking-vpc-dual-stack">Using
  /// a VPC in dual-stack mode</a>.
  /// </li>
  /// <li>
  /// <code>fargateFIPSMode</code> - If you specify
  /// <code>fargateFIPSMode</code>, Fargate FIPS 140 compliance is affected.
  /// </li>
  /// <li>
  /// <code>fargateTaskRetirementWaitPeriod</code> - When Amazon Web Services
  /// determines that a security or infrastructure update is needed for an
  /// Amazon ECS task hosted on Fargate, the tasks need to be stopped and new
  /// tasks launched to replace them. Use
  /// <code>fargateTaskRetirementWaitPeriod</code> to configure the wait time to
  /// retire a Fargate task. For information about the Fargate tasks
  /// maintenance, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-maintenance.html">Amazon
  /// Web Services Fargate task maintenance</a> in the <i>Amazon ECS Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>tagResourceAuthorization</code> - Amazon ECS is introducing tagging
  /// authorization for resource creation. Users must have permissions for
  /// actions that create the resource, such as <code>ecsCreateCluster</code>.
  /// If tags are specified when you create a resource, Amazon Web Services
  /// performs additional authorization to verify if users or roles have
  /// permissions to create tags. Therefore, you must grant explicit permissions
  /// to use the <code>ecs:TagResource</code> action. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/supported-iam-actions-tagging.html">Grant
  /// permission to tag resources on creation</a> in the <i>Amazon ECS Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>guardDutyActivate</code> - The <code>guardDutyActivate</code>
  /// parameter is read-only in Amazon ECS and indicates whether Amazon ECS
  /// Runtime Monitoring is enabled or disabled by your security administrator
  /// in your Amazon ECS account. Amazon GuardDuty controls this account setting
  /// on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-guard-duty-integration.html">Protecting
  /// Amazon ECS workloads with Amazon ECS Runtime Monitoring</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [value] :
  /// The account setting value for the specified principal ARN. Accepted values
  /// are <code>enabled</code>, <code>disabled</code>, <code>on</code>, and
  /// <code>off</code>.
  ///
  /// When you specify <code>fargateTaskRetirementWaitPeriod</code> for the
  /// <code>name</code>, the following are the valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>0</code> - Amazon Web Services sends the notification, and
  /// immediately retires the affected tasks.
  /// </li>
  /// <li>
  /// <code>7</code> - Amazon Web Services sends the notification, and waits 7
  /// calendar days to retire the tasks.
  /// </li>
  /// <li>
  /// <code>14</code> - Amazon Web Services sends the notification, and waits 14
  /// calendar days to retire the tasks.
  /// </li>
  /// </ul>
  ///
  /// Parameter [principalArn] :
  /// The ARN of the principal, which can be a user, role, or the root user. If
  /// you specify the root user, it modifies the account setting for all users,
  /// roles, and the root user of the account unless a user or role explicitly
  /// overrides these settings. If this field is omitted, the setting is changed
  /// only for the authenticated user.
  /// <note>
  /// You must use the root user when you set the Fargate wait time
  /// (<code>fargateTaskRetirementWaitPeriod</code>).
  ///
  /// Federated users assume the account setting of the root user and can't have
  /// explicit account settings set for them.
  /// </note>
  Future<PutAccountSettingResponse> putAccountSetting({
    required SettingName name,
    required String value,
    String? principalArn,
  }) async {
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

  /// Modifies an account setting for all users on an account for whom no
  /// individual account setting has been specified. Account settings are set on
  /// a per-Region basis.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// The resource name for which to modify the account setting.
  ///
  /// The following are the valid values for the account setting name.
  ///
  /// <ul>
  /// <li>
  /// <code>serviceLongArnFormat</code> - When modified, the Amazon Resource
  /// Name (ARN) and resource ID format of the resource type for a specified
  /// user, role, or the root user for an account is affected. The opt-in and
  /// opt-out account setting must be set for each Amazon ECS resource
  /// separately. The ARN and resource ID format of a resource is defined by the
  /// opt-in status of the user or role that created the resource. You must turn
  /// on this setting to use Amazon ECS features such as resource tagging.
  /// </li>
  /// <li>
  /// <code>taskLongArnFormat</code> - When modified, the Amazon Resource Name
  /// (ARN) and resource ID format of the resource type for a specified user,
  /// role, or the root user for an account is affected. The opt-in and opt-out
  /// account setting must be set for each Amazon ECS resource separately. The
  /// ARN and resource ID format of a resource is defined by the opt-in status
  /// of the user or role that created the resource. You must turn on this
  /// setting to use Amazon ECS features such as resource tagging.
  /// </li>
  /// <li>
  /// <code>containerInstanceLongArnFormat</code> - When modified, the Amazon
  /// Resource Name (ARN) and resource ID format of the resource type for a
  /// specified user, role, or the root user for an account is affected. The
  /// opt-in and opt-out account setting must be set for each Amazon ECS
  /// resource separately. The ARN and resource ID format of a resource is
  /// defined by the opt-in status of the user or role that created the
  /// resource. You must turn on this setting to use Amazon ECS features such as
  /// resource tagging.
  /// </li>
  /// <li>
  /// <code>awsvpcTrunking</code> - When modified, the elastic network interface
  /// (ENI) limit for any new container instances that support the feature is
  /// changed. If <code>awsvpcTrunking</code> is turned on, any new container
  /// instances that support the feature are launched have the increased ENI
  /// limits available to them. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html">Elastic
  /// Network Interface Trunking</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>containerInsights</code> - When modified, the default setting
  /// indicating whether Amazon Web Services CloudWatch Container Insights is
  /// turned on for your clusters is changed. If <code>containerInsights</code>
  /// is turned on, any new clusters that are created will have Container
  /// Insights turned on unless you disable it during cluster creation. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html">CloudWatch
  /// Container Insights</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>dualStackIPv6</code> - When turned on, when using a VPC in dual
  /// stack mode, your tasks using the <code>awsvpc</code> network mode can have
  /// an IPv6 address assigned. For more information on using IPv6 with tasks
  /// launched on Amazon EC2 instances, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking-awsvpc.html#task-networking-vpc-dual-stack">Using
  /// a VPC in dual-stack mode</a>. For more information on using IPv6 with
  /// tasks launched on Fargate, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html#fargate-task-networking-vpc-dual-stack">Using
  /// a VPC in dual-stack mode</a>.
  /// </li>
  /// <li>
  /// <code>fargateFIPSMode</code> - If you specify
  /// <code>fargateFIPSMode</code>, Fargate FIPS 140 compliance is affected.
  /// </li>
  /// <li>
  /// <code>fargateTaskRetirementWaitPeriod</code> - When Amazon Web Services
  /// determines that a security or infrastructure update is needed for an
  /// Amazon ECS task hosted on Fargate, the tasks need to be stopped and new
  /// tasks launched to replace them. Use
  /// <code>fargateTaskRetirementWaitPeriod</code> to configure the wait time to
  /// retire a Fargate task. For information about the Fargate tasks
  /// maintenance, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-maintenance.html">Amazon
  /// Web Services Fargate task maintenance</a> in the <i>Amazon ECS Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>tagResourceAuthorization</code> - Amazon ECS is introducing tagging
  /// authorization for resource creation. Users must have permissions for
  /// actions that create the resource, such as <code>ecsCreateCluster</code>.
  /// If tags are specified when you create a resource, Amazon Web Services
  /// performs additional authorization to verify if users or roles have
  /// permissions to create tags. Therefore, you must grant explicit permissions
  /// to use the <code>ecs:TagResource</code> action. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/supported-iam-actions-tagging.html">Grant
  /// permission to tag resources on creation</a> in the <i>Amazon ECS Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>guardDutyActivate</code> - The <code>guardDutyActivate</code>
  /// parameter is read-only in Amazon ECS and indicates whether Amazon ECS
  /// Runtime Monitoring is enabled or disabled by your security administrator
  /// in your Amazon ECS account. Amazon GuardDuty controls this account setting
  /// on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-guard-duty-integration.html">Protecting
  /// Amazon ECS workloads with Amazon ECS Runtime Monitoring</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [value] :
  /// The account setting value for the specified principal ARN. Accepted values
  /// are <code>enabled</code>, <code>disabled</code>, <code>on</code>, and
  /// <code>off</code>.
  ///
  /// When you specify <code>fargateTaskRetirementWaitPeriod</code> for the
  /// <code>name</code>, the following are the valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>0</code> - Amazon Web Services sends the notification, and
  /// immediately retires the affected tasks.
  /// </li>
  /// <li>
  /// <code>7</code> - Amazon Web Services sends the notification, and waits 7
  /// calendar days to retire the tasks.
  /// </li>
  /// <li>
  /// <code>14</code> - Amazon Web Services sends the notification, and waits 14
  /// calendar days to retire the tasks.
  /// </li>
  /// </ul>
  Future<PutAccountSettingDefaultResponse> putAccountSettingDefault({
    required SettingName name,
    required String value,
  }) async {
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
  /// doesn't exist, it's created. If the attribute exists, its value is
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
  /// attributes for each resource. You can specify up to 10 attributes in a
  /// single call.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// contains the resource to apply attributes. If you do not specify a
  /// cluster, the default cluster is assumed.
  Future<PutAttributesResponse> putAttributes({
    required List<Attribute> attributes,
    String? cluster,
  }) async {
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
  /// Any existing capacity providers that are associated with a cluster that
  /// are omitted from a <a>PutClusterCapacityProviders</a> API call will be
  /// disassociated with the cluster. You can only disassociate an existing
  /// capacity provider from a cluster if it's not being used by any existing
  /// tasks.
  ///
  /// When creating a service or running a task on a cluster, if no capacity
  /// provider or launch type is specified, then the cluster's default capacity
  /// provider strategy is used. We recommend that you define a default capacity
  /// provider strategy for your cluster. However, you must specify an empty
  /// array (<code>[]</code>) to bypass defining a default strategy.
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
  /// To use a Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// Fargate capacity providers are available to all accounts and only need to
  /// be associated with a cluster to be used.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to modify
  /// the capacity provider settings for. If you don't specify a cluster, the
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
  /// To use a Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// Fargate capacity providers are available to all accounts and only need to
  /// be associated with a cluster to be used.
  Future<PutClusterCapacityProvidersResponse> putClusterCapacityProviders({
    required List<String> capacityProviders,
    required String cluster,
    required List<CapacityProviderStrategyItem> defaultCapacityProviderStrategy,
  }) async {
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
  /// The short name or full Amazon Resource Name (ARN) of the cluster to
  /// register your container instance with. If you do not specify a cluster,
  /// the default cluster is assumed.
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
  /// value. You define both.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [totalResources] :
  /// The resources available on the instance.
  ///
  /// Parameter [versionInfo] :
  /// The version information for the Amazon ECS container agent and Docker
  /// daemon that runs on the container instance.
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
  /// You can specify a role for your task with the <code>taskRoleArn</code>
  /// parameter. When you specify a role for a task, its containers can then use
  /// the latest versions of the CLI or SDKs to make API requests to the Amazon
  /// Web Services services that are specified in the policy that's associated
  /// with the role. For more information, see <a
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
  /// You must specify a <code>family</code> for a task definition. You can use
  /// it track multiple versions of the same task definition. The
  /// <code>family</code> is used as a name for your task definition. Up to 255
  /// letters (uppercase and lowercase), numbers, underscores, and hyphens are
  /// allowed.
  ///
  /// Parameter [cpu] :
  /// The number of CPU units used by the task. It can be expressed as an
  /// integer using CPU units (for example, <code>1024</code>) or as a string
  /// using vCPUs (for example, <code>1 vCPU</code> or <code>1 vcpu</code>) in a
  /// task definition. String values are converted to an integer indicating the
  /// CPU units when the task definition is registered.
  /// <note>
  /// Task-level CPU and memory parameters are ignored for Windows containers.
  /// We recommend specifying container-level resources for Windows containers.
  /// </note>
  /// If you're using the EC2 launch type, this field is optional. Supported
  /// values are between <code>128</code> CPU units (<code>0.125</code> vCPUs)
  /// and <code>10240</code> CPU units (<code>10</code> vCPUs). If you do not
  /// specify a value, the parameter is ignored.
  ///
  /// If you're using the Fargate launch type, this field is required and you
  /// must use one of the following values, which determines your range of
  /// supported values for the <code>memory</code> parameter:
  ///
  /// The CPU units cannot be less than 1 vCPU when you use Windows containers
  /// on Fargate.
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
  /// 2048 (2 vCPU) - Available <code>memory</code> values: 4096 (4 GB) and
  /// 16384 (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: 8192 (8 GB) and
  /// 30720 (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 8192 (8 vCPU) - Available <code>memory</code> values: 16 GB and 60 GB in 4
  /// GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// 16384 (16vCPU) - Available <code>memory</code> values: 32GB and 120 GB in
  /// 8 GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// </ul>
  ///
  /// Parameter [ephemeralStorage] :
  /// The amount of ephemeral storage to allocate for the task. This parameter
  /// is used to expand the total amount of ephemeral storage available, beyond
  /// the default amount, for tasks hosted on Fargate. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html">Using
  /// data volumes in tasks</a> in the <i>Amazon ECS Developer Guide</i>.
  /// <note>
  /// For tasks using the Fargate launch type, the task requires the following
  /// platforms:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the task execution role that grants the
  /// Amazon ECS container agent permission to make Amazon Web Services API
  /// calls on your behalf. The task execution IAM role is required depending on
  /// the requirements of your task. For more information, see <a
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
  /// This parameter is not supported for Windows containers or tasks run on
  /// Fargate.
  /// </note>
  ///
  /// Parameter [memory] :
  /// The amount of memory (in MiB) used by the task. It can be expressed as an
  /// integer using MiB (for example ,<code>1024</code>) or as a string using GB
  /// (for example, <code>1GB</code> or <code>1 GB</code>) in a task definition.
  /// String values are converted to an integer indicating the MiB when the task
  /// definition is registered.
  /// <note>
  /// Task-level CPU and memory parameters are ignored for Windows containers.
  /// We recommend specifying container-level resources for Windows containers.
  /// </note>
  /// If using the EC2 launch type, this field is optional.
  ///
  /// If using the Fargate launch type, this field is required and you must use
  /// one of the following values. This determines your range of supported
  /// values for the <code>cpu</code> parameter.
  ///
  /// The CPU units cannot be less than 1 vCPU when you use Windows containers
  /// on Fargate.
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
  /// <li>
  /// Between 16 GB and 60 GB in 4 GB increments - Available <code>cpu</code>
  /// values: 8192 (8 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Between 32GB and 120 GB in 8 GB increments - Available <code>cpu</code>
  /// values: 16384 (16 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
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
  /// required. For Amazon ECS tasks on Amazon EC2 Linux instances, any network
  /// mode can be used. For Amazon ECS tasks on Amazon EC2 Windows instances,
  /// <code>&lt;default&gt;</code> or <code>awsvpc</code> can be used. If the
  /// network mode is set to <code>none</code>, you cannot specify port mappings
  /// in your container definitions, and the tasks containers do not have
  /// external connectivity. The <code>host</code> and <code>awsvpc</code>
  /// network modes offer the highest networking performance for containers
  /// because they use the EC2 network stack instead of the virtualized network
  /// stack provided by the <code>bridge</code> mode.
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
  ///
  /// If the network mode is <code>host</code>, you cannot run multiple
  /// instantiations of the same task on a single container instance when port
  /// mappings are used.
  ///
  /// For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#network-settings">Network
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// Parameter [pidMode] :
  /// The process namespace to use for the containers in the task. The valid
  /// values are <code>host</code> or <code>task</code>. On Fargate for Linux
  /// containers, the only valid value is <code>task</code>. For example,
  /// monitoring sidecars might need <code>pidMode</code> to access information
  /// about other containers running in the same task.
  ///
  /// If <code>host</code> is specified, all containers within the tasks that
  /// specified the <code>host</code> PID mode on the same container instance
  /// share the same process namespace with the host Amazon EC2 instance.
  ///
  /// If <code>task</code> is specified, all containers within the specified
  /// task share the same process namespace.
  ///
  /// If no value is specified, the default is a private namespace for each
  /// container. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#pid-settings---pid">PID
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> PID mode is used, there's a heightened risk of
  /// undesired process namespace exposure. For more information, see <a
  /// href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note> <note>
  /// This parameter is only supported for tasks that are hosted on Fargate if
  /// the tasks are using platform version <code>1.4.0</code> or later (Linux).
  /// This isn't supported for Windows containers on Fargate.
  /// </note>
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for the task. You can
  /// specify a maximum of 10 constraints for each task. This limit includes
  /// constraints in the task definition and those specified at runtime.
  ///
  /// Parameter [proxyConfiguration] :
  /// The configuration details for the App Mesh proxy.
  ///
  /// For tasks hosted on Amazon EC2 instances, the container instances require
  /// at least version <code>1.26.0</code> of the container agent and at least
  /// version <code>1.26.0-1</code> of the <code>ecs-init</code> package to use
  /// a proxy configuration. If your container instances are launched from the
  /// Amazon ECS-optimized AMI version <code>20190301</code> or later, then they
  /// contain the required versions of the container agent and
  /// <code>ecs-init</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-ami-versions.html">Amazon
  /// ECS-optimized AMI versions</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [requiresCompatibilities] :
  /// The task launch type that Amazon ECS validates the task definition
  /// against. A client exception is returned if the task definition doesn't
  /// validate against the compatibilities specified. If no value is specified,
  /// the parameter is omitted from the response.
  ///
  /// Parameter [runtimePlatform] :
  /// The operating system that your tasks definitions run on. A platform family
  /// is specified only for tasks using the Fargate launch type.
  ///
  /// When you specify a task definition in a service, this value must match the
  /// <code>runtimePlatform</code> value of the service.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the task definition to help you categorize
  /// and organize them. Each tag consists of a key and an optional value. You
  /// define both of them.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
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
  /// might use.
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
    RuntimePlatform? runtimePlatform,
    List<Tag>? tags,
    String? taskRoleArn,
    List<Volume>? volumes,
  }) async {
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
        if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
        if (tags != null) 'tags': tags,
        if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
        if (volumes != null) 'volumes': volumes,
      },
    );

    return RegisterTaskDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new task using the specified task definition.
  /// <note>
  /// On March 21, 2024, a change was made to resolve the task definition
  /// revision before authorization. When a task definition revision is not
  /// specified, authorization will occur using the latest revision of a task
  /// definition.
  /// </note>
  /// You can allow Amazon ECS to place tasks for you, or you can customize how
  /// Amazon ECS places tasks using placement constraints and placement
  /// strategies. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html">Scheduling
  /// Tasks</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// Alternatively, you can use <a>StartTask</a> to use your own scheduler or
  /// place tasks manually on specific container instances.
  ///
  /// Starting April 15, 2023, Amazon Web Services will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
  ///
  /// You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
  /// volume when creating or updating a service. For more infomation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The Amazon ECS API follows an eventual consistency model. This is because
  /// of the distributed nature of the system supporting the API. This means
  /// that the result of an API command you run that affects your Amazon ECS
  /// resources might not be immediately visible to all subsequent commands you
  /// run. Keep this in mind when you carry out an API command that immediately
  /// follows a previous API command.
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
  /// May throw [ConflictException].
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run.
  /// If a <code>revision</code> isn't specified, the latest <code>ACTIVE</code>
  /// revision is used.
  ///
  /// The full ARN value must match the value that you specified as the
  /// <code>Resource</code> of the principal's permissions policy.
  ///
  /// When you specify a task definition, you must either specify a specific
  /// revision, or all revisions in the ARN.
  ///
  /// To specify a specific revision, include the revision number in the ARN.
  /// For example, to specify revision 2, use
  /// <code>arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:2</code>.
  ///
  /// To specify all revisions, use the wildcard (*) in the ARN. For example, to
  /// specify all revisions, use
  /// <code>arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:*</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-resources">Policy
  /// Resources for Amazon ECS</a> in the Amazon Elastic Container Service
  /// Developer Guide.
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
  /// When you use cluster auto scaling, you must specify
  /// <code>capacityProviderStrategy</code> and not <code>launchType</code>.
  ///
  /// A capacity provider strategy may contain a maximum of 6 capacity
  /// providers.
  ///
  /// Parameter [clientToken] :
  /// An identifier that you provide to ensure the idempotency of the request.
  /// It must be unique and is case sensitive. Up to 64 characters are allowed.
  /// The valid characters are characters in the range of 33-126, inclusive. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/ECS_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster to run
  /// your task on. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [count] :
  /// The number of instantiations of the specified task to place on your
  /// cluster. You can specify up to 10 tasks for each call.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to use Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Determines whether to use the execute command functionality for the
  /// containers in this task. If <code>true</code>, this enables execute
  /// command functionality on all containers in the task.
  ///
  /// If <code>true</code>, then the task definition must have a task role, or
  /// you must provide one as an override.
  ///
  /// Parameter [group] :
  /// The name of the task group to associate with the task. The default value
  /// is the family name of the task definition (for example,
  /// <code>family:my-family-name</code>).
  ///
  /// Parameter [launchType] :
  /// The infrastructure to run your standalone task on. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// The <code>FARGATE</code> launch type runs your tasks on Fargate On-Demand
  /// infrastructure.
  /// <note>
  /// Fargate Spot infrastructure is available for use but a capacity provider
  /// strategy must be used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-capacity-providers.html">Fargate
  /// capacity providers</a> in the <i>Amazon ECS Developer Guide</i>.
  /// </note>
  /// The <code>EC2</code> launch type runs your tasks on Amazon EC2 instances
  /// registered to your cluster.
  ///
  /// The <code>EXTERNAL</code> launch type runs your tasks on your on-premises
  /// server or virtual machine (VM) capacity registered to your cluster.
  ///
  /// A task can use either a launch type or a capacity provider strategy. If a
  /// <code>launchType</code> is specified, the
  /// <code>capacityProviderStrategy</code> parameter must be omitted.
  ///
  /// When you use cluster auto scaling, you must specify
  /// <code>capacityProviderStrategy</code> and not <code>launchType</code>.
  ///
  /// Parameter [networkConfiguration] :
  /// The network configuration for the task. This parameter is required for
  /// task definitions that use the <code>awsvpc</code> network mode to receive
  /// their own elastic network interface, and it isn't supported for other
  /// network modes. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Task
  /// networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [overrides] :
  /// A list of container overrides in JSON format that specify the name of a
  /// container in the specified task definition and the overrides it should
  /// receive. You can override the default command for a container (that's
  /// specified in the task definition or Docker image) with a
  /// <code>command</code> override. You can also override existing environment
  /// variables (that are specified in the task definition or Docker image) on a
  /// container or add new environment variables to it with an
  /// <code>environment</code> override.
  ///
  /// A total of 8192 characters are allowed for overrides. This limit includes
  /// the JSON formatting characters of the override structure.
  ///
  /// Parameter [placementConstraints] :
  /// An array of placement constraint objects to use for the task. You can
  /// specify up to 10 constraints for each task (including constraints in the
  /// task definition and those specified at runtime).
  ///
  /// Parameter [placementStrategy] :
  /// The placement strategy objects to use for the task. You can specify a
  /// maximum of 5 strategy rules for each task.
  ///
  /// Parameter [platformVersion] :
  /// The platform version the task uses. A platform version is only specified
  /// for tasks hosted on Fargate. If one isn't specified, the
  /// <code>LATEST</code> platform version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// platform versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags aren't propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task
  /// after task creation, use the <a>TagResource</a> API action.
  /// <note>
  /// An error will be received if you specify the <code>SERVICE</code> option
  /// when running a task.
  /// </note>
  ///
  /// Parameter [referenceId] :
  /// The reference ID to use for the task. The reference ID can have a maximum
  /// length of 1024 characters.
  ///
  /// Parameter [startedBy] :
  /// An optional tag specified when a task is started. For example, if you
  /// automatically trigger a task to run a batch process job, you could apply a
  /// unique identifier for that job to your task with the
  /// <code>startedBy</code> parameter. You can then identify which tasks belong
  /// to that job by filtering the results of a <a>ListTasks</a> call with the
  /// <code>startedBy</code> value. Up to 128 letters (uppercase and lowercase),
  /// numbers, hyphens (-), and underscores (_) are allowed.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [volumeConfigurations] :
  /// The details of the volume that was <code>configuredAtLaunch</code>. You
  /// can configure the size, volumeType, IOPS, throughput, snapshot and
  /// encryption in in <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TaskManagedEBSVolumeConfiguration.html">TaskManagedEBSVolumeConfiguration</a>.
  /// The <code>name</code> of the volume must match the <code>name</code> from
  /// the task definition.
  Future<RunTaskResponse> runTask({
    required String taskDefinition,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? clientToken,
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
    List<TaskVolumeConfiguration>? volumeConfigurations,
  }) async {
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
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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
        if (volumeConfigurations != null)
          'volumeConfigurations': volumeConfigurations,
      },
    );

    return RunTaskResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new task from the specified task definition on the specified
  /// container instance or instances.
  /// <note>
  /// On March 21, 2024, a change was made to resolve the task definition
  /// revision before authorization. When a task definition revision is not
  /// specified, authorization will occur using the latest revision of a task
  /// definition.
  /// </note>
  /// Starting April 15, 2023, Amazon Web Services will not onboard new
  /// customers to Amazon Elastic Inference (EI), and will help current
  /// customers migrate their workloads to options that offer better price and
  /// performance. After April 15, 2023, new customers will not be able to
  /// launch instances with Amazon EI accelerators in Amazon SageMaker, Amazon
  /// ECS, or Amazon EC2. However, customers who have used Amazon EI at least
  /// once during the past 30-day period are considered current customers and
  /// will be able to continue using the service.
  ///
  /// Alternatively, you can use <a>RunTask</a> to place tasks for you. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html">Scheduling
  /// Tasks</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  ///
  /// You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
  /// volume when creating or updating a service. For more infomation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ClusterNotFoundException].
  /// May throw [UnsupportedFeatureException].
  ///
  /// Parameter [containerInstances] :
  /// The container instance IDs or full ARN entries for the container instances
  /// where you would like to place your task. You can specify up to 10
  /// container instances.
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to
  /// start. If a <code>revision</code> isn't specified, the latest
  /// <code>ACTIVE</code> revision is used.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster where to
  /// start your task. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Specifies whether to use Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Parameter [enableExecuteCommand] :
  /// Whether or not the execute command functionality is turned on for the
  /// task. If <code>true</code>, this turns on the execute command
  /// functionality on all containers in the task.
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
  /// container in the specified task definition and the overrides it receives.
  /// You can override the default command for a container (that's specified in
  /// the task definition or Docker image) with a <code>command</code> override.
  /// You can also override existing environment variables (that are specified
  /// in the task definition or Docker image) on a container or add new
  /// environment variables to it with an <code>environment</code> override.
  /// <note>
  /// A total of 8192 characters are allowed for overrides. This limit includes
  /// the JSON formatting characters of the override structure.
  /// </note>
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the task definition or the
  /// service to the task. If no value is specified, the tags aren't propagated.
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
  /// numbers, hyphens (-), and underscores (_) are allowed.
  ///
  /// If a task is started by an Amazon ECS service, the <code>startedBy</code>
  /// parameter contains the deployment ID of the service that starts it.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [volumeConfigurations] :
  /// The details of the volume that was <code>configuredAtLaunch</code>. You
  /// can configure the size, volumeType, IOPS, throughput, snapshot and
  /// encryption in <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TaskManagedEBSVolumeConfiguration.html">TaskManagedEBSVolumeConfiguration</a>.
  /// The <code>name</code> of the volume must match the <code>name</code> from
  /// the task definition.
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
    List<TaskVolumeConfiguration>? volumeConfigurations,
  }) async {
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
        if (volumeConfigurations != null)
          'volumeConfigurations': volumeConfigurations,
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
  /// The task ID of the task to stop.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the task to stop. If you do not specify a cluster, the default
  /// cluster is assumed.
  ///
  /// Parameter [reason] :
  /// An optional message specified when a task is stopped. For example, if
  /// you're using a custom scheduler, you can use this parameter to specify the
  /// reason for stopping the task here, and the message appears in subsequent
  /// <a>DescribeTasks</a> API operations on this task.
  Future<StopTaskResponse> stopTask({
    required String task,
    String? cluster,
    String? reason,
  }) async {
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
  /// The exit code that's returned for the state change request.
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
  /// Any containers that's associated with the state change request.
  ///
  /// Parameter [executionStoppedAt] :
  /// The Unix timestamp for the time when the task execution stopped.
  ///
  /// Parameter [managedAgents] :
  /// The details for the managed agent that's associated with the task.
  ///
  /// Parameter [pullStartedAt] :
  /// The Unix timestamp for the time when the container image pull started.
  ///
  /// Parameter [pullStoppedAt] :
  /// The Unix timestamp for the time when the container image pull completed.
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
  /// <code>resourceArn</code>. If existing tags on a resource aren't specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags that are associated with that resource are deleted as
  /// well.
  ///
  /// May throw [ServerException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to. Currently,
  /// the supported resources are Amazon ECS capacity providers, tasks,
  /// services, task definitions, clusters, and container instances.
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
  /// reserved for Amazon Web Services use. You cannot edit or delete tag keys
  /// or values with this prefix. Tags with this prefix do not count against
  /// your tags per resource limit.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
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
  /// The Amazon Resource Name (ARN) of the resource to delete tags from.
  /// Currently, the supported resources are Amazon ECS capacity providers,
  /// tasks, services, task definitions, clusters, and container instances.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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
  /// An object that represent the parameters to update for the Auto Scaling
  /// group capacity provider.
  ///
  /// Parameter [name] :
  /// The name of the capacity provider to update.
  Future<UpdateCapacityProviderResponse> updateCapacityProvider({
    required AutoScalingGroupProviderUpdate autoScalingGroupProvider,
    required String name,
  }) async {
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
  /// May throw [NamespaceNotFoundException].
  ///
  /// Parameter [cluster] :
  /// The name of the cluster to modify the settings for.
  ///
  /// Parameter [configuration] :
  /// The execute command configuration for the cluster.
  ///
  /// Parameter [serviceConnectDefaults] :
  /// Use this parameter to set a default Service Connect namespace. After you
  /// set a default Service Connect namespace, any new services with Service
  /// Connect turned on that are created in the cluster are added as client
  /// services in the namespace. This setting only applies to new services that
  /// set the <code>enabled</code> parameter to <code>true</code> in the
  /// <code>ServiceConnectConfiguration</code>. You can set the namespace of
  /// each service individually in the <code>ServiceConnectConfiguration</code>
  /// to override this default parameter.
  ///
  /// Tasks that run in a namespace can use short names to connect to services
  /// in the namespace. Tasks can connect to services across all of the clusters
  /// in the namespace. Tasks connect through a managed proxy container that
  /// collects logs and metrics for increased visibility. Only the tasks that
  /// Amazon ECS services create are supported with Service Connect. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [settings] :
  /// The cluster settings for your cluster.
  Future<UpdateClusterResponse> updateCluster({
    required String cluster,
    ClusterConfiguration? configuration,
    ClusterServiceConnectDefaultsRequest? serviceConnectDefaults,
    List<ClusterSetting>? settings,
  }) async {
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
        if (serviceConnectDefaults != null)
          'serviceConnectDefaults': serviceConnectDefaults,
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
  /// turn on CloudWatch Container Insights for a cluster. If this value is
  /// specified, it overrides the <code>containerInsights</code> value set with
  /// <a>PutAccountSetting</a> or <a>PutAccountSettingDefault</a>.
  /// <important>
  /// Currently, if you delete an existing cluster that does not have Container
  /// Insights turned on, and then create a new cluster with the same name with
  /// Container Insights tuned on, Container Insights will not actually be
  /// turned on. If you want to preserve the same name for your existing cluster
  /// and turn on Container Insights, you must wait 7 days before you can
  /// re-create it.
  /// </important>
  Future<UpdateClusterSettingsResponse> updateClusterSettings({
    required String cluster,
    required List<ClusterSetting> settings,
  }) async {
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
  /// Updating the Amazon ECS container agent doesn't interrupt running tasks or
  /// services on the container instance. The process for updating the agent
  /// differs depending on whether your container instance was launched with the
  /// Amazon ECS-optimized AMI or another operating system.
  /// <note>
  /// The <code>UpdateContainerAgent</code> API isn't supported for container
  /// instances using the Amazon ECS-optimized Amazon Linux 2 (arm64) AMI. To
  /// update the container agent, you can update the <code>ecs-init</code>
  /// package. This updates the agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/agent-update-ecs-ami.html">Updating
  /// the Amazon ECS container agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note> <note>
  /// Agent updates with the <code>UpdateContainerAgent</code> API operation do
  /// not apply to Windows container instances. We recommend that you launch new
  /// container instances to update the agent version in your Windows clusters.
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
  /// where you would like to update the Amazon ECS container agent.
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that your
  /// container instance is running on. If you do not specify a cluster, the
  /// default cluster is assumed.
  Future<UpdateContainerAgentResponse> updateContainerAgent({
    required String containerInstance,
    String? cluster,
  }) async {
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
  /// A container instance can't be changed to <code>DRAINING</code> until it
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
  /// that do not use a load balancer are considered healthy if they're in the
  /// <code>RUNNING</code> state. Tasks for services that use a load balancer
  /// are considered healthy if they're in the <code>RUNNING</code> state and
  /// are reported as healthy by the load balancer.
  /// </li>
  /// <li>
  /// The <code>maximumPercent</code> parameter represents an upper limit on the
  /// number of running tasks during task replacement. You can use this to
  /// define the replacement batch size. For example, if
  /// <code>desiredCount</code> is four tasks, a maximum of 200% starts four new
  /// tasks before stopping the four tasks to be drained, provided that the
  /// cluster resources required to do this are available. If the maximum is
  /// 100%, then replacement tasks can't start until the draining tasks have
  /// stopped.
  /// </li>
  /// </ul>
  /// Any <code>PENDING</code> or <code>RUNNING</code> tasks that do not belong
  /// to a service aren't affected. You must wait for them to finish or stop
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
  /// A list of up to 10 container instance IDs or full ARN entries.
  ///
  /// Parameter [status] :
  /// The container instance state to update the container instance with. The
  /// only valid values for this action are <code>ACTIVE</code> and
  /// <code>DRAINING</code>. A container instance can only be updated to
  /// <code>DRAINING</code> status once it has reached an <code>ACTIVE</code>
  /// state. If a container instance is in <code>REGISTERING</code>,
  /// <code>DEREGISTERING</code>, or <code>REGISTRATION_FAILED</code> state you
  /// can describe the container instance but can't update the container
  /// instance state.
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

  /// Modifies the parameters of a service.
  /// <note>
  /// On March 21, 2024, a change was made to resolve the task definition
  /// revision before authorization. When a task definition revision is not
  /// specified, authorization will occur using the latest revision of a task
  /// definition.
  /// </note>
  /// For services using the rolling update (<code>ECS</code>) you can update
  /// the desired count, deployment configuration, network configuration, load
  /// balancers, service registries, enable ECS managed tags option, propagate
  /// tags option, task placement constraints and strategies, and task
  /// definition. When you update any of these parameters, Amazon ECS starts new
  /// tasks with the new configuration.
  ///
  /// You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
  /// volume when starting or running a task, or when creating or updating a
  /// service. For more infomation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>. You can update your volume configurations and trigger a new
  /// deployment. <code>volumeConfigurations</code> is only supported for
  /// REPLICA service and not DAEMON service. If you leave
  /// <code>volumeConfigurations</code> <code>null</code>, it doesn't trigger a
  /// new deployment. For more infomation on volumes, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// For services using the blue/green (<code>CODE_DEPLOY</code>) deployment
  /// controller, only the desired count, deployment configuration, health check
  /// grace period, task placement constraints and strategies, enable ECS
  /// managed tags option, and propagate tags can be updated using this API. If
  /// the network configuration, platform version, task definition, or load
  /// balancer need to be updated, create a new CodeDeploy deployment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html">CreateDeployment</a>
  /// in the <i>CodeDeploy API Reference</i>.
  ///
  /// For services using an external deployment controller, you can update only
  /// the desired count, task placement constraints and strategies, health check
  /// grace period, enable ECS managed tags option, and propagate tags option,
  /// using this API. If the launch type, load balancer, network configuration,
  /// platform version, or task definition need to be updated, create a new task
  /// set For more information, see <a>CreateTaskSet</a>.
  ///
  /// You can add to or subtract from the number of instantiations of a task
  /// definition in a service by specifying the cluster that the service is
  /// running in and a new <code>desiredCount</code> parameter.
  ///
  /// You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the
  /// volume when starting or running a task, or when creating or updating a
  /// service. For more infomation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
  /// EBS volumes</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// If you have updated the container image of your application, you can
  /// create a new task definition with that image and deploy it to your
  /// service. The service scheduler uses the minimum healthy percent and
  /// maximum percent parameters (in the service's deployment configuration) to
  /// determine the deployment strategy.
  /// <note>
  /// If your updated Docker image uses the same tag as what is in the existing
  /// task definition for your service (for example,
  /// <code>my_image:latest</code>), you don't need to create a new revision of
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
  /// tasks. Tasks for services that don't use a load balancer are considered
  /// healthy if they're in the <code>RUNNING</code> state. Tasks for services
  /// that use a load balancer are considered healthy if they're in the
  /// <code>RUNNING</code> state and are reported as healthy by the load
  /// balancer.
  /// </li>
  /// <li>
  /// The <code>maximumPercent</code> parameter represents an upper limit on the
  /// number of running tasks during a deployment. You can use it to define the
  /// deployment batch size. For example, if <code>desiredCount</code> is four
  /// tasks, a maximum of 200% starts four new tasks before stopping the four
  /// older tasks (provided that the cluster resources required to do this are
  /// available).
  /// </li>
  /// </ul>
  /// When <a>UpdateService</a> stops a task during a deployment, the equivalent
  /// of <code>docker stop</code> is issued to the containers running in the
  /// task. This results in a <code>SIGTERM</code> and a 30-second timeout.
  /// After this, <code>SIGKILL</code> is sent and the containers are forcibly
  /// stopped. If the container handles the <code>SIGTERM</code> gracefully and
  /// exits within 30 seconds from receiving it, no <code>SIGKILL</code> is
  /// sent.
  ///
  /// When the service scheduler launches new tasks, it determines task
  /// placement in your cluster with the following logic.
  ///
  /// <ul>
  /// <li>
  /// Determine which of the container instances in your cluster can support
  /// your service's task definition. For example, they have the required CPU,
  /// memory, ports, and container instance attributes.
  /// </li>
  /// <li>
  /// By default, the service scheduler attempts to balance tasks across
  /// Availability Zones in this manner even though you can choose a different
  /// placement strategy.
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
  /// </ul> <note>
  /// You must have a service-linked role when you update any of the following
  /// service properties:
  ///
  /// <ul>
  /// <li>
  /// <code>loadBalancers</code>,
  /// </li>
  /// <li>
  /// <code>serviceRegistries</code>
  /// </li>
  /// </ul>
  /// For more information about the role see the <code>CreateService</code>
  /// request parameter <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html#ECS-CreateService-request-role">
  /// <code>role</code> </a>.
  /// </note>
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
  /// May throw [NamespaceNotFoundException].
  /// May throw [UnsupportedFeatureException].
  ///
  /// Parameter [service] :
  /// The name of the service to update.
  ///
  /// Parameter [capacityProviderStrategy] :
  /// The capacity provider strategy to update the service to use.
  ///
  /// if the service uses the default capacity provider strategy for the
  /// cluster, the service can be updated to use one or more capacity providers
  /// as opposed to the default capacity provider strategy. However, when a
  /// service is using a capacity provider strategy that's not the default
  /// capacity provider strategy, the service can't be updated to use the
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
  /// To use a Fargate capacity provider, specify either the
  /// <code>FARGATE</code> or <code>FARGATE_SPOT</code> capacity providers. The
  /// Fargate capacity providers are available to all accounts and only need to
  /// be associated with a cluster to be used.
  ///
  /// The <a>PutClusterCapacityProviders</a> API operation is used to update the
  /// list of available capacity providers for a cluster after the cluster is
  /// created.
  /// <p/>
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that your
  /// service runs on. If you do not specify a cluster, the default cluster is
  /// assumed.
  ///
  /// Parameter [deploymentConfiguration] :
  /// Optional deployment parameters that control how many tasks run during the
  /// deployment and the ordering of stopping and starting tasks.
  ///
  /// Parameter [desiredCount] :
  /// The number of instantiations of the task to place and keep running in your
  /// service.
  ///
  /// Parameter [enableECSManagedTags] :
  /// Determines whether to turn on Amazon ECS managed tags for the tasks in the
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// Only tasks launched after the update will reflect the update. To update
  /// the tags on all tasks, set <code>forceNewDeployment</code> to
  /// <code>true</code>, so that Amazon ECS starts new tasks with the updated
  /// tags.
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
  /// Determines whether to force a new deployment of the service. By default,
  /// deployments aren't forced. You can use this option to start a new
  /// deployment with no service definition changes. For example, you can update
  /// a service's tasks to use a newer Docker image with the same image/tag
  /// combination (<code>my_image:latest</code>) or to roll Fargate tasks onto a
  /// newer platform version.
  ///
  /// Parameter [healthCheckGracePeriodSeconds] :
  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// ignores unhealthy Elastic Load Balancing target health checks after a task
  /// has first started. This is only valid if your service is configured to use
  /// a load balancer. If your service's tasks take a while to start and respond
  /// to Elastic Load Balancing health checks, you can specify a health check
  /// grace period of up to 2,147,483,647 seconds. During that time, the Amazon
  /// ECS service scheduler ignores the Elastic Load Balancing health check
  /// status. This grace period can prevent the ECS service scheduler from
  /// marking tasks as unhealthy and stopping them before they have time to come
  /// up.
  ///
  /// Parameter [loadBalancers] :
  /// A list of Elastic Load Balancing load balancer objects. It contains the
  /// load balancer name, the container name, and the container port to access
  /// from the load balancer. The container name is as it appears in a container
  /// definition.
  ///
  /// When you add, update, or remove a load balancer configuration, Amazon ECS
  /// starts new tasks with the updated Elastic Load Balancing configuration,
  /// and then stops the old tasks when the new tasks are running.
  ///
  /// For services that use rolling updates, you can add, update, or remove
  /// Elastic Load Balancing target groups. You can update from a single target
  /// group to multiple target groups and from multiple target groups to a
  /// single target group.
  ///
  /// For services that use blue/green deployments, you can update Elastic Load
  /// Balancing target groups by using <code> <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html">CreateDeployment</a>
  /// </code> through CodeDeploy. Note that multiple target groups are not
  /// supported for blue/green deployments. For more information see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html">Register
  /// multiple target groups with a service</a> in the <i>Amazon Elastic
  /// Container Service Developer Guide</i>.
  ///
  /// For services that use the external deployment controller, you can add,
  /// update, or remove load balancers by using <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateTaskSet.html">CreateTaskSet</a>.
  /// Note that multiple target groups are not supported for external
  /// deployments. For more information see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html">Register
  /// multiple target groups with a service</a> in the <i>Amazon Elastic
  /// Container Service Developer Guide</i>.
  ///
  /// You can remove existing <code>loadBalancers</code> by passing an empty
  /// list.
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
  /// You can specify a maximum of 10 constraints for each task. This limit
  /// includes constraints in the task definition and those specified at
  /// runtime.
  ///
  /// Parameter [placementStrategy] :
  /// The task placement strategy objects to update the service to use. If no
  /// value is specified, the existing placement strategy for the service will
  /// remain unchanged. If this value is specified, it will override the
  /// existing placement strategy defined for the service. To remove an existing
  /// placement strategy, specify an empty object.
  ///
  /// You can specify a maximum of five strategy rules for each service.
  ///
  /// Parameter [platformVersion] :
  /// The platform version that your tasks in the service run on. A platform
  /// version is only specified for tasks using the Fargate launch type. If a
  /// platform version is not specified, the <code>LATEST</code> platform
  /// version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [propagateTags] :
  /// Determines whether to propagate the tags from the task definition or the
  /// service to the task. If no value is specified, the tags aren't propagated.
  ///
  /// Only tasks launched after the update will reflect the update. To update
  /// the tags on all tasks, set <code>forceNewDeployment</code> to
  /// <code>true</code>, so that Amazon ECS starts new tasks with the updated
  /// tags.
  ///
  /// Parameter [serviceConnectConfiguration] :
  /// The configuration for this service to discover and connect to services,
  /// and be discovered by, and connected from, other services within a
  /// namespace.
  ///
  /// Tasks that run in a namespace can use short names to connect to services
  /// in the namespace. Tasks can connect to services across all of the clusters
  /// in the namespace. Tasks connect through a managed proxy container that
  /// collects logs and metrics for increased visibility. Only the tasks that
  /// Amazon ECS services create are supported with Service Connect. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// Parameter [serviceRegistries] :
  /// The details for the service discovery registries to assign to this
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// Discovery</a>.
  ///
  /// When you add, update, or remove the service registries configuration,
  /// Amazon ECS starts new tasks with the updated service registries
  /// configuration, and then stops the old tasks when the new tasks are
  /// running.
  ///
  /// You can remove existing <code>serviceRegistries</code> by passing an empty
  /// list.
  ///
  /// Parameter [taskDefinition] :
  /// The <code>family</code> and <code>revision</code>
  /// (<code>family:revision</code>) or full ARN of the task definition to run
  /// in your service. If a <code>revision</code> is not specified, the latest
  /// <code>ACTIVE</code> revision is used. If you modify the task definition
  /// with <code>UpdateService</code>, Amazon ECS spawns a task with the new
  /// version of the task definition and then stops an old task after the new
  /// version is running.
  ///
  /// Parameter [volumeConfigurations] :
  /// The details of the volume that was <code>configuredAtLaunch</code>. You
  /// can configure the size, volumeType, IOPS, throughput, snapshot and
  /// encryption in <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ServiceManagedEBSVolumeConfiguration.html">ServiceManagedEBSVolumeConfiguration</a>.
  /// The <code>name</code> of the volume must match the <code>name</code> from
  /// the task definition. If set to null, no new deployment is triggered.
  /// Otherwise, if this configuration differs from the existing one, it
  /// triggers a new deployment.
  Future<UpdateServiceResponse> updateService({
    required String service,
    List<CapacityProviderStrategyItem>? capacityProviderStrategy,
    String? cluster,
    DeploymentConfiguration? deploymentConfiguration,
    int? desiredCount,
    bool? enableECSManagedTags,
    bool? enableExecuteCommand,
    bool? forceNewDeployment,
    int? healthCheckGracePeriodSeconds,
    List<LoadBalancer>? loadBalancers,
    NetworkConfiguration? networkConfiguration,
    List<PlacementConstraint>? placementConstraints,
    List<PlacementStrategy>? placementStrategy,
    String? platformVersion,
    PropagateTags? propagateTags,
    ServiceConnectConfiguration? serviceConnectConfiguration,
    List<ServiceRegistry>? serviceRegistries,
    String? taskDefinition,
    List<ServiceVolumeConfiguration>? volumeConfigurations,
  }) async {
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
        if (enableECSManagedTags != null)
          'enableECSManagedTags': enableECSManagedTags,
        if (enableExecuteCommand != null)
          'enableExecuteCommand': enableExecuteCommand,
        if (forceNewDeployment != null)
          'forceNewDeployment': forceNewDeployment,
        if (healthCheckGracePeriodSeconds != null)
          'healthCheckGracePeriodSeconds': healthCheckGracePeriodSeconds,
        if (loadBalancers != null) 'loadBalancers': loadBalancers,
        if (networkConfiguration != null)
          'networkConfiguration': networkConfiguration,
        if (placementConstraints != null)
          'placementConstraints': placementConstraints,
        if (placementStrategy != null) 'placementStrategy': placementStrategy,
        if (platformVersion != null) 'platformVersion': platformVersion,
        if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
        if (serviceConnectConfiguration != null)
          'serviceConnectConfiguration': serviceConnectConfiguration,
        if (serviceRegistries != null) 'serviceRegistries': serviceRegistries,
        if (taskDefinition != null) 'taskDefinition': taskDefinition,
        if (volumeConfigurations != null)
          'volumeConfigurations': volumeConfigurations,
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

  /// Updates the protection status of a task. You can set
  /// <code>protectionEnabled</code> to <code>true</code> to protect your task
  /// from termination during scale-in events from <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-auto-scaling.html">Service
  /// Autoscaling</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html">deployments</a>.
  ///
  /// Task-protection, by default, expires after 2 hours at which point Amazon
  /// ECS clears the <code>protectionEnabled</code> property making the task
  /// eligible for termination by a subsequent scale-in event.
  ///
  /// You can specify a custom expiration period for task protection from 1
  /// minute to up to 2,880 minutes (48 hours). To specify the custom expiration
  /// period, set the <code>expiresInMinutes</code> property. The
  /// <code>expiresInMinutes</code> property is always reset when you invoke
  /// this operation for a task that already has <code>protectionEnabled</code>
  /// set to <code>true</code>. You can keep extending the protection expiration
  /// period of a task by invoking this operation repeatedly.
  ///
  /// To learn more about Amazon ECS task protection, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-scale-in-protection.html">Task
  /// scale-in protection</a> in the <i> <i>Amazon Elastic Container Service
  /// Developer Guide</i> </i>.
  /// <note>
  /// This operation is only supported for tasks belonging to an Amazon ECS
  /// service. Invoking this operation for a standalone task will result in an
  /// <code>TASK_NOT_VALID</code> failure. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html">API
  /// failure reasons</a>.
  /// </note> <important>
  /// If you prefer to set task protection from within the container, we
  /// recommend using the <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-scale-in-protection-endpoint.html">Task
  /// scale-in protection endpoint</a>.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ClusterNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnsupportedFeatureException].
  ///
  /// Parameter [cluster] :
  /// The short name or full Amazon Resource Name (ARN) of the cluster that
  /// hosts the service that the task sets exist in.
  ///
  /// Parameter [protectionEnabled] :
  /// Specify <code>true</code> to mark a task for protection and
  /// <code>false</code> to unset protection, making it eligible for
  /// termination.
  ///
  /// Parameter [tasks] :
  /// A list of up to 10 task IDs or full ARN entries.
  ///
  /// Parameter [expiresInMinutes] :
  /// If you set <code>protectionEnabled</code> to <code>true</code>, you can
  /// specify the duration for task protection in minutes. You can specify a
  /// value from 1 minute to up to 2,880 minutes (48 hours). During this time,
  /// your task will not be terminated by scale-in events from Service Auto
  /// Scaling or deployments. After this time period lapses,
  /// <code>protectionEnabled</code> will be reset to <code>false</code>.
  ///
  /// If you don’t specify the time, then the task is automatically protected
  /// for 120 minutes (2 hours).
  Future<UpdateTaskProtectionResponse> updateTaskProtection({
    required String cluster,
    required bool protectionEnabled,
    required List<String> tasks,
    int? expiresInMinutes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerServiceV20141113.UpdateTaskProtection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'cluster': cluster,
        'protectionEnabled': protectionEnabled,
        'tasks': tasks,
        if (expiresInMinutes != null) 'expiresInMinutes': expiresInMinutes,
      },
    );

    return UpdateTaskProtectionResponse.fromJson(jsonResponse.body);
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
  /// hosts the service that the task set is found in.
  ///
  /// Parameter [scale] :
  /// A floating-point percentage of the desired number of tasks to place and
  /// keep running in the task set.
  ///
  /// Parameter [service] :
  /// The short name or full Amazon Resource Name (ARN) of the service that the
  /// task set is found in.
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

extension AgentUpdateStatusValueExtension on AgentUpdateStatus {
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

extension AgentUpdateStatusFromString on String {
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

enum ApplicationProtocol {
  http,
  http2,
  grpc,
}

extension ApplicationProtocolValueExtension on ApplicationProtocol {
  String toValue() {
    switch (this) {
      case ApplicationProtocol.http:
        return 'http';
      case ApplicationProtocol.http2:
        return 'http2';
      case ApplicationProtocol.grpc:
        return 'grpc';
    }
  }
}

extension ApplicationProtocolFromString on String {
  ApplicationProtocol toApplicationProtocol() {
    switch (this) {
      case 'http':
        return ApplicationProtocol.http;
      case 'http2':
        return ApplicationProtocol.http2;
      case 'grpc':
        return ApplicationProtocol.grpc;
    }
    throw Exception('$this is not known in enum ApplicationProtocol');
  }
}

enum AssignPublicIp {
  enabled,
  disabled,
}

extension AssignPublicIpValueExtension on AssignPublicIp {
  String toValue() {
    switch (this) {
      case AssignPublicIp.enabled:
        return 'ENABLED';
      case AssignPublicIp.disabled:
        return 'DISABLED';
    }
  }
}

extension AssignPublicIpFromString on String {
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
  /// Details of the attachment.
  ///
  /// For elastic network interfaces, this includes the network interface ID, the
  /// MAC address, the subnet ID, and the private IPv4 address.
  ///
  /// For Service Connect services, this includes <code>portName</code>,
  /// <code>clientAliases</code>, <code>discoveryName</code>, and
  /// <code>ingressPortOverride</code>.
  ///
  /// For Elastic Block Storage, this includes <code>roleArn</code>,
  /// <code>deleteOnTermination</code>, <code>volumeName</code>,
  /// <code>volumeId</code>, and <code>statusReason</code> (only when the
  /// attachment fails to create or attach).
  final List<KeyValuePair>? details;

  /// The unique identifier for the attachment.
  final String? id;

  /// The status of the attachment. Valid values are <code>PRECREATED</code>,
  /// <code>CREATED</code>, <code>ATTACHING</code>, <code>ATTACHED</code>,
  /// <code>DETACHING</code>, <code>DETACHED</code>, <code>DELETED</code>, and
  /// <code>FAILED</code>.
  final String? status;

  /// The type of the attachment, such as <code>ElasticNetworkInterface</code>,
  /// <code>Service Connect</code>, and <code>AmazonElasticBlockStorage</code>.
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

  Map<String, dynamic> toJson() {
    final attachmentArn = this.attachmentArn;
    final status = this.status;
    return {
      'attachmentArn': attachmentArn,
      'status': status,
    };
  }
}

/// An attribute is a name-value pair that's associated with an Amazon ECS
/// object. Use attributes to extend the Amazon ECS data model by adding custom
/// metadata to your resources. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes">Attributes</a>
/// in the <i>Amazon Elastic Container Service Developer Guide</i>.
class Attribute {
  /// The name of the attribute. The <code>name</code> must contain between 1 and
  /// 128 characters. The name may contain letters (uppercase and lowercase),
  /// numbers, hyphens (-), underscores (_), forward slashes (/), back slashes
  /// (\), or periods (.).
  final String name;

  /// The ID of the target. You can specify the short form ID for a resource or
  /// the full Amazon Resource Name (ARN).
  final String? targetId;

  /// The type of the target to attach the attribute with. This parameter is
  /// required if you use the short form ID for a resource instead of the full
  /// ARN.
  final TargetType? targetType;

  /// The value of the attribute. The <code>value</code> must contain between 1
  /// and 128 characters. It can contain letters (uppercase and lowercase),
  /// numbers, hyphens (-), underscores (_), periods (.), at signs (@), forward
  /// slashes (/), back slashes (\), colons (:), or spaces. The value can't start
  /// or end with a space.
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
  /// The Amazon Resource Name (ARN) that identifies the Auto Scaling group, or
  /// the Auto Scaling group name.
  final String autoScalingGroupArn;

  /// The managed draining option for the Auto Scaling group capacity provider.
  /// When you enable this, Amazon ECS manages and gracefully drains the EC2
  /// container instances that are in the Auto Scaling group capacity provider.
  final ManagedDraining? managedDraining;

  /// The managed scaling settings for the Auto Scaling group capacity provider.
  final ManagedScaling? managedScaling;

  /// The managed termination protection setting to use for the Auto Scaling group
  /// capacity provider. This determines whether the Auto Scaling group has
  /// managed termination protection. The default is off.
  /// <important>
  /// When using managed termination protection, managed scaling must also be used
  /// otherwise managed termination protection doesn't work.
  /// </important>
  /// When managed termination protection is on, Amazon ECS prevents the Amazon
  /// EC2 instances in an Auto Scaling group that contain tasks from being
  /// terminated during a scale-in action. The Auto Scaling group and each
  /// instance in the Auto Scaling group must have instance protection from
  /// scale-in actions on as well. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// Protection</a> in the <i>Auto Scaling User Guide</i>.
  ///
  /// When managed termination protection is off, your Amazon EC2 instances aren't
  /// protected from termination when the Auto Scaling group scales in.
  final ManagedTerminationProtection? managedTerminationProtection;

  AutoScalingGroupProvider({
    required this.autoScalingGroupArn,
    this.managedDraining,
    this.managedScaling,
    this.managedTerminationProtection,
  });

  factory AutoScalingGroupProvider.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroupProvider(
      autoScalingGroupArn: json['autoScalingGroupArn'] as String,
      managedDraining:
          (json['managedDraining'] as String?)?.toManagedDraining(),
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
    final managedDraining = this.managedDraining;
    final managedScaling = this.managedScaling;
    final managedTerminationProtection = this.managedTerminationProtection;
    return {
      'autoScalingGroupArn': autoScalingGroupArn,
      if (managedDraining != null) 'managedDraining': managedDraining.toValue(),
      if (managedScaling != null) 'managedScaling': managedScaling,
      if (managedTerminationProtection != null)
        'managedTerminationProtection': managedTerminationProtection.toValue(),
    };
  }
}

/// The details of the Auto Scaling group capacity provider to update.
class AutoScalingGroupProviderUpdate {
  /// The managed draining option for the Auto Scaling group capacity provider.
  /// When you enable this, Amazon ECS manages and gracefully drains the EC2
  /// container instances that are in the Auto Scaling group capacity provider.
  final ManagedDraining? managedDraining;

  /// The managed scaling settings for the Auto Scaling group capacity provider.
  final ManagedScaling? managedScaling;

  /// The managed termination protection setting to use for the Auto Scaling group
  /// capacity provider. This determines whether the Auto Scaling group has
  /// managed termination protection.
  /// <important>
  /// When using managed termination protection, managed scaling must also be used
  /// otherwise managed termination protection doesn't work.
  /// </important>
  /// When managed termination protection is on, Amazon ECS prevents the Amazon
  /// EC2 instances in an Auto Scaling group that contain tasks from being
  /// terminated during a scale-in action. The Auto Scaling group and each
  /// instance in the Auto Scaling group must have instance protection from
  /// scale-in actions on. For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection">Instance
  /// Protection</a> in the <i>Auto Scaling User Guide</i>.
  ///
  /// When managed termination protection is off, your Amazon EC2 instances aren't
  /// protected from termination when the Auto Scaling group scales in.
  final ManagedTerminationProtection? managedTerminationProtection;

  AutoScalingGroupProviderUpdate({
    this.managedDraining,
    this.managedScaling,
    this.managedTerminationProtection,
  });

  Map<String, dynamic> toJson() {
    final managedDraining = this.managedDraining;
    final managedScaling = this.managedScaling;
    final managedTerminationProtection = this.managedTerminationProtection;
    return {
      if (managedDraining != null) 'managedDraining': managedDraining.toValue(),
      if (managedScaling != null) 'managedScaling': managedScaling,
      if (managedTerminationProtection != null)
        'managedTerminationProtection': managedTerminationProtection.toValue(),
    };
  }
}

/// An object representing the networking details for a task or service. For
/// example
/// <code>awsvpcConfiguration={subnets=["subnet-12344321"],securityGroups=["sg-12344321"]}</code>
class AwsVpcConfiguration {
  /// The IDs of the subnets associated with the task or service. There's a limit
  /// of 16 subnets that can be specified per <code>AwsVpcConfiguration</code>.
  /// <note>
  /// All specified subnets must be from the same VPC.
  /// </note>
  final List<String> subnets;

  /// Whether the task's elastic network interface receives a public IP address.
  /// The default value is <code>DISABLED</code>.
  final AssignPublicIp? assignPublicIp;

  /// The IDs of the security groups associated with the task or service. If you
  /// don't specify a security group, the default security group for the VPC is
  /// used. There's a limit of 5 security groups that can be specified per
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

enum CPUArchitecture {
  x86_64,
  arm64,
}

extension CPUArchitectureValueExtension on CPUArchitecture {
  String toValue() {
    switch (this) {
      case CPUArchitecture.x86_64:
        return 'X86_64';
      case CPUArchitecture.arm64:
        return 'ARM64';
    }
  }
}

extension CPUArchitectureFromString on String {
  CPUArchitecture toCPUArchitecture() {
    switch (this) {
      case 'X86_64':
        return CPUArchitecture.x86_64;
      case 'ARM64':
        return CPUArchitecture.arm64;
    }
    throw Exception('$this is not known in enum CPUArchitecture');
  }
}

/// The details for a capacity provider.
class CapacityProvider {
  /// The Auto Scaling group settings for the capacity provider.
  final AutoScalingGroupProvider? autoScalingGroupProvider;

  /// The Amazon Resource Name (ARN) that identifies the capacity provider.
  final String? capacityProviderArn;

  /// The name of the capacity provider.
  final String? name;

  /// The current status of the capacity provider. Only capacity providers in an
  /// <code>ACTIVE</code> state can be used in a cluster. When a capacity provider
  /// is successfully deleted, it has an <code>INACTIVE</code> status.
  final CapacityProviderStatus? status;

  /// The metadata that you apply to the capacity provider to help you categorize
  /// and organize it. Each tag consists of a key and an optional value. You
  /// define both.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The update status of the capacity provider. The following are the possible
  /// states that is returned.
  /// <dl> <dt>DELETE_IN_PROGRESS</dt> <dd>
  /// The capacity provider is in the process of being deleted.
  /// </dd> <dt>DELETE_COMPLETE</dt> <dd>
  /// The capacity provider was successfully deleted and has an
  /// <code>INACTIVE</code> status.
  /// </dd> <dt>DELETE_FAILED</dt> <dd>
  /// The capacity provider can't be deleted. The update status reason provides
  /// further details about why the delete failed.
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

extension CapacityProviderFieldValueExtension on CapacityProviderField {
  String toValue() {
    switch (this) {
      case CapacityProviderField.tags:
        return 'TAGS';
    }
  }
}

extension CapacityProviderFieldFromString on String {
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

extension CapacityProviderStatusValueExtension on CapacityProviderStatus {
  String toValue() {
    switch (this) {
      case CapacityProviderStatus.active:
        return 'ACTIVE';
      case CapacityProviderStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension CapacityProviderStatusFromString on String {
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
/// To use a Fargate capacity provider, specify either the <code>FARGATE</code>
/// or <code>FARGATE_SPOT</code> capacity providers. The Fargate capacity
/// providers are available to all accounts and only need to be associated with
/// a cluster to be used in a capacity provider strategy.
///
/// A capacity provider strategy may contain a maximum of 6 capacity providers.
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
  /// weight of <code>0</code> can't be used to place tasks. If you specify
  /// multiple capacity providers in a strategy that all have a weight of
  /// <code>0</code>, any <code>RunTask</code> or <code>CreateService</code>
  /// actions using the capacity provider strategy will fail.
  ///
  /// An example scenario for using weights is defining a strategy that contains
  /// two capacity providers and both have a weight of <code>1</code>, then when
  /// the <code>base</code> is satisfied, the tasks will be split evenly across
  /// the two capacity providers. Using that same logic, if you specify a weight
  /// of <code>1</code> for <i>capacityProviderA</i> and a weight of
  /// <code>4</code> for <i>capacityProviderB</i>, then for every one task that's
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

extension CapacityProviderUpdateStatusValueExtension
    on CapacityProviderUpdateStatus {
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

extension CapacityProviderUpdateStatusFromString on String {
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

/// A regional grouping of one or more container instances where you can run
/// task requests. Each account receives a default cluster the first time you
/// use the Amazon ECS service, but you may also create other clusters. Clusters
/// may contain more than one instance type simultaneously.
class Cluster {
  /// The number of services that are running on the cluster in an
  /// <code>ACTIVE</code> state. You can view these services with
  /// <a>ListServices</a>.
  final int? activeServicesCount;

  /// The resources attached to a cluster. When using a capacity provider with a
  /// cluster, the capacity provider and associated resources are returned as
  /// cluster attachments.
  final List<Attachment>? attachments;

  /// The status of the capacity providers associated with the cluster. The
  /// following are the states that are returned.
  /// <dl> <dt>UPDATE_IN_PROGRESS</dt> <dd>
  /// The available capacity providers for the cluster are updating.
  /// </dd> <dt>UPDATE_COMPLETE</dt> <dd>
  /// The capacity providers have successfully updated.
  /// </dd> <dt>UPDATE_FAILED</dt> <dd>
  /// The capacity provider updates failed.
  /// </dd> </dl>
  final String? attachmentsStatus;

  /// The capacity providers associated with the cluster.
  final List<String>? capacityProviders;

  /// The Amazon Resource Name (ARN) that identifies the cluster. For more
  /// information about the ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids">Amazon
  /// Resource Name (ARN)</a> in the <i>Amazon ECS Developer Guide</i>.
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

  /// Use this parameter to set a default Service Connect namespace. After you set
  /// a default Service Connect namespace, any new services with Service Connect
  /// turned on that are created in the cluster are added as client services in
  /// the namespace. This setting only applies to new services that set the
  /// <code>enabled</code> parameter to <code>true</code> in the
  /// <code>ServiceConnectConfiguration</code>. You can set the namespace of each
  /// service individually in the <code>ServiceConnectConfiguration</code> to
  /// override this default parameter.
  ///
  /// Tasks that run in a namespace can use short names to connect to services in
  /// the namespace. Tasks can connect to services across all of the clusters in
  /// the namespace. Tasks connect through a managed proxy container that collects
  /// logs and metrics for increased visibility. Only the tasks that Amazon ECS
  /// services create are supported with Service Connect. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final ClusterServiceConnectDefaults? serviceConnectDefaults;

  /// The settings for the cluster. This parameter indicates whether CloudWatch
  /// Container Insights is on or off for a cluster.
  final List<ClusterSetting>? settings;

  /// Additional information about your clusters that are separated by launch
  /// type. They include the following:
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

  /// The status of the cluster. The following are the possible states that are
  /// returned.
  /// <dl> <dt>ACTIVE</dt> <dd>
  /// The cluster is ready to accept tasks and if applicable you can register
  /// container instances with the cluster.
  /// </dd> <dt>PROVISIONING</dt> <dd>
  /// The cluster has capacity providers that are associated with it and the
  /// resources needed for the capacity provider are being created.
  /// </dd> <dt>DEPROVISIONING</dt> <dd>
  /// The cluster has capacity providers that are associated with it and the
  /// resources needed for the capacity provider are being deleted.
  /// </dd> <dt>FAILED</dt> <dd>
  /// The cluster has capacity providers that are associated with it and the
  /// resources needed for the capacity provider have failed to create.
  /// </dd> <dt>INACTIVE</dt> <dd>
  /// The cluster has been deleted. Clusters with an <code>INACTIVE</code> status
  /// may remain discoverable in your account for a period of time. However, this
  /// behavior is subject to change in the future. We don't recommend that you
  /// rely on <code>INACTIVE</code> clusters persisting.
  /// </dd> </dl>
  final String? status;

  /// The metadata that you apply to the cluster to help you categorize and
  /// organize them. Each tag consists of a key and an optional value. You define
  /// both.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
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
    this.serviceConnectDefaults,
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
      serviceConnectDefaults: json['serviceConnectDefaults'] != null
          ? ClusterServiceConnectDefaults.fromJson(
              json['serviceConnectDefaults'] as Map<String, dynamic>)
          : null,
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
    final serviceConnectDefaults = this.serviceConnectDefaults;
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
      if (serviceConnectDefaults != null)
        'serviceConnectDefaults': serviceConnectDefaults,
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

extension ClusterFieldValueExtension on ClusterField {
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

extension ClusterFieldFromString on String {
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

/// Use this parameter to set a default Service Connect namespace. After you set
/// a default Service Connect namespace, any new services with Service Connect
/// turned on that are created in the cluster are added as client services in
/// the namespace. This setting only applies to new services that set the
/// <code>enabled</code> parameter to <code>true</code> in the
/// <code>ServiceConnectConfiguration</code>. You can set the namespace of each
/// service individually in the <code>ServiceConnectConfiguration</code> to
/// override this default parameter.
///
/// Tasks that run in a namespace can use short names to connect to services in
/// the namespace. Tasks can connect to services across all of the clusters in
/// the namespace. Tasks connect through a managed proxy container that collects
/// logs and metrics for increased visibility. Only the tasks that Amazon ECS
/// services create are supported with Service Connect. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
/// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class ClusterServiceConnectDefaults {
  /// The namespace name or full Amazon Resource Name (ARN) of the Cloud Map
  /// namespace. When you create a service and don't specify a Service Connect
  /// configuration, this namespace is used.
  final String? namespace;

  ClusterServiceConnectDefaults({
    this.namespace,
  });

  factory ClusterServiceConnectDefaults.fromJson(Map<String, dynamic> json) {
    return ClusterServiceConnectDefaults(
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      if (namespace != null) 'namespace': namespace,
    };
  }
}

/// Use this parameter to set a default Service Connect namespace. After you set
/// a default Service Connect namespace, any new services with Service Connect
/// turned on that are created in the cluster are added as client services in
/// the namespace. This setting only applies to new services that set the
/// <code>enabled</code> parameter to <code>true</code> in the
/// <code>ServiceConnectConfiguration</code>. You can set the namespace of each
/// service individually in the <code>ServiceConnectConfiguration</code> to
/// override this default parameter.
///
/// Tasks that run in a namespace can use short names to connect to services in
/// the namespace. Tasks can connect to services across all of the clusters in
/// the namespace. Tasks connect through a managed proxy container that collects
/// logs and metrics for increased visibility. Only the tasks that Amazon ECS
/// services create are supported with Service Connect. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
/// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class ClusterServiceConnectDefaultsRequest {
  /// The namespace name or full Amazon Resource Name (ARN) of the Cloud Map
  /// namespace that's used when you create a service and don't specify a Service
  /// Connect configuration. The namespace name can include up to 1024 characters.
  /// The name is case-sensitive. The name can't include hyphens (-), tilde (~),
  /// greater than (&gt;), less than (&lt;), or slash (/).
  ///
  /// If you enter an existing namespace name or ARN, then that namespace will be
  /// used. Any namespace type is supported. The namespace must be in this account
  /// and this Amazon Web Services Region.
  ///
  /// If you enter a new name, a Cloud Map namespace will be created. Amazon ECS
  /// creates a Cloud Map namespace with the "API calls" method of instance
  /// discovery only. This instance discovery method is the "HTTP" namespace type
  /// in the Command Line Interface. Other types of instance discovery aren't used
  /// by Service Connect.
  ///
  /// If you update the cluster with an empty string <code>""</code> for the
  /// namespace name, the cluster configuration for Service Connect is removed.
  /// Note that the namespace will remain in Cloud Map and must be deleted
  /// separately.
  ///
  /// For more information about Cloud Map, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/working-with-services.html">Working
  /// with Services</a> in the <i>Cloud Map Developer Guide</i>.
  final String namespace;

  ClusterServiceConnectDefaultsRequest({
    required this.namespace,
  });

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

/// The settings to use when creating a cluster. This parameter is used to turn
/// on CloudWatch Container Insights for a cluster.
class ClusterSetting {
  /// The name of the cluster setting. The value is <code>containerInsights</code>
  /// .
  final ClusterSettingName? name;

  /// The value to set for the cluster setting. The supported values are
  /// <code>enabled</code> and <code>disabled</code>.
  ///
  /// If you set <code>name</code> to <code>containerInsights</code> and
  /// <code>value</code> to <code>enabled</code>, CloudWatch Container Insights
  /// will be on for the cluster, otherwise it will be off unless the
  /// <code>containerInsights</code> account setting is turned on. If a cluster
  /// value is specified, it will override the <code>containerInsights</code>
  /// value set with <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSetting.html">PutAccountSetting</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutAccountSettingDefault.html">PutAccountSettingDefault</a>.
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

extension ClusterSettingNameValueExtension on ClusterSettingName {
  String toValue() {
    switch (this) {
      case ClusterSettingName.containerInsights:
        return 'containerInsights';
    }
  }
}

extension ClusterSettingNameFromString on String {
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

extension CompatibilityValueExtension on Compatibility {
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

extension CompatibilityFromString on String {
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

extension ConnectivityValueExtension on Connectivity {
  String toValue() {
    switch (this) {
      case Connectivity.connected:
        return 'CONNECTED';
      case Connectivity.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension ConnectivityFromString on String {
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

/// A Docker container that's part of a task.
class Container {
  /// The Amazon Resource Name (ARN) of the container.
  final String? containerArn;

  /// The number of CPU units set for the container. The value is <code>0</code>
  /// if no value was specified in the container definition when the task
  /// definition was registered.
  final String? cpu;

  /// The exit code returned from the container.
  final int? exitCode;

  /// The IDs of each GPU assigned to the container.
  final List<String>? gpuIds;

  /// The health status of the container. If health checks aren't configured for
  /// this container in its task definition, then it reports the health status as
  /// <code>UNKNOWN</code>.
  final HealthStatus? healthStatus;

  /// The image used for the container.
  final String? image;

  /// The container image manifest digest.
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

extension ContainerConditionValueExtension on ContainerCondition {
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

extension ContainerConditionFromString on String {
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
  /// The command that's passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">https://docs.docker.com/engine/reference/builder/#cmd</a>.
  /// If there are multiple arguments, each argument is a separated string in the
  /// array.
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
  /// with 512 CPU units specified for that container, and that's the only task
  /// running on the container instance, that container could use the full 1,024
  /// CPU unit share at any given time. However, if you launched another copy of
  /// the same task on that container instance, each task is guaranteed a minimum
  /// of 512 CPU units when needed. Moreover, each container could float to higher
  /// CPU usage if the other container was not using it. If both tasks were 100%
  /// active all of the time, they would be limited to 512 CPU units.
  ///
  /// On Linux container instances, the Docker daemon on the container instance
  /// uses the CPU value to calculate the relative CPU share ratios for running
  /// containers. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#cpu-share-constraint">CPU
  /// share constraint</a> in the Docker documentation. The minimum valid CPU
  /// share value that the Linux kernel allows is 2. However, the CPU parameter
  /// isn't required, and you can use CPU values below 2 in your container
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
  /// amount of CPU that's described in the task definition. A null or zero CPU
  /// value is passed to Docker as <code>0</code>, which Windows interprets as 1%
  /// of one CPU.
  final int? cpu;

  /// A list of ARNs in SSM or Amazon S3 to a credential spec
  /// (<code>CredSpec</code>) file that configures the container for Active
  /// Directory authentication. We recommend that you use this parameter instead
  /// of the <code>dockerSecurityOptions</code>. The maximum number of ARNs is 1.
  ///
  /// There are two formats for each ARN.
  /// <dl> <dt>credentialspecdomainless:MyARN</dt> <dd>
  /// You use <code>credentialspecdomainless:MyARN</code> to provide a
  /// <code>CredSpec</code> with an additional section for a secret in Secrets
  /// Manager. You provide the login credentials to the domain in the secret.
  ///
  /// Each task that runs on any container instance can join different domains.
  ///
  /// You can use this format without joining the container instance to a domain.
  /// </dd> <dt>credentialspec:MyARN</dt> <dd>
  /// You use <code>credentialspec:MyARN</code> to provide a <code>CredSpec</code>
  /// for a single domain.
  ///
  /// You must join the container instance to the domain before you start any
  /// tasks that use this task definition.
  /// </dd> </dl>
  /// In both formats, replace <code>MyARN</code> with the ARN in SSM or Amazon
  /// S3.
  ///
  /// If you provide a <code>credentialspecdomainless:MyARN</code>, the
  /// <code>credspec</code> must provide a ARN in Secrets Manager for a secret
  /// containing the username, password, and the domain to connect to. For better
  /// security, the instance isn't joined to the domain for domainless
  /// authentication. Other applications on the instance can't use the domainless
  /// credentials. You can use this parameter to run tasks on the same instance,
  /// even it the tasks need to join different domains. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows-gmsa.html">Using
  /// gMSAs for Windows Containers</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/linux-gmsa.html">Using
  /// gMSAs for Linux Containers</a>.
  final List<String>? credentialSpecs;

  /// The dependencies defined for container startup and shutdown. A container can
  /// contain multiple dependencies on other containers in a task definition. When
  /// a dependency is defined for container startup, for container shutdown it is
  /// reversed.
  ///
  /// For tasks using the EC2 launch type, the container instances require at
  /// least version 1.26.0 of the container agent to turn on container
  /// dependencies. However, we recommend using the latest container agent
  /// version. For information about checking your agent version and updating to
  /// the latest version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you're using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version 1.26.0-1 of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// For tasks using the Fargate launch type, the task or service requires the
  /// following platforms:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.3.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul>
  final List<ContainerDependency>? dependsOn;

  /// When this parameter is true, networking is off within the container. This
  /// parameter maps to <code>NetworkDisabled</code> in the <a
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

  /// A list of strings to provide custom configuration for multiple security
  /// systems. For more information about valid values, see <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">Docker
  /// Run Security Configuration</a>. This field isn't valid for containers in
  /// tasks using the Fargate launch type.
  ///
  /// For Linux tasks on EC2, this parameter can be used to reference custom
  /// labels for SELinux and AppArmor multi-level security systems.
  ///
  /// For any tasks on EC2, this parameter can be used to reference a credential
  /// spec file that configures a container for Active Directory authentication.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/windows-gmsa.html">Using
  /// gMSAs for Windows Containers</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/linux-gmsa.html">Using
  /// gMSAs for Linux Containers</a> in the <i>Amazon Elastic Container Service
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
  /// Early versions of the Amazon ECS container agent don't properly handle
  /// <code>entryPoint</code> parameters. If you have problems using
  /// <code>entryPoint</code>, update your container agent or enter your commands
  /// and arguments as <code>command</code> array items instead.
  /// </important>
  /// The entry point that's passed to the container. This parameter maps to
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
  /// We don't recommend that you use plaintext environment variables for
  /// sensitive information, such as credential data.
  /// </important>
  final List<KeyValuePair>? environment;

  /// A list of files containing the environment variables to pass to a container.
  /// This parameter maps to the <code>--env-file</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// You can specify up to ten environment files. The file must have a
  /// <code>.env</code> file extension. Each line in an environment file contains
  /// an environment variable in <code>VARIABLE=VALUE</code> format. Lines
  /// beginning with <code>#</code> are treated as comments and are ignored. For
  /// more information about the environment variable file syntax, see <a
  /// href="https://docs.docker.com/compose/env-file/">Declare default environment
  /// variables in file</a>.
  ///
  /// If there are environment variables specified using the
  /// <code>environment</code> parameter in a container definition, they take
  /// precedence over the variables contained within an environment file. If
  /// multiple environment files are specified that contain the same variable,
  /// they're processed from the top down. We recommend that you use unique
  /// variable names. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/taskdef-envfiles.html">Specifying
  /// Environment Variables</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final List<EnvironmentFile>? environmentFiles;

  /// If the <code>essential</code> parameter of a container is marked as
  /// <code>true</code>, and that container fails or stops for any reason, all
  /// other containers that are part of the task are stopped. If the
  /// <code>essential</code> parameter of a container is marked as
  /// <code>false</code>, its failure doesn't affect the rest of the containers in
  /// a task. If this parameter is omitted, a container is assumed to be
  /// essential.
  ///
  /// All tasks must have at least one essential container. If you have an
  /// application that's composed of multiple containers, group containers that
  /// are used for a common purpose into components, and separate the different
  /// components into multiple task definitions. For more information, see <a
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
  /// This parameter isn't supported for Windows containers or tasks that use the
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
  /// The <code>hostname</code> parameter is not supported if you're using the
  /// <code>awsvpc</code> network mode.
  /// </note>
  final String? hostname;

  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. By default, images in the Docker Hub registry are available.
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
  /// subsequent updates to a repository image aren't propagated to already
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

  /// When this parameter is <code>true</code>, you can deploy containerized
  /// applications that require <code>stdin</code> or a <code>tty</code> to be
  /// allocated. This parameter maps to <code>OpenStdin</code> in the <a
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
  /// daemon uses. However the container can use a different logging driver than
  /// the Docker daemon by specifying a log driver with this parameter in the
  /// container definition. To use a different logging driver for a container, the
  /// log system must be configured properly on the container instance (or on a
  /// different log server for remote logging options). For more information about
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
  /// available memory resources for the container instance where the container is
  /// placed. Otherwise, the value of <code>memory</code> is used.
  ///
  /// The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of memory for
  /// a container. So, don't specify less than 6 MiB of memory for your
  /// containers.
  ///
  /// The Docker 19.03.13-ce or earlier daemon reserves a minimum of 4 MiB of
  /// memory for a container. So, don't specify less than 4 MiB of memory for your
  /// containers.
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
  /// available memory resources for the container instance where the container is
  /// placed. Otherwise, the value of <code>memory</code> is used.
  ///
  /// For example, if your container normally uses 128 MiB of memory, but
  /// occasionally bursts to 256 MiB of memory for short periods of time, you can
  /// set a <code>memoryReservation</code> of 128 MiB, and a <code>memory</code>
  /// hard limit of 300 MiB. This configuration would allow the container to only
  /// reserve 128 MiB of memory from the remaining resources on the container
  /// instance, but also allow the container to consume more memory resources when
  /// needed.
  ///
  /// The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of memory for
  /// a container. So, don't specify less than 6 MiB of memory for your
  /// containers.
  ///
  /// The Docker 19.03.13-ce or earlier daemon reserves a minimum of 4 MiB of
  /// memory for a container. So, don't specify less than 4 MiB of memory for your
  /// containers.
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
  /// <code>$env:ProgramData</code>. Windows containers can't mount directories on
  /// a different drive, and mount point can't be across drives.
  final List<MountPoint>? mountPoints;

  /// The name of a container. If you're linking multiple containers together in a
  /// task definition, the <code>name</code> of one container can be entered in
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
  /// For task definitions that use the <code>awsvpc</code> network mode, only
  /// specify the <code>containerPort</code>. The <code>hostPort</code> can be
  /// left blank or it must be the same value as the <code>containerPort</code>.
  ///
  /// Port mappings on Windows use the <code>NetNAT</code> gateway address rather
  /// than <code>localhost</code>. There's no loopback for port mappings on
  /// Windows, so you can't access a container's mapped port from the host itself.
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
  /// This parameter is not supported for Windows containers or tasks run on
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
  /// If a <code>startTimeout</code> value is specified for containerB and it
  /// doesn't reach the desired status within that time then containerA gives up
  /// and not start. This results in the task transitioning to a
  /// <code>STOPPED</code> state.
  /// <note>
  /// When the <code>ECS_CONTAINER_START_TIMEOUT</code> container agent
  /// configuration variable is used, it's enforced independently from this start
  /// timeout value.
  /// </note>
  /// For tasks using the Fargate launch type, the task or service requires the
  /// following platforms:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.3.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul>
  /// For tasks using the EC2 launch type, your container instances require at
  /// least version <code>1.26.0</code> of the container agent to use a container
  /// start timeout value. However, we recommend using the latest container agent
  /// version. For information about checking your agent version and updating to
  /// the latest version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you're using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version <code>1.26.0-1</code> of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// The valid values are 2-120 seconds.
  final int? startTimeout;

  /// Time duration (in seconds) to wait before the container is forcefully killed
  /// if it doesn't exit normally on its own.
  ///
  /// For tasks using the Fargate launch type, the task or service requires the
  /// following platforms:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.3.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul>
  /// The max stop timeout value is 120 seconds and if the parameter is not
  /// specified, the default value of 30 seconds is used.
  ///
  /// For tasks that use the EC2 launch type, if the <code>stopTimeout</code>
  /// parameter isn't specified, the value set for the Amazon ECS container agent
  /// configuration variable <code>ECS_CONTAINER_STOP_TIMEOUT</code> is used. If
  /// neither the <code>stopTimeout</code> parameter or the
  /// <code>ECS_CONTAINER_STOP_TIMEOUT</code> agent configuration variable are
  /// set, then the default values of 30 seconds for Linux containers and 30
  /// seconds on Windows containers are used. Your container instances require at
  /// least version 1.26.0 of the container agent to use a container stop timeout
  /// value. However, we recommend using the latest container agent version. For
  /// information about checking your agent version and updating to the latest
  /// version, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
  /// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>. If you're using an Amazon ECS-optimized Linux
  /// AMI, your instance needs at least version 1.26.0-1 of the
  /// <code>ecs-init</code> package. If your container instances are launched from
  /// version <code>20190301</code> or later, then they contain the required
  /// versions of the container agent and <code>ecs-init</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  ///
  /// The valid values are 2-120 seconds.
  final int? stopTimeout;

  /// A list of namespaced kernel parameters to set in the container. This
  /// parameter maps to <code>Sysctls</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--sysctl</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>. For example, you can configure
  /// <code>net.ipv4.tcp_keepalive_time</code> setting to maintain longer lived
  /// connections.
  final List<SystemControl>? systemControls;

  /// A list of <code>ulimits</code> to set in the container. If a
  /// <code>ulimit</code> value is specified in a task definition, it overrides
  /// the default values set by Docker. This parameter maps to
  /// <code>Ulimits</code> in the <a
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
  /// <code>1024</code> and the default hard limit is <code>65535</code>.
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
  /// When running tasks using the <code>host</code> network mode, don't run
  /// containers using the root user (UID 0). We recommend using a non-root user
  /// for better security.
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

  /// The working directory to run commands inside the container in. This
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
    this.credentialSpecs,
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
      credentialSpecs: (json['credentialSpecs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final credentialSpecs = this.credentialSpecs;
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
      if (credentialSpecs != null) 'credentialSpecs': credentialSpecs,
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
/// container agent to use container dependencies. However, we recommend using
/// the latest container agent version. For information about checking your
/// agent version and updating to the latest version, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
/// the Amazon ECS Container Agent</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>. If you're using an Amazon ECS-optimized Linux
/// AMI, your instance needs at least version 1.26.0-1 of the
/// <code>ecs-init</code> package. If your container instances are launched from
/// version <code>20190301</code> or later, then they contain the required
/// versions of the container agent and <code>ecs-init</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
/// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// For tasks that use the Fargate launch type, the task or service requires the
/// following platforms:
///
/// <ul>
/// <li>
/// Linux platform version <code>1.3.0</code> or later.
/// </li>
/// <li>
/// Windows platform version <code>1.0.0</code> or later.
/// </li>
/// </ul> </note>
/// For more information about how to create a container dependency, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/example_task_definitions.html#example_task_definition-containerdependency">Container
/// dependency</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
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
  /// This condition can't be set on an essential container.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> - This condition is the same as <code>COMPLETE</code>,
  /// but it also requires that the container exits with a <code>zero</code>
  /// status. This condition can't be set on an essential container.
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

/// An Amazon EC2 or External instance that's running the Amazon ECS agent and
/// has been registered with a cluster.
class ContainerInstance {
  /// This parameter returns <code>true</code> if the agent is connected to Amazon
  /// ECS. An instance with an agent that may be unhealthy or stopped return
  /// <code>false</code>. Only instances connected to an agent can accept task
  /// placement requests.
  final bool? agentConnected;

  /// The status of the most recent agent update. If an update wasn't ever
  /// requested, this value is <code>NULL</code>.
  final AgentUpdateStatus? agentUpdateStatus;

  /// The resources attached to a container instance, such as an elastic network
  /// interface.
  final List<Attachment>? attachments;

  /// The attributes set for the container instance, either by the Amazon ECS
  /// container agent at instance registration or manually with the
  /// <a>PutAttributes</a> operation.
  final List<Attribute>? attributes;

  /// The capacity provider that's associated with the container instance.
  final String? capacityProviderName;

  /// The Amazon Resource Name (ARN) of the container instance. For more
  /// information about the ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids">Amazon
  /// Resource Name (ARN)</a> in the <i>Amazon ECS Developer Guide</i>.
  final String? containerInstanceArn;

  /// The ID of the container instance. For Amazon EC2 instances, this value is
  /// the Amazon EC2 instance ID. For external instances, this value is the Amazon
  /// Web Services Systems Manager managed instance ID.
  final String? ec2InstanceId;

  /// An object representing the health status of the container instance.
  final ContainerInstanceHealthStatus? healthStatus;

  /// The number of tasks on the container instance that are in the
  /// <code>PENDING</code> status.
  final int? pendingTasksCount;

  /// The Unix timestamp for the time when the container instance was registered.
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
  /// CPU and memory that wasn't already allocated to tasks and is therefore
  /// available for new tasks. For port resource types, this parameter describes
  /// the ports that were reserved by the Amazon ECS container agent (at instance
  /// registration time) and any task containers that have reserved port mappings
  /// on the host (with the <code>host</code> or <code>bridge</code> network
  /// mode). Any port that's not specified here is available for new tasks.
  final List<Resource>? remainingResources;

  /// The number of tasks on the container instance that have a desired status
  /// (<code>desiredStatus</code>) of <code>RUNNING</code>.
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
  /// accept tasks. The <code>DRAINING</code> indicates that new tasks aren't
  /// placed on the container instance and any service tasks running on the
  /// container instance are removed if possible. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-draining.html">Container
  /// instance draining</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? status;

  /// The reason that the container instance reached its current status.
  final String? statusReason;

  /// The metadata that you apply to the container instance to help you categorize
  /// and organize them. Each tag consists of a key and an optional value. You
  /// define both.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The version counter for the container instance. Every time a container
  /// instance experiences a change that triggers a CloudWatch event, the version
  /// counter is incremented. If you're replicating your Amazon ECS container
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
    this.healthStatus,
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
      healthStatus: json['healthStatus'] != null
          ? ContainerInstanceHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
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
    final healthStatus = this.healthStatus;
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
      if (healthStatus != null) 'healthStatus': healthStatus,
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
  containerInstanceHealth,
}

extension ContainerInstanceFieldValueExtension on ContainerInstanceField {
  String toValue() {
    switch (this) {
      case ContainerInstanceField.tags:
        return 'TAGS';
      case ContainerInstanceField.containerInstanceHealth:
        return 'CONTAINER_INSTANCE_HEALTH';
    }
  }
}

extension ContainerInstanceFieldFromString on String {
  ContainerInstanceField toContainerInstanceField() {
    switch (this) {
      case 'TAGS':
        return ContainerInstanceField.tags;
      case 'CONTAINER_INSTANCE_HEALTH':
        return ContainerInstanceField.containerInstanceHealth;
    }
    throw Exception('$this is not known in enum ContainerInstanceField');
  }
}

/// An object representing the health status of the container instance.
class ContainerInstanceHealthStatus {
  /// An array of objects representing the details of the container instance
  /// health status.
  final List<InstanceHealthCheckResult>? details;

  /// The overall health status of the container instance. This is an aggregate
  /// status of all container instance health checks.
  final InstanceHealthCheckState? overallStatus;

  ContainerInstanceHealthStatus({
    this.details,
    this.overallStatus,
  });

  factory ContainerInstanceHealthStatus.fromJson(Map<String, dynamic> json) {
    return ContainerInstanceHealthStatus(
      details: (json['details'] as List?)
          ?.whereNotNull()
          .map((e) =>
              InstanceHealthCheckResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallStatus:
          (json['overallStatus'] as String?)?.toInstanceHealthCheckState(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final overallStatus = this.overallStatus;
    return {
      if (details != null) 'details': details,
      if (overallStatus != null) 'overallStatus': overallStatus.toValue(),
    };
  }
}

enum ContainerInstanceStatus {
  active,
  draining,
  registering,
  deregistering,
  registrationFailed,
}

extension ContainerInstanceStatusValueExtension on ContainerInstanceStatus {
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

extension ContainerInstanceStatusFromString on String {
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

/// The overrides that are sent to a container. An empty container override can
/// be passed in. An example of an empty container override is
/// <code>{"containerOverrides": [ ] }</code>. If a non-empty container override
/// is specified, the <code>name</code> parameter must be included.
///
/// You can use Secrets Manager or Amazon Web Services Systems Manager Parameter
/// Store to store the sensitive data. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar.html">Retrieve
/// secrets through environment variables</a> in the Amazon ECS Developer Guide.
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

/// An object that represents a change in state for a container.
class ContainerStateChange {
  /// The name of the container.
  final String? containerName;

  /// The exit code for the container, if the state change is a result of the
  /// container exiting.
  final int? exitCode;

  /// The container image SHA 256 digest.
  final String? imageDigest;

  /// Any network bindings that are associated with the container.
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
  /// A service will return either a <code>capacityProviderStrategy</code> or
  /// <code>launchType</code> parameter, but not both, depending where one was
  /// specified when it was created.
  ///
  /// If a service is using the <code>ECS</code> deployment controller, the
  /// <code>deploymentController</code> and <code>taskSets</code> parameters will
  /// not be returned.
  ///
  /// if the service uses the <code>CODE_DEPLOY</code> deployment controller, the
  /// <code>deploymentController</code>, <code>taskSets</code> and
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
  /// Information about a set of Amazon ECS tasks in either an CodeDeploy or an
  /// <code>EXTERNAL</code> deployment. A task set includes details such as the
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

class DeleteTaskDefinitionsResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// The list of deleted task definitions.
  final List<TaskDefinition>? taskDefinitions;

  DeleteTaskDefinitionsResponse({
    this.failures,
    this.taskDefinitions,
  });

  factory DeleteTaskDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTaskDefinitionsResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDefinitions: (json['taskDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => TaskDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final taskDefinitions = this.taskDefinitions;
    return {
      if (failures != null) 'failures': failures,
      if (taskDefinitions != null) 'taskDefinitions': taskDefinitions,
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

  /// The Unix timestamp for the time when the service deployment was created.
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

  /// The operating system that your tasks in the service, or tasks are running
  /// on. A platform family is specified only for tasks using the Fargate launch
  /// type.
  ///
  /// All tasks that run as part of this service must use the same
  /// <code>platformFamily</code> value as the service, for example, <code>
  /// LINUX.</code>.
  final String? platformFamily;

  /// The platform version that your tasks in the service run on. A platform
  /// version is only specified for tasks using the Fargate launch type. If one
  /// isn't specified, the <code>LATEST</code> platform version is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// <note>
  /// The <code>rolloutState</code> of a service is only returned for services
  /// that use the rolling update (<code>ECS</code>) deployment type that aren't
  /// behind a Classic Load Balancer.
  /// </note>
  /// The rollout state of the deployment. When a service deployment is started,
  /// it begins in an <code>IN_PROGRESS</code> state. When the service reaches a
  /// steady state, the deployment transitions to a <code>COMPLETED</code> state.
  /// If the service fails to reach a steady state and circuit breaker is turned
  /// on, the deployment transitions to a <code>FAILED</code> state. A deployment
  /// in <code>FAILED</code> state doesn't launch any new tasks. For more
  /// information, see <a>DeploymentCircuitBreaker</a>.
  final DeploymentRolloutState? rolloutState;

  /// A description of the rollout state of a deployment.
  final String? rolloutStateReason;

  /// The number of tasks in the deployment that are in the <code>RUNNING</code>
  /// status.
  final int? runningCount;

  /// The details of the Service Connect configuration that's used by this
  /// deployment. Compare the configuration between multiple deployments when
  /// troubleshooting issues with new deployments.
  ///
  /// The configuration for this service to discover and connect to services, and
  /// be discovered by, and connected from, other services within a namespace.
  ///
  /// Tasks that run in a namespace can use short names to connect to services in
  /// the namespace. Tasks can connect to services across all of the clusters in
  /// the namespace. Tasks connect through a managed proxy container that collects
  /// logs and metrics for increased visibility. Only the tasks that Amazon ECS
  /// services create are supported with Service Connect. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final ServiceConnectConfiguration? serviceConnectConfiguration;

  /// The list of Service Connect resources that are associated with this
  /// deployment. Each list entry maps a discovery name to a Cloud Map service
  /// name.
  final List<ServiceConnectServiceResource>? serviceConnectResources;

  /// The status of the deployment. The following describes each state.
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

  /// The Unix timestamp for the time when the service deployment was last
  /// updated.
  final DateTime? updatedAt;

  /// The details of the volume that was <code>configuredAtLaunch</code>. You can
  /// configure different settings like the size, throughput, volumeType, and
  /// ecryption in <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ServiceManagedEBSVolumeConfiguration.html">ServiceManagedEBSVolumeConfiguration</a>.
  /// The <code>name</code> of the volume must match the <code>name</code> from
  /// the task definition.
  final List<ServiceVolumeConfiguration>? volumeConfigurations;

  Deployment({
    this.capacityProviderStrategy,
    this.createdAt,
    this.desiredCount,
    this.failedTasks,
    this.id,
    this.launchType,
    this.networkConfiguration,
    this.pendingCount,
    this.platformFamily,
    this.platformVersion,
    this.rolloutState,
    this.rolloutStateReason,
    this.runningCount,
    this.serviceConnectConfiguration,
    this.serviceConnectResources,
    this.status,
    this.taskDefinition,
    this.updatedAt,
    this.volumeConfigurations,
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
      platformFamily: json['platformFamily'] as String?,
      platformVersion: json['platformVersion'] as String?,
      rolloutState:
          (json['rolloutState'] as String?)?.toDeploymentRolloutState(),
      rolloutStateReason: json['rolloutStateReason'] as String?,
      runningCount: json['runningCount'] as int?,
      serviceConnectConfiguration: json['serviceConnectConfiguration'] != null
          ? ServiceConnectConfiguration.fromJson(
              json['serviceConnectConfiguration'] as Map<String, dynamic>)
          : null,
      serviceConnectResources: (json['serviceConnectResources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServiceConnectServiceResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      taskDefinition: json['taskDefinition'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      volumeConfigurations: (json['volumeConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServiceVolumeConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final platformFamily = this.platformFamily;
    final platformVersion = this.platformVersion;
    final rolloutState = this.rolloutState;
    final rolloutStateReason = this.rolloutStateReason;
    final runningCount = this.runningCount;
    final serviceConnectConfiguration = this.serviceConnectConfiguration;
    final serviceConnectResources = this.serviceConnectResources;
    final status = this.status;
    final taskDefinition = this.taskDefinition;
    final updatedAt = this.updatedAt;
    final volumeConfigurations = this.volumeConfigurations;
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
      if (platformFamily != null) 'platformFamily': platformFamily,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (rolloutState != null) 'rolloutState': rolloutState.toValue(),
      if (rolloutStateReason != null) 'rolloutStateReason': rolloutStateReason,
      if (runningCount != null) 'runningCount': runningCount,
      if (serviceConnectConfiguration != null)
        'serviceConnectConfiguration': serviceConnectConfiguration,
      if (serviceConnectResources != null)
        'serviceConnectResources': serviceConnectResources,
      if (status != null) 'status': status,
      if (taskDefinition != null) 'taskDefinition': taskDefinition,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (volumeConfigurations != null)
        'volumeConfigurations': volumeConfigurations,
    };
  }
}

/// One of the methods which provide a way for you to quickly identify when a
/// deployment has failed, and then to optionally roll back the failure to the
/// last working deployment.
///
/// When the alarms are generated, Amazon ECS sets the service deployment to
/// failed. Set the rollback parameter to have Amazon ECS to roll back your
/// service to the last completed deployment after a failure.
///
/// You can only use the <code>DeploymentAlarms</code> method to detect failures
/// when the <code>DeploymentController</code> is set to <code>ECS</code>
/// (rolling update).
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html">Rolling
/// update</a> in the <i> <i>Amazon Elastic Container Service Developer
/// Guide</i> </i>.
class DeploymentAlarms {
  /// One or more CloudWatch alarm names. Use a "," to separate the alarms.
  final List<String> alarmNames;

  /// Determines whether to use the CloudWatch alarm option in the service
  /// deployment process.
  final bool enable;

  /// Determines whether to configure Amazon ECS to roll back the service if a
  /// service deployment fails. If rollback is used, when a service deployment
  /// fails, the service is rolled back to the last deployment that completed
  /// successfully.
  final bool rollback;

  DeploymentAlarms({
    required this.alarmNames,
    required this.enable,
    required this.rollback,
  });

  factory DeploymentAlarms.fromJson(Map<String, dynamic> json) {
    return DeploymentAlarms(
      alarmNames: (json['alarmNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      enable: json['enable'] as bool,
      rollback: json['rollback'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmNames = this.alarmNames;
    final enable = this.enable;
    final rollback = this.rollback;
    return {
      'alarmNames': alarmNames,
      'enable': enable,
      'rollback': rollback,
    };
  }
}

/// <note>
/// The deployment circuit breaker can only be used for services using the
/// rolling update (<code>ECS</code>) deployment type.
/// </note>
/// The <b>deployment circuit breaker</b> determines whether a service
/// deployment will fail if the service can't reach a steady state. If it is
/// turned on, a service deployment will transition to a failed state and stop
/// launching new tasks. You can also configure Amazon ECS to roll back your
/// service to the last completed deployment after a failure. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html">Rolling
/// update</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
///
/// For more information about API failure reasons, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html">API
/// failure reasons</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class DeploymentCircuitBreaker {
  /// Determines whether to use the deployment circuit breaker logic for the
  /// service.
  final bool enable;

  /// Determines whether to configure Amazon ECS to roll back the service if a
  /// service deployment fails. If rollback is on, when a service deployment
  /// fails, the service is rolled back to the last deployment that completed
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
  /// Information about the CloudWatch alarms.
  final DeploymentAlarms? alarms;

  /// <note>
  /// The deployment circuit breaker can only be used for services using the
  /// rolling update (<code>ECS</code>) deployment type.
  /// </note>
  /// The <b>deployment circuit breaker</b> determines whether a service
  /// deployment will fail if the service can't reach a steady state. If you use
  /// the deployment circuit breaker, a service deployment will transition to a
  /// failed state and stop launching new tasks. If you use the rollback option,
  /// when a service deployment fails, the service is rolled back to the last
  /// deployment that completed successfully. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html">Rolling
  /// update</a> in the <i>Amazon Elastic Container Service Developer Guide</i>
  final DeploymentCircuitBreaker? deploymentCircuitBreaker;

  /// If a service is using the rolling update (<code>ECS</code>) deployment type,
  /// the <code>maximumPercent</code> parameter represents an upper limit on the
  /// number of your service's tasks that are allowed in the <code>RUNNING</code>
  /// or <code>PENDING</code> state during a deployment, as a percentage of the
  /// <code>desiredCount</code> (rounded down to the nearest integer). This
  /// parameter enables you to define the deployment batch size. For example, if
  /// your service is using the <code>REPLICA</code> service scheduler and has a
  /// <code>desiredCount</code> of four tasks and a <code>maximumPercent</code>
  /// value of 200%, the scheduler may start four new tasks before stopping the
  /// four older tasks (provided that the cluster resources required to do this
  /// are available). The default <code>maximumPercent</code> value for a service
  /// using the <code>REPLICA</code> service scheduler is 200%.
  ///
  /// If a service is using either the blue/green (<code>CODE_DEPLOY</code>) or
  /// <code>EXTERNAL</code> deployment types and tasks that use the EC2 launch
  /// type, the <b>maximum percent</b> value is set to the default value and is
  /// used to define the upper limit on the number of the tasks in the service
  /// that remain in the <code>RUNNING</code> state while the container instances
  /// are in the <code>DRAINING</code> state. If the tasks in the service use the
  /// Fargate launch type, the maximum percent value is not used, although it is
  /// returned when describing your service.
  final int? maximumPercent;

  /// If a service is using the rolling update (<code>ECS</code>) deployment type,
  /// the <code>minimumHealthyPercent</code> represents a lower limit on the
  /// number of your service's tasks that must remain in the <code>RUNNING</code>
  /// state during a deployment, as a percentage of the <code>desiredCount</code>
  /// (rounded up to the nearest integer). This parameter enables you to deploy
  /// without using additional cluster capacity. For example, if your service has
  /// a <code>desiredCount</code> of four tasks and a
  /// <code>minimumHealthyPercent</code> of 50%, the service scheduler may stop
  /// two existing tasks to free up cluster capacity before starting two new
  /// tasks.
  ///
  /// For services that <i>do not</i> use a load balancer, the following should be
  /// noted:
  ///
  /// <ul>
  /// <li>
  /// A service is considered healthy if all essential containers within the tasks
  /// in the service pass their health checks.
  /// </li>
  /// <li>
  /// If a task has no essential containers with a health check defined, the
  /// service scheduler will wait for 40 seconds after a task reaches a
  /// <code>RUNNING</code> state before the task is counted towards the minimum
  /// healthy percent total.
  /// </li>
  /// <li>
  /// If a task has one or more essential containers with a health check defined,
  /// the service scheduler will wait for the task to reach a healthy status
  /// before counting it towards the minimum healthy percent total. A task is
  /// considered healthy when all essential containers within the task have passed
  /// their health checks. The amount of time the service scheduler can wait for
  /// is determined by the container health check settings.
  /// </li>
  /// </ul>
  /// For services that <i>do</i> use a load balancer, the following should be
  /// noted:
  ///
  /// <ul>
  /// <li>
  /// If a task has no essential containers with a health check defined, the
  /// service scheduler will wait for the load balancer target group health check
  /// to return a healthy status before counting the task towards the minimum
  /// healthy percent total.
  /// </li>
  /// <li>
  /// If a task has an essential container with a health check defined, the
  /// service scheduler will wait for both the task to reach a healthy status and
  /// the load balancer target group health check to return a healthy status
  /// before counting the task towards the minimum healthy percent total.
  /// </li>
  /// </ul>
  /// The default value for a replica service for
  /// <code>minimumHealthyPercent</code> is 100%. The default
  /// <code>minimumHealthyPercent</code> value for a service using the
  /// <code>DAEMON</code> service schedule is 0% for the CLI, the Amazon Web
  /// Services SDKs, and the APIs and 50% for the Amazon Web Services Management
  /// Console.
  ///
  /// The minimum number of healthy tasks during a deployment is the
  /// <code>desiredCount</code> multiplied by the
  /// <code>minimumHealthyPercent</code>/100, rounded up to the nearest integer
  /// value.
  ///
  /// If a service is using either the blue/green (<code>CODE_DEPLOY</code>) or
  /// <code>EXTERNAL</code> deployment types and is running tasks that use the EC2
  /// launch type, the <b>minimum healthy percent</b> value is set to the default
  /// value and is used to define the lower limit on the number of the tasks in
  /// the service that remain in the <code>RUNNING</code> state while the
  /// container instances are in the <code>DRAINING</code> state. If a service is
  /// using either the blue/green (<code>CODE_DEPLOY</code>) or
  /// <code>EXTERNAL</code> deployment types and is running tasks that use the
  /// Fargate launch type, the minimum healthy percent value is not used, although
  /// it is returned when describing your service.
  final int? minimumHealthyPercent;

  DeploymentConfiguration({
    this.alarms,
    this.deploymentCircuitBreaker,
    this.maximumPercent,
    this.minimumHealthyPercent,
  });

  factory DeploymentConfiguration.fromJson(Map<String, dynamic> json) {
    return DeploymentConfiguration(
      alarms: json['alarms'] != null
          ? DeploymentAlarms.fromJson(json['alarms'] as Map<String, dynamic>)
          : null,
      deploymentCircuitBreaker: json['deploymentCircuitBreaker'] != null
          ? DeploymentCircuitBreaker.fromJson(
              json['deploymentCircuitBreaker'] as Map<String, dynamic>)
          : null,
      maximumPercent: json['maximumPercent'] as int?,
      minimumHealthyPercent: json['minimumHealthyPercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarms = this.alarms;
    final deploymentCircuitBreaker = this.deploymentCircuitBreaker;
    final maximumPercent = this.maximumPercent;
    final minimumHealthyPercent = this.minimumHealthyPercent;
    return {
      if (alarms != null) 'alarms': alarms,
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
/// ECS deployment types</a> in the <i>Amazon Elastic Container Service
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
  /// blue/green deployment model powered by CodeDeploy, which allows you to
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

extension DeploymentControllerTypeValueExtension on DeploymentControllerType {
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

extension DeploymentControllerTypeFromString on String {
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

extension DeploymentRolloutStateValueExtension on DeploymentRolloutState {
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

extension DeploymentRolloutStateFromString on String {
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
  /// The metadata that's applied to the task definition to help you categorize
  /// and organize them. Each tag consists of a key and an optional value. You
  /// define both.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
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

extension DesiredStatusValueExtension on DesiredStatus {
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

extension DesiredStatusFromString on String {
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

extension DeviceCgroupPermissionValueExtension on DeviceCgroupPermission {
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

extension DeviceCgroupPermissionFromString on String {
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

  /// The endpoint for the Amazon ECS agent to poll for Service Connect
  /// configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final String? serviceConnectEndpoint;

  /// The telemetry endpoint for the Amazon ECS agent.
  final String? telemetryEndpoint;

  DiscoverPollEndpointResponse({
    this.endpoint,
    this.serviceConnectEndpoint,
    this.telemetryEndpoint,
  });

  factory DiscoverPollEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DiscoverPollEndpointResponse(
      endpoint: json['endpoint'] as String?,
      serviceConnectEndpoint: json['serviceConnectEndpoint'] as String?,
      telemetryEndpoint: json['telemetryEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final serviceConnectEndpoint = this.serviceConnectEndpoint;
    final telemetryEndpoint = this.telemetryEndpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (serviceConnectEndpoint != null)
        'serviceConnectEndpoint': serviceConnectEndpoint,
      if (telemetryEndpoint != null) 'telemetryEndpoint': telemetryEndpoint,
    };
  }
}

/// This parameter is specified when you're using Docker volumes. Docker volumes
/// are only supported when you're using the EC2 launch type. Windows containers
/// only support the use of the <code>local</code> driver. To use bind mounts,
/// specify a <code>host</code> instead.
class DockerVolumeConfiguration {
  /// If this value is <code>true</code>, the Docker volume is created if it
  /// doesn't already exist.
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

enum EBSResourceType {
  volume,
}

extension EBSResourceTypeValueExtension on EBSResourceType {
  String toValue() {
    switch (this) {
      case EBSResourceType.volume:
        return 'volume';
    }
  }
}

extension EBSResourceTypeFromString on String {
  EBSResourceType toEBSResourceType() {
    switch (this) {
      case 'volume':
        return EBSResourceType.volume;
    }
    throw Exception('$this is not known in enum EBSResourceType');
  }
}

/// The tag specifications of an Amazon EBS volume.
class EBSTagSpecification {
  /// The type of volume resource.
  final EBSResourceType resourceType;

  /// Determines whether to propagate the tags from the task definition to
  /// &#x2028;the Amazon EBS volume. Tags can only propagate to a
  /// <code>SERVICE</code> specified in
  /// &#x2028;<code>ServiceVolumeConfiguration</code>. If no value is specified,
  /// the tags aren't &#x2028;propagated.
  final PropagateTags? propagateTags;

  /// The tags applied to this Amazon EBS volume. <code>AmazonECSCreated</code>
  /// and <code>AmazonECSManaged</code> are reserved tags that can't be used.
  final List<Tag>? tags;

  EBSTagSpecification({
    required this.resourceType,
    this.propagateTags,
    this.tags,
  });

  factory EBSTagSpecification.fromJson(Map<String, dynamic> json) {
    return EBSTagSpecification(
      resourceType: (json['resourceType'] as String).toEBSResourceType(),
      propagateTags: (json['propagateTags'] as String?)?.toPropagateTags(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final propagateTags = this.propagateTags;
    final tags = this.tags;
    return {
      'resourceType': resourceType.toValue(),
      if (propagateTags != null) 'propagateTags': propagateTags.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The authorization configuration details for the Amazon EFS file system.
class EFSAuthorizationConfig {
  /// The Amazon EFS access point ID to use. If an access point is specified, the
  /// root directory value specified in the <code>EFSVolumeConfiguration</code>
  /// must either be omitted or set to <code>/</code> which will enforce the path
  /// set on the EFS access point. If an access point is used, transit encryption
  /// must be on in the <code>EFSVolumeConfiguration</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">Working
  /// with Amazon EFS access points</a> in the <i>Amazon Elastic File System User
  /// Guide</i>.
  final String? accessPointId;

  /// Determines whether to use the Amazon ECS task role defined in a task
  /// definition when mounting the Amazon EFS file system. If it is turned on,
  /// transit encryption must be turned on in the
  /// <code>EFSVolumeConfiguration</code>. If this parameter is omitted, the
  /// default value of <code>DISABLED</code> is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html#efs-volume-accesspoints">Using
  /// Amazon EFS access points</a> in the <i>Amazon Elastic Container Service
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

extension EFSAuthorizationConfigIAMValueExtension on EFSAuthorizationConfigIAM {
  String toValue() {
    switch (this) {
      case EFSAuthorizationConfigIAM.enabled:
        return 'ENABLED';
      case EFSAuthorizationConfigIAM.disabled:
        return 'DISABLED';
    }
  }
}

extension EFSAuthorizationConfigIAMFromString on String {
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

extension EFSTransitEncryptionValueExtension on EFSTransitEncryption {
  String toValue() {
    switch (this) {
      case EFSTransitEncryption.enabled:
        return 'ENABLED';
      case EFSTransitEncryption.disabled:
        return 'DISABLED';
    }
  }
}

extension EFSTransitEncryptionFromString on String {
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

/// This parameter is specified when you're using an Amazon Elastic File System
/// file system for task storage. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/efs-volumes.html">Amazon
/// EFS volumes</a> in the <i>Amazon Elastic Container Service Developer
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

  /// Determines whether to use encryption for Amazon EFS data in transit between
  /// the Amazon ECS host and the Amazon EFS server. Transit encryption must be
  /// turned on if Amazon EFS IAM authorization is used. If this parameter is
  /// omitted, the default value of <code>DISABLED</code> is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/encryption-in-transit.html">Encrypting
  /// data in transit</a> in the <i>Amazon Elastic File System User Guide</i>.
  final EFSTransitEncryption? transitEncryption;

  /// The port to use when sending encrypted data between the Amazon ECS host and
  /// the Amazon EFS server. If you do not specify a transit encryption port, it
  /// will use the port selection strategy that the Amazon EFS mount helper uses.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-mount-helper.html">EFS
  /// mount helper</a> in the <i>Amazon Elastic File System User Guide</i>.
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
/// beginning with <code>#</code> are treated as comments and are ignored.
///
/// If there are environment variables specified using the
/// <code>environment</code> parameter in a container definition, they take
/// precedence over the variables contained within an environment file. If
/// multiple environment files are specified that contain the same variable,
/// they're processed from the top down. We recommend that you use unique
/// variable names. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/use-environment-file.html">Use
/// a file to pass environment variables to a container</a> in the <i>Amazon
/// Elastic Container Service Developer Guide</i>.
///
/// Environment variable files are objects in Amazon S3 and all Amazon S3
/// security considerations apply.
///
/// You must use the following platforms for the Fargate launch type:
///
/// <ul>
/// <li>
/// Linux platform version <code>1.4.0</code> or later.
/// </li>
/// <li>
/// Windows platform version <code>1.0.0</code> or later.
/// </li>
/// </ul>
/// Consider the following when using the Fargate launch type:
///
/// <ul>
/// <li>
/// The file is handled like a native Docker env-file.
/// </li>
/// <li>
/// There is no support for shell escape handling.
/// </li>
/// <li>
/// The container entry point interperts the <code>VARIABLE</code> values.
/// </li>
/// </ul>
class EnvironmentFile {
  /// The file type to use. Environment files are objects in Amazon S3. The only
  /// supported value is <code>s3</code>.
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

extension EnvironmentFileTypeValueExtension on EnvironmentFileType {
  String toValue() {
    switch (this) {
      case EnvironmentFileType.s3:
        return 's3';
    }
  }
}

extension EnvironmentFileTypeFromString on String {
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
/// default amount, for tasks hosted on Fargate. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html">Using
/// data volumes in tasks</a> in the <i>Amazon ECS Developer Guide;</i>.
/// <note>
/// For tasks using the Fargate launch type, the task requires the following
/// platforms:
///
/// <ul>
/// <li>
/// Linux platform version <code>1.4.0</code> or later.
/// </li>
/// <li>
/// Windows platform version <code>1.0.0</code> or later.
/// </li>
/// </ul> </note>
class EphemeralStorage {
  /// The total amount, in GiB, of ephemeral storage to set for the task. The
  /// minimum supported value is <code>20</code> GiB and the maximum supported
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
  /// Specify an Key Management Service key ID to encrypt the data between the
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
  /// Determines whether to use encryption on the CloudWatch logs. If not
  /// specified, encryption will be off.
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

  /// Determines whether to use encryption on the S3 logs. If not specified,
  /// encryption is not used.
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

extension ExecuteCommandLoggingValueExtension on ExecuteCommandLogging {
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

extension ExecuteCommandLoggingFromString on String {
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

  /// Determines whether the execute command session is running in interactive
  /// mode. Amazon ECS only supports initiating interactive sessions, so you must
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
/// in the <i>Amazon ECS API Reference</i>.
///
/// For more information and the input format, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html">Amazon
/// FSx for Windows File Server Volumes</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>.
class FSxWindowsFileServerAuthorizationConfig {
  /// The authorization credential option to use. The authorization credential
  /// options can be provided using either the Amazon Resource Name (ARN) of an
  /// Secrets Manager secret or SSM Parameter Store parameter. The ARN refers to
  /// the stored credentials.
  final String credentialsParameter;

  /// A fully qualified domain name hosted by an <a
  /// href="https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html">Directory
  /// Service</a> Managed Microsoft AD (Active Directory) or self-hosted AD on
  /// Amazon EC2.
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

/// This parameter is specified when you're using <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html">Amazon
/// FSx for Windows File Server</a> file system for task storage.
///
/// For more information and the input format, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/wfsx-volumes.html">Amazon
/// FSx for Windows File Server volumes</a> in the <i>Amazon Elastic Container
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
/// log routing</a> in the <i>Amazon Elastic Container Service Developer
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
  /// a task definition that uses a FireLens configuration</a> in the <i>Amazon
  /// Elastic Container Service Developer Guide</i>.
  /// <note>
  /// Tasks hosted on Fargate only support the <code>file</code> configuration
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

extension FirelensConfigurationTypeValueExtension on FirelensConfigurationType {
  String toValue() {
    switch (this) {
      case FirelensConfigurationType.fluentd:
        return 'fluentd';
      case FirelensConfigurationType.fluentbit:
        return 'fluentbit';
    }
  }
}

extension FirelensConfigurationTypeFromString on String {
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

class GetTaskProtectionResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// A list of tasks with the following information.
  ///
  /// <ul>
  /// <li>
  /// <code>taskArn</code>: The task ARN.
  /// </li>
  /// <li>
  /// <code>protectionEnabled</code>: The protection status of the task. If
  /// scale-in protection is turned on for a task, the value is <code>true</code>.
  /// Otherwise, it is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>expirationDate</code>: The epoch time when protection for the task
  /// will expire.
  /// </li>
  /// </ul>
  final List<ProtectedTask>? protectedTasks;

  GetTaskProtectionResponse({
    this.failures,
    this.protectedTasks,
  });

  factory GetTaskProtectionResponse.fromJson(Map<String, dynamic> json) {
    return GetTaskProtectionResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      protectedTasks: (json['protectedTasks'] as List?)
          ?.whereNotNull()
          .map((e) => ProtectedTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final protectedTasks = this.protectedTasks;
    return {
      if (failures != null) 'failures': failures,
      if (protectedTasks != null) 'protectedTasks': protectedTasks,
    };
  }
}

/// An object representing a container health check. Health check parameters
/// that are specified in a container definition override any Docker health
/// checks that exist in the container image (such as those specified in a
/// parent image or from the image's Dockerfile). This configuration maps to the
/// <code>HEALTHCHECK</code> parameter of <a
/// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
/// <note>
/// The Amazon ECS container agent only monitors and reports on the health
/// checks specified in the task definition. Amazon ECS does not monitor Docker
/// health checks that are embedded in a container image and not specified in
/// the container definition. Health check parameters that are specified in a
/// container definition override any Docker health checks that exist in the
/// container image.
/// </note>
/// You can view the health status of both individual containers and a task with
/// the DescribeTasks API operation or when viewing the task details in the
/// console.
///
/// The health check is designed to make sure that your containers survive agent
/// restarts, upgrades, or temporary unavailability.
///
/// Amazon ECS performs health checks on containers with the default that
/// launched the container instance or the task.
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
/// <code>UNKNOWN</code>-The container health check is being evaluated, there's
/// no container health check defined, or Amazon ECS doesn't have the health
/// status of the container.
/// </li>
/// </ul>
/// The following describes the possible <code>healthStatus</code> values based
/// on the container health checker status of essential containers in the task
/// with the following priority order (high to low):
///
/// <ul>
/// <li>
/// <code>UNHEALTHY</code>-One or more essential containers have failed their
/// health check.
/// </li>
/// <li>
/// <code>UNKNOWN</code>-Any essential container running within the task is in
/// an <code>UNKNOWN</code> state and no other essential containers have an
/// <code>UNHEALTHY</code> state.
/// </li>
/// <li>
/// <code>HEALTHY</code>-All essential containers within the task have passed
/// their health checks.
/// </li>
/// </ul>
/// Consider the following task health example with 2 containers.
///
/// <ul>
/// <li>
/// If Container1 is <code>UNHEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, the task health is <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// If Container1 is <code>UNHEALTHY</code> and Container2 is
/// <code>HEALTHY</code>, the task health is <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// If Container1 is <code>HEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, the task health is <code>UNKNOWN</code>.
/// </li>
/// <li>
/// If Container1 is <code>HEALTHY</code> and Container2 is
/// <code>HEALTHY</code>, the task health is <code>HEALTHY</code>.
/// </li>
/// </ul>
/// Consider the following task health example with 3 containers.
///
/// <ul>
/// <li>
/// If Container1 is <code>UNHEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, and Container3 is <code>UNKNOWN</code>, the task
/// health is <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// If Container1 is <code>UNHEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, and Container3 is <code>HEALTHY</code>, the task
/// health is <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// If Container1 is <code>UNHEALTHY</code> and Container2 is
/// <code>HEALTHY</code>, and Container3 is <code>HEALTHY</code>, the task
/// health is <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// If Container1 is <code>HEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, and Container3 is <code>HEALTHY</code>, the task
/// health is <code>UNKNOWN</code>.
/// </li>
/// <li>
/// If Container1 is <code>HEALTHY</code> and Container2 is
/// <code>UNKNOWN</code>, and Container3 is <code>UNKNOWN</code>, the task
/// health is <code>UNKNOWN</code>.
/// </li>
/// <li>
/// If Container1 is <code>HEALTHY</code> and Container2 is
/// <code>HEALTHY</code>, and Container3 is <code>HEALTHY</code>, the task
/// health is <code>HEALTHY</code>.
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
/// When the Amazon ECS agent cannot connect to the Amazon ECS service, the
/// service reports the container as <code>UNHEALTHY</code>.
/// </li>
/// <li>
/// The health check statuses are the "last heard from" response from the Amazon
/// ECS agent. There are no assumptions made about the status of the container
/// health checks.
/// </li>
/// <li>
/// Container health checks require version 1.17.0 or greater of the Amazon ECS
/// container agent. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html">Updating
/// the Amazon ECS container agent</a>.
/// </li>
/// <li>
/// Container health checks are supported for Fargate tasks if you're using
/// platform version <code>1.1.0</code> or greater. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
/// platform versions</a>.
/// </li>
/// <li>
/// Container health checks aren't supported for tasks that are part of a
/// service that's configured to use a Classic Load Balancer.
/// </li>
/// </ul>
class HealthCheck {
  /// A string array representing the command that the container runs to determine
  /// if it is healthy. The string array must start with <code>CMD</code> to run
  /// the command arguments directly, or <code>CMD-SHELL</code> to run the command
  /// with the container's default shell.
  ///
  /// When you use the Amazon Web Services Management Console JSON panel, the
  /// Command Line Interface, or the APIs, enclose the list of commands in double
  /// quotes and brackets.
  ///
  /// <code>[ "CMD-SHELL", "curl -f http://localhost/ || exit 1" ]</code>
  ///
  /// You don't include the double quotes and brackets when you use the Amazon Web
  /// Services Management Console.
  ///
  /// <code> CMD-SHELL, curl -f http://localhost/ || exit 1</code>
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

  /// The optional grace period to provide containers time to bootstrap before
  /// failed health checks count towards the maximum number of retries. You can
  /// specify between 0 and 300 seconds. By default, the <code>startPeriod</code>
  /// is off.
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

extension HealthStatusValueExtension on HealthStatus {
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

extension HealthStatusFromString on String {
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
  /// that's presented to the container. If this parameter is empty, then the
  /// Docker daemon has assigned a host path for you. If the <code>host</code>
  /// parameter contains a <code>sourcePath</code> file location, then the data
  /// volume persists at the specified location on the host container instance
  /// until you delete it manually. If the <code>sourcePath</code> value doesn't
  /// exist on the host container instance, the Docker daemon creates it. If the
  /// location does exist, the contents of the source path folder are exported.
  ///
  /// If you're using the Fargate launch type, the <code>sourcePath</code>
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

/// Details on an Elastic Inference accelerator. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>.
class InferenceAccelerator {
  /// The Elastic Inference accelerator device name. The <code>deviceName</code>
  /// must also be referenced in a container definition as a <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ResourceRequirement.html">ResourceRequirement</a>.
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
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html">Working
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

/// An object representing the result of a container instance health status
/// check.
class InstanceHealthCheckResult {
  /// The Unix timestamp for when the container instance health status last
  /// changed.
  final DateTime? lastStatusChange;

  /// The Unix timestamp for when the container instance health status was last
  /// updated.
  final DateTime? lastUpdated;

  /// The container instance health status.
  final InstanceHealthCheckState? status;

  /// The type of container instance health status that was verified.
  final InstanceHealthCheckType? type;

  InstanceHealthCheckResult({
    this.lastStatusChange,
    this.lastUpdated,
    this.status,
    this.type,
  });

  factory InstanceHealthCheckResult.fromJson(Map<String, dynamic> json) {
    return InstanceHealthCheckResult(
      lastStatusChange: timeStampFromJson(json['lastStatusChange']),
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      status: (json['status'] as String?)?.toInstanceHealthCheckState(),
      type: (json['type'] as String?)?.toInstanceHealthCheckType(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastStatusChange = this.lastStatusChange;
    final lastUpdated = this.lastUpdated;
    final status = this.status;
    final type = this.type;
    return {
      if (lastStatusChange != null)
        'lastStatusChange': unixTimestampToJson(lastStatusChange),
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum InstanceHealthCheckState {
  ok,
  impaired,
  insufficientData,
  initializing,
}

extension InstanceHealthCheckStateValueExtension on InstanceHealthCheckState {
  String toValue() {
    switch (this) {
      case InstanceHealthCheckState.ok:
        return 'OK';
      case InstanceHealthCheckState.impaired:
        return 'IMPAIRED';
      case InstanceHealthCheckState.insufficientData:
        return 'INSUFFICIENT_DATA';
      case InstanceHealthCheckState.initializing:
        return 'INITIALIZING';
    }
  }
}

extension InstanceHealthCheckStateFromString on String {
  InstanceHealthCheckState toInstanceHealthCheckState() {
    switch (this) {
      case 'OK':
        return InstanceHealthCheckState.ok;
      case 'IMPAIRED':
        return InstanceHealthCheckState.impaired;
      case 'INSUFFICIENT_DATA':
        return InstanceHealthCheckState.insufficientData;
      case 'INITIALIZING':
        return InstanceHealthCheckState.initializing;
    }
    throw Exception('$this is not known in enum InstanceHealthCheckState');
  }
}

enum InstanceHealthCheckType {
  containerRuntime,
}

extension InstanceHealthCheckTypeValueExtension on InstanceHealthCheckType {
  String toValue() {
    switch (this) {
      case InstanceHealthCheckType.containerRuntime:
        return 'CONTAINER_RUNTIME';
    }
  }
}

extension InstanceHealthCheckTypeFromString on String {
  InstanceHealthCheckType toInstanceHealthCheckType() {
    switch (this) {
      case 'CONTAINER_RUNTIME':
        return InstanceHealthCheckType.containerRuntime;
    }
    throw Exception('$this is not known in enum InstanceHealthCheckType');
  }
}

enum IpcMode {
  host,
  task,
  none,
}

extension IpcModeValueExtension on IpcMode {
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

extension IpcModeFromString on String {
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

/// The Linux capabilities to add or remove from the default Docker
/// configuration for a container defined in the task definition. For more
/// information about the default capabilities and the non-default available
/// capabilities, see <a
/// href="https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities">Runtime
/// privilege and Linux capabilities</a> in the <i>Docker run reference</i>. For
/// more detailed information about these Linux capabilities, see the <a
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
  /// Tasks launched on Fargate only support adding the <code>SYS_PTRACE</code>
  /// kernel capability.
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

extension LaunchTypeValueExtension on LaunchType {
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

extension LaunchTypeFromString on String {
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

/// The Linux-specific options that are applied to the container, such as Linux
/// <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_KernelCapabilities.html">KernelCapabilities</a>.
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
  /// If you're using tasks that use the Fargate launch type, the
  /// <code>devices</code> parameter isn't supported.
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
  /// If you're using tasks that use the Fargate launch type, the
  /// <code>maxSwap</code> parameter isn't supported.
  ///
  /// If you're using tasks on Amazon Linux 2023 the <code>swappiness</code>
  /// parameter isn't supported.
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
  /// If you're using tasks that use the Fargate launch type, the
  /// <code>swappiness</code> parameter isn't supported.
  ///
  /// If you're using tasks on Amazon Linux 2023 the <code>swappiness</code>
  /// parameter isn't supported.
  /// </note>
  final int? swappiness;

  /// The container path, mount options, and size (in MiB) of the tmpfs mount.
  /// This parameter maps to the <code>--tmpfs</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  /// <note>
  /// If you're using tasks that use the Fargate launch type, the
  /// <code>tmpfs</code> parameter isn't supported.
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
  /// The list of full Amazon Resource Name (ARN) entries for each cluster that's
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

class ListServicesByNamespaceResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListServicesByNamespace</code> request. When the results of a
  /// <code>ListServicesByNamespace</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. When there are
  /// no more results to return, this value is <code>null</code>.
  final String? nextToken;

  /// The list of full ARN entries for each service that's associated with the
  /// specified namespace.
  final List<String>? serviceArns;

  ListServicesByNamespaceResponse({
    this.nextToken,
    this.serviceArns,
  });

  factory ListServicesByNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesByNamespaceResponse(
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

class ListServicesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListServices</code> request. When the results of a
  /// <code>ListServices</code> request exceed <code>maxResults</code>, this value
  /// can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The list of full ARN entries for each service that's associated with the
  /// specified cluster.
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
/// When you add, update, or remove a load balancer configuration, Amazon ECS
/// starts a new deployment with the updated Elastic Load Balancing
/// configuration. This causes tasks to register to and deregister from load
/// balancers.
///
/// We recommend that you verify this on a test environment before you update
/// the Elastic Load Balancing configuration.
///
/// A service-linked role is required for services that use multiple target
/// groups. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html">Using
/// service-linked roles</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
class LoadBalancer {
  /// The name of the container (as it appears in a container definition) to
  /// associate with the load balancer.
  ///
  /// You need to specify the container name when configuring the target group for
  /// an Amazon ECS load balancer.
  final String? containerName;

  /// The port on the container to associate with the load balancer. This port
  /// must correspond to a <code>containerPort</code> in the task definition the
  /// tasks in the service are using. For tasks that use the EC2 launch type, the
  /// container instance they're launched on must allow ingress traffic on the
  /// <code>hostPort</code> of the port mapping.
  final int? containerPort;

  /// The name of the load balancer to associate with the Amazon ECS service or
  /// task set.
  ///
  /// If you are using an Application Load Balancer or a Network Load Balancer the
  /// load balancer name parameter should be omitted.
  final String? loadBalancerName;

  /// The full Amazon Resource Name (ARN) of the Elastic Load Balancing target
  /// group or groups associated with a service or task set.
  ///
  /// A target group ARN is only specified when using an Application Load Balancer
  /// or Network Load Balancer.
  ///
  /// For services using the <code>ECS</code> deployment controller, you can
  /// specify one or multiple target groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html">Registering
  /// multiple target groups with a service</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  ///
  /// For services using the <code>CODE_DEPLOY</code> deployment controller,
  /// you're required to define two target groups for the load balancer. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-bluegreen.html">Blue/green
  /// deployment with CodeDeploy</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  /// <important>
  /// If your service's task definition uses the <code>awsvpc</code> network mode,
  /// you must choose <code>ip</code> as the target type, not
  /// <code>instance</code>. Do this when creating your target groups because
  /// tasks that use the <code>awsvpc</code> network mode are associated with an
  /// elastic network interface, not an Amazon EC2 instance. This network mode is
  /// required for the Fargate launch type.
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
/// uses. However, the container might use a different logging driver than the
/// Docker daemon by specifying a log driver configuration in the container
/// definition. For more information about the options for different supported
/// log drivers, see <a
/// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
/// logging drivers</a> in the Docker documentation.
///
/// Understand the following when specifying a log configuration for your
/// containers.
///
/// <ul>
/// <li>
/// Amazon ECS currently supports a subset of the logging drivers available to
/// the Docker daemon. Additional log drivers may be available in future
/// releases of the Amazon ECS container agent.
///
/// For tasks on Fargate, the supported log drivers are <code>awslogs</code>,
/// <code>splunk</code>, and <code>awsfirelens</code>.
///
/// For tasks hosted on Amazon EC2 instances, the supported log drivers are
/// <code>awslogs</code>, <code>fluentd</code>, <code>gelf</code>,
/// <code>json-file</code>, <code>journald</code>,
/// <code>logentries</code>,<code>syslog</code>, <code>splunk</code>, and
/// <code>awsfirelens</code>.
/// </li>
/// <li>
/// This parameter requires version 1.18 of the Docker Remote API or greater on
/// your container instance.
/// </li>
/// <li>
/// For tasks that are hosted on Amazon EC2 instances, the Amazon ECS container
/// agent must register the available logging drivers with the
/// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
/// containers placed on that instance can use these log configuration options.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
/// ECS container agent configuration</a> in the <i>Amazon Elastic Container
/// Service Developer Guide</i>.
/// </li>
/// <li>
/// For tasks that are on Fargate, because you don't have access to the
/// underlying infrastructure your tasks are hosted on, any additional software
/// needed must be installed outside of the task. For example, the Fluentd
/// output aggregators or a remote host running Logstash to send Gelf logs to.
/// </li>
/// </ul>
class LogConfiguration {
  /// The log driver to use for the container.
  ///
  /// For tasks on Fargate, the supported log drivers are <code>awslogs</code>,
  /// <code>splunk</code>, and <code>awsfirelens</code>.
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
  /// If you have a custom driver that isn't listed, you can fork the Amazon ECS
  /// container agent project that's <a
  /// href="https://github.com/aws/amazon-ecs-agent">available on GitHub</a> and
  /// customize it to work with that driver. We encourage you to submit pull
  /// requests for changes that you would like to have included. However, we don't
  /// currently provide support for running modified copies of this software.
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
  /// sensitive data</a> in the <i>Amazon Elastic Container Service Developer
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

extension LogDriverValueExtension on LogDriver {
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

extension LogDriverFromString on String {
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
  /// The Unix timestamp for the time when the managed agent was last started.
  final DateTime? lastStartedAt;

  /// The last known status of the managed agent.
  final String? lastStatus;

  /// The name of the managed agent. When the execute command feature is turned
  /// on, the managed agent name is <code>ExecuteCommandAgent</code>.
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

extension ManagedAgentNameValueExtension on ManagedAgentName {
  String toValue() {
    switch (this) {
      case ManagedAgentName.executeCommandAgent:
        return 'ExecuteCommandAgent';
    }
  }
}

extension ManagedAgentNameFromString on String {
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
  /// The name of the container that's associated with the managed agent.
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

enum ManagedDraining {
  enabled,
  disabled,
}

extension ManagedDrainingValueExtension on ManagedDraining {
  String toValue() {
    switch (this) {
      case ManagedDraining.enabled:
        return 'ENABLED';
      case ManagedDraining.disabled:
        return 'DISABLED';
    }
  }
}

extension ManagedDrainingFromString on String {
  ManagedDraining toManagedDraining() {
    switch (this) {
      case 'ENABLED':
        return ManagedDraining.enabled;
      case 'DISABLED':
        return ManagedDraining.disabled;
    }
    throw Exception('$this is not known in enum ManagedDraining');
  }
}

/// The managed scaling settings for the Auto Scaling group capacity provider.
///
/// When managed scaling is turned on, Amazon ECS manages the scale-in and
/// scale-out actions of the Auto Scaling group. Amazon ECS manages a target
/// tracking scaling policy using an Amazon ECS managed CloudWatch metric with
/// the specified <code>targetCapacity</code> value as the target value for the
/// metric. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/asg-capacity-providers.html#asg-capacity-providers-managed-scaling">Using
/// managed scaling</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
///
/// If managed scaling is off, the user must manage the scaling of the Auto
/// Scaling group.
class ManagedScaling {
  /// The period of time, in seconds, after a newly launched Amazon EC2 instance
  /// can contribute to CloudWatch metrics for Auto Scaling group. If this
  /// parameter is omitted, the default value of <code>300</code> seconds is used.
  final int? instanceWarmupPeriod;

  /// The maximum number of Amazon EC2 instances that Amazon ECS will scale out at
  /// one time. The scale in process is not affected by this parameter. If this
  /// parameter is omitted, the default value of <code>10000</code> is used.
  final int? maximumScalingStepSize;

  /// The minimum number of Amazon EC2 instances that Amazon ECS will scale out at
  /// one time. The scale in process is not affected by this parameter If this
  /// parameter is omitted, the default value of <code>1</code> is used.
  ///
  /// When additional capacity is required, Amazon ECS will scale up the minimum
  /// scaling step size even if the actual demand is less than the minimum scaling
  /// step size.
  ///
  /// If you use a capacity provider with an Auto Scaling group configured with
  /// more than one Amazon EC2 instance type or Availability Zone, Amazon ECS will
  /// scale up by the exact minimum scaling step size value and will ignore both
  /// the maximum scaling step size as well as the capacity demand.
  final int? minimumScalingStepSize;

  /// Determines whether to use managed scaling for the capacity provider.
  final ManagedScalingStatus? status;

  /// The target capacity utilization as a percentage for the capacity provider.
  /// The specified value must be greater than <code>0</code> and less than or
  /// equal to <code>100</code>. For example, if you want the capacity provider to
  /// maintain 10% spare capacity, then that means the utilization is 90%, so use
  /// a <code>targetCapacity</code> of <code>90</code>. The default value of
  /// <code>100</code> percent results in the Amazon EC2 instances in your Auto
  /// Scaling group being completely used.
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

extension ManagedScalingStatusValueExtension on ManagedScalingStatus {
  String toValue() {
    switch (this) {
      case ManagedScalingStatus.enabled:
        return 'ENABLED';
      case ManagedScalingStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ManagedScalingStatusFromString on String {
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

extension ManagedTerminationProtectionValueExtension
    on ManagedTerminationProtection {
  String toValue() {
    switch (this) {
      case ManagedTerminationProtection.enabled:
        return 'ENABLED';
      case ManagedTerminationProtection.disabled:
        return 'DISABLED';
    }
  }
}

extension ManagedTerminationProtectionFromString on String {
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

/// The details for a volume mount point that's used in a container definition.
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

  /// The port number on the container that's used with the network binding.
  final int? containerPort;

  /// The port number range on the container that's bound to the dynamically
  /// mapped host port range.
  ///
  /// The following rules apply when you specify a
  /// <code>containerPortRange</code>:
  ///
  /// <ul>
  /// <li>
  /// You must use either the <code>bridge</code> network mode or the
  /// <code>awsvpc</code> network mode.
  /// </li>
  /// <li>
  /// This parameter is available for both the EC2 and Fargate launch types.
  /// </li>
  /// <li>
  /// This parameter is available for both the Linux and Windows operating
  /// systems.
  /// </li>
  /// <li>
  /// The container instance must have at least version 1.67.0 of the container
  /// agent and at least version 1.67.0-1 of the <code>ecs-init</code> package
  /// </li>
  /// <li>
  /// You can specify a maximum of 100 port ranges per container.
  /// </li>
  /// <li>
  /// You do not specify a <code>hostPortRange</code>. The value of the
  /// <code>hostPortRange</code> is set as follows:
  ///
  /// <ul>
  /// <li>
  /// For containers in a task with the <code>awsvpc</code> network mode, the
  /// <code>hostPortRange</code> is set to the same value as the
  /// <code>containerPortRange</code>. This is a static mapping strategy.
  /// </li>
  /// <li>
  /// For containers in a task with the <code>bridge</code> network mode, the
  /// Amazon ECS agent finds open host ports from the default ephemeral range and
  /// passes it to docker to bind them to the container ports.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The <code>containerPortRange</code> valid values are between 1 and 65535.
  /// </li>
  /// <li>
  /// A port can only be included in one port mapping per container.
  /// </li>
  /// <li>
  /// You cannot specify overlapping port ranges.
  /// </li>
  /// <li>
  /// The first port in the range must be less than last port in the range.
  /// </li>
  /// <li>
  /// Docker recommends that you turn off the docker-proxy in the Docker daemon
  /// config file when you have a large number of ports.
  ///
  /// For more information, see <a
  /// href="https://github.com/moby/moby/issues/11185"> Issue #11185</a> on the
  /// Github website.
  ///
  /// For information about how to turn off the docker-proxy in the Docker daemon
  /// config file, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bootstrap_container_instance.html#bootstrap_docker_daemon">Docker
  /// daemon</a> in the <i>Amazon ECS Developer Guide</i>.
  /// </li>
  /// </ul>
  /// You can call <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html">
  /// <code>DescribeTasks</code> </a> to view the <code>hostPortRange</code> which
  /// are the host ports that are bound to the container ports.
  final String? containerPortRange;

  /// The port number on the host that's used with the network binding.
  final int? hostPort;

  /// The port number range on the host that's used with the network binding. This
  /// is assigned is assigned by Docker and delivered by the Amazon ECS agent.
  final String? hostPortRange;

  /// The protocol used for the network binding.
  final TransportProtocol? protocol;

  NetworkBinding({
    this.bindIP,
    this.containerPort,
    this.containerPortRange,
    this.hostPort,
    this.hostPortRange,
    this.protocol,
  });

  factory NetworkBinding.fromJson(Map<String, dynamic> json) {
    return NetworkBinding(
      bindIP: json['bindIP'] as String?,
      containerPort: json['containerPort'] as int?,
      containerPortRange: json['containerPortRange'] as String?,
      hostPort: json['hostPort'] as int?,
      hostPortRange: json['hostPortRange'] as String?,
      protocol: (json['protocol'] as String?)?.toTransportProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final bindIP = this.bindIP;
    final containerPort = this.containerPort;
    final containerPortRange = this.containerPortRange;
    final hostPort = this.hostPort;
    final hostPortRange = this.hostPortRange;
    final protocol = this.protocol;
    return {
      if (bindIP != null) 'bindIP': bindIP,
      if (containerPort != null) 'containerPort': containerPort,
      if (containerPortRange != null) 'containerPortRange': containerPortRange,
      if (hostPort != null) 'hostPort': hostPort,
      if (hostPortRange != null) 'hostPortRange': hostPortRange,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

/// The network configuration for a task or service.
class NetworkConfiguration {
  /// The VPC subnets and security groups that are associated with a task.
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

extension NetworkModeValueExtension on NetworkMode {
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

extension NetworkModeFromString on String {
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

enum OSFamily {
  windowsServer_2019Full,
  windowsServer_2019Core,
  windowsServer_2016Full,
  windowsServer_2004Core,
  windowsServer_2022Core,
  windowsServer_2022Full,
  windowsServer_20h2Core,
  linux,
}

extension OSFamilyValueExtension on OSFamily {
  String toValue() {
    switch (this) {
      case OSFamily.windowsServer_2019Full:
        return 'WINDOWS_SERVER_2019_FULL';
      case OSFamily.windowsServer_2019Core:
        return 'WINDOWS_SERVER_2019_CORE';
      case OSFamily.windowsServer_2016Full:
        return 'WINDOWS_SERVER_2016_FULL';
      case OSFamily.windowsServer_2004Core:
        return 'WINDOWS_SERVER_2004_CORE';
      case OSFamily.windowsServer_2022Core:
        return 'WINDOWS_SERVER_2022_CORE';
      case OSFamily.windowsServer_2022Full:
        return 'WINDOWS_SERVER_2022_FULL';
      case OSFamily.windowsServer_20h2Core:
        return 'WINDOWS_SERVER_20H2_CORE';
      case OSFamily.linux:
        return 'LINUX';
    }
  }
}

extension OSFamilyFromString on String {
  OSFamily toOSFamily() {
    switch (this) {
      case 'WINDOWS_SERVER_2019_FULL':
        return OSFamily.windowsServer_2019Full;
      case 'WINDOWS_SERVER_2019_CORE':
        return OSFamily.windowsServer_2019Core;
      case 'WINDOWS_SERVER_2016_FULL':
        return OSFamily.windowsServer_2016Full;
      case 'WINDOWS_SERVER_2004_CORE':
        return OSFamily.windowsServer_2004Core;
      case 'WINDOWS_SERVER_2022_CORE':
        return OSFamily.windowsServer_2022Core;
      case 'WINDOWS_SERVER_2022_FULL':
        return OSFamily.windowsServer_2022Full;
      case 'WINDOWS_SERVER_20H2_CORE':
        return OSFamily.windowsServer_20h2Core;
      case 'LINUX':
        return OSFamily.linux;
    }
    throw Exception('$this is not known in enum OSFamily');
  }
}

enum PidMode {
  host,
  task,
}

extension PidModeValueExtension on PidMode {
  String toValue() {
    switch (this) {
      case PidMode.host:
        return 'host';
      case PidMode.task:
        return 'task';
    }
  }
}

extension PidModeFromString on String {
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
/// placement constraints</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// If you're using the Fargate launch type, task placement constraints aren't
/// supported.
/// </note>
class PlacementConstraint {
  /// A cluster query language expression to apply to the constraint. The
  /// expression can have a maximum length of 2000 characters. You can't specify
  /// an expression if the constraint type is <code>distinctInstance</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html">Cluster
  /// query language</a> in the <i>Amazon Elastic Container Service Developer
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

extension PlacementConstraintTypeValueExtension on PlacementConstraintType {
  String toValue() {
    switch (this) {
      case PlacementConstraintType.distinctInstance:
        return 'distinctInstance';
      case PlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension PlacementConstraintTypeFromString on String {
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
/// placement strategies</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
class PlacementStrategy {
  /// The field to apply the placement strategy against. For the
  /// <code>spread</code> placement strategy, valid values are
  /// <code>instanceId</code> (or <code>host</code>, which has the same effect),
  /// or any platform or custom attribute that's applied to a container instance,
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
  /// the resource that's specified with the <code>field</code> parameter. For
  /// example, if you binpack on memory, a task is placed on the instance with the
  /// least amount of remaining memory but still enough to run the task.
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

extension PlacementStrategyTypeValueExtension on PlacementStrategyType {
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

extension PlacementStrategyTypeFromString on String {
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
  /// The ID for the GPUs on the container instance. The available GPU IDs can
  /// also be obtained on the container instance in the
  /// <code>/var/lib/ecs/gpu/nvidia_gpu_info.json</code> file.
  final String id;

  /// The type of device that's available on the container instance. The only
  /// supported value is <code>GPU</code>.
  final PlatformDeviceType type;

  PlatformDevice({
    required this.id,
    required this.type,
  });

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

extension PlatformDeviceTypeValueExtension on PlatformDeviceType {
  String toValue() {
    switch (this) {
      case PlatformDeviceType.gpu:
        return 'GPU';
    }
  }
}

extension PlatformDeviceTypeFromString on String {
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
/// If you use containers in a task with the <code>awsvpc</code> or
/// <code>host</code> network mode, specify the exposed ports using
/// <code>containerPort</code>. The <code>hostPort</code> can be left blank or
/// it must be the same value as the <code>containerPort</code>.
///
/// Most fields of this parameter (<code>containerPort</code>,
/// <code>hostPort</code>, <code>protocol</code>) maps to
/// <code>PortBindings</code> in the <a
/// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
/// a container</a> section of the <a
/// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
/// the <code>--publish</code> option to <a
/// href="https://docs.docker.com/engine/reference/commandline/run/">
/// <code>docker run</code> </a>. If the network mode of a task definition is
/// set to <code>host</code>, host ports must either be undefined or match the
/// container port in the port mapping.
/// <note>
/// You can't expose the same container port for multiple protocols. If you
/// attempt this, an error is returned.
/// </note>
/// After a task reaches the <code>RUNNING</code> status, manual and automatic
/// host and container port assignments are visible in the
/// <code>networkBindings</code> section of <a>DescribeTasks</a> API responses.
class PortMapping {
  /// The application protocol that's used for the port mapping. This parameter
  /// only applies to Service Connect. We recommend that you set this parameter to
  /// be consistent with the protocol that your application uses. If you set this
  /// parameter, Amazon ECS adds protocol-specific connection handling to the
  /// Service Connect proxy. If you set this parameter, Amazon ECS adds
  /// protocol-specific telemetry in the Amazon ECS console and CloudWatch.
  ///
  /// If you don't set a value for this parameter, then TCP is used. However,
  /// Amazon ECS doesn't add protocol-specific telemetry for TCP.
  ///
  /// <code>appProtocol</code> is immutable in a Service Connect service. Updating
  /// this field requires a service deletion and redeployment.
  ///
  /// Tasks that run in a namespace can use short names to connect to services in
  /// the namespace. Tasks can connect to services across all of the clusters in
  /// the namespace. Tasks connect through a managed proxy container that collects
  /// logs and metrics for increased visibility. Only the tasks that Amazon ECS
  /// services create are supported with Service Connect. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final ApplicationProtocol? appProtocol;

  /// The port number on the container that's bound to the user-specified or
  /// automatically assigned host port.
  ///
  /// If you use containers in a task with the <code>awsvpc</code> or
  /// <code>host</code> network mode, specify the exposed ports using
  /// <code>containerPort</code>.
  ///
  /// If you use containers in a task with the <code>bridge</code> network mode
  /// and you specify a container port and not a host port, your container
  /// automatically receives a host port in the ephemeral port range. For more
  /// information, see <code>hostPort</code>. Port mappings that are automatically
  /// assigned in this way do not count toward the 100 reserved ports limit of a
  /// container instance.
  final int? containerPort;

  /// The port number range on the container that's bound to the dynamically
  /// mapped host port range.
  ///
  /// The following rules apply when you specify a
  /// <code>containerPortRange</code>:
  ///
  /// <ul>
  /// <li>
  /// You must use either the <code>bridge</code> network mode or the
  /// <code>awsvpc</code> network mode.
  /// </li>
  /// <li>
  /// This parameter is available for both the EC2 and Fargate launch types.
  /// </li>
  /// <li>
  /// This parameter is available for both the Linux and Windows operating
  /// systems.
  /// </li>
  /// <li>
  /// The container instance must have at least version 1.67.0 of the container
  /// agent and at least version 1.67.0-1 of the <code>ecs-init</code> package
  /// </li>
  /// <li>
  /// You can specify a maximum of 100 port ranges per container.
  /// </li>
  /// <li>
  /// You do not specify a <code>hostPortRange</code>. The value of the
  /// <code>hostPortRange</code> is set as follows:
  ///
  /// <ul>
  /// <li>
  /// For containers in a task with the <code>awsvpc</code> network mode, the
  /// <code>hostPortRange</code> is set to the same value as the
  /// <code>containerPortRange</code>. This is a static mapping strategy.
  /// </li>
  /// <li>
  /// For containers in a task with the <code>bridge</code> network mode, the
  /// Amazon ECS agent finds open host ports from the default ephemeral range and
  /// passes it to docker to bind them to the container ports.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The <code>containerPortRange</code> valid values are between 1 and 65535.
  /// </li>
  /// <li>
  /// A port can only be included in one port mapping per container.
  /// </li>
  /// <li>
  /// You cannot specify overlapping port ranges.
  /// </li>
  /// <li>
  /// The first port in the range must be less than last port in the range.
  /// </li>
  /// <li>
  /// Docker recommends that you turn off the docker-proxy in the Docker daemon
  /// config file when you have a large number of ports.
  ///
  /// For more information, see <a
  /// href="https://github.com/moby/moby/issues/11185"> Issue #11185</a> on the
  /// Github website.
  ///
  /// For information about how to turn off the docker-proxy in the Docker daemon
  /// config file, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bootstrap_container_instance.html#bootstrap_docker_daemon">Docker
  /// daemon</a> in the <i>Amazon ECS Developer Guide</i>.
  /// </li>
  /// </ul>
  /// You can call <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html">
  /// <code>DescribeTasks</code> </a> to view the <code>hostPortRange</code> which
  /// are the host ports that are bound to the container ports.
  final String? containerPortRange;

  /// The port number on the container instance to reserve for your container.
  ///
  /// If you specify a <code>containerPortRange</code>, leave this field empty and
  /// the value of the <code>hostPort</code> is set as follows:
  ///
  /// <ul>
  /// <li>
  /// For containers in a task with the <code>awsvpc</code> network mode, the
  /// <code>hostPort</code> is set to the same value as the
  /// <code>containerPort</code>. This is a static mapping strategy.
  /// </li>
  /// <li>
  /// For containers in a task with the <code>bridge</code> network mode, the
  /// Amazon ECS agent finds open ports on the host and automatically binds them
  /// to the container ports. This is a dynamic mapping strategy.
  /// </li>
  /// </ul>
  /// If you use containers in a task with the <code>awsvpc</code> or
  /// <code>host</code> network mode, the <code>hostPort</code> can either be left
  /// blank or set to the same value as the <code>containerPort</code>.
  ///
  /// If you use containers in a task with the <code>bridge</code> network mode,
  /// you can specify a non-reserved host port for your container port mapping, or
  /// you can omit the <code>hostPort</code> (or set it to <code>0</code>) while
  /// specifying a <code>containerPort</code> and your container automatically
  /// receives a port in the ephemeral port range for your container instance
  /// operating system and Docker version.
  ///
  /// The default ephemeral port range for Docker version 1.6.0 and later is
  /// listed on the instance under
  /// <code>/proc/sys/net/ipv4/ip_local_port_range</code>. If this kernel
  /// parameter is unavailable, the default ephemeral port range from 49153
  /// through 65535 (Linux) or 49152 through 65535 (Windows) is used. Do not
  /// attempt to specify a host port in the ephemeral port range as these are
  /// reserved for automatic assignment. In general, ports below 32768 are outside
  /// of the ephemeral port range.
  ///
  /// The default reserved ports are 22 for SSH, the Docker ports 2375 and 2376,
  /// and the Amazon ECS container agent ports 51678-51680. Any host port that was
  /// previously specified in a running task is also reserved while the task is
  /// running. That is, after a task stops, the host port is released. The current
  /// reserved ports are displayed in the <code>remainingResources</code> of <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeContainerInstances.html">DescribeContainerInstances</a>
  /// output. A container instance can have up to 100 reserved ports at a time.
  /// This number includes the default reserved ports. Automatically assigned
  /// ports aren't included in the 100 reserved ports quota.
  final int? hostPort;

  /// The name that's used for the port mapping. This parameter only applies to
  /// Service Connect. This parameter is the name that you use in the
  /// <code>serviceConnectConfiguration</code> of a service. The name can include
  /// up to 64 characters. The characters can include lowercase letters, numbers,
  /// underscores (_), and hyphens (-). The name can't start with a hyphen.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final String? name;

  /// The protocol used for the port mapping. Valid values are <code>tcp</code>
  /// and <code>udp</code>. The default is <code>tcp</code>. <code>protocol</code>
  /// is immutable in a Service Connect service. Updating this field requires a
  /// service deletion and redeployment.
  final TransportProtocol? protocol;

  PortMapping({
    this.appProtocol,
    this.containerPort,
    this.containerPortRange,
    this.hostPort,
    this.name,
    this.protocol,
  });

  factory PortMapping.fromJson(Map<String, dynamic> json) {
    return PortMapping(
      appProtocol: (json['appProtocol'] as String?)?.toApplicationProtocol(),
      containerPort: json['containerPort'] as int?,
      containerPortRange: json['containerPortRange'] as String?,
      hostPort: json['hostPort'] as int?,
      name: json['name'] as String?,
      protocol: (json['protocol'] as String?)?.toTransportProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final appProtocol = this.appProtocol;
    final containerPort = this.containerPort;
    final containerPortRange = this.containerPortRange;
    final hostPort = this.hostPort;
    final name = this.name;
    final protocol = this.protocol;
    return {
      if (appProtocol != null) 'appProtocol': appProtocol.toValue(),
      if (containerPort != null) 'containerPort': containerPort,
      if (containerPortRange != null) 'containerPortRange': containerPortRange,
      if (hostPort != null) 'hostPort': hostPort,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

enum PropagateTags {
  taskDefinition,
  service,
  none,
}

extension PropagateTagsValueExtension on PropagateTags {
  String toValue() {
    switch (this) {
      case PropagateTags.taskDefinition:
        return 'TASK_DEFINITION';
      case PropagateTags.service:
        return 'SERVICE';
      case PropagateTags.none:
        return 'NONE';
    }
  }
}

extension PropagateTagsFromString on String {
  PropagateTags toPropagateTags() {
    switch (this) {
      case 'TASK_DEFINITION':
        return PropagateTags.taskDefinition;
      case 'SERVICE':
        return PropagateTags.service;
      case 'NONE':
        return PropagateTags.none;
    }
    throw Exception('$this is not known in enum PropagateTags');
  }
}

/// An object representing the protection status details for a task. You can set
/// the protection status with the <a>UpdateTaskProtection</a> API and get the
/// status of tasks with the <a>GetTaskProtection</a> API.
class ProtectedTask {
  /// The epoch time when protection for the task will expire.
  final DateTime? expirationDate;

  /// The protection status of the task. If scale-in protection is on for a task,
  /// the value is <code>true</code>. Otherwise, it is <code>false</code>.
  final bool? protectionEnabled;

  /// The task ARN.
  final String? taskArn;

  ProtectedTask({
    this.expirationDate,
    this.protectionEnabled,
    this.taskArn,
  });

  factory ProtectedTask.fromJson(Map<String, dynamic> json) {
    return ProtectedTask(
      expirationDate: timeStampFromJson(json['expirationDate']),
      protectionEnabled: json['protectionEnabled'] as bool?,
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expirationDate = this.expirationDate;
    final protectionEnabled = this.protectionEnabled;
    final taskArn = this.taskArn;
    return {
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (protectionEnabled != null) 'protectionEnabled': protectionEnabled,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// The configuration details for the App Mesh proxy.
///
/// For tasks that use the EC2 launch type, the container instances require at
/// least version 1.26.0 of the container agent and at least version 1.26.0-1 of
/// the <code>ecs-init</code> package to use a proxy configuration. If your
/// container instances are launched from the Amazon ECS optimized AMI version
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

extension ProxyConfigurationTypeValueExtension on ProxyConfigurationType {
  String toValue() {
    switch (this) {
      case ProxyConfigurationType.appmesh:
        return 'APPMESH';
    }
  }
}

extension ProxyConfigurationTypeFromString on String {
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
  /// When you use the Amazon ECS API, CLI, or Amazon Web Services SDK, if the
  /// secret exists in the same Region as the task that you're launching then you
  /// can use either the full ARN or the name of the secret. When you use the
  /// Amazon Web Services Management Console, you must specify the full ARN of the
  /// secret.
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

  /// The type of the resource. Valid values: <code>INTEGER</code>,
  /// <code>DOUBLE</code>, <code>LONG</code>, or <code>STRINGSET</code>.
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
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-inference.html">Working
/// with Amazon Elastic Inference on Amazon ECS</a> in the <i>Amazon Elastic
/// Container Service Developer Guide</i>
class ResourceRequirement {
  /// The type of resource to assign to a container. The supported values are
  /// <code>GPU</code> or <code>InferenceAccelerator</code>.
  final ResourceType type;

  /// The value for the specified resource type.
  ///
  /// If the <code>GPU</code> type is used, the value is the number of physical
  /// <code>GPUs</code> the Amazon ECS container agent reserves for the container.
  /// The number of GPUs that's reserved for all containers in a task can't exceed
  /// the number of available GPUs on the container instance that the task is
  /// launched on.
  ///
  /// If the <code>InferenceAccelerator</code> type is used, the
  /// <code>value</code> matches the <code>deviceName</code> for an <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_InferenceAccelerator.html">InferenceAccelerator</a>
  /// specified in a task definition.
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

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.gpu:
        return 'GPU';
      case ResourceType.inferenceAccelerator:
        return 'InferenceAccelerator';
    }
  }
}

extension ResourceTypeFromString on String {
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
  ///
  /// For information about how to address failures, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-event-messages.html#service-event-messages-list">Service
  /// event messages</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html">API
  /// failure reasons</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final List<Failure>? failures;

  /// A full description of the tasks that were run. The tasks that were
  /// successfully placed on your cluster are described here.
  /// <p/>
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

/// Information about the platform for the Amazon ECS service or task.
///
/// For more information about <code>RuntimePlatform</code>, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#runtime-platform">RuntimePlatform</a>
/// in the <i>Amazon Elastic Container Service Developer Guide</i>.
class RuntimePlatform {
  /// The CPU architecture.
  ///
  /// You can run your Linux tasks on an ARM-based platform by setting the value
  /// to <code>ARM64</code>. This option is available for tasks that run on Linux
  /// Amazon EC2 instance or Linux containers on Fargate.
  final CPUArchitecture? cpuArchitecture;

  /// The operating system.
  final OSFamily? operatingSystemFamily;

  RuntimePlatform({
    this.cpuArchitecture,
    this.operatingSystemFamily,
  });

  factory RuntimePlatform.fromJson(Map<String, dynamic> json) {
    return RuntimePlatform(
      cpuArchitecture:
          (json['cpuArchitecture'] as String?)?.toCPUArchitecture(),
      operatingSystemFamily:
          (json['operatingSystemFamily'] as String?)?.toOSFamily(),
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitecture = this.cpuArchitecture;
    final operatingSystemFamily = this.operatingSystemFamily;
    return {
      if (cpuArchitecture != null) 'cpuArchitecture': cpuArchitecture.toValue(),
      if (operatingSystemFamily != null)
        'operatingSystemFamily': operatingSystemFamily.toValue(),
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

extension ScaleUnitValueExtension on ScaleUnit {
  String toValue() {
    switch (this) {
      case ScaleUnit.percent:
        return 'PERCENT';
    }
  }
}

extension ScaleUnitFromString on String {
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

extension SchedulingStrategyValueExtension on SchedulingStrategy {
  String toValue() {
    switch (this) {
      case SchedulingStrategy.replica:
        return 'REPLICA';
      case SchedulingStrategy.daemon:
        return 'DAEMON';
    }
  }
}

extension SchedulingStrategyFromString on String {
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

extension ScopeValueExtension on Scope {
  String toValue() {
    switch (this) {
      case Scope.task:
        return 'task';
      case Scope.shared:
        return 'shared';
    }
  }
}

extension ScopeFromString on String {
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
/// sensitive data</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>.
class Secret {
  /// The name of the secret.
  final String name;

  /// The secret to expose to the container. The supported values are either the
  /// full ARN of the Secrets Manager secret or the full ARN of the parameter in
  /// the SSM Parameter Store.
  ///
  /// For information about the require Identity and Access Management
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-secrets.html#secrets-iam">Required
  /// IAM permissions for Amazon ECS secrets</a> (for Secrets Manager) or <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-parameters.html">Required
  /// IAM permissions for Amazon ECS secrets</a> (for Systems Manager Parameter
  /// store) in the <i>Amazon Elastic Container Service Developer Guide</i>.
  /// <note>
  /// If the SSM Parameter Store parameter exists in the same Region as the task
  /// you're launching, then you can use either the full ARN or name of the
  /// parameter. If the parameter exists in a different Region, then the full ARN
  /// must be specified.
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

/// Details on a service within a cluster.
class Service {
  /// The capacity provider strategy the service uses. When using the
  /// DescribeServices API, this field is omitted if the service was created using
  /// a launch type.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// The Amazon Resource Name (ARN) of the cluster that hosts the service.
  final String? clusterArn;

  /// The Unix timestamp for the time when the service was created.
  final DateTime? createdAt;

  /// The principal that created the service.
  final String? createdBy;

  /// Optional deployment parameters that control how many tasks run during the
  /// deployment and the ordering of stopping and starting tasks.
  final DeploymentConfiguration? deploymentConfiguration;

  /// The deployment controller type the service is using.
  final DeploymentController? deploymentController;

  /// The current state of deployments for the service.
  final List<Deployment>? deployments;

  /// The desired number of instantiations of the task definition to keep running
  /// on the service. This value is specified when the service is created with
  /// <a>CreateService</a>, and it can be modified with <a>UpdateService</a>.
  final int? desiredCount;

  /// Determines whether to use Amazon ECS managed tags for the tasks in the
  /// service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final bool? enableECSManagedTags;

  /// Determines whether the execute command functionality is turned on for the
  /// service. If <code>true</code>, the execute command functionality is turned
  /// on for all containers in tasks as part of the service.
  final bool? enableExecuteCommand;

  /// The event stream for your service. A maximum of 100 of the latest events are
  /// displayed.
  final List<ServiceEvent>? events;

  /// The period of time, in seconds, that the Amazon ECS service scheduler
  /// ignores unhealthy Elastic Load Balancing target health checks after a task
  /// has first started.
  final int? healthCheckGracePeriodSeconds;

  /// The launch type the service is using. When using the DescribeServices API,
  /// this field is omitted if the service was created using a capacity provider
  /// strategy.
  final LaunchType? launchType;

  /// A list of Elastic Load Balancing load balancer objects. It contains the load
  /// balancer name, the container name, and the container port to access from the
  /// load balancer. The container name is as it appears in a container
  /// definition.
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

  /// The operating system that your tasks in the service run on. A platform
  /// family is specified only for tasks using the Fargate launch type.
  ///
  /// All tasks that run as part of this service must use the same
  /// <code>platformFamily</code> value as the service (for example,
  /// <code>LINUX</code>).
  final String? platformFamily;

  /// The platform version to run your service on. A platform version is only
  /// specified for tasks that are hosted on Fargate. If one isn't specified, the
  /// <code>LATEST</code> platform version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// Determines whether to propagate the tags from the task definition or the
  /// service to the task. If no value is specified, the tags aren't propagated.
  final PropagateTags? propagateTags;

  /// The ARN of the IAM role that's associated with the service. It allows the
  /// Amazon ECS container agent to register container instances with an Elastic
  /// Load Balancing load balancer.
  final String? roleArn;

  /// The number of tasks in the cluster that are in the <code>RUNNING</code>
  /// state.
  final int? runningCount;

  /// The scheduling strategy to use for the service. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html">Services</a>.
  ///
  /// There are two service scheduler strategies available.
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
  /// on each active container instance. This task meets all of the task placement
  /// constraints that you specify in your cluster. The service scheduler also
  /// evaluates the task placement constraints for running tasks. It stop tasks
  /// that don't meet the placement constraints.
  /// <note>
  /// Fargate tasks don't support the <code>DAEMON</code> scheduling strategy.
  /// </note> </li>
  /// </ul>
  final SchedulingStrategy? schedulingStrategy;

  /// The ARN that identifies the service. For more information about the ARN
  /// format, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids">Amazon
  /// Resource Name (ARN)</a> in the <i>Amazon ECS Developer Guide</i>.
  final String? serviceArn;

  /// The name of your service. Up to 255 letters (uppercase and lowercase),
  /// numbers, underscores, and hyphens are allowed. Service names must be unique
  /// within a cluster. However, you can have similarly named services in multiple
  /// clusters within a Region or across multiple Regions.
  final String? serviceName;

  /// The details for the service discovery registries to assign to this service.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// Discovery</a>.
  final List<ServiceRegistry>? serviceRegistries;

  /// The status of the service. The valid values are <code>ACTIVE</code>,
  /// <code>DRAINING</code>, or <code>INACTIVE</code>.
  final String? status;

  /// The metadata that you apply to the service to help you categorize and
  /// organize them. Each tag consists of a key and an optional value. You define
  /// bot the key and value.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The task definition to use for tasks in the service. This value is specified
  /// when the service is created with <a>CreateService</a>, and it can be
  /// modified with <a>UpdateService</a>.
  final String? taskDefinition;

  /// Information about a set of Amazon ECS tasks in either an CodeDeploy or an
  /// <code>EXTERNAL</code> deployment. An Amazon ECS task set includes details
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
    this.platformFamily,
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
      platformFamily: json['platformFamily'] as String?,
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
    final platformFamily = this.platformFamily;
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
      if (platformFamily != null) 'platformFamily': platformFamily,
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

/// Each alias ("endpoint") is a fully-qualified name and port number that other
/// tasks ("clients") can use to connect to this service.
///
/// Each name and port mapping must be unique within the namespace.
///
/// Tasks that run in a namespace can use short names to connect to services in
/// the namespace. Tasks can connect to services across all of the clusters in
/// the namespace. Tasks connect through a managed proxy container that collects
/// logs and metrics for increased visibility. Only the tasks that Amazon ECS
/// services create are supported with Service Connect. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
/// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class ServiceConnectClientAlias {
  /// The listening port number for the Service Connect proxy. This port is
  /// available inside of all of the tasks within the same namespace.
  ///
  /// To avoid changing your applications in client Amazon ECS services, set this
  /// to the same port that the client application uses by default. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final int port;

  /// The <code>dnsName</code> is the name that you use in the applications of
  /// client tasks to connect to this service. The name must be a valid DNS name
  /// but doesn't need to be fully-qualified. The name can include up to 127
  /// characters. The name can include lowercase letters, numbers, underscores
  /// (_), hyphens (-), and periods (.). The name can't start with a hyphen.
  ///
  /// If this parameter isn't specified, the default value of
  /// <code>discoveryName.namespace</code> is used. If the
  /// <code>discoveryName</code> isn't specified, the port mapping name from the
  /// task definition is used in <code>portName.namespace</code>.
  ///
  /// To avoid changing your applications in client Amazon ECS services, set this
  /// to the same name that the client application uses by default. For example, a
  /// few common names are <code>database</code>, <code>db</code>, or the
  /// lowercase name of a database, such as <code>mysql</code> or
  /// <code>redis</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
  /// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
  final String? dnsName;

  ServiceConnectClientAlias({
    required this.port,
    this.dnsName,
  });

  factory ServiceConnectClientAlias.fromJson(Map<String, dynamic> json) {
    return ServiceConnectClientAlias(
      port: json['port'] as int,
      dnsName: json['dnsName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final dnsName = this.dnsName;
    return {
      'port': port,
      if (dnsName != null) 'dnsName': dnsName,
    };
  }
}

/// The Service Connect configuration of your Amazon ECS service. The
/// configuration for this service to discover and connect to services, and be
/// discovered by, and connected from, other services within a namespace.
///
/// Tasks that run in a namespace can use short names to connect to services in
/// the namespace. Tasks can connect to services across all of the clusters in
/// the namespace. Tasks connect through a managed proxy container that collects
/// logs and metrics for increased visibility. Only the tasks that Amazon ECS
/// services create are supported with Service Connect. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
/// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class ServiceConnectConfiguration {
  /// Specifies whether to use Service Connect with this service.
  final bool enabled;
  final LogConfiguration? logConfiguration;

  /// The namespace name or full Amazon Resource Name (ARN) of the Cloud Map
  /// namespace for use with Service Connect. The namespace must be in the same
  /// Amazon Web Services Region as the Amazon ECS service and cluster. The type
  /// of namespace doesn't affect Service Connect. For more information about
  /// Cloud Map, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/dg/working-with-services.html">Working
  /// with Services</a> in the <i>Cloud Map Developer Guide</i>.
  final String? namespace;

  /// The list of Service Connect service objects. These are names and aliases
  /// (also known as endpoints) that are used by other Amazon ECS services to
  /// connect to this service.
  ///
  /// This field is not required for a "client" Amazon ECS service that's a member
  /// of a namespace only to connect to other services within the namespace. An
  /// example of this would be a frontend application that accepts incoming
  /// requests from either a load balancer that's attached to the service or by
  /// other means.
  ///
  /// An object selects a port from the task definition, assigns a name for the
  /// Cloud Map service, and a list of aliases (endpoints) and ports for client
  /// applications to refer to this service.
  final List<ServiceConnectService>? services;

  ServiceConnectConfiguration({
    required this.enabled,
    this.logConfiguration,
    this.namespace,
    this.services,
  });

  factory ServiceConnectConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceConnectConfiguration(
      enabled: json['enabled'] as bool,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      namespace: json['namespace'] as String?,
      services: (json['services'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceConnectService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logConfiguration = this.logConfiguration;
    final namespace = this.namespace;
    final services = this.services;
    return {
      'enabled': enabled,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (namespace != null) 'namespace': namespace,
      if (services != null) 'services': services,
    };
  }
}

/// The Service Connect service object configuration. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html">Service
/// Connect</a> in the <i>Amazon Elastic Container Service Developer Guide</i>.
class ServiceConnectService {
  /// The <code>portName</code> must match the name of one of the
  /// <code>portMappings</code> from all the containers in the task definition of
  /// this Amazon ECS service.
  final String portName;

  /// The list of client aliases for this Service Connect service. You use these
  /// to assign names that can be used by client applications. The maximum number
  /// of client aliases that you can have in this list is 1.
  ///
  /// Each alias ("endpoint") is a fully-qualified name and port number that other
  /// Amazon ECS tasks ("clients") can use to connect to this service.
  ///
  /// Each name and port mapping must be unique within the namespace.
  ///
  /// For each <code>ServiceConnectService</code>, you must provide at least one
  /// <code>clientAlias</code> with one <code>port</code>.
  final List<ServiceConnectClientAlias>? clientAliases;

  /// The <code>discoveryName</code> is the name of the new Cloud Map service that
  /// Amazon ECS creates for this Amazon ECS service. This must be unique within
  /// the Cloud Map namespace. The name can contain up to 64 characters. The name
  /// can include lowercase letters, numbers, underscores (_), and hyphens (-).
  /// The name can't start with a hyphen.
  ///
  /// If the <code>discoveryName</code> isn't specified, the port mapping name
  /// from the task definition is used in <code>portName.namespace</code>.
  final String? discoveryName;

  /// The port number for the Service Connect proxy to listen on.
  ///
  /// Use the value of this field to bypass the proxy for traffic on the port
  /// number specified in the named <code>portMapping</code> in the task
  /// definition of this application, and then use it in your VPC security groups
  /// to allow traffic into the proxy for this Amazon ECS service.
  ///
  /// In <code>awsvpc</code> mode and Fargate, the default value is the container
  /// port number. The container port number is in the <code>portMapping</code> in
  /// the task definition. In bridge mode, the default value is the ephemeral port
  /// of the Service Connect proxy.
  final int? ingressPortOverride;

  /// A reference to an object that represents the configured timeouts for Service
  /// Connect.
  final TimeoutConfiguration? timeout;

  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// configuration.
  final ServiceConnectTlsConfiguration? tls;

  ServiceConnectService({
    required this.portName,
    this.clientAliases,
    this.discoveryName,
    this.ingressPortOverride,
    this.timeout,
    this.tls,
  });

  factory ServiceConnectService.fromJson(Map<String, dynamic> json) {
    return ServiceConnectService(
      portName: json['portName'] as String,
      clientAliases: (json['clientAliases'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServiceConnectClientAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      discoveryName: json['discoveryName'] as String?,
      ingressPortOverride: json['ingressPortOverride'] as int?,
      timeout: json['timeout'] != null
          ? TimeoutConfiguration.fromJson(
              json['timeout'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? ServiceConnectTlsConfiguration.fromJson(
              json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portName = this.portName;
    final clientAliases = this.clientAliases;
    final discoveryName = this.discoveryName;
    final ingressPortOverride = this.ingressPortOverride;
    final timeout = this.timeout;
    final tls = this.tls;
    return {
      'portName': portName,
      if (clientAliases != null) 'clientAliases': clientAliases,
      if (discoveryName != null) 'discoveryName': discoveryName,
      if (ingressPortOverride != null)
        'ingressPortOverride': ingressPortOverride,
      if (timeout != null) 'timeout': timeout,
      if (tls != null) 'tls': tls,
    };
  }
}

/// The Service Connect resource. Each configuration maps a discovery name to a
/// Cloud Map service name. The data is stored in Cloud Map as part of the
/// Service Connect configuration for each discovery name of this Amazon ECS
/// service.
///
/// A task can resolve the <code>dnsName</code> for each of the
/// <code>clientAliases</code> of a service. However a task can't resolve the
/// discovery names. If you want to connect to a service, refer to the
/// <code>ServiceConnectConfiguration</code> of that service for the list of
/// <code>clientAliases</code> that you can use.
class ServiceConnectServiceResource {
  /// The Amazon Resource Name (ARN) for the namespace in Cloud Map that matches
  /// the discovery name for this Service Connect resource. You can use this ARN
  /// in other integrations with Cloud Map. However, Service Connect can't ensure
  /// connectivity outside of Amazon ECS.
  final String? discoveryArn;

  /// The discovery name of this Service Connect resource.
  ///
  /// The <code>discoveryName</code> is the name of the new Cloud Map service that
  /// Amazon ECS creates for this Amazon ECS service. This must be unique within
  /// the Cloud Map namespace. The name can contain up to 64 characters. The name
  /// can include lowercase letters, numbers, underscores (_), and hyphens (-).
  /// The name can't start with a hyphen.
  ///
  /// If the <code>discoveryName</code> isn't specified, the port mapping name
  /// from the task definition is used in <code>portName.namespace</code>.
  final String? discoveryName;

  ServiceConnectServiceResource({
    this.discoveryArn,
    this.discoveryName,
  });

  factory ServiceConnectServiceResource.fromJson(Map<String, dynamic> json) {
    return ServiceConnectServiceResource(
      discoveryArn: json['discoveryArn'] as String?,
      discoveryName: json['discoveryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryArn = this.discoveryArn;
    final discoveryName = this.discoveryName;
    return {
      if (discoveryArn != null) 'discoveryArn': discoveryArn,
      if (discoveryName != null) 'discoveryName': discoveryName,
    };
  }
}

/// An object that represents the Amazon Web Services Private Certificate
/// Authority certificate.
class ServiceConnectTlsCertificateAuthority {
  /// The ARN of the Amazon Web Services Private Certificate Authority
  /// certificate.
  final String? awsPcaAuthorityArn;

  ServiceConnectTlsCertificateAuthority({
    this.awsPcaAuthorityArn,
  });

  factory ServiceConnectTlsCertificateAuthority.fromJson(
      Map<String, dynamic> json) {
    return ServiceConnectTlsCertificateAuthority(
      awsPcaAuthorityArn: json['awsPcaAuthorityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsPcaAuthorityArn = this.awsPcaAuthorityArn;
    return {
      if (awsPcaAuthorityArn != null) 'awsPcaAuthorityArn': awsPcaAuthorityArn,
    };
  }
}

/// An object that represents the configuration for Service Connect TLS.
class ServiceConnectTlsConfiguration {
  /// The signer certificate authority.
  final ServiceConnectTlsCertificateAuthority issuerCertificateAuthority;

  /// The Amazon Web Services Key Management Service key.
  final String? kmsKey;

  /// The Amazon Resource Name (ARN) of the IAM role that's associated with the
  /// Service Connect TLS.
  final String? roleArn;

  ServiceConnectTlsConfiguration({
    required this.issuerCertificateAuthority,
    this.kmsKey,
    this.roleArn,
  });

  factory ServiceConnectTlsConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceConnectTlsConfiguration(
      issuerCertificateAuthority:
          ServiceConnectTlsCertificateAuthority.fromJson(
              json['issuerCertificateAuthority'] as Map<String, dynamic>),
      kmsKey: json['kmsKey'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final issuerCertificateAuthority = this.issuerCertificateAuthority;
    final kmsKey = this.kmsKey;
    final roleArn = this.roleArn;
    return {
      'issuerCertificateAuthority': issuerCertificateAuthority,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// The details for an event that's associated with a service.
class ServiceEvent {
  /// The Unix timestamp for the time when the event was triggered.
  final DateTime? createdAt;

  /// The ID string for the event.
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

extension ServiceFieldValueExtension on ServiceField {
  String toValue() {
    switch (this) {
      case ServiceField.tags:
        return 'TAGS';
    }
  }
}

extension ServiceFieldFromString on String {
  ServiceField toServiceField() {
    switch (this) {
      case 'TAGS':
        return ServiceField.tags;
    }
    throw Exception('$this is not known in enum ServiceField');
  }
}

/// The configuration for the Amazon EBS volume that Amazon ECS creates and
/// manages on your behalf. These settings are used to create each Amazon EBS
/// volume, with one volume created for each task in the service.
///
/// Many of these parameters map 1:1 with the Amazon EBS
/// <code>CreateVolume</code> API request parameters.
class ServiceManagedEBSVolumeConfiguration {
  /// The ARN of the IAM role to associate with this volume. This is the Amazon
  /// ECS infrastructure IAM role that is used to manage your Amazon Web Services
  /// infrastructure. We recommend using the Amazon ECS-managed
  /// <code>AmazonECSInfrastructureRolePolicyForVolumes</code> IAM policy with
  /// this role. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html">Amazon
  /// ECS infrastructure IAM role</a> in the <i>Amazon ECS Developer Guide</i>.
  final String roleArn;

  /// Indicates whether the volume should be encrypted. If no value is specified,
  /// encryption is turned on by default. This parameter maps 1:1 with the
  /// <code>Encrypted</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final bool? encrypted;

  /// The Linux filesystem type for the volume. For volumes created from a
  /// snapshot, you must specify the same filesystem type that the volume was
  /// using when the snapshot was created. If there is a filesystem type mismatch,
  /// the task will fail to start.
  ///
  /// The available filesystem types are&#x2028; <code>ext3</code>,
  /// <code>ext4</code>, and <code>xfs</code>. If no value is specified, the
  /// <code>xfs</code> filesystem type is used by default.
  final TaskFilesystemType? filesystemType;

  /// The number of I/O operations per second (IOPS). For <code>gp3</code>,
  /// <code>io1</code>, and <code>io2</code> volumes, this represents the number
  /// of IOPS that are provisioned for the volume. For <code>gp2</code> volumes,
  /// this represents the baseline performance of the volume and the rate at which
  /// the volume accumulates I/O credits for bursting.
  ///
  /// The following are the supported values for each volume type.
  ///
  /// <ul>
  /// <li>
  /// <code>gp3</code>: 3,000 - 16,000 IOPS
  /// </li>
  /// <li>
  /// <code>io1</code>: 100 - 64,000 IOPS
  /// </li>
  /// <li>
  /// <code>io2</code>: 100 - 256,000 IOPS
  /// </li>
  /// </ul>
  /// This parameter is required for <code>io1</code> and <code>io2</code> volume
  /// types. The default for <code>gp3</code> volumes is <code>3,000 IOPS</code>.
  /// This parameter is not supported for <code>st1</code>, <code>sc1</code>, or
  /// <code>standard</code> volume types.
  ///
  /// This parameter maps 1:1 with the <code>Iops</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final int? iops;

  /// The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key
  /// Management Service key to use for Amazon EBS encryption. When encryption is
  /// turned on and no Amazon Web Services Key Management Service key is
  /// specified, the default Amazon Web Services managed key for Amazon EBS
  /// volumes is used. This parameter maps 1:1 with the <code>KmsKeyId</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  /// <important>
  /// Amazon Web Services authenticates the Amazon Web Services Key Management
  /// Service key asynchronously. Therefore, if you specify an ID, alias, or ARN
  /// that is invalid, the action can appear to complete, but eventually fails.
  /// </important>
  final String? kmsKeyId;

  /// The size of the volume in GiB. You must specify either a volume size or a
  /// snapshot ID. If you specify a snapshot ID, the snapshot size is used for the
  /// volume size by default. You can optionally specify a volume size greater
  /// than or equal to the snapshot size. This parameter maps 1:1 with the
  /// <code>Size</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// The following are the supported volume size values for each volume type.
  ///
  /// <ul>
  /// <li>
  /// <code>gp2</code> and <code>gp3</code>: 1-16,384
  /// </li>
  /// <li>
  /// <code>io1</code> and <code>io2</code>: 4-16,384
  /// </li>
  /// <li>
  /// <code>st1</code> and <code>sc1</code>: 125-16,384
  /// </li>
  /// <li>
  /// <code>standard</code>: 1-1,024
  /// </li>
  /// </ul>
  final int? sizeInGiB;

  /// The snapshot that Amazon ECS uses to create the volume. You must specify
  /// either a snapshot ID or a volume size. This parameter maps 1:1 with the
  /// <code>SnapshotId</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final String? snapshotId;

  /// The tags to apply to the volume. Amazon ECS applies service-managed tags by
  /// default. This parameter maps 1:1 with the <code>TagSpecifications.N</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final List<EBSTagSpecification>? tagSpecifications;

  /// The throughput to provision for a volume, in MiB/s, with a maximum of 1,000
  /// MiB/s. This parameter maps 1:1 with the <code>Throughput</code> parameter of
  /// the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  /// <important>
  /// This parameter is only supported for the <code>gp3</code> volume type.
  /// </important>
  final int? throughput;

  /// The volume type. This parameter maps 1:1 with the <code>VolumeType</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html">Amazon
  /// EBS volume types</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// The following are the supported volume types.
  ///
  /// <ul>
  /// <li>
  /// General Purpose SSD: <code>gp2</code>|<code>gp3</code>
  /// </li>
  /// <li>
  /// Provisioned IOPS SSD: <code>io1</code>|<code>io2</code>
  /// </li>
  /// <li>
  /// Throughput Optimized HDD: <code>st1</code>
  /// </li>
  /// <li>
  /// Cold HDD: <code>sc1</code>
  /// </li>
  /// <li>
  /// Magnetic: <code>standard</code>
  /// <note>
  /// The magnetic volume type is not supported on Fargate.
  /// </note> </li>
  /// </ul>
  final String? volumeType;

  ServiceManagedEBSVolumeConfiguration({
    required this.roleArn,
    this.encrypted,
    this.filesystemType,
    this.iops,
    this.kmsKeyId,
    this.sizeInGiB,
    this.snapshotId,
    this.tagSpecifications,
    this.throughput,
    this.volumeType,
  });

  factory ServiceManagedEBSVolumeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEBSVolumeConfiguration(
      roleArn: json['roleArn'] as String,
      encrypted: json['encrypted'] as bool?,
      filesystemType:
          (json['filesystemType'] as String?)?.toTaskFilesystemType(),
      iops: json['iops'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      sizeInGiB: json['sizeInGiB'] as int?,
      snapshotId: json['snapshotId'] as String?,
      tagSpecifications: (json['tagSpecifications'] as List?)
          ?.whereNotNull()
          .map((e) => EBSTagSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      throughput: json['throughput'] as int?,
      volumeType: json['volumeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final encrypted = this.encrypted;
    final filesystemType = this.filesystemType;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final sizeInGiB = this.sizeInGiB;
    final snapshotId = this.snapshotId;
    final tagSpecifications = this.tagSpecifications;
    final throughput = this.throughput;
    final volumeType = this.volumeType;
    return {
      'roleArn': roleArn,
      if (encrypted != null) 'encrypted': encrypted,
      if (filesystemType != null) 'filesystemType': filesystemType.toValue(),
      if (iops != null) 'iops': iops,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (sizeInGiB != null) 'sizeInGiB': sizeInGiB,
      if (snapshotId != null) 'snapshotId': snapshotId,
      if (tagSpecifications != null) 'tagSpecifications': tagSpecifications,
      if (throughput != null) 'throughput': throughput,
      if (volumeType != null) 'volumeType': volumeType,
    };
  }
}

/// The details for the service registry.
///
/// Each service may be associated with one service registry. Multiple service
/// registries for each service are not supported.
///
/// When you add, update, or remove the service registries configuration, Amazon
/// ECS starts a new deployment. New tasks are registered and deregistered to
/// the updated service registry configuration.
class ServiceRegistry {
  /// The container name value to be used for your service discovery service. It's
  /// already specified in the task definition. If the task definition that your
  /// service task specifies uses the <code>bridge</code> or <code>host</code>
  /// network mode, you must specify a <code>containerName</code> and
  /// <code>containerPort</code> combination from the task definition. If the task
  /// definition that your service task specifies uses the <code>awsvpc</code>
  /// network mode and a type SRV DNS record is used, you must specify either a
  /// <code>containerName</code> and <code>containerPort</code> combination or a
  /// <code>port</code> value. However, you can't specify both.
  final String? containerName;

  /// The port value to be used for your service discovery service. It's already
  /// specified in the task definition. If the task definition your service task
  /// specifies uses the <code>bridge</code> or <code>host</code> network mode,
  /// you must specify a <code>containerName</code> and <code>containerPort</code>
  /// combination from the task definition. If the task definition your service
  /// task specifies uses the <code>awsvpc</code> network mode and a type SRV DNS
  /// record is used, you must specify either a <code>containerName</code> and
  /// <code>containerPort</code> combination or a <code>port</code> value.
  /// However, you can't specify both.
  final int? containerPort;

  /// The port value used if your service discovery service specified an SRV
  /// record. This field might be used if both the <code>awsvpc</code> network
  /// mode and SRV records are used.
  final int? port;

  /// The Amazon Resource Name (ARN) of the service registry. The currently
  /// supported service registry is Cloud Map. For more information, see <a
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

/// The configuration for a volume specified in the task definition as a volume
/// that is configured at launch time. Currently, the only supported volume type
/// is an Amazon EBS volume.
class ServiceVolumeConfiguration {
  /// The name of the volume. This value must match the volume name from the
  /// <code>Volume</code> object in the task definition.
  final String name;

  /// The configuration for the Amazon EBS volume that Amazon ECS creates and
  /// manages on your behalf. These settings are used to create each Amazon EBS
  /// volume, with one volume created for each task in the service. The Amazon EBS
  /// volumes are visible in your account in the Amazon EC2 console once they are
  /// created.
  final ServiceManagedEBSVolumeConfiguration? managedEBSVolume;

  ServiceVolumeConfiguration({
    required this.name,
    this.managedEBSVolume,
  });

  factory ServiceVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceVolumeConfiguration(
      name: json['name'] as String,
      managedEBSVolume: json['managedEBSVolume'] != null
          ? ServiceManagedEBSVolumeConfiguration.fromJson(
              json['managedEBSVolume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final managedEBSVolume = this.managedEBSVolume;
    return {
      'name': name,
      if (managedEBSVolume != null) 'managedEBSVolume': managedEBSVolume,
    };
  }
}

/// The details for the execute command session.
class Session {
  /// The ID of the execute command session.
  final String? sessionId;

  /// A URL to the managed agent on the container that the SSM Session Manager
  /// client uses to send commands and receive output from the container.
  final String? streamUrl;

  /// An encrypted token value containing session and caller information. It's
  /// used to authenticate the connection to the container.
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

  /// The ARN of the principal. It can be a user, role, or the root user. If this
  /// field is omitted, the authenticated user is assumed.
  final String? principalArn;

  /// Indicates whether Amazon Web Services manages the account setting, or if the
  /// user manages it.
  ///
  /// <code>aws_managed</code> account settings are read-only, as Amazon Web
  /// Services manages such on the customer's behalf. Currently, the
  /// <code>guardDutyActivate</code> account setting is the only one Amazon Web
  /// Services manages.
  final SettingType? type;

  /// Determines whether the account setting is on or off for the specified
  /// resource.
  final String? value;

  Setting({
    this.name,
    this.principalArn,
    this.type,
    this.value,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      name: (json['name'] as String?)?.toSettingName(),
      principalArn: json['principalArn'] as String?,
      type: (json['type'] as String?)?.toSettingType(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final principalArn = this.principalArn;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (principalArn != null) 'principalArn': principalArn,
      if (type != null) 'type': type.toValue(),
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
  fargateFIPSMode,
  tagResourceAuthorization,
  fargateTaskRetirementWaitPeriod,
  guardDutyActivate,
}

extension SettingNameValueExtension on SettingName {
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
      case SettingName.fargateFIPSMode:
        return 'fargateFIPSMode';
      case SettingName.tagResourceAuthorization:
        return 'tagResourceAuthorization';
      case SettingName.fargateTaskRetirementWaitPeriod:
        return 'fargateTaskRetirementWaitPeriod';
      case SettingName.guardDutyActivate:
        return 'guardDutyActivate';
    }
  }
}

extension SettingNameFromString on String {
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
      case 'fargateFIPSMode':
        return SettingName.fargateFIPSMode;
      case 'tagResourceAuthorization':
        return SettingName.tagResourceAuthorization;
      case 'fargateTaskRetirementWaitPeriod':
        return SettingName.fargateTaskRetirementWaitPeriod;
      case 'guardDutyActivate':
        return SettingName.guardDutyActivate;
    }
    throw Exception('$this is not known in enum SettingName');
  }
}

enum SettingType {
  user,
  awsManaged,
}

extension SettingTypeValueExtension on SettingType {
  String toValue() {
    switch (this) {
      case SettingType.user:
        return 'user';
      case SettingType.awsManaged:
        return 'aws_managed';
    }
  }
}

extension SettingTypeFromString on String {
  SettingType toSettingType() {
    switch (this) {
      case 'user':
        return SettingType.user;
      case 'aws_managed':
        return SettingType.awsManaged;
    }
    throw Exception('$this is not known in enum SettingType');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension SortOrderFromString on String {
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

extension StabilityStatusValueExtension on StabilityStatus {
  String toValue() {
    switch (this) {
      case StabilityStatus.steadyState:
        return 'STEADY_STATE';
      case StabilityStatus.stabilizing:
        return 'STABILIZING';
    }
  }
}

extension StabilityStatusFromString on String {
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
/// run</a>. For example, you can configure
/// <code>net.ipv4.tcp_keepalive_time</code> setting to maintain longer lived
/// connections.
///
/// We don't recommend that you specify network-related
/// <code>systemControls</code> parameters for multiple containers in a single
/// task that also uses either the <code>awsvpc</code> or <code>host</code>
/// network mode. Doing this has the following disadvantages:
///
/// <ul>
/// <li>
/// For tasks that use the <code>awsvpc</code> network mode including Fargate,
/// if you set <code>systemControls</code> for any container, it applies to all
/// containers in the task. If you set different <code>systemControls</code> for
/// multiple containers in a single task, the container that's started last
/// determines which <code>systemControls</code> take effect.
/// </li>
/// <li>
/// For tasks that use the <code>host</code> network mode, the network namespace
/// <code>systemControls</code> aren't supported.
/// </li>
/// </ul>
/// If you're setting an IPC resource namespace to use for the containers in the
/// task, the following conditions apply to your system controls. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_definition_ipcmode">IPC
/// mode</a>.
///
/// <ul>
/// <li>
/// For tasks that use the <code>host</code> IPC mode, IPC namespace
/// <code>systemControls</code> aren't supported.
/// </li>
/// <li>
/// For tasks that use the <code>task</code> IPC mode, IPC namespace
/// <code>systemControls</code> values apply to all containers within a task.
/// </li>
/// </ul> <note>
/// This parameter is not supported for Windows containers.
/// </note> <note>
/// This parameter is only supported for tasks that are hosted on Fargate if the
/// tasks are using platform version <code>1.4.0</code> or later (Linux). This
/// isn't supported for Windows containers on Fargate.
/// </note>
class SystemControl {
  /// The namespaced kernel parameter to set a <code>value</code> for.
  final String? namespace;

  /// The namespaced kernel parameter to set a <code>value</code> for.
  ///
  /// Valid IPC namespace values: <code>"kernel.msgmax" | "kernel.msgmnb" |
  /// "kernel.msgmni" | "kernel.sem" | "kernel.shmall" | "kernel.shmmax" |
  /// "kernel.shmmni" | "kernel.shm_rmid_forced"</code>, and <code>Sysctls</code>
  /// that start with <code>"fs.mqueue.*"</code>
  ///
  /// Valid network namespace values: <code>Sysctls</code> that start with
  /// <code>"net.*"</code>
  ///
  /// All of these values are supported by Fargate.
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
/// organize them. Each tag consists of a key and an optional value. You define
/// them.
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
/// for Amazon Web Services use. You cannot edit or delete tag keys or values
/// with this prefix. Tags with this prefix do not count against your tags per
/// resource limit.
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

extension TargetTypeValueExtension on TargetType {
  String toValue() {
    switch (this) {
      case TargetType.containerInstance:
        return 'container-instance';
    }
  }
}

extension TargetTypeFromString on String {
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
  /// The Elastic Network Adapter that's associated with the task if the task uses
  /// the <code>awsvpc</code> network mode.
  final List<Attachment>? attachments;

  /// The attributes of the task
  final List<Attribute>? attributes;

  /// The Availability Zone for the task.
  final String? availabilityZone;

  /// The capacity provider that's associated with the task.
  final String? capacityProviderName;

  /// The ARN of the cluster that hosts the task.
  final String? clusterArn;

  /// The connectivity status of a task.
  final Connectivity? connectivity;

  /// The Unix timestamp for the time when the task last went into
  /// <code>CONNECTED</code> status.
  final DateTime? connectivityAt;

  /// The ARN of the container instances that host the task.
  final String? containerInstanceArn;

  /// The containers that's associated with the task.
  final List<Container>? containers;

  /// The number of CPU units used by the task as expressed in a task definition.
  /// It can be expressed as an integer using CPU units (for example,
  /// <code>1024</code>). It can also be expressed as a string using vCPUs (for
  /// example, <code>1 vCPU</code> or <code>1 vcpu</code>). String values are
  /// converted to an integer that indicates the CPU units when the task
  /// definition is registered.
  ///
  /// If you use the EC2 launch type, this field is optional. Supported values are
  /// between <code>128</code> CPU units (<code>0.125</code> vCPUs) and
  /// <code>10240</code> CPU units (<code>10</code> vCPUs).
  ///
  /// If you use the Fargate launch type, this field is required. You must use one
  /// of the following values. These values determine the range of supported
  /// values for the <code>memory</code> parameter:
  ///
  /// The CPU units cannot be less than 1 vCPU when you use Windows containers on
  /// Fargate.
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
  /// 2048 (2 vCPU) - Available <code>memory</code> values: 4096 (4 GB) and 16384
  /// (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: 8192 (8 GB) and 30720
  /// (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 8192 (8 vCPU) - Available <code>memory</code> values: 16 GB and 60 GB in 4
  /// GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// 16384 (16vCPU) - Available <code>memory</code> values: 32GB and 120 GB in 8
  /// GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// </ul>
  final String? cpu;

  /// The Unix timestamp for the time when the task was created. More
  /// specifically, it's for the time when the task entered the
  /// <code>PENDING</code> state.
  final DateTime? createdAt;

  /// The desired status of the task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html">Task
  /// Lifecycle</a>.
  final String? desiredStatus;

  /// Determines whether execute command functionality is turned on for this task.
  /// If <code>true</code>, execute command functionality is turned on all the
  /// containers in the task.
  final bool? enableExecuteCommand;

  /// The ephemeral storage settings for the task.
  final EphemeralStorage? ephemeralStorage;

  /// The Unix timestamp for the time when the task execution stopped.
  final DateTime? executionStoppedAt;

  /// The name of the task group that's associated with the task.
  final String? group;

  /// The health status for the task. It's determined by the health of the
  /// essential containers in the task. If all essential containers in the task
  /// are reporting as <code>HEALTHY</code>, the task status also reports as
  /// <code>HEALTHY</code>. If any essential containers in the task are reporting
  /// as <code>UNHEALTHY</code> or <code>UNKNOWN</code>, the task status also
  /// reports as <code>UNHEALTHY</code> or <code>UNKNOWN</code>.
  /// <note>
  /// The Amazon ECS container agent doesn't monitor or report on Docker health
  /// checks that are embedded in a container image and not specified in the
  /// container definition. For example, this includes those specified in a parent
  /// image or from the image's Dockerfile. Health check parameters that are
  /// specified in a container definition override any Docker health checks that
  /// are found in the container image.
  /// </note>
  final HealthStatus? healthStatus;

  /// The Elastic Inference accelerator that's associated with the task.
  final List<InferenceAccelerator>? inferenceAccelerators;

  /// The last known status for the task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-lifecycle.html">Task
  /// Lifecycle</a>.
  final String? lastStatus;

  /// The infrastructure where your task runs on. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// The amount of memory (in MiB) that the task uses as expressed in a task
  /// definition. It can be expressed as an integer using MiB (for example,
  /// <code>1024</code>). If it's expressed as a string using GB (for example,
  /// <code>1GB</code> or <code>1 GB</code>), it's converted to an integer
  /// indicating the MiB when the task definition is registered.
  ///
  /// If you use the EC2 launch type, this field is optional.
  ///
  /// If you use the Fargate launch type, this field is required. You must use one
  /// of the following values. The value that you choose determines the range of
  /// supported values for the <code>cpu</code> parameter.
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
  /// <li>
  /// Between 16 GB and 60 GB in 4 GB increments - Available <code>cpu</code>
  /// values: 8192 (8 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Between 32GB and 120 GB in 8 GB increments - Available <code>cpu</code>
  /// values: 16384 (16 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// </ul>
  final String? memory;

  /// One or more container overrides.
  final TaskOverride? overrides;

  /// The operating system that your tasks are running on. A platform family is
  /// specified only for tasks that use the Fargate launch type.
  ///
  /// All tasks that run as part of this service must use the same
  /// <code>platformFamily</code> value as the service (for example,
  /// <code>LINUX.</code>).
  final String? platformFamily;

  /// The platform version where your task runs on. A platform version is only
  /// specified for tasks that use the Fargate launch type. If you didn't specify
  /// one, the <code>LATEST</code> platform version is used. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// Platform Versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// The Unix timestamp for the time when the container image pull began.
  final DateTime? pullStartedAt;

  /// The Unix timestamp for the time when the container image pull completed.
  final DateTime? pullStoppedAt;

  /// The Unix timestamp for the time when the task started. More specifically,
  /// it's for the time when the task transitioned from the <code>PENDING</code>
  /// state to the <code>RUNNING</code> state.
  final DateTime? startedAt;

  /// The tag specified when a task is started. If an Amazon ECS service started
  /// the task, the <code>startedBy</code> parameter contains the deployment ID of
  /// that service.
  final String? startedBy;

  /// The stop code indicating why a task was stopped. The
  /// <code>stoppedReason</code> might contain additional details.
  ///
  /// For more information about stop code, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/stopped-task-error-codes.html">Stopped
  /// tasks error codes</a> in the <i>Amazon ECS Developer Guide</i>.
  final TaskStopCode? stopCode;

  /// The Unix timestamp for the time when the task was stopped. More
  /// specifically, it's for the time when the task transitioned from the
  /// <code>RUNNING</code> state to the <code>STOPPED</code> state.
  final DateTime? stoppedAt;

  /// The reason that the task was stopped.
  final String? stoppedReason;

  /// The Unix timestamp for the time when the task stops. More specifically, it's
  /// for the time when the task transitions from the <code>RUNNING</code> state
  /// to <code>STOPPING</code>.
  final DateTime? stoppingAt;

  /// The metadata that you apply to the task to help you categorize and organize
  /// the task. Each tag consists of a key and an optional value. You define both
  /// the key and value.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The Amazon Resource Name (ARN) of the task.
  final String? taskArn;

  /// The ARN of the task definition that creates the task.
  final String? taskDefinitionArn;

  /// The version counter for the task. Every time a task experiences a change
  /// that starts a CloudWatch event, the version counter is incremented. If you
  /// replicate your Amazon ECS task state with CloudWatch Events, you can compare
  /// the version of a task reported by the Amazon ECS API actions with the
  /// version reported in CloudWatch Events for the task (inside the
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
    this.platformFamily,
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
      platformFamily: json['platformFamily'] as String?,
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
    final platformFamily = this.platformFamily;
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
      if (platformFamily != null) 'platformFamily': platformFamily,
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

  /// The number of <code>cpu</code> units used by the task. If you use the EC2
  /// launch type, this field is optional. Any value can be used. If you use the
  /// Fargate launch type, this field is required. You must use one of the
  /// following values. The value that you choose determines your range of valid
  /// values for the <code>memory</code> parameter.
  ///
  /// The CPU units cannot be less than 1 vCPU when you use Windows containers on
  /// Fargate.
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
  /// 2048 (2 vCPU) - Available <code>memory</code> values: 4096 (4 GB) and 16384
  /// (16 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 4096 (4 vCPU) - Available <code>memory</code> values: 8192 (8 GB) and 30720
  /// (30 GB) in increments of 1024 (1 GB)
  /// </li>
  /// <li>
  /// 8192 (8 vCPU) - Available <code>memory</code> values: 16 GB and 60 GB in 4
  /// GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// 16384 (16vCPU) - Available <code>memory</code> values: 32GB and 120 GB in 8
  /// GB increments
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// </ul>
  final String? cpu;

  /// The Unix timestamp for the time when the task definition was deregistered.
  final DateTime? deregisteredAt;

  /// The ephemeral storage settings to use for tasks run with the task
  /// definition.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the task execution role that grants the
  /// Amazon ECS container agent permission to make Amazon Web Services API calls
  /// on your behalf. The task execution IAM role is required depending on the
  /// requirements of your task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html">Amazon
  /// ECS task execution IAM role</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? executionRoleArn;

  /// The name of a family that this task definition is registered to. Up to 255
  /// characters are allowed. Letters (both uppercase and lowercase letters),
  /// numbers, hyphens (-), and underscores (_) are allowed.
  ///
  /// A family groups multiple versions of a task definition. Amazon ECS gives the
  /// first task definition that you registered to a family a revision number of
  /// 1. Amazon ECS gives sequential revision numbers to each task definition that
  /// you add.
  final String? family;

  /// The Elastic Inference accelerator that's associated with the task.
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
  /// This parameter is not supported for Windows containers or tasks run on
  /// Fargate.
  /// </note>
  final IpcMode? ipcMode;

  /// The amount (in MiB) of memory used by the task.
  ///
  /// If your tasks runs on Amazon EC2 instances, you must specify either a
  /// task-level memory value or a container-level memory value. This field is
  /// optional and any value can be used. If a task-level memory value is
  /// specified, the container-level memory value is optional. For more
  /// information regarding container-level memory and memory reservation, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html">ContainerDefinition</a>.
  ///
  /// If your tasks runs on Fargate, this field is required. You must use one of
  /// the following values. The value you choose determines your range of valid
  /// values for the <code>cpu</code> parameter.
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
  /// <li>
  /// Between 16 GB and 60 GB in 4 GB increments - Available <code>cpu</code>
  /// values: 8192 (8 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Between 32GB and 120 GB in 8 GB increments - Available <code>cpu</code>
  /// values: 16384 (16 vCPU)
  ///
  /// This option requires Linux platform <code>1.4.0</code> or later.
  /// </li>
  /// </ul>
  final String? memory;

  /// The Docker networking mode to use for the containers in the task. The valid
  /// values are <code>none</code>, <code>bridge</code>, <code>awsvpc</code>, and
  /// <code>host</code>. If no network mode is specified, the default is
  /// <code>bridge</code>.
  ///
  /// For Amazon ECS tasks on Fargate, the <code>awsvpc</code> network mode is
  /// required. For Amazon ECS tasks on Amazon EC2 Linux instances, any network
  /// mode can be used. For Amazon ECS tasks on Amazon EC2 Windows instances,
  /// <code>&lt;default&gt;</code> or <code>awsvpc</code> can be used. If the
  /// network mode is set to <code>none</code>, you cannot specify port mappings
  /// in your container definitions, and the tasks containers do not have external
  /// connectivity. The <code>host</code> and <code>awsvpc</code> network modes
  /// offer the highest networking performance for containers because they use the
  /// EC2 network stack instead of the virtualized network stack provided by the
  /// <code>bridge</code> mode.
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
  ///
  /// If the network mode is <code>host</code>, you cannot run multiple
  /// instantiations of the same task on a single container instance when port
  /// mappings are used.
  ///
  /// For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#network-settings">Network
  /// settings</a> in the <i>Docker run reference</i>.
  final NetworkMode? networkMode;

  /// The process namespace to use for the containers in the task. The valid
  /// values are <code>host</code> or <code>task</code>. On Fargate for Linux
  /// containers, the only valid value is <code>task</code>. For example,
  /// monitoring sidecars might need <code>pidMode</code> to access information
  /// about other containers running in the same task.
  ///
  /// If <code>host</code> is specified, all containers within the tasks that
  /// specified the <code>host</code> PID mode on the same container instance
  /// share the same process namespace with the host Amazon EC2 instance.
  ///
  /// If <code>task</code> is specified, all containers within the specified task
  /// share the same process namespace.
  ///
  /// If no value is specified, the default is a private namespace for each
  /// container. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#pid-settings---pid">PID
  /// settings</a> in the <i>Docker run reference</i>.
  ///
  /// If the <code>host</code> PID mode is used, there's a heightened risk of
  /// undesired process namespace exposure. For more information, see <a
  /// href="https://docs.docker.com/engine/security/security/">Docker
  /// security</a>.
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note> <note>
  /// This parameter is only supported for tasks that are hosted on Fargate if the
  /// tasks are using platform version <code>1.4.0</code> or later (Linux). This
  /// isn't supported for Windows containers on Fargate.
  /// </note>
  final PidMode? pidMode;

  /// An array of placement constraint objects to use for tasks.
  /// <note>
  /// This parameter isn't supported for tasks run on Fargate.
  /// </note>
  final List<TaskDefinitionPlacementConstraint>? placementConstraints;

  /// The configuration details for the App Mesh proxy.
  ///
  /// Your Amazon ECS container instances require at least version 1.26.0 of the
  /// container agent and at least version 1.26.0-1 of the <code>ecs-init</code>
  /// package to use a proxy configuration. If your container instances are
  /// launched from the Amazon ECS optimized AMI version <code>20190301</code> or
  /// later, they contain the required versions of the container agent and
  /// <code>ecs-init</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// ECS-optimized Linux AMI</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final ProxyConfiguration? proxyConfiguration;

  /// The Unix timestamp for the time when the task definition was registered.
  final DateTime? registeredAt;

  /// The principal that registered the task definition.
  final String? registeredBy;

  /// The container instance attributes required by your task. When an Amazon EC2
  /// instance is registered to your cluster, the Amazon ECS container agent
  /// assigns some standard attributes to the instance. You can apply custom
  /// attributes. These are specified as key-value pairs using the Amazon ECS
  /// console or the <a>PutAttributes</a> API. These attributes are used when
  /// determining task placement for tasks hosted on Amazon EC2 instances. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes">Attributes</a>
  /// in the <i>Amazon Elastic Container Service Developer Guide</i>.
  /// <note>
  /// This parameter isn't supported for tasks run on Fargate.
  /// </note>
  final List<Attribute>? requiresAttributes;

  /// The task launch types the task definition was validated against. The valid
  /// values are <code>EC2</code>, <code>FARGATE</code>, and
  /// <code>EXTERNAL</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final List<Compatibility>? requiresCompatibilities;

  /// The revision of the task in a particular family. The revision is a version
  /// number of a task definition in a family. When you register a task definition
  /// for the first time, the revision is <code>1</code>. Each time that you
  /// register a new revision of a task definition in the same family, the
  /// revision value always increases by one. This is even if you deregistered
  /// previous revisions in this family.
  final int? revision;

  /// The operating system that your task definitions are running on. A platform
  /// family is specified only for tasks using the Fargate launch type.
  ///
  /// When you specify a task in a service, this value must match the
  /// <code>runtimePlatform</code> value of the service.
  final RuntimePlatform? runtimePlatform;

  /// The status of the task definition.
  final TaskDefinitionStatus? status;

  /// The full Amazon Resource Name (ARN) of the task definition.
  final String? taskDefinitionArn;

  /// The short name or full Amazon Resource Name (ARN) of the Identity and Access
  /// Management role that grants containers in the task permission to call Amazon
  /// Web Services APIs on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">Amazon
  /// ECS Task Role</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  ///
  /// IAM roles for tasks on Windows require that the
  /// <code>-EnableTaskIAMRole</code> option is set when you launch the Amazon
  /// ECS-optimized Windows AMI. Your containers must also run some configuration
  /// code to use the feature. For more information, see <a
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
  /// The <code>host</code> and <code>sourcePath</code> parameters aren't
  /// supported for tasks run on Fargate.
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
    this.runtimePlatform,
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
      runtimePlatform: json['runtimePlatform'] != null
          ? RuntimePlatform.fromJson(
              json['runtimePlatform'] as Map<String, dynamic>)
          : null,
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
    final runtimePlatform = this.runtimePlatform;
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
      if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
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

extension TaskDefinitionFamilyStatusValueExtension
    on TaskDefinitionFamilyStatus {
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

extension TaskDefinitionFamilyStatusFromString on String {
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

extension TaskDefinitionFieldValueExtension on TaskDefinitionField {
  String toValue() {
    switch (this) {
      case TaskDefinitionField.tags:
        return 'TAGS';
    }
  }
}

extension TaskDefinitionFieldFromString on String {
  TaskDefinitionField toTaskDefinitionField() {
    switch (this) {
      case 'TAGS':
        return TaskDefinitionField.tags;
    }
    throw Exception('$this is not known in enum TaskDefinitionField');
  }
}

/// The constraint on task placement in the task definition. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html">Task
/// placement constraints</a> in the <i>Amazon Elastic Container Service
/// Developer Guide</i>.
/// <note>
/// Task placement constraints aren't supported for tasks run on Fargate.
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

extension TaskDefinitionPlacementConstraintTypeValueExtension
    on TaskDefinitionPlacementConstraintType {
  String toValue() {
    switch (this) {
      case TaskDefinitionPlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension TaskDefinitionPlacementConstraintTypeFromString on String {
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
  deleteInProgress,
}

extension TaskDefinitionStatusValueExtension on TaskDefinitionStatus {
  String toValue() {
    switch (this) {
      case TaskDefinitionStatus.active:
        return 'ACTIVE';
      case TaskDefinitionStatus.inactive:
        return 'INACTIVE';
      case TaskDefinitionStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
    }
  }
}

extension TaskDefinitionStatusFromString on String {
  TaskDefinitionStatus toTaskDefinitionStatus() {
    switch (this) {
      case 'ACTIVE':
        return TaskDefinitionStatus.active;
      case 'INACTIVE':
        return TaskDefinitionStatus.inactive;
      case 'DELETE_IN_PROGRESS':
        return TaskDefinitionStatus.deleteInProgress;
    }
    throw Exception('$this is not known in enum TaskDefinitionStatus');
  }
}

enum TaskField {
  tags,
}

extension TaskFieldValueExtension on TaskField {
  String toValue() {
    switch (this) {
      case TaskField.tags:
        return 'TAGS';
    }
  }
}

extension TaskFieldFromString on String {
  TaskField toTaskField() {
    switch (this) {
      case 'TAGS':
        return TaskField.tags;
    }
    throw Exception('$this is not known in enum TaskField');
  }
}

enum TaskFilesystemType {
  ext3,
  ext4,
  xfs,
}

extension TaskFilesystemTypeValueExtension on TaskFilesystemType {
  String toValue() {
    switch (this) {
      case TaskFilesystemType.ext3:
        return 'ext3';
      case TaskFilesystemType.ext4:
        return 'ext4';
      case TaskFilesystemType.xfs:
        return 'xfs';
    }
  }
}

extension TaskFilesystemTypeFromString on String {
  TaskFilesystemType toTaskFilesystemType() {
    switch (this) {
      case 'ext3':
        return TaskFilesystemType.ext3;
      case 'ext4':
        return TaskFilesystemType.ext4;
      case 'xfs':
        return TaskFilesystemType.xfs;
    }
    throw Exception('$this is not known in enum TaskFilesystemType');
  }
}

/// The configuration for the Amazon EBS volume that Amazon ECS creates and
/// manages on your behalf. These settings are used to create each Amazon EBS
/// volume, with one volume created for each task.
class TaskManagedEBSVolumeConfiguration {
  /// The ARN of the IAM role to associate with this volume. This is the Amazon
  /// ECS infrastructure IAM role that is used to manage your Amazon Web Services
  /// infrastructure. We recommend using the Amazon ECS-managed
  /// <code>AmazonECSInfrastructureRolePolicyForVolumes</code> IAM policy with
  /// this role. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/infrastructure_IAM_role.html">Amazon
  /// ECS infrastructure IAM role</a> in the <i>Amazon ECS Developer Guide</i>.
  final String roleArn;

  /// Indicates whether the volume should be encrypted. If no value is specified,
  /// encryption is turned on by default. This parameter maps 1:1 with the
  /// <code>Encrypted</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final bool? encrypted;

  /// The Linux filesystem type for the volume. For volumes created from a
  /// snapshot, you must specify the same filesystem type that the volume was
  /// using when the snapshot was created. If there is a filesystem type mismatch,
  /// the task will fail to start.
  ///
  /// The available filesystem types are&#x2028; <code>ext3</code>,
  /// <code>ext4</code>, and <code>xfs</code>. If no value is specified, the
  /// <code>xfs</code> filesystem type is used by default.
  final TaskFilesystemType? filesystemType;

  /// The number of I/O operations per second (IOPS). For <code>gp3</code>,
  /// <code>io1</code>, and <code>io2</code> volumes, this represents the number
  /// of IOPS that are provisioned for the volume. For <code>gp2</code> volumes,
  /// this represents the baseline performance of the volume and the rate at which
  /// the volume accumulates I/O credits for bursting.
  ///
  /// The following are the supported values for each volume type.
  ///
  /// <ul>
  /// <li>
  /// <code>gp3</code>: 3,000 - 16,000 IOPS
  /// </li>
  /// <li>
  /// <code>io1</code>: 100 - 64,000 IOPS
  /// </li>
  /// <li>
  /// <code>io2</code>: 100 - 256,000 IOPS
  /// </li>
  /// </ul>
  /// This parameter is required for <code>io1</code> and <code>io2</code> volume
  /// types. The default for <code>gp3</code> volumes is <code>3,000 IOPS</code>.
  /// This parameter is not supported for <code>st1</code>, <code>sc1</code>, or
  /// <code>standard</code> volume types.
  ///
  /// This parameter maps 1:1 with the <code>Iops</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final int? iops;

  /// The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key
  /// Management Service key to use for Amazon EBS encryption. When encryption is
  /// turned on and no Amazon Web Services Key Management Service key is
  /// specified, the default Amazon Web Services managed key for Amazon EBS
  /// volumes is used. This parameter maps 1:1 with the <code>KmsKeyId</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  /// <important>
  /// Amazon Web Services authenticates the Amazon Web Services Key Management
  /// Service key asynchronously. Therefore, if you specify an ID, alias, or ARN
  /// that is invalid, the action can appear to complete, but eventually fails.
  /// </important>
  final String? kmsKeyId;

  /// The size of the volume in GiB. You must specify either a volume size or a
  /// snapshot ID. If you specify a snapshot ID, the snapshot size is used for the
  /// volume size by default. You can optionally specify a volume size greater
  /// than or equal to the snapshot size. This parameter maps 1:1 with the
  /// <code>Size</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// The following are the supported volume size values for each volume type.
  ///
  /// <ul>
  /// <li>
  /// <code>gp2</code> and <code>gp3</code>: 1-16,384
  /// </li>
  /// <li>
  /// <code>io1</code> and <code>io2</code>: 4-16,384
  /// </li>
  /// <li>
  /// <code>st1</code> and <code>sc1</code>: 125-16,384
  /// </li>
  /// <li>
  /// <code>standard</code>: 1-1,024
  /// </li>
  /// </ul>
  final int? sizeInGiB;

  /// The snapshot that Amazon ECS uses to create the volume. You must specify
  /// either a snapshot ID or a volume size. This parameter maps 1:1 with the
  /// <code>SnapshotId</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final String? snapshotId;

  /// The tags to apply to the volume. Amazon ECS applies service-managed tags by
  /// default. This parameter maps 1:1 with the <code>TagSpecifications.N</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  final List<EBSTagSpecification>? tagSpecifications;

  /// The termination policy for the volume when the task exits. This provides a
  /// way to control whether Amazon ECS terminates the Amazon EBS volume when the
  /// task stops.
  final TaskManagedEBSVolumeTerminationPolicy? terminationPolicy;

  /// The throughput to provision for a volume, in MiB/s, with a maximum of 1,000
  /// MiB/s. This parameter maps 1:1 with the <code>Throughput</code> parameter of
  /// the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>.
  /// <important>
  /// This parameter is only supported for the <code>gp3</code> volume type.
  /// </important>
  final int? throughput;

  /// The volume type. This parameter maps 1:1 with the <code>VolumeType</code>
  /// parameter of the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateVolume.html">CreateVolume
  /// API</a> in the <i>Amazon EC2 API Reference</i>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html">Amazon
  /// EBS volume types</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// The following are the supported volume types.
  ///
  /// <ul>
  /// <li>
  /// General Purpose SSD: <code>gp2</code>|<code>gp3</code>
  /// </li>
  /// <li>
  /// Provisioned IOPS SSD: <code>io1</code>|<code>io2</code>
  /// </li>
  /// <li>
  /// Throughput Optimized HDD: <code>st1</code>
  /// </li>
  /// <li>
  /// Cold HDD: <code>sc1</code>
  /// </li>
  /// <li>
  /// Magnetic: <code>standard</code>
  /// <note>
  /// The magnetic volume type is not supported on Fargate.
  /// </note> </li>
  /// </ul>
  final String? volumeType;

  TaskManagedEBSVolumeConfiguration({
    required this.roleArn,
    this.encrypted,
    this.filesystemType,
    this.iops,
    this.kmsKeyId,
    this.sizeInGiB,
    this.snapshotId,
    this.tagSpecifications,
    this.terminationPolicy,
    this.throughput,
    this.volumeType,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final encrypted = this.encrypted;
    final filesystemType = this.filesystemType;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final sizeInGiB = this.sizeInGiB;
    final snapshotId = this.snapshotId;
    final tagSpecifications = this.tagSpecifications;
    final terminationPolicy = this.terminationPolicy;
    final throughput = this.throughput;
    final volumeType = this.volumeType;
    return {
      'roleArn': roleArn,
      if (encrypted != null) 'encrypted': encrypted,
      if (filesystemType != null) 'filesystemType': filesystemType.toValue(),
      if (iops != null) 'iops': iops,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (sizeInGiB != null) 'sizeInGiB': sizeInGiB,
      if (snapshotId != null) 'snapshotId': snapshotId,
      if (tagSpecifications != null) 'tagSpecifications': tagSpecifications,
      if (terminationPolicy != null) 'terminationPolicy': terminationPolicy,
      if (throughput != null) 'throughput': throughput,
      if (volumeType != null) 'volumeType': volumeType,
    };
  }
}

/// The termination policy for the Amazon EBS volume when the task exits. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types">Amazon
/// ECS volume termination policy</a>.
class TaskManagedEBSVolumeTerminationPolicy {
  /// Indicates whether the volume should be deleted on when the task stops. If a
  /// value of <code>true</code> is specified, &#x2028;Amazon ECS deletes the
  /// Amazon EBS volume on your behalf when the task goes into the
  /// <code>STOPPED</code> state. If no value is specified, the &#x2028;default
  /// value is <code>true</code> is used. When set to <code>false</code>, Amazon
  /// ECS leaves the volume in your &#x2028;account.
  final bool deleteOnTermination;

  TaskManagedEBSVolumeTerminationPolicy({
    required this.deleteOnTermination,
  });

  Map<String, dynamic> toJson() {
    final deleteOnTermination = this.deleteOnTermination;
    return {
      'deleteOnTermination': deleteOnTermination,
    };
  }
}

/// The overrides that are associated with a task.
class TaskOverride {
  /// One or more container overrides that are sent to a task.
  final List<ContainerOverride>? containerOverrides;

  /// The CPU override for the task.
  final String? cpu;

  /// The ephemeral storage setting override for the task.
  /// <note>
  /// This parameter is only supported for tasks hosted on Fargate that use the
  /// following platform versions:
  ///
  /// <ul>
  /// <li>
  /// Linux platform version <code>1.4.0</code> or later.
  /// </li>
  /// <li>
  /// Windows platform version <code>1.0.0</code> or later.
  /// </li>
  /// </ul> </note>
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the task execution role override for the
  /// task. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html">Amazon
  /// ECS task execution IAM role</a> in the <i>Amazon Elastic Container Service
  /// Developer Guide</i>.
  final String? executionRoleArn;

  /// The Elastic Inference accelerator override for the task.
  final List<InferenceAcceleratorOverride>? inferenceAcceleratorOverrides;

  /// The memory override for the task.
  final String? memory;

  /// The Amazon Resource Name (ARN) of the role that containers in this task can
  /// assume. All containers in this task are granted the permissions that are
  /// specified in this role. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// Role for Tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
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

/// Information about a set of Amazon ECS tasks in either an CodeDeploy or an
/// <code>EXTERNAL</code> deployment. An Amazon ECS task set includes details
/// such as the desired number of tasks, how many tasks are running, and whether
/// the task set serves production traffic.
class TaskSet {
  /// The capacity provider strategy that are associated with the task set.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// The Amazon Resource Name (ARN) of the cluster that the service that hosts
  /// the task set exists in.
  final String? clusterArn;

  /// The computed desired count for the task set. This is calculated by
  /// multiplying the service's <code>desiredCount</code> by the task set's
  /// <code>scale</code> percentage. The result is always rounded up. For example,
  /// if the computed desired count is 1.2, it rounds up to 2 tasks.
  final int? computedDesiredCount;

  /// The Unix timestamp for the time when the task set was created.
  final DateTime? createdAt;

  /// The external ID associated with the task set.
  ///
  /// If an CodeDeploy deployment created a task set, the <code>externalId</code>
  /// parameter contains the CodeDeploy deployment ID.
  ///
  /// If a task set is created for an external deployment and is associated with a
  /// service discovery registry, the <code>externalId</code> parameter contains
  /// the <code>ECS_TASK_SET_EXTERNAL_ID</code> Cloud Map attribute.
  final String? externalId;

  /// The ID of the task set.
  final String? id;

  /// The launch type the tasks in the task set are using. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html">Amazon
  /// ECS launch types</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final LaunchType? launchType;

  /// Details on a load balancer that are used with a task set.
  final List<LoadBalancer>? loadBalancers;

  /// The network configuration for the task set.
  final NetworkConfiguration? networkConfiguration;

  /// The number of tasks in the task set that are in the <code>PENDING</code>
  /// status during a deployment. A task in the <code>PENDING</code> state is
  /// preparing to enter the <code>RUNNING</code> state. A task set enters the
  /// <code>PENDING</code> status when it launches for the first time or when it's
  /// restarted after being in the <code>STOPPED</code> state.
  final int? pendingCount;

  /// The operating system that your tasks in the set are running on. A platform
  /// family is specified only for tasks that use the Fargate launch type.
  ///
  /// All tasks in the set must have the same value.
  final String? platformFamily;

  /// The Fargate platform version where the tasks in the task set are running. A
  /// platform version is only specified for tasks run on Fargate. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// platform versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// The number of tasks in the task set that are in the <code>RUNNING</code>
  /// status during a deployment. A task in the <code>RUNNING</code> state is
  /// running and ready for use.
  final int? runningCount;

  /// A floating-point percentage of your desired number of tasks to place and
  /// keep running in the task set.
  final Scale? scale;

  /// The Amazon Resource Name (ARN) of the service the task set exists in.
  final String? serviceArn;

  /// The details for the service discovery registries to assign to this task set.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
  /// discovery</a>.
  final List<ServiceRegistry>? serviceRegistries;

  /// The stability status. This indicates whether the task set has reached a
  /// steady state. If the following conditions are met, the task set are in
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
  /// There are no tasks that are running on container instances in the
  /// <code>DRAINING</code> status.
  /// </li>
  /// <li>
  /// All tasks are reporting a healthy status from the load balancers, service
  /// discovery, and container health checks.
  /// </li>
  /// </ul>
  /// If any of those conditions aren't met, the stability status returns
  /// <code>STABILIZING</code>.
  final StabilityStatus? stabilityStatus;

  /// The Unix timestamp for the time when the task set stability status was
  /// retrieved.
  final DateTime? stabilityStatusAt;

  /// The tag specified when a task set is started. If an CodeDeploy deployment
  /// created the task set, the <code>startedBy</code> parameter is
  /// <code>CODE_DEPLOY</code>. If an external deployment created the task set,
  /// the <code>startedBy</code> field isn't used.
  final String? startedBy;

  /// The status of the task set. The following describes each state.
  /// <dl> <dt>PRIMARY</dt> <dd>
  /// The task set is serving production traffic.
  /// </dd> <dt>ACTIVE</dt> <dd>
  /// The task set isn't serving production traffic.
  /// </dd> <dt>DRAINING</dt> <dd>
  /// The tasks in the task set are being stopped, and their corresponding targets
  /// are being deregistered from their target group.
  /// </dd> </dl>
  final String? status;

  /// The metadata that you apply to the task set to help you categorize and
  /// organize them. Each tag consists of a key and an optional value. You define
  /// both.
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
  /// for Amazon Web Services use. You cannot edit or delete tag keys or values
  /// with this prefix. Tags with this prefix do not count against your tags per
  /// resource limit.
  /// </li>
  /// </ul>
  final List<Tag>? tags;

  /// The task definition that the task set is using.
  final String? taskDefinition;

  /// The Amazon Resource Name (ARN) of the task set.
  final String? taskSetArn;

  /// The Unix timestamp for the time when the task set was last updated.
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
    this.platformFamily,
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
      platformFamily: json['platformFamily'] as String?,
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
    final platformFamily = this.platformFamily;
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
      if (platformFamily != null) 'platformFamily': platformFamily,
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

extension TaskSetFieldValueExtension on TaskSetField {
  String toValue() {
    switch (this) {
      case TaskSetField.tags:
        return 'TAGS';
    }
  }
}

extension TaskSetFieldFromString on String {
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
  serviceSchedulerInitiated,
  spotInterruption,
  terminationNotice,
}

extension TaskStopCodeValueExtension on TaskStopCode {
  String toValue() {
    switch (this) {
      case TaskStopCode.taskFailedToStart:
        return 'TaskFailedToStart';
      case TaskStopCode.essentialContainerExited:
        return 'EssentialContainerExited';
      case TaskStopCode.userInitiated:
        return 'UserInitiated';
      case TaskStopCode.serviceSchedulerInitiated:
        return 'ServiceSchedulerInitiated';
      case TaskStopCode.spotInterruption:
        return 'SpotInterruption';
      case TaskStopCode.terminationNotice:
        return 'TerminationNotice';
    }
  }
}

extension TaskStopCodeFromString on String {
  TaskStopCode toTaskStopCode() {
    switch (this) {
      case 'TaskFailedToStart':
        return TaskStopCode.taskFailedToStart;
      case 'EssentialContainerExited':
        return TaskStopCode.essentialContainerExited;
      case 'UserInitiated':
        return TaskStopCode.userInitiated;
      case 'ServiceSchedulerInitiated':
        return TaskStopCode.serviceSchedulerInitiated;
      case 'SpotInterruption':
        return TaskStopCode.spotInterruption;
      case 'TerminationNotice':
        return TaskStopCode.terminationNotice;
    }
    throw Exception('$this is not known in enum TaskStopCode');
  }
}

/// Configuration settings for the task volume that was
/// <code>configuredAtLaunch</code> that weren't set during
/// <code>RegisterTaskDef</code>.
class TaskVolumeConfiguration {
  /// The name of the volume. This value must match the volume name from the
  /// <code>Volume</code> object in the task definition.
  final String name;

  /// The configuration for the Amazon EBS volume that Amazon ECS creates and
  /// manages on your behalf. These settings are used to create each Amazon EBS
  /// volume, with one volume created for each task. The Amazon EBS volumes are
  /// visible in your account in the Amazon EC2 console once they are created.
  final TaskManagedEBSVolumeConfiguration? managedEBSVolume;

  TaskVolumeConfiguration({
    required this.name,
    this.managedEBSVolume,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final managedEBSVolume = this.managedEBSVolume;
    return {
      'name': name,
      if (managedEBSVolume != null) 'managedEBSVolume': managedEBSVolume,
    };
  }
}

/// An object that represents the timeout configurations for Service Connect.
/// <note>
/// If <code>idleTimeout</code> is set to a time that is less than
/// <code>perRequestTimeout</code>, the connection will close when the
/// <code>idleTimeout</code> is reached and not the
/// <code>perRequestTimeout</code>.
/// </note>
class TimeoutConfiguration {
  /// The amount of time in seconds a connection will stay active while idle. A
  /// value of <code>0</code> can be set to disable <code>idleTimeout</code>.
  ///
  /// The <code>idleTimeout</code> default for
  /// <code>HTTP</code>/<code>HTTP2</code>/<code>GRPC</code> is 5 minutes.
  ///
  /// The <code>idleTimeout</code> default for <code>TCP</code> is 1 hour.
  final int? idleTimeoutSeconds;

  /// The amount of time waiting for the upstream to respond with a complete
  /// response per request. A value of <code>0</code> can be set to disable
  /// <code>perRequestTimeout</code>. <code>perRequestTimeout</code> can only be
  /// set if Service Connect <code>appProtocol</code> isn't <code>TCP</code>. Only
  /// <code>idleTimeout</code> is allowed for <code>TCP</code>
  /// <code>appProtocol</code>.
  final int? perRequestTimeoutSeconds;

  TimeoutConfiguration({
    this.idleTimeoutSeconds,
    this.perRequestTimeoutSeconds,
  });

  factory TimeoutConfiguration.fromJson(Map<String, dynamic> json) {
    return TimeoutConfiguration(
      idleTimeoutSeconds: json['idleTimeoutSeconds'] as int?,
      perRequestTimeoutSeconds: json['perRequestTimeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final idleTimeoutSeconds = this.idleTimeoutSeconds;
    final perRequestTimeoutSeconds = this.perRequestTimeoutSeconds;
    return {
      if (idleTimeoutSeconds != null) 'idleTimeoutSeconds': idleTimeoutSeconds,
      if (perRequestTimeoutSeconds != null)
        'perRequestTimeoutSeconds': perRequestTimeoutSeconds,
    };
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

extension TransportProtocolValueExtension on TransportProtocol {
  String toValue() {
    switch (this) {
      case TransportProtocol.tcp:
        return 'tcp';
      case TransportProtocol.udp:
        return 'udp';
    }
  }
}

extension TransportProtocolFromString on String {
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
/// <code>1024</code> and the default hard limit is <code>65535</code>.
///
/// You can specify the <code>ulimit</code> settings for a container in a task
/// definition.
class Ulimit {
  /// The hard limit for the <code>ulimit</code> type.
  final int hardLimit;

  /// The <code>type</code> of the <code>ulimit</code>.
  final UlimitName name;

  /// The soft limit for the <code>ulimit</code> type.
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

extension UlimitNameValueExtension on UlimitName {
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

extension UlimitNameFromString on String {
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
  /// The container instance that the container agent was updated for.
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
  /// The details about the task set.
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

class UpdateTaskProtectionResponse {
  /// Any failures associated with the call.
  final List<Failure>? failures;

  /// A list of tasks with the following information.
  ///
  /// <ul>
  /// <li>
  /// <code>taskArn</code>: The task ARN.
  /// </li>
  /// <li>
  /// <code>protectionEnabled</code>: The protection status of the task. If
  /// scale-in protection is turned on for a task, the value is <code>true</code>.
  /// Otherwise, it is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>expirationDate</code>: The epoch time when protection for the task
  /// will expire.
  /// </li>
  /// </ul>
  final List<ProtectedTask>? protectedTasks;

  UpdateTaskProtectionResponse({
    this.failures,
    this.protectedTasks,
  });

  factory UpdateTaskProtectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTaskProtectionResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      protectedTasks: (json['protectedTasks'] as List?)
          ?.whereNotNull()
          .map((e) => ProtectedTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final protectedTasks = this.protectedTasks;
    return {
      if (failures != null) 'failures': failures,
      if (protectedTasks != null) 'protectedTasks': protectedTasks,
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

  /// The Docker version that's running on the container instance.
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

/// The data volume configuration for tasks launched using this task definition.
/// Specifying a volume configuration in a task definition is optional. The
/// volume configuration may contain multiple volumes but only one volume
/// configured at launch is supported. Each volume defined in the volume
/// configuration may only specify a <code>name</code> and one of either
/// <code>configuredAtLaunch</code>, <code>dockerVolumeConfiguration</code>,
/// <code>efsVolumeConfiguration</code>,
/// <code>fsxWindowsFileServerVolumeConfiguration</code>, or <code>host</code>.
/// If an empty volume configuration is specified, by default Amazon ECS uses a
/// host volume. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_data_volumes.html">Using
/// data volumes in tasks</a>.
class Volume {
  /// Indicates whether the volume should be configured at launch time. This is
  /// used to create Amazon EBS volumes for standalone tasks or tasks created as
  /// part of a service. Each task definition revision may only have one volume
  /// configured at launch in the volume configuration.
  ///
  /// To configure a volume at launch time, use this task definition revision and
  /// specify a <code>volumeConfigurations</code> object when calling the
  /// <code>CreateService</code>, <code>UpdateService</code>, <code>RunTask</code>
  /// or <code>StartTask</code> APIs.
  final bool? configuredAtLaunch;

  /// This parameter is specified when you use Docker volumes.
  ///
  /// Windows containers only support the use of the <code>local</code> driver. To
  /// use bind mounts, specify the <code>host</code> parameter instead.
  /// <note>
  /// Docker volumes aren't supported by tasks run on Fargate.
  /// </note>
  final DockerVolumeConfiguration? dockerVolumeConfiguration;

  /// This parameter is specified when you use an Amazon Elastic File System file
  /// system for task storage.
  final EFSVolumeConfiguration? efsVolumeConfiguration;

  /// This parameter is specified when you use Amazon FSx for Windows File Server
  /// file system for task storage.
  final FSxWindowsFileServerVolumeConfiguration?
      fsxWindowsFileServerVolumeConfiguration;

  /// This parameter is specified when you use bind mount host volumes. The
  /// contents of the <code>host</code> parameter determine whether your bind
  /// mount host volume persists on the host container instance and where it's
  /// stored. If the <code>host</code> parameter is empty, then the Docker daemon
  /// assigns a host path for your data volume. However, the data isn't guaranteed
  /// to persist after the containers that are associated with it stop running.
  ///
  /// Windows containers can mount whole directories on the same drive as
  /// <code>$env:ProgramData</code>. Windows containers can't mount directories on
  /// a different drive, and mount point can't be across drives. For example, you
  /// can mount <code>C:\my\path:C:\my\path</code> and <code>D:\:D:\</code>, but
  /// not <code>D:\my\path:C:\my\path</code> or <code>D:\:C:\my\path</code>.
  final HostVolumeProperties? host;

  /// The name of the volume. Up to 255 letters (uppercase and lowercase),
  /// numbers, underscores, and hyphens are allowed.
  ///
  /// When using a volume configured at launch, the <code>name</code> is required
  /// and must also be specified as the volume name in the
  /// <code>ServiceVolumeConfiguration</code> or
  /// <code>TaskVolumeConfiguration</code> parameter when creating your service or
  /// standalone task.
  ///
  /// For all other types of volumes, this name is referenced in the
  /// <code>sourceVolume</code> parameter of the <code>mountPoints</code> object
  /// in the container definition.
  ///
  /// When a volume is using the <code>efsVolumeConfiguration</code>, the name is
  /// required.
  final String? name;

  Volume({
    this.configuredAtLaunch,
    this.dockerVolumeConfiguration,
    this.efsVolumeConfiguration,
    this.fsxWindowsFileServerVolumeConfiguration,
    this.host,
    this.name,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      configuredAtLaunch: json['configuredAtLaunch'] as bool?,
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
    final configuredAtLaunch = this.configuredAtLaunch;
    final dockerVolumeConfiguration = this.dockerVolumeConfiguration;
    final efsVolumeConfiguration = this.efsVolumeConfiguration;
    final fsxWindowsFileServerVolumeConfiguration =
        this.fsxWindowsFileServerVolumeConfiguration;
    final host = this.host;
    final name = this.name;
    return {
      if (configuredAtLaunch != null) 'configuredAtLaunch': configuredAtLaunch,
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

  /// The name of another container within the same task definition to mount
  /// volumes from.
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

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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

class NamespaceNotFoundException extends _s.GenericAwsException {
  NamespaceNotFoundException({String? type, String? message})
      : super(type: type, code: 'NamespaceNotFoundException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingVersionException': (type, message) =>
      MissingVersionException(type: type, message: message),
  'NamespaceNotFoundException': (type, message) =>
      NamespaceNotFoundException(type: type, message: message),
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
