// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2009_03_31.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon EMR is a web service that makes it easier to process large amounts of
/// data efficiently. Amazon EMR uses Hadoop processing combined with several
/// Amazon Web Services services to do tasks such as web indexing, data mining,
/// log file analysis, machine learning, scientific simulation, and data
/// warehouse management.
class Emr {
  final _s.JsonProtocol _protocol;
  factory Emr({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'elasticmapreduce',
    );
    return Emr._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Emr._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Adds an instance fleet to a running cluster.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The unique identifier of the cluster.
  ///
  /// Parameter [instanceFleet] :
  /// Specifies the configuration of the instance fleet.
  Future<AddInstanceFleetOutput> addInstanceFleet({
    required String clusterId,
    required InstanceFleetConfig instanceFleet,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.AddInstanceFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'InstanceFleet': instanceFleet,
      },
    );

    return AddInstanceFleetOutput.fromJson(jsonResponse.body);
  }

  /// Adds one or more instance groups to a running cluster.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [instanceGroups] :
  /// Instance groups to add.
  ///
  /// Parameter [jobFlowId] :
  /// Job flow in which to add the instance groups.
  Future<AddInstanceGroupsOutput> addInstanceGroups({
    required List<InstanceGroupConfig> instanceGroups,
    required String jobFlowId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.AddInstanceGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceGroups': instanceGroups,
        'JobFlowId': jobFlowId,
      },
    );

    return AddInstanceGroupsOutput.fromJson(jsonResponse.body);
  }

  /// AddJobFlowSteps adds new steps to a running cluster. A maximum of 256
  /// steps are allowed in each job flow.
  ///
  /// If your cluster is long-running (such as a Hive data warehouse) or
  /// complex, you may require more than 256 steps to process your data. You can
  /// bypass the 256-step limitation in various ways, including using SSH to
  /// connect to the master node and submitting queries directly to the software
  /// running on the master node, such as Hive and Hadoop.
  ///
  /// A step specifies the location of a JAR file stored either on the master
  /// node of the cluster or in Amazon S3. Each step is performed by the main
  /// function of the main class of the JAR file. The main class can be
  /// specified either in the manifest of the JAR or by using the MainFunction
  /// parameter of the step.
  ///
  /// Amazon EMR executes each step in the order listed. For a step to be
  /// considered complete, the main function must exit with a zero exit code and
  /// all Hadoop jobs started while the step was running must have completed and
  /// run successfully.
  ///
  /// You can only add steps to a cluster that is in one of the following
  /// states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.
  /// <note>
  /// The string values passed into <code>HadoopJarStep</code> object cannot
  /// exceed a total of 10240 characters.
  /// </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowId] :
  /// A string that uniquely identifies the job flow. This identifier is
  /// returned by <a>RunJobFlow</a> and can also be obtained from
  /// <a>ListClusters</a>.
  ///
  /// Parameter [steps] :
  /// A list of <a>StepConfig</a> to be executed by the job flow.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the runtime role for a step on the
  /// cluster. The runtime role can be a cross-account IAM role. The runtime
  /// role ARN is a combination of account ID, role name, and role type using
  /// the following format:
  /// <code>arn:partition:service:region:account:resource</code>.
  ///
  /// For example, <code>arn:aws:IAM::1234567890:role/ReadOnly</code> is a
  /// correctly formatted runtime role ARN.
  Future<AddJobFlowStepsOutput> addJobFlowSteps({
    required String jobFlowId,
    required List<StepConfig> steps,
    String? executionRoleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.AddJobFlowSteps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowId': jobFlowId,
        'Steps': steps,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      },
    );

    return AddJobFlowStepsOutput.fromJson(jsonResponse.body);
  }

  /// Adds tags to an Amazon EMR resource, such as a cluster or an Amazon EMR
  /// Studio. Tags make it easier to associate resources in various ways, such
  /// as grouping clusters to track your Amazon EMR resource allocation costs.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// Clusters</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceId] :
  /// The Amazon EMR resource identifier to which tags will be added. For
  /// example, a cluster identifier or an Amazon EMR Studio ID.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with a resource. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of
  /// 128 characters, and an optional value string with a maximum of 256
  /// characters.
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster that scopes the tag operation. Required when the
  /// resource being tagged is a session-scoped resource.
  Future<void> addTags({
    required String resourceId,
    required List<Tag> tags,
    String? clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.AddTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'Tags': tags,
        if (clusterId != null) 'ClusterId': clusterId,
      },
    );
  }

  /// Cancels a pending step or steps in a running cluster. Available only in
  /// Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of
  /// 256 steps are allowed in each CancelSteps request. CancelSteps is
  /// idempotent but asynchronous; it does not guarantee that a step will be
  /// canceled, even if the request is successfully submitted. When you use
  /// Amazon EMR releases 5.28.0 and later, you can cancel steps that are in a
  /// <code>PENDING</code> or <code>RUNNING</code> state. In earlier versions of
  /// Amazon EMR, you can only cancel steps that are in a <code>PENDING</code>
  /// state.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The <code>ClusterID</code> for the specified steps that will be canceled.
  /// Use <a>RunJobFlow</a> and <a>ListClusters</a> to get ClusterIDs.
  ///
  /// Parameter [stepIds] :
  /// The list of <code>StepIDs</code> to cancel. Use <a>ListSteps</a> to get
  /// steps and their states for the specified cluster.
  ///
  /// Parameter [stepCancellationOption] :
  /// The option to choose to cancel <code>RUNNING</code> steps. By default, the
  /// value is <code>SEND_INTERRUPT</code>.
  Future<CancelStepsOutput> cancelSteps({
    required String clusterId,
    required List<String> stepIds,
    StepCancellationOption? stepCancellationOption,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CancelSteps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'StepIds': stepIds,
        if (stepCancellationOption != null)
          'StepCancellationOption': stepCancellationOption.value,
      },
    );

    return CancelStepsOutput.fromJson(jsonResponse.body);
  }

  /// Creates a persistent application user interface.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [targetResourceArn] :
  /// The unique Amazon Resource Name (ARN) of the target resource.
  ///
  /// Parameter [eMRContainersConfig] :
  /// The EMR containers configuration.
  ///
  /// Parameter [profilerType] :
  /// The profiler type for the persistent application user interface.
  ///
  /// Parameter [tags] :
  /// Tags for the persistent application user interface.
  ///
  /// Parameter [xReferer] :
  /// The cross reference for the persistent application user interface.
  Future<CreatePersistentAppUIOutput> createPersistentAppUI({
    required String targetResourceArn,
    EMRContainersConfig? eMRContainersConfig,
    ProfilerType? profilerType,
    List<Tag>? tags,
    String? xReferer,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CreatePersistentAppUI'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetResourceArn': targetResourceArn,
        if (eMRContainersConfig != null)
          'EMRContainersConfig': eMRContainersConfig,
        if (profilerType != null) 'ProfilerType': profilerType.value,
        if (tags != null) 'Tags': tags,
        if (xReferer != null) 'XReferer': xReferer,
      },
    );

    return CreatePersistentAppUIOutput.fromJson(jsonResponse.body);
  }

  /// Creates a security configuration, which is stored in the service and can
  /// be specified when a cluster is created.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  ///
  /// Parameter [securityConfiguration] :
  /// The security configuration details in JSON format. For JSON parameters and
  /// examples, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security-configurations.html">Use
  /// Security Configurations to Set Up Cluster Security</a> in the <i>Amazon
  /// EMR Management Guide</i>.
  Future<CreateSecurityConfigurationOutput> createSecurityConfiguration({
    required String name,
    required String securityConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CreateSecurityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'SecurityConfiguration': securityConfiguration,
      },
    );

    return CreateSecurityConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon EMR Studio.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [authMode] :
  /// Specifies whether the Studio authenticates users using IAM or IAM Identity
  /// Center.
  ///
  /// Parameter [defaultS3Location] :
  /// The Amazon S3 location to back up Amazon EMR Studio Workspaces and
  /// notebook files.
  ///
  /// Parameter [engineSecurityGroupId] :
  /// The ID of the Amazon EMR Studio Engine security group. The Engine security
  /// group allows inbound network traffic from the Workspace security group,
  /// and it must be in the same VPC specified by <code>VpcId</code>.
  ///
  /// Parameter [name] :
  /// A descriptive name for the Amazon EMR Studio.
  ///
  /// Parameter [serviceRole] :
  /// The IAM role that the Amazon EMR Studio assumes. The service role provides
  /// a way for Amazon EMR Studio to interoperate with other Amazon Web Services
  /// services.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs to associate with the Amazon EMR Studio. A Studio can
  /// have a maximum of 5 subnets. The subnets must belong to the VPC specified
  /// by <code>VpcId</code>. Studio users can create a Workspace in any of the
  /// specified subnets.
  ///
  /// Parameter [vpcId] :
  /// The ID of the Amazon Virtual Private Cloud (Amazon VPC) to associate with
  /// the Studio.
  ///
  /// Parameter [workspaceSecurityGroupId] :
  /// The ID of the Amazon EMR Studio Workspace security group. The Workspace
  /// security group allows outbound network traffic to resources in the Engine
  /// security group, and it must be in the same VPC specified by
  /// <code>VpcId</code>.
  ///
  /// Parameter [description] :
  /// A detailed description of the Amazon EMR Studio.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace
  /// and notebook files when backed up to Amazon S3.
  ///
  /// Parameter [idcInstanceArn] :
  /// The ARN of the IAM Identity Center instance to create the Studio
  /// application.
  ///
  /// Parameter [idcUserAssignment] :
  /// Specifies whether IAM Identity Center user assignment is
  /// <code>REQUIRED</code> or <code>OPTIONAL</code>. If the value is set to
  /// <code>REQUIRED</code>, users must be explicitly assigned to the Studio
  /// application to access the Studio.
  ///
  /// Parameter [idpAuthUrl] :
  /// The authentication endpoint of your identity provider (IdP). Specify this
  /// value when you use IAM authentication and want to let federated users log
  /// in to a Studio with the Studio URL and credentials from your IdP. Amazon
  /// EMR Studio redirects users to this endpoint to enter credentials.
  ///
  /// Parameter [idpRelayStateParameterName] :
  /// The name that your identity provider (IdP) uses for its
  /// <code>RelayState</code> parameter. For example, <code>RelayState</code> or
  /// <code>TargetSource</code>. Specify this value when you use IAM
  /// authentication and want to let federated users log in to a Studio using
  /// the Studio URL. The <code>RelayState</code> parameter differs by IdP.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the Amazon EMR Studio. Tags are
  /// user-defined key-value pairs that consist of a required key string with a
  /// maximum of 128 characters, and an optional value string with a maximum of
  /// 256 characters.
  ///
  /// Parameter [trustedIdentityPropagationEnabled] :
  /// A Boolean indicating whether to enable Trusted identity propagation for
  /// the Studio. The default value is <code>false</code>.
  ///
  /// Parameter [userRole] :
  /// The IAM user role that users and groups assume when logged in to an Amazon
  /// EMR Studio. Only specify a <code>UserRole</code> when you use IAM Identity
  /// Center authentication. The permissions attached to the
  /// <code>UserRole</code> can be scoped down for each user or group using
  /// session policies.
  Future<CreateStudioOutput> createStudio({
    required AuthMode authMode,
    required String defaultS3Location,
    required String engineSecurityGroupId,
    required String name,
    required String serviceRole,
    required List<String> subnetIds,
    required String vpcId,
    required String workspaceSecurityGroupId,
    String? description,
    String? encryptionKeyArn,
    String? idcInstanceArn,
    IdcUserAssignment? idcUserAssignment,
    String? idpAuthUrl,
    String? idpRelayStateParameterName,
    List<Tag>? tags,
    bool? trustedIdentityPropagationEnabled,
    String? userRole,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CreateStudio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthMode': authMode.value,
        'DefaultS3Location': defaultS3Location,
        'EngineSecurityGroupId': engineSecurityGroupId,
        'Name': name,
        'ServiceRole': serviceRole,
        'SubnetIds': subnetIds,
        'VpcId': vpcId,
        'WorkspaceSecurityGroupId': workspaceSecurityGroupId,
        if (description != null) 'Description': description,
        if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
        if (idcInstanceArn != null) 'IdcInstanceArn': idcInstanceArn,
        if (idcUserAssignment != null)
          'IdcUserAssignment': idcUserAssignment.value,
        if (idpAuthUrl != null) 'IdpAuthUrl': idpAuthUrl,
        if (idpRelayStateParameterName != null)
          'IdpRelayStateParameterName': idpRelayStateParameterName,
        if (tags != null) 'Tags': tags,
        if (trustedIdentityPropagationEnabled != null)
          'TrustedIdentityPropagationEnabled':
              trustedIdentityPropagationEnabled,
        if (userRole != null) 'UserRole': userRole,
      },
    );

    return CreateStudioOutput.fromJson(jsonResponse.body);
  }

  /// Maps a user or group to the Amazon EMR Studio specified by
  /// <code>StudioId</code>, and applies a session policy to refine Studio
  /// permissions for that user or group. Use
  /// <code>CreateStudioSessionMapping</code> to assign users to a Studio when
  /// you use IAM Identity Center authentication. For instructions on how to
  /// assign users to a Studio when you use IAM authentication, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-manage-users.html#emr-studio-assign-users-groups">Assign
  /// a user or group to your EMR Studio</a>.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to map to the Amazon EMR Studio is a user
  /// or a group.
  ///
  /// Parameter [sessionPolicyArn] :
  /// The Amazon Resource Name (ARN) for the session policy that will be applied
  /// to the user or group. You should specify the ARN for the session policy
  /// that you want to apply, not the ARN of your user role. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-user-role.html">Create
  /// an Amazon EMR Studio User Role with Session Policies</a>.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio to which the user or group will be mapped.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group from the IAM
  /// Identity Center Identity Store. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified,
  /// but not both.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified,
  /// but not both.
  Future<void> createStudioSessionMapping({
    required IdentityType identityType,
    required String sessionPolicyArn,
    required String studioId,
    String? identityId,
    String? identityName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CreateStudioSessionMapping'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType.value,
        'SessionPolicyArn': sessionPolicyArn,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );
  }

  /// Deletes a security configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  Future<void> deleteSecurityConfiguration({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteSecurityConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );
  }

  /// Removes an Amazon EMR Studio from the Studio metadata store.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  Future<void> deleteStudio({
    required String studioId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteStudio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StudioId': studioId,
      },
    );
  }

  /// Removes a user or group from an Amazon EMR Studio.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to delete from the Amazon EMR Studio is a
  /// user or a group.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group to remove from
  /// the Amazon EMR Studio. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user name or group to remove from the Amazon EMR Studio.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<void> deleteStudioSessionMapping({
    required IdentityType identityType,
    required String studioId,
    String? identityId,
    String? identityName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteStudioSessionMapping'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType.value,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );
  }

  /// Provides cluster-level details including status, hardware and software
  /// configuration, VPC settings, and so on.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster to describe.
  Future<DescribeClusterOutput> describeCluster({
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return DescribeClusterOutput.fromJson(jsonResponse.body);
  }

  /// This API is no longer supported and will eventually be removed. We
  /// recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>,
  /// <a>ListSteps</a>, <a>ListInstanceGroups</a> and
  /// <a>ListBootstrapActions</a> instead.
  ///
  /// DescribeJobFlows returns a list of job flows that match all of the
  /// supplied parameters. The parameters can include a list of job flow IDs,
  /// job flow states, and restrictions on job flow creation date and time.
  ///
  /// Regardless of supplied parameters, only job flows created within the last
  /// two months are returned.
  ///
  /// If no parameters are supplied, then job flows matching either of the
  /// following criteria are returned:
  ///
  /// <ul>
  /// <li>
  /// Job flows created and completed in the last two weeks
  /// </li>
  /// <li>
  /// Job flows created within the last two months that are in one of the
  /// following states: <code>RUNNING</code>, <code>WAITING</code>,
  /// <code>SHUTTING_DOWN</code>, <code>STARTING</code>
  /// </li>
  /// </ul>
  /// Amazon EMR can return a maximum of 512 job flow descriptions.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [createdAfter] :
  /// Return only job flows created after this date and time.
  ///
  /// Parameter [createdBefore] :
  /// Return only job flows created before this date and time.
  ///
  /// Parameter [jobFlowIds] :
  /// Return only job flows whose job flow ID is contained in this list.
  ///
  /// Parameter [jobFlowStates] :
  /// Return only job flows whose state is contained in this list.
  Future<DescribeJobFlowsOutput> describeJobFlows({
    DateTime? createdAfter,
    DateTime? createdBefore,
    List<String>? jobFlowIds,
    List<JobFlowExecutionState>? jobFlowStates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeJobFlows'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (createdAfter != null)
          'CreatedAfter': unixTimestampToJson(createdAfter),
        if (createdBefore != null)
          'CreatedBefore': unixTimestampToJson(createdBefore),
        if (jobFlowIds != null) 'JobFlowIds': jobFlowIds,
        if (jobFlowStates != null)
          'JobFlowStates': jobFlowStates.map((e) => e.value).toList(),
      },
    );

    return DescribeJobFlowsOutput.fromJson(jsonResponse.body);
  }

  /// Provides details of a notebook execution.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [notebookExecutionId] :
  /// The unique identifier of the notebook execution.
  Future<DescribeNotebookExecutionOutput> describeNotebookExecution({
    required String notebookExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeNotebookExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookExecutionId': notebookExecutionId,
      },
    );

    return DescribeNotebookExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Describes a persistent application user interface.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [persistentAppUIId] :
  /// The identifier for the persistent application user interface.
  Future<DescribePersistentAppUIOutput> describePersistentAppUI({
    required String persistentAppUIId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribePersistentAppUI'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PersistentAppUIId': persistentAppUIId,
      },
    );

    return DescribePersistentAppUIOutput.fromJson(jsonResponse.body);
  }

  /// Provides Amazon EMR release label details, such as the releases available
  /// the Region where the API request is run, and the available applications
  /// for a specific Amazon EMR release label. Can also list Amazon EMR releases
  /// that support a specified version of Spark.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// Reserved for future use. Currently set to null.
  ///
  /// Parameter [nextToken] :
  /// The pagination token. Reserved for future use. Currently set to null.
  ///
  /// Parameter [releaseLabel] :
  /// The target release label to be described.
  Future<DescribeReleaseLabelOutput> describeReleaseLabel({
    int? maxResults,
    String? nextToken,
    String? releaseLabel,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeReleaseLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
      },
    );

    return DescribeReleaseLabelOutput.fromJson(jsonResponse.body);
  }

  /// Provides the details of a security configuration by returning the
  /// configuration JSON.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  Future<DescribeSecurityConfigurationOutput> describeSecurityConfiguration({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeSecurityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
      },
    );

    return DescribeSecurityConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Provides more detail about the cluster step.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster with steps to describe.
  ///
  /// Parameter [stepId] :
  /// The identifier of the step to describe.
  Future<DescribeStepOutput> describeStep({
    required String clusterId,
    required String stepId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeStep'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'StepId': stepId,
      },
    );

    return DescribeStepOutput.fromJson(jsonResponse.body);
  }

  /// Returns details for the specified Amazon EMR Studio including ID, Name,
  /// VPC, Studio access URL, and so on.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [studioId] :
  /// The Amazon EMR Studio ID.
  Future<DescribeStudioOutput> describeStudio({
    required String studioId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DescribeStudio'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StudioId': studioId,
      },
    );

    return DescribeStudioOutput.fromJson(jsonResponse.body);
  }

  /// Returns the auto-termination policy for an Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the Amazon EMR cluster for which the auto-termination
  /// policy will be fetched.
  Future<GetAutoTerminationPolicyOutput> getAutoTerminationPolicy({
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetAutoTerminationPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return GetAutoTerminationPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Returns the Amazon EMR block public access configuration for your Amazon
  /// Web Services account in the current Region. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure
  /// Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management
  /// Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  Future<GetBlockPublicAccessConfigurationOutput>
      getBlockPublicAccessConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetBlockPublicAccessConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetBlockPublicAccessConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Provides temporary, HTTP basic credentials that are associated with a
  /// given runtime IAM role and used by a cluster with fine-grained access
  /// control activated. You can use these credentials to connect to cluster
  /// endpoints that support username and password authentication.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The unique identifier of the cluster.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the runtime role for interactive
  /// workload submission on the cluster. The runtime role can be a
  /// cross-account IAM role. The runtime role ARN is a combination of account
  /// ID, role name, and role type using the following format:
  /// <code>arn:partition:service:region:account:resource</code>.
  Future<GetClusterSessionCredentialsOutput> getClusterSessionCredentials({
    required String clusterId,
    String? executionRoleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetClusterSessionCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      },
    );

    return GetClusterSessionCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Fetches the attached managed scaling policy for an Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the cluster for which the managed scaling policy will
  /// be fetched.
  Future<GetManagedScalingPolicyOutput> getManagedScalingPolicy({
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetManagedScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return GetManagedScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// The presigned URL properties for the cluster's application user interface.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The cluster ID associated with the cluster's application user interface
  /// presigned URL.
  ///
  /// Parameter [applicationId] :
  /// The application ID associated with the cluster's application user
  /// interface presigned URL.
  ///
  /// Parameter [dryRun] :
  /// Determines if the user interface presigned URL is for a dry run.
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN associated with the cluster's application user
  /// interface presigned URL.
  ///
  /// Parameter [onClusterAppUIType] :
  /// The application UI type associated with the cluster's application user
  /// interface presigned URL.
  Future<GetOnClusterAppUIPresignedURLOutput> getOnClusterAppUIPresignedURL({
    required String clusterId,
    String? applicationId,
    bool? dryRun,
    String? executionRoleArn,
    OnClusterAppUIType? onClusterAppUIType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetOnClusterAppUIPresignedURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (applicationId != null) 'ApplicationId': applicationId,
        if (dryRun != null) 'DryRun': dryRun,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
        if (onClusterAppUIType != null)
          'OnClusterAppUIType': onClusterAppUIType.value,
      },
    );

    return GetOnClusterAppUIPresignedURLOutput.fromJson(jsonResponse.body);
  }

  /// The presigned URL properties for the cluster's application user interface.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [persistentAppUIId] :
  /// The persistent application user interface ID associated with the presigned
  /// URL.
  ///
  /// Parameter [applicationId] :
  /// The application ID associated with the presigned URL.
  ///
  /// Parameter [authProxyCall] :
  /// A boolean that represents if the caller is an authentication proxy call.
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN associated with the presigned URL.
  ///
  /// Parameter [persistentAppUIType] :
  /// The persistent application user interface type associated with the
  /// presigned URL.
  Future<GetPersistentAppUIPresignedURLOutput> getPersistentAppUIPresignedURL({
    required String persistentAppUIId,
    String? applicationId,
    bool? authProxyCall,
    String? executionRoleArn,
    PersistentAppUIType? persistentAppUIType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetPersistentAppUIPresignedURL'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PersistentAppUIId': persistentAppUIId,
        if (applicationId != null) 'ApplicationId': applicationId,
        if (authProxyCall != null) 'AuthProxyCall': authProxyCall,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
        if (persistentAppUIType != null)
          'PersistentAppUIType': persistentAppUIType.value,
      },
    );

    return GetPersistentAppUIPresignedURLOutput.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about a session.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster that the session belongs to.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session.
  Future<GetSessionOutput> getSession({
    required String clusterId,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'SessionId': sessionId,
      },
    );

    return GetSessionOutput.fromJson(jsonResponse.body);
  }

  /// Returns the Spark Connect endpoint URL and a time-limited authentication
  /// token for the specified session. Use the endpoint and token to connect a
  /// PySpark client to the session. Call this operation again when the token
  /// expires to obtain a new one.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster that the session belongs to.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session.
  Future<GetSessionEndpointOutput> getSessionEndpoint({
    required String clusterId,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetSessionEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'SessionId': sessionId,
      },
    );

    return GetSessionEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Fetches mapping details for the specified Amazon EMR Studio and identity
  /// (user or group).
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to fetch is a user or a group.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group to fetch. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<GetStudioSessionMappingOutput> getStudioSessionMapping({
    required IdentityType identityType,
    required String studioId,
    String? identityId,
    String? identityName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.GetStudioSessionMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType.value,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );

    return GetStudioSessionMappingOutput.fromJson(jsonResponse.body);
  }

  /// Provides information about the bootstrap actions associated with a
  /// cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The cluster identifier for the bootstrap actions to list.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListBootstrapActionsOutput> listBootstrapActions({
    required String clusterId,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListBootstrapActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListBootstrapActionsOutput.fromJson(jsonResponse.body);
  }

  /// Provides the status of all clusters visible to this Amazon Web Services
  /// account. Allows you to filter the list of clusters based on certain
  /// criteria; for example, filtering by cluster creation date and time or by
  /// status. This call returns a maximum of 50 clusters in unsorted order per
  /// call, but returns a marker to track the paging of the cluster list across
  /// multiple ListClusters calls.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterStates] :
  /// The cluster state filters to apply when listing clusters. Clusters that
  /// change state while this action runs may be not be returned as expected in
  /// the list of clusters.
  ///
  /// Parameter [createdAfter] :
  /// The creation date and time beginning value filter for listing clusters.
  ///
  /// Parameter [createdBefore] :
  /// The creation date and time end value filter for listing clusters.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListClustersOutput> listClusters({
    List<ClusterState>? clusterStates,
    DateTime? createdAfter,
    DateTime? createdBefore,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterStates != null)
          'ClusterStates': clusterStates.map((e) => e.value).toList(),
        if (createdAfter != null)
          'CreatedAfter': unixTimestampToJson(createdAfter),
        if (createdBefore != null)
          'CreatedBefore': unixTimestampToJson(createdBefore),
        if (marker != null) 'Marker': marker,
      },
    );

    return ListClustersOutput.fromJson(jsonResponse.body);
  }

  /// Lists all available details about the instance fleets in a cluster.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The unique identifier of the cluster.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListInstanceFleetsOutput> listInstanceFleets({
    required String clusterId,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListInstanceFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListInstanceFleetsOutput.fromJson(jsonResponse.body);
  }

  /// Provides all available details about the instance groups in a cluster.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster for which to list the instance groups.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListInstanceGroupsOutput> listInstanceGroups({
    required String clusterId,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListInstanceGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListInstanceGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Provides information for all active Amazon EC2 instances and Amazon EC2
  /// instances terminated in the last 30 days, up to a maximum of 2,000. Amazon
  /// EC2 instances in any of the following states are considered active:
  /// AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster for which to list the instances.
  ///
  /// Parameter [instanceFleetId] :
  /// The unique identifier of the instance fleet.
  ///
  /// Parameter [instanceFleetType] :
  /// The node type of the instance fleet. For example MASTER, CORE, or TASK.
  ///
  /// Parameter [instanceGroupId] :
  /// The identifier of the instance group for which to list the instances.
  ///
  /// Parameter [instanceGroupTypes] :
  /// The type of instance group for which to list the instances.
  ///
  /// Parameter [instanceStates] :
  /// A list of instance states that will filter the instances returned with
  /// this request.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListInstancesOutput> listInstances({
    required String clusterId,
    String? instanceFleetId,
    InstanceFleetType? instanceFleetType,
    String? instanceGroupId,
    List<InstanceGroupType>? instanceGroupTypes,
    List<InstanceState>? instanceStates,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (instanceFleetId != null) 'InstanceFleetId': instanceFleetId,
        if (instanceFleetType != null)
          'InstanceFleetType': instanceFleetType.value,
        if (instanceGroupId != null) 'InstanceGroupId': instanceGroupId,
        if (instanceGroupTypes != null)
          'InstanceGroupTypes': instanceGroupTypes.map((e) => e.value).toList(),
        if (instanceStates != null)
          'InstanceStates': instanceStates.map((e) => e.value).toList(),
        if (marker != null) 'Marker': marker,
      },
    );

    return ListInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Provides summaries of all notebook executions. You can filter the list
  /// based on multiple criteria such as status, time range, and editor id.
  /// Returns a maximum of 50 notebook executions and a marker to track the
  /// paging of a longer notebook execution list across multiple
  /// <code>ListNotebookExecutions</code> calls.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [editorId] :
  /// The unique ID of the editor associated with the notebook execution.
  ///
  /// Parameter [executionEngineId] :
  /// The unique ID of the execution engine.
  ///
  /// Parameter [from] :
  /// The beginning of time range filter for listing notebook executions. The
  /// default is the timestamp of 30 days ago.
  ///
  /// Parameter [marker] :
  /// The pagination token, returned by a previous
  /// <code>ListNotebookExecutions</code> call, that indicates the start of the
  /// list for this <code>ListNotebookExecutions</code> call.
  ///
  /// Parameter [status] :
  /// The status filter for listing notebook executions.
  ///
  /// <ul>
  /// <li>
  /// <code>START_PENDING</code> indicates that the cluster has received the
  /// execution request but execution has not begun.
  /// </li>
  /// <li>
  /// <code>STARTING</code> indicates that the execution is starting on the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> indicates that the execution is being processed by
  /// the cluster.
  /// </li>
  /// <li>
  /// <code>FINISHING</code> indicates that execution processing is in the final
  /// stages.
  /// </li>
  /// <li>
  /// <code>FINISHED</code> indicates that the execution has completed without
  /// error.
  /// </li>
  /// <li>
  /// <code>FAILING</code> indicates that the execution is failing and will not
  /// finish successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> indicates that the execution failed.
  /// </li>
  /// <li>
  /// <code>STOP_PENDING</code> indicates that the cluster has received a
  /// <code>StopNotebookExecution</code> request and the stop is pending.
  /// </li>
  /// <li>
  /// <code>STOPPING</code> indicates that the cluster is in the process of
  /// stopping the execution as a result of a <code>StopNotebookExecution</code>
  /// request.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> indicates that the execution stopped because of a
  /// <code>StopNotebookExecution</code> request.
  /// </li>
  /// </ul>
  ///
  /// Parameter [to] :
  /// The end of time range filter for listing notebook executions. The default
  /// is the current timestamp.
  Future<ListNotebookExecutionsOutput> listNotebookExecutions({
    String? editorId,
    String? executionEngineId,
    DateTime? from,
    String? marker,
    NotebookExecutionStatus? status,
    DateTime? to,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListNotebookExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (editorId != null) 'EditorId': editorId,
        if (executionEngineId != null) 'ExecutionEngineId': executionEngineId,
        if (from != null) 'From': unixTimestampToJson(from),
        if (marker != null) 'Marker': marker,
        if (status != null) 'Status': status.value,
        if (to != null) 'To': unixTimestampToJson(to),
      },
    );

    return ListNotebookExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves release labels of Amazon EMR services in the Region where the
  /// API is called.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [filters] :
  /// Filters the results of the request. <code>Prefix</code> specifies the
  /// prefix of release labels to return. <code>Application</code> specifies the
  /// application (with/without version) of release labels to return.
  ///
  /// Parameter [maxResults] :
  /// Defines the maximum number of release labels to return in a single
  /// response. The default is <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// Specifies the next page of results. If <code>NextToken</code> is not
  /// specified, which is usually the case for the first request of
  /// ListReleaseLabels, the first page of results are determined by other
  /// filtering parameters or by the latest version. The
  /// <code>ListReleaseLabels</code> request fails if the identity (Amazon Web
  /// Services account ID) and all filtering parameters are different from the
  /// original request, or if the <code>NextToken</code> is expired or tampered
  /// with.
  Future<ListReleaseLabelsOutput> listReleaseLabels({
    ReleaseLabelFilter? filters,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListReleaseLabels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListReleaseLabelsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all the security configurations visible to this account, providing
  /// their creation dates and times, and their names. This call returns a
  /// maximum of 50 clusters per call, but returns a marker to track the paging
  /// of the cluster list across multiple ListSecurityConfigurations calls.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the set of results to retrieve.
  Future<ListSecurityConfigurationsOutput> listSecurityConfigurations({
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListSecurityConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'Marker': marker,
      },
    );

    return ListSecurityConfigurationsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the sessions on a cluster. You can filter the results by session
  /// state. Newer sessions are returned first.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster to list sessions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of sessions to return in each page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token returned by a previous <code>ListSessions</code>
  /// call. Use it to retrieve the next page of results.
  ///
  /// Parameter [sessionStates] :
  /// An optional filter that limits the results to sessions in the specified
  /// states.
  Future<ListSessionsOutput> listSessions({
    required String clusterId,
    int? maxResults,
    String? nextToken,
    List<SessionState>? sessionStates,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListSessions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sessionStates != null)
          'SessionStates': sessionStates.map((e) => e.value).toList(),
      },
    );

    return ListSessionsOutput.fromJson(jsonResponse.body);
  }

  /// Provides a list of steps for the cluster in reverse order unless you
  /// specify <code>stepIds</code> with the request or filter by
  /// <code>StepStates</code>. You can specify a maximum of 10
  /// <code>stepIDs</code>. The CLI automatically paginates results to return a
  /// list greater than 50 steps. To return more than 50 steps using the CLI,
  /// specify a <code>Marker</code>, which is a pagination token that indicates
  /// the next set of steps to retrieve.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster for which to list the steps.
  ///
  /// Parameter [marker] :
  /// The maximum number of steps that a single <code>ListSteps</code> action
  /// returns is 50. To return a longer list of steps, use multiple
  /// <code>ListSteps</code> actions along with the <code>Marker</code>
  /// parameter, which is a pagination token that indicates the next set of
  /// results to retrieve.
  ///
  /// Parameter [stepIds] :
  /// The filter to limit the step list based on the identifier of the steps.
  /// You can specify a maximum of ten Step IDs. The character constraint
  /// applies to the overall length of the array.
  ///
  /// Parameter [stepStates] :
  /// The filter to limit the step list based on certain states.
  Future<ListStepsOutput> listSteps({
    required String clusterId,
    String? marker,
    List<String>? stepIds,
    List<StepState>? stepStates,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListSteps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (marker != null) 'Marker': marker,
        if (stepIds != null) 'StepIds': stepIds,
        if (stepStates != null)
          'StepStates': stepStates.map((e) => e.value).toList(),
      },
    );

    return ListStepsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of all Amazon EMR Studios associated with the Amazon Web
  /// Services account. The list includes details such as ID, Studio Access URL,
  /// and creation time for each Studio.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the set of results to retrieve.
  Future<ListStudiosOutput> listStudios({
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListStudios'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'Marker': marker,
      },
    );

    return ListStudiosOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of all user or group session mappings for the Amazon EMR
  /// Studio specified by <code>StudioId</code>.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether to return session mappings for users or groups. If not
  /// specified, the results include session mapping details for both users and
  /// groups.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the set of results to retrieve.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  Future<ListStudioSessionMappingsOutput> listStudioSessionMappings({
    IdentityType? identityType,
    String? marker,
    String? studioId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListStudioSessionMappings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (identityType != null) 'IdentityType': identityType.value,
        if (marker != null) 'Marker': marker,
        if (studioId != null) 'StudioId': studioId,
      },
    );

    return ListStudioSessionMappingsOutput.fromJson(jsonResponse.body);
  }

  /// A list of the instance types that Amazon EMR supports. You can filter the
  /// list by Amazon Web Services Region and Amazon EMR release.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release label determines the <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-app-versions-6.x.html">versions
  /// of open-source application packages</a> that Amazon EMR has installed on
  /// the cluster. Release labels are in the format <code>emr-x.x.x</code>,
  /// where x.x.x is an Amazon EMR release number such as
  /// <code>emr-6.10.0</code>. For more information about Amazon EMR releases
  /// and their included application versions and features, see the <i> <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-components.html">Amazon
  /// EMR Release Guide</a> </i>.
  ///
  /// Parameter [marker] :
  /// The pagination token that marks the next set of results to retrieve.
  Future<ListSupportedInstanceTypesOutput> listSupportedInstanceTypes({
    required String releaseLabel,
    String? marker,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ListSupportedInstanceTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReleaseLabel': releaseLabel,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListSupportedInstanceTypesOutput.fromJson(jsonResponse.body);
  }

  /// Modifies the number of steps that can be executed concurrently for the
  /// cluster specified using ClusterID.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The unique identifier of the cluster.
  ///
  /// Parameter [extendedSupport] :
  /// Reserved.
  ///
  /// Parameter [stepConcurrencyLevel] :
  /// The number of steps that can be executed concurrently. You can specify a
  /// minimum of 1 step and a maximum of 256 steps. We recommend that you do not
  /// change this parameter while steps are running or the
  /// <code>ActionOnFailure</code> setting may not behave as expected. For more
  /// information see <a>Step$ActionOnFailure</a>.
  Future<ModifyClusterOutput> modifyCluster({
    required String clusterId,
    bool? extendedSupport,
    int? stepConcurrencyLevel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ModifyCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (extendedSupport != null) 'ExtendedSupport': extendedSupport,
        if (stepConcurrencyLevel != null)
          'StepConcurrencyLevel': stepConcurrencyLevel,
      },
    );

    return ModifyClusterOutput.fromJson(jsonResponse.body);
  }

  /// Modifies the target On-Demand and target Spot capacities for the instance
  /// fleet with the specified InstanceFleetID within the cluster specified
  /// using ClusterID. The call either succeeds or fails atomically.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The unique identifier of the cluster.
  ///
  /// Parameter [instanceFleet] :
  /// The configuration parameters of the instance fleet.
  Future<void> modifyInstanceFleet({
    required String clusterId,
    required InstanceFleetModifyConfig instanceFleet,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ModifyInstanceFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'InstanceFleet': instanceFleet,
      },
    );
  }

  /// ModifyInstanceGroups modifies the number of nodes and configuration
  /// settings of an instance group. The input parameters include the new target
  /// instance count for the group and the instance group ID. The call will
  /// either succeed or fail atomically.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster to which the instance group belongs.
  ///
  /// Parameter [instanceGroups] :
  /// Instance groups to change.
  Future<void> modifyInstanceGroups({
    String? clusterId,
    List<InstanceGroupModifyConfig>? instanceGroups,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ModifyInstanceGroups'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clusterId != null) 'ClusterId': clusterId,
        if (instanceGroups != null) 'InstanceGroups': instanceGroups,
      },
    );
  }

  /// Creates or updates an automatic scaling policy for a core instance group
  /// or task instance group in an Amazon EMR cluster. The automatic scaling
  /// policy defines how an instance group dynamically adds and terminates
  /// Amazon EC2 instances in response to the value of a CloudWatch metric.
  ///
  /// Parameter [autoScalingPolicy] :
  /// Specifies the definition of the automatic scaling policy.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  ///
  /// Parameter [instanceGroupId] :
  /// Specifies the ID of the instance group to which the automatic scaling
  /// policy is applied.
  Future<PutAutoScalingPolicyOutput> putAutoScalingPolicy({
    required AutoScalingPolicy autoScalingPolicy,
    required String clusterId,
    required String instanceGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutAutoScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoScalingPolicy': autoScalingPolicy,
        'ClusterId': clusterId,
        'InstanceGroupId': instanceGroupId,
      },
    );

    return PutAutoScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// Auto-termination is supported in Amazon EMR releases 5.30.0 and 6.1.0 and
  /// later. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-auto-termination-policy.html">Using
  /// an auto-termination policy</a>.
  /// </note>
  /// Creates or updates an auto-termination policy for an Amazon EMR cluster.
  /// An auto-termination policy defines the amount of idle time in seconds
  /// after which a cluster automatically terminates. For alternative cluster
  /// termination options, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html">Control
  /// cluster termination</a>.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the Amazon EMR cluster to which the auto-termination
  /// policy will be attached.
  ///
  /// Parameter [autoTerminationPolicy] :
  /// Specifies the auto-termination policy to attach to the cluster.
  Future<void> putAutoTerminationPolicy({
    required String clusterId,
    AutoTerminationPolicy? autoTerminationPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutAutoTerminationPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (autoTerminationPolicy != null)
          'AutoTerminationPolicy': autoTerminationPolicy,
      },
    );
  }

  /// Creates or updates an Amazon EMR block public access configuration for
  /// your Amazon Web Services account in the current Region. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure
  /// Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management
  /// Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [blockPublicAccessConfiguration] :
  /// A configuration for Amazon EMR block public access. The configuration
  /// applies to all clusters created in your account for the current Region.
  /// The configuration specifies whether block public access is enabled. If
  /// block public access is enabled, security groups associated with the
  /// cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or
  /// ::/0 on a port, unless the port is specified as an exception using
  /// <code>PermittedPublicSecurityGroupRuleRanges</code> in the
  /// <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is
  /// an exception, and public access is allowed on this port. You can change
  /// this by updating <code>BlockPublicSecurityGroupRules</code> to remove the
  /// exception.
  /// <note>
  /// For accounts that created clusters in a Region before November 25, 2019,
  /// block public access is disabled by default in that Region. To use this
  /// feature, you must manually enable and configure it. For accounts that did
  /// not create an Amazon EMR cluster in a Region before this date, block
  /// public access is enabled by default in that Region.
  /// </note>
  Future<void> putBlockPublicAccessConfiguration({
    required BlockPublicAccessConfiguration blockPublicAccessConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutBlockPublicAccessConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BlockPublicAccessConfiguration': blockPublicAccessConfiguration,
      },
    );
  }

  /// Creates or updates a managed scaling policy for an Amazon EMR cluster. The
  /// managed scaling policy defines the limits for resources, such as Amazon
  /// EC2 instances that can be added or terminated from a cluster. The policy
  /// only applies to the core and task nodes. The master node cannot be scaled
  /// after initial configuration.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of an Amazon EMR cluster where the managed scaling policy
  /// is attached.
  ///
  /// Parameter [managedScalingPolicy] :
  /// Specifies the constraints for the managed scaling policy.
  Future<void> putManagedScalingPolicy({
    required String clusterId,
    required ManagedScalingPolicy managedScalingPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutManagedScalingPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'ManagedScalingPolicy': managedScalingPolicy,
      },
    );
  }

  /// Removes an automatic scaling policy from a specified instance group within
  /// an Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  ///
  /// Parameter [instanceGroupId] :
  /// Specifies the ID of the instance group to which the scaling policy is
  /// applied.
  Future<void> removeAutoScalingPolicy({
    required String clusterId,
    required String instanceGroupId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveAutoScalingPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'InstanceGroupId': instanceGroupId,
      },
    );
  }

  /// Removes an auto-termination policy from an Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the Amazon EMR cluster from which the auto-termination
  /// policy will be removed.
  Future<void> removeAutoTerminationPolicy({
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveAutoTerminationPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );
  }

  /// Removes a managed scaling policy from a specified Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the cluster from which the managed scaling policy will
  /// be removed.
  Future<void> removeManagedScalingPolicy({
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveManagedScalingPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );
  }

  /// Removes tags from an Amazon EMR resource, such as a cluster or Amazon EMR
  /// Studio. Tags make it easier to associate resources in various ways, such
  /// as grouping clusters to track your Amazon EMR resource allocation costs.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// Clusters</a>.
  ///
  /// The following example removes the stack tag with value Prod from a
  /// cluster:
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceId] :
  /// The Amazon EMR resource identifier from which tags will be removed. For
  /// example, a cluster identifier or an Amazon EMR Studio ID.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource.
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster that scopes the tag operation. Required when the
  /// resource being untagged is a session-scoped resource.
  Future<void> removeTags({
    required String resourceId,
    required List<String> tagKeys,
    String? clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveTags'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagKeys': tagKeys,
        if (clusterId != null) 'ClusterId': clusterId,
      },
    );
  }

  /// RunJobFlow creates and starts running a new cluster (job flow). The
  /// cluster runs the steps specified. After the steps complete, the cluster
  /// stops and the HDFS partition is lost. To prevent loss of data, configure
  /// the last step of the job flow to store results in Amazon S3. If the
  /// <a>JobFlowInstancesConfig</a> <code>KeepJobFlowAliveWhenNoSteps</code>
  /// parameter is set to <code>TRUE</code>, the cluster transitions to the
  /// WAITING state rather than shutting down after the steps have completed.
  ///
  /// For additional protection, you can set the <a>JobFlowInstancesConfig</a>
  /// <code>TerminationProtected</code> parameter to <code>TRUE</code> to lock
  /// the cluster and prevent it from being terminated by API call, user
  /// intervention, or in the event of a job flow error.
  ///
  /// A maximum of 256 steps are allowed in each job flow.
  ///
  /// If your cluster is long-running (such as a Hive data warehouse) or
  /// complex, you may require more than 256 steps to process your data. You can
  /// bypass the 256-step limitation in various ways, including using the SSH
  /// shell to connect to the master node and submitting queries directly to the
  /// software running on the master node, such as Hive and Hadoop.
  ///
  /// For long-running clusters, we recommend that you periodically store your
  /// results.
  /// <note>
  /// The instance fleets configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can
  /// contain InstanceFleets parameters or InstanceGroups parameters, but not
  /// both.
  /// </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [instances] :
  /// A specification of the number and type of Amazon EC2 instances.
  ///
  /// Parameter [name] :
  /// The name of the job flow.
  ///
  /// Parameter [additionalInfo] :
  /// A JSON string for selecting additional features.
  ///
  /// Parameter [amiVersion] :
  /// Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR
  /// releases 4.0 and later, <code>ReleaseLabel</code> is used. To specify a
  /// custom AMI, use <code>CustomAmiID</code>.
  ///
  /// Parameter [applications] :
  /// Applies to Amazon EMR releases 4.0 and later. A case-insensitive list of
  /// applications for Amazon EMR to install and configure when launching the
  /// cluster. For a list of applications available for each Amazon EMR release
  /// version, see the <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">Amazon
  /// EMRRelease Guide</a>.
  ///
  /// Parameter [autoScalingRole] :
  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides
  /// permissions that the automatic scaling feature requires to launch and
  /// terminate Amazon EC2 instances in an instance group.
  ///
  /// Parameter [bootstrapActions] :
  /// A list of bootstrap actions to run before Hadoop starts on the cluster
  /// nodes.
  ///
  /// Parameter [configurations] :
  /// For Amazon EMR releases 4.0 and later. The list of configurations supplied
  /// for the Amazon EMR cluster that you are creating.
  ///
  /// Parameter [customAmiId] :
  /// Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom
  /// Amazon EBS-backed Linux AMI. If specified, Amazon EMR uses this AMI when
  /// it launches cluster Amazon EC2 instances. For more information about
  /// custom AMIs in Amazon EMR, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html">Using
  /// a Custom AMI</a> in the <i>Amazon EMR Management Guide</i>. If omitted,
  /// the cluster uses the base Linux AMI for the <code>ReleaseLabel</code>
  /// specified. For Amazon EMR releases 2.x and 3.x, use
  /// <code>AmiVersion</code> instead.
  ///
  /// For information about creating a custom AMI, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating
  /// an Amazon EBS-Backed Linux AMI</a> in the <i>Amazon Elastic Compute Cloud
  /// User Guide for Linux Instances</i>. For information about finding an AMI
  /// ID, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding
  /// a Linux AMI</a>.
  ///
  /// Parameter [ebsRootVolumeIops] :
  /// The IOPS, of the Amazon EBS root device volume of the Linux AMI that is
  /// used for each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0
  /// and later.
  ///
  /// Parameter [ebsRootVolumeSize] :
  /// The size, in GiB, of the Amazon EBS root device volume of the Linux AMI
  /// that is used for each Amazon EC2 instance. Available in Amazon EMR
  /// releases 4.x and later.
  ///
  /// Parameter [ebsRootVolumeThroughput] :
  /// The throughput, in MiB/s, of the Amazon EBS root device volume of the
  /// Linux AMI that is used for each Amazon EC2 instance. Available in Amazon
  /// EMR releases 6.15.0 and later.
  ///
  /// Parameter [extendedSupport] :
  /// Reserved.
  ///
  /// Parameter [jobFlowRole] :
  /// Also called instance profile and Amazon EC2 role. An IAM role for an
  /// Amazon EMR cluster. The Amazon EC2 instances of the cluster assume this
  /// role. The default role is <code>EMR_EC2_DefaultRole</code>. In order to
  /// use the default role, you must have already created it using the CLI or
  /// console.
  ///
  /// Parameter [kerberosAttributes] :
  /// Attributes for Kerberos configuration when Kerberos authentication is
  /// enabled using a security configuration. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
  /// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
  ///
  /// Parameter [logEncryptionKmsKeyId] :
  /// The KMS key used for encrypting log files. If a value is not provided, the
  /// logs remain encrypted by AES-256. This attribute is only available with
  /// Amazon EMR releases 5.30.0 and later, excluding Amazon EMR 6.0.0.
  ///
  /// Parameter [logUri] :
  /// The location in Amazon S3 to write the log files of the job flow. If a
  /// value is not provided, logs are not created.
  ///
  /// Parameter [managedScalingPolicy] :
  /// The specified managed scaling policy for an Amazon EMR cluster.
  ///
  /// Parameter [monitoringConfiguration] :
  /// Contains CloudWatch log configuration metadata and settings.
  ///
  /// Parameter [newSupportedProducts] :
  /// <note>
  /// For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and
  /// later, use Applications.
  /// </note>
  /// A list of strings that indicates third-party software to use with the job
  /// flow that accepts a user argument list. Amazon EMR accepts and forwards
  /// the argument list to the corresponding installation script as bootstrap
  /// action arguments. For more information, see "Launch a Job Flow on the MapR
  /// Distribution for Hadoop" in the <a
  /// href="https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf">Amazon
  /// EMR Developer Guide</a>. Supported values are:
  ///
  /// <ul>
  /// <li>
  /// "mapr-m3" - launch the cluster using MapR M3 Edition.
  /// </li>
  /// <li>
  /// "mapr-m5" - launch the cluster using MapR M5 Edition.
  /// </li>
  /// <li>
  /// "mapr" with the user arguments specifying "--edition,m3" or "--edition,m5"
  /// - launch the job flow using MapR M3 or M5 Edition respectively.
  /// </li>
  /// <li>
  /// "mapr-m7" - launch the cluster using MapR M7 Edition.
  /// </li>
  /// <li>
  /// "hunk" - launch the cluster with the Hunk Big Data Analytics Platform.
  /// </li>
  /// <li>
  /// "hue"- launch the cluster with Hue installed.
  /// </li>
  /// <li>
  /// "spark" - launch the cluster with Apache Spark installed.
  /// </li>
  /// <li>
  /// "ganglia" - launch the cluster with the Ganglia Monitoring System
  /// installed.
  /// </li>
  /// </ul>
  ///
  /// Parameter [oSReleaseLabel] :
  /// Specifies a particular Amazon Linux release for all nodes in a cluster
  /// launch RunJobFlow request. If a release is not specified, Amazon EMR uses
  /// the latest validated Amazon Linux release for cluster launch.
  ///
  /// Parameter [placementGroupConfigs] :
  /// The specified placement group configuration for an Amazon EMR cluster.
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release label, which determines the version of open-source
  /// application packages installed on the cluster. Release labels are in the
  /// form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version
  /// such as <code>emr-5.14.0</code>. For more information about Amazon EMR
  /// release versions and included application versions and features, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>.
  /// The release label applies only to Amazon EMR releases version 4.0 and
  /// later. Earlier versions use <code>AmiVersion</code>.
  ///
  /// Parameter [repoUpgradeOnBoot] :
  /// Applies only when <code>CustomAmiID</code> is used. Specifies which
  /// updates from the Amazon Linux AMI package repositories to apply
  /// automatically when the instance boots using the AMI. If omitted, the
  /// default is <code>SECURITY</code>, which indicates that only security
  /// updates are applied. If <code>NONE</code> is specified, no updates are
  /// applied, and all updates must be applied manually.
  ///
  /// Parameter [scaleDownBehavior] :
  /// Specifies the way that individual Amazon EC2 instances terminate when an
  /// automatic scale-in activity occurs or an instance group is resized.
  /// <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR
  /// terminates nodes at the instance-hour boundary, regardless of when the
  /// request to terminate the instance was submitted. This option is only
  /// available with Amazon EMR 5.1.0 and later and is the default for clusters
  /// created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code>
  /// indicates that Amazon EMR adds nodes to a deny list and drains tasks from
  /// nodes before terminating the Amazon EC2 instances, regardless of the
  /// instance-hour boundary. With either behavior, Amazon EMR removes the least
  /// active nodes first and blocks instance termination if it could lead to
  /// HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> available only
  /// in Amazon EMR releases 4.1.0 and later, and is the default for releases of
  /// Amazon EMR earlier than 5.1.0.
  ///
  /// Parameter [securityConfiguration] :
  /// The name of a security configuration to apply to the cluster.
  ///
  /// Parameter [serviceRole] :
  /// The IAM role that Amazon EMR assumes in order to access Amazon Web
  /// Services resources on your behalf. If you've created a custom service role
  /// path, you must specify it for the service role when you launch your
  /// cluster.
  ///
  /// Parameter [sessionEnabled] :
  /// Indicates whether Spark Connect sessions are enabled on the cluster. When
  /// set to <code>true</code>, you can start Spark Connect sessions using the
  /// <code>StartSession</code> operation.
  ///
  /// Parameter [stepConcurrencyLevel] :
  /// Specifies the number of steps that can be executed concurrently. The
  /// default value is <code>1</code>. The maximum value is <code>256</code>.
  ///
  /// Parameter [stepExecutionRoleArn] :
  /// The Amazon Resource Name (ARN) of the runtime role for steps specified in
  /// the RunJobFlow request. The runtime role can be a cross-account IAM role.
  /// The runtime role ARN is a combination of account ID, role name, and role
  /// type using the following format:
  /// <code>arn:partition:iam::account-id:role/role-name</code>.
  ///
  /// For example, <code>arn:aws:iam::1234567890:role/ReadOnly</code> is a
  /// correctly formatted runtime role ARN.
  ///
  /// This parameter applies only to steps included in the <code>Steps</code>
  /// parameter of this RunJobFlow request. It does not apply to steps added
  /// later to the cluster.
  ///
  /// Parameter [steps] :
  /// A list of steps to run.
  ///
  /// Parameter [supportedProducts] :
  /// <note>
  /// For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and
  /// later, use Applications.
  /// </note>
  /// A list of strings that indicates third-party software to use. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf">Amazon
  /// EMR Developer Guide</a>. Currently supported values are:
  ///
  /// <ul>
  /// <li>
  /// "mapr-m3" - launch the job flow using MapR M3 Edition.
  /// </li>
  /// <li>
  /// "mapr-m5" - launch the job flow using MapR M5 Edition.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with a cluster and propagate to Amazon EC2
  /// instances.
  ///
  /// Parameter [visibleToAllUsers] :
  /// <important>
  /// The VisibleToAllUsers parameter is no longer supported. By default, the
  /// value is set to <code>true</code>. Setting it to <code>false</code> now
  /// has no effect.
  /// </important>
  /// Set this value to <code>true</code> so that IAM principals in the Amazon
  /// Web Services account associated with the cluster can perform Amazon EMR
  /// actions on the cluster that their IAM policies allow. This value defaults
  /// to <code>true</code> for clusters created using the Amazon EMR API or the
  /// CLI <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html">create-cluster</a>
  /// command.
  ///
  /// When set to <code>false</code>, only the IAM principal that created the
  /// cluster and the Amazon Web Services account root user can perform Amazon
  /// EMR actions for the cluster, regardless of the IAM permissions policies
  /// attached to other IAM principals. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/security_IAM_emr-with-IAM.html#security_set_visible_to_all_users">Understanding
  /// the Amazon EMR cluster VisibleToAllUsers setting</a> in the <i>Amazon EMR
  /// Management Guide</i>.
  Future<RunJobFlowOutput> runJobFlow({
    required JobFlowInstancesConfig instances,
    required String name,
    String? additionalInfo,
    String? amiVersion,
    List<Application>? applications,
    String? autoScalingRole,
    AutoTerminationPolicy? autoTerminationPolicy,
    List<BootstrapActionConfig>? bootstrapActions,
    List<Configuration>? configurations,
    String? customAmiId,
    int? ebsRootVolumeIops,
    int? ebsRootVolumeSize,
    int? ebsRootVolumeThroughput,
    bool? extendedSupport,
    String? jobFlowRole,
    KerberosAttributes? kerberosAttributes,
    String? logEncryptionKmsKeyId,
    String? logUri,
    ManagedScalingPolicy? managedScalingPolicy,
    MonitoringConfiguration? monitoringConfiguration,
    List<SupportedProductConfig>? newSupportedProducts,
    String? oSReleaseLabel,
    List<PlacementGroupConfig>? placementGroupConfigs,
    String? releaseLabel,
    RepoUpgradeOnBoot? repoUpgradeOnBoot,
    ScaleDownBehavior? scaleDownBehavior,
    String? securityConfiguration,
    String? serviceRole,
    bool? sessionEnabled,
    int? stepConcurrencyLevel,
    String? stepExecutionRoleArn,
    List<StepConfig>? steps,
    List<String>? supportedProducts,
    List<Tag>? tags,
    bool? visibleToAllUsers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RunJobFlow'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Instances': instances,
        'Name': name,
        if (additionalInfo != null) 'AdditionalInfo': additionalInfo,
        if (amiVersion != null) 'AmiVersion': amiVersion,
        if (applications != null) 'Applications': applications,
        if (autoScalingRole != null) 'AutoScalingRole': autoScalingRole,
        if (autoTerminationPolicy != null)
          'AutoTerminationPolicy': autoTerminationPolicy,
        if (bootstrapActions != null) 'BootstrapActions': bootstrapActions,
        if (configurations != null) 'Configurations': configurations,
        if (customAmiId != null) 'CustomAmiId': customAmiId,
        if (ebsRootVolumeIops != null) 'EbsRootVolumeIops': ebsRootVolumeIops,
        if (ebsRootVolumeSize != null) 'EbsRootVolumeSize': ebsRootVolumeSize,
        if (ebsRootVolumeThroughput != null)
          'EbsRootVolumeThroughput': ebsRootVolumeThroughput,
        if (extendedSupport != null) 'ExtendedSupport': extendedSupport,
        if (jobFlowRole != null) 'JobFlowRole': jobFlowRole,
        if (kerberosAttributes != null)
          'KerberosAttributes': kerberosAttributes,
        if (logEncryptionKmsKeyId != null)
          'LogEncryptionKmsKeyId': logEncryptionKmsKeyId,
        if (logUri != null) 'LogUri': logUri,
        if (managedScalingPolicy != null)
          'ManagedScalingPolicy': managedScalingPolicy,
        if (monitoringConfiguration != null)
          'MonitoringConfiguration': monitoringConfiguration,
        if (newSupportedProducts != null)
          'NewSupportedProducts': newSupportedProducts,
        if (oSReleaseLabel != null) 'OSReleaseLabel': oSReleaseLabel,
        if (placementGroupConfigs != null)
          'PlacementGroupConfigs': placementGroupConfigs,
        if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
        if (repoUpgradeOnBoot != null)
          'RepoUpgradeOnBoot': repoUpgradeOnBoot.value,
        if (scaleDownBehavior != null)
          'ScaleDownBehavior': scaleDownBehavior.value,
        if (securityConfiguration != null)
          'SecurityConfiguration': securityConfiguration,
        if (serviceRole != null) 'ServiceRole': serviceRole,
        if (sessionEnabled != null) 'SessionEnabled': sessionEnabled,
        if (stepConcurrencyLevel != null)
          'StepConcurrencyLevel': stepConcurrencyLevel,
        if (stepExecutionRoleArn != null)
          'StepExecutionRoleArn': stepExecutionRoleArn,
        if (steps != null) 'Steps': steps,
        if (supportedProducts != null) 'SupportedProducts': supportedProducts,
        if (tags != null) 'Tags': tags,
        if (visibleToAllUsers != null) 'VisibleToAllUsers': visibleToAllUsers,
      },
    );

    return RunJobFlowOutput.fromJson(jsonResponse.body);
  }

  /// You can use the <code>SetKeepJobFlowAliveWhenNoSteps</code> to configure a
  /// cluster (job flow) to terminate after the step execution, i.e., all your
  /// steps are executed. If you want a transient cluster that shuts down after
  /// the last of the current executing steps are completed, you can configure
  /// <code>SetKeepJobFlowAliveWhenNoSteps</code> to false. If you want a long
  /// running cluster, configure <code>SetKeepJobFlowAliveWhenNoSteps</code> to
  /// true.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing
  /// Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// A list of strings that uniquely identify the clusters to protect. This
  /// identifier is returned by <a
  /// href="https://docs.aws.amazon.com/emr/latest/APIReference/API_RunJobFlow.html">RunJobFlow</a>
  /// and can also be obtained from <a
  /// href="https://docs.aws.amazon.com/emr/latest/APIReference/API_DescribeJobFlows.html">DescribeJobFlows</a>.
  ///
  /// Parameter [keepJobFlowAliveWhenNoSteps] :
  /// A Boolean that indicates whether to terminate the cluster after all steps
  /// are executed.
  Future<void> setKeepJobFlowAliveWhenNoSteps({
    required List<String> jobFlowIds,
    required bool keepJobFlowAliveWhenNoSteps,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetKeepJobFlowAliveWhenNoSteps'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowIds': jobFlowIds,
        'KeepJobFlowAliveWhenNoSteps': keepJobFlowAliveWhenNoSteps,
      },
    );
  }

  /// SetTerminationProtection locks a cluster (job flow) so the Amazon EC2
  /// instances in the cluster cannot be terminated by user intervention, an API
  /// call, or in the event of a job-flow error. The cluster still terminates
  /// upon successful completion of the job flow. Calling
  /// <code>SetTerminationProtection</code> on a cluster is similar to calling
  /// the Amazon EC2 <code>DisableAPITermination</code> API on all Amazon EC2
  /// instances in a cluster.
  ///
  /// <code>SetTerminationProtection</code> is used to prevent accidental
  /// termination of a cluster and to ensure that in the event of an error, the
  /// instances persist so that you can recover any data stored in their
  /// ephemeral instance storage.
  ///
  /// To terminate a cluster that has been locked by setting
  /// <code>SetTerminationProtection</code> to <code>true</code>, you must first
  /// unlock the job flow by a subsequent call to
  /// <code>SetTerminationProtection</code> in which you set the value to
  /// <code>false</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing
  /// Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// A list of strings that uniquely identify the clusters to protect. This
  /// identifier is returned by <a>RunJobFlow</a> and can also be obtained from
  /// <a>DescribeJobFlows</a> .
  ///
  /// Parameter [terminationProtected] :
  /// A Boolean that indicates whether to protect the cluster and prevent the
  /// Amazon EC2 instances in the cluster from shutting down due to API calls,
  /// user intervention, or job-flow error.
  Future<void> setTerminationProtection({
    required List<String> jobFlowIds,
    required bool terminationProtected,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetTerminationProtection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowIds': jobFlowIds,
        'TerminationProtected': terminationProtected,
      },
    );
  }

  /// Specify whether to enable unhealthy node replacement, which lets Amazon
  /// EMR gracefully replace core nodes on a cluster if any nodes become
  /// unhealthy. For example, a node becomes unhealthy if disk usage is above
  /// 90%. If unhealthy node replacement is on and
  /// <code>TerminationProtected</code> are off, Amazon EMR immediately
  /// terminates the unhealthy core nodes. To use unhealthy node replacement and
  /// retain unhealthy core nodes, use to turn on termination protection. In
  /// such cases, Amazon EMR adds the unhealthy nodes to a denylist, reducing
  /// job interruptions and failures.
  ///
  /// If unhealthy node replacement is on, Amazon EMR notifies YARN and other
  /// applications on the cluster to stop scheduling tasks with these nodes,
  /// moves the data, and then terminates the nodes.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-node-replacement.html">graceful
  /// node replacement</a> in the <i>Amazon EMR Management Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// The list of strings that uniquely identify the clusters for which to turn
  /// on unhealthy node replacement. You can get these identifiers by running
  /// the <a>RunJobFlow</a> or the <a>DescribeJobFlows</a> operations.
  ///
  /// Parameter [unhealthyNodeReplacement] :
  /// Indicates whether to turn on or turn off graceful unhealthy node
  /// replacement.
  Future<void> setUnhealthyNodeReplacement({
    required List<String> jobFlowIds,
    required bool unhealthyNodeReplacement,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetUnhealthyNodeReplacement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowIds': jobFlowIds,
        'UnhealthyNodeReplacement': unhealthyNodeReplacement,
      },
    );
  }

  /// <important>
  /// The SetVisibleToAllUsers parameter is no longer supported. Your cluster
  /// may be visible to all users in your account. To restrict cluster access
  /// using an IAM policy, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-access-IAM.html">Identity
  /// and Access Management for Amazon EMR</a>.
  /// </important>
  /// Sets the <a>Cluster$VisibleToAllUsers</a> value for an Amazon EMR cluster.
  /// When <code>true</code>, IAM principals in the Amazon Web Services account
  /// can perform Amazon EMR cluster actions that their IAM policies allow. When
  /// <code>false</code>, only the IAM principal that created the cluster and
  /// the Amazon Web Services account root user can perform Amazon EMR actions
  /// on the cluster, regardless of IAM permissions policies attached to other
  /// IAM principals.
  ///
  /// This action works on running clusters. When you create a cluster, use the
  /// <a>RunJobFlowInput$VisibleToAllUsers</a> parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/security_IAM_emr-with-IAM.html#security_set_visible_to_all_users">Understanding
  /// the Amazon EMR Cluster VisibleToAllUsers Setting</a> in the <i>Amazon EMR
  /// Management Guide</i>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// The unique identifier of the job flow (cluster).
  ///
  /// Parameter [visibleToAllUsers] :
  /// A value of <code>true</code> indicates that an IAM principal in the Amazon
  /// Web Services account can perform Amazon EMR actions on the cluster that
  /// the IAM policies attached to the principal allow. A value of
  /// <code>false</code> indicates that only the IAM principal that created the
  /// cluster and the Amazon Web Services root user can perform Amazon EMR
  /// actions on the cluster.
  Future<void> setVisibleToAllUsers({
    required List<String> jobFlowIds,
    required bool visibleToAllUsers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetVisibleToAllUsers'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowIds': jobFlowIds,
        'VisibleToAllUsers': visibleToAllUsers,
      },
    );
  }

  /// Starts a notebook execution.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [executionEngine] :
  /// Specifies the execution engine (cluster) that runs the notebook execution.
  ///
  /// Parameter [serviceRole] :
  /// The name or ARN of the IAM role that is used as the service role for
  /// Amazon EMR (the Amazon EMR role) for the notebook execution.
  ///
  /// Parameter [editorId] :
  /// The unique identifier of the Amazon EMR Notebook to use for notebook
  /// execution.
  ///
  /// Parameter [environmentVariables] :
  /// The environment variables associated with the notebook execution.
  ///
  /// Parameter [notebookExecutionName] :
  /// An optional name for the notebook execution.
  ///
  /// Parameter [notebookInstanceSecurityGroupId] :
  /// The unique identifier of the Amazon EC2 security group to associate with
  /// the Amazon EMR Notebook for this notebook execution.
  ///
  /// Parameter [notebookParams] :
  /// Input parameters in JSON format passed to the Amazon EMR Notebook at
  /// runtime for execution.
  ///
  /// Parameter [notebookS3Location] :
  /// The Amazon S3 location for the notebook execution input.
  ///
  /// Parameter [outputNotebookFormat] :
  /// The output format for the notebook execution.
  ///
  /// Parameter [outputNotebookS3Location] :
  /// The Amazon S3 location for the notebook execution output.
  ///
  /// Parameter [relativePath] :
  /// The path and file name of the notebook file for this execution, relative
  /// to the path specified for the Amazon EMR Notebook. For example, if you
  /// specify a path of <code>s3://MyBucket/MyNotebooks</code> when you create
  /// an Amazon EMR Notebook for a notebook with an ID of
  /// <code>e-ABCDEFGHIJK1234567890ABCD</code> (the <code>EditorID</code> of
  /// this request), and you specify a <code>RelativePath</code> of
  /// <code>my_notebook_executions/notebook_execution.ipynb</code>, the location
  /// of the file for the notebook execution is
  /// <code>s3://MyBucket/MyNotebooks/e-ABCDEFGHIJK1234567890ABCD/my_notebook_executions/notebook_execution.ipynb</code>.
  ///
  /// Parameter [tags] :
  /// A list of tags associated with a notebook execution. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of
  /// 128 characters and an optional value string with a maximum of 256
  /// characters.
  Future<StartNotebookExecutionOutput> startNotebookExecution({
    required ExecutionEngineConfig executionEngine,
    required String serviceRole,
    String? editorId,
    Map<String, String>? environmentVariables,
    String? notebookExecutionName,
    String? notebookInstanceSecurityGroupId,
    String? notebookParams,
    NotebookS3LocationFromInput? notebookS3Location,
    OutputNotebookFormat? outputNotebookFormat,
    OutputNotebookS3LocationFromInput? outputNotebookS3Location,
    String? relativePath,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.StartNotebookExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExecutionEngine': executionEngine,
        'ServiceRole': serviceRole,
        if (editorId != null) 'EditorId': editorId,
        if (environmentVariables != null)
          'EnvironmentVariables': environmentVariables,
        if (notebookExecutionName != null)
          'NotebookExecutionName': notebookExecutionName,
        if (notebookInstanceSecurityGroupId != null)
          'NotebookInstanceSecurityGroupId': notebookInstanceSecurityGroupId,
        if (notebookParams != null) 'NotebookParams': notebookParams,
        if (notebookS3Location != null)
          'NotebookS3Location': notebookS3Location,
        if (outputNotebookFormat != null)
          'OutputNotebookFormat': outputNotebookFormat.value,
        if (outputNotebookS3Location != null)
          'OutputNotebookS3Location': outputNotebookS3Location,
        if (relativePath != null) 'RelativePath': relativePath,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartNotebookExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Creates and starts a new Spark Connect session on the specified cluster.
  /// The cluster must be in the <code>RUNNING</code> or <code>WAITING</code>
  /// state and have sessions enabled. This operation is supported in Amazon EMR
  /// Spark 8.0.0 and later.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster on which to start the session.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request that completed
  /// successfully using the same client request token, the service returns the
  /// original response without performing the operation again.
  ///
  /// Parameter [engineConfigurations] :
  /// The configuration overrides for the session. Only runtime configuration
  /// overrides are supported.
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN for the session. Amazon EMR uses this role to
  /// access Amazon Web Services resources on your behalf during session
  /// execution.
  ///
  /// Parameter [monitoringConfiguration] :
  /// The monitoring configuration that controls where session logs are
  /// published, such as Amazon S3, CloudWatch, or managed logging.
  ///
  /// Parameter [name] :
  /// An optional name for the session.
  ///
  /// Parameter [sessionIdleTimeoutInMinutes] :
  /// The idle timeout, in minutes. If the session is idle for this duration,
  /// Amazon EMR EC2 automatically terminates it.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the session.
  Future<StartSessionOutput> startSession({
    required String clusterId,
    String? clientRequestToken,
    List<Configuration>? engineConfigurations,
    String? executionRoleArn,
    SessionMonitoringConfiguration? monitoringConfiguration,
    String? name,
    int? sessionIdleTimeoutInMinutes,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.StartSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (clientRequestToken != null)
          'ClientRequestToken': clientRequestToken,
        if (engineConfigurations != null)
          'EngineConfigurations': engineConfigurations,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
        if (monitoringConfiguration != null)
          'MonitoringConfiguration': monitoringConfiguration,
        if (name != null) 'Name': name,
        if (sessionIdleTimeoutInMinutes != null)
          'SessionIdleTimeoutInMinutes': sessionIdleTimeoutInMinutes,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartSessionOutput.fromJson(jsonResponse.body);
  }

  /// Stops a notebook execution.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [notebookExecutionId] :
  /// The unique identifier of the notebook execution.
  Future<void> stopNotebookExecution({
    required String notebookExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.StopNotebookExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookExecutionId': notebookExecutionId,
      },
    );
  }

  /// TerminateJobFlows shuts a list of clusters (job flows) down. When a job
  /// flow is shut down, any step not yet completed is canceled and the Amazon
  /// EC2 instances on which the cluster is running are stopped. Any log files
  /// not already saved are uploaded to Amazon S3 if a LogUri was specified when
  /// the cluster was created.
  ///
  /// The maximum number of clusters allowed is 10. The call to
  /// <code>TerminateJobFlows</code> is asynchronous. Depending on the
  /// configuration of the cluster, it may take up to 1-5 minutes for the
  /// cluster to completely terminate and release allocated resources, such as
  /// Amazon EC2 instances.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// A list of job flows to be shut down.
  Future<void> terminateJobFlows({
    required List<String> jobFlowIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.TerminateJobFlows'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobFlowIds': jobFlowIds,
      },
    );
  }

  /// Terminates an active session. After you call this operation, the session
  /// enters the <code>TERMINATING</code> state and then transitions to
  /// <code>TERMINATED</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The ID of the cluster that the session belongs to.
  ///
  /// Parameter [sessionId] :
  /// The ID of the session to terminate.
  Future<TerminateSessionOutput> terminateSession({
    required String clusterId,
    required String sessionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.TerminateSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        'SessionId': sessionId,
      },
    );

    return TerminateSessionOutput.fromJson(jsonResponse.body);
  }

  /// Updates an Amazon EMR Studio configuration, including attributes such as
  /// name, description, and subnets.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio to update.
  ///
  /// Parameter [defaultS3Location] :
  /// The Amazon S3 location to back up Workspaces and notebook files for the
  /// Amazon EMR Studio.
  ///
  /// Parameter [description] :
  /// A detailed description to assign to the Amazon EMR Studio.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace
  /// and notebook files when backed up to Amazon S3.
  ///
  /// Parameter [name] :
  /// A descriptive name for the Amazon EMR Studio.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs to associate with the Amazon EMR Studio. The list can
  /// include new subnet IDs, but must also include all of the subnet IDs
  /// previously associated with the Studio. The list order does not matter. A
  /// Studio can have a maximum of 5 subnets. The subnets must belong to the
  /// same VPC as the Studio.
  Future<void> updateStudio({
    required String studioId,
    String? defaultS3Location,
    String? description,
    String? encryptionKeyArn,
    String? name,
    List<String>? subnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.UpdateStudio'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StudioId': studioId,
        if (defaultS3Location != null) 'DefaultS3Location': defaultS3Location,
        if (description != null) 'Description': description,
        if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
        if (name != null) 'Name': name,
        if (subnetIds != null) 'SubnetIds': subnetIds,
      },
    );
  }

  /// Updates the session policy attached to the user or group for the specified
  /// Amazon EMR Studio.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to update is a user or a group.
  ///
  /// Parameter [sessionPolicyArn] :
  /// The Amazon Resource Name (ARN) of the session policy to associate with the
  /// specified user or group.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group to update. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<void> updateStudioSessionMapping({
    required IdentityType identityType,
    required String sessionPolicyArn,
    required String studioId,
    String? identityId,
    String? identityName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.UpdateStudioSessionMapping'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType.value,
        'SessionPolicyArn': sessionPolicyArn,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );
  }
}

/// @nodoc
class AddInstanceFleetOutput {
  /// The Amazon Resource Name of the cluster.
  final String? clusterArn;

  /// The unique identifier of the cluster.
  final String? clusterId;

  /// The unique identifier of the instance fleet.
  final String? instanceFleetId;

  AddInstanceFleetOutput({
    this.clusterArn,
    this.clusterId,
    this.instanceFleetId,
  });

  factory AddInstanceFleetOutput.fromJson(Map<String, dynamic> json) {
    return AddInstanceFleetOutput(
      clusterArn: json['ClusterArn'] as String?,
      clusterId: json['ClusterId'] as String?,
      instanceFleetId: json['InstanceFleetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterId = this.clusterId;
    final instanceFleetId = this.instanceFleetId;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (clusterId != null) 'ClusterId': clusterId,
      if (instanceFleetId != null) 'InstanceFleetId': instanceFleetId,
    };
  }
}

/// Output from an AddInstanceGroups call.
///
/// @nodoc
class AddInstanceGroupsOutput {
  /// The Amazon Resource Name of the cluster.
  final String? clusterArn;

  /// Instance group IDs of the newly created instance groups.
  final List<String>? instanceGroupIds;

  /// The job flow ID in which the instance groups are added.
  final String? jobFlowId;

  AddInstanceGroupsOutput({
    this.clusterArn,
    this.instanceGroupIds,
    this.jobFlowId,
  });

  factory AddInstanceGroupsOutput.fromJson(Map<String, dynamic> json) {
    return AddInstanceGroupsOutput(
      clusterArn: json['ClusterArn'] as String?,
      instanceGroupIds: (json['InstanceGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      jobFlowId: json['JobFlowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final instanceGroupIds = this.instanceGroupIds;
    final jobFlowId = this.jobFlowId;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (instanceGroupIds != null) 'InstanceGroupIds': instanceGroupIds,
      if (jobFlowId != null) 'JobFlowId': jobFlowId,
    };
  }
}

/// The output for the <a>AddJobFlowSteps</a> operation.
///
/// @nodoc
class AddJobFlowStepsOutput {
  /// The identifiers of the list of steps added to the job flow.
  final List<String>? stepIds;

  AddJobFlowStepsOutput({
    this.stepIds,
  });

  factory AddJobFlowStepsOutput.fromJson(Map<String, dynamic> json) {
    return AddJobFlowStepsOutput(
      stepIds:
          (json['StepIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stepIds = this.stepIds;
    return {
      if (stepIds != null) 'StepIds': stepIds,
    };
  }
}

/// This output indicates the result of adding tags to a resource.
///
/// @nodoc
class AddTagsOutput {
  AddTagsOutput();

  factory AddTagsOutput.fromJson(Map<String, dynamic> _) {
    return AddTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The output for the <a>CancelSteps</a> operation.
///
/// @nodoc
class CancelStepsOutput {
  /// A list of <a>CancelStepsInfo</a>, which shows the status of specified cancel
  /// requests for each <code>StepID</code> specified.
  final List<CancelStepsInfo>? cancelStepsInfoList;

  CancelStepsOutput({
    this.cancelStepsInfoList,
  });

  factory CancelStepsOutput.fromJson(Map<String, dynamic> json) {
    return CancelStepsOutput(
      cancelStepsInfoList: (json['CancelStepsInfoList'] as List?)
          ?.nonNulls
          .map((e) => CancelStepsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cancelStepsInfoList = this.cancelStepsInfoList;
    return {
      if (cancelStepsInfoList != null)
        'CancelStepsInfoList': cancelStepsInfoList,
    };
  }
}

/// @nodoc
class CreatePersistentAppUIOutput {
  /// The persistent application user interface identifier.
  final String? persistentAppUIId;

  /// Represents if the EMR on EC2 cluster that the persisent application user
  /// interface is created for is a runtime role enabled cluster or not.
  final bool? runtimeRoleEnabledCluster;

  CreatePersistentAppUIOutput({
    this.persistentAppUIId,
    this.runtimeRoleEnabledCluster,
  });

  factory CreatePersistentAppUIOutput.fromJson(Map<String, dynamic> json) {
    return CreatePersistentAppUIOutput(
      persistentAppUIId: json['PersistentAppUIId'] as String?,
      runtimeRoleEnabledCluster: json['RuntimeRoleEnabledCluster'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final persistentAppUIId = this.persistentAppUIId;
    final runtimeRoleEnabledCluster = this.runtimeRoleEnabledCluster;
    return {
      if (persistentAppUIId != null) 'PersistentAppUIId': persistentAppUIId,
      if (runtimeRoleEnabledCluster != null)
        'RuntimeRoleEnabledCluster': runtimeRoleEnabledCluster,
    };
  }
}

/// @nodoc
class CreateSecurityConfigurationOutput {
  /// The date and time the security configuration was created.
  final DateTime creationDateTime;

  /// The name of the security configuration.
  final String name;

  CreateSecurityConfigurationOutput({
    required this.creationDateTime,
    required this.name,
  });

  factory CreateSecurityConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateSecurityConfigurationOutput(
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final name = this.name;
    return {
      'CreationDateTime': unixTimestampToJson(creationDateTime),
      'Name': name,
    };
  }
}

/// @nodoc
class CreateStudioOutput {
  /// The ID of the Amazon EMR Studio.
  final String? studioId;

  /// The unique Studio access URL.
  final String? url;

  CreateStudioOutput({
    this.studioId,
    this.url,
  });

  factory CreateStudioOutput.fromJson(Map<String, dynamic> json) {
    return CreateStudioOutput(
      studioId: json['StudioId'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final studioId = this.studioId;
    final url = this.url;
    return {
      if (studioId != null) 'StudioId': studioId,
      if (url != null) 'Url': url,
    };
  }
}

/// @nodoc
class DeleteSecurityConfigurationOutput {
  DeleteSecurityConfigurationOutput();

  factory DeleteSecurityConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSecurityConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This output contains the description of the cluster.
///
/// @nodoc
class DescribeClusterOutput {
  /// This output contains the details for the requested cluster.
  final Cluster? cluster;

  DescribeClusterOutput({
    this.cluster,
  });

  factory DescribeClusterOutput.fromJson(Map<String, dynamic> json) {
    return DescribeClusterOutput(
      cluster: json['Cluster'] != null
          ? Cluster.fromJson(json['Cluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    return {
      if (cluster != null) 'Cluster': cluster,
    };
  }
}

/// The output for the <a>DescribeJobFlows</a> operation.
///
/// @nodoc
class DescribeJobFlowsOutput {
  /// A list of job flows matching the parameters supplied.
  final List<JobFlowDetail>? jobFlows;

  DescribeJobFlowsOutput({
    this.jobFlows,
  });

  factory DescribeJobFlowsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeJobFlowsOutput(
      jobFlows: (json['JobFlows'] as List?)
          ?.nonNulls
          .map((e) => JobFlowDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobFlows = this.jobFlows;
    return {
      if (jobFlows != null) 'JobFlows': jobFlows,
    };
  }
}

/// @nodoc
class DescribeNotebookExecutionOutput {
  /// Properties of the notebook execution.
  final NotebookExecution? notebookExecution;

  DescribeNotebookExecutionOutput({
    this.notebookExecution,
  });

  factory DescribeNotebookExecutionOutput.fromJson(Map<String, dynamic> json) {
    return DescribeNotebookExecutionOutput(
      notebookExecution: json['NotebookExecution'] != null
          ? NotebookExecution.fromJson(
              json['NotebookExecution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookExecution = this.notebookExecution;
    return {
      if (notebookExecution != null) 'NotebookExecution': notebookExecution,
    };
  }
}

/// @nodoc
class DescribePersistentAppUIOutput {
  /// The persistent application user interface.
  final PersistentAppUI? persistentAppUI;

  DescribePersistentAppUIOutput({
    this.persistentAppUI,
  });

  factory DescribePersistentAppUIOutput.fromJson(Map<String, dynamic> json) {
    return DescribePersistentAppUIOutput(
      persistentAppUI: json['PersistentAppUI'] != null
          ? PersistentAppUI.fromJson(
              json['PersistentAppUI'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final persistentAppUI = this.persistentAppUI;
    return {
      if (persistentAppUI != null) 'PersistentAppUI': persistentAppUI,
    };
  }
}

/// @nodoc
class DescribeReleaseLabelOutput {
  /// The list of applications available for the target release label.
  /// <code>Name</code> is the name of the application. <code>Version</code> is
  /// the concise version of the application.
  final List<SimplifiedApplication>? applications;

  /// The list of available Amazon Linux release versions for an Amazon EMR
  /// release. Contains a Label field that is formatted as shown in <a
  /// href="https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-al2.html">
  /// <i>Amazon Linux 2 Release Notes</i> </a>. For example, <a
  /// href="https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-20220218.html">2.0.20220218.1</a>.
  final List<OSRelease>? availableOSReleases;

  /// The pagination token. Reserved for future use. Currently set to null.
  final String? nextToken;

  /// The target release label described in the response.
  final String? releaseLabel;

  DescribeReleaseLabelOutput({
    this.applications,
    this.availableOSReleases,
    this.nextToken,
    this.releaseLabel,
  });

  factory DescribeReleaseLabelOutput.fromJson(Map<String, dynamic> json) {
    return DescribeReleaseLabelOutput(
      applications: (json['Applications'] as List?)
          ?.nonNulls
          .map((e) => SimplifiedApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableOSReleases: (json['AvailableOSReleases'] as List?)
          ?.nonNulls
          .map((e) => OSRelease.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      releaseLabel: json['ReleaseLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final availableOSReleases = this.availableOSReleases;
    final nextToken = this.nextToken;
    final releaseLabel = this.releaseLabel;
    return {
      if (applications != null) 'Applications': applications,
      if (availableOSReleases != null)
        'AvailableOSReleases': availableOSReleases,
      if (nextToken != null) 'NextToken': nextToken,
      if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
    };
  }
}

/// @nodoc
class DescribeSecurityConfigurationOutput {
  /// The date and time the security configuration was created
  final DateTime? creationDateTime;

  /// The name of the security configuration.
  final String? name;

  /// The security configuration details in JSON format.
  final String? securityConfiguration;

  DescribeSecurityConfigurationOutput({
    this.creationDateTime,
    this.name,
    this.securityConfiguration,
  });

  factory DescribeSecurityConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeSecurityConfigurationOutput(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      name: json['Name'] as String?,
      securityConfiguration: json['SecurityConfiguration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final name = this.name;
    final securityConfiguration = this.securityConfiguration;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (name != null) 'Name': name,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
    };
  }
}

/// This output contains the description of the cluster step.
///
/// @nodoc
class DescribeStepOutput {
  /// The step details for the requested step identifier.
  final Step? step;

  DescribeStepOutput({
    this.step,
  });

  factory DescribeStepOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStepOutput(
      step: json['Step'] != null
          ? Step.fromJson(json['Step'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final step = this.step;
    return {
      if (step != null) 'Step': step,
    };
  }
}

/// @nodoc
class DescribeStudioOutput {
  /// The Amazon EMR Studio details.
  final Studio? studio;

  DescribeStudioOutput({
    this.studio,
  });

  factory DescribeStudioOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStudioOutput(
      studio: json['Studio'] != null
          ? Studio.fromJson(json['Studio'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      if (studio != null) 'Studio': studio,
    };
  }
}

/// @nodoc
class GetAutoTerminationPolicyOutput {
  /// Specifies the auto-termination policy that is attached to an Amazon EMR
  /// cluster.
  final AutoTerminationPolicy? autoTerminationPolicy;

  GetAutoTerminationPolicyOutput({
    this.autoTerminationPolicy,
  });

  factory GetAutoTerminationPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetAutoTerminationPolicyOutput(
      autoTerminationPolicy: json['AutoTerminationPolicy'] != null
          ? AutoTerminationPolicy.fromJson(
              json['AutoTerminationPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoTerminationPolicy = this.autoTerminationPolicy;
    return {
      if (autoTerminationPolicy != null)
        'AutoTerminationPolicy': autoTerminationPolicy,
    };
  }
}

/// @nodoc
class GetBlockPublicAccessConfigurationOutput {
  /// A configuration for Amazon EMR block public access. The configuration
  /// applies to all clusters created in your account for the current Region. The
  /// configuration specifies whether block public access is enabled. If block
  /// public access is enabled, security groups associated with the cluster cannot
  /// have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port,
  /// unless the port is specified as an exception using
  /// <code>PermittedPublicSecurityGroupRuleRanges</code> in the
  /// <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is an
  /// exception, and public access is allowed on this port. You can change this by
  /// updating the block public access configuration to remove the exception.
  /// <note>
  /// For accounts that created clusters in a Region before November 25, 2019,
  /// block public access is disabled by default in that Region. To use this
  /// feature, you must manually enable and configure it. For accounts that did
  /// not create an Amazon EMR cluster in a Region before this date, block public
  /// access is enabled by default in that Region.
  /// </note>
  final BlockPublicAccessConfiguration blockPublicAccessConfiguration;

  /// Properties that describe the Amazon Web Services principal that created the
  /// <code>BlockPublicAccessConfiguration</code> using the
  /// <code>PutBlockPublicAccessConfiguration</code> action as well as the date
  /// and time that the configuration was created. Each time a configuration for
  /// block public access is updated, Amazon EMR updates this metadata.
  final BlockPublicAccessConfigurationMetadata
      blockPublicAccessConfigurationMetadata;

  GetBlockPublicAccessConfigurationOutput({
    required this.blockPublicAccessConfiguration,
    required this.blockPublicAccessConfigurationMetadata,
  });

  factory GetBlockPublicAccessConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetBlockPublicAccessConfigurationOutput(
      blockPublicAccessConfiguration: BlockPublicAccessConfiguration.fromJson(
          (json['BlockPublicAccessConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      blockPublicAccessConfigurationMetadata:
          BlockPublicAccessConfigurationMetadata.fromJson(
              (json['BlockPublicAccessConfigurationMetadata']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicAccessConfiguration = this.blockPublicAccessConfiguration;
    final blockPublicAccessConfigurationMetadata =
        this.blockPublicAccessConfigurationMetadata;
    return {
      'BlockPublicAccessConfiguration': blockPublicAccessConfiguration,
      'BlockPublicAccessConfigurationMetadata':
          blockPublicAccessConfigurationMetadata,
    };
  }
}

/// @nodoc
class GetClusterSessionCredentialsOutput {
  /// The credentials that you can use to connect to cluster endpoints that
  /// support username and password authentication.
  final Credentials? credentials;

  /// The time when the credentials that are returned by the
  /// <code>GetClusterSessionCredentials</code> API expire.
  final DateTime? expiresAt;

  GetClusterSessionCredentialsOutput({
    this.credentials,
    this.expiresAt,
  });

  factory GetClusterSessionCredentialsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetClusterSessionCredentialsOutput(
      credentials: json['Credentials'] != null
          ? Credentials.fromJson(json['Credentials'] as Map<String, dynamic>)
          : null,
      expiresAt: timeStampFromJson(json['ExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final expiresAt = this.expiresAt;
    return {
      if (credentials != null) 'Credentials': credentials,
      if (expiresAt != null) 'ExpiresAt': unixTimestampToJson(expiresAt),
    };
  }
}

/// @nodoc
class GetManagedScalingPolicyOutput {
  /// Specifies the managed scaling policy that is attached to an Amazon EMR
  /// cluster.
  final ManagedScalingPolicy? managedScalingPolicy;

  GetManagedScalingPolicyOutput({
    this.managedScalingPolicy,
  });

  factory GetManagedScalingPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetManagedScalingPolicyOutput(
      managedScalingPolicy: json['ManagedScalingPolicy'] != null
          ? ManagedScalingPolicy.fromJson(
              json['ManagedScalingPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedScalingPolicy = this.managedScalingPolicy;
    return {
      if (managedScalingPolicy != null)
        'ManagedScalingPolicy': managedScalingPolicy,
    };
  }
}

/// @nodoc
class GetOnClusterAppUIPresignedURLOutput {
  /// The cluster's generated presigned URL.
  final String? presignedURL;

  /// Used to determine if the presigned URL is ready.
  final bool? presignedURLReady;

  GetOnClusterAppUIPresignedURLOutput({
    this.presignedURL,
    this.presignedURLReady,
  });

  factory GetOnClusterAppUIPresignedURLOutput.fromJson(
      Map<String, dynamic> json) {
    return GetOnClusterAppUIPresignedURLOutput(
      presignedURL: json['PresignedURL'] as String?,
      presignedURLReady: json['PresignedURLReady'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final presignedURL = this.presignedURL;
    final presignedURLReady = this.presignedURLReady;
    return {
      if (presignedURL != null) 'PresignedURL': presignedURL,
      if (presignedURLReady != null) 'PresignedURLReady': presignedURLReady,
    };
  }
}

/// @nodoc
class GetPersistentAppUIPresignedURLOutput {
  /// The returned presigned URL.
  final String? presignedURL;

  /// Used to determine if the presigned URL is ready.
  final bool? presignedURLReady;

  GetPersistentAppUIPresignedURLOutput({
    this.presignedURL,
    this.presignedURLReady,
  });

  factory GetPersistentAppUIPresignedURLOutput.fromJson(
      Map<String, dynamic> json) {
    return GetPersistentAppUIPresignedURLOutput(
      presignedURL: json['PresignedURL'] as String?,
      presignedURLReady: json['PresignedURLReady'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final presignedURL = this.presignedURL;
    final presignedURLReady = this.presignedURLReady;
    return {
      if (presignedURL != null) 'PresignedURL': presignedURL,
      if (presignedURLReady != null) 'PresignedURLReady': presignedURLReady,
    };
  }
}

/// Output of the <code>GetSession</code> operation.
///
/// @nodoc
class GetSessionOutput {
  /// The output displays information about the session.
  final Session session;

  GetSessionOutput({
    required this.session,
  });

  factory GetSessionOutput.fromJson(Map<String, dynamic> json) {
    return GetSessionOutput(
      session: Session.fromJson((json['Session'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      'Session': session,
    };
  }
}

/// Output of the <code>GetSessionEndpoint</code> operation.
///
/// @nodoc
class GetSessionEndpointOutput {
  /// The Spark Connect endpoint URL to use in the PySpark client.
  final String endpoint;

  /// A time-limited authentication token used to connect to the Spark Connect
  /// endpoint.
  final String? authToken;

  /// The time at which the authentication token expires. After this time, call
  /// <code>GetSessionEndpoint</code> again to obtain a new token.
  final DateTime? authTokenExpirationTime;

  /// Username and password used to authenticate with the Spark Connect server
  /// when connecting directly over VPC peering.
  final Credentials? credentials;

  GetSessionEndpointOutput({
    required this.endpoint,
    this.authToken,
    this.authTokenExpirationTime,
    this.credentials,
  });

  factory GetSessionEndpointOutput.fromJson(Map<String, dynamic> json) {
    return GetSessionEndpointOutput(
      endpoint: (json['Endpoint'] as String?) ?? '',
      authToken: json['AuthToken'] as String?,
      authTokenExpirationTime:
          timeStampFromJson(json['AuthTokenExpirationTime']),
      credentials: json['Credentials'] != null
          ? Credentials.fromJson(json['Credentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final authToken = this.authToken;
    final authTokenExpirationTime = this.authTokenExpirationTime;
    final credentials = this.credentials;
    return {
      'Endpoint': endpoint,
      if (authToken != null) 'AuthToken': authToken,
      if (authTokenExpirationTime != null)
        'AuthTokenExpirationTime': unixTimestampToJson(authTokenExpirationTime),
      if (credentials != null) 'Credentials': credentials,
    };
  }
}

/// @nodoc
class GetStudioSessionMappingOutput {
  /// The session mapping details for the specified Amazon EMR Studio and
  /// identity, including session policy ARN and creation time.
  final SessionMappingDetail? sessionMapping;

  GetStudioSessionMappingOutput({
    this.sessionMapping,
  });

  factory GetStudioSessionMappingOutput.fromJson(Map<String, dynamic> json) {
    return GetStudioSessionMappingOutput(
      sessionMapping: json['SessionMapping'] != null
          ? SessionMappingDetail.fromJson(
              json['SessionMapping'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionMapping = this.sessionMapping;
    return {
      if (sessionMapping != null) 'SessionMapping': sessionMapping,
    };
  }
}

/// This output contains the bootstrap actions detail.
///
/// @nodoc
class ListBootstrapActionsOutput {
  /// The bootstrap actions associated with the cluster.
  final List<Command>? bootstrapActions;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  ListBootstrapActionsOutput({
    this.bootstrapActions,
    this.marker,
  });

  factory ListBootstrapActionsOutput.fromJson(Map<String, dynamic> json) {
    return ListBootstrapActionsOutput(
      bootstrapActions: (json['BootstrapActions'] as List?)
          ?.nonNulls
          .map((e) => Command.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bootstrapActions = this.bootstrapActions;
    final marker = this.marker;
    return {
      if (bootstrapActions != null) 'BootstrapActions': bootstrapActions,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This contains a ClusterSummaryList with the cluster details; for example,
/// the cluster IDs, names, and status.
///
/// @nodoc
class ListClustersOutput {
  /// The list of clusters for the account based on the given filters.
  final List<ClusterSummary>? clusters;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  ListClustersOutput({
    this.clusters,
    this.marker,
  });

  factory ListClustersOutput.fromJson(Map<String, dynamic> json) {
    return ListClustersOutput(
      clusters: (json['Clusters'] as List?)
          ?.nonNulls
          .map((e) => ClusterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusters = this.clusters;
    final marker = this.marker;
    return {
      if (clusters != null) 'Clusters': clusters,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class ListInstanceFleetsOutput {
  /// The list of instance fleets for the cluster and given filters.
  final List<InstanceFleet>? instanceFleets;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  ListInstanceFleetsOutput({
    this.instanceFleets,
    this.marker,
  });

  factory ListInstanceFleetsOutput.fromJson(Map<String, dynamic> json) {
    return ListInstanceFleetsOutput(
      instanceFleets: (json['InstanceFleets'] as List?)
          ?.nonNulls
          .map((e) => InstanceFleet.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceFleets = this.instanceFleets;
    final marker = this.marker;
    return {
      if (instanceFleets != null) 'InstanceFleets': instanceFleets,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This input determines which instance groups to retrieve.
///
/// @nodoc
class ListInstanceGroupsOutput {
  /// The list of instance groups for the cluster and given filters.
  final List<InstanceGroup>? instanceGroups;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  ListInstanceGroupsOutput({
    this.instanceGroups,
    this.marker,
  });

  factory ListInstanceGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListInstanceGroupsOutput(
      instanceGroups: (json['InstanceGroups'] as List?)
          ?.nonNulls
          .map((e) => InstanceGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceGroups = this.instanceGroups;
    final marker = this.marker;
    return {
      if (instanceGroups != null) 'InstanceGroups': instanceGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// This output contains the list of instances.
///
/// @nodoc
class ListInstancesOutput {
  /// The list of instances for the cluster and given filters.
  final List<Instance>? instances;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  ListInstancesOutput({
    this.instances,
    this.marker,
  });

  factory ListInstancesOutput.fromJson(Map<String, dynamic> json) {
    return ListInstancesOutput(
      instances: (json['Instances'] as List?)
          ?.nonNulls
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final marker = this.marker;
    return {
      if (instances != null) 'Instances': instances,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// @nodoc
class ListNotebookExecutionsOutput {
  /// A pagination token that a subsequent <code>ListNotebookExecutions</code> can
  /// use to determine the next set of results to retrieve.
  final String? marker;

  /// A list of notebook executions.
  final List<NotebookExecutionSummary>? notebookExecutions;

  ListNotebookExecutionsOutput({
    this.marker,
    this.notebookExecutions,
  });

  factory ListNotebookExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListNotebookExecutionsOutput(
      marker: json['Marker'] as String?,
      notebookExecutions: (json['NotebookExecutions'] as List?)
          ?.nonNulls
          .map((e) =>
              NotebookExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final notebookExecutions = this.notebookExecutions;
    return {
      if (marker != null) 'Marker': marker,
      if (notebookExecutions != null) 'NotebookExecutions': notebookExecutions,
    };
  }
}

/// @nodoc
class ListReleaseLabelsOutput {
  /// Used to paginate the next page of results if specified in the next
  /// <code>ListReleaseLabels</code> request.
  final String? nextToken;

  /// The returned release labels.
  final List<String>? releaseLabels;

  ListReleaseLabelsOutput({
    this.nextToken,
    this.releaseLabels,
  });

  factory ListReleaseLabelsOutput.fromJson(Map<String, dynamic> json) {
    return ListReleaseLabelsOutput(
      nextToken: json['NextToken'] as String?,
      releaseLabels: (json['ReleaseLabels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final releaseLabels = this.releaseLabels;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (releaseLabels != null) 'ReleaseLabels': releaseLabels,
    };
  }
}

/// @nodoc
class ListSecurityConfigurationsOutput {
  /// A pagination token that indicates the next set of results to retrieve.
  /// Include the marker in the next ListSecurityConfiguration call to retrieve
  /// the next page of results, if required.
  final String? marker;

  /// The creation date and time, and name, of each security configuration.
  final List<SecurityConfigurationSummary>? securityConfigurations;

  ListSecurityConfigurationsOutput({
    this.marker,
    this.securityConfigurations,
  });

  factory ListSecurityConfigurationsOutput.fromJson(Map<String, dynamic> json) {
    return ListSecurityConfigurationsOutput(
      marker: json['Marker'] as String?,
      securityConfigurations: (json['SecurityConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              SecurityConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final securityConfigurations = this.securityConfigurations;
    return {
      if (marker != null) 'Marker': marker,
      if (securityConfigurations != null)
        'SecurityConfigurations': securityConfigurations,
    };
  }
}

/// Output of the <code>ListSessions</code> operation.
///
/// @nodoc
class ListSessionsOutput {
  /// The pagination token to use in a subsequent <code>ListSessions</code> call
  /// to retrieve the next page of results. This field is absent when there are no
  /// more results.
  final String? nextToken;

  /// The sessions that match the request.
  final List<Session>? sessions;

  ListSessionsOutput({
    this.nextToken,
    this.sessions,
  });

  factory ListSessionsOutput.fromJson(Map<String, dynamic> json) {
    return ListSessionsOutput(
      nextToken: json['NextToken'] as String?,
      sessions: (json['Sessions'] as List?)
          ?.nonNulls
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sessions != null) 'Sessions': sessions,
    };
  }
}

/// This output contains the list of steps returned in reverse order. This means
/// that the last step is the first element in the list.
///
/// @nodoc
class ListStepsOutput {
  /// The maximum number of steps that a single <code>ListSteps</code> action
  /// returns is 50. To return a longer list of steps, use multiple
  /// <code>ListSteps</code> actions along with the <code>Marker</code> parameter,
  /// which is a pagination token that indicates the next set of results to
  /// retrieve.
  final String? marker;

  /// The filtered list of steps for the cluster.
  final List<StepSummary>? steps;

  ListStepsOutput({
    this.marker,
    this.steps,
  });

  factory ListStepsOutput.fromJson(Map<String, dynamic> json) {
    return ListStepsOutput(
      marker: json['Marker'] as String?,
      steps: (json['Steps'] as List?)
          ?.nonNulls
          .map((e) => StepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final steps = this.steps;
    return {
      if (marker != null) 'Marker': marker,
      if (steps != null) 'Steps': steps,
    };
  }
}

/// @nodoc
class ListStudiosOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  /// The list of Studio summary objects.
  final List<StudioSummary>? studios;

  ListStudiosOutput({
    this.marker,
    this.studios,
  });

  factory ListStudiosOutput.fromJson(Map<String, dynamic> json) {
    return ListStudiosOutput(
      marker: json['Marker'] as String?,
      studios: (json['Studios'] as List?)
          ?.nonNulls
          .map((e) => StudioSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final studios = this.studios;
    return {
      if (marker != null) 'Marker': marker,
      if (studios != null) 'Studios': studios,
    };
  }
}

/// @nodoc
class ListStudioSessionMappingsOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? marker;

  /// A list of session mapping summary objects. Each object includes session
  /// mapping details such as creation time, identity type (user or group), and
  /// Amazon EMR Studio ID.
  final List<SessionMappingSummary>? sessionMappings;

  ListStudioSessionMappingsOutput({
    this.marker,
    this.sessionMappings,
  });

  factory ListStudioSessionMappingsOutput.fromJson(Map<String, dynamic> json) {
    return ListStudioSessionMappingsOutput(
      marker: json['Marker'] as String?,
      sessionMappings: (json['SessionMappings'] as List?)
          ?.nonNulls
          .map((e) => SessionMappingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final sessionMappings = this.sessionMappings;
    return {
      if (marker != null) 'Marker': marker,
      if (sessionMappings != null) 'SessionMappings': sessionMappings,
    };
  }
}

/// @nodoc
class ListSupportedInstanceTypesOutput {
  /// The pagination token that marks the next set of results to retrieve.
  final String? marker;

  /// The list of instance types that the release specified in
  /// <code>ListSupportedInstanceTypesInput$ReleaseLabel</code> supports, filtered
  /// by Amazon Web Services Region.
  final List<SupportedInstanceType>? supportedInstanceTypes;

  ListSupportedInstanceTypesOutput({
    this.marker,
    this.supportedInstanceTypes,
  });

  factory ListSupportedInstanceTypesOutput.fromJson(Map<String, dynamic> json) {
    return ListSupportedInstanceTypesOutput(
      marker: json['Marker'] as String?,
      supportedInstanceTypes: (json['SupportedInstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => SupportedInstanceType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final supportedInstanceTypes = this.supportedInstanceTypes;
    return {
      if (marker != null) 'Marker': marker,
      if (supportedInstanceTypes != null)
        'SupportedInstanceTypes': supportedInstanceTypes,
    };
  }
}

/// @nodoc
class ModifyClusterOutput {
  /// Reserved.
  final bool? extendedSupport;

  /// The number of steps that can be executed concurrently.
  final int? stepConcurrencyLevel;

  ModifyClusterOutput({
    this.extendedSupport,
    this.stepConcurrencyLevel,
  });

  factory ModifyClusterOutput.fromJson(Map<String, dynamic> json) {
    return ModifyClusterOutput(
      extendedSupport: json['ExtendedSupport'] as bool?,
      stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final extendedSupport = this.extendedSupport;
    final stepConcurrencyLevel = this.stepConcurrencyLevel;
    return {
      if (extendedSupport != null) 'ExtendedSupport': extendedSupport,
      if (stepConcurrencyLevel != null)
        'StepConcurrencyLevel': stepConcurrencyLevel,
    };
  }
}

/// @nodoc
class PutAutoScalingPolicyOutput {
  /// The automatic scaling policy definition.
  final AutoScalingPolicyDescription? autoScalingPolicy;

  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  final String? clusterId;

  /// Specifies the ID of the instance group to which the scaling policy is
  /// applied.
  final String? instanceGroupId;

  PutAutoScalingPolicyOutput({
    this.autoScalingPolicy,
    this.clusterArn,
    this.clusterId,
    this.instanceGroupId,
  });

  factory PutAutoScalingPolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutAutoScalingPolicyOutput(
      autoScalingPolicy: json['AutoScalingPolicy'] != null
          ? AutoScalingPolicyDescription.fromJson(
              json['AutoScalingPolicy'] as Map<String, dynamic>)
          : null,
      clusterArn: json['ClusterArn'] as String?,
      clusterId: json['ClusterId'] as String?,
      instanceGroupId: json['InstanceGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingPolicy = this.autoScalingPolicy;
    final clusterArn = this.clusterArn;
    final clusterId = this.clusterId;
    final instanceGroupId = this.instanceGroupId;
    return {
      if (autoScalingPolicy != null) 'AutoScalingPolicy': autoScalingPolicy,
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (clusterId != null) 'ClusterId': clusterId,
      if (instanceGroupId != null) 'InstanceGroupId': instanceGroupId,
    };
  }
}

/// @nodoc
class PutAutoTerminationPolicyOutput {
  PutAutoTerminationPolicyOutput();

  factory PutAutoTerminationPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutAutoTerminationPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PutBlockPublicAccessConfigurationOutput {
  PutBlockPublicAccessConfigurationOutput();

  factory PutBlockPublicAccessConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return PutBlockPublicAccessConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PutManagedScalingPolicyOutput {
  PutManagedScalingPolicyOutput();

  factory PutManagedScalingPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutManagedScalingPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RemoveAutoScalingPolicyOutput {
  RemoveAutoScalingPolicyOutput();

  factory RemoveAutoScalingPolicyOutput.fromJson(Map<String, dynamic> _) {
    return RemoveAutoScalingPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RemoveAutoTerminationPolicyOutput {
  RemoveAutoTerminationPolicyOutput();

  factory RemoveAutoTerminationPolicyOutput.fromJson(Map<String, dynamic> _) {
    return RemoveAutoTerminationPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class RemoveManagedScalingPolicyOutput {
  RemoveManagedScalingPolicyOutput();

  factory RemoveManagedScalingPolicyOutput.fromJson(Map<String, dynamic> _) {
    return RemoveManagedScalingPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This output indicates the result of removing tags from the resource.
///
/// @nodoc
class RemoveTagsOutput {
  RemoveTagsOutput();

  factory RemoveTagsOutput.fromJson(Map<String, dynamic> _) {
    return RemoveTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The result of the <a>RunJobFlow</a> operation.
///
/// @nodoc
class RunJobFlowOutput {
  /// The Amazon Resource Name (ARN) of the cluster.
  final String? clusterArn;

  /// A unique identifier for the job flow.
  final String? jobFlowId;

  RunJobFlowOutput({
    this.clusterArn,
    this.jobFlowId,
  });

  factory RunJobFlowOutput.fromJson(Map<String, dynamic> json) {
    return RunJobFlowOutput(
      clusterArn: json['ClusterArn'] as String?,
      jobFlowId: json['JobFlowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final jobFlowId = this.jobFlowId;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (jobFlowId != null) 'JobFlowId': jobFlowId,
    };
  }
}

/// @nodoc
class StartNotebookExecutionOutput {
  /// The unique identifier of the notebook execution.
  final String? notebookExecutionId;

  StartNotebookExecutionOutput({
    this.notebookExecutionId,
  });

  factory StartNotebookExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StartNotebookExecutionOutput(
      notebookExecutionId: json['NotebookExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final notebookExecutionId = this.notebookExecutionId;
    return {
      if (notebookExecutionId != null)
        'NotebookExecutionId': notebookExecutionId,
    };
  }
}

/// Output of the <code>StartSession</code> operation.
///
/// @nodoc
class StartSessionOutput {
  /// The output contains the ID of the session.
  final String id;

  /// The Amazon Web Services account ID that owns the session.
  final String? accountId;

  /// The output contains the ARN of the session.
  final String? arn;

  /// The ID of the cluster that the session was started on.
  final String? clusterId;

  /// The state of the session at the time the request returned. When a session is
  /// first created, it enters the <code>SUBMITTED</code> state.
  final SessionState? state;

  StartSessionOutput({
    required this.id,
    this.accountId,
    this.arn,
    this.clusterId,
    this.state,
  });

  factory StartSessionOutput.fromJson(Map<String, dynamic> json) {
    return StartSessionOutput(
      id: (json['Id'] as String?) ?? '',
      accountId: json['AccountId'] as String?,
      arn: json['Arn'] as String?,
      clusterId: json['ClusterId'] as String?,
      state: (json['State'] as String?)?.let(SessionState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accountId = this.accountId;
    final arn = this.arn;
    final clusterId = this.clusterId;
    final state = this.state;
    return {
      'Id': id,
      if (accountId != null) 'AccountId': accountId,
      if (arn != null) 'Arn': arn,
      if (clusterId != null) 'ClusterId': clusterId,
      if (state != null) 'State': state.value,
    };
  }
}

/// Output of the <code>TerminateSession</code> operation.
///
/// @nodoc
class TerminateSessionOutput {
  /// The ID of the cluster that the session belonged to.
  final String clusterId;

  /// The ID of the terminated session.
  final String sessionId;

  /// The state of the session after the terminate request has been accepted.
  final SessionState state;

  TerminateSessionOutput({
    required this.clusterId,
    required this.sessionId,
    required this.state,
  });

  factory TerminateSessionOutput.fromJson(Map<String, dynamic> json) {
    return TerminateSessionOutput(
      clusterId: (json['ClusterId'] as String?) ?? '',
      sessionId: (json['SessionId'] as String?) ?? '',
      state: SessionState.fromString((json['State'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterId = this.clusterId;
    final sessionId = this.sessionId;
    final state = this.state;
    return {
      'ClusterId': clusterId,
      'SessionId': sessionId,
      'State': state.value,
    };
  }
}

/// @nodoc
class IdentityType {
  static const user = IdentityType._('USER');
  static const group = IdentityType._('GROUP');

  final String value;

  const IdentityType._(this.value);

  static const values = [user, group];

  static IdentityType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IdentityType._(value));

  @override
  bool operator ==(other) => other is IdentityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SessionState {
  static const submitted = SessionState._('SUBMITTED');
  static const starting = SessionState._('STARTING');
  static const started = SessionState._('STARTED');
  static const idle = SessionState._('IDLE');
  static const busy = SessionState._('BUSY');
  static const terminating = SessionState._('TERMINATING');
  static const terminated = SessionState._('TERMINATED');
  static const failed = SessionState._('FAILED');

  final String value;

  const SessionState._(this.value);

  static const values = [
    submitted,
    starting,
    started,
    idle,
    busy,
    terminating,
    terminated,
    failed
  ];

  static SessionState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SessionState._(value));

  @override
  bool operator ==(other) => other is SessionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The monitoring configuration for a session. Controls where session logs are
/// published.
///
/// @nodoc
class SessionMonitoringConfiguration {
  /// The CloudWatch Logs configuration for the session.
  final SessionCloudWatchLoggingConfiguration? cloudWatchLoggingConfiguration;

  /// The Amazon EMR-managed logging configuration for the session.
  final SessionManagedLoggingConfiguration? managedLoggingConfiguration;

  /// The Amazon S3 logging configuration for the session.
  final SessionS3LoggingConfiguration? s3LoggingConfiguration;

  SessionMonitoringConfiguration({
    this.cloudWatchLoggingConfiguration,
    this.managedLoggingConfiguration,
    this.s3LoggingConfiguration,
  });

  factory SessionMonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return SessionMonitoringConfiguration(
      cloudWatchLoggingConfiguration: json['CloudWatchLoggingConfiguration'] !=
              null
          ? SessionCloudWatchLoggingConfiguration.fromJson(
              json['CloudWatchLoggingConfiguration'] as Map<String, dynamic>)
          : null,
      managedLoggingConfiguration: json['ManagedLoggingConfiguration'] != null
          ? SessionManagedLoggingConfiguration.fromJson(
              json['ManagedLoggingConfiguration'] as Map<String, dynamic>)
          : null,
      s3LoggingConfiguration: json['S3LoggingConfiguration'] != null
          ? SessionS3LoggingConfiguration.fromJson(
              json['S3LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLoggingConfiguration = this.cloudWatchLoggingConfiguration;
    final managedLoggingConfiguration = this.managedLoggingConfiguration;
    final s3LoggingConfiguration = this.s3LoggingConfiguration;
    return {
      if (cloudWatchLoggingConfiguration != null)
        'CloudWatchLoggingConfiguration': cloudWatchLoggingConfiguration,
      if (managedLoggingConfiguration != null)
        'ManagedLoggingConfiguration': managedLoggingConfiguration,
      if (s3LoggingConfiguration != null)
        'S3LoggingConfiguration': s3LoggingConfiguration,
    };
  }
}

/// A key-value pair containing user-defined metadata that you can associate
/// with an Amazon EMR resource. Tags make it easier to associate clusters in
/// various ways, such as grouping clusters to track your Amazon EMR resource
/// allocation costs. For more information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
/// Clusters</a>.
///
/// @nodoc
class Tag {
  /// A user-defined key, which is the minimum required information for a valid
  /// tag. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag</a>.
  final String? key;

  /// A user-defined value, which is optional in a tag. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// Clusters</a>.
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

/// The CloudWatch Logs configuration for a session.
///
/// @nodoc
class SessionCloudWatchLoggingConfiguration {
  /// Whether CloudWatch Logs is enabled for the session.
  final bool? enabled;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the logs
  /// published to CloudWatch Logs.
  final String? encryptionKeyArn;

  /// The name of the log group where session logs are published.
  final String? logGroup;

  /// The prefix applied to the log stream name where session logs are published.
  final String? logStreamNamePrefix;

  /// A map of log component names (for example, <code>SPARK_DRIVER</code>,
  /// <code>SPARK_EXECUTOR</code>) to the list of log types to publish for that
  /// component (for example, <code>stdout</code>, <code>stderr</code>).
  final Map<String, List<String>>? logTypes;

  SessionCloudWatchLoggingConfiguration({
    this.enabled,
    this.encryptionKeyArn,
    this.logGroup,
    this.logStreamNamePrefix,
    this.logTypes,
  });

  factory SessionCloudWatchLoggingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SessionCloudWatchLoggingConfiguration(
      enabled: json['Enabled'] as bool?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      logGroup: json['LogGroup'] as String?,
      logStreamNamePrefix: json['LogStreamNamePrefix'] as String?,
      logTypes: (json['LogTypes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    final logGroup = this.logGroup;
    final logStreamNamePrefix = this.logStreamNamePrefix;
    final logTypes = this.logTypes;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (logGroup != null) 'LogGroup': logGroup,
      if (logStreamNamePrefix != null)
        'LogStreamNamePrefix': logStreamNamePrefix,
      if (logTypes != null) 'LogTypes': logTypes,
    };
  }
}

/// The Amazon EMR-managed logging configuration for a session.
///
/// @nodoc
class SessionManagedLoggingConfiguration {
  /// Whether Amazon EMR-managed logging is enabled for the session.
  final bool? enabled;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the managed
  /// logs.
  final String? encryptionKeyArn;

  SessionManagedLoggingConfiguration({
    this.enabled,
    this.encryptionKeyArn,
  });

  factory SessionManagedLoggingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SessionManagedLoggingConfiguration(
      enabled: json['Enabled'] as bool?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
    };
  }
}

/// The Amazon S3 logging configuration for a session.
///
/// @nodoc
class SessionS3LoggingConfiguration {
  /// Whether Amazon S3 logging is enabled for the session.
  final bool? enabled;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt logs published
  /// to Amazon S3.
  final String? encryptionKeyArn;

  /// A map of log component names (for example, <code>SPARK_DRIVER</code>,
  /// <code>SPARK_EXECUTOR</code>) to the list of log types to publish for that
  /// component (for example, <code>stdout</code>, <code>stderr</code>).
  final Map<String, List<String>>? logTypes;

  /// The Amazon S3 destination URI where session logs are published.
  final String? logUri;

  SessionS3LoggingConfiguration({
    this.enabled,
    this.encryptionKeyArn,
    this.logTypes,
    this.logUri,
  });

  factory SessionS3LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return SessionS3LoggingConfiguration(
      enabled: json['Enabled'] as bool?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      logTypes: (json['LogTypes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
      logUri: json['LogUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    final logTypes = this.logTypes;
    final logUri = this.logUri;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (logTypes != null) 'LogTypes': logTypes,
      if (logUri != null) 'LogUri': logUri,
    };
  }
}

/// <note>
/// Amazon EMR releases 4.x or later.
/// </note>
/// An optional configuration specification to be used when provisioning cluster
/// instances, which can include configurations for applications and software
/// bundled with Amazon EMR. A configuration consists of a classification,
/// properties, and optional nested configurations. A classification refers to
/// an application-specific configuration file. Properties are the settings you
/// want to change in that file. For more information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html">Configuring
/// Applications</a>.
///
/// @nodoc
class Configuration {
  /// The classification within a configuration.
  final String? classification;

  /// A list of additional configurations to apply within a configuration object.
  final List<Configuration>? configurations;

  /// A set of properties specified within a configuration classification.
  final Map<String, String>? properties;

  Configuration({
    this.classification,
    this.configurations,
    this.properties,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      classification: json['Classification'] as String?,
      configurations: (json['Configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['Properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final configurations = this.configurations;
    final properties = this.properties;
    return {
      if (classification != null) 'Classification': classification,
      if (configurations != null) 'Configurations': configurations,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// Specifies the execution engine (cluster) to run the notebook and perform the
/// notebook execution, for example, an Amazon EMR cluster.
///
/// @nodoc
class ExecutionEngineConfig {
  /// The unique identifier of the execution engine. For an Amazon EMR cluster,
  /// this is the cluster ID.
  final String id;

  /// The execution role ARN required for the notebook execution.
  final String? executionRoleArn;

  /// An optional unique ID of an Amazon EC2 security group to associate with the
  /// master instance of the Amazon EMR cluster for this notebook execution. For
  /// more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html">Specifying
  /// Amazon EC2 Security Groups for Amazon EMR Notebooks</a> in the <i>EMR
  /// Management Guide</i>.
  final String? masterInstanceSecurityGroupId;

  /// The type of execution engine. A value of <code>EMR</code> specifies an
  /// Amazon EMR cluster.
  final ExecutionEngineType? type;

  ExecutionEngineConfig({
    required this.id,
    this.executionRoleArn,
    this.masterInstanceSecurityGroupId,
    this.type,
  });

  factory ExecutionEngineConfig.fromJson(Map<String, dynamic> json) {
    return ExecutionEngineConfig(
      id: (json['Id'] as String?) ?? '',
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      masterInstanceSecurityGroupId:
          json['MasterInstanceSecurityGroupId'] as String?,
      type: (json['Type'] as String?)?.let(ExecutionEngineType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final executionRoleArn = this.executionRoleArn;
    final masterInstanceSecurityGroupId = this.masterInstanceSecurityGroupId;
    final type = this.type;
    return {
      'Id': id,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (masterInstanceSecurityGroupId != null)
        'MasterInstanceSecurityGroupId': masterInstanceSecurityGroupId,
      if (type != null) 'Type': type.value,
    };
  }
}

/// The Amazon S3 location that stores the notebook execution input.
///
/// @nodoc
class NotebookS3LocationFromInput {
  /// The Amazon S3 bucket that stores the notebook execution input.
  final String? bucket;

  /// The key to the Amazon S3 location that stores the notebook execution input.
  final String? key;

  NotebookS3LocationFromInput({
    this.bucket,
    this.key,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

/// The Amazon S3 location that stores the notebook execution output.
///
/// @nodoc
class OutputNotebookS3LocationFromInput {
  /// The Amazon S3 bucket that stores the notebook execution output.
  final String? bucket;

  /// The key to the Amazon S3 location that stores the notebook execution output.
  final String? key;

  OutputNotebookS3LocationFromInput({
    this.bucket,
    this.key,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

/// @nodoc
class OutputNotebookFormat {
  static const html = OutputNotebookFormat._('HTML');

  final String value;

  const OutputNotebookFormat._(this.value);

  static const values = [html];

  static OutputNotebookFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OutputNotebookFormat._(value));

  @override
  bool operator ==(other) =>
      other is OutputNotebookFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExecutionEngineType {
  static const emr = ExecutionEngineType._('EMR');

  final String value;

  const ExecutionEngineType._(this.value);

  static const values = [emr];

  static ExecutionEngineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionEngineType._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionEngineType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A description of the Amazon EC2 instance on which the cluster (job flow)
/// runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or
/// InstanceFleets. They cannot be used together. You may also have
/// MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must be
/// present), but we don't recommend this configuration.
///
/// @nodoc
class JobFlowInstancesConfig {
  /// A list of additional Amazon EC2 security group IDs for the master node.
  final List<String>? additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  final List<String>? additionalSlaveSecurityGroups;

  /// The name of the Amazon EC2 key pair that can be used to connect to the
  /// master node using SSH as the user called "hadoop."
  final String? ec2KeyName;

  /// Applies to clusters that use the uniform instance group configuration. To
  /// launch the cluster in Amazon Virtual Private Cloud (Amazon VPC), set this
  /// parameter to the identifier of the Amazon VPC subnet where you want the
  /// cluster to launch. If you do not specify this value and your account
  /// supports EC2-Classic, the cluster launches in EC2-Classic.
  final String? ec2SubnetId;

  /// Applies to clusters that use the instance fleet configuration. When multiple
  /// Amazon EC2 subnet IDs are specified, Amazon EMR evaluates them and launches
  /// instances in the optimal subnet.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  final List<String>? ec2SubnetIds;

  /// The identifier of the Amazon EC2 security group for the master node. If you
  /// specify <code>EmrManagedMasterSecurityGroup</code>, you must also specify
  /// <code>EmrManagedSlaveSecurityGroup</code>.
  final String? emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task nodes.
  /// If you specify <code>EmrManagedSlaveSecurityGroup</code>, you must also
  /// specify <code>EmrManagedMasterSecurityGroup</code>.
  final String? emrManagedSlaveSecurityGroup;

  /// Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop
  /// version for the cluster. Valid inputs are "0.18" (no longer maintained),
  /// "0.20" (no longer maintained), "0.20.205" (no longer maintained), "1.0.3",
  /// "2.2.0", or "2.4.0". If you do not set this value, the default of 0.18 is
  /// used, unless the <code>AmiVersion</code> parameter is set in the RunJobFlow
  /// call, in which case the default version of Hadoop for that AMI version is
  /// used.
  final String? hadoopVersion;

  /// The number of Amazon EC2 instances in the cluster.
  final int? instanceCount;

  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  /// Describes the Amazon EC2 instances and instance configurations for clusters
  /// that use the instance fleet configuration.
  final List<InstanceFleetConfig>? instanceFleets;

  /// Configuration for the instance groups in a cluster.
  final List<InstanceGroupConfig>? instanceGroups;

  /// Specifies whether the cluster should remain available after completing all
  /// steps. Defaults to <code>false</code>. For more information about
  /// configuring cluster termination, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html">Control
  /// Cluster Termination</a> in the <i>EMR Management Guide</i>.
  final bool? keepJobFlowAliveWhenNoSteps;

  /// The Amazon EC2 instance type of the master node.
  final String? masterInstanceType;

  /// The Availability Zone in which the cluster runs.
  final PlacementType? placement;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  final String? serviceAccessSecurityGroup;

  /// The Amazon EC2 instance type of the core and task nodes.
  final String? slaveInstanceType;

  /// Specifies whether to lock the cluster to prevent the Amazon EC2 instances
  /// from being terminated by API call, user intervention, or in the event of a
  /// job-flow error.
  final bool? terminationProtected;

  /// Indicates whether Amazon EMR should gracefully replace core nodes that have
  /// degraded within the cluster.
  final bool? unhealthyNodeReplacement;

  JobFlowInstancesConfig({
    this.additionalMasterSecurityGroups,
    this.additionalSlaveSecurityGroups,
    this.ec2KeyName,
    this.ec2SubnetId,
    this.ec2SubnetIds,
    this.emrManagedMasterSecurityGroup,
    this.emrManagedSlaveSecurityGroup,
    this.hadoopVersion,
    this.instanceCount,
    this.instanceFleets,
    this.instanceGroups,
    this.keepJobFlowAliveWhenNoSteps,
    this.masterInstanceType,
    this.placement,
    this.serviceAccessSecurityGroup,
    this.slaveInstanceType,
    this.terminationProtected,
    this.unhealthyNodeReplacement,
  });

  Map<String, dynamic> toJson() {
    final additionalMasterSecurityGroups = this.additionalMasterSecurityGroups;
    final additionalSlaveSecurityGroups = this.additionalSlaveSecurityGroups;
    final ec2KeyName = this.ec2KeyName;
    final ec2SubnetId = this.ec2SubnetId;
    final ec2SubnetIds = this.ec2SubnetIds;
    final emrManagedMasterSecurityGroup = this.emrManagedMasterSecurityGroup;
    final emrManagedSlaveSecurityGroup = this.emrManagedSlaveSecurityGroup;
    final hadoopVersion = this.hadoopVersion;
    final instanceCount = this.instanceCount;
    final instanceFleets = this.instanceFleets;
    final instanceGroups = this.instanceGroups;
    final keepJobFlowAliveWhenNoSteps = this.keepJobFlowAliveWhenNoSteps;
    final masterInstanceType = this.masterInstanceType;
    final placement = this.placement;
    final serviceAccessSecurityGroup = this.serviceAccessSecurityGroup;
    final slaveInstanceType = this.slaveInstanceType;
    final terminationProtected = this.terminationProtected;
    final unhealthyNodeReplacement = this.unhealthyNodeReplacement;
    return {
      if (additionalMasterSecurityGroups != null)
        'AdditionalMasterSecurityGroups': additionalMasterSecurityGroups,
      if (additionalSlaveSecurityGroups != null)
        'AdditionalSlaveSecurityGroups': additionalSlaveSecurityGroups,
      if (ec2KeyName != null) 'Ec2KeyName': ec2KeyName,
      if (ec2SubnetId != null) 'Ec2SubnetId': ec2SubnetId,
      if (ec2SubnetIds != null) 'Ec2SubnetIds': ec2SubnetIds,
      if (emrManagedMasterSecurityGroup != null)
        'EmrManagedMasterSecurityGroup': emrManagedMasterSecurityGroup,
      if (emrManagedSlaveSecurityGroup != null)
        'EmrManagedSlaveSecurityGroup': emrManagedSlaveSecurityGroup,
      if (hadoopVersion != null) 'HadoopVersion': hadoopVersion,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (instanceFleets != null) 'InstanceFleets': instanceFleets,
      if (instanceGroups != null) 'InstanceGroups': instanceGroups,
      if (keepJobFlowAliveWhenNoSteps != null)
        'KeepJobFlowAliveWhenNoSteps': keepJobFlowAliveWhenNoSteps,
      if (masterInstanceType != null) 'MasterInstanceType': masterInstanceType,
      if (placement != null) 'Placement': placement,
      if (serviceAccessSecurityGroup != null)
        'ServiceAccessSecurityGroup': serviceAccessSecurityGroup,
      if (slaveInstanceType != null) 'SlaveInstanceType': slaveInstanceType,
      if (terminationProtected != null)
        'TerminationProtected': terminationProtected,
      if (unhealthyNodeReplacement != null)
        'UnhealthyNodeReplacement': unhealthyNodeReplacement,
    };
  }
}

/// @nodoc
class ScaleDownBehavior {
  static const terminateAtInstanceHour =
      ScaleDownBehavior._('TERMINATE_AT_INSTANCE_HOUR');
  static const terminateAtTaskCompletion =
      ScaleDownBehavior._('TERMINATE_AT_TASK_COMPLETION');

  final String value;

  const ScaleDownBehavior._(this.value);

  static const values = [terminateAtInstanceHour, terminateAtTaskCompletion];

  static ScaleDownBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScaleDownBehavior._(value));

  @override
  bool operator ==(other) => other is ScaleDownBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RepoUpgradeOnBoot {
  static const security = RepoUpgradeOnBoot._('SECURITY');
  static const none = RepoUpgradeOnBoot._('NONE');

  final String value;

  const RepoUpgradeOnBoot._(this.value);

  static const values = [security, none];

  static RepoUpgradeOnBoot fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RepoUpgradeOnBoot._(value));

  @override
  bool operator ==(other) => other is RepoUpgradeOnBoot && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Attributes for Kerberos configuration when Kerberos authentication is
/// enabled using a security configuration. For more information see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
/// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
///
/// @nodoc
class KerberosAttributes {
  /// The password used within the cluster for the kadmin service on the
  /// cluster-dedicated KDC, which maintains Kerberos principals, password
  /// policies, and keytabs for the cluster.
  final String kdcAdminPassword;

  /// The name of the Kerberos realm to which all nodes in a cluster belong. For
  /// example, <code>EC2.INTERNAL</code>.
  final String realm;

  /// The Active Directory password for <code>ADDomainJoinUser</code>.
  final String? aDDomainJoinPassword;

  /// Required only when establishing a cross-realm trust with an Active Directory
  /// domain. A user with sufficient privileges to join resources to the domain.
  final String? aDDomainJoinUser;

  /// Required only when establishing a cross-realm trust with a KDC in a
  /// different realm. The cross-realm principal password, which must be identical
  /// across realms.
  final String? crossRealmTrustPrincipalPassword;

  KerberosAttributes({
    required this.kdcAdminPassword,
    required this.realm,
    this.aDDomainJoinPassword,
    this.aDDomainJoinUser,
    this.crossRealmTrustPrincipalPassword,
  });

  factory KerberosAttributes.fromJson(Map<String, dynamic> json) {
    return KerberosAttributes(
      kdcAdminPassword: (json['KdcAdminPassword'] as String?) ?? '',
      realm: (json['Realm'] as String?) ?? '',
      aDDomainJoinPassword: json['ADDomainJoinPassword'] as String?,
      aDDomainJoinUser: json['ADDomainJoinUser'] as String?,
      crossRealmTrustPrincipalPassword:
          json['CrossRealmTrustPrincipalPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kdcAdminPassword = this.kdcAdminPassword;
    final realm = this.realm;
    final aDDomainJoinPassword = this.aDDomainJoinPassword;
    final aDDomainJoinUser = this.aDDomainJoinUser;
    final crossRealmTrustPrincipalPassword =
        this.crossRealmTrustPrincipalPassword;
    return {
      'KdcAdminPassword': kdcAdminPassword,
      'Realm': realm,
      if (aDDomainJoinPassword != null)
        'ADDomainJoinPassword': aDDomainJoinPassword,
      if (aDDomainJoinUser != null) 'ADDomainJoinUser': aDDomainJoinUser,
      if (crossRealmTrustPrincipalPassword != null)
        'CrossRealmTrustPrincipalPassword': crossRealmTrustPrincipalPassword,
    };
  }
}

/// Managed scaling policy for an Amazon EMR cluster. The policy specifies the
/// limits for resources that can be added or terminated from a cluster. The
/// policy only applies to the core and task nodes. The master node cannot be
/// scaled after initial configuration.
///
/// @nodoc
class ManagedScalingPolicy {
  /// The Amazon EC2 unit limits for a managed scaling policy. The managed scaling
  /// activity of a cluster is not allowed to go above or below these limits. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  final ComputeLimits? computeLimits;

  /// Determines whether a custom scaling utilization performance index can be
  /// set. Possible values include <i>ADVANCED</i> or <i>DEFAULT</i>.
  final ScalingStrategy? scalingStrategy;

  /// An integer value that represents an advanced scaling strategy. Setting a
  /// higher value optimizes for performance. Setting a lower value optimizes for
  /// resource conservation. Setting the value to 50 balances performance and
  /// resource conservation. Possible values are 1, 25, 50, 75, and 100.
  final int? utilizationPerformanceIndex;

  ManagedScalingPolicy({
    this.computeLimits,
    this.scalingStrategy,
    this.utilizationPerformanceIndex,
  });

  factory ManagedScalingPolicy.fromJson(Map<String, dynamic> json) {
    return ManagedScalingPolicy(
      computeLimits: json['ComputeLimits'] != null
          ? ComputeLimits.fromJson(
              json['ComputeLimits'] as Map<String, dynamic>)
          : null,
      scalingStrategy:
          (json['ScalingStrategy'] as String?)?.let(ScalingStrategy.fromString),
      utilizationPerformanceIndex: json['UtilizationPerformanceIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeLimits = this.computeLimits;
    final scalingStrategy = this.scalingStrategy;
    final utilizationPerformanceIndex = this.utilizationPerformanceIndex;
    return {
      if (computeLimits != null) 'ComputeLimits': computeLimits,
      if (scalingStrategy != null) 'ScalingStrategy': scalingStrategy.value,
      if (utilizationPerformanceIndex != null)
        'UtilizationPerformanceIndex': utilizationPerformanceIndex,
    };
  }
}

/// An auto-termination policy for an Amazon EMR cluster. An auto-termination
/// policy defines the amount of idle time in seconds after which a cluster
/// automatically terminates. For alternative cluster termination options, see
/// <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html">Control
/// cluster termination</a>.
///
/// @nodoc
class AutoTerminationPolicy {
  /// Specifies the amount of idle time in seconds after which the cluster
  /// automatically terminates. You can specify a minimum of 60 seconds and a
  /// maximum of 604800 seconds (seven days).
  final int? idleTimeout;

  AutoTerminationPolicy({
    this.idleTimeout,
  });

  factory AutoTerminationPolicy.fromJson(Map<String, dynamic> json) {
    return AutoTerminationPolicy(
      idleTimeout: json['IdleTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final idleTimeout = this.idleTimeout;
    return {
      if (idleTimeout != null) 'IdleTimeout': idleTimeout,
    };
  }
}

/// Contains CloudWatch log configuration and S3 logging configuration metadata
/// and settings.
///
/// @nodoc
class MonitoringConfiguration {
  /// CloudWatch log configuration settings and metadata that specify settings
  /// like log files to monitor and where to send them.
  final CloudWatchLogConfiguration? cloudWatchLogConfiguration;

  /// S3 logging configuration that controls how different types of logs (system
  /// logs, application logs, and persistent UI logs) are uploaded to S3. Each log
  /// type can be configured with a specific upload policy.
  final S3LoggingConfiguration? s3LoggingConfiguration;

  MonitoringConfiguration({
    this.cloudWatchLogConfiguration,
    this.s3LoggingConfiguration,
  });

  factory MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return MonitoringConfiguration(
      cloudWatchLogConfiguration: json['CloudWatchLogConfiguration'] != null
          ? CloudWatchLogConfiguration.fromJson(
              json['CloudWatchLogConfiguration'] as Map<String, dynamic>)
          : null,
      s3LoggingConfiguration: json['S3LoggingConfiguration'] != null
          ? S3LoggingConfiguration.fromJson(
              json['S3LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogConfiguration = this.cloudWatchLogConfiguration;
    final s3LoggingConfiguration = this.s3LoggingConfiguration;
    return {
      if (cloudWatchLogConfiguration != null)
        'CloudWatchLogConfiguration': cloudWatchLogConfiguration,
      if (s3LoggingConfiguration != null)
        'S3LoggingConfiguration': s3LoggingConfiguration,
    };
  }
}

/// Holds CloudWatch log configuration settings and metadata that specify
/// settings like log files to monitor and where to send them.
///
/// @nodoc
class CloudWatchLogConfiguration {
  /// Specifies if CloudWatch logging is enabled.
  final bool enabled;

  /// The ARN of the encryption key used to encrypt the logs.
  final String? encryptionKeyArn;

  /// The name of the CloudWatch log group where logs are published.
  final String? logGroupName;

  /// The prefix of the log stream name.
  final String? logStreamNamePrefix;

  /// A map of log types to file names for publishing logs to the standard output
  /// or standard error streams for CloudWatch. Valid log types include STEP_LOGS,
  /// SPARK_DRIVER, and SPARK_EXECUTOR. Valid file names for each type include
  /// STDOUT and STDERR.
  final Map<String, List<String>>? logTypes;

  CloudWatchLogConfiguration({
    required this.enabled,
    this.encryptionKeyArn,
    this.logGroupName,
    this.logStreamNamePrefix,
    this.logTypes,
  });

  factory CloudWatchLogConfiguration.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogConfiguration(
      enabled: (json['Enabled'] as bool?) ?? false,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      logGroupName: json['LogGroupName'] as String?,
      logStreamNamePrefix: json['LogStreamNamePrefix'] as String?,
      logTypes: (json['LogTypes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    final logGroupName = this.logGroupName;
    final logStreamNamePrefix = this.logStreamNamePrefix;
    final logTypes = this.logTypes;
    return {
      'Enabled': enabled,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (logStreamNamePrefix != null)
        'LogStreamNamePrefix': logStreamNamePrefix,
      if (logTypes != null) 'LogTypes': logTypes,
    };
  }
}

/// Configuration for S3 logging behavior in EMR clusters. Defines how different
/// types of logs are uploaded to S3 based on the specified upload policies for
/// each log type.
///
/// @nodoc
class S3LoggingConfiguration {
  /// A map that specifies the upload policy for each log type. The key is the log
  /// type, and the value is the upload policy.
  ///
  /// Valid log types:
  ///
  /// <ul>
  /// <li>
  /// <code>system-logs</code>: EMR Daemon logs.
  /// </li>
  /// <li>
  /// <code>application-logs</code>: Framework logs from Hadoop, Spark, Hive and
  /// other applications running on the cluster.
  /// </li>
  /// <li>
  /// <code>persistent-ui-logs</code>: Logs required for persistent application
  /// UIs such as Spark History Server and Tez UI.
  /// </li>
  /// </ul>
  /// Valid upload policies:
  ///
  /// <ul>
  /// <li>
  /// <code>emr-managed</code>: Standard behavior. Logs are uploaded to S3 bucket
  /// as configured in your LogUri, with certain logs retained by the service for
  /// operational support and troubleshooting purposes.
  /// </li>
  /// <li>
  /// <code>on-customer-s3only</code>: Logs are uploaded only to the
  /// customer-specified S3 bucket. This requires you to specify a LogUri when
  /// creating the cluster. Persistent-ui-logs cannot have on-customer-s3only
  /// policy. Allowed policies for persistent-ui-logs are emr-managed and
  /// disabled.
  /// </li>
  /// <li>
  /// <code>disabled</code>: No S3 upload for this log type.
  /// </li>
  /// </ul>
  final Map<LogType, LogUploadPolicyValue>? logTypeUploadPolicy;

  S3LoggingConfiguration({
    this.logTypeUploadPolicy,
  });

  factory S3LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return S3LoggingConfiguration(
      logTypeUploadPolicy:
          (json['LogTypeUploadPolicy'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(LogType.fromString(k),
                  LogUploadPolicyValue.fromString((e as String)))),
    );
  }

  Map<String, dynamic> toJson() {
    final logTypeUploadPolicy = this.logTypeUploadPolicy;
    return {
      if (logTypeUploadPolicy != null)
        'LogTypeUploadPolicy':
            logTypeUploadPolicy.map((k, e) => MapEntry(k.value, e.value)),
    };
  }
}

/// @nodoc
class LogType {
  static const systemLogs = LogType._('system-logs');
  static const applicationLogs = LogType._('application-logs');
  static const persistentUiLogs = LogType._('persistent-ui-logs');

  final String value;

  const LogType._(this.value);

  static const values = [systemLogs, applicationLogs, persistentUiLogs];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogUploadPolicyValue {
  static const emrManaged = LogUploadPolicyValue._('emr-managed');
  static const onCustomerS3only = LogUploadPolicyValue._('on-customer-s3only');
  static const disabled = LogUploadPolicyValue._('disabled');

  final String value;

  const LogUploadPolicyValue._(this.value);

  static const values = [emrManaged, onCustomerS3only, disabled];

  static LogUploadPolicyValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LogUploadPolicyValue._(value));

  @override
  bool operator ==(other) =>
      other is LogUploadPolicyValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Placement group configuration for an Amazon EMR cluster. The configuration
/// specifies the placement strategy that can be applied to instance roles
/// during cluster creation.
///
/// To use this configuration, consider attaching managed policy
/// AmazonElasticMapReducePlacementGroupPolicy to the Amazon EMR role.
///
/// @nodoc
class PlacementGroupConfig {
  /// Role of the instance in the cluster.
  ///
  /// Starting with Amazon EMR release 5.23.0, the only supported instance role is
  /// <code>MASTER</code>.
  final InstanceRoleType instanceRole;

  /// Amazon EC2 Placement Group strategy associated with instance role.
  ///
  /// Starting with Amazon EMR release 5.23.0, the only supported placement
  /// strategy is <code>SPREAD</code> for the <code>MASTER</code> instance role.
  final PlacementGroupStrategy? placementStrategy;

  PlacementGroupConfig({
    required this.instanceRole,
    this.placementStrategy,
  });

  factory PlacementGroupConfig.fromJson(Map<String, dynamic> json) {
    return PlacementGroupConfig(
      instanceRole:
          InstanceRoleType.fromString((json['InstanceRole'] as String?) ?? ''),
      placementStrategy: (json['PlacementStrategy'] as String?)
          ?.let(PlacementGroupStrategy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceRole = this.instanceRole;
    final placementStrategy = this.placementStrategy;
    return {
      'InstanceRole': instanceRole.value,
      if (placementStrategy != null)
        'PlacementStrategy': placementStrategy.value,
    };
  }
}

/// @nodoc
class InstanceRoleType {
  static const master = InstanceRoleType._('MASTER');
  static const core = InstanceRoleType._('CORE');
  static const task = InstanceRoleType._('TASK');

  final String value;

  const InstanceRoleType._(this.value);

  static const values = [master, core, task];

  static InstanceRoleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceRoleType._(value));

  @override
  bool operator ==(other) => other is InstanceRoleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PlacementGroupStrategy {
  static const spread = PlacementGroupStrategy._('SPREAD');
  static const partition = PlacementGroupStrategy._('PARTITION');
  static const cluster = PlacementGroupStrategy._('CLUSTER');
  static const none = PlacementGroupStrategy._('NONE');

  final String value;

  const PlacementGroupStrategy._(this.value);

  static const values = [spread, partition, cluster, none];

  static PlacementGroupStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlacementGroupStrategy._(value));

  @override
  bool operator ==(other) =>
      other is PlacementGroupStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon EC2 unit limits for a managed scaling policy. The managed scaling
/// activity of a cluster can not be above or below these limits. The limit only
/// applies to the core and task nodes. The master node cannot be scaled after
/// initial configuration.
///
/// @nodoc
class ComputeLimits {
  /// The upper boundary of Amazon EC2 units. It is measured through vCPU cores or
  /// instances for instance groups and measured through units for instance
  /// fleets. Managed scaling activities are not allowed beyond this boundary. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  final int maximumCapacityUnits;

  /// The lower boundary of Amazon EC2 units. It is measured through vCPU cores or
  /// instances for instance groups and measured through units for instance
  /// fleets. Managed scaling activities are not allowed beyond this boundary. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  final int minimumCapacityUnits;

  /// The unit type used for specifying a managed scaling policy.
  final ComputeLimitsUnitType unitType;

  /// The upper boundary of Amazon EC2 units for core node type in a cluster. It
  /// is measured through vCPU cores or instances for instance groups and measured
  /// through units for instance fleets. The core units are not allowed to scale
  /// beyond this boundary. The parameter is used to split capacity allocation
  /// between core and task nodes.
  final int? maximumCoreCapacityUnits;

  /// The upper boundary of On-Demand Amazon EC2 units. It is measured through
  /// vCPU cores or instances for instance groups and measured through units for
  /// instance fleets. The On-Demand units are not allowed to scale beyond this
  /// boundary. The parameter is used to split capacity allocation between
  /// On-Demand and Spot Instances.
  final int? maximumOnDemandCapacityUnits;

  ComputeLimits({
    required this.maximumCapacityUnits,
    required this.minimumCapacityUnits,
    required this.unitType,
    this.maximumCoreCapacityUnits,
    this.maximumOnDemandCapacityUnits,
  });

  factory ComputeLimits.fromJson(Map<String, dynamic> json) {
    return ComputeLimits(
      maximumCapacityUnits: (json['MaximumCapacityUnits'] as int?) ?? 0,
      minimumCapacityUnits: (json['MinimumCapacityUnits'] as int?) ?? 0,
      unitType:
          ComputeLimitsUnitType.fromString((json['UnitType'] as String?) ?? ''),
      maximumCoreCapacityUnits: json['MaximumCoreCapacityUnits'] as int?,
      maximumOnDemandCapacityUnits:
          json['MaximumOnDemandCapacityUnits'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumCapacityUnits = this.maximumCapacityUnits;
    final minimumCapacityUnits = this.minimumCapacityUnits;
    final unitType = this.unitType;
    final maximumCoreCapacityUnits = this.maximumCoreCapacityUnits;
    final maximumOnDemandCapacityUnits = this.maximumOnDemandCapacityUnits;
    return {
      'MaximumCapacityUnits': maximumCapacityUnits,
      'MinimumCapacityUnits': minimumCapacityUnits,
      'UnitType': unitType.value,
      if (maximumCoreCapacityUnits != null)
        'MaximumCoreCapacityUnits': maximumCoreCapacityUnits,
      if (maximumOnDemandCapacityUnits != null)
        'MaximumOnDemandCapacityUnits': maximumOnDemandCapacityUnits,
    };
  }
}

/// @nodoc
class ScalingStrategy {
  static const $default = ScalingStrategy._('DEFAULT');
  static const advanced = ScalingStrategy._('ADVANCED');

  final String value;

  const ScalingStrategy._(this.value);

  static const values = [$default, advanced];

  static ScalingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScalingStrategy._(value));

  @override
  bool operator ==(other) => other is ScalingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ComputeLimitsUnitType {
  static const instanceFleetUnits =
      ComputeLimitsUnitType._('InstanceFleetUnits');
  static const instances = ComputeLimitsUnitType._('Instances');
  static const vcpu = ComputeLimitsUnitType._('VCPU');

  final String value;

  const ComputeLimitsUnitType._(this.value);

  static const values = [instanceFleetUnits, instances, vcpu];

  static ComputeLimitsUnitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComputeLimitsUnitType._(value));

  @override
  bool operator ==(other) =>
      other is ComputeLimitsUnitType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// With Amazon EMR release version 4.0 and later, the only accepted parameter
/// is the application name. To pass arguments to applications, you use
/// configuration classifications specified using configuration JSON objects.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html">Configuring
/// Applications</a>.
///
/// With earlier Amazon EMR releases, the application is any Amazon or
/// third-party software that you can add to the cluster. This structure
/// contains a list of strings that indicates the software to use with the
/// cluster and accepts a user argument list. Amazon EMR accepts and forwards
/// the argument list to the corresponding installation script as bootstrap
/// action argument.
///
/// @nodoc
class Application {
  /// This option is for advanced users only. This is meta information about
  /// third-party applications that third-party vendors use for testing purposes.
  final Map<String, String>? additionalInfo;

  /// Arguments for Amazon EMR to pass to the application.
  final List<String>? args;

  /// The name of the application.
  final String? name;

  /// The version of the application.
  final String? version;

  Application({
    this.additionalInfo,
    this.args,
    this.name,
    this.version,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      additionalInfo: (json['AdditionalInfo'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      args: (json['Args'] as List?)?.nonNulls.map((e) => e as String).toList(),
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalInfo = this.additionalInfo;
    final args = this.args;
    final name = this.name;
    final version = this.version;
    return {
      if (additionalInfo != null) 'AdditionalInfo': additionalInfo,
      if (args != null) 'Args': args,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// The list of supported product configurations that allow user-supplied
/// arguments. Amazon EMR accepts these arguments and forwards them to the
/// corresponding installation script as bootstrap action arguments.
///
/// @nodoc
class SupportedProductConfig {
  /// The list of user-supplied arguments.
  final List<String>? args;

  /// The name of the product configuration.
  final String? name;

  SupportedProductConfig({
    this.args,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final args = this.args;
    final name = this.name;
    return {
      if (args != null) 'Args': args,
      if (name != null) 'Name': name,
    };
  }
}

/// Configuration of a bootstrap action.
///
/// @nodoc
class BootstrapActionConfig {
  /// The name of the bootstrap action.
  final String name;

  /// The script run by the bootstrap action.
  final ScriptBootstrapActionConfig scriptBootstrapAction;

  BootstrapActionConfig({
    required this.name,
    required this.scriptBootstrapAction,
  });

  factory BootstrapActionConfig.fromJson(Map<String, dynamic> json) {
    return BootstrapActionConfig(
      name: (json['Name'] as String?) ?? '',
      scriptBootstrapAction: ScriptBootstrapActionConfig.fromJson(
          (json['ScriptBootstrapAction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final scriptBootstrapAction = this.scriptBootstrapAction;
    return {
      'Name': name,
      'ScriptBootstrapAction': scriptBootstrapAction,
    };
  }
}

/// Configuration of the script to run during a bootstrap action.
///
/// @nodoc
class ScriptBootstrapActionConfig {
  /// Location in Amazon S3 of the script to run during a bootstrap action.
  final String path;

  /// A list of command line arguments to pass to the bootstrap action script.
  final List<String>? args;

  ScriptBootstrapActionConfig({
    required this.path,
    this.args,
  });

  factory ScriptBootstrapActionConfig.fromJson(Map<String, dynamic> json) {
    return ScriptBootstrapActionConfig(
      path: (json['Path'] as String?) ?? '',
      args: (json['Args'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final args = this.args;
    return {
      'Path': path,
      if (args != null) 'Args': args,
    };
  }
}

/// Specification for a cluster (job flow) step.
///
/// @nodoc
class StepConfig {
  /// The JAR file used for the step.
  final HadoopJarStepConfig hadoopJarStep;

  /// The name of the step.
  final String name;

  /// The action to take when the step fails. Use one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE_CLUSTER</code> - Shuts down the cluster.
  /// </li>
  /// <li>
  /// <code>CANCEL_AND_WAIT</code> - Cancels any pending steps and returns the
  /// cluster to the <code>WAITING</code> state.
  /// </li>
  /// <li>
  /// <code>CONTINUE</code> - Continues to the next step in the queue.
  /// </li>
  /// <li>
  /// <code>TERMINATE_JOB_FLOW</code> - Shuts down the cluster.
  /// <code>TERMINATE_JOB_FLOW</code> is provided for backward compatibility. We
  /// recommend using <code>TERMINATE_CLUSTER</code> instead.
  /// </li>
  /// </ul>
  /// If a cluster's <code>StepConcurrencyLevel</code> is greater than
  /// <code>1</code>, do not use <code>AddJobFlowSteps</code> to submit a step
  /// with this parameter set to <code>CANCEL_AND_WAIT</code> or
  /// <code>TERMINATE_CLUSTER</code>. The step is not submitted and the action
  /// fails with a message that the <code>ActionOnFailure</code> setting is not
  /// valid.
  ///
  /// If you change a cluster's <code>StepConcurrencyLevel</code> to be greater
  /// than 1 while a step is running, the <code>ActionOnFailure</code> parameter
  /// may not behave as you expect. In this case, for a step that fails with this
  /// parameter set to <code>CANCEL_AND_WAIT</code>, pending steps and the running
  /// step are not canceled; for a step that fails with this parameter set to
  /// <code>TERMINATE_CLUSTER</code>, the cluster does not terminate.
  final ActionOnFailure? actionOnFailure;

  /// Object that holds configuration properties for logging.
  final StepMonitoringConfiguration? stepMonitoringConfiguration;

  StepConfig({
    required this.hadoopJarStep,
    required this.name,
    this.actionOnFailure,
    this.stepMonitoringConfiguration,
  });

  factory StepConfig.fromJson(Map<String, dynamic> json) {
    return StepConfig(
      hadoopJarStep: HadoopJarStepConfig.fromJson(
          (json['HadoopJarStep'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.let(ActionOnFailure.fromString),
      stepMonitoringConfiguration: json['StepMonitoringConfiguration'] != null
          ? StepMonitoringConfiguration.fromJson(
              json['StepMonitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hadoopJarStep = this.hadoopJarStep;
    final name = this.name;
    final actionOnFailure = this.actionOnFailure;
    final stepMonitoringConfiguration = this.stepMonitoringConfiguration;
    return {
      'HadoopJarStep': hadoopJarStep,
      'Name': name,
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.value,
      if (stepMonitoringConfiguration != null)
        'StepMonitoringConfiguration': stepMonitoringConfiguration,
    };
  }
}

/// @nodoc
class ActionOnFailure {
  static const terminateJobFlow = ActionOnFailure._('TERMINATE_JOB_FLOW');
  static const terminateCluster = ActionOnFailure._('TERMINATE_CLUSTER');
  static const cancelAndWait = ActionOnFailure._('CANCEL_AND_WAIT');
  static const $continue = ActionOnFailure._('CONTINUE');

  final String value;

  const ActionOnFailure._(this.value);

  static const values = [
    terminateJobFlow,
    terminateCluster,
    cancelAndWait,
    $continue
  ];

  static ActionOnFailure fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionOnFailure._(value));

  @override
  bool operator ==(other) => other is ActionOnFailure && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A job flow step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
///
/// @nodoc
class HadoopJarStepConfig {
  /// A path to a JAR file run during the step.
  final String jar;

  /// A list of command line arguments passed to the JAR file's main function when
  /// executed.
  final List<String>? args;

  /// The name of the main class in the specified Java file. If not specified, the
  /// JAR file should specify a Main-Class in its manifest file.
  final String? mainClass;

  /// A list of Java properties that are set when the step runs. You can use these
  /// properties to pass key-value pairs to your main function.
  final List<KeyValue>? properties;

  HadoopJarStepConfig({
    required this.jar,
    this.args,
    this.mainClass,
    this.properties,
  });

  factory HadoopJarStepConfig.fromJson(Map<String, dynamic> json) {
    return HadoopJarStepConfig(
      jar: (json['Jar'] as String?) ?? '',
      args: (json['Args'] as List?)?.nonNulls.map((e) => e as String).toList(),
      mainClass: json['MainClass'] as String?,
      properties: (json['Properties'] as List?)
          ?.nonNulls
          .map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jar = this.jar;
    final args = this.args;
    final mainClass = this.mainClass;
    final properties = this.properties;
    return {
      'Jar': jar,
      if (args != null) 'Args': args,
      if (mainClass != null) 'MainClass': mainClass,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// Object that holds configuration properties for logging.
///
/// @nodoc
class StepMonitoringConfiguration {
  /// The Amazon S3 configuration for monitoring log publishing. You can configure
  /// your step to send log information to Amazon S3. When it's specified, it
  /// takes precedence over the cluster's logging configuration. If you don't
  /// specify this configuration entirely, or omit individual fields, EMR falls
  /// back to cluster-level logging behavior.
  final S3MonitoringConfiguration? s3MonitoringConfiguration;

  StepMonitoringConfiguration({
    this.s3MonitoringConfiguration,
  });

  factory StepMonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return StepMonitoringConfiguration(
      s3MonitoringConfiguration: json['S3MonitoringConfiguration'] != null
          ? S3MonitoringConfiguration.fromJson(
              json['S3MonitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3MonitoringConfiguration = this.s3MonitoringConfiguration;
    return {
      if (s3MonitoringConfiguration != null)
        'S3MonitoringConfiguration': s3MonitoringConfiguration,
    };
  }
}

/// The Amazon S3 configuration for monitoring log publishing. You can configure
/// your step to send log information to Amazon S3. When it's specified, it
/// takes precedence over the cluster's logging configuration. If you don't
/// specify this configuration entirely, or omit individual fields, EMR falls
/// back to cluster-level logging behavior.
///
/// @nodoc
class S3MonitoringConfiguration {
  /// The KMS key ARN to encrypt the logs published to the given Amazon S3
  /// destination.
  final String? encryptionKeyArn;

  /// The Amazon S3 destination URI for log publishing.
  final String? logUri;

  S3MonitoringConfiguration({
    this.encryptionKeyArn,
    this.logUri,
  });

  factory S3MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return S3MonitoringConfiguration(
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      logUri: json['LogUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyArn = this.encryptionKeyArn;
    final logUri = this.logUri;
    return {
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (logUri != null) 'LogUri': logUri,
    };
  }
}

/// A key-value pair.
///
/// @nodoc
class KeyValue {
  /// The unique identifier of a key-value pair.
  final String? key;

  /// The value part of the identified key.
  final String? value;

  KeyValue({
    this.key,
    this.value,
  });

  factory KeyValue.fromJson(Map<String, dynamic> json) {
    return KeyValue(
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

/// The Amazon EC2 Availability Zone configuration of the cluster (job flow).
///
/// @nodoc
class PlacementType {
  /// The Amazon EC2 Availability Zone for the cluster.
  /// <code>AvailabilityZone</code> is used for uniform instance groups, while
  /// <code>AvailabilityZones</code> (plural) is used for instance fleets.
  final String? availabilityZone;

  /// When multiple Availability Zones are specified, Amazon EMR evaluates them
  /// and launches instances in the optimal Availability Zone.
  /// <code>AvailabilityZones</code> is used for instance fleets, while
  /// <code>AvailabilityZone</code> (singular) is used for uniform instance
  /// groups.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  final List<String>? availabilityZones;

  PlacementType({
    this.availabilityZone,
    this.availabilityZones,
  });

  factory PlacementType.fromJson(Map<String, dynamic> json) {
    return PlacementType(
      availabilityZone: json['AvailabilityZone'] as String?,
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final availabilityZones = this.availabilityZones;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
    };
  }
}

/// The configuration that defines an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleetConfig {
  /// The node type that the instance fleet hosts. Valid values are MASTER, CORE,
  /// and TASK.
  final InstanceFleetType instanceFleetType;

  /// Reserved.
  final String? context;

  /// The instance type configurations that define the Amazon EC2 instances in the
  /// instance fleet.
  final List<InstanceTypeConfig>? instanceTypeConfigs;

  /// The launch specification for the instance fleet.
  final InstanceFleetProvisioningSpecifications? launchSpecifications;

  /// The friendly name of the instance fleet.
  final String? name;

  /// The resize specification for the instance fleet.
  final InstanceFleetResizingSpecifications? resizeSpecifications;

  /// The target capacity of On-Demand units for the instance fleet, which
  /// determines how many On-Demand Instances to provision. When the instance
  /// fleet launches, Amazon EMR tries to provision On-Demand Instances as
  /// specified by <a>InstanceTypeConfig</a>. Each instance configuration has a
  /// specified <code>WeightedCapacity</code>. When an On-Demand Instance is
  /// provisioned, the <code>WeightedCapacity</code> units count toward the target
  /// capacity. Amazon EMR provisions instances until the target capacity is
  /// totally fulfilled, even if this results in an overage. For example, if there
  /// are 2 units remaining to fulfill capacity, and Amazon EMR can only provision
  /// an instance with a <code>WeightedCapacity</code> of 5 units, the instance is
  /// provisioned, and the target capacity is exceeded by 3 units.
  /// <note>
  /// If not specified or set to 0, only Spot Instances are provisioned for the
  /// instance fleet using <code>TargetSpotCapacity</code>. At least one of
  /// <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code>
  /// should be greater than 0. For a master instance fleet, only one of
  /// <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can
  /// be specified, and its value must be 1.
  /// </note>
  final int? targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet, which determines
  /// how many Spot Instances to provision. When the instance fleet launches,
  /// Amazon EMR tries to provision Spot Instances as specified by
  /// <a>InstanceTypeConfig</a>. Each instance configuration has a specified
  /// <code>WeightedCapacity</code>. When a Spot Instance is provisioned, the
  /// <code>WeightedCapacity</code> units count toward the target capacity. Amazon
  /// EMR provisions instances until the target capacity is totally fulfilled,
  /// even if this results in an overage. For example, if there are 2 units
  /// remaining to fulfill capacity, and Amazon EMR can only provision an instance
  /// with a <code>WeightedCapacity</code> of 5 units, the instance is
  /// provisioned, and the target capacity is exceeded by 3 units.
  /// <note>
  /// If not specified or set to 0, only On-Demand Instances are provisioned for
  /// the instance fleet. At least one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> should be greater than 0. For a master
  /// instance fleet, only one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> can be specified, and its value must be
  /// 1.
  /// </note>
  final int? targetSpotCapacity;

  InstanceFleetConfig({
    required this.instanceFleetType,
    this.context,
    this.instanceTypeConfigs,
    this.launchSpecifications,
    this.name,
    this.resizeSpecifications,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });

  Map<String, dynamic> toJson() {
    final instanceFleetType = this.instanceFleetType;
    final context = this.context;
    final instanceTypeConfigs = this.instanceTypeConfigs;
    final launchSpecifications = this.launchSpecifications;
    final name = this.name;
    final resizeSpecifications = this.resizeSpecifications;
    final targetOnDemandCapacity = this.targetOnDemandCapacity;
    final targetSpotCapacity = this.targetSpotCapacity;
    return {
      'InstanceFleetType': instanceFleetType.value,
      if (context != null) 'Context': context,
      if (instanceTypeConfigs != null)
        'InstanceTypeConfigs': instanceTypeConfigs,
      if (launchSpecifications != null)
        'LaunchSpecifications': launchSpecifications,
      if (name != null) 'Name': name,
      if (resizeSpecifications != null)
        'ResizeSpecifications': resizeSpecifications,
      if (targetOnDemandCapacity != null)
        'TargetOnDemandCapacity': targetOnDemandCapacity,
      if (targetSpotCapacity != null) 'TargetSpotCapacity': targetSpotCapacity,
    };
  }
}

/// @nodoc
class InstanceFleetType {
  static const master = InstanceFleetType._('MASTER');
  static const core = InstanceFleetType._('CORE');
  static const task = InstanceFleetType._('TASK');

  final String value;

  const InstanceFleetType._(this.value);

  static const values = [master, core, task];

  static InstanceFleetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceFleetType._(value));

  @override
  bool operator ==(other) => other is InstanceFleetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The launch specification for On-Demand and Spot Instances in the fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand and Spot instance
/// allocation strategies are available in Amazon EMR releases 5.12.1 and later.
/// </note>
///
/// @nodoc
class InstanceFleetProvisioningSpecifications {
  /// The launch specification for On-Demand Instances in the instance fleet,
  /// which determines the allocation strategy and capacity reservation options.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
  /// strategy is available in Amazon EMR releases 5.12.1 and later.
  /// </note>
  final OnDemandProvisioningSpecification? onDemandSpecification;

  /// The launch specification for Spot instances in the fleet, which determines
  /// the allocation strategy, defined duration, and provisioning timeout
  /// behavior.
  final SpotProvisioningSpecification? spotSpecification;

  InstanceFleetProvisioningSpecifications({
    this.onDemandSpecification,
    this.spotSpecification,
  });

  factory InstanceFleetProvisioningSpecifications.fromJson(
      Map<String, dynamic> json) {
    return InstanceFleetProvisioningSpecifications(
      onDemandSpecification: json['OnDemandSpecification'] != null
          ? OnDemandProvisioningSpecification.fromJson(
              json['OnDemandSpecification'] as Map<String, dynamic>)
          : null,
      spotSpecification: json['SpotSpecification'] != null
          ? SpotProvisioningSpecification.fromJson(
              json['SpotSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final onDemandSpecification = this.onDemandSpecification;
    final spotSpecification = this.spotSpecification;
    return {
      if (onDemandSpecification != null)
        'OnDemandSpecification': onDemandSpecification,
      if (spotSpecification != null) 'SpotSpecification': spotSpecification,
    };
  }
}

/// The resize specification for On-Demand and Spot Instances in the fleet.
///
/// @nodoc
class InstanceFleetResizingSpecifications {
  /// The resize specification for On-Demand Instances in the instance fleet,
  /// which contains the allocation strategy, capacity reservation options, and
  /// the resize timeout period.
  final OnDemandResizingSpecification? onDemandResizeSpecification;

  /// The resize specification for Spot Instances in the instance fleet, which
  /// contains the allocation strategy and the resize timeout period.
  final SpotResizingSpecification? spotResizeSpecification;

  InstanceFleetResizingSpecifications({
    this.onDemandResizeSpecification,
    this.spotResizeSpecification,
  });

  factory InstanceFleetResizingSpecifications.fromJson(
      Map<String, dynamic> json) {
    return InstanceFleetResizingSpecifications(
      onDemandResizeSpecification: json['OnDemandResizeSpecification'] != null
          ? OnDemandResizingSpecification.fromJson(
              json['OnDemandResizeSpecification'] as Map<String, dynamic>)
          : null,
      spotResizeSpecification: json['SpotResizeSpecification'] != null
          ? SpotResizingSpecification.fromJson(
              json['SpotResizeSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final onDemandResizeSpecification = this.onDemandResizeSpecification;
    final spotResizeSpecification = this.spotResizeSpecification;
    return {
      if (onDemandResizeSpecification != null)
        'OnDemandResizeSpecification': onDemandResizeSpecification,
      if (spotResizeSpecification != null)
        'SpotResizeSpecification': spotResizeSpecification,
    };
  }
}

/// The resize specification for Spot Instances in the instance fleet, which
/// contains the resize timeout period.
///
/// @nodoc
class SpotResizingSpecification {
  /// Specifies the allocation strategy to use to launch Spot instances during a
  /// resize. If you run Amazon EMR releases 6.9.0 or higher, the default is
  /// <code>price-capacity-optimized</code>. If you run Amazon EMR releases 6.8.0
  /// or lower, the default is <code>capacity-optimized</code>.
  final SpotProvisioningAllocationStrategy? allocationStrategy;

  /// Spot resize timeout in minutes. If Spot Instances are not provisioned within
  /// this time, the resize workflow will stop provisioning of Spot instances.
  /// Minimum value is 5 minutes and maximum value is 10,080 minutes (7 days). The
  /// timeout applies to all resize workflows on the Instance Fleet. The resize
  /// could be triggered by Amazon EMR Managed Scaling or by the customer (via
  /// Amazon EMR Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK
  /// ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot
  /// Reclamation.
  final int? timeoutDurationMinutes;

  SpotResizingSpecification({
    this.allocationStrategy,
    this.timeoutDurationMinutes,
  });

  factory SpotResizingSpecification.fromJson(Map<String, dynamic> json) {
    return SpotResizingSpecification(
      allocationStrategy: (json['AllocationStrategy'] as String?)
          ?.let(SpotProvisioningAllocationStrategy.fromString),
      timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    return {
      if (allocationStrategy != null)
        'AllocationStrategy': allocationStrategy.value,
      if (timeoutDurationMinutes != null)
        'TimeoutDurationMinutes': timeoutDurationMinutes,
    };
  }
}

/// The resize specification for On-Demand Instances in the instance fleet,
/// which contains the resize timeout period.
///
/// @nodoc
class OnDemandResizingSpecification {
  /// Specifies the allocation strategy to use to launch On-Demand instances
  /// during a resize. The default is <code>lowest-price</code>.
  final OnDemandProvisioningAllocationStrategy? allocationStrategy;
  final OnDemandCapacityReservationOptions? capacityReservationOptions;

  /// On-Demand resize timeout in minutes. If On-Demand Instances are not
  /// provisioned within this time, the resize workflow stops. The minimum value
  /// is 5 minutes, and the maximum value is 10,080 minutes (7 days). The timeout
  /// applies to all resize workflows on the Instance Fleet. The resize could be
  /// triggered by Amazon EMR Managed Scaling or by the customer (via Amazon EMR
  /// Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK
  /// ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot
  /// Reclamation.
  final int? timeoutDurationMinutes;

  OnDemandResizingSpecification({
    this.allocationStrategy,
    this.capacityReservationOptions,
    this.timeoutDurationMinutes,
  });

  factory OnDemandResizingSpecification.fromJson(Map<String, dynamic> json) {
    return OnDemandResizingSpecification(
      allocationStrategy: (json['AllocationStrategy'] as String?)
          ?.let(OnDemandProvisioningAllocationStrategy.fromString),
      capacityReservationOptions: json['CapacityReservationOptions'] != null
          ? OnDemandCapacityReservationOptions.fromJson(
              json['CapacityReservationOptions'] as Map<String, dynamic>)
          : null,
      timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    final capacityReservationOptions = this.capacityReservationOptions;
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    return {
      if (allocationStrategy != null)
        'AllocationStrategy': allocationStrategy.value,
      if (capacityReservationOptions != null)
        'CapacityReservationOptions': capacityReservationOptions,
      if (timeoutDurationMinutes != null)
        'TimeoutDurationMinutes': timeoutDurationMinutes,
    };
  }
}

/// @nodoc
class OnDemandProvisioningAllocationStrategy {
  static const lowestPrice =
      OnDemandProvisioningAllocationStrategy._('lowest-price');
  static const prioritized =
      OnDemandProvisioningAllocationStrategy._('prioritized');

  final String value;

  const OnDemandProvisioningAllocationStrategy._(this.value);

  static const values = [lowestPrice, prioritized];

  static OnDemandProvisioningAllocationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OnDemandProvisioningAllocationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is OnDemandProvisioningAllocationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the strategy for using unused Capacity Reservations for fulfilling
/// On-Demand capacity.
///
/// @nodoc
class OnDemandCapacityReservationOptions {
  /// Indicates the instance's Capacity Reservation preferences. Possible
  /// preferences include:
  ///
  /// <ul>
  /// <li>
  /// <code>open</code> - The instance can run in any open Capacity Reservation
  /// that has matching attributes (instance type, platform, Availability Zone).
  /// </li>
  /// <li>
  /// <code>none</code> - The instance avoids running in a Capacity Reservation
  /// even if one is available. The instance runs as an On-Demand Instance.
  /// </li>
  /// </ul>
  final OnDemandCapacityReservationPreference? capacityReservationPreference;

  /// The ARN of the Capacity Reservation resource group in which to run the
  /// instance.
  final String? capacityReservationResourceGroupArn;

  /// Indicates whether to use unused Capacity Reservations for fulfilling
  /// On-Demand capacity.
  ///
  /// If you specify <code>use-capacity-reservations-first</code>, the fleet uses
  /// unused Capacity Reservations to fulfill On-Demand capacity up to the target
  /// On-Demand capacity. If multiple instance pools have unused Capacity
  /// Reservations, the On-Demand allocation strategy (<code>lowest-price</code>)
  /// is applied. If the number of unused Capacity Reservations is less than the
  /// On-Demand target capacity, the remaining On-Demand target capacity is
  /// launched according to the On-Demand allocation strategy
  /// (<code>lowest-price</code>).
  ///
  /// If you do not specify a value, the fleet fulfills the On-Demand capacity
  /// according to the chosen On-Demand allocation strategy.
  final OnDemandCapacityReservationUsageStrategy? usageStrategy;

  OnDemandCapacityReservationOptions({
    this.capacityReservationPreference,
    this.capacityReservationResourceGroupArn,
    this.usageStrategy,
  });

  factory OnDemandCapacityReservationOptions.fromJson(
      Map<String, dynamic> json) {
    return OnDemandCapacityReservationOptions(
      capacityReservationPreference:
          (json['CapacityReservationPreference'] as String?)
              ?.let(OnDemandCapacityReservationPreference.fromString),
      capacityReservationResourceGroupArn:
          json['CapacityReservationResourceGroupArn'] as String?,
      usageStrategy: (json['UsageStrategy'] as String?)
          ?.let(OnDemandCapacityReservationUsageStrategy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityReservationPreference = this.capacityReservationPreference;
    final capacityReservationResourceGroupArn =
        this.capacityReservationResourceGroupArn;
    final usageStrategy = this.usageStrategy;
    return {
      if (capacityReservationPreference != null)
        'CapacityReservationPreference': capacityReservationPreference.value,
      if (capacityReservationResourceGroupArn != null)
        'CapacityReservationResourceGroupArn':
            capacityReservationResourceGroupArn,
      if (usageStrategy != null) 'UsageStrategy': usageStrategy.value,
    };
  }
}

/// @nodoc
class OnDemandCapacityReservationUsageStrategy {
  static const useCapacityReservationsFirst =
      OnDemandCapacityReservationUsageStrategy._(
          'use-capacity-reservations-first');

  final String value;

  const OnDemandCapacityReservationUsageStrategy._(this.value);

  static const values = [useCapacityReservationsFirst];

  static OnDemandCapacityReservationUsageStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OnDemandCapacityReservationUsageStrategy._(value));

  @override
  bool operator ==(other) =>
      other is OnDemandCapacityReservationUsageStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OnDemandCapacityReservationPreference {
  static const open = OnDemandCapacityReservationPreference._('open');
  static const none = OnDemandCapacityReservationPreference._('none');

  final String value;

  const OnDemandCapacityReservationPreference._(this.value);

  static const values = [open, none];

  static OnDemandCapacityReservationPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OnDemandCapacityReservationPreference._(value));

  @override
  bool operator ==(other) =>
      other is OnDemandCapacityReservationPreference && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SpotProvisioningAllocationStrategy {
  static const capacityOptimized =
      SpotProvisioningAllocationStrategy._('capacity-optimized');
  static const priceCapacityOptimized =
      SpotProvisioningAllocationStrategy._('price-capacity-optimized');
  static const lowestPrice =
      SpotProvisioningAllocationStrategy._('lowest-price');
  static const diversified =
      SpotProvisioningAllocationStrategy._('diversified');
  static const capacityOptimizedPrioritized =
      SpotProvisioningAllocationStrategy._('capacity-optimized-prioritized');

  final String value;

  const SpotProvisioningAllocationStrategy._(this.value);

  static const values = [
    capacityOptimized,
    priceCapacityOptimized,
    lowestPrice,
    diversified,
    capacityOptimizedPrioritized
  ];

  static SpotProvisioningAllocationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpotProvisioningAllocationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is SpotProvisioningAllocationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The launch specification for Spot Instances in the instance fleet, which
/// determines the defined duration, provisioning timeout behavior, and
/// allocation strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions. Spot Instance allocation strategy
/// is available in Amazon EMR releases 5.12.1 and later.
/// </note> <note>
/// Spot Instances with a defined duration (also known as Spot blocks) are no
/// longer available to new customers from July 1, 2021. For customers who have
/// previously used the feature, we will continue to support Spot Instances with
/// a defined duration until December 31, 2022.
/// </note>
///
/// @nodoc
class SpotProvisioningSpecification {
  /// The action to take when <code>TargetSpotCapacity</code> has not been
  /// fulfilled when the <code>TimeoutDurationMinutes</code> has expired; that is,
  /// when all Spot Instances could not be provisioned within the Spot
  /// provisioning timeout. Valid values are <code>TERMINATE_CLUSTER</code> and
  /// <code>SWITCH_TO_ON_DEMAND</code>. SWITCH_TO_ON_DEMAND specifies that if no
  /// Spot Instances are available, On-Demand Instances should be provisioned to
  /// fulfill any remaining Spot capacity.
  final SpotProvisioningTimeoutAction timeoutAction;

  /// The Spot provisioning timeout period in minutes. If Spot Instances are not
  /// provisioned within this time period, the <code>TimeOutAction</code> is
  /// taken. Minimum value is 5 and maximum value is 1440. The timeout applies
  /// only during initial provisioning, when the cluster is first created.
  final int timeoutDurationMinutes;

  /// Specifies one of the following strategies to launch Spot Instance fleets:
  /// <code>capacity-optimized</code>, <code>price-capacity-optimized</code>,
  /// <code>lowest-price</code>, or <code>diversified</code>, and
  /// <code>capacity-optimized-prioritized</code>. For more information on the
  /// provisioning strategies, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-allocation-strategy.html">Allocation
  /// strategies for Spot Instances</a> in the <i>Amazon EC2 User Guide for Linux
  /// Instances</i>.
  /// <note>
  /// When you launch a Spot Instance fleet with the old console, it automatically
  /// launches with the <code>capacity-optimized</code> strategy. You can't change
  /// the allocation strategy from the old console.
  /// </note>
  final SpotProvisioningAllocationStrategy? allocationStrategy;

  /// The defined duration for Spot Instances (also known as Spot blocks) in
  /// minutes. When specified, the Spot Instance does not terminate before the
  /// defined duration expires, and defined duration pricing for Spot Instances
  /// applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration
  /// period starts as soon as a Spot Instance receives its instance ID. At the
  /// end of the duration, Amazon EC2 marks the Spot Instance for termination and
  /// provides a Spot Instance termination notice, which gives the instance a
  /// two-minute warning before it terminates.
  /// <note>
  /// Spot Instances with a defined duration (also known as Spot blocks) are no
  /// longer available to new customers from July 1, 2021. For customers who have
  /// previously used the feature, we will continue to support Spot Instances with
  /// a defined duration until December 31, 2022.
  /// </note>
  final int? blockDurationMinutes;

  SpotProvisioningSpecification({
    required this.timeoutAction,
    required this.timeoutDurationMinutes,
    this.allocationStrategy,
    this.blockDurationMinutes,
  });

  factory SpotProvisioningSpecification.fromJson(Map<String, dynamic> json) {
    return SpotProvisioningSpecification(
      timeoutAction: SpotProvisioningTimeoutAction.fromString(
          (json['TimeoutAction'] as String?) ?? ''),
      timeoutDurationMinutes: (json['TimeoutDurationMinutes'] as int?) ?? 0,
      allocationStrategy: (json['AllocationStrategy'] as String?)
          ?.let(SpotProvisioningAllocationStrategy.fromString),
      blockDurationMinutes: json['BlockDurationMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutAction = this.timeoutAction;
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    final allocationStrategy = this.allocationStrategy;
    final blockDurationMinutes = this.blockDurationMinutes;
    return {
      'TimeoutAction': timeoutAction.value,
      'TimeoutDurationMinutes': timeoutDurationMinutes,
      if (allocationStrategy != null)
        'AllocationStrategy': allocationStrategy.value,
      if (blockDurationMinutes != null)
        'BlockDurationMinutes': blockDurationMinutes,
    };
  }
}

/// The launch specification for On-Demand Instances in the instance fleet,
/// which determines the allocation strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
/// strategy is available in Amazon EMR releases 5.12.1 and later.
/// </note>
///
/// @nodoc
class OnDemandProvisioningSpecification {
  /// Specifies the strategy to use in launching On-Demand instance fleets.
  /// Available options are <code>lowest-price</code> and
  /// <code>prioritized</code>. <code>lowest-price</code> specifies to launch the
  /// instances with the lowest price first, and <code>prioritized</code>
  /// specifies that Amazon EMR should launch the instances with the highest
  /// priority first. The default is <code>lowest-price</code>.
  final OnDemandProvisioningAllocationStrategy allocationStrategy;

  /// The launch specification for On-Demand instances in the instance fleet,
  /// which determines the allocation strategy.
  final OnDemandCapacityReservationOptions? capacityReservationOptions;

  OnDemandProvisioningSpecification({
    required this.allocationStrategy,
    this.capacityReservationOptions,
  });

  factory OnDemandProvisioningSpecification.fromJson(
      Map<String, dynamic> json) {
    return OnDemandProvisioningSpecification(
      allocationStrategy: OnDemandProvisioningAllocationStrategy.fromString(
          (json['AllocationStrategy'] as String?) ?? ''),
      capacityReservationOptions: json['CapacityReservationOptions'] != null
          ? OnDemandCapacityReservationOptions.fromJson(
              json['CapacityReservationOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationStrategy = this.allocationStrategy;
    final capacityReservationOptions = this.capacityReservationOptions;
    return {
      'AllocationStrategy': allocationStrategy.value,
      if (capacityReservationOptions != null)
        'CapacityReservationOptions': capacityReservationOptions,
    };
  }
}

/// @nodoc
class SpotProvisioningTimeoutAction {
  static const switchToOnDemand =
      SpotProvisioningTimeoutAction._('SWITCH_TO_ON_DEMAND');
  static const terminateCluster =
      SpotProvisioningTimeoutAction._('TERMINATE_CLUSTER');

  final String value;

  const SpotProvisioningTimeoutAction._(this.value);

  static const values = [switchToOnDemand, terminateCluster];

  static SpotProvisioningTimeoutAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpotProvisioningTimeoutAction._(value));

  @override
  bool operator ==(other) =>
      other is SpotProvisioningTimeoutAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An instance type configuration for each instance type in an instance fleet,
/// which determines the Amazon EC2 instances Amazon EMR attempts to provision
/// to fulfill On-Demand and Spot target capacities. When you use an allocation
/// strategy, you can include a maximum of 30 instance type configurations for a
/// fleet. For more information about how to use an allocation strategy, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html">Configure
/// Instance Fleets</a>. Without an allocation strategy, you may specify a
/// maximum of five instance type configurations for a fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceTypeConfig {
  /// An Amazon EC2 instance type, such as <code>m3.xlarge</code>.
  final String instanceType;

  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  final String? bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot
  /// Instance as defined by <code>InstanceType</code>. Expressed as a number (for
  /// example, 20 specifies 20%). If neither <code>BidPrice</code> nor
  /// <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided,
  /// <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.
  final double? bidPriceAsPercentageOfOnDemandPrice;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// that run on the cluster.
  final List<Configuration>? configurations;

  /// The custom AMI ID to use for the instance type.
  final String? customAmiId;

  /// The configuration of Amazon Elastic Block Store (Amazon EBS) attached to
  /// each instance as defined by <code>InstanceType</code>.
  final EbsConfiguration? ebsConfiguration;

  /// The priority at which Amazon EMR launches the Amazon EC2 instances with this
  /// instance type. Priority starts at 0, which is the highest priority. Amazon
  /// EMR considers the highest priority first.
  final double? priority;

  /// The number of units that a provisioned instance of this type provides toward
  /// fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. This
  /// value is 1 for a master instance fleet, and must be 1 or greater for core
  /// and task instance fleets. Defaults to 1 if not specified.
  final int? weightedCapacity;

  InstanceTypeConfig({
    required this.instanceType,
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.configurations,
    this.customAmiId,
    this.ebsConfiguration,
    this.priority,
    this.weightedCapacity,
  });

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final bidPrice = this.bidPrice;
    final bidPriceAsPercentageOfOnDemandPrice =
        this.bidPriceAsPercentageOfOnDemandPrice;
    final configurations = this.configurations;
    final customAmiId = this.customAmiId;
    final ebsConfiguration = this.ebsConfiguration;
    final priority = this.priority;
    final weightedCapacity = this.weightedCapacity;
    return {
      'InstanceType': instanceType,
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (bidPriceAsPercentageOfOnDemandPrice != null)
        'BidPriceAsPercentageOfOnDemandPrice':
            bidPriceAsPercentageOfOnDemandPrice,
      if (configurations != null) 'Configurations': configurations,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsConfiguration != null) 'EbsConfiguration': ebsConfiguration,
      if (priority != null) 'Priority': priority,
      if (weightedCapacity != null) 'WeightedCapacity': weightedCapacity,
    };
  }
}

/// The Amazon EBS configuration of a cluster instance.
///
/// @nodoc
class EbsConfiguration {
  /// An array of Amazon EBS volume specifications attached to a cluster instance.
  final List<EbsBlockDeviceConfig>? ebsBlockDeviceConfigs;

  /// Indicates whether an Amazon EBS volume is EBS-optimized. The default is
  /// false. You should explicitly set this value to true to enable the Amazon
  /// EBS-optimized setting for an EC2 instance.
  final bool? ebsOptimized;

  EbsConfiguration({
    this.ebsBlockDeviceConfigs,
    this.ebsOptimized,
  });

  Map<String, dynamic> toJson() {
    final ebsBlockDeviceConfigs = this.ebsBlockDeviceConfigs;
    final ebsOptimized = this.ebsOptimized;
    return {
      if (ebsBlockDeviceConfigs != null)
        'EbsBlockDeviceConfigs': ebsBlockDeviceConfigs,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
    };
  }
}

/// Configuration of requested EBS block device associated with the instance
/// group with count of volumes that are associated to every instance.
///
/// @nodoc
class EbsBlockDeviceConfig {
  /// EBS volume specifications such as volume type, IOPS, size (GiB) and
  /// throughput (MiB/s) that are requested for the EBS volume attached to an
  /// Amazon EC2 instance in the cluster.
  final VolumeSpecification volumeSpecification;

  /// Number of EBS volumes with a specific volume configuration that are
  /// associated with every instance in the instance group
  final int? volumesPerInstance;

  EbsBlockDeviceConfig({
    required this.volumeSpecification,
    this.volumesPerInstance,
  });

  Map<String, dynamic> toJson() {
    final volumeSpecification = this.volumeSpecification;
    final volumesPerInstance = this.volumesPerInstance;
    return {
      'VolumeSpecification': volumeSpecification,
      if (volumesPerInstance != null) 'VolumesPerInstance': volumesPerInstance,
    };
  }
}

/// EBS volume specifications such as volume type, IOPS, size (GiB) and
/// throughput (MiB/s) that are requested for the EBS volume attached to an
/// Amazon EC2 instance in the cluster.
///
/// @nodoc
class VolumeSpecification {
  /// The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If
  /// the volume type is EBS-optimized, the minimum value is 10.
  final int sizeInGB;

  /// The volume type. Volume types supported are gp3, gp2, io1, st1, sc1, and
  /// standard.
  final String volumeType;

  /// The number of I/O operations per second (IOPS) that the volume supports.
  final int? iops;

  /// The throughput, in mebibyte per second (MiB/s). This optional parameter can
  /// be a number from 125 - 1000 and is valid only for gp3 volumes.
  final int? throughput;

  VolumeSpecification({
    required this.sizeInGB,
    required this.volumeType,
    this.iops,
    this.throughput,
  });

  factory VolumeSpecification.fromJson(Map<String, dynamic> json) {
    return VolumeSpecification(
      sizeInGB: (json['SizeInGB'] as int?) ?? 0,
      volumeType: (json['VolumeType'] as String?) ?? '',
      iops: json['Iops'] as int?,
      throughput: json['Throughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGB = this.sizeInGB;
    final volumeType = this.volumeType;
    final iops = this.iops;
    final throughput = this.throughput;
    return {
      'SizeInGB': sizeInGB,
      'VolumeType': volumeType,
      if (iops != null) 'Iops': iops,
      if (throughput != null) 'Throughput': throughput,
    };
  }
}

/// Configuration defining a new instance group.
///
/// @nodoc
class InstanceGroupConfig {
  /// Target number of instances for the instance group.
  final int instanceCount;

  /// The role of the instance group in the cluster.
  final InstanceRoleType instanceRole;

  /// The Amazon EC2 instance type for all instances in the instance group.
  final String instanceType;

  /// An automatic scaling policy for a core instance group or task instance group
  /// in an Amazon EMR cluster. The automatic scaling policy defines how an
  /// instance group dynamically adds and terminates Amazon EC2 instances in
  /// response to the value of a CloudWatch metric. See
  /// <a>PutAutoScalingPolicy</a>.
  final AutoScalingPolicy? autoScalingPolicy;

  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  final String? bidPrice;

  /// <note>
  /// Amazon EMR releases 4.x or later.
  /// </note>
  /// The list of configurations supplied for an Amazon EMR cluster instance
  /// group. You can specify a separate configuration for each instance group
  /// (master, core, and task).
  final List<Configuration>? configurations;

  /// The custom AMI ID to use for the provisioned instance group.
  final String? customAmiId;

  /// EBS configurations that will be attached to each Amazon EC2 instance in the
  /// instance group.
  final EbsConfiguration? ebsConfiguration;

  /// Market type of the Amazon EC2 instances used to create a cluster node.
  final MarketType? market;

  /// Friendly name given to the instance group.
  final String? name;

  InstanceGroupConfig({
    required this.instanceCount,
    required this.instanceRole,
    required this.instanceType,
    this.autoScalingPolicy,
    this.bidPrice,
    this.configurations,
    this.customAmiId,
    this.ebsConfiguration,
    this.market,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final instanceCount = this.instanceCount;
    final instanceRole = this.instanceRole;
    final instanceType = this.instanceType;
    final autoScalingPolicy = this.autoScalingPolicy;
    final bidPrice = this.bidPrice;
    final configurations = this.configurations;
    final customAmiId = this.customAmiId;
    final ebsConfiguration = this.ebsConfiguration;
    final market = this.market;
    final name = this.name;
    return {
      'InstanceCount': instanceCount,
      'InstanceRole': instanceRole.value,
      'InstanceType': instanceType,
      if (autoScalingPolicy != null) 'AutoScalingPolicy': autoScalingPolicy,
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (configurations != null) 'Configurations': configurations,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsConfiguration != null) 'EbsConfiguration': ebsConfiguration,
      if (market != null) 'Market': market.value,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class MarketType {
  static const onDemand = MarketType._('ON_DEMAND');
  static const spot = MarketType._('SPOT');

  final String value;

  const MarketType._(this.value);

  static const values = [onDemand, spot];

  static MarketType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MarketType._(value));

  @override
  bool operator ==(other) => other is MarketType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. An automatic scaling policy defines how an
/// instance group dynamically adds and terminates Amazon EC2 instances in
/// response to the value of a CloudWatch metric. See
/// <a>PutAutoScalingPolicy</a>.
///
/// @nodoc
class AutoScalingPolicy {
  /// The upper and lower Amazon EC2 instance limits for an automatic scaling
  /// policy. Automatic scaling activity will not cause an instance group to grow
  /// above or below these limits.
  final ScalingConstraints constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling policy.
  final List<ScalingRule> rules;

  AutoScalingPolicy({
    required this.constraints,
    required this.rules,
  });

  Map<String, dynamic> toJson() {
    final constraints = this.constraints;
    final rules = this.rules;
    return {
      'Constraints': constraints,
      'Rules': rules,
    };
  }
}

/// The upper and lower Amazon EC2 instance limits for an automatic scaling
/// policy. Automatic scaling activities triggered by automatic scaling rules
/// will not cause an instance group to grow above or below these limits.
///
/// @nodoc
class ScalingConstraints {
  /// The upper boundary of Amazon EC2 instances in an instance group beyond which
  /// scaling activities are not allowed to grow. Scale-out activities will not
  /// add instances beyond this boundary.
  final int maxCapacity;

  /// The lower boundary of Amazon EC2 instances in an instance group below which
  /// scaling activities are not allowed to shrink. Scale-in activities will not
  /// terminate instances below this boundary.
  final int minCapacity;

  ScalingConstraints({
    required this.maxCapacity,
    required this.minCapacity,
  });

  factory ScalingConstraints.fromJson(Map<String, dynamic> json) {
    return ScalingConstraints(
      maxCapacity: (json['MaxCapacity'] as int?) ?? 0,
      minCapacity: (json['MinCapacity'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    return {
      'MaxCapacity': maxCapacity,
      'MinCapacity': minCapacity,
    };
  }
}

/// A scale-in or scale-out rule that defines scaling activity, including the
/// CloudWatch metric alarm that triggers activity, how Amazon EC2 instances are
/// added or removed, and the periodicity of adjustments. The automatic scaling
/// policy for an instance group can comprise one or more automatic scaling
/// rules.
///
/// @nodoc
class ScalingRule {
  /// The conditions that trigger an automatic scaling activity.
  final ScalingAction action;

  /// The name used to identify an automatic scaling rule. Rule names must be
  /// unique within a scaling policy.
  final String name;

  /// The CloudWatch alarm definition that determines when automatic scaling
  /// activity is triggered.
  final ScalingTrigger trigger;

  /// A friendly, more verbose description of the automatic scaling rule.
  final String? description;

  ScalingRule({
    required this.action,
    required this.name,
    required this.trigger,
    this.description,
  });

  factory ScalingRule.fromJson(Map<String, dynamic> json) {
    return ScalingRule(
      action: ScalingAction.fromJson(
          (json['Action'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['Name'] as String?) ?? '',
      trigger: ScalingTrigger.fromJson(
          (json['Trigger'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final trigger = this.trigger;
    final description = this.description;
    return {
      'Action': action,
      'Name': name,
      'Trigger': trigger,
      if (description != null) 'Description': description,
    };
  }
}

/// The type of adjustment the automatic scaling activity makes when triggered,
/// and the periodicity of the adjustment.
///
/// @nodoc
class ScalingAction {
  /// The type of adjustment the automatic scaling activity makes when triggered,
  /// and the periodicity of the adjustment.
  final SimpleScalingPolicyConfiguration simpleScalingPolicyConfiguration;

  /// Not available for instance groups. Instance groups use the market type
  /// specified for the group.
  final MarketType? market;

  ScalingAction({
    required this.simpleScalingPolicyConfiguration,
    this.market,
  });

  factory ScalingAction.fromJson(Map<String, dynamic> json) {
    return ScalingAction(
      simpleScalingPolicyConfiguration:
          SimpleScalingPolicyConfiguration.fromJson(
              (json['SimpleScalingPolicyConfiguration']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      market: (json['Market'] as String?)?.let(MarketType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final simpleScalingPolicyConfiguration =
        this.simpleScalingPolicyConfiguration;
    final market = this.market;
    return {
      'SimpleScalingPolicyConfiguration': simpleScalingPolicyConfiguration,
      if (market != null) 'Market': market.value,
    };
  }
}

/// The conditions that trigger an automatic scaling activity.
///
/// @nodoc
class ScalingTrigger {
  /// The definition of a CloudWatch metric alarm. When the defined alarm
  /// conditions are met along with other trigger parameters, scaling activity
  /// begins.
  final CloudWatchAlarmDefinition cloudWatchAlarmDefinition;

  ScalingTrigger({
    required this.cloudWatchAlarmDefinition,
  });

  factory ScalingTrigger.fromJson(Map<String, dynamic> json) {
    return ScalingTrigger(
      cloudWatchAlarmDefinition: CloudWatchAlarmDefinition.fromJson(
          (json['CloudWatchAlarmDefinition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchAlarmDefinition = this.cloudWatchAlarmDefinition;
    return {
      'CloudWatchAlarmDefinition': cloudWatchAlarmDefinition,
    };
  }
}

/// The definition of a CloudWatch metric alarm, which determines when an
/// automatic scaling activity is triggered. When the defined alarm conditions
/// are satisfied, scaling activity begins.
///
/// @nodoc
class CloudWatchAlarmDefinition {
  /// Determines how the metric specified by <code>MetricName</code> is compared
  /// to the value specified by <code>Threshold</code>.
  final ComparisonOperator comparisonOperator;

  /// The name of the CloudWatch metric that is watched to determine an alarm
  /// condition.
  final String metricName;

  /// The period, in seconds, over which the statistic is applied. CloudWatch
  /// metrics for Amazon EMR are emitted every five minutes (300 seconds), so if
  /// you specify a CloudWatch metric, specify <code>300</code>.
  final int period;

  /// The value against which the specified statistic is compared.
  final double threshold;

  /// A CloudWatch metric dimension.
  final List<MetricDimension>? dimensions;

  /// The number of periods, in five-minute increments, during which the alarm
  /// condition must exist before the alarm triggers automatic scaling activity.
  /// The default value is <code>1</code>.
  final int? evaluationPeriods;

  /// The namespace for the CloudWatch metric. The default is
  /// <code>AWS/ElasticMapReduce</code>.
  final String? namespace;

  /// The statistic to apply to the metric associated with the alarm. The default
  /// is <code>AVERAGE</code>.
  final Statistic? statistic;

  /// The unit of measure associated with the CloudWatch metric being watched. The
  /// value specified for <code>Unit</code> must correspond to the units specified
  /// in the CloudWatch metric.
  final Unit? unit;

  CloudWatchAlarmDefinition({
    required this.comparisonOperator,
    required this.metricName,
    required this.period,
    required this.threshold,
    this.dimensions,
    this.evaluationPeriods,
    this.namespace,
    this.statistic,
    this.unit,
  });

  factory CloudWatchAlarmDefinition.fromJson(Map<String, dynamic> json) {
    return CloudWatchAlarmDefinition(
      comparisonOperator: ComparisonOperator.fromString(
          (json['ComparisonOperator'] as String?) ?? ''),
      metricName: (json['MetricName'] as String?) ?? '',
      period: (json['Period'] as int?) ?? 0,
      threshold: (json['Threshold'] as double?) ?? 0,
      dimensions: (json['Dimensions'] as List?)
          ?.nonNulls
          .map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluationPeriods: json['EvaluationPeriods'] as int?,
      namespace: json['Namespace'] as String?,
      statistic: (json['Statistic'] as String?)?.let(Statistic.fromString),
      unit: (json['Unit'] as String?)?.let(Unit.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final metricName = this.metricName;
    final period = this.period;
    final threshold = this.threshold;
    final dimensions = this.dimensions;
    final evaluationPeriods = this.evaluationPeriods;
    final namespace = this.namespace;
    final statistic = this.statistic;
    final unit = this.unit;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'MetricName': metricName,
      'Period': period,
      'Threshold': threshold,
      if (dimensions != null) 'Dimensions': dimensions,
      if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
      if (namespace != null) 'Namespace': namespace,
      if (statistic != null) 'Statistic': statistic.value,
      if (unit != null) 'Unit': unit.value,
    };
  }
}

/// @nodoc
class ComparisonOperator {
  static const greaterThanOrEqual =
      ComparisonOperator._('GREATER_THAN_OR_EQUAL');
  static const greaterThan = ComparisonOperator._('GREATER_THAN');
  static const lessThan = ComparisonOperator._('LESS_THAN');
  static const lessThanOrEqual = ComparisonOperator._('LESS_THAN_OR_EQUAL');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [
    greaterThanOrEqual,
    greaterThan,
    lessThan,
    lessThanOrEqual
  ];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Statistic {
  static const sampleCount = Statistic._('SAMPLE_COUNT');
  static const average = Statistic._('AVERAGE');
  static const sum = Statistic._('SUM');
  static const minimum = Statistic._('MINIMUM');
  static const maximum = Statistic._('MAXIMUM');

  final String value;

  const Statistic._(this.value);

  static const values = [sampleCount, average, sum, minimum, maximum];

  static Statistic fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Statistic._(value));

  @override
  bool operator ==(other) => other is Statistic && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Unit {
  static const none = Unit._('NONE');
  static const seconds = Unit._('SECONDS');
  static const microSeconds = Unit._('MICRO_SECONDS');
  static const milliSeconds = Unit._('MILLI_SECONDS');
  static const bytes = Unit._('BYTES');
  static const kiloBytes = Unit._('KILO_BYTES');
  static const megaBytes = Unit._('MEGA_BYTES');
  static const gigaBytes = Unit._('GIGA_BYTES');
  static const teraBytes = Unit._('TERA_BYTES');
  static const bits = Unit._('BITS');
  static const kiloBits = Unit._('KILO_BITS');
  static const megaBits = Unit._('MEGA_BITS');
  static const gigaBits = Unit._('GIGA_BITS');
  static const teraBits = Unit._('TERA_BITS');
  static const percent = Unit._('PERCENT');
  static const count = Unit._('COUNT');
  static const bytesPerSecond = Unit._('BYTES_PER_SECOND');
  static const kiloBytesPerSecond = Unit._('KILO_BYTES_PER_SECOND');
  static const megaBytesPerSecond = Unit._('MEGA_BYTES_PER_SECOND');
  static const gigaBytesPerSecond = Unit._('GIGA_BYTES_PER_SECOND');
  static const teraBytesPerSecond = Unit._('TERA_BYTES_PER_SECOND');
  static const bitsPerSecond = Unit._('BITS_PER_SECOND');
  static const kiloBitsPerSecond = Unit._('KILO_BITS_PER_SECOND');
  static const megaBitsPerSecond = Unit._('MEGA_BITS_PER_SECOND');
  static const gigaBitsPerSecond = Unit._('GIGA_BITS_PER_SECOND');
  static const teraBitsPerSecond = Unit._('TERA_BITS_PER_SECOND');
  static const countPerSecond = Unit._('COUNT_PER_SECOND');

  final String value;

  const Unit._(this.value);

  static const values = [
    none,
    seconds,
    microSeconds,
    milliSeconds,
    bytes,
    kiloBytes,
    megaBytes,
    gigaBytes,
    teraBytes,
    bits,
    kiloBits,
    megaBits,
    gigaBits,
    teraBits,
    percent,
    count,
    bytesPerSecond,
    kiloBytesPerSecond,
    megaBytesPerSecond,
    gigaBytesPerSecond,
    teraBytesPerSecond,
    bitsPerSecond,
    kiloBitsPerSecond,
    megaBitsPerSecond,
    gigaBitsPerSecond,
    teraBitsPerSecond,
    countPerSecond
  ];

  static Unit fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Unit._(value));

  @override
  bool operator ==(other) => other is Unit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A CloudWatch dimension, which is specified using a <code>Key</code> (known
/// as a <code>Name</code> in CloudWatch), <code>Value</code> pair. By default,
/// Amazon EMR uses one dimension whose <code>Key</code> is
/// <code>JobFlowID</code> and <code>Value</code> is a variable representing the
/// cluster ID, which is <code>${emr.clusterId}</code>. This enables the rule to
/// bootstrap when the cluster ID becomes available.
///
/// @nodoc
class MetricDimension {
  /// The dimension name.
  final String? key;

  /// The dimension value.
  final String? value;

  MetricDimension({
    this.key,
    this.value,
  });

  factory MetricDimension.fromJson(Map<String, dynamic> json) {
    return MetricDimension(
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

/// An automatic scaling configuration, which describes how the policy adds or
/// removes instances, the cooldown period, and the number of Amazon EC2
/// instances that will be added each time the CloudWatch metric alarm condition
/// is satisfied.
///
/// @nodoc
class SimpleScalingPolicyConfiguration {
  /// The amount by which to scale in or scale out, based on the specified
  /// <code>AdjustmentType</code>. A positive value adds to the instance group's
  /// Amazon EC2 instance count while a negative number removes instances. If
  /// <code>AdjustmentType</code> is set to <code>EXACT_CAPACITY</code>, the
  /// number should only be a positive integer. If <code>AdjustmentType</code> is
  /// set to <code>PERCENT_CHANGE_IN_CAPACITY</code>, the value should express the
  /// percentage as an integer. For example, -20 indicates a decrease in 20%
  /// increments of cluster capacity.
  final int scalingAdjustment;

  /// The way in which Amazon EC2 instances are added (if
  /// <code>ScalingAdjustment</code> is a positive number) or terminated (if
  /// <code>ScalingAdjustment</code> is a negative number) each time the scaling
  /// activity is triggered. <code>CHANGE_IN_CAPACITY</code> is the default.
  /// <code>CHANGE_IN_CAPACITY</code> indicates that the Amazon EC2 instance count
  /// increments or decrements by <code>ScalingAdjustment</code>, which should be
  /// expressed as an integer. <code>PERCENT_CHANGE_IN_CAPACITY</code> indicates
  /// the instance count increments or decrements by the percentage specified by
  /// <code>ScalingAdjustment</code>, which should be expressed as an integer. For
  /// example, 20 indicates an increase in 20% increments of cluster capacity.
  /// <code>EXACT_CAPACITY</code> indicates the scaling activity results in an
  /// instance group with the number of Amazon EC2 instances specified by
  /// <code>ScalingAdjustment</code>, which should be expressed as a positive
  /// integer.
  final AdjustmentType? adjustmentType;

  /// The amount of time, in seconds, after a scaling activity completes before
  /// any further trigger-related scaling activities can start. The default value
  /// is 0.
  final int? coolDown;

  SimpleScalingPolicyConfiguration({
    required this.scalingAdjustment,
    this.adjustmentType,
    this.coolDown,
  });

  factory SimpleScalingPolicyConfiguration.fromJson(Map<String, dynamic> json) {
    return SimpleScalingPolicyConfiguration(
      scalingAdjustment: (json['ScalingAdjustment'] as int?) ?? 0,
      adjustmentType:
          (json['AdjustmentType'] as String?)?.let(AdjustmentType.fromString),
      coolDown: json['CoolDown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scalingAdjustment = this.scalingAdjustment;
    final adjustmentType = this.adjustmentType;
    final coolDown = this.coolDown;
    return {
      'ScalingAdjustment': scalingAdjustment,
      if (adjustmentType != null) 'AdjustmentType': adjustmentType.value,
      if (coolDown != null) 'CoolDown': coolDown,
    };
  }
}

/// @nodoc
class AdjustmentType {
  static const changeInCapacity = AdjustmentType._('CHANGE_IN_CAPACITY');
  static const percentChangeInCapacity =
      AdjustmentType._('PERCENT_CHANGE_IN_CAPACITY');
  static const exactCapacity = AdjustmentType._('EXACT_CAPACITY');

  final String value;

  const AdjustmentType._(this.value);

  static const values = [
    changeInCapacity,
    percentChangeInCapacity,
    exactCapacity
  ];

  static AdjustmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdjustmentType._(value));

  @override
  bool operator ==(other) => other is AdjustmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A configuration for Amazon EMR block public access. When
/// <code>BlockPublicSecurityGroupRules</code> is set to <code>true</code>,
/// Amazon EMR prevents cluster creation if one of the cluster's security groups
/// has a rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port,
/// unless the port is specified as an exception using
/// <code>PermittedPublicSecurityGroupRuleRanges</code>.
///
/// @nodoc
class BlockPublicAccessConfiguration {
  /// Indicates whether Amazon EMR block public access is enabled
  /// (<code>true</code>) or disabled (<code>false</code>). By default, the value
  /// is <code>false</code> for accounts that have created Amazon EMR clusters
  /// before July 2019. For accounts created after this, the default is
  /// <code>true</code>.
  final bool blockPublicSecurityGroupRules;

  /// The classification within a configuration.
  final String? classification;

  /// A list of additional configurations to apply within a configuration object.
  final List<Configuration>? configurations;

  /// Specifies ports and port ranges that are permitted to have security group
  /// rules that allow inbound traffic from all public sources. For example, if
  /// Port 23 (Telnet) is specified for
  /// <code>PermittedPublicSecurityGroupRuleRanges</code>, Amazon EMR allows
  /// cluster creation if a security group associated with the cluster has a rule
  /// that allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0
  /// as the source.
  ///
  /// By default, Port 22, which is used for SSH access to the cluster Amazon EC2
  /// instances, is in the list of
  /// <code>PermittedPublicSecurityGroupRuleRanges</code>.
  final List<PortRange>? permittedPublicSecurityGroupRuleRanges;

  /// A set of properties specified within a configuration classification.
  final Map<String, String>? properties;

  BlockPublicAccessConfiguration({
    required this.blockPublicSecurityGroupRules,
    this.classification,
    this.configurations,
    this.permittedPublicSecurityGroupRuleRanges,
    this.properties,
  });

  factory BlockPublicAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return BlockPublicAccessConfiguration(
      blockPublicSecurityGroupRules:
          (json['BlockPublicSecurityGroupRules'] as bool?) ?? false,
      classification: json['Classification'] as String?,
      configurations: (json['Configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      permittedPublicSecurityGroupRuleRanges:
          (json['PermittedPublicSecurityGroupRuleRanges'] as List?)
              ?.nonNulls
              .map((e) => PortRange.fromJson(e as Map<String, dynamic>))
              .toList(),
      properties: (json['Properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicSecurityGroupRules = this.blockPublicSecurityGroupRules;
    final classification = this.classification;
    final configurations = this.configurations;
    final permittedPublicSecurityGroupRuleRanges =
        this.permittedPublicSecurityGroupRuleRanges;
    final properties = this.properties;
    return {
      'BlockPublicSecurityGroupRules': blockPublicSecurityGroupRules,
      if (classification != null) 'Classification': classification,
      if (configurations != null) 'Configurations': configurations,
      if (permittedPublicSecurityGroupRuleRanges != null)
        'PermittedPublicSecurityGroupRuleRanges':
            permittedPublicSecurityGroupRuleRanges,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// A list of port ranges that are permitted to allow inbound traffic from all
/// public IP addresses. To specify a single port, use the same value for
/// <code>MinRange</code> and <code>MaxRange</code>.
///
/// @nodoc
class PortRange {
  /// The smallest port number in a specified range of port numbers.
  final int minRange;

  /// The smallest port number in a specified range of port numbers.
  final int? maxRange;

  PortRange({
    required this.minRange,
    this.maxRange,
  });

  factory PortRange.fromJson(Map<String, dynamic> json) {
    return PortRange(
      minRange: (json['MinRange'] as int?) ?? 0,
      maxRange: json['MaxRange'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final minRange = this.minRange;
    final maxRange = this.maxRange;
    return {
      'MinRange': minRange,
      if (maxRange != null) 'MaxRange': maxRange,
    };
  }
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. The automatic scaling policy defines how an
/// instance group dynamically adds and terminates Amazon EC2 instances in
/// response to the value of a CloudWatch metric. See
/// <a>PutAutoScalingPolicy</a>.
///
/// @nodoc
class AutoScalingPolicyDescription {
  /// The upper and lower Amazon EC2 instance limits for an automatic scaling
  /// policy. Automatic scaling activity will not cause an instance group to grow
  /// above or below these limits.
  final ScalingConstraints? constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling policy.
  final List<ScalingRule>? rules;

  /// The status of an automatic scaling policy.
  final AutoScalingPolicyStatus? status;

  AutoScalingPolicyDescription({
    this.constraints,
    this.rules,
    this.status,
  });

  factory AutoScalingPolicyDescription.fromJson(Map<String, dynamic> json) {
    return AutoScalingPolicyDescription(
      constraints: json['Constraints'] != null
          ? ScalingConstraints.fromJson(
              json['Constraints'] as Map<String, dynamic>)
          : null,
      rules: (json['Rules'] as List?)
          ?.nonNulls
          .map((e) => ScalingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['Status'] != null
          ? AutoScalingPolicyStatus.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final constraints = this.constraints;
    final rules = this.rules;
    final status = this.status;
    return {
      if (constraints != null) 'Constraints': constraints,
      if (rules != null) 'Rules': rules,
      if (status != null) 'Status': status,
    };
  }
}

/// The status of an automatic scaling policy.
///
/// @nodoc
class AutoScalingPolicyStatus {
  /// Indicates the status of the automatic scaling policy.
  final AutoScalingPolicyState? state;

  /// The reason for a change in status.
  final AutoScalingPolicyStateChangeReason? stateChangeReason;

  AutoScalingPolicyStatus({
    this.state,
    this.stateChangeReason,
  });

  factory AutoScalingPolicyStatus.fromJson(Map<String, dynamic> json) {
    return AutoScalingPolicyStatus(
      state: (json['State'] as String?)?.let(AutoScalingPolicyState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? AutoScalingPolicyStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    return {
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
    };
  }
}

/// @nodoc
class AutoScalingPolicyState {
  static const pending = AutoScalingPolicyState._('PENDING');
  static const attaching = AutoScalingPolicyState._('ATTACHING');
  static const attached = AutoScalingPolicyState._('ATTACHED');
  static const detaching = AutoScalingPolicyState._('DETACHING');
  static const detached = AutoScalingPolicyState._('DETACHED');
  static const failed = AutoScalingPolicyState._('FAILED');

  final String value;

  const AutoScalingPolicyState._(this.value);

  static const values = [
    pending,
    attaching,
    attached,
    detaching,
    detached,
    failed
  ];

  static AutoScalingPolicyState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoScalingPolicyState._(value));

  @override
  bool operator ==(other) =>
      other is AutoScalingPolicyState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The reason for an <a>AutoScalingPolicyStatus</a> change.
///
/// @nodoc
class AutoScalingPolicyStateChangeReason {
  /// The code indicating the reason for the change in
  /// status.<code>USER_REQUEST</code> indicates that the scaling policy status
  /// was changed by a user. <code>PROVISION_FAILURE</code> indicates that the
  /// status change was because the policy failed to provision.
  /// <code>CLEANUP_FAILURE</code> indicates an error.
  final AutoScalingPolicyStateChangeReasonCode? code;

  /// A friendly, more verbose message that accompanies an automatic scaling
  /// policy state change.
  final String? message;

  AutoScalingPolicyStateChangeReason({
    this.code,
    this.message,
  });

  factory AutoScalingPolicyStateChangeReason.fromJson(
      Map<String, dynamic> json) {
    return AutoScalingPolicyStateChangeReason(
      code: (json['Code'] as String?)
          ?.let(AutoScalingPolicyStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class AutoScalingPolicyStateChangeReasonCode {
  static const userRequest =
      AutoScalingPolicyStateChangeReasonCode._('USER_REQUEST');
  static const provisionFailure =
      AutoScalingPolicyStateChangeReasonCode._('PROVISION_FAILURE');
  static const cleanupFailure =
      AutoScalingPolicyStateChangeReasonCode._('CLEANUP_FAILURE');

  final String value;

  const AutoScalingPolicyStateChangeReasonCode._(this.value);

  static const values = [userRequest, provisionFailure, cleanupFailure];

  static AutoScalingPolicyStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoScalingPolicyStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is AutoScalingPolicyStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Modify the size or configurations of an instance group.
///
/// @nodoc
class InstanceGroupModifyConfig {
  /// Unique ID of the instance group to modify.
  final String instanceGroupId;

  /// A list of new or modified configurations to apply for an instance group.
  final List<Configuration>? configurations;

  /// The Amazon EC2 InstanceIds to terminate. After you terminate the instances,
  /// the instance group will not return to its original requested size.
  final List<String>? eC2InstanceIdsToTerminate;

  /// Target size for the instance group.
  final int? instanceCount;

  /// Type of reconfiguration requested. Valid values are MERGE and OVERWRITE.
  final ReconfigurationType? reconfigurationType;

  /// Policy for customizing shrink operations.
  final ShrinkPolicy? shrinkPolicy;

  InstanceGroupModifyConfig({
    required this.instanceGroupId,
    this.configurations,
    this.eC2InstanceIdsToTerminate,
    this.instanceCount,
    this.reconfigurationType,
    this.shrinkPolicy,
  });

  Map<String, dynamic> toJson() {
    final instanceGroupId = this.instanceGroupId;
    final configurations = this.configurations;
    final eC2InstanceIdsToTerminate = this.eC2InstanceIdsToTerminate;
    final instanceCount = this.instanceCount;
    final reconfigurationType = this.reconfigurationType;
    final shrinkPolicy = this.shrinkPolicy;
    return {
      'InstanceGroupId': instanceGroupId,
      if (configurations != null) 'Configurations': configurations,
      if (eC2InstanceIdsToTerminate != null)
        'EC2InstanceIdsToTerminate': eC2InstanceIdsToTerminate,
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (reconfigurationType != null)
        'ReconfigurationType': reconfigurationType.value,
      if (shrinkPolicy != null) 'ShrinkPolicy': shrinkPolicy,
    };
  }
}

/// Policy for customizing shrink operations. Allows configuration of
/// decommissioning timeout and targeted instance shrinking.
///
/// @nodoc
class ShrinkPolicy {
  /// The desired timeout for decommissioning an instance. Overrides the default
  /// YARN decommissioning timeout.
  final int? decommissionTimeout;

  /// Custom policy for requesting termination protection or termination of
  /// specific instances when shrinking an instance group.
  final InstanceResizePolicy? instanceResizePolicy;

  ShrinkPolicy({
    this.decommissionTimeout,
    this.instanceResizePolicy,
  });

  factory ShrinkPolicy.fromJson(Map<String, dynamic> json) {
    return ShrinkPolicy(
      decommissionTimeout: json['DecommissionTimeout'] as int?,
      instanceResizePolicy: json['InstanceResizePolicy'] != null
          ? InstanceResizePolicy.fromJson(
              json['InstanceResizePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final decommissionTimeout = this.decommissionTimeout;
    final instanceResizePolicy = this.instanceResizePolicy;
    return {
      if (decommissionTimeout != null)
        'DecommissionTimeout': decommissionTimeout,
      if (instanceResizePolicy != null)
        'InstanceResizePolicy': instanceResizePolicy,
    };
  }
}

/// @nodoc
class ReconfigurationType {
  static const overwrite = ReconfigurationType._('OVERWRITE');
  static const merge = ReconfigurationType._('MERGE');

  final String value;

  const ReconfigurationType._(this.value);

  static const values = [overwrite, merge];

  static ReconfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReconfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is ReconfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Custom policy for requesting termination protection or termination of
/// specific instances when shrinking an instance group.
///
/// @nodoc
class InstanceResizePolicy {
  /// Decommissioning timeout override for the specific list of instances to be
  /// terminated.
  final int? instanceTerminationTimeout;

  /// Specific list of instances to be protected when shrinking an instance group.
  final List<String>? instancesToProtect;

  /// Specific list of instances to be terminated when shrinking an instance
  /// group.
  final List<String>? instancesToTerminate;

  InstanceResizePolicy({
    this.instanceTerminationTimeout,
    this.instancesToProtect,
    this.instancesToTerminate,
  });

  factory InstanceResizePolicy.fromJson(Map<String, dynamic> json) {
    return InstanceResizePolicy(
      instanceTerminationTimeout: json['InstanceTerminationTimeout'] as int?,
      instancesToProtect: (json['InstancesToProtect'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      instancesToTerminate: (json['InstancesToTerminate'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTerminationTimeout = this.instanceTerminationTimeout;
    final instancesToProtect = this.instancesToProtect;
    final instancesToTerminate = this.instancesToTerminate;
    return {
      if (instanceTerminationTimeout != null)
        'InstanceTerminationTimeout': instanceTerminationTimeout,
      if (instancesToProtect != null) 'InstancesToProtect': instancesToProtect,
      if (instancesToTerminate != null)
        'InstancesToTerminate': instancesToTerminate,
    };
  }
}

/// Configuration parameters for an instance fleet modification request.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleetModifyConfig {
  /// A unique identifier for the instance fleet.
  final String instanceFleetId;

  /// Reserved.
  final String? context;

  /// An array of InstanceTypeConfig objects that specify how Amazon EMR
  /// provisions Amazon EC2 instances when it fulfills On-Demand and Spot
  /// capacities. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/APIReference/API_InstanceTypeConfig.html">InstanceTypeConfig</a>.
  final List<InstanceTypeConfig>? instanceTypeConfigs;

  /// The resize specification for the instance fleet.
  final InstanceFleetResizingSpecifications? resizeSpecifications;

  /// The target capacity of On-Demand units for the instance fleet. For more
  /// information see <a>InstanceFleetConfig$TargetOnDemandCapacity</a>.
  final int? targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet. For more
  /// information, see <a>InstanceFleetConfig$TargetSpotCapacity</a>.
  final int? targetSpotCapacity;

  InstanceFleetModifyConfig({
    required this.instanceFleetId,
    this.context,
    this.instanceTypeConfigs,
    this.resizeSpecifications,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });

  Map<String, dynamic> toJson() {
    final instanceFleetId = this.instanceFleetId;
    final context = this.context;
    final instanceTypeConfigs = this.instanceTypeConfigs;
    final resizeSpecifications = this.resizeSpecifications;
    final targetOnDemandCapacity = this.targetOnDemandCapacity;
    final targetSpotCapacity = this.targetSpotCapacity;
    return {
      'InstanceFleetId': instanceFleetId,
      if (context != null) 'Context': context,
      if (instanceTypeConfigs != null)
        'InstanceTypeConfigs': instanceTypeConfigs,
      if (resizeSpecifications != null)
        'ResizeSpecifications': resizeSpecifications,
      if (targetOnDemandCapacity != null)
        'TargetOnDemandCapacity': targetOnDemandCapacity,
      if (targetSpotCapacity != null) 'TargetSpotCapacity': targetSpotCapacity,
    };
  }
}

/// An instance type that the specified Amazon EMR release supports.
///
/// @nodoc
class SupportedInstanceType {
  /// The CPU architecture, for example <code>X86_64</code> or
  /// <code>AARCH64</code>.
  final String? architecture;

  /// Indicates whether the <code>SupportedInstanceType</code> supports Amazon EBS
  /// optimization.
  final bool? ebsOptimizedAvailable;

  /// Indicates whether the <code>SupportedInstanceType</code> uses Amazon EBS
  /// optimization by default.
  final bool? ebsOptimizedByDefault;

  /// Indicates whether the <code>SupportedInstanceType</code> only supports
  /// Amazon EBS.
  final bool? ebsStorageOnly;

  /// The Amazon EC2 family and generation for the
  /// <code>SupportedInstanceType</code>.
  final String? instanceFamilyId;

  /// Indicates whether the <code>SupportedInstanceType</code> only supports
  /// 64-bit architecture.
  final bool? is64BitsOnly;

  /// The amount of memory that is available to Amazon EMR from the
  /// <code>SupportedInstanceType</code>. The kernel and hypervisor software
  /// consume some memory, so this value might be lower than the overall memory
  /// for the instance type.
  final double? memoryGB;

  /// Number of disks for the <code>SupportedInstanceType</code>. This value is
  /// <code>0</code> for Amazon EBS-only instance types.
  final int? numberOfDisks;

  /// <code>StorageGB</code> represents the storage capacity of the
  /// <code>SupportedInstanceType</code>. This value is <code>0</code> for Amazon
  /// EBS-only instance types.
  final int? storageGB;

  /// The <a href="http://aws.amazon.com/ec2/instance-types/">Amazon EC2 instance
  /// type</a>, for example <code>m5.xlarge</code>, of the
  /// <code>SupportedInstanceType</code>.
  final String? type;

  /// The number of vCPUs available for the <code>SupportedInstanceType</code>.
  final int? vcpu;

  SupportedInstanceType({
    this.architecture,
    this.ebsOptimizedAvailable,
    this.ebsOptimizedByDefault,
    this.ebsStorageOnly,
    this.instanceFamilyId,
    this.is64BitsOnly,
    this.memoryGB,
    this.numberOfDisks,
    this.storageGB,
    this.type,
    this.vcpu,
  });

  factory SupportedInstanceType.fromJson(Map<String, dynamic> json) {
    return SupportedInstanceType(
      architecture: json['Architecture'] as String?,
      ebsOptimizedAvailable: json['EbsOptimizedAvailable'] as bool?,
      ebsOptimizedByDefault: json['EbsOptimizedByDefault'] as bool?,
      ebsStorageOnly: json['EbsStorageOnly'] as bool?,
      instanceFamilyId: json['InstanceFamilyId'] as String?,
      is64BitsOnly: json['Is64BitsOnly'] as bool?,
      memoryGB: json['MemoryGB'] as double?,
      numberOfDisks: json['NumberOfDisks'] as int?,
      storageGB: json['StorageGB'] as int?,
      type: json['Type'] as String?,
      vcpu: json['VCPU'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final ebsOptimizedAvailable = this.ebsOptimizedAvailable;
    final ebsOptimizedByDefault = this.ebsOptimizedByDefault;
    final ebsStorageOnly = this.ebsStorageOnly;
    final instanceFamilyId = this.instanceFamilyId;
    final is64BitsOnly = this.is64BitsOnly;
    final memoryGB = this.memoryGB;
    final numberOfDisks = this.numberOfDisks;
    final storageGB = this.storageGB;
    final type = this.type;
    final vcpu = this.vcpu;
    return {
      if (architecture != null) 'Architecture': architecture,
      if (ebsOptimizedAvailable != null)
        'EbsOptimizedAvailable': ebsOptimizedAvailable,
      if (ebsOptimizedByDefault != null)
        'EbsOptimizedByDefault': ebsOptimizedByDefault,
      if (ebsStorageOnly != null) 'EbsStorageOnly': ebsStorageOnly,
      if (instanceFamilyId != null) 'InstanceFamilyId': instanceFamilyId,
      if (is64BitsOnly != null) 'Is64BitsOnly': is64BitsOnly,
      if (memoryGB != null) 'MemoryGB': memoryGB,
      if (numberOfDisks != null) 'NumberOfDisks': numberOfDisks,
      if (storageGB != null) 'StorageGB': storageGB,
      if (type != null) 'Type': type,
      if (vcpu != null) 'VCPU': vcpu,
    };
  }
}

/// Details for an Amazon EMR Studio session mapping. The details do not include
/// the time the session mapping was last modified.
///
/// @nodoc
class SessionMappingSummary {
  /// The time the session mapping was created.
  final DateTime? creationTime;

  /// The globally unique identifier (GUID) of the user or group from the IAM
  /// Identity Center Identity Store.
  final String? identityId;

  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>.
  final String? identityName;

  /// Specifies whether the identity mapped to the Amazon EMR Studio is a user or
  /// a group.
  final IdentityType? identityType;

  /// The Amazon Resource Name (ARN) of the session policy associated with the
  /// user or group.
  final String? sessionPolicyArn;

  /// The ID of the Amazon EMR Studio.
  final String? studioId;

  SessionMappingSummary({
    this.creationTime,
    this.identityId,
    this.identityName,
    this.identityType,
    this.sessionPolicyArn,
    this.studioId,
  });

  factory SessionMappingSummary.fromJson(Map<String, dynamic> json) {
    return SessionMappingSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      identityId: json['IdentityId'] as String?,
      identityName: json['IdentityName'] as String?,
      identityType:
          (json['IdentityType'] as String?)?.let(IdentityType.fromString),
      sessionPolicyArn: json['SessionPolicyArn'] as String?,
      studioId: json['StudioId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identityId = this.identityId;
    final identityName = this.identityName;
    final identityType = this.identityType;
    final sessionPolicyArn = this.sessionPolicyArn;
    final studioId = this.studioId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (identityId != null) 'IdentityId': identityId,
      if (identityName != null) 'IdentityName': identityName,
      if (identityType != null) 'IdentityType': identityType.value,
      if (sessionPolicyArn != null) 'SessionPolicyArn': sessionPolicyArn,
      if (studioId != null) 'StudioId': studioId,
    };
  }
}

/// Details for an Amazon EMR Studio, including ID, Name, VPC, and Description.
/// To fetch additional details such as subnets, IAM roles, security groups, and
/// tags for the Studio, use the <a>DescribeStudio</a> API.
///
/// @nodoc
class StudioSummary {
  /// Specifies whether the Studio authenticates users using IAM or IAM Identity
  /// Center.
  final AuthMode? authMode;

  /// The time when the Amazon EMR Studio was created.
  final DateTime? creationTime;

  /// The detailed description of the Amazon EMR Studio.
  final String? description;

  /// The name of the Amazon EMR Studio.
  final String? name;

  /// The ID of the Amazon EMR Studio.
  final String? studioId;

  /// The unique access URL of the Amazon EMR Studio.
  final String? url;

  /// The ID of the Virtual Private Cloud (Amazon VPC) associated with the Amazon
  /// EMR Studio.
  final String? vpcId;

  StudioSummary({
    this.authMode,
    this.creationTime,
    this.description,
    this.name,
    this.studioId,
    this.url,
    this.vpcId,
  });

  factory StudioSummary.fromJson(Map<String, dynamic> json) {
    return StudioSummary(
      authMode: (json['AuthMode'] as String?)?.let(AuthMode.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      studioId: json['StudioId'] as String?,
      url: json['Url'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authMode = this.authMode;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final studioId = this.studioId;
    final url = this.url;
    final vpcId = this.vpcId;
    return {
      if (authMode != null) 'AuthMode': authMode.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (studioId != null) 'StudioId': studioId,
      if (url != null) 'Url': url,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// @nodoc
class AuthMode {
  static const sso = AuthMode._('SSO');
  static const iam = AuthMode._('IAM');

  final String value;

  const AuthMode._(this.value);

  static const values = [sso, iam];

  static AuthMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AuthMode._(value));

  @override
  bool operator ==(other) => other is AuthMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the cluster step.
///
/// @nodoc
class StepSummary {
  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// available for backward compatibility.
  final ActionOnFailure? actionOnFailure;

  /// The Hadoop job configuration of the cluster step.
  final HadoopStepConfig? config;

  /// The KMS key ARN to encrypt the logs published to the given Amazon S3
  /// destination.
  final String? encryptionKeyArn;

  /// The identifier of the cluster step.
  final String? id;

  /// The Amazon S3 destination URI for log publishing.
  final String? logUri;

  /// The name of the cluster step.
  final String? name;

  /// The current execution status details of the cluster step.
  final StepStatus? status;

  StepSummary({
    this.actionOnFailure,
    this.config,
    this.encryptionKeyArn,
    this.id,
    this.logUri,
    this.name,
    this.status,
  });

  factory StepSummary.fromJson(Map<String, dynamic> json) {
    return StepSummary(
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.let(ActionOnFailure.fromString),
      config: json['Config'] != null
          ? HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>)
          : null,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      id: json['Id'] as String?,
      logUri: json['LogUri'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] != null
          ? StepStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionOnFailure = this.actionOnFailure;
    final config = this.config;
    final encryptionKeyArn = this.encryptionKeyArn;
    final id = this.id;
    final logUri = this.logUri;
    final name = this.name;
    final status = this.status;
    return {
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.value,
      if (config != null) 'Config': config,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (id != null) 'Id': id,
      if (logUri != null) 'LogUri': logUri,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

/// A cluster step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
///
/// @nodoc
class HadoopStepConfig {
  /// The list of command line arguments to pass to the JAR file's main function
  /// for execution.
  final List<String>? args;

  /// The path to the JAR file that runs during the step.
  final String? jar;

  /// The name of the main class in the specified Java file. If not specified, the
  /// JAR file should specify a main class in its manifest file.
  final String? mainClass;

  /// The list of Java properties that are set when the step runs. You can use
  /// these properties to pass key-value pairs to your main function.
  final Map<String, String>? properties;

  HadoopStepConfig({
    this.args,
    this.jar,
    this.mainClass,
    this.properties,
  });

  factory HadoopStepConfig.fromJson(Map<String, dynamic> json) {
    return HadoopStepConfig(
      args: (json['Args'] as List?)?.nonNulls.map((e) => e as String).toList(),
      jar: json['Jar'] as String?,
      mainClass: json['MainClass'] as String?,
      properties: (json['Properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final args = this.args;
    final jar = this.jar;
    final mainClass = this.mainClass;
    final properties = this.properties;
    return {
      if (args != null) 'Args': args,
      if (jar != null) 'Jar': jar,
      if (mainClass != null) 'MainClass': mainClass,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// The execution status details of the cluster step.
///
/// @nodoc
class StepStatus {
  /// The details for the step failure including reason, message, and log file
  /// path where the root cause was identified.
  final FailureDetails? failureDetails;

  /// The execution state of the cluster step.
  final StepState? state;

  /// The reason for the step execution status change.
  final StepStateChangeReason? stateChangeReason;

  /// The timeline of the cluster step status over time.
  final StepTimeline? timeline;

  StepStatus({
    this.failureDetails,
    this.state,
    this.stateChangeReason,
    this.timeline,
  });

  factory StepStatus.fromJson(Map<String, dynamic> json) {
    return StepStatus(
      failureDetails: json['FailureDetails'] != null
          ? FailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(StepState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? StepStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? StepTimeline.fromJson(json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failureDetails = this.failureDetails;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final timeline = this.timeline;
    return {
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// @nodoc
class StepState {
  static const pending = StepState._('PENDING');
  static const cancelPending = StepState._('CANCEL_PENDING');
  static const running = StepState._('RUNNING');
  static const completed = StepState._('COMPLETED');
  static const cancelled = StepState._('CANCELLED');
  static const failed = StepState._('FAILED');
  static const interrupted = StepState._('INTERRUPTED');

  final String value;

  const StepState._(this.value);

  static const values = [
    pending,
    cancelPending,
    running,
    completed,
    cancelled,
    failed,
    interrupted
  ];

  static StepState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepState._(value));

  @override
  bool operator ==(other) => other is StepState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the step state change reason.
///
/// @nodoc
class StepStateChangeReason {
  /// The programmable code for the state change reason. Note: Currently, the
  /// service provides no code for the state change.
  final StepStateChangeReasonCode? code;

  /// The descriptive message for the state change reason.
  final String? message;

  StepStateChangeReason({
    this.code,
    this.message,
  });

  factory StepStateChangeReason.fromJson(Map<String, dynamic> json) {
    return StepStateChangeReason(
      code:
          (json['Code'] as String?)?.let(StepStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// The details of the step failure. The service attempts to detect the root
/// cause for many common failures.
///
/// @nodoc
class FailureDetails {
  /// The path to the log file where the step failure root cause was originally
  /// recorded.
  final String? logFile;

  /// The descriptive message including the error the Amazon EMR service has
  /// identified as the cause of step failure. This is text from an error log that
  /// describes the root cause of the failure.
  final String? message;

  /// The reason for the step failure. In the case where the service cannot
  /// successfully determine the root cause of the failure, it returns "Unknown
  /// Error" as a reason.
  final String? reason;

  FailureDetails({
    this.logFile,
    this.message,
    this.reason,
  });

  factory FailureDetails.fromJson(Map<String, dynamic> json) {
    return FailureDetails(
      logFile: json['LogFile'] as String?,
      message: json['Message'] as String?,
      reason: json['Reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logFile = this.logFile;
    final message = this.message;
    final reason = this.reason;
    return {
      if (logFile != null) 'LogFile': logFile,
      if (message != null) 'Message': message,
      if (reason != null) 'Reason': reason,
    };
  }
}

/// The timeline of the cluster step lifecycle.
///
/// @nodoc
class StepTimeline {
  /// The date and time when the cluster step was created.
  final DateTime? creationDateTime;

  /// The date and time when the cluster step execution completed or failed.
  final DateTime? endDateTime;

  /// The date and time when the cluster step execution started.
  final DateTime? startDateTime;

  StepTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.startDateTime,
  });

  factory StepTimeline.fromJson(Map<String, dynamic> json) {
    return StepTimeline(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      startDateTime: timeStampFromJson(json['StartDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final startDateTime = this.startDateTime;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// @nodoc
class StepStateChangeReasonCode {
  static const none = StepStateChangeReasonCode._('NONE');

  final String value;

  const StepStateChangeReasonCode._(this.value);

  static const values = [none];

  static StepStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is StepStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a Spark Connect session.
///
/// @nodoc
class Session {
  /// The Amazon Resource Name (ARN) of the session.
  final String arn;

  /// The ID of the cluster that the session belongs to.
  final String clusterId;

  /// The ID of the session.
  final String id;

  /// The current state of the session. Valid values are <code>SUBMITTED</code>,
  /// <code>STARTING</code>, <code>STARTED</code>, <code>IDLE</code>,
  /// <code>BUSY</code>, <code>TERMINATING</code>, <code>TERMINATED</code>, and
  /// <code>FAILED</code>.
  final SessionState state;

  /// The Amazon Web Services account ID that owns the session.
  final String? accountId;

  /// The certificate authority used to establish an mTLS connection to the Spark
  /// Connect server when connecting directly over VPC peering.
  final CertificateAuthority? certificateAuthority;

  /// The date and time that the session was created.
  final DateTime? createdAt;

  /// The date and time that the session was terminated or failed.
  final DateTime? endedAt;

  /// The configuration overrides for the session. Only runtime configuration
  /// overrides are supported.
  final List<Configuration>? engineConfigurations;

  /// The execution role ARN for the session. Amazon EMR uses this role to access
  /// Amazon Web Services resources on your behalf during session execution.
  final String? executionRoleArn;

  /// The date and time that the session last entered the <code>IDLE</code> state.
  final DateTime? idleSince;

  /// The monitoring configuration for the session.
  final SessionMonitoringConfiguration? monitoringConfiguration;

  /// The name of the session, if one was provided at creation time.
  final String? name;

  /// The Amazon EMR release label of the cluster that the session is running on.
  final String? releaseLabel;

  /// The Spark Connect server URL for the session. Use this URL with the
  /// <code>Credentials</code> returned by <code>GetSessionEndpoint</code> to
  /// connect directly to the session over VPC peering.
  final String? serverUrl;

  /// The idle timeout, in minutes. If the session is idle for this duration,
  /// Amazon EMR automatically terminates it.
  final int? sessionIdleTimeoutInMinutes;

  /// The date and time that the session entered the <code>STARTED</code> state.
  final DateTime? startedAt;

  /// A human-readable message describing the most recent state change.
  final String? stateChangeReason;

  /// The tags associated with the session.
  final List<Tag>? tags;

  /// The date and time that the session was last updated.
  final DateTime? updatedAt;

  Session({
    required this.arn,
    required this.clusterId,
    required this.id,
    required this.state,
    this.accountId,
    this.certificateAuthority,
    this.createdAt,
    this.endedAt,
    this.engineConfigurations,
    this.executionRoleArn,
    this.idleSince,
    this.monitoringConfiguration,
    this.name,
    this.releaseLabel,
    this.serverUrl,
    this.sessionIdleTimeoutInMinutes,
    this.startedAt,
    this.stateChangeReason,
    this.tags,
    this.updatedAt,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      arn: (json['Arn'] as String?) ?? '',
      clusterId: (json['ClusterId'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      state: SessionState.fromString((json['State'] as String?) ?? ''),
      accountId: json['AccountId'] as String?,
      certificateAuthority: json['CertificateAuthority'] != null
          ? CertificateAuthority.fromJson(
              json['CertificateAuthority'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      endedAt: timeStampFromJson(json['EndedAt']),
      engineConfigurations: (json['EngineConfigurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      idleSince: timeStampFromJson(json['IdleSince']),
      monitoringConfiguration: json['MonitoringConfiguration'] != null
          ? SessionMonitoringConfiguration.fromJson(
              json['MonitoringConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      releaseLabel: json['ReleaseLabel'] as String?,
      serverUrl: json['ServerUrl'] as String?,
      sessionIdleTimeoutInMinutes: json['SessionIdleTimeoutInMinutes'] as int?,
      startedAt: timeStampFromJson(json['StartedAt']),
      stateChangeReason: json['StateChangeReason'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clusterId = this.clusterId;
    final id = this.id;
    final state = this.state;
    final accountId = this.accountId;
    final certificateAuthority = this.certificateAuthority;
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final engineConfigurations = this.engineConfigurations;
    final executionRoleArn = this.executionRoleArn;
    final idleSince = this.idleSince;
    final monitoringConfiguration = this.monitoringConfiguration;
    final name = this.name;
    final releaseLabel = this.releaseLabel;
    final serverUrl = this.serverUrl;
    final sessionIdleTimeoutInMinutes = this.sessionIdleTimeoutInMinutes;
    final startedAt = this.startedAt;
    final stateChangeReason = this.stateChangeReason;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'Arn': arn,
      'ClusterId': clusterId,
      'Id': id,
      'State': state.value,
      if (accountId != null) 'AccountId': accountId,
      if (certificateAuthority != null)
        'CertificateAuthority': certificateAuthority,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (engineConfigurations != null)
        'EngineConfigurations': engineConfigurations,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (idleSince != null) 'IdleSince': unixTimestampToJson(idleSince),
      if (monitoringConfiguration != null)
        'MonitoringConfiguration': monitoringConfiguration,
      if (name != null) 'Name': name,
      if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
      if (serverUrl != null) 'ServerUrl': serverUrl,
      if (sessionIdleTimeoutInMinutes != null)
        'SessionIdleTimeoutInMinutes': sessionIdleTimeoutInMinutes,
      if (startedAt != null) 'StartedAt': unixTimestampToJson(startedAt),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Describes the certificate authority used to establish an mTLS connection to
/// the Spark Connect server when connecting directly over VPC peering.
///
/// @nodoc
class CertificateAuthority {
  /// The Amazon Resource Name (ARN) of the certificate authority in Amazon Web
  /// Services Private CA that issued the Spark Connect server certificate.
  final String? certificateArn;

  /// The PEM-encoded root CA certificate data. Provide this certificate to your
  /// client's trust store when connecting directly to the Spark Connect server
  /// over VPC peering.
  final String? certificateData;

  CertificateAuthority({
    this.certificateArn,
    this.certificateData,
  });

  factory CertificateAuthority.fromJson(Map<String, dynamic> json) {
    return CertificateAuthority(
      certificateArn: json['CertificateArn'] as String?,
      certificateData: json['CertificateData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateData = this.certificateData;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (certificateData != null) 'CertificateData': certificateData,
    };
  }
}

/// The creation date and time, and name, of a security configuration.
///
/// @nodoc
class SecurityConfigurationSummary {
  /// The date and time the security configuration was created.
  final DateTime? creationDateTime;

  /// The name of the security configuration.
  final String? name;

  SecurityConfigurationSummary({
    this.creationDateTime,
    this.name,
  });

  factory SecurityConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return SecurityConfigurationSummary(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final name = this.name;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (name != null) 'Name': name,
    };
  }
}

/// The release label filters by application or version prefix.
///
/// @nodoc
class ReleaseLabelFilter {
  /// Optional release label application filter. For example,
  /// <code>spark@2.1.0</code>.
  final String? application;

  /// Optional release label version prefix filter. For example,
  /// <code>emr-5</code>.
  final String? prefix;

  ReleaseLabelFilter({
    this.application,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final application = this.application;
    final prefix = this.prefix;
    return {
      if (application != null) 'Application': application,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Details for a notebook execution. The details include information such as
/// the unique ID and status of the notebook execution.
///
/// @nodoc
class NotebookExecutionSummary {
  /// The unique identifier of the editor associated with the notebook execution.
  final String? editorId;

  /// The timestamp when notebook execution started.
  final DateTime? endTime;

  /// The unique ID of the execution engine for the notebook execution.
  final String? executionEngineId;

  /// The unique identifier of the notebook execution.
  final String? notebookExecutionId;

  /// The name of the notebook execution.
  final String? notebookExecutionName;

  /// The Amazon S3 location that stores the notebook execution input.
  final NotebookS3LocationForOutput? notebookS3Location;

  /// The timestamp when notebook execution started.
  final DateTime? startTime;

  /// The status of the notebook execution.
  ///
  /// <ul>
  /// <li>
  /// <code>START_PENDING</code> indicates that the cluster has received the
  /// execution request but execution has not begun.
  /// </li>
  /// <li>
  /// <code>STARTING</code> indicates that the execution is starting on the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> indicates that the execution is being processed by the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>FINISHING</code> indicates that execution processing is in the final
  /// stages.
  /// </li>
  /// <li>
  /// <code>FINISHED</code> indicates that the execution has completed without
  /// error.
  /// </li>
  /// <li>
  /// <code>FAILING</code> indicates that the execution is failing and will not
  /// finish successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> indicates that the execution failed.
  /// </li>
  /// <li>
  /// <code>STOP_PENDING</code> indicates that the cluster has received a
  /// <code>StopNotebookExecution</code> request and the stop is pending.
  /// </li>
  /// <li>
  /// <code>STOPPING</code> indicates that the cluster is in the process of
  /// stopping the execution as a result of a <code>StopNotebookExecution</code>
  /// request.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> indicates that the execution stopped because of a
  /// <code>StopNotebookExecution</code> request.
  /// </li>
  /// </ul>
  final NotebookExecutionStatus? status;

  NotebookExecutionSummary({
    this.editorId,
    this.endTime,
    this.executionEngineId,
    this.notebookExecutionId,
    this.notebookExecutionName,
    this.notebookS3Location,
    this.startTime,
    this.status,
  });

  factory NotebookExecutionSummary.fromJson(Map<String, dynamic> json) {
    return NotebookExecutionSummary(
      editorId: json['EditorId'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      executionEngineId: json['ExecutionEngineId'] as String?,
      notebookExecutionId: json['NotebookExecutionId'] as String?,
      notebookExecutionName: json['NotebookExecutionName'] as String?,
      notebookS3Location: json['NotebookS3Location'] != null
          ? NotebookS3LocationForOutput.fromJson(
              json['NotebookS3Location'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status:
          (json['Status'] as String?)?.let(NotebookExecutionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final editorId = this.editorId;
    final endTime = this.endTime;
    final executionEngineId = this.executionEngineId;
    final notebookExecutionId = this.notebookExecutionId;
    final notebookExecutionName = this.notebookExecutionName;
    final notebookS3Location = this.notebookS3Location;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (editorId != null) 'EditorId': editorId,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (executionEngineId != null) 'ExecutionEngineId': executionEngineId,
      if (notebookExecutionId != null)
        'NotebookExecutionId': notebookExecutionId,
      if (notebookExecutionName != null)
        'NotebookExecutionName': notebookExecutionName,
      if (notebookS3Location != null) 'NotebookS3Location': notebookS3Location,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
    };
  }
}

/// @nodoc
class NotebookExecutionStatus {
  static const startPending = NotebookExecutionStatus._('START_PENDING');
  static const starting = NotebookExecutionStatus._('STARTING');
  static const running = NotebookExecutionStatus._('RUNNING');
  static const finishing = NotebookExecutionStatus._('FINISHING');
  static const finished = NotebookExecutionStatus._('FINISHED');
  static const failing = NotebookExecutionStatus._('FAILING');
  static const failed = NotebookExecutionStatus._('FAILED');
  static const stopPending = NotebookExecutionStatus._('STOP_PENDING');
  static const stopping = NotebookExecutionStatus._('STOPPING');
  static const stopped = NotebookExecutionStatus._('STOPPED');

  final String value;

  const NotebookExecutionStatus._(this.value);

  static const values = [
    startPending,
    starting,
    running,
    finishing,
    finished,
    failing,
    failed,
    stopPending,
    stopping,
    stopped
  ];

  static NotebookExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotebookExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotebookExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon S3 location that stores the notebook execution input.
///
/// @nodoc
class NotebookS3LocationForOutput {
  /// The Amazon S3 bucket that stores the notebook execution input.
  final String? bucket;

  /// The key to the Amazon S3 location that stores the notebook execution input.
  final String? key;

  NotebookS3LocationForOutput({
    this.bucket,
    this.key,
  });

  factory NotebookS3LocationForOutput.fromJson(Map<String, dynamic> json) {
    return NotebookS3LocationForOutput(
      bucket: json['Bucket'] as String?,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

/// Represents an Amazon EC2 instance provisioned as part of cluster.
///
/// @nodoc
class Instance {
  /// The list of Amazon EBS volumes that are attached to this instance.
  final List<EbsVolume>? ebsVolumes;

  /// The unique identifier of the instance in Amazon EC2.
  final String? ec2InstanceId;

  /// The unique identifier for the instance in Amazon EMR.
  final String? id;

  /// The unique identifier of the instance fleet to which an Amazon EC2 instance
  /// belongs.
  final String? instanceFleetId;

  /// The identifier of the instance group to which this instance belongs.
  final String? instanceGroupId;

  /// The Amazon EC2 instance type, for example <code>m3.xlarge</code>.
  final String? instanceType;

  /// The instance purchasing option. Valid values are <code>ON_DEMAND</code> or
  /// <code>SPOT</code>.
  final MarketType? market;

  /// The private DNS name of the instance.
  final String? privateDnsName;

  /// The private IP address of the instance.
  final String? privateIpAddress;

  /// The public DNS name of the instance.
  final String? publicDnsName;

  /// The public IP address of the instance.
  final String? publicIpAddress;

  /// The current status of the instance.
  final InstanceStatus? status;

  Instance({
    this.ebsVolumes,
    this.ec2InstanceId,
    this.id,
    this.instanceFleetId,
    this.instanceGroupId,
    this.instanceType,
    this.market,
    this.privateDnsName,
    this.privateIpAddress,
    this.publicDnsName,
    this.publicIpAddress,
    this.status,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      ebsVolumes: (json['EbsVolumes'] as List?)
          ?.nonNulls
          .map((e) => EbsVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      id: json['Id'] as String?,
      instanceFleetId: json['InstanceFleetId'] as String?,
      instanceGroupId: json['InstanceGroupId'] as String?,
      instanceType: json['InstanceType'] as String?,
      market: (json['Market'] as String?)?.let(MarketType.fromString),
      privateDnsName: json['PrivateDnsName'] as String?,
      privateIpAddress: json['PrivateIpAddress'] as String?,
      publicDnsName: json['PublicDnsName'] as String?,
      publicIpAddress: json['PublicIpAddress'] as String?,
      status: json['Status'] != null
          ? InstanceStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsVolumes = this.ebsVolumes;
    final ec2InstanceId = this.ec2InstanceId;
    final id = this.id;
    final instanceFleetId = this.instanceFleetId;
    final instanceGroupId = this.instanceGroupId;
    final instanceType = this.instanceType;
    final market = this.market;
    final privateDnsName = this.privateDnsName;
    final privateIpAddress = this.privateIpAddress;
    final publicDnsName = this.publicDnsName;
    final publicIpAddress = this.publicIpAddress;
    final status = this.status;
    return {
      if (ebsVolumes != null) 'EbsVolumes': ebsVolumes,
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (id != null) 'Id': id,
      if (instanceFleetId != null) 'InstanceFleetId': instanceFleetId,
      if (instanceGroupId != null) 'InstanceGroupId': instanceGroupId,
      if (instanceType != null) 'InstanceType': instanceType,
      if (market != null) 'Market': market.value,
      if (privateDnsName != null) 'PrivateDnsName': privateDnsName,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (publicDnsName != null) 'PublicDnsName': publicDnsName,
      if (publicIpAddress != null) 'PublicIpAddress': publicIpAddress,
      if (status != null) 'Status': status,
    };
  }
}

/// The instance status details.
///
/// @nodoc
class InstanceStatus {
  /// The current state of the instance.
  final InstanceState? state;

  /// The details of the status change reason for the instance.
  final InstanceStateChangeReason? stateChangeReason;

  /// The timeline of the instance status over time.
  final InstanceTimeline? timeline;

  InstanceStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });

  factory InstanceStatus.fromJson(Map<String, dynamic> json) {
    return InstanceStatus(
      state: (json['State'] as String?)?.let(InstanceState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? InstanceStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? InstanceTimeline.fromJson(json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final timeline = this.timeline;
    return {
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// EBS block device that's attached to an Amazon EC2 instance.
///
/// @nodoc
class EbsVolume {
  /// The device name that is exposed to the instance, such as /dev/sdh.
  final String? device;

  /// The volume identifier of the EBS volume.
  final String? volumeId;

  EbsVolume({
    this.device,
    this.volumeId,
  });

  factory EbsVolume.fromJson(Map<String, dynamic> json) {
    return EbsVolume(
      device: json['Device'] as String?,
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    final volumeId = this.volumeId;
    return {
      if (device != null) 'Device': device,
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// @nodoc
class InstanceState {
  static const awaitingFulfillment = InstanceState._('AWAITING_FULFILLMENT');
  static const provisioning = InstanceState._('PROVISIONING');
  static const bootstrapping = InstanceState._('BOOTSTRAPPING');
  static const running = InstanceState._('RUNNING');
  static const terminated = InstanceState._('TERMINATED');

  final String value;

  const InstanceState._(this.value);

  static const values = [
    awaitingFulfillment,
    provisioning,
    bootstrapping,
    running,
    terminated
  ];

  static InstanceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceState._(value));

  @override
  bool operator ==(other) => other is InstanceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the status change reason for the instance.
///
/// @nodoc
class InstanceStateChangeReason {
  /// The programmable code for the state change reason.
  final InstanceStateChangeReasonCode? code;

  /// The status change reason description.
  final String? message;

  InstanceStateChangeReason({
    this.code,
    this.message,
  });

  factory InstanceStateChangeReason.fromJson(Map<String, dynamic> json) {
    return InstanceStateChangeReason(
      code: (json['Code'] as String?)
          ?.let(InstanceStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// The timeline of the instance lifecycle.
///
/// @nodoc
class InstanceTimeline {
  /// The creation date and time of the instance.
  final DateTime? creationDateTime;

  /// The date and time when the instance was terminated.
  final DateTime? endDateTime;

  /// The date and time when the instance was ready to perform tasks.
  final DateTime? readyDateTime;

  InstanceTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });

  factory InstanceTimeline.fromJson(Map<String, dynamic> json) {
    return InstanceTimeline(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final readyDateTime = this.readyDateTime;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
    };
  }
}

/// @nodoc
class InstanceStateChangeReasonCode {
  static const internalError =
      InstanceStateChangeReasonCode._('INTERNAL_ERROR');
  static const validationError =
      InstanceStateChangeReasonCode._('VALIDATION_ERROR');
  static const instanceFailure =
      InstanceStateChangeReasonCode._('INSTANCE_FAILURE');
  static const bootstrapFailure =
      InstanceStateChangeReasonCode._('BOOTSTRAP_FAILURE');
  static const clusterTerminated =
      InstanceStateChangeReasonCode._('CLUSTER_TERMINATED');

  final String value;

  const InstanceStateChangeReasonCode._(this.value);

  static const values = [
    internalError,
    validationError,
    instanceFailure,
    bootstrapFailure,
    clusterTerminated
  ];

  static InstanceStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is InstanceStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InstanceGroupType {
  static const master = InstanceGroupType._('MASTER');
  static const core = InstanceGroupType._('CORE');
  static const task = InstanceGroupType._('TASK');

  final String value;

  const InstanceGroupType._(this.value);

  static const values = [master, core, task];

  static InstanceGroupType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceGroupType._(value));

  @override
  bool operator ==(other) => other is InstanceGroupType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This entity represents an instance group, which is a group of instances that
/// have common purpose. For example, CORE instance group is used for HDFS.
///
/// @nodoc
class InstanceGroup {
  /// An automatic scaling policy for a core instance group or task instance group
  /// in an Amazon EMR cluster. The automatic scaling policy defines how an
  /// instance group dynamically adds and terminates Amazon EC2 instances in
  /// response to the value of a CloudWatch metric. See PutAutoScalingPolicy.
  final AutoScalingPolicyDescription? autoScalingPolicy;

  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  final String? bidPrice;

  /// <note>
  /// Amazon EMR releases 4.x or later.
  /// </note>
  /// The list of configurations supplied for an Amazon EMR cluster instance
  /// group. You can specify a separate configuration for each instance group
  /// (master, core, and task).
  final List<Configuration>? configurations;

  /// The version number of the requested configuration specification for this
  /// instance group.
  final int? configurationsVersion;

  /// The custom AMI ID to use for the provisioned instance group.
  final String? customAmiId;

  /// The EBS block devices that are mapped to this instance group.
  final List<EbsBlockDevice>? ebsBlockDevices;

  /// If the instance group is EBS-optimized. An Amazon EBS-optimized instance
  /// uses an optimized configuration stack and provides additional, dedicated
  /// capacity for Amazon EBS I/O.
  final bool? ebsOptimized;

  /// The identifier of the instance group.
  final String? id;

  /// The type of the instance group. Valid values are MASTER, CORE or TASK.
  final InstanceGroupType? instanceGroupType;

  /// The Amazon EC2 instance type for all instances in the instance group.
  final String? instanceType;

  /// A list of configurations that were successfully applied for an instance
  /// group last time.
  final List<Configuration>? lastSuccessfullyAppliedConfigurations;

  /// The version number of a configuration specification that was successfully
  /// applied for an instance group last time.
  final int? lastSuccessfullyAppliedConfigurationsVersion;

  /// The marketplace to provision instances for this group. Valid values are
  /// ON_DEMAND or SPOT.
  final MarketType? market;

  /// The name of the instance group.
  final String? name;

  /// The target number of instances for the instance group.
  final int? requestedInstanceCount;

  /// The number of instances currently running in this instance group.
  final int? runningInstanceCount;

  /// Policy for customizing shrink operations.
  final ShrinkPolicy? shrinkPolicy;

  /// The current status of the instance group.
  final InstanceGroupStatus? status;

  InstanceGroup({
    this.autoScalingPolicy,
    this.bidPrice,
    this.configurations,
    this.configurationsVersion,
    this.customAmiId,
    this.ebsBlockDevices,
    this.ebsOptimized,
    this.id,
    this.instanceGroupType,
    this.instanceType,
    this.lastSuccessfullyAppliedConfigurations,
    this.lastSuccessfullyAppliedConfigurationsVersion,
    this.market,
    this.name,
    this.requestedInstanceCount,
    this.runningInstanceCount,
    this.shrinkPolicy,
    this.status,
  });

  factory InstanceGroup.fromJson(Map<String, dynamic> json) {
    return InstanceGroup(
      autoScalingPolicy: json['AutoScalingPolicy'] != null
          ? AutoScalingPolicyDescription.fromJson(
              json['AutoScalingPolicy'] as Map<String, dynamic>)
          : null,
      bidPrice: json['BidPrice'] as String?,
      configurations: (json['Configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurationsVersion: json['ConfigurationsVersion'] as int?,
      customAmiId: json['CustomAmiId'] as String?,
      ebsBlockDevices: (json['EbsBlockDevices'] as List?)
          ?.nonNulls
          .map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      ebsOptimized: json['EbsOptimized'] as bool?,
      id: json['Id'] as String?,
      instanceGroupType: (json['InstanceGroupType'] as String?)
          ?.let(InstanceGroupType.fromString),
      instanceType: json['InstanceType'] as String?,
      lastSuccessfullyAppliedConfigurations:
          (json['LastSuccessfullyAppliedConfigurations'] as List?)
              ?.nonNulls
              .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
              .toList(),
      lastSuccessfullyAppliedConfigurationsVersion:
          json['LastSuccessfullyAppliedConfigurationsVersion'] as int?,
      market: (json['Market'] as String?)?.let(MarketType.fromString),
      name: json['Name'] as String?,
      requestedInstanceCount: json['RequestedInstanceCount'] as int?,
      runningInstanceCount: json['RunningInstanceCount'] as int?,
      shrinkPolicy: json['ShrinkPolicy'] != null
          ? ShrinkPolicy.fromJson(json['ShrinkPolicy'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? InstanceGroupStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingPolicy = this.autoScalingPolicy;
    final bidPrice = this.bidPrice;
    final configurations = this.configurations;
    final configurationsVersion = this.configurationsVersion;
    final customAmiId = this.customAmiId;
    final ebsBlockDevices = this.ebsBlockDevices;
    final ebsOptimized = this.ebsOptimized;
    final id = this.id;
    final instanceGroupType = this.instanceGroupType;
    final instanceType = this.instanceType;
    final lastSuccessfullyAppliedConfigurations =
        this.lastSuccessfullyAppliedConfigurations;
    final lastSuccessfullyAppliedConfigurationsVersion =
        this.lastSuccessfullyAppliedConfigurationsVersion;
    final market = this.market;
    final name = this.name;
    final requestedInstanceCount = this.requestedInstanceCount;
    final runningInstanceCount = this.runningInstanceCount;
    final shrinkPolicy = this.shrinkPolicy;
    final status = this.status;
    return {
      if (autoScalingPolicy != null) 'AutoScalingPolicy': autoScalingPolicy,
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (configurations != null) 'Configurations': configurations,
      if (configurationsVersion != null)
        'ConfigurationsVersion': configurationsVersion,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsBlockDevices != null) 'EbsBlockDevices': ebsBlockDevices,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
      if (id != null) 'Id': id,
      if (instanceGroupType != null)
        'InstanceGroupType': instanceGroupType.value,
      if (instanceType != null) 'InstanceType': instanceType,
      if (lastSuccessfullyAppliedConfigurations != null)
        'LastSuccessfullyAppliedConfigurations':
            lastSuccessfullyAppliedConfigurations,
      if (lastSuccessfullyAppliedConfigurationsVersion != null)
        'LastSuccessfullyAppliedConfigurationsVersion':
            lastSuccessfullyAppliedConfigurationsVersion,
      if (market != null) 'Market': market.value,
      if (name != null) 'Name': name,
      if (requestedInstanceCount != null)
        'RequestedInstanceCount': requestedInstanceCount,
      if (runningInstanceCount != null)
        'RunningInstanceCount': runningInstanceCount,
      if (shrinkPolicy != null) 'ShrinkPolicy': shrinkPolicy,
      if (status != null) 'Status': status,
    };
  }
}

/// The details of the instance group status.
///
/// @nodoc
class InstanceGroupStatus {
  /// The current state of the instance group.
  final InstanceGroupState? state;

  /// The status change reason details for the instance group.
  final InstanceGroupStateChangeReason? stateChangeReason;

  /// The timeline of the instance group status over time.
  final InstanceGroupTimeline? timeline;

  InstanceGroupStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });

  factory InstanceGroupStatus.fromJson(Map<String, dynamic> json) {
    return InstanceGroupStatus(
      state: (json['State'] as String?)?.let(InstanceGroupState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? InstanceGroupStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? InstanceGroupTimeline.fromJson(
              json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final timeline = this.timeline;
    return {
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// Configuration of requested EBS block device associated with the instance
/// group.
///
/// @nodoc
class EbsBlockDevice {
  /// The device name that is exposed to the instance, such as /dev/sdh.
  final String? device;

  /// EBS volume specifications such as volume type, IOPS, size (GiB) and
  /// throughput (MiB/s) that are requested for the EBS volume attached to an
  /// Amazon EC2 instance in the cluster.
  final VolumeSpecification? volumeSpecification;

  EbsBlockDevice({
    this.device,
    this.volumeSpecification,
  });

  factory EbsBlockDevice.fromJson(Map<String, dynamic> json) {
    return EbsBlockDevice(
      device: json['Device'] as String?,
      volumeSpecification: json['VolumeSpecification'] != null
          ? VolumeSpecification.fromJson(
              json['VolumeSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    final volumeSpecification = this.volumeSpecification;
    return {
      if (device != null) 'Device': device,
      if (volumeSpecification != null)
        'VolumeSpecification': volumeSpecification,
    };
  }
}

/// @nodoc
class InstanceGroupState {
  static const provisioning = InstanceGroupState._('PROVISIONING');
  static const bootstrapping = InstanceGroupState._('BOOTSTRAPPING');
  static const running = InstanceGroupState._('RUNNING');
  static const reconfiguring = InstanceGroupState._('RECONFIGURING');
  static const resizing = InstanceGroupState._('RESIZING');
  static const suspended = InstanceGroupState._('SUSPENDED');
  static const terminating = InstanceGroupState._('TERMINATING');
  static const terminated = InstanceGroupState._('TERMINATED');
  static const arrested = InstanceGroupState._('ARRESTED');
  static const shuttingDown = InstanceGroupState._('SHUTTING_DOWN');
  static const ended = InstanceGroupState._('ENDED');

  final String value;

  const InstanceGroupState._(this.value);

  static const values = [
    provisioning,
    bootstrapping,
    running,
    reconfiguring,
    resizing,
    suspended,
    terminating,
    terminated,
    arrested,
    shuttingDown,
    ended
  ];

  static InstanceGroupState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceGroupState._(value));

  @override
  bool operator ==(other) =>
      other is InstanceGroupState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status change reason details for the instance group.
///
/// @nodoc
class InstanceGroupStateChangeReason {
  /// The programmable code for the state change reason.
  final InstanceGroupStateChangeReasonCode? code;

  /// The status change reason description.
  final String? message;

  InstanceGroupStateChangeReason({
    this.code,
    this.message,
  });

  factory InstanceGroupStateChangeReason.fromJson(Map<String, dynamic> json) {
    return InstanceGroupStateChangeReason(
      code: (json['Code'] as String?)
          ?.let(InstanceGroupStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// The timeline of the instance group lifecycle.
///
/// @nodoc
class InstanceGroupTimeline {
  /// The creation date and time of the instance group.
  final DateTime? creationDateTime;

  /// The date and time when the instance group terminated.
  final DateTime? endDateTime;

  /// The date and time when the instance group became ready to perform tasks.
  final DateTime? readyDateTime;

  InstanceGroupTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });

  factory InstanceGroupTimeline.fromJson(Map<String, dynamic> json) {
    return InstanceGroupTimeline(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final readyDateTime = this.readyDateTime;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
    };
  }
}

/// @nodoc
class InstanceGroupStateChangeReasonCode {
  static const internalError =
      InstanceGroupStateChangeReasonCode._('INTERNAL_ERROR');
  static const validationError =
      InstanceGroupStateChangeReasonCode._('VALIDATION_ERROR');
  static const instanceFailure =
      InstanceGroupStateChangeReasonCode._('INSTANCE_FAILURE');
  static const clusterTerminated =
      InstanceGroupStateChangeReasonCode._('CLUSTER_TERMINATED');

  final String value;

  const InstanceGroupStateChangeReasonCode._(this.value);

  static const values = [
    internalError,
    validationError,
    instanceFailure,
    clusterTerminated
  ];

  static InstanceGroupStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceGroupStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is InstanceGroupStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an instance fleet, which is a group of Amazon EC2 instances that
/// host a particular node type (master, core, or task) in an Amazon EMR
/// cluster. Instance fleets can consist of a mix of instance types and
/// On-Demand and Spot Instances, which are provisioned to meet a defined target
/// capacity.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleet {
  /// Reserved.
  final String? context;

  /// The unique identifier of the instance fleet.
  final String? id;

  /// The node type that the instance fleet hosts. Valid values are MASTER, CORE,
  /// or TASK.
  final InstanceFleetType? instanceFleetType;

  /// An array of specifications for the instance types that comprise an instance
  /// fleet.
  final List<InstanceTypeSpecification>? instanceTypeSpecifications;

  /// Describes the launch specification for an instance fleet.
  final InstanceFleetProvisioningSpecifications? launchSpecifications;

  /// A friendly name for the instance fleet.
  final String? name;

  /// The number of On-Demand units that have been provisioned for the instance
  /// fleet to fulfill <code>TargetOnDemandCapacity</code>. This provisioned
  /// capacity might be less than or greater than
  /// <code>TargetOnDemandCapacity</code>.
  final int? provisionedOnDemandCapacity;

  /// The number of Spot units that have been provisioned for this instance fleet
  /// to fulfill <code>TargetSpotCapacity</code>. This provisioned capacity might
  /// be less than or greater than <code>TargetSpotCapacity</code>.
  final int? provisionedSpotCapacity;

  /// The resize specification for the instance fleet.
  final InstanceFleetResizingSpecifications? resizeSpecifications;

  /// The current status of the instance fleet.
  final InstanceFleetStatus? status;

  /// The target capacity of On-Demand units for the instance fleet, which
  /// determines how many On-Demand Instances to provision. When the instance
  /// fleet launches, Amazon EMR tries to provision On-Demand Instances as
  /// specified by <a>InstanceTypeConfig</a>. Each instance configuration has a
  /// specified <code>WeightedCapacity</code>. When an On-Demand Instance is
  /// provisioned, the <code>WeightedCapacity</code> units count toward the target
  /// capacity. Amazon EMR provisions instances until the target capacity is
  /// totally fulfilled, even if this results in an overage. For example, if there
  /// are 2 units remaining to fulfill capacity, and Amazon EMR can only provision
  /// an instance with a <code>WeightedCapacity</code> of 5 units, the instance is
  /// provisioned, and the target capacity is exceeded by 3 units. You can use
  /// <a>InstanceFleet$ProvisionedOnDemandCapacity</a> to determine the Spot
  /// capacity units that have been provisioned for the instance fleet.
  /// <note>
  /// If not specified or set to 0, only Spot Instances are provisioned for the
  /// instance fleet using <code>TargetSpotCapacity</code>. At least one of
  /// <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code>
  /// should be greater than 0. For a master instance fleet, only one of
  /// <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can
  /// be specified, and its value must be 1.
  /// </note>
  final int? targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet, which determines
  /// how many Spot Instances to provision. When the instance fleet launches,
  /// Amazon EMR tries to provision Spot Instances as specified by
  /// <a>InstanceTypeConfig</a>. Each instance configuration has a specified
  /// <code>WeightedCapacity</code>. When a Spot instance is provisioned, the
  /// <code>WeightedCapacity</code> units count toward the target capacity. Amazon
  /// EMR provisions instances until the target capacity is totally fulfilled,
  /// even if this results in an overage. For example, if there are 2 units
  /// remaining to fulfill capacity, and Amazon EMR can only provision an instance
  /// with a <code>WeightedCapacity</code> of 5 units, the instance is
  /// provisioned, and the target capacity is exceeded by 3 units. You can use
  /// <a>InstanceFleet$ProvisionedSpotCapacity</a> to determine the Spot capacity
  /// units that have been provisioned for the instance fleet.
  /// <note>
  /// If not specified or set to 0, only On-Demand Instances are provisioned for
  /// the instance fleet. At least one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> should be greater than 0. For a master
  /// instance fleet, only one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> can be specified, and its value must be
  /// 1.
  /// </note>
  final int? targetSpotCapacity;

  InstanceFleet({
    this.context,
    this.id,
    this.instanceFleetType,
    this.instanceTypeSpecifications,
    this.launchSpecifications,
    this.name,
    this.provisionedOnDemandCapacity,
    this.provisionedSpotCapacity,
    this.resizeSpecifications,
    this.status,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });

  factory InstanceFleet.fromJson(Map<String, dynamic> json) {
    return InstanceFleet(
      context: json['Context'] as String?,
      id: json['Id'] as String?,
      instanceFleetType: (json['InstanceFleetType'] as String?)
          ?.let(InstanceFleetType.fromString),
      instanceTypeSpecifications: (json['InstanceTypeSpecifications'] as List?)
          ?.nonNulls
          .map((e) =>
              InstanceTypeSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      launchSpecifications: json['LaunchSpecifications'] != null
          ? InstanceFleetProvisioningSpecifications.fromJson(
              json['LaunchSpecifications'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      provisionedOnDemandCapacity: json['ProvisionedOnDemandCapacity'] as int?,
      provisionedSpotCapacity: json['ProvisionedSpotCapacity'] as int?,
      resizeSpecifications: json['ResizeSpecifications'] != null
          ? InstanceFleetResizingSpecifications.fromJson(
              json['ResizeSpecifications'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? InstanceFleetStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      targetOnDemandCapacity: json['TargetOnDemandCapacity'] as int?,
      targetSpotCapacity: json['TargetSpotCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final id = this.id;
    final instanceFleetType = this.instanceFleetType;
    final instanceTypeSpecifications = this.instanceTypeSpecifications;
    final launchSpecifications = this.launchSpecifications;
    final name = this.name;
    final provisionedOnDemandCapacity = this.provisionedOnDemandCapacity;
    final provisionedSpotCapacity = this.provisionedSpotCapacity;
    final resizeSpecifications = this.resizeSpecifications;
    final status = this.status;
    final targetOnDemandCapacity = this.targetOnDemandCapacity;
    final targetSpotCapacity = this.targetSpotCapacity;
    return {
      if (context != null) 'Context': context,
      if (id != null) 'Id': id,
      if (instanceFleetType != null)
        'InstanceFleetType': instanceFleetType.value,
      if (instanceTypeSpecifications != null)
        'InstanceTypeSpecifications': instanceTypeSpecifications,
      if (launchSpecifications != null)
        'LaunchSpecifications': launchSpecifications,
      if (name != null) 'Name': name,
      if (provisionedOnDemandCapacity != null)
        'ProvisionedOnDemandCapacity': provisionedOnDemandCapacity,
      if (provisionedSpotCapacity != null)
        'ProvisionedSpotCapacity': provisionedSpotCapacity,
      if (resizeSpecifications != null)
        'ResizeSpecifications': resizeSpecifications,
      if (status != null) 'Status': status,
      if (targetOnDemandCapacity != null)
        'TargetOnDemandCapacity': targetOnDemandCapacity,
      if (targetSpotCapacity != null) 'TargetSpotCapacity': targetSpotCapacity,
    };
  }
}

/// The status of the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleetStatus {
  /// A code representing the instance fleet status.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONING</code>—The instance fleet is provisioning Amazon EC2
  /// resources and is not yet ready to run jobs.
  /// </li>
  /// <li>
  /// <code>BOOTSTRAPPING</code>—Amazon EC2 instances and other resources have
  /// been provisioned and the bootstrap actions specified for the instances are
  /// underway.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>—Amazon EC2 instances and other resources are running.
  /// They are either executing jobs or waiting to execute jobs.
  /// </li>
  /// <li>
  /// <code>RESIZING</code>—A resize operation is underway. Amazon EC2 instances
  /// are either being added or removed.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>—A resize operation could not complete. Existing
  /// Amazon EC2 instances are running, but instances can't be added or removed.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code>—The instance fleet is terminating Amazon EC2
  /// instances.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code>—The instance fleet is no longer active, and all
  /// Amazon EC2 instances have been terminated.
  /// </li>
  /// </ul>
  final InstanceFleetState? state;

  /// Provides status change reason details for the instance fleet.
  final InstanceFleetStateChangeReason? stateChangeReason;

  /// Provides historical timestamps for the instance fleet, including the time of
  /// creation, the time it became ready to run jobs, and the time of termination.
  final InstanceFleetTimeline? timeline;

  InstanceFleetStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });

  factory InstanceFleetStatus.fromJson(Map<String, dynamic> json) {
    return InstanceFleetStatus(
      state: (json['State'] as String?)?.let(InstanceFleetState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? InstanceFleetStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? InstanceFleetTimeline.fromJson(
              json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final timeline = this.timeline;
    return {
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// The configuration specification for each instance type in an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceTypeSpecification {
  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  final String? bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each Amazon EC2 Spot
  /// Instance as defined by <code>InstanceType</code>. Expressed as a number (for
  /// example, 20 specifies 20%).
  final double? bidPriceAsPercentageOfOnDemandPrice;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// bundled with Amazon EMR.
  final List<Configuration>? configurations;

  /// The custom AMI ID to use for the instance type.
  final String? customAmiId;

  /// The configuration of Amazon Elastic Block Store (Amazon EBS) attached to
  /// each instance as defined by <code>InstanceType</code>.
  final List<EbsBlockDevice>? ebsBlockDevices;

  /// Evaluates to <code>TRUE</code> when the specified <code>InstanceType</code>
  /// is EBS-optimized.
  final bool? ebsOptimized;

  /// The Amazon EC2 instance type, for example <code>m3.xlarge</code>.
  final String? instanceType;

  /// The priority at which Amazon EMR launches the Amazon EC2 instances with this
  /// instance type. Priority starts at 0, which is the highest priority. Amazon
  /// EMR considers the highest priority first.
  final double? priority;

  /// The number of units that a provisioned instance of this type provides toward
  /// fulfilling the target capacities defined in <a>InstanceFleetConfig</a>.
  /// Capacity values represent performance characteristics such as vCPUs, memory,
  /// or I/O. If not specified, the default value is 1.
  final int? weightedCapacity;

  InstanceTypeSpecification({
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.configurations,
    this.customAmiId,
    this.ebsBlockDevices,
    this.ebsOptimized,
    this.instanceType,
    this.priority,
    this.weightedCapacity,
  });

  factory InstanceTypeSpecification.fromJson(Map<String, dynamic> json) {
    return InstanceTypeSpecification(
      bidPrice: json['BidPrice'] as String?,
      bidPriceAsPercentageOfOnDemandPrice:
          json['BidPriceAsPercentageOfOnDemandPrice'] as double?,
      configurations: (json['Configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAmiId: json['CustomAmiId'] as String?,
      ebsBlockDevices: (json['EbsBlockDevices'] as List?)
          ?.nonNulls
          .map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      ebsOptimized: json['EbsOptimized'] as bool?,
      instanceType: json['InstanceType'] as String?,
      priority: json['Priority'] as double?,
      weightedCapacity: json['WeightedCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bidPrice = this.bidPrice;
    final bidPriceAsPercentageOfOnDemandPrice =
        this.bidPriceAsPercentageOfOnDemandPrice;
    final configurations = this.configurations;
    final customAmiId = this.customAmiId;
    final ebsBlockDevices = this.ebsBlockDevices;
    final ebsOptimized = this.ebsOptimized;
    final instanceType = this.instanceType;
    final priority = this.priority;
    final weightedCapacity = this.weightedCapacity;
    return {
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (bidPriceAsPercentageOfOnDemandPrice != null)
        'BidPriceAsPercentageOfOnDemandPrice':
            bidPriceAsPercentageOfOnDemandPrice,
      if (configurations != null) 'Configurations': configurations,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsBlockDevices != null) 'EbsBlockDevices': ebsBlockDevices,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
      if (instanceType != null) 'InstanceType': instanceType,
      if (priority != null) 'Priority': priority,
      if (weightedCapacity != null) 'WeightedCapacity': weightedCapacity,
    };
  }
}

/// @nodoc
class InstanceFleetState {
  static const provisioning = InstanceFleetState._('PROVISIONING');
  static const bootstrapping = InstanceFleetState._('BOOTSTRAPPING');
  static const running = InstanceFleetState._('RUNNING');
  static const resizing = InstanceFleetState._('RESIZING');
  static const reconfiguring = InstanceFleetState._('RECONFIGURING');
  static const suspended = InstanceFleetState._('SUSPENDED');
  static const terminating = InstanceFleetState._('TERMINATING');
  static const terminated = InstanceFleetState._('TERMINATED');

  final String value;

  const InstanceFleetState._(this.value);

  static const values = [
    provisioning,
    bootstrapping,
    running,
    resizing,
    reconfiguring,
    suspended,
    terminating,
    terminated
  ];

  static InstanceFleetState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceFleetState._(value));

  @override
  bool operator ==(other) =>
      other is InstanceFleetState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides status change reason details for the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleetStateChangeReason {
  /// A code corresponding to the reason the state change occurred.
  final InstanceFleetStateChangeReasonCode? code;

  /// An explanatory message.
  final String? message;

  InstanceFleetStateChangeReason({
    this.code,
    this.message,
  });

  factory InstanceFleetStateChangeReason.fromJson(Map<String, dynamic> json) {
    return InstanceFleetStateChangeReason(
      code: (json['Code'] as String?)
          ?.let(InstanceFleetStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// Provides historical timestamps for the instance fleet, including the time of
/// creation, the time it became ready to run jobs, and the time of termination.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
///
/// @nodoc
class InstanceFleetTimeline {
  /// The time and date the instance fleet was created.
  final DateTime? creationDateTime;

  /// The time and date the instance fleet terminated.
  final DateTime? endDateTime;

  /// The time and date the instance fleet was ready to run jobs.
  final DateTime? readyDateTime;

  InstanceFleetTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });

  factory InstanceFleetTimeline.fromJson(Map<String, dynamic> json) {
    return InstanceFleetTimeline(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final readyDateTime = this.readyDateTime;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
    };
  }
}

/// @nodoc
class InstanceFleetStateChangeReasonCode {
  static const internalError =
      InstanceFleetStateChangeReasonCode._('INTERNAL_ERROR');
  static const validationError =
      InstanceFleetStateChangeReasonCode._('VALIDATION_ERROR');
  static const instanceFailure =
      InstanceFleetStateChangeReasonCode._('INSTANCE_FAILURE');
  static const clusterTerminated =
      InstanceFleetStateChangeReasonCode._('CLUSTER_TERMINATED');

  final String value;

  const InstanceFleetStateChangeReasonCode._(this.value);

  static const values = [
    internalError,
    validationError,
    instanceFailure,
    clusterTerminated
  ];

  static InstanceFleetStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceFleetStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is InstanceFleetStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary description of the cluster.
///
/// @nodoc
class ClusterSummary {
  /// The Amazon Resource Name of the cluster.
  final String? clusterArn;

  /// The unique identifier for the cluster.
  final String? id;

  /// The name of the cluster.
  final String? name;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is incremented one time for every hour an m1.small instance runs.
  /// Larger instances are weighted more, so an Amazon EC2 instance that is
  /// roughly four times more expensive would result in the normalized instance
  /// hours being incremented by four. This result is only an approximation and
  /// does not reflect the actual billing rate.
  final int? normalizedInstanceHours;

  /// The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.
  final String? outpostArn;

  /// The details about the current status of the cluster.
  final ClusterStatus? status;

  ClusterSummary({
    this.clusterArn,
    this.id,
    this.name,
    this.normalizedInstanceHours,
    this.outpostArn,
    this.status,
  });

  factory ClusterSummary.fromJson(Map<String, dynamic> json) {
    return ClusterSummary(
      clusterArn: json['ClusterArn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
      outpostArn: json['OutpostArn'] as String?,
      status: json['Status'] != null
          ? ClusterStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final id = this.id;
    final name = this.name;
    final normalizedInstanceHours = this.normalizedInstanceHours;
    final outpostArn = this.outpostArn;
    final status = this.status;
    return {
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (normalizedInstanceHours != null)
        'NormalizedInstanceHours': normalizedInstanceHours,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (status != null) 'Status': status,
    };
  }
}

/// The detailed status of the cluster.
///
/// @nodoc
class ClusterStatus {
  /// A list of tuples that provides information about the errors that caused a
  /// cluster to terminate. This structure can contain up to 10 different
  /// <code>ErrorDetail</code> tuples.
  final List<ErrorDetail>? errorDetails;

  /// The current state of the cluster.
  final ClusterState? state;

  /// The reason for the cluster status change.
  final ClusterStateChangeReason? stateChangeReason;

  /// A timeline that represents the status of a cluster over the lifetime of the
  /// cluster.
  final ClusterTimeline? timeline;

  ClusterStatus({
    this.errorDetails,
    this.state,
    this.stateChangeReason,
    this.timeline,
  });

  factory ClusterStatus.fromJson(Map<String, dynamic> json) {
    return ClusterStatus(
      errorDetails: (json['ErrorDetails'] as List?)
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['State'] as String?)?.let(ClusterState.fromString),
      stateChangeReason: json['StateChangeReason'] != null
          ? ClusterStateChangeReason.fromJson(
              json['StateChangeReason'] as Map<String, dynamic>)
          : null,
      timeline: json['Timeline'] != null
          ? ClusterTimeline.fromJson(json['Timeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetails = this.errorDetails;
    final state = this.state;
    final stateChangeReason = this.stateChangeReason;
    final timeline = this.timeline;
    return {
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (state != null) 'State': state.value,
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// @nodoc
class ClusterState {
  static const starting = ClusterState._('STARTING');
  static const bootstrapping = ClusterState._('BOOTSTRAPPING');
  static const running = ClusterState._('RUNNING');
  static const waiting = ClusterState._('WAITING');
  static const terminating = ClusterState._('TERMINATING');
  static const terminated = ClusterState._('TERMINATED');
  static const terminatedWithErrors = ClusterState._('TERMINATED_WITH_ERRORS');

  final String value;

  const ClusterState._(this.value);

  static const values = [
    starting,
    bootstrapping,
    running,
    waiting,
    terminating,
    terminated,
    terminatedWithErrors
  ];

  static ClusterState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ClusterState._(value));

  @override
  bool operator ==(other) => other is ClusterState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The reason that the cluster changed to its current state.
///
/// @nodoc
class ClusterStateChangeReason {
  /// The programmatic code for the state change reason.
  final ClusterStateChangeReasonCode? code;

  /// The descriptive message for the state change reason.
  final String? message;

  ClusterStateChangeReason({
    this.code,
    this.message,
  });

  factory ClusterStateChangeReason.fromJson(Map<String, dynamic> json) {
    return ClusterStateChangeReason(
      code: (json['Code'] as String?)
          ?.let(ClusterStateChangeReasonCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// Represents the timeline of the cluster's lifecycle.
///
/// @nodoc
class ClusterTimeline {
  /// The creation date and time of the cluster.
  final DateTime? creationDateTime;

  /// The date and time when the cluster was terminated.
  final DateTime? endDateTime;

  /// The date and time when the cluster was ready to run steps.
  final DateTime? readyDateTime;

  ClusterTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });

  factory ClusterTimeline.fromJson(Map<String, dynamic> json) {
    return ClusterTimeline(
      creationDateTime: timeStampFromJson(json['CreationDateTime']),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final readyDateTime = this.readyDateTime;
    return {
      if (creationDateTime != null)
        'CreationDateTime': unixTimestampToJson(creationDateTime),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
    };
  }
}

/// A tuple that provides information about an error that caused a cluster to
/// terminate.
///
/// @nodoc
class ErrorDetail {
  /// The name or code associated with the error.
  final String? errorCode;

  /// A list of key value pairs that provides contextual information about why an
  /// error occured.
  final List<Map<String, String>>? errorData;

  /// A message that describes the error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorData,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: json['ErrorCode'] as String?,
      errorData: (json['ErrorData'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorData = this.errorData;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorData != null) 'ErrorData': errorData,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// @nodoc
class ClusterStateChangeReasonCode {
  static const internalError = ClusterStateChangeReasonCode._('INTERNAL_ERROR');
  static const validationError =
      ClusterStateChangeReasonCode._('VALIDATION_ERROR');
  static const instanceFailure =
      ClusterStateChangeReasonCode._('INSTANCE_FAILURE');
  static const instanceFleetTimeout =
      ClusterStateChangeReasonCode._('INSTANCE_FLEET_TIMEOUT');
  static const bootstrapFailure =
      ClusterStateChangeReasonCode._('BOOTSTRAP_FAILURE');
  static const userRequest = ClusterStateChangeReasonCode._('USER_REQUEST');
  static const stepFailure = ClusterStateChangeReasonCode._('STEP_FAILURE');
  static const allStepsCompleted =
      ClusterStateChangeReasonCode._('ALL_STEPS_COMPLETED');

  final String value;

  const ClusterStateChangeReasonCode._(this.value);

  static const values = [
    internalError,
    validationError,
    instanceFailure,
    instanceFleetTimeout,
    bootstrapFailure,
    userRequest,
    stepFailure,
    allStepsCompleted
  ];

  static ClusterStateChangeReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterStateChangeReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is ClusterStateChangeReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An entity describing an executable that runs on a cluster.
///
/// @nodoc
class Command {
  /// Arguments for Amazon EMR to pass to the command for execution.
  final List<String>? args;

  /// The name of the command.
  final String? name;

  /// The Amazon S3 location of the command script.
  final String? scriptPath;

  Command({
    this.args,
    this.name,
    this.scriptPath,
  });

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      args: (json['Args'] as List?)?.nonNulls.map((e) => e as String).toList(),
      name: json['Name'] as String?,
      scriptPath: json['ScriptPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final args = this.args;
    final name = this.name;
    final scriptPath = this.scriptPath;
    return {
      if (args != null) 'Args': args,
      if (name != null) 'Name': name,
      if (scriptPath != null) 'ScriptPath': scriptPath,
    };
  }
}

/// Details for an Amazon EMR Studio session mapping including creation time,
/// user or group ID, Studio ID, and so on.
///
/// @nodoc
class SessionMappingDetail {
  /// The time the session mapping was created.
  final DateTime? creationTime;

  /// The globally unique identifier (GUID) of the user or group.
  final String? identityId;

  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserName">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>IAM Identity Center Identity Store API Reference</i>.
  final String? identityName;

  /// Specifies whether the identity mapped to the Amazon EMR Studio is a user or
  /// a group.
  final IdentityType? identityType;

  /// The time the session mapping was last modified.
  final DateTime? lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the session policy associated with the
  /// user or group.
  final String? sessionPolicyArn;

  /// The ID of the Amazon EMR Studio.
  final String? studioId;

  SessionMappingDetail({
    this.creationTime,
    this.identityId,
    this.identityName,
    this.identityType,
    this.lastModifiedTime,
    this.sessionPolicyArn,
    this.studioId,
  });

  factory SessionMappingDetail.fromJson(Map<String, dynamic> json) {
    return SessionMappingDetail(
      creationTime: timeStampFromJson(json['CreationTime']),
      identityId: json['IdentityId'] as String?,
      identityName: json['IdentityName'] as String?,
      identityType:
          (json['IdentityType'] as String?)?.let(IdentityType.fromString),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      sessionPolicyArn: json['SessionPolicyArn'] as String?,
      studioId: json['StudioId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identityId = this.identityId;
    final identityName = this.identityName;
    final identityType = this.identityType;
    final lastModifiedTime = this.lastModifiedTime;
    final sessionPolicyArn = this.sessionPolicyArn;
    final studioId = this.studioId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (identityId != null) 'IdentityId': identityId,
      if (identityName != null) 'IdentityName': identityName,
      if (identityType != null) 'IdentityType': identityType.value,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sessionPolicyArn != null) 'SessionPolicyArn': sessionPolicyArn,
      if (studioId != null) 'StudioId': studioId,
    };
  }
}

/// The credentials that you can use to connect to cluster endpoints.
/// Credentials consist of a username and a password.
///
/// @nodoc
class Credentials {
  /// The username and password that you use to connect to cluster endpoints.
  final UsernamePassword? usernamePassword;

  Credentials({
    this.usernamePassword,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      usernamePassword: json['UsernamePassword'] != null
          ? UsernamePassword.fromJson(
              json['UsernamePassword'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usernamePassword = this.usernamePassword;
    return {
      if (usernamePassword != null) 'UsernamePassword': usernamePassword,
    };
  }
}

/// The username and password that you use to connect to cluster endpoints.
///
/// @nodoc
class UsernamePassword {
  /// The password associated with the temporary credentials that you use to
  /// connect to cluster endpoints.
  final String? password;

  /// The username associated with the temporary credentials that you use to
  /// connect to cluster endpoints.
  final String? username;

  UsernamePassword({
    this.password,
    this.username,
  });

  factory UsernamePassword.fromJson(Map<String, dynamic> json) {
    return UsernamePassword(
      password: json['Password'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      if (password != null) 'Password': password,
      if (username != null) 'Username': username,
    };
  }
}

/// @nodoc
class PersistentAppUIType {
  static const shs = PersistentAppUIType._('SHS');
  static const tez = PersistentAppUIType._('TEZ');
  static const yts = PersistentAppUIType._('YTS');

  final String value;

  const PersistentAppUIType._(this.value);

  static const values = [shs, tez, yts];

  static PersistentAppUIType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PersistentAppUIType._(value));

  @override
  bool operator ==(other) =>
      other is PersistentAppUIType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OnClusterAppUIType {
  static const sparkHistoryServer = OnClusterAppUIType._('SparkHistoryServer');
  static const yarnTimelineService =
      OnClusterAppUIType._('YarnTimelineService');
  static const tezUI = OnClusterAppUIType._('TezUI');
  static const applicationMaster = OnClusterAppUIType._('ApplicationMaster');
  static const jobHistoryServer = OnClusterAppUIType._('JobHistoryServer');
  static const resourceManager = OnClusterAppUIType._('ResourceManager');

  final String value;

  const OnClusterAppUIType._(this.value);

  static const values = [
    sparkHistoryServer,
    yarnTimelineService,
    tezUI,
    applicationMaster,
    jobHistoryServer,
    resourceManager
  ];

  static OnClusterAppUIType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OnClusterAppUIType._(value));

  @override
  bool operator ==(other) =>
      other is OnClusterAppUIType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Properties that describe the Amazon Web Services principal that created the
/// <code>BlockPublicAccessConfiguration</code> using the
/// <code>PutBlockPublicAccessConfiguration</code> action as well as the date
/// and time that the configuration was created. Each time a configuration for
/// block public access is updated, Amazon EMR updates this metadata.
///
/// @nodoc
class BlockPublicAccessConfigurationMetadata {
  /// The Amazon Resource Name that created or last modified the configuration.
  final String createdByArn;

  /// The date and time that the configuration was created.
  final DateTime creationDateTime;

  BlockPublicAccessConfigurationMetadata({
    required this.createdByArn,
    required this.creationDateTime,
  });

  factory BlockPublicAccessConfigurationMetadata.fromJson(
      Map<String, dynamic> json) {
    return BlockPublicAccessConfigurationMetadata(
      createdByArn: (json['CreatedByArn'] as String?) ?? '',
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createdByArn = this.createdByArn;
    final creationDateTime = this.creationDateTime;
    return {
      'CreatedByArn': createdByArn,
      'CreationDateTime': unixTimestampToJson(creationDateTime),
    };
  }
}

/// Details for an Amazon EMR Studio including ID, creation time, name, and so
/// on.
///
/// @nodoc
class Studio {
  /// Specifies whether the Amazon EMR Studio authenticates users with IAM or IAM
  /// Identity Center.
  final AuthMode? authMode;

  /// The time the Amazon EMR Studio was created.
  final DateTime? creationTime;

  /// The Amazon S3 location to back up Amazon EMR Studio Workspaces and notebook
  /// files.
  final String? defaultS3Location;

  /// The detailed description of the Amazon EMR Studio.
  final String? description;

  /// The KMS key identifier (ARN) used to encrypt Amazon EMR Studio workspace and
  /// notebook files when backed up to Amazon S3.
  final String? encryptionKeyArn;

  /// The ID of the Engine security group associated with the Amazon EMR Studio.
  /// The Engine security group allows inbound network traffic from resources in
  /// the Workspace security group.
  final String? engineSecurityGroupId;

  /// The ARN of the IAM Identity Center instance the Studio application belongs
  /// to.
  final String? idcInstanceArn;

  /// Indicates whether the Studio has <code>REQUIRED</code> or
  /// <code>OPTIONAL</code> IAM Identity Center user assignment. If the value is
  /// set to <code>REQUIRED</code>, users must be explicitly assigned to the
  /// Studio application to access the Studio.
  final IdcUserAssignment? idcUserAssignment;

  /// Your identity provider's authentication endpoint. Amazon EMR Studio
  /// redirects federated users to this endpoint for authentication when logging
  /// in to a Studio with the Studio URL.
  final String? idpAuthUrl;

  /// The name of your identity provider's <code>RelayState</code> parameter.
  final String? idpRelayStateParameterName;

  /// The name of the Amazon EMR Studio.
  final String? name;

  /// The name of the IAM role assumed by the Amazon EMR Studio.
  final String? serviceRole;

  /// The Amazon Resource Name (ARN) of the Amazon EMR Studio.
  final String? studioArn;

  /// The ID of the Amazon EMR Studio.
  final String? studioId;

  /// The list of IDs of the subnets associated with the Amazon EMR Studio.
  final List<String>? subnetIds;

  /// A list of tags associated with the Amazon EMR Studio.
  final List<Tag>? tags;

  /// Indicates whether the Studio has Trusted identity propagation enabled. The
  /// default value is <code>false</code>.
  final bool? trustedIdentityPropagationEnabled;

  /// The unique access URL of the Amazon EMR Studio.
  final String? url;

  /// The name of the IAM role assumed by users logged in to the Amazon EMR
  /// Studio. A Studio only requires a <code>UserRole</code> when you use IAM
  /// authentication.
  final String? userRole;

  /// The ID of the VPC associated with the Amazon EMR Studio.
  final String? vpcId;

  /// The ID of the Workspace security group associated with the Amazon EMR
  /// Studio. The Workspace security group allows outbound network traffic to
  /// resources in the Engine security group and to the internet.
  final String? workspaceSecurityGroupId;

  Studio({
    this.authMode,
    this.creationTime,
    this.defaultS3Location,
    this.description,
    this.encryptionKeyArn,
    this.engineSecurityGroupId,
    this.idcInstanceArn,
    this.idcUserAssignment,
    this.idpAuthUrl,
    this.idpRelayStateParameterName,
    this.name,
    this.serviceRole,
    this.studioArn,
    this.studioId,
    this.subnetIds,
    this.tags,
    this.trustedIdentityPropagationEnabled,
    this.url,
    this.userRole,
    this.vpcId,
    this.workspaceSecurityGroupId,
  });

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      authMode: (json['AuthMode'] as String?)?.let(AuthMode.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultS3Location: json['DefaultS3Location'] as String?,
      description: json['Description'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      engineSecurityGroupId: json['EngineSecurityGroupId'] as String?,
      idcInstanceArn: json['IdcInstanceArn'] as String?,
      idcUserAssignment: (json['IdcUserAssignment'] as String?)
          ?.let(IdcUserAssignment.fromString),
      idpAuthUrl: json['IdpAuthUrl'] as String?,
      idpRelayStateParameterName: json['IdpRelayStateParameterName'] as String?,
      name: json['Name'] as String?,
      serviceRole: json['ServiceRole'] as String?,
      studioArn: json['StudioArn'] as String?,
      studioId: json['StudioId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      trustedIdentityPropagationEnabled:
          json['TrustedIdentityPropagationEnabled'] as bool?,
      url: json['Url'] as String?,
      userRole: json['UserRole'] as String?,
      vpcId: json['VpcId'] as String?,
      workspaceSecurityGroupId: json['WorkspaceSecurityGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authMode = this.authMode;
    final creationTime = this.creationTime;
    final defaultS3Location = this.defaultS3Location;
    final description = this.description;
    final encryptionKeyArn = this.encryptionKeyArn;
    final engineSecurityGroupId = this.engineSecurityGroupId;
    final idcInstanceArn = this.idcInstanceArn;
    final idcUserAssignment = this.idcUserAssignment;
    final idpAuthUrl = this.idpAuthUrl;
    final idpRelayStateParameterName = this.idpRelayStateParameterName;
    final name = this.name;
    final serviceRole = this.serviceRole;
    final studioArn = this.studioArn;
    final studioId = this.studioId;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final trustedIdentityPropagationEnabled =
        this.trustedIdentityPropagationEnabled;
    final url = this.url;
    final userRole = this.userRole;
    final vpcId = this.vpcId;
    final workspaceSecurityGroupId = this.workspaceSecurityGroupId;
    return {
      if (authMode != null) 'AuthMode': authMode.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultS3Location != null) 'DefaultS3Location': defaultS3Location,
      if (description != null) 'Description': description,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (engineSecurityGroupId != null)
        'EngineSecurityGroupId': engineSecurityGroupId,
      if (idcInstanceArn != null) 'IdcInstanceArn': idcInstanceArn,
      if (idcUserAssignment != null)
        'IdcUserAssignment': idcUserAssignment.value,
      if (idpAuthUrl != null) 'IdpAuthUrl': idpAuthUrl,
      if (idpRelayStateParameterName != null)
        'IdpRelayStateParameterName': idpRelayStateParameterName,
      if (name != null) 'Name': name,
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (studioArn != null) 'StudioArn': studioArn,
      if (studioId != null) 'StudioId': studioId,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (tags != null) 'Tags': tags,
      if (trustedIdentityPropagationEnabled != null)
        'TrustedIdentityPropagationEnabled': trustedIdentityPropagationEnabled,
      if (url != null) 'Url': url,
      if (userRole != null) 'UserRole': userRole,
      if (vpcId != null) 'VpcId': vpcId,
      if (workspaceSecurityGroupId != null)
        'WorkspaceSecurityGroupId': workspaceSecurityGroupId,
    };
  }
}

/// @nodoc
class IdcUserAssignment {
  static const required = IdcUserAssignment._('REQUIRED');
  static const optional = IdcUserAssignment._('OPTIONAL');

  final String value;

  const IdcUserAssignment._(this.value);

  static const values = [required, optional];

  static IdcUserAssignment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdcUserAssignment._(value));

  @override
  bool operator ==(other) => other is IdcUserAssignment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This represents a step in a cluster.
///
/// @nodoc
class Step {
  /// The action to take when the cluster step fails. Possible values are
  /// <code>TERMINATE_CLUSTER</code>, <code>CANCEL_AND_WAIT</code>, and
  /// <code>CONTINUE</code>. <code>TERMINATE_JOB_FLOW</code> is provided for
  /// backward compatibility. We recommend using <code>TERMINATE_CLUSTER</code>
  /// instead.
  ///
  /// If a cluster's <code>StepConcurrencyLevel</code> is greater than
  /// <code>1</code>, do not use <code>AddJobFlowSteps</code> to submit a step
  /// with this parameter set to <code>CANCEL_AND_WAIT</code> or
  /// <code>TERMINATE_CLUSTER</code>. The step is not submitted and the action
  /// fails with a message that the <code>ActionOnFailure</code> setting is not
  /// valid.
  ///
  /// If you change a cluster's <code>StepConcurrencyLevel</code> to be greater
  /// than 1 while a step is running, the <code>ActionOnFailure</code> parameter
  /// may not behave as you expect. In this case, for a step that fails with this
  /// parameter set to <code>CANCEL_AND_WAIT</code>, pending steps and the running
  /// step are not canceled; for a step that fails with this parameter set to
  /// <code>TERMINATE_CLUSTER</code>, the cluster does not terminate.
  final ActionOnFailure? actionOnFailure;

  /// The Hadoop job configuration of the cluster step.
  final HadoopStepConfig? config;

  /// The KMS key ARN to encrypt the logs published to the given Amazon S3
  /// destination.
  final String? encryptionKeyArn;

  /// The Amazon Resource Name (ARN) of the runtime role for a step on the
  /// cluster. The runtime role can be a cross-account IAM role. The runtime role
  /// ARN is a combination of account ID, role name, and role type using the
  /// following format:
  /// <code>arn:partition:service:region:account:resource</code>.
  ///
  /// For example, <code>arn:aws:IAM::1234567890:role/ReadOnly</code> is a
  /// correctly formatted runtime role ARN.
  final String? executionRoleArn;

  /// The identifier of the cluster step.
  final String? id;

  /// The Amazon S3 destination URI for log publishing.
  final String? logUri;

  /// The name of the cluster step.
  final String? name;

  /// The current execution status details of the cluster step.
  final StepStatus? status;

  Step({
    this.actionOnFailure,
    this.config,
    this.encryptionKeyArn,
    this.executionRoleArn,
    this.id,
    this.logUri,
    this.name,
    this.status,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.let(ActionOnFailure.fromString),
      config: json['Config'] != null
          ? HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>)
          : null,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      id: json['Id'] as String?,
      logUri: json['LogUri'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] != null
          ? StepStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionOnFailure = this.actionOnFailure;
    final config = this.config;
    final encryptionKeyArn = this.encryptionKeyArn;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final logUri = this.logUri;
    final name = this.name;
    final status = this.status;
    return {
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.value,
      if (config != null) 'Config': config,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (id != null) 'Id': id,
      if (logUri != null) 'LogUri': logUri,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

/// The Amazon Linux release specified for a cluster in the RunJobFlow request.
///
/// @nodoc
class OSRelease {
  /// The Amazon Linux release specified for a cluster in the RunJobFlow request.
  /// The format is as shown in <a
  /// href="https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-20220218.html">
  /// <i>Amazon Linux 2 Release Notes</i> </a>. For example, 2.0.20220218.1.
  final String? label;

  OSRelease({
    this.label,
  });

  factory OSRelease.fromJson(Map<String, dynamic> json) {
    return OSRelease(
      label: json['Label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    return {
      if (label != null) 'Label': label,
    };
  }
}

/// The returned release label application names or versions.
///
/// @nodoc
class SimplifiedApplication {
  /// The returned release label application name. For example,
  /// <code>hadoop</code>.
  final String? name;

  /// The returned release label application version. For example,
  /// <code>3.2.1</code>.
  final String? version;

  SimplifiedApplication({
    this.name,
    this.version,
  });

  factory SimplifiedApplication.fromJson(Map<String, dynamic> json) {
    return SimplifiedApplication(
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// Holds persistent application user interface information. Applications
/// installed on the Amazon EMR cluster publish user interfaces as web sites to
/// monitor cluster activity.
///
/// @nodoc
class PersistentAppUI {
  /// The author ID for the persistent application user interface object.
  final String? authorId;

  /// The creation date and time for the persistent application user interface
  /// object.
  final DateTime? creationTime;

  /// The date and time the persistent application user interface object was last
  /// changed.
  final DateTime? lastModifiedTime;

  /// The reason the persistent application user interface object was last
  /// changed.
  final String? lastStateChangeReason;

  /// The identifier for the persistent application user interface object.
  final String? persistentAppUIId;

  /// The status for the persistent application user interface object.
  final String? persistentAppUIStatus;

  /// The type list for the persistent application user interface object. Valid
  /// values include SHS, YTS, or TEZ.
  final List<PersistentAppUIType>? persistentAppUITypeList;

  /// A collection of tags for the persistent application user interface object.
  final List<Tag>? tags;

  PersistentAppUI({
    this.authorId,
    this.creationTime,
    this.lastModifiedTime,
    this.lastStateChangeReason,
    this.persistentAppUIId,
    this.persistentAppUIStatus,
    this.persistentAppUITypeList,
    this.tags,
  });

  factory PersistentAppUI.fromJson(Map<String, dynamic> json) {
    return PersistentAppUI(
      authorId: json['AuthorId'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      lastStateChangeReason: json['LastStateChangeReason'] as String?,
      persistentAppUIId: json['PersistentAppUIId'] as String?,
      persistentAppUIStatus: json['PersistentAppUIStatus'] as String?,
      persistentAppUITypeList: (json['PersistentAppUITypeList'] as List?)
          ?.nonNulls
          .map((e) => PersistentAppUIType.fromString((e as String)))
          .toList(),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authorId = this.authorId;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final lastStateChangeReason = this.lastStateChangeReason;
    final persistentAppUIId = this.persistentAppUIId;
    final persistentAppUIStatus = this.persistentAppUIStatus;
    final persistentAppUITypeList = this.persistentAppUITypeList;
    final tags = this.tags;
    return {
      if (authorId != null) 'AuthorId': authorId,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (persistentAppUIId != null) 'PersistentAppUIId': persistentAppUIId,
      if (persistentAppUIStatus != null)
        'PersistentAppUIStatus': persistentAppUIStatus,
      if (persistentAppUITypeList != null)
        'PersistentAppUITypeList':
            persistentAppUITypeList.map((e) => e.value).toList(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A notebook execution. An execution is a specific instance that an Amazon EMR
/// Notebook is run using the <code>StartNotebookExecution</code> action.
///
/// @nodoc
class NotebookExecution {
  /// The Amazon Resource Name (ARN) of the notebook execution.
  final String? arn;

  /// The unique identifier of the Amazon EMR Notebook that is used for the
  /// notebook execution.
  final String? editorId;

  /// The timestamp when notebook execution ended.
  final DateTime? endTime;

  /// The environment variables associated with the notebook execution.
  final Map<String, String>? environmentVariables;

  /// The execution engine, such as an Amazon EMR cluster, used to run the Amazon
  /// EMR notebook and perform the notebook execution.
  final ExecutionEngineConfig? executionEngine;

  /// The reason for the latest status change of the notebook execution.
  final String? lastStateChangeReason;

  /// The unique identifier of a notebook execution.
  final String? notebookExecutionId;

  /// A name for the notebook execution.
  final String? notebookExecutionName;

  /// The unique identifier of the Amazon EC2 security group associated with the
  /// Amazon EMR Notebook instance. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html">Specifying
  /// Amazon EC2 Security Groups for Amazon EMR Notebooks</a> in the <i>Amazon EMR
  /// Management Guide</i>.
  final String? notebookInstanceSecurityGroupId;

  /// Input parameters in JSON format passed to the Amazon EMR Notebook at runtime
  /// for execution.
  final String? notebookParams;

  /// The Amazon S3 location that stores the notebook execution input.
  final NotebookS3LocationForOutput? notebookS3Location;

  /// The output format for the notebook execution.
  final OutputNotebookFormat? outputNotebookFormat;

  /// The Amazon S3 location for the notebook execution output.
  final OutputNotebookS3LocationForOutput? outputNotebookS3Location;

  /// The location of the notebook execution's output file in Amazon S3.
  final String? outputNotebookURI;

  /// The timestamp when notebook execution started.
  final DateTime? startTime;

  /// The status of the notebook execution.
  ///
  /// <ul>
  /// <li>
  /// <code>START_PENDING</code> indicates that the cluster has received the
  /// execution request but execution has not begun.
  /// </li>
  /// <li>
  /// <code>STARTING</code> indicates that the execution is starting on the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> indicates that the execution is being processed by the
  /// cluster.
  /// </li>
  /// <li>
  /// <code>FINISHING</code> indicates that execution processing is in the final
  /// stages.
  /// </li>
  /// <li>
  /// <code>FINISHED</code> indicates that the execution has completed without
  /// error.
  /// </li>
  /// <li>
  /// <code>FAILING</code> indicates that the execution is failing and will not
  /// finish successfully.
  /// </li>
  /// <li>
  /// <code>FAILED</code> indicates that the execution failed.
  /// </li>
  /// <li>
  /// <code>STOP_PENDING</code> indicates that the cluster has received a
  /// <code>StopNotebookExecution</code> request and the stop is pending.
  /// </li>
  /// <li>
  /// <code>STOPPING</code> indicates that the cluster is in the process of
  /// stopping the execution as a result of a <code>StopNotebookExecution</code>
  /// request.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> indicates that the execution stopped because of a
  /// <code>StopNotebookExecution</code> request.
  /// </li>
  /// </ul>
  final NotebookExecutionStatus? status;

  /// A list of tags associated with a notebook execution. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of 128
  /// characters and an optional value string with a maximum of 256 characters.
  final List<Tag>? tags;

  NotebookExecution({
    this.arn,
    this.editorId,
    this.endTime,
    this.environmentVariables,
    this.executionEngine,
    this.lastStateChangeReason,
    this.notebookExecutionId,
    this.notebookExecutionName,
    this.notebookInstanceSecurityGroupId,
    this.notebookParams,
    this.notebookS3Location,
    this.outputNotebookFormat,
    this.outputNotebookS3Location,
    this.outputNotebookURI,
    this.startTime,
    this.status,
    this.tags,
  });

  factory NotebookExecution.fromJson(Map<String, dynamic> json) {
    return NotebookExecution(
      arn: json['Arn'] as String?,
      editorId: json['EditorId'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      environmentVariables:
          (json['EnvironmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      executionEngine: json['ExecutionEngine'] != null
          ? ExecutionEngineConfig.fromJson(
              json['ExecutionEngine'] as Map<String, dynamic>)
          : null,
      lastStateChangeReason: json['LastStateChangeReason'] as String?,
      notebookExecutionId: json['NotebookExecutionId'] as String?,
      notebookExecutionName: json['NotebookExecutionName'] as String?,
      notebookInstanceSecurityGroupId:
          json['NotebookInstanceSecurityGroupId'] as String?,
      notebookParams: json['NotebookParams'] as String?,
      notebookS3Location: json['NotebookS3Location'] != null
          ? NotebookS3LocationForOutput.fromJson(
              json['NotebookS3Location'] as Map<String, dynamic>)
          : null,
      outputNotebookFormat: (json['OutputNotebookFormat'] as String?)
          ?.let(OutputNotebookFormat.fromString),
      outputNotebookS3Location: json['OutputNotebookS3Location'] != null
          ? OutputNotebookS3LocationForOutput.fromJson(
              json['OutputNotebookS3Location'] as Map<String, dynamic>)
          : null,
      outputNotebookURI: json['OutputNotebookURI'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status:
          (json['Status'] as String?)?.let(NotebookExecutionStatus.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final editorId = this.editorId;
    final endTime = this.endTime;
    final environmentVariables = this.environmentVariables;
    final executionEngine = this.executionEngine;
    final lastStateChangeReason = this.lastStateChangeReason;
    final notebookExecutionId = this.notebookExecutionId;
    final notebookExecutionName = this.notebookExecutionName;
    final notebookInstanceSecurityGroupId =
        this.notebookInstanceSecurityGroupId;
    final notebookParams = this.notebookParams;
    final notebookS3Location = this.notebookS3Location;
    final outputNotebookFormat = this.outputNotebookFormat;
    final outputNotebookS3Location = this.outputNotebookS3Location;
    final outputNotebookURI = this.outputNotebookURI;
    final startTime = this.startTime;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (editorId != null) 'EditorId': editorId,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (environmentVariables != null)
        'EnvironmentVariables': environmentVariables,
      if (executionEngine != null) 'ExecutionEngine': executionEngine,
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (notebookExecutionId != null)
        'NotebookExecutionId': notebookExecutionId,
      if (notebookExecutionName != null)
        'NotebookExecutionName': notebookExecutionName,
      if (notebookInstanceSecurityGroupId != null)
        'NotebookInstanceSecurityGroupId': notebookInstanceSecurityGroupId,
      if (notebookParams != null) 'NotebookParams': notebookParams,
      if (notebookS3Location != null) 'NotebookS3Location': notebookS3Location,
      if (outputNotebookFormat != null)
        'OutputNotebookFormat': outputNotebookFormat.value,
      if (outputNotebookS3Location != null)
        'OutputNotebookS3Location': outputNotebookS3Location,
      if (outputNotebookURI != null) 'OutputNotebookURI': outputNotebookURI,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The Amazon S3 location that stores the notebook execution output.
///
/// @nodoc
class OutputNotebookS3LocationForOutput {
  /// The Amazon S3 bucket that stores the notebook execution output.
  final String? bucket;

  /// The key to the Amazon S3 location that stores the notebook execution output.
  final String? key;

  OutputNotebookS3LocationForOutput({
    this.bucket,
    this.key,
  });

  factory OutputNotebookS3LocationForOutput.fromJson(
      Map<String, dynamic> json) {
    return OutputNotebookS3LocationForOutput(
      bucket: json['Bucket'] as String?,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

/// A description of a cluster (job flow).
///
/// @nodoc
class JobFlowDetail {
  /// Describes the execution status of the job flow.
  final JobFlowExecutionStatusDetail executionStatusDetail;

  /// Describes the Amazon EC2 instances of the job flow.
  final JobFlowInstancesDetail instances;

  /// The job flow identifier.
  final String jobFlowId;

  /// The name of the job flow.
  final String name;

  /// Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases
  /// 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI,
  /// use <code>CustomAmiID</code>.
  final String? amiVersion;

  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides a way for
  /// the automatic scaling feature to get the required permissions it needs to
  /// launch and terminate Amazon EC2 instances in an instance group.
  final String? autoScalingRole;

  /// A list of the bootstrap actions run by the job flow.
  final List<BootstrapActionDetail>? bootstrapActions;

  /// The IAM role that was specified when the job flow was launched. The Amazon
  /// EC2 instances of the job flow assume this role.
  final String? jobFlowRole;

  /// The KMS key used for encrypting log files. This attribute is only available
  /// with Amazon EMR 5.30.0 and later, excluding 6.0.0.
  final String? logEncryptionKmsKeyId;

  /// The location in Amazon S3 where log files for the job are stored.
  final String? logUri;

  /// The way that individual Amazon EC2 instances terminate when an automatic
  /// scale-in activity occurs or an instance group is resized.
  /// <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates
  /// nodes at the instance-hour boundary, regardless of when the request to
  /// terminate the instance was submitted. This option is only available with
  /// Amazon EMR 5.1.0 and later and is the default for clusters created using
  /// that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that
  /// Amazon EMR adds nodes to a deny list and drains tasks from nodes before
  /// terminating the Amazon EC2 instances, regardless of the instance-hour
  /// boundary. With either behavior, Amazon EMR removes the least active nodes
  /// first and blocks instance termination if it could lead to HDFS corruption.
  /// <code>TERMINATE_AT_TASK_COMPLETION</code> available only in Amazon EMR
  /// releases 4.1.0 and later, and is the default for releases of Amazon EMR
  /// earlier than 5.1.0.
  final ScaleDownBehavior? scaleDownBehavior;

  /// The IAM role that is assumed by the Amazon EMR service to access Amazon Web
  /// Services resources on your behalf.
  final String? serviceRole;

  /// A list of steps run by the job flow.
  final List<StepDetail>? steps;

  /// A list of strings set by third-party software when the job flow is launched.
  /// If you are not using third-party software to manage the job flow, this value
  /// is empty.
  final List<String>? supportedProducts;

  /// Indicates whether the cluster is visible to IAM principals in the Amazon Web
  /// Services account associated with the cluster. When <code>true</code>, IAM
  /// principals in the Amazon Web Services account can perform Amazon EMR cluster
  /// actions that their IAM policies allow. When <code>false</code>, only the IAM
  /// principal that created the cluster and the Amazon Web Services account root
  /// user can perform Amazon EMR actions, regardless of IAM permissions policies
  /// attached to other IAM principals.
  ///
  /// The default value is <code>true</code> if a value is not provided when
  /// creating a cluster using the Amazon EMR API <a>RunJobFlow</a> command, the
  /// CLI <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html">create-cluster</a>
  /// command, or the Amazon Web Services Management Console.
  final bool? visibleToAllUsers;

  JobFlowDetail({
    required this.executionStatusDetail,
    required this.instances,
    required this.jobFlowId,
    required this.name,
    this.amiVersion,
    this.autoScalingRole,
    this.bootstrapActions,
    this.jobFlowRole,
    this.logEncryptionKmsKeyId,
    this.logUri,
    this.scaleDownBehavior,
    this.serviceRole,
    this.steps,
    this.supportedProducts,
    this.visibleToAllUsers,
  });

  factory JobFlowDetail.fromJson(Map<String, dynamic> json) {
    return JobFlowDetail(
      executionStatusDetail: JobFlowExecutionStatusDetail.fromJson(
          (json['ExecutionStatusDetail'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      instances: JobFlowInstancesDetail.fromJson(
          (json['Instances'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobFlowId: (json['JobFlowId'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      amiVersion: json['AmiVersion'] as String?,
      autoScalingRole: json['AutoScalingRole'] as String?,
      bootstrapActions: (json['BootstrapActions'] as List?)
          ?.nonNulls
          .map((e) => BootstrapActionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobFlowRole: json['JobFlowRole'] as String?,
      logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
      logUri: json['LogUri'] as String?,
      scaleDownBehavior: (json['ScaleDownBehavior'] as String?)
          ?.let(ScaleDownBehavior.fromString),
      serviceRole: json['ServiceRole'] as String?,
      steps: (json['Steps'] as List?)
          ?.nonNulls
          .map((e) => StepDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedProducts: (json['SupportedProducts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      visibleToAllUsers: json['VisibleToAllUsers'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionStatusDetail = this.executionStatusDetail;
    final instances = this.instances;
    final jobFlowId = this.jobFlowId;
    final name = this.name;
    final amiVersion = this.amiVersion;
    final autoScalingRole = this.autoScalingRole;
    final bootstrapActions = this.bootstrapActions;
    final jobFlowRole = this.jobFlowRole;
    final logEncryptionKmsKeyId = this.logEncryptionKmsKeyId;
    final logUri = this.logUri;
    final scaleDownBehavior = this.scaleDownBehavior;
    final serviceRole = this.serviceRole;
    final steps = this.steps;
    final supportedProducts = this.supportedProducts;
    final visibleToAllUsers = this.visibleToAllUsers;
    return {
      'ExecutionStatusDetail': executionStatusDetail,
      'Instances': instances,
      'JobFlowId': jobFlowId,
      'Name': name,
      if (amiVersion != null) 'AmiVersion': amiVersion,
      if (autoScalingRole != null) 'AutoScalingRole': autoScalingRole,
      if (bootstrapActions != null) 'BootstrapActions': bootstrapActions,
      if (jobFlowRole != null) 'JobFlowRole': jobFlowRole,
      if (logEncryptionKmsKeyId != null)
        'LogEncryptionKmsKeyId': logEncryptionKmsKeyId,
      if (logUri != null) 'LogUri': logUri,
      if (scaleDownBehavior != null)
        'ScaleDownBehavior': scaleDownBehavior.value,
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (steps != null) 'Steps': steps,
      if (supportedProducts != null) 'SupportedProducts': supportedProducts,
      if (visibleToAllUsers != null) 'VisibleToAllUsers': visibleToAllUsers,
    };
  }
}

/// Describes the status of the cluster (job flow).
///
/// @nodoc
class JobFlowExecutionStatusDetail {
  /// The creation date and time of the job flow.
  final DateTime creationDateTime;

  /// The state of the job flow.
  final JobFlowExecutionState state;

  /// The completion date and time of the job flow.
  final DateTime? endDateTime;

  /// Description of the job flow last changed state.
  final String? lastStateChangeReason;

  /// The date and time when the job flow was ready to start running bootstrap
  /// actions.
  final DateTime? readyDateTime;

  /// The start date and time of the job flow.
  final DateTime? startDateTime;

  JobFlowExecutionStatusDetail({
    required this.creationDateTime,
    required this.state,
    this.endDateTime,
    this.lastStateChangeReason,
    this.readyDateTime,
    this.startDateTime,
  });

  factory JobFlowExecutionStatusDetail.fromJson(Map<String, dynamic> json) {
    return JobFlowExecutionStatusDetail(
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] ?? 0),
      state: JobFlowExecutionState.fromString((json['State'] as String?) ?? ''),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      lastStateChangeReason: json['LastStateChangeReason'] as String?,
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
      startDateTime: timeStampFromJson(json['StartDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final state = this.state;
    final endDateTime = this.endDateTime;
    final lastStateChangeReason = this.lastStateChangeReason;
    final readyDateTime = this.readyDateTime;
    final startDateTime = this.startDateTime;
    return {
      'CreationDateTime': unixTimestampToJson(creationDateTime),
      'State': state.value,
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// Specify the type of Amazon EC2 instances that the cluster (job flow) runs
/// on.
///
/// @nodoc
class JobFlowInstancesDetail {
  /// The number of Amazon EC2 instances in the cluster. If the value is 1, the
  /// same instance serves as both the master and core and task node. If the value
  /// is greater than 1, one instance is the master node and all others are core
  /// and task nodes.
  final int instanceCount;

  /// The Amazon EC2 master node instance type.
  final String masterInstanceType;

  /// The Amazon EC2 core and task node instance type.
  final String slaveInstanceType;

  /// The name of an Amazon EC2 key pair that can be used to connect to the master
  /// node using SSH.
  final String? ec2KeyName;

  /// For clusters launched within Amazon Virtual Private Cloud, this is the
  /// identifier of the subnet where the cluster was launched.
  final String? ec2SubnetId;

  /// The Hadoop version for the cluster.
  final String? hadoopVersion;

  /// Details about the instance groups in a cluster.
  final List<InstanceGroupDetail>? instanceGroups;

  /// Specifies whether the cluster should remain available after completing all
  /// steps.
  final bool? keepJobFlowAliveWhenNoSteps;

  /// The Amazon EC2 instance identifier of the master node.
  final String? masterInstanceId;

  /// The DNS name of the master node. If the cluster is on a private subnet, this
  /// is the private DNS name. On a public subnet, this is the public DNS name.
  final String? masterPublicDnsName;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is increased one time for every hour that an m1.small instance
  /// runs. Larger instances are weighted more heavily, so an Amazon EC2 instance
  /// that is roughly four times more expensive would result in the normalized
  /// instance hours being increased incrementally four times. This result is only
  /// an approximation and does not reflect the actual billing rate.
  final int? normalizedInstanceHours;

  /// The Amazon EC2 Availability Zone for the cluster.
  final PlacementType? placement;

  /// Specifies whether the Amazon EC2 instances in the cluster are protected from
  /// termination by API calls, user intervention, or in the event of a job-flow
  /// error.
  final bool? terminationProtected;

  /// Indicates whether Amazon EMR should gracefully replace core nodes that have
  /// degraded within the cluster.
  final bool? unhealthyNodeReplacement;

  JobFlowInstancesDetail({
    required this.instanceCount,
    required this.masterInstanceType,
    required this.slaveInstanceType,
    this.ec2KeyName,
    this.ec2SubnetId,
    this.hadoopVersion,
    this.instanceGroups,
    this.keepJobFlowAliveWhenNoSteps,
    this.masterInstanceId,
    this.masterPublicDnsName,
    this.normalizedInstanceHours,
    this.placement,
    this.terminationProtected,
    this.unhealthyNodeReplacement,
  });

  factory JobFlowInstancesDetail.fromJson(Map<String, dynamic> json) {
    return JobFlowInstancesDetail(
      instanceCount: (json['InstanceCount'] as int?) ?? 0,
      masterInstanceType: (json['MasterInstanceType'] as String?) ?? '',
      slaveInstanceType: (json['SlaveInstanceType'] as String?) ?? '',
      ec2KeyName: json['Ec2KeyName'] as String?,
      ec2SubnetId: json['Ec2SubnetId'] as String?,
      hadoopVersion: json['HadoopVersion'] as String?,
      instanceGroups: (json['InstanceGroups'] as List?)
          ?.nonNulls
          .map((e) => InstanceGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      keepJobFlowAliveWhenNoSteps: json['KeepJobFlowAliveWhenNoSteps'] as bool?,
      masterInstanceId: json['MasterInstanceId'] as String?,
      masterPublicDnsName: json['MasterPublicDnsName'] as String?,
      normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
      placement: json['Placement'] != null
          ? PlacementType.fromJson(json['Placement'] as Map<String, dynamic>)
          : null,
      terminationProtected: json['TerminationProtected'] as bool?,
      unhealthyNodeReplacement: json['UnhealthyNodeReplacement'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCount = this.instanceCount;
    final masterInstanceType = this.masterInstanceType;
    final slaveInstanceType = this.slaveInstanceType;
    final ec2KeyName = this.ec2KeyName;
    final ec2SubnetId = this.ec2SubnetId;
    final hadoopVersion = this.hadoopVersion;
    final instanceGroups = this.instanceGroups;
    final keepJobFlowAliveWhenNoSteps = this.keepJobFlowAliveWhenNoSteps;
    final masterInstanceId = this.masterInstanceId;
    final masterPublicDnsName = this.masterPublicDnsName;
    final normalizedInstanceHours = this.normalizedInstanceHours;
    final placement = this.placement;
    final terminationProtected = this.terminationProtected;
    final unhealthyNodeReplacement = this.unhealthyNodeReplacement;
    return {
      'InstanceCount': instanceCount,
      'MasterInstanceType': masterInstanceType,
      'SlaveInstanceType': slaveInstanceType,
      if (ec2KeyName != null) 'Ec2KeyName': ec2KeyName,
      if (ec2SubnetId != null) 'Ec2SubnetId': ec2SubnetId,
      if (hadoopVersion != null) 'HadoopVersion': hadoopVersion,
      if (instanceGroups != null) 'InstanceGroups': instanceGroups,
      if (keepJobFlowAliveWhenNoSteps != null)
        'KeepJobFlowAliveWhenNoSteps': keepJobFlowAliveWhenNoSteps,
      if (masterInstanceId != null) 'MasterInstanceId': masterInstanceId,
      if (masterPublicDnsName != null)
        'MasterPublicDnsName': masterPublicDnsName,
      if (normalizedInstanceHours != null)
        'NormalizedInstanceHours': normalizedInstanceHours,
      if (placement != null) 'Placement': placement,
      if (terminationProtected != null)
        'TerminationProtected': terminationProtected,
      if (unhealthyNodeReplacement != null)
        'UnhealthyNodeReplacement': unhealthyNodeReplacement,
    };
  }
}

/// Reports the configuration of a bootstrap action in a cluster (job flow).
///
/// @nodoc
class BootstrapActionDetail {
  /// A description of the bootstrap action.
  final BootstrapActionConfig? bootstrapActionConfig;

  BootstrapActionDetail({
    this.bootstrapActionConfig,
  });

  factory BootstrapActionDetail.fromJson(Map<String, dynamic> json) {
    return BootstrapActionDetail(
      bootstrapActionConfig: json['BootstrapActionConfig'] != null
          ? BootstrapActionConfig.fromJson(
              json['BootstrapActionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bootstrapActionConfig = this.bootstrapActionConfig;
    return {
      if (bootstrapActionConfig != null)
        'BootstrapActionConfig': bootstrapActionConfig,
    };
  }
}

/// Combines the execution state and configuration of a step.
///
/// @nodoc
class StepDetail {
  /// The description of the step status.
  final StepExecutionStatusDetail executionStatusDetail;

  /// The step configuration.
  final StepConfig stepConfig;

  StepDetail({
    required this.executionStatusDetail,
    required this.stepConfig,
  });

  factory StepDetail.fromJson(Map<String, dynamic> json) {
    return StepDetail(
      executionStatusDetail: StepExecutionStatusDetail.fromJson(
          (json['ExecutionStatusDetail'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      stepConfig: StepConfig.fromJson(
          (json['StepConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final executionStatusDetail = this.executionStatusDetail;
    final stepConfig = this.stepConfig;
    return {
      'ExecutionStatusDetail': executionStatusDetail,
      'StepConfig': stepConfig,
    };
  }
}

/// The execution state of a step.
///
/// @nodoc
class StepExecutionStatusDetail {
  /// The creation date and time of the step.
  final DateTime creationDateTime;

  /// The state of the step.
  final StepExecutionState state;

  /// The completion date and time of the step.
  final DateTime? endDateTime;

  /// A description of the step's current state.
  final String? lastStateChangeReason;

  /// The start date and time of the step.
  final DateTime? startDateTime;

  StepExecutionStatusDetail({
    required this.creationDateTime,
    required this.state,
    this.endDateTime,
    this.lastStateChangeReason,
    this.startDateTime,
  });

  factory StepExecutionStatusDetail.fromJson(Map<String, dynamic> json) {
    return StepExecutionStatusDetail(
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] ?? 0),
      state: StepExecutionState.fromString((json['State'] as String?) ?? ''),
      endDateTime: timeStampFromJson(json['EndDateTime']),
      lastStateChangeReason: json['LastStateChangeReason'] as String?,
      startDateTime: timeStampFromJson(json['StartDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final state = this.state;
    final endDateTime = this.endDateTime;
    final lastStateChangeReason = this.lastStateChangeReason;
    final startDateTime = this.startDateTime;
    return {
      'CreationDateTime': unixTimestampToJson(creationDateTime),
      'State': state.value,
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// @nodoc
class StepExecutionState {
  static const pending = StepExecutionState._('PENDING');
  static const running = StepExecutionState._('RUNNING');
  static const $continue = StepExecutionState._('CONTINUE');
  static const completed = StepExecutionState._('COMPLETED');
  static const cancelled = StepExecutionState._('CANCELLED');
  static const failed = StepExecutionState._('FAILED');
  static const interrupted = StepExecutionState._('INTERRUPTED');

  final String value;

  const StepExecutionState._(this.value);

  static const values = [
    pending,
    running,
    $continue,
    completed,
    cancelled,
    failed,
    interrupted
  ];

  static StepExecutionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepExecutionState._(value));

  @override
  bool operator ==(other) =>
      other is StepExecutionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about an instance group.
///
/// @nodoc
class InstanceGroupDetail {
  /// The date/time the instance group was created.
  final DateTime creationDateTime;

  /// Target number of instances to run in the instance group.
  final int instanceRequestCount;

  /// Instance group role in the cluster
  final InstanceRoleType instanceRole;

  /// Actual count of running instances.
  final int instanceRunningCount;

  /// Amazon EC2 instance type.
  final String instanceType;

  /// Market type of the Amazon EC2 instances used to create a cluster node.
  final MarketType market;

  /// State of instance group. The following values are no longer supported:
  /// STARTING, TERMINATED, and FAILED.
  final InstanceGroupState state;

  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  final String? bidPrice;

  /// The custom AMI ID to use for the provisioned instance group.
  final String? customAmiId;

  /// The date/time the instance group was terminated.
  final DateTime? endDateTime;

  /// Unique identifier for the instance group.
  final String? instanceGroupId;

  /// Details regarding the state of the instance group.
  final String? lastStateChangeReason;

  /// Friendly name for the instance group.
  final String? name;

  /// The date/time the instance group was available to the cluster.
  final DateTime? readyDateTime;

  /// The date/time the instance group was started.
  final DateTime? startDateTime;

  InstanceGroupDetail({
    required this.creationDateTime,
    required this.instanceRequestCount,
    required this.instanceRole,
    required this.instanceRunningCount,
    required this.instanceType,
    required this.market,
    required this.state,
    this.bidPrice,
    this.customAmiId,
    this.endDateTime,
    this.instanceGroupId,
    this.lastStateChangeReason,
    this.name,
    this.readyDateTime,
    this.startDateTime,
  });

  factory InstanceGroupDetail.fromJson(Map<String, dynamic> json) {
    return InstanceGroupDetail(
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] ?? 0),
      instanceRequestCount: (json['InstanceRequestCount'] as int?) ?? 0,
      instanceRole:
          InstanceRoleType.fromString((json['InstanceRole'] as String?) ?? ''),
      instanceRunningCount: (json['InstanceRunningCount'] as int?) ?? 0,
      instanceType: (json['InstanceType'] as String?) ?? '',
      market: MarketType.fromString((json['Market'] as String?) ?? ''),
      state: InstanceGroupState.fromString((json['State'] as String?) ?? ''),
      bidPrice: json['BidPrice'] as String?,
      customAmiId: json['CustomAmiId'] as String?,
      endDateTime: timeStampFromJson(json['EndDateTime']),
      instanceGroupId: json['InstanceGroupId'] as String?,
      lastStateChangeReason: json['LastStateChangeReason'] as String?,
      name: json['Name'] as String?,
      readyDateTime: timeStampFromJson(json['ReadyDateTime']),
      startDateTime: timeStampFromJson(json['StartDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final instanceRequestCount = this.instanceRequestCount;
    final instanceRole = this.instanceRole;
    final instanceRunningCount = this.instanceRunningCount;
    final instanceType = this.instanceType;
    final market = this.market;
    final state = this.state;
    final bidPrice = this.bidPrice;
    final customAmiId = this.customAmiId;
    final endDateTime = this.endDateTime;
    final instanceGroupId = this.instanceGroupId;
    final lastStateChangeReason = this.lastStateChangeReason;
    final name = this.name;
    final readyDateTime = this.readyDateTime;
    final startDateTime = this.startDateTime;
    return {
      'CreationDateTime': unixTimestampToJson(creationDateTime),
      'InstanceRequestCount': instanceRequestCount,
      'InstanceRole': instanceRole.value,
      'InstanceRunningCount': instanceRunningCount,
      'InstanceType': instanceType,
      'Market': market.value,
      'State': state.value,
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (instanceGroupId != null) 'InstanceGroupId': instanceGroupId,
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (name != null) 'Name': name,
      if (readyDateTime != null)
        'ReadyDateTime': unixTimestampToJson(readyDateTime),
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

/// The type of instance.
///
/// @nodoc
class JobFlowExecutionState {
  static const starting = JobFlowExecutionState._('STARTING');
  static const bootstrapping = JobFlowExecutionState._('BOOTSTRAPPING');
  static const running = JobFlowExecutionState._('RUNNING');
  static const waiting = JobFlowExecutionState._('WAITING');
  static const shuttingDown = JobFlowExecutionState._('SHUTTING_DOWN');
  static const terminated = JobFlowExecutionState._('TERMINATED');
  static const completed = JobFlowExecutionState._('COMPLETED');
  static const failed = JobFlowExecutionState._('FAILED');

  final String value;

  const JobFlowExecutionState._(this.value);

  static const values = [
    starting,
    bootstrapping,
    running,
    waiting,
    shuttingDown,
    terminated,
    completed,
    failed
  ];

  static JobFlowExecutionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobFlowExecutionState._(value));

  @override
  bool operator ==(other) =>
      other is JobFlowExecutionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The detailed description of the cluster.
///
/// @nodoc
class Cluster {
  /// The applications installed on this cluster.
  final List<Application>? applications;

  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions
  /// that the automatic scaling feature requires to launch and terminate Amazon
  /// EC2 instances in an instance group.
  final String? autoScalingRole;

  /// Specifies whether the cluster should terminate after completing all steps.
  final bool? autoTerminate;

  /// The Amazon Resource Name of the cluster.
  final String? clusterArn;

  /// Applies only to Amazon EMR releases 4.x and later. The list of
  /// configurations that are supplied to the Amazon EMR cluster.
  final List<Configuration>? configurations;

  /// Available only in Amazon EMR releases 5.7.0 and later. The ID of a custom
  /// Amazon EBS-backed Linux AMI if the cluster uses a custom AMI.
  final String? customAmiId;

  /// The IOPS, of the Amazon EBS root device volume of the Linux AMI that is used
  /// for each Amazon EC2 instance. Available in Amazon EMR releases 6.15.0 and
  /// later.
  final int? ebsRootVolumeIops;

  /// The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that
  /// is used for each Amazon EC2 instance. Available in Amazon EMR releases 4.x
  /// and later.
  final int? ebsRootVolumeSize;

  /// The throughput, in MiB/s, of the Amazon EBS root device volume of the Linux
  /// AMI that is used for each Amazon EC2 instance. Available in Amazon EMR
  /// releases 6.15.0 and later.
  final int? ebsRootVolumeThroughput;

  /// Provides information about the Amazon EC2 instances in a cluster grouped by
  /// category. For example, key name, subnet ID, IAM instance profile, and so on.
  final Ec2InstanceAttributes? ec2InstanceAttributes;

  /// Reserved.
  final bool? extendedSupport;

  /// The unique identifier for the cluster.
  final String? id;

  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  /// The instance group configuration of the cluster. A value of
  /// <code>INSTANCE_GROUP</code> indicates a uniform instance group
  /// configuration. A value of <code>INSTANCE_FLEET</code> indicates an instance
  /// fleets configuration.
  final InstanceCollectionType? instanceCollectionType;

  /// Attributes for Kerberos configuration when Kerberos authentication is
  /// enabled using a security configuration. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
  /// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
  final KerberosAttributes? kerberosAttributes;

  /// The KMS key used for encrypting log files. This attribute is only available
  /// with Amazon EMR 5.30.0 and later, excluding Amazon EMR 6.0.0.
  final String? logEncryptionKmsKeyId;

  /// The path to the Amazon S3 location where logs for this cluster are stored.
  final String? logUri;

  /// The DNS name of the master node. If the cluster is on a private subnet, this
  /// is the private DNS name. On a public subnet, this is the public DNS name.
  final String? masterPublicDnsName;

  /// Contains Cloudwatch log configuration metadata and settings.
  final MonitoringConfiguration? monitoringConfiguration;

  /// The name of the cluster. This parameter can't contain the characters <, >,
  /// $, |, or ` (backtick).
  final String? name;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is incremented one time for every hour an m1.small instance runs.
  /// Larger instances are weighted more, so an Amazon EC2 instance that is
  /// roughly four times more expensive would result in the normalized instance
  /// hours being incremented by four. This result is only an approximation and
  /// does not reflect the actual billing rate.
  final int? normalizedInstanceHours;

  /// The Amazon Linux release specified in a cluster launch RunJobFlow request.
  /// If no Amazon Linux release was specified, the default Amazon Linux release
  /// is shown in the response.
  final String? oSReleaseLabel;

  /// The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.
  final String? outpostArn;

  /// Placement group configured for an Amazon EMR cluster.
  final List<PlacementGroupConfig>? placementGroups;

  /// The Amazon EMR release label, which determines the version of open-source
  /// application packages installed on the cluster. Release labels are in the
  /// form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version
  /// such as <code>emr-5.14.0</code>. For more information about Amazon EMR
  /// release versions and included application versions and features, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>.
  /// The release label applies only to Amazon EMR releases version 4.0 and later.
  /// Earlier versions use <code>AmiVersion</code>.
  final String? releaseLabel;

  /// Applies only when <code>CustomAmiID</code> is used. Specifies the type of
  /// updates that the Amazon Linux AMI package repositories apply when an
  /// instance boots using the AMI.
  final RepoUpgradeOnBoot? repoUpgradeOnBoot;

  /// The AMI version requested for this cluster.
  final String? requestedAmiVersion;

  /// The AMI version running on this cluster.
  final String? runningAmiVersion;

  /// The way that individual Amazon EC2 instances terminate when an automatic
  /// scale-in activity occurs or an instance group is resized.
  /// <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates
  /// nodes at the instance-hour boundary, regardless of when the request to
  /// terminate the instance was submitted. This option is only available with
  /// Amazon EMR 5.1.0 and later and is the default for clusters created using
  /// that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that
  /// Amazon EMR adds nodes to a deny list and drains tasks from nodes before
  /// terminating the Amazon EC2 instances, regardless of the instance-hour
  /// boundary. With either behavior, Amazon EMR removes the least active nodes
  /// first and blocks instance termination if it could lead to HDFS corruption.
  /// <code>TERMINATE_AT_TASK_COMPLETION</code> is available only in Amazon EMR
  /// releases 4.1.0 and later, and is the default for versions of Amazon EMR
  /// earlier than 5.1.0.
  final ScaleDownBehavior? scaleDownBehavior;

  /// The name of the security configuration applied to the cluster.
  final String? securityConfiguration;

  /// The IAM role that Amazon EMR assumes in order to access Amazon Web Services
  /// resources on your behalf.
  final String? serviceRole;

  /// Indicates whether Spark Connect sessions are enabled on the cluster.
  final bool? sessionEnabled;

  /// The current status details about the cluster.
  final ClusterStatus? status;

  /// Specifies the number of steps that can be executed concurrently.
  final int? stepConcurrencyLevel;

  /// A list of tags associated with a cluster.
  final List<Tag>? tags;

  /// Indicates whether Amazon EMR will lock the cluster to prevent the Amazon EC2
  /// instances from being terminated by an API call or user intervention, or in
  /// the event of a cluster error.
  final bool? terminationProtected;

  /// Indicates whether Amazon EMR should gracefully replace Amazon EC2 core
  /// instances that have degraded within the cluster.
  final bool? unhealthyNodeReplacement;

  /// Indicates whether the cluster is visible to IAM principals in the Amazon Web
  /// Services account associated with the cluster. When <code>true</code>, IAM
  /// principals in the Amazon Web Services account can perform Amazon EMR cluster
  /// actions on the cluster that their IAM policies allow. When
  /// <code>false</code>, only the IAM principal that created the cluster and the
  /// Amazon Web Services account root user can perform Amazon EMR actions,
  /// regardless of IAM permissions policies attached to other IAM principals.
  ///
  /// The default value is <code>true</code> if a value is not provided when
  /// creating a cluster using the Amazon EMR API <a>RunJobFlow</a> command, the
  /// CLI <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/emr/create-cluster.html">create-cluster</a>
  /// command, or the Amazon Web Services Management Console.
  final bool? visibleToAllUsers;

  Cluster({
    this.applications,
    this.autoScalingRole,
    this.autoTerminate,
    this.clusterArn,
    this.configurations,
    this.customAmiId,
    this.ebsRootVolumeIops,
    this.ebsRootVolumeSize,
    this.ebsRootVolumeThroughput,
    this.ec2InstanceAttributes,
    this.extendedSupport,
    this.id,
    this.instanceCollectionType,
    this.kerberosAttributes,
    this.logEncryptionKmsKeyId,
    this.logUri,
    this.masterPublicDnsName,
    this.monitoringConfiguration,
    this.name,
    this.normalizedInstanceHours,
    this.oSReleaseLabel,
    this.outpostArn,
    this.placementGroups,
    this.releaseLabel,
    this.repoUpgradeOnBoot,
    this.requestedAmiVersion,
    this.runningAmiVersion,
    this.scaleDownBehavior,
    this.securityConfiguration,
    this.serviceRole,
    this.sessionEnabled,
    this.status,
    this.stepConcurrencyLevel,
    this.tags,
    this.terminationProtected,
    this.unhealthyNodeReplacement,
    this.visibleToAllUsers,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      applications: (json['Applications'] as List?)
          ?.nonNulls
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoScalingRole: json['AutoScalingRole'] as String?,
      autoTerminate: json['AutoTerminate'] as bool?,
      clusterArn: json['ClusterArn'] as String?,
      configurations: (json['Configurations'] as List?)
          ?.nonNulls
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAmiId: json['CustomAmiId'] as String?,
      ebsRootVolumeIops: json['EbsRootVolumeIops'] as int?,
      ebsRootVolumeSize: json['EbsRootVolumeSize'] as int?,
      ebsRootVolumeThroughput: json['EbsRootVolumeThroughput'] as int?,
      ec2InstanceAttributes: json['Ec2InstanceAttributes'] != null
          ? Ec2InstanceAttributes.fromJson(
              json['Ec2InstanceAttributes'] as Map<String, dynamic>)
          : null,
      extendedSupport: json['ExtendedSupport'] as bool?,
      id: json['Id'] as String?,
      instanceCollectionType: (json['InstanceCollectionType'] as String?)
          ?.let(InstanceCollectionType.fromString),
      kerberosAttributes: json['KerberosAttributes'] != null
          ? KerberosAttributes.fromJson(
              json['KerberosAttributes'] as Map<String, dynamic>)
          : null,
      logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
      logUri: json['LogUri'] as String?,
      masterPublicDnsName: json['MasterPublicDnsName'] as String?,
      monitoringConfiguration: json['MonitoringConfiguration'] != null
          ? MonitoringConfiguration.fromJson(
              json['MonitoringConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
      oSReleaseLabel: json['OSReleaseLabel'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      placementGroups: (json['PlacementGroups'] as List?)
          ?.nonNulls
          .map((e) => PlacementGroupConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseLabel: json['ReleaseLabel'] as String?,
      repoUpgradeOnBoot: (json['RepoUpgradeOnBoot'] as String?)
          ?.let(RepoUpgradeOnBoot.fromString),
      requestedAmiVersion: json['RequestedAmiVersion'] as String?,
      runningAmiVersion: json['RunningAmiVersion'] as String?,
      scaleDownBehavior: (json['ScaleDownBehavior'] as String?)
          ?.let(ScaleDownBehavior.fromString),
      securityConfiguration: json['SecurityConfiguration'] as String?,
      serviceRole: json['ServiceRole'] as String?,
      sessionEnabled: json['SessionEnabled'] as bool?,
      status: json['Status'] != null
          ? ClusterStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      terminationProtected: json['TerminationProtected'] as bool?,
      unhealthyNodeReplacement: json['UnhealthyNodeReplacement'] as bool?,
      visibleToAllUsers: json['VisibleToAllUsers'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final autoScalingRole = this.autoScalingRole;
    final autoTerminate = this.autoTerminate;
    final clusterArn = this.clusterArn;
    final configurations = this.configurations;
    final customAmiId = this.customAmiId;
    final ebsRootVolumeIops = this.ebsRootVolumeIops;
    final ebsRootVolumeSize = this.ebsRootVolumeSize;
    final ebsRootVolumeThroughput = this.ebsRootVolumeThroughput;
    final ec2InstanceAttributes = this.ec2InstanceAttributes;
    final extendedSupport = this.extendedSupport;
    final id = this.id;
    final instanceCollectionType = this.instanceCollectionType;
    final kerberosAttributes = this.kerberosAttributes;
    final logEncryptionKmsKeyId = this.logEncryptionKmsKeyId;
    final logUri = this.logUri;
    final masterPublicDnsName = this.masterPublicDnsName;
    final monitoringConfiguration = this.monitoringConfiguration;
    final name = this.name;
    final normalizedInstanceHours = this.normalizedInstanceHours;
    final oSReleaseLabel = this.oSReleaseLabel;
    final outpostArn = this.outpostArn;
    final placementGroups = this.placementGroups;
    final releaseLabel = this.releaseLabel;
    final repoUpgradeOnBoot = this.repoUpgradeOnBoot;
    final requestedAmiVersion = this.requestedAmiVersion;
    final runningAmiVersion = this.runningAmiVersion;
    final scaleDownBehavior = this.scaleDownBehavior;
    final securityConfiguration = this.securityConfiguration;
    final serviceRole = this.serviceRole;
    final sessionEnabled = this.sessionEnabled;
    final status = this.status;
    final stepConcurrencyLevel = this.stepConcurrencyLevel;
    final tags = this.tags;
    final terminationProtected = this.terminationProtected;
    final unhealthyNodeReplacement = this.unhealthyNodeReplacement;
    final visibleToAllUsers = this.visibleToAllUsers;
    return {
      if (applications != null) 'Applications': applications,
      if (autoScalingRole != null) 'AutoScalingRole': autoScalingRole,
      if (autoTerminate != null) 'AutoTerminate': autoTerminate,
      if (clusterArn != null) 'ClusterArn': clusterArn,
      if (configurations != null) 'Configurations': configurations,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsRootVolumeIops != null) 'EbsRootVolumeIops': ebsRootVolumeIops,
      if (ebsRootVolumeSize != null) 'EbsRootVolumeSize': ebsRootVolumeSize,
      if (ebsRootVolumeThroughput != null)
        'EbsRootVolumeThroughput': ebsRootVolumeThroughput,
      if (ec2InstanceAttributes != null)
        'Ec2InstanceAttributes': ec2InstanceAttributes,
      if (extendedSupport != null) 'ExtendedSupport': extendedSupport,
      if (id != null) 'Id': id,
      if (instanceCollectionType != null)
        'InstanceCollectionType': instanceCollectionType.value,
      if (kerberosAttributes != null) 'KerberosAttributes': kerberosAttributes,
      if (logEncryptionKmsKeyId != null)
        'LogEncryptionKmsKeyId': logEncryptionKmsKeyId,
      if (logUri != null) 'LogUri': logUri,
      if (masterPublicDnsName != null)
        'MasterPublicDnsName': masterPublicDnsName,
      if (monitoringConfiguration != null)
        'MonitoringConfiguration': monitoringConfiguration,
      if (name != null) 'Name': name,
      if (normalizedInstanceHours != null)
        'NormalizedInstanceHours': normalizedInstanceHours,
      if (oSReleaseLabel != null) 'OSReleaseLabel': oSReleaseLabel,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (placementGroups != null) 'PlacementGroups': placementGroups,
      if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
      if (repoUpgradeOnBoot != null)
        'RepoUpgradeOnBoot': repoUpgradeOnBoot.value,
      if (requestedAmiVersion != null)
        'RequestedAmiVersion': requestedAmiVersion,
      if (runningAmiVersion != null) 'RunningAmiVersion': runningAmiVersion,
      if (scaleDownBehavior != null)
        'ScaleDownBehavior': scaleDownBehavior.value,
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (sessionEnabled != null) 'SessionEnabled': sessionEnabled,
      if (status != null) 'Status': status,
      if (stepConcurrencyLevel != null)
        'StepConcurrencyLevel': stepConcurrencyLevel,
      if (tags != null) 'Tags': tags,
      if (terminationProtected != null)
        'TerminationProtected': terminationProtected,
      if (unhealthyNodeReplacement != null)
        'UnhealthyNodeReplacement': unhealthyNodeReplacement,
      if (visibleToAllUsers != null) 'VisibleToAllUsers': visibleToAllUsers,
    };
  }
}

/// Provides information about the Amazon EC2 instances in a cluster grouped by
/// category. For example, key name, subnet ID, IAM instance profile, and so on.
///
/// @nodoc
class Ec2InstanceAttributes {
  /// A list of additional Amazon EC2 security group IDs for the master node.
  final List<String>? additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  final List<String>? additionalSlaveSecurityGroups;

  /// The Availability Zone in which the cluster will run.
  final String? ec2AvailabilityZone;

  /// The name of the Amazon EC2 key pair to use when connecting with SSH into the
  /// master node as a user named "hadoop".
  final String? ec2KeyName;

  /// Set this parameter to the identifier of the Amazon VPC subnet where you want
  /// the cluster to launch. If you do not specify this value, and your account
  /// supports EC2-Classic, the cluster launches in EC2-Classic.
  final String? ec2SubnetId;

  /// The identifier of the Amazon EC2 security group for the master node.
  final String? emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task nodes.
  final String? emrManagedSlaveSecurityGroup;

  /// The IAM role that was specified when the cluster was launched. The Amazon
  /// EC2 instances of the cluster assume this role.
  final String? iamInstanceProfile;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// one or more Availability Zones in which to launch Amazon EC2 cluster
  /// instances when the EC2-Classic network configuration is supported. Amazon
  /// EMR chooses the Availability Zone with the best fit from among the list of
  /// <code>RequestedEc2AvailabilityZones</code>, and then launches all cluster
  /// instances within that Availability Zone. If you do not specify this value,
  /// Amazon EMR chooses the Availability Zone for you.
  /// <code>RequestedEc2SubnetIDs</code> and
  /// <code>RequestedEc2AvailabilityZones</code> cannot be specified together.
  final List<String>? requestedEc2AvailabilityZones;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// the unique identifier of one or more Amazon EC2 subnets in which to launch
  /// Amazon EC2 cluster instances. Subnets must exist within the same VPC. Amazon
  /// EMR chooses the Amazon EC2 subnet with the best fit from among the list of
  /// <code>RequestedEc2SubnetIds</code>, and then launches all cluster instances
  /// within that Subnet. If this value is not specified, and the account and
  /// Region support EC2-Classic networks, the cluster launches instances in the
  /// EC2-Classic network and uses <code>RequestedEc2AvailabilityZones</code>
  /// instead of this setting. If EC2-Classic is not supported, and no Subnet is
  /// specified, Amazon EMR chooses the subnet for you.
  /// <code>RequestedEc2SubnetIDs</code> and
  /// <code>RequestedEc2AvailabilityZones</code> cannot be specified together.
  final List<String>? requestedEc2SubnetIds;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  final String? serviceAccessSecurityGroup;

  Ec2InstanceAttributes({
    this.additionalMasterSecurityGroups,
    this.additionalSlaveSecurityGroups,
    this.ec2AvailabilityZone,
    this.ec2KeyName,
    this.ec2SubnetId,
    this.emrManagedMasterSecurityGroup,
    this.emrManagedSlaveSecurityGroup,
    this.iamInstanceProfile,
    this.requestedEc2AvailabilityZones,
    this.requestedEc2SubnetIds,
    this.serviceAccessSecurityGroup,
  });

  factory Ec2InstanceAttributes.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceAttributes(
      additionalMasterSecurityGroups:
          (json['AdditionalMasterSecurityGroups'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      additionalSlaveSecurityGroups:
          (json['AdditionalSlaveSecurityGroups'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      ec2AvailabilityZone: json['Ec2AvailabilityZone'] as String?,
      ec2KeyName: json['Ec2KeyName'] as String?,
      ec2SubnetId: json['Ec2SubnetId'] as String?,
      emrManagedMasterSecurityGroup:
          json['EmrManagedMasterSecurityGroup'] as String?,
      emrManagedSlaveSecurityGroup:
          json['EmrManagedSlaveSecurityGroup'] as String?,
      iamInstanceProfile: json['IamInstanceProfile'] as String?,
      requestedEc2AvailabilityZones:
          (json['RequestedEc2AvailabilityZones'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      requestedEc2SubnetIds: (json['RequestedEc2SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceAccessSecurityGroup: json['ServiceAccessSecurityGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalMasterSecurityGroups = this.additionalMasterSecurityGroups;
    final additionalSlaveSecurityGroups = this.additionalSlaveSecurityGroups;
    final ec2AvailabilityZone = this.ec2AvailabilityZone;
    final ec2KeyName = this.ec2KeyName;
    final ec2SubnetId = this.ec2SubnetId;
    final emrManagedMasterSecurityGroup = this.emrManagedMasterSecurityGroup;
    final emrManagedSlaveSecurityGroup = this.emrManagedSlaveSecurityGroup;
    final iamInstanceProfile = this.iamInstanceProfile;
    final requestedEc2AvailabilityZones = this.requestedEc2AvailabilityZones;
    final requestedEc2SubnetIds = this.requestedEc2SubnetIds;
    final serviceAccessSecurityGroup = this.serviceAccessSecurityGroup;
    return {
      if (additionalMasterSecurityGroups != null)
        'AdditionalMasterSecurityGroups': additionalMasterSecurityGroups,
      if (additionalSlaveSecurityGroups != null)
        'AdditionalSlaveSecurityGroups': additionalSlaveSecurityGroups,
      if (ec2AvailabilityZone != null)
        'Ec2AvailabilityZone': ec2AvailabilityZone,
      if (ec2KeyName != null) 'Ec2KeyName': ec2KeyName,
      if (ec2SubnetId != null) 'Ec2SubnetId': ec2SubnetId,
      if (emrManagedMasterSecurityGroup != null)
        'EmrManagedMasterSecurityGroup': emrManagedMasterSecurityGroup,
      if (emrManagedSlaveSecurityGroup != null)
        'EmrManagedSlaveSecurityGroup': emrManagedSlaveSecurityGroup,
      if (iamInstanceProfile != null) 'IamInstanceProfile': iamInstanceProfile,
      if (requestedEc2AvailabilityZones != null)
        'RequestedEc2AvailabilityZones': requestedEc2AvailabilityZones,
      if (requestedEc2SubnetIds != null)
        'RequestedEc2SubnetIds': requestedEc2SubnetIds,
      if (serviceAccessSecurityGroup != null)
        'ServiceAccessSecurityGroup': serviceAccessSecurityGroup,
    };
  }
}

/// @nodoc
class InstanceCollectionType {
  static const instanceFleet = InstanceCollectionType._('INSTANCE_FLEET');
  static const instanceGroup = InstanceCollectionType._('INSTANCE_GROUP');

  final String value;

  const InstanceCollectionType._(this.value);

  static const values = [instanceFleet, instanceGroup];

  static InstanceCollectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceCollectionType._(value));

  @override
  bool operator ==(other) =>
      other is InstanceCollectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The EMR container configuration.
///
/// @nodoc
class EMRContainersConfig {
  /// The Job run ID for the container configuration.
  final String? jobRunId;

  EMRContainersConfig({
    this.jobRunId,
  });

  Map<String, dynamic> toJson() {
    final jobRunId = this.jobRunId;
    return {
      if (jobRunId != null) 'JobRunId': jobRunId,
    };
  }
}

/// @nodoc
class ProfilerType {
  static const shs = ProfilerType._('SHS');
  static const tezui = ProfilerType._('TEZUI');
  static const yts = ProfilerType._('YTS');

  final String value;

  const ProfilerType._(this.value);

  static const values = [shs, tezui, yts];

  static ProfilerType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProfilerType._(value));

  @override
  bool operator ==(other) => other is ProfilerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specification of the status of a CancelSteps request. Available only in
/// Amazon EMR version 4.8.0 and later, excluding version 5.0.0.
///
/// @nodoc
class CancelStepsInfo {
  /// The reason for the failure if the CancelSteps request fails.
  final String? reason;

  /// The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.
  final CancelStepsRequestStatus? status;

  /// The encrypted StepId of a step.
  final String? stepId;

  CancelStepsInfo({
    this.reason,
    this.status,
    this.stepId,
  });

  factory CancelStepsInfo.fromJson(Map<String, dynamic> json) {
    return CancelStepsInfo(
      reason: json['Reason'] as String?,
      status:
          (json['Status'] as String?)?.let(CancelStepsRequestStatus.fromString),
      stepId: json['StepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    final stepId = this.stepId;
    return {
      if (reason != null) 'Reason': reason,
      if (status != null) 'Status': status.value,
      if (stepId != null) 'StepId': stepId,
    };
  }
}

/// @nodoc
class CancelStepsRequestStatus {
  static const submitted = CancelStepsRequestStatus._('SUBMITTED');
  static const failed = CancelStepsRequestStatus._('FAILED');

  final String value;

  const CancelStepsRequestStatus._(this.value);

  static const values = [submitted, failed];

  static CancelStepsRequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CancelStepsRequestStatus._(value));

  @override
  bool operator ==(other) =>
      other is CancelStepsRequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StepCancellationOption {
  static const sendInterrupt = StepCancellationOption._('SEND_INTERRUPT');
  static const terminateProcess = StepCancellationOption._('TERMINATE_PROCESS');

  final String value;

  const StepCancellationOption._(this.value);

  static const values = [sendInterrupt, terminateProcess];

  static StepCancellationOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepCancellationOption._(value));

  @override
  bool operator ==(other) =>
      other is StepCancellationOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
};
