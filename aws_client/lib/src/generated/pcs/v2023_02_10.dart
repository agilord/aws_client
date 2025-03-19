// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Amazon Web Services Parallel Computing Service (Amazon Web Services PCS) is
/// a managed service that makes it easier for you to run and scale your high
/// performance computing (HPC) workloads, and build scientific and engineering
/// models on Amazon Web Services using Slurm. For more information, see the <a
/// href="https://docs.aws.amazon.com/pcs/latest/userguide">Amazon Web Services
/// Parallel Computing Service User Guide</a>.
///
/// This reference describes the actions and data types of the service
/// management API. You can use the Amazon Web Services SDKs to call the API
/// actions in software, or use the Command Line Interface (CLI) to call the API
/// actions manually. These API actions manage the service through an Amazon Web
/// Services account.
///
/// The API actions operate on Amazon Web Services PCS resources. A
/// <i>resource</i> is an entity in Amazon Web Services that you can work with.
/// Amazon Web Services services create resources when you use the features of
/// the service. Examples of Amazon Web Services PCS resources include clusters,
/// compute node groups, and queues. For more information about resources in
/// Amazon Web Services, see <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/getting-started-terms-and-concepts.html#term-resource">Resource</a>
/// in the <i>Resource Explorer User Guide</i>.
///
/// An Amazon Web Services PCS <i>compute node</i> is an Amazon EC2 instance.
/// You don't launch compute nodes directly. Amazon Web Services PCS uses
/// configuration information that you provide to launch compute nodes in your
/// Amazon Web Services account. You receive billing charges for your running
/// compute nodes. Amazon Web Services PCS automatically terminates your compute
/// nodes when you delete the Amazon Web Services PCS resources related to those
/// compute nodes.
class ParallelComputing {
  final _s.JsonProtocol _protocol;
  ParallelComputing({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pcs',
            signingName: 'pcs',
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

  /// Creates a cluster in your account. Amazon Web Services PCS creates the
  /// cluster controller in a service-owned account. The cluster controller
  /// communicates with the cluster resources in your account. The subnets and
  /// security groups for the cluster must already exist before you use this API
  /// action.
  /// <note>
  /// It takes time for Amazon Web Services PCS to create the cluster. The
  /// cluster is in a <code>Creating</code> state until it is ready to use.
  /// There can only be 1 cluster in a <code>Creating</code> state per Amazon
  /// Web Services Region per Amazon Web Services account.
  /// <code>CreateCluster</code> fails with a
  /// <code>ServiceQuotaExceededException</code> if there is already a cluster
  /// in a <code>Creating</code> state.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterName] :
  /// A name to identify the cluster. Example: <code>MyCluster</code>
  ///
  /// Parameter [networking] :
  /// The networking configuration used to set up the cluster's control plane.
  ///
  /// Parameter [scheduler] :
  /// The cluster management and job scheduling software associated with the
  /// cluster.
  ///
  /// Parameter [size] :
  /// A value that determines the maximum number of compute nodes in the cluster
  /// and the maximum number of jobs (active and queued).
  ///
  /// <ul>
  /// <li>
  /// <code>SMALL</code>: 32 compute nodes and 256 jobs
  /// </li>
  /// <li>
  /// <code>MEDIUM</code>: 512 compute nodes and 8192 jobs
  /// </li>
  /// <li>
  /// <code>LARGE</code>: 2048 compute nodes and 16,384 jobs
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  ///
  /// Parameter [slurmConfiguration] :
  /// Additional options related to the Slurm scheduler.
  ///
  /// Parameter [tags] :
  /// 1 or more tags added to the resource. Each tag consists of a tag key and
  /// tag value. The tag value is optional and can be an empty string.
  Future<CreateClusterResponse> createCluster({
    required String clusterName,
    required NetworkingRequest networking,
    required SchedulerRequest scheduler,
    required Size size,
    String? clientToken,
    ClusterSlurmConfigurationRequest? slurmConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterName': clusterName,
        'networking': networking,
        'scheduler': scheduler,
        'size': size.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a managed set of compute nodes. You associate a compute node group
  /// with a cluster through 1 or more Amazon Web Services PCS queues or as part
  /// of the login fleet. A compute node group includes the definition of the
  /// compute properties and lifecycle management. Amazon Web Services PCS uses
  /// the information you provide to this API action to launch compute nodes in
  /// your account. You can only specify subnets in the same Amazon VPC as your
  /// cluster. You receive billing charges for the compute nodes that Amazon Web
  /// Services PCS launches in your account. You must already have a launch
  /// template before you call this API. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">Launch
  /// an instance from a launch template</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide for Linux Instances</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to create a compute node group in.
  ///
  /// Parameter [computeNodeGroupName] :
  /// A name to identify the cluster. Example: <code>MyCluster</code>
  ///
  /// Parameter [iamInstanceProfileArn] :
  /// The Amazon Resource Name (ARN) of the IAM instance profile used to pass an
  /// IAM role when launching EC2 instances. The role contained in your instance
  /// profile must have <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permissions attached in order to provision instances correctly. The
  /// resource identifier of the ARN must start with <code>AWSPCS</code>. For
  /// example,
  /// <code>arn:aws:iam:123456789012:instance-profile/AWSPCSMyComputeNodeInstanceProfile</code>.
  ///
  /// Parameter [instanceConfigs] :
  /// A list of EC2 instance configurations that Amazon Web Services PCS can
  /// provision in the compute node group.
  ///
  /// Parameter [scalingConfiguration] :
  /// Specifies the boundaries of the compute node group auto scaling.
  ///
  /// Parameter [subnetIds] :
  /// The list of subnet IDs where the compute node group launches instances.
  /// Subnets must be in the same VPC as the cluster.
  ///
  /// Parameter [amiId] :
  /// The ID of the Amazon Machine Image (AMI) that Amazon Web Services PCS uses
  /// to launch compute nodes (Amazon EC2 instances). If you don't provide this
  /// value, Amazon Web Services PCS uses the AMI ID specified in the custom
  /// launch template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  ///
  /// Parameter [purchaseOption] :
  /// Specifies how EC2 instances are purchased on your behalf. Amazon Web
  /// Services PCS supports On-Demand and Spot instances. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Instance
  /// purchasing options</a> in the <i>Amazon Elastic Compute Cloud User
  /// Guide</i>. If you don't provide this option, it defaults to On-Demand.
  ///
  /// Parameter [slurmConfiguration] :
  /// Additional options related to the Slurm scheduler.
  ///
  /// Parameter [tags] :
  /// 1 or more tags added to the resource. Each tag consists of a tag key and
  /// tag value. The tag value is optional and can be an empty string.
  Future<CreateComputeNodeGroupResponse> createComputeNodeGroup({
    required String clusterIdentifier,
    required String computeNodeGroupName,
    required CustomLaunchTemplate customLaunchTemplate,
    required String iamInstanceProfileArn,
    required List<InstanceConfig> instanceConfigs,
    required ScalingConfigurationRequest scalingConfiguration,
    required List<String> subnetIds,
    String? amiId,
    String? clientToken,
    PurchaseOption? purchaseOption,
    ComputeNodeGroupSlurmConfigurationRequest? slurmConfiguration,
    SpotOptions? spotOptions,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.CreateComputeNodeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'computeNodeGroupName': computeNodeGroupName,
        'customLaunchTemplate': customLaunchTemplate,
        'iamInstanceProfileArn': iamInstanceProfileArn,
        'instanceConfigs': instanceConfigs,
        'scalingConfiguration': scalingConfiguration,
        'subnetIds': subnetIds,
        if (amiId != null) 'amiId': amiId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (purchaseOption != null) 'purchaseOption': purchaseOption.value,
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
        if (spotOptions != null) 'spotOptions': spotOptions,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateComputeNodeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job queue. You must associate 1 or more compute node groups with
  /// the queue. You can associate 1 compute node group with multiple queues.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster for which to create a queue.
  ///
  /// Parameter [queueName] :
  /// A name to identify the queue.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  ///
  /// Parameter [computeNodeGroupConfigurations] :
  /// The list of compute node group configurations to associate with the queue.
  /// Queues assign jobs to associated compute node groups.
  ///
  /// Parameter [tags] :
  /// 1 or more tags added to the resource. Each tag consists of a tag key and
  /// tag value. The tag value is optional and can be an empty string.
  Future<CreateQueueResponse> createQueue({
    required String clusterIdentifier,
    required String queueName,
    String? clientToken,
    List<ComputeNodeGroupConfiguration>? computeNodeGroupConfigurations,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.CreateQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'queueName': queueName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (computeNodeGroupConfigurations != null)
          'computeNodeGroupConfigurations': computeNodeGroupConfigurations,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateQueueResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a cluster and all its linked resources. You must delete all queues
  /// and compute node groups associated with the cluster before you can delete
  /// the cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  Future<void> deleteCluster({
    required String clusterIdentifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.DeleteCluster'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Deletes a compute node group. You must delete all queues associated with
  /// the compute node group first.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the compute node group.
  ///
  /// Parameter [computeNodeGroupIdentifier] :
  /// The name or ID of the compute node group to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  Future<void> deleteComputeNodeGroup({
    required String clusterIdentifier,
    required String computeNodeGroupIdentifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.DeleteComputeNodeGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'computeNodeGroupIdentifier': computeNodeGroupIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Deletes a job queue. If the compute node group associated with this queue
  /// isn't associated with any other queues, Amazon Web Services PCS terminates
  /// all the compute nodes for this queue.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the queue.
  ///
  /// Parameter [queueIdentifier] :
  /// The name or ID of the queue to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  Future<void> deleteQueue({
    required String clusterIdentifier,
    required String queueIdentifier,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.DeleteQueue'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'queueIdentifier': queueIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Returns detailed information about a running cluster in your account. This
  /// API action provides networking information, endpoint information for
  /// communication with the scheduler, and provisioning status.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the queue.
  Future<GetClusterResponse> getCluster({
    required String clusterIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.GetCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
      },
    );

    return GetClusterResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about a compute node group. This API action
  /// provides networking information, EC2 instance type, compute node group
  /// status, and scheduler (such as Slurm) configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster.
  ///
  /// Parameter [computeNodeGroupIdentifier] :
  /// The name or ID of the compute node group.
  Future<GetComputeNodeGroupResponse> getComputeNodeGroup({
    required String clusterIdentifier,
    required String computeNodeGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.GetComputeNodeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'computeNodeGroupIdentifier': computeNodeGroupIdentifier,
      },
    );

    return GetComputeNodeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about a queue. The information includes the
  /// compute node groups that the queue uses to schedule jobs.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the queue.
  ///
  /// Parameter [queueIdentifier] :
  /// The name or ID of the queue.
  Future<GetQueueResponse> getQueue({
    required String clusterIdentifier,
    required String queueIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.GetQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'queueIdentifier': queueIdentifier,
      },
    );

    return GetQueueResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of running clusters in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 10 results, and the maximum allowed page size is 100 results. A value of 0
  /// uses the default.
  ///
  /// Parameter [nextToken] :
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// returns an <code>HTTP 400 InvalidToken</code> error.
  Future<ListClustersResponse> listClusters({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.ListClusters'
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

  /// Returns a list of all compute node groups associated with a cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to list compute node groups for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 10 results, and the maximum allowed page size is 100 results. A value of 0
  /// uses the default.
  ///
  /// Parameter [nextToken] :
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// returns an <code>HTTP 400 InvalidToken</code> error.
  Future<ListComputeNodeGroupsResponse> listComputeNodeGroups({
    required String clusterIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.ListComputeNodeGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListComputeNodeGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all queues associated with a cluster.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to list queues for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 10 results, and the maximum allowed page size is 100 results. A value of 0
  /// uses the default.
  ///
  /// Parameter [nextToken] :
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// returns an <code>HTTP 400 InvalidToken</code> error.
  Future<ListQueuesResponse> listQueues({
    required String clusterIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.ListQueues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListQueuesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all tags on an Amazon Web Services PCS resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.ListTagsForResource'
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

  /// <important>
  /// This API action isn't intended for you to use.
  /// </important>
  /// Amazon Web Services PCS uses this API action to register the compute nodes
  /// it launches in your account.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [bootstrapId] :
  /// The client-generated token to allow for retries.
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to register the compute node group instance
  /// in.
  Future<RegisterComputeNodeGroupInstanceResponse>
      registerComputeNodeGroupInstance({
    required String bootstrapId,
    required String clusterIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSParallelComputingService.RegisterComputeNodeGroupInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bootstrapId': bootstrapId,
        'clusterIdentifier': clusterIdentifier,
      },
    );

    return RegisterComputeNodeGroupInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Adds or edits tags on an Amazon Web Services PCS resource. Each tag
  /// consists of a tag key and a tag value. The tag key and tag value are
  /// case-sensitive strings. The tag value can be an empty (null) string. To
  /// add a tag, specify a new tag key and a tag value. To edit a tag, specify
  /// an existing tag key and a new tag value.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// 1 or more tags added to the resource. Each tag consists of a tag key and
  /// tag value. The tag value is optional and can be an empty string.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.TagResource'
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

  /// Deletes tags from an Amazon Web Services PCS resource. To delete a tag,
  /// specify the tag key and the Amazon Resource Name (ARN) of the Amazon Web
  /// Services PCS resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// 1 or more tag keys to remove from the resource. Specify only tag keys and
  /// not tag values.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.UntagResource'
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

  /// Updates a compute node group. You can update many of the fields related to
  /// your compute node group including the configurations for networking,
  /// compute nodes, and settings specific to your scheduler (such as Slurm).
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the compute node group.
  ///
  /// Parameter [computeNodeGroupIdentifier] :
  /// The name or ID of the compute node group.
  ///
  /// Parameter [amiId] :
  /// The ID of the Amazon Machine Image (AMI) that Amazon Web Services PCS uses
  /// to launch instances. If not provided, Amazon Web Services PCS uses the AMI
  /// ID specified in the custom launch template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  ///
  /// Parameter [iamInstanceProfileArn] :
  /// The Amazon Resource Name (ARN) of the IAM instance profile used to pass an
  /// IAM role when launching EC2 instances. The role contained in your instance
  /// profile must have <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permissions attached to provision instances correctly.
  ///
  /// Parameter [purchaseOption] :
  /// Specifies how EC2 instances are purchased on your behalf. Amazon Web
  /// Services PCS supports On-Demand and Spot instances. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Instance
  /// purchasing options</a> in the <i>Amazon Elastic Compute Cloud User
  /// Guide</i>. If you don't provide this option, it defaults to On-Demand.
  ///
  /// Parameter [scalingConfiguration] :
  /// Specifies the boundaries of the compute node group auto scaling.
  ///
  /// Parameter [slurmConfiguration] :
  /// Additional options related to the Slurm scheduler.
  ///
  /// Parameter [subnetIds] :
  /// The list of subnet IDs where the compute node group provisions instances.
  /// The subnets must be in the same VPC as the cluster.
  Future<UpdateComputeNodeGroupResponse> updateComputeNodeGroup({
    required String clusterIdentifier,
    required String computeNodeGroupIdentifier,
    String? amiId,
    String? clientToken,
    CustomLaunchTemplate? customLaunchTemplate,
    String? iamInstanceProfileArn,
    PurchaseOption? purchaseOption,
    ScalingConfigurationRequest? scalingConfiguration,
    UpdateComputeNodeGroupSlurmConfigurationRequest? slurmConfiguration,
    SpotOptions? spotOptions,
    List<String>? subnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.UpdateComputeNodeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'computeNodeGroupIdentifier': computeNodeGroupIdentifier,
        if (amiId != null) 'amiId': amiId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (customLaunchTemplate != null)
          'customLaunchTemplate': customLaunchTemplate,
        if (iamInstanceProfileArn != null)
          'iamInstanceProfileArn': iamInstanceProfileArn,
        if (purchaseOption != null) 'purchaseOption': purchaseOption.value,
        if (scalingConfiguration != null)
          'scalingConfiguration': scalingConfiguration,
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
        if (spotOptions != null) 'spotOptions': spotOptions,
        if (subnetIds != null) 'subnetIds': subnetIds,
      },
    );

    return UpdateComputeNodeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates the compute node group configuration of a queue. Use this API to
  /// change the compute node groups that the queue can send jobs to.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the queue.
  ///
  /// Parameter [queueIdentifier] :
  /// The name or ID of the queue.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect. If you don't specify a client token, the CLI and SDK
  /// automatically generate 1 for you.
  ///
  /// Parameter [computeNodeGroupConfigurations] :
  /// The list of compute node group configurations to associate with the queue.
  /// Queues assign jobs to associated compute node groups.
  Future<UpdateQueueResponse> updateQueue({
    required String clusterIdentifier,
    required String queueIdentifier,
    String? clientToken,
    List<ComputeNodeGroupConfiguration>? computeNodeGroupConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.UpdateQueue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'queueIdentifier': queueIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (computeNodeGroupConfigurations != null)
          'computeNodeGroupConfigurations': computeNodeGroupConfigurations,
      },
    );

    return UpdateQueueResponse.fromJson(jsonResponse.body);
  }
}

/// The cluster resource and configuration.
class Cluster {
  /// The unique Amazon Resource Name (ARN) of the cluster.
  final String arn;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The generated unique ID of the cluster.
  final String id;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the cluster.
  final String name;
  final Networking networking;
  final Scheduler scheduler;

  /// The size of the cluster.
  ///
  /// <ul>
  /// <li>
  /// <code>SMALL</code>: 32 compute nodes and 256 jobs
  /// </li>
  /// <li>
  /// <code>MEDIUM</code>: 512 compute nodes and 8192 jobs
  /// </li>
  /// <li>
  /// <code>LARGE</code>: 2048 compute nodes and 16,384 jobs
  /// </li>
  /// </ul>
  final Size size;

  /// The provisioning status of the cluster.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the cluster.
  /// </note>
  final ClusterStatus status;

  /// The list of endpoints available for interaction with the scheduler.
  final List<Endpoint>? endpoints;

  /// The list of errors that occurred during cluster provisioning.
  final List<ErrorInfo>? errorInfo;

  /// Additional options related to the Slurm scheduler.
  final ClusterSlurmConfiguration? slurmConfiguration;

  Cluster({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.modifiedAt,
    required this.name,
    required this.networking,
    required this.scheduler,
    required this.size,
    required this.status,
    this.endpoints,
    this.errorInfo,
    this.slurmConfiguration,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      networking:
          Networking.fromJson(json['networking'] as Map<String, dynamic>),
      scheduler: Scheduler.fromJson(json['scheduler'] as Map<String, dynamic>),
      size: Size.fromString((json['size'] as String)),
      status: ClusterStatus.fromString((json['status'] as String)),
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorInfo: (json['errorInfo'] as List?)
          ?.nonNulls
          .map((e) => ErrorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      slurmConfiguration: json['slurmConfiguration'] != null
          ? ClusterSlurmConfiguration.fromJson(
              json['slurmConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final networking = this.networking;
    final scheduler = this.scheduler;
    final size = this.size;
    final status = this.status;
    final endpoints = this.endpoints;
    final errorInfo = this.errorInfo;
    final slurmConfiguration = this.slurmConfiguration;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'networking': networking,
      'scheduler': scheduler,
      'size': size.value,
      'status': status.value,
      if (endpoints != null) 'endpoints': endpoints,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (slurmConfiguration != null) 'slurmConfiguration': slurmConfiguration,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class ClusterSlurmConfiguration {
  /// The shared Slurm key for authentication, also known as the <b>cluster
  /// secret</b>.
  final SlurmAuthKey? authKey;

  /// The time before an idle node is scaled down.
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ClusterSlurmConfiguration({
    this.authKey,
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
  });

  factory ClusterSlurmConfiguration.fromJson(Map<String, dynamic> json) {
    return ClusterSlurmConfiguration(
      authKey: json['authKey'] != null
          ? SlurmAuthKey.fromJson(json['authKey'] as Map<String, dynamic>)
          : null,
      scaleDownIdleTimeInSeconds: json['scaleDownIdleTimeInSeconds'] as int?,
      slurmCustomSettings: (json['slurmCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => SlurmCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authKey = this.authKey;
    final scaleDownIdleTimeInSeconds = this.scaleDownIdleTimeInSeconds;
    final slurmCustomSettings = this.slurmCustomSettings;
    return {
      if (authKey != null) 'authKey': authKey,
      if (scaleDownIdleTimeInSeconds != null)
        'scaleDownIdleTimeInSeconds': scaleDownIdleTimeInSeconds,
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class ClusterSlurmConfigurationRequest {
  /// The time before an idle node is scaled down.
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ClusterSlurmConfigurationRequest({
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
  });

  Map<String, dynamic> toJson() {
    final scaleDownIdleTimeInSeconds = this.scaleDownIdleTimeInSeconds;
    final slurmCustomSettings = this.slurmCustomSettings;
    return {
      if (scaleDownIdleTimeInSeconds != null)
        'scaleDownIdleTimeInSeconds': scaleDownIdleTimeInSeconds,
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
    };
  }
}

enum ClusterStatus {
  creating('CREATING'),
  active('ACTIVE'),
  updating('UPDATING'),
  deleting('DELETING'),
  createFailed('CREATE_FAILED'),
  deleteFailed('DELETE_FAILED'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const ClusterStatus(this.value);

  static ClusterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ClusterStatus'));
}

/// The object returned by the <code>ListClusters</code> API action.
class ClusterSummary {
  /// The unique Amazon Resource Name (ARN) of the cluster.
  final String arn;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The generated unique ID of the cluster.
  final String id;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the cluster.
  final String name;

  /// The provisioning status of the cluster.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the cluster.
  /// </note>
  final ClusterStatus status;

  ClusterSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.modifiedAt,
    required this.name,
    required this.status,
  });

  factory ClusterSummary.fromJson(Map<String, dynamic> json) {
    return ClusterSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: ClusterStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.value,
    };
  }
}

/// A compute node group associated with a cluster.
class ComputeNodeGroup {
  /// The unique Amazon Resource Name (ARN) of the compute node group.
  final String arn;

  /// The ID of the cluster of the compute node group.
  final String clusterId;

  /// The date and time the resource was created.
  final DateTime createdAt;
  final CustomLaunchTemplate customLaunchTemplate;

  /// The Amazon Resource Name (ARN) of the IAM instance profile used to pass an
  /// IAM role when launching EC2 instances. The role contained in your instance
  /// profile must have <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permissions attached to provision instances correctly.
  final String iamInstanceProfileArn;

  /// The generated unique ID of the compute node group.
  final String id;

  /// A list of EC2 instance configurations that Amazon Web Services PCS can
  /// provision in the compute node group.
  final List<InstanceConfig> instanceConfigs;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the compute node group.
  final String name;
  final ScalingConfiguration scalingConfiguration;

  /// The provisioning status of the compute node group.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the compute
  /// node group.
  /// </note>
  final ComputeNodeGroupStatus status;

  /// The list of subnet IDs where instances are provisioned by the compute node
  /// group. The subnets must be in the same VPC as the cluster.
  final List<String> subnetIds;

  /// The ID of the Amazon Machine Image (AMI) that Amazon Web Services PCS uses
  /// to launch instances. If not provided, Amazon Web Services PCS uses the AMI
  /// ID specified in the custom launch template.
  final String? amiId;

  /// The list of errors that occurred during compute node group provisioning.
  final List<ErrorInfo>? errorInfo;

  /// Specifies how EC2 instances are purchased on your behalf. Amazon Web
  /// Services PCS supports On-Demand and Spot instances. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Instance
  /// purchasing options</a> in the <i>Amazon Elastic Compute Cloud User
  /// Guide</i>. If you don't provide this option, it defaults to On-Demand.
  final PurchaseOption? purchaseOption;
  final ComputeNodeGroupSlurmConfiguration? slurmConfiguration;
  final SpotOptions? spotOptions;

  ComputeNodeGroup({
    required this.arn,
    required this.clusterId,
    required this.createdAt,
    required this.customLaunchTemplate,
    required this.iamInstanceProfileArn,
    required this.id,
    required this.instanceConfigs,
    required this.modifiedAt,
    required this.name,
    required this.scalingConfiguration,
    required this.status,
    required this.subnetIds,
    this.amiId,
    this.errorInfo,
    this.purchaseOption,
    this.slurmConfiguration,
    this.spotOptions,
  });

  factory ComputeNodeGroup.fromJson(Map<String, dynamic> json) {
    return ComputeNodeGroup(
      arn: json['arn'] as String,
      clusterId: json['clusterId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      customLaunchTemplate: CustomLaunchTemplate.fromJson(
          json['customLaunchTemplate'] as Map<String, dynamic>),
      iamInstanceProfileArn: json['iamInstanceProfileArn'] as String,
      id: json['id'] as String,
      instanceConfigs: (json['instanceConfigs'] as List)
          .nonNulls
          .map((e) => InstanceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      scalingConfiguration: ScalingConfiguration.fromJson(
          json['scalingConfiguration'] as Map<String, dynamic>),
      status: ComputeNodeGroupStatus.fromString((json['status'] as String)),
      subnetIds:
          (json['subnetIds'] as List).nonNulls.map((e) => e as String).toList(),
      amiId: json['amiId'] as String?,
      errorInfo: (json['errorInfo'] as List?)
          ?.nonNulls
          .map((e) => ErrorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      purchaseOption:
          (json['purchaseOption'] as String?)?.let(PurchaseOption.fromString),
      slurmConfiguration: json['slurmConfiguration'] != null
          ? ComputeNodeGroupSlurmConfiguration.fromJson(
              json['slurmConfiguration'] as Map<String, dynamic>)
          : null,
      spotOptions: json['spotOptions'] != null
          ? SpotOptions.fromJson(json['spotOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterId = this.clusterId;
    final createdAt = this.createdAt;
    final customLaunchTemplate = this.customLaunchTemplate;
    final iamInstanceProfileArn = this.iamInstanceProfileArn;
    final id = this.id;
    final instanceConfigs = this.instanceConfigs;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final scalingConfiguration = this.scalingConfiguration;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final amiId = this.amiId;
    final errorInfo = this.errorInfo;
    final purchaseOption = this.purchaseOption;
    final slurmConfiguration = this.slurmConfiguration;
    final spotOptions = this.spotOptions;
    return {
      'arn': arn,
      'clusterId': clusterId,
      'createdAt': iso8601ToJson(createdAt),
      'customLaunchTemplate': customLaunchTemplate,
      'iamInstanceProfileArn': iamInstanceProfileArn,
      'id': id,
      'instanceConfigs': instanceConfigs,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'scalingConfiguration': scalingConfiguration,
      'status': status.value,
      'subnetIds': subnetIds,
      if (amiId != null) 'amiId': amiId,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (purchaseOption != null) 'purchaseOption': purchaseOption.value,
      if (slurmConfiguration != null) 'slurmConfiguration': slurmConfiguration,
      if (spotOptions != null) 'spotOptions': spotOptions,
    };
  }
}

/// The compute node group configuration for a queue.
class ComputeNodeGroupConfiguration {
  /// The compute node group ID for the compute node group configuration.
  final String? computeNodeGroupId;

  ComputeNodeGroupConfiguration({
    this.computeNodeGroupId,
  });

  factory ComputeNodeGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeNodeGroupConfiguration(
      computeNodeGroupId: json['computeNodeGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeNodeGroupId = this.computeNodeGroupId;
    return {
      if (computeNodeGroupId != null) 'computeNodeGroupId': computeNodeGroupId,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class ComputeNodeGroupSlurmConfiguration {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ComputeNodeGroupSlurmConfiguration({
    this.slurmCustomSettings,
  });

  factory ComputeNodeGroupSlurmConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ComputeNodeGroupSlurmConfiguration(
      slurmCustomSettings: (json['slurmCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => SlurmCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final slurmCustomSettings = this.slurmCustomSettings;
    return {
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class ComputeNodeGroupSlurmConfigurationRequest {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ComputeNodeGroupSlurmConfigurationRequest({
    this.slurmCustomSettings,
  });

  Map<String, dynamic> toJson() {
    final slurmCustomSettings = this.slurmCustomSettings;
    return {
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
    };
  }
}

enum ComputeNodeGroupStatus {
  creating('CREATING'),
  active('ACTIVE'),
  updating('UPDATING'),
  deleting('DELETING'),
  createFailed('CREATE_FAILED'),
  deleteFailed('DELETE_FAILED'),
  updateFailed('UPDATE_FAILED'),
  deleted('DELETED'),
  ;

  final String value;

  const ComputeNodeGroupStatus(this.value);

  static ComputeNodeGroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ComputeNodeGroupStatus'));
}

/// The object returned by the <code>ListComputeNodeGroups</code> API action.
class ComputeNodeGroupSummary {
  /// The unique Amazon Resource Name (ARN) of the compute node group.
  final String arn;

  /// The ID of the cluster of the compute node group.
  final String clusterId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The generated unique ID of the compute node group.
  final String id;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the compute node group.
  final String name;

  /// The provisioning status of the compute node group.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the compute
  /// node group.
  /// </note>
  final ComputeNodeGroupStatus status;

  ComputeNodeGroupSummary({
    required this.arn,
    required this.clusterId,
    required this.createdAt,
    required this.id,
    required this.modifiedAt,
    required this.name,
    required this.status,
  });

  factory ComputeNodeGroupSummary.fromJson(Map<String, dynamic> json) {
    return ComputeNodeGroupSummary(
      arn: json['arn'] as String,
      clusterId: json['clusterId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: ComputeNodeGroupStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterId = this.clusterId;
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'clusterId': clusterId,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.value,
    };
  }
}

class CreateClusterResponse {
  /// The cluster resource.
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

class CreateComputeNodeGroupResponse {
  final ComputeNodeGroup? computeNodeGroup;

  CreateComputeNodeGroupResponse({
    this.computeNodeGroup,
  });

  factory CreateComputeNodeGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateComputeNodeGroupResponse(
      computeNodeGroup: json['computeNodeGroup'] != null
          ? ComputeNodeGroup.fromJson(
              json['computeNodeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeNodeGroup = this.computeNodeGroup;
    return {
      if (computeNodeGroup != null) 'computeNodeGroup': computeNodeGroup,
    };
  }
}

class CreateQueueResponse {
  final Queue? queue;

  CreateQueueResponse({
    this.queue,
  });

  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    return {
      if (queue != null) 'queue': queue,
    };
  }
}

/// An Amazon EC2 launch template Amazon Web Services PCS uses to launch compute
/// nodes.
class CustomLaunchTemplate {
  /// The ID of the EC2 launch template to use to provision instances.
  ///
  /// Example: <code>lt-xxxx</code>
  final String id;

  /// The version of the EC2 launch template to use to provision instances.
  final String version;

  CustomLaunchTemplate({
    required this.id,
    required this.version,
  });

  factory CustomLaunchTemplate.fromJson(Map<String, dynamic> json) {
    return CustomLaunchTemplate(
      id: json['id'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final version = this.version;
    return {
      'id': id,
      'version': version,
    };
  }
}

class DeleteClusterResponse {
  DeleteClusterResponse();

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClusterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteComputeNodeGroupResponse {
  DeleteComputeNodeGroupResponse();

  factory DeleteComputeNodeGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteComputeNodeGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueResponse {
  DeleteQueueResponse();

  factory DeleteQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An endpoint available for interaction with the scheduler.
class Endpoint {
  /// The endpoint's connection port number.
  ///
  /// Example: <code>1234</code>
  final String port;

  /// The endpoint's private IP address.
  ///
  /// Example: <code>2.2.2.2</code>
  final String privateIpAddress;

  /// Indicates the type of endpoint running at the specific IP address.
  final EndpointType type;

  /// The endpoint's public IP address.
  ///
  /// Example: <code>1.1.1.1</code>
  final String? publicIpAddress;

  Endpoint({
    required this.port,
    required this.privateIpAddress,
    required this.type,
    this.publicIpAddress,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      port: json['port'] as String,
      privateIpAddress: json['privateIpAddress'] as String,
      type: EndpointType.fromString((json['type'] as String)),
      publicIpAddress: json['publicIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final privateIpAddress = this.privateIpAddress;
    final type = this.type;
    final publicIpAddress = this.publicIpAddress;
    return {
      'port': port,
      'privateIpAddress': privateIpAddress,
      'type': type.value,
      if (publicIpAddress != null) 'publicIpAddress': publicIpAddress,
    };
  }
}

enum EndpointType {
  slurmctld('SLURMCTLD'),
  slurmdbd('SLURMDBD'),
  ;

  final String value;

  const EndpointType(this.value);

  static EndpointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EndpointType'));
}

/// An error that occurred during resource creation.
class ErrorInfo {
  /// The short-form error code.
  final String? code;

  /// The detailed error information.
  final String? message;

  ErrorInfo({
    this.code,
    this.message,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

class GetClusterResponse {
  /// The cluster resource.
  final Cluster? cluster;

  GetClusterResponse({
    this.cluster,
  });

  factory GetClusterResponse.fromJson(Map<String, dynamic> json) {
    return GetClusterResponse(
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

class GetComputeNodeGroupResponse {
  final ComputeNodeGroup? computeNodeGroup;

  GetComputeNodeGroupResponse({
    this.computeNodeGroup,
  });

  factory GetComputeNodeGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetComputeNodeGroupResponse(
      computeNodeGroup: json['computeNodeGroup'] != null
          ? ComputeNodeGroup.fromJson(
              json['computeNodeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeNodeGroup = this.computeNodeGroup;
    return {
      if (computeNodeGroup != null) 'computeNodeGroup': computeNodeGroup,
    };
  }
}

class GetQueueResponse {
  final Queue? queue;

  GetQueueResponse({
    this.queue,
  });

  factory GetQueueResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    return {
      if (queue != null) 'queue': queue,
    };
  }
}

/// An EC2 instance configuration Amazon Web Services PCS uses to launch compute
/// nodes.
class InstanceConfig {
  /// The EC2 instance type that Amazon Web Services PCS can provision in the
  /// compute node group.
  ///
  /// Example: <code>t2.xlarge</code>
  final String? instanceType;

  InstanceConfig({
    this.instanceType,
  });

  factory InstanceConfig.fromJson(Map<String, dynamic> json) {
    return InstanceConfig(
      instanceType: json['instanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    return {
      if (instanceType != null) 'instanceType': instanceType,
    };
  }
}

class ListClustersResponse {
  /// The list of clusters.
  final List<ClusterSummary> clusters;

  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each pagination
  /// token expires after 24 hours. Using an expired pagination token returns an
  /// <code>HTTP 400 InvalidToken</code> error.
  final String? nextToken;

  ListClustersResponse({
    required this.clusters,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusters: (json['clusters'] as List)
          .nonNulls
          .map((e) => ClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      'clusters': clusters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListComputeNodeGroupsResponse {
  /// The list of compute node groups for the cluster.
  final List<ComputeNodeGroupSummary> computeNodeGroups;

  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each pagination
  /// token expires after 24 hours. Using an expired pagination token returns an
  /// <code>HTTP 400 InvalidToken</code> error.
  final String? nextToken;

  ListComputeNodeGroupsResponse({
    required this.computeNodeGroups,
    this.nextToken,
  });

  factory ListComputeNodeGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListComputeNodeGroupsResponse(
      computeNodeGroups: (json['computeNodeGroups'] as List)
          .nonNulls
          .map((e) =>
              ComputeNodeGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeNodeGroups = this.computeNodeGroups;
    final nextToken = this.nextToken;
    return {
      'computeNodeGroups': computeNodeGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListQueuesResponse {
  /// The list of queues associated with the cluster.
  final List<QueueSummary> queues;

  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page of results returned. If <code>nextToken</code> is returned, there are
  /// more results available. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each pagination
  /// token expires after 24 hours. Using an expired pagination token returns an
  /// <code>HTTP 400 InvalidToken</code> error.
  final String? nextToken;

  ListQueuesResponse({
    required this.queues,
    this.nextToken,
  });

  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuesResponse(
      queues: (json['queues'] as List)
          .nonNulls
          .map((e) => QueueSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queues = this.queues;
    final nextToken = this.nextToken;
    return {
      'queues': queues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// 1 or more tags added to the resource. Each tag consists of a tag key and tag
  /// value. The tag value is optional and can be an empty string.
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

/// The networking configuration for the cluster's control plane.
class Networking {
  /// The list of security group IDs associated with the Elastic Network Interface
  /// (ENI) created in subnets.
  ///
  /// The following rules are required:
  ///
  /// <ul>
  /// <li>
  /// Inbound rule 1
  ///
  /// <ul>
  /// <li>
  /// Protocol: All
  /// </li>
  /// <li>
  /// Ports: All
  /// </li>
  /// <li>
  /// Source: Self
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Outbound rule 1
  ///
  /// <ul>
  /// <li>
  /// Protocol: All
  /// </li>
  /// <li>
  /// Ports: All
  /// </li>
  /// <li>
  /// Destination: 0.0.0.0/0 (IPv4)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Outbound rule 2
  ///
  /// <ul>
  /// <li>
  /// Protocol: All
  /// </li>
  /// <li>
  /// Ports: All
  /// </li>
  /// <li>
  /// Destination: Self
  /// </li>
  /// </ul> </li>
  /// </ul>
  final List<String>? securityGroupIds;

  /// The ID of the subnet where Amazon Web Services PCS creates an Elastic
  /// Network Interface (ENI) to enable communication between managed controllers
  /// and Amazon Web Services PCS resources. The subnet must have an available IP
  /// address, cannot reside in AWS Outposts, AWS Wavelength, or an AWS Local
  /// Zone.
  ///
  /// Example: <code>subnet-abcd1234</code>
  final List<String>? subnetIds;

  Networking({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory Networking.fromJson(Map<String, dynamic> json) {
    return Networking(
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// The networking configuration for the cluster's control plane.
class NetworkingRequest {
  /// A list of security group IDs associated with the Elastic Network Interface
  /// (ENI) created in subnets.
  final List<String>? securityGroupIds;

  /// The list of subnet IDs where Amazon Web Services PCS creates an Elastic
  /// Network Interface (ENI) to enable communication between managed controllers
  /// and Amazon Web Services PCS resources. Subnet IDs have the form
  /// <code>subnet-0123456789abcdef0</code>.
  ///
  /// Subnets can't be in Outposts, Wavelength or an Amazon Web Services Local
  /// Zone.
  /// <note>
  /// Amazon Web Services PCS currently supports only 1 subnet in this list.
  /// </note>
  final List<String>? subnetIds;

  NetworkingRequest({
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

enum PurchaseOption {
  ondemand('ONDEMAND'),
  spot('SPOT'),
  ;

  final String value;

  const PurchaseOption(this.value);

  static PurchaseOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PurchaseOption'));
}

/// A queue resource.
class Queue {
  /// The unique Amazon Resource Name (ARN) of the queue.
  final String arn;

  /// The ID of the cluster of the queue.
  final String clusterId;

  /// The list of compute node group configurations associated with the queue.
  /// Queues assign jobs to associated compute node groups.
  final List<ComputeNodeGroupConfiguration> computeNodeGroupConfigurations;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The generated unique ID of the queue.
  final String id;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the queue.
  final String name;

  /// The provisioning status of the queue.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the queue.
  /// </note>
  final QueueStatus status;

  /// The list of errors that occurred during queue provisioning.
  final List<ErrorInfo>? errorInfo;

  Queue({
    required this.arn,
    required this.clusterId,
    required this.computeNodeGroupConfigurations,
    required this.createdAt,
    required this.id,
    required this.modifiedAt,
    required this.name,
    required this.status,
    this.errorInfo,
  });

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      arn: json['arn'] as String,
      clusterId: json['clusterId'] as String,
      computeNodeGroupConfigurations: (json['computeNodeGroupConfigurations']
              as List)
          .nonNulls
          .map((e) =>
              ComputeNodeGroupConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: QueueStatus.fromString((json['status'] as String)),
      errorInfo: (json['errorInfo'] as List?)
          ?.nonNulls
          .map((e) => ErrorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterId = this.clusterId;
    final computeNodeGroupConfigurations = this.computeNodeGroupConfigurations;
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final errorInfo = this.errorInfo;
    return {
      'arn': arn,
      'clusterId': clusterId,
      'computeNodeGroupConfigurations': computeNodeGroupConfigurations,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.value,
      if (errorInfo != null) 'errorInfo': errorInfo,
    };
  }
}

enum QueueStatus {
  creating('CREATING'),
  active('ACTIVE'),
  updating('UPDATING'),
  deleting('DELETING'),
  createFailed('CREATE_FAILED'),
  deleteFailed('DELETE_FAILED'),
  updateFailed('UPDATE_FAILED'),
  ;

  final String value;

  const QueueStatus(this.value);

  static QueueStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum QueueStatus'));
}

/// The object returned by the <code>ListQueues</code> API action.
class QueueSummary {
  /// The unique Amazon Resource Name (ARN) of the queue.
  final String arn;

  /// The ID of the cluster of the queue.
  final String clusterId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The generated unique ID of the queue.
  final String id;

  /// The date and time the resource was modified.
  final DateTime modifiedAt;

  /// The name that identifies the queue.
  final String name;

  /// The provisioning status of the queue.
  /// <note>
  /// The provisioning status doesn't indicate the overall health of the queue.
  /// </note>
  final QueueStatus status;

  QueueSummary({
    required this.arn,
    required this.clusterId,
    required this.createdAt,
    required this.id,
    required this.modifiedAt,
    required this.name,
    required this.status,
  });

  factory QueueSummary.fromJson(Map<String, dynamic> json) {
    return QueueSummary(
      arn: json['arn'] as String,
      clusterId: json['clusterId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: QueueStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterId = this.clusterId;
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'clusterId': clusterId,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'status': status.value,
    };
  }
}

class RegisterComputeNodeGroupInstanceResponse {
  /// The list of endpoints available for interaction with the scheduler.
  final List<Endpoint> endpoints;

  /// The scheduler node ID for this instance.
  final String nodeID;

  /// For the Slurm scheduler, this is the shared Munge key the scheduler uses to
  /// authenticate compute node group instances.
  final String sharedSecret;

  RegisterComputeNodeGroupInstanceResponse({
    required this.endpoints,
    required this.nodeID,
    required this.sharedSecret,
  });

  factory RegisterComputeNodeGroupInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterComputeNodeGroupInstanceResponse(
      endpoints: (json['endpoints'] as List)
          .nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeID: json['nodeID'] as String,
      sharedSecret: json['sharedSecret'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nodeID = this.nodeID;
    final sharedSecret = this.sharedSecret;
    return {
      'endpoints': endpoints,
      'nodeID': nodeID,
      'sharedSecret': sharedSecret,
    };
  }
}

/// Specifies the boundaries of the compute node group auto scaling.
class ScalingConfiguration {
  /// The upper bound of the number of instances allowed in the compute fleet.
  final int maxInstanceCount;

  /// The lower bound of the number of instances allowed in the compute fleet.
  final int minInstanceCount;

  ScalingConfiguration({
    required this.maxInstanceCount,
    required this.minInstanceCount,
  });

  factory ScalingConfiguration.fromJson(Map<String, dynamic> json) {
    return ScalingConfiguration(
      maxInstanceCount: json['maxInstanceCount'] as int,
      minInstanceCount: json['minInstanceCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxInstanceCount = this.maxInstanceCount;
    final minInstanceCount = this.minInstanceCount;
    return {
      'maxInstanceCount': maxInstanceCount,
      'minInstanceCount': minInstanceCount,
    };
  }
}

/// Specifies the boundaries of the compute node group auto scaling.
class ScalingConfigurationRequest {
  /// The upper bound of the number of instances allowed in the compute fleet.
  final int maxInstanceCount;

  /// The lower bound of the number of instances allowed in the compute fleet.
  final int minInstanceCount;

  ScalingConfigurationRequest({
    required this.maxInstanceCount,
    required this.minInstanceCount,
  });

  Map<String, dynamic> toJson() {
    final maxInstanceCount = this.maxInstanceCount;
    final minInstanceCount = this.minInstanceCount;
    return {
      'maxInstanceCount': maxInstanceCount,
      'minInstanceCount': minInstanceCount,
    };
  }
}

/// The cluster management and job scheduling software associated with the
/// cluster.
class Scheduler {
  /// The software Amazon Web Services PCS uses to manage cluster scaling and job
  /// scheduling.
  final SchedulerType type;

  /// The version of the specified scheduling software that Amazon Web Services
  /// PCS uses to manage cluster scaling and job scheduling.
  final String version;

  Scheduler({
    required this.type,
    required this.version,
  });

  factory Scheduler.fromJson(Map<String, dynamic> json) {
    return Scheduler(
      type: SchedulerType.fromString((json['type'] as String)),
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      'type': type.value,
      'version': version,
    };
  }
}

/// The cluster management and job scheduling software associated with the
/// cluster.
class SchedulerRequest {
  /// The software Amazon Web Services PCS uses to manage cluster scaling and job
  /// scheduling.
  final SchedulerType type;

  /// The version of the specified scheduling software that Amazon Web Services
  /// PCS uses to manage cluster scaling and job scheduling.
  final String version;

  SchedulerRequest({
    required this.type,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      'type': type.value,
      'version': version,
    };
  }
}

enum SchedulerType {
  slurm('SLURM'),
  ;

  final String value;

  const SchedulerType(this.value);

  static SchedulerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SchedulerType'));
}

enum Size {
  small('SMALL'),
  medium('MEDIUM'),
  large('LARGE'),
  ;

  final String value;

  const Size(this.value);

  static Size fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Size'));
}

/// The shared Slurm key for authentication, also known as the <b>cluster
/// secret</b>.
class SlurmAuthKey {
  /// The Amazon Resource Name (ARN) of the the shared Slurm key.
  final String secretArn;

  /// The version of the shared Slurm key.
  final String secretVersion;

  SlurmAuthKey({
    required this.secretArn,
    required this.secretVersion,
  });

  factory SlurmAuthKey.fromJson(Map<String, dynamic> json) {
    return SlurmAuthKey(
      secretArn: json['secretArn'] as String,
      secretVersion: json['secretVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final secretVersion = this.secretVersion;
    return {
      'secretArn': secretArn,
      'secretVersion': secretVersion,
    };
  }
}

/// Additional settings that directly map to Slurm settings.
class SlurmCustomSetting {
  /// Amazon Web Services PCS supports configuration of the following Slurm
  /// parameters: <a
  /// href="https://slurm.schedmd.com/slurm.conf.html#OPT_Prolog_1">
  /// <code>Prolog</code> </a>, <a
  /// href="https://slurm.schedmd.com/slurm.conf.html#OPT_Epilog_1">
  /// <code>Epilog</code> </a>, and <a
  /// href="https://slurm.schedmd.com/slurm.conf.html#OPT_SelectTypeParameters">
  /// <code>SelectTypeParameters</code> </a>.
  final String parameterName;

  /// The values for the configured Slurm settings.
  final String parameterValue;

  SlurmCustomSetting({
    required this.parameterName,
    required this.parameterValue,
  });

  factory SlurmCustomSetting.fromJson(Map<String, dynamic> json) {
    return SlurmCustomSetting(
      parameterName: json['parameterName'] as String,
      parameterValue: json['parameterValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      'parameterName': parameterName,
      'parameterValue': parameterValue,
    };
  }
}

enum SpotAllocationStrategy {
  lowestPrice('lowest-price'),
  capacityOptimized('capacity-optimized'),
  priceCapacityOptimized('price-capacity-optimized'),
  ;

  final String value;

  const SpotAllocationStrategy(this.value);

  static SpotAllocationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SpotAllocationStrategy'));
}

/// Additional configuration when you specify <code>SPOT</code> as the
/// <code>purchaseOption</code> for the <code>CreateComputeNodeGroup</code> API
/// action.
class SpotOptions {
  /// The Amazon EC2 allocation strategy Amazon Web Services PCS uses to provision
  /// EC2 instances. Amazon Web Services PCS supports <b>lowest price</b>,
  /// <b>capacity optimized</b>, and <b>price capacity optimized</b>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-allocation-strategy.html">Use
  /// allocation strategies to determine how EC2 Fleet or Spot Fleet fulfills Spot
  /// and On-Demand capacity</a> in the <i>Amazon Elastic Compute Cloud User
  /// Guide</i>. If you don't provide this option, it defaults to <b>price
  /// capacity optimized</b>.
  final SpotAllocationStrategy? allocationStrategy;

  SpotOptions({
    this.allocationStrategy,
  });

  factory SpotOptions.fromJson(Map<String, dynamic> json) {
    return SpotOptions(
      allocationStrategy: (json['allocationStrategy'] as String?)
          ?.let(SpotAllocationStrategy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    return {
      if (allocationStrategy != null)
        'allocationStrategy': allocationStrategy.value,
    };
  }
}

class UpdateComputeNodeGroupResponse {
  final ComputeNodeGroup? computeNodeGroup;

  UpdateComputeNodeGroupResponse({
    this.computeNodeGroup,
  });

  factory UpdateComputeNodeGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateComputeNodeGroupResponse(
      computeNodeGroup: json['computeNodeGroup'] != null
          ? ComputeNodeGroup.fromJson(
              json['computeNodeGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeNodeGroup = this.computeNodeGroup;
    return {
      if (computeNodeGroup != null) 'computeNodeGroup': computeNodeGroup,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class UpdateComputeNodeGroupSlurmConfigurationRequest {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  UpdateComputeNodeGroupSlurmConfigurationRequest({
    this.slurmCustomSettings,
  });

  Map<String, dynamic> toJson() {
    final slurmCustomSettings = this.slurmCustomSettings;
    return {
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
    };
  }
}

class UpdateQueueResponse {
  final Queue? queue;

  UpdateQueueResponse({
    this.queue,
  });

  factory UpdateQueueResponse.fromJson(Map<String, dynamic> json) {
    return UpdateQueueResponse(
      queue: json['queue'] != null
          ? Queue.fromJson(json['queue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    return {
      if (queue != null) 'queue': queue,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
