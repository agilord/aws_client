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

/// Amazon EMR is a web service that makes it easier to process large amounts of
/// data efficiently. Amazon EMR uses Hadoop processing combined with several
/// Amazon Web Services services to do tasks such as web indexing, data mining,
/// log file analysis, machine learning, scientific simulation, and data
/// warehouse management.
class Emr {
  final _s.JsonProtocol _protocol;
  Emr({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticmapreduce',
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
  Future<void> addTags({
    required String resourceId,
    required List<Tag> tags,
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
          'StepCancellationOption': stepCancellationOption.toValue(),
      },
    );

    return CancelStepsOutput.fromJson(jsonResponse.body);
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
        'AuthMode': authMode.toValue(),
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
          'IdcUserAssignment': idcUserAssignment.toValue(),
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
        'IdentityType': identityType.toValue(),
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
        'IdentityType': identityType.toValue(),
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
  @Deprecated('Deprecated')
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
          'JobFlowStates': jobFlowStates.map((e) => e.toValue()).toList(),
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
        'IdentityType': identityType.toValue(),
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
          'ClusterStates': clusterStates.map((e) => e.toValue()).toList(),
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
          'InstanceFleetType': instanceFleetType.toValue(),
        if (instanceGroupId != null) 'InstanceGroupId': instanceGroupId,
        if (instanceGroupTypes != null)
          'InstanceGroupTypes':
              instanceGroupTypes.map((e) => e.toValue()).toList(),
        if (instanceStates != null)
          'InstanceStates': instanceStates.map((e) => e.toValue()).toList(),
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
        if (status != null) 'Status': status.toValue(),
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
          'StepStates': stepStates.map((e) => e.toValue()).toList(),
      },
    );

