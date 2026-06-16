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

/// Parallel Computing Service (PCS) is a managed service that makes it easier
/// for you to run and scale your high performance computing (HPC) workloads,
/// and build scientific and engineering models on Amazon Web Services using
/// Slurm. For more information, see the <a
/// href="https://docs.aws.amazon.com/pcs/latest/userguide">Parallel Computing
/// Service User Guide</a>.
///
/// This reference describes the actions and data types of the service
/// management API. You can use the Amazon Web Services SDKs to call the API
/// actions in software, or use the Command Line Interface (CLI) to call the API
/// actions manually. These API actions manage the service through an Amazon Web
/// Services account.
///
/// The API actions operate on PCS resources. A <i>resource</i> is an entity in
/// Amazon Web Services that you can work with. Amazon Web Services services
/// create resources when you use the features of the service. Examples of PCS
/// resources include clusters, compute node groups, and queues. For more
/// information about resources in Amazon Web Services, see <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/getting-started-terms-and-concepts.html#term-resource">Resource</a>
/// in the <i>Resource Explorer User Guide</i>.
///
/// An PCS <i>compute node</i> is an Amazon EC2 instance. You don't launch
/// compute nodes directly. PCS uses configuration information that you provide
/// to launch compute nodes in your Amazon Web Services account. You receive
/// billing charges for your running compute nodes. PCS automatically terminates
/// your compute nodes when you delete the PCS resources related to those
/// compute nodes.
class Pcs {
  final _s.JsonProtocol _protocol;
  Pcs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pcs',
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

  /// Returns a list of all tags on an PCS resource.
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

  /// Adds or edits tags on an PCS resource. Each tag consists of a tag key and
  /// a tag value. The tag key and tag value are case-sensitive strings. The tag
  /// value can be an empty (null) string. To add a tag, specify a new tag key
  /// and a tag value. To edit a tag, specify an existing tag key and a new tag
  /// value.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Deletes tags from an PCS resource. To delete a tag, specify the tag key
  /// and the Amazon Resource Name (ARN) of the PCS resource.
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

  /// Creates a cluster in your account. PCS creates the cluster controller in a
  /// service-owned account. The cluster controller communicates with the
  /// cluster resources in your account. The subnets and security groups for the
  /// cluster must already exist before you use this API action.
  /// <note>
  /// It takes time for PCS to create the cluster. The cluster is in a
  /// <code>Creating</code> state until it is ready to use. There can only be 1
  /// cluster in a <code>Creating</code> state per Amazon Web Services Region
  /// per Amazon Web Services account. <code>CreateCluster</code> fails with a
  /// <code>ServiceQuotaExceededException</code> if there is already a cluster
  /// in a <code>Creating</code> state.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates a cluster configuration. You can modify Slurm scheduler settings,
  /// accounting configuration, and security groups for an existing cluster.
  /// <note>
  /// You can only update clusters that are in <code>ACTIVE</code>,
  /// <code>UPDATE_FAILED</code>, or <code>SUSPENDED</code> state. All
  /// associated resources (queues and compute node groups) must be in
  /// <code>ACTIVE</code> state before you can update the cluster.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster to update.
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
  Future<UpdateClusterResponse> updateCluster({
    required String clusterIdentifier,
    String? clientToken,
    UpdateClusterSlurmConfigurationRequest? slurmConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSParallelComputingService.UpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clusterIdentifier': clusterIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
      },
    );

    return UpdateClusterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a cluster and all its linked resources. You must delete all queues
  /// and compute node groups associated with the cluster before you can delete
  /// the cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns detailed information about a running cluster in your account. This
  /// API action provides networking information, endpoint information for
  /// communication with the scheduler, and provisioning status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster.
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

  /// <important>
  /// This API action isn't intended for you to use.
  /// </important>
  /// PCS uses this API action to register the compute nodes it launches in your
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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

  /// Returns a list of running clusters in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a managed set of compute nodes. You associate a compute node group
  /// with a cluster through 1 or more PCS queues or as part of the login fleet.
  /// A compute node group includes the definition of the compute properties and
  /// lifecycle management. PCS uses the information you provide to this API
  /// action to launch compute nodes in your account. You can only specify
  /// subnets in the same Amazon VPC as your cluster. You receive billing
  /// charges for the compute nodes that PCS launches in your account. You must
  /// already have a launch template before you call this API. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">Launch
  /// an instance from a launch template</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide for Linux Instances</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// profile must have the <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permission and the role name must start with <code>AWSPCS</code> or must
  /// have the path <code>/aws-pcs/</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html">IAM
  /// instance profiles for PCS</a> in the <i>PCS User Guide</i>.
  ///
  /// Parameter [instanceConfigs] :
  /// A list of EC2 instance configurations that PCS can provision in the
  /// compute node group.
  ///
  /// Parameter [scalingConfiguration] :
  /// Specifies the boundaries of the compute node group auto scaling.
  ///
  /// Parameter [subnetIds] :
  /// The list of subnet IDs where the compute node group launches instances.
  /// Subnets must be in the same VPC as the cluster.
  ///
  /// Parameter [amiId] :
  /// The ID of the Amazon Machine Image (AMI) that PCS uses to launch compute
  /// nodes (Amazon EC2 instances). If you don't provide this value, PCS uses
  /// the AMI ID specified in the custom launch template.
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
  /// Specifies how EC2 instances are purchased on your behalf. PCS supports
  /// On-Demand Instances, Spot Instances, Interruptible Capacity Reservations,
  /// On-Demand Capacity Reservations, and Amazon EC2 Capacity Blocks for ML.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Amazon
  /// EC2 billing and purchasing options</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>. For more information about PCS support for Capacity
  /// Blocks, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html">Using
  /// Amazon EC2 Capacity Blocks for ML with PCS</a> in the <i>PCS User
  /// Guide</i>. For more information about PCS support for interruptible
  /// capacity reservations, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html">Using
  /// I-ODCRs with PCS</a> in the <i>PCS User Guide</i>. Choose On-Demand if you
  /// plan to use an On-Demand Capacity Reservation (ODCR). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html">Using
  /// ODCRs with PCS</a>. If you don't provide this option, it defaults to
  /// On-Demand.
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

