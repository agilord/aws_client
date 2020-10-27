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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'batch-2016-08-10.g.dart';

/// AWS Batch enables you to run batch computing workloads on the AWS Cloud.
/// Batch computing is a common way for developers, scientists, and engineers to
/// access large amounts of compute resources, and AWS Batch removes the
/// undifferentiated heavy lifting of configuring and managing the required
/// infrastructure. AWS Batch will be familiar to users of traditional batch
/// computing software. This service can efficiently provision resources in
/// response to jobs submitted in order to eliminate capacity constraints,
/// reduce compute costs, and deliver results quickly.
///
/// As a fully managed service, AWS Batch enables developers, scientists, and
/// engineers to run batch computing workloads of any scale. AWS Batch
/// automatically provisions compute resources and optimizes the workload
/// distribution based on the quantity and scale of the workloads. With AWS
/// Batch, there is no need to install or manage batch computing software, which
/// allows you to focus on analyzing results and solving problems. AWS Batch
/// reduces operational complexities, saves time, and reduces costs, which makes
/// it easy for developers, scientists, and engineers to run their batch jobs in
/// the AWS Cloud.
class Batch {
  final _s.RestJsonProtocol _protocol;
  Batch({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'batch',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels a job in an AWS Batch job queue. Jobs that are in the
  /// <code>SUBMITTED</code>, <code>PENDING</code>, or <code>RUNNABLE</code>
  /// state are cancelled. Jobs that have progressed to <code>STARTING</code> or
  /// <code>RUNNING</code> are not cancelled (but the API operation still
  /// succeeds, even if no job is cancelled); these jobs must be terminated with
  /// the <a>TerminateJob</a> operation.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobId] :
  /// The AWS Batch job ID of the job to cancel.
  ///
  /// Parameter [reason] :
  /// A message to attach to the job that explains the reason for canceling it.
  /// This message is returned by future <a>DescribeJobs</a> operations on the
  /// job. This message is also recorded in the AWS Batch activity logs.
  Future<void> cancelJob({
    @_s.required String jobId,
    @_s.required String reason,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(reason, 'reason');
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
    return CancelJobResponse.fromJson(response);
  }

  /// Creates an AWS Batch compute environment. You can create
  /// <code>MANAGED</code> or <code>UNMANAGED</code> compute environments.
  ///
  /// In a managed compute environment, AWS Batch manages the capacity and
  /// instance types of the compute resources within the environment. This is
  /// based on the compute resource specification that you define or the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch
  /// template</a> that you specify when you create the compute environment. You
  /// can choose to use Amazon EC2 On-Demand Instances or Spot Instances in your
  /// managed compute environment. You can optionally set a maximum price so
  /// that Spot Instances only launch when the Spot Instance price is below a
  /// specified percentage of the On-Demand price.
  /// <note>
  /// Multi-node parallel jobs are not supported on Spot Instances.
  /// </note>
  /// In an unmanaged compute environment, you can manage your own compute
  /// resources. This provides more compute resource configuration options, such
  /// as using a custom AMI, but you must ensure that your AMI meets the Amazon
  /// ECS container instance AMI specification. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container_instance_AMIs.html">Container
  /// Instance AMIs</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>. After you have created your unmanaged compute environment, you
  /// can use the <a>DescribeComputeEnvironments</a> operation to find the
  /// Amazon ECS cluster that is associated with it. Then, manually launch your
  /// container instances into that Amazon ECS cluster. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html">Launching
  /// an Amazon ECS Container Instance</a> in the <i>Amazon Elastic Container
  /// Service Developer Guide</i>.
  /// <note>
  /// AWS Batch does not upgrade the AMIs in a compute environment after it is
  /// created (for example, when a newer version of the Amazon ECS-optimized AMI
  /// is available). You are responsible for the management of the guest
  /// operating system (including updates and security patches) and any
  /// additional application software or utilities that you install on the
  /// compute resources. To use a new AMI for your AWS Batch jobs:
  /// <ol>
  /// <li>
  /// Create a new compute environment with the new AMI.
  /// </li>
  /// <li>
  /// Add the compute environment to an existing job queue.
  /// </li>
  /// <li>
  /// Remove the old compute environment from your job queue.
  /// </li>
  /// <li>
  /// Delete the old compute environment.
  /// </li> </ol> </note>
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironmentName] :
  /// The name for your compute environment. Up to 128 letters (uppercase and
  /// lowercase), numbers, hyphens, and underscores are allowed.
  ///
  /// Parameter [serviceRole] :
  /// The full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch
  /// to make calls to other AWS services on your behalf.
  ///
  /// If your specified role has a path other than <code>/</code>, then you must
  /// either specify the full role ARN (this is recommended) or prefix the role
  /// name with the path.
  /// <note>
  /// Depending on how you created your AWS Batch service role, its ARN may
  /// contain the <code>service-role</code> path prefix. When you only specify
  /// the name of the service role, AWS Batch assumes that your ARN does not use
  /// the <code>service-role</code> path prefix. Because of this, we recommend
  /// that you specify the full ARN of your service role when you create compute
  /// environments.
  /// </note>
  ///
  /// Parameter [type] :
  /// The type of the compute environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// Environments</a> in the <i>AWS Batch User Guide</i>.
  ///
  /// Parameter [computeResources] :
  /// Details of the compute resources managed by the compute environment. This
  /// parameter is required for managed compute environments. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html">Compute
  /// Environments</a> in the <i>AWS Batch User Guide</i>.
  ///
  /// Parameter [state] :
  /// The state of the compute environment. If the state is
  /// <code>ENABLED</code>, then the compute environment accepts jobs from a
  /// queue and can scale out automatically based on queues.
  Future<CreateComputeEnvironmentResponse> createComputeEnvironment({
    @_s.required String computeEnvironmentName,
    @_s.required String serviceRole,
    @_s.required CEType type,
    ComputeResource computeResources,
    CEState state,
  }) async {
    ArgumentError.checkNotNull(
        computeEnvironmentName, 'computeEnvironmentName');
    ArgumentError.checkNotNull(serviceRole, 'serviceRole');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'computeEnvironmentName': computeEnvironmentName,
      'serviceRole': serviceRole,
      'type': type?.toValue(),
      if (computeResources != null) 'computeResources': computeResources,
      if (state != null) 'state': state?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/createcomputeenvironment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComputeEnvironmentResponse.fromJson(response);
  }

  /// Creates an AWS Batch job queue. When you create a job queue, you associate
  /// one or more compute environments to the queue and assign an order of
  /// preference for the compute environments.
  ///
  /// You also set a priority to the job queue that determines the order in
  /// which the AWS Batch scheduler places jobs onto its associated compute
  /// environments. For example, if a compute environment is associated with
  /// more than one job queue, the job queue with a higher priority is given
  /// preference for scheduling jobs to that compute environment.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironmentOrder] :
  /// The set of compute environments mapped to a job queue and their order
  /// relative to each other. The job scheduler uses this parameter to determine
  /// which compute environment should execute a given job. Compute environments
  /// must be in the <code>VALID</code> state before you can associate them with
  /// a job queue. You can associate up to three compute environments with a job
  /// queue.
  ///
  /// Parameter [jobQueueName] :
  /// The name of the job queue.
  ///
  /// Parameter [priority] :
  /// The priority of the job queue. Job queues with a higher priority (or a
  /// higher integer value for the <code>priority</code> parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order, for example, a job queue with
  /// a priority value of <code>10</code> is given scheduling preference over a
  /// job queue with a priority value of <code>1</code>.
  ///
  /// Parameter [state] :
  /// The state of the job queue. If the job queue state is
  /// <code>ENABLED</code>, it is able to accept jobs.
  Future<CreateJobQueueResponse> createJobQueue({
    @_s.required List<ComputeEnvironmentOrder> computeEnvironmentOrder,
    @_s.required String jobQueueName,
    @_s.required int priority,
    JQState state,
  }) async {
    ArgumentError.checkNotNull(
        computeEnvironmentOrder, 'computeEnvironmentOrder');
    ArgumentError.checkNotNull(jobQueueName, 'jobQueueName');
    ArgumentError.checkNotNull(priority, 'priority');
    final $payload = <String, dynamic>{
      'computeEnvironmentOrder': computeEnvironmentOrder,
      'jobQueueName': jobQueueName,
      'priority': priority,
      if (state != null) 'state': state?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/createjobqueue',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobQueueResponse.fromJson(response);
  }

  /// Deletes an AWS Batch compute environment.
  ///
  /// Before you can delete a compute environment, you must set its state to
  /// <code>DISABLED</code> with the <a>UpdateComputeEnvironment</a> API
  /// operation and disassociate it from any job queues with the
  /// <a>UpdateJobQueue</a> API operation.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [computeEnvironment] :
  /// The name or Amazon Resource Name (ARN) of the compute environment to
  /// delete.
  Future<void> deleteComputeEnvironment({
    @_s.required String computeEnvironment,
  }) async {
    ArgumentError.checkNotNull(computeEnvironment, 'computeEnvironment');
    final $payload = <String, dynamic>{
      'computeEnvironment': computeEnvironment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deletecomputeenvironment',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteComputeEnvironmentResponse.fromJson(response);
  }

  /// Deletes the specified job queue. You must first disable submissions for a
  /// queue with the <a>UpdateJobQueue</a> operation. All jobs in the queue are
  /// terminated when you delete a job queue.
  ///
  /// It is not necessary to disassociate compute environments from a queue
  /// before submitting a <code>DeleteJobQueue</code> request.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobQueue] :
  /// The short name or full Amazon Resource Name (ARN) of the queue to delete.
  Future<void> deleteJobQueue({
    @_s.required String jobQueue,
  }) async {
    ArgumentError.checkNotNull(jobQueue, 'jobQueue');
    final $payload = <String, dynamic>{
      'jobQueue': jobQueue,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deletejobqueue',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobQueueResponse.fromJson(response);
  }

  /// Deregisters an AWS Batch job definition. Job definitions will be
  /// permanently deleted after 180 days.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinition] :
  /// The name and revision (<code>name:revision</code>) or full Amazon Resource
  /// Name (ARN) of the job definition to deregister.
  Future<void> deregisterJobDefinition({
    @_s.required String jobDefinition,
  }) async {
    ArgumentError.checkNotNull(jobDefinition, 'jobDefinition');
    final $payload = <String, dynamic>{
      'jobDefinition': jobDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/deregisterjobdefinition',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterJobDefinitionResponse.fromJson(response);
  }

  /// Describes one or more of your compute environments.
  ///
  /// If you are using an unmanaged compute environment, you can use the
  /// <code>DescribeComputeEnvironment</code> operation to determine the
  /// <code>ecsClusterArn</code> that you should launch your Amazon ECS
  /// container instances into.
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
  /// parameter is not used, then <code>DescribeComputeEnvironments</code>
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
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeComputeEnvironmentsResponse> describeComputeEnvironments({
    List<String> computeEnvironments,
    int maxResults,
    String nextToken,
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
  /// A list of up to 100 job definition names or full Amazon Resource Name
  /// (ARN) entries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by
  /// <code>DescribeJobDefinitions</code> in paginated output. When this
  /// parameter is used, <code>DescribeJobDefinitions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeJobDefinitions</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>DescribeJobDefinitions</code> returns up
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
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [status] :
  /// The status with which to filter job definitions.
  Future<DescribeJobDefinitionsResponse> describeJobDefinitions({
    String jobDefinitionName,
    List<String> jobDefinitions,
    int maxResults,
    String nextToken,
    String status,
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
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>DescribeJobQueues</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>DescribeJobQueues</code> returns up to
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
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeJobQueuesResponse> describeJobQueues({
    List<String> jobQueues,
    int maxResults,
    String nextToken,
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

  /// Describes a list of AWS Batch jobs.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobs] :
  /// A list of up to 100 job IDs.
  Future<DescribeJobsResponse> describeJobs({
    @_s.required List<String> jobs,
  }) async {
    ArgumentError.checkNotNull(jobs, 'jobs');
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

  /// Returns a list of AWS Batch jobs.
  ///
  /// You must specify only one of the following:
  ///
  /// <ul>
  /// <li>
  /// a job queue ID to return a list of jobs in that job queue
  /// </li>
  /// <li>
  /// a multi-node parallel job ID to return a list of that job's nodes
  /// </li>
  /// <li>
  /// an array job ID to return a list of that job's children
  /// </li>
  /// </ul>
  /// You can filter the results by job status with the <code>jobStatus</code>
  /// parameter. If you do not specify a status, only <code>RUNNING</code> jobs
  /// are returned.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [arrayJobId] :
  /// The job ID for an array job. Specifying an array job ID with this
  /// parameter lists all child jobs from within the specified array.
  ///
  /// Parameter [jobQueue] :
  /// The name or full Amazon Resource Name (ARN) of the job queue with which to
  /// list jobs.
  ///
  /// Parameter [jobStatus] :
  /// The job status with which to filter jobs in the specified queue. If you do
  /// not specify a status, only <code>RUNNING</code> jobs are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by <code>ListJobs</code> in
  /// paginated output. When this parameter is used, <code>ListJobs</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListJobs</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If this parameter is not used, then
  /// <code>ListJobs</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
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
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListJobsResponse> listJobs({
    String arrayJobId,
    String jobQueue,
    JobStatus jobStatus,
    int maxResults,
    String multiNodeJobId,
    String nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (arrayJobId != null) 'arrayJobId': arrayJobId,
      if (jobQueue != null) 'jobQueue': jobQueue,
      if (jobStatus != null) 'jobStatus': jobStatus?.toValue(),
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

  /// Registers an AWS Batch job definition.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinitionName] :
  /// The name of the job definition to register. Up to 128 letters (uppercase
  /// and lowercase), numbers, hyphens, and underscores are allowed.
  ///
  /// Parameter [type] :
  /// The type of job definition.
  ///
  /// Parameter [containerProperties] :
  /// An object with various properties specific to single-node container-based
  /// jobs. If the job definition's <code>type</code> parameter is
  /// <code>container</code>, then you must specify either
  /// <code>containerProperties</code> or <code>nodeProperties</code>.
  ///
  /// Parameter [nodeProperties] :
  /// An object with various properties specific to multi-node parallel jobs. If
  /// you specify node properties for a job, it becomes a multi-node parallel
  /// job. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/multi-node-parallel-jobs.html">Multi-node
  /// Parallel Jobs</a> in the <i>AWS Batch User Guide</i>. If the job
  /// definition's <code>type</code> parameter is <code>container</code>, then
  /// you must specify either <code>containerProperties</code> or
  /// <code>nodeProperties</code>.
  ///
  /// Parameter [parameters] :
  /// Default parameter substitution placeholders to set in the job definition.
  /// Parameters are specified as a key-value pair mapping. Parameters in a
  /// <code>SubmitJob</code> request override any corresponding parameter
  /// defaults from the job definition.
  ///
  /// Parameter [retryStrategy] :
  /// The retry strategy to use for failed jobs that are submitted with this job
  /// definition. Any retry strategy that is specified during a <a>SubmitJob</a>
  /// operation overrides the retry strategy defined here. If a job is
  /// terminated due to a timeout, it is not retried.
  ///
  /// Parameter [timeout] :
  /// The timeout configuration for jobs that are submitted with this job
  /// definition, after which AWS Batch terminates your jobs if they have not
  /// finished. If a job is terminated due to a timeout, it is not retried. The
  /// minimum value for the timeout is 60 seconds. Any timeout configuration
  /// that is specified during a <a>SubmitJob</a> operation overrides the
  /// timeout configuration defined here. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/job_timeouts.html">Job
  /// Timeouts</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  Future<RegisterJobDefinitionResponse> registerJobDefinition({
    @_s.required String jobDefinitionName,
    @_s.required JobDefinitionType type,
    ContainerProperties containerProperties,
    NodeProperties nodeProperties,
    Map<String, String> parameters,
    RetryStrategy retryStrategy,
    JobTimeout timeout,
  }) async {
    ArgumentError.checkNotNull(jobDefinitionName, 'jobDefinitionName');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'jobDefinitionName': jobDefinitionName,
      'type': type?.toValue(),
      if (containerProperties != null)
        'containerProperties': containerProperties,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (parameters != null) 'parameters': parameters,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
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

  /// Submits an AWS Batch job from a job definition. Parameters specified
  /// during <a>SubmitJob</a> override parameters defined in the job definition.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobDefinition] :
  /// The job definition used by this job. This value can be one of
  /// <code>name</code>, <code>name:revision</code>, or the Amazon Resource Name
  /// (ARN) for the job definition. If <code>name</code> is specified without a
  /// revision then the latest active revision is used.
  ///
  /// Parameter [jobName] :
  /// The name of the job. The first character must be alphanumeric, and up to
  /// 128 letters (uppercase and lowercase), numbers, hyphens, and underscores
  /// are allowed.
  ///
  /// Parameter [jobQueue] :
  /// The job queue into which the job is submitted. You can specify either the
  /// name or the Amazon Resource Name (ARN) of the queue.
  ///
  /// Parameter [arrayProperties] :
  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array
  /// properties for a job, it becomes an array job. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html">Array
  /// Jobs</a> in the <i>AWS Batch User Guide</i>.
  ///
  /// Parameter [containerOverrides] :
  /// A list of container overrides in JSON format that specify the name of a
  /// container in the specified job definition and the overrides it should
  /// receive. You can override the default command for a container (that is
  /// specified in the job definition or the Docker image) with a
  /// <code>command</code> override. You can also override existing environment
  /// variables (that are specified in the job definition or Docker image) on a
  /// container or add new environment variables to it with an
  /// <code>environment</code> override.
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
  /// Parameter [nodeOverrides] :
  /// A list of node overrides in JSON format that specify the node range to
  /// target and the container overrides for that node range.
  ///
  /// Parameter [parameters] :
  /// Additional parameters passed to the job that replace parameter
  /// substitution placeholders that are set in the job definition. Parameters
  /// are specified as a key and value pair mapping. Parameters in a
  /// <code>SubmitJob</code> request override any corresponding parameter
  /// defaults from the job definition.
  ///
  /// Parameter [retryStrategy] :
  /// The retry strategy to use for failed jobs from this <a>SubmitJob</a>
  /// operation. When a retry strategy is specified here, it overrides the retry
  /// strategy defined in the job definition.
  ///
  /// Parameter [timeout] :
  /// The timeout configuration for this <a>SubmitJob</a> operation. You can
  /// specify a timeout duration after which AWS Batch terminates your jobs if
  /// they have not finished. If a job is terminated due to a timeout, it is not
  /// retried. The minimum value for the timeout is 60 seconds. This
  /// configuration overrides any timeout configuration specified in the job
  /// definition. For array jobs, child jobs have the same timeout configuration
  /// as the parent job. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/job_timeouts.html">Job
  /// Timeouts</a> in the <i>Amazon Elastic Container Service Developer
  /// Guide</i>.
  Future<SubmitJobResponse> submitJob({
    @_s.required String jobDefinition,
    @_s.required String jobName,
    @_s.required String jobQueue,
    ArrayProperties arrayProperties,
    ContainerOverrides containerOverrides,
    List<JobDependency> dependsOn,
    NodeOverrides nodeOverrides,
    Map<String, String> parameters,
    RetryStrategy retryStrategy,
    JobTimeout timeout,
  }) async {
    ArgumentError.checkNotNull(jobDefinition, 'jobDefinition');
    ArgumentError.checkNotNull(jobName, 'jobName');
    ArgumentError.checkNotNull(jobQueue, 'jobQueue');
    final $payload = <String, dynamic>{
      'jobDefinition': jobDefinition,
      'jobName': jobName,
      'jobQueue': jobQueue,
      if (arrayProperties != null) 'arrayProperties': arrayProperties,
      if (containerOverrides != null) 'containerOverrides': containerOverrides,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (nodeOverrides != null) 'nodeOverrides': nodeOverrides,
      if (parameters != null) 'parameters': parameters,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
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

  /// Terminates a job in a job queue. Jobs that are in the
  /// <code>STARTING</code> or <code>RUNNING</code> state are terminated, which
  /// causes them to transition to <code>FAILED</code>. Jobs that have not
  /// progressed to the <code>STARTING</code> state are cancelled.
  ///
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [jobId] :
  /// The AWS Batch job ID of the job to terminate.
  ///
  /// Parameter [reason] :
  /// A message to attach to the job that explains the reason for canceling it.
  /// This message is returned by future <a>DescribeJobs</a> operations on the
  /// job. This message is also recorded in the AWS Batch activity logs.
  Future<void> terminateJob({
    @_s.required String jobId,
    @_s.required String reason,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(reason, 'reason');
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
    return TerminateJobResponse.fromJson(response);
  }

  /// Updates an AWS Batch compute environment.
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
  /// Required for a managed compute environment.
  ///
  /// Parameter [serviceRole] :
  /// The full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch
  /// to make calls to other AWS services on your behalf.
  ///
  /// If your specified role has a path other than <code>/</code>, then you must
  /// either specify the full role ARN (this is recommended) or prefix the role
  /// name with the path.
  /// <note>
  /// Depending on how you created your AWS Batch service role, its ARN may
  /// contain the <code>service-role</code> path prefix. When you only specify
  /// the name of the service role, AWS Batch assumes that your ARN does not use
  /// the <code>service-role</code> path prefix. Because of this, we recommend
  /// that you specify the full ARN of your service role when you create compute
  /// environments.
  /// </note>
  ///
  /// Parameter [state] :
  /// The state of the compute environment. Compute environments in the
  /// <code>ENABLED</code> state can accept jobs from a queue and scale in or
  /// out automatically based on the workload demand of its associated queues.
  Future<UpdateComputeEnvironmentResponse> updateComputeEnvironment({
    @_s.required String computeEnvironment,
    ComputeResourceUpdate computeResources,
    String serviceRole,
    CEState state,
  }) async {
    ArgumentError.checkNotNull(computeEnvironment, 'computeEnvironment');
    final $payload = <String, dynamic>{
      'computeEnvironment': computeEnvironment,
      if (computeResources != null) 'computeResources': computeResources,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (state != null) 'state': state?.toValue(),
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
  /// job scheduler to determine which compute environment should execute a
  /// given job.
  ///
  /// Parameter [priority] :
  /// The priority of the job queue. Job queues with a higher priority (or a
  /// higher integer value for the <code>priority</code> parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order, for example, a job queue with
  /// a priority value of <code>10</code> is given scheduling preference over a
  /// job queue with a priority value of <code>1</code>.
  ///
  /// Parameter [state] :
  /// Describes the queue's ability to accept new jobs.
  Future<UpdateJobQueueResponse> updateJobQueue({
    @_s.required String jobQueue,
    List<ComputeEnvironmentOrder> computeEnvironmentOrder,
    int priority,
    JQState state,
  }) async {
    ArgumentError.checkNotNull(jobQueue, 'jobQueue');
    final $payload = <String, dynamic>{
      'jobQueue': jobQueue,
      if (computeEnvironmentOrder != null)
        'computeEnvironmentOrder': computeEnvironmentOrder,
      if (priority != null) 'priority': priority,
      if (state != null) 'state': state?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/updatejobqueue',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateJobQueueResponse.fromJson(response);
  }
}

enum ArrayJobDependency {
  @_s.JsonValue('N_TO_N')
  nToN,
  @_s.JsonValue('SEQUENTIAL')
  sequential,
}

/// An object representing an AWS Batch array job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ArrayProperties {
  /// The size of the array job.
  @_s.JsonKey(name: 'size')
  final int size;

  ArrayProperties({
    this.size,
  });
  Map<String, dynamic> toJson() => _$ArrayPropertiesToJson(this);
}

/// An object representing the array properties of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArrayPropertiesDetail {
  /// The job index within the array that is associated with this job. This
  /// parameter is returned for array job children.
  @_s.JsonKey(name: 'index')
  final int index;

  /// The size of the array job. This parameter is returned for parent array jobs.
  @_s.JsonKey(name: 'size')
  final int size;

  /// A summary of the number of array job children in each available job status.
  /// This parameter is returned for parent array jobs.
  @_s.JsonKey(name: 'statusSummary')
  final Map<String, int> statusSummary;

  ArrayPropertiesDetail({
    this.index,
    this.size,
    this.statusSummary,
  });
  factory ArrayPropertiesDetail.fromJson(Map<String, dynamic> json) =>
      _$ArrayPropertiesDetailFromJson(json);
}

/// An object representing the array properties of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArrayPropertiesSummary {
  /// The job index within the array that is associated with this job. This
  /// parameter is returned for children of array jobs.
  @_s.JsonKey(name: 'index')
  final int index;

  /// The size of the array job. This parameter is returned for parent array jobs.
  @_s.JsonKey(name: 'size')
  final int size;

  ArrayPropertiesSummary({
    this.index,
    this.size,
  });
  factory ArrayPropertiesSummary.fromJson(Map<String, dynamic> json) =>
      _$ArrayPropertiesSummaryFromJson(json);
}

/// An object representing the details of a container that is part of a job
/// attempt.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttemptContainerDetail {
  /// The Amazon Resource Name (ARN) of the Amazon ECS container instance that
  /// hosts the job attempt.
  @_s.JsonKey(name: 'containerInstanceArn')
  final String containerInstanceArn;

  /// The exit code for the job attempt. A non-zero exit code is considered a
  /// failure.
  @_s.JsonKey(name: 'exitCode')
  final int exitCode;

  /// The name of the CloudWatch Logs log stream associated with the container.
  /// The log group for AWS Batch jobs is <code>/aws/batch/job</code>. Each
  /// container attempt receives a log stream name when they reach the
  /// <code>RUNNING</code> status.
  @_s.JsonKey(name: 'logStreamName')
  final String logStreamName;

  /// The network interfaces associated with the job attempt.
  @_s.JsonKey(name: 'networkInterfaces')
  final List<NetworkInterface> networkInterfaces;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  @_s.JsonKey(name: 'reason')
  final String reason;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that is associated
  /// with the job attempt. Each container attempt receives a task ARN when they
  /// reach the <code>STARTING</code> status.
  @_s.JsonKey(name: 'taskArn')
  final String taskArn;

  AttemptContainerDetail({
    this.containerInstanceArn,
    this.exitCode,
    this.logStreamName,
    this.networkInterfaces,
    this.reason,
    this.taskArn,
  });
  factory AttemptContainerDetail.fromJson(Map<String, dynamic> json) =>
      _$AttemptContainerDetailFromJson(json);
}

/// An object representing a job attempt.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttemptDetail {
  /// Details about the container in this job attempt.
  @_s.JsonKey(name: 'container')
  final AttemptContainerDetail container;

  /// The Unix timestamp (in seconds and milliseconds) for when the attempt was
  /// started (when the attempt transitioned from the <code>STARTING</code> state
  /// to the <code>RUNNING</code> state).
  @_s.JsonKey(name: 'startedAt')
  final int startedAt;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job attempt.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The Unix timestamp (in seconds and milliseconds) for when the attempt was
  /// stopped (when the attempt transitioned from the <code>RUNNING</code> state
  /// to a terminal state, such as <code>SUCCEEDED</code> or <code>FAILED</code>).
  @_s.JsonKey(name: 'stoppedAt')
  final int stoppedAt;

  AttemptDetail({
    this.container,
    this.startedAt,
    this.statusReason,
    this.stoppedAt,
  });
  factory AttemptDetail.fromJson(Map<String, dynamic> json) =>
      _$AttemptDetailFromJson(json);
}

enum CEState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on CEState {
  String toValue() {
    switch (this) {
      case CEState.enabled:
        return 'ENABLED';
      case CEState.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum CEStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('VALID')
  valid,
  @_s.JsonValue('INVALID')
  invalid,
}

enum CEType {
  @_s.JsonValue('MANAGED')
  managed,
  @_s.JsonValue('UNMANAGED')
  unmanaged,
}

extension on CEType {
  String toValue() {
    switch (this) {
      case CEType.managed:
        return 'MANAGED';
      case CEType.unmanaged:
        return 'UNMANAGED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum CRAllocationStrategy {
  @_s.JsonValue('BEST_FIT')
  bestFit,
  @_s.JsonValue('BEST_FIT_PROGRESSIVE')
  bestFitProgressive,
  @_s.JsonValue('SPOT_CAPACITY_OPTIMIZED')
  spotCapacityOptimized,
}

enum CRType {
  @_s.JsonValue('EC2')
  ec2,
  @_s.JsonValue('SPOT')
  spot,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobResponse {
  CancelJobResponse();
  factory CancelJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelJobResponseFromJson(json);
}

/// An object representing an AWS Batch compute environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComputeEnvironmentDetail {
  /// The Amazon Resource Name (ARN) of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentArn')
  final String computeEnvironmentArn;

  /// The name of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentName')
  final String computeEnvironmentName;

  /// The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by
  /// the compute environment.
  @_s.JsonKey(name: 'ecsClusterArn')
  final String ecsClusterArn;

  /// The compute resources defined for the compute environment.
  @_s.JsonKey(name: 'computeResources')
  final ComputeResource computeResources;

  /// The service role associated with the compute environment that allows AWS
  /// Batch to make calls to AWS API operations on your behalf.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// The state of the compute environment. The valid values are
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  ///
  /// If the state is <code>ENABLED</code>, then the AWS Batch scheduler can
  /// attempt to place jobs from an associated job queue on the compute resources
  /// within the environment. If the compute environment is managed, then it can
  /// scale its instances out or in automatically, based on the job queue demand.
  ///
  /// If the state is <code>DISABLED</code>, then the AWS Batch scheduler does not
  /// attempt to place jobs within the environment. Jobs in a
  /// <code>STARTING</code> or <code>RUNNING</code> state continue to progress
  /// normally. Managed compute environments in the <code>DISABLED</code> state do
  /// not scale out. However, they scale in to <code>minvCpus</code> value after
  /// instances become idle.
  @_s.JsonKey(name: 'state')
  final CEState state;

  /// The current status of the compute environment (for example,
  /// <code>CREATING</code> or <code>VALID</code>).
  @_s.JsonKey(name: 'status')
  final CEStatus status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the compute environment.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The type of the compute environment.
  @_s.JsonKey(name: 'type')
  final CEType type;

  ComputeEnvironmentDetail({
    @_s.required this.computeEnvironmentArn,
    @_s.required this.computeEnvironmentName,
    @_s.required this.ecsClusterArn,
    this.computeResources,
    this.serviceRole,
    this.state,
    this.status,
    this.statusReason,
    this.type,
  });
  factory ComputeEnvironmentDetail.fromJson(Map<String, dynamic> json) =>
      _$ComputeEnvironmentDetailFromJson(json);
}

/// The order in which compute environments are tried for job placement within a
/// queue. Compute environments are tried in ascending order. For example, if
/// two compute environments are associated with a job queue, the compute
/// environment with a lower order integer value is tried for job placement
/// first.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComputeEnvironmentOrder {
  /// The Amazon Resource Name (ARN) of the compute environment.
  @_s.JsonKey(name: 'computeEnvironment')
  final String computeEnvironment;

  /// The order of the compute environment.
  @_s.JsonKey(name: 'order')
  final int order;

  ComputeEnvironmentOrder({
    @_s.required this.computeEnvironment,
    @_s.required this.order,
  });
  factory ComputeEnvironmentOrder.fromJson(Map<String, dynamic> json) =>
      _$ComputeEnvironmentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ComputeEnvironmentOrderToJson(this);
}

/// An object representing an AWS Batch compute resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComputeResource {
  /// The Amazon ECS instance profile applied to Amazon EC2 instances in a compute
  /// environment. You can specify the short name or full Amazon Resource Name
  /// (ARN) of an instance profile. For example, <code> <i>ecsInstanceRole</i>
  /// </code> or
  /// <code>arn:aws:iam::<i>&lt;aws_account_id&gt;</i>:instance-profile/<i>ecsInstanceRole</i>
  /// </code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/instance_IAM_role.html">Amazon
  /// ECS Instance Role</a> in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'instanceRole')
  final String instanceRole;

  /// The instances types that may be launched. You can specify instance families
  /// to launch any instance type within those families (for example,
  /// <code>c5</code> or <code>p3</code>), or you can specify specific sizes
  /// within a family (such as <code>c5.8xlarge</code>). You can also choose
  /// <code>optimal</code> to pick instance types (from the C, M, and R instance
  /// families) on the fly that match the demand of your job queues.
  @_s.JsonKey(name: 'instanceTypes')
  final List<String> instanceTypes;

  /// The maximum number of Amazon EC2 vCPUs that an environment can reach.
  @_s.JsonKey(name: 'maxvCpus')
  final int maxvCpus;

  /// The minimum number of Amazon EC2 vCPUs that an environment should maintain
  /// (even if the compute environment is <code>DISABLED</code>).
  @_s.JsonKey(name: 'minvCpus')
  final int minvCpus;

  /// The VPC subnets into which the compute resources are launched. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">VPCs
  /// and Subnets</a> in the <i>Amazon VPC User Guide</i>.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// The type of compute environment: <code>EC2</code> or <code>SPOT</code>.
  @_s.JsonKey(name: 'type')
  final CRType type;

  /// The allocation strategy to use for the compute resource in case not enough
  /// instances of the best fitting instance type can be allocated. This could be
  /// due to availability of the instance type in the region or <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon
  /// EC2 service limits</a>. If this is not specified, the default is
  /// <code>BEST_FIT</code>, which will use only the best fitting instance type,
  /// waiting for additional capacity if it's not available. This allocation
  /// strategy keeps costs lower but can limit scaling. If you are using Spot
  /// Fleets with <code>BEST_FIT</code> then the Spot Fleet IAM Role must be
  /// specified. <code>BEST_FIT_PROGRESSIVE</code> will select additional instance
  /// types that are large enough to meet the requirements of the jobs in the
  /// queue, with a preference for instance types with a lower cost per vCPU.
  /// <code>SPOT_CAPACITY_OPTIMIZED</code> is only available for Spot Instance
  /// compute resources and will select additional instance types that are large
  /// enough to meet the requirements of the jobs in the queue, with a preference
  /// for instance types that are less likely to be interrupted. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/allocation-strategies.html
  /// ">Allocation Strategies</a> in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'allocationStrategy')
  final CRAllocationStrategy allocationStrategy;

  /// The maximum percentage that a Spot Instance price can be when compared with
  /// the On-Demand price for that instance type before instances are launched.
  /// For example, if your maximum percentage is 20%, then the Spot price must be
  /// below 20% of the current On-Demand price for that Amazon EC2 instance. You
  /// always pay the lowest (market) price and never more than your maximum
  /// percentage. If you leave this field empty, the default value is 100% of the
  /// On-Demand price.
  @_s.JsonKey(name: 'bidPercentage')
  final int bidPercentage;

  /// The desired number of Amazon EC2 vCPUS in the compute environment.
  @_s.JsonKey(name: 'desiredvCpus')
  final int desiredvCpus;

  /// The Amazon EC2 key pair that is used for instances launched in the compute
  /// environment.
  @_s.JsonKey(name: 'ec2KeyPair')
  final String ec2KeyPair;

  /// The Amazon Machine Image (AMI) ID used for instances launched in the compute
  /// environment.
  @_s.JsonKey(name: 'imageId')
  final String imageId;

  /// The launch template to use for your compute resources. Any other compute
  /// resource parameters that you specify in a <a>CreateComputeEnvironment</a>
  /// API operation override the same parameters in the launch template. You must
  /// specify either the launch template ID or launch template name in the
  /// request, but not both. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html">Launch
  /// Template Support</a> in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'launchTemplate')
  final LaunchTemplateSpecification launchTemplate;

  /// The Amazon EC2 placement group to associate with your compute resources. If
  /// you intend to submit multi-node parallel jobs to your compute environment,
  /// you should consider creating a cluster placement group and associate it with
  /// your compute resources. This keeps your multi-node parallel job on a logical
  /// grouping of instances within a single Availability Zone with high network
  /// flow potential. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement
  /// Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.
  @_s.JsonKey(name: 'placementGroup')
  final String placementGroup;

  /// The Amazon EC2 security groups associated with instances launched in the
  /// compute environment. One or more security groups must be specified, either
  /// in <code>securityGroupIds</code> or using a launch template referenced in
  /// <code>launchTemplate</code>. If security groups are specified using both
  /// <code>securityGroupIds</code> and <code>launchTemplate</code>, the values in
  /// <code>securityGroupIds</code> will be used.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied
  /// to a <code>SPOT</code> compute environment. This role is required if the
  /// allocation strategy set to <code>BEST_FIT</code> or if the allocation
  /// strategy is not specified. For more information, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html">Amazon
  /// EC2 Spot Fleet Role</a> in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'spotIamFleetRole')
  final String spotIamFleetRole;

  /// Key-value pair tags to be applied to resources that are launched in the
  /// compute environment. For AWS Batch, these take the form of "String1":
  /// "String2", where String1 is the tag key and String2 is the tag value—for
  /// example, { "Name": "AWS Batch Instance - C4OnDemand" }.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ComputeResource({
    @_s.required this.instanceRole,
    @_s.required this.instanceTypes,
    @_s.required this.maxvCpus,
    @_s.required this.minvCpus,
    @_s.required this.subnets,
    @_s.required this.type,
    this.allocationStrategy,
    this.bidPercentage,
    this.desiredvCpus,
    this.ec2KeyPair,
    this.imageId,
    this.launchTemplate,
    this.placementGroup,
    this.securityGroupIds,
    this.spotIamFleetRole,
    this.tags,
  });
  factory ComputeResource.fromJson(Map<String, dynamic> json) =>
      _$ComputeResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ComputeResourceToJson(this);
}

/// An object representing the attributes of a compute environment that can be
/// updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComputeResourceUpdate {
  /// The desired number of Amazon EC2 vCPUS in the compute environment.
  @_s.JsonKey(name: 'desiredvCpus')
  final int desiredvCpus;

  /// The maximum number of Amazon EC2 vCPUs that an environment can reach.
  @_s.JsonKey(name: 'maxvCpus')
  final int maxvCpus;

  /// The minimum number of Amazon EC2 vCPUs that an environment should maintain.
  @_s.JsonKey(name: 'minvCpus')
  final int minvCpus;

  ComputeResourceUpdate({
    this.desiredvCpus,
    this.maxvCpus,
    this.minvCpus,
  });
  Map<String, dynamic> toJson() => _$ComputeResourceUpdateToJson(this);
}

/// An object representing the details of a container that is part of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerDetail {
  /// The command that is passed to the container.
  @_s.JsonKey(name: 'command')
  final List<String> command;

  /// The Amazon Resource Name (ARN) of the container instance on which the
  /// container is running.
  @_s.JsonKey(name: 'containerInstanceArn')
  final String containerInstanceArn;

  /// The environment variables to pass to a container.
  /// <note>
  /// Environment variables must not start with <code>AWS_BATCH</code>; this
  /// naming convention is reserved for variables that are set by the AWS Batch
  /// service.
  /// </note>
  @_s.JsonKey(name: 'environment')
  final List<KeyValuePair> environment;

  /// The exit code to return upon completion.
  @_s.JsonKey(name: 'exitCode')
  final int exitCode;

  /// The image used to start the container.
  @_s.JsonKey(name: 'image')
  final String image;

  /// The instance type of the underlying host infrastructure of a multi-node
  /// parallel job.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The Amazon Resource Name (ARN) associated with the job upon execution.
  @_s.JsonKey(name: 'jobRoleArn')
  final String jobRoleArn;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  @_s.JsonKey(name: 'linuxParameters')
  final LinuxParameters linuxParameters;

  /// The name of the CloudWatch Logs log stream associated with the container.
  /// The log group for AWS Batch jobs is <code>/aws/batch/job</code>. Each
  /// container attempt receives a log stream name when they reach the
  /// <code>RUNNING</code> status.
  @_s.JsonKey(name: 'logStreamName')
  final String logStreamName;

  /// The number of MiB of memory reserved for the job.
  @_s.JsonKey(name: 'memory')
  final int memory;

  /// The mount points for data volumes in your container.
  @_s.JsonKey(name: 'mountPoints')
  final List<MountPoint> mountPoints;

  /// The network interfaces associated with the job.
  @_s.JsonKey(name: 'networkInterfaces')
  final List<NetworkInterface> networkInterfaces;

  /// When this parameter is true, the container is given elevated privileges on
  /// the host container instance (similar to the <code>root</code> user).
  @_s.JsonKey(name: 'privileged')
  final bool privileged;

  /// When this parameter is true, the container is given read-only access to its
  /// root file system.
  @_s.JsonKey(name: 'readonlyRootFilesystem')
  final bool readonlyRootFilesystem;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  @_s.JsonKey(name: 'reason')
  final String reason;

  /// The type and amount of a resource to assign to a container. Currently, the
  /// only supported resource is <code>GPU</code>.
  @_s.JsonKey(name: 'resourceRequirements')
  final List<ResourceRequirement> resourceRequirements;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that is associated
  /// with the container job. Each container attempt receives a task ARN when they
  /// reach the <code>STARTING</code> status.
  @_s.JsonKey(name: 'taskArn')
  final String taskArn;

  /// A list of <code>ulimit</code> values to set in the container.
  @_s.JsonKey(name: 'ulimits')
  final List<Ulimit> ulimits;

  /// The user name to use inside the container.
  @_s.JsonKey(name: 'user')
  final String user;

  /// The number of VCPUs allocated for the job.
  @_s.JsonKey(name: 'vcpus')
  final int vcpus;

  /// A list of volumes associated with the job.
  @_s.JsonKey(name: 'volumes')
  final List<Volume> volumes;

  ContainerDetail({
    this.command,
    this.containerInstanceArn,
    this.environment,
    this.exitCode,
    this.image,
    this.instanceType,
    this.jobRoleArn,
    this.linuxParameters,
    this.logStreamName,
    this.memory,
    this.mountPoints,
    this.networkInterfaces,
    this.privileged,
    this.readonlyRootFilesystem,
    this.reason,
    this.resourceRequirements,
    this.taskArn,
    this.ulimits,
    this.user,
    this.vcpus,
    this.volumes,
  });
  factory ContainerDetail.fromJson(Map<String, dynamic> json) =>
      _$ContainerDetailFromJson(json);
}

/// The overrides that should be sent to a container.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ContainerOverrides {
  /// The command to send to the container that overrides the default command from
  /// the Docker image or the job definition.
  @_s.JsonKey(name: 'command')
  final List<String> command;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or the
  /// job definition.
  /// <note>
  /// Environment variables must not start with <code>AWS_BATCH</code>; this
  /// naming convention is reserved for variables that are set by the AWS Batch
  /// service.
  /// </note>
  @_s.JsonKey(name: 'environment')
  final List<KeyValuePair> environment;

  /// The instance type to use for a multi-node parallel job. This parameter is
  /// not valid for single-node container jobs.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The number of MiB of memory reserved for the job. This value overrides the
  /// value set in the job definition.
  @_s.JsonKey(name: 'memory')
  final int memory;

  /// The type and amount of a resource to assign to a container. This value
  /// overrides the value set in the job definition. Currently, the only supported
  /// resource is <code>GPU</code>.
  @_s.JsonKey(name: 'resourceRequirements')
  final List<ResourceRequirement> resourceRequirements;

  /// The number of vCPUs to reserve for the container. This value overrides the
  /// value set in the job definition.
  @_s.JsonKey(name: 'vcpus')
  final int vcpus;

  ContainerOverrides({
    this.command,
    this.environment,
    this.instanceType,
    this.memory,
    this.resourceRequirements,
    this.vcpus,
  });
  Map<String, dynamic> toJson() => _$ContainerOverridesToJson(this);
}

/// Container properties are used in job definitions to describe the container
/// that is launched as part of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerProperties {
  /// The command that is passed to the container. This parameter maps to
  /// <code>Cmd</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>COMMAND</code> parameter to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. For
  /// more information, see <a
  /// href="https://docs.docker.com/engine/reference/builder/#cmd">https://docs.docker.com/engine/reference/builder/#cmd</a>.
  @_s.JsonKey(name: 'command')
  final List<String> command;

  /// The environment variables to pass to a container. This parameter maps to
  /// <code>Env</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--env</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  /// <important>
  /// We do not recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  /// </important> <note>
  /// Environment variables must not start with <code>AWS_BATCH</code>; this
  /// naming convention is reserved for variables that are set by the AWS Batch
  /// service.
  /// </note>
  @_s.JsonKey(name: 'environment')
  final List<KeyValuePair> environment;

  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. Images in the Docker Hub registry are available by default.
  /// Other repositories are specified with <code>
  /// <i>repository-url</i>/<i>image</i>:<i>tag</i> </code>. Up to 255 letters
  /// (uppercase and lowercase), numbers, hyphens, underscores, colons, periods,
  /// forward slashes, and number signs are allowed. This parameter maps to
  /// <code>Image</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>IMAGE</code> parameter of <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  ///
  /// <ul>
  /// <li>
  /// Images in Amazon ECR repositories use the full registry and repository URI
  /// (for example,
  /// <code>012345678910.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;</code>).
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
  @_s.JsonKey(name: 'image')
  final String image;

  /// The instance type to use for a multi-node parallel job. Currently all node
  /// groups in a multi-node parallel job must use the same instance type. This
  /// parameter is not valid for single-node container jobs.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The Amazon Resource Name (ARN) of the IAM role that the container can assume
  /// for AWS permissions.
  @_s.JsonKey(name: 'jobRoleArn')
  final String jobRoleArn;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  @_s.JsonKey(name: 'linuxParameters')
  final LinuxParameters linuxParameters;

  /// The hard limit (in MiB) of memory to present to the container. If your
  /// container attempts to exceed the memory specified here, the container is
  /// killed. This parameter maps to <code>Memory</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--memory</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. You
  /// must specify at least 4 MiB of memory for a job.
  /// <note>
  /// If you are trying to maximize your resource utilization by providing your
  /// jobs as much memory as possible for a particular instance type, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html">Memory
  /// Management</a> in the <i>AWS Batch User Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'memory')
  final int memory;

  /// The mount points for data volumes in your container. This parameter maps to
  /// <code>Volumes</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--volume</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  @_s.JsonKey(name: 'mountPoints')
  final List<MountPoint> mountPoints;

  /// When this parameter is true, the container is given elevated privileges on
  /// the host container instance (similar to the <code>root</code> user). This
  /// parameter maps to <code>Privileged</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--privileged</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  @_s.JsonKey(name: 'privileged')
  final bool privileged;

  /// When this parameter is true, the container is given read-only access to its
  /// root file system. This parameter maps to <code>ReadonlyRootfs</code> in the
  /// <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--read-only</code> option to <code>docker run</code>.
  @_s.JsonKey(name: 'readonlyRootFilesystem')
  final bool readonlyRootFilesystem;

  /// The type and amount of a resource to assign to a container. Currently, the
  /// only supported resource is <code>GPU</code>.
  @_s.JsonKey(name: 'resourceRequirements')
  final List<ResourceRequirement> resourceRequirements;

  /// A list of <code>ulimits</code> to set in the container. This parameter maps
  /// to <code>Ulimits</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--ulimit</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  @_s.JsonKey(name: 'ulimits')
  final List<Ulimit> ulimits;

  /// The user name to use inside the container. This parameter maps to
  /// <code>User</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--user</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  @_s.JsonKey(name: 'user')
  final String user;

  /// The number of vCPUs reserved for the container. This parameter maps to
  /// <code>CpuShares</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--cpu-shares</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>. Each
  /// vCPU is equivalent to 1,024 CPU shares. You must specify at least one vCPU.
  @_s.JsonKey(name: 'vcpus')
  final int vcpus;

  /// A list of data volumes used in a job.
  @_s.JsonKey(name: 'volumes')
  final List<Volume> volumes;

  ContainerProperties({
    this.command,
    this.environment,
    this.image,
    this.instanceType,
    this.jobRoleArn,
    this.linuxParameters,
    this.memory,
    this.mountPoints,
    this.privileged,
    this.readonlyRootFilesystem,
    this.resourceRequirements,
    this.ulimits,
    this.user,
    this.vcpus,
    this.volumes,
  });
  factory ContainerProperties.fromJson(Map<String, dynamic> json) =>
      _$ContainerPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPropertiesToJson(this);
}

/// An object representing summary details of a container within a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerSummary {
  /// The exit code to return upon completion.
  @_s.JsonKey(name: 'exitCode')
  final int exitCode;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  @_s.JsonKey(name: 'reason')
  final String reason;

  ContainerSummary({
    this.exitCode,
    this.reason,
  });
  factory ContainerSummary.fromJson(Map<String, dynamic> json) =>
      _$ContainerSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateComputeEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentArn')
  final String computeEnvironmentArn;

  /// The name of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentName')
  final String computeEnvironmentName;

  CreateComputeEnvironmentResponse({
    this.computeEnvironmentArn,
    this.computeEnvironmentName,
  });
  factory CreateComputeEnvironmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateComputeEnvironmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobQueueResponse {
  /// The Amazon Resource Name (ARN) of the job queue.
  @_s.JsonKey(name: 'jobQueueArn')
  final String jobQueueArn;

  /// The name of the job queue.
  @_s.JsonKey(name: 'jobQueueName')
  final String jobQueueName;

  CreateJobQueueResponse({
    @_s.required this.jobQueueArn,
    @_s.required this.jobQueueName,
  });
  factory CreateJobQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobQueueResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteComputeEnvironmentResponse {
  DeleteComputeEnvironmentResponse();
  factory DeleteComputeEnvironmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteComputeEnvironmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJobQueueResponse {
  DeleteJobQueueResponse();
  factory DeleteJobQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobQueueResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterJobDefinitionResponse {
  DeregisterJobDefinitionResponse();
  factory DeregisterJobDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterJobDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComputeEnvironmentsResponse {
  /// The list of compute environments.
  @_s.JsonKey(name: 'computeEnvironments')
  final List<ComputeEnvironmentDetail> computeEnvironments;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeComputeEnvironments</code> request. When the results of a
  /// <code>DescribeJobDefinitions</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeComputeEnvironmentsResponse({
    this.computeEnvironments,
    this.nextToken,
  });
  factory DescribeComputeEnvironmentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeComputeEnvironmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobDefinitionsResponse {
  /// The list of job definitions.
  @_s.JsonKey(name: 'jobDefinitions')
  final List<JobDefinition> jobDefinitions;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeJobDefinitions</code> request. When the results of a
  /// <code>DescribeJobDefinitions</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeJobDefinitionsResponse({
    this.jobDefinitions,
    this.nextToken,
  });
  factory DescribeJobDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobQueuesResponse {
  /// The list of job queues.
  @_s.JsonKey(name: 'jobQueues')
  final List<JobQueueDetail> jobQueues;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeJobQueues</code> request. When the results of a
  /// <code>DescribeJobQueues</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeJobQueuesResponse({
    this.jobQueues,
    this.nextToken,
  });
  factory DescribeJobQueuesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobQueuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobsResponse {
  /// The list of jobs.
  @_s.JsonKey(name: 'jobs')
  final List<JobDetail> jobs;

  DescribeJobsResponse({
    this.jobs,
  });
  factory DescribeJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobsResponseFromJson(json);
}

/// An object representing a container instance host device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Device {
  /// The path for the device on the host container instance.
  @_s.JsonKey(name: 'hostPath')
  final String hostPath;

  /// The path inside the container at which to expose the host device. By default
  /// the <code>hostPath</code> value is used.
  @_s.JsonKey(name: 'containerPath')
  final String containerPath;

  /// The explicit permissions to provide to the container for the device. By
  /// default, the container has permissions for <code>read</code>,
  /// <code>write</code>, and <code>mknod</code> for the device.
  @_s.JsonKey(name: 'permissions')
  final List<String> permissions;

  Device({
    @_s.required this.hostPath,
    this.containerPath,
    this.permissions,
  });
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

enum DeviceCgroupPermission {
  @_s.JsonValue('READ')
  read,
  @_s.JsonValue('WRITE')
  write,
  @_s.JsonValue('MKNOD')
  mknod,
}

/// Determine whether your data volume persists on the host container instance
/// and where it is stored. If this parameter is empty, then the Docker daemon
/// assigns a host path for your data volume, but the data is not guaranteed to
/// persist after the containers associated with it stop running.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Host {
  /// The path on the host container instance that is presented to the container.
  /// If this parameter is empty, then the Docker daemon has assigned a host path
  /// for you. If this parameter contains a file location, then the data volume
  /// persists at the specified location on the host container instance until you
  /// delete it manually. If the source path location does not exist on the host
  /// container instance, the Docker daemon creates it. If the location does
  /// exist, the contents of the source path folder are exported.
  @_s.JsonKey(name: 'sourcePath')
  final String sourcePath;

  Host({
    this.sourcePath,
  });
  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);

  Map<String, dynamic> toJson() => _$HostToJson(this);
}

enum JQState {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on JQState {
  String toValue() {
    switch (this) {
      case JQState.enabled:
        return 'ENABLED';
      case JQState.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum JQStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('VALID')
  valid,
  @_s.JsonValue('INVALID')
  invalid,
}

/// An object representing an AWS Batch job definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobDefinition {
  /// The Amazon Resource Name (ARN) for the job definition.
  @_s.JsonKey(name: 'jobDefinitionArn')
  final String jobDefinitionArn;

  /// The name of the job definition.
  @_s.JsonKey(name: 'jobDefinitionName')
  final String jobDefinitionName;

  /// The revision of the job definition.
  @_s.JsonKey(name: 'revision')
  final int revision;

  /// The type of job definition.
  @_s.JsonKey(name: 'type')
  final String type;

  /// An object with various properties specific to container-based jobs.
  @_s.JsonKey(name: 'containerProperties')
  final ContainerProperties containerProperties;

  /// An object with various properties specific to multi-node parallel jobs.
  @_s.JsonKey(name: 'nodeProperties')
  final NodeProperties nodeProperties;

  /// Default parameters or parameter substitution placeholders that are set in
  /// the job definition. Parameters are specified as a key-value pair mapping.
  /// Parameters in a <code>SubmitJob</code> request override any corresponding
  /// parameter defaults from the job definition. For more information about
  /// specifying parameters, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/job_definition_parameters.html">Job
  /// Definition Parameters</a> in the <i>AWS Batch User Guide</i>.
  @_s.JsonKey(name: 'parameters')
  final Map<String, String> parameters;

  /// The retry strategy to use for failed jobs that are submitted with this job
  /// definition.
  @_s.JsonKey(name: 'retryStrategy')
  final RetryStrategy retryStrategy;

  /// The status of the job definition.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The timeout configuration for jobs that are submitted with this job
  /// definition. You can specify a timeout duration after which AWS Batch
  /// terminates your jobs if they have not finished.
  @_s.JsonKey(name: 'timeout')
  final JobTimeout timeout;

  JobDefinition({
    @_s.required this.jobDefinitionArn,
    @_s.required this.jobDefinitionName,
    @_s.required this.revision,
    @_s.required this.type,
    this.containerProperties,
    this.nodeProperties,
    this.parameters,
    this.retryStrategy,
    this.status,
    this.timeout,
  });
  factory JobDefinition.fromJson(Map<String, dynamic> json) =>
      _$JobDefinitionFromJson(json);
}

enum JobDefinitionType {
  @_s.JsonValue('container')
  container,
  @_s.JsonValue('multinode')
  multinode,
}

extension on JobDefinitionType {
  String toValue() {
    switch (this) {
      case JobDefinitionType.container:
        return 'container';
      case JobDefinitionType.multinode:
        return 'multinode';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object representing an AWS Batch job dependency.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobDependency {
  /// The job ID of the AWS Batch job associated with this dependency.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The type of the job dependency.
  @_s.JsonKey(name: 'type')
  final ArrayJobDependency type;

  JobDependency({
    this.jobId,
    this.type,
  });
  factory JobDependency.fromJson(Map<String, dynamic> json) =>
      _$JobDependencyFromJson(json);

  Map<String, dynamic> toJson() => _$JobDependencyToJson(this);
}

/// An object representing an AWS Batch job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobDetail {
  /// The job definition that is used by this job.
  @_s.JsonKey(name: 'jobDefinition')
  final String jobDefinition;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The Amazon Resource Name (ARN) of the job queue with which the job is
  /// associated.
  @_s.JsonKey(name: 'jobQueue')
  final String jobQueue;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// started (when the job transitioned from the <code>STARTING</code> state to
  /// the <code>RUNNING</code> state).
  @_s.JsonKey(name: 'startedAt')
  final int startedAt;

  /// The current status for the job.
  /// <note>
  /// If your jobs do not progress to <code>STARTING</code>, see <a
  /// href="https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#job_stuck_in_runnable">Jobs
  /// Stuck in RUNNABLE Status</a> in the troubleshooting section of the <i>AWS
  /// Batch User Guide</i>.
  /// </note>
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// The array properties of the job, if it is an array job.
  @_s.JsonKey(name: 'arrayProperties')
  final ArrayPropertiesDetail arrayProperties;

  /// A list of job attempts associated with this job.
  @_s.JsonKey(name: 'attempts')
  final List<AttemptDetail> attempts;

  /// An object representing the details of the container that is associated with
  /// the job.
  @_s.JsonKey(name: 'container')
  final ContainerDetail container;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// created. For non-array jobs and parent array jobs, this is when the job
  /// entered the <code>SUBMITTED</code> state (at the time <a>SubmitJob</a> was
  /// called). For array child jobs, this is when the child job was spawned by its
  /// parent and entered the <code>PENDING</code> state.
  @_s.JsonKey(name: 'createdAt')
  final int createdAt;

  /// A list of job IDs on which this job depends.
  @_s.JsonKey(name: 'dependsOn')
  final List<JobDependency> dependsOn;

  /// An object representing the details of a node that is associated with a
  /// multi-node parallel job.
  @_s.JsonKey(name: 'nodeDetails')
  final NodeDetails nodeDetails;

  /// An object representing the node properties of a multi-node parallel job.
  @_s.JsonKey(name: 'nodeProperties')
  final NodeProperties nodeProperties;

  /// Additional parameters passed to the job that replace parameter substitution
  /// placeholders or override any corresponding parameter defaults from the job
  /// definition.
  @_s.JsonKey(name: 'parameters')
  final Map<String, String> parameters;

  /// The retry strategy to use for this job if an attempt fails.
  @_s.JsonKey(name: 'retryStrategy')
  final RetryStrategy retryStrategy;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// stopped (when the job transitioned from the <code>RUNNING</code> state to a
  /// terminal state, such as <code>SUCCEEDED</code> or <code>FAILED</code>).
  @_s.JsonKey(name: 'stoppedAt')
  final int stoppedAt;

  /// The timeout configuration for the job.
  @_s.JsonKey(name: 'timeout')
  final JobTimeout timeout;

  JobDetail({
    @_s.required this.jobDefinition,
    @_s.required this.jobId,
    @_s.required this.jobName,
    @_s.required this.jobQueue,
    @_s.required this.startedAt,
    @_s.required this.status,
    this.arrayProperties,
    this.attempts,
    this.container,
    this.createdAt,
    this.dependsOn,
    this.nodeDetails,
    this.nodeProperties,
    this.parameters,
    this.retryStrategy,
    this.statusReason,
    this.stoppedAt,
    this.timeout,
  });
  factory JobDetail.fromJson(Map<String, dynamic> json) =>
      _$JobDetailFromJson(json);
}

/// An object representing the details of an AWS Batch job queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobQueueDetail {
  /// The compute environments that are attached to the job queue and the order in
  /// which job placement is preferred. Compute environments are selected for job
  /// placement in ascending order.
  @_s.JsonKey(name: 'computeEnvironmentOrder')
  final List<ComputeEnvironmentOrder> computeEnvironmentOrder;

  /// The Amazon Resource Name (ARN) of the job queue.
  @_s.JsonKey(name: 'jobQueueArn')
  final String jobQueueArn;

  /// The name of the job queue.
  @_s.JsonKey(name: 'jobQueueName')
  final String jobQueueName;

  /// The priority of the job queue.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// Describes the ability of the queue to accept new jobs.
  @_s.JsonKey(name: 'state')
  final JQState state;

  /// The status of the job queue (for example, <code>CREATING</code> or
  /// <code>VALID</code>).
  @_s.JsonKey(name: 'status')
  final JQStatus status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job queue.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  JobQueueDetail({
    @_s.required this.computeEnvironmentOrder,
    @_s.required this.jobQueueArn,
    @_s.required this.jobQueueName,
    @_s.required this.priority,
    @_s.required this.state,
    this.status,
    this.statusReason,
  });
  factory JobQueueDetail.fromJson(Map<String, dynamic> json) =>
      _$JobQueueDetailFromJson(json);
}

enum JobStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNABLE')
  runnable,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

extension on JobStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An object representing summary details of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobSummary {
  /// The ID of the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The array properties of the job, if it is an array job.
  @_s.JsonKey(name: 'arrayProperties')
  final ArrayPropertiesSummary arrayProperties;

  /// An object representing the details of the container that is associated with
  /// the job.
  @_s.JsonKey(name: 'container')
  final ContainerSummary container;

  /// The Unix timestamp for when the job was created. For non-array jobs and
  /// parent array jobs, this is when the job entered the <code>SUBMITTED</code>
  /// state (at the time <a>SubmitJob</a> was called). For array child jobs, this
  /// is when the child job was spawned by its parent and entered the
  /// <code>PENDING</code> state.
  @_s.JsonKey(name: 'createdAt')
  final int createdAt;

  /// The node properties for a single node in a job summary list.
  @_s.JsonKey(name: 'nodeProperties')
  final NodePropertiesSummary nodeProperties;

  /// The Unix timestamp for when the job was started (when the job transitioned
  /// from the <code>STARTING</code> state to the <code>RUNNING</code> state).
  @_s.JsonKey(name: 'startedAt')
  final int startedAt;

  /// The current status for the job.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// The Unix timestamp for when the job was stopped (when the job transitioned
  /// from the <code>RUNNING</code> state to a terminal state, such as
  /// <code>SUCCEEDED</code> or <code>FAILED</code>).
  @_s.JsonKey(name: 'stoppedAt')
  final int stoppedAt;

  JobSummary({
    @_s.required this.jobId,
    @_s.required this.jobName,
    this.arrayProperties,
    this.container,
    this.createdAt,
    this.nodeProperties,
    this.startedAt,
    this.status,
    this.statusReason,
    this.stoppedAt,
  });
  factory JobSummary.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryFromJson(json);
}

/// An object representing a job timeout configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobTimeout {
  /// The time duration in seconds (measured from the job attempt's
  /// <code>startedAt</code> timestamp) after which AWS Batch terminates your jobs
  /// if they have not finished.
  @_s.JsonKey(name: 'attemptDurationSeconds')
  final int attemptDurationSeconds;

  JobTimeout({
    this.attemptDurationSeconds,
  });
  factory JobTimeout.fromJson(Map<String, dynamic> json) =>
      _$JobTimeoutFromJson(json);

  Map<String, dynamic> toJson() => _$JobTimeoutToJson(this);
}

/// A key-value pair object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeyValuePair {
  /// The name of the key-value pair. For environment variables, this is the name
  /// of the environment variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value of the key-value pair. For environment variables, this is the
  /// value of the environment variable.
  @_s.JsonKey(name: 'value')
  final String value;

  KeyValuePair({
    this.name,
    this.value,
  });
  factory KeyValuePair.fromJson(Map<String, dynamic> json) =>
      _$KeyValuePairFromJson(json);

  Map<String, dynamic> toJson() => _$KeyValuePairToJson(this);
}

/// An object representing a launch template associated with a compute resource.
/// You must specify either the launch template ID or launch template name in
/// the request, but not both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  @_s.JsonKey(name: 'launchTemplateId')
  final String launchTemplateId;

  /// The name of the launch template.
  @_s.JsonKey(name: 'launchTemplateName')
  final String launchTemplateName;

  /// The version number of the launch template.
  ///
  /// Default: The default version of the launch template.
  @_s.JsonKey(name: 'version')
  final String version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });
  factory LaunchTemplateSpecification.fromJson(Map<String, dynamic> json) =>
      _$LaunchTemplateSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchTemplateSpecificationToJson(this);
}

/// Linux-specific modifications that are applied to the container, such as
/// details for device mappings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LinuxParameters {
  /// Any host devices to expose to the container. This parameter maps to
  /// <code>Devices</code> in the <a
  /// href="https://docs.docker.com/engine/api/v1.23/#create-a-container">Create a
  /// container</a> section of the <a
  /// href="https://docs.docker.com/engine/api/v1.23/">Docker Remote API</a> and
  /// the <code>--device</code> option to <a
  /// href="https://docs.docker.com/engine/reference/run/">docker run</a>.
  @_s.JsonKey(name: 'devices')
  final List<Device> devices;

  LinuxParameters({
    this.devices,
  });
  factory LinuxParameters.fromJson(Map<String, dynamic> json) =>
      _$LinuxParametersFromJson(json);

  Map<String, dynamic> toJson() => _$LinuxParametersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// A list of job summaries that match the request.
  @_s.JsonKey(name: 'jobSummaryList')
  final List<JobSummary> jobSummaryList;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListJobs</code> request. When the results of a <code>ListJobs</code>
  /// request exceed <code>maxResults</code>, this value can be used to retrieve
  /// the next page of results. This value is <code>null</code> when there are no
  /// more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResponse({
    @_s.required this.jobSummaryList,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

/// Details on a Docker volume mount point that is used in a job's container
/// properties. This parameter maps to <code>Volumes</code> in the <a
/// href="https://docs.docker.com/engine/reference/api/docker_remote_api_v1.19/#create-a-container">Create
/// a container</a> section of the Docker Remote API and the
/// <code>--volume</code> option to docker run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MountPoint {
  /// The path on the container at which to mount the host volume.
  @_s.JsonKey(name: 'containerPath')
  final String containerPath;

  /// If this value is <code>true</code>, the container has read-only access to
  /// the volume; otherwise, the container can write to the volume. The default
  /// value is <code>false</code>.
  @_s.JsonKey(name: 'readOnly')
  final bool readOnly;

  /// The name of the volume to mount.
  @_s.JsonKey(name: 'sourceVolume')
  final String sourceVolume;

  MountPoint({
    this.containerPath,
    this.readOnly,
    this.sourceVolume,
  });
  factory MountPoint.fromJson(Map<String, dynamic> json) =>
      _$MountPointFromJson(json);

  Map<String, dynamic> toJson() => _$MountPointToJson(this);
}

/// An object representing the elastic network interface for a multi-node
/// parallel job node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// The attachment ID for the network interface.
  @_s.JsonKey(name: 'attachmentId')
  final String attachmentId;

  /// The private IPv6 address for the network interface.
  @_s.JsonKey(name: 'ipv6Address')
  final String ipv6Address;

  /// The private IPv4 address for the network interface.
  @_s.JsonKey(name: 'privateIpv4Address')
  final String privateIpv4Address;

  NetworkInterface({
    this.attachmentId,
    this.ipv6Address,
    this.privateIpv4Address,
  });
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

/// An object representing the details of a multi-node parallel job node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeDetails {
  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  @_s.JsonKey(name: 'isMainNode')
  final bool isMainNode;

  /// The node index for the node. Node index numbering begins at zero. This index
  /// is also available on the node with the <code>AWS_BATCH_JOB_NODE_INDEX</code>
  /// environment variable.
  @_s.JsonKey(name: 'nodeIndex')
  final int nodeIndex;

  NodeDetails({
    this.isMainNode,
    this.nodeIndex,
  });
  factory NodeDetails.fromJson(Map<String, dynamic> json) =>
      _$NodeDetailsFromJson(json);
}

/// Object representing any node overrides to a job definition that is used in a
/// <a>SubmitJob</a> API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NodeOverrides {
  /// The node property overrides for the job.
  @_s.JsonKey(name: 'nodePropertyOverrides')
  final List<NodePropertyOverride> nodePropertyOverrides;

  /// The number of nodes to use with a multi-node parallel job. This value
  /// overrides the number of nodes that are specified in the job definition. To
  /// use this override:
  ///
  /// <ul>
  /// <li>
  /// There must be at least one node range in your job definition that has an
  /// open upper boundary (such as <code>:</code> or <code>n:</code>).
  /// </li>
  /// <li>
  /// The lower boundary of the node range specified in the job definition must be
  /// fewer than the number of nodes specified in the override.
  /// </li>
  /// <li>
  /// The main node index specified in the job definition must be fewer than the
  /// number of nodes specified in the override.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'numNodes')
  final int numNodes;

  NodeOverrides({
    this.nodePropertyOverrides,
    this.numNodes,
  });
  Map<String, dynamic> toJson() => _$NodeOverridesToJson(this);
}

/// An object representing the node properties of a multi-node parallel job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodeProperties {
  /// Specifies the node index for the main node of a multi-node parallel job.
  /// This node index value must be fewer than the number of nodes.
  @_s.JsonKey(name: 'mainNode')
  final int mainNode;

  /// A list of node ranges and their properties associated with a multi-node
  /// parallel job.
  @_s.JsonKey(name: 'nodeRangeProperties')
  final List<NodeRangeProperty> nodeRangeProperties;

  /// The number of nodes associated with a multi-node parallel job.
  @_s.JsonKey(name: 'numNodes')
  final int numNodes;

  NodeProperties({
    @_s.required this.mainNode,
    @_s.required this.nodeRangeProperties,
    @_s.required this.numNodes,
  });
  factory NodeProperties.fromJson(Map<String, dynamic> json) =>
      _$NodePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$NodePropertiesToJson(this);
}

/// An object representing the properties of a node that is associated with a
/// multi-node parallel job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodePropertiesSummary {
  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  @_s.JsonKey(name: 'isMainNode')
  final bool isMainNode;

  /// The node index for the node. Node index numbering begins at zero. This index
  /// is also available on the node with the <code>AWS_BATCH_JOB_NODE_INDEX</code>
  /// environment variable.
  @_s.JsonKey(name: 'nodeIndex')
  final int nodeIndex;

  /// The number of nodes associated with a multi-node parallel job.
  @_s.JsonKey(name: 'numNodes')
  final int numNodes;

  NodePropertiesSummary({
    this.isMainNode,
    this.nodeIndex,
    this.numNodes,
  });
  factory NodePropertiesSummary.fromJson(Map<String, dynamic> json) =>
      _$NodePropertiesSummaryFromJson(json);
}

/// Object representing any node overrides to a job definition that is used in a
/// <a>SubmitJob</a> API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NodePropertyOverride {
  /// The range of nodes, using node index values, with which to override. A range
  /// of <code>0:3</code> indicates nodes with index values of <code>0</code>
  /// through <code>3</code>. If the starting range value is omitted
  /// (<code>:n</code>), then <code>0</code> is used to start the range. If the
  /// ending range value is omitted (<code>n:</code>), then the highest possible
  /// node index is used to end the range.
  @_s.JsonKey(name: 'targetNodes')
  final String targetNodes;

  /// The overrides that should be sent to a node range.
  @_s.JsonKey(name: 'containerOverrides')
  final ContainerOverrides containerOverrides;

  NodePropertyOverride({
    @_s.required this.targetNodes,
    this.containerOverrides,
  });
  Map<String, dynamic> toJson() => _$NodePropertyOverrideToJson(this);
}

/// An object representing the properties of the node range for a multi-node
/// parallel job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodeRangeProperty {
  /// The range of nodes, using node index values. A range of <code>0:3</code>
  /// indicates nodes with index values of <code>0</code> through <code>3</code>.
  /// If the starting range value is omitted (<code>:n</code>), then
  /// <code>0</code> is used to start the range. If the ending range value is
  /// omitted (<code>n:</code>), then the highest possible node index is used to
  /// end the range. Your accumulative node ranges must account for all nodes
  /// (0:n). You may nest node ranges, for example 0:10 and 4:5, in which case the
  /// 4:5 range properties override the 0:10 properties.
  @_s.JsonKey(name: 'targetNodes')
  final String targetNodes;

  /// The container details for the node range.
  @_s.JsonKey(name: 'container')
  final ContainerProperties container;

  NodeRangeProperty({
    @_s.required this.targetNodes,
    this.container,
  });
  factory NodeRangeProperty.fromJson(Map<String, dynamic> json) =>
      _$NodeRangePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$NodeRangePropertyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterJobDefinitionResponse {
  /// The Amazon Resource Name (ARN) of the job definition.
  @_s.JsonKey(name: 'jobDefinitionArn')
  final String jobDefinitionArn;

  /// The name of the job definition.
  @_s.JsonKey(name: 'jobDefinitionName')
  final String jobDefinitionName;

  /// The revision of the job definition.
  @_s.JsonKey(name: 'revision')
  final int revision;

  RegisterJobDefinitionResponse({
    @_s.required this.jobDefinitionArn,
    @_s.required this.jobDefinitionName,
    @_s.required this.revision,
  });
  factory RegisterJobDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterJobDefinitionResponseFromJson(json);
}

/// The type and amount of a resource to assign to a container. Currently, the
/// only supported resource type is <code>GPU</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceRequirement {
  /// The type of resource to assign to a container. Currently, the only supported
  /// resource type is <code>GPU</code>.
  @_s.JsonKey(name: 'type')
  final ResourceType type;

  /// The number of physical GPUs to reserve for the container. The number of GPUs
  /// reserved for all containers in a job should not exceed the number of
  /// available GPUs on the compute resource that the job is launched on.
  @_s.JsonKey(name: 'value')
  final String value;

  ResourceRequirement({
    @_s.required this.type,
    @_s.required this.value,
  });
  factory ResourceRequirement.fromJson(Map<String, dynamic> json) =>
      _$ResourceRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceRequirementToJson(this);
}

enum ResourceType {
  @_s.JsonValue('GPU')
  gpu,
}

/// The retry strategy associated with a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RetryStrategy {
  /// The number of times to move a job to the <code>RUNNABLE</code> status. You
  /// may specify between 1 and 10 attempts. If the value of <code>attempts</code>
  /// is greater than one, the job is retried on failure the same number of
  /// attempts as the value.
  @_s.JsonKey(name: 'attempts')
  final int attempts;

