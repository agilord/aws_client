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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2009-03-31.g.dart';

/// Amazon EMR is a web service that makes it easier to process large amounts of
/// data efficiently. Amazon EMR uses Hadoop processing combined with several
/// AWS services to do tasks such as web indexing, data mining, log file
/// analysis, machine learning, scientific simulation, and data warehouse
/// management.
class Emr {
  final _s.JsonProtocol _protocol;
  Emr({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'elasticmapreduce',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds an instance fleet to a running cluster.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
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
    @_s.required String clusterId,
    @_s.required InstanceFleetConfig instanceFleet,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceFleet, 'instanceFleet');
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
    @_s.required List<InstanceGroupConfig> instanceGroups,
    @_s.required String jobFlowId,
  }) async {
    ArgumentError.checkNotNull(instanceGroups, 'instanceGroups');
    ArgumentError.checkNotNull(jobFlowId, 'jobFlowId');
    _s.validateStringLength(
      'jobFlowId',
      jobFlowId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobFlowId',
      jobFlowId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
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
  /// running on the master node, such as Hive and Hadoop. For more information
  /// on how to do this, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add
  /// More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management
  /// Guide</i>.
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
  Future<AddJobFlowStepsOutput> addJobFlowSteps({
    @_s.required String jobFlowId,
    @_s.required List<StepConfig> steps,
  }) async {
    ArgumentError.checkNotNull(jobFlowId, 'jobFlowId');
    _s.validateStringLength(
      'jobFlowId',
      jobFlowId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobFlowId',
      jobFlowId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(steps, 'steps');
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
      },
    );

    return AddJobFlowStepsOutput.fromJson(jsonResponse.body);
  }

  /// Adds tags to an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// Clusters</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourceId] :
  /// The Amazon EMR resource identifier to which tags will be added. This value
  /// must be a cluster identifier.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with a cluster and propagate to EC2 instances.
  /// Tags are user-defined key-value pairs that consist of a required key
  /// string with a maximum of 128 characters, and an optional value string with
  /// a maximum of 256 characters.
  Future<void> addTags({
    @_s.required String resourceId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.AddTags'
    };
    final jsonResponse = await _protocol.send(
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

    return AddTagsOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a pending step or steps in a running cluster. Available only in
  /// Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of
  /// 256 steps are allowed in each CancelSteps request. CancelSteps is
  /// idempotent but asynchronous; it does not guarantee that a step will be
  /// canceled, even if the request is successfully submitted. You can only
  /// cancel steps that are in a <code>PENDING</code> state.
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
    @_s.required String clusterId,
    @_s.required List<String> stepIds,
    StepCancellationOption stepCancellationOption,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stepIds, 'stepIds');
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
    @_s.required String name,
    @_s.required String securityConfiguration,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityConfiguration, 'securityConfiguration');
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

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Creates a new Amazon EMR Studio.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [authMode] :
  /// Specifies whether the Studio authenticates users using single sign-on
  /// (SSO) or IAM. Amazon EMR Studio currently only supports SSO
  /// authentication.
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
  /// The IAM role that will be assumed by the Amazon EMR Studio. The service
  /// role provides a way for Amazon EMR Studio to interoperate with other AWS
  /// services.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs to associate with the Studio. The subnets must belong
  /// to the VPC specified by <code>VpcId</code>. Studio users can create a
  /// Workspace in any of the specified subnets.
  ///
  /// Parameter [userRole] :
  /// The IAM user role that will be assumed by users and groups logged in to a
  /// Studio. The permissions attached to this IAM role can be scoped down for
  /// each user or group using session policies.
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
  /// Parameter [defaultS3Location] :
  /// The default Amazon S3 location to back up EMR Studio Workspaces and
  /// notebook files. A Studio user can select an alternative Amazon S3 location
  /// when creating a Workspace.
  ///
  /// Parameter [description] :
  /// A detailed description of the Studio.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the Studio. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of
  /// 128 characters, and an optional value string with a maximum of 256
  /// characters.
  Future<CreateStudioOutput> createStudio({
    @_s.required AuthMode authMode,
    @_s.required String engineSecurityGroupId,
    @_s.required String name,
    @_s.required String serviceRole,
    @_s.required List<String> subnetIds,
    @_s.required String userRole,
    @_s.required String vpcId,
    @_s.required String workspaceSecurityGroupId,
    String defaultS3Location,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(authMode, 'authMode');
    ArgumentError.checkNotNull(engineSecurityGroupId, 'engineSecurityGroupId');
    _s.validateStringLength(
      'engineSecurityGroupId',
      engineSecurityGroupId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'engineSecurityGroupId',
      engineSecurityGroupId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceRole, 'serviceRole');
    _s.validateStringLength(
      'serviceRole',
      serviceRole,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceRole',
      serviceRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    ArgumentError.checkNotNull(userRole, 'userRole');
    _s.validateStringLength(
      'userRole',
      userRole,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userRole',
      userRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpcId, 'vpcId');
    _s.validateStringLength(
      'vpcId',
      vpcId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vpcId',
      vpcId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        workspaceSecurityGroupId, 'workspaceSecurityGroupId');
    _s.validateStringLength(
      'workspaceSecurityGroupId',
      workspaceSecurityGroupId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workspaceSecurityGroupId',
      workspaceSecurityGroupId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'defaultS3Location',
      defaultS3Location,
      0,
      10280,
    );
    _s.validateStringPattern(
      'defaultS3Location',
      defaultS3Location,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'AuthMode': authMode?.toValue() ?? '',
        'EngineSecurityGroupId': engineSecurityGroupId,
        'Name': name,
        'ServiceRole': serviceRole,
        'SubnetIds': subnetIds,
        'UserRole': userRole,
        'VpcId': vpcId,
        'WorkspaceSecurityGroupId': workspaceSecurityGroupId,
        if (defaultS3Location != null) 'DefaultS3Location': defaultS3Location,
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateStudioOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Maps a user or group to the Amazon EMR Studio specified by
  /// <code>StudioId</code>, and applies a session policy to refine Studio
  /// permissions for that user or group.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to map to the Studio is a user or a group.
  ///
  /// Parameter [sessionPolicyArn] :
  /// The Amazon Resource Name (ARN) for the session policy that will be applied
  /// to the user or group. Session policies refine Studio user permissions
  /// without the need to use multiple IAM user roles.
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio to which the user or group will be mapped.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group from the AWS
  /// SSO Identity Store. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<void> createStudioSessionMapping({
    @_s.required IdentityType identityType,
    @_s.required String sessionPolicyArn,
    @_s.required String studioId,
    String identityId,
    String identityName,
  }) async {
    ArgumentError.checkNotNull(identityType, 'identityType');
    ArgumentError.checkNotNull(sessionPolicyArn, 'sessionPolicyArn');
    _s.validateStringLength(
      'sessionPolicyArn',
      sessionPolicyArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sessionPolicyArn',
      sessionPolicyArn,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'identityName',
      identityName,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityName',
      identityName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.CreateStudioSessionMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType?.toValue() ?? '',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteSecurityConfiguration'
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

    return DeleteSecurityConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Removes an Amazon EMR Studio from the Studio metadata store.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [studioId] :
  /// The ID of the Amazon EMR Studio.
  Future<void> deleteStudio({
    @_s.required String studioId,
  }) async {
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteStudio'
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
  }

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Removes a user or group from an Amazon EMR Studio.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [identityType] :
  /// Specifies whether the identity to delete from the Studio is a user or a
  /// group.
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
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user name or group to remove from the Studio. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<void> deleteStudioSessionMapping({
    @_s.required IdentityType identityType,
    @_s.required String studioId,
    String identityId,
    String identityName,
  }) async {
    ArgumentError.checkNotNull(identityType, 'identityType');
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'identityName',
      identityName,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityName',
      identityName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.DeleteStudioSessionMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType?.toValue() ?? '',
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
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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
    DateTime createdAfter,
    DateTime createdBefore,
    List<String> jobFlowIds,
    List<JobFlowExecutionState> jobFlowStates,
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
          'JobFlowStates':
              jobFlowStates.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String notebookExecutionId,
  }) async {
    ArgumentError.checkNotNull(notebookExecutionId, 'notebookExecutionId');
    _s.validateStringLength(
      'notebookExecutionId',
      notebookExecutionId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'notebookExecutionId',
      notebookExecutionId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
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

  /// Provides the details of a security configuration by returning the
  /// configuration JSON.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  Future<DescribeSecurityConfigurationOutput> describeSecurityConfiguration({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
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
    @_s.required String clusterId,
    @_s.required String stepId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    ArgumentError.checkNotNull(stepId, 'stepId');
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

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Returns details for the specified Amazon EMR Studio including ID, Name,
  /// VPC, Studio access URL, and so on.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [studioId] :
  /// The Amazon EMR Studio ID.
  Future<DescribeStudioOutput> describeStudio({
    @_s.required String studioId,
  }) async {
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
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

  /// Returns the Amazon EMR block public access configuration for your AWS
  /// account in the current Region. For more information see <a
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

  /// Fetches the attached managed scaling policy for an Amazon EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the cluster for which the managed scaling policy will
  /// be fetched.
  Future<GetManagedScalingPolicyOutput> getManagedScalingPolicy({
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
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
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group to fetch. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<GetStudioSessionMappingOutput> getStudioSessionMapping({
    @_s.required IdentityType identityType,
    @_s.required String studioId,
    String identityId,
    String identityName,
  }) async {
    ArgumentError.checkNotNull(identityType, 'identityType');
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'identityName',
      identityName,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityName',
      identityName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'IdentityType': identityType?.toValue() ?? '',
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
    @_s.required String clusterId,
    String marker,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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

  /// Provides the status of all clusters visible to this AWS account. Allows
  /// you to filter the list of clusters based on certain criteria; for example,
  /// filtering by cluster creation date and time or by status. This call
  /// returns a maximum of 50 clusters per call, but returns a marker to track
  /// the paging of the cluster list across multiple ListClusters calls.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterStates] :
  /// The cluster state filters to apply when listing clusters.
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
    List<ClusterState> clusterStates,
    DateTime createdAfter,
    DateTime createdBefore,
    String marker,
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
          'ClusterStates':
              clusterStates.map((e) => e?.toValue() ?? '').toList(),
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
  /// The instance fleet configuration is available only in Amazon EMR versions
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
    @_s.required String clusterId,
    String marker,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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
    @_s.required String clusterId,
    String marker,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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

  /// Provides information for all active EC2 instances and EC2 instances
  /// terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in
  /// any of the following states are considered active: AWAITING_FULFILLMENT,
  /// PROVISIONING, BOOTSTRAPPING, RUNNING.
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
    @_s.required String clusterId,
    String instanceFleetId,
    InstanceFleetType instanceFleetType,
    String instanceGroupId,
    List<InstanceGroupType> instanceGroupTypes,
    List<InstanceState> instanceStates,
    String marker,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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
              instanceGroupTypes.map((e) => e?.toValue() ?? '').toList(),
        if (instanceStates != null)
          'InstanceStates':
              instanceStates.map((e) => e?.toValue() ?? '').toList(),
        if (marker != null) 'Marker': marker,
      },
    );

    return ListInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Provides summaries of all notebook executions. You can filter the list
  /// based on multiple criteria such as status, time range, and editor id.
  /// Returns a maximum of 50 notebook executions and a marker to track the
  /// paging of a longer notebook execution list across multiple
  /// <code>ListNotebookExecution</code> calls.
  ///
  /// May throw [InternalServerError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [editorId] :
  /// The unique ID of the editor associated with the notebook execution.
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
    String editorId,
    DateTime from,
    String marker,
    NotebookExecutionStatus status,
    DateTime to,
  }) async {
    _s.validateStringLength(
      'editorId',
      editorId,
      0,
      256,
    );
    _s.validateStringPattern(
      'editorId',
      editorId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        if (from != null) 'From': unixTimestampToJson(from),
        if (marker != null) 'Marker': marker,
        if (status != null) 'Status': status.toValue(),
        if (to != null) 'To': unixTimestampToJson(to),
      },
    );

    return ListNotebookExecutionsOutput.fromJson(jsonResponse.body);
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
    String marker,
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
  /// specify <code>stepIds</code> with the request of filter by
  /// <code>StepStates</code>. You can specify a maximum of ten
  /// <code>stepIDs</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [clusterId] :
  /// The identifier of the cluster for which to list the steps.
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [stepIds] :
  /// The filter to limit the step list based on the identifier of the steps.
  /// You can specify a maximum of ten Step IDs. The character constraint
  /// applies to the overall length of the array.
  ///
  /// Parameter [stepStates] :
  /// The filter to limit the step list based on certain states.
  Future<ListStepsOutput> listSteps({
    @_s.required String clusterId,
    String marker,
    List<String> stepIds,
    List<StepState> stepStates,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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
          'StepStates': stepStates.map((e) => e?.toValue() ?? '').toList(),
      },
    );

    return ListStepsOutput.fromJson(jsonResponse.body);
  }

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Returns a list of all user or group session mappings for the EMR Studio
  /// specified by <code>StudioId</code>.
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
    IdentityType identityType,
    String marker,
    String studioId,
  }) async {
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
  /// Returns a list of all Amazon EMR Studios associated with the AWS account.
  /// The list includes details such as ID, Studio Access URL, and creation time
  /// for each Studio.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [marker] :
  /// The pagination token that indicates the set of results to retrieve.
  Future<ListStudiosOutput> listStudios({
    String marker,
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
  /// maximum of 256 steps.
  Future<ModifyClusterOutput> modifyCluster({
    @_s.required String clusterId,
    int stepConcurrencyLevel,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
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
  /// The instance fleet configuration is available only in Amazon EMR versions
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
  /// The unique identifier of the instance fleet.
  Future<void> modifyInstanceFleet({
    @_s.required String clusterId,
    @_s.required InstanceFleetModifyConfig instanceFleet,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    ArgumentError.checkNotNull(instanceFleet, 'instanceFleet');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ModifyInstanceFleet'
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
    String clusterId,
    List<InstanceGroupModifyConfig> instanceGroups,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.ModifyInstanceGroups'
    };
    final jsonResponse = await _protocol.send(
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
  /// policy defines how an instance group dynamically adds and terminates EC2
  /// instances in response to the value of a CloudWatch metric.
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
    @_s.required AutoScalingPolicy autoScalingPolicy,
    @_s.required String clusterId,
    @_s.required String instanceGroupId,
  }) async {
    ArgumentError.checkNotNull(autoScalingPolicy, 'autoScalingPolicy');
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    ArgumentError.checkNotNull(instanceGroupId, 'instanceGroupId');
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

  /// Creates or updates an Amazon EMR block public access configuration for
  /// your AWS account in the current Region. For more information see <a
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
  /// not create an EMR cluster in a Region before this date, block public
  /// access is enabled by default in that Region.
  /// </note>
  Future<void> putBlockPublicAccessConfiguration({
    @_s.required BlockPublicAccessConfiguration blockPublicAccessConfiguration,
  }) async {
    ArgumentError.checkNotNull(
        blockPublicAccessConfiguration, 'blockPublicAccessConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutBlockPublicAccessConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BlockPublicAccessConfiguration': blockPublicAccessConfiguration,
      },
    );

    return PutBlockPublicAccessConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Creates or updates a managed scaling policy for an Amazon EMR cluster. The
  /// managed scaling policy defines the limits for resources, such as EC2
  /// instances that can be added or terminated from a cluster. The policy only
  /// applies to the core and task nodes. The master node cannot be scaled after
  /// initial configuration.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of an EMR cluster where the managed scaling policy is
  /// attached.
  ///
  /// Parameter [managedScalingPolicy] :
  /// Specifies the constraints for the managed scaling policy.
  Future<void> putManagedScalingPolicy({
    @_s.required String clusterId,
    @_s.required ManagedScalingPolicy managedScalingPolicy,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    ArgumentError.checkNotNull(managedScalingPolicy, 'managedScalingPolicy');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.PutManagedScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
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

    return PutManagedScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Removes an automatic scaling policy from a specified instance group within
  /// an EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  ///
  /// Parameter [instanceGroupId] :
  /// Specifies the ID of the instance group to which the scaling policy is
  /// applied.
  Future<void> removeAutoScalingPolicy({
    @_s.required String clusterId,
    @_s.required String instanceGroupId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    ArgumentError.checkNotNull(instanceGroupId, 'instanceGroupId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveAutoScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
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

    return RemoveAutoScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Removes a managed scaling policy from a specified EMR cluster.
  ///
  /// Parameter [clusterId] :
  /// Specifies the ID of the cluster from which the managed scaling policy will
  /// be removed.
  Future<void> removeManagedScalingPolicy({
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveManagedScalingPolicy'
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

    return RemoveManagedScalingPolicyOutput.fromJson(jsonResponse.body);
  }

  /// Removes tags from an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see <a
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
  /// The Amazon EMR resource identifier from which tags will be removed. This
  /// value must be a cluster identifier.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from a resource.
  Future<void> removeTags({
    @_s.required String resourceId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.RemoveTags'
    };
    final jsonResponse = await _protocol.send(
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

    return RemoveTagsOutput.fromJson(jsonResponse.body);
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
  /// software running on the master node, such as Hive and Hadoop. For more
  /// information on how to do this, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add
  /// More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management
  /// Guide</i>.
  ///
  /// For long running clusters, we recommend that you periodically store your
  /// results.
  /// <note>
  /// The instance fleets configuration is available only in Amazon EMR versions
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
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">Amazon EMR
  /// Release Guide</a>.
  ///
  /// Parameter [autoScalingRole] :
  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides
  /// permissions that the automatic scaling feature requires to launch and
  /// terminate EC2 instances in an instance group.
  ///
  /// Parameter [bootstrapActions] :
  /// A list of bootstrap actions to run before Hadoop starts on the cluster
  /// nodes.
  ///
  /// Parameter [configurations] :
  /// For Amazon EMR releases 4.0 and later. The list of configurations supplied
  /// for the EMR cluster you are creating.
  ///
  /// Parameter [customAmiId] :
  /// Available only in Amazon EMR version 5.7.0 and later. The ID of a custom
  /// Amazon EBS-backed Linux AMI. If specified, Amazon EMR uses this AMI when
  /// it launches cluster EC2 instances. For more information about custom AMIs
  /// in Amazon EMR, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html">Using
  /// a Custom AMI</a> in the <i>Amazon EMR Management Guide</i>. If omitted,
  /// the cluster uses the base Linux AMI for the <code>ReleaseLabel</code>
  /// specified. For Amazon EMR versions 2.x and 3.x, use
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
  /// Parameter [ebsRootVolumeSize] :
  /// The size, in GiB, of the Amazon EBS root device volume of the Linux AMI
  /// that is used for each EC2 instance. Available in Amazon EMR version 4.x
  /// and later.
  ///
  /// Parameter [jobFlowRole] :
  /// Also called instance profile and EC2 role. An IAM role for an EMR cluster.
  /// The EC2 instances of the cluster assume this role. The default role is
  /// <code>EMR_EC2_DefaultRole</code>. In order to use the default role, you
  /// must have already created it using the CLI or console.
  ///
  /// Parameter [kerberosAttributes] :
  /// Attributes for Kerberos configuration when Kerberos authentication is
  /// enabled using a security configuration. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
  /// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
  ///
  /// Parameter [logEncryptionKmsKeyId] :
  /// The AWS KMS customer master key (CMK) used for encrypting log files. If a
  /// value is not provided, the logs remain encrypted by AES-256. This
  /// attribute is only available with Amazon EMR version 5.30.0 and later,
  /// excluding Amazon EMR 6.0.0.
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
  /// flow that accepts a user argument list. EMR accepts and forwards the
  /// argument list to the corresponding installation script as bootstrap action
  /// arguments. For more information, see "Launch a Job Flow on the MapR
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
  /// "hunk" - launch the cluster with the Hunk Big Data Analtics Platform.
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
  /// in Amazon EMR version 4.1.0 and later, and is the default for versions of
  /// Amazon EMR earlier than 5.1.0.
  ///
  /// Parameter [securityConfiguration] :
  /// The name of a security configuration to apply to the cluster.
  ///
  /// Parameter [serviceRole] :
  /// The IAM role that will be assumed by the Amazon EMR service to access AWS
  /// resources on your behalf.
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
  /// A value of <code>true</code> indicates that all IAM users in the AWS
  /// account can perform cluster actions if they have the proper IAM policy
  /// permissions. This is the default. A value of <code>false</code> indicates
  /// that only the IAM user who created the cluster can perform actions.
  Future<RunJobFlowOutput> runJobFlow({
    @_s.required JobFlowInstancesConfig instances,
    @_s.required String name,
    String additionalInfo,
    String amiVersion,
    List<Application> applications,
    String autoScalingRole,
    List<BootstrapActionConfig> bootstrapActions,
    List<Configuration> configurations,
    String customAmiId,
    int ebsRootVolumeSize,
    String jobFlowRole,
    KerberosAttributes kerberosAttributes,
    String logEncryptionKmsKeyId,
    String logUri,
    ManagedScalingPolicy managedScalingPolicy,
    List<SupportedProductConfig> newSupportedProducts,
    List<PlacementGroupConfig> placementGroupConfigs,
    String releaseLabel,
    RepoUpgradeOnBoot repoUpgradeOnBoot,
    ScaleDownBehavior scaleDownBehavior,
    String securityConfiguration,
    String serviceRole,
    int stepConcurrencyLevel,
    List<StepConfig> steps,
    List<String> supportedProducts,
    List<Tag> tags,
    bool visibleToAllUsers,
  }) async {
    ArgumentError.checkNotNull(instances, 'instances');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'additionalInfo',
      additionalInfo,
      0,
      10280,
    );
    _s.validateStringPattern(
      'additionalInfo',
      additionalInfo,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'amiVersion',
      amiVersion,
      0,
      256,
    );
    _s.validateStringPattern(
      'amiVersion',
      amiVersion,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'autoScalingRole',
      autoScalingRole,
      0,
      10280,
    );
    _s.validateStringPattern(
      'autoScalingRole',
      autoScalingRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'customAmiId',
      customAmiId,
      0,
      256,
    );
    _s.validateStringPattern(
      'customAmiId',
      customAmiId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'jobFlowRole',
      jobFlowRole,
      0,
      10280,
    );
    _s.validateStringPattern(
      'jobFlowRole',
      jobFlowRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'logEncryptionKmsKeyId',
      logEncryptionKmsKeyId,
      0,
      10280,
    );
    _s.validateStringPattern(
      'logEncryptionKmsKeyId',
      logEncryptionKmsKeyId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'logUri',
      logUri,
      0,
      10280,
    );
    _s.validateStringPattern(
      'logUri',
      logUri,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'releaseLabel',
      releaseLabel,
      0,
      256,
    );
    _s.validateStringPattern(
      'releaseLabel',
      releaseLabel,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'securityConfiguration',
      securityConfiguration,
      0,
      10280,
    );
    _s.validateStringPattern(
      'securityConfiguration',
      securityConfiguration,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'serviceRole',
      serviceRole,
      0,
      10280,
    );
    _s.validateStringPattern(
      'serviceRole',
      serviceRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        if (bootstrapActions != null) 'BootstrapActions': bootstrapActions,
        if (configurations != null) 'Configurations': configurations,
        if (customAmiId != null) 'CustomAmiId': customAmiId,
        if (ebsRootVolumeSize != null) 'EbsRootVolumeSize': ebsRootVolumeSize,
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

  /// SetTerminationProtection locks a cluster (job flow) so the EC2 instances
  /// in the cluster cannot be terminated by user intervention, an API call, or
  /// in the event of a job-flow error. The cluster still terminates upon
  /// successful completion of the job flow. Calling
  /// <code>SetTerminationProtection</code> on a cluster is similar to calling
  /// the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances
  /// in a cluster.
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
  /// For more information, see<a
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
    @_s.required List<String> jobFlowIds,
    @_s.required bool terminationProtected,
  }) async {
    ArgumentError.checkNotNull(jobFlowIds, 'jobFlowIds');
    ArgumentError.checkNotNull(terminationProtected, 'terminationProtected');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetTerminationProtection'
    };
    final jsonResponse = await _protocol.send(
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

  /// Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether
  /// the cluster is visible to all IAM users of the AWS account associated with
  /// the cluster. Only the IAM user who created the cluster or the AWS account
  /// root user can call this action. The default value, <code>true</code>,
  /// indicates that all IAM users in the AWS account can perform cluster
  /// actions if they have the proper IAM policy permissions. If set to
  /// <code>false</code>, only the IAM user that created the cluster can perform
  /// actions. This action works on running clusters. You can override the
  /// default <code>true</code> setting when you create a cluster by using the
  /// <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [jobFlowIds] :
  /// The unique identifier of the job flow (cluster).
  ///
  /// Parameter [visibleToAllUsers] :
  /// A value of <code>true</code> indicates that all IAM users in the AWS
  /// account can perform cluster actions if they have the proper IAM policy
  /// permissions. This is the default. A value of <code>false</code> indicates
  /// that only the IAM user who created the cluster can perform actions.
  Future<void> setVisibleToAllUsers({
    @_s.required List<String> jobFlowIds,
    @_s.required bool visibleToAllUsers,
  }) async {
    ArgumentError.checkNotNull(jobFlowIds, 'jobFlowIds');
    ArgumentError.checkNotNull(visibleToAllUsers, 'visibleToAllUsers');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.SetVisibleToAllUsers'
    };
    final jsonResponse = await _protocol.send(
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
  /// Parameter [editorId] :
  /// The unique identifier of the EMR Notebook to use for notebook execution.
  ///
  /// Parameter [executionEngine] :
  /// Specifies the execution engine (cluster) that runs the notebook execution.
  ///
  /// Parameter [relativePath] :
  /// The path and file name of the notebook file for this execution, relative
  /// to the path specified for the EMR Notebook. For example, if you specify a
  /// path of <code>s3://MyBucket/MyNotebooks</code> when you create an EMR
  /// Notebook for a notebook with an ID of
  /// <code>e-ABCDEFGHIJK1234567890ABCD</code> (the <code>EditorID</code> of
  /// this request), and you specify a <code>RelativePath</code> of
  /// <code>my_notebook_executions/notebook_execution.ipynb</code>, the location
  /// of the file for the notebook execution is
  /// <code>s3://MyBucket/MyNotebooks/e-ABCDEFGHIJK1234567890ABCD/my_notebook_executions/notebook_execution.ipynb</code>.
  ///
  /// Parameter [serviceRole] :
  /// The name or ARN of the IAM role that is used as the service role for
  /// Amazon EMR (the EMR role) for the notebook execution.
  ///
  /// Parameter [notebookExecutionName] :
  /// An optional name for the notebook execution.
  ///
  /// Parameter [notebookInstanceSecurityGroupId] :
  /// The unique identifier of the Amazon EC2 security group to associate with
  /// the EMR Notebook for this notebook execution.
  ///
  /// Parameter [notebookParams] :
  /// Input parameters in JSON format passed to the EMR Notebook at runtime for
  /// execution.
  ///
  /// Parameter [tags] :
  /// A list of tags associated with a notebook execution. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of
  /// 128 characters and an optional value string with a maximum of 256
  /// characters.
  Future<StartNotebookExecutionOutput> startNotebookExecution({
    @_s.required String editorId,
    @_s.required ExecutionEngineConfig executionEngine,
    @_s.required String relativePath,
    @_s.required String serviceRole,
    String notebookExecutionName,
    String notebookInstanceSecurityGroupId,
    String notebookParams,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(editorId, 'editorId');
    _s.validateStringLength(
      'editorId',
      editorId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'editorId',
      editorId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionEngine, 'executionEngine');
    ArgumentError.checkNotNull(relativePath, 'relativePath');
    _s.validateStringLength(
      'relativePath',
      relativePath,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'relativePath',
      relativePath,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceRole, 'serviceRole');
    _s.validateStringLength(
      'serviceRole',
      serviceRole,
      0,
      10280,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceRole',
      serviceRole,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'notebookExecutionName',
      notebookExecutionName,
      0,
      256,
    );
    _s.validateStringPattern(
      'notebookExecutionName',
      notebookExecutionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'notebookInstanceSecurityGroupId',
      notebookInstanceSecurityGroupId,
      0,
      256,
    );
    _s.validateStringPattern(
      'notebookInstanceSecurityGroupId',
      notebookInstanceSecurityGroupId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'notebookParams',
      notebookParams,
      0,
      10280,
    );
    _s.validateStringPattern(
      'notebookParams',
      notebookParams,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'EditorId': editorId,
        'ExecutionEngine': executionEngine,
        'RelativePath': relativePath,
        'ServiceRole': serviceRole,
        if (notebookExecutionName != null)
          'NotebookExecutionName': notebookExecutionName,
        if (notebookInstanceSecurityGroupId != null)
          'NotebookInstanceSecurityGroupId': notebookInstanceSecurityGroupId,
        if (notebookParams != null) 'NotebookParams': notebookParams,
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
    @_s.required String notebookExecutionId,
  }) async {
    ArgumentError.checkNotNull(notebookExecutionId, 'notebookExecutionId');
    _s.validateStringLength(
      'notebookExecutionId',
      notebookExecutionId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'notebookExecutionId',
      notebookExecutionId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.StopNotebookExecution'
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
  }

  /// TerminateJobFlows shuts a list of clusters (job flows) down. When a job
  /// flow is shut down, any step not yet completed is canceled and the EC2
  /// instances on which the cluster is running are stopped. Any log files not
  /// already saved are uploaded to Amazon S3 if a LogUri was specified when the
  /// cluster was created.
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
    @_s.required List<String> jobFlowIds,
  }) async {
    ArgumentError.checkNotNull(jobFlowIds, 'jobFlowIds');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.TerminateJobFlows'
    };
    final jsonResponse = await _protocol.send(
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

  /// <note>
  /// The Amazon EMR Studio APIs are in preview release for Amazon EMR and are
  /// subject to change.
  /// </note>
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
  /// The ID of the EMR Studio.
  ///
  /// Parameter [identityId] :
  /// The globally unique identifier (GUID) of the user or group. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserId</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-GroupId">GroupId</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  ///
  /// Parameter [identityName] :
  /// The name of the user or group to update. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>. Either
  /// <code>IdentityName</code> or <code>IdentityId</code> must be specified.
  Future<void> updateStudioSessionMapping({
    @_s.required IdentityType identityType,
    @_s.required String sessionPolicyArn,
    @_s.required String studioId,
    String identityId,
    String identityName,
  }) async {
    ArgumentError.checkNotNull(identityType, 'identityType');
    ArgumentError.checkNotNull(sessionPolicyArn, 'sessionPolicyArn');
    _s.validateStringLength(
      'sessionPolicyArn',
      sessionPolicyArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sessionPolicyArn',
      sessionPolicyArn,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(studioId, 'studioId');
    _s.validateStringLength(
      'studioId',
      studioId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'studioId',
      studioId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'identityName',
      identityName,
      0,
      256,
    );
    _s.validateStringPattern(
      'identityName',
      identityName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ElasticMapReduce.UpdateStudioSessionMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdentityType': identityType?.toValue() ?? '',
        'SessionPolicyArn': sessionPolicyArn,
        'StudioId': studioId,
        if (identityId != null) 'IdentityId': identityId,
        if (identityName != null) 'IdentityName': identityName,
      },
    );
  }
}

enum ActionOnFailure {
  @_s.JsonValue('TERMINATE_JOB_FLOW')
  terminateJobFlow,
  @_s.JsonValue('TERMINATE_CLUSTER')
  terminateCluster,
  @_s.JsonValue('CANCEL_AND_WAIT')
  cancelAndWait,
  @_s.JsonValue('CONTINUE')
  $continue,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddInstanceFleetOutput {
  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// The unique identifier of the cluster.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The unique identifier of the instance fleet.
  @_s.JsonKey(name: 'InstanceFleetId')
  final String instanceFleetId;

  AddInstanceFleetOutput({
    this.clusterArn,
    this.clusterId,
    this.instanceFleetId,
  });
  factory AddInstanceFleetOutput.fromJson(Map<String, dynamic> json) =>
      _$AddInstanceFleetOutputFromJson(json);
}

/// Output from an AddInstanceGroups call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddInstanceGroupsOutput {
  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// Instance group IDs of the newly created instance groups.
  @_s.JsonKey(name: 'InstanceGroupIds')
  final List<String> instanceGroupIds;

  /// The job flow ID in which the instance groups are added.
  @_s.JsonKey(name: 'JobFlowId')
  final String jobFlowId;

  AddInstanceGroupsOutput({
    this.clusterArn,
    this.instanceGroupIds,
    this.jobFlowId,
  });
  factory AddInstanceGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddInstanceGroupsOutputFromJson(json);
}

/// The output for the <a>AddJobFlowSteps</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddJobFlowStepsOutput {
  /// The identifiers of the list of steps added to the job flow.
  @_s.JsonKey(name: 'StepIds')
  final List<String> stepIds;

  AddJobFlowStepsOutput({
    this.stepIds,
  });
  factory AddJobFlowStepsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddJobFlowStepsOutputFromJson(json);
}

/// This output indicates the result of adding tags to a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsOutput {
  AddTagsOutput();
  factory AddTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddTagsOutputFromJson(json);
}

enum AdjustmentType {
  @_s.JsonValue('CHANGE_IN_CAPACITY')
  changeInCapacity,
  @_s.JsonValue('PERCENT_CHANGE_IN_CAPACITY')
  percentChangeInCapacity,
  @_s.JsonValue('EXACT_CAPACITY')
  exactCapacity,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Application {
  /// This option is for advanced users only. This is meta information about
  /// third-party applications that third-party vendors use for testing purposes.
  @_s.JsonKey(name: 'AdditionalInfo')
  final Map<String, String> additionalInfo;

  /// Arguments for Amazon EMR to pass to the application.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  /// The name of the application.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The version of the application.
  @_s.JsonKey(name: 'Version')
  final String version;

  Application({
    this.additionalInfo,
    this.args,
    this.name,
    this.version,
  });
  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}

enum AuthMode {
  @_s.JsonValue('SSO')
  sso,
  @_s.JsonValue('IAM')
  iam,
}

extension on AuthMode {
  String toValue() {
    switch (this) {
      case AuthMode.sso:
        return 'SSO';
      case AuthMode.iam:
        return 'IAM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. An automatic scaling policy defines how an
/// instance group dynamically adds and terminates EC2 instances in response to
/// the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutoScalingPolicy {
  /// The upper and lower EC2 instance limits for an automatic scaling policy.
  /// Automatic scaling activity will not cause an instance group to grow above or
  /// below these limits.
  @_s.JsonKey(name: 'Constraints')
  final ScalingConstraints constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling policy.
  @_s.JsonKey(name: 'Rules')
  final List<ScalingRule> rules;

  AutoScalingPolicy({
    @_s.required this.constraints,
    @_s.required this.rules,
  });
  Map<String, dynamic> toJson() => _$AutoScalingPolicyToJson(this);
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. The automatic scaling policy defines how an
/// instance group dynamically adds and terminates EC2 instances in response to
/// the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingPolicyDescription {
  /// The upper and lower EC2 instance limits for an automatic scaling policy.
  /// Automatic scaling activity will not cause an instance group to grow above or
  /// below these limits.
  @_s.JsonKey(name: 'Constraints')
  final ScalingConstraints constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling policy.
  @_s.JsonKey(name: 'Rules')
  final List<ScalingRule> rules;

  /// The status of an automatic scaling policy.
  @_s.JsonKey(name: 'Status')
  final AutoScalingPolicyStatus status;

  AutoScalingPolicyDescription({
    this.constraints,
    this.rules,
    this.status,
  });
  factory AutoScalingPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingPolicyDescriptionFromJson(json);
}

enum AutoScalingPolicyState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ATTACHING')
  attaching,
  @_s.JsonValue('ATTACHED')
  attached,
  @_s.JsonValue('DETACHING')
  detaching,
  @_s.JsonValue('DETACHED')
  detached,
  @_s.JsonValue('FAILED')
  failed,
}

/// The reason for an <a>AutoScalingPolicyStatus</a> change.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingPolicyStateChangeReason {
  /// The code indicating the reason for the change in
  /// status.<code>USER_REQUEST</code> indicates that the scaling policy status
  /// was changed by a user. <code>PROVISION_FAILURE</code> indicates that the
  /// status change was because the policy failed to provision.
  /// <code>CLEANUP_FAILURE</code> indicates an error.
  @_s.JsonKey(name: 'Code')
  final AutoScalingPolicyStateChangeReasonCode code;

  /// A friendly, more verbose message that accompanies an automatic scaling
  /// policy state change.
  @_s.JsonKey(name: 'Message')
  final String message;

  AutoScalingPolicyStateChangeReason({
    this.code,
    this.message,
  });
  factory AutoScalingPolicyStateChangeReason.fromJson(
          Map<String, dynamic> json) =>
      _$AutoScalingPolicyStateChangeReasonFromJson(json);
}

enum AutoScalingPolicyStateChangeReasonCode {
  @_s.JsonValue('USER_REQUEST')
  userRequest,
  @_s.JsonValue('PROVISION_FAILURE')
  provisionFailure,
  @_s.JsonValue('CLEANUP_FAILURE')
  cleanupFailure,
}

/// The status of an automatic scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingPolicyStatus {
  /// Indicates the status of the automatic scaling policy.
  @_s.JsonKey(name: 'State')
  final AutoScalingPolicyState state;

  /// The reason for a change in status.
  @_s.JsonKey(name: 'StateChangeReason')
  final AutoScalingPolicyStateChangeReason stateChangeReason;

  AutoScalingPolicyStatus({
    this.state,
    this.stateChangeReason,
  });
  factory AutoScalingPolicyStatus.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingPolicyStatusFromJson(json);
}

/// A configuration for Amazon EMR block public access. When
/// <code>BlockPublicSecurityGroupRules</code> is set to <code>true</code>,
/// Amazon EMR prevents cluster creation if one of the cluster's security groups
/// has a rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port,
/// unless the port is specified as an exception using
/// <code>PermittedPublicSecurityGroupRuleRanges</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlockPublicAccessConfiguration {
  /// Indicates whether Amazon EMR block public access is enabled
  /// (<code>true</code>) or disabled (<code>false</code>). By default, the value
  /// is <code>false</code> for accounts that have created EMR clusters before
  /// July 2019. For accounts created after this, the default is
  /// <code>true</code>.
  @_s.JsonKey(name: 'BlockPublicSecurityGroupRules')
  final bool blockPublicSecurityGroupRules;

  /// Specifies ports and port ranges that are permitted to have security group
  /// rules that allow inbound traffic from all public sources. For example, if
  /// Port 23 (Telnet) is specified for
  /// <code>PermittedPublicSecurityGroupRuleRanges</code>, Amazon EMR allows
  /// cluster creation if a security group associated with the cluster has a rule
  /// that allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0
  /// as the source.
  ///
  /// By default, Port 22, which is used for SSH access to the cluster EC2
  /// instances, is in the list of
  /// <code>PermittedPublicSecurityGroupRuleRanges</code>.
  @_s.JsonKey(name: 'PermittedPublicSecurityGroupRuleRanges')
  final List<PortRange> permittedPublicSecurityGroupRuleRanges;

  BlockPublicAccessConfiguration({
    @_s.required this.blockPublicSecurityGroupRules,
    this.permittedPublicSecurityGroupRuleRanges,
  });
  factory BlockPublicAccessConfiguration.fromJson(Map<String, dynamic> json) =>
      _$BlockPublicAccessConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$BlockPublicAccessConfigurationToJson(this);
}

/// Properties that describe the AWS principal that created the
/// <code>BlockPublicAccessConfiguration</code> using the
/// <code>PutBlockPublicAccessConfiguration</code> action as well as the date
/// and time that the configuration was created. Each time a configuration for
/// block public access is updated, Amazon EMR updates this metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BlockPublicAccessConfigurationMetadata {
  /// The Amazon Resource Name that created or last modified the configuration.
  @_s.JsonKey(name: 'CreatedByArn')
  final String createdByArn;

  /// The date and time that the configuration was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  BlockPublicAccessConfigurationMetadata({
    @_s.required this.createdByArn,
    @_s.required this.creationDateTime,
  });
  factory BlockPublicAccessConfigurationMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$BlockPublicAccessConfigurationMetadataFromJson(json);
}

/// Configuration of a bootstrap action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BootstrapActionConfig {
  /// The name of the bootstrap action.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The script run by the bootstrap action.
  @_s.JsonKey(name: 'ScriptBootstrapAction')
  final ScriptBootstrapActionConfig scriptBootstrapAction;

  BootstrapActionConfig({
    @_s.required this.name,
    @_s.required this.scriptBootstrapAction,
  });
  factory BootstrapActionConfig.fromJson(Map<String, dynamic> json) =>
      _$BootstrapActionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BootstrapActionConfigToJson(this);
}

/// Reports the configuration of a bootstrap action in a cluster (job flow).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BootstrapActionDetail {
  /// A description of the bootstrap action.
  @_s.JsonKey(name: 'BootstrapActionConfig')
  final BootstrapActionConfig bootstrapActionConfig;

  BootstrapActionDetail({
    this.bootstrapActionConfig,
  });
  factory BootstrapActionDetail.fromJson(Map<String, dynamic> json) =>
      _$BootstrapActionDetailFromJson(json);
}

/// Specification of the status of a CancelSteps request. Available only in
/// Amazon EMR version 4.8.0 and later, excluding version 5.0.0.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelStepsInfo {
  /// The reason for the failure if the CancelSteps request fails.
  @_s.JsonKey(name: 'Reason')
  final String reason;

  /// The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.
  @_s.JsonKey(name: 'Status')
  final CancelStepsRequestStatus status;

  /// The encrypted StepId of a step.
  @_s.JsonKey(name: 'StepId')
  final String stepId;

  CancelStepsInfo({
    this.reason,
    this.status,
    this.stepId,
  });
  factory CancelStepsInfo.fromJson(Map<String, dynamic> json) =>
      _$CancelStepsInfoFromJson(json);
}

/// The output for the <a>CancelSteps</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelStepsOutput {
  /// A list of <a>CancelStepsInfo</a>, which shows the status of specified cancel
  /// requests for each <code>StepID</code> specified.
  @_s.JsonKey(name: 'CancelStepsInfoList')
  final List<CancelStepsInfo> cancelStepsInfoList;

  CancelStepsOutput({
    this.cancelStepsInfoList,
  });
  factory CancelStepsOutput.fromJson(Map<String, dynamic> json) =>
      _$CancelStepsOutputFromJson(json);
}

enum CancelStepsRequestStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('FAILED')
  failed,
}

/// The definition of a CloudWatch metric alarm, which determines when an
/// automatic scaling activity is triggered. When the defined alarm conditions
/// are satisfied, scaling activity begins.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchAlarmDefinition {
  /// Determines how the metric specified by <code>MetricName</code> is compared
  /// to the value specified by <code>Threshold</code>.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// The name of the CloudWatch metric that is watched to determine an alarm
  /// condition.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The period, in seconds, over which the statistic is applied. EMR CloudWatch
  /// metrics are emitted every five minutes (300 seconds), so if an EMR
  /// CloudWatch metric is specified, specify <code>300</code>.
  @_s.JsonKey(name: 'Period')
  final int period;

  /// The value against which the specified statistic is compared.
  @_s.JsonKey(name: 'Threshold')
  final double threshold;

  /// A CloudWatch metric dimension.
  @_s.JsonKey(name: 'Dimensions')
  final List<MetricDimension> dimensions;

  /// The number of periods, in five-minute increments, during which the alarm
  /// condition must exist before the alarm triggers automatic scaling activity.
  /// The default value is <code>1</code>.
  @_s.JsonKey(name: 'EvaluationPeriods')
  final int evaluationPeriods;

  /// The namespace for the CloudWatch metric. The default is
  /// <code>AWS/ElasticMapReduce</code>.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The statistic to apply to the metric associated with the alarm. The default
  /// is <code>AVERAGE</code>.
  @_s.JsonKey(name: 'Statistic')
  final Statistic statistic;

  /// The unit of measure associated with the CloudWatch metric being watched. The
  /// value specified for <code>Unit</code> must correspond to the units specified
  /// in the CloudWatch metric.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  CloudWatchAlarmDefinition({
    @_s.required this.comparisonOperator,
    @_s.required this.metricName,
    @_s.required this.period,
    @_s.required this.threshold,
    this.dimensions,
    this.evaluationPeriods,
    this.namespace,
    this.statistic,
    this.unit,
  });
  factory CloudWatchAlarmDefinition.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchAlarmDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchAlarmDefinitionToJson(this);
}

/// The detailed description of the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cluster {
  /// The applications installed on this cluster.
  @_s.JsonKey(name: 'Applications')
  final List<Application> applications;

  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions
  /// that the automatic scaling feature requires to launch and terminate EC2
  /// instances in an instance group.
  @_s.JsonKey(name: 'AutoScalingRole')
  final String autoScalingRole;

  /// Specifies whether the cluster should terminate after completing all steps.
  @_s.JsonKey(name: 'AutoTerminate')
  final bool autoTerminate;

  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// Applies only to Amazon EMR releases 4.x and later. The list of
  /// Configurations supplied to the EMR cluster.
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// Available only in Amazon EMR version 5.7.0 and later. The ID of a custom
  /// Amazon EBS-backed Linux AMI if the cluster uses a custom AMI.
  @_s.JsonKey(name: 'CustomAmiId')
  final String customAmiId;

  /// The size, in GiB, of the Amazon EBS root device volume of the Linux AMI that
  /// is used for each EC2 instance. Available in Amazon EMR version 4.x and
  /// later.
  @_s.JsonKey(name: 'EbsRootVolumeSize')
  final int ebsRootVolumeSize;

  /// Provides information about the EC2 instances in a cluster grouped by
  /// category. For example, key name, subnet ID, IAM instance profile, and so on.
  @_s.JsonKey(name: 'Ec2InstanceAttributes')
  final Ec2InstanceAttributes ec2InstanceAttributes;

  /// The unique identifier for the cluster.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  /// The instance group configuration of the cluster. A value of
  /// <code>INSTANCE_GROUP</code> indicates a uniform instance group
  /// configuration. A value of <code>INSTANCE_FLEET</code> indicates an instance
  /// fleets configuration.
  @_s.JsonKey(name: 'InstanceCollectionType')
  final InstanceCollectionType instanceCollectionType;

  /// Attributes for Kerberos configuration when Kerberos authentication is
  /// enabled using a security configuration. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
  /// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
  @_s.JsonKey(name: 'KerberosAttributes')
  final KerberosAttributes kerberosAttributes;

  /// The AWS KMS customer master key (CMK) used for encrypting log files. This
  /// attribute is only available with EMR version 5.30.0 and later, excluding EMR
  /// 6.0.0.
  @_s.JsonKey(name: 'LogEncryptionKmsKeyId')
  final String logEncryptionKmsKeyId;

  /// The path to the Amazon S3 location where logs for this cluster are stored.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The DNS name of the master node. If the cluster is on a private subnet, this
  /// is the private DNS name. On a public subnet, this is the public DNS name.
  @_s.JsonKey(name: 'MasterPublicDnsName')
  final String masterPublicDnsName;

  /// The name of the cluster.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is incremented one time for every hour an m1.small instance runs.
  /// Larger instances are weighted more, so an EC2 instance that is roughly four
  /// times more expensive would result in the normalized instance hours being
  /// incremented by four. This result is only an approximation and does not
  /// reflect the actual billing rate.
  @_s.JsonKey(name: 'NormalizedInstanceHours')
  final int normalizedInstanceHours;

  /// The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.
  @_s.JsonKey(name: 'OutpostArn')
  final String outpostArn;

  /// Placement group configured for an Amazon EMR cluster.
  @_s.JsonKey(name: 'PlacementGroups')
  final List<PlacementGroupConfig> placementGroups;

  /// The Amazon EMR release label, which determines the version of open-source
  /// application packages installed on the cluster. Release labels are in the
  /// form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version
  /// such as <code>emr-5.14.0</code>. For more information about Amazon EMR
  /// release versions and included application versions and features, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>.
  /// The release label applies only to Amazon EMR releases version 4.0 and later.
  /// Earlier versions use <code>AmiVersion</code>.
  @_s.JsonKey(name: 'ReleaseLabel')
  final String releaseLabel;

  /// Applies only when <code>CustomAmiID</code> is used. Specifies the type of
  /// updates that are applied from the Amazon Linux AMI package repositories when
  /// an instance boots using the AMI.
  @_s.JsonKey(name: 'RepoUpgradeOnBoot')
  final RepoUpgradeOnBoot repoUpgradeOnBoot;

  /// The AMI version requested for this cluster.
  @_s.JsonKey(name: 'RequestedAmiVersion')
  final String requestedAmiVersion;

  /// The AMI version running on this cluster.
  @_s.JsonKey(name: 'RunningAmiVersion')
  final String runningAmiVersion;

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
  /// version 4.1.0 and later, and is the default for versions of Amazon EMR
  /// earlier than 5.1.0.
  @_s.JsonKey(name: 'ScaleDownBehavior')
  final ScaleDownBehavior scaleDownBehavior;

  /// The name of the security configuration applied to the cluster.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  /// The IAM role that will be assumed by the Amazon EMR service to access AWS
  /// resources on your behalf.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The current status details about the cluster.
  @_s.JsonKey(name: 'Status')
  final ClusterStatus status;

  /// Specifies the number of steps that can be executed concurrently.
  @_s.JsonKey(name: 'StepConcurrencyLevel')
  final int stepConcurrencyLevel;

  /// A list of tags associated with a cluster.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// Indicates whether Amazon EMR will lock the cluster to prevent the EC2
  /// instances from being terminated by an API call or user intervention, or in
  /// the event of a cluster error.
  @_s.JsonKey(name: 'TerminationProtected')
  final bool terminationProtected;

  /// Indicates whether the cluster is visible to all IAM users of the AWS account
  /// associated with the cluster. The default value, <code>true</code>, indicates
  /// that all IAM users in the AWS account can perform cluster actions if they
  /// have the proper IAM policy permissions. If this value is <code>false</code>,
  /// only the IAM user that created the cluster can perform actions. This value
  /// can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a>
  /// action. You can override the default value of <code>true</code> when you
  /// create a cluster by using the <code>VisibleToAllUsers</code> parameter of
  /// the <code>RunJobFlow</code> action.
  @_s.JsonKey(name: 'VisibleToAllUsers')
  final bool visibleToAllUsers;

  Cluster({
    this.applications,
    this.autoScalingRole,
    this.autoTerminate,
    this.clusterArn,
    this.configurations,
    this.customAmiId,
    this.ebsRootVolumeSize,
    this.ec2InstanceAttributes,
    this.id,
    this.instanceCollectionType,
    this.kerberosAttributes,
    this.logEncryptionKmsKeyId,
    this.logUri,
    this.masterPublicDnsName,
    this.name,
    this.normalizedInstanceHours,
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
    this.visibleToAllUsers,
  });
  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);
}

enum ClusterState {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('BOOTSTRAPPING')
  bootstrapping,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('WAITING')
  waiting,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('TERMINATED_WITH_ERRORS')
  terminatedWithErrors,
}

extension on ClusterState {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The reason that the cluster changed to its current state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterStateChangeReason {
  /// The programmatic code for the state change reason.
  @_s.JsonKey(name: 'Code')
  final ClusterStateChangeReasonCode code;

  /// The descriptive message for the state change reason.
  @_s.JsonKey(name: 'Message')
  final String message;

  ClusterStateChangeReason({
    this.code,
    this.message,
  });
  factory ClusterStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$ClusterStateChangeReasonFromJson(json);
}

enum ClusterStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('INSTANCE_FAILURE')
  instanceFailure,
  @_s.JsonValue('INSTANCE_FLEET_TIMEOUT')
  instanceFleetTimeout,
  @_s.JsonValue('BOOTSTRAP_FAILURE')
  bootstrapFailure,
  @_s.JsonValue('USER_REQUEST')
  userRequest,
  @_s.JsonValue('STEP_FAILURE')
  stepFailure,
  @_s.JsonValue('ALL_STEPS_COMPLETED')
  allStepsCompleted,
}

/// The detailed status of the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterStatus {
  /// The current state of the cluster.
  @_s.JsonKey(name: 'State')
  final ClusterState state;

  /// The reason for the cluster status change.
  @_s.JsonKey(name: 'StateChangeReason')
  final ClusterStateChangeReason stateChangeReason;

  /// A timeline that represents the status of a cluster over the lifetime of the
  /// cluster.
  @_s.JsonKey(name: 'Timeline')
  final ClusterTimeline timeline;

  ClusterStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  factory ClusterStatus.fromJson(Map<String, dynamic> json) =>
      _$ClusterStatusFromJson(json);
}

/// The summary description of the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterSummary {
  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// The unique identifier for the cluster.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the cluster.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is incremented one time for every hour an m1.small instance runs.
  /// Larger instances are weighted more, so an EC2 instance that is roughly four
  /// times more expensive would result in the normalized instance hours being
  /// incremented by four. This result is only an approximation and does not
  /// reflect the actual billing rate.
  @_s.JsonKey(name: 'NormalizedInstanceHours')
  final int normalizedInstanceHours;

  /// The Amazon Resource Name (ARN) of the Outpost where the cluster is launched.
  @_s.JsonKey(name: 'OutpostArn')
  final String outpostArn;

  /// The details about the current status of the cluster.
  @_s.JsonKey(name: 'Status')
  final ClusterStatus status;

  ClusterSummary({
    this.clusterArn,
    this.id,
    this.name,
    this.normalizedInstanceHours,
    this.outpostArn,
    this.status,
  });
  factory ClusterSummary.fromJson(Map<String, dynamic> json) =>
      _$ClusterSummaryFromJson(json);
}