    return ListStepsOutput.fromJson(jsonResponse.body);
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
        if (identityType != null) 'IdentityType': identityType.toValue(),
        if (marker != null) 'Marker': marker,
        if (studioId != null) 'StudioId': studioId,
      },
    );

    return ListStudioSessionMappingsOutput.fromJson(jsonResponse.body);
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
  /// Parameter [stepConcurrencyLevel] :
  /// The number of steps that can be executed concurrently. You can specify a
  /// minimum of 1 step and a maximum of 256 steps. We recommend that you do not
  /// change this parameter while steps are running or the
  /// <code>ActionOnFailure</code> setting may not behave as expected. For more
  /// information see <a>Step$ActionOnFailure</a>.
  Future<ModifyClusterOutput> modifyCluster({
    required String clusterId,
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
  Future<void> removeTags({
    required String resourceId,
    required List<String> tagKeys,
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
  /// Parameter [stepConcurrencyLevel] :
  /// Specifies the number of steps that can be executed concurrently. The
  /// default value is <code>1</code>. The maximum value is <code>256</code>.
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
    String? jobFlowRole,
    KerberosAttributes? kerberosAttributes,
    String? logEncryptionKmsKeyId,
    String? logUri,
    ManagedScalingPolicy? managedScalingPolicy,
    List<SupportedProductConfig>? newSupportedProducts,
    String? oSReleaseLabel,
    List<PlacementGroupConfig>? placementGroupConfigs,
    String? releaseLabel,
    RepoUpgradeOnBoot? repoUpgradeOnBoot,
    ScaleDownBehavior? scaleDownBehavior,
    String? securityConfiguration,
    String? serviceRole,
    int? stepConcurrencyLevel,
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
        if (jobFlowRole != null) 'JobFlowRole': jobFlowRole,
        if (kerberosAttributes != null)
          'KerberosAttributes': kerberosAttributes,
        if (logEncryptionKmsKeyId != null)
          'LogEncryptionKmsKeyId': logEncryptionKmsKeyId,
        if (logUri != null) 'LogUri': logUri,
        if (managedScalingPolicy != null)
          'ManagedScalingPolicy': managedScalingPolicy,
        if (newSupportedProducts != null)
          'NewSupportedProducts': newSupportedProducts,
        if (oSReleaseLabel != null) 'OSReleaseLabel': oSReleaseLabel,
        if (placementGroupConfigs != null)
          'PlacementGroupConfigs': placementGroupConfigs,
        if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
        if (repoUpgradeOnBoot != null)
          'RepoUpgradeOnBoot': repoUpgradeOnBoot.toValue(),
        if (scaleDownBehavior != null)
          'ScaleDownBehavior': scaleDownBehavior.toValue(),
        if (securityConfiguration != null)
          'SecurityConfiguration': securityConfiguration,
        if (serviceRole != null) 'ServiceRole': serviceRole,
        if (stepConcurrencyLevel != null)
          'StepConcurrencyLevel': stepConcurrencyLevel,
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
          'OutputNotebookFormat': outputNotebookFormat.toValue(),
        if (outputNotebookS3Location != null)
          'OutputNotebookS3Location': outputNotebookS3Location,
        if (relativePath != null) 'RelativePath': relativePath,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartNotebookExecutionOutput.fromJson(jsonResponse.body);
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
        'IdentityType': identityType.toValue(),
        'SessionPolicyArn': sessionPolicyArn,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );
  }
}

enum ActionOnFailure {
  terminateJobFlow,
  terminateCluster,
  cancelAndWait,
  $continue,
}

extension ActionOnFailureValueExtension on ActionOnFailure {
  String toValue() {
    switch (this) {
      case ActionOnFailure.terminateJobFlow:
        return 'TERMINATE_JOB_FLOW';
      case ActionOnFailure.terminateCluster:
        return 'TERMINATE_CLUSTER';
      case ActionOnFailure.cancelAndWait:
        return 'CANCEL_AND_WAIT';
      case ActionOnFailure.$continue:
        return 'CONTINUE';
    }
  }
}

extension ActionOnFailureFromString on String {
  ActionOnFailure toActionOnFailure() {
    switch (this) {
      case 'TERMINATE_JOB_FLOW':
        return ActionOnFailure.terminateJobFlow;
      case 'TERMINATE_CLUSTER':
        return ActionOnFailure.terminateCluster;
      case 'CANCEL_AND_WAIT':
        return ActionOnFailure.cancelAndWait;
      case 'CONTINUE':
        return ActionOnFailure.$continue;
    }
    throw Exception('$this is not known in enum ActionOnFailure');
  }
}

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
          ?.whereNotNull()
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
class AddJobFlowStepsOutput {
  /// The identifiers of the list of steps added to the job flow.
  final List<String>? stepIds;

  AddJobFlowStepsOutput({
    this.stepIds,
  });

  factory AddJobFlowStepsOutput.fromJson(Map<String, dynamic> json) {
    return AddJobFlowStepsOutput(
      stepIds: (json['StepIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
class AddTagsOutput {
  AddTagsOutput();

  factory AddTagsOutput.fromJson(Map<String, dynamic> _) {
    return AddTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AdjustmentType {
  changeInCapacity,
  percentChangeInCapacity,
  exactCapacity,
}

extension AdjustmentTypeValueExtension on AdjustmentType {
  String toValue() {
    switch (this) {
      case AdjustmentType.changeInCapacity:
        return 'CHANGE_IN_CAPACITY';
      case AdjustmentType.percentChangeInCapacity:
        return 'PERCENT_CHANGE_IN_CAPACITY';
      case AdjustmentType.exactCapacity:
        return 'EXACT_CAPACITY';
    }
  }
}

extension AdjustmentTypeFromString on String {
  AdjustmentType toAdjustmentType() {
    switch (this) {
      case 'CHANGE_IN_CAPACITY':
        return AdjustmentType.changeInCapacity;
      case 'PERCENT_CHANGE_IN_CAPACITY':
        return AdjustmentType.percentChangeInCapacity;
      case 'EXACT_CAPACITY':
        return AdjustmentType.exactCapacity;
    }
    throw Exception('$this is not known in enum AdjustmentType');
  }
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
      args: (json['Args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

enum AuthMode {
  sso,
  iam,
}

extension AuthModeValueExtension on AuthMode {
  String toValue() {
    switch (this) {
      case AuthMode.sso:
        return 'SSO';
      case AuthMode.iam:
        return 'IAM';
    }
  }
}

extension AuthModeFromString on String {
  AuthMode toAuthMode() {
    switch (this) {
      case 'SSO':
        return AuthMode.sso;
      case 'IAM':
        return AuthMode.iam;
    }
    throw Exception('$this is not known in enum AuthMode');
  }
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. An automatic scaling policy defines how an
/// instance group dynamically adds and terminates Amazon EC2 instances in
/// response to the value of a CloudWatch metric. See
/// <a>PutAutoScalingPolicy</a>.
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

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. The automatic scaling policy defines how an
/// instance group dynamically adds and terminates Amazon EC2 instances in
/// response to the value of a CloudWatch metric. See
/// <a>PutAutoScalingPolicy</a>.
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
          ?.whereNotNull()
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

enum AutoScalingPolicyState {
  pending,
  attaching,
  attached,
  detaching,
  detached,
  failed,
}

extension AutoScalingPolicyStateValueExtension on AutoScalingPolicyState {
  String toValue() {
    switch (this) {
      case AutoScalingPolicyState.pending:
        return 'PENDING';
      case AutoScalingPolicyState.attaching:
        return 'ATTACHING';
      case AutoScalingPolicyState.attached:
        return 'ATTACHED';
      case AutoScalingPolicyState.detaching:
        return 'DETACHING';
      case AutoScalingPolicyState.detached:
        return 'DETACHED';
      case AutoScalingPolicyState.failed:
        return 'FAILED';
    }
  }
}

extension AutoScalingPolicyStateFromString on String {
  AutoScalingPolicyState toAutoScalingPolicyState() {
    switch (this) {
      case 'PENDING':
        return AutoScalingPolicyState.pending;
      case 'ATTACHING':
        return AutoScalingPolicyState.attaching;
      case 'ATTACHED':
        return AutoScalingPolicyState.attached;
      case 'DETACHING':
        return AutoScalingPolicyState.detaching;
      case 'DETACHED':
        return AutoScalingPolicyState.detached;
      case 'FAILED':
        return AutoScalingPolicyState.failed;
    }
    throw Exception('$this is not known in enum AutoScalingPolicyState');
  }
}

/// The reason for an <a>AutoScalingPolicyStatus</a> change.
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
      code:
          (json['Code'] as String?)?.toAutoScalingPolicyStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum AutoScalingPolicyStateChangeReasonCode {
  userRequest,
  provisionFailure,
  cleanupFailure,
}

extension AutoScalingPolicyStateChangeReasonCodeValueExtension
    on AutoScalingPolicyStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case AutoScalingPolicyStateChangeReasonCode.userRequest:
        return 'USER_REQUEST';
      case AutoScalingPolicyStateChangeReasonCode.provisionFailure:
        return 'PROVISION_FAILURE';
      case AutoScalingPolicyStateChangeReasonCode.cleanupFailure:
        return 'CLEANUP_FAILURE';
    }
  }
}

extension AutoScalingPolicyStateChangeReasonCodeFromString on String {
  AutoScalingPolicyStateChangeReasonCode
      toAutoScalingPolicyStateChangeReasonCode() {
    switch (this) {
      case 'USER_REQUEST':
        return AutoScalingPolicyStateChangeReasonCode.userRequest;
      case 'PROVISION_FAILURE':
        return AutoScalingPolicyStateChangeReasonCode.provisionFailure;
      case 'CLEANUP_FAILURE':
        return AutoScalingPolicyStateChangeReasonCode.cleanupFailure;
    }
    throw Exception(
        '$this is not known in enum AutoScalingPolicyStateChangeReasonCode');
  }
}

/// The status of an automatic scaling policy.
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
      state: (json['State'] as String?)?.toAutoScalingPolicyState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
    };
  }
}

/// An auto-termination policy for an Amazon EMR cluster. An auto-termination
/// policy defines the amount of idle time in seconds after which a cluster
/// automatically terminates. For alternative cluster termination options, see
/// <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html">Control
/// cluster termination</a>.
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

/// A configuration for Amazon EMR block public access. When
/// <code>BlockPublicSecurityGroupRules</code> is set to <code>true</code>,
/// Amazon EMR prevents cluster creation if one of the cluster's security groups
/// has a rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port,
/// unless the port is specified as an exception using
/// <code>PermittedPublicSecurityGroupRuleRanges</code>.
class BlockPublicAccessConfiguration {
  /// Indicates whether Amazon EMR block public access is enabled
  /// (<code>true</code>) or disabled (<code>false</code>). By default, the value
  /// is <code>false</code> for accounts that have created Amazon EMR clusters
  /// before July 2019. For accounts created after this, the default is
  /// <code>true</code>.
  final bool blockPublicSecurityGroupRules;

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

  BlockPublicAccessConfiguration({
    required this.blockPublicSecurityGroupRules,
    this.permittedPublicSecurityGroupRuleRanges,
  });

  factory BlockPublicAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return BlockPublicAccessConfiguration(
      blockPublicSecurityGroupRules:
          json['BlockPublicSecurityGroupRules'] as bool,
      permittedPublicSecurityGroupRuleRanges:
          (json['PermittedPublicSecurityGroupRuleRanges'] as List?)
              ?.whereNotNull()
              .map((e) => PortRange.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicSecurityGroupRules = this.blockPublicSecurityGroupRules;
    final permittedPublicSecurityGroupRuleRanges =
        this.permittedPublicSecurityGroupRuleRanges;
    return {
      'BlockPublicSecurityGroupRules': blockPublicSecurityGroupRules,
      if (permittedPublicSecurityGroupRuleRanges != null)
        'PermittedPublicSecurityGroupRuleRanges':
            permittedPublicSecurityGroupRuleRanges,
    };
  }
}

/// Properties that describe the Amazon Web Services principal that created the
/// <code>BlockPublicAccessConfiguration</code> using the
/// <code>PutBlockPublicAccessConfiguration</code> action as well as the date
/// and time that the configuration was created. Each time a configuration for
/// block public access is updated, Amazon EMR updates this metadata.
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
      createdByArn: json['CreatedByArn'] as String,
      creationDateTime:
          nonNullableTimeStampFromJson(json['CreationDateTime'] as Object),
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

/// Configuration of a bootstrap action.
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
      name: json['Name'] as String,
      scriptBootstrapAction: ScriptBootstrapActionConfig.fromJson(
          json['ScriptBootstrapAction'] as Map<String, dynamic>),
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

/// Reports the configuration of a bootstrap action in a cluster (job flow).
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

/// Specification of the status of a CancelSteps request. Available only in
/// Amazon EMR version 4.8.0 and later, excluding version 5.0.0.
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
      status: (json['Status'] as String?)?.toCancelStepsRequestStatus(),
      stepId: json['StepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    final stepId = this.stepId;
    return {
      if (reason != null) 'Reason': reason,
      if (status != null) 'Status': status.toValue(),
      if (stepId != null) 'StepId': stepId,
    };
  }
}

/// The output for the <a>CancelSteps</a> operation.
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
          ?.whereNotNull()
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

enum CancelStepsRequestStatus {
  submitted,
  failed,
}

extension CancelStepsRequestStatusValueExtension on CancelStepsRequestStatus {
  String toValue() {
    switch (this) {
      case CancelStepsRequestStatus.submitted:
        return 'SUBMITTED';
      case CancelStepsRequestStatus.failed:
        return 'FAILED';
    }
  }
}

extension CancelStepsRequestStatusFromString on String {
  CancelStepsRequestStatus toCancelStepsRequestStatus() {
    switch (this) {
      case 'SUBMITTED':
        return CancelStepsRequestStatus.submitted;
      case 'FAILED':
        return CancelStepsRequestStatus.failed;
    }
    throw Exception('$this is not known in enum CancelStepsRequestStatus');
  }
}

/// The definition of a CloudWatch metric alarm, which determines when an
/// automatic scaling activity is triggered. When the defined alarm conditions
/// are satisfied, scaling activity begins.
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
      comparisonOperator:
          (json['ComparisonOperator'] as String).toComparisonOperator(),
      metricName: json['MetricName'] as String,
      period: json['Period'] as int,
      threshold: json['Threshold'] as double,
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluationPeriods: json['EvaluationPeriods'] as int?,
      namespace: json['Namespace'] as String?,
      statistic: (json['Statistic'] as String?)?.toStatistic(),
      unit: (json['Unit'] as String?)?.toUnit(),
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
      'ComparisonOperator': comparisonOperator.toValue(),
      'MetricName': metricName,
      'Period': period,
      'Threshold': threshold,
      if (dimensions != null) 'Dimensions': dimensions,
      if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
      if (namespace != null) 'Namespace': namespace,
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

/// The detailed description of the cluster.
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

  /// The name of the cluster. This parameter can't contain the characters &lt;,
  /// &gt;, $, |, or ` (backtick).
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
    this.id,
    this.instanceCollectionType,
    this.kerberosAttributes,
    this.logEncryptionKmsKeyId,
    this.logUri,
    this.masterPublicDnsName,
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
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoScalingRole: json['AutoScalingRole'] as String?,
      autoTerminate: json['AutoTerminate'] as bool?,
      clusterArn: json['ClusterArn'] as String?,
      configurations: (json['Configurations'] as List?)
          ?.whereNotNull()
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
      id: json['Id'] as String?,
      instanceCollectionType: (json['InstanceCollectionType'] as String?)
          ?.toInstanceCollectionType(),
      kerberosAttributes: json['KerberosAttributes'] != null
          ? KerberosAttributes.fromJson(
              json['KerberosAttributes'] as Map<String, dynamic>)
          : null,
      logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
      logUri: json['LogUri'] as String?,
      masterPublicDnsName: json['MasterPublicDnsName'] as String?,
      name: json['Name'] as String?,
      normalizedInstanceHours: json['NormalizedInstanceHours'] as int?,
      oSReleaseLabel: json['OSReleaseLabel'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      placementGroups: (json['PlacementGroups'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementGroupConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseLabel: json['ReleaseLabel'] as String?,
      repoUpgradeOnBoot:
          (json['RepoUpgradeOnBoot'] as String?)?.toRepoUpgradeOnBoot(),
      requestedAmiVersion: json['RequestedAmiVersion'] as String?,
      runningAmiVersion: json['RunningAmiVersion'] as String?,
      scaleDownBehavior:
          (json['ScaleDownBehavior'] as String?)?.toScaleDownBehavior(),
      securityConfiguration: json['SecurityConfiguration'] as String?,
      serviceRole: json['ServiceRole'] as String?,
      status: json['Status'] != null
          ? ClusterStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
    final id = this.id;
    final instanceCollectionType = this.instanceCollectionType;
    final kerberosAttributes = this.kerberosAttributes;
    final logEncryptionKmsKeyId = this.logEncryptionKmsKeyId;
    final logUri = this.logUri;
    final masterPublicDnsName = this.masterPublicDnsName;
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
      if (id != null) 'Id': id,
      if (instanceCollectionType != null)
        'InstanceCollectionType': instanceCollectionType.toValue(),
      if (kerberosAttributes != null) 'KerberosAttributes': kerberosAttributes,
      if (logEncryptionKmsKeyId != null)
        'LogEncryptionKmsKeyId': logEncryptionKmsKeyId,
      if (logUri != null) 'LogUri': logUri,
      if (masterPublicDnsName != null)
        'MasterPublicDnsName': masterPublicDnsName,
      if (name != null) 'Name': name,
      if (normalizedInstanceHours != null)
        'NormalizedInstanceHours': normalizedInstanceHours,
      if (oSReleaseLabel != null) 'OSReleaseLabel': oSReleaseLabel,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (placementGroups != null) 'PlacementGroups': placementGroups,
      if (releaseLabel != null) 'ReleaseLabel': releaseLabel,
      if (repoUpgradeOnBoot != null)
        'RepoUpgradeOnBoot': repoUpgradeOnBoot.toValue(),
      if (requestedAmiVersion != null)
        'RequestedAmiVersion': requestedAmiVersion,
      if (runningAmiVersion != null) 'RunningAmiVersion': runningAmiVersion,
      if (scaleDownBehavior != null)
        'ScaleDownBehavior': scaleDownBehavior.toValue(),
      if (securityConfiguration != null)
        'SecurityConfiguration': securityConfiguration,
      if (serviceRole != null) 'ServiceRole': serviceRole,
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

enum ClusterState {
  starting,
  bootstrapping,
  running,
  waiting,
  terminating,
  terminated,
  terminatedWithErrors,
}

extension ClusterStateValueExtension on ClusterState {
  String toValue() {
    switch (this) {
      case ClusterState.starting:
        return 'STARTING';
      case ClusterState.bootstrapping:
        return 'BOOTSTRAPPING';
      case ClusterState.running:
        return 'RUNNING';
      case ClusterState.waiting:
        return 'WAITING';
      case ClusterState.terminating:
        return 'TERMINATING';
      case ClusterState.terminated:
        return 'TERMINATED';
      case ClusterState.terminatedWithErrors:
        return 'TERMINATED_WITH_ERRORS';
    }
  }
}

extension ClusterStateFromString on String {
  ClusterState toClusterState() {
    switch (this) {
      case 'STARTING':
        return ClusterState.starting;
      case 'BOOTSTRAPPING':
        return ClusterState.bootstrapping;
      case 'RUNNING':
        return ClusterState.running;
      case 'WAITING':
        return ClusterState.waiting;
      case 'TERMINATING':
        return ClusterState.terminating;
      case 'TERMINATED':
        return ClusterState.terminated;
      case 'TERMINATED_WITH_ERRORS':
        return ClusterState.terminatedWithErrors;
    }
    throw Exception('$this is not known in enum ClusterState');
  }
}

/// The reason that the cluster changed to its current state.
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
      code: (json['Code'] as String?)?.toClusterStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum ClusterStateChangeReasonCode {
  internalError,
  validationError,
  instanceFailure,
  instanceFleetTimeout,
  bootstrapFailure,
  userRequest,
  stepFailure,
  allStepsCompleted,
}

extension ClusterStateChangeReasonCodeValueExtension
    on ClusterStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case ClusterStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case ClusterStateChangeReasonCode.validationError:
        return 'VALIDATION_ERROR';
      case ClusterStateChangeReasonCode.instanceFailure:
        return 'INSTANCE_FAILURE';
      case ClusterStateChangeReasonCode.instanceFleetTimeout:
        return 'INSTANCE_FLEET_TIMEOUT';
      case ClusterStateChangeReasonCode.bootstrapFailure:
        return 'BOOTSTRAP_FAILURE';
      case ClusterStateChangeReasonCode.userRequest:
        return 'USER_REQUEST';
      case ClusterStateChangeReasonCode.stepFailure:
        return 'STEP_FAILURE';
      case ClusterStateChangeReasonCode.allStepsCompleted:
        return 'ALL_STEPS_COMPLETED';
    }
  }
}

extension ClusterStateChangeReasonCodeFromString on String {
  ClusterStateChangeReasonCode toClusterStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return ClusterStateChangeReasonCode.internalError;
      case 'VALIDATION_ERROR':
        return ClusterStateChangeReasonCode.validationError;
      case 'INSTANCE_FAILURE':
        return ClusterStateChangeReasonCode.instanceFailure;
      case 'INSTANCE_FLEET_TIMEOUT':
        return ClusterStateChangeReasonCode.instanceFleetTimeout;
      case 'BOOTSTRAP_FAILURE':
        return ClusterStateChangeReasonCode.bootstrapFailure;
      case 'USER_REQUEST':
        return ClusterStateChangeReasonCode.userRequest;
      case 'STEP_FAILURE':
        return ClusterStateChangeReasonCode.stepFailure;
      case 'ALL_STEPS_COMPLETED':
        return ClusterStateChangeReasonCode.allStepsCompleted;
    }
    throw Exception('$this is not known in enum ClusterStateChangeReasonCode');
  }
}

/// The detailed status of the cluster.
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
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['State'] as String?)?.toClusterState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// The summary description of the cluster.
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

/// Represents the timeline of the cluster's lifecycle.
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

/// An entity describing an executable that runs on a cluster.
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
      args: (json['Args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

enum ComparisonOperator {
  greaterThanOrEqual,
  greaterThan,
  lessThan,
  lessThanOrEqual,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
      case ComparisonOperator.greaterThan:
        return 'GREATER_THAN';
      case ComparisonOperator.lessThan:
        return 'LESS_THAN';
      case ComparisonOperator.lessThanOrEqual:
        return 'LESS_THAN_OR_EQUAL';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GREATER_THAN_OR_EQUAL':
        return ComparisonOperator.greaterThanOrEqual;
      case 'GREATER_THAN':
        return ComparisonOperator.greaterThan;
      case 'LESS_THAN':
        return ComparisonOperator.lessThan;
      case 'LESS_THAN_OR_EQUAL':
        return ComparisonOperator.lessThanOrEqual;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// The Amazon EC2 unit limits for a managed scaling policy. The managed scaling
/// activity of a cluster can not be above or below these limits. The limit only
/// applies to the core and task nodes. The master node cannot be scaled after
/// initial configuration.
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
      maximumCapacityUnits: json['MaximumCapacityUnits'] as int,
      minimumCapacityUnits: json['MinimumCapacityUnits'] as int,
      unitType: (json['UnitType'] as String).toComputeLimitsUnitType(),
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
      'UnitType': unitType.toValue(),
      if (maximumCoreCapacityUnits != null)
        'MaximumCoreCapacityUnits': maximumCoreCapacityUnits,
      if (maximumOnDemandCapacityUnits != null)
        'MaximumOnDemandCapacityUnits': maximumOnDemandCapacityUnits,
    };
  }
}

enum ComputeLimitsUnitType {
  instanceFleetUnits,
  instances,
  vcpu,
}

extension ComputeLimitsUnitTypeValueExtension on ComputeLimitsUnitType {
  String toValue() {
    switch (this) {
      case ComputeLimitsUnitType.instanceFleetUnits:
        return 'InstanceFleetUnits';
      case ComputeLimitsUnitType.instances:
        return 'Instances';
      case ComputeLimitsUnitType.vcpu:
        return 'VCPU';
    }
  }
}

extension ComputeLimitsUnitTypeFromString on String {
  ComputeLimitsUnitType toComputeLimitsUnitType() {
    switch (this) {
      case 'InstanceFleetUnits':
        return ComputeLimitsUnitType.instanceFleetUnits;
      case 'Instances':
        return ComputeLimitsUnitType.instances;
      case 'VCPU':
        return ComputeLimitsUnitType.vcpu;
    }
    throw Exception('$this is not known in enum ComputeLimitsUnitType');
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
          ?.whereNotNull()
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
          nonNullableTimeStampFromJson(json['CreationDateTime'] as Object),
      name: json['Name'] as String,
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

/// The credentials that you can use to connect to cluster endpoints.
/// Credentials consist of a username and a password.
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
class DescribeJobFlowsOutput {
  /// A list of job flows matching the parameters supplied.
  final List<JobFlowDetail>? jobFlows;

  DescribeJobFlowsOutput({
    this.jobFlows,
  });

  factory DescribeJobFlowsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeJobFlowsOutput(
      jobFlows: (json['JobFlows'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => SimplifiedApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableOSReleases: (json['AvailableOSReleases'] as List?)
          ?.whereNotNull()
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

/// Configuration of requested EBS block device associated with the instance
/// group.
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

/// Configuration of requested EBS block device associated with the instance
/// group with count of volumes that are associated to every instance.
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

/// The Amazon EBS configuration of a cluster instance.
class EbsConfiguration {
  /// An array of Amazon EBS volume specifications attached to a cluster instance.
  final List<EbsBlockDeviceConfig>? ebsBlockDeviceConfigs;

  /// Indicates whether an Amazon EBS volume is EBS-optimized.
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

/// EBS block device that's attached to an Amazon EC2 instance.
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

/// Provides information about the Amazon EC2 instances in a cluster grouped by
/// category. For example, key name, subnet ID, IAM instance profile, and so on.
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
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      additionalSlaveSecurityGroups:
          (json['AdditionalSlaveSecurityGroups'] as List?)
              ?.whereNotNull()
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
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      requestedEc2SubnetIds: (json['RequestedEc2SubnetIds'] as List?)
          ?.whereNotNull()
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

/// A tuple that provides information about an error that caused a cluster to
/// terminate.
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
          ?.whereNotNull()
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

/// Specifies the execution engine (cluster) to run the notebook and perform the
/// notebook execution, for example, an Amazon EMR cluster.
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
      id: json['Id'] as String,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      masterInstanceSecurityGroupId:
          json['MasterInstanceSecurityGroupId'] as String?,
      type: (json['Type'] as String?)?.toExecutionEngineType(),
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
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ExecutionEngineType {
  emr,
}

extension ExecutionEngineTypeValueExtension on ExecutionEngineType {
  String toValue() {
    switch (this) {
      case ExecutionEngineType.emr:
        return 'EMR';
    }
  }
}

extension ExecutionEngineTypeFromString on String {
  ExecutionEngineType toExecutionEngineType() {
    switch (this) {
      case 'EMR':
        return ExecutionEngineType.emr;
    }
    throw Exception('$this is not known in enum ExecutionEngineType');
  }
}

/// The details of the step failure. The service attempts to detect the root
/// cause for many common failures.
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
          json['BlockPublicAccessConfiguration'] as Map<String, dynamic>),
      blockPublicAccessConfigurationMetadata:
          BlockPublicAccessConfigurationMetadata.fromJson(
              json['BlockPublicAccessConfigurationMetadata']
                  as Map<String, dynamic>),
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

/// A job flow step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
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
      jar: json['Jar'] as String,
      args: (json['Args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      mainClass: json['MainClass'] as String?,
      properties: (json['Properties'] as List?)
          ?.whereNotNull()
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

/// A cluster step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
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
      args: (json['Args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

enum IdcUserAssignment {
  required,
  optional,
}

extension IdcUserAssignmentValueExtension on IdcUserAssignment {
  String toValue() {
    switch (this) {
      case IdcUserAssignment.required:
        return 'REQUIRED';
      case IdcUserAssignment.optional:
        return 'OPTIONAL';
    }
  }
}

extension IdcUserAssignmentFromString on String {
  IdcUserAssignment toIdcUserAssignment() {
    switch (this) {
      case 'REQUIRED':
        return IdcUserAssignment.required;
      case 'OPTIONAL':
        return IdcUserAssignment.optional;
    }
    throw Exception('$this is not known in enum IdcUserAssignment');
  }
}

enum IdentityType {
  user,
  group,
}

extension IdentityTypeValueExtension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.user:
        return 'USER';
      case IdentityType.group:
        return 'GROUP';
    }
  }
}

extension IdentityTypeFromString on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'USER':
        return IdentityType.user;
      case 'GROUP':
        return IdentityType.group;
    }
    throw Exception('$this is not known in enum IdentityType');
  }
}

/// Represents an Amazon EC2 instance provisioned as part of cluster.
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
          ?.whereNotNull()
          .map((e) => EbsVolume.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      id: json['Id'] as String?,
      instanceFleetId: json['InstanceFleetId'] as String?,
      instanceGroupId: json['InstanceGroupId'] as String?,
      instanceType: json['InstanceType'] as String?,
      market: (json['Market'] as String?)?.toMarketType(),
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
      if (market != null) 'Market': market.toValue(),
      if (privateDnsName != null) 'PrivateDnsName': privateDnsName,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (publicDnsName != null) 'PublicDnsName': publicDnsName,
      if (publicIpAddress != null) 'PublicIpAddress': publicIpAddress,
      if (status != null) 'Status': status,
    };
  }
}

enum InstanceCollectionType {
  instanceFleet,
  instanceGroup,
}

extension InstanceCollectionTypeValueExtension on InstanceCollectionType {
  String toValue() {
    switch (this) {
      case InstanceCollectionType.instanceFleet:
        return 'INSTANCE_FLEET';
      case InstanceCollectionType.instanceGroup:
        return 'INSTANCE_GROUP';
    }
  }
}

extension InstanceCollectionTypeFromString on String {
  InstanceCollectionType toInstanceCollectionType() {
    switch (this) {
      case 'INSTANCE_FLEET':
        return InstanceCollectionType.instanceFleet;
      case 'INSTANCE_GROUP':
        return InstanceCollectionType.instanceGroup;
    }
    throw Exception('$this is not known in enum InstanceCollectionType');
  }
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
class InstanceFleet {
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
      id: json['Id'] as String?,
      instanceFleetType:
          (json['InstanceFleetType'] as String?)?.toInstanceFleetType(),
      instanceTypeSpecifications: (json['InstanceTypeSpecifications'] as List?)
          ?.whereNotNull()
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
      if (id != null) 'Id': id,
      if (instanceFleetType != null)
        'InstanceFleetType': instanceFleetType.toValue(),
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

/// The configuration that defines an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
class InstanceFleetConfig {
  /// The node type that the instance fleet hosts. Valid values are MASTER, CORE,
  /// and TASK.
  final InstanceFleetType instanceFleetType;

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
    this.instanceTypeConfigs,
    this.launchSpecifications,
    this.name,
    this.resizeSpecifications,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });

  Map<String, dynamic> toJson() {
    final instanceFleetType = this.instanceFleetType;
    final instanceTypeConfigs = this.instanceTypeConfigs;
    final launchSpecifications = this.launchSpecifications;
    final name = this.name;
    final resizeSpecifications = this.resizeSpecifications;
    final targetOnDemandCapacity = this.targetOnDemandCapacity;
    final targetSpotCapacity = this.targetSpotCapacity;
    return {
      'InstanceFleetType': instanceFleetType.toValue(),
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

/// Configuration parameters for an instance fleet modification request.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
class InstanceFleetModifyConfig {
  /// A unique identifier for the instance fleet.
  final String instanceFleetId;

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
    this.resizeSpecifications,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });

  Map<String, dynamic> toJson() {
    final instanceFleetId = this.instanceFleetId;
    final resizeSpecifications = this.resizeSpecifications;
    final targetOnDemandCapacity = this.targetOnDemandCapacity;
    final targetSpotCapacity = this.targetSpotCapacity;
    return {
      'InstanceFleetId': instanceFleetId,
      if (resizeSpecifications != null)
        'ResizeSpecifications': resizeSpecifications,
      if (targetOnDemandCapacity != null)
        'TargetOnDemandCapacity': targetOnDemandCapacity,
      if (targetSpotCapacity != null) 'TargetSpotCapacity': targetSpotCapacity,
    };
  }
}

/// The launch specification for Spot Instances in the fleet, which determines
/// the defined duration, provisioning timeout behavior, and allocation
/// strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand and Spot instance
/// allocation strategies are available in Amazon EMR releases 5.12.1 and later.
/// </note>
class InstanceFleetProvisioningSpecifications {
  /// The launch specification for On-Demand Instances in the instance fleet,
  /// which determines the allocation strategy.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR releases
  /// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
  /// strategy is available in Amazon EMR releases 5.12.1 and later.
  /// </note>
  final OnDemandProvisioningSpecification? onDemandSpecification;

  /// The launch specification for Spot instances in the fleet, which determines
  /// the defined duration, provisioning timeout behavior, and allocation
  /// strategy.
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
class InstanceFleetResizingSpecifications {
  /// The resize specification for On-Demand Instances in the instance fleet,
  /// which contains the resize timeout period.
  final OnDemandResizingSpecification? onDemandResizeSpecification;

  /// The resize specification for Spot Instances in the instance fleet, which
  /// contains the resize timeout period.
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

enum InstanceFleetState {
  provisioning,
  bootstrapping,
  running,
  resizing,
  suspended,
  terminating,
  terminated,
}

extension InstanceFleetStateValueExtension on InstanceFleetState {
  String toValue() {
    switch (this) {
      case InstanceFleetState.provisioning:
        return 'PROVISIONING';
      case InstanceFleetState.bootstrapping:
        return 'BOOTSTRAPPING';
      case InstanceFleetState.running:
        return 'RUNNING';
      case InstanceFleetState.resizing:
        return 'RESIZING';
      case InstanceFleetState.suspended:
        return 'SUSPENDED';
      case InstanceFleetState.terminating:
        return 'TERMINATING';
      case InstanceFleetState.terminated:
        return 'TERMINATED';
    }
  }
}

extension InstanceFleetStateFromString on String {
  InstanceFleetState toInstanceFleetState() {
    switch (this) {
      case 'PROVISIONING':
        return InstanceFleetState.provisioning;
      case 'BOOTSTRAPPING':
        return InstanceFleetState.bootstrapping;
      case 'RUNNING':
        return InstanceFleetState.running;
      case 'RESIZING':
        return InstanceFleetState.resizing;
      case 'SUSPENDED':
        return InstanceFleetState.suspended;
      case 'TERMINATING':
        return InstanceFleetState.terminating;
      case 'TERMINATED':
        return InstanceFleetState.terminated;
    }
    throw Exception('$this is not known in enum InstanceFleetState');
  }
}

/// Provides status change reason details for the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
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
      code: (json['Code'] as String?)?.toInstanceFleetStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum InstanceFleetStateChangeReasonCode {
  internalError,
  validationError,
  instanceFailure,
  clusterTerminated,
}

extension InstanceFleetStateChangeReasonCodeValueExtension
    on InstanceFleetStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case InstanceFleetStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case InstanceFleetStateChangeReasonCode.validationError:
        return 'VALIDATION_ERROR';
      case InstanceFleetStateChangeReasonCode.instanceFailure:
        return 'INSTANCE_FAILURE';
      case InstanceFleetStateChangeReasonCode.clusterTerminated:
        return 'CLUSTER_TERMINATED';
    }
  }
}

extension InstanceFleetStateChangeReasonCodeFromString on String {
  InstanceFleetStateChangeReasonCode toInstanceFleetStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return InstanceFleetStateChangeReasonCode.internalError;
      case 'VALIDATION_ERROR':
        return InstanceFleetStateChangeReasonCode.validationError;
      case 'INSTANCE_FAILURE':
        return InstanceFleetStateChangeReasonCode.instanceFailure;
      case 'CLUSTER_TERMINATED':
        return InstanceFleetStateChangeReasonCode.clusterTerminated;
    }
    throw Exception(
        '$this is not known in enum InstanceFleetStateChangeReasonCode');
  }
}

/// The status of the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
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
      state: (json['State'] as String?)?.toInstanceFleetState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// Provides historical timestamps for the instance fleet, including the time of
/// creation, the time it became ready to run jobs, and the time of termination.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
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

enum InstanceFleetType {
  master,
  core,
  task,
}

extension InstanceFleetTypeValueExtension on InstanceFleetType {
  String toValue() {
    switch (this) {
      case InstanceFleetType.master:
        return 'MASTER';
      case InstanceFleetType.core:
        return 'CORE';
      case InstanceFleetType.task:
        return 'TASK';
    }
  }
}

extension InstanceFleetTypeFromString on String {
  InstanceFleetType toInstanceFleetType() {
    switch (this) {
      case 'MASTER':
        return InstanceFleetType.master;
      case 'CORE':
        return InstanceFleetType.core;
      case 'TASK':
        return InstanceFleetType.task;
    }
    throw Exception('$this is not known in enum InstanceFleetType');
  }
}

/// This entity represents an instance group, which is a group of instances that
/// have common purpose. For example, CORE instance group is used for HDFS.
class InstanceGroup {
  /// An automatic scaling policy for a core instance group or task instance group
  /// in an Amazon EMR cluster. The automatic scaling policy defines how an
  /// instance group dynamically adds and terminates Amazon EC2 instances in
  /// response to the value of a CloudWatch metric. See PutAutoScalingPolicy.
  final AutoScalingPolicyDescription? autoScalingPolicy;

  /// If specified, indicates that the instance group uses Spot Instances. This is
  /// the maximum price you are willing to pay for Spot Instances. Specify
  /// <code>OnDemandPrice</code> to set the amount equal to the On-Demand price,
  /// or specify an amount in USD.
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
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurationsVersion: json['ConfigurationsVersion'] as int?,
      customAmiId: json['CustomAmiId'] as String?,
      ebsBlockDevices: (json['EbsBlockDevices'] as List?)
          ?.whereNotNull()
          .map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      ebsOptimized: json['EbsOptimized'] as bool?,
      id: json['Id'] as String?,
      instanceGroupType:
          (json['InstanceGroupType'] as String?)?.toInstanceGroupType(),
      instanceType: json['InstanceType'] as String?,
      lastSuccessfullyAppliedConfigurations:
          (json['LastSuccessfullyAppliedConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
              .toList(),
      lastSuccessfullyAppliedConfigurationsVersion:
          json['LastSuccessfullyAppliedConfigurationsVersion'] as int?,
      market: (json['Market'] as String?)?.toMarketType(),
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
        'InstanceGroupType': instanceGroupType.toValue(),
      if (instanceType != null) 'InstanceType': instanceType,
      if (lastSuccessfullyAppliedConfigurations != null)
        'LastSuccessfullyAppliedConfigurations':
            lastSuccessfullyAppliedConfigurations,
      if (lastSuccessfullyAppliedConfigurationsVersion != null)
        'LastSuccessfullyAppliedConfigurationsVersion':
            lastSuccessfullyAppliedConfigurationsVersion,
      if (market != null) 'Market': market.toValue(),
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

/// Configuration defining a new instance group.
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

  /// If specified, indicates that the instance group uses Spot Instances. This is
  /// the maximum price you are willing to pay for Spot Instances. Specify
  /// <code>OnDemandPrice</code> to set the amount equal to the On-Demand price,
  /// or specify an amount in USD.
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
      'InstanceRole': instanceRole.toValue(),
      'InstanceType': instanceType,
      if (autoScalingPolicy != null) 'AutoScalingPolicy': autoScalingPolicy,
      if (bidPrice != null) 'BidPrice': bidPrice,
      if (configurations != null) 'Configurations': configurations,
      if (customAmiId != null) 'CustomAmiId': customAmiId,
      if (ebsConfiguration != null) 'EbsConfiguration': ebsConfiguration,
      if (market != null) 'Market': market.toValue(),
      if (name != null) 'Name': name,
    };
  }
}

/// Detailed information about an instance group.
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

  /// If specified, indicates that the instance group uses Spot Instances. This is
  /// the maximum price you are willing to pay for Spot Instances. Specify
  /// <code>OnDemandPrice</code> to set the amount equal to the On-Demand price,
  /// or specify an amount in USD.
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
          nonNullableTimeStampFromJson(json['CreationDateTime'] as Object),
      instanceRequestCount: json['InstanceRequestCount'] as int,
      instanceRole: (json['InstanceRole'] as String).toInstanceRoleType(),
      instanceRunningCount: json['InstanceRunningCount'] as int,
      instanceType: json['InstanceType'] as String,
      market: (json['Market'] as String).toMarketType(),
      state: (json['State'] as String).toInstanceGroupState(),
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
      'InstanceRole': instanceRole.toValue(),
      'InstanceRunningCount': instanceRunningCount,
      'InstanceType': instanceType,
      'Market': market.toValue(),
      'State': state.toValue(),
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

/// Modify the size or configurations of an instance group.
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
        'ReconfigurationType': reconfigurationType.toValue(),
      if (shrinkPolicy != null) 'ShrinkPolicy': shrinkPolicy,
    };
  }
}

