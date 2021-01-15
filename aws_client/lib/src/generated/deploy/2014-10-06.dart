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

part '2014-10-06.g.dart';

/// AWS CodeDeploy is a deployment service that automates application
/// deployments to Amazon EC2 instances, on-premises instances running in your
/// own facility, serverless AWS Lambda functions, or applications in an Amazon
/// ECS service.
class CodeDeploy {
  final _s.JsonProtocol _protocol;
  CodeDeploy({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codedeploy',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds tags to on-premises instances.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [TagRequiredException].
  /// May throw [InvalidTagException].
  /// May throw [TagLimitExceededException].
  /// May throw [InstanceLimitExceededException].
  /// May throw [InstanceNotRegisteredException].
  ///
  /// Parameter [instanceNames] :
  /// The names of the on-premises instances to which to add tags.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs to add to the on-premises instances.
  ///
  /// Keys and values are both required. Keys cannot be null or empty strings.
  /// Value-only tags are not allowed.
  Future<void> addTagsToOnPremisesInstances({
    @_s.required List<String> instanceNames,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.AddTagsToOnPremisesInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceNames': instanceNames,
        'tags': tags,
      },
    );
  }

  /// Gets information about one or more application revisions. The maximum
  /// number of application revisions that can be returned is 25.
  ///
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [RevisionRequiredException].
  /// May throw [InvalidRevisionException].
  /// May throw [BatchLimitExceededException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application about which to get revision
  /// information.
  ///
  /// Parameter [revisions] :
  /// An array of <code>RevisionLocation</code> objects that specify information
  /// to get about the application revisions, including type and location. The
  /// maximum number of <code>RevisionLocation</code> objects you can specify is
  /// 25.
  Future<BatchGetApplicationRevisionsOutput> batchGetApplicationRevisions({
    @_s.required String applicationName,
    @_s.required List<RevisionLocation> revisions,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(revisions, 'revisions');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetApplicationRevisions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'revisions': revisions,
      },
    );

    return BatchGetApplicationRevisionsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more applications. The maximum number of
  /// applications that can be returned is 100.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [BatchLimitExceededException].
  ///
  /// Parameter [applicationNames] :
  /// A list of application names separated by spaces. The maximum number of
  /// application names you can specify is 100.
  Future<BatchGetApplicationsOutput> batchGetApplications({
    @_s.required List<String> applicationNames,
  }) async {
    ArgumentError.checkNotNull(applicationNames, 'applicationNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationNames': applicationNames,
      },
    );

    return BatchGetApplicationsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more deployment groups.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [BatchLimitExceededException].
  /// May throw [DeploymentConfigDoesNotExistException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the applicable
  /// IAM user or AWS account.
  ///
  /// Parameter [deploymentGroupNames] :
  /// The names of the deployment groups.
  Future<BatchGetDeploymentGroupsOutput> batchGetDeploymentGroups({
    @_s.required String applicationName,
    @_s.required List<String> deploymentGroupNames,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deploymentGroupNames, 'deploymentGroupNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetDeploymentGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'deploymentGroupNames': deploymentGroupNames,
      },
    );

    return BatchGetDeploymentGroupsOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This method works, but is deprecated. Use
  /// <code>BatchGetDeploymentTargets</code> instead.
  /// </note>
  /// Returns an array of one or more instances associated with a deployment.
  /// This method works with EC2/On-premises and AWS Lambda compute platforms.
  /// The newer <code>BatchGetDeploymentTargets</code> works with all compute
  /// platforms. The maximum number of instances that can be returned is 25.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [InstanceIdRequiredException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [BatchLimitExceededException].
  /// May throw [InvalidComputePlatformException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [instanceIds] :
  /// The unique IDs of instances used in the deployment. The maximum number of
  /// instance IDs you can specify is 25.
  @Deprecated('Deprecated')
  Future<BatchGetDeploymentInstancesOutput> batchGetDeploymentInstances({
    @_s.required String deploymentId,
    @_s.required List<String> instanceIds,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(instanceIds, 'instanceIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetDeploymentInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentId': deploymentId,
        'instanceIds': instanceIds,
      },
    );

    return BatchGetDeploymentInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of one or more targets associated with a deployment. This
  /// method works with all compute types and should be used instead of the
  /// deprecated <code>BatchGetDeploymentInstances</code>. The maximum number of
  /// targets that can be returned is 25.
  ///
  /// The type of targets returned depends on the deployment's compute platform
  /// or deployment method:
  ///
  /// <ul>
  /// <li>
  /// <b>EC2/On-premises</b>: Information about EC2 instance targets.
  /// </li>
  /// <li>
  /// <b>AWS Lambda</b>: Information about Lambda functions targets.
  /// </li>
  /// <li>
  /// <b>Amazon ECS</b>: Information about Amazon ECS service targets.
  /// </li>
  /// <li>
  /// <b>CloudFormation</b>: Information about targets of blue/green deployments
  /// initiated by a CloudFormation stack update.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidDeploymentIdException].
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentNotStartedException].
  /// May throw [DeploymentTargetIdRequiredException].
  /// May throw [InvalidDeploymentTargetIdException].
  /// May throw [DeploymentTargetDoesNotExistException].
  /// May throw [DeploymentTargetListSizeExceededException].
  /// May throw [InstanceDoesNotExistException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [targetIds] :
  /// The unique IDs of the deployment targets. The compute platform of the
  /// deployment determines the type of the targets and their formats. The
  /// maximum number of deployment target IDs you can specify is 25.
  ///
  /// <ul>
  /// <li>
  /// For deployments that use the EC2/On-premises compute platform, the target
  /// IDs are EC2 or on-premises instances IDs, and their target type is
  /// <code>instanceTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that use the AWS Lambda compute platform, the target IDs
  /// are the names of Lambda functions, and their target type is
  /// <code>instanceTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that use the Amazon ECS compute platform, the target IDs
  /// are pairs of Amazon ECS clusters and services specified using the format
  /// <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. Their target type is
  /// <code>ecsTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that are deployed with AWS CloudFormation, the target IDs
  /// are CloudFormation stack IDs. Their target type is
  /// <code>cloudFormationTarget</code>.
  /// </li>
  /// </ul>
  Future<BatchGetDeploymentTargetsOutput> batchGetDeploymentTargets({
    String deploymentId,
    List<String> targetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetDeploymentTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (targetIds != null) 'targetIds': targetIds,
      },
    );

    return BatchGetDeploymentTargetsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more deployments. The maximum number of
  /// deployments that can be returned is 25.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [BatchLimitExceededException].
  ///
  /// Parameter [deploymentIds] :
  /// A list of deployment IDs, separated by spaces. The maximum number of
  /// deployment IDs you can specify is 25.
  Future<BatchGetDeploymentsOutput> batchGetDeployments({
    @_s.required List<String> deploymentIds,
  }) async {
    ArgumentError.checkNotNull(deploymentIds, 'deploymentIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetDeployments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentIds': deploymentIds,
      },
    );

    return BatchGetDeploymentsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more on-premises instances. The maximum
  /// number of on-premises instances that can be returned is 25.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [BatchLimitExceededException].
  ///
  /// Parameter [instanceNames] :
  /// The names of the on-premises instances about which to get information. The
  /// maximum number of instance names you can specify is 25.
  Future<BatchGetOnPremisesInstancesOutput> batchGetOnPremisesInstances({
    @_s.required List<String> instanceNames,
  }) async {
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.BatchGetOnPremisesInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceNames': instanceNames,
      },
    );