  /// Updates a compute node group. You can update many of the fields related to
  /// your compute node group including the configurations for networking,
  /// compute nodes, and settings specific to your scheduler (such as Slurm).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clusterIdentifier] :
  /// The name or ID of the cluster of the compute node group.
  ///
  /// Parameter [computeNodeGroupIdentifier] :
  /// The name or ID of the compute node group.
  ///
  /// Parameter [amiId] :
  /// The ID of the Amazon Machine Image (AMI) that PCS uses to launch
  /// instances. If not provided, PCS uses the AMI ID specified in the custom
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
  /// Parameter [iamInstanceProfileArn] :
  /// The Amazon Resource Name (ARN) of the IAM instance profile used to pass an
  /// IAM role when launching EC2 instances. The role contained in your instance
  /// profile must have the <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permission and the role name must start with <code>AWSPCS</code> or must
  /// have the path <code>/aws-pcs/</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html">IAM
  /// instance profiles for PCS</a> in the <i>PCS User Guide</i>.
  ///
  /// Parameter [purchaseOption] :
  /// Specifies how EC2 instances are purchased on your behalf. PCS supports
  /// On-Demand Instances, Spot Instances, Interruptible Capacity Reservations,
  /// On-Demand Capacity Reservations, and Amazon EC2 Capacity Blocks for ML.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Amazon
  /// EC2 billing and purchasing options</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>. For more information about PCS support for Capacity
  /// Blocks, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html">Using
  /// Amazon EC2 Capacity Blocks for ML with PCS</a> in the <i>PCS User
  /// Guide</i>. For more information about PCS support for interruptible
  /// capacity reservations, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html">Using
  /// I-ODCRs with PCS</a> in the <i>PCS User Guide</i>. Choose On-Demand if you
  /// plan to use an On-Demand Capacity Reservation (ODCR). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html">Using
  /// ODCRs with PCS</a>. If you don't provide this option, it defaults to
  /// On-Demand.
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