enum InstanceGroupState {
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
  ended,
}

extension InstanceGroupStateValueExtension on InstanceGroupState {
  String toValue() {
    switch (this) {
      case InstanceGroupState.provisioning:
        return 'PROVISIONING';
      case InstanceGroupState.bootstrapping:
        return 'BOOTSTRAPPING';
      case InstanceGroupState.running:
        return 'RUNNING';
      case InstanceGroupState.reconfiguring:
        return 'RECONFIGURING';
      case InstanceGroupState.resizing:
        return 'RESIZING';
      case InstanceGroupState.suspended:
        return 'SUSPENDED';
      case InstanceGroupState.terminating:
        return 'TERMINATING';
      case InstanceGroupState.terminated:
        return 'TERMINATED';
      case InstanceGroupState.arrested:
        return 'ARRESTED';
      case InstanceGroupState.shuttingDown:
        return 'SHUTTING_DOWN';
      case InstanceGroupState.ended:
        return 'ENDED';
    }
  }
}

extension InstanceGroupStateFromString on String {
  InstanceGroupState toInstanceGroupState() {
    switch (this) {
      case 'PROVISIONING':
        return InstanceGroupState.provisioning;
      case 'BOOTSTRAPPING':
        return InstanceGroupState.bootstrapping;
      case 'RUNNING':
        return InstanceGroupState.running;
      case 'RECONFIGURING':
        return InstanceGroupState.reconfiguring;
      case 'RESIZING':
        return InstanceGroupState.resizing;
      case 'SUSPENDED':
        return InstanceGroupState.suspended;
      case 'TERMINATING':
        return InstanceGroupState.terminating;
      case 'TERMINATED':
        return InstanceGroupState.terminated;
      case 'ARRESTED':
        return InstanceGroupState.arrested;
      case 'SHUTTING_DOWN':
        return InstanceGroupState.shuttingDown;
      case 'ENDED':
        return InstanceGroupState.ended;
    }
    throw Exception('$this is not known in enum InstanceGroupState');
  }
}