/// Represents the timeline of the cluster's lifecycle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterTimeline {
  /// The creation date and time of the cluster.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The date and time when the cluster was terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The date and time when the cluster was ready to run steps.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  ClusterTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });
  factory ClusterTimeline.fromJson(Map<String, dynamic> json) =>
      _$ClusterTimelineFromJson(json);
}

/// An entity describing an executable that runs on a cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Command {
  /// Arguments for Amazon EMR to pass to the command for execution.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  /// The name of the command.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon S3 location of the command script.
  @_s.JsonKey(name: 'ScriptPath')
  final String scriptPath;

  Command({
    this.args,
    this.name,
    this.scriptPath,
  });
  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}

enum ComparisonOperator {
  @_s.JsonValue('GREATER_THAN_OR_EQUAL')
  greaterThanOrEqual,
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('LESS_THAN_OR_EQUAL')
  lessThanOrEqual,
}

/// The EC2 unit limits for a managed scaling policy. The managed scaling
/// activity of a cluster can not be above or below these limits. The limit only
/// applies to the core and task nodes. The master node cannot be scaled after
/// initial configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComputeLimits {
  /// The upper boundary of EC2 units. It is measured through vCPU cores or
  /// instances for instance groups and measured through units for instance
  /// fleets. Managed scaling activities are not allowed beyond this boundary. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  @_s.JsonKey(name: 'MaximumCapacityUnits')
  final int maximumCapacityUnits;

  /// The lower boundary of EC2 units. It is measured through vCPU cores or
  /// instances for instance groups and measured through units for instance
  /// fleets. Managed scaling activities are not allowed beyond this boundary. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  @_s.JsonKey(name: 'MinimumCapacityUnits')
  final int minimumCapacityUnits;

  /// The unit type used for specifying a managed scaling policy.
  @_s.JsonKey(name: 'UnitType')
  final ComputeLimitsUnitType unitType;

  /// The upper boundary of EC2 units for core node type in a cluster. It is
  /// measured through vCPU cores or instances for instance groups and measured
  /// through units for instance fleets. The core units are not allowed to scale
  /// beyond this boundary. The parameter is used to split capacity allocation
  /// between core and task nodes.
  @_s.JsonKey(name: 'MaximumCoreCapacityUnits')
  final int maximumCoreCapacityUnits;

  /// The upper boundary of On-Demand EC2 units. It is measured through vCPU cores
  /// or instances for instance groups and measured through units for instance
  /// fleets. The On-Demand units are not allowed to scale beyond this boundary.
  /// The parameter is used to split capacity allocation between On-Demand and
  /// Spot Instances.
  @_s.JsonKey(name: 'MaximumOnDemandCapacityUnits')
  final int maximumOnDemandCapacityUnits;

  ComputeLimits({
    @_s.required this.maximumCapacityUnits,
    @_s.required this.minimumCapacityUnits,
    @_s.required this.unitType,
    this.maximumCoreCapacityUnits,
    this.maximumOnDemandCapacityUnits,
  });
  factory ComputeLimits.fromJson(Map<String, dynamic> json) =>
      _$ComputeLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$ComputeLimitsToJson(this);
}

