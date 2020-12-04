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

part 'eks-2017-11-01.g.dart';

/// Amazon Elastic Kubernetes Service (Amazon EKS) is a managed service that
/// makes it easy for you to run Kubernetes on AWS without needing to stand up
/// or maintain your own Kubernetes control plane. Kubernetes is an open-source
/// system for automating the deployment, scaling, and management of
/// containerized applications.
///
/// Amazon EKS runs up-to-date versions of the open-source Kubernetes software,
/// so you can use all the existing plugins and tooling from the Kubernetes
/// community. Applications running on Amazon EKS are fully compatible with
/// applications running on any standard Kubernetes environment, whether running
/// in on-premises data centers or public clouds. This means that you can easily
/// migrate any standard Kubernetes application to Amazon EKS without any code
/// modification required.
class EKS {
  final _s.RestJsonProtocol _protocol;
  EKS({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'eks',
            signingName: 'eks',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an Amazon EKS control plane.
  ///
  /// The Amazon EKS control plane consists of control plane instances that run
  /// the Kubernetes software, such as <code>etcd</code> and the API server. The
  /// control plane runs in an account managed by AWS, and the Kubernetes API is
  /// exposed via the Amazon EKS API server endpoint. Each Amazon EKS cluster
  /// control plane is single-tenant and unique and runs on its own set of
  /// Amazon EC2 instances.
  ///
  /// The cluster control plane is provisioned across multiple Availability
  /// Zones and fronted by an Elastic Load Balancing Network Load Balancer.
  /// Amazon EKS also provisions elastic network interfaces in your VPC subnets
  /// to provide connectivity from the control plane instances to the worker
  /// nodes (for example, to support <code>kubectl exec</code>,
  /// <code>logs</code>, and <code>proxy</code> data flows).
  ///
  /// Amazon EKS worker nodes run in your AWS account and connect to your
  /// cluster's control plane via the Kubernetes API server endpoint and a
  /// certificate file that is created for your cluster.
  ///
  /// You can use the <code>endpointPublicAccess</code> and
  /// <code>endpointPrivateAccess</code> parameters to enable or disable public
  /// and private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  ///
  /// You can use the <code>logging</code> parameter to enable or disable
  /// exporting the Kubernetes control plane logs for your cluster to CloudWatch
  /// Logs. By default, cluster control plane logs aren't exported to CloudWatch
  /// Logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS Cluster Control Plane Logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// </note>
  /// Cluster creation typically takes between 10 and 15 minutes. After you
  /// create an Amazon EKS cluster, you must configure your Kubernetes tooling
  /// to communicate with the API server and launch worker nodes into your
  /// cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html">Managing
  /// Cluster Authentication</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html">Launching
  /// Amazon EKS Worker Nodes</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnsupportedAvailabilityZoneException].
  ///
  /// Parameter [name] :
  /// The unique name to give to your cluster.
  ///
  /// Parameter [resourcesVpcConfig] :
  /// The VPC configuration used by the cluster control plane. Amazon EKS VPC
  /// resources have specific requirements to work properly with Kubernetes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">Cluster
  /// VPC Considerations</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Cluster
  /// Security Group Considerations</a> in the <i>Amazon EKS User Guide</i>. You
  /// must specify at least two subnets. You can specify up to five security
  /// groups, but we recommend that you use a dedicated security group for your
  /// cluster control plane.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions
  /// for Amazon EKS to make calls to other AWS API operations on your behalf.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html">Amazon
  /// EKS Service IAM Role</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [encryptionConfig] :
  /// The encryption configuration for the cluster.
  ///
  /// Parameter [logging] :
  /// Enable or disable exporting the Kubernetes control plane logs for your
  /// cluster to CloudWatch Logs. By default, cluster control plane logs aren't
  /// exported to CloudWatch Logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS Cluster Control Plane Logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the cluster to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define.
  ///
  /// Parameter [version] :
  /// The desired Kubernetes version for your cluster. If you don't specify a
  /// value here, the latest version available in Amazon EKS is used.
  Future<CreateClusterResponse> createCluster({
    @_s.required String name,
    @_s.required VpcConfigRequest resourcesVpcConfig,
    @_s.required String roleArn,
    String clientRequestToken,
    List<EncryptionConfig> encryptionConfig,
    Logging logging,
    Map<String, String> tags,
    String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[0-9A-Za-z][A-Za-z0-9\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourcesVpcConfig, 'resourcesVpcConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $payload = <String, dynamic>{
      'name': name,
      'resourcesVpcConfig': resourcesVpcConfig,
      'roleArn': roleArn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (logging != null) 'logging': logging,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClusterResponse.fromJson(response);
  }

  /// Creates an AWS Fargate profile for your Amazon EKS cluster. You must have
  /// at least one Fargate profile in a cluster to be able to run pods on
  /// Fargate.
  ///
  /// The Fargate profile allows an administrator to declare which pods run on
  /// Fargate and specify which pods run on which Fargate profile. This
  /// declaration is done through the profile’s selectors. Each profile can have
  /// up to five selectors that contain a namespace and labels. A namespace is
  /// required for every selector. The label field consists of multiple optional
  /// key-value pairs. Pods that match the selectors are scheduled on Fargate.
  /// If a to-be-scheduled pod matches any of the selectors in the Fargate
  /// profile, then that pod is run on Fargate.
  ///
  /// When you create a Fargate profile, you must specify a pod execution role
  /// to use with the pods that are scheduled with the profile. This role is
  /// added to the cluster's Kubernetes <a
  /// href="https://kubernetes.io/docs/admin/authorization/rbac/">Role Based
  /// Access Control</a> (RBAC) for authorization so that the
  /// <code>kubelet</code> that is running on the Fargate infrastructure can
  /// register with your Amazon EKS cluster so that it can appear in your
  /// cluster as a node. The pod execution role also provides IAM permissions to
  /// the Fargate infrastructure to allow read access to Amazon ECR image
  /// repositories. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">Pod
  /// Execution Role</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Fargate profiles are immutable. However, you can create a new updated
  /// profile to replace an existing profile and then delete the original after
  /// the updated profile has finished creating.
  ///
  /// If any Fargate profiles in a cluster are in the <code>DELETING</code>
  /// status, you must wait for that Fargate profile to finish deleting before
  /// you can create any other profiles in that cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/fargate-profile.html">AWS
  /// Fargate Profile</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedAvailabilityZoneException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster to apply the Fargate profile to.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile.
  ///
  /// Parameter [podExecutionRoleArn] :
  /// The Amazon Resource Name (ARN) of the pod execution role to use for pods
  /// that match the selectors in the Fargate profile. The pod execution role
  /// allows Fargate infrastructure to register with your cluster as a node, and
  /// it provides read access to Amazon ECR image repositories. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">Pod
  /// Execution Role</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [selectors] :
  /// The selectors to match for pods to use this Fargate profile. Each selector
  /// must have an associated namespace. Optionally, you can also specify labels
  /// for a namespace. You may specify up to five selectors in a Fargate
  /// profile.
  ///
  /// Parameter [subnets] :
  /// The IDs of subnets to launch your pods into. At this time, pods running on
  /// Fargate are not assigned public IP addresses, so only private subnets
  /// (with no direct route to an Internet Gateway) are accepted for this
  /// parameter.
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the Fargate profile to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both
  /// of which you define. Fargate profile tags do not propagate to any other
  /// resources associated with the Fargate profile, such as the pods that are
  /// scheduled with it.
  Future<CreateFargateProfileResponse> createFargateProfile({
    @_s.required String clusterName,
    @_s.required String fargateProfileName,
    @_s.required String podExecutionRoleArn,
    String clientRequestToken,
    List<FargateProfileSelector> selectors,
    List<String> subnets,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(fargateProfileName, 'fargateProfileName');
    ArgumentError.checkNotNull(podExecutionRoleArn, 'podExecutionRoleArn');
    final $payload = <String, dynamic>{
      'fargateProfileName': fargateProfileName,
      'podExecutionRoleArn': podExecutionRoleArn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (selectors != null) 'selectors': selectors,
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFargateProfileResponse.fromJson(response);
  }

  /// Creates a managed worker node group for an Amazon EKS cluster. You can
  /// only create a node group for your cluster that is equal to the current
  /// Kubernetes version for the cluster. All node groups are created with the
  /// latest AMI release version for the respective minor Kubernetes version of
  /// the cluster.
  ///
  /// An Amazon EKS managed node group is an Amazon EC2 Auto Scaling group and
  /// associated Amazon EC2 instances that are managed by AWS for an Amazon EKS
  /// cluster. Each node group uses a version of the Amazon EKS-optimized Amazon
  /// Linux 2 AMI. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html">Managed
  /// Node Groups</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to create the node group in.
  ///
  /// Parameter [nodeRole] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with your node
  /// group. The Amazon EKS worker node <code>kubelet</code> daemon makes calls
  /// to AWS APIs on your behalf. Worker nodes receive permissions for these API
  /// calls through an IAM instance profile and associated policies. Before you
  /// can launch worker nodes and register them into a cluster, you must create
  /// an IAM role for those worker nodes to use when they are launched. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/worker_node_IAM_role.html">Amazon
  /// EKS Worker Node IAM Role</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
  /// Parameter [nodegroupName] :
  /// The unique name to give your node group.
  ///
  /// Parameter [subnets] :
  /// The subnets to use for the Auto Scaling group that is created for your
  /// node group. These subnets must have the tag key
  /// <code>kubernetes.io/cluster/CLUSTER_NAME</code> with a value of
  /// <code>shared</code>, where <code>CLUSTER_NAME</code> is replaced with the
  /// name of your cluster.
  ///
  /// Parameter [amiType] :
  /// The AMI type for your node group. GPU instance types should use the
  /// <code>AL2_x86_64_GPU</code> AMI type, which uses the Amazon EKS-optimized
  /// Linux AMI with GPU support. Non-GPU instances should use the
  /// <code>AL2_x86_64</code> AMI type, which uses the Amazon EKS-optimized
  /// Linux AMI.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [diskSize] :
  /// The root device disk size (in GiB) for your node group instances. The
  /// default disk size is 20 GiB.
  ///
  /// Parameter [instanceTypes] :
  /// The instance type to use for your node group. Currently, you can specify a
  /// single instance type for a node group. The default value for this
  /// parameter is <code>t3.medium</code>. If you choose a GPU instance type, be
  /// sure to specify the <code>AL2_x86_64_GPU</code> with the
  /// <code>amiType</code> parameter.
  ///
  /// Parameter [labels] :
  /// The Kubernetes labels to be applied to the nodes in the node group when
  /// they are created.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS-optimized AMI to use with your node
  /// group. By default, the latest available AMI version for the node group's
  /// current Kubernetes version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS-Optimized Linux AMI Versions</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Parameter [remoteAccess] :
  /// The remote access (SSH) configuration to use with your node group.
  ///
  /// Parameter [scalingConfig] :
  /// The scaling configuration details for the Auto Scaling group that is
  /// created for your node group.
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the node group to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Node group tags do not propagate to any other resources
  /// associated with the node group, such as the Amazon EC2 instances or
  /// subnets.
  ///
  /// Parameter [version] :
  /// The Kubernetes version to use for your managed nodes. By default, the
  /// Kubernetes version of the cluster is used, and this is the only accepted
  /// specified value.
  Future<CreateNodegroupResponse> createNodegroup({
    @_s.required String clusterName,
    @_s.required String nodeRole,
    @_s.required String nodegroupName,
    @_s.required List<String> subnets,
    AMITypes amiType,
    String clientRequestToken,
    int diskSize,
    List<String> instanceTypes,
    Map<String, String> labels,
    String releaseVersion,
    RemoteAccessConfig remoteAccess,
    NodegroupScalingConfig scalingConfig,
    Map<String, String> tags,
    String version,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodeRole, 'nodeRole');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    ArgumentError.checkNotNull(subnets, 'subnets');
    final $payload = <String, dynamic>{
      'nodeRole': nodeRole,
      'nodegroupName': nodegroupName,
      'subnets': subnets,
      if (amiType != null) 'amiType': amiType.toValue(),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (diskSize != null) 'diskSize': diskSize,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (labels != null) 'labels': labels,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (remoteAccess != null) 'remoteAccess': remoteAccess,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/node-groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNodegroupResponse.fromJson(response);
  }

  /// Deletes the Amazon EKS cluster control plane.
  ///
  /// If you have active services in your cluster that are associated with a
  /// load balancer, you must delete those services before deleting the cluster
  /// so that the load balancers are deleted properly. Otherwise, you can have
  /// orphaned resources in your VPC that prevent you from being able to delete
  /// the VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html">Deleting
  /// a Cluster</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// If you have managed node groups or Fargate profiles attached to the
  /// cluster, you must delete them first. For more information, see
  /// <a>DeleteNodegroup</a> and <a>DeleteFargateProfile</a>.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// The name of the cluster to delete.
  Future<DeleteClusterResponse> deleteCluster({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/clusters/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterResponse.fromJson(response);
  }

  /// Deletes an AWS Fargate profile.
  ///
  /// When you delete a Fargate profile, any pods running on Fargate that were
  /// created with the profile are deleted. If those pods match another Fargate
  /// profile, then they are scheduled on Fargate with that profile. If they no
  /// longer match any Fargate profiles, then they are not scheduled on Fargate
  /// and they may remain in a pending state.
  ///
  /// Only one Fargate profile in a cluster can be in the <code>DELETING</code>
  /// status at a time. You must wait for a Fargate profile to finish deleting
  /// before you can delete any other profiles in that cluster.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster associated with the Fargate profile to
  /// delete.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile to delete.
  Future<DeleteFargateProfileResponse> deleteFargateProfile({
    @_s.required String clusterName,
    @_s.required String fargateProfileName,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(fargateProfileName, 'fargateProfileName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles/${Uri.encodeComponent(fargateProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFargateProfileResponse.fromJson(response);
  }

  /// Deletes an Amazon EKS node group for a cluster.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that is associated with your node
  /// group.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the node group to delete.
  Future<DeleteNodegroupResponse> deleteNodegroup({
    @_s.required String clusterName,
    @_s.required String nodegroupName,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNodegroupResponse.fromJson(response);
  }

  /// Returns descriptive information about an Amazon EKS cluster.
  ///
  /// The API server endpoint and certificate authority data returned by this
  /// operation are required for <code>kubelet</code> and <code>kubectl</code>
  /// to communicate with your Kubernetes API server. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html">Create
  /// a kubeconfig for Amazon EKS</a>.
  /// <note>
  /// The API server endpoint and certificate authority data aren't available
  /// until the cluster reaches the <code>ACTIVE</code> state.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// The name of the cluster to describe.
  Future<DescribeClusterResponse> describeCluster({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  /// Returns descriptive information about an AWS Fargate profile.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster associated with the Fargate profile.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile to describe.
  Future<DescribeFargateProfileResponse> describeFargateProfile({
    @_s.required String clusterName,
    @_s.required String fargateProfileName,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(fargateProfileName, 'fargateProfileName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles/${Uri.encodeComponent(fargateProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFargateProfileResponse.fromJson(response);
  }

  /// Returns descriptive information about an Amazon EKS node group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster associated with the node group.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the node group to describe.
  Future<DescribeNodegroupResponse> describeNodegroup({
    @_s.required String clusterName,
    @_s.required String nodegroupName,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNodegroupResponse.fromJson(response);
  }

  /// Returns descriptive information about an update against your Amazon EKS
  /// cluster or associated managed node group.
  ///
  /// When the status of the update is <code>Succeeded</code>, the update is
  /// complete. If an update fails, the status is <code>Failed</code>, and an
  /// error detail explains the reason for the failure.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon EKS cluster associated with the update.
  ///
  /// Parameter [updateId] :
  /// The ID of the update to describe.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the Amazon EKS node group associated with the update.
  Future<DescribeUpdateResponse> describeUpdate({
    @_s.required String name,
    @_s.required String updateId,
    String nodegroupName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(updateId, 'updateId');
    final $query = <String, List<String>>{
      if (nodegroupName != null) 'nodegroupName': [nodegroupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(name)}/updates/${Uri.encodeComponent(updateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUpdateResponse.fromJson(response);
  }

  /// Lists the Amazon EKS clusters in your AWS account in the specified Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results returned by
  /// <code>ListClusters</code> in paginated output. When you use this
  /// parameter, <code>ListClusters</code> returns only <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. You can see the remaining results of the initial request by
  /// sending another <code>ListClusters</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListClusters</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListClusters</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListClustersResponse> listClusters({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClustersResponse.fromJson(response);
  }

  /// Lists the AWS Fargate profiles associated with the specified cluster in
  /// your AWS account in the specified Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that you would like to listFargate
  /// profiles in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Fargate profile results returned by
  /// <code>ListFargateProfiles</code> in paginated output. When you use this
  /// parameter, <code>ListFargateProfiles</code> returns only
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListFargateProfiles</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If you don't use this parameter,
  /// <code>ListFargateProfiles</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListFargateProfiles</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListFargateProfilesResponse> listFargateProfiles({
    @_s.required String clusterName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFargateProfilesResponse.fromJson(response);
  }

  /// Lists the Amazon EKS managed node groups associated with the specified
  /// cluster in your AWS account in the specified Region. Self-managed node
  /// groups are not listed.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that you would like to list node groups
  /// in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of node group results returned by
  /// <code>ListNodegroups</code> in paginated output. When you use this
  /// parameter, <code>ListNodegroups</code> returns only
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListNodegroups</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If you don't use this parameter,
  /// <code>ListNodegroups</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListNodegroups</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListNodegroupsResponse> listNodegroups({
    @_s.required String clusterName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/node-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodegroupsResponse.fromJson(response);
  }

  /// List the tags for an Amazon EKS resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the supported resources are Amazon EKS clusters
  /// and managed node groups.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the updates associated with an Amazon EKS cluster or managed node
  /// group in your AWS account, in the specified Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon EKS cluster to list updates for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of update results returned by <code>ListUpdates</code>
  /// in paginated output. When you use this parameter, <code>ListUpdates</code>
  /// returns only <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListUpdates</code> request
  /// with the returned <code>nextToken</code> value. This value can be between
  /// 1 and 100. If you don't use this parameter, <code>ListUpdates</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListUpdates</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the Amazon EKS managed node group to list updates for.
  Future<ListUpdatesResponse> listUpdates({
    @_s.required String name,
    int maxResults,
    String nextToken,
    String nodegroupName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (nodegroupName != null) 'nodegroupName': [nodegroupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters/${Uri.encodeComponent(name)}/updates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUpdatesResponse.fromJson(response);
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they are not changed. When a resource is
  /// deleted, the tags associated with that resource are deleted as well. Tags
  /// that you create for Amazon EKS resources do not propagate to any other
  /// resources associated with the cluster. For example, if you tag a cluster
  /// with this operation, that tag does not automatically propagate to the
  /// subnets and worker nodes associated with the cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to add tags.
  /// Currently, the supported resources are Amazon EKS clusters and managed
  /// node groups.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to delete tags.
  /// Currently, the supported resources are Amazon EKS clusters and managed
  /// node groups.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates an Amazon EKS cluster configuration. Your cluster continues to
  /// function during the update. The response output includes an update ID that
  /// you can use to track the status of your cluster update with the
  /// <a>DescribeUpdate</a> API operation.
  ///
  /// You can use this API operation to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS Cluster Control Plane Logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// </note>
  /// You can also use this API operation to enable or disable public and
  /// private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  /// <important>
  /// At this time, you can not update the subnets or security group IDs for an
  /// existing cluster.
  /// </important>
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to
  /// <code>UPDATING</code> (this status transition is eventually consistent).
  /// When the update is complete (either <code>Failed</code> or
  /// <code>Successful</code>), the cluster status moves to <code>Active</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon EKS cluster to update.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [logging] :
  /// Enable or disable exporting the Kubernetes control plane logs for your
  /// cluster to CloudWatch Logs. By default, cluster control plane logs aren't
  /// exported to CloudWatch Logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS Cluster Control Plane Logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  /// </note>
  Future<UpdateClusterConfigResponse> updateClusterConfig({
    @_s.required String name,
    String clientRequestToken,
    Logging logging,
    VpcConfigRequest resourcesVpcConfig,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (logging != null) 'logging': logging,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(name)}/update-config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterConfigResponse.fromJson(response);
  }

  /// Updates an Amazon EKS cluster to the specified Kubernetes version. Your
  /// cluster continues to function during the update. The response output
  /// includes an update ID that you can use to track the status of your cluster
  /// update with the <a>DescribeUpdate</a> API operation.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to
  /// <code>UPDATING</code> (this status transition is eventually consistent).
  /// When the update is complete (either <code>Failed</code> or
  /// <code>Successful</code>), the cluster status moves to <code>Active</code>.
  ///
  /// If your cluster has managed node groups attached to it, all of your node
  /// groups’ Kubernetes versions must match the cluster’s Kubernetes version in
  /// order to update the cluster to a new Kubernetes version.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon EKS cluster to update.
  ///
  /// Parameter [version] :
  /// The desired Kubernetes version following a successful update.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<UpdateClusterVersionResponse> updateClusterVersion({
    @_s.required String name,
    @_s.required String version,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(version, 'version');
    final $payload = <String, dynamic>{
      'version': version,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(name)}/updates',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClusterVersionResponse.fromJson(response);
  }

  /// Updates an Amazon EKS managed node group configuration. Your node group
  /// continues to function during the update. The response output includes an
  /// update ID that you can use to track the status of your node group update
  /// with the <a>DescribeUpdate</a> API operation. Currently you can update the
  /// Kubernetes labels for a node group or the scaling configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that the managed node group resides in.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the managed node group to update.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [labels] :
  /// The Kubernetes labels to be applied to the nodes in the node group after
  /// the update.
  ///
  /// Parameter [scalingConfig] :
  /// The scaling configuration details for the Auto Scaling group after the
  /// update.
  Future<UpdateNodegroupConfigResponse> updateNodegroupConfig({
    @_s.required String clusterName,
    @_s.required String nodegroupName,
    String clientRequestToken,
    UpdateLabelsPayload labels,
    NodegroupScalingConfig scalingConfig,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final $payload = <String, dynamic>{
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (labels != null) 'labels': labels,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}/update-config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNodegroupConfigResponse.fromJson(response);
  }

  /// Updates the Kubernetes version or AMI version of an Amazon EKS managed
  /// node group.
  ///
  /// You can update to the latest available AMI version of a node group's
  /// current Kubernetes version by not specifying a Kubernetes version in the
  /// request. You can update to the latest AMI version of your cluster's
  /// current Kubernetes version by specifying your cluster's Kubernetes version
  /// in the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS-Optimized Linux AMI Versions</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// You cannot roll back a node group to an earlier Kubernetes version or AMI
  /// version.
  ///
  /// When a node in a managed node group is terminated due to a scaling action
  /// or update, the pods in that node are drained first. Amazon EKS attempts to
  /// drain the nodes gracefully and will fail if it is unable to do so. You can
  /// <code>force</code> the update if Amazon EKS is unable to drain the nodes
  /// as a result of a pod disruption budget issue.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that is associated with the managed
  /// node group to update.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the managed node group to update.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [force] :
  /// Force the update if the existing node group's pods are unable to be
  /// drained due to a pod disruption budget issue. If an update fails because
  /// pods could not be drained, you can force the update after it fails to
  /// terminate the old node whether or not any pods are running on the node.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS-optimized AMI to use for the update. By
  /// default, the latest available AMI version for the node group's Kubernetes
  /// version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS-Optimized Linux AMI Versions </a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Parameter [version] :
  /// The Kubernetes version to update to. If no version is specified, then the
  /// Kubernetes version of the node group does not change. You can specify the
  /// Kubernetes version of the cluster to update the node group to the latest
  /// AMI version of the cluster's Kubernetes version.
  Future<UpdateNodegroupVersionResponse> updateNodegroupVersion({
    @_s.required String clusterName,
    @_s.required String nodegroupName,
    String clientRequestToken,
    bool force,
    String releaseVersion,
    String version,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final $payload = <String, dynamic>{
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (force != null) 'force': force,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}/update-version',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNodegroupVersionResponse.fromJson(response);
  }
}

enum AMITypes {
  @_s.JsonValue('AL2_x86_64')
  al2X86_64,
  @_s.JsonValue('AL2_x86_64_GPU')
  al2X86_64Gpu,
}

extension on AMITypes {
  String toValue() {
    switch (this) {
      case AMITypes.al2X86_64:
        return 'AL2_x86_64';
      case AMITypes.al2X86_64Gpu:
        return 'AL2_x86_64_GPU';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An Auto Scaling group that is associated with an Amazon EKS managed node
/// group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingGroup {
  /// The name of the Auto Scaling group associated with an Amazon EKS managed
  /// node group.
  @_s.JsonKey(name: 'name')
  final String name;

  AutoScalingGroup({
    this.name,
  });
  factory AutoScalingGroup.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingGroupFromJson(json);
}

/// An object representing the <code>certificate-authority-data</code> for your
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificate {
  /// The Base64-encoded certificate data required to communicate with your
  /// cluster. Add this to the <code>certificate-authority-data</code> section of
  /// the <code>kubeconfig</code> file for your cluster.
  @_s.JsonKey(name: 'data')
  final String data;

  Certificate({
    this.data,
  });
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

/// An object representing an Amazon EKS cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cluster {
  /// The Amazon Resource Name (ARN) of the cluster.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The <code>certificate-authority-data</code> for your cluster.
  @_s.JsonKey(name: 'certificateAuthority')
  final Certificate certificateAuthority;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The Unix epoch timestamp in seconds for when the cluster was created.
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The encryption configuration for the cluster.
  @_s.JsonKey(name: 'encryptionConfig')
  final List<EncryptionConfig> encryptionConfig;

  /// The endpoint for your Kubernetes API server.
  @_s.JsonKey(name: 'endpoint')
  final String endpoint;

  /// The identity provider information for the cluster.
  @_s.JsonKey(name: 'identity')
  final Identity identity;

  /// The logging configuration for your cluster.
  @_s.JsonKey(name: 'logging')
  final Logging logging;

  /// The name of the cluster.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The platform version of your Amazon EKS cluster. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/platform-versions.html">Platform
  /// Versions</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  @_s.JsonKey(name: 'platformVersion')
  final String platformVersion;

  /// The VPC configuration used by the cluster control plane. Amazon EKS VPC
  /// resources have specific requirements to work properly with Kubernetes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">Cluster
  /// VPC Considerations</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Cluster
  /// Security Group Considerations</a> in the <i>Amazon EKS User Guide</i>.
  @_s.JsonKey(name: 'resourcesVpcConfig')
  final VpcConfigResponse resourcesVpcConfig;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions for
  /// the Kubernetes control plane to make calls to AWS API operations on your
  /// behalf.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The current status of the cluster.
  @_s.JsonKey(name: 'status')
  final ClusterStatus status;

  /// The metadata that you apply to the cluster to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Cluster tags do not propagate to any other resources
  /// associated with the cluster.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The Kubernetes server version for the cluster.
  @_s.JsonKey(name: 'version')
  final String version;

  Cluster({
    this.arn,
    this.certificateAuthority,
    this.clientRequestToken,
    this.createdAt,
    this.encryptionConfig,
    this.endpoint,
    this.identity,
    this.logging,
    this.name,
    this.platformVersion,
    this.resourcesVpcConfig,
    this.roleArn,
    this.status,
    this.tags,
    this.version,
  });
  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);
}

enum ClusterStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('UPDATING')
  updating,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClusterResponse {
  /// The full description of your new cluster.
  @_s.JsonKey(name: 'cluster')
  final Cluster cluster;

  CreateClusterResponse({
    this.cluster,
  });
  factory CreateClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFargateProfileResponse {
  /// The full description of your new Fargate profile.
  @_s.JsonKey(name: 'fargateProfile')
  final FargateProfile fargateProfile;

  CreateFargateProfileResponse({
    this.fargateProfile,
  });
  factory CreateFargateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFargateProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNodegroupResponse {
  /// The full description of your new node group.
  @_s.JsonKey(name: 'nodegroup')
  final Nodegroup nodegroup;

  CreateNodegroupResponse({
    this.nodegroup,
  });
  factory CreateNodegroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNodegroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteClusterResponse {
  /// The full description of the cluster to delete.
  @_s.JsonKey(name: 'cluster')
  final Cluster cluster;

  DeleteClusterResponse({
    this.cluster,
  });
  factory DeleteClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFargateProfileResponse {
  /// The deleted Fargate profile.
  @_s.JsonKey(name: 'fargateProfile')
  final FargateProfile fargateProfile;

  DeleteFargateProfileResponse({
    this.fargateProfile,
  });
  factory DeleteFargateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFargateProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNodegroupResponse {
  /// The full description of your deleted node group.
  @_s.JsonKey(name: 'nodegroup')
  final Nodegroup nodegroup;

  DeleteNodegroupResponse({
    this.nodegroup,
  });
  factory DeleteNodegroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNodegroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClusterResponse {
  /// The full description of your specified cluster.
  @_s.JsonKey(name: 'cluster')
  final Cluster cluster;

  DescribeClusterResponse({
    this.cluster,
  });
  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFargateProfileResponse {
  /// The full description of your Fargate profile.
  @_s.JsonKey(name: 'fargateProfile')
  final FargateProfile fargateProfile;

  DescribeFargateProfileResponse({
    this.fargateProfile,
  });
  factory DescribeFargateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFargateProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNodegroupResponse {
  /// The full description of your node group.
  @_s.JsonKey(name: 'nodegroup')
  final Nodegroup nodegroup;

  DescribeNodegroupResponse({
    this.nodegroup,
  });
  factory DescribeNodegroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeNodegroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUpdateResponse {
  /// The full description of the specified update.
  @_s.JsonKey(name: 'update')
  final Update update;

  DescribeUpdateResponse({
    this.update,
  });
  factory DescribeUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUpdateResponseFromJson(json);
}

/// The encryption configuration for the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfig {
  /// AWS Key Management Service (AWS KMS) customer master key (CMK). Either the
  /// ARN or the alias can be used.
  @_s.JsonKey(name: 'provider')
  final Provider provider;

  /// Specifies the resources to be encrypted. The only supported value is
  /// "secrets".
  @_s.JsonKey(name: 'resources')
  final List<String> resources;

  EncryptionConfig({
    this.provider,
    this.resources,
  });
  factory EncryptionConfig.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigToJson(this);
}

enum ErrorCode {
  @_s.JsonValue('SubnetNotFound')
  subnetNotFound,
  @_s.JsonValue('SecurityGroupNotFound')
  securityGroupNotFound,
  @_s.JsonValue('EniLimitReached')
  eniLimitReached,
  @_s.JsonValue('IpNotAvailable')
  ipNotAvailable,
  @_s.JsonValue('AccessDenied')
  accessDenied,
  @_s.JsonValue('OperationNotPermitted')
  operationNotPermitted,
  @_s.JsonValue('VpcIdNotFound')
  vpcIdNotFound,
  @_s.JsonValue('Unknown')
  unknown,
  @_s.JsonValue('NodeCreationFailure')
  nodeCreationFailure,
  @_s.JsonValue('PodEvictionFailure')
  podEvictionFailure,
  @_s.JsonValue('InsufficientFreeAddresses')
  insufficientFreeAddresses,
}

/// An object representing an error when an asynchronous operation fails.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetail {
  /// A brief description of the error.
  ///
  /// <ul>
  /// <li>
  /// <b>SubnetNotFound</b>: We couldn't find one of the subnets associated with
  /// the cluster.
  /// </li>
  /// <li>
  /// <b>SecurityGroupNotFound</b>: We couldn't find one of the security groups
  /// associated with the cluster.
  /// </li>
  /// <li>
  /// <b>EniLimitReached</b>: You have reached the elastic network interface limit
  /// for your account.
  /// </li>
  /// <li>
  /// <b>IpNotAvailable</b>: A subnet associated with the cluster doesn't have any
  /// free IP addresses.
  /// </li>
  /// <li>
  /// <b>AccessDenied</b>: You don't have permissions to perform the specified
  /// operation.
  /// </li>
  /// <li>
  /// <b>OperationNotPermitted</b>: The service role associated with the cluster
  /// doesn't have the required access permissions for Amazon EKS.
  /// </li>
  /// <li>
  /// <b>VpcIdNotFound</b>: We couldn't find the VPC associated with the cluster.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'errorCode')
  final ErrorCode errorCode;

  /// A more complete description of the error.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// An optional field that contains the resource IDs associated with the error.
  @_s.JsonKey(name: 'resourceIds')
  final List<String> resourceIds;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.resourceIds,
  });
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

/// An object representing an AWS Fargate profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FargateProfile {
  /// The name of the Amazon EKS cluster that the Fargate profile belongs to.
  @_s.JsonKey(name: 'clusterName')
  final String clusterName;

  /// The Unix epoch timestamp in seconds for when the Fargate profile was
  /// created.
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The full Amazon Resource Name (ARN) of the Fargate profile.
  @_s.JsonKey(name: 'fargateProfileArn')
  final String fargateProfileArn;

  /// The name of the Fargate profile.
  @_s.JsonKey(name: 'fargateProfileName')
  final String fargateProfileName;

  /// The Amazon Resource Name (ARN) of the pod execution role to use for pods
  /// that match the selectors in the Fargate profile. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">Pod
  /// Execution Role</a> in the <i>Amazon EKS User Guide</i>.
  @_s.JsonKey(name: 'podExecutionRoleArn')
  final String podExecutionRoleArn;

  /// The selectors to match for pods to use this Fargate profile.
  @_s.JsonKey(name: 'selectors')
  final List<FargateProfileSelector> selectors;

  /// The current status of the Fargate profile.
  @_s.JsonKey(name: 'status')
  final FargateProfileStatus status;

  /// The IDs of subnets to launch pods into.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// The metadata applied to the Fargate profile to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both of
  /// which you define. Fargate profile tags do not propagate to any other
  /// resources associated with the Fargate profile, such as the pods that are
  /// scheduled with it.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  FargateProfile({
    this.clusterName,
    this.createdAt,
    this.fargateProfileArn,
    this.fargateProfileName,
    this.podExecutionRoleArn,
    this.selectors,
    this.status,
    this.subnets,
    this.tags,
  });
  factory FargateProfile.fromJson(Map<String, dynamic> json) =>
      _$FargateProfileFromJson(json);
}

/// An object representing an AWS Fargate profile selector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FargateProfileSelector {
  /// The Kubernetes labels that the selector should match. A pod must contain all
  /// of the labels that are specified in the selector for it to be considered a
  /// match.
  @_s.JsonKey(name: 'labels')
  final Map<String, String> labels;

  /// The Kubernetes namespace that the selector should match.
  @_s.JsonKey(name: 'namespace')
  final String namespace;

  FargateProfileSelector({
    this.labels,
    this.namespace,
  });
  factory FargateProfileSelector.fromJson(Map<String, dynamic> json) =>
      _$FargateProfileSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$FargateProfileSelectorToJson(this);
}

enum FargateProfileStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

/// An object representing an identity provider for authentication credentials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Identity {
  /// The <a href="https://openid.net/connect/">OpenID Connect</a> identity
  /// provider information for the cluster.
  @_s.JsonKey(name: 'oidc')
  final OIDC oidc;

  Identity({
    this.oidc,
  });
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
}

/// An object representing an issue with an Amazon EKS resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Issue {
  /// A brief description of the error.
  ///
  /// <ul>
  /// <li>
  /// <b>AutoScalingGroupNotFound</b>: We couldn't find the Auto Scaling group
  /// associated with the managed node group. You may be able to recreate an Auto
  /// Scaling group with the same settings to recover.
  /// </li>
  /// <li>
  /// <b>Ec2SecurityGroupNotFound</b>: We couldn't find the cluster security group
  /// for the cluster. You must recreate your cluster.
  /// </li>
  /// <li>
  /// <b>Ec2SecurityGroupDeletionFailure</b>: We could not delete the remote
  /// access security group for your managed node group. Remove any dependencies
  /// from the security group.
  /// </li>
  /// <li>
  /// <b>Ec2LaunchTemplateNotFound</b>: We couldn't find the Amazon EC2 launch
  /// template for your managed node group. You may be able to recreate a launch
  /// template with the same settings to recover.
  /// </li>
  /// <li>
  /// <b>Ec2LaunchTemplateVersionMismatch</b>: The Amazon EC2 launch template
  /// version for your managed node group does not match the version that Amazon
  /// EKS created. You may be able to revert to the version that Amazon EKS
  /// created to recover.
  /// </li>
  /// <li>
  /// <b>IamInstanceProfileNotFound</b>: We couldn't find the IAM instance profile
  /// for your managed node group. You may be able to recreate an instance profile
  /// with the same settings to recover.
  /// </li>
  /// <li>
  /// <b>IamNodeRoleNotFound</b>: We couldn't find the IAM role for your managed
  /// node group. You may be able to recreate an IAM role with the same settings
  /// to recover.
  /// </li>
  /// <li>
  /// <b>AsgInstanceLaunchFailures</b>: Your Auto Scaling group is experiencing
  /// failures while attempting to launch instances.
  /// </li>
  /// <li>
  /// <b>NodeCreationFailure</b>: Your launched instances are unable to register
  /// with your Amazon EKS cluster. Common causes of this failure are insufficient
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/worker_node_IAM_role.html">worker
  /// node IAM role</a> permissions or lack of outbound internet access for the
  /// nodes.
  /// </li>
  /// <li>
  /// <b>InstanceLimitExceeded</b>: Your AWS account is unable to launch any more
  /// instances of the specified instance type. You may be able to request an
  /// Amazon EC2 instance limit increase to recover.
  /// </li>
  /// <li>
  /// <b>InsufficientFreeAddresses</b>: One or more of the subnets associated with
  /// your managed node group does not have enough available IP addresses for new
  /// nodes.
  /// </li>
  /// <li>
  /// <b>AccessDenied</b>: Amazon EKS or one or more of your managed nodes is
  /// unable to communicate with your cluster API server.
  /// </li>
  /// <li>
  /// <b>InternalFailure</b>: These errors are usually caused by an Amazon EKS
  /// server-side issue.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'code')
  final NodegroupIssueCode code;

  /// The error message associated with the issue.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The AWS resources that are afflicted by this issue.
  @_s.JsonKey(name: 'resourceIds')
  final List<String> resourceIds;

  Issue({
    this.code,
    this.message,
    this.resourceIds,
  });
  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClustersResponse {
  /// A list of all of the clusters for your account in the specified Region.
  @_s.JsonKey(name: 'clusters')
  final List<String> clusters;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListClusters</code> request. When the results of a
  /// <code>ListClusters</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListClustersResponse({
    this.clusters,
    this.nextToken,
  });
  factory ListClustersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListClustersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFargateProfilesResponse {
  /// A list of all of the Fargate profiles associated with the specified cluster.
  @_s.JsonKey(name: 'fargateProfileNames')
  final List<String> fargateProfileNames;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListFargateProfiles</code> request. When the results of a
  /// <code>ListFargateProfiles</code> request exceed <code>maxResults</code>, you
  /// can use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFargateProfilesResponse({
    this.fargateProfileNames,
    this.nextToken,
  });
  factory ListFargateProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFargateProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNodegroupsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListNodegroups</code> request. When the results of a
  /// <code>ListNodegroups</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of all of the node groups associated with the specified cluster.
  @_s.JsonKey(name: 'nodegroups')
  final List<String> nodegroups;

  ListNodegroupsResponse({
    this.nextToken,
    this.nodegroups,
  });
  factory ListNodegroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNodegroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags for the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUpdatesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListUpdates</code> request. When the results of a
  /// <code>ListUpdates</code> request exceed <code>maxResults</code>, you can use
  /// this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of all the updates for the specified cluster and Region.
  @_s.JsonKey(name: 'updateIds')
  final List<String> updateIds;

  ListUpdatesResponse({
    this.nextToken,
    this.updateIds,
  });
  factory ListUpdatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUpdatesResponseFromJson(json);
}

/// An object representing the enabled or disabled Kubernetes control plane logs
/// for your cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogSetup {
  /// If a log type is enabled, that log type exports its control plane logs to
  /// CloudWatch Logs. If a log type isn't enabled, that log type doesn't export
  /// its control plane logs. Each individual log type can be enabled or disabled
  /// independently.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The available cluster control plane log types.
  @_s.JsonKey(name: 'types')
  final List<LogType> types;

  LogSetup({
    this.enabled,
    this.types,
  });
  factory LogSetup.fromJson(Map<String, dynamic> json) =>
      _$LogSetupFromJson(json);

  Map<String, dynamic> toJson() => _$LogSetupToJson(this);
}

enum LogType {
  @_s.JsonValue('api')
  api,
  @_s.JsonValue('audit')
  audit,
  @_s.JsonValue('authenticator')
  authenticator,
  @_s.JsonValue('controllerManager')
  controllerManager,
  @_s.JsonValue('scheduler')
  scheduler,
}

/// An object representing the logging configuration for resources in your
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Logging {
  /// The cluster control plane logging configuration for your cluster.
  @_s.JsonKey(name: 'clusterLogging')
  final List<LogSetup> clusterLogging;

  Logging({
    this.clusterLogging,
  });
  factory Logging.fromJson(Map<String, dynamic> json) =>
      _$LoggingFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingToJson(this);
}

/// An object representing an Amazon EKS managed node group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Nodegroup {
  /// The AMI type associated with your node group. GPU instance types should use
  /// the <code>AL2_x86_64_GPU</code> AMI type, which uses the Amazon
  /// EKS-optimized Linux AMI with GPU support. Non-GPU instances should use the
  /// <code>AL2_x86_64</code> AMI type, which uses the Amazon EKS-optimized Linux
  /// AMI.
  @_s.JsonKey(name: 'amiType')
  final AMITypes amiType;

  /// The name of the cluster that the managed node group resides in.
  @_s.JsonKey(name: 'clusterName')
  final String clusterName;

  /// The Unix epoch timestamp in seconds for when the managed node group was
  /// created.
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The root device disk size (in GiB) for your node group instances. The
  /// default disk size is 20 GiB.
  @_s.JsonKey(name: 'diskSize')
  final int diskSize;

  /// The health status of the node group. If there are issues with your node
  /// group's health, they are listed here.
  @_s.JsonKey(name: 'health')
  final NodegroupHealth health;

  /// The instance types associated with your node group.
  @_s.JsonKey(name: 'instanceTypes')
  final List<String> instanceTypes;

  /// The Kubernetes labels applied to the nodes in the node group.
  /// <note>
  /// Only labels that are applied with the Amazon EKS API are shown here. There
  /// may be other Kubernetes labels applied to the nodes in this group.
  /// </note>
  @_s.JsonKey(name: 'labels')
  final Map<String, String> labels;

  /// The Unix epoch timestamp in seconds for when the managed node group was last
  /// modified.
  @_s.JsonKey(
      name: 'modifiedAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime modifiedAt;

  /// The IAM role associated with your node group. The Amazon EKS worker node
  /// <code>kubelet</code> daemon makes calls to AWS APIs on your behalf. Worker
  /// nodes receive permissions for these API calls through an IAM instance
  /// profile and associated policies. Before you can launch worker nodes and
  /// register them into a cluster, you must create an IAM role for those worker
  /// nodes to use when they are launched. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/worker_node_IAM_role.html">Amazon
  /// EKS Worker Node IAM Role</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  @_s.JsonKey(name: 'nodeRole')
  final String nodeRole;

  /// The Amazon Resource Name (ARN) associated with the managed node group.
  @_s.JsonKey(name: 'nodegroupArn')
  final String nodegroupArn;

  /// The name associated with an Amazon EKS managed node group.
  @_s.JsonKey(name: 'nodegroupName')
  final String nodegroupName;

  /// The AMI version of the managed node group. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS-Optimized Linux AMI Versions </a> in the <i>Amazon EKS User Guide</i>.
  @_s.JsonKey(name: 'releaseVersion')
  final String releaseVersion;

  /// The remote access (SSH) configuration that is associated with the node
  /// group.
  @_s.JsonKey(name: 'remoteAccess')
  final RemoteAccessConfig remoteAccess;

  /// The resources associated with the node group, such as Auto Scaling groups
  /// and security groups for remote access.
  @_s.JsonKey(name: 'resources')
  final NodegroupResources resources;

  /// The scaling configuration details for the Auto Scaling group that is
  /// associated with your node group.
  @_s.JsonKey(name: 'scalingConfig')
  final NodegroupScalingConfig scalingConfig;

  /// The current status of the managed node group.
  @_s.JsonKey(name: 'status')
  final NodegroupStatus status;

  /// The subnets allowed for the Auto Scaling group that is associated with your
  /// node group. These subnets must have the following tag:
  /// <code>kubernetes.io/cluster/CLUSTER_NAME</code>, where
  /// <code>CLUSTER_NAME</code> is replaced with the name of your cluster.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// The metadata applied to the node group to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Node group tags do not propagate to any other resources
  /// associated with the node group, such as the Amazon EC2 instances or subnets.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The Kubernetes version of the managed node group.
  @_s.JsonKey(name: 'version')
  final String version;

  Nodegroup({
    this.amiType,
    this.clusterName,
    this.createdAt,
    this.diskSize,
    this.health,
    this.instanceTypes,
    this.labels,
    this.modifiedAt,
    this.nodeRole,
    this.nodegroupArn,
    this.nodegroupName,
    this.releaseVersion,
    this.remoteAccess,
    this.resources,
    this.scalingConfig,
    this.status,
    this.subnets,
    this.tags,
    this.version,
  });
  factory Nodegroup.fromJson(Map<String, dynamic> json) =>
      _$NodegroupFromJson(json);
}

/// An object representing the health status of the node group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodegroupHealth {
  /// Any issues that are associated with the node group.
  @_s.JsonKey(name: 'issues')
  final List<Issue> issues;

  NodegroupHealth({
    this.issues,
  });
  factory NodegroupHealth.fromJson(Map<String, dynamic> json) =>
      _$NodegroupHealthFromJson(json);
}

enum NodegroupIssueCode {
  @_s.JsonValue('AutoScalingGroupNotFound')
  autoScalingGroupNotFound,
  @_s.JsonValue('AutoScalingGroupInvalidConfiguration')
  autoScalingGroupInvalidConfiguration,
  @_s.JsonValue('Ec2SecurityGroupNotFound')
  ec2SecurityGroupNotFound,
  @_s.JsonValue('Ec2SecurityGroupDeletionFailure')
  ec2SecurityGroupDeletionFailure,
  @_s.JsonValue('Ec2LaunchTemplateNotFound')
  ec2LaunchTemplateNotFound,
  @_s.JsonValue('Ec2LaunchTemplateVersionMismatch')
  ec2LaunchTemplateVersionMismatch,
  @_s.JsonValue('Ec2SubnetNotFound')
  ec2SubnetNotFound,
  @_s.JsonValue('Ec2SubnetInvalidConfiguration')
  ec2SubnetInvalidConfiguration,
  @_s.JsonValue('IamInstanceProfileNotFound')
  iamInstanceProfileNotFound,
  @_s.JsonValue('IamLimitExceeded')
  iamLimitExceeded,
  @_s.JsonValue('IamNodeRoleNotFound')
  iamNodeRoleNotFound,
  @_s.JsonValue('NodeCreationFailure')
  nodeCreationFailure,
  @_s.JsonValue('AsgInstanceLaunchFailures')
  asgInstanceLaunchFailures,
  @_s.JsonValue('InstanceLimitExceeded')
  instanceLimitExceeded,
  @_s.JsonValue('InsufficientFreeAddresses')
  insufficientFreeAddresses,
  @_s.JsonValue('AccessDenied')
  accessDenied,
  @_s.JsonValue('InternalFailure')
  internalFailure,
}

/// An object representing the resources associated with the node group, such as
/// Auto Scaling groups and security groups for remote access.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodegroupResources {
  /// The Auto Scaling groups associated with the node group.
  @_s.JsonKey(name: 'autoScalingGroups')
  final List<AutoScalingGroup> autoScalingGroups;

  /// The remote access security group associated with the node group. This
  /// security group controls SSH access to the worker nodes.
  @_s.JsonKey(name: 'remoteAccessSecurityGroup')
  final String remoteAccessSecurityGroup;

  NodegroupResources({
    this.autoScalingGroups,
    this.remoteAccessSecurityGroup,
  });
  factory NodegroupResources.fromJson(Map<String, dynamic> json) =>
      _$NodegroupResourcesFromJson(json);
}

/// An object representing the scaling configuration details for the Auto
/// Scaling group that is associated with your node group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodegroupScalingConfig {
  /// The current number of worker nodes that the managed node group should
  /// maintain.
  @_s.JsonKey(name: 'desiredSize')
  final int desiredSize;

  /// The maximum number of worker nodes that the managed node group can scale out
  /// to. Managed node groups can support up to 100 nodes by default.
  @_s.JsonKey(name: 'maxSize')
  final int maxSize;

  /// The minimum number of worker nodes that the managed node group can scale in
  /// to. This number must be greater than zero.
  @_s.JsonKey(name: 'minSize')
  final int minSize;

  NodegroupScalingConfig({
    this.desiredSize,
    this.maxSize,
    this.minSize,
  });
  factory NodegroupScalingConfig.fromJson(Map<String, dynamic> json) =>
      _$NodegroupScalingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NodegroupScalingConfigToJson(this);
}

enum NodegroupStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
  @_s.JsonValue('DEGRADED')
  degraded,
}

/// An object representing the <a href="https://openid.net/connect/">OpenID
/// Connect</a> identity provider information for the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OIDC {
  /// The issuer URL for the OpenID Connect identity provider.
  @_s.JsonKey(name: 'issuer')
  final String issuer;

  OIDC({
    this.issuer,
  });
  factory OIDC.fromJson(Map<String, dynamic> json) => _$OIDCFromJson(json);
}

/// Identifies the AWS Key Management Service (AWS KMS) customer master key
/// (CMK) used to encrypt the secrets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Provider {
  /// Amazon Resource Name (ARN) or alias of the customer master key (CMK). The
  /// CMK must be symmetric, created in the same region as the cluster, and if the
  /// CMK was created in a different account, the user must have access to the
  /// CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-modifying-external-accounts.html">Allowing
  /// Users in Other Accounts to Use a CMK</a> in the <i>AWS Key Management
  /// Service Developer Guide</i>.
  @_s.JsonKey(name: 'keyArn')
  final String keyArn;

  Provider({
    this.keyArn,
  });
  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderToJson(this);
}

/// An object representing the remote access configuration for the managed node
/// group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemoteAccessConfig {
  /// The Amazon EC2 SSH key that provides access for SSH communication with the
  /// worker nodes in the managed node group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon
  /// EC2 Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for
  /// Linux Instances</i>.
  @_s.JsonKey(name: 'ec2SshKey')
  final String ec2SshKey;

  /// The security groups that are allowed SSH access (port 22) to the worker
  /// nodes. If you specify an Amazon EC2 SSH key but do not specify a source
  /// security group when you create a managed node group, then port 22 on the
  /// worker nodes is opened to the internet (0.0.0.0/0). For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Security
  /// Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User
  /// Guide</i>.
  @_s.JsonKey(name: 'sourceSecurityGroups')
  final List<String> sourceSecurityGroups;

  RemoteAccessConfig({
    this.ec2SshKey,
    this.sourceSecurityGroups,
  });
  factory RemoteAccessConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteAccessConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAccessConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// An object representing an asynchronous update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Update {
  /// The Unix epoch timestamp in seconds for when the update was created.
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// Any errors associated with a <code>Failed</code> update.
  @_s.JsonKey(name: 'errors')
  final List<ErrorDetail> errors;

  /// A UUID that is used to track the update.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A key-value map that contains the parameters associated with the update.
  @_s.JsonKey(name: 'params')
  final List<UpdateParam> params;

  /// The current status of the update.
  @_s.JsonKey(name: 'status')
  final UpdateStatus status;

  /// The type of the update.
  @_s.JsonKey(name: 'type')
  final UpdateType type;

  Update({
    this.createdAt,
    this.errors,
    this.id,
    this.params,
    this.status,
    this.type,
  });
  factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterConfigResponse {
  @_s.JsonKey(name: 'update')
  final Update update;

  UpdateClusterConfigResponse({
    this.update,
  });
  factory UpdateClusterConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateClusterConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterVersionResponse {
  /// The full description of the specified update
  @_s.JsonKey(name: 'update')
  final Update update;

  UpdateClusterVersionResponse({
    this.update,
  });
  factory UpdateClusterVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateClusterVersionResponseFromJson(json);
}

/// An object representing a Kubernetes label change for a managed node group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateLabelsPayload {
  /// Kubernetes labels to be added or updated.
  @_s.JsonKey(name: 'addOrUpdateLabels')
  final Map<String, String> addOrUpdateLabels;

  /// Kubernetes labels to be removed.
  @_s.JsonKey(name: 'removeLabels')
  final List<String> removeLabels;

  UpdateLabelsPayload({
    this.addOrUpdateLabels,
    this.removeLabels,
  });
  Map<String, dynamic> toJson() => _$UpdateLabelsPayloadToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNodegroupConfigResponse {
  @_s.JsonKey(name: 'update')
  final Update update;

  UpdateNodegroupConfigResponse({
    this.update,
  });
  factory UpdateNodegroupConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNodegroupConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNodegroupVersionResponse {
  @_s.JsonKey(name: 'update')
  final Update update;

  UpdateNodegroupVersionResponse({
    this.update,
  });
  factory UpdateNodegroupVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNodegroupVersionResponseFromJson(json);
}

/// An object representing the details of an update request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateParam {
  /// The keys associated with an update request.
  @_s.JsonKey(name: 'type')
  final UpdateParamType type;

  /// The value of the keys submitted as part of an update request.
  @_s.JsonKey(name: 'value')
  final String value;

  UpdateParam({
    this.type,
    this.value,
  });
  factory UpdateParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateParamFromJson(json);
}

enum UpdateParamType {
  @_s.JsonValue('Version')
  version,
  @_s.JsonValue('PlatformVersion')
  platformVersion,
  @_s.JsonValue('EndpointPrivateAccess')
  endpointPrivateAccess,
  @_s.JsonValue('EndpointPublicAccess')
  endpointPublicAccess,
  @_s.JsonValue('ClusterLogging')
  clusterLogging,
  @_s.JsonValue('DesiredSize')
  desiredSize,
  @_s.JsonValue('LabelsToAdd')
  labelsToAdd,
  @_s.JsonValue('LabelsToRemove')
  labelsToRemove,
  @_s.JsonValue('MaxSize')
  maxSize,
  @_s.JsonValue('MinSize')
  minSize,
  @_s.JsonValue('ReleaseVersion')
  releaseVersion,
  @_s.JsonValue('PublicAccessCidrs')
  publicAccessCidrs,
}

enum UpdateStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Successful')
  successful,
}

enum UpdateType {
  @_s.JsonValue('VersionUpdate')
  versionUpdate,
  @_s.JsonValue('EndpointAccessUpdate')
  endpointAccessUpdate,
  @_s.JsonValue('LoggingUpdate')
  loggingUpdate,
  @_s.JsonValue('ConfigUpdate')
  configUpdate,
}

/// An object representing the VPC configuration to use for an Amazon EKS
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfigRequest {
  /// Set this value to <code>true</code> to enable private access for your
  /// cluster's Kubernetes API server endpoint. If you enable private access,
  /// Kubernetes API requests from within your cluster's VPC use the private VPC
  /// endpoint. The default value for this parameter is <code>false</code>, which
  /// disables private access for your Kubernetes API server. If you disable
  /// private access and you have worker nodes or AWS Fargate pods in the cluster,
  /// then ensure that <code>publicAccessCidrs</code> includes the necessary CIDR
  /// blocks for communication with the worker nodes or Fargate pods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  @_s.JsonKey(name: 'endpointPrivateAccess')
  final bool endpointPrivateAccess;

  /// Set this value to <code>false</code> to disable public access to your
  /// cluster's Kubernetes API server endpoint. If you disable public access, your
  /// cluster's Kubernetes API server can only receive requests from within the
  /// cluster VPC. The default value for this parameter is <code>true</code>,
  /// which enables public access for your Kubernetes API server. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  @_s.JsonKey(name: 'endpointPublicAccess')
  final bool endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the CIDR blocks that you specify is denied. The default value is
  /// <code>0.0.0.0/0</code>. If you've disabled private endpoint access and you
  /// have worker nodes or AWS Fargate pods in the cluster, then ensure that you
  /// specify the necessary CIDR blocks. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  @_s.JsonKey(name: 'publicAccessCidrs')
  final List<String> publicAccessCidrs;

  /// Specify one or more security groups for the cross-account elastic network
  /// interfaces that Amazon EKS creates to use to allow communication between
  /// your worker nodes and the Kubernetes control plane. If you don't specify a
  /// security group, the default security group for your VPC is used.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// Specify subnets for your Amazon EKS worker nodes. Amazon EKS creates
  /// cross-account elastic network interfaces in these subnets to allow
  /// communication between your worker nodes and the Kubernetes control plane.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  VpcConfigRequest({
    this.endpointPrivateAccess,
    this.endpointPublicAccess,
    this.publicAccessCidrs,
    this.securityGroupIds,
    this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VpcConfigRequestToJson(this);
}

/// An object representing an Amazon EKS cluster VPC configuration response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcConfigResponse {
  /// The cluster security group that was created by Amazon EKS for the cluster.
  /// Managed node groups use this security group for control-plane-to-data-plane
  /// communication.
  @_s.JsonKey(name: 'clusterSecurityGroupId')
  final String clusterSecurityGroupId;

  /// This parameter indicates whether the Amazon EKS private API server endpoint
  /// is enabled. If the Amazon EKS private API server endpoint is enabled,
  /// Kubernetes API requests that originate from within your cluster's VPC use
  /// the private VPC endpoint instead of traversing the internet. If this value
  /// is disabled and you have worker nodes or AWS Fargate pods in the cluster,
  /// then ensure that <code>publicAccessCidrs</code> includes the necessary CIDR
  /// blocks for communication with the worker nodes or Fargate pods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  @_s.JsonKey(name: 'endpointPrivateAccess')
  final bool endpointPrivateAccess;

  /// This parameter indicates whether the Amazon EKS public API server endpoint
  /// is enabled. If the Amazon EKS public API server endpoint is disabled, your
  /// cluster's Kubernetes API server can only receive requests that originate
  /// from within the cluster VPC.
  @_s.JsonKey(name: 'endpointPublicAccess')
  final bool endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the listed CIDR blocks is denied. The default value is
  /// <code>0.0.0.0/0</code>. If you've disabled private endpoint access and you
  /// have worker nodes or AWS Fargate pods in the cluster, then ensure that the
  /// necessary CIDR blocks are listed. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  @_s.JsonKey(name: 'publicAccessCidrs')
  final List<String> publicAccessCidrs;

  /// The security groups associated with the cross-account elastic network
  /// interfaces that are used to allow communication between your worker nodes
  /// and the Kubernetes control plane.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// The subnets associated with your cluster.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The VPC associated with your cluster.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  VpcConfigResponse({
    this.clusterSecurityGroupId,
    this.endpointPrivateAccess,
    this.endpointPublicAccess,
    this.publicAccessCidrs,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });
  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigResponseFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String type, String message})
      : super(type: type, code: 'ClientException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String type, String message})
      : super(type: type, code: 'ServerException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class UnsupportedAvailabilityZoneException extends _s.GenericAwsException {
  UnsupportedAvailabilityZoneException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedAvailabilityZoneException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'UnsupportedAvailabilityZoneException': (type, message) =>
      UnsupportedAvailabilityZoneException(type: type, message: message),
};