/// The status change reason details for the instance group.
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
      code: (json['Code'] as String?)?.toInstanceGroupStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum InstanceGroupStateChangeReasonCode {
  internalError,
  validationError,
  instanceFailure,
  clusterTerminated,
}

extension InstanceGroupStateChangeReasonCodeValueExtension
    on InstanceGroupStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case InstanceGroupStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case InstanceGroupStateChangeReasonCode.validationError:
        return 'VALIDATION_ERROR';
      case InstanceGroupStateChangeReasonCode.instanceFailure:
        return 'INSTANCE_FAILURE';
      case InstanceGroupStateChangeReasonCode.clusterTerminated:
        return 'CLUSTER_TERMINATED';
    }
  }
}

extension InstanceGroupStateChangeReasonCodeFromString on String {
  InstanceGroupStateChangeReasonCode toInstanceGroupStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return InstanceGroupStateChangeReasonCode.internalError;
      case 'VALIDATION_ERROR':
        return InstanceGroupStateChangeReasonCode.validationError;
      case 'INSTANCE_FAILURE':
        return InstanceGroupStateChangeReasonCode.instanceFailure;
      case 'CLUSTER_TERMINATED':
        return InstanceGroupStateChangeReasonCode.clusterTerminated;
    }
    throw Exception(
        '$this is not known in enum InstanceGroupStateChangeReasonCode');
  }
}

/// The details of the instance group status.
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
      state: (json['State'] as String?)?.toInstanceGroupState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// The timeline of the instance group lifecycle.
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

enum InstanceGroupType {
  master,
  core,
  task,
}

extension InstanceGroupTypeValueExtension on InstanceGroupType {
  String toValue() {
    switch (this) {
      case InstanceGroupType.master:
        return 'MASTER';
      case InstanceGroupType.core:
        return 'CORE';
      case InstanceGroupType.task:
        return 'TASK';
    }
  }
}

extension InstanceGroupTypeFromString on String {
  InstanceGroupType toInstanceGroupType() {
    switch (this) {
      case 'MASTER':
        return InstanceGroupType.master;
      case 'CORE':
        return InstanceGroupType.core;
      case 'TASK':
        return InstanceGroupType.task;
    }
    throw Exception('$this is not known in enum InstanceGroupType');
  }
}

/// Custom policy for requesting termination protection or termination of
/// specific instances when shrinking an instance group.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      instancesToTerminate: (json['InstancesToTerminate'] as List?)
          ?.whereNotNull()
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

enum InstanceRoleType {
  master,
  core,
  task,
}

extension InstanceRoleTypeValueExtension on InstanceRoleType {
  String toValue() {
    switch (this) {
      case InstanceRoleType.master:
        return 'MASTER';
      case InstanceRoleType.core:
        return 'CORE';
      case InstanceRoleType.task:
        return 'TASK';
    }
  }
}