enum ComputeLimitsUnitType {
  @_s.JsonValue('InstanceFleetUnits')
  instanceFleetUnits,
  @_s.JsonValue('Instances')
  instances,
  @_s.JsonValue('VCPU')
  vcpu,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Configuration {
  /// The classification within a configuration.
  @_s.JsonKey(name: 'Classification')
  final String classification;

  /// A list of additional configurations to apply within a configuration object.
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// A set of properties specified within a configuration classification.
  @_s.JsonKey(name: 'Properties')
  final Map<String, String> properties;

  Configuration({
    this.classification,
    this.configurations,
    this.properties,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSecurityConfigurationOutput {
  /// The date and time the security configuration was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The name of the security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateSecurityConfigurationOutput({
    @_s.required this.creationDateTime,
    @_s.required this.name,
  });
  factory CreateSecurityConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSecurityConfigurationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStudioOutput {
  /// The ID of the Amazon EMR Studio.
  @_s.JsonKey(name: 'StudioId')
  final String studioId;

  /// The unique Studio access URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  CreateStudioOutput({
    this.studioId,
    this.url,
  });
  factory CreateStudioOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateStudioOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSecurityConfigurationOutput {
  DeleteSecurityConfigurationOutput();
  factory DeleteSecurityConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSecurityConfigurationOutputFromJson(json);
}

/// This output contains the description of the cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClusterOutput {
  /// This output contains the details for the requested cluster.
  @_s.JsonKey(name: 'Cluster')
  final Cluster cluster;

  DescribeClusterOutput({
    this.cluster,
  });
  factory DescribeClusterOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeClusterOutputFromJson(json);
}

/// The output for the <a>DescribeJobFlows</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobFlowsOutput {
  /// A list of job flows matching the parameters supplied.
  @_s.JsonKey(name: 'JobFlows')
  final List<JobFlowDetail> jobFlows;