    return BatchGetOnPremisesInstancesOutput.fromJson(jsonResponse.body);
  }

  /// For a blue/green deployment, starts the process of rerouting traffic from
  /// instances in the original environment to instances in the replacement
  /// environment without waiting for a specified wait time to elapse. (Traffic
  /// rerouting, which is achieved by registering instances in the replacement
  /// environment with the load balancer, can start as soon as all instances
  /// have a status of Ready.)
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentAlreadyCompletedException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [DeploymentIsNotInReadyStateException].
  /// May throw [UnsupportedActionForDeploymentTypeException].
  /// May throw [InvalidDeploymentWaitTypeException].
  /// May throw [InvalidDeploymentStatusException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a blue/green deployment for which you want to start
  /// rerouting traffic to the replacement environment.
  ///
  /// Parameter [deploymentWaitType] :
  /// The status of the deployment's waiting period. <code>READY_WAIT</code>
  /// indicates that the deployment is ready to start shifting traffic.
  /// <code>TERMINATION_WAIT</code> indicates that the traffic is shifted, but
  /// the original target is not terminated.
  Future<void> continueDeployment({
    String deploymentId,
    DeploymentWaitType deploymentWaitType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ContinueDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (deploymentWaitType != null)
          'deploymentWaitType': deploymentWaitType.toValue(),
      },
    );
  }

  /// Creates an application.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationAlreadyExistsException].
  /// May throw [ApplicationLimitExceededException].
  /// May throw [InvalidComputePlatformException].
  /// May throw [InvalidTagsToAddException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application. This name must be unique with the applicable
  /// IAM user or AWS account.
  ///
  /// Parameter [computePlatform] :
  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to CodeDeploy applications to help you
  /// organize and categorize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  Future<CreateApplicationOutput> createApplication({
    @_s.required String applicationName,
    ComputePlatform computePlatform,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        if (computePlatform != null)
          'computePlatform': computePlatform.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateApplicationOutput.fromJson(jsonResponse.body);
  }

  /// Deploys an application revision through the specified deployment group.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [RevisionRequiredException].
  /// May throw [RevisionDoesNotExistException].
  /// May throw [InvalidRevisionException].
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [DescriptionTooLongException].
  /// May throw [DeploymentLimitExceededException].
  /// May throw [InvalidTargetInstancesException].
  /// May throw [InvalidAutoRollbackConfigException].
  /// May throw [InvalidLoadBalancerInfoException].
  /// May throw [InvalidFileExistsBehaviorException].
  /// May throw [InvalidRoleException].
  /// May throw [InvalidAutoScalingGroupException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidUpdateOutdatedInstancesOnlyValueException].
  /// May throw [InvalidIgnoreApplicationStopFailuresValueException].
  /// May throw [InvalidGitHubAccountTokenException].
  /// May throw [InvalidTrafficRoutingConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [autoRollbackConfiguration] :
  /// Configuration information for an automatic rollback that is added when a
  /// deployment is created.
  ///
  /// Parameter [deploymentConfigName] :
  /// The name of a deployment configuration associated with the IAM user or AWS
  /// account.
  ///
  /// If not specified, the value configured in the deployment group is used as
  /// the default. If the deployment group does not have a deployment
  /// configuration associated with it,
  /// <code>CodeDeployDefault</code>.<code>OneAtATime</code> is used by default.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of the deployment group.
  ///
  /// Parameter [description] :
  /// A comment about the deployment.
  ///
  /// Parameter [fileExistsBehavior] :
  /// Information about how AWS CodeDeploy handles files that already exist in a
  /// deployment target location but weren't part of the previous successful
  /// deployment.
  ///
  /// The <code>fileExistsBehavior</code> parameter takes any of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// DISALLOW: The deployment fails. This is also the default behavior if no
  /// option is specified.
  /// </li>
  /// <li>
  /// OVERWRITE: The version of the file from the application revision currently
  /// being deployed replaces the version already on the instance.
  /// </li>
  /// <li>
  /// RETAIN: The version of the file already on the instance is kept and used
  /// as part of the new deployment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [ignoreApplicationStopFailures] :
  /// If true, then if an <code>ApplicationStop</code>,
  /// <code>BeforeBlockTraffic</code>, or <code>AfterBlockTraffic</code>
  /// deployment lifecycle event to an instance fails, then the deployment
  /// continues to the next deployment lifecycle event. For example, if
  /// <code>ApplicationStop</code> fails, the deployment continues with
  /// <code>DownloadBundle</code>. If <code>BeforeBlockTraffic</code> fails, the
  /// deployment continues with <code>BlockTraffic</code>. If
  /// <code>AfterBlockTraffic</code> fails, the deployment continues with
  /// <code>ApplicationStop</code>.
  ///
  /// If false or not specified, then if a lifecycle event fails during a
  /// deployment to an instance, that deployment fails. If deployment to that
  /// instance is part of an overall deployment and the number of healthy hosts
  /// is not less than the minimum number of healthy hosts, then a deployment to
  /// the next instance is attempted.
  ///
  /// During a deployment, the AWS CodeDeploy agent runs the scripts specified
  /// for <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and
  /// <code>AfterBlockTraffic</code> in the AppSpec file from the previous
  /// successful deployment. (All other scripts are run from the AppSpec file in
  /// the current deployment.) If one of these scripts contains an error and
  /// does not run successfully, the deployment can fail.
  ///
  /// If the cause of the failure is a script from the last successful
  /// deployment that will never run successfully, create a new deployment and
  /// use <code>ignoreApplicationStopFailures</code> to specify that the
  /// <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and
  /// <code>AfterBlockTraffic</code> failures should be ignored.
  ///
  /// Parameter [revision] :
  /// The type and location of the revision to deploy.
  ///
  /// Parameter [targetInstances] :
  /// Information about the instances that belong to the replacement environment
  /// in a blue/green deployment.
  ///
  /// Parameter [updateOutdatedInstancesOnly] :
  /// Indicates whether to deploy to all instances or only to instances that are
  /// not running the latest application revision.
  Future<CreateDeploymentOutput> createDeployment({
    @_s.required String applicationName,
    AutoRollbackConfiguration autoRollbackConfiguration,
    String deploymentConfigName,
    String deploymentGroupName,
    String description,
    FileExistsBehavior fileExistsBehavior,
    bool ignoreApplicationStopFailures,
    RevisionLocation revision,
    TargetInstances targetInstances,
    bool updateOutdatedInstancesOnly,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
    );
    _s.validateStringLength(
      'deploymentGroupName',
      deploymentGroupName,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.CreateDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        if (autoRollbackConfiguration != null)
          'autoRollbackConfiguration': autoRollbackConfiguration,
        if (deploymentConfigName != null)
          'deploymentConfigName': deploymentConfigName,
        if (deploymentGroupName != null)
          'deploymentGroupName': deploymentGroupName,
        if (description != null) 'description': description,
        if (fileExistsBehavior != null)
          'fileExistsBehavior': fileExistsBehavior.toValue(),
        if (ignoreApplicationStopFailures != null)
          'ignoreApplicationStopFailures': ignoreApplicationStopFailures,
        if (revision != null) 'revision': revision,
        if (targetInstances != null) 'targetInstances': targetInstances,
        if (updateOutdatedInstancesOnly != null)
          'updateOutdatedInstancesOnly': updateOutdatedInstancesOnly,
      },
    );

    return CreateDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Creates a deployment configuration.
  ///
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigNameRequiredException].
  /// May throw [DeploymentConfigAlreadyExistsException].
  /// May throw [InvalidMinimumHealthyHostValueException].
  /// May throw [DeploymentConfigLimitExceededException].
  /// May throw [InvalidComputePlatformException].
  /// May throw [InvalidTrafficRoutingConfigurationException].
  ///
  /// Parameter [deploymentConfigName] :
  /// The name of the deployment configuration to create.
  ///
  /// Parameter [computePlatform] :
  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  ///
  /// Parameter [minimumHealthyHosts] :
  /// The minimum number of healthy instances that should be available at any
  /// time during the deployment. There are two parameters expected in the
  /// input: type and value.
  ///
  /// The type parameter takes either of the following values:
  ///
  /// <ul>
  /// <li>
  /// HOST_COUNT: The value parameter represents the minimum number of healthy
  /// instances as an absolute value.
  /// </li>
  /// <li>
  /// FLEET_PERCENT: The value parameter represents the minimum number of
  /// healthy instances as a percentage of the total number of instances in the
  /// deployment. If you specify FLEET_PERCENT, at the start of the deployment,
  /// AWS CodeDeploy converts the percentage to the equivalent number of
  /// instances and rounds up fractional instances.
  /// </li>
  /// </ul>
  /// The value parameter takes an integer.
  ///
  /// For example, to set a minimum of 95% healthy instance, specify a type of
  /// FLEET_PERCENT and a value of 95.
  ///
  /// Parameter [trafficRoutingConfig] :
  /// The configuration that specifies how the deployment traffic is routed.
  Future<CreateDeploymentConfigOutput> createDeploymentConfig({
    @_s.required String deploymentConfigName,
    ComputePlatform computePlatform,
    MinimumHealthyHosts minimumHealthyHosts,
    TrafficRoutingConfig trafficRoutingConfig,
  }) async {
    ArgumentError.checkNotNull(deploymentConfigName, 'deploymentConfigName');
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.CreateDeploymentConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentConfigName': deploymentConfigName,
        if (computePlatform != null)
          'computePlatform': computePlatform.toValue(),
        if (minimumHealthyHosts != null)
          'minimumHealthyHosts': minimumHealthyHosts,
        if (trafficRoutingConfig != null)
          'trafficRoutingConfig': trafficRoutingConfig,
      },
    );

    return CreateDeploymentConfigOutput.fromJson(jsonResponse.body);
  }

  /// Creates a deployment group to which application revisions are deployed.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [DeploymentGroupAlreadyExistsException].
  /// May throw [InvalidEC2TagException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidAutoScalingGroupException].
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [RoleRequiredException].
  /// May throw [InvalidRoleException].
  /// May throw [DeploymentGroupLimitExceededException].
  /// May throw [LifecycleHookLimitExceededException].
  /// May throw [InvalidTriggerConfigException].
  /// May throw [TriggerTargetsLimitExceededException].
  /// May throw [InvalidAlarmConfigException].
  /// May throw [AlarmsLimitExceededException].
  /// May throw [InvalidAutoRollbackConfigException].
  /// May throw [InvalidLoadBalancerInfoException].
  /// May throw [InvalidDeploymentStyleException].
  /// May throw [InvalidBlueGreenDeploymentConfigurationException].
  /// May throw [InvalidEC2TagCombinationException].
  /// May throw [InvalidOnPremisesTagCombinationException].
  /// May throw [TagSetListLimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidECSServiceException].
  /// May throw [InvalidTargetGroupPairException].
  /// May throw [ECSServiceMappingLimitExceededException].
  /// May throw [InvalidTagsToAddException].
  /// May throw [InvalidTrafficRoutingConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a new deployment group for the specified application.
  ///
  /// Parameter [serviceRoleArn] :
  /// A service role Amazon Resource Name (ARN) that allows AWS CodeDeploy to
  /// act on the user's behalf when interacting with AWS services.
  ///
  /// Parameter [alarmConfiguration] :
  /// Information to add about Amazon CloudWatch alarms when the deployment
  /// group is created.
  ///
  /// Parameter [autoRollbackConfiguration] :
  /// Configuration information for an automatic rollback that is added when a
  /// deployment group is created.
  ///
  /// Parameter [autoScalingGroups] :
  /// A list of associated Amazon EC2 Auto Scaling groups.
  ///
  /// Parameter [blueGreenDeploymentConfiguration] :
  /// Information about blue/green deployment options for a deployment group.
  ///
  /// Parameter [deploymentConfigName] :
  /// If specified, the deployment configuration name can be either one of the
  /// predefined configurations provided with AWS CodeDeploy or a custom
  /// deployment configuration that you create by calling the create deployment
  /// configuration operation.
  ///
  /// <code>CodeDeployDefault.OneAtATime</code> is the default deployment
  /// configuration. It is used if a configuration isn't specified for the
  /// deployment or deployment group.
  ///
  /// For more information about the predefined deployment configurations in AWS
  /// CodeDeploy, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html">Working
  /// with Deployment Configurations in CodeDeploy</a> in the <i>AWS CodeDeploy
  /// User Guide</i>.
  ///
  /// Parameter [deploymentStyle] :
  /// Information about the type of deployment, in-place or blue/green, that you
  /// want to run and whether to route deployment traffic behind a load
  /// balancer.
  ///
  /// Parameter [ec2TagFilters] :
  /// The Amazon EC2 tags on which to filter. The deployment group includes EC2
  /// instances with any of the specified tags. Cannot be used in the same call
  /// as ec2TagSet.
  ///
  /// Parameter [ec2TagSet] :
  /// Information about groups of tags applied to EC2 instances. The deployment
  /// group includes only EC2 instances identified by all the tag groups. Cannot
  /// be used in the same call as <code>ec2TagFilters</code>.
  ///
  /// Parameter [ecsServices] :
  /// The target Amazon ECS services in the deployment group. This applies only
  /// to deployment groups that use the Amazon ECS compute platform. A target
  /// Amazon ECS service is specified as an Amazon ECS cluster and service name
  /// pair using the format
  /// <code>&lt;clustername&gt;:&lt;servicename&gt;</code>.
  ///
  /// Parameter [loadBalancerInfo] :
  /// Information about the load balancer used in a deployment.
  ///
  /// Parameter [onPremisesInstanceTagFilters] :
  /// The on-premises instance tags on which to filter. The deployment group
  /// includes on-premises instances with any of the specified tags. Cannot be
  /// used in the same call as <code>OnPremisesTagSet</code>.
  ///
  /// Parameter [onPremisesTagSet] :
  /// Information about groups of tags applied to on-premises instances. The
  /// deployment group includes only on-premises instances identified by all of
  /// the tag groups. Cannot be used in the same call as
  /// <code>onPremisesInstanceTagFilters</code>.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to CodeDeploy deployment groups to help you
  /// organize and categorize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// Parameter [triggerConfigurations] :
  /// Information about triggers to create when the deployment group is created.
  /// For examples, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-sns.html">Create
  /// a Trigger for an AWS CodeDeploy Event</a> in the <i>AWS CodeDeploy User
  /// Guide</i>.
  Future<CreateDeploymentGroupOutput> createDeploymentGroup({
    @_s.required String applicationName,
    @_s.required String deploymentGroupName,
    @_s.required String serviceRoleArn,
    AlarmConfiguration alarmConfiguration,
    AutoRollbackConfiguration autoRollbackConfiguration,
    List<String> autoScalingGroups,
    BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration,
    String deploymentConfigName,
    DeploymentStyle deploymentStyle,
    List<EC2TagFilter> ec2TagFilters,
    EC2TagSet ec2TagSet,
    List<ECSService> ecsServices,
    LoadBalancerInfo loadBalancerInfo,
    List<TagFilter> onPremisesInstanceTagFilters,
    OnPremisesTagSet onPremisesTagSet,
    List<Tag> tags,
    List<TriggerConfig> triggerConfigurations,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deploymentGroupName, 'deploymentGroupName');
    _s.validateStringLength(
      'deploymentGroupName',
      deploymentGroupName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceRoleArn, 'serviceRoleArn');
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.CreateDeploymentGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'deploymentGroupName': deploymentGroupName,
        'serviceRoleArn': serviceRoleArn,
        if (alarmConfiguration != null)
          'alarmConfiguration': alarmConfiguration,
        if (autoRollbackConfiguration != null)
          'autoRollbackConfiguration': autoRollbackConfiguration,
        if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
        if (blueGreenDeploymentConfiguration != null)
          'blueGreenDeploymentConfiguration': blueGreenDeploymentConfiguration,
        if (deploymentConfigName != null)
          'deploymentConfigName': deploymentConfigName,
        if (deploymentStyle != null) 'deploymentStyle': deploymentStyle,
        if (ec2TagFilters != null) 'ec2TagFilters': ec2TagFilters,
        if (ec2TagSet != null) 'ec2TagSet': ec2TagSet,
        if (ecsServices != null) 'ecsServices': ecsServices,
        if (loadBalancerInfo != null) 'loadBalancerInfo': loadBalancerInfo,
        if (onPremisesInstanceTagFilters != null)
          'onPremisesInstanceTagFilters': onPremisesInstanceTagFilters,
        if (onPremisesTagSet != null) 'onPremisesTagSet': onPremisesTagSet,
        if (tags != null) 'tags': tags,
        if (triggerConfigurations != null)
          'triggerConfigurations': triggerConfigurations,
      },
    );

    return CreateDeploymentGroupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an application.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [InvalidRoleException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  Future<void> deleteApplication({
    @_s.required String applicationName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
      },
    );
  }

  /// Deletes a deployment configuration.
  /// <note>
  /// A deployment configuration cannot be deleted if it is currently in use.
  /// Predefined configurations cannot be deleted.
  /// </note>
  ///
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigNameRequiredException].
  /// May throw [DeploymentConfigInUseException].
  /// May throw [InvalidOperationException].
  ///
  /// Parameter [deploymentConfigName] :
  /// The name of a deployment configuration associated with the IAM user or AWS
  /// account.
  Future<void> deleteDeploymentConfig({
    @_s.required String deploymentConfigName,
  }) async {
    ArgumentError.checkNotNull(deploymentConfigName, 'deploymentConfigName');
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteDeploymentConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentConfigName': deploymentConfigName,
      },
    );
  }

  /// Deletes a deployment group.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [InvalidRoleException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a deployment group for the specified application.
  Future<DeleteDeploymentGroupOutput> deleteDeploymentGroup({
    @_s.required String applicationName,
    @_s.required String deploymentGroupName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deploymentGroupName, 'deploymentGroupName');
    _s.validateStringLength(
      'deploymentGroupName',
      deploymentGroupName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteDeploymentGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'deploymentGroupName': deploymentGroupName,
      },
    );

    return DeleteDeploymentGroupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a GitHub account connection.
  ///
  /// May throw [GitHubAccountTokenNameRequiredException].
  /// May throw [GitHubAccountTokenDoesNotExistException].
  /// May throw [InvalidGitHubAccountTokenNameException].
  /// May throw [ResourceValidationException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [tokenName] :
  /// The name of the GitHub account connection to delete.
  Future<DeleteGitHubAccountTokenOutput> deleteGitHubAccountToken({
    String tokenName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteGitHubAccountToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (tokenName != null) 'tokenName': tokenName,
      },
    );

    return DeleteGitHubAccountTokenOutput.fromJson(jsonResponse.body);
  }

  /// Deletes resources linked to an external ID.
  ///
  /// Parameter [externalId] :
  /// The unique ID of an external resource (for example, a CloudFormation stack
  /// ID) that is linked to one or more CodeDeploy resources.
  Future<void> deleteResourcesByExternalId({
    String externalId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteResourcesByExternalId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (externalId != null) 'externalId': externalId,
      },
    );

    return DeleteResourcesByExternalIdOutput.fromJson(jsonResponse.body);
  }

  /// Deregisters an on-premises instance.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InvalidInstanceNameException].
  ///
  /// Parameter [instanceName] :
  /// The name of the on-premises instance to deregister.
  Future<void> deregisterOnPremisesInstance({
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeregisterOnPremisesInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );
  }

  /// Gets information about an application.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  Future<GetApplicationOutput> getApplication({
    @_s.required String applicationName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
      },
    );

    return GetApplicationOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about an application revision.
  ///
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [RevisionDoesNotExistException].
  /// May throw [RevisionRequiredException].
  /// May throw [InvalidRevisionException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application that corresponds to the revision.
  ///
  /// Parameter [revision] :
  /// Information about the application revision to get, including type and
  /// location.
  Future<GetApplicationRevisionOutput> getApplicationRevision({
    @_s.required String applicationName,
    @_s.required RevisionLocation revision,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(revision, 'revision');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetApplicationRevision'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'revision': revision,
      },
    );

    return GetApplicationRevisionOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about a deployment.
  /// <note>
  /// The <code>content</code> property of the <code>appSpecContent</code>
  /// object in the returned revision is always null. Use
  /// <code>GetApplicationRevision</code> and the <code>sha256</code> property
  /// of the returned <code>appSpecContent</code> object to get the content of
  /// the deployment’s AppSpec file.
  /// </note>
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [DeploymentDoesNotExistException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment associated with the IAM user or AWS account.
  Future<GetDeploymentOutput> getDeployment({
    @_s.required String deploymentId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentId': deploymentId,
      },
    );

    return GetDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about a deployment configuration.
  ///
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigNameRequiredException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [InvalidComputePlatformException].
  ///
  /// Parameter [deploymentConfigName] :
  /// The name of a deployment configuration associated with the IAM user or AWS
  /// account.
  Future<GetDeploymentConfigOutput> getDeploymentConfig({
    @_s.required String deploymentConfigName,
  }) async {
    ArgumentError.checkNotNull(deploymentConfigName, 'deploymentConfigName');
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetDeploymentConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentConfigName': deploymentConfigName,
      },
    );

    return GetDeploymentConfigOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about a deployment group.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [DeploymentConfigDoesNotExistException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a deployment group for the specified application.
  Future<GetDeploymentGroupOutput> getDeploymentGroup({
    @_s.required String applicationName,
    @_s.required String deploymentGroupName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(deploymentGroupName, 'deploymentGroupName');
    _s.validateStringLength(
      'deploymentGroupName',
      deploymentGroupName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetDeploymentGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'deploymentGroupName': deploymentGroupName,
      },
    );

    return GetDeploymentGroupOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about an instance as part of a deployment.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [InstanceIdRequiredException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [InstanceDoesNotExistException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [InvalidComputePlatformException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [instanceId] :
  /// The unique ID of an instance in the deployment group.
  @Deprecated('Deprecated')
  Future<GetDeploymentInstanceOutput> getDeploymentInstance({
    @_s.required String deploymentId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetDeploymentInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentId': deploymentId,
        'instanceId': instanceId,
      },
    );

    return GetDeploymentInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a deployment target.
  ///
  /// May throw [InvalidDeploymentIdException].
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentNotStartedException].
  /// May throw [DeploymentTargetIdRequiredException].
  /// May throw [InvalidDeploymentTargetIdException].
  /// May throw [DeploymentTargetDoesNotExistException].
  /// May throw [InvalidInstanceNameException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [targetId] :
  /// The unique ID of a deployment target.
  Future<GetDeploymentTargetOutput> getDeploymentTarget({
    String deploymentId,
    String targetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetDeploymentTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (targetId != null) 'targetId': targetId,
      },
    );

    return GetDeploymentTargetOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about an on-premises instance.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InstanceNotRegisteredException].
  /// May throw [InvalidInstanceNameException].
  ///
  /// Parameter [instanceName] :
  /// The name of the on-premises instance about which to get information.
  Future<GetOnPremisesInstanceOutput> getOnPremisesInstance({
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.GetOnPremisesInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return GetOnPremisesInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Lists information about revisions for an application.
  ///
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [InvalidSortByException].
  /// May throw [InvalidSortOrderException].
  /// May throw [InvalidBucketNameFilterException].
  /// May throw [InvalidKeyPrefixFilterException].
  /// May throw [BucketNameFilterRequiredException].
  /// May throw [InvalidDeployedStateFilterException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [deployed] :
  /// Whether to list revisions based on whether the revision is the target
  /// revision of a deployment group:
  ///
  /// <ul>
  /// <li>
  /// <code>include</code>: List revisions that are target revisions of a
  /// deployment group.
  /// </li>
  /// <li>
  /// <code>exclude</code>: Do not list revisions that are target revisions of a
  /// deployment group.
  /// </li>
  /// <li>
  /// <code>ignore</code>: List all revisions.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous
  /// <code>ListApplicationRevisions</code> call. It can be used to return the
  /// next set of applications in the list.
  ///
  /// Parameter [s3Bucket] :
  /// An Amazon S3 bucket name to limit the search for revisions.
  ///
  /// If set to null, all of the user's buckets are searched.
  ///
  /// Parameter [s3KeyPrefix] :
  /// A key prefix for the set of Amazon S3 objects to limit the search for
  /// revisions.
  ///
  /// Parameter [sortBy] :
  /// The column name to use to sort the list results:
  ///
  /// <ul>
  /// <li>
  /// <code>registerTime</code>: Sort by the time the revisions were registered
  /// with AWS CodeDeploy.
  /// </li>
  /// <li>
  /// <code>firstUsedTime</code>: Sort by the time the revisions were first used
  /// in a deployment.
  /// </li>
  /// <li>
  /// <code>lastUsedTime</code>: Sort by the time the revisions were last used
  /// in a deployment.
  /// </li>
  /// </ul>
  /// If not specified or set to null, the results are returned in an arbitrary
  /// order.
  ///
  /// Parameter [sortOrder] :
  /// The order in which to sort the list results:
  ///
  /// <ul>
  /// <li>
  /// <code>ascending</code>: ascending order.
  /// </li>
  /// <li>
  /// <code>descending</code>: descending order.
  /// </li>
  /// </ul>
  /// If not specified, the results are sorted in ascending order.
  ///
  /// If set to null, the results are sorted in an arbitrary order.
  Future<ListApplicationRevisionsOutput> listApplicationRevisions({
    @_s.required String applicationName,
    ListStateFilterAction deployed,
    String nextToken,
    String s3Bucket,
    String s3KeyPrefix,
    ApplicationRevisionSortBy sortBy,
    SortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListApplicationRevisions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        if (deployed != null) 'deployed': deployed.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
        if (s3Bucket != null) 's3Bucket': s3Bucket,
        if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListApplicationRevisionsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the applications registered with the IAM user or AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list applications call. It can be
  /// used to return the next set of applications in the list.
  Future<ListApplicationsOutput> listApplications({
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListApplicationsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the deployment configurations with the IAM user or AWS account.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous
  /// <code>ListDeploymentConfigs</code> call. It can be used to return the next
  /// set of deployment configurations in the list.
  Future<ListDeploymentConfigsOutput> listDeploymentConfigs({
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListDeploymentConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDeploymentConfigsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the deployment groups for an application registered with the IAM
  /// user or AWS account.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list deployment groups call. It
  /// can be used to return the next set of deployment groups in the list.
  Future<ListDeploymentGroupsOutput> listDeploymentGroups({
    @_s.required String applicationName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListDeploymentGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDeploymentGroupsOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// The newer <code>BatchGetDeploymentTargets</code> should be used instead
  /// because it works with all compute types.
  /// <code>ListDeploymentInstances</code> throws an exception if it is used
  /// with a compute platform other than EC2/On-premises or AWS Lambda.
  /// </note>
  /// Lists the instance for a deployment associated with the IAM user or AWS
  /// account.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentNotStartedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [InvalidInstanceStatusException].
  /// May throw [InvalidInstanceTypeException].
  /// May throw [InvalidDeploymentInstanceTypeException].
  /// May throw [InvalidTargetFilterNameException].
  /// May throw [InvalidComputePlatformException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [instanceStatusFilter] :
  /// A subset of instances to list by status:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code>: Include those instances with pending deployments.
  /// </li>
  /// <li>
  /// <code>InProgress</code>: Include those instances where deployments are
  /// still in progress.
  /// </li>
  /// <li>
  /// <code>Succeeded</code>: Include those instances with successful
  /// deployments.
  /// </li>
  /// <li>
  /// <code>Failed</code>: Include those instances with failed deployments.
  /// </li>
  /// <li>
  /// <code>Skipped</code>: Include those instances with skipped deployments.
  /// </li>
  /// <li>
  /// <code>Unknown</code>: Include those instances with deployments in an
  /// unknown state.
  /// </li>
  /// </ul>
  ///
  /// Parameter [instanceTypeFilter] :
  /// The set of instances in a blue/green deployment, either those in the
  /// original environment ("BLUE") or those in the replacement environment
  /// ("GREEN"), for which you want to view instance information.
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list deployment instances call.
  /// It can be used to return the next set of deployment instances in the list.
  @Deprecated('Deprecated')
  Future<ListDeploymentInstancesOutput> listDeploymentInstances({
    @_s.required String deploymentId,
    List<InstanceStatus> instanceStatusFilter,
    List<InstanceType> instanceTypeFilter,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListDeploymentInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentId': deploymentId,
        if (instanceStatusFilter != null)
          'instanceStatusFilter':
              instanceStatusFilter.map((e) => e?.toValue() ?? '').toList(),
        if (instanceTypeFilter != null)
          'instanceTypeFilter':
              instanceTypeFilter.map((e) => e?.toValue() ?? '').toList(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDeploymentInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of target IDs that are associated a deployment.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentNotStartedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [InvalidInstanceStatusException].
  /// May throw [InvalidInstanceTypeException].
  /// May throw [InvalidDeploymentInstanceTypeException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [nextToken] :
  /// A token identifier returned from the previous
  /// <code>ListDeploymentTargets</code> call. It can be used to return the next
  /// set of deployment targets in the list.
  ///
  /// Parameter [targetFilters] :
  /// A key used to filter the returned targets. The two valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>TargetStatus</code> - A <code>TargetStatus</code> filter string can
  /// be <code>Failed</code>, <code>InProgress</code>, <code>Pending</code>,
  /// <code>Ready</code>, <code>Skipped</code>, <code>Succeeded</code>, or
  /// <code>Unknown</code>.
  /// </li>
  /// <li>
  /// <code>ServerInstanceLabel</code> - A <code>ServerInstanceLabel</code>
  /// filter string can be <code>Blue</code> or <code>Green</code>.
  /// </li>
  /// </ul>
  Future<ListDeploymentTargetsOutput> listDeploymentTargets({
    String deploymentId,
    String nextToken,
    Map<TargetFilterName, List<String>> targetFilters,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListDeploymentTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
        if (targetFilters != null)
          'targetFilters':
              targetFilters.map((k, e) => MapEntry(k.toValue(), e)),
      },
    );

    return ListDeploymentTargetsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the deployments in a deployment group for an application registered
  /// with the IAM user or AWS account.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [InvalidTimeRangeException].
  /// May throw [InvalidDeploymentStatusException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidExternalIdException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  /// <note>
  /// If <code>applicationName</code> is specified, then
  /// <code>deploymentGroupName</code> must be specified. If it is not
  /// specified, then <code>deploymentGroupName</code> must not be specified.
  /// </note>
  ///
  /// Parameter [createTimeRange] :
  /// A time range (start and end) for returning a subset of the list of
  /// deployments.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a deployment group for the specified application.
  /// <note>
  /// If <code>deploymentGroupName</code> is specified, then
  /// <code>applicationName</code> must be specified. If it is not specified,
  /// then <code>applicationName</code> must not be specified.
  /// </note>
  ///
  /// Parameter [externalId] :
  /// The unique ID of an external resource for returning deployments linked to
  /// the external resource.
  ///
  /// Parameter [includeOnlyStatuses] :
  /// A subset of deployments to list by status:
  ///
  /// <ul>
  /// <li>
  /// <code>Created</code>: Include created deployments in the resulting list.
  /// </li>
  /// <li>
  /// <code>Queued</code>: Include queued deployments in the resulting list.
  /// </li>
  /// <li>
  /// <code>In Progress</code>: Include in-progress deployments in the resulting
  /// list.
  /// </li>
  /// <li>
  /// <code>Succeeded</code>: Include successful deployments in the resulting
  /// list.
  /// </li>
  /// <li>
  /// <code>Failed</code>: Include failed deployments in the resulting list.
  /// </li>
  /// <li>
  /// <code>Stopped</code>: Include stopped deployments in the resulting list.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list deployments call. It can be
  /// used to return the next set of deployments in the list.
  Future<ListDeploymentsOutput> listDeployments({
    String applicationName,
    TimeRange createTimeRange,
    String deploymentGroupName,
    String externalId,
    List<DeploymentStatus> includeOnlyStatuses,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'deploymentGroupName',
      deploymentGroupName,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListDeployments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationName != null) 'applicationName': applicationName,
        if (createTimeRange != null) 'createTimeRange': createTimeRange,
        if (deploymentGroupName != null)
          'deploymentGroupName': deploymentGroupName,
        if (externalId != null) 'externalId': externalId,
        if (includeOnlyStatuses != null)
          'includeOnlyStatuses':
              includeOnlyStatuses.map((e) => e?.toValue() ?? '').toList(),
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDeploymentsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the names of stored connections to GitHub accounts.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceValidationException].
  /// May throw [OperationNotSupportedException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous
  /// <code>ListGitHubAccountTokenNames</code> call. It can be used to return
  /// the next set of names in the list.
  Future<ListGitHubAccountTokenNamesOutput> listGitHubAccountTokenNames({
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListGitHubAccountTokenNames'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListGitHubAccountTokenNamesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of names for one or more on-premises instances.
  ///
  /// Unless otherwise specified, both registered and deregistered on-premises
  /// instance names are listed. To list only registered or deregistered
  /// on-premises instance names, use the registration status parameter.
  ///
  /// May throw [InvalidRegistrationStatusException].
  /// May throw [InvalidTagFilterException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list on-premises instances call.
  /// It can be used to return the next set of on-premises instances in the
  /// list.
  ///
  /// Parameter [registrationStatus] :
  /// The registration status of the on-premises instances:
  ///
  /// <ul>
  /// <li>
  /// <code>Deregistered</code>: Include deregistered on-premises instances in
  /// the resulting list.
  /// </li>
  /// <li>
  /// <code>Registered</code>: Include registered on-premises instances in the
  /// resulting list.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagFilters] :
  /// The on-premises instance tags that are used to restrict the on-premises
  /// instance names returned.
  Future<ListOnPremisesInstancesOutput> listOnPremisesInstances({
    String nextToken,
    RegistrationStatus registrationStatus,
    List<TagFilter> tagFilters,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListOnPremisesInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
        if (registrationStatus != null)
          'registrationStatus': registrationStatus.toValue(),
        if (tagFilters != null) 'tagFilters': tagFilters,
      },
    );

    return ListOnPremisesInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of tags for the resource identified by a specified Amazon
  /// Resource Name (ARN). Tags are used to organize and categorize your
  /// CodeDeploy resources.
  ///
  /// May throw [ArnNotSupportedException].
  /// May throw [InvalidArnException].
  /// May throw [ResourceArnRequiredException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of a CodeDeploy resource. <code>ListTagsForResource</code> returns
  /// all the tags associated with the resource that is identified by the
  /// <code>ResourceArn</code>.
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous <code>ListTagsForResource</code>
  /// call. It can be used to return the next set of applications in the list.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceArn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Sets the result of a Lambda validation function. The function validates
  /// lifecycle hooks during a deployment that uses the AWS Lambda or Amazon ECS
  /// compute platform. For AWS Lambda deployments, the available lifecycle
  /// hooks are <code>BeforeAllowTraffic</code> and
  /// <code>AfterAllowTraffic</code>. For Amazon ECS deployments, the available
  /// lifecycle hooks are <code>BeforeInstall</code>, <code>AfterInstall</code>,
  /// <code>AfterAllowTestTraffic</code>, <code>BeforeAllowTraffic</code>, and
  /// <code>AfterAllowTraffic</code>. Lambda validation functions return
  /// <code>Succeeded</code> or <code>Failed</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda">AppSpec
  /// 'hooks' Section for an AWS Lambda Deployment </a> and <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs">AppSpec
  /// 'hooks' Section for an Amazon ECS Deployment</a>.
  ///
  /// May throw [InvalidLifecycleEventHookExecutionStatusException].
  /// May throw [InvalidLifecycleEventHookExecutionIdException].
  /// May throw [LifecycleEventAlreadyCompletedException].
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [UnsupportedActionForDeploymentTypeException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment. Pass this ID to a Lambda function that
  /// validates a deployment lifecycle event.
  ///
  /// Parameter [lifecycleEventHookExecutionId] :
  /// The execution ID of a deployment's lifecycle hook. A deployment lifecycle
  /// hook is specified in the <code>hooks</code> section of the AppSpec file.
  ///
  /// Parameter [status] :
  /// The result of a Lambda function that validates a deployment lifecycle
  /// event (<code>Succeeded</code> or <code>Failed</code>).
  Future<PutLifecycleEventHookExecutionStatusOutput>
      putLifecycleEventHookExecutionStatus({
    String deploymentId,
    String lifecycleEventHookExecutionId,
    LifecycleEventStatus status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.PutLifecycleEventHookExecutionStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
        if (lifecycleEventHookExecutionId != null)
          'lifecycleEventHookExecutionId': lifecycleEventHookExecutionId,
        if (status != null) 'status': status.toValue(),
      },
    );

    return PutLifecycleEventHookExecutionStatusOutput.fromJson(
        jsonResponse.body);
  }

  /// Registers with AWS CodeDeploy a revision for the specified application.
  ///
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [DescriptionTooLongException].
  /// May throw [RevisionRequiredException].
  /// May throw [InvalidRevisionException].
  ///
  /// Parameter [applicationName] :
  /// The name of an AWS CodeDeploy application associated with the IAM user or
  /// AWS account.
  ///
  /// Parameter [revision] :
  /// Information about the application revision to register, including type and
  /// location.
  ///
  /// Parameter [description] :
  /// A comment about the revision.
  Future<void> registerApplicationRevision({
    @_s.required String applicationName,
    @_s.required RevisionLocation revision,
    String description,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(revision, 'revision');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RegisterApplicationRevision'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'revision': revision,
        if (description != null) 'description': description,
      },
    );
  }

  /// Registers an on-premises instance.
  /// <note>
  /// Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the
  /// request. You cannot use both.
  /// </note>
  ///
  /// May throw [InstanceNameAlreadyRegisteredException].
  /// May throw [IamArnRequiredException].
  /// May throw [IamSessionArnAlreadyRegisteredException].
  /// May throw [IamUserArnAlreadyRegisteredException].
  /// May throw [InstanceNameRequiredException].
  /// May throw [IamUserArnRequiredException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [InvalidIamSessionArnException].
  /// May throw [InvalidIamUserArnException].
  /// May throw [MultipleIamArnsProvidedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the on-premises instance to register.
  ///
  /// Parameter [iamSessionArn] :
  /// The ARN of the IAM session to associate with the on-premises instance.
  ///
  /// Parameter [iamUserArn] :
  /// The ARN of the IAM user to associate with the on-premises instance.
  Future<void> registerOnPremisesInstance({
    @_s.required String instanceName,
    String iamSessionArn,
    String iamUserArn,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RegisterOnPremisesInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        if (iamSessionArn != null) 'iamSessionArn': iamSessionArn,
        if (iamUserArn != null) 'iamUserArn': iamUserArn,
      },
    );
  }

  /// Removes one or more tags from one or more on-premises instances.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InvalidInstanceNameException].
  /// May throw [TagRequiredException].
  /// May throw [InvalidTagException].
  /// May throw [TagLimitExceededException].
  /// May throw [InstanceLimitExceededException].
  /// May throw [InstanceNotRegisteredException].
  ///
  /// Parameter [instanceNames] :
  /// The names of the on-premises instances from which to remove tags.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs to remove from the on-premises instances.
  Future<void> removeTagsFromOnPremisesInstances({
    @_s.required List<String> instanceNames,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RemoveTagsFromOnPremisesInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceNames': instanceNames,
        'tags': tags,
      },
    );
  }

  /// In a blue/green deployment, overrides any specified wait time and starts
  /// terminating instances immediately after the traffic routing is complete.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentAlreadyCompletedException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [DeploymentNotStartedException].
  /// May throw [UnsupportedActionForDeploymentTypeException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a blue/green deployment for which you want to skip the
  /// instance termination wait time.
  @Deprecated('Deprecated')
  Future<void> skipWaitTimeForInstanceTermination({
    String deploymentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.SkipWaitTimeForInstanceTermination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deploymentId != null) 'deploymentId': deploymentId,
      },
    );
  }

  /// Attempts to stop an ongoing deployment.
  ///
  /// May throw [DeploymentIdRequiredException].
  /// May throw [DeploymentDoesNotExistException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [DeploymentAlreadyCompletedException].
  /// May throw [InvalidDeploymentIdException].
  /// May throw [UnsupportedActionForDeploymentTypeException].
  ///
  /// Parameter [deploymentId] :
  /// The unique ID of a deployment.
  ///
  /// Parameter [autoRollbackEnabled] :
  /// Indicates, when a deployment is stopped, whether instances that have been
  /// updated should be rolled back to the previous version of the application
  /// revision.
  Future<StopDeploymentOutput> stopDeployment({
    @_s.required String deploymentId,
    bool autoRollbackEnabled,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.StopDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deploymentId': deploymentId,
        if (autoRollbackEnabled != null)
          'autoRollbackEnabled': autoRollbackEnabled,
      },
    );

    return StopDeploymentOutput.fromJson(jsonResponse.body);
  }

  /// Associates the list of tags in the input <code>Tags</code> parameter with
  /// the resource identified by the <code>ResourceArn</code> input parameter.
  ///
  /// May throw [ResourceArnRequiredException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [TagRequiredException].
  /// May throw [InvalidTagsToAddException].
  /// May throw [ArnNotSupportedException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of a resource, such as a CodeDeploy application or deployment
  /// group.
  ///
  /// Parameter [tags] :
  /// A list of tags that <code>TagResource</code> associates with a resource.
  /// The resource is identified by the <code>ResourceArn</code> input
  /// parameter.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Disassociates a resource from a list of tags. The resource is identified
  /// by the <code>ResourceArn</code> input parameter. The tags are identified
  /// by the list of keys in the <code>TagKeys</code> input parameter.
  ///
  /// May throw [ResourceArnRequiredException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [TagRequiredException].
  /// May throw [InvalidTagsToAddException].
  /// May throw [ArnNotSupportedException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that specifies from which resource to
  /// disassociate the tags with the keys in the <code>TagKeys</code> input
  /// parameter.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of <code>Tag</code> objects. The <code>Tag</code> objects
  /// identified by the keys are disassociated from the resource specified by
  /// the <code>ResourceArn</code> input parameter.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.UntagResource'
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

    return UntagResourceOutput.fromJson(jsonResponse.body);
  }

  /// Changes the name of an application.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationAlreadyExistsException].
  /// May throw [ApplicationDoesNotExistException].
  ///
  /// Parameter [applicationName] :
  /// The current name of the application you want to change.
  ///
  /// Parameter [newApplicationName] :
  /// The new name to give the application.
  Future<void> updateApplication({
    String applicationName,
    String newApplicationName,
  }) async {
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
    );
    _s.validateStringLength(
      'newApplicationName',
      newApplicationName,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (applicationName != null) 'applicationName': applicationName,
        if (newApplicationName != null)
          'newApplicationName': newApplicationName,
      },
    );
  }

  /// Changes information about a deployment group.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [InvalidDeploymentGroupNameException].
  /// May throw [DeploymentGroupAlreadyExistsException].
  /// May throw [DeploymentGroupNameRequiredException].
  /// May throw [DeploymentGroupDoesNotExistException].
  /// May throw [InvalidEC2TagException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidAutoScalingGroupException].
  /// May throw [InvalidDeploymentConfigNameException].
  /// May throw [DeploymentConfigDoesNotExistException].
  /// May throw [InvalidRoleException].
  /// May throw [LifecycleHookLimitExceededException].
  /// May throw [InvalidTriggerConfigException].
  /// May throw [TriggerTargetsLimitExceededException].
  /// May throw [InvalidAlarmConfigException].
  /// May throw [AlarmsLimitExceededException].
  /// May throw [InvalidAutoRollbackConfigException].
  /// May throw [InvalidLoadBalancerInfoException].
  /// May throw [InvalidDeploymentStyleException].
  /// May throw [InvalidBlueGreenDeploymentConfigurationException].
  /// May throw [InvalidEC2TagCombinationException].
  /// May throw [InvalidOnPremisesTagCombinationException].
  /// May throw [TagSetListLimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidECSServiceException].
  /// May throw [InvalidTargetGroupPairException].
  /// May throw [ECSServiceMappingLimitExceededException].
  /// May throw [InvalidTrafficRoutingConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The application name that corresponds to the deployment group to update.
  ///
  /// Parameter [currentDeploymentGroupName] :
  /// The current name of the deployment group.
  ///
  /// Parameter [alarmConfiguration] :
  /// Information to add or change about Amazon CloudWatch alarms when the
  /// deployment group is updated.
  ///
  /// Parameter [autoRollbackConfiguration] :
  /// Information for an automatic rollback configuration that is added or
  /// changed when a deployment group is updated.
  ///
  /// Parameter [autoScalingGroups] :
  /// The replacement list of Auto Scaling groups to be included in the
  /// deployment group, if you want to change them. To keep the Auto Scaling
  /// groups, enter their names. To remove Auto Scaling groups, do not enter any
  /// Auto Scaling group names.
  ///
  /// Parameter [blueGreenDeploymentConfiguration] :
  /// Information about blue/green deployment options for a deployment group.
  ///
  /// Parameter [deploymentConfigName] :
  /// The replacement deployment configuration name to use, if you want to
  /// change it.
  ///
  /// Parameter [deploymentStyle] :
  /// Information about the type of deployment, either in-place or blue/green,
  /// you want to run and whether to route deployment traffic behind a load
  /// balancer.
  ///
  /// Parameter [ec2TagFilters] :
  /// The replacement set of Amazon EC2 tags on which to filter, if you want to
  /// change them. To keep the existing tags, enter their names. To remove tags,
  /// do not enter any tag names.
  ///
  /// Parameter [ec2TagSet] :
  /// Information about groups of tags applied to on-premises instances. The
  /// deployment group includes only EC2 instances identified by all the tag
  /// groups.
  ///
  /// Parameter [ecsServices] :
  /// The target Amazon ECS services in the deployment group. This applies only
  /// to deployment groups that use the Amazon ECS compute platform. A target
  /// Amazon ECS service is specified as an Amazon ECS cluster and service name
  /// pair using the format
  /// <code>&lt;clustername&gt;:&lt;servicename&gt;</code>.
  ///
  /// Parameter [loadBalancerInfo] :
  /// Information about the load balancer used in a deployment.
  ///
  /// Parameter [newDeploymentGroupName] :
  /// The new name of the deployment group, if you want to change it.
  ///
  /// Parameter [onPremisesInstanceTagFilters] :
  /// The replacement set of on-premises instance tags on which to filter, if
  /// you want to change them. To keep the existing tags, enter their names. To
  /// remove tags, do not enter any tag names.
  ///
  /// Parameter [onPremisesTagSet] :
  /// Information about an on-premises instance tag set. The deployment group
  /// includes only on-premises instances identified by all the tag groups.
  ///
  /// Parameter [serviceRoleArn] :
  /// A replacement ARN for the service role, if you want to change it.
  ///
  /// Parameter [triggerConfigurations] :
  /// Information about triggers to change when the deployment group is updated.
  /// For examples, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-edit.html">Edit
  /// a Trigger in a CodeDeploy Deployment Group</a> in the <i>AWS CodeDeploy
  /// User Guide</i>.
  Future<UpdateDeploymentGroupOutput> updateDeploymentGroup({
    @_s.required String applicationName,
    @_s.required String currentDeploymentGroupName,
    AlarmConfiguration alarmConfiguration,
    AutoRollbackConfiguration autoRollbackConfiguration,
    List<String> autoScalingGroups,
    BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration,
    String deploymentConfigName,
    DeploymentStyle deploymentStyle,
    List<EC2TagFilter> ec2TagFilters,
    EC2TagSet ec2TagSet,
    List<ECSService> ecsServices,
    LoadBalancerInfo loadBalancerInfo,
    String newDeploymentGroupName,
    List<TagFilter> onPremisesInstanceTagFilters,
    OnPremisesTagSet onPremisesTagSet,
    String serviceRoleArn,
    List<TriggerConfig> triggerConfigurations,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentDeploymentGroupName, 'currentDeploymentGroupName');
    _s.validateStringLength(
      'currentDeploymentGroupName',
      currentDeploymentGroupName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'deploymentConfigName',
      deploymentConfigName,
      1,
      100,
    );
    _s.validateStringLength(
      'newDeploymentGroupName',
      newDeploymentGroupName,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.UpdateDeploymentGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applicationName': applicationName,
        'currentDeploymentGroupName': currentDeploymentGroupName,
        if (alarmConfiguration != null)
          'alarmConfiguration': alarmConfiguration,
        if (autoRollbackConfiguration != null)
          'autoRollbackConfiguration': autoRollbackConfiguration,
        if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
        if (blueGreenDeploymentConfiguration != null)
          'blueGreenDeploymentConfiguration': blueGreenDeploymentConfiguration,
        if (deploymentConfigName != null)
          'deploymentConfigName': deploymentConfigName,
        if (deploymentStyle != null) 'deploymentStyle': deploymentStyle,
        if (ec2TagFilters != null) 'ec2TagFilters': ec2TagFilters,
        if (ec2TagSet != null) 'ec2TagSet': ec2TagSet,
        if (ecsServices != null) 'ecsServices': ecsServices,
        if (loadBalancerInfo != null) 'loadBalancerInfo': loadBalancerInfo,
        if (newDeploymentGroupName != null)
          'newDeploymentGroupName': newDeploymentGroupName,
        if (onPremisesInstanceTagFilters != null)
          'onPremisesInstanceTagFilters': onPremisesInstanceTagFilters,
        if (onPremisesTagSet != null) 'onPremisesTagSet': onPremisesTagSet,
        if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
        if (triggerConfigurations != null)
          'triggerConfigurations': triggerConfigurations,
      },
    );

    return UpdateDeploymentGroupOutput.fromJson(jsonResponse.body);
  }
}

/// Information about an alarm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Alarm {
  /// The name of the alarm. Maximum length is 255 characters. Each alarm name can
  /// be used only once in a list of alarms.
  @_s.JsonKey(name: 'name')
  final String name;

  Alarm({
    this.name,
  });
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmToJson(this);
}

/// Information about alarms associated with the deployment group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlarmConfiguration {
  /// A list of alarms configured for the deployment group. A maximum of 10 alarms
  /// can be added to a deployment group.
  @_s.JsonKey(name: 'alarms')
  final List<Alarm> alarms;

  /// Indicates whether the alarm configuration is enabled.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// Indicates whether a deployment should continue if information about the
  /// current state of alarms cannot be retrieved from Amazon CloudWatch. The
  /// default value is false.
  ///
  /// <ul>
  /// <li>
  /// <code>true</code>: The deployment proceeds even if alarm status information
  /// can't be retrieved from Amazon CloudWatch.
  /// </li>
  /// <li>
  /// <code>false</code>: The deployment stops if alarm status information can't
  /// be retrieved from Amazon CloudWatch.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ignorePollAlarmFailure')
  final bool ignorePollAlarmFailure;

  AlarmConfiguration({
    this.alarms,
    this.enabled,
    this.ignorePollAlarmFailure,
  });
  factory AlarmConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AlarmConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmConfigurationToJson(this);
}

/// A revision for an AWS Lambda or Amazon ECS deployment that is a
/// YAML-formatted or JSON-formatted string. For AWS Lambda and Amazon ECS
/// deployments, the revision is the same as the AppSpec file. This method
/// replaces the deprecated <code>RawString</code> data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppSpecContent {
  /// The YAML-formatted or JSON-formatted revision string.
  ///
  /// For an AWS Lambda deployment, the content includes a Lambda function name,
  /// the alias for its original version, and the alias for its replacement
  /// version. The deployment shifts traffic from the original version of the
  /// Lambda function to the replacement version.
  ///
  /// For an Amazon ECS deployment, the content includes the task name,
  /// information about the load balancer that serves traffic to the container,
  /// and more.
  ///
  /// For both types of deployments, the content can specify Lambda functions that
  /// run at specified hooks, such as <code>BeforeInstall</code>, during a
  /// deployment.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The SHA256 hash value of the revision content.
  @_s.JsonKey(name: 'sha256')
  final String sha256;

  AppSpecContent({
    this.content,
    this.sha256,
  });
  factory AppSpecContent.fromJson(Map<String, dynamic> json) =>
      _$AppSpecContentFromJson(json);

  Map<String, dynamic> toJson() => _$AppSpecContentToJson(this);
}

/// Information about an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationInfo {
  /// The application ID.
  @_s.JsonKey(name: 'applicationId')
  final String applicationId;

  /// The application name.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// The destination platform type for deployment of the application
  /// (<code>Lambda</code> or <code>Server</code>).
  @_s.JsonKey(name: 'computePlatform')
  final ComputePlatform computePlatform;

  /// The time at which the application was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The name for a connection to a GitHub account.
  @_s.JsonKey(name: 'gitHubAccountName')
  final String gitHubAccountName;

  /// True if the user has authenticated with GitHub for the specified
  /// application. Otherwise, false.
  @_s.JsonKey(name: 'linkedToGitHub')
  final bool linkedToGitHub;

  ApplicationInfo({
    this.applicationId,
    this.applicationName,
    this.computePlatform,
    this.createTime,
    this.gitHubAccountName,
    this.linkedToGitHub,
  });
  factory ApplicationInfo.fromJson(Map<String, dynamic> json) =>
      _$ApplicationInfoFromJson(json);
}

enum ApplicationRevisionSortBy {
  @_s.JsonValue('registerTime')
  registerTime,
  @_s.JsonValue('firstUsedTime')
  firstUsedTime,
  @_s.JsonValue('lastUsedTime')
  lastUsedTime,
}

extension on ApplicationRevisionSortBy {
  String toValue() {
    switch (this) {
      case ApplicationRevisionSortBy.registerTime:
        return 'registerTime';
      case ApplicationRevisionSortBy.firstUsedTime:
        return 'firstUsedTime';
      case ApplicationRevisionSortBy.lastUsedTime:
        return 'lastUsedTime';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a configuration for automatically rolling back to a
/// previous version of an application revision when a deployment is not
/// completed successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoRollbackConfiguration {
  /// Indicates whether a defined automatic rollback configuration is currently
  /// enabled.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The event type or types that trigger a rollback.
  @_s.JsonKey(name: 'events')
  final List<AutoRollbackEvent> events;

  AutoRollbackConfiguration({
    this.enabled,
    this.events,
  });
  factory AutoRollbackConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AutoRollbackConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AutoRollbackConfigurationToJson(this);
}

enum AutoRollbackEvent {
  @_s.JsonValue('DEPLOYMENT_FAILURE')
  deploymentFailure,
  @_s.JsonValue('DEPLOYMENT_STOP_ON_ALARM')
  deploymentStopOnAlarm,
  @_s.JsonValue('DEPLOYMENT_STOP_ON_REQUEST')
  deploymentStopOnRequest,
}

/// Information about an Auto Scaling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingGroup {
  /// An Auto Scaling lifecycle event hook name.
  @_s.JsonKey(name: 'hook')
  final String hook;

  /// The Auto Scaling group name.
  @_s.JsonKey(name: 'name')
  final String name;

  AutoScalingGroup({
    this.hook,
    this.name,
  });
  factory AutoScalingGroup.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingGroupFromJson(json);
}

/// Represents the output of a <code>BatchGetApplicationRevisions</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetApplicationRevisionsOutput {
  /// The name of the application that corresponds to the revisions.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// Information about errors that might have occurred during the API call.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Additional information about the revisions, including the type and location.
  @_s.JsonKey(name: 'revisions')
  final List<RevisionInfo> revisions;

  BatchGetApplicationRevisionsOutput({
    this.applicationName,
    this.errorMessage,
    this.revisions,
  });
  factory BatchGetApplicationRevisionsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetApplicationRevisionsOutputFromJson(json);
}

/// Represents the output of a <code>BatchGetApplications</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetApplicationsOutput {
  /// Information about the applications.
  @_s.JsonKey(name: 'applicationsInfo')
  final List<ApplicationInfo> applicationsInfo;

  BatchGetApplicationsOutput({
    this.applicationsInfo,
  });
  factory BatchGetApplicationsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetApplicationsOutputFromJson(json);
}

/// Represents the output of a <code>BatchGetDeploymentGroups</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDeploymentGroupsOutput {
  /// Information about the deployment groups.
  @_s.JsonKey(name: 'deploymentGroupsInfo')
  final List<DeploymentGroupInfo> deploymentGroupsInfo;

  /// Information about errors that might have occurred during the API call.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  BatchGetDeploymentGroupsOutput({
    this.deploymentGroupsInfo,
    this.errorMessage,
  });
  factory BatchGetDeploymentGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDeploymentGroupsOutputFromJson(json);
}

