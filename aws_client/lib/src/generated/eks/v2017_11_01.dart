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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// the <code>type</code> field. For <code>STANDARD</code> access entries, you
  /// can use every IAM principal type. For nodes (<code>EC2</code> (for EKS
  /// Auto Mode), <code>EC2_LINUX</code>, <code>EC2_WINDOWS</code>,
  /// <code>FARGATE_LINUX</code>, and <code>HYBRID_LINUX</code>), the only valid
  /// ARN is IAM roles. You can't use the STS session principal type with access
  /// entries because this is a temporary principal for each session and not a
  /// permanent identity that can be assigned permissions.
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
  /// The type of the new access entry. Valid values are <code>STANDARD</code>,
  /// <code>FARGATE_LINUX</code>, <code>EC2_LINUX</code>,
  /// <code>EC2_WINDOWS</code>, <code>EC2</code> (for EKS Auto Mode),
  /// <code>HYBRID_LINUX</code>, and <code>HYPERPOD_LINUX</code>.
  ///
  /// If the <code>principalArn</code> is for an IAM role that's used for
  /// self-managed Amazon EC2 nodes, specify <code>EC2_LINUX</code> or
  /// <code>EC2_WINDOWS</code>. Amazon EKS grants the necessary permissions to
  /// the node for you. If the <code>principalArn</code> is for any other
  /// purpose, specify <code>STANDARD</code>. If you don't specify a value,
  /// Amazon EKS sets the value to <code>STANDARD</code>. If you have the access
  /// mode of the cluster set to <code>API_AND_CONFIG_MAP</code>, it's
  /// unnecessary to create access entries for IAM roles used with Fargate
  /// profiles or managed Amazon EC2 nodes, because Amazon EKS creates entries
  /// in the <code>aws-auth</code> <code>ConfigMap</code> for the roles. You
  /// can't change this value once you've created the access entry.
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
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
  /// Parameter [namespaceConfig] :
  /// The namespace configuration for the addon. If specified, this will
  /// override the default namespace for the addon.
  ///
  /// Parameter [podIdentityAssociations] :
  /// An array of EKS Pod Identity associations to be created. Each association
  /// maps a Kubernetes service account to an IAM role.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using EKS Pod Identity</a> in the
  /// <i>Amazon EKS User Guide</i>.
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
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_UpdateAddon.html">
  /// <code>UpdateAddon</code> </a>.
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
    AddonNamespaceConfigRequest? namespaceConfig,
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
      if (namespaceConfig != null) 'namespaceConfig': namespaceConfig,
      if (podIdentityAssociations != null)
        'podIdentityAssociations': podIdentityAssociations,
      if (resolveConflicts != null) 'resolveConflicts': resolveConflicts.value,
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

  /// Creates a managed capability resource for an Amazon EKS cluster.
  ///
  /// Capabilities provide fully managed capabilities to build and scale with
  /// Kubernetes. When you create a capability, Amazon EKSprovisions and manages
  /// the infrastructure required to run the capability outside of your cluster.
  /// This approach reduces operational overhead and preserves cluster
  /// resources.
  ///
  /// You can only create one Capability of each type on a given Amazon EKS
  /// cluster. Valid types are Argo CD for declarative GitOps deployment, Amazon
  /// Web Services Controllers for Kubernetes (ACK) for resource management, and
  /// Kube Resource Orchestrator (KRO) for Kubernetes custom resource
  /// orchestration.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/capabilities.html">EKS
  /// Capabilities</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [capabilityName] :
  /// A unique name for the capability. The name must be unique within your
  /// cluster and can contain alphanumeric characters, hyphens, and underscores.
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster where you want to create the
  /// capability.
  ///
  /// Parameter [deletePropagationPolicy] :
  /// Specifies how Kubernetes resources managed by the capability should be
  /// handled when the capability is deleted. Currently, the only supported
  /// value is <code>RETAIN</code> which retains all Kubernetes resources
  /// managed by the capability when the capability is deleted.
  ///
  /// Because resources are retained, all Kubernetes resources created by the
  /// capability should be deleted from the cluster before deleting the
  /// capability itself. After the capability is deleted, these resources become
  /// difficult to manage because the controller is no longer available.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that the capability uses to
  /// interact with Amazon Web Services services. This role must have a trust
  /// policy that allows the EKS service principal to assume it, and it must
  /// have the necessary permissions for the capability type you're creating.
  ///
  /// For ACK capabilities, the role needs permissions to manage the resources
  /// you want to control through Kubernetes. For Argo CD capabilities, the role
  /// needs permissions to access Git repositories and Secrets Manager. For KRO
  /// capabilities, the role needs permissions based on the resources you'll be
  /// orchestrating.
  ///
  /// Parameter [type] :
  /// The type of capability to create. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ACK</code> – Amazon Web Services Controllers for Kubernetes (ACK),
  /// which lets you manage resources directly from Kubernetes.
  /// </li>
  /// <li>
  /// <code>ARGOCD</code> – Argo CD for GitOps-based continuous delivery.
  /// </li>
  /// <li>
  /// <code>KRO</code> – Kube Resource Orchestrator (KRO) for composing and
  /// managing custom Kubernetes resources.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token is valid for 24 hours after
  /// creation. If you retry a request with the same client request token and
  /// the same parameters after the original request has completed successfully,
  /// the result of the original request is returned.
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the capability. The structure of this
  /// object varies depending on the capability type. For Argo CD capabilities,
  /// you can configure IAM Identity CenterIAM; Identity Center integration,
  /// RBAC role mappings, and network access settings.
  Future<CreateCapabilityResponse> createCapability({
    required String capabilityName,
    required String clusterName,
    required CapabilityDeletePropagationPolicy deletePropagationPolicy,
    required String roleArn,
    required CapabilityType type,
    String? clientRequestToken,
    CapabilityConfigurationRequest? configuration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'capabilityName': capabilityName,
      'deletePropagationPolicy': deletePropagationPolicy.value,
      'roleArn': roleArn,
      'type': type.value,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/capabilities',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCapabilityResponse.fromJson(response);
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
  /// default, public access is enabled, and private access is disabled. The
  /// endpoint domain name and IP address family depends on the value of the
  /// <code>ipFamily</code> for the cluster. For more information, see <a
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnsupportedAvailabilityZoneException].
  ///
  /// Parameter [name] :
  /// The unique name to give to your cluster. The name can contain only
  /// alphanumeric characters (case-sensitive), hyphens, and underscores. It
  /// must start with an alphanumeric character and can't be longer than 100
  /// characters. The name must be unique within the Amazon Web Services Region
  /// and Amazon Web Services account that you're creating the cluster in.
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
  /// Parameter [bootstrapSelfManagedAddons] :
  /// If you set this value to <code>False</code> when creating a cluster, the
  /// default networking add-ons will not be installed.
  ///
  /// The default networking add-ons include <code>vpc-cni</code>,
  /// <code>coredns</code>, and <code>kube-proxy</code>.
  ///
  /// Use this option when you plan to install third-party alternative add-ons
  /// or self-manage the default networking add-ons.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [computeConfig] :
  /// Enable or disable the compute capability of EKS Auto Mode when creating
  /// your EKS Auto Mode cluster. If the compute capability is enabled, EKS Auto
  /// Mode will create and delete EC2 Managed Instances in your Amazon Web
  /// Services account
  ///
  /// Parameter [controlPlaneScalingConfig] :
  /// The control plane scaling tier configuration. For more information, see
  /// EKS Provisioned Control Plane in the Amazon EKS User Guide.
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether to enable deletion protection for the cluster. When
  /// enabled, the cluster cannot be deleted unless deletion protection is first
  /// disabled. This helps prevent accidental cluster deletion. Default value is
  /// <code>false</code>.
  ///
  /// Parameter [encryptionConfig] :
  /// The encryption configuration for the cluster.
  ///
  /// Parameter [kubernetesNetworkConfig] :
  /// The Kubernetes network configuration for the cluster.
  ///
  /// Parameter [logging] :
  /// Enable or disable exporting the Kubernetes control plane logs for your
  /// cluster to CloudWatch Logs . By default, cluster control plane logs aren't
  /// exported to CloudWatch Logs . For more information, see <a
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
  /// Parameter [remoteNetworkConfig] :
  /// The configuration in the cluster for EKS Hybrid Nodes. You can add,
  /// change, or remove this configuration after the cluster is created.
  ///
  /// Parameter [storageConfig] :
  /// Enable or disable the block storage capability of EKS Auto Mode when
  /// creating your EKS Auto Mode cluster. If the block storage capability is
  /// enabled, EKS Auto Mode will create and delete EBS volumes in your Amazon
  /// Web Services account.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  ///
  /// Parameter [upgradePolicy] :
  /// New clusters, by default, have extended support enabled. You can disable
  /// extended support when creating a cluster by setting this value to
  /// <code>STANDARD</code>.
  ///
  /// Parameter [version] :
  /// The desired Kubernetes version for your cluster. If you don't specify a
  /// value here, the default version available in Amazon EKS is used.
  /// <note>
  /// The default version might not be the latest version available.
  /// </note>
  ///
  /// Parameter [zonalShiftConfig] :
  /// Enable or disable ARC zonal shift for the cluster. If zonal shift is
  /// enabled, Amazon Web Services configures zonal autoshift for the cluster.
  ///
  /// Zonal shift is a feature of Amazon Application Recovery Controller (ARC).
  /// ARC zonal shift is designed to be a temporary measure that allows you to
  /// move traffic for a resource away from an impaired AZ until the zonal shift
  /// expires or you cancel it. You can extend the zonal shift if necessary.
  ///
  /// You can start a zonal shift for an Amazon EKS cluster, or you can allow
  /// Amazon Web Services to do it for you by enabling <i>zonal autoshift</i>.
  /// This shift updates the flow of east-to-west network traffic in your
  /// cluster to only consider network endpoints for Pods running on worker
  /// nodes in healthy AZs. Additionally, any ALB or NLB handling ingress
  /// traffic for applications in your Amazon EKS cluster will automatically
  /// route traffic to targets in the healthy AZs. For more information about
  /// zonal shift in EKS, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/zone-shift.html">Learn
  /// about Amazon Application Recovery Controller (ARC) Zonal Shift in Amazon
  /// EKS</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  Future<CreateClusterResponse> createCluster({
    required String name,
    required VpcConfigRequest resourcesVpcConfig,
    required String roleArn,
    CreateAccessConfigRequest? accessConfig,
    bool? bootstrapSelfManagedAddons,
    String? clientRequestToken,
    ComputeConfigRequest? computeConfig,
    ControlPlaneScalingConfig? controlPlaneScalingConfig,
    bool? deletionProtection,
    List<EncryptionConfig>? encryptionConfig,
    KubernetesNetworkConfigRequest? kubernetesNetworkConfig,
    Logging? logging,
    OutpostConfigRequest? outpostConfig,
    RemoteNetworkConfigRequest? remoteNetworkConfig,
    StorageConfigRequest? storageConfig,
    Map<String, String>? tags,
    UpgradePolicyRequest? upgradePolicy,
    String? version,
    ZonalShiftConfigRequest? zonalShiftConfig,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'resourcesVpcConfig': resourcesVpcConfig,
      'roleArn': roleArn,
      if (accessConfig != null) 'accessConfig': accessConfig,
      if (bootstrapSelfManagedAddons != null)
        'bootstrapSelfManagedAddons': bootstrapSelfManagedAddons,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (computeConfig != null) 'computeConfig': computeConfig,
      if (controlPlaneScalingConfig != null)
        'controlPlaneScalingConfig': controlPlaneScalingConfig,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (encryptionConfig != null) 'encryptionConfig': encryptionConfig,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
      if (logging != null) 'logging': logging,
      if (outpostConfig != null) 'outpostConfig': outpostConfig,
      if (remoteNetworkConfig != null)
        'remoteNetworkConfig': remoteNetworkConfig,
      if (storageConfig != null) 'storageConfig': storageConfig,
      if (tags != null) 'tags': tags,
      if (upgradePolicy != null) 'upgradePolicy': upgradePolicy,
      if (version != null) 'version': version,
      if (zonalShiftConfig != null) 'zonalShiftConfig': zonalShiftConfig,
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceLimitExceededException].
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
      if (licenseType != null) 'licenseType': licenseType.value,
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
  /// declaration is done through the profile's selectors. Each profile can have
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServerException].
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
  /// template.
  ///
  /// For later updates, you will only be able to update a node group using a
  /// launch template only if it was originally deployed with a launch template.
  /// Additionally, the launch template ID or name must match what was used when
  /// the node group was created. You can update the launch template version
  /// with necessary changes. For more information about using launch templates,
  /// see <a
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
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
  /// <code>diskSize</code>, or <code>remoteAccess</code>. You cannot later
  /// specify a different launch template ID or name than what was used to
  /// create the node group.
  ///
  /// Make sure that the launch template meets the requirements in
  /// <code>launchTemplateSpecification</code>. Also refer to <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Customizing
  /// managed nodes with launch templates</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Parameter [nodeRepairConfig] :
  /// The node auto repair configuration for the node group.
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
  ///
  /// Parameter [warmPoolConfig] :
  /// The warm pool configuration for the node group. Warm pools maintain
  /// pre-initialized EC2 instances that can quickly join your cluster during
  /// scale-out events, improving application scaling performance and reducing
  /// costs.
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
    NodeRepairConfig? nodeRepairConfig,
    String? releaseVersion,
    RemoteAccessConfig? remoteAccess,
    NodegroupScalingConfig? scalingConfig,
    Map<String, String>? tags,
    List<Taint>? taints,
    NodegroupUpdateConfig? updateConfig,
    String? version,
    WarmPoolConfig? warmPoolConfig,
  }) async {
    final $payload = <String, dynamic>{
      'nodeRole': nodeRole,
      'nodegroupName': nodegroupName,
      'subnets': subnets,
      if (amiType != null) 'amiType': amiType.value,
      if (capacityType != null) 'capacityType': capacityType.value,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (diskSize != null) 'diskSize': diskSize,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (labels != null) 'labels': labels,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (nodeRepairConfig != null) 'nodeRepairConfig': nodeRepairConfig,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (remoteAccess != null) 'remoteAccess': remoteAccess,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (tags != null) 'tags': tags,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
      if (version != null) 'version': version,
      if (warmPoolConfig != null) 'warmPoolConfig': warmPoolConfig,
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
  /// Pod Identity to give temporary IAM credentials to Pods and the credentials
  /// are rotated automatically.
  ///
  /// Amazon EKS Pod Identity associations provide the ability to manage
  /// credentials for your applications, similar to the way that Amazon EC2
  /// instance profiles provide credentials to Amazon EC2 instances.
  ///
  /// If a Pod uses a service account that has an association, Amazon EKS sets
  /// environment variables in the containers of the Pod. The environment
  /// variables configure the Amazon Web Services SDKs, including the Command
  /// Line Interface, to use the EKS Pod Identity credentials.
  ///
  /// EKS Pod Identity is a simpler method than <i>IAM roles for service
  /// accounts</i>, as this method doesn't use OIDC identity providers.
  /// Additionally, you can configure a role for EKS Pod Identity once, and
  /// reuse it across clusters.
  ///
  /// Similar to Amazon Web Services IAM behavior, EKS Pod Identity associations
  /// are eventually consistent, and may take several seconds to be effective
  /// after the initial API call returns successfully. You must design your
  /// applications to account for these potential delays. We recommend that you
  /// don’t include association create/updates in the critical,
  /// high-availability code paths of your application. Instead, make changes in
  /// a separate initialization or setup routine that you run less frequently.
  ///
  /// You can set a <i>target IAM role</i> in the same or a different account
  /// for advanced scenarios. With a target role, EKS Pod Identity automatically
  /// performs two role assumptions in sequence: first assuming the role in the
  /// association that is in this account, then using those credentials to
  /// assume the target IAM role. This process provides your Pod with temporary
  /// credentials that have the permissions defined in the target role, allowing
  /// secure access to resources in another Amazon Web Services account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster to create the EKS Pod Identity association in.
  ///
  /// Parameter [namespace] :
  /// The name of the Kubernetes namespace inside the cluster to create the EKS
  /// Pod Identity association in. The service account and the Pods that use the
  /// service account must be in this namespace.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the
  /// service account. The EKS Pod Identity agent manages credentials to assume
  /// this role for applications in the containers in the Pods that use this
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
  /// Parameter [disableSessionTags] :
  /// Disable the automatic sessions tags that are appended by EKS Pod Identity.
  ///
  /// EKS Pod Identity adds a pre-defined set of session tags when it assumes
  /// the role. You can use these tags to author a single role that can work
  /// across resources by allowing access to Amazon Web Services resources based
  /// on matching tags. By default, EKS Pod Identity attaches six tags,
  /// including tags for cluster name, namespace, and service account name. For
  /// the list of tags added by EKS Pod Identity, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-id-abac.html#pod-id-abac-tags">List
  /// of session tags added by EKS Pod Identity</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Amazon Web Services compresses inline session policies, managed policy
  /// ARNs, and session tags into a packed binary format that has a separate
  /// limit. If you receive a <code>PackedPolicyTooLarge</code> error indicating
  /// the packed binary format has exceeded the size limit, you can attempt to
  /// reduce the size by disabling the session tags added by EKS Pod Identity.
  ///
  /// Parameter [policy] :
  /// An optional IAM policy in JSON format (as an escaped string) that applies
  /// additional restrictions to this pod identity association beyond the IAM
  /// policies attached to the IAM role. This policy is applied as the
  /// intersection of the role's policies and this policy, allowing you to
  /// reduce the permissions that applications in the pods can use. Use this
  /// policy to enforce least privilege access while still leveraging a shared
  /// IAM role across multiple applications.
  ///
  /// <b>Important considerations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Session tags:</b> When using this policy,
  /// <code>disableSessionTags</code> must be set to <code>true</code>.
  /// </li>
  /// <li>
  /// <b>Target role permissions:</b> If you specify both a
  /// <code>TargetRoleArn</code> and a policy, the policy restrictions apply
  /// only to the target role's permissions, not to the initial role used for
  /// assuming the target role.
  /// </li>
  /// </ul>
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
  ///
  /// Parameter [targetRoleArn] :
  /// The Amazon Resource Name (ARN) of the target IAM role to associate with
  /// the service account. This role is assumed by using the EKS Pod Identity
  /// association role, then the credentials for this role are injected into the
  /// Pod.
  ///
  /// When you run applications on Amazon EKS, your application might need to
  /// access Amazon Web Services resources from a different role that exists in
  /// the same or different Amazon Web Services account. For example, your
  /// application running in “Account A” might need to access resources, such as
  /// Amazon S3 buckets in “Account B” or within “Account A” itself. You can
  /// create a association to access Amazon Web Services resources in “Account
  /// B” by creating two IAM roles: a role in “Account A” and a role in “Account
  /// B” (which can be the same or different account), each with the necessary
  /// trust and permission policies. After you provide these roles in the <i>IAM
  /// role</i> and <i>Target IAM role</i> fields, EKS will perform role chaining
  /// to ensure your application gets the required permissions. This means Role
  /// A will assume Role B, allowing your Pods to securely access resources like
  /// S3 buckets in the target account.
  Future<CreatePodIdentityAssociationResponse> createPodIdentityAssociation({
    required String clusterName,
    required String namespace,
    required String roleArn,
    required String serviceAccount,
    String? clientRequestToken,
    bool? disableSessionTags,
    String? policy,
    Map<String, String>? tags,
    String? targetRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'namespace': namespace,
      'roleArn': roleArn,
      'serviceAccount': serviceAccount,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (disableSessionTags != null) 'disableSessionTags': disableSessionTags,
      if (policy != null) 'policy': policy,
      if (tags != null) 'tags': tags,
      if (targetRoleArn != null) 'targetRoleArn': targetRoleArn,
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
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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

  /// Deletes a managed capability from your Amazon EKS cluster. When you delete
  /// a capability, Amazon EKS removes the capability infrastructure but retains
  /// all resources that were managed by the capability.
  ///
  /// Before deleting a capability, you should delete all Kubernetes resources
  /// that were created by the capability. After the capability is deleted,
  /// these resources become difficult to manage because the controller that
  /// managed them is no longer available. To delete resources before removing
  /// the capability, use <code>kubectl delete</code> or remove them through
  /// your GitOps workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [capabilityName] :
  /// The name of the capability to delete.
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that contains the capability you want
  /// to delete.
  Future<DeleteCapabilityResponse> deleteCapability({
    required String capabilityName,
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/capabilities/${Uri.encodeComponent(capabilityName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCapabilityResponse.fromJson(response);
  }

  /// Deletes an Amazon EKS cluster control plane.
  ///
  /// If you have active services and ingress resources in your cluster that are
  /// associated with a load balancer, you must delete those services before
  /// deleting the cluster so that the load balancers are deleted properly.
  /// Otherwise, you can have orphaned resources in your VPC that prevent you
  /// from being able to delete the VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html">Deleting
  /// a cluster</a> in the <i>Amazon EKS User Guide</i>.
  ///
  /// If you have managed node groups or Fargate profiles attached to the
  /// cluster, you must delete them first. For more information, see
  /// <code>DeleteNodgroup</code> and <code>DeleteFargateProfile</code>.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
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
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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

  /// Returns detailed information about a specific managed capability in your
  /// Amazon EKS cluster, including its current status, configuration, health
  /// information, and any issues that may be affecting its operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [capabilityName] :
  /// The name of the capability to describe.
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that contains the capability you want
  /// to describe.
  Future<DescribeCapabilityResponse> describeCapability({
    required String capabilityName,
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/capabilities/${Uri.encodeComponent(capabilityName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCapabilityResponse.fromJson(response);
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
  /// May throw [ClientException].
  /// May throw [ResourceNotFoundException].
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

  /// Lists available Kubernetes versions for Amazon EKS clusters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterType] :
  /// The type of cluster to filter versions by.
  ///
  /// Parameter [clusterVersions] :
  /// List of specific cluster versions to describe.
  ///
  /// Parameter [defaultOnly] :
  /// Filter to show only default versions.
  ///
  /// Parameter [includeAll] :
  /// Include all available versions in the response.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Pagination token for the next set of results.
  ///
  /// Parameter [status] :
  /// <important>
  /// This field is deprecated. Use <code>versionStatus</code> instead, as that
  /// field matches for input and output of this action.
  /// </important>
  /// Filter versions by their current status.
  ///
  /// Parameter [versionStatus] :
  /// Filter versions by their current status.
  Future<DescribeClusterVersionsResponse> describeClusterVersions({
    String? clusterType,
    List<String>? clusterVersions,
    bool? defaultOnly,
    bool? includeAll,
    int? maxResults,
    String? nextToken,
    ClusterVersionStatus? status,
    VersionStatus? versionStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (clusterType != null) 'clusterType': [clusterType],
      if (clusterVersions != null) 'clusterVersions': clusterVersions,
      if (defaultOnly != null) 'defaultOnly': [defaultOnly.toString()],
      if (includeAll != null) 'includeAll': [includeAll.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
      if (versionStatus != null) 'versionStatus': [versionStatus.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cluster-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClusterVersionsResponse.fromJson(response);
  }

  /// Returns descriptive information about a subscription.
  ///
  /// May throw [ClientException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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

  /// Returns the status of the latest on-demand cluster insights refresh
  /// operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster associated with the insights refresh operation.
  Future<DescribeInsightsRefreshResponse> describeInsightsRefresh({
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/insights-refresh',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInsightsRefreshResponse.fromJson(response);
  }

  /// Describes a managed node group.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// When the status of the update is <code>Successful</code>, the update is
  /// complete. If an update fails, the status is <code>Failed</code>, and an
  /// error detail explains the reason for the failure.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// Parameter [capabilityName] :
  /// The name of the capability for which you want to describe updates.
  ///
  /// Parameter [nodegroupName] :
  /// The name of the Amazon EKS node group associated with the update. This
  /// parameter is required if the update is a node group update.
  Future<DescribeUpdateResponse> describeUpdate({
    required String name,
    required String updateId,
    String? addonName,
    String? capabilityName,
    String? nodegroupName,
  }) async {
    final $query = <String, List<String>>{
      if (addonName != null) 'addonName': [addonName],
      if (capabilityName != null) 'capabilityName': [capabilityName],
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
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
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
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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

  /// Lists all managed capabilities in your Amazon EKS cluster. You can use
  /// this operation to get an overview of all capabilities and their current
  /// status.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster for which you want to list
  /// capabilities.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>nextToken</code> value. If you don't specify a value, the default is
  /// 100 results.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// request, where <code>maxResults</code> was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the <code>nextToken</code> value. This
  /// value is null when there are no more results to return.
  Future<ListCapabilitiesResponse> listCapabilities({
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
      requestUri: '/clusters/${Uri.encodeComponent(clusterName)}/capabilities',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCapabilitiesResponse.fromJson(response);
  }

  /// Lists the Amazon EKS clusters in your Amazon Web Services account in the
  /// specified Amazon Web Services Region.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
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
        'includeStatus': includeStatus.map((e) => e.value).toList(),
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
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
  /// Kubernetes version, and status. The default filter lists all categories
  /// and every status.
  ///
  /// The following lists the available categories:
  ///
  /// <ul>
  /// <li>
  /// <code>UPGRADE_READINESS</code>: Amazon EKS identifies issues that could
  /// impact your ability to upgrade to new versions of Kubernetes. These are
  /// called upgrade insights.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURATION</code>: Amazon EKS identifies misconfiguration in
  /// your EKS Hybrid Nodes setup that could impair functionality of your
  /// cluster or workloads. These are called configuration insights.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon EKS cluster to list updates for.
  ///
  /// Parameter [addonName] :
  /// The names of the installed add-ons that have available updates.
  ///
  /// Parameter [capabilityName] :
  /// The name of the capability for which you want to list updates.
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
    String? capabilityName,
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
      if (capabilityName != null) 'capabilityName': [capabilityName],
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
  /// Cluster connection requires two steps. First, send a <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_RegisterClusterRequest.html">
  /// <code>RegisterClusterRequest</code> </a> to add it to the Amazon EKS
  /// control plane.
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
  /// May throw [AccessDeniedException].
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ResourcePropagationDelayException].
  /// May throw [ServerException].
  /// May throw [ServiceUnavailableException].
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

  /// Initiates an on-demand refresh operation for cluster insights, getting the
  /// latest analysis outside of the standard refresh schedule.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [clusterName] :
  /// The name of the cluster for the refresh insights operation.
  Future<StartInsightsRefreshResponse> startInsightsRefresh({
    required String clusterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/insights-refresh',
      exceptionFnMap: _exceptionFns,
    );
    return StartInsightsRefreshResponse.fromJson(response);
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
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
  /// An array of EKS Pod Identity associations to be updated. Each association
  /// maps a Kubernetes service account to an IAM role. If this value is left
  /// blank, no change. If an empty array is provided, existing associations
  /// owned by the add-on are deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using EKS Pod Identity</a> in the
  /// <i>Amazon EKS User Guide</i>.
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
      if (resolveConflicts != null) 'resolveConflicts': resolveConflicts.value,
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

  /// Updates the configuration of a managed capability in your Amazon EKS
  /// cluster. You can update the IAM role, configuration settings, and delete
  /// propagation policy for a capability.
  ///
  /// When you update a capability, Amazon EKS applies the changes and may
  /// restart capability components as needed. The capability remains available
  /// during the update process, but some operations may be temporarily
  /// unavailable.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [capabilityName] :
  /// The name of the capability to update configuration for.
  ///
  /// Parameter [clusterName] :
  /// The name of the Amazon EKS cluster that contains the capability you want
  /// to update configuration for.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token is valid for 24 hours after
  /// creation.
  ///
  /// Parameter [configuration] :
  /// The updated configuration settings for the capability. You only need to
  /// specify the configuration parameters you want to change. For Argo CD
  /// capabilities, you can update RBAC role mappings and network access
  /// settings.
  ///
  /// Parameter [deletePropagationPolicy] :
  /// The updated delete propagation policy for the capability. Currently, the
  /// only supported value is <code>RETAIN</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that the capability uses to
  /// interact with Amazon Web Services services. If you specify a new role ARN,
  /// the capability will start using the new role for all subsequent
  /// operations.
  Future<UpdateCapabilityResponse> updateCapability({
    required String capabilityName,
    required String clusterName,
    String? clientRequestToken,
    UpdateCapabilityConfiguration? configuration,
    CapabilityDeletePropagationPolicy? deletePropagationPolicy,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
      if (deletePropagationPolicy != null)
        'deletePropagationPolicy': deletePropagationPolicy.value,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/clusters/${Uri.encodeComponent(clusterName)}/capabilities/${Uri.encodeComponent(capabilityName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCapabilityResponse.fromJson(response);
  }

  /// Updates an Amazon EKS cluster configuration. Your cluster continues to
  /// function during the update. The response output includes an update ID that
  /// you can use to track the status of your cluster update with
  /// <code>DescribeUpdate</code>.
  ///
  /// You can use this operation to do the following actions:
  ///
  /// <ul>
  /// <li>
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
  /// </note> </li>
  /// <li>
  /// You can also use this API operation to enable or disable public and
  /// private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">
  /// Cluster API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// </li>
  /// <li>
  /// You can also use this API operation to choose different subnets and
  /// security groups for the cluster. You must specify at least two subnets
  /// that are in different Availability Zones. You can't change which VPC the
  /// subnets are from, the subnets must be in the same VPC as the subnets that
  /// the cluster was created with. For more information about the VPC
  /// requirements, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html">https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html</a>
  /// in the <i> <i>Amazon EKS User Guide</i> </i>.
  /// </li>
  /// <li>
  /// You can also use this API operation to enable or disable ARC zonal shift.
  /// If zonal shift is enabled, Amazon Web Services configures zonal autoshift
  /// for the cluster.
  /// </li>
  /// <li>
  /// You can also use this API operation to add, change, or remove the
  /// configuration in the cluster for EKS Hybrid Nodes. To remove the
  /// configuration, use the <code>remoteNetworkConfig</code> key with an object
  /// containing both subkeys with empty arrays for each. Here is an inline
  /// example: <code>"remoteNetworkConfig": { "remoteNodeNetworks": \[\],
  /// "remotePodNetworks": \[\] }</code>.
  /// </li>
  /// </ul>
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to
  /// <code>UPDATING</code> (this status transition is eventually consistent).
  /// When the update is complete (either <code>Failed</code> or
  /// <code>Successful</code>), the cluster status moves to <code>Active</code>.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
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
  /// Parameter [computeConfig] :
  /// Update the configuration of the compute capability of your EKS Auto Mode
  /// cluster. For example, enable the capability.
  ///
  /// Parameter [controlPlaneScalingConfig] :
  /// The control plane scaling tier configuration. For more information, see
  /// EKS Provisioned Control Plane in the Amazon EKS User Guide.
  ///
  /// Parameter [deletionProtection] :
  /// Specifies whether to enable or disable deletion protection for the
  /// cluster. When enabled (<code>true</code>), the cluster cannot be deleted
  /// until deletion protection is explicitly disabled. When disabled
  /// (<code>false</code>), the cluster can be deleted normally.
  ///
  /// Parameter [logging] :
  /// Enable or disable exporting the Kubernetes control plane logs for your
  /// cluster to CloudWatch Logs . By default, cluster control plane logs aren't
  /// exported to CloudWatch Logs . For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon
  /// EKS cluster control plane logs</a> in the <i> <i>Amazon EKS User Guide</i>
  /// </i>.
  /// <note>
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see <a
  /// href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing</a>.
  /// </note>
  ///
  /// Parameter [storageConfig] :
  /// Update the configuration of the block storage capability of your EKS Auto
  /// Mode cluster. For example, enable the capability.
  ///
  /// Parameter [upgradePolicy] :
  /// You can enable or disable extended support for clusters currently on
  /// standard support. You cannot disable extended support once it starts. You
  /// must enable extended support before your cluster exits standard support.
  ///
  /// Parameter [zonalShiftConfig] :
  /// Enable or disable ARC zonal shift for the cluster. If zonal shift is
  /// enabled, Amazon Web Services configures zonal autoshift for the cluster.
  ///
  /// Zonal shift is a feature of Amazon Application Recovery Controller (ARC).
  /// ARC zonal shift is designed to be a temporary measure that allows you to
  /// move traffic for a resource away from an impaired AZ until the zonal shift
  /// expires or you cancel it. You can extend the zonal shift if necessary.
  ///
  /// You can start a zonal shift for an EKS cluster, or you can allow Amazon
  /// Web Services to do it for you by enabling <i>zonal autoshift</i>. This
  /// shift updates the flow of east-to-west network traffic in your cluster to
  /// only consider network endpoints for Pods running on worker nodes in
  /// healthy AZs. Additionally, any ALB or NLB handling ingress traffic for
  /// applications in your EKS cluster will automatically route traffic to
  /// targets in the healthy AZs. For more information about zonal shift in EKS,
  /// see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/zone-shift.html">Learn
  /// about Amazon Application Recovery Controller (ARC) Zonal Shift in Amazon
  /// EKS</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  Future<UpdateClusterConfigResponse> updateClusterConfig({
    required String name,
    UpdateAccessConfigRequest? accessConfig,
    String? clientRequestToken,
    ComputeConfigRequest? computeConfig,
    ControlPlaneScalingConfig? controlPlaneScalingConfig,
    bool? deletionProtection,
    KubernetesNetworkConfigRequest? kubernetesNetworkConfig,
    Logging? logging,
    RemoteNetworkConfigRequest? remoteNetworkConfig,
    VpcConfigRequest? resourcesVpcConfig,
    StorageConfigRequest? storageConfig,
    UpgradePolicyRequest? upgradePolicy,
    ZonalShiftConfigRequest? zonalShiftConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (accessConfig != null) 'accessConfig': accessConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (computeConfig != null) 'computeConfig': computeConfig,
      if (controlPlaneScalingConfig != null)
        'controlPlaneScalingConfig': controlPlaneScalingConfig,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (kubernetesNetworkConfig != null)
        'kubernetesNetworkConfig': kubernetesNetworkConfig,
      if (logging != null) 'logging': logging,
      if (remoteNetworkConfig != null)
        'remoteNetworkConfig': remoteNetworkConfig,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
      if (storageConfig != null) 'storageConfig': storageConfig,
      if (upgradePolicy != null) 'upgradePolicy': upgradePolicy,
      if (zonalShiftConfig != null) 'zonalShiftConfig': zonalShiftConfig,
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
  /// update with the <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeUpdate.html">
  /// <code>DescribeUpdate</code> </a> API operation.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to
  /// <code>UPDATING</code> (this status transition is eventually consistent).
  /// When the update is complete (either <code>Failed</code> or
  /// <code>Successful</code>), the cluster status moves to <code>Active</code>.
  ///
  /// If your cluster has managed node groups attached to it, all of your node
  /// groups' Kubernetes versions must match the cluster's Kubernetes version in
  /// order to update the cluster to a new Kubernetes version.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
  /// May throw [ThrottlingException].
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
  ///
  /// Parameter [force] :
  /// Set this value to <code>true</code> to override upgrade-blocking readiness
  /// checks when updating a cluster.
  Future<UpdateClusterVersionResponse> updateClusterVersion({
    required String name,
    required String version,
    String? clientRequestToken,
    bool? force,
  }) async {
    final $payload = <String, dynamic>{
      'version': version,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (force != null) 'force': force,
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// with the <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_DescribeUpdate.html">
  /// <code>DescribeUpdate</code> </a> API operation. You can update the
  /// Kubernetes labels and taints for a node group and the scaling and version
  /// update configuration.
  ///
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// Parameter [nodeRepairConfig] :
  /// The node auto repair configuration for the node group.
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
  ///
  /// Parameter [warmPoolConfig] :
  /// The warm pool configuration to apply to the node group. You can use this
  /// to add a warm pool to an existing node group or modify the settings of an
  /// existing warm pool.
  Future<UpdateNodegroupConfigResponse> updateNodegroupConfig({
    required String clusterName,
    required String nodegroupName,
    String? clientRequestToken,
    UpdateLabelsPayload? labels,
    NodeRepairConfig? nodeRepairConfig,
    NodegroupScalingConfig? scalingConfig,
    UpdateTaintsPayload? taints,
    NodegroupUpdateConfig? updateConfig,
    WarmPoolConfig? warmPoolConfig,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (labels != null) 'labels': labels,
      if (nodeRepairConfig != null) 'nodeRepairConfig': nodeRepairConfig,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
      if (warmPoolConfig != null) 'warmPoolConfig': warmPoolConfig,
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
  /// was originally deployed with a launch template. Additionally, the launch
  /// template ID or name must match what was used when the node group was
  /// created. You can update the launch template version with necessary
  /// changes.
  ///
  /// If you need to update a custom AMI in a node group that was deployed with
  /// a launch template, then update your custom AMI, specify the new ID in a
  /// new version of the launch template, and then update the node group to the
  /// new version of the launch template.
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
  /// May throw [ClientException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// originally deployed with a launch template. When updating, you must
  /// specify the same launch template ID or name that was used to create the
  /// node group.
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
  /// node group will be updated to match the cluster's current Kubernetes
  /// version, and the latest available AMI for that version will be used. You
  /// can also specify the Kubernetes version of the cluster to update the node
  /// group to the latest AMI version of the cluster's Kubernetes version. If
  /// you specify <code>launchTemplate</code>, and your launch template uses a
  /// custom AMI, then don't specify <code>version</code>, or the node group
  /// update will fail. For more information about using launch templates with
  /// Amazon EKS, see <a
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

  /// Updates a EKS Pod Identity association. In an update, you can change the
  /// IAM role, the target IAM role, or <code>disableSessionTags</code>. You
  /// must change at least one of these in an update. An association can't be
  /// moved between clusters, namespaces, or service accounts. If you need to
  /// edit the namespace or service account, you need to delete the association
  /// and then create a new association with your desired settings.
  ///
  /// Similar to Amazon Web Services IAM behavior, EKS Pod Identity associations
  /// are eventually consistent, and may take several seconds to be effective
  /// after the initial API call returns successfully. You must design your
  /// applications to account for these potential delays. We recommend that you
  /// don’t include association create/updates in the critical,
  /// high-availability code paths of your application. Instead, make changes in
  /// a separate initialization or setup routine that you run less frequently.
  ///
  /// You can set a <i>target IAM role</i> in the same or a different account
  /// for advanced scenarios. With a target role, EKS Pod Identity automatically
  /// performs two role assumptions in sequence: first assuming the role in the
  /// association that is in this account, then using those credentials to
  /// assume the target IAM role. This process provides your Pod with temporary
  /// credentials that have the permissions defined in the target role, allowing
  /// secure access to resources in another Amazon Web Services account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServerException].
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
  /// Parameter [disableSessionTags] :
  /// Disable the automatic sessions tags that are appended by EKS Pod Identity.
  ///
  /// EKS Pod Identity adds a pre-defined set of session tags when it assumes
  /// the role. You can use these tags to author a single role that can work
  /// across resources by allowing access to Amazon Web Services resources based
  /// on matching tags. By default, EKS Pod Identity attaches six tags,
  /// including tags for cluster name, namespace, and service account name. For
  /// the list of tags added by EKS Pod Identity, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-id-abac.html#pod-id-abac-tags">List
  /// of session tags added by EKS Pod Identity</a> in the <i>Amazon EKS User
  /// Guide</i>.
  ///
  /// Amazon Web Services compresses inline session policies, managed policy
  /// ARNs, and session tags into a packed binary format that has a separate
  /// limit. If you receive a <code>PackedPolicyTooLarge</code> error indicating
  /// the packed binary format has exceeded the size limit, you can attempt to
  /// reduce the size by disabling the session tags added by EKS Pod Identity.
  ///
  /// Parameter [policy] :
  /// An optional IAM policy in JSON format (as an escaped string) that applies
  /// additional restrictions to this pod identity association beyond the IAM
  /// policies attached to the IAM role. This policy is applied as the
  /// intersection of the role's policies and this policy, allowing you to
  /// reduce the permissions that applications in the pods can use. Use this
  /// policy to enforce least privilege access while still leveraging a shared
  /// IAM role across multiple applications.
  ///
  /// <b>Important considerations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Session tags:</b> When using this policy,
  /// <code>disableSessionTags</code> must be set to <code>true</code>.
  /// </li>
  /// <li>
  /// <b>Target role permissions:</b> If you specify both a
  /// <code>TargetRoleArn</code> and a policy, the policy restrictions apply
  /// only to the target role's permissions, not to the initial role used for
  /// assuming the target role.
  /// </li>
  /// </ul>
  ///
  /// Parameter [roleArn] :
  /// The new IAM role to change in the association.
  ///
  /// Parameter [targetRoleArn] :
  /// The Amazon Resource Name (ARN) of the target IAM role to associate with
  /// the service account. This role is assumed by using the EKS Pod Identity
  /// association role, then the credentials for this role are injected into the
  /// Pod.
  ///
  /// When you run applications on Amazon EKS, your application might need to
  /// access Amazon Web Services resources from a different role that exists in
  /// the same or different Amazon Web Services account. For example, your
  /// application running in “Account A” might need to access resources, such as
  /// buckets in “Account B” or within “Account A” itself. You can create a
  /// association to access Amazon Web Services resources in “Account B” by
  /// creating two IAM roles: a role in “Account A” and a role in “Account B”
  /// (which can be the same or different account), each with the necessary
  /// trust and permission policies. After you provide these roles in the <i>IAM
  /// role</i> and <i>Target IAM role</i> fields, EKS will perform role chaining
  /// to ensure your application gets the required permissions. This means Role
  /// A will assume Role B, allowing your Pods to securely access resources like
  /// S3 buckets in the target account.
  Future<UpdatePodIdentityAssociationResponse> updatePodIdentityAssociation({
    required String associationId,
    required String clusterName,
    String? clientRequestToken,
    bool? disableSessionTags,
    String? policy,
    String? roleArn,
    String? targetRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (disableSessionTags != null) 'disableSessionTags': disableSessionTags,
      if (policy != null) 'policy': policy,
      if (roleArn != null) 'roleArn': roleArn,
      if (targetRoleArn != null) 'targetRoleArn': targetRoleArn,
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class CreateCapabilityResponse {
  /// An object containing information about the newly created capability,
  /// including its name, ARN, status, and configuration.
  final Capability? capability;

  CreateCapabilityResponse({
    this.capability,
  });

  factory CreateCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return CreateCapabilityResponse(
      capability: json['capability'] != null
          ? Capability.fromJson(json['capability'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capability = this.capability;
    return {
      if (capability != null) 'capability': capability,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class DeleteAccessEntryResponse {
  DeleteAccessEntryResponse();

  factory DeleteAccessEntryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessEntryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class DeleteCapabilityResponse {
  /// An object containing information about the deleted capability, including its
  /// final status and configuration.
  final Capability? capability;

  DeleteCapabilityResponse({
    this.capability,
  });

  factory DeleteCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCapabilityResponse(
      capability: json['capability'] != null
          ? Capability.fromJson(json['capability'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capability = this.capability;
    return {
      if (capability != null) 'capability': capability,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

  /// The Kubernetes service account name used by the add-on, and any suggested
  /// IAM policies. Use this information to create an IAM Role for the add-on.
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class DescribeCapabilityResponse {
  /// An object containing detailed information about the capability, including
  /// its name, ARN, type, status, version, configuration, health status, and
  /// timestamps for when it was created and last modified.
  final Capability? capability;

  DescribeCapabilityResponse({
    this.capability,
  });

  factory DescribeCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCapabilityResponse(
      capability: json['capability'] != null
          ? Capability.fromJson(json['capability'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capability = this.capability;
    return {
      if (capability != null) 'capability': capability,
    };
  }
}

/// @nodoc
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

/// @nodoc
class DescribeClusterVersionsResponse {
  /// List of cluster version information objects.
  final List<ClusterVersionInformation>? clusterVersions;

  /// Pagination token for the next set of results.
  final String? nextToken;

  DescribeClusterVersionsResponse({
    this.clusterVersions,
    this.nextToken,
  });

  factory DescribeClusterVersionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeClusterVersionsResponse(
      clusterVersions: (json['clusterVersions'] as List?)
          ?.nonNulls
          .map((e) =>
              ClusterVersionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterVersions = this.clusterVersions;
    final nextToken = this.nextToken;
    return {
      if (clusterVersions != null) 'clusterVersions': clusterVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class DescribeInsightsRefreshResponse {
  /// The date and time when the insights refresh operation ended.
  final DateTime? endedAt;

  /// The message associated with the insights refresh operation.
  final String? message;

  /// The date and time when the insights refresh operation started.
  final DateTime? startedAt;

  /// The current status of the insights refresh operation.
  final InsightsRefreshStatus? status;

  DescribeInsightsRefreshResponse({
    this.endedAt,
    this.message,
    this.startedAt,
    this.status,
  });

  factory DescribeInsightsRefreshResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInsightsRefreshResponse(
      endedAt: timeStampFromJson(json['endedAt']),
      message: json['message'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      status:
          (json['status'] as String?)?.let(InsightsRefreshStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endedAt = this.endedAt;
    final message = this.message;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (message != null) 'message': message,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class DisassociateAccessPolicyResponse {
  DisassociateAccessPolicyResponse();

  factory DisassociateAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateAccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      addons:
          (json['addons'] as List?)?.nonNulls.map((e) => e as String).toList(),
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ListCapabilitiesResponse {
  /// A list of capability summary objects, each containing basic information
  /// about a capability including its name, ARN, type, status, version, and
  /// timestamps.
  final List<CapabilitySummary>? capabilities;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListCapabilities</code> request. When the results of a
  /// <code>ListCapabilities</code> request exceed <code>maxResults</code>, you
  /// can use this value to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListCapabilitiesResponse({
    this.capabilities,
    this.nextToken,
  });

  factory ListCapabilitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListCapabilitiesResponse(
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => CapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final nextToken = this.nextToken;
    return {
      if (capabilities != null) 'capabilities': capabilities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListClustersResponse {
  /// A list of all of the clusters for your account in the specified Amazon Web
  /// Services Region .
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ListPodIdentityAssociationsResponse {
  /// The list of summarized descriptions of the associations that are in the
  /// cluster and match any filters that you provided.
  ///
  /// Each summary is simplified by removing these fields compared to the full <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_PodIdentityAssociation.html">
  /// <code>PodIdentityAssociation</code> </a>:
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class StartInsightsRefreshResponse {
  /// The message associated with the insights refresh operation.
  final String? message;

  /// The current status of the insights refresh operation.
  final InsightsRefreshStatus? status;

  StartInsightsRefreshResponse({
    this.message,
    this.status,
  });

  factory StartInsightsRefreshResponse.fromJson(Map<String, dynamic> json) {
    return StartInsightsRefreshResponse(
      message: json['message'] as String?,
      status:
          (json['status'] as String?)?.let(InsightsRefreshStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final status = this.status;
    return {
      if (message != null) 'message': message,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class UpdateCapabilityResponse {
  final Update? update;

  UpdateCapabilityResponse({
    this.update,
  });

  factory UpdateCapabilityResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCapabilityResponse(
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class UpdatePodIdentityAssociationResponse {
  /// The full description of the association that was updated.
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

/// Amazon EKS Pod Identity associations provide the ability to manage
/// credentials for your applications, similar to the way that Amazon EC2
/// instance profiles provide credentials to Amazon EC2 instances.
///
/// @nodoc
class PodIdentityAssociation {
  /// The Amazon Resource Name (ARN) of the association.
  final String? associationArn;

  /// The ID of the association.
  final String? associationId;

  /// The name of the cluster that the association is in.
  final String? clusterName;

  /// The timestamp that the association was created at.
  final DateTime? createdAt;

  /// The state of the automatic sessions tags. The value of <i>true</i> disables
  /// these tags.
  ///
  /// EKS Pod Identity adds a pre-defined set of session tags when it assumes the
  /// role. You can use these tags to author a single role that can work across
  /// resources by allowing access to Amazon Web Services resources based on
  /// matching tags. By default, EKS Pod Identity attaches six tags, including
  /// tags for cluster name, namespace, and service account name. For the list of
  /// tags added by EKS Pod Identity, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-id-abac.html#pod-id-abac-tags">List
  /// of session tags added by EKS Pod Identity</a> in the <i>Amazon EKS User
  /// Guide</i>.
  final bool? disableSessionTags;

  /// The unique identifier for this EKS Pod Identity association for a target IAM
  /// role. You put this value in the trust policy of the target role, in a
  /// <code>Condition</code> to match the <code>sts.ExternalId</code>. This
  /// ensures that the target role can only be assumed by this association. This
  /// prevents the <i>confused deputy problem</i>. For more information about the
  /// confused deputy problem, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/confused-deputy.html">The
  /// confused deputy problem</a> in the <i>IAM User Guide</i>.
  ///
  /// If you want to use the same target role with multiple associations or other
  /// roles, use independent statements in the trust policy to allow
  /// <code>sts:AssumeRole</code> access from each role.
  final String? externalId;

  /// The most recent timestamp that the association was modified at.
  final DateTime? modifiedAt;

  /// The name of the Kubernetes namespace inside the cluster to create the
  /// association in. The service account and the Pods that use the service
  /// account must be in this namespace.
  final String? namespace;

  /// If defined, the EKS Pod Identity association is owned by an Amazon EKS
  /// add-on.
  final String? ownerArn;

  /// An optional IAM policy in JSON format (as an escaped string) that applies
  /// additional restrictions to this pod identity association beyond the IAM
  /// policies attached to the IAM role. This policy is applied as the
  /// intersection of the role's policies and this policy, allowing you to reduce
  /// the permissions that applications in the pods can use. Use this policy to
  /// enforce least privilege access while still leveraging a shared IAM role
  /// across multiple applications.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the IAM role to associate with the service
  /// account. The EKS Pod Identity agent manages credentials to assume this role
  /// for applications in the containers in the Pods that use this service
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

  /// The Amazon Resource Name (ARN) of the target IAM role to associate with the
  /// service account. This role is assumed by using the EKS Pod Identity
  /// association role, then the credentials for this role are injected into the
  /// Pod.
  final String? targetRoleArn;

  PodIdentityAssociation({
    this.associationArn,
    this.associationId,
    this.clusterName,
    this.createdAt,
    this.disableSessionTags,
    this.externalId,
    this.modifiedAt,
    this.namespace,
    this.ownerArn,
    this.policy,
    this.roleArn,
    this.serviceAccount,
    this.tags,
    this.targetRoleArn,
  });

  factory PodIdentityAssociation.fromJson(Map<String, dynamic> json) {
    return PodIdentityAssociation(
      associationArn: json['associationArn'] as String?,
      associationId: json['associationId'] as String?,
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      disableSessionTags: json['disableSessionTags'] as bool?,
      externalId: json['externalId'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      namespace: json['namespace'] as String?,
      ownerArn: json['ownerArn'] as String?,
      policy: json['policy'] as String?,
      roleArn: json['roleArn'] as String?,
      serviceAccount: json['serviceAccount'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetRoleArn: json['targetRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationArn = this.associationArn;
    final associationId = this.associationId;
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final disableSessionTags = this.disableSessionTags;
    final externalId = this.externalId;
    final modifiedAt = this.modifiedAt;
    final namespace = this.namespace;
    final ownerArn = this.ownerArn;
    final policy = this.policy;
    final roleArn = this.roleArn;
    final serviceAccount = this.serviceAccount;
    final tags = this.tags;
    final targetRoleArn = this.targetRoleArn;
    return {
      if (associationArn != null) 'associationArn': associationArn,
      if (associationId != null) 'associationId': associationId,
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (disableSessionTags != null) 'disableSessionTags': disableSessionTags,
      if (externalId != null) 'externalId': externalId,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (namespace != null) 'namespace': namespace,
      if (ownerArn != null) 'ownerArn': ownerArn,
      if (policy != null) 'policy': policy,
      if (roleArn != null) 'roleArn': roleArn,
      if (serviceAccount != null) 'serviceAccount': serviceAccount,
      if (tags != null) 'tags': tags,
      if (targetRoleArn != null) 'targetRoleArn': targetRoleArn,
    };
  }
}

/// An object representing an asynchronous update.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      params: (json['params'] as List?)
          ?.nonNulls
          .map((e) => UpdateParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.let(UpdateStatus.fromString),
      type: (json['type'] as String?)?.let(UpdateType.fromString),
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
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class UpdateStatus {
  static const inProgress = UpdateStatus._('InProgress');
  static const failed = UpdateStatus._('Failed');
  static const cancelled = UpdateStatus._('Cancelled');
  static const successful = UpdateStatus._('Successful');

  final String value;

  const UpdateStatus._(this.value);

  static const values = [inProgress, failed, cancelled, successful];

  static UpdateStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateStatus._(value));

  @override
  bool operator ==(other) => other is UpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UpdateType {
  static const versionUpdate = UpdateType._('VersionUpdate');
  static const endpointAccessUpdate = UpdateType._('EndpointAccessUpdate');
  static const loggingUpdate = UpdateType._('LoggingUpdate');
  static const configUpdate = UpdateType._('ConfigUpdate');
  static const associateIdentityProviderConfig =
      UpdateType._('AssociateIdentityProviderConfig');
  static const disassociateIdentityProviderConfig =
      UpdateType._('DisassociateIdentityProviderConfig');
  static const associateEncryptionConfig =
      UpdateType._('AssociateEncryptionConfig');
  static const addonUpdate = UpdateType._('AddonUpdate');
  static const vpcConfigUpdate = UpdateType._('VpcConfigUpdate');
  static const accessConfigUpdate = UpdateType._('AccessConfigUpdate');
  static const upgradePolicyUpdate = UpdateType._('UpgradePolicyUpdate');
  static const zonalShiftConfigUpdate = UpdateType._('ZonalShiftConfigUpdate');
  static const autoModeUpdate = UpdateType._('AutoModeUpdate');
  static const remoteNetworkConfigUpdate =
      UpdateType._('RemoteNetworkConfigUpdate');
  static const deletionProtectionUpdate =
      UpdateType._('DeletionProtectionUpdate');
  static const controlPlaneScalingConfigUpdate =
      UpdateType._('ControlPlaneScalingConfigUpdate');
  static const vendedLogsUpdate = UpdateType._('VendedLogsUpdate');

  final String value;

  const UpdateType._(this.value);

  static const values = [
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
    upgradePolicyUpdate,
    zonalShiftConfigUpdate,
    autoModeUpdate,
    remoteNetworkConfigUpdate,
    deletionProtectionUpdate,
    controlPlaneScalingConfigUpdate,
    vendedLogsUpdate
  ];

  static UpdateType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateType._(value));

  @override
  bool operator ==(other) => other is UpdateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an error when an asynchronous operation fails.
///
/// @nodoc
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
      errorCode: (json['errorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final resourceIds = this.resourceIds;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// @nodoc
class ErrorCode {
  static const subnetNotFound = ErrorCode._('SubnetNotFound');
  static const securityGroupNotFound = ErrorCode._('SecurityGroupNotFound');
  static const eniLimitReached = ErrorCode._('EniLimitReached');
  static const ipNotAvailable = ErrorCode._('IpNotAvailable');
  static const accessDenied = ErrorCode._('AccessDenied');
  static const operationNotPermitted = ErrorCode._('OperationNotPermitted');
  static const vpcIdNotFound = ErrorCode._('VpcIdNotFound');
  static const unknown = ErrorCode._('Unknown');
  static const nodeCreationFailure = ErrorCode._('NodeCreationFailure');
  static const podEvictionFailure = ErrorCode._('PodEvictionFailure');
  static const insufficientFreeAddresses =
      ErrorCode._('InsufficientFreeAddresses');
  static const clusterUnreachable = ErrorCode._('ClusterUnreachable');
  static const insufficientNumberOfReplicas =
      ErrorCode._('InsufficientNumberOfReplicas');
  static const configurationConflict = ErrorCode._('ConfigurationConflict');
  static const admissionRequestDenied = ErrorCode._('AdmissionRequestDenied');
  static const unsupportedAddonModification =
      ErrorCode._('UnsupportedAddonModification');
  static const k8sResourceNotFound = ErrorCode._('K8sResourceNotFound');

  final String value;

  const ErrorCode._(this.value);

  static const values = [
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
    k8sResourceNotFound
  ];

  static ErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ErrorCode._(value));

  @override
  bool operator ==(other) => other is ErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the details of an update request.
///
/// @nodoc
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
      type: (json['type'] as String?)?.let(UpdateParamType.fromString),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type.value,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class UpdateParamType {
  static const version = UpdateParamType._('Version');
  static const platformVersion = UpdateParamType._('PlatformVersion');
  static const endpointPrivateAccess =
      UpdateParamType._('EndpointPrivateAccess');
  static const endpointPublicAccess = UpdateParamType._('EndpointPublicAccess');
  static const clusterLogging = UpdateParamType._('ClusterLogging');
  static const desiredSize = UpdateParamType._('DesiredSize');
  static const labelsToAdd = UpdateParamType._('LabelsToAdd');
  static const labelsToRemove = UpdateParamType._('LabelsToRemove');
  static const taintsToAdd = UpdateParamType._('TaintsToAdd');
  static const taintsToRemove = UpdateParamType._('TaintsToRemove');
  static const maxSize = UpdateParamType._('MaxSize');
  static const minSize = UpdateParamType._('MinSize');
  static const releaseVersion = UpdateParamType._('ReleaseVersion');
  static const publicAccessCidrs = UpdateParamType._('PublicAccessCidrs');
  static const launchTemplateName = UpdateParamType._('LaunchTemplateName');
  static const launchTemplateVersion =
      UpdateParamType._('LaunchTemplateVersion');
  static const identityProviderConfig =
      UpdateParamType._('IdentityProviderConfig');
  static const encryptionConfig = UpdateParamType._('EncryptionConfig');
  static const addonVersion = UpdateParamType._('AddonVersion');
  static const serviceAccountRoleArn =
      UpdateParamType._('ServiceAccountRoleArn');
  static const resolveConflicts = UpdateParamType._('ResolveConflicts');
  static const maxUnavailable = UpdateParamType._('MaxUnavailable');
  static const maxUnavailablePercentage =
      UpdateParamType._('MaxUnavailablePercentage');
  static const nodeRepairEnabled = UpdateParamType._('NodeRepairEnabled');
  static const updateStrategy = UpdateParamType._('UpdateStrategy');
  static const configurationValues = UpdateParamType._('ConfigurationValues');
  static const securityGroups = UpdateParamType._('SecurityGroups');
  static const subnets = UpdateParamType._('Subnets');
  static const authenticationMode = UpdateParamType._('AuthenticationMode');
  static const podIdentityAssociations =
      UpdateParamType._('PodIdentityAssociations');
  static const upgradePolicy = UpdateParamType._('UpgradePolicy');
  static const zonalShiftConfig = UpdateParamType._('ZonalShiftConfig');
  static const computeConfig = UpdateParamType._('ComputeConfig');
  static const storageConfig = UpdateParamType._('StorageConfig');
  static const kubernetesNetworkConfig =
      UpdateParamType._('KubernetesNetworkConfig');
  static const remoteNetworkConfig = UpdateParamType._('RemoteNetworkConfig');
  static const deletionProtection = UpdateParamType._('DeletionProtection');
  static const nodeRepairConfig = UpdateParamType._('NodeRepairConfig');
  static const vendedLogs = UpdateParamType._('VendedLogs');
  static const updatedTier = UpdateParamType._('UpdatedTier');
  static const previousTier = UpdateParamType._('PreviousTier');
  static const warmPoolEnabled = UpdateParamType._('WarmPoolEnabled');
  static const warmPoolMaxGroupPreparedCapacity =
      UpdateParamType._('WarmPoolMaxGroupPreparedCapacity');
  static const warmPoolMinSize = UpdateParamType._('WarmPoolMinSize');
  static const warmPoolState = UpdateParamType._('WarmPoolState');
  static const warmPoolReuseOnScaleIn =
      UpdateParamType._('WarmPoolReuseOnScaleIn');

  final String value;

  const UpdateParamType._(this.value);

  static const values = [
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
    nodeRepairEnabled,
    updateStrategy,
    configurationValues,
    securityGroups,
    subnets,
    authenticationMode,
    podIdentityAssociations,
    upgradePolicy,
    zonalShiftConfig,
    computeConfig,
    storageConfig,
    kubernetesNetworkConfig,
    remoteNetworkConfig,
    deletionProtection,
    nodeRepairConfig,
    vendedLogs,
    updatedTier,
    previousTier,
    warmPoolEnabled,
    warmPoolMaxGroupPreparedCapacity,
    warmPoolMinSize,
    warmPoolState,
    warmPoolReuseOnScaleIn
  ];

  static UpdateParamType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateParamType._(value));

  @override
  bool operator ==(other) => other is UpdateParamType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
///
/// @nodoc
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  ///
  /// You must specify either the launch template ID or the launch template name
  /// in the request, but not both. After node group creation, you cannot use a
  /// different ID.
  final String? id;

  /// The name of the launch template.
  ///
  /// You must specify either the launch template name or the launch template ID
  /// in the request, but not both. After node group creation, you cannot use a
  /// different name.
  final String? name;

  /// The version number of the launch template to use. If no version is
  /// specified, then the template's default version is used. You can use a
  /// different version for node group updates.
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

/// An object representing a Kubernetes <code>label</code> change for a managed
/// node group.
///
/// @nodoc
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

/// An object representing the details of an update to a taints payload. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
/// taints on managed node groups</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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

/// An object representing the scaling configuration details for the Auto
/// Scaling group that is associated with your node group. When creating a node
/// group, you must specify all or none of the properties. When updating a node
/// group, you can specify any or none of the properties.
///
/// @nodoc
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

/// The node group update configuration. An Amazon EKS managed node group
/// updates by replacing nodes with new nodes of newer AMI versions in parallel.
/// You choose the <i>maximum unavailable</i> and the <i>update strategy</i>.
///
/// @nodoc
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

  /// The configuration for the behavior to follow during a node group version
  /// update of this managed node group. You choose between two possible
  /// strategies for replacing nodes during an <a
  /// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_UpdateNodegroupVersion.html">
  /// <code>UpdateNodegroupVersion</code> </a> action.
  ///
  /// An Amazon EKS managed node group updates by replacing nodes with new nodes
  /// of newer AMI versions in parallel. The <i>update strategy</i> changes the
  /// managed node update behavior of the managed node group for each quantity.
  /// The <i>default</i> strategy has guardrails to protect you from
  /// misconfiguration and launches the new instances first, before terminating
  /// the old instances. The <i>minimal</i> strategy removes the guardrails and
  /// terminates the old instances before launching the new instances. This
  /// minimal strategy is useful in scenarios where you are constrained to
  /// resources or costs (for example, with hardware accelerators such as GPUs).
  final NodegroupUpdateStrategies? updateStrategy;

  NodegroupUpdateConfig({
    this.maxUnavailable,
    this.maxUnavailablePercentage,
    this.updateStrategy,
  });

  factory NodegroupUpdateConfig.fromJson(Map<String, dynamic> json) {
    return NodegroupUpdateConfig(
      maxUnavailable: json['maxUnavailable'] as int?,
      maxUnavailablePercentage: json['maxUnavailablePercentage'] as int?,
      updateStrategy: (json['updateStrategy'] as String?)
          ?.let(NodegroupUpdateStrategies.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final maxUnavailable = this.maxUnavailable;
    final maxUnavailablePercentage = this.maxUnavailablePercentage;
    final updateStrategy = this.updateStrategy;
    return {
      if (maxUnavailable != null) 'maxUnavailable': maxUnavailable,
      if (maxUnavailablePercentage != null)
        'maxUnavailablePercentage': maxUnavailablePercentage,
      if (updateStrategy != null) 'updateStrategy': updateStrategy.value,
    };
  }
}

/// The node auto repair configuration for the node group.
///
/// @nodoc
class NodeRepairConfig {
  /// Specifies whether to enable node auto repair for the node group. Node auto
  /// repair is disabled by default.
  final bool? enabled;

  /// Specify the maximum number of nodes that can be repaired concurrently or in
  /// parallel, expressed as a count of unhealthy nodes. This gives you
  /// finer-grained control over the pace of node replacements. When using this,
  /// you cannot also set <code>maxParallelNodesRepairedPercentage</code> at the
  /// same time.
  final int? maxParallelNodesRepairedCount;

  /// Specify the maximum number of nodes that can be repaired concurrently or in
  /// parallel, expressed as a percentage of unhealthy nodes. This gives you
  /// finer-grained control over the pace of node replacements. When using this,
  /// you cannot also set <code>maxParallelNodesRepairedCount</code> at the same
  /// time.
  final int? maxParallelNodesRepairedPercentage;

  /// Specify a count threshold of unhealthy nodes, above which node auto repair
  /// actions will stop. When using this, you cannot also set
  /// <code>maxUnhealthyNodeThresholdPercentage</code> at the same time.
  final int? maxUnhealthyNodeThresholdCount;

  /// Specify a percentage threshold of unhealthy nodes, above which node auto
  /// repair actions will stop. When using this, you cannot also set
  /// <code>maxUnhealthyNodeThresholdCount</code> at the same time.
  final int? maxUnhealthyNodeThresholdPercentage;

  /// Specify granular overrides for specific repair actions. These overrides
  /// control the repair action and the repair delay time before a node is
  /// considered eligible for repair. If you use this, you must specify all the
  /// values.
  final List<NodeRepairConfigOverrides>? nodeRepairConfigOverrides;

  NodeRepairConfig({
    this.enabled,
    this.maxParallelNodesRepairedCount,
    this.maxParallelNodesRepairedPercentage,
    this.maxUnhealthyNodeThresholdCount,
    this.maxUnhealthyNodeThresholdPercentage,
    this.nodeRepairConfigOverrides,
  });

  factory NodeRepairConfig.fromJson(Map<String, dynamic> json) {
    return NodeRepairConfig(
      enabled: json['enabled'] as bool?,
      maxParallelNodesRepairedCount:
          json['maxParallelNodesRepairedCount'] as int?,
      maxParallelNodesRepairedPercentage:
          json['maxParallelNodesRepairedPercentage'] as int?,
      maxUnhealthyNodeThresholdCount:
          json['maxUnhealthyNodeThresholdCount'] as int?,
      maxUnhealthyNodeThresholdPercentage:
          json['maxUnhealthyNodeThresholdPercentage'] as int?,
      nodeRepairConfigOverrides: (json['nodeRepairConfigOverrides'] as List?)
          ?.nonNulls
          .map((e) =>
              NodeRepairConfigOverrides.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final maxParallelNodesRepairedCount = this.maxParallelNodesRepairedCount;
    final maxParallelNodesRepairedPercentage =
        this.maxParallelNodesRepairedPercentage;
    final maxUnhealthyNodeThresholdCount = this.maxUnhealthyNodeThresholdCount;
    final maxUnhealthyNodeThresholdPercentage =
        this.maxUnhealthyNodeThresholdPercentage;
    final nodeRepairConfigOverrides = this.nodeRepairConfigOverrides;
    return {
      if (enabled != null) 'enabled': enabled,
      if (maxParallelNodesRepairedCount != null)
        'maxParallelNodesRepairedCount': maxParallelNodesRepairedCount,
      if (maxParallelNodesRepairedPercentage != null)
        'maxParallelNodesRepairedPercentage':
            maxParallelNodesRepairedPercentage,
      if (maxUnhealthyNodeThresholdCount != null)
        'maxUnhealthyNodeThresholdCount': maxUnhealthyNodeThresholdCount,
      if (maxUnhealthyNodeThresholdPercentage != null)
        'maxUnhealthyNodeThresholdPercentage':
            maxUnhealthyNodeThresholdPercentage,
      if (nodeRepairConfigOverrides != null)
        'nodeRepairConfigOverrides': nodeRepairConfigOverrides,
    };
  }
}

/// The configuration for an Amazon EC2 Auto Scaling warm pool attached to an
/// Amazon EKS managed node group. Warm pools maintain pre-initialized EC2
/// instances alongside your Auto Scaling group that have already completed the
/// bootup initialization process and can be kept in a <code>Stopped</code>,
/// <code>Running</code>, or <code>Hibernated</code> state.
///
/// @nodoc
class WarmPoolConfig {
  /// Specifies whether to attach warm pools on the managed node group. Set to
  /// <code>true</code> to enable the warm pool, or <code>false</code> to disable
  /// and remove it. If not specified during an update, the current value is
  /// preserved.
  final bool? enabled;

  /// The maximum total number of instances across the warm pool and Auto Scaling
  /// group combined. This value controls the total prepared capacity available
  /// for your node group.
  final int? maxGroupPreparedCapacity;

  /// The minimum number of instances to maintain in the warm pool. Default:
  /// <code>0</code>. Size your warm pool based on scaling patterns to balance
  /// cost and availability. Start with 10-20% of expected peak capacity.
  final int? minSize;

  /// The desired state for warm pool instances. Default: <code>Stopped</code>.
  /// Valid values are <code>Stopped</code> (most cost-effective with EBS storage
  /// costs only), <code>Running</code> (fastest transition time with full EC2
  /// costs), and <code>Hibernated</code> (balance between cost and speed, only
  /// supported on specific instance types). Warm pool instances in the
  /// <code>Hibernated</code> state are not supported with Bottlerocket AMIs.
  final WarmPoolState? poolState;

  /// Indicates whether instances should return to the warm pool during scale-in
  /// events instead of being terminated. Default: <code>false</code>. Enable this
  /// to reduce costs by reusing instances. This feature is not supported for
  /// Bottlerocket AMIs.
  final bool? reuseOnScaleIn;

  WarmPoolConfig({
    this.enabled,
    this.maxGroupPreparedCapacity,
    this.minSize,
    this.poolState,
    this.reuseOnScaleIn,
  });

  factory WarmPoolConfig.fromJson(Map<String, dynamic> json) {
    return WarmPoolConfig(
      enabled: json['enabled'] as bool?,
      maxGroupPreparedCapacity: json['maxGroupPreparedCapacity'] as int?,
      minSize: json['minSize'] as int?,
      poolState: (json['poolState'] as String?)?.let(WarmPoolState.fromString),
      reuseOnScaleIn: json['reuseOnScaleIn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final maxGroupPreparedCapacity = this.maxGroupPreparedCapacity;
    final minSize = this.minSize;
    final poolState = this.poolState;
    final reuseOnScaleIn = this.reuseOnScaleIn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (maxGroupPreparedCapacity != null)
        'maxGroupPreparedCapacity': maxGroupPreparedCapacity,
      if (minSize != null) 'minSize': minSize,
      if (poolState != null) 'poolState': poolState.value,
      if (reuseOnScaleIn != null) 'reuseOnScaleIn': reuseOnScaleIn,
    };
  }
}

/// @nodoc
class WarmPoolState {
  static const stopped = WarmPoolState._('STOPPED');
  static const running = WarmPoolState._('RUNNING');
  static const hibernated = WarmPoolState._('HIBERNATED');

  final String value;

  const WarmPoolState._(this.value);

  static const values = [stopped, running, hibernated];

  static WarmPoolState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WarmPoolState._(value));

  @override
  bool operator ==(other) => other is WarmPoolState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specify granular overrides for specific repair actions. These overrides
/// control the repair action and the repair delay time before a node is
/// considered eligible for repair. If you use this, you must specify all the
/// values.
///
/// @nodoc
class NodeRepairConfigOverrides {
  /// Specify the minimum time in minutes to wait before attempting to repair a
  /// node with this specific <code>nodeMonitoringCondition</code> and
  /// <code>nodeUnhealthyReason</code>.
  final int? minRepairWaitTimeMins;

  /// Specify an unhealthy condition reported by the node monitoring agent that
  /// this override would apply to.
  final String? nodeMonitoringCondition;

  /// Specify a reason reported by the node monitoring agent that this override
  /// would apply to.
  final String? nodeUnhealthyReason;

  /// Specify the repair action to take for nodes when all of the specified
  /// conditions are met.
  final RepairAction? repairAction;

  NodeRepairConfigOverrides({
    this.minRepairWaitTimeMins,
    this.nodeMonitoringCondition,
    this.nodeUnhealthyReason,
    this.repairAction,
  });

  factory NodeRepairConfigOverrides.fromJson(Map<String, dynamic> json) {
    return NodeRepairConfigOverrides(
      minRepairWaitTimeMins: json['minRepairWaitTimeMins'] as int?,
      nodeMonitoringCondition: json['nodeMonitoringCondition'] as String?,
      nodeUnhealthyReason: json['nodeUnhealthyReason'] as String?,
      repairAction:
          (json['repairAction'] as String?)?.let(RepairAction.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final minRepairWaitTimeMins = this.minRepairWaitTimeMins;
    final nodeMonitoringCondition = this.nodeMonitoringCondition;
    final nodeUnhealthyReason = this.nodeUnhealthyReason;
    final repairAction = this.repairAction;
    return {
      if (minRepairWaitTimeMins != null)
        'minRepairWaitTimeMins': minRepairWaitTimeMins,
      if (nodeMonitoringCondition != null)
        'nodeMonitoringCondition': nodeMonitoringCondition,
      if (nodeUnhealthyReason != null)
        'nodeUnhealthyReason': nodeUnhealthyReason,
      if (repairAction != null) 'repairAction': repairAction.value,
    };
  }
}

/// @nodoc
class RepairAction {
  static const replace = RepairAction._('Replace');
  static const reboot = RepairAction._('Reboot');
  static const noAction = RepairAction._('NoAction');

  final String value;

  const RepairAction._(this.value);

  static const values = [replace, reboot, noAction];

  static RepairAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RepairAction._(value));

  @override
  bool operator ==(other) => other is RepairAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NodegroupUpdateStrategies {
  static const $default = NodegroupUpdateStrategies._('DEFAULT');
  static const minimal = NodegroupUpdateStrategies._('MINIMAL');

  final String value;

  const NodegroupUpdateStrategies._(this.value);

  static const values = [$default, minimal];

  static NodegroupUpdateStrategies fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NodegroupUpdateStrategies._(value));

  @override
  bool operator ==(other) =>
      other is NodegroupUpdateStrategies && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A property that allows a node to repel a <code>Pod</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/node-taints-managed-node-groups.html">Node
/// taints on managed node groups</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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
      effect: (json['effect'] as String?)?.let(TaintEffect.fromString),
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final key = this.key;
    final value = this.value;
    return {
      if (effect != null) 'effect': effect.value,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class TaintEffect {
  static const noSchedule = TaintEffect._('NO_SCHEDULE');
  static const noExecute = TaintEffect._('NO_EXECUTE');
  static const preferNoSchedule = TaintEffect._('PREFER_NO_SCHEDULE');

  final String value;

  const TaintEffect._(this.value);

  static const values = [noSchedule, noExecute, preferNoSchedule];

  static TaintEffect fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaintEffect._(value));

  @override
  bool operator ==(other) => other is TaintEffect && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An EKS Anywhere subscription authorizing the customer to support for
/// licensed clusters and access to EKS Anywhere Curated Packages.
///
/// @nodoc
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

  /// Includes all of the claims in the license token necessary to validate the
  /// license for extended support.
  final List<License>? licenses;

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
    this.licenses,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      licenseQuantity: json['licenseQuantity'] as int?,
      licenseType: (json['licenseType'] as String?)
          ?.let(EksAnywhereSubscriptionLicenseType.fromString),
      licenses: (json['licenses'] as List?)
          ?.nonNulls
          .map((e) => License.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final licenses = this.licenses;
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
      if (licenseType != null) 'licenseType': licenseType.value,
      if (licenses != null) 'licenses': licenses,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (term != null) 'term': term,
    };
  }
}

/// @nodoc
class EksAnywhereSubscriptionLicenseType {
  static const cluster = EksAnywhereSubscriptionLicenseType._('Cluster');

  final String value;

  const EksAnywhereSubscriptionLicenseType._(this.value);

  static const values = [cluster];

  static EksAnywhereSubscriptionLicenseType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EksAnywhereSubscriptionLicenseType._(value));

  @override
  bool operator ==(other) =>
      other is EksAnywhereSubscriptionLicenseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the term duration and term unit type of your
/// subscription. This determines the term length of your subscription. Valid
/// values are MONTHS for term unit and 12 or 36 for term duration, indicating a
/// 12 month or 36 month subscription.
///
/// @nodoc
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
      unit: (json['unit'] as String?)
          ?.let(EksAnywhereSubscriptionTermUnit.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final unit = this.unit;
    return {
      if (duration != null) 'duration': duration,
      if (unit != null) 'unit': unit.value,
    };
  }
}

/// An EKS Anywhere license associated with a subscription.
///
/// @nodoc
class License {
  /// An id associated with an EKS Anywhere subscription license.
  final String? id;

  /// An optional license token that can be used for extended support
  /// verification.
  final String? token;

  License({
    this.id,
    this.token,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      id: json['id'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final token = this.token;
    return {
      if (id != null) 'id': id,
      if (token != null) 'token': token,
    };
  }
}

/// @nodoc
class EksAnywhereSubscriptionTermUnit {
  static const months = EksAnywhereSubscriptionTermUnit._('MONTHS');

  final String value;

  const EksAnywhereSubscriptionTermUnit._(this.value);

  static const values = [months];

  static EksAnywhereSubscriptionTermUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EksAnywhereSubscriptionTermUnit._(value));

  @override
  bool operator ==(other) =>
      other is EksAnywhereSubscriptionTermUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the VPC configuration to use for an Amazon EKS
/// cluster.
///
/// @nodoc
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Cluster
  /// API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// Set this value to <code>false</code> to disable public access to your
  /// cluster's Kubernetes API server endpoint. If you disable public access, your
  /// cluster's Kubernetes API server can only receive requests from within the
  /// cluster VPC. The default value for this parameter is <code>true</code>,
  /// which enables public access for your Kubernetes API server. The endpoint
  /// domain name and IP address family depends on the value of the
  /// <code>ipFamily</code> for the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Cluster
  /// API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the CIDR blocks that you specify is denied. The default value is
  /// <code>0.0.0.0/0</code> and additionally <code>::/0</code> for dual-stack
  /// `IPv6` clusters. If you've disabled private endpoint access, make sure that
  /// you specify the necessary CIDR blocks for every node and Fargate
  /// <code>Pod</code> in the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Cluster
  /// API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
  /// Note that the public endpoints are dual-stack for only <code>IPv6</code>
  /// clusters that are made after October 2024. You can't add <code>IPv6</code>
  /// CIDR blocks to <code>IPv4</code> clusters or <code>IPv6</code> clusters that
  /// were made before October 2024.
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

/// An object representing the logging configuration for resources in your
/// cluster.
///
/// @nodoc
class Logging {
  /// The cluster control plane logging configuration for your cluster.
  final List<LogSetup>? clusterLogging;

  Logging({
    this.clusterLogging,
  });

  factory Logging.fromJson(Map<String, dynamic> json) {
    return Logging(
      clusterLogging: (json['clusterLogging'] as List?)
          ?.nonNulls
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

/// The access configuration information for the cluster.
///
/// @nodoc
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
        'authenticationMode': authenticationMode.value,
    };
  }
}

/// The support policy to use for the cluster. Extended support allows you to
/// remain on specific Kubernetes versions for longer. Clusters in extended
/// support have higher costs. The default value is <code>EXTENDED</code>. Use
/// <code>STANDARD</code> to disable extended support.
///
/// <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/extended-support-control.html">Learn
/// more about EKS Extended Support in the <i>Amazon EKS User Guide</i>.</a>
///
/// @nodoc
class UpgradePolicyRequest {
  /// If the cluster is set to <code>EXTENDED</code>, it will enter extended
  /// support at the end of standard support. If the cluster is set to
  /// <code>STANDARD</code>, it will be automatically upgraded at the end of
  /// standard support.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/extended-support-control.html">Learn
  /// more about EKS Extended Support in the <i>Amazon EKS User Guide</i>.</a>
  final SupportType? supportType;

  UpgradePolicyRequest({
    this.supportType,
  });

  Map<String, dynamic> toJson() {
    final supportType = this.supportType;
    return {
      if (supportType != null) 'supportType': supportType.value,
    };
  }
}

/// The configuration for zonal shift for the cluster.
///
/// @nodoc
class ZonalShiftConfigRequest {
  /// If zonal shift is enabled, Amazon Web Services configures zonal autoshift
  /// for the cluster.
  final bool? enabled;

  ZonalShiftConfigRequest({
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// Request to update the configuration of the compute capability of your EKS
/// Auto Mode cluster. For example, enable the capability. For more information,
/// see EKS Auto Mode compute capability in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
class ComputeConfigRequest {
  /// Request to enable or disable the compute capability on your EKS Auto Mode
  /// cluster. If the compute capability is enabled, EKS Auto Mode will create and
  /// delete EC2 Managed Instances in your Amazon Web Services account.
  final bool? enabled;

  /// Configuration for node pools that defines the compute resources for your EKS
  /// Auto Mode cluster. For more information, see EKS Auto Mode Node Pools in the
  /// <i>Amazon EKS User Guide</i>.
  final List<String>? nodePools;

  /// The ARN of the IAM Role EKS will assign to EC2 Managed Instances in your EKS
  /// Auto Mode cluster. This value cannot be changed after the compute capability
  /// of EKS Auto Mode is enabled. For more information, see the IAM Reference in
  /// the <i>Amazon EKS User Guide</i>.
  final String? nodeRoleArn;

  ComputeConfigRequest({
    this.enabled,
    this.nodePools,
    this.nodeRoleArn,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final nodePools = this.nodePools;
    final nodeRoleArn = this.nodeRoleArn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (nodePools != null) 'nodePools': nodePools,
      if (nodeRoleArn != null) 'nodeRoleArn': nodeRoleArn,
    };
  }
}

/// The Kubernetes network configuration for the cluster.
///
/// @nodoc
class KubernetesNetworkConfigRequest {
  /// Request to enable or disable the load balancing capability on your EKS Auto
  /// Mode cluster. For more information, see EKS Auto Mode load balancing
  /// capability in the <i>Amazon EKS User Guide</i>.
  final ElasticLoadBalancing? elasticLoadBalancing;

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
  /// IPv6 addresses to pods and services</a> in the <i>Amazon EKS User Guide</i>.
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
    this.elasticLoadBalancing,
    this.ipFamily,
    this.serviceIpv4Cidr,
  });

  Map<String, dynamic> toJson() {
    final elasticLoadBalancing = this.elasticLoadBalancing;
    final ipFamily = this.ipFamily;
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    return {
      if (elasticLoadBalancing != null)
        'elasticLoadBalancing': elasticLoadBalancing,
      if (ipFamily != null) 'ipFamily': ipFamily.value,
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
    };
  }
}

/// Request to update the configuration of the storage capability of your EKS
/// Auto Mode cluster. For example, enable the capability. For more information,
/// see EKS Auto Mode block storage capability in the <i>Amazon EKS User
/// Guide</i>.
///
/// @nodoc
class StorageConfigRequest {
  /// Request to configure EBS Block Storage settings for your EKS Auto Mode
  /// cluster.
  final BlockStorage? blockStorage;

  StorageConfigRequest({
    this.blockStorage,
  });

  Map<String, dynamic> toJson() {
    final blockStorage = this.blockStorage;
    return {
      if (blockStorage != null) 'blockStorage': blockStorage,
    };
  }
}

/// The configuration in the cluster for EKS Hybrid Nodes. You can add, change,
/// or remove this configuration after the cluster is created.
///
/// @nodoc
class RemoteNetworkConfigRequest {
  /// The list of network CIDRs that can contain hybrid nodes.
  ///
  /// These CIDR blocks define the expected IP address range of the hybrid nodes
  /// that join the cluster. These blocks are typically determined by your network
  /// administrator.
  ///
  /// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
  /// example, <code> 10.2.0.0/16</code>).
  ///
  /// It must satisfy the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Each block must be within an <code>IPv4</code> RFC-1918 network range.
  /// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
  /// addresses aren't supported.
  /// </li>
  /// <li>
  /// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
  /// resources, or the block of the Kubernetes service IP range.
  /// </li>
  /// <li>
  /// Each block must have a route to the VPC that uses the VPC CIDR blocks, not
  /// public IPs or Elastic IPs. There are many options including Transit Gateway,
  /// Site-to-Site VPN, or Direct Connect.
  /// </li>
  /// <li>
  /// Each host must allow outbound connection to the EKS cluster control plane on
  /// TCP ports <code>443</code> and <code>10250</code>.
  /// </li>
  /// <li>
  /// Each host must allow inbound connection from the EKS cluster control plane
  /// on TCP port 10250 for logs, exec and port-forward operations.
  /// </li>
  /// <li>
  /// Each host must allow TCP and UDP network connectivity to and from other
  /// hosts that are running <code>CoreDNS</code> on UDP port <code>53</code> for
  /// service and pod DNS names.
  /// </li>
  /// </ul>
  final List<RemoteNodeNetwork>? remoteNodeNetworks;

  /// The list of network CIDRs that can contain pods that run Kubernetes webhooks
  /// on hybrid nodes.
  ///
  /// These CIDR blocks are determined by configuring your Container Network
  /// Interface (CNI) plugin. We recommend the Calico CNI or Cilium CNI. Note that
  /// the Amazon VPC CNI plugin for Kubernetes isn't available for on-premises and
  /// edge locations.
  ///
  /// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
  /// example, <code> 10.2.0.0/16</code>).
  ///
  /// It must satisfy the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Each block must be within an <code>IPv4</code> RFC-1918 network range.
  /// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
  /// addresses aren't supported.
  /// </li>
  /// <li>
  /// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
  /// resources, or the block of the Kubernetes service IP range.
  /// </li>
  /// </ul>
  final List<RemotePodNetwork>? remotePodNetworks;

  RemoteNetworkConfigRequest({
    this.remoteNodeNetworks,
    this.remotePodNetworks,
  });

  Map<String, dynamic> toJson() {
    final remoteNodeNetworks = this.remoteNodeNetworks;
    final remotePodNetworks = this.remotePodNetworks;
    return {
      if (remoteNodeNetworks != null) 'remoteNodeNetworks': remoteNodeNetworks,
      if (remotePodNetworks != null) 'remotePodNetworks': remotePodNetworks,
    };
  }
}

/// The control plane scaling tier configuration. For more information, see EKS
/// Provisioned Control Plane in the Amazon EKS User Guide.
///
/// @nodoc
class ControlPlaneScalingConfig {
  /// The control plane scaling tier configuration. Available options are
  /// <code>standard</code>, <code>tier-xl</code>, <code>tier-2xl</code>,
  /// <code>tier-4xl, or tier-8xl</code>. For more information, see EKS
  /// Provisioned Control Plane in the Amazon EKS User Guide.
  final ProvisionedControlPlaneTier? tier;

  ControlPlaneScalingConfig({
    this.tier,
  });

  factory ControlPlaneScalingConfig.fromJson(Map<String, dynamic> json) {
    return ControlPlaneScalingConfig(
      tier: (json['tier'] as String?)
          ?.let(ProvisionedControlPlaneTier.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final tier = this.tier;
    return {
      if (tier != null) 'tier': tier.value,
    };
  }
}

/// @nodoc
class ProvisionedControlPlaneTier {
  static const standard = ProvisionedControlPlaneTier._('standard');
  static const tierXl = ProvisionedControlPlaneTier._('tier-xl');
  static const tier_2xl = ProvisionedControlPlaneTier._('tier-2xl');
  static const tier_4xl = ProvisionedControlPlaneTier._('tier-4xl');
  static const tier_8xl = ProvisionedControlPlaneTier._('tier-8xl');

  final String value;

  const ProvisionedControlPlaneTier._(this.value);

  static const values = [standard, tierXl, tier_2xl, tier_4xl, tier_8xl];

  static ProvisionedControlPlaneTier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisionedControlPlaneTier._(value));

  @override
  bool operator ==(other) =>
      other is ProvisionedControlPlaneTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A network CIDR that can contain pods that run Kubernetes webhooks on hybrid
/// nodes.
///
/// These CIDR blocks are determined by configuring your Container Network
/// Interface (CNI) plugin. We recommend the Calico CNI or Cilium CNI. Note that
/// the Amazon VPC CNI plugin for Kubernetes isn't available for on-premises and
/// edge locations.
///
/// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
/// example, <code> 10.2.0.0/16</code>).
///
/// It must satisfy the following requirements:
///
/// <ul>
/// <li>
/// Each block must be within an <code>IPv4</code> RFC-1918 network range.
/// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
/// addresses aren't supported.
/// </li>
/// <li>
/// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
/// resources, or the block of the Kubernetes service IP range.
/// </li>
/// </ul>
///
/// @nodoc
class RemotePodNetwork {
  /// A network CIDR that can contain pods that run Kubernetes webhooks on hybrid
  /// nodes.
  ///
  /// These CIDR blocks are determined by configuring your Container Network
  /// Interface (CNI) plugin. We recommend the Calico CNI or Cilium CNI. Note that
  /// the Amazon VPC CNI plugin for Kubernetes isn't available for on-premises and
  /// edge locations.
  ///
  /// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
  /// example, <code> 10.2.0.0/16</code>).
  ///
  /// It must satisfy the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Each block must be within an <code>IPv4</code> RFC-1918 network range.
  /// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
  /// addresses aren't supported.
  /// </li>
  /// <li>
  /// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
  /// resources, or the block of the Kubernetes service IP range.
  /// </li>
  /// </ul>
  final List<String>? cidrs;

  RemotePodNetwork({
    this.cidrs,
  });

  factory RemotePodNetwork.fromJson(Map<String, dynamic> json) {
    return RemotePodNetwork(
      cidrs:
          (json['cidrs'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrs = this.cidrs;
    return {
      if (cidrs != null) 'cidrs': cidrs,
    };
  }
}

/// A network CIDR that can contain hybrid nodes.
///
/// These CIDR blocks define the expected IP address range of the hybrid nodes
/// that join the cluster. These blocks are typically determined by your network
/// administrator.
///
/// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
/// example, <code> 10.2.0.0/16</code>).
///
/// It must satisfy the following requirements:
///
/// <ul>
/// <li>
/// Each block must be within an <code>IPv4</code> RFC-1918 network range.
/// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
/// addresses aren't supported.
/// </li>
/// <li>
/// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
/// resources, or the block of the Kubernetes service IP range.
/// </li>
/// <li>
/// Each block must have a route to the VPC that uses the VPC CIDR blocks, not
/// public IPs or Elastic IPs. There are many options including Transit Gateway,
/// Site-to-Site VPN, or Direct Connect.
/// </li>
/// <li>
/// Each host must allow outbound connection to the EKS cluster control plane on
/// TCP ports <code>443</code> and <code>10250</code>.
/// </li>
/// <li>
/// Each host must allow inbound connection from the EKS cluster control plane
/// on TCP port 10250 for logs, exec and port-forward operations.
/// </li>
/// <li>
/// Each host must allow TCP and UDP network connectivity to and from other
/// hosts that are running <code>CoreDNS</code> on UDP port <code>53</code> for
/// service and pod DNS names.
/// </li>
/// </ul>
///
/// @nodoc
class RemoteNodeNetwork {
  /// A network CIDR that can contain hybrid nodes.
  ///
  /// These CIDR blocks define the expected IP address range of the hybrid nodes
  /// that join the cluster. These blocks are typically determined by your network
  /// administrator.
  ///
  /// Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
  /// example, <code> 10.2.0.0/16</code>).
  ///
  /// It must satisfy the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Each block must be within an <code>IPv4</code> RFC-1918 network range.
  /// Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
  /// addresses aren't supported.
  /// </li>
  /// <li>
  /// Each block cannot overlap with the range of the VPC CIDR blocks for your EKS
  /// resources, or the block of the Kubernetes service IP range.
  /// </li>
  /// <li>
  /// Each block must have a route to the VPC that uses the VPC CIDR blocks, not
  /// public IPs or Elastic IPs. There are many options including Transit Gateway,
  /// Site-to-Site VPN, or Direct Connect.
  /// </li>
  /// <li>
  /// Each host must allow outbound connection to the EKS cluster control plane on
  /// TCP ports <code>443</code> and <code>10250</code>.
  /// </li>
  /// <li>
  /// Each host must allow inbound connection from the EKS cluster control plane
  /// on TCP port 10250 for logs, exec and port-forward operations.
  /// </li>
  /// <li>
  /// Each host must allow TCP and UDP network connectivity to and from other
  /// hosts that are running <code>CoreDNS</code> on UDP port <code>53</code> for
  /// service and pod DNS names.
  /// </li>
  /// </ul>
  final List<String>? cidrs;

  RemoteNodeNetwork({
    this.cidrs,
  });

  factory RemoteNodeNetwork.fromJson(Map<String, dynamic> json) {
    return RemoteNodeNetwork(
      cidrs:
          (json['cidrs'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrs = this.cidrs;
    return {
      if (cidrs != null) 'cidrs': cidrs,
    };
  }
}

/// Indicates the current configuration of the block storage capability on your
/// EKS Auto Mode cluster. For example, if the capability is enabled or
/// disabled. If the block storage capability is enabled, EKS Auto Mode will
/// create and delete EBS volumes in your Amazon Web Services account. For more
/// information, see EKS Auto Mode block storage capability in the <i>Amazon EKS
/// User Guide</i>.
///
/// @nodoc
class BlockStorage {
  /// Indicates if the block storage capability is enabled on your EKS Auto Mode
  /// cluster. If the block storage capability is enabled, EKS Auto Mode will
  /// create and delete EBS volumes in your Amazon Web Services account.
  final bool? enabled;

  BlockStorage({
    this.enabled,
  });

  factory BlockStorage.fromJson(Map<String, dynamic> json) {
    return BlockStorage(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// @nodoc
class IpFamily {
  static const ipv4 = IpFamily._('ipv4');
  static const ipv6 = IpFamily._('ipv6');

  final String value;

  const IpFamily._(this.value);

  static const values = [ipv4, ipv6];

  static IpFamily fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IpFamily._(value));

  @override
  bool operator ==(other) => other is IpFamily && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Indicates the current configuration of the load balancing capability on your
/// EKS Auto Mode cluster. For example, if the capability is enabled or
/// disabled. For more information, see EKS Auto Mode load balancing capability
/// in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
class ElasticLoadBalancing {
  /// Indicates if the load balancing capability is enabled on your EKS Auto Mode
  /// cluster. If the load balancing capability is enabled, EKS Auto Mode will
  /// create and delete load balancers in your Amazon Web Services account.
  final bool? enabled;

  ElasticLoadBalancing({
    this.enabled,
  });

  factory ElasticLoadBalancing.fromJson(Map<String, dynamic> json) {
    return ElasticLoadBalancing(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// @nodoc
class SupportType {
  static const standard = SupportType._('STANDARD');
  static const extended = SupportType._('EXTENDED');

  final String value;

  const SupportType._(this.value);

  static const values = [standard, extended];

  static SupportType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SupportType._(value));

  @override
  bool operator ==(other) => other is SupportType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AuthenticationMode {
  static const api = AuthenticationMode._('API');
  static const apiAndConfigMap = AuthenticationMode._('API_AND_CONFIG_MAP');
  static const configMap = AuthenticationMode._('CONFIG_MAP');

  final String value;

  const AuthenticationMode._(this.value);

  static const values = [api, apiAndConfigMap, configMap];

  static AuthenticationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthenticationMode._(value));

  @override
  bool operator ==(other) =>
      other is AuthenticationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the enabled or disabled Kubernetes control plane logs
/// for your cluster.
///
/// @nodoc
class LogSetup {
  /// If a log type is enabled, that log type exports its control plane logs to
  /// CloudWatch Logs . If a log type isn't enabled, that log type doesn't export
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
          ?.nonNulls
          .map((e) => LogType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final types = this.types;
    return {
      if (enabled != null) 'enabled': enabled,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class LogType {
  static const api = LogType._('api');
  static const audit = LogType._('audit');
  static const authenticator = LogType._('authenticator');
  static const controllerManager = LogType._('controllerManager');
  static const scheduler = LogType._('scheduler');

  final String value;

  const LogType._(this.value);

  static const values = [
    api,
    audit,
    authenticator,
    controllerManager,
    scheduler
  ];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration updates for a capability. The structure varies depending on
/// the capability type.
///
/// @nodoc
class UpdateCapabilityConfiguration {
  /// Configuration updates specific to Argo CD capabilities.
  final UpdateArgoCdConfig? argoCd;

  UpdateCapabilityConfiguration({
    this.argoCd,
  });

  Map<String, dynamic> toJson() {
    final argoCd = this.argoCd;
    return {
      if (argoCd != null) 'argoCd': argoCd,
    };
  }
}

/// @nodoc
class CapabilityDeletePropagationPolicy {
  static const retain = CapabilityDeletePropagationPolicy._('RETAIN');

  final String value;

  const CapabilityDeletePropagationPolicy._(this.value);

  static const values = [retain];

  static CapabilityDeletePropagationPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityDeletePropagationPolicy._(value));

  @override
  bool operator ==(other) =>
      other is CapabilityDeletePropagationPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration updates for an Argo CD capability. You only need to specify
/// the fields you want to update.
///
/// @nodoc
class UpdateArgoCdConfig {
  /// Updated network access configuration for the Argo CD capability's managed
  /// API server endpoint. You can add or remove VPC endpoint associations to
  /// control which VPCs have private access to the Argo CD server.
  final ArgoCdNetworkAccessConfigRequest? networkAccess;

  /// Updated RBAC role mappings for the Argo CD capability. You can add, update,
  /// or remove role mappings.
  final UpdateRoleMappings? rbacRoleMappings;

  UpdateArgoCdConfig({
    this.networkAccess,
    this.rbacRoleMappings,
  });

  Map<String, dynamic> toJson() {
    final networkAccess = this.networkAccess;
    final rbacRoleMappings = this.rbacRoleMappings;
    return {
      if (networkAccess != null) 'networkAccess': networkAccess,
      if (rbacRoleMappings != null) 'rbacRoleMappings': rbacRoleMappings,
    };
  }
}

/// Updates to RBAC role mappings for an Argo CD capability. You can add,
/// update, or remove role mappings in a single operation.
///
/// @nodoc
class UpdateRoleMappings {
  /// A list of role mappings to add or update. If a mapping for the specified
  /// role already exists, it will be updated with the new identities. If it
  /// doesn't exist, a new mapping will be created.
  final List<ArgoCdRoleMapping>? addOrUpdateRoleMappings;

  /// A list of role mappings to remove from the RBAC configuration. Each mapping
  /// specifies an Argo CD role (<code>ADMIN</code>, <code>EDITOR</code>, or
  /// <code>VIEWER</code>) and the identities to remove from that role.
  final List<ArgoCdRoleMapping>? removeRoleMappings;

  UpdateRoleMappings({
    this.addOrUpdateRoleMappings,
    this.removeRoleMappings,
  });

  Map<String, dynamic> toJson() {
    final addOrUpdateRoleMappings = this.addOrUpdateRoleMappings;
    final removeRoleMappings = this.removeRoleMappings;
    return {
      if (addOrUpdateRoleMappings != null)
        'addOrUpdateRoleMappings': addOrUpdateRoleMappings,
      if (removeRoleMappings != null) 'removeRoleMappings': removeRoleMappings,
    };
  }
}

/// Configuration for network access to the Argo CD capability's managed API
/// server endpoint. When VPC endpoint IDs are specified, public access is
/// blocked and the Argo CD server is only accessible through the specified VPC
/// endpoints.
///
/// @nodoc
class ArgoCdNetworkAccessConfigRequest {
  /// A list of VPC endpoint IDs to associate with the managed Argo CD API server
  /// endpoint. Each VPC endpoint provides private connectivity from a specific
  /// VPC to the Argo CD server. You can specify multiple VPC endpoint IDs to
  /// enable access from multiple VPCs.
  final List<String>? vpceIds;

  ArgoCdNetworkAccessConfigRequest({
    this.vpceIds,
  });

  Map<String, dynamic> toJson() {
    final vpceIds = this.vpceIds;
    return {
      if (vpceIds != null) 'vpceIds': vpceIds,
    };
  }
}

/// A mapping between an Argo CD role and IAM Identity CenterIAM; Identity
/// Center identities. This defines which users or groups have specific
/// permissions in Argo CD.
///
/// @nodoc
class ArgoCdRoleMapping {
  /// A list of IAM Identity CenterIAM; Identity Center identities (users or
  /// groups) that should be assigned this Argo CD role.
  final List<SsoIdentity> identities;

  /// The Argo CD role to assign. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ADMIN</code> – Full administrative access to Argo CD.
  /// </li>
  /// <li>
  /// <code>EDITOR</code> – Edit access to Argo CD resources.
  /// </li>
  /// <li>
  /// <code>VIEWER</code> – Read-only access to Argo CD resources.
  /// </li>
  /// </ul>
  final ArgoCdRole role;

  ArgoCdRoleMapping({
    required this.identities,
    required this.role,
  });

  factory ArgoCdRoleMapping.fromJson(Map<String, dynamic> json) {
    return ArgoCdRoleMapping(
      identities: ((json['identities'] as List?) ?? const [])
          .nonNulls
          .map((e) => SsoIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: ArgoCdRole.fromString((json['role'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final identities = this.identities;
    final role = this.role;
    return {
      'identities': identities,
      'role': role.value,
    };
  }
}

/// @nodoc
class ArgoCdRole {
  static const admin = ArgoCdRole._('ADMIN');
  static const editor = ArgoCdRole._('EDITOR');
  static const viewer = ArgoCdRole._('VIEWER');

  final String value;

  const ArgoCdRole._(this.value);

  static const values = [admin, editor, viewer];

  static ArgoCdRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ArgoCdRole._(value));

  @override
  bool operator ==(other) => other is ArgoCdRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An IAM Identity CenterIAM; Identity Center identity (user or group) that can
/// be assigned permissions in a capability.
///
/// @nodoc
class SsoIdentity {
  /// The unique identifier of the IAM Identity CenterIAM; Identity Center user or
  /// group.
  final String id;

  /// The type of identity. Valid values are <code>SSO_USER</code> or
  /// <code>SSO_GROUP</code>.
  final SsoIdentityType type;

  SsoIdentity({
    required this.id,
    required this.type,
  });

  factory SsoIdentity.fromJson(Map<String, dynamic> json) {
    return SsoIdentity(
      id: (json['id'] as String?) ?? '',
      type: SsoIdentityType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.value,
    };
  }
}

/// @nodoc
class SsoIdentityType {
  static const ssoUser = SsoIdentityType._('SSO_USER');
  static const ssoGroup = SsoIdentityType._('SSO_GROUP');

  final String value;

  const SsoIdentityType._(this.value);

  static const values = [ssoUser, ssoGroup];

  static SsoIdentityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SsoIdentityType._(value));

  @override
  bool operator ==(other) => other is SsoIdentityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResolveConflicts {
  static const overwrite = ResolveConflicts._('OVERWRITE');
  static const none = ResolveConflicts._('NONE');
  static const preserve = ResolveConflicts._('PRESERVE');

  final String value;

  const ResolveConflicts._(this.value);

  static const values = [overwrite, none, preserve];

  static ResolveConflicts fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResolveConflicts._(value));

  @override
  bool operator ==(other) => other is ResolveConflicts && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A type of EKS Pod Identity association owned by an Amazon EKS add-on.
///
/// Each association maps a role to a service account in a namespace in the
/// cluster.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
/// an IAM Role to an Amazon EKS add-on using EKS Pod Identity</a> in the
/// <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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

/// An access entry allows an IAM principal (user or role) to access your
/// cluster. Access entries can replace the need to maintain the
/// <code>aws-auth</code> <code>ConfigMap</code> for authentication. For more
/// information about access entries, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html">Access
/// entries</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class InsightsRefreshStatus {
  static const inProgress = InsightsRefreshStatus._('IN_PROGRESS');
  static const failed = InsightsRefreshStatus._('FAILED');
  static const completed = InsightsRefreshStatus._('COMPLETED');

  final String value;

  const InsightsRefreshStatus._(this.value);

  static const values = [inProgress, failed, completed];

  static InsightsRefreshStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InsightsRefreshStatus._(value));

  @override
  bool operator ==(other) =>
      other is InsightsRefreshStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an Amazon EKS cluster.
///
/// @nodoc
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

  /// Indicates the current configuration of the compute capability on your EKS
  /// Auto Mode cluster. For example, if the capability is enabled or disabled. If
  /// the compute capability is enabled, EKS Auto Mode will create and delete EC2
  /// Managed Instances in your Amazon Web Services account. For more information,
  /// see EKS Auto Mode compute capability in the <i>Amazon EKS User Guide</i>.
  final ComputeConfigResponse? computeConfig;

  /// The configuration used to connect to a cluster for registration.
  final ConnectorConfigResponse? connectorConfig;

  /// The control plane scaling tier configuration. For more information, see EKS
  /// Provisioned Control Plane in the Amazon EKS User Guide.
  final ControlPlaneScalingConfig? controlPlaneScalingConfig;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// The current deletion protection setting for the cluster. When
  /// <code>true</code>, deletion protection is enabled and the cluster cannot be
  /// deleted until protection is disabled. When <code>false</code>, the cluster
  /// can be deleted normally. This setting only applies to clusters in an active
  /// state.
  final bool? deletionProtection;

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

  /// The configuration in the cluster for EKS Hybrid Nodes. You can add, change,
  /// or remove this configuration after the cluster is created.
  final RemoteNetworkConfigResponse? remoteNetworkConfig;

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

  /// Indicates the current configuration of the block storage capability on your
  /// EKS Auto Mode cluster. For example, if the capability is enabled or
  /// disabled. If the block storage capability is enabled, EKS Auto Mode will
  /// create and delete EBS volumes in your Amazon Web Services account. For more
  /// information, see EKS Auto Mode block storage capability in the <i>Amazon EKS
  /// User Guide</i>.
  final StorageConfigResponse? storageConfig;

  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  final Map<String, String>? tags;

  /// This value indicates if extended support is enabled or disabled for the
  /// cluster.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/extended-support-control.html">Learn
  /// more about EKS Extended Support in the <i>Amazon EKS User Guide</i>.</a>
  final UpgradePolicyResponse? upgradePolicy;

  /// The Kubernetes server version for the cluster.
  final String? version;

  /// The configuration for zonal shift for the cluster.
  final ZonalShiftConfigResponse? zonalShiftConfig;

  Cluster({
    this.accessConfig,
    this.arn,
    this.certificateAuthority,
    this.clientRequestToken,
    this.computeConfig,
    this.connectorConfig,
    this.controlPlaneScalingConfig,
    this.createdAt,
    this.deletionProtection,
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
    this.remoteNetworkConfig,
    this.resourcesVpcConfig,
    this.roleArn,
    this.status,
    this.storageConfig,
    this.tags,
    this.upgradePolicy,
    this.version,
    this.zonalShiftConfig,
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
      computeConfig: json['computeConfig'] != null
          ? ComputeConfigResponse.fromJson(
              json['computeConfig'] as Map<String, dynamic>)
          : null,
      connectorConfig: json['connectorConfig'] != null
          ? ConnectorConfigResponse.fromJson(
              json['connectorConfig'] as Map<String, dynamic>)
          : null,
      controlPlaneScalingConfig: json['controlPlaneScalingConfig'] != null
          ? ControlPlaneScalingConfig.fromJson(
              json['controlPlaneScalingConfig'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      deletionProtection: json['deletionProtection'] as bool?,
      encryptionConfig: (json['encryptionConfig'] as List?)
          ?.nonNulls
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
      remoteNetworkConfig: json['remoteNetworkConfig'] != null
          ? RemoteNetworkConfigResponse.fromJson(
              json['remoteNetworkConfig'] as Map<String, dynamic>)
          : null,
      resourcesVpcConfig: json['resourcesVpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['resourcesVpcConfig'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(ClusterStatus.fromString),
      storageConfig: json['storageConfig'] != null
          ? StorageConfigResponse.fromJson(
              json['storageConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      upgradePolicy: json['upgradePolicy'] != null
          ? UpgradePolicyResponse.fromJson(
              json['upgradePolicy'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
      zonalShiftConfig: json['zonalShiftConfig'] != null
          ? ZonalShiftConfigResponse.fromJson(
              json['zonalShiftConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessConfig = this.accessConfig;
    final arn = this.arn;
    final certificateAuthority = this.certificateAuthority;
    final clientRequestToken = this.clientRequestToken;
    final computeConfig = this.computeConfig;
    final connectorConfig = this.connectorConfig;
    final controlPlaneScalingConfig = this.controlPlaneScalingConfig;
    final createdAt = this.createdAt;
    final deletionProtection = this.deletionProtection;
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
    final remoteNetworkConfig = this.remoteNetworkConfig;
    final resourcesVpcConfig = this.resourcesVpcConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final storageConfig = this.storageConfig;
    final tags = this.tags;
    final upgradePolicy = this.upgradePolicy;
    final version = this.version;
    final zonalShiftConfig = this.zonalShiftConfig;
    return {
      if (accessConfig != null) 'accessConfig': accessConfig,
      if (arn != null) 'arn': arn,
      if (certificateAuthority != null)
        'certificateAuthority': certificateAuthority,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (computeConfig != null) 'computeConfig': computeConfig,
      if (connectorConfig != null) 'connectorConfig': connectorConfig,
      if (controlPlaneScalingConfig != null)
        'controlPlaneScalingConfig': controlPlaneScalingConfig,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
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
      if (remoteNetworkConfig != null)
        'remoteNetworkConfig': remoteNetworkConfig,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (storageConfig != null) 'storageConfig': storageConfig,
      if (tags != null) 'tags': tags,
      if (upgradePolicy != null) 'upgradePolicy': upgradePolicy,
      if (version != null) 'version': version,
      if (zonalShiftConfig != null) 'zonalShiftConfig': zonalShiftConfig,
    };
  }
}

/// An object representing an Amazon EKS cluster VPC configuration response.
///
/// @nodoc
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
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Cluster
  /// API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  final bool? endpointPrivateAccess;

  /// Whether the public API server endpoint is enabled.
  final bool? endpointPublicAccess;

  /// The CIDR blocks that are allowed access to your cluster's public Kubernetes
  /// API server endpoint. Communication to the endpoint from addresses outside of
  /// the CIDR blocks that you specify is denied. The default value is
  /// <code>0.0.0.0/0</code> and additionally <code>::/0</code> for dual-stack
  /// `IPv6` clusters. If you've disabled private endpoint access, make sure that
  /// you specify the necessary CIDR blocks for every node and Fargate
  /// <code>Pod</code> in the cluster. For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Cluster
  /// API server endpoint</a> in the <i> <i>Amazon EKS User Guide</i> </i>.
  ///
  /// Note that the public endpoints are dual-stack for only <code>IPv6</code>
  /// clusters that are made after October 2024. You can't add <code>IPv6</code>
  /// CIDR blocks to <code>IPv4</code> clusters or <code>IPv6</code> clusters that
  /// were made before October 2024.
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
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

/// The Kubernetes network configuration for the cluster. The response contains
/// a value for <b>serviceIpv6Cidr</b> or <b>serviceIpv4Cidr</b>, but not both.
///
/// @nodoc
class KubernetesNetworkConfigResponse {
  /// Indicates the current configuration of the load balancing capability on your
  /// EKS Auto Mode cluster. For example, if the capability is enabled or
  /// disabled.
  final ElasticLoadBalancing? elasticLoadBalancing;

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
    this.elasticLoadBalancing,
    this.ipFamily,
    this.serviceIpv4Cidr,
    this.serviceIpv6Cidr,
  });

  factory KubernetesNetworkConfigResponse.fromJson(Map<String, dynamic> json) {
    return KubernetesNetworkConfigResponse(
      elasticLoadBalancing: json['elasticLoadBalancing'] != null
          ? ElasticLoadBalancing.fromJson(
              json['elasticLoadBalancing'] as Map<String, dynamic>)
          : null,
      ipFamily: (json['ipFamily'] as String?)?.let(IpFamily.fromString),
      serviceIpv4Cidr: json['serviceIpv4Cidr'] as String?,
      serviceIpv6Cidr: json['serviceIpv6Cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final elasticLoadBalancing = this.elasticLoadBalancing;
    final ipFamily = this.ipFamily;
    final serviceIpv4Cidr = this.serviceIpv4Cidr;
    final serviceIpv6Cidr = this.serviceIpv6Cidr;
    return {
      if (elasticLoadBalancing != null)
        'elasticLoadBalancing': elasticLoadBalancing,
      if (ipFamily != null) 'ipFamily': ipFamily.value,
      if (serviceIpv4Cidr != null) 'serviceIpv4Cidr': serviceIpv4Cidr,
      if (serviceIpv6Cidr != null) 'serviceIpv6Cidr': serviceIpv6Cidr,
    };
  }
}

/// An object representing an identity provider.
///
/// @nodoc
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

/// @nodoc
class ClusterStatus {
  static const creating = ClusterStatus._('CREATING');
  static const active = ClusterStatus._('ACTIVE');
  static const deleting = ClusterStatus._('DELETING');
  static const failed = ClusterStatus._('FAILED');
  static const updating = ClusterStatus._('UPDATING');
  static const pending = ClusterStatus._('PENDING');

  final String value;

  const ClusterStatus._(this.value);

  static const values = [creating, active, deleting, failed, updating, pending];

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

/// An object representing the <code>certificate-authority-data</code> for your
/// cluster.
///
/// @nodoc
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

/// The full description of your connected cluster.
///
/// @nodoc
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

/// An object representing the health of your Amazon EKS cluster.
///
/// @nodoc
class ClusterHealth {
  /// An object representing the health issues of your Amazon EKS cluster.
  final List<ClusterIssue>? issues;

  ClusterHealth({
    this.issues,
  });

  factory ClusterHealth.fromJson(Map<String, dynamic> json) {
    return ClusterHealth(
      issues: (json['issues'] as List?)
          ?.nonNulls
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

/// An object representing the configuration of your local Amazon EKS cluster on
/// an Amazon Web Services Outpost. This API isn't available for Amazon EKS
/// clusters on the Amazon Web Services cloud.
///
/// @nodoc
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
      controlPlaneInstanceType:
          (json['controlPlaneInstanceType'] as String?) ?? '',
      outpostArns: ((json['outpostArns'] as List?) ?? const [])
          .nonNulls
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

/// The access configuration for the cluster.
///
/// @nodoc
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
      authenticationMode: (json['authenticationMode'] as String?)
          ?.let(AuthenticationMode.fromString),
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
        'authenticationMode': authenticationMode.value,
      if (bootstrapClusterCreatorAdminPermissions != null)
        'bootstrapClusterCreatorAdminPermissions':
            bootstrapClusterCreatorAdminPermissions,
    };
  }
}

/// This value indicates if extended support is enabled or disabled for the
/// cluster.
///
/// <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/extended-support-control.html">Learn
/// more about EKS Extended Support in the <i>Amazon EKS User Guide</i>.</a>
///
/// @nodoc
class UpgradePolicyResponse {
  /// If the cluster is set to <code>EXTENDED</code>, it will enter extended
  /// support at the end of standard support. If the cluster is set to
  /// <code>STANDARD</code>, it will be automatically upgraded at the end of
  /// standard support.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/extended-support-control.html">Learn
  /// more about EKS Extended Support in the <i>Amazon EKS User Guide</i>.</a>
  final SupportType? supportType;

  UpgradePolicyResponse({
    this.supportType,
  });

  factory UpgradePolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpgradePolicyResponse(
      supportType:
          (json['supportType'] as String?)?.let(SupportType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final supportType = this.supportType;
    return {
      if (supportType != null) 'supportType': supportType.value,
    };
  }
}

/// The status of zonal shift configuration for the cluster
///
/// @nodoc
class ZonalShiftConfigResponse {
  /// Whether the zonal shift is enabled.
  final bool? enabled;

  ZonalShiftConfigResponse({
    this.enabled,
  });

  factory ZonalShiftConfigResponse.fromJson(Map<String, dynamic> json) {
    return ZonalShiftConfigResponse(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The configuration in the cluster for EKS Hybrid Nodes. You can add, change,
/// or remove this configuration after the cluster is created.
///
/// @nodoc
class RemoteNetworkConfigResponse {
  /// The list of network CIDRs that can contain hybrid nodes.
  final List<RemoteNodeNetwork>? remoteNodeNetworks;

  /// The list of network CIDRs that can contain pods that run Kubernetes webhooks
  /// on hybrid nodes.
  final List<RemotePodNetwork>? remotePodNetworks;

  RemoteNetworkConfigResponse({
    this.remoteNodeNetworks,
    this.remotePodNetworks,
  });

  factory RemoteNetworkConfigResponse.fromJson(Map<String, dynamic> json) {
    return RemoteNetworkConfigResponse(
      remoteNodeNetworks: (json['remoteNodeNetworks'] as List?)
          ?.nonNulls
          .map((e) => RemoteNodeNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      remotePodNetworks: (json['remotePodNetworks'] as List?)
          ?.nonNulls
          .map((e) => RemotePodNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final remoteNodeNetworks = this.remoteNodeNetworks;
    final remotePodNetworks = this.remotePodNetworks;
    return {
      if (remoteNodeNetworks != null) 'remoteNodeNetworks': remoteNodeNetworks,
      if (remotePodNetworks != null) 'remotePodNetworks': remotePodNetworks,
    };
  }
}

/// Indicates the status of the request to update the compute capability of your
/// EKS Auto Mode cluster.
///
/// @nodoc
class ComputeConfigResponse {
  /// Indicates if the compute capability is enabled on your EKS Auto Mode
  /// cluster. If the compute capability is enabled, EKS Auto Mode will create and
  /// delete EC2 Managed Instances in your Amazon Web Services account.
  final bool? enabled;

  /// Indicates the current configuration of node pools in your EKS Auto Mode
  /// cluster. For more information, see EKS Auto Mode Node Pools in the <i>Amazon
  /// EKS User Guide</i>.
  final List<String>? nodePools;

  /// The ARN of the IAM Role EKS will assign to EC2 Managed Instances in your EKS
  /// Auto Mode cluster.
  final String? nodeRoleArn;

  ComputeConfigResponse({
    this.enabled,
    this.nodePools,
    this.nodeRoleArn,
  });

  factory ComputeConfigResponse.fromJson(Map<String, dynamic> json) {
    return ComputeConfigResponse(
      enabled: json['enabled'] as bool?,
      nodePools: (json['nodePools'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nodeRoleArn: json['nodeRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final nodePools = this.nodePools;
    final nodeRoleArn = this.nodeRoleArn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (nodePools != null) 'nodePools': nodePools,
      if (nodeRoleArn != null) 'nodeRoleArn': nodeRoleArn,
    };
  }
}

/// Indicates the status of the request to update the block storage capability
/// of your EKS Auto Mode cluster.
///
/// @nodoc
class StorageConfigResponse {
  /// Indicates the current configuration of the block storage capability on your
  /// EKS Auto Mode cluster. For example, if the capability is enabled or
  /// disabled.
  final BlockStorage? blockStorage;

  StorageConfigResponse({
    this.blockStorage,
  });

  factory StorageConfigResponse.fromJson(Map<String, dynamic> json) {
    return StorageConfigResponse(
      blockStorage: json['blockStorage'] != null
          ? BlockStorage.fromJson(json['blockStorage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blockStorage = this.blockStorage;
    return {
      if (blockStorage != null) 'blockStorage': blockStorage,
    };
  }
}

/// The placement configuration for all the control plane instances of your
/// local Amazon EKS cluster on an Amazon Web Services Outpost. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
/// considerations</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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

/// An issue with your Amazon EKS cluster.
///
/// @nodoc
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
      code: (json['code'] as String?)?.let(ClusterIssueCode.fromString),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// @nodoc
class ClusterIssueCode {
  static const accessDenied = ClusterIssueCode._('AccessDenied');
  static const clusterUnreachable = ClusterIssueCode._('ClusterUnreachable');
  static const configurationConflict =
      ClusterIssueCode._('ConfigurationConflict');
  static const internalFailure = ClusterIssueCode._('InternalFailure');
  static const resourceLimitExceeded =
      ClusterIssueCode._('ResourceLimitExceeded');
  static const resourceNotFound = ClusterIssueCode._('ResourceNotFound');
  static const iamRoleNotFound = ClusterIssueCode._('IamRoleNotFound');
  static const vpcNotFound = ClusterIssueCode._('VpcNotFound');
  static const insufficientFreeAddresses =
      ClusterIssueCode._('InsufficientFreeAddresses');
  static const ec2ServiceNotSubscribed =
      ClusterIssueCode._('Ec2ServiceNotSubscribed');
  static const ec2SubnetNotFound = ClusterIssueCode._('Ec2SubnetNotFound');
  static const ec2SecurityGroupNotFound =
      ClusterIssueCode._('Ec2SecurityGroupNotFound');
  static const kmsGrantRevoked = ClusterIssueCode._('KmsGrantRevoked');
  static const kmsKeyNotFound = ClusterIssueCode._('KmsKeyNotFound');
  static const kmsKeyMarkedForDeletion =
      ClusterIssueCode._('KmsKeyMarkedForDeletion');
  static const kmsKeyDisabled = ClusterIssueCode._('KmsKeyDisabled');
  static const stsRegionalEndpointDisabled =
      ClusterIssueCode._('StsRegionalEndpointDisabled');
  static const unsupportedVersion = ClusterIssueCode._('UnsupportedVersion');
  static const other = ClusterIssueCode._('Other');

  final String value;

  const ClusterIssueCode._(this.value);

  static const values = [
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
    other
  ];

  static ClusterIssueCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterIssueCode._(value));

  @override
  bool operator ==(other) => other is ClusterIssueCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The encryption configuration for the cluster.
///
/// @nodoc
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
          ?.nonNulls
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

/// Identifies the Key Management Service (KMS) key used to encrypt the secrets.
///
/// @nodoc
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

/// An object representing the <a href="https://openid.net/connect/">OpenID
/// Connect</a> (OIDC) identity provider information for the cluster.
///
/// @nodoc
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

/// The configuration sent to a cluster for configuration.
///
/// @nodoc
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
      'provider': provider.value,
      'roleArn': roleArn,
    };
  }
}

/// @nodoc
class ConnectorConfigProvider {
  static const eksAnywhere = ConnectorConfigProvider._('EKS_ANYWHERE');
  static const anthos = ConnectorConfigProvider._('ANTHOS');
  static const gke = ConnectorConfigProvider._('GKE');
  static const aks = ConnectorConfigProvider._('AKS');
  static const openshift = ConnectorConfigProvider._('OPENSHIFT');
  static const tanzu = ConnectorConfigProvider._('TANZU');
  static const rancher = ConnectorConfigProvider._('RANCHER');
  static const ec2 = ConnectorConfigProvider._('EC2');
  static const other = ConnectorConfigProvider._('OTHER');

  final String value;

  const ConnectorConfigProvider._(this.value);

  static const values = [
    eksAnywhere,
    anthos,
    gke,
    aks,
    openshift,
    tanzu,
    rancher,
    ec2,
    other
  ];

  static ConnectorConfigProvider fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorConfigProvider._(value));

  @override
  bool operator ==(other) =>
      other is ConnectorConfigProvider && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summarized description of the association.
///
/// Each summary is simplified by removing these fields compared to the full <a
/// href="https://docs.aws.amazon.com/eks/latest/APIReference/API_PodIdentityAssociation.html">
/// <code>PodIdentityAssociation</code> </a>:
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
///
/// @nodoc
class PodIdentityAssociationSummary {
  /// The Amazon Resource Name (ARN) of the association.
  final String? associationArn;

  /// The ID of the association.
  final String? associationId;

  /// The name of the cluster that the association is in.
  final String? clusterName;

  /// The name of the Kubernetes namespace inside the cluster to create the
  /// association in. The service account and the Pods that use the service
  /// account must be in this namespace.
  final String? namespace;

  /// If defined, the association is owned by an Amazon EKS add-on.
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

/// The summarized description of the insight.
///
/// @nodoc
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
      category: (json['category'] as String?)?.let(Category.fromString),
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
      if (category != null) 'category': category.value,
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

/// @nodoc
class Category {
  static const upgradeReadiness = Category._('UPGRADE_READINESS');
  static const misconfiguration = Category._('MISCONFIGURATION');

  final String value;

  const Category._(this.value);

  static const values = [upgradeReadiness, misconfiguration];

  static Category fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Category._(value));

  @override
  bool operator ==(other) => other is Category && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of the insight.
///
/// @nodoc
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
      status: (json['status'] as String?)?.let(InsightStatusValue.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class InsightStatusValue {
  static const passing = InsightStatusValue._('PASSING');
  static const warning = InsightStatusValue._('WARNING');
  static const error = InsightStatusValue._('ERROR');
  static const unknown = InsightStatusValue._('UNKNOWN');

  final String value;

  const InsightStatusValue._(this.value);

  static const values = [passing, warning, error, unknown];

  static InsightStatusValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InsightStatusValue._(value));

  @override
  bool operator ==(other) =>
      other is InsightStatusValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The criteria to use for the insights.
///
/// @nodoc
class InsightsFilter {
  /// The categories to use to filter insights. The following lists the available
  /// categories:
  ///
  /// <ul>
  /// <li>
  /// <code>UPGRADE_READINESS</code>: Amazon EKS identifies issues that could
  /// impact your ability to upgrade to new versions of Kubernetes. These are
  /// called upgrade insights.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURATION</code>: Amazon EKS identifies misconfiguration in
  /// your EKS Hybrid Nodes setup that could impair functionality of your cluster
  /// or workloads. These are called configuration insights.
  /// </li>
  /// </ul>
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
        'categories': categories.map((e) => e.value).toList(),
      if (kubernetesVersions != null) 'kubernetesVersions': kubernetesVersions,
      if (statuses != null) 'statuses': statuses.map((e) => e.value).toList(),
    };
  }
}

/// An object representing an identity provider configuration.
///
/// @nodoc
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
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
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

/// @nodoc
class EksAnywhereSubscriptionStatus {
  static const creating = EksAnywhereSubscriptionStatus._('CREATING');
  static const active = EksAnywhereSubscriptionStatus._('ACTIVE');
  static const updating = EksAnywhereSubscriptionStatus._('UPDATING');
  static const expiring = EksAnywhereSubscriptionStatus._('EXPIRING');
  static const expired = EksAnywhereSubscriptionStatus._('EXPIRED');
  static const deleting = EksAnywhereSubscriptionStatus._('DELETING');

  final String value;

  const EksAnywhereSubscriptionStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    expiring,
    expired,
    deleting
  ];

  static EksAnywhereSubscriptionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EksAnywhereSubscriptionStatus._(value));

  @override
  bool operator ==(other) =>
      other is EksAnywhereSubscriptionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a capability, containing basic information without the full
/// configuration details. This is returned by the <code>ListCapabilities</code>
/// operation.
///
/// @nodoc
class CapabilitySummary {
  /// The Amazon Resource Name (ARN) of the capability.
  final String? arn;

  /// The unique name of the capability within the cluster.
  final String? capabilityName;

  /// The Unix epoch timestamp in seconds for when the capability was created.
  final DateTime? createdAt;

  /// The Unix epoch timestamp in seconds for when the capability was last
  /// modified.
  final DateTime? modifiedAt;

  /// The current status of the capability.
  final CapabilityStatus? status;

  /// The type of capability. Valid values are <code>ACK</code>,
  /// <code>ARGOCD</code>, or <code>KRO</code>.
  final CapabilityType? type;

  /// The version of the capability software that is currently running.
  final String? version;

  CapabilitySummary({
    this.arn,
    this.capabilityName,
    this.createdAt,
    this.modifiedAt,
    this.status,
    this.type,
    this.version,
  });

  factory CapabilitySummary.fromJson(Map<String, dynamic> json) {
    return CapabilitySummary(
      arn: json['arn'] as String?,
      capabilityName: json['capabilityName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      status: (json['status'] as String?)?.let(CapabilityStatus.fromString),
      type: (json['type'] as String?)?.let(CapabilityType.fromString),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capabilityName = this.capabilityName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (capabilityName != null) 'capabilityName': capabilityName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class CapabilityType {
  static const ack = CapabilityType._('ACK');
  static const kro = CapabilityType._('KRO');
  static const argocd = CapabilityType._('ARGOCD');

  final String value;

  const CapabilityType._(this.value);

  static const values = [ack, kro, argocd];

  static CapabilityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityType._(value));

  @override
  bool operator ==(other) => other is CapabilityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CapabilityStatus {
  static const creating = CapabilityStatus._('CREATING');
  static const createFailed = CapabilityStatus._('CREATE_FAILED');
  static const updating = CapabilityStatus._('UPDATING');
  static const deleting = CapabilityStatus._('DELETING');
  static const deleteFailed = CapabilityStatus._('DELETE_FAILED');
  static const active = CapabilityStatus._('ACTIVE');
  static const degraded = CapabilityStatus._('DEGRADED');

  final String value;

  const CapabilityStatus._(this.value);

  static const values = [
    creating,
    createFailed,
    updating,
    deleting,
    deleteFailed,
    active,
    degraded
  ];

  static CapabilityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityStatus._(value));

  @override
  bool operator ==(other) => other is CapabilityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An access policy association.
///
/// @nodoc
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

/// The scope of an <code>AccessPolicy</code> that's associated to an
/// <code>AccessEntry</code>.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(AccessScopeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final type = this.type;
    return {
      if (namespaces != null) 'namespaces': namespaces,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class AccessScopeType {
  static const cluster = AccessScopeType._('cluster');
  static const namespace = AccessScopeType._('namespace');

  final String value;

  const AccessScopeType._(this.value);

  static const values = [cluster, namespace];

  static AccessScopeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccessScopeType._(value));

  @override
  bool operator ==(other) => other is AccessScopeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
///
/// @nodoc
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

/// An object representing an Amazon EKS managed node group.
///
/// @nodoc
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

  /// The node auto repair configuration for the node group.
  final NodeRepairConfig? nodeRepairConfig;

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

  /// The warm pool configuration attached to the node group. Amazon EKS manages
  /// warm pools throughout the node group lifecycle using the
  /// <code>AWSServiceRoleForAmazonEKSNodegroup</code> service-linked role to
  /// create, update, and delete warm pool resources.
  final WarmPoolConfig? warmPoolConfig;

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
    this.nodeRepairConfig,
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
    this.warmPoolConfig,
  });

  factory Nodegroup.fromJson(Map<String, dynamic> json) {
    return Nodegroup(
      amiType: (json['amiType'] as String?)?.let(AMITypes.fromString),
      capacityType:
          (json['capacityType'] as String?)?.let(CapacityTypes.fromString),
      clusterName: json['clusterName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      diskSize: json['diskSize'] as int?,
      health: json['health'] != null
          ? NodegroupHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      labels: (json['labels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      launchTemplate: json['launchTemplate'] != null
          ? LaunchTemplateSpecification.fromJson(
              json['launchTemplate'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      nodeRepairConfig: json['nodeRepairConfig'] != null
          ? NodeRepairConfig.fromJson(
              json['nodeRepairConfig'] as Map<String, dynamic>)
          : null,
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
      status: (json['status'] as String?)?.let(NodegroupStatus.fromString),
      subnets:
          (json['subnets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      taints: (json['taints'] as List?)
          ?.nonNulls
          .map((e) => Taint.fromJson(e as Map<String, dynamic>))
          .toList(),
      updateConfig: json['updateConfig'] != null
          ? NodegroupUpdateConfig.fromJson(
              json['updateConfig'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
      warmPoolConfig: json['warmPoolConfig'] != null
          ? WarmPoolConfig.fromJson(
              json['warmPoolConfig'] as Map<String, dynamic>)
          : null,
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
    final nodeRepairConfig = this.nodeRepairConfig;
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
    final warmPoolConfig = this.warmPoolConfig;
    return {
      if (amiType != null) 'amiType': amiType.value,
      if (capacityType != null) 'capacityType': capacityType.value,
      if (clusterName != null) 'clusterName': clusterName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (diskSize != null) 'diskSize': diskSize,
      if (health != null) 'health': health,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (labels != null) 'labels': labels,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (nodeRepairConfig != null) 'nodeRepairConfig': nodeRepairConfig,
      if (nodeRole != null) 'nodeRole': nodeRole,
      if (nodegroupArn != null) 'nodegroupArn': nodegroupArn,
      if (nodegroupName != null) 'nodegroupName': nodegroupName,
      if (releaseVersion != null) 'releaseVersion': releaseVersion,
      if (remoteAccess != null) 'remoteAccess': remoteAccess,
      if (resources != null) 'resources': resources,
      if (scalingConfig != null) 'scalingConfig': scalingConfig,
      if (status != null) 'status': status.value,
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
      if (taints != null) 'taints': taints,
      if (updateConfig != null) 'updateConfig': updateConfig,
      if (version != null) 'version': version,
      if (warmPoolConfig != null) 'warmPoolConfig': warmPoolConfig,
    };
  }
}

/// @nodoc
class NodegroupStatus {
  static const creating = NodegroupStatus._('CREATING');
  static const active = NodegroupStatus._('ACTIVE');
  static const updating = NodegroupStatus._('UPDATING');
  static const deleting = NodegroupStatus._('DELETING');
  static const createFailed = NodegroupStatus._('CREATE_FAILED');
  static const deleteFailed = NodegroupStatus._('DELETE_FAILED');
  static const degraded = NodegroupStatus._('DEGRADED');

  final String value;

  const NodegroupStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    deleteFailed,
    degraded
  ];

  static NodegroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NodegroupStatus._(value));

  @override
  bool operator ==(other) => other is NodegroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CapacityTypes {
  static const onDemand = CapacityTypes._('ON_DEMAND');
  static const spot = CapacityTypes._('SPOT');
  static const capacityBlock = CapacityTypes._('CAPACITY_BLOCK');

  final String value;

  const CapacityTypes._(this.value);

  static const values = [onDemand, spot, capacityBlock];

  static CapacityTypes fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapacityTypes._(value));

  @override
  bool operator ==(other) => other is CapacityTypes && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the remote access configuration for the managed node
/// group.
///
/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class AMITypes {
  static const al2X86_64 = AMITypes._('AL2_x86_64');
  static const al2X86_64Gpu = AMITypes._('AL2_x86_64_GPU');
  static const al2Arm_64 = AMITypes._('AL2_ARM_64');
  static const custom = AMITypes._('CUSTOM');
  static const bottlerocketArm_64 = AMITypes._('BOTTLEROCKET_ARM_64');
  static const bottlerocketX86_64 = AMITypes._('BOTTLEROCKET_x86_64');
  static const bottlerocketArm_64Fips = AMITypes._('BOTTLEROCKET_ARM_64_FIPS');
  static const bottlerocketX86_64Fips = AMITypes._('BOTTLEROCKET_x86_64_FIPS');
  static const bottlerocketArm_64Nvidia =
      AMITypes._('BOTTLEROCKET_ARM_64_NVIDIA');
  static const bottlerocketX86_64Nvidia =
      AMITypes._('BOTTLEROCKET_x86_64_NVIDIA');
  static const bottlerocketArm_64NvidiaFips =
      AMITypes._('BOTTLEROCKET_ARM_64_NVIDIA_FIPS');
  static const bottlerocketX86_64NvidiaFips =
      AMITypes._('BOTTLEROCKET_x86_64_NVIDIA_FIPS');
  static const windowsCore_2019X86_64 = AMITypes._('WINDOWS_CORE_2019_x86_64');
  static const windowsFull_2019X86_64 = AMITypes._('WINDOWS_FULL_2019_x86_64');
  static const windowsCore_2022X86_64 = AMITypes._('WINDOWS_CORE_2022_x86_64');
  static const windowsFull_2022X86_64 = AMITypes._('WINDOWS_FULL_2022_x86_64');
  static const windowsCore_2025X86_64 = AMITypes._('WINDOWS_CORE_2025_x86_64');
  static const windowsFull_2025X86_64 = AMITypes._('WINDOWS_FULL_2025_x86_64');
  static const al2023X86_64Standard = AMITypes._('AL2023_x86_64_STANDARD');
  static const al2023Arm_64Standard = AMITypes._('AL2023_ARM_64_STANDARD');
  static const al2023X86_64Neuron = AMITypes._('AL2023_x86_64_NEURON');
  static const al2023X86_64Nvidia = AMITypes._('AL2023_x86_64_NVIDIA');
  static const al2023Arm_64Nvidia = AMITypes._('AL2023_ARM_64_NVIDIA');

  final String value;

  const AMITypes._(this.value);

  static const values = [
    al2X86_64,
    al2X86_64Gpu,
    al2Arm_64,
    custom,
    bottlerocketArm_64,
    bottlerocketX86_64,
    bottlerocketArm_64Fips,
    bottlerocketX86_64Fips,
    bottlerocketArm_64Nvidia,
    bottlerocketX86_64Nvidia,
    bottlerocketArm_64NvidiaFips,
    bottlerocketX86_64NvidiaFips,
    windowsCore_2019X86_64,
    windowsFull_2019X86_64,
    windowsCore_2022X86_64,
    windowsFull_2022X86_64,
    windowsCore_2025X86_64,
    windowsFull_2025X86_64,
    al2023X86_64Standard,
    al2023Arm_64Standard,
    al2023X86_64Neuron,
    al2023X86_64Nvidia,
    al2023Arm_64Nvidia
  ];

  static AMITypes fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AMITypes._(value));

  @override
  bool operator ==(other) => other is AMITypes && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing the resources associated with the node group, such as
/// Auto Scaling groups and security groups for remote access.
///
/// @nodoc
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
          ?.nonNulls
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

/// An object representing the health status of the node group.
///
/// @nodoc
class NodegroupHealth {
  /// Any issues that are associated with the node group.
  final List<Issue>? issues;

  NodegroupHealth({
    this.issues,
  });

  factory NodegroupHealth.fromJson(Map<String, dynamic> json) {
    return NodegroupHealth(
      issues: (json['issues'] as List?)
          ?.nonNulls
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

/// An object representing an issue with an Amazon EKS resource.
///
/// @nodoc
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
  /// <b>Ec2InstanceTypeDoesNotExist</b>: One or more of the supplied Amazon EC2
  /// instance types do not exist. Amazon EKS checked for the instance types that
  /// you provided in this Amazon Web Services Region, and one or more aren't
  /// available.
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
      code: (json['code'] as String?)?.let(NodegroupIssueCode.fromString),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// @nodoc
class NodegroupIssueCode {
  static const autoScalingGroupNotFound =
      NodegroupIssueCode._('AutoScalingGroupNotFound');
  static const autoScalingGroupInvalidConfiguration =
      NodegroupIssueCode._('AutoScalingGroupInvalidConfiguration');
  static const ec2SecurityGroupNotFound =
      NodegroupIssueCode._('Ec2SecurityGroupNotFound');
  static const ec2SecurityGroupDeletionFailure =
      NodegroupIssueCode._('Ec2SecurityGroupDeletionFailure');
  static const ec2LaunchTemplateNotFound =
      NodegroupIssueCode._('Ec2LaunchTemplateNotFound');
  static const ec2LaunchTemplateVersionMismatch =
      NodegroupIssueCode._('Ec2LaunchTemplateVersionMismatch');
  static const ec2SubnetNotFound = NodegroupIssueCode._('Ec2SubnetNotFound');
  static const ec2SubnetInvalidConfiguration =
      NodegroupIssueCode._('Ec2SubnetInvalidConfiguration');
  static const iamInstanceProfileNotFound =
      NodegroupIssueCode._('IamInstanceProfileNotFound');
  static const ec2SubnetMissingIpv6Assignment =
      NodegroupIssueCode._('Ec2SubnetMissingIpv6Assignment');
  static const iamLimitExceeded = NodegroupIssueCode._('IamLimitExceeded');
  static const iamNodeRoleNotFound =
      NodegroupIssueCode._('IamNodeRoleNotFound');
  static const nodeCreationFailure =
      NodegroupIssueCode._('NodeCreationFailure');
  static const asgInstanceLaunchFailures =
      NodegroupIssueCode._('AsgInstanceLaunchFailures');
  static const instanceLimitExceeded =
      NodegroupIssueCode._('InstanceLimitExceeded');
  static const insufficientFreeAddresses =
      NodegroupIssueCode._('InsufficientFreeAddresses');
  static const accessDenied = NodegroupIssueCode._('AccessDenied');
  static const internalFailure = NodegroupIssueCode._('InternalFailure');
  static const clusterUnreachable = NodegroupIssueCode._('ClusterUnreachable');
  static const amiIdNotFound = NodegroupIssueCode._('AmiIdNotFound');
  static const autoScalingGroupOptInRequired =
      NodegroupIssueCode._('AutoScalingGroupOptInRequired');
  static const autoScalingGroupRateLimitExceeded =
      NodegroupIssueCode._('AutoScalingGroupRateLimitExceeded');
  static const ec2LaunchTemplateDeletionFailure =
      NodegroupIssueCode._('Ec2LaunchTemplateDeletionFailure');
  static const ec2LaunchTemplateInvalidConfiguration =
      NodegroupIssueCode._('Ec2LaunchTemplateInvalidConfiguration');
  static const ec2LaunchTemplateMaxLimitExceeded =
      NodegroupIssueCode._('Ec2LaunchTemplateMaxLimitExceeded');
  static const ec2SubnetListTooLong =
      NodegroupIssueCode._('Ec2SubnetListTooLong');
  static const iamThrottling = NodegroupIssueCode._('IamThrottling');
  static const nodeTerminationFailure =
      NodegroupIssueCode._('NodeTerminationFailure');
  static const podEvictionFailure = NodegroupIssueCode._('PodEvictionFailure');
  static const sourceEc2LaunchTemplateNotFound =
      NodegroupIssueCode._('SourceEc2LaunchTemplateNotFound');
  static const limitExceeded = NodegroupIssueCode._('LimitExceeded');
  static const unknown = NodegroupIssueCode._('Unknown');
  static const autoScalingGroupInstanceRefreshActive =
      NodegroupIssueCode._('AutoScalingGroupInstanceRefreshActive');
  static const kubernetesLabelInvalid =
      NodegroupIssueCode._('KubernetesLabelInvalid');
  static const ec2LaunchTemplateVersionMaxLimitExceeded =
      NodegroupIssueCode._('Ec2LaunchTemplateVersionMaxLimitExceeded');
  static const ec2InstanceTypeDoesNotExist =
      NodegroupIssueCode._('Ec2InstanceTypeDoesNotExist');

  final String value;

  const NodegroupIssueCode._(this.value);

  static const values = [
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
    ec2InstanceTypeDoesNotExist
  ];

  static NodegroupIssueCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NodegroupIssueCode._(value));

  @override
  bool operator ==(other) =>
      other is NodegroupIssueCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Auto Scaling group that is associated with an Amazon EKS managed node
/// group.
///
/// @nodoc
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

/// A check that provides recommendations to remedy potential upgrade-impacting
/// issues.
///
/// @nodoc
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
      category: (json['category'] as String?)?.let(Category.fromString),
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
          ?.nonNulls
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
      if (category != null) 'category': category.value,
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
///
/// @nodoc
class InsightCategorySpecificSummary {
  /// A list of <code>AddonCompatibilityDetail</code> objects for Amazon EKS
  /// add-ons.
  final List<AddonCompatibilityDetail>? addonCompatibilityDetails;

  /// The summary information about deprecated resource usage for an insight check
  /// in the <code>UPGRADE_READINESS</code> category.
  final List<DeprecationDetail>? deprecationDetails;

  InsightCategorySpecificSummary({
    this.addonCompatibilityDetails,
    this.deprecationDetails,
  });

  factory InsightCategorySpecificSummary.fromJson(Map<String, dynamic> json) {
    return InsightCategorySpecificSummary(
      addonCompatibilityDetails: (json['addonCompatibilityDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              AddonCompatibilityDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      deprecationDetails: (json['deprecationDetails'] as List?)
          ?.nonNulls
          .map((e) => DeprecationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addonCompatibilityDetails = this.addonCompatibilityDetails;
    final deprecationDetails = this.deprecationDetails;
    return {
      if (addonCompatibilityDetails != null)
        'addonCompatibilityDetails': addonCompatibilityDetails,
      if (deprecationDetails != null) 'deprecationDetails': deprecationDetails,
    };
  }
}

/// The summary information about the Amazon EKS add-on compatibility for the
/// next Kubernetes version for an insight check in the
/// <code>UPGRADE_READINESS</code> category.
///
/// @nodoc
class AddonCompatibilityDetail {
  /// The list of compatible Amazon EKS add-on versions for the next Kubernetes
  /// version.
  final List<String>? compatibleVersions;

  /// The name of the Amazon EKS add-on.
  final String? name;

  AddonCompatibilityDetail({
    this.compatibleVersions,
    this.name,
  });

  factory AddonCompatibilityDetail.fromJson(Map<String, dynamic> json) {
    return AddonCompatibilityDetail(
      compatibleVersions: (json['compatibleVersions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleVersions = this.compatibleVersions;
    final name = this.name;
    return {
      if (compatibleVersions != null) 'compatibleVersions': compatibleVersions,
      if (name != null) 'name': name,
    };
  }
}

/// The summary information about deprecated resource usage for an insight check
/// in the <code>UPGRADE_READINESS</code> category.
///
/// @nodoc
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
          ?.nonNulls
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

/// Details about clients using the deprecated resources.
///
/// @nodoc
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

/// Returns information about the resource being evaluated.
///
/// @nodoc
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

/// The full description of your identity configuration.
///
/// @nodoc
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

/// An object representing the configuration for an OpenID Connect (OIDC)
/// identity provider.
///
/// @nodoc
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
      status: (json['status'] as String?)?.let(ConfigStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (usernameClaim != null) 'usernameClaim': usernameClaim,
      if (usernamePrefix != null) 'usernamePrefix': usernamePrefix,
    };
  }
}

/// @nodoc
class ConfigStatus {
  static const creating = ConfigStatus._('CREATING');
  static const deleting = ConfigStatus._('DELETING');
  static const active = ConfigStatus._('ACTIVE');

  final String value;

  const ConfigStatus._(this.value);

  static const values = [creating, deleting, active];

  static ConfigStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ConfigStatus._(value));

  @override
  bool operator ==(other) => other is ConfigStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an Fargate profile.
///
/// @nodoc
class FargateProfile {
  /// The name of your cluster.
  final String? clusterName;

  /// The Unix epoch timestamp at object creation.
  final DateTime? createdAt;

  /// The full Amazon Resource Name (ARN) of the Fargate profile.
  final String? fargateProfileArn;

  /// The name of the Fargate profile.
  final String? fargateProfileName;

  /// The health status of the Fargate profile. If there are issues with your
  /// Fargate profile's health, they are listed here.
  final FargateProfileHealth? health;

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
    this.health,
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
      health: json['health'] != null
          ? FargateProfileHealth.fromJson(
              json['health'] as Map<String, dynamic>)
          : null,
      podExecutionRoleArn: json['podExecutionRoleArn'] as String?,
      selectors: (json['selectors'] as List?)
          ?.nonNulls
          .map(
              (e) => FargateProfileSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.let(FargateProfileStatus.fromString),
      subnets:
          (json['subnets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final createdAt = this.createdAt;
    final fargateProfileArn = this.fargateProfileArn;
    final fargateProfileName = this.fargateProfileName;
    final health = this.health;
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
      if (health != null) 'health': health,
      if (podExecutionRoleArn != null)
        'podExecutionRoleArn': podExecutionRoleArn,
      if (selectors != null) 'selectors': selectors,
      if (status != null) 'status': status.value,
      if (subnets != null) 'subnets': subnets,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class FargateProfileStatus {
  static const creating = FargateProfileStatus._('CREATING');
  static const active = FargateProfileStatus._('ACTIVE');
  static const deleting = FargateProfileStatus._('DELETING');
  static const createFailed = FargateProfileStatus._('CREATE_FAILED');
  static const deleteFailed = FargateProfileStatus._('DELETE_FAILED');

  final String value;

  const FargateProfileStatus._(this.value);

  static const values = [
    creating,
    active,
    deleting,
    createFailed,
    deleteFailed
  ];

  static FargateProfileStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FargateProfileStatus._(value));

  @override
  bool operator ==(other) =>
      other is FargateProfileStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The health status of the Fargate profile. If there are issues with your
/// Fargate profile's health, they are listed here.
///
/// @nodoc
class FargateProfileHealth {
  /// Any issues that are associated with the Fargate profile.
  final List<FargateProfileIssue>? issues;

  FargateProfileHealth({
    this.issues,
  });

  factory FargateProfileHealth.fromJson(Map<String, dynamic> json) {
    return FargateProfileHealth(
      issues: (json['issues'] as List?)
          ?.nonNulls
          .map((e) => FargateProfileIssue.fromJson(e as Map<String, dynamic>))
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

/// An issue that is associated with the Fargate profile.
///
/// @nodoc
class FargateProfileIssue {
  /// A brief description of the error.
  final FargateProfileIssueCode? code;

  /// The error message associated with the issue.
  final String? message;

  /// The Amazon Web Services resources that are affected by this issue.
  final List<String>? resourceIds;

  FargateProfileIssue({
    this.code,
    this.message,
    this.resourceIds,
  });

  factory FargateProfileIssue.fromJson(Map<String, dynamic> json) {
    return FargateProfileIssue(
      code: (json['code'] as String?)?.let(FargateProfileIssueCode.fromString),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// @nodoc
class FargateProfileIssueCode {
  static const podExecutionRoleAlreadyInUse =
      FargateProfileIssueCode._('PodExecutionRoleAlreadyInUse');
  static const accessDenied = FargateProfileIssueCode._('AccessDenied');
  static const clusterUnreachable =
      FargateProfileIssueCode._('ClusterUnreachable');
  static const internalFailure = FargateProfileIssueCode._('InternalFailure');

  final String value;

  const FargateProfileIssueCode._(this.value);

  static const values = [
    podExecutionRoleAlreadyInUse,
    accessDenied,
    clusterUnreachable,
    internalFailure
  ];

  static FargateProfileIssueCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FargateProfileIssueCode._(value));

  @override
  bool operator ==(other) =>
      other is FargateProfileIssueCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an Fargate profile selector.
///
/// @nodoc
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

/// Contains details about a specific EKS cluster version.
///
/// @nodoc
class ClusterVersionInformation {
  /// The type of cluster this version is for.
  final String? clusterType;

  /// The Kubernetes version for the cluster.
  final String? clusterVersion;

  /// Default platform version for this Kubernetes version.
  final String? defaultPlatformVersion;

  /// Indicates if this is a default version.
  final bool? defaultVersion;

  /// Date when extended support ends for this version.
  final DateTime? endOfExtendedSupportDate;

  /// Date when standard support ends for this version.
  final DateTime? endOfStandardSupportDate;

  /// The patch version of Kubernetes for this cluster version.
  final String? kubernetesPatchVersion;

  /// The release date of this cluster version.
  final DateTime? releaseDate;

  /// <important>
  /// This field is deprecated. Use <code>versionStatus</code> instead, as that
  /// field matches for input and output of this action.
  /// </important>
  /// Current status of this cluster version.
  final ClusterVersionStatus? status;

  /// Current status of this cluster version.
  final VersionStatus? versionStatus;

  ClusterVersionInformation({
    this.clusterType,
    this.clusterVersion,
    this.defaultPlatformVersion,
    this.defaultVersion,
    this.endOfExtendedSupportDate,
    this.endOfStandardSupportDate,
    this.kubernetesPatchVersion,
    this.releaseDate,
    this.status,
    this.versionStatus,
  });

  factory ClusterVersionInformation.fromJson(Map<String, dynamic> json) {
    return ClusterVersionInformation(
      clusterType: json['clusterType'] as String?,
      clusterVersion: json['clusterVersion'] as String?,
      defaultPlatformVersion: json['defaultPlatformVersion'] as String?,
      defaultVersion: json['defaultVersion'] as bool?,
      endOfExtendedSupportDate:
          timeStampFromJson(json['endOfExtendedSupportDate']),
      endOfStandardSupportDate:
          timeStampFromJson(json['endOfStandardSupportDate']),
      kubernetesPatchVersion: json['kubernetesPatchVersion'] as String?,
      releaseDate: timeStampFromJson(json['releaseDate']),
      status: (json['status'] as String?)?.let(ClusterVersionStatus.fromString),
      versionStatus:
          (json['versionStatus'] as String?)?.let(VersionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterType = this.clusterType;
    final clusterVersion = this.clusterVersion;
    final defaultPlatformVersion = this.defaultPlatformVersion;
    final defaultVersion = this.defaultVersion;
    final endOfExtendedSupportDate = this.endOfExtendedSupportDate;
    final endOfStandardSupportDate = this.endOfStandardSupportDate;
    final kubernetesPatchVersion = this.kubernetesPatchVersion;
    final releaseDate = this.releaseDate;
    final status = this.status;
    final versionStatus = this.versionStatus;
    return {
      if (clusterType != null) 'clusterType': clusterType,
      if (clusterVersion != null) 'clusterVersion': clusterVersion,
      if (defaultPlatformVersion != null)
        'defaultPlatformVersion': defaultPlatformVersion,
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (endOfExtendedSupportDate != null)
        'endOfExtendedSupportDate':
            unixTimestampToJson(endOfExtendedSupportDate),
      if (endOfStandardSupportDate != null)
        'endOfStandardSupportDate':
            unixTimestampToJson(endOfStandardSupportDate),
      if (kubernetesPatchVersion != null)
        'kubernetesPatchVersion': kubernetesPatchVersion,
      if (releaseDate != null) 'releaseDate': unixTimestampToJson(releaseDate),
      if (status != null) 'status': status.value,
      if (versionStatus != null) 'versionStatus': versionStatus.value,
    };
  }
}

/// @nodoc
class ClusterVersionStatus {
  static const unsupported = ClusterVersionStatus._('unsupported');
  static const standardSupport = ClusterVersionStatus._('standard-support');
  static const extendedSupport = ClusterVersionStatus._('extended-support');

  final String value;

  const ClusterVersionStatus._(this.value);

  static const values = [unsupported, standardSupport, extendedSupport];

  static ClusterVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterVersionStatus._(value));

  @override
  bool operator ==(other) =>
      other is ClusterVersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VersionStatus {
  static const unsupported = VersionStatus._('UNSUPPORTED');
  static const standardSupport = VersionStatus._('STANDARD_SUPPORT');
  static const extendedSupport = VersionStatus._('EXTENDED_SUPPORT');

  final String value;

  const VersionStatus._(this.value);

  static const values = [unsupported, standardSupport, extendedSupport];

  static VersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VersionStatus._(value));

  @override
  bool operator ==(other) => other is VersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing a managed capability in an Amazon EKS cluster. This
/// includes all configuration, status, and health information for the
/// capability.
///
/// @nodoc
class Capability {
  /// The Amazon Resource Name (ARN) of the capability.
  final String? arn;

  /// The unique name of the capability within the cluster.
  final String? capabilityName;

  /// The name of the Amazon EKS cluster that contains this capability.
  final String? clusterName;

  /// The configuration settings for the capability. The structure varies
  /// depending on the capability type.
  final CapabilityConfigurationResponse? configuration;

  /// The Unix epoch timestamp in seconds for when the capability was created.
  final DateTime? createdAt;

  /// The delete propagation policy for the capability. Currently, the only
  /// supported value is <code>RETAIN</code>, which keeps all resources managed by
  /// the capability when the capability is deleted.
  final CapabilityDeletePropagationPolicy? deletePropagationPolicy;

  /// Health information for the capability, including any issues that may be
  /// affecting its operation.
  final CapabilityHealth? health;

  /// The Unix epoch timestamp in seconds for when the capability was last
  /// modified.
  final DateTime? modifiedAt;

  /// The Amazon Resource Name (ARN) of the IAM role that the capability uses to
  /// interact with Amazon Web Services services.
  final String? roleArn;

  /// The current status of the capability. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The capability is being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> – The capability is running and available.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> – The capability is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> – The capability is being deleted.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> – The capability creation failed.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> – The capability update failed.
  /// </li>
  /// <li>
  /// <code>DELETE_FAILED</code> – The capability deletion failed.
  /// </li>
  /// </ul>
  final CapabilityStatus? status;
  final Map<String, String>? tags;

  /// The type of capability. Valid values are <code>ACK</code>,
  /// <code>ARGOCD</code>, or <code>KRO</code>.
  final CapabilityType? type;

  /// The version of the capability software that is currently running.
  final String? version;

  Capability({
    this.arn,
    this.capabilityName,
    this.clusterName,
    this.configuration,
    this.createdAt,
    this.deletePropagationPolicy,
    this.health,
    this.modifiedAt,
    this.roleArn,
    this.status,
    this.tags,
    this.type,
    this.version,
  });

  factory Capability.fromJson(Map<String, dynamic> json) {
    return Capability(
      arn: json['arn'] as String?,
      capabilityName: json['capabilityName'] as String?,
      clusterName: json['clusterName'] as String?,
      configuration: json['configuration'] != null
          ? CapabilityConfigurationResponse.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      deletePropagationPolicy: (json['deletePropagationPolicy'] as String?)
          ?.let(CapabilityDeletePropagationPolicy.fromString),
      health: json['health'] != null
          ? CapabilityHealth.fromJson(json['health'] as Map<String, dynamic>)
          : null,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(CapabilityStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(CapabilityType.fromString),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capabilityName = this.capabilityName;
    final clusterName = this.clusterName;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final deletePropagationPolicy = this.deletePropagationPolicy;
    final health = this.health;
    final modifiedAt = this.modifiedAt;
    final roleArn = this.roleArn;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (capabilityName != null) 'capabilityName': capabilityName,
      if (clusterName != null) 'clusterName': clusterName,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletePropagationPolicy != null)
        'deletePropagationPolicy': deletePropagationPolicy.value,
      if (health != null) 'health': health,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
      if (version != null) 'version': version,
    };
  }
}

/// The response object containing capability configuration details.
///
/// @nodoc
class CapabilityConfigurationResponse {
  /// Configuration settings for an Argo CD capability, including the server URL
  /// and other Argo CD-specific settings.
  final ArgoCdConfigResponse? argoCd;

  CapabilityConfigurationResponse({
    this.argoCd,
  });

  factory CapabilityConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CapabilityConfigurationResponse(
      argoCd: json['argoCd'] != null
          ? ArgoCdConfigResponse.fromJson(
              json['argoCd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final argoCd = this.argoCd;
    return {
      if (argoCd != null) 'argoCd': argoCd,
    };
  }
}

/// Health information for a capability, including any issues that may be
/// affecting its operation.
///
/// @nodoc
class CapabilityHealth {
  /// A list of issues affecting the capability. If this list is empty, the
  /// capability is healthy.
  final List<CapabilityIssue>? issues;

  CapabilityHealth({
    this.issues,
  });

  factory CapabilityHealth.fromJson(Map<String, dynamic> json) {
    return CapabilityHealth(
      issues: (json['issues'] as List?)
          ?.nonNulls
          .map((e) => CapabilityIssue.fromJson(e as Map<String, dynamic>))
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

/// An issue affecting a capability's health or operation.
///
/// @nodoc
class CapabilityIssue {
  /// A code identifying the type of issue. This can be used to programmatically
  /// handle specific issue types.
  final CapabilityIssueCode? code;

  /// A human-readable message describing the issue and potential remediation
  /// steps.
  final String? message;

  CapabilityIssue({
    this.code,
    this.message,
  });

  factory CapabilityIssue.fromJson(Map<String, dynamic> json) {
    return CapabilityIssue(
      code: (json['code'] as String?)?.let(CapabilityIssueCode.fromString),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
class CapabilityIssueCode {
  static const accessDenied = CapabilityIssueCode._('AccessDenied');
  static const clusterUnreachable = CapabilityIssueCode._('ClusterUnreachable');

  final String value;

  const CapabilityIssueCode._(this.value);

  static const values = [accessDenied, clusterUnreachable];

  static CapabilityIssueCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapabilityIssueCode._(value));

  @override
  bool operator ==(other) =>
      other is CapabilityIssueCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The response object containing Argo CD configuration details, including the
/// server URL that you use to access the Argo CD web interface and API.
///
/// @nodoc
class ArgoCdConfigResponse {
  /// The IAM Identity CenterIAM; Identity Center integration configuration.
  final ArgoCdAwsIdcConfigResponse? awsIdc;

  /// The Kubernetes namespace where Argo CD resources are monitored by your Argo
  /// CD Capability.
  final String? namespace;

  /// The network access configuration for the Argo CD capability's managed API
  /// server endpoint. If VPC endpoint IDs are specified, public access is blocked
  /// and the Argo CD server is only accessible through the specified VPC
  /// endpoints.
  final ArgoCdNetworkAccessConfigResponse? networkAccess;

  /// The list of role mappings that define which IAM Identity CenterIAM; Identity
  /// Center users or groups have which Argo CD roles.
  final List<ArgoCdRoleMapping>? rbacRoleMappings;

  /// The URL of the Argo CD server. Use this URL to access the Argo CD web
  /// interface and API.
  final String? serverUrl;

  ArgoCdConfigResponse({
    this.awsIdc,
    this.namespace,
    this.networkAccess,
    this.rbacRoleMappings,
    this.serverUrl,
  });

  factory ArgoCdConfigResponse.fromJson(Map<String, dynamic> json) {
    return ArgoCdConfigResponse(
      awsIdc: json['awsIdc'] != null
          ? ArgoCdAwsIdcConfigResponse.fromJson(
              json['awsIdc'] as Map<String, dynamic>)
          : null,
      namespace: json['namespace'] as String?,
      networkAccess: json['networkAccess'] != null
          ? ArgoCdNetworkAccessConfigResponse.fromJson(
              json['networkAccess'] as Map<String, dynamic>)
          : null,
      rbacRoleMappings: (json['rbacRoleMappings'] as List?)
          ?.nonNulls
          .map((e) => ArgoCdRoleMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverUrl: json['serverUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsIdc = this.awsIdc;
    final namespace = this.namespace;
    final networkAccess = this.networkAccess;
    final rbacRoleMappings = this.rbacRoleMappings;
    final serverUrl = this.serverUrl;
    return {
      if (awsIdc != null) 'awsIdc': awsIdc,
      if (namespace != null) 'namespace': namespace,
      if (networkAccess != null) 'networkAccess': networkAccess,
      if (rbacRoleMappings != null) 'rbacRoleMappings': rbacRoleMappings,
      if (serverUrl != null) 'serverUrl': serverUrl,
    };
  }
}

/// The response object containing IAM Identity CenterIAM; Identity Center
/// configuration details for an Argo CD capability.
///
/// @nodoc
class ArgoCdAwsIdcConfigResponse {
  /// The Amazon Resource Name (ARN) of the IAM Identity CenterIAM; Identity
  /// Center instance used for authentication.
  final String? idcInstanceArn;

  /// The Amazon Resource Name (ARN) of the managed application created in IAM
  /// Identity CenterIAM; Identity Center for this Argo CD capability. This
  /// application is automatically created and managed by Amazon EKS.
  final String? idcManagedApplicationArn;

  /// The Region where the IAM Identity CenterIAM; Identity Center instance is
  /// located.
  final String? idcRegion;

  ArgoCdAwsIdcConfigResponse({
    this.idcInstanceArn,
    this.idcManagedApplicationArn,
    this.idcRegion,
  });

  factory ArgoCdAwsIdcConfigResponse.fromJson(Map<String, dynamic> json) {
    return ArgoCdAwsIdcConfigResponse(
      idcInstanceArn: json['idcInstanceArn'] as String?,
      idcManagedApplicationArn: json['idcManagedApplicationArn'] as String?,
      idcRegion: json['idcRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idcInstanceArn = this.idcInstanceArn;
    final idcManagedApplicationArn = this.idcManagedApplicationArn;
    final idcRegion = this.idcRegion;
    return {
      if (idcInstanceArn != null) 'idcInstanceArn': idcInstanceArn,
      if (idcManagedApplicationArn != null)
        'idcManagedApplicationArn': idcManagedApplicationArn,
      if (idcRegion != null) 'idcRegion': idcRegion,
    };
  }
}

/// The response object containing network access configuration for the Argo CD
/// capability's managed API server endpoint. If VPC endpoint IDs are present,
/// public access is blocked and the Argo CD server is only accessible through
/// the specified VPC endpoints.
///
/// @nodoc
class ArgoCdNetworkAccessConfigResponse {
  /// The list of VPC endpoint IDs associated with the managed Argo CD API server
  /// endpoint. Each VPC endpoint provides private connectivity from a specific
  /// VPC to the Argo CD server.
  final List<String>? vpceIds;

  ArgoCdNetworkAccessConfigResponse({
    this.vpceIds,
  });

  factory ArgoCdNetworkAccessConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return ArgoCdNetworkAccessConfigResponse(
      vpceIds:
          (json['vpceIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vpceIds = this.vpceIds;
    return {
      if (vpceIds != null) 'vpceIds': vpceIds,
    };
  }
}

/// Information about an add-on.
///
/// @nodoc
class AddonInfo {
  /// The name of the add-on.
  final String? addonName;

  /// An object representing information about available add-on versions and
  /// compatible Kubernetes versions.
  final List<AddonVersionInfo>? addonVersions;

  /// The default Kubernetes namespace where this addon is typically installed if
  /// no custom namespace is specified.
  final String? defaultNamespace;

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
    this.defaultNamespace,
    this.marketplaceInformation,
    this.owner,
    this.publisher,
    this.type,
  });

  factory AddonInfo.fromJson(Map<String, dynamic> json) {
    return AddonInfo(
      addonName: json['addonName'] as String?,
      addonVersions: (json['addonVersions'] as List?)
          ?.nonNulls
          .map((e) => AddonVersionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultNamespace: json['defaultNamespace'] as String?,
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
    final defaultNamespace = this.defaultNamespace;
    final marketplaceInformation = this.marketplaceInformation;
    final owner = this.owner;
    final publisher = this.publisher;
    final type = this.type;
    return {
      if (addonName != null) 'addonName': addonName,
      if (addonVersions != null) 'addonVersions': addonVersions,
      if (defaultNamespace != null) 'defaultNamespace': defaultNamespace,
      if (marketplaceInformation != null)
        'marketplaceInformation': marketplaceInformation,
      if (owner != null) 'owner': owner,
      if (publisher != null) 'publisher': publisher,
      if (type != null) 'type': type,
    };
  }
}

/// Information about an Amazon EKS add-on from the Amazon Web Services
/// Marketplace.
///
/// @nodoc
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

/// Information about an add-on version.
///
/// @nodoc
class AddonVersionInfo {
  /// The version of the add-on.
  final String? addonVersion;

  /// The architectures that the version supports.
  final List<String>? architecture;

  /// An object representing the compatibilities of a version.
  final List<Compatibility>? compatibilities;

  /// Indicates the compute type of the add-on version.
  final List<String>? computeTypes;

  /// Whether the add-on requires configuration.
  final bool? requiresConfiguration;

  /// Indicates if the add-on requires IAM Permissions to operate, such as
  /// networking permissions.
  final bool? requiresIamPermissions;

  AddonVersionInfo({
    this.addonVersion,
    this.architecture,
    this.compatibilities,
    this.computeTypes,
    this.requiresConfiguration,
    this.requiresIamPermissions,
  });

  factory AddonVersionInfo.fromJson(Map<String, dynamic> json) {
    return AddonVersionInfo(
      addonVersion: json['addonVersion'] as String?,
      architecture: (json['architecture'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      compatibilities: (json['compatibilities'] as List?)
          ?.nonNulls
          .map((e) => Compatibility.fromJson(e as Map<String, dynamic>))
          .toList(),
      computeTypes: (json['computeTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      requiresConfiguration: json['requiresConfiguration'] as bool?,
      requiresIamPermissions: json['requiresIamPermissions'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonVersion = this.addonVersion;
    final architecture = this.architecture;
    final compatibilities = this.compatibilities;
    final computeTypes = this.computeTypes;
    final requiresConfiguration = this.requiresConfiguration;
    final requiresIamPermissions = this.requiresIamPermissions;
    return {
      if (addonVersion != null) 'addonVersion': addonVersion,
      if (architecture != null) 'architecture': architecture,
      if (compatibilities != null) 'compatibilities': compatibilities,
      if (computeTypes != null) 'computeTypes': computeTypes,
      if (requiresConfiguration != null)
        'requiresConfiguration': requiresConfiguration,
      if (requiresIamPermissions != null)
        'requiresIamPermissions': requiresIamPermissions,
    };
  }
}

/// Compatibility information.
///
/// @nodoc
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
          ?.nonNulls
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

/// Information about how to configure IAM for an add-on.
///
/// @nodoc
class AddonPodIdentityConfiguration {
  /// A suggested IAM Policy for the add-on.
  final List<String>? recommendedManagedPolicies;

  /// The Kubernetes Service Account name used by the add-on.
  final String? serviceAccount;

  AddonPodIdentityConfiguration({
    this.recommendedManagedPolicies,
    this.serviceAccount,
  });

  factory AddonPodIdentityConfiguration.fromJson(Map<String, dynamic> json) {
    return AddonPodIdentityConfiguration(
      recommendedManagedPolicies: (json['recommendedManagedPolicies'] as List?)
          ?.nonNulls
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

/// An Amazon EKS add-on. For more information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html">Amazon
/// EKS add-ons</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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

  /// The namespace configuration for the addon. This specifies the Kubernetes
  /// namespace where the addon is installed.
  final AddonNamespaceConfigResponse? namespaceConfig;

  /// The owner of the add-on.
  final String? owner;

  /// An array of EKS Pod Identity associations owned by the add-on. Each
  /// association maps a role to a service account in a namespace in the cluster.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/add-ons-iam.html">Attach
  /// an IAM Role to an Amazon EKS add-on using EKS Pod Identity</a> in the
  /// <i>Amazon EKS User Guide</i>.
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
    this.namespaceConfig,
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
      namespaceConfig: json['namespaceConfig'] != null
          ? AddonNamespaceConfigResponse.fromJson(
              json['namespaceConfig'] as Map<String, dynamic>)
          : null,
      owner: json['owner'] as String?,
      podIdentityAssociations: (json['podIdentityAssociations'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      publisher: json['publisher'] as String?,
      serviceAccountRoleArn: json['serviceAccountRoleArn'] as String?,
      status: (json['status'] as String?)?.let(AddonStatus.fromString),
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
    final namespaceConfig = this.namespaceConfig;
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
      if (namespaceConfig != null) 'namespaceConfig': namespaceConfig,
      if (owner != null) 'owner': owner,
      if (podIdentityAssociations != null)
        'podIdentityAssociations': podIdentityAssociations,
      if (publisher != null) 'publisher': publisher,
      if (serviceAccountRoleArn != null)
        'serviceAccountRoleArn': serviceAccountRoleArn,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class AddonStatus {
  static const creating = AddonStatus._('CREATING');
  static const active = AddonStatus._('ACTIVE');
  static const createFailed = AddonStatus._('CREATE_FAILED');
  static const updating = AddonStatus._('UPDATING');
  static const deleting = AddonStatus._('DELETING');
  static const deleteFailed = AddonStatus._('DELETE_FAILED');
  static const degraded = AddonStatus._('DEGRADED');
  static const updateFailed = AddonStatus._('UPDATE_FAILED');

  final String value;

  const AddonStatus._(this.value);

  static const values = [
    creating,
    active,
    createFailed,
    updating,
    deleting,
    deleteFailed,
    degraded,
    updateFailed
  ];

  static AddonStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AddonStatus._(value));

  @override
  bool operator ==(other) => other is AddonStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The health of the add-on.
///
/// @nodoc
class AddonHealth {
  /// An object representing the health issues for an add-on.
  final List<AddonIssue>? issues;

  AddonHealth({
    this.issues,
  });

  factory AddonHealth.fromJson(Map<String, dynamic> json) {
    return AddonHealth(
      issues: (json['issues'] as List?)
          ?.nonNulls
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

/// The namespace configuration response object containing information about the
/// namespace where an addon is installed.
///
/// @nodoc
class AddonNamespaceConfigResponse {
  /// The name of the Kubernetes namespace where the addon is installed.
  final String? namespace;

  AddonNamespaceConfigResponse({
    this.namespace,
  });

  factory AddonNamespaceConfigResponse.fromJson(Map<String, dynamic> json) {
    return AddonNamespaceConfigResponse(
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

/// An issue related to an add-on.
///
/// @nodoc
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
      code: (json['code'] as String?)?.let(AddonIssueCode.fromString),
      message: json['message'] as String?,
      resourceIds: (json['resourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceIds = this.resourceIds;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
      if (resourceIds != null) 'resourceIds': resourceIds,
    };
  }
}

/// @nodoc
class AddonIssueCode {
  static const accessDenied = AddonIssueCode._('AccessDenied');
  static const internalFailure = AddonIssueCode._('InternalFailure');
  static const clusterUnreachable = AddonIssueCode._('ClusterUnreachable');
  static const insufficientNumberOfReplicas =
      AddonIssueCode._('InsufficientNumberOfReplicas');
  static const configurationConflict =
      AddonIssueCode._('ConfigurationConflict');
  static const admissionRequestDenied =
      AddonIssueCode._('AdmissionRequestDenied');
  static const unsupportedAddonModification =
      AddonIssueCode._('UnsupportedAddonModification');
  static const k8sResourceNotFound = AddonIssueCode._('K8sResourceNotFound');
  static const addonSubscriptionNeeded =
      AddonIssueCode._('AddonSubscriptionNeeded');
  static const addonPermissionFailure =
      AddonIssueCode._('AddonPermissionFailure');

  final String value;

  const AddonIssueCode._(this.value);

  static const values = [
    accessDenied,
    internalFailure,
    clusterUnreachable,
    insufficientNumberOfReplicas,
    configurationConflict,
    admissionRequestDenied,
    unsupportedAddonModification,
    k8sResourceNotFound,
    addonSubscriptionNeeded,
    addonPermissionFailure
  ];

  static AddonIssueCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AddonIssueCode._(value));

  @override
  bool operator ==(other) => other is AddonIssueCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration of your local Amazon EKS cluster on an Amazon Web Services
/// Outpost. Before creating a cluster on an Outpost, review <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-local-cluster-create.html">Creating
/// a local cluster on an Outpost</a> in the <i>Amazon EKS User Guide</i>. This
/// API isn't available for Amazon EKS clusters on the Amazon Web Services
/// cloud.
///
/// @nodoc
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

/// The access configuration information for the cluster.
///
/// @nodoc
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
        'authenticationMode': authenticationMode.value,
      if (bootstrapClusterCreatorAdminPermissions != null)
        'bootstrapClusterCreatorAdminPermissions':
            bootstrapClusterCreatorAdminPermissions,
    };
  }
}

/// The placement configuration for all the control plane instances of your
/// local Amazon EKS cluster on an Amazon Web Services Outpost. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/eks-outposts-capacity-considerations.html">Capacity
/// considerations</a> in the <i>Amazon EKS User Guide</i>.
///
/// @nodoc
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

/// Configuration settings for a capability. The structure of this object varies
/// depending on the capability type.
///
/// @nodoc
class CapabilityConfigurationRequest {
  /// Configuration settings specific to Argo CD capabilities. This field is only
  /// used when creating or updating an Argo CD capability.
  final ArgoCdConfigRequest? argoCd;

  CapabilityConfigurationRequest({
    this.argoCd,
  });

  Map<String, dynamic> toJson() {
    final argoCd = this.argoCd;
    return {
      if (argoCd != null) 'argoCd': argoCd,
    };
  }
}

/// Configuration settings for an Argo CD capability. This includes the
/// Kubernetes namespace, IAM Identity CenterIAM; Identity Center integration,
/// RBAC role mappings, and network access configuration.
///
/// @nodoc
class ArgoCdConfigRequest {
  /// Configuration for IAM Identity CenterIAM; Identity Center integration. When
  /// configured, users can authenticate to Argo CD using their IAM Identity
  /// CenterIAM; Identity Center credentials.
  final ArgoCdAwsIdcConfigRequest awsIdc;

  /// The Kubernetes namespace where Argo CD resources will be created. If not
  /// specified, the default namespace is used.
  final String? namespace;

  /// Configuration for network access to the Argo CD capability's managed API
  /// server endpoint. By default, the Argo CD server is accessible via a public
  /// endpoint. You can optionally specify one or more VPC endpoint IDs to enable
  /// private connectivity from your VPCs. When VPC endpoints are configured,
  /// public access is blocked and the Argo CD server is only accessible through
  /// the specified VPC endpoints.
  final ArgoCdNetworkAccessConfigRequest? networkAccess;

  /// A list of role mappings that define which IAM Identity CenterIAM; Identity
  /// Center users or groups have which Argo CD roles. Each mapping associates an
  /// Argo CD role (<code>ADMIN</code>, <code>EDITOR</code>, or
  /// <code>VIEWER</code>) with one or more IAM Identity CenterIAM; Identity
  /// Center identities.
  final List<ArgoCdRoleMapping>? rbacRoleMappings;

  ArgoCdConfigRequest({
    required this.awsIdc,
    this.namespace,
    this.networkAccess,
    this.rbacRoleMappings,
  });

  Map<String, dynamic> toJson() {
    final awsIdc = this.awsIdc;
    final namespace = this.namespace;
    final networkAccess = this.networkAccess;
    final rbacRoleMappings = this.rbacRoleMappings;
    return {
      'awsIdc': awsIdc,
      if (namespace != null) 'namespace': namespace,
      if (networkAccess != null) 'networkAccess': networkAccess,
      if (rbacRoleMappings != null) 'rbacRoleMappings': rbacRoleMappings,
    };
  }
}

/// Configuration for integrating Argo CD with IAM Identity CenterIAM; Identity
/// Center. This allows you to use your organization's identity provider for
/// authentication to Argo CD.
///
/// @nodoc
class ArgoCdAwsIdcConfigRequest {
  /// The Amazon Resource Name (ARN) of the IAM Identity CenterIAM; Identity
  /// Center instance to use for authentication.
  final String idcInstanceArn;

  /// The Region where your IAM Identity CenterIAM; Identity Center instance is
  /// located.
  final String? idcRegion;

  ArgoCdAwsIdcConfigRequest({
    required this.idcInstanceArn,
    this.idcRegion,
  });

  Map<String, dynamic> toJson() {
    final idcInstanceArn = this.idcInstanceArn;
    final idcRegion = this.idcRegion;
    return {
      'idcInstanceArn': idcInstanceArn,
      if (idcRegion != null) 'idcRegion': idcRegion,
    };
  }
}

/// The namespace configuration request object for specifying a custom namespace
/// when creating an addon.
///
/// @nodoc
class AddonNamespaceConfigRequest {
  /// The name of the Kubernetes namespace to install the addon in. Must be a
  /// valid RFC 1123 DNS label.
  final String? namespace;

  AddonNamespaceConfigRequest({
    this.namespace,
  });

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      if (namespace != null) 'namespace': namespace,
    };
  }
}

/// An object representing an OpenID Connect (OIDC) configuration. Before
/// associating an OIDC identity provider to your cluster, review the
/// considerations in <a
/// href="https://docs.aws.amazon.com/eks/latest/userguide/authenticate-oidc-identity-provider.html">Authenticating
/// users for your cluster from an OIDC identity provider</a> in the <i>Amazon
/// EKS User Guide</i>.
///
/// @nodoc
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

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

/// @nodoc
class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

/// @nodoc
class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ResourcePropagationDelayException extends _s.GenericAwsException {
  ResourcePropagationDelayException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourcePropagationDelayException',
            message: message);
}

/// @nodoc
class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedAvailabilityZoneException': (type, message) =>
      UnsupportedAvailabilityZoneException(type: type, message: message),
};
