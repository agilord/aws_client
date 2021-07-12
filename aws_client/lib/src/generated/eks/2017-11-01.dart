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
class Eks {
  final _s.RestJsonProtocol _protocol;
  Eks({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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

  /// Associate encryption configuration to an existing cluster.
  ///
  /// You can use this API to enable encryption on existing clusters which do
  /// not have encryption already enabled. This allows you to implement a
  /// defense-in-depth security strategy without migrating applications to new
  /// EKS clusters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that you are associating with encryption
  /// configuration.
  ///
  /// Parameter [encryptionConfig] :
  /// The configuration you are using for encryption.
  ///
  /// Parameter [clientRequestToken] :
  /// The client request token you are using with the encryption configuration.
  Future<AssociateEncryptionConfigResponse> associateEncryptionConfig({
    required String clusterName,
    required List<EncryptionConfig> encryptionConfig,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(encryptionConfig, 'encryptionConfig');
    final $payload = <String, dynamic>{
      'encryptionConfig': encryptionConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/encryption-config/associate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateEncryptionConfigResponse.fromJson(response);
  }

  /// Associate an identity provider configuration to a cluster.
  ///
  /// If you want to authenticate identities using an identity provider, you can
  /// create an identity provider configuration and associate it to your
  /// cluster. After configuring authentication to your cluster you can create
  /// Kubernetes <code>roles</code> and <code>clusterroles</code> to assign
  /// permissions to the roles, and then bind the roles to the identities using
  /// Kubernetes <code>rolebindings</code> and <code>clusterrolebindings</code>.
  /// For more information see <a
  /// href="https://kubernetes.io/docs/reference/access-authn-authz/rbac/">Using
  /// RBAC Authorization</a> in the Kubernetes documentation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to associate the configuration to.
  ///
  /// Parameter [oidc] :
  /// An object that represents an OpenID Connect (OIDC) identity provider
  /// configuration.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the configuration to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both
  /// of which you define.
  Future<AssociateIdentityProviderConfigResponse>
      associateIdentityProviderConfig({
    required String clusterName,
    required OidcIdentityProviderConfigRequest oidc,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(oidc, 'oidc');
    final $payload = <String, dynamic>{
      'oidc': oidc,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/identity-provider-configs/associate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateIdentityProviderConfigResponse.fromJson(response);
  }

  /// Creates an Amazon EKS add-on.
  ///
  /// Amazon EKS add-ons help to automate the provisioning and lifecycle
  /// management of common operational software for Amazon EKS clusters. Amazon
  /// EKS add-ons can only be used with Amazon EKS clusters running version 1.18
  /// with platform version <code>eks.3</code> or later because add-ons rely on
  /// the Server-side Apply Kubernetes feature, which is only available in
  /// Kubernetes 1.18 and later.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to create the add-on for.
  ///
  /// Parameter [addonVersion] :
  /// The version of the add-on. The version must match one of the versions
  /// returned by <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeAddonVersions.html">
  /// <code>DescribeAddonVersions</code> </a>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [resolveConflicts] :
  /// How to resolve parameter value conflicts when migrating an existing add-on
  /// to an Amazon EKS add-on.
  ///
  /// Parameter [serviceAccountRoleArn] :
  /// The Amazon Resource Name (ARN) of an existing IAM role to bind to the
  /// add-on's service account. The role must be assigned the IAM permissions
  /// required by the add-on. If you don't specify an existing IAM role, then
  /// the add-on uses the permissions assigned to the node IAM role. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html">Amazon
  /// EKS node IAM role</a> in the <i>Amazon EKS User Guide</i>.
  /// <note>
  /// To specify an existing IAM role, you must have an IAM OpenID Connect
  /// (OIDC) provider created for your cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html">Enabling
  /// IAM roles for service accounts on your cluster</a> in the <i>Amazon EKS
  /// User Guide</i>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The metadata to apply to the cluster to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define.
  Future<CreateAddonResponse> createAddon({
    required String addonName,
    required String clusterName,
    String? addonVersion,
    String? clientRequestToken,
    ResolveConflicts? resolveConflicts,
    String? serviceAccountRoleArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(addonName, 'addonName');
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'serviceAccountRoleArn',
      serviceAccountRoleArn,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      'addonName': addonName,
      if (addonVersion != null) 'addonVersion': addonVersion,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (resolveConflicts != null)
        'resolveConflicts': resolveConflicts.toValue(),
      if (serviceAccountRoleArn != null)
        'serviceAccountRoleArn': serviceAccountRoleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/addons',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAddonResponse.fromJson(response);
  }

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
  /// to provide connectivity from the control plane instances to the nodes (for
  /// example, to support <code>kubectl exec</code>, <code>logs</code>, and
  /// <code>proxy</code> data flows).
  ///
  /// Amazon EKS nodes run in your AWS account and connect to your cluster's
  /// control plane via the Kubernetes API server endpoint and a certificate
  /// file that is created for your cluster.
  ///
  /// Cluster creation typically takes several minutes. After you create an
  /// Amazon EKS cluster, you must configure your Kubernetes tooling to
  /// communicate with the API server and launch nodes into your cluster. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html">Managing
  /// Cluster Authentication</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html">Launching
  /// Amazon EKS nodes</a> in the <i>Amazon EKS User Guide</i>.
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
  /// for the Kubernetes control plane to make calls to AWS API operations on
  /// your behalf. For more information, see <a
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
  /// Parameter [kubernetesNetworkConfig] :
  /// The Kubernetes network configuration for the cluster.
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
    required String name,
    required VpcConfigRequest resourcesVpcConfig,
    required String roleArn,
    String? clientRequestToken,
    List<EncryptionConfig>? encryptionConfig,
    KubernetesNetworkConfigRequest? kubernetesNetworkConfig,
    Logging? logging,
    Map<String, String>? tags,
    String? version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourcesVpcConfig, 'resourcesVpcConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final $payload = <String, dynamic>{
      'name': name,
      'resourcesVpcConfig': resourcesVpcConfig,
      'roleArn': roleArn,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
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
    required String clusterName,
    required String fargateProfileName,
    required String podExecutionRoleArn,
    String? clientRequestToken,
    List<FargateProfileSelector>? selectors,
    List<String>? subnets,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(fargateProfileName, 'fargateProfileName');
    ArgumentError.checkNotNull(podExecutionRoleArn, 'podExecutionRoleArn');
    final $payload = <String, dynamic>{
      'fargateProfileName': fargateProfileName,
      'podExecutionRoleArn': podExecutionRoleArn,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
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

  /// Creates a managed node group for an Amazon EKS cluster. You can only
  /// create a node group for your cluster that is equal to the current
  /// Kubernetes version for the cluster. All node groups are created with the
  /// latest AMI release version for the respective minor Kubernetes version of
  /// the cluster, unless you deploy a custom AMI using a launch template. For
  /// more information about using launch templates, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a>.
  ///
  /// An Amazon EKS managed node group is an Amazon EC2 Auto Scaling group and
  /// associated Amazon EC2 instances that are managed by AWS for an Amazon EKS
  /// cluster. Each node group uses a version of the Amazon EKS optimized Amazon
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
  /// to AWS APIs on your behalf. Nodes receive permissions for these API calls
  /// through an IAM instance profile and associated policies. Before you can
  /// launch nodes and register them into a cluster, you must create an IAM role
  /// for those nodes to use when they are launched. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/worker_node_IAM_role.html">Amazon
  /// EKS node IAM role</a> in the <i> <i>Amazon EKS User Guide</i> </i>. If you
  /// specify <code>launchTemplate</code>, then don't specify <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_IamInstanceProfile.html">
  /// <code>IamInstanceProfile</code> </a> in your launch template, or the node
  /// group deployment will fail. For more information about using launch
  /// templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [nodegroupName] :
  /// The unique name to give your node group.
  ///
  /// Parameter [subnets] :
  /// The subnets to use for the Auto Scaling group that is created for your
  /// node group. If you specify <code>launchTemplate</code>, then don't specify
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateNetworkInterface.html">
  /// <code>SubnetId</code> </a> in your launch template, or the node group
  /// deployment will fail. For more information about using launch templates
  /// with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [amiType] :
  /// The AMI type for your node group. GPU instance types should use the
  /// <code>AL2_x86_64_GPU</code> AMI type. Non-GPU instances should use the
  /// <code>AL2_x86_64</code> AMI type. Arm instances should use the
  /// <code>AL2_ARM_64</code> AMI type. All types use the Amazon EKS optimized
  /// Amazon Linux 2 AMI. If you specify <code>launchTemplate</code>, and your
  /// launch template uses a custom AMI, then don't specify
  /// <code>amiType</code>, or the node group deployment will fail. For more
  /// information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [capacityType] :
  /// The capacity type for your node group.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [diskSize] :
  /// The root device disk size (in GiB) for your node group instances. The
  /// default disk size is 20 GiB. If you specify <code>launchTemplate</code>,
  /// then don't specify <code>diskSize</code>, or the node group deployment
  /// will fail. For more information about using launch templates with Amazon
  /// EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [instanceTypes] :
  /// Specify the instance types for a node group. If you specify a GPU instance
  /// type, be sure to specify <code>AL2_x86_64_GPU</code> with the
  /// <code>amiType</code> parameter. If you specify
  /// <code>launchTemplate</code>, then you can specify zero or one instance
  /// type in your launch template <i>or</i> you can specify 0-20 instance types
  /// for <code>instanceTypes</code>. If however, you specify an instance type
  /// in your launch template <i>and</i> specify any <code>instanceTypes</code>,
  /// the node group deployment will fail. If you don't specify an instance type
  /// in a launch template or for <code>instanceTypes</code>, then
  /// <code>t3.medium</code> is used, by default. If you specify
  /// <code>Spot</code> for <code>capacityType</code>, then we recommend
  /// specifying multiple values for <code>instanceTypes</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html#managed-node-group-capacity-types">Managed
  /// node group capacity types</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Parameter [labels] :
  /// The Kubernetes labels to be applied to the nodes in the node group when
  /// they are created.
  ///
  /// Parameter [launchTemplate] :
  /// An object representing a node group's launch template specification. If
  /// specified, then do not specify <code>instanceTypes</code>,
  /// <code>diskSize</code>, or <code>remoteAccess</code> and make sure that the
  /// launch template meets the requirements in
  /// <code>launchTemplateSpecification</code>.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS optimized AMI to use with your node
  /// group. By default, the latest available AMI version for the node group's
  /// current Kubernetes version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux 2 AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>. If you specify <code>launchTemplate</code>, and your launch
  /// template uses a custom AMI, then don't specify
  /// <code>releaseVersion</code>, or the node group deployment will fail. For
  /// more information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [remoteAccess] :
  /// The remote access (SSH) configuration to use with your node group. If you
  /// specify <code>launchTemplate</code>, then don't specify
  /// <code>remoteAccess</code>, or the node group deployment will fail. For
  /// more information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
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
  /// Parameter [taints] :
  /// The Kubernetes taints to be applied to the nodes in the node group.
  ///
  /// Parameter [version] :
  /// The Kubernetes version to use for your managed nodes. By default, the
  /// Kubernetes version of the cluster is used, and this is the only accepted
  /// specified value. If you specify <code>launchTemplate</code>, and your
  /// launch template uses a custom AMI, then don't specify
  /// <code>version</code>, or the node group deployment will fail. For more
  /// information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  Future<CreateNodegroupResponse> createNodegroup({
    required String clusterName,
    required String nodeRole,
    required String nodegroupName,
    required List<String> subnets,
    AMITypes? amiType,
    CapacityTypes? capacityType,
    String? clientRequestToken,
    int? diskSize,
    List<String>? instanceTypes,
    Map<String, String>? labels,
    LaunchTemplateSpecification? launchTemplate,
    String? releaseVersion,
    RemoteAccessConfig? remoteAccess,
    NodegroupScalingConfig? scalingConfig,
    Map<String, String>? tags,
    List<Taint>? taints,
    NodegroupUpdateConfig? updateConfig,
    String? version,
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
      if (capacityType != null) 'capacityType': capacityType.toValue(),
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (diskSize != null) 'diskSize': diskSize,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (labels != null) 'labels': labels,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (remoteAccess != null) 'remoteAccess': remoteAccess,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (tags != null) 'tags': tags,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
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

  /// Delete an Amazon EKS add-on.
  ///
  /// When you remove the add-on, it will also be deleted from the cluster. You
  /// can always manually start an add-on on the cluster using the Kubernetes
  /// API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to delete the add-on from.
  Future<DeleteAddonResponse> deleteAddon({
    required String addonName,
    required String clusterName,
  }) async {
    ArgumentError.checkNotNull(addonName, 'addonName');
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/addons/${Uri.encodeComponent(addonName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAddonResponse.fromJson(response);
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
    required String name,
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
    required String clusterName,
    required String fargateProfileName,
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
    required String clusterName,
    required String nodegroupName,
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

  /// Describes an Amazon EKS add-on.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  Future<DescribeAddonResponse> describeAddon({
    required String addonName,
    required String clusterName,
  }) async {
    ArgumentError.checkNotNull(addonName, 'addonName');
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/addons/${Uri.encodeComponent(addonName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAddonResponse.fromJson(response);
  }

  /// Describes the Kubernetes versions that the add-on can be used with.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [kubernetesVersion] :
  /// The Kubernetes versions that the add-on can be used with.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeAddonVersionsRequest</code> where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeAddonVersionsResponse> describeAddonVersions({
    String? addonName,
    String? kubernetesVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (addonName != null) 'addonName': [addonName],
      if (kubernetesVersion != null) 'kubernetesVersion': [kubernetesVersion],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/addons/supported-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAddonVersionsResponse.fromJson(response);
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
    required String name,
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
    required String clusterName,
    required String fargateProfileName,
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

  /// Returns descriptive information about an identity provider configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The cluster name that the identity provider configuration is associated
  /// to.
  ///
  /// Parameter [identityProviderConfig] :
  /// An object that represents an identity provider configuration.
  Future<DescribeIdentityProviderConfigResponse>
      describeIdentityProviderConfig({
    required String clusterName,
    required IdentityProviderConfig identityProviderConfig,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(
        identityProviderConfig, 'identityProviderConfig');
    final $payload = <String, dynamic>{
      'identityProviderConfig': identityProviderConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/identity-provider-configs/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIdentityProviderConfigResponse.fromJson(response);
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
    required String clusterName,
    required String nodegroupName,
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
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the Amazon EKS node group associated with the update.
  Future<DescribeUpdateResponse> describeUpdate({
    required String name,
    required String updateId,
    String? addonName,
    String? nodegroupName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(updateId, 'updateId');
    final $query = <String, List<String>>{
      if (addonName != null) 'addonName': [addonName],
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

  /// Disassociates an identity provider configuration from a cluster. If you
  /// disassociate an identity provider from your cluster, users included in the
  /// provider can no longer access the cluster. However, you can still access
  /// the cluster with AWS IAM users.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to disassociate an identity provider from.
  ///
  /// Parameter [identityProviderConfig] :
  /// An object that represents an identity provider configuration.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<DisassociateIdentityProviderConfigResponse>
      disassociateIdentityProviderConfig({
    required String clusterName,
    required IdentityProviderConfig identityProviderConfig,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(
        identityProviderConfig, 'identityProviderConfig');
    final $payload = <String, dynamic>{
      'identityProviderConfig': identityProviderConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/identity-provider-configs/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateIdentityProviderConfigResponse.fromJson(response);
  }

  /// Lists the available add-ons.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ClientException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of add-on results returned by
  /// <code>ListAddonsRequest</code> in paginated output. When you use this
  /// parameter, <code>ListAddonsRequest</code> returns only
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListAddonsRequest</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If you don't use this parameter,
  /// <code>ListAddonsRequest</code> returns up to 100 results and a
  /// <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListAddonsRequest</code> where <code>maxResults</code> was used and
  /// the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAddonsResponse> listAddons({
    required String clusterName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      100,
      isRequired: true,
    );
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
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/addons',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAddonsResponse.fromJson(response);
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
    int? maxResults,
    String? nextToken,
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
    required String clusterName,
    int? maxResults,
    String? nextToken,
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

  /// A list of identity provider configurations.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The cluster name that you want to list identity provider configurations
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identity provider configurations returned by
  /// <code>ListIdentityProviderConfigs</code> in paginated output. When you use
  /// this parameter, <code>ListIdentityProviderConfigs</code> returns only
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another
  /// <code>ListIdentityProviderConfigs</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListIdentityProviderConfigs</code> returns
  /// up to 100 results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>IdentityProviderConfigsRequest</code> where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListIdentityProviderConfigsResponse> listIdentityProviderConfigs({
    required String clusterName,
    int? maxResults,
    String? nextToken,
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
          '/clusters/${Uri.encodeComponent(clusterName)}/identity-provider-configs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityProviderConfigsResponse.fromJson(response);
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
    required String clusterName,
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
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
  /// Parameter [addonName] :
  /// The names of the installed add-ons that have available updates.
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
    required String name,
    String? addonName,
    int? maxResults,
    String? nextToken,
    String? nodegroupName,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (addonName != null) 'addonName': [addonName],
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
  /// subnets and nodes associated with the cluster.
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
    required String resourceArn,
    required Map<String, String> tags,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an Amazon EKS add-on.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_ListAddons.html">
  /// <code>ListAddons</code> </a>.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster.
  ///
  /// Parameter [addonVersion] :
  /// The version of the add-on. The version must match one of the versions
  /// returned by <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeAddonVersions.html">
  /// <code>DescribeAddonVersions</code> </a>.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [resolveConflicts] :
  /// How to resolve parameter value conflicts when applying the new version of
  /// the add-on to the cluster.
  ///
  /// Parameter [serviceAccountRoleArn] :
  /// The Amazon Resource Name (ARN) of an existing IAM role to bind to the
  /// add-on's service account. The role must be assigned the IAM permissions
  /// required by the add-on. If you don't specify an existing IAM role, then
  /// the add-on uses the permissions assigned to the node IAM role. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html">Amazon
  /// EKS node IAM role</a> in the <i>Amazon EKS User Guide</i>.
  /// <note>
  /// To specify an existing IAM role, you must have an IAM OpenID Connect
  /// (OIDC) provider created for your cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html">Enabling
  /// IAM roles for service accounts on your cluster</a> in the <i>Amazon EKS
  /// User Guide</i>.
  /// </note>
  Future<UpdateAddonResponse> updateAddon({
    required String addonName,
    required String clusterName,
    String? addonVersion,
    String? clientRequestToken,
    ResolveConflicts? resolveConflicts,
    String? serviceAccountRoleArn,
  }) async {
    ArgumentError.checkNotNull(addonName, 'addonName');
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    _s.validateStringLength(
      'clusterName',
      clusterName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'serviceAccountRoleArn',
      serviceAccountRoleArn,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      if (addonVersion != null) 'addonVersion': addonVersion,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (resolveConflicts != null)
        'resolveConflicts': resolveConflicts.toValue(),
      if (serviceAccountRoleArn != null)
        'serviceAccountRoleArn': serviceAccountRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/addons/${Uri.encodeComponent(addonName)}/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAddonResponse.fromJson(response);
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
  /// You can't update the subnets or security group IDs for an existing
  /// cluster.
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
    required String name,
    String? clientRequestToken,
    Logging? logging,
    VpcConfigRequest? resourcesVpcConfig,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
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
    required String name,
    required String version,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(version, 'version');
    final $payload = <String, dynamic>{
      'version': version,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
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
  ///
  /// Parameter [taints] :
  /// The Kubernetes taints to be applied to the nodes in the node group after
  /// the update.
  Future<UpdateNodegroupConfigResponse> updateNodegroupConfig({
    required String clusterName,
    required String nodegroupName,
    String? clientRequestToken,
    UpdateLabelsPayload? labels,
    NodegroupScalingConfig? scalingConfig,
    UpdateTaintsPayload? taints,
    NodegroupUpdateConfig? updateConfig,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (labels != null) 'labels': labels,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
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
  /// You can update a node group using a launch template only if the node group
  /// was originally deployed with a launch template. If you need to update a
  /// custom AMI in a node group that was deployed with a launch template, then
  /// update your custom AMI, specify the new ID in a new version of the launch
  /// template, and then update the node group to the new version of the launch
  /// template.
  ///
  /// If you update without a launch template, then you can update to the latest
  /// available AMI version of a node group's current Kubernetes version by not
  /// specifying a Kubernetes version in the request. You can update to the
  /// latest AMI version of your cluster's current Kubernetes version by
  /// specifying your cluster's Kubernetes version in the request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux 2 AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>.
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
  /// Parameter [launchTemplate] :
  /// An object representing a node group's launch template specification. You
  /// can only update a node group using a launch template if the node group was
  /// originally deployed with a launch template.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS optimized AMI to use for the update. By
  /// default, the latest available AMI version for the node group's Kubernetes
  /// version is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux 2 AMI versions </a> in the <i>Amazon EKS User
  /// Guide</i>. If you specify <code>launchTemplate</code>, and your launch
  /// template uses a custom AMI, then don't specify
  /// <code>releaseVersion</code>, or the node group update will fail. For more
  /// information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  ///
  /// Parameter [version] :
  /// The Kubernetes version to update to. If no version is specified, then the
  /// Kubernetes version of the node group does not change. You can specify the
  /// Kubernetes version of the cluster to update the node group to the latest
  /// AMI version of the cluster's Kubernetes version. If you specify
  /// <code>launchTemplate</code>, and your launch template uses a custom AMI,
  /// then don't specify <code>version</code>, or the node group update will
  /// fail. For more information about using launch templates with Amazon EKS,
  /// see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
  /// template support</a> in the Amazon EKS User Guide.
  Future<UpdateNodegroupVersionResponse> updateNodegroupVersion({
    required String clusterName,
    required String nodegroupName,
    String? clientRequestToken,
    bool? force,
    LaunchTemplateSpecification? launchTemplate,
    String? releaseVersion,
    String? version,
  }) async {
    ArgumentError.checkNotNull(clusterName, 'clusterName');
    ArgumentError.checkNotNull(nodegroupName, 'nodegroupName');
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (force != null) 'force': force,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
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
  al2X86_64,
  al2X86_64Gpu,
  al2Arm_64,
  custom,
}

extension on AMITypes {
  String toValue() {
    switch (this) {
      case AMITypes.al2X86_64:
        return 'AL2_x86_64';
      case AMITypes.al2X86_64Gpu:
        return 'AL2_x86_64_GPU';
      case AMITypes.al2Arm_64:
        return 'AL2_ARM_64';
      case AMITypes.custom:
        return 'CUSTOM';
    }
  }
}

extension on String {
  AMITypes toAMITypes() {
    switch (this) {
      case 'AL2_x86_64':
        return AMITypes.al2X86_64;
      case 'AL2_x86_64_GPU':
        return AMITypes.al2X86_64Gpu;
      case 'AL2_ARM_64':
        return AMITypes.al2Arm_64;
      case 'CUSTOM':
        return AMITypes.custom;
    }
    throw Exception('$this is not known in enum AMITypes');
  }
}

/// An Amazon EKS add-on.
class Addon {
  /// The Amazon Resource Name (ARN) of the add-on.
  final String? addonArn;

  /// The name of the add-on.
  final String? addonName;

  /// The version of the add-on.
  final String? addonVersion;

  /// The name of the cluster.
  final String? clusterName;

  /// The date and time that the add-on was created.
  final DateTime? createdAt;

  /// An object that represents the health of the add-on.
  final AddonHealth? health;

  /// The date and time that the add-on was last modified.
  final DateTime? modifiedAt;

  /// The Amazon Resource Name (ARN) of the IAM role that is bound to the
  /// Kubernetes service account used by the add-on.
  final String? serviceAccountRoleArn;

  /// The status of the add-on.
  final AddonStatus? status;

  /// The metadata that you apply to the add-on to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Add-on tags do not propagate to any other resources
  /// associated with the cluster.
  final Map<String, String>? tags;

  Addon({
    this.addonArn,
    this.addonName,
    this.addonVersion,
    this.clusterName,
    this.createdAt,
    this.health,
    this.modifiedAt,
    this.serviceAccountRoleArn,
    this.status,
    this.tags,
  });

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      addonArn: json['addonArn'] as String?,
      addonName: json['addonName'] as String?,
      addonVersion: json['addonVersion'] as String?,
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      health: json['health'] != null
          ? AddonHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      serviceAccountRoleArn: json['serviceAccountRoleArn'] as String?,
      status: (json['status'] as String?)?.toAddonStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final addonArn = this.addonArn;
    final addonName = this.addonName;
    final addonVersion = this.addonVersion;
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final health = this.health;
    final modifiedAt = this.modifiedAt;
    final serviceAccountRoleArn = this.serviceAccountRoleArn;
    final status = this.status;
    final tags = this.tags;
    return {
      if (addonArn != null) 'addonArn': addonArn,
      if (addonName != null) 'addonName': addonName,
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (health != null) 'health': health,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (serviceAccountRoleArn != null)
        'serviceAccountRoleArn': serviceAccountRoleArn,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The health of the add-on.
class AddonHealth {
  /// An object that represents the add-on's health issues.
  final List<AddonIssue>? issues;

  AddonHealth({
    this.issues,
  });

  factory AddonHealth.fromJson(Map<String, dynamic> json) {
    return AddonHealth(
      issues: (json['issues'] as List?)
          ?.whereNotNull()
          .map((e) => AddonIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final issues = this.issues;
    return {
      if (issues != null) 'issues': issues,
    };
  }
}

/// Information about an add-on.
class AddonInfo {
  /// The name of the add-on.
  final String? addonName;

  /// An object that represents information about available add-on versions and
  /// compatible Kubernetes versions.
  final List<AddonVersionInfo>? addonVersions;

  /// The type of the add-on.
  final String? type;

  AddonInfo({
    this.addonName,
    this.addonVersions,
    this.type,
  });

  factory AddonInfo.fromJson(Map<String, dynamic> json) {
    return AddonInfo(
      addonName: json['addonName'] as String?,
      addonVersions: (json['addonVersions'] as List?)
          ?.whereNotNull()
          .map((e) => AddonVersionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonVersions = this.addonVersions;
    final type = this.type;
    return {
      if (addonName != null) 'addonName': addonName,
      if (addonVersions != null) 'addonVersions': addonVersions,
      if (type != null) 'type': type,
    };
  }
}

/// An issue related to an add-on.
class AddonIssue {
  /// A code that describes the type of issue.
  final AddonIssueCode? code;

  /// A message that provides details about the issue and what might cause it.
  final String? message;

  /// The resource IDs of the issue.
  final List<String>? resourceIds;

  AddonIssue({
    this.code,
    this.message,
    this.resourceIds,
  });

  factory AddonIssue.fromJson(Map<String, dynamic> json) {
    return AddonIssue(
      code: (json['code'] as String?)?.toAddonIssueCode(),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

enum AddonIssueCode {
  accessDenied,
  internalFailure,
  clusterUnreachable,
  insufficientNumberOfReplicas,
  configurationConflict,
  admissionRequestDenied,
  unsupportedAddonModification,
}

extension on AddonIssueCode {
  String toValue() {
    switch (this) {
      case AddonIssueCode.accessDenied:
        return 'AccessDenied';
      case AddonIssueCode.internalFailure:
        return 'InternalFailure';
      case AddonIssueCode.clusterUnreachable:
        return 'ClusterUnreachable';
      case AddonIssueCode.insufficientNumberOfReplicas:
        return 'InsufficientNumberOfReplicas';
      case AddonIssueCode.configurationConflict:
        return 'ConfigurationConflict';
      case AddonIssueCode.admissionRequestDenied:
        return 'AdmissionRequestDenied';
      case AddonIssueCode.unsupportedAddonModification:
        return 'UnsupportedAddonModification';
    }
  }
}

extension on String {
  AddonIssueCode toAddonIssueCode() {
    switch (this) {
      case 'AccessDenied':
        return AddonIssueCode.accessDenied;
      case 'InternalFailure':
        return AddonIssueCode.internalFailure;
      case 'ClusterUnreachable':
        return AddonIssueCode.clusterUnreachable;
      case 'InsufficientNumberOfReplicas':
        return AddonIssueCode.insufficientNumberOfReplicas;
      case 'ConfigurationConflict':
        return AddonIssueCode.configurationConflict;
      case 'AdmissionRequestDenied':
        return AddonIssueCode.admissionRequestDenied;
      case 'UnsupportedAddonModification':
        return AddonIssueCode.unsupportedAddonModification;
    }
    throw Exception('$this is not known in enum AddonIssueCode');
  }
}

enum AddonStatus {
  creating,
  active,
  createFailed,
  updating,
  deleting,
  deleteFailed,
  degraded,
}

extension on AddonStatus {
  String toValue() {
    switch (this) {
      case AddonStatus.creating:
        return 'CREATING';
      case AddonStatus.active:
        return 'ACTIVE';
      case AddonStatus.createFailed:
        return 'CREATE_FAILED';
      case AddonStatus.updating:
        return 'UPDATING';
      case AddonStatus.deleting:
        return 'DELETING';
      case AddonStatus.deleteFailed:
        return 'DELETE_FAILED';
      case AddonStatus.degraded:
        return 'DEGRADED';
    }
  }
}

extension on String {
  AddonStatus toAddonStatus() {
    switch (this) {
      case 'CREATING':
        return AddonStatus.creating;
      case 'ACTIVE':
        return AddonStatus.active;
      case 'CREATE_FAILED':
        return AddonStatus.createFailed;
      case 'UPDATING':
        return AddonStatus.updating;
      case 'DELETING':
        return AddonStatus.deleting;
      case 'DELETE_FAILED':
        return AddonStatus.deleteFailed;
      case 'DEGRADED':
        return AddonStatus.degraded;
    }
    throw Exception('$this is not known in enum AddonStatus');
  }
}

/// Information about an add-on version.
class AddonVersionInfo {
  /// The version of the add-on.
  final String? addonVersion;

  /// The architectures that the version supports.
  final List<String>? architecture;

  /// An object that represents the compatibilities of a version.
  final List<Compatibility>? compatibilities;

  AddonVersionInfo({
    this.addonVersion,
    this.architecture,
    this.compatibilities,
  });

  factory AddonVersionInfo.fromJson(Map<String, dynamic> json) {
    return AddonVersionInfo(
      addonVersion: json['addonVersion'] as String?,
      architecture: (json['architecture'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      compatibilities: (json['compatibilities'] as List?)
          ?.whereNotNull()
          .map((e) => Compatibility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addonVersion = this.addonVersion;
    final architecture = this.architecture;
    final compatibilities = this.compatibilities;
    return {
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (architecture != null) 'architecture': architecture,
      if (compatibilities != null) 'compatibilities': compatibilities,
    };
  }
}

class AssociateEncryptionConfigResponse {
  final Update? update;

  AssociateEncryptionConfigResponse({
    this.update,
  });

  factory AssociateEncryptionConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateEncryptionConfigResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

class AssociateIdentityProviderConfigResponse {
  /// The tags for the resource.
  final Map<String, String>? tags;
  final Update? update;

  AssociateIdentityProviderConfigResponse({
    this.tags,
    this.update,
  });

  factory AssociateIdentityProviderConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateIdentityProviderConfigResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final update = this.update;
    return {
      if (tags != null) 'tags': tags,
      if (update != null) 'update': update,
    };
  }
}

/// An Auto Scaling group that is associated with an Amazon EKS managed node
/// group.
class AutoScalingGroup {
  /// The name of the Auto Scaling group associated with an Amazon EKS managed
  /// node group.
  final String? name;

  AutoScalingGroup({
    this.name,
  });

  factory AutoScalingGroup.fromJson(Map<String, dynamic> json) {
    return AutoScalingGroup(
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

enum CapacityTypes {
  onDemand,
  spot,
}

extension on CapacityTypes {
  String toValue() {
    switch (this) {
      case CapacityTypes.onDemand:
        return 'ON_DEMAND';
      case CapacityTypes.spot:
        return 'SPOT';
    }
  }
}

extension on String {
  CapacityTypes toCapacityTypes() {
    switch (this) {
      case 'ON_DEMAND':
        return CapacityTypes.onDemand;
      case 'SPOT':
        return CapacityTypes.spot;
    }
    throw Exception('$this is not known in enum CapacityTypes');
  }
}

/// An object representing the <code>certificate-authority-data</code> for your
/// cluster.
class Certificate {
  /// The Base64-encoded certificate data required to communicate with your
  /// cluster. Add this to the <code>certificate-authority-data</code> section of
  /// the <code>kubeconfig</code> file for your cluster.
  final String? data;

  Certificate({
    this.data,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': data,
    };
  }
}

/// An object representing an Amazon EKS cluster.
class Cluster {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? arn;

  /// The <code>certificate-authority-data</code> for your cluster.
  final Certificate? certificateAuthority;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The Unix epoch timestamp in seconds for when the cluster was created.
  final DateTime? createdAt;

  /// The encryption configuration for the cluster.
  final List<EncryptionConfig>? encryptionConfig;

  /// The endpoint for your Kubernetes API server.
  final String? endpoint;

  /// The identity provider information for the cluster.
  final Identity? identity;

  /// The Kubernetes network configuration for the cluster.
  final KubernetesNetworkConfigResponse? kubernetesNetworkConfig;

  /// The logging configuration for your cluster.
  final Logging? logging;

  /// The name of the cluster.
  final String? name;

  /// The platform version of your Amazon EKS cluster. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/platform-versions.html">Platform
  /// Versions</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  final String? platformVersion;

  /// The VPC configuration used by the cluster control plane. Amazon EKS VPC
  /// resources have specific requirements to work properly with Kubernetes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">Cluster
  /// VPC Considerations</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Cluster
  /// Security Group Considerations</a> in the <i>Amazon EKS User Guide</i>.
  final VpcConfigResponse? resourcesVpcConfig;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions for
  /// the Kubernetes control plane to make calls to AWS API operations on your
  /// behalf.
  final String? roleArn;

  /// The current status of the cluster.
  final ClusterStatus? status;

  /// The metadata that you apply to the cluster to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Cluster tags do not propagate to any other resources
  /// associated with the cluster.
  final Map<String, String>? tags;

  /// The Kubernetes server version for the cluster.
  final String? version;

  Cluster({
    this.arn,
    this.certificateAuthority,
    this.clientRequestToken,
    this.createdAt,
    this.encryptionConfig,
    this.endpoint,
    this.identity,
    this.kubernetesNetworkConfig,
    this.logging,
    this.name,
    this.platformVersion,
    this.resourcesVpcConfig,
    this.roleArn,
    this.status,
    this.tags,
    this.version,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      arn: json['arn'] as String?,
      certificateAuthority: json['certificateAuthority'] != null
          ? Certificate.fromJson(
              json['certificateAuthority'] as Map<String, dynamic>)
          : null,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      encryptionConfig: (json['encryptionConfig'] as List?)
          ?.whereNotNull()
          .map((e) => EncryptionConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpoint: json['endpoint'] as String?,
      identity: json['identity'] != null
          ? Identity.fromJson(json['identity'] as Map<String, dynamic>)
          : null,
      kubernetesNetworkConfig: json['kubernetesNetworkConfig'] != null
          ? KubernetesNetworkConfigResponse.fromJson(
              json['kubernetesNetworkConfig'] as Map<String, dynamic>)
          : null,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      platformVersion: json['platformVersion'] as String?,
      resourcesVpcConfig: json['resourcesVpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['resourcesVpcConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toClusterStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthority = this.certificateAuthority;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final encryptionConfig = this.encryptionConfig;
    final endpoint = this.endpoint;
    final identity = this.identity;
    final kubernetesNetworkConfig = this.kubernetesNetworkConfig;
    final logging = this.logging;
    final name = this.name;
    final platformVersion = this.platformVersion;
    final resourcesVpcConfig = this.resourcesVpcConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (certificateAuthority != null)
        'certificateAuthority': certificateAuthority,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (endpoint != null) 'endpoint': endpoint,
      if (identity != null) 'identity': identity,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
      if (logging != null) 'logging': logging,
      if (name != null) 'name': name,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

enum ClusterStatus {
  creating,
  active,
  deleting,
  failed,
  updating,
}

extension on ClusterStatus {
  String toValue() {
    switch (this) {
      case ClusterStatus.creating:
        return 'CREATING';
      case ClusterStatus.active:
        return 'ACTIVE';
      case ClusterStatus.deleting:
        return 'DELETING';
      case ClusterStatus.failed:
        return 'FAILED';
      case ClusterStatus.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  ClusterStatus toClusterStatus() {
    switch (this) {
      case 'CREATING':
        return ClusterStatus.creating;
      case 'ACTIVE':
        return ClusterStatus.active;
      case 'DELETING':
        return ClusterStatus.deleting;
      case 'FAILED':
        return ClusterStatus.failed;
      case 'UPDATING':
        return ClusterStatus.updating;
    }
    throw Exception('$this is not known in enum ClusterStatus');
  }
}

/// Compatibility information.
class Compatibility {
  /// The supported Kubernetes version of the cluster.
  final String? clusterVersion;

  /// The supported default version.
  final bool? defaultVersion;

  /// The supported compute platform.
  final List<String>? platformVersions;

  Compatibility({
    this.clusterVersion,
    this.defaultVersion,
    this.platformVersions,
  });

  factory Compatibility.fromJson(Map<String, dynamic> json) {
    return Compatibility(
      clusterVersion: json['clusterVersion'] as String?,
      defaultVersion: json['defaultVersion'] as bool?,
      platformVersions: (json['platformVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterVersion = this.clusterVersion;
    final defaultVersion = this.defaultVersion;
    final platformVersions = this.platformVersions;
    return {
      if (clusterVersion != null) 'clusterVersion': clusterVersion,
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (platformVersions != null) 'platformVersions': platformVersions,
    };
  }
}

class CreateAddonResponse {
  final Addon? addon;

  CreateAddonResponse({
    this.addon,
  });

  factory CreateAddonResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddonResponse(
      addon: json['addon'] != null
          ? Addon.fromJson(json['addon'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addon = this.addon;
    return {
      if (addon != null) 'addon': addon,
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

class CreateFargateProfileResponse {
  /// The full description of your new Fargate profile.
  final FargateProfile? fargateProfile;

  CreateFargateProfileResponse({
    this.fargateProfile,
  });

  factory CreateFargateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateFargateProfileResponse(
      fargateProfile: json['fargateProfile'] != null
          ? FargateProfile.fromJson(
              json['fargateProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fargateProfile = this.fargateProfile;
    return {
      if (fargateProfile != null) 'fargateProfile': fargateProfile,
    };
  }
}

class CreateNodegroupResponse {
  /// The full description of your new node group.
  final Nodegroup? nodegroup;

  CreateNodegroupResponse({
    this.nodegroup,
  });

  factory CreateNodegroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateNodegroupResponse(
      nodegroup: json['nodegroup'] != null
          ? Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nodegroup = this.nodegroup;
    return {
      if (nodegroup != null) 'nodegroup': nodegroup,
    };
  }
}

class DeleteAddonResponse {
  final Addon? addon;

  DeleteAddonResponse({
    this.addon,
  });

  factory DeleteAddonResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAddonResponse(
      addon: json['addon'] != null
          ? Addon.fromJson(json['addon'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addon = this.addon;
    return {
      if (addon != null) 'addon': addon,
    };
  }
}

class DeleteClusterResponse {
  /// The full description of the cluster to delete.
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

class DeleteFargateProfileResponse {
  /// The deleted Fargate profile.
  final FargateProfile? fargateProfile;

  DeleteFargateProfileResponse({
    this.fargateProfile,
  });

  factory DeleteFargateProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFargateProfileResponse(
      fargateProfile: json['fargateProfile'] != null
          ? FargateProfile.fromJson(
              json['fargateProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fargateProfile = this.fargateProfile;
    return {
      if (fargateProfile != null) 'fargateProfile': fargateProfile,
    };
  }
}

class DeleteNodegroupResponse {
  /// The full description of your deleted node group.
  final Nodegroup? nodegroup;

  DeleteNodegroupResponse({
    this.nodegroup,
  });

  factory DeleteNodegroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNodegroupResponse(
      nodegroup: json['nodegroup'] != null
          ? Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nodegroup = this.nodegroup;
    return {
      if (nodegroup != null) 'nodegroup': nodegroup,
    };
  }
}

class DescribeAddonResponse {
  final Addon? addon;

  DescribeAddonResponse({
    this.addon,
  });

  factory DescribeAddonResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAddonResponse(
      addon: json['addon'] != null
          ? Addon.fromJson(json['addon'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addon = this.addon;
    return {
      if (addon != null) 'addon': addon,
    };
  }
}

class DescribeAddonVersionsResponse {
  /// The list of available versions with Kubernetes version compatibility.
  final List<AddonInfo>? addons;

  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeAddonVersionsResponse</code> where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  DescribeAddonVersionsResponse({
    this.addons,
    this.nextToken,
  });

  factory DescribeAddonVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAddonVersionsResponse(
      addons: (json['addons'] as List?)
          ?.whereNotNull()
          .map((e) => AddonInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addons = this.addons;
    final nextToken = this.nextToken;
    return {
      if (addons != null) 'addons': addons,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeClusterResponse {
  /// The full description of your specified cluster.
  final Cluster? cluster;

  DescribeClusterResponse({
    this.cluster,
  });

  factory DescribeClusterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterResponse(
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

class DescribeFargateProfileResponse {
  /// The full description of your Fargate profile.
  final FargateProfile? fargateProfile;

  DescribeFargateProfileResponse({
    this.fargateProfile,
  });

  factory DescribeFargateProfileResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFargateProfileResponse(
      fargateProfile: json['fargateProfile'] != null
          ? FargateProfile.fromJson(
              json['fargateProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fargateProfile = this.fargateProfile;
    return {
      if (fargateProfile != null) 'fargateProfile': fargateProfile,
    };
  }
}

class DescribeIdentityProviderConfigResponse {
  /// The object that represents an OpenID Connect (OIDC) identity provider
  /// configuration.
  final IdentityProviderConfigResponse? identityProviderConfig;

  DescribeIdentityProviderConfigResponse({
    this.identityProviderConfig,
  });

  factory DescribeIdentityProviderConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeIdentityProviderConfigResponse(
      identityProviderConfig: json['identityProviderConfig'] != null
          ? IdentityProviderConfigResponse.fromJson(
              json['identityProviderConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderConfig = this.identityProviderConfig;
    return {
      if (identityProviderConfig != null)
        'identityProviderConfig': identityProviderConfig,
    };
  }
}

class DescribeNodegroupResponse {
  /// The full description of your node group.
  final Nodegroup? nodegroup;

  DescribeNodegroupResponse({
    this.nodegroup,
  });

  factory DescribeNodegroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeNodegroupResponse(
      nodegroup: json['nodegroup'] != null
          ? Nodegroup.fromJson(json['nodegroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nodegroup = this.nodegroup;
    return {
      if (nodegroup != null) 'nodegroup': nodegroup,
    };
  }
}

class DescribeUpdateResponse {
  /// The full description of the specified update.
  final Update? update;

  DescribeUpdateResponse({
    this.update,
  });

  factory DescribeUpdateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUpdateResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

class DisassociateIdentityProviderConfigResponse {
  final Update? update;

  DisassociateIdentityProviderConfigResponse({
    this.update,
  });

  factory DisassociateIdentityProviderConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateIdentityProviderConfigResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

/// The encryption configuration for the cluster.
class EncryptionConfig {
  /// AWS Key Management Service (AWS KMS) key. Either the ARN or the alias can be
  /// used.
  final Provider? provider;

  /// Specifies the resources to be encrypted. The only supported value is
  /// "secrets".
  final List<String>? resources;

  EncryptionConfig({
    this.provider,
    this.resources,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      provider: json['provider'] != null
          ? Provider.fromJson(json['provider'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final provider = this.provider;
    final resources = this.resources;
    return {
      if (provider != null) 'provider': provider,
      if (resources != null) 'resources': resources,
    };
  }
}

enum ErrorCode {
  subnetNotFound,
  securityGroupNotFound,
  eniLimitReached,
  ipNotAvailable,
  accessDenied,
  operationNotPermitted,
  vpcIdNotFound,
  unknown,
  nodeCreationFailure,
  podEvictionFailure,
  insufficientFreeAddresses,
  clusterUnreachable,
  insufficientNumberOfReplicas,
  configurationConflict,
  admissionRequestDenied,
  unsupportedAddonModification,
}

extension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.subnetNotFound:
        return 'SubnetNotFound';
      case ErrorCode.securityGroupNotFound:
        return 'SecurityGroupNotFound';
      case ErrorCode.eniLimitReached:
        return 'EniLimitReached';
      case ErrorCode.ipNotAvailable:
        return 'IpNotAvailable';
      case ErrorCode.accessDenied:
        return 'AccessDenied';
      case ErrorCode.operationNotPermitted:
        return 'OperationNotPermitted';
      case ErrorCode.vpcIdNotFound:
        return 'VpcIdNotFound';
      case ErrorCode.unknown:
        return 'Unknown';
      case ErrorCode.nodeCreationFailure:
        return 'NodeCreationFailure';
      case ErrorCode.podEvictionFailure:
        return 'PodEvictionFailure';
      case ErrorCode.insufficientFreeAddresses:
        return 'InsufficientFreeAddresses';
      case ErrorCode.clusterUnreachable:
        return 'ClusterUnreachable';
      case ErrorCode.insufficientNumberOfReplicas:
        return 'InsufficientNumberOfReplicas';
      case ErrorCode.configurationConflict:
        return 'ConfigurationConflict';
      case ErrorCode.admissionRequestDenied:
        return 'AdmissionRequestDenied';
      case ErrorCode.unsupportedAddonModification:
        return 'UnsupportedAddonModification';
    }
  }
}

extension on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'SubnetNotFound':
        return ErrorCode.subnetNotFound;
      case 'SecurityGroupNotFound':
        return ErrorCode.securityGroupNotFound;
      case 'EniLimitReached':
        return ErrorCode.eniLimitReached;
      case 'IpNotAvailable':
        return ErrorCode.ipNotAvailable;
      case 'AccessDenied':
        return ErrorCode.accessDenied;
      case 'OperationNotPermitted':
        return ErrorCode.operationNotPermitted;
      case 'VpcIdNotFound':
        return ErrorCode.vpcIdNotFound;
      case 'Unknown':
        return ErrorCode.unknown;
      case 'NodeCreationFailure':
        return ErrorCode.nodeCreationFailure;
      case 'PodEvictionFailure':
        return ErrorCode.podEvictionFailure;
      case 'InsufficientFreeAddresses':
        return ErrorCode.insufficientFreeAddresses;
      case 'ClusterUnreachable':
        return ErrorCode.clusterUnreachable;
      case 'InsufficientNumberOfReplicas':
        return ErrorCode.insufficientNumberOfReplicas;
      case 'ConfigurationConflict':
        return ErrorCode.configurationConflict;
      case 'AdmissionRequestDenied':
        return ErrorCode.admissionRequestDenied;
      case 'UnsupportedAddonModification':
        return ErrorCode.unsupportedAddonModification;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// An object representing an error when an asynchronous operation fails.
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
  final ErrorCode? errorCode;

  /// A more complete description of the error.
  final String? errorMessage;

  /// An optional field that contains the resource IDs associated with the error.
  final List<String>? resourceIds;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.resourceIds,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final resourceIds = this.resourceIds;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// An object representing an AWS Fargate profile.
class FargateProfile {
  /// The name of the Amazon EKS cluster that the Fargate profile belongs to.
  final String? clusterName;

  /// The Unix epoch timestamp in seconds for when the Fargate profile was
  /// created.
  final DateTime? createdAt;

  /// The full Amazon Resource Name (ARN) of the Fargate profile.
  final String? fargateProfileArn;

  /// The name of the Fargate profile.
  final String? fargateProfileName;

  /// The Amazon Resource Name (ARN) of the pod execution role to use for pods
  /// that match the selectors in the Fargate profile. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">Pod
  /// Execution Role</a> in the <i>Amazon EKS User Guide</i>.
  final String? podExecutionRoleArn;

  /// The selectors to match for pods to use this Fargate profile.
  final List<FargateProfileSelector>? selectors;

  /// The current status of the Fargate profile.
  final FargateProfileStatus? status;

  /// The IDs of subnets to launch pods into.
  final List<String>? subnets;

  /// The metadata applied to the Fargate profile to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both of
  /// which you define. Fargate profile tags do not propagate to any other
  /// resources associated with the Fargate profile, such as the pods that are
  /// scheduled with it.
  final Map<String, String>? tags;

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

  factory FargateProfile.fromJson(Map<String, dynamic> json) {
    return FargateProfile(
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fargateProfileArn: json['fargateProfileArn'] as String?,
      fargateProfileName: json['fargateProfileName'] as String?,
      podExecutionRoleArn: json['podExecutionRoleArn'] as String?,
      selectors: (json['selectors'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FargateProfileSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toFargateProfileStatus(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final fargateProfileArn = this.fargateProfileArn;
    final fargateProfileName = this.fargateProfileName;
    final podExecutionRoleArn = this.podExecutionRoleArn;
    final selectors = this.selectors;
    final status = this.status;
    final subnets = this.subnets;
    final tags = this.tags;
    return {
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fargateProfileArn != null) 'fargateProfileArn': fargateProfileArn,
      if (fargateProfileName != null) 'fargateProfileName': fargateProfileName,
      if (podExecutionRoleArn != null)
        'podExecutionRoleArn': podExecutionRoleArn,
      if (selectors != null) 'selectors': selectors,
      if (status != null) 'status': status.toValue(),
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object representing an AWS Fargate profile selector.
class FargateProfileSelector {
  /// The Kubernetes labels that the selector should match. A pod must contain all
  /// of the labels that are specified in the selector for it to be considered a
  /// match.
  final Map<String, String>? labels;

  /// The Kubernetes namespace that the selector should match.
  final String? namespace;

  FargateProfileSelector({
    this.labels,
    this.namespace,
  });

  factory FargateProfileSelector.fromJson(Map<String, dynamic> json) {
    return FargateProfileSelector(
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labels = this.labels;
    final namespace = this.namespace;
    return {
      if (labels != null) 'labels': labels,
      if (namespace != null) 'namespace': namespace,
    };
  }
}

enum FargateProfileStatus {
  creating,
  active,
  deleting,
  createFailed,
  deleteFailed,
}

extension on FargateProfileStatus {
  String toValue() {
    switch (this) {
      case FargateProfileStatus.creating:
        return 'CREATING';
      case FargateProfileStatus.active:
        return 'ACTIVE';
      case FargateProfileStatus.deleting:
        return 'DELETING';
      case FargateProfileStatus.createFailed:
        return 'CREATE_FAILED';
      case FargateProfileStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension on String {
  FargateProfileStatus toFargateProfileStatus() {
    switch (this) {
      case 'CREATING':
        return FargateProfileStatus.creating;
      case 'ACTIVE':
        return FargateProfileStatus.active;
      case 'DELETING':
        return FargateProfileStatus.deleting;
      case 'CREATE_FAILED':
        return FargateProfileStatus.createFailed;
      case 'DELETE_FAILED':
        return FargateProfileStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum FargateProfileStatus');
  }
}

/// An object representing an identity provider.
class Identity {
  /// An object representing the <a href="https://openid.net/connect/">OpenID
  /// Connect</a> identity provider information.
  final OIDC? oidc;

  Identity({
    this.oidc,
  });

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      oidc: json['oidc'] != null
          ? OIDC.fromJson(json['oidc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oidc = this.oidc;
    return {
      if (oidc != null) 'oidc': oidc,
    };
  }
}

/// An object representing an identity provider configuration.
class IdentityProviderConfig {
  /// The name of the identity provider configuration.
  final String name;

  /// The type of the identity provider configuration.
  final String type;

  IdentityProviderConfig({
    required this.name,
    required this.type,
  });

  factory IdentityProviderConfig.fromJson(Map<String, dynamic> json) {
    return IdentityProviderConfig(
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// An object that represents an identity configuration.
class IdentityProviderConfigResponse {
  /// An object that represents an OpenID Connect (OIDC) identity provider
  /// configuration.
  final OidcIdentityProviderConfig? oidc;

  IdentityProviderConfigResponse({
    this.oidc,
  });

  factory IdentityProviderConfigResponse.fromJson(Map<String, dynamic> json) {
    return IdentityProviderConfigResponse(
      oidc: json['oidc'] != null
          ? OidcIdentityProviderConfig.fromJson(
              json['oidc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oidc = this.oidc;
    return {
      if (oidc != null) 'oidc': oidc,
    };
  }
}

/// An object representing an issue with an Amazon EKS resource.
class Issue {
  /// A brief description of the error.
  ///
  /// <ul>
  /// <li>
  /// <b>AccessDenied</b>: Amazon EKS or one or more of your managed nodes is
  /// failing to authenticate or authorize with your Kubernetes cluster API
  /// server.
  /// </li>
  /// <li>
  /// <b>AsgInstanceLaunchFailures</b>: Your Auto Scaling group is experiencing
  /// failures while attempting to launch instances.
  /// </li>
  /// <li>
  /// <b>AutoScalingGroupNotFound</b>: We couldn't find the Auto Scaling group
  /// associated with the managed node group. You may be able to recreate an Auto
  /// Scaling group with the same settings to recover.
  /// </li>
  /// <li>
  /// <b>ClusterUnreachable</b>: Amazon EKS or one or more of your managed nodes
  /// is unable to to communicate with your Kubernetes cluster API server. This
  /// can happen if there are network disruptions or if API servers are timing out
  /// processing requests.
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
  /// <b>Ec2SecurityGroupDeletionFailure</b>: We could not delete the remote
  /// access security group for your managed node group. Remove any dependencies
  /// from the security group.
  /// </li>
  /// <li>
  /// <b>Ec2SecurityGroupNotFound</b>: We couldn't find the cluster security group
  /// for the cluster. You must recreate your cluster.
  /// </li>
  /// <li>
  /// <b>Ec2SubnetInvalidConfiguration</b>: One or more Amazon EC2 subnets
  /// specified for a node group do not automatically assign public IP addresses
  /// to instances launched into it. If you want your instances to be assigned a
  /// public IP address, then you need to enable the <code>auto-assign public IP
  /// address</code> setting for the subnet. See <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html#subnet-public-ip">Modifying
  /// the public IPv4 addressing attribute for your subnet</a> in the Amazon VPC
  /// User Guide.
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
  /// <b>InternalFailure</b>: These errors are usually caused by an Amazon EKS
  /// server-side issue.
  /// </li>
  /// <li>
  /// <b>NodeCreationFailure</b>: Your launched instances are unable to register
  /// with your Amazon EKS cluster. Common causes of this failure are insufficient
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/worker_node_IAM_role.html">node
  /// IAM role</a> permissions or lack of outbound internet access for the nodes.
  /// </li>
  /// </ul>
  final NodegroupIssueCode? code;

  /// The error message associated with the issue.
  final String? message;

  /// The AWS resources that are afflicted by this issue.
  final List<String>? resourceIds;

  Issue({
    this.code,
    this.message,
    this.resourceIds,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      code: (json['code'] as String?)?.toNodegroupIssueCode(),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// The Kubernetes network configuration for the cluster.
class KubernetesNetworkConfigRequest {
  /// The CIDR block to assign Kubernetes service IP addresses from. If you don't
  /// specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16
  /// or 172.20.0.0/16 CIDR blocks. We recommend that you specify a block that
  /// does not overlap with resources in other networks that are peered or
  /// connected to your VPC. The block must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Within one of the following private IP address blocks: 10.0.0.0/8,
  /// 172.16.0.0.0/12, or 192.168.0.0/16.
  /// </li>
  /// <li>
  /// Doesn't overlap with any CIDR block assigned to the VPC that you selected
  /// for VPC.
  /// </li>
  /// <li>
  /// Between /24 and /12.
  /// </li>
  /// </ul> <important>
  /// You can only specify a custom CIDR block when you create a cluster and can't
  /// change this value once the cluster is created.
  /// </important>
  final String? serviceIpv4Cidr;

  KubernetesNetworkConfigRequest({
    this.serviceIpv4Cidr,
  });

  factory KubernetesNetworkConfigRequest.fromJson(Map<String, dynamic> json) {
    return KubernetesNetworkConfigRequest(
      serviceIpv4Cidr: json['serviceIpv4Cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    return {
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
    };
  }
}

/// The Kubernetes network configuration for the cluster.
class KubernetesNetworkConfigResponse {
  /// The CIDR block that Kubernetes service IP addresses are assigned from. If
  /// you didn't specify a CIDR block when you created the cluster, then
  /// Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16
  /// CIDR blocks. If this was specified, then it was specified when the cluster
  /// was created and it cannot be changed.
  final String? serviceIpv4Cidr;

  KubernetesNetworkConfigResponse({
    this.serviceIpv4Cidr,
  });

  factory KubernetesNetworkConfigResponse.fromJson(Map<String, dynamic> json) {
    return KubernetesNetworkConfigResponse(
      serviceIpv4Cidr: json['serviceIpv4Cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    return {
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
    };
  }
}

/// An object representing a node group launch template specification. The
/// launch template cannot include <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateNetworkInterface.html">
/// <code>SubnetId</code> </a>, <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_IamInstanceProfile.html">
/// <code>IamInstanceProfile</code> </a>, <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RequestSpotInstances.html">
/// <code>RequestSpotInstances</code> </a>, <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_HibernationOptionsRequest.html">
/// <code>HibernationOptions</code> </a>, or <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TerminateInstances.html">
/// <code>TerminateInstances</code> </a>, or the node group deployment or update
/// will fail. For more information about launch templates, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html">
/// <code>CreateLaunchTemplate</code> </a> in the Amazon EC2 API Reference. For
/// more information about using launch templates with Amazon EKS, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
/// template support</a> in the Amazon EKS User Guide.
///
/// Specify either <code>name</code> or <code>id</code>, but not both.
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  final String? id;

  /// The name of the launch template.
  final String? name;

  /// The version of the launch template to use. If no version is specified, then
  /// the template's default version is used.
  final String? version;

  LaunchTemplateSpecification({
    this.id,
    this.name,
    this.version,
  });

  factory LaunchTemplateSpecification.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateSpecification(
      id: json['id'] as String?,
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

class ListAddonsResponse {
  /// A list of available add-ons.
  final List<String>? addons;

  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListAddonsResponse</code> where <code>maxResults</code> was used and
  /// the results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the <code>nextToken</code>
  /// value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  ListAddonsResponse({
    this.addons,
    this.nextToken,
  });

  factory ListAddonsResponse.fromJson(Map<String, dynamic> json) {
    return ListAddonsResponse(
      addons: (json['addons'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addons = this.addons;
    final nextToken = this.nextToken;
    return {
      if (addons != null) 'addons': addons,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListClustersResponse {
  /// A list of all of the clusters for your account in the specified Region.
  final List<String>? clusters;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListClusters</code> request. When the results of a
  /// <code>ListClusters</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListClustersResponse({
    this.clusters,
    this.nextToken,
  });

  factory ListClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListClustersResponse(
      clusters: (json['clusters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final nextToken = this.nextToken;
    return {
      if (clusters != null) 'clusters': clusters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFargateProfilesResponse {
  /// A list of all of the Fargate profiles associated with the specified cluster.
  final List<String>? fargateProfileNames;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListFargateProfiles</code> request. When the results of a
  /// <code>ListFargateProfiles</code> request exceed <code>maxResults</code>, you
  /// can use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListFargateProfilesResponse({
    this.fargateProfileNames,
    this.nextToken,
  });

  factory ListFargateProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListFargateProfilesResponse(
      fargateProfileNames: (json['fargateProfileNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fargateProfileNames = this.fargateProfileNames;
    final nextToken = this.nextToken;
    return {
      if (fargateProfileNames != null)
        'fargateProfileNames': fargateProfileNames,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIdentityProviderConfigsResponse {
  /// The identity provider configurations for the cluster.
  final List<IdentityProviderConfig>? identityProviderConfigs;

  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListIdentityProviderConfigsResponse</code> where
  /// <code>maxResults</code> was used and the results exceeded the value of that
  /// parameter. Pagination continues from the end of the previous results that
  /// returned the <code>nextToken</code> value.
  final String? nextToken;

  ListIdentityProviderConfigsResponse({
    this.identityProviderConfigs,
    this.nextToken,
  });

  factory ListIdentityProviderConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListIdentityProviderConfigsResponse(
      identityProviderConfigs: (json['identityProviderConfigs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => IdentityProviderConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderConfigs = this.identityProviderConfigs;
    final nextToken = this.nextToken;
    return {
      if (identityProviderConfigs != null)
        'identityProviderConfigs': identityProviderConfigs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNodegroupsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListNodegroups</code> request. When the results of a
  /// <code>ListNodegroups</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A list of all of the node groups associated with the specified cluster.
  final List<String>? nodegroups;

  ListNodegroupsResponse({
    this.nextToken,
    this.nodegroups,
  });

  factory ListNodegroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListNodegroupsResponse(
      nextToken: json['nextToken'] as String?,
      nodegroups: (json['nodegroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodegroups = this.nodegroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (nodegroups != null) 'nodegroups': nodegroups,
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

class ListUpdatesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListUpdates</code> request. When the results of a
  /// <code>ListUpdates</code> request exceed <code>maxResults</code>, you can use
  /// this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A list of all the updates for the specified cluster and Region.
  final List<String>? updateIds;

  ListUpdatesResponse({
    this.nextToken,
    this.updateIds,
  });

  factory ListUpdatesResponse.fromJson(Map<String, dynamic> json) {
    return ListUpdatesResponse(
      nextToken: json['nextToken'] as String?,
      updateIds: (json['updateIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final updateIds = this.updateIds;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (updateIds != null) 'updateIds': updateIds,
    };
  }
}

/// An object representing the enabled or disabled Kubernetes control plane logs
/// for your cluster.
class LogSetup {
  /// If a log type is enabled, that log type exports its control plane logs to
  /// CloudWatch Logs. If a log type isn't enabled, that log type doesn't export
  /// its control plane logs. Each individual log type can be enabled or disabled
  /// independently.
  final bool? enabled;

  /// The available cluster control plane log types.
  final List<LogType>? types;

  LogSetup({
    this.enabled,
    this.types,
  });

  factory LogSetup.fromJson(Map<String, dynamic> json) {
    return LogSetup(
      enabled: json['enabled'] as bool?,
      types: (json['types'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLogType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final types = this.types;
    return {
      if (enabled != null) 'enabled': enabled,
      if (types != null) 'types': types.map((e) => e.toValue()).toList(),
    };
  }
}

enum LogType {
  api,
  audit,
  authenticator,
  controllerManager,
  scheduler,
}

extension on LogType {
  String toValue() {
    switch (this) {
      case LogType.api:
        return 'api';
      case LogType.audit:
        return 'audit';
      case LogType.authenticator:
        return 'authenticator';
      case LogType.controllerManager:
        return 'controllerManager';
      case LogType.scheduler:
        return 'scheduler';
    }
  }
}

extension on String {
  LogType toLogType() {
    switch (this) {
      case 'api':
        return LogType.api;
      case 'audit':
        return LogType.audit;
      case 'authenticator':
        return LogType.authenticator;
      case 'controllerManager':
        return LogType.controllerManager;
      case 'scheduler':
        return LogType.scheduler;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

/// An object representing the logging configuration for resources in your
/// cluster.
class Logging {
  /// The cluster control plane logging configuration for your cluster.
  final List<LogSetup>? clusterLogging;

  Logging({
    this.clusterLogging,
  });

  factory Logging.fromJson(Map<String, dynamic> json) {
    return Logging(
      clusterLogging: (json['clusterLogging'] as List?)
          ?.whereNotNull()
          .map((e) => LogSetup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterLogging = this.clusterLogging;
    return {
      if (clusterLogging != null) 'clusterLogging': clusterLogging,
    };
  }
}

/// An object representing an Amazon EKS managed node group.
class Nodegroup {
  /// If the node group was deployed using a launch template with a custom AMI,
  /// then this is <code>CUSTOM</code>. For node groups that weren't deployed
  /// using a launch template, this is the AMI type that was specified in the node
  /// group configuration.
  final AMITypes? amiType;

  /// The capacity type of your managed node group.
  final CapacityTypes? capacityType;

  /// The name of the cluster that the managed node group resides in.
  final String? clusterName;

  /// The Unix epoch timestamp in seconds for when the managed node group was
  /// created.
  final DateTime? createdAt;

  /// If the node group wasn't deployed with a launch template, then this is the
  /// disk size in the node group configuration. If the node group was deployed
  /// with a launch template, then this is <code>null</code>.
  final int? diskSize;

  /// The health status of the node group. If there are issues with your node
  /// group's health, they are listed here.
  final NodegroupHealth? health;

  /// If the node group wasn't deployed with a launch template, then this is the
  /// instance type that is associated with the node group. If the node group was
  /// deployed with a launch template, then this is <code>null</code>.
  final List<String>? instanceTypes;

  /// The Kubernetes labels applied to the nodes in the node group.
  /// <note>
  /// Only labels that are applied with the Amazon EKS API are shown here. There
  /// may be other Kubernetes labels applied to the nodes in this group.
  /// </note>
  final Map<String, String>? labels;

  /// If a launch template was used to create the node group, then this is the
  /// launch template that was used.
  final LaunchTemplateSpecification? launchTemplate;

  /// The Unix epoch timestamp in seconds for when the managed node group was last
  /// modified.
  final DateTime? modifiedAt;

  /// The IAM role associated with your node group. The Amazon EKS node
  /// <code>kubelet</code> daemon makes calls to AWS APIs on your behalf. Nodes
  /// receive permissions for these API calls through an IAM instance profile and
  /// associated policies.
  final String? nodeRole;

  /// The Amazon Resource Name (ARN) associated with the managed node group.
  final String? nodegroupArn;

  /// The name associated with an Amazon EKS managed node group.
  final String? nodegroupName;

  /// If the node group was deployed using a launch template with a custom AMI,
  /// then this is the AMI ID that was specified in the launch template. For node
  /// groups that weren't deployed using a launch template, this is the version of
  /// the Amazon EKS optimized AMI that the node group was deployed with.
  final String? releaseVersion;

  /// If the node group wasn't deployed with a launch template, then this is the
  /// remote access configuration that is associated with the node group. If the
  /// node group was deployed with a launch template, then this is
  /// <code>null</code>.
  final RemoteAccessConfig? remoteAccess;

  /// The resources associated with the node group, such as Auto Scaling groups
  /// and security groups for remote access.
  final NodegroupResources? resources;

  /// The scaling configuration details for the Auto Scaling group that is
  /// associated with your node group.
  final NodegroupScalingConfig? scalingConfig;

  /// The current status of the managed node group.
  final NodegroupStatus? status;

  /// The subnets that were specified for the Auto Scaling group that is
  /// associated with your node group.
  final List<String>? subnets;

  /// The metadata applied to the node group to assist with categorization and
  /// organization. Each tag consists of a key and an optional value, both of
  /// which you define. Node group tags do not propagate to any other resources
  /// associated with the node group, such as the Amazon EC2 instances or subnets.
  final Map<String, String>? tags;

  /// The Kubernetes taints to be applied to the nodes in the node group when they
  /// are created. Effect is one of <code>NoSchedule</code>,
  /// <code>PreferNoSchedule</code>, or <code>NoExecute</code>. Kubernetes taints
  /// can be used together with tolerations to control how workloads are scheduled
  /// to your nodes.
  final List<Taint>? taints;
  final NodegroupUpdateConfig? updateConfig;

  /// The Kubernetes version of the managed node group.
  final String? version;

  Nodegroup({
    this.amiType,
    this.capacityType,
    this.clusterName,
    this.createdAt,
    this.diskSize,
    this.health,
    this.instanceTypes,
    this.labels,
    this.launchTemplate,
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
    this.taints,
    this.updateConfig,
    this.version,
  });

  factory Nodegroup.fromJson(Map<String, dynamic> json) {
    return Nodegroup(
      amiType: (json['amiType'] as String?)?.toAMITypes(),
      capacityType: (json['capacityType'] as String?)?.toCapacityTypes(),
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      diskSize: json['diskSize'] as int?,
      health: json['health'] != null
          ? NodegroupHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      launchTemplate: json['launchTemplate'] != null
          ? LaunchTemplateSpecification.fromJson(
              json['launchTemplate'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      nodeRole: json['nodeRole'] as String?,
      nodegroupArn: json['nodegroupArn'] as String?,
      nodegroupName: json['nodegroupName'] as String?,
      releaseVersion: json['releaseVersion'] as String?,
      remoteAccess: json['remoteAccess'] != null
          ? RemoteAccessConfig.fromJson(
              json['remoteAccess'] as Map<String, dynamic>)
          : null,
      resources: json['resources'] != null
          ? NodegroupResources.fromJson(
              json['resources'] as Map<String, dynamic>)
          : null,
      scalingConfig: json['scalingConfig'] != null
          ? NodegroupScalingConfig.fromJson(
              json['scalingConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toNodegroupStatus(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      taints: (json['taints'] as List?)
          ?.whereNotNull()
          .map((e) => Taint.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateConfig: json['updateConfig'] != null
          ? NodegroupUpdateConfig.fromJson(
              json['updateConfig'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amiType = this.amiType;
    final capacityType = this.capacityType;
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final diskSize = this.diskSize;
    final health = this.health;
    final instanceTypes = this.instanceTypes;
    final labels = this.labels;
    final launchTemplate = this.launchTemplate;
    final modifiedAt = this.modifiedAt;
    final nodeRole = this.nodeRole;
    final nodegroupArn = this.nodegroupArn;
    final nodegroupName = this.nodegroupName;
    final releaseVersion = this.releaseVersion;
    final remoteAccess = this.remoteAccess;
    final resources = this.resources;
    final scalingConfig = this.scalingConfig;
    final status = this.status;
    final subnets = this.subnets;
    final tags = this.tags;
    final taints = this.taints;
    final updateConfig = this.updateConfig;
    final version = this.version;
    return {
      if (amiType != null) 'amiType': amiType.toValue(),
      if (capacityType != null) 'capacityType': capacityType.toValue(),
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (diskSize != null) 'diskSize': diskSize,
      if (health != null) 'health': health,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (labels != null) 'labels': labels,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (nodeRole != null) 'nodeRole': nodeRole,
      if (nodegroupArn != null) 'nodegroupArn': nodegroupArn,
      if (nodegroupName != null) 'nodegroupName': nodegroupName,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (remoteAccess != null) 'remoteAccess': remoteAccess,
      if (resources != null) 'resources': resources,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (status != null) 'status': status.toValue(),
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
      if (version != null) 'version': version,
    };
  }
}

/// An object representing the health status of the node group.
class NodegroupHealth {
  /// Any issues that are associated with the node group.
  final List<Issue>? issues;

  NodegroupHealth({
    this.issues,
  });

  factory NodegroupHealth.fromJson(Map<String, dynamic> json) {
    return NodegroupHealth(
      issues: (json['issues'] as List?)
          ?.whereNotNull()
          .map((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final issues = this.issues;
    return {
      if (issues != null) 'issues': issues,
    };
  }
}

enum NodegroupIssueCode {
  autoScalingGroupNotFound,
  autoScalingGroupInvalidConfiguration,
  ec2SecurityGroupNotFound,
  ec2SecurityGroupDeletionFailure,
  ec2LaunchTemplateNotFound,
  ec2LaunchTemplateVersionMismatch,
  ec2SubnetNotFound,
  ec2SubnetInvalidConfiguration,
  iamInstanceProfileNotFound,
  iamLimitExceeded,
  iamNodeRoleNotFound,
  nodeCreationFailure,
  asgInstanceLaunchFailures,
  instanceLimitExceeded,
  insufficientFreeAddresses,
  accessDenied,
  internalFailure,
  clusterUnreachable,
}

extension on NodegroupIssueCode {
  String toValue() {
    switch (this) {
      case NodegroupIssueCode.autoScalingGroupNotFound:
        return 'AutoScalingGroupNotFound';
      case NodegroupIssueCode.autoScalingGroupInvalidConfiguration:
        return 'AutoScalingGroupInvalidConfiguration';
      case NodegroupIssueCode.ec2SecurityGroupNotFound:
        return 'Ec2SecurityGroupNotFound';
      case NodegroupIssueCode.ec2SecurityGroupDeletionFailure:
        return 'Ec2SecurityGroupDeletionFailure';
      case NodegroupIssueCode.ec2LaunchTemplateNotFound:
        return 'Ec2LaunchTemplateNotFound';
      case NodegroupIssueCode.ec2LaunchTemplateVersionMismatch:
        return 'Ec2LaunchTemplateVersionMismatch';
      case NodegroupIssueCode.ec2SubnetNotFound:
        return 'Ec2SubnetNotFound';
      case NodegroupIssueCode.ec2SubnetInvalidConfiguration:
        return 'Ec2SubnetInvalidConfiguration';
      case NodegroupIssueCode.iamInstanceProfileNotFound:
        return 'IamInstanceProfileNotFound';
      case NodegroupIssueCode.iamLimitExceeded:
        return 'IamLimitExceeded';
      case NodegroupIssueCode.iamNodeRoleNotFound:
        return 'IamNodeRoleNotFound';
      case NodegroupIssueCode.nodeCreationFailure:
        return 'NodeCreationFailure';
      case NodegroupIssueCode.asgInstanceLaunchFailures:
        return 'AsgInstanceLaunchFailures';
      case NodegroupIssueCode.instanceLimitExceeded:
        return 'InstanceLimitExceeded';
      case NodegroupIssueCode.insufficientFreeAddresses:
        return 'InsufficientFreeAddresses';
      case NodegroupIssueCode.accessDenied:
        return 'AccessDenied';
      case NodegroupIssueCode.internalFailure:
        return 'InternalFailure';
      case NodegroupIssueCode.clusterUnreachable:
        return 'ClusterUnreachable';
    }
  }
}

extension on String {
  NodegroupIssueCode toNodegroupIssueCode() {
    switch (this) {
      case 'AutoScalingGroupNotFound':
        return NodegroupIssueCode.autoScalingGroupNotFound;
      case 'AutoScalingGroupInvalidConfiguration':
        return NodegroupIssueCode.autoScalingGroupInvalidConfiguration;
      case 'Ec2SecurityGroupNotFound':
        return NodegroupIssueCode.ec2SecurityGroupNotFound;
      case 'Ec2SecurityGroupDeletionFailure':
        return NodegroupIssueCode.ec2SecurityGroupDeletionFailure;
      case 'Ec2LaunchTemplateNotFound':
        return NodegroupIssueCode.ec2LaunchTemplateNotFound;
      case 'Ec2LaunchTemplateVersionMismatch':
        return NodegroupIssueCode.ec2LaunchTemplateVersionMismatch;
      case 'Ec2SubnetNotFound':
        return NodegroupIssueCode.ec2SubnetNotFound;
      case 'Ec2SubnetInvalidConfiguration':
        return NodegroupIssueCode.ec2SubnetInvalidConfiguration;
      case 'IamInstanceProfileNotFound':
        return NodegroupIssueCode.iamInstanceProfileNotFound;
      case 'IamLimitExceeded':
        return NodegroupIssueCode.iamLimitExceeded;
      case 'IamNodeRoleNotFound':
        return NodegroupIssueCode.iamNodeRoleNotFound;
      case 'NodeCreationFailure':
        return NodegroupIssueCode.nodeCreationFailure;
      case 'AsgInstanceLaunchFailures':
        return NodegroupIssueCode.asgInstanceLaunchFailures;
      case 'InstanceLimitExceeded':
        return NodegroupIssueCode.instanceLimitExceeded;
      case 'InsufficientFreeAddresses':
        return NodegroupIssueCode.insufficientFreeAddresses;
      case 'AccessDenied':
        return NodegroupIssueCode.accessDenied;
      case 'InternalFailure':
        return NodegroupIssueCode.internalFailure;
      case 'ClusterUnreachable':
        return NodegroupIssueCode.clusterUnreachable;
    }
    throw Exception('$this is not known in enum NodegroupIssueCode');
  }
}

/// An object representing the resources associated with the node group, such as
/// Auto Scaling groups and security groups for remote access.
class NodegroupResources {
  /// The Auto Scaling groups associated with the node group.
  final List<AutoScalingGroup>? autoScalingGroups;

  /// The remote access security group associated with the node group. This
  /// security group controls SSH access to the nodes.
  final String? remoteAccessSecurityGroup;

  NodegroupResources({
    this.autoScalingGroups,
    this.remoteAccessSecurityGroup,
  });

  factory NodegroupResources.fromJson(Map<String, dynamic> json) {
    return NodegroupResources(
      autoScalingGroups: (json['autoScalingGroups'] as List?)
          ?.whereNotNull()
          .map((e) => AutoScalingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteAccessSecurityGroup: json['remoteAccessSecurityGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingGroups = this.autoScalingGroups;
    final remoteAccessSecurityGroup = this.remoteAccessSecurityGroup;
    return {
      if (autoScalingGroups != null) 'autoScalingGroups': autoScalingGroups,
      if (remoteAccessSecurityGroup != null)
        'remoteAccessSecurityGroup': remoteAccessSecurityGroup,
    };
  }
}

/// An object representing the scaling configuration details for the Auto
/// Scaling group that is associated with your node group. When creating a node
/// group, you must specify all or none of the properties. When updating a node
/// group, you can specify any or none of the properties.
class NodegroupScalingConfig {
  /// The current number of nodes that the managed node group should maintain.
  final int? desiredSize;

  /// The maximum number of nodes that the managed node group can scale out to.
  /// For information about the maximum number that you can specify, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service-quotas.html">Amazon
  /// EKS service quotas</a> in the <i>Amazon EKS User Guide</i>.
  final int? maxSize;

  /// The minimum number of nodes that the managed node group can scale in to.
  /// This number must be greater than zero.
  final int? minSize;

  NodegroupScalingConfig({
    this.desiredSize,
    this.maxSize,
    this.minSize,
  });

  factory NodegroupScalingConfig.fromJson(Map<String, dynamic> json) {
    return NodegroupScalingConfig(
      desiredSize: json['desiredSize'] as int?,
      maxSize: json['maxSize'] as int?,
      minSize: json['minSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredSize = this.desiredSize;
    final maxSize = this.maxSize;
    final minSize = this.minSize;
    return {
      if (desiredSize != null) 'desiredSize': desiredSize,
      if (maxSize != null) 'maxSize': maxSize,
      if (minSize != null) 'minSize': minSize,
    };
  }
}

enum NodegroupStatus {
  creating,
  active,
  updating,
  deleting,
  createFailed,
  deleteFailed,
  degraded,
}

extension on NodegroupStatus {
  String toValue() {
    switch (this) {
      case NodegroupStatus.creating:
        return 'CREATING';
      case NodegroupStatus.active:
        return 'ACTIVE';
      case NodegroupStatus.updating:
        return 'UPDATING';
      case NodegroupStatus.deleting:
        return 'DELETING';
      case NodegroupStatus.createFailed:
        return 'CREATE_FAILED';
      case NodegroupStatus.deleteFailed:
        return 'DELETE_FAILED';
      case NodegroupStatus.degraded:
        return 'DEGRADED';
    }
  }
}

extension on String {
  NodegroupStatus toNodegroupStatus() {
    switch (this) {
      case 'CREATING':
        return NodegroupStatus.creating;
      case 'ACTIVE':
        return NodegroupStatus.active;
      case 'UPDATING':
        return NodegroupStatus.updating;
      case 'DELETING':
        return NodegroupStatus.deleting;
      case 'CREATE_FAILED':
        return NodegroupStatus.createFailed;
      case 'DELETE_FAILED':
        return NodegroupStatus.deleteFailed;
      case 'DEGRADED':
        return NodegroupStatus.degraded;
    }
    throw Exception('$this is not known in enum NodegroupStatus');
  }
}

class NodegroupUpdateConfig {
  final int? maxUnavailable;
  final int? maxUnavailablePercentage;

  NodegroupUpdateConfig({
    this.maxUnavailable,
    this.maxUnavailablePercentage,
  });

  factory NodegroupUpdateConfig.fromJson(Map<String, dynamic> json) {
    return NodegroupUpdateConfig(
      maxUnavailable: json['maxUnavailable'] as int?,
      maxUnavailablePercentage: json['maxUnavailablePercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxUnavailable = this.maxUnavailable;
    final maxUnavailablePercentage = this.maxUnavailablePercentage;
    return {
      if (maxUnavailable != null) 'maxUnavailable': maxUnavailable,
      if (maxUnavailablePercentage != null)
        'maxUnavailablePercentage': maxUnavailablePercentage,
    };
  }
}

/// An object representing the <a href="https://openid.net/connect/">OpenID
/// Connect</a> (OIDC) identity provider information for the cluster.
class OIDC {
  /// The issuer URL for the OIDC identity provider.
  final String? issuer;

  OIDC({
    this.issuer,
  });

  factory OIDC.fromJson(Map<String, dynamic> json) {
    return OIDC(
      issuer: json['issuer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final issuer = this.issuer;
    return {
      if (issuer != null) 'issuer': issuer,
    };
  }
}

/// An object that represents the configuration for an OpenID Connect (OIDC)
/// identity provider.
class OidcIdentityProviderConfig {
  /// This is also known as <i>audience</i>. The ID of the client application that
  /// makes authentication requests to the OIDC identity provider.
  final String? clientId;

  /// The cluster that the configuration is associated to.
  final String? clusterName;

  /// The JSON web token (JWT) claim that the provider uses to return your groups.
  final String? groupsClaim;

  /// The prefix that is prepended to group claims to prevent clashes with
  /// existing names (such as <code>system:</code> groups). For example, the
  /// value<code> oidc:</code> creates group names like
  /// <code>oidc:engineering</code> and <code>oidc:infra</code>. The prefix can't
  /// contain <code>system:</code>
  final String? groupsPrefix;

  /// The ARN of the configuration.
  final String? identityProviderConfigArn;

  /// The name of the configuration.
  final String? identityProviderConfigName;

  /// The URL of the OIDC identity provider that allows the API server to discover
  /// public signing keys for verifying tokens.
  final String? issuerUrl;

  /// The key-value pairs that describe required claims in the identity token. If
  /// set, each claim is verified to be present in the token with a matching
  /// value.
  final Map<String, String>? requiredClaims;

  /// The status of the OIDC identity provider.
  final ConfigStatus? status;

  /// The metadata to apply to the provider configuration to assist with
  /// categorization and organization. Each tag consists of a key and an optional
  /// value, both of which you defined.
  final Map<String, String>? tags;

  /// The JSON Web token (JWT) claim that is used as the username.
  final String? usernameClaim;

  /// The prefix that is prepended to username claims to prevent clashes with
  /// existing names. The prefix can't contain <code>system:</code>
  final String? usernamePrefix;

  OidcIdentityProviderConfig({
    this.clientId,
    this.clusterName,
    this.groupsClaim,
    this.groupsPrefix,
    this.identityProviderConfigArn,
    this.identityProviderConfigName,
    this.issuerUrl,
    this.requiredClaims,
    this.status,
    this.tags,
    this.usernameClaim,
    this.usernamePrefix,
  });

  factory OidcIdentityProviderConfig.fromJson(Map<String, dynamic> json) {
    return OidcIdentityProviderConfig(
      clientId: json['clientId'] as String?,
      clusterName: json['clusterName'] as String?,
      groupsClaim: json['groupsClaim'] as String?,
      groupsPrefix: json['groupsPrefix'] as String?,
      identityProviderConfigArn: json['identityProviderConfigArn'] as String?,
      identityProviderConfigName: json['identityProviderConfigName'] as String?,
      issuerUrl: json['issuerUrl'] as String?,
      requiredClaims: (json['requiredClaims'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toConfigStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      usernameClaim: json['usernameClaim'] as String?,
      usernamePrefix: json['usernamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clusterName = this.clusterName;
    final groupsClaim = this.groupsClaim;
    final groupsPrefix = this.groupsPrefix;
    final identityProviderConfigArn = this.identityProviderConfigArn;
    final identityProviderConfigName = this.identityProviderConfigName;
    final issuerUrl = this.issuerUrl;
    final requiredClaims = this.requiredClaims;
    final status = this.status;
    final tags = this.tags;
    final usernameClaim = this.usernameClaim;
    final usernamePrefix = this.usernamePrefix;
    return {
      if (clientId != null) 'clientId': clientId,
      if (clusterName != null) 'clusterName': clusterName,
      if (groupsClaim != null) 'groupsClaim': groupsClaim,
      if (groupsPrefix != null) 'groupsPrefix': groupsPrefix,
      if (identityProviderConfigArn != null)
        'identityProviderConfigArn': identityProviderConfigArn,
      if (identityProviderConfigName != null)
        'identityProviderConfigName': identityProviderConfigName,
      if (issuerUrl != null) 'issuerUrl': issuerUrl,
      if (requiredClaims != null) 'requiredClaims': requiredClaims,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (usernameClaim != null) 'usernameClaim': usernameClaim,
      if (usernamePrefix != null) 'usernamePrefix': usernamePrefix,
    };
  }
}

/// An object representing an OpenID Connect (OIDC) configuration. Before
/// associating an OIDC identity provider to your cluster, review the
/// considerations in <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/authenticate-oidc-identity-provider.html">Authenticating
/// users for your cluster from an OpenID Connect identity provider</a> in the
/// <i>Amazon EKS User Guide</i>.
class OidcIdentityProviderConfigRequest {
  /// This is also known as <i>audience</i>. The ID for the client application
  /// that makes authentication requests to the OpenID identity provider.
  final String clientId;

  /// The name of the OIDC provider configuration.
  final String identityProviderConfigName;

  /// The URL of the OpenID identity provider that allows the API server to
  /// discover public signing keys for verifying tokens. The URL must begin with
  /// <code>https://</code> and should correspond to the <code>iss</code> claim in
  /// the provider's OIDC ID tokens. Per the OIDC standard, path components are
  /// allowed but query parameters are not. Typically the URL consists of only a
  /// hostname, like <code>https://server.example.org</code> or
  /// <code>https://example.com</code>. This URL should point to the level below
  /// <code>.well-known/openid-configuration</code> and must be publicly
  /// accessible over the internet.
  final String issuerUrl;

  /// The JWT claim that the provider uses to return your groups.
  final String? groupsClaim;

  /// The prefix that is prepended to group claims to prevent clashes with
  /// existing names (such as <code>system:</code> groups). For example, the
  /// value<code> oidc:</code> will create group names like
  /// <code>oidc:engineering</code> and <code>oidc:infra</code>.
  final String? groupsPrefix;

  /// The key value pairs that describe required claims in the identity token. If
  /// set, each claim is verified to be present in the token with a matching
  /// value. For the maximum number of claims that you can require, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service-quotas.html">Amazon
  /// EKS service quotas</a> in the <i>Amazon EKS User Guide</i>.
  final Map<String, String>? requiredClaims;

  /// The JSON Web Token (JWT) claim to use as the username. The default is
  /// <code>sub</code>, which is expected to be a unique identifier of the end
  /// user. You can choose other claims, such as <code>email</code> or
  /// <code>name</code>, depending on the OpenID identity provider. Claims other
  /// than <code>email</code> are prefixed with the issuer URL to prevent naming
  /// clashes with other plug-ins.
  final String? usernameClaim;

  /// The prefix that is prepended to username claims to prevent clashes with
  /// existing names. If you do not provide this field, and <code>username</code>
  /// is a value other than <code>email</code>, the prefix defaults to
  /// <code>issuerurl#</code>. You can use the value <code>-</code> to disable all
  /// prefixing.
  final String? usernamePrefix;

  OidcIdentityProviderConfigRequest({
    required this.clientId,
    required this.identityProviderConfigName,
    required this.issuerUrl,
    this.groupsClaim,
    this.groupsPrefix,
    this.requiredClaims,
    this.usernameClaim,
    this.usernamePrefix,
  });

  factory OidcIdentityProviderConfigRequest.fromJson(
      Map<String, dynamic> json) {
    return OidcIdentityProviderConfigRequest(
      clientId: json['clientId'] as String,
      identityProviderConfigName: json['identityProviderConfigName'] as String,
      issuerUrl: json['issuerUrl'] as String,
      groupsClaim: json['groupsClaim'] as String?,
      groupsPrefix: json['groupsPrefix'] as String?,
      requiredClaims: (json['requiredClaims'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      usernameClaim: json['usernameClaim'] as String?,
      usernamePrefix: json['usernamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final identityProviderConfigName = this.identityProviderConfigName;
    final issuerUrl = this.issuerUrl;
    final groupsClaim = this.groupsClaim;
    final groupsPrefix = this.groupsPrefix;
    final requiredClaims = this.requiredClaims;
    final usernameClaim = this.usernameClaim;
    final usernamePrefix = this.usernamePrefix;
    return {
      'clientId': clientId,
      'identityProviderConfigName': identityProviderConfigName,
      'issuerUrl': issuerUrl,
      if (groupsClaim != null) 'groupsClaim': groupsClaim,
      if (groupsPrefix != null) 'groupsPrefix': groupsPrefix,
      if (requiredClaims != null) 'requiredClaims': requiredClaims,
      if (usernameClaim != null) 'usernameClaim': usernameClaim,
      if (usernamePrefix != null) 'usernamePrefix': usernamePrefix,
    };
  }
}

/// Identifies the AWS Key Management Service (AWS KMS) key used to encrypt the
/// secrets.
class Provider {
  /// Amazon Resource Name (ARN) or alias of the KMS key. The KMS key must be
  /// symmetric, created in the same region as the cluster, and if the KMS key was
  /// created in a different account, the user must have access to the KMS key.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-modifying-external-accounts.html">Allowing
  /// Users in Other Accounts to Use a KMS key</a> in the <i>AWS Key Management
  /// Service Developer Guide</i>.
  final String? keyArn;

  Provider({
    this.keyArn,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    return {
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

/// An object representing the remote access configuration for the managed node
/// group.
class RemoteAccessConfig {
  /// The Amazon EC2 SSH key that provides access for SSH communication with the
  /// nodes in the managed node group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon
  /// EC2 Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for
  /// Linux Instances</i>.
  final String? ec2SshKey;

  /// The security groups that are allowed SSH access (port 22) to the nodes. If
  /// you specify an Amazon EC2 SSH key but do not specify a source security group
  /// when you create a managed node group, then port 22 on the nodes is opened to
  /// the internet (0.0.0.0/0). For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html">Security
  /// Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User
  /// Guide</i>.
  final List<String>? sourceSecurityGroups;

  RemoteAccessConfig({
    this.ec2SshKey,
    this.sourceSecurityGroups,
  });

  factory RemoteAccessConfig.fromJson(Map<String, dynamic> json) {
    return RemoteAccessConfig(
      ec2SshKey: json['ec2SshKey'] as String?,
      sourceSecurityGroups: (json['sourceSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2SshKey = this.ec2SshKey;
    final sourceSecurityGroups = this.sourceSecurityGroups;
    return {
      if (ec2SshKey != null) 'ec2SshKey': ec2SshKey,
      if (sourceSecurityGroups != null)
        'sourceSecurityGroups': sourceSecurityGroups,
    };
  }
}

enum ResolveConflicts {
  overwrite,
  none,
}

extension on ResolveConflicts {
  String toValue() {
    switch (this) {
      case ResolveConflicts.overwrite:
        return 'OVERWRITE';
      case ResolveConflicts.none:
        return 'NONE';
    }
  }
}

extension on String {
  ResolveConflicts toResolveConflicts() {
    switch (this) {
      case 'OVERWRITE':
        return ResolveConflicts.overwrite;
      case 'NONE':
        return ResolveConflicts.none;
    }
    throw Exception('$this is not known in enum ResolveConflicts');
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

/// A property that allows a node to repel a set of pods.
class Taint {
  /// The effect of the taint.
  final TaintEffect? effect;

  /// The key of the taint.
  final String? key;

  /// The value of the taint.
  final String? value;

  Taint({
    this.effect,
    this.key,
    this.value,
  });

  factory Taint.fromJson(Map<String, dynamic> json) {
    return Taint(
      effect: (json['effect'] as String?)?.toTaintEffect(),
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final key = this.key;
    final value = this.value;
    return {
      if (effect != null) 'effect': effect.toValue(),
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

enum TaintEffect {
  noSchedule,
  noExecute,
  preferNoSchedule,
}

extension on TaintEffect {
  String toValue() {
    switch (this) {
      case TaintEffect.noSchedule:
        return 'NO_SCHEDULE';
      case TaintEffect.noExecute:
        return 'NO_EXECUTE';
      case TaintEffect.preferNoSchedule:
        return 'PREFER_NO_SCHEDULE';
    }
  }
}

extension on String {
  TaintEffect toTaintEffect() {
    switch (this) {
      case 'NO_SCHEDULE':
        return TaintEffect.noSchedule;
      case 'NO_EXECUTE':
        return TaintEffect.noExecute;
      case 'PREFER_NO_SCHEDULE':
        return TaintEffect.preferNoSchedule;
    }
    throw Exception('$this is not known in enum TaintEffect');
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

/// An object representing an asynchronous update.
class Update {
  /// The Unix epoch timestamp in seconds for when the update was created.
  final DateTime? createdAt;

  /// Any errors associated with a <code>Failed</code> update.
  final List<ErrorDetail>? errors;

  /// A UUID that is used to track the update.
  final String? id;

  /// A key-value map that contains the parameters associated with the update.
  final List<UpdateParam>? params;

  /// The current status of the update.
  final UpdateStatus? status;

  /// The type of the update.
  final UpdateType? type;

  Update({
    this.createdAt,
    this.errors,
    this.id,
    this.params,
    this.status,
    this.type,
  });

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      createdAt: timeStampFromJson(json['createdAt']),
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      params: (json['params'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toUpdateStatus(),
      type: (json['type'] as String?)?.toUpdateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final errors = this.errors;
    final id = this.id;
    final params = this.params;
    final status = this.status;
    final type = this.type;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (errors != null) 'errors': errors,
      if (id != null) 'id': id,
      if (params != null) 'params': params,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

class UpdateAddonResponse {
  final Update? update;

  UpdateAddonResponse({
    this.update,
  });

  factory UpdateAddonResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAddonResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

class UpdateClusterConfigResponse {
  final Update? update;

  UpdateClusterConfigResponse({
    this.update,
  });

  factory UpdateClusterConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterConfigResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

class UpdateClusterVersionResponse {
  /// The full description of the specified update
  final Update? update;

  UpdateClusterVersionResponse({
    this.update,
  });

  factory UpdateClusterVersionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateClusterVersionResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

/// An object representing a Kubernetes label change for a managed node group.
class UpdateLabelsPayload {
  /// Kubernetes labels to be added or updated.
  final Map<String, String>? addOrUpdateLabels;

  /// Kubernetes labels to be removed.
  final List<String>? removeLabels;

  UpdateLabelsPayload({
    this.addOrUpdateLabels,
    this.removeLabels,
  });

  factory UpdateLabelsPayload.fromJson(Map<String, dynamic> json) {
    return UpdateLabelsPayload(
      addOrUpdateLabels: (json['addOrUpdateLabels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      removeLabels: (json['removeLabels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addOrUpdateLabels = this.addOrUpdateLabels;
    final removeLabels = this.removeLabels;
    return {
      if (addOrUpdateLabels != null) 'addOrUpdateLabels': addOrUpdateLabels,
      if (removeLabels != null) 'removeLabels': removeLabels,
    };
  }
}

class UpdateNodegroupConfigResponse {
  final Update? update;

  UpdateNodegroupConfigResponse({
    this.update,
  });

  factory UpdateNodegroupConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNodegroupConfigResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

class UpdateNodegroupVersionResponse {
  final Update? update;

  UpdateNodegroupVersionResponse({
    this.update,
  });

  factory UpdateNodegroupVersionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNodegroupVersionResponse(
      update: json['update'] != null
          ? Update.fromJson(json['update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final update = this.update;
    return {
      if (update != null) 'update': update,
    };
  }
}

/// An object representing the details of an update request.
class UpdateParam {
  /// The keys associated with an update request.
  final UpdateParamType? type;

  /// The value of the keys submitted as part of an update request.
  final String? value;

  UpdateParam({
    this.type,
    this.value,
  });

  factory UpdateParam.fromJson(Map<String, dynamic> json) {
    return UpdateParam(
      type: (json['type'] as String?)?.toUpdateParamType(),
      value: json['value'] as String?,
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

enum UpdateParamType {
  version,
  platformVersion,
  endpointPrivateAccess,
  endpointPublicAccess,
  clusterLogging,
  desiredSize,
  labelsToAdd,
  labelsToRemove,
  taintsToAdd,
  taintsToRemove,
  maxSize,
  minSize,
  releaseVersion,
  publicAccessCidrs,
  launchTemplateName,
  launchTemplateVersion,
  identityProviderConfig,
  encryptionConfig,
  addonVersion,
  serviceAccountRoleArn,
  resolveConflicts,
  maxUnavailable,
  maxUnavailablePercentage,
}

extension on UpdateParamType {
  String toValue() {
    switch (this) {
      case UpdateParamType.version:
        return 'Version';
      case UpdateParamType.platformVersion:
        return 'PlatformVersion';
      case UpdateParamType.endpointPrivateAccess:
        return 'EndpointPrivateAccess';
      case UpdateParamType.endpointPublicAccess:
        return 'EndpointPublicAccess';
      case UpdateParamType.clusterLogging:
        return 'ClusterLogging';
      case UpdateParamType.desiredSize:
        return 'DesiredSize';
      case UpdateParamType.labelsToAdd:
        return 'LabelsToAdd';
      case UpdateParamType.labelsToRemove:
        return 'LabelsToRemove';
      case UpdateParamType.taintsToAdd:
        return 'TaintsToAdd';
      case UpdateParamType.taintsToRemove:
        return 'TaintsToRemove';
      case UpdateParamType.maxSize:
        return 'MaxSize';
      case UpdateParamType.minSize:
        return 'MinSize';
      case UpdateParamType.releaseVersion:
        return 'ReleaseVersion';
      case UpdateParamType.publicAccessCidrs:
        return 'PublicAccessCidrs';
      case UpdateParamType.launchTemplateName:
        return 'LaunchTemplateName';
      case UpdateParamType.launchTemplateVersion:
        return 'LaunchTemplateVersion';
      case UpdateParamType.identityProviderConfig:
        return 'IdentityProviderConfig';
      case UpdateParamType.encryptionConfig:
        return 'EncryptionConfig';
      case UpdateParamType.addonVersion:
        return 'AddonVersion';
      case UpdateParamType.serviceAccountRoleArn:
        return 'ServiceAccountRoleArn';
      case UpdateParamType.resolveConflicts:
        return 'ResolveConflicts';
      case UpdateParamType.maxUnavailable:
        return 'MaxUnavailable';
      case UpdateParamType.maxUnavailablePercentage:
        return 'MaxUnavailablePercentage';
    }
  }
}

extension on String {
  UpdateParamType toUpdateParamType() {
    switch (this) {
      case 'Version':
        return UpdateParamType.version;
      case 'PlatformVersion':
        return UpdateParamType.platformVersion;
      case 'EndpointPrivateAccess':
        return UpdateParamType.endpointPrivateAccess;
      case 'EndpointPublicAccess':
        return UpdateParamType.endpointPublicAccess;
      case 'ClusterLogging':
        return UpdateParamType.clusterLogging;
      case 'DesiredSize':
        return UpdateParamType.desiredSize;
      case 'LabelsToAdd':
        return UpdateParamType.labelsToAdd;
      case 'LabelsToRemove':
        return UpdateParamType.labelsToRemove;
      case 'TaintsToAdd':
        return UpdateParamType.taintsToAdd;
      case 'TaintsToRemove':
        return UpdateParamType.taintsToRemove;
      case 'MaxSize':
        return UpdateParamType.maxSize;
      case 'MinSize':
        return UpdateParamType.minSize;
      case 'ReleaseVersion':
        return UpdateParamType.releaseVersion;
      case 'PublicAccessCidrs':
        return UpdateParamType.publicAccessCidrs;
      case 'LaunchTemplateName':
        return UpdateParamType.launchTemplateName;
      case 'LaunchTemplateVersion':
        return UpdateParamType.launchTemplateVersion;
      case 'IdentityProviderConfig':
        return UpdateParamType.identityProviderConfig;
      case 'EncryptionConfig':
        return UpdateParamType.encryptionConfig;
      case 'AddonVersion':
        return UpdateParamType.addonVersion;
      case 'ServiceAccountRoleArn':
        return UpdateParamType.serviceAccountRoleArn;
      case 'ResolveConflicts':
        return UpdateParamType.resolveConflicts;
      case 'MaxUnavailable':
        return UpdateParamType.maxUnavailable;
      case 'MaxUnavailablePercentage':
        return UpdateParamType.maxUnavailablePercentage;
    }
    throw Exception('$this is not known in enum UpdateParamType');
  }
}

enum UpdateStatus {
  inProgress,
  failed,
  cancelled,
  successful,
}

extension on UpdateStatus {
  String toValue() {
    switch (this) {
      case UpdateStatus.inProgress:
        return 'InProgress';
      case UpdateStatus.failed:
        return 'Failed';
      case UpdateStatus.cancelled:
        return 'Cancelled';
      case UpdateStatus.successful:
        return 'Successful';
    }
  }
}

extension on String {
  UpdateStatus toUpdateStatus() {
    switch (this) {
      case 'InProgress':
        return UpdateStatus.inProgress;
      case 'Failed':
        return UpdateStatus.failed;
      case 'Cancelled':
        return UpdateStatus.cancelled;
      case 'Successful':
        return UpdateStatus.successful;
    }
    throw Exception('$this is not known in enum UpdateStatus');
  }
}

/// An object representing the details of an update to a taints payload.
class UpdateTaintsPayload {
  /// Kubernetes taints to be added or updated.
  final List<Taint>? addOrUpdateTaints;

  /// Kubernetes taints to be removed.
  final List<Taint>? removeTaints;

  UpdateTaintsPayload({
    this.addOrUpdateTaints,
    this.removeTaints,
  });

  factory UpdateTaintsPayload.fromJson(Map<String, dynamic> json) {
    return UpdateTaintsPayload(
      addOrUpdateTaints: (json['addOrUpdateTaints'] as List?)
          ?.whereNotNull()
          .map((e) => Taint.fromJson(e as Map<String, dynamic>))
          .toList(),
      removeTaints: (json['removeTaints'] as List?)
          ?.whereNotNull()
          .map((e) => Taint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addOrUpdateTaints = this.addOrUpdateTaints;
    final removeTaints = this.removeTaints;
    return {
      if (addOrUpdateTaints != null) 'addOrUpdateTaints': addOrUpdateTaints,
      if (removeTaints != null) 'removeTaints': removeTaints,
    };
  }
}

enum UpdateType {
  versionUpdate,
  endpointAccessUpdate,
  loggingUpdate,
  configUpdate,
  associateIdentityProviderConfig,
  disassociateIdentityProviderConfig,
  associateEncryptionConfig,
  addonUpdate,
}

extension on UpdateType {
  String toValue() {
    switch (this) {
      case UpdateType.versionUpdate:
        return 'VersionUpdate';
      case UpdateType.endpointAccessUpdate:
        return 'EndpointAccessUpdate';
      case UpdateType.loggingUpdate:
        return 'LoggingUpdate';
      case UpdateType.configUpdate:
        return 'ConfigUpdate';
      case UpdateType.associateIdentityProviderConfig:
        return 'AssociateIdentityProviderConfig';
      case UpdateType.disassociateIdentityProviderConfig:
        return 'DisassociateIdentityProviderConfig';
      case UpdateType.associateEncryptionConfig:
        return 'AssociateEncryptionConfig';
      case UpdateType.addonUpdate:
        return 'AddonUpdate';
    }
  }
}

extension on String {
  UpdateType toUpdateType() {
    switch (this) {
      case 'VersionUpdate':
        return UpdateType.versionUpdate;
      case 'EndpointAccessUpdate':
        return UpdateType.endpointAccessUpdate;
      case 'LoggingUpdate':
        return UpdateType.loggingUpdate;
      case 'ConfigUpdate':
        return UpdateType.configUpdate;
      case 'AssociateIdentityProviderConfig':
        return UpdateType.associateIdentityProviderConfig;
      case 'DisassociateIdentityProviderConfig':
        return UpdateType.disassociateIdentityProviderConfig;
      case 'AssociateEncryptionConfig':
        return UpdateType.associateEncryptionConfig;
      case 'AddonUpdate':
        return UpdateType.addonUpdate;
    }
    throw Exception('$this is not known in enum UpdateType');
  }
}

/// An object representing the VPC configuration to use for an Amazon EKS
/// cluster.
class VpcConfigRequest {
  /// Set this value to <code>true</code> to enable private access for your
  /// cluster's Kubernetes API server endpoint. If you enable private access,
  /// Kubernetes API requests from within your cluster's VPC use the private VPC
  /// endpoint. The default value for this parameter is <code>false</code>, which
  /// disables private access for your Kubernetes API server. If you disable
  /// private access and you have nodes or AWS Fargate pods in the cluster, then
  /// ensure that <code>publicAccessCidrs</code> includes the necessary CIDR
  /// blocks for communication with the nodes or Fargate pods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// Set this value to <code>false</code> to disable public access to your
  /// cluster's Kubernetes API server endpoint. If you disable public access, your
  /// cluster's Kubernetes API server can only receive requests from within the
  /// cluster VPC. The default value for this parameter is <code>true</code>,
  /// which enables public access for your Kubernetes API server. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the CIDR blocks that you specify is denied. The default value is
  /// <code>0.0.0.0/0</code>. If you've disabled private endpoint access and you
  /// have nodes or AWS Fargate pods in the cluster, then ensure that you specify
  /// the necessary CIDR blocks. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final List<String>? publicAccessCidrs;

  /// Specify one or more security groups for the cross-account elastic network
  /// interfaces that Amazon EKS creates to use to allow communication between
  /// your nodes and the Kubernetes control plane. If you don't specify any
  /// security groups, then familiarize yourself with the difference between
  /// Amazon EKS defaults for clusters deployed with Kubernetes:
  ///
  /// <ul>
  /// <li>
  /// 1.14 Amazon EKS platform version <code>eks.2</code> and earlier
  /// </li>
  /// <li>
  /// 1.14 Amazon EKS platform version <code>eks.3</code> and later
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Amazon
  /// EKS security group considerations</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final List<String>? securityGroupIds;

  /// Specify subnets for your Amazon EKS nodes. Amazon EKS creates cross-account
  /// elastic network interfaces in these subnets to allow communication between
  /// your nodes and the Kubernetes control plane.
  final List<String>? subnetIds;

  VpcConfigRequest({
    this.endpointPrivateAccess,
    this.endpointPublicAccess,
    this.publicAccessCidrs,
    this.securityGroupIds,
    this.subnetIds,
  });

  factory VpcConfigRequest.fromJson(Map<String, dynamic> json) {
    return VpcConfigRequest(
      endpointPrivateAccess: json['endpointPrivateAccess'] as bool?,
      endpointPublicAccess: json['endpointPublicAccess'] as bool?,
      publicAccessCidrs: (json['publicAccessCidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointPrivateAccess = this.endpointPrivateAccess;
    final endpointPublicAccess = this.endpointPublicAccess;
    final publicAccessCidrs = this.publicAccessCidrs;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (endpointPrivateAccess != null)
        'endpointPrivateAccess': endpointPrivateAccess,
      if (endpointPublicAccess != null)
        'endpointPublicAccess': endpointPublicAccess,
      if (publicAccessCidrs != null) 'publicAccessCidrs': publicAccessCidrs,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// An object representing an Amazon EKS cluster VPC configuration response.
class VpcConfigResponse {
  /// The cluster security group that was created by Amazon EKS for the cluster.
  /// Managed node groups use this security group for control-plane-to-data-plane
  /// communication.
  final String? clusterSecurityGroupId;

  /// This parameter indicates whether the Amazon EKS private API server endpoint
  /// is enabled. If the Amazon EKS private API server endpoint is enabled,
  /// Kubernetes API requests that originate from within your cluster's VPC use
  /// the private VPC endpoint instead of traversing the internet. If this value
  /// is disabled and you have nodes or AWS Fargate pods in the cluster, then
  /// ensure that <code>publicAccessCidrs</code> includes the necessary CIDR
  /// blocks for communication with the nodes or Fargate pods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// This parameter indicates whether the Amazon EKS public API server endpoint
  /// is enabled. If the Amazon EKS public API server endpoint is disabled, your
  /// cluster's Kubernetes API server can only receive requests that originate
  /// from within the cluster VPC.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the listed CIDR blocks is denied. The default value is
  /// <code>0.0.0.0/0</code>. If you've disabled private endpoint access and you
  /// have nodes or AWS Fargate pods in the cluster, then ensure that the
  /// necessary CIDR blocks are listed. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS Cluster Endpoint Access Control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final List<String>? publicAccessCidrs;

  /// The security groups associated with the cross-account elastic network
  /// interfaces that are used to allow communication between your nodes and the
  /// Kubernetes control plane.
  final List<String>? securityGroupIds;

  /// The subnets associated with your cluster.
  final List<String>? subnetIds;

  /// The VPC associated with your cluster.
  final String? vpcId;

  VpcConfigResponse({
    this.clusterSecurityGroupId,
    this.endpointPrivateAccess,
    this.endpointPublicAccess,
    this.publicAccessCidrs,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) {
    return VpcConfigResponse(
      clusterSecurityGroupId: json['clusterSecurityGroupId'] as String?,
      endpointPrivateAccess: json['endpointPrivateAccess'] as bool?,
      endpointPublicAccess: json['endpointPublicAccess'] as bool?,
      publicAccessCidrs: (json['publicAccessCidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterSecurityGroupId = this.clusterSecurityGroupId;
    final endpointPrivateAccess = this.endpointPrivateAccess;
    final endpointPublicAccess = this.endpointPublicAccess;
    final publicAccessCidrs = this.publicAccessCidrs;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (clusterSecurityGroupId != null)
        'clusterSecurityGroupId': clusterSecurityGroupId,
      if (endpointPrivateAccess != null)
        'endpointPrivateAccess': endpointPrivateAccess,
      if (endpointPublicAccess != null)
        'endpointPublicAccess': endpointPublicAccess,
      if (publicAccessCidrs != null) 'publicAccessCidrs': publicAccessCidrs,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

enum ConfigStatus {
  creating,
  deleting,
  active,
}

extension on ConfigStatus {
  String toValue() {
    switch (this) {
      case ConfigStatus.creating:
        return 'CREATING';
      case ConfigStatus.deleting:
        return 'DELETING';
      case ConfigStatus.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  ConfigStatus toConfigStatus() {
    switch (this) {
      case 'CREATING':
        return ConfigStatus.creating;
      case 'DELETING':
        return ConfigStatus.deleting;
      case 'ACTIVE':
        return ConfigStatus.active;
    }
    throw Exception('$this is not known in enum ConfigStatus');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class UnsupportedAvailabilityZoneException extends _s.GenericAwsException {
  UnsupportedAvailabilityZoneException({String? type, String? message})
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