/// Represents the output of a <code>BatchGetDeploymentInstances</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDeploymentInstancesOutput {
  /// Information about errors that might have occurred during the API call.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Information about the instance.
  @_s.JsonKey(name: 'instancesSummary')
  final List<InstanceSummary> instancesSummary;

  BatchGetDeploymentInstancesOutput({
    this.errorMessage,
    this.instancesSummary,
  });
  factory BatchGetDeploymentInstancesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetDeploymentInstancesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDeploymentTargetsOutput {
  /// A list of target objects for a deployment. Each target object contains
  /// details about the target, such as its status and lifecycle events. The type
  /// of the target objects depends on the deployment' compute platform.
  ///
  /// <ul>
  /// <li>
  /// <b>EC2/On-premises</b>: Each target object is an EC2 or on-premises
  /// instance.
  /// </li>
  /// <li>
  /// <b>AWS Lambda</b>: The target object is a specific version of an AWS Lambda
  /// function.
  /// </li>
  /// <li>
  /// <b>Amazon ECS</b>: The target object is an Amazon ECS service.
  /// </li>
  /// <li>
  /// <b>CloudFormation</b>: The target object is an AWS CloudFormation blue/green
  /// deployment.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'deploymentTargets')
  final List<DeploymentTarget> deploymentTargets;

  BatchGetDeploymentTargetsOutput({
    this.deploymentTargets,
  });
  factory BatchGetDeploymentTargetsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDeploymentTargetsOutputFromJson(json);
}

/// Represents the output of a <code>BatchGetDeployments</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetDeploymentsOutput {
  /// Information about the deployments.
  @_s.JsonKey(name: 'deploymentsInfo')
  final List<DeploymentInfo> deploymentsInfo;

  BatchGetDeploymentsOutput({
    this.deploymentsInfo,
  });
  factory BatchGetDeploymentsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetDeploymentsOutputFromJson(json);
}

/// Represents the output of a <code>BatchGetOnPremisesInstances</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetOnPremisesInstancesOutput {
  /// Information about the on-premises instances.
  @_s.JsonKey(name: 'instanceInfos')
  final List<InstanceInfo> instanceInfos;

  BatchGetOnPremisesInstancesOutput({
    this.instanceInfos,
  });
  factory BatchGetOnPremisesInstancesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetOnPremisesInstancesOutputFromJson(json);
}

/// Information about blue/green deployment options for a deployment group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlueGreenDeploymentConfiguration {
  /// Information about the action to take when newly provisioned instances are
  /// ready to receive traffic in a blue/green deployment.
  @_s.JsonKey(name: 'deploymentReadyOption')
  final DeploymentReadyOption deploymentReadyOption;

  /// Information about how instances are provisioned for a replacement
  /// environment in a blue/green deployment.
  @_s.JsonKey(name: 'greenFleetProvisioningOption')
  final GreenFleetProvisioningOption greenFleetProvisioningOption;

  /// Information about whether to terminate instances in the original fleet
  /// during a blue/green deployment.
  @_s.JsonKey(name: 'terminateBlueInstancesOnDeploymentSuccess')
  final BlueInstanceTerminationOption terminateBlueInstancesOnDeploymentSuccess;

  BlueGreenDeploymentConfiguration({
    this.deploymentReadyOption,
    this.greenFleetProvisioningOption,
    this.terminateBlueInstancesOnDeploymentSuccess,
  });
  factory BlueGreenDeploymentConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$BlueGreenDeploymentConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BlueGreenDeploymentConfigurationToJson(this);
}