  DescribeJobFlowsOutput({
    this.jobFlows,
  });
  factory DescribeJobFlowsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobFlowsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotebookExecutionOutput {
  /// Properties of the notebook execution.
  @_s.JsonKey(name: 'NotebookExecution')
  final NotebookExecution notebookExecution;

  DescribeNotebookExecutionOutput({
    this.notebookExecution,
  });
  factory DescribeNotebookExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeNotebookExecutionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSecurityConfigurationOutput {
  /// The date and time the security configuration was created
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The name of the security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The security configuration details in JSON format.
  @_s.JsonKey(name: 'SecurityConfiguration')
  final String securityConfiguration;

  DescribeSecurityConfigurationOutput({
    this.creationDateTime,
    this.name,
    this.securityConfiguration,
  });
  factory DescribeSecurityConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSecurityConfigurationOutputFromJson(json);
}

/// This output contains the description of the cluster step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStepOutput {
  /// The step details for the requested step identifier.
  @_s.JsonKey(name: 'Step')
  final Step step;

  DescribeStepOutput({
    this.step,
  });
  factory DescribeStepOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeStepOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStudioOutput {
  /// The Amazon EMR Studio details.
  @_s.JsonKey(name: 'Studio')
  final Studio studio;

  DescribeStudioOutput({
    this.studio,
  });
  factory DescribeStudioOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeStudioOutputFromJson(json);
}

/// Configuration of requested EBS block device associated with the instance
/// group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EbsBlockDevice {
  /// The device name that is exposed to the instance, such as /dev/sdh.
  @_s.JsonKey(name: 'Device')
  final String device;

  /// EBS volume specifications such as volume type, IOPS, and size (GiB) that
  /// will be requested for the EBS volume attached to an EC2 instance in the
  /// cluster.
  @_s.JsonKey(name: 'VolumeSpecification')
  final VolumeSpecification volumeSpecification;

  EbsBlockDevice({
    this.device,
    this.volumeSpecification,
  });
  factory EbsBlockDevice.fromJson(Map<String, dynamic> json) =>
      _$EbsBlockDeviceFromJson(json);
}

/// Configuration of requested EBS block device associated with the instance
/// group with count of volumes that will be associated to every instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EbsBlockDeviceConfig {
  /// EBS volume specifications such as volume type, IOPS, and size (GiB) that
  /// will be requested for the EBS volume attached to an EC2 instance in the
  /// cluster.
  @_s.JsonKey(name: 'VolumeSpecification')
  final VolumeSpecification volumeSpecification;

  /// Number of EBS volumes with a specific volume configuration that will be
  /// associated with every instance in the instance group
  @_s.JsonKey(name: 'VolumesPerInstance')
  final int volumesPerInstance;

  EbsBlockDeviceConfig({
    @_s.required this.volumeSpecification,
    this.volumesPerInstance,
  });
  Map<String, dynamic> toJson() => _$EbsBlockDeviceConfigToJson(this);
}

/// The Amazon EBS configuration of a cluster instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EbsConfiguration {
  /// An array of Amazon EBS volume specifications attached to a cluster instance.
  @_s.JsonKey(name: 'EbsBlockDeviceConfigs')
  final List<EbsBlockDeviceConfig> ebsBlockDeviceConfigs;

  /// Indicates whether an Amazon EBS volume is EBS-optimized.
  @_s.JsonKey(name: 'EbsOptimized')
  final bool ebsOptimized;

  EbsConfiguration({
    this.ebsBlockDeviceConfigs,
    this.ebsOptimized,
  });
  Map<String, dynamic> toJson() => _$EbsConfigurationToJson(this);
}

/// EBS block device that's attached to an EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EbsVolume {
  /// The device name that is exposed to the instance, such as /dev/sdh.
  @_s.JsonKey(name: 'Device')
  final String device;

  /// The volume identifier of the EBS volume.
  @_s.JsonKey(name: 'VolumeId')
  final String volumeId;

  EbsVolume({
    this.device,
    this.volumeId,
  });
  factory EbsVolume.fromJson(Map<String, dynamic> json) =>
      _$EbsVolumeFromJson(json);
}

/// Provides information about the EC2 instances in a cluster grouped by
/// category. For example, key name, subnet ID, IAM instance profile, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Ec2InstanceAttributes {
  /// A list of additional Amazon EC2 security group IDs for the master node.
  @_s.JsonKey(name: 'AdditionalMasterSecurityGroups')
  final List<String> additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  @_s.JsonKey(name: 'AdditionalSlaveSecurityGroups')
  final List<String> additionalSlaveSecurityGroups;

  /// The Availability Zone in which the cluster will run.
  @_s.JsonKey(name: 'Ec2AvailabilityZone')
  final String ec2AvailabilityZone;

  /// The name of the Amazon EC2 key pair to use when connecting with SSH into the
  /// master node as a user named "hadoop".
  @_s.JsonKey(name: 'Ec2KeyName')
  final String ec2KeyName;

  /// Set this parameter to the identifier of the Amazon VPC subnet where you want
  /// the cluster to launch. If you do not specify this value, and your account
  /// supports EC2-Classic, the cluster launches in EC2-Classic.
  @_s.JsonKey(name: 'Ec2SubnetId')
  final String ec2SubnetId;

  /// The identifier of the Amazon EC2 security group for the master node.
  @_s.JsonKey(name: 'EmrManagedMasterSecurityGroup')
  final String emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task nodes.
  @_s.JsonKey(name: 'EmrManagedSlaveSecurityGroup')
  final String emrManagedSlaveSecurityGroup;

  /// The IAM role that was specified when the cluster was launched. The EC2
  /// instances of the cluster assume this role.
  @_s.JsonKey(name: 'IamInstanceProfile')
  final String iamInstanceProfile;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// one or more Availability Zones in which to launch EC2 cluster instances when
  /// the EC2-Classic network configuration is supported. Amazon EMR chooses the
  /// Availability Zone with the best fit from among the list of
  /// <code>RequestedEc2AvailabilityZones</code>, and then launches all cluster
  /// instances within that Availability Zone. If you do not specify this value,
  /// Amazon EMR chooses the Availability Zone for you.
  /// <code>RequestedEc2SubnetIDs</code> and
  /// <code>RequestedEc2AvailabilityZones</code> cannot be specified together.
  @_s.JsonKey(name: 'RequestedEc2AvailabilityZones')
  final List<String> requestedEc2AvailabilityZones;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// the unique identifier of one or more Amazon EC2 subnets in which to launch
  /// EC2 cluster instances. Subnets must exist within the same VPC. Amazon EMR
  /// chooses the EC2 subnet with the best fit from among the list of
  /// <code>RequestedEc2SubnetIds</code>, and then launches all cluster instances
  /// within that Subnet. If this value is not specified, and the account and
  /// Region support EC2-Classic networks, the cluster launches instances in the
  /// EC2-Classic network and uses <code>RequestedEc2AvailabilityZones</code>
  /// instead of this setting. If EC2-Classic is not supported, and no Subnet is
  /// specified, Amazon EMR chooses the subnet for you.
  /// <code>RequestedEc2SubnetIDs</code> and
  /// <code>RequestedEc2AvailabilityZones</code> cannot be specified together.
  @_s.JsonKey(name: 'RequestedEc2SubnetIds')
  final List<String> requestedEc2SubnetIds;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  @_s.JsonKey(name: 'ServiceAccessSecurityGroup')
  final String serviceAccessSecurityGroup;

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
  factory Ec2InstanceAttributes.fromJson(Map<String, dynamic> json) =>
      _$Ec2InstanceAttributesFromJson(json);
}

/// Specifies the execution engine (cluster) to run the notebook and perform the
/// notebook execution, for example, an EMR cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExecutionEngineConfig {
  /// The unique identifier of the execution engine. For an EMR cluster, this is
  /// the cluster ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// An optional unique ID of an EC2 security group to associate with the master
  /// instance of the EMR cluster for this notebook execution. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html">Specifying
  /// EC2 Security Groups for EMR Notebooks</a> in the <i>EMR Management
  /// Guide</i>.
  @_s.JsonKey(name: 'MasterInstanceSecurityGroupId')
  final String masterInstanceSecurityGroupId;

  /// The type of execution engine. A value of <code>EMR</code> specifies an EMR
  /// cluster.
  @_s.JsonKey(name: 'Type')
  final ExecutionEngineType type;

  ExecutionEngineConfig({
    @_s.required this.id,
    this.masterInstanceSecurityGroupId,
    this.type,
  });
  factory ExecutionEngineConfig.fromJson(Map<String, dynamic> json) =>
      _$ExecutionEngineConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ExecutionEngineConfigToJson(this);
}

enum ExecutionEngineType {
  @_s.JsonValue('EMR')
  emr,
}

/// The details of the step failure. The service attempts to detect the root
/// cause for many common failures.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureDetails {
  /// The path to the log file where the step failure root cause was originally
  /// recorded.
  @_s.JsonKey(name: 'LogFile')
  final String logFile;

  /// The descriptive message including the error the Amazon EMR service has
  /// identified as the cause of step failure. This is text from an error log that
  /// describes the root cause of the failure.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The reason for the step failure. In the case where the service cannot
  /// successfully determine the root cause of the failure, it returns "Unknown
  /// Error" as a reason.
  @_s.JsonKey(name: 'Reason')
  final String reason;

  FailureDetails({
    this.logFile,
    this.message,
    this.reason,
  });
  factory FailureDetails.fromJson(Map<String, dynamic> json) =>
      _$FailureDetailsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  /// not create an EMR cluster in a Region before this date, block public access
  /// is enabled by default in that Region.
  /// </note>
  @_s.JsonKey(name: 'BlockPublicAccessConfiguration')
  final BlockPublicAccessConfiguration blockPublicAccessConfiguration;

  /// Properties that describe the AWS principal that created the
  /// <code>BlockPublicAccessConfiguration</code> using the
  /// <code>PutBlockPublicAccessConfiguration</code> action as well as the date
  /// and time that the configuration was created. Each time a configuration for
  /// block public access is updated, Amazon EMR updates this metadata.
  @_s.JsonKey(name: 'BlockPublicAccessConfigurationMetadata')
  final BlockPublicAccessConfigurationMetadata
      blockPublicAccessConfigurationMetadata;

  GetBlockPublicAccessConfigurationOutput({
    @_s.required this.blockPublicAccessConfiguration,
    @_s.required this.blockPublicAccessConfigurationMetadata,
  });
  factory GetBlockPublicAccessConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetBlockPublicAccessConfigurationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetManagedScalingPolicyOutput {
  /// Specifies the managed scaling policy that is attached to an Amazon EMR
  /// cluster.
  @_s.JsonKey(name: 'ManagedScalingPolicy')
  final ManagedScalingPolicy managedScalingPolicy;

  GetManagedScalingPolicyOutput({
    this.managedScalingPolicy,
  });
  factory GetManagedScalingPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$GetManagedScalingPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStudioSessionMappingOutput {
  /// The session mapping details for the specified Amazon EMR Studio and
  /// identity, including session policy ARN and creation time.
  @_s.JsonKey(name: 'SessionMapping')
  final SessionMappingDetail sessionMapping;

  GetStudioSessionMappingOutput({
    this.sessionMapping,
  });
  factory GetStudioSessionMappingOutput.fromJson(Map<String, dynamic> json) =>
      _$GetStudioSessionMappingOutputFromJson(json);
}

/// A job flow step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HadoopJarStepConfig {
  /// A path to a JAR file run during the step.
  @_s.JsonKey(name: 'Jar')
  final String jar;

  /// A list of command line arguments passed to the JAR file's main function when
  /// executed.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  /// The name of the main class in the specified Java file. If not specified, the
  /// JAR file should specify a Main-Class in its manifest file.
  @_s.JsonKey(name: 'MainClass')
  final String mainClass;

  /// A list of Java properties that are set when the step runs. You can use these
  /// properties to pass key value pairs to your main function.
  @_s.JsonKey(name: 'Properties')
  final List<KeyValue> properties;

  HadoopJarStepConfig({
    @_s.required this.jar,
    this.args,
    this.mainClass,
    this.properties,
  });
  factory HadoopJarStepConfig.fromJson(Map<String, dynamic> json) =>
      _$HadoopJarStepConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HadoopJarStepConfigToJson(this);
}

/// A cluster step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HadoopStepConfig {
  /// The list of command line arguments to pass to the JAR file's main function
  /// for execution.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  /// The path to the JAR file that runs during the step.
  @_s.JsonKey(name: 'Jar')
  final String jar;

  /// The name of the main class in the specified Java file. If not specified, the
  /// JAR file should specify a main class in its manifest file.
  @_s.JsonKey(name: 'MainClass')
  final String mainClass;

  /// The list of Java properties that are set when the step runs. You can use
  /// these properties to pass key-value pairs to your main function.
  @_s.JsonKey(name: 'Properties')
  final Map<String, String> properties;

  HadoopStepConfig({
    this.args,
    this.jar,
    this.mainClass,
    this.properties,
  });
  factory HadoopStepConfig.fromJson(Map<String, dynamic> json) =>
      _$HadoopStepConfigFromJson(json);
}

enum IdentityType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('GROUP')
  group,
}

extension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.user:
        return 'USER';
      case IdentityType.group:
        return 'GROUP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents an EC2 instance provisioned as part of cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// The list of EBS volumes that are attached to this instance.
  @_s.JsonKey(name: 'EbsVolumes')
  final List<EbsVolume> ebsVolumes;

  /// The unique identifier of the instance in Amazon EC2.
  @_s.JsonKey(name: 'Ec2InstanceId')
  final String ec2InstanceId;

  /// The unique identifier for the instance in Amazon EMR.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The unique identifier of the instance fleet to which an EC2 instance
  /// belongs.
  @_s.JsonKey(name: 'InstanceFleetId')
  final String instanceFleetId;

  /// The identifier of the instance group to which this instance belongs.
  @_s.JsonKey(name: 'InstanceGroupId')
  final String instanceGroupId;

  /// The EC2 instance type, for example <code>m3.xlarge</code>.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The instance purchasing option. Valid values are <code>ON_DEMAND</code> or
  /// <code>SPOT</code>.
  @_s.JsonKey(name: 'Market')
  final MarketType market;

  /// The private DNS name of the instance.
  @_s.JsonKey(name: 'PrivateDnsName')
  final String privateDnsName;

  /// The private IP address of the instance.
  @_s.JsonKey(name: 'PrivateIpAddress')
  final String privateIpAddress;

  /// The public DNS name of the instance.
  @_s.JsonKey(name: 'PublicDnsName')
  final String publicDnsName;

  /// The public IP address of the instance.
  @_s.JsonKey(name: 'PublicIpAddress')
  final String publicIpAddress;

  /// The current status of the instance.
  @_s.JsonKey(name: 'Status')
  final InstanceStatus status;

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
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

enum InstanceCollectionType {
  @_s.JsonValue('INSTANCE_FLEET')
  instanceFleet,
  @_s.JsonValue('INSTANCE_GROUP')
  instanceGroup,
}

/// Describes an instance fleet, which is a group of EC2 instances that host a
/// particular node type (master, core, or task) in an Amazon EMR cluster.
/// Instance fleets can consist of a mix of instance types and On-Demand and
/// Spot Instances, which are provisioned to meet a defined target capacity.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceFleet {
  /// The unique identifier of the instance fleet.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The node type that the instance fleet hosts. Valid values are MASTER, CORE,
  /// or TASK.
  @_s.JsonKey(name: 'InstanceFleetType')
  final InstanceFleetType instanceFleetType;

  /// The specification for the instance types that comprise an instance fleet. Up
  /// to five unique instance specifications may be defined for each instance
  /// fleet.
  @_s.JsonKey(name: 'InstanceTypeSpecifications')
  final List<InstanceTypeSpecification> instanceTypeSpecifications;

  /// Describes the launch specification for an instance fleet.
  @_s.JsonKey(name: 'LaunchSpecifications')
  final InstanceFleetProvisioningSpecifications launchSpecifications;

  /// A friendly name for the instance fleet.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of On-Demand units that have been provisioned for the instance
  /// fleet to fulfill <code>TargetOnDemandCapacity</code>. This provisioned
  /// capacity might be less than or greater than
  /// <code>TargetOnDemandCapacity</code>.
  @_s.JsonKey(name: 'ProvisionedOnDemandCapacity')
  final int provisionedOnDemandCapacity;

  /// The number of Spot units that have been provisioned for this instance fleet
  /// to fulfill <code>TargetSpotCapacity</code>. This provisioned capacity might
  /// be less than or greater than <code>TargetSpotCapacity</code>.
  @_s.JsonKey(name: 'ProvisionedSpotCapacity')
  final int provisionedSpotCapacity;

  /// The current status of the instance fleet.
  @_s.JsonKey(name: 'Status')
  final InstanceFleetStatus status;

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
  @_s.JsonKey(name: 'TargetOnDemandCapacity')
  final int targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet, which determines
  /// how many Spot instances to provision. When the instance fleet launches,
  /// Amazon EMR tries to provision Spot instances as specified by
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
  /// If not specified or set to 0, only On-Demand instances are provisioned for
  /// the instance fleet. At least one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> should be greater than 0. For a master
  /// instance fleet, only one of <code>TargetSpotCapacity</code> and
  /// <code>TargetOnDemandCapacity</code> can be specified, and its value must be
  /// 1.
  /// </note>
  @_s.JsonKey(name: 'TargetSpotCapacity')
  final int targetSpotCapacity;

  InstanceFleet({
    this.id,
    this.instanceFleetType,
    this.instanceTypeSpecifications,
    this.launchSpecifications,
    this.name,
    this.provisionedOnDemandCapacity,
    this.provisionedSpotCapacity,
    this.status,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });
  factory InstanceFleet.fromJson(Map<String, dynamic> json) =>
      _$InstanceFleetFromJson(json);
}

/// The configuration that defines an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceFleetConfig {
  /// The node type that the instance fleet hosts. Valid values are
  /// MASTER,CORE,and TASK.
  @_s.JsonKey(name: 'InstanceFleetType')
  final InstanceFleetType instanceFleetType;

  /// The instance type configurations that define the EC2 instances in the
  /// instance fleet.
  @_s.JsonKey(name: 'InstanceTypeConfigs')
  final List<InstanceTypeConfig> instanceTypeConfigs;

  /// The launch specification for the instance fleet.
  @_s.JsonKey(name: 'LaunchSpecifications')
  final InstanceFleetProvisioningSpecifications launchSpecifications;

  /// The friendly name of the instance fleet.
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'TargetOnDemandCapacity')
  final int targetOnDemandCapacity;

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
  @_s.JsonKey(name: 'TargetSpotCapacity')
  final int targetSpotCapacity;

  InstanceFleetConfig({
    @_s.required this.instanceFleetType,
    this.instanceTypeConfigs,
    this.launchSpecifications,
    this.name,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });
  Map<String, dynamic> toJson() => _$InstanceFleetConfigToJson(this);
}