extension InstanceRoleTypeFromString on String {
  InstanceRoleType toInstanceRoleType() {
    switch (this) {
      case 'MASTER':
        return InstanceRoleType.master;
      case 'CORE':
        return InstanceRoleType.core;
      case 'TASK':
        return InstanceRoleType.task;
    }
    throw Exception('$this is not known in enum InstanceRoleType');
  }
}

enum InstanceState {
  awaitingFulfillment,
  provisioning,
  bootstrapping,
  running,
  terminated,
}

extension InstanceStateValueExtension on InstanceState {
  String toValue() {
    switch (this) {
      case InstanceState.awaitingFulfillment:
        return 'AWAITING_FULFILLMENT';
      case InstanceState.provisioning:
        return 'PROVISIONING';
      case InstanceState.bootstrapping:
        return 'BOOTSTRAPPING';
      case InstanceState.running:
        return 'RUNNING';
      case InstanceState.terminated:
        return 'TERMINATED';
    }
  }
}

extension InstanceStateFromString on String {
  InstanceState toInstanceState() {
    switch (this) {
      case 'AWAITING_FULFILLMENT':
        return InstanceState.awaitingFulfillment;
      case 'PROVISIONING':
        return InstanceState.provisioning;
      case 'BOOTSTRAPPING':
        return InstanceState.bootstrapping;
      case 'RUNNING':
        return InstanceState.running;
      case 'TERMINATED':
        return InstanceState.terminated;
    }
    throw Exception('$this is not known in enum InstanceState');
  }
}

/// The details of the status change reason for the instance.
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
      code: (json['Code'] as String?)?.toInstanceStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum InstanceStateChangeReasonCode {
  internalError,
  validationError,
  instanceFailure,
  bootstrapFailure,
  clusterTerminated,
}

extension InstanceStateChangeReasonCodeValueExtension
    on InstanceStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case InstanceStateChangeReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case InstanceStateChangeReasonCode.validationError:
        return 'VALIDATION_ERROR';
      case InstanceStateChangeReasonCode.instanceFailure:
        return 'INSTANCE_FAILURE';
      case InstanceStateChangeReasonCode.bootstrapFailure:
        return 'BOOTSTRAP_FAILURE';
      case InstanceStateChangeReasonCode.clusterTerminated:
        return 'CLUSTER_TERMINATED';
    }
  }
}

extension InstanceStateChangeReasonCodeFromString on String {
  InstanceStateChangeReasonCode toInstanceStateChangeReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return InstanceStateChangeReasonCode.internalError;
      case 'VALIDATION_ERROR':
        return InstanceStateChangeReasonCode.validationError;
      case 'INSTANCE_FAILURE':
        return InstanceStateChangeReasonCode.instanceFailure;
      case 'BOOTSTRAP_FAILURE':
        return InstanceStateChangeReasonCode.bootstrapFailure;
      case 'CLUSTER_TERMINATED':
        return InstanceStateChangeReasonCode.clusterTerminated;
    }
    throw Exception('$this is not known in enum InstanceStateChangeReasonCode');
  }
}

/// The instance status details.
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
      state: (json['State'] as String?)?.toInstanceState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// The timeline of the instance lifecycle.
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
      if (weightedCapacity != null) 'WeightedCapacity': weightedCapacity,
    };
  }
}

/// The configuration specification for each instance type in an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
class InstanceTypeSpecification {
  /// The bid price for each Amazon EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD.
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
    this.weightedCapacity,
  });

  factory InstanceTypeSpecification.fromJson(Map<String, dynamic> json) {
    return InstanceTypeSpecification(
      bidPrice: json['BidPrice'] as String?,
      bidPriceAsPercentageOfOnDemandPrice:
          json['BidPriceAsPercentageOfOnDemandPrice'] as double?,
      configurations: (json['Configurations'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAmiId: json['CustomAmiId'] as String?,
      ebsBlockDevices: (json['EbsBlockDevices'] as List?)
          ?.whereNotNull()
          .map((e) => EbsBlockDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      ebsOptimized: json['EbsOptimized'] as bool?,
      instanceType: json['InstanceType'] as String?,
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
      if (weightedCapacity != null) 'WeightedCapacity': weightedCapacity,
    };
  }
}

/// A description of a cluster (job flow).
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
          json['ExecutionStatusDetail'] as Map<String, dynamic>),
      instances: JobFlowInstancesDetail.fromJson(
          json['Instances'] as Map<String, dynamic>),
      jobFlowId: json['JobFlowId'] as String,
      name: json['Name'] as String,
      amiVersion: json['AmiVersion'] as String?,
      autoScalingRole: json['AutoScalingRole'] as String?,
      bootstrapActions: (json['BootstrapActions'] as List?)
          ?.whereNotNull()
          .map((e) => BootstrapActionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobFlowRole: json['JobFlowRole'] as String?,
      logEncryptionKmsKeyId: json['LogEncryptionKmsKeyId'] as String?,
      logUri: json['LogUri'] as String?,
      scaleDownBehavior:
          (json['ScaleDownBehavior'] as String?)?.toScaleDownBehavior(),
      serviceRole: json['ServiceRole'] as String?,
      steps: (json['Steps'] as List?)
          ?.whereNotNull()
          .map((e) => StepDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedProducts: (json['SupportedProducts'] as List?)
          ?.whereNotNull()
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
        'ScaleDownBehavior': scaleDownBehavior.toValue(),
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (steps != null) 'Steps': steps,
      if (supportedProducts != null) 'SupportedProducts': supportedProducts,
      if (visibleToAllUsers != null) 'VisibleToAllUsers': visibleToAllUsers,
    };
  }
}

/// The type of instance.
enum JobFlowExecutionState {
  starting,
  bootstrapping,
  running,
  waiting,
  shuttingDown,
  terminated,
  completed,
  failed,
}

extension JobFlowExecutionStateValueExtension on JobFlowExecutionState {
  String toValue() {
    switch (this) {
      case JobFlowExecutionState.starting:
        return 'STARTING';
      case JobFlowExecutionState.bootstrapping:
        return 'BOOTSTRAPPING';
      case JobFlowExecutionState.running:
        return 'RUNNING';
      case JobFlowExecutionState.waiting:
        return 'WAITING';
      case JobFlowExecutionState.shuttingDown:
        return 'SHUTTING_DOWN';
      case JobFlowExecutionState.terminated:
        return 'TERMINATED';
      case JobFlowExecutionState.completed:
        return 'COMPLETED';
      case JobFlowExecutionState.failed:
        return 'FAILED';
    }
  }
}

extension JobFlowExecutionStateFromString on String {
  JobFlowExecutionState toJobFlowExecutionState() {
    switch (this) {
      case 'STARTING':
        return JobFlowExecutionState.starting;
      case 'BOOTSTRAPPING':
        return JobFlowExecutionState.bootstrapping;
      case 'RUNNING':
        return JobFlowExecutionState.running;
      case 'WAITING':
        return JobFlowExecutionState.waiting;
      case 'SHUTTING_DOWN':
        return JobFlowExecutionState.shuttingDown;
      case 'TERMINATED':
        return JobFlowExecutionState.terminated;
      case 'COMPLETED':
        return JobFlowExecutionState.completed;
      case 'FAILED':
        return JobFlowExecutionState.failed;
    }
    throw Exception('$this is not known in enum JobFlowExecutionState');
  }
}

/// Describes the status of the cluster (job flow).
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
          nonNullableTimeStampFromJson(json['CreationDateTime'] as Object),
      state: (json['State'] as String).toJobFlowExecutionState(),
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
      'State': state.toValue(),
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

/// A description of the Amazon EC2 instance on which the cluster (job flow)
/// runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or
/// InstanceFleets. They cannot be used together. You may also have
/// MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must be
/// present), but we don't recommend this configuration.
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

/// Specify the type of Amazon EC2 instances that the cluster (job flow) runs
/// on.
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
      instanceCount: json['InstanceCount'] as int,
      masterInstanceType: json['MasterInstanceType'] as String,
      slaveInstanceType: json['SlaveInstanceType'] as String,
      ec2KeyName: json['Ec2KeyName'] as String?,
      ec2SubnetId: json['Ec2SubnetId'] as String?,
      hadoopVersion: json['HadoopVersion'] as String?,
      instanceGroups: (json['InstanceGroups'] as List?)
          ?.whereNotNull()
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

/// Attributes for Kerberos configuration when Kerberos authentication is
/// enabled using a security configuration. For more information see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
/// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
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
      kdcAdminPassword: json['KdcAdminPassword'] as String,
      realm: json['Realm'] as String,
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

/// A key-value pair.
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

/// This output contains the bootstrap actions detail.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// This output contains the list of steps returned in reverse order. This means
/// that the last step is the first element in the list.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// Managed scaling policy for an Amazon EMR cluster. The policy specifies the
/// limits for resources that can be added or terminated from a cluster. The
/// policy only applies to the core and task nodes. The master node cannot be
/// scaled after initial configuration.
class ManagedScalingPolicy {
  /// The Amazon EC2 unit limits for a managed scaling policy. The managed scaling
  /// activity of a cluster is not allowed to go above or below these limits. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  final ComputeLimits? computeLimits;

  ManagedScalingPolicy({
    this.computeLimits,
  });