/// Information about whether instances in the original environment are
/// terminated when a blue/green deployment is successful.
/// <code>BlueInstanceTerminationOption</code> does not apply to Lambda
/// deployments.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlueInstanceTerminationOption {
  /// The action to take on instances in the original environment after a
  /// successful blue/green deployment.
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code>: Instances are terminated after a specified wait
  /// time.
  /// </li>
  /// <li>
  /// <code>KEEP_ALIVE</code>: Instances are left running after they are
  /// deregistered from the load balancer and removed from the deployment group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'action')
  final InstanceAction action;

  /// For an Amazon EC2 deployment, the number of minutes to wait after a
  /// successful blue/green deployment before terminating instances from the
  /// original environment.
  ///
  /// For an Amazon ECS deployment, the number of minutes before deleting the
  /// original (blue) task set. During an Amazon ECS deployment, CodeDeploy shifts
  /// traffic from the original (blue) task set to a replacement (green) task set.
  ///
  /// The maximum setting is 2880 minutes (2 days).
  @_s.JsonKey(name: 'terminationWaitTimeInMinutes')
  final int terminationWaitTimeInMinutes;

  BlueInstanceTerminationOption({
    this.action,
    this.terminationWaitTimeInMinutes,
  });
  factory BlueInstanceTerminationOption.fromJson(Map<String, dynamic> json) =>
      _$BlueInstanceTerminationOptionFromJson(json);

  Map<String, dynamic> toJson() => _$BlueInstanceTerminationOptionToJson(this);
}

enum BundleType {
  @_s.JsonValue('tar')
  tar,
  @_s.JsonValue('tgz')
  tgz,
  @_s.JsonValue('zip')
  zip,
  @_s.JsonValue('YAML')
  yaml,
  @_s.JsonValue('JSON')
  json,
}

/// Information about the target to be updated by an AWS CloudFormation
/// blue/green deployment. This target type is used for all deployments
/// initiated by a CloudFormation stack update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudFormationTarget {
  /// The unique ID of an AWS CloudFormation blue/green deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The date and time when the target application was updated by an AWS
  /// CloudFormation blue/green deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The lifecycle events of the AWS CloudFormation blue/green deployment to this
  /// target application.
  @_s.JsonKey(name: 'lifecycleEvents')
  final List<LifecycleEvent> lifecycleEvents;

  /// The resource type for the AWS CloudFormation blue/green deployment.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  /// The status of an AWS CloudFormation blue/green deployment's target
  /// application.
  @_s.JsonKey(name: 'status')
  final TargetStatus status;

  /// The unique ID of a deployment target that has a type
  /// of <code>CloudFormationTarget</code>.
  @_s.JsonKey(name: 'targetId')
  final String targetId;

  /// The percentage of production traffic that the target version of an AWS
  /// CloudFormation blue/green deployment receives.
  @_s.JsonKey(name: 'targetVersionWeight')
  final double targetVersionWeight;

  CloudFormationTarget({
    this.deploymentId,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.resourceType,
    this.status,
    this.targetId,
    this.targetVersionWeight,
  });
  factory CloudFormationTarget.fromJson(Map<String, dynamic> json) =>
      _$CloudFormationTargetFromJson(json);
}

enum ComputePlatform {
  @_s.JsonValue('Server')
  server,
  @_s.JsonValue('Lambda')
  lambda,
  @_s.JsonValue('ECS')
  ecs,
}

extension on ComputePlatform {
  String toValue() {
    switch (this) {
      case ComputePlatform.server:
        return 'Server';
      case ComputePlatform.lambda:
        return 'Lambda';
      case ComputePlatform.ecs:
        return 'ECS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>CreateApplication</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationOutput {
  /// A unique application ID.
  @_s.JsonKey(name: 'applicationId')
  final String applicationId;

  CreateApplicationOutput({
    this.applicationId,
  });
  factory CreateApplicationOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationOutputFromJson(json);
}

/// Represents the output of a <code>CreateDeploymentConfig</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentConfigOutput {
  /// A unique deployment configuration ID.
  @_s.JsonKey(name: 'deploymentConfigId')
  final String deploymentConfigId;

  CreateDeploymentConfigOutput({
    this.deploymentConfigId,
  });
  factory CreateDeploymentConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentConfigOutputFromJson(json);
}

/// Represents the output of a <code>CreateDeploymentGroup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentGroupOutput {
  /// A unique deployment group ID.
  @_s.JsonKey(name: 'deploymentGroupId')
  final String deploymentGroupId;

  CreateDeploymentGroupOutput({
    this.deploymentGroupId,
  });
  factory CreateDeploymentGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentGroupOutputFromJson(json);
}

/// Represents the output of a <code>CreateDeployment</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentOutput {
  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  CreateDeploymentOutput({
    this.deploymentId,
  });
  factory CreateDeploymentOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentOutputFromJson(json);
}

/// Represents the output of a <code>DeleteDeploymentGroup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, AWS CodeDeploy successfully
  /// removed all corresponding Auto Scaling lifecycle event hooks from the Amazon
  /// EC2 instances in the Auto Scaling group. If the output contains data, AWS
  /// CodeDeploy could not remove some Auto Scaling lifecycle event hooks from the
  /// Amazon EC2 instances in the Auto Scaling group.
  @_s.JsonKey(name: 'hooksNotCleanedUp')
  final List<AutoScalingGroup> hooksNotCleanedUp;

  DeleteDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });
  factory DeleteDeploymentGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeploymentGroupOutputFromJson(json);
}

/// Represents the output of a <code>DeleteGitHubAccountToken</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGitHubAccountTokenOutput {
  /// The name of the GitHub account connection that was deleted.
  @_s.JsonKey(name: 'tokenName')
  final String tokenName;

  DeleteGitHubAccountTokenOutput({
    this.tokenName,
  });
  factory DeleteGitHubAccountTokenOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGitHubAccountTokenOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourcesByExternalIdOutput {
  DeleteResourcesByExternalIdOutput();
  factory DeleteResourcesByExternalIdOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteResourcesByExternalIdOutputFromJson(json);
}

/// Information about a deployment configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentConfigInfo {
  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  @_s.JsonKey(name: 'computePlatform')
  final ComputePlatform computePlatform;

  /// The time at which the deployment configuration was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The deployment configuration ID.
  @_s.JsonKey(name: 'deploymentConfigId')
  final String deploymentConfigId;

  /// The deployment configuration name.
  @_s.JsonKey(name: 'deploymentConfigName')
  final String deploymentConfigName;

  /// Information about the number or percentage of minimum healthy instance.
  @_s.JsonKey(name: 'minimumHealthyHosts')
  final MinimumHealthyHosts minimumHealthyHosts;

  /// The configuration that specifies how the deployment traffic is routed. Used
  /// for deployments with a Lambda or ECS compute platform only.
  @_s.JsonKey(name: 'trafficRoutingConfig')
  final TrafficRoutingConfig trafficRoutingConfig;

  DeploymentConfigInfo({
    this.computePlatform,
    this.createTime,
    this.deploymentConfigId,
    this.deploymentConfigName,
    this.minimumHealthyHosts,
    this.trafficRoutingConfig,
  });
  factory DeploymentConfigInfo.fromJson(Map<String, dynamic> json) =>
      _$DeploymentConfigInfoFromJson(json);
}

enum DeploymentCreator {
  @_s.JsonValue('user')
  user,
  @_s.JsonValue('autoscaling')
  autoscaling,
  @_s.JsonValue('codeDeployRollback')
  codeDeployRollback,
  @_s.JsonValue('CodeDeploy')
  codeDeploy,
  @_s.JsonValue('CloudFormation')
  cloudFormation,
  @_s.JsonValue('CloudFormationRollback')
  cloudFormationRollback,
}

/// Information about a deployment group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentGroupInfo {
  /// A list of alarms associated with the deployment group.
  @_s.JsonKey(name: 'alarmConfiguration')
  final AlarmConfiguration alarmConfiguration;

  /// The application name.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// Information about the automatic rollback configuration associated with the
  /// deployment group.
  @_s.JsonKey(name: 'autoRollbackConfiguration')
  final AutoRollbackConfiguration autoRollbackConfiguration;

  /// A list of associated Auto Scaling groups.
  @_s.JsonKey(name: 'autoScalingGroups')
  final List<AutoScalingGroup> autoScalingGroups;

  /// Information about blue/green deployment options for a deployment group.
  @_s.JsonKey(name: 'blueGreenDeploymentConfiguration')
  final BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration;

  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  @_s.JsonKey(name: 'computePlatform')
  final ComputePlatform computePlatform;

  /// The deployment configuration name.
  @_s.JsonKey(name: 'deploymentConfigName')
  final String deploymentConfigName;

  /// The deployment group ID.
  @_s.JsonKey(name: 'deploymentGroupId')
  final String deploymentGroupId;

  /// The deployment group name.
  @_s.JsonKey(name: 'deploymentGroupName')
  final String deploymentGroupName;

  /// Information about the type of deployment, either in-place or blue/green, you
  /// want to run and whether to route deployment traffic behind a load balancer.
  @_s.JsonKey(name: 'deploymentStyle')
  final DeploymentStyle deploymentStyle;

  /// The Amazon EC2 tags on which to filter. The deployment group includes EC2
  /// instances with any of the specified tags.
  @_s.JsonKey(name: 'ec2TagFilters')
  final List<EC2TagFilter> ec2TagFilters;

  /// Information about groups of tags applied to an EC2 instance. The deployment
  /// group includes only EC2 instances identified by all of the tag groups.
  /// Cannot be used in the same call as ec2TagFilters.
  @_s.JsonKey(name: 'ec2TagSet')
  final EC2TagSet ec2TagSet;

  /// The target Amazon ECS services in the deployment group. This applies only to
  /// deployment groups that use the Amazon ECS compute platform. A target Amazon
  /// ECS service is specified as an Amazon ECS cluster and service name pair
  /// using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>.
  @_s.JsonKey(name: 'ecsServices')
  final List<ECSService> ecsServices;

  /// Information about the most recent attempted deployment to the deployment
  /// group.
  @_s.JsonKey(name: 'lastAttemptedDeployment')
  final LastDeploymentInfo lastAttemptedDeployment;

  /// Information about the most recent successful deployment to the deployment
  /// group.
  @_s.JsonKey(name: 'lastSuccessfulDeployment')
  final LastDeploymentInfo lastSuccessfulDeployment;

  /// Information about the load balancer to use in a deployment.
  @_s.JsonKey(name: 'loadBalancerInfo')
  final LoadBalancerInfo loadBalancerInfo;

  /// The on-premises instance tags on which to filter. The deployment group
  /// includes on-premises instances with any of the specified tags.
  @_s.JsonKey(name: 'onPremisesInstanceTagFilters')
  final List<TagFilter> onPremisesInstanceTagFilters;

  /// Information about groups of tags applied to an on-premises instance. The
  /// deployment group includes only on-premises instances identified by all the
  /// tag groups. Cannot be used in the same call as onPremisesInstanceTagFilters.
  @_s.JsonKey(name: 'onPremisesTagSet')
  final OnPremisesTagSet onPremisesTagSet;

  /// A service role Amazon Resource Name (ARN) that grants CodeDeploy permission
  /// to make calls to AWS services on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html">Create
  /// a Service Role for AWS CodeDeploy</a> in the <i>AWS CodeDeploy User
  /// Guide</i>.
  @_s.JsonKey(name: 'serviceRoleArn')
  final String serviceRoleArn;

  /// Information about the deployment group's target revision, including type and
  /// location.
  @_s.JsonKey(name: 'targetRevision')
  final RevisionLocation targetRevision;

  /// Information about triggers associated with the deployment group.
  @_s.JsonKey(name: 'triggerConfigurations')
  final List<TriggerConfig> triggerConfigurations;

  DeploymentGroupInfo({
    this.alarmConfiguration,
    this.applicationName,
    this.autoRollbackConfiguration,
    this.autoScalingGroups,
    this.blueGreenDeploymentConfiguration,
    this.computePlatform,
    this.deploymentConfigName,
    this.deploymentGroupId,
    this.deploymentGroupName,
    this.deploymentStyle,
    this.ec2TagFilters,
    this.ec2TagSet,
    this.ecsServices,
    this.lastAttemptedDeployment,
    this.lastSuccessfulDeployment,
    this.loadBalancerInfo,
    this.onPremisesInstanceTagFilters,
    this.onPremisesTagSet,
    this.serviceRoleArn,
    this.targetRevision,
    this.triggerConfigurations,
  });
  factory DeploymentGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$DeploymentGroupInfoFromJson(json);
}

/// Information about a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentInfo {
  /// Provides information about the results of a deployment, such as whether
  /// instances in the original environment in a blue/green deployment were not
  /// terminated.
  @_s.JsonKey(name: 'additionalDeploymentStatusInfo')
  final String additionalDeploymentStatusInfo;

  /// The application name.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// Information about the automatic rollback configuration associated with the
  /// deployment.
  @_s.JsonKey(name: 'autoRollbackConfiguration')
  final AutoRollbackConfiguration autoRollbackConfiguration;

  /// Information about blue/green deployment options for this deployment.
  @_s.JsonKey(name: 'blueGreenDeploymentConfiguration')
  final BlueGreenDeploymentConfiguration blueGreenDeploymentConfiguration;

  /// A timestamp that indicates when the deployment was complete.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completeTime')
  final DateTime completeTime;

  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  @_s.JsonKey(name: 'computePlatform')
  final ComputePlatform computePlatform;

  /// A timestamp that indicates when the deployment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The means by which the deployment was created:
  ///
  /// <ul>
  /// <li>
  /// <code>user</code>: A user created the deployment.
  /// </li>
  /// <li>
  /// <code>autoscaling</code>: Amazon EC2 Auto Scaling created the deployment.
  /// </li>
  /// <li>
  /// <code>codeDeployRollback</code>: A rollback process created the deployment.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'creator')
  final DeploymentCreator creator;

  /// The deployment configuration name.
  @_s.JsonKey(name: 'deploymentConfigName')
  final String deploymentConfigName;

  /// The deployment group name.
  @_s.JsonKey(name: 'deploymentGroupName')
  final String deploymentGroupName;

  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// A summary of the deployment status of the instances in the deployment.
  @_s.JsonKey(name: 'deploymentOverview')
  final DeploymentOverview deploymentOverview;

  /// Messages that contain information about the status of a deployment.
  @_s.JsonKey(name: 'deploymentStatusMessages')
  final List<String> deploymentStatusMessages;

  /// Information about the type of deployment, either in-place or blue/green, you
  /// want to run and whether to route deployment traffic behind a load balancer.
  @_s.JsonKey(name: 'deploymentStyle')
  final DeploymentStyle deploymentStyle;

  /// A comment about the deployment.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Information about any error associated with this deployment.
  @_s.JsonKey(name: 'errorInformation')
  final ErrorInformation errorInformation;

  /// The unique ID for an external resource (for example, a CloudFormation stack
  /// ID) that is linked to this deployment.
  @_s.JsonKey(name: 'externalId')
  final String externalId;

  /// Information about how AWS CodeDeploy handles files that already exist in a
  /// deployment target location but weren't part of the previous successful
  /// deployment.
  ///
  /// <ul>
  /// <li>
  /// <code>DISALLOW</code>: The deployment fails. This is also the default
  /// behavior if no option is specified.
  /// </li>
  /// <li>
  /// <code>OVERWRITE</code>: The version of the file from the application
  /// revision currently being deployed replaces the version already on the
  /// instance.
  /// </li>
  /// <li>
  /// <code>RETAIN</code>: The version of the file already on the instance is kept
  /// and used as part of the new deployment.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'fileExistsBehavior')
  final FileExistsBehavior fileExistsBehavior;

  /// If true, then if an <code>ApplicationStop</code>,
  /// <code>BeforeBlockTraffic</code>, or <code>AfterBlockTraffic</code>
  /// deployment lifecycle event to an instance fails, then the deployment
  /// continues to the next deployment lifecycle event. For example, if
  /// <code>ApplicationStop</code> fails, the deployment continues with
  /// DownloadBundle. If <code>BeforeBlockTraffic</code> fails, the deployment
  /// continues with <code>BlockTraffic</code>. If <code>AfterBlockTraffic</code>
  /// fails, the deployment continues with <code>ApplicationStop</code>.
  ///
  /// If false or not specified, then if a lifecycle event fails during a
  /// deployment to an instance, that deployment fails. If deployment to that
  /// instance is part of an overall deployment and the number of healthy hosts is
  /// not less than the minimum number of healthy hosts, then a deployment to the
  /// next instance is attempted.
  ///
  /// During a deployment, the AWS CodeDeploy agent runs the scripts specified for
  /// <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and
  /// <code>AfterBlockTraffic</code> in the AppSpec file from the previous
  /// successful deployment. (All other scripts are run from the AppSpec file in
  /// the current deployment.) If one of these scripts contains an error and does
  /// not run successfully, the deployment can fail.
  ///
  /// If the cause of the failure is a script from the last successful deployment
  /// that will never run successfully, create a new deployment and use
  /// <code>ignoreApplicationStopFailures</code> to specify that the
  /// <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and
  /// <code>AfterBlockTraffic</code> failures should be ignored.
  @_s.JsonKey(name: 'ignoreApplicationStopFailures')
  final bool ignoreApplicationStopFailures;

  /// Indicates whether the wait period set for the termination of instances in
  /// the original environment has started. Status is 'false' if the KEEP_ALIVE
  /// option is specified. Otherwise, 'true' as soon as the termination wait
  /// period starts.
  @_s.JsonKey(name: 'instanceTerminationWaitTimeStarted')
  final bool instanceTerminationWaitTimeStarted;

  /// Information about the load balancer used in the deployment.
  @_s.JsonKey(name: 'loadBalancerInfo')
  final LoadBalancerInfo loadBalancerInfo;

  /// Information about the application revision that was deployed to the
  /// deployment group before the most recent successful deployment.
  @_s.JsonKey(name: 'previousRevision')
  final RevisionLocation previousRevision;

  /// Information about the location of stored application artifacts and the
  /// service from which to retrieve them.
  @_s.JsonKey(name: 'revision')
  final RevisionLocation revision;

  /// Information about a deployment rollback.
  @_s.JsonKey(name: 'rollbackInfo')
  final RollbackInfo rollbackInfo;

  /// A timestamp that indicates when the deployment was deployed to the
  /// deployment group.
  ///
  /// In some cases, the reported value of the start time might be later than the
  /// complete time. This is due to differences in the clock settings of backend
  /// servers that participate in the deployment process.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The current state of the deployment as a whole.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

  /// Information about the instances that belong to the replacement environment
  /// in a blue/green deployment.
  @_s.JsonKey(name: 'targetInstances')
  final TargetInstances targetInstances;

  /// Indicates whether only instances that are not running the latest application
  /// revision are to be deployed to.
  @_s.JsonKey(name: 'updateOutdatedInstancesOnly')
  final bool updateOutdatedInstancesOnly;

  DeploymentInfo({
    this.additionalDeploymentStatusInfo,
    this.applicationName,
    this.autoRollbackConfiguration,
    this.blueGreenDeploymentConfiguration,
    this.completeTime,
    this.computePlatform,
    this.createTime,
    this.creator,
    this.deploymentConfigName,
    this.deploymentGroupName,
    this.deploymentId,
    this.deploymentOverview,
    this.deploymentStatusMessages,
    this.deploymentStyle,
    this.description,
    this.errorInformation,
    this.externalId,
    this.fileExistsBehavior,
    this.ignoreApplicationStopFailures,
    this.instanceTerminationWaitTimeStarted,
    this.loadBalancerInfo,
    this.previousRevision,
    this.revision,
    this.rollbackInfo,
    this.startTime,
    this.status,
    this.targetInstances,
    this.updateOutdatedInstancesOnly,
  });
  factory DeploymentInfo.fromJson(Map<String, dynamic> json) =>
      _$DeploymentInfoFromJson(json);
}

enum DeploymentOption {
  @_s.JsonValue('WITH_TRAFFIC_CONTROL')
  withTrafficControl,
  @_s.JsonValue('WITHOUT_TRAFFIC_CONTROL')
  withoutTrafficControl,
}

/// Information about the deployment status of the instances in the deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentOverview {
  /// The number of instances in the deployment in a failed state.
  @_s.JsonKey(name: 'Failed')
  final int failed;

  /// The number of instances in which the deployment is in progress.
  @_s.JsonKey(name: 'InProgress')
  final int inProgress;

  /// The number of instances in the deployment in a pending state.
  @_s.JsonKey(name: 'Pending')
  final int pending;

  /// The number of instances in a replacement environment ready to receive
  /// traffic in a blue/green deployment.
  @_s.JsonKey(name: 'Ready')
  final int ready;

  /// The number of instances in the deployment in a skipped state.
  @_s.JsonKey(name: 'Skipped')
  final int skipped;

  /// The number of instances in the deployment to which revisions have been
  /// successfully deployed.
  @_s.JsonKey(name: 'Succeeded')
  final int succeeded;

  DeploymentOverview({
    this.failed,
    this.inProgress,
    this.pending,
    this.ready,
    this.skipped,
    this.succeeded,
  });
  factory DeploymentOverview.fromJson(Map<String, dynamic> json) =>
      _$DeploymentOverviewFromJson(json);
}

enum DeploymentReadyAction {
  @_s.JsonValue('CONTINUE_DEPLOYMENT')
  continueDeployment,
  @_s.JsonValue('STOP_DEPLOYMENT')
  stopDeployment,
}

/// Information about how traffic is rerouted to instances in a replacement
/// environment in a blue/green deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentReadyOption {
  /// Information about when to reroute traffic from an original environment to a
  /// replacement environment in a blue/green deployment.
  ///
  /// <ul>
  /// <li>
  /// CONTINUE_DEPLOYMENT: Register new instances with the load balancer
  /// immediately after the new application revision is installed on the instances
  /// in the replacement environment.
  /// </li>
  /// <li>
  /// STOP_DEPLOYMENT: Do not register new instances with a load balancer unless
  /// traffic rerouting is started using <a>ContinueDeployment</a>. If traffic
  /// rerouting is not started before the end of the specified wait period, the
  /// deployment status is changed to Stopped.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'actionOnTimeout')
  final DeploymentReadyAction actionOnTimeout;

  /// The number of minutes to wait before the status of a blue/green deployment
  /// is changed to Stopped if rerouting is not started manually. Applies only to
  /// the <code>STOP_DEPLOYMENT</code> option for <code>actionOnTimeout</code>.
  @_s.JsonKey(name: 'waitTimeInMinutes')
  final int waitTimeInMinutes;

  DeploymentReadyOption({
    this.actionOnTimeout,
    this.waitTimeInMinutes,
  });
  factory DeploymentReadyOption.fromJson(Map<String, dynamic> json) =>
      _$DeploymentReadyOptionFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentReadyOptionToJson(this);
}