  RetryStrategy({
    this.attempts,
  });
  factory RetryStrategy.fromJson(Map<String, dynamic> json) =>
      _$RetryStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$RetryStrategyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubmitJobResponse {
  /// The unique identifier for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  SubmitJobResponse({
    @_s.required this.jobId,
    @_s.required this.jobName,
  });
  factory SubmitJobResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateJobResponse {
  TerminateJobResponse();
  factory TerminateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$TerminateJobResponseFromJson(json);
}

/// The <code>ulimit</code> settings to pass to the container.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ulimit {
  /// The hard limit for the <code>ulimit</code> type.
  @_s.JsonKey(name: 'hardLimit')
  final int hardLimit;

  /// The <code>type</code> of the <code>ulimit</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The soft limit for the <code>ulimit</code> type.
  @_s.JsonKey(name: 'softLimit')
  final int softLimit;

  Ulimit({
    @_s.required this.hardLimit,
    @_s.required this.name,
    @_s.required this.softLimit,
  });
  factory Ulimit.fromJson(Map<String, dynamic> json) => _$UlimitFromJson(json);

  Map<String, dynamic> toJson() => _$UlimitToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateComputeEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentArn')
  final String computeEnvironmentArn;

  /// The name of the compute environment.
  @_s.JsonKey(name: 'computeEnvironmentName')
  final String computeEnvironmentName;

  UpdateComputeEnvironmentResponse({
    this.computeEnvironmentArn,
    this.computeEnvironmentName,
  });
  factory UpdateComputeEnvironmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateComputeEnvironmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobQueueResponse {
  /// The Amazon Resource Name (ARN) of the job queue.
  @_s.JsonKey(name: 'jobQueueArn')
  final String jobQueueArn;

  /// The name of the job queue.
  @_s.JsonKey(name: 'jobQueueName')
  final String jobQueueName;

  UpdateJobQueueResponse({
    this.jobQueueArn,
    this.jobQueueName,
  });
  factory UpdateJobQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobQueueResponseFromJson(json);
}

/// A data volume used in a job's container properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Volume {
  /// The contents of the <code>host</code> parameter determine whether your data
  /// volume persists on the host container instance and where it is stored. If
  /// the host parameter is empty, then the Docker daemon assigns a host path for
  /// your data volume. However, the data is not guaranteed to persist after the
  /// containers associated with it stop running.
  @_s.JsonKey(name: 'host')
  final Host host;

  /// The name of the volume. Up to 255 letters (uppercase and lowercase),
  /// numbers, hyphens, and underscores are allowed. This name is referenced in
  /// the <code>sourceVolume</code> parameter of container definition
  /// <code>mountPoints</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  Volume({
    this.host,
    this.name,
  });
  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String type, String message})
      : super(type: type, code: 'ClientException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String type, String message})
      : super(type: type, code: 'ServerException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
};