/// Configuration parameters for an instance fleet modification request.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceFleetModifyConfig {
  /// A unique identifier for the instance fleet.
  @_s.JsonKey(name: 'InstanceFleetId')
  final String instanceFleetId;

  /// The target capacity of On-Demand units for the instance fleet. For more
  /// information see <a>InstanceFleetConfig$TargetOnDemandCapacity</a>.
  @_s.JsonKey(name: 'TargetOnDemandCapacity')
  final int targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet. For more
  /// information, see <a>InstanceFleetConfig$TargetSpotCapacity</a>.
  @_s.JsonKey(name: 'TargetSpotCapacity')
  final int targetSpotCapacity;

  InstanceFleetModifyConfig({
    @_s.required this.instanceFleetId,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });
  Map<String, dynamic> toJson() => _$InstanceFleetModifyConfigToJson(this);
}

/// The launch specification for Spot Instances in the fleet, which determines
/// the defined duration, provisioning timeout behavior, and allocation
/// strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand and Spot Instance
/// allocation strategies are available in Amazon EMR version 5.12.1 and later.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceFleetProvisioningSpecifications {
  /// The launch specification for On-Demand Instances in the instance fleet,
  /// which determines the allocation strategy.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
  /// strategy is available in Amazon EMR version 5.12.1 and later.
  /// </note>
  @_s.JsonKey(name: 'OnDemandSpecification')
  final OnDemandProvisioningSpecification onDemandSpecification;

  /// The launch specification for Spot Instances in the fleet, which determines
  /// the defined duration, provisioning timeout behavior, and allocation
  /// strategy.
  @_s.JsonKey(name: 'SpotSpecification')
  final SpotProvisioningSpecification spotSpecification;

  InstanceFleetProvisioningSpecifications({
    this.onDemandSpecification,
    this.spotSpecification,
  });
  factory InstanceFleetProvisioningSpecifications.fromJson(
          Map<String, dynamic> json) =>
      _$InstanceFleetProvisioningSpecificationsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InstanceFleetProvisioningSpecificationsToJson(this);
}

enum InstanceFleetState {
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('BOOTSTRAPPING')
  bootstrapping,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('RESIZING')
  resizing,
  @_s.JsonValue('SUSPENDED')
  suspended,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
}

/// Provides status change reason details for the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceFleetStateChangeReason {
  /// A code corresponding to the reason the state change occurred.
  @_s.JsonKey(name: 'Code')
  final InstanceFleetStateChangeReasonCode code;

  /// An explanatory message.
  @_s.JsonKey(name: 'Message')
  final String message;

  InstanceFleetStateChangeReason({
    this.code,
    this.message,
  });
  factory InstanceFleetStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$InstanceFleetStateChangeReasonFromJson(json);
}

enum InstanceFleetStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('INSTANCE_FAILURE')
  instanceFailure,
  @_s.JsonValue('CLUSTER_TERMINATED')
  clusterTerminated,
}

/// The status of the instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceFleetStatus {
  /// A code representing the instance fleet status.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONING</code>—The instance fleet is provisioning EC2 resources
  /// and is not yet ready to run jobs.
  /// </li>
  /// <li>
  /// <code>BOOTSTRAPPING</code>—EC2 instances and other resources have been
  /// provisioned and the bootstrap actions specified for the instances are
  /// underway.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>—EC2 instances and other resources are running. They are
  /// either executing jobs or waiting to execute jobs.
  /// </li>
  /// <li>
  /// <code>RESIZING</code>—A resize operation is underway. EC2 instances are
  /// either being added or removed.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>—A resize operation could not complete. Existing EC2
  /// instances are running, but instances can't be added or removed.
  /// </li>
  /// <li>
  /// <code>TERMINATING</code>—The instance fleet is terminating EC2 instances.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code>—The instance fleet is no longer active, and all EC2
  /// instances have been terminated.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'State')
  final InstanceFleetState state;

  /// Provides status change reason details for the instance fleet.
  @_s.JsonKey(name: 'StateChangeReason')
  final InstanceFleetStateChangeReason stateChangeReason;

  /// Provides historical timestamps for the instance fleet, including the time of
  /// creation, the time it became ready to run jobs, and the time of termination.
  @_s.JsonKey(name: 'Timeline')
  final InstanceFleetTimeline timeline;

  InstanceFleetStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  factory InstanceFleetStatus.fromJson(Map<String, dynamic> json) =>
      _$InstanceFleetStatusFromJson(json);
}

/// Provides historical timestamps for the instance fleet, including the time of
/// creation, the time it became ready to run jobs, and the time of termination.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceFleetTimeline {
  /// The time and date the instance fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The time and date the instance fleet terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The time and date the instance fleet was ready to run jobs.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  InstanceFleetTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });
  factory InstanceFleetTimeline.fromJson(Map<String, dynamic> json) =>
      _$InstanceFleetTimelineFromJson(json);
}

enum InstanceFleetType {
  @_s.JsonValue('MASTER')
  master,
  @_s.JsonValue('CORE')
  core,
  @_s.JsonValue('TASK')
  task,
}

extension on InstanceFleetType {
  String toValue() {
    switch (this) {
      case InstanceFleetType.master:
        return 'MASTER';
      case InstanceFleetType.core:
        return 'CORE';
      case InstanceFleetType.task:
        return 'TASK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// This entity represents an instance group, which is a group of instances that
/// have common purpose. For example, CORE instance group is used for HDFS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceGroup {
  /// An automatic scaling policy for a core instance group or task instance group
  /// in an Amazon EMR cluster. The automatic scaling policy defines how an
  /// instance group dynamically adds and terminates EC2 instances in response to
  /// the value of a CloudWatch metric. See PutAutoScalingPolicy.
  @_s.JsonKey(name: 'AutoScalingPolicy')
  final AutoScalingPolicyDescription autoScalingPolicy;

  /// The bid price for each EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  @_s.JsonKey(name: 'BidPrice')
  final String bidPrice;

  /// <note>
  /// Amazon EMR releases 4.x or later.
  /// </note>
  /// The list of configurations supplied for an EMR cluster instance group. You
  /// can specify a separate configuration for each instance group (master, core,
  /// and task).
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// The version number of the requested configuration specification for this
  /// instance group.
  @_s.JsonKey(name: 'ConfigurationsVersion')
  final int configurationsVersion;

  /// The EBS block devices that are mapped to this instance group.
  @_s.JsonKey(name: 'EbsBlockDevices')
  final List<EbsBlockDevice> ebsBlockDevices;

  /// If the instance group is EBS-optimized. An Amazon EBS-optimized instance
  /// uses an optimized configuration stack and provides additional, dedicated
  /// capacity for Amazon EBS I/O.
  @_s.JsonKey(name: 'EbsOptimized')
  final bool ebsOptimized;

  /// The identifier of the instance group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of the instance group. Valid values are MASTER, CORE or TASK.
  @_s.JsonKey(name: 'InstanceGroupType')
  final InstanceGroupType instanceGroupType;

  /// The EC2 instance type for all instances in the instance group.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// A list of configurations that were successfully applied for an instance
  /// group last time.
  @_s.JsonKey(name: 'LastSuccessfullyAppliedConfigurations')
  final List<Configuration> lastSuccessfullyAppliedConfigurations;

  /// The version number of a configuration specification that was successfully
  /// applied for an instance group last time.
  @_s.JsonKey(name: 'LastSuccessfullyAppliedConfigurationsVersion')
  final int lastSuccessfullyAppliedConfigurationsVersion;

  /// The marketplace to provision instances for this group. Valid values are
  /// ON_DEMAND or SPOT.
  @_s.JsonKey(name: 'Market')
  final MarketType market;

  /// The name of the instance group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The target number of instances for the instance group.
  @_s.JsonKey(name: 'RequestedInstanceCount')
  final int requestedInstanceCount;

  /// The number of instances currently running in this instance group.
  @_s.JsonKey(name: 'RunningInstanceCount')
  final int runningInstanceCount;

  /// Policy for customizing shrink operations.
  @_s.JsonKey(name: 'ShrinkPolicy')
  final ShrinkPolicy shrinkPolicy;

  /// The current status of the instance group.
  @_s.JsonKey(name: 'Status')
  final InstanceGroupStatus status;

  InstanceGroup({
    this.autoScalingPolicy,
    this.bidPrice,
    this.configurations,
    this.configurationsVersion,
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
  factory InstanceGroup.fromJson(Map<String, dynamic> json) =>
      _$InstanceGroupFromJson(json);
}

/// Configuration defining a new instance group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceGroupConfig {
  /// Target number of instances for the instance group.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The role of the instance group in the cluster.
  @_s.JsonKey(name: 'InstanceRole')
  final InstanceRoleType instanceRole;

  /// The EC2 instance type for all instances in the instance group.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// An automatic scaling policy for a core instance group or task instance group
  /// in an Amazon EMR cluster. The automatic scaling policy defines how an
  /// instance group dynamically adds and terminates EC2 instances in response to
  /// the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.
  @_s.JsonKey(name: 'AutoScalingPolicy')
  final AutoScalingPolicy autoScalingPolicy;

  /// The bid price for each EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  @_s.JsonKey(name: 'BidPrice')
  final String bidPrice;

  /// <note>
  /// Amazon EMR releases 4.x or later.
  /// </note>
  /// The list of configurations supplied for an EMR cluster instance group. You
  /// can specify a separate configuration for each instance group (master, core,
  /// and task).
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// EBS configurations that will be attached to each EC2 instance in the
  /// instance group.
  @_s.JsonKey(name: 'EbsConfiguration')
  final EbsConfiguration ebsConfiguration;

  /// Market type of the EC2 instances used to create a cluster node.
  @_s.JsonKey(name: 'Market')
  final MarketType market;

  /// Friendly name given to the instance group.
  @_s.JsonKey(name: 'Name')
  final String name;

  InstanceGroupConfig({
    @_s.required this.instanceCount,
    @_s.required this.instanceRole,
    @_s.required this.instanceType,
    this.autoScalingPolicy,
    this.bidPrice,
    this.configurations,
    this.ebsConfiguration,
    this.market,
    this.name,
  });
  Map<String, dynamic> toJson() => _$InstanceGroupConfigToJson(this);
}

/// Detailed information about an instance group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceGroupDetail {
  /// The date/time the instance group was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// Target number of instances to run in the instance group.
  @_s.JsonKey(name: 'InstanceRequestCount')
  final int instanceRequestCount;

  /// Instance group role in the cluster
  @_s.JsonKey(name: 'InstanceRole')
  final InstanceRoleType instanceRole;

  /// Actual count of running instances.
  @_s.JsonKey(name: 'InstanceRunningCount')
  final int instanceRunningCount;

  /// EC2 instance type.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// Market type of the EC2 instances used to create a cluster node.
  @_s.JsonKey(name: 'Market')
  final MarketType market;

  /// State of instance group. The following values are deprecated: STARTING,
  /// TERMINATED, and FAILED.
  @_s.JsonKey(name: 'State')
  final InstanceGroupState state;

  /// The bid price for each EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  @_s.JsonKey(name: 'BidPrice')
  final String bidPrice;

  /// The date/time the instance group was terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// Unique identifier for the instance group.
  @_s.JsonKey(name: 'InstanceGroupId')
  final String instanceGroupId;

  /// Details regarding the state of the instance group.
  @_s.JsonKey(name: 'LastStateChangeReason')
  final String lastStateChangeReason;

  /// Friendly name for the instance group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date/time the instance group was available to the cluster.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  /// The date/time the instance group was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDateTime')
  final DateTime startDateTime;

  InstanceGroupDetail({
    @_s.required this.creationDateTime,
    @_s.required this.instanceRequestCount,
    @_s.required this.instanceRole,
    @_s.required this.instanceRunningCount,
    @_s.required this.instanceType,
    @_s.required this.market,
    @_s.required this.state,
    this.bidPrice,
    this.endDateTime,
    this.instanceGroupId,
    this.lastStateChangeReason,
    this.name,
    this.readyDateTime,
    this.startDateTime,
  });
  factory InstanceGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$InstanceGroupDetailFromJson(json);
}

/// Modify the size or configurations of an instance group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceGroupModifyConfig {
  /// Unique ID of the instance group to modify.
  @_s.JsonKey(name: 'InstanceGroupId')
  final String instanceGroupId;

  /// A list of new or modified configurations to apply for an instance group.
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// The EC2 InstanceIds to terminate. After you terminate the instances, the
  /// instance group will not return to its original requested size.
  @_s.JsonKey(name: 'EC2InstanceIdsToTerminate')
  final List<String> eC2InstanceIdsToTerminate;

  /// Target size for the instance group.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// Policy for customizing shrink operations.
  @_s.JsonKey(name: 'ShrinkPolicy')
  final ShrinkPolicy shrinkPolicy;

  InstanceGroupModifyConfig({
    @_s.required this.instanceGroupId,
    this.configurations,
    this.eC2InstanceIdsToTerminate,
    this.instanceCount,
    this.shrinkPolicy,
  });
  Map<String, dynamic> toJson() => _$InstanceGroupModifyConfigToJson(this);
}

enum InstanceGroupState {
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('BOOTSTRAPPING')
  bootstrapping,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('RECONFIGURING')
  reconfiguring,
  @_s.JsonValue('RESIZING')
  resizing,
  @_s.JsonValue('SUSPENDED')
  suspended,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('ARRESTED')
  arrested,
  @_s.JsonValue('SHUTTING_DOWN')
  shuttingDown,
  @_s.JsonValue('ENDED')
  ended,
}

/// The status change reason details for the instance group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceGroupStateChangeReason {
  /// The programmable code for the state change reason.
  @_s.JsonKey(name: 'Code')
  final InstanceGroupStateChangeReasonCode code;

  /// The status change reason description.
  @_s.JsonKey(name: 'Message')
  final String message;

  InstanceGroupStateChangeReason({
    this.code,
    this.message,
  });
  factory InstanceGroupStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$InstanceGroupStateChangeReasonFromJson(json);
}

enum InstanceGroupStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('INSTANCE_FAILURE')
  instanceFailure,
  @_s.JsonValue('CLUSTER_TERMINATED')
  clusterTerminated,
}

/// The details of the instance group status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceGroupStatus {
  /// The current state of the instance group.
  @_s.JsonKey(name: 'State')
  final InstanceGroupState state;

  /// The status change reason details for the instance group.
  @_s.JsonKey(name: 'StateChangeReason')
  final InstanceGroupStateChangeReason stateChangeReason;

  /// The timeline of the instance group status over time.
  @_s.JsonKey(name: 'Timeline')
  final InstanceGroupTimeline timeline;

  InstanceGroupStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  factory InstanceGroupStatus.fromJson(Map<String, dynamic> json) =>
      _$InstanceGroupStatusFromJson(json);
}

/// The timeline of the instance group lifecycle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceGroupTimeline {
  /// The creation date and time of the instance group.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The date and time when the instance group terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The date and time when the instance group became ready to perform tasks.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  InstanceGroupTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });
  factory InstanceGroupTimeline.fromJson(Map<String, dynamic> json) =>
      _$InstanceGroupTimelineFromJson(json);
}

enum InstanceGroupType {
  @_s.JsonValue('MASTER')
  master,
  @_s.JsonValue('CORE')
  core,
  @_s.JsonValue('TASK')
  task,
}

extension on InstanceGroupType {
  String toValue() {
    switch (this) {
      case InstanceGroupType.master:
        return 'MASTER';
      case InstanceGroupType.core:
        return 'CORE';
      case InstanceGroupType.task:
        return 'TASK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Custom policy for requesting termination protection or termination of
/// specific instances when shrinking an instance group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceResizePolicy {
  /// Decommissioning timeout override for the specific list of instances to be
  /// terminated.
  @_s.JsonKey(name: 'InstanceTerminationTimeout')
  final int instanceTerminationTimeout;

  /// Specific list of instances to be protected when shrinking an instance group.
  @_s.JsonKey(name: 'InstancesToProtect')
  final List<String> instancesToProtect;

  /// Specific list of instances to be terminated when shrinking an instance
  /// group.
  @_s.JsonKey(name: 'InstancesToTerminate')
  final List<String> instancesToTerminate;

  InstanceResizePolicy({
    this.instanceTerminationTimeout,
    this.instancesToProtect,
    this.instancesToTerminate,
  });
  factory InstanceResizePolicy.fromJson(Map<String, dynamic> json) =>
      _$InstanceResizePolicyFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceResizePolicyToJson(this);
}

enum InstanceRoleType {
  @_s.JsonValue('MASTER')
  master,
  @_s.JsonValue('CORE')
  core,
  @_s.JsonValue('TASK')
  task,
}

enum InstanceState {
  @_s.JsonValue('AWAITING_FULFILLMENT')
  awaitingFulfillment,
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('BOOTSTRAPPING')
  bootstrapping,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('TERMINATED')
  terminated,
}

extension on InstanceState {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The details of the status change reason for the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceStateChangeReason {
  /// The programmable code for the state change reason.
  @_s.JsonKey(name: 'Code')
  final InstanceStateChangeReasonCode code;

  /// The status change reason description.
  @_s.JsonKey(name: 'Message')
  final String message;

  InstanceStateChangeReason({
    this.code,
    this.message,
  });
  factory InstanceStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$InstanceStateChangeReasonFromJson(json);
}

enum InstanceStateChangeReasonCode {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('INSTANCE_FAILURE')
  instanceFailure,
  @_s.JsonValue('BOOTSTRAP_FAILURE')
  bootstrapFailure,
  @_s.JsonValue('CLUSTER_TERMINATED')
  clusterTerminated,
}

/// The instance status details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceStatus {
  /// The current state of the instance.
  @_s.JsonKey(name: 'State')
  final InstanceState state;

  /// The details of the status change reason for the instance.
  @_s.JsonKey(name: 'StateChangeReason')
  final InstanceStateChangeReason stateChangeReason;

  /// The timeline of the instance status over time.
  @_s.JsonKey(name: 'Timeline')
  final InstanceTimeline timeline;

  InstanceStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  factory InstanceStatus.fromJson(Map<String, dynamic> json) =>
      _$InstanceStatusFromJson(json);
}

/// The timeline of the instance lifecycle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceTimeline {
  /// The creation date and time of the instance.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The date and time when the instance was terminated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The date and time when the instance was ready to perform tasks.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  InstanceTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.readyDateTime,
  });
  factory InstanceTimeline.fromJson(Map<String, dynamic> json) =>
      _$InstanceTimelineFromJson(json);
}

/// An instance type configuration for each instance type in an instance fleet,
/// which determines the EC2 instances Amazon EMR attempts to provision to
/// fulfill On-Demand and Spot target capacities. There can be a maximum of five
/// instance type configurations in a fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceTypeConfig {
  /// An EC2 instance type, such as <code>m3.xlarge</code>.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The bid price for each EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD. If neither
  /// <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code>
  /// is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to
  /// 100%.
  @_s.JsonKey(name: 'BidPrice')
  final String bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each EC2 Spot
  /// Instance as defined by <code>InstanceType</code>. Expressed as a number (for
  /// example, 20 specifies 20%). If neither <code>BidPrice</code> nor
  /// <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided,
  /// <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.
  @_s.JsonKey(name: 'BidPriceAsPercentageOfOnDemandPrice')
  final double bidPriceAsPercentageOfOnDemandPrice;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// that run on the cluster.
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// The configuration of Amazon Elastic Block Storage (Amazon EBS) attached to
  /// each instance as defined by <code>InstanceType</code>.
  @_s.JsonKey(name: 'EbsConfiguration')
  final EbsConfiguration ebsConfiguration;

  /// The number of units that a provisioned instance of this type provides toward
  /// fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. This
  /// value is 1 for a master instance fleet, and must be 1 or greater for core
  /// and task instance fleets. Defaults to 1 if not specified.
  @_s.JsonKey(name: 'WeightedCapacity')
  final int weightedCapacity;

  InstanceTypeConfig({
    @_s.required this.instanceType,
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.configurations,
    this.ebsConfiguration,
    this.weightedCapacity,
  });
  Map<String, dynamic> toJson() => _$InstanceTypeConfigToJson(this);
}