enum DeploymentStatus {
  @_s.JsonValue('Created')
  created,
  @_s.JsonValue('Queued')
  queued,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Baking')
  baking,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Ready')
  ready,
}

extension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.created:
        return 'Created';
      case DeploymentStatus.queued:
        return 'Queued';
      case DeploymentStatus.inProgress:
        return 'InProgress';
      case DeploymentStatus.baking:
        return 'Baking';
      case DeploymentStatus.succeeded:
        return 'Succeeded';
      case DeploymentStatus.failed:
        return 'Failed';
      case DeploymentStatus.stopped:
        return 'Stopped';
      case DeploymentStatus.ready:
        return 'Ready';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the type of deployment, either in-place or blue/green, you
/// want to run and whether to route deployment traffic behind a load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentStyle {
  /// Indicates whether to route deployment traffic behind a load balancer.
  @_s.JsonKey(name: 'deploymentOption')
  final DeploymentOption deploymentOption;

  /// Indicates whether to run an in-place deployment or a blue/green deployment.
  @_s.JsonKey(name: 'deploymentType')
  final DeploymentType deploymentType;

  DeploymentStyle({
    this.deploymentOption,
    this.deploymentType,
  });
  factory DeploymentStyle.fromJson(Map<String, dynamic> json) =>
      _$DeploymentStyleFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentStyleToJson(this);
}

/// Information about the deployment target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentTarget {
  @_s.JsonKey(name: 'cloudFormationTarget')
  final CloudFormationTarget cloudFormationTarget;

  /// The deployment type that is specific to the deployment's compute platform or
  /// deployments initiated by a CloudFormation stack update.
  @_s.JsonKey(name: 'deploymentTargetType')
  final DeploymentTargetType deploymentTargetType;

  /// Information about the target for a deployment that uses the Amazon ECS
  /// compute platform.
  @_s.JsonKey(name: 'ecsTarget')
  final ECSTarget ecsTarget;

  /// Information about the target for a deployment that uses the EC2/On-premises
  /// compute platform.
  @_s.JsonKey(name: 'instanceTarget')
  final InstanceTarget instanceTarget;

  /// Information about the target for a deployment that uses the AWS Lambda
  /// compute platform.
  @_s.JsonKey(name: 'lambdaTarget')
  final LambdaTarget lambdaTarget;

  DeploymentTarget({
    this.cloudFormationTarget,
    this.deploymentTargetType,
    this.ecsTarget,
    this.instanceTarget,
    this.lambdaTarget,
  });
  factory DeploymentTarget.fromJson(Map<String, dynamic> json) =>
      _$DeploymentTargetFromJson(json);
}

enum DeploymentTargetType {
  @_s.JsonValue('InstanceTarget')
  instanceTarget,
  @_s.JsonValue('LambdaTarget')
  lambdaTarget,
  @_s.JsonValue('ECSTarget')
  eCSTarget,
  @_s.JsonValue('CloudFormationTarget')
  cloudFormationTarget,
}

enum DeploymentType {
  @_s.JsonValue('IN_PLACE')
  inPlace,
  @_s.JsonValue('BLUE_GREEN')
  blueGreen,
}

enum DeploymentWaitType {
  @_s.JsonValue('READY_WAIT')
  readyWait,
  @_s.JsonValue('TERMINATION_WAIT')
  terminationWait,
}

extension on DeploymentWaitType {
  String toValue() {
    switch (this) {
      case DeploymentWaitType.readyWait:
        return 'READY_WAIT';
      case DeploymentWaitType.terminationWait:
        return 'TERMINATION_WAIT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Diagnostic information about executable scripts that are part of a
/// deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Diagnostics {
  /// The associated error code:
  ///
  /// <ul>
  /// <li>
  /// Success: The specified script ran.
  /// </li>
  /// <li>
  /// ScriptMissing: The specified script was not found in the specified location.
  /// </li>
  /// <li>
  /// ScriptNotExecutable: The specified script is not a recognized executable
  /// file type.
  /// </li>
  /// <li>
  /// ScriptTimedOut: The specified script did not finish running in the specified
  /// time period.
  /// </li>
  /// <li>
  /// ScriptFailed: The specified script failed to run as expected.
  /// </li>
  /// <li>
  /// UnknownError: The specified script did not run for an unknown reason.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'errorCode')
  final LifecycleErrorCode errorCode;

  /// The last portion of the diagnostic log.
  ///
  /// If available, AWS CodeDeploy returns up to the last 4 KB of the diagnostic
  /// log.
  @_s.JsonKey(name: 'logTail')
  final String logTail;

  /// The message associated with the error.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The name of the script.
  @_s.JsonKey(name: 'scriptName')
  final String scriptName;

  Diagnostics({
    this.errorCode,
    this.logTail,
    this.message,
    this.scriptName,
  });
  factory Diagnostics.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticsFromJson(json);
}

/// Information about an EC2 tag filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EC2TagFilter {
  /// The tag filter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag filter type:
  ///
  /// <ul>
  /// <li>
  /// <code>KEY_ONLY</code>: Key only.
  /// </li>
  /// <li>
  /// <code>VALUE_ONLY</code>: Value only.
  /// </li>
  /// <li>
  /// <code>KEY_AND_VALUE</code>: Key and value.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final EC2TagFilterType type;

  /// The tag filter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  EC2TagFilter({
    this.key,
    this.type,
    this.value,
  });
  factory EC2TagFilter.fromJson(Map<String, dynamic> json) =>
      _$EC2TagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$EC2TagFilterToJson(this);
}

enum EC2TagFilterType {
  @_s.JsonValue('KEY_ONLY')
  keyOnly,
  @_s.JsonValue('VALUE_ONLY')
  valueOnly,
  @_s.JsonValue('KEY_AND_VALUE')
  keyAndValue,
}

/// Information about groups of EC2 instance tags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EC2TagSet {
  /// A list that contains other lists of EC2 instance tag groups. For an instance
  /// to be included in the deployment group, it must be identified by all of the
  /// tag groups in the list.
  @_s.JsonKey(name: 'ec2TagSetList')
  final List<List<EC2TagFilter>> ec2TagSetList;

  EC2TagSet({
    this.ec2TagSetList,
  });
  factory EC2TagSet.fromJson(Map<String, dynamic> json) =>
      _$EC2TagSetFromJson(json);

  Map<String, dynamic> toJson() => _$EC2TagSetToJson(this);
}

/// Contains the service and cluster names used to identify an Amazon ECS
/// deployment's target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ECSService {
  /// The name of the cluster that the Amazon ECS service is associated with.
  @_s.JsonKey(name: 'clusterName')
  final String clusterName;

  /// The name of the target Amazon ECS service.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  ECSService({
    this.clusterName,
    this.serviceName,
  });
  factory ECSService.fromJson(Map<String, dynamic> json) =>
      _$ECSServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ECSServiceToJson(this);
}

/// Information about the target of an Amazon ECS deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ECSTarget {
  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The date and time when the target Amazon ECS application was updated by a
  /// deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The lifecycle events of the deployment to this target Amazon ECS
  /// application.
  @_s.JsonKey(name: 'lifecycleEvents')
  final List<LifecycleEvent> lifecycleEvents;

  /// The status an Amazon ECS deployment's target ECS application.
  @_s.JsonKey(name: 'status')
  final TargetStatus status;

  /// The Amazon Resource Name (ARN) of the target.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>ecsTarget</code>.
  @_s.JsonKey(name: 'targetId')
  final String targetId;

  /// The <code>ECSTaskSet</code> objects associated with the ECS target.
  @_s.JsonKey(name: 'taskSetsInfo')
  final List<ECSTaskSet> taskSetsInfo;

  ECSTarget({
    this.deploymentId,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
    this.taskSetsInfo,
  });
  factory ECSTarget.fromJson(Map<String, dynamic> json) =>
      _$ECSTargetFromJson(json);
}

/// Information about a set of Amazon ECS tasks in an AWS CodeDeploy deployment.
/// An Amazon ECS task set includes details such as the desired number of tasks,
/// how many tasks are running, and whether the task set serves production
/// traffic. An AWS CodeDeploy application that uses the Amazon ECS compute
/// platform deploys a containerized application in an Amazon ECS service as a
/// task set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ECSTaskSet {
  /// The number of tasks in a task set. During a deployment that uses the Amazon
  /// ECS compute type, CodeDeploy instructs Amazon ECS to create a new task set
  /// and uses this value to determine how many tasks to create. After the updated
  /// task set is created, CodeDeploy shifts traffic to the new task set.
  @_s.JsonKey(name: 'desiredCount')
  final int desiredCount;

  /// A unique ID of an <code>ECSTaskSet</code>.
  @_s.JsonKey(name: 'identifer')
  final String identifer;

  /// The number of tasks in the task set that are in the <code>PENDING</code>
  /// status during an Amazon ECS deployment. A task in the <code>PENDING</code>
  /// state is preparing to enter the <code>RUNNING</code> state. A task set
  /// enters the <code>PENDING</code> status when it launches for the first time,
  /// or when it is restarted after being in the <code>STOPPED</code> state.
  @_s.JsonKey(name: 'pendingCount')
  final int pendingCount;

  /// The number of tasks in the task set that are in the <code>RUNNING</code>
  /// status during an Amazon ECS deployment. A task in the <code>RUNNING</code>
  /// state is running and ready for use.
  @_s.JsonKey(name: 'runningCount')
  final int runningCount;

  /// The status of the task set. There are three valid task set statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>PRIMARY</code>: Indicates the task set is serving production traffic.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: Indicates the task set is not serving production
  /// traffic.
  /// </li>
  /// <li>
  /// <code>DRAINING</code>: Indicates the tasks in the task set are being stopped
  /// and their corresponding targets are being deregistered from their target
  /// group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  /// The target group associated with the task set. The target group is used by
  /// AWS CodeDeploy to manage traffic to a task set.
  @_s.JsonKey(name: 'targetGroup')
  final TargetGroupInfo targetGroup;

  /// A label that identifies whether the ECS task set is an original target
  /// (<code>BLUE</code>) or a replacement target (<code>GREEN</code>).
  @_s.JsonKey(name: 'taskSetLabel')
  final TargetLabel taskSetLabel;

  /// The percentage of traffic served by this task set.
  @_s.JsonKey(name: 'trafficWeight')
  final double trafficWeight;

  ECSTaskSet({
    this.desiredCount,
    this.identifer,
    this.pendingCount,
    this.runningCount,
    this.status,
    this.targetGroup,
    this.taskSetLabel,
    this.trafficWeight,
  });
  factory ECSTaskSet.fromJson(Map<String, dynamic> json) =>
      _$ECSTaskSetFromJson(json);
}

/// Information about a load balancer in Elastic Load Balancing to use in a
/// deployment. Instances are registered directly with a load balancer, and
/// traffic is routed to the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ELBInfo {
  /// For blue/green deployments, the name of the load balancer that is used to
  /// route traffic from original instances to replacement instances in a
  /// blue/green deployment. For in-place deployments, the name of the load
  /// balancer that instances are deregistered from so they are not serving
  /// traffic during a deployment, and then re-registered with after the
  /// deployment is complete.
  @_s.JsonKey(name: 'name')
  final String name;

  ELBInfo({
    this.name,
  });
  factory ELBInfo.fromJson(Map<String, dynamic> json) =>
      _$ELBInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ELBInfoToJson(this);
}

enum ErrorCode {
  @_s.JsonValue('AGENT_ISSUE')
  agentIssue,
  @_s.JsonValue('ALARM_ACTIVE')
  alarmActive,
  @_s.JsonValue('APPLICATION_MISSING')
  applicationMissing,
  @_s.JsonValue('AUTOSCALING_VALIDATION_ERROR')
  autoscalingValidationError,
  @_s.JsonValue('AUTO_SCALING_CONFIGURATION')
  autoScalingConfiguration,
  @_s.JsonValue('AUTO_SCALING_IAM_ROLE_PERMISSIONS')
  autoScalingIamRolePermissions,
  @_s.JsonValue('CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND')
  codedeployResourceCannotBeFound,
  @_s.JsonValue('CUSTOMER_APPLICATION_UNHEALTHY')
  customerApplicationUnhealthy,
  @_s.JsonValue('DEPLOYMENT_GROUP_MISSING')
  deploymentGroupMissing,
  @_s.JsonValue('ECS_UPDATE_ERROR')
  ecsUpdateError,
  @_s.JsonValue('ELASTIC_LOAD_BALANCING_INVALID')
  elasticLoadBalancingInvalid,
  @_s.JsonValue('ELB_INVALID_INSTANCE')
  elbInvalidInstance,
  @_s.JsonValue('HEALTH_CONSTRAINTS')
  healthConstraints,
  @_s.JsonValue('HEALTH_CONSTRAINTS_INVALID')
  healthConstraintsInvalid,
  @_s.JsonValue('HOOK_EXECUTION_FAILURE')
  hookExecutionFailure,
  @_s.JsonValue('IAM_ROLE_MISSING')
  iamRoleMissing,
  @_s.JsonValue('IAM_ROLE_PERMISSIONS')
  iamRolePermissions,
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('INVALID_ECS_SERVICE')
  invalidEcsService,
  @_s.JsonValue('INVALID_LAMBDA_CONFIGURATION')
  invalidLambdaConfiguration,
  @_s.JsonValue('INVALID_LAMBDA_FUNCTION')
  invalidLambdaFunction,
  @_s.JsonValue('INVALID_REVISION')
  invalidRevision,
  @_s.JsonValue('MANUAL_STOP')
  manualStop,
  @_s.JsonValue('MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION')
  missingBlueGreenDeploymentConfiguration,
  @_s.JsonValue('MISSING_ELB_INFORMATION')
  missingElbInformation,
  @_s.JsonValue('MISSING_GITHUB_TOKEN')
  missingGithubToken,
  @_s.JsonValue('NO_EC2_SUBSCRIPTION')
  noEc2Subscription,
  @_s.JsonValue('NO_INSTANCES')
  noInstances,
  @_s.JsonValue('OVER_MAX_INSTANCES')
  overMaxInstances,
  @_s.JsonValue('RESOURCE_LIMIT_EXCEEDED')
  resourceLimitExceeded,
  @_s.JsonValue('REVISION_MISSING')
  revisionMissing,
  @_s.JsonValue('THROTTLED')
  throttled,
  @_s.JsonValue('TIMEOUT')
  timeout,
  @_s.JsonValue('CLOUDFORMATION_STACK_FAILURE')
  cloudformationStackFailure,
}

/// Information about a deployment error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorInformation {
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/error-codes.html">Error
  /// Codes for AWS CodeDeploy</a> in the <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide">AWS
  /// CodeDeploy User Guide</a>.
  ///
  /// The error code:
  ///
  /// <ul>
  /// <li>
  /// APPLICATION_MISSING: The application was missing. This error code is most
  /// likely raised if the application is deleted after the deployment is created,
  /// but before it is started.
  /// </li>
  /// <li>
  /// DEPLOYMENT_GROUP_MISSING: The deployment group was missing. This error code
  /// is most likely raised if the deployment group is deleted after the
  /// deployment is created, but before it is started.
  /// </li>
  /// <li>
  /// HEALTH_CONSTRAINTS: The deployment failed on too many instances to be
  /// successfully deployed within the instance health constraints specified.
  /// </li>
  /// <li>
  /// HEALTH_CONSTRAINTS_INVALID: The revision cannot be successfully deployed
  /// within the instance health constraints specified.
  /// </li>
  /// <li>
  /// IAM_ROLE_MISSING: The service role cannot be accessed.
  /// </li>
  /// <li>
  /// IAM_ROLE_PERMISSIONS: The service role does not have the correct
  /// permissions.
  /// </li>
  /// <li>
  /// INTERNAL_ERROR: There was an internal error.
  /// </li>
  /// <li>
  /// NO_EC2_SUBSCRIPTION: The calling account is not subscribed to Amazon EC2.
  /// </li>
  /// <li>
  /// NO_INSTANCES: No instances were specified, or no instances can be found.
  /// </li>
  /// <li>
  /// OVER_MAX_INSTANCES: The maximum number of instances was exceeded.
  /// </li>
  /// <li>
  /// THROTTLED: The operation was throttled because the calling account exceeded
  /// the throttling limits of one or more AWS services.
  /// </li>
  /// <li>
  /// TIMEOUT: The deployment has timed out.
  /// </li>
  /// <li>
  /// REVISION_MISSING: The revision ID was missing. This error code is most
  /// likely raised if the revision is deleted after the deployment is created,
  /// but before it is started.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'code')
  final ErrorCode code;

  /// An accompanying error message.
  @_s.JsonKey(name: 'message')
  final String message;

  ErrorInformation({
    this.code,
    this.message,
  });
  factory ErrorInformation.fromJson(Map<String, dynamic> json) =>
      _$ErrorInformationFromJson(json);
}

enum FileExistsBehavior {
  @_s.JsonValue('DISALLOW')
  disallow,
  @_s.JsonValue('OVERWRITE')
  overwrite,
  @_s.JsonValue('RETAIN')
  retain,
}

extension on FileExistsBehavior {
  String toValue() {
    switch (this) {
      case FileExistsBehavior.disallow:
        return 'DISALLOW';
      case FileExistsBehavior.overwrite:
        return 'OVERWRITE';
      case FileExistsBehavior.retain:
        return 'RETAIN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an application revision.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenericRevisionInfo {
  /// The deployment groups for which this is the current target revision.
  @_s.JsonKey(name: 'deploymentGroups')
  final List<String> deploymentGroups;

  /// A comment about the revision.
  @_s.JsonKey(name: 'description')
  final String description;

  /// When the revision was first used by AWS CodeDeploy.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'firstUsedTime')
  final DateTime firstUsedTime;

  /// When the revision was last used by AWS CodeDeploy.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUsedTime')
  final DateTime lastUsedTime;

  /// When the revision was registered with AWS CodeDeploy.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'registerTime')
  final DateTime registerTime;

  GenericRevisionInfo({
    this.deploymentGroups,
    this.description,
    this.firstUsedTime,
    this.lastUsedTime,
    this.registerTime,
  });
  factory GenericRevisionInfo.fromJson(Map<String, dynamic> json) =>
      _$GenericRevisionInfoFromJson(json);
}

/// Represents the output of a <code>GetApplication</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApplicationOutput {
  /// Information about the application.
  @_s.JsonKey(name: 'application')
  final ApplicationInfo application;

  GetApplicationOutput({
    this.application,
  });
  factory GetApplicationOutput.fromJson(Map<String, dynamic> json) =>
      _$GetApplicationOutputFromJson(json);
}

/// Represents the output of a <code>GetApplicationRevision</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApplicationRevisionOutput {
  /// The name of the application that corresponds to the revision.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// Additional information about the revision, including type and location.
  @_s.JsonKey(name: 'revision')
  final RevisionLocation revision;

  /// General information about the revision.
  @_s.JsonKey(name: 'revisionInfo')
  final GenericRevisionInfo revisionInfo;

  GetApplicationRevisionOutput({
    this.applicationName,
    this.revision,
    this.revisionInfo,
  });
  factory GetApplicationRevisionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetApplicationRevisionOutputFromJson(json);
}

/// Represents the output of a <code>GetDeploymentConfig</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentConfigOutput {
  /// Information about the deployment configuration.
  @_s.JsonKey(name: 'deploymentConfigInfo')
  final DeploymentConfigInfo deploymentConfigInfo;

  GetDeploymentConfigOutput({
    this.deploymentConfigInfo,
  });
  factory GetDeploymentConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentConfigOutputFromJson(json);
}

/// Represents the output of a <code>GetDeploymentGroup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentGroupOutput {
  /// Information about the deployment group.
  @_s.JsonKey(name: 'deploymentGroupInfo')
  final DeploymentGroupInfo deploymentGroupInfo;

  GetDeploymentGroupOutput({
    this.deploymentGroupInfo,
  });
  factory GetDeploymentGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentGroupOutputFromJson(json);
}

/// Represents the output of a <code>GetDeploymentInstance</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentInstanceOutput {
  /// Information about the instance.
  @_s.JsonKey(name: 'instanceSummary')
  final InstanceSummary instanceSummary;

  GetDeploymentInstanceOutput({
    this.instanceSummary,
  });
  factory GetDeploymentInstanceOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentInstanceOutputFromJson(json);
}

/// Represents the output of a <code>GetDeployment</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentOutput {
  /// Information about the deployment.
  @_s.JsonKey(name: 'deploymentInfo')
  final DeploymentInfo deploymentInfo;

  GetDeploymentOutput({
    this.deploymentInfo,
  });
  factory GetDeploymentOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentTargetOutput {
  /// A deployment target that contains information about a deployment such as its
  /// status, lifecycle events, and when it was last updated. It also contains
  /// metadata about the deployment target. The deployment target metadata depends
  /// on the deployment target's type (<code>instanceTarget</code>,
  /// <code>lambdaTarget</code>, or <code>ecsTarget</code>).
  @_s.JsonKey(name: 'deploymentTarget')
  final DeploymentTarget deploymentTarget;

  GetDeploymentTargetOutput({
    this.deploymentTarget,
  });
  factory GetDeploymentTargetOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentTargetOutputFromJson(json);
}

/// Represents the output of a <code>GetOnPremisesInstance</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOnPremisesInstanceOutput {
  /// Information about the on-premises instance.
  @_s.JsonKey(name: 'instanceInfo')
  final InstanceInfo instanceInfo;

  GetOnPremisesInstanceOutput({
    this.instanceInfo,
  });
  factory GetOnPremisesInstanceOutput.fromJson(Map<String, dynamic> json) =>
      _$GetOnPremisesInstanceOutputFromJson(json);
}

/// Information about the location of application artifacts stored in GitHub.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GitHubLocation {
  /// The SHA1 commit ID of the GitHub commit that represents the bundled
  /// artifacts for the application revision.
  @_s.JsonKey(name: 'commitId')
  final String commitId;

  /// The GitHub account and repository pair that stores a reference to the commit
  /// that represents the bundled artifacts for the application revision.
  ///
  /// Specified as account/repository.
  @_s.JsonKey(name: 'repository')
  final String repository;

  GitHubLocation({
    this.commitId,
    this.repository,
  });
  factory GitHubLocation.fromJson(Map<String, dynamic> json) =>
      _$GitHubLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GitHubLocationToJson(this);
}

enum GreenFleetProvisioningAction {
  @_s.JsonValue('DISCOVER_EXISTING')
  discoverExisting,
  @_s.JsonValue('COPY_AUTO_SCALING_GROUP')
  copyAutoScalingGroup,
}

