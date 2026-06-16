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

/// Amazon Elastic VMware Service (Amazon EVS) is a service that you can use to
/// deploy a VMware Cloud Foundation (VCF) software environment directly on EC2
/// bare metal instances within an Amazon Virtual Private Cloud (VPC).
///
/// Workloads running on Amazon EVS are fully compatible with workloads running
/// on any standard VMware vSphere environment. This means that you can migrate
/// any VMware-based workload to Amazon EVS without workload modification.
class Evs {
  final _s.JsonProtocol _protocol;
  Evs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'evs',
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

  /// Returns information about VCF versions, ESX versions and EC2 instance
  /// types provided by Amazon EVS. For each VCF version, the response also
  /// includes the default ESX version and provided EC2 instance types.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetVersionsResponse> getVersions() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.GetVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for an Amazon EVS resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list tags
  /// for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.ListTagsForResource'
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

  /// Associates the specified tags to an Amazon EVS resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted. Tags
  /// that you create for Amazon EVS resources don't propagate to any other
  /// resources associated with the environment. For example, if you tag an
  /// environment with this operation, that tag doesn't automatically propagate
  /// to the VLAN subnets and hosts associated with the environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TagPolicyException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other environment or Amazon Web Services resources.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.TagResource'
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

  /// Deletes specified tags from an Amazon EVS resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TagPolicyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to delete tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to delete.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.UntagResource'
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

  /// Creates an Amazon EVS environment that runs VCF software, such as SDDC
  /// Manager, NSX Manager, and vCenter Server.
  ///
  /// During environment creation, Amazon EVS performs validations on DNS
  /// settings, provisions VLAN subnets and hosts, and deploys the supplied
  /// version of VCF.
  ///
  /// It can take several hours to create an environment. After the deployment
  /// completes, you can configure VCF in the vSphere user interface according
  /// to your needs.
  /// <important>
  /// When creating a new environment, the default ESX version for the selected
  /// VCF version will be used, you cannot choose a specific ESX version in
  /// <code>CreateEnvironment</code> action. When a host has been added with a
  /// specific ESX version, it can only be upgraded using vCenter Lifecycle
  /// Manager.
  /// </important> <note>
  /// You cannot use the <code>dedicatedHostId</code> and
  /// <code>placementGroupId</code> parameters together in the same
  /// <code>CreateEnvironment</code> action. This results in a
  /// <code>ValidationException</code> response.
  /// </note>
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [connectivityInfo] :
  /// The connectivity configuration for the environment. Amazon EVS requires
  /// that you specify two route server peer IDs. During environment creation,
  /// the route server endpoints peer with the NSX edges over the NSX uplink
  /// subnet, providing BGP-based dynamic routing for overlay networks.
  ///
  /// Parameter [hosts] :
  /// The ESX hosts to add to the environment. Amazon EVS requires that you
  /// provide details for a minimum of 4 hosts during environment creation.
  ///
  /// For each host, you must provide the desired hostname, EC2 SSH keypair
  /// name, and EC2 instance type. Optionally, you can also provide a partition
  /// or cluster placement group to use, or use Amazon EC2 Dedicated Hosts.
  ///
  /// Parameter [initialVlans] :
  /// The initial VLAN subnets for the Amazon EVS environment.
  /// <note>
  /// For each Amazon EVS VLAN subnet, you must specify a non-overlapping CIDR
  /// block. Amazon EVS VLAN subnets have a minimum CIDR block size of /28 and a
  /// maximum size of /24.
  /// </note>
  ///
  /// Parameter [licenseInfo] :
  /// The license information that Amazon EVS requires to create an environment.
  /// Amazon EVS requires two license keys: a VCF solution key and a vSAN
  /// license key. The VCF solution key must meet minimum core requirements, and
  /// the vSAN license key must meet minimum capacity requirements for your
  /// selected instance type.
  ///
  /// For information about minimum license requirements, see <a
  /// href="https://docs.aws.amazon.com/evs/latest/userguide/vcf-license-mgmt.html">the
  /// VCF subscriptions section</a> in the <i>Amazon EVS User Guide</i>.
  ///
  /// VCF licenses can be used for only one Amazon EVS environment. Amazon EVS
  /// does not support reuse of VCF licenses for multiple environments.
  ///
  /// VCF license information can be retrieved from the Broadcom portal.
  ///
  /// Parameter [serviceAccessSubnetId] :
  /// The subnet that is used to establish connectivity between the Amazon EVS
  /// control plane and VPC. Amazon EVS uses this subnet to validate mandatory
  /// DNS records for your VCF appliances and hosts and create the environment.
  ///
  /// Parameter [siteId] :
  /// The Broadcom Site ID that is allocated to you as part of your electronic
  /// software delivery. This ID allows customer access to the Broadcom portal,
  /// and is provided to you by Broadcom at the close of your software contract
  /// or contract renewal. Amazon EVS uses the Broadcom Site ID that you provide
  /// to meet Broadcom VCF license usage reporting requirements for Amazon EVS.
  ///
  /// Parameter [termsAccepted] :
  /// Customer confirmation that the customer has purchased and will continue to
  /// maintain the required number of VCF software licenses to cover all
  /// physical processor cores in the Amazon EVS environment. Information about
  /// your VCF software in Amazon EVS will be shared with Broadcom to verify
  /// license compliance. Amazon EVS does not validate license keys. To validate
  /// license keys, visit the Broadcom support portal.
  ///
  /// Parameter [vcfHostnames] :
  /// The DNS hostnames for the virtual machines that host the VCF management
  /// appliances. Amazon EVS requires that you provide DNS hostnames for the
  /// following appliances: vCenter, NSX Manager, SDDC Manager, and Cloud
  /// Builder.
  ///
  /// Parameter [vcfVersion] :
  /// The VCF version to use for the environment.
  ///
  /// Parameter [vpcId] :
  /// A unique ID for the VPC that the environment is deployed inside.
  ///
  /// Amazon EVS requires that all VPC subnets exist in a single Availability
  /// Zone in a Region where the service is available.
  ///
  /// The VPC that you specify must have a valid DHCP option set with domain
  /// name, at least two DNS servers, and an NTP server. These settings are used
  /// to configure your VCF appliances and hosts. The VPC cannot be used with
  /// any other deployed Amazon EVS environment. Amazon EVS does not provide
  /// multi-VPC support for environments at this time.
  ///
  /// Amazon EVS does not support the following Amazon Web Services networking
  /// options for NSX overlay connectivity: cross-Region VPC peering, Amazon S3
  /// gateway endpoints, or Amazon Web Services Direct Connect virtual private
  /// gateway associations.
  /// <note>
  /// Ensure that you specify a VPC that is adequately sized to accommodate the
  /// Amazon EVS subnets.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the environment creation request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  ///
  /// Parameter [environmentName] :
  /// The name to give to your environment. The name can contain only
  /// alphanumeric characters (case-sensitive), hyphens, and underscores. It
  /// must start with an alphanumeric character, and can't be longer than 100
  /// characters. The name must be unique within the Amazon Web Services Region
  /// and Amazon Web Services account that you're creating the environment in.
  ///
  /// Parameter [kmsKeyId] :
  /// A unique ID for the customer-managed KMS key that is used to encrypt the
  /// VCF credential pairs for SDDC Manager, NSX Manager, and vCenter
  /// appliances. These credentials are stored in Amazon Web Services Secrets
  /// Manager.
  ///
  /// Parameter [serviceAccessSecurityGroups] :
  /// The security group that controls communication between the Amazon EVS
  /// control plane and VPC. The default security group is used if a custom
  /// security group isn't specified.
  ///
  /// The security group should allow access to the following.
  ///
  /// <ul>
  /// <li>
  /// TCP/UDP access to the DNS servers
  /// </li>
  /// <li>
  /// HTTPS/SSH access to the host management VLAN subnet
  /// </li>
  /// <li>
  /// HTTPS/SSH access to the Management VM VLAN subnet
  /// </li>
  /// </ul>
  /// You should avoid modifying the security group rules after deployment, as
  /// this can break the persistent connection between the Amazon EVS control
  /// plane and VPC. This can cause future environment actions like adding or
  /// removing hosts to fail.
  ///
  /// Parameter [tags] :
  /// Metadata that assists with categorization and organization. Each tag
  /// consists of a key and an optional value. You define both. Tags don't
  /// propagate to any other cluster or Amazon Web Services resources.
  Future<CreateEnvironmentResponse> createEnvironment({
    required ConnectivityInfo connectivityInfo,
    required List<HostInfoForCreate> hosts,
    required InitialVlans initialVlans,
    required List<LicenseInfo> licenseInfo,
    required String serviceAccessSubnetId,
    required String siteId,
    required bool termsAccepted,
    required VcfHostnames vcfHostnames,
    required VcfVersion vcfVersion,
    required String vpcId,
    String? clientToken,
    String? environmentName,
    String? kmsKeyId,
    ServiceAccessSecurityGroups? serviceAccessSecurityGroups,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.CreateEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectivityInfo': connectivityInfo,
        'hosts': hosts,
        'initialVlans': initialVlans,
        'licenseInfo': licenseInfo,
        'serviceAccessSubnetId': serviceAccessSubnetId,
        'siteId': siteId,
        'termsAccepted': termsAccepted,
        'vcfHostnames': vcfHostnames,
        'vcfVersion': vcfVersion.value,
        'vpcId': vpcId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (environmentName != null) 'environmentName': environmentName,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (serviceAccessSecurityGroups != null)
          'serviceAccessSecurityGroups': serviceAccessSecurityGroups,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEnvironmentResponse.fromJson(jsonResponse.body);
  }

  /// Returns a description of the specified environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment.
  Future<GetEnvironmentResponse> getEnvironment({
    required String environmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.GetEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
      },
    );

    return GetEnvironmentResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon EVS environment.
  ///
  /// Amazon EVS environments will only be enabled for deletion once the hosts
  /// are deleted. You can delete hosts using the
  /// <code>DeleteEnvironmentHost</code> action.
  ///
  /// Environment deletion also deletes the associated Amazon EVS VLAN subnets
  /// and Amazon Web Services Secrets Manager secrets that Amazon EVS created.
  /// Amazon Web Services resources that you create are not deleted. These
  /// resources may continue to incur costs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID associated with the environment to be deleted.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the environment deletion request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<DeleteEnvironmentResponse> deleteEnvironment({
    required String environmentId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.DeleteEnvironment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteEnvironmentResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon EVS environments in your Amazon Web Services account in
  /// the specified Amazon Web Services Region.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page. If <code>nextToken</code> is
  /// returned, there are more results available. Make the call again using the
  /// returned token with all other arguments unchanged to retrieve the next
  /// page. Each pagination token expires after 24 hours. Using an expired
  /// pagination token will return an <i>HTTP 400 InvalidToken</i> error.
  ///
  /// Parameter [state] :
  /// The state of an environment. Used to filter response results to return
  /// only environments with the specified <code>environmentState</code>.
  Future<ListEnvironmentsResponse> listEnvironments({
    int? maxResults,
    String? nextToken,
    List<EnvironmentState>? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.ListEnvironments'
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
        if (state != null) 'state': state.map((e) => e.value).toList(),
      },
    );

    return ListEnvironmentsResponse.fromJson(jsonResponse.body);
  }