  /// Deletes a compute node group. You must delete all queues associated with
  /// the compute node group first.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns detailed information about a compute node group. This API action
  /// provides networking information, EC2 instance type, compute node group
  /// status, and scheduler (such as Slurm) configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of all compute node groups associated with a cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a job queue. You must associate 1 or more compute node groups with
  /// the queue. You can associate 1 compute node group with multiple queues.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [slurmConfiguration] :
  /// Additional options related to the Slurm scheduler.
  ///
  /// Parameter [tags] :
  /// 1 or more tags added to the resource. Each tag consists of a tag key and
  /// tag value. The tag value is optional and can be an empty string.
  Future<CreateQueueResponse> createQueue({
    required String clusterIdentifier,
    required String queueName,
    String? clientToken,
    List<ComputeNodeGroupConfiguration>? computeNodeGroupConfigurations,
    QueueSlurmConfigurationRequest? slurmConfiguration,
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
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateQueueResponse.fromJson(jsonResponse.body);
  }

  /// Updates the compute node group configuration of a queue. Use this API to
  /// change the compute node groups that the queue can send jobs to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  ///
  /// Parameter [slurmConfiguration] :
  /// Additional options related to the Slurm scheduler.
  Future<UpdateQueueResponse> updateQueue({
    required String clusterIdentifier,
    required String queueIdentifier,
    String? clientToken,
    List<ComputeNodeGroupConfiguration>? computeNodeGroupConfigurations,
    UpdateQueueSlurmConfigurationRequest? slurmConfiguration,
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
        if (slurmConfiguration != null)
          'slurmConfiguration': slurmConfiguration,
      },
    );

    return UpdateQueueResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a job queue. If the compute node group associated with this queue
  /// isn't associated with any other queues, PCS terminates all the compute
  /// nodes for this queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns detailed information about a queue. The information includes the
  /// compute node groups that the queue uses to schedule jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of all queues associated with a cluster.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateClusterResponse {
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

class DeleteClusterResponse {
  DeleteClusterResponse();

  factory DeleteClusterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteClusterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      endpoints: ((json['endpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeID: (json['nodeID'] as String?) ?? '',
      sharedSecret: (json['sharedSecret'] as String?) ?? '',
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
      clusters: ((json['clusters'] as List?) ?? const [])
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

class DeleteComputeNodeGroupResponse {
  DeleteComputeNodeGroupResponse();

  factory DeleteComputeNodeGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteComputeNodeGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      computeNodeGroups: ((json['computeNodeGroups'] as List?) ?? const [])
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

class DeleteQueueResponse {
  DeleteQueueResponse();

  factory DeleteQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      queues: ((json['queues'] as List?) ?? const [])
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
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
      arn: (json['arn'] as String?) ?? '',
      clusterId: (json['clusterId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: QueueStatus.fromString((json['status'] as String?) ?? ''),
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

class QueueStatus {
  static const creating = QueueStatus._('CREATING');
  static const active = QueueStatus._('ACTIVE');
  static const updating = QueueStatus._('UPDATING');
  static const deleting = QueueStatus._('DELETING');
  static const createFailed = QueueStatus._('CREATE_FAILED');
  static const deleteFailed = QueueStatus._('DELETE_FAILED');
  static const updateFailed = QueueStatus._('UPDATE_FAILED');
  static const suspending = QueueStatus._('SUSPENDING');
  static const suspended = QueueStatus._('SUSPENDED');
  static const resuming = QueueStatus._('RESUMING');

  final String value;

  const QueueStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    deleteFailed,
    updateFailed,
    suspending,
    suspended,
    resuming
  ];

  static QueueStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueueStatus._(value));

  @override
  bool operator ==(other) => other is QueueStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
  final QueueStatus status;

  /// The list of errors that occurred during queue provisioning.
  final List<ErrorInfo>? errorInfo;

  /// Additional options related to the Slurm scheduler.
  final QueueSlurmConfiguration? slurmConfiguration;

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
    this.slurmConfiguration,
  });

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      arn: (json['arn'] as String?) ?? '',
      clusterId: (json['clusterId'] as String?) ?? '',
      computeNodeGroupConfigurations: ((json['computeNodeGroupConfigurations']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              ComputeNodeGroupConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: QueueStatus.fromString((json['status'] as String?) ?? ''),
      errorInfo: (json['errorInfo'] as List?)
          ?.nonNulls
          .map((e) => ErrorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      slurmConfiguration: json['slurmConfiguration'] != null
          ? QueueSlurmConfiguration.fromJson(
              json['slurmConfiguration'] as Map<String, dynamic>)
          : null,
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
    final slurmConfiguration = this.slurmConfiguration;
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
      if (slurmConfiguration != null) 'slurmConfiguration': slurmConfiguration,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class QueueSlurmConfiguration {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  QueueSlurmConfiguration({
    this.slurmCustomSettings,
  });

  factory QueueSlurmConfiguration.fromJson(Map<String, dynamic> json) {
    return QueueSlurmConfiguration(
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

/// Additional settings that directly map to Slurm settings.
/// <important>
/// PCS supports a subset of Slurm settings. For more information, see <a
/// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-custom-settings.html">Configuring
/// custom Slurm settings in PCS</a> in the <i>PCS User Guide</i>.
/// </important>
class SlurmCustomSetting {
  /// PCS supports custom Slurm settings for clusters, compute node groups, and
  /// queues. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-custom-settings.html">Configuring
  /// custom Slurm settings in PCS</a> in the <i>PCS User Guide</i>.
  final String parameterName;

  /// The values for the configured Slurm settings.
  final String parameterValue;

  SlurmCustomSetting({
    required this.parameterName,
    required this.parameterValue,
  });

  factory SlurmCustomSetting.fromJson(Map<String, dynamic> json) {
    return SlurmCustomSetting(
      parameterName: (json['parameterName'] as String?) ?? '',
      parameterValue: (json['parameterValue'] as String?) ?? '',
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
class UpdateQueueSlurmConfigurationRequest {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  UpdateQueueSlurmConfigurationRequest({
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

/// Additional options related to the Slurm scheduler.
class QueueSlurmConfigurationRequest {
  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  QueueSlurmConfigurationRequest({
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
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
      arn: (json['arn'] as String?) ?? '',
      clusterId: (json['clusterId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status:
          ComputeNodeGroupStatus.fromString((json['status'] as String?) ?? ''),
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

class ComputeNodeGroupStatus {
  static const creating = ComputeNodeGroupStatus._('CREATING');
  static const active = ComputeNodeGroupStatus._('ACTIVE');
  static const updating = ComputeNodeGroupStatus._('UPDATING');
  static const deleting = ComputeNodeGroupStatus._('DELETING');
  static const createFailed = ComputeNodeGroupStatus._('CREATE_FAILED');
  static const deleteFailed = ComputeNodeGroupStatus._('DELETE_FAILED');
  static const updateFailed = ComputeNodeGroupStatus._('UPDATE_FAILED');
  static const deleted = ComputeNodeGroupStatus._('DELETED');
  static const suspending = ComputeNodeGroupStatus._('SUSPENDING');
  static const suspended = ComputeNodeGroupStatus._('SUSPENDED');
  static const resuming = ComputeNodeGroupStatus._('RESUMING');

  final String value;

  const ComputeNodeGroupStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    deleteFailed,
    updateFailed,
    deleted,
    suspending,
    suspended,
    resuming
  ];

  static ComputeNodeGroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComputeNodeGroupStatus._(value));

  @override
  bool operator ==(other) =>
      other is ComputeNodeGroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// profile must have the <code>pcs:RegisterComputeNodeGroupInstance</code>
  /// permission and the role name must start with <code>AWSPCS</code> or must
  /// have the path <code>/aws-pcs/</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html">IAM
  /// instance profiles for PCS</a> in the <i>PCS User Guide</i>.
  final String iamInstanceProfileArn;

  /// The generated unique ID of the compute node group.
  final String id;

  /// A list of EC2 instance configurations that PCS can provision in the compute
  /// node group.
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
  final ComputeNodeGroupStatus status;

  /// The list of subnet IDs where instances are provisioned by the compute node
  /// group. The subnets must be in the same VPC as the cluster.
  final List<String> subnetIds;

  /// The ID of the Amazon Machine Image (AMI) that PCS uses to launch instances.
  /// If not provided, PCS uses the AMI ID specified in the custom launch
  /// template.
  final String? amiId;

  /// The list of errors that occurred during compute node group provisioning.
  final List<ErrorInfo>? errorInfo;

  /// Specifies how EC2 instances are purchased on your behalf. PCS supports
  /// On-Demand Instances, Spot Instances, Interruptible Capacity Reservations,
  /// On-Demand Capacity Reservations, and Amazon EC2 Capacity Blocks for ML. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html">Amazon
  /// EC2 billing and purchasing options</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>. For more information about PCS support for Capacity
  /// Blocks, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html">Using
  /// Amazon EC2 Capacity Blocks for ML with PCS</a> in the <i>PCS User Guide</i>.
  /// For more information about PCS support for interruptible capacity
  /// reservations, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html">Using
  /// I-ODCRs with PCS</a> in the <i>PCS User Guide</i>. Choose On-Demand if you
  /// plan to use an On-Demand Capacity Reservation (ODCR). For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html">Using
  /// ODCRs with PCS</a>. If you don't provide this option, it defaults to
  /// On-Demand.
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
      arn: (json['arn'] as String?) ?? '',
      clusterId: (json['clusterId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      customLaunchTemplate: CustomLaunchTemplate.fromJson(
          (json['customLaunchTemplate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      iamInstanceProfileArn: (json['iamInstanceProfileArn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      instanceConfigs: ((json['instanceConfigs'] as List?) ?? const [])
          .nonNulls
          .map((e) => InstanceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      scalingConfiguration: ScalingConfiguration.fromJson(
          (json['scalingConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status:
          ComputeNodeGroupStatus.fromString((json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
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

class PurchaseOption {
  static const ondemand = PurchaseOption._('ONDEMAND');
  static const spot = PurchaseOption._('SPOT');
  static const capacityBlock = PurchaseOption._('CAPACITY_BLOCK');
  static const interruptibleCapacityReservation =
      PurchaseOption._('INTERRUPTIBLE_CAPACITY_RESERVATION');

  final String value;

  const PurchaseOption._(this.value);

  static const values = [
    ondemand,
    spot,
    capacityBlock,
    interruptibleCapacityReservation
  ];

  static PurchaseOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseOption._(value));

  @override
  bool operator ==(other) => other is PurchaseOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Amazon EC2 launch template PCS uses to launch compute nodes.
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
      id: (json['id'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
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
      maxInstanceCount: (json['maxInstanceCount'] as int?) ?? 0,
      minInstanceCount: (json['minInstanceCount'] as int?) ?? 0,
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

/// Additional configuration when you specify <code>SPOT</code> as the
/// <code>purchaseOption</code> for the <code>CreateComputeNodeGroup</code> API
/// action.
class SpotOptions {
  /// The Amazon EC2 allocation strategy PCS uses to provision EC2 instances. PCS
  /// supports <b>lowest price</b>, <b>capacity optimized</b>, and <b>price
  /// capacity optimized</b>. For more information, see <a
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

/// Additional options related to the Slurm scheduler.
class ComputeNodeGroupSlurmConfiguration {
  /// The time (in seconds) before an idle node is scaled down. If not specified,
  /// the cluster-level setting applies. This overrides the cluster-level
  /// <code>scaleDownIdleTimeInSeconds</code> setting. A value of <code>-1</code>
  /// removes the override and applies the cluster-level setting to this compute
  /// node group. Requires Slurm version 25.11 or later.
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ComputeNodeGroupSlurmConfiguration({
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
  });

  factory ComputeNodeGroupSlurmConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ComputeNodeGroupSlurmConfiguration(
      scaleDownIdleTimeInSeconds: json['scaleDownIdleTimeInSeconds'] as int?,
      slurmCustomSettings: (json['slurmCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => SlurmCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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

class SpotAllocationStrategy {
  static const lowestPrice = SpotAllocationStrategy._('lowest-price');
  static const capacityOptimized =
      SpotAllocationStrategy._('capacity-optimized');
  static const priceCapacityOptimized =
      SpotAllocationStrategy._('price-capacity-optimized');

  final String value;

  const SpotAllocationStrategy._(this.value);

  static const values = [
    lowestPrice,
    capacityOptimized,
    priceCapacityOptimized
  ];

  static SpotAllocationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpotAllocationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is SpotAllocationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An EC2 instance configuration PCS uses to launch compute nodes.
class InstanceConfig {
  /// The EC2 instance type that PCS can provision in the compute node group.
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

/// Additional options related to the Slurm scheduler.
class UpdateComputeNodeGroupSlurmConfigurationRequest {
  /// The time (in seconds) before an idle node is scaled down. If not specified,
  /// the cluster-level setting applies. This overrides the cluster-level
  /// <code>scaleDownIdleTimeInSeconds</code> setting. A value of <code>-1</code>
  /// removes the override and applies the cluster-level setting to this compute
  /// node group. Requires Slurm version 25.11 or later.
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  UpdateComputeNodeGroupSlurmConfigurationRequest({
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

/// Additional options related to the Slurm scheduler.
class ComputeNodeGroupSlurmConfigurationRequest {
  /// The time (in seconds) before an idle node is scaled down. If not specified,
  /// the cluster-level setting applies. This overrides the cluster-level
  /// <code>scaleDownIdleTimeInSeconds</code> setting. A value of <code>-1</code>
  /// removes the override and applies the cluster-level setting to this compute
  /// node group. Requires Slurm version 25.11 or later.
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  ComputeNodeGroupSlurmConfigurationRequest({
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
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

class ClusterStatus {
  static const creating = ClusterStatus._('CREATING');
  static const active = ClusterStatus._('ACTIVE');
  static const updating = ClusterStatus._('UPDATING');
  static const deleting = ClusterStatus._('DELETING');
  static const createFailed = ClusterStatus._('CREATE_FAILED');
  static const deleteFailed = ClusterStatus._('DELETE_FAILED');
  static const updateFailed = ClusterStatus._('UPDATE_FAILED');
  static const suspending = ClusterStatus._('SUSPENDING');
  static const suspended = ClusterStatus._('SUSPENDED');
  static const resuming = ClusterStatus._('RESUMING');

  final String value;

  const ClusterStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    deleteFailed,
    updateFailed,
    suspending,
    suspended,
    resuming
  ];

  static ClusterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterStatus._(value));

  @override
  bool operator ==(other) => other is ClusterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An endpoint available for interaction with the scheduler.
class Endpoint {
  /// The endpoint's connection port number.
  ///
  /// Example: <code>1234</code>
  final String port;

  /// For clusters that use IPv4, this is the endpoint's private IP address.
  ///
  /// Example: <code>10.1.2.3</code>
  ///
  /// For clusters configured to use IPv6, this is an empty string.
  final String privateIpAddress;

  /// Indicates the type of endpoint running at the specific IP address.
  final EndpointType type;

  /// The endpoint's IPv6 address.
  ///
  /// Example: <code>2001:db8::1</code>
  final String? ipv6Address;

  /// The endpoint's public IP address.
  ///
  /// Example: <code>192.0.2.1</code>
  final String? publicIpAddress;

  Endpoint({
    required this.port,
    required this.privateIpAddress,
    required this.type,
    this.ipv6Address,
    this.publicIpAddress,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      port: (json['port'] as String?) ?? '',
      privateIpAddress: (json['privateIpAddress'] as String?) ?? '',
      type: EndpointType.fromString((json['type'] as String?) ?? ''),
      ipv6Address: json['ipv6Address'] as String?,
      publicIpAddress: json['publicIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final privateIpAddress = this.privateIpAddress;
    final type = this.type;
    final ipv6Address = this.ipv6Address;
    final publicIpAddress = this.publicIpAddress;
    return {
      'port': port,
      'privateIpAddress': privateIpAddress,
      'type': type.value,
      if (ipv6Address != null) 'ipv6Address': ipv6Address,
      if (publicIpAddress != null) 'publicIpAddress': publicIpAddress,
    };
  }
}

class EndpointType {
  static const slurmctld = EndpointType._('SLURMCTLD');
  static const slurmdbd = EndpointType._('SLURMDBD');
  static const slurmrestd = EndpointType._('SLURMRESTD');

  final String value;

  const EndpointType._(this.value);

  static const values = [slurmctld, slurmdbd, slurmrestd];

  static EndpointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndpointType._(value));

  @override
  bool operator ==(other) => other is EndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// </note> <important>
  /// The resource enters the <code>SUSPENDING</code> and <code>SUSPENDED</code>
  /// states when the scheduler is beyond end of life and we have suspended the
  /// cluster. When in these states, you can't use the cluster. The cluster
  /// controller is down and all compute instances are terminated. The resources
  /// still count toward your service quotas. You can delete a resource if its
  /// status is <code>SUSPENDED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html">Frequently
  /// asked questions about Slurm versions in PCS</a> in the <i>PCS User
  /// Guide</i>.
  /// </important>
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
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      networking: Networking.fromJson(
          (json['networking'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      scheduler: Scheduler.fromJson(
          (json['scheduler'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      size: Size.fromString((json['size'] as String?) ?? ''),
      status: ClusterStatus.fromString((json['status'] as String?) ?? ''),
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

/// The cluster management and job scheduling software associated with the
/// cluster.
class Scheduler {
  /// The software PCS uses to manage cluster scaling and job scheduling.
  final SchedulerType type;

  /// The version of the specified scheduling software that PCS uses to manage
  /// cluster scaling and job scheduling. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions.html">Slurm
  /// versions in PCS</a> in the <i>PCS User Guide</i>.
  ///
  /// Valid Values: <code>23.11 | 24.05 | 24.11 | 25.05 | 25.11</code>
  final String version;

  Scheduler({
    required this.type,
    required this.version,
  });

  factory Scheduler.fromJson(Map<String, dynamic> json) {
    return Scheduler(
      type: SchedulerType.fromString((json['type'] as String?) ?? ''),
      version: (json['version'] as String?) ?? '',
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

class Size {
  static const small = Size._('SMALL');
  static const medium = Size._('MEDIUM');
  static const large = Size._('LARGE');

  final String value;

  const Size._(this.value);

  static const values = [small, medium, large];

  static Size fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Size._(value));

  @override
  bool operator ==(other) => other is Size && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional options related to the Slurm scheduler.
class ClusterSlurmConfiguration {
  /// The accounting configuration includes configurable settings for Slurm
  /// accounting.
  final Accounting? accounting;

  /// The shared Slurm key for authentication, also known as the <b>cluster
  /// secret</b>.
  final SlurmAuthKey? authKey;

  /// Additional Cgroup-specific configuration that directly maps to Cgroup
  /// settings.
  final List<CgroupCustomSetting>? cgroupCustomSettings;

  /// The JWT authentication configuration for Slurm REST API access.
  final JwtAuth? jwtAuth;

  /// The time (in seconds) before an idle node is scaled down.
  ///
  /// Default: <code>600</code>
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  /// The Slurm REST API configuration for the cluster.
  final SlurmRest? slurmRest;

  /// Additional SlurmDBD-specific configuration that directly maps to SlurmDBD
  /// settings.
  final List<SlurmdbdCustomSetting>? slurmdbdCustomSettings;

  ClusterSlurmConfiguration({
    this.accounting,
    this.authKey,
    this.cgroupCustomSettings,
    this.jwtAuth,
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
    this.slurmRest,
    this.slurmdbdCustomSettings,
  });

  factory ClusterSlurmConfiguration.fromJson(Map<String, dynamic> json) {
    return ClusterSlurmConfiguration(
      accounting: json['accounting'] != null
          ? Accounting.fromJson(json['accounting'] as Map<String, dynamic>)
          : null,
      authKey: json['authKey'] != null
          ? SlurmAuthKey.fromJson(json['authKey'] as Map<String, dynamic>)
          : null,
      cgroupCustomSettings: (json['cgroupCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => CgroupCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      jwtAuth: json['jwtAuth'] != null
          ? JwtAuth.fromJson(json['jwtAuth'] as Map<String, dynamic>)
          : null,
      scaleDownIdleTimeInSeconds: json['scaleDownIdleTimeInSeconds'] as int?,
      slurmCustomSettings: (json['slurmCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => SlurmCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      slurmRest: json['slurmRest'] != null
          ? SlurmRest.fromJson(json['slurmRest'] as Map<String, dynamic>)
          : null,
      slurmdbdCustomSettings: (json['slurmdbdCustomSettings'] as List?)
          ?.nonNulls
          .map((e) => SlurmdbdCustomSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounting = this.accounting;
    final authKey = this.authKey;
    final cgroupCustomSettings = this.cgroupCustomSettings;
    final jwtAuth = this.jwtAuth;
    final scaleDownIdleTimeInSeconds = this.scaleDownIdleTimeInSeconds;
    final slurmCustomSettings = this.slurmCustomSettings;
    final slurmRest = this.slurmRest;
    final slurmdbdCustomSettings = this.slurmdbdCustomSettings;
    return {
      if (accounting != null) 'accounting': accounting,
      if (authKey != null) 'authKey': authKey,
      if (cgroupCustomSettings != null)
        'cgroupCustomSettings': cgroupCustomSettings,
      if (jwtAuth != null) 'jwtAuth': jwtAuth,
      if (scaleDownIdleTimeInSeconds != null)
        'scaleDownIdleTimeInSeconds': scaleDownIdleTimeInSeconds,
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
      if (slurmRest != null) 'slurmRest': slurmRest,
      if (slurmdbdCustomSettings != null)
        'slurmdbdCustomSettings': slurmdbdCustomSettings,
    };
  }
}

/// The networking configuration for the cluster's control plane.
class Networking {
  /// The IP address version the cluster uses. The default is <code>IPV4</code>.
  final NetworkType? networkType;

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
  /// Destination: 0.0.0.0/0 (IPv4) or ::/0 (IPv6)
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

  /// The ID of the subnet where PCS creates an Elastic Network Interface (ENI) to
  /// enable communication between managed controllers and PCS resources. The
  /// subnet must have an available IP address, cannot reside in Outposts,
  /// Wavelength, or an Amazon Web Services Local Zone.
  ///
  /// Example: <code>subnet-abcd1234</code>
  final List<String>? subnetIds;

  Networking({
    this.networkType,
    this.securityGroupIds,
    this.subnetIds,
  });

  factory Networking.fromJson(Map<String, dynamic> json) {
    return Networking(
      networkType:
          (json['networkType'] as String?)?.let(NetworkType.fromString),
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
    final networkType = this.networkType;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (networkType != null) 'networkType': networkType.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

class NetworkType {
  static const ipv4 = NetworkType._('IPV4');
  static const ipv6 = NetworkType._('IPV6');

  final String value;

  const NetworkType._(this.value);

  static const values = [ipv4, ipv6];

  static NetworkType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NetworkType._(value));

  @override
  bool operator ==(other) => other is NetworkType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The shared Slurm key for authentication, also known as the <b>cluster
/// secret</b>.
class SlurmAuthKey {
  /// The Amazon Resource Name (ARN) of the shared Slurm key.
  final String secretArn;

  /// The version of the shared Slurm key.
  final String secretVersion;

  SlurmAuthKey({
    required this.secretArn,
    required this.secretVersion,
  });

  factory SlurmAuthKey.fromJson(Map<String, dynamic> json) {
    return SlurmAuthKey(
      secretArn: (json['secretArn'] as String?) ?? '',
      secretVersion: (json['secretVersion'] as String?) ?? '',
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

/// The JWT authentication configuration for Slurm REST API access.
class JwtAuth {
  /// The JWT key for Slurm REST API authentication.
  final JwtKey? jwtKey;

  JwtAuth({
    this.jwtKey,
  });

  factory JwtAuth.fromJson(Map<String, dynamic> json) {
    return JwtAuth(
      jwtKey: json['jwtKey'] != null
          ? JwtKey.fromJson(json['jwtKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jwtKey = this.jwtKey;
    return {
      if (jwtKey != null) 'jwtKey': jwtKey,
    };
  }
}

/// The accounting configuration includes configurable settings for Slurm
/// accounting. It's a property of the <b>ClusterSlurmConfiguration</b> object.
class Accounting {
  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means Slurm accounting is enabled.
  final AccountingMode mode;

  /// The default value for all purge settings for <code>slurmdbd.conf</code>. For
  /// more information, see the <a
  /// href="https://slurm.schedmd.com/slurmdbd.conf.html">slurmdbd.conf
  /// documentation at SchedMD</a>.
  ///
  /// The default value for <code>defaultPurgeTimeInDays</code> is
  /// <code>-1</code>.
  ///
  /// A value of <code>-1</code> means there is no purge time and records persist
  /// as long as the cluster exists.
  /// <important>
  /// <code>0</code> isn't a valid value.
  /// </important>
  final int? defaultPurgeTimeInDays;

  Accounting({
    required this.mode,
    this.defaultPurgeTimeInDays,
  });

  factory Accounting.fromJson(Map<String, dynamic> json) {
    return Accounting(
      mode: AccountingMode.fromString((json['mode'] as String?) ?? ''),
      defaultPurgeTimeInDays: json['defaultPurgeTimeInDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final defaultPurgeTimeInDays = this.defaultPurgeTimeInDays;
    return {
      'mode': mode.value,
      if (defaultPurgeTimeInDays != null)
        'defaultPurgeTimeInDays': defaultPurgeTimeInDays,
    };
  }
}

/// The Slurm REST API configuration includes settings for enabling and
/// configuring the Slurm REST API. It's a property of the
/// <b>ClusterSlurmConfiguration</b> object.
class SlurmRest {
  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means the Slurm REST API is enabled.
  final SlurmRestMode mode;

  SlurmRest({
    required this.mode,
  });

  factory SlurmRest.fromJson(Map<String, dynamic> json) {
    return SlurmRest(
      mode: SlurmRestMode.fromString((json['mode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'mode': mode.value,
    };
  }
}

class SlurmRestMode {
  static const standard = SlurmRestMode._('STANDARD');
  static const none = SlurmRestMode._('NONE');

  final String value;

  const SlurmRestMode._(this.value);

  static const values = [standard, none];

  static SlurmRestMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SlurmRestMode._(value));

  @override
  bool operator ==(other) => other is SlurmRestMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccountingMode {
  static const standard = AccountingMode._('STANDARD');
  static const none = AccountingMode._('NONE');

  final String value;

  const AccountingMode._(this.value);

  static const values = [standard, none];

  static AccountingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountingMode._(value));

  @override
  bool operator ==(other) => other is AccountingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The JWT key stored in Amazon Web Services Secrets Manager for Slurm REST API
/// authentication.
class JwtKey {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret containing the JWT key.
  final String secretArn;

  /// The version of the Amazon Web Services Secrets Manager secret containing the
  /// JWT key.
  final String secretVersion;

  JwtKey({
    required this.secretArn,
    required this.secretVersion,
  });

  factory JwtKey.fromJson(Map<String, dynamic> json) {
    return JwtKey(
      secretArn: (json['secretArn'] as String?) ?? '',
      secretVersion: (json['secretVersion'] as String?) ?? '',
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

/// Additional settings that directly map to Cgroup settings.
/// <important>
/// PCS supports a subset of Cgroup settings. For more information, see <a
/// href="https://docs.aws.amazon.com/pcs/latest/userguide/cgroup-custom-settings.html">Configuring
/// custom Cgroup settings in PCS</a> in the <i>PCS User Guide</i>.
/// </important>
class CgroupCustomSetting {
  /// PCS supports custom Cgroup settings for clusters. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/cgroup-custom-settings.html">Configuring
  /// custom Cgroup settings in PCS</a> in the <i>PCS User Guide</i>.
  final String parameterName;

  /// The values for the configured Cgroup settings.
  final String parameterValue;

  CgroupCustomSetting({
    required this.parameterName,
    required this.parameterValue,
  });

  factory CgroupCustomSetting.fromJson(Map<String, dynamic> json) {
    return CgroupCustomSetting(
      parameterName: (json['parameterName'] as String?) ?? '',
      parameterValue: (json['parameterValue'] as String?) ?? '',
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

/// Additional settings that directly map to SlurmDBD settings.
/// <important>
/// PCS supports a subset of SlurmDBD settings. For more information, see <a
/// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurmdbd-custom-settings.html">Configuring
/// custom SlurmDBD settings in PCS</a> in the <i>PCS User Guide</i>.
/// </important>
class SlurmdbdCustomSetting {
  /// PCS supports custom SlurmDBD settings for clusters. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurmdbd-custom-settings.html">Configuring
  /// custom SlurmDBD settings in PCS</a> in the <i>PCS User Guide</i>.
  final String parameterName;

  /// The values for the configured SlurmDBD settings.
  final String parameterValue;

  SlurmdbdCustomSetting({
    required this.parameterName,
    required this.parameterValue,
  });

  factory SlurmdbdCustomSetting.fromJson(Map<String, dynamic> json) {
    return SlurmdbdCustomSetting(
      parameterName: (json['parameterName'] as String?) ?? '',
      parameterValue: (json['parameterValue'] as String?) ?? '',
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

class SchedulerType {
  static const slurm = SchedulerType._('SLURM');

  final String value;

  const SchedulerType._(this.value);

  static const values = [slurm];

  static SchedulerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchedulerType._(value));

  @override
  bool operator ==(other) => other is SchedulerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional options related to the Slurm scheduler.
class UpdateClusterSlurmConfigurationRequest {
  /// The accounting configuration includes configurable settings for Slurm
  /// accounting.
  final UpdateAccountingRequest? accounting;

  /// Additional Cgroup-specific configuration that directly maps to Cgroup
  /// settings.
  final List<CgroupCustomSetting>? cgroupCustomSettings;

  /// The time (in seconds) before an idle node is scaled down.
  ///
  /// Default: <code>600</code>
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  /// The Slurm REST API configuration for the cluster.
  final UpdateSlurmRestRequest? slurmRest;

  /// Additional SlurmDBD-specific configuration that directly maps to SlurmDBD
  /// settings.
  final List<SlurmdbdCustomSetting>? slurmdbdCustomSettings;

  UpdateClusterSlurmConfigurationRequest({
    this.accounting,
    this.cgroupCustomSettings,
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
    this.slurmRest,
    this.slurmdbdCustomSettings,
  });

  Map<String, dynamic> toJson() {
    final accounting = this.accounting;
    final cgroupCustomSettings = this.cgroupCustomSettings;
    final scaleDownIdleTimeInSeconds = this.scaleDownIdleTimeInSeconds;
    final slurmCustomSettings = this.slurmCustomSettings;
    final slurmRest = this.slurmRest;
    final slurmdbdCustomSettings = this.slurmdbdCustomSettings;
    return {
      if (accounting != null) 'accounting': accounting,
      if (cgroupCustomSettings != null)
        'cgroupCustomSettings': cgroupCustomSettings,
      if (scaleDownIdleTimeInSeconds != null)
        'scaleDownIdleTimeInSeconds': scaleDownIdleTimeInSeconds,
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
      if (slurmRest != null) 'slurmRest': slurmRest,
      if (slurmdbdCustomSettings != null)
        'slurmdbdCustomSettings': slurmdbdCustomSettings,
    };
  }
}

/// The accounting configuration includes configurable settings for Slurm
/// accounting.
class UpdateAccountingRequest {
  /// The default value for all purge settings for <code>slurmdbd.conf</code>. For
  /// more information, see the <a
  /// href="https://slurm.schedmd.com/slurmdbd.conf.html">slurmdbd.conf
  /// documentation at SchedMD</a>.
  ///
  /// The default value for <code>defaultPurgeTimeInDays</code> is
  /// <code>-1</code>.
  ///
  /// A value of <code>-1</code> means there is no purge time and records persist
  /// as long as the cluster exists.
  /// <important>
  /// <code>0</code> isn't a valid value.
  /// </important>
  final int? defaultPurgeTimeInDays;

  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means Slurm accounting is enabled.
  final AccountingMode? mode;

  UpdateAccountingRequest({
    this.defaultPurgeTimeInDays,
    this.mode,
  });

  Map<String, dynamic> toJson() {
    final defaultPurgeTimeInDays = this.defaultPurgeTimeInDays;
    final mode = this.mode;
    return {
      if (defaultPurgeTimeInDays != null)
        'defaultPurgeTimeInDays': defaultPurgeTimeInDays,
      if (mode != null) 'mode': mode.value,
    };
  }
}

/// The Slurm REST API configuration includes settings for enabling and
/// configuring the Slurm REST API.
class UpdateSlurmRestRequest {
  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means the Slurm REST API is enabled.
  final SlurmRestMode? mode;

  UpdateSlurmRestRequest({
    this.mode,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'mode': mode.value,
    };
  }
}

/// The cluster management and job scheduling software associated with the
/// cluster.
class SchedulerRequest {
  /// The software PCS uses to manage cluster scaling and job scheduling.
  final SchedulerType type;

  /// The version of the specified scheduling software that PCS uses to manage
  /// cluster scaling and job scheduling. For more information, see <a
  /// href="https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions.html">Slurm
  /// versions in PCS</a> in the <i>PCS User Guide</i>.
  ///
  /// Valid Values: <code>24.11 | 25.05 | 25.11</code>
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

/// The networking configuration for the cluster's control plane.
class NetworkingRequest {
  /// The IP address version the cluster uses. The default is <code>IPV4</code>.
  final NetworkType? networkType;

  /// A list of security group IDs associated with the Elastic Network Interface
  /// (ENI) created in subnets.
  final List<String>? securityGroupIds;

  /// The list of subnet IDs where PCS creates an Elastic Network Interface (ENI)
  /// to enable communication between managed controllers and PCS resources.
  /// Subnet IDs have the form <code>subnet-0123456789abcdef0</code>.
  ///
  /// Subnets can't be in Outposts, Wavelength or an Amazon Web Services Local
  /// Zone.
  /// <note>
  /// PCS currently supports only 1 subnet in this list.
  /// </note>
  final List<String>? subnetIds;

  NetworkingRequest({
    this.networkType,
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final networkType = this.networkType;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (networkType != null) 'networkType': networkType.value,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// Additional options related to the Slurm scheduler.
class ClusterSlurmConfigurationRequest {
  /// The accounting configuration includes configurable settings for Slurm
  /// accounting.
  final AccountingRequest? accounting;

  /// Additional Cgroup-specific configuration that directly maps to Cgroup
  /// settings.
  final List<CgroupCustomSetting>? cgroupCustomSettings;

  /// The time (in seconds) before an idle node is scaled down.
  ///
  /// Default: <code>600</code>
  final int? scaleDownIdleTimeInSeconds;

  /// Additional Slurm-specific configuration that directly maps to Slurm
  /// settings.
  final List<SlurmCustomSetting>? slurmCustomSettings;

  /// The Slurm REST API configuration for the cluster.
  final SlurmRestRequest? slurmRest;

  /// Additional SlurmDBD-specific configuration that directly maps to SlurmDBD
  /// settings.
  final List<SlurmdbdCustomSetting>? slurmdbdCustomSettings;

  ClusterSlurmConfigurationRequest({
    this.accounting,
    this.cgroupCustomSettings,
    this.scaleDownIdleTimeInSeconds,
    this.slurmCustomSettings,
    this.slurmRest,
    this.slurmdbdCustomSettings,
  });

  Map<String, dynamic> toJson() {
    final accounting = this.accounting;
    final cgroupCustomSettings = this.cgroupCustomSettings;
    final scaleDownIdleTimeInSeconds = this.scaleDownIdleTimeInSeconds;
    final slurmCustomSettings = this.slurmCustomSettings;
    final slurmRest = this.slurmRest;
    final slurmdbdCustomSettings = this.slurmdbdCustomSettings;
    return {
      if (accounting != null) 'accounting': accounting,
      if (cgroupCustomSettings != null)
        'cgroupCustomSettings': cgroupCustomSettings,
      if (scaleDownIdleTimeInSeconds != null)
        'scaleDownIdleTimeInSeconds': scaleDownIdleTimeInSeconds,
      if (slurmCustomSettings != null)
        'slurmCustomSettings': slurmCustomSettings,
      if (slurmRest != null) 'slurmRest': slurmRest,
      if (slurmdbdCustomSettings != null)
        'slurmdbdCustomSettings': slurmdbdCustomSettings,
    };
  }
}

/// The accounting configuration includes configurable settings for Slurm
/// accounting. It's a property of the <b>ClusterSlurmConfiguration</b> object.
class AccountingRequest {
  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means Slurm accounting is enabled.
  final AccountingMode mode;

  /// The default value for all purge settings for <code>slurmdbd.conf</code>. For
  /// more information, see the <a
  /// href="https://slurm.schedmd.com/slurmdbd.conf.html">slurmdbd.conf
  /// documentation at SchedMD</a>.
  ///
  /// The default value for <code>defaultPurgeTimeInDays</code> is
  /// <code>-1</code>.
  ///
  /// A value of <code>-1</code> means there is no purge time and records persist
  /// as long as the cluster exists.
  /// <important>
  /// <code>0</code> isn't a valid value.
  /// </important>
  final int? defaultPurgeTimeInDays;

  AccountingRequest({
    required this.mode,
    this.defaultPurgeTimeInDays,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final defaultPurgeTimeInDays = this.defaultPurgeTimeInDays;
    return {
      'mode': mode.value,
      if (defaultPurgeTimeInDays != null)
        'defaultPurgeTimeInDays': defaultPurgeTimeInDays,
    };
  }
}

/// The Slurm REST API configuration includes settings for enabling and
/// configuring the Slurm REST API. It's a property of the
/// <b>ClusterSlurmConfiguration</b> object.
class SlurmRestRequest {
  /// The default value for <code>mode</code> is <code>NONE</code>. A value of
  /// <code>STANDARD</code> means the Slurm REST API is enabled.
  final SlurmRestMode mode;

  SlurmRestRequest({
    required this.mode,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      'mode': mode.value,
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