/// Information about the instances that belong to the replacement environment
/// in a blue/green deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GreenFleetProvisioningOption {
  /// The method used to add instances to a replacement environment.
  ///
  /// <ul>
  /// <li>
  /// <code>DISCOVER_EXISTING</code>: Use instances that already exist or will be
  /// created manually.
  /// </li>
  /// <li>
  /// <code>COPY_AUTO_SCALING_GROUP</code>: Use settings from a specified Auto
  /// Scaling group to define and create instances in a new Auto Scaling group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'action')
  final GreenFleetProvisioningAction action;

  GreenFleetProvisioningOption({
    this.action,
  });
  factory GreenFleetProvisioningOption.fromJson(Map<String, dynamic> json) =>
      _$GreenFleetProvisioningOptionFromJson(json);

  Map<String, dynamic> toJson() => _$GreenFleetProvisioningOptionToJson(this);
}

enum InstanceAction {
  @_s.JsonValue('TERMINATE')
  terminate,
  @_s.JsonValue('KEEP_ALIVE')
  keepAlive,
}

/// Information about an on-premises instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceInfo {
  /// If the on-premises instance was deregistered, the time at which the
  /// on-premises instance was deregistered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'deregisterTime')
  final DateTime deregisterTime;

  /// The ARN of the IAM session associated with the on-premises instance.
  @_s.JsonKey(name: 'iamSessionArn')
  final String iamSessionArn;

  /// The IAM user ARN associated with the on-premises instance.
  @_s.JsonKey(name: 'iamUserArn')
  final String iamUserArn;

  /// The ARN of the on-premises instance.
  @_s.JsonKey(name: 'instanceArn')
  final String instanceArn;

  /// The name of the on-premises instance.
  @_s.JsonKey(name: 'instanceName')
  final String instanceName;

  /// The time at which the on-premises instance was registered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'registerTime')
  final DateTime registerTime;

  /// The tags currently associated with the on-premises instance.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  InstanceInfo({
    this.deregisterTime,
    this.iamSessionArn,
    this.iamUserArn,
    this.instanceArn,
    this.instanceName,
    this.registerTime,
    this.tags,
  });
  factory InstanceInfo.fromJson(Map<String, dynamic> json) =>
      _$InstanceInfoFromJson(json);
}

@Deprecated('Deprecated')
enum InstanceStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Skipped')
  skipped,
  @_s.JsonValue('Unknown')
  unknown,
  @_s.JsonValue('Ready')
  ready,
}

extension on InstanceStatus {
  String toValue() {
    switch (this) {
      case InstanceStatus.pending:
        return 'Pending';
      case InstanceStatus.inProgress:
        return 'InProgress';
      case InstanceStatus.succeeded:
        return 'Succeeded';
      case InstanceStatus.failed:
        return 'Failed';
      case InstanceStatus.skipped:
        return 'Skipped';
      case InstanceStatus.unknown:
        return 'Unknown';
      case InstanceStatus.ready:
        return 'Ready';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an instance in a deployment.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceSummary {
  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The instance ID.
  @_s.JsonKey(name: 'instanceId')
  final String instanceId;

  /// Information about which environment an instance belongs to in a blue/green
  /// deployment.
  ///
  /// <ul>
  /// <li>
  /// BLUE: The instance is part of the original environment.
  /// </li>
  /// <li>
  /// GREEN: The instance is part of the replacement environment.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'instanceType')
  final InstanceType instanceType;

  /// A timestamp that indicates when the instance information was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A list of lifecycle events for this instance.
  @_s.JsonKey(name: 'lifecycleEvents')
  final List<LifecycleEvent> lifecycleEvents;

  /// The deployment status for this instance:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code>: The deployment is pending for this instance.
  /// </li>
  /// <li>
  /// <code>In Progress</code>: The deployment is in progress for this instance.
  /// </li>
  /// <li>
  /// <code>Succeeded</code>: The deployment has succeeded for this instance.
  /// </li>
  /// <li>
  /// <code>Failed</code>: The deployment has failed for this instance.
  /// </li>
  /// <li>
  /// <code>Skipped</code>: The deployment has been skipped for this instance.
  /// </li>
  /// <li>
  /// <code>Unknown</code>: The deployment status is unknown for this instance.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final InstanceStatus status;

  InstanceSummary({
    this.deploymentId,
    this.instanceId,
    this.instanceType,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
  });
  factory InstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$InstanceSummaryFromJson(json);
}

/// A target Amazon EC2 or on-premises instance during a deployment that uses
/// the EC2/On-premises compute platform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceTarget {
  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// A label that identifies whether the instance is an original target
  /// (<code>BLUE</code>) or a replacement target (<code>GREEN</code>).
  @_s.JsonKey(name: 'instanceLabel')
  final TargetLabel instanceLabel;

  /// The date and time when the target instance was updated by a deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The lifecycle events of the deployment to this target instance.
  @_s.JsonKey(name: 'lifecycleEvents')
  final List<LifecycleEvent> lifecycleEvents;

  /// The status an EC2/On-premises deployment's target instance.
  @_s.JsonKey(name: 'status')
  final TargetStatus status;

  /// The Amazon Resource Name (ARN) of the target.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>instanceTarget</code>.
  @_s.JsonKey(name: 'targetId')
  final String targetId;

  InstanceTarget({
    this.deploymentId,
    this.instanceLabel,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
  });
  factory InstanceTarget.fromJson(Map<String, dynamic> json) =>
      _$InstanceTargetFromJson(json);
}

enum InstanceType {
  @_s.JsonValue('Blue')
  blue,
  @_s.JsonValue('Green')
  green,
}

extension on InstanceType {
  String toValue() {
    switch (this) {
      case InstanceType.blue:
        return 'Blue';
      case InstanceType.green:
        return 'Green';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a Lambda function specified in a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaFunctionInfo {
  /// The version of a Lambda function that production traffic points to.
  @_s.JsonKey(name: 'currentVersion')
  final String currentVersion;

  /// The alias of a Lambda function. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">AWS
  /// Lambda Function Aliases</a> in the <i>AWS Lambda Developer Guide</i>.
  @_s.JsonKey(name: 'functionAlias')
  final String functionAlias;

  /// The name of a Lambda function.
  @_s.JsonKey(name: 'functionName')
  final String functionName;

  /// The version of a Lambda function that production traffic points to after the
  /// Lambda function is deployed.
  @_s.JsonKey(name: 'targetVersion')
  final String targetVersion;

  /// The percentage of production traffic that the target version of a Lambda
  /// function receives.
  @_s.JsonKey(name: 'targetVersionWeight')
  final double targetVersionWeight;

  LambdaFunctionInfo({
    this.currentVersion,
    this.functionAlias,
    this.functionName,
    this.targetVersion,
    this.targetVersionWeight,
  });
  factory LambdaFunctionInfo.fromJson(Map<String, dynamic> json) =>
      _$LambdaFunctionInfoFromJson(json);
}

/// Information about the target AWS Lambda function during an AWS Lambda
/// deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaTarget {
  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// A <code>LambdaFunctionInfo</code> object that describes a target Lambda
  /// function.
  @_s.JsonKey(name: 'lambdaFunctionInfo')
  final LambdaFunctionInfo lambdaFunctionInfo;

  /// The date and time when the target Lambda function was updated by a
  /// deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The lifecycle events of the deployment to this target Lambda function.
  @_s.JsonKey(name: 'lifecycleEvents')
  final List<LifecycleEvent> lifecycleEvents;

  /// The status an AWS Lambda deployment's target Lambda function.
  @_s.JsonKey(name: 'status')
  final TargetStatus status;

  /// The Amazon Resource Name (ARN) of the target.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>lambdaTarget</code>.
  @_s.JsonKey(name: 'targetId')
  final String targetId;

  LambdaTarget({
    this.deploymentId,
    this.lambdaFunctionInfo,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
  });
  factory LambdaTarget.fromJson(Map<String, dynamic> json) =>
      _$LambdaTargetFromJson(json);
}

/// Information about the most recent attempted or successful deployment to a
/// deployment group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LastDeploymentInfo {
  /// A timestamp that indicates when the most recent deployment to the deployment
  /// group started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The unique ID of a deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// A timestamp that indicates when the most recent deployment to the deployment
  /// group was complete.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The status of the most recent deployment.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

  LastDeploymentInfo({
    this.createTime,
    this.deploymentId,
    this.endTime,
    this.status,
  });
  factory LastDeploymentInfo.fromJson(Map<String, dynamic> json) =>
      _$LastDeploymentInfoFromJson(json);
}

enum LifecycleErrorCode {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('ScriptMissing')
  scriptMissing,
  @_s.JsonValue('ScriptNotExecutable')
  scriptNotExecutable,
  @_s.JsonValue('ScriptTimedOut')
  scriptTimedOut,
  @_s.JsonValue('ScriptFailed')
  scriptFailed,
  @_s.JsonValue('UnknownError')
  unknownError,
}

/// Information about a deployment lifecycle event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecycleEvent {
  /// Diagnostic information about the deployment lifecycle event.
  @_s.JsonKey(name: 'diagnostics')
  final Diagnostics diagnostics;

  /// A timestamp that indicates when the deployment lifecycle event ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The deployment lifecycle event name, such as <code>ApplicationStop</code>,
  /// <code>BeforeInstall</code>, <code>AfterInstall</code>,
  /// <code>ApplicationStart</code>, or <code>ValidateService</code>.
  @_s.JsonKey(name: 'lifecycleEventName')
  final String lifecycleEventName;

  /// A timestamp that indicates when the deployment lifecycle event started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The deployment lifecycle event status:
  ///
  /// <ul>
  /// <li>
  /// Pending: The deployment lifecycle event is pending.
  /// </li>
  /// <li>
  /// InProgress: The deployment lifecycle event is in progress.
  /// </li>
  /// <li>
  /// Succeeded: The deployment lifecycle event ran successfully.
  /// </li>
  /// <li>
  /// Failed: The deployment lifecycle event has failed.
  /// </li>
  /// <li>
  /// Skipped: The deployment lifecycle event has been skipped.
  /// </li>
  /// <li>
  /// Unknown: The deployment lifecycle event is unknown.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final LifecycleEventStatus status;

  LifecycleEvent({
    this.diagnostics,
    this.endTime,
    this.lifecycleEventName,
    this.startTime,
    this.status,
  });
  factory LifecycleEvent.fromJson(Map<String, dynamic> json) =>
      _$LifecycleEventFromJson(json);
}

enum LifecycleEventStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Skipped')
  skipped,
  @_s.JsonValue('Unknown')
  unknown,
}

extension on LifecycleEventStatus {
  String toValue() {
    switch (this) {
      case LifecycleEventStatus.pending:
        return 'Pending';
      case LifecycleEventStatus.inProgress:
        return 'InProgress';
      case LifecycleEventStatus.succeeded:
        return 'Succeeded';
      case LifecycleEventStatus.failed:
        return 'Failed';
      case LifecycleEventStatus.skipped:
        return 'Skipped';
      case LifecycleEventStatus.unknown:
        return 'Unknown';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>ListApplicationRevisions</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationRevisionsOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call to
  /// return the next set of application revisions in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of locations that contain the matching revisions.
  @_s.JsonKey(name: 'revisions')
  final List<RevisionLocation> revisions;

  ListApplicationRevisionsOutput({
    this.nextToken,
    this.revisions,
  });
  factory ListApplicationRevisionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationRevisionsOutputFromJson(json);
}

/// Represents the output of a ListApplications operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationsOutput {
  /// A list of application names.
  @_s.JsonKey(name: 'applications')
  final List<String> applications;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list applications call to return
  /// the next set of applications in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListApplicationsOutput({
    this.applications,
    this.nextToken,
  });
  factory ListApplicationsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationsOutputFromJson(json);
}

/// Represents the output of a <code>ListDeploymentConfigs</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentConfigsOutput {
  /// A list of deployment configurations, including built-in configurations such
  /// as <code>CodeDeployDefault.OneAtATime</code>.
  @_s.JsonKey(name: 'deploymentConfigsList')
  final List<String> deploymentConfigsList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment configurations call
  /// to return the next set of deployment configurations in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentConfigsOutput({
    this.deploymentConfigsList,
    this.nextToken,
  });
  factory ListDeploymentConfigsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentConfigsOutputFromJson(json);
}

/// Represents the output of a <code>ListDeploymentGroups</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentGroupsOutput {
  /// The application name.
  @_s.JsonKey(name: 'applicationName')
  final String applicationName;

  /// A list of deployment group names.
  @_s.JsonKey(name: 'deploymentGroups')
  final List<String> deploymentGroups;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment groups call to
  /// return the next set of deployment groups in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentGroupsOutput({
    this.applicationName,
    this.deploymentGroups,
    this.nextToken,
  });
  factory ListDeploymentGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentGroupsOutputFromJson(json);
}

/// Represents the output of a <code>ListDeploymentInstances</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentInstancesOutput {
  /// A list of instance IDs.
  @_s.JsonKey(name: 'instancesList')
  final List<String> instancesList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment instances call to
  /// return the next set of deployment instances in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentInstancesOutput({
    this.instancesList,
    this.nextToken,
  });
  factory ListDeploymentInstancesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentInstancesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentTargetsOutput {
  /// If a large amount of information is returned, a token identifier is also
  /// returned. It can be used in a subsequent <code>ListDeploymentTargets</code>
  /// call to return the next set of deployment targets in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The unique IDs of deployment targets.
  @_s.JsonKey(name: 'targetIds')
  final List<String> targetIds;

  ListDeploymentTargetsOutput({
    this.nextToken,
    this.targetIds,
  });
  factory ListDeploymentTargetsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentTargetsOutputFromJson(json);
}

/// Represents the output of a <code>ListDeployments</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentsOutput {
  /// A list of deployment IDs.
  @_s.JsonKey(name: 'deployments')
  final List<String> deployments;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployments call to return the
  /// next set of deployments in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentsOutput({
    this.deployments,
    this.nextToken,
  });
  factory ListDeploymentsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentsOutputFromJson(json);
}

/// Represents the output of a <code>ListGitHubAccountTokenNames</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGitHubAccountTokenNamesOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent
  /// <code>ListGitHubAccountTokenNames</code> call to return the next set of
  /// names in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of names of connections to GitHub accounts.
  @_s.JsonKey(name: 'tokenNameList')
  final List<String> tokenNameList;

  ListGitHubAccountTokenNamesOutput({
    this.nextToken,
    this.tokenNameList,
  });
  factory ListGitHubAccountTokenNamesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListGitHubAccountTokenNamesOutputFromJson(json);
}

/// Represents the output of the list on-premises instances operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOnPremisesInstancesOutput {
  /// The list of matching on-premises instance names.
  @_s.JsonKey(name: 'instanceNames')
  final List<String> instanceNames;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list on-premises instances call to
  /// return the next set of on-premises instances in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListOnPremisesInstancesOutput({
    this.instanceNames,
    this.nextToken,
  });
  factory ListOnPremisesInstancesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListOnPremisesInstancesOutputFromJson(json);
}

enum ListStateFilterAction {
  @_s.JsonValue('include')
  include,
  @_s.JsonValue('exclude')
  exclude,
  @_s.JsonValue('ignore')
  ignore,
}

extension on ListStateFilterAction {
  String toValue() {
    switch (this) {
      case ListStateFilterAction.include:
        return 'include';
      case ListStateFilterAction.exclude:
        return 'exclude';
      case ListStateFilterAction.ignore:
        return 'ignore';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call to
  /// return the next set of application revisions in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tags returned by <code>ListTagsForResource</code>. The tags are
  /// associated with the resource identified by the input
  /// <code>ResourceArn</code> parameter.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

/// Information about the Elastic Load Balancing load balancer or target group
/// used in a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoadBalancerInfo {
  /// An array that contains information about the load balancer to use for load
  /// balancing in a deployment. In Elastic Load Balancing, load balancers are
  /// used with Classic Load Balancers.
  /// <note>
  /// Adding more than one load balancer to the array is not supported.
  /// </note>
  @_s.JsonKey(name: 'elbInfoList')
  final List<ELBInfo> elbInfoList;

  /// An array that contains information about the target group to use for load
  /// balancing in a deployment. In Elastic Load Balancing, target groups are used
  /// with Application Load Balancers.
  /// <note>
  /// Adding more than one target group to the array is not supported.
  /// </note>
  @_s.JsonKey(name: 'targetGroupInfoList')
  final List<TargetGroupInfo> targetGroupInfoList;

  /// The target group pair information. This is an array of
  /// <code>TargeGroupPairInfo</code> objects with a maximum size of one.
  @_s.JsonKey(name: 'targetGroupPairInfoList')
  final List<TargetGroupPairInfo> targetGroupPairInfoList;

  LoadBalancerInfo({
    this.elbInfoList,
    this.targetGroupInfoList,
    this.targetGroupPairInfoList,
  });
  factory LoadBalancerInfo.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoadBalancerInfoToJson(this);
}

/// Information about minimum healthy instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MinimumHealthyHosts {
  /// The minimum healthy instance type:
  ///
  /// <ul>
  /// <li>
  /// <code>HOST_COUNT</code>: The minimum number of healthy instances as an
  /// absolute value.
  /// </li>
  /// <li>
  /// <code>FLEET_PERCENT</code>: The minimum number of healthy instances as a
  /// percentage of the total number of instances in the deployment.
  /// </li>
  /// </ul>
  /// In an example of nine instances, if a HOST_COUNT of six is specified, deploy
  /// to up to three instances at a time. The deployment is successful if six or
  /// more instances are deployed to successfully. Otherwise, the deployment
  /// fails. If a FLEET_PERCENT of 40 is specified, deploy to up to five instances
  /// at a time. The deployment is successful if four or more instances are
  /// deployed to successfully. Otherwise, the deployment fails.
  /// <note>
  /// In a call to the <code>GetDeploymentConfig</code>,
  /// CodeDeployDefault.OneAtATime returns a minimum healthy instance type of
  /// MOST_CONCURRENCY and a value of 1. This means a deployment to only one
  /// instance at a time. (You cannot set the type to MOST_CONCURRENCY, only to
  /// HOST_COUNT or FLEET_PERCENT.) In addition, with
  /// CodeDeployDefault.OneAtATime, AWS CodeDeploy attempts to ensure that all
  /// instances but one are kept in a healthy state during the deployment.
  /// Although this allows one instance at a time to be taken offline for a new
  /// deployment, it also means that if the deployment to the last instance fails,
  /// the overall deployment is still successful.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html">AWS
  /// CodeDeploy Instance Health</a> in the <i>AWS CodeDeploy User Guide</i>.
  @_s.JsonKey(name: 'type')
  final MinimumHealthyHostsType type;

  /// The minimum healthy instance value.
  @_s.JsonKey(name: 'value')
  final int value;

  MinimumHealthyHosts({
    this.type,
    this.value,
  });
  factory MinimumHealthyHosts.fromJson(Map<String, dynamic> json) =>
      _$MinimumHealthyHostsFromJson(json);

  Map<String, dynamic> toJson() => _$MinimumHealthyHostsToJson(this);
}

enum MinimumHealthyHostsType {
  @_s.JsonValue('HOST_COUNT')
  hostCount,
  @_s.JsonValue('FLEET_PERCENT')
  fleetPercent,
}

/// Information about groups of on-premises instance tags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnPremisesTagSet {
  /// A list that contains other lists of on-premises instance tag groups. For an
  /// instance to be included in the deployment group, it must be identified by
  /// all of the tag groups in the list.
  @_s.JsonKey(name: 'onPremisesTagSetList')
  final List<List<TagFilter>> onPremisesTagSetList;

  OnPremisesTagSet({
    this.onPremisesTagSetList,
  });
  factory OnPremisesTagSet.fromJson(Map<String, dynamic> json) =>
      _$OnPremisesTagSetFromJson(json);

  Map<String, dynamic> toJson() => _$OnPremisesTagSetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLifecycleEventHookExecutionStatusOutput {
  /// The execution ID of the lifecycle event hook. A hook is specified in the
  /// <code>hooks</code> section of the deployment's AppSpec file.
  @_s.JsonKey(name: 'lifecycleEventHookExecutionId')
  final String lifecycleEventHookExecutionId;

  PutLifecycleEventHookExecutionStatusOutput({
    this.lifecycleEventHookExecutionId,
  });
  factory PutLifecycleEventHookExecutionStatusOutput.fromJson(
          Map<String, dynamic> json) =>
      _$PutLifecycleEventHookExecutionStatusOutputFromJson(json);
}

/// A revision for an AWS Lambda deployment that is a YAML-formatted or
/// JSON-formatted string. For AWS Lambda deployments, the revision is the same
/// as the AppSpec file.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RawString {
  /// The YAML-formatted or JSON-formatted revision string. It includes
  /// information about which Lambda function to update and optional Lambda
  /// functions that validate deployment lifecycle events.
  @_s.JsonKey(name: 'content')
  final String content;

  /// The SHA256 hash value of the revision content.
  @_s.JsonKey(name: 'sha256')
  final String sha256;

  RawString({
    this.content,
    this.sha256,
  });
  factory RawString.fromJson(Map<String, dynamic> json) =>
      _$RawStringFromJson(json);

  Map<String, dynamic> toJson() => _$RawStringToJson(this);
}

enum RegistrationStatus {
  @_s.JsonValue('Registered')
  registered,
  @_s.JsonValue('Deregistered')
  deregistered,
}

extension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.registered:
        return 'Registered';
      case RegistrationStatus.deregistered:
        return 'Deregistered';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an application revision.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevisionInfo {
  /// Information about an application revision, including usage details and
  /// associated deployment groups.
  @_s.JsonKey(name: 'genericRevisionInfo')
  final GenericRevisionInfo genericRevisionInfo;

  /// Information about the location and type of an application revision.
  @_s.JsonKey(name: 'revisionLocation')
  final RevisionLocation revisionLocation;

  RevisionInfo({
    this.genericRevisionInfo,
    this.revisionLocation,
  });
  factory RevisionInfo.fromJson(Map<String, dynamic> json) =>
      _$RevisionInfoFromJson(json);
}