/// The configuration specification for each instance type in an instance fleet.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceTypeSpecification {
  /// The bid price for each EC2 Spot Instance type as defined by
  /// <code>InstanceType</code>. Expressed in USD.
  @_s.JsonKey(name: 'BidPrice')
  final String bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each EC2 Spot
  /// Instance as defined by <code>InstanceType</code>. Expressed as a number (for
  /// example, 20 specifies 20%).
  @_s.JsonKey(name: 'BidPriceAsPercentageOfOnDemandPrice')
  final double bidPriceAsPercentageOfOnDemandPrice;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// bundled with Amazon EMR.
  @_s.JsonKey(name: 'Configurations')
  final List<Configuration> configurations;

  /// The configuration of Amazon Elastic Block Storage (Amazon EBS) attached to
  /// each instance as defined by <code>InstanceType</code>.
  @_s.JsonKey(name: 'EbsBlockDevices')
  final List<EbsBlockDevice> ebsBlockDevices;

  /// Evaluates to <code>TRUE</code> when the specified <code>InstanceType</code>
  /// is EBS-optimized.
  @_s.JsonKey(name: 'EbsOptimized')
  final bool ebsOptimized;

  /// The EC2 instance type, for example <code>m3.xlarge</code>.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The number of units that a provisioned instance of this type provides toward
  /// fulfilling the target capacities defined in <a>InstanceFleetConfig</a>.
  /// Capacity values represent performance characteristics such as vCPUs, memory,
  /// or I/O. If not specified, the default value is 1.
  @_s.JsonKey(name: 'WeightedCapacity')
  final int weightedCapacity;

  InstanceTypeSpecification({
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.configurations,
    this.ebsBlockDevices,
    this.ebsOptimized,
    this.instanceType,
    this.weightedCapacity,
  });
  factory InstanceTypeSpecification.fromJson(Map<String, dynamic> json) =>
      _$InstanceTypeSpecificationFromJson(json);
}

/// A description of a cluster (job flow).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobFlowDetail {
  /// Describes the execution status of the job flow.
  @_s.JsonKey(name: 'ExecutionStatusDetail')
  final JobFlowExecutionStatusDetail executionStatusDetail;

  /// Describes the Amazon EC2 instances of the job flow.
  @_s.JsonKey(name: 'Instances')
  final JobFlowInstancesDetail instances;

  /// The job flow identifier.
  @_s.JsonKey(name: 'JobFlowId')
  final String jobFlowId;

  /// The name of the job flow.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases
  /// 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI,
  /// use <code>CustomAmiID</code>.
  @_s.JsonKey(name: 'AmiVersion')
  final String amiVersion;

  /// An IAM role for automatic scaling policies. The default role is
  /// <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides a way for
  /// the automatic scaling feature to get the required permissions it needs to
  /// launch and terminate EC2 instances in an instance group.
  @_s.JsonKey(name: 'AutoScalingRole')
  final String autoScalingRole;

  /// A list of the bootstrap actions run by the job flow.
  @_s.JsonKey(name: 'BootstrapActions')
  final List<BootstrapActionDetail> bootstrapActions;

  /// The IAM role that was specified when the job flow was launched. The EC2
  /// instances of the job flow assume this role.
  @_s.JsonKey(name: 'JobFlowRole')
  final String jobFlowRole;

  /// The AWS KMS customer master key (CMK) used for encrypting log files. This
  /// attribute is only available with EMR version 5.30.0 and later, excluding EMR
  /// 6.0.0.
  @_s.JsonKey(name: 'LogEncryptionKmsKeyId')
  final String logEncryptionKmsKeyId;

  /// The location in Amazon S3 where log files for the job are stored.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

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
  /// version 4.1.0 and later, and is the default for versions of Amazon EMR
  /// earlier than 5.1.0.
  @_s.JsonKey(name: 'ScaleDownBehavior')
  final ScaleDownBehavior scaleDownBehavior;

  /// The IAM role that is assumed by the Amazon EMR service to access AWS
  /// resources on your behalf.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// A list of steps run by the job flow.
  @_s.JsonKey(name: 'Steps')
  final List<StepDetail> steps;

  /// A list of strings set by third-party software when the job flow is launched.
  /// If you are not using third-party software to manage the job flow, this value
  /// is empty.
  @_s.JsonKey(name: 'SupportedProducts')
  final List<String> supportedProducts;

  /// Indicates whether the cluster is visible to all IAM users of the AWS account
  /// associated with the cluster. The default value, <code>true</code>, indicates
  /// that all IAM users in the AWS account can perform cluster actions if they
  /// have the proper IAM policy permissions. If this value is <code>false</code>,
  /// only the IAM user that created the cluster can perform actions. This value
  /// can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a>
  /// action. You can override the default value of <code>true</code> when you
  /// create a cluster by using the <code>VisibleToAllUsers</code> parameter of
  /// the <code>RunJobFlow</code> action.
  @_s.JsonKey(name: 'VisibleToAllUsers')
  final bool visibleToAllUsers;

  JobFlowDetail({
    @_s.required this.executionStatusDetail,
    @_s.required this.instances,
    @_s.required this.jobFlowId,
    @_s.required this.name,
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
  factory JobFlowDetail.fromJson(Map<String, dynamic> json) =>
      _$JobFlowDetailFromJson(json);
}

/// The type of instance.
enum JobFlowExecutionState {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('BOOTSTRAPPING')
  bootstrapping,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('WAITING')
  waiting,
  @_s.JsonValue('SHUTTING_DOWN')
  shuttingDown,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

extension on JobFlowExecutionState {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the status of the cluster (job flow).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobFlowExecutionStatusDetail {
  /// The creation date and time of the job flow.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The state of the job flow.
  @_s.JsonKey(name: 'State')
  final JobFlowExecutionState state;

  /// The completion date and time of the job flow.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// Description of the job flow last changed state.
  @_s.JsonKey(name: 'LastStateChangeReason')
  final String lastStateChangeReason;

  /// The date and time when the job flow was ready to start running bootstrap
  /// actions.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadyDateTime')
  final DateTime readyDateTime;

  /// The start date and time of the job flow.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDateTime')
  final DateTime startDateTime;

  JobFlowExecutionStatusDetail({
    @_s.required this.creationDateTime,
    @_s.required this.state,
    this.endDateTime,
    this.lastStateChangeReason,
    this.readyDateTime,
    this.startDateTime,
  });
  factory JobFlowExecutionStatusDetail.fromJson(Map<String, dynamic> json) =>
      _$JobFlowExecutionStatusDetailFromJson(json);
}

/// A description of the Amazon EC2 instance on which the cluster (job flow)
/// runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or
/// InstanceFleets. They cannot be used together. You may also have
/// MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must be
/// present), but we don't recommend this configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class JobFlowInstancesConfig {
  /// A list of additional Amazon EC2 security group IDs for the master node.
  @_s.JsonKey(name: 'AdditionalMasterSecurityGroups')
  final List<String> additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  @_s.JsonKey(name: 'AdditionalSlaveSecurityGroups')
  final List<String> additionalSlaveSecurityGroups;

  /// The name of the EC2 key pair that can be used to connect to the master node
  /// using SSH as the user called "hadoop."
  @_s.JsonKey(name: 'Ec2KeyName')
  final String ec2KeyName;

  /// Applies to clusters that use the uniform instance group configuration. To
  /// launch the cluster in Amazon Virtual Private Cloud (Amazon VPC), set this
  /// parameter to the identifier of the Amazon VPC subnet where you want the
  /// cluster to launch. If you do not specify this value and your account
  /// supports EC2-Classic, the cluster launches in EC2-Classic.
  @_s.JsonKey(name: 'Ec2SubnetId')
  final String ec2SubnetId;

  /// Applies to clusters that use the instance fleet configuration. When multiple
  /// EC2 subnet IDs are specified, Amazon EMR evaluates them and launches
  /// instances in the optimal subnet.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  @_s.JsonKey(name: 'Ec2SubnetIds')
  final List<String> ec2SubnetIds;

  /// The identifier of the Amazon EC2 security group for the master node.
  @_s.JsonKey(name: 'EmrManagedMasterSecurityGroup')
  final String emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task nodes.
  @_s.JsonKey(name: 'EmrManagedSlaveSecurityGroup')
  final String emrManagedSlaveSecurityGroup;

  /// Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop
  /// version for the cluster. Valid inputs are "0.18" (no longer maintained),
  /// "0.20" (no longer maintained), "0.20.205" (no longer maintained), "1.0.3",
  /// "2.2.0", or "2.4.0". If you do not set this value, the default of 0.18 is
  /// used, unless the <code>AmiVersion</code> parameter is set in the RunJobFlow
  /// call, in which case the default version of Hadoop for that AMI version is
  /// used.
  @_s.JsonKey(name: 'HadoopVersion')
  final String hadoopVersion;

  /// The number of EC2 instances in the cluster.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  /// Describes the EC2 instances and instance configurations for clusters that
  /// use the instance fleet configuration.
  @_s.JsonKey(name: 'InstanceFleets')
  final List<InstanceFleetConfig> instanceFleets;

  /// Configuration for the instance groups in a cluster.
  @_s.JsonKey(name: 'InstanceGroups')
  final List<InstanceGroupConfig> instanceGroups;

  /// Specifies whether the cluster should remain available after completing all
  /// steps.
  @_s.JsonKey(name: 'KeepJobFlowAliveWhenNoSteps')
  final bool keepJobFlowAliveWhenNoSteps;

  /// The EC2 instance type of the master node.
  @_s.JsonKey(name: 'MasterInstanceType')
  final String masterInstanceType;

  /// The Availability Zone in which the cluster runs.
  @_s.JsonKey(name: 'Placement')
  final PlacementType placement;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  @_s.JsonKey(name: 'ServiceAccessSecurityGroup')
  final String serviceAccessSecurityGroup;

  /// The EC2 instance type of the core and task nodes.
  @_s.JsonKey(name: 'SlaveInstanceType')
  final String slaveInstanceType;

  /// Specifies whether to lock the cluster to prevent the Amazon EC2 instances
  /// from being terminated by API call, user intervention, or in the event of a
  /// job-flow error.
  @_s.JsonKey(name: 'TerminationProtected')
  final bool terminationProtected;

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
  });
  Map<String, dynamic> toJson() => _$JobFlowInstancesConfigToJson(this);
}

/// Specify the type of Amazon EC2 instances that the cluster (job flow) runs
/// on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobFlowInstancesDetail {
  /// The number of Amazon EC2 instances in the cluster. If the value is 1, the
  /// same instance serves as both the master and core and task node. If the value
  /// is greater than 1, one instance is the master node and all others are core
  /// and task nodes.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The Amazon EC2 master node instance type.
  @_s.JsonKey(name: 'MasterInstanceType')
  final String masterInstanceType;

  /// The Amazon EC2 core and task node instance type.
  @_s.JsonKey(name: 'SlaveInstanceType')
  final String slaveInstanceType;

  /// The name of an Amazon EC2 key pair that can be used to connect to the master
  /// node using SSH.
  @_s.JsonKey(name: 'Ec2KeyName')
  final String ec2KeyName;

  /// For clusters launched within Amazon Virtual Private Cloud, this is the
  /// identifier of the subnet where the cluster was launched.
  @_s.JsonKey(name: 'Ec2SubnetId')
  final String ec2SubnetId;

  /// The Hadoop version for the cluster.
  @_s.JsonKey(name: 'HadoopVersion')
  final String hadoopVersion;

  /// Details about the instance groups in a cluster.
  @_s.JsonKey(name: 'InstanceGroups')
  final List<InstanceGroupDetail> instanceGroups;

  /// Specifies whether the cluster should remain available after completing all
  /// steps.
  @_s.JsonKey(name: 'KeepJobFlowAliveWhenNoSteps')
  final bool keepJobFlowAliveWhenNoSteps;

  /// The Amazon EC2 instance identifier of the master node.
  @_s.JsonKey(name: 'MasterInstanceId')
  final String masterInstanceId;

  /// The DNS name of the master node. If the cluster is on a private subnet, this
  /// is the private DNS name. On a public subnet, this is the public DNS name.
  @_s.JsonKey(name: 'MasterPublicDnsName')
  final String masterPublicDnsName;

  /// An approximation of the cost of the cluster, represented in m1.small/hours.
  /// This value is increased one time for every hour that an m1.small instance
  /// runs. Larger instances are weighted more heavily, so an Amazon EC2 instance
  /// that is roughly four times more expensive would result in the normalized
  /// instance hours being increased incrementally four times. This result is only
  /// an approximation and does not reflect the actual billing rate.
  @_s.JsonKey(name: 'NormalizedInstanceHours')
  final int normalizedInstanceHours;

  /// The Amazon EC2 Availability Zone for the cluster.
  @_s.JsonKey(name: 'Placement')
  final PlacementType placement;

  /// Specifies whether the Amazon EC2 instances in the cluster are protected from
  /// termination by API calls, user intervention, or in the event of a job-flow
  /// error.
  @_s.JsonKey(name: 'TerminationProtected')
  final bool terminationProtected;

  JobFlowInstancesDetail({
    @_s.required this.instanceCount,
    @_s.required this.masterInstanceType,
    @_s.required this.slaveInstanceType,
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
  });
  factory JobFlowInstancesDetail.fromJson(Map<String, dynamic> json) =>
      _$JobFlowInstancesDetailFromJson(json);
}

/// Attributes for Kerberos configuration when Kerberos authentication is
/// enabled using a security configuration. For more information see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use
/// Kerberos Authentication</a> in the <i>Amazon EMR Management Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KerberosAttributes {
  /// The password used within the cluster for the kadmin service on the
  /// cluster-dedicated KDC, which maintains Kerberos principals, password
  /// policies, and keytabs for the cluster.
  @_s.JsonKey(name: 'KdcAdminPassword')
  final String kdcAdminPassword;

  /// The name of the Kerberos realm to which all nodes in a cluster belong. For
  /// example, <code>EC2.INTERNAL</code>.
  @_s.JsonKey(name: 'Realm')
  final String realm;

  /// The Active Directory password for <code>ADDomainJoinUser</code>.
  @_s.JsonKey(name: 'ADDomainJoinPassword')
  final String aDDomainJoinPassword;

  /// Required only when establishing a cross-realm trust with an Active Directory
  /// domain. A user with sufficient privileges to join resources to the domain.
  @_s.JsonKey(name: 'ADDomainJoinUser')
  final String aDDomainJoinUser;

  /// Required only when establishing a cross-realm trust with a KDC in a
  /// different realm. The cross-realm principal password, which must be identical
  /// across realms.
  @_s.JsonKey(name: 'CrossRealmTrustPrincipalPassword')
  final String crossRealmTrustPrincipalPassword;

  KerberosAttributes({
    @_s.required this.kdcAdminPassword,
    @_s.required this.realm,
    this.aDDomainJoinPassword,
    this.aDDomainJoinUser,
    this.crossRealmTrustPrincipalPassword,
  });
  factory KerberosAttributes.fromJson(Map<String, dynamic> json) =>
      _$KerberosAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$KerberosAttributesToJson(this);
}

/// A key-value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeyValue {
  /// The unique identifier of a key-value pair.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value part of the identified key.
  @_s.JsonKey(name: 'Value')
  final String value;

  KeyValue({
    this.key,
    this.value,
  });
  factory KeyValue.fromJson(Map<String, dynamic> json) =>
      _$KeyValueFromJson(json);

  Map<String, dynamic> toJson() => _$KeyValueToJson(this);
}

/// This output contains the bootstrap actions detail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBootstrapActionsOutput {
  /// The bootstrap actions associated with the cluster.
  @_s.JsonKey(name: 'BootstrapActions')
  final List<Command> bootstrapActions;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListBootstrapActionsOutput({
    this.bootstrapActions,
    this.marker,
  });
  factory ListBootstrapActionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBootstrapActionsOutputFromJson(json);
}

/// This contains a ClusterSummaryList with the cluster details; for example,
/// the cluster IDs, names, and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClustersOutput {
  /// The list of clusters for the account based on the given filters.
  @_s.JsonKey(name: 'Clusters')
  final List<ClusterSummary> clusters;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListClustersOutput({
    this.clusters,
    this.marker,
  });
  factory ListClustersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListClustersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstanceFleetsOutput {
  /// The list of instance fleets for the cluster and given filters.
  @_s.JsonKey(name: 'InstanceFleets')
  final List<InstanceFleet> instanceFleets;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListInstanceFleetsOutput({
    this.instanceFleets,
    this.marker,
  });
  factory ListInstanceFleetsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListInstanceFleetsOutputFromJson(json);
}

/// This input determines which instance groups to retrieve.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstanceGroupsOutput {
  /// The list of instance groups for the cluster and given filters.
  @_s.JsonKey(name: 'InstanceGroups')
  final List<InstanceGroup> instanceGroups;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListInstanceGroupsOutput({
    this.instanceGroups,
    this.marker,
  });
  factory ListInstanceGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListInstanceGroupsOutputFromJson(json);
}

/// This output contains the list of instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstancesOutput {
  /// The list of instances for the cluster and given filters.
  @_s.JsonKey(name: 'Instances')
  final List<Instance> instances;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListInstancesOutput({
    this.instances,
    this.marker,
  });
  factory ListInstancesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListInstancesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotebookExecutionsOutput {
  /// A pagination token that a subsequent <code>ListNotebookExecutions</code> can
  /// use to determine the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// A list of notebook executions.
  @_s.JsonKey(name: 'NotebookExecutions')
  final List<NotebookExecutionSummary> notebookExecutions;

  ListNotebookExecutionsOutput({
    this.marker,
    this.notebookExecutions,
  });
  factory ListNotebookExecutionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNotebookExecutionsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityConfigurationsOutput {
  /// A pagination token that indicates the next set of results to retrieve.
  /// Include the marker in the next ListSecurityConfiguration call to retrieve
  /// the next page of results, if required.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The creation date and time, and name, of each security configuration.
  @_s.JsonKey(name: 'SecurityConfigurations')
  final List<SecurityConfigurationSummary> securityConfigurations;

  ListSecurityConfigurationsOutput({
    this.marker,
    this.securityConfigurations,
  });
  factory ListSecurityConfigurationsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListSecurityConfigurationsOutputFromJson(json);
}

/// This output contains the list of steps returned in reverse order. This means
/// that the last step is the first element in the list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStepsOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The filtered list of steps for the cluster.
  @_s.JsonKey(name: 'Steps')
  final List<StepSummary> steps;

  ListStepsOutput({
    this.marker,
    this.steps,
  });
  factory ListStepsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListStepsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStudioSessionMappingsOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// A list of session mapping summary objects. Each object includes session
  /// mapping details such as creation time, identity type (user or group), and
  /// Studio ID.
  @_s.JsonKey(name: 'SessionMappings')
  final List<SessionMappingSummary> sessionMappings;

  ListStudioSessionMappingsOutput({
    this.marker,
    this.sessionMappings,
  });
  factory ListStudioSessionMappingsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListStudioSessionMappingsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStudiosOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The list of Studio summary objects.
  @_s.JsonKey(name: 'Studios')
  final List<StudioSummary> studios;

  ListStudiosOutput({
    this.marker,
    this.studios,
  });
  factory ListStudiosOutput.fromJson(Map<String, dynamic> json) =>
      _$ListStudiosOutputFromJson(json);
}