  factory ManagedScalingPolicy.fromJson(Map<String, dynamic> json) {
    return ManagedScalingPolicy(
      computeLimits: json['ComputeLimits'] != null
          ? ComputeLimits.fromJson(
              json['ComputeLimits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeLimits = this.computeLimits;
    return {
      if (computeLimits != null) 'ComputeLimits': computeLimits,
    };
  }
}

enum MarketType {
  onDemand,
  spot,
}

extension MarketTypeValueExtension on MarketType {
  String toValue() {
    switch (this) {
      case MarketType.onDemand:
        return 'ON_DEMAND';
      case MarketType.spot:
        return 'SPOT';
    }
  }
}

extension MarketTypeFromString on String {
  MarketType toMarketType() {
    switch (this) {
      case 'ON_DEMAND':
        return MarketType.onDemand;
      case 'SPOT':
        return MarketType.spot;
    }
    throw Exception('$this is not known in enum MarketType');
  }
}

/// A CloudWatch dimension, which is specified using a <code>Key</code> (known
/// as a <code>Name</code> in CloudWatch), <code>Value</code> pair. By default,
/// Amazon EMR uses one dimension whose <code>Key</code> is
/// <code>JobFlowID</code> and <code>Value</code> is a variable representing the
/// cluster ID, which is <code>${emr.clusterId}</code>. This enables the rule to
/// bootstrap when the cluster ID becomes available.
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

class ModifyClusterOutput {
  /// The number of steps that can be executed concurrently.
  final int? stepConcurrencyLevel;

  ModifyClusterOutput({
    this.stepConcurrencyLevel,
  });

  factory ModifyClusterOutput.fromJson(Map<String, dynamic> json) {
    return ModifyClusterOutput(
      stepConcurrencyLevel: json['StepConcurrencyLevel'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepConcurrencyLevel = this.stepConcurrencyLevel;
    return {
      if (stepConcurrencyLevel != null)
        'StepConcurrencyLevel': stepConcurrencyLevel,
    };
  }
}

/// A notebook execution. An execution is a specific instance that an Amazon EMR
/// Notebook is run using the <code>StartNotebookExecution</code> action.
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
      outputNotebookFormat:
          (json['OutputNotebookFormat'] as String?)?.toOutputNotebookFormat(),
      outputNotebookS3Location: json['OutputNotebookS3Location'] != null
          ? OutputNotebookS3LocationForOutput.fromJson(
              json['OutputNotebookS3Location'] as Map<String, dynamic>)
          : null,
      outputNotebookURI: json['OutputNotebookURI'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toNotebookExecutionStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
        'OutputNotebookFormat': outputNotebookFormat.toValue(),
      if (outputNotebookS3Location != null)
        'OutputNotebookS3Location': outputNotebookS3Location,
      if (outputNotebookURI != null) 'OutputNotebookURI': outputNotebookURI,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum NotebookExecutionStatus {
  startPending,
  starting,
  running,
  finishing,
  finished,
  failing,
  failed,
  stopPending,
  stopping,
  stopped,
}

extension NotebookExecutionStatusValueExtension on NotebookExecutionStatus {
  String toValue() {
    switch (this) {
      case NotebookExecutionStatus.startPending:
        return 'START_PENDING';
      case NotebookExecutionStatus.starting:
        return 'STARTING';
      case NotebookExecutionStatus.running:
        return 'RUNNING';
      case NotebookExecutionStatus.finishing:
        return 'FINISHING';
      case NotebookExecutionStatus.finished:
        return 'FINISHED';
      case NotebookExecutionStatus.failing:
        return 'FAILING';
      case NotebookExecutionStatus.failed:
        return 'FAILED';
      case NotebookExecutionStatus.stopPending:
        return 'STOP_PENDING';
      case NotebookExecutionStatus.stopping:
        return 'STOPPING';
      case NotebookExecutionStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension NotebookExecutionStatusFromString on String {
  NotebookExecutionStatus toNotebookExecutionStatus() {
    switch (this) {
      case 'START_PENDING':
        return NotebookExecutionStatus.startPending;
      case 'STARTING':
        return NotebookExecutionStatus.starting;
      case 'RUNNING':
        return NotebookExecutionStatus.running;
      case 'FINISHING':
        return NotebookExecutionStatus.finishing;
      case 'FINISHED':
        return NotebookExecutionStatus.finished;
      case 'FAILING':
        return NotebookExecutionStatus.failing;
      case 'FAILED':
        return NotebookExecutionStatus.failed;
      case 'STOP_PENDING':
        return NotebookExecutionStatus.stopPending;
      case 'STOPPING':
        return NotebookExecutionStatus.stopping;
      case 'STOPPED':
        return NotebookExecutionStatus.stopped;
    }
    throw Exception('$this is not known in enum NotebookExecutionStatus');
  }
}

/// Details for a notebook execution. The details include information such as
/// the unique ID and status of the notebook execution.
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
      status: (json['Status'] as String?)?.toNotebookExecutionStatus(),
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
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The Amazon S3 location that stores the notebook execution input.
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

/// The Amazon S3 location that stores the notebook execution input.
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

/// The Amazon Linux release specified for a cluster in the RunJobFlow request.
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

/// Describes the strategy for using unused Capacity Reservations for fulfilling
/// On-Demand capacity.
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
              ?.toOnDemandCapacityReservationPreference(),
      capacityReservationResourceGroupArn:
          json['CapacityReservationResourceGroupArn'] as String?,
      usageStrategy: (json['UsageStrategy'] as String?)
          ?.toOnDemandCapacityReservationUsageStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityReservationPreference = this.capacityReservationPreference;
    final capacityReservationResourceGroupArn =
        this.capacityReservationResourceGroupArn;
    final usageStrategy = this.usageStrategy;
    return {
      if (capacityReservationPreference != null)
        'CapacityReservationPreference':
            capacityReservationPreference.toValue(),
      if (capacityReservationResourceGroupArn != null)
        'CapacityReservationResourceGroupArn':
            capacityReservationResourceGroupArn,
      if (usageStrategy != null) 'UsageStrategy': usageStrategy.toValue(),
    };
  }
}

enum OnDemandCapacityReservationPreference {
  open,
  none,
}

extension OnDemandCapacityReservationPreferenceValueExtension
    on OnDemandCapacityReservationPreference {
  String toValue() {
    switch (this) {
      case OnDemandCapacityReservationPreference.open:
        return 'open';
      case OnDemandCapacityReservationPreference.none:
        return 'none';
    }
  }
}

extension OnDemandCapacityReservationPreferenceFromString on String {
  OnDemandCapacityReservationPreference
      toOnDemandCapacityReservationPreference() {
    switch (this) {
      case 'open':
        return OnDemandCapacityReservationPreference.open;
      case 'none':
        return OnDemandCapacityReservationPreference.none;
    }
    throw Exception(
        '$this is not known in enum OnDemandCapacityReservationPreference');
  }
}

enum OnDemandCapacityReservationUsageStrategy {
  useCapacityReservationsFirst,
}

extension OnDemandCapacityReservationUsageStrategyValueExtension
    on OnDemandCapacityReservationUsageStrategy {
  String toValue() {
    switch (this) {
      case OnDemandCapacityReservationUsageStrategy
            .useCapacityReservationsFirst:
        return 'use-capacity-reservations-first';
    }
  }
}

extension OnDemandCapacityReservationUsageStrategyFromString on String {
  OnDemandCapacityReservationUsageStrategy
      toOnDemandCapacityReservationUsageStrategy() {
    switch (this) {
      case 'use-capacity-reservations-first':
        return OnDemandCapacityReservationUsageStrategy
            .useCapacityReservationsFirst;
    }
    throw Exception(
        '$this is not known in enum OnDemandCapacityReservationUsageStrategy');
  }
}

enum OnDemandProvisioningAllocationStrategy {
  lowestPrice,
}

extension OnDemandProvisioningAllocationStrategyValueExtension
    on OnDemandProvisioningAllocationStrategy {
  String toValue() {
    switch (this) {
      case OnDemandProvisioningAllocationStrategy.lowestPrice:
        return 'lowest-price';
    }
  }
}

extension OnDemandProvisioningAllocationStrategyFromString on String {
  OnDemandProvisioningAllocationStrategy
      toOnDemandProvisioningAllocationStrategy() {
    switch (this) {
      case 'lowest-price':
        return OnDemandProvisioningAllocationStrategy.lowestPrice;
    }
    throw Exception(
        '$this is not known in enum OnDemandProvisioningAllocationStrategy');
  }
}

/// The launch specification for On-Demand Instances in the instance fleet,
/// which determines the allocation strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR releases
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
/// strategy is available in Amazon EMR releases 5.12.1 and later.
/// </note>
class OnDemandProvisioningSpecification {
  /// Specifies the strategy to use in launching On-Demand instance fleets.
  /// Currently, the only option is <code>lowest-price</code> (the default), which
  /// launches the lowest price first.
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
      allocationStrategy: (json['AllocationStrategy'] as String)
          .toOnDemandProvisioningAllocationStrategy(),
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
      'AllocationStrategy': allocationStrategy.toValue(),
      if (capacityReservationOptions != null)
        'CapacityReservationOptions': capacityReservationOptions,
    };
  }
}

/// The resize specification for On-Demand Instances in the instance fleet,
/// which contains the resize timeout period.
class OnDemandResizingSpecification {
  /// On-Demand resize timeout in minutes. If On-Demand Instances are not
  /// provisioned within this time, the resize workflow stops. The minimum value
  /// is 5 minutes, and the maximum value is 10,080 minutes (7 days). The timeout
  /// applies to all resize workflows on the Instance Fleet. The resize could be
  /// triggered by Amazon EMR Managed Scaling or by the customer (via Amazon EMR
  /// Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK
  /// ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot
  /// Reclamation.
  final int timeoutDurationMinutes;

  OnDemandResizingSpecification({
    required this.timeoutDurationMinutes,
  });

  factory OnDemandResizingSpecification.fromJson(Map<String, dynamic> json) {
    return OnDemandResizingSpecification(
      timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    return {
      'TimeoutDurationMinutes': timeoutDurationMinutes,
    };
  }
}

enum OutputNotebookFormat {
  html,
}

extension OutputNotebookFormatValueExtension on OutputNotebookFormat {
  String toValue() {
    switch (this) {
      case OutputNotebookFormat.html:
        return 'HTML';
    }
  }
}

extension OutputNotebookFormatFromString on String {
  OutputNotebookFormat toOutputNotebookFormat() {
    switch (this) {
      case 'HTML':
        return OutputNotebookFormat.html;
    }
    throw Exception('$this is not known in enum OutputNotebookFormat');
  }
}

/// The Amazon S3 location that stores the notebook execution output.
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

/// The Amazon S3 location that stores the notebook execution output.
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

/// Placement group configuration for an Amazon EMR cluster. The configuration
/// specifies the placement strategy that can be applied to instance roles
/// during cluster creation.
///
/// To use this configuration, consider attaching managed policy
/// AmazonElasticMapReducePlacementGroupPolicy to the Amazon EMR role.
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
      instanceRole: (json['InstanceRole'] as String).toInstanceRoleType(),
      placementStrategy:
          (json['PlacementStrategy'] as String?)?.toPlacementGroupStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceRole = this.instanceRole;
    final placementStrategy = this.placementStrategy;
    return {
      'InstanceRole': instanceRole.toValue(),
      if (placementStrategy != null)
        'PlacementStrategy': placementStrategy.toValue(),
    };
  }
}

enum PlacementGroupStrategy {
  spread,
  partition,
  cluster,
  none,
}

extension PlacementGroupStrategyValueExtension on PlacementGroupStrategy {
  String toValue() {
    switch (this) {
      case PlacementGroupStrategy.spread:
        return 'SPREAD';
      case PlacementGroupStrategy.partition:
        return 'PARTITION';
      case PlacementGroupStrategy.cluster:
        return 'CLUSTER';
      case PlacementGroupStrategy.none:
        return 'NONE';
    }
  }
}

extension PlacementGroupStrategyFromString on String {
  PlacementGroupStrategy toPlacementGroupStrategy() {
    switch (this) {
      case 'SPREAD':
        return PlacementGroupStrategy.spread;
      case 'PARTITION':
        return PlacementGroupStrategy.partition;
      case 'CLUSTER':
        return PlacementGroupStrategy.cluster;
      case 'NONE':
        return PlacementGroupStrategy.none;
    }
    throw Exception('$this is not known in enum PlacementGroupStrategy');
  }
}

/// The Amazon EC2 Availability Zone configuration of the cluster (job flow).
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
          ?.whereNotNull()
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

/// A list of port ranges that are permitted to allow inbound traffic from all
/// public IP addresses. To specify a single port, use the same value for
/// <code>MinRange</code> and <code>MaxRange</code>.
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
      minRange: json['MinRange'] as int,
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

class PutAutoTerminationPolicyOutput {
  PutAutoTerminationPolicyOutput();

  factory PutAutoTerminationPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutAutoTerminationPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

class PutManagedScalingPolicyOutput {
  PutManagedScalingPolicyOutput();

  factory PutManagedScalingPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutManagedScalingPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ReconfigurationType {
  overwrite,
  merge,
}

extension ReconfigurationTypeValueExtension on ReconfigurationType {
  String toValue() {
    switch (this) {
      case ReconfigurationType.overwrite:
        return 'OVERWRITE';
      case ReconfigurationType.merge:
        return 'MERGE';
    }
  }
}

extension ReconfigurationTypeFromString on String {
  ReconfigurationType toReconfigurationType() {
    switch (this) {
      case 'OVERWRITE':
        return ReconfigurationType.overwrite;
      case 'MERGE':
        return ReconfigurationType.merge;
    }
    throw Exception('$this is not known in enum ReconfigurationType');
  }
}

/// The release label filters by application or version prefix.
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

class RemoveAutoScalingPolicyOutput {
  RemoveAutoScalingPolicyOutput();

  factory RemoveAutoScalingPolicyOutput.fromJson(Map<String, dynamic> _) {
    return RemoveAutoScalingPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveAutoTerminationPolicyOutput {
  RemoveAutoTerminationPolicyOutput();

  factory RemoveAutoTerminationPolicyOutput.fromJson(Map<String, dynamic> _) {
    return RemoveAutoTerminationPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
class RemoveTagsOutput {
  RemoveTagsOutput();

  factory RemoveTagsOutput.fromJson(Map<String, dynamic> _) {
    return RemoveTagsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum RepoUpgradeOnBoot {
  security,
  none,
}

extension RepoUpgradeOnBootValueExtension on RepoUpgradeOnBoot {
  String toValue() {
    switch (this) {
      case RepoUpgradeOnBoot.security:
        return 'SECURITY';
      case RepoUpgradeOnBoot.none:
        return 'NONE';
    }
  }
}

extension RepoUpgradeOnBootFromString on String {
  RepoUpgradeOnBoot toRepoUpgradeOnBoot() {
    switch (this) {
      case 'SECURITY':
        return RepoUpgradeOnBoot.security;
      case 'NONE':
        return RepoUpgradeOnBoot.none;
    }
    throw Exception('$this is not known in enum RepoUpgradeOnBoot');
  }
}

/// The result of the <a>RunJobFlow</a> operation.
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

enum ScaleDownBehavior {
  terminateAtInstanceHour,
  terminateAtTaskCompletion,
}

extension ScaleDownBehaviorValueExtension on ScaleDownBehavior {
  String toValue() {
    switch (this) {
      case ScaleDownBehavior.terminateAtInstanceHour:
        return 'TERMINATE_AT_INSTANCE_HOUR';
      case ScaleDownBehavior.terminateAtTaskCompletion:
        return 'TERMINATE_AT_TASK_COMPLETION';
    }
  }
}

extension ScaleDownBehaviorFromString on String {
  ScaleDownBehavior toScaleDownBehavior() {
    switch (this) {
      case 'TERMINATE_AT_INSTANCE_HOUR':
        return ScaleDownBehavior.terminateAtInstanceHour;
      case 'TERMINATE_AT_TASK_COMPLETION':
        return ScaleDownBehavior.terminateAtTaskCompletion;
    }
    throw Exception('$this is not known in enum ScaleDownBehavior');
  }
}

/// The type of adjustment the automatic scaling activity makes when triggered,
/// and the periodicity of the adjustment.
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
              json['SimpleScalingPolicyConfiguration'] as Map<String, dynamic>),
      market: (json['Market'] as String?)?.toMarketType(),
    );
  }

  Map<String, dynamic> toJson() {
    final simpleScalingPolicyConfiguration =
        this.simpleScalingPolicyConfiguration;
    final market = this.market;
    return {
      'SimpleScalingPolicyConfiguration': simpleScalingPolicyConfiguration,
      if (market != null) 'Market': market.toValue(),
    };
  }
}

/// The upper and lower Amazon EC2 instance limits for an automatic scaling
/// policy. Automatic scaling activities triggered by automatic scaling rules
/// will not cause an instance group to grow above or below these limits.
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
      maxCapacity: json['MaxCapacity'] as int,
      minCapacity: json['MinCapacity'] as int,
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
      action: ScalingAction.fromJson(json['Action'] as Map<String, dynamic>),
      name: json['Name'] as String,
      trigger: ScalingTrigger.fromJson(json['Trigger'] as Map<String, dynamic>),
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

/// The conditions that trigger an automatic scaling activity.
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
          json['CloudWatchAlarmDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchAlarmDefinition = this.cloudWatchAlarmDefinition;
    return {
      'CloudWatchAlarmDefinition': cloudWatchAlarmDefinition,
    };
  }
}

/// Configuration of the script to run during a bootstrap action.
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
      path: json['Path'] as String,
      args: (json['Args'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

/// The creation date and time, and name, of a security configuration.
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

/// Details for an Amazon EMR Studio session mapping including creation time,
/// user or group ID, Studio ID, and so on.
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
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
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
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sessionPolicyArn != null) 'SessionPolicyArn': sessionPolicyArn,
      if (studioId != null) 'StudioId': studioId,
    };
  }
}

/// Details for an Amazon EMR Studio session mapping. The details do not include
/// the time the session mapping was last modified.
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
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
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
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (sessionPolicyArn != null) 'SessionPolicyArn': sessionPolicyArn,
      if (studioId != null) 'StudioId': studioId,
    };
  }
}

/// Policy for customizing shrink operations. Allows configuration of
/// decommissioning timeout and targeted instance shrinking.
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

/// An automatic scaling configuration, which describes how the policy adds or
/// removes instances, the cooldown period, and the number of Amazon EC2
/// instances that will be added each time the CloudWatch metric alarm condition
/// is satisfied.
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
      scalingAdjustment: json['ScalingAdjustment'] as int,
      adjustmentType: (json['AdjustmentType'] as String?)?.toAdjustmentType(),
      coolDown: json['CoolDown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scalingAdjustment = this.scalingAdjustment;
    final adjustmentType = this.adjustmentType;
    final coolDown = this.coolDown;
    return {
      'ScalingAdjustment': scalingAdjustment,
      if (adjustmentType != null) 'AdjustmentType': adjustmentType.toValue(),
      if (coolDown != null) 'CoolDown': coolDown,
    };
  }
}

/// The returned release label application names or versions.
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

enum SpotProvisioningAllocationStrategy {
  capacityOptimized,
  priceCapacityOptimized,
  lowestPrice,
  diversified,
}

extension SpotProvisioningAllocationStrategyValueExtension
    on SpotProvisioningAllocationStrategy {
  String toValue() {
    switch (this) {
      case SpotProvisioningAllocationStrategy.capacityOptimized:
        return 'capacity-optimized';
      case SpotProvisioningAllocationStrategy.priceCapacityOptimized:
        return 'price-capacity-optimized';
      case SpotProvisioningAllocationStrategy.lowestPrice:
        return 'lowest-price';
      case SpotProvisioningAllocationStrategy.diversified:
        return 'diversified';
    }
  }
}

extension SpotProvisioningAllocationStrategyFromString on String {
  SpotProvisioningAllocationStrategy toSpotProvisioningAllocationStrategy() {
    switch (this) {
      case 'capacity-optimized':
        return SpotProvisioningAllocationStrategy.capacityOptimized;
      case 'price-capacity-optimized':
        return SpotProvisioningAllocationStrategy.priceCapacityOptimized;
      case 'lowest-price':
        return SpotProvisioningAllocationStrategy.lowestPrice;
      case 'diversified':
        return SpotProvisioningAllocationStrategy.diversified;
    }
    throw Exception(
        '$this is not known in enum SpotProvisioningAllocationStrategy');
  }
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
  /// <code>price-capacity-optimized</code>, <code>capacity-optimized</code>,
  /// <code>lowest-price</code>, or <code>diversified</code>. For more information
  /// on the provisioning strategies, see <a
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
      timeoutAction:
          (json['TimeoutAction'] as String).toSpotProvisioningTimeoutAction(),
      timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int,
      allocationStrategy: (json['AllocationStrategy'] as String?)
          ?.toSpotProvisioningAllocationStrategy(),
      blockDurationMinutes: json['BlockDurationMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutAction = this.timeoutAction;
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    final allocationStrategy = this.allocationStrategy;
    final blockDurationMinutes = this.blockDurationMinutes;
    return {
      'TimeoutAction': timeoutAction.toValue(),
      'TimeoutDurationMinutes': timeoutDurationMinutes,
      if (allocationStrategy != null)
        'AllocationStrategy': allocationStrategy.toValue(),
      if (blockDurationMinutes != null)
        'BlockDurationMinutes': blockDurationMinutes,
    };
  }
}

enum SpotProvisioningTimeoutAction {
  switchToOnDemand,
  terminateCluster,
}

extension SpotProvisioningTimeoutActionValueExtension
    on SpotProvisioningTimeoutAction {
  String toValue() {
    switch (this) {
      case SpotProvisioningTimeoutAction.switchToOnDemand:
        return 'SWITCH_TO_ON_DEMAND';
      case SpotProvisioningTimeoutAction.terminateCluster:
        return 'TERMINATE_CLUSTER';
    }
  }
}

extension SpotProvisioningTimeoutActionFromString on String {
  SpotProvisioningTimeoutAction toSpotProvisioningTimeoutAction() {
    switch (this) {
      case 'SWITCH_TO_ON_DEMAND':
        return SpotProvisioningTimeoutAction.switchToOnDemand;
      case 'TERMINATE_CLUSTER':
        return SpotProvisioningTimeoutAction.terminateCluster;
    }
    throw Exception('$this is not known in enum SpotProvisioningTimeoutAction');
  }
}

/// The resize specification for Spot Instances in the instance fleet, which
/// contains the resize timeout period.
class SpotResizingSpecification {
  /// Spot resize timeout in minutes. If Spot Instances are not provisioned within
  /// this time, the resize workflow will stop provisioning of Spot instances.
  /// Minimum value is 5 minutes and maximum value is 10,080 minutes (7 days). The
  /// timeout applies to all resize workflows on the Instance Fleet. The resize
  /// could be triggered by Amazon EMR Managed Scaling or by the customer (via
  /// Amazon EMR Console, Amazon EMR CLI modify-instance-fleet or Amazon EMR SDK
  /// ModifyInstanceFleet API) or by Amazon EMR due to Amazon EC2 Spot
  /// Reclamation.
  final int timeoutDurationMinutes;

