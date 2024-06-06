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

/// Amazon Elastic Kubernetes Service (Amazon EKS) is a managed service that
/// makes it easy for you to run Kubernetes on Amazon Web Services without
/// needing to setup or maintain your own Kubernetes control plane. Kubernetes
/// is an open-source system for automating the deployment, scaling, and
/// management of containerized applications.
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Associates an access policy and its scope to an access entry. For more
  /// information about associating access policies, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html">Associating
  /// and disassociating access policies to and from access entries</a> in the
  /// <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [accessScope] :
  /// The scope for the <code>AccessPolicy</code>. You can scope access policies
  /// to an entire cluster or to specific Kubernetes namespaces.
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [policyArn] :
  /// The ARN of the <code>AccessPolicy</code> that you're associating. For a
  /// list of ARNs, use <code>ListAccessPolicies</code>.
  ///
  /// Parameter [principalArn] :
  /// The Amazon Resource Name (ARN) of the IAM user or role for the
  /// <code>AccessEntry</code> that you're associating the access policy to.
  Future<AssociateAccessPolicyResponse> associateAccessPolicy({
    required AccessScope accessScope,
    required String clusterName,
    required String policyArn,
    required String principalArn,
  }) async {
    final $payload = <String, dynamic>{
      'accessScope': accessScope,
      'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}/access-policies',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAccessPolicyResponse.fromJson(response);
  }

  /// Associates an encryption configuration to an existing cluster.
  ///
  /// Use this API to enable encryption on existing clusters that don't already
  /// have encryption enabled. This allows you to implement a defense-in-depth
  /// security strategy without migrating applications to new Amazon EKS
  /// clusters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [encryptionConfig] :
  /// The configuration you are using for encryption.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<AssociateEncryptionConfigResponse> associateEncryptionConfig({
    required String clusterName,
    required List<EncryptionConfig> encryptionConfig,
    String? clientRequestToken,
  }) async {
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

  /// Associates an identity provider configuration to a cluster.
  ///
  /// If you want to authenticate identities using an identity provider, you can
  /// create an identity provider configuration and associate it to your
  /// cluster. After configuring authentication to your cluster you can create
  /// Kubernetes <code>Role</code> and <code>ClusterRole</code> objects, assign
  /// permissions to them, and then bind them to the identities using Kubernetes
  /// <code>RoleBinding</code> and <code>ClusterRoleBinding</code> objects. For
  /// more information see <a
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
  /// The name of your cluster.
  ///
  /// Parameter [oidc] :
  /// An object representing an OpenID Connect (OIDC) identity provider
  /// configuration.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  Future<AssociateIdentityProviderConfigResponse>
      associateIdentityProviderConfig({
    required String clusterName,
    required OidcIdentityProviderConfigRequest oidc,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
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

  /// Creates an access entry.
  ///
  /// An access entry allows an IAM principal to access your cluster. Access
  /// entries can replace the need to maintain entries in the
  /// <code>aws-auth</code> <code>ConfigMap</code> for authentication. You have
  /// the following options for authorizing an IAM principal to access
  /// Kubernetes objects on your cluster: Kubernetes role-based access control
  /// (RBAC), Amazon EKS, or both. Kubernetes RBAC authorization requires you to
  /// create and manage Kubernetes <code>Role</code>, <code>ClusterRole</code>,
  /// <code>RoleBinding</code>, and <code>ClusterRoleBinding</code> objects, in
  /// addition to managing access entries. If you use Amazon EKS authorization
  /// exclusively, you don't need to create and manage Kubernetes
  /// <code>Role</code>, <code>ClusterRole</code>, <code>RoleBinding</code>, and
  /// <code>ClusterRoleBinding</code> objects.
  ///
  /// For more information about access entries, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html">Access
  /// entries</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>. You can
  /// specify one ARN for each access entry. You can't specify the same ARN in
  /// more than one access entry. This value can't be changed after access entry
  /// creation.
  ///
  /// The valid principals differ depending on the type of the access entry in
  /// the <code>type</code> field. The only valid ARN is IAM roles for the types
  /// of access entries for nodes: <code/> <code/>. You can use every IAM
  /// principal type for <code>STANDARD</code> access entries. You can't use the
  /// STS session principal type with access entries because this is a temporary
  /// principal for each session and not a permanent identity that can be
  /// assigned permissions.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#bp-users-federation-idp">IAM
  /// best practices</a> recommend using IAM roles with temporary credentials,
  /// rather than IAM users with long-term credentials.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [kubernetesGroups] :
  /// The value for <code>name</code> that you've specified for <code>kind:
  /// Group</code> as a <code>subject</code> in a Kubernetes
  /// <code>RoleBinding</code> or <code>ClusterRoleBinding</code> object. Amazon
  /// EKS doesn't confirm that the value for <code>name</code> exists in any
  /// bindings on your cluster. You can specify one or more names.
  ///
  /// Kubernetes authorizes the <code>principalArn</code> of the access entry to
  /// access any cluster objects that you've specified in a Kubernetes
  /// <code>Role</code> or <code>ClusterRole</code> object that is also
  /// specified in a binding's <code>roleRef</code>. For more information about
  /// creating Kubernetes <code>RoleBinding</code>,
  /// <code>ClusterRoleBinding</code>, <code>Role</code>, or
  /// <code>ClusterRole</code> objects, see <a
  /// href="https://kubernetes.io/docs/reference/access-authn-authz/rbac/">Using
  /// RBAC Authorization in the Kubernetes documentation</a>.
  ///
  /// If you want Amazon EKS to authorize the <code>principalArn</code> (instead
  /// of, or in addition to Kubernetes authorizing the
  /// <code>principalArn</code>), you can associate one or more access policies
  /// to the access entry using <code>AssociateAccessPolicy</code>. If you
  /// associate any access policies, the <code>principalARN</code> has all
  /// permissions assigned in the associated access policies and all permissions
  /// in any Kubernetes <code>Role</code> or <code>ClusterRole</code> objects
  /// that the group names are bound to.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// Parameter [type] :
  /// The type of the new access entry. Valid values are <code>Standard</code>,
  /// <code>FARGATE_LINUX</code>, <code>EC2_LINUX</code>, and
  /// <code>EC2_WINDOWS</code>.
  ///
  /// If the <code>principalArn</code> is for an IAM role that's used for
  /// self-managed Amazon EC2 nodes, specify <code>EC2_LINUX</code> or
  /// <code>EC2_WINDOWS</code>. Amazon EKS grants the necessary permissions to
  /// the node for you. If the <code>principalArn</code> is for any other
  /// purpose, specify <code>STANDARD</code>. If you don't specify a value,
  /// Amazon EKS sets the value to <code>STANDARD</code>. It's unnecessary to
  /// create access entries for IAM roles used with Fargate profiles or managed
  /// Amazon EC2 nodes, because Amazon EKS creates entries in the
  /// <code>aws-auth</code> <code>ConfigMap</code> for the roles. You can't
  /// change this value once you've created the access entry.
  ///
  /// If you set the value to <code>EC2_LINUX</code> or
  /// <code>EC2_WINDOWS</code>, you can't specify values for
  /// <code>kubernetesGroups</code>, or associate an <code>AccessPolicy</code>
  /// to the access entry.
  ///
  /// Parameter [username] :
  /// The username to authenticate to Kubernetes with. We recommend not
  /// specifying a username and letting Amazon EKS specify it for you. For more
  /// information about the value Amazon EKS specifies for you, or constraints
  /// before specifying your own username, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html#creating-access-entries">Creating
  /// access entries</a> in the <i>Amazon EKS User Guide</i>.
  Future<CreateAccessEntryResponse> createAccessEntry({
    required String clusterName,
    required String principalArn,
    String? clientRequestToken,
    List<String>? kubernetesGroups,
    Map<String, String>? tags,
    String? type,
    String? username,
  }) async {
    final $payload = <String, dynamic>{
      'principalArn': principalArn,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kubernetesGroups != null) 'kubernetesGroups': kubernetesGroups,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
      if (username != null) 'username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessEntryResponse.fromJson(response);
  }

  /// Creates an Amazon EKS add-on.
  ///
  /// Amazon EKS add-ons help to automate the provisioning and lifecycle
  /// management of common operational software for Amazon EKS clusters. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html">Amazon
  /// EKS add-ons</a> in the <i>Amazon EKS User Guide</i>.
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
  /// <code>DescribeAddonVersions</code>.
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
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
  /// Parameter [configurationValues] :
  /// The set of configuration values for the add-on that's created. The values
  /// that you provide are validated against the schema returned by
  /// <code>DescribeAddonConfiguration</code>.
  ///
  /// Parameter [podIdentityAssociations] :
  /// An array of Pod Identity Assocations to be created. Each EKS Pod Identity
  /// association maps a Kubernetes service account to an IAM Role.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using Pod Identity</a> in the EKS User
  /// Guide.
  ///
  /// Parameter [resolveConflicts] :
  /// How to resolve field value conflicts for an Amazon EKS add-on. Conflicts
  /// are handled based on the value you choose:
  ///
  /// <ul>
  /// <li>
  /// <b>None</b> – If the self-managed version of the add-on is installed on
  /// your cluster, Amazon EKS doesn't change the value. Creation of the add-on
  /// might fail.
  /// </li>
  /// <li>
  /// <b>Overwrite</b> – If the self-managed version of the add-on is installed
  /// on your cluster and the Amazon EKS default value is different than the
  /// existing value, Amazon EKS changes the value to the Amazon EKS default
  /// value.
  /// </li>
  /// <li>
  /// <b>Preserve</b> – This is similar to the NONE option. If the self-managed
  /// version of the add-on is installed on your cluster Amazon EKS doesn't
  /// change the add-on resource properties. Creation of the add-on might fail
  /// if conflicts are detected. This option works differently during the update
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_UpdateAddon.html">UpdateAddon</a>.
  /// </li>
  /// </ul>
  /// If you don't currently have the self-managed version of the add-on
  /// installed on your cluster, the Amazon EKS add-on is installed. Amazon EKS
  /// sets all values to default values, regardless of the option that you
  /// specify.
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
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  Future<CreateAddonResponse> createAddon({
    required String addonName,
    required String clusterName,
    String? addonVersion,
    String? clientRequestToken,
    String? configurationValues,
    List<AddonPodIdentityAssociations>? podIdentityAssociations,
    ResolveConflicts? resolveConflicts,
    String? serviceAccountRoleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'addonName': addonName,
      if (addonVersion != null) 'addonVersion': addonVersion,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (configurationValues != null)
        'configurationValues': configurationValues,
      if (podIdentityAssociations != null)
        'podIdentityAssociations': podIdentityAssociations,
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
  /// control plane runs in an account managed by Amazon Web Services, and the
  /// Kubernetes API is exposed by the Amazon EKS API server endpoint. Each
  /// Amazon EKS cluster control plane is single tenant and unique. It runs on
  /// its own set of Amazon EC2 instances.
  ///
  /// The cluster control plane is provisioned across multiple Availability
  /// Zones and fronted by an Elastic Load Balancing Network Load Balancer.
  /// Amazon EKS also provisions elastic network interfaces in your VPC subnets
  /// to provide connectivity from the control plane instances to the nodes (for
  /// example, to support <code>kubectl exec</code>, <code>logs</code>, and
  /// <code>proxy</code> data flows).
  ///
  /// Amazon EKS nodes run in your Amazon Web Services account and connect to
  /// your cluster's control plane over the Kubernetes API server endpoint and a
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
  /// href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing</a>.
  /// </note>
  /// In most cases, it takes several minutes to create a cluster. After you
  /// create an Amazon EKS cluster, you must configure your Kubernetes tooling
  /// to communicate with the API server and launch nodes into your cluster. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-auth.html">Allowing
  /// users to access your cluster</a> and <a
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
  /// The VPC configuration that's used by the cluster control plane. Amazon EKS
  /// VPC resources have specific requirements to work properly with Kubernetes.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">Cluster
  /// VPC Considerations</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Cluster
  /// Security Group Considerations</a> in the <i>Amazon EKS User Guide</i>. You
  /// must specify at least two subnets. You can specify up to five security
  /// groups. However, we recommend that you use a dedicated security group for
  /// your cluster control plane.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions
  /// for the Kubernetes control plane to make calls to Amazon Web Services API
  /// operations on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html">Amazon
  /// EKS Service IAM Role</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
  /// Parameter [accessConfig] :
  /// The access configuration for the cluster.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
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
  /// EKS Cluster control plane logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing</a>.
  /// </note>
  ///
  /// Parameter [outpostConfig] :
  /// An object representing the configuration of your local Amazon EKS cluster
  /// on an Amazon Web Services Outpost. Before creating a local cluster on an
  /// Outpost, review <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-local-cluster-overview.html">Local
  /// clusters for Amazon EKS on Amazon Web Services Outposts</a> in the
  /// <i>Amazon EKS User Guide</i>. This object isn't available for creating
  /// Amazon EKS clusters on the Amazon Web Services cloud.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// Parameter [version] :
  /// The desired Kubernetes version for your cluster. If you don't specify a
  /// value here, the default version available in Amazon EKS is used.
  /// <note>
  /// The default version might not be the latest version available.
  /// </note>
  Future<CreateClusterResponse> createCluster({
    required String name,
    required VpcConfigRequest resourcesVpcConfig,
    required String roleArn,
    CreateAccessConfigRequest? accessConfig,
    String? clientRequestToken,
    List<EncryptionConfig>? encryptionConfig,
    KubernetesNetworkConfigRequest? kubernetesNetworkConfig,
    Logging? logging,
    OutpostConfigRequest? outpostConfig,
    Map<String, String>? tags,
    String? version,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'resourcesVpcConfig': resourcesVpcConfig,
      'roleArn': roleArn,
      if (accessConfig != null) 'accessConfig': accessConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
      if (logging != null) 'logging': logging,
      if (outpostConfig != null) 'outpostConfig': outpostConfig,
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

  /// Creates an EKS Anywhere subscription. When a subscription is created, it
  /// is a contract agreement for the length of the term specified in the
  /// request. Licenses that are used to validate support are provisioned in
  /// Amazon Web Services License Manager and the caller account is granted
  /// access to EKS Anywhere Curated Packages.
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// The unique name for your subscription. It must be unique in your Amazon
  /// Web Services account in the Amazon Web Services Region you're creating the
  /// subscription in. The name can contain only alphanumeric characters
  /// (case-sensitive), hyphens, and underscores. It must start with an
  /// alphabetic character and can't be longer than 100 characters.
  ///
  /// Parameter [term] :
  /// An object representing the term duration and term unit type of your
  /// subscription. This determines the term length of your subscription. Valid
  /// values are MONTHS for term unit and 12 or 36 for term duration, indicating
  /// a 12 month or 36 month subscription. This value cannot be changed after
  /// creating the subscription.
  ///
  /// Parameter [autoRenew] :
  /// A boolean indicating whether the subscription auto renews at the end of
  /// the term.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [licenseQuantity] :
  /// The number of licenses to purchase with the subscription. Valid values are
  /// between 1 and 100. This value can't be changed after creating the
  /// subscription.
  ///
  /// Parameter [licenseType] :
  /// The license type for all licenses in the subscription. Valid value is
  /// CLUSTER. With the CLUSTER license type, each license covers support for a
  /// single EKS Anywhere cluster.
  ///
  /// Parameter [tags] :
  /// The metadata for a subscription to assist with categorization and
  /// organization. Each tag consists of a key and an optional value.
  /// Subscription tags don't propagate to any other resources associated with
  /// the subscription.
  Future<CreateEksAnywhereSubscriptionResponse> createEksAnywhereSubscription({
    required String name,
    required EksAnywhereSubscriptionTerm term,
    bool? autoRenew,
    String? clientRequestToken,
    int? licenseQuantity,
    EksAnywhereSubscriptionLicenseType? licenseType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'term': term,
      if (autoRenew != null) 'autoRenew': autoRenew,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (licenseQuantity != null) 'licenseQuantity': licenseQuantity,
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/eks-anywhere-subscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEksAnywhereSubscriptionResponse.fromJson(response);
  }

  /// Creates an Fargate profile for your Amazon EKS cluster. You must have at
  /// least one Fargate profile in a cluster to be able to run pods on Fargate.
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
  /// href="https://kubernetes.io/docs/reference/access-authn-authz/rbac/">Role
  /// Based Access Control</a> (RBAC) for authorization so that the
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/fargate-profile.html">Fargate
  /// profile</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnsupportedAvailabilityZoneException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile.
  ///
  /// Parameter [podExecutionRoleArn] :
  /// The Amazon Resource Name (ARN) of the <code>Pod</code> execution role to
  /// use for a <code>Pod</code> that matches the selectors in the Fargate
  /// profile. The <code>Pod</code> execution role allows Fargate infrastructure
  /// to register with your cluster as a node, and it provides read access to
  /// Amazon ECR image repositories. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">
  /// <code>Pod</code> execution role</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [selectors] :
  /// The selectors to match for a <code>Pod</code> to use this Fargate profile.
  /// Each selector must have an associated Kubernetes <code>namespace</code>.
  /// Optionally, you can also specify <code>labels</code> for a
  /// <code>namespace</code>. You may specify up to five selectors in a Fargate
  /// profile.
  ///
  /// Parameter [subnets] :
  /// The IDs of subnets to launch a <code>Pod</code> into. A <code>Pod</code>
  /// running on Fargate isn't assigned a public IP address, so only private
  /// subnets (with no direct route to an Internet Gateway) are accepted for
  /// this parameter.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  Future<CreateFargateProfileResponse> createFargateProfile({
    required String clusterName,
    required String fargateProfileName,
    required String podExecutionRoleArn,
    String? clientRequestToken,
    List<FargateProfileSelector>? selectors,
    List<String>? subnets,
    Map<String, String>? tags,
  }) async {
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

  /// Creates a managed node group for an Amazon EKS cluster.
  ///
  /// You can only create a node group for your cluster that is equal to the
  /// current Kubernetes version for the cluster. All node groups are created
  /// with the latest AMI release version for the respective minor Kubernetes
  /// version of the cluster, unless you deploy a custom AMI using a launch
  /// template. For more information about using launch templates, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a>.
  ///
  /// An Amazon EKS managed node group is an Amazon EC2 Auto Scaling group and
  /// associated Amazon EC2 instances that are managed by Amazon Web Services
  /// for an Amazon EKS cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html">Managed
  /// node groups</a> in the <i>Amazon EKS User Guide</i>.
  /// <note>
  /// Windows AMI types are only supported for commercial Amazon Web Services
  /// Regions that support Windows on Amazon EKS.
  /// </note>
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
  /// The name of your cluster.
  ///
  /// Parameter [nodeRole] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with your node
  /// group. The Amazon EKS worker node <code>kubelet</code> daemon makes calls
  /// to Amazon Web Services APIs on your behalf. Nodes receive permissions for
  /// these API calls through an IAM instance profile and associated policies.
  /// Before you can launch nodes and register them into a cluster, you must
  /// create an IAM role for those nodes to use when they are launched. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html">Amazon
  /// EKS node IAM role</a> in the <i> <i>Amazon EKS User Guide</i> </i>. If you
  /// specify <code>launchTemplate</code>, then don't specify <code> <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_IamInstanceProfile.html">IamInstanceProfile</a>
  /// </code> in your launch template, or the node group deployment will fail.
  /// For more information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [nodegroupName] :
  /// The unique name to give your node group.
  ///
  /// Parameter [subnets] :
  /// The subnets to use for the Auto Scaling group that is created for your
  /// node group. If you specify <code>launchTemplate</code>, then don't specify
  /// <code> <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateNetworkInterface.html">SubnetId</a>
  /// </code> in your launch template, or the node group deployment will fail.
  /// For more information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [amiType] :
  /// The AMI type for your node group. If you specify
  /// <code>launchTemplate</code>, and your launch template uses a custom AMI,
  /// then don't specify <code>amiType</code>, or the node group deployment will
  /// fail. If your launch template uses a Windows custom AMI, then add
  /// <code>eks:kube-proxy-windows</code> to your Windows nodes
  /// <code>rolearn</code> in the <code>aws-auth</code> <code>ConfigMap</code>.
  /// For more information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [capacityType] :
  /// The capacity type for your node group.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [diskSize] :
  /// The root device disk size (in GiB) for your node group instances. The
  /// default disk size is 20 GiB for Linux and Bottlerocket. The default disk
  /// size is 50 GiB for Windows. If you specify <code>launchTemplate</code>,
  /// then don't specify <code>diskSize</code>, or the node group deployment
  /// will fail. For more information about using launch templates with Amazon
  /// EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [instanceTypes] :
  /// Specify the instance types for a node group. If you specify a GPU instance
  /// type, make sure to also specify an applicable GPU AMI type with the
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [labels] :
  /// The Kubernetes <code>labels</code> to apply to the nodes in the node group
  /// when they are created.
  ///
  /// Parameter [launchTemplate] :
  /// An object representing a node group's launch template specification. When
  /// using this object, don't directly specify <code>instanceTypes</code>,
  /// <code>diskSize</code>, or <code>remoteAccess</code>. Make sure that the
  /// launch template meets the requirements in
  /// <code>launchTemplateSpecification</code>. Also refer to <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS optimized AMI to use with your node
  /// group. By default, the latest available AMI version for the node group's
  /// current Kubernetes version is used. For information about Linux versions,
  /// see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>. Amazon EKS managed node groups support the November 2022 and
  /// later releases of the Windows AMIs. For information about Windows
  /// versions, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-ami-versions-windows.html">Amazon
  /// EKS optimized Windows AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// If you specify <code>launchTemplate</code>, and your launch template uses
  /// a custom AMI, then don't specify <code>releaseVersion</code>, or the node
  /// group deployment will fail. For more information about using launch
  /// templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [remoteAccess] :
  /// The remote access configuration to use with your node group. For Linux,
  /// the protocol is SSH. For Windows, the protocol is RDP. If you specify
  /// <code>launchTemplate</code>, then don't specify <code>remoteAccess</code>,
  /// or the node group deployment will fail. For more information about using
  /// launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [scalingConfig] :
  /// The scaling configuration details for the Auto Scaling group that is
  /// created for your node group.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// Parameter [taints] :
  /// The Kubernetes taints to be applied to the nodes in the node group. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
  /// taints on managed node groups</a>.
  ///
  /// Parameter [updateConfig] :
  /// The node group update configuration.
  ///
  /// Parameter [version] :
  /// The Kubernetes version to use for your managed nodes. By default, the
  /// Kubernetes version of the cluster is used, and this is the only accepted
  /// specified value. If you specify <code>launchTemplate</code>, and your
  /// launch template uses a custom AMI, then don't specify
  /// <code>version</code>, or the node group deployment will fail. For more
  /// information about using launch templates with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
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

  /// Creates an EKS Pod Identity association between a service account in an
  /// Amazon EKS cluster and an IAM role with <i>EKS Pod Identity</i>. Use EKS
  /// Pod Identity to give temporary IAM credentials to pods and the credentials
  /// are rotated automatically.
  ///
  /// Amazon EKS Pod Identity associations provide the ability to manage
  /// credentials for your applications, similar to the way that Amazon EC2
  /// instance profiles provide credentials to Amazon EC2 instances.
  ///
  /// If a pod uses a service account that has an association, Amazon EKS sets
  /// environment variables in the containers of the pod. The environment
  /// variables configure the Amazon Web Services SDKs, including the Command
  /// Line Interface, to use the EKS Pod Identity credentials.
  ///
  /// Pod Identity is a simpler method than <i>IAM roles for service
  /// accounts</i>, as this method doesn't use OIDC identity providers.
  /// Additionally, you can configure a role for Pod Identity once, and reuse it
  /// across clusters.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to create the association in.
  ///
  /// Parameter [namespace] :
  /// The name of the Kubernetes namespace inside the cluster to create the
  /// association in. The service account and the pods that use the service
  /// account must be in this namespace.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the
  /// service account. The EKS Pod Identity agent manages credentials to assume
  /// this role for applications in the containers in the pods that use this
  /// service account.
  ///
  /// Parameter [serviceAccount] :
  /// The name of the Kubernetes service account inside the cluster to associate
  /// the IAM credentials with.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource – 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length – 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length – 256 Unicode characters in UTF-8
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
  Future<CreatePodIdentityAssociationResponse> createPodIdentityAssociation({
    required String clusterName,
    required String namespace,
    required String roleArn,
    required String serviceAccount,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'namespace': namespace,
      'roleArn': roleArn,
      'serviceAccount': serviceAccount,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/pod-identity-associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePodIdentityAssociationResponse.fromJson(response);
  }

  /// Deletes an access entry.
  ///
  /// Deleting an access entry of a type other than <code>Standard</code> can
  /// cause your cluster to function improperly. If you delete an access entry
  /// in error, you can recreate it.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  Future<void> deleteAccessEntry({
    required String clusterName,
    required String principalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon EKS add-on.
  ///
  /// When you remove an add-on, it's deleted from the cluster. You can always
  /// manually start an add-on on the cluster using the Kubernetes API.
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
  /// The name of your cluster.
  ///
  /// Parameter [preserve] :
  /// Specifying this option preserves the add-on software on your cluster but
  /// Amazon EKS stops managing any settings for the add-on. If an IAM account
  /// is associated with the add-on, it isn't removed.
  Future<DeleteAddonResponse> deleteAddon({
    required String addonName,
    required String clusterName,
    bool? preserve,
  }) async {
    final $query = <String, List<String>>{
      if (preserve != null) 'preserve': [preserve.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/addons/${Uri.encodeComponent(addonName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAddonResponse.fromJson(response);
  }

  /// Deletes an Amazon EKS cluster control plane.
  ///
  /// If you have active services in your cluster that are associated with a
  /// load balancer, you must delete those services before deleting the cluster
  /// so that the load balancers are deleted properly. Otherwise, you can have
  /// orphaned resources in your VPC that prevent you from being able to delete
  /// the VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html">Deleting
  /// a cluster</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// If you have managed node groups or Fargate profiles attached to the
  /// cluster, you must delete them first. For more information, see
  /// <code>DeleteNodgroup</code> and <code>DeleteFargateProfile</code>.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/clusters/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteClusterResponse.fromJson(response);
  }

  /// Deletes an expired or inactive subscription. Deleting inactive
  /// subscriptions removes them from the Amazon Web Services Management Console
  /// view and from list/describe API responses. Subscriptions can only be
  /// cancelled within 7 days of creation and are cancelled by creating a ticket
  /// in the Amazon Web Services Support Center.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ServerException].
  ///
  /// Parameter [id] :
  /// The ID of the subscription.
  Future<DeleteEksAnywhereSubscriptionResponse> deleteEksAnywhereSubscription({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/eks-anywhere-subscriptions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEksAnywhereSubscriptionResponse.fromJson(response);
  }

  /// Deletes an Fargate profile.
  ///
  /// When you delete a Fargate profile, any <code>Pod</code> running on Fargate
  /// that was created with the profile is deleted. If the <code>Pod</code>
  /// matches another Fargate profile, then it is scheduled on Fargate with that
  /// profile. If it no longer matches any Fargate profiles, then it's not
  /// scheduled on Fargate and may remain in a pending state.
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
  /// The name of your cluster.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile to delete.
  Future<DeleteFargateProfileResponse> deleteFargateProfile({
    required String clusterName,
    required String fargateProfileName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles/${Uri.encodeComponent(fargateProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFargateProfileResponse.fromJson(response);
  }

  /// Deletes a managed node group.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the node group to delete.
  Future<DeleteNodegroupResponse> deleteNodegroup({
    required String clusterName,
    required String nodegroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNodegroupResponse.fromJson(response);
  }

  /// Deletes a EKS Pod Identity association.
  ///
  /// The temporary Amazon Web Services credentials from the previous IAM role
  /// session might still be valid until the session expiry. If you need to
  /// immediately revoke the temporary session credentials, then go to the role
  /// in the IAM console.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [associationId] :
  /// The ID of the association to be deleted.
  ///
  /// Parameter [clusterName] :
  /// The cluster name that
  Future<DeletePodIdentityAssociationResponse> deletePodIdentityAssociation({
    required String associationId,
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/pod-identity-associations/${Uri.encodeComponent(associationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePodIdentityAssociationResponse.fromJson(response);
  }

  /// Deregisters a connected cluster to remove it from the Amazon EKS control
  /// plane.
  ///
  /// A connected cluster is a Kubernetes cluster that you've connected to your
  /// control plane using the <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-connector.html">Amazon
  /// EKS Connector</a>.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the connected cluster to deregister.
  Future<DeregisterClusterResponse> deregisterCluster({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cluster-registrations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterClusterResponse.fromJson(response);
  }

  /// Describes an access entry.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  Future<DescribeAccessEntryResponse> describeAccessEntry({
    required String clusterName,
    required String principalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccessEntryResponse.fromJson(response);
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
  /// The name of your cluster.
  Future<DescribeAddonResponse> describeAddon({
    required String addonName,
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/addons/${Uri.encodeComponent(addonName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAddonResponse.fromJson(response);
  }

  /// Returns configuration options.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [addonName] :
  /// The name of the add-on. The name must match one of the names returned by
  /// <code>DescribeAddonVersions</code>.
  ///
  /// Parameter [addonVersion] :
  /// The version of the add-on. The version must match one of the versions
  /// returned by <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeAddonVersions.html">
  /// <code>DescribeAddonVersions</code> </a>.
  Future<DescribeAddonConfigurationResponse> describeAddonConfiguration({
    required String addonName,
    required String addonVersion,
  }) async {
    final $query = <String, List<String>>{
      'addonName': [addonName],
      'addonVersion': [addonVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/addons/configuration-schemas',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAddonConfigurationResponse.fromJson(response);
  }

  /// Describes the versions for an add-on.
  ///
  /// Information such as the Kubernetes versions that you can use the add-on
  /// with, the <code>owner</code>, <code>publisher</code>, and the
  /// <code>type</code> of the add-on are returned.
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
  /// The Kubernetes versions that you can use the add-on with.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [owners] :
  /// The owner of the add-on. For valid <code>owners</code>, don't specify a
  /// value for this property.
  ///
  /// Parameter [publishers] :
  /// The publisher of the add-on. For valid <code>publishers</code>, don't
  /// specify a value for this property.
  ///
  /// Parameter [types] :
  /// The type of the add-on. For valid <code>types</code>, don't specify a
  /// value for this property.
  Future<DescribeAddonVersionsResponse> describeAddonVersions({
    String? addonName,
    String? kubernetesVersion,
    int? maxResults,
    String? nextToken,
    List<String>? owners,
    List<String>? publishers,
    List<String>? types,
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
      if (owners != null) 'owners': owners,
      if (publishers != null) 'publishers': publishers,
      if (types != null) 'types': types,
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

  /// Describes an Amazon EKS cluster.
  ///
  /// The API server endpoint and certificate authority data returned by this
  /// operation are required for <code>kubelet</code> and <code>kubectl</code>
  /// to communicate with your Kubernetes API server. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html">Creating
  /// or updating a <code>kubeconfig</code> file for an Amazon EKS cluster</a>.
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
  /// The name of your cluster.
  Future<DescribeClusterResponse> describeCluster({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clusters/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterResponse.fromJson(response);
  }

  /// Returns descriptive information about a subscription.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [id] :
  /// The ID of the subscription.
  Future<DescribeEksAnywhereSubscriptionResponse>
      describeEksAnywhereSubscription({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eks-anywhere-subscriptions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEksAnywhereSubscriptionResponse.fromJson(response);
  }

  /// Describes an Fargate profile.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [fargateProfileName] :
  /// The name of the Fargate profile to describe.
  Future<DescribeFargateProfileResponse> describeFargateProfile({
    required String clusterName,
    required String fargateProfileName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles/${Uri.encodeComponent(fargateProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFargateProfileResponse.fromJson(response);
  }

  /// Describes an identity provider configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [identityProviderConfig] :
  /// An object representing an identity provider configuration.
  Future<DescribeIdentityProviderConfigResponse>
      describeIdentityProviderConfig({
    required String clusterName,
    required IdentityProviderConfig identityProviderConfig,
  }) async {
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

  /// Returns details about an insight that you specify using its ID.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to describe the insight for.
  ///
  /// Parameter [id] :
  /// The identity of the insight to describe.
  Future<DescribeInsightResponse> describeInsight({
    required String clusterName,
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/insights/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInsightResponse.fromJson(response);
  }

  /// Describes a managed node group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the node group to describe.
  Future<DescribeNodegroupResponse> describeNodegroup({
    required String clusterName,
    required String nodegroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/node-groups/${Uri.encodeComponent(nodegroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNodegroupResponse.fromJson(response);
  }

  /// Returns descriptive information about an EKS Pod Identity association.
  ///
  /// This action requires the ID of the association. You can get the ID from
  /// the response to the <code>CreatePodIdentityAssocation</code> for newly
  /// created associations. Or, you can list the IDs for associations with
  /// <code>ListPodIdentityAssociations</code> and filter the list by namespace
  /// or service account.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [associationId] :
  /// The ID of the association that you want the description of.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that the association is in.
  Future<DescribePodIdentityAssociationResponse>
      describePodIdentityAssociation({
    required String associationId,
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/pod-identity-associations/${Uri.encodeComponent(associationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePodIdentityAssociationResponse.fromJson(response);
  }

  /// Describes an update to an Amazon EKS resource.
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
  /// <code>ListAddons</code> </a>. This parameter is required if the update is
  /// an add-on update.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the Amazon EKS node group associated with the update. This
  /// parameter is required if the update is a node group update.
  Future<DescribeUpdateResponse> describeUpdate({
    required String name,
    required String updateId,
    String? addonName,
    String? nodegroupName,
  }) async {
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

  /// Disassociates an access policy from an access entry.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [policyArn] :
  /// The ARN of the policy to disassociate from the access entry. For a list of
  /// associated policies ARNs, use <code>ListAssociatedAccessPolicies</code>.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  Future<void> disassociateAccessPolicy({
    required String clusterName,
    required String policyArn,
    required String principalArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}/access-policies/${Uri.encodeComponent(policyArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates an identity provider configuration from a cluster.
  ///
  /// If you disassociate an identity provider from your cluster, users included
  /// in the provider can no longer access the cluster. However, you can still
  /// access the cluster with IAM principals.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [identityProviderConfig] :
  /// An object representing an identity provider configuration.
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

  /// Lists the access entries for your cluster.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [associatedPolicyArn] :
  /// The ARN of an <code>AccessPolicy</code>. When you specify an access policy
  /// ARN, only the access entries associated to that access policy are
  /// returned. For a list of available policy ARNs, use
  /// <code>ListAccessPolicies</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAccessEntriesResponse> listAccessEntries({
    required String clusterName,
    String? associatedPolicyArn,
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
      if (associatedPolicyArn != null)
        'associatedPolicyArn': [associatedPolicyArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessEntriesResponse.fromJson(response);
  }

  /// Lists the available access policies.
  ///
  /// May throw [ServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAccessPoliciesResponse> listAccessPolicies({
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
      requestUri: '/access-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPoliciesResponse.fromJson(response);
  }

  /// Lists the installed add-ons.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ClientException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAddonsResponse> listAddons({
    required String clusterName,
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
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/addons',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAddonsResponse.fromJson(response);
  }

  /// Lists the access policies associated with an access entry.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListAssociatedAccessPoliciesResponse> listAssociatedAccessPolicies({
    required String clusterName,
    required String principalArn,
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
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}/access-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedAccessPoliciesResponse.fromJson(response);
  }

  /// Lists the Amazon EKS clusters in your Amazon Web Services account in the
  /// specified Amazon Web Services Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [include] :
  /// Indicates whether external clusters are included in the returned list. Use
  /// '<code>all</code>' to return <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-connector.html">https://docs.aws.amazon.com/eks/latest/userguide/eks-connector.html</a>connected
  /// clusters, or blank to return only Amazon EKS clusters. '<code>all</code>'
  /// must be in lowercase otherwise an error occurs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListClustersResponse> listClusters({
    List<String>? include,
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
      if (include != null) 'include': include,
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

  /// Displays the full description of the subscription.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [includeStatus] :
  /// An array of subscription statuses to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cluster results returned by
  /// ListEksAnywhereSubscriptions in paginated output. When you use this
  /// parameter, ListEksAnywhereSubscriptions returns only maxResults results in
  /// a single page along with a nextToken response element. You can see the
  /// remaining results of the initial request by sending another
  /// ListEksAnywhereSubscriptions request with the returned nextToken value.
  /// This value can be between 1 and 100. If you don't use this parameter,
  /// ListEksAnywhereSubscriptions returns up to 10 results and a nextToken
  /// value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListEksAnywhereSubscriptions</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  Future<ListEksAnywhereSubscriptionsResponse> listEksAnywhereSubscriptions({
    List<EksAnywhereSubscriptionStatus>? includeStatus,
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
      if (includeStatus != null)
        'includeStatus': includeStatus.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/eks-anywhere-subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEksAnywhereSubscriptionsResponse.fromJson(response);
  }

  /// Lists the Fargate profiles associated with the specified cluster in your
  /// Amazon Web Services account in the specified Amazon Web Services Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListFargateProfilesResponse> listFargateProfiles({
    required String clusterName,
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
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/fargate-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFargateProfilesResponse.fromJson(response);
  }

  /// Lists the identity provider configurations for your cluster.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListIdentityProviderConfigsResponse> listIdentityProviderConfigs({
    required String clusterName,
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
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/identity-provider-configs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityProviderConfigsResponse.fromJson(response);
  }

  /// Returns a list of all insights checked for against the specified cluster.
  /// You can filter which insights are returned by category, associated
  /// Kubernetes version, and status.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster associated with the insights.
  ///
  /// Parameter [filter] :
  /// The criteria to filter your list of insights for your cluster. You can
  /// filter which insights are returned by category, associated Kubernetes
  /// version, and status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identity provider configurations returned by
  /// <code>ListInsights</code> in paginated output. When you use this
  /// parameter, <code>ListInsights</code> returns only <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. You can see the remaining results of the initial request by
  /// sending another <code>ListInsights</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListInsights</code> returns up to 100
  /// results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListInsights</code> request. When the results of a
  /// <code>ListInsights</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  Future<ListInsightsResponse> listInsights({
    required String clusterName,
    InsightsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/insights',
      exceptionFnMap: _exceptionFns,
    );
    return ListInsightsResponse.fromJson(response);
  }

  /// Lists the managed node groups associated with the specified cluster in
  /// your Amazon Web Services account in the specified Amazon Web Services
  /// Region. Self-managed node groups aren't listed.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListNodegroupsResponse> listNodegroups({
    required String clusterName,
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
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/node-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodegroupsResponse.fromJson(response);
  }

  /// List the EKS Pod Identity associations in a cluster. You can filter the
  /// list by the namespace that the association is in or the service account
  /// that the association uses.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that the associations are in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of EKS Pod Identity association results returned by
  /// <code>ListPodIdentityAssociations</code> in paginated output. When you use
  /// this parameter, <code>ListPodIdentityAssociations</code> returns only
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another
  /// <code>ListPodIdentityAssociations</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListPodIdentityAssociations</code> returns
  /// up to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [namespace] :
  /// The name of the Kubernetes namespace inside the cluster that the
  /// associations are in.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListUpdates</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [serviceAccount] :
  /// The name of the Kubernetes service account that the associations use.
  Future<ListPodIdentityAssociationsResponse> listPodIdentityAssociations({
    required String clusterName,
    int? maxResults,
    String? namespace,
    String? nextToken,
    String? serviceAccount,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'nextToken': [nextToken],
      if (serviceAccount != null) 'serviceAccount': [serviceAccount],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/pod-identity-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPodIdentityAssociationsResponse.fromJson(response);
  }

  /// List the tags for an Amazon EKS resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list tags
  /// for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the updates associated with an Amazon EKS resource in your Amazon
  /// Web Services account, in the specified Amazon Web Services Region.
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
  /// The maximum number of results, returned in paginated output. You receive
  /// <code>maxResults</code> in a single page, along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, 100 results and a <code>nextToken</code> value,
  /// if applicable, are returned.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

  /// Connects a Kubernetes cluster to the Amazon EKS control plane.
  ///
  /// Any Kubernetes cluster can be connected to the Amazon EKS control plane to
  /// view current information about the cluster and its nodes.
  ///
  /// Cluster connection requires two steps. First, send a <code>
  /// <a>RegisterClusterRequest</a> </code> to add it to the Amazon EKS control
  /// plane.
  ///
  /// Second, a <a
  /// href="https://amazon-eks.s3.us-west-2.amazonaws.com/eks-connector/manifests/eks-connector/latest/eks-connector.yaml">Manifest</a>
  /// containing the <code>activationID</code> and <code>activationCode</code>
  /// must be applied to the Kubernetes cluster through it's native provider to
  /// provide visibility.
  ///
  /// After the manifest is updated and applied, the connected cluster is
  /// visible to the Amazon EKS control plane. If the manifest isn't applied
  /// within three days, the connected cluster will no longer be visible and
  /// must be deregistered using <code>DeregisterCluster</code>.
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourcePropagationDelayException].
  ///
  /// Parameter [connectorConfig] :
  /// The configuration settings required to connect the Kubernetes cluster to
  /// the Amazon EKS control plane.
  ///
  /// Parameter [name] :
  /// A unique name for this cluster in your Amazon Web Services Region.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  Future<RegisterClusterResponse> registerCluster({
    required ConnectorConfigRequest connectorConfig,
    required String name,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'connectorConfig': connectorConfig,
      'name': name,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster-registrations',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterClusterResponse.fromJson(response);
  }

  /// Associates the specified tags to an Amazon EKS resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted. Tags
  /// that you create for Amazon EKS resources don't propagate to any other
  /// resources associated with the cluster. For example, if you tag a cluster
  /// with this operation, that tag doesn't automatically propagate to the
  /// subnets and nodes associated with the cluster.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from an Amazon EKS resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to delete tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an access entry.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [kubernetesGroups] :
  /// The value for <code>name</code> that you've specified for <code>kind:
  /// Group</code> as a <code>subject</code> in a Kubernetes
  /// <code>RoleBinding</code> or <code>ClusterRoleBinding</code> object. Amazon
  /// EKS doesn't confirm that the value for <code>name</code> exists in any
  /// bindings on your cluster. You can specify one or more names.
  ///
  /// Kubernetes authorizes the <code>principalArn</code> of the access entry to
  /// access any cluster objects that you've specified in a Kubernetes
  /// <code>Role</code> or <code>ClusterRole</code> object that is also
  /// specified in a binding's <code>roleRef</code>. For more information about
  /// creating Kubernetes <code>RoleBinding</code>,
  /// <code>ClusterRoleBinding</code>, <code>Role</code>, or
  /// <code>ClusterRole</code> objects, see <a
  /// href="https://kubernetes.io/docs/reference/access-authn-authz/rbac/">Using
  /// RBAC Authorization in the Kubernetes documentation</a>.
  ///
  /// If you want Amazon EKS to authorize the <code>principalArn</code> (instead
  /// of, or in addition to Kubernetes authorizing the
  /// <code>principalArn</code>), you can associate one or more access policies
  /// to the access entry using <code>AssociateAccessPolicy</code>. If you
  /// associate any access policies, the <code>principalARN</code> has all
  /// permissions assigned in the associated access policies and all permissions
  /// in any Kubernetes <code>Role</code> or <code>ClusterRole</code> objects
  /// that the group names are bound to.
  ///
  /// Parameter [username] :
  /// The username to authenticate to Kubernetes with. We recommend not
  /// specifying a username and letting Amazon EKS specify it for you. For more
  /// information about the value Amazon EKS specifies for you, or constraints
  /// before specifying your own username, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html#creating-access-entries">Creating
  /// access entries</a> in the <i>Amazon EKS User Guide</i>.
  Future<UpdateAccessEntryResponse> updateAccessEntry({
    required String clusterName,
    required String principalArn,
    String? clientRequestToken,
    List<String>? kubernetesGroups,
    String? username,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kubernetesGroups != null) 'kubernetesGroups': kubernetesGroups,
      if (username != null) 'username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/access-entries/${Uri.encodeComponent(principalArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccessEntryResponse.fromJson(response);
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
  /// The name of your cluster.
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
  /// Parameter [configurationValues] :
  /// The set of configuration values for the add-on that's created. The values
  /// that you provide are validated against the schema returned by
  /// <code>DescribeAddonConfiguration</code>.
  ///
  /// Parameter [podIdentityAssociations] :
  /// An array of Pod Identity Assocations to be updated. Each EKS Pod Identity
  /// association maps a Kubernetes service account to an IAM Role. If this
  /// value is left blank, no change. If an empty array is provided, existing
  /// Pod Identity Assocations owned by the Addon are deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using Pod Identity</a> in the EKS User
  /// Guide.
  ///
  /// Parameter [resolveConflicts] :
  /// How to resolve field value conflicts for an Amazon EKS add-on if you've
  /// changed a value from the Amazon EKS default value. Conflicts are handled
  /// based on the option you choose:
  ///
  /// <ul>
  /// <li>
  /// <b>None</b> – Amazon EKS doesn't change the value. The update might fail.
  /// </li>
  /// <li>
  /// <b>Overwrite</b> – Amazon EKS overwrites the changed value back to the
  /// Amazon EKS default value.
  /// </li>
  /// <li>
  /// <b>Preserve</b> – Amazon EKS preserves the value. If you choose this
  /// option, we recommend that you test any field and value changes on a
  /// non-production cluster before updating the add-on on your production
  /// cluster.
  /// </li>
  /// </ul>
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
    String? configurationValues,
    List<AddonPodIdentityAssociations>? podIdentityAssociations,
    ResolveConflicts? resolveConflicts,
    String? serviceAccountRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (addonVersion != null) 'addonVersion': addonVersion,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (configurationValues != null)
        'configurationValues': configurationValues,
      if (podIdentityAssociations != null)
        'podIdentityAssociations': podIdentityAssociations,
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
  /// you can use to track the status of your cluster update with
  /// <code>DescribeUpdate</code>"/&gt;.
  ///
  /// You can use this API operation to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS Cluster control plane logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing</a>.
  /// </note>
  /// You can also use this API operation to enable or disable public and
  /// private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS cluster endpoint access control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  ///
  /// You can also use this API operation to choose different subnets and
  /// security groups for the cluster. You must specify at least two subnets
  /// that are in different Availability Zones. You can't change which VPC the
  /// subnets are from, the subnets must be in the same VPC as the subnets that
  /// the cluster was created with. For more information about the VPC
  /// requirements, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html</a>
  /// in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
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
  /// Parameter [accessConfig] :
  /// The access configuration for the cluster.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [logging] :
  /// Enable or disable exporting the Kubernetes control plane logs for your
  /// cluster to CloudWatch Logs. By default, cluster control plane logs aren't
  /// exported to CloudWatch Logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS cluster control plane logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing</a>.
  /// </note>
  Future<UpdateClusterConfigResponse> updateClusterConfig({
    required String name,
    UpdateAccessConfigRequest? accessConfig,
    String? clientRequestToken,
    Logging? logging,
    VpcConfigRequest? resourcesVpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (accessConfig != null) 'accessConfig': accessConfig,
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
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<UpdateClusterVersionResponse> updateClusterVersion({
    required String name,
    required String version,
    String? clientRequestToken,
  }) async {
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

  /// Update an EKS Anywhere Subscription. Only auto renewal and tags can be
  /// updated after subscription creation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [autoRenew] :
  /// A boolean indicating whether or not to automatically renew the
  /// subscription.
  ///
  /// Parameter [id] :
  /// The ID of the subscription.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier to ensure the idempotency of the
  /// request.
  Future<UpdateEksAnywhereSubscriptionResponse> updateEksAnywhereSubscription({
    required bool autoRenew,
    required String id,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'autoRenew': autoRenew,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/eks-anywhere-subscriptions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEksAnywhereSubscriptionResponse.fromJson(response);
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
  /// The name of your cluster.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the managed node group to update.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [labels] :
  /// The Kubernetes <code>labels</code> to apply to the nodes in the node group
  /// after the update.
  ///
  /// Parameter [scalingConfig] :
  /// The scaling configuration details for the Auto Scaling group after the
  /// update.
  ///
  /// Parameter [taints] :
  /// The Kubernetes taints to be applied to the nodes in the node group after
  /// the update. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
  /// taints on managed node groups</a>.
  ///
  /// Parameter [updateConfig] :
  /// The node group update configuration.
  Future<UpdateNodegroupConfigResponse> updateNodegroupConfig({
    required String clusterName,
    required String nodegroupName,
    String? clientRequestToken,
    UpdateLabelsPayload? labels,
    NodegroupScalingConfig? scalingConfig,
    UpdateTaintsPayload? taints,
    NodegroupUpdateConfig? updateConfig,
  }) async {
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
  /// specifying your cluster's Kubernetes version in the request. For
  /// information about Linux versions, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>. For information about Windows versions, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-ami-versions-windows.html">Amazon
  /// EKS optimized Windows AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// You cannot roll back a node group to an earlier Kubernetes version or AMI
  /// version.
  ///
  /// When a node in a managed node group is terminated due to a scaling action
  /// or update, every <code>Pod</code> on that node is drained first. Amazon
  /// EKS attempts to drain the nodes gracefully and will fail if it is unable
  /// to do so. You can <code>force</code> the update if Amazon EKS is unable to
  /// drain the nodes as a result of a <code>Pod</code> disruption budget issue.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ClientException].
  /// May throw [ServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterName] :
  /// The name of your cluster.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the managed node group to update.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [force] :
  /// Force the update if any <code>Pod</code> on the existing node group can't
  /// be drained due to a <code>Pod</code> disruption budget issue. If an update
  /// fails because all Pods can't be drained, you can force the update after it
  /// fails to terminate the old node whether or not any <code>Pod</code> is
  /// running on the node.
  ///
  /// Parameter [launchTemplate] :
  /// An object representing a node group's launch template specification. You
  /// can only update a node group using a launch template if the node group was
  /// originally deployed with a launch template.
  ///
  /// Parameter [releaseVersion] :
  /// The AMI version of the Amazon EKS optimized AMI to use for the update. By
  /// default, the latest available AMI version for the node group's Kubernetes
  /// version is used. For information about Linux versions, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon
  /// EKS optimized Amazon Linux AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>. Amazon EKS managed node groups support the November 2022 and
  /// later releases of the Windows AMIs. For information about Windows
  /// versions, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-ami-versions-windows.html">Amazon
  /// EKS optimized Windows AMI versions</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// If you specify <code>launchTemplate</code>, and your launch template uses
  /// a custom AMI, then don't specify <code>releaseVersion</code>, or the node
  /// group update will fail. For more information about using launch templates
  /// with Amazon EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  Future<UpdateNodegroupVersionResponse> updateNodegroupVersion({
    required String clusterName,
    required String nodegroupName,
    String? clientRequestToken,
    bool? force,
    LaunchTemplateSpecification? launchTemplate,
    String? releaseVersion,
    String? version,
  }) async {
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

  /// Updates a EKS Pod Identity association. Only the IAM role can be changed;
  /// an association can't be moved between clusters, namespaces, or service
  /// accounts. If you need to edit the namespace or service account, you need
  /// to delete the association and then create a new association with your
  /// desired settings.
  ///
  /// May throw [ServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [associationId] :
  /// The ID of the association to be updated.
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster that you want to update the association in.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [roleArn] :
  /// The new IAM role to change the
  Future<UpdatePodIdentityAssociationResponse> updatePodIdentityAssociation({
    required String associationId,
    required String clusterName,
    String? clientRequestToken,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/pod-identity-associations/${Uri.encodeComponent(associationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePodIdentityAssociationResponse.fromJson(response);
  }
}

enum AMITypes {
  al2X86_64,
  al2X86_64Gpu,
  al2Arm_64,
  custom,
  bottlerocketArm_64,
  bottlerocketX86_64,
  bottlerocketArm_64Nvidia,
  bottlerocketX86_64Nvidia,
  windowsCore_2019X86_64,
  windowsFull_2019X86_64,
  windowsCore_2022X86_64,
  windowsFull_2022X86_64,
  al2023X86_64Standard,
  al2023Arm_64Standard,
}

extension AMITypesValueExtension on AMITypes {
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
      case AMITypes.bottlerocketArm_64:
        return 'BOTTLEROCKET_ARM_64';
      case AMITypes.bottlerocketX86_64:
        return 'BOTTLEROCKET_x86_64';
      case AMITypes.bottlerocketArm_64Nvidia:
        return 'BOTTLEROCKET_ARM_64_NVIDIA';
      case AMITypes.bottlerocketX86_64Nvidia:
        return 'BOTTLEROCKET_x86_64_NVIDIA';
      case AMITypes.windowsCore_2019X86_64:
        return 'WINDOWS_CORE_2019_x86_64';
      case AMITypes.windowsFull_2019X86_64:
        return 'WINDOWS_FULL_2019_x86_64';
      case AMITypes.windowsCore_2022X86_64:
        return 'WINDOWS_CORE_2022_x86_64';
      case AMITypes.windowsFull_2022X86_64:
        return 'WINDOWS_FULL_2022_x86_64';
      case AMITypes.al2023X86_64Standard:
        return 'AL2023_x86_64_STANDARD';
      case AMITypes.al2023Arm_64Standard:
        return 'AL2023_ARM_64_STANDARD';
    }
  }
}

extension AMITypesFromString on String {
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
      case 'BOTTLEROCKET_ARM_64':
        return AMITypes.bottlerocketArm_64;
      case 'BOTTLEROCKET_x86_64':
        return AMITypes.bottlerocketX86_64;
      case 'BOTTLEROCKET_ARM_64_NVIDIA':
        return AMITypes.bottlerocketArm_64Nvidia;
      case 'BOTTLEROCKET_x86_64_NVIDIA':
        return AMITypes.bottlerocketX86_64Nvidia;
      case 'WINDOWS_CORE_2019_x86_64':
        return AMITypes.windowsCore_2019X86_64;
      case 'WINDOWS_FULL_2019_x86_64':
        return AMITypes.windowsFull_2019X86_64;
      case 'WINDOWS_CORE_2022_x86_64':
        return AMITypes.windowsCore_2022X86_64;
      case 'WINDOWS_FULL_2022_x86_64':
        return AMITypes.windowsFull_2022X86_64;
      case 'AL2023_x86_64_STANDARD':
        return AMITypes.al2023X86_64Standard;
      case 'AL2023_ARM_64_STANDARD':
        return AMITypes.al2023Arm_64Standard;
    }
    throw Exception('$this is not known in enum AMITypes');
  }
}

/// The access configuration for the cluster.
class AccessConfigResponse {
  /// The current authentication mode of the cluster.
  final AuthenticationMode? authenticationMode;

  /// Specifies whether or not the cluster creator IAM principal was set as a
  /// cluster admin access entry during cluster creation time.
  final bool? bootstrapClusterCreatorAdminPermissions;

  AccessConfigResponse({
    this.authenticationMode,
    this.bootstrapClusterCreatorAdminPermissions,
  });

  factory AccessConfigResponse.fromJson(Map<String, dynamic> json) {
    return AccessConfigResponse(
      authenticationMode:
          (json['authenticationMode'] as String?)?.toAuthenticationMode(),
      bootstrapClusterCreatorAdminPermissions:
          json['bootstrapClusterCreatorAdminPermissions'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationMode = this.authenticationMode;
    final bootstrapClusterCreatorAdminPermissions =
        this.bootstrapClusterCreatorAdminPermissions;
    return {
      if (authenticationMode != null)
        'authenticationMode': authenticationMode.toValue(),
      if (bootstrapClusterCreatorAdminPermissions != null)
        'bootstrapClusterCreatorAdminPermissions':
            bootstrapClusterCreatorAdminPermissions,
    };
  }
}

/// An access entry allows an IAM principal (user or role) to access your
/// cluster. Access entries can replace the need to maintain the
/// <code>aws-auth</code> <code>ConfigMap</code> for authentication. For more
/// information about access entries, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html">Access
/// entries</a> in the <i>Amazon EKS User Guide</i>.
class AccessEntry {
  /// The ARN of the access entry.
  final String? accessEntryArn;

  /// The name of your cluster.
  final String? clusterName;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// A <code>name</code> that you've specified in a Kubernetes
  /// <code>RoleBinding</code> or <code>ClusterRoleBinding</code> object so that
  /// Kubernetes authorizes the <code>principalARN</code> access to cluster
  /// objects.
  final List<String>? kubernetesGroups;

  /// The Unix epoch timestamp for the last modification to the object.
  final DateTime? modifiedAt;

  /// The ARN of the IAM principal for the access entry. If you ever delete the
  /// IAM principal with this ARN, the access entry isn't automatically deleted.
  /// We recommend that you delete the access entry with an ARN for an IAM
  /// principal that you delete. If you don't delete the access entry and ever
  /// recreate the IAM principal, even if it has the same ARN, the access entry
  /// won't work. This is because even though the ARN is the same for the
  /// recreated IAM principal, the <code>roleID</code> or <code>userID</code> (you
  /// can see this with the Security Token Service <code>GetCallerIdentity</code>
  /// API) is different for the recreated IAM principal than it was for the
  /// original IAM principal. Even though you don't see the IAM principal's
  /// <code>roleID</code> or <code>userID</code> for an access entry, Amazon EKS
  /// stores it with the access entry.
  final String? principalArn;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  final Map<String, String>? tags;

  /// The type of the access entry.
  final String? type;

  /// The <code>name</code> of a user that can authenticate to your cluster.
  final String? username;

  AccessEntry({
    this.accessEntryArn,
    this.clusterName,
    this.createdAt,
    this.kubernetesGroups,
    this.modifiedAt,
    this.principalArn,
    this.tags,
    this.type,
    this.username,
  });

  factory AccessEntry.fromJson(Map<String, dynamic> json) {
    return AccessEntry(
      accessEntryArn: json['accessEntryArn'] as String?,
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      kubernetesGroups: (json['kubernetesGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      principalArn: json['principalArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['type'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessEntryArn = this.accessEntryArn;
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final kubernetesGroups = this.kubernetesGroups;
    final modifiedAt = this.modifiedAt;
    final principalArn = this.principalArn;
    final tags = this.tags;
    final type = this.type;
    final username = this.username;
    return {
      if (accessEntryArn != null) 'accessEntryArn': accessEntryArn,
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (kubernetesGroups != null) 'kubernetesGroups': kubernetesGroups,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (principalArn != null) 'principalArn': principalArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
      if (username != null) 'username': username,
    };
  }
}

/// An access policy includes permissions that allow Amazon EKS to authorize an
/// IAM principal to work with Kubernetes objects on your cluster. The policies
/// are managed by Amazon EKS, but they're not IAM policies. You can't view the
/// permissions in the policies using the API. The permissions for many of the
/// policies are similar to the Kubernetes <code>cluster-admin</code>,
/// <code>admin</code>, <code>edit</code>, and <code>view</code> cluster roles.
/// For more information about these cluster roles, see <a
/// href="https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles">User-facing
/// roles</a> in the Kubernetes documentation. To view the contents of the
/// policies, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html#access-policy-permissions">Access
/// policy permissions</a> in the <i>Amazon EKS User Guide</i>.
class AccessPolicy {
  /// The ARN of the access policy.
  final String? arn;

  /// The name of the access policy.
  final String? name;

  AccessPolicy({
    this.arn,
    this.name,
  });

  factory AccessPolicy.fromJson(Map<String, dynamic> json) {
    return AccessPolicy(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

/// The scope of an <code>AccessPolicy</code> that's associated to an
/// <code>AccessEntry</code>.
class AccessScope {
  /// A Kubernetes <code>namespace</code> that an access policy is scoped to. A
  /// value is required if you specified <code>namespace</code> for
  /// <code>Type</code>.
  final List<String>? namespaces;

  /// The scope type of an access policy.
  final AccessScopeType? type;

  AccessScope({
    this.namespaces,
    this.type,
  });

  factory AccessScope.fromJson(Map<String, dynamic> json) {
    return AccessScope(
      namespaces: (json['namespaces'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.toAccessScopeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final type = this.type;
    return {
      if (namespaces != null) 'namespaces': namespaces,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum AccessScopeType {
  cluster,
  namespace,
}

extension AccessScopeTypeValueExtension on AccessScopeType {
  String toValue() {
    switch (this) {
      case AccessScopeType.cluster:
        return 'cluster';
      case AccessScopeType.namespace:
        return 'namespace';
    }
  }
}

extension AccessScopeTypeFromString on String {
  AccessScopeType toAccessScopeType() {
    switch (this) {
      case 'cluster':
        return AccessScopeType.cluster;
      case 'namespace':
        return AccessScopeType.namespace;
    }
    throw Exception('$this is not known in enum AccessScopeType');
  }
}

/// An Amazon EKS add-on. For more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html">Amazon
/// EKS add-ons</a> in the <i>Amazon EKS User Guide</i>.
class Addon {
  /// The Amazon Resource Name (ARN) of the add-on.
  final String? addonArn;

  /// The name of the add-on.
  final String? addonName;

  /// The version of the add-on.
  final String? addonVersion;

  /// The name of your cluster.
  final String? clusterName;

  /// The configuration values that you provided.
  final String? configurationValues;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// An object that represents the health of the add-on.
  final AddonHealth? health;

  /// Information about an Amazon EKS add-on from the Amazon Web Services
  /// Marketplace.
  final MarketplaceInformation? marketplaceInformation;

  /// The Unix epoch timestamp for the last modification to the object.
  final DateTime? modifiedAt;

  /// The owner of the add-on.
  final String? owner;

  /// An array of Pod Identity Assocations owned by the Addon. Each EKS Pod
  /// Identity association maps a role to a service account in a namespace in the
  /// cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using Pod Identity</a> in the EKS User
  /// Guide.
  final List<String>? podIdentityAssociations;

  /// The publisher of the add-on.
  final String? publisher;

  /// The Amazon Resource Name (ARN) of the IAM role that's bound to the
  /// Kubernetes <code>ServiceAccount</code> object that the add-on uses.
  final String? serviceAccountRoleArn;

  /// The status of the add-on.
  final AddonStatus? status;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  final Map<String, String>? tags;

  Addon({
    this.addonArn,
    this.addonName,
    this.addonVersion,
    this.clusterName,
    this.configurationValues,
    this.createdAt,
    this.health,
    this.marketplaceInformation,
    this.modifiedAt,
    this.owner,
    this.podIdentityAssociations,
    this.publisher,
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
      configurationValues: json['configurationValues'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      health: json['health'] != null
          ? AddonHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      marketplaceInformation: json['marketplaceInformation'] != null
          ? MarketplaceInformation.fromJson(
              json['marketplaceInformation'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      owner: json['owner'] as String?,
      podIdentityAssociations: (json['podIdentityAssociations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      publisher: json['publisher'] as String?,
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
    final configurationValues = this.configurationValues;
    final createdAt = this.createdAt;
    final health = this.health;
    final marketplaceInformation = this.marketplaceInformation;
    final modifiedAt = this.modifiedAt;
    final owner = this.owner;
    final podIdentityAssociations = this.podIdentityAssociations;
    final publisher = this.publisher;
    final serviceAccountRoleArn = this.serviceAccountRoleArn;
    final status = this.status;
    final tags = this.tags;
    return {
      if (addonArn != null) 'addonArn': addonArn,
      if (addonName != null) 'addonName': addonName,
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (clusterName != null) 'clusterName': clusterName,
      if (configurationValues != null)
        'configurationValues': configurationValues,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (health != null) 'health': health,
      if (marketplaceInformation != null)
        'marketplaceInformation': marketplaceInformation,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (owner != null) 'owner': owner,
      if (podIdentityAssociations != null)
        'podIdentityAssociations': podIdentityAssociations,
      if (publisher != null) 'publisher': publisher,
      if (serviceAccountRoleArn != null)
        'serviceAccountRoleArn': serviceAccountRoleArn,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The health of the add-on.
class AddonHealth {
  /// An object representing the health issues for an add-on.
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

  /// An object representing information about available add-on versions and
  /// compatible Kubernetes versions.
  final List<AddonVersionInfo>? addonVersions;

  /// Information about the add-on from the Amazon Web Services Marketplace.
  final MarketplaceInformation? marketplaceInformation;

  /// The owner of the add-on.
  final String? owner;

  /// The publisher of the add-on.
  final String? publisher;

  /// The type of the add-on.
  final String? type;

  AddonInfo({
    this.addonName,
    this.addonVersions,
    this.marketplaceInformation,
    this.owner,
    this.publisher,
    this.type,
  });

  factory AddonInfo.fromJson(Map<String, dynamic> json) {
    return AddonInfo(
      addonName: json['addonName'] as String?,
      addonVersions: (json['addonVersions'] as List?)
          ?.whereNotNull()
          .map((e) => AddonVersionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      marketplaceInformation: json['marketplaceInformation'] != null
          ? MarketplaceInformation.fromJson(
              json['marketplaceInformation'] as Map<String, dynamic>)
          : null,
      owner: json['owner'] as String?,
      publisher: json['publisher'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonVersions = this.addonVersions;
    final marketplaceInformation = this.marketplaceInformation;
    final owner = this.owner;
    final publisher = this.publisher;
    final type = this.type;
    return {
      if (addonName != null) 'addonName': addonName,
      if (addonVersions != null) 'addonVersions': addonVersions,
      if (marketplaceInformation != null)
        'marketplaceInformation': marketplaceInformation,
      if (owner != null) 'owner': owner,
      if (publisher != null) 'publisher': publisher,
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
  k8sResourceNotFound,
  addonSubscriptionNeeded,
  addonPermissionFailure,
}

extension AddonIssueCodeValueExtension on AddonIssueCode {
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
      case AddonIssueCode.k8sResourceNotFound:
        return 'K8sResourceNotFound';
      case AddonIssueCode.addonSubscriptionNeeded:
        return 'AddonSubscriptionNeeded';
      case AddonIssueCode.addonPermissionFailure:
        return 'AddonPermissionFailure';
    }
  }
}

extension AddonIssueCodeFromString on String {
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
      case 'K8sResourceNotFound':
        return AddonIssueCode.k8sResourceNotFound;
      case 'AddonSubscriptionNeeded':
        return AddonIssueCode.addonSubscriptionNeeded;
      case 'AddonPermissionFailure':
        return AddonIssueCode.addonPermissionFailure;
    }
    throw Exception('$this is not known in enum AddonIssueCode');
  }
}

/// A type of Pod Identity Association owned by an Amazon EKS Add-on.
///
/// Each EKS Pod Identity Association maps a role to a service account in a
/// namespace in the cluster.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
/// an IAM Role to an Amazon EKS add-on using Pod Identity</a> in the EKS User
/// Guide.
class AddonPodIdentityAssociations {
  /// The ARN of an IAM Role.
  final String roleArn;

  /// The name of a Kubernetes Service Account.
  final String serviceAccount;

  AddonPodIdentityAssociations({
    required this.roleArn,
    required this.serviceAccount,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final serviceAccount = this.serviceAccount;
    return {
      'roleArn': roleArn,
      'serviceAccount': serviceAccount,
    };
  }
}

/// Information about how to configure IAM for an Addon.
class AddonPodIdentityConfiguration {
  /// A suggested IAM Policy for the addon.
  final List<String>? recommendedManagedPolicies;

  /// The Kubernetes Service Account name used by the addon.
  final String? serviceAccount;

  AddonPodIdentityConfiguration({
    this.recommendedManagedPolicies,
    this.serviceAccount,
  });

  factory AddonPodIdentityConfiguration.fromJson(Map<String, dynamic> json) {
    return AddonPodIdentityConfiguration(
      recommendedManagedPolicies: (json['recommendedManagedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serviceAccount: json['serviceAccount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendedManagedPolicies = this.recommendedManagedPolicies;
    final serviceAccount = this.serviceAccount;
    return {
      if (recommendedManagedPolicies != null)
        'recommendedManagedPolicies': recommendedManagedPolicies,
      if (serviceAccount != null) 'serviceAccount': serviceAccount,
    };
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
  updateFailed,
}

extension AddonStatusValueExtension on AddonStatus {
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
      case AddonStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension AddonStatusFromString on String {
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
      case 'UPDATE_FAILED':
        return AddonStatus.updateFailed;
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

  /// An object representing the compatibilities of a version.
  final List<Compatibility>? compatibilities;

  /// Whether the add-on requires configuration.
  final bool? requiresConfiguration;

  /// Indicates if the Addon requires IAM Permissions to operate, such as
  /// networking permissions.
  final bool? requiresIamPermissions;

  AddonVersionInfo({
    this.addonVersion,
    this.architecture,
    this.compatibilities,
    this.requiresConfiguration,
    this.requiresIamPermissions,
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
      requiresConfiguration: json['requiresConfiguration'] as bool?,
      requiresIamPermissions: json['requiresIamPermissions'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonVersion = this.addonVersion;
    final architecture = this.architecture;
    final compatibilities = this.compatibilities;
    final requiresConfiguration = this.requiresConfiguration;
    final requiresIamPermissions = this.requiresIamPermissions;
    return {
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (architecture != null) 'architecture': architecture,
      if (compatibilities != null) 'compatibilities': compatibilities,
      if (requiresConfiguration != null)
        'requiresConfiguration': requiresConfiguration,
      if (requiresIamPermissions != null)
        'requiresIamPermissions': requiresIamPermissions,
    };
  }
}

class AssociateAccessPolicyResponse {
  /// The <code>AccessPolicy</code> and scope associated to the
  /// <code>AccessEntry</code>.
  final AssociatedAccessPolicy? associatedAccessPolicy;

  /// The name of your cluster.
  final String? clusterName;

  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  final String? principalArn;

  AssociateAccessPolicyResponse({
    this.associatedAccessPolicy,
    this.clusterName,
    this.principalArn,
  });

  factory AssociateAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return AssociateAccessPolicyResponse(
      associatedAccessPolicy: json['associatedAccessPolicy'] != null
          ? AssociatedAccessPolicy.fromJson(
              json['associatedAccessPolicy'] as Map<String, dynamic>)
          : null,
      clusterName: json['clusterName'] as String?,
      principalArn: json['principalArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAccessPolicy = this.associatedAccessPolicy;
    final clusterName = this.clusterName;
    final principalArn = this.principalArn;
    return {
      if (associatedAccessPolicy != null)
        'associatedAccessPolicy': associatedAccessPolicy,
      if (clusterName != null) 'clusterName': clusterName,
      if (principalArn != null) 'principalArn': principalArn,
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

/// An access policy association.
class AssociatedAccessPolicy {
  /// The scope of the access policy.
  final AccessScope? accessScope;

  /// The date and time the <code>AccessPolicy</code> was associated with an
  /// <code>AccessEntry</code>.
  final DateTime? associatedAt;

  /// The Unix epoch timestamp for the last modification to the object.
  final DateTime? modifiedAt;

  /// The ARN of the <code>AccessPolicy</code>.
  final String? policyArn;

  AssociatedAccessPolicy({
    this.accessScope,
    this.associatedAt,
    this.modifiedAt,
    this.policyArn,
  });

  factory AssociatedAccessPolicy.fromJson(Map<String, dynamic> json) {
    return AssociatedAccessPolicy(
      accessScope: json['accessScope'] != null
          ? AccessScope.fromJson(json['accessScope'] as Map<String, dynamic>)
          : null,
      associatedAt: timeStampFromJson(json['associatedAt']),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      policyArn: json['policyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessScope = this.accessScope;
    final associatedAt = this.associatedAt;
    final modifiedAt = this.modifiedAt;
    final policyArn = this.policyArn;
    return {
      if (accessScope != null) 'accessScope': accessScope,
      if (associatedAt != null)
        'associatedAt': unixTimestampToJson(associatedAt),
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (policyArn != null) 'policyArn': policyArn,
    };
  }
}

enum AuthenticationMode {
  api,
  apiAndConfigMap,
  configMap,
}

extension AuthenticationModeValueExtension on AuthenticationMode {
  String toValue() {
    switch (this) {
      case AuthenticationMode.api:
        return 'API';
      case AuthenticationMode.apiAndConfigMap:
        return 'API_AND_CONFIG_MAP';
      case AuthenticationMode.configMap:
        return 'CONFIG_MAP';
    }
  }
}

extension AuthenticationModeFromString on String {
  AuthenticationMode toAuthenticationMode() {
    switch (this) {
      case 'API':
        return AuthenticationMode.api;
      case 'API_AND_CONFIG_MAP':
        return AuthenticationMode.apiAndConfigMap;
      case 'CONFIG_MAP':
        return AuthenticationMode.configMap;
    }
    throw Exception('$this is not known in enum AuthenticationMode');
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

extension CapacityTypesValueExtension on CapacityTypes {
  String toValue() {
    switch (this) {
      case CapacityTypes.onDemand:
        return 'ON_DEMAND';
      case CapacityTypes.spot:
        return 'SPOT';
    }
  }
}

extension CapacityTypesFromString on String {
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

enum Category {
  upgradeReadiness,
}

extension CategoryValueExtension on Category {
  String toValue() {
    switch (this) {
      case Category.upgradeReadiness:
        return 'UPGRADE_READINESS';
    }
  }
}

extension CategoryFromString on String {
  Category toCategory() {
    switch (this) {
      case 'UPGRADE_READINESS':
        return Category.upgradeReadiness;
    }
    throw Exception('$this is not known in enum Category');
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

/// Details about clients using the deprecated resources.
class ClientStat {
  /// The timestamp of the last request seen from the Kubernetes client.
  final DateTime? lastRequestTime;

  /// The number of requests from the Kubernetes client seen over the last 30
  /// days.
  final int? numberOfRequestsLast30Days;

  /// The user agent of the Kubernetes client using the deprecated resource.
  final String? userAgent;

  ClientStat({
    this.lastRequestTime,
    this.numberOfRequestsLast30Days,
    this.userAgent,
  });

  factory ClientStat.fromJson(Map<String, dynamic> json) {
    return ClientStat(
      lastRequestTime: timeStampFromJson(json['lastRequestTime']),
      numberOfRequestsLast30Days: json['numberOfRequestsLast30Days'] as int?,
      userAgent: json['userAgent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastRequestTime = this.lastRequestTime;
    final numberOfRequestsLast30Days = this.numberOfRequestsLast30Days;
    final userAgent = this.userAgent;
    return {
      if (lastRequestTime != null)
        'lastRequestTime': unixTimestampToJson(lastRequestTime),
      if (numberOfRequestsLast30Days != null)
        'numberOfRequestsLast30Days': numberOfRequestsLast30Days,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }
}

/// An object representing an Amazon EKS cluster.
class Cluster {
  /// The access configuration for the cluster.
  final AccessConfigResponse? accessConfig;

  /// The Amazon Resource Name (ARN) of the cluster.
  final String? arn;

  /// The <code>certificate-authority-data</code> for your cluster.
  final Certificate? certificateAuthority;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientRequestToken;

  /// The configuration used to connect to a cluster for registration.
  final ConnectorConfigResponse? connectorConfig;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// The encryption configuration for the cluster.
  final List<EncryptionConfig>? encryptionConfig;

  /// The endpoint for your Kubernetes API server.
  final String? endpoint;

  /// An object representing the health of your Amazon EKS cluster.
  final ClusterHealth? health;

  /// The ID of your local Amazon EKS cluster on an Amazon Web Services Outpost.
  /// This property isn't available for an Amazon EKS cluster on the Amazon Web
  /// Services cloud.
  final String? id;

  /// The identity provider information for the cluster.
  final Identity? identity;

  /// The Kubernetes network configuration for the cluster.
  final KubernetesNetworkConfigResponse? kubernetesNetworkConfig;

  /// The logging configuration for your cluster.
  final Logging? logging;

  /// The name of your cluster.
  final String? name;

  /// An object representing the configuration of your local Amazon EKS cluster on
  /// an Amazon Web Services Outpost. This object isn't available for clusters on
  /// the Amazon Web Services cloud.
  final OutpostConfigResponse? outpostConfig;

  /// The platform version of your Amazon EKS cluster. For more information about
  /// clusters deployed on the Amazon Web Services Cloud, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/platform-versions.html">Platform
  /// versions</a> in the <i> <i>Amazon EKS User Guide</i> </i>. For more
  /// information about local clusters deployed on an Outpost, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-platform-versions.html">Amazon
  /// EKS local cluster platform versions</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final String? platformVersion;

  /// The VPC configuration used by the cluster control plane. Amazon EKS VPC
  /// resources have specific requirements to work properly with Kubernetes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">Cluster
  /// VPC considerations</a> and <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html">Cluster
  /// security group considerations</a> in the <i>Amazon EKS User Guide</i>.
  final VpcConfigResponse? resourcesVpcConfig;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions for
  /// the Kubernetes control plane to make calls to Amazon Web Services API
  /// operations on your behalf.
  final String? roleArn;

  /// The current status of the cluster.
  final ClusterStatus? status;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  final Map<String, String>? tags;

  /// The Kubernetes server version for the cluster.
  final String? version;

  Cluster({
    this.accessConfig,
    this.arn,
    this.certificateAuthority,
    this.clientRequestToken,
    this.connectorConfig,
    this.createdAt,
    this.encryptionConfig,
    this.endpoint,
    this.health,
    this.id,
    this.identity,
    this.kubernetesNetworkConfig,
    this.logging,
    this.name,
    this.outpostConfig,
    this.platformVersion,
    this.resourcesVpcConfig,
    this.roleArn,
    this.status,
    this.tags,
    this.version,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      accessConfig: json['accessConfig'] != null
          ? AccessConfigResponse.fromJson(
              json['accessConfig'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      certificateAuthority: json['certificateAuthority'] != null
          ? Certificate.fromJson(
              json['certificateAuthority'] as Map<String, dynamic>)
          : null,
      clientRequestToken: json['clientRequestToken'] as String?,
      connectorConfig: json['connectorConfig'] != null
          ? ConnectorConfigResponse.fromJson(
              json['connectorConfig'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      encryptionConfig: (json['encryptionConfig'] as List?)
          ?.whereNotNull()
          .map((e) => EncryptionConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpoint: json['endpoint'] as String?,
      health: json['health'] != null
          ? ClusterHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
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
      outpostConfig: json['outpostConfig'] != null
          ? OutpostConfigResponse.fromJson(
              json['outpostConfig'] as Map<String, dynamic>)
          : null,
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
    final accessConfig = this.accessConfig;
    final arn = this.arn;
    final certificateAuthority = this.certificateAuthority;
    final clientRequestToken = this.clientRequestToken;
    final connectorConfig = this.connectorConfig;
    final createdAt = this.createdAt;
    final encryptionConfig = this.encryptionConfig;
    final endpoint = this.endpoint;
    final health = this.health;
    final id = this.id;
    final identity = this.identity;
    final kubernetesNetworkConfig = this.kubernetesNetworkConfig;
    final logging = this.logging;
    final name = this.name;
    final outpostConfig = this.outpostConfig;
    final platformVersion = this.platformVersion;
    final resourcesVpcConfig = this.resourcesVpcConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final tags = this.tags;
    final version = this.version;
    return {
      if (accessConfig != null) 'accessConfig': accessConfig,
      if (arn != null) 'arn': arn,
      if (certificateAuthority != null)
        'certificateAuthority': certificateAuthority,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (connectorConfig != null) 'connectorConfig': connectorConfig,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (endpoint != null) 'endpoint': endpoint,
      if (health != null) 'health': health,
      if (id != null) 'id': id,
      if (identity != null) 'identity': identity,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
      if (logging != null) 'logging': logging,
      if (name != null) 'name': name,
      if (outpostConfig != null) 'outpostConfig': outpostConfig,
      if (platformVersion != null) 'platformVersion': platformVersion,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

/// An object representing the health of your Amazon EKS cluster.
class ClusterHealth {
  /// An object representing the health issues of your Amazon EKS cluster.
  final List<ClusterIssue>? issues;

  ClusterHealth({
    this.issues,
  });

  factory ClusterHealth.fromJson(Map<String, dynamic> json) {
    return ClusterHealth(
      issues: (json['issues'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterIssue.fromJson(e as Map<String, dynamic>))
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

/// An issue with your Amazon EKS cluster.
class ClusterIssue {
  /// The error code of the issue.
  final ClusterIssueCode? code;

  /// A description of the issue.
  final String? message;

  /// The resource IDs that the issue relates to.
  final List<String>? resourceIds;

  ClusterIssue({
    this.code,
    this.message,
    this.resourceIds,
  });

  factory ClusterIssue.fromJson(Map<String, dynamic> json) {
    return ClusterIssue(
      code: (json['code'] as String?)?.toClusterIssueCode(),
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

enum ClusterIssueCode {
  accessDenied,
  clusterUnreachable,
  configurationConflict,
  internalFailure,
  resourceLimitExceeded,
  resourceNotFound,
  iamRoleNotFound,
  vpcNotFound,
  insufficientFreeAddresses,
  ec2ServiceNotSubscribed,
  ec2SubnetNotFound,
  ec2SecurityGroupNotFound,
  kmsGrantRevoked,
  kmsKeyNotFound,
  kmsKeyMarkedForDeletion,
  kmsKeyDisabled,
  stsRegionalEndpointDisabled,
  unsupportedVersion,
  other,
}

extension ClusterIssueCodeValueExtension on ClusterIssueCode {
  String toValue() {
    switch (this) {
      case ClusterIssueCode.accessDenied:
        return 'AccessDenied';
      case ClusterIssueCode.clusterUnreachable:
        return 'ClusterUnreachable';
      case ClusterIssueCode.configurationConflict:
        return 'ConfigurationConflict';
      case ClusterIssueCode.internalFailure:
        return 'InternalFailure';
      case ClusterIssueCode.resourceLimitExceeded:
        return 'ResourceLimitExceeded';
      case ClusterIssueCode.resourceNotFound:
        return 'ResourceNotFound';
      case ClusterIssueCode.iamRoleNotFound:
        return 'IamRoleNotFound';
      case ClusterIssueCode.vpcNotFound:
        return 'VpcNotFound';
      case ClusterIssueCode.insufficientFreeAddresses:
        return 'InsufficientFreeAddresses';
      case ClusterIssueCode.ec2ServiceNotSubscribed:
        return 'Ec2ServiceNotSubscribed';
      case ClusterIssueCode.ec2SubnetNotFound:
        return 'Ec2SubnetNotFound';
      case ClusterIssueCode.ec2SecurityGroupNotFound:
        return 'Ec2SecurityGroupNotFound';
      case ClusterIssueCode.kmsGrantRevoked:
        return 'KmsGrantRevoked';
      case ClusterIssueCode.kmsKeyNotFound:
        return 'KmsKeyNotFound';
      case ClusterIssueCode.kmsKeyMarkedForDeletion:
        return 'KmsKeyMarkedForDeletion';
      case ClusterIssueCode.kmsKeyDisabled:
        return 'KmsKeyDisabled';
      case ClusterIssueCode.stsRegionalEndpointDisabled:
        return 'StsRegionalEndpointDisabled';
      case ClusterIssueCode.unsupportedVersion:
        return 'UnsupportedVersion';
      case ClusterIssueCode.other:
        return 'Other';
    }
  }
}

extension ClusterIssueCodeFromString on String {
  ClusterIssueCode toClusterIssueCode() {
    switch (this) {
      case 'AccessDenied':
        return ClusterIssueCode.accessDenied;
      case 'ClusterUnreachable':
        return ClusterIssueCode.clusterUnreachable;
      case 'ConfigurationConflict':
        return ClusterIssueCode.configurationConflict;
      case 'InternalFailure':
        return ClusterIssueCode.internalFailure;
      case 'ResourceLimitExceeded':
        return ClusterIssueCode.resourceLimitExceeded;
      case 'ResourceNotFound':
        return ClusterIssueCode.resourceNotFound;
      case 'IamRoleNotFound':
        return ClusterIssueCode.iamRoleNotFound;
      case 'VpcNotFound':
        return ClusterIssueCode.vpcNotFound;
      case 'InsufficientFreeAddresses':
        return ClusterIssueCode.insufficientFreeAddresses;
      case 'Ec2ServiceNotSubscribed':
        return ClusterIssueCode.ec2ServiceNotSubscribed;
      case 'Ec2SubnetNotFound':
        return ClusterIssueCode.ec2SubnetNotFound;
      case 'Ec2SecurityGroupNotFound':
        return ClusterIssueCode.ec2SecurityGroupNotFound;
      case 'KmsGrantRevoked':
        return ClusterIssueCode.kmsGrantRevoked;
      case 'KmsKeyNotFound':
        return ClusterIssueCode.kmsKeyNotFound;
      case 'KmsKeyMarkedForDeletion':
        return ClusterIssueCode.kmsKeyMarkedForDeletion;
      case 'KmsKeyDisabled':
        return ClusterIssueCode.kmsKeyDisabled;
      case 'StsRegionalEndpointDisabled':
        return ClusterIssueCode.stsRegionalEndpointDisabled;
      case 'UnsupportedVersion':
        return ClusterIssueCode.unsupportedVersion;
      case 'Other':
        return ClusterIssueCode.other;
    }
    throw Exception('$this is not known in enum ClusterIssueCode');
  }
}

enum ClusterStatus {
  creating,
  active,
  deleting,
  failed,
  updating,
  pending,
}

extension ClusterStatusValueExtension on ClusterStatus {
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
      case ClusterStatus.pending:
        return 'PENDING';
    }
  }
}

extension ClusterStatusFromString on String {
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
      case 'PENDING':
        return ClusterStatus.pending;
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

enum ConnectorConfigProvider {
  eksAnywhere,
  anthos,
  gke,
  aks,
  openshift,
  tanzu,
  rancher,
  ec2,
  other,
}

extension ConnectorConfigProviderValueExtension on ConnectorConfigProvider {
  String toValue() {
    switch (this) {
      case ConnectorConfigProvider.eksAnywhere:
        return 'EKS_ANYWHERE';
      case ConnectorConfigProvider.anthos:
        return 'ANTHOS';
      case ConnectorConfigProvider.gke:
        return 'GKE';
      case ConnectorConfigProvider.aks:
        return 'AKS';
      case ConnectorConfigProvider.openshift:
        return 'OPENSHIFT';
      case ConnectorConfigProvider.tanzu:
        return 'TANZU';
      case ConnectorConfigProvider.rancher:
        return 'RANCHER';
      case ConnectorConfigProvider.ec2:
        return 'EC2';
      case ConnectorConfigProvider.other:
        return 'OTHER';
    }
  }
}

extension ConnectorConfigProviderFromString on String {
  ConnectorConfigProvider toConnectorConfigProvider() {
    switch (this) {
      case 'EKS_ANYWHERE':
        return ConnectorConfigProvider.eksAnywhere;
      case 'ANTHOS':
        return ConnectorConfigProvider.anthos;
      case 'GKE':
        return ConnectorConfigProvider.gke;
      case 'AKS':
        return ConnectorConfigProvider.aks;
      case 'OPENSHIFT':
        return ConnectorConfigProvider.openshift;
      case 'TANZU':
        return ConnectorConfigProvider.tanzu;
      case 'RANCHER':
        return ConnectorConfigProvider.rancher;
      case 'EC2':
        return ConnectorConfigProvider.ec2;
      case 'OTHER':
        return ConnectorConfigProvider.other;
    }
    throw Exception('$this is not known in enum ConnectorConfigProvider');
  }
}

/// The configuration sent to a cluster for configuration.
class ConnectorConfigRequest {
  /// The cloud provider for the target cluster to connect.
  final ConnectorConfigProvider provider;

  /// The Amazon Resource Name (ARN) of the role that is authorized to request the
  /// connector configuration.
  final String roleArn;

  ConnectorConfigRequest({
    required this.provider,
    required this.roleArn,
  });

  Map<String, dynamic> toJson() {
    final provider = this.provider;
    final roleArn = this.roleArn;
    return {
      'provider': provider.toValue(),
      'roleArn': roleArn,
    };
  }
}

/// The full description of your connected cluster.
class ConnectorConfigResponse {
  /// A unique code associated with the cluster for registration purposes.
  final String? activationCode;

  /// The expiration time of the connected cluster. The cluster's YAML file must
  /// be applied through the native provider.
  final DateTime? activationExpiry;

  /// A unique ID associated with the cluster for registration purposes.
  final String? activationId;

  /// The cluster's cloud service provider.
  final String? provider;

  /// The Amazon Resource Name (ARN) of the role to communicate with services from
  /// the connected Kubernetes cluster.
  final String? roleArn;

  ConnectorConfigResponse({
    this.activationCode,
    this.activationExpiry,
    this.activationId,
    this.provider,
    this.roleArn,
  });

  factory ConnectorConfigResponse.fromJson(Map<String, dynamic> json) {
    return ConnectorConfigResponse(
      activationCode: json['activationCode'] as String?,
      activationExpiry: timeStampFromJson(json['activationExpiry']),
      activationId: json['activationId'] as String?,
      provider: json['provider'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activationCode = this.activationCode;
    final activationExpiry = this.activationExpiry;
    final activationId = this.activationId;
    final provider = this.provider;
    final roleArn = this.roleArn;
    return {
      if (activationCode != null) 'activationCode': activationCode,
      if (activationExpiry != null)
        'activationExpiry': unixTimestampToJson(activationExpiry),
      if (activationId != null) 'activationId': activationId,
      if (provider != null) 'provider': provider,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// The placement configuration for all the control plane instances of your
/// local Amazon EKS cluster on an Amazon Web Services Outpost. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
/// considerations</a> in the Amazon EKS User Guide.
class ControlPlanePlacementRequest {
  /// The name of the placement group for the Kubernetes control plane instances.
  /// This setting can't be changed after cluster creation.
  final String? groupName;

  ControlPlanePlacementRequest({
    this.groupName,
  });

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    return {
      if (groupName != null) 'groupName': groupName,
    };
  }
}

/// The placement configuration for all the control plane instances of your
/// local Amazon EKS cluster on an Amazon Web Services Outpost. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
/// considerations</a> in the <i>Amazon EKS User Guide</i>.
class ControlPlanePlacementResponse {
  /// The name of the placement group for the Kubernetes control plane instances.
  final String? groupName;

  ControlPlanePlacementResponse({
    this.groupName,
  });

  factory ControlPlanePlacementResponse.fromJson(Map<String, dynamic> json) {
    return ControlPlanePlacementResponse(
      groupName: json['groupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    return {
      if (groupName != null) 'groupName': groupName,
    };
  }
}

/// The access configuration information for the cluster.
class CreateAccessConfigRequest {
  /// The desired authentication mode for the cluster. If you create a cluster by
  /// using the EKS API, Amazon Web Services SDKs, or CloudFormation, the default
  /// is <code>CONFIG_MAP</code>. If you create the cluster by using the Amazon
  /// Web Services Management Console, the default value is
  /// <code>API_AND_CONFIG_MAP</code>.
  final AuthenticationMode? authenticationMode;

  /// Specifies whether or not the cluster creator IAM principal was set as a
  /// cluster admin access entry during cluster creation time. The default value
  /// is <code>true</code>.
  final bool? bootstrapClusterCreatorAdminPermissions;

  CreateAccessConfigRequest({
    this.authenticationMode,
    this.bootstrapClusterCreatorAdminPermissions,
  });

  Map<String, dynamic> toJson() {
    final authenticationMode = this.authenticationMode;
    final bootstrapClusterCreatorAdminPermissions =
        this.bootstrapClusterCreatorAdminPermissions;
    return {
      if (authenticationMode != null)
        'authenticationMode': authenticationMode.toValue(),
      if (bootstrapClusterCreatorAdminPermissions != null)
        'bootstrapClusterCreatorAdminPermissions':
            bootstrapClusterCreatorAdminPermissions,
    };
  }
}

class CreateAccessEntryResponse {
  final AccessEntry? accessEntry;

  CreateAccessEntryResponse({
    this.accessEntry,
  });

  factory CreateAccessEntryResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessEntryResponse(
      accessEntry: json['accessEntry'] != null
          ? AccessEntry.fromJson(json['accessEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessEntry = this.accessEntry;
    return {
      if (accessEntry != null) 'accessEntry': accessEntry,
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

class CreateEksAnywhereSubscriptionResponse {
  /// The full description of the subscription.
  final EksAnywhereSubscription? subscription;

  CreateEksAnywhereSubscriptionResponse({
    this.subscription,
  });

  factory CreateEksAnywhereSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateEksAnywhereSubscriptionResponse(
      subscription: json['subscription'] != null
          ? EksAnywhereSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
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

class CreatePodIdentityAssociationResponse {
  /// The full description of your new association.
  ///
  /// The description includes an ID for the association. Use the ID of the
  /// association in further actions to manage the association.
  final PodIdentityAssociation? association;

  CreatePodIdentityAssociationResponse({
    this.association,
  });

  factory CreatePodIdentityAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePodIdentityAssociationResponse(
      association: json['association'] != null
          ? PodIdentityAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'association': association,
    };
  }
}

class DeleteAccessEntryResponse {
  DeleteAccessEntryResponse();

  factory DeleteAccessEntryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessEntryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class DeleteEksAnywhereSubscriptionResponse {
  /// The full description of the subscription to be deleted.
  final EksAnywhereSubscription? subscription;

  DeleteEksAnywhereSubscriptionResponse({
    this.subscription,
  });

  factory DeleteEksAnywhereSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteEksAnywhereSubscriptionResponse(
      subscription: json['subscription'] != null
          ? EksAnywhereSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
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

class DeletePodIdentityAssociationResponse {
  /// The full description of the EKS Pod Identity association that was deleted.
  final PodIdentityAssociation? association;

  DeletePodIdentityAssociationResponse({
    this.association,
  });

  factory DeletePodIdentityAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeletePodIdentityAssociationResponse(
      association: json['association'] != null
          ? PodIdentityAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'association': association,
    };
  }
}

/// The summary information about deprecated resource usage for an insight check
/// in the <code>UPGRADE_READINESS</code> category.
class DeprecationDetail {
  /// Details about Kubernetes clients using the deprecated resources.
  final List<ClientStat>? clientStats;

  /// The newer version of the resource to migrate to if applicable.
  final String? replacedWith;

  /// The version of the software where the newer resource version became
  /// available to migrate to if applicable.
  final String? startServingReplacementVersion;

  /// The version of the software where the deprecated resource version will stop
  /// being served.
  final String? stopServingVersion;

  /// The deprecated version of the resource.
  final String? usage;

  DeprecationDetail({
    this.clientStats,
    this.replacedWith,
    this.startServingReplacementVersion,
    this.stopServingVersion,
    this.usage,
  });

  factory DeprecationDetail.fromJson(Map<String, dynamic> json) {
    return DeprecationDetail(
      clientStats: (json['clientStats'] as List?)
          ?.whereNotNull()
          .map((e) => ClientStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      replacedWith: json['replacedWith'] as String?,
      startServingReplacementVersion:
          json['startServingReplacementVersion'] as String?,
      stopServingVersion: json['stopServingVersion'] as String?,
      usage: json['usage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientStats = this.clientStats;
    final replacedWith = this.replacedWith;
    final startServingReplacementVersion = this.startServingReplacementVersion;
    final stopServingVersion = this.stopServingVersion;
    final usage = this.usage;
    return {
      if (clientStats != null) 'clientStats': clientStats,
      if (replacedWith != null) 'replacedWith': replacedWith,
      if (startServingReplacementVersion != null)
        'startServingReplacementVersion': startServingReplacementVersion,
      if (stopServingVersion != null) 'stopServingVersion': stopServingVersion,
      if (usage != null) 'usage': usage,
    };
  }
}

class DeregisterClusterResponse {
  final Cluster? cluster;

  DeregisterClusterResponse({
    this.cluster,
  });

  factory DeregisterClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterClusterResponse(
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

class DescribeAccessEntryResponse {
  /// Information about the access entry.
  final AccessEntry? accessEntry;

  DescribeAccessEntryResponse({
    this.accessEntry,
  });

  factory DescribeAccessEntryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccessEntryResponse(
      accessEntry: json['accessEntry'] != null
          ? AccessEntry.fromJson(json['accessEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessEntry = this.accessEntry;
    return {
      if (accessEntry != null) 'accessEntry': accessEntry,
    };
  }
}

class DescribeAddonConfigurationResponse {
  /// The name of the add-on.
  final String? addonName;

  /// The version of the add-on. The version must match one of the versions
  /// returned by <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeAddonVersions.html">
  /// <code>DescribeAddonVersions</code> </a>.
  final String? addonVersion;

  /// A JSON schema that's used to validate the configuration values you provide
  /// when an add-on is created or updated.
  final String? configurationSchema;

  /// The Kubernetes service account name used by the addon, and any suggested IAM
  /// policies. Use this information to create an IAM Role for the Addon.
  final List<AddonPodIdentityConfiguration>? podIdentityConfiguration;

  DescribeAddonConfigurationResponse({
    this.addonName,
    this.addonVersion,
    this.configurationSchema,
    this.podIdentityConfiguration,
  });

  factory DescribeAddonConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAddonConfigurationResponse(
      addonName: json['addonName'] as String?,
      addonVersion: json['addonVersion'] as String?,
      configurationSchema: json['configurationSchema'] as String?,
      podIdentityConfiguration: (json['podIdentityConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AddonPodIdentityConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonVersion = this.addonVersion;
    final configurationSchema = this.configurationSchema;
    final podIdentityConfiguration = this.podIdentityConfiguration;
    return {
      if (addonName != null) 'addonName': addonName,
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (configurationSchema != null)
        'configurationSchema': configurationSchema,
      if (podIdentityConfiguration != null)
        'podIdentityConfiguration': podIdentityConfiguration,
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
  /// The list of available versions with Kubernetes version compatibility and
  /// other properties.
  final List<AddonInfo>? addons;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeAddonVersions</code> request. When the results of a
  /// <code>DescribeAddonVersions</code> request exceed <code>maxResults</code>,
  /// you can use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
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

class DescribeEksAnywhereSubscriptionResponse {
  /// The full description of the subscription.
  final EksAnywhereSubscription? subscription;

  DescribeEksAnywhereSubscriptionResponse({
    this.subscription,
  });

  factory DescribeEksAnywhereSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEksAnywhereSubscriptionResponse(
      subscription: json['subscription'] != null
          ? EksAnywhereSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
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

class DescribeInsightResponse {
  /// The full description of the insight.
  final Insight? insight;

  DescribeInsightResponse({
    this.insight,
  });

  factory DescribeInsightResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInsightResponse(
      insight: json['insight'] != null
          ? Insight.fromJson(json['insight'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final insight = this.insight;
    return {
      if (insight != null) 'insight': insight,
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

class DescribePodIdentityAssociationResponse {
  /// The full description of the EKS Pod Identity association.
  final PodIdentityAssociation? association;

  DescribePodIdentityAssociationResponse({
    this.association,
  });

  factory DescribePodIdentityAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePodIdentityAssociationResponse(
      association: json['association'] != null
          ? PodIdentityAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'association': association,
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

class DisassociateAccessPolicyResponse {
  DisassociateAccessPolicyResponse();

  factory DisassociateAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateAccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// An EKS Anywhere subscription authorizing the customer to support for
/// licensed clusters and access to EKS Anywhere Curated Packages.
class EksAnywhereSubscription {
  /// The Amazon Resource Name (ARN) for the subscription.
  final String? arn;

  /// A boolean indicating whether or not a subscription will auto renew when it
  /// expires.
  final bool? autoRenew;

  /// The Unix timestamp in seconds for when the subscription was created.
  final DateTime? createdAt;

  /// The Unix timestamp in seconds for when the subscription is effective.
  final DateTime? effectiveDate;

  /// The Unix timestamp in seconds for when the subscription will expire or auto
  /// renew, depending on the auto renew configuration of the subscription object.
  final DateTime? expirationDate;

  /// UUID identifying a subscription.
  final String? id;

  /// Amazon Web Services License Manager ARN associated with the subscription.
  final List<String>? licenseArns;

  /// The number of licenses included in a subscription. Valid values are between
  /// 1 and 100.
  final int? licenseQuantity;

  /// The type of licenses included in the subscription. Valid value is CLUSTER.
  /// With the CLUSTER license type, each license covers support for a single EKS
  /// Anywhere cluster.
  final EksAnywhereSubscriptionLicenseType? licenseType;

  /// The status of a subscription.
  final String? status;

  /// The metadata for a subscription to assist with categorization and
  /// organization. Each tag consists of a key and an optional value. Subscription
  /// tags do not propagate to any other resources associated with the
  /// subscription.
  final Map<String, String>? tags;

  /// An EksAnywhereSubscriptionTerm object.
  final EksAnywhereSubscriptionTerm? term;

  EksAnywhereSubscription({
    this.arn,
    this.autoRenew,
    this.createdAt,
    this.effectiveDate,
    this.expirationDate,
    this.id,
    this.licenseArns,
    this.licenseQuantity,
    this.licenseType,
    this.status,
    this.tags,
    this.term,
  });

  factory EksAnywhereSubscription.fromJson(Map<String, dynamic> json) {
    return EksAnywhereSubscription(
      arn: json['arn'] as String?,
      autoRenew: json['autoRenew'] as bool?,
      createdAt: timeStampFromJson(json['createdAt']),
      effectiveDate: timeStampFromJson(json['effectiveDate']),
      expirationDate: timeStampFromJson(json['expirationDate']),
      id: json['id'] as String?,
      licenseArns: (json['licenseArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      licenseQuantity: json['licenseQuantity'] as int?,
      licenseType: (json['licenseType'] as String?)
          ?.toEksAnywhereSubscriptionLicenseType(),
      status: json['status'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      term: json['term'] != null
          ? EksAnywhereSubscriptionTerm.fromJson(
              json['term'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoRenew = this.autoRenew;
    final createdAt = this.createdAt;
    final effectiveDate = this.effectiveDate;
    final expirationDate = this.expirationDate;
    final id = this.id;
    final licenseArns = this.licenseArns;
    final licenseQuantity = this.licenseQuantity;
    final licenseType = this.licenseType;
    final status = this.status;
    final tags = this.tags;
    final term = this.term;
    return {
      if (arn != null) 'arn': arn,
      if (autoRenew != null) 'autoRenew': autoRenew,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (effectiveDate != null)
        'effectiveDate': unixTimestampToJson(effectiveDate),
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (id != null) 'id': id,
      if (licenseArns != null) 'licenseArns': licenseArns,
      if (licenseQuantity != null) 'licenseQuantity': licenseQuantity,
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (term != null) 'term': term,
    };
  }
}

enum EksAnywhereSubscriptionLicenseType {
  cluster,
}

extension EksAnywhereSubscriptionLicenseTypeValueExtension
    on EksAnywhereSubscriptionLicenseType {
  String toValue() {
    switch (this) {
      case EksAnywhereSubscriptionLicenseType.cluster:
        return 'Cluster';
    }
  }
}

extension EksAnywhereSubscriptionLicenseTypeFromString on String {
  EksAnywhereSubscriptionLicenseType toEksAnywhereSubscriptionLicenseType() {
    switch (this) {
      case 'Cluster':
        return EksAnywhereSubscriptionLicenseType.cluster;
    }
    throw Exception(
        '$this is not known in enum EksAnywhereSubscriptionLicenseType');
  }
}

enum EksAnywhereSubscriptionStatus {
  creating,
  active,
  updating,
  expiring,
  expired,
  deleting,
}

extension EksAnywhereSubscriptionStatusValueExtension
    on EksAnywhereSubscriptionStatus {
  String toValue() {
    switch (this) {
      case EksAnywhereSubscriptionStatus.creating:
        return 'CREATING';
      case EksAnywhereSubscriptionStatus.active:
        return 'ACTIVE';
      case EksAnywhereSubscriptionStatus.updating:
        return 'UPDATING';
      case EksAnywhereSubscriptionStatus.expiring:
        return 'EXPIRING';
      case EksAnywhereSubscriptionStatus.expired:
        return 'EXPIRED';
      case EksAnywhereSubscriptionStatus.deleting:
        return 'DELETING';
    }
  }
}

extension EksAnywhereSubscriptionStatusFromString on String {
  EksAnywhereSubscriptionStatus toEksAnywhereSubscriptionStatus() {
    switch (this) {
      case 'CREATING':
        return EksAnywhereSubscriptionStatus.creating;
      case 'ACTIVE':
        return EksAnywhereSubscriptionStatus.active;
      case 'UPDATING':
        return EksAnywhereSubscriptionStatus.updating;
      case 'EXPIRING':
        return EksAnywhereSubscriptionStatus.expiring;
      case 'EXPIRED':
        return EksAnywhereSubscriptionStatus.expired;
      case 'DELETING':
        return EksAnywhereSubscriptionStatus.deleting;
    }
    throw Exception('$this is not known in enum EksAnywhereSubscriptionStatus');
  }
}

/// An object representing the term duration and term unit type of your
/// subscription. This determines the term length of your subscription. Valid
/// values are MONTHS for term unit and 12 or 36 for term duration, indicating a
/// 12 month or 36 month subscription.
class EksAnywhereSubscriptionTerm {
  /// The duration of the subscription term. Valid values are 12 and 36,
  /// indicating a 12 month or 36 month subscription.
  final int? duration;

  /// The term unit of the subscription. Valid value is <code>MONTHS</code>.
  final EksAnywhereSubscriptionTermUnit? unit;

  EksAnywhereSubscriptionTerm({
    this.duration,
    this.unit,
  });

  factory EksAnywhereSubscriptionTerm.fromJson(Map<String, dynamic> json) {
    return EksAnywhereSubscriptionTerm(
      duration: json['duration'] as int?,
      unit: (json['unit'] as String?)?.toEksAnywhereSubscriptionTermUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final unit = this.unit;
    return {
      if (duration != null) 'duration': duration,
      if (unit != null) 'unit': unit.toValue(),
    };
  }
}

enum EksAnywhereSubscriptionTermUnit {
  months,
}

extension EksAnywhereSubscriptionTermUnitValueExtension
    on EksAnywhereSubscriptionTermUnit {
  String toValue() {
    switch (this) {
      case EksAnywhereSubscriptionTermUnit.months:
        return 'MONTHS';
    }
  }
}

extension EksAnywhereSubscriptionTermUnitFromString on String {
  EksAnywhereSubscriptionTermUnit toEksAnywhereSubscriptionTermUnit() {
    switch (this) {
      case 'MONTHS':
        return EksAnywhereSubscriptionTermUnit.months;
    }
    throw Exception(
        '$this is not known in enum EksAnywhereSubscriptionTermUnit');
  }
}

/// The encryption configuration for the cluster.
class EncryptionConfig {
  /// Key Management Service (KMS) key. Either the ARN or the alias can be used.
  final Provider? provider;

  /// Specifies the resources to be encrypted. The only supported value is
  /// <code>secrets</code>.
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
  k8sResourceNotFound,
}

extension ErrorCodeValueExtension on ErrorCode {
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
      case ErrorCode.k8sResourceNotFound:
        return 'K8sResourceNotFound';
    }
  }
}

extension ErrorCodeFromString on String {
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
      case 'K8sResourceNotFound':
        return ErrorCode.k8sResourceNotFound;
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
  /// available IP addresses.
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

/// An object representing an Fargate profile.
class FargateProfile {
  /// The name of your cluster.
  final String? clusterName;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// The full Amazon Resource Name (ARN) of the Fargate profile.
  final String? fargateProfileArn;

  /// The name of the Fargate profile.
  final String? fargateProfileName;

  /// The Amazon Resource Name (ARN) of the <code>Pod</code> execution role to use
  /// for any <code>Pod</code> that matches the selectors in the Fargate profile.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">
  /// <code>Pod</code> execution role</a> in the <i>Amazon EKS User Guide</i>.
  final String? podExecutionRoleArn;

  /// The selectors to match for a <code>Pod</code> to use this Fargate profile.
  final List<FargateProfileSelector>? selectors;

  /// The current status of the Fargate profile.
  final FargateProfileStatus? status;

  /// The IDs of subnets to launch a <code>Pod</code> into.
  final List<String>? subnets;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
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

/// An object representing an Fargate profile selector.
class FargateProfileSelector {
  /// The Kubernetes labels that the selector should match. A pod must contain all
  /// of the labels that are specified in the selector for it to be considered a
  /// match.
  final Map<String, String>? labels;

  /// The Kubernetes <code>namespace</code> that the selector should match.
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

extension FargateProfileStatusValueExtension on FargateProfileStatus {
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

extension FargateProfileStatusFromString on String {
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

  /// The type of the identity provider configuration. The only type available is
  /// <code>oidc</code>.
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

/// The full description of your identity configuration.
class IdentityProviderConfigResponse {
  /// An object representing an OpenID Connect (OIDC) identity provider
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

/// A check that provides recommendations to remedy potential upgrade-impacting
/// issues.
class Insight {
  /// Links to sources that provide additional context on the insight.
  final Map<String, String>? additionalInfo;

  /// The category of the insight.
  final Category? category;

  /// Summary information that relates to the category of the insight. Currently
  /// only returned with certain insights having category
  /// <code>UPGRADE_READINESS</code>.
  final InsightCategorySpecificSummary? categorySpecificSummary;

  /// The description of the insight which includes alert criteria, remediation
  /// recommendation, and additional resources (contains Markdown).
  final String? description;

  /// The ID of the insight.
  final String? id;

  /// An object containing more detail on the status of the insight resource.
  final InsightStatus? insightStatus;

  /// The Kubernetes minor version associated with an insight if applicable.
  final String? kubernetesVersion;

  /// The time Amazon EKS last successfully completed a refresh of this insight
  /// check on the cluster.
  final DateTime? lastRefreshTime;

  /// The time the status of the insight last changed.
  final DateTime? lastTransitionTime;

  /// The name of the insight.
  final String? name;

  /// A summary of how to remediate the finding of this insight if applicable.
  final String? recommendation;

  /// The details about each resource listed in the insight check result.
  final List<InsightResourceDetail>? resources;

  Insight({
    this.additionalInfo,
    this.category,
    this.categorySpecificSummary,
    this.description,
    this.id,
    this.insightStatus,
    this.kubernetesVersion,
    this.lastRefreshTime,
    this.lastTransitionTime,
    this.name,
    this.recommendation,
    this.resources,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      category: (json['category'] as String?)?.toCategory(),
      categorySpecificSummary: json['categorySpecificSummary'] != null
          ? InsightCategorySpecificSummary.fromJson(
              json['categorySpecificSummary'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      id: json['id'] as String?,
      insightStatus: json['insightStatus'] != null
          ? InsightStatus.fromJson(
              json['insightStatus'] as Map<String, dynamic>)
          : null,
      kubernetesVersion: json['kubernetesVersion'] as String?,
      lastRefreshTime: timeStampFromJson(json['lastRefreshTime']),
      lastTransitionTime: timeStampFromJson(json['lastTransitionTime']),
      name: json['name'] as String?,
      recommendation: json['recommendation'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => InsightResourceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalInfo = this.additionalInfo;
    final category = this.category;
    final categorySpecificSummary = this.categorySpecificSummary;
    final description = this.description;
    final id = this.id;
    final insightStatus = this.insightStatus;
    final kubernetesVersion = this.kubernetesVersion;
    final lastRefreshTime = this.lastRefreshTime;
    final lastTransitionTime = this.lastTransitionTime;
    final name = this.name;
    final recommendation = this.recommendation;
    final resources = this.resources;
    return {
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (category != null) 'category': category.toValue(),
      if (categorySpecificSummary != null)
        'categorySpecificSummary': categorySpecificSummary,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (insightStatus != null) 'insightStatus': insightStatus,
      if (kubernetesVersion != null) 'kubernetesVersion': kubernetesVersion,
      if (lastRefreshTime != null)
        'lastRefreshTime': unixTimestampToJson(lastRefreshTime),
      if (lastTransitionTime != null)
        'lastTransitionTime': unixTimestampToJson(lastTransitionTime),
      if (name != null) 'name': name,
      if (recommendation != null) 'recommendation': recommendation,
      if (resources != null) 'resources': resources,
    };
  }
}

/// Summary information that relates to the category of the insight. Currently
/// only returned with certain insights having category
/// <code>UPGRADE_READINESS</code>.
class InsightCategorySpecificSummary {
  /// The summary information about deprecated resource usage for an insight check
  /// in the <code>UPGRADE_READINESS</code> category.
  final List<DeprecationDetail>? deprecationDetails;

  InsightCategorySpecificSummary({
    this.deprecationDetails,
  });

  factory InsightCategorySpecificSummary.fromJson(Map<String, dynamic> json) {
    return InsightCategorySpecificSummary(
      deprecationDetails: (json['deprecationDetails'] as List?)
          ?.whereNotNull()
          .map((e) => DeprecationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deprecationDetails = this.deprecationDetails;
    return {
      if (deprecationDetails != null) 'deprecationDetails': deprecationDetails,
    };
  }
}

/// Returns information about the resource being evaluated.
class InsightResourceDetail {
  /// The Amazon Resource Name (ARN) if applicable.
  final String? arn;

  /// An object containing more detail on the status of the insight resource.
  final InsightStatus? insightStatus;

  /// The Kubernetes resource URI if applicable.
  final String? kubernetesResourceUri;

  InsightResourceDetail({
    this.arn,
    this.insightStatus,
    this.kubernetesResourceUri,
  });

  factory InsightResourceDetail.fromJson(Map<String, dynamic> json) {
    return InsightResourceDetail(
      arn: json['arn'] as String?,
      insightStatus: json['insightStatus'] != null
          ? InsightStatus.fromJson(
              json['insightStatus'] as Map<String, dynamic>)
          : null,
      kubernetesResourceUri: json['kubernetesResourceUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final insightStatus = this.insightStatus;
    final kubernetesResourceUri = this.kubernetesResourceUri;
    return {
      if (arn != null) 'arn': arn,
      if (insightStatus != null) 'insightStatus': insightStatus,
      if (kubernetesResourceUri != null)
        'kubernetesResourceUri': kubernetesResourceUri,
    };
  }
}

/// The status of the insight.
class InsightStatus {
  /// Explanation on the reasoning for the status of the resource.
  final String? reason;

  /// The status of the resource.
  final InsightStatusValue? status;

  InsightStatus({
    this.reason,
    this.status,
  });

  factory InsightStatus.fromJson(Map<String, dynamic> json) {
    return InsightStatus(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toInsightStatusValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum InsightStatusValue {
  passing,
  warning,
  error,
  unknown,
}

extension InsightStatusValueValueExtension on InsightStatusValue {
  String toValue() {
    switch (this) {
      case InsightStatusValue.passing:
        return 'PASSING';
      case InsightStatusValue.warning:
        return 'WARNING';
      case InsightStatusValue.error:
        return 'ERROR';
      case InsightStatusValue.unknown:
        return 'UNKNOWN';
    }
  }
}

extension InsightStatusValueFromString on String {
  InsightStatusValue toInsightStatusValue() {
    switch (this) {
      case 'PASSING':
        return InsightStatusValue.passing;
      case 'WARNING':
        return InsightStatusValue.warning;
      case 'ERROR':
        return InsightStatusValue.error;
      case 'UNKNOWN':
        return InsightStatusValue.unknown;
    }
    throw Exception('$this is not known in enum InsightStatusValue');
  }
}

/// The summarized description of the insight.
class InsightSummary {
  /// The category of the insight.
  final Category? category;

  /// The description of the insight which includes alert criteria, remediation
  /// recommendation, and additional resources (contains Markdown).
  final String? description;

  /// The ID of the insight.
  final String? id;

  /// An object containing more detail on the status of the insight.
  final InsightStatus? insightStatus;

  /// The Kubernetes minor version associated with an insight if applicable.
  final String? kubernetesVersion;

  /// The time Amazon EKS last successfully completed a refresh of this insight
  /// check on the cluster.
  final DateTime? lastRefreshTime;

  /// The time the status of the insight last changed.
  final DateTime? lastTransitionTime;

  /// The name of the insight.
  final String? name;

  InsightSummary({
    this.category,
    this.description,
    this.id,
    this.insightStatus,
    this.kubernetesVersion,
    this.lastRefreshTime,
    this.lastTransitionTime,
    this.name,
  });

  factory InsightSummary.fromJson(Map<String, dynamic> json) {
    return InsightSummary(
      category: (json['category'] as String?)?.toCategory(),
      description: json['description'] as String?,
      id: json['id'] as String?,
      insightStatus: json['insightStatus'] != null
          ? InsightStatus.fromJson(
              json['insightStatus'] as Map<String, dynamic>)
          : null,
      kubernetesVersion: json['kubernetesVersion'] as String?,
      lastRefreshTime: timeStampFromJson(json['lastRefreshTime']),
      lastTransitionTime: timeStampFromJson(json['lastTransitionTime']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final description = this.description;
    final id = this.id;
    final insightStatus = this.insightStatus;
    final kubernetesVersion = this.kubernetesVersion;
    final lastRefreshTime = this.lastRefreshTime;
    final lastTransitionTime = this.lastTransitionTime;
    final name = this.name;
    return {
      if (category != null) 'category': category.toValue(),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (insightStatus != null) 'insightStatus': insightStatus,
      if (kubernetesVersion != null) 'kubernetesVersion': kubernetesVersion,
      if (lastRefreshTime != null)
        'lastRefreshTime': unixTimestampToJson(lastRefreshTime),
      if (lastTransitionTime != null)
        'lastTransitionTime': unixTimestampToJson(lastTransitionTime),
      if (name != null) 'name': name,
    };
  }
}

/// The criteria to use for the insights.
class InsightsFilter {
  /// The categories to use to filter insights.
  final List<Category>? categories;

  /// The Kubernetes versions to use to filter the insights.
  final List<String>? kubernetesVersions;

  /// The statuses to use to filter the insights.
  final List<InsightStatusValue>? statuses;

  InsightsFilter({
    this.categories,
    this.kubernetesVersions,
    this.statuses,
  });

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final kubernetesVersions = this.kubernetesVersions;
    final statuses = this.statuses;
    return {
      if (categories != null)
        'categories': categories.map((e) => e.toValue()).toList(),
      if (kubernetesVersions != null) 'kubernetesVersions': kubernetesVersions,
      if (statuses != null)
        'statuses': statuses.map((e) => e.toValue()).toList(),
    };
  }
}

enum IpFamily {
  ipv4,
  ipv6,
}

extension IpFamilyValueExtension on IpFamily {
  String toValue() {
    switch (this) {
      case IpFamily.ipv4:
        return 'ipv4';
      case IpFamily.ipv6:
        return 'ipv6';
    }
  }
}

extension IpFamilyFromString on String {
  IpFamily toIpFamily() {
    switch (this) {
      case 'ipv4':
        return IpFamily.ipv4;
      case 'ipv6':
        return IpFamily.ipv6;
    }
    throw Exception('$this is not known in enum IpFamily');
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
  /// the public <code>IPv4</code> addressing attribute for your subnet</a> in the
  /// <i>Amazon VPC User Guide</i>.
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
  /// <b>InstanceLimitExceeded</b>: Your Amazon Web Services account is unable to
  /// launch any more instances of the specified instance type. You may be able to
  /// request an Amazon EC2 instance limit increase to recover.
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html">node
  /// IAM role</a> permissions or lack of outbound internet access for the nodes.
  /// </li>
  /// </ul>
  final NodegroupIssueCode? code;

  /// The error message associated with the issue.
  final String? message;

  /// The Amazon Web Services resources that are afflicted by this issue.
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
  /// Specify which IP family is used to assign Kubernetes pod and service IP
  /// addresses. If you don't specify a value, <code>ipv4</code> is used by
  /// default. You can only specify an IP family when you create a cluster and
  /// can't change this value once the cluster is created. If you specify
  /// <code>ipv6</code>, the VPC and subnets that you specify for cluster creation
  /// must have both <code>IPv4</code> and <code>IPv6</code> CIDR blocks assigned
  /// to them. You can't specify <code>ipv6</code> for clusters in China Regions.
  ///
  /// You can only specify <code>ipv6</code> for <code>1.21</code> and later
  /// clusters that use version <code>1.10.1</code> or later of the Amazon VPC CNI
  /// add-on. If you specify <code>ipv6</code>, then ensure that your VPC meets
  /// the requirements listed in the considerations listed in <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cni-ipv6.html">Assigning
  /// IPv6 addresses to pods and services</a> in the Amazon EKS User Guide.
  /// Kubernetes assigns services <code>IPv6</code> addresses from the unique
  /// local address range <code>(fc00::/7)</code>. You can't specify a custom
  /// <code>IPv6</code> CIDR block. Pod addresses are assigned from the subnet's
  /// <code>IPv6</code> CIDR.
  final IpFamily? ipFamily;

  /// Don't specify a value if you select <code>ipv6</code> for <b>ipFamily</b>.
  /// The CIDR block to assign Kubernetes service IP addresses from. If you don't
  /// specify a block, Kubernetes assigns addresses from either the
  /// <code>10.100.0.0/16</code> or <code>172.20.0.0/16</code> CIDR blocks. We
  /// recommend that you specify a block that does not overlap with resources in
  /// other networks that are peered or connected to your VPC. The block must meet
  /// the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Within one of the following private IP address blocks:
  /// <code>10.0.0.0/8</code>, <code>172.16.0.0/12</code>, or
  /// <code>192.168.0.0/16</code>.
  /// </li>
  /// <li>
  /// Doesn't overlap with any CIDR block assigned to the VPC that you selected
  /// for VPC.
  /// </li>
  /// <li>
  /// Between <code>/24</code> and <code>/12</code>.
  /// </li>
  /// </ul> <important>
  /// You can only specify a custom CIDR block when you create a cluster. You
  /// can't change this value after the cluster is created.
  /// </important>
  final String? serviceIpv4Cidr;

  KubernetesNetworkConfigRequest({
    this.ipFamily,
    this.serviceIpv4Cidr,
  });

  Map<String, dynamic> toJson() {
    final ipFamily = this.ipFamily;
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    return {
      if (ipFamily != null) 'ipFamily': ipFamily.toValue(),
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
    };
  }
}

/// The Kubernetes network configuration for the cluster. The response contains
/// a value for <b>serviceIpv6Cidr</b> or <b>serviceIpv4Cidr</b>, but not both.
class KubernetesNetworkConfigResponse {
  /// The IP family used to assign Kubernetes <code>Pod</code> and
  /// <code>Service</code> objects IP addresses. The IP family is always
  /// <code>ipv4</code>, unless you have a <code>1.21</code> or later cluster
  /// running version <code>1.10.1</code> or later of the Amazon VPC CNI plugin
  /// for Kubernetes and specified <code>ipv6</code> when you created the cluster.
  final IpFamily? ipFamily;

  /// The CIDR block that Kubernetes <code>Pod</code> and <code>Service</code>
  /// object IP addresses are assigned from. Kubernetes assigns addresses from an
  /// <code>IPv4</code> CIDR block assigned to a subnet that the node is in. If
  /// you didn't specify a CIDR block when you created the cluster, then
  /// Kubernetes assigns addresses from either the <code>10.100.0.0/16</code> or
  /// <code>172.20.0.0/16</code> CIDR blocks. If this was specified, then it was
  /// specified when the cluster was created and it can't be changed.
  final String? serviceIpv4Cidr;

  /// The CIDR block that Kubernetes pod and service IP addresses are assigned
  /// from if you created a 1.21 or later cluster with version 1.10.1 or later of
  /// the Amazon VPC CNI add-on and specified <code>ipv6</code> for
  /// <b>ipFamily</b> when you created the cluster. Kubernetes assigns service
  /// addresses from the unique local address range (<code>fc00::/7</code>)
  /// because you can't specify a custom IPv6 CIDR block when you create the
  /// cluster.
  final String? serviceIpv6Cidr;

  KubernetesNetworkConfigResponse({
    this.ipFamily,
    this.serviceIpv4Cidr,
    this.serviceIpv6Cidr,
  });

  factory KubernetesNetworkConfigResponse.fromJson(Map<String, dynamic> json) {
    return KubernetesNetworkConfigResponse(
      ipFamily: (json['ipFamily'] as String?)?.toIpFamily(),
      serviceIpv4Cidr: json['serviceIpv4Cidr'] as String?,
      serviceIpv6Cidr: json['serviceIpv6Cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipFamily = this.ipFamily;
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    final serviceIpv6Cidr = this.serviceIpv6Cidr;
    return {
      if (ipFamily != null) 'ipFamily': ipFamily.toValue(),
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
      if (serviceIpv6Cidr != null) 'serviceIpv6Cidr': serviceIpv6Cidr,
    };
  }
}

/// An object representing a node group launch template specification. The
/// launch template can't include <a
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
/// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
/// managed nodes with launch templates</a> in the <i>Amazon EKS User Guide</i>.
///
/// You must specify either the launch template ID or the launch template name
/// in the request, but not both.
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  ///
  /// You must specify either the launch template ID or the launch template name
  /// in the request, but not both.
  final String? id;

  /// The name of the launch template.
  ///
  /// You must specify either the launch template name or the launch template ID
  /// in the request, but not both.
  final String? name;

  /// The version number of the launch template to use. If no version is
  /// specified, then the template's default version is used.
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

class ListAccessEntriesResponse {
  /// The list of access entries that exist for the cluster.
  final List<String>? accessEntries;

  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  ListAccessEntriesResponse({
    this.accessEntries,
    this.nextToken,
  });

  factory ListAccessEntriesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessEntriesResponse(
      accessEntries: (json['accessEntries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessEntries = this.accessEntries;
    final nextToken = this.nextToken;
    return {
      if (accessEntries != null) 'accessEntries': accessEntries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAccessPoliciesResponse {
  /// The list of available access policies. You can't view the contents of an
  /// access policy using the API. To view the contents, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html#access-policy-permissions">Access
  /// policy permissions</a> in the <i>Amazon EKS User Guide</i>.
  final List<AccessPolicy>? accessPolicies;

  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  ListAccessPoliciesResponse({
    this.accessPolicies,
    this.nextToken,
  });

  factory ListAccessPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPoliciesResponse(
      accessPolicies: (json['accessPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => AccessPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicies = this.accessPolicies;
    final nextToken = this.nextToken;
    return {
      if (accessPolicies != null) 'accessPolicies': accessPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAddonsResponse {
  /// A list of installed add-ons.
  final List<String>? addons;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListAddons</code> request. When the results of a
  /// <code>ListAddons</code> request exceed <code>maxResults</code>, you can use
  /// this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
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

class ListAssociatedAccessPoliciesResponse {
  /// The list of access policies associated with the access entry.
  final List<AssociatedAccessPolicy>? associatedAccessPolicies;

  /// The name of your cluster.
  final String? clusterName;

  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  final String? principalArn;

  ListAssociatedAccessPoliciesResponse({
    this.associatedAccessPolicies,
    this.clusterName,
    this.nextToken,
    this.principalArn,
  });

  factory ListAssociatedAccessPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssociatedAccessPoliciesResponse(
      associatedAccessPolicies: (json['associatedAccessPolicies'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AssociatedAccessPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      clusterName: json['clusterName'] as String?,
      nextToken: json['nextToken'] as String?,
      principalArn: json['principalArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAccessPolicies = this.associatedAccessPolicies;
    final clusterName = this.clusterName;
    final nextToken = this.nextToken;
    final principalArn = this.principalArn;
    return {
      if (associatedAccessPolicies != null)
        'associatedAccessPolicies': associatedAccessPolicies,
      if (clusterName != null) 'clusterName': clusterName,
      if (nextToken != null) 'nextToken': nextToken,
      if (principalArn != null) 'principalArn': principalArn,
    };
  }
}

class ListClustersResponse {
  /// A list of all of the clusters for your account in the specified Amazon Web
  /// Services Region.
  final List<String>? clusters;

  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

class ListEksAnywhereSubscriptionsResponse {
  /// The nextToken value to include in a future ListEksAnywhereSubscriptions
  /// request. When the results of a ListEksAnywhereSubscriptions request exceed
  /// maxResults, you can use this value to retrieve the next page of results.
  /// This value is null when there are no more results to return.
  final String? nextToken;

  /// A list of all subscription objects in the region, filtered by includeStatus
  /// and paginated by nextToken and maxResults.
  final List<EksAnywhereSubscription>? subscriptions;

  ListEksAnywhereSubscriptionsResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListEksAnywhereSubscriptionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEksAnywhereSubscriptionsResponse(
      nextToken: json['nextToken'] as String?,
      subscriptions: (json['subscriptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EksAnywhereSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subscriptions != null) 'subscriptions': subscriptions,
    };
  }
}

class ListFargateProfilesResponse {
  /// A list of all of the Fargate profiles associated with the specified cluster.
  final List<String>? fargateProfileNames;

  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListIdentityProviderConfigsResponse</code> request. When the results
  /// of a <code>ListIdentityProviderConfigsResponse</code> request exceed
  /// <code>maxResults</code>, you can use this value to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

class ListInsightsResponse {
  /// The returned list of insights.
  final List<InsightSummary>? insights;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListInsights</code> request. When the results of a
  /// <code>ListInsights</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListInsightsResponse({
    this.insights,
    this.nextToken,
  });

  factory ListInsightsResponse.fromJson(Map<String, dynamic> json) {
    return ListInsightsResponse(
      insights: (json['insights'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insights = this.insights;
    final nextToken = this.nextToken;
    return {
      if (insights != null) 'insights': insights,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNodegroupsResponse {
  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

class ListPodIdentityAssociationsResponse {
  /// The list of summarized descriptions of the associations that are in the
  /// cluster and match any filters that you provided.
  ///
  /// Each summary is simplified by removing these fields compared to the full
  /// <code> <a>PodIdentityAssociation</a> </code>:
  ///
  /// <ul>
  /// <li>
  /// The IAM role: <code>roleArn</code>
  /// </li>
  /// <li>
  /// The timestamp that the association was created at: <code>createdAt</code>
  /// </li>
  /// <li>
  /// The most recent timestamp that the association was modified at:.
  /// <code>modifiedAt</code>
  /// </li>
  /// <li>
  /// The tags on the association: <code>tags</code>
  /// </li>
  /// </ul>
  final List<PodIdentityAssociationSummary>? associations;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListPodIdentityAssociations</code> request. When the results of a
  /// <code>ListPodIdentityAssociations</code> request exceed
  /// <code>maxResults</code>, you can use this value to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  final String? nextToken;

  ListPodIdentityAssociationsResponse({
    this.associations,
    this.nextToken,
  });

  factory ListPodIdentityAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPodIdentityAssociationsResponse(
      associations: (json['associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PodIdentityAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      if (associations != null) 'associations': associations,
      if (nextToken != null) 'nextToken': nextToken,
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
  /// The <code>nextToken</code> value returned from a previous paginated request,
  /// where <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
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

extension LogTypeValueExtension on LogType {
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

extension LogTypeFromString on String {
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

/// Information about an Amazon EKS add-on from the Amazon Web Services
/// Marketplace.
class MarketplaceInformation {
  /// The product ID from the Amazon Web Services Marketplace.
  final String? productId;

  /// The product URL from the Amazon Web Services Marketplace.
  final String? productUrl;

  MarketplaceInformation({
    this.productId,
    this.productUrl,
  });

  factory MarketplaceInformation.fromJson(Map<String, dynamic> json) {
    return MarketplaceInformation(
      productId: json['productId'] as String?,
      productUrl: json['productUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final productId = this.productId;
    final productUrl = this.productUrl;
    return {
      if (productId != null) 'productId': productId,
      if (productUrl != null) 'productUrl': productUrl,
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

  /// The name of your cluster.
  final String? clusterName;

  /// The Unix epoch timestamp at object creation.
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

  /// The Kubernetes <code>labels</code> applied to the nodes in the node group.
  /// <note>
  /// Only <code>labels</code> that are applied with the Amazon EKS API are shown
  /// here. There may be other Kubernetes <code>labels</code> applied to the nodes
  /// in this group.
  /// </note>
  final Map<String, String>? labels;

  /// If a launch template was used to create the node group, then this is the
  /// launch template that was used.
  final LaunchTemplateSpecification? launchTemplate;

  /// The Unix epoch timestamp for the last modification to the object.
  final DateTime? modifiedAt;

  /// The IAM role associated with your node group. The Amazon EKS node
  /// <code>kubelet</code> daemon makes calls to Amazon Web Services APIs on your
  /// behalf. Nodes receive permissions for these API calls through an IAM
  /// instance profile and associated policies.
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

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  final Map<String, String>? tags;

  /// The Kubernetes taints to be applied to the nodes in the node group when they
  /// are created. Effect is one of <code>No_Schedule</code>,
  /// <code>Prefer_No_Schedule</code>, or <code>No_Execute</code>. Kubernetes
  /// taints can be used together with tolerations to control how workloads are
  /// scheduled to your nodes. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
  /// taints on managed node groups</a>.
  final List<Taint>? taints;

  /// The node group update configuration.
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
  ec2SubnetMissingIpv6Assignment,
  iamLimitExceeded,
  iamNodeRoleNotFound,
  nodeCreationFailure,
  asgInstanceLaunchFailures,
  instanceLimitExceeded,
  insufficientFreeAddresses,
  accessDenied,
  internalFailure,
  clusterUnreachable,
  amiIdNotFound,
  autoScalingGroupOptInRequired,
  autoScalingGroupRateLimitExceeded,
  ec2LaunchTemplateDeletionFailure,
  ec2LaunchTemplateInvalidConfiguration,
  ec2LaunchTemplateMaxLimitExceeded,
  ec2SubnetListTooLong,
  iamThrottling,
  nodeTerminationFailure,
  podEvictionFailure,
  sourceEc2LaunchTemplateNotFound,
  limitExceeded,
  unknown,
  autoScalingGroupInstanceRefreshActive,
  kubernetesLabelInvalid,
  ec2LaunchTemplateVersionMaxLimitExceeded,
}

extension NodegroupIssueCodeValueExtension on NodegroupIssueCode {
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
      case NodegroupIssueCode.ec2SubnetMissingIpv6Assignment:
        return 'Ec2SubnetMissingIpv6Assignment';
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
      case NodegroupIssueCode.amiIdNotFound:
        return 'AmiIdNotFound';
      case NodegroupIssueCode.autoScalingGroupOptInRequired:
        return 'AutoScalingGroupOptInRequired';
      case NodegroupIssueCode.autoScalingGroupRateLimitExceeded:
        return 'AutoScalingGroupRateLimitExceeded';
      case NodegroupIssueCode.ec2LaunchTemplateDeletionFailure:
        return 'Ec2LaunchTemplateDeletionFailure';
      case NodegroupIssueCode.ec2LaunchTemplateInvalidConfiguration:
        return 'Ec2LaunchTemplateInvalidConfiguration';
      case NodegroupIssueCode.ec2LaunchTemplateMaxLimitExceeded:
        return 'Ec2LaunchTemplateMaxLimitExceeded';
      case NodegroupIssueCode.ec2SubnetListTooLong:
        return 'Ec2SubnetListTooLong';
      case NodegroupIssueCode.iamThrottling:
        return 'IamThrottling';
      case NodegroupIssueCode.nodeTerminationFailure:
        return 'NodeTerminationFailure';
      case NodegroupIssueCode.podEvictionFailure:
        return 'PodEvictionFailure';
      case NodegroupIssueCode.sourceEc2LaunchTemplateNotFound:
        return 'SourceEc2LaunchTemplateNotFound';
      case NodegroupIssueCode.limitExceeded:
        return 'LimitExceeded';
      case NodegroupIssueCode.unknown:
        return 'Unknown';
      case NodegroupIssueCode.autoScalingGroupInstanceRefreshActive:
        return 'AutoScalingGroupInstanceRefreshActive';
      case NodegroupIssueCode.kubernetesLabelInvalid:
        return 'KubernetesLabelInvalid';
      case NodegroupIssueCode.ec2LaunchTemplateVersionMaxLimitExceeded:
        return 'Ec2LaunchTemplateVersionMaxLimitExceeded';
    }
  }
}

extension NodegroupIssueCodeFromString on String {
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
      case 'Ec2SubnetMissingIpv6Assignment':
        return NodegroupIssueCode.ec2SubnetMissingIpv6Assignment;
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
      case 'AmiIdNotFound':
        return NodegroupIssueCode.amiIdNotFound;
      case 'AutoScalingGroupOptInRequired':
        return NodegroupIssueCode.autoScalingGroupOptInRequired;
      case 'AutoScalingGroupRateLimitExceeded':
        return NodegroupIssueCode.autoScalingGroupRateLimitExceeded;
      case 'Ec2LaunchTemplateDeletionFailure':
        return NodegroupIssueCode.ec2LaunchTemplateDeletionFailure;
      case 'Ec2LaunchTemplateInvalidConfiguration':
        return NodegroupIssueCode.ec2LaunchTemplateInvalidConfiguration;
      case 'Ec2LaunchTemplateMaxLimitExceeded':
        return NodegroupIssueCode.ec2LaunchTemplateMaxLimitExceeded;
      case 'Ec2SubnetListTooLong':
        return NodegroupIssueCode.ec2SubnetListTooLong;
      case 'IamThrottling':
        return NodegroupIssueCode.iamThrottling;
      case 'NodeTerminationFailure':
        return NodegroupIssueCode.nodeTerminationFailure;
      case 'PodEvictionFailure':
        return NodegroupIssueCode.podEvictionFailure;
      case 'SourceEc2LaunchTemplateNotFound':
        return NodegroupIssueCode.sourceEc2LaunchTemplateNotFound;
      case 'LimitExceeded':
        return NodegroupIssueCode.limitExceeded;
      case 'Unknown':
        return NodegroupIssueCode.unknown;
      case 'AutoScalingGroupInstanceRefreshActive':
        return NodegroupIssueCode.autoScalingGroupInstanceRefreshActive;
      case 'KubernetesLabelInvalid':
        return NodegroupIssueCode.kubernetesLabelInvalid;
      case 'Ec2LaunchTemplateVersionMaxLimitExceeded':
        return NodegroupIssueCode.ec2LaunchTemplateVersionMaxLimitExceeded;
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
  /// <important>
  /// If you use the Kubernetes <a
  /// href="https://github.com/kubernetes/autoscaler#kubernetes-autoscaler">Cluster
  /// Autoscaler</a>, you shouldn't change the <code>desiredSize</code> value
  /// directly, as this can cause the Cluster Autoscaler to suddenly scale up or
  /// scale down.
  /// </important>
  /// Whenever this parameter changes, the number of worker nodes in the node
  /// group is updated to the specified size. If this parameter is given a value
  /// that is smaller than the current number of running worker nodes, the
  /// necessary number of worker nodes are terminated to match the given value.
  /// When using CloudFormation, no action occurs if you remove this parameter
  /// from your CFN template.
  ///
  /// This parameter can be different from <code>minSize</code> in some cases,
  /// such as when starting with extra hosts for testing. This parameter can also
  /// be different when you want to start with an estimated number of needed
  /// hosts, but let the Cluster Autoscaler reduce the number if there are too
  /// many. When the Cluster Autoscaler is used, the <code>desiredSize</code>
  /// parameter is altered by the Cluster Autoscaler (but can be out-of-date for
  /// short periods of time). the Cluster Autoscaler doesn't scale a managed node
  /// group lower than <code>minSize</code> or higher than <code>maxSize</code>.
  final int? desiredSize;

  /// The maximum number of nodes that the managed node group can scale out to.
  /// For information about the maximum number that you can specify, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/service-quotas.html">Amazon
  /// EKS service quotas</a> in the <i>Amazon EKS User Guide</i>.
  final int? maxSize;

  /// The minimum number of nodes that the managed node group can scale in to.
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

extension NodegroupStatusValueExtension on NodegroupStatus {
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

extension NodegroupStatusFromString on String {
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

/// The node group update configuration.
class NodegroupUpdateConfig {
  /// The maximum number of nodes unavailable at once during a version update.
  /// Nodes are updated in parallel. This value or
  /// <code>maxUnavailablePercentage</code> is required to have a value.The
  /// maximum number is 100.
  final int? maxUnavailable;

  /// The maximum percentage of nodes unavailable during a version update. This
  /// percentage of nodes are updated in parallel, up to 100 nodes at once. This
  /// value or <code>maxUnavailable</code> is required to have a value.
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

/// An object representing the configuration for an OpenID Connect (OIDC)
/// identity provider.
class OidcIdentityProviderConfig {
  /// This is also known as <i>audience</i>. The ID of the client application that
  /// makes authentication requests to the OIDC identity provider.
  final String? clientId;

  /// The name of your cluster.
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

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
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
/// users for your cluster from an OIDC identity provider</a> in the <i>Amazon
/// EKS User Guide</i>.
class OidcIdentityProviderConfigRequest {
  /// This is also known as <i>audience</i>. The ID for the client application
  /// that makes authentication requests to the OIDC identity provider.
  final String clientId;

  /// The name of the OIDC provider configuration.
  final String identityProviderConfigName;

  /// The URL of the OIDC identity provider that allows the API server to discover
  /// public signing keys for verifying tokens. The URL must begin with
  /// <code>https://</code> and should correspond to the <code>iss</code> claim in
  /// the provider's OIDC ID tokens. Based on the OIDC standard, path components
  /// are allowed but query parameters are not. Typically the URL consists of only
  /// a hostname, like <code>https://server.example.org</code> or
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
  /// <code>name</code>, depending on the OIDC identity provider. Claims other
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

/// The configuration of your local Amazon EKS cluster on an Amazon Web Services
/// Outpost. Before creating a cluster on an Outpost, review <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-local-cluster-create.html">Creating
/// a local cluster on an Outpost</a> in the <i>Amazon EKS User Guide</i>. This
/// API isn't available for Amazon EKS clusters on the Amazon Web Services
/// cloud.
class OutpostConfigRequest {
  /// The Amazon EC2 instance type that you want to use for your local Amazon EKS
  /// cluster on Outposts. Choose an instance type based on the number of nodes
  /// that your cluster will have. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
  /// considerations</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// The instance type that you specify is used for all Kubernetes control plane
  /// instances. The instance type can't be changed after cluster creation. The
  /// control plane is not automatically scaled by Amazon EKS.
  ///
  ///
  final String controlPlaneInstanceType;

  /// The ARN of the Outpost that you want to use for your local Amazon EKS
  /// cluster on Outposts. Only a single Outpost ARN is supported.
  final List<String> outpostArns;

  /// An object representing the placement configuration for all the control plane
  /// instances of your local Amazon EKS cluster on an Amazon Web Services
  /// Outpost. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
  /// considerations</a> in the <i>Amazon EKS User Guide</i>.
  final ControlPlanePlacementRequest? controlPlanePlacement;

  OutpostConfigRequest({
    required this.controlPlaneInstanceType,
    required this.outpostArns,
    this.controlPlanePlacement,
  });

  Map<String, dynamic> toJson() {
    final controlPlaneInstanceType = this.controlPlaneInstanceType;
    final outpostArns = this.outpostArns;
    final controlPlanePlacement = this.controlPlanePlacement;
    return {
      'controlPlaneInstanceType': controlPlaneInstanceType,
      'outpostArns': outpostArns,
      if (controlPlanePlacement != null)
        'controlPlanePlacement': controlPlanePlacement,
    };
  }
}

/// An object representing the configuration of your local Amazon EKS cluster on
/// an Amazon Web Services Outpost. This API isn't available for Amazon EKS
/// clusters on the Amazon Web Services cloud.
class OutpostConfigResponse {
  /// The Amazon EC2 instance type used for the control plane. The instance type
  /// is the same for all control plane instances.
  final String controlPlaneInstanceType;

  /// The ARN of the Outpost that you specified for use with your local Amazon EKS
  /// cluster on Outposts.
  final List<String> outpostArns;

  /// An object representing the placement configuration for all the control plane
  /// instances of your local Amazon EKS cluster on an Amazon Web Services
  /// Outpost. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
  /// considerations</a> in the <i>Amazon EKS User Guide</i>.
  final ControlPlanePlacementResponse? controlPlanePlacement;

  OutpostConfigResponse({
    required this.controlPlaneInstanceType,
    required this.outpostArns,
    this.controlPlanePlacement,
  });

  factory OutpostConfigResponse.fromJson(Map<String, dynamic> json) {
    return OutpostConfigResponse(
      controlPlaneInstanceType: json['controlPlaneInstanceType'] as String,
      outpostArns: (json['outpostArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      controlPlanePlacement: json['controlPlanePlacement'] != null
          ? ControlPlanePlacementResponse.fromJson(
              json['controlPlanePlacement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlPlaneInstanceType = this.controlPlaneInstanceType;
    final outpostArns = this.outpostArns;
    final controlPlanePlacement = this.controlPlanePlacement;
    return {
      'controlPlaneInstanceType': controlPlaneInstanceType,
      'outpostArns': outpostArns,
      if (controlPlanePlacement != null)
        'controlPlanePlacement': controlPlanePlacement,
    };
  }
}

/// Amazon EKS Pod Identity associations provide the ability to manage
/// credentials for your applications, similar to the way that Amazon EC2
/// instance profiles provide credentials to Amazon EC2 instances.
class PodIdentityAssociation {
  /// The Amazon Resource Name (ARN) of the association.
  final String? associationArn;

  /// The ID of the association.
  final String? associationId;

  /// The name of the cluster that the association is in.
  final String? clusterName;

  /// The timestamp that the association was created at.
  final DateTime? createdAt;

  /// The most recent timestamp that the association was modified at
  final DateTime? modifiedAt;

  /// The name of the Kubernetes namespace inside the cluster to create the
  /// association in. The service account and the pods that use the service
  /// account must be in this namespace.
  final String? namespace;

  /// If defined, the Pod Identity Association is owned by an Amazon EKS Addon.
  final String? ownerArn;

  /// The Amazon Resource Name (ARN) of the IAM role to associate with the service
  /// account. The EKS Pod Identity agent manages credentials to assume this role
  /// for applications in the containers in the pods that use this service
  /// account.
  final String? roleArn;

  /// The name of the Kubernetes service account inside the cluster to associate
  /// the IAM credentials with.
  final String? serviceAccount;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource – 50
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length – 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length – 256 Unicode characters in UTF-8
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
  final Map<String, String>? tags;

  PodIdentityAssociation({
    this.associationArn,
    this.associationId,
    this.clusterName,
    this.createdAt,
    this.modifiedAt,
    this.namespace,
    this.ownerArn,
    this.roleArn,
    this.serviceAccount,
    this.tags,
  });

  factory PodIdentityAssociation.fromJson(Map<String, dynamic> json) {
    return PodIdentityAssociation(
      associationArn: json['associationArn'] as String?,
      associationId: json['associationId'] as String?,
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      namespace: json['namespace'] as String?,
      ownerArn: json['ownerArn'] as String?,
      roleArn: json['roleArn'] as String?,
      serviceAccount: json['serviceAccount'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final associationArn = this.associationArn;
    final associationId = this.associationId;
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final namespace = this.namespace;
    final ownerArn = this.ownerArn;
    final roleArn = this.roleArn;
    final serviceAccount = this.serviceAccount;
    final tags = this.tags;
    return {
      if (associationArn != null) 'associationArn': associationArn,
      if (associationId != null) 'associationId': associationId,
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (namespace != null) 'namespace': namespace,
      if (ownerArn != null) 'ownerArn': ownerArn,
      if (roleArn != null) 'roleArn': roleArn,
      if (serviceAccount != null) 'serviceAccount': serviceAccount,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The summarized description of the association.
///
/// Each summary is simplified by removing these fields compared to the full
/// <code> <a>PodIdentityAssociation</a> </code>:
///
/// <ul>
/// <li>
/// The IAM role: <code>roleArn</code>
/// </li>
/// <li>
/// The timestamp that the association was created at: <code>createdAt</code>
/// </li>
/// <li>
/// The most recent timestamp that the association was modified at:.
/// <code>modifiedAt</code>
/// </li>
/// <li>
/// The tags on the association: <code>tags</code>
/// </li>
/// </ul>
class PodIdentityAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? associationArn;

  /// The ID of the association.
  final String? associationId;

  /// The name of the cluster that the association is in.
  final String? clusterName;

  /// The name of the Kubernetes namespace inside the cluster to create the
  /// association in. The service account and the pods that use the service
  /// account must be in this namespace.
  final String? namespace;

  /// If defined, the Pod Identity Association is owned by an Amazon EKS Addon.
  final String? ownerArn;

  /// The name of the Kubernetes service account inside the cluster to associate
  /// the IAM credentials with.
  final String? serviceAccount;

  PodIdentityAssociationSummary({
    this.associationArn,
    this.associationId,
    this.clusterName,
    this.namespace,
    this.ownerArn,
    this.serviceAccount,
  });

  factory PodIdentityAssociationSummary.fromJson(Map<String, dynamic> json) {
    return PodIdentityAssociationSummary(
      associationArn: json['associationArn'] as String?,
      associationId: json['associationId'] as String?,
      clusterName: json['clusterName'] as String?,
      namespace: json['namespace'] as String?,
      ownerArn: json['ownerArn'] as String?,
      serviceAccount: json['serviceAccount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationArn = this.associationArn;
    final associationId = this.associationId;
    final clusterName = this.clusterName;
    final namespace = this.namespace;
    final ownerArn = this.ownerArn;
    final serviceAccount = this.serviceAccount;
    return {
      if (associationArn != null) 'associationArn': associationArn,
      if (associationId != null) 'associationId': associationId,
      if (clusterName != null) 'clusterName': clusterName,
      if (namespace != null) 'namespace': namespace,
      if (ownerArn != null) 'ownerArn': ownerArn,
      if (serviceAccount != null) 'serviceAccount': serviceAccount,
    };
  }
}

/// Identifies the Key Management Service (KMS) key used to encrypt the secrets.
class Provider {
  /// Amazon Resource Name (ARN) or alias of the KMS key. The KMS key must be
  /// symmetric and created in the same Amazon Web Services Region as the cluster.
  /// If the KMS key was created in a different account, the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html">IAM
  /// principal</a> must have access to the KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-modifying-external-accounts.html">Allowing
  /// users in other accounts to use a KMS key</a> in the <i>Key Management
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

class RegisterClusterResponse {
  final Cluster? cluster;

  RegisterClusterResponse({
    this.cluster,
  });

  factory RegisterClusterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterClusterResponse(
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

/// An object representing the remote access configuration for the managed node
/// group.
class RemoteAccessConfig {
  /// The Amazon EC2 SSH key name that provides access for SSH communication with
  /// the nodes in the managed node group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon
  /// EC2 key pairs and Linux instances</a> in the <i>Amazon Elastic Compute Cloud
  /// User Guide for Linux Instances</i>. For Windows, an Amazon EC2 SSH key is
  /// used to obtain the RDP password. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-key-pairs.html">Amazon
  /// EC2 key pairs and Windows instances</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide for Windows Instances</i>.
  final String? ec2SshKey;

  /// The security group IDs that are allowed SSH access (port 22) to the nodes.
  /// For Windows, the port is 3389. If you specify an Amazon EC2 SSH key but
  /// don't specify a source security group when you create a managed node group,
  /// then the port on the nodes is opened to the internet
  /// (<code>0.0.0.0/0</code>). For more information, see <a
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
  preserve,
}

extension ResolveConflictsValueExtension on ResolveConflicts {
  String toValue() {
    switch (this) {
      case ResolveConflicts.overwrite:
        return 'OVERWRITE';
      case ResolveConflicts.none:
        return 'NONE';
      case ResolveConflicts.preserve:
        return 'PRESERVE';
    }
  }
}

extension ResolveConflictsFromString on String {
  ResolveConflicts toResolveConflicts() {
    switch (this) {
      case 'OVERWRITE':
        return ResolveConflicts.overwrite;
      case 'NONE':
        return ResolveConflicts.none;
      case 'PRESERVE':
        return ResolveConflicts.preserve;
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

/// A property that allows a node to repel a <code>Pod</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
/// taints on managed node groups</a> in the <i>Amazon EKS User Guide</i>.
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

extension TaintEffectValueExtension on TaintEffect {
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

extension TaintEffectFromString on String {
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
  /// The Unix epoch timestamp at object creation.
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

/// The access configuration information for the cluster.
class UpdateAccessConfigRequest {
  /// The desired authentication mode for the cluster.
  final AuthenticationMode? authenticationMode;

  UpdateAccessConfigRequest({
    this.authenticationMode,
  });

  Map<String, dynamic> toJson() {
    final authenticationMode = this.authenticationMode;
    return {
      if (authenticationMode != null)
        'authenticationMode': authenticationMode.toValue(),
    };
  }
}

class UpdateAccessEntryResponse {
  /// The ARN of the IAM principal for the <code>AccessEntry</code>.
  final AccessEntry? accessEntry;

  UpdateAccessEntryResponse({
    this.accessEntry,
  });

  factory UpdateAccessEntryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccessEntryResponse(
      accessEntry: json['accessEntry'] != null
          ? AccessEntry.fromJson(json['accessEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessEntry = this.accessEntry;
    return {
      if (accessEntry != null) 'accessEntry': accessEntry,
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

class UpdateEksAnywhereSubscriptionResponse {
  /// The full description of the updated subscription.
  final EksAnywhereSubscription? subscription;

  UpdateEksAnywhereSubscriptionResponse({
    this.subscription,
  });

  factory UpdateEksAnywhereSubscriptionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateEksAnywhereSubscriptionResponse(
      subscription: json['subscription'] != null
          ? EksAnywhereSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
    };
  }
}

/// An object representing a Kubernetes <code>label</code> change for a managed
/// node group.
class UpdateLabelsPayload {
  /// The Kubernetes <code>labels</code> to add or update.
  final Map<String, String>? addOrUpdateLabels;

  /// The Kubernetes <code>labels</code> to remove.
  final List<String>? removeLabels;

  UpdateLabelsPayload({
    this.addOrUpdateLabels,
    this.removeLabels,
  });

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
  configurationValues,
  securityGroups,
  subnets,
  authenticationMode,
  podIdentityAssociations,
}

extension UpdateParamTypeValueExtension on UpdateParamType {
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
      case UpdateParamType.configurationValues:
        return 'ConfigurationValues';
      case UpdateParamType.securityGroups:
        return 'SecurityGroups';
      case UpdateParamType.subnets:
        return 'Subnets';
      case UpdateParamType.authenticationMode:
        return 'AuthenticationMode';
      case UpdateParamType.podIdentityAssociations:
        return 'PodIdentityAssociations';
    }
  }
}

extension UpdateParamTypeFromString on String {
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
      case 'ConfigurationValues':
        return UpdateParamType.configurationValues;
      case 'SecurityGroups':
        return UpdateParamType.securityGroups;
      case 'Subnets':
        return UpdateParamType.subnets;
      case 'AuthenticationMode':
        return UpdateParamType.authenticationMode;
      case 'PodIdentityAssociations':
        return UpdateParamType.podIdentityAssociations;
    }
    throw Exception('$this is not known in enum UpdateParamType');
  }
}

class UpdatePodIdentityAssociationResponse {
  /// The full description of the EKS Pod Identity association that was updated.
  final PodIdentityAssociation? association;

  UpdatePodIdentityAssociationResponse({
    this.association,
  });

  factory UpdatePodIdentityAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdatePodIdentityAssociationResponse(
      association: json['association'] != null
          ? PodIdentityAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'association': association,
    };
  }
}

enum UpdateStatus {
  inProgress,
  failed,
  cancelled,
  successful,
}

extension UpdateStatusValueExtension on UpdateStatus {
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

extension UpdateStatusFromString on String {
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

/// An object representing the details of an update to a taints payload. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
/// taints on managed node groups</a> in the <i>Amazon EKS User Guide</i>.
class UpdateTaintsPayload {
  /// Kubernetes taints to be added or updated.
  final List<Taint>? addOrUpdateTaints;

  /// Kubernetes taints to remove.
  final List<Taint>? removeTaints;

  UpdateTaintsPayload({
    this.addOrUpdateTaints,
    this.removeTaints,
  });

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
  vpcConfigUpdate,
  accessConfigUpdate,
}

extension UpdateTypeValueExtension on UpdateType {
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
      case UpdateType.vpcConfigUpdate:
        return 'VpcConfigUpdate';
      case UpdateType.accessConfigUpdate:
        return 'AccessConfigUpdate';
    }
  }
}

extension UpdateTypeFromString on String {
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
      case 'VpcConfigUpdate':
        return UpdateType.vpcConfigUpdate;
      case 'AccessConfigUpdate':
        return UpdateType.accessConfigUpdate;
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
  /// private access and you have nodes or Fargate pods in the cluster, then
  /// ensure that <code>publicAccessCidrs</code> includes the necessary CIDR
  /// blocks for communication with the nodes or Fargate pods. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS cluster endpoint access control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// Set this value to <code>false</code> to disable public access to your
  /// cluster's Kubernetes API server endpoint. If you disable public access, your
  /// cluster's Kubernetes API server can only receive requests from within the
  /// cluster VPC. The default value for this parameter is <code>true</code>,
  /// which enables public access for your Kubernetes API server. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS cluster endpoint access control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the CIDR blocks that you specify is denied. The default value is
  /// <code>0.0.0.0/0</code>. If you've disabled private endpoint access, make
  /// sure that you specify the necessary CIDR blocks for every node and Fargate
  /// <code>Pod</code> in the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS cluster endpoint access control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final List<String>? publicAccessCidrs;

  /// Specify one or more security groups for the cross-account elastic network
  /// interfaces that Amazon EKS creates to use that allow communication between
  /// your nodes and the Kubernetes control plane. If you don't specify any
  /// security groups, then familiarize yourself with the difference between
  /// Amazon EKS defaults for clusters deployed with Kubernetes. For more
  /// information, see <a
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
  /// is disabled and you have nodes or Fargate pods in the cluster, then ensure
  /// that <code>publicAccessCidrs</code> includes the necessary CIDR blocks for
  /// communication with the nodes or Fargate pods. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon
  /// EKS cluster endpoint access control</a> in the <i> <i>Amazon EKS User
  /// Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// Whether the public API server endpoint is enabled.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint.
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

extension ConfigStatusValueExtension on ConfigStatus {
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

extension ConfigStatusFromString on String {
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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

class ResourcePropagationDelayException extends _s.GenericAwsException {
  ResourcePropagationDelayException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourcePropagationDelayException',
            message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
  'ResourcePropagationDelayException': (type, message) =>
      ResourcePropagationDelayException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'UnsupportedAvailabilityZoneException': (type, message) =>
      UnsupportedAvailabilityZoneException(type: type, message: message),
};