  /// Associates an Elastic IP address with a public HCX VLAN. This operation is
  /// only allowed for public HCX VLANs at this time.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allocationId] :
  /// The Elastic IP address allocation ID.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment containing the VLAN that the Elastic IP
  /// address associates with.
  ///
  /// Parameter [vlanName] :
  /// The name of the VLAN. <code>hcx</code> is the only accepted VLAN name at
  /// this time.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the environment creation request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<AssociateEipToVlanResponse> associateEipToVlan({
    required String allocationId,
    required String environmentId,
    required String vlanName,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.AssociateEipToVlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'allocationId': allocationId,
        'environmentId': environmentId,
        'vlanName': vlanName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return AssociateEipToVlanResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Windows Server License entitlement for virtual machines in an
  /// Amazon EVS environment using the provided vCenter Server connector. This
  /// is an asynchronous operation. Amazon EVS validates the specified virtual
  /// machines before starting usage tracking.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// A unique ID for the connector associated with the entitlement.
  ///
  /// Parameter [entitlementType] :
  /// The type of entitlement to create.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment to create the entitlement in.
  ///
  /// Parameter [vmIds] :
  /// The list of VMware vSphere virtual machine managed object IDs to create
  /// entitlements for.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the entitlement creation request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<CreateEntitlementResponse> createEntitlement({
    required String connectorId,
    required EntitlementType entitlementType,
    required String environmentId,
    required List<String> vmIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.CreateEntitlement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
        'entitlementType': entitlementType.value,
        'environmentId': environmentId,
        'vmIds': vmIds,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateEntitlementResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connector for an Amazon EVS environment. A connector establishes
  /// a connection to a VCF appliance, such as vCenter, using a fully qualified
  /// domain name and an Amazon Web Services Secrets Manager secret that stores
  /// the appliance credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applianceFqdn] :
  /// The fully qualified domain name (FQDN) of the VCF appliance that the
  /// connector targets.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment to create the connector in.
  ///
  /// Parameter [secretIdentifier] :
  /// The ARN or name of the Amazon Web Services Secrets Manager secret that
  /// stores the credentials for the VCF appliance.
  /// <important>
  /// Do not use credentials with Administrator privileges. We recommend using a
  /// service account with the minimum required permissions.
  /// </important>
  ///
  /// Parameter [type] :
  /// The type of connector to create.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the connector creation request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<CreateEnvironmentConnectorResponse> createEnvironmentConnector({
    required String applianceFqdn,
    required String environmentId,
    required String secretIdentifier,
    required ConnectorType type,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.CreateEnvironmentConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'applianceFqdn': applianceFqdn,
        'environmentId': environmentId,
        'secretIdentifier': secretIdentifier,
        'type': type.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateEnvironmentConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Creates an ESX host and adds it to an Amazon EVS environment. Amazon EVS
  /// supports 4-32 hosts per environment.
  ///
  /// This action can only be used after the Amazon EVS environment is deployed.
  ///
  /// You can use the <code>dedicatedHostId</code> parameter to specify an
  /// Amazon EC2 Dedicated Host for ESX host creation.
  ///
  /// You can use the <code>placementGroupId</code> parameter to specify a
  /// cluster or partition placement group to launch EC2 instances into.
  /// <note>
  /// If you don't specify an ESX version when adding hosts using
  /// <code>CreateEnvironmentHost</code> action, Amazon EVS automatically uses
  /// the default ESX version associated with your environment's VCF version. To
  /// find the default ESX version for a particular VCF version, use the
  /// <code>GetVersions</code> action.
  /// </note> <note>
  /// You cannot use the <code>dedicatedHostId</code> and
  /// <code>placementGroupId</code> parameters together in the same
  /// <code>CreateEnvironmentHost</code> action. This results in a
  /// <code>ValidationException</code> response.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment that the host is added to.
  ///
  /// Parameter [host] :
  /// The host that is created and added to the environment.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the host creation request. If you do not specify a client
  /// token, a randomly generated token is used for the request to ensure
  /// idempotency.
  ///
  /// Parameter [esxVersion] :
  /// The ESX version to use for the host.
  Future<CreateEnvironmentHostResponse> createEnvironmentHost({
    required String environmentId,
    required HostInfoForCreate host,
    String? clientToken,
    String? esxVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.CreateEnvironmentHost'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'host': host,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (esxVersion != null) 'esxVersion': esxVersion,
      },
    );