  SpotResizingSpecification({
    required this.timeoutDurationMinutes,
  });

  factory SpotResizingSpecification.fromJson(Map<String, dynamic> json) {
    return SpotResizingSpecification(
      timeoutDurationMinutes: json['TimeoutDurationMinutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutDurationMinutes = this.timeoutDurationMinutes;
    return {
      'TimeoutDurationMinutes': timeoutDurationMinutes,
    };
  }
}

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

enum Statistic {
  sampleCount,
  average,
  sum,
  minimum,
  maximum,
}

extension StatisticValueExtension on Statistic {
  String toValue() {
    switch (this) {
      case Statistic.sampleCount:
        return 'SAMPLE_COUNT';
      case Statistic.average:
        return 'AVERAGE';
      case Statistic.sum:
        return 'SUM';
      case Statistic.minimum:
        return 'MINIMUM';
      case Statistic.maximum:
        return 'MAXIMUM';
    }
  }
}

extension StatisticFromString on String {
  Statistic toStatistic() {
    switch (this) {
      case 'SAMPLE_COUNT':
        return Statistic.sampleCount;
      case 'AVERAGE':
        return Statistic.average;
      case 'SUM':
        return Statistic.sum;
      case 'MINIMUM':
        return Statistic.minimum;
      case 'MAXIMUM':
        return Statistic.maximum;
    }
    throw Exception('$this is not known in enum Statistic');
  }
}

/// This represents a step in a cluster.
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

  /// The name of the cluster step.
  final String? name;

  /// The current execution status details of the cluster step.
  final StepStatus? status;

  Step({
    this.actionOnFailure,
    this.config,
    this.executionRoleArn,
    this.id,
    this.name,
    this.status,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.toActionOnFailure(),
      config: json['Config'] != null
          ? HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] != null
          ? StepStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionOnFailure = this.actionOnFailure;
    final config = this.config;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.toValue(),
      if (config != null) 'Config': config,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

enum StepCancellationOption {
  sendInterrupt,
  terminateProcess,
}

extension StepCancellationOptionValueExtension on StepCancellationOption {
  String toValue() {
    switch (this) {
      case StepCancellationOption.sendInterrupt:
        return 'SEND_INTERRUPT';
      case StepCancellationOption.terminateProcess:
        return 'TERMINATE_PROCESS';
    }
  }
}

extension StepCancellationOptionFromString on String {
  StepCancellationOption toStepCancellationOption() {
    switch (this) {
      case 'SEND_INTERRUPT':
        return StepCancellationOption.sendInterrupt;
      case 'TERMINATE_PROCESS':
        return StepCancellationOption.terminateProcess;
    }
    throw Exception('$this is not known in enum StepCancellationOption');
  }
}

/// Specification for a cluster (job flow) step.
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

  StepConfig({
    required this.hadoopJarStep,
    required this.name,
    this.actionOnFailure,
  });

  factory StepConfig.fromJson(Map<String, dynamic> json) {
    return StepConfig(
      hadoopJarStep: HadoopJarStepConfig.fromJson(
          json['HadoopJarStep'] as Map<String, dynamic>),
      name: json['Name'] as String,
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.toActionOnFailure(),
    );
  }

  Map<String, dynamic> toJson() {
    final hadoopJarStep = this.hadoopJarStep;
    final name = this.name;
    final actionOnFailure = this.actionOnFailure;
    return {
      'HadoopJarStep': hadoopJarStep,
      'Name': name,
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.toValue(),
    };
  }
}

/// Combines the execution state and configuration of a step.
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
          json['ExecutionStatusDetail'] as Map<String, dynamic>),
      stepConfig:
          StepConfig.fromJson(json['StepConfig'] as Map<String, dynamic>),
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

enum StepExecutionState {
  pending,
  running,
  $continue,
  completed,
  cancelled,
  failed,
  interrupted,
}

extension StepExecutionStateValueExtension on StepExecutionState {
  String toValue() {
    switch (this) {
      case StepExecutionState.pending:
        return 'PENDING';
      case StepExecutionState.running:
        return 'RUNNING';
      case StepExecutionState.$continue:
        return 'CONTINUE';
      case StepExecutionState.completed:
        return 'COMPLETED';
      case StepExecutionState.cancelled:
        return 'CANCELLED';
      case StepExecutionState.failed:
        return 'FAILED';
      case StepExecutionState.interrupted:
        return 'INTERRUPTED';
    }
  }
}

extension StepExecutionStateFromString on String {
  StepExecutionState toStepExecutionState() {
    switch (this) {
      case 'PENDING':
        return StepExecutionState.pending;
      case 'RUNNING':
        return StepExecutionState.running;
      case 'CONTINUE':
        return StepExecutionState.$continue;
      case 'COMPLETED':
        return StepExecutionState.completed;
      case 'CANCELLED':
        return StepExecutionState.cancelled;
      case 'FAILED':
        return StepExecutionState.failed;
      case 'INTERRUPTED':
        return StepExecutionState.interrupted;
    }
    throw Exception('$this is not known in enum StepExecutionState');
  }
}

/// The execution state of a step.
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
          nonNullableTimeStampFromJson(json['CreationDateTime'] as Object),
      state: (json['State'] as String).toStepExecutionState(),
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
      'State': state.toValue(),
      if (endDateTime != null) 'EndDateTime': unixTimestampToJson(endDateTime),
      if (lastStateChangeReason != null)
        'LastStateChangeReason': lastStateChangeReason,
      if (startDateTime != null)
        'StartDateTime': unixTimestampToJson(startDateTime),
    };
  }
}