/// Information about the location of an application revision.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RevisionLocation {
  /// The content of an AppSpec file for an AWS Lambda or Amazon ECS deployment.
  /// The content is formatted as JSON or YAML and stored as a RawString.
  @_s.JsonKey(name: 'appSpecContent')
  final AppSpecContent appSpecContent;

  /// Information about the location of application artifacts stored in GitHub.
  @_s.JsonKey(name: 'gitHubLocation')
  final GitHubLocation gitHubLocation;

  /// The type of application revision:
  ///
  /// <ul>
  /// <li>
  /// S3: An application revision stored in Amazon S3.
  /// </li>
  /// <li>
  /// GitHub: An application revision stored in GitHub (EC2/On-premises
  /// deployments only).
  /// </li>
  /// <li>
  /// String: A YAML-formatted or JSON-formatted string (AWS Lambda deployments
  /// only).
  /// </li>
  /// <li>
  /// AppSpecContent: An <code>AppSpecContent</code> object that contains the
  /// contents of an AppSpec file for an AWS Lambda or Amazon ECS deployment. The
  /// content is formatted as JSON or YAML stored as a RawString.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'revisionType')
  final RevisionLocationType revisionType;

  /// Information about the location of a revision stored in Amazon S3.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  /// Information about the location of an AWS Lambda deployment revision stored
  /// as a RawString.
  @_s.JsonKey(name: 'string')
  final RawString string;

  RevisionLocation({
    this.appSpecContent,
    this.gitHubLocation,
    this.revisionType,
    this.s3Location,
    this.string,
  });
  factory RevisionLocation.fromJson(Map<String, dynamic> json) =>
      _$RevisionLocationFromJson(json);

  Map<String, dynamic> toJson() => _$RevisionLocationToJson(this);
}

enum RevisionLocationType {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('GitHub')
  gitHub,
  @_s.JsonValue('String')
  string,
  @_s.JsonValue('AppSpecContent')
  appSpecContent,
}

/// Information about a deployment rollback.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RollbackInfo {
  /// The ID of the deployment rollback.
  @_s.JsonKey(name: 'rollbackDeploymentId')
  final String rollbackDeploymentId;

  /// Information that describes the status of a deployment rollback (for example,
  /// whether the deployment can't be rolled back, is in progress, failed, or
  /// succeeded).
  @_s.JsonKey(name: 'rollbackMessage')
  final String rollbackMessage;

  /// The deployment ID of the deployment that was underway and triggered a
  /// rollback deployment because it failed or was stopped.
  @_s.JsonKey(name: 'rollbackTriggeringDeploymentId')
  final String rollbackTriggeringDeploymentId;

  RollbackInfo({
    this.rollbackDeploymentId,
    this.rollbackMessage,
    this.rollbackTriggeringDeploymentId,
  });
  factory RollbackInfo.fromJson(Map<String, dynamic> json) =>
      _$RollbackInfoFromJson(json);
}

/// Information about the location of application artifacts stored in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// The name of the Amazon S3 bucket where the application revision is stored.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The file type of the application revision. Must be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>tar</code>: A tar archive file.
  /// </li>
  /// <li>
  /// <code>tgz</code>: A compressed tar archive file.
  /// </li>
  /// <li>
  /// <code>zip</code>: A zip archive file.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'bundleType')
  final BundleType bundleType;

  /// The ETag of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  ///
  /// If the ETag is not specified as an input parameter, ETag validation of the
  /// object is skipped.
  @_s.JsonKey(name: 'eTag')
  final String eTag;

  /// The name of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  @_s.JsonKey(name: 'key')
  final String key;

  /// A specific version of the Amazon S3 object that represents the bundled
  /// artifacts for the application revision.
  ///
  /// If the version is not specified, the system uses the most recent version by
  /// default.
  @_s.JsonKey(name: 'version')
  final String version;

  S3Location({
    this.bucket,
    this.bundleType,
    this.eTag,
    this.key,
    this.version,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

enum SortOrder {
  @_s.JsonValue('ascending')
  ascending,
  @_s.JsonValue('descending')
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ascending';
      case SortOrder.descending:
        return 'descending';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>StopDeployment</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopDeploymentOutput {
  /// The status of the stop deployment operation:
  ///
  /// <ul>
  /// <li>
  /// Pending: The stop operation is pending.
  /// </li>
  /// <li>
  /// Succeeded: The stop operation was successful.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final StopStatus status;

  /// An accompanying status message.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  StopDeploymentOutput({
    this.status,
    this.statusMessage,
  });
  factory StopDeploymentOutput.fromJson(Map<String, dynamic> json) =>
      _$StopDeploymentOutputFromJson(json);
}

enum StopStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Succeeded')
  succeeded,
}

/// Information about a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Information about an on-premises instance tag filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagFilter {
  /// The on-premises instance tag filter key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The on-premises instance tag filter type:
  ///
  /// <ul>
  /// <li>
  /// KEY_ONLY: Key only.
  /// </li>
  /// <li>
  /// VALUE_ONLY: Value only.
  /// </li>
  /// <li>
  /// KEY_AND_VALUE: Key and value.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final TagFilterType type;

  /// The on-premises instance tag filter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  TagFilter({
    this.key,
    this.type,
    this.value,
  });
  factory TagFilter.fromJson(Map<String, dynamic> json) =>
      _$TagFilterFromJson(json);

  Map<String, dynamic> toJson() => _$TagFilterToJson(this);
}

enum TagFilterType {
  @_s.JsonValue('KEY_ONLY')
  keyOnly,
  @_s.JsonValue('VALUE_ONLY')
  valueOnly,
  @_s.JsonValue('KEY_AND_VALUE')
  keyAndValue,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceOutputFromJson(json);
}

enum TargetFilterName {
  @_s.JsonValue('TargetStatus')
  targetStatus,
  @_s.JsonValue('ServerInstanceLabel')
  serverInstanceLabel,
}

extension on TargetFilterName {
  String toValue() {
    switch (this) {
      case TargetFilterName.targetStatus:
        return 'TargetStatus';
      case TargetFilterName.serverInstanceLabel:
        return 'ServerInstanceLabel';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a target group in Elastic Load Balancing to use in a
/// deployment. Instances are registered as targets in a target group, and
/// traffic is routed to the target group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetGroupInfo {
  /// For blue/green deployments, the name of the target group that instances in
  /// the original environment are deregistered from, and instances in the
  /// replacement environment are registered with. For in-place deployments, the
  /// name of the target group that instances are deregistered from, so they are
  /// not serving traffic during a deployment, and then re-registered with after
  /// the deployment is complete.
  @_s.JsonKey(name: 'name')
  final String name;

  TargetGroupInfo({
    this.name,
  });
  factory TargetGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$TargetGroupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TargetGroupInfoToJson(this);
}

/// Information about two target groups and how traffic is routed during an
/// Amazon ECS deployment. An optional test traffic route can be specified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetGroupPairInfo {
  /// The path used by a load balancer to route production traffic when an Amazon
  /// ECS deployment is complete.
  @_s.JsonKey(name: 'prodTrafficRoute')
  final TrafficRoute prodTrafficRoute;

  /// One pair of target groups. One is associated with the original task set. The
  /// second is associated with the task set that serves traffic after the
  /// deployment is complete.
  @_s.JsonKey(name: 'targetGroups')
  final List<TargetGroupInfo> targetGroups;

  /// An optional path used by a load balancer to route test traffic after an
  /// Amazon ECS deployment. Validation can occur while test traffic is served
  /// during a deployment.
  @_s.JsonKey(name: 'testTrafficRoute')
  final TrafficRoute testTrafficRoute;

  TargetGroupPairInfo({
    this.prodTrafficRoute,
    this.targetGroups,
    this.testTrafficRoute,
  });
  factory TargetGroupPairInfo.fromJson(Map<String, dynamic> json) =>
      _$TargetGroupPairInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TargetGroupPairInfoToJson(this);
}

/// Information about the instances to be used in the replacement environment in
/// a blue/green deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetInstances {
  /// The names of one or more Auto Scaling groups to identify a replacement
  /// environment for a blue/green deployment.
  @_s.JsonKey(name: 'autoScalingGroups')
  final List<String> autoScalingGroups;

  /// Information about the groups of EC2 instance tags that an instance must be
  /// identified by in order for it to be included in the replacement environment
  /// for a blue/green deployment. Cannot be used in the same call as
  /// <code>tagFilters</code>.
  @_s.JsonKey(name: 'ec2TagSet')
  final EC2TagSet ec2TagSet;

  /// The tag filter key, type, and value used to identify Amazon EC2 instances in
  /// a replacement environment for a blue/green deployment. Cannot be used in the
  /// same call as <code>ec2TagSet</code>.
  @_s.JsonKey(name: 'tagFilters')
  final List<EC2TagFilter> tagFilters;

  TargetInstances({
    this.autoScalingGroups,
    this.ec2TagSet,
    this.tagFilters,
  });
  factory TargetInstances.fromJson(Map<String, dynamic> json) =>
      _$TargetInstancesFromJson(json);

  Map<String, dynamic> toJson() => _$TargetInstancesToJson(this);
}

enum TargetLabel {
  @_s.JsonValue('Blue')
  blue,
  @_s.JsonValue('Green')
  green,
}

enum TargetStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Skipped')
  skipped,
  @_s.JsonValue('Unknown')
  unknown,
  @_s.JsonValue('Ready')
  ready,
}

/// A configuration that shifts traffic from one version of a Lambda function or
/// ECS task set to another in two increments. The original and target Lambda
/// function versions or ECS task sets are specified in the deployment's AppSpec
/// file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeBasedCanary {
  /// The number of minutes between the first and second traffic shifts of a
  /// <code>TimeBasedCanary</code> deployment.
  @_s.JsonKey(name: 'canaryInterval')
  final int canaryInterval;

  /// The percentage of traffic to shift in the first increment of a
  /// <code>TimeBasedCanary</code> deployment.
  @_s.JsonKey(name: 'canaryPercentage')
  final int canaryPercentage;

  TimeBasedCanary({
    this.canaryInterval,
    this.canaryPercentage,
  });
  factory TimeBasedCanary.fromJson(Map<String, dynamic> json) =>
      _$TimeBasedCanaryFromJson(json);

  Map<String, dynamic> toJson() => _$TimeBasedCanaryToJson(this);
}

/// A configuration that shifts traffic from one version of a Lambda function or
/// ECS task set to another in equal increments, with an equal number of minutes
/// between each increment. The original and target Lambda function versions or
/// ECS task sets are specified in the deployment's AppSpec file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeBasedLinear {
  /// The number of minutes between each incremental traffic shift of a
  /// <code>TimeBasedLinear</code> deployment.
  @_s.JsonKey(name: 'linearInterval')
  final int linearInterval;

  /// The percentage of traffic that is shifted at the start of each increment of
  /// a <code>TimeBasedLinear</code> deployment.
  @_s.JsonKey(name: 'linearPercentage')
  final int linearPercentage;

  TimeBasedLinear({
    this.linearInterval,
    this.linearPercentage,
  });
  factory TimeBasedLinear.fromJson(Map<String, dynamic> json) =>
      _$TimeBasedLinearFromJson(json);

  Map<String, dynamic> toJson() => _$TimeBasedLinearToJson(this);
}

/// Information about a time range.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TimeRange {
  /// The end time of the time range.
  /// <note>
  /// Specify null to leave the end time open-ended.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'end')
  final DateTime end;

  /// The start time of the time range.
  /// <note>
  /// Specify null to leave the start time open-ended.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'start')
  final DateTime start;

  TimeRange({
    this.end,
    this.start,
  });
  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}

/// Information about a listener. The listener contains the path used to route
/// traffic that is received from the load balancer to a target group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrafficRoute {
  /// The Amazon Resource Name (ARN) of one listener. The listener identifies the
  /// route between a target group and a load balancer. This is an array of
  /// strings with a maximum size of one.
  @_s.JsonKey(name: 'listenerArns')
  final List<String> listenerArns;

  TrafficRoute({
    this.listenerArns,
  });
  factory TrafficRoute.fromJson(Map<String, dynamic> json) =>
      _$TrafficRouteFromJson(json);

  Map<String, dynamic> toJson() => _$TrafficRouteToJson(this);
}

/// The configuration that specifies how traffic is shifted from one version of
/// a Lambda function to another version during an AWS Lambda deployment, or
/// from one Amazon ECS task set to another during an Amazon ECS deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrafficRoutingConfig {
  /// A configuration that shifts traffic from one version of a Lambda function or
  /// ECS task set to another in two increments. The original and target Lambda
  /// function versions or ECS task sets are specified in the deployment's AppSpec
  /// file.
  @_s.JsonKey(name: 'timeBasedCanary')
  final TimeBasedCanary timeBasedCanary;

  /// A configuration that shifts traffic from one version of a Lambda function or
  /// ECS task set to another in equal increments, with an equal number of minutes
  /// between each increment. The original and target Lambda function versions or
  /// ECS task sets are specified in the deployment's AppSpec file.
  @_s.JsonKey(name: 'timeBasedLinear')
  final TimeBasedLinear timeBasedLinear;

  /// The type of traffic shifting (<code>TimeBasedCanary</code> or
  /// <code>TimeBasedLinear</code>) used by a deployment configuration.
  @_s.JsonKey(name: 'type')
  final TrafficRoutingType type;

  TrafficRoutingConfig({
    this.timeBasedCanary,
    this.timeBasedLinear,
    this.type,
  });
  factory TrafficRoutingConfig.fromJson(Map<String, dynamic> json) =>
      _$TrafficRoutingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TrafficRoutingConfigToJson(this);
}

enum TrafficRoutingType {
  @_s.JsonValue('TimeBasedCanary')
  timeBasedCanary,
  @_s.JsonValue('TimeBasedLinear')
  timeBasedLinear,
  @_s.JsonValue('AllAtOnce')
  allAtOnce,
}

/// Information about notification triggers for the deployment group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TriggerConfig {
  /// The event type or types for which notifications are triggered.
  @_s.JsonKey(name: 'triggerEvents')
  final List<TriggerEventType> triggerEvents;

  /// The name of the notification trigger.
  @_s.JsonKey(name: 'triggerName')
  final String triggerName;

  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// topic through which notifications about deployment or instance events are
  /// sent.
  @_s.JsonKey(name: 'triggerTargetArn')
  final String triggerTargetArn;

  TriggerConfig({
    this.triggerEvents,
    this.triggerName,
    this.triggerTargetArn,
  });
  factory TriggerConfig.fromJson(Map<String, dynamic> json) =>
      _$TriggerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TriggerConfigToJson(this);
}

enum TriggerEventType {
  @_s.JsonValue('DeploymentStart')
  deploymentStart,
  @_s.JsonValue('DeploymentSuccess')
  deploymentSuccess,
  @_s.JsonValue('DeploymentFailure')
  deploymentFailure,
  @_s.JsonValue('DeploymentStop')
  deploymentStop,
  @_s.JsonValue('DeploymentRollback')
  deploymentRollback,
  @_s.JsonValue('DeploymentReady')
  deploymentReady,
  @_s.JsonValue('InstanceStart')
  instanceStart,
  @_s.JsonValue('InstanceSuccess')
  instanceSuccess,
  @_s.JsonValue('InstanceFailure')
  instanceFailure,
  @_s.JsonValue('InstanceReady')
  instanceReady,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceOutputFromJson(json);
}

/// Represents the output of an <code>UpdateDeploymentGroup</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, AWS CodeDeploy successfully
  /// removed all corresponding Auto Scaling lifecycle event hooks from the AWS
  /// account. If the output contains data, AWS CodeDeploy could not remove some
  /// Auto Scaling lifecycle event hooks from the AWS account.
  @_s.JsonKey(name: 'hooksNotCleanedUp')
  final List<AutoScalingGroup> hooksNotCleanedUp;

  UpdateDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });
  factory UpdateDeploymentGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeploymentGroupOutputFromJson(json);
}

class AlarmsLimitExceededException extends _s.GenericAwsException {
  AlarmsLimitExceededException({String type, String message})
      : super(
            type: type, code: 'AlarmsLimitExceededException', message: message);
}

class ApplicationAlreadyExistsException extends _s.GenericAwsException {
  ApplicationAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ApplicationAlreadyExistsException',
            message: message);
}

class ApplicationDoesNotExistException extends _s.GenericAwsException {
  ApplicationDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'ApplicationDoesNotExistException',
            message: message);
}

class ApplicationLimitExceededException extends _s.GenericAwsException {
  ApplicationLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ApplicationLimitExceededException',
            message: message);
}

class ApplicationNameRequiredException extends _s.GenericAwsException {
  ApplicationNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'ApplicationNameRequiredException',
            message: message);
}

class ArnNotSupportedException extends _s.GenericAwsException {
  ArnNotSupportedException({String type, String message})
      : super(type: type, code: 'ArnNotSupportedException', message: message);
}

class BatchLimitExceededException extends _s.GenericAwsException {
  BatchLimitExceededException({String type, String message})
      : super(
            type: type, code: 'BatchLimitExceededException', message: message);
}

class BucketNameFilterRequiredException extends _s.GenericAwsException {
  BucketNameFilterRequiredException({String type, String message})
      : super(
            type: type,
            code: 'BucketNameFilterRequiredException',
            message: message);
}

class DeploymentAlreadyCompletedException extends _s.GenericAwsException {
  DeploymentAlreadyCompletedException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentAlreadyCompletedException',
            message: message);
}

class DeploymentConfigAlreadyExistsException extends _s.GenericAwsException {
  DeploymentConfigAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentConfigAlreadyExistsException',
            message: message);
}

class DeploymentConfigDoesNotExistException extends _s.GenericAwsException {
  DeploymentConfigDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentConfigDoesNotExistException',
            message: message);
}

class DeploymentConfigInUseException extends _s.GenericAwsException {
  DeploymentConfigInUseException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentConfigInUseException',
            message: message);
}

class DeploymentConfigLimitExceededException extends _s.GenericAwsException {
  DeploymentConfigLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentConfigLimitExceededException',
            message: message);
}

class DeploymentConfigNameRequiredException extends _s.GenericAwsException {
  DeploymentConfigNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentConfigNameRequiredException',
            message: message);
}

class DeploymentDoesNotExistException extends _s.GenericAwsException {
  DeploymentDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentDoesNotExistException',
            message: message);
}

class DeploymentGroupAlreadyExistsException extends _s.GenericAwsException {
  DeploymentGroupAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentGroupAlreadyExistsException',
            message: message);
}

class DeploymentGroupDoesNotExistException extends _s.GenericAwsException {
  DeploymentGroupDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentGroupDoesNotExistException',
            message: message);
}

class DeploymentGroupLimitExceededException extends _s.GenericAwsException {
  DeploymentGroupLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentGroupLimitExceededException',
            message: message);
}

class DeploymentGroupNameRequiredException extends _s.GenericAwsException {
  DeploymentGroupNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentGroupNameRequiredException',
            message: message);
}

class DeploymentIdRequiredException extends _s.GenericAwsException {
  DeploymentIdRequiredException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentIdRequiredException',
            message: message);
}

class DeploymentIsNotInReadyStateException extends _s.GenericAwsException {
  DeploymentIsNotInReadyStateException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentIsNotInReadyStateException',
            message: message);
}

class DeploymentLimitExceededException extends _s.GenericAwsException {
  DeploymentLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentLimitExceededException',
            message: message);
}

class DeploymentNotStartedException extends _s.GenericAwsException {
  DeploymentNotStartedException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentNotStartedException',
            message: message);
}

class DeploymentTargetDoesNotExistException extends _s.GenericAwsException {
  DeploymentTargetDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentTargetDoesNotExistException',
            message: message);
}

class DeploymentTargetIdRequiredException extends _s.GenericAwsException {
  DeploymentTargetIdRequiredException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentTargetIdRequiredException',
            message: message);
}

class DeploymentTargetListSizeExceededException extends _s.GenericAwsException {
  DeploymentTargetListSizeExceededException({String type, String message})
      : super(
            type: type,
            code: 'DeploymentTargetListSizeExceededException',
            message: message);
}

class DescriptionTooLongException extends _s.GenericAwsException {
  DescriptionTooLongException({String type, String message})
      : super(
            type: type, code: 'DescriptionTooLongException', message: message);
}

class ECSServiceMappingLimitExceededException extends _s.GenericAwsException {
  ECSServiceMappingLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ECSServiceMappingLimitExceededException',
            message: message);
}

class GitHubAccountTokenDoesNotExistException extends _s.GenericAwsException {
  GitHubAccountTokenDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'GitHubAccountTokenDoesNotExistException',
            message: message);
}

class GitHubAccountTokenNameRequiredException extends _s.GenericAwsException {
  GitHubAccountTokenNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'GitHubAccountTokenNameRequiredException',
            message: message);
}

class IamArnRequiredException extends _s.GenericAwsException {
  IamArnRequiredException({String type, String message})
      : super(type: type, code: 'IamArnRequiredException', message: message);
}

class IamSessionArnAlreadyRegisteredException extends _s.GenericAwsException {
  IamSessionArnAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'IamSessionArnAlreadyRegisteredException',
            message: message);
}

class IamUserArnAlreadyRegisteredException extends _s.GenericAwsException {
  IamUserArnAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'IamUserArnAlreadyRegisteredException',
            message: message);
}

class IamUserArnRequiredException extends _s.GenericAwsException {
  IamUserArnRequiredException({String type, String message})
      : super(
            type: type, code: 'IamUserArnRequiredException', message: message);
}

class InstanceDoesNotExistException extends _s.GenericAwsException {
  InstanceDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'InstanceDoesNotExistException',
            message: message);
}

class InstanceIdRequiredException extends _s.GenericAwsException {
  InstanceIdRequiredException({String type, String message})
      : super(
            type: type, code: 'InstanceIdRequiredException', message: message);
}

class InstanceLimitExceededException extends _s.GenericAwsException {
  InstanceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'InstanceLimitExceededException',
            message: message);
}

class InstanceNameAlreadyRegisteredException extends _s.GenericAwsException {
  InstanceNameAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'InstanceNameAlreadyRegisteredException',
            message: message);
}

class InstanceNameRequiredException extends _s.GenericAwsException {
  InstanceNameRequiredException({String type, String message})
      : super(
            type: type,
            code: 'InstanceNameRequiredException',
            message: message);
}

class InstanceNotRegisteredException extends _s.GenericAwsException {
  InstanceNotRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'InstanceNotRegisteredException',
            message: message);
}

class InvalidAlarmConfigException extends _s.GenericAwsException {
  InvalidAlarmConfigException({String type, String message})
      : super(
            type: type, code: 'InvalidAlarmConfigException', message: message);
}

class InvalidApplicationNameException extends _s.GenericAwsException {
  InvalidApplicationNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApplicationNameException',
            message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String type, String message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidAutoRollbackConfigException extends _s.GenericAwsException {
  InvalidAutoRollbackConfigException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAutoRollbackConfigException',
            message: message);
}

class InvalidAutoScalingGroupException extends _s.GenericAwsException {
  InvalidAutoScalingGroupException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAutoScalingGroupException',
            message: message);
}