/// Managed scaling policy for an Amazon EMR cluster. The policy specifies the
/// limits for resources that can be added or terminated from a cluster. The
/// policy only applies to the core and task nodes. The master node cannot be
/// scaled after initial configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ManagedScalingPolicy {
  /// The EC2 unit limits for a managed scaling policy. The managed scaling
  /// activity of a cluster is not allowed to go above or below these limits. The
  /// limit only applies to the core and task nodes. The master node cannot be
  /// scaled after initial configuration.
  @_s.JsonKey(name: 'ComputeLimits')
  final ComputeLimits computeLimits;

  ManagedScalingPolicy({
    this.computeLimits,
  });
  factory ManagedScalingPolicy.fromJson(Map<String, dynamic> json) =>
      _$ManagedScalingPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedScalingPolicyToJson(this);
}

enum MarketType {
  @_s.JsonValue('ON_DEMAND')
  onDemand,
  @_s.JsonValue('SPOT')
  spot,
}

/// A CloudWatch dimension, which is specified using a <code>Key</code> (known
/// as a <code>Name</code> in CloudWatch), <code>Value</code> pair. By default,
/// Amazon EMR uses one dimension whose <code>Key</code> is
/// <code>JobFlowID</code> and <code>Value</code> is a variable representing the
/// cluster ID, which is <code>${emr.clusterId}</code>. This enables the rule to
/// bootstrap when the cluster ID becomes available.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDimension {
  /// The dimension name.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The dimension value.
  @_s.JsonKey(name: 'Value')
  final String value;

  MetricDimension({
    this.key,
    this.value,
  });
  factory MetricDimension.fromJson(Map<String, dynamic> json) =>
      _$MetricDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyClusterOutput {
  /// The number of steps that can be executed concurrently.
  @_s.JsonKey(name: 'StepConcurrencyLevel')
  final int stepConcurrencyLevel;

  ModifyClusterOutput({
    this.stepConcurrencyLevel,
  });
  factory ModifyClusterOutput.fromJson(Map<String, dynamic> json) =>
      _$ModifyClusterOutputFromJson(json);
}

/// A notebook execution. An execution is a specific instance that an EMR
/// Notebook is run using the <code>StartNotebookExecution</code> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotebookExecution {
  /// The Amazon Resource Name (ARN) of the notebook execution.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The unique identifier of the EMR Notebook that is used for the notebook
  /// execution.
  @_s.JsonKey(name: 'EditorId')
  final String editorId;

  /// The timestamp when notebook execution ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The execution engine, such as an EMR cluster, used to run the EMR notebook
  /// and perform the notebook execution.
  @_s.JsonKey(name: 'ExecutionEngine')
  final ExecutionEngineConfig executionEngine;

  /// The reason for the latest status change of the notebook execution.
  @_s.JsonKey(name: 'LastStateChangeReason')
  final String lastStateChangeReason;

  /// The unique identifier of a notebook execution.
  @_s.JsonKey(name: 'NotebookExecutionId')
  final String notebookExecutionId;

  /// A name for the notebook execution.
  @_s.JsonKey(name: 'NotebookExecutionName')
  final String notebookExecutionName;

  /// The unique identifier of the EC2 security group associated with the EMR
  /// Notebook instance. For more information see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-managed-notebooks-security-groups.html">Specifying
  /// EC2 Security Groups for EMR Notebooks</a> in the <i>EMR Management
  /// Guide</i>.
  @_s.JsonKey(name: 'NotebookInstanceSecurityGroupId')
  final String notebookInstanceSecurityGroupId;

  /// Input parameters in JSON format passed to the EMR Notebook at runtime for
  /// execution.
  @_s.JsonKey(name: 'NotebookParams')
  final String notebookParams;

  /// The location of the notebook execution's output file in Amazon S3.
  @_s.JsonKey(name: 'OutputNotebookURI')
  final String outputNotebookURI;

  /// The timestamp when notebook execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

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
  @_s.JsonKey(name: 'Status')
  final NotebookExecutionStatus status;

  /// A list of tags associated with a notebook execution. Tags are user-defined
  /// key-value pairs that consist of a required key string with a maximum of 128
  /// characters and an optional value string with a maximum of 256 characters.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  NotebookExecution({
    this.arn,
    this.editorId,
    this.endTime,
    this.executionEngine,
    this.lastStateChangeReason,
    this.notebookExecutionId,
    this.notebookExecutionName,
    this.notebookInstanceSecurityGroupId,
    this.notebookParams,
    this.outputNotebookURI,
    this.startTime,
    this.status,
    this.tags,
  });
  factory NotebookExecution.fromJson(Map<String, dynamic> json) =>
      _$NotebookExecutionFromJson(json);
}

enum NotebookExecutionStatus {
  @_s.JsonValue('START_PENDING')
  startPending,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FINISHING')
  finishing,
  @_s.JsonValue('FINISHED')
  finished,
  @_s.JsonValue('FAILING')
  failing,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOP_PENDING')
  stopPending,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
}

extension on NotebookExecutionStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotebookExecutionSummary {
  /// The unique identifier of the editor associated with the notebook execution.
  @_s.JsonKey(name: 'EditorId')
  final String editorId;

  /// The timestamp when notebook execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The unique identifier of the notebook execution.
  @_s.JsonKey(name: 'NotebookExecutionId')
  final String notebookExecutionId;

  /// The name of the notebook execution.
  @_s.JsonKey(name: 'NotebookExecutionName')
  final String notebookExecutionName;

  /// The timestamp when notebook execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

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
  @_s.JsonKey(name: 'Status')
  final NotebookExecutionStatus status;

  NotebookExecutionSummary({
    this.editorId,
    this.endTime,
    this.notebookExecutionId,
    this.notebookExecutionName,
    this.startTime,
    this.status,
  });
  factory NotebookExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$NotebookExecutionSummaryFromJson(json);
}

enum OnDemandProvisioningAllocationStrategy {
  @_s.JsonValue('lowest-price')
  lowestPrice,
}

/// The launch specification for On-Demand Instances in the instance fleet,
/// which determines the allocation strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions. On-Demand Instances allocation
/// strategy is available in Amazon EMR version 5.12.1 and later.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnDemandProvisioningSpecification {
  /// Specifies the strategy to use in launching On-Demand Instance fleets.
  /// Currently, the only option is lowest-price (the default), which launches the
  /// lowest price first.
  @_s.JsonKey(name: 'AllocationStrategy')
  final OnDemandProvisioningAllocationStrategy allocationStrategy;

  OnDemandProvisioningSpecification({
    @_s.required this.allocationStrategy,
  });
  factory OnDemandProvisioningSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$OnDemandProvisioningSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OnDemandProvisioningSpecificationToJson(this);
}

/// Placement group configuration for an Amazon EMR cluster. The configuration
/// specifies the placement strategy that can be applied to instance roles
/// during cluster creation.
///
/// To use this configuration, consider attaching managed policy
/// AmazonElasticMapReducePlacementGroupPolicy to the EMR role.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlacementGroupConfig {
  /// Role of the instance in the cluster.
  ///
  /// Starting with Amazon EMR version 5.23.0, the only supported instance role is
  /// <code>MASTER</code>.
  @_s.JsonKey(name: 'InstanceRole')
  final InstanceRoleType instanceRole;

  /// EC2 Placement Group strategy associated with instance role.
  ///
  /// Starting with Amazon EMR version 5.23.0, the only supported placement
  /// strategy is <code>SPREAD</code> for the <code>MASTER</code> instance role.
  @_s.JsonKey(name: 'PlacementStrategy')
  final PlacementGroupStrategy placementStrategy;

  PlacementGroupConfig({
    @_s.required this.instanceRole,
    this.placementStrategy,
  });
  factory PlacementGroupConfig.fromJson(Map<String, dynamic> json) =>
      _$PlacementGroupConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PlacementGroupConfigToJson(this);
}

enum PlacementGroupStrategy {
  @_s.JsonValue('SPREAD')
  spread,
  @_s.JsonValue('PARTITION')
  partition,
  @_s.JsonValue('CLUSTER')
  cluster,
  @_s.JsonValue('NONE')
  none,
}

/// The Amazon EC2 Availability Zone configuration of the cluster (job flow).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PlacementType {
  /// The Amazon EC2 Availability Zone for the cluster.
  /// <code>AvailabilityZone</code> is used for uniform instance groups, while
  /// <code>AvailabilityZones</code> (plural) is used for instance fleets.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// When multiple Availability Zones are specified, Amazon EMR evaluates them
  /// and launches instances in the optimal Availability Zone.
  /// <code>AvailabilityZones</code> is used for instance fleets, while
  /// <code>AvailabilityZone</code> (singular) is used for uniform instance
  /// groups.
  /// <note>
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  /// </note>
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  PlacementType({
    this.availabilityZone,
    this.availabilityZones,
  });
  factory PlacementType.fromJson(Map<String, dynamic> json) =>
      _$PlacementTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PlacementTypeToJson(this);
}

/// A list of port ranges that are permitted to allow inbound traffic from all
/// public IP addresses. To specify a single port, use the same value for
/// <code>MinRange</code> and <code>MaxRange</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortRange {
  /// The smallest port number in a specified range of port numbers.
  @_s.JsonKey(name: 'MinRange')
  final int minRange;

  /// The smallest port number in a specified range of port numbers.
  @_s.JsonKey(name: 'MaxRange')
  final int maxRange;

  PortRange({
    @_s.required this.minRange,
    this.maxRange,
  });
  factory PortRange.fromJson(Map<String, dynamic> json) =>
      _$PortRangeFromJson(json);

  Map<String, dynamic> toJson() => _$PortRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAutoScalingPolicyOutput {
  /// The automatic scaling policy definition.
  @_s.JsonKey(name: 'AutoScalingPolicy')
  final AutoScalingPolicyDescription autoScalingPolicy;

  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// Specifies the ID of the instance group to which the scaling policy is
  /// applied.
  @_s.JsonKey(name: 'InstanceGroupId')
  final String instanceGroupId;

  PutAutoScalingPolicyOutput({
    this.autoScalingPolicy,
    this.clusterArn,
    this.clusterId,
    this.instanceGroupId,
  });
  factory PutAutoScalingPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$PutAutoScalingPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutBlockPublicAccessConfigurationOutput {
  PutBlockPublicAccessConfigurationOutput();
  factory PutBlockPublicAccessConfigurationOutput.fromJson(
          Map<String, dynamic> json) =>
      _$PutBlockPublicAccessConfigurationOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutManagedScalingPolicyOutput {
  PutManagedScalingPolicyOutput();
  factory PutManagedScalingPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$PutManagedScalingPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveAutoScalingPolicyOutput {
  RemoveAutoScalingPolicyOutput();
  factory RemoveAutoScalingPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$RemoveAutoScalingPolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveManagedScalingPolicyOutput {
  RemoveManagedScalingPolicyOutput();
  factory RemoveManagedScalingPolicyOutput.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveManagedScalingPolicyOutputFromJson(json);
}

/// This output indicates the result of removing tags from a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveTagsOutput {
  RemoveTagsOutput();
  factory RemoveTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$RemoveTagsOutputFromJson(json);
}

enum RepoUpgradeOnBoot {
  @_s.JsonValue('SECURITY')
  security,
  @_s.JsonValue('NONE')
  none,
}

extension on RepoUpgradeOnBoot {
  String toValue() {
    switch (this) {
      case RepoUpgradeOnBoot.security:
        return 'SECURITY';
      case RepoUpgradeOnBoot.none:
        return 'NONE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The result of the <a>RunJobFlow</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RunJobFlowOutput {
  /// The Amazon Resource Name of the cluster.
  @_s.JsonKey(name: 'ClusterArn')
  final String clusterArn;

  /// An unique identifier for the job flow.
  @_s.JsonKey(name: 'JobFlowId')
  final String jobFlowId;

  RunJobFlowOutput({
    this.clusterArn,
    this.jobFlowId,
  });
  factory RunJobFlowOutput.fromJson(Map<String, dynamic> json) =>
      _$RunJobFlowOutputFromJson(json);
}

enum ScaleDownBehavior {
  @_s.JsonValue('TERMINATE_AT_INSTANCE_HOUR')
  terminateAtInstanceHour,
  @_s.JsonValue('TERMINATE_AT_TASK_COMPLETION')
  terminateAtTaskCompletion,
}

extension on ScaleDownBehavior {
  String toValue() {
    switch (this) {
      case ScaleDownBehavior.terminateAtInstanceHour:
        return 'TERMINATE_AT_INSTANCE_HOUR';
      case ScaleDownBehavior.terminateAtTaskCompletion:
        return 'TERMINATE_AT_TASK_COMPLETION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The type of adjustment the automatic scaling activity makes when triggered,
/// and the periodicity of the adjustment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalingAction {
  /// The type of adjustment the automatic scaling activity makes when triggered,
  /// and the periodicity of the adjustment.
  @_s.JsonKey(name: 'SimpleScalingPolicyConfiguration')
  final SimpleScalingPolicyConfiguration simpleScalingPolicyConfiguration;

  /// Not available for instance groups. Instance groups use the market type
  /// specified for the group.
  @_s.JsonKey(name: 'Market')
  final MarketType market;

  ScalingAction({
    @_s.required this.simpleScalingPolicyConfiguration,
    this.market,
  });
  factory ScalingAction.fromJson(Map<String, dynamic> json) =>
      _$ScalingActionFromJson(json);

  Map<String, dynamic> toJson() => _$ScalingActionToJson(this);
}

/// The upper and lower EC2 instance limits for an automatic scaling policy.
/// Automatic scaling activities triggered by automatic scaling rules will not
/// cause an instance group to grow above or below these limits.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalingConstraints {
  /// The upper boundary of EC2 instances in an instance group beyond which
  /// scaling activities are not allowed to grow. Scale-out activities will not
  /// add instances beyond this boundary.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The lower boundary of EC2 instances in an instance group below which scaling
  /// activities are not allowed to shrink. Scale-in activities will not terminate
  /// instances below this boundary.
  @_s.JsonKey(name: 'MinCapacity')
  final int minCapacity;

  ScalingConstraints({
    @_s.required this.maxCapacity,
    @_s.required this.minCapacity,
  });
  factory ScalingConstraints.fromJson(Map<String, dynamic> json) =>
      _$ScalingConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$ScalingConstraintsToJson(this);
}

/// A scale-in or scale-out rule that defines scaling activity, including the
/// CloudWatch metric alarm that triggers activity, how EC2 instances are added
/// or removed, and the periodicity of adjustments. The automatic scaling policy
/// for an instance group can comprise one or more automatic scaling rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalingRule {
  /// The conditions that trigger an automatic scaling activity.
  @_s.JsonKey(name: 'Action')
  final ScalingAction action;

  /// The name used to identify an automatic scaling rule. Rule names must be
  /// unique within a scaling policy.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The CloudWatch alarm definition that determines when automatic scaling
  /// activity is triggered.
  @_s.JsonKey(name: 'Trigger')
  final ScalingTrigger trigger;

  /// A friendly, more verbose description of the automatic scaling rule.
  @_s.JsonKey(name: 'Description')
  final String description;

  ScalingRule({
    @_s.required this.action,
    @_s.required this.name,
    @_s.required this.trigger,
    this.description,
  });
  factory ScalingRule.fromJson(Map<String, dynamic> json) =>
      _$ScalingRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ScalingRuleToJson(this);
}

/// The conditions that trigger an automatic scaling activity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalingTrigger {
  /// The definition of a CloudWatch metric alarm. When the defined alarm
  /// conditions are met along with other trigger parameters, scaling activity
  /// begins.
  @_s.JsonKey(name: 'CloudWatchAlarmDefinition')
  final CloudWatchAlarmDefinition cloudWatchAlarmDefinition;

  ScalingTrigger({
    @_s.required this.cloudWatchAlarmDefinition,
  });
  factory ScalingTrigger.fromJson(Map<String, dynamic> json) =>
      _$ScalingTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$ScalingTriggerToJson(this);
}

/// Configuration of the script to run during a bootstrap action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScriptBootstrapActionConfig {
  /// Location of the script to run during a bootstrap action. Can be either a
  /// location in Amazon S3 or on a local file system.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// A list of command line arguments to pass to the bootstrap action script.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  ScriptBootstrapActionConfig({
    @_s.required this.path,
    this.args,
  });
  factory ScriptBootstrapActionConfig.fromJson(Map<String, dynamic> json) =>
      _$ScriptBootstrapActionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ScriptBootstrapActionConfigToJson(this);
}

/// The creation date and time, and name, of a security configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityConfigurationSummary {
  /// The date and time the security configuration was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The name of the security configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  SecurityConfigurationSummary({
    this.creationDateTime,
    this.name,
  });
  factory SecurityConfigurationSummary.fromJson(Map<String, dynamic> json) =>
      _$SecurityConfigurationSummaryFromJson(json);
}

/// Details for an Amazon EMR Studio session mapping including creation time,
/// user or group ID, Studio ID, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionMappingDetail {
  /// The time the session mapping was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The globally unique identifier (GUID) of the user or group.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>.
  @_s.JsonKey(name: 'IdentityName')
  final String identityName;

  /// Specifies whether the identity mapped to the Studio is a user or a group.
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// The time the session mapping was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the session policy associated with the
  /// user or group.
  @_s.JsonKey(name: 'SessionPolicyArn')
  final String sessionPolicyArn;

  /// The ID of the Amazon EMR Studio.
  @_s.JsonKey(name: 'StudioId')
  final String studioId;

  SessionMappingDetail({
    this.creationTime,
    this.identityId,
    this.identityName,
    this.identityType,
    this.lastModifiedTime,
    this.sessionPolicyArn,
    this.studioId,
  });
  factory SessionMappingDetail.fromJson(Map<String, dynamic> json) =>
      _$SessionMappingDetailFromJson(json);
}

/// Details for an Amazon EMR Studio session mapping. The details do not include
/// the time the session mapping was last modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionMappingSummary {
  /// The time the session mapping was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The globally unique identifier (GUID) of the user or group from the AWS SSO
  /// Identity Store.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// The name of the user or group. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_User.html#singlesignon-Type-User-UserId">UserName</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/API_Group.html#singlesignon-Type-Group-DisplayName">DisplayName</a>
  /// in the <i>AWS SSO Identity Store API Reference</i>.
  @_s.JsonKey(name: 'IdentityName')
  final String identityName;

  /// Specifies whether the identity mapped to the Studio is a user or a group.
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// The Amazon Resource Name (ARN) of the session policy associated with the
  /// user or group.
  @_s.JsonKey(name: 'SessionPolicyArn')
  final String sessionPolicyArn;

  /// The ID of the Amazon EMR Studio.
  @_s.JsonKey(name: 'StudioId')
  final String studioId;

  SessionMappingSummary({
    this.creationTime,
    this.identityId,
    this.identityName,
    this.identityType,
    this.sessionPolicyArn,
    this.studioId,
  });
  factory SessionMappingSummary.fromJson(Map<String, dynamic> json) =>
      _$SessionMappingSummaryFromJson(json);
}