enum StepState {
  pending,
  cancelPending,
  running,
  completed,
  cancelled,
  failed,
  interrupted,
}

extension StepStateValueExtension on StepState {
  String toValue() {
    switch (this) {
      case StepState.pending:
        return 'PENDING';
      case StepState.cancelPending:
        return 'CANCEL_PENDING';
      case StepState.running:
        return 'RUNNING';
      case StepState.completed:
        return 'COMPLETED';
      case StepState.cancelled:
        return 'CANCELLED';
      case StepState.failed:
        return 'FAILED';
      case StepState.interrupted:
        return 'INTERRUPTED';
    }
  }
}

extension StepStateFromString on String {
  StepState toStepState() {
    switch (this) {
      case 'PENDING':
        return StepState.pending;
      case 'CANCEL_PENDING':
        return StepState.cancelPending;
      case 'RUNNING':
        return StepState.running;
      case 'COMPLETED':
        return StepState.completed;
      case 'CANCELLED':
        return StepState.cancelled;
      case 'FAILED':
        return StepState.failed;
      case 'INTERRUPTED':
        return StepState.interrupted;
    }
    throw Exception('$this is not known in enum StepState');
  }
}

/// The details of the step state change reason.
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
      code: (json['Code'] as String?)?.toStepStateChangeReasonCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum StepStateChangeReasonCode {
  none,
}

extension StepStateChangeReasonCodeValueExtension on StepStateChangeReasonCode {
  String toValue() {
    switch (this) {
      case StepStateChangeReasonCode.none:
        return 'NONE';
    }
  }
}

extension StepStateChangeReasonCodeFromString on String {
  StepStateChangeReasonCode toStepStateChangeReasonCode() {
    switch (this) {
      case 'NONE':
        return StepStateChangeReasonCode.none;
    }
    throw Exception('$this is not known in enum StepStateChangeReasonCode');
  }
}

/// The execution status details of the cluster step.
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
      state: (json['State'] as String?)?.toStepState(),
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
      if (state != null) 'State': state.toValue(),
      if (stateChangeReason != null) 'StateChangeReason': stateChangeReason,
      if (timeline != null) 'Timeline': timeline,
    };
  }
}

/// The summary of the cluster step.
class StepSummary {
  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// available for backward compatibility.
  final ActionOnFailure? actionOnFailure;

  /// The Hadoop job configuration of the cluster step.
  final HadoopStepConfig? config;

  /// The identifier of the cluster step.
  final String? id;

  /// The name of the cluster step.
  final String? name;

  /// The current execution status details of the cluster step.
  final StepStatus? status;

  StepSummary({
    this.actionOnFailure,
    this.config,
    this.id,
    this.name,
    this.status,
  });

  factory StepSummary.fromJson(Map<String, dynamic> json) {
    return StepSummary(
      actionOnFailure:
          (json['ActionOnFailure'] as String?)?.toActionOnFailure(),
      config: json['Config'] != null
          ? HadoopStepConfig.fromJson(json['Config'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: json['Status'] != null
          ? StepStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionOnFailure = this.actionOnFailure;
    final config = this.config;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (actionOnFailure != null) 'ActionOnFailure': actionOnFailure.toValue(),
      if (config != null) 'Config': config,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

/// The timeline of the cluster step lifecycle.
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

/// Details for an Amazon EMR Studio including ID, creation time, name, and so
/// on.
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
      authMode: (json['AuthMode'] as String?)?.toAuthMode(),
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultS3Location: json['DefaultS3Location'] as String?,
      description: json['Description'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      engineSecurityGroupId: json['EngineSecurityGroupId'] as String?,
      idcInstanceArn: json['IdcInstanceArn'] as String?,
      idcUserAssignment:
          (json['IdcUserAssignment'] as String?)?.toIdcUserAssignment(),
      idpAuthUrl: json['IdpAuthUrl'] as String?,
      idpRelayStateParameterName: json['IdpRelayStateParameterName'] as String?,
      name: json['Name'] as String?,
      serviceRole: json['ServiceRole'] as String?,
      studioArn: json['StudioArn'] as String?,
      studioId: json['StudioId'] as String?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
      if (authMode != null) 'AuthMode': authMode.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultS3Location != null) 'DefaultS3Location': defaultS3Location,
      if (description != null) 'Description': description,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (engineSecurityGroupId != null)
        'EngineSecurityGroupId': engineSecurityGroupId,
      if (idcInstanceArn != null) 'IdcInstanceArn': idcInstanceArn,
      if (idcUserAssignment != null)
        'IdcUserAssignment': idcUserAssignment.toValue(),
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

/// Details for an Amazon EMR Studio, including ID, Name, VPC, and Description.
/// To fetch additional details such as subnets, IAM roles, security groups, and
/// tags for the Studio, use the <a>DescribeStudio</a> API.
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
      authMode: (json['AuthMode'] as String?)?.toAuthMode(),
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
      if (authMode != null) 'AuthMode': authMode.toValue(),
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

/// An instance type that the specified Amazon EMR release supports.
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

/// The list of supported product configurations that allow user-supplied
/// arguments. Amazon EMR accepts these arguments and forwards them to the
/// corresponding installation script as bootstrap action arguments.
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

/// A key-value pair containing user-defined metadata that you can associate
/// with an Amazon EMR resource. Tags make it easier to associate clusters in
/// various ways, such as grouping clusters to track your Amazon EMR resource
/// allocation costs. For more information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
/// Clusters</a>.
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

enum Unit {
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
  countPerSecond,
}

extension UnitValueExtension on Unit {
  String toValue() {
    switch (this) {
      case Unit.none:
        return 'NONE';
      case Unit.seconds:
        return 'SECONDS';
      case Unit.microSeconds:
        return 'MICRO_SECONDS';
      case Unit.milliSeconds:
        return 'MILLI_SECONDS';
      case Unit.bytes:
        return 'BYTES';
      case Unit.kiloBytes:
        return 'KILO_BYTES';
      case Unit.megaBytes:
        return 'MEGA_BYTES';
      case Unit.gigaBytes:
        return 'GIGA_BYTES';
      case Unit.teraBytes:
        return 'TERA_BYTES';
      case Unit.bits:
        return 'BITS';
      case Unit.kiloBits:
        return 'KILO_BITS';
      case Unit.megaBits:
        return 'MEGA_BITS';
      case Unit.gigaBits:
        return 'GIGA_BITS';
      case Unit.teraBits:
        return 'TERA_BITS';
      case Unit.percent:
        return 'PERCENT';
      case Unit.count:
        return 'COUNT';
      case Unit.bytesPerSecond:
        return 'BYTES_PER_SECOND';
      case Unit.kiloBytesPerSecond:
        return 'KILO_BYTES_PER_SECOND';
      case Unit.megaBytesPerSecond:
        return 'MEGA_BYTES_PER_SECOND';
      case Unit.gigaBytesPerSecond:
        return 'GIGA_BYTES_PER_SECOND';
      case Unit.teraBytesPerSecond:
        return 'TERA_BYTES_PER_SECOND';
      case Unit.bitsPerSecond:
        return 'BITS_PER_SECOND';
      case Unit.kiloBitsPerSecond:
        return 'KILO_BITS_PER_SECOND';
      case Unit.megaBitsPerSecond:
        return 'MEGA_BITS_PER_SECOND';
      case Unit.gigaBitsPerSecond:
        return 'GIGA_BITS_PER_SECOND';
      case Unit.teraBitsPerSecond:
        return 'TERA_BITS_PER_SECOND';
      case Unit.countPerSecond:
        return 'COUNT_PER_SECOND';
    }
  }
}

extension UnitFromString on String {
  Unit toUnit() {
    switch (this) {
      case 'NONE':
        return Unit.none;
      case 'SECONDS':
        return Unit.seconds;
      case 'MICRO_SECONDS':
        return Unit.microSeconds;
      case 'MILLI_SECONDS':
        return Unit.milliSeconds;
      case 'BYTES':
        return Unit.bytes;
      case 'KILO_BYTES':
        return Unit.kiloBytes;
      case 'MEGA_BYTES':
        return Unit.megaBytes;
      case 'GIGA_BYTES':
        return Unit.gigaBytes;
      case 'TERA_BYTES':
        return Unit.teraBytes;
      case 'BITS':
        return Unit.bits;
      case 'KILO_BITS':
        return Unit.kiloBits;
      case 'MEGA_BITS':
        return Unit.megaBits;
      case 'GIGA_BITS':
        return Unit.gigaBits;
      case 'TERA_BITS':
        return Unit.teraBits;
      case 'PERCENT':
        return Unit.percent;
      case 'COUNT':
        return Unit.count;
      case 'BYTES_PER_SECOND':
        return Unit.bytesPerSecond;
      case 'KILO_BYTES_PER_SECOND':
        return Unit.kiloBytesPerSecond;
      case 'MEGA_BYTES_PER_SECOND':
        return Unit.megaBytesPerSecond;
      case 'GIGA_BYTES_PER_SECOND':
        return Unit.gigaBytesPerSecond;
      case 'TERA_BYTES_PER_SECOND':
        return Unit.teraBytesPerSecond;
      case 'BITS_PER_SECOND':
        return Unit.bitsPerSecond;
      case 'KILO_BITS_PER_SECOND':
        return Unit.kiloBitsPerSecond;
      case 'MEGA_BITS_PER_SECOND':
        return Unit.megaBitsPerSecond;
      case 'GIGA_BITS_PER_SECOND':
        return Unit.gigaBitsPerSecond;
      case 'TERA_BITS_PER_SECOND':
        return Unit.teraBitsPerSecond;
      case 'COUNT_PER_SECOND':
        return Unit.countPerSecond;
    }
    throw Exception('$this is not known in enum Unit');
  }
}

/// The username and password that you use to connect to cluster endpoints.
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

/// EBS volume specifications such as volume type, IOPS, size (GiB) and
/// throughput (MiB/s) that are requested for the EBS volume attached to an
/// Amazon EC2 instance in the cluster.
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
      sizeInGB: json['SizeInGB'] as int,
      volumeType: json['VolumeType'] as String,
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

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

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