class InvalidBlueGreenDeploymentConfigurationException
    extends _s.GenericAwsException {
  InvalidBlueGreenDeploymentConfigurationException(
      {String type, String message})
      : super(
            type: type,
            code: 'InvalidBlueGreenDeploymentConfigurationException',
            message: message);
}

class InvalidBucketNameFilterException extends _s.GenericAwsException {
  InvalidBucketNameFilterException({String type, String message})
      : super(
            type: type,
            code: 'InvalidBucketNameFilterException',
            message: message);
}

class InvalidComputePlatformException extends _s.GenericAwsException {
  InvalidComputePlatformException({String type, String message})
      : super(
            type: type,
            code: 'InvalidComputePlatformException',
            message: message);
}

class InvalidDeployedStateFilterException extends _s.GenericAwsException {
  InvalidDeployedStateFilterException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeployedStateFilterException',
            message: message);
}

class InvalidDeploymentConfigNameException extends _s.GenericAwsException {
  InvalidDeploymentConfigNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentConfigNameException',
            message: message);
}

class InvalidDeploymentGroupNameException extends _s.GenericAwsException {
  InvalidDeploymentGroupNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentGroupNameException',
            message: message);
}

class InvalidDeploymentIdException extends _s.GenericAwsException {
  InvalidDeploymentIdException({String type, String message})
      : super(
            type: type, code: 'InvalidDeploymentIdException', message: message);
}

class InvalidDeploymentInstanceTypeException extends _s.GenericAwsException {
  InvalidDeploymentInstanceTypeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentInstanceTypeException',
            message: message);
}

class InvalidDeploymentStatusException extends _s.GenericAwsException {
  InvalidDeploymentStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentStatusException',
            message: message);
}

class InvalidDeploymentStyleException extends _s.GenericAwsException {
  InvalidDeploymentStyleException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentStyleException',
            message: message);
}

class InvalidDeploymentTargetIdException extends _s.GenericAwsException {
  InvalidDeploymentTargetIdException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentTargetIdException',
            message: message);
}

class InvalidDeploymentWaitTypeException extends _s.GenericAwsException {
  InvalidDeploymentWaitTypeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDeploymentWaitTypeException',
            message: message);
}

class InvalidEC2TagCombinationException extends _s.GenericAwsException {
  InvalidEC2TagCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidEC2TagCombinationException',
            message: message);
}

class InvalidEC2TagException extends _s.GenericAwsException {
  InvalidEC2TagException({String type, String message})
      : super(type: type, code: 'InvalidEC2TagException', message: message);
}

class InvalidECSServiceException extends _s.GenericAwsException {
  InvalidECSServiceException({String type, String message})
      : super(type: type, code: 'InvalidECSServiceException', message: message);
}

class InvalidExternalIdException extends _s.GenericAwsException {
  InvalidExternalIdException({String type, String message})
      : super(type: type, code: 'InvalidExternalIdException', message: message);
}

class InvalidFileExistsBehaviorException extends _s.GenericAwsException {
  InvalidFileExistsBehaviorException({String type, String message})
      : super(
            type: type,
            code: 'InvalidFileExistsBehaviorException',
            message: message);
}

class InvalidGitHubAccountTokenException extends _s.GenericAwsException {
  InvalidGitHubAccountTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidGitHubAccountTokenException',
            message: message);
}

class InvalidGitHubAccountTokenNameException extends _s.GenericAwsException {
  InvalidGitHubAccountTokenNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidGitHubAccountTokenNameException',
            message: message);
}

class InvalidIamSessionArnException extends _s.GenericAwsException {
  InvalidIamSessionArnException({String type, String message})
      : super(
            type: type,
            code: 'InvalidIamSessionArnException',
            message: message);
}

class InvalidIamUserArnException extends _s.GenericAwsException {
  InvalidIamUserArnException({String type, String message})
      : super(type: type, code: 'InvalidIamUserArnException', message: message);
}

class InvalidIgnoreApplicationStopFailuresValueException
    extends _s.GenericAwsException {
  InvalidIgnoreApplicationStopFailuresValueException(
      {String type, String message})
      : super(
            type: type,
            code: 'InvalidIgnoreApplicationStopFailuresValueException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidInstanceNameException extends _s.GenericAwsException {
  InvalidInstanceNameException({String type, String message})
      : super(
            type: type, code: 'InvalidInstanceNameException', message: message);
}

class InvalidInstanceStatusException extends _s.GenericAwsException {
  InvalidInstanceStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidInstanceStatusException',
            message: message);
}

class InvalidInstanceTypeException extends _s.GenericAwsException {
  InvalidInstanceTypeException({String type, String message})
      : super(
            type: type, code: 'InvalidInstanceTypeException', message: message);
}

class InvalidKeyPrefixFilterException extends _s.GenericAwsException {
  InvalidKeyPrefixFilterException({String type, String message})
      : super(
            type: type,
            code: 'InvalidKeyPrefixFilterException',
            message: message);
}

class InvalidLifecycleEventHookExecutionIdException
    extends _s.GenericAwsException {
  InvalidLifecycleEventHookExecutionIdException({String type, String message})
      : super(
            type: type,
            code: 'InvalidLifecycleEventHookExecutionIdException',
            message: message);
}

class InvalidLifecycleEventHookExecutionStatusException
    extends _s.GenericAwsException {
  InvalidLifecycleEventHookExecutionStatusException(
      {String type, String message})
      : super(
            type: type,
            code: 'InvalidLifecycleEventHookExecutionStatusException',
            message: message);
}

class InvalidLoadBalancerInfoException extends _s.GenericAwsException {
  InvalidLoadBalancerInfoException({String type, String message})
      : super(
            type: type,
            code: 'InvalidLoadBalancerInfoException',
            message: message);
}

class InvalidMinimumHealthyHostValueException extends _s.GenericAwsException {
  InvalidMinimumHealthyHostValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidMinimumHealthyHostValueException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidOnPremisesTagCombinationException extends _s.GenericAwsException {
  InvalidOnPremisesTagCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidOnPremisesTagCombinationException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidRegistrationStatusException extends _s.GenericAwsException {
  InvalidRegistrationStatusException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRegistrationStatusException',
            message: message);
}

class InvalidRevisionException extends _s.GenericAwsException {
  InvalidRevisionException({String type, String message})
      : super(type: type, code: 'InvalidRevisionException', message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String type, String message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class InvalidSortByException extends _s.GenericAwsException {
  InvalidSortByException({String type, String message})
      : super(type: type, code: 'InvalidSortByException', message: message);
}

class InvalidSortOrderException extends _s.GenericAwsException {
  InvalidSortOrderException({String type, String message})
      : super(type: type, code: 'InvalidSortOrderException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String type, String message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class InvalidTagFilterException extends _s.GenericAwsException {
  InvalidTagFilterException({String type, String message})
      : super(type: type, code: 'InvalidTagFilterException', message: message);
}

class InvalidTagsToAddException extends _s.GenericAwsException {
  InvalidTagsToAddException({String type, String message})
      : super(type: type, code: 'InvalidTagsToAddException', message: message);
}

class InvalidTargetFilterNameException extends _s.GenericAwsException {
  InvalidTargetFilterNameException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTargetFilterNameException',
            message: message);
}

class InvalidTargetGroupPairException extends _s.GenericAwsException {
  InvalidTargetGroupPairException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTargetGroupPairException',
            message: message);
}

class InvalidTargetInstancesException extends _s.GenericAwsException {
  InvalidTargetInstancesException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTargetInstancesException',
            message: message);
}

class InvalidTimeRangeException extends _s.GenericAwsException {
  InvalidTimeRangeException({String type, String message})
      : super(type: type, code: 'InvalidTimeRangeException', message: message);
}

class InvalidTrafficRoutingConfigurationException
    extends _s.GenericAwsException {
  InvalidTrafficRoutingConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTrafficRoutingConfigurationException',
            message: message);
}

class InvalidTriggerConfigException extends _s.GenericAwsException {
  InvalidTriggerConfigException({String type, String message})
      : super(
            type: type,
            code: 'InvalidTriggerConfigException',
            message: message);
}

class InvalidUpdateOutdatedInstancesOnlyValueException
    extends _s.GenericAwsException {
  InvalidUpdateOutdatedInstancesOnlyValueException(
      {String type, String message})
      : super(
            type: type,
            code: 'InvalidUpdateOutdatedInstancesOnlyValueException',
            message: message);
}

class LifecycleEventAlreadyCompletedException extends _s.GenericAwsException {
  LifecycleEventAlreadyCompletedException({String type, String message})
      : super(
            type: type,
            code: 'LifecycleEventAlreadyCompletedException',
            message: message);
}

class LifecycleHookLimitExceededException extends _s.GenericAwsException {
  LifecycleHookLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'LifecycleHookLimitExceededException',
            message: message);
}

class MultipleIamArnsProvidedException extends _s.GenericAwsException {
  MultipleIamArnsProvidedException({String type, String message})
      : super(
            type: type,
            code: 'MultipleIamArnsProvidedException',
            message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceArnRequiredException extends _s.GenericAwsException {
  ResourceArnRequiredException({String type, String message})
      : super(
            type: type, code: 'ResourceArnRequiredException', message: message);
}

class ResourceValidationException extends _s.GenericAwsException {
  ResourceValidationException({String type, String message})
      : super(
            type: type, code: 'ResourceValidationException', message: message);
}

class RevisionDoesNotExistException extends _s.GenericAwsException {
  RevisionDoesNotExistException({String type, String message})
      : super(
            type: type,
            code: 'RevisionDoesNotExistException',
            message: message);
}

class RevisionRequiredException extends _s.GenericAwsException {
  RevisionRequiredException({String type, String message})
      : super(type: type, code: 'RevisionRequiredException', message: message);
}

class RoleRequiredException extends _s.GenericAwsException {
  RoleRequiredException({String type, String message})
      : super(type: type, code: 'RoleRequiredException', message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String type, String message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagRequiredException extends _s.GenericAwsException {
  TagRequiredException({String type, String message})
      : super(type: type, code: 'TagRequiredException', message: message);
}

class TagSetListLimitExceededException extends _s.GenericAwsException {
  TagSetListLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'TagSetListLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TriggerTargetsLimitExceededException extends _s.GenericAwsException {
  TriggerTargetsLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'TriggerTargetsLimitExceededException',
            message: message);
}

class UnsupportedActionForDeploymentTypeException
    extends _s.GenericAwsException {
  UnsupportedActionForDeploymentTypeException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedActionForDeploymentTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlarmsLimitExceededException': (type, message) =>
      AlarmsLimitExceededException(type: type, message: message),
  'ApplicationAlreadyExistsException': (type, message) =>
      ApplicationAlreadyExistsException(type: type, message: message),
  'ApplicationDoesNotExistException': (type, message) =>
      ApplicationDoesNotExistException(type: type, message: message),
  'ApplicationLimitExceededException': (type, message) =>
      ApplicationLimitExceededException(type: type, message: message),
  'ApplicationNameRequiredException': (type, message) =>
      ApplicationNameRequiredException(type: type, message: message),
  'ArnNotSupportedException': (type, message) =>
      ArnNotSupportedException(type: type, message: message),
  'BatchLimitExceededException': (type, message) =>
      BatchLimitExceededException(type: type, message: message),
  'BucketNameFilterRequiredException': (type, message) =>
      BucketNameFilterRequiredException(type: type, message: message),
  'DeploymentAlreadyCompletedException': (type, message) =>
      DeploymentAlreadyCompletedException(type: type, message: message),
  'DeploymentConfigAlreadyExistsException': (type, message) =>
      DeploymentConfigAlreadyExistsException(type: type, message: message),
  'DeploymentConfigDoesNotExistException': (type, message) =>
      DeploymentConfigDoesNotExistException(type: type, message: message),
  'DeploymentConfigInUseException': (type, message) =>
      DeploymentConfigInUseException(type: type, message: message),
  'DeploymentConfigLimitExceededException': (type, message) =>
      DeploymentConfigLimitExceededException(type: type, message: message),
  'DeploymentConfigNameRequiredException': (type, message) =>
      DeploymentConfigNameRequiredException(type: type, message: message),
  'DeploymentDoesNotExistException': (type, message) =>
      DeploymentDoesNotExistException(type: type, message: message),
  'DeploymentGroupAlreadyExistsException': (type, message) =>
      DeploymentGroupAlreadyExistsException(type: type, message: message),
  'DeploymentGroupDoesNotExistException': (type, message) =>
      DeploymentGroupDoesNotExistException(type: type, message: message),
  'DeploymentGroupLimitExceededException': (type, message) =>
      DeploymentGroupLimitExceededException(type: type, message: message),
  'DeploymentGroupNameRequiredException': (type, message) =>
      DeploymentGroupNameRequiredException(type: type, message: message),
  'DeploymentIdRequiredException': (type, message) =>
      DeploymentIdRequiredException(type: type, message: message),
  'DeploymentIsNotInReadyStateException': (type, message) =>
      DeploymentIsNotInReadyStateException(type: type, message: message),
  'DeploymentLimitExceededException': (type, message) =>
      DeploymentLimitExceededException(type: type, message: message),
  'DeploymentNotStartedException': (type, message) =>
      DeploymentNotStartedException(type: type, message: message),
  'DeploymentTargetDoesNotExistException': (type, message) =>
      DeploymentTargetDoesNotExistException(type: type, message: message),
  'DeploymentTargetIdRequiredException': (type, message) =>
      DeploymentTargetIdRequiredException(type: type, message: message),
  'DeploymentTargetListSizeExceededException': (type, message) =>
      DeploymentTargetListSizeExceededException(type: type, message: message),
  'DescriptionTooLongException': (type, message) =>
      DescriptionTooLongException(type: type, message: message),
  'ECSServiceMappingLimitExceededException': (type, message) =>
      ECSServiceMappingLimitExceededException(type: type, message: message),
  'GitHubAccountTokenDoesNotExistException': (type, message) =>
      GitHubAccountTokenDoesNotExistException(type: type, message: message),
  'GitHubAccountTokenNameRequiredException': (type, message) =>
      GitHubAccountTokenNameRequiredException(type: type, message: message),
  'IamArnRequiredException': (type, message) =>
      IamArnRequiredException(type: type, message: message),
  'IamSessionArnAlreadyRegisteredException': (type, message) =>
      IamSessionArnAlreadyRegisteredException(type: type, message: message),
  'IamUserArnAlreadyRegisteredException': (type, message) =>
      IamUserArnAlreadyRegisteredException(type: type, message: message),
  'IamUserArnRequiredException': (type, message) =>
      IamUserArnRequiredException(type: type, message: message),
  'InstanceDoesNotExistException': (type, message) =>
      InstanceDoesNotExistException(type: type, message: message),
  'InstanceIdRequiredException': (type, message) =>
      InstanceIdRequiredException(type: type, message: message),
  'InstanceLimitExceededException': (type, message) =>
      InstanceLimitExceededException(type: type, message: message),
  'InstanceNameAlreadyRegisteredException': (type, message) =>
      InstanceNameAlreadyRegisteredException(type: type, message: message),
  'InstanceNameRequiredException': (type, message) =>
      InstanceNameRequiredException(type: type, message: message),
  'InstanceNotRegisteredException': (type, message) =>
      InstanceNotRegisteredException(type: type, message: message),
  'InvalidAlarmConfigException': (type, message) =>
      InvalidAlarmConfigException(type: type, message: message),
  'InvalidApplicationNameException': (type, message) =>
      InvalidApplicationNameException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidAutoRollbackConfigException': (type, message) =>
      InvalidAutoRollbackConfigException(type: type, message: message),
  'InvalidAutoScalingGroupException': (type, message) =>
      InvalidAutoScalingGroupException(type: type, message: message),
  'InvalidBlueGreenDeploymentConfigurationException': (type, message) =>
      InvalidBlueGreenDeploymentConfigurationException(
          type: type, message: message),
  'InvalidBucketNameFilterException': (type, message) =>
      InvalidBucketNameFilterException(type: type, message: message),
  'InvalidComputePlatformException': (type, message) =>
      InvalidComputePlatformException(type: type, message: message),
  'InvalidDeployedStateFilterException': (type, message) =>
      InvalidDeployedStateFilterException(type: type, message: message),
  'InvalidDeploymentConfigNameException': (type, message) =>
      InvalidDeploymentConfigNameException(type: type, message: message),
  'InvalidDeploymentGroupNameException': (type, message) =>
      InvalidDeploymentGroupNameException(type: type, message: message),
  'InvalidDeploymentIdException': (type, message) =>
      InvalidDeploymentIdException(type: type, message: message),
  'InvalidDeploymentInstanceTypeException': (type, message) =>
      InvalidDeploymentInstanceTypeException(type: type, message: message),
  'InvalidDeploymentStatusException': (type, message) =>
      InvalidDeploymentStatusException(type: type, message: message),
  'InvalidDeploymentStyleException': (type, message) =>
      InvalidDeploymentStyleException(type: type, message: message),
  'InvalidDeploymentTargetIdException': (type, message) =>
      InvalidDeploymentTargetIdException(type: type, message: message),
  'InvalidDeploymentWaitTypeException': (type, message) =>
      InvalidDeploymentWaitTypeException(type: type, message: message),
  'InvalidEC2TagCombinationException': (type, message) =>
      InvalidEC2TagCombinationException(type: type, message: message),
  'InvalidEC2TagException': (type, message) =>
      InvalidEC2TagException(type: type, message: message),
  'InvalidECSServiceException': (type, message) =>
      InvalidECSServiceException(type: type, message: message),
  'InvalidExternalIdException': (type, message) =>
      InvalidExternalIdException(type: type, message: message),
  'InvalidFileExistsBehaviorException': (type, message) =>
      InvalidFileExistsBehaviorException(type: type, message: message),
  'InvalidGitHubAccountTokenException': (type, message) =>
      InvalidGitHubAccountTokenException(type: type, message: message),
  'InvalidGitHubAccountTokenNameException': (type, message) =>
      InvalidGitHubAccountTokenNameException(type: type, message: message),
  'InvalidIamSessionArnException': (type, message) =>
      InvalidIamSessionArnException(type: type, message: message),
  'InvalidIamUserArnException': (type, message) =>
      InvalidIamUserArnException(type: type, message: message),
  'InvalidIgnoreApplicationStopFailuresValueException': (type, message) =>
      InvalidIgnoreApplicationStopFailuresValueException(
          type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'InvalidInstanceNameException': (type, message) =>
      InvalidInstanceNameException(type: type, message: message),
  'InvalidInstanceStatusException': (type, message) =>
      InvalidInstanceStatusException(type: type, message: message),
  'InvalidInstanceTypeException': (type, message) =>
      InvalidInstanceTypeException(type: type, message: message),
  'InvalidKeyPrefixFilterException': (type, message) =>
      InvalidKeyPrefixFilterException(type: type, message: message),
  'InvalidLifecycleEventHookExecutionIdException': (type, message) =>
      InvalidLifecycleEventHookExecutionIdException(
          type: type, message: message),
  'InvalidLifecycleEventHookExecutionStatusException': (type, message) =>
      InvalidLifecycleEventHookExecutionStatusException(
          type: type, message: message),
  'InvalidLoadBalancerInfoException': (type, message) =>
      InvalidLoadBalancerInfoException(type: type, message: message),
  'InvalidMinimumHealthyHostValueException': (type, message) =>
      InvalidMinimumHealthyHostValueException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidOnPremisesTagCombinationException': (type, message) =>
      InvalidOnPremisesTagCombinationException(type: type, message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidRegistrationStatusException': (type, message) =>
      InvalidRegistrationStatusException(type: type, message: message),
  'InvalidRevisionException': (type, message) =>
      InvalidRevisionException(type: type, message: message),
  'InvalidRoleException': (type, message) =>
      InvalidRoleException(type: type, message: message),
  'InvalidSortByException': (type, message) =>
      InvalidSortByException(type: type, message: message),
  'InvalidSortOrderException': (type, message) =>
      InvalidSortOrderException(type: type, message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(type: type, message: message),
  'InvalidTagFilterException': (type, message) =>
      InvalidTagFilterException(type: type, message: message),
  'InvalidTagsToAddException': (type, message) =>
      InvalidTagsToAddException(type: type, message: message),
  'InvalidTargetFilterNameException': (type, message) =>
      InvalidTargetFilterNameException(type: type, message: message),
  'InvalidTargetGroupPairException': (type, message) =>
      InvalidTargetGroupPairException(type: type, message: message),
  'InvalidTargetInstancesException': (type, message) =>
      InvalidTargetInstancesException(type: type, message: message),
  'InvalidTimeRangeException': (type, message) =>
      InvalidTimeRangeException(type: type, message: message),
  'InvalidTrafficRoutingConfigurationException': (type, message) =>
      InvalidTrafficRoutingConfigurationException(type: type, message: message),
  'InvalidTriggerConfigException': (type, message) =>
      InvalidTriggerConfigException(type: type, message: message),
  'InvalidUpdateOutdatedInstancesOnlyValueException': (type, message) =>
      InvalidUpdateOutdatedInstancesOnlyValueException(
          type: type, message: message),
  'LifecycleEventAlreadyCompletedException': (type, message) =>
      LifecycleEventAlreadyCompletedException(type: type, message: message),
  'LifecycleHookLimitExceededException': (type, message) =>
      LifecycleHookLimitExceededException(type: type, message: message),
  'MultipleIamArnsProvidedException': (type, message) =>
      MultipleIamArnsProvidedException(type: type, message: message),
  'OperationNotSupportedException': (type, message) =>
      OperationNotSupportedException(type: type, message: message),
  'ResourceArnRequiredException': (type, message) =>
      ResourceArnRequiredException(type: type, message: message),
  'ResourceValidationException': (type, message) =>
      ResourceValidationException(type: type, message: message),
  'RevisionDoesNotExistException': (type, message) =>
      RevisionDoesNotExistException(type: type, message: message),
  'RevisionRequiredException': (type, message) =>
      RevisionRequiredException(type: type, message: message),
  'RoleRequiredException': (type, message) =>
      RoleRequiredException(type: type, message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(type: type, message: message),
  'TagRequiredException': (type, message) =>
      TagRequiredException(type: type, message: message),
  'TagSetListLimitExceededException': (type, message) =>
      TagSetListLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TriggerTargetsLimitExceededException': (type, message) =>
      TriggerTargetsLimitExceededException(type: type, message: message),
  'UnsupportedActionForDeploymentTypeException': (type, message) =>
      UnsupportedActionForDeploymentTypeException(type: type, message: message),
};