    return CreateEnvironmentHostResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Windows Server License entitlement for virtual machines in an
  /// Amazon EVS environment. Deleting an entitlement stops usage tracking for
  /// the specified virtual machines.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// A unique ID for the connector associated with the entitlement.
  ///
  /// Parameter [entitlementType] :
  /// The type of entitlement to delete.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment that the entitlement belongs to.
  ///
  /// Parameter [vmIds] :
  /// The list of VMware vSphere virtual machine managed object IDs to delete
  /// entitlements for.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the entitlement deletion request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<DeleteEntitlementResponse> deleteEntitlement({
    required String connectorId,
    required EntitlementType entitlementType,
    required String environmentId,
    required List<String> vmIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.DeleteEntitlement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
        'entitlementType': entitlementType.value,
        'environmentId': environmentId,
        'vmIds': vmIds,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteEntitlementResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a connector from an Amazon EVS environment.
  /// <note>
  /// Before deleting a connector, you must remove all entitlements that are
  /// associated with the same vCenter.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// A unique ID for the connector to be deleted.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment that the connector belongs to.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the connector deletion request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<DeleteEnvironmentConnectorResponse> deleteEnvironmentConnector({
    required String connectorId,
    required String environmentId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.DeleteEnvironmentConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
        'environmentId': environmentId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteEnvironmentConnectorResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a host from an Amazon EVS environment.
  /// <note>
  /// Before deleting a host, you must unassign and decommission the host from
  /// within the SDDC Manager user interface. Not doing so could impact the
  /// availability of your virtual machines or result in data loss.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the host's environment.
  ///
  /// Parameter [hostName] :
  /// The DNS hostname associated with the host to be deleted.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the host deletion request. If you do not specify a client
  /// token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<DeleteEnvironmentHostResponse> deleteEnvironmentHost({
    required String environmentId,
    required String hostName,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.DeleteEnvironmentHost'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        'hostName': hostName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteEnvironmentHostResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates an Elastic IP address from a public HCX VLAN. This operation
  /// is only allowed for public HCX VLANs at this time.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associationId] :
  /// A unique ID for the Elastic IP address association.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment containing the VLAN that the Elastic IP
  /// address disassociates from.
  ///
  /// Parameter [vlanName] :
  /// The name of the VLAN. <code>hcx</code> is the only accepted VLAN name at
  /// this time.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the environment creation request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  Future<DisassociateEipFromVlanResponse> disassociateEipFromVlan({
    required String associationId,
    required String environmentId,
    required String vlanName,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.DisassociateEipFromVlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'associationId': associationId,
        'environmentId': environmentId,
        'vlanName': vlanName,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DisassociateEipFromVlanResponse.fromJson(jsonResponse.body);
  }

  /// Returns a URL and authentication token for accessing the Amazon EVS Custom
  /// Addon depot. Configure the depot URL as a download source in vSphere
  /// Lifecycle Manager (vLCM) to sync and install the Amazon EVS Custom Addon.
  ///
  /// The depot URL remains active until you rotate the authentication token by
  /// calling this action with <code>rotate</code> set to <code>true</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// The unique ID of the Amazon EVS environment to get the depot URL for.
  ///
  /// Parameter [rotate] :
  /// Revokes the current authentication token and returns a new depot URL with
  /// a new token. Previously issued depot URLs will stop working within 5
  /// minutes of rotation.
  Future<GetDepotUrlResponse> getDepotUrl({
    required String environmentId,
    bool? rotate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.GetDepotUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (rotate != null) 'rotate': rotate,
      },
    );

    return GetDepotUrlResponse.fromJson(jsonResponse.body);
  }

  /// Lists the connectors within an environment. Returns the status of each
  /// connector and its applicable checks, among other connector details.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page. If <code>nextToken</code> is
  /// returned, there are more results available. Make the call again using the
  /// returned token with all other arguments unchanged to retrieve the next
  /// page. Each pagination token expires after 24 hours. Using an expired
  /// pagination token will return an <i>HTTP 400 InvalidToken</i> error.
  Future<ListEnvironmentConnectorsResponse> listEnvironmentConnectors({
    required String environmentId,
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
      'X-Amz-Target': 'AmazonElasticVMwareService.ListEnvironmentConnectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentConnectorsResponse.fromJson(jsonResponse.body);
  }

  /// List the hosts within an environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page. If <code>nextToken</code> is
  /// returned, there are more results available. Make the call again using the
  /// returned token with all other arguments unchanged to retrieve the next
  /// page. Each pagination token expires after 24 hours. Using an expired
  /// pagination token will return an <i>HTTP 400 InvalidToken</i> error.
  Future<ListEnvironmentHostsResponse> listEnvironmentHosts({
    required String environmentId,
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
      'X-Amz-Target': 'AmazonElasticVMwareService.ListEnvironmentHosts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentHostsResponse.fromJson(jsonResponse.body);
  }

  /// Lists environment VLANs that are associated with the specified
  /// environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page. If <code>nextToken</code> is
  /// returned, there are more results available. Make the call again using the
  /// returned token with all other arguments unchanged to retrieve the next
  /// page. Each pagination token expires after 24 hours. Using an expired
  /// pagination token will return an <i>HTTP 400 InvalidToken</i> error.
  Future<ListEnvironmentVlansResponse> listEnvironmentVlans({
    required String environmentId,
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
      'X-Amz-Target': 'AmazonElasticVMwareService.ListEnvironmentVlans'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnvironmentVlansResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Windows Server License entitlements for virtual machines in an
  /// Amazon EVS environment. Returns existing entitlements for virtual machines
  /// associated with the specified environment and connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// A unique ID for the connector.
  ///
  /// Parameter [entitlementType] :
  /// The type of entitlement to list.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If you specify
  /// <code>MaxResults</code> in the request, the response includes information
  /// up to the limit specified.
  ///
  /// Parameter [nextToken] :
  /// A unique pagination token for each page. If <code>nextToken</code> is
  /// returned, there are more results available. Make the call again using the
  /// returned token with all other arguments unchanged to retrieve the next
  /// page. Each pagination token expires after 24 hours. Using an expired
  /// pagination token will return an <i>HTTP 400 InvalidToken</i> error.
  Future<ListVmEntitlementsResponse> listVmEntitlements({
    required String connectorId,
    required EntitlementType entitlementType,
    required String environmentId,
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
      'X-Amz-Target': 'AmazonElasticVMwareService.ListVmEntitlements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
        'entitlementType': entitlementType.value,
        'environmentId': environmentId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListVmEntitlementsResponse.fromJson(jsonResponse.body);
  }

  /// Updates a connector for an Amazon EVS environment. You can update the
  /// Amazon Web Services Secrets Manager secret ARN or the appliance FQDN to
  /// reconfigure the connector metadata.
  /// <note>
  /// You cannot update both the secret and the FQDN in the same request.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorId] :
  /// A unique ID for the connector to update.
  ///
  /// Parameter [environmentId] :
  /// A unique ID for the environment that the connector belongs to.
  ///
  /// Parameter [applianceFqdn] :
  /// The new fully qualified domain name (FQDN) of the VCF appliance that the
  /// connector connects to.
  ///
  /// Parameter [clientToken] :
  /// <note>
  /// This parameter is not used in Amazon EVS currently. If you supply input
  /// for this parameter, it will have no effect.
  /// </note>
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the connector update request. If you do not specify a
  /// client token, a randomly generated token is used for the request to ensure
  /// idempotency.
  ///
  /// Parameter [secretIdentifier] :
  /// The new ARN or name of the Amazon Web Services Secrets Manager secret that
  /// stores the credentials for the VCF appliance.
  Future<UpdateEnvironmentConnectorResponse> updateEnvironmentConnector({
    required String connectorId,
    required String environmentId,
    String? applianceFqdn,
    String? clientToken,
    String? secretIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AmazonElasticVMwareService.UpdateEnvironmentConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
        'environmentId': environmentId,
        if (applianceFqdn != null) 'applianceFqdn': applianceFqdn,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (secretIdentifier != null) 'secretIdentifier': secretIdentifier,
      },
    );

    return UpdateEnvironmentConnectorResponse.fromJson(jsonResponse.body);
  }
}

class GetVersionsResponse {
  /// A list of EC2 instance types and their available ESX versions.
  final List<InstanceTypeEsxVersionsInfo> instanceTypeEsxVersions;

  /// A list of VCF versions with their availability status, default ESX version,
  /// and instance types.
  final List<VcfVersionInfo> vcfVersions;

  GetVersionsResponse({
    required this.instanceTypeEsxVersions,
    required this.vcfVersions,
  });

  factory GetVersionsResponse.fromJson(Map<String, dynamic> json) {
    return GetVersionsResponse(
      instanceTypeEsxVersions: ((json['instanceTypeEsxVersions'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              InstanceTypeEsxVersionsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      vcfVersions: ((json['vcfVersions'] as List?) ?? const [])
          .nonNulls
          .map((e) => VcfVersionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypeEsxVersions = this.instanceTypeEsxVersions;
    final vcfVersions = this.vcfVersions;
    return {
      'instanceTypeEsxVersions': instanceTypeEsxVersions,
      'vcfVersions': vcfVersions,
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

class CreateEnvironmentResponse {
  /// A description of the created environment.
  final Environment? environment;

  CreateEnvironmentResponse({
    this.environment,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class GetEnvironmentResponse {
  /// A description of the requested environment.
  final Environment? environment;

  GetEnvironmentResponse({
    this.environment,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class DeleteEnvironmentResponse {
  /// A description of the deleted environment.
  final Environment? environment;

  DeleteEnvironmentResponse({
    this.environment,
  });

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class ListEnvironmentsResponse {
  /// A list of environments with summarized environment details.
  final List<EnvironmentSummary>? environmentSummaries;

  /// A unique pagination token for next page results. Make the call again using
  /// this token to retrieve the next page.
  final String? nextToken;

  ListEnvironmentsResponse({
    this.environmentSummaries,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environmentSummaries: (json['environmentSummaries'] as List?)
          ?.nonNulls
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentSummaries = this.environmentSummaries;
    final nextToken = this.nextToken;
    return {
      if (environmentSummaries != null)
        'environmentSummaries': environmentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateEipToVlanResponse {
  final Vlan? vlan;

  AssociateEipToVlanResponse({
    this.vlan,
  });

  factory AssociateEipToVlanResponse.fromJson(Map<String, dynamic> json) {
    return AssociateEipToVlanResponse(
      vlan: json['vlan'] != null
          ? Vlan.fromJson(json['vlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vlan = this.vlan;
    return {
      if (vlan != null) 'vlan': vlan,
    };
  }
}

class CreateEntitlementResponse {
  /// A list of the created entitlements.
  final List<VmEntitlement>? entitlements;

  CreateEntitlementResponse({
    this.entitlements,
  });

  factory CreateEntitlementResponse.fromJson(Map<String, dynamic> json) {
    return CreateEntitlementResponse(
      entitlements: (json['entitlements'] as List?)
          ?.nonNulls
          .map((e) => VmEntitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    return {
      if (entitlements != null) 'entitlements': entitlements,
    };
  }
}

class CreateEnvironmentConnectorResponse {
  /// A description of the created connector.
  final Connector? connector;

  CreateEnvironmentConnectorResponse({
    this.connector,
  });

  factory CreateEnvironmentConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateEnvironmentConnectorResponse(
      connector: json['connector'] != null
          ? Connector.fromJson(json['connector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connector = this.connector;
    return {
      if (connector != null) 'connector': connector,
    };
  }
}

class CreateEnvironmentHostResponse {
  /// A summary of the environment that the host is created in.
  final EnvironmentSummary? environmentSummary;

  /// A description of the created host.
  final Host? host;

  CreateEnvironmentHostResponse({
    this.environmentSummary,
    this.host,
  });

  factory CreateEnvironmentHostResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentHostResponse(
      environmentSummary: json['environmentSummary'] != null
          ? EnvironmentSummary.fromJson(
              json['environmentSummary'] as Map<String, dynamic>)
          : null,
      host: json['host'] != null
          ? Host.fromJson(json['host'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentSummary = this.environmentSummary;
    final host = this.host;
    return {
      if (environmentSummary != null) 'environmentSummary': environmentSummary,
      if (host != null) 'host': host,
    };
  }
}

class DeleteEntitlementResponse {
  /// A list of the deleted entitlements.
  final List<VmEntitlement>? entitlements;

  DeleteEntitlementResponse({
    this.entitlements,
  });

  factory DeleteEntitlementResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEntitlementResponse(
      entitlements: (json['entitlements'] as List?)
          ?.nonNulls
          .map((e) => VmEntitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    return {
      if (entitlements != null) 'entitlements': entitlements,
    };
  }
}

class DeleteEnvironmentConnectorResponse {
  /// A description of the deleted connector.
  final Connector? connector;

  /// A summary of the environment that the connector was deleted from.
  final EnvironmentSummary? environmentSummary;

  DeleteEnvironmentConnectorResponse({
    this.connector,
    this.environmentSummary,
  });

  factory DeleteEnvironmentConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteEnvironmentConnectorResponse(
      connector: json['connector'] != null
          ? Connector.fromJson(json['connector'] as Map<String, dynamic>)
          : null,
      environmentSummary: json['environmentSummary'] != null
          ? EnvironmentSummary.fromJson(
              json['environmentSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connector = this.connector;
    final environmentSummary = this.environmentSummary;
    return {
      if (connector != null) 'connector': connector,
      if (environmentSummary != null) 'environmentSummary': environmentSummary,
    };
  }
}

class DeleteEnvironmentHostResponse {
  /// A summary of the environment that the host was deleted from.
  final EnvironmentSummary? environmentSummary;

  /// A description of the deleted host.
  final Host? host;

  DeleteEnvironmentHostResponse({
    this.environmentSummary,
    this.host,
  });

  factory DeleteEnvironmentHostResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEnvironmentHostResponse(
      environmentSummary: json['environmentSummary'] != null
          ? EnvironmentSummary.fromJson(
              json['environmentSummary'] as Map<String, dynamic>)
          : null,
      host: json['host'] != null
          ? Host.fromJson(json['host'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentSummary = this.environmentSummary;
    final host = this.host;
    return {
      if (environmentSummary != null) 'environmentSummary': environmentSummary,
      if (host != null) 'host': host,
    };
  }
}

class DisassociateEipFromVlanResponse {
  final Vlan? vlan;

  DisassociateEipFromVlanResponse({
    this.vlan,
  });

  factory DisassociateEipFromVlanResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateEipFromVlanResponse(
      vlan: json['vlan'] != null
          ? Vlan.fromJson(json['vlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vlan = this.vlan;
    return {
      if (vlan != null) 'vlan': vlan,
    };
  }
}

class GetDepotUrlResponse {
  /// The URL for accessing the Amazon EVS Custom Addon depot. This URL includes
  /// the authentication token as a path component.
  final String depotUrl;

  /// The authentication token for depot access. This token is included in the
  /// depot URL and is used to authenticate requests.
  final String token;

  GetDepotUrlResponse({
    required this.depotUrl,
    required this.token,
  });

  factory GetDepotUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetDepotUrlResponse(
      depotUrl: (json['depotUrl'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final depotUrl = this.depotUrl;
    final token = this.token;
    return {
      'depotUrl': depotUrl,
      'token': token,
    };
  }
}

class ListEnvironmentConnectorsResponse {
  /// A list of connectors in the environment.
  final List<Connector>? connectors;

  /// A unique pagination token for next page results. Make the call again using
  /// this token to retrieve the next page.
  final String? nextToken;

  ListEnvironmentConnectorsResponse({
    this.connectors,
    this.nextToken,
  });

  factory ListEnvironmentConnectorsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEnvironmentConnectorsResponse(
      connectors: (json['connectors'] as List?)
          ?.nonNulls
          .map((e) => Connector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectors = this.connectors;
    final nextToken = this.nextToken;
    return {
      if (connectors != null) 'connectors': connectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentHostsResponse {
  /// A list of hosts in the environment.
  final List<Host>? environmentHosts;

  /// A unique pagination token for next page results. Make the call again using
  /// this token to retrieve the next page.
  final String? nextToken;

  ListEnvironmentHostsResponse({
    this.environmentHosts,
    this.nextToken,
  });

  factory ListEnvironmentHostsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentHostsResponse(
      environmentHosts: (json['environmentHosts'] as List?)
          ?.nonNulls
          .map((e) => Host.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentHosts = this.environmentHosts;
    final nextToken = this.nextToken;
    return {
      if (environmentHosts != null) 'environmentHosts': environmentHosts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentVlansResponse {
  /// A list of VLANs that are associated with the specified environment.
  final List<Vlan>? environmentVlans;

  /// A unique pagination token for next page results. Make the call again using
  /// this token to retrieve the next page.
  final String? nextToken;

  ListEnvironmentVlansResponse({
    this.environmentVlans,
    this.nextToken,
  });

  factory ListEnvironmentVlansResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentVlansResponse(
      environmentVlans: (json['environmentVlans'] as List?)
          ?.nonNulls
          .map((e) => Vlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentVlans = this.environmentVlans;
    final nextToken = this.nextToken;
    return {
      if (environmentVlans != null) 'environmentVlans': environmentVlans,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListVmEntitlementsResponse {
  /// A list of entitlements for virtual machines in the environment.
  final List<VmEntitlement>? entitlements;

  /// A unique pagination token for next page results. Make the call again using
  /// this token to retrieve the next page.
  final String? nextToken;

  ListVmEntitlementsResponse({
    this.entitlements,
    this.nextToken,
  });

  factory ListVmEntitlementsResponse.fromJson(Map<String, dynamic> json) {
    return ListVmEntitlementsResponse(
      entitlements: (json['entitlements'] as List?)
          ?.nonNulls
          .map((e) => VmEntitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    final nextToken = this.nextToken;
    return {
      if (entitlements != null) 'entitlements': entitlements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpdateEnvironmentConnectorResponse {
  /// A description of the updated connector.
  final Connector? connector;

  UpdateEnvironmentConnectorResponse({
    this.connector,
  });

  factory UpdateEnvironmentConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateEnvironmentConnectorResponse(
      connector: json['connector'] != null
          ? Connector.fromJson(json['connector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connector = this.connector;
    return {
      if (connector != null) 'connector': connector,
    };
  }
}

/// An object that represents a connector for an Amazon EVS environment. A
/// connector establishes a vCenter connection using the credentials stored in
/// Amazon Web Services Secrets Manager.
class Connector {
  /// The fully qualified domain name (FQDN) of the VCF appliance that the
  /// connector connects to.
  final String? applianceFqdn;

  /// A list of checks that are run on the connector.
  final List<ConnectorCheck>? checks;

  /// The unique ID of the connector.
  final String? connectorId;

  /// The date and time that the connector was created.
  final DateTime? createdAt;

  /// The unique ID of the environment that the connector belongs to.
  final String? environmentId;

  /// The date and time that the connector was modified.
  final DateTime? modifiedAt;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret that stores the credentials for the VCF appliance.
  final String? secretArn;

  /// The state of the connector.
  final ConnectorState? state;

  /// A detailed description of the connector state.
  final String? stateDetails;

  /// The status of the connector.
  final CheckResult? status;

  /// The type of the connector.
  final ConnectorType? type;

  Connector({
    this.applianceFqdn,
    this.checks,
    this.connectorId,
    this.createdAt,
    this.environmentId,
    this.modifiedAt,
    this.secretArn,
    this.state,
    this.stateDetails,
    this.status,
    this.type,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      applianceFqdn: json['applianceFqdn'] as String?,
      checks: (json['checks'] as List?)
          ?.nonNulls
          .map((e) => ConnectorCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectorId: json['connectorId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      environmentId: json['environmentId'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      secretArn: json['secretArn'] as String?,
      state: (json['state'] as String?)?.let(ConnectorState.fromString),
      stateDetails: json['stateDetails'] as String?,
      status: (json['status'] as String?)?.let(CheckResult.fromString),
      type: (json['type'] as String?)?.let(ConnectorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applianceFqdn = this.applianceFqdn;
    final checks = this.checks;
    final connectorId = this.connectorId;
    final createdAt = this.createdAt;
    final environmentId = this.environmentId;
    final modifiedAt = this.modifiedAt;
    final secretArn = this.secretArn;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final status = this.status;
    final type = this.type;
    return {
      if (applianceFqdn != null) 'applianceFqdn': applianceFqdn,
      if (checks != null) 'checks': checks,
      if (connectorId != null) 'connectorId': connectorId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (environmentId != null) 'environmentId': environmentId,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (secretArn != null) 'secretArn': secretArn,
      if (state != null) 'state': state.value,
      if (stateDetails != null) 'stateDetails': stateDetails,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

class ConnectorType {
  static const vcenter = ConnectorType._('VCENTER');

  final String value;

  const ConnectorType._(this.value);

  static const values = [vcenter];

  static ConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorType._(value));

  @override
  bool operator ==(other) => other is ConnectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConnectorState {
  static const creating = ConnectorState._('CREATING');
  static const createFailed = ConnectorState._('CREATE_FAILED');
  static const active = ConnectorState._('ACTIVE');
  static const updating = ConnectorState._('UPDATING');
  static const updateFailed = ConnectorState._('UPDATE_FAILED');
  static const deleting = ConnectorState._('DELETING');
  static const deleted = ConnectorState._('DELETED');

  final String value;

  const ConnectorState._(this.value);

  static const values = [
    creating,
    createFailed,
    active,
    updating,
    updateFailed,
    deleting,
    deleted
  ];

  static ConnectorState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectorState._(value));

  @override
  bool operator ==(other) => other is ConnectorState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CheckResult {
  static const passed = CheckResult._('PASSED');
  static const failed = CheckResult._('FAILED');
  static const unknown = CheckResult._('UNKNOWN');

  final String value;

  const CheckResult._(this.value);

  static const values = [passed, failed, unknown];

  static CheckResult fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CheckResult._(value));

  @override
  bool operator ==(other) => other is CheckResult && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A check on a connector to identify connectivity health.
class ConnectorCheck {
  /// The time when connector health began to be impaired.
  final DateTime? impairedSince;

  /// The date and time of the last check attempt.
  final DateTime? lastCheckAttempt;

  /// The check result.
  final CheckResult? result;

  /// The check type.
  final CheckType? type;

  ConnectorCheck({
    this.impairedSince,
    this.lastCheckAttempt,
    this.result,
    this.type,
  });

  factory ConnectorCheck.fromJson(Map<String, dynamic> json) {
    return ConnectorCheck(
      impairedSince: timeStampFromJson(json['impairedSince']),
      lastCheckAttempt: timeStampFromJson(json['lastCheckAttempt']),
      result: (json['result'] as String?)?.let(CheckResult.fromString),
      type: (json['type'] as String?)?.let(CheckType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final impairedSince = this.impairedSince;
    final lastCheckAttempt = this.lastCheckAttempt;
    final result = this.result;
    final type = this.type;
    return {
      if (impairedSince != null)
        'impairedSince': unixTimestampToJson(impairedSince),
      if (lastCheckAttempt != null)
        'lastCheckAttempt': unixTimestampToJson(lastCheckAttempt),
      if (result != null) 'result': result.value,
      if (type != null) 'type': type.value,
    };
  }
}

class CheckType {
  static const keyReuse = CheckType._('KEY_REUSE');
  static const keyCoverage = CheckType._('KEY_COVERAGE');
  static const reachability = CheckType._('REACHABILITY');
  static const hostCount = CheckType._('HOST_COUNT');
  static const vcenterReachability = CheckType._('VCENTER_REACHABILITY');
  static const vcenterVmSync = CheckType._('VCENTER_VM_SYNC');
  static const vcenterVmEvent = CheckType._('VCENTER_VM_EVENT');

  final String value;

  const CheckType._(this.value);

  static const values = [
    keyReuse,
    keyCoverage,
    reachability,
    hostCount,
    vcenterReachability,
    vcenterVmSync,
    vcenterVmEvent
  ];

  static CheckType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CheckType._(value));

  @override
  bool operator ==(other) => other is CheckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that represents a Windows Server License entitlement for a virtual
/// machine in an Amazon EVS environment.
class VmEntitlement {
  /// The unique ID of the connector associated with the entitlement.
  final String? connectorId;

  /// The unique ID of the environment.
  final String? environmentId;

  /// The error details associated with the entitlement, if applicable.
  final ErrorDetail? errorDetail;

  /// The date and time that the entitlement was last synced.
  final DateTime? lastSyncedAt;

  /// The date and time that the entitlement started.
  final DateTime? startedAt;

  /// The status of the entitlement.
  final EntitlementStatus? status;

  /// The date and time that the entitlement stopped.
  final DateTime? stoppedAt;

  /// The type of entitlement.
  final EntitlementType? type;

  /// The unique ID of the virtual machine.
  final String? vmId;

  /// The name of the virtual machine.
  final String? vmName;

  VmEntitlement({
    this.connectorId,
    this.environmentId,
    this.errorDetail,
    this.lastSyncedAt,
    this.startedAt,
    this.status,
    this.stoppedAt,
    this.type,
    this.vmId,
    this.vmName,
  });

  factory VmEntitlement.fromJson(Map<String, dynamic> json) {
    return VmEntitlement(
      connectorId: json['connectorId'] as String?,
      environmentId: json['environmentId'] as String?,
      errorDetail: json['errorDetail'] != null
          ? ErrorDetail.fromJson(json['errorDetail'] as Map<String, dynamic>)
          : null,
      lastSyncedAt: timeStampFromJson(json['lastSyncedAt']),
      startedAt: timeStampFromJson(json['startedAt']),
      status: (json['status'] as String?)?.let(EntitlementStatus.fromString),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
      type: (json['type'] as String?)?.let(EntitlementType.fromString),
      vmId: json['vmId'] as String?,
      vmName: json['vmName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorId = this.connectorId;
    final environmentId = this.environmentId;
    final errorDetail = this.errorDetail;
    final lastSyncedAt = this.lastSyncedAt;
    final startedAt = this.startedAt;
    final status = this.status;
    final stoppedAt = this.stoppedAt;
    final type = this.type;
    final vmId = this.vmId;
    final vmName = this.vmName;
    return {
      if (connectorId != null) 'connectorId': connectorId,
      if (environmentId != null) 'environmentId': environmentId,
      if (errorDetail != null) 'errorDetail': errorDetail,
      if (lastSyncedAt != null)
        'lastSyncedAt': unixTimestampToJson(lastSyncedAt),
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (status != null) 'status': status.value,
      if (stoppedAt != null) 'stoppedAt': unixTimestampToJson(stoppedAt),
      if (type != null) 'type': type.value,
      if (vmId != null) 'vmId': vmId,
      if (vmName != null) 'vmName': vmName,
    };
  }
}

class EntitlementType {
  static const windowsServer = EntitlementType._('WINDOWS_SERVER');

  final String value;

  const EntitlementType._(this.value);

  static const values = [windowsServer];

  static EntitlementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntitlementType._(value));

  @override
  bool operator ==(other) => other is EntitlementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EntitlementStatus {
  static const creating = EntitlementStatus._('CREATING');
  static const created = EntitlementStatus._('CREATED');
  static const deleted = EntitlementStatus._('DELETED');
  static const atRisk = EntitlementStatus._('AT_RISK');
  static const entitlementRemoved = EntitlementStatus._('ENTITLEMENT_REMOVED');
  static const createFailed = EntitlementStatus._('CREATE_FAILED');

  final String value;

  const EntitlementStatus._(this.value);

  static const values = [
    creating,
    created,
    deleted,
    atRisk,
    entitlementRemoved,
    createFailed
  ];

  static EntitlementStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntitlementStatus._(value));

  @override
  bool operator ==(other) => other is EntitlementStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains error details for an entitlement.
class ErrorDetail {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  ErrorDetail({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: (json['errorCode'] as String?) ?? '',
      errorMessage: (json['errorMessage'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
    };
  }
}

/// The VLANs that Amazon EVS creates during environment creation.
class Vlan {
  /// The availability zone of the VLAN.
  final String? availabilityZone;

  /// The CIDR block of the VLAN. Amazon EVS VLAN subnets have a minimum CIDR
  /// block size of /28 and a maximum size of /24.
  final String? cidr;

  /// The date and time that the VLAN was created.
  final DateTime? createdAt;

  /// An array of Elastic IP address associations.
  final List<EipAssociation>? eipAssociations;

  /// The VMware VCF traffic type that is carried over the VLAN. For example, a
  /// VLAN with a <code>functionName</code> of <code>hcx</code> is being used to
  /// carry VMware HCX traffic.
  final String? functionName;

  /// Determines if the VLAN that Amazon EVS provisions is public or private.
  final bool? isPublic;

  /// The date and time that the VLAN was modified.
  final DateTime? modifiedAt;

  /// A unique ID for a network access control list.
  final String? networkAclId;

  /// The state details of the VLAN.
  final String? stateDetails;

  /// The unique ID of the VLAN subnet.
  final String? subnetId;

  /// The unique ID of the VLAN.
  final int? vlanId;

  /// The state of the VLAN.
  final VlanState? vlanState;

  Vlan({
    this.availabilityZone,
    this.cidr,
    this.createdAt,
    this.eipAssociations,
    this.functionName,
    this.isPublic,
    this.modifiedAt,
    this.networkAclId,
    this.stateDetails,
    this.subnetId,
    this.vlanId,
    this.vlanState,
  });

  factory Vlan.fromJson(Map<String, dynamic> json) {
    return Vlan(
      availabilityZone: json['availabilityZone'] as String?,
      cidr: json['cidr'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      eipAssociations: (json['eipAssociations'] as List?)
          ?.nonNulls
          .map((e) => EipAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      functionName: json['functionName'] as String?,
      isPublic: json['isPublic'] as bool?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      networkAclId: json['networkAclId'] as String?,
      stateDetails: json['stateDetails'] as String?,
      subnetId: json['subnetId'] as String?,
      vlanId: json['vlanId'] as int?,
      vlanState: (json['vlanState'] as String?)?.let(VlanState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final cidr = this.cidr;
    final createdAt = this.createdAt;
    final eipAssociations = this.eipAssociations;
    final functionName = this.functionName;
    final isPublic = this.isPublic;
    final modifiedAt = this.modifiedAt;
    final networkAclId = this.networkAclId;
    final stateDetails = this.stateDetails;
    final subnetId = this.subnetId;
    final vlanId = this.vlanId;
    final vlanState = this.vlanState;
    return {
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (cidr != null) 'cidr': cidr,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (eipAssociations != null) 'eipAssociations': eipAssociations,
      if (functionName != null) 'functionName': functionName,
      if (isPublic != null) 'isPublic': isPublic,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (networkAclId != null) 'networkAclId': networkAclId,
      if (stateDetails != null) 'stateDetails': stateDetails,
      if (subnetId != null) 'subnetId': subnetId,
      if (vlanId != null) 'vlanId': vlanId,
      if (vlanState != null) 'vlanState': vlanState.value,
    };
  }
}

class VlanState {
  static const creating = VlanState._('CREATING');
  static const created = VlanState._('CREATED');
  static const deleting = VlanState._('DELETING');
  static const deleted = VlanState._('DELETED');
  static const createFailed = VlanState._('CREATE_FAILED');

  final String value;

  const VlanState._(this.value);

  static const values = [creating, created, deleting, deleted, createFailed];

  static VlanState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VlanState._(value));

  @override
  bool operator ==(other) => other is VlanState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Elastic IP address association with the elastic network interface in the
/// VLAN subnet.
class EipAssociation {
  /// The Elastic IP address allocation ID.
  final String? allocationId;

  /// A unique ID for the elastic IP address association with the VLAN subnet.
  final String? associationId;

  /// The Elastic IP address.
  final String? ipAddress;

  EipAssociation({
    this.allocationId,
    this.associationId,
    this.ipAddress,
  });

  factory EipAssociation.fromJson(Map<String, dynamic> json) {
    return EipAssociation(
      allocationId: json['allocationId'] as String?,
      associationId: json['associationId'] as String?,
      ipAddress: json['ipAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationId = this.allocationId;
    final associationId = this.associationId;
    final ipAddress = this.ipAddress;
    return {
      if (allocationId != null) 'allocationId': allocationId,
      if (associationId != null) 'associationId': associationId,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }
}

/// An ESX host that runs on an Amazon EC2 bare metal instance. Four hosts are
/// created in an Amazon EVS environment during environment creation. You can
/// add hosts to an environment using the <code>CreateEnvironmentHost</code>
/// operation. Amazon EVS supports 4-32 hosts per environment.
class Host {
  /// The date and time that the host was created.
  final DateTime? createdAt;

  /// The unique ID of the Amazon EC2 Dedicated Host.
  final String? dedicatedHostId;

  /// The unique ID of the EC2 instance that represents the host.
  final String? ec2InstanceId;

  /// The DNS hostname of the host. DNS hostnames for hosts must be unique across
  /// Amazon EVS environments and within VCF.
  final String? hostName;

  /// The state of the host.
  final HostState? hostState;

  /// The EC2 instance type of the host.
  /// <note>
  /// EC2 instances created through Amazon EVS do not support associating an IAM
  /// instance profile.
  /// </note>
  final InstanceType? instanceType;

  /// The IP address of the host.
  final String? ipAddress;

  /// The name of the SSH key that is used to access the host.
  final String? keyName;

  /// The date and time that the host was modified.
  final DateTime? modifiedAt;

  /// The elastic network interfaces that are attached to the host.
  final List<NetworkInterface>? networkInterfaces;

  /// The unique ID of the placement group where the host is placed.
  final String? placementGroupId;

  /// A detailed description of the <code>hostState</code> of a host.
  final String? stateDetails;

  Host({
    this.createdAt,
    this.dedicatedHostId,
    this.ec2InstanceId,
    this.hostName,
    this.hostState,
    this.instanceType,
    this.ipAddress,
    this.keyName,
    this.modifiedAt,
    this.networkInterfaces,
    this.placementGroupId,
    this.stateDetails,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      createdAt: timeStampFromJson(json['createdAt']),
      dedicatedHostId: json['dedicatedHostId'] as String?,
      ec2InstanceId: json['ec2InstanceId'] as String?,
      hostName: json['hostName'] as String?,
      hostState: (json['hostState'] as String?)?.let(HostState.fromString),
      instanceType:
          (json['instanceType'] as String?)?.let(InstanceType.fromString),
      ipAddress: json['ipAddress'] as String?,
      keyName: json['keyName'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.nonNulls
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementGroupId: json['placementGroupId'] as String?,
      stateDetails: json['stateDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dedicatedHostId = this.dedicatedHostId;
    final ec2InstanceId = this.ec2InstanceId;
    final hostName = this.hostName;
    final hostState = this.hostState;
    final instanceType = this.instanceType;
    final ipAddress = this.ipAddress;
    final keyName = this.keyName;
    final modifiedAt = this.modifiedAt;
    final networkInterfaces = this.networkInterfaces;
    final placementGroupId = this.placementGroupId;
    final stateDetails = this.stateDetails;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dedicatedHostId != null) 'dedicatedHostId': dedicatedHostId,
      if (ec2InstanceId != null) 'ec2InstanceId': ec2InstanceId,
      if (hostName != null) 'hostName': hostName,
      if (hostState != null) 'hostState': hostState.value,
      if (instanceType != null) 'instanceType': instanceType.value,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (keyName != null) 'keyName': keyName,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (placementGroupId != null) 'placementGroupId': placementGroupId,
      if (stateDetails != null) 'stateDetails': stateDetails,
    };
  }
}

class InstanceType {
  static const i4iMetal = InstanceType._('i4i.metal');
  static const i7iMetal_24xl = InstanceType._('i7i.metal-24xl');

  final String value;

  const InstanceType._(this.value);

  static const values = [i4iMetal, i7iMetal_24xl];

  static InstanceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InstanceType._(value));

  @override
  bool operator ==(other) => other is InstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class HostState {
  static const creating = HostState._('CREATING');
  static const created = HostState._('CREATED');
  static const updating = HostState._('UPDATING');
  static const deleting = HostState._('DELETING');
  static const deleted = HostState._('DELETED');
  static const createFailed = HostState._('CREATE_FAILED');
  static const updateFailed = HostState._('UPDATE_FAILED');

  final String value;

  const HostState._(this.value);

  static const values = [
    creating,
    created,
    updating,
    deleting,
    deleted,
    createFailed,
    updateFailed
  ];

  static HostState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => HostState._(value));

  @override
  bool operator ==(other) => other is HostState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An elastic network interface (ENI) that connects hosts to the VLAN subnets.
/// Amazon EVS provisions two identically configured ENIs in the VMkernel
/// management subnet during host creation. One ENI is active, and the other is
/// in standby mode for automatic switchover during a failure scenario.
class NetworkInterface {
  /// The unique ID of the elastic network interface.
  final String? networkInterfaceId;

  NetworkInterface({
    this.networkInterfaceId,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      networkInterfaceId: json['networkInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceId = this.networkInterfaceId;
    return {
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
    };
  }
}

/// A list of environments with summarized environment details.
class EnvironmentSummary {
  /// The date and time that the environment was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) that is associated with the environment.
  final String? environmentArn;

  /// A unique ID for the environment.
  final String? environmentId;

  /// The name of the environment.
  final String? environmentName;

  /// The state of an environment.
  final EnvironmentState? environmentState;

  /// Reports impaired functionality that stems from issues internal to the
  /// environment, such as impaired reachability.
  final CheckResult? environmentStatus;

  /// The date and time that the environment was modified.
  final DateTime? modifiedAt;

  /// The VCF version of the environment.
  final VcfVersion? vcfVersion;

  EnvironmentSummary({
    this.createdAt,
    this.environmentArn,
    this.environmentId,
    this.environmentName,
    this.environmentState,
    this.environmentStatus,
    this.modifiedAt,
    this.vcfVersion,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentName: json['environmentName'] as String?,
      environmentState: (json['environmentState'] as String?)
          ?.let(EnvironmentState.fromString),
      environmentStatus:
          (json['environmentStatus'] as String?)?.let(CheckResult.fromString),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      vcfVersion: (json['vcfVersion'] as String?)?.let(VcfVersion.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentName = this.environmentName;
    final environmentState = this.environmentState;
    final environmentStatus = this.environmentStatus;
    final modifiedAt = this.modifiedAt;
    final vcfVersion = this.vcfVersion;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentName != null) 'environmentName': environmentName,
      if (environmentState != null) 'environmentState': environmentState.value,
      if (environmentStatus != null)
        'environmentStatus': environmentStatus.value,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (vcfVersion != null) 'vcfVersion': vcfVersion.value,
    };
  }
}

class VcfVersion {
  static const vcf_5_2_1 = VcfVersion._('VCF-5.2.1');
  static const vcf_5_2_2 = VcfVersion._('VCF-5.2.2');

  final String value;

  const VcfVersion._(this.value);

  static const values = [vcf_5_2_1, vcf_5_2_2];

  static VcfVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VcfVersion._(value));

  @override
  bool operator ==(other) => other is VcfVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EnvironmentState {
  static const creating = EnvironmentState._('CREATING');
  static const created = EnvironmentState._('CREATED');
  static const deleting = EnvironmentState._('DELETING');
  static const deleted = EnvironmentState._('DELETED');
  static const createFailed = EnvironmentState._('CREATE_FAILED');

  final String value;

  const EnvironmentState._(this.value);

  static const values = [creating, created, deleting, deleted, createFailed];

  static EnvironmentState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnvironmentState._(value));

  @override
  bool operator ==(other) => other is EnvironmentState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that represents a host.
/// <note>
/// You cannot use <code>dedicatedHostId</code> and
/// <code>placementGroupId</code> together in the same
/// <code>HostInfoForCreate</code>object. This results in a
/// <code>ValidationException</code> response.
/// </note>
class HostInfoForCreate {
  /// The DNS hostname of the host. DNS hostnames for hosts must be unique across
  /// Amazon EVS environments and within VCF.
  final String hostName;

  /// The EC2 instance type that represents the host.
  final InstanceType instanceType;

  /// The name of the SSH key that is used to access the host.
  final String keyName;

  /// The unique ID of the Amazon EC2 Dedicated Host.
  final String? dedicatedHostId;

  /// The unique ID of the placement group where the host is placed.
  final String? placementGroupId;

  HostInfoForCreate({
    required this.hostName,
    required this.instanceType,
    required this.keyName,
    this.dedicatedHostId,
    this.placementGroupId,
  });

  Map<String, dynamic> toJson() {
    final hostName = this.hostName;
    final instanceType = this.instanceType;
    final keyName = this.keyName;
    final dedicatedHostId = this.dedicatedHostId;
    final placementGroupId = this.placementGroupId;
    return {
      'hostName': hostName,
      'instanceType': instanceType.value,
      'keyName': keyName,
      if (dedicatedHostId != null) 'dedicatedHostId': dedicatedHostId,
      if (placementGroupId != null) 'placementGroupId': placementGroupId,
    };
  }
}

/// An object that represents an Amazon EVS environment.
class Environment {
  /// A check on the environment to identify instance health and VMware VCF
  /// licensing issues.
  final List<Check>? checks;

  /// The connectivity configuration for the environment. Amazon EVS requires that
  /// you specify two route server peer IDs. During environment creation, the
  /// route server endpoints peer with the NSX uplink VLAN for connectivity to the
  /// NSX overlay network.
  final ConnectivityInfo? connectivityInfo;

  /// The date and time that the environment was created.
  final DateTime? createdAt;

  /// The VCF credentials that are stored as Amazon EVS managed secrets in Amazon
  /// Web Services Secrets Manager.
  ///
  /// Amazon EVS stores credentials that are needed to install vCenter Server,
  /// NSX, and SDDC Manager.
  final List<Secret>? credentials;

  /// The Amazon Resource Name (ARN) that is associated with the environment.
  final String? environmentArn;

  /// The unique ID for the environment.
  final String? environmentId;

  /// The name of the environment.
  final String? environmentName;

  /// The state of an environment.
  final EnvironmentState? environmentState;

  /// Reports impaired functionality that stems from issues internal to the
  /// environment, such as impaired reachability.
  final CheckResult? environmentStatus;

  /// The Amazon Web Services KMS key ID that Amazon Web Services Secrets Manager
  /// uses to encrypt secrets that are associated with the environment. These
  /// secrets contain the VCF credentials that are needed to install vCenter
  /// Server, NSX, and SDDC Manager.
  ///
  /// By default, Amazon EVS use the Amazon Web Services Secrets Manager managed
  /// key <code>aws/secretsmanager</code>. You can also specify a customer managed
  /// key.
  final String? kmsKeyId;

  /// The license information that Amazon EVS requires to create an environment.
  /// Amazon EVS requires two license keys: a VCF solution key and a vSAN license
  /// key. The VCF solution key must meet minimum core requirements, and the vSAN
  /// license key must meet minimum capacity requirements for your selected
  /// instance type.
  ///
  /// For information about minimum license requirements, see <a
  /// href="https://docs.aws.amazon.com/evs/latest/userguide/vcf-license-mgmt.html">the
  /// VCF subscriptions section</a> in the <i>Amazon EVS User Guide</i>.
  final List<LicenseInfo>? licenseInfo;

  /// The date and time that the environment was modified.
  final DateTime? modifiedAt;

  /// The security groups that allow traffic between the Amazon EVS control plane
  /// and your VPC for service access. If a security group is not specified,
  /// Amazon EVS uses the default security group in your account for service
  /// access.
  final ServiceAccessSecurityGroups? serviceAccessSecurityGroups;

  /// The subnet that is used to establish connectivity between the Amazon EVS
  /// control plane and VPC. Amazon EVS uses this subnet to perform validations
  /// and create the environment.
  final String? serviceAccessSubnetId;

  /// The Broadcom Site ID that is associated with your Amazon EVS environment.
  /// Amazon EVS uses the Broadcom Site ID that you provide to meet Broadcom VCF
  /// license usage reporting requirements for Amazon EVS.
  final String? siteId;

  /// A detailed description of the <code>environmentState</code> of an
  /// environment.
  final String? stateDetails;

  /// Customer confirmation that the customer has purchased and will continue to
  /// maintain the required number of VCF software licenses to cover all physical
  /// processor cores in the Amazon EVS environment. Information about your VCF
  /// software in Amazon EVS will be shared with Broadcom to verify license
  /// compliance. Amazon EVS does not validate license keys. To validate license
  /// keys, visit the Broadcom support portal.
  final bool? termsAccepted;

  /// The DNS hostnames to be used by the VCF management appliances in your
  /// environment.
  ///
  /// For environment creation to be successful, each hostname entry must resolve
  /// to a domain name that you've registered in your DNS service of choice and
  /// configured in the DHCP option set of your VPC. DNS hostnames cannot be
  /// changed after environment creation has started.
  final VcfHostnames? vcfHostnames;

  /// The VCF version of the environment.
  final VcfVersion? vcfVersion;

  /// The VPC associated with the environment.
  final String? vpcId;

  Environment({
    this.checks,
    this.connectivityInfo,
    this.createdAt,
    this.credentials,
    this.environmentArn,
    this.environmentId,
    this.environmentName,
    this.environmentState,
    this.environmentStatus,
    this.kmsKeyId,
    this.licenseInfo,
    this.modifiedAt,
    this.serviceAccessSecurityGroups,
    this.serviceAccessSubnetId,
    this.siteId,
    this.stateDetails,
    this.termsAccepted,
    this.vcfHostnames,
    this.vcfVersion,
    this.vpcId,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      checks: (json['checks'] as List?)
          ?.nonNulls
          .map((e) => Check.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectivityInfo: json['connectivityInfo'] != null
          ? ConnectivityInfo.fromJson(
              json['connectivityInfo'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      credentials: (json['credentials'] as List?)
          ?.nonNulls
          .map((e) => Secret.fromJson(e as Map<String, dynamic>))
          .toList(),
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentName: json['environmentName'] as String?,
      environmentState: (json['environmentState'] as String?)
          ?.let(EnvironmentState.fromString),
      environmentStatus:
          (json['environmentStatus'] as String?)?.let(CheckResult.fromString),
      kmsKeyId: json['kmsKeyId'] as String?,
      licenseInfo: (json['licenseInfo'] as List?)
          ?.nonNulls
          .map((e) => LicenseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      serviceAccessSecurityGroups: json['serviceAccessSecurityGroups'] != null
          ? ServiceAccessSecurityGroups.fromJson(
              json['serviceAccessSecurityGroups'] as Map<String, dynamic>)
          : null,
      serviceAccessSubnetId: json['serviceAccessSubnetId'] as String?,
      siteId: json['siteId'] as String?,
      stateDetails: json['stateDetails'] as String?,
      termsAccepted: json['termsAccepted'] as bool?,
      vcfHostnames: json['vcfHostnames'] != null
          ? VcfHostnames.fromJson(json['vcfHostnames'] as Map<String, dynamic>)
          : null,
      vcfVersion: (json['vcfVersion'] as String?)?.let(VcfVersion.fromString),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checks = this.checks;
    final connectivityInfo = this.connectivityInfo;
    final createdAt = this.createdAt;
    final credentials = this.credentials;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentName = this.environmentName;
    final environmentState = this.environmentState;
    final environmentStatus = this.environmentStatus;
    final kmsKeyId = this.kmsKeyId;
    final licenseInfo = this.licenseInfo;
    final modifiedAt = this.modifiedAt;
    final serviceAccessSecurityGroups = this.serviceAccessSecurityGroups;
    final serviceAccessSubnetId = this.serviceAccessSubnetId;
    final siteId = this.siteId;
    final stateDetails = this.stateDetails;
    final termsAccepted = this.termsAccepted;
    final vcfHostnames = this.vcfHostnames;
    final vcfVersion = this.vcfVersion;
    final vpcId = this.vpcId;
    return {
      if (checks != null) 'checks': checks,
      if (connectivityInfo != null) 'connectivityInfo': connectivityInfo,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentials != null) 'credentials': credentials,
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentName != null) 'environmentName': environmentName,
      if (environmentState != null) 'environmentState': environmentState.value,
      if (environmentStatus != null)
        'environmentStatus': environmentStatus.value,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (licenseInfo != null) 'licenseInfo': licenseInfo,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (serviceAccessSecurityGroups != null)
        'serviceAccessSecurityGroups': serviceAccessSecurityGroups,
      if (serviceAccessSubnetId != null)
        'serviceAccessSubnetId': serviceAccessSubnetId,
      if (siteId != null) 'siteId': siteId,
      if (stateDetails != null) 'stateDetails': stateDetails,
      if (termsAccepted != null) 'termsAccepted': termsAccepted,
      if (vcfHostnames != null) 'vcfHostnames': vcfHostnames,
      if (vcfVersion != null) 'vcfVersion': vcfVersion.value,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// The connectivity configuration for the environment. Amazon EVS requires that
/// you specify two route server peer IDs. During environment creation, the
/// route server endpoints peer with the NSX uplink VLAN for connectivity to the
/// NSX overlay network.
class ConnectivityInfo {
  /// The unique IDs for private route server peers.
  final List<String> privateRouteServerPeerings;

  ConnectivityInfo({
    required this.privateRouteServerPeerings,
  });

  factory ConnectivityInfo.fromJson(Map<String, dynamic> json) {
    return ConnectivityInfo(
      privateRouteServerPeerings:
          ((json['privateRouteServerPeerings'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final privateRouteServerPeerings = this.privateRouteServerPeerings;
    return {
      'privateRouteServerPeerings': privateRouteServerPeerings,
    };
  }
}

/// The DNS hostnames that Amazon EVS uses to install VMware vCenter Server,
/// NSX, SDDC Manager, and Cloud Builder. Each hostname must be unique, and
/// resolve to a domain name that you've registered in your DNS service of
/// choice. Hostnames cannot be changed.
///
/// VMware VCF requires the deployment of two NSX Edge nodes, and three NSX
/// Manager virtual machines.
class VcfHostnames {
  /// The hostname for VMware Cloud Builder.
  final String cloudBuilder;

  /// The VMware NSX hostname.
  final String nsx;

  /// The hostname for the first NSX Edge node.
  final String nsxEdge1;

  /// The hostname for the second NSX Edge node.
  final String nsxEdge2;

  /// The hostname for the first VMware NSX Manager virtual machine (VM).
  final String nsxManager1;

  /// The hostname for the second VMware NSX Manager virtual machine (VM).
  final String nsxManager2;

  /// The hostname for the third VMware NSX Manager virtual machine (VM).
  final String nsxManager3;

  /// The hostname for SDDC Manager.
  final String sddcManager;

  /// The VMware vCenter hostname.
  final String vCenter;

  VcfHostnames({
    required this.cloudBuilder,
    required this.nsx,
    required this.nsxEdge1,
    required this.nsxEdge2,
    required this.nsxManager1,
    required this.nsxManager2,
    required this.nsxManager3,
    required this.sddcManager,
    required this.vCenter,
  });

  factory VcfHostnames.fromJson(Map<String, dynamic> json) {
    return VcfHostnames(
      cloudBuilder: (json['cloudBuilder'] as String?) ?? '',
      nsx: (json['nsx'] as String?) ?? '',
      nsxEdge1: (json['nsxEdge1'] as String?) ?? '',
      nsxEdge2: (json['nsxEdge2'] as String?) ?? '',
      nsxManager1: (json['nsxManager1'] as String?) ?? '',
      nsxManager2: (json['nsxManager2'] as String?) ?? '',
      nsxManager3: (json['nsxManager3'] as String?) ?? '',
      sddcManager: (json['sddcManager'] as String?) ?? '',
      vCenter: (json['vCenter'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cloudBuilder = this.cloudBuilder;
    final nsx = this.nsx;
    final nsxEdge1 = this.nsxEdge1;
    final nsxEdge2 = this.nsxEdge2;
    final nsxManager1 = this.nsxManager1;
    final nsxManager2 = this.nsxManager2;
    final nsxManager3 = this.nsxManager3;
    final sddcManager = this.sddcManager;
    final vCenter = this.vCenter;
    return {
      'cloudBuilder': cloudBuilder,
      'nsx': nsx,
      'nsxEdge1': nsxEdge1,
      'nsxEdge2': nsxEdge2,
      'nsxManager1': nsxManager1,
      'nsxManager2': nsxManager2,
      'nsxManager3': nsxManager3,
      'sddcManager': sddcManager,
      'vCenter': vCenter,
    };
  }
}

/// The security groups that allow traffic between the Amazon EVS control plane
/// and your VPC for Amazon EVS service access. If a security group is not
/// specified, Amazon EVS uses the default security group in your account for
/// service access.
class ServiceAccessSecurityGroups {
  /// The security groups that allow service access.
  final List<String>? securityGroups;

  ServiceAccessSecurityGroups({
    this.securityGroups,
  });

  factory ServiceAccessSecurityGroups.fromJson(Map<String, dynamic> json) {
    return ServiceAccessSecurityGroups(
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroups = this.securityGroups;
    return {
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

/// A managed secret that contains the credentials for installing vCenter
/// Server, NSX, and SDDC Manager. During environment creation, the Amazon EVS
/// control plane uses Amazon Web Services Secrets Manager to create, encrypt,
/// validate, and store secrets. If you choose to delete your environment,
/// Amazon EVS also deletes the secrets that are associated with your
/// environment. Amazon EVS does not provide managed rotation of secrets. We
/// recommend that you rotate secrets regularly to ensure that secrets are not
/// long-lived.
class Secret {
  /// The Amazon Resource Name (ARN) of the secret.
  final String? secretArn;

  Secret({
    this.secretArn,
  });

  factory Secret.fromJson(Map<String, dynamic> json) {
    return Secret(
      secretArn: json['secretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    return {
      if (secretArn != null) 'secretArn': secretArn,
    };
  }
}

/// A check on the environment to identify environment health and validate
/// VMware VCF licensing compliance.
class Check {
  /// The time when environment health began to be impaired.
  final DateTime? impairedSince;

  /// The check result.
  final CheckResult? result;

  /// The check type. Amazon EVS performs the following checks.
  ///
  /// <ul>
  /// <li>
  /// <code>KEY_REUSE</code>: checks that the VCF license key is not used by
  /// another Amazon EVS environment. This check fails if a used license is added
  /// to the environment.
  /// </li>
  /// <li>
  /// <code>KEY_COVERAGE</code>: checks that your VCF license key allocates
  /// sufficient vCPU cores for all deployed hosts. The check fails when any
  /// assigned hosts in the EVS environment are not covered by license keys, or
  /// when any unassigned hosts cannot be covered by available vCPU cores in keys.
  /// </li>
  /// <li>
  /// <code>REACHABILITY</code>: checks that the Amazon EVS control plane has a
  /// persistent connection to SDDC Manager. If Amazon EVS cannot reach the
  /// environment, this check fails.
  /// </li>
  /// <li>
  /// <code>HOST_COUNT</code>: Checks that your environment has a minimum of 4
  /// hosts.
  ///
  /// If this check fails, you will need to add hosts so that your environment
  /// meets this minimum requirement. Amazon EVS only supports environments with
  /// 4-32 hosts.
  /// </li>
  /// </ul>
  final CheckType? type;

  Check({
    this.impairedSince,
    this.result,
    this.type,
  });

  factory Check.fromJson(Map<String, dynamic> json) {
    return Check(
      impairedSince: timeStampFromJson(json['impairedSince']),
      result: (json['result'] as String?)?.let(CheckResult.fromString),
      type: (json['type'] as String?)?.let(CheckType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final impairedSince = this.impairedSince;
    final result = this.result;
    final type = this.type;
    return {
      if (impairedSince != null)
        'impairedSince': unixTimestampToJson(impairedSince),
      if (result != null) 'result': result.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// The license information that Amazon EVS requires to create an environment.
/// Amazon EVS requires two license keys: a VCF solution key and a vSAN license
/// key.
class LicenseInfo {
  /// The VCF solution key. This license unlocks VMware VCF product features,
  /// including vSphere, NSX, SDDC Manager, and vCenter Server. The VCF solution
  /// key must meet the instance-type-specific minimum core requirements.
  final String solutionKey;

  /// The VSAN license key. This license unlocks vSAN features. The vSAN license
  /// key must meet the instance-type-specific minimum capacity requirements.
  final String vsanKey;

  LicenseInfo({
    required this.solutionKey,
    required this.vsanKey,
  });

  factory LicenseInfo.fromJson(Map<String, dynamic> json) {
    return LicenseInfo(
      solutionKey: (json['solutionKey'] as String?) ?? '',
      vsanKey: (json['vsanKey'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final solutionKey = this.solutionKey;
    final vsanKey = this.vsanKey;
    return {
      'solutionKey': solutionKey,
      'vsanKey': vsanKey,
    };
  }
}

/// The initial VLAN subnets for the environment. Amazon EVS VLAN subnets have a
/// minimum CIDR block size of /28 and a maximum size of /24. Amazon EVS VLAN
/// subnet CIDR blocks must not overlap with other subnets in the VPC.
class InitialVlans {
  /// The edge VTEP VLAN subnet. This VLAN subnet manages traffic flowing between
  /// the internal network and external networks, including internet access and
  /// other site connections.
  final InitialVlanInfo edgeVTep;

  /// An additional VLAN subnet that can be used to extend VCF capabilities once
  /// configured. For example, you can configure an expansion VLAN subnet to use
  /// NSX Federation for centralized management and synchronization of multiple
  /// NSX deployments across different locations.
  final InitialVlanInfo expansionVlan1;

  /// An additional VLAN subnet that can be used to extend VCF capabilities once
  /// configured. For example, you can configure an expansion VLAN subnet to use
  /// NSX Federation for centralized management and synchronization of multiple
  /// NSX deployments across different locations.
  final InitialVlanInfo expansionVlan2;

  /// The HCX VLAN subnet. This VLAN subnet allows the HCX Interconnnect (IX) and
  /// HCX Network Extension (NE) to reach their peers and enable HCX Service Mesh
  /// creation.
  ///
  /// If you plan to use a public HCX VLAN subnet, the following requirements must
  /// be met:
  ///
  /// <ul>
  /// <li>
  /// Must have a /28 netmask and be allocated from the IPAM public pool. Required
  /// for HCX internet access configuration.
  /// </li>
  /// <li>
  /// The HCX public VLAN CIDR block must be added to the VPC as a secondary CIDR
  /// block.
  /// </li>
  /// <li>
  /// Must have at least two Elastic IP addresses to be allocated from the public
  /// IPAM pool for HCX components.
  /// </li>
  /// </ul>
  final InitialVlanInfo hcx;

  /// The NSX uplink VLAN subnet. This VLAN subnet allows connectivity to the NSX
  /// overlay network.
  final InitialVlanInfo nsxUplink;

  /// The vMotion VLAN subnet. This VLAN subnet carries traffic for vSphere
  /// vMotion.
  final InitialVlanInfo vMotion;

  /// The vSAN VLAN subnet. This VLAN subnet carries the communication between ESX
  /// hosts to implement a vSAN shared storage pool.
  final InitialVlanInfo vSan;

  /// The VTEP VLAN subnet. This VLAN subnet handles internal network traffic
  /// between virtual machines within a VCF instance.
  final InitialVlanInfo vTep;

  /// The VM management VLAN subnet. This VLAN subnet carries traffic for vSphere
  /// virtual machines.
  final InitialVlanInfo vmManagement;

  /// The host VMkernel management VLAN subnet. This VLAN subnet carries traffic
  /// for managing ESX hosts and communicating with VMware vCenter Server.
  final InitialVlanInfo vmkManagement;

  /// A unique ID for a network access control list that the HCX VLAN uses.
  /// Required when <code>isHcxPublic</code> is set to <code>true</code>.
  final String? hcxNetworkAclId;

  /// Determines if the HCX VLAN that Amazon EVS provisions is public or private.
  final bool? isHcxPublic;

  InitialVlans({
    required this.edgeVTep,
    required this.expansionVlan1,
    required this.expansionVlan2,
    required this.hcx,
    required this.nsxUplink,
    required this.vMotion,
    required this.vSan,
    required this.vTep,
    required this.vmManagement,
    required this.vmkManagement,
    this.hcxNetworkAclId,
    this.isHcxPublic,
  });

  Map<String, dynamic> toJson() {
    final edgeVTep = this.edgeVTep;
    final expansionVlan1 = this.expansionVlan1;
    final expansionVlan2 = this.expansionVlan2;
    final hcx = this.hcx;
    final nsxUplink = this.nsxUplink;
    final vMotion = this.vMotion;
    final vSan = this.vSan;
    final vTep = this.vTep;
    final vmManagement = this.vmManagement;
    final vmkManagement = this.vmkManagement;
    final hcxNetworkAclId = this.hcxNetworkAclId;
    final isHcxPublic = this.isHcxPublic;
    return {
      'edgeVTep': edgeVTep,
      'expansionVlan1': expansionVlan1,
      'expansionVlan2': expansionVlan2,
      'hcx': hcx,
      'nsxUplink': nsxUplink,
      'vMotion': vMotion,
      'vSan': vSan,
      'vTep': vTep,
      'vmManagement': vmManagement,
      'vmkManagement': vmkManagement,
      if (hcxNetworkAclId != null) 'hcxNetworkAclId': hcxNetworkAclId,
      if (isHcxPublic != null) 'isHcxPublic': isHcxPublic,
    };
  }
}

/// An object that represents an initial VLAN subnet for the Amazon EVS
/// environment. Amazon EVS creates initial VLAN subnets when you first create
/// the environment. Amazon EVS creates the following 10 VLAN subnets: host
/// management VLAN, vMotion VLAN, vSAN VLAN, VTEP VLAN, Edge VTEP VLAN,
/// Management VM VLAN, HCX uplink VLAN, NSX uplink VLAN, expansion VLAN 1,
/// expansion VLAN 2.
/// <note>
/// For each Amazon EVS VLAN subnet, you must specify a non-overlapping CIDR
/// block. Amazon EVS VLAN subnets have a minimum CIDR block size of /28 and a
/// maximum size of /24.
/// </note>
class InitialVlanInfo {
  /// The CIDR block that you provide to create an Amazon EVS VLAN subnet. Amazon
  /// EVS VLAN subnets have a minimum CIDR block size of /28 and a maximum size of
  /// /24. Amazon EVS VLAN subnet CIDR blocks must not overlap with other subnets
  /// in the VPC.
  final String cidr;

  InitialVlanInfo({
    required this.cidr,
  });

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      'cidr': cidr,
    };
  }
}

/// Information about ESX versions offered for each EC2 instance type.
class InstanceTypeEsxVersionsInfo {
  /// The list of ESX versions offered for this instance type.
  final List<String> esxVersions;

  /// The EC2 instance type.
  final InstanceType instanceType;

  InstanceTypeEsxVersionsInfo({
    required this.esxVersions,
    required this.instanceType,
  });

  factory InstanceTypeEsxVersionsInfo.fromJson(Map<String, dynamic> json) {
    return InstanceTypeEsxVersionsInfo(
      esxVersions: ((json['esxVersions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      instanceType:
          InstanceType.fromString((json['instanceType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final esxVersions = this.esxVersions;
    final instanceType = this.instanceType;
    return {
      'esxVersions': esxVersions,
      'instanceType': instanceType.value,
    };
  }
}

/// Information about a VCF versions provided by Amazon EVS, including its
/// status, default ESX version, and EC2 instance types.
class VcfVersionInfo {
  /// The default ESX version for this VCF version. It is based on Broadcom's Bill
  /// Of Materials (BOM).
  final String defaultEsxVersion;

  /// EC2 instance types provided by Amazon EVS for this VCF version for creating
  /// environments.
  final List<InstanceType> instanceTypes;

  /// The status for this VCF version. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - This VCF version is available to you.
  /// </li>
  /// <li>
  /// <code>RESTRICTED</code> - This VCF version has limited availability.
  /// </li>
  /// </ul> <note>
  /// If the version you need shows RESTRICTED, and you require, check out <a
  /// href="https://docs.aws.amazon.com/evs/latest/userguide/versions-provided.html">VCF
  /// versions and EC2 instance types provided by Amazon EVS</a> for more
  /// information.
  /// </note>
  final String status;

  /// The VCF version number.
  final VcfVersion vcfVersion;

  VcfVersionInfo({
    required this.defaultEsxVersion,
    required this.instanceTypes,
    required this.status,
    required this.vcfVersion,
  });

  factory VcfVersionInfo.fromJson(Map<String, dynamic> json) {
    return VcfVersionInfo(
      defaultEsxVersion: (json['defaultEsxVersion'] as String?) ?? '',
      instanceTypes: ((json['instanceTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => InstanceType.fromString((e as String)))
          .toList(),
      status: (json['status'] as String?) ?? '',
      vcfVersion: VcfVersion.fromString((json['vcfVersion'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultEsxVersion = this.defaultEsxVersion;
    final instanceTypes = this.instanceTypes;
    final status = this.status;
    final vcfVersion = this.vcfVersion;
    return {
      'defaultEsxVersion': defaultEsxVersion,
      'instanceTypes': instanceTypes.map((e) => e.value).toList(),
      'status': status,
      'vcfVersion': vcfVersion.value,
    };
  }
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

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TagPolicyException': (type, message) =>
      TagPolicyException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
