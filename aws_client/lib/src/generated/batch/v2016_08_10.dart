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

/// Using Batch, you can run batch computing workloads on the Amazon Web
/// Services Cloud. Batch computing is a common means for developers,
/// scientists, and engineers to access large amounts of compute resources.
/// Batch uses the advantages of the batch computing to remove the
/// undifferentiated heavy lifting of configuring and managing required
/// infrastructure. At the same time, it also adopts a familiar batch computing
/// software approach. You can use Batch to efficiently provision resources, and
/// work toward eliminating capacity constraints, reducing your overall compute
/// costs, and delivering results more quickly.
class Batch {
  final _s.RestJsonProtocol _protocol;
  Batch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'batch',
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

  /// Cancels a job in an Batch job queue. Jobs that are in the
  /// <code>SUBMITTED</code> or <code>PENDING</code> are canceled. A job
  /// in<code>RUNNABLE</code> remains in <code>RUNNABLE</code> until it reaches
  /// the head of the job queue. Then the job status is updated to
  /// <code>FAILED</code>.
  /// <note>
  /// A <code>PENDING</code> job is canceled after all dependency jobs are
  /// completed. Therefore, it may take longer than expected to cancel a job in
  /// <code>PENDING</code> status.
  ///
  /// When you try to cancel an array parent job in <code>PENDING</code>, Batch
  /// attempts to cancel all child jobs. The array parent job is canceled when
  /// all child jobs are completed.
  /// </note>
  /// Jobs that progressed to the <code>STARTING</code> or <code>RUNNING</code>
  /// state aren't canceled. However, the API operation still succeeds, even if
  /// no job is canceled. These jobs must be terminated with the
  /// <a>TerminateJob</a> operation.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobId] :
  /// The Batch job ID of the job to cancel.
  ///
  /// Parameter [reason] :
  /// A message to attach to the job that explains the reason for canceling it.
  /// This message is returned by future <a>DescribeJobs</a> operations on the
  /// job. This message is also recorded in the Batch activity logs.
  Future<void> cancelJob({
    required String jobId,
    required String reason,
  }) async {
    final $payload = <String, dynamic>{
      'jobId': jobId,
      'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/canceljob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an Batch compute environment. You can create <code>MANAGED</code>
  /// or <code>UNMANAGED</code> compute environments. <code>MANAGED</code>
  /// compute environments can use Amazon EC2 or Fargate resources.
  /// <code>UNMANAGED</code> compute environments can only use EC2 resources.
  ///
  /// In a managed compute environment, Batch manages the capacity and instance
  /// types of the compute resources within the environment. This is based on
  /// the compute resource specification that you define or the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch
  /// template</a> that you specify when you create the compute environment.
  /// Either, you can choose to use EC2 On-Demand Instances and EC2 Spot
  /// Instances. Or, you can use Fargate and Fargate Spot capacity in your
  /// managed compute environment. You can optionally set a maximum price so
  /// that Spot Instances only launch when the Spot Instance price is less than
  /// a specified percentage of the On-Demand price.
  /// <note>
  /// Multi-node parallel jobs aren't supported on Spot Instances.
  /// </note>
  /// In an unmanaged compute environment, you can manage your own EC2 compute
  /// resources and have flexibility with how you configure your compute
  /// resources. For example, you can use custom AMIs. However, you must verify
  /// that each of your AMIs meet the Amazon ECS container instance AMI
  /// specification. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container_instance_AMIs.html">container
  /// instance AMIs</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>. After you created your unmanaged compute environment, you can
  /// use the <a>DescribeComputeEnvironments</a> operation to find the Amazon
  /// ECS cluster that's associated with it. Then, launch your container
  /// instances into that Amazon ECS cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html">Launching
  /// an Amazon ECS container instance</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// <note>
  /// To create a compute environment that uses EKS resources, the caller must
  /// have permissions to call <code>eks:DescribeCluster</code>.
  /// </note> <note>
  /// Batch doesn't automatically upgrade the AMIs in a compute environment
  /// after it's created. For example, it also doesn't update the AMIs in your
  /// compute environment when a newer version of the Amazon ECS optimized AMI
  /// is available. You're responsible for the management of the guest operating
  /// system. This includes any updates and security patches. You're also
  /// responsible for any additional application software or utilities that you
  /// install on the compute resources. There are two ways to use a new AMI for
  /// your Batch jobs. The original method is to complete these steps:
  /// <ol>
  /// <li>
  /// Create a new compute environment with the new AMI.
  /// </li>
  /// <li>
  /// Add the compute environment to an existing job queue.
  /// </li>
  /// <li>
  /// Remove the earlier compute environment from your job queue.
  /// </li>
  /// <li>
  /// Delete the earlier compute environment.
  /// </li> </ol>
  /// In April 2022, Batch added enhanced support for updating compute
  /// environments. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a>. To use the enhanced updating of compute
  /// environments to update AMIs, follow these rules:
  ///
  /// <ul>
  /// <li>
  /// Either don't set the service role (<code>serviceRole</code>) parameter or
  /// set it to the <b>AWSBatchServiceRole</b> service-linked role.
  /// </li>
  /// <li>
  /// Set the allocation strategy (<code>allocationStrategy</code>) parameter to
  /// <code>BEST_FIT_PROGRESSIVE</code>, <code>SPOT_CAPACITY_OPTIMIZED</code>,
  /// or <code>SPOT_PRICE_CAPACITY_OPTIMIZED</code>.
  /// </li>
  /// <li>
  /// Set the update to latest image version
  /// (<code>updateToLatestImageVersion</code>) parameter to <code>true</code>.
  /// The <code>updateToLatestImageVersion</code> parameter is used when you
  /// update a compute environment. This parameter is ignored when you create a
  /// compute environment.
  /// </li>
  /// <li>
  /// Don't specify an AMI ID in <code>imageId</code>,
  /// <code>imageIdOverride</code> (in <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_Ec2Configuration.html">
  /// <code>ec2Configuration</code> </a>), or in the launch template
  /// (<code>launchTemplate</code>). In that case, Batch selects the latest
  /// Amazon ECS optimized AMI that's supported by Batch at the time the
  /// infrastructure update is initiated. Alternatively, you can specify the AMI
  /// ID in the <code>imageId</code> or <code>imageIdOverride</code> parameters,
  /// or the launch template identified by the <code>LaunchTemplate</code>
  /// properties. Changing any of these properties starts an infrastructure
  /// update. If the AMI ID is specified in the launch template, it can't be
  /// replaced by specifying an AMI ID in either the <code>imageId</code> or
  /// <code>imageIdOverride</code> parameters. It can only be replaced by
  /// specifying a different launch template, or if the launch template version
  /// is set to <code>$Default</code> or <code>$Latest</code>, by setting either
  /// a new default version for the launch template (if <code>$Default</code>)
  /// or by adding a new version to the launch template (if
  /// <code>$Latest</code>).
  /// </li>
  /// </ul>
  /// If these rules are followed, any update that starts an infrastructure
  /// update causes the AMI ID to be re-selected. If the <code>version</code>
  /// setting in the launch template (<code>launchTemplate</code>) is set to
  /// <code>$Latest</code> or <code>$Default</code>, the latest or default
  /// version of the launch template is evaluated up at the time of the
  /// infrastructure update, even if the <code>launchTemplate</code> wasn't
  /// updated.
  /// </note>
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironmentName] :
  /// The name for your compute environment. It can be up to 128 characters
  /// long. It can contain uppercase and lowercase letters, numbers, hyphens
  /// (-), and underscores (_).
  ///
  /// Parameter [type] :
  /// The type of the compute environment: <code>MANAGED</code> or
  /// <code>UNMANAGED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// Environments</a> in the <i>Batch User Guide</i>.
  ///
  /// Parameter [computeResources] :
  /// Details about the compute resources managed by the compute environment.
  /// This parameter is required for managed compute environments. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// Environments</a> in the <i>Batch User Guide</i>.
  ///
  /// Parameter [eksConfiguration] :
  /// The details for the Amazon EKS cluster that supports the compute
  /// environment.
  ///
  /// Parameter [serviceRole] :
  /// The full Amazon Resource Name (ARN) of the IAM role that allows Batch to
  /// make calls to other Amazon Web Services services on your behalf. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/service_IAM_role.html">Batch
  /// service IAM role</a> in the <i>Batch User Guide</i>.
  /// <important>
  /// If your account already created the Batch service-linked role, that role
  /// is used by default for your compute environment unless you specify a
  /// different role here. If the Batch service-linked role doesn't exist in
  /// your account, and no role is specified here, the service attempts to
  /// create the Batch service-linked role in your account.
  /// </important>
  /// If your specified role has a path other than <code>/</code>, then you must
  /// specify either the full role ARN (recommended) or prefix the role name
  /// with the path. For example, if a role with the name <code>bar</code> has a
  /// path of <code>/foo/</code>, specify <code>/foo/bar</code> as the role
  /// name. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names">Friendly
  /// names and paths</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Depending on how you created your Batch service role, its ARN might
  /// contain the <code>service-role</code> path prefix. When you only specify
  /// the name of the service role, Batch assumes that your ARN doesn't use the
  /// <code>service-role</code> path prefix. Because of this, we recommend that
  /// you specify the full ARN of your service role when you create compute
  /// environments.
  /// </note>
  ///
  /// Parameter [state] :
  /// The state of the compute environment. If the state is
  /// <code>ENABLED</code>, then the compute environment accepts jobs from a
  /// queue and can scale out automatically based on queues.
  ///
  /// If the state is <code>ENABLED</code>, then the Batch scheduler can attempt
  /// to place jobs from an associated job queue on the compute resources within
  /// the environment. If the compute environment is managed, then it can scale
  /// its instances out or in automatically, based on the job queue demand.
  ///
  /// If the state is <code>DISABLED</code>, then the Batch scheduler doesn't
  /// attempt to place jobs within the environment. Jobs in a
  /// <code>STARTING</code> or <code>RUNNING</code> state continue to progress
  /// normally. Managed compute environments in the <code>DISABLED</code> state
  /// don't scale out.
  /// <note>
  /// Compute environments in a <code>DISABLED</code> state may continue to
  /// incur billing charges. To prevent additional charges, turn off and then
  /// delete the compute environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environment_parameters.html#compute_environment_state">State</a>
  /// in the <i>Batch User Guide</i>.
  /// </note>
  /// When an instance is idle, the instance scales down to the
  /// <code>minvCpus</code> value. However, the instance size doesn't change.
  /// For example, consider a <code>c5.8xlarge</code> instance with a
  /// <code>minvCpus</code> value of <code>4</code> and a
  /// <code>desiredvCpus</code> value of <code>36</code>. This instance doesn't
  /// scale down to a <code>c5.large</code> instance.
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the compute environment to help you categorize
  /// and organize your resources. Each tag consists of a key and an optional
  /// value. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// These tags can be updated or removed using the <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_TagResource.html">TagResource</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_UntagResource.html">UntagResource</a>
  /// API operations. These tags don't propagate to the underlying compute
  /// resources.
  ///
  /// Parameter [unmanagedvCpus] :
  /// The maximum number of vCPUs for an unmanaged compute environment. This
  /// parameter is only used for fair share scheduling to reserve vCPU capacity
  /// for new share identifiers. If this parameter isn't provided for a fair
  /// share job queue, no vCPU capacity is reserved.
  /// <note>
  /// This parameter is only supported when the <code>type</code> parameter is
  /// set to <code>UNMANAGED</code>.
  /// </note>
  Future<CreateComputeEnvironmentResponse> createComputeEnvironment({
    required String computeEnvironmentName,
    required CEType type,
    ComputeResource? computeResources,
    EksConfiguration? eksConfiguration,
    String? serviceRole,
    CEState? state,
    Map<String, String>? tags,
    int? unmanagedvCpus,
  }) async {
    final $payload = <String, dynamic>{
      'computeEnvironmentName': computeEnvironmentName,
      'type': type.toValue(),
      if (computeResources != null) 'computeResources': computeResources,
      if (eksConfiguration != null) 'eksConfiguration': eksConfiguration,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (unmanagedvCpus != null) 'unmanagedvCpus': unmanagedvCpus,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/createcomputeenvironment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComputeEnvironmentResponse.fromJson(response);
  }

  /// Creates an Batch job queue. When you create a job queue, you associate one
  /// or more compute environments to the queue and assign an order of
  /// preference for the compute environments.
  ///
  /// You also set a priority to the job queue that determines the order that
  /// the Batch scheduler places jobs onto its associated compute environments.
  /// For example, if a compute environment is associated with more than one job
  /// queue, the job queue with a higher priority is given preference for
  /// scheduling jobs to that compute environment.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironmentOrder] :
  /// The set of compute environments mapped to a job queue and their order
  /// relative to each other. The job scheduler uses this parameter to determine
  /// which compute environment runs a specific job. Compute environments must
  /// be in the <code>VALID</code> state before you can associate them with a
  /// job queue. You can associate up to three compute environments with a job
  /// queue. All of the compute environments must be either EC2
  /// (<code>EC2</code> or <code>SPOT</code>) or Fargate (<code>FARGATE</code>
  /// or <code>FARGATE_SPOT</code>); EC2 and Fargate compute environments can't
  /// be mixed.
  /// <note>
  /// All compute environments that are associated with a job queue must share
  /// the same architecture. Batch doesn't support mixing compute environment
  /// architecture types in a single job queue.
  /// </note>
  ///
  /// Parameter [jobQueueName] :
  /// The name of the job queue. It can be up to 128 letters long. It can
  /// contain uppercase and lowercase letters, numbers, hyphens (-), and
  /// underscores (_).
  ///
  /// Parameter [priority] :
  /// The priority of the job queue. Job queues with a higher priority (or a
  /// higher integer value for the <code>priority</code> parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order. For example, a job queue with
  /// a priority value of <code>10</code> is given scheduling preference over a
  /// job queue with a priority value of <code>1</code>. All of the compute
  /// environments must be either EC2 (<code>EC2</code> or <code>SPOT</code>) or
  /// Fargate (<code>FARGATE</code> or <code>FARGATE_SPOT</code>); EC2 and
  /// Fargate compute environments can't be mixed.
  ///
  /// Parameter [jobStateTimeLimitActions] :
  /// The set of actions that Batch performs on jobs that remain at the head of
  /// the job queue in the specified state longer than specified times. Batch
  /// will perform each action after <code>maxTimeSeconds</code> has passed.
  ///
  /// Parameter [schedulingPolicyArn] :
  /// The Amazon Resource Name (ARN) of the fair share scheduling policy. If
  /// this parameter is specified, the job queue uses a fair share scheduling
  /// policy. If this parameter isn't specified, the job queue uses a first in,
  /// first out (FIFO) scheduling policy. After a job queue is created, you can
  /// replace but can't remove the fair share scheduling policy. The format is
  /// <code>aws:<i>Partition</i>:batch:<i>Region</i>:<i>Account</i>:scheduling-policy/<i>Name</i>
  /// </code>. An example is
  /// <code>aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy</code>.
  ///
  /// Parameter [state] :
  /// The state of the job queue. If the job queue state is
  /// <code>ENABLED</code>, it is able to accept jobs. If the job queue state is
  /// <code>DISABLED</code>, new jobs can't be added to the queue, but jobs
  /// already in the queue can finish.
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the job queue to help you categorize and
  /// organize your resources. Each tag consists of a key and an optional value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/using-tags.html">Tagging
  /// your Batch resources</a> in <i>Batch User Guide</i>.
  Future<CreateJobQueueResponse> createJobQueue({
    required List<ComputeEnvironmentOrder> computeEnvironmentOrder,
    required String jobQueueName,
    required int priority,
    List<JobStateTimeLimitAction>? jobStateTimeLimitActions,
    String? schedulingPolicyArn,
    JQState? state,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'computeEnvironmentOrder': computeEnvironmentOrder,
      'jobQueueName': jobQueueName,
      'priority': priority,
      if (jobStateTimeLimitActions != null)
        'jobStateTimeLimitActions': jobStateTimeLimitActions,
      if (schedulingPolicyArn != null)
        'schedulingPolicyArn': schedulingPolicyArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/createjobqueue',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobQueueResponse.fromJson(response);
  }

  /// Creates an Batch scheduling policy.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [name] :
  /// The name of the scheduling policy. It can be up to 128 letters long. It
  /// can contain uppercase and lowercase letters, numbers, hyphens (-), and
  /// underscores (_).
  ///
  /// Parameter [fairsharePolicy] :
  /// The fair share policy of the scheduling policy.
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the scheduling policy to help you categorize
  /// and organize your resources. Each tag consists of a key and an optional
  /// value. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// These tags can be updated or removed using the <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_TagResource.html">TagResource</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_UntagResource.html">UntagResource</a>
  /// API operations.
  Future<CreateSchedulingPolicyResponse> createSchedulingPolicy({
    required String name,
    FairsharePolicy? fairsharePolicy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (fairsharePolicy != null) 'fairsharePolicy': fairsharePolicy,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/createschedulingpolicy',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSchedulingPolicyResponse.fromJson(response);
  }

  /// Deletes an Batch compute environment.
  ///
  /// Before you can delete a compute environment, you must set its state to
  /// <code>DISABLED</code> with the <a>UpdateComputeEnvironment</a> API
  /// operation and disassociate it from any job queues with the
  /// <a>UpdateJobQueue</a> API operation. Compute environments that use Fargate
  /// resources must terminate all active jobs on that compute environment
  /// before deleting the compute environment. If this isn't done, the compute
  /// environment enters an invalid state.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironment] :
  /// The name or Amazon Resource Name (ARN) of the compute environment to
  /// delete.
  Future<void> deleteComputeEnvironment({
    required String computeEnvironment,
  }) async {
    final $payload = <String, dynamic>{
      'computeEnvironment': computeEnvironment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deletecomputeenvironment',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified job queue. You must first disable submissions for a
  /// queue with the <a>UpdateJobQueue</a> operation. All jobs in the queue are
  /// eventually terminated when you delete a job queue. The jobs are terminated
  /// at a rate of about 16 jobs each second.
  ///
  /// It's not necessary to disassociate compute environments from a queue
  /// before submitting a <code>DeleteJobQueue</code> request.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobQueue] :
  /// The short name or full Amazon Resource Name (ARN) of the queue to delete.
  Future<void> deleteJobQueue({
    required String jobQueue,
  }) async {
    final $payload = <String, dynamic>{
      'jobQueue': jobQueue,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deletejobqueue',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified scheduling policy.
  ///
  /// You can't delete a scheduling policy that's used in any job queues.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the scheduling policy to delete.
  Future<void> deleteSchedulingPolicy({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deleteschedulingpolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters an Batch job definition. Job definitions are permanently
  /// deleted after 180 days.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinition] :
  /// The name and revision (<code>name:revision</code>) or full Amazon Resource
  /// Name (ARN) of the job definition to deregister.
  Future<void> deregisterJobDefinition({
    required String jobDefinition,
  }) async {
    final $payload = <String, dynamic>{
      'jobDefinition': jobDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deregisterjobdefinition',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes one or more of your compute environments.
  ///
  /// If you're using an unmanaged compute environment, you can use the
  /// <code>DescribeComputeEnvironment</code> operation to determine the
  /// <code>ecsClusterArn</code> that you launch your Amazon ECS container
  /// instances into.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironments] :
  /// A list of up to 100 compute environment names or full Amazon Resource Name
  /// (ARN) entries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results returned by
  /// <code>DescribeComputeEnvironments</code> in paginated output. When this
  /// parameter is used, <code>DescribeComputeEnvironments</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeComputeEnvironments</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>DescribeComputeEnvironments</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeComputeEnvironments</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is
  /// <code>null</code> when there are no more results to return.
  /// <note>
  /// Treat this token as an opaque identifier that's only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeComputeEnvironmentsResponse> describeComputeEnvironments({
    List<String>? computeEnvironments,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (computeEnvironments != null)
        'computeEnvironments': computeEnvironments,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/describecomputeenvironments',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeComputeEnvironmentsResponse.fromJson(response);
  }

  /// Describes a list of job definitions. You can specify a <code>status</code>
  /// (such as <code>ACTIVE</code>) to only return job definitions that match
  /// that status.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinitionName] :
  /// The name of the job definition to describe.
  ///
  /// Parameter [jobDefinitions] :
  /// A list of up to 100 job definitions. Each entry in the list can either be
  /// an ARN in the format
  /// <code>arn:aws:batch:${Region}:${Account}:job-definition/${JobDefinitionName}:${Revision}</code>
  /// or a short version using the form
  /// <code>${JobDefinitionName}:${Revision}</code>. This parameter can't be
  /// used with other parameters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by
  /// <code>DescribeJobDefinitions</code> in paginated output. When this
  /// parameter is used, <code>DescribeJobDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page and a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeJobDefinitions</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>DescribeJobDefinitions</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeJobDefinitions</code> request where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// Treat this token as an opaque identifier that's only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [status] :
  /// The status used to filter job definitions.
  Future<DescribeJobDefinitionsResponse> describeJobDefinitions({
    String? jobDefinitionName,
    List<String>? jobDefinitions,
    int? maxResults,
    String? nextToken,
    String? status,
  }) async {
    final $payload = <String, dynamic>{
      if (jobDefinitionName != null) 'jobDefinitionName': jobDefinitionName,
      if (jobDefinitions != null) 'jobDefinitions': jobDefinitions,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (status != null) 'status': status,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/describejobdefinitions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobDefinitionsResponse.fromJson(response);
  }

  /// Describes one or more of your job queues.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobQueues] :
  /// A list of up to 100 queue names or full queue Amazon Resource Name (ARN)
  /// entries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by <code>DescribeJobQueues</code>
  /// in paginated output. When this parameter is used,
  /// <code>DescribeJobQueues</code> only returns <code>maxResults</code>
  /// results in a single page and a <code>nextToken</code> response element.
  /// The remaining results of the initial request can be seen by sending
  /// another <code>DescribeJobQueues</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, then <code>DescribeJobQueues</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeJobQueues</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// Treat this token as an opaque identifier that's only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeJobQueuesResponse> describeJobQueues({
    List<String>? jobQueues,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (jobQueues != null) 'jobQueues': jobQueues,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/describejobqueues',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobQueuesResponse.fromJson(response);
  }

  /// Describes a list of Batch jobs.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobs] :
  /// A list of up to 100 job IDs.
  Future<DescribeJobsResponse> describeJobs({
    required List<String> jobs,
  }) async {
    final $payload = <String, dynamic>{
      'jobs': jobs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/describejobs',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobsResponse.fromJson(response);
  }

  /// Describes one or more of your scheduling policies.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [arns] :
  /// A list of up to 100 scheduling policy Amazon Resource Name (ARN) entries.
  Future<DescribeSchedulingPoliciesResponse> describeSchedulingPolicies({
    required List<String> arns,
  }) async {
    final $payload = <String, dynamic>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/describeschedulingpolicies',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSchedulingPoliciesResponse.fromJson(response);
  }

  /// Provides a list of the first 100 <code>RUNNABLE</code> jobs associated to
  /// a single job queue.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobQueue] :
  /// The job queue’s name or full queue Amazon Resource Name (ARN).
  Future<GetJobQueueSnapshotResponse> getJobQueueSnapshot({
    required String jobQueue,
  }) async {
    final $payload = <String, dynamic>{
      'jobQueue': jobQueue,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/getjobqueuesnapshot',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobQueueSnapshotResponse.fromJson(response);
  }

  /// Returns a list of Batch jobs.
  ///
  /// You must specify only one of the following items:
  ///
  /// <ul>
  /// <li>
  /// A job queue ID to return a list of jobs in that job queue
  /// </li>
  /// <li>
  /// A multi-node parallel job ID to return a list of nodes for that job
  /// </li>
  /// <li>
  /// An array job ID to return a list of the children for that job
  /// </li>
  /// </ul>
  /// You can filter the results by job status with the <code>jobStatus</code>
  /// parameter. If you don't specify a status, only <code>RUNNING</code> jobs
  /// are returned.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [arrayJobId] :
  /// The job ID for an array job. Specifying an array job ID with this
  /// parameter lists all child jobs from within the specified array.
  ///
  /// Parameter [filters] :
  /// The filter to apply to the query. Only one filter can be used at a time.
  /// When the filter is used, <code>jobStatus</code> is ignored. The filter
  /// doesn't apply to child jobs in an array or multi-node parallel (MNP) jobs.
  /// The results are sorted by the <code>createdAt</code> field, with the most
  /// recent jobs being first.
  /// <dl> <dt>JOB_NAME</dt> <dd>
  /// The value of the filter is a case-insensitive match for the job name. If
  /// the value ends with an asterisk (*), the filter matches any job name that
  /// begins with the string before the '*'. This corresponds to the
  /// <code>jobName</code> value. For example, <code>test1</code> matches both
  /// <code>Test1</code> and <code>test1</code>, and <code>test1*</code> matches
  /// both <code>test1</code> and <code>Test10</code>. When the
  /// <code>JOB_NAME</code> filter is used, the results are grouped by the job
  /// name and version.
  /// </dd> <dt>JOB_DEFINITION</dt> <dd>
  /// The value for the filter is the name or Amazon Resource Name (ARN) of the
  /// job definition. This corresponds to the <code>jobDefinition</code> value.
  /// The value is case sensitive. When the value for the filter is the job
  /// definition name, the results include all the jobs that used any revision
  /// of that job definition name. If the value ends with an asterisk (*), the
  /// filter matches any job definition name that begins with the string before
  /// the '*'. For example, <code>jd1</code> matches only <code>jd1</code>, and
  /// <code>jd1*</code> matches both <code>jd1</code> and <code>jd1A</code>. The
  /// version of the job definition that's used doesn't affect the sort order.
  /// When the <code>JOB_DEFINITION</code> filter is used and the ARN is used
  /// (which is in the form
  /// <code>arn:${Partition}:batch:${Region}:${Account}:job-definition/${JobDefinitionName}:${Revision}</code>),
  /// the results include jobs that used the specified revision of the job
  /// definition. Asterisk (*) isn't supported when the ARN is used.
  /// </dd> <dt>BEFORE_CREATED_AT</dt> <dd>
  /// The value for the filter is the time that's before the job was created.
  /// This corresponds to the <code>createdAt</code> value. The value is a
  /// string representation of the number of milliseconds since 00:00:00 UTC
  /// (midnight) on January 1, 1970.
  /// </dd> <dt>AFTER_CREATED_AT</dt> <dd>
  /// The value for the filter is the time that's after the job was created.
  /// This corresponds to the <code>createdAt</code> value. The value is a
  /// string representation of the number of milliseconds since 00:00:00 UTC
  /// (midnight) on January 1, 1970.
  /// </dd> </dl>
  ///
  /// Parameter [jobQueue] :
  /// The name or full Amazon Resource Name (ARN) of the job queue used to list
  /// jobs.
  ///
  /// Parameter [jobStatus] :
  /// The job status used to filter jobs in the specified queue. If the
  /// <code>filters</code> parameter is specified, the <code>jobStatus</code>
  /// parameter is ignored and jobs with any status are returned. If you don't
  /// specify a status, only <code>RUNNING</code> jobs are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by <code>ListJobs</code> in a
  /// paginated output. When this parameter is used, <code>ListJobs</code>
  /// returns up to <code>maxResults</code> results in a single page and a
  /// <code>nextToken</code> response element, if applicable. The remaining
  /// results of the initial request can be seen by sending another
  /// <code>ListJobs</code> request with the returned <code>nextToken</code>
  /// value.
  ///
  /// The following outlines key parameters and limitations:
  ///
  /// <ul>
  /// <li>
  /// The minimum value is 1.
  /// </li>
  /// <li>
  /// When <code>--job-status</code> is used, Batch returns up to 1000 values.
  /// </li>
  /// <li>
  /// When <code>--filters</code> is used, Batch returns up to 100 values.
  /// </li>
  /// <li>
  /// If neither parameter is used, then <code>ListJobs</code> returns up to
  /// 1000 results (jobs that are in the <code>RUNNING</code> status) and a
  /// <code>nextToken</code> value, if applicable.
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiNodeJobId] :
  /// The job ID for a multi-node parallel job. Specifying a multi-node parallel
  /// job ID with this parameter lists all nodes that are associated with the
  /// specified job.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListJobs</code> request where <code>maxResults</code> was used and
  /// the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// Treat this token as an opaque identifier that's only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListJobsResponse> listJobs({
    String? arrayJobId,
    List<KeyValuesPair>? filters,
    String? jobQueue,
    JobStatus? jobStatus,
    int? maxResults,
    String? multiNodeJobId,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (arrayJobId != null) 'arrayJobId': arrayJobId,
      if (filters != null) 'filters': filters,
      if (jobQueue != null) 'jobQueue': jobQueue,
      if (jobStatus != null) 'jobStatus': jobStatus.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (multiNodeJobId != null) 'multiNodeJobId': multiNodeJobId,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/listjobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Returns a list of Batch scheduling policies.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that's returned by
  /// <code>ListSchedulingPolicies</code> in paginated output. When this
  /// parameter is used, <code>ListSchedulingPolicies</code> only returns
  /// <code>maxResults</code> results in a single page and a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another
  /// <code>ListSchedulingPolicies</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter isn't used, <code>ListSchedulingPolicies</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a previous paginated
  /// <code>ListSchedulingPolicies</code> request where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// Treat this token as an opaque identifier that's only used to retrieve the
  /// next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListSchedulingPoliciesResponse> listSchedulingPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/listschedulingpolicies',
      exceptionFnMap: _exceptionFns,
    );
    return ListSchedulingPoliciesResponse.fromJson(response);
  }

  /// Lists the tags for an Batch resource. Batch resources that support tags
  /// are compute environments, jobs, job definitions, job queues, and
  /// scheduling policies. ARNs for child jobs of array and multi-node parallel
  /// (MNP) jobs aren't supported.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource that tags are
  /// listed for. Batch resources that support tags are compute environments,
  /// jobs, job definitions, job queues, and scheduling policies. ARNs for child
  /// jobs of array and multi-node parallel (MNP) jobs aren't supported.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Registers an Batch job definition.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinitionName] :
  /// The name of the job definition to register. It can be up to 128 letters
  /// long. It can contain uppercase and lowercase letters, numbers, hyphens
  /// (-), and underscores (_).
  ///
  /// Parameter [type] :
  /// The type of job definition. For more information about multi-node parallel
  /// jobs, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/multi-node-job-def.html">Creating
  /// a multi-node parallel job definition</a> in the <i>Batch User Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// If the value is <code>container</code>, then one of the following is
  /// required: <code>containerProperties</code>, <code>ecsProperties</code>, or
  /// <code>eksProperties</code>.
  /// </li>
  /// <li>
  /// If the value is <code>multinode</code>, then <code>nodeProperties</code>
  /// is required.
  /// </li>
  /// </ul> <note>
  /// If the job is run on Fargate resources, then <code>multinode</code> isn't
  /// supported.
  /// </note>
  ///
  /// Parameter [containerProperties] :
  /// An object with properties specific to Amazon ECS-based single-node
  /// container-based jobs. If the job definition's <code>type</code> parameter
  /// is <code>container</code>, then you must specify either
  /// <code>containerProperties</code> or <code>nodeProperties</code>. This must
  /// not be specified for Amazon EKS-based job definitions.
  /// <note>
  /// If the job runs on Fargate resources, then you must not specify
  /// <code>nodeProperties</code>; use only <code>containerProperties</code>.
  /// </note>
  ///
  /// Parameter [ecsProperties] :
  /// An object with properties that are specific to Amazon ECS-based jobs. This
  /// must not be specified for Amazon EKS-based job definitions.
  ///
  /// Parameter [eksProperties] :
  /// An object with properties that are specific to Amazon EKS-based jobs. This
  /// must not be specified for Amazon ECS based job definitions.
  ///
  /// Parameter [nodeProperties] :
  /// An object with properties specific to multi-node parallel jobs. If you
  /// specify node properties for a job, it becomes a multi-node parallel job.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/multi-node-parallel-jobs.html">Multi-node
  /// Parallel Jobs</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// If the job runs on Fargate resources, then you must not specify
  /// <code>nodeProperties</code>; use <code>containerProperties</code> instead.
  /// </note> <note>
  /// If the job runs on Amazon EKS resources, then you must not specify
  /// <code>nodeProperties</code>.
  /// </note>
  ///
  /// Parameter [parameters] :
  /// Default parameter substitution placeholders to set in the job definition.
  /// Parameters are specified as a key-value pair mapping. Parameters in a
  /// <code>SubmitJob</code> request override any corresponding parameter
  /// defaults from the job definition.
  ///
  /// Parameter [platformCapabilities] :
  /// The platform capabilities required by the job definition. If no value is
  /// specified, it defaults to <code>EC2</code>. To run the job on Fargate
  /// resources, specify <code>FARGATE</code>.
  /// <note>
  /// If the job runs on Amazon EKS resources, then you must not specify
  /// <code>platformCapabilities</code>.
  /// </note>
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the job or job definition to
  /// the corresponding Amazon ECS task. If no value is specified, the tags are
  /// not propagated. Tags can only be propagated to the tasks during task
  /// creation. For tags with the same name, job tags are given priority over
  /// job definitions tags. If the total number of combined tags from the job
  /// and job definition is over 50, the job is moved to the <code>FAILED</code>
  /// state.
  /// <note>
  /// If the job runs on Amazon EKS resources, then you must not specify
  /// <code>propagateTags</code>.
  /// </note>
  ///
  /// Parameter [retryStrategy] :
  /// The retry strategy to use for failed jobs that are submitted with this job
  /// definition. Any retry strategy that's specified during a <a>SubmitJob</a>
  /// operation overrides the retry strategy defined here. If a job is
  /// terminated due to a timeout, it isn't retried.
  ///
  /// Parameter [schedulingPriority] :
  /// The scheduling priority for jobs that are submitted with this job
  /// definition. This only affects jobs in job queues with a fair share policy.
  /// Jobs with a higher scheduling priority are scheduled before jobs with a
  /// lower scheduling priority.
  ///
  /// The minimum supported value is 0 and the maximum supported value is 9999.
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the job definition to help you categorize and
  /// organize your resources. Each tag consists of a key and an optional value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/using-tags.html">Tagging
  /// Amazon Web Services Resources</a> in <i>Batch User Guide</i>.
  ///
  /// Parameter [timeout] :
  /// The timeout configuration for jobs that are submitted with this job
  /// definition, after which Batch terminates your jobs if they have not
  /// finished. If a job is terminated due to a timeout, it isn't retried. The
  /// minimum value for the timeout is 60 seconds. Any timeout configuration
  /// that's specified during a <a>SubmitJob</a> operation overrides the timeout
  /// configuration defined here. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/job_timeouts.html">Job
  /// Timeouts</a> in the <i>Batch User Guide</i>.
  Future<RegisterJobDefinitionResponse> registerJobDefinition({
    required String jobDefinitionName,
    required JobDefinitionType type,
    ContainerProperties? containerProperties,
    EcsProperties? ecsProperties,
    EksProperties? eksProperties,
    NodeProperties? nodeProperties,
    Map<String, String>? parameters,
    List<PlatformCapability>? platformCapabilities,
    bool? propagateTags,
    RetryStrategy? retryStrategy,
    int? schedulingPriority,
    Map<String, String>? tags,
    JobTimeout? timeout,
  }) async {
    final $payload = <String, dynamic>{
      'jobDefinitionName': jobDefinitionName,
      'type': type.toValue(),
      if (containerProperties != null)
        'containerProperties': containerProperties,
      if (ecsProperties != null) 'ecsProperties': ecsProperties,
      if (eksProperties != null) 'eksProperties': eksProperties,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (parameters != null) 'parameters': parameters,
      if (platformCapabilities != null)
        'platformCapabilities':
            platformCapabilities.map((e) => e.toValue()).toList(),
      if (propagateTags != null) 'propagateTags': propagateTags,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (schedulingPriority != null) 'schedulingPriority': schedulingPriority,
      if (tags != null) 'tags': tags,
      if (timeout != null) 'timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/registerjobdefinition',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterJobDefinitionResponse.fromJson(response);
  }

  /// Submits an Batch job from a job definition. Parameters that are specified
  /// during <a>SubmitJob</a> override parameters defined in the job definition.
  /// vCPU and memory requirements that are specified in the
  /// <code>resourceRequirements</code> objects in the job definition are the
  /// exception. They can't be overridden this way using the <code>memory</code>
  /// and <code>vcpus</code> parameters. Rather, you must specify updates to job
  /// definition parameters in a <code>resourceRequirements</code> object that's
  /// included in the <code>containerOverrides</code> parameter.
  /// <note>
  /// Job queues with a scheduling policy are limited to 500 active fair share
  /// identifiers at a time.
  /// </note> <important>
  /// Jobs that run on Fargate resources can't be guaranteed to run for more
  /// than 14 days. This is because, after 14 days, Fargate resources might
  /// become unavailable and job might be terminated.
  /// </important>
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinition] :
  /// The job definition used by this job. This value can be one of
  /// <code>definition-name</code>, <code>definition-name:revision</code>, or
  /// the Amazon Resource Name (ARN) for the job definition, with or without the
  /// revision
  /// (<code>arn:aws:batch:<i>region</i>:<i>account</i>:job-definition/<i>definition-name</i>:<i>revision</i>
  /// </code>, or
  /// <code>arn:aws:batch:<i>region</i>:<i>account</i>:job-definition/<i>definition-name</i>
  /// </code>).
  ///
  /// If the revision is not specified, then the latest active revision is used.
  ///
  /// Parameter [jobName] :
  /// The name of the job. It can be up to 128 letters long. The first character
  /// must be alphanumeric, can contain uppercase and lowercase letters,
  /// numbers, hyphens (-), and underscores (_).
  ///
  /// Parameter [jobQueue] :
  /// The job queue where the job is submitted. You can specify either the name
  /// or the Amazon Resource Name (ARN) of the queue.
  ///
  /// Parameter [arrayProperties] :
  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array
  /// properties for a job, it becomes an array job. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html">Array
  /// Jobs</a> in the <i>Batch User Guide</i>.
  ///
  /// Parameter [containerOverrides] :
  /// An object with properties that override the defaults for the job
  /// definition that specify the name of a container in the specified job
  /// definition and the overrides it should receive. You can override the
  /// default command for a container, which is specified in the job definition
  /// or the Docker image, with a <code>command</code> override. You can also
  /// override existing environment variables on a container or add new
  /// environment variables to it with an <code>environment</code> override.
  ///
  /// Parameter [dependsOn] :
  /// A list of dependencies for the job. A job can depend upon a maximum of 20
  /// jobs. You can specify a <code>SEQUENTIAL</code> type dependency without
  /// specifying a job ID for array jobs so that each child array job completes
  /// sequentially, starting at index 0. You can also specify an
  /// <code>N_TO_N</code> type dependency with a job ID for array jobs. In that
  /// case, each index child of this job must wait for the corresponding index
  /// child of each dependency to complete before it can begin.
  ///
  /// Parameter [ecsPropertiesOverride] :
  /// An object, with properties that override defaults for the job definition,
  /// can only be specified for jobs that are run on Amazon ECS resources.
  ///
  /// Parameter [eksPropertiesOverride] :
  /// An object, with properties that override defaults for the job definition,
  /// can only be specified for jobs that are run on Amazon EKS resources.
  ///
  /// Parameter [nodeOverrides] :
  /// A list of node overrides in JSON format that specify the node range to
  /// target and the container overrides for that node range.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources; use <code>containerOverrides</code> instead.
  /// </note>
  ///
  /// Parameter [parameters] :
  /// Additional parameters passed to the job that replace parameter
  /// substitution placeholders that are set in the job definition. Parameters
  /// are specified as a key and value pair mapping. Parameters in a
  /// <code>SubmitJob</code> request override any corresponding parameter
  /// defaults from the job definition.
  ///
  /// Parameter [propagateTags] :
  /// Specifies whether to propagate the tags from the job or job definition to
  /// the corresponding Amazon ECS task. If no value is specified, the tags
  /// aren't propagated. Tags can only be propagated to the tasks during task
  /// creation. For tags with the same name, job tags are given priority over
  /// job definitions tags. If the total number of combined tags from the job
  /// and job definition is over 50, the job is moved to the <code>FAILED</code>
  /// state. When specified, this overrides the tag propagation setting in the
  /// job definition.
  ///
  /// Parameter [retryStrategy] :
  /// The retry strategy to use for failed jobs from this <a>SubmitJob</a>
  /// operation. When a retry strategy is specified here, it overrides the retry
  /// strategy defined in the job definition.
  ///
  /// Parameter [schedulingPriorityOverride] :
  /// The scheduling priority for the job. This only affects jobs in job queues
  /// with a fair share policy. Jobs with a higher scheduling priority are
  /// scheduled before jobs with a lower scheduling priority. This overrides any
  /// scheduling priority in the job definition and works only within a single
  /// share identifier.
  ///
  /// The minimum supported value is 0 and the maximum supported value is 9999.
  ///
  /// Parameter [shareIdentifier] :
  /// The share identifier for the job. Don't specify this parameter if the job
  /// queue doesn't have a scheduling policy. If the job queue has a scheduling
  /// policy, then this parameter must be specified.
  ///
  /// This string is limited to 255 alphanumeric characters, and can be followed
  /// by an asterisk (*).
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the job request to help you categorize and
  /// organize your resources. Each tag consists of a key and an optional value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [timeout] :
  /// The timeout configuration for this <a>SubmitJob</a> operation. You can
  /// specify a timeout duration after which Batch terminates your jobs if they
  /// haven't finished. If a job is terminated due to a timeout, it isn't
  /// retried. The minimum value for the timeout is 60 seconds. This
  /// configuration overrides any timeout configuration specified in the job
  /// definition. For array jobs, child jobs have the same timeout configuration
  /// as the parent job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/job_timeouts.html">Job
  /// Timeouts</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  Future<SubmitJobResponse> submitJob({
    required String jobDefinition,
    required String jobName,
    required String jobQueue,
    ArrayProperties? arrayProperties,
    ContainerOverrides? containerOverrides,
    List<JobDependency>? dependsOn,
    EcsPropertiesOverride? ecsPropertiesOverride,
    EksPropertiesOverride? eksPropertiesOverride,
    NodeOverrides? nodeOverrides,
    Map<String, String>? parameters,
    bool? propagateTags,
    RetryStrategy? retryStrategy,
    int? schedulingPriorityOverride,
    String? shareIdentifier,
    Map<String, String>? tags,
    JobTimeout? timeout,
  }) async {
    final $payload = <String, dynamic>{
      'jobDefinition': jobDefinition,
      'jobName': jobName,
      'jobQueue': jobQueue,
      if (arrayProperties != null) 'arrayProperties': arrayProperties,
      if (containerOverrides != null) 'containerOverrides': containerOverrides,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (ecsPropertiesOverride != null)
        'ecsPropertiesOverride': ecsPropertiesOverride,
      if (eksPropertiesOverride != null)
        'eksPropertiesOverride': eksPropertiesOverride,
      if (nodeOverrides != null) 'nodeOverrides': nodeOverrides,
      if (parameters != null) 'parameters': parameters,
      if (propagateTags != null) 'propagateTags': propagateTags,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (schedulingPriorityOverride != null)
        'schedulingPriorityOverride': schedulingPriorityOverride,
      if (shareIdentifier != null) 'shareIdentifier': shareIdentifier,
      if (tags != null) 'tags': tags,
      if (timeout != null) 'timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/submitjob',
      exceptionFnMap: _exceptionFns,
    );
    return SubmitJobResponse.fromJson(response);
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource aren't specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags that are associated with that resource are deleted as
  /// well. Batch resources that support tags are compute environments, jobs,
  /// job definitions, job queues, and scheduling policies. ARNs for child jobs
  /// of array and multi-node parallel (MNP) jobs aren't supported.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that tags are added to.
  /// Batch resources that support tags are compute environments, jobs, job
  /// definitions, job queues, and scheduling policies. ARNs for child jobs of
  /// array and multi-node parallel (MNP) jobs aren't supported.
  ///
  /// Parameter [tags] :
  /// The tags that you apply to the resource to help you categorize and
  /// organize your resources. Each tag consists of a key and an optional value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> in <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Terminates a job in a job queue. Jobs that are in the
  /// <code>STARTING</code> or <code>RUNNING</code> state are terminated, which
  /// causes them to transition to <code>FAILED</code>. Jobs that have not
  /// progressed to the <code>STARTING</code> state are cancelled.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobId] :
  /// The Batch job ID of the job to terminate.
  ///
  /// Parameter [reason] :
  /// A message to attach to the job that explains the reason for canceling it.
  /// This message is returned by future <a>DescribeJobs</a> operations on the
  /// job. This message is also recorded in the Batch activity logs.
  Future<void> terminateJob({
    required String jobId,
    required String reason,
  }) async {
    final $payload = <String, dynamic>{
      'jobId': jobId,
      'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/terminatejob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from an Batch resource.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to delete tags.
  /// Batch resources that support tags are compute environments, jobs, job
  /// definitions, job queues, and scheduling policies. ARNs for child jobs of
  /// array and multi-node parallel (MNP) jobs aren't supported.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an Batch compute environment.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironment] :
  /// The name or full Amazon Resource Name (ARN) of the compute environment to
  /// update.
  ///
  /// Parameter [computeResources] :
  /// Details of the compute resources managed by the compute environment.
  /// Required for a managed compute environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// Environments</a> in the <i>Batch User Guide</i>.
  ///
  /// Parameter [serviceRole] :
  /// The full Amazon Resource Name (ARN) of the IAM role that allows Batch to
  /// make calls to other Amazon Web Services services on your behalf. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/service_IAM_role.html">Batch
  /// service IAM role</a> in the <i>Batch User Guide</i>.
  /// <important>
  /// If the compute environment has a service-linked role, it can't be changed
  /// to use a regular IAM role. Likewise, if the compute environment has a
  /// regular IAM role, it can't be changed to use a service-linked role. To
  /// update the parameters for the compute environment that require an
  /// infrastructure update to change, the <b>AWSServiceRoleForBatch</b>
  /// service-linked role must be used. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// </important>
  /// If your specified role has a path other than <code>/</code>, then you must
  /// either specify the full role ARN (recommended) or prefix the role name
  /// with the path.
  /// <note>
  /// Depending on how you created your Batch service role, its ARN might
  /// contain the <code>service-role</code> path prefix. When you only specify
  /// the name of the service role, Batch assumes that your ARN doesn't use the
  /// <code>service-role</code> path prefix. Because of this, we recommend that
  /// you specify the full ARN of your service role when you create compute
  /// environments.
  /// </note>
  ///
  /// Parameter [state] :
  /// The state of the compute environment. Compute environments in the
  /// <code>ENABLED</code> state can accept jobs from a queue and scale in or
  /// out automatically based on the workload demand of its associated queues.
  ///
  /// If the state is <code>ENABLED</code>, then the Batch scheduler can attempt
  /// to place jobs from an associated job queue on the compute resources within
  /// the environment. If the compute environment is managed, then it can scale
  /// its instances out or in automatically, based on the job queue demand.
  ///
  /// If the state is <code>DISABLED</code>, then the Batch scheduler doesn't
  /// attempt to place jobs within the environment. Jobs in a
  /// <code>STARTING</code> or <code>RUNNING</code> state continue to progress
  /// normally. Managed compute environments in the <code>DISABLED</code> state
  /// don't scale out.
  /// <note>
  /// Compute environments in a <code>DISABLED</code> state may continue to
  /// incur billing charges. To prevent additional charges, turn off and then
  /// delete the compute environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environment_parameters.html#compute_environment_state">State</a>
  /// in the <i>Batch User Guide</i>.
  /// </note>
  /// When an instance is idle, the instance scales down to the
  /// <code>minvCpus</code> value. However, the instance size doesn't change.
  /// For example, consider a <code>c5.8xlarge</code> instance with a
  /// <code>minvCpus</code> value of <code>4</code> and a
  /// <code>desiredvCpus</code> value of <code>36</code>. This instance doesn't
  /// scale down to a <code>c5.large</code> instance.
  ///
  /// Parameter [unmanagedvCpus] :
  /// The maximum number of vCPUs expected to be used for an unmanaged compute
  /// environment. Don't specify this parameter for a managed compute
  /// environment. This parameter is only used for fair share scheduling to
  /// reserve vCPU capacity for new share identifiers. If this parameter isn't
  /// provided for a fair share job queue, no vCPU capacity is reserved.
  ///
  /// Parameter [updatePolicy] :
  /// Specifies the updated infrastructure update policy for the compute
  /// environment. For more information about infrastructure updates, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  Future<UpdateComputeEnvironmentResponse> updateComputeEnvironment({
    required String computeEnvironment,
    ComputeResourceUpdate? computeResources,
    String? serviceRole,
    CEState? state,
    int? unmanagedvCpus,
    UpdatePolicy? updatePolicy,
  }) async {
    final $payload = <String, dynamic>{
      'computeEnvironment': computeEnvironment,
      if (computeResources != null) 'computeResources': computeResources,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (state != null) 'state': state.toValue(),
      if (unmanagedvCpus != null) 'unmanagedvCpus': unmanagedvCpus,
      if (updatePolicy != null) 'updatePolicy': updatePolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/updatecomputeenvironment',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateComputeEnvironmentResponse.fromJson(response);
  }

  /// Updates a job queue.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobQueue] :
  /// The name or the Amazon Resource Name (ARN) of the job queue.
  ///
  /// Parameter [computeEnvironmentOrder] :
  /// Details the set of compute environments mapped to a job queue and their
  /// order relative to each other. This is one of the parameters used by the
  /// job scheduler to determine which compute environment runs a given job.
  /// Compute environments must be in the <code>VALID</code> state before you
  /// can associate them with a job queue. All of the compute environments must
  /// be either EC2 (<code>EC2</code> or <code>SPOT</code>) or Fargate
  /// (<code>FARGATE</code> or <code>FARGATE_SPOT</code>). EC2 and Fargate
  /// compute environments can't be mixed.
  /// <note>
  /// All compute environments that are associated with a job queue must share
  /// the same architecture. Batch doesn't support mixing compute environment
  /// architecture types in a single job queue.
  /// </note>
  ///
  /// Parameter [jobStateTimeLimitActions] :
  /// The set of actions that Batch perform on jobs that remain at the head of
  /// the job queue in the specified state longer than specified times. Batch
  /// will perform each action after <code>maxTimeSeconds</code> has passed.
  ///
  /// Parameter [priority] :
  /// The priority of the job queue. Job queues with a higher priority (or a
  /// higher integer value for the <code>priority</code> parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order. For example, a job queue with
  /// a priority value of <code>10</code> is given scheduling preference over a
  /// job queue with a priority value of <code>1</code>. All of the compute
  /// environments must be either EC2 (<code>EC2</code> or <code>SPOT</code>) or
  /// Fargate (<code>FARGATE</code> or <code>FARGATE_SPOT</code>). EC2 and
  /// Fargate compute environments can't be mixed.
  ///
  /// Parameter [schedulingPolicyArn] :
  /// Amazon Resource Name (ARN) of the fair share scheduling policy. Once a job
  /// queue is created, the fair share scheduling policy can be replaced but not
  /// removed. The format is
  /// <code>aws:<i>Partition</i>:batch:<i>Region</i>:<i>Account</i>:scheduling-policy/<i>Name</i>
  /// </code>. For example,
  /// <code>aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy</code>.
  ///
  /// Parameter [state] :
  /// Describes the queue's ability to accept new jobs. If the job queue state
  /// is <code>ENABLED</code>, it can accept jobs. If the job queue state is
  /// <code>DISABLED</code>, new jobs can't be added to the queue, but jobs
  /// already in the queue can finish.
  Future<UpdateJobQueueResponse> updateJobQueue({
    required String jobQueue,
    List<ComputeEnvironmentOrder>? computeEnvironmentOrder,
    List<JobStateTimeLimitAction>? jobStateTimeLimitActions,
    int? priority,
    String? schedulingPolicyArn,
    JQState? state,
  }) async {
    final $payload = <String, dynamic>{
      'jobQueue': jobQueue,
      if (computeEnvironmentOrder != null)
        'computeEnvironmentOrder': computeEnvironmentOrder,
      if (jobStateTimeLimitActions != null)
        'jobStateTimeLimitActions': jobStateTimeLimitActions,
      if (priority != null) 'priority': priority,
      if (schedulingPolicyArn != null)
        'schedulingPolicyArn': schedulingPolicyArn,
      if (state != null) 'state': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/updatejobqueue',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobQueueResponse.fromJson(response);
  }

  /// Updates a scheduling policy.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the scheduling policy to update.
  ///
  /// Parameter [fairsharePolicy] :
  /// The fair share policy.
  Future<void> updateSchedulingPolicy({
    required String arn,
    FairsharePolicy? fairsharePolicy,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (fairsharePolicy != null) 'fairsharePolicy': fairsharePolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/updateschedulingpolicy',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum ArrayJobDependency {
  nToN,
  sequential,
}

extension ArrayJobDependencyValueExtension on ArrayJobDependency {
  String toValue() {
    switch (this) {
      case ArrayJobDependency.nToN:
        return 'N_TO_N';
      case ArrayJobDependency.sequential:
        return 'SEQUENTIAL';
    }
  }
}

extension ArrayJobDependencyFromString on String {
  ArrayJobDependency toArrayJobDependency() {
    switch (this) {
      case 'N_TO_N':
        return ArrayJobDependency.nToN;
      case 'SEQUENTIAL':
        return ArrayJobDependency.sequential;
    }
    throw Exception('$this is not known in enum ArrayJobDependency');
  }
}

/// An object that represents an Batch array job.
class ArrayProperties {
  /// The size of the array job.
  final int? size;

  ArrayProperties({
    this.size,
  });

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      if (size != null) 'size': size,
    };
  }
}

/// An object that represents the array properties of a job.
class ArrayPropertiesDetail {
  /// The job index within the array that's associated with this job. This
  /// parameter is returned for array job children.
  final int? index;

  /// The size of the array job. This parameter is returned for parent array jobs.
  final int? size;

  /// A summary of the number of array job children in each available job status.
  /// This parameter is returned for parent array jobs.
  final Map<String, int>? statusSummary;

  ArrayPropertiesDetail({
    this.index,
    this.size,
    this.statusSummary,
  });

  factory ArrayPropertiesDetail.fromJson(Map<String, dynamic> json) {
    return ArrayPropertiesDetail(
      index: json['index'] as int?,
      size: json['size'] as int?,
      statusSummary: (json['statusSummary'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final size = this.size;
    final statusSummary = this.statusSummary;
    return {
      if (index != null) 'index': index,
      if (size != null) 'size': size,
      if (statusSummary != null) 'statusSummary': statusSummary,
    };
  }
}

/// An object that represents the array properties of a job.
class ArrayPropertiesSummary {
  /// The job index within the array that's associated with this job. This
  /// parameter is returned for children of array jobs.
  final int? index;

  /// The size of the array job. This parameter is returned for parent array jobs.
  final int? size;

  ArrayPropertiesSummary({
    this.index,
    this.size,
  });

  factory ArrayPropertiesSummary.fromJson(Map<String, dynamic> json) {
    return ArrayPropertiesSummary(
      index: json['index'] as int?,
      size: json['size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final size = this.size;
    return {
      if (index != null) 'index': index,
      if (size != null) 'size': size,
    };
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

/// An object that represents the details of a container that's part of a job
/// attempt.
class AttemptContainerDetail {
  /// The Amazon Resource Name (ARN) of the Amazon ECS container instance that
  /// hosts the job attempt.
  final String? containerInstanceArn;

  /// The exit code for the job attempt. A non-zero exit code is considered
  /// failed.
  final int? exitCode;

  /// The name of the CloudWatch Logs log stream that's associated with the
  /// container. The log group for Batch jobs is <code>/aws/batch/job</code>. Each
  /// container attempt receives a log stream name when they reach the
  /// <code>RUNNING</code> status.
  final String? logStreamName;

  /// The network interfaces that are associated with the job attempt.
  final List<NetworkInterface>? networkInterfaces;

  /// A short (255 max characters) human-readable string to provide additional
  /// details for a running or stopped container.
  final String? reason;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that's associated with
  /// the job attempt. Each container attempt receives a task ARN when they reach
  /// the <code>STARTING</code> status.
  final String? taskArn;

  AttemptContainerDetail({
    this.containerInstanceArn,
    this.exitCode,
    this.logStreamName,
    this.networkInterfaces,
    this.reason,
    this.taskArn,
  });

  factory AttemptContainerDetail.fromJson(Map<String, dynamic> json) {
    return AttemptContainerDetail(
      containerInstanceArn: json['containerInstanceArn'] as String?,
      exitCode: json['exitCode'] as int?,
      logStreamName: json['logStreamName'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      reason: json['reason'] as String?,
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstanceArn = this.containerInstanceArn;
    final exitCode = this.exitCode;
    final logStreamName = this.logStreamName;
    final networkInterfaces = this.networkInterfaces;
    final reason = this.reason;
    final taskArn = this.taskArn;
    return {
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (exitCode != null) 'exitCode': exitCode,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (reason != null) 'reason': reason,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// An object that represents a job attempt.
class AttemptDetail {
  /// The details for the container in this job attempt.
  final AttemptContainerDetail? container;

  /// The Unix timestamp (in milliseconds) for when the attempt was started (when
  /// the attempt transitioned from the <code>STARTING</code> state to the
  /// <code>RUNNING</code> state).
  final int? startedAt;

  /// A short, human-readable string to provide additional details for the current
  /// status of the job attempt.
  final String? statusReason;

  /// The Unix timestamp (in milliseconds) for when the attempt was stopped (when
  /// the attempt transitioned from the <code>RUNNING</code> state to a terminal
  /// state, such as <code>SUCCEEDED</code> or <code>FAILED</code>).
  final int? stoppedAt;

  /// The properties for a task definition that describes the container and volume
  /// definitions of an Amazon ECS task.
  final List<AttemptEcsTaskDetails>? taskProperties;

  AttemptDetail({
    this.container,
    this.startedAt,
    this.statusReason,
    this.stoppedAt,
    this.taskProperties,
  });

  factory AttemptDetail.fromJson(Map<String, dynamic> json) {
    return AttemptDetail(
      container: json['container'] != null
          ? AttemptContainerDetail.fromJson(
              json['container'] as Map<String, dynamic>)
          : null,
      startedAt: json['startedAt'] as int?,
      statusReason: json['statusReason'] as String?,
      stoppedAt: json['stoppedAt'] as int?,
      taskProperties: (json['taskProperties'] as List?)
          ?.whereNotNull()
          .map((e) => AttemptEcsTaskDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final container = this.container;
    final startedAt = this.startedAt;
    final statusReason = this.statusReason;
    final stoppedAt = this.stoppedAt;
    final taskProperties = this.taskProperties;
    return {
      if (container != null) 'container': container,
      if (startedAt != null) 'startedAt': startedAt,
      if (statusReason != null) 'statusReason': statusReason,
      if (stoppedAt != null) 'stoppedAt': stoppedAt,
      if (taskProperties != null) 'taskProperties': taskProperties,
    };
  }
}

/// An object that represents the details of a task.
class AttemptEcsTaskDetails {
  /// The Amazon Resource Name (ARN) of the container instance that hosts the
  /// task.
  final String? containerInstanceArn;

  /// A list of containers that are included in the <code>taskProperties</code>
  /// list.
  final List<AttemptTaskContainerDetails>? containers;

  /// The ARN of the Amazon ECS task.
  final String? taskArn;

  AttemptEcsTaskDetails({
    this.containerInstanceArn,
    this.containers,
    this.taskArn,
  });

  factory AttemptEcsTaskDetails.fromJson(Map<String, dynamic> json) {
    return AttemptEcsTaskDetails(
      containerInstanceArn: json['containerInstanceArn'] as String?,
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AttemptTaskContainerDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskArn: json['taskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstanceArn = this.containerInstanceArn;
    final containers = this.containers;
    final taskArn = this.taskArn;
    return {
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (containers != null) 'containers': containers,
      if (taskArn != null) 'taskArn': taskArn,
    };
  }
}

/// An object that represents the details of a container that's part of a job
/// attempt.
class AttemptTaskContainerDetails {
  /// The exit code for the container’s attempt. A non-zero exit code is
  /// considered failed.
  final int? exitCode;

  /// The name of the Amazon CloudWatch Logs log stream that's associated with the
  /// container. The log group for Batch jobs is <code>/aws/batch/job</code>. Each
  /// container attempt receives a log stream name when they reach the
  /// <code>RUNNING</code> status.
  final String? logStreamName;

  /// The name of a container.
  final String? name;

  /// The network interfaces that are associated with the job attempt.
  final List<NetworkInterface>? networkInterfaces;

  /// A short (255 max characters) string that's easy to understand and provides
  /// additional details for a running or stopped container.
  final String? reason;

  AttemptTaskContainerDetails({
    this.exitCode,
    this.logStreamName,
    this.name,
    this.networkInterfaces,
    this.reason,
  });

  factory AttemptTaskContainerDetails.fromJson(Map<String, dynamic> json) {
    return AttemptTaskContainerDetails(
      exitCode: json['exitCode'] as int?,
      logStreamName: json['logStreamName'] as String?,
      name: json['name'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exitCode = this.exitCode;
    final logStreamName = this.logStreamName;
    final name = this.name;
    final networkInterfaces = this.networkInterfaces;
    final reason = this.reason;
    return {
      if (exitCode != null) 'exitCode': exitCode,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (name != null) 'name': name,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (reason != null) 'reason': reason,
    };
  }
}

enum CEState {
  enabled,
  disabled,
}

extension CEStateValueExtension on CEState {
  String toValue() {
    switch (this) {
      case CEState.enabled:
        return 'ENABLED';
      case CEState.disabled:
        return 'DISABLED';
    }
  }
}

extension CEStateFromString on String {
  CEState toCEState() {
    switch (this) {
      case 'ENABLED':
        return CEState.enabled;
      case 'DISABLED':
        return CEState.disabled;
    }
    throw Exception('$this is not known in enum CEState');
  }
}

enum CEStatus {
  creating,
  updating,
  deleting,
  deleted,
  valid,
  invalid,
}

extension CEStatusValueExtension on CEStatus {
  String toValue() {
    switch (this) {
      case CEStatus.creating:
        return 'CREATING';
      case CEStatus.updating:
        return 'UPDATING';
      case CEStatus.deleting:
        return 'DELETING';
      case CEStatus.deleted:
        return 'DELETED';
      case CEStatus.valid:
        return 'VALID';
      case CEStatus.invalid:
        return 'INVALID';
    }
  }
}

extension CEStatusFromString on String {
  CEStatus toCEStatus() {
    switch (this) {
      case 'CREATING':
        return CEStatus.creating;
      case 'UPDATING':
        return CEStatus.updating;
      case 'DELETING':
        return CEStatus.deleting;
      case 'DELETED':
        return CEStatus.deleted;
      case 'VALID':
        return CEStatus.valid;
      case 'INVALID':
        return CEStatus.invalid;
    }
    throw Exception('$this is not known in enum CEStatus');
  }
}

enum CEType {
  managed,
  unmanaged,
}

extension CETypeValueExtension on CEType {
  String toValue() {
    switch (this) {
      case CEType.managed:
        return 'MANAGED';
      case CEType.unmanaged:
        return 'UNMANAGED';
    }
  }
}

extension CETypeFromString on String {
  CEType toCEType() {
    switch (this) {
      case 'MANAGED':
        return CEType.managed;
      case 'UNMANAGED':
        return CEType.unmanaged;
    }
    throw Exception('$this is not known in enum CEType');
  }
}

enum CRAllocationStrategy {
  bestFit,
  bestFitProgressive,
  spotCapacityOptimized,
  spotPriceCapacityOptimized,
}

extension CRAllocationStrategyValueExtension on CRAllocationStrategy {
  String toValue() {
    switch (this) {
      case CRAllocationStrategy.bestFit:
        return 'BEST_FIT';
      case CRAllocationStrategy.bestFitProgressive:
        return 'BEST_FIT_PROGRESSIVE';
      case CRAllocationStrategy.spotCapacityOptimized:
        return 'SPOT_CAPACITY_OPTIMIZED';
      case CRAllocationStrategy.spotPriceCapacityOptimized:
        return 'SPOT_PRICE_CAPACITY_OPTIMIZED';
    }
  }
}

extension CRAllocationStrategyFromString on String {
  CRAllocationStrategy toCRAllocationStrategy() {
    switch (this) {
      case 'BEST_FIT':
        return CRAllocationStrategy.bestFit;
      case 'BEST_FIT_PROGRESSIVE':
        return CRAllocationStrategy.bestFitProgressive;
      case 'SPOT_CAPACITY_OPTIMIZED':
        return CRAllocationStrategy.spotCapacityOptimized;
      case 'SPOT_PRICE_CAPACITY_OPTIMIZED':
        return CRAllocationStrategy.spotPriceCapacityOptimized;
    }
    throw Exception('$this is not known in enum CRAllocationStrategy');
  }
}

enum CRType {
  ec2,
  spot,
  fargate,
  fargateSpot,
}

extension CRTypeValueExtension on CRType {
  String toValue() {
    switch (this) {
      case CRType.ec2:
        return 'EC2';
      case CRType.spot:
        return 'SPOT';
      case CRType.fargate:
        return 'FARGATE';
      case CRType.fargateSpot:
        return 'FARGATE_SPOT';
    }
  }
}

extension CRTypeFromString on String {
  CRType toCRType() {
    switch (this) {
      case 'EC2':
        return CRType.ec2;
      case 'SPOT':
        return CRType.spot;
      case 'FARGATE':
        return CRType.fargate;
      case 'FARGATE_SPOT':
        return CRType.fargateSpot;
    }
    throw Exception('$this is not known in enum CRType');
  }
}

enum CRUpdateAllocationStrategy {
  bestFitProgressive,
  spotCapacityOptimized,
  spotPriceCapacityOptimized,
}

extension CRUpdateAllocationStrategyValueExtension
    on CRUpdateAllocationStrategy {
  String toValue() {
    switch (this) {
      case CRUpdateAllocationStrategy.bestFitProgressive:
        return 'BEST_FIT_PROGRESSIVE';
      case CRUpdateAllocationStrategy.spotCapacityOptimized:
        return 'SPOT_CAPACITY_OPTIMIZED';
      case CRUpdateAllocationStrategy.spotPriceCapacityOptimized:
        return 'SPOT_PRICE_CAPACITY_OPTIMIZED';
    }
  }
}

extension CRUpdateAllocationStrategyFromString on String {
  CRUpdateAllocationStrategy toCRUpdateAllocationStrategy() {
    switch (this) {
      case 'BEST_FIT_PROGRESSIVE':
        return CRUpdateAllocationStrategy.bestFitProgressive;
      case 'SPOT_CAPACITY_OPTIMIZED':
        return CRUpdateAllocationStrategy.spotCapacityOptimized;
      case 'SPOT_PRICE_CAPACITY_OPTIMIZED':
        return CRUpdateAllocationStrategy.spotPriceCapacityOptimized;
    }
    throw Exception('$this is not known in enum CRUpdateAllocationStrategy');
  }
}

class CancelJobResponse {
  CancelJobResponse();

  factory CancelJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that represents an Batch compute environment.
class ComputeEnvironmentDetail {
  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironmentArn;

  /// The name of the compute environment. It can be up to 128 characters long. It
  /// can contain uppercase and lowercase letters, numbers, hyphens (-), and
  /// underscores (_).
  final String computeEnvironmentName;

  /// The compute resources defined for the compute environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// environments</a> in the <i>Batch User Guide</i>.
  final ComputeResource? computeResources;

  /// The orchestration type of the compute environment. The valid values are
  /// <code>ECS</code> (default) or <code>EKS</code>.
  final OrchestrationType? containerOrchestrationType;

  /// The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster that the
  /// compute environment uses.
  final String? ecsClusterArn;

  /// The configuration for the Amazon EKS cluster that supports the Batch compute
  /// environment. Only specify this parameter if the
  /// <code>containerOrchestrationType</code> is <code>EKS</code>.
  final EksConfiguration? eksConfiguration;

  /// The service role that's associated with the compute environment that allows
  /// Batch to make calls to Amazon Web Services API operations on your behalf.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/service_IAM_role.html">Batch
  /// service IAM role</a> in the <i>Batch User Guide</i>.
  final String? serviceRole;

  /// The state of the compute environment. The valid values are
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  ///
  /// If the state is <code>ENABLED</code>, then the Batch scheduler can attempt
  /// to place jobs from an associated job queue on the compute resources within
  /// the environment. If the compute environment is managed, then it can scale
  /// its instances out or in automatically based on the job queue demand.
  ///
  /// If the state is <code>DISABLED</code>, then the Batch scheduler doesn't
  /// attempt to place jobs within the environment. Jobs in a
  /// <code>STARTING</code> or <code>RUNNING</code> state continue to progress
  /// normally. Managed compute environments in the <code>DISABLED</code> state
  /// don't scale out.
  /// <note>
  /// Compute environments in a <code>DISABLED</code> state may continue to incur
  /// billing charges. To prevent additional charges, turn off and then delete the
  /// compute environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environment_parameters.html#compute_environment_state">State</a>
  /// in the <i>Batch User Guide</i>.
  /// </note>
  /// When an instance is idle, the instance scales down to the
  /// <code>minvCpus</code> value. However, the instance size doesn't change. For
  /// example, consider a <code>c5.8xlarge</code> instance with a
  /// <code>minvCpus</code> value of <code>4</code> and a
  /// <code>desiredvCpus</code> value of <code>36</code>. This instance doesn't
  /// scale down to a <code>c5.large</code> instance.
  final CEState? state;

  /// The current status of the compute environment (for example,
  /// <code>CREATING</code> or <code>VALID</code>).
  final CEStatus? status;

  /// A short, human-readable string to provide additional details for the current
  /// status of the compute environment.
  final String? statusReason;

  /// The tags applied to the compute environment.
  final Map<String, String>? tags;

  /// The type of the compute environment: <code>MANAGED</code> or
  /// <code>UNMANAGED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// environments</a> in the <i>Batch User Guide</i>.
  final CEType? type;

  /// The maximum number of VCPUs expected to be used for an unmanaged compute
  /// environment.
  final int? unmanagedvCpus;

  /// Specifies the infrastructure update policy for the compute environment. For
  /// more information about infrastructure updates, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  final UpdatePolicy? updatePolicy;

  /// Unique identifier for the compute environment.
  final String? uuid;

  ComputeEnvironmentDetail({
    required this.computeEnvironmentArn,
    required this.computeEnvironmentName,
    this.computeResources,
    this.containerOrchestrationType,
    this.ecsClusterArn,
    this.eksConfiguration,
    this.serviceRole,
    this.state,
    this.status,
    this.statusReason,
    this.tags,
    this.type,
    this.unmanagedvCpus,
    this.updatePolicy,
    this.uuid,
  });

  factory ComputeEnvironmentDetail.fromJson(Map<String, dynamic> json) {
    return ComputeEnvironmentDetail(
      computeEnvironmentArn: json['computeEnvironmentArn'] as String,
      computeEnvironmentName: json['computeEnvironmentName'] as String,
      computeResources: json['computeResources'] != null
          ? ComputeResource.fromJson(
              json['computeResources'] as Map<String, dynamic>)
          : null,
      containerOrchestrationType:
          (json['containerOrchestrationType'] as String?)
              ?.toOrchestrationType(),
      ecsClusterArn: json['ecsClusterArn'] as String?,
      eksConfiguration: json['eksConfiguration'] != null
          ? EksConfiguration.fromJson(
              json['eksConfiguration'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      state: (json['state'] as String?)?.toCEState(),
      status: (json['status'] as String?)?.toCEStatus(),
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toCEType(),
      unmanagedvCpus: json['unmanagedvCpus'] as int?,
      updatePolicy: json['updatePolicy'] != null
          ? UpdatePolicy.fromJson(json['updatePolicy'] as Map<String, dynamic>)
          : null,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironmentArn = this.computeEnvironmentArn;
    final computeEnvironmentName = this.computeEnvironmentName;
    final computeResources = this.computeResources;
    final containerOrchestrationType = this.containerOrchestrationType;
    final ecsClusterArn = this.ecsClusterArn;
    final eksConfiguration = this.eksConfiguration;
    final serviceRole = this.serviceRole;
    final state = this.state;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final type = this.type;
    final unmanagedvCpus = this.unmanagedvCpus;
    final updatePolicy = this.updatePolicy;
    final uuid = this.uuid;
    return {
      'computeEnvironmentArn': computeEnvironmentArn,
      'computeEnvironmentName': computeEnvironmentName,
      if (computeResources != null) 'computeResources': computeResources,
      if (containerOrchestrationType != null)
        'containerOrchestrationType': containerOrchestrationType.toValue(),
      if (ecsClusterArn != null) 'ecsClusterArn': ecsClusterArn,
      if (eksConfiguration != null) 'eksConfiguration': eksConfiguration,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (state != null) 'state': state.toValue(),
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (unmanagedvCpus != null) 'unmanagedvCpus': unmanagedvCpus,
      if (updatePolicy != null) 'updatePolicy': updatePolicy,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// The order that compute environments are tried in for job placement within a
/// queue. Compute environments are tried in ascending order. For example, if
/// two compute environments are associated with a job queue, the compute
/// environment with a lower order integer value is tried for job placement
/// first. Compute environments must be in the <code>VALID</code> state before
/// you can associate them with a job queue. All of the compute environments
/// must be either EC2 (<code>EC2</code> or <code>SPOT</code>) or Fargate
/// (<code>FARGATE</code> or <code>FARGATE_SPOT</code>); Amazon EC2 and Fargate
/// compute environments can't be mixed.
/// <note>
/// All compute environments that are associated with a job queue must share the
/// same architecture. Batch doesn't support mixing compute environment
/// architecture types in a single job queue.
/// </note>
class ComputeEnvironmentOrder {
  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironment;

  /// The order of the compute environment. Compute environments are tried in
  /// ascending order. For example, if two compute environments are associated
  /// with a job queue, the compute environment with a lower <code>order</code>
  /// integer value is tried for job placement first.
  final int order;

  ComputeEnvironmentOrder({
    required this.computeEnvironment,
    required this.order,
  });

  factory ComputeEnvironmentOrder.fromJson(Map<String, dynamic> json) {
    return ComputeEnvironmentOrder(
      computeEnvironment: json['computeEnvironment'] as String,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironment = this.computeEnvironment;
    final order = this.order;
    return {
      'computeEnvironment': computeEnvironment,
      'order': order,
    };
  }
}

/// An object that represents an Batch compute resource. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
/// environments</a> in the <i>Batch User Guide</i>.
class ComputeResource {
  /// The maximum number of vCPUs that a compute environment can support.
  /// <note>
  /// With <code>BEST_FIT_PROGRESSIVE</code>,<code>SPOT_CAPACITY_OPTIMIZED</code>
  /// and <code>SPOT_PRICE_CAPACITY_OPTIMIZED</code> (recommended) strategies
  /// using On-Demand or Spot Instances, and the <code>BEST_FIT</code> strategy
  /// using Spot Instances, Batch might need to exceed <code>maxvCpus</code> to
  /// meet your capacity requirements. In this event, Batch never exceeds
  /// <code>maxvCpus</code> by more than a single instance.
  /// </note>
  final int maxvCpus;

  /// The VPC subnets where the compute resources are launched. These subnets must
  /// be within the same VPC. Fargate compute resources can contain up to 16
  /// subnets. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs
  /// and subnets</a> in the <i>Amazon VPC User Guide</i>.
  /// <note>
  /// Batch on Amazon EC2 and Batch on Amazon EKS support Local Zones. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-local-zones">
  /// Local Zones</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>, <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/local-zones.html">Amazon
  /// EKS and Amazon Web Services Local Zones</a> in the <i>Amazon EKS User
  /// Guide</i> and <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-regions-zones.html#clusters-local-zones">
  /// Amazon ECS clusters in Local Zones, Wavelength Zones, and Amazon Web
  /// Services Outposts</a> in the <i>Amazon ECS Developer Guide</i>.
  ///
  /// Batch on Fargate doesn't currently support Local Zones.
  /// </note>
  final List<String> subnets;

  /// The type of compute environment: <code>EC2</code>, <code>SPOT</code>,
  /// <code>FARGATE</code>, or <code>FARGATE_SPOT</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// environments</a> in the <i>Batch User Guide</i>.
  ///
  /// If you choose <code>SPOT</code>, you must also specify an Amazon EC2 Spot
  /// Fleet role with the <code>spotIamFleetRole</code> parameter. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html">Amazon
  /// EC2 spot fleet role</a> in the <i>Batch User Guide</i>.
  final CRType type;

  /// The allocation strategy to use for the compute resource if not enough
  /// instances of the best fitting instance type can be allocated. This might be
  /// because of availability of the instance type in the Region or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon
  /// EC2 service limits</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/allocation-strategies.html">Allocation
  /// strategies</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <dl> <dt>BEST_FIT (default)</dt> <dd>
  /// Batch selects an instance type that best fits the needs of the jobs with a
  /// preference for the lowest-cost instance type. If additional instances of the
  /// selected instance type aren't available, Batch waits for the additional
  /// instances to be available. If there aren't enough instances available or the
  /// user is reaching <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon
  /// EC2 service limits</a>, additional jobs aren't run until the currently
  /// running jobs are completed. This allocation strategy keeps costs lower but
  /// can limit scaling. If you're using Spot Fleets with <code>BEST_FIT</code>,
  /// the Spot Fleet IAM Role must be specified. Compute resources that use a
  /// <code>BEST_FIT</code> allocation strategy don't support infrastructure
  /// updates and can't update some parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// </dd> <dt>BEST_FIT_PROGRESSIVE</dt> <dd>
  /// Batch selects additional instance types that are large enough to meet the
  /// requirements of the jobs in the queue. Its preference is for instance types
  /// with lower cost vCPUs. If additional instances of the previously selected
  /// instance types aren't available, Batch selects new instance types.
  /// </dd> <dt>SPOT_CAPACITY_OPTIMIZED</dt> <dd>
  /// Batch selects one or more instance types that are large enough to meet the
  /// requirements of the jobs in the queue. Its preference is for instance types
  /// that are less likely to be interrupted. This allocation strategy is only
  /// available for Spot Instance compute resources.
  /// </dd> <dt>SPOT_PRICE_CAPACITY_OPTIMIZED</dt> <dd>
  /// The price and capacity optimized allocation strategy looks at both price and
  /// capacity to select the Spot Instance pools that are the least likely to be
  /// interrupted and have the lowest possible price. This allocation strategy is
  /// only available for Spot Instance compute resources.
  /// </dd> </dl>
  /// With <code>BEST_FIT_PROGRESSIVE</code>,<code>SPOT_CAPACITY_OPTIMIZED</code>
  /// and <code>SPOT_PRICE_CAPACITY_OPTIMIZED</code> (recommended) strategies
  /// using On-Demand or Spot Instances, and the <code>BEST_FIT</code> strategy
  /// using Spot Instances, Batch might need to exceed <code>maxvCpus</code> to
  /// meet your capacity requirements. In this event, Batch never exceeds
  /// <code>maxvCpus</code> by more than a single instance.
  final CRAllocationStrategy? allocationStrategy;

  /// The maximum percentage that a Spot Instance price can be when compared with
  /// the On-Demand price for that instance type before instances are launched.
  /// For example, if your maximum percentage is 20%, then the Spot price must be
  /// less than 20% of the current On-Demand price for that Amazon EC2 instance.
  /// You always pay the lowest (market) price and never more than your maximum
  /// percentage. If you leave this field empty, the default value is 100% of the
  /// On-Demand price. For most use cases, we recommend leaving this field empty.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final int? bidPercentage;

  /// The desired number of vCPUS in the compute environment. Batch modifies this
  /// value between the minimum and maximum values based on job queue demand.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final int? desiredvCpus;

  /// Provides information that's used to select Amazon Machine Images (AMIs) for
  /// Amazon EC2 instances in the compute environment. If
  /// <code>Ec2Configuration</code> isn't specified, the default is
  /// <code>ECS_AL2</code>.
  ///
  /// One or two values can be provided.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final List<Ec2Configuration>? ec2Configuration;

  /// The Amazon EC2 key pair that's used for instances launched in the compute
  /// environment. You can use this key pair to log in to your instances with SSH.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? ec2KeyPair;

  /// The Amazon Machine Image (AMI) ID used for instances launched in the compute
  /// environment. This parameter is overridden by the
  /// <code>imageIdOverride</code> member of the <code>Ec2Configuration</code>
  /// structure.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <note>
  /// The AMI that you choose for a compute environment must match the
  /// architecture of the instance types that you intend to use for that compute
  /// environment. For example, if your compute environment uses A1 instance
  /// types, the compute resource AMI that you choose must support ARM instances.
  /// Amazon ECS vends both x86 and ARM versions of the Amazon ECS-optimized
  /// Amazon Linux 2 AMI. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux-variants.html">Amazon
  /// ECS-optimized Amazon Linux 2 AMI</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final String? imageId;

  /// The Amazon ECS instance profile applied to Amazon EC2 instances in a compute
  /// environment. This parameter is required for Amazon EC2 instances types. You
  /// can specify the short name or full Amazon Resource Name (ARN) of an instance
  /// profile. For example, <code> <i>ecsInstanceRole</i> </code> or
  /// <code>arn:aws:iam::<i>&lt;aws_account_id&gt;</i>:instance-profile/<i>ecsInstanceRole</i>
  /// </code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/instance_IAM_role.html">Amazon
  /// ECS instance role</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? instanceRole;

  /// The instances types that can be launched. You can specify instance families
  /// to launch any instance type within those families (for example,
  /// <code>c5</code> or <code>p3</code>), or you can specify specific sizes
  /// within a family (such as <code>c5.8xlarge</code>). You can also choose
  /// <code>optimal</code> to select instance types (from the C4, M4, and R4
  /// instance families) that match the demand of your job queues.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <note>
  /// When you create a compute environment, the instance types that you select
  /// for the compute environment must share the same architecture. For example,
  /// you can't mix x86 and ARM instances in the same compute environment.
  /// </note> <note>
  /// Currently, <code>optimal</code> uses instance types from the C4, M4, and R4
  /// instance families. In Regions that don't have instance types from those
  /// instance families, instance types from the C5, M5, and R5 instance families
  /// are used.
  /// </note>
  final List<String>? instanceTypes;

  /// The launch template to use for your compute resources. Any other compute
  /// resource parameters that you specify in a <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_CreateComputeEnvironment.html">CreateComputeEnvironment</a>
  /// API operation override the same parameters in the launch template. You must
  /// specify either the launch template ID or launch template name in the
  /// request, but not both. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final LaunchTemplateSpecification? launchTemplate;

  /// The minimum number of vCPUs that a compute environment should maintain (even
  /// if the compute environment is <code>DISABLED</code>).
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final int? minvCpus;

  /// The Amazon EC2 placement group to associate with your compute resources. If
  /// you intend to submit multi-node parallel jobs to your compute environment,
  /// you should consider creating a cluster placement group and associate it with
  /// your compute resources. This keeps your multi-node parallel job on a logical
  /// grouping of instances within a single Availability Zone with high network
  /// flow potential. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement
  /// groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? placementGroup;

  /// The Amazon EC2 security groups that are associated with instances launched
  /// in the compute environment. One or more security groups must be specified,
  /// either in <code>securityGroupIds</code> or using a launch template
  /// referenced in <code>launchTemplate</code>. This parameter is required for
  /// jobs that are running on Fargate resources and must contain at least one
  /// security group. Fargate doesn't support launch templates. If security groups
  /// are specified using both <code>securityGroupIds</code> and
  /// <code>launchTemplate</code>, the values in <code>securityGroupIds</code> are
  /// used.
  final List<String>? securityGroupIds;

  /// The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied
  /// to a <code>SPOT</code> compute environment. This role is required if the
  /// allocation strategy set to <code>BEST_FIT</code> or if the allocation
  /// strategy isn't specified. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html">Amazon
  /// EC2 spot fleet role</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <important>
  /// To tag your Spot Instances on creation, the Spot Fleet IAM role specified
  /// here must use the newer <b>AmazonEC2SpotFleetTaggingRole</b> managed policy.
  /// The previously recommended <b>AmazonEC2SpotFleetRole</b> managed policy
  /// doesn't have the required permissions to tag Spot Instances. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#spot-instance-no-tag">Spot
  /// instances not tagged on creation</a> in the <i>Batch User Guide</i>.
  /// </important>
  final String? spotIamFleetRole;

  /// Key-value pair tags to be applied to Amazon EC2 resources that are launched
  /// in the compute environment. For Batch, these take the form of
  /// <code>"String1": "String2"</code>, where <code>String1</code> is the tag key
  /// and <code>String2</code> is the tag value-for example, <code>{ "Name":
  /// "Batch Instance - C4OnDemand" }</code>. This is helpful for recognizing your
  /// Batch instances in the Amazon EC2 console. Updating these tags requires an
  /// infrastructure update to the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>. These tags aren't
  /// seen when using the Batch <code>ListTagsForResource</code> API operation.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final Map<String, String>? tags;

  ComputeResource({
    required this.maxvCpus,
    required this.subnets,
    required this.type,
    this.allocationStrategy,
    this.bidPercentage,
    this.desiredvCpus,
    this.ec2Configuration,
    this.ec2KeyPair,
    this.imageId,
    this.instanceRole,
    this.instanceTypes,
    this.launchTemplate,
    this.minvCpus,
    this.placementGroup,
    this.securityGroupIds,
    this.spotIamFleetRole,
    this.tags,
  });

  factory ComputeResource.fromJson(Map<String, dynamic> json) {
    return ComputeResource(
      maxvCpus: json['maxvCpus'] as int,
      subnets: (json['subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String).toCRType(),
      allocationStrategy:
          (json['allocationStrategy'] as String?)?.toCRAllocationStrategy(),
      bidPercentage: json['bidPercentage'] as int?,
      desiredvCpus: json['desiredvCpus'] as int?,
      ec2Configuration: (json['ec2Configuration'] as List?)
          ?.whereNotNull()
          .map((e) => Ec2Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2KeyPair: json['ec2KeyPair'] as String?,
      imageId: json['imageId'] as String?,
      instanceRole: json['instanceRole'] as String?,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      launchTemplate: json['launchTemplate'] != null
          ? LaunchTemplateSpecification.fromJson(
              json['launchTemplate'] as Map<String, dynamic>)
          : null,
      minvCpus: json['minvCpus'] as int?,
      placementGroup: json['placementGroup'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      spotIamFleetRole: json['spotIamFleetRole'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final maxvCpus = this.maxvCpus;
    final subnets = this.subnets;
    final type = this.type;
    final allocationStrategy = this.allocationStrategy;
    final bidPercentage = this.bidPercentage;
    final desiredvCpus = this.desiredvCpus;
    final ec2Configuration = this.ec2Configuration;
    final ec2KeyPair = this.ec2KeyPair;
    final imageId = this.imageId;
    final instanceRole = this.instanceRole;
    final instanceTypes = this.instanceTypes;
    final launchTemplate = this.launchTemplate;
    final minvCpus = this.minvCpus;
    final placementGroup = this.placementGroup;
    final securityGroupIds = this.securityGroupIds;
    final spotIamFleetRole = this.spotIamFleetRole;
    final tags = this.tags;
    return {
      'maxvCpus': maxvCpus,
      'subnets': subnets,
      'type': type.toValue(),
      if (allocationStrategy != null)
        'allocationStrategy': allocationStrategy.toValue(),
      if (bidPercentage != null) 'bidPercentage': bidPercentage,
      if (desiredvCpus != null) 'desiredvCpus': desiredvCpus,
      if (ec2Configuration != null) 'ec2Configuration': ec2Configuration,
      if (ec2KeyPair != null) 'ec2KeyPair': ec2KeyPair,
      if (imageId != null) 'imageId': imageId,
      if (instanceRole != null) 'instanceRole': instanceRole,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (minvCpus != null) 'minvCpus': minvCpus,
      if (placementGroup != null) 'placementGroup': placementGroup,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (spotIamFleetRole != null) 'spotIamFleetRole': spotIamFleetRole,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object that represents the attributes of a compute environment that can
/// be updated. For more information, see <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
/// compute environments</a> in the <i>Batch User Guide</i>.
class ComputeResourceUpdate {
  /// The allocation strategy to use for the compute resource if there's not
  /// enough instances of the best fitting instance type that can be allocated.
  /// This might be because of availability of the instance type in the Region or
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon
  /// EC2 service limits</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/allocation-strategies.html">Allocation
  /// strategies</a> in the <i>Batch User Guide</i>.
  ///
  /// When updating a compute environment, changing the allocation strategy
  /// requires an infrastructure update of the compute environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <code>BEST_FIT</code> isn't supported when updating a compute environment.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <dl> <dt>BEST_FIT_PROGRESSIVE</dt> <dd>
  /// Batch selects additional instance types that are large enough to meet the
  /// requirements of the jobs in the queue. Its preference is for instance types
  /// with lower cost vCPUs. If additional instances of the previously selected
  /// instance types aren't available, Batch selects new instance types.
  /// </dd> <dt>SPOT_CAPACITY_OPTIMIZED</dt> <dd>
  /// Batch selects one or more instance types that are large enough to meet the
  /// requirements of the jobs in the queue. Its preference is for instance types
  /// that are less likely to be interrupted. This allocation strategy is only
  /// available for Spot Instance compute resources.
  /// </dd> <dt>SPOT_PRICE_CAPACITY_OPTIMIZED</dt> <dd>
  /// The price and capacity optimized allocation strategy looks at both price and
  /// capacity to select the Spot Instance pools that are the least likely to be
  /// interrupted and have the lowest possible price. This allocation strategy is
  /// only available for Spot Instance compute resources.
  /// </dd> </dl>
  /// With <code>BEST_FIT_PROGRESSIVE</code>,<code>SPOT_CAPACITY_OPTIMIZED</code>
  /// and <code>SPOT_PRICE_CAPACITY_OPTIMIZED</code> (recommended) strategies
  /// using On-Demand or Spot Instances, and the <code>BEST_FIT</code> strategy
  /// using Spot Instances, Batch might need to exceed <code>maxvCpus</code> to
  /// meet your capacity requirements. In this event, Batch never exceeds
  /// <code>maxvCpus</code> by more than a single instance.
  final CRUpdateAllocationStrategy? allocationStrategy;

  /// The maximum percentage that a Spot Instance price can be when compared with
  /// the On-Demand price for that instance type before instances are launched.
  /// For example, if your maximum percentage is 20%, the Spot price must be less
  /// than 20% of the current On-Demand price for that Amazon EC2 instance. You
  /// always pay the lowest (market) price and never more than your maximum
  /// percentage. For most use cases, we recommend leaving this field empty.
  ///
  /// When updating a compute environment, changing the bid percentage requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final int? bidPercentage;

  /// The desired number of vCPUS in the compute environment. Batch modifies this
  /// value between the minimum and maximum values based on job queue demand.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <note>
  /// Batch doesn't support changing the desired number of vCPUs of an existing
  /// compute environment. Don't specify this parameter for compute environments
  /// using Amazon EKS clusters.
  /// </note> <note>
  /// When you update the <code>desiredvCpus</code> setting, the value must be
  /// between the <code>minvCpus</code> and <code>maxvCpus</code> values.
  ///
  /// Additionally, the updated <code>desiredvCpus</code> value must be greater
  /// than or equal to the current <code>desiredvCpus</code> value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#error-desired-vcpus-update">Troubleshooting
  /// Batch</a> in the <i>Batch User Guide</i>.
  /// </note>
  final int? desiredvCpus;

  /// Provides information used to select Amazon Machine Images (AMIs) for Amazon
  /// EC2 instances in the compute environment. If <code>Ec2Configuration</code>
  /// isn't specified, the default is <code>ECS_AL2</code>.
  ///
  /// When updating a compute environment, changing this setting requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>. To remove the
  /// Amazon EC2 configuration and any custom AMI ID specified in
  /// <code>imageIdOverride</code>, set this value to an empty string.
  ///
  /// One or two values can be provided.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final List<Ec2Configuration>? ec2Configuration;

  /// The Amazon EC2 key pair that's used for instances launched in the compute
  /// environment. You can use this key pair to log in to your instances with SSH.
  /// To remove the Amazon EC2 key pair, set this value to an empty string.
  ///
  /// When updating a compute environment, changing the Amazon EC2 key pair
  /// requires an infrastructure update of the compute environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? ec2KeyPair;

  /// The Amazon Machine Image (AMI) ID used for instances launched in the compute
  /// environment. This parameter is overridden by the
  /// <code>imageIdOverride</code> member of the <code>Ec2Configuration</code>
  /// structure. To remove the custom AMI ID and use the default AMI ID, set this
  /// value to an empty string.
  ///
  /// When updating a compute environment, changing the AMI ID requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <note>
  /// The AMI that you choose for a compute environment must match the
  /// architecture of the instance types that you intend to use for that compute
  /// environment. For example, if your compute environment uses A1 instance
  /// types, the compute resource AMI that you choose must support ARM instances.
  /// Amazon ECS vends both x86 and ARM versions of the Amazon ECS-optimized
  /// Amazon Linux 2 AMI. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux-variants.html">Amazon
  /// ECS-optimized Amazon Linux 2 AMI</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final String? imageId;

  /// The Amazon ECS instance profile applied to Amazon EC2 instances in a compute
  /// environment. Required for Amazon EC2 instances. You can specify the short
  /// name or full Amazon Resource Name (ARN) of an instance profile. For example,
  /// <code> <i>ecsInstanceRole</i> </code> or
  /// <code>arn:aws:iam::<i>&lt;aws_account_id&gt;</i>:instance-profile/<i>ecsInstanceRole</i>
  /// </code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/instance_IAM_role.html">Amazon
  /// ECS instance role</a> in the <i>Batch User Guide</i>.
  ///
  /// When updating a compute environment, changing this setting requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? instanceRole;

  /// The instances types that can be launched. You can specify instance families
  /// to launch any instance type within those families (for example,
  /// <code>c5</code> or <code>p3</code>), or you can specify specific sizes
  /// within a family (such as <code>c5.8xlarge</code>). You can also choose
  /// <code>optimal</code> to select instance types (from the C4, M4, and R4
  /// instance families) that match the demand of your job queues.
  ///
  /// When updating a compute environment, changing this setting requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note> <note>
  /// When you create a compute environment, the instance types that you select
  /// for the compute environment must share the same architecture. For example,
  /// you can't mix x86 and ARM instances in the same compute environment.
  /// </note> <note>
  /// Currently, <code>optimal</code> uses instance types from the C4, M4, and R4
  /// instance families. In Regions that don't have instance types from those
  /// instance families, instance types from the C5, M5, and R5 instance families
  /// are used.
  /// </note>
  final List<String>? instanceTypes;

  /// The updated launch template to use for your compute resources. You must
  /// specify either the launch template ID or launch template name in the
  /// request, but not both. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the <i>Batch User Guide</i>. To remove the custom
  /// launch template and use the default launch template, set
  /// <code>launchTemplateId</code> or <code>launchTemplateName</code> member of
  /// the launch template specification to an empty string. Removing the launch
  /// template from a compute environment will not remove the AMI specified in the
  /// launch template. In order to update the AMI specified in a launch template,
  /// the <code>updateToLatestImageVersion</code> parameter must be set to
  /// <code>true</code>.
  ///
  /// When updating a compute environment, changing the launch template requires
  /// an infrastructure update of the compute environment. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final LaunchTemplateSpecification? launchTemplate;

  /// The maximum number of Amazon EC2 vCPUs that an environment can reach.
  /// <note>
  /// With <code>BEST_FIT_PROGRESSIVE</code>,<code>SPOT_CAPACITY_OPTIMIZED</code>
  /// and <code>SPOT_PRICE_CAPACITY_OPTIMIZED</code> (recommended) strategies
  /// using On-Demand or Spot Instances, and the <code>BEST_FIT</code> strategy
  /// using Spot Instances, Batch might need to exceed <code>maxvCpus</code> to
  /// meet your capacity requirements. In this event, Batch never exceeds
  /// <code>maxvCpus</code> by more than a single instance.
  /// </note>
  final int? maxvCpus;

  /// The minimum number of vCPUs that an environment should maintain (even if the
  /// compute environment is <code>DISABLED</code>).
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final int? minvCpus;

  /// The Amazon EC2 placement group to associate with your compute resources. If
  /// you intend to submit multi-node parallel jobs to your compute environment,
  /// you should consider creating a cluster placement group and associate it with
  /// your compute resources. This keeps your multi-node parallel job on a logical
  /// grouping of instances within a single Availability Zone with high network
  /// flow potential. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement
  /// groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  ///
  /// When updating a compute environment, changing the placement group requires
  /// an infrastructure update of the compute environment. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final String? placementGroup;

  /// The Amazon EC2 security groups that are associated with instances launched
  /// in the compute environment. This parameter is required for Fargate compute
  /// resources, where it can contain up to 5 security groups. For Fargate compute
  /// resources, providing an empty list is handled as if this parameter wasn't
  /// specified and no change is made. For Amazon EC2 compute resources, providing
  /// an empty list removes the security groups from the compute resource.
  ///
  /// When updating a compute environment, changing the Amazon EC2 security groups
  /// requires an infrastructure update of the compute environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  final List<String>? securityGroupIds;

  /// The VPC subnets where the compute resources are launched. Fargate compute
  /// resources can contain up to 16 subnets. For Fargate compute resources,
  /// providing an empty list will be handled as if this parameter wasn't
  /// specified and no change is made. For Amazon EC2 compute resources, providing
  /// an empty list removes the VPC subnets from the compute resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs
  /// and subnets</a> in the <i>Amazon VPC User Guide</i>.
  ///
  /// When updating a compute environment, changing the VPC subnets requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// Batch on Amazon EC2 and Batch on Amazon EKS support Local Zones. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-local-zones">
  /// Local Zones</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>, <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/local-zones.html">Amazon
  /// EKS and Amazon Web Services Local Zones</a> in the <i>Amazon EKS User
  /// Guide</i> and <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-regions-zones.html#clusters-local-zones">
  /// Amazon ECS clusters in Local Zones, Wavelength Zones, and Amazon Web
  /// Services Outposts</a> in the <i>Amazon ECS Developer Guide</i>.
  ///
  /// Batch on Fargate doesn't currently support Local Zones.
  /// </note>
  final List<String>? subnets;

  /// Key-value pair tags to be applied to Amazon EC2 resources that are launched
  /// in the compute environment. For Batch, these take the form of
  /// <code>"String1": "String2"</code>, where <code>String1</code> is the tag key
  /// and <code>String2</code> is the tag value-for example, <code>{ "Name":
  /// "Batch Instance - C4OnDemand" }</code>. This is helpful for recognizing your
  /// Batch instances in the Amazon EC2 console. These tags aren't seen when using
  /// the Batch <code>ListTagsForResource</code> API operation.
  ///
  /// When updating a compute environment, changing this setting requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't specify it.
  /// </note>
  final Map<String, String>? tags;

  /// The type of compute environment: <code>EC2</code>, <code>SPOT</code>,
  /// <code>FARGATE</code>, or <code>FARGATE_SPOT</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// environments</a> in the <i>Batch User Guide</i>.
  ///
  /// If you choose <code>SPOT</code>, you must also specify an Amazon EC2 Spot
  /// Fleet role with the <code>spotIamFleetRole</code> parameter. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html">Amazon
  /// EC2 spot fleet role</a> in the <i>Batch User Guide</i>.
  ///
  /// When updating a compute environment, changing the type of a compute
  /// environment requires an infrastructure update of the compute environment.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  final CRType? type;

  /// Specifies whether the AMI ID is updated to the latest one that's supported
  /// by Batch when the compute environment has an infrastructure update. The
  /// default value is <code>false</code>.
  /// <note>
  /// An AMI ID can either be specified in the <code>imageId</code> or
  /// <code>imageIdOverride</code> parameters or be determined by the launch
  /// template that's specified in the <code>launchTemplate</code> parameter. If
  /// an AMI ID is specified any of these ways, this parameter is ignored. For
  /// more information about to update AMI IDs during an infrastructure update,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html#updating-compute-environments-ami">Updating
  /// the AMI ID</a> in the <i>Batch User Guide</i>.
  /// </note>
  /// When updating a compute environment, changing this setting requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  final bool? updateToLatestImageVersion;

  ComputeResourceUpdate({
    this.allocationStrategy,
    this.bidPercentage,
    this.desiredvCpus,
    this.ec2Configuration,
    this.ec2KeyPair,
    this.imageId,
    this.instanceRole,
    this.instanceTypes,
    this.launchTemplate,
    this.maxvCpus,
    this.minvCpus,
    this.placementGroup,
    this.securityGroupIds,
    this.subnets,
    this.tags,
    this.type,
    this.updateToLatestImageVersion,
  });

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    final bidPercentage = this.bidPercentage;
    final desiredvCpus = this.desiredvCpus;
    final ec2Configuration = this.ec2Configuration;
    final ec2KeyPair = this.ec2KeyPair;
    final imageId = this.imageId;
    final instanceRole = this.instanceRole;
    final instanceTypes = this.instanceTypes;
    final launchTemplate = this.launchTemplate;
    final maxvCpus = this.maxvCpus;
    final minvCpus = this.minvCpus;
    final placementGroup = this.placementGroup;
    final securityGroupIds = this.securityGroupIds;
    final subnets = this.subnets;
    final tags = this.tags;
    final type = this.type;
    final updateToLatestImageVersion = this.updateToLatestImageVersion;
    return {
      if (allocationStrategy != null)
        'allocationStrategy': allocationStrategy.toValue(),
      if (bidPercentage != null) 'bidPercentage': bidPercentage,
      if (desiredvCpus != null) 'desiredvCpus': desiredvCpus,
      if (ec2Configuration != null) 'ec2Configuration': ec2Configuration,
      if (ec2KeyPair != null) 'ec2KeyPair': ec2KeyPair,
      if (imageId != null) 'imageId': imageId,
      if (instanceRole != null) 'instanceRole': instanceRole,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (maxvCpus != null) 'maxvCpus': maxvCpus,
      if (minvCpus != null) 'minvCpus': minvCpus,
      if (placementGroup != null) 'placementGroup': placementGroup,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (updateToLatestImageVersion != null)
        'updateToLatestImageVersion': updateToLatestImageVersion,
    };
  }
}

/// An object that represents the details of a container that's part of a job.
class ContainerDetail {
  /// The command that's passed to the container.
  final List<String>? command;

  /// The Amazon Resource Name (ARN) of the container instance that the container
  /// is running on.
  final String? containerInstanceArn;

  /// The environment variables to pass to a container.
  /// <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<KeyValuePair>? environment;

  /// The amount of ephemeral storage allocated for the task. This parameter is
  /// used to expand the total amount of ephemeral storage available, beyond the
  /// default amount, for tasks hosted on Fargate.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the execution role that Batch can assume.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html">Batch
  /// execution IAM role</a> in the <i>Batch User Guide</i>.
  final String? executionRoleArn;

  /// The exit code returned upon completion.
  final int? exitCode;

  /// The platform configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final FargatePlatformConfiguration? fargatePlatformConfiguration;

  /// The image used to start the container.
  final String? image;

  /// The instance type of the underlying host infrastructure of a multi-node
  /// parallel job.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources.
  /// </note>
  final String? instanceType;

  /// The Amazon Resource Name (ARN) that's associated with the job when run.
  final String? jobRoleArn;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  final LinuxParameters? linuxParameters;

  /// The log configuration specification for the container.
  ///
  /// This parameter maps to <code>LogConfig</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--log-driver</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. By
  /// default, containers use the same logging driver that the Docker daemon uses.
  /// However, the container might use a different logging driver than the Docker
  /// daemon by specifying a log driver with this parameter in the container
  /// definition. To use a different logging driver for a container, the log
  /// system must be configured properly on the container instance. Or,
  /// alternatively, it must be configured on a different log server for remote
  /// logging options. For more information on the options for different supported
  /// log drivers, see <a
  /// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
  /// logging drivers</a> in the Docker documentation.
  /// <note>
  /// Batch currently supports a subset of the logging drivers available to the
  /// Docker daemon (shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-batch-jobdefinition-containerproperties-logconfiguration.html">LogConfiguration</a>
  /// data type). Additional log drivers might be available in future releases of
  /// the Amazon ECS container agent.
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: <code>sudo docker version | grep "Server API version"</code>
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// the logging drivers available on that instance with the
  /// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
  /// containers placed on that instance can use these log configuration options.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS container agent configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final LogConfiguration? logConfiguration;

  /// The name of the Amazon CloudWatch Logs log stream that's associated with the
  /// container. The log group for Batch jobs is <code>/aws/batch/job</code>. Each
  /// container attempt receives a log stream name when they reach the
  /// <code>RUNNING</code> status.
  final String? logStreamName;

  /// For jobs running on Amazon EC2 resources that didn't specify memory
  /// requirements using <code>resourceRequirements</code>, the number of MiB of
  /// memory reserved for the job. For other jobs, including all run on Fargate
  /// resources, see <code>resourceRequirements</code>.
  final int? memory;

  /// The mount points for data volumes in your container.
  final List<MountPoint>? mountPoints;

  /// The network configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final NetworkConfiguration? networkConfiguration;

  /// The network interfaces that are associated with the job.
  final List<NetworkInterface>? networkInterfaces;

  /// When this parameter is true, the container is given elevated permissions on
  /// the host container instance (similar to the <code>root</code> user). The
  /// default value is <code>false</code>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources and shouldn't be provided, or specified as <code>false</code>.
  /// </note>
  final bool? privileged;

  /// When this parameter is true, the container is given read-only access to its
  /// root file system. This parameter maps to <code>ReadonlyRootfs</code> in the
  /// <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--read-only</code> option to <a
  /// href="https://docs.docker.com/engine/reference/commandline/run/">
  /// <code>docker run</code> </a>.
  final bool? readonlyRootFilesystem;

  /// A short (255 max characters) human-readable string to provide additional
  /// details for a running or stopped container.
  final String? reason;

  /// The private repository authentication credentials to use.
  final RepositoryCredentials? repositoryCredentials;

  /// The type and amount of resources to assign to a container. The supported
  /// resources include <code>GPU</code>, <code>MEMORY</code>, and
  /// <code>VCPU</code>.
  final List<ResourceRequirement>? resourceRequirements;

  /// An object that represents the compute environment architecture for Batch
  /// jobs on Fargate.
  final RuntimePlatform? runtimePlatform;

  /// The secrets to pass to the container. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html">Specifying
  /// sensitive data</a> in the <i>Batch User Guide</i>.
  final List<Secret>? secrets;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that's associated with
  /// the container job. Each container attempt receives a task ARN when they
  /// reach the <code>STARTING</code> status.
  final String? taskArn;

  /// A list of <code>ulimit</code> values to set in the container. This parameter
  /// maps to <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources.
  /// </note>
  final List<Ulimit>? ulimits;

  /// The user name to use inside the container. This parameter maps to
  /// <code>User</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--user</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  final String? user;

  /// The number of vCPUs reserved for the container. For jobs that run on Amazon
  /// EC2 resources, you can specify the vCPU requirement for the job using
  /// <code>resourceRequirements</code>, but you can't specify the vCPU
  /// requirements in both the <code>vcpus</code> and
  /// <code>resourceRequirements</code> object. This parameter maps to
  /// <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. Each
  /// vCPU is equivalent to 1,024 CPU shares. You must specify at least one vCPU.
  /// This is required but can be specified in several places. It must be
  /// specified for each node at least once.
  /// <note>
  /// This parameter isn't applicable to jobs that run on Fargate resources. For
  /// jobs that run on Fargate resources, you must specify the vCPU requirement
  /// for the job using <code>resourceRequirements</code>.
  /// </note>
  final int? vcpus;

  /// A list of volumes that are associated with the job.
  final List<Volume>? volumes;

  ContainerDetail({
    this.command,
    this.containerInstanceArn,
    this.environment,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.exitCode,
    this.fargatePlatformConfiguration,
    this.image,
    this.instanceType,
    this.jobRoleArn,
    this.linuxParameters,
    this.logConfiguration,
    this.logStreamName,
    this.memory,
    this.mountPoints,
    this.networkConfiguration,
    this.networkInterfaces,
    this.privileged,
    this.readonlyRootFilesystem,
    this.reason,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.runtimePlatform,
    this.secrets,
    this.taskArn,
    this.ulimits,
    this.user,
    this.vcpus,
    this.volumes,
  });

  factory ContainerDetail.fromJson(Map<String, dynamic> json) {
    return ContainerDetail(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      containerInstanceArn: json['containerInstanceArn'] as String?,
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      exitCode: json['exitCode'] as int?,
      fargatePlatformConfiguration: json['fargatePlatformConfiguration'] != null
          ? FargatePlatformConfiguration.fromJson(
              json['fargatePlatformConfiguration'] as Map<String, dynamic>)
          : null,
      image: json['image'] as String?,
      instanceType: json['instanceType'] as String?,
      jobRoleArn: json['jobRoleArn'] as String?,
      linuxParameters: json['linuxParameters'] != null
          ? LinuxParameters.fromJson(
              json['linuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      logStreamName: json['logStreamName'] as String?,
      memory: json['memory'] as int?,
      mountPoints: (json['mountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MountPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      privileged: json['privileged'] as bool?,
      readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool?,
      reason: json['reason'] as String?,
      repositoryCredentials: json['repositoryCredentials'] != null
          ? RepositoryCredentials.fromJson(
              json['repositoryCredentials'] as Map<String, dynamic>)
          : null,
      resourceRequirements: (json['resourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimePlatform: json['runtimePlatform'] != null
          ? RuntimePlatform.fromJson(
              json['runtimePlatform'] as Map<String, dynamic>)
          : null,
      secrets: (json['secrets'] as List?)
          ?.whereNotNull()
          .map((e) => Secret.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskArn: json['taskArn'] as String?,
      ulimits: (json['ulimits'] as List?)
          ?.whereNotNull()
          .map((e) => Ulimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
      vcpus: json['vcpus'] as int?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final containerInstanceArn = this.containerInstanceArn;
    final environment = this.environment;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final exitCode = this.exitCode;
    final fargatePlatformConfiguration = this.fargatePlatformConfiguration;
    final image = this.image;
    final instanceType = this.instanceType;
    final jobRoleArn = this.jobRoleArn;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final logStreamName = this.logStreamName;
    final memory = this.memory;
    final mountPoints = this.mountPoints;
    final networkConfiguration = this.networkConfiguration;
    final networkInterfaces = this.networkInterfaces;
    final privileged = this.privileged;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final reason = this.reason;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final runtimePlatform = this.runtimePlatform;
    final secrets = this.secrets;
    final taskArn = this.taskArn;
    final ulimits = this.ulimits;
    final user = this.user;
    final vcpus = this.vcpus;
    final volumes = this.volumes;
    return {
      if (command != null) 'command': command,
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (environment != null) 'environment': environment,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (exitCode != null) 'exitCode': exitCode,
      if (fargatePlatformConfiguration != null)
        'fargatePlatformConfiguration': fargatePlatformConfiguration,
      if (image != null) 'image': image,
      if (instanceType != null) 'instanceType': instanceType,
      if (jobRoleArn != null) 'jobRoleArn': jobRoleArn,
      if (linuxParameters != null) 'linuxParameters': linuxParameters,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (memory != null) 'memory': memory,
      if (mountPoints != null) 'mountPoints': mountPoints,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (privileged != null) 'privileged': privileged,
      if (readonlyRootFilesystem != null)
        'readonlyRootFilesystem': readonlyRootFilesystem,
      if (reason != null) 'reason': reason,
      if (repositoryCredentials != null)
        'repositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
      if (secrets != null) 'secrets': secrets,
      if (taskArn != null) 'taskArn': taskArn,
      if (ulimits != null) 'ulimits': ulimits,
      if (user != null) 'user': user,
      if (vcpus != null) 'vcpus': vcpus,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// The overrides that should be sent to a container.
///
/// For information about using Batch overrides when you connect event sources
/// to targets, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/pipes-reference/API_BatchContainerOverrides.html">BatchContainerOverrides</a>.
class ContainerOverrides {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the job definition.
  /// <note>
  /// This parameter can't contain an empty string.
  /// </note>
  final List<String>? command;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// job definition.
  /// <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<KeyValuePair>? environment;

  /// The instance type to use for a multi-node parallel job.
  /// <note>
  /// This parameter isn't applicable to single-node container jobs or jobs that
  /// run on Fargate resources, and shouldn't be provided.
  /// </note>
  final String? instanceType;

  /// This parameter is deprecated, use <code>resourceRequirements</code> to
  /// override the memory requirements specified in the job definition. It's not
  /// supported for jobs running on Fargate resources. For jobs that run on Amazon
  /// EC2 resources, it overrides the <code>memory</code> parameter set in the job
  /// definition, but doesn't override any memory requirement that's specified in
  /// the <code>resourceRequirements</code> structure in the job definition. To
  /// override memory requirements that are specified in the
  /// <code>resourceRequirements</code> structure in the job definition,
  /// <code>resourceRequirements</code> must be specified in the
  /// <code>SubmitJob</code> request, with <code>type</code> set to
  /// <code>MEMORY</code> and <code>value</code> set to the new value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#override-resource-requirements">Can't
  /// override job definition resource requirements</a> in the <i>Batch User
  /// Guide</i>.
  final int? memory;

  /// The type and amount of resources to assign to a container. This overrides
  /// the settings in the job definition. The supported resources include
  /// <code>GPU</code>, <code>MEMORY</code>, and <code>VCPU</code>.
  final List<ResourceRequirement>? resourceRequirements;

  /// This parameter is deprecated, use <code>resourceRequirements</code> to
  /// override the <code>vcpus</code> parameter that's set in the job definition.
  /// It's not supported for jobs running on Fargate resources. For jobs that run
  /// on Amazon EC2 resources, it overrides the <code>vcpus</code> parameter set
  /// in the job definition, but doesn't override any vCPU requirement specified
  /// in the <code>resourceRequirements</code> structure in the job definition. To
  /// override vCPU requirements that are specified in the
  /// <code>resourceRequirements</code> structure in the job definition,
  /// <code>resourceRequirements</code> must be specified in the
  /// <code>SubmitJob</code> request, with <code>type</code> set to
  /// <code>VCPU</code> and <code>value</code> set to the new value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#override-resource-requirements">Can't
  /// override job definition resource requirements</a> in the <i>Batch User
  /// Guide</i>.
  final int? vcpus;

  ContainerOverrides({
    this.command,
    this.environment,
    this.instanceType,
    this.memory,
    this.resourceRequirements,
    this.vcpus,
  });

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environment = this.environment;
    final instanceType = this.instanceType;
    final memory = this.memory;
    final resourceRequirements = this.resourceRequirements;
    final vcpus = this.vcpus;
    return {
      if (command != null) 'command': command,
      if (environment != null) 'environment': environment,
      if (instanceType != null) 'instanceType': instanceType,
      if (memory != null) 'memory': memory,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (vcpus != null) 'vcpus': vcpus,
    };
  }
}

/// Container properties are used for Amazon ECS based job definitions. These
/// properties to describe the container that's launched as part of a job.
class ContainerProperties {
  /// The command that's passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. For
  /// more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">https://docs.docker.com/engine/reference/builder/#cmd</a>.
  final List<String>? command;

  /// The environment variables to pass to a container. This parameter maps to
  /// <code>Env</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--env</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <important>
  /// We don't recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  /// </important> <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<KeyValuePair>? environment;

  /// The amount of ephemeral storage to allocate for the task. This parameter is
  /// used to expand the total amount of ephemeral storage available, beyond the
  /// default amount, for tasks hosted on Fargate.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the execution role that Batch can assume.
  /// For jobs that run on Fargate resources, you must provide an execution role.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html">Batch
  /// execution IAM role</a> in the <i>Batch User Guide</i>.
  final String? executionRoleArn;

  /// The platform configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final FargatePlatformConfiguration? fargatePlatformConfiguration;

  /// Required. The image used to start a container. This string is passed
  /// directly to the Docker daemon. Images in the Docker Hub registry are
  /// available by default. Other repositories are specified with <code>
  /// <i>repository-url</i>/<i>image</i>:<i>tag</i> </code>. It can be 255
  /// characters long. It can contain uppercase and lowercase letters, numbers,
  /// hyphens (-), underscores (_), colons (:), periods (.), forward slashes (/),
  /// and number signs (#). This parameter maps to <code>Image</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>IMAGE</code> parameter of <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// Docker image architecture must match the processor architecture of the
  /// compute resources that they're scheduled on. For example, ARM-based Docker
  /// images can only run on ARM-based compute resources.
  /// </note>
  /// <ul>
  /// <li>
  /// Images in Amazon ECR Public repositories use the full
  /// <code>registry/repository[:tag]</code> or
  /// <code>registry/repository[@digest]</code> naming conventions. For example,
  /// <code>public.ecr.aws/<i>registry_alias</i>/<i>my-web-app</i>:<i>latest</i>
  /// </code>.
  /// </li>
  /// <li>
  /// Images in Amazon ECR repositories use the full registry and repository URI
  /// (for example,
  /// <code>123456789012.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;</code>).
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

  /// The instance type to use for a multi-node parallel job. All node groups in a
  /// multi-node parallel job must use the same instance type.
  /// <note>
  /// This parameter isn't applicable to single-node container jobs or jobs that
  /// run on Fargate resources, and shouldn't be provided.
  /// </note>
  final String? instanceType;

  /// The Amazon Resource Name (ARN) of the IAM role that the container can assume
  /// for Amazon Web Services permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// roles for tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? jobRoleArn;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  final LinuxParameters? linuxParameters;

  /// The log configuration specification for the container.
  ///
  /// This parameter maps to <code>LogConfig</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--log-driver</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. By
  /// default, containers use the same logging driver that the Docker daemon uses.
  /// However the container might use a different logging driver than the Docker
  /// daemon by specifying a log driver with this parameter in the container
  /// definition. To use a different logging driver for a container, the log
  /// system must be configured properly on the container instance (or on a
  /// different log server for remote logging options). For more information on
  /// the options for different supported log drivers, see <a
  /// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
  /// logging drivers</a> in the Docker documentation.
  /// <note>
  /// Batch currently supports a subset of the logging drivers available to the
  /// Docker daemon (shown in the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-batch-jobdefinition-containerproperties-logconfiguration.html">LogConfiguration</a>
  /// data type).
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: <code>sudo docker version | grep "Server API version"</code>
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// the logging drivers available on that instance with the
  /// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
  /// containers placed on that instance can use these log configuration options.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS container agent configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final LogConfiguration? logConfiguration;

  /// This parameter is deprecated, use <code>resourceRequirements</code> to
  /// specify the memory requirements for the job definition. It's not supported
  /// for jobs running on Fargate resources. For jobs that run on Amazon EC2
  /// resources, it specifies the memory hard limit (in MiB) for a container. If
  /// your container attempts to exceed the specified number, it's terminated. You
  /// must specify at least 4 MiB of memory for a job using this parameter. The
  /// memory hard limit can be specified in several places. It must be specified
  /// for each node at least once.
  final int? memory;

  /// The mount points for data volumes in your container. This parameter maps to
  /// <code>Volumes</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--volume</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  final List<MountPoint>? mountPoints;

  /// The network configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final NetworkConfiguration? networkConfiguration;

  /// When this parameter is true, the container is given elevated permissions on
  /// the host container instance (similar to the <code>root</code> user). This
  /// parameter maps to <code>Privileged</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--privileged</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. The
  /// default value is false.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources and shouldn't be provided, or specified as false.
  /// </note>
  final bool? privileged;

  /// When this parameter is true, the container is given read-only access to its
  /// root file system. This parameter maps to <code>ReadonlyRootfs</code> in the
  /// <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--read-only</code> option to <code>docker run</code>.
  final bool? readonlyRootFilesystem;

  /// The private repository authentication credentials to use.
  final RepositoryCredentials? repositoryCredentials;

  /// The type and amount of resources to assign to a container. The supported
  /// resources include <code>GPU</code>, <code>MEMORY</code>, and
  /// <code>VCPU</code>.
  final List<ResourceRequirement>? resourceRequirements;

  /// An object that represents the compute environment architecture for Batch
  /// jobs on Fargate.
  final RuntimePlatform? runtimePlatform;

  /// The secrets for the container. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html">Specifying
  /// sensitive data</a> in the <i>Batch User Guide</i>.
  final List<Secret>? secrets;

  /// A list of <code>ulimits</code> to set in the container. This parameter maps
  /// to <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources and shouldn't be provided.
  /// </note>
  final List<Ulimit>? ulimits;

  /// The user name to use inside the container. This parameter maps to
  /// <code>User</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--user</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  final String? user;

  /// This parameter is deprecated, use <code>resourceRequirements</code> to
  /// specify the vCPU requirements for the job definition. It's not supported for
  /// jobs running on Fargate resources. For jobs running on Amazon EC2 resources,
  /// it specifies the number of vCPUs reserved for the job.
  ///
  /// Each vCPU is equivalent to 1,024 CPU shares. This parameter maps to
  /// <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. The
  /// number of vCPUs must be specified but can be specified in several places.
  /// You must specify it at least once for each node.
  final int? vcpus;

  /// A list of data volumes used in a job.
  final List<Volume>? volumes;

  ContainerProperties({
    this.command,
    this.environment,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.fargatePlatformConfiguration,
    this.image,
    this.instanceType,
    this.jobRoleArn,
    this.linuxParameters,
    this.logConfiguration,
    this.memory,
    this.mountPoints,
    this.networkConfiguration,
    this.privileged,
    this.readonlyRootFilesystem,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.runtimePlatform,
    this.secrets,
    this.ulimits,
    this.user,
    this.vcpus,
    this.volumes,
  });

  factory ContainerProperties.fromJson(Map<String, dynamic> json) {
    return ContainerProperties(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      fargatePlatformConfiguration: json['fargatePlatformConfiguration'] != null
          ? FargatePlatformConfiguration.fromJson(
              json['fargatePlatformConfiguration'] as Map<String, dynamic>)
          : null,
      image: json['image'] as String?,
      instanceType: json['instanceType'] as String?,
      jobRoleArn: json['jobRoleArn'] as String?,
      linuxParameters: json['linuxParameters'] != null
          ? LinuxParameters.fromJson(
              json['linuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      memory: json['memory'] as int?,
      mountPoints: (json['mountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MountPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      privileged: json['privileged'] as bool?,
      readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool?,
      repositoryCredentials: json['repositoryCredentials'] != null
          ? RepositoryCredentials.fromJson(
              json['repositoryCredentials'] as Map<String, dynamic>)
          : null,
      resourceRequirements: (json['resourceRequirements'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimePlatform: json['runtimePlatform'] != null
          ? RuntimePlatform.fromJson(
              json['runtimePlatform'] as Map<String, dynamic>)
          : null,
      secrets: (json['secrets'] as List?)
          ?.whereNotNull()
          .map((e) => Secret.fromJson(e as Map<String, dynamic>))
          .toList(),
      ulimits: (json['ulimits'] as List?)
          ?.whereNotNull()
          .map((e) => Ulimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
      vcpus: json['vcpus'] as int?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environment = this.environment;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final fargatePlatformConfiguration = this.fargatePlatformConfiguration;
    final image = this.image;
    final instanceType = this.instanceType;
    final jobRoleArn = this.jobRoleArn;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final memory = this.memory;
    final mountPoints = this.mountPoints;
    final networkConfiguration = this.networkConfiguration;
    final privileged = this.privileged;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final runtimePlatform = this.runtimePlatform;
    final secrets = this.secrets;
    final ulimits = this.ulimits;
    final user = this.user;
    final vcpus = this.vcpus;
    final volumes = this.volumes;
    return {
      if (command != null) 'command': command,
      if (environment != null) 'environment': environment,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (fargatePlatformConfiguration != null)
        'fargatePlatformConfiguration': fargatePlatformConfiguration,
      if (image != null) 'image': image,
      if (instanceType != null) 'instanceType': instanceType,
      if (jobRoleArn != null) 'jobRoleArn': jobRoleArn,
      if (linuxParameters != null) 'linuxParameters': linuxParameters,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (memory != null) 'memory': memory,
      if (mountPoints != null) 'mountPoints': mountPoints,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (privileged != null) 'privileged': privileged,
      if (readonlyRootFilesystem != null)
        'readonlyRootFilesystem': readonlyRootFilesystem,
      if (repositoryCredentials != null)
        'repositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
      if (secrets != null) 'secrets': secrets,
      if (ulimits != null) 'ulimits': ulimits,
      if (user != null) 'user': user,
      if (vcpus != null) 'vcpus': vcpus,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// An object that represents summary details of a container within a job.
class ContainerSummary {
  /// The exit code to return upon completion.
  final int? exitCode;

  /// A short (255 max characters) human-readable string to provide additional
  /// details for a running or stopped container.
  final String? reason;

  ContainerSummary({
    this.exitCode,
    this.reason,
  });

  factory ContainerSummary.fromJson(Map<String, dynamic> json) {
    return ContainerSummary(
      exitCode: json['exitCode'] as int?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exitCode = this.exitCode;
    final reason = this.reason;
    return {
      if (exitCode != null) 'exitCode': exitCode,
      if (reason != null) 'reason': reason,
    };
  }
}

class CreateComputeEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the compute environment.
  final String? computeEnvironmentArn;

  /// The name of the compute environment. It can be up to 128 characters long. It
  /// can contain uppercase and lowercase letters, numbers, hyphens (-), and
  /// underscores (_).
  final String? computeEnvironmentName;

  CreateComputeEnvironmentResponse({
    this.computeEnvironmentArn,
    this.computeEnvironmentName,
  });

  factory CreateComputeEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateComputeEnvironmentResponse(
      computeEnvironmentArn: json['computeEnvironmentArn'] as String?,
      computeEnvironmentName: json['computeEnvironmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironmentArn = this.computeEnvironmentArn;
    final computeEnvironmentName = this.computeEnvironmentName;
    return {
      if (computeEnvironmentArn != null)
        'computeEnvironmentArn': computeEnvironmentArn,
      if (computeEnvironmentName != null)
        'computeEnvironmentName': computeEnvironmentName,
    };
  }
}

class CreateJobQueueResponse {
  /// The Amazon Resource Name (ARN) of the job queue.
  final String jobQueueArn;

  /// The name of the job queue.
  final String jobQueueName;

  CreateJobQueueResponse({
    required this.jobQueueArn,
    required this.jobQueueName,
  });

  factory CreateJobQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobQueueResponse(
      jobQueueArn: json['jobQueueArn'] as String,
      jobQueueName: json['jobQueueName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobQueueArn = this.jobQueueArn;
    final jobQueueName = this.jobQueueName;
    return {
      'jobQueueArn': jobQueueArn,
      'jobQueueName': jobQueueName,
    };
  }
}

class CreateSchedulingPolicyResponse {
  /// The Amazon Resource Name (ARN) of the scheduling policy. The format is
  /// <code>aws:<i>Partition</i>:batch:<i>Region</i>:<i>Account</i>:scheduling-policy/<i>Name</i>
  /// </code>. For example,
  /// <code>aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy</code>.
  final String arn;

  /// The name of the scheduling policy.
  final String name;

  CreateSchedulingPolicyResponse({
    required this.arn,
    required this.name,
  });

  factory CreateSchedulingPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateSchedulingPolicyResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      'arn': arn,
      'name': name,
    };
  }
}

class DeleteComputeEnvironmentResponse {
  DeleteComputeEnvironmentResponse();

  factory DeleteComputeEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteComputeEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteJobQueueResponse {
  DeleteJobQueueResponse();

  factory DeleteJobQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteJobQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSchedulingPolicyResponse {
  DeleteSchedulingPolicyResponse();

  factory DeleteSchedulingPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSchedulingPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterJobDefinitionResponse {
  DeregisterJobDefinitionResponse();

  factory DeregisterJobDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterJobDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeComputeEnvironmentsResponse {
  /// The list of compute environments.
  final List<ComputeEnvironmentDetail>? computeEnvironments;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeComputeEnvironments</code> request. When the results of a
  /// <code>DescribeComputeEnvironments</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  DescribeComputeEnvironmentsResponse({
    this.computeEnvironments,
    this.nextToken,
  });

  factory DescribeComputeEnvironmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeComputeEnvironmentsResponse(
      computeEnvironments: (json['computeEnvironments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ComputeEnvironmentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironments = this.computeEnvironments;
    final nextToken = this.nextToken;
    return {
      if (computeEnvironments != null)
        'computeEnvironments': computeEnvironments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeJobDefinitionsResponse {
  /// The list of job definitions.
  final List<JobDefinition>? jobDefinitions;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeJobDefinitions</code> request. When the results of a
  /// <code>DescribeJobDefinitions</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  DescribeJobDefinitionsResponse({
    this.jobDefinitions,
    this.nextToken,
  });

  factory DescribeJobDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobDefinitionsResponse(
      jobDefinitions: (json['jobDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => JobDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinitions = this.jobDefinitions;
    final nextToken = this.nextToken;
    return {
      if (jobDefinitions != null) 'jobDefinitions': jobDefinitions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeJobQueuesResponse {
  /// The list of job queues.
  final List<JobQueueDetail>? jobQueues;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeJobQueues</code> request. When the results of a
  /// <code>DescribeJobQueues</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  DescribeJobQueuesResponse({
    this.jobQueues,
    this.nextToken,
  });

  factory DescribeJobQueuesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobQueuesResponse(
      jobQueues: (json['jobQueues'] as List?)
          ?.whereNotNull()
          .map((e) => JobQueueDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobQueues = this.jobQueues;
    final nextToken = this.nextToken;
    return {
      if (jobQueues != null) 'jobQueues': jobQueues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeJobsResponse {
  /// The list of jobs.
  final List<JobDetail>? jobs;

  DescribeJobsResponse({
    this.jobs,
  });

  factory DescribeJobsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => JobDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    return {
      if (jobs != null) 'jobs': jobs,
    };
  }
}

class DescribeSchedulingPoliciesResponse {
  /// The list of scheduling policies.
  final List<SchedulingPolicyDetail>? schedulingPolicies;

  DescribeSchedulingPoliciesResponse({
    this.schedulingPolicies,
  });

  factory DescribeSchedulingPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSchedulingPoliciesResponse(
      schedulingPolicies: (json['schedulingPolicies'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SchedulingPolicyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final schedulingPolicies = this.schedulingPolicies;
    return {
      if (schedulingPolicies != null) 'schedulingPolicies': schedulingPolicies,
    };
  }
}

/// An object that represents a container instance host device.
/// <note>
/// This object isn't applicable to jobs that are running on Fargate resources
/// and shouldn't be provided.
/// </note>
class Device {
  /// The path for the device on the host container instance.
  final String hostPath;

  /// The path inside the container that's used to expose the host device. By
  /// default, the <code>hostPath</code> value is used.
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
        return 'READ';
      case DeviceCgroupPermission.write:
        return 'WRITE';
      case DeviceCgroupPermission.mknod:
        return 'MKNOD';
    }
  }
}

extension DeviceCgroupPermissionFromString on String {
  DeviceCgroupPermission toDeviceCgroupPermission() {
    switch (this) {
      case 'READ':
        return DeviceCgroupPermission.read;
      case 'WRITE':
        return DeviceCgroupPermission.write;
      case 'MKNOD':
        return DeviceCgroupPermission.mknod;
    }
    throw Exception('$this is not known in enum DeviceCgroupPermission');
  }
}

/// The authorization configuration details for the Amazon EFS file system.
class EFSAuthorizationConfig {
  /// The Amazon EFS access point ID to use. If an access point is specified, the
  /// root directory value specified in the <code>EFSVolumeConfiguration</code>
  /// must either be omitted or set to <code>/</code> which enforces the path set
  /// on the EFS access point. If an access point is used, transit encryption must
  /// be enabled in the <code>EFSVolumeConfiguration</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html">Working
  /// with Amazon EFS access points</a> in the <i>Amazon Elastic File System User
  /// Guide</i>.
  final String? accessPointId;

  /// Whether or not to use the Batch job IAM role defined in a job definition
  /// when mounting the Amazon EFS file system. If enabled, transit encryption
  /// must be enabled in the <code>EFSVolumeConfiguration</code>. If this
  /// parameter is omitted, the default value of <code>DISABLED</code> is used.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/efs-volumes.html#efs-volume-accesspoints">Using
  /// Amazon EFS access points</a> in the <i>Batch User Guide</i>. EFS IAM
  /// authorization requires that <code>TransitEncryption</code> be
  /// <code>ENABLED</code> and that a <code>JobRoleArn</code> is specified.
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

/// This is used when you're using an Amazon Elastic File System file system for
/// job storage. For more information, see <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/efs-volumes.html">Amazon
/// EFS Volumes</a> in the <i>Batch User Guide</i>.
class EFSVolumeConfiguration {
  /// The Amazon EFS file system ID to use.
  final String fileSystemId;

  /// The authorization configuration details for the Amazon EFS file system.
  final EFSAuthorizationConfig? authorizationConfig;

  /// The directory within the Amazon EFS file system to mount as the root
  /// directory inside the host. If this parameter is omitted, the root of the
  /// Amazon EFS volume is used instead. Specifying <code>/</code> has the same
  /// effect as omitting this parameter. The maximum length is 4,096 characters.
  /// <important>
  /// If an EFS access point is specified in the <code>authorizationConfig</code>,
  /// the root directory parameter must either be omitted or set to
  /// <code>/</code>, which enforces the path set on the Amazon EFS access point.
  /// </important>
  final String? rootDirectory;

  /// Determines whether to enable encryption for Amazon EFS data in transit
  /// between the Amazon ECS host and the Amazon EFS server. Transit encryption
  /// must be enabled if Amazon EFS IAM authorization is used. If this parameter
  /// is omitted, the default value of <code>DISABLED</code> is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/encryption-in-transit.html">Encrypting
  /// data in transit</a> in the <i>Amazon Elastic File System User Guide</i>.
  final EFSTransitEncryption? transitEncryption;

  /// The port to use when sending encrypted data between the Amazon ECS host and
  /// the Amazon EFS server. If you don't specify a transit encryption port, it
  /// uses the port selection strategy that the Amazon EFS mount helper uses. The
  /// value must be between 0 and 65,535. For more information, see <a
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

/// Provides information used to select Amazon Machine Images (AMIs) for
/// instances in the compute environment. If <code>Ec2Configuration</code> isn't
/// specified, the default is <code>ECS_AL2</code> (<a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#al2ami">Amazon
/// Linux 2</a>).
/// <note>
/// This object isn't applicable to jobs that are running on Fargate resources.
/// </note>
class Ec2Configuration {
  /// The image type to match with the instance type to select an AMI. The
  /// supported values are different for <code>ECS</code> and <code>EKS</code>
  /// resources.
  /// <dl> <dt>ECS</dt> <dd>
  /// If the <code>imageIdOverride</code> parameter isn't specified, then a recent
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#al2ami">Amazon
  /// ECS-optimized Amazon Linux 2 AMI</a> (<code>ECS_AL2</code>) is used. If a
  /// new image type is specified in an update, but neither an
  /// <code>imageId</code> nor a <code>imageIdOverride</code> parameter is
  /// specified, then the latest Amazon ECS optimized AMI for that image type
  /// that's supported by Batch is used.
  /// <dl> <dt>ECS_AL2</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#al2ami">Amazon
  /// Linux 2</a>: Default for all non-GPU instance families.
  /// </dd> <dt>ECS_AL2_NVIDIA</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#gpuami">Amazon
  /// Linux 2 (GPU)</a>: Default for all GPU instance families (for example
  /// <code>P4</code> and <code>G4</code>) and can be used for all non Amazon Web
  /// Services Graviton-based instance types.
  /// </dd> <dt>ECS_AL2023</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html">Amazon
  /// Linux 2023</a>: Batch supports Amazon Linux 2023.
  /// <note>
  /// Amazon Linux 2023 does not support <code>A1</code> instances.
  /// </note> </dd> <dt>ECS_AL1</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#alami">Amazon
  /// Linux</a>. Amazon Linux has reached the end-of-life of standard support. For
  /// more information, see <a
  /// href="http://aws.amazon.com/amazon-linux-ami/">Amazon Linux AMI</a>.
  /// </dd> </dl> </dd> <dt>EKS</dt> <dd>
  /// If the <code>imageIdOverride</code> parameter isn't specified, then a recent
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html">Amazon
  /// EKS-optimized Amazon Linux AMI</a> (<code>EKS_AL2</code>) is used. If a new
  /// image type is specified in an update, but neither an <code>imageId</code>
  /// nor a <code>imageIdOverride</code> parameter is specified, then the latest
  /// Amazon EKS optimized AMI for that image type that Batch supports is used.
  /// <dl> <dt>EKS_AL2</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html">Amazon
  /// Linux 2</a>: Default for all non-GPU instance families.
  /// </dd> <dt>EKS_AL2_NVIDIA</dt> <dd>
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html">Amazon
  /// Linux 2 (accelerated)</a>: Default for all GPU instance families (for
  /// example, <code>P4</code> and <code>G4</code>) and can be used for all non
  /// Amazon Web Services Graviton-based instance types.
  /// </dd> </dl> </dd> </dl>
  final String imageType;

  /// The AMI ID used for instances launched in the compute environment that match
  /// the image type. This setting overrides the <code>imageId</code> set in the
  /// <code>computeResource</code> object.
  /// <note>
  /// The AMI that you choose for a compute environment must match the
  /// architecture of the instance types that you intend to use for that compute
  /// environment. For example, if your compute environment uses A1 instance
  /// types, the compute resource AMI that you choose must support ARM instances.
  /// Amazon ECS vends both x86 and ARM versions of the Amazon ECS-optimized
  /// Amazon Linux 2 AMI. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux-variants.html">Amazon
  /// ECS-optimized Amazon Linux 2 AMI</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final String? imageIdOverride;

  /// The Kubernetes version for the compute environment. If you don't specify a
  /// value, the latest version that Batch supports is used.
  final String? imageKubernetesVersion;

  Ec2Configuration({
    required this.imageType,
    this.imageIdOverride,
    this.imageKubernetesVersion,
  });

  factory Ec2Configuration.fromJson(Map<String, dynamic> json) {
    return Ec2Configuration(
      imageType: json['imageType'] as String,
      imageIdOverride: json['imageIdOverride'] as String?,
      imageKubernetesVersion: json['imageKubernetesVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageType = this.imageType;
    final imageIdOverride = this.imageIdOverride;
    final imageKubernetesVersion = this.imageKubernetesVersion;
    return {
      'imageType': imageType,
      if (imageIdOverride != null) 'imageIdOverride': imageIdOverride,
      if (imageKubernetesVersion != null)
        'imageKubernetesVersion': imageKubernetesVersion,
    };
  }
}

/// An object that contains the properties for the Amazon ECS resources of a
/// job.
class EcsProperties {
  /// An object that contains the properties for the Amazon ECS task definition of
  /// a job.
  /// <note>
  /// This object is currently limited to one element.
  /// </note>
  final List<EcsTaskProperties> taskProperties;

  EcsProperties({
    required this.taskProperties,
  });

  factory EcsProperties.fromJson(Map<String, dynamic> json) {
    return EcsProperties(
      taskProperties: (json['taskProperties'] as List)
          .whereNotNull()
          .map((e) => EcsTaskProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final taskProperties = this.taskProperties;
    return {
      'taskProperties': taskProperties,
    };
  }
}

/// An object that contains the details for the Amazon ECS resources of a job.
class EcsPropertiesDetail {
  /// The properties for the Amazon ECS task definition of a job.
  final List<EcsTaskDetails>? taskProperties;

  EcsPropertiesDetail({
    this.taskProperties,
  });

  factory EcsPropertiesDetail.fromJson(Map<String, dynamic> json) {
    return EcsPropertiesDetail(
      taskProperties: (json['taskProperties'] as List?)
          ?.whereNotNull()
          .map((e) => EcsTaskDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final taskProperties = this.taskProperties;
    return {
      if (taskProperties != null) 'taskProperties': taskProperties,
    };
  }
}

/// An object that contains overrides for the Amazon ECS task definition of a
/// job.
class EcsPropertiesOverride {
  /// The overrides for the Amazon ECS task definition of a job.
  /// <note>
  /// This object is currently limited to one element.
  /// </note>
  final List<TaskPropertiesOverride>? taskProperties;

  EcsPropertiesOverride({
    this.taskProperties,
  });

  Map<String, dynamic> toJson() {
    final taskProperties = this.taskProperties;
    return {
      if (taskProperties != null) 'taskProperties': taskProperties,
    };
  }
}

/// The details of a task definition that describes the container and volume
/// definitions of an Amazon ECS task.
class EcsTaskDetails {
  /// The Amazon Resource Name (ARN) of the container instance that hosts the
  /// task.
  final String? containerInstanceArn;

  /// A list of containers that are included in the <code>taskProperties</code>
  /// list.
  final List<TaskContainerDetails>? containers;

  /// The amount of ephemeral storage allocated for the task.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the execution role that Batch can assume.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html">Batch
  /// execution IAM role</a> in the <i>Batch User Guide</i>.
  final String? executionRoleArn;

  /// The IPC resource namespace to use for the containers in the task.
  final String? ipcMode;

  /// The network configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final NetworkConfiguration? networkConfiguration;

  /// The process namespace to use for the containers in the task.
  final String? pidMode;

  /// The Fargate platform version where the jobs are running.
  final String? platformVersion;

  /// An object that represents the compute environment architecture for Batch
  /// jobs on Fargate.
  final RuntimePlatform? runtimePlatform;

  /// The ARN of the Amazon ECS task.
  final String? taskArn;

  /// The Amazon Resource Name (ARN) of the IAM role that the container can assume
  /// for Amazon Web Services permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">IAM
  /// roles for tasks</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  /// <note>
  /// This is object is comparable to <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_ContainerProperties.html">ContainerProperties:jobRoleArn</a>.
  /// </note>
  final String? taskRoleArn;

  /// A list of data volumes used in a job.
  final List<Volume>? volumes;

  EcsTaskDetails({
    this.containerInstanceArn,
    this.containers,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.ipcMode,
    this.networkConfiguration,
    this.pidMode,
    this.platformVersion,
    this.runtimePlatform,
    this.taskArn,
    this.taskRoleArn,
    this.volumes,
  });

  factory EcsTaskDetails.fromJson(Map<String, dynamic> json) {
    return EcsTaskDetails(
      containerInstanceArn: json['containerInstanceArn'] as String?,
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => TaskContainerDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      ipcMode: json['ipcMode'] as String?,
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      pidMode: json['pidMode'] as String?,
      platformVersion: json['platformVersion'] as String?,
      runtimePlatform: json['runtimePlatform'] != null
          ? RuntimePlatform.fromJson(
              json['runtimePlatform'] as Map<String, dynamic>)
          : null,
      taskArn: json['taskArn'] as String?,
      taskRoleArn: json['taskRoleArn'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerInstanceArn = this.containerInstanceArn;
    final containers = this.containers;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final ipcMode = this.ipcMode;
    final networkConfiguration = this.networkConfiguration;
    final pidMode = this.pidMode;
    final platformVersion = this.platformVersion;
    final runtimePlatform = this.runtimePlatform;
    final taskArn = this.taskArn;
    final taskRoleArn = this.taskRoleArn;
    final volumes = this.volumes;
    return {
      if (containerInstanceArn != null)
        'containerInstanceArn': containerInstanceArn,
      if (containers != null) 'containers': containers,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (ipcMode != null) 'ipcMode': ipcMode,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (pidMode != null) 'pidMode': pidMode,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
      if (taskArn != null) 'taskArn': taskArn,
      if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// The properties for a task definition that describes the container and volume
/// definitions of an Amazon ECS task. You can specify which Docker images to
/// use, the required resources, and other configurations related to launching
/// the task definition through an Amazon ECS service or task.
class EcsTaskProperties {
  /// This object is a list of containers.
  final List<TaskContainerProperties> containers;

  /// The amount of ephemeral storage to allocate for the task. This parameter is
  /// used to expand the total amount of ephemeral storage available, beyond the
  /// default amount, for tasks hosted on Fargate.
  final EphemeralStorage? ephemeralStorage;

  /// The Amazon Resource Name (ARN) of the execution role that Batch can assume.
  /// For jobs that run on Fargate resources, you must provide an execution role.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html">Batch
  /// execution IAM role</a> in the <i>Batch User Guide</i>.
  final String? executionRoleArn;

  /// The IPC resource namespace to use for the containers in the task. The valid
  /// values are <code>host</code>, <code>task</code>, or <code>none</code>.
  ///
  /// If <code>host</code> is specified, all containers within the tasks that
  /// specified the <code>host</code> IPC mode on the same container instance
  /// share the same IPC resources with the host Amazon EC2 instance.
  ///
  /// If <code>task</code> is specified, all containers within the specified
  /// <code>task</code> share the same IPC resources.
  ///
  /// If <code>none</code> is specified, the IPC resources within the containers
  /// of a task are private, and are not shared with other containers in a task or
  /// on the container instance.
  ///
  /// If no value is specified, then the IPC resource namespace sharing depends on
  /// the Docker daemon setting on the container instance. For more information,
  /// see <a
  /// href="https://docs.docker.com/engine/reference/run/#ipc-settings---ipc">IPC
  /// settings</a> in the Docker run reference.
  final String? ipcMode;

  /// The network configuration for jobs that are running on Fargate resources.
  /// Jobs that are running on Amazon EC2 resources must not specify this
  /// parameter.
  final NetworkConfiguration? networkConfiguration;

  /// The process namespace to use for the containers in the task. The valid
  /// values are <code>host</code> or <code>task</code>. For example, monitoring
  /// sidecars might need <code>pidMode</code> to access information about other
  /// containers running in the same task.
  ///
  /// If <code>host</code> is specified, all containers within the tasks that
  /// specified the <code>host</code> PID mode on the same container instance
  /// share the process namespace with the host Amazon EC2 instance.
  ///
  /// If <code>task</code> is specified, all containers within the specified task
  /// share the same process namespace.
  ///
  /// If no value is specified, the default is a private namespace for each
  /// container. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/run/#pid-settings---pid">PID
  /// settings</a> in the Docker run reference.
  final String? pidMode;

  /// The Fargate platform version where the jobs are running. A platform version
  /// is specified only for jobs that are running on Fargate resources. If one
  /// isn't specified, the <code>LATEST</code> platform version is used by
  /// default. This uses a recent, approved version of the Fargate platform for
  /// compute resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// platform versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  /// An object that represents the compute environment architecture for Batch
  /// jobs on Fargate.
  final RuntimePlatform? runtimePlatform;

  /// The Amazon Resource Name (ARN) that's associated with the Amazon ECS task.
  /// <note>
  /// This is object is comparable to <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_ContainerProperties.html">ContainerProperties:jobRoleArn</a>.
  /// </note>
  final String? taskRoleArn;

  /// A list of volumes that are associated with the job.
  final List<Volume>? volumes;

  EcsTaskProperties({
    required this.containers,
    this.ephemeralStorage,
    this.executionRoleArn,
    this.ipcMode,
    this.networkConfiguration,
    this.pidMode,
    this.platformVersion,
    this.runtimePlatform,
    this.taskRoleArn,
    this.volumes,
  });

  factory EcsTaskProperties.fromJson(Map<String, dynamic> json) {
    return EcsTaskProperties(
      containers: (json['containers'] as List)
          .whereNotNull()
          .map((e) =>
              TaskContainerProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      ephemeralStorage: json['ephemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['ephemeralStorage'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      ipcMode: json['ipcMode'] as String?,
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      pidMode: json['pidMode'] as String?,
      platformVersion: json['platformVersion'] as String?,
      runtimePlatform: json['runtimePlatform'] != null
          ? RuntimePlatform.fromJson(
              json['runtimePlatform'] as Map<String, dynamic>)
          : null,
      taskRoleArn: json['taskRoleArn'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final ephemeralStorage = this.ephemeralStorage;
    final executionRoleArn = this.executionRoleArn;
    final ipcMode = this.ipcMode;
    final networkConfiguration = this.networkConfiguration;
    final pidMode = this.pidMode;
    final platformVersion = this.platformVersion;
    final runtimePlatform = this.runtimePlatform;
    final taskRoleArn = this.taskRoleArn;
    final volumes = this.volumes;
    return {
      'containers': containers,
      if (ephemeralStorage != null) 'ephemeralStorage': ephemeralStorage,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (ipcMode != null) 'ipcMode': ipcMode,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (pidMode != null) 'pidMode': pidMode,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (runtimePlatform != null) 'runtimePlatform': runtimePlatform,
      if (taskRoleArn != null) 'taskRoleArn': taskRoleArn,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// An object that represents the details for an attempt for a job attempt that
/// an Amazon EKS container runs.
class EksAttemptContainerDetail {
  /// The exit code returned for the job attempt. A non-zero exit code is
  /// considered failed.
  final int? exitCode;

  /// The name of a container.
  final String? name;

  /// A short (255 max characters) human-readable string to provide additional
  /// details for a running or stopped container.
  final String? reason;

  EksAttemptContainerDetail({
    this.exitCode,
    this.name,
    this.reason,
  });

  factory EksAttemptContainerDetail.fromJson(Map<String, dynamic> json) {
    return EksAttemptContainerDetail(
      exitCode: json['exitCode'] as int?,
      name: json['name'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exitCode = this.exitCode;
    final name = this.name;
    final reason = this.reason;
    return {
      if (exitCode != null) 'exitCode': exitCode,
      if (name != null) 'name': name,
      if (reason != null) 'reason': reason,
    };
  }
}

/// An object that represents the details of a job attempt for a job attempt by
/// an Amazon EKS container.
class EksAttemptDetail {
  /// The details for the final status of the containers for this job attempt.
  final List<EksAttemptContainerDetail>? containers;

  /// The details for the init containers.
  final List<EksAttemptContainerDetail>? initContainers;

  /// The name of the node for this job attempt.
  final String? nodeName;

  /// The name of the pod for this job attempt.
  final String? podName;

  /// The Unix timestamp (in milliseconds) for when the attempt was started (when
  /// the attempt transitioned from the <code>STARTING</code> state to the
  /// <code>RUNNING</code> state).
  final int? startedAt;

  /// A short, human-readable string to provide additional details for the current
  /// status of the job attempt.
  final String? statusReason;

  /// The Unix timestamp (in milliseconds) for when the attempt was stopped. This
  /// happens when the attempt transitioned from the <code>RUNNING</code> state to
  /// a terminal state, such as <code>SUCCEEDED</code> or <code>FAILED</code>.
  final int? stoppedAt;

  EksAttemptDetail({
    this.containers,
    this.initContainers,
    this.nodeName,
    this.podName,
    this.startedAt,
    this.statusReason,
    this.stoppedAt,
  });

  factory EksAttemptDetail.fromJson(Map<String, dynamic> json) {
    return EksAttemptDetail(
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EksAttemptContainerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      initContainers: (json['initContainers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EksAttemptContainerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeName: json['nodeName'] as String?,
      podName: json['podName'] as String?,
      startedAt: json['startedAt'] as int?,
      statusReason: json['statusReason'] as String?,
      stoppedAt: json['stoppedAt'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final initContainers = this.initContainers;
    final nodeName = this.nodeName;
    final podName = this.podName;
    final startedAt = this.startedAt;
    final statusReason = this.statusReason;
    final stoppedAt = this.stoppedAt;
    return {
      if (containers != null) 'containers': containers,
      if (initContainers != null) 'initContainers': initContainers,
      if (nodeName != null) 'nodeName': nodeName,
      if (podName != null) 'podName': podName,
      if (startedAt != null) 'startedAt': startedAt,
      if (statusReason != null) 'statusReason': statusReason,
      if (stoppedAt != null) 'stoppedAt': stoppedAt,
    };
  }
}

/// Configuration for the Amazon EKS cluster that supports the Batch compute
/// environment. The cluster must exist before the compute environment can be
/// created.
class EksConfiguration {
  /// The Amazon Resource Name (ARN) of the Amazon EKS cluster. An example is
  /// <code>arn:<i>aws</i>:eks:<i>us-east-1</i>:<i>123456789012</i>:cluster/<i>ClusterForBatch</i>
  /// </code>.
  final String eksClusterArn;

  /// The namespace of the Amazon EKS cluster. Batch manages pods in this
  /// namespace. The value can't left empty or null. It must be fewer than 64
  /// characters long, can't be set to <code>default</code>, can't start with
  /// "<code>kube-</code>," and must match this regular expression:
  /// <code>^[a-z0-9]([-a-z0-9]*[a-z0-9])?$</code>. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/">Namespaces</a>
  /// in the Kubernetes documentation.
  final String kubernetesNamespace;

  EksConfiguration({
    required this.eksClusterArn,
    required this.kubernetesNamespace,
  });

  factory EksConfiguration.fromJson(Map<String, dynamic> json) {
    return EksConfiguration(
      eksClusterArn: json['eksClusterArn'] as String,
      kubernetesNamespace: json['kubernetesNamespace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eksClusterArn = this.eksClusterArn;
    final kubernetesNamespace = this.kubernetesNamespace;
    return {
      'eksClusterArn': eksClusterArn,
      'kubernetesNamespace': kubernetesNamespace,
    };
  }
}

/// EKS container properties are used in job definitions for Amazon EKS based
/// job definitions to describe the properties for a container node in the pod
/// that's launched as part of a job. This can't be specified for Amazon ECS
/// based job definitions.
class EksContainer {
  /// The Docker image used to start the container.
  final String image;

  /// An array of arguments to the entrypoint. If this isn't specified, the
  /// <code>CMD</code> of the container image is used. This corresponds to the
  /// <code>args</code> member in the <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#entrypoint">Entrypoint</a>
  /// portion of the <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/">Pod</a>
  /// in Kubernetes. Environment variable references are expanded using the
  /// container's environment.
  ///
  /// If the referenced environment variable doesn't exist, the reference in the
  /// command isn't changed. For example, if the reference is to
  /// "<code>$(NAME1)</code>" and the <code>NAME1</code> environment variable
  /// doesn't exist, the command string will remain "<code>$(NAME1)</code>."
  /// <code>$$</code> is replaced with <code>$</code>, and the resulting string
  /// isn't expanded. For example, <code>$$(VAR_NAME)</code> is passed as
  /// <code>$(VAR_NAME)</code> whether or not the <code>VAR_NAME</code>
  /// environment variable exists. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">Dockerfile
  /// reference: CMD</a> and <a
  /// href="https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/">Define
  /// a command and arguments for a pod</a> in the <i>Kubernetes
  /// documentation</i>.
  final List<String>? args;

  /// The entrypoint for the container. This isn't run within a shell. If this
  /// isn't specified, the <code>ENTRYPOINT</code> of the container image is used.
  /// Environment variable references are expanded using the container's
  /// environment.
  ///
  /// If the referenced environment variable doesn't exist, the reference in the
  /// command isn't changed. For example, if the reference is to
  /// "<code>$(NAME1)</code>" and the <code>NAME1</code> environment variable
  /// doesn't exist, the command string will remain "<code>$(NAME1)</code>."
  /// <code>$$</code> is replaced with <code>$</code> and the resulting string
  /// isn't expanded. For example, <code>$$(VAR_NAME)</code> will be passed as
  /// <code>$(VAR_NAME)</code> whether or not the <code>VAR_NAME</code>
  /// environment variable exists. The entrypoint can't be updated. For more
  /// information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#entrypoint">ENTRYPOINT</a>
  /// in the <i>Dockerfile reference</i> and <a
  /// href="https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/">Define
  /// a command and arguments for a container</a> and <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#entrypoint">Entrypoint</a>
  /// in the <i>Kubernetes documentation</i>.
  final List<String>? command;

  /// The environment variables to pass to a container.
  /// <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<EksContainerEnvironmentVariable>? env;

  /// The image pull policy for the container. Supported values are
  /// <code>Always</code>, <code>IfNotPresent</code>, and <code>Never</code>. This
  /// parameter defaults to <code>IfNotPresent</code>. However, if the
  /// <code>:latest</code> tag is specified, it defaults to <code>Always</code>.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/containers/images/#updating-images">Updating
  /// images</a> in the <i>Kubernetes documentation</i>.
  final String? imagePullPolicy;

  /// The name of the container. If the name isn't specified, the default name
  /// "<code>Default</code>" is used. Each container in a pod must have a unique
  /// name.
  final String? name;

  /// The type and amount of resources to assign to a container. The supported
  /// resources include <code>memory</code>, <code>cpu</code>, and
  /// <code>nvidia.com/gpu</code>. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/">Resource
  /// management for pods and containers</a> in the <i>Kubernetes
  /// documentation</i>.
  final EksContainerResourceRequirements? resources;

  /// The security context for a job. For more information, see <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/">Configure
  /// a security context for a pod or container</a> in the <i>Kubernetes
  /// documentation</i>.
  final EksContainerSecurityContext? securityContext;

  /// The volume mounts for the container. Batch supports <code>emptyDir</code>,
  /// <code>hostPath</code>, and <code>secret</code> volume types. For more
  /// information about volumes and volume mounts in Kubernetes, see <a
  /// href="https://kubernetes.io/docs/concepts/storage/volumes/">Volumes</a> in
  /// the <i>Kubernetes documentation</i>.
  final List<EksContainerVolumeMount>? volumeMounts;

  EksContainer({
    required this.image,
    this.args,
    this.command,
    this.env,
    this.imagePullPolicy,
    this.name,
    this.resources,
    this.securityContext,
    this.volumeMounts,
  });

  factory EksContainer.fromJson(Map<String, dynamic> json) {
    return EksContainer(
      image: json['image'] as String,
      args: (json['args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      env: (json['env'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainerEnvironmentVariable.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      imagePullPolicy: json['imagePullPolicy'] as String?,
      name: json['name'] as String?,
      resources: json['resources'] != null
          ? EksContainerResourceRequirements.fromJson(
              json['resources'] as Map<String, dynamic>)
          : null,
      securityContext: json['securityContext'] != null
          ? EksContainerSecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>)
          : null,
      volumeMounts: (json['volumeMounts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EksContainerVolumeMount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final args = this.args;
    final command = this.command;
    final env = this.env;
    final imagePullPolicy = this.imagePullPolicy;
    final name = this.name;
    final resources = this.resources;
    final securityContext = this.securityContext;
    final volumeMounts = this.volumeMounts;
    return {
      'image': image,
      if (args != null) 'args': args,
      if (command != null) 'command': command,
      if (env != null) 'env': env,
      if (imagePullPolicy != null) 'imagePullPolicy': imagePullPolicy,
      if (name != null) 'name': name,
      if (resources != null) 'resources': resources,
      if (securityContext != null) 'securityContext': securityContext,
      if (volumeMounts != null) 'volumeMounts': volumeMounts,
    };
  }
}

/// The details for container properties that are returned by
/// <code>DescribeJobs</code> for jobs that use Amazon EKS.
class EksContainerDetail {
  /// An array of arguments to the entrypoint. If this isn't specified, the
  /// <code>CMD</code> of the container image is used. This corresponds to the
  /// <code>args</code> member in the <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#entrypoint">Entrypoint</a>
  /// portion of the <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/">Pod</a>
  /// in Kubernetes. Environment variable references are expanded using the
  /// container's environment.
  ///
  /// If the referenced environment variable doesn't exist, the reference in the
  /// command isn't changed. For example, if the reference is to
  /// "<code>$(NAME1)</code>" and the <code>NAME1</code> environment variable
  /// doesn't exist, the command string will remain "<code>$(NAME1)</code>".
  /// <code>$$</code> is replaced with <code>$</code> and the resulting string
  /// isn't expanded. For example, <code>$$(VAR_NAME)</code> is passed as
  /// <code>$(VAR_NAME)</code> whether or not the <code>VAR_NAME</code>
  /// environment variable exists. For more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">Dockerfile
  /// reference: CMD</a> and <a
  /// href="https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/">Define
  /// a command and arguments for a pod</a> in the <i>Kubernetes
  /// documentation</i>.
  final List<String>? args;

  /// The entrypoint for the container. For more information, see <a
  /// href="https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#entrypoint">Entrypoint</a>
  /// in the <i>Kubernetes documentation</i>.
  final List<String>? command;

  /// The environment variables to pass to a container.
  /// <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<EksContainerEnvironmentVariable>? env;

  /// The exit code returned for the job attempt. A non-zero exit code is
  /// considered failed.
  final int? exitCode;

  /// The Docker image used to start the container.
  final String? image;

  /// The image pull policy for the container. Supported values are
  /// <code>Always</code>, <code>IfNotPresent</code>, and <code>Never</code>. This
  /// parameter defaults to <code>Always</code> if the <code>:latest</code> tag is
  /// specified, <code>IfNotPresent</code> otherwise. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/containers/images/#updating-images">Updating
  /// images</a> in the <i>Kubernetes documentation</i>.
  final String? imagePullPolicy;

  /// The name of the container. If the name isn't specified, the default name
  /// "<code>Default</code>" is used. Each container in a pod must have a unique
  /// name.
  final String? name;

  /// A short human-readable string to provide additional details for a running or
  /// stopped container. It can be up to 255 characters long.
  final String? reason;

  /// The type and amount of resources to assign to a container. The supported
  /// resources include <code>memory</code>, <code>cpu</code>, and
  /// <code>nvidia.com/gpu</code>. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/">Resource
  /// management for pods and containers</a> in the <i>Kubernetes
  /// documentation</i>.
  final EksContainerResourceRequirements? resources;

  /// The security context for a job. For more information, see <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/">Configure
  /// a security context for a pod or container</a> in the <i>Kubernetes
  /// documentation</i>.
  final EksContainerSecurityContext? securityContext;

  /// The volume mounts for the container. Batch supports <code>emptyDir</code>,
  /// <code>hostPath</code>, and <code>secret</code> volume types. For more
  /// information about volumes and volume mounts in Kubernetes, see <a
  /// href="https://kubernetes.io/docs/concepts/storage/volumes/">Volumes</a> in
  /// the <i>Kubernetes documentation</i>.
  final List<EksContainerVolumeMount>? volumeMounts;

  EksContainerDetail({
    this.args,
    this.command,
    this.env,
    this.exitCode,
    this.image,
    this.imagePullPolicy,
    this.name,
    this.reason,
    this.resources,
    this.securityContext,
    this.volumeMounts,
  });

  factory EksContainerDetail.fromJson(Map<String, dynamic> json) {
    return EksContainerDetail(
      args: (json['args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      env: (json['env'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainerEnvironmentVariable.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      exitCode: json['exitCode'] as int?,
      image: json['image'] as String?,
      imagePullPolicy: json['imagePullPolicy'] as String?,
      name: json['name'] as String?,
      reason: json['reason'] as String?,
      resources: json['resources'] != null
          ? EksContainerResourceRequirements.fromJson(
              json['resources'] as Map<String, dynamic>)
          : null,
      securityContext: json['securityContext'] != null
          ? EksContainerSecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>)
          : null,
      volumeMounts: (json['volumeMounts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EksContainerVolumeMount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final args = this.args;
    final command = this.command;
    final env = this.env;
    final exitCode = this.exitCode;
    final image = this.image;
    final imagePullPolicy = this.imagePullPolicy;
    final name = this.name;
    final reason = this.reason;
    final resources = this.resources;
    final securityContext = this.securityContext;
    final volumeMounts = this.volumeMounts;
    return {
      if (args != null) 'args': args,
      if (command != null) 'command': command,
      if (env != null) 'env': env,
      if (exitCode != null) 'exitCode': exitCode,
      if (image != null) 'image': image,
      if (imagePullPolicy != null) 'imagePullPolicy': imagePullPolicy,
      if (name != null) 'name': name,
      if (reason != null) 'reason': reason,
      if (resources != null) 'resources': resources,
      if (securityContext != null) 'securityContext': securityContext,
      if (volumeMounts != null) 'volumeMounts': volumeMounts,
    };
  }
}

/// An environment variable.
class EksContainerEnvironmentVariable {
  /// The name of the environment variable.
  final String name;

  /// The value of the environment variable.
  final String? value;

  EksContainerEnvironmentVariable({
    required this.name,
    this.value,
  });

  factory EksContainerEnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return EksContainerEnvironmentVariable(
      name: json['name'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// Object representing any Kubernetes overrides to a job definition that's used
/// in a <a
/// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_SubmitJob.html">SubmitJob</a>
/// API operation.
class EksContainerOverride {
  /// The arguments to the entrypoint to send to the container that overrides the
  /// default arguments from the Docker image or the job definition. For more
  /// information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">Dockerfile
  /// reference: CMD</a> and <a
  /// href="https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/">Define
  /// a command an arguments for a pod</a> in the <i>Kubernetes documentation</i>.
  final List<String>? args;

  /// The command to send to the container that overrides the default command from
  /// the Docker image or the job definition.
  final List<String>? command;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch. Or, you
  /// can override the existing environment variables from the Docker image or the
  /// job definition.
  /// <note>
  /// Environment variables cannot start with "<code>AWS_BATCH</code>". This
  /// naming convention is reserved for variables that Batch sets.
  /// </note>
  final List<EksContainerEnvironmentVariable>? env;

  /// The override of the Docker image that's used to start the container.
  final String? image;

  /// A pointer to the container that you want to override. The name must match a
  /// unique container name that you wish to override.
  final String? name;

  /// The type and amount of resources to assign to a container. These override
  /// the settings in the job definition. The supported resources include
  /// <code>memory</code>, <code>cpu</code>, and <code>nvidia.com/gpu</code>. For
  /// more information, see <a
  /// href="https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/">Resource
  /// management for pods and containers</a> in the <i>Kubernetes
  /// documentation</i>.
  final EksContainerResourceRequirements? resources;

  EksContainerOverride({
    this.args,
    this.command,
    this.env,
    this.image,
    this.name,
    this.resources,
  });

  Map<String, dynamic> toJson() {
    final args = this.args;
    final command = this.command;
    final env = this.env;
    final image = this.image;
    final name = this.name;
    final resources = this.resources;
    return {
      if (args != null) 'args': args,
      if (command != null) 'command': command,
      if (env != null) 'env': env,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (resources != null) 'resources': resources,
    };
  }
}

/// The type and amount of resources to assign to a container. The supported
/// resources include <code>memory</code>, <code>cpu</code>, and
/// <code>nvidia.com/gpu</code>. For more information, see <a
/// href="https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/">Resource
/// management for pods and containers</a> in the <i>Kubernetes
/// documentation</i>.
class EksContainerResourceRequirements {
  /// The type and quantity of the resources to reserve for the container. The
  /// values vary based on the <code>name</code> that's specified. Resources can
  /// be requested using either the <code>limits</code> or the
  /// <code>requests</code> objects.
  /// <dl> <dt>memory</dt> <dd>
  /// The memory hard limit (in MiB) for the container, using whole integers, with
  /// a "Mi" suffix. If your container attempts to exceed the memory specified,
  /// the container is terminated. You must specify at least 4 MiB of memory for a
  /// job. <code>memory</code> can be specified in <code>limits</code>,
  /// <code>requests</code>, or both. If <code>memory</code> is specified in both
  /// places, then the value that's specified in <code>limits</code> must be equal
  /// to the value that's specified in <code>requests</code>.
  /// <note>
  /// To maximize your resource utilization, provide your jobs with as much memory
  /// as possible for the specific instance type that you are using. To learn how,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html">Memory
  /// management</a> in the <i>Batch User Guide</i>.
  /// </note> </dd> <dt>cpu</dt> <dd>
  /// The number of CPUs that's reserved for the container. Values must be an even
  /// multiple of <code>0.25</code>. <code>cpu</code> can be specified in
  /// <code>limits</code>, <code>requests</code>, or both. If <code>cpu</code> is
  /// specified in both places, then the value that's specified in
  /// <code>limits</code> must be at least as large as the value that's specified
  /// in <code>requests</code>.
  /// </dd> <dt>nvidia.com/gpu</dt> <dd>
  /// The number of GPUs that's reserved for the container. Values must be a whole
  /// integer. <code>memory</code> can be specified in <code>limits</code>,
  /// <code>requests</code>, or both. If <code>memory</code> is specified in both
  /// places, then the value that's specified in <code>limits</code> must be equal
  /// to the value that's specified in <code>requests</code>.
  /// </dd> </dl>
  final Map<String, String>? limits;

  /// The type and quantity of the resources to request for the container. The
  /// values vary based on the <code>name</code> that's specified. Resources can
  /// be requested by using either the <code>limits</code> or the
  /// <code>requests</code> objects.
  /// <dl> <dt>memory</dt> <dd>
  /// The memory hard limit (in MiB) for the container, using whole integers, with
  /// a "Mi" suffix. If your container attempts to exceed the memory specified,
  /// the container is terminated. You must specify at least 4 MiB of memory for a
  /// job. <code>memory</code> can be specified in <code>limits</code>,
  /// <code>requests</code>, or both. If <code>memory</code> is specified in both,
  /// then the value that's specified in <code>limits</code> must be equal to the
  /// value that's specified in <code>requests</code>.
  /// <note>
  /// If you're trying to maximize your resource utilization by providing your
  /// jobs as much memory as possible for a particular instance type, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html">Memory
  /// management</a> in the <i>Batch User Guide</i>.
  /// </note> </dd> <dt>cpu</dt> <dd>
  /// The number of CPUs that are reserved for the container. Values must be an
  /// even multiple of <code>0.25</code>. <code>cpu</code> can be specified in
  /// <code>limits</code>, <code>requests</code>, or both. If <code>cpu</code> is
  /// specified in both, then the value that's specified in <code>limits</code>
  /// must be at least as large as the value that's specified in
  /// <code>requests</code>.
  /// </dd> <dt>nvidia.com/gpu</dt> <dd>
  /// The number of GPUs that are reserved for the container. Values must be a
  /// whole integer. <code>nvidia.com/gpu</code> can be specified in
  /// <code>limits</code>, <code>requests</code>, or both. If
  /// <code>nvidia.com/gpu</code> is specified in both, then the value that's
  /// specified in <code>limits</code> must be equal to the value that's specified
  /// in <code>requests</code>.
  /// </dd> </dl>
  final Map<String, String>? requests;

  EksContainerResourceRequirements({
    this.limits,
    this.requests,
  });

  factory EksContainerResourceRequirements.fromJson(Map<String, dynamic> json) {
    return EksContainerResourceRequirements(
      limits: (json['limits'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requests: (json['requests'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final limits = this.limits;
    final requests = this.requests;
    return {
      if (limits != null) 'limits': limits,
      if (requests != null) 'requests': requests,
    };
  }
}

/// The security context for a job. For more information, see <a
/// href="https://kubernetes.io/docs/tasks/configure-pod-container/security-context/">Configure
/// a security context for a pod or container</a> in the <i>Kubernetes
/// documentation</i>.
class EksContainerSecurityContext {
  /// Whether or not a container or a Kubernetes pod is allowed to gain more
  /// privileges than its parent process. The default value is <code>false</code>.
  final bool? allowPrivilegeEscalation;

  /// When this parameter is <code>true</code>, the container is given elevated
  /// permissions on the host container instance. The level of permissions are
  /// similar to the <code>root</code> user permissions. The default value is
  /// <code>false</code>. This parameter maps to <code>privileged</code> policy in
  /// the <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#privileged">Privileged
  /// pod security policies</a> in the <i>Kubernetes documentation</i>.
  final bool? privileged;

  /// When this parameter is <code>true</code>, the container is given read-only
  /// access to its root file system. The default value is <code>false</code>.
  /// This parameter maps to <code>ReadOnlyRootFilesystem</code> policy in the <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#volumes-and-file-systems">Volumes
  /// and file systems pod security policies</a> in the <i>Kubernetes
  /// documentation</i>.
  final bool? readOnlyRootFilesystem;

  /// When this parameter is specified, the container is run as the specified
  /// group ID (<code>gid</code>). If this parameter isn't specified, the default
  /// is the group that's specified in the image metadata. This parameter maps to
  /// <code>RunAsGroup</code> and <code>MustRunAs</code> policy in the <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#users-and-groups">Users
  /// and groups pod security policies</a> in the <i>Kubernetes documentation</i>.
  final int? runAsGroup;

  /// When this parameter is specified, the container is run as a user with a
  /// <code>uid</code> other than 0. If this parameter isn't specified, so such
  /// rule is enforced. This parameter maps to <code>RunAsUser</code> and
  /// <code>MustRunAsNonRoot</code> policy in the <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#users-and-groups">Users
  /// and groups pod security policies</a> in the <i>Kubernetes documentation</i>.
  final bool? runAsNonRoot;

  /// When this parameter is specified, the container is run as the specified user
  /// ID (<code>uid</code>). If this parameter isn't specified, the default is the
  /// user that's specified in the image metadata. This parameter maps to
  /// <code>RunAsUser</code> and <code>MustRanAs</code> policy in the <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#users-and-groups">Users
  /// and groups pod security policies</a> in the <i>Kubernetes documentation</i>.
  final int? runAsUser;

  EksContainerSecurityContext({
    this.allowPrivilegeEscalation,
    this.privileged,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
  });

  factory EksContainerSecurityContext.fromJson(Map<String, dynamic> json) {
    return EksContainerSecurityContext(
      allowPrivilegeEscalation: json['allowPrivilegeEscalation'] as bool?,
      privileged: json['privileged'] as bool?,
      readOnlyRootFilesystem: json['readOnlyRootFilesystem'] as bool?,
      runAsGroup: json['runAsGroup'] as int?,
      runAsNonRoot: json['runAsNonRoot'] as bool?,
      runAsUser: json['runAsUser'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowPrivilegeEscalation = this.allowPrivilegeEscalation;
    final privileged = this.privileged;
    final readOnlyRootFilesystem = this.readOnlyRootFilesystem;
    final runAsGroup = this.runAsGroup;
    final runAsNonRoot = this.runAsNonRoot;
    final runAsUser = this.runAsUser;
    return {
      if (allowPrivilegeEscalation != null)
        'allowPrivilegeEscalation': allowPrivilegeEscalation,
      if (privileged != null) 'privileged': privileged,
      if (readOnlyRootFilesystem != null)
        'readOnlyRootFilesystem': readOnlyRootFilesystem,
      if (runAsGroup != null) 'runAsGroup': runAsGroup,
      if (runAsNonRoot != null) 'runAsNonRoot': runAsNonRoot,
      if (runAsUser != null) 'runAsUser': runAsUser,
    };
  }
}

/// The volume mounts for a container for an Amazon EKS job. For more
/// information about volumes and volume mounts in Kubernetes, see <a
/// href="https://kubernetes.io/docs/concepts/storage/volumes/">Volumes</a> in
/// the <i>Kubernetes documentation</i>.
class EksContainerVolumeMount {
  /// The path on the container where the volume is mounted.
  final String? mountPath;

  /// The name the volume mount. This must match the name of one of the volumes in
  /// the pod.
  final String? name;

  /// If this value is <code>true</code>, the container has read-only access to
  /// the volume. Otherwise, the container can write to the volume. The default
  /// value is <code>false</code>.
  final bool? readOnly;

  EksContainerVolumeMount({
    this.mountPath,
    this.name,
    this.readOnly,
  });

  factory EksContainerVolumeMount.fromJson(Map<String, dynamic> json) {
    return EksContainerVolumeMount(
      mountPath: json['mountPath'] as String?,
      name: json['name'] as String?,
      readOnly: json['readOnly'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountPath = this.mountPath;
    final name = this.name;
    final readOnly = this.readOnly;
    return {
      if (mountPath != null) 'mountPath': mountPath,
      if (name != null) 'name': name,
      if (readOnly != null) 'readOnly': readOnly,
    };
  }
}

/// Specifies the configuration of a Kubernetes <code>emptyDir</code> volume. An
/// <code>emptyDir</code> volume is first created when a pod is assigned to a
/// node. It exists as long as that pod is running on that node. The
/// <code>emptyDir</code> volume is initially empty. All containers in the pod
/// can read and write the files in the <code>emptyDir</code> volume. However,
/// the <code>emptyDir</code> volume can be mounted at the same or different
/// paths in each container. When a pod is removed from a node for any reason,
/// the data in the <code>emptyDir</code> is deleted permanently. For more
/// information, see <a
/// href="https://kubernetes.io/docs/concepts/storage/volumes/#emptydir">emptyDir</a>
/// in the <i>Kubernetes documentation</i>.
class EksEmptyDir {
  /// The medium to store the volume. The default value is an empty string, which
  /// uses the storage of the node.
  /// <dl> <dt>""</dt> <dd>
  /// <b>(Default)</b> Use the disk storage of the node.
  /// </dd> <dt>"Memory"</dt> <dd>
  /// Use the <code>tmpfs</code> volume that's backed by the RAM of the node.
  /// Contents of the volume are lost when the node reboots, and any storage on
  /// the volume counts against the container's memory limit.
  /// </dd> </dl>
  final String? medium;

  /// The maximum size of the volume. By default, there's no maximum size defined.
  final String? sizeLimit;

  EksEmptyDir({
    this.medium,
    this.sizeLimit,
  });

  factory EksEmptyDir.fromJson(Map<String, dynamic> json) {
    return EksEmptyDir(
      medium: json['medium'] as String?,
      sizeLimit: json['sizeLimit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final medium = this.medium;
    final sizeLimit = this.sizeLimit;
    return {
      if (medium != null) 'medium': medium,
      if (sizeLimit != null) 'sizeLimit': sizeLimit,
    };
  }
}

/// Specifies the configuration of a Kubernetes <code>hostPath</code> volume. A
/// <code>hostPath</code> volume mounts an existing file or directory from the
/// host node's filesystem into your pod. For more information, see <a
/// href="https://kubernetes.io/docs/concepts/storage/volumes/#hostpath">hostPath</a>
/// in the <i>Kubernetes documentation</i>.
class EksHostPath {
  /// The path of the file or directory on the host to mount into containers on
  /// the pod.
  final String? path;

  EksHostPath({
    this.path,
  });

  factory EksHostPath.fromJson(Map<String, dynamic> json) {
    return EksHostPath(
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      if (path != null) 'path': path,
    };
  }
}

/// Describes and uniquely identifies Kubernetes resources. For example, the
/// compute environment that a pod runs in or the <code>jobID</code> for a job
/// running in the pod. For more information, see <a
/// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/">Understanding
/// Kubernetes Objects</a> in the <i>Kubernetes documentation</i>.
class EksMetadata {
  /// Key-value pairs used to identify, sort, and organize cube resources. Can
  /// contain up to 63 uppercase letters, lowercase letters, numbers, hyphens (-),
  /// and underscores (_). Labels can be added or modified at any time. Each
  /// resource can have multiple labels, but each key must be unique for a given
  /// object.
  final Map<String, String>? labels;

  EksMetadata({
    this.labels,
  });

  factory EksMetadata.fromJson(Map<String, dynamic> json) {
    return EksMetadata(
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    return {
      if (labels != null) 'labels': labels,
    };
  }
}

/// The properties for the pod.
class EksPodProperties {
  /// The properties of the container that's used on the Amazon EKS pod.
  final List<EksContainer>? containers;

  /// The DNS policy for the pod. The default value is <code>ClusterFirst</code>.
  /// If the <code>hostNetwork</code> parameter is not specified, the default is
  /// <code>ClusterFirstWithHostNet</code>. <code>ClusterFirst</code> indicates
  /// that any DNS query that does not match the configured cluster domain suffix
  /// is forwarded to the upstream nameserver inherited from the node. For more
  /// information, see <a
  /// href="https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy">Pod's
  /// DNS policy</a> in the <i>Kubernetes documentation</i>.
  ///
  /// Valid values: <code>Default</code> | <code>ClusterFirst</code> |
  /// <code>ClusterFirstWithHostNet</code>
  final String? dnsPolicy;

  /// Indicates if the pod uses the hosts' network IP address. The default value
  /// is <code>true</code>. Setting this to <code>false</code> enables the
  /// Kubernetes pod networking model. Most Batch workloads are egress-only and
  /// don't require the overhead of IP allocation for each pod for incoming
  /// connections. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#host-namespaces">Host
  /// namespaces</a> and <a
  /// href="https://kubernetes.io/docs/concepts/workloads/pods/#pod-networking">Pod
  /// networking</a> in the <i>Kubernetes documentation</i>.
  final bool? hostNetwork;

  /// References a Kubernetes secret resource. It holds a list of secrets. These
  /// secrets help to gain access to pull an images from a private registry.
  ///
  /// <code>ImagePullSecret$name</code> is required when this object is used.
  final List<ImagePullSecret>? imagePullSecrets;

  /// These containers run before application containers, always runs to
  /// completion, and must complete successfully before the next container starts.
  /// These containers are registered with the Amazon EKS Connector agent and
  /// persists the registration information in the Kubernetes backend data store.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/workloads/pods/init-containers/">Init
  /// Containers</a> in the <i>Kubernetes documentation</i>.
  /// <note>
  /// This object is limited to 10 elements
  /// </note>
  final List<EksContainer>? initContainers;

  /// Metadata about the Kubernetes pod. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/">Understanding
  /// Kubernetes Objects</a> in the <i>Kubernetes documentation</i>.
  final EksMetadata? metadata;

  /// The name of the service account that's used to run the pod. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service-accounts.html">Kubernetes
  /// service accounts</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/associate-service-account-role.html">Configure
  /// a Kubernetes service account to assume an IAM role</a> in the <i>Amazon EKS
  /// User Guide</i> and <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/">Configure
  /// service accounts for pods</a> in the <i>Kubernetes documentation</i>.
  final String? serviceAccountName;

  /// Indicates if the processes in a container are shared, or visible, to other
  /// containers in the same pod. For more information, see <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/">Share
  /// Process Namespace between Containers in a Pod</a>.
  final bool? shareProcessNamespace;

  /// Specifies the volumes for a job definition that uses Amazon EKS resources.
  final List<EksVolume>? volumes;

  EksPodProperties({
    this.containers,
    this.dnsPolicy,
    this.hostNetwork,
    this.imagePullSecrets,
    this.initContainers,
    this.metadata,
    this.serviceAccountName,
    this.shareProcessNamespace,
    this.volumes,
  });

  factory EksPodProperties.fromJson(Map<String, dynamic> json) {
    return EksPodProperties(
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      dnsPolicy: json['dnsPolicy'] as String?,
      hostNetwork: json['hostNetwork'] as bool?,
      imagePullSecrets: (json['imagePullSecrets'] as List?)
          ?.whereNotNull()
          .map((e) => ImagePullSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
      initContainers: (json['initContainers'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] != null
          ? EksMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      serviceAccountName: json['serviceAccountName'] as String?,
      shareProcessNamespace: json['shareProcessNamespace'] as bool?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => EksVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final dnsPolicy = this.dnsPolicy;
    final hostNetwork = this.hostNetwork;
    final imagePullSecrets = this.imagePullSecrets;
    final initContainers = this.initContainers;
    final metadata = this.metadata;
    final serviceAccountName = this.serviceAccountName;
    final shareProcessNamespace = this.shareProcessNamespace;
    final volumes = this.volumes;
    return {
      if (containers != null) 'containers': containers,
      if (dnsPolicy != null) 'dnsPolicy': dnsPolicy,
      if (hostNetwork != null) 'hostNetwork': hostNetwork,
      if (imagePullSecrets != null) 'imagePullSecrets': imagePullSecrets,
      if (initContainers != null) 'initContainers': initContainers,
      if (metadata != null) 'metadata': metadata,
      if (serviceAccountName != null) 'serviceAccountName': serviceAccountName,
      if (shareProcessNamespace != null)
        'shareProcessNamespace': shareProcessNamespace,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// The details for the pod.
class EksPodPropertiesDetail {
  /// The properties of the container that's used on the Amazon EKS pod.
  final List<EksContainerDetail>? containers;

  /// The DNS policy for the pod. The default value is <code>ClusterFirst</code>.
  /// If the <code>hostNetwork</code> parameter is not specified, the default is
  /// <code>ClusterFirstWithHostNet</code>. <code>ClusterFirst</code> indicates
  /// that any DNS query that does not match the configured cluster domain suffix
  /// is forwarded to the upstream nameserver inherited from the node. If no value
  /// was specified for <code>dnsPolicy</code> in the <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_RegisterJobDefinition.html">RegisterJobDefinition</a>
  /// API operation, then no value will be returned for <code>dnsPolicy</code> by
  /// either of <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_DescribeJobDefinitions.html">DescribeJobDefinitions</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_DescribeJobs.html">DescribeJobs</a>
  /// API operations. The pod spec setting will contain either
  /// <code>ClusterFirst</code> or <code>ClusterFirstWithHostNet</code>, depending
  /// on the value of the <code>hostNetwork</code> parameter. For more
  /// information, see <a
  /// href="https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy">Pod's
  /// DNS policy</a> in the <i>Kubernetes documentation</i>.
  ///
  /// Valid values: <code>Default</code> | <code>ClusterFirst</code> |
  /// <code>ClusterFirstWithHostNet</code>
  final String? dnsPolicy;

  /// Indicates if the pod uses the hosts' network IP address. The default value
  /// is <code>true</code>. Setting this to <code>false</code> enables the
  /// Kubernetes pod networking model. Most Batch workloads are egress-only and
  /// don't require the overhead of IP allocation for each pod for incoming
  /// connections. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/security/pod-security-policy/#host-namespaces">Host
  /// namespaces</a> and <a
  /// href="https://kubernetes.io/docs/concepts/workloads/pods/#pod-networking">Pod
  /// networking</a> in the <i>Kubernetes documentation</i>.
  final bool? hostNetwork;

  /// Displays the reference pointer to the Kubernetes secret resource. These
  /// secrets help to gain access to pull an images from a private registry.
  final List<ImagePullSecret>? imagePullSecrets;

  /// The container registered with the Amazon EKS Connector agent and persists
  /// the registration information in the Kubernetes backend data store.
  final List<EksContainerDetail>? initContainers;

  /// Describes and uniquely identifies Kubernetes resources. For example, the
  /// compute environment that a pod runs in or the <code>jobID</code> for a job
  /// running in the pod. For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/">Understanding
  /// Kubernetes Objects</a> in the <i>Kubernetes documentation</i>.
  final EksMetadata? metadata;

  /// The name of the node for this job.
  final String? nodeName;

  /// The name of the pod for this job.
  final String? podName;

  /// The name of the service account that's used to run the pod. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service-accounts.html">Kubernetes
  /// service accounts</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/associate-service-account-role.html">Configure
  /// a Kubernetes service account to assume an IAM role</a> in the <i>Amazon EKS
  /// User Guide</i> and <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/">Configure
  /// service accounts for pods</a> in the <i>Kubernetes documentation</i>.
  final String? serviceAccountName;

  /// Indicates if the processes in a container are shared, or visible, to other
  /// containers in the same pod. For more information, see <a
  /// href="https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/">Share
  /// Process Namespace between Containers in a Pod</a>.
  final bool? shareProcessNamespace;

  /// Specifies the volumes for a job definition using Amazon EKS resources.
  final List<EksVolume>? volumes;

  EksPodPropertiesDetail({
    this.containers,
    this.dnsPolicy,
    this.hostNetwork,
    this.imagePullSecrets,
    this.initContainers,
    this.metadata,
    this.nodeName,
    this.podName,
    this.serviceAccountName,
    this.shareProcessNamespace,
    this.volumes,
  });

  factory EksPodPropertiesDetail.fromJson(Map<String, dynamic> json) {
    return EksPodPropertiesDetail(
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      dnsPolicy: json['dnsPolicy'] as String?,
      hostNetwork: json['hostNetwork'] as bool?,
      imagePullSecrets: (json['imagePullSecrets'] as List?)
          ?.whereNotNull()
          .map((e) => ImagePullSecret.fromJson(e as Map<String, dynamic>))
          .toList(),
      initContainers: (json['initContainers'] as List?)
          ?.whereNotNull()
          .map((e) => EksContainerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] != null
          ? EksMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      nodeName: json['nodeName'] as String?,
      podName: json['podName'] as String?,
      serviceAccountName: json['serviceAccountName'] as String?,
      shareProcessNamespace: json['shareProcessNamespace'] as bool?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => EksVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final dnsPolicy = this.dnsPolicy;
    final hostNetwork = this.hostNetwork;
    final imagePullSecrets = this.imagePullSecrets;
    final initContainers = this.initContainers;
    final metadata = this.metadata;
    final nodeName = this.nodeName;
    final podName = this.podName;
    final serviceAccountName = this.serviceAccountName;
    final shareProcessNamespace = this.shareProcessNamespace;
    final volumes = this.volumes;
    return {
      if (containers != null) 'containers': containers,
      if (dnsPolicy != null) 'dnsPolicy': dnsPolicy,
      if (hostNetwork != null) 'hostNetwork': hostNetwork,
      if (imagePullSecrets != null) 'imagePullSecrets': imagePullSecrets,
      if (initContainers != null) 'initContainers': initContainers,
      if (metadata != null) 'metadata': metadata,
      if (nodeName != null) 'nodeName': nodeName,
      if (podName != null) 'podName': podName,
      if (serviceAccountName != null) 'serviceAccountName': serviceAccountName,
      if (shareProcessNamespace != null)
        'shareProcessNamespace': shareProcessNamespace,
      if (volumes != null) 'volumes': volumes,
    };
  }
}

/// An object that contains overrides for the Kubernetes pod properties of a
/// job.
class EksPodPropertiesOverride {
  /// The overrides for the container that's used on the Amazon EKS pod.
  final List<EksContainerOverride>? containers;

  /// The overrides for the conatainers defined in the Amazon EKS pod. These
  /// containers run before application containers, always runs to completion, and
  /// must complete successfully before the next container starts. These
  /// containers are registered with the Amazon EKS Connector agent and persists
  /// the registration information in the Kubernetes backend data store. For more
  /// information, see <a
  /// href="https://kubernetes.io/docs/concepts/workloads/pods/init-containers/">Init
  /// Containers</a> in the <i>Kubernetes documentation</i>.
  /// <note>
  /// This object is limited to 10 elements
  /// </note>
  final List<EksContainerOverride>? initContainers;

  /// Metadata about the overrides for the container that's used on the Amazon EKS
  /// pod.
  final EksMetadata? metadata;

  EksPodPropertiesOverride({
    this.containers,
    this.initContainers,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final initContainers = this.initContainers;
    final metadata = this.metadata;
    return {
      if (containers != null) 'containers': containers,
      if (initContainers != null) 'initContainers': initContainers,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// An object that contains the properties for the Kubernetes resources of a
/// job.
class EksProperties {
  /// The properties for the Kubernetes pod resources of a job.
  final EksPodProperties? podProperties;

  EksProperties({
    this.podProperties,
  });

  factory EksProperties.fromJson(Map<String, dynamic> json) {
    return EksProperties(
      podProperties: json['podProperties'] != null
          ? EksPodProperties.fromJson(
              json['podProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final podProperties = this.podProperties;
    return {
      if (podProperties != null) 'podProperties': podProperties,
    };
  }
}

/// An object that contains the details for the Kubernetes resources of a job.
class EksPropertiesDetail {
  /// The properties for the Kubernetes pod resources of a job.
  final EksPodPropertiesDetail? podProperties;

  EksPropertiesDetail({
    this.podProperties,
  });

  factory EksPropertiesDetail.fromJson(Map<String, dynamic> json) {
    return EksPropertiesDetail(
      podProperties: json['podProperties'] != null
          ? EksPodPropertiesDetail.fromJson(
              json['podProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final podProperties = this.podProperties;
    return {
      if (podProperties != null) 'podProperties': podProperties,
    };
  }
}

/// An object that contains overrides for the Kubernetes resources of a job.
class EksPropertiesOverride {
  /// The overrides for the Kubernetes pod resources of a job.
  final EksPodPropertiesOverride? podProperties;

  EksPropertiesOverride({
    this.podProperties,
  });

  Map<String, dynamic> toJson() {
    final podProperties = this.podProperties;
    return {
      if (podProperties != null) 'podProperties': podProperties,
    };
  }
}

/// Specifies the configuration of a Kubernetes <code>secret</code> volume. For
/// more information, see <a
/// href="https://kubernetes.io/docs/concepts/storage/volumes/#secret">secret</a>
/// in the <i>Kubernetes documentation</i>.
class EksSecret {
  /// The name of the secret. The name must be allowed as a DNS subdomain name.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names">DNS
  /// subdomain names</a> in the <i>Kubernetes documentation</i>.
  final String secretName;

  /// Specifies whether the secret or the secret's keys must be defined.
  final bool? optional;

  EksSecret({
    required this.secretName,
    this.optional,
  });

  factory EksSecret.fromJson(Map<String, dynamic> json) {
    return EksSecret(
      secretName: json['secretName'] as String,
      optional: json['optional'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    final optional = this.optional;
    return {
      'secretName': secretName,
      if (optional != null) 'optional': optional,
    };
  }
}

/// Specifies an Amazon EKS volume for a job definition.
class EksVolume {
  /// The name of the volume. The name must be allowed as a DNS subdomain name.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names">DNS
  /// subdomain names</a> in the <i>Kubernetes documentation</i>.
  final String name;

  /// Specifies the configuration of a Kubernetes <code>emptyDir</code> volume.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/storage/volumes/#emptydir">emptyDir</a>
  /// in the <i>Kubernetes documentation</i>.
  final EksEmptyDir? emptyDir;

  /// Specifies the configuration of a Kubernetes <code>hostPath</code> volume.
  /// For more information, see <a
  /// href="https://kubernetes.io/docs/concepts/storage/volumes/#hostpath">hostPath</a>
  /// in the <i>Kubernetes documentation</i>.
  final EksHostPath? hostPath;

  /// Specifies the configuration of a Kubernetes <code>secret</code> volume. For
  /// more information, see <a
  /// href="https://kubernetes.io/docs/concepts/storage/volumes/#secret">secret</a>
  /// in the <i>Kubernetes documentation</i>.
  final EksSecret? secret;

  EksVolume({
    required this.name,
    this.emptyDir,
    this.hostPath,
    this.secret,
  });

  factory EksVolume.fromJson(Map<String, dynamic> json) {
    return EksVolume(
      name: json['name'] as String,
      emptyDir: json['emptyDir'] != null
          ? EksEmptyDir.fromJson(json['emptyDir'] as Map<String, dynamic>)
          : null,
      hostPath: json['hostPath'] != null
          ? EksHostPath.fromJson(json['hostPath'] as Map<String, dynamic>)
          : null,
      secret: json['secret'] != null
          ? EksSecret.fromJson(json['secret'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final emptyDir = this.emptyDir;
    final hostPath = this.hostPath;
    final secret = this.secret;
    return {
      'name': name,
      if (emptyDir != null) 'emptyDir': emptyDir,
      if (hostPath != null) 'hostPath': hostPath,
      if (secret != null) 'secret': secret,
    };
  }
}

/// The amount of ephemeral storage to allocate for the task. This parameter is
/// used to expand the total amount of ephemeral storage available, beyond the
/// default amount, for tasks hosted on Fargate.
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

/// Specifies an array of up to 5 conditions to be met, and an action to take
/// (<code>RETRY</code> or <code>EXIT</code>) if all conditions are met. If none
/// of the <code>EvaluateOnExit</code> conditions in a
/// <code>RetryStrategy</code> match, then the job is retried.
class EvaluateOnExit {
  /// Specifies the action to take if all of the specified conditions
  /// (<code>onStatusReason</code>, <code>onReason</code>, and
  /// <code>onExitCode</code>) are met. The values aren't case sensitive.
  final RetryAction action;

  /// Contains a glob pattern to match against the decimal representation of the
  /// <code>ExitCode</code> returned for a job. The pattern can be up to 512
  /// characters long. It can contain only numbers, and can end with an asterisk
  /// (*) so that only the start of the string needs to be an exact match.
  ///
  /// The string can contain up to 512 characters.
  final String? onExitCode;

  /// Contains a glob pattern to match against the <code>Reason</code> returned
  /// for a job. The pattern can contain up to 512 characters. It can contain
  /// letters, numbers, periods (.), colons (:), and white space (including spaces
  /// and tabs). It can optionally end with an asterisk (*) so that only the start
  /// of the string needs to be an exact match.
  final String? onReason;

  /// Contains a glob pattern to match against the <code>StatusReason</code>
  /// returned for a job. The pattern can contain up to 512 characters. It can
  /// contain letters, numbers, periods (.), colons (:), and white spaces
  /// (including spaces or tabs). It can optionally end with an asterisk (*) so
  /// that only the start of the string needs to be an exact match.
  final String? onStatusReason;

  EvaluateOnExit({
    required this.action,
    this.onExitCode,
    this.onReason,
    this.onStatusReason,
  });

  factory EvaluateOnExit.fromJson(Map<String, dynamic> json) {
    return EvaluateOnExit(
      action: (json['action'] as String).toRetryAction(),
      onExitCode: json['onExitCode'] as String?,
      onReason: json['onReason'] as String?,
      onStatusReason: json['onStatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final onExitCode = this.onExitCode;
    final onReason = this.onReason;
    final onStatusReason = this.onStatusReason;
    return {
      'action': action.toValue(),
      if (onExitCode != null) 'onExitCode': onExitCode,
      if (onReason != null) 'onReason': onReason,
      if (onStatusReason != null) 'onStatusReason': onStatusReason,
    };
  }
}

/// The fair share policy for a scheduling policy.
class FairsharePolicy {
  /// A value used to reserve some of the available maximum vCPU for fair share
  /// identifiers that aren't already used.
  ///
  /// The reserved ratio is
  /// <code>(<i>computeReservation</i>/100)^<i>ActiveFairShares</i> </code> where
  /// <code> <i>ActiveFairShares</i> </code> is the number of active fair share
  /// identifiers.
  ///
  /// For example, a <code>computeReservation</code> value of 50 indicates that
  /// Batch reserves 50% of the maximum available vCPU if there's only one fair
  /// share identifier. It reserves 25% if there are two fair share identifiers.
  /// It reserves 12.5% if there are three fair share identifiers. A
  /// <code>computeReservation</code> value of 25 indicates that Batch should
  /// reserve 25% of the maximum available vCPU if there's only one fair share
  /// identifier, 6.25% if there are two fair share identifiers, and 1.56% if
  /// there are three fair share identifiers.
  ///
  /// The minimum value is 0 and the maximum value is 99.
  final int? computeReservation;

  /// The amount of time (in seconds) to use to calculate a fair share percentage
  /// for each fair share identifier in use. A value of zero (0) indicates that
  /// only current usage is measured. The decay allows for more recently run jobs
  /// to have more weight than jobs that ran earlier. The maximum supported value
  /// is 604800 (1 week).
  final int? shareDecaySeconds;

  /// An array of <code>SharedIdentifier</code> objects that contain the weights
  /// for the fair share identifiers for the fair share policy. Fair share
  /// identifiers that aren't included have a default weight of <code>1.0</code>.
  final List<ShareAttributes>? shareDistribution;

  FairsharePolicy({
    this.computeReservation,
    this.shareDecaySeconds,
    this.shareDistribution,
  });

  factory FairsharePolicy.fromJson(Map<String, dynamic> json) {
    return FairsharePolicy(
      computeReservation: json['computeReservation'] as int?,
      shareDecaySeconds: json['shareDecaySeconds'] as int?,
      shareDistribution: (json['shareDistribution'] as List?)
          ?.whereNotNull()
          .map((e) => ShareAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final computeReservation = this.computeReservation;
    final shareDecaySeconds = this.shareDecaySeconds;
    final shareDistribution = this.shareDistribution;
    return {
      if (computeReservation != null) 'computeReservation': computeReservation,
      if (shareDecaySeconds != null) 'shareDecaySeconds': shareDecaySeconds,
      if (shareDistribution != null) 'shareDistribution': shareDistribution,
    };
  }
}

/// The platform configuration for jobs that are running on Fargate resources.
/// Jobs that run on Amazon EC2 resources must not specify this parameter.
class FargatePlatformConfiguration {
  /// The Fargate platform version where the jobs are running. A platform version
  /// is specified only for jobs that are running on Fargate resources. If one
  /// isn't specified, the <code>LATEST</code> platform version is used by
  /// default. This uses a recent, approved version of the Fargate platform for
  /// compute resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html">Fargate
  /// platform versions</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final String? platformVersion;

  FargatePlatformConfiguration({
    this.platformVersion,
  });

  factory FargatePlatformConfiguration.fromJson(Map<String, dynamic> json) {
    return FargatePlatformConfiguration(
      platformVersion: json['platformVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final platformVersion = this.platformVersion;
    return {
      if (platformVersion != null) 'platformVersion': platformVersion,
    };
  }
}

/// Contains a list of the first 100 <code>RUNNABLE</code> jobs associated to a
/// single job queue.
class FrontOfQueueDetail {
  /// The Amazon Resource Names (ARNs) of the first 100 <code>RUNNABLE</code> jobs
  /// in a named job queue. For first-in-first-out (FIFO) job queues, jobs are
  /// ordered based on their submission time. For fair share scheduling (FSS) job
  /// queues, jobs are ordered based on their job priority and share usage.
  final List<FrontOfQueueJobSummary>? jobs;

  /// The Unix timestamp (in milliseconds) for when each of the first 100
  /// <code>RUNNABLE</code> jobs were last updated.
  final int? lastUpdatedAt;

  FrontOfQueueDetail({
    this.jobs,
    this.lastUpdatedAt,
  });

  factory FrontOfQueueDetail.fromJson(Map<String, dynamic> json) {
    return FrontOfQueueDetail(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FrontOfQueueJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: json['lastUpdatedAt'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final lastUpdatedAt = this.lastUpdatedAt;
    return {
      if (jobs != null) 'jobs': jobs,
      if (lastUpdatedAt != null) 'lastUpdatedAt': lastUpdatedAt,
    };
  }
}

/// An object that represents summary details for the first 100
/// <code>RUNNABLE</code> jobs in a job queue.
class FrontOfQueueJobSummary {
  /// The Unix timestamp (in milliseconds) for when the job transitioned to its
  /// current position in the job queue.
  final int? earliestTimeAtPosition;

  /// The ARN for a job in a named job queue.
  final String? jobArn;

  FrontOfQueueJobSummary({
    this.earliestTimeAtPosition,
    this.jobArn,
  });

  factory FrontOfQueueJobSummary.fromJson(Map<String, dynamic> json) {
    return FrontOfQueueJobSummary(
      earliestTimeAtPosition: json['earliestTimeAtPosition'] as int?,
      jobArn: json['jobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final earliestTimeAtPosition = this.earliestTimeAtPosition;
    final jobArn = this.jobArn;
    return {
      if (earliestTimeAtPosition != null)
        'earliestTimeAtPosition': earliestTimeAtPosition,
      if (jobArn != null) 'jobArn': jobArn,
    };
  }
}

class GetJobQueueSnapshotResponse {
  /// The list of the first 100 <code>RUNNABLE</code> jobs in each job queue. For
  /// first-in-first-out (FIFO) job queues, jobs are ordered based on their
  /// submission time. For fair share scheduling (FSS) job queues, jobs are
  /// ordered based on their job priority and share usage.
  final FrontOfQueueDetail? frontOfQueue;

  GetJobQueueSnapshotResponse({
    this.frontOfQueue,
  });

  factory GetJobQueueSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return GetJobQueueSnapshotResponse(
      frontOfQueue: json['frontOfQueue'] != null
          ? FrontOfQueueDetail.fromJson(
              json['frontOfQueue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final frontOfQueue = this.frontOfQueue;
    return {
      if (frontOfQueue != null) 'frontOfQueue': frontOfQueue,
    };
  }
}

/// Determine whether your data volume persists on the host container instance
/// and where it's stored. If this parameter is empty, then the Docker daemon
/// assigns a host path for your data volume. However, the data isn't guaranteed
/// to persist after the containers that are associated with it stop running.
class Host {
  /// The path on the host container instance that's presented to the container.
  /// If this parameter is empty, then the Docker daemon has assigned a host path
  /// for you. If this parameter contains a file location, then the data volume
  /// persists at the specified location on the host container instance until you
  /// delete it manually. If the source path location doesn't exist on the host
  /// container instance, the Docker daemon creates it. If the location does
  /// exist, the contents of the source path folder are exported.
  /// <note>
  /// This parameter isn't applicable to jobs that run on Fargate resources. Don't
  /// provide this for these jobs.
  /// </note>
  final String? sourcePath;

  Host({
    this.sourcePath,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
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

/// References a Kubernetes secret resource. This name of the secret must start
/// and end with an alphanumeric character, is required to be lowercase, can
/// include periods (.) and hyphens (-), and can't contain more than 253
/// characters.
class ImagePullSecret {
  /// Provides a unique identifier for the <code>ImagePullSecret</code>. This
  /// object is required when <code>EksPodProperties$imagePullSecrets</code> is
  /// used.
  final String name;

  ImagePullSecret({
    required this.name,
  });

  factory ImagePullSecret.fromJson(Map<String, dynamic> json) {
    return ImagePullSecret(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

enum JQState {
  enabled,
  disabled,
}

extension JQStateValueExtension on JQState {
  String toValue() {
    switch (this) {
      case JQState.enabled:
        return 'ENABLED';
      case JQState.disabled:
        return 'DISABLED';
    }
  }
}

extension JQStateFromString on String {
  JQState toJQState() {
    switch (this) {
      case 'ENABLED':
        return JQState.enabled;
      case 'DISABLED':
        return JQState.disabled;
    }
    throw Exception('$this is not known in enum JQState');
  }
}

enum JQStatus {
  creating,
  updating,
  deleting,
  deleted,
  valid,
  invalid,
}

extension JQStatusValueExtension on JQStatus {
  String toValue() {
    switch (this) {
      case JQStatus.creating:
        return 'CREATING';
      case JQStatus.updating:
        return 'UPDATING';
      case JQStatus.deleting:
        return 'DELETING';
      case JQStatus.deleted:
        return 'DELETED';
      case JQStatus.valid:
        return 'VALID';
      case JQStatus.invalid:
        return 'INVALID';
    }
  }
}

extension JQStatusFromString on String {
  JQStatus toJQStatus() {
    switch (this) {
      case 'CREATING':
        return JQStatus.creating;
      case 'UPDATING':
        return JQStatus.updating;
      case 'DELETING':
        return JQStatus.deleting;
      case 'DELETED':
        return JQStatus.deleted;
      case 'VALID':
        return JQStatus.valid;
      case 'INVALID':
        return JQStatus.invalid;
    }
    throw Exception('$this is not known in enum JQStatus');
  }
}

/// An object that represents an Batch job definition.
class JobDefinition {
  /// The Amazon Resource Name (ARN) for the job definition.
  final String jobDefinitionArn;

  /// The name of the job definition.
  final String jobDefinitionName;

  /// The revision of the job definition.
  final int revision;

  /// The type of job definition. It's either <code>container</code> or
  /// <code>multinode</code>. If the job is run on Fargate resources, then
  /// <code>multinode</code> isn't supported. For more information about
  /// multi-node parallel jobs, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/multi-node-job-def.html">Creating
  /// a multi-node parallel job definition</a> in the <i>Batch User Guide</i>.
  final String type;

  /// The orchestration type of the compute environment. The valid values are
  /// <code>ECS</code> (default) or <code>EKS</code>.
  final OrchestrationType? containerOrchestrationType;

  /// An object with properties specific to Amazon ECS-based jobs. When
  /// <code>containerProperties</code> is used in the job definition, it can't be
  /// used in addition to <code>eksProperties</code>, <code>ecsProperties</code>,
  /// or <code>nodeProperties</code>.
  final ContainerProperties? containerProperties;

  /// An object that contains the properties for the Amazon ECS resources of a
  /// job.When <code>ecsProperties</code> is used in the job definition, it can't
  /// be used in addition to <code>containerProperties</code>,
  /// <code>eksProperties</code>, or <code>nodeProperties</code>.
  final EcsProperties? ecsProperties;

  /// An object with properties that are specific to Amazon EKS-based jobs. When
  /// <code>eksProperties</code> is used in the job definition, it can't be used
  /// in addition to <code>containerProperties</code>, <code>ecsProperties</code>,
  /// or <code>nodeProperties</code>.
  final EksProperties? eksProperties;

  /// An object with properties that are specific to multi-node parallel jobs.
  /// When <code>nodeProperties</code> is used in the job definition, it can't be
  /// used in addition to <code>containerProperties</code>,
  /// <code>ecsProperties</code>, or <code>eksProperties</code>.
  /// <note>
  /// If the job runs on Fargate resources, don't specify
  /// <code>nodeProperties</code>. Use <code>containerProperties</code> instead.
  /// </note>
  final NodeProperties? nodeProperties;

  /// Default parameters or parameter substitution placeholders that are set in
  /// the job definition. Parameters are specified as a key-value pair mapping.
  /// Parameters in a <code>SubmitJob</code> request override any corresponding
  /// parameter defaults from the job definition. For more information about
  /// specifying parameters, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/job_definition_parameters.html">Job
  /// definition parameters</a> in the <i>Batch User Guide</i>.
  final Map<String, String>? parameters;

  /// The platform capabilities required by the job definition. If no value is
  /// specified, it defaults to <code>EC2</code>. Jobs run on Fargate resources
  /// specify <code>FARGATE</code>.
  final List<PlatformCapability>? platformCapabilities;

  /// Specifies whether to propagate the tags from the job or job definition to
  /// the corresponding Amazon ECS task. If no value is specified, the tags aren't
  /// propagated. Tags can only be propagated to the tasks when the tasks are
  /// created. For tags with the same name, job tags are given priority over job
  /// definitions tags. If the total number of combined tags from the job and job
  /// definition is over 50, the job is moved to the <code>FAILED</code> state.
  final bool? propagateTags;

  /// The retry strategy to use for failed jobs that are submitted with this job
  /// definition.
  final RetryStrategy? retryStrategy;

  /// The scheduling priority of the job definition. This only affects jobs in job
  /// queues with a fair share policy. Jobs with a higher scheduling priority are
  /// scheduled before jobs with a lower scheduling priority.
  final int? schedulingPriority;

  /// The status of the job definition.
  final String? status;

  /// The tags that are applied to the job definition.
  final Map<String, String>? tags;

  /// The timeout time for jobs that are submitted with this job definition. After
  /// the amount of time you specify passes, Batch terminates your jobs if they
  /// aren't finished.
  final JobTimeout? timeout;

  JobDefinition({
    required this.jobDefinitionArn,
    required this.jobDefinitionName,
    required this.revision,
    required this.type,
    this.containerOrchestrationType,
    this.containerProperties,
    this.ecsProperties,
    this.eksProperties,
    this.nodeProperties,
    this.parameters,
    this.platformCapabilities,
    this.propagateTags,
    this.retryStrategy,
    this.schedulingPriority,
    this.status,
    this.tags,
    this.timeout,
  });

  factory JobDefinition.fromJson(Map<String, dynamic> json) {
    return JobDefinition(
      jobDefinitionArn: json['jobDefinitionArn'] as String,
      jobDefinitionName: json['jobDefinitionName'] as String,
      revision: json['revision'] as int,
      type: json['type'] as String,
      containerOrchestrationType:
          (json['containerOrchestrationType'] as String?)
              ?.toOrchestrationType(),
      containerProperties: json['containerProperties'] != null
          ? ContainerProperties.fromJson(
              json['containerProperties'] as Map<String, dynamic>)
          : null,
      ecsProperties: json['ecsProperties'] != null
          ? EcsProperties.fromJson(
              json['ecsProperties'] as Map<String, dynamic>)
          : null,
      eksProperties: json['eksProperties'] != null
          ? EksProperties.fromJson(
              json['eksProperties'] as Map<String, dynamic>)
          : null,
      nodeProperties: json['nodeProperties'] != null
          ? NodeProperties.fromJson(
              json['nodeProperties'] as Map<String, dynamic>)
          : null,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      platformCapabilities: (json['platformCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPlatformCapability())
          .toList(),
      propagateTags: json['propagateTags'] as bool?,
      retryStrategy: json['retryStrategy'] != null
          ? RetryStrategy.fromJson(
              json['retryStrategy'] as Map<String, dynamic>)
          : null,
      schedulingPriority: json['schedulingPriority'] as int?,
      status: json['status'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeout: json['timeout'] != null
          ? JobTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinitionArn = this.jobDefinitionArn;
    final jobDefinitionName = this.jobDefinitionName;
    final revision = this.revision;
    final type = this.type;
    final containerOrchestrationType = this.containerOrchestrationType;
    final containerProperties = this.containerProperties;
    final ecsProperties = this.ecsProperties;
    final eksProperties = this.eksProperties;
    final nodeProperties = this.nodeProperties;
    final parameters = this.parameters;
    final platformCapabilities = this.platformCapabilities;
    final propagateTags = this.propagateTags;
    final retryStrategy = this.retryStrategy;
    final schedulingPriority = this.schedulingPriority;
    final status = this.status;
    final tags = this.tags;
    final timeout = this.timeout;
    return {
      'jobDefinitionArn': jobDefinitionArn,
      'jobDefinitionName': jobDefinitionName,
      'revision': revision,
      'type': type,
      if (containerOrchestrationType != null)
        'containerOrchestrationType': containerOrchestrationType.toValue(),
      if (containerProperties != null)
        'containerProperties': containerProperties,
      if (ecsProperties != null) 'ecsProperties': ecsProperties,
      if (eksProperties != null) 'eksProperties': eksProperties,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (parameters != null) 'parameters': parameters,
      if (platformCapabilities != null)
        'platformCapabilities':
            platformCapabilities.map((e) => e.toValue()).toList(),
      if (propagateTags != null) 'propagateTags': propagateTags,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (schedulingPriority != null) 'schedulingPriority': schedulingPriority,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

enum JobDefinitionType {
  container,
  multinode,
}

extension JobDefinitionTypeValueExtension on JobDefinitionType {
  String toValue() {
    switch (this) {
      case JobDefinitionType.container:
        return 'container';
      case JobDefinitionType.multinode:
        return 'multinode';
    }
  }
}

extension JobDefinitionTypeFromString on String {
  JobDefinitionType toJobDefinitionType() {
    switch (this) {
      case 'container':
        return JobDefinitionType.container;
      case 'multinode':
        return JobDefinitionType.multinode;
    }
    throw Exception('$this is not known in enum JobDefinitionType');
  }
}

/// An object that represents an Batch job dependency.
class JobDependency {
  /// The job ID of the Batch job that's associated with this dependency.
  final String? jobId;

  /// The type of the job dependency.
  final ArrayJobDependency? type;

  JobDependency({
    this.jobId,
    this.type,
  });

  factory JobDependency.fromJson(Map<String, dynamic> json) {
    return JobDependency(
      jobId: json['jobId'] as String?,
      type: (json['type'] as String?)?.toArrayJobDependency(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final type = this.type;
    return {
      if (jobId != null) 'jobId': jobId,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// An object that represents an Batch job.
class JobDetail {
  /// The Amazon Resource Name (ARN) of the job definition that this job uses.
  final String jobDefinition;

  /// The job ID.
  final String jobId;

  /// The job name.
  final String jobName;

  /// The Amazon Resource Name (ARN) of the job queue that the job is associated
  /// with.
  final String jobQueue;

  /// The Unix timestamp (in milliseconds) for when the job was started. More
  /// specifically, it's when the job transitioned from the <code>STARTING</code>
  /// state to the <code>RUNNING</code> state.
  final int startedAt;

  /// The current status for the job.
  /// <note>
  /// If your jobs don't progress to <code>STARTING</code>, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#job_stuck_in_runnable">Jobs
  /// stuck in RUNNABLE status</a> in the troubleshooting section of the <i>Batch
  /// User Guide</i>.
  /// </note>
  final JobStatus status;

  /// The array properties of the job, if it's an array job.
  final ArrayPropertiesDetail? arrayProperties;

  /// A list of job attempts that are associated with this job.
  final List<AttemptDetail>? attempts;

  /// An object that represents the details for the container that's associated
  /// with the job. If the details are for a multiple-container job, this object
  /// will be empty.
  final ContainerDetail? container;

  /// The Unix timestamp (in milliseconds) for when the job was created. For
  /// non-array jobs and parent array jobs, this is when the job entered the
  /// <code>SUBMITTED</code> state. This is specifically at the time <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_SubmitJob.html">SubmitJob</a>
  /// was called. For array child jobs, this is when the child job was spawned by
  /// its parent and entered the <code>PENDING</code> state.
  final int? createdAt;

  /// A list of job IDs that this job depends on.
  final List<JobDependency>? dependsOn;

  /// An object with properties that are specific to Amazon ECS-based jobs.
  final EcsPropertiesDetail? ecsProperties;

  /// A list of job attempts that are associated with this job.
  final List<EksAttemptDetail>? eksAttempts;

  /// An object with various properties that are specific to Amazon EKS based
  /// jobs.
  final EksPropertiesDetail? eksProperties;

  /// Indicates whether the job is canceled.
  final bool? isCancelled;

  /// Indicates whether the job is terminated.
  final bool? isTerminated;

  /// The Amazon Resource Name (ARN) of the job.
  final String? jobArn;

  /// An object that represents the details of a node that's associated with a
  /// multi-node parallel job.
  final NodeDetails? nodeDetails;

  /// An object that represents the node properties of a multi-node parallel job.
  /// <note>
  /// This isn't applicable to jobs that are running on Fargate resources.
  /// </note>
  final NodeProperties? nodeProperties;

  /// Additional parameters that are passed to the job that replace parameter
  /// substitution placeholders or override any corresponding parameter defaults
  /// from the job definition.
  final Map<String, String>? parameters;

  /// The platform capabilities required by the job definition. If no value is
  /// specified, it defaults to <code>EC2</code>. Jobs run on Fargate resources
  /// specify <code>FARGATE</code>.
  final List<PlatformCapability>? platformCapabilities;

  /// Specifies whether to propagate the tags from the job or job definition to
  /// the corresponding Amazon ECS task. If no value is specified, the tags aren't
  /// propagated. Tags can only be propagated to the tasks when the tasks are
  /// created. For tags with the same name, job tags are given priority over job
  /// definitions tags. If the total number of combined tags from the job and job
  /// definition is over 50, the job is moved to the <code>FAILED</code> state.
  final bool? propagateTags;

  /// The retry strategy to use for this job if an attempt fails.
  final RetryStrategy? retryStrategy;

  /// The scheduling policy of the job definition. This only affects jobs in job
  /// queues with a fair share policy. Jobs with a higher scheduling priority are
  /// scheduled before jobs with a lower scheduling priority.
  final int? schedulingPriority;

  /// The share identifier for the job.
  final String? shareIdentifier;

  /// A short, human-readable string to provide more details for the current
  /// status of the job.
  ///
  /// <ul>
  /// <li>
  /// <code>CAPACITY:INSUFFICIENT_INSTANCE_CAPACITY</code> - All compute
  /// environments have insufficient capacity to service the job.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURATION:COMPUTE_ENVIRONMENT_MAX_RESOURCE</code> - All compute
  /// environments have a <code>maxVcpu</code> setting that is smaller than the
  /// job requirements.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURATION:JOB_RESOURCE_REQUIREMENT</code> - All compute
  /// environments have no connected instances that meet the job requirements.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURATION:SERVICE_ROLE_PERMISSIONS</code> - All compute
  /// environments have problems with the service role permissions.
  /// </li>
  /// </ul>
  final String? statusReason;

  /// The Unix timestamp (in milliseconds) for when the job was stopped. More
  /// specifically, it's when the job transitioned from the <code>RUNNING</code>
  /// state to a terminal state, such as <code>SUCCEEDED</code> or
  /// <code>FAILED</code>.
  final int? stoppedAt;

  /// The tags that are applied to the job.
  final Map<String, String>? tags;

  /// The timeout configuration for the job.
  final JobTimeout? timeout;

  JobDetail({
    required this.jobDefinition,
    required this.jobId,
    required this.jobName,
    required this.jobQueue,
    required this.startedAt,
    required this.status,
    this.arrayProperties,
    this.attempts,
    this.container,
    this.createdAt,
    this.dependsOn,
    this.ecsProperties,
    this.eksAttempts,
    this.eksProperties,
    this.isCancelled,
    this.isTerminated,
    this.jobArn,
    this.nodeDetails,
    this.nodeProperties,
    this.parameters,
    this.platformCapabilities,
    this.propagateTags,
    this.retryStrategy,
    this.schedulingPriority,
    this.shareIdentifier,
    this.statusReason,
    this.stoppedAt,
    this.tags,
    this.timeout,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return JobDetail(
      jobDefinition: json['jobDefinition'] as String,
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      jobQueue: json['jobQueue'] as String,
      startedAt: json['startedAt'] as int,
      status: (json['status'] as String).toJobStatus(),
      arrayProperties: json['arrayProperties'] != null
          ? ArrayPropertiesDetail.fromJson(
              json['arrayProperties'] as Map<String, dynamic>)
          : null,
      attempts: (json['attempts'] as List?)
          ?.whereNotNull()
          .map((e) => AttemptDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      container: json['container'] != null
          ? ContainerDetail.fromJson(json['container'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as int?,
      dependsOn: (json['dependsOn'] as List?)
          ?.whereNotNull()
          .map((e) => JobDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecsProperties: json['ecsProperties'] != null
          ? EcsPropertiesDetail.fromJson(
              json['ecsProperties'] as Map<String, dynamic>)
          : null,
      eksAttempts: (json['eksAttempts'] as List?)
          ?.whereNotNull()
          .map((e) => EksAttemptDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      eksProperties: json['eksProperties'] != null
          ? EksPropertiesDetail.fromJson(
              json['eksProperties'] as Map<String, dynamic>)
          : null,
      isCancelled: json['isCancelled'] as bool?,
      isTerminated: json['isTerminated'] as bool?,
      jobArn: json['jobArn'] as String?,
      nodeDetails: json['nodeDetails'] != null
          ? NodeDetails.fromJson(json['nodeDetails'] as Map<String, dynamic>)
          : null,
      nodeProperties: json['nodeProperties'] != null
          ? NodeProperties.fromJson(
              json['nodeProperties'] as Map<String, dynamic>)
          : null,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      platformCapabilities: (json['platformCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPlatformCapability())
          .toList(),
      propagateTags: json['propagateTags'] as bool?,
      retryStrategy: json['retryStrategy'] != null
          ? RetryStrategy.fromJson(
              json['retryStrategy'] as Map<String, dynamic>)
          : null,
      schedulingPriority: json['schedulingPriority'] as int?,
      shareIdentifier: json['shareIdentifier'] as String?,
      statusReason: json['statusReason'] as String?,
      stoppedAt: json['stoppedAt'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeout: json['timeout'] != null
          ? JobTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinition = this.jobDefinition;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobQueue = this.jobQueue;
    final startedAt = this.startedAt;
    final status = this.status;
    final arrayProperties = this.arrayProperties;
    final attempts = this.attempts;
    final container = this.container;
    final createdAt = this.createdAt;
    final dependsOn = this.dependsOn;
    final ecsProperties = this.ecsProperties;
    final eksAttempts = this.eksAttempts;
    final eksProperties = this.eksProperties;
    final isCancelled = this.isCancelled;
    final isTerminated = this.isTerminated;
    final jobArn = this.jobArn;
    final nodeDetails = this.nodeDetails;
    final nodeProperties = this.nodeProperties;
    final parameters = this.parameters;
    final platformCapabilities = this.platformCapabilities;
    final propagateTags = this.propagateTags;
    final retryStrategy = this.retryStrategy;
    final schedulingPriority = this.schedulingPriority;
    final shareIdentifier = this.shareIdentifier;
    final statusReason = this.statusReason;
    final stoppedAt = this.stoppedAt;
    final tags = this.tags;
    final timeout = this.timeout;
    return {
      'jobDefinition': jobDefinition,
      'jobId': jobId,
      'jobName': jobName,
      'jobQueue': jobQueue,
      'startedAt': startedAt,
      'status': status.toValue(),
      if (arrayProperties != null) 'arrayProperties': arrayProperties,
      if (attempts != null) 'attempts': attempts,
      if (container != null) 'container': container,
      if (createdAt != null) 'createdAt': createdAt,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (ecsProperties != null) 'ecsProperties': ecsProperties,
      if (eksAttempts != null) 'eksAttempts': eksAttempts,
      if (eksProperties != null) 'eksProperties': eksProperties,
      if (isCancelled != null) 'isCancelled': isCancelled,
      if (isTerminated != null) 'isTerminated': isTerminated,
      if (jobArn != null) 'jobArn': jobArn,
      if (nodeDetails != null) 'nodeDetails': nodeDetails,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (parameters != null) 'parameters': parameters,
      if (platformCapabilities != null)
        'platformCapabilities':
            platformCapabilities.map((e) => e.toValue()).toList(),
      if (propagateTags != null) 'propagateTags': propagateTags,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (schedulingPriority != null) 'schedulingPriority': schedulingPriority,
      if (shareIdentifier != null) 'shareIdentifier': shareIdentifier,
      if (statusReason != null) 'statusReason': statusReason,
      if (stoppedAt != null) 'stoppedAt': stoppedAt,
      if (tags != null) 'tags': tags,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

/// An object that represents the details for an Batch job queue.
class JobQueueDetail {
  /// The compute environments that are attached to the job queue and the order
  /// that job placement is preferred. Compute environments are selected for job
  /// placement in ascending order.
  final List<ComputeEnvironmentOrder> computeEnvironmentOrder;

  /// The Amazon Resource Name (ARN) of the job queue.
  final String jobQueueArn;

  /// The job queue name.
  final String jobQueueName;

  /// The priority of the job queue. Job queues with a higher priority (or a
  /// higher integer value for the <code>priority</code> parameter) are evaluated
  /// first when associated with the same compute environment. Priority is
  /// determined in descending order. For example, a job queue with a priority
  /// value of <code>10</code> is given scheduling preference over a job queue
  /// with a priority value of <code>1</code>. All of the compute environments
  /// must be either Amazon EC2 (<code>EC2</code> or <code>SPOT</code>) or Fargate
  /// (<code>FARGATE</code> or <code>FARGATE_SPOT</code>). Amazon EC2 and Fargate
  /// compute environments can't be mixed.
  final int priority;

  /// Describes the ability of the queue to accept new jobs. If the job queue
  /// state is <code>ENABLED</code>, it can accept jobs. If the job queue state is
  /// <code>DISABLED</code>, new jobs can't be added to the queue, but jobs
  /// already in the queue can finish.
  final JQState state;

  /// The set of actions that Batch perform on jobs that remain at the head of the
  /// job queue in the specified state longer than specified times. Batch will
  /// perform each action after <code>maxTimeSeconds</code> has passed.
  final List<JobStateTimeLimitAction>? jobStateTimeLimitActions;

  /// The Amazon Resource Name (ARN) of the scheduling policy. The format is
  /// <code>aws:<i>Partition</i>:batch:<i>Region</i>:<i>Account</i>:scheduling-policy/<i>Name</i>
  /// </code>. For example,
  /// <code>aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy</code>.
  final String? schedulingPolicyArn;

  /// The status of the job queue (for example, <code>CREATING</code> or
  /// <code>VALID</code>).
  final JQStatus? status;

  /// A short, human-readable string to provide additional details for the current
  /// status of the job queue.
  final String? statusReason;

  /// The tags that are applied to the job queue. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/using-tags.html">Tagging
  /// your Batch resources</a> in <i>Batch User Guide</i>.
  final Map<String, String>? tags;

  JobQueueDetail({
    required this.computeEnvironmentOrder,
    required this.jobQueueArn,
    required this.jobQueueName,
    required this.priority,
    required this.state,
    this.jobStateTimeLimitActions,
    this.schedulingPolicyArn,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory JobQueueDetail.fromJson(Map<String, dynamic> json) {
    return JobQueueDetail(
      computeEnvironmentOrder: (json['computeEnvironmentOrder'] as List)
          .whereNotNull()
          .map((e) =>
              ComputeEnvironmentOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobQueueArn: json['jobQueueArn'] as String,
      jobQueueName: json['jobQueueName'] as String,
      priority: json['priority'] as int,
      state: (json['state'] as String).toJQState(),
      jobStateTimeLimitActions: (json['jobStateTimeLimitActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              JobStateTimeLimitAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedulingPolicyArn: json['schedulingPolicyArn'] as String?,
      status: (json['status'] as String?)?.toJQStatus(),
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironmentOrder = this.computeEnvironmentOrder;
    final jobQueueArn = this.jobQueueArn;
    final jobQueueName = this.jobQueueName;
    final priority = this.priority;
    final state = this.state;
    final jobStateTimeLimitActions = this.jobStateTimeLimitActions;
    final schedulingPolicyArn = this.schedulingPolicyArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'computeEnvironmentOrder': computeEnvironmentOrder,
      'jobQueueArn': jobQueueArn,
      'jobQueueName': jobQueueName,
      'priority': priority,
      'state': state.toValue(),
      if (jobStateTimeLimitActions != null)
        'jobStateTimeLimitActions': jobStateTimeLimitActions,
      if (schedulingPolicyArn != null)
        'schedulingPolicyArn': schedulingPolicyArn,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies an action that Batch will take after the job has remained at the
/// head of the queue in the specified state for longer than the specified time.
class JobStateTimeLimitAction {
  /// The action to take when a job is at the head of the job queue in the
  /// specified state for the specified period of time. The only supported value
  /// is <code>CANCEL</code>, which will cancel the job.
  final JobStateTimeLimitActionsAction action;

  /// The approximate amount of time, in seconds, that must pass with the job in
  /// the specified state before the action is taken. The minimum value is 600 (10
  /// minutes) and the maximum value is 86,400 (24 hours).
  final int maxTimeSeconds;

  /// The reason to log for the action being taken.
  final String reason;

  /// The state of the job needed to trigger the action. The only supported value
  /// is <code>RUNNABLE</code>.
  final JobStateTimeLimitActionsState state;

  JobStateTimeLimitAction({
    required this.action,
    required this.maxTimeSeconds,
    required this.reason,
    required this.state,
  });

  factory JobStateTimeLimitAction.fromJson(Map<String, dynamic> json) {
    return JobStateTimeLimitAction(
      action: (json['action'] as String).toJobStateTimeLimitActionsAction(),
      maxTimeSeconds: json['maxTimeSeconds'] as int,
      reason: json['reason'] as String,
      state: (json['state'] as String).toJobStateTimeLimitActionsState(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final maxTimeSeconds = this.maxTimeSeconds;
    final reason = this.reason;
    final state = this.state;
    return {
      'action': action.toValue(),
      'maxTimeSeconds': maxTimeSeconds,
      'reason': reason,
      'state': state.toValue(),
    };
  }
}

enum JobStateTimeLimitActionsAction {
  cancel,
}

extension JobStateTimeLimitActionsActionValueExtension
    on JobStateTimeLimitActionsAction {
  String toValue() {
    switch (this) {
      case JobStateTimeLimitActionsAction.cancel:
        return 'CANCEL';
    }
  }
}

extension JobStateTimeLimitActionsActionFromString on String {
  JobStateTimeLimitActionsAction toJobStateTimeLimitActionsAction() {
    switch (this) {
      case 'CANCEL':
        return JobStateTimeLimitActionsAction.cancel;
    }
    throw Exception(
        '$this is not known in enum JobStateTimeLimitActionsAction');
  }
}

enum JobStateTimeLimitActionsState {
  runnable,
}

extension JobStateTimeLimitActionsStateValueExtension
    on JobStateTimeLimitActionsState {
  String toValue() {
    switch (this) {
      case JobStateTimeLimitActionsState.runnable:
        return 'RUNNABLE';
    }
  }
}

extension JobStateTimeLimitActionsStateFromString on String {
  JobStateTimeLimitActionsState toJobStateTimeLimitActionsState() {
    switch (this) {
      case 'RUNNABLE':
        return JobStateTimeLimitActionsState.runnable;
    }
    throw Exception('$this is not known in enum JobStateTimeLimitActionsState');
  }
}

enum JobStatus {
  submitted,
  pending,
  runnable,
  starting,
  running,
  succeeded,
  failed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.pending:
        return 'PENDING';
      case JobStatus.runnable:
        return 'RUNNABLE';
      case JobStatus.starting:
        return 'STARTING';
      case JobStatus.running:
        return 'RUNNING';
      case JobStatus.succeeded:
        return 'SUCCEEDED';
      case JobStatus.failed:
        return 'FAILED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'PENDING':
        return JobStatus.pending;
      case 'RUNNABLE':
        return JobStatus.runnable;
      case 'STARTING':
        return JobStatus.starting;
      case 'RUNNING':
        return JobStatus.running;
      case 'SUCCEEDED':
        return JobStatus.succeeded;
      case 'FAILED':
        return JobStatus.failed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// An object that represents summary details of a job.
class JobSummary {
  /// The job ID.
  final String jobId;

  /// The job name.
  final String jobName;

  /// The array properties of the job, if it's an array job.
  final ArrayPropertiesSummary? arrayProperties;

  /// An object that represents the details of the container that's associated
  /// with the job.
  final ContainerSummary? container;

  /// The Unix timestamp (in milliseconds) for when the job was created. For
  /// non-array jobs and parent array jobs, this is when the job entered the
  /// <code>SUBMITTED</code> state (at the time <a
  /// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_SubmitJob.html">SubmitJob</a>
  /// was called). For array child jobs, this is when the child job was spawned by
  /// its parent and entered the <code>PENDING</code> state.
  final int? createdAt;

  /// The Amazon Resource Name (ARN) of the job.
  final String? jobArn;

  /// The Amazon Resource Name (ARN) of the job definition.
  final String? jobDefinition;

  /// The node properties for a single node in a job summary list.
  /// <note>
  /// This isn't applicable to jobs that are running on Fargate resources.
  /// </note>
  final NodePropertiesSummary? nodeProperties;

  /// The Unix timestamp for when the job was started. More specifically, it's
  /// when the job transitioned from the <code>STARTING</code> state to the
  /// <code>RUNNING</code> state.
  final int? startedAt;

  /// The current status for the job.
  final JobStatus? status;

  /// A short, human-readable string to provide more details for the current
  /// status of the job.
  final String? statusReason;

  /// The Unix timestamp for when the job was stopped. More specifically, it's
  /// when the job transitioned from the <code>RUNNING</code> state to a terminal
  /// state, such as <code>SUCCEEDED</code> or <code>FAILED</code>.
  final int? stoppedAt;

  JobSummary({
    required this.jobId,
    required this.jobName,
    this.arrayProperties,
    this.container,
    this.createdAt,
    this.jobArn,
    this.jobDefinition,
    this.nodeProperties,
    this.startedAt,
    this.status,
    this.statusReason,
    this.stoppedAt,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      arrayProperties: json['arrayProperties'] != null
          ? ArrayPropertiesSummary.fromJson(
              json['arrayProperties'] as Map<String, dynamic>)
          : null,
      container: json['container'] != null
          ? ContainerSummary.fromJson(json['container'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as int?,
      jobArn: json['jobArn'] as String?,
      jobDefinition: json['jobDefinition'] as String?,
      nodeProperties: json['nodeProperties'] != null
          ? NodePropertiesSummary.fromJson(
              json['nodeProperties'] as Map<String, dynamic>)
          : null,
      startedAt: json['startedAt'] as int?,
      status: (json['status'] as String?)?.toJobStatus(),
      statusReason: json['statusReason'] as String?,
      stoppedAt: json['stoppedAt'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobName = this.jobName;
    final arrayProperties = this.arrayProperties;
    final container = this.container;
    final createdAt = this.createdAt;
    final jobArn = this.jobArn;
    final jobDefinition = this.jobDefinition;
    final nodeProperties = this.nodeProperties;
    final startedAt = this.startedAt;
    final status = this.status;
    final statusReason = this.statusReason;
    final stoppedAt = this.stoppedAt;
    return {
      'jobId': jobId,
      'jobName': jobName,
      if (arrayProperties != null) 'arrayProperties': arrayProperties,
      if (container != null) 'container': container,
      if (createdAt != null) 'createdAt': createdAt,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobDefinition != null) 'jobDefinition': jobDefinition,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (startedAt != null) 'startedAt': startedAt,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (stoppedAt != null) 'stoppedAt': stoppedAt,
    };
  }
}

/// An object that represents a job timeout configuration.
class JobTimeout {
  /// The job timeout time (in seconds) that's measured from the job attempt's
  /// <code>startedAt</code> timestamp. After this time passes, Batch terminates
  /// your jobs if they aren't finished. The minimum value for the timeout is 60
  /// seconds.
  ///
  /// For array jobs, the timeout applies to the child jobs, not to the parent
  /// array job.
  ///
  /// For multi-node parallel (MNP) jobs, the timeout applies to the whole job,
  /// not to the individual nodes.
  final int? attemptDurationSeconds;

  JobTimeout({
    this.attemptDurationSeconds,
  });

  factory JobTimeout.fromJson(Map<String, dynamic> json) {
    return JobTimeout(
      attemptDurationSeconds: json['attemptDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attemptDurationSeconds = this.attemptDurationSeconds;
    return {
      if (attemptDurationSeconds != null)
        'attemptDurationSeconds': attemptDurationSeconds,
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

/// A filter name and value pair that's used to return a more specific list of
/// results from a <code>ListJobs</code> API operation.
class KeyValuesPair {
  /// The name of the filter. Filter names are case sensitive.
  final String? name;

  /// The filter values.
  final List<String>? values;

  KeyValuesPair({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// An object that represents a launch template that's associated with a compute
/// resource. You must specify either the launch template ID or launch template
/// name in the request, but not both.
///
/// If security groups are specified using both the
/// <code>securityGroupIds</code> parameter of
/// <code>CreateComputeEnvironment</code> and the launch template, the values in
/// the <code>securityGroupIds</code> parameter of
/// <code>CreateComputeEnvironment</code> will be used.
/// <note>
/// This object isn't applicable to jobs that are running on Fargate resources.
/// </note>
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  final String? launchTemplateId;

  /// The name of the launch template.
  final String? launchTemplateName;

  /// The version number of the launch template, <code>$Latest</code>, or
  /// <code>$Default</code>.
  ///
  /// If the value is <code>$Latest</code>, the latest version of the launch
  /// template is used. If the value is <code>$Default</code>, the default version
  /// of the launch template is used.
  /// <important>
  /// If the AMI ID that's used in a compute environment is from the launch
  /// template, the AMI isn't changed when the compute environment is updated.
  /// It's only changed if the <code>updateToLatestImageVersion</code> parameter
  /// for the compute environment is set to <code>true</code>. During an
  /// infrastructure update, if either <code>$Latest</code> or
  /// <code>$Default</code> is specified, Batch re-evaluates the launch template
  /// version, and it might use a different version of the launch template. This
  /// is the case even if the launch template isn't specified in the update. When
  /// updating a compute environment, changing the launch template requires an
  /// infrastructure update of the compute environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
  /// compute environments</a> in the <i>Batch User Guide</i>.
  /// </important>
  /// Default: <code>$Default</code>.
  final String? version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });

  factory LaunchTemplateSpecification.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateSpecification(
      launchTemplateId: json['launchTemplateId'] as String?,
      launchTemplateName: json['launchTemplateName'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchTemplateId = this.launchTemplateId;
    final launchTemplateName = this.launchTemplateName;
    final version = this.version;
    return {
      if (launchTemplateId != null) 'launchTemplateId': launchTemplateId,
      if (launchTemplateName != null) 'launchTemplateName': launchTemplateName,
      if (version != null) 'version': version,
    };
  }
}

/// Linux-specific modifications that are applied to the container, such as
/// details for device mappings.
class LinuxParameters {
  /// Any of the host devices to expose to the container. This parameter maps to
  /// <code>Devices</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--device</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't provide it for these jobs.
  /// </note>
  final List<Device>? devices;

  /// If true, run an <code>init</code> process inside the container that forwards
  /// signals and reaps processes. This parameter maps to the <code>--init</code>
  /// option to <a href="https://docs.docker.com/engine/reference/run/">docker
  /// run</a>. This parameter requires version 1.25 of the Docker Remote API or
  /// greater on your container instance. To check the Docker Remote API version
  /// on your container instance, log in to your container instance and run the
  /// following command: <code>sudo docker version | grep "Server API
  /// version"</code>
  final bool? initProcessEnabled;

  /// The total amount of swap memory (in MiB) a container can use. This parameter
  /// is translated to the <code>--memory-swap</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a> where
  /// the value is the sum of the container memory plus the <code>maxSwap</code>
  /// value. For more information, see <a
  /// href="https://docs.docker.com/config/containers/resource_constraints/#--memory-swap-details">
  /// <code>--memory-swap</code> details</a> in the Docker documentation.
  ///
  /// If a <code>maxSwap</code> value of <code>0</code> is specified, the
  /// container doesn't use swap. Accepted values are <code>0</code> or any
  /// positive integer. If the <code>maxSwap</code> parameter is omitted, the
  /// container doesn't use the swap configuration for the container instance that
  /// it's running on. A <code>maxSwap</code> value must be set for the
  /// <code>swappiness</code> parameter to be used.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't provide it for these jobs.
  /// </note>
  final int? maxSwap;

  /// The value for the size (in MiB) of the <code>/dev/shm</code> volume. This
  /// parameter maps to the <code>--shm-size</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't provide it for these jobs.
  /// </note>
  final int? sharedMemorySize;

  /// You can use this parameter to tune a container's memory swappiness behavior.
  /// A <code>swappiness</code> value of <code>0</code> causes swapping to not
  /// occur unless absolutely necessary. A <code>swappiness</code> value of
  /// <code>100</code> causes pages to be swapped aggressively. Valid values are
  /// whole numbers between <code>0</code> and <code>100</code>. If the
  /// <code>swappiness</code> parameter isn't specified, a default value of
  /// <code>60</code> is used. If a value isn't specified for
  /// <code>maxSwap</code>, then this parameter is ignored. If
  /// <code>maxSwap</code> is set to 0, the container doesn't use swap. This
  /// parameter maps to the <code>--memory-swappiness</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  ///
  /// Consider the following when you use a per-container swap configuration.
  ///
  /// <ul>
  /// <li>
  /// Swap space must be enabled and allocated on the container instance for the
  /// containers to use.
  /// <note>
  /// By default, the Amazon ECS optimized AMIs don't have swap enabled. You must
  /// enable swap on the instance to use this feature. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-store-swap-volumes.html">Instance
  /// store swap volumes</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i> or <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/">How
  /// do I allocate memory to work as swap space in an Amazon EC2 instance by
  /// using a swap file?</a>
  /// </note> </li>
  /// <li>
  /// The swap space parameters are only supported for job definitions using EC2
  /// resources.
  /// </li>
  /// <li>
  /// If the <code>maxSwap</code> and <code>swappiness</code> parameters are
  /// omitted from a job definition, each container has a default
  /// <code>swappiness</code> value of 60. Moreover, the total swap usage is
  /// limited to two times the memory reservation of the container.
  /// </li>
  /// </ul> <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't provide it for these jobs.
  /// </note>
  final int? swappiness;

  /// The container path, mount options, and size (in MiB) of the
  /// <code>tmpfs</code> mount. This parameter maps to the <code>--tmpfs</code>
  /// option to <a href="https://docs.docker.com/engine/reference/run/">docker
  /// run</a>.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources. Don't provide this parameter for this resource type.
  /// </note>
  final List<Tmpfs>? tmpfs;

  LinuxParameters({
    this.devices,
    this.initProcessEnabled,
    this.maxSwap,
    this.sharedMemorySize,
    this.swappiness,
    this.tmpfs,
  });

  factory LinuxParameters.fromJson(Map<String, dynamic> json) {
    return LinuxParameters(
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
    final devices = this.devices;
    final initProcessEnabled = this.initProcessEnabled;
    final maxSwap = this.maxSwap;
    final sharedMemorySize = this.sharedMemorySize;
    final swappiness = this.swappiness;
    final tmpfs = this.tmpfs;
    return {
      if (devices != null) 'devices': devices,
      if (initProcessEnabled != null) 'initProcessEnabled': initProcessEnabled,
      if (maxSwap != null) 'maxSwap': maxSwap,
      if (sharedMemorySize != null) 'sharedMemorySize': sharedMemorySize,
      if (swappiness != null) 'swappiness': swappiness,
      if (tmpfs != null) 'tmpfs': tmpfs,
    };
  }
}

class ListJobsResponse {
  /// A list of job summaries that match the request.
  final List<JobSummary> jobSummaryList;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListJobs</code> request. When the results of a <code>ListJobs</code>
  /// request exceed <code>maxResults</code>, this value can be used to retrieve
  /// the next page of results. This value is <code>null</code> when there are no
  /// more results to return.
  final String? nextToken;

  ListJobsResponse({
    required this.jobSummaryList,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobSummaryList: (json['jobSummaryList'] as List)
          .whereNotNull()
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaryList = this.jobSummaryList;
    final nextToken = this.nextToken;
    return {
      'jobSummaryList': jobSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSchedulingPoliciesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListSchedulingPolicies</code> request. When the results of a
  /// <code>ListSchedulingPolicies</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A list of scheduling policies that match the request.
  final List<SchedulingPolicyListingDetail>? schedulingPolicies;

  ListSchedulingPoliciesResponse({
    this.nextToken,
    this.schedulingPolicies,
  });

  factory ListSchedulingPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListSchedulingPoliciesResponse(
      nextToken: json['nextToken'] as String?,
      schedulingPolicies: (json['schedulingPolicies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SchedulingPolicyListingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schedulingPolicies = this.schedulingPolicies;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (schedulingPolicies != null) 'schedulingPolicies': schedulingPolicies,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Log configuration options to send to a custom log driver for the container.
class LogConfiguration {
  /// The log driver to use for the container. The valid values that are listed
  /// for this parameter are log drivers that the Amazon ECS container agent can
  /// communicate with by default.
  ///
  /// The supported log drivers are <code>awslogs</code>, <code>fluentd</code>,
  /// <code>gelf</code>, <code>json-file</code>, <code>journald</code>,
  /// <code>logentries</code>, <code>syslog</code>, and <code>splunk</code>.
  /// <note>
  /// Jobs that are running on Fargate resources are restricted to the
  /// <code>awslogs</code> and <code>splunk</code> log drivers.
  /// </note> <dl> <dt>awslogs</dt> <dd>
  /// Specifies the Amazon CloudWatch Logs logging driver. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/using_awslogs.html">Using
  /// the awslogs log driver</a> in the <i>Batch User Guide</i> and <a
  /// href="https://docs.docker.com/config/containers/logging/awslogs/">Amazon
  /// CloudWatch Logs logging driver</a> in the Docker documentation.
  /// </dd> <dt>fluentd</dt> <dd>
  /// Specifies the Fluentd logging driver. For more information including usage
  /// and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/fluentd/">Fluentd
  /// logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> <dt>gelf</dt> <dd>
  /// Specifies the Graylog Extended Format (GELF) logging driver. For more
  /// information including usage and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/gelf/">Graylog
  /// Extended Format logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> <dt>journald</dt> <dd>
  /// Specifies the journald logging driver. For more information including usage
  /// and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/journald/">Journald
  /// logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> <dt>json-file</dt> <dd>
  /// Specifies the JSON file logging driver. For more information including usage
  /// and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/json-file/">JSON
  /// File logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> <dt>splunk</dt> <dd>
  /// Specifies the Splunk logging driver. For more information including usage
  /// and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/splunk/">Splunk
  /// logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> <dt>syslog</dt> <dd>
  /// Specifies the syslog logging driver. For more information including usage
  /// and options, see <a
  /// href="https://docs.docker.com/config/containers/logging/syslog/">Syslog
  /// logging driver</a> in the <i>Docker documentation</i>.
  /// </dd> </dl> <note>
  /// If you have a custom driver that's not listed earlier that you want to work
  /// with the Amazon ECS container agent, you can fork the Amazon ECS container
  /// agent project that's <a
  /// href="https://github.com/aws/amazon-ecs-agent">available on GitHub</a> and
  /// customize it to work with that driver. We encourage you to submit pull
  /// requests for changes that you want to have included. However, Amazon Web
  /// Services doesn't currently support running modified copies of this software.
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: <code>sudo docker version | grep "Server API version"</code>
  final LogDriver logDriver;

  /// The configuration options to send to the log driver. This parameter requires
  /// version 1.19 of the Docker Remote API or greater on your container instance.
  /// To check the Docker Remote API version on your container instance, log in to
  /// your container instance and run the following command: <code>sudo docker
  /// version | grep "Server API version"</code>
  final Map<String, String>? options;

  /// The secrets to pass to the log configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html">Specifying
  /// sensitive data</a> in the <i>Batch User Guide</i>.
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
    }
    throw Exception('$this is not known in enum LogDriver');
  }
}

/// Details for a Docker volume mount point that's used in a job's container
/// properties. This parameter maps to <code>Volumes</code> in the <a
/// href="https://docs.docker.com/engine/api/v1.43/#tag/Container/operation/ContainerCreate">Create
/// a container</a> section of the <i>Docker Remote API</i> and the
/// <code>--volume</code> option to docker run.
class MountPoint {
  /// The path on the container where the host volume is mounted.
  final String? containerPath;

  /// If this value is <code>true</code>, the container has read-only access to
  /// the volume. Otherwise, the container can write to the volume. The default
  /// value is <code>false</code>.
  final bool? readOnly;

  /// The name of the volume to mount.
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

/// The network configuration for jobs that are running on Fargate resources.
/// Jobs that are running on Amazon EC2 resources must not specify this
/// parameter.
class NetworkConfiguration {
  /// Indicates whether the job has a public IP address. For a job that's running
  /// on Fargate resources in a private subnet to send outbound traffic to the
  /// internet (for example, to pull container images), the private subnet
  /// requires a NAT gateway be attached to route requests to the internet. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html">Amazon
  /// ECS task networking</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>. The default value is "<code>DISABLED</code>".
  final AssignPublicIp? assignPublicIp;

  NetworkConfiguration({
    this.assignPublicIp,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      assignPublicIp: (json['assignPublicIp'] as String?)?.toAssignPublicIp(),
    );
  }

  Map<String, dynamic> toJson() {
    final assignPublicIp = this.assignPublicIp;
    return {
      if (assignPublicIp != null) 'assignPublicIp': assignPublicIp.toValue(),
    };
  }
}

/// An object that represents the elastic network interface for a multi-node
/// parallel job node.
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

/// An object that represents the details of a multi-node parallel job node.
class NodeDetails {
  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  final bool? isMainNode;

  /// The node index for the node. Node index numbering starts at zero. This index
  /// is also available on the node with the <code>AWS_BATCH_JOB_NODE_INDEX</code>
  /// environment variable.
  final int? nodeIndex;

  NodeDetails({
    this.isMainNode,
    this.nodeIndex,
  });

  factory NodeDetails.fromJson(Map<String, dynamic> json) {
    return NodeDetails(
      isMainNode: json['isMainNode'] as bool?,
      nodeIndex: json['nodeIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final isMainNode = this.isMainNode;
    final nodeIndex = this.nodeIndex;
    return {
      if (isMainNode != null) 'isMainNode': isMainNode,
      if (nodeIndex != null) 'nodeIndex': nodeIndex,
    };
  }
}

/// An object that represents any node overrides to a job definition that's used
/// in a <a
/// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_SubmitJob.html">SubmitJob</a>
/// API operation.
/// <note>
/// This parameter isn't applicable to jobs that are running on Fargate
/// resources. Don't provide it for these jobs. Rather, use
/// <code>containerOverrides</code> instead.
/// </note>
class NodeOverrides {
  /// The node property overrides for the job.
  final List<NodePropertyOverride>? nodePropertyOverrides;

  /// The number of nodes to use with a multi-node parallel job. This value
  /// overrides the number of nodes that are specified in the job definition. To
  /// use this override, you must meet the following conditions:
  ///
  /// <ul>
  /// <li>
  /// There must be at least one node range in your job definition that has an
  /// open upper boundary, such as <code>:</code> or <code>n:</code>.
  /// </li>
  /// <li>
  /// The lower boundary of the node range that's specified in the job definition
  /// must be fewer than the number of nodes specified in the override.
  /// </li>
  /// <li>
  /// The main node index that's specified in the job definition must be fewer
  /// than the number of nodes specified in the override.
  /// </li>
  /// </ul>
  final int? numNodes;

  NodeOverrides({
    this.nodePropertyOverrides,
    this.numNodes,
  });

  Map<String, dynamic> toJson() {
    final nodePropertyOverrides = this.nodePropertyOverrides;
    final numNodes = this.numNodes;
    return {
      if (nodePropertyOverrides != null)
        'nodePropertyOverrides': nodePropertyOverrides,
      if (numNodes != null) 'numNodes': numNodes,
    };
  }
}

/// An object that represents the node properties of a multi-node parallel job.
/// <note>
/// Node properties can't be specified for Amazon EKS based job definitions.
/// </note>
class NodeProperties {
  /// Specifies the node index for the main node of a multi-node parallel job.
  /// This node index value must be fewer than the number of nodes.
  final int mainNode;

  /// A list of node ranges and their properties that are associated with a
  /// multi-node parallel job.
  final List<NodeRangeProperty> nodeRangeProperties;

  /// The number of nodes that are associated with a multi-node parallel job.
  final int numNodes;

  NodeProperties({
    required this.mainNode,
    required this.nodeRangeProperties,
    required this.numNodes,
  });

  factory NodeProperties.fromJson(Map<String, dynamic> json) {
    return NodeProperties(
      mainNode: json['mainNode'] as int,
      nodeRangeProperties: (json['nodeRangeProperties'] as List)
          .whereNotNull()
          .map((e) => NodeRangeProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      numNodes: json['numNodes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final mainNode = this.mainNode;
    final nodeRangeProperties = this.nodeRangeProperties;
    final numNodes = this.numNodes;
    return {
      'mainNode': mainNode,
      'nodeRangeProperties': nodeRangeProperties,
      'numNodes': numNodes,
    };
  }
}

/// An object that represents the properties of a node that's associated with a
/// multi-node parallel job.
class NodePropertiesSummary {
  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  final bool? isMainNode;

  /// The node index for the node. Node index numbering begins at zero. This index
  /// is also available on the node with the <code>AWS_BATCH_JOB_NODE_INDEX</code>
  /// environment variable.
  final int? nodeIndex;

  /// The number of nodes that are associated with a multi-node parallel job.
  final int? numNodes;

  NodePropertiesSummary({
    this.isMainNode,
    this.nodeIndex,
    this.numNodes,
  });

  factory NodePropertiesSummary.fromJson(Map<String, dynamic> json) {
    return NodePropertiesSummary(
      isMainNode: json['isMainNode'] as bool?,
      nodeIndex: json['nodeIndex'] as int?,
      numNodes: json['numNodes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final isMainNode = this.isMainNode;
    final nodeIndex = this.nodeIndex;
    final numNodes = this.numNodes;
    return {
      if (isMainNode != null) 'isMainNode': isMainNode,
      if (nodeIndex != null) 'nodeIndex': nodeIndex,
      if (numNodes != null) 'numNodes': numNodes,
    };
  }
}

/// The object that represents any node overrides to a job definition that's
/// used in a <a
/// href="https://docs.aws.amazon.com/batch/latest/APIReference/API_SubmitJob.html">SubmitJob</a>
/// API operation.
class NodePropertyOverride {
  /// The range of nodes, using node index values, that's used to override. A
  /// range of <code>0:3</code> indicates nodes with index values of
  /// <code>0</code> through <code>3</code>. If the starting range value is
  /// omitted (<code>:n</code>), then <code>0</code> is used to start the range.
  /// If the ending range value is omitted (<code>n:</code>), then the highest
  /// possible node index is used to end the range.
  final String targetNodes;

  /// The overrides that are sent to a node range.
  final ContainerOverrides? containerOverrides;

  /// An object that contains the properties that you want to replace for the
  /// existing Amazon ECS resources of a job.
  final EcsPropertiesOverride? ecsPropertiesOverride;

  /// An object that contains the instance types that you want to replace for the
  /// existing resources of a job.
  final List<String>? instanceTypes;

  NodePropertyOverride({
    required this.targetNodes,
    this.containerOverrides,
    this.ecsPropertiesOverride,
    this.instanceTypes,
  });

  Map<String, dynamic> toJson() {
    final targetNodes = this.targetNodes;
    final containerOverrides = this.containerOverrides;
    final ecsPropertiesOverride = this.ecsPropertiesOverride;
    final instanceTypes = this.instanceTypes;
    return {
      'targetNodes': targetNodes,
      if (containerOverrides != null) 'containerOverrides': containerOverrides,
      if (ecsPropertiesOverride != null)
        'ecsPropertiesOverride': ecsPropertiesOverride,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
    };
  }
}

/// This is an object that represents the properties of the node range for a
/// multi-node parallel job.
class NodeRangeProperty {
  /// The range of nodes, using node index values. A range of <code>0:3</code>
  /// indicates nodes with index values of <code>0</code> through <code>3</code>.
  /// If the starting range value is omitted (<code>:n</code>), then
  /// <code>0</code> is used to start the range. If the ending range value is
  /// omitted (<code>n:</code>), then the highest possible node index is used to
  /// end the range. Your accumulative node ranges must account for all nodes
  /// (<code>0:n</code>). You can nest node ranges (for example, <code>0:10</code>
  /// and <code>4:5</code>). In this case, the <code>4:5</code> range properties
  /// override the <code>0:10</code> properties.
  final String targetNodes;

  /// The container details for the node range.
  final ContainerProperties? container;

  /// This is an object that represents the properties of the node range for a
  /// multi-node parallel job.
  final EcsProperties? ecsProperties;

  /// The instance types of the underlying host infrastructure of a multi-node
  /// parallel job.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources.
  ///
  /// In addition, this list object is currently limited to one element.
  /// </note>
  final List<String>? instanceTypes;

  NodeRangeProperty({
    required this.targetNodes,
    this.container,
    this.ecsProperties,
    this.instanceTypes,
  });

  factory NodeRangeProperty.fromJson(Map<String, dynamic> json) {
    return NodeRangeProperty(
      targetNodes: json['targetNodes'] as String,
      container: json['container'] != null
          ? ContainerProperties.fromJson(
              json['container'] as Map<String, dynamic>)
          : null,
      ecsProperties: json['ecsProperties'] != null
          ? EcsProperties.fromJson(
              json['ecsProperties'] as Map<String, dynamic>)
          : null,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetNodes = this.targetNodes;
    final container = this.container;
    final ecsProperties = this.ecsProperties;
    final instanceTypes = this.instanceTypes;
    return {
      'targetNodes': targetNodes,
      if (container != null) 'container': container,
      if (ecsProperties != null) 'ecsProperties': ecsProperties,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
    };
  }
}

enum OrchestrationType {
  ecs,
  eks,
}

extension OrchestrationTypeValueExtension on OrchestrationType {
  String toValue() {
    switch (this) {
      case OrchestrationType.ecs:
        return 'ECS';
      case OrchestrationType.eks:
        return 'EKS';
    }
  }
}

extension OrchestrationTypeFromString on String {
  OrchestrationType toOrchestrationType() {
    switch (this) {
      case 'ECS':
        return OrchestrationType.ecs;
      case 'EKS':
        return OrchestrationType.eks;
    }
    throw Exception('$this is not known in enum OrchestrationType');
  }
}

enum PlatformCapability {
  ec2,
  fargate,
}

extension PlatformCapabilityValueExtension on PlatformCapability {
  String toValue() {
    switch (this) {
      case PlatformCapability.ec2:
        return 'EC2';
      case PlatformCapability.fargate:
        return 'FARGATE';
    }
  }
}

extension PlatformCapabilityFromString on String {
  PlatformCapability toPlatformCapability() {
    switch (this) {
      case 'EC2':
        return PlatformCapability.ec2;
      case 'FARGATE':
        return PlatformCapability.fargate;
    }
    throw Exception('$this is not known in enum PlatformCapability');
  }
}

class RegisterJobDefinitionResponse {
  /// The Amazon Resource Name (ARN) of the job definition.
  final String jobDefinitionArn;

  /// The name of the job definition.
  final String jobDefinitionName;

  /// The revision of the job definition.
  final int revision;

  RegisterJobDefinitionResponse({
    required this.jobDefinitionArn,
    required this.jobDefinitionName,
    required this.revision,
  });

  factory RegisterJobDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return RegisterJobDefinitionResponse(
      jobDefinitionArn: json['jobDefinitionArn'] as String,
      jobDefinitionName: json['jobDefinitionName'] as String,
      revision: json['revision'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDefinitionArn = this.jobDefinitionArn;
    final jobDefinitionName = this.jobDefinitionName;
    final revision = this.revision;
    return {
      'jobDefinitionArn': jobDefinitionArn,
      'jobDefinitionName': jobDefinitionName,
      'revision': revision,
    };
  }
}

/// The repository credentials for private registry authentication.
class RepositoryCredentials {
  /// The Amazon Resource Name (ARN) of the secret containing the private
  /// repository credentials.
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

/// The type and amount of a resource to assign to a container. The supported
/// resources include <code>GPU</code>, <code>MEMORY</code>, and
/// <code>VCPU</code>.
class ResourceRequirement {
  /// The type of resource to assign to a container. The supported resources
  /// include <code>GPU</code>, <code>MEMORY</code>, and <code>VCPU</code>.
  final ResourceType type;

  /// The quantity of the specified resource to reserve for the container. The
  /// values vary based on the <code>type</code> specified.
  /// <dl> <dt>type="GPU"</dt> <dd>
  /// The number of physical GPUs to reserve for the container. Make sure that the
  /// number of GPUs reserved for all containers in a job doesn't exceed the
  /// number of available GPUs on the compute resource that the job is launched
  /// on.
  /// <note>
  /// GPUs aren't available for jobs that are running on Fargate resources.
  /// </note> </dd> <dt>type="MEMORY"</dt> <dd>
  /// The memory hard limit (in MiB) present to the container. This parameter is
  /// supported for jobs that are running on Amazon EC2 resources. If your
  /// container attempts to exceed the memory specified, the container is
  /// terminated. This parameter maps to <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. You
  /// must specify at least 4 MiB of memory for a job. This is required but can be
  /// specified in several places for multi-node parallel (MNP) jobs. It must be
  /// specified for each node at least once. This parameter maps to
  /// <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <note>
  /// If you're trying to maximize your resource utilization by providing your
  /// jobs as much memory as possible for a particular instance type, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html">Memory
  /// management</a> in the <i>Batch User Guide</i>.
  /// </note>
  /// For jobs that are running on Fargate resources, then <code>value</code> is
  /// the hard limit (in MiB), and must match one of the supported values and the
  /// <code>VCPU</code> values must be one of the values supported for that memory
  /// value.
  /// <dl> <dt>value = 512</dt> <dd>
  /// <code>VCPU</code> = 0.25
  /// </dd> <dt>value = 1024</dt> <dd>
  /// <code>VCPU</code> = 0.25 or 0.5
  /// </dd> <dt>value = 2048</dt> <dd>
  /// <code>VCPU</code> = 0.25, 0.5, or 1
  /// </dd> <dt>value = 3072</dt> <dd>
  /// <code>VCPU</code> = 0.5, or 1
  /// </dd> <dt>value = 4096</dt> <dd>
  /// <code>VCPU</code> = 0.5, 1, or 2
  /// </dd> <dt>value = 5120, 6144, or 7168</dt> <dd>
  /// <code>VCPU</code> = 1 or 2
  /// </dd> <dt>value = 8192</dt> <dd>
  /// <code>VCPU</code> = 1, 2, or 4
  /// </dd> <dt>value = 9216, 10240, 11264, 12288, 13312, 14336, or 15360</dt>
  /// <dd>
  /// <code>VCPU</code> = 2 or 4
  /// </dd> <dt>value = 16384</dt> <dd>
  /// <code>VCPU</code> = 2, 4, or 8
  /// </dd> <dt>value = 17408, 18432, 19456, 21504, 22528, 23552, 25600, 26624,
  /// 27648, 29696, or 30720</dt> <dd>
  /// <code>VCPU</code> = 4
  /// </dd> <dt>value = 20480, 24576, or 28672</dt> <dd>
  /// <code>VCPU</code> = 4 or 8
  /// </dd> <dt>value = 36864, 45056, 53248, or 61440</dt> <dd>
  /// <code>VCPU</code> = 8
  /// </dd> <dt>value = 32768, 40960, 49152, or 57344</dt> <dd>
  /// <code>VCPU</code> = 8 or 16
  /// </dd> <dt>value = 65536, 73728, 81920, 90112, 98304, 106496, 114688, or
  /// 122880</dt> <dd>
  /// <code>VCPU</code> = 16
  /// </dd> </dl> </dd> <dt>type="VCPU"</dt> <dd>
  /// The number of vCPUs reserved for the container. This parameter maps to
  /// <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. Each
  /// vCPU is equivalent to 1,024 CPU shares. For Amazon EC2 resources, you must
  /// specify at least one vCPU. This is required but can be specified in several
  /// places; it must be specified for each node at least once.
  ///
  /// The default for the Fargate On-Demand vCPU resource count quota is 6 vCPUs.
  /// For more information about Fargate quotas, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/ecs-service.html#service-quotas-fargate">Fargate
  /// quotas</a> in the <i>Amazon Web Services General Reference</i>.
  ///
  /// For jobs that are running on Fargate resources, then <code>value</code> must
  /// match one of the supported values and the <code>MEMORY</code> values must be
  /// one of the values supported for that <code>VCPU</code> value. The supported
  /// values are 0.25, 0.5, 1, 2, 4, 8, and 16
  /// <dl> <dt>value = 0.25</dt> <dd>
  /// <code>MEMORY</code> = 512, 1024, or 2048
  /// </dd> <dt>value = 0.5</dt> <dd>
  /// <code>MEMORY</code> = 1024, 2048, 3072, or 4096
  /// </dd> <dt>value = 1</dt> <dd>
  /// <code>MEMORY</code> = 2048, 3072, 4096, 5120, 6144, 7168, or 8192
  /// </dd> <dt>value = 2</dt> <dd>
  /// <code>MEMORY</code> = 4096, 5120, 6144, 7168, 8192, 9216, 10240, 11264,
  /// 12288, 13312, 14336, 15360, or 16384
  /// </dd> <dt>value = 4</dt> <dd>
  /// <code>MEMORY</code> = 8192, 9216, 10240, 11264, 12288, 13312, 14336, 15360,
  /// 16384, 17408, 18432, 19456, 20480, 21504, 22528, 23552, 24576, 25600, 26624,
  /// 27648, 28672, 29696, or 30720
  /// </dd> <dt>value = 8</dt> <dd>
  /// <code>MEMORY</code> = 16384, 20480, 24576, 28672, 32768, 36864, 40960,
  /// 45056, 49152, 53248, 57344, or 61440
  /// </dd> <dt>value = 16</dt> <dd>
  /// <code>MEMORY</code> = 32768, 40960, 49152, 57344, 65536, 73728, 81920,
  /// 90112, 98304, 106496, 114688, or 122880
  /// </dd> </dl> </dd> </dl>
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
  vcpu,
  memory,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.gpu:
        return 'GPU';
      case ResourceType.vcpu:
        return 'VCPU';
      case ResourceType.memory:
        return 'MEMORY';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'GPU':
        return ResourceType.gpu;
      case 'VCPU':
        return ResourceType.vcpu;
      case 'MEMORY':
        return ResourceType.memory;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum RetryAction {
  retry,
  exit,
}

extension RetryActionValueExtension on RetryAction {
  String toValue() {
    switch (this) {
      case RetryAction.retry:
        return 'RETRY';
      case RetryAction.exit:
        return 'EXIT';
    }
  }
}

extension RetryActionFromString on String {
  RetryAction toRetryAction() {
    switch (this) {
      case 'RETRY':
        return RetryAction.retry;
      case 'EXIT':
        return RetryAction.exit;
    }
    throw Exception('$this is not known in enum RetryAction');
  }
}

/// The retry strategy that's associated with a job. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/job_retries.html">Automated
/// job retries</a> in the <i>Batch User Guide</i>.
class RetryStrategy {
  /// The number of times to move a job to the <code>RUNNABLE</code> status. You
  /// can specify between 1 and 10 attempts. If the value of <code>attempts</code>
  /// is greater than one, the job is retried on failure the same number of
  /// attempts as the value.
  final int? attempts;

  /// Array of up to 5 objects that specify the conditions where jobs are retried
  /// or failed. If this parameter is specified, then the <code>attempts</code>
  /// parameter must also be specified. If none of the listed conditions match,
  /// then the job is retried.
  final List<EvaluateOnExit>? evaluateOnExit;

  RetryStrategy({
    this.attempts,
    this.evaluateOnExit,
  });

  factory RetryStrategy.fromJson(Map<String, dynamic> json) {
    return RetryStrategy(
      attempts: json['attempts'] as int?,
      evaluateOnExit: (json['evaluateOnExit'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluateOnExit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attempts = this.attempts;
    final evaluateOnExit = this.evaluateOnExit;
    return {
      if (attempts != null) 'attempts': attempts,
      if (evaluateOnExit != null) 'evaluateOnExit': evaluateOnExit,
    };
  }
}

/// An object that represents the compute environment architecture for Batch
/// jobs on Fargate.
class RuntimePlatform {
  /// The vCPU architecture. The default value is <code>X86_64</code>. Valid
  /// values are <code>X86_64</code> and <code>ARM64</code>.
  /// <note>
  /// This parameter must be set to <code>X86_64</code> for Windows containers.
  /// </note> <note>
  /// Fargate Spot is not supported for <code>ARM64</code> and Windows-based
  /// containers on Fargate. A job queue will be blocked if a Fargate
  /// <code>ARM64</code> or Windows job is submitted to a job queue with only
  /// Fargate Spot compute environments. However, you can attach both
  /// <code>FARGATE</code> and <code>FARGATE_SPOT</code> compute environments to
  /// the same job queue.
  /// </note>
  final String? cpuArchitecture;

  /// The operating system for the compute environment. Valid values are:
  /// <code>LINUX</code> (default), <code>WINDOWS_SERVER_2019_CORE</code>,
  /// <code>WINDOWS_SERVER_2019_FULL</code>,
  /// <code>WINDOWS_SERVER_2022_CORE</code>, and
  /// <code>WINDOWS_SERVER_2022_FULL</code>.
  /// <note>
  /// The following parameters can’t be set for Windows containers:
  /// <code>linuxParameters</code>, <code>privileged</code>, <code>user</code>,
  /// <code>ulimits</code>, <code>readonlyRootFilesystem</code>, and
  /// <code>efsVolumeConfiguration</code>.
  /// </note> <note>
  /// The Batch Scheduler checks the compute environments that are attached to the
  /// job queue before registering a task definition with Fargate. In this
  /// scenario, the job queue is where the job is submitted. If the job requires a
  /// Windows container and the first compute environment is <code>LINUX</code>,
  /// the compute environment is skipped and the next compute environment is
  /// checked until a Windows-based compute environment is found.
  /// </note> <note>
  /// Fargate Spot is not supported for <code>ARM64</code> and Windows-based
  /// containers on Fargate. A job queue will be blocked if a Fargate
  /// <code>ARM64</code> or Windows job is submitted to a job queue with only
  /// Fargate Spot compute environments. However, you can attach both
  /// <code>FARGATE</code> and <code>FARGATE_SPOT</code> compute environments to
  /// the same job queue.
  /// </note>
  final String? operatingSystemFamily;

  RuntimePlatform({
    this.cpuArchitecture,
    this.operatingSystemFamily,
  });

  factory RuntimePlatform.fromJson(Map<String, dynamic> json) {
    return RuntimePlatform(
      cpuArchitecture: json['cpuArchitecture'] as String?,
      operatingSystemFamily: json['operatingSystemFamily'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitecture = this.cpuArchitecture;
    final operatingSystemFamily = this.operatingSystemFamily;
    return {
      if (cpuArchitecture != null) 'cpuArchitecture': cpuArchitecture,
      if (operatingSystemFamily != null)
        'operatingSystemFamily': operatingSystemFamily,
    };
  }
}

/// An object that represents a scheduling policy.
class SchedulingPolicyDetail {
  /// The Amazon Resource Name (ARN) of the scheduling policy. An example is
  /// <code>arn:<i>aws</i>:batch:<i>us-east-1</i>:<i>123456789012</i>:scheduling-policy/<i>HighPriority</i>
  /// </code>.
  final String arn;

  /// The name of the scheduling policy.
  final String name;

  /// The fair share policy for the scheduling policy.
  final FairsharePolicy? fairsharePolicy;

  /// The tags that you apply to the scheduling policy to categorize and organize
  /// your resources. Each tag consists of a key and an optional value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in <i>Amazon Web Services General
  /// Reference</i>.
  final Map<String, String>? tags;

  SchedulingPolicyDetail({
    required this.arn,
    required this.name,
    this.fairsharePolicy,
    this.tags,
  });

  factory SchedulingPolicyDetail.fromJson(Map<String, dynamic> json) {
    return SchedulingPolicyDetail(
      arn: json['arn'] as String,
      name: json['name'] as String,
      fairsharePolicy: json['fairsharePolicy'] != null
          ? FairsharePolicy.fromJson(
              json['fairsharePolicy'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final fairsharePolicy = this.fairsharePolicy;
    final tags = this.tags;
    return {
      'arn': arn,
      'name': name,
      if (fairsharePolicy != null) 'fairsharePolicy': fairsharePolicy,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object that contains the details of a scheduling policy that's returned
/// in a <code>ListSchedulingPolicy</code> action.
class SchedulingPolicyListingDetail {
  /// Amazon Resource Name (ARN) of the scheduling policy.
  final String arn;

  SchedulingPolicyListingDetail({
    required this.arn,
  });

  factory SchedulingPolicyListingDetail.fromJson(Map<String, dynamic> json) {
    return SchedulingPolicyListingDetail(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// An object that represents the secret to expose to your container. Secrets
/// can be exposed to a container in the following ways:
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
/// href="https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html">Specifying
/// sensitive data</a> in the <i>Batch User Guide</i>.
class Secret {
  /// The name of the secret.
  final String name;

  /// The secret to expose to the container. The supported values are either the
  /// full Amazon Resource Name (ARN) of the Secrets Manager secret or the full
  /// ARN of the parameter in the Amazon Web Services Systems Manager Parameter
  /// Store.
  /// <note>
  /// If the Amazon Web Services Systems Manager Parameter Store parameter exists
  /// in the same Region as the job you're launching, then you can use either the
  /// full Amazon Resource Name (ARN) or name of the parameter. If the parameter
  /// exists in a different Region, then the full ARN must be specified.
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

/// Specifies the weights for the fair share identifiers for the fair share
/// policy. Fair share identifiers that aren't included have a default weight of
/// <code>1.0</code>.
class ShareAttributes {
  /// A fair share identifier or fair share identifier prefix. If the string ends
  /// with an asterisk (*), this entry specifies the weight factor to use for fair
  /// share identifiers that start with that prefix. The list of fair share
  /// identifiers in a fair share policy can't overlap. For example, you can't
  /// have one that specifies a <code>shareIdentifier</code> of
  /// <code>UserA*</code> and another that specifies a
  /// <code>shareIdentifier</code> of <code>UserA-1</code>.
  ///
  /// There can be no more than 500 fair share identifiers active in a job queue.
  ///
  /// The string is limited to 255 alphanumeric characters, and can be followed by
  /// an asterisk (*).
  final String shareIdentifier;

  /// The weight factor for the fair share identifier. The default value is 1.0. A
  /// lower value has a higher priority for compute resources. For example, jobs
  /// that use a share identifier with a weight factor of 0.125 (1/8) get 8 times
  /// the compute resources of jobs that use a share identifier with a weight
  /// factor of 1.
  ///
  /// The smallest supported value is 0.0001, and the largest supported value is
  /// 999.9999.
  final double? weightFactor;

  ShareAttributes({
    required this.shareIdentifier,
    this.weightFactor,
  });

  factory ShareAttributes.fromJson(Map<String, dynamic> json) {
    return ShareAttributes(
      shareIdentifier: json['shareIdentifier'] as String,
      weightFactor: json['weightFactor'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareIdentifier = this.shareIdentifier;
    final weightFactor = this.weightFactor;
    return {
      'shareIdentifier': shareIdentifier,
      if (weightFactor != null) 'weightFactor': weightFactor,
    };
  }
}

class SubmitJobResponse {
  /// The unique identifier for the job.
  final String jobId;

  /// The name of the job.
  final String jobName;

  /// The Amazon Resource Name (ARN) for the job.
  final String? jobArn;

  SubmitJobResponse({
    required this.jobId,
    required this.jobName,
    this.jobArn,
  });

  factory SubmitJobResponse.fromJson(Map<String, dynamic> json) {
    return SubmitJobResponse(
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      jobArn: json['jobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobArn = this.jobArn;
    return {
      'jobId': jobId,
      'jobName': jobName,
      if (jobArn != null) 'jobArn': jobArn,
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

/// A list of containers that this task depends on.
class TaskContainerDependency {
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
  /// but it also requires that the container exits with a zero status. This
  /// condition can't be set on an essential container.
  /// </li>
  /// </ul>
  final String? condition;

  /// A unique identifier for the container.
  final String? containerName;

  TaskContainerDependency({
    this.condition,
    this.containerName,
  });

  factory TaskContainerDependency.fromJson(Map<String, dynamic> json) {
    return TaskContainerDependency(
      condition: json['condition'] as String?,
      containerName: json['containerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final containerName = this.containerName;
    return {
      if (condition != null) 'condition': condition,
      if (containerName != null) 'containerName': containerName,
    };
  }
}

/// The details for the container in this task attempt.
class TaskContainerDetails {
  /// The command that's passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. For
  /// more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">https://docs.docker.com/engine/reference/builder/#cmd</a>.
  final List<String>? command;

  /// A list of containers that this container depends on.
  final List<TaskContainerDependency>? dependsOn;

  /// The environment variables to pass to a container. This parameter maps to
  /// <code>Env</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--env</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <important>
  /// We don't recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  /// </important>
  final List<KeyValuePair>? environment;

  /// If the essential parameter of a container is marked as <code>true</code>,
  /// and that container fails or stops for any reason, all other containers that
  /// are part of the task are stopped. If the <code>essential</code> parameter of
  /// a container is marked as false, its failure doesn't affect the rest of the
  /// containers in a task. If this parameter is omitted, a container is assumed
  /// to be essential.
  ///
  /// All jobs must have at least one essential container. If you have an
  /// application that's composed of multiple containers, group containers that
  /// are used for a common purpose into components, and separate the different
  /// components into multiple task definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/application_architecture.html">Application
  /// Architecture</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final bool? essential;

  /// The exit code returned upon completion.
  final int? exitCode;

  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. By default, images in the Docker Hub registry are available.
  /// Other repositories are specified with either
  /// <code>repository-url/image:tag</code> or
  /// <code>repository-url/image@digest</code>. Up to 255 letters (uppercase and
  /// lowercase), numbers, hyphens, underscores, colons, periods, forward slashes,
  /// and number signs are allowed. This parameter maps to <code>Image</code> in
  /// the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>IMAGE</code> parameter of the <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">
  /// <i>docker run</i> </a>.
  final String? image;

  /// Linux-specific modifications that are applied to the container, such as
  /// Linux kernel capabilities. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_KernelCapabilities.html">KernelCapabilities</a>.
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
  /// run</a>.
  ///
  /// By default, containers use the same logging driver that the Docker daemon
  /// uses. However the container can use a different logging driver than the
  /// Docker daemon by specifying a log driver with this parameter in the
  /// container definition. To use a different logging driver for a container, the
  /// log system must be configured properly on the container instance (or on a
  /// different log server for remote logging options). For more information about
  /// the options for different supported log drivers, see <a
  /// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
  /// logging drivers </a> in the <i>Docker documentation</i>.
  /// <note>
  /// Amazon ECS currently supports a subset of the logging drivers available to
  /// the Docker daemon (shown in the <code>LogConfiguration</code> data type).
  /// Additional log drivers may be available in future releases of the Amazon ECS
  /// container agent.
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: sudo docker version <code>--format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// the logging drivers available on that instance with the
  /// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
  /// containers placed on that instance can use these log configuration options.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS container agent configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final LogConfiguration? logConfiguration;

  /// The name of the CloudWatch Logs log stream that's associated with the
  /// container. The log group for Batch jobs is /aws/batch/job. Each container
  /// attempt receives a log stream name when they reach the <code>RUNNING</code>
  /// status.
  final String? logStreamName;

  /// The mount points for data volumes in your container.
  ///
  /// This parameter maps to <code>Volumes</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <a href="">--volume</a> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Windows containers can mount whole directories on the same drive as
  /// <code>$env:ProgramData</code>. Windows containers can't mount directories on
  /// a different drive, and mount point can't be across drives.
  final List<MountPoint>? mountPoints;

  /// The name of a container.
  final String? name;

  /// The network interfaces that are associated with the job.
  final List<NetworkInterface>? networkInterfaces;

  /// When this parameter is <code>true</code>, the container is given elevated
  /// privileges on the host container instance (similar to the <code>root</code>
  /// user). This parameter maps to <code>Privileged</code> in the <a
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

  /// A short (255 max characters) human-readable string to provide additional
  /// details for a running or stopped container.
  final String? reason;

  /// The private repository authentication credentials to use.
  final RepositoryCredentials? repositoryCredentials;

  /// The type and amount of a resource to assign to a container. The only
  /// supported resource is a GPU.
  final List<ResourceRequirement>? resourceRequirements;

  /// The secrets to pass to the container. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html">Specifying
  /// Sensitive Data</a> in the Amazon Elastic Container Service Developer Guide.
  final List<Secret>? secrets;

  /// A list of <code>ulimits</code> to set in the container. If a
  /// <code>ulimit</code> value is specified in a task definition, it overrides
  /// the default values set by Docker. This parameter maps to
  /// <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Amazon ECS tasks hosted on Fargate use the default resource limit values set
  /// by the operating system with the exception of the nofile resource limit
  /// parameter which Fargate overrides. The <code>nofile</code> resource limit
  /// sets a restriction on the number of open files that a container can use. The
  /// default <code>nofile</code> soft limit is <code>1024</code> and the default
  /// hard limit is <code>65535</code>.
  ///
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: sudo docker version <code>--format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final List<Ulimit>? ulimits;

  /// The user to use inside the container. This parameter maps to User in the
  /// Create a container section of the Docker Remote API and the --user option to
  /// docker run.
  /// <note>
  /// When running tasks using the <code>host</code> network mode, don't run
  /// containers using the <code>root user (UID 0)</code>. We recommend using a
  /// non-root user for better security.
  /// </note>
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
  /// <code>user:gi</code>
  /// </li>
  /// <li>
  /// <code>uid:group</code>
  /// </li>
  /// <li>
  /// <code/>
  /// </li>
  /// </ul> <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final String? user;

  TaskContainerDetails({
    this.command,
    this.dependsOn,
    this.environment,
    this.essential,
    this.exitCode,
    this.image,
    this.linuxParameters,
    this.logConfiguration,
    this.logStreamName,
    this.mountPoints,
    this.name,
    this.networkInterfaces,
    this.privileged,
    this.readonlyRootFilesystem,
    this.reason,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.secrets,
    this.ulimits,
    this.user,
  });

  factory TaskContainerDetails.fromJson(Map<String, dynamic> json) {
    return TaskContainerDetails(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dependsOn: (json['dependsOn'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TaskContainerDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      essential: json['essential'] as bool?,
      exitCode: json['exitCode'] as int?,
      image: json['image'] as String?,
      linuxParameters: json['linuxParameters'] != null
          ? LinuxParameters.fromJson(
              json['linuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      logStreamName: json['logStreamName'] as String?,
      mountPoints: (json['mountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MountPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      privileged: json['privileged'] as bool?,
      readonlyRootFilesystem: json['readonlyRootFilesystem'] as bool?,
      reason: json['reason'] as String?,
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
      ulimits: (json['ulimits'] as List?)
          ?.whereNotNull()
          .map((e) => Ulimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final dependsOn = this.dependsOn;
    final environment = this.environment;
    final essential = this.essential;
    final exitCode = this.exitCode;
    final image = this.image;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final logStreamName = this.logStreamName;
    final mountPoints = this.mountPoints;
    final name = this.name;
    final networkInterfaces = this.networkInterfaces;
    final privileged = this.privileged;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final reason = this.reason;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final secrets = this.secrets;
    final ulimits = this.ulimits;
    final user = this.user;
    return {
      if (command != null) 'command': command,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (environment != null) 'environment': environment,
      if (essential != null) 'essential': essential,
      if (exitCode != null) 'exitCode': exitCode,
      if (image != null) 'image': image,
      if (linuxParameters != null) 'linuxParameters': linuxParameters,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (mountPoints != null) 'mountPoints': mountPoints,
      if (name != null) 'name': name,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (privileged != null) 'privileged': privileged,
      if (readonlyRootFilesystem != null)
        'readonlyRootFilesystem': readonlyRootFilesystem,
      if (reason != null) 'reason': reason,
      if (repositoryCredentials != null)
        'repositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (secrets != null) 'secrets': secrets,
      if (ulimits != null) 'ulimits': ulimits,
      if (user != null) 'user': user,
    };
  }
}

/// The overrides that should be sent to a container.
///
/// For information about using Batch overrides when you connect event sources
/// to targets, see <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/pipes-reference/API_BatchContainerOverrides.html">BatchContainerOverrides</a>.
class TaskContainerOverrides {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the job definition.
  /// <note>
  /// This parameter can't contain an empty string.
  /// </note>
  final List<String>? command;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// job definition.
  /// <note>
  /// Environment variables cannot start with <code>AWS_BATCH</code>. This naming
  /// convention is reserved for variables that Batch sets.
  /// </note>
  final List<KeyValuePair>? environment;

  /// A pointer to the container that you want to override. The container's name
  /// provides a unique identifier for the container being used.
  final String? name;

  /// The type and amount of resources to assign to a container. This overrides
  /// the settings in the job definition. The supported resources include
  /// <code>GPU</code>, <code>MEMORY</code>, and <code>VCPU</code>.
  final List<ResourceRequirement>? resourceRequirements;

  TaskContainerOverrides({
    this.command,
    this.environment,
    this.name,
    this.resourceRequirements,
  });

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environment = this.environment;
    final name = this.name;
    final resourceRequirements = this.resourceRequirements;
    return {
      if (command != null) 'command': command,
      if (environment != null) 'environment': environment,
      if (name != null) 'name': name,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
    };
  }
}

/// Container properties are used for Amazon ECS-based job definitions. These
/// properties to describe the container that's launched as part of a job.
class TaskContainerProperties {
  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. By default, images in the Docker Hub registry are available.
  /// Other repositories are specified with either
  /// <code>repository-url/image:tag</code> or
  /// <code>repository-url/image@digest</code>. Up to 255 letters (uppercase and
  /// lowercase), numbers, hyphens, underscores, colons, periods, forward slashes,
  /// and number signs are allowed. This parameter maps to <code>Image</code> in
  /// the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>IMAGE</code> parameter of the <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">
  /// <i>docker run</i> </a>.
  final String image;

  /// The command that's passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. For
  /// more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">Dockerfile
  /// reference: CMD</a>.
  final List<String>? command;

  /// A list of containers that this container depends on.
  final List<TaskContainerDependency>? dependsOn;

  /// The environment variables to pass to a container. This parameter maps to Env
  /// inthe <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--env</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <important>
  /// We don't recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  /// </important> <note>
  /// Environment variables cannot start with <code>AWS_BATCH</code>. This naming
  /// convention is reserved for variables that Batch sets.
  /// </note>
  final List<KeyValuePair>? environment;

  /// If the essential parameter of a container is marked as <code>true</code>,
  /// and that container fails or stops for any reason, all other containers that
  /// are part of the task are stopped. If the <code>essential</code> parameter of
  /// a container is marked as false, its failure doesn't affect the rest of the
  /// containers in a task. If this parameter is omitted, a container is assumed
  /// to be essential.
  ///
  /// All jobs must have at least one essential container. If you have an
  /// application that's composed of multiple containers, group containers that
  /// are used for a common purpose into components, and separate the different
  /// components into multiple task definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/application_architecture.html">Application
  /// Architecture</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  final bool? essential;

  /// Linux-specific modifications that are applied to the container, such as
  /// Linux kernel capabilities. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_KernelCapabilities.html">KernelCapabilities</a>.
  final LinuxParameters? linuxParameters;

  /// The log configuration specification for the container.
  ///
  /// This parameter maps to <code>LogConfig</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--log-driver</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// By default, containers use the same logging driver that the Docker daemon
  /// uses. However the container can use a different logging driver than the
  /// Docker daemon by specifying a log driver with this parameter in the
  /// container definition. To use a different logging driver for a container, the
  /// log system must be configured properly on the container instance (or on a
  /// different log server for remote logging options). For more information about
  /// the options for different supported log drivers, see <a
  /// href="https://docs.docker.com/engine/admin/logging/overview/">Configure
  /// logging drivers </a> in the <i>Docker documentation</i>.
  /// <note>
  /// Amazon ECS currently supports a subset of the logging drivers available to
  /// the Docker daemon (shown in the <code>LogConfiguration</code> data type).
  /// Additional log drivers may be available in future releases of the Amazon ECS
  /// container agent.
  /// </note>
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: sudo docker version <code>--format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// The Amazon ECS container agent running on a container instance must register
  /// the logging drivers available on that instance with the
  /// <code>ECS_AVAILABLE_LOGGING_DRIVERS</code> environment variable before
  /// containers placed on that instance can use these log configuration options.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html">Amazon
  /// ECS container agent configuration</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// </note>
  final LogConfiguration? logConfiguration;

  /// The mount points for data volumes in your container.
  ///
  /// This parameter maps to <code>Volumes</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <a href="">--volume</a> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Windows containers can mount whole directories on the same drive as
  /// <code>$env:ProgramData</code>. Windows containers can't mount directories on
  /// a different drive, and mount point can't be across drives.
  final List<MountPoint>? mountPoints;

  /// The name of a container. The name can be used as a unique identifier to
  /// target your <code>dependsOn</code> and <code>Overrides</code> objects.
  final String? name;

  /// When this parameter is <code>true</code>, the container is given elevated
  /// privileges on the host container instance (similar to the <code>root</code>
  /// user). This parameter maps to <code>Privileged</code> in the <a
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
  /// Sensitive Data</a> in the Amazon Elastic Container Service Developer Guide.
  final List<Secret>? secrets;

  /// A list of <code>ulimits</code> to set in the container. If a
  /// <code>ulimit</code> value is specified in a task definition, it overrides
  /// the default values set by Docker. This parameter maps to
  /// <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.35/#operation/ContainerCreate">Create
  /// a container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.35/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/#security-configuration">docker
  /// run</a>.
  ///
  /// Amazon ECS tasks hosted on Fargate use the default resource limit values set
  /// by the operating system with the exception of the nofile resource limit
  /// parameter which Fargate overrides. The <code>nofile</code> resource limit
  /// sets a restriction on the number of open files that a container can use. The
  /// default <code>nofile</code> soft limit is <code>1024</code> and the default
  /// hard limit is <code>65535</code>.
  ///
  /// This parameter requires version 1.18 of the Docker Remote API or greater on
  /// your container instance. To check the Docker Remote API version on your
  /// container instance, log in to your container instance and run the following
  /// command: sudo docker version <code>--format '{{.Server.APIVersion}}'</code>
  /// <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final List<Ulimit>? ulimits;

  /// The user to use inside the container. This parameter maps to User in the
  /// Create a container section of the Docker Remote API and the --user option to
  /// docker run.
  /// <note>
  /// When running tasks using the <code>host</code> network mode, don't run
  /// containers using the <code>root user (UID 0)</code>. We recommend using a
  /// non-root user for better security.
  /// </note>
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
  /// <code>user:gi</code>
  /// </li>
  /// <li>
  /// <code>uid:group</code>
  /// </li>
  /// </ul> <note>
  /// This parameter is not supported for Windows containers.
  /// </note>
  final String? user;

  TaskContainerProperties({
    required this.image,
    this.command,
    this.dependsOn,
    this.environment,
    this.essential,
    this.linuxParameters,
    this.logConfiguration,
    this.mountPoints,
    this.name,
    this.privileged,
    this.readonlyRootFilesystem,
    this.repositoryCredentials,
    this.resourceRequirements,
    this.secrets,
    this.ulimits,
    this.user,
  });

  factory TaskContainerProperties.fromJson(Map<String, dynamic> json) {
    return TaskContainerProperties(
      image: json['image'] as String,
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dependsOn: (json['dependsOn'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TaskContainerDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      environment: (json['environment'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      essential: json['essential'] as bool?,
      linuxParameters: json['linuxParameters'] != null
          ? LinuxParameters.fromJson(
              json['linuxParameters'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['logConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      mountPoints: (json['mountPoints'] as List?)
          ?.whereNotNull()
          .map((e) => MountPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      privileged: json['privileged'] as bool?,
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
      ulimits: (json['ulimits'] as List?)
          ?.whereNotNull()
          .map((e) => Ulimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final command = this.command;
    final dependsOn = this.dependsOn;
    final environment = this.environment;
    final essential = this.essential;
    final linuxParameters = this.linuxParameters;
    final logConfiguration = this.logConfiguration;
    final mountPoints = this.mountPoints;
    final name = this.name;
    final privileged = this.privileged;
    final readonlyRootFilesystem = this.readonlyRootFilesystem;
    final repositoryCredentials = this.repositoryCredentials;
    final resourceRequirements = this.resourceRequirements;
    final secrets = this.secrets;
    final ulimits = this.ulimits;
    final user = this.user;
    return {
      'image': image,
      if (command != null) 'command': command,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (environment != null) 'environment': environment,
      if (essential != null) 'essential': essential,
      if (linuxParameters != null) 'linuxParameters': linuxParameters,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (mountPoints != null) 'mountPoints': mountPoints,
      if (name != null) 'name': name,
      if (privileged != null) 'privileged': privileged,
      if (readonlyRootFilesystem != null)
        'readonlyRootFilesystem': readonlyRootFilesystem,
      if (repositoryCredentials != null)
        'repositoryCredentials': repositoryCredentials,
      if (resourceRequirements != null)
        'resourceRequirements': resourceRequirements,
      if (secrets != null) 'secrets': secrets,
      if (ulimits != null) 'ulimits': ulimits,
      if (user != null) 'user': user,
    };
  }
}

/// An object that contains overrides for the task definition of a job.
class TaskPropertiesOverride {
  /// The overrides for the container definition of a job.
  final List<TaskContainerOverrides>? containers;

  TaskPropertiesOverride({
    this.containers,
  });

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    return {
      if (containers != null) 'containers': containers,
    };
  }
}

class TerminateJobResponse {
  TerminateJobResponse();

  factory TerminateJobResponse.fromJson(Map<String, dynamic> _) {
    return TerminateJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The container path, mount options, and size of the <code>tmpfs</code> mount.
/// <note>
/// This object isn't applicable to jobs that are running on Fargate resources.
/// </note>
class Tmpfs {
  /// The absolute file path in the container where the <code>tmpfs</code> volume
  /// is mounted.
  final String containerPath;

  /// The size (in MiB) of the <code>tmpfs</code> volume.
  final int size;

  /// The list of <code>tmpfs</code> volume mount options.
  ///
  /// Valid values: "<code>defaults</code>" | "<code>ro</code>" |
  /// "<code>rw</code>" | "<code>suid</code>" | "<code>nosuid</code>" |
  /// "<code>dev</code>" | "<code>nodev</code>" | "<code>exec</code>" |
  /// "<code>noexec</code>" | "<code>sync</code>" | "<code>async</code>" |
  /// "<code>dirsync</code>" | "<code>remount</code>" | "<code>mand</code>" |
  /// "<code>nomand</code>" | "<code>atime</code>" | "<code>noatime</code>" |
  /// "<code>diratime</code>" | "<code>nodiratime</code>" | "<code>bind</code>" |
  /// "<code>rbind" | "unbindable" | "runbindable" | "private" | "rprivate" |
  /// "shared" | "rshared" | "slave" | "rslave" | "relatime</code>" |
  /// "<code>norelatime</code>" | "<code>strictatime</code>" |
  /// "<code>nostrictatime</code>" | "<code>mode</code>" | "<code>uid</code>" |
  /// "<code>gid</code>" | "<code>nr_inodes</code>" | "<code>nr_blocks</code>" |
  /// "<code>mpol</code>"
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

/// The <code>ulimit</code> settings to pass to the container. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_Ulimit.html">Ulimit</a>.
/// <note>
/// This object isn't applicable to jobs that are running on Fargate resources.
/// </note>
class Ulimit {
  /// The hard limit for the <code>ulimit</code> type.
  final int hardLimit;

  /// The <code>type</code> of the <code>ulimit</code>. Valid values are:
  /// <code>core</code> | <code>cpu</code> | <code>data</code> |
  /// <code>fsize</code> | <code>locks</code> | <code>memlock</code> |
  /// <code>msgqueue</code> | <code>nice</code> | <code>nofile</code> |
  /// <code>nproc</code> | <code>rss</code> | <code>rtprio</code> |
  /// <code>rttime</code> | <code>sigpending</code> | <code>stack</code>.
  final String name;

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
      name: json['name'] as String,
      softLimit: json['softLimit'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hardLimit = this.hardLimit;
    final name = this.name;
    final softLimit = this.softLimit;
    return {
      'hardLimit': hardLimit,
      'name': name,
      'softLimit': softLimit,
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

class UpdateComputeEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the compute environment.
  final String? computeEnvironmentArn;

  /// The name of the compute environment. It can be up to 128 characters long. It
  /// can contain uppercase and lowercase letters, numbers, hyphens (-), and
  /// underscores (_).
  final String? computeEnvironmentName;

  UpdateComputeEnvironmentResponse({
    this.computeEnvironmentArn,
    this.computeEnvironmentName,
  });

  factory UpdateComputeEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateComputeEnvironmentResponse(
      computeEnvironmentArn: json['computeEnvironmentArn'] as String?,
      computeEnvironmentName: json['computeEnvironmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeEnvironmentArn = this.computeEnvironmentArn;
    final computeEnvironmentName = this.computeEnvironmentName;
    return {
      if (computeEnvironmentArn != null)
        'computeEnvironmentArn': computeEnvironmentArn,
      if (computeEnvironmentName != null)
        'computeEnvironmentName': computeEnvironmentName,
    };
  }
}

class UpdateJobQueueResponse {
  /// The Amazon Resource Name (ARN) of the job queue.
  final String? jobQueueArn;

  /// The name of the job queue.
  final String? jobQueueName;

  UpdateJobQueueResponse({
    this.jobQueueArn,
    this.jobQueueName,
  });

  factory UpdateJobQueueResponse.fromJson(Map<String, dynamic> json) {
    return UpdateJobQueueResponse(
      jobQueueArn: json['jobQueueArn'] as String?,
      jobQueueName: json['jobQueueName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobQueueArn = this.jobQueueArn;
    final jobQueueName = this.jobQueueName;
    return {
      if (jobQueueArn != null) 'jobQueueArn': jobQueueArn,
      if (jobQueueName != null) 'jobQueueName': jobQueueName,
    };
  }
}

/// Specifies the infrastructure update policy for the compute environment. For
/// more information about infrastructure updates, see <a
/// href="https://docs.aws.amazon.com/batch/latest/userguide/updating-compute-environments.html">Updating
/// compute environments</a> in the <i>Batch User Guide</i>.
class UpdatePolicy {
  /// Specifies the job timeout (in minutes) when the compute environment
  /// infrastructure is updated. The default value is 30.
  final int? jobExecutionTimeoutMinutes;

  /// Specifies whether jobs are automatically terminated when the computer
  /// environment infrastructure is updated. The default value is
  /// <code>false</code>.
  final bool? terminateJobsOnUpdate;

  UpdatePolicy({
    this.jobExecutionTimeoutMinutes,
    this.terminateJobsOnUpdate,
  });

  factory UpdatePolicy.fromJson(Map<String, dynamic> json) {
    return UpdatePolicy(
      jobExecutionTimeoutMinutes: json['jobExecutionTimeoutMinutes'] as int?,
      terminateJobsOnUpdate: json['terminateJobsOnUpdate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobExecutionTimeoutMinutes = this.jobExecutionTimeoutMinutes;
    final terminateJobsOnUpdate = this.terminateJobsOnUpdate;
    return {
      if (jobExecutionTimeoutMinutes != null)
        'jobExecutionTimeoutMinutes': jobExecutionTimeoutMinutes,
      if (terminateJobsOnUpdate != null)
        'terminateJobsOnUpdate': terminateJobsOnUpdate,
    };
  }
}

class UpdateSchedulingPolicyResponse {
  UpdateSchedulingPolicyResponse();

  factory UpdateSchedulingPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSchedulingPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A data volume that's used in a job's container properties.
class Volume {
  /// This parameter is specified when you're using an Amazon Elastic File System
  /// file system for job storage. Jobs that are running on Fargate resources must
  /// specify a <code>platformVersion</code> of at least <code>1.4.0</code>.
  final EFSVolumeConfiguration? efsVolumeConfiguration;

  /// The contents of the <code>host</code> parameter determine whether your data
  /// volume persists on the host container instance and where it's stored. If the
  /// host parameter is empty, then the Docker daemon assigns a host path for your
  /// data volume. However, the data isn't guaranteed to persist after the
  /// containers that are associated with it stop running.
  /// <note>
  /// This parameter isn't applicable to jobs that are running on Fargate
  /// resources and shouldn't be provided.
  /// </note>
  final Host? host;

  /// The name of the volume. It can be up to 255 characters long. It can contain
  /// uppercase and lowercase letters, numbers, hyphens (-), and underscores (_).
  /// This name is referenced in the <code>sourceVolume</code> parameter of
  /// container definition <code>mountPoints</code>.
  final String? name;

  Volume({
    this.efsVolumeConfiguration,
    this.host,
    this.name,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      efsVolumeConfiguration: json['efsVolumeConfiguration'] != null
          ? EFSVolumeConfiguration.fromJson(
              json['efsVolumeConfiguration'] as Map<String, dynamic>)
          : null,
      host: json['host'] != null
          ? Host.fromJson(json['host'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final efsVolumeConfiguration = this.efsVolumeConfiguration;
    final host = this.host;
    final name = this.name;
    return {
      if (efsVolumeConfiguration != null)
        'efsVolumeConfiguration': efsVolumeConfiguration,
      if (host != null) 'host': host,
      if (name != null) 'name': name,
    };
  }
}

class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
};
