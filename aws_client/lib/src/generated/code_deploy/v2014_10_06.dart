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

/// CodeDeploy is a deployment service that automates application deployments to
/// Amazon EC2 instances, on-premises instances running in your own facility,
/// serverless Lambda functions, or applications in an Amazon ECS service.
///
/// You can deploy a nearly unlimited variety of application content, such as an
/// updated Lambda function, updated applications in an Amazon ECS service,
/// code, web and configuration files, executables, packages, scripts,
/// multimedia files, and so on. CodeDeploy can deploy application content
/// stored in Amazon S3 buckets, GitHub repositories, or Bitbucket repositories.
/// You do not need to make changes to your existing code before you can use
/// CodeDeploy.
///
/// CodeDeploy makes it easier for you to rapidly release new features, helps
/// you avoid downtime during application deployment, and handles the complexity
/// of updating your applications, without many of the risks associated with
/// error-prone manual deployments.
///
/// <b>CodeDeploy Components</b>
///
/// Use the information in this guide to help you work with the following
/// CodeDeploy components:
///
/// <ul>
/// <li>
/// <b>Application</b>: A name that uniquely identifies the application you want
/// to deploy. CodeDeploy uses this name, which functions as a container, to
/// ensure the correct combination of revision, deployment configuration, and
/// deployment group are referenced during a deployment.
/// </li>
/// <li>
/// <b>Deployment group</b>: A set of individual instances, CodeDeploy Lambda
/// deployment configuration settings, or an Amazon ECS service and network
/// details. A Lambda deployment group specifies how to route traffic to a new
/// version of a Lambda function. An Amazon ECS deployment group specifies the
/// service created in Amazon ECS to deploy, a load balancer, and a listener to
/// reroute production traffic to an updated containerized application. An
/// Amazon EC2/On-premises deployment group contains individually tagged
/// instances, Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both.
/// All deployment groups can specify optional trigger, alarm, and rollback
/// settings.
/// </li>
/// <li>
/// <b>Deployment configuration</b>: A set of deployment rules and deployment
/// success and failure conditions used by CodeDeploy during a deployment.
/// </li>
/// <li>
/// <b>Deployment</b>: The process and the components used when updating a
/// Lambda function, a containerized application in an Amazon ECS service, or of
/// installing content on one or more instances.
/// </li>
/// <li>
/// <b>Application revisions</b>: For an Lambda deployment, this is an AppSpec
/// file that specifies the Lambda function to be updated and one or more
/// functions to validate deployment lifecycle events. For an Amazon ECS
/// deployment, this is an AppSpec file that specifies the Amazon ECS task
/// definition, container, and port where production traffic is rerouted. For an
/// EC2/On-premises deployment, this is an archive file that contains source
/// content—source code, webpages, executable files, and deployment
/// scripts—along with an AppSpec file. Revisions are stored in Amazon S3
/// buckets or GitHub repositories. For Amazon S3, a revision is uniquely
/// identified by its Amazon S3 object key and its ETag, version, or both. For
/// GitHub, a revision is uniquely identified by its commit ID.
/// </li>
/// </ul>
/// This guide also contains information to help you get details about the
/// instances in your deployments, to make on-premises instances available for
/// CodeDeploy deployments, to get details about a Lambda function deployment,
/// and to get details about Amazon ECS service deployments.
///
/// <b>CodeDeploy Information Resources</b>
///
/// <ul>
/// <li>
/// <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide">CodeDeploy
/// User Guide</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/">CodeDeploy
/// API Reference Guide</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/deploy/index.html">CLI
/// Reference for CodeDeploy</a>
/// </li>
/// <li>
/// <a href="https://forums.aws.amazon.com/forum.jspa?forumID=179">CodeDeploy
/// Developer Forum</a>
/// </li>
/// </ul>
class CodeDeploy {
  final _s.JsonProtocol _protocol;
  CodeDeploy({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codedeploy',
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
    required List<String> instanceNames,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.AddTagsToOnPremisesInstances'
    };
    await _protocol.send(
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
  /// The name of an CodeDeploy application about which to get revision
  /// information.
  ///
  /// Parameter [revisions] :
  /// An array of <code>RevisionLocation</code> objects that specify information
  /// to get about the application revisions, including type and location. The
  /// maximum number of <code>RevisionLocation</code> objects you can specify is
  /// 25.
  Future<BatchGetApplicationRevisionsOutput> batchGetApplicationRevisions({
    required String applicationName,
    required List<RevisionLocation> revisions,
  }) async {
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
    required List<String> applicationNames,
  }) async {
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
  /// The name of an CodeDeploy application associated with the applicable user
  /// or Amazon Web Services account.
  ///
  /// Parameter [deploymentGroupNames] :
  /// The names of the deployment groups.
  Future<BatchGetDeploymentGroupsOutput> batchGetDeploymentGroups({
    required String applicationName,
    required List<String> deploymentGroupNames,
  }) async {
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
  /// This method works with EC2/On-premises and Lambda compute platforms. The
  /// newer <code>BatchGetDeploymentTargets</code> works with all compute
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
  @Deprecated(
      'This operation is deprecated, use BatchGetDeploymentTargets instead.')
  Future<BatchGetDeploymentInstancesOutput> batchGetDeploymentInstances({
    required String deploymentId,
    required List<String> instanceIds,
  }) async {
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
  /// <b>EC2/On-premises</b>: Information about Amazon EC2 instance targets.
  /// </li>
  /// <li>
  /// <b>Lambda</b>: Information about Lambda functions targets.
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
  /// IDs are Amazon EC2 or on-premises instances IDs, and their target type is
  /// <code>instanceTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that use the Lambda compute platform, the target IDs are
  /// the names of Lambda functions, and their target type is
  /// <code>instanceTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that use the Amazon ECS compute platform, the target IDs
  /// are pairs of Amazon ECS clusters and services specified using the format
  /// <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. Their target type is
  /// <code>ecsTarget</code>.
  /// </li>
  /// <li>
  /// For deployments that are deployed with CloudFormation, the target IDs are
  /// CloudFormation stack IDs. Their target type is
  /// <code>cloudFormationTarget</code>.
  /// </li>
  /// </ul>
  Future<BatchGetDeploymentTargetsOutput> batchGetDeploymentTargets({
    required String deploymentId,
    required List<String> targetIds,
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
        'deploymentId': deploymentId,
        'targetIds': targetIds,
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
    required List<String> deploymentIds,
  }) async {
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
    required List<String> instanceNames,
  }) async {
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
    String? deploymentId,
    DeploymentWaitType? deploymentWaitType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.ContinueDeployment'
    };
    await _protocol.send(
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
  /// user or Amazon Web Services account.
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
    required String applicationName,
    ComputePlatform? computePlatform,
    List<Tag>? tags,
  }) async {
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
  /// May throw [InvalidAlarmConfigException].
  /// May throw [AlarmsLimitExceededException].
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [autoRollbackConfiguration] :
  /// Configuration information for an automatic rollback that is added when a
  /// deployment is created.
  ///
  /// Parameter [deploymentConfigName] :
  /// The name of a deployment configuration associated with the user or Amazon
  /// Web Services account.
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
  /// Information about how CodeDeploy handles files that already exist in a
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
  /// During a deployment, the CodeDeploy agent runs the scripts specified for
  /// <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and
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
  /// Parameter [overrideAlarmConfiguration] :
  /// Allows you to specify information about alarms associated with a
  /// deployment. The alarm configuration that you specify here will override
  /// the alarm configuration at the deployment group level. Consider overriding
  /// the alarm configuration if you have set up alarms at the deployment group
  /// level that are causing deployment failures. In this case, you would call
  /// <code>CreateDeployment</code> to create a new deployment that uses a
  /// previous application revision that is known to work, and set its alarm
  /// configuration to turn off alarm polling. Turning off alarm polling ensures
  /// that the new deployment proceeds without being blocked by the alarm that
  /// was generated by the previous, failed, deployment.
  /// <note>
  /// If you specify an <code>overrideAlarmConfiguration</code>, you need the
  /// <code>UpdateDeploymentGroup</code> IAM permission when calling
  /// <code>CreateDeployment</code>.
  /// </note>
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
    required String applicationName,
    AutoRollbackConfiguration? autoRollbackConfiguration,
    String? deploymentConfigName,
    String? deploymentGroupName,
    String? description,
    FileExistsBehavior? fileExistsBehavior,
    bool? ignoreApplicationStopFailures,
    AlarmConfiguration? overrideAlarmConfiguration,
    RevisionLocation? revision,
    TargetInstances? targetInstances,
    bool? updateOutdatedInstancesOnly,
  }) async {
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
        if (overrideAlarmConfiguration != null)
          'overrideAlarmConfiguration': overrideAlarmConfiguration,
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
  /// May throw [InvalidZonalDeploymentConfigurationException].
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
  /// CodeDeploy converts the percentage to the equivalent number of instances
  /// and rounds up fractional instances.
  /// </li>
  /// </ul>
  /// The value parameter takes an integer.
  ///
  /// For example, to set a minimum of 95% healthy instance, specify a type of
  /// FLEET_PERCENT and a value of 95.
  ///
  /// Parameter [trafficRoutingConfig] :
  /// The configuration that specifies how the deployment traffic is routed.
  ///
  /// Parameter [zonalConfig] :
  /// Configure the <code>ZonalConfig</code> object if you want CodeDeploy to
  /// deploy your application to one <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones">Availability
  /// Zone</a> at a time, within an Amazon Web Services Region.
  ///
  /// For more information about the zonal configuration feature, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config">zonal
  /// configuration</a> in the <i>CodeDeploy User Guide</i>.
  Future<CreateDeploymentConfigOutput> createDeploymentConfig({
    required String deploymentConfigName,
    ComputePlatform? computePlatform,
    MinimumHealthyHosts? minimumHealthyHosts,
    TrafficRoutingConfig? trafficRoutingConfig,
    ZonalConfig? zonalConfig,
  }) async {
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
        if (zonalConfig != null) 'zonalConfig': zonalConfig,
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a new deployment group for the specified application.
  ///
  /// Parameter [serviceRoleArn] :
  /// A service role Amazon Resource Name (ARN) that allows CodeDeploy to act on
  /// the user's behalf when interacting with Amazon Web Services services.
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
  /// predefined configurations provided with CodeDeploy or a custom deployment
  /// configuration that you create by calling the create deployment
  /// configuration operation.
  ///
  /// <code>CodeDeployDefault.OneAtATime</code> is the default deployment
  /// configuration. It is used if a configuration isn't specified for the
  /// deployment or deployment group.
  ///
  /// For more information about the predefined deployment configurations in
  /// CodeDeploy, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html">Working
  /// with Deployment Configurations in CodeDeploy</a> in the <i>CodeDeploy User
  /// Guide</i>.
  ///
  /// Parameter [deploymentStyle] :
  /// Information about the type of deployment, in-place or blue/green, that you
  /// want to run and whether to route deployment traffic behind a load
  /// balancer.
  ///
  /// Parameter [ec2TagFilters] :
  /// The Amazon EC2 tags on which to filter. The deployment group includes
  /// Amazon EC2 instances with any of the specified tags. Cannot be used in the
  /// same call as ec2TagSet.
  ///
  /// Parameter [ec2TagSet] :
  /// Information about groups of tags applied to Amazon EC2 instances. The
  /// deployment group includes only Amazon EC2 instances identified by all the
  /// tag groups. Cannot be used in the same call as <code>ec2TagFilters</code>.
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
  /// Parameter [outdatedInstancesStrategy] :
  /// Indicates what happens when new Amazon EC2 instances are launched
  /// mid-deployment and do not receive the deployed application revision.
  ///
  /// If this option is set to <code>UPDATE</code> or is unspecified, CodeDeploy
  /// initiates one or more 'auto-update outdated instances' deployments to
  /// apply the deployed application revision to the new Amazon EC2 instances.
  ///
  /// If this option is set to <code>IGNORE</code>, CodeDeploy does not initiate
  /// a deployment to update the new Amazon EC2 instances. This may result in
  /// instances having different revisions.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to CodeDeploy deployment groups to help you
  /// organize and categorize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// Parameter [terminationHookEnabled] :
  /// This parameter only applies if you are using CodeDeploy with Amazon EC2
  /// Auto Scaling. For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html">Integrating
  /// CodeDeploy with Amazon EC2 Auto Scaling</a> in the <i>CodeDeploy User
  /// Guide</i>.
  ///
  /// Set <code>terminationHookEnabled</code> to <code>true</code> to have
  /// CodeDeploy install a termination hook into your Auto Scaling group when
  /// you create a deployment group. When this hook is installed, CodeDeploy
  /// will perform termination deployments.
  ///
  /// For information about termination deployments, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable">Enabling
  /// termination deployments during Auto Scaling scale-in events</a> in the
  /// <i>CodeDeploy User Guide</i>.
  ///
  /// For more information about Auto Scaling scale-in events, see the <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html#as-lifecycle-scale-in">Scale
  /// in</a> topic in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [triggerConfigurations] :
  /// Information about triggers to create when the deployment group is created.
  /// For examples, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-sns.html">Create
  /// a Trigger for an CodeDeploy Event</a> in the <i>CodeDeploy User Guide</i>.
  Future<CreateDeploymentGroupOutput> createDeploymentGroup({
    required String applicationName,
    required String deploymentGroupName,
    required String serviceRoleArn,
    AlarmConfiguration? alarmConfiguration,
    AutoRollbackConfiguration? autoRollbackConfiguration,
    List<String>? autoScalingGroups,
    BlueGreenDeploymentConfiguration? blueGreenDeploymentConfiguration,
    String? deploymentConfigName,
    DeploymentStyle? deploymentStyle,
    List<EC2TagFilter>? ec2TagFilters,
    EC2TagSet? ec2TagSet,
    List<ECSService>? ecsServices,
    LoadBalancerInfo? loadBalancerInfo,
    List<TagFilter>? onPremisesInstanceTagFilters,
    OnPremisesTagSet? onPremisesTagSet,
    OutdatedInstancesStrategy? outdatedInstancesStrategy,
    List<Tag>? tags,
    bool? terminationHookEnabled,
    List<TriggerConfig>? triggerConfigurations,
  }) async {
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
        if (outdatedInstancesStrategy != null)
          'outdatedInstancesStrategy': outdatedInstancesStrategy.toValue(),
        if (tags != null) 'tags': tags,
        if (terminationHookEnabled != null)
          'terminationHookEnabled': terminationHookEnabled,
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  Future<void> deleteApplication({
    required String applicationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteApplication'
    };
    await _protocol.send(
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
  /// The name of a deployment configuration associated with the user or Amazon
  /// Web Services account.
  Future<void> deleteDeploymentConfig({
    required String deploymentConfigName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteDeploymentConfig'
    };
    await _protocol.send(
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a deployment group for the specified application.
  Future<DeleteDeploymentGroupOutput> deleteDeploymentGroup({
    required String applicationName,
    required String deploymentGroupName,
  }) async {
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
    String? tokenName,
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

  /// Deletes resources linked to an external ID. This action only applies if
  /// you have configured blue/green deployments through CloudFormation.
  /// <note>
  /// It is not necessary to call this action directly. CloudFormation calls it
  /// on your behalf when it needs to delete stack resources. This action is
  /// offered publicly in case you need to delete resources to comply with
  /// General Data Protection Regulation (GDPR) requirements.
  /// </note>
  ///
  /// Parameter [externalId] :
  /// The unique ID of an external resource (for example, a CloudFormation stack
  /// ID) that is linked to one or more CodeDeploy resources.
  Future<void> deleteResourcesByExternalId({
    String? externalId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeleteResourcesByExternalId'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (externalId != null) 'externalId': externalId,
      },
    );
  }

  /// Deregisters an on-premises instance.
  ///
  /// May throw [InstanceNameRequiredException].
  /// May throw [InvalidInstanceNameException].
  ///
  /// Parameter [instanceName] :
  /// The name of the on-premises instance to deregister.
  Future<void> deregisterOnPremisesInstance({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.DeregisterOnPremisesInstance'
    };
    await _protocol.send(
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  Future<GetApplicationOutput> getApplication({
    required String applicationName,
  }) async {
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
    required String applicationName,
    required RevisionLocation revision,
  }) async {
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
  /// The unique ID of a deployment associated with the user or Amazon Web
  /// Services account.
  Future<GetDeploymentOutput> getDeployment({
    required String deploymentId,
  }) async {
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
  /// The name of a deployment configuration associated with the user or Amazon
  /// Web Services account.
  Future<GetDeploymentConfigOutput> getDeploymentConfig({
    required String deploymentConfigName,
  }) async {
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [deploymentGroupName] :
  /// The name of a deployment group for the specified application.
  Future<GetDeploymentGroupOutput> getDeploymentGroup({
    required String applicationName,
    required String deploymentGroupName,
  }) async {
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
  @Deprecated('This operation is deprecated, use GetDeploymentTarget instead.')
  Future<GetDeploymentInstanceOutput> getDeploymentInstance({
    required String deploymentId,
    required String instanceId,
  }) async {
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
    required String deploymentId,
    required String targetId,
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
        'deploymentId': deploymentId,
        'targetId': targetId,
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
    required String instanceName,
  }) async {
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
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
  /// with CodeDeploy.
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
    required String applicationName,
    ListStateFilterAction? deployed,
    String? nextToken,
    String? s3Bucket,
    String? s3KeyPrefix,
    ApplicationRevisionSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
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

  /// Lists the applications registered with the user or Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list applications call. It can be
  /// used to return the next set of applications in the list.
  Future<ListApplicationsOutput> listApplications({
    String? nextToken,
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

  /// Lists the deployment configurations with the user or Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous
  /// <code>ListDeploymentConfigs</code> call. It can be used to return the next
  /// set of deployment configurations in the list.
  Future<ListDeploymentConfigsOutput> listDeploymentConfigs({
    String? nextToken,
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

  /// Lists the deployment groups for an application registered with the Amazon
  /// Web Services user or Amazon Web Services account.
  ///
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [applicationName] :
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [nextToken] :
  /// An identifier returned from the previous list deployment groups call. It
  /// can be used to return the next set of deployment groups in the list.
  Future<ListDeploymentGroupsOutput> listDeploymentGroups({
    required String applicationName,
    String? nextToken,
  }) async {
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
  /// with a compute platform other than EC2/On-premises or Lambda.
  /// </note>
  /// Lists the instance for a deployment associated with the user or Amazon Web
  /// Services account.
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
  @Deprecated(
      'This operation is deprecated, use ListDeploymentTargets instead.')
  Future<ListDeploymentInstancesOutput> listDeploymentInstances({
    required String deploymentId,
    List<InstanceStatus>? instanceStatusFilter,
    List<InstanceType>? instanceTypeFilter,
    String? nextToken,
  }) async {
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
              instanceStatusFilter.map((e) => e.toValue()).toList(),
        if (instanceTypeFilter != null)
          'instanceTypeFilter':
              instanceTypeFilter.map((e) => e.toValue()).toList(),
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
  /// May throw [InvalidTargetFilterNameException].
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
    required String deploymentId,
    String? nextToken,
    Map<TargetFilterName, List<String>>? targetFilters,
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
        'deploymentId': deploymentId,
        if (nextToken != null) 'nextToken': nextToken,
        if (targetFilters != null)
          'targetFilters':
              targetFilters.map((k, e) => MapEntry(k.toValue(), e)),
      },
    );

    return ListDeploymentTargetsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the deployments in a deployment group for an application registered
  /// with the user or Amazon Web Services account.
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
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
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
    String? applicationName,
    TimeRange? createTimeRange,
    String? deploymentGroupName,
    String? externalId,
    List<DeploymentStatus>? includeOnlyStatuses,
    String? nextToken,
  }) async {
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
              includeOnlyStatuses.map((e) => e.toValue()).toList(),
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
    String? nextToken,
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
    String? nextToken,
    RegistrationStatus? registrationStatus,
    List<TagFilter>? tagFilters,
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
    required String resourceArn,
    String? nextToken,
  }) async {
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
  /// lifecycle hooks during a deployment that uses the Lambda or Amazon ECS
  /// compute platform. For Lambda deployments, the available lifecycle hooks
  /// are <code>BeforeAllowTraffic</code> and <code>AfterAllowTraffic</code>.
  /// For Amazon ECS deployments, the available lifecycle hooks are
  /// <code>BeforeInstall</code>, <code>AfterInstall</code>,
  /// <code>AfterAllowTestTraffic</code>, <code>BeforeAllowTraffic</code>, and
  /// <code>AfterAllowTraffic</code>. Lambda validation functions return
  /// <code>Succeeded</code> or <code>Failed</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda">AppSpec
  /// 'hooks' Section for an Lambda Deployment </a> and <a
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
  /// event. The values listed in <b>Valid Values</b> are valid for lifecycle
  /// statuses in general; however, only <code>Succeeded</code> and
  /// <code>Failed</code> can be passed successfully in your API call.
  Future<PutLifecycleEventHookExecutionStatusOutput>
      putLifecycleEventHookExecutionStatus({
    String? deploymentId,
    String? lifecycleEventHookExecutionId,
    LifecycleEventStatus? status,
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

  /// Registers with CodeDeploy a revision for the specified application.
  ///
  /// May throw [ApplicationDoesNotExistException].
  /// May throw [ApplicationNameRequiredException].
  /// May throw [InvalidApplicationNameException].
  /// May throw [DescriptionTooLongException].
  /// May throw [RevisionRequiredException].
  /// May throw [InvalidRevisionException].
  ///
  /// Parameter [applicationName] :
  /// The name of an CodeDeploy application associated with the user or Amazon
  /// Web Services account.
  ///
  /// Parameter [revision] :
  /// Information about the application revision to register, including type and
  /// location.
  ///
  /// Parameter [description] :
  /// A comment about the revision.
  Future<void> registerApplicationRevision({
    required String applicationName,
    required RevisionLocation revision,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RegisterApplicationRevision'
    };
    await _protocol.send(
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
  /// The ARN of the user to associate with the on-premises instance.
  Future<void> registerOnPremisesInstance({
    required String instanceName,
    String? iamSessionArn,
    String? iamUserArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RegisterOnPremisesInstance'
    };
    await _protocol.send(
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
    required List<String> instanceNames,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.RemoveTagsFromOnPremisesInstances'
    };
    await _protocol.send(
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
  @Deprecated(
      'This operation is deprecated, use ContinueDeployment with DeploymentWaitType instead.')
  Future<void> skipWaitTimeForInstanceTermination({
    String? deploymentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.SkipWaitTimeForInstanceTermination'
    };
    await _protocol.send(
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
    required String deploymentId,
    bool? autoRollbackEnabled,
  }) async {
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.TagResource'
    };
    await _protocol.send(
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.UntagResource'
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
    String? applicationName,
    String? newApplicationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeDeploy_20141006.UpdateApplication'
    };
    await _protocol.send(
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
  /// deployment group, if you want to change them.
  ///
  /// <ul>
  /// <li>
  /// To keep the Auto Scaling groups, enter their names or do not specify this
  /// parameter.
  /// </li>
  /// <li>
  /// To remove Auto Scaling groups, specify a non-null empty list of Auto
  /// Scaling group names to detach all CodeDeploy-managed Auto Scaling
  /// lifecycle hooks. For examples, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/troubleshooting-auto-scaling.html#troubleshooting-auto-scaling-heartbeat">Amazon
  /// EC2 instances in an Amazon EC2 Auto Scaling group fail to launch and
  /// receive the error "Heartbeat Timeout"</a> in the <i>CodeDeploy User
  /// Guide</i>.
  /// </li>
  /// </ul>
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
  /// deployment group includes only Amazon EC2 instances identified by all the
  /// tag groups.
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
  /// Parameter [outdatedInstancesStrategy] :
  /// Indicates what happens when new Amazon EC2 instances are launched
  /// mid-deployment and do not receive the deployed application revision.
  ///
  /// If this option is set to <code>UPDATE</code> or is unspecified, CodeDeploy
  /// initiates one or more 'auto-update outdated instances' deployments to
  /// apply the deployed application revision to the new Amazon EC2 instances.
  ///
  /// If this option is set to <code>IGNORE</code>, CodeDeploy does not initiate
  /// a deployment to update the new Amazon EC2 instances. This may result in
  /// instances having different revisions.
  ///
  /// Parameter [serviceRoleArn] :
  /// A replacement ARN for the service role, if you want to change it.
  ///
  /// Parameter [terminationHookEnabled] :
  /// This parameter only applies if you are using CodeDeploy with Amazon EC2
  /// Auto Scaling. For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html">Integrating
  /// CodeDeploy with Amazon EC2 Auto Scaling</a> in the <i>CodeDeploy User
  /// Guide</i>.
  ///
  /// Set <code>terminationHookEnabled</code> to <code>true</code> to have
  /// CodeDeploy install a termination hook into your Auto Scaling group when
  /// you update a deployment group. When this hook is installed, CodeDeploy
  /// will perform termination deployments.
  ///
  /// For information about termination deployments, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable">Enabling
  /// termination deployments during Auto Scaling scale-in events</a> in the
  /// <i>CodeDeploy User Guide</i>.
  ///
  /// For more information about Auto Scaling scale-in events, see the <a
  /// href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html#as-lifecycle-scale-in">Scale
  /// in</a> topic in the <i>Amazon EC2 Auto Scaling User Guide</i>.
  ///
  /// Parameter [triggerConfigurations] :
  /// Information about triggers to change when the deployment group is updated.
  /// For examples, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-edit.html">Edit
  /// a Trigger in a CodeDeploy Deployment Group</a> in the <i>CodeDeploy User
  /// Guide</i>.
  Future<UpdateDeploymentGroupOutput> updateDeploymentGroup({
    required String applicationName,
    required String currentDeploymentGroupName,
    AlarmConfiguration? alarmConfiguration,
    AutoRollbackConfiguration? autoRollbackConfiguration,
    List<String>? autoScalingGroups,
    BlueGreenDeploymentConfiguration? blueGreenDeploymentConfiguration,
    String? deploymentConfigName,
    DeploymentStyle? deploymentStyle,
    List<EC2TagFilter>? ec2TagFilters,
    EC2TagSet? ec2TagSet,
    List<ECSService>? ecsServices,
    LoadBalancerInfo? loadBalancerInfo,
    String? newDeploymentGroupName,
    List<TagFilter>? onPremisesInstanceTagFilters,
    OnPremisesTagSet? onPremisesTagSet,
    OutdatedInstancesStrategy? outdatedInstancesStrategy,
    String? serviceRoleArn,
    bool? terminationHookEnabled,
    List<TriggerConfig>? triggerConfigurations,
  }) async {
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
        if (outdatedInstancesStrategy != null)
          'outdatedInstancesStrategy': outdatedInstancesStrategy.toValue(),
        if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
        if (terminationHookEnabled != null)
          'terminationHookEnabled': terminationHookEnabled,
        if (triggerConfigurations != null)
          'triggerConfigurations': triggerConfigurations,
      },
    );

    return UpdateDeploymentGroupOutput.fromJson(jsonResponse.body);
  }
}

/// Information about an alarm.
class Alarm {
  /// The name of the alarm. Maximum length is 255 characters. Each alarm name can
  /// be used only once in a list of alarms.
  final String? name;

  Alarm({
    this.name,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Information about alarms associated with a deployment or deployment group.
class AlarmConfiguration {
  /// A list of alarms configured for the deployment or deployment group. A
  /// maximum of 10 alarms can be added.
  final List<Alarm>? alarms;

  /// Indicates whether the alarm configuration is enabled.
  final bool? enabled;

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
  final bool? ignorePollAlarmFailure;

  AlarmConfiguration({
    this.alarms,
    this.enabled,
    this.ignorePollAlarmFailure,
  });

  factory AlarmConfiguration.fromJson(Map<String, dynamic> json) {
    return AlarmConfiguration(
      alarms: (json['alarms'] as List?)
          ?.whereNotNull()
          .map((e) => Alarm.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabled: json['enabled'] as bool?,
      ignorePollAlarmFailure: json['ignorePollAlarmFailure'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarms = this.alarms;
    final enabled = this.enabled;
    final ignorePollAlarmFailure = this.ignorePollAlarmFailure;
    return {
      if (alarms != null) 'alarms': alarms,
      if (enabled != null) 'enabled': enabled,
      if (ignorePollAlarmFailure != null)
        'ignorePollAlarmFailure': ignorePollAlarmFailure,
    };
  }
}

/// A revision for an Lambda or Amazon ECS deployment that is a YAML-formatted
/// or JSON-formatted string. For Lambda and Amazon ECS deployments, the
/// revision is the same as the AppSpec file. This method replaces the
/// deprecated <code>RawString</code> data type.
class AppSpecContent {
  /// The YAML-formatted or JSON-formatted revision string.
  ///
  /// For an Lambda deployment, the content includes a Lambda function name, the
  /// alias for its original version, and the alias for its replacement version.
  /// The deployment shifts traffic from the original version of the Lambda
  /// function to the replacement version.
  ///
  /// For an Amazon ECS deployment, the content includes the task name,
  /// information about the load balancer that serves traffic to the container,
  /// and more.
  ///
  /// For both types of deployments, the content can specify Lambda functions that
  /// run at specified hooks, such as <code>BeforeInstall</code>, during a
  /// deployment.
  final String? content;

  /// The SHA256 hash value of the revision content.
  final String? sha256;

  AppSpecContent({
    this.content,
    this.sha256,
  });

  factory AppSpecContent.fromJson(Map<String, dynamic> json) {
    return AppSpecContent(
      content: json['content'] as String?,
      sha256: json['sha256'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final sha256 = this.sha256;
    return {
      if (content != null) 'content': content,
      if (sha256 != null) 'sha256': sha256,
    };
  }
}

/// Information about an application.
class ApplicationInfo {
  /// The application ID.
  final String? applicationId;

  /// The application name.
  final String? applicationName;

  /// The destination platform type for deployment of the application
  /// (<code>Lambda</code> or <code>Server</code>).
  final ComputePlatform? computePlatform;

  /// The time at which the application was created.
  final DateTime? createTime;

  /// The name for a connection to a GitHub account.
  final String? gitHubAccountName;

  /// True if the user has authenticated with GitHub for the specified
  /// application. Otherwise, false.
  final bool? linkedToGitHub;

  ApplicationInfo({
    this.applicationId,
    this.applicationName,
    this.computePlatform,
    this.createTime,
    this.gitHubAccountName,
    this.linkedToGitHub,
  });

  factory ApplicationInfo.fromJson(Map<String, dynamic> json) {
    return ApplicationInfo(
      applicationId: json['applicationId'] as String?,
      applicationName: json['applicationName'] as String?,
      computePlatform:
          (json['computePlatform'] as String?)?.toComputePlatform(),
      createTime: timeStampFromJson(json['createTime']),
      gitHubAccountName: json['gitHubAccountName'] as String?,
      linkedToGitHub: json['linkedToGitHub'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationName = this.applicationName;
    final computePlatform = this.computePlatform;
    final createTime = this.createTime;
    final gitHubAccountName = this.gitHubAccountName;
    final linkedToGitHub = this.linkedToGitHub;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (applicationName != null) 'applicationName': applicationName,
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (gitHubAccountName != null) 'gitHubAccountName': gitHubAccountName,
      if (linkedToGitHub != null) 'linkedToGitHub': linkedToGitHub,
    };
  }
}

enum ApplicationRevisionSortBy {
  registerTime,
  firstUsedTime,
  lastUsedTime,
}

extension ApplicationRevisionSortByValueExtension on ApplicationRevisionSortBy {
  String toValue() {
    switch (this) {
      case ApplicationRevisionSortBy.registerTime:
        return 'registerTime';
      case ApplicationRevisionSortBy.firstUsedTime:
        return 'firstUsedTime';
      case ApplicationRevisionSortBy.lastUsedTime:
        return 'lastUsedTime';
    }
  }
}

extension ApplicationRevisionSortByFromString on String {
  ApplicationRevisionSortBy toApplicationRevisionSortBy() {
    switch (this) {
      case 'registerTime':
        return ApplicationRevisionSortBy.registerTime;
      case 'firstUsedTime':
        return ApplicationRevisionSortBy.firstUsedTime;
      case 'lastUsedTime':
        return ApplicationRevisionSortBy.lastUsedTime;
    }
    throw Exception('$this is not known in enum ApplicationRevisionSortBy');
  }
}

/// Information about a configuration for automatically rolling back to a
/// previous version of an application revision when a deployment is not
/// completed successfully.
class AutoRollbackConfiguration {
  /// Indicates whether a defined automatic rollback configuration is currently
  /// enabled.
  final bool? enabled;

  /// The event type or types that trigger a rollback.
  final List<AutoRollbackEvent>? events;

  AutoRollbackConfiguration({
    this.enabled,
    this.events,
  });

  factory AutoRollbackConfiguration.fromJson(Map<String, dynamic> json) {
    return AutoRollbackConfiguration(
      enabled: json['enabled'] as bool?,
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAutoRollbackEvent())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final events = this.events;
    return {
      if (enabled != null) 'enabled': enabled,
      if (events != null) 'events': events.map((e) => e.toValue()).toList(),
    };
  }
}

enum AutoRollbackEvent {
  deploymentFailure,
  deploymentStopOnAlarm,
  deploymentStopOnRequest,
}

extension AutoRollbackEventValueExtension on AutoRollbackEvent {
  String toValue() {
    switch (this) {
      case AutoRollbackEvent.deploymentFailure:
        return 'DEPLOYMENT_FAILURE';
      case AutoRollbackEvent.deploymentStopOnAlarm:
        return 'DEPLOYMENT_STOP_ON_ALARM';
      case AutoRollbackEvent.deploymentStopOnRequest:
        return 'DEPLOYMENT_STOP_ON_REQUEST';
    }
  }
}

extension AutoRollbackEventFromString on String {
  AutoRollbackEvent toAutoRollbackEvent() {
    switch (this) {
      case 'DEPLOYMENT_FAILURE':
        return AutoRollbackEvent.deploymentFailure;
      case 'DEPLOYMENT_STOP_ON_ALARM':
        return AutoRollbackEvent.deploymentStopOnAlarm;
      case 'DEPLOYMENT_STOP_ON_REQUEST':
        return AutoRollbackEvent.deploymentStopOnRequest;
    }
    throw Exception('$this is not known in enum AutoRollbackEvent');
  }
}

/// Information about an Auto Scaling group.
class AutoScalingGroup {
  /// The name of the launch hook that CodeDeploy installed into the Auto Scaling
  /// group.
  ///
  /// For more information about the launch hook, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors">How
  /// Amazon EC2 Auto Scaling works with CodeDeploy</a> in the <i>CodeDeploy User
  /// Guide</i>.
  final String? hook;

  /// The Auto Scaling group name.
  final String? name;

  /// The name of the termination hook that CodeDeploy installed into the Auto
  /// Scaling group.
  ///
  /// For more information about the termination hook, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors-hook-enable">Enabling
  /// termination deployments during Auto Scaling scale-in events</a> in the
  /// <i>CodeDeploy User Guide</i>.
  final String? terminationHook;

  AutoScalingGroup({
    this.hook,
    this.name,
    this.terminationHook,
  });

  factory AutoScalingGroup.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroup(
      hook: json['hook'] as String?,
      name: json['name'] as String?,
      terminationHook: json['terminationHook'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hook = this.hook;
    final name = this.name;
    final terminationHook = this.terminationHook;
    return {
      if (hook != null) 'hook': hook,
      if (name != null) 'name': name,
      if (terminationHook != null) 'terminationHook': terminationHook,
    };
  }
}

/// Represents the output of a <code>BatchGetApplicationRevisions</code>
/// operation.
class BatchGetApplicationRevisionsOutput {
  /// The name of the application that corresponds to the revisions.
  final String? applicationName;

  /// Information about errors that might have occurred during the API call.
  final String? errorMessage;

  /// Additional information about the revisions, including the type and location.
  final List<RevisionInfo>? revisions;

  BatchGetApplicationRevisionsOutput({
    this.applicationName,
    this.errorMessage,
    this.revisions,
  });

  factory BatchGetApplicationRevisionsOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchGetApplicationRevisionsOutput(
      applicationName: json['applicationName'] as String?,
      errorMessage: json['errorMessage'] as String?,
      revisions: (json['revisions'] as List?)
          ?.whereNotNull()
          .map((e) => RevisionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final errorMessage = this.errorMessage;
    final revisions = this.revisions;
    return {
      if (applicationName != null) 'applicationName': applicationName,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (revisions != null) 'revisions': revisions,
    };
  }
}

/// Represents the output of a <code>BatchGetApplications</code> operation.
class BatchGetApplicationsOutput {
  /// Information about the applications.
  final List<ApplicationInfo>? applicationsInfo;

  BatchGetApplicationsOutput({
    this.applicationsInfo,
  });

  factory BatchGetApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetApplicationsOutput(
      applicationsInfo: (json['applicationsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationsInfo = this.applicationsInfo;
    return {
      if (applicationsInfo != null) 'applicationsInfo': applicationsInfo,
    };
  }
}

/// Represents the output of a <code>BatchGetDeploymentGroups</code> operation.
class BatchGetDeploymentGroupsOutput {
  /// Information about the deployment groups.
  final List<DeploymentGroupInfo>? deploymentGroupsInfo;

  /// Information about errors that might have occurred during the API call.
  final String? errorMessage;

  BatchGetDeploymentGroupsOutput({
    this.deploymentGroupsInfo,
    this.errorMessage,
  });

  factory BatchGetDeploymentGroupsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetDeploymentGroupsOutput(
      deploymentGroupsInfo: (json['deploymentGroupsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentGroupInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentGroupsInfo = this.deploymentGroupsInfo;
    final errorMessage = this.errorMessage;
    return {
      if (deploymentGroupsInfo != null)
        'deploymentGroupsInfo': deploymentGroupsInfo,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// Represents the output of a <code>BatchGetDeploymentInstances</code>
/// operation.
class BatchGetDeploymentInstancesOutput {
  /// Information about errors that might have occurred during the API call.
  final String? errorMessage;

  /// Information about the instance.
  final List<InstanceSummary>? instancesSummary;

  BatchGetDeploymentInstancesOutput({
    this.errorMessage,
    this.instancesSummary,
  });

  factory BatchGetDeploymentInstancesOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchGetDeploymentInstancesOutput(
      errorMessage: json['errorMessage'] as String?,
      instancesSummary: (json['instancesSummary'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final instancesSummary = this.instancesSummary;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (instancesSummary != null) 'instancesSummary': instancesSummary,
    };
  }
}

class BatchGetDeploymentTargetsOutput {
  /// A list of target objects for a deployment. Each target object contains
  /// details about the target, such as its status and lifecycle events. The type
  /// of the target objects depends on the deployment' compute platform.
  ///
  /// <ul>
  /// <li>
  /// <b>EC2/On-premises</b>: Each target object is an Amazon EC2 or on-premises
  /// instance.
  /// </li>
  /// <li>
  /// <b>Lambda</b>: The target object is a specific version of an Lambda
  /// function.
  /// </li>
  /// <li>
  /// <b>Amazon ECS</b>: The target object is an Amazon ECS service.
  /// </li>
  /// <li>
  /// <b>CloudFormation</b>: The target object is an CloudFormation blue/green
  /// deployment.
  /// </li>
  /// </ul>
  final List<DeploymentTarget>? deploymentTargets;

  BatchGetDeploymentTargetsOutput({
    this.deploymentTargets,
  });

  factory BatchGetDeploymentTargetsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetDeploymentTargetsOutput(
      deploymentTargets: (json['deploymentTargets'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentTargets = this.deploymentTargets;
    return {
      if (deploymentTargets != null) 'deploymentTargets': deploymentTargets,
    };
  }
}

/// Represents the output of a <code>BatchGetDeployments</code> operation.
class BatchGetDeploymentsOutput {
  /// Information about the deployments.
  final List<DeploymentInfo>? deploymentsInfo;

  BatchGetDeploymentsOutput({
    this.deploymentsInfo,
  });

  factory BatchGetDeploymentsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetDeploymentsOutput(
      deploymentsInfo: (json['deploymentsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentsInfo = this.deploymentsInfo;
    return {
      if (deploymentsInfo != null) 'deploymentsInfo': deploymentsInfo,
    };
  }
}

/// Represents the output of a <code>BatchGetOnPremisesInstances</code>
/// operation.
class BatchGetOnPremisesInstancesOutput {
  /// Information about the on-premises instances.
  final List<InstanceInfo>? instanceInfos;

  BatchGetOnPremisesInstancesOutput({
    this.instanceInfos,
  });

  factory BatchGetOnPremisesInstancesOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchGetOnPremisesInstancesOutput(
      instanceInfos: (json['instanceInfos'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceInfos = this.instanceInfos;
    return {
      if (instanceInfos != null) 'instanceInfos': instanceInfos,
    };
  }
}

/// Information about blue/green deployment options for a deployment group.
class BlueGreenDeploymentConfiguration {
  /// Information about the action to take when newly provisioned instances are
  /// ready to receive traffic in a blue/green deployment.
  final DeploymentReadyOption? deploymentReadyOption;

  /// Information about how instances are provisioned for a replacement
  /// environment in a blue/green deployment.
  final GreenFleetProvisioningOption? greenFleetProvisioningOption;

  /// Information about whether to terminate instances in the original fleet
  /// during a blue/green deployment.
  final BlueInstanceTerminationOption?
      terminateBlueInstancesOnDeploymentSuccess;

  BlueGreenDeploymentConfiguration({
    this.deploymentReadyOption,
    this.greenFleetProvisioningOption,
    this.terminateBlueInstancesOnDeploymentSuccess,
  });

  factory BlueGreenDeploymentConfiguration.fromJson(Map<String, dynamic> json) {
    return BlueGreenDeploymentConfiguration(
      deploymentReadyOption: json['deploymentReadyOption'] != null
          ? DeploymentReadyOption.fromJson(
              json['deploymentReadyOption'] as Map<String, dynamic>)
          : null,
      greenFleetProvisioningOption: json['greenFleetProvisioningOption'] != null
          ? GreenFleetProvisioningOption.fromJson(
              json['greenFleetProvisioningOption'] as Map<String, dynamic>)
          : null,
      terminateBlueInstancesOnDeploymentSuccess:
          json['terminateBlueInstancesOnDeploymentSuccess'] != null
              ? BlueInstanceTerminationOption.fromJson(
                  json['terminateBlueInstancesOnDeploymentSuccess']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentReadyOption = this.deploymentReadyOption;
    final greenFleetProvisioningOption = this.greenFleetProvisioningOption;
    final terminateBlueInstancesOnDeploymentSuccess =
        this.terminateBlueInstancesOnDeploymentSuccess;
    return {
      if (deploymentReadyOption != null)
        'deploymentReadyOption': deploymentReadyOption,
      if (greenFleetProvisioningOption != null)
        'greenFleetProvisioningOption': greenFleetProvisioningOption,
      if (terminateBlueInstancesOnDeploymentSuccess != null)
        'terminateBlueInstancesOnDeploymentSuccess':
            terminateBlueInstancesOnDeploymentSuccess,
    };
  }
}

/// Information about whether instances in the original environment are
/// terminated when a blue/green deployment is successful.
/// <code>BlueInstanceTerminationOption</code> does not apply to Lambda
/// deployments.
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
  final InstanceAction? action;

  /// For an Amazon EC2 deployment, the number of minutes to wait after a
  /// successful blue/green deployment before terminating instances from the
  /// original environment.
  ///
  /// For an Amazon ECS deployment, the number of minutes before deleting the
  /// original (blue) task set. During an Amazon ECS deployment, CodeDeploy shifts
  /// traffic from the original (blue) task set to a replacement (green) task set.
  ///
  /// The maximum setting is 2880 minutes (2 days).
  final int? terminationWaitTimeInMinutes;

  BlueInstanceTerminationOption({
    this.action,
    this.terminationWaitTimeInMinutes,
  });

  factory BlueInstanceTerminationOption.fromJson(Map<String, dynamic> json) {
    return BlueInstanceTerminationOption(
      action: (json['action'] as String?)?.toInstanceAction(),
      terminationWaitTimeInMinutes:
          json['terminationWaitTimeInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final terminationWaitTimeInMinutes = this.terminationWaitTimeInMinutes;
    return {
      if (action != null) 'action': action.toValue(),
      if (terminationWaitTimeInMinutes != null)
        'terminationWaitTimeInMinutes': terminationWaitTimeInMinutes,
    };
  }
}

enum BundleType {
  tar,
  tgz,
  zip,
  yaml,
  json,
}

extension BundleTypeValueExtension on BundleType {
  String toValue() {
    switch (this) {
      case BundleType.tar:
        return 'tar';
      case BundleType.tgz:
        return 'tgz';
      case BundleType.zip:
        return 'zip';
      case BundleType.yaml:
        return 'YAML';
      case BundleType.json:
        return 'JSON';
    }
  }
}

extension BundleTypeFromString on String {
  BundleType toBundleType() {
    switch (this) {
      case 'tar':
        return BundleType.tar;
      case 'tgz':
        return BundleType.tgz;
      case 'zip':
        return BundleType.zip;
      case 'YAML':
        return BundleType.yaml;
      case 'JSON':
        return BundleType.json;
    }
    throw Exception('$this is not known in enum BundleType');
  }
}

/// Information about the target to be updated by an CloudFormation blue/green
/// deployment. This target type is used for all deployments initiated by a
/// CloudFormation stack update.
class CloudFormationTarget {
  /// The unique ID of an CloudFormation blue/green deployment.
  final String? deploymentId;

  /// The date and time when the target application was updated by an
  /// CloudFormation blue/green deployment.
  final DateTime? lastUpdatedAt;

  /// The lifecycle events of the CloudFormation blue/green deployment to this
  /// target application.
  final List<LifecycleEvent>? lifecycleEvents;

  /// The resource type for the CloudFormation blue/green deployment.
  final String? resourceType;

  /// The status of an CloudFormation blue/green deployment's target application.
  final TargetStatus? status;

  /// The unique ID of a deployment target that has a type
  /// of <code>CloudFormationTarget</code>.
  final String? targetId;

  /// The percentage of production traffic that the target version of an
  /// CloudFormation blue/green deployment receives.
  final double? targetVersionWeight;

  CloudFormationTarget({
    this.deploymentId,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.resourceType,
    this.status,
    this.targetId,
    this.targetVersionWeight,
  });

  factory CloudFormationTarget.fromJson(Map<String, dynamic> json) {
    return CloudFormationTarget(
      deploymentId: json['deploymentId'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleEvents: (json['lifecycleEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: json['resourceType'] as String?,
      status: (json['status'] as String?)?.toTargetStatus(),
      targetId: json['targetId'] as String?,
      targetVersionWeight: json['targetVersionWeight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleEvents = this.lifecycleEvents;
    final resourceType = this.resourceType;
    final status = this.status;
    final targetId = this.targetId;
    final targetVersionWeight = this.targetVersionWeight;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lifecycleEvents != null) 'lifecycleEvents': lifecycleEvents,
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status.toValue(),
      if (targetId != null) 'targetId': targetId,
      if (targetVersionWeight != null)
        'targetVersionWeight': targetVersionWeight,
    };
  }
}

enum ComputePlatform {
  server,
  lambda,
  ecs,
}

extension ComputePlatformValueExtension on ComputePlatform {
  String toValue() {
    switch (this) {
      case ComputePlatform.server:
        return 'Server';
      case ComputePlatform.lambda:
        return 'Lambda';
      case ComputePlatform.ecs:
        return 'ECS';
    }
  }
}

extension ComputePlatformFromString on String {
  ComputePlatform toComputePlatform() {
    switch (this) {
      case 'Server':
        return ComputePlatform.server;
      case 'Lambda':
        return ComputePlatform.lambda;
      case 'ECS':
        return ComputePlatform.ecs;
    }
    throw Exception('$this is not known in enum ComputePlatform');
  }
}

/// Represents the output of a <code>CreateApplication</code> operation.
class CreateApplicationOutput {
  /// A unique application ID.
  final String? applicationId;

  CreateApplicationOutput({
    this.applicationId,
  });

  factory CreateApplicationOutput.fromJson(Map<String, dynamic> json) {
    return CreateApplicationOutput(
      applicationId: json['applicationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    return {
      if (applicationId != null) 'applicationId': applicationId,
    };
  }
}

/// Represents the output of a <code>CreateDeploymentConfig</code> operation.
class CreateDeploymentConfigOutput {
  /// A unique deployment configuration ID.
  final String? deploymentConfigId;

  CreateDeploymentConfigOutput({
    this.deploymentConfigId,
  });

  factory CreateDeploymentConfigOutput.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentConfigOutput(
      deploymentConfigId: json['deploymentConfigId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentConfigId = this.deploymentConfigId;
    return {
      if (deploymentConfigId != null) 'deploymentConfigId': deploymentConfigId,
    };
  }
}

/// Represents the output of a <code>CreateDeploymentGroup</code> operation.
class CreateDeploymentGroupOutput {
  /// A unique deployment group ID.
  final String? deploymentGroupId;

  CreateDeploymentGroupOutput({
    this.deploymentGroupId,
  });

  factory CreateDeploymentGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentGroupOutput(
      deploymentGroupId: json['deploymentGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentGroupId = this.deploymentGroupId;
    return {
      if (deploymentGroupId != null) 'deploymentGroupId': deploymentGroupId,
    };
  }
}

/// Represents the output of a <code>CreateDeployment</code> operation.
class CreateDeploymentOutput {
  /// The unique ID of a deployment.
  final String? deploymentId;

  CreateDeploymentOutput({
    this.deploymentId,
  });

  factory CreateDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentOutput(
      deploymentId: json['deploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
    };
  }
}

/// Represents the output of a <code>DeleteDeploymentGroup</code> operation.
class DeleteDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, CodeDeploy successfully removed
  /// all corresponding Auto Scaling lifecycle event hooks from the Amazon EC2
  /// instances in the Auto Scaling group. If the output contains data, CodeDeploy
  /// could not remove some Auto Scaling lifecycle event hooks from the Amazon EC2
  /// instances in the Auto Scaling group.
  final List<AutoScalingGroup>? hooksNotCleanedUp;

  DeleteDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });

  factory DeleteDeploymentGroupOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDeploymentGroupOutput(
      hooksNotCleanedUp: (json['hooksNotCleanedUp'] as List?)
          ?.whereNotNull()
          .map((e) => AutoScalingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hooksNotCleanedUp = this.hooksNotCleanedUp;
    return {
      if (hooksNotCleanedUp != null) 'hooksNotCleanedUp': hooksNotCleanedUp,
    };
  }
}

/// Represents the output of a <code>DeleteGitHubAccountToken</code> operation.
class DeleteGitHubAccountTokenOutput {
  /// The name of the GitHub account connection that was deleted.
  final String? tokenName;

  DeleteGitHubAccountTokenOutput({
    this.tokenName,
  });

  factory DeleteGitHubAccountTokenOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGitHubAccountTokenOutput(
      tokenName: json['tokenName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tokenName = this.tokenName;
    return {
      if (tokenName != null) 'tokenName': tokenName,
    };
  }
}

class DeleteResourcesByExternalIdOutput {
  DeleteResourcesByExternalIdOutput();

  factory DeleteResourcesByExternalIdOutput.fromJson(Map<String, dynamic> _) {
    return DeleteResourcesByExternalIdOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a deployment configuration.
class DeploymentConfigInfo {
  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  final ComputePlatform? computePlatform;

  /// The time at which the deployment configuration was created.
  final DateTime? createTime;

  /// The deployment configuration ID.
  final String? deploymentConfigId;

  /// The deployment configuration name.
  final String? deploymentConfigName;

  /// Information about the number or percentage of minimum healthy instances.
  final MinimumHealthyHosts? minimumHealthyHosts;

  /// The configuration that specifies how the deployment traffic is routed. Used
  /// for deployments with a Lambda or Amazon ECS compute platform only.
  final TrafficRoutingConfig? trafficRoutingConfig;

  /// Information about a zonal configuration.
  final ZonalConfig? zonalConfig;

  DeploymentConfigInfo({
    this.computePlatform,
    this.createTime,
    this.deploymentConfigId,
    this.deploymentConfigName,
    this.minimumHealthyHosts,
    this.trafficRoutingConfig,
    this.zonalConfig,
  });

  factory DeploymentConfigInfo.fromJson(Map<String, dynamic> json) {
    return DeploymentConfigInfo(
      computePlatform:
          (json['computePlatform'] as String?)?.toComputePlatform(),
      createTime: timeStampFromJson(json['createTime']),
      deploymentConfigId: json['deploymentConfigId'] as String?,
      deploymentConfigName: json['deploymentConfigName'] as String?,
      minimumHealthyHosts: json['minimumHealthyHosts'] != null
          ? MinimumHealthyHosts.fromJson(
              json['minimumHealthyHosts'] as Map<String, dynamic>)
          : null,
      trafficRoutingConfig: json['trafficRoutingConfig'] != null
          ? TrafficRoutingConfig.fromJson(
              json['trafficRoutingConfig'] as Map<String, dynamic>)
          : null,
      zonalConfig: json['zonalConfig'] != null
          ? ZonalConfig.fromJson(json['zonalConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computePlatform = this.computePlatform;
    final createTime = this.createTime;
    final deploymentConfigId = this.deploymentConfigId;
    final deploymentConfigName = this.deploymentConfigName;
    final minimumHealthyHosts = this.minimumHealthyHosts;
    final trafficRoutingConfig = this.trafficRoutingConfig;
    final zonalConfig = this.zonalConfig;
    return {
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deploymentConfigId != null) 'deploymentConfigId': deploymentConfigId,
      if (deploymentConfigName != null)
        'deploymentConfigName': deploymentConfigName,
      if (minimumHealthyHosts != null)
        'minimumHealthyHosts': minimumHealthyHosts,
      if (trafficRoutingConfig != null)
        'trafficRoutingConfig': trafficRoutingConfig,
      if (zonalConfig != null) 'zonalConfig': zonalConfig,
    };
  }
}

enum DeploymentCreator {
  user,
  autoscaling,
  codeDeployRollback,
  codeDeploy,
  codeDeployAutoUpdate,
  cloudFormation,
  cloudFormationRollback,
  autoscalingTermination,
}

extension DeploymentCreatorValueExtension on DeploymentCreator {
  String toValue() {
    switch (this) {
      case DeploymentCreator.user:
        return 'user';
      case DeploymentCreator.autoscaling:
        return 'autoscaling';
      case DeploymentCreator.codeDeployRollback:
        return 'codeDeployRollback';
      case DeploymentCreator.codeDeploy:
        return 'CodeDeploy';
      case DeploymentCreator.codeDeployAutoUpdate:
        return 'CodeDeployAutoUpdate';
      case DeploymentCreator.cloudFormation:
        return 'CloudFormation';
      case DeploymentCreator.cloudFormationRollback:
        return 'CloudFormationRollback';
      case DeploymentCreator.autoscalingTermination:
        return 'autoscalingTermination';
    }
  }
}

extension DeploymentCreatorFromString on String {
  DeploymentCreator toDeploymentCreator() {
    switch (this) {
      case 'user':
        return DeploymentCreator.user;
      case 'autoscaling':
        return DeploymentCreator.autoscaling;
      case 'codeDeployRollback':
        return DeploymentCreator.codeDeployRollback;
      case 'CodeDeploy':
        return DeploymentCreator.codeDeploy;
      case 'CodeDeployAutoUpdate':
        return DeploymentCreator.codeDeployAutoUpdate;
      case 'CloudFormation':
        return DeploymentCreator.cloudFormation;
      case 'CloudFormationRollback':
        return DeploymentCreator.cloudFormationRollback;
      case 'autoscalingTermination':
        return DeploymentCreator.autoscalingTermination;
    }
    throw Exception('$this is not known in enum DeploymentCreator');
  }
}

/// Information about a deployment group.
class DeploymentGroupInfo {
  /// A list of alarms associated with the deployment group.
  final AlarmConfiguration? alarmConfiguration;

  /// The application name.
  final String? applicationName;

  /// Information about the automatic rollback configuration associated with the
  /// deployment group.
  final AutoRollbackConfiguration? autoRollbackConfiguration;

  /// A list of associated Auto Scaling groups.
  final List<AutoScalingGroup>? autoScalingGroups;

  /// Information about blue/green deployment options for a deployment group.
  final BlueGreenDeploymentConfiguration? blueGreenDeploymentConfiguration;

  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  final ComputePlatform? computePlatform;

  /// The deployment configuration name.
  final String? deploymentConfigName;

  /// The deployment group ID.
  final String? deploymentGroupId;

  /// The deployment group name.
  final String? deploymentGroupName;

  /// Information about the type of deployment, either in-place or blue/green, you
  /// want to run and whether to route deployment traffic behind a load balancer.
  final DeploymentStyle? deploymentStyle;

  /// The Amazon EC2 tags on which to filter. The deployment group includes EC2
  /// instances with any of the specified tags.
  final List<EC2TagFilter>? ec2TagFilters;

  /// Information about groups of tags applied to an Amazon EC2 instance. The
  /// deployment group includes only Amazon EC2 instances identified by all of the
  /// tag groups. Cannot be used in the same call as ec2TagFilters.
  final EC2TagSet? ec2TagSet;

  /// The target Amazon ECS services in the deployment group. This applies only to
  /// deployment groups that use the Amazon ECS compute platform. A target Amazon
  /// ECS service is specified as an Amazon ECS cluster and service name pair
  /// using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>.
  final List<ECSService>? ecsServices;

  /// Information about the most recent attempted deployment to the deployment
  /// group.
  final LastDeploymentInfo? lastAttemptedDeployment;

  /// Information about the most recent successful deployment to the deployment
  /// group.
  final LastDeploymentInfo? lastSuccessfulDeployment;

  /// Information about the load balancer to use in a deployment.
  final LoadBalancerInfo? loadBalancerInfo;

  /// The on-premises instance tags on which to filter. The deployment group
  /// includes on-premises instances with any of the specified tags.
  final List<TagFilter>? onPremisesInstanceTagFilters;

  /// Information about groups of tags applied to an on-premises instance. The
  /// deployment group includes only on-premises instances identified by all the
  /// tag groups. Cannot be used in the same call as onPremisesInstanceTagFilters.
  final OnPremisesTagSet? onPremisesTagSet;

  /// Indicates what happens when new Amazon EC2 instances are launched
  /// mid-deployment and do not receive the deployed application revision.
  ///
  /// If this option is set to <code>UPDATE</code> or is unspecified, CodeDeploy
  /// initiates one or more 'auto-update outdated instances' deployments to apply
  /// the deployed application revision to the new Amazon EC2 instances.
  ///
  /// If this option is set to <code>IGNORE</code>, CodeDeploy does not initiate a
  /// deployment to update the new Amazon EC2 instances. This may result in
  /// instances having different revisions.
  final OutdatedInstancesStrategy? outdatedInstancesStrategy;

  /// A service role Amazon Resource Name (ARN) that grants CodeDeploy permission
  /// to make calls to Amazon Web Services services on your behalf. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html">Create
  /// a Service Role for CodeDeploy</a> in the <i>CodeDeploy User Guide</i>.
  final String? serviceRoleArn;

  /// Information about the deployment group's target revision, including type and
  /// location.
  final RevisionLocation? targetRevision;

  /// Indicates whether the deployment group was configured to have CodeDeploy
  /// install a termination hook into an Auto Scaling group.
  ///
  /// For more information about the termination hook, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/integrations-aws-auto-scaling.html#integrations-aws-auto-scaling-behaviors">How
  /// Amazon EC2 Auto Scaling works with CodeDeploy</a> in the <i>CodeDeploy User
  /// Guide</i>.
  final bool? terminationHookEnabled;

  /// Information about triggers associated with the deployment group.
  final List<TriggerConfig>? triggerConfigurations;

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
    this.outdatedInstancesStrategy,
    this.serviceRoleArn,
    this.targetRevision,
    this.terminationHookEnabled,
    this.triggerConfigurations,
  });

  factory DeploymentGroupInfo.fromJson(Map<String, dynamic> json) {
    return DeploymentGroupInfo(
      alarmConfiguration: json['alarmConfiguration'] != null
          ? AlarmConfiguration.fromJson(
              json['alarmConfiguration'] as Map<String, dynamic>)
          : null,
      applicationName: json['applicationName'] as String?,
      autoRollbackConfiguration: json['autoRollbackConfiguration'] != null
          ? AutoRollbackConfiguration.fromJson(
              json['autoRollbackConfiguration'] as Map<String, dynamic>)
          : null,
      autoScalingGroups: (json['autoScalingGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AutoScalingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      blueGreenDeploymentConfiguration:
          json['blueGreenDeploymentConfiguration'] != null
              ? BlueGreenDeploymentConfiguration.fromJson(
                  json['blueGreenDeploymentConfiguration']
                      as Map<String, dynamic>)
              : null,
      computePlatform:
          (json['computePlatform'] as String?)?.toComputePlatform(),
      deploymentConfigName: json['deploymentConfigName'] as String?,
      deploymentGroupId: json['deploymentGroupId'] as String?,
      deploymentGroupName: json['deploymentGroupName'] as String?,
      deploymentStyle: json['deploymentStyle'] != null
          ? DeploymentStyle.fromJson(
              json['deploymentStyle'] as Map<String, dynamic>)
          : null,
      ec2TagFilters: (json['ec2TagFilters'] as List?)
          ?.whereNotNull()
          .map((e) => EC2TagFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2TagSet: json['ec2TagSet'] != null
          ? EC2TagSet.fromJson(json['ec2TagSet'] as Map<String, dynamic>)
          : null,
      ecsServices: (json['ecsServices'] as List?)
          ?.whereNotNull()
          .map((e) => ECSService.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastAttemptedDeployment: json['lastAttemptedDeployment'] != null
          ? LastDeploymentInfo.fromJson(
              json['lastAttemptedDeployment'] as Map<String, dynamic>)
          : null,
      lastSuccessfulDeployment: json['lastSuccessfulDeployment'] != null
          ? LastDeploymentInfo.fromJson(
              json['lastSuccessfulDeployment'] as Map<String, dynamic>)
          : null,
      loadBalancerInfo: json['loadBalancerInfo'] != null
          ? LoadBalancerInfo.fromJson(
              json['loadBalancerInfo'] as Map<String, dynamic>)
          : null,
      onPremisesInstanceTagFilters:
          (json['onPremisesInstanceTagFilters'] as List?)
              ?.whereNotNull()
              .map((e) => TagFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      onPremisesTagSet: json['onPremisesTagSet'] != null
          ? OnPremisesTagSet.fromJson(
              json['onPremisesTagSet'] as Map<String, dynamic>)
          : null,
      outdatedInstancesStrategy: (json['outdatedInstancesStrategy'] as String?)
          ?.toOutdatedInstancesStrategy(),
      serviceRoleArn: json['serviceRoleArn'] as String?,
      targetRevision: json['targetRevision'] != null
          ? RevisionLocation.fromJson(
              json['targetRevision'] as Map<String, dynamic>)
          : null,
      terminationHookEnabled: json['terminationHookEnabled'] as bool?,
      triggerConfigurations: (json['triggerConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => TriggerConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmConfiguration = this.alarmConfiguration;
    final applicationName = this.applicationName;
    final autoRollbackConfiguration = this.autoRollbackConfiguration;
    final autoScalingGroups = this.autoScalingGroups;
    final blueGreenDeploymentConfiguration =
        this.blueGreenDeploymentConfiguration;
    final computePlatform = this.computePlatform;
    final deploymentConfigName = this.deploymentConfigName;
    final deploymentGroupId = this.deploymentGroupId;
    final deploymentGroupName = this.deploymentGroupName;
    final deploymentStyle = this.deploymentStyle;
    final ec2TagFilters = this.ec2TagFilters;
    final ec2TagSet = this.ec2TagSet;
    final ecsServices = this.ecsServices;
    final lastAttemptedDeployment = this.lastAttemptedDeployment;
    final lastSuccessfulDeployment = this.lastSuccessfulDeployment;
    final loadBalancerInfo = this.loadBalancerInfo;
    final onPremisesInstanceTagFilters = this.onPremisesInstanceTagFilters;
    final onPremisesTagSet = this.onPremisesTagSet;
    final outdatedInstancesStrategy = this.outdatedInstancesStrategy;
    final serviceRoleArn = this.serviceRoleArn;
    final targetRevision = this.targetRevision;
    final terminationHookEnabled = this.terminationHookEnabled;
    final triggerConfigurations = this.triggerConfigurations;
    return {
      if (alarmConfiguration != null) 'alarmConfiguration': alarmConfiguration,
      if (applicationName != null) 'applicationName': applicationName,
      if (autoRollbackConfiguration != null)
        'autoRollbackConfiguration': autoRollbackConfiguration,
      if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
      if (blueGreenDeploymentConfiguration != null)
        'blueGreenDeploymentConfiguration': blueGreenDeploymentConfiguration,
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (deploymentConfigName != null)
        'deploymentConfigName': deploymentConfigName,
      if (deploymentGroupId != null) 'deploymentGroupId': deploymentGroupId,
      if (deploymentGroupName != null)
        'deploymentGroupName': deploymentGroupName,
      if (deploymentStyle != null) 'deploymentStyle': deploymentStyle,
      if (ec2TagFilters != null) 'ec2TagFilters': ec2TagFilters,
      if (ec2TagSet != null) 'ec2TagSet': ec2TagSet,
      if (ecsServices != null) 'ecsServices': ecsServices,
      if (lastAttemptedDeployment != null)
        'lastAttemptedDeployment': lastAttemptedDeployment,
      if (lastSuccessfulDeployment != null)
        'lastSuccessfulDeployment': lastSuccessfulDeployment,
      if (loadBalancerInfo != null) 'loadBalancerInfo': loadBalancerInfo,
      if (onPremisesInstanceTagFilters != null)
        'onPremisesInstanceTagFilters': onPremisesInstanceTagFilters,
      if (onPremisesTagSet != null) 'onPremisesTagSet': onPremisesTagSet,
      if (outdatedInstancesStrategy != null)
        'outdatedInstancesStrategy': outdatedInstancesStrategy.toValue(),
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
      if (targetRevision != null) 'targetRevision': targetRevision,
      if (terminationHookEnabled != null)
        'terminationHookEnabled': terminationHookEnabled,
      if (triggerConfigurations != null)
        'triggerConfigurations': triggerConfigurations,
    };
  }
}

/// Information about a deployment.
class DeploymentInfo {
  /// Provides information about the results of a deployment, such as whether
  /// instances in the original environment in a blue/green deployment were not
  /// terminated.
  final String? additionalDeploymentStatusInfo;

  /// The application name.
  final String? applicationName;

  /// Information about the automatic rollback configuration associated with the
  /// deployment.
  final AutoRollbackConfiguration? autoRollbackConfiguration;

  /// Information about blue/green deployment options for this deployment.
  final BlueGreenDeploymentConfiguration? blueGreenDeploymentConfiguration;

  /// A timestamp that indicates when the deployment was complete.
  final DateTime? completeTime;

  /// The destination platform type for the deployment (<code>Lambda</code>,
  /// <code>Server</code>, or <code>ECS</code>).
  final ComputePlatform? computePlatform;

  /// A timestamp that indicates when the deployment was created.
  final DateTime? createTime;

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
  /// <li>
  /// <code>CodeDeployAutoUpdate</code>: An auto-update process created the
  /// deployment when it detected outdated Amazon EC2 instances.
  /// </li>
  /// </ul>
  final DeploymentCreator? creator;

  /// The deployment configuration name.
  final String? deploymentConfigName;

  /// The deployment group name.
  final String? deploymentGroupName;

  /// The unique ID of a deployment.
  final String? deploymentId;

  /// A summary of the deployment status of the instances in the deployment.
  final DeploymentOverview? deploymentOverview;

  /// Messages that contain information about the status of a deployment.
  final List<String>? deploymentStatusMessages;

  /// Information about the type of deployment, either in-place or blue/green, you
  /// want to run and whether to route deployment traffic behind a load balancer.
  final DeploymentStyle? deploymentStyle;

  /// A comment about the deployment.
  final String? description;

  /// Information about any error associated with this deployment.
  final ErrorInformation? errorInformation;

  /// The unique ID for an external resource (for example, a CloudFormation stack
  /// ID) that is linked to this deployment.
  final String? externalId;

  /// Information about how CodeDeploy handles files that already exist in a
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
  final FileExistsBehavior? fileExistsBehavior;

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
  /// During a deployment, the CodeDeploy agent runs the scripts specified for
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
  final bool? ignoreApplicationStopFailures;

  /// Indicates whether the wait period set for the termination of instances in
  /// the original environment has started. Status is 'false' if the KEEP_ALIVE
  /// option is specified. Otherwise, 'true' as soon as the termination wait
  /// period starts.
  final bool? instanceTerminationWaitTimeStarted;

  /// Information about the load balancer used in the deployment.
  final LoadBalancerInfo? loadBalancerInfo;
  final AlarmConfiguration? overrideAlarmConfiguration;

  /// Information about the application revision that was deployed to the
  /// deployment group before the most recent successful deployment.
  final RevisionLocation? previousRevision;
  final RelatedDeployments? relatedDeployments;

  /// Information about the location of stored application artifacts and the
  /// service from which to retrieve them.
  final RevisionLocation? revision;

  /// Information about a deployment rollback.
  final RollbackInfo? rollbackInfo;

  /// A timestamp that indicates when the deployment was deployed to the
  /// deployment group.
  ///
  /// In some cases, the reported value of the start time might be later than the
  /// complete time. This is due to differences in the clock settings of backend
  /// servers that participate in the deployment process.
  final DateTime? startTime;

  /// The current state of the deployment as a whole.
  final DeploymentStatus? status;

  /// Information about the instances that belong to the replacement environment
  /// in a blue/green deployment.
  final TargetInstances? targetInstances;

  /// Indicates whether only instances that are not running the latest application
  /// revision are to be deployed to.
  final bool? updateOutdatedInstancesOnly;

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
    this.overrideAlarmConfiguration,
    this.previousRevision,
    this.relatedDeployments,
    this.revision,
    this.rollbackInfo,
    this.startTime,
    this.status,
    this.targetInstances,
    this.updateOutdatedInstancesOnly,
  });

  factory DeploymentInfo.fromJson(Map<String, dynamic> json) {
    return DeploymentInfo(
      additionalDeploymentStatusInfo:
          json['additionalDeploymentStatusInfo'] as String?,
      applicationName: json['applicationName'] as String?,
      autoRollbackConfiguration: json['autoRollbackConfiguration'] != null
          ? AutoRollbackConfiguration.fromJson(
              json['autoRollbackConfiguration'] as Map<String, dynamic>)
          : null,
      blueGreenDeploymentConfiguration:
          json['blueGreenDeploymentConfiguration'] != null
              ? BlueGreenDeploymentConfiguration.fromJson(
                  json['blueGreenDeploymentConfiguration']
                      as Map<String, dynamic>)
              : null,
      completeTime: timeStampFromJson(json['completeTime']),
      computePlatform:
          (json['computePlatform'] as String?)?.toComputePlatform(),
      createTime: timeStampFromJson(json['createTime']),
      creator: (json['creator'] as String?)?.toDeploymentCreator(),
      deploymentConfigName: json['deploymentConfigName'] as String?,
      deploymentGroupName: json['deploymentGroupName'] as String?,
      deploymentId: json['deploymentId'] as String?,
      deploymentOverview: json['deploymentOverview'] != null
          ? DeploymentOverview.fromJson(
              json['deploymentOverview'] as Map<String, dynamic>)
          : null,
      deploymentStatusMessages: (json['deploymentStatusMessages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deploymentStyle: json['deploymentStyle'] != null
          ? DeploymentStyle.fromJson(
              json['deploymentStyle'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      errorInformation: json['errorInformation'] != null
          ? ErrorInformation.fromJson(
              json['errorInformation'] as Map<String, dynamic>)
          : null,
      externalId: json['externalId'] as String?,
      fileExistsBehavior:
          (json['fileExistsBehavior'] as String?)?.toFileExistsBehavior(),
      ignoreApplicationStopFailures:
          json['ignoreApplicationStopFailures'] as bool?,
      instanceTerminationWaitTimeStarted:
          json['instanceTerminationWaitTimeStarted'] as bool?,
      loadBalancerInfo: json['loadBalancerInfo'] != null
          ? LoadBalancerInfo.fromJson(
              json['loadBalancerInfo'] as Map<String, dynamic>)
          : null,
      overrideAlarmConfiguration: json['overrideAlarmConfiguration'] != null
          ? AlarmConfiguration.fromJson(
              json['overrideAlarmConfiguration'] as Map<String, dynamic>)
          : null,
      previousRevision: json['previousRevision'] != null
          ? RevisionLocation.fromJson(
              json['previousRevision'] as Map<String, dynamic>)
          : null,
      relatedDeployments: json['relatedDeployments'] != null
          ? RelatedDeployments.fromJson(
              json['relatedDeployments'] as Map<String, dynamic>)
          : null,
      revision: json['revision'] != null
          ? RevisionLocation.fromJson(json['revision'] as Map<String, dynamic>)
          : null,
      rollbackInfo: json['rollbackInfo'] != null
          ? RollbackInfo.fromJson(json['rollbackInfo'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toDeploymentStatus(),
      targetInstances: json['targetInstances'] != null
          ? TargetInstances.fromJson(
              json['targetInstances'] as Map<String, dynamic>)
          : null,
      updateOutdatedInstancesOnly: json['updateOutdatedInstancesOnly'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalDeploymentStatusInfo = this.additionalDeploymentStatusInfo;
    final applicationName = this.applicationName;
    final autoRollbackConfiguration = this.autoRollbackConfiguration;
    final blueGreenDeploymentConfiguration =
        this.blueGreenDeploymentConfiguration;
    final completeTime = this.completeTime;
    final computePlatform = this.computePlatform;
    final createTime = this.createTime;
    final creator = this.creator;
    final deploymentConfigName = this.deploymentConfigName;
    final deploymentGroupName = this.deploymentGroupName;
    final deploymentId = this.deploymentId;
    final deploymentOverview = this.deploymentOverview;
    final deploymentStatusMessages = this.deploymentStatusMessages;
    final deploymentStyle = this.deploymentStyle;
    final description = this.description;
    final errorInformation = this.errorInformation;
    final externalId = this.externalId;
    final fileExistsBehavior = this.fileExistsBehavior;
    final ignoreApplicationStopFailures = this.ignoreApplicationStopFailures;
    final instanceTerminationWaitTimeStarted =
        this.instanceTerminationWaitTimeStarted;
    final loadBalancerInfo = this.loadBalancerInfo;
    final overrideAlarmConfiguration = this.overrideAlarmConfiguration;
    final previousRevision = this.previousRevision;
    final relatedDeployments = this.relatedDeployments;
    final revision = this.revision;
    final rollbackInfo = this.rollbackInfo;
    final startTime = this.startTime;
    final status = this.status;
    final targetInstances = this.targetInstances;
    final updateOutdatedInstancesOnly = this.updateOutdatedInstancesOnly;
    return {
      if (additionalDeploymentStatusInfo != null)
        'additionalDeploymentStatusInfo': additionalDeploymentStatusInfo,
      if (applicationName != null) 'applicationName': applicationName,
      if (autoRollbackConfiguration != null)
        'autoRollbackConfiguration': autoRollbackConfiguration,
      if (blueGreenDeploymentConfiguration != null)
        'blueGreenDeploymentConfiguration': blueGreenDeploymentConfiguration,
      if (completeTime != null)
        'completeTime': unixTimestampToJson(completeTime),
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (creator != null) 'creator': creator.toValue(),
      if (deploymentConfigName != null)
        'deploymentConfigName': deploymentConfigName,
      if (deploymentGroupName != null)
        'deploymentGroupName': deploymentGroupName,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentOverview != null) 'deploymentOverview': deploymentOverview,
      if (deploymentStatusMessages != null)
        'deploymentStatusMessages': deploymentStatusMessages,
      if (deploymentStyle != null) 'deploymentStyle': deploymentStyle,
      if (description != null) 'description': description,
      if (errorInformation != null) 'errorInformation': errorInformation,
      if (externalId != null) 'externalId': externalId,
      if (fileExistsBehavior != null)
        'fileExistsBehavior': fileExistsBehavior.toValue(),
      if (ignoreApplicationStopFailures != null)
        'ignoreApplicationStopFailures': ignoreApplicationStopFailures,
      if (instanceTerminationWaitTimeStarted != null)
        'instanceTerminationWaitTimeStarted':
            instanceTerminationWaitTimeStarted,
      if (loadBalancerInfo != null) 'loadBalancerInfo': loadBalancerInfo,
      if (overrideAlarmConfiguration != null)
        'overrideAlarmConfiguration': overrideAlarmConfiguration,
      if (previousRevision != null) 'previousRevision': previousRevision,
      if (relatedDeployments != null) 'relatedDeployments': relatedDeployments,
      if (revision != null) 'revision': revision,
      if (rollbackInfo != null) 'rollbackInfo': rollbackInfo,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (targetInstances != null) 'targetInstances': targetInstances,
      if (updateOutdatedInstancesOnly != null)
        'updateOutdatedInstancesOnly': updateOutdatedInstancesOnly,
    };
  }
}

enum DeploymentOption {
  withTrafficControl,
  withoutTrafficControl,
}

extension DeploymentOptionValueExtension on DeploymentOption {
  String toValue() {
    switch (this) {
      case DeploymentOption.withTrafficControl:
        return 'WITH_TRAFFIC_CONTROL';
      case DeploymentOption.withoutTrafficControl:
        return 'WITHOUT_TRAFFIC_CONTROL';
    }
  }
}

extension DeploymentOptionFromString on String {
  DeploymentOption toDeploymentOption() {
    switch (this) {
      case 'WITH_TRAFFIC_CONTROL':
        return DeploymentOption.withTrafficControl;
      case 'WITHOUT_TRAFFIC_CONTROL':
        return DeploymentOption.withoutTrafficControl;
    }
    throw Exception('$this is not known in enum DeploymentOption');
  }
}

/// Information about the deployment status of the instances in the deployment.
class DeploymentOverview {
  /// The number of instances in the deployment in a failed state.
  final int? failed;

  /// The number of instances in which the deployment is in progress.
  final int? inProgress;

  /// The number of instances in the deployment in a pending state.
  final int? pending;

  /// The number of instances in a replacement environment ready to receive
  /// traffic in a blue/green deployment.
  final int? ready;

  /// The number of instances in the deployment in a skipped state.
  final int? skipped;

  /// The number of instances in the deployment to which revisions have been
  /// successfully deployed.
  final int? succeeded;

  DeploymentOverview({
    this.failed,
    this.inProgress,
    this.pending,
    this.ready,
    this.skipped,
    this.succeeded,
  });

  factory DeploymentOverview.fromJson(Map<String, dynamic> json) {
    return DeploymentOverview(
      failed: json['Failed'] as int?,
      inProgress: json['InProgress'] as int?,
      pending: json['Pending'] as int?,
      ready: json['Ready'] as int?,
      skipped: json['Skipped'] as int?,
      succeeded: json['Succeeded'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final inProgress = this.inProgress;
    final pending = this.pending;
    final ready = this.ready;
    final skipped = this.skipped;
    final succeeded = this.succeeded;
    return {
      if (failed != null) 'Failed': failed,
      if (inProgress != null) 'InProgress': inProgress,
      if (pending != null) 'Pending': pending,
      if (ready != null) 'Ready': ready,
      if (skipped != null) 'Skipped': skipped,
      if (succeeded != null) 'Succeeded': succeeded,
    };
  }
}

enum DeploymentReadyAction {
  continueDeployment,
  stopDeployment,
}

extension DeploymentReadyActionValueExtension on DeploymentReadyAction {
  String toValue() {
    switch (this) {
      case DeploymentReadyAction.continueDeployment:
        return 'CONTINUE_DEPLOYMENT';
      case DeploymentReadyAction.stopDeployment:
        return 'STOP_DEPLOYMENT';
    }
  }
}

extension DeploymentReadyActionFromString on String {
  DeploymentReadyAction toDeploymentReadyAction() {
    switch (this) {
      case 'CONTINUE_DEPLOYMENT':
        return DeploymentReadyAction.continueDeployment;
      case 'STOP_DEPLOYMENT':
        return DeploymentReadyAction.stopDeployment;
    }
    throw Exception('$this is not known in enum DeploymentReadyAction');
  }
}

/// Information about how traffic is rerouted to instances in a replacement
/// environment in a blue/green deployment.
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
  final DeploymentReadyAction? actionOnTimeout;

  /// The number of minutes to wait before the status of a blue/green deployment
  /// is changed to Stopped if rerouting is not started manually. Applies only to
  /// the <code>STOP_DEPLOYMENT</code> option for <code>actionOnTimeout</code>.
  final int? waitTimeInMinutes;

  DeploymentReadyOption({
    this.actionOnTimeout,
    this.waitTimeInMinutes,
  });

  factory DeploymentReadyOption.fromJson(Map<String, dynamic> json) {
    return DeploymentReadyOption(
      actionOnTimeout:
          (json['actionOnTimeout'] as String?)?.toDeploymentReadyAction(),
      waitTimeInMinutes: json['waitTimeInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionOnTimeout = this.actionOnTimeout;
    final waitTimeInMinutes = this.waitTimeInMinutes;
    return {
      if (actionOnTimeout != null) 'actionOnTimeout': actionOnTimeout.toValue(),
      if (waitTimeInMinutes != null) 'waitTimeInMinutes': waitTimeInMinutes,
    };
  }
}

enum DeploymentStatus {
  created,
  queued,
  inProgress,
  baking,
  succeeded,
  failed,
  stopped,
  ready,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
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
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'Created':
        return DeploymentStatus.created;
      case 'Queued':
        return DeploymentStatus.queued;
      case 'InProgress':
        return DeploymentStatus.inProgress;
      case 'Baking':
        return DeploymentStatus.baking;
      case 'Succeeded':
        return DeploymentStatus.succeeded;
      case 'Failed':
        return DeploymentStatus.failed;
      case 'Stopped':
        return DeploymentStatus.stopped;
      case 'Ready':
        return DeploymentStatus.ready;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

/// Information about the type of deployment, either in-place or blue/green, you
/// want to run and whether to route deployment traffic behind a load balancer.
class DeploymentStyle {
  /// Indicates whether to route deployment traffic behind a load balancer.
  final DeploymentOption? deploymentOption;

  /// Indicates whether to run an in-place deployment or a blue/green deployment.
  final DeploymentType? deploymentType;

  DeploymentStyle({
    this.deploymentOption,
    this.deploymentType,
  });

  factory DeploymentStyle.fromJson(Map<String, dynamic> json) {
    return DeploymentStyle(
      deploymentOption:
          (json['deploymentOption'] as String?)?.toDeploymentOption(),
      deploymentType: (json['deploymentType'] as String?)?.toDeploymentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentOption = this.deploymentOption;
    final deploymentType = this.deploymentType;
    return {
      if (deploymentOption != null)
        'deploymentOption': deploymentOption.toValue(),
      if (deploymentType != null) 'deploymentType': deploymentType.toValue(),
    };
  }
}

/// Information about the deployment target.
class DeploymentTarget {
  final CloudFormationTarget? cloudFormationTarget;

  /// The deployment type that is specific to the deployment's compute platform or
  /// deployments initiated by a CloudFormation stack update.
  final DeploymentTargetType? deploymentTargetType;

  /// Information about the target for a deployment that uses the Amazon ECS
  /// compute platform.
  final ECSTarget? ecsTarget;

  /// Information about the target for a deployment that uses the EC2/On-premises
  /// compute platform.
  final InstanceTarget? instanceTarget;

  /// Information about the target for a deployment that uses the Lambda compute
  /// platform.
  final LambdaTarget? lambdaTarget;

  DeploymentTarget({
    this.cloudFormationTarget,
    this.deploymentTargetType,
    this.ecsTarget,
    this.instanceTarget,
    this.lambdaTarget,
  });

  factory DeploymentTarget.fromJson(Map<String, dynamic> json) {
    return DeploymentTarget(
      cloudFormationTarget: json['cloudFormationTarget'] != null
          ? CloudFormationTarget.fromJson(
              json['cloudFormationTarget'] as Map<String, dynamic>)
          : null,
      deploymentTargetType:
          (json['deploymentTargetType'] as String?)?.toDeploymentTargetType(),
      ecsTarget: json['ecsTarget'] != null
          ? ECSTarget.fromJson(json['ecsTarget'] as Map<String, dynamic>)
          : null,
      instanceTarget: json['instanceTarget'] != null
          ? InstanceTarget.fromJson(
              json['instanceTarget'] as Map<String, dynamic>)
          : null,
      lambdaTarget: json['lambdaTarget'] != null
          ? LambdaTarget.fromJson(json['lambdaTarget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormationTarget = this.cloudFormationTarget;
    final deploymentTargetType = this.deploymentTargetType;
    final ecsTarget = this.ecsTarget;
    final instanceTarget = this.instanceTarget;
    final lambdaTarget = this.lambdaTarget;
    return {
      if (cloudFormationTarget != null)
        'cloudFormationTarget': cloudFormationTarget,
      if (deploymentTargetType != null)
        'deploymentTargetType': deploymentTargetType.toValue(),
      if (ecsTarget != null) 'ecsTarget': ecsTarget,
      if (instanceTarget != null) 'instanceTarget': instanceTarget,
      if (lambdaTarget != null) 'lambdaTarget': lambdaTarget,
    };
  }
}

enum DeploymentTargetType {
  instanceTarget,
  lambdaTarget,
  eCSTarget,
  cloudFormationTarget,
}

extension DeploymentTargetTypeValueExtension on DeploymentTargetType {
  String toValue() {
    switch (this) {
      case DeploymentTargetType.instanceTarget:
        return 'InstanceTarget';
      case DeploymentTargetType.lambdaTarget:
        return 'LambdaTarget';
      case DeploymentTargetType.eCSTarget:
        return 'ECSTarget';
      case DeploymentTargetType.cloudFormationTarget:
        return 'CloudFormationTarget';
    }
  }
}

extension DeploymentTargetTypeFromString on String {
  DeploymentTargetType toDeploymentTargetType() {
    switch (this) {
      case 'InstanceTarget':
        return DeploymentTargetType.instanceTarget;
      case 'LambdaTarget':
        return DeploymentTargetType.lambdaTarget;
      case 'ECSTarget':
        return DeploymentTargetType.eCSTarget;
      case 'CloudFormationTarget':
        return DeploymentTargetType.cloudFormationTarget;
    }
    throw Exception('$this is not known in enum DeploymentTargetType');
  }
}

enum DeploymentType {
  inPlace,
  blueGreen,
}

extension DeploymentTypeValueExtension on DeploymentType {
  String toValue() {
    switch (this) {
      case DeploymentType.inPlace:
        return 'IN_PLACE';
      case DeploymentType.blueGreen:
        return 'BLUE_GREEN';
    }
  }
}

extension DeploymentTypeFromString on String {
  DeploymentType toDeploymentType() {
    switch (this) {
      case 'IN_PLACE':
        return DeploymentType.inPlace;
      case 'BLUE_GREEN':
        return DeploymentType.blueGreen;
    }
    throw Exception('$this is not known in enum DeploymentType');
  }
}

enum DeploymentWaitType {
  readyWait,
  terminationWait,
}

extension DeploymentWaitTypeValueExtension on DeploymentWaitType {
  String toValue() {
    switch (this) {
      case DeploymentWaitType.readyWait:
        return 'READY_WAIT';
      case DeploymentWaitType.terminationWait:
        return 'TERMINATION_WAIT';
    }
  }
}

extension DeploymentWaitTypeFromString on String {
  DeploymentWaitType toDeploymentWaitType() {
    switch (this) {
      case 'READY_WAIT':
        return DeploymentWaitType.readyWait;
      case 'TERMINATION_WAIT':
        return DeploymentWaitType.terminationWait;
    }
    throw Exception('$this is not known in enum DeploymentWaitType');
  }
}

/// Diagnostic information about executable scripts that are part of a
/// deployment.
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
  final LifecycleErrorCode? errorCode;

  /// The last portion of the diagnostic log.
  ///
  /// If available, CodeDeploy returns up to the last 4 KB of the diagnostic log.
  final String? logTail;

  /// The message associated with the error.
  final String? message;

  /// The name of the script.
  final String? scriptName;

  Diagnostics({
    this.errorCode,
    this.logTail,
    this.message,
    this.scriptName,
  });

  factory Diagnostics.fromJson(Map<String, dynamic> json) {
    return Diagnostics(
      errorCode: (json['errorCode'] as String?)?.toLifecycleErrorCode(),
      logTail: json['logTail'] as String?,
      message: json['message'] as String?,
      scriptName: json['scriptName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final logTail = this.logTail;
    final message = this.message;
    final scriptName = this.scriptName;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (logTail != null) 'logTail': logTail,
      if (message != null) 'message': message,
      if (scriptName != null) 'scriptName': scriptName,
    };
  }
}

/// Information about an EC2 tag filter.
class EC2TagFilter {
  /// The tag filter key.
  final String? key;

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
  final EC2TagFilterType? type;

  /// The tag filter value.
  final String? value;

  EC2TagFilter({
    this.key,
    this.type,
    this.value,
  });

  factory EC2TagFilter.fromJson(Map<String, dynamic> json) {
    return EC2TagFilter(
      key: json['Key'] as String?,
      type: (json['Type'] as String?)?.toEC2TagFilterType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (type != null) 'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum EC2TagFilterType {
  keyOnly,
  valueOnly,
  keyAndValue,
}

extension EC2TagFilterTypeValueExtension on EC2TagFilterType {
  String toValue() {
    switch (this) {
      case EC2TagFilterType.keyOnly:
        return 'KEY_ONLY';
      case EC2TagFilterType.valueOnly:
        return 'VALUE_ONLY';
      case EC2TagFilterType.keyAndValue:
        return 'KEY_AND_VALUE';
    }
  }
}

extension EC2TagFilterTypeFromString on String {
  EC2TagFilterType toEC2TagFilterType() {
    switch (this) {
      case 'KEY_ONLY':
        return EC2TagFilterType.keyOnly;
      case 'VALUE_ONLY':
        return EC2TagFilterType.valueOnly;
      case 'KEY_AND_VALUE':
        return EC2TagFilterType.keyAndValue;
    }
    throw Exception('$this is not known in enum EC2TagFilterType');
  }
}

/// Information about groups of Amazon EC2 instance tags.
class EC2TagSet {
  /// A list that contains other lists of Amazon EC2 instance tag groups. For an
  /// instance to be included in the deployment group, it must be identified by
  /// all of the tag groups in the list.
  final List<List<EC2TagFilter>>? ec2TagSetList;

  EC2TagSet({
    this.ec2TagSetList,
  });

  factory EC2TagSet.fromJson(Map<String, dynamic> json) {
    return EC2TagSet(
      ec2TagSetList: (json['ec2TagSetList'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => EC2TagFilter.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2TagSetList = this.ec2TagSetList;
    return {
      if (ec2TagSetList != null) 'ec2TagSetList': ec2TagSetList,
    };
  }
}

/// Contains the service and cluster names used to identify an Amazon ECS
/// deployment's target.
class ECSService {
  /// The name of the cluster that the Amazon ECS service is associated with.
  final String? clusterName;

  /// The name of the target Amazon ECS service.
  final String? serviceName;

  ECSService({
    this.clusterName,
    this.serviceName,
  });

  factory ECSService.fromJson(Map<String, dynamic> json) {
    return ECSService(
      clusterName: json['clusterName'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final serviceName = this.serviceName;
    return {
      if (clusterName != null) 'clusterName': clusterName,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// Information about the target of an Amazon ECS deployment.
class ECSTarget {
  /// The unique ID of a deployment.
  final String? deploymentId;

  /// The date and time when the target Amazon ECS application was updated by a
  /// deployment.
  final DateTime? lastUpdatedAt;

  /// The lifecycle events of the deployment to this target Amazon ECS
  /// application.
  final List<LifecycleEvent>? lifecycleEvents;

  /// The status an Amazon ECS deployment's target ECS application.
  final TargetStatus? status;

  /// The Amazon Resource Name (ARN) of the target.
  final String? targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>ecsTarget</code>.
  final String? targetId;

  /// The <code>ECSTaskSet</code> objects associated with the ECS target.
  final List<ECSTaskSet>? taskSetsInfo;

  ECSTarget({
    this.deploymentId,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
    this.taskSetsInfo,
  });

  factory ECSTarget.fromJson(Map<String, dynamic> json) {
    return ECSTarget(
      deploymentId: json['deploymentId'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleEvents: (json['lifecycleEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toTargetStatus(),
      targetArn: json['targetArn'] as String?,
      targetId: json['targetId'] as String?,
      taskSetsInfo: (json['taskSetsInfo'] as List?)
          ?.whereNotNull()
          .map((e) => ECSTaskSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleEvents = this.lifecycleEvents;
    final status = this.status;
    final targetArn = this.targetArn;
    final targetId = this.targetId;
    final taskSetsInfo = this.taskSetsInfo;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lifecycleEvents != null) 'lifecycleEvents': lifecycleEvents,
      if (status != null) 'status': status.toValue(),
      if (targetArn != null) 'targetArn': targetArn,
      if (targetId != null) 'targetId': targetId,
      if (taskSetsInfo != null) 'taskSetsInfo': taskSetsInfo,
    };
  }
}

/// Information about a set of Amazon ECS tasks in an CodeDeploy deployment. An
/// Amazon ECS task set includes details such as the desired number of tasks,
/// how many tasks are running, and whether the task set serves production
/// traffic. An CodeDeploy application that uses the Amazon ECS compute platform
/// deploys a containerized application in an Amazon ECS service as a task set.
class ECSTaskSet {
  /// The number of tasks in a task set. During a deployment that uses the Amazon
  /// ECS compute type, CodeDeploy instructs Amazon ECS to create a new task set
  /// and uses this value to determine how many tasks to create. After the updated
  /// task set is created, CodeDeploy shifts traffic to the new task set.
  final int? desiredCount;

  /// A unique ID of an <code>ECSTaskSet</code>.
  final String? identifer;

  /// The number of tasks in the task set that are in the <code>PENDING</code>
  /// status during an Amazon ECS deployment. A task in the <code>PENDING</code>
  /// state is preparing to enter the <code>RUNNING</code> state. A task set
  /// enters the <code>PENDING</code> status when it launches for the first time,
  /// or when it is restarted after being in the <code>STOPPED</code> state.
  final int? pendingCount;

  /// The number of tasks in the task set that are in the <code>RUNNING</code>
  /// status during an Amazon ECS deployment. A task in the <code>RUNNING</code>
  /// state is running and ready for use.
  final int? runningCount;

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
  final String? status;

  /// The target group associated with the task set. The target group is used by
  /// CodeDeploy to manage traffic to a task set.
  final TargetGroupInfo? targetGroup;

  /// A label that identifies whether the ECS task set is an original target
  /// (<code>BLUE</code>) or a replacement target (<code>GREEN</code>).
  final TargetLabel? taskSetLabel;

  /// The percentage of traffic served by this task set.
  final double? trafficWeight;

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

  factory ECSTaskSet.fromJson(Map<String, dynamic> json) {
    return ECSTaskSet(
      desiredCount: json['desiredCount'] as int?,
      identifer: json['identifer'] as String?,
      pendingCount: json['pendingCount'] as int?,
      runningCount: json['runningCount'] as int?,
      status: json['status'] as String?,
      targetGroup: json['targetGroup'] != null
          ? TargetGroupInfo.fromJson(
              json['targetGroup'] as Map<String, dynamic>)
          : null,
      taskSetLabel: (json['taskSetLabel'] as String?)?.toTargetLabel(),
      trafficWeight: json['trafficWeight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredCount = this.desiredCount;
    final identifer = this.identifer;
    final pendingCount = this.pendingCount;
    final runningCount = this.runningCount;
    final status = this.status;
    final targetGroup = this.targetGroup;
    final taskSetLabel = this.taskSetLabel;
    final trafficWeight = this.trafficWeight;
    return {
      if (desiredCount != null) 'desiredCount': desiredCount,
      if (identifer != null) 'identifer': identifer,
      if (pendingCount != null) 'pendingCount': pendingCount,
      if (runningCount != null) 'runningCount': runningCount,
      if (status != null) 'status': status,
      if (targetGroup != null) 'targetGroup': targetGroup,
      if (taskSetLabel != null) 'taskSetLabel': taskSetLabel.toValue(),
      if (trafficWeight != null) 'trafficWeight': trafficWeight,
    };
  }
}

/// Information about a Classic Load Balancer in Elastic Load Balancing to use
/// in a deployment. Instances are registered directly with a load balancer, and
/// traffic is routed to the load balancer.
class ELBInfo {
  /// For blue/green deployments, the name of the Classic Load Balancer that is
  /// used to route traffic from original instances to replacement instances in a
  /// blue/green deployment. For in-place deployments, the name of the Classic
  /// Load Balancer that instances are deregistered from so they are not serving
  /// traffic during a deployment, and then re-registered with after the
  /// deployment is complete.
  final String? name;

  ELBInfo({
    this.name,
  });

  factory ELBInfo.fromJson(Map<String, dynamic> json) {
    return ELBInfo(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

enum ErrorCode {
  agentIssue,
  alarmActive,
  applicationMissing,
  autoscalingValidationError,
  autoScalingConfiguration,
  autoScalingIamRolePermissions,
  codedeployResourceCannotBeFound,
  customerApplicationUnhealthy,
  deploymentGroupMissing,
  ecsUpdateError,
  elasticLoadBalancingInvalid,
  elbInvalidInstance,
  healthConstraints,
  healthConstraintsInvalid,
  hookExecutionFailure,
  iamRoleMissing,
  iamRolePermissions,
  internalError,
  invalidEcsService,
  invalidLambdaConfiguration,
  invalidLambdaFunction,
  invalidRevision,
  manualStop,
  missingBlueGreenDeploymentConfiguration,
  missingElbInformation,
  missingGithubToken,
  noEc2Subscription,
  noInstances,
  overMaxInstances,
  resourceLimitExceeded,
  revisionMissing,
  throttled,
  timeout,
  cloudformationStackFailure,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.agentIssue:
        return 'AGENT_ISSUE';
      case ErrorCode.alarmActive:
        return 'ALARM_ACTIVE';
      case ErrorCode.applicationMissing:
        return 'APPLICATION_MISSING';
      case ErrorCode.autoscalingValidationError:
        return 'AUTOSCALING_VALIDATION_ERROR';
      case ErrorCode.autoScalingConfiguration:
        return 'AUTO_SCALING_CONFIGURATION';
      case ErrorCode.autoScalingIamRolePermissions:
        return 'AUTO_SCALING_IAM_ROLE_PERMISSIONS';
      case ErrorCode.codedeployResourceCannotBeFound:
        return 'CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND';
      case ErrorCode.customerApplicationUnhealthy:
        return 'CUSTOMER_APPLICATION_UNHEALTHY';
      case ErrorCode.deploymentGroupMissing:
        return 'DEPLOYMENT_GROUP_MISSING';
      case ErrorCode.ecsUpdateError:
        return 'ECS_UPDATE_ERROR';
      case ErrorCode.elasticLoadBalancingInvalid:
        return 'ELASTIC_LOAD_BALANCING_INVALID';
      case ErrorCode.elbInvalidInstance:
        return 'ELB_INVALID_INSTANCE';
      case ErrorCode.healthConstraints:
        return 'HEALTH_CONSTRAINTS';
      case ErrorCode.healthConstraintsInvalid:
        return 'HEALTH_CONSTRAINTS_INVALID';
      case ErrorCode.hookExecutionFailure:
        return 'HOOK_EXECUTION_FAILURE';
      case ErrorCode.iamRoleMissing:
        return 'IAM_ROLE_MISSING';
      case ErrorCode.iamRolePermissions:
        return 'IAM_ROLE_PERMISSIONS';
      case ErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case ErrorCode.invalidEcsService:
        return 'INVALID_ECS_SERVICE';
      case ErrorCode.invalidLambdaConfiguration:
        return 'INVALID_LAMBDA_CONFIGURATION';
      case ErrorCode.invalidLambdaFunction:
        return 'INVALID_LAMBDA_FUNCTION';
      case ErrorCode.invalidRevision:
        return 'INVALID_REVISION';
      case ErrorCode.manualStop:
        return 'MANUAL_STOP';
      case ErrorCode.missingBlueGreenDeploymentConfiguration:
        return 'MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION';
      case ErrorCode.missingElbInformation:
        return 'MISSING_ELB_INFORMATION';
      case ErrorCode.missingGithubToken:
        return 'MISSING_GITHUB_TOKEN';
      case ErrorCode.noEc2Subscription:
        return 'NO_EC2_SUBSCRIPTION';
      case ErrorCode.noInstances:
        return 'NO_INSTANCES';
      case ErrorCode.overMaxInstances:
        return 'OVER_MAX_INSTANCES';
      case ErrorCode.resourceLimitExceeded:
        return 'RESOURCE_LIMIT_EXCEEDED';
      case ErrorCode.revisionMissing:
        return 'REVISION_MISSING';
      case ErrorCode.throttled:
        return 'THROTTLED';
      case ErrorCode.timeout:
        return 'TIMEOUT';
      case ErrorCode.cloudformationStackFailure:
        return 'CLOUDFORMATION_STACK_FAILURE';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'AGENT_ISSUE':
        return ErrorCode.agentIssue;
      case 'ALARM_ACTIVE':
        return ErrorCode.alarmActive;
      case 'APPLICATION_MISSING':
        return ErrorCode.applicationMissing;
      case 'AUTOSCALING_VALIDATION_ERROR':
        return ErrorCode.autoscalingValidationError;
      case 'AUTO_SCALING_CONFIGURATION':
        return ErrorCode.autoScalingConfiguration;
      case 'AUTO_SCALING_IAM_ROLE_PERMISSIONS':
        return ErrorCode.autoScalingIamRolePermissions;
      case 'CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND':
        return ErrorCode.codedeployResourceCannotBeFound;
      case 'CUSTOMER_APPLICATION_UNHEALTHY':
        return ErrorCode.customerApplicationUnhealthy;
      case 'DEPLOYMENT_GROUP_MISSING':
        return ErrorCode.deploymentGroupMissing;
      case 'ECS_UPDATE_ERROR':
        return ErrorCode.ecsUpdateError;
      case 'ELASTIC_LOAD_BALANCING_INVALID':
        return ErrorCode.elasticLoadBalancingInvalid;
      case 'ELB_INVALID_INSTANCE':
        return ErrorCode.elbInvalidInstance;
      case 'HEALTH_CONSTRAINTS':
        return ErrorCode.healthConstraints;
      case 'HEALTH_CONSTRAINTS_INVALID':
        return ErrorCode.healthConstraintsInvalid;
      case 'HOOK_EXECUTION_FAILURE':
        return ErrorCode.hookExecutionFailure;
      case 'IAM_ROLE_MISSING':
        return ErrorCode.iamRoleMissing;
      case 'IAM_ROLE_PERMISSIONS':
        return ErrorCode.iamRolePermissions;
      case 'INTERNAL_ERROR':
        return ErrorCode.internalError;
      case 'INVALID_ECS_SERVICE':
        return ErrorCode.invalidEcsService;
      case 'INVALID_LAMBDA_CONFIGURATION':
        return ErrorCode.invalidLambdaConfiguration;
      case 'INVALID_LAMBDA_FUNCTION':
        return ErrorCode.invalidLambdaFunction;
      case 'INVALID_REVISION':
        return ErrorCode.invalidRevision;
      case 'MANUAL_STOP':
        return ErrorCode.manualStop;
      case 'MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION':
        return ErrorCode.missingBlueGreenDeploymentConfiguration;
      case 'MISSING_ELB_INFORMATION':
        return ErrorCode.missingElbInformation;
      case 'MISSING_GITHUB_TOKEN':
        return ErrorCode.missingGithubToken;
      case 'NO_EC2_SUBSCRIPTION':
        return ErrorCode.noEc2Subscription;
      case 'NO_INSTANCES':
        return ErrorCode.noInstances;
      case 'OVER_MAX_INSTANCES':
        return ErrorCode.overMaxInstances;
      case 'RESOURCE_LIMIT_EXCEEDED':
        return ErrorCode.resourceLimitExceeded;
      case 'REVISION_MISSING':
        return ErrorCode.revisionMissing;
      case 'THROTTLED':
        return ErrorCode.throttled;
      case 'TIMEOUT':
        return ErrorCode.timeout;
      case 'CLOUDFORMATION_STACK_FAILURE':
        return ErrorCode.cloudformationStackFailure;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Information about a deployment error.
class ErrorInformation {
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/error-codes.html">Error
  /// Codes for CodeDeploy</a> in the <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide">CodeDeploy
  /// User Guide</a>.
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
  /// the throttling limits of one or more Amazon Web Services services.
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
  final ErrorCode? code;

  /// An accompanying error message.
  final String? message;

  ErrorInformation({
    this.code,
    this.message,
  });

  factory ErrorInformation.fromJson(Map<String, dynamic> json) {
    return ErrorInformation(
      code: (json['code'] as String?)?.toErrorCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum FileExistsBehavior {
  disallow,
  overwrite,
  retain,
}

extension FileExistsBehaviorValueExtension on FileExistsBehavior {
  String toValue() {
    switch (this) {
      case FileExistsBehavior.disallow:
        return 'DISALLOW';
      case FileExistsBehavior.overwrite:
        return 'OVERWRITE';
      case FileExistsBehavior.retain:
        return 'RETAIN';
    }
  }
}

extension FileExistsBehaviorFromString on String {
  FileExistsBehavior toFileExistsBehavior() {
    switch (this) {
      case 'DISALLOW':
        return FileExistsBehavior.disallow;
      case 'OVERWRITE':
        return FileExistsBehavior.overwrite;
      case 'RETAIN':
        return FileExistsBehavior.retain;
    }
    throw Exception('$this is not known in enum FileExistsBehavior');
  }
}

/// Information about an application revision.
class GenericRevisionInfo {
  /// The deployment groups for which this is the current target revision.
  final List<String>? deploymentGroups;

  /// A comment about the revision.
  final String? description;

  /// When the revision was first used by CodeDeploy.
  final DateTime? firstUsedTime;

  /// When the revision was last used by CodeDeploy.
  final DateTime? lastUsedTime;

  /// When the revision was registered with CodeDeploy.
  final DateTime? registerTime;

  GenericRevisionInfo({
    this.deploymentGroups,
    this.description,
    this.firstUsedTime,
    this.lastUsedTime,
    this.registerTime,
  });

  factory GenericRevisionInfo.fromJson(Map<String, dynamic> json) {
    return GenericRevisionInfo(
      deploymentGroups: (json['deploymentGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      firstUsedTime: timeStampFromJson(json['firstUsedTime']),
      lastUsedTime: timeStampFromJson(json['lastUsedTime']),
      registerTime: timeStampFromJson(json['registerTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentGroups = this.deploymentGroups;
    final description = this.description;
    final firstUsedTime = this.firstUsedTime;
    final lastUsedTime = this.lastUsedTime;
    final registerTime = this.registerTime;
    return {
      if (deploymentGroups != null) 'deploymentGroups': deploymentGroups,
      if (description != null) 'description': description,
      if (firstUsedTime != null)
        'firstUsedTime': unixTimestampToJson(firstUsedTime),
      if (lastUsedTime != null)
        'lastUsedTime': unixTimestampToJson(lastUsedTime),
      if (registerTime != null)
        'registerTime': unixTimestampToJson(registerTime),
    };
  }
}

/// Represents the output of a <code>GetApplication</code> operation.
class GetApplicationOutput {
  /// Information about the application.
  final ApplicationInfo? application;

  GetApplicationOutput({
    this.application,
  });

  factory GetApplicationOutput.fromJson(Map<String, dynamic> json) {
    return GetApplicationOutput(
      application: json['application'] != null
          ? ApplicationInfo.fromJson(
              json['application'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      if (application != null) 'application': application,
    };
  }
}

/// Represents the output of a <code>GetApplicationRevision</code> operation.
class GetApplicationRevisionOutput {
  /// The name of the application that corresponds to the revision.
  final String? applicationName;

  /// Additional information about the revision, including type and location.
  final RevisionLocation? revision;

  /// General information about the revision.
  final GenericRevisionInfo? revisionInfo;

  GetApplicationRevisionOutput({
    this.applicationName,
    this.revision,
    this.revisionInfo,
  });

  factory GetApplicationRevisionOutput.fromJson(Map<String, dynamic> json) {
    return GetApplicationRevisionOutput(
      applicationName: json['applicationName'] as String?,
      revision: json['revision'] != null
          ? RevisionLocation.fromJson(json['revision'] as Map<String, dynamic>)
          : null,
      revisionInfo: json['revisionInfo'] != null
          ? GenericRevisionInfo.fromJson(
              json['revisionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final revision = this.revision;
    final revisionInfo = this.revisionInfo;
    return {
      if (applicationName != null) 'applicationName': applicationName,
      if (revision != null) 'revision': revision,
      if (revisionInfo != null) 'revisionInfo': revisionInfo,
    };
  }
}

/// Represents the output of a <code>GetDeploymentConfig</code> operation.
class GetDeploymentConfigOutput {
  /// Information about the deployment configuration.
  final DeploymentConfigInfo? deploymentConfigInfo;

  GetDeploymentConfigOutput({
    this.deploymentConfigInfo,
  });

  factory GetDeploymentConfigOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentConfigOutput(
      deploymentConfigInfo: json['deploymentConfigInfo'] != null
          ? DeploymentConfigInfo.fromJson(
              json['deploymentConfigInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentConfigInfo = this.deploymentConfigInfo;
    return {
      if (deploymentConfigInfo != null)
        'deploymentConfigInfo': deploymentConfigInfo,
    };
  }
}

/// Represents the output of a <code>GetDeploymentGroup</code> operation.
class GetDeploymentGroupOutput {
  /// Information about the deployment group.
  final DeploymentGroupInfo? deploymentGroupInfo;

  GetDeploymentGroupOutput({
    this.deploymentGroupInfo,
  });

  factory GetDeploymentGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentGroupOutput(
      deploymentGroupInfo: json['deploymentGroupInfo'] != null
          ? DeploymentGroupInfo.fromJson(
              json['deploymentGroupInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentGroupInfo = this.deploymentGroupInfo;
    return {
      if (deploymentGroupInfo != null)
        'deploymentGroupInfo': deploymentGroupInfo,
    };
  }
}

/// Represents the output of a <code>GetDeploymentInstance</code> operation.
class GetDeploymentInstanceOutput {
  /// Information about the instance.
  final InstanceSummary? instanceSummary;

  GetDeploymentInstanceOutput({
    this.instanceSummary,
  });

  factory GetDeploymentInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentInstanceOutput(
      instanceSummary: json['instanceSummary'] != null
          ? InstanceSummary.fromJson(
              json['instanceSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceSummary = this.instanceSummary;
    return {
      if (instanceSummary != null) 'instanceSummary': instanceSummary,
    };
  }
}

/// Represents the output of a <code>GetDeployment</code> operation.
class GetDeploymentOutput {
  /// Information about the deployment.
  final DeploymentInfo? deploymentInfo;

  GetDeploymentOutput({
    this.deploymentInfo,
  });

  factory GetDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentOutput(
      deploymentInfo: json['deploymentInfo'] != null
          ? DeploymentInfo.fromJson(
              json['deploymentInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentInfo = this.deploymentInfo;
    return {
      if (deploymentInfo != null) 'deploymentInfo': deploymentInfo,
    };
  }
}

class GetDeploymentTargetOutput {
  /// A deployment target that contains information about a deployment such as its
  /// status, lifecycle events, and when it was last updated. It also contains
  /// metadata about the deployment target. The deployment target metadata depends
  /// on the deployment target's type (<code>instanceTarget</code>,
  /// <code>lambdaTarget</code>, or <code>ecsTarget</code>).
  final DeploymentTarget? deploymentTarget;

  GetDeploymentTargetOutput({
    this.deploymentTarget,
  });

  factory GetDeploymentTargetOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentTargetOutput(
      deploymentTarget: json['deploymentTarget'] != null
          ? DeploymentTarget.fromJson(
              json['deploymentTarget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentTarget = this.deploymentTarget;
    return {
      if (deploymentTarget != null) 'deploymentTarget': deploymentTarget,
    };
  }
}

/// Represents the output of a <code>GetOnPremisesInstance</code> operation.
class GetOnPremisesInstanceOutput {
  /// Information about the on-premises instance.
  final InstanceInfo? instanceInfo;

  GetOnPremisesInstanceOutput({
    this.instanceInfo,
  });

  factory GetOnPremisesInstanceOutput.fromJson(Map<String, dynamic> json) {
    return GetOnPremisesInstanceOutput(
      instanceInfo: json['instanceInfo'] != null
          ? InstanceInfo.fromJson(json['instanceInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceInfo = this.instanceInfo;
    return {
      if (instanceInfo != null) 'instanceInfo': instanceInfo,
    };
  }
}

/// Information about the location of application artifacts stored in GitHub.
class GitHubLocation {
  /// The SHA1 commit ID of the GitHub commit that represents the bundled
  /// artifacts for the application revision.
  final String? commitId;

  /// The GitHub account and repository pair that stores a reference to the commit
  /// that represents the bundled artifacts for the application revision.
  ///
  /// Specified as account/repository.
  final String? repository;

  GitHubLocation({
    this.commitId,
    this.repository,
  });

  factory GitHubLocation.fromJson(Map<String, dynamic> json) {
    return GitHubLocation(
      commitId: json['commitId'] as String?,
      repository: json['repository'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitId = this.commitId;
    final repository = this.repository;
    return {
      if (commitId != null) 'commitId': commitId,
      if (repository != null) 'repository': repository,
    };
  }
}

enum GreenFleetProvisioningAction {
  discoverExisting,
  copyAutoScalingGroup,
}

extension GreenFleetProvisioningActionValueExtension
    on GreenFleetProvisioningAction {
  String toValue() {
    switch (this) {
      case GreenFleetProvisioningAction.discoverExisting:
        return 'DISCOVER_EXISTING';
      case GreenFleetProvisioningAction.copyAutoScalingGroup:
        return 'COPY_AUTO_SCALING_GROUP';
    }
  }
}

extension GreenFleetProvisioningActionFromString on String {
  GreenFleetProvisioningAction toGreenFleetProvisioningAction() {
    switch (this) {
      case 'DISCOVER_EXISTING':
        return GreenFleetProvisioningAction.discoverExisting;
      case 'COPY_AUTO_SCALING_GROUP':
        return GreenFleetProvisioningAction.copyAutoScalingGroup;
    }
    throw Exception('$this is not known in enum GreenFleetProvisioningAction');
  }
}

/// Information about the instances that belong to the replacement environment
/// in a blue/green deployment.
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
  final GreenFleetProvisioningAction? action;

  GreenFleetProvisioningOption({
    this.action,
  });

  factory GreenFleetProvisioningOption.fromJson(Map<String, dynamic> json) {
    return GreenFleetProvisioningOption(
      action: (json['action'] as String?)?.toGreenFleetProvisioningAction(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'action': action.toValue(),
    };
  }
}

enum InstanceAction {
  terminate,
  keepAlive,
}

extension InstanceActionValueExtension on InstanceAction {
  String toValue() {
    switch (this) {
      case InstanceAction.terminate:
        return 'TERMINATE';
      case InstanceAction.keepAlive:
        return 'KEEP_ALIVE';
    }
  }
}

extension InstanceActionFromString on String {
  InstanceAction toInstanceAction() {
    switch (this) {
      case 'TERMINATE':
        return InstanceAction.terminate;
      case 'KEEP_ALIVE':
        return InstanceAction.keepAlive;
    }
    throw Exception('$this is not known in enum InstanceAction');
  }
}

/// Information about an on-premises instance.
class InstanceInfo {
  /// If the on-premises instance was deregistered, the time at which the
  /// on-premises instance was deregistered.
  final DateTime? deregisterTime;

  /// The ARN of the IAM session associated with the on-premises instance.
  final String? iamSessionArn;

  /// The user ARN associated with the on-premises instance.
  final String? iamUserArn;

  /// The ARN of the on-premises instance.
  final String? instanceArn;

  /// The name of the on-premises instance.
  final String? instanceName;

  /// The time at which the on-premises instance was registered.
  final DateTime? registerTime;

  /// The tags currently associated with the on-premises instance.
  final List<Tag>? tags;

  InstanceInfo({
    this.deregisterTime,
    this.iamSessionArn,
    this.iamUserArn,
    this.instanceArn,
    this.instanceName,
    this.registerTime,
    this.tags,
  });

  factory InstanceInfo.fromJson(Map<String, dynamic> json) {
    return InstanceInfo(
      deregisterTime: timeStampFromJson(json['deregisterTime']),
      iamSessionArn: json['iamSessionArn'] as String?,
      iamUserArn: json['iamUserArn'] as String?,
      instanceArn: json['instanceArn'] as String?,
      instanceName: json['instanceName'] as String?,
      registerTime: timeStampFromJson(json['registerTime']),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deregisterTime = this.deregisterTime;
    final iamSessionArn = this.iamSessionArn;
    final iamUserArn = this.iamUserArn;
    final instanceArn = this.instanceArn;
    final instanceName = this.instanceName;
    final registerTime = this.registerTime;
    final tags = this.tags;
    return {
      if (deregisterTime != null)
        'deregisterTime': unixTimestampToJson(deregisterTime),
      if (iamSessionArn != null) 'iamSessionArn': iamSessionArn,
      if (iamUserArn != null) 'iamUserArn': iamUserArn,
      if (instanceArn != null) 'instanceArn': instanceArn,
      if (instanceName != null) 'instanceName': instanceName,
      if (registerTime != null)
        'registerTime': unixTimestampToJson(registerTime),
      if (tags != null) 'tags': tags,
    };
  }
}

@Deprecated('InstanceStatus is deprecated, use TargetStatus instead.')
enum InstanceStatus {
  pending,
  inProgress,
  succeeded,
  failed,
  skipped,
  unknown,
  ready,
}

extension InstanceStatusValueExtension on InstanceStatus {
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
  }
}

extension InstanceStatusFromString on String {
  InstanceStatus toInstanceStatus() {
    switch (this) {
      case 'Pending':
        return InstanceStatus.pending;
      case 'InProgress':
        return InstanceStatus.inProgress;
      case 'Succeeded':
        return InstanceStatus.succeeded;
      case 'Failed':
        return InstanceStatus.failed;
      case 'Skipped':
        return InstanceStatus.skipped;
      case 'Unknown':
        return InstanceStatus.unknown;
      case 'Ready':
        return InstanceStatus.ready;
    }
    throw Exception('$this is not known in enum InstanceStatus');
  }
}

/// Information about an instance in a deployment.
@Deprecated('InstanceSummary is deprecated, use DeploymentTarget instead.')
class InstanceSummary {
  /// The unique ID of a deployment.
  final String? deploymentId;

  /// The instance ID.
  final String? instanceId;

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
  final InstanceType? instanceType;

  /// A timestamp that indicates when the instance information was last updated.
  final DateTime? lastUpdatedAt;

  /// A list of lifecycle events for this instance.
  final List<LifecycleEvent>? lifecycleEvents;

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
  final InstanceStatus? status;

  InstanceSummary({
    this.deploymentId,
    this.instanceId,
    this.instanceType,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      deploymentId: json['deploymentId'] as String?,
      instanceId: json['instanceId'] as String?,
      instanceType: (json['instanceType'] as String?)?.toInstanceType(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleEvents: (json['lifecycleEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toInstanceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final instanceId = this.instanceId;
    final instanceType = this.instanceType;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleEvents = this.lifecycleEvents;
    final status = this.status;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (instanceId != null) 'instanceId': instanceId,
      if (instanceType != null) 'instanceType': instanceType.toValue(),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lifecycleEvents != null) 'lifecycleEvents': lifecycleEvents,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A target Amazon EC2 or on-premises instance during a deployment that uses
/// the EC2/On-premises compute platform.
class InstanceTarget {
  /// The unique ID of a deployment.
  final String? deploymentId;

  /// A label that identifies whether the instance is an original target
  /// (<code>BLUE</code>) or a replacement target (<code>GREEN</code>).
  final TargetLabel? instanceLabel;

  /// The date and time when the target instance was updated by a deployment.
  final DateTime? lastUpdatedAt;

  /// The lifecycle events of the deployment to this target instance.
  final List<LifecycleEvent>? lifecycleEvents;

  /// The status an EC2/On-premises deployment's target instance.
  final TargetStatus? status;

  /// The Amazon Resource Name (ARN) of the target.
  final String? targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>instanceTarget</code>.
  final String? targetId;

  InstanceTarget({
    this.deploymentId,
    this.instanceLabel,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
  });

  factory InstanceTarget.fromJson(Map<String, dynamic> json) {
    return InstanceTarget(
      deploymentId: json['deploymentId'] as String?,
      instanceLabel: (json['instanceLabel'] as String?)?.toTargetLabel(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleEvents: (json['lifecycleEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toTargetStatus(),
      targetArn: json['targetArn'] as String?,
      targetId: json['targetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final instanceLabel = this.instanceLabel;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleEvents = this.lifecycleEvents;
    final status = this.status;
    final targetArn = this.targetArn;
    final targetId = this.targetId;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (instanceLabel != null) 'instanceLabel': instanceLabel.toValue(),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lifecycleEvents != null) 'lifecycleEvents': lifecycleEvents,
      if (status != null) 'status': status.toValue(),
      if (targetArn != null) 'targetArn': targetArn,
      if (targetId != null) 'targetId': targetId,
    };
  }
}

enum InstanceType {
  blue,
  green,
}

extension InstanceTypeValueExtension on InstanceType {
  String toValue() {
    switch (this) {
      case InstanceType.blue:
        return 'Blue';
      case InstanceType.green:
        return 'Green';
    }
  }
}

extension InstanceTypeFromString on String {
  InstanceType toInstanceType() {
    switch (this) {
      case 'Blue':
        return InstanceType.blue;
      case 'Green':
        return InstanceType.green;
    }
    throw Exception('$this is not known in enum InstanceType');
  }
}

/// Information about a Lambda function specified in a deployment.
class LambdaFunctionInfo {
  /// The version of a Lambda function that production traffic points to.
  final String? currentVersion;

  /// The alias of a Lambda function. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Lambda
  /// Function Aliases</a> in the <i>Lambda Developer Guide</i>.
  final String? functionAlias;

  /// The name of a Lambda function.
  final String? functionName;

  /// The version of a Lambda function that production traffic points to after the
  /// Lambda function is deployed.
  final String? targetVersion;

  /// The percentage of production traffic that the target version of a Lambda
  /// function receives.
  final double? targetVersionWeight;

  LambdaFunctionInfo({
    this.currentVersion,
    this.functionAlias,
    this.functionName,
    this.targetVersion,
    this.targetVersionWeight,
  });

  factory LambdaFunctionInfo.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionInfo(
      currentVersion: json['currentVersion'] as String?,
      functionAlias: json['functionAlias'] as String?,
      functionName: json['functionName'] as String?,
      targetVersion: json['targetVersion'] as String?,
      targetVersionWeight: json['targetVersionWeight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    final functionAlias = this.functionAlias;
    final functionName = this.functionName;
    final targetVersion = this.targetVersion;
    final targetVersionWeight = this.targetVersionWeight;
    return {
      if (currentVersion != null) 'currentVersion': currentVersion,
      if (functionAlias != null) 'functionAlias': functionAlias,
      if (functionName != null) 'functionName': functionName,
      if (targetVersion != null) 'targetVersion': targetVersion,
      if (targetVersionWeight != null)
        'targetVersionWeight': targetVersionWeight,
    };
  }
}

/// Information about the target Lambda function during an Lambda deployment.
class LambdaTarget {
  /// The unique ID of a deployment.
  final String? deploymentId;

  /// A <code>LambdaFunctionInfo</code> object that describes a target Lambda
  /// function.
  final LambdaFunctionInfo? lambdaFunctionInfo;

  /// The date and time when the target Lambda function was updated by a
  /// deployment.
  final DateTime? lastUpdatedAt;

  /// The lifecycle events of the deployment to this target Lambda function.
  final List<LifecycleEvent>? lifecycleEvents;

  /// The status an Lambda deployment's target Lambda function.
  final TargetStatus? status;

  /// The Amazon Resource Name (ARN) of the target.
  final String? targetArn;

  /// The unique ID of a deployment target that has a type of
  /// <code>lambdaTarget</code>.
  final String? targetId;

  LambdaTarget({
    this.deploymentId,
    this.lambdaFunctionInfo,
    this.lastUpdatedAt,
    this.lifecycleEvents,
    this.status,
    this.targetArn,
    this.targetId,
  });

  factory LambdaTarget.fromJson(Map<String, dynamic> json) {
    return LambdaTarget(
      deploymentId: json['deploymentId'] as String?,
      lambdaFunctionInfo: json['lambdaFunctionInfo'] != null
          ? LambdaFunctionInfo.fromJson(
              json['lambdaFunctionInfo'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleEvents: (json['lifecycleEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toTargetStatus(),
      targetArn: json['targetArn'] as String?,
      targetId: json['targetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final lambdaFunctionInfo = this.lambdaFunctionInfo;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleEvents = this.lifecycleEvents;
    final status = this.status;
    final targetArn = this.targetArn;
    final targetId = this.targetId;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (lambdaFunctionInfo != null) 'lambdaFunctionInfo': lambdaFunctionInfo,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lifecycleEvents != null) 'lifecycleEvents': lifecycleEvents,
      if (status != null) 'status': status.toValue(),
      if (targetArn != null) 'targetArn': targetArn,
      if (targetId != null) 'targetId': targetId,
    };
  }
}

/// Information about the most recent attempted or successful deployment to a
/// deployment group.
class LastDeploymentInfo {
  /// A timestamp that indicates when the most recent deployment to the deployment
  /// group started.
  final DateTime? createTime;

  /// The unique ID of a deployment.
  final String? deploymentId;

  /// A timestamp that indicates when the most recent deployment to the deployment
  /// group was complete.
  final DateTime? endTime;

  /// The status of the most recent deployment.
  final DeploymentStatus? status;

  LastDeploymentInfo({
    this.createTime,
    this.deploymentId,
    this.endTime,
    this.status,
  });

  factory LastDeploymentInfo.fromJson(Map<String, dynamic> json) {
    return LastDeploymentInfo(
      createTime: timeStampFromJson(json['createTime']),
      deploymentId: json['deploymentId'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      status: (json['status'] as String?)?.toDeploymentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final deploymentId = this.deploymentId;
    final endTime = this.endTime;
    final status = this.status;
    return {
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum LifecycleErrorCode {
  success,
  scriptMissing,
  scriptNotExecutable,
  scriptTimedOut,
  scriptFailed,
  unknownError,
}

extension LifecycleErrorCodeValueExtension on LifecycleErrorCode {
  String toValue() {
    switch (this) {
      case LifecycleErrorCode.success:
        return 'Success';
      case LifecycleErrorCode.scriptMissing:
        return 'ScriptMissing';
      case LifecycleErrorCode.scriptNotExecutable:
        return 'ScriptNotExecutable';
      case LifecycleErrorCode.scriptTimedOut:
        return 'ScriptTimedOut';
      case LifecycleErrorCode.scriptFailed:
        return 'ScriptFailed';
      case LifecycleErrorCode.unknownError:
        return 'UnknownError';
    }
  }
}

extension LifecycleErrorCodeFromString on String {
  LifecycleErrorCode toLifecycleErrorCode() {
    switch (this) {
      case 'Success':
        return LifecycleErrorCode.success;
      case 'ScriptMissing':
        return LifecycleErrorCode.scriptMissing;
      case 'ScriptNotExecutable':
        return LifecycleErrorCode.scriptNotExecutable;
      case 'ScriptTimedOut':
        return LifecycleErrorCode.scriptTimedOut;
      case 'ScriptFailed':
        return LifecycleErrorCode.scriptFailed;
      case 'UnknownError':
        return LifecycleErrorCode.unknownError;
    }
    throw Exception('$this is not known in enum LifecycleErrorCode');
  }
}

/// Information about a deployment lifecycle event.
class LifecycleEvent {
  /// Diagnostic information about the deployment lifecycle event.
  final Diagnostics? diagnostics;

  /// A timestamp that indicates when the deployment lifecycle event ended.
  final DateTime? endTime;

  /// The deployment lifecycle event name, such as <code>ApplicationStop</code>,
  /// <code>BeforeInstall</code>, <code>AfterInstall</code>,
  /// <code>ApplicationStart</code>, or <code>ValidateService</code>.
  final String? lifecycleEventName;

  /// A timestamp that indicates when the deployment lifecycle event started.
  final DateTime? startTime;

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
  final LifecycleEventStatus? status;

  LifecycleEvent({
    this.diagnostics,
    this.endTime,
    this.lifecycleEventName,
    this.startTime,
    this.status,
  });

  factory LifecycleEvent.fromJson(Map<String, dynamic> json) {
    return LifecycleEvent(
      diagnostics: json['diagnostics'] != null
          ? Diagnostics.fromJson(json['diagnostics'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      lifecycleEventName: json['lifecycleEventName'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toLifecycleEventStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final diagnostics = this.diagnostics;
    final endTime = this.endTime;
    final lifecycleEventName = this.lifecycleEventName;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (diagnostics != null) 'diagnostics': diagnostics,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (lifecycleEventName != null) 'lifecycleEventName': lifecycleEventName,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum LifecycleEventStatus {
  pending,
  inProgress,
  succeeded,
  failed,
  skipped,
  unknown,
}

extension LifecycleEventStatusValueExtension on LifecycleEventStatus {
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
  }
}

extension LifecycleEventStatusFromString on String {
  LifecycleEventStatus toLifecycleEventStatus() {
    switch (this) {
      case 'Pending':
        return LifecycleEventStatus.pending;
      case 'InProgress':
        return LifecycleEventStatus.inProgress;
      case 'Succeeded':
        return LifecycleEventStatus.succeeded;
      case 'Failed':
        return LifecycleEventStatus.failed;
      case 'Skipped':
        return LifecycleEventStatus.skipped;
      case 'Unknown':
        return LifecycleEventStatus.unknown;
    }
    throw Exception('$this is not known in enum LifecycleEventStatus');
  }
}

/// Represents the output of a <code>ListApplicationRevisions</code> operation.
class ListApplicationRevisionsOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call to
  /// return the next set of application revisions in the list.
  final String? nextToken;

  /// A list of locations that contain the matching revisions.
  final List<RevisionLocation>? revisions;

  ListApplicationRevisionsOutput({
    this.nextToken,
    this.revisions,
  });

  factory ListApplicationRevisionsOutput.fromJson(Map<String, dynamic> json) {
    return ListApplicationRevisionsOutput(
      nextToken: json['nextToken'] as String?,
      revisions: (json['revisions'] as List?)
          ?.whereNotNull()
          .map((e) => RevisionLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final revisions = this.revisions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (revisions != null) 'revisions': revisions,
    };
  }
}

/// Represents the output of a ListApplications operation.
class ListApplicationsOutput {
  /// A list of application names.
  final List<String>? applications;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list applications call to return
  /// the next set of applications in the list.
  final String? nextToken;

  ListApplicationsOutput({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return ListApplicationsOutput(
      applications: (json['applications'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'applications': applications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListDeploymentConfigs</code> operation.
class ListDeploymentConfigsOutput {
  /// A list of deployment configurations, including built-in configurations such
  /// as <code>CodeDeployDefault.OneAtATime</code>.
  final List<String>? deploymentConfigsList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment configurations call
  /// to return the next set of deployment configurations in the list.
  final String? nextToken;

  ListDeploymentConfigsOutput({
    this.deploymentConfigsList,
    this.nextToken,
  });

  factory ListDeploymentConfigsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentConfigsOutput(
      deploymentConfigsList: (json['deploymentConfigsList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentConfigsList = this.deploymentConfigsList;
    final nextToken = this.nextToken;
    return {
      if (deploymentConfigsList != null)
        'deploymentConfigsList': deploymentConfigsList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListDeploymentGroups</code> operation.
class ListDeploymentGroupsOutput {
  /// The application name.
  final String? applicationName;

  /// A list of deployment group names.
  final List<String>? deploymentGroups;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment groups call to
  /// return the next set of deployment groups in the list.
  final String? nextToken;

  ListDeploymentGroupsOutput({
    this.applicationName,
    this.deploymentGroups,
    this.nextToken,
  });

  factory ListDeploymentGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentGroupsOutput(
      applicationName: json['applicationName'] as String?,
      deploymentGroups: (json['deploymentGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationName = this.applicationName;
    final deploymentGroups = this.deploymentGroups;
    final nextToken = this.nextToken;
    return {
      if (applicationName != null) 'applicationName': applicationName,
      if (deploymentGroups != null) 'deploymentGroups': deploymentGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListDeploymentInstances</code> operation.
class ListDeploymentInstancesOutput {
  /// A list of instance IDs.
  final List<String>? instancesList;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployment instances call to
  /// return the next set of deployment instances in the list.
  final String? nextToken;

  ListDeploymentInstancesOutput({
    this.instancesList,
    this.nextToken,
  });

  factory ListDeploymentInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentInstancesOutput(
      instancesList: (json['instancesList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instancesList = this.instancesList;
    final nextToken = this.nextToken;
    return {
      if (instancesList != null) 'instancesList': instancesList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeploymentTargetsOutput {
  /// If a large amount of information is returned, a token identifier is also
  /// returned. It can be used in a subsequent <code>ListDeploymentTargets</code>
  /// call to return the next set of deployment targets in the list.
  final String? nextToken;

  /// The unique IDs of deployment targets.
  final List<String>? targetIds;

  ListDeploymentTargetsOutput({
    this.nextToken,
    this.targetIds,
  });

  factory ListDeploymentTargetsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentTargetsOutput(
      nextToken: json['nextToken'] as String?,
      targetIds: (json['targetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetIds = this.targetIds;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetIds != null) 'targetIds': targetIds,
    };
  }
}

/// Represents the output of a <code>ListDeployments</code> operation.
class ListDeploymentsOutput {
  /// A list of deployment IDs.
  final List<String>? deployments;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list deployments call to return the
  /// next set of deployments in the list.
  final String? nextToken;

  ListDeploymentsOutput({
    this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsOutput(
      deployments: (json['deployments'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      if (deployments != null) 'deployments': deployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListGitHubAccountTokenNames</code>
/// operation.
class ListGitHubAccountTokenNamesOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent
  /// <code>ListGitHubAccountTokenNames</code> call to return the next set of
  /// names in the list.
  final String? nextToken;

  /// A list of names of connections to GitHub accounts.
  final List<String>? tokenNameList;

  ListGitHubAccountTokenNamesOutput({
    this.nextToken,
    this.tokenNameList,
  });

  factory ListGitHubAccountTokenNamesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListGitHubAccountTokenNamesOutput(
      nextToken: json['nextToken'] as String?,
      tokenNameList: (json['tokenNameList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tokenNameList = this.tokenNameList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tokenNameList != null) 'tokenNameList': tokenNameList,
    };
  }
}

/// Represents the output of the list on-premises instances operation.
class ListOnPremisesInstancesOutput {
  /// The list of matching on-premises instance names.
  final List<String>? instanceNames;

  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list on-premises instances call to
  /// return the next set of on-premises instances in the list.
  final String? nextToken;

  ListOnPremisesInstancesOutput({
    this.instanceNames,
    this.nextToken,
  });

  factory ListOnPremisesInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListOnPremisesInstancesOutput(
      instanceNames: (json['instanceNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceNames = this.instanceNames;
    final nextToken = this.nextToken;
    return {
      if (instanceNames != null) 'instanceNames': instanceNames,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum ListStateFilterAction {
  include,
  exclude,
  ignore,
}

extension ListStateFilterActionValueExtension on ListStateFilterAction {
  String toValue() {
    switch (this) {
      case ListStateFilterAction.include:
        return 'include';
      case ListStateFilterAction.exclude:
        return 'exclude';
      case ListStateFilterAction.ignore:
        return 'ignore';
    }
  }
}

extension ListStateFilterActionFromString on String {
  ListStateFilterAction toListStateFilterAction() {
    switch (this) {
      case 'include':
        return ListStateFilterAction.include;
      case 'exclude':
        return ListStateFilterAction.exclude;
      case 'ignore':
        return ListStateFilterAction.ignore;
    }
    throw Exception('$this is not known in enum ListStateFilterAction');
  }
}

class ListTagsForResourceOutput {
  /// If a large amount of information is returned, an identifier is also
  /// returned. It can be used in a subsequent list application revisions call to
  /// return the next set of application revisions in the list.
  final String? nextToken;

  /// A list of tags returned by <code>ListTagsForResource</code>. The tags are
  /// associated with the resource identified by the input
  /// <code>ResourceArn</code> parameter.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about the Elastic Load Balancing load balancer or target group
/// used in a deployment.
///
/// You can use load balancers and target groups in combination. For example, if
/// you have two Classic Load Balancers, and five target groups tied to an
/// Application Load Balancer, you can specify the two Classic Load Balancers in
/// <code>elbInfoList</code>, and the five target groups in
/// <code>targetGroupInfoList</code>.
class LoadBalancerInfo {
  /// An array that contains information about the load balancers to use for load
  /// balancing in a deployment. If you're using Classic Load Balancers, specify
  /// those load balancers in this array.
  /// <note>
  /// You can add up to 10 load balancers to the array.
  /// </note> <note>
  /// If you're using Application Load Balancers or Network Load Balancers, use
  /// the <code>targetGroupInfoList</code> array instead of this one.
  /// </note>
  final List<ELBInfo>? elbInfoList;

  /// An array that contains information about the target groups to use for load
  /// balancing in a deployment. If you're using Application Load Balancers and
  /// Network Load Balancers, specify their associated target groups in this
  /// array.
  /// <note>
  /// You can add up to 10 target groups to the array.
  /// </note> <note>
  /// If you're using Classic Load Balancers, use the <code>elbInfoList</code>
  /// array instead of this one.
  /// </note>
  final List<TargetGroupInfo>? targetGroupInfoList;

  /// The target group pair information. This is an array of
  /// <code>TargeGroupPairInfo</code> objects with a maximum size of one.
  final List<TargetGroupPairInfo>? targetGroupPairInfoList;

  LoadBalancerInfo({
    this.elbInfoList,
    this.targetGroupInfoList,
    this.targetGroupPairInfoList,
  });

  factory LoadBalancerInfo.fromJson(Map<String, dynamic> json) {
    return LoadBalancerInfo(
      elbInfoList: (json['elbInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => ELBInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetGroupInfoList: (json['targetGroupInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => TargetGroupInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetGroupPairInfoList: (json['targetGroupPairInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => TargetGroupPairInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final elbInfoList = this.elbInfoList;
    final targetGroupInfoList = this.targetGroupInfoList;
    final targetGroupPairInfoList = this.targetGroupPairInfoList;
    return {
      if (elbInfoList != null) 'elbInfoList': elbInfoList,
      if (targetGroupInfoList != null)
        'targetGroupInfoList': targetGroupInfoList,
      if (targetGroupPairInfoList != null)
        'targetGroupPairInfoList': targetGroupPairInfoList,
    };
  }
}

/// Information about the minimum number of healthy instances.
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
  /// CodeDeployDefault.OneAtATime, CodeDeploy attempts to ensure that all
  /// instances but one are kept in a healthy state during the deployment.
  /// Although this allows one instance at a time to be taken offline for a new
  /// deployment, it also means that if the deployment to the last instance fails,
  /// the overall deployment is still successful.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html">CodeDeploy
  /// Instance Health</a> in the <i>CodeDeploy User Guide</i>.
  final MinimumHealthyHostsType? type;

  /// The minimum healthy instance value.
  final int? value;

  MinimumHealthyHosts({
    this.type,
    this.value,
  });

  factory MinimumHealthyHosts.fromJson(Map<String, dynamic> json) {
    return MinimumHealthyHosts(
      type: (json['type'] as String?)?.toMinimumHealthyHostsType(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Information about the minimum number of healthy instances per Availability
/// Zone.
class MinimumHealthyHostsPerZone {
  /// The <code>type</code> associated with the
  /// <code>MinimumHealthyHostsPerZone</code> option.
  final MinimumHealthyHostsPerZoneType? type;

  /// The <code>value</code> associated with the
  /// <code>MinimumHealthyHostsPerZone</code> option.
  final int? value;

  MinimumHealthyHostsPerZone({
    this.type,
    this.value,
  });

  factory MinimumHealthyHostsPerZone.fromJson(Map<String, dynamic> json) {
    return MinimumHealthyHostsPerZone(
      type: (json['type'] as String?)?.toMinimumHealthyHostsPerZoneType(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum MinimumHealthyHostsPerZoneType {
  hostCount,
  fleetPercent,
}

extension MinimumHealthyHostsPerZoneTypeValueExtension
    on MinimumHealthyHostsPerZoneType {
  String toValue() {
    switch (this) {
      case MinimumHealthyHostsPerZoneType.hostCount:
        return 'HOST_COUNT';
      case MinimumHealthyHostsPerZoneType.fleetPercent:
        return 'FLEET_PERCENT';
    }
  }
}

extension MinimumHealthyHostsPerZoneTypeFromString on String {
  MinimumHealthyHostsPerZoneType toMinimumHealthyHostsPerZoneType() {
    switch (this) {
      case 'HOST_COUNT':
        return MinimumHealthyHostsPerZoneType.hostCount;
      case 'FLEET_PERCENT':
        return MinimumHealthyHostsPerZoneType.fleetPercent;
    }
    throw Exception(
        '$this is not known in enum MinimumHealthyHostsPerZoneType');
  }
}

enum MinimumHealthyHostsType {
  hostCount,
  fleetPercent,
}

extension MinimumHealthyHostsTypeValueExtension on MinimumHealthyHostsType {
  String toValue() {
    switch (this) {
      case MinimumHealthyHostsType.hostCount:
        return 'HOST_COUNT';
      case MinimumHealthyHostsType.fleetPercent:
        return 'FLEET_PERCENT';
    }
  }
}

extension MinimumHealthyHostsTypeFromString on String {
  MinimumHealthyHostsType toMinimumHealthyHostsType() {
    switch (this) {
      case 'HOST_COUNT':
        return MinimumHealthyHostsType.hostCount;
      case 'FLEET_PERCENT':
        return MinimumHealthyHostsType.fleetPercent;
    }
    throw Exception('$this is not known in enum MinimumHealthyHostsType');
  }
}

/// Information about groups of on-premises instance tags.
class OnPremisesTagSet {
  /// A list that contains other lists of on-premises instance tag groups. For an
  /// instance to be included in the deployment group, it must be identified by
  /// all of the tag groups in the list.
  final List<List<TagFilter>>? onPremisesTagSetList;

  OnPremisesTagSet({
    this.onPremisesTagSetList,
  });

  factory OnPremisesTagSet.fromJson(Map<String, dynamic> json) {
    return OnPremisesTagSet(
      onPremisesTagSetList: (json['onPremisesTagSetList'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => TagFilter.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final onPremisesTagSetList = this.onPremisesTagSetList;
    return {
      if (onPremisesTagSetList != null)
        'onPremisesTagSetList': onPremisesTagSetList,
    };
  }
}

enum OutdatedInstancesStrategy {
  update,
  ignore,
}

extension OutdatedInstancesStrategyValueExtension on OutdatedInstancesStrategy {
  String toValue() {
    switch (this) {
      case OutdatedInstancesStrategy.update:
        return 'UPDATE';
      case OutdatedInstancesStrategy.ignore:
        return 'IGNORE';
    }
  }
}

extension OutdatedInstancesStrategyFromString on String {
  OutdatedInstancesStrategy toOutdatedInstancesStrategy() {
    switch (this) {
      case 'UPDATE':
        return OutdatedInstancesStrategy.update;
      case 'IGNORE':
        return OutdatedInstancesStrategy.ignore;
    }
    throw Exception('$this is not known in enum OutdatedInstancesStrategy');
  }
}

class PutLifecycleEventHookExecutionStatusOutput {
  /// The execution ID of the lifecycle event hook. A hook is specified in the
  /// <code>hooks</code> section of the deployment's AppSpec file.
  final String? lifecycleEventHookExecutionId;

  PutLifecycleEventHookExecutionStatusOutput({
    this.lifecycleEventHookExecutionId,
  });

  factory PutLifecycleEventHookExecutionStatusOutput.fromJson(
      Map<String, dynamic> json) {
    return PutLifecycleEventHookExecutionStatusOutput(
      lifecycleEventHookExecutionId:
          json['lifecycleEventHookExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleEventHookExecutionId = this.lifecycleEventHookExecutionId;
    return {
      if (lifecycleEventHookExecutionId != null)
        'lifecycleEventHookExecutionId': lifecycleEventHookExecutionId,
    };
  }
}

/// A revision for an Lambda deployment that is a YAML-formatted or
/// JSON-formatted string. For Lambda deployments, the revision is the same as
/// the AppSpec file.
@Deprecated(
    'RawString and String revision type are deprecated, use AppSpecContent type instead.')
class RawString {
  /// The YAML-formatted or JSON-formatted revision string. It includes
  /// information about which Lambda function to update and optional Lambda
  /// functions that validate deployment lifecycle events.
  final String? content;

  /// The SHA256 hash value of the revision content.
  final String? sha256;

  RawString({
    this.content,
    this.sha256,
  });

  factory RawString.fromJson(Map<String, dynamic> json) {
    return RawString(
      content: json['content'] as String?,
      sha256: json['sha256'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final sha256 = this.sha256;
    return {
      if (content != null) 'content': content,
      if (sha256 != null) 'sha256': sha256,
    };
  }
}

enum RegistrationStatus {
  registered,
  deregistered,
}

extension RegistrationStatusValueExtension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.registered:
        return 'Registered';
      case RegistrationStatus.deregistered:
        return 'Deregistered';
    }
  }
}

extension RegistrationStatusFromString on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'Registered':
        return RegistrationStatus.registered;
      case 'Deregistered':
        return RegistrationStatus.deregistered;
    }
    throw Exception('$this is not known in enum RegistrationStatus');
  }
}

/// Information about deployments related to the specified deployment.
class RelatedDeployments {
  /// The deployment IDs of 'auto-update outdated instances' deployments triggered
  /// by this deployment.
  final List<String>? autoUpdateOutdatedInstancesDeploymentIds;

  /// The deployment ID of the root deployment that triggered this deployment.
  final String? autoUpdateOutdatedInstancesRootDeploymentId;

  RelatedDeployments({
    this.autoUpdateOutdatedInstancesDeploymentIds,
    this.autoUpdateOutdatedInstancesRootDeploymentId,
  });

  factory RelatedDeployments.fromJson(Map<String, dynamic> json) {
    return RelatedDeployments(
      autoUpdateOutdatedInstancesDeploymentIds:
          (json['autoUpdateOutdatedInstancesDeploymentIds'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      autoUpdateOutdatedInstancesRootDeploymentId:
          json['autoUpdateOutdatedInstancesRootDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoUpdateOutdatedInstancesDeploymentIds =
        this.autoUpdateOutdatedInstancesDeploymentIds;
    final autoUpdateOutdatedInstancesRootDeploymentId =
        this.autoUpdateOutdatedInstancesRootDeploymentId;
    return {
      if (autoUpdateOutdatedInstancesDeploymentIds != null)
        'autoUpdateOutdatedInstancesDeploymentIds':
            autoUpdateOutdatedInstancesDeploymentIds,
      if (autoUpdateOutdatedInstancesRootDeploymentId != null)
        'autoUpdateOutdatedInstancesRootDeploymentId':
            autoUpdateOutdatedInstancesRootDeploymentId,
    };
  }
}

/// Information about an application revision.
class RevisionInfo {
  /// Information about an application revision, including usage details and
  /// associated deployment groups.
  final GenericRevisionInfo? genericRevisionInfo;

  /// Information about the location and type of an application revision.
  final RevisionLocation? revisionLocation;

  RevisionInfo({
    this.genericRevisionInfo,
    this.revisionLocation,
  });

  factory RevisionInfo.fromJson(Map<String, dynamic> json) {
    return RevisionInfo(
      genericRevisionInfo: json['genericRevisionInfo'] != null
          ? GenericRevisionInfo.fromJson(
              json['genericRevisionInfo'] as Map<String, dynamic>)
          : null,
      revisionLocation: json['revisionLocation'] != null
          ? RevisionLocation.fromJson(
              json['revisionLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final genericRevisionInfo = this.genericRevisionInfo;
    final revisionLocation = this.revisionLocation;
    return {
      if (genericRevisionInfo != null)
        'genericRevisionInfo': genericRevisionInfo,
      if (revisionLocation != null) 'revisionLocation': revisionLocation,
    };
  }
}

/// Information about the location of an application revision.
class RevisionLocation {
  /// The content of an AppSpec file for an Lambda or Amazon ECS deployment. The
  /// content is formatted as JSON or YAML and stored as a RawString.
  final AppSpecContent? appSpecContent;

  /// Information about the location of application artifacts stored in GitHub.
  final GitHubLocation? gitHubLocation;

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
  /// String: A YAML-formatted or JSON-formatted string (Lambda deployments only).
  /// </li>
  /// <li>
  /// AppSpecContent: An <code>AppSpecContent</code> object that contains the
  /// contents of an AppSpec file for an Lambda or Amazon ECS deployment. The
  /// content is formatted as JSON or YAML stored as a RawString.
  /// </li>
  /// </ul>
  final RevisionLocationType? revisionType;

  /// Information about the location of a revision stored in Amazon S3.
  final S3Location? s3Location;

  /// Information about the location of an Lambda deployment revision stored as a
  /// RawString.
  final RawString? string;

  RevisionLocation({
    this.appSpecContent,
    this.gitHubLocation,
    this.revisionType,
    this.s3Location,
    this.string,
  });

  factory RevisionLocation.fromJson(Map<String, dynamic> json) {
    return RevisionLocation(
      appSpecContent: json['appSpecContent'] != null
          ? AppSpecContent.fromJson(
              json['appSpecContent'] as Map<String, dynamic>)
          : null,
      gitHubLocation: json['gitHubLocation'] != null
          ? GitHubLocation.fromJson(
              json['gitHubLocation'] as Map<String, dynamic>)
          : null,
      revisionType: (json['revisionType'] as String?)?.toRevisionLocationType(),
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
      string: json['string'] != null
          ? RawString.fromJson(json['string'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appSpecContent = this.appSpecContent;
    final gitHubLocation = this.gitHubLocation;
    final revisionType = this.revisionType;
    final s3Location = this.s3Location;
    final string = this.string;
    return {
      if (appSpecContent != null) 'appSpecContent': appSpecContent,
      if (gitHubLocation != null) 'gitHubLocation': gitHubLocation,
      if (revisionType != null) 'revisionType': revisionType.toValue(),
      if (s3Location != null) 's3Location': s3Location,
      if (string != null) 'string': string,
    };
  }
}

enum RevisionLocationType {
  s3,
  gitHub,
  string,
  appSpecContent,
}

extension RevisionLocationTypeValueExtension on RevisionLocationType {
  String toValue() {
    switch (this) {
      case RevisionLocationType.s3:
        return 'S3';
      case RevisionLocationType.gitHub:
        return 'GitHub';
      case RevisionLocationType.string:
        return 'String';
      case RevisionLocationType.appSpecContent:
        return 'AppSpecContent';
    }
  }
}

extension RevisionLocationTypeFromString on String {
  RevisionLocationType toRevisionLocationType() {
    switch (this) {
      case 'S3':
        return RevisionLocationType.s3;
      case 'GitHub':
        return RevisionLocationType.gitHub;
      case 'String':
        return RevisionLocationType.string;
      case 'AppSpecContent':
        return RevisionLocationType.appSpecContent;
    }
    throw Exception('$this is not known in enum RevisionLocationType');
  }
}

/// Information about a deployment rollback.
class RollbackInfo {
  /// The ID of the deployment rollback.
  final String? rollbackDeploymentId;

  /// Information that describes the status of a deployment rollback (for example,
  /// whether the deployment can't be rolled back, is in progress, failed, or
  /// succeeded).
  final String? rollbackMessage;

  /// The deployment ID of the deployment that was underway and triggered a
  /// rollback deployment because it failed or was stopped.
  final String? rollbackTriggeringDeploymentId;

  RollbackInfo({
    this.rollbackDeploymentId,
    this.rollbackMessage,
    this.rollbackTriggeringDeploymentId,
  });

  factory RollbackInfo.fromJson(Map<String, dynamic> json) {
    return RollbackInfo(
      rollbackDeploymentId: json['rollbackDeploymentId'] as String?,
      rollbackMessage: json['rollbackMessage'] as String?,
      rollbackTriggeringDeploymentId:
          json['rollbackTriggeringDeploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rollbackDeploymentId = this.rollbackDeploymentId;
    final rollbackMessage = this.rollbackMessage;
    final rollbackTriggeringDeploymentId = this.rollbackTriggeringDeploymentId;
    return {
      if (rollbackDeploymentId != null)
        'rollbackDeploymentId': rollbackDeploymentId,
      if (rollbackMessage != null) 'rollbackMessage': rollbackMessage,
      if (rollbackTriggeringDeploymentId != null)
        'rollbackTriggeringDeploymentId': rollbackTriggeringDeploymentId,
    };
  }
}

/// Information about the location of application artifacts stored in Amazon S3.
class S3Location {
  /// The name of the Amazon S3 bucket where the application revision is stored.
  final String? bucket;

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
  /// <li>
  /// <code>YAML</code>: A YAML-formatted file.
  /// </li>
  /// <li>
  /// <code>JSON</code>: A JSON-formatted file.
  /// </li>
  /// </ul>
  final BundleType? bundleType;

  /// The ETag of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  ///
  /// If the ETag is not specified as an input parameter, ETag validation of the
  /// object is skipped.
  final String? eTag;

  /// The name of the Amazon S3 object that represents the bundled artifacts for
  /// the application revision.
  final String? key;

  /// A specific version of the Amazon S3 object that represents the bundled
  /// artifacts for the application revision.
  ///
  /// If the version is not specified, the system uses the most recent version by
  /// default.
  final String? version;

  S3Location({
    this.bucket,
    this.bundleType,
    this.eTag,
    this.key,
    this.version,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      bundleType: (json['bundleType'] as String?)?.toBundleType(),
      eTag: json['eTag'] as String?,
      key: json['key'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final bundleType = this.bundleType;
    final eTag = this.eTag;
    final key = this.key;
    final version = this.version;
    return {
      if (bucket != null) 'bucket': bucket,
      if (bundleType != null) 'bundleType': bundleType.toValue(),
      if (eTag != null) 'eTag': eTag,
      if (key != null) 'key': key,
      if (version != null) 'version': version,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ascending';
      case SortOrder.descending:
        return 'descending';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ascending':
        return SortOrder.ascending;
      case 'descending':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Represents the output of a <code>StopDeployment</code> operation.
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
  final StopStatus? status;

  /// An accompanying status message.
  final String? statusMessage;

  StopDeploymentOutput({
    this.status,
    this.statusMessage,
  });

  factory StopDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return StopDeploymentOutput(
      status: (json['status'] as String?)?.toStopStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum StopStatus {
  pending,
  succeeded,
}

extension StopStatusValueExtension on StopStatus {
  String toValue() {
    switch (this) {
      case StopStatus.pending:
        return 'Pending';
      case StopStatus.succeeded:
        return 'Succeeded';
    }
  }
}

extension StopStatusFromString on String {
  StopStatus toStopStatus() {
    switch (this) {
      case 'Pending':
        return StopStatus.pending;
      case 'Succeeded':
        return StopStatus.succeeded;
    }
    throw Exception('$this is not known in enum StopStatus');
  }
}

/// Information about a tag.
class Tag {
  /// The tag's key.
  final String? key;

  /// The tag's value.
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

/// Information about an on-premises instance tag filter.
class TagFilter {
  /// The on-premises instance tag filter key.
  final String? key;

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
  final TagFilterType? type;

  /// The on-premises instance tag filter value.
  final String? value;

  TagFilter({
    this.key,
    this.type,
    this.value,
  });

  factory TagFilter.fromJson(Map<String, dynamic> json) {
    return TagFilter(
      key: json['Key'] as String?,
      type: (json['Type'] as String?)?.toTagFilterType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (type != null) 'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum TagFilterType {
  keyOnly,
  valueOnly,
  keyAndValue,
}

extension TagFilterTypeValueExtension on TagFilterType {
  String toValue() {
    switch (this) {
      case TagFilterType.keyOnly:
        return 'KEY_ONLY';
      case TagFilterType.valueOnly:
        return 'VALUE_ONLY';
      case TagFilterType.keyAndValue:
        return 'KEY_AND_VALUE';
    }
  }
}

extension TagFilterTypeFromString on String {
  TagFilterType toTagFilterType() {
    switch (this) {
      case 'KEY_ONLY':
        return TagFilterType.keyOnly;
      case 'VALUE_ONLY':
        return TagFilterType.valueOnly;
      case 'KEY_AND_VALUE':
        return TagFilterType.keyAndValue;
    }
    throw Exception('$this is not known in enum TagFilterType');
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TargetFilterName {
  targetStatus,
  serverInstanceLabel,
}

extension TargetFilterNameValueExtension on TargetFilterName {
  String toValue() {
    switch (this) {
      case TargetFilterName.targetStatus:
        return 'TargetStatus';
      case TargetFilterName.serverInstanceLabel:
        return 'ServerInstanceLabel';
    }
  }
}

extension TargetFilterNameFromString on String {
  TargetFilterName toTargetFilterName() {
    switch (this) {
      case 'TargetStatus':
        return TargetFilterName.targetStatus;
      case 'ServerInstanceLabel':
        return TargetFilterName.serverInstanceLabel;
    }
    throw Exception('$this is not known in enum TargetFilterName');
  }
}

/// Information about a target group in Elastic Load Balancing to use in a
/// deployment. Instances are registered as targets in a target group, and
/// traffic is routed to the target group.
class TargetGroupInfo {
  /// For blue/green deployments, the name of the target group that instances in
  /// the original environment are deregistered from, and instances in the
  /// replacement environment are registered with. For in-place deployments, the
  /// name of the target group that instances are deregistered from, so they are
  /// not serving traffic during a deployment, and then re-registered with after
  /// the deployment is complete.
  final String? name;

  TargetGroupInfo({
    this.name,
  });

  factory TargetGroupInfo.fromJson(Map<String, dynamic> json) {
    return TargetGroupInfo(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Information about two target groups and how traffic is routed during an
/// Amazon ECS deployment. An optional test traffic route can be specified.
class TargetGroupPairInfo {
  /// The path used by a load balancer to route production traffic when an Amazon
  /// ECS deployment is complete.
  final TrafficRoute? prodTrafficRoute;

  /// One pair of target groups. One is associated with the original task set. The
  /// second is associated with the task set that serves traffic after the
  /// deployment is complete.
  final List<TargetGroupInfo>? targetGroups;

  /// An optional path used by a load balancer to route test traffic after an
  /// Amazon ECS deployment. Validation can occur while test traffic is served
  /// during a deployment.
  final TrafficRoute? testTrafficRoute;

  TargetGroupPairInfo({
    this.prodTrafficRoute,
    this.targetGroups,
    this.testTrafficRoute,
  });

  factory TargetGroupPairInfo.fromJson(Map<String, dynamic> json) {
    return TargetGroupPairInfo(
      prodTrafficRoute: json['prodTrafficRoute'] != null
          ? TrafficRoute.fromJson(
              json['prodTrafficRoute'] as Map<String, dynamic>)
          : null,
      targetGroups: (json['targetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => TargetGroupInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      testTrafficRoute: json['testTrafficRoute'] != null
          ? TrafficRoute.fromJson(
              json['testTrafficRoute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final prodTrafficRoute = this.prodTrafficRoute;
    final targetGroups = this.targetGroups;
    final testTrafficRoute = this.testTrafficRoute;
    return {
      if (prodTrafficRoute != null) 'prodTrafficRoute': prodTrafficRoute,
      if (targetGroups != null) 'targetGroups': targetGroups,
      if (testTrafficRoute != null) 'testTrafficRoute': testTrafficRoute,
    };
  }
}

/// Information about the instances to be used in the replacement environment in
/// a blue/green deployment.
class TargetInstances {
  /// The names of one or more Auto Scaling groups to identify a replacement
  /// environment for a blue/green deployment.
  final List<String>? autoScalingGroups;

  /// Information about the groups of Amazon EC2 instance tags that an instance
  /// must be identified by in order for it to be included in the replacement
  /// environment for a blue/green deployment. Cannot be used in the same call as
  /// <code>tagFilters</code>.
  final EC2TagSet? ec2TagSet;

  /// The tag filter key, type, and value used to identify Amazon EC2 instances in
  /// a replacement environment for a blue/green deployment. Cannot be used in the
  /// same call as <code>ec2TagSet</code>.
  final List<EC2TagFilter>? tagFilters;

  TargetInstances({
    this.autoScalingGroups,
    this.ec2TagSet,
    this.tagFilters,
  });

  factory TargetInstances.fromJson(Map<String, dynamic> json) {
    return TargetInstances(
      autoScalingGroups: (json['autoScalingGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ec2TagSet: json['ec2TagSet'] != null
          ? EC2TagSet.fromJson(json['ec2TagSet'] as Map<String, dynamic>)
          : null,
      tagFilters: (json['tagFilters'] as List?)
          ?.whereNotNull()
          .map((e) => EC2TagFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroups = this.autoScalingGroups;
    final ec2TagSet = this.ec2TagSet;
    final tagFilters = this.tagFilters;
    return {
      if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
      if (ec2TagSet != null) 'ec2TagSet': ec2TagSet,
      if (tagFilters != null) 'tagFilters': tagFilters,
    };
  }
}

enum TargetLabel {
  blue,
  green,
}

extension TargetLabelValueExtension on TargetLabel {
  String toValue() {
    switch (this) {
      case TargetLabel.blue:
        return 'Blue';
      case TargetLabel.green:
        return 'Green';
    }
  }
}

extension TargetLabelFromString on String {
  TargetLabel toTargetLabel() {
    switch (this) {
      case 'Blue':
        return TargetLabel.blue;
      case 'Green':
        return TargetLabel.green;
    }
    throw Exception('$this is not known in enum TargetLabel');
  }
}

enum TargetStatus {
  pending,
  inProgress,
  succeeded,
  failed,
  skipped,
  unknown,
  ready,
}

extension TargetStatusValueExtension on TargetStatus {
  String toValue() {
    switch (this) {
      case TargetStatus.pending:
        return 'Pending';
      case TargetStatus.inProgress:
        return 'InProgress';
      case TargetStatus.succeeded:
        return 'Succeeded';
      case TargetStatus.failed:
        return 'Failed';
      case TargetStatus.skipped:
        return 'Skipped';
      case TargetStatus.unknown:
        return 'Unknown';
      case TargetStatus.ready:
        return 'Ready';
    }
  }
}

extension TargetStatusFromString on String {
  TargetStatus toTargetStatus() {
    switch (this) {
      case 'Pending':
        return TargetStatus.pending;
      case 'InProgress':
        return TargetStatus.inProgress;
      case 'Succeeded':
        return TargetStatus.succeeded;
      case 'Failed':
        return TargetStatus.failed;
      case 'Skipped':
        return TargetStatus.skipped;
      case 'Unknown':
        return TargetStatus.unknown;
      case 'Ready':
        return TargetStatus.ready;
    }
    throw Exception('$this is not known in enum TargetStatus');
  }
}

/// A configuration that shifts traffic from one version of a Lambda function or
/// Amazon ECS task set to another in two increments. The original and target
/// Lambda function versions or ECS task sets are specified in the deployment's
/// AppSpec file.
class TimeBasedCanary {
  /// The number of minutes between the first and second traffic shifts of a
  /// <code>TimeBasedCanary</code> deployment.
  final int? canaryInterval;

  /// The percentage of traffic to shift in the first increment of a
  /// <code>TimeBasedCanary</code> deployment.
  final int? canaryPercentage;

  TimeBasedCanary({
    this.canaryInterval,
    this.canaryPercentage,
  });

  factory TimeBasedCanary.fromJson(Map<String, dynamic> json) {
    return TimeBasedCanary(
      canaryInterval: json['canaryInterval'] as int?,
      canaryPercentage: json['canaryPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final canaryInterval = this.canaryInterval;
    final canaryPercentage = this.canaryPercentage;
    return {
      if (canaryInterval != null) 'canaryInterval': canaryInterval,
      if (canaryPercentage != null) 'canaryPercentage': canaryPercentage,
    };
  }
}

/// A configuration that shifts traffic from one version of a Lambda function or
/// ECS task set to another in equal increments, with an equal number of minutes
/// between each increment. The original and target Lambda function versions or
/// ECS task sets are specified in the deployment's AppSpec file.
class TimeBasedLinear {
  /// The number of minutes between each incremental traffic shift of a
  /// <code>TimeBasedLinear</code> deployment.
  final int? linearInterval;

  /// The percentage of traffic that is shifted at the start of each increment of
  /// a <code>TimeBasedLinear</code> deployment.
  final int? linearPercentage;

  TimeBasedLinear({
    this.linearInterval,
    this.linearPercentage,
  });

  factory TimeBasedLinear.fromJson(Map<String, dynamic> json) {
    return TimeBasedLinear(
      linearInterval: json['linearInterval'] as int?,
      linearPercentage: json['linearPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final linearInterval = this.linearInterval;
    final linearPercentage = this.linearPercentage;
    return {
      if (linearInterval != null) 'linearInterval': linearInterval,
      if (linearPercentage != null) 'linearPercentage': linearPercentage,
    };
  }
}

/// Information about a time range.
class TimeRange {
  /// The end time of the time range.
  /// <note>
  /// Specify null to leave the end time open-ended.
  /// </note>
  final DateTime? end;

  /// The start time of the time range.
  /// <note>
  /// Specify null to leave the start time open-ended.
  /// </note>
  final DateTime? start;

  TimeRange({
    this.end,
    this.start,
  });

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'end': unixTimestampToJson(end),
      if (start != null) 'start': unixTimestampToJson(start),
    };
  }
}

/// Information about a listener. The listener contains the path used to route
/// traffic that is received from the load balancer to a target group.
class TrafficRoute {
  /// The Amazon Resource Name (ARN) of one listener. The listener identifies the
  /// route between a target group and a load balancer. This is an array of
  /// strings with a maximum size of one.
  final List<String>? listenerArns;

  TrafficRoute({
    this.listenerArns,
  });

  factory TrafficRoute.fromJson(Map<String, dynamic> json) {
    return TrafficRoute(
      listenerArns: (json['listenerArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listenerArns = this.listenerArns;
    return {
      if (listenerArns != null) 'listenerArns': listenerArns,
    };
  }
}

/// The configuration that specifies how traffic is shifted from one version of
/// a Lambda function to another version during an Lambda deployment, or from
/// one Amazon ECS task set to another during an Amazon ECS deployment.
class TrafficRoutingConfig {
  /// A configuration that shifts traffic from one version of a Lambda function or
  /// ECS task set to another in two increments. The original and target Lambda
  /// function versions or ECS task sets are specified in the deployment's AppSpec
  /// file.
  final TimeBasedCanary? timeBasedCanary;

  /// A configuration that shifts traffic from one version of a Lambda function or
  /// Amazon ECS task set to another in equal increments, with an equal number of
  /// minutes between each increment. The original and target Lambda function
  /// versions or Amazon ECS task sets are specified in the deployment's AppSpec
  /// file.
  final TimeBasedLinear? timeBasedLinear;

  /// The type of traffic shifting (<code>TimeBasedCanary</code> or
  /// <code>TimeBasedLinear</code>) used by a deployment configuration.
  final TrafficRoutingType? type;

  TrafficRoutingConfig({
    this.timeBasedCanary,
    this.timeBasedLinear,
    this.type,
  });

  factory TrafficRoutingConfig.fromJson(Map<String, dynamic> json) {
    return TrafficRoutingConfig(
      timeBasedCanary: json['timeBasedCanary'] != null
          ? TimeBasedCanary.fromJson(
              json['timeBasedCanary'] as Map<String, dynamic>)
          : null,
      timeBasedLinear: json['timeBasedLinear'] != null
          ? TimeBasedLinear.fromJson(
              json['timeBasedLinear'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toTrafficRoutingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeBasedCanary = this.timeBasedCanary;
    final timeBasedLinear = this.timeBasedLinear;
    final type = this.type;
    return {
      if (timeBasedCanary != null) 'timeBasedCanary': timeBasedCanary,
      if (timeBasedLinear != null) 'timeBasedLinear': timeBasedLinear,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum TrafficRoutingType {
  timeBasedCanary,
  timeBasedLinear,
  allAtOnce,
}

extension TrafficRoutingTypeValueExtension on TrafficRoutingType {
  String toValue() {
    switch (this) {
      case TrafficRoutingType.timeBasedCanary:
        return 'TimeBasedCanary';
      case TrafficRoutingType.timeBasedLinear:
        return 'TimeBasedLinear';
      case TrafficRoutingType.allAtOnce:
        return 'AllAtOnce';
    }
  }
}

extension TrafficRoutingTypeFromString on String {
  TrafficRoutingType toTrafficRoutingType() {
    switch (this) {
      case 'TimeBasedCanary':
        return TrafficRoutingType.timeBasedCanary;
      case 'TimeBasedLinear':
        return TrafficRoutingType.timeBasedLinear;
      case 'AllAtOnce':
        return TrafficRoutingType.allAtOnce;
    }
    throw Exception('$this is not known in enum TrafficRoutingType');
  }
}

/// Information about notification triggers for the deployment group.
class TriggerConfig {
  /// The event type or types for which notifications are triggered.
  final List<TriggerEventType>? triggerEvents;

  /// The name of the notification trigger.
  final String? triggerName;

  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// topic through which notifications about deployment or instance events are
  /// sent.
  final String? triggerTargetArn;

  TriggerConfig({
    this.triggerEvents,
    this.triggerName,
    this.triggerTargetArn,
  });

  factory TriggerConfig.fromJson(Map<String, dynamic> json) {
    return TriggerConfig(
      triggerEvents: (json['triggerEvents'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTriggerEventType())
          .toList(),
      triggerName: json['triggerName'] as String?,
      triggerTargetArn: json['triggerTargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final triggerEvents = this.triggerEvents;
    final triggerName = this.triggerName;
    final triggerTargetArn = this.triggerTargetArn;
    return {
      if (triggerEvents != null)
        'triggerEvents': triggerEvents.map((e) => e.toValue()).toList(),
      if (triggerName != null) 'triggerName': triggerName,
      if (triggerTargetArn != null) 'triggerTargetArn': triggerTargetArn,
    };
  }
}

enum TriggerEventType {
  deploymentStart,
  deploymentSuccess,
  deploymentFailure,
  deploymentStop,
  deploymentRollback,
  deploymentReady,
  instanceStart,
  instanceSuccess,
  instanceFailure,
  instanceReady,
}

extension TriggerEventTypeValueExtension on TriggerEventType {
  String toValue() {
    switch (this) {
      case TriggerEventType.deploymentStart:
        return 'DeploymentStart';
      case TriggerEventType.deploymentSuccess:
        return 'DeploymentSuccess';
      case TriggerEventType.deploymentFailure:
        return 'DeploymentFailure';
      case TriggerEventType.deploymentStop:
        return 'DeploymentStop';
      case TriggerEventType.deploymentRollback:
        return 'DeploymentRollback';
      case TriggerEventType.deploymentReady:
        return 'DeploymentReady';
      case TriggerEventType.instanceStart:
        return 'InstanceStart';
      case TriggerEventType.instanceSuccess:
        return 'InstanceSuccess';
      case TriggerEventType.instanceFailure:
        return 'InstanceFailure';
      case TriggerEventType.instanceReady:
        return 'InstanceReady';
    }
  }
}

extension TriggerEventTypeFromString on String {
  TriggerEventType toTriggerEventType() {
    switch (this) {
      case 'DeploymentStart':
        return TriggerEventType.deploymentStart;
      case 'DeploymentSuccess':
        return TriggerEventType.deploymentSuccess;
      case 'DeploymentFailure':
        return TriggerEventType.deploymentFailure;
      case 'DeploymentStop':
        return TriggerEventType.deploymentStop;
      case 'DeploymentRollback':
        return TriggerEventType.deploymentRollback;
      case 'DeploymentReady':
        return TriggerEventType.deploymentReady;
      case 'InstanceStart':
        return TriggerEventType.instanceStart;
      case 'InstanceSuccess':
        return TriggerEventType.instanceSuccess;
      case 'InstanceFailure':
        return TriggerEventType.instanceFailure;
      case 'InstanceReady':
        return TriggerEventType.instanceReady;
    }
    throw Exception('$this is not known in enum TriggerEventType');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of an <code>UpdateDeploymentGroup</code> operation.
class UpdateDeploymentGroupOutput {
  /// If the output contains no data, and the corresponding deployment group
  /// contained at least one Auto Scaling group, CodeDeploy successfully removed
  /// all corresponding Auto Scaling lifecycle event hooks from the Amazon Web
  /// Services account. If the output contains data, CodeDeploy could not remove
  /// some Auto Scaling lifecycle event hooks from the Amazon Web Services
  /// account.
  final List<AutoScalingGroup>? hooksNotCleanedUp;

  UpdateDeploymentGroupOutput({
    this.hooksNotCleanedUp,
  });

  factory UpdateDeploymentGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDeploymentGroupOutput(
      hooksNotCleanedUp: (json['hooksNotCleanedUp'] as List?)
          ?.whereNotNull()
          .map((e) => AutoScalingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hooksNotCleanedUp = this.hooksNotCleanedUp;
    return {
      if (hooksNotCleanedUp != null) 'hooksNotCleanedUp': hooksNotCleanedUp,
    };
  }
}

/// Configure the <code>ZonalConfig</code> object if you want CodeDeploy to
/// deploy your application to one <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-availability-zones">Availability
/// Zone</a> at a time, within an Amazon Web Services Region. By deploying to
/// one Availability Zone at a time, you can expose your deployment to a
/// progressively larger audience as confidence in the deployment's performance
/// and viability grows. If you don't configure the <code>ZonalConfig</code>
/// object, CodeDeploy deploys your application to a random selection of hosts
/// across a Region.
///
/// For more information about the zonal configuration feature, see <a
/// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config">zonal
/// configuration</a> in the <i>CodeDeploy User Guide</i>.
class ZonalConfig {
  /// The period of time, in seconds, that CodeDeploy must wait after completing a
  /// deployment to the <i>first</i> Availability Zone. CodeDeploy will wait this
  /// amount of time before starting a deployment to the second Availability Zone.
  /// You might set this option if you want to allow extra bake time for the first
  /// Availability Zone. If you don't specify a value for
  /// <code>firstZoneMonitorDurationInSeconds</code>, then CodeDeploy uses the
  /// <code>monitorDurationInSeconds</code> value for the first Availability Zone.
  ///
  /// For more information about the zonal configuration feature, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config">zonal
  /// configuration</a> in the <i>CodeDeploy User Guide</i>.
  final int? firstZoneMonitorDurationInSeconds;

  /// The number or percentage of instances that must remain available per
  /// Availability Zone during a deployment. This option works in conjunction with
  /// the <code>MinimumHealthyHosts</code> option. For more information, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html#minimum-healthy-hosts-az">About
  /// the minimum number of healthy hosts per Availability Zone</a> in the
  /// <i>CodeDeploy User Guide</i>.
  ///
  /// If you don't specify the <code>minimumHealthyHostsPerZone</code> option,
  /// then CodeDeploy uses a default value of <code>0</code> percent.
  ///
  /// For more information about the zonal configuration feature, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config">zonal
  /// configuration</a> in the <i>CodeDeploy User Guide</i>.
  final MinimumHealthyHostsPerZone? minimumHealthyHostsPerZone;

  /// The period of time, in seconds, that CodeDeploy must wait after completing a
  /// deployment to an Availability Zone. CodeDeploy will wait this amount of time
  /// before starting a deployment to the next Availability Zone. Consider adding
  /// a monitor duration to give the deployment some time to prove itself (or
  /// 'bake') in one Availability Zone before it is released in the next zone. If
  /// you don't specify a <code>monitorDurationInSeconds</code>, CodeDeploy starts
  /// deploying to the next Availability Zone immediately.
  ///
  /// For more information about the zonal configuration feature, see <a
  /// href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations-create.html#zonal-config">zonal
  /// configuration</a> in the <i>CodeDeploy User Guide</i>.
  final int? monitorDurationInSeconds;

  ZonalConfig({
    this.firstZoneMonitorDurationInSeconds,
    this.minimumHealthyHostsPerZone,
    this.monitorDurationInSeconds,
  });

  factory ZonalConfig.fromJson(Map<String, dynamic> json) {
    return ZonalConfig(
      firstZoneMonitorDurationInSeconds:
          json['firstZoneMonitorDurationInSeconds'] as int?,
      minimumHealthyHostsPerZone: json['minimumHealthyHostsPerZone'] != null
          ? MinimumHealthyHostsPerZone.fromJson(
              json['minimumHealthyHostsPerZone'] as Map<String, dynamic>)
          : null,
      monitorDurationInSeconds: json['monitorDurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstZoneMonitorDurationInSeconds =
        this.firstZoneMonitorDurationInSeconds;
    final minimumHealthyHostsPerZone = this.minimumHealthyHostsPerZone;
    final monitorDurationInSeconds = this.monitorDurationInSeconds;
    return {
      if (firstZoneMonitorDurationInSeconds != null)
        'firstZoneMonitorDurationInSeconds': firstZoneMonitorDurationInSeconds,
      if (minimumHealthyHostsPerZone != null)
        'minimumHealthyHostsPerZone': minimumHealthyHostsPerZone,
      if (monitorDurationInSeconds != null)
        'monitorDurationInSeconds': monitorDurationInSeconds,
    };
  }
}

class AlarmsLimitExceededException extends _s.GenericAwsException {
  AlarmsLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'AlarmsLimitExceededException', message: message);
}

class ApplicationAlreadyExistsException extends _s.GenericAwsException {
  ApplicationAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ApplicationAlreadyExistsException',
            message: message);
}

class ApplicationDoesNotExistException extends _s.GenericAwsException {
  ApplicationDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ApplicationDoesNotExistException',
            message: message);
}

class ApplicationLimitExceededException extends _s.GenericAwsException {
  ApplicationLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ApplicationLimitExceededException',
            message: message);
}

class ApplicationNameRequiredException extends _s.GenericAwsException {
  ApplicationNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ApplicationNameRequiredException',
            message: message);
}

class ArnNotSupportedException extends _s.GenericAwsException {
  ArnNotSupportedException({String? type, String? message})
      : super(type: type, code: 'ArnNotSupportedException', message: message);
}

class BatchLimitExceededException extends _s.GenericAwsException {
  BatchLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'BatchLimitExceededException', message: message);
}

class BucketNameFilterRequiredException extends _s.GenericAwsException {
  BucketNameFilterRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'BucketNameFilterRequiredException',
            message: message);
}

class DeploymentAlreadyCompletedException extends _s.GenericAwsException {
  DeploymentAlreadyCompletedException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentAlreadyCompletedException',
            message: message);
}

class DeploymentConfigAlreadyExistsException extends _s.GenericAwsException {
  DeploymentConfigAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentConfigAlreadyExistsException',
            message: message);
}

class DeploymentConfigDoesNotExistException extends _s.GenericAwsException {
  DeploymentConfigDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentConfigDoesNotExistException',
            message: message);
}

class DeploymentConfigInUseException extends _s.GenericAwsException {
  DeploymentConfigInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentConfigInUseException',
            message: message);
}

class DeploymentConfigLimitExceededException extends _s.GenericAwsException {
  DeploymentConfigLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentConfigLimitExceededException',
            message: message);
}

class DeploymentConfigNameRequiredException extends _s.GenericAwsException {
  DeploymentConfigNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentConfigNameRequiredException',
            message: message);
}

class DeploymentDoesNotExistException extends _s.GenericAwsException {
  DeploymentDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentDoesNotExistException',
            message: message);
}

class DeploymentGroupAlreadyExistsException extends _s.GenericAwsException {
  DeploymentGroupAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentGroupAlreadyExistsException',
            message: message);
}

class DeploymentGroupDoesNotExistException extends _s.GenericAwsException {
  DeploymentGroupDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentGroupDoesNotExistException',
            message: message);
}

class DeploymentGroupLimitExceededException extends _s.GenericAwsException {
  DeploymentGroupLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentGroupLimitExceededException',
            message: message);
}

class DeploymentGroupNameRequiredException extends _s.GenericAwsException {
  DeploymentGroupNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentGroupNameRequiredException',
            message: message);
}

class DeploymentIdRequiredException extends _s.GenericAwsException {
  DeploymentIdRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentIdRequiredException',
            message: message);
}

class DeploymentIsNotInReadyStateException extends _s.GenericAwsException {
  DeploymentIsNotInReadyStateException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentIsNotInReadyStateException',
            message: message);
}

class DeploymentLimitExceededException extends _s.GenericAwsException {
  DeploymentLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentLimitExceededException',
            message: message);
}

class DeploymentNotStartedException extends _s.GenericAwsException {
  DeploymentNotStartedException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentNotStartedException',
            message: message);
}

class DeploymentTargetDoesNotExistException extends _s.GenericAwsException {
  DeploymentTargetDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentTargetDoesNotExistException',
            message: message);
}

class DeploymentTargetIdRequiredException extends _s.GenericAwsException {
  DeploymentTargetIdRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentTargetIdRequiredException',
            message: message);
}

class DeploymentTargetListSizeExceededException extends _s.GenericAwsException {
  DeploymentTargetListSizeExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DeploymentTargetListSizeExceededException',
            message: message);
}

class DescriptionTooLongException extends _s.GenericAwsException {
  DescriptionTooLongException({String? type, String? message})
      : super(
            type: type, code: 'DescriptionTooLongException', message: message);
}

class ECSServiceMappingLimitExceededException extends _s.GenericAwsException {
  ECSServiceMappingLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ECSServiceMappingLimitExceededException',
            message: message);
}

class GitHubAccountTokenDoesNotExistException extends _s.GenericAwsException {
  GitHubAccountTokenDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'GitHubAccountTokenDoesNotExistException',
            message: message);
}

class GitHubAccountTokenNameRequiredException extends _s.GenericAwsException {
  GitHubAccountTokenNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'GitHubAccountTokenNameRequiredException',
            message: message);
}

class IamArnRequiredException extends _s.GenericAwsException {
  IamArnRequiredException({String? type, String? message})
      : super(type: type, code: 'IamArnRequiredException', message: message);
}

class IamSessionArnAlreadyRegisteredException extends _s.GenericAwsException {
  IamSessionArnAlreadyRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'IamSessionArnAlreadyRegisteredException',
            message: message);
}

class IamUserArnAlreadyRegisteredException extends _s.GenericAwsException {
  IamUserArnAlreadyRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'IamUserArnAlreadyRegisteredException',
            message: message);
}

class IamUserArnRequiredException extends _s.GenericAwsException {
  IamUserArnRequiredException({String? type, String? message})
      : super(
            type: type, code: 'IamUserArnRequiredException', message: message);
}

class InstanceDoesNotExistException extends _s.GenericAwsException {
  InstanceDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'InstanceDoesNotExistException',
            message: message);
}

class InstanceIdRequiredException extends _s.GenericAwsException {
  InstanceIdRequiredException({String? type, String? message})
      : super(
            type: type, code: 'InstanceIdRequiredException', message: message);
}

class InstanceLimitExceededException extends _s.GenericAwsException {
  InstanceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'InstanceLimitExceededException',
            message: message);
}

class InstanceNameAlreadyRegisteredException extends _s.GenericAwsException {
  InstanceNameAlreadyRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'InstanceNameAlreadyRegisteredException',
            message: message);
}

class InstanceNameRequiredException extends _s.GenericAwsException {
  InstanceNameRequiredException({String? type, String? message})
      : super(
            type: type,
            code: 'InstanceNameRequiredException',
            message: message);
}

class InstanceNotRegisteredException extends _s.GenericAwsException {
  InstanceNotRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'InstanceNotRegisteredException',
            message: message);
}

class InvalidAlarmConfigException extends _s.GenericAwsException {
  InvalidAlarmConfigException({String? type, String? message})
      : super(
            type: type, code: 'InvalidAlarmConfigException', message: message);
}

class InvalidApplicationNameException extends _s.GenericAwsException {
  InvalidApplicationNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApplicationNameException',
            message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidAutoRollbackConfigException extends _s.GenericAwsException {
  InvalidAutoRollbackConfigException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAutoRollbackConfigException',
            message: message);
}

class InvalidAutoScalingGroupException extends _s.GenericAwsException {
  InvalidAutoScalingGroupException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAutoScalingGroupException',
            message: message);
}

class InvalidBlueGreenDeploymentConfigurationException
    extends _s.GenericAwsException {
  InvalidBlueGreenDeploymentConfigurationException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidBlueGreenDeploymentConfigurationException',
            message: message);
}

class InvalidBucketNameFilterException extends _s.GenericAwsException {
  InvalidBucketNameFilterException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidBucketNameFilterException',
            message: message);
}

class InvalidComputePlatformException extends _s.GenericAwsException {
  InvalidComputePlatformException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidComputePlatformException',
            message: message);
}

class InvalidDeployedStateFilterException extends _s.GenericAwsException {
  InvalidDeployedStateFilterException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeployedStateFilterException',
            message: message);
}

class InvalidDeploymentConfigNameException extends _s.GenericAwsException {
  InvalidDeploymentConfigNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentConfigNameException',
            message: message);
}

class InvalidDeploymentGroupNameException extends _s.GenericAwsException {
  InvalidDeploymentGroupNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentGroupNameException',
            message: message);
}

class InvalidDeploymentIdException extends _s.GenericAwsException {
  InvalidDeploymentIdException({String? type, String? message})
      : super(
            type: type, code: 'InvalidDeploymentIdException', message: message);
}

class InvalidDeploymentInstanceTypeException extends _s.GenericAwsException {
  InvalidDeploymentInstanceTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentInstanceTypeException',
            message: message);
}

class InvalidDeploymentStatusException extends _s.GenericAwsException {
  InvalidDeploymentStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentStatusException',
            message: message);
}

class InvalidDeploymentStyleException extends _s.GenericAwsException {
  InvalidDeploymentStyleException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentStyleException',
            message: message);
}

class InvalidDeploymentTargetIdException extends _s.GenericAwsException {
  InvalidDeploymentTargetIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentTargetIdException',
            message: message);
}

class InvalidDeploymentWaitTypeException extends _s.GenericAwsException {
  InvalidDeploymentWaitTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDeploymentWaitTypeException',
            message: message);
}

class InvalidEC2TagCombinationException extends _s.GenericAwsException {
  InvalidEC2TagCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEC2TagCombinationException',
            message: message);
}

class InvalidEC2TagException extends _s.GenericAwsException {
  InvalidEC2TagException({String? type, String? message})
      : super(type: type, code: 'InvalidEC2TagException', message: message);
}

class InvalidECSServiceException extends _s.GenericAwsException {
  InvalidECSServiceException({String? type, String? message})
      : super(type: type, code: 'InvalidECSServiceException', message: message);
}

class InvalidExternalIdException extends _s.GenericAwsException {
  InvalidExternalIdException({String? type, String? message})
      : super(type: type, code: 'InvalidExternalIdException', message: message);
}

class InvalidFileExistsBehaviorException extends _s.GenericAwsException {
  InvalidFileExistsBehaviorException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidFileExistsBehaviorException',
            message: message);
}

class InvalidGitHubAccountTokenException extends _s.GenericAwsException {
  InvalidGitHubAccountTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGitHubAccountTokenException',
            message: message);
}

class InvalidGitHubAccountTokenNameException extends _s.GenericAwsException {
  InvalidGitHubAccountTokenNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidGitHubAccountTokenNameException',
            message: message);
}

class InvalidIamSessionArnException extends _s.GenericAwsException {
  InvalidIamSessionArnException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidIamSessionArnException',
            message: message);
}

class InvalidIamUserArnException extends _s.GenericAwsException {
  InvalidIamUserArnException({String? type, String? message})
      : super(type: type, code: 'InvalidIamUserArnException', message: message);
}

class InvalidIgnoreApplicationStopFailuresValueException
    extends _s.GenericAwsException {
  InvalidIgnoreApplicationStopFailuresValueException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidIgnoreApplicationStopFailuresValueException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidInstanceNameException extends _s.GenericAwsException {
  InvalidInstanceNameException({String? type, String? message})
      : super(
            type: type, code: 'InvalidInstanceNameException', message: message);
}

class InvalidInstanceStatusException extends _s.GenericAwsException {
  InvalidInstanceStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidInstanceStatusException',
            message: message);
}

class InvalidInstanceTypeException extends _s.GenericAwsException {
  InvalidInstanceTypeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidInstanceTypeException', message: message);
}

class InvalidKeyPrefixFilterException extends _s.GenericAwsException {
  InvalidKeyPrefixFilterException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidKeyPrefixFilterException',
            message: message);
}

class InvalidLifecycleEventHookExecutionIdException
    extends _s.GenericAwsException {
  InvalidLifecycleEventHookExecutionIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLifecycleEventHookExecutionIdException',
            message: message);
}

class InvalidLifecycleEventHookExecutionStatusException
    extends _s.GenericAwsException {
  InvalidLifecycleEventHookExecutionStatusException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLifecycleEventHookExecutionStatusException',
            message: message);
}

class InvalidLoadBalancerInfoException extends _s.GenericAwsException {
  InvalidLoadBalancerInfoException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLoadBalancerInfoException',
            message: message);
}

class InvalidMinimumHealthyHostValueException extends _s.GenericAwsException {
  InvalidMinimumHealthyHostValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidMinimumHealthyHostValueException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidOnPremisesTagCombinationException extends _s.GenericAwsException {
  InvalidOnPremisesTagCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidOnPremisesTagCombinationException',
            message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidRegistrationStatusException extends _s.GenericAwsException {
  InvalidRegistrationStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRegistrationStatusException',
            message: message);
}

class InvalidRevisionException extends _s.GenericAwsException {
  InvalidRevisionException({String? type, String? message})
      : super(type: type, code: 'InvalidRevisionException', message: message);
}

class InvalidRoleException extends _s.GenericAwsException {
  InvalidRoleException({String? type, String? message})
      : super(type: type, code: 'InvalidRoleException', message: message);
}

class InvalidSortByException extends _s.GenericAwsException {
  InvalidSortByException({String? type, String? message})
      : super(type: type, code: 'InvalidSortByException', message: message);
}

class InvalidSortOrderException extends _s.GenericAwsException {
  InvalidSortOrderException({String? type, String? message})
      : super(type: type, code: 'InvalidSortOrderException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class InvalidTagFilterException extends _s.GenericAwsException {
  InvalidTagFilterException({String? type, String? message})
      : super(type: type, code: 'InvalidTagFilterException', message: message);
}

class InvalidTagsToAddException extends _s.GenericAwsException {
  InvalidTagsToAddException({String? type, String? message})
      : super(type: type, code: 'InvalidTagsToAddException', message: message);
}

class InvalidTargetFilterNameException extends _s.GenericAwsException {
  InvalidTargetFilterNameException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTargetFilterNameException',
            message: message);
}

class InvalidTargetGroupPairException extends _s.GenericAwsException {
  InvalidTargetGroupPairException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTargetGroupPairException',
            message: message);
}

class InvalidTargetInstancesException extends _s.GenericAwsException {
  InvalidTargetInstancesException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTargetInstancesException',
            message: message);
}

class InvalidTimeRangeException extends _s.GenericAwsException {
  InvalidTimeRangeException({String? type, String? message})
      : super(type: type, code: 'InvalidTimeRangeException', message: message);
}

class InvalidTrafficRoutingConfigurationException
    extends _s.GenericAwsException {
  InvalidTrafficRoutingConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTrafficRoutingConfigurationException',
            message: message);
}

class InvalidTriggerConfigException extends _s.GenericAwsException {
  InvalidTriggerConfigException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidTriggerConfigException',
            message: message);
}

class InvalidUpdateOutdatedInstancesOnlyValueException
    extends _s.GenericAwsException {
  InvalidUpdateOutdatedInstancesOnlyValueException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidUpdateOutdatedInstancesOnlyValueException',
            message: message);
}

class InvalidZonalDeploymentConfigurationException
    extends _s.GenericAwsException {
  InvalidZonalDeploymentConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidZonalDeploymentConfigurationException',
            message: message);
}

class LifecycleEventAlreadyCompletedException extends _s.GenericAwsException {
  LifecycleEventAlreadyCompletedException({String? type, String? message})
      : super(
            type: type,
            code: 'LifecycleEventAlreadyCompletedException',
            message: message);
}

class LifecycleHookLimitExceededException extends _s.GenericAwsException {
  LifecycleHookLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'LifecycleHookLimitExceededException',
            message: message);
}

class MultipleIamArnsProvidedException extends _s.GenericAwsException {
  MultipleIamArnsProvidedException({String? type, String? message})
      : super(
            type: type,
            code: 'MultipleIamArnsProvidedException',
            message: message);
}

class OperationNotSupportedException extends _s.GenericAwsException {
  OperationNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotSupportedException',
            message: message);
}

class ResourceArnRequiredException extends _s.GenericAwsException {
  ResourceArnRequiredException({String? type, String? message})
      : super(
            type: type, code: 'ResourceArnRequiredException', message: message);
}

class ResourceValidationException extends _s.GenericAwsException {
  ResourceValidationException({String? type, String? message})
      : super(
            type: type, code: 'ResourceValidationException', message: message);
}

class RevisionDoesNotExistException extends _s.GenericAwsException {
  RevisionDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'RevisionDoesNotExistException',
            message: message);
}

class RevisionRequiredException extends _s.GenericAwsException {
  RevisionRequiredException({String? type, String? message})
      : super(type: type, code: 'RevisionRequiredException', message: message);
}

class RoleRequiredException extends _s.GenericAwsException {
  RoleRequiredException({String? type, String? message})
      : super(type: type, code: 'RoleRequiredException', message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagRequiredException extends _s.GenericAwsException {
  TagRequiredException({String? type, String? message})
      : super(type: type, code: 'TagRequiredException', message: message);
}

class TagSetListLimitExceededException extends _s.GenericAwsException {
  TagSetListLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TagSetListLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TriggerTargetsLimitExceededException extends _s.GenericAwsException {
  TriggerTargetsLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TriggerTargetsLimitExceededException',
            message: message);
}

class UnsupportedActionForDeploymentTypeException
    extends _s.GenericAwsException {
  UnsupportedActionForDeploymentTypeException({String? type, String? message})
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
  'InvalidZonalDeploymentConfigurationException': (type, message) =>
      InvalidZonalDeploymentConfigurationException(
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