/// Policy for customizing shrink operations. Allows configuration of
/// decommissioning timeout and targeted instance shrinking.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ShrinkPolicy {
  /// The desired timeout for decommissioning an instance. Overrides the default
  /// YARN decommissioning timeout.
  @_s.JsonKey(name: 'DecommissionTimeout')
  final int decommissionTimeout;

  /// Custom policy for requesting termination protection or termination of
  /// specific instances when shrinking an instance group.
  @_s.JsonKey(name: 'InstanceResizePolicy')
  final InstanceResizePolicy instanceResizePolicy;

  ShrinkPolicy({
    this.decommissionTimeout,
    this.instanceResizePolicy,
  });
  factory ShrinkPolicy.fromJson(Map<String, dynamic> json) =>
      _$ShrinkPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ShrinkPolicyToJson(this);
}

/// An automatic scaling configuration, which describes how the policy adds or
/// removes instances, the cooldown period, and the number of EC2 instances that
/// will be added each time the CloudWatch metric alarm condition is satisfied.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimpleScalingPolicyConfiguration {
  /// The amount by which to scale in or scale out, based on the specified
  /// <code>AdjustmentType</code>. A positive value adds to the instance group's
  /// EC2 instance count while a negative number removes instances. If
  /// <code>AdjustmentType</code> is set to <code>EXACT_CAPACITY</code>, the
  /// number should only be a positive integer. If <code>AdjustmentType</code> is
  /// set to <code>PERCENT_CHANGE_IN_CAPACITY</code>, the value should express the
  /// percentage as an integer. For example, -20 indicates a decrease in 20%
  /// increments of cluster capacity.
  @_s.JsonKey(name: 'ScalingAdjustment')
  final int scalingAdjustment;

  /// The way in which EC2 instances are added (if <code>ScalingAdjustment</code>
  /// is a positive number) or terminated (if <code>ScalingAdjustment</code> is a
  /// negative number) each time the scaling activity is triggered.
  /// <code>CHANGE_IN_CAPACITY</code> is the default.
  /// <code>CHANGE_IN_CAPACITY</code> indicates that the EC2 instance count
  /// increments or decrements by <code>ScalingAdjustment</code>, which should be
  /// expressed as an integer. <code>PERCENT_CHANGE_IN_CAPACITY</code> indicates
  /// the instance count increments or decrements by the percentage specified by
  /// <code>ScalingAdjustment</code>, which should be expressed as an integer. For
  /// example, 20 indicates an increase in 20% increments of cluster capacity.
  /// <code>EXACT_CAPACITY</code> indicates the scaling activity results in an
  /// instance group with the number of EC2 instances specified by
  /// <code>ScalingAdjustment</code>, which should be expressed as a positive
  /// integer.
  @_s.JsonKey(name: 'AdjustmentType')
  final AdjustmentType adjustmentType;

  /// The amount of time, in seconds, after a scaling activity completes before
  /// any further trigger-related scaling activities can start. The default value
  /// is 0.
  @_s.JsonKey(name: 'CoolDown')
  final int coolDown;

  SimpleScalingPolicyConfiguration({
    @_s.required this.scalingAdjustment,
    this.adjustmentType,
    this.coolDown,
  });
  factory SimpleScalingPolicyConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SimpleScalingPolicyConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SimpleScalingPolicyConfigurationToJson(this);
}

enum SpotProvisioningAllocationStrategy {
  @_s.JsonValue('capacity-optimized')
  capacityOptimized,
}

/// The launch specification for Spot Instances in the instance fleet, which
/// determines the defined duration, provisioning timeout behavior, and
/// allocation strategy.
/// <note>
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions. Spot Instance allocation strategy
/// is available in Amazon EMR version 5.12.1 and later.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SpotProvisioningSpecification {
  /// The action to take when <code>TargetSpotCapacity</code> has not been
  /// fulfilled when the <code>TimeoutDurationMinutes</code> has expired; that is,
  /// when all Spot Instances could not be provisioned within the Spot
  /// provisioning timeout. Valid values are <code>TERMINATE_CLUSTER</code> and
  /// <code>SWITCH_TO_ON_DEMAND</code>. SWITCH_TO_ON_DEMAND specifies that if no
  /// Spot Instances are available, On-Demand Instances should be provisioned to
  /// fulfill any remaining Spot capacity.
  @_s.JsonKey(name: 'TimeoutAction')
  final SpotProvisioningTimeoutAction timeoutAction;

  /// The spot provisioning timeout period in minutes. If Spot Instances are not
  /// provisioned within this time period, the <code>TimeOutAction</code> is
  /// taken. Minimum value is 5 and maximum value is 1440. The timeout applies
  /// only during initial provisioning, when the cluster is first created.
  @_s.JsonKey(name: 'TimeoutDurationMinutes')
  final int timeoutDurationMinutes;

  /// Specifies the strategy to use in launching Spot Instance fleets. Currently,
  /// the only option is capacity-optimized (the default), which launches
  /// instances from Spot Instance pools with optimal capacity for the number of
  /// instances that are launching.
  @_s.JsonKey(name: 'AllocationStrategy')
  final SpotProvisioningAllocationStrategy allocationStrategy;

  /// The defined duration for Spot Instances (also known as Spot blocks) in
  /// minutes. When specified, the Spot Instance does not terminate before the
  /// defined duration expires, and defined duration pricing for Spot instances
  /// applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration
  /// period starts as soon as a Spot Instance receives its instance ID. At the
  /// end of the duration, Amazon EC2 marks the Spot Instance for termination and
  /// provides a Spot Instance termination notice, which gives the instance a
  /// two-minute warning before it terminates.
  @_s.JsonKey(name: 'BlockDurationMinutes')
  final int blockDurationMinutes;

  SpotProvisioningSpecification({
    @_s.required this.timeoutAction,
    @_s.required this.timeoutDurationMinutes,
    this.allocationStrategy,
    this.blockDurationMinutes,
  });
  factory SpotProvisioningSpecification.fromJson(Map<String, dynamic> json) =>
      _$SpotProvisioningSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$SpotProvisioningSpecificationToJson(this);
}

enum SpotProvisioningTimeoutAction {
  @_s.JsonValue('SWITCH_TO_ON_DEMAND')
  switchToOnDemand,
  @_s.JsonValue('TERMINATE_CLUSTER')
  terminateCluster,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartNotebookExecutionOutput {
  /// The unique identifier of the notebook execution.
  @_s.JsonKey(name: 'NotebookExecutionId')
  final String notebookExecutionId;

  StartNotebookExecutionOutput({
    this.notebookExecutionId,
  });
  factory StartNotebookExecutionOutput.fromJson(Map<String, dynamic> json) =>
      _$StartNotebookExecutionOutputFromJson(json);
}

enum Statistic {
  @_s.JsonValue('SAMPLE_COUNT')
  sampleCount,
  @_s.JsonValue('AVERAGE')
  average,
  @_s.JsonValue('SUM')
  sum,
  @_s.JsonValue('MINIMUM')
  minimum,
  @_s.JsonValue('MAXIMUM')
  maximum,
}

/// This represents a step in a cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Step {
  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// provided for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  @_s.JsonKey(name: 'ActionOnFailure')
  final ActionOnFailure actionOnFailure;

  /// The Hadoop job configuration of the cluster step.
  @_s.JsonKey(name: 'Config')
  final HadoopStepConfig config;

  /// The identifier of the cluster step.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the cluster step.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current execution status details of the cluster step.
  @_s.JsonKey(name: 'Status')
  final StepStatus status;

  Step({
    this.actionOnFailure,
    this.config,
    this.id,
    this.name,
    this.status,
  });
  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

enum StepCancellationOption {
  @_s.JsonValue('SEND_INTERRUPT')
  sendInterrupt,
  @_s.JsonValue('TERMINATE_PROCESS')
  terminateProcess,
}

extension on StepCancellationOption {
  String toValue() {
    switch (this) {
      case StepCancellationOption.sendInterrupt:
        return 'SEND_INTERRUPT';
      case StepCancellationOption.terminateProcess:
        return 'TERMINATE_PROCESS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specification of a cluster (job flow) step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StepConfig {
  /// The JAR file used for the step.
  @_s.JsonKey(name: 'HadoopJarStep')
  final HadoopJarStepConfig hadoopJarStep;

  /// The name of the step.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// provided for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  @_s.JsonKey(name: 'ActionOnFailure')
  final ActionOnFailure actionOnFailure;

  StepConfig({
    @_s.required this.hadoopJarStep,
    @_s.required this.name,
    this.actionOnFailure,
  });
  factory StepConfig.fromJson(Map<String, dynamic> json) =>
      _$StepConfigFromJson(json);

  Map<String, dynamic> toJson() => _$StepConfigToJson(this);
}

/// Combines the execution state and configuration of a step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepDetail {
  /// The description of the step status.
  @_s.JsonKey(name: 'ExecutionStatusDetail')
  final StepExecutionStatusDetail executionStatusDetail;

  /// The step configuration.
  @_s.JsonKey(name: 'StepConfig')
  final StepConfig stepConfig;

  StepDetail({
    @_s.required this.executionStatusDetail,
    @_s.required this.stepConfig,
  });
  factory StepDetail.fromJson(Map<String, dynamic> json) =>
      _$StepDetailFromJson(json);
}

enum StepExecutionState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('CONTINUE')
  $continue,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INTERRUPTED')
  interrupted,
}

/// The execution state of a step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepExecutionStatusDetail {
  /// The creation date and time of the step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The state of the step.
  @_s.JsonKey(name: 'State')
  final StepExecutionState state;

  /// The completion date and time of the step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// A description of the step's current state.
  @_s.JsonKey(name: 'LastStateChangeReason')
  final String lastStateChangeReason;

  /// The start date and time of the step.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDateTime')
  final DateTime startDateTime;

  StepExecutionStatusDetail({
    @_s.required this.creationDateTime,
    @_s.required this.state,
    this.endDateTime,
    this.lastStateChangeReason,
    this.startDateTime,
  });
  factory StepExecutionStatusDetail.fromJson(Map<String, dynamic> json) =>
      _$StepExecutionStatusDetailFromJson(json);
}

enum StepState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('CANCEL_PENDING')
  cancelPending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INTERRUPTED')
  interrupted,
}

extension on StepState {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The details of the step state change reason.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepStateChangeReason {
  /// The programmable code for the state change reason. Note: Currently, the
  /// service provides no code for the state change.
  @_s.JsonKey(name: 'Code')
  final StepStateChangeReasonCode code;

  /// The descriptive message for the state change reason.
  @_s.JsonKey(name: 'Message')
  final String message;

  StepStateChangeReason({
    this.code,
    this.message,
  });
  factory StepStateChangeReason.fromJson(Map<String, dynamic> json) =>
      _$StepStateChangeReasonFromJson(json);
}

enum StepStateChangeReasonCode {
  @_s.JsonValue('NONE')
  none,
}

/// The execution status details of the cluster step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepStatus {
  /// The details for the step failure including reason, message, and log file
  /// path where the root cause was identified.
  @_s.JsonKey(name: 'FailureDetails')
  final FailureDetails failureDetails;

  /// The execution state of the cluster step.
  @_s.JsonKey(name: 'State')
  final StepState state;

  /// The reason for the step execution status change.
  @_s.JsonKey(name: 'StateChangeReason')
  final StepStateChangeReason stateChangeReason;

  /// The timeline of the cluster step status over time.
  @_s.JsonKey(name: 'Timeline')
  final StepTimeline timeline;

  StepStatus({
    this.failureDetails,
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  factory StepStatus.fromJson(Map<String, dynamic> json) =>
      _$StepStatusFromJson(json);
}

/// The summary of the cluster step.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepSummary {
  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// available for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  @_s.JsonKey(name: 'ActionOnFailure')
  final ActionOnFailure actionOnFailure;

  /// The Hadoop job configuration of the cluster step.
  @_s.JsonKey(name: 'Config')
  final HadoopStepConfig config;

  /// The identifier of the cluster step.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the cluster step.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current execution status details of the cluster step.
  @_s.JsonKey(name: 'Status')
  final StepStatus status;

  StepSummary({
    this.actionOnFailure,
    this.config,
    this.id,
    this.name,
    this.status,
  });
  factory StepSummary.fromJson(Map<String, dynamic> json) =>
      _$StepSummaryFromJson(json);
}

/// The timeline of the cluster step lifecycle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StepTimeline {
  /// The date and time when the cluster step was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDateTime')
  final DateTime creationDateTime;

  /// The date and time when the cluster step execution completed or failed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndDateTime')
  final DateTime endDateTime;

  /// The date and time when the cluster step execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDateTime')
  final DateTime startDateTime;

  StepTimeline({
    this.creationDateTime,
    this.endDateTime,
    this.startDateTime,
  });
  factory StepTimeline.fromJson(Map<String, dynamic> json) =>
      _$StepTimelineFromJson(json);
}

/// Details for an Amazon EMR Studio including ID, creation time, name, and so
/// on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Studio {
  /// Specifies whether the Studio authenticates users using single sign-on (SSO)
  /// or IAM.
  @_s.JsonKey(name: 'AuthMode')
  final AuthMode authMode;

  /// The time the Amazon EMR Studio was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The default Amazon S3 location to back up Amazon EMR Studio Workspaces and
  /// notebook files.
  @_s.JsonKey(name: 'DefaultS3Location')
  final String defaultS3Location;

  /// The detailed description of the EMR Studio.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the Engine security group associated with the Amazon EMR Studio.
  /// The Engine security group allows inbound network traffic from resources in
  /// the Workspace security group.
  @_s.JsonKey(name: 'EngineSecurityGroupId')
  final String engineSecurityGroupId;

  /// The name of the EMR Studio.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of the IAM role assumed by the Amazon EMR Studio.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The Amazon Resource Name (ARN) of the EMR Studio.
  @_s.JsonKey(name: 'StudioArn')
  final String studioArn;

  /// The ID of the EMR Studio.
  @_s.JsonKey(name: 'StudioId')
  final String studioId;

  /// The list of IDs of the subnets associated with the Amazon EMR Studio.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// A list of tags associated with the Amazon EMR Studio.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The unique access URL of the Amazon EMR Studio.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The name of the IAM role assumed by users logged in to the Amazon EMR
  /// Studio.
  @_s.JsonKey(name: 'UserRole')
  final String userRole;

  /// The ID of the VPC associated with the EMR Studio.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The ID of the Workspace security group associated with the Amazon EMR
  /// Studio. The Workspace security group allows outbound network traffic to
  /// resources in the Engine security group and to the internet.
  @_s.JsonKey(name: 'WorkspaceSecurityGroupId')
  final String workspaceSecurityGroupId;

  Studio({
    this.authMode,
    this.creationTime,
    this.defaultS3Location,
    this.description,
    this.engineSecurityGroupId,
    this.name,
    this.serviceRole,
    this.studioArn,
    this.studioId,
    this.subnetIds,
    this.tags,
    this.url,
    this.userRole,
    this.vpcId,
    this.workspaceSecurityGroupId,
  });
  factory Studio.fromJson(Map<String, dynamic> json) => _$StudioFromJson(json);
}

/// Details for an Amazon EMR Studio, including ID, Name, VPC, and Description.
/// The details do not include subnets, IAM roles, security groups, or tags
/// associated with the Studio.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StudioSummary {
  /// The time when the Amazon EMR Studio was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The detailed description of the EMR Studio.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the Amazon EMR Studio.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the Amazon EMR Studio.
  @_s.JsonKey(name: 'StudioId')
  final String studioId;

  /// The unique access URL of the Amazon EMR Studio.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The ID of the Virtual Private Cloud (Amazon VPC) associated with the Amazon
  /// EMR Studio.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  StudioSummary({
    this.creationTime,
    this.description,
    this.name,
    this.studioId,
    this.url,
    this.vpcId,
  });
  factory StudioSummary.fromJson(Map<String, dynamic> json) =>
      _$StudioSummaryFromJson(json);
}

/// The list of supported product configurations which allow user-supplied
/// arguments. EMR accepts these arguments and forwards them to the
/// corresponding installation script as bootstrap action arguments.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SupportedProductConfig {
  /// The list of user-supplied arguments.
  @_s.JsonKey(name: 'Args')
  final List<String> args;

  /// The name of the product configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  SupportedProductConfig({
    this.args,
    this.name,
  });
  Map<String, dynamic> toJson() => _$SupportedProductConfigToJson(this);
}

/// A key-value pair containing user-defined metadata that you can associate
/// with an Amazon EMR resource. Tags make it easier to associate clusters in
/// various ways, such as grouping clusters to track your Amazon EMR resource
/// allocation costs. For more information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
/// Clusters</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A user-defined key, which is the minimum required information for a valid
  /// tag. For more information, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// </a>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A user-defined value, which is optional in a tag. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag
  /// Clusters</a>.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum Unit {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SECONDS')
  seconds,
  @_s.JsonValue('MICRO_SECONDS')
  microSeconds,
  @_s.JsonValue('MILLI_SECONDS')
  milliSeconds,
  @_s.JsonValue('BYTES')
  bytes,
  @_s.JsonValue('KILO_BYTES')
  kiloBytes,
  @_s.JsonValue('MEGA_BYTES')
  megaBytes,
  @_s.JsonValue('GIGA_BYTES')
  gigaBytes,
  @_s.JsonValue('TERA_BYTES')
  teraBytes,
  @_s.JsonValue('BITS')
  bits,
  @_s.JsonValue('KILO_BITS')
  kiloBits,
  @_s.JsonValue('MEGA_BITS')
  megaBits,
  @_s.JsonValue('GIGA_BITS')
  gigaBits,
  @_s.JsonValue('TERA_BITS')
  teraBits,
  @_s.JsonValue('PERCENT')
  percent,
  @_s.JsonValue('COUNT')
  count,
  @_s.JsonValue('BYTES_PER_SECOND')
  bytesPerSecond,
  @_s.JsonValue('KILO_BYTES_PER_SECOND')
  kiloBytesPerSecond,
  @_s.JsonValue('MEGA_BYTES_PER_SECOND')
  megaBytesPerSecond,
  @_s.JsonValue('GIGA_BYTES_PER_SECOND')
  gigaBytesPerSecond,
  @_s.JsonValue('TERA_BYTES_PER_SECOND')
  teraBytesPerSecond,
  @_s.JsonValue('BITS_PER_SECOND')
  bitsPerSecond,
  @_s.JsonValue('KILO_BITS_PER_SECOND')
  kiloBitsPerSecond,
  @_s.JsonValue('MEGA_BITS_PER_SECOND')
  megaBitsPerSecond,
  @_s.JsonValue('GIGA_BITS_PER_SECOND')
  gigaBitsPerSecond,
  @_s.JsonValue('TERA_BITS_PER_SECOND')
  teraBitsPerSecond,
  @_s.JsonValue('COUNT_PER_SECOND')
  countPerSecond,
}

/// EBS volume specifications such as volume type, IOPS, and size (GiB) that
/// will be requested for the EBS volume attached to an EC2 instance in the
/// cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VolumeSpecification {
  /// The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If
  /// the volume type is EBS-optimized, the minimum value is 10.
  @_s.JsonKey(name: 'SizeInGB')
  final int sizeInGB;

  /// The volume type. Volume types supported are gp2, io1, standard.
  @_s.JsonKey(name: 'VolumeType')
  final String volumeType;

  /// The number of I/O operations per second (IOPS) that the volume supports.
  @_s.JsonKey(name: 'Iops')
  final int iops;

  VolumeSpecification({
    @_s.required this.sizeInGB,
    @_s.required this.volumeType,
    this.iops,
  });
  factory VolumeSpecification.fromJson(Map<String, dynamic> json) =>
      _$VolumeSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeSpecificationToJson(this);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
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
