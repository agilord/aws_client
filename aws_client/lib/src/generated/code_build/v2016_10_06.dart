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

/// CodeBuild is a fully managed build service in the cloud. CodeBuild compiles
/// your source code, runs unit tests, and produces artifacts that are ready to
/// deploy. CodeBuild eliminates the need to provision, manage, and scale your
/// own build servers. It provides prepackaged build environments for the most
/// popular programming languages and build tools, such as Apache Maven, Gradle,
/// and more. You can also fully customize build environments in CodeBuild to
/// use your own build tools. CodeBuild scales automatically to meet peak build
/// requests. You pay only for the build time you consume. For more information
/// about CodeBuild, see the <i> <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html">CodeBuild
/// User Guide</a>.</i>
class CodeBuild {
  final _s.JsonProtocol _protocol;
  CodeBuild({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codebuild',
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

  /// Deletes one or more builds.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [ids] :
  /// The IDs of the builds to delete.
  Future<BatchDeleteBuildsOutput> batchDeleteBuilds({
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchDeleteBuilds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
      },
    );

    return BatchDeleteBuildsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves information about one or more batch builds.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [ids] :
  /// An array that contains the batch build identifiers to retrieve.
  Future<BatchGetBuildBatchesOutput> batchGetBuildBatches({
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetBuildBatches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
      },
    );

    return BatchGetBuildBatchesOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more builds.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [ids] :
  /// The IDs of the builds.
  Future<BatchGetBuildsOutput> batchGetBuilds({
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetBuilds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
      },
    );

    return BatchGetBuildsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more compute fleets.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [names] :
  /// The names or ARNs of the compute fleets.
  Future<BatchGetFleetsOutput> batchGetFleets({
    required List<String> names,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetFleets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'names': names,
      },
    );

    return BatchGetFleetsOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about one or more build projects.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [names] :
  /// The names or ARNs of the build projects. To get information about a
  /// project shared with your Amazon Web Services account, its ARN must be
  /// specified. You cannot specify a shared project using its name.
  Future<BatchGetProjectsOutput> batchGetProjects({
    required List<String> names,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'names': names,
      },
    );

    return BatchGetProjectsOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of report groups.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [reportGroupArns] :
  /// An array of report group ARNs that identify the report groups to return.
  Future<BatchGetReportGroupsOutput> batchGetReportGroups({
    required List<String> reportGroupArns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetReportGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportGroupArns': reportGroupArns,
      },
    );

    return BatchGetReportGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of reports.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [reportArns] :
  /// An array of ARNs that identify the <code>Report</code> objects to return.
  Future<BatchGetReportsOutput> batchGetReports({
    required List<String> reportArns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.BatchGetReports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportArns': reportArns,
      },
    );

    return BatchGetReportsOutput.fromJson(jsonResponse.body);
  }

  /// Creates a compute fleet.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [baseCapacity] :
  /// The initial number of machines allocated to the ﬂeet, which deﬁnes the
  /// number of builds that can run in parallel.
  ///
  /// Parameter [computeType] :
  /// Information about the compute resources the compute fleet uses. Available
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL</code>: Use up to 3 GB memory and 2 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM</code>: Use up to 7 GB memory and 4 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE</code>: Use up to 16 GB memory and 8 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_XLARGE</code>: Use up to 70 GB memory and 36 vCPUs
  /// for builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs,
  /// and 824 GB of SSD storage for builds. This compute type supports Docker
  /// images up to 100 GB uncompressed.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_SMALL</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 3 GB
  /// memory and 2 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to
  /// 16 GB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 4 GB
  /// memory and 2 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_LARGE</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 15 GB
  /// memory and 8 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to
  /// 255 GB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 16 GB
  /// memory and 8 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild User Guide.</i>
  ///
  /// Parameter [environmentType] :
  /// The environment type of the compute fleet.
  ///
  /// <ul>
  /// <li>
  /// The environment type <code>ARM_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific
  /// (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and South America (São
  /// Paulo).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore),
  /// Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific
  /// (Mumbai).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific
  /// (Sydney).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2019_CONTAINER</code> is
  /// available only in regions US East (N. Virginia), US East (Ohio), US West
  /// (Oregon), Asia Pacific (Sydney), Asia Pacific (Tokyo), Asia Pacific
  /// (Mumbai) and EU (Ireland).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2022_CONTAINER</code> is
  /// available only in regions US East (N. Virginia), US East (Ohio), US West
  /// (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Sydney), Asia
  /// Pacific (Singapore), Asia Pacific (Tokyo), South America (São Paulo) and
  /// Asia Pacific (Mumbai).
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild user guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the compute fleet.
  ///
  /// Parameter [fleetServiceRole] :
  /// The service role associated with the compute fleet. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html">
  /// Allow a user to add a permission policy for a fleet service role</a> in
  /// the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [overflowBehavior] :
  /// The compute fleet overflow behavior.
  ///
  /// <ul>
  /// <li>
  /// For overflow behavior <code>QUEUE</code>, your overflow builds need to
  /// wait on the existing fleet instance to become available.
  /// </li>
  /// <li>
  /// For overflow behavior <code>ON_DEMAND</code>, your overflow builds run on
  /// CodeBuild on-demand.
  /// <note>
  /// If you choose to set your overflow behavior to on-demand while creating a
  /// VPC-connected fleet, make sure that you add the required VPC permissions
  /// to your project service role. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface">Example
  /// policy statement to allow CodeBuild access to Amazon Web Services services
  /// required to create a VPC network interface</a>.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [scalingConfiguration] :
  /// The scaling configuration of the compute fleet.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs associated with this compute fleet.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  Future<CreateFleetOutput> createFleet({
    required int baseCapacity,
    required ComputeType computeType,
    required EnvironmentType environmentType,
    required String name,
    String? fleetServiceRole,
    FleetOverflowBehavior? overflowBehavior,
    ScalingConfigurationInput? scalingConfiguration,
    List<Tag>? tags,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'baseCapacity',
      baseCapacity,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.CreateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'baseCapacity': baseCapacity,
        'computeType': computeType.toValue(),
        'environmentType': environmentType.toValue(),
        'name': name,
        if (fleetServiceRole != null) 'fleetServiceRole': fleetServiceRole,
        if (overflowBehavior != null)
          'overflowBehavior': overflowBehavior.toValue(),
        if (scalingConfiguration != null)
          'scalingConfiguration': scalingConfiguration,
        if (tags != null) 'tags': tags,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return CreateFleetOutput.fromJson(jsonResponse.body);
  }

  /// Creates a build project.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [artifacts] :
  /// Information about the build output artifacts for the build project.
  ///
  /// Parameter [environment] :
  /// Information about the build environment for the build project.
  ///
  /// Parameter [name] :
  /// The name of the build project.
  ///
  /// Parameter [serviceRole] :
  /// The ARN of the IAM role that enables CodeBuild to interact with dependent
  /// Amazon Web Services services on behalf of the Amazon Web Services account.
  ///
  /// Parameter [source] :
  /// Information about the build input source code for the build project.
  ///
  /// Parameter [badgeEnabled] :
  /// Set this to true to generate a publicly accessible URL for your project's
  /// build badge.
  ///
  /// Parameter [buildBatchConfig] :
  /// A <a>ProjectBuildBatchConfig</a> object that defines the batch build
  /// options for the project.
  ///
  /// Parameter [cache] :
  /// Stores recently used information so that it can be quickly accessed at a
  /// later time.
  ///
  /// Parameter [concurrentBuildLimit] :
  /// The maximum number of concurrent builds that are allowed for this project.
  ///
  /// New builds are only started if the current number of builds is less than
  /// or equal to this limit. If the current build count meets this limit, new
  /// builds are throttled and are not run.
  ///
  /// Parameter [description] :
  /// A description that makes the build project easy to identify.
  ///
  /// Parameter [encryptionKey] :
  /// The Key Management Service customer master key (CMK) to be used for
  /// encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts
  /// if your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  ///
  /// Parameter [fileSystemLocations] :
  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies
  /// the <code>identifier</code>, <code>location</code>,
  /// <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code>
  /// of a file system created using Amazon Elastic File System.
  ///
  /// Parameter [logsConfig] :
  /// Information about logs for the build project. These can be logs in
  /// CloudWatch Logs, logs uploaded to a specified S3 bucket, or both.
  ///
  /// Parameter [queuedTimeoutInMinutes] :
  /// The number of minutes a build is allowed to be queued before it times out.
  ///
  /// Parameter [secondaryArtifacts] :
  /// An array of <code>ProjectArtifacts</code> objects.
  ///
  /// Parameter [secondarySourceVersions] :
  /// An array of <code>ProjectSourceVersion</code> objects. If
  /// <code>secondarySourceVersions</code> is specified at the build level, then
  /// they take precedence over these <code>secondarySourceVersions</code> (at
  /// the project level).
  ///
  /// Parameter [secondarySources] :
  /// An array of <code>ProjectSource</code> objects.
  ///
  /// Parameter [sourceVersion] :
  /// A version of the build input to be built for this project. If not
  /// specified, the latest version is used. If specified, it must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For GitLab: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build
  /// input ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs associated with this build project.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  ///
  /// Parameter [timeoutInMinutes] :
  /// How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait
  /// before it times out any build that has not been marked as completed. The
  /// default is 60 minutes.
  ///
  /// Parameter [vpcConfig] :
  /// VpcConfig enables CodeBuild to access resources in an Amazon VPC.
  /// <note>
  /// If you're using compute fleets during project creation, do not provide
  /// vpcConfig.
  /// </note>
  Future<CreateProjectOutput> createProject({
    required ProjectArtifacts artifacts,
    required ProjectEnvironment environment,
    required String name,
    required String serviceRole,
    required ProjectSource source,
    bool? badgeEnabled,
    ProjectBuildBatchConfig? buildBatchConfig,
    ProjectCache? cache,
    int? concurrentBuildLimit,
    String? description,
    String? encryptionKey,
    List<ProjectFileSystemLocation>? fileSystemLocations,
    LogsConfig? logsConfig,
    int? queuedTimeoutInMinutes,
    List<ProjectArtifacts>? secondaryArtifacts,
    List<ProjectSourceVersion>? secondarySourceVersions,
    List<ProjectSource>? secondarySources,
    String? sourceVersion,
    List<Tag>? tags,
    int? timeoutInMinutes,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'queuedTimeoutInMinutes',
      queuedTimeoutInMinutes,
      5,
      480,
    );
    _s.validateNumRange(
      'timeoutInMinutes',
      timeoutInMinutes,
      5,
      2160,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.CreateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'artifacts': artifacts,
        'environment': environment,
        'name': name,
        'serviceRole': serviceRole,
        'source': source,
        if (badgeEnabled != null) 'badgeEnabled': badgeEnabled,
        if (buildBatchConfig != null) 'buildBatchConfig': buildBatchConfig,
        if (cache != null) 'cache': cache,
        if (concurrentBuildLimit != null)
          'concurrentBuildLimit': concurrentBuildLimit,
        if (description != null) 'description': description,
        if (encryptionKey != null) 'encryptionKey': encryptionKey,
        if (fileSystemLocations != null)
          'fileSystemLocations': fileSystemLocations,
        if (logsConfig != null) 'logsConfig': logsConfig,
        if (queuedTimeoutInMinutes != null)
          'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
        if (secondaryArtifacts != null)
          'secondaryArtifacts': secondaryArtifacts,
        if (secondarySourceVersions != null)
          'secondarySourceVersions': secondarySourceVersions,
        if (secondarySources != null) 'secondarySources': secondarySources,
        if (sourceVersion != null) 'sourceVersion': sourceVersion,
        if (tags != null) 'tags': tags,
        if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return CreateProjectOutput.fromJson(jsonResponse.body);
  }

  /// Creates a report group. A report group contains a collection of reports.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [exportConfig] :
  /// A <code>ReportExportConfig</code> object that contains information about
  /// where the report group test results are exported.
  ///
  /// Parameter [name] :
  /// The name of the report group.
  ///
  /// Parameter [type] :
  /// The type of report group.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs associated with this report group.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild report group tags.
  Future<CreateReportGroupOutput> createReportGroup({
    required ReportExportConfig exportConfig,
    required String name,
    required ReportType type,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.CreateReportGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'exportConfig': exportConfig,
        'name': name,
        'type': type.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateReportGroupOutput.fromJson(jsonResponse.body);
  }

  /// For an existing CodeBuild build project that has its source code stored in
  /// a GitHub or Bitbucket repository, enables CodeBuild to start rebuilding
  /// the source code every time a code change is pushed to the repository.
  /// <important>
  /// If you enable webhooks for an CodeBuild project, and the project is used
  /// as a build step in CodePipeline, then two identical builds are created for
  /// each commit. One build is triggered through webhooks, and one through
  /// CodePipeline. Because billing is on a per-build basis, you are billed for
  /// both builds. Therefore, if you are using CodePipeline, we recommend that
  /// you disable webhooks in CodeBuild. In the CodeBuild console, clear the
  /// Webhook box. For more information, see step 5 in <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console">Change
  /// a Build Project's Settings</a>.
  /// </important>
  ///
  /// May throw [InvalidInputException].
  /// May throw [OAuthProviderException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild project.
  ///
  /// Parameter [branchFilter] :
  /// A regular expression used to determine which repository branches are built
  /// when a webhook is triggered. If the name of a branch matches the regular
  /// expression, then it is built. If <code>branchFilter</code> is empty, then
  /// all branches are built.
  /// <note>
  /// It is recommended that you use <code>filterGroups</code> instead of
  /// <code>branchFilter</code>.
  /// </note>
  ///
  /// Parameter [buildType] :
  /// Specifies the type of build this webhook will trigger.
  ///
  /// Parameter [filterGroups] :
  /// An array of arrays of <code>WebhookFilter</code> objects used to determine
  /// which webhooks are triggered. At least one <code>WebhookFilter</code> in
  /// the array must specify <code>EVENT</code> as its <code>type</code>.
  ///
  /// For a build to be triggered, at least one filter group in the
  /// <code>filterGroups</code> array must pass. For a filter group to pass,
  /// each of its filters must pass.
  ///
  /// Parameter [manualCreation] :
  /// If manualCreation is true, CodeBuild doesn't create a webhook in GitHub
  /// and instead returns <code>payloadUrl</code> and <code>secret</code> values
  /// for the webhook. The <code>payloadUrl</code> and <code>secret</code>
  /// values in the output can be used to manually create a webhook within
  /// GitHub.
  /// <note>
  /// <code>manualCreation</code> is only available for GitHub webhooks.
  /// </note>
  Future<CreateWebhookOutput> createWebhook({
    required String projectName,
    String? branchFilter,
    WebhookBuildType? buildType,
    List<List<WebhookFilter>>? filterGroups,
    bool? manualCreation,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.CreateWebhook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
        if (branchFilter != null) 'branchFilter': branchFilter,
        if (buildType != null) 'buildType': buildType.toValue(),
        if (filterGroups != null) 'filterGroups': filterGroups,
        if (manualCreation != null) 'manualCreation': manualCreation,
      },
    );

    return CreateWebhookOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a batch build.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [id] :
  /// The identifier of the batch build to delete.
  Future<DeleteBuildBatchOutput> deleteBuildBatch({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteBuildBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return DeleteBuildBatchOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a compute fleet. When you delete a compute fleet, its builds are
  /// not deleted.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the compute fleet.
  Future<void> deleteFleet({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteFleet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a build project. When you delete a project, its builds are not
  /// deleted.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [name] :
  /// The name of the build project.
  Future<void> deleteProject({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteProject'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes a report.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the report to delete.
  Future<void> deleteReport({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteReport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );
  }

  /// Deletes a report group. Before you delete a report group, you must delete
  /// its reports.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the report group to delete.
  ///
  /// Parameter [deleteReports] :
  /// If <code>true</code>, deletes any reports that belong to a report group
  /// before deleting the report group.
  ///
  /// If <code>false</code>, you must delete any reports in the report group.
  /// Use <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_ListReportsForReportGroup.html">ListReportsForReportGroup</a>
  /// to get the reports in a report group. Use <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/APIReference/API_DeleteReport.html">DeleteReport</a>
  /// to delete the reports. If you call <code>DeleteReportGroup</code> for a
  /// report group that contains one or more reports, an exception is thrown.
  Future<void> deleteReportGroup({
    required String arn,
    bool? deleteReports,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteReportGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (deleteReports != null) 'deleteReports': deleteReports,
      },
    );
  }

  /// Deletes a resource policy that is identified by its resource ARN.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that is associated with the resource policy.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );
  }

  /// Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source
  /// credentials.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the token.
  Future<DeleteSourceCredentialsOutput> deleteSourceCredentials({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteSourceCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return DeleteSourceCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// For an existing CodeBuild build project that has its source code stored in
  /// a GitHub or Bitbucket repository, stops CodeBuild from rebuilding the
  /// source code every time a code change is pushed to the repository.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OAuthProviderException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild project.
  Future<void> deleteWebhook({
    required String projectName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteWebhook'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
      },
    );
  }

  /// Retrieves one or more code coverage reports.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [reportArn] :
  /// The ARN of the report for which test cases are returned.
  ///
  /// Parameter [maxLineCoveragePercentage] :
  /// The maximum line coverage percentage to report.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [minLineCoveragePercentage] :
  /// The minimum line coverage percentage to report.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous call to
  /// <code>DescribeCodeCoverages</code>. This specifies the next item to
  /// return. To return the beginning of the list, exclude this parameter.
  ///
  /// Parameter [sortBy] :
  /// Specifies how the results are sorted. Possible values are:
  /// <dl> <dt>FILE_PATH</dt> <dd>
  /// The results are sorted by file path.
  /// </dd> <dt>LINE_COVERAGE_PERCENTAGE</dt> <dd>
  /// The results are sorted by the percentage of lines that are covered.
  /// </dd> </dl>
  ///
  /// Parameter [sortOrder] :
  /// Specifies if the results are sorted in ascending or descending order.
  Future<DescribeCodeCoveragesOutput> describeCodeCoverages({
    required String reportArn,
    double? maxLineCoveragePercentage,
    int? maxResults,
    double? minLineCoveragePercentage,
    String? nextToken,
    ReportCodeCoverageSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxLineCoveragePercentage',
      maxLineCoveragePercentage,
      0,
      100,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'minLineCoveragePercentage',
      minLineCoveragePercentage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DescribeCodeCoverages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportArn': reportArn,
        if (maxLineCoveragePercentage != null)
          'maxLineCoveragePercentage': maxLineCoveragePercentage,
        if (maxResults != null) 'maxResults': maxResults,
        if (minLineCoveragePercentage != null)
          'minLineCoveragePercentage': minLineCoveragePercentage,
        if (nextToken != null) 'nextToken': nextToken,
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return DescribeCodeCoveragesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of details about test cases for a report.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [reportArn] :
  /// The ARN of the report for which test cases are returned.
  ///
  /// Parameter [filter] :
  /// A <code>TestCaseFilter</code> object used to filter the returned reports.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated test cases returned per response. Use
  /// <code>nextToken</code> to iterate pages in the list of returned
  /// <code>TestCase</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  Future<DescribeTestCasesOutput> describeTestCases({
    required String reportArn,
    TestCaseFilter? filter,
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
      'X-Amz-Target': 'CodeBuild_20161006.DescribeTestCases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportArn': reportArn,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeTestCasesOutput.fromJson(jsonResponse.body);
  }

  /// Analyzes and accumulates test report values for the specified test
  /// reports.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [reportGroupArn] :
  /// The ARN of the report group that contains the reports to analyze.
  ///
  /// Parameter [trendField] :
  /// The test report value to accumulate. This must be one of the following
  /// values:
  /// <dl> <dt>Test reports:</dt> <dd> <dl> <dt>DURATION</dt> <dd>
  /// Accumulate the test run times for the specified reports.
  /// </dd> <dt>PASS_RATE</dt> <dd>
  /// Accumulate the percentage of tests that passed for the specified test
  /// reports.
  /// </dd> <dt>TOTAL</dt> <dd>
  /// Accumulate the total number of tests for the specified test reports.
  /// </dd> </dl> </dd> </dl> <dl> <dt>Code coverage reports:</dt> <dd> <dl>
  /// <dt>BRANCH_COVERAGE</dt> <dd>
  /// Accumulate the branch coverage percentages for the specified test reports.
  /// </dd> <dt>BRANCHES_COVERED</dt> <dd>
  /// Accumulate the branches covered values for the specified test reports.
  /// </dd> <dt>BRANCHES_MISSED</dt> <dd>
  /// Accumulate the branches missed values for the specified test reports.
  /// </dd> <dt>LINE_COVERAGE</dt> <dd>
  /// Accumulate the line coverage percentages for the specified test reports.
  /// </dd> <dt>LINES_COVERED</dt> <dd>
  /// Accumulate the lines covered values for the specified test reports.
  /// </dd> <dt>LINES_MISSED</dt> <dd>
  /// Accumulate the lines not covered values for the specified test reports.
  /// </dd> </dl> </dd> </dl>
  ///
  /// Parameter [numOfReports] :
  /// The number of reports to analyze. This operation always retrieves the most
  /// recent reports.
  ///
  /// If this parameter is omitted, the most recent 100 reports are analyzed.
  Future<GetReportGroupTrendOutput> getReportGroupTrend({
    required String reportGroupArn,
    required ReportGroupTrendFieldType trendField,
    int? numOfReports,
  }) async {
    _s.validateNumRange(
      'numOfReports',
      numOfReports,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.GetReportGroupTrend'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportGroupArn': reportGroupArn,
        'trendField': trendField.toValue(),
        if (numOfReports != null) 'numOfReports': numOfReports,
      },
    );

    return GetReportGroupTrendOutput.fromJson(jsonResponse.body);
  }

  /// Gets a resource policy that is identified by its resource ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that is associated with the resource policy.
  Future<GetResourcePolicyOutput> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.GetResourcePolicy'
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

    return GetResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Imports the source repository credentials for an CodeBuild project that
  /// has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket
  /// repository.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccountLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [authType] :
  /// The type of authentication used to connect to a GitHub, GitHub Enterprise,
  /// GitLab, GitLab Self Managed, or Bitbucket repository. An OAUTH connection
  /// is not supported by the API and must be created using the CodeBuild
  /// console. Note that CODECONNECTIONS is only valid for GitLab and GitLab
  /// Self Managed.
  ///
  /// Parameter [serverType] :
  /// The source provider used for this project.
  ///
  /// Parameter [token] :
  /// For GitHub or GitHub Enterprise, this is the personal access token. For
  /// Bitbucket, this is either the access token or the app password. For the
  /// <code>authType</code> CODECONNECTIONS, this is the
  /// <code>connectionArn</code>.
  ///
  /// Parameter [shouldOverwrite] :
  /// Set to <code>false</code> to prevent overwriting the repository source
  /// credentials. Set to <code>true</code> to overwrite the repository source
  /// credentials. The default value is <code>true</code>.
  ///
  /// Parameter [username] :
  /// The Bitbucket username when the <code>authType</code> is BASIC_AUTH. This
  /// parameter is not valid for other types of source providers or connections.
  Future<ImportSourceCredentialsOutput> importSourceCredentials({
    required AuthType authType,
    required ServerType serverType,
    required String token,
    bool? shouldOverwrite,
    String? username,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ImportSourceCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'authType': authType.toValue(),
        'serverType': serverType.toValue(),
        'token': token,
        if (shouldOverwrite != null) 'shouldOverwrite': shouldOverwrite,
        if (username != null) 'username': username,
      },
    );

    return ImportSourceCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Resets the cache for a project.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild build project that the cache is reset for.
  Future<void> invalidateProjectCache({
    required String projectName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.InvalidateProjectCache'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
      },
    );
  }

  /// Retrieves the identifiers of your build batches in the current region.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filter] :
  /// A <code>BuildBatchFilter</code> object that specifies the filters for the
  /// search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous call to
  /// <code>ListBuildBatches</code>. This specifies the next item to return. To
  /// return the beginning of the list, exclude this parameter.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order of the returned items. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List the batch build identifiers in ascending
  /// order by identifier.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List the batch build identifiers in descending
  /// order by identifier.
  /// </li>
  /// </ul>
  Future<ListBuildBatchesOutput> listBuildBatches({
    BuildBatchFilter? filter,
    int? maxResults,
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListBuildBatches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListBuildBatchesOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the identifiers of the build batches for a specific project.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filter] :
  /// A <code>BuildBatchFilter</code> object that specifies the filters for the
  /// search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous call to
  /// <code>ListBuildBatchesForProject</code>. This specifies the next item to
  /// return. To return the beginning of the list, exclude this parameter.
  ///
  /// Parameter [projectName] :
  /// The name of the project.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order of the returned items. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List the batch build identifiers in ascending
  /// order by identifier.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List the batch build identifiers in descending
  /// order by identifier.
  /// </li>
  /// </ul>
  Future<ListBuildBatchesForProjectOutput> listBuildBatchesForProject({
    BuildBatchFilter? filter,
    int? maxResults,
    String? nextToken,
    String? projectName,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListBuildBatchesForProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (projectName != null) 'projectName': projectName,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListBuildBatchesForProjectOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of build IDs, with each build ID representing a single build.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 100 items in the list, only
  /// the first 100 items are returned, along with a unique string called a
  /// <i>nextToken</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// Parameter [sortOrder] :
  /// The order to list build IDs. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List the build IDs in ascending order by build ID.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List the build IDs in descending order by build
  /// ID.
  /// </li>
  /// </ul>
  Future<ListBuildsOutput> listBuilds({
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListBuilds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListBuildsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of build identifiers for the specified build project, with
  /// each build identifier representing a single build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild project.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 100 items in the list, only
  /// the first 100 items are returned, along with a unique string called a
  /// <i>nextToken</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// Parameter [sortOrder] :
  /// The order to sort the results in. The results are sorted by build number,
  /// not the build identifier. If this is not specified, the results are sorted
  /// in descending order.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List the build identifiers in ascending order, by
  /// build number.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List the build identifiers in descending order,
  /// by build number.
  /// </li>
  /// </ul>
  /// If the project has more than 100 builds, setting the sort order will
  /// result in an error.
  Future<ListBuildsForProjectOutput> listBuildsForProject({
    required String projectName,
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListBuildsForProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
        if (nextToken != null) 'nextToken': nextToken,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListBuildsForProjectOutput.fromJson(jsonResponse.body);
  }

  /// Gets information about Docker images that are managed by CodeBuild.
  Future<ListCuratedEnvironmentImagesOutput>
      listCuratedEnvironmentImages() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListCuratedEnvironmentImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ListCuratedEnvironmentImagesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of compute fleet names with each compute fleet name
  /// representing a single compute fleet.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated compute fleets returned per response. Use
  /// <code>nextToken</code> to iterate pages in the list of returned compute
  /// fleets.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 100 items in the list, only
  /// the first 100 items are returned, along with a unique string called a
  /// <i>nextToken</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// Parameter [sortBy] :
  /// The criterion to be used to list compute fleet names. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED_TIME</code>: List based on when each compute fleet was
  /// created.
  /// </li>
  /// <li>
  /// <code>LAST_MODIFIED_TIME</code>: List based on when information about each
  /// compute fleet was last changed.
  /// </li>
  /// <li>
  /// <code>NAME</code>: List based on each compute fleet's name.
  /// </li>
  /// </ul>
  /// Use <code>sortOrder</code> to specify in what order to list the compute
  /// fleet names based on the preceding criteria.
  ///
  /// Parameter [sortOrder] :
  /// The order in which to list compute fleets. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List in ascending order.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List in descending order.
  /// </li>
  /// </ul>
  /// Use <code>sortBy</code> to specify the criterion to be used to list
  /// compute fleet names.
  Future<ListFleetsOutput> listFleets({
    int? maxResults,
    String? nextToken,
    FleetSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListFleets'
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
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListFleetsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of build project names, with each build project name
  /// representing a single build project.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [nextToken] :
  /// During a previous call, if there are more than 100 items in the list, only
  /// the first 100 items are returned, along with a unique string called a
  /// <i>nextToken</i>. To get the next batch of items in the list, call this
  /// operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// Parameter [sortBy] :
  /// The criterion to be used to list build project names. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED_TIME</code>: List based on when each build project was
  /// created.
  /// </li>
  /// <li>
  /// <code>LAST_MODIFIED_TIME</code>: List based on when information about each
  /// build project was last changed.
  /// </li>
  /// <li>
  /// <code>NAME</code>: List based on each build project's name.
  /// </li>
  /// </ul>
  /// Use <code>sortOrder</code> to specify in what order to list the build
  /// project names based on the preceding criteria.
  ///
  /// Parameter [sortOrder] :
  /// The order in which to list build projects. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List in ascending order.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List in descending order.
  /// </li>
  /// </ul>
  /// Use <code>sortBy</code> to specify the criterion to be used to list build
  /// project names.
  Future<ListProjectsOutput> listProjects({
    String? nextToken,
    ProjectSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListProjects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'nextToken': nextToken,
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListProjectsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list ARNs for the report groups in the current Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated report groups returned per response. Use
  /// <code>nextToken</code> to iterate pages in the list of returned
  /// <code>ReportGroup</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  ///
  /// Parameter [sortBy] :
  /// The criterion to be used to list build report groups. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED_TIME</code>: List based on when each report group was
  /// created.
  /// </li>
  /// <li>
  /// <code>LAST_MODIFIED_TIME</code>: List based on when each report group was
  /// last changed.
  /// </li>
  /// <li>
  /// <code>NAME</code>: List based on each report group's name.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// Used to specify the order to sort the list of returned report groups.
  /// Valid values are <code>ASCENDING</code> and <code>DESCENDING</code>.
  Future<ListReportGroupsOutput> listReportGroups({
    int? maxResults,
    String? nextToken,
    ReportGroupSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListReportGroups'
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
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListReportGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of ARNs for the reports in the current Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filter] :
  /// A <code>ReportFilter</code> object used to filter the returned reports.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated reports returned per response. Use
  /// <code>nextToken</code> to iterate pages in the list of returned
  /// <code>Report</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the sort order for the list of returned reports. Valid values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: return reports in chronological order based on
  /// their creation date.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: return reports in the reverse chronological order
  /// based on their creation date.
  /// </li>
  /// </ul>
  Future<ListReportsOutput> listReports({
    ReportFilter? filter,
    int? maxResults,
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListReports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListReportsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of ARNs for the reports that belong to a
  /// <code>ReportGroup</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [reportGroupArn] :
  /// The ARN of the report group for which you want to return report ARNs.
  ///
  /// Parameter [filter] :
  /// A <code>ReportFilter</code> object used to filter the returned reports.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated reports in this report group returned per
  /// response. Use <code>nextToken</code> to iterate pages in the list of
  /// returned <code>Report</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  ///
  /// Parameter [sortOrder] :
  /// Use to specify whether the results are returned in ascending or descending
  /// order.
  Future<ListReportsForReportGroupOutput> listReportsForReportGroup({
    required String reportGroupArn,
    ReportFilter? filter,
    int? maxResults,
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListReportsForReportGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'reportGroupArn': reportGroupArn,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListReportsForReportGroupOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of projects that are shared with other Amazon Web Services
  /// accounts or users.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated shared build projects returned per
  /// response. Use <code>nextToken</code> to iterate pages in the list of
  /// returned <code>Project</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  ///
  /// Parameter [sortBy] :
  /// The criterion to be used to list build projects shared with the current
  /// Amazon Web Services account or user. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ARN</code>: List based on the ARN.
  /// </li>
  /// <li>
  /// <code>MODIFIED_TIME</code>: List based on when information about the
  /// shared project was last changed.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// The order in which to list shared build projects. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List in ascending order.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List in descending order.
  /// </li>
  /// </ul>
  Future<ListSharedProjectsOutput> listSharedProjects({
    int? maxResults,
    String? nextToken,
    SharedResourceSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListSharedProjects'
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
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListSharedProjectsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a list of report groups that are shared with other Amazon Web
  /// Services accounts or users.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of paginated shared report groups per response. Use
  /// <code>nextToken</code> to iterate pages in the list of returned
  /// <code>ReportGroup</code> objects. The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// During a previous call, the maximum number of items that can be returned
  /// is the value specified in <code>maxResults</code>. If there more items in
  /// the list, then a unique string called a <i>nextToken</i> is returned. To
  /// get the next batch of items in the list, call this operation again, adding
  /// the next token to the call. To get all of the items in the list, keep
  /// calling this operation with each subsequent next token that is returned,
  /// until no more next tokens are returned.
  ///
  /// Parameter [sortBy] :
  /// The criterion to be used to list report groups shared with the current
  /// Amazon Web Services account or user. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ARN</code>: List based on the ARN.
  /// </li>
  /// <li>
  /// <code>MODIFIED_TIME</code>: List based on when information about the
  /// shared report group was last changed.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// The order in which to list shared report groups. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ASCENDING</code>: List in ascending order.
  /// </li>
  /// <li>
  /// <code>DESCENDING</code>: List in descending order.
  /// </li>
  /// </ul>
  Future<ListSharedReportGroupsOutput> listSharedReportGroups({
    int? maxResults,
    String? nextToken,
    SharedResourceSortByType? sortBy,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListSharedReportGroups'
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
        if (sortBy != null) 'sortBy': sortBy.toValue(),
        if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      },
    );

    return ListSharedReportGroupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of <code>SourceCredentialsInfo</code> objects.
  ///
  /// May throw [InvalidInputException].
  Future<ListSourceCredentialsOutput> listSourceCredentials() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.ListSourceCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ListSourceCredentialsOutput.fromJson(jsonResponse.body);
  }

  /// Stores a resource policy for the ARN of a <code>Project</code> or
  /// <code>ReportGroup</code> object.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [policy] :
  /// A JSON-formatted resource policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/project-sharing.html#project-sharing-share">Sharing
  /// a Project</a> and <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/report-groups-sharing.html#report-groups-sharing-share">Sharing
  /// a Report Group</a> in the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the <code>Project</code> or <code>ReportGroup</code> resource
  /// you want to associate with a resource policy.
  Future<PutResourcePolicyOutput> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policy': policy,
        'resourceArn': resourceArn,
      },
    );

    return PutResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Restarts a build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [id] :
  /// Specifies the identifier of the build to restart.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case sensitive identifier you provide to ensure the idempotency
  /// of the <code>RetryBuild</code> request. The token is included in the
  /// <code>RetryBuild</code> request and is valid for five minutes. If you
  /// repeat the <code>RetryBuild</code> request with the same token, but change
  /// a parameter, CodeBuild returns a parameter mismatch error.
  Future<RetryBuildOutput> retryBuild({
    String? id,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.RetryBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (id != null) 'id': id,
        if (idempotencyToken != null) 'idempotencyToken': idempotencyToken,
      },
    );

    return RetryBuildOutput.fromJson(jsonResponse.body);
  }

  /// Restarts a failed batch build. Only batch builds that have failed can be
  /// retried.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// Specifies the identifier of the batch build to restart.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case sensitive identifier you provide to ensure the idempotency
  /// of the <code>RetryBuildBatch</code> request. The token is included in the
  /// <code>RetryBuildBatch</code> request and is valid for five minutes. If you
  /// repeat the <code>RetryBuildBatch</code> request with the same token, but
  /// change a parameter, CodeBuild returns a parameter mismatch error.
  ///
  /// Parameter [retryType] :
  /// Specifies the type of retry to perform.
  Future<RetryBuildBatchOutput> retryBuildBatch({
    String? id,
    String? idempotencyToken,
    RetryBuildBatchType? retryType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.RetryBuildBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (id != null) 'id': id,
        if (idempotencyToken != null) 'idempotencyToken': idempotencyToken,
        if (retryType != null) 'retryType': retryType.toValue(),
      },
    );

    return RetryBuildBatchOutput.fromJson(jsonResponse.body);
  }

  /// Starts running a build with the settings defined in the project. These
  /// setting include: how to run a build, where to get the source code, which
  /// build environment to use, which build commands to run, and where to store
  /// the build output.
  ///
  /// You can also start a build run by overriding some of the build settings in
  /// the project. The overrides only apply for that specific start build
  /// request. The settings in the project are unaltered.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild build project to start running a build.
  ///
  /// Parameter [artifactsOverride] :
  /// Build output artifact settings that override, for this build only, the
  /// latest ones already defined in the build project.
  ///
  /// Parameter [buildStatusConfigOverride] :
  /// Contains information that defines how the build project reports the build
  /// status to the source provider. This option is only used when the source
  /// provider is <code>GITHUB</code>, <code>GITHUB_ENTERPRISE</code>, or
  /// <code>BITBUCKET</code>.
  ///
  /// Parameter [buildspecOverride] :
  /// A buildspec file declaration that overrides the latest one defined in the
  /// build project, for this build only. The buildspec defined on the project
  /// is not changed.
  ///
  /// If this value is set, it can be either an inline buildspec definition, the
  /// path to an alternate buildspec file relative to the value of the built-in
  /// <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3
  /// bucket. The bucket must be in the same Amazon Web Services Region as the
  /// build project. Specify the buildspec file using its ARN (for example,
  /// <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this
  /// value is not provided or is set to an empty string, the source code must
  /// contain a buildspec file in its root directory. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec
  /// File Name and Storage Location</a>.
  /// <note>
  /// Since this property allows you to change the build commands that will run
  /// in the container, you should note that an IAM principal with the ability
  /// to call this API and set this parameter can override the default settings.
  /// Moreover, we encourage that you use a trustworthy buildspec location like
  /// a file in your source repository or a Amazon S3 bucket.
  /// </note>
  ///
  /// Parameter [cacheOverride] :
  /// A ProjectCache object specified for this build that overrides the one
  /// defined in the build project.
  ///
  /// Parameter [certificateOverride] :
  /// The name of a certificate for this build that overrides the one specified
  /// in the build project.
  ///
  /// Parameter [computeTypeOverride] :
  /// The name of a compute type for this build that overrides the one specified
  /// in the build project.
  ///
  /// Parameter [debugSessionEnabled] :
  /// Specifies if session debugging is enabled for this build. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html">Viewing
  /// a running build in Session Manager</a>.
  ///
  /// Parameter [encryptionKeyOverride] :
  /// The Key Management Service customer master key (CMK) that overrides the
  /// one specified in the build project. The CMK key encrypts the build output
  /// artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts
  /// if your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  ///
  /// Parameter [environmentTypeOverride] :
  /// A container type for this build that overrides the one specified in the
  /// build project.
  ///
  /// Parameter [environmentVariablesOverride] :
  /// A set of environment variables that overrides, for this build only, the
  /// latest ones already defined in the build project.
  ///
  /// Parameter [fleetOverride] :
  /// A ProjectFleet object specified for this build that overrides the one
  /// defined in the build project.
  ///
  /// Parameter [gitCloneDepthOverride] :
  /// The user-defined depth of history, with a minimum value of 0, that
  /// overrides, for this build only, any previous depth of history defined in
  /// the build project.
  ///
  /// Parameter [gitSubmodulesConfigOverride] :
  /// Information about the Git submodules configuration for this build of an
  /// CodeBuild build project.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case sensitive identifier you provide to ensure the idempotency
  /// of the StartBuild request. The token is included in the StartBuild request
  /// and is valid for 5 minutes. If you repeat the StartBuild request with the
  /// same token, but change a parameter, CodeBuild returns a parameter mismatch
  /// error.
  ///
  /// Parameter [imageOverride] :
  /// The name of an image for this build that overrides the one specified in
  /// the build project.
  ///
  /// Parameter [imagePullCredentialsTypeOverride] :
  /// The type of credentials CodeBuild uses to pull images in your build. There
  /// are two valid values:
  /// <dl> <dt>CODEBUILD</dt> <dd>
  /// Specifies that CodeBuild uses its own credentials. This requires that you
  /// modify your ECR repository policy to trust CodeBuild's service principal.
  /// </dd> <dt>SERVICE_ROLE</dt> <dd>
  /// Specifies that CodeBuild uses your build project's service role.
  /// </dd> </dl>
  /// When using a cross-account or private registry image, you must use
  /// <code>SERVICE_ROLE</code> credentials. When using an CodeBuild curated
  /// image, you must use <code>CODEBUILD</code> credentials.
  ///
  /// Parameter [insecureSslOverride] :
  /// Enable this flag to override the insecure SSL setting that is specified in
  /// the build project. The insecure SSL setting determines whether to ignore
  /// SSL warnings while connecting to the project source code. This override
  /// applies only if the build's source is GitHub Enterprise.
  ///
  /// Parameter [logsConfigOverride] :
  /// Log settings for this build that override the log settings defined in the
  /// build project.
  ///
  /// Parameter [privilegedModeOverride] :
  /// Enable this flag to override privileged mode in the build project.
  ///
  /// Parameter [queuedTimeoutInMinutesOverride] :
  /// The number of minutes a build is allowed to be queued before it times out.
  ///
  /// Parameter [registryCredentialOverride] :
  /// The credentials for access to a private registry.
  ///
  /// Parameter [reportBuildStatusOverride] :
  /// Set to true to report to your source provider the status of a build's
  /// start and completion. If you use this option with a source provider other
  /// than GitHub, GitHub Enterprise, or Bitbucket, an
  /// <code>invalidInputException</code> is thrown.
  ///
  /// To be able to report the build status to the source provider, the user
  /// associated with the source provider must have write access to the repo. If
  /// the user does not have write access, the build status cannot be updated.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens.html">Source
  /// provider access</a> in the <i>CodeBuild User Guide</i>.
  /// <note>
  /// The status of a build triggered by a webhook is always reported to your
  /// source provider.
  /// </note>
  ///
  /// Parameter [secondaryArtifactsOverride] :
  /// An array of <code>ProjectArtifacts</code> objects.
  ///
  /// Parameter [secondarySourcesOverride] :
  /// An array of <code>ProjectSource</code> objects.
  ///
  /// Parameter [secondarySourcesVersionOverride] :
  /// An array of <code>ProjectSourceVersion</code> objects that specify one or
  /// more versions of the project's secondary sources to be used for this build
  /// only.
  ///
  /// Parameter [serviceRoleOverride] :
  /// The name of a service role for this build that overrides the one specified
  /// in the build project.
  ///
  /// Parameter [sourceAuthOverride] :
  /// An authorization type for this build that overrides the one defined in the
  /// build project. This override applies only if the build project's source is
  /// BitBucket, GitHub, GitLab, or GitLab Self Managed.
  ///
  /// Parameter [sourceLocationOverride] :
  /// A location that overrides, for this build, the source location for the one
  /// defined in the build project.
  ///
  /// Parameter [sourceTypeOverride] :
  /// A source input type, for this build, that overrides the source input
  /// defined in the build project.
  ///
  /// Parameter [sourceVersion] :
  /// The version of the build input to be built, for this build only. If not
  /// specified, the latest version is used. If specified, the contents depends
  /// on the source provider:
  /// <dl> <dt>CodeCommit</dt> <dd>
  /// The commit ID, branch, or Git tag to use.
  /// </dd> <dt>GitHub</dt> <dd>
  /// The commit ID, pull request ID, branch name, or tag name that corresponds
  /// to the version of the source code you want to build. If a pull request ID
  /// is specified, it must use the format <code>pr/pull-request-ID</code> (for
  /// example <code>pr/25</code>). If a branch name is specified, the branch's
  /// HEAD commit ID is used. If not specified, the default branch's HEAD commit
  /// ID is used.
  /// </dd> <dt>GitLab</dt> <dd>
  /// The commit ID, branch, or Git tag to use.
  /// </dd> <dt>Bitbucket</dt> <dd>
  /// The commit ID, branch name, or tag name that corresponds to the version of
  /// the source code you want to build. If a branch name is specified, the
  /// branch's HEAD commit ID is used. If not specified, the default branch's
  /// HEAD commit ID is used.
  /// </dd> <dt>Amazon S3</dt> <dd>
  /// The version ID of the object that represents the build input ZIP file to
  /// use.
  /// </dd> </dl>
  /// If <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [timeoutInMinutesOverride] :
  /// The number of build timeout minutes, from 5 to 2160 (36 hours), that
  /// overrides, for this build only, the latest setting already defined in the
  /// build project.
  Future<StartBuildOutput> startBuild({
    required String projectName,
    ProjectArtifacts? artifactsOverride,
    BuildStatusConfig? buildStatusConfigOverride,
    String? buildspecOverride,
    ProjectCache? cacheOverride,
    String? certificateOverride,
    ComputeType? computeTypeOverride,
    bool? debugSessionEnabled,
    String? encryptionKeyOverride,
    EnvironmentType? environmentTypeOverride,
    List<EnvironmentVariable>? environmentVariablesOverride,
    ProjectFleet? fleetOverride,
    int? gitCloneDepthOverride,
    GitSubmodulesConfig? gitSubmodulesConfigOverride,
    String? idempotencyToken,
    String? imageOverride,
    ImagePullCredentialsType? imagePullCredentialsTypeOverride,
    bool? insecureSslOverride,
    LogsConfig? logsConfigOverride,
    bool? privilegedModeOverride,
    int? queuedTimeoutInMinutesOverride,
    RegistryCredential? registryCredentialOverride,
    bool? reportBuildStatusOverride,
    List<ProjectArtifacts>? secondaryArtifactsOverride,
    List<ProjectSource>? secondarySourcesOverride,
    List<ProjectSourceVersion>? secondarySourcesVersionOverride,
    String? serviceRoleOverride,
    SourceAuth? sourceAuthOverride,
    String? sourceLocationOverride,
    SourceType? sourceTypeOverride,
    String? sourceVersion,
    int? timeoutInMinutesOverride,
  }) async {
    _s.validateNumRange(
      'gitCloneDepthOverride',
      gitCloneDepthOverride,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'queuedTimeoutInMinutesOverride',
      queuedTimeoutInMinutesOverride,
      5,
      480,
    );
    _s.validateNumRange(
      'timeoutInMinutesOverride',
      timeoutInMinutesOverride,
      5,
      2160,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.StartBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
        if (artifactsOverride != null) 'artifactsOverride': artifactsOverride,
        if (buildStatusConfigOverride != null)
          'buildStatusConfigOverride': buildStatusConfigOverride,
        if (buildspecOverride != null) 'buildspecOverride': buildspecOverride,
        if (cacheOverride != null) 'cacheOverride': cacheOverride,
        if (certificateOverride != null)
          'certificateOverride': certificateOverride,
        if (computeTypeOverride != null)
          'computeTypeOverride': computeTypeOverride.toValue(),
        if (debugSessionEnabled != null)
          'debugSessionEnabled': debugSessionEnabled,
        if (encryptionKeyOverride != null)
          'encryptionKeyOverride': encryptionKeyOverride,
        if (environmentTypeOverride != null)
          'environmentTypeOverride': environmentTypeOverride.toValue(),
        if (environmentVariablesOverride != null)
          'environmentVariablesOverride': environmentVariablesOverride,
        if (fleetOverride != null) 'fleetOverride': fleetOverride,
        if (gitCloneDepthOverride != null)
          'gitCloneDepthOverride': gitCloneDepthOverride,
        if (gitSubmodulesConfigOverride != null)
          'gitSubmodulesConfigOverride': gitSubmodulesConfigOverride,
        if (idempotencyToken != null) 'idempotencyToken': idempotencyToken,
        if (imageOverride != null) 'imageOverride': imageOverride,
        if (imagePullCredentialsTypeOverride != null)
          'imagePullCredentialsTypeOverride':
              imagePullCredentialsTypeOverride.toValue(),
        if (insecureSslOverride != null)
          'insecureSslOverride': insecureSslOverride,
        if (logsConfigOverride != null)
          'logsConfigOverride': logsConfigOverride,
        if (privilegedModeOverride != null)
          'privilegedModeOverride': privilegedModeOverride,
        if (queuedTimeoutInMinutesOverride != null)
          'queuedTimeoutInMinutesOverride': queuedTimeoutInMinutesOverride,
        if (registryCredentialOverride != null)
          'registryCredentialOverride': registryCredentialOverride,
        if (reportBuildStatusOverride != null)
          'reportBuildStatusOverride': reportBuildStatusOverride,
        if (secondaryArtifactsOverride != null)
          'secondaryArtifactsOverride': secondaryArtifactsOverride,
        if (secondarySourcesOverride != null)
          'secondarySourcesOverride': secondarySourcesOverride,
        if (secondarySourcesVersionOverride != null)
          'secondarySourcesVersionOverride': secondarySourcesVersionOverride,
        if (serviceRoleOverride != null)
          'serviceRoleOverride': serviceRoleOverride,
        if (sourceAuthOverride != null)
          'sourceAuthOverride': sourceAuthOverride,
        if (sourceLocationOverride != null)
          'sourceLocationOverride': sourceLocationOverride,
        if (sourceTypeOverride != null)
          'sourceTypeOverride': sourceTypeOverride.toValue(),
        if (sourceVersion != null) 'sourceVersion': sourceVersion,
        if (timeoutInMinutesOverride != null)
          'timeoutInMinutesOverride': timeoutInMinutesOverride,
      },
    );

    return StartBuildOutput.fromJson(jsonResponse.body);
  }

  /// Starts a batch build for a project.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the project.
  ///
  /// Parameter [artifactsOverride] :
  /// An array of <code>ProjectArtifacts</code> objects that contains
  /// information about the build output artifact overrides for the build
  /// project.
  ///
  /// Parameter [buildBatchConfigOverride] :
  /// A <code>BuildBatchConfigOverride</code> object that contains batch build
  /// configuration overrides.
  ///
  /// Parameter [buildTimeoutInMinutesOverride] :
  /// Overrides the build timeout specified in the batch build project.
  ///
  /// Parameter [buildspecOverride] :
  /// A buildspec file declaration that overrides, for this build only, the
  /// latest one already defined in the build project.
  ///
  /// If this value is set, it can be either an inline buildspec definition, the
  /// path to an alternate buildspec file relative to the value of the built-in
  /// <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3
  /// bucket. The bucket must be in the same Amazon Web Services Region as the
  /// build project. Specify the buildspec file using its ARN (for example,
  /// <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this
  /// value is not provided or is set to an empty string, the source code must
  /// contain a buildspec file in its root directory. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec
  /// File Name and Storage Location</a>.
  ///
  /// Parameter [cacheOverride] :
  /// A <code>ProjectCache</code> object that specifies cache overrides.
  ///
  /// Parameter [certificateOverride] :
  /// The name of a certificate for this batch build that overrides the one
  /// specified in the batch build project.
  ///
  /// Parameter [computeTypeOverride] :
  /// The name of a compute type for this batch build that overrides the one
  /// specified in the batch build project.
  ///
  /// Parameter [debugSessionEnabled] :
  /// Specifies if session debugging is enabled for this batch build. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html">Viewing
  /// a running build in Session Manager</a>. Batch session debugging is not
  /// supported for matrix batch builds.
  ///
  /// Parameter [encryptionKeyOverride] :
  /// The Key Management Service customer master key (CMK) that overrides the
  /// one specified in the batch build project. The CMK key encrypts the build
  /// output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts
  /// if your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  ///
  /// Parameter [environmentTypeOverride] :
  /// A container type for this batch build that overrides the one specified in
  /// the batch build project.
  ///
  /// Parameter [environmentVariablesOverride] :
  /// An array of <code>EnvironmentVariable</code> objects that override, or add
  /// to, the environment variables defined in the batch build project.
  ///
  /// Parameter [gitCloneDepthOverride] :
  /// The user-defined depth of history, with a minimum value of 0, that
  /// overrides, for this batch build only, any previous depth of history
  /// defined in the batch build project.
  ///
  /// Parameter [gitSubmodulesConfigOverride] :
  /// A <code>GitSubmodulesConfig</code> object that overrides the Git
  /// submodules configuration for this batch build.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case sensitive identifier you provide to ensure the idempotency
  /// of the <code>StartBuildBatch</code> request. The token is included in the
  /// <code>StartBuildBatch</code> request and is valid for five minutes. If you
  /// repeat the <code>StartBuildBatch</code> request with the same token, but
  /// change a parameter, CodeBuild returns a parameter mismatch error.
  ///
  /// Parameter [imageOverride] :
  /// The name of an image for this batch build that overrides the one specified
  /// in the batch build project.
  ///
  /// Parameter [imagePullCredentialsTypeOverride] :
  /// The type of credentials CodeBuild uses to pull images in your batch build.
  /// There are two valid values:
  /// <dl> <dt>CODEBUILD</dt> <dd>
  /// Specifies that CodeBuild uses its own credentials. This requires that you
  /// modify your ECR repository policy to trust CodeBuild's service principal.
  /// </dd> <dt>SERVICE_ROLE</dt> <dd>
  /// Specifies that CodeBuild uses your build project's service role.
  /// </dd> </dl>
  /// When using a cross-account or private registry image, you must use
  /// <code>SERVICE_ROLE</code> credentials. When using an CodeBuild curated
  /// image, you must use <code>CODEBUILD</code> credentials.
  ///
  /// Parameter [insecureSslOverride] :
  /// Enable this flag to override the insecure SSL setting that is specified in
  /// the batch build project. The insecure SSL setting determines whether to
  /// ignore SSL warnings while connecting to the project source code. This
  /// override applies only if the build's source is GitHub Enterprise.
  ///
  /// Parameter [logsConfigOverride] :
  /// A <code>LogsConfig</code> object that override the log settings defined in
  /// the batch build project.
  ///
  /// Parameter [privilegedModeOverride] :
  /// Enable this flag to override privileged mode in the batch build project.
  ///
  /// Parameter [queuedTimeoutInMinutesOverride] :
  /// The number of minutes a batch build is allowed to be queued before it
  /// times out.
  ///
  /// Parameter [registryCredentialOverride] :
  /// A <code>RegistryCredential</code> object that overrides credentials for
  /// access to a private registry.
  ///
  /// Parameter [reportBuildBatchStatusOverride] :
  /// Set to <code>true</code> to report to your source provider the status of a
  /// batch build's start and completion. If you use this option with a source
  /// provider other than GitHub, GitHub Enterprise, or Bitbucket, an
  /// <code>invalidInputException</code> is thrown.
  /// <note>
  /// The status of a build triggered by a webhook is always reported to your
  /// source provider.
  /// </note>
  ///
  /// Parameter [secondaryArtifactsOverride] :
  /// An array of <code>ProjectArtifacts</code> objects that override the
  /// secondary artifacts defined in the batch build project.
  ///
  /// Parameter [secondarySourcesOverride] :
  /// An array of <code>ProjectSource</code> objects that override the secondary
  /// sources defined in the batch build project.
  ///
  /// Parameter [secondarySourcesVersionOverride] :
  /// An array of <code>ProjectSourceVersion</code> objects that override the
  /// secondary source versions in the batch build project.
  ///
  /// Parameter [serviceRoleOverride] :
  /// The name of a service role for this batch build that overrides the one
  /// specified in the batch build project.
  ///
  /// Parameter [sourceAuthOverride] :
  /// A <code>SourceAuth</code> object that overrides the one defined in the
  /// batch build project. This override applies only if the build project's
  /// source is BitBucket or GitHub.
  ///
  /// Parameter [sourceLocationOverride] :
  /// A location that overrides, for this batch build, the source location
  /// defined in the batch build project.
  ///
  /// Parameter [sourceTypeOverride] :
  /// The source input type that overrides the source input defined in the batch
  /// build project.
  ///
  /// Parameter [sourceVersion] :
  /// The version of the batch build input to be built, for this build only. If
  /// not specified, the latest version is used. If specified, the contents
  /// depends on the source provider:
  /// <dl> <dt>CodeCommit</dt> <dd>
  /// The commit ID, branch, or Git tag to use.
  /// </dd> <dt>GitHub</dt> <dd>
  /// The commit ID, pull request ID, branch name, or tag name that corresponds
  /// to the version of the source code you want to build. If a pull request ID
  /// is specified, it must use the format <code>pr/pull-request-ID</code> (for
  /// example <code>pr/25</code>). If a branch name is specified, the branch's
  /// HEAD commit ID is used. If not specified, the default branch's HEAD commit
  /// ID is used.
  /// </dd> <dt>Bitbucket</dt> <dd>
  /// The commit ID, branch name, or tag name that corresponds to the version of
  /// the source code you want to build. If a branch name is specified, the
  /// branch's HEAD commit ID is used. If not specified, the default branch's
  /// HEAD commit ID is used.
  /// </dd> <dt>Amazon S3</dt> <dd>
  /// The version ID of the object that represents the build input ZIP file to
  /// use.
  /// </dd> </dl>
  /// If <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  Future<StartBuildBatchOutput> startBuildBatch({
    required String projectName,
    ProjectArtifacts? artifactsOverride,
    ProjectBuildBatchConfig? buildBatchConfigOverride,
    int? buildTimeoutInMinutesOverride,
    String? buildspecOverride,
    ProjectCache? cacheOverride,
    String? certificateOverride,
    ComputeType? computeTypeOverride,
    bool? debugSessionEnabled,
    String? encryptionKeyOverride,
    EnvironmentType? environmentTypeOverride,
    List<EnvironmentVariable>? environmentVariablesOverride,
    int? gitCloneDepthOverride,
    GitSubmodulesConfig? gitSubmodulesConfigOverride,
    String? idempotencyToken,
    String? imageOverride,
    ImagePullCredentialsType? imagePullCredentialsTypeOverride,
    bool? insecureSslOverride,
    LogsConfig? logsConfigOverride,
    bool? privilegedModeOverride,
    int? queuedTimeoutInMinutesOverride,
    RegistryCredential? registryCredentialOverride,
    bool? reportBuildBatchStatusOverride,
    List<ProjectArtifacts>? secondaryArtifactsOverride,
    List<ProjectSource>? secondarySourcesOverride,
    List<ProjectSourceVersion>? secondarySourcesVersionOverride,
    String? serviceRoleOverride,
    SourceAuth? sourceAuthOverride,
    String? sourceLocationOverride,
    SourceType? sourceTypeOverride,
    String? sourceVersion,
  }) async {
    _s.validateNumRange(
      'buildTimeoutInMinutesOverride',
      buildTimeoutInMinutesOverride,
      5,
      2160,
    );
    _s.validateNumRange(
      'gitCloneDepthOverride',
      gitCloneDepthOverride,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'queuedTimeoutInMinutesOverride',
      queuedTimeoutInMinutesOverride,
      5,
      480,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.StartBuildBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
        if (artifactsOverride != null) 'artifactsOverride': artifactsOverride,
        if (buildBatchConfigOverride != null)
          'buildBatchConfigOverride': buildBatchConfigOverride,
        if (buildTimeoutInMinutesOverride != null)
          'buildTimeoutInMinutesOverride': buildTimeoutInMinutesOverride,
        if (buildspecOverride != null) 'buildspecOverride': buildspecOverride,
        if (cacheOverride != null) 'cacheOverride': cacheOverride,
        if (certificateOverride != null)
          'certificateOverride': certificateOverride,
        if (computeTypeOverride != null)
          'computeTypeOverride': computeTypeOverride.toValue(),
        if (debugSessionEnabled != null)
          'debugSessionEnabled': debugSessionEnabled,
        if (encryptionKeyOverride != null)
          'encryptionKeyOverride': encryptionKeyOverride,
        if (environmentTypeOverride != null)
          'environmentTypeOverride': environmentTypeOverride.toValue(),
        if (environmentVariablesOverride != null)
          'environmentVariablesOverride': environmentVariablesOverride,
        if (gitCloneDepthOverride != null)
          'gitCloneDepthOverride': gitCloneDepthOverride,
        if (gitSubmodulesConfigOverride != null)
          'gitSubmodulesConfigOverride': gitSubmodulesConfigOverride,
        if (idempotencyToken != null) 'idempotencyToken': idempotencyToken,
        if (imageOverride != null) 'imageOverride': imageOverride,
        if (imagePullCredentialsTypeOverride != null)
          'imagePullCredentialsTypeOverride':
              imagePullCredentialsTypeOverride.toValue(),
        if (insecureSslOverride != null)
          'insecureSslOverride': insecureSslOverride,
        if (logsConfigOverride != null)
          'logsConfigOverride': logsConfigOverride,
        if (privilegedModeOverride != null)
          'privilegedModeOverride': privilegedModeOverride,
        if (queuedTimeoutInMinutesOverride != null)
          'queuedTimeoutInMinutesOverride': queuedTimeoutInMinutesOverride,
        if (registryCredentialOverride != null)
          'registryCredentialOverride': registryCredentialOverride,
        if (reportBuildBatchStatusOverride != null)
          'reportBuildBatchStatusOverride': reportBuildBatchStatusOverride,
        if (secondaryArtifactsOverride != null)
          'secondaryArtifactsOverride': secondaryArtifactsOverride,
        if (secondarySourcesOverride != null)
          'secondarySourcesOverride': secondarySourcesOverride,
        if (secondarySourcesVersionOverride != null)
          'secondarySourcesVersionOverride': secondarySourcesVersionOverride,
        if (serviceRoleOverride != null)
          'serviceRoleOverride': serviceRoleOverride,
        if (sourceAuthOverride != null)
          'sourceAuthOverride': sourceAuthOverride,
        if (sourceLocationOverride != null)
          'sourceLocationOverride': sourceLocationOverride,
        if (sourceTypeOverride != null)
          'sourceTypeOverride': sourceTypeOverride.toValue(),
        if (sourceVersion != null) 'sourceVersion': sourceVersion,
      },
    );

    return StartBuildBatchOutput.fromJson(jsonResponse.body);
  }

  /// Attempts to stop running a build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the build.
  Future<StopBuildOutput> stopBuild({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.StopBuild'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return StopBuildOutput.fromJson(jsonResponse.body);
  }

  /// Stops a running batch build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The identifier of the batch build to stop.
  Future<StopBuildBatchOutput> stopBuildBatch({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.StopBuildBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return StopBuildBatchOutput.fromJson(jsonResponse.body);
  }

  /// Updates a compute fleet.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [arn] :
  /// The ARN of the compute fleet.
  ///
  /// Parameter [baseCapacity] :
  /// The initial number of machines allocated to the compute ﬂeet, which deﬁnes
  /// the number of builds that can run in parallel.
  ///
  /// Parameter [computeType] :
  /// Information about the compute resources the compute fleet uses. Available
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL</code>: Use up to 3 GB memory and 2 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM</code>: Use up to 7 GB memory and 4 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE</code>: Use up to 16 GB memory and 8 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_XLARGE</code>: Use up to 70 GB memory and 36 vCPUs
  /// for builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs,
  /// and 824 GB of SSD storage for builds. This compute type supports Docker
  /// images up to 100 GB uncompressed.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_SMALL</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 3 GB
  /// memory and 2 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to
  /// 16 GB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 4 GB
  /// memory and 2 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_LARGE</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 15 GB
  /// memory and 8 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to
  /// 255 GB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 16 GB
  /// memory and 8 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild User Guide.</i>
  ///
  /// Parameter [environmentType] :
  /// The environment type of the compute fleet.
  ///
  /// <ul>
  /// <li>
  /// The environment type <code>ARM_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific
  /// (Singapore), Asia Pacific (Sydney), EU (Frankfurt), and South America (São
  /// Paulo).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore),
  /// Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific
  /// (Mumbai).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific
  /// (Sydney).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2019_CONTAINER</code> is
  /// available only in regions US East (N. Virginia), US East (Ohio), US West
  /// (Oregon), Asia Pacific (Sydney), Asia Pacific (Tokyo), Asia Pacific
  /// (Mumbai) and EU (Ireland).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2022_CONTAINER</code> is
  /// available only in regions US East (N. Virginia), US East (Ohio), US West
  /// (Oregon), EU (Ireland), EU (Frankfurt), Asia Pacific (Sydney), Asia
  /// Pacific (Singapore), Asia Pacific (Tokyo), South America (São Paulo) and
  /// Asia Pacific (Mumbai).
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild user guide</i>.
  ///
  /// Parameter [fleetServiceRole] :
  /// The service role associated with the compute fleet. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html">
  /// Allow a user to add a permission policy for a fleet service role</a> in
  /// the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [overflowBehavior] :
  /// The compute fleet overflow behavior.
  ///
  /// <ul>
  /// <li>
  /// For overflow behavior <code>QUEUE</code>, your overflow builds need to
  /// wait on the existing fleet instance to become available.
  /// </li>
  /// <li>
  /// For overflow behavior <code>ON_DEMAND</code>, your overflow builds run on
  /// CodeBuild on-demand.
  /// <note>
  /// If you choose to set your overflow behavior to on-demand while creating a
  /// VPC-connected fleet, make sure that you add the required VPC permissions
  /// to your project service role. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface">Example
  /// policy statement to allow CodeBuild access to Amazon Web Services services
  /// required to create a VPC network interface</a>.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [scalingConfiguration] :
  /// The scaling configuration of the compute fleet.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs associated with this compute fleet.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  Future<UpdateFleetOutput> updateFleet({
    required String arn,
    int? baseCapacity,
    ComputeType? computeType,
    EnvironmentType? environmentType,
    String? fleetServiceRole,
    FleetOverflowBehavior? overflowBehavior,
    ScalingConfigurationInput? scalingConfiguration,
    List<Tag>? tags,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'baseCapacity',
      baseCapacity,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.UpdateFleet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (baseCapacity != null) 'baseCapacity': baseCapacity,
        if (computeType != null) 'computeType': computeType.toValue(),
        if (environmentType != null)
          'environmentType': environmentType.toValue(),
        if (fleetServiceRole != null) 'fleetServiceRole': fleetServiceRole,
        if (overflowBehavior != null)
          'overflowBehavior': overflowBehavior.toValue(),
        if (scalingConfiguration != null)
          'scalingConfiguration': scalingConfiguration,
        if (tags != null) 'tags': tags,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return UpdateFleetOutput.fromJson(jsonResponse.body);
  }

  /// Changes the settings of a build project.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the build project.
  /// <note>
  /// You cannot change a build project's name.
  /// </note>
  ///
  /// Parameter [artifacts] :
  /// Information to be changed about the build output artifacts for the build
  /// project.
  ///
  /// Parameter [badgeEnabled] :
  /// Set this to true to generate a publicly accessible URL for your project's
  /// build badge.
  ///
  /// Parameter [cache] :
  /// Stores recently used information so that it can be quickly accessed at a
  /// later time.
  ///
  /// Parameter [concurrentBuildLimit] :
  /// The maximum number of concurrent builds that are allowed for this project.
  ///
  /// New builds are only started if the current number of builds is less than
  /// or equal to this limit. If the current build count meets this limit, new
  /// builds are throttled and are not run.
  ///
  /// To remove this limit, set this value to -1.
  ///
  /// Parameter [description] :
  /// A new or replacement description of the build project.
  ///
  /// Parameter [encryptionKey] :
  /// The Key Management Service customer master key (CMK) to be used for
  /// encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts
  /// if your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  ///
  /// Parameter [environment] :
  /// Information to be changed about the build environment for the build
  /// project.
  ///
  /// Parameter [fileSystemLocations] :
  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies
  /// the <code>identifier</code>, <code>location</code>,
  /// <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code>
  /// of a file system created using Amazon Elastic File System.
  ///
  /// Parameter [logsConfig] :
  /// Information about logs for the build project. A project can create logs in
  /// CloudWatch Logs, logs in an S3 bucket, or both.
  ///
  /// Parameter [queuedTimeoutInMinutes] :
  /// The number of minutes a build is allowed to be queued before it times out.
  ///
  /// Parameter [secondaryArtifacts] :
  /// An array of <code>ProjectArtifact</code> objects.
  ///
  /// Parameter [secondarySourceVersions] :
  /// An array of <code>ProjectSourceVersion</code> objects. If
  /// <code>secondarySourceVersions</code> is specified at the build level, then
  /// they take over these <code>secondarySourceVersions</code> (at the project
  /// level).
  ///
  /// Parameter [secondarySources] :
  /// An array of <code>ProjectSource</code> objects.
  ///
  /// Parameter [serviceRole] :
  /// The replacement ARN of the IAM role that enables CodeBuild to interact
  /// with dependent Amazon Web Services services on behalf of the Amazon Web
  /// Services account.
  ///
  /// Parameter [source] :
  /// Information to be changed about the build input source code for the build
  /// project.
  ///
  /// Parameter [sourceVersion] :
  /// A version of the build input to be built for this project. If not
  /// specified, the latest version is used. If specified, it must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For GitLab: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build
  /// input ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  ///
  /// Parameter [tags] :
  /// An updated list of tag key and value pairs associated with this build
  /// project.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  ///
  /// Parameter [timeoutInMinutes] :
  /// The replacement value in minutes, from 5 to 2160 (36 hours), for CodeBuild
  /// to wait before timing out any related build that did not get marked as
  /// completed.
  ///
  /// Parameter [vpcConfig] :
  /// VpcConfig enables CodeBuild to access resources in an Amazon VPC.
  Future<UpdateProjectOutput> updateProject({
    required String name,
    ProjectArtifacts? artifacts,
    bool? badgeEnabled,
    ProjectBuildBatchConfig? buildBatchConfig,
    ProjectCache? cache,
    int? concurrentBuildLimit,
    String? description,
    String? encryptionKey,
    ProjectEnvironment? environment,
    List<ProjectFileSystemLocation>? fileSystemLocations,
    LogsConfig? logsConfig,
    int? queuedTimeoutInMinutes,
    List<ProjectArtifacts>? secondaryArtifacts,
    List<ProjectSourceVersion>? secondarySourceVersions,
    List<ProjectSource>? secondarySources,
    String? serviceRole,
    ProjectSource? source,
    String? sourceVersion,
    List<Tag>? tags,
    int? timeoutInMinutes,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'queuedTimeoutInMinutes',
      queuedTimeoutInMinutes,
      5,
      480,
    );
    _s.validateNumRange(
      'timeoutInMinutes',
      timeoutInMinutes,
      5,
      2160,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.UpdateProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (artifacts != null) 'artifacts': artifacts,
        if (badgeEnabled != null) 'badgeEnabled': badgeEnabled,
        if (buildBatchConfig != null) 'buildBatchConfig': buildBatchConfig,
        if (cache != null) 'cache': cache,
        if (concurrentBuildLimit != null)
          'concurrentBuildLimit': concurrentBuildLimit,
        if (description != null) 'description': description,
        if (encryptionKey != null) 'encryptionKey': encryptionKey,
        if (environment != null) 'environment': environment,
        if (fileSystemLocations != null)
          'fileSystemLocations': fileSystemLocations,
        if (logsConfig != null) 'logsConfig': logsConfig,
        if (queuedTimeoutInMinutes != null)
          'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
        if (secondaryArtifacts != null)
          'secondaryArtifacts': secondaryArtifacts,
        if (secondarySourceVersions != null)
          'secondarySourceVersions': secondarySourceVersions,
        if (secondarySources != null) 'secondarySources': secondarySources,
        if (serviceRole != null) 'serviceRole': serviceRole,
        if (source != null) 'source': source,
        if (sourceVersion != null) 'sourceVersion': sourceVersion,
        if (tags != null) 'tags': tags,
        if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
        if (vpcConfig != null) 'vpcConfig': vpcConfig,
      },
    );

    return UpdateProjectOutput.fromJson(jsonResponse.body);
  }

  /// Changes the public visibility for a project. The project's build results,
  /// logs, and artifacts are available to the general public. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/public-builds.html">Public
  /// build projects</a> in the <i>CodeBuild User Guide</i>.
  /// <important>
  /// The following should be kept in mind when making your projects public:
  ///
  /// <ul>
  /// <li>
  /// All of a project's build results, logs, and artifacts, including builds
  /// that were run when the project was private, are available to the general
  /// public.
  /// </li>
  /// <li>
  /// All build logs and artifacts are available to the public. Environment
  /// variables, source code, and other sensitive information may have been
  /// output to the build logs and artifacts. You must be careful about what
  /// information is output to the build logs. Some best practice are:
  ///
  /// <ul>
  /// <li>
  /// Do not store sensitive values in environment variables. We recommend that
  /// you use an Amazon EC2 Systems Manager Parameter Store or Secrets Manager
  /// to store sensitive values.
  /// </li>
  /// <li>
  /// Follow <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/webhooks.html#webhook-best-practices">Best
  /// practices for using webhooks</a> in the <i>CodeBuild User Guide</i> to
  /// limit which entities can trigger a build, and do not store the buildspec
  /// in the project itself, to ensure that your webhooks are as secure as
  /// possible.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// A malicious user can use public builds to distribute malicious artifacts.
  /// We recommend that you review all pull requests to verify that the pull
  /// request is a legitimate change. We also recommend that you validate any
  /// artifacts with their checksums to make sure that the correct artifacts are
  /// being downloaded.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectArn] :
  /// The Amazon Resource Name (ARN) of the build project.
  ///
  /// Parameter [resourceAccessRole] :
  /// The ARN of the IAM role that enables CodeBuild to access the CloudWatch
  /// Logs and Amazon S3 artifacts for the project's builds.
  Future<UpdateProjectVisibilityOutput> updateProjectVisibility({
    required String projectArn,
    required ProjectVisibilityType projectVisibility,
    String? resourceAccessRole,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.UpdateProjectVisibility'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectArn': projectArn,
        'projectVisibility': projectVisibility.toValue(),
        if (resourceAccessRole != null)
          'resourceAccessRole': resourceAccessRole,
      },
    );

    return UpdateProjectVisibilityOutput.fromJson(jsonResponse.body);
  }

  /// Updates a report group.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the report group to update.
  ///
  /// Parameter [exportConfig] :
  /// Used to specify an updated export type. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>S3</code>: The report results are exported to an S3 bucket.
  /// </li>
  /// <li>
  /// <code>NO_EXPORT</code>: The report results are not exported.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// An updated list of tag key and value pairs associated with this report
  /// group.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild report group tags.
  Future<UpdateReportGroupOutput> updateReportGroup({
    required String arn,
    ReportExportConfig? exportConfig,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.UpdateReportGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (exportConfig != null) 'exportConfig': exportConfig,
        if (tags != null) 'tags': tags,
      },
    );

    return UpdateReportGroupOutput.fromJson(jsonResponse.body);
  }

  /// Updates the webhook associated with an CodeBuild build project.
  /// <note>
  /// If you use Bitbucket for your repository, <code>rotateSecret</code> is
  /// ignored.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OAuthProviderException].
  ///
  /// Parameter [projectName] :
  /// The name of the CodeBuild project.
  ///
  /// Parameter [branchFilter] :
  /// A regular expression used to determine which repository branches are built
  /// when a webhook is triggered. If the name of a branch matches the regular
  /// expression, then it is built. If <code>branchFilter</code> is empty, then
  /// all branches are built.
  /// <note>
  /// It is recommended that you use <code>filterGroups</code> instead of
  /// <code>branchFilter</code>.
  /// </note>
  ///
  /// Parameter [buildType] :
  /// Specifies the type of build this webhook will trigger.
  ///
  /// Parameter [filterGroups] :
  /// An array of arrays of <code>WebhookFilter</code> objects used to determine
  /// if a webhook event can trigger a build. A filter group must contain at
  /// least one <code>EVENT</code> <code>WebhookFilter</code>.
  ///
  /// Parameter [rotateSecret] :
  /// A boolean value that specifies whether the associated GitHub repository's
  /// secret token should be updated. If you use Bitbucket for your repository,
  /// <code>rotateSecret</code> is ignored.
  Future<UpdateWebhookOutput> updateWebhook({
    required String projectName,
    String? branchFilter,
    WebhookBuildType? buildType,
    List<List<WebhookFilter>>? filterGroups,
    bool? rotateSecret,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.UpdateWebhook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
        if (branchFilter != null) 'branchFilter': branchFilter,
        if (buildType != null) 'buildType': buildType.toValue(),
        if (filterGroups != null) 'filterGroups': filterGroups,
        if (rotateSecret != null) 'rotateSecret': rotateSecret,
      },
    );

    return UpdateWebhookOutput.fromJson(jsonResponse.body);
  }
}

enum ArtifactNamespace {
  none,
  buildId,
}

extension ArtifactNamespaceValueExtension on ArtifactNamespace {
  String toValue() {
    switch (this) {
      case ArtifactNamespace.none:
        return 'NONE';
      case ArtifactNamespace.buildId:
        return 'BUILD_ID';
    }
  }
}

extension ArtifactNamespaceFromString on String {
  ArtifactNamespace toArtifactNamespace() {
    switch (this) {
      case 'NONE':
        return ArtifactNamespace.none;
      case 'BUILD_ID':
        return ArtifactNamespace.buildId;
    }
    throw Exception('$this is not known in enum ArtifactNamespace');
  }
}

enum ArtifactPackaging {
  none,
  zip,
}

extension ArtifactPackagingValueExtension on ArtifactPackaging {
  String toValue() {
    switch (this) {
      case ArtifactPackaging.none:
        return 'NONE';
      case ArtifactPackaging.zip:
        return 'ZIP';
    }
  }
}

extension ArtifactPackagingFromString on String {
  ArtifactPackaging toArtifactPackaging() {
    switch (this) {
      case 'NONE':
        return ArtifactPackaging.none;
      case 'ZIP':
        return ArtifactPackaging.zip;
    }
    throw Exception('$this is not known in enum ArtifactPackaging');
  }
}

enum ArtifactsType {
  codepipeline,
  s3,
  noArtifacts,
}

extension ArtifactsTypeValueExtension on ArtifactsType {
  String toValue() {
    switch (this) {
      case ArtifactsType.codepipeline:
        return 'CODEPIPELINE';
      case ArtifactsType.s3:
        return 'S3';
      case ArtifactsType.noArtifacts:
        return 'NO_ARTIFACTS';
    }
  }
}

extension ArtifactsTypeFromString on String {
  ArtifactsType toArtifactsType() {
    switch (this) {
      case 'CODEPIPELINE':
        return ArtifactsType.codepipeline;
      case 'S3':
        return ArtifactsType.s3;
      case 'NO_ARTIFACTS':
        return ArtifactsType.noArtifacts;
    }
    throw Exception('$this is not known in enum ArtifactsType');
  }
}

enum AuthType {
  oauth,
  basicAuth,
  personalAccessToken,
  codeconnections,
}

extension AuthTypeValueExtension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.oauth:
        return 'OAUTH';
      case AuthType.basicAuth:
        return 'BASIC_AUTH';
      case AuthType.personalAccessToken:
        return 'PERSONAL_ACCESS_TOKEN';
      case AuthType.codeconnections:
        return 'CODECONNECTIONS';
    }
  }
}

extension AuthTypeFromString on String {
  AuthType toAuthType() {
    switch (this) {
      case 'OAUTH':
        return AuthType.oauth;
      case 'BASIC_AUTH':
        return AuthType.basicAuth;
      case 'PERSONAL_ACCESS_TOKEN':
        return AuthType.personalAccessToken;
      case 'CODECONNECTIONS':
        return AuthType.codeconnections;
    }
    throw Exception('$this is not known in enum AuthType');
  }
}

class BatchDeleteBuildsOutput {
  /// The IDs of the builds that were successfully deleted.
  final List<String>? buildsDeleted;

  /// Information about any builds that could not be successfully deleted.
  final List<BuildNotDeleted>? buildsNotDeleted;

  BatchDeleteBuildsOutput({
    this.buildsDeleted,
    this.buildsNotDeleted,
  });

  factory BatchDeleteBuildsOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeleteBuildsOutput(
      buildsDeleted: (json['buildsDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      buildsNotDeleted: (json['buildsNotDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => BuildNotDeleted.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final buildsDeleted = this.buildsDeleted;
    final buildsNotDeleted = this.buildsNotDeleted;
    return {
      if (buildsDeleted != null) 'buildsDeleted': buildsDeleted,
      if (buildsNotDeleted != null) 'buildsNotDeleted': buildsNotDeleted,
    };
  }
}

class BatchGetBuildBatchesOutput {
  /// An array of <code>BuildBatch</code> objects that represent the retrieved
  /// batch builds.
  final List<BuildBatch>? buildBatches;

  /// An array that contains the identifiers of any batch builds that are not
  /// found.
  final List<String>? buildBatchesNotFound;

  BatchGetBuildBatchesOutput({
    this.buildBatches,
    this.buildBatchesNotFound,
  });

  factory BatchGetBuildBatchesOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetBuildBatchesOutput(
      buildBatches: (json['buildBatches'] as List?)
          ?.whereNotNull()
          .map((e) => BuildBatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      buildBatchesNotFound: (json['buildBatchesNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final buildBatches = this.buildBatches;
    final buildBatchesNotFound = this.buildBatchesNotFound;
    return {
      if (buildBatches != null) 'buildBatches': buildBatches,
      if (buildBatchesNotFound != null)
        'buildBatchesNotFound': buildBatchesNotFound,
    };
  }
}

class BatchGetBuildsOutput {
  /// Information about the requested builds.
  final List<Build>? builds;

  /// The IDs of builds for which information could not be found.
  final List<String>? buildsNotFound;

  BatchGetBuildsOutput({
    this.builds,
    this.buildsNotFound,
  });

  factory BatchGetBuildsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetBuildsOutput(
      builds: (json['builds'] as List?)
          ?.whereNotNull()
          .map((e) => Build.fromJson(e as Map<String, dynamic>))
          .toList(),
      buildsNotFound: (json['buildsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final builds = this.builds;
    final buildsNotFound = this.buildsNotFound;
    return {
      if (builds != null) 'builds': builds,
      if (buildsNotFound != null) 'buildsNotFound': buildsNotFound,
    };
  }
}

class BatchGetFleetsOutput {
  /// Information about the requested compute fleets.
  final List<Fleet>? fleets;

  /// The names of compute fleets for which information could not be found.
  final List<String>? fleetsNotFound;

  BatchGetFleetsOutput({
    this.fleets,
    this.fleetsNotFound,
  });

  factory BatchGetFleetsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetFleetsOutput(
      fleets: (json['fleets'] as List?)
          ?.whereNotNull()
          .map((e) => Fleet.fromJson(e as Map<String, dynamic>))
          .toList(),
      fleetsNotFound: (json['fleetsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final fleetsNotFound = this.fleetsNotFound;
    return {
      if (fleets != null) 'fleets': fleets,
      if (fleetsNotFound != null) 'fleetsNotFound': fleetsNotFound,
    };
  }
}

class BatchGetProjectsOutput {
  /// Information about the requested build projects.
  final List<Project>? projects;

  /// The names of build projects for which information could not be found.
  final List<String>? projectsNotFound;

  BatchGetProjectsOutput({
    this.projects,
    this.projectsNotFound,
  });

  factory BatchGetProjectsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetProjectsOutput(
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectsNotFound: (json['projectsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final projects = this.projects;
    final projectsNotFound = this.projectsNotFound;
    return {
      if (projects != null) 'projects': projects,
      if (projectsNotFound != null) 'projectsNotFound': projectsNotFound,
    };
  }
}

class BatchGetReportGroupsOutput {
  /// The array of report groups returned by <code>BatchGetReportGroups</code>.
  final List<ReportGroup>? reportGroups;

  /// An array of ARNs passed to <code>BatchGetReportGroups</code> that are not
  /// associated with a <code>ReportGroup</code>.
  final List<String>? reportGroupsNotFound;

  BatchGetReportGroupsOutput({
    this.reportGroups,
    this.reportGroupsNotFound,
  });

  factory BatchGetReportGroupsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetReportGroupsOutput(
      reportGroups: (json['reportGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ReportGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportGroupsNotFound: (json['reportGroupsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reportGroups = this.reportGroups;
    final reportGroupsNotFound = this.reportGroupsNotFound;
    return {
      if (reportGroups != null) 'reportGroups': reportGroups,
      if (reportGroupsNotFound != null)
        'reportGroupsNotFound': reportGroupsNotFound,
    };
  }
}

class BatchGetReportsOutput {
  /// The array of <code>Report</code> objects returned by
  /// <code>BatchGetReports</code>.
  final List<Report>? reports;

  /// An array of ARNs passed to <code>BatchGetReportGroups</code> that are not
  /// associated with a <code>Report</code>.
  final List<String>? reportsNotFound;

  BatchGetReportsOutput({
    this.reports,
    this.reportsNotFound,
  });

  factory BatchGetReportsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetReportsOutput(
      reports: (json['reports'] as List?)
          ?.whereNotNull()
          .map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportsNotFound: (json['reportsNotFound'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reports = this.reports;
    final reportsNotFound = this.reportsNotFound;
    return {
      if (reports != null) 'reports': reports,
      if (reportsNotFound != null) 'reportsNotFound': reportsNotFound,
    };
  }
}

enum BatchReportModeType {
  reportIndividualBuilds,
  reportAggregatedBatch,
}

extension BatchReportModeTypeValueExtension on BatchReportModeType {
  String toValue() {
    switch (this) {
      case BatchReportModeType.reportIndividualBuilds:
        return 'REPORT_INDIVIDUAL_BUILDS';
      case BatchReportModeType.reportAggregatedBatch:
        return 'REPORT_AGGREGATED_BATCH';
    }
  }
}

extension BatchReportModeTypeFromString on String {
  BatchReportModeType toBatchReportModeType() {
    switch (this) {
      case 'REPORT_INDIVIDUAL_BUILDS':
        return BatchReportModeType.reportIndividualBuilds;
      case 'REPORT_AGGREGATED_BATCH':
        return BatchReportModeType.reportAggregatedBatch;
    }
    throw Exception('$this is not known in enum BatchReportModeType');
  }
}

/// Specifies restrictions for the batch build.
class BatchRestrictions {
  /// An array of strings that specify the compute types that are allowed for the
  /// batch build. See <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild User Guide</i> for these
  /// values.
  final List<String>? computeTypesAllowed;

  /// Specifies the maximum number of builds allowed.
  final int? maximumBuildsAllowed;

  BatchRestrictions({
    this.computeTypesAllowed,
    this.maximumBuildsAllowed,
  });

  factory BatchRestrictions.fromJson(Map<String, dynamic> json) {
    return BatchRestrictions(
      computeTypesAllowed: (json['computeTypesAllowed'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maximumBuildsAllowed: json['maximumBuildsAllowed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeTypesAllowed = this.computeTypesAllowed;
    final maximumBuildsAllowed = this.maximumBuildsAllowed;
    return {
      if (computeTypesAllowed != null)
        'computeTypesAllowed': computeTypesAllowed,
      if (maximumBuildsAllowed != null)
        'maximumBuildsAllowed': maximumBuildsAllowed,
    };
  }
}

/// Specifies the bucket owner's access for objects that another account uploads
/// to their Amazon S3 bucket. By default, only the account that uploads the
/// objects to the bucket has access to these objects. This property allows you
/// to give the bucket owner access to these objects.
/// <note>
/// To use this property, your CodeBuild service role must have the
/// <code>s3:PutBucketAcl</code> permission. This permission allows CodeBuild to
/// modify the access control list for the bucket.
/// </note>
/// This property can be one of the following values:
/// <dl> <dt>NONE</dt> <dd>
/// The bucket owner does not have access to the objects. This is the default.
/// </dd> <dt>READ_ONLY</dt> <dd>
/// The bucket owner has read-only access to the objects. The uploading account
/// retains ownership of the objects.
/// </dd> <dt>FULL</dt> <dd>
/// The bucket owner has full access to the objects. Object ownership is
/// determined by the following criteria:
///
/// <ul>
/// <li>
/// If the bucket is configured with the <b>Bucket owner preferred</b> setting,
/// the bucket owner owns the objects. The uploading account will have object
/// access as specified by the bucket's policy.
/// </li>
/// <li>
/// Otherwise, the uploading account retains ownership of the objects.
/// </li>
/// </ul>
/// For more information about Amazon S3 object ownership, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html">Controlling
/// ownership of uploaded objects using S3 Object Ownership</a> in the <i>Amazon
/// Simple Storage Service User Guide</i>.
/// </dd> </dl>
enum BucketOwnerAccess {
  none,
  readOnly,
  full,
}

extension BucketOwnerAccessValueExtension on BucketOwnerAccess {
  String toValue() {
    switch (this) {
      case BucketOwnerAccess.none:
        return 'NONE';
      case BucketOwnerAccess.readOnly:
        return 'READ_ONLY';
      case BucketOwnerAccess.full:
        return 'FULL';
    }
  }
}

extension BucketOwnerAccessFromString on String {
  BucketOwnerAccess toBucketOwnerAccess() {
    switch (this) {
      case 'NONE':
        return BucketOwnerAccess.none;
      case 'READ_ONLY':
        return BucketOwnerAccess.readOnly;
      case 'FULL':
        return BucketOwnerAccess.full;
    }
    throw Exception('$this is not known in enum BucketOwnerAccess');
  }
}

/// Information about a build.
class Build {
  /// The Amazon Resource Name (ARN) of the build.
  final String? arn;

  /// Information about the output artifacts for the build.
  final BuildArtifacts? artifacts;

  /// The ARN of the batch build that this build is a member of, if applicable.
  final String? buildBatchArn;

  /// Whether the build is complete. True if complete; otherwise, false.
  final bool? buildComplete;

  /// The number of the build. For each project, the <code>buildNumber</code> of
  /// its first build is <code>1</code>. The <code>buildNumber</code> of each
  /// subsequent build is incremented by <code>1</code>. If a build is deleted,
  /// the <code>buildNumber</code> of other builds does not change.
  final int? buildNumber;

  /// The current status of the build. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code>: The build failed.
  /// </li>
  /// <li>
  /// <code>FAULT</code>: The build faulted.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code>: The build is still in progress.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>: The build stopped.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>: The build succeeded.
  /// </li>
  /// <li>
  /// <code>TIMED_OUT</code>: The build timed out.
  /// </li>
  /// </ul>
  final StatusType? buildStatus;

  /// Information about the cache for the build.
  final ProjectCache? cache;

  /// The current build phase.
  final String? currentPhase;

  /// Contains information about the debug session for this build.
  final DebugSession? debugSession;

  /// The Key Management Service customer master key (CMK) to be used for
  /// encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  final String? encryptionKey;

  /// When the build process ended, expressed in Unix time format.
  final DateTime? endTime;

  /// Information about the build environment for this build.
  final ProjectEnvironment? environment;

  /// A list of exported environment variables for this build.
  ///
  /// Exported environment variables are used in conjunction with CodePipeline to
  /// export environment variables from the current build stage to subsequent
  /// stages in the pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-variables.html">Working
  /// with variables</a> in the <i>CodePipeline User Guide</i>.
  final List<ExportedEnvironmentVariable>? exportedEnvironmentVariables;

  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  final List<ProjectFileSystemLocation>? fileSystemLocations;

  /// The unique ID for the build.
  final String? id;

  /// The entity that started the build. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// If CodePipeline started the build, the pipeline's name (for example,
  /// <code>codepipeline/my-demo-pipeline</code>).
  /// </li>
  /// <li>
  /// If a user started the build, the user's name (for example,
  /// <code>MyUserName</code>).
  /// </li>
  /// <li>
  /// If the Jenkins plugin for CodeBuild started the build, the string
  /// <code>CodeBuild-Jenkins-Plugin</code>.
  /// </li>
  /// </ul>
  final String? initiator;

  /// Information about the build's logs in CloudWatch Logs.
  final LogsLocation? logs;

  /// Describes a network interface.
  final NetworkInterface? networkInterface;

  /// Information about all previous build phases that are complete and
  /// information about any current build phase that is not yet complete.
  final List<BuildPhase>? phases;

  /// The name of the CodeBuild project.
  final String? projectName;

  /// The number of minutes a build is allowed to be queued before it times out.
  final int? queuedTimeoutInMinutes;

  /// An array of the ARNs associated with this build's reports.
  final List<String>? reportArns;

  /// An identifier for the version of this build's source code.
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID.
  /// </li>
  /// <li>
  /// For CodePipeline, the source revision provided by CodePipeline.
  /// </li>
  /// <li>
  /// For Amazon S3, this does not apply.
  /// </li>
  /// </ul>
  final String? resolvedSourceVersion;

  /// An array of <code>ProjectArtifacts</code> objects.
  final List<BuildArtifacts>? secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. Each
  /// <code>ProjectSourceVersion</code> must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example, <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build input
  /// ZIP file to use.
  /// </li>
  /// </ul>
  final List<ProjectSourceVersion>? secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects.
  final List<ProjectSource>? secondarySources;

  /// The name of a service role used for this build.
  final String? serviceRole;

  /// Information about the source code to be built.
  final ProjectSource? source;

  /// Any version identifier for the version of the source code to be built. If
  /// <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  final String? sourceVersion;

  /// When the build process started, expressed in Unix time format.
  final DateTime? startTime;

  /// How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait
  /// before timing out this build if it does not get marked as completed.
  final int? timeoutInMinutes;

  /// If your CodeBuild project accesses resources in an Amazon VPC, you provide
  /// this parameter that identifies the VPC ID and the list of security group IDs
  /// and subnet IDs. The security groups and subnets must belong to the same VPC.
  /// You must provide at least one security group and one subnet ID.
  final VpcConfig? vpcConfig;

  Build({
    this.arn,
    this.artifacts,
    this.buildBatchArn,
    this.buildComplete,
    this.buildNumber,
    this.buildStatus,
    this.cache,
    this.currentPhase,
    this.debugSession,
    this.encryptionKey,
    this.endTime,
    this.environment,
    this.exportedEnvironmentVariables,
    this.fileSystemLocations,
    this.id,
    this.initiator,
    this.logs,
    this.networkInterface,
    this.phases,
    this.projectName,
    this.queuedTimeoutInMinutes,
    this.reportArns,
    this.resolvedSourceVersion,
    this.secondaryArtifacts,
    this.secondarySourceVersions,
    this.secondarySources,
    this.serviceRole,
    this.source,
    this.sourceVersion,
    this.startTime,
    this.timeoutInMinutes,
    this.vpcConfig,
  });

  factory Build.fromJson(Map<String, dynamic> json) {
    return Build(
      arn: json['arn'] as String?,
      artifacts: json['artifacts'] != null
          ? BuildArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>)
          : null,
      buildBatchArn: json['buildBatchArn'] as String?,
      buildComplete: json['buildComplete'] as bool?,
      buildNumber: json['buildNumber'] as int?,
      buildStatus: (json['buildStatus'] as String?)?.toStatusType(),
      cache: json['cache'] != null
          ? ProjectCache.fromJson(json['cache'] as Map<String, dynamic>)
          : null,
      currentPhase: json['currentPhase'] as String?,
      debugSession: json['debugSession'] != null
          ? DebugSession.fromJson(json['debugSession'] as Map<String, dynamic>)
          : null,
      encryptionKey: json['encryptionKey'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      environment: json['environment'] != null
          ? ProjectEnvironment.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
      exportedEnvironmentVariables: (json['exportedEnvironmentVariables']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ExportedEnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      initiator: json['initiator'] as String?,
      logs: json['logs'] != null
          ? LogsLocation.fromJson(json['logs'] as Map<String, dynamic>)
          : null,
      networkInterface: json['networkInterface'] != null
          ? NetworkInterface.fromJson(
              json['networkInterface'] as Map<String, dynamic>)
          : null,
      phases: (json['phases'] as List?)
          ?.whereNotNull()
          .map((e) => BuildPhase.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectName: json['projectName'] as String?,
      queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int?,
      reportArns: (json['reportArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resolvedSourceVersion: json['resolvedSourceVersion'] as String?,
      secondaryArtifacts: (json['secondaryArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => BuildArtifacts.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySourceVersions: (json['secondarySourceVersions'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySources: (json['secondarySources'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceRole: json['serviceRole'] as String?,
      source: json['source'] != null
          ? ProjectSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      sourceVersion: json['sourceVersion'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      timeoutInMinutes: json['timeoutInMinutes'] as int?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final artifacts = this.artifacts;
    final buildBatchArn = this.buildBatchArn;
    final buildComplete = this.buildComplete;
    final buildNumber = this.buildNumber;
    final buildStatus = this.buildStatus;
    final cache = this.cache;
    final currentPhase = this.currentPhase;
    final debugSession = this.debugSession;
    final encryptionKey = this.encryptionKey;
    final endTime = this.endTime;
    final environment = this.environment;
    final exportedEnvironmentVariables = this.exportedEnvironmentVariables;
    final fileSystemLocations = this.fileSystemLocations;
    final id = this.id;
    final initiator = this.initiator;
    final logs = this.logs;
    final networkInterface = this.networkInterface;
    final phases = this.phases;
    final projectName = this.projectName;
    final queuedTimeoutInMinutes = this.queuedTimeoutInMinutes;
    final reportArns = this.reportArns;
    final resolvedSourceVersion = this.resolvedSourceVersion;
    final secondaryArtifacts = this.secondaryArtifacts;
    final secondarySourceVersions = this.secondarySourceVersions;
    final secondarySources = this.secondarySources;
    final serviceRole = this.serviceRole;
    final source = this.source;
    final sourceVersion = this.sourceVersion;
    final startTime = this.startTime;
    final timeoutInMinutes = this.timeoutInMinutes;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (artifacts != null) 'artifacts': artifacts,
      if (buildBatchArn != null) 'buildBatchArn': buildBatchArn,
      if (buildComplete != null) 'buildComplete': buildComplete,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (buildStatus != null) 'buildStatus': buildStatus.toValue(),
      if (cache != null) 'cache': cache,
      if (currentPhase != null) 'currentPhase': currentPhase,
      if (debugSession != null) 'debugSession': debugSession,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (environment != null) 'environment': environment,
      if (exportedEnvironmentVariables != null)
        'exportedEnvironmentVariables': exportedEnvironmentVariables,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
      if (id != null) 'id': id,
      if (initiator != null) 'initiator': initiator,
      if (logs != null) 'logs': logs,
      if (networkInterface != null) 'networkInterface': networkInterface,
      if (phases != null) 'phases': phases,
      if (projectName != null) 'projectName': projectName,
      if (queuedTimeoutInMinutes != null)
        'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
      if (reportArns != null) 'reportArns': reportArns,
      if (resolvedSourceVersion != null)
        'resolvedSourceVersion': resolvedSourceVersion,
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
      if (secondarySourceVersions != null)
        'secondarySourceVersions': secondarySourceVersions,
      if (secondarySources != null) 'secondarySources': secondarySources,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (source != null) 'source': source,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Information about build output artifacts.
class BuildArtifacts {
  /// An identifier for this artifact definition.
  final String? artifactIdentifier;
  final BucketOwnerAccess? bucketOwnerAccess;

  /// Information that tells you if encryption for build artifacts is disabled.
  final bool? encryptionDisabled;

  /// Information about the location of the build artifacts.
  final String? location;

  /// The MD5 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  /// <note>
  /// This value is available only if the build project's <code>packaging</code>
  /// value is set to <code>ZIP</code>.
  /// </note>
  final String? md5sum;

  /// If this flag is set, a name specified in the buildspec file overrides the
  /// artifact name. The name specified in a buildspec file is calculated at build
  /// time and uses the Shell Command Language. For example, you can append a date
  /// and time to your artifact name so that it is always unique.
  final bool? overrideArtifactName;

  /// The SHA-256 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  /// <note>
  /// This value is available only if the build project's <code>packaging</code>
  /// value is set to <code>ZIP</code>.
  /// </note>
  final String? sha256sum;

  BuildArtifacts({
    this.artifactIdentifier,
    this.bucketOwnerAccess,
    this.encryptionDisabled,
    this.location,
    this.md5sum,
    this.overrideArtifactName,
    this.sha256sum,
  });

  factory BuildArtifacts.fromJson(Map<String, dynamic> json) {
    return BuildArtifacts(
      artifactIdentifier: json['artifactIdentifier'] as String?,
      bucketOwnerAccess:
          (json['bucketOwnerAccess'] as String?)?.toBucketOwnerAccess(),
      encryptionDisabled: json['encryptionDisabled'] as bool?,
      location: json['location'] as String?,
      md5sum: json['md5sum'] as String?,
      overrideArtifactName: json['overrideArtifactName'] as bool?,
      sha256sum: json['sha256sum'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactIdentifier = this.artifactIdentifier;
    final bucketOwnerAccess = this.bucketOwnerAccess;
    final encryptionDisabled = this.encryptionDisabled;
    final location = this.location;
    final md5sum = this.md5sum;
    final overrideArtifactName = this.overrideArtifactName;
    final sha256sum = this.sha256sum;
    return {
      if (artifactIdentifier != null) 'artifactIdentifier': artifactIdentifier,
      if (bucketOwnerAccess != null)
        'bucketOwnerAccess': bucketOwnerAccess.toValue(),
      if (encryptionDisabled != null) 'encryptionDisabled': encryptionDisabled,
      if (location != null) 'location': location,
      if (md5sum != null) 'md5sum': md5sum,
      if (overrideArtifactName != null)
        'overrideArtifactName': overrideArtifactName,
      if (sha256sum != null) 'sha256sum': sha256sum,
    };
  }
}

/// Contains information about a batch build.
class BuildBatch {
  /// The ARN of the batch build.
  final String? arn;

  /// A <code>BuildArtifacts</code> object the defines the build artifacts for
  /// this batch build.
  final BuildArtifacts? artifacts;
  final ProjectBuildBatchConfig? buildBatchConfig;

  /// The number of the batch build. For each project, the
  /// <code>buildBatchNumber</code> of its first batch build is <code>1</code>.
  /// The <code>buildBatchNumber</code> of each subsequent batch build is
  /// incremented by <code>1</code>. If a batch build is deleted, the
  /// <code>buildBatchNumber</code> of other batch builds does not change.
  final int? buildBatchNumber;

  /// The status of the batch build.
  final StatusType? buildBatchStatus;

  /// An array of <code>BuildGroup</code> objects that define the build groups for
  /// the batch build.
  final List<BuildGroup>? buildGroups;

  /// Specifies the maximum amount of time, in minutes, that the build in a batch
  /// must be completed in.
  final int? buildTimeoutInMinutes;
  final ProjectCache? cache;

  /// Indicates if the batch build is complete.
  final bool? complete;

  /// The current phase of the batch build.
  final String? currentPhase;

  /// Specifies if session debugging is enabled for this batch build. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html">Viewing
  /// a running build in Session Manager</a>. Batch session debugging is not
  /// supported for matrix batch builds.
  final bool? debugSessionEnabled;

  /// The Key Management Service customer master key (CMK) to be used for
  /// encrypting the batch build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  final String? encryptionKey;

  /// The date and time that the batch build ended.
  final DateTime? endTime;
  final ProjectEnvironment? environment;

  /// An array of <code>ProjectFileSystemLocation</code> objects for the batch
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  final List<ProjectFileSystemLocation>? fileSystemLocations;

  /// The identifier of the batch build.
  final String? id;

  /// The entity that started the batch build. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// If CodePipeline started the build, the pipeline's name (for example,
  /// <code>codepipeline/my-demo-pipeline</code>).
  /// </li>
  /// <li>
  /// If a user started the build, the user's name.
  /// </li>
  /// <li>
  /// If the Jenkins plugin for CodeBuild started the build, the string
  /// <code>CodeBuild-Jenkins-Plugin</code>.
  /// </li>
  /// </ul>
  final String? initiator;
  final LogsConfig? logConfig;

  /// An array of <code>BuildBatchPhase</code> objects the specify the phases of
  /// the batch build.
  final List<BuildBatchPhase>? phases;

  /// The name of the batch build project.
  final String? projectName;

  /// Specifies the amount of time, in minutes, that the batch build is allowed to
  /// be queued before it times out.
  final int? queuedTimeoutInMinutes;

  /// The identifier of the resolved version of this batch build's source code.
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID.
  /// </li>
  /// <li>
  /// For CodePipeline, the source revision provided by CodePipeline.
  /// </li>
  /// <li>
  /// For Amazon S3, this does not apply.
  /// </li>
  /// </ul>
  final String? resolvedSourceVersion;

  /// An array of <code>BuildArtifacts</code> objects the define the build
  /// artifacts for this batch build.
  final List<BuildArtifacts>? secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. Each
  /// <code>ProjectSourceVersion</code> must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example, <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build input
  /// ZIP file to use.
  /// </li>
  /// </ul>
  final List<ProjectSourceVersion>? secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects that define the sources for
  /// the batch build.
  final List<ProjectSource>? secondarySources;

  /// The name of a service role used for builds in the batch.
  final String? serviceRole;
  final ProjectSource? source;

  /// The identifier of the version of the source code to be built.
  final String? sourceVersion;

  /// The date and time that the batch build started.
  final DateTime? startTime;
  final VpcConfig? vpcConfig;

  BuildBatch({
    this.arn,
    this.artifacts,
    this.buildBatchConfig,
    this.buildBatchNumber,
    this.buildBatchStatus,
    this.buildGroups,
    this.buildTimeoutInMinutes,
    this.cache,
    this.complete,
    this.currentPhase,
    this.debugSessionEnabled,
    this.encryptionKey,
    this.endTime,
    this.environment,
    this.fileSystemLocations,
    this.id,
    this.initiator,
    this.logConfig,
    this.phases,
    this.projectName,
    this.queuedTimeoutInMinutes,
    this.resolvedSourceVersion,
    this.secondaryArtifacts,
    this.secondarySourceVersions,
    this.secondarySources,
    this.serviceRole,
    this.source,
    this.sourceVersion,
    this.startTime,
    this.vpcConfig,
  });

  factory BuildBatch.fromJson(Map<String, dynamic> json) {
    return BuildBatch(
      arn: json['arn'] as String?,
      artifacts: json['artifacts'] != null
          ? BuildArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>)
          : null,
      buildBatchConfig: json['buildBatchConfig'] != null
          ? ProjectBuildBatchConfig.fromJson(
              json['buildBatchConfig'] as Map<String, dynamic>)
          : null,
      buildBatchNumber: json['buildBatchNumber'] as int?,
      buildBatchStatus: (json['buildBatchStatus'] as String?)?.toStatusType(),
      buildGroups: (json['buildGroups'] as List?)
          ?.whereNotNull()
          .map((e) => BuildGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      buildTimeoutInMinutes: json['buildTimeoutInMinutes'] as int?,
      cache: json['cache'] != null
          ? ProjectCache.fromJson(json['cache'] as Map<String, dynamic>)
          : null,
      complete: json['complete'] as bool?,
      currentPhase: json['currentPhase'] as String?,
      debugSessionEnabled: json['debugSessionEnabled'] as bool?,
      encryptionKey: json['encryptionKey'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      environment: json['environment'] != null
          ? ProjectEnvironment.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      initiator: json['initiator'] as String?,
      logConfig: json['logConfig'] != null
          ? LogsConfig.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      phases: (json['phases'] as List?)
          ?.whereNotNull()
          .map((e) => BuildBatchPhase.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectName: json['projectName'] as String?,
      queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int?,
      resolvedSourceVersion: json['resolvedSourceVersion'] as String?,
      secondaryArtifacts: (json['secondaryArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => BuildArtifacts.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySourceVersions: (json['secondarySourceVersions'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySources: (json['secondarySources'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceRole: json['serviceRole'] as String?,
      source: json['source'] != null
          ? ProjectSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      sourceVersion: json['sourceVersion'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final artifacts = this.artifacts;
    final buildBatchConfig = this.buildBatchConfig;
    final buildBatchNumber = this.buildBatchNumber;
    final buildBatchStatus = this.buildBatchStatus;
    final buildGroups = this.buildGroups;
    final buildTimeoutInMinutes = this.buildTimeoutInMinutes;
    final cache = this.cache;
    final complete = this.complete;
    final currentPhase = this.currentPhase;
    final debugSessionEnabled = this.debugSessionEnabled;
    final encryptionKey = this.encryptionKey;
    final endTime = this.endTime;
    final environment = this.environment;
    final fileSystemLocations = this.fileSystemLocations;
    final id = this.id;
    final initiator = this.initiator;
    final logConfig = this.logConfig;
    final phases = this.phases;
    final projectName = this.projectName;
    final queuedTimeoutInMinutes = this.queuedTimeoutInMinutes;
    final resolvedSourceVersion = this.resolvedSourceVersion;
    final secondaryArtifacts = this.secondaryArtifacts;
    final secondarySourceVersions = this.secondarySourceVersions;
    final secondarySources = this.secondarySources;
    final serviceRole = this.serviceRole;
    final source = this.source;
    final sourceVersion = this.sourceVersion;
    final startTime = this.startTime;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (artifacts != null) 'artifacts': artifacts,
      if (buildBatchConfig != null) 'buildBatchConfig': buildBatchConfig,
      if (buildBatchNumber != null) 'buildBatchNumber': buildBatchNumber,
      if (buildBatchStatus != null)
        'buildBatchStatus': buildBatchStatus.toValue(),
      if (buildGroups != null) 'buildGroups': buildGroups,
      if (buildTimeoutInMinutes != null)
        'buildTimeoutInMinutes': buildTimeoutInMinutes,
      if (cache != null) 'cache': cache,
      if (complete != null) 'complete': complete,
      if (currentPhase != null) 'currentPhase': currentPhase,
      if (debugSessionEnabled != null)
        'debugSessionEnabled': debugSessionEnabled,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (environment != null) 'environment': environment,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
      if (id != null) 'id': id,
      if (initiator != null) 'initiator': initiator,
      if (logConfig != null) 'logConfig': logConfig,
      if (phases != null) 'phases': phases,
      if (projectName != null) 'projectName': projectName,
      if (queuedTimeoutInMinutes != null)
        'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
      if (resolvedSourceVersion != null)
        'resolvedSourceVersion': resolvedSourceVersion,
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
      if (secondarySourceVersions != null)
        'secondarySourceVersions': secondarySourceVersions,
      if (secondarySources != null) 'secondarySources': secondarySources,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (source != null) 'source': source,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Specifies filters when retrieving batch builds.
class BuildBatchFilter {
  /// The status of the batch builds to retrieve. Only batch builds that have this
  /// status will be retrieved.
  final StatusType? status;

  BuildBatchFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Contains information about a stage for a batch build.
class BuildBatchPhase {
  /// Additional information about the batch build phase. Especially to help
  /// troubleshoot a failed batch build.
  final List<PhaseContext>? contexts;

  /// How long, in seconds, between the starting and ending times of the batch
  /// build's phase.
  final int? durationInSeconds;

  /// When the batch build phase ended, expressed in Unix time format.
  final DateTime? endTime;

  /// The current status of the batch build phase. Valid values include:
  /// <dl> <dt>FAILED</dt> <dd>
  /// The build phase failed.
  /// </dd> <dt>FAULT</dt> <dd>
  /// The build phase faulted.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The build phase is still in progress.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The build phase stopped.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The build phase succeeded.
  /// </dd> <dt>TIMED_OUT</dt> <dd>
  /// The build phase timed out.
  /// </dd> </dl>
  final StatusType? phaseStatus;

  /// The name of the batch build phase. Valid values include:
  /// <dl> <dt>COMBINE_ARTIFACTS</dt> <dd>
  /// Build output artifacts are being combined and uploaded to the output
  /// location.
  /// </dd> <dt>DOWNLOAD_BATCHSPEC</dt> <dd>
  /// The batch build specification is being downloaded.
  /// </dd> <dt>FAILED</dt> <dd>
  /// One or more of the builds failed.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The batch build is in progress.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The batch build was stopped.
  /// </dd> <dt>SUBMITTED</dt> <dd>
  /// The btach build has been submitted.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The batch build succeeded.
  /// </dd> </dl>
  final BuildBatchPhaseType? phaseType;

  /// When the batch build phase started, expressed in Unix time format.
  final DateTime? startTime;

  BuildBatchPhase({
    this.contexts,
    this.durationInSeconds,
    this.endTime,
    this.phaseStatus,
    this.phaseType,
    this.startTime,
  });

  factory BuildBatchPhase.fromJson(Map<String, dynamic> json) {
    return BuildBatchPhase(
      contexts: (json['contexts'] as List?)
          ?.whereNotNull()
          .map((e) => PhaseContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      durationInSeconds: json['durationInSeconds'] as int?,
      endTime: timeStampFromJson(json['endTime']),
      phaseStatus: (json['phaseStatus'] as String?)?.toStatusType(),
      phaseType: (json['phaseType'] as String?)?.toBuildBatchPhaseType(),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contexts = this.contexts;
    final durationInSeconds = this.durationInSeconds;
    final endTime = this.endTime;
    final phaseStatus = this.phaseStatus;
    final phaseType = this.phaseType;
    final startTime = this.startTime;
    return {
      if (contexts != null) 'contexts': contexts,
      if (durationInSeconds != null) 'durationInSeconds': durationInSeconds,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (phaseStatus != null) 'phaseStatus': phaseStatus.toValue(),
      if (phaseType != null) 'phaseType': phaseType.toValue(),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

enum BuildBatchPhaseType {
  submitted,
  downloadBatchspec,
  inProgress,
  combineArtifacts,
  succeeded,
  failed,
  stopped,
}

extension BuildBatchPhaseTypeValueExtension on BuildBatchPhaseType {
  String toValue() {
    switch (this) {
      case BuildBatchPhaseType.submitted:
        return 'SUBMITTED';
      case BuildBatchPhaseType.downloadBatchspec:
        return 'DOWNLOAD_BATCHSPEC';
      case BuildBatchPhaseType.inProgress:
        return 'IN_PROGRESS';
      case BuildBatchPhaseType.combineArtifacts:
        return 'COMBINE_ARTIFACTS';
      case BuildBatchPhaseType.succeeded:
        return 'SUCCEEDED';
      case BuildBatchPhaseType.failed:
        return 'FAILED';
      case BuildBatchPhaseType.stopped:
        return 'STOPPED';
    }
  }
}

extension BuildBatchPhaseTypeFromString on String {
  BuildBatchPhaseType toBuildBatchPhaseType() {
    switch (this) {
      case 'SUBMITTED':
        return BuildBatchPhaseType.submitted;
      case 'DOWNLOAD_BATCHSPEC':
        return BuildBatchPhaseType.downloadBatchspec;
      case 'IN_PROGRESS':
        return BuildBatchPhaseType.inProgress;
      case 'COMBINE_ARTIFACTS':
        return BuildBatchPhaseType.combineArtifacts;
      case 'SUCCEEDED':
        return BuildBatchPhaseType.succeeded;
      case 'FAILED':
        return BuildBatchPhaseType.failed;
      case 'STOPPED':
        return BuildBatchPhaseType.stopped;
    }
    throw Exception('$this is not known in enum BuildBatchPhaseType');
  }
}

/// Contains information about a batch build build group. Build groups are used
/// to combine builds that can run in parallel, while still being able to set
/// dependencies on other build groups.
class BuildGroup {
  /// A <code>BuildSummary</code> object that contains a summary of the current
  /// build group.
  final BuildSummary? currentBuildSummary;

  /// An array of strings that contain the identifiers of the build groups that
  /// this build group depends on.
  final List<String>? dependsOn;

  /// Contains the identifier of the build group.
  final String? identifier;

  /// Specifies if failures in this build group can be ignored.
  final bool? ignoreFailure;

  /// An array of <code>BuildSummary</code> objects that contain summaries of
  /// previous build groups.
  final List<BuildSummary>? priorBuildSummaryList;

  BuildGroup({
    this.currentBuildSummary,
    this.dependsOn,
    this.identifier,
    this.ignoreFailure,
    this.priorBuildSummaryList,
  });

  factory BuildGroup.fromJson(Map<String, dynamic> json) {
    return BuildGroup(
      currentBuildSummary: json['currentBuildSummary'] != null
          ? BuildSummary.fromJson(
              json['currentBuildSummary'] as Map<String, dynamic>)
          : null,
      dependsOn: (json['dependsOn'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identifier: json['identifier'] as String?,
      ignoreFailure: json['ignoreFailure'] as bool?,
      priorBuildSummaryList: (json['priorBuildSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => BuildSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final currentBuildSummary = this.currentBuildSummary;
    final dependsOn = this.dependsOn;
    final identifier = this.identifier;
    final ignoreFailure = this.ignoreFailure;
    final priorBuildSummaryList = this.priorBuildSummaryList;
    return {
      if (currentBuildSummary != null)
        'currentBuildSummary': currentBuildSummary,
      if (dependsOn != null) 'dependsOn': dependsOn,
      if (identifier != null) 'identifier': identifier,
      if (ignoreFailure != null) 'ignoreFailure': ignoreFailure,
      if (priorBuildSummaryList != null)
        'priorBuildSummaryList': priorBuildSummaryList,
    };
  }
}

/// Information about a build that could not be successfully deleted.
class BuildNotDeleted {
  /// The ID of the build that could not be successfully deleted.
  final String? id;

  /// Additional information about the build that could not be successfully
  /// deleted.
  final String? statusCode;

  BuildNotDeleted({
    this.id,
    this.statusCode,
  });

  factory BuildNotDeleted.fromJson(Map<String, dynamic> json) {
    return BuildNotDeleted(
      id: json['id'] as String?,
      statusCode: json['statusCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final statusCode = this.statusCode;
    return {
      if (id != null) 'id': id,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

/// Information about a stage for a build.
class BuildPhase {
  /// Additional information about a build phase, especially to help troubleshoot
  /// a failed build.
  final List<PhaseContext>? contexts;

  /// How long, in seconds, between the starting and ending times of the build's
  /// phase.
  final int? durationInSeconds;

  /// When the build phase ended, expressed in Unix time format.
  final DateTime? endTime;

  /// The current status of the build phase. Valid values include:
  /// <dl> <dt>FAILED</dt> <dd>
  /// The build phase failed.
  /// </dd> <dt>FAULT</dt> <dd>
  /// The build phase faulted.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The build phase is still in progress.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The build phase stopped.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The build phase succeeded.
  /// </dd> <dt>TIMED_OUT</dt> <dd>
  /// The build phase timed out.
  /// </dd> </dl>
  final StatusType? phaseStatus;

  /// The name of the build phase. Valid values include:
  /// <dl> <dt>BUILD</dt> <dd>
  /// Core build activities typically occur in this build phase.
  /// </dd> <dt>COMPLETED</dt> <dd>
  /// The build has been completed.
  /// </dd> <dt>DOWNLOAD_SOURCE</dt> <dd>
  /// Source code is being downloaded in this build phase.
  /// </dd> <dt>FINALIZING</dt> <dd>
  /// The build process is completing in this build phase.
  /// </dd> <dt>INSTALL</dt> <dd>
  /// Installation activities typically occur in this build phase.
  /// </dd> <dt>POST_BUILD</dt> <dd>
  /// Post-build activities typically occur in this build phase.
  /// </dd> <dt>PRE_BUILD</dt> <dd>
  /// Pre-build activities typically occur in this build phase.
  /// </dd> <dt>PROVISIONING</dt> <dd>
  /// The build environment is being set up.
  /// </dd> <dt>QUEUED</dt> <dd>
  /// The build has been submitted and is queued behind other submitted builds.
  /// </dd> <dt>SUBMITTED</dt> <dd>
  /// The build has been submitted.
  /// </dd> <dt>UPLOAD_ARTIFACTS</dt> <dd>
  /// Build output artifacts are being uploaded to the output location.
  /// </dd> </dl>
  final BuildPhaseType? phaseType;

  /// When the build phase started, expressed in Unix time format.
  final DateTime? startTime;

  BuildPhase({
    this.contexts,
    this.durationInSeconds,
    this.endTime,
    this.phaseStatus,
    this.phaseType,
    this.startTime,
  });

  factory BuildPhase.fromJson(Map<String, dynamic> json) {
    return BuildPhase(
      contexts: (json['contexts'] as List?)
          ?.whereNotNull()
          .map((e) => PhaseContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      durationInSeconds: json['durationInSeconds'] as int?,
      endTime: timeStampFromJson(json['endTime']),
      phaseStatus: (json['phaseStatus'] as String?)?.toStatusType(),
      phaseType: (json['phaseType'] as String?)?.toBuildPhaseType(),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contexts = this.contexts;
    final durationInSeconds = this.durationInSeconds;
    final endTime = this.endTime;
    final phaseStatus = this.phaseStatus;
    final phaseType = this.phaseType;
    final startTime = this.startTime;
    return {
      if (contexts != null) 'contexts': contexts,
      if (durationInSeconds != null) 'durationInSeconds': durationInSeconds,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (phaseStatus != null) 'phaseStatus': phaseStatus.toValue(),
      if (phaseType != null) 'phaseType': phaseType.toValue(),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

enum BuildPhaseType {
  submitted,
  queued,
  provisioning,
  downloadSource,
  install,
  preBuild,
  build,
  postBuild,
  uploadArtifacts,
  finalizing,
  completed,
}

extension BuildPhaseTypeValueExtension on BuildPhaseType {
  String toValue() {
    switch (this) {
      case BuildPhaseType.submitted:
        return 'SUBMITTED';
      case BuildPhaseType.queued:
        return 'QUEUED';
      case BuildPhaseType.provisioning:
        return 'PROVISIONING';
      case BuildPhaseType.downloadSource:
        return 'DOWNLOAD_SOURCE';
      case BuildPhaseType.install:
        return 'INSTALL';
      case BuildPhaseType.preBuild:
        return 'PRE_BUILD';
      case BuildPhaseType.build:
        return 'BUILD';
      case BuildPhaseType.postBuild:
        return 'POST_BUILD';
      case BuildPhaseType.uploadArtifacts:
        return 'UPLOAD_ARTIFACTS';
      case BuildPhaseType.finalizing:
        return 'FINALIZING';
      case BuildPhaseType.completed:
        return 'COMPLETED';
    }
  }
}

extension BuildPhaseTypeFromString on String {
  BuildPhaseType toBuildPhaseType() {
    switch (this) {
      case 'SUBMITTED':
        return BuildPhaseType.submitted;
      case 'QUEUED':
        return BuildPhaseType.queued;
      case 'PROVISIONING':
        return BuildPhaseType.provisioning;
      case 'DOWNLOAD_SOURCE':
        return BuildPhaseType.downloadSource;
      case 'INSTALL':
        return BuildPhaseType.install;
      case 'PRE_BUILD':
        return BuildPhaseType.preBuild;
      case 'BUILD':
        return BuildPhaseType.build;
      case 'POST_BUILD':
        return BuildPhaseType.postBuild;
      case 'UPLOAD_ARTIFACTS':
        return BuildPhaseType.uploadArtifacts;
      case 'FINALIZING':
        return BuildPhaseType.finalizing;
      case 'COMPLETED':
        return BuildPhaseType.completed;
    }
    throw Exception('$this is not known in enum BuildPhaseType');
  }
}

/// Contains information that defines how the CodeBuild build project reports
/// the build status to the source provider.
class BuildStatusConfig {
  /// Specifies the context of the build status CodeBuild sends to the source
  /// provider. The usage of this parameter depends on the source provider.
  /// <dl> <dt>Bitbucket</dt> <dd>
  /// This parameter is used for the <code>name</code> parameter in the Bitbucket
  /// commit status. For more information, see <a
  /// href="https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/commit/%7Bnode%7D/statuses/build">build</a>
  /// in the Bitbucket API documentation.
  /// </dd> <dt>GitHub/GitHub Enterprise Server</dt> <dd>
  /// This parameter is used for the <code>context</code> parameter in the GitHub
  /// commit status. For more information, see <a
  /// href="https://developer.github.com/v3/repos/statuses/#create-a-commit-status">Create
  /// a commit status</a> in the GitHub developer guide.
  /// </dd> </dl>
  final String? context;

  /// Specifies the target url of the build status CodeBuild sends to the source
  /// provider. The usage of this parameter depends on the source provider.
  /// <dl> <dt>Bitbucket</dt> <dd>
  /// This parameter is used for the <code>url</code> parameter in the Bitbucket
  /// commit status. For more information, see <a
  /// href="https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/commit/%7Bnode%7D/statuses/build">build</a>
  /// in the Bitbucket API documentation.
  /// </dd> <dt>GitHub/GitHub Enterprise Server</dt> <dd>
  /// This parameter is used for the <code>target_url</code> parameter in the
  /// GitHub commit status. For more information, see <a
  /// href="https://developer.github.com/v3/repos/statuses/#create-a-commit-status">Create
  /// a commit status</a> in the GitHub developer guide.
  /// </dd> </dl>
  final String? targetUrl;

  BuildStatusConfig({
    this.context,
    this.targetUrl,
  });

  factory BuildStatusConfig.fromJson(Map<String, dynamic> json) {
    return BuildStatusConfig(
      context: json['context'] as String?,
      targetUrl: json['targetUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final targetUrl = this.targetUrl;
    return {
      if (context != null) 'context': context,
      if (targetUrl != null) 'targetUrl': targetUrl,
    };
  }
}

/// Contains summary information about a batch build group.
class BuildSummary {
  /// The batch build ARN.
  final String? arn;

  /// The status of the build group.
  /// <dl> <dt>FAILED</dt> <dd>
  /// The build group failed.
  /// </dd> <dt>FAULT</dt> <dd>
  /// The build group faulted.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The build group is still in progress.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The build group stopped.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The build group succeeded.
  /// </dd> <dt>TIMED_OUT</dt> <dd>
  /// The build group timed out.
  /// </dd> </dl>
  final StatusType? buildStatus;

  /// A <code>ResolvedArtifact</code> object that represents the primary build
  /// artifacts for the build group.
  final ResolvedArtifact? primaryArtifact;

  /// When the build was started, expressed in Unix time format.
  final DateTime? requestedOn;

  /// An array of <code>ResolvedArtifact</code> objects that represents the
  /// secondary build artifacts for the build group.
  final List<ResolvedArtifact>? secondaryArtifacts;

  BuildSummary({
    this.arn,
    this.buildStatus,
    this.primaryArtifact,
    this.requestedOn,
    this.secondaryArtifacts,
  });

  factory BuildSummary.fromJson(Map<String, dynamic> json) {
    return BuildSummary(
      arn: json['arn'] as String?,
      buildStatus: (json['buildStatus'] as String?)?.toStatusType(),
      primaryArtifact: json['primaryArtifact'] != null
          ? ResolvedArtifact.fromJson(
              json['primaryArtifact'] as Map<String, dynamic>)
          : null,
      requestedOn: timeStampFromJson(json['requestedOn']),
      secondaryArtifacts: (json['secondaryArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ResolvedArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final buildStatus = this.buildStatus;
    final primaryArtifact = this.primaryArtifact;
    final requestedOn = this.requestedOn;
    final secondaryArtifacts = this.secondaryArtifacts;
    return {
      if (arn != null) 'arn': arn,
      if (buildStatus != null) 'buildStatus': buildStatus.toValue(),
      if (primaryArtifact != null) 'primaryArtifact': primaryArtifact,
      if (requestedOn != null) 'requestedOn': unixTimestampToJson(requestedOn),
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
    };
  }
}

enum CacheMode {
  localDockerLayerCache,
  localSourceCache,
  localCustomCache,
}

extension CacheModeValueExtension on CacheMode {
  String toValue() {
    switch (this) {
      case CacheMode.localDockerLayerCache:
        return 'LOCAL_DOCKER_LAYER_CACHE';
      case CacheMode.localSourceCache:
        return 'LOCAL_SOURCE_CACHE';
      case CacheMode.localCustomCache:
        return 'LOCAL_CUSTOM_CACHE';
    }
  }
}

extension CacheModeFromString on String {
  CacheMode toCacheMode() {
    switch (this) {
      case 'LOCAL_DOCKER_LAYER_CACHE':
        return CacheMode.localDockerLayerCache;
      case 'LOCAL_SOURCE_CACHE':
        return CacheMode.localSourceCache;
      case 'LOCAL_CUSTOM_CACHE':
        return CacheMode.localCustomCache;
    }
    throw Exception('$this is not known in enum CacheMode');
  }
}

enum CacheType {
  noCache,
  s3,
  local,
}

extension CacheTypeValueExtension on CacheType {
  String toValue() {
    switch (this) {
      case CacheType.noCache:
        return 'NO_CACHE';
      case CacheType.s3:
        return 'S3';
      case CacheType.local:
        return 'LOCAL';
    }
  }
}

extension CacheTypeFromString on String {
  CacheType toCacheType() {
    switch (this) {
      case 'NO_CACHE':
        return CacheType.noCache;
      case 'S3':
        return CacheType.s3;
      case 'LOCAL':
        return CacheType.local;
    }
    throw Exception('$this is not known in enum CacheType');
  }
}

/// Information about CloudWatch Logs for a build project.
class CloudWatchLogsConfig {
  /// The current status of the logs in CloudWatch Logs for a build project. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: CloudWatch Logs are enabled for this build project.
  /// </li>
  /// <li>
  /// <code>DISABLED</code>: CloudWatch Logs are not enabled for this build
  /// project.
  /// </li>
  /// </ul>
  final LogsConfigStatusType status;

  /// The group name of the logs in CloudWatch Logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with Log Groups and Log Streams</a>.
  final String? groupName;

  /// The prefix of the stream name of the CloudWatch Logs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with Log Groups and Log Streams</a>.
  final String? streamName;

  CloudWatchLogsConfig({
    required this.status,
    this.groupName,
    this.streamName,
  });

  factory CloudWatchLogsConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsConfig(
      status: (json['status'] as String).toLogsConfigStatusType(),
      groupName: json['groupName'] as String?,
      streamName: json['streamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final groupName = this.groupName;
    final streamName = this.streamName;
    return {
      'status': status.toValue(),
      if (groupName != null) 'groupName': groupName,
      if (streamName != null) 'streamName': streamName,
    };
  }
}

/// Contains code coverage report information.
///
/// Line coverage measures how many statements your tests cover. A statement is
/// a single instruction, not including comments, conditionals, etc.
///
/// Branch coverage determines if your tests cover every possible branch of a
/// control structure, such as an <code>if</code> or <code>case</code>
/// statement.
class CodeCoverage {
  /// The percentage of branches that are covered by your tests.
  final double? branchCoveragePercentage;

  /// The number of conditional branches that are covered by your tests.
  final int? branchesCovered;

  /// The number of conditional branches that are not covered by your tests.
  final int? branchesMissed;

  /// The date and time that the tests were run.
  final DateTime? expired;

  /// The path of the test report file.
  final String? filePath;

  /// The identifier of the code coverage report.
  final String? id;

  /// The percentage of lines that are covered by your tests.
  final double? lineCoveragePercentage;

  /// The number of lines that are covered by your tests.
  final int? linesCovered;

  /// The number of lines that are not covered by your tests.
  final int? linesMissed;

  /// The ARN of the report.
  final String? reportARN;

  CodeCoverage({
    this.branchCoveragePercentage,
    this.branchesCovered,
    this.branchesMissed,
    this.expired,
    this.filePath,
    this.id,
    this.lineCoveragePercentage,
    this.linesCovered,
    this.linesMissed,
    this.reportARN,
  });

  factory CodeCoverage.fromJson(Map<String, dynamic> json) {
    return CodeCoverage(
      branchCoveragePercentage: json['branchCoveragePercentage'] as double?,
      branchesCovered: json['branchesCovered'] as int?,
      branchesMissed: json['branchesMissed'] as int?,
      expired: timeStampFromJson(json['expired']),
      filePath: json['filePath'] as String?,
      id: json['id'] as String?,
      lineCoveragePercentage: json['lineCoveragePercentage'] as double?,
      linesCovered: json['linesCovered'] as int?,
      linesMissed: json['linesMissed'] as int?,
      reportARN: json['reportARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchCoveragePercentage = this.branchCoveragePercentage;
    final branchesCovered = this.branchesCovered;
    final branchesMissed = this.branchesMissed;
    final expired = this.expired;
    final filePath = this.filePath;
    final id = this.id;
    final lineCoveragePercentage = this.lineCoveragePercentage;
    final linesCovered = this.linesCovered;
    final linesMissed = this.linesMissed;
    final reportARN = this.reportARN;
    return {
      if (branchCoveragePercentage != null)
        'branchCoveragePercentage': branchCoveragePercentage,
      if (branchesCovered != null) 'branchesCovered': branchesCovered,
      if (branchesMissed != null) 'branchesMissed': branchesMissed,
      if (expired != null) 'expired': unixTimestampToJson(expired),
      if (filePath != null) 'filePath': filePath,
      if (id != null) 'id': id,
      if (lineCoveragePercentage != null)
        'lineCoveragePercentage': lineCoveragePercentage,
      if (linesCovered != null) 'linesCovered': linesCovered,
      if (linesMissed != null) 'linesMissed': linesMissed,
      if (reportARN != null) 'reportARN': reportARN,
    };
  }
}

/// Contains a summary of a code coverage report.
///
/// Line coverage measures how many statements your tests cover. A statement is
/// a single instruction, not including comments, conditionals, etc.
///
/// Branch coverage determines if your tests cover every possible branch of a
/// control structure, such as an <code>if</code> or <code>case</code>
/// statement.
class CodeCoverageReportSummary {
  /// The percentage of branches that are covered by your tests.
  final double? branchCoveragePercentage;

  /// The number of conditional branches that are covered by your tests.
  final int? branchesCovered;

  /// The number of conditional branches that are not covered by your tests.
  final int? branchesMissed;

  /// The percentage of lines that are covered by your tests.
  final double? lineCoveragePercentage;

  /// The number of lines that are covered by your tests.
  final int? linesCovered;

  /// The number of lines that are not covered by your tests.
  final int? linesMissed;

  CodeCoverageReportSummary({
    this.branchCoveragePercentage,
    this.branchesCovered,
    this.branchesMissed,
    this.lineCoveragePercentage,
    this.linesCovered,
    this.linesMissed,
  });

  factory CodeCoverageReportSummary.fromJson(Map<String, dynamic> json) {
    return CodeCoverageReportSummary(
      branchCoveragePercentage: json['branchCoveragePercentage'] as double?,
      branchesCovered: json['branchesCovered'] as int?,
      branchesMissed: json['branchesMissed'] as int?,
      lineCoveragePercentage: json['lineCoveragePercentage'] as double?,
      linesCovered: json['linesCovered'] as int?,
      linesMissed: json['linesMissed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchCoveragePercentage = this.branchCoveragePercentage;
    final branchesCovered = this.branchesCovered;
    final branchesMissed = this.branchesMissed;
    final lineCoveragePercentage = this.lineCoveragePercentage;
    final linesCovered = this.linesCovered;
    final linesMissed = this.linesMissed;
    return {
      if (branchCoveragePercentage != null)
        'branchCoveragePercentage': branchCoveragePercentage,
      if (branchesCovered != null) 'branchesCovered': branchesCovered,
      if (branchesMissed != null) 'branchesMissed': branchesMissed,
      if (lineCoveragePercentage != null)
        'lineCoveragePercentage': lineCoveragePercentage,
      if (linesCovered != null) 'linesCovered': linesCovered,
      if (linesMissed != null) 'linesMissed': linesMissed,
    };
  }
}

enum ComputeType {
  buildGeneral1Small,
  buildGeneral1Medium,
  buildGeneral1Large,
  buildGeneral1Xlarge,
  buildGeneral1_2xlarge,
  buildLambda_1gb,
  buildLambda_2gb,
  buildLambda_4gb,
  buildLambda_8gb,
  buildLambda_10gb,
}

extension ComputeTypeValueExtension on ComputeType {
  String toValue() {
    switch (this) {
      case ComputeType.buildGeneral1Small:
        return 'BUILD_GENERAL1_SMALL';
      case ComputeType.buildGeneral1Medium:
        return 'BUILD_GENERAL1_MEDIUM';
      case ComputeType.buildGeneral1Large:
        return 'BUILD_GENERAL1_LARGE';
      case ComputeType.buildGeneral1Xlarge:
        return 'BUILD_GENERAL1_XLARGE';
      case ComputeType.buildGeneral1_2xlarge:
        return 'BUILD_GENERAL1_2XLARGE';
      case ComputeType.buildLambda_1gb:
        return 'BUILD_LAMBDA_1GB';
      case ComputeType.buildLambda_2gb:
        return 'BUILD_LAMBDA_2GB';
      case ComputeType.buildLambda_4gb:
        return 'BUILD_LAMBDA_4GB';
      case ComputeType.buildLambda_8gb:
        return 'BUILD_LAMBDA_8GB';
      case ComputeType.buildLambda_10gb:
        return 'BUILD_LAMBDA_10GB';
    }
  }
}

extension ComputeTypeFromString on String {
  ComputeType toComputeType() {
    switch (this) {
      case 'BUILD_GENERAL1_SMALL':
        return ComputeType.buildGeneral1Small;
      case 'BUILD_GENERAL1_MEDIUM':
        return ComputeType.buildGeneral1Medium;
      case 'BUILD_GENERAL1_LARGE':
        return ComputeType.buildGeneral1Large;
      case 'BUILD_GENERAL1_XLARGE':
        return ComputeType.buildGeneral1Xlarge;
      case 'BUILD_GENERAL1_2XLARGE':
        return ComputeType.buildGeneral1_2xlarge;
      case 'BUILD_LAMBDA_1GB':
        return ComputeType.buildLambda_1gb;
      case 'BUILD_LAMBDA_2GB':
        return ComputeType.buildLambda_2gb;
      case 'BUILD_LAMBDA_4GB':
        return ComputeType.buildLambda_4gb;
      case 'BUILD_LAMBDA_8GB':
        return ComputeType.buildLambda_8gb;
      case 'BUILD_LAMBDA_10GB':
        return ComputeType.buildLambda_10gb;
    }
    throw Exception('$this is not known in enum ComputeType');
  }
}

class CreateFleetOutput {
  /// Information about the compute fleet
  final Fleet? fleet;

  CreateFleetOutput({
    this.fleet,
  });

  factory CreateFleetOutput.fromJson(Map<String, dynamic> json) {
    return CreateFleetOutput(
      fleet: json['fleet'] != null
          ? Fleet.fromJson(json['fleet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    return {
      if (fleet != null) 'fleet': fleet,
    };
  }
}

class CreateProjectOutput {
  /// Information about the build project that was created.
  final Project? project;

  CreateProjectOutput({
    this.project,
  });

  factory CreateProjectOutput.fromJson(Map<String, dynamic> json) {
    return CreateProjectOutput(
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

class CreateReportGroupOutput {
  /// Information about the report group that was created.
  final ReportGroup? reportGroup;

  CreateReportGroupOutput({
    this.reportGroup,
  });

  factory CreateReportGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateReportGroupOutput(
      reportGroup: json['reportGroup'] != null
          ? ReportGroup.fromJson(json['reportGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportGroup = this.reportGroup;
    return {
      if (reportGroup != null) 'reportGroup': reportGroup,
    };
  }
}

class CreateWebhookOutput {
  /// Information about a webhook that connects repository events to a build
  /// project in CodeBuild.
  final Webhook? webhook;

  CreateWebhookOutput({
    this.webhook,
  });

  factory CreateWebhookOutput.fromJson(Map<String, dynamic> json) {
    return CreateWebhookOutput(
      webhook: json['webhook'] != null
          ? Webhook.fromJson(json['webhook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      if (webhook != null) 'webhook': webhook,
    };
  }
}

enum CredentialProviderType {
  secretsManager,
}

extension CredentialProviderTypeValueExtension on CredentialProviderType {
  String toValue() {
    switch (this) {
      case CredentialProviderType.secretsManager:
        return 'SECRETS_MANAGER';
    }
  }
}

extension CredentialProviderTypeFromString on String {
  CredentialProviderType toCredentialProviderType() {
    switch (this) {
      case 'SECRETS_MANAGER':
        return CredentialProviderType.secretsManager;
    }
    throw Exception('$this is not known in enum CredentialProviderType');
  }
}

/// Contains information about the debug session for a build. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html">Viewing
/// a running build in Session Manager</a>.
class DebugSession {
  /// Specifies if session debugging is enabled for this build.
  final bool? sessionEnabled;

  /// Contains the identifier of the Session Manager session used for the build.
  /// To work with the paused build, you open this session to examine, control,
  /// and resume the build.
  final String? sessionTarget;

  DebugSession({
    this.sessionEnabled,
    this.sessionTarget,
  });

  factory DebugSession.fromJson(Map<String, dynamic> json) {
    return DebugSession(
      sessionEnabled: json['sessionEnabled'] as bool?,
      sessionTarget: json['sessionTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionEnabled = this.sessionEnabled;
    final sessionTarget = this.sessionTarget;
    return {
      if (sessionEnabled != null) 'sessionEnabled': sessionEnabled,
      if (sessionTarget != null) 'sessionTarget': sessionTarget,
    };
  }
}

class DeleteBuildBatchOutput {
  /// An array of strings that contain the identifiers of the builds that were
  /// deleted.
  final List<String>? buildsDeleted;

  /// An array of <code>BuildNotDeleted</code> objects that specify the builds
  /// that could not be deleted.
  final List<BuildNotDeleted>? buildsNotDeleted;

  /// The status code.
  final String? statusCode;

  DeleteBuildBatchOutput({
    this.buildsDeleted,
    this.buildsNotDeleted,
    this.statusCode,
  });

  factory DeleteBuildBatchOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBuildBatchOutput(
      buildsDeleted: (json['buildsDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      buildsNotDeleted: (json['buildsNotDeleted'] as List?)
          ?.whereNotNull()
          .map((e) => BuildNotDeleted.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buildsDeleted = this.buildsDeleted;
    final buildsNotDeleted = this.buildsNotDeleted;
    final statusCode = this.statusCode;
    return {
      if (buildsDeleted != null) 'buildsDeleted': buildsDeleted,
      if (buildsNotDeleted != null) 'buildsNotDeleted': buildsNotDeleted,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

class DeleteFleetOutput {
  DeleteFleetOutput();

  factory DeleteFleetOutput.fromJson(Map<String, dynamic> _) {
    return DeleteFleetOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteProjectOutput {
  DeleteProjectOutput();

  factory DeleteProjectOutput.fromJson(Map<String, dynamic> _) {
    return DeleteProjectOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteReportGroupOutput {
  DeleteReportGroupOutput();

  factory DeleteReportGroupOutput.fromJson(Map<String, dynamic> _) {
    return DeleteReportGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteReportOutput {
  DeleteReportOutput();

  factory DeleteReportOutput.fromJson(Map<String, dynamic> _) {
    return DeleteReportOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyOutput {
  DeleteResourcePolicyOutput();

  factory DeleteResourcePolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSourceCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the token.
  final String? arn;

  DeleteSourceCredentialsOutput({
    this.arn,
  });

  factory DeleteSourceCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSourceCredentialsOutput(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class DeleteWebhookOutput {
  DeleteWebhookOutput();

  factory DeleteWebhookOutput.fromJson(Map<String, dynamic> _) {
    return DeleteWebhookOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeCodeCoveragesOutput {
  /// An array of <code>CodeCoverage</code> objects that contain the results.
  final List<CodeCoverage>? codeCoverages;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>DescribeCodeCoverages</code> to retrieve the next
  /// set of items.
  final String? nextToken;

  DescribeCodeCoveragesOutput({
    this.codeCoverages,
    this.nextToken,
  });

  factory DescribeCodeCoveragesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeCodeCoveragesOutput(
      codeCoverages: (json['codeCoverages'] as List?)
          ?.whereNotNull()
          .map((e) => CodeCoverage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeCoverages = this.codeCoverages;
    final nextToken = this.nextToken;
    return {
      if (codeCoverages != null) 'codeCoverages': codeCoverages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeTestCasesOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The returned list of test cases.
  final List<TestCase>? testCases;

  DescribeTestCasesOutput({
    this.nextToken,
    this.testCases,
  });

  factory DescribeTestCasesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeTestCasesOutput(
      nextToken: json['nextToken'] as String?,
      testCases: (json['testCases'] as List?)
          ?.whereNotNull()
          .map((e) => TestCase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final testCases = this.testCases;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (testCases != null) 'testCases': testCases,
    };
  }
}

/// Information about a Docker image that is managed by CodeBuild.
class EnvironmentImage {
  /// The description of the Docker image.
  final String? description;

  /// The name of the Docker image.
  final String? name;

  /// A list of environment image versions.
  final List<String>? versions;

  EnvironmentImage({
    this.description,
    this.name,
    this.versions,
  });

  factory EnvironmentImage.fromJson(Map<String, dynamic> json) {
    return EnvironmentImage(
      description: json['description'] as String?,
      name: json['name'] as String?,
      versions: (json['versions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final versions = this.versions;
    return {
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (versions != null) 'versions': versions,
    };
  }
}

/// A set of Docker images that are related by programming language and are
/// managed by CodeBuild.
class EnvironmentLanguage {
  /// The list of Docker images that are related by the specified programming
  /// language.
  final List<EnvironmentImage>? images;

  /// The programming language for the Docker images.
  final LanguageType? language;

  EnvironmentLanguage({
    this.images,
    this.language,
  });

  factory EnvironmentLanguage.fromJson(Map<String, dynamic> json) {
    return EnvironmentLanguage(
      images: (json['images'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      language: (json['language'] as String?)?.toLanguageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final images = this.images;
    final language = this.language;
    return {
      if (images != null) 'images': images,
      if (language != null) 'language': language.toValue(),
    };
  }
}

/// A set of Docker images that are related by platform and are managed by
/// CodeBuild.
class EnvironmentPlatform {
  /// The list of programming languages that are available for the specified
  /// platform.
  final List<EnvironmentLanguage>? languages;

  /// The platform's name.
  final PlatformType? platform;

  EnvironmentPlatform({
    this.languages,
    this.platform,
  });

  factory EnvironmentPlatform.fromJson(Map<String, dynamic> json) {
    return EnvironmentPlatform(
      languages: (json['languages'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      platform: (json['platform'] as String?)?.toPlatformType(),
    );
  }

  Map<String, dynamic> toJson() {
    final languages = this.languages;
    final platform = this.platform;
    return {
      if (languages != null) 'languages': languages,
      if (platform != null) 'platform': platform.toValue(),
    };
  }
}

enum EnvironmentType {
  windowsContainer,
  linuxContainer,
  linuxGpuContainer,
  armContainer,
  windowsServer_2019Container,
  linuxLambdaContainer,
  armLambdaContainer,
}

extension EnvironmentTypeValueExtension on EnvironmentType {
  String toValue() {
    switch (this) {
      case EnvironmentType.windowsContainer:
        return 'WINDOWS_CONTAINER';
      case EnvironmentType.linuxContainer:
        return 'LINUX_CONTAINER';
      case EnvironmentType.linuxGpuContainer:
        return 'LINUX_GPU_CONTAINER';
      case EnvironmentType.armContainer:
        return 'ARM_CONTAINER';
      case EnvironmentType.windowsServer_2019Container:
        return 'WINDOWS_SERVER_2019_CONTAINER';
      case EnvironmentType.linuxLambdaContainer:
        return 'LINUX_LAMBDA_CONTAINER';
      case EnvironmentType.armLambdaContainer:
        return 'ARM_LAMBDA_CONTAINER';
    }
  }
}

extension EnvironmentTypeFromString on String {
  EnvironmentType toEnvironmentType() {
    switch (this) {
      case 'WINDOWS_CONTAINER':
        return EnvironmentType.windowsContainer;
      case 'LINUX_CONTAINER':
        return EnvironmentType.linuxContainer;
      case 'LINUX_GPU_CONTAINER':
        return EnvironmentType.linuxGpuContainer;
      case 'ARM_CONTAINER':
        return EnvironmentType.armContainer;
      case 'WINDOWS_SERVER_2019_CONTAINER':
        return EnvironmentType.windowsServer_2019Container;
      case 'LINUX_LAMBDA_CONTAINER':
        return EnvironmentType.linuxLambdaContainer;
      case 'ARM_LAMBDA_CONTAINER':
        return EnvironmentType.armLambdaContainer;
    }
    throw Exception('$this is not known in enum EnvironmentType');
  }
}

/// Information about an environment variable for a build project or a build.
class EnvironmentVariable {
  /// The name or key of the environment variable.
  final String name;

  /// The value of the environment variable.
  /// <important>
  /// We strongly discourage the use of <code>PLAINTEXT</code> environment
  /// variables to store sensitive values, especially Amazon Web Services secret
  /// key IDs. <code>PLAINTEXT</code> environment variables can be displayed in
  /// plain text using the CodeBuild console and the CLI. For sensitive values, we
  /// recommend you use an environment variable of type
  /// <code>PARAMETER_STORE</code> or <code>SECRETS_MANAGER</code>.
  /// </important>
  final String value;

  /// The type of environment variable. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PARAMETER_STORE</code>: An environment variable stored in Systems
  /// Manager Parameter Store. For environment variables of this type, specify the
  /// name of the parameter as the <code>value</code> of the EnvironmentVariable.
  /// The parameter value will be substituted for the name at runtime. You can
  /// also define Parameter Store environment variables in the buildspec. To learn
  /// how to do so, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.parameter-store">env/parameter-store</a>
  /// in the <i>CodeBuild User Guide</i>.
  /// </li>
  /// <li>
  /// <code>PLAINTEXT</code>: An environment variable in plain text format. This
  /// is the default value.
  /// </li>
  /// <li>
  /// <code>SECRETS_MANAGER</code>: An environment variable stored in Secrets
  /// Manager. For environment variables of this type, specify the name of the
  /// secret as the <code>value</code> of the EnvironmentVariable. The secret
  /// value will be substituted for the name at runtime. You can also define
  /// Secrets Manager environment variables in the buildspec. To learn how to do
  /// so, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.secrets-manager">env/secrets-manager</a>
  /// in the <i>CodeBuild User Guide</i>.
  /// </li>
  /// </ul>
  final EnvironmentVariableType? type;

  EnvironmentVariable({
    required this.name,
    required this.value,
    this.type,
  });

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return EnvironmentVariable(
      name: json['name'] as String,
      value: json['value'] as String,
      type: (json['type'] as String?)?.toEnvironmentVariableType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    final type = this.type;
    return {
      'name': name,
      'value': value,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum EnvironmentVariableType {
  plaintext,
  parameterStore,
  secretsManager,
}

extension EnvironmentVariableTypeValueExtension on EnvironmentVariableType {
  String toValue() {
    switch (this) {
      case EnvironmentVariableType.plaintext:
        return 'PLAINTEXT';
      case EnvironmentVariableType.parameterStore:
        return 'PARAMETER_STORE';
      case EnvironmentVariableType.secretsManager:
        return 'SECRETS_MANAGER';
    }
  }
}

extension EnvironmentVariableTypeFromString on String {
  EnvironmentVariableType toEnvironmentVariableType() {
    switch (this) {
      case 'PLAINTEXT':
        return EnvironmentVariableType.plaintext;
      case 'PARAMETER_STORE':
        return EnvironmentVariableType.parameterStore;
      case 'SECRETS_MANAGER':
        return EnvironmentVariableType.secretsManager;
    }
    throw Exception('$this is not known in enum EnvironmentVariableType');
  }
}

/// Contains information about an exported environment variable.
///
/// Exported environment variables are used in conjunction with CodePipeline to
/// export environment variables from the current build stage to subsequent
/// stages in the pipeline. For more information, see <a
/// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-variables.html">Working
/// with variables</a> in the <i>CodePipeline User Guide</i>.
/// <note>
/// During a build, the value of a variable is available starting with the
/// <code>install</code> phase. It can be updated between the start of the
/// <code>install</code> phase and the end of the <code>post_build</code> phase.
/// After the <code>post_build</code> phase ends, the value of exported
/// variables cannot change.
/// </note>
class ExportedEnvironmentVariable {
  /// The name of the exported environment variable.
  final String? name;

  /// The value assigned to the exported environment variable.
  final String? value;

  ExportedEnvironmentVariable({
    this.name,
    this.value,
  });

  factory ExportedEnvironmentVariable.fromJson(Map<String, dynamic> json) {
    return ExportedEnvironmentVariable(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

enum FileSystemType {
  efs,
}

extension FileSystemTypeValueExtension on FileSystemType {
  String toValue() {
    switch (this) {
      case FileSystemType.efs:
        return 'EFS';
    }
  }
}

extension FileSystemTypeFromString on String {
  FileSystemType toFileSystemType() {
    switch (this) {
      case 'EFS':
        return FileSystemType.efs;
    }
    throw Exception('$this is not known in enum FileSystemType');
  }
}

/// A set of dedicated instances for your build environment.
class Fleet {
  /// The ARN of the compute fleet.
  final String? arn;

  /// The initial number of machines allocated to the compute ﬂeet, which deﬁnes
  /// the number of builds that can run in parallel.
  final int? baseCapacity;

  /// Information about the compute resources the compute fleet uses. Available
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL</code>: Use up to 3 GB memory and 2 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM</code>: Use up to 7 GB memory and 4 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE</code>: Use up to 16 GB memory and 8 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_XLARGE</code>: Use up to 70 GB memory and 36 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs, and
  /// 824 GB of SSD storage for builds. This compute type supports Docker images
  /// up to 100 GB uncompressed.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_SMALL</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 3 GB
  /// memory and 2 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to 16
  /// GB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 4 GB
  /// memory and 2 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_LARGE</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 15 GB
  /// memory and 8 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to 255
  /// GB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 16 GB
  /// memory and 8 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild User Guide.</i>
  final ComputeType? computeType;

  /// The time at which the compute fleet was created.
  final DateTime? created;

  /// The environment type of the compute fleet.
  ///
  /// <ul>
  /// <li>
  /// The environment type <code>ARM_CONTAINER</code> is available only in regions
  /// US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia
  /// Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Singapore), Asia
  /// Pacific (Sydney), EU (Frankfurt), and South America (São Paulo).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Singapore),
  /// Asia Pacific (Sydney), South America (São Paulo), and Asia Pacific (Mumbai).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Tokyo), and Asia Pacific (Sydney).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2019_CONTAINER</code> is available
  /// only in regions US East (N. Virginia), US East (Ohio), US West (Oregon),
  /// Asia Pacific (Sydney), Asia Pacific (Tokyo), Asia Pacific (Mumbai) and EU
  /// (Ireland).
  /// </li>
  /// <li>
  /// The environment type <code>WINDOWS_SERVER_2022_CONTAINER</code> is available
  /// only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU
  /// (Ireland), EU (Frankfurt), Asia Pacific (Sydney), Asia Pacific (Singapore),
  /// Asia Pacific (Tokyo), South America (São Paulo) and Asia Pacific (Mumbai).
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild user guide</i>.
  final EnvironmentType? environmentType;

  /// The service role associated with the compute fleet. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-permission-policy-fleet-service-role.html">
  /// Allow a user to add a permission policy for a fleet service role</a> in the
  /// <i>CodeBuild User Guide</i>.
  final String? fleetServiceRole;

  /// The ID of the compute fleet.
  final String? id;

  /// The time at which the compute fleet was last modified.
  final DateTime? lastModified;

  /// The name of the compute fleet.
  final String? name;

  /// The compute fleet overflow behavior.
  ///
  /// <ul>
  /// <li>
  /// For overflow behavior <code>QUEUE</code>, your overflow builds need to wait
  /// on the existing fleet instance to become available.
  /// </li>
  /// <li>
  /// For overflow behavior <code>ON_DEMAND</code>, your overflow builds run on
  /// CodeBuild on-demand.
  /// <note>
  /// If you choose to set your overflow behavior to on-demand while creating a
  /// VPC-connected fleet, make sure that you add the required VPC permissions to
  /// your project service role. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html#customer-managed-policies-example-create-vpc-network-interface">Example
  /// policy statement to allow CodeBuild access to Amazon Web Services services
  /// required to create a VPC network interface</a>.
  /// </note> </li>
  /// </ul>
  final FleetOverflowBehavior? overflowBehavior;

  /// The scaling configuration of the compute fleet.
  final ScalingConfigurationOutput? scalingConfiguration;

  /// The status of the compute fleet.
  final FleetStatus? status;

  /// A list of tag key and value pairs associated with this compute fleet.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  final List<Tag>? tags;
  final VpcConfig? vpcConfig;

  Fleet({
    this.arn,
    this.baseCapacity,
    this.computeType,
    this.created,
    this.environmentType,
    this.fleetServiceRole,
    this.id,
    this.lastModified,
    this.name,
    this.overflowBehavior,
    this.scalingConfiguration,
    this.status,
    this.tags,
    this.vpcConfig,
  });

  factory Fleet.fromJson(Map<String, dynamic> json) {
    return Fleet(
      arn: json['arn'] as String?,
      baseCapacity: json['baseCapacity'] as int?,
      computeType: (json['computeType'] as String?)?.toComputeType(),
      created: timeStampFromJson(json['created']),
      environmentType:
          (json['environmentType'] as String?)?.toEnvironmentType(),
      fleetServiceRole: json['fleetServiceRole'] as String?,
      id: json['id'] as String?,
      lastModified: timeStampFromJson(json['lastModified']),
      name: json['name'] as String?,
      overflowBehavior:
          (json['overflowBehavior'] as String?)?.toFleetOverflowBehavior(),
      scalingConfiguration: json['scalingConfiguration'] != null
          ? ScalingConfigurationOutput.fromJson(
              json['scalingConfiguration'] as Map<String, dynamic>)
          : null,
      status: json['status'] != null
          ? FleetStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final baseCapacity = this.baseCapacity;
    final computeType = this.computeType;
    final created = this.created;
    final environmentType = this.environmentType;
    final fleetServiceRole = this.fleetServiceRole;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final overflowBehavior = this.overflowBehavior;
    final scalingConfiguration = this.scalingConfiguration;
    final status = this.status;
    final tags = this.tags;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (baseCapacity != null) 'baseCapacity': baseCapacity,
      if (computeType != null) 'computeType': computeType.toValue(),
      if (created != null) 'created': unixTimestampToJson(created),
      if (environmentType != null) 'environmentType': environmentType.toValue(),
      if (fleetServiceRole != null) 'fleetServiceRole': fleetServiceRole,
      if (id != null) 'id': id,
      if (lastModified != null)
        'lastModified': unixTimestampToJson(lastModified),
      if (name != null) 'name': name,
      if (overflowBehavior != null)
        'overflowBehavior': overflowBehavior.toValue(),
      if (scalingConfiguration != null)
        'scalingConfiguration': scalingConfiguration,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

enum FleetContextCode {
  createFailed,
  updateFailed,
  actionRequired,
}

extension FleetContextCodeValueExtension on FleetContextCode {
  String toValue() {
    switch (this) {
      case FleetContextCode.createFailed:
        return 'CREATE_FAILED';
      case FleetContextCode.updateFailed:
        return 'UPDATE_FAILED';
      case FleetContextCode.actionRequired:
        return 'ACTION_REQUIRED';
    }
  }
}

extension FleetContextCodeFromString on String {
  FleetContextCode toFleetContextCode() {
    switch (this) {
      case 'CREATE_FAILED':
        return FleetContextCode.createFailed;
      case 'UPDATE_FAILED':
        return FleetContextCode.updateFailed;
      case 'ACTION_REQUIRED':
        return FleetContextCode.actionRequired;
    }
    throw Exception('$this is not known in enum FleetContextCode');
  }
}

enum FleetOverflowBehavior {
  queue,
  onDemand,
}

extension FleetOverflowBehaviorValueExtension on FleetOverflowBehavior {
  String toValue() {
    switch (this) {
      case FleetOverflowBehavior.queue:
        return 'QUEUE';
      case FleetOverflowBehavior.onDemand:
        return 'ON_DEMAND';
    }
  }
}

extension FleetOverflowBehaviorFromString on String {
  FleetOverflowBehavior toFleetOverflowBehavior() {
    switch (this) {
      case 'QUEUE':
        return FleetOverflowBehavior.queue;
      case 'ON_DEMAND':
        return FleetOverflowBehavior.onDemand;
    }
    throw Exception('$this is not known in enum FleetOverflowBehavior');
  }
}

enum FleetScalingMetricType {
  fleetUtilizationRate,
}

extension FleetScalingMetricTypeValueExtension on FleetScalingMetricType {
  String toValue() {
    switch (this) {
      case FleetScalingMetricType.fleetUtilizationRate:
        return 'FLEET_UTILIZATION_RATE';
    }
  }
}

extension FleetScalingMetricTypeFromString on String {
  FleetScalingMetricType toFleetScalingMetricType() {
    switch (this) {
      case 'FLEET_UTILIZATION_RATE':
        return FleetScalingMetricType.fleetUtilizationRate;
    }
    throw Exception('$this is not known in enum FleetScalingMetricType');
  }
}

enum FleetScalingType {
  targetTrackingScaling,
}

extension FleetScalingTypeValueExtension on FleetScalingType {
  String toValue() {
    switch (this) {
      case FleetScalingType.targetTrackingScaling:
        return 'TARGET_TRACKING_SCALING';
    }
  }
}

extension FleetScalingTypeFromString on String {
  FleetScalingType toFleetScalingType() {
    switch (this) {
      case 'TARGET_TRACKING_SCALING':
        return FleetScalingType.targetTrackingScaling;
    }
    throw Exception('$this is not known in enum FleetScalingType');
  }
}

enum FleetSortByType {
  name,
  createdTime,
  lastModifiedTime,
}

extension FleetSortByTypeValueExtension on FleetSortByType {
  String toValue() {
    switch (this) {
      case FleetSortByType.name:
        return 'NAME';
      case FleetSortByType.createdTime:
        return 'CREATED_TIME';
      case FleetSortByType.lastModifiedTime:
        return 'LAST_MODIFIED_TIME';
    }
  }
}

extension FleetSortByTypeFromString on String {
  FleetSortByType toFleetSortByType() {
    switch (this) {
      case 'NAME':
        return FleetSortByType.name;
      case 'CREATED_TIME':
        return FleetSortByType.createdTime;
      case 'LAST_MODIFIED_TIME':
        return FleetSortByType.lastModifiedTime;
    }
    throw Exception('$this is not known in enum FleetSortByType');
  }
}

/// The status of the compute fleet.
class FleetStatus {
  /// Additional information about a compute fleet. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_FAILED</code>: The compute fleet has failed to create.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code>: The compute fleet has failed to update.
  /// </li>
  /// </ul>
  final FleetContextCode? context;

  /// A message associated with the status of a compute fleet.
  final String? message;

  /// The status code of the compute fleet. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code>: The compute fleet is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code>: The compute fleet is being updated.
  /// </li>
  /// <li>
  /// <code>ROTATING</code>: The compute fleet is being rotated.
  /// </li>
  /// <li>
  /// <code>PENDING_DELETION</code>: The compute fleet is pending deletion.
  /// </li>
  /// <li>
  /// <code>DELETING</code>: The compute fleet is being deleted.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code>: The compute fleet has failed to create.
  /// </li>
  /// <li>
  /// <code>UPDATE_ROLLBACK_FAILED</code>: The compute fleet has failed to update
  /// and could not rollback to previous state.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code>: The compute fleet has succeeded and is active.
  /// </li>
  /// </ul>
  final FleetStatusCode? statusCode;

  FleetStatus({
    this.context,
    this.message,
    this.statusCode,
  });

  factory FleetStatus.fromJson(Map<String, dynamic> json) {
    return FleetStatus(
      context: (json['context'] as String?)?.toFleetContextCode(),
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as String?)?.toFleetStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (context != null) 'context': context.toValue(),
      if (message != null) 'message': message,
      if (statusCode != null) 'statusCode': statusCode.toValue(),
    };
  }
}

enum FleetStatusCode {
  creating,
  updating,
  rotating,
  pendingDeletion,
  deleting,
  createFailed,
  updateRollbackFailed,
  active,
}

extension FleetStatusCodeValueExtension on FleetStatusCode {
  String toValue() {
    switch (this) {
      case FleetStatusCode.creating:
        return 'CREATING';
      case FleetStatusCode.updating:
        return 'UPDATING';
      case FleetStatusCode.rotating:
        return 'ROTATING';
      case FleetStatusCode.pendingDeletion:
        return 'PENDING_DELETION';
      case FleetStatusCode.deleting:
        return 'DELETING';
      case FleetStatusCode.createFailed:
        return 'CREATE_FAILED';
      case FleetStatusCode.updateRollbackFailed:
        return 'UPDATE_ROLLBACK_FAILED';
      case FleetStatusCode.active:
        return 'ACTIVE';
    }
  }
}

extension FleetStatusCodeFromString on String {
  FleetStatusCode toFleetStatusCode() {
    switch (this) {
      case 'CREATING':
        return FleetStatusCode.creating;
      case 'UPDATING':
        return FleetStatusCode.updating;
      case 'ROTATING':
        return FleetStatusCode.rotating;
      case 'PENDING_DELETION':
        return FleetStatusCode.pendingDeletion;
      case 'DELETING':
        return FleetStatusCode.deleting;
      case 'CREATE_FAILED':
        return FleetStatusCode.createFailed;
      case 'UPDATE_ROLLBACK_FAILED':
        return FleetStatusCode.updateRollbackFailed;
      case 'ACTIVE':
        return FleetStatusCode.active;
    }
    throw Exception('$this is not known in enum FleetStatusCode');
  }
}

class GetReportGroupTrendOutput {
  /// An array that contains the raw data for each report.
  final List<ReportWithRawData>? rawData;

  /// Contains the accumulated trend data.
  final ReportGroupTrendStats? stats;

  GetReportGroupTrendOutput({
    this.rawData,
    this.stats,
  });

  factory GetReportGroupTrendOutput.fromJson(Map<String, dynamic> json) {
    return GetReportGroupTrendOutput(
      rawData: (json['rawData'] as List?)
          ?.whereNotNull()
          .map((e) => ReportWithRawData.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: json['stats'] != null
          ? ReportGroupTrendStats.fromJson(
              json['stats'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rawData = this.rawData;
    final stats = this.stats;
    return {
      if (rawData != null) 'rawData': rawData,
      if (stats != null) 'stats': stats,
    };
  }
}

class GetResourcePolicyOutput {
  /// The resource policy for the resource identified by the input ARN parameter.
  final String? policy;

  GetResourcePolicyOutput({
    this.policy,
  });

  factory GetResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyOutput(
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

/// Information about the Git submodules configuration for an CodeBuild build
/// project.
class GitSubmodulesConfig {
  /// Set to true to fetch Git submodules for your CodeBuild build project.
  final bool fetchSubmodules;

  GitSubmodulesConfig({
    required this.fetchSubmodules,
  });

  factory GitSubmodulesConfig.fromJson(Map<String, dynamic> json) {
    return GitSubmodulesConfig(
      fetchSubmodules: json['fetchSubmodules'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final fetchSubmodules = this.fetchSubmodules;
    return {
      'fetchSubmodules': fetchSubmodules,
    };
  }
}

enum ImagePullCredentialsType {
  codebuild,
  serviceRole,
}

extension ImagePullCredentialsTypeValueExtension on ImagePullCredentialsType {
  String toValue() {
    switch (this) {
      case ImagePullCredentialsType.codebuild:
        return 'CODEBUILD';
      case ImagePullCredentialsType.serviceRole:
        return 'SERVICE_ROLE';
    }
  }
}

extension ImagePullCredentialsTypeFromString on String {
  ImagePullCredentialsType toImagePullCredentialsType() {
    switch (this) {
      case 'CODEBUILD':
        return ImagePullCredentialsType.codebuild;
      case 'SERVICE_ROLE':
        return ImagePullCredentialsType.serviceRole;
    }
    throw Exception('$this is not known in enum ImagePullCredentialsType');
  }
}

class ImportSourceCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the token.
  final String? arn;

  ImportSourceCredentialsOutput({
    this.arn,
  });

  factory ImportSourceCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return ImportSourceCredentialsOutput(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class InvalidateProjectCacheOutput {
  InvalidateProjectCacheOutput();

  factory InvalidateProjectCacheOutput.fromJson(Map<String, dynamic> _) {
    return InvalidateProjectCacheOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum LanguageType {
  java,
  python,
  nodeJs,
  ruby,
  golang,
  docker,
  android,
  dotnet,
  base,
  php,
}

extension LanguageTypeValueExtension on LanguageType {
  String toValue() {
    switch (this) {
      case LanguageType.java:
        return 'JAVA';
      case LanguageType.python:
        return 'PYTHON';
      case LanguageType.nodeJs:
        return 'NODE_JS';
      case LanguageType.ruby:
        return 'RUBY';
      case LanguageType.golang:
        return 'GOLANG';
      case LanguageType.docker:
        return 'DOCKER';
      case LanguageType.android:
        return 'ANDROID';
      case LanguageType.dotnet:
        return 'DOTNET';
      case LanguageType.base:
        return 'BASE';
      case LanguageType.php:
        return 'PHP';
    }
  }
}

extension LanguageTypeFromString on String {
  LanguageType toLanguageType() {
    switch (this) {
      case 'JAVA':
        return LanguageType.java;
      case 'PYTHON':
        return LanguageType.python;
      case 'NODE_JS':
        return LanguageType.nodeJs;
      case 'RUBY':
        return LanguageType.ruby;
      case 'GOLANG':
        return LanguageType.golang;
      case 'DOCKER':
        return LanguageType.docker;
      case 'ANDROID':
        return LanguageType.android;
      case 'DOTNET':
        return LanguageType.dotnet;
      case 'BASE':
        return LanguageType.base;
      case 'PHP':
        return LanguageType.php;
    }
    throw Exception('$this is not known in enum LanguageType');
  }
}

class ListBuildBatchesForProjectOutput {
  /// An array of strings that contains the batch build identifiers.
  final List<String>? ids;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>ListBuildBatchesForProject</code> to retrieve the
  /// next set of items.
  final String? nextToken;

  ListBuildBatchesForProjectOutput({
    this.ids,
    this.nextToken,
  });

  factory ListBuildBatchesForProjectOutput.fromJson(Map<String, dynamic> json) {
    return ListBuildBatchesForProjectOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    final nextToken = this.nextToken;
    return {
      if (ids != null) 'ids': ids,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBuildBatchesOutput {
  /// An array of strings that contains the batch build identifiers.
  final List<String>? ids;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>ListBuildBatches</code> to retrieve the next set of
  /// items.
  final String? nextToken;

  ListBuildBatchesOutput({
    this.ids,
    this.nextToken,
  });

  factory ListBuildBatchesOutput.fromJson(Map<String, dynamic> json) {
    return ListBuildBatchesOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    final nextToken = this.nextToken;
    return {
      if (ids != null) 'ids': ids,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBuildsForProjectOutput {
  /// A list of build identifiers for the specified build project, with each build
  /// ID representing a single build.
  final List<String>? ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  ListBuildsForProjectOutput({
    this.ids,
    this.nextToken,
  });

  factory ListBuildsForProjectOutput.fromJson(Map<String, dynamic> json) {
    return ListBuildsForProjectOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    final nextToken = this.nextToken;
    return {
      if (ids != null) 'ids': ids,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBuildsOutput {
  /// A list of build IDs, with each build ID representing a single build.
  final List<String>? ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  ListBuildsOutput({
    this.ids,
    this.nextToken,
  });

  factory ListBuildsOutput.fromJson(Map<String, dynamic> json) {
    return ListBuildsOutput(
      ids: (json['ids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ids = this.ids;
    final nextToken = this.nextToken;
    return {
      if (ids != null) 'ids': ids,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCuratedEnvironmentImagesOutput {
  /// Information about supported platforms for Docker images that are managed by
  /// CodeBuild.
  final List<EnvironmentPlatform>? platforms;

  ListCuratedEnvironmentImagesOutput({
    this.platforms,
  });

  factory ListCuratedEnvironmentImagesOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCuratedEnvironmentImagesOutput(
      platforms: (json['platforms'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final platforms = this.platforms;
    return {
      if (platforms != null) 'platforms': platforms,
    };
  }
}

class ListFleetsOutput {
  /// The list of compute fleet names.
  final List<String>? fleets;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  ListFleetsOutput({
    this.fleets,
    this.nextToken,
  });

  factory ListFleetsOutput.fromJson(Map<String, dynamic> json) {
    return ListFleetsOutput(
      fleets: (json['fleets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final nextToken = this.nextToken;
    return {
      if (fleets != null) 'fleets': fleets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListProjectsOutput {
  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  final String? nextToken;

  /// The list of build project names, with each build project name representing a
  /// single build project.
  final List<String>? projects;

  ListProjectsOutput({
    this.nextToken,
    this.projects,
  });

  factory ListProjectsOutput.fromJson(Map<String, dynamic> json) {
    return ListProjectsOutput(
      nextToken: json['nextToken'] as String?,
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (projects != null) 'projects': projects,
    };
  }
}

class ListReportGroupsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The list of ARNs for the report groups in the current Amazon Web Services
  /// account.
  final List<String>? reportGroups;

  ListReportGroupsOutput({
    this.nextToken,
    this.reportGroups,
  });

  factory ListReportGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListReportGroupsOutput(
      nextToken: json['nextToken'] as String?,
      reportGroups: (json['reportGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportGroups = this.reportGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reportGroups != null) 'reportGroups': reportGroups,
    };
  }
}

class ListReportsForReportGroupOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The list of report ARNs.
  final List<String>? reports;

  ListReportsForReportGroupOutput({
    this.nextToken,
    this.reports,
  });

  factory ListReportsForReportGroupOutput.fromJson(Map<String, dynamic> json) {
    return ListReportsForReportGroupOutput(
      nextToken: json['nextToken'] as String?,
      reports: (json['reports'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reports = this.reports;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reports != null) 'reports': reports,
    };
  }
}

class ListReportsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The list of returned ARNs for the reports in the current Amazon Web Services
  /// account.
  final List<String>? reports;

  ListReportsOutput({
    this.nextToken,
    this.reports,
  });

  factory ListReportsOutput.fromJson(Map<String, dynamic> json) {
    return ListReportsOutput(
      nextToken: json['nextToken'] as String?,
      reports: (json['reports'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reports = this.reports;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reports != null) 'reports': reports,
    };
  }
}

class ListSharedProjectsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The list of ARNs for the build projects shared with the current Amazon Web
  /// Services account or user.
  final List<String>? projects;

  ListSharedProjectsOutput({
    this.nextToken,
    this.projects,
  });

  factory ListSharedProjectsOutput.fromJson(Map<String, dynamic> json) {
    return ListSharedProjectsOutput(
      nextToken: json['nextToken'] as String?,
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (projects != null) 'projects': projects,
    };
  }
}

class ListSharedReportGroupsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  final String? nextToken;

  /// The list of ARNs for the report groups shared with the current Amazon Web
  /// Services account or user.
  final List<String>? reportGroups;

  ListSharedReportGroupsOutput({
    this.nextToken,
    this.reportGroups,
  });

  factory ListSharedReportGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListSharedReportGroupsOutput(
      nextToken: json['nextToken'] as String?,
      reportGroups: (json['reportGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportGroups = this.reportGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reportGroups != null) 'reportGroups': reportGroups,
    };
  }
}

class ListSourceCredentialsOutput {
  /// A list of <code>SourceCredentialsInfo</code> objects. Each
  /// <code>SourceCredentialsInfo</code> object includes the authentication type,
  /// token ARN, and type of source provider for one set of credentials.
  final List<SourceCredentialsInfo>? sourceCredentialsInfos;

  ListSourceCredentialsOutput({
    this.sourceCredentialsInfos,
  });

  factory ListSourceCredentialsOutput.fromJson(Map<String, dynamic> json) {
    return ListSourceCredentialsOutput(
      sourceCredentialsInfos: (json['sourceCredentialsInfos'] as List?)
          ?.whereNotNull()
          .map((e) => SourceCredentialsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceCredentialsInfos = this.sourceCredentialsInfos;
    return {
      if (sourceCredentialsInfos != null)
        'sourceCredentialsInfos': sourceCredentialsInfos,
    };
  }
}

/// Information about logs for a build project. These can be logs in CloudWatch
/// Logs, built in a specified S3 bucket, or both.
class LogsConfig {
  /// Information about CloudWatch Logs for a build project. CloudWatch Logs are
  /// enabled by default.
  final CloudWatchLogsConfig? cloudWatchLogs;

  /// Information about logs built to an S3 bucket for a build project. S3 logs
  /// are not enabled by default.
  final S3LogsConfig? s3Logs;

  LogsConfig({
    this.cloudWatchLogs,
    this.s3Logs,
  });

  factory LogsConfig.fromJson(Map<String, dynamic> json) {
    return LogsConfig(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsConfig.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      s3Logs: json['s3Logs'] != null
          ? S3LogsConfig.fromJson(json['s3Logs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final s3Logs = this.s3Logs;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (s3Logs != null) 's3Logs': s3Logs,
    };
  }
}

enum LogsConfigStatusType {
  enabled,
  disabled,
}

extension LogsConfigStatusTypeValueExtension on LogsConfigStatusType {
  String toValue() {
    switch (this) {
      case LogsConfigStatusType.enabled:
        return 'ENABLED';
      case LogsConfigStatusType.disabled:
        return 'DISABLED';
    }
  }
}

extension LogsConfigStatusTypeFromString on String {
  LogsConfigStatusType toLogsConfigStatusType() {
    switch (this) {
      case 'ENABLED':
        return LogsConfigStatusType.enabled;
      case 'DISABLED':
        return LogsConfigStatusType.disabled;
    }
    throw Exception('$this is not known in enum LogsConfigStatusType');
  }
}

/// Information about build logs in CloudWatch Logs.
class LogsLocation {
  /// Information about CloudWatch Logs for a build project.
  final CloudWatchLogsConfig? cloudWatchLogs;

  /// The ARN of the CloudWatch Logs stream for a build execution. Its format is
  /// <code>arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:${LogStreamName}</code>.
  /// The CloudWatch Logs stream is created during the PROVISIONING phase of a
  /// build and the ARN will not be valid until it is created. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatchlogs.html#amazoncloudwatchlogs-resources-for-iam-policies">Resources
  /// Defined by CloudWatch Logs</a>.
  final String? cloudWatchLogsArn;

  /// The URL to an individual build log in CloudWatch Logs. The log stream is
  /// created during the PROVISIONING phase of a build and the
  /// <code>deeplink</code> will not be valid until it is created.
  final String? deepLink;

  /// The name of the CloudWatch Logs group for the build logs.
  final String? groupName;

  /// The URL to a build log in an S3 bucket.
  final String? s3DeepLink;

  /// Information about S3 logs for a build project.
  final S3LogsConfig? s3Logs;

  /// The ARN of S3 logs for a build project. Its format is
  /// <code>arn:${Partition}:s3:::${BucketName}/${ObjectName}</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html#amazons3-resources-for-iam-policies">Resources
  /// Defined by Amazon S3</a>.
  final String? s3LogsArn;

  /// The name of the CloudWatch Logs stream for the build logs.
  final String? streamName;

  LogsLocation({
    this.cloudWatchLogs,
    this.cloudWatchLogsArn,
    this.deepLink,
    this.groupName,
    this.s3DeepLink,
    this.s3Logs,
    this.s3LogsArn,
    this.streamName,
  });

  factory LogsLocation.fromJson(Map<String, dynamic> json) {
    return LogsLocation(
      cloudWatchLogs: json['cloudWatchLogs'] != null
          ? CloudWatchLogsConfig.fromJson(
              json['cloudWatchLogs'] as Map<String, dynamic>)
          : null,
      cloudWatchLogsArn: json['cloudWatchLogsArn'] as String?,
      deepLink: json['deepLink'] as String?,
      groupName: json['groupName'] as String?,
      s3DeepLink: json['s3DeepLink'] as String?,
      s3Logs: json['s3Logs'] != null
          ? S3LogsConfig.fromJson(json['s3Logs'] as Map<String, dynamic>)
          : null,
      s3LogsArn: json['s3LogsArn'] as String?,
      streamName: json['streamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogs = this.cloudWatchLogs;
    final cloudWatchLogsArn = this.cloudWatchLogsArn;
    final deepLink = this.deepLink;
    final groupName = this.groupName;
    final s3DeepLink = this.s3DeepLink;
    final s3Logs = this.s3Logs;
    final s3LogsArn = this.s3LogsArn;
    final streamName = this.streamName;
    return {
      if (cloudWatchLogs != null) 'cloudWatchLogs': cloudWatchLogs,
      if (cloudWatchLogsArn != null) 'cloudWatchLogsArn': cloudWatchLogsArn,
      if (deepLink != null) 'deepLink': deepLink,
      if (groupName != null) 'groupName': groupName,
      if (s3DeepLink != null) 's3DeepLink': s3DeepLink,
      if (s3Logs != null) 's3Logs': s3Logs,
      if (s3LogsArn != null) 's3LogsArn': s3LogsArn,
      if (streamName != null) 'streamName': streamName,
    };
  }
}

/// Describes a network interface.
class NetworkInterface {
  /// The ID of the network interface.
  final String? networkInterfaceId;

  /// The ID of the subnet.
  final String? subnetId;

  NetworkInterface({
    this.networkInterfaceId,
    this.subnetId,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      networkInterfaceId: json['networkInterfaceId'] as String?,
      subnetId: json['subnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceId = this.networkInterfaceId;
    final subnetId = this.subnetId;
    return {
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (subnetId != null) 'subnetId': subnetId,
    };
  }
}

/// Additional information about a build phase that has an error. You can use
/// this information for troubleshooting.
class PhaseContext {
  /// An explanation of the build phase's context. This might include a command ID
  /// and an exit code.
  final String? message;

  /// The status code for the context of the build phase.
  final String? statusCode;

  PhaseContext({
    this.message,
    this.statusCode,
  });

  factory PhaseContext.fromJson(Map<String, dynamic> json) {
    return PhaseContext(
      message: json['message'] as String?,
      statusCode: json['statusCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'message': message,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

enum PlatformType {
  debian,
  amazonLinux,
  ubuntu,
  windowsServer,
}

extension PlatformTypeValueExtension on PlatformType {
  String toValue() {
    switch (this) {
      case PlatformType.debian:
        return 'DEBIAN';
      case PlatformType.amazonLinux:
        return 'AMAZON_LINUX';
      case PlatformType.ubuntu:
        return 'UBUNTU';
      case PlatformType.windowsServer:
        return 'WINDOWS_SERVER';
    }
  }
}

extension PlatformTypeFromString on String {
  PlatformType toPlatformType() {
    switch (this) {
      case 'DEBIAN':
        return PlatformType.debian;
      case 'AMAZON_LINUX':
        return PlatformType.amazonLinux;
      case 'UBUNTU':
        return PlatformType.ubuntu;
      case 'WINDOWS_SERVER':
        return PlatformType.windowsServer;
    }
    throw Exception('$this is not known in enum PlatformType');
  }
}

/// Information about a build project.
class Project {
  /// The Amazon Resource Name (ARN) of the build project.
  final String? arn;

  /// Information about the build output artifacts for the build project.
  final ProjectArtifacts? artifacts;

  /// Information about the build badge for the build project.
  final ProjectBadge? badge;

  /// A <a>ProjectBuildBatchConfig</a> object that defines the batch build options
  /// for the project.
  final ProjectBuildBatchConfig? buildBatchConfig;

  /// Information about the cache for the build project.
  final ProjectCache? cache;

  /// The maximum number of concurrent builds that are allowed for this project.
  ///
  /// New builds are only started if the current number of builds is less than or
  /// equal to this limit. If the current build count meets this limit, new builds
  /// are throttled and are not run.
  final int? concurrentBuildLimit;

  /// When the build project was created, expressed in Unix time format.
  final DateTime? created;

  /// A description that makes the build project easy to identify.
  final String? description;

  /// The Key Management Service customer master key (CMK) to be used for
  /// encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>). If you don't specify a value,
  /// CodeBuild uses the managed CMK for Amazon Simple Storage Service (Amazon
  /// S3).
  final String? encryptionKey;

  /// Information about the build environment for this build project.
  final ProjectEnvironment? environment;

  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  final List<ProjectFileSystemLocation>? fileSystemLocations;

  /// When the build project's settings were last modified, expressed in Unix time
  /// format.
  final DateTime? lastModified;

  /// Information about logs for the build project. A project can create logs in
  /// CloudWatch Logs, an S3 bucket, or both.
  final LogsConfig? logsConfig;

  /// The name of the build project.
  final String? name;
  final ProjectVisibilityType? projectVisibility;

  /// Contains the project identifier used with the public build APIs.
  final String? publicProjectAlias;

  /// The number of minutes a build is allowed to be queued before it times out.
  final int? queuedTimeoutInMinutes;

  /// The ARN of the IAM role that enables CodeBuild to access the CloudWatch Logs
  /// and Amazon S3 artifacts for the project's builds.
  final String? resourceAccessRole;

  /// An array of <code>ProjectArtifacts</code> objects.
  final List<ProjectArtifacts>? secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. If
  /// <code>secondarySourceVersions</code> is specified at the build level, then
  /// they take over these <code>secondarySourceVersions</code> (at the project
  /// level).
  final List<ProjectSourceVersion>? secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects.
  final List<ProjectSource>? secondarySources;

  /// The ARN of the IAM role that enables CodeBuild to interact with dependent
  /// Amazon Web Services services on behalf of the Amazon Web Services account.
  final String? serviceRole;

  /// Information about the build input source code for this build project.
  final ProjectSource? source;

  /// A version of the build input to be built for this project. If not specified,
  /// the latest version is used. If specified, it must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For GitLab: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build input
  /// ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  final String? sourceVersion;

  /// A list of tag key and value pairs associated with this build project.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild build project tags.
  final List<Tag>? tags;

  /// How long, in minutes, from 5 to 2160 (36 hours), for CodeBuild to wait
  /// before timing out any related build that did not get marked as completed.
  /// The default is 60 minutes.
  final int? timeoutInMinutes;

  /// Information about the VPC configuration that CodeBuild accesses.
  final VpcConfig? vpcConfig;

  /// Information about a webhook that connects repository events to a build
  /// project in CodeBuild.
  final Webhook? webhook;

  Project({
    this.arn,
    this.artifacts,
    this.badge,
    this.buildBatchConfig,
    this.cache,
    this.concurrentBuildLimit,
    this.created,
    this.description,
    this.encryptionKey,
    this.environment,
    this.fileSystemLocations,
    this.lastModified,
    this.logsConfig,
    this.name,
    this.projectVisibility,
    this.publicProjectAlias,
    this.queuedTimeoutInMinutes,
    this.resourceAccessRole,
    this.secondaryArtifacts,
    this.secondarySourceVersions,
    this.secondarySources,
    this.serviceRole,
    this.source,
    this.sourceVersion,
    this.tags,
    this.timeoutInMinutes,
    this.vpcConfig,
    this.webhook,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      arn: json['arn'] as String?,
      artifacts: json['artifacts'] != null
          ? ProjectArtifacts.fromJson(json['artifacts'] as Map<String, dynamic>)
          : null,
      badge: json['badge'] != null
          ? ProjectBadge.fromJson(json['badge'] as Map<String, dynamic>)
          : null,
      buildBatchConfig: json['buildBatchConfig'] != null
          ? ProjectBuildBatchConfig.fromJson(
              json['buildBatchConfig'] as Map<String, dynamic>)
          : null,
      cache: json['cache'] != null
          ? ProjectCache.fromJson(json['cache'] as Map<String, dynamic>)
          : null,
      concurrentBuildLimit: json['concurrentBuildLimit'] as int?,
      created: timeStampFromJson(json['created']),
      description: json['description'] as String?,
      encryptionKey: json['encryptionKey'] as String?,
      environment: json['environment'] != null
          ? ProjectEnvironment.fromJson(
              json['environment'] as Map<String, dynamic>)
          : null,
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProjectFileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModified: timeStampFromJson(json['lastModified']),
      logsConfig: json['logsConfig'] != null
          ? LogsConfig.fromJson(json['logsConfig'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      projectVisibility:
          (json['projectVisibility'] as String?)?.toProjectVisibilityType(),
      publicProjectAlias: json['publicProjectAlias'] as String?,
      queuedTimeoutInMinutes: json['queuedTimeoutInMinutes'] as int?,
      resourceAccessRole: json['resourceAccessRole'] as String?,
      secondaryArtifacts: (json['secondaryArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectArtifacts.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySourceVersions: (json['secondarySourceVersions'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSourceVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondarySources: (json['secondarySources'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceRole: json['serviceRole'] as String?,
      source: json['source'] != null
          ? ProjectSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      sourceVersion: json['sourceVersion'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeoutInMinutes: json['timeoutInMinutes'] as int?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
      webhook: json['webhook'] != null
          ? Webhook.fromJson(json['webhook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final artifacts = this.artifacts;
    final badge = this.badge;
    final buildBatchConfig = this.buildBatchConfig;
    final cache = this.cache;
    final concurrentBuildLimit = this.concurrentBuildLimit;
    final created = this.created;
    final description = this.description;
    final encryptionKey = this.encryptionKey;
    final environment = this.environment;
    final fileSystemLocations = this.fileSystemLocations;
    final lastModified = this.lastModified;
    final logsConfig = this.logsConfig;
    final name = this.name;
    final projectVisibility = this.projectVisibility;
    final publicProjectAlias = this.publicProjectAlias;
    final queuedTimeoutInMinutes = this.queuedTimeoutInMinutes;
    final resourceAccessRole = this.resourceAccessRole;
    final secondaryArtifacts = this.secondaryArtifacts;
    final secondarySourceVersions = this.secondarySourceVersions;
    final secondarySources = this.secondarySources;
    final serviceRole = this.serviceRole;
    final source = this.source;
    final sourceVersion = this.sourceVersion;
    final tags = this.tags;
    final timeoutInMinutes = this.timeoutInMinutes;
    final vpcConfig = this.vpcConfig;
    final webhook = this.webhook;
    return {
      if (arn != null) 'arn': arn,
      if (artifacts != null) 'artifacts': artifacts,
      if (badge != null) 'badge': badge,
      if (buildBatchConfig != null) 'buildBatchConfig': buildBatchConfig,
      if (cache != null) 'cache': cache,
      if (concurrentBuildLimit != null)
        'concurrentBuildLimit': concurrentBuildLimit,
      if (created != null) 'created': unixTimestampToJson(created),
      if (description != null) 'description': description,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (environment != null) 'environment': environment,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
      if (lastModified != null)
        'lastModified': unixTimestampToJson(lastModified),
      if (logsConfig != null) 'logsConfig': logsConfig,
      if (name != null) 'name': name,
      if (projectVisibility != null)
        'projectVisibility': projectVisibility.toValue(),
      if (publicProjectAlias != null) 'publicProjectAlias': publicProjectAlias,
      if (queuedTimeoutInMinutes != null)
        'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
      if (resourceAccessRole != null) 'resourceAccessRole': resourceAccessRole,
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
      if (secondarySourceVersions != null)
        'secondarySourceVersions': secondarySourceVersions,
      if (secondarySources != null) 'secondarySources': secondarySources,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (source != null) 'source': source,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (tags != null) 'tags': tags,
      if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
      if (webhook != null) 'webhook': webhook,
    };
  }
}

/// Information about the build output artifacts for the build project.
class ProjectArtifacts {
  /// The type of build output artifact. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CODEPIPELINE</code>: The build project has build output generated
  /// through CodePipeline.
  /// <note>
  /// The <code>CODEPIPELINE</code> type is not supported for
  /// <code>secondaryArtifacts</code>.
  /// </note> </li>
  /// <li>
  /// <code>NO_ARTIFACTS</code>: The build project does not produce any build
  /// output.
  /// </li>
  /// <li>
  /// <code>S3</code>: The build project stores build output in Amazon S3.
  /// </li>
  /// </ul>
  final ArtifactsType type;

  /// An identifier for this artifact definition.
  final String? artifactIdentifier;
  final BucketOwnerAccess? bucketOwnerAccess;

  /// Set to true if you do not want your output artifacts encrypted. This option
  /// is valid only if your artifacts type is Amazon S3. If this is set with
  /// another artifacts type, an invalidInputException is thrown.
  final bool? encryptionDisabled;

  /// Information about the build output artifact location:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, CodePipeline
  /// ignores this value if specified. This is because CodePipeline manages its
  /// build output locations instead of CodeBuild.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is
  /// ignored if specified, because no build output is produced.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>S3</code>, this is the name of the
  /// output bucket.
  /// </li>
  /// </ul>
  final String? location;

  /// Along with <code>path</code> and <code>namespaceType</code>, the pattern
  /// that CodeBuild uses to name and store the output artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, CodePipeline
  /// ignores this value if specified. This is because CodePipeline manages its
  /// build output names instead of CodeBuild.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is
  /// ignored if specified, because no build output is produced.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>S3</code>, this is the name of the
  /// output artifact object. If you set the name to be a forward slash ("/"), the
  /// artifact is stored in the root of the output bucket.
  /// </li>
  /// </ul>
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// If <code>path</code> is set to <code>MyArtifacts</code>,
  /// <code>namespaceType</code> is set to <code>BUILD_ID</code>, and
  /// <code>name</code> is set to <code>MyArtifact.zip</code>, then the output
  /// artifact is stored in
  /// <code>MyArtifacts/&lt;build-ID&gt;/MyArtifact.zip</code>.
  /// </li>
  /// <li>
  /// If <code>path</code> is empty, <code>namespaceType</code> is set to
  /// <code>NONE</code>, and <code>name</code> is set to "<code>/</code>", the
  /// output artifact is stored in the root of the output bucket.
  /// </li>
  /// <li>
  /// If <code>path</code> is set to <code>MyArtifacts</code>,
  /// <code>namespaceType</code> is set to <code>BUILD_ID</code>, and
  /// <code>name</code> is set to "<code>/</code>", the output artifact is stored
  /// in <code>MyArtifacts/&lt;build-ID&gt;</code>.
  /// </li>
  /// </ul>
  final String? name;

  /// Along with <code>path</code> and <code>name</code>, the pattern that
  /// CodeBuild uses to determine the name and location to store the output
  /// artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, CodePipeline
  /// ignores this value if specified. This is because CodePipeline manages its
  /// build output names instead of CodeBuild.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is
  /// ignored if specified, because no build output is produced.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>S3</code>, valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_ID</code>: Include the build ID in the location of the build
  /// output artifact.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Do not include the build ID. This is the default if
  /// <code>namespaceType</code> is not specified.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// For example, if <code>path</code> is set to <code>MyArtifacts</code>,
  /// <code>namespaceType</code> is set to <code>BUILD_ID</code>, and
  /// <code>name</code> is set to <code>MyArtifact.zip</code>, the output artifact
  /// is stored in <code>MyArtifacts/&lt;build-ID&gt;/MyArtifact.zip</code>.
  final ArtifactNamespace? namespaceType;

  /// If this flag is set, a name specified in the buildspec file overrides the
  /// artifact name. The name specified in a buildspec file is calculated at build
  /// time and uses the Shell Command Language. For example, you can append a date
  /// and time to your artifact name so that it is always unique.
  final bool? overrideArtifactName;

  /// The type of build output artifact to create:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, CodePipeline
  /// ignores this value if specified. This is because CodePipeline manages its
  /// build output artifacts instead of CodeBuild.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is
  /// ignored if specified, because no build output is produced.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>S3</code>, valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: CodeBuild creates in the output bucket a folder that
  /// contains the build output. This is the default if <code>packaging</code> is
  /// not specified.
  /// </li>
  /// <li>
  /// <code>ZIP</code>: CodeBuild creates in the output bucket a ZIP file that
  /// contains the build output.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ArtifactPackaging? packaging;

  /// Along with <code>namespaceType</code> and <code>name</code>, the pattern
  /// that CodeBuild uses to name and store the output artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, CodePipeline
  /// ignores this value if specified. This is because CodePipeline manages its
  /// build output names instead of CodeBuild.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is
  /// ignored if specified, because no build output is produced.
  /// </li>
  /// <li>
  /// If <code>type</code> is set to <code>S3</code>, this is the path to the
  /// output artifact. If <code>path</code> is not specified, <code>path</code> is
  /// not used.
  /// </li>
  /// </ul>
  /// For example, if <code>path</code> is set to <code>MyArtifacts</code>,
  /// <code>namespaceType</code> is set to <code>NONE</code>, and
  /// <code>name</code> is set to <code>MyArtifact.zip</code>, the output artifact
  /// is stored in the output bucket at <code>MyArtifacts/MyArtifact.zip</code>.
  final String? path;

  ProjectArtifacts({
    required this.type,
    this.artifactIdentifier,
    this.bucketOwnerAccess,
    this.encryptionDisabled,
    this.location,
    this.name,
    this.namespaceType,
    this.overrideArtifactName,
    this.packaging,
    this.path,
  });

  factory ProjectArtifacts.fromJson(Map<String, dynamic> json) {
    return ProjectArtifacts(
      type: (json['type'] as String).toArtifactsType(),
      artifactIdentifier: json['artifactIdentifier'] as String?,
      bucketOwnerAccess:
          (json['bucketOwnerAccess'] as String?)?.toBucketOwnerAccess(),
      encryptionDisabled: json['encryptionDisabled'] as bool?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      namespaceType: (json['namespaceType'] as String?)?.toArtifactNamespace(),
      overrideArtifactName: json['overrideArtifactName'] as bool?,
      packaging: (json['packaging'] as String?)?.toArtifactPackaging(),
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final artifactIdentifier = this.artifactIdentifier;
    final bucketOwnerAccess = this.bucketOwnerAccess;
    final encryptionDisabled = this.encryptionDisabled;
    final location = this.location;
    final name = this.name;
    final namespaceType = this.namespaceType;
    final overrideArtifactName = this.overrideArtifactName;
    final packaging = this.packaging;
    final path = this.path;
    return {
      'type': type.toValue(),
      if (artifactIdentifier != null) 'artifactIdentifier': artifactIdentifier,
      if (bucketOwnerAccess != null)
        'bucketOwnerAccess': bucketOwnerAccess.toValue(),
      if (encryptionDisabled != null) 'encryptionDisabled': encryptionDisabled,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (namespaceType != null) 'namespaceType': namespaceType.toValue(),
      if (overrideArtifactName != null)
        'overrideArtifactName': overrideArtifactName,
      if (packaging != null) 'packaging': packaging.toValue(),
      if (path != null) 'path': path,
    };
  }
}

/// Information about the build badge for the build project.
class ProjectBadge {
  /// Set this to true to generate a publicly accessible URL for your project's
  /// build badge.
  final bool? badgeEnabled;

  /// The publicly-accessible URL through which you can access the build badge for
  /// your project.
  final String? badgeRequestUrl;

  ProjectBadge({
    this.badgeEnabled,
    this.badgeRequestUrl,
  });

  factory ProjectBadge.fromJson(Map<String, dynamic> json) {
    return ProjectBadge(
      badgeEnabled: json['badgeEnabled'] as bool?,
      badgeRequestUrl: json['badgeRequestUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final badgeEnabled = this.badgeEnabled;
    final badgeRequestUrl = this.badgeRequestUrl;
    return {
      if (badgeEnabled != null) 'badgeEnabled': badgeEnabled,
      if (badgeRequestUrl != null) 'badgeRequestUrl': badgeRequestUrl,
    };
  }
}

/// Contains configuration information about a batch build project.
class ProjectBuildBatchConfig {
  /// Specifies how build status reports are sent to the source provider for the
  /// batch build. This property is only used when the source provider for your
  /// project is Bitbucket, GitHub, or GitHub Enterprise, and your project is
  /// configured to report build statuses to the source provider.
  /// <dl> <dt>REPORT_AGGREGATED_BATCH</dt> <dd>
  /// (Default) Aggregate all of the build statuses into a single status report.
  /// </dd> <dt>REPORT_INDIVIDUAL_BUILDS</dt> <dd>
  /// Send a separate status report for each individual build.
  /// </dd> </dl>
  final BatchReportModeType? batchReportMode;

  /// Specifies if the build artifacts for the batch build should be combined into
  /// a single artifact location.
  final bool? combineArtifacts;

  /// A <code>BatchRestrictions</code> object that specifies the restrictions for
  /// the batch build.
  final BatchRestrictions? restrictions;

  /// Specifies the service role ARN for the batch build project.
  final String? serviceRole;

  /// Specifies the maximum amount of time, in minutes, that the batch build must
  /// be completed in.
  final int? timeoutInMins;

  ProjectBuildBatchConfig({
    this.batchReportMode,
    this.combineArtifacts,
    this.restrictions,
    this.serviceRole,
    this.timeoutInMins,
  });

  factory ProjectBuildBatchConfig.fromJson(Map<String, dynamic> json) {
    return ProjectBuildBatchConfig(
      batchReportMode:
          (json['batchReportMode'] as String?)?.toBatchReportModeType(),
      combineArtifacts: json['combineArtifacts'] as bool?,
      restrictions: json['restrictions'] != null
          ? BatchRestrictions.fromJson(
              json['restrictions'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      timeoutInMins: json['timeoutInMins'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchReportMode = this.batchReportMode;
    final combineArtifacts = this.combineArtifacts;
    final restrictions = this.restrictions;
    final serviceRole = this.serviceRole;
    final timeoutInMins = this.timeoutInMins;
    return {
      if (batchReportMode != null) 'batchReportMode': batchReportMode.toValue(),
      if (combineArtifacts != null) 'combineArtifacts': combineArtifacts,
      if (restrictions != null) 'restrictions': restrictions,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (timeoutInMins != null) 'timeoutInMins': timeoutInMins,
    };
  }
}

/// Information about the cache for the build project.
class ProjectCache {
  /// The type of cache used by the build project. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>NO_CACHE</code>: The build project does not use any cache.
  /// </li>
  /// <li>
  /// <code>S3</code>: The build project reads and writes from and to S3.
  /// </li>
  /// <li>
  /// <code>LOCAL</code>: The build project stores a cache locally on a build host
  /// that is only available to that build host.
  /// </li>
  /// </ul>
  final CacheType type;

  /// Information about the cache location:
  ///
  /// <ul>
  /// <li>
  /// <code>NO_CACHE</code> or <code>LOCAL</code>: This value is ignored.
  /// </li>
  /// <li>
  /// <code>S3</code>: This is the S3 bucket name/prefix.
  /// </li>
  /// </ul>
  final String? location;

  /// An array of strings that specify the local cache modes. You can use one or
  /// more local cache modes at the same time. This is only used for
  /// <code>LOCAL</code> cache types.
  ///
  /// Possible values are:
  /// <dl> <dt>LOCAL_SOURCE_CACHE</dt> <dd>
  /// Caches Git metadata for primary and secondary sources. After the cache is
  /// created, subsequent builds pull only the change between commits. This mode
  /// is a good choice for projects with a clean working directory and a source
  /// that is a large Git repository. If you choose this option and your project
  /// does not use a Git repository (GitHub, GitHub Enterprise, or Bitbucket), the
  /// option is ignored.
  /// </dd> <dt>LOCAL_DOCKER_LAYER_CACHE</dt> <dd>
  /// Caches existing Docker layers. This mode is a good choice for projects that
  /// build or pull large Docker images. It can prevent the performance issues
  /// caused by pulling large Docker images down from the network.
  /// <note>
  /// <ul>
  /// <li>
  /// You can use a Docker layer cache in the Linux environment only.
  /// </li>
  /// <li>
  /// The <code>privileged</code> flag must be set so that your project has the
  /// required Docker permissions.
  /// </li>
  /// <li>
  /// You should consider the security implications before you use a Docker layer
  /// cache.
  /// </li>
  /// </ul> </note> </dd> <dt>LOCAL_CUSTOM_CACHE</dt> <dd>
  /// Caches directories you specify in the buildspec file. This mode is a good
  /// choice if your build scenario is not suited to one of the other three local
  /// cache modes. If you use a custom cache:
  ///
  /// <ul>
  /// <li>
  /// Only directories can be specified for caching. You cannot specify individual
  /// files.
  /// </li>
  /// <li>
  /// Symlinks are used to reference cached directories.
  /// </li>
  /// <li>
  /// Cached directories are linked to your build before it downloads its project
  /// sources. Cached items are overridden if a source item has the same name.
  /// Directories are specified using cache paths in the buildspec file.
  /// </li>
  /// </ul> </dd> </dl>
  final List<CacheMode>? modes;

  ProjectCache({
    required this.type,
    this.location,
    this.modes,
  });

  factory ProjectCache.fromJson(Map<String, dynamic> json) {
    return ProjectCache(
      type: (json['type'] as String).toCacheType(),
      location: json['location'] as String?,
      modes: (json['modes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCacheMode())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final location = this.location;
    final modes = this.modes;
    return {
      'type': type.toValue(),
      if (location != null) 'location': location,
      if (modes != null) 'modes': modes.map((e) => e.toValue()).toList(),
    };
  }
}

/// Information about the build environment of the build project.
class ProjectEnvironment {
  /// Information about the compute resources the build project uses. Available
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD_GENERAL1_SMALL</code>: Use up to 3 GB memory and 2 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_MEDIUM</code>: Use up to 7 GB memory and 4 vCPUs for
  /// builds.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_LARGE</code>: Use up to 16 GB memory and 8 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_XLARGE</code>: Use up to 70 GB memory and 36 vCPUs for
  /// builds, depending on your environment type.
  /// </li>
  /// <li>
  /// <code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs, and
  /// 824 GB of SSD storage for builds. This compute type supports Docker images
  /// up to 100 GB uncompressed.
  /// </li>
  /// <li>
  /// <code>BUILD_LAMBDA_1GB</code>: Use up to 1 GB memory for builds. Only
  /// available for environment type <code>LINUX_LAMBDA_CONTAINER</code> and
  /// <code>ARM_LAMBDA_CONTAINER</code>.
  /// </li>
  /// <li>
  /// <code>BUILD_LAMBDA_2GB</code>: Use up to 2 GB memory for builds. Only
  /// available for environment type <code>LINUX_LAMBDA_CONTAINER</code> and
  /// <code>ARM_LAMBDA_CONTAINER</code>.
  /// </li>
  /// <li>
  /// <code>BUILD_LAMBDA_4GB</code>: Use up to 4 GB memory for builds. Only
  /// available for environment type <code>LINUX_LAMBDA_CONTAINER</code> and
  /// <code>ARM_LAMBDA_CONTAINER</code>.
  /// </li>
  /// <li>
  /// <code>BUILD_LAMBDA_8GB</code>: Use up to 8 GB memory for builds. Only
  /// available for environment type <code>LINUX_LAMBDA_CONTAINER</code> and
  /// <code>ARM_LAMBDA_CONTAINER</code>.
  /// </li>
  /// <li>
  /// <code>BUILD_LAMBDA_10GB</code>: Use up to 10 GB memory for builds. Only
  /// available for environment type <code>LINUX_LAMBDA_CONTAINER</code> and
  /// <code>ARM_LAMBDA_CONTAINER</code>.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_SMALL</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 3 GB
  /// memory and 2 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to 16
  /// GB memory, 4 vCPUs, and 1 NVIDIA A10G Tensor Core GPU for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 4 GB
  /// memory and 2 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul>
  /// If you use <code>BUILD_GENERAL1_LARGE</code>:
  ///
  /// <ul>
  /// <li>
  /// For environment type <code>LINUX_CONTAINER</code>, you can use up to 15 GB
  /// memory and 8 vCPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to 255
  /// GB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.
  /// </li>
  /// <li>
  /// For environment type <code>ARM_CONTAINER</code>, you can use up to 16 GB
  /// memory and 8 vCPUs on ARM-based processors for builds.
  /// </li>
  /// </ul> <note>
  /// If you're using compute fleets during project creation,
  /// <code>computeType</code> will be ignored.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// Environment Compute Types</a> in the <i>CodeBuild User Guide.</i>
  final ComputeType computeType;

  /// The image tag or image digest that identifies the Docker image to use for
  /// this build project. Use the following formats:
  ///
  /// <ul>
  /// <li>
  /// For an image tag:
  /// <code>&lt;registry&gt;/&lt;repository&gt;:&lt;tag&gt;</code>. For example,
  /// in the Docker repository that CodeBuild uses to manage its Docker images,
  /// this would be <code>aws/codebuild/standard:4.0</code>.
  /// </li>
  /// <li>
  /// For an image digest:
  /// <code>&lt;registry&gt;/&lt;repository&gt;@&lt;digest&gt;</code>. For
  /// example, to specify an image with the digest
  /// "sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf,"
  /// use
  /// <code>&lt;registry&gt;/&lt;repository&gt;@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf</code>.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html">Docker
  /// images provided by CodeBuild</a> in the <i>CodeBuild user guide</i>.
  final String image;

  /// The type of build environment to use for related builds.
  ///
  /// <ul>
  /// <li>
  /// The environment type <code>ARM_CONTAINER</code> is available only in regions
  /// US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia
  /// Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and EU
  /// (Frankfurt).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), Canada
  /// (Central), EU (Ireland), EU (London), EU (Frankfurt), Asia Pacific (Tokyo),
  /// Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China
  /// (Beijing), and China (Ningxia).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), Canada
  /// (Central), EU (Ireland), EU (London), EU (Frankfurt), Asia Pacific (Tokyo),
  /// Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney) ,
  /// China (Beijing), and China (Ningxia).
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// The environment types <code>ARM_LAMBDA_CONTAINER</code> and
  /// <code>LINUX_LAMBDA_CONTAINER</code> are available only in regions US East
  /// (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific (Mumbai), Asia
  /// Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), EU
  /// (Frankfurt), EU (Ireland), and South America (São Paulo).
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// The environment types <code>WINDOWS_CONTAINER</code> and
  /// <code>WINDOWS_SERVER_2019_CONTAINER</code> are available only in regions US
  /// East (N. Virginia), US East (Ohio), US West (Oregon), and EU (Ireland).
  /// </li>
  /// </ul> <note>
  /// If you're using compute fleets during project creation, <code>type</code>
  /// will be ignored.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>CodeBuild user guide</i>.
  final EnvironmentType type;

  /// The ARN of the Amazon S3 bucket, path prefix, and object key that contains
  /// the PEM-encoded certificate for the build project. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/create-project-cli.html#cli.environment.certificate">certificate</a>
  /// in the <i>CodeBuild User Guide</i>.
  final String? certificate;

  /// A set of environment variables to make available to builds for this build
  /// project.
  final List<EnvironmentVariable>? environmentVariables;

  /// A ProjectFleet object to use for this build project.
  final ProjectFleet? fleet;

  /// The type of credentials CodeBuild uses to pull images in your build. There
  /// are two valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CODEBUILD</code> specifies that CodeBuild uses its own credentials.
  /// This requires that you modify your ECR repository policy to trust CodeBuild
  /// service principal.
  /// </li>
  /// <li>
  /// <code>SERVICE_ROLE</code> specifies that CodeBuild uses your build project's
  /// service role.
  /// </li>
  /// </ul>
  /// When you use a cross-account or private registry image, you must use
  /// SERVICE_ROLE credentials. When you use an CodeBuild curated image, you must
  /// use CODEBUILD credentials.
  final ImagePullCredentialsType? imagePullCredentialsType;

  /// Enables running the Docker daemon inside a Docker container. Set to true
  /// only if the build project is used to build Docker images. Otherwise, a build
  /// that attempts to interact with the Docker daemon fails. The default setting
  /// is <code>false</code>.
  ///
  /// You can initialize the Docker daemon during the install phase of your build
  /// by adding one of the following sets of commands to the install phase of your
  /// buildspec file:
  ///
  /// If the operating system's base image is Ubuntu Linux:
  ///
  /// <code>- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock
  /// --host=tcp://0.0.0.0:2375 --storage-driver=overlay&amp;</code>
  ///
  /// <code>- timeout 15 sh -c "until docker info; do echo .; sleep 1;
  /// done"</code>
  ///
  /// If the operating system's base image is Alpine Linux and the previous
  /// command does not work, add the <code>-t</code> argument to
  /// <code>timeout</code>:
  ///
  /// <code>- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock
  /// --host=tcp://0.0.0.0:2375 --storage-driver=overlay&amp;</code>
  ///
  /// <code>- timeout -t 15 sh -c "until docker info; do echo .; sleep 1;
  /// done"</code>
  final bool? privilegedMode;

  /// The credentials for access to a private registry.
  final RegistryCredential? registryCredential;

  ProjectEnvironment({
    required this.computeType,
    required this.image,
    required this.type,
    this.certificate,
    this.environmentVariables,
    this.fleet,
    this.imagePullCredentialsType,
    this.privilegedMode,
    this.registryCredential,
  });

  factory ProjectEnvironment.fromJson(Map<String, dynamic> json) {
    return ProjectEnvironment(
      computeType: (json['computeType'] as String).toComputeType(),
      image: json['image'] as String,
      type: (json['type'] as String).toEnvironmentType(),
      certificate: json['certificate'] as String?,
      environmentVariables: (json['environmentVariables'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      fleet: json['fleet'] != null
          ? ProjectFleet.fromJson(json['fleet'] as Map<String, dynamic>)
          : null,
      imagePullCredentialsType: (json['imagePullCredentialsType'] as String?)
          ?.toImagePullCredentialsType(),
      privilegedMode: json['privilegedMode'] as bool?,
      registryCredential: json['registryCredential'] != null
          ? RegistryCredential.fromJson(
              json['registryCredential'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeType = this.computeType;
    final image = this.image;
    final type = this.type;
    final certificate = this.certificate;
    final environmentVariables = this.environmentVariables;
    final fleet = this.fleet;
    final imagePullCredentialsType = this.imagePullCredentialsType;
    final privilegedMode = this.privilegedMode;
    final registryCredential = this.registryCredential;
    return {
      'computeType': computeType.toValue(),
      'image': image,
      'type': type.toValue(),
      if (certificate != null) 'certificate': certificate,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (fleet != null) 'fleet': fleet,
      if (imagePullCredentialsType != null)
        'imagePullCredentialsType': imagePullCredentialsType.toValue(),
      if (privilegedMode != null) 'privilegedMode': privilegedMode,
      if (registryCredential != null) 'registryCredential': registryCredential,
    };
  }
}

/// Information about a file system created by Amazon Elastic File System (EFS).
/// For more information, see <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html">What Is
/// Amazon Elastic File System?</a>
class ProjectFileSystemLocation {
  /// The name used to access a file system created by Amazon EFS. CodeBuild
  /// creates an environment variable by appending the <code>identifier</code> in
  /// all capital letters to <code>CODEBUILD_</code>. For example, if you specify
  /// <code>my_efs</code> for <code>identifier</code>, a new environment variable
  /// is create named <code>CODEBUILD_MY_EFS</code>.
  ///
  /// The <code>identifier</code> is used to mount your file system.
  final String? identifier;

  /// A string that specifies the location of the file system created by Amazon
  /// EFS. Its format is <code>efs-dns-name:/directory-path</code>. You can find
  /// the DNS name of file system when you view it in the Amazon EFS console. The
  /// directory path is a path to a directory in the file system that CodeBuild
  /// mounts. For example, if the DNS name of a file system is
  /// <code>fs-abcd1234.efs.us-west-2.amazonaws.com</code>, and its mount
  /// directory is <code>my-efs-mount-directory</code>, then the
  /// <code>location</code> is
  /// <code>fs-abcd1234.efs.us-west-2.amazonaws.com:/my-efs-mount-directory</code>.
  ///
  /// The directory path in the format <code>efs-dns-name:/directory-path</code>
  /// is optional. If you do not specify a directory path, the location is only
  /// the DNS name and CodeBuild mounts the entire file system.
  final String? location;

  /// The mount options for a file system created by Amazon EFS. The default mount
  /// options used by CodeBuild are
  /// <code>nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-nfs-mount-settings.html">Recommended
  /// NFS Mount Options</a>.
  final String? mountOptions;

  /// The location in the container where you mount the file system.
  final String? mountPoint;

  /// The type of the file system. The one supported type is <code>EFS</code>.
  final FileSystemType? type;

  ProjectFileSystemLocation({
    this.identifier,
    this.location,
    this.mountOptions,
    this.mountPoint,
    this.type,
  });

  factory ProjectFileSystemLocation.fromJson(Map<String, dynamic> json) {
    return ProjectFileSystemLocation(
      identifier: json['identifier'] as String?,
      location: json['location'] as String?,
      mountOptions: json['mountOptions'] as String?,
      mountPoint: json['mountPoint'] as String?,
      type: (json['type'] as String?)?.toFileSystemType(),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final location = this.location;
    final mountOptions = this.mountOptions;
    final mountPoint = this.mountPoint;
    final type = this.type;
    return {
      if (identifier != null) 'identifier': identifier,
      if (location != null) 'location': location,
      if (mountOptions != null) 'mountOptions': mountOptions,
      if (mountPoint != null) 'mountPoint': mountPoint,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Information about the compute fleet of the build project. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/fleets.html">Working
/// with reserved capacity in CodeBuild</a>.
class ProjectFleet {
  /// Specifies the compute fleet ARN for the build project.
  final String? fleetArn;

  ProjectFleet({
    this.fleetArn,
  });

  factory ProjectFleet.fromJson(Map<String, dynamic> json) {
    return ProjectFleet(
      fleetArn: json['fleetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetArn = this.fleetArn;
    return {
      if (fleetArn != null) 'fleetArn': fleetArn,
    };
  }
}

enum ProjectSortByType {
  name,
  createdTime,
  lastModifiedTime,
}

extension ProjectSortByTypeValueExtension on ProjectSortByType {
  String toValue() {
    switch (this) {
      case ProjectSortByType.name:
        return 'NAME';
      case ProjectSortByType.createdTime:
        return 'CREATED_TIME';
      case ProjectSortByType.lastModifiedTime:
        return 'LAST_MODIFIED_TIME';
    }
  }
}

extension ProjectSortByTypeFromString on String {
  ProjectSortByType toProjectSortByType() {
    switch (this) {
      case 'NAME':
        return ProjectSortByType.name;
      case 'CREATED_TIME':
        return ProjectSortByType.createdTime;
      case 'LAST_MODIFIED_TIME':
        return ProjectSortByType.lastModifiedTime;
    }
    throw Exception('$this is not known in enum ProjectSortByType');
  }
}

/// Information about the build input source code for the build project.
class ProjectSource {
  /// The type of repository that contains the source code to be built. Valid
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BITBUCKET</code>: The source code is in a Bitbucket repository.
  /// </li>
  /// <li>
  /// <code>CODECOMMIT</code>: The source code is in an CodeCommit repository.
  /// </li>
  /// <li>
  /// <code>CODEPIPELINE</code>: The source code settings are specified in the
  /// source action of a pipeline in CodePipeline.
  /// </li>
  /// <li>
  /// <code>GITHUB</code>: The source code is in a GitHub repository.
  /// </li>
  /// <li>
  /// <code>GITHUB_ENTERPRISE</code>: The source code is in a GitHub Enterprise
  /// Server repository.
  /// </li>
  /// <li>
  /// <code>GITLAB</code>: The source code is in a GitLab repository.
  /// </li>
  /// <li>
  /// <code>GITLAB_SELF_MANAGED</code>: The source code is in a self-managed
  /// GitLab repository.
  /// </li>
  /// <li>
  /// <code>NO_SOURCE</code>: The project does not have input source code.
  /// </li>
  /// <li>
  /// <code>S3</code>: The source code is in an Amazon S3 bucket.
  /// </li>
  /// </ul>
  final SourceType type;

  /// Information about the authorization settings for CodeBuild to access the
  /// source code to be built.
  ///
  /// This information is for the CodeBuild console's use only. Your code should
  /// not get or set this information directly.
  final SourceAuth? auth;

  /// Contains information that defines how the build project reports the build
  /// status to the source provider. This option is only used when the source
  /// provider is <code>GITHUB</code>, <code>GITHUB_ENTERPRISE</code>, or
  /// <code>BITBUCKET</code>.
  final BuildStatusConfig? buildStatusConfig;

  /// The buildspec file declaration to use for the builds in this build project.
  ///
  /// If this value is set, it can be either an inline buildspec definition, the
  /// path to an alternate buildspec file relative to the value of the built-in
  /// <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3
  /// bucket. The bucket must be in the same Amazon Web Services Region as the
  /// build project. Specify the buildspec file using its ARN (for example,
  /// <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this value
  /// is not provided or is set to an empty string, the source code must contain a
  /// buildspec file in its root directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec
  /// File Name and Storage Location</a>.
  final String? buildspec;

  /// Information about the Git clone depth for the build project.
  final int? gitCloneDepth;

  /// Information about the Git submodules configuration for the build project.
  final GitSubmodulesConfig? gitSubmodulesConfig;

  /// Enable this flag to ignore SSL warnings while connecting to the project
  /// source code.
  final bool? insecureSsl;

  /// Information about the location of the source code to be built. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// For source code settings that are specified in the source action of a
  /// pipeline in CodePipeline, <code>location</code> should not be specified. If
  /// it is specified, CodePipeline ignores it. This is because CodePipeline uses
  /// the settings in a pipeline's source action instead of this value.
  /// </li>
  /// <li>
  /// For source code in an CodeCommit repository, the HTTPS clone URL to the
  /// repository that contains the source code and the buildspec file (for
  /// example,
  /// <code>https://git-codecommit.&lt;region-ID&gt;.amazonaws.com/v1/repos/&lt;repo-name&gt;</code>).
  /// </li>
  /// <li>
  /// For source code in an Amazon S3 input bucket, one of the following.
  ///
  /// <ul>
  /// <li>
  /// The path to the ZIP file that contains the source code (for example,
  /// <code>&lt;bucket-name&gt;/&lt;path&gt;/&lt;object-name&gt;.zip</code>).
  /// </li>
  /// <li>
  /// The path to the folder that contains the source code (for example,
  /// <code>&lt;bucket-name&gt;/&lt;path-to-source-code&gt;/&lt;folder&gt;/</code>).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For source code in a GitHub repository, the HTTPS clone URL to the
  /// repository that contains the source and the buildspec file. You must connect
  /// your Amazon Web Services account to your GitHub account. Use the CodeBuild
  /// console to start creating a build project. When you use the console to
  /// connect (or reconnect) with GitHub, on the GitHub <b>Authorize
  /// application</b> page, for <b>Organization access</b>, choose <b>Request
  /// access</b> next to each repository you want to allow CodeBuild to have
  /// access to, and then choose <b>Authorize application</b>. (After you have
  /// connected to your GitHub account, you do not need to finish creating the
  /// build project. You can leave the CodeBuild console.) To instruct CodeBuild
  /// to use this connection, in the <code>source</code> object, set the
  /// <code>auth</code> object's <code>type</code> value to <code>OAUTH</code>.
  /// </li>
  /// <li>
  /// For source code in an GitLab or self-managed GitLab repository, the HTTPS
  /// clone URL to the repository that contains the source and the buildspec file.
  /// You must connect your Amazon Web Services account to your GitLab account.
  /// Use the CodeBuild console to start creating a build project. When you use
  /// the console to connect (or reconnect) with GitLab, on the Connections
  /// <b>Authorize application</b> page, choose <b>Authorize</b>. Then on the
  /// CodeConnections <b>Create GitLab connection</b> page, choose <b>Connect to
  /// GitLab</b>. (After you have connected to your GitLab account, you do not
  /// need to finish creating the build project. You can leave the CodeBuild
  /// console.) To instruct CodeBuild to override the default connection and use
  /// this connection instead, set the <code>auth</code> object's
  /// <code>type</code> value to <code>CODECONNECTIONS</code> in the
  /// <code>source</code> object.
  /// </li>
  /// <li>
  /// For source code in a Bitbucket repository, the HTTPS clone URL to the
  /// repository that contains the source and the buildspec file. You must connect
  /// your Amazon Web Services account to your Bitbucket account. Use the
  /// CodeBuild console to start creating a build project. When you use the
  /// console to connect (or reconnect) with Bitbucket, on the Bitbucket
  /// <b>Confirm access to your account</b> page, choose <b>Grant access</b>.
  /// (After you have connected to your Bitbucket account, you do not need to
  /// finish creating the build project. You can leave the CodeBuild console.) To
  /// instruct CodeBuild to use this connection, in the <code>source</code>
  /// object, set the <code>auth</code> object's <code>type</code> value to
  /// <code>OAUTH</code>.
  /// </li>
  /// </ul>
  /// If you specify <code>CODEPIPELINE</code> for the <code>Type</code> property,
  /// don't specify this property. For all of the other types, you must specify
  /// <code>Location</code>.
  final String? location;

  /// Set to true to report the status of a build's start and finish to your
  /// source provider. This option is valid only when your source provider is
  /// GitHub, GitHub Enterprise, GitLab, GitLab Self Managed, or Bitbucket. If
  /// this is set and you use a different source provider, an
  /// <code>invalidInputException</code> is thrown.
  ///
  /// To be able to report the build status to the source provider, the user
  /// associated with the source provider must have write access to the repo. If
  /// the user does not have write access, the build status cannot be updated. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens.html">Source
  /// provider access</a> in the <i>CodeBuild User Guide</i>.
  ///
  /// The status of a build triggered by a webhook is always reported to your
  /// source provider.
  ///
  /// If your project's builds are triggered by a webhook, you must push a new
  /// commit to the repo for a change to this property to take effect.
  final bool? reportBuildStatus;

  /// An identifier for this project source. The identifier can only contain
  /// alphanumeric characters and underscores, and must be less than 128
  /// characters in length.
  final String? sourceIdentifier;

  ProjectSource({
    required this.type,
    this.auth,
    this.buildStatusConfig,
    this.buildspec,
    this.gitCloneDepth,
    this.gitSubmodulesConfig,
    this.insecureSsl,
    this.location,
    this.reportBuildStatus,
    this.sourceIdentifier,
  });

  factory ProjectSource.fromJson(Map<String, dynamic> json) {
    return ProjectSource(
      type: (json['type'] as String).toSourceType(),
      auth: json['auth'] != null
          ? SourceAuth.fromJson(json['auth'] as Map<String, dynamic>)
          : null,
      buildStatusConfig: json['buildStatusConfig'] != null
          ? BuildStatusConfig.fromJson(
              json['buildStatusConfig'] as Map<String, dynamic>)
          : null,
      buildspec: json['buildspec'] as String?,
      gitCloneDepth: json['gitCloneDepth'] as int?,
      gitSubmodulesConfig: json['gitSubmodulesConfig'] != null
          ? GitSubmodulesConfig.fromJson(
              json['gitSubmodulesConfig'] as Map<String, dynamic>)
          : null,
      insecureSsl: json['insecureSsl'] as bool?,
      location: json['location'] as String?,
      reportBuildStatus: json['reportBuildStatus'] as bool?,
      sourceIdentifier: json['sourceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final auth = this.auth;
    final buildStatusConfig = this.buildStatusConfig;
    final buildspec = this.buildspec;
    final gitCloneDepth = this.gitCloneDepth;
    final gitSubmodulesConfig = this.gitSubmodulesConfig;
    final insecureSsl = this.insecureSsl;
    final location = this.location;
    final reportBuildStatus = this.reportBuildStatus;
    final sourceIdentifier = this.sourceIdentifier;
    return {
      'type': type.toValue(),
      if (auth != null) 'auth': auth,
      if (buildStatusConfig != null) 'buildStatusConfig': buildStatusConfig,
      if (buildspec != null) 'buildspec': buildspec,
      if (gitCloneDepth != null) 'gitCloneDepth': gitCloneDepth,
      if (gitSubmodulesConfig != null)
        'gitSubmodulesConfig': gitSubmodulesConfig,
      if (insecureSsl != null) 'insecureSsl': insecureSsl,
      if (location != null) 'location': location,
      if (reportBuildStatus != null) 'reportBuildStatus': reportBuildStatus,
      if (sourceIdentifier != null) 'sourceIdentifier': sourceIdentifier,
    };
  }
}

/// A source identifier and its corresponding version.
class ProjectSourceVersion {
  /// An identifier for a source in the build project. The identifier can only
  /// contain alphanumeric characters and underscores, and must be less than 128
  /// characters in length.
  final String sourceIdentifier;

  /// The source version for the corresponding source identifier. If specified,
  /// must be one of:
  ///
  /// <ul>
  /// <li>
  /// For CodeCommit: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For GitHub: the commit ID, pull request ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a pull
  /// request ID is specified, it must use the format
  /// <code>pr/pull-request-ID</code> (for example, <code>pr/25</code>). If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For GitLab: the commit ID, branch, or Git tag to use.
  /// </li>
  /// <li>
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon S3: the version ID of the object that represents the build input
  /// ZIP file to use.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>CodeBuild User Guide</i>.
  final String sourceVersion;

  ProjectSourceVersion({
    required this.sourceIdentifier,
    required this.sourceVersion,
  });

  factory ProjectSourceVersion.fromJson(Map<String, dynamic> json) {
    return ProjectSourceVersion(
      sourceIdentifier: json['sourceIdentifier'] as String,
      sourceVersion: json['sourceVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIdentifier = this.sourceIdentifier;
    final sourceVersion = this.sourceVersion;
    return {
      'sourceIdentifier': sourceIdentifier,
      'sourceVersion': sourceVersion,
    };
  }
}

/// Specifies the visibility of the project's builds. Possible values are:
/// <dl> <dt>PUBLIC_READ</dt> <dd>
/// The project builds are visible to the public.
/// </dd> <dt>PRIVATE</dt> <dd>
/// The project builds are not visible to the public.
/// </dd> </dl>
enum ProjectVisibilityType {
  publicRead,
  private,
}

extension ProjectVisibilityTypeValueExtension on ProjectVisibilityType {
  String toValue() {
    switch (this) {
      case ProjectVisibilityType.publicRead:
        return 'PUBLIC_READ';
      case ProjectVisibilityType.private:
        return 'PRIVATE';
    }
  }
}

extension ProjectVisibilityTypeFromString on String {
  ProjectVisibilityType toProjectVisibilityType() {
    switch (this) {
      case 'PUBLIC_READ':
        return ProjectVisibilityType.publicRead;
      case 'PRIVATE':
        return ProjectVisibilityType.private;
    }
    throw Exception('$this is not known in enum ProjectVisibilityType');
  }
}

class PutResourcePolicyOutput {
  /// The ARN of the <code>Project</code> or <code>ReportGroup</code> resource
  /// that is associated with a resource policy.
  final String? resourceArn;

  PutResourcePolicyOutput({
    this.resourceArn,
  });

  factory PutResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyOutput(
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// Information about credentials that provide access to a private Docker
/// registry. When this is set:
///
/// <ul>
/// <li>
/// <code>imagePullCredentialsType</code> must be set to
/// <code>SERVICE_ROLE</code>.
/// </li>
/// <li>
/// images cannot be curated or an Amazon ECR image.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-private-registry.html">Private
/// Registry with Secrets Manager Sample for CodeBuild</a>.
class RegistryCredential {
  /// The Amazon Resource Name (ARN) or name of credentials created using Secrets
  /// Manager.
  /// <note>
  /// The <code>credential</code> can use the name of the credentials only if they
  /// exist in your current Amazon Web Services Region.
  /// </note>
  final String credential;

  /// The service that created the credentials to access a private Docker
  /// registry. The valid value, SECRETS_MANAGER, is for Secrets Manager.
  final CredentialProviderType credentialProvider;

  RegistryCredential({
    required this.credential,
    required this.credentialProvider,
  });

  factory RegistryCredential.fromJson(Map<String, dynamic> json) {
    return RegistryCredential(
      credential: json['credential'] as String,
      credentialProvider:
          (json['credentialProvider'] as String).toCredentialProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final credential = this.credential;
    final credentialProvider = this.credentialProvider;
    return {
      'credential': credential,
      'credentialProvider': credentialProvider.toValue(),
    };
  }
}

/// Information about the results from running a series of test cases during the
/// run of a build project. The test cases are specified in the buildspec for
/// the build project using one or more paths to the test case files. You can
/// specify any type of tests you want, such as unit tests, integration tests,
/// and functional tests.
class Report {
  /// The ARN of the report run.
  final String? arn;

  /// A <code>CodeCoverageReportSummary</code> object that contains a code
  /// coverage summary for this report.
  final CodeCoverageReportSummary? codeCoverageSummary;

  /// The date and time this report run occurred.
  final DateTime? created;

  /// The ARN of the build run that generated this report.
  final String? executionId;

  /// The date and time a report expires. A report expires 30 days after it is
  /// created. An expired report is not available to view in CodeBuild.
  final DateTime? expired;

  /// Information about where the raw data used to generate this report was
  /// exported.
  final ReportExportConfig? exportConfig;

  /// The name of the report that was run.
  final String? name;

  /// The ARN of the report group associated with this report.
  final String? reportGroupArn;

  /// The status of this report.
  final ReportStatusType? status;

  /// A <code>TestReportSummary</code> object that contains information about this
  /// test report.
  final TestReportSummary? testSummary;

  /// A boolean that specifies if this report run is truncated. The list of test
  /// cases is truncated after the maximum number of test cases is reached.
  final bool? truncated;

  /// The type of the report that was run.
  /// <dl> <dt>CODE_COVERAGE</dt> <dd>
  /// A code coverage report.
  /// </dd> <dt>TEST</dt> <dd>
  /// A test report.
  /// </dd> </dl>
  final ReportType? type;

  Report({
    this.arn,
    this.codeCoverageSummary,
    this.created,
    this.executionId,
    this.expired,
    this.exportConfig,
    this.name,
    this.reportGroupArn,
    this.status,
    this.testSummary,
    this.truncated,
    this.type,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      arn: json['arn'] as String?,
      codeCoverageSummary: json['codeCoverageSummary'] != null
          ? CodeCoverageReportSummary.fromJson(
              json['codeCoverageSummary'] as Map<String, dynamic>)
          : null,
      created: timeStampFromJson(json['created']),
      executionId: json['executionId'] as String?,
      expired: timeStampFromJson(json['expired']),
      exportConfig: json['exportConfig'] != null
          ? ReportExportConfig.fromJson(
              json['exportConfig'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      reportGroupArn: json['reportGroupArn'] as String?,
      status: (json['status'] as String?)?.toReportStatusType(),
      testSummary: json['testSummary'] != null
          ? TestReportSummary.fromJson(
              json['testSummary'] as Map<String, dynamic>)
          : null,
      truncated: json['truncated'] as bool?,
      type: (json['type'] as String?)?.toReportType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final codeCoverageSummary = this.codeCoverageSummary;
    final created = this.created;
    final executionId = this.executionId;
    final expired = this.expired;
    final exportConfig = this.exportConfig;
    final name = this.name;
    final reportGroupArn = this.reportGroupArn;
    final status = this.status;
    final testSummary = this.testSummary;
    final truncated = this.truncated;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (codeCoverageSummary != null)
        'codeCoverageSummary': codeCoverageSummary,
      if (created != null) 'created': unixTimestampToJson(created),
      if (executionId != null) 'executionId': executionId,
      if (expired != null) 'expired': unixTimestampToJson(expired),
      if (exportConfig != null) 'exportConfig': exportConfig,
      if (name != null) 'name': name,
      if (reportGroupArn != null) 'reportGroupArn': reportGroupArn,
      if (status != null) 'status': status.toValue(),
      if (testSummary != null) 'testSummary': testSummary,
      if (truncated != null) 'truncated': truncated,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ReportCodeCoverageSortByType {
  lineCoveragePercentage,
  filePath,
}

extension ReportCodeCoverageSortByTypeValueExtension
    on ReportCodeCoverageSortByType {
  String toValue() {
    switch (this) {
      case ReportCodeCoverageSortByType.lineCoveragePercentage:
        return 'LINE_COVERAGE_PERCENTAGE';
      case ReportCodeCoverageSortByType.filePath:
        return 'FILE_PATH';
    }
  }
}

extension ReportCodeCoverageSortByTypeFromString on String {
  ReportCodeCoverageSortByType toReportCodeCoverageSortByType() {
    switch (this) {
      case 'LINE_COVERAGE_PERCENTAGE':
        return ReportCodeCoverageSortByType.lineCoveragePercentage;
      case 'FILE_PATH':
        return ReportCodeCoverageSortByType.filePath;
    }
    throw Exception('$this is not known in enum ReportCodeCoverageSortByType');
  }
}

/// Information about the location where the run of a report is exported.
class ReportExportConfig {
  /// The export configuration type. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>S3</code>: The report results are exported to an S3 bucket.
  /// </li>
  /// <li>
  /// <code>NO_EXPORT</code>: The report results are not exported.
  /// </li>
  /// </ul>
  final ReportExportConfigType? exportConfigType;

  /// A <code>S3ReportExportConfig</code> object that contains information about
  /// the S3 bucket where the run of a report is exported.
  final S3ReportExportConfig? s3Destination;

  ReportExportConfig({
    this.exportConfigType,
    this.s3Destination,
  });

  factory ReportExportConfig.fromJson(Map<String, dynamic> json) {
    return ReportExportConfig(
      exportConfigType:
          (json['exportConfigType'] as String?)?.toReportExportConfigType(),
      s3Destination: json['s3Destination'] != null
          ? S3ReportExportConfig.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportConfigType = this.exportConfigType;
    final s3Destination = this.s3Destination;
    return {
      if (exportConfigType != null)
        'exportConfigType': exportConfigType.toValue(),
      if (s3Destination != null) 's3Destination': s3Destination,
    };
  }
}

enum ReportExportConfigType {
  s3,
  noExport,
}

extension ReportExportConfigTypeValueExtension on ReportExportConfigType {
  String toValue() {
    switch (this) {
      case ReportExportConfigType.s3:
        return 'S3';
      case ReportExportConfigType.noExport:
        return 'NO_EXPORT';
    }
  }
}

extension ReportExportConfigTypeFromString on String {
  ReportExportConfigType toReportExportConfigType() {
    switch (this) {
      case 'S3':
        return ReportExportConfigType.s3;
      case 'NO_EXPORT':
        return ReportExportConfigType.noExport;
    }
    throw Exception('$this is not known in enum ReportExportConfigType');
  }
}

/// A filter used to return reports with the status specified by the input
/// <code>status</code> parameter.
class ReportFilter {
  /// The status used to filter reports. You can filter using one status only.
  final ReportStatusType? status;

  ReportFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A series of reports. Each report contains information about the results from
/// running a series of test cases. You specify the test cases for a report
/// group in the buildspec for a build project using one or more paths to the
/// test case files.
class ReportGroup {
  /// The ARN of the <code>ReportGroup</code>.
  final String? arn;

  /// The date and time this <code>ReportGroup</code> was created.
  final DateTime? created;

  /// Information about the destination where the raw data of this
  /// <code>ReportGroup</code> is exported.
  final ReportExportConfig? exportConfig;

  /// The date and time this <code>ReportGroup</code> was last modified.
  final DateTime? lastModified;

  /// The name of the <code>ReportGroup</code>.
  final String? name;

  /// The status of the report group. This property is read-only.
  ///
  /// This can be one of the following values:
  /// <dl> <dt>ACTIVE</dt> <dd>
  /// The report group is active.
  /// </dd> <dt>DELETING</dt> <dd>
  /// The report group is in the process of being deleted.
  /// </dd> </dl>
  final ReportGroupStatusType? status;

  /// A list of tag key and value pairs associated with this report group.
  ///
  /// These tags are available for use by Amazon Web Services services that
  /// support CodeBuild report group tags.
  final List<Tag>? tags;

  /// The type of the <code>ReportGroup</code>. This can be one of the following
  /// values:
  /// <dl> <dt>CODE_COVERAGE</dt> <dd>
  /// The report group contains code coverage reports.
  /// </dd> <dt>TEST</dt> <dd>
  /// The report group contains test reports.
  /// </dd> </dl>
  final ReportType? type;

  ReportGroup({
    this.arn,
    this.created,
    this.exportConfig,
    this.lastModified,
    this.name,
    this.status,
    this.tags,
    this.type,
  });

  factory ReportGroup.fromJson(Map<String, dynamic> json) {
    return ReportGroup(
      arn: json['arn'] as String?,
      created: timeStampFromJson(json['created']),
      exportConfig: json['exportConfig'] != null
          ? ReportExportConfig.fromJson(
              json['exportConfig'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toReportGroupStatusType(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.toReportType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final exportConfig = this.exportConfig;
    final lastModified = this.lastModified;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (created != null) 'created': unixTimestampToJson(created),
      if (exportConfig != null) 'exportConfig': exportConfig,
      if (lastModified != null)
        'lastModified': unixTimestampToJson(lastModified),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ReportGroupSortByType {
  name,
  createdTime,
  lastModifiedTime,
}

extension ReportGroupSortByTypeValueExtension on ReportGroupSortByType {
  String toValue() {
    switch (this) {
      case ReportGroupSortByType.name:
        return 'NAME';
      case ReportGroupSortByType.createdTime:
        return 'CREATED_TIME';
      case ReportGroupSortByType.lastModifiedTime:
        return 'LAST_MODIFIED_TIME';
    }
  }
}

extension ReportGroupSortByTypeFromString on String {
  ReportGroupSortByType toReportGroupSortByType() {
    switch (this) {
      case 'NAME':
        return ReportGroupSortByType.name;
      case 'CREATED_TIME':
        return ReportGroupSortByType.createdTime;
      case 'LAST_MODIFIED_TIME':
        return ReportGroupSortByType.lastModifiedTime;
    }
    throw Exception('$this is not known in enum ReportGroupSortByType');
  }
}

enum ReportGroupStatusType {
  active,
  deleting,
}

extension ReportGroupStatusTypeValueExtension on ReportGroupStatusType {
  String toValue() {
    switch (this) {
      case ReportGroupStatusType.active:
        return 'ACTIVE';
      case ReportGroupStatusType.deleting:
        return 'DELETING';
    }
  }
}

extension ReportGroupStatusTypeFromString on String {
  ReportGroupStatusType toReportGroupStatusType() {
    switch (this) {
      case 'ACTIVE':
        return ReportGroupStatusType.active;
      case 'DELETING':
        return ReportGroupStatusType.deleting;
    }
    throw Exception('$this is not known in enum ReportGroupStatusType');
  }
}

enum ReportGroupTrendFieldType {
  passRate,
  duration,
  total,
  lineCoverage,
  linesCovered,
  linesMissed,
  branchCoverage,
  branchesCovered,
  branchesMissed,
}

extension ReportGroupTrendFieldTypeValueExtension on ReportGroupTrendFieldType {
  String toValue() {
    switch (this) {
      case ReportGroupTrendFieldType.passRate:
        return 'PASS_RATE';
      case ReportGroupTrendFieldType.duration:
        return 'DURATION';
      case ReportGroupTrendFieldType.total:
        return 'TOTAL';
      case ReportGroupTrendFieldType.lineCoverage:
        return 'LINE_COVERAGE';
      case ReportGroupTrendFieldType.linesCovered:
        return 'LINES_COVERED';
      case ReportGroupTrendFieldType.linesMissed:
        return 'LINES_MISSED';
      case ReportGroupTrendFieldType.branchCoverage:
        return 'BRANCH_COVERAGE';
      case ReportGroupTrendFieldType.branchesCovered:
        return 'BRANCHES_COVERED';
      case ReportGroupTrendFieldType.branchesMissed:
        return 'BRANCHES_MISSED';
    }
  }
}

extension ReportGroupTrendFieldTypeFromString on String {
  ReportGroupTrendFieldType toReportGroupTrendFieldType() {
    switch (this) {
      case 'PASS_RATE':
        return ReportGroupTrendFieldType.passRate;
      case 'DURATION':
        return ReportGroupTrendFieldType.duration;
      case 'TOTAL':
        return ReportGroupTrendFieldType.total;
      case 'LINE_COVERAGE':
        return ReportGroupTrendFieldType.lineCoverage;
      case 'LINES_COVERED':
        return ReportGroupTrendFieldType.linesCovered;
      case 'LINES_MISSED':
        return ReportGroupTrendFieldType.linesMissed;
      case 'BRANCH_COVERAGE':
        return ReportGroupTrendFieldType.branchCoverage;
      case 'BRANCHES_COVERED':
        return ReportGroupTrendFieldType.branchesCovered;
      case 'BRANCHES_MISSED':
        return ReportGroupTrendFieldType.branchesMissed;
    }
    throw Exception('$this is not known in enum ReportGroupTrendFieldType');
  }
}

/// Contains trend statistics for a set of reports. The actual values depend on
/// the type of trend being collected. For more information, see .
class ReportGroupTrendStats {
  /// Contains the average of all values analyzed.
  final String? average;

  /// Contains the maximum value analyzed.
  final String? max;

  /// Contains the minimum value analyzed.
  final String? min;

  ReportGroupTrendStats({
    this.average,
    this.max,
    this.min,
  });

  factory ReportGroupTrendStats.fromJson(Map<String, dynamic> json) {
    return ReportGroupTrendStats(
      average: json['average'] as String?,
      max: json['max'] as String?,
      min: json['min'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final max = this.max;
    final min = this.min;
    return {
      if (average != null) 'average': average,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
    };
  }
}

enum ReportPackagingType {
  zip,
  none,
}

extension ReportPackagingTypeValueExtension on ReportPackagingType {
  String toValue() {
    switch (this) {
      case ReportPackagingType.zip:
        return 'ZIP';
      case ReportPackagingType.none:
        return 'NONE';
    }
  }
}

extension ReportPackagingTypeFromString on String {
  ReportPackagingType toReportPackagingType() {
    switch (this) {
      case 'ZIP':
        return ReportPackagingType.zip;
      case 'NONE':
        return ReportPackagingType.none;
    }
    throw Exception('$this is not known in enum ReportPackagingType');
  }
}

enum ReportStatusType {
  generating,
  succeeded,
  failed,
  incomplete,
  deleting,
}

extension ReportStatusTypeValueExtension on ReportStatusType {
  String toValue() {
    switch (this) {
      case ReportStatusType.generating:
        return 'GENERATING';
      case ReportStatusType.succeeded:
        return 'SUCCEEDED';
      case ReportStatusType.failed:
        return 'FAILED';
      case ReportStatusType.incomplete:
        return 'INCOMPLETE';
      case ReportStatusType.deleting:
        return 'DELETING';
    }
  }
}

extension ReportStatusTypeFromString on String {
  ReportStatusType toReportStatusType() {
    switch (this) {
      case 'GENERATING':
        return ReportStatusType.generating;
      case 'SUCCEEDED':
        return ReportStatusType.succeeded;
      case 'FAILED':
        return ReportStatusType.failed;
      case 'INCOMPLETE':
        return ReportStatusType.incomplete;
      case 'DELETING':
        return ReportStatusType.deleting;
    }
    throw Exception('$this is not known in enum ReportStatusType');
  }
}

enum ReportType {
  test,
  codeCoverage,
}

extension ReportTypeValueExtension on ReportType {
  String toValue() {
    switch (this) {
      case ReportType.test:
        return 'TEST';
      case ReportType.codeCoverage:
        return 'CODE_COVERAGE';
    }
  }
}

extension ReportTypeFromString on String {
  ReportType toReportType() {
    switch (this) {
      case 'TEST':
        return ReportType.test;
      case 'CODE_COVERAGE':
        return ReportType.codeCoverage;
    }
    throw Exception('$this is not known in enum ReportType');
  }
}

/// Contains the unmodified data for the report. For more information, see .
class ReportWithRawData {
  /// The value of the requested data field from the report.
  final String? data;

  /// The ARN of the report.
  final String? reportArn;

  ReportWithRawData({
    this.data,
    this.reportArn,
  });

  factory ReportWithRawData.fromJson(Map<String, dynamic> json) {
    return ReportWithRawData(
      data: json['data'] as String?,
      reportArn: json['reportArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final reportArn = this.reportArn;
    return {
      if (data != null) 'data': data,
      if (reportArn != null) 'reportArn': reportArn,
    };
  }
}

/// Represents a resolved build artifact. A resolved artifact is an artifact
/// that is built and deployed to the destination, such as Amazon S3.
class ResolvedArtifact {
  /// The identifier of the artifact.
  final String? identifier;

  /// The location of the artifact.
  final String? location;

  /// Specifies the type of artifact.
  final ArtifactsType? type;

  ResolvedArtifact({
    this.identifier,
    this.location,
    this.type,
  });

  factory ResolvedArtifact.fromJson(Map<String, dynamic> json) {
    return ResolvedArtifact(
      identifier: json['identifier'] as String?,
      location: json['location'] as String?,
      type: (json['type'] as String?)?.toArtifactsType(),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final location = this.location;
    final type = this.type;
    return {
      if (identifier != null) 'identifier': identifier,
      if (location != null) 'location': location,
      if (type != null) 'type': type.toValue(),
    };
  }
}

class RetryBuildBatchOutput {
  final BuildBatch? buildBatch;

  RetryBuildBatchOutput({
    this.buildBatch,
  });

  factory RetryBuildBatchOutput.fromJson(Map<String, dynamic> json) {
    return RetryBuildBatchOutput(
      buildBatch: json['buildBatch'] != null
          ? BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final buildBatch = this.buildBatch;
    return {
      if (buildBatch != null) 'buildBatch': buildBatch,
    };
  }
}

enum RetryBuildBatchType {
  retryAllBuilds,
  retryFailedBuilds,
}

extension RetryBuildBatchTypeValueExtension on RetryBuildBatchType {
  String toValue() {
    switch (this) {
      case RetryBuildBatchType.retryAllBuilds:
        return 'RETRY_ALL_BUILDS';
      case RetryBuildBatchType.retryFailedBuilds:
        return 'RETRY_FAILED_BUILDS';
    }
  }
}

extension RetryBuildBatchTypeFromString on String {
  RetryBuildBatchType toRetryBuildBatchType() {
    switch (this) {
      case 'RETRY_ALL_BUILDS':
        return RetryBuildBatchType.retryAllBuilds;
      case 'RETRY_FAILED_BUILDS':
        return RetryBuildBatchType.retryFailedBuilds;
    }
    throw Exception('$this is not known in enum RetryBuildBatchType');
  }
}

class RetryBuildOutput {
  final Build? build;

  RetryBuildOutput({
    this.build,
  });

  factory RetryBuildOutput.fromJson(Map<String, dynamic> json) {
    return RetryBuildOutput(
      build: json['build'] != null
          ? Build.fromJson(json['build'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    return {
      if (build != null) 'build': build,
    };
  }
}

/// Information about S3 logs for a build project.
class S3LogsConfig {
  /// The current status of the S3 build logs. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: S3 build logs are enabled for this build project.
  /// </li>
  /// <li>
  /// <code>DISABLED</code>: S3 build logs are not enabled for this build project.
  /// </li>
  /// </ul>
  final LogsConfigStatusType status;
  final BucketOwnerAccess? bucketOwnerAccess;

  /// Set to true if you do not want your S3 build log output encrypted. By
  /// default S3 build logs are encrypted.
  final bool? encryptionDisabled;

  /// The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon S3
  /// bucket name is <code>my-bucket</code>, and your path prefix is
  /// <code>build-log</code>, then acceptable formats are
  /// <code>my-bucket/build-log</code> or
  /// <code>arn:aws:s3:::my-bucket/build-log</code>.
  final String? location;

  S3LogsConfig({
    required this.status,
    this.bucketOwnerAccess,
    this.encryptionDisabled,
    this.location,
  });

  factory S3LogsConfig.fromJson(Map<String, dynamic> json) {
    return S3LogsConfig(
      status: (json['status'] as String).toLogsConfigStatusType(),
      bucketOwnerAccess:
          (json['bucketOwnerAccess'] as String?)?.toBucketOwnerAccess(),
      encryptionDisabled: json['encryptionDisabled'] as bool?,
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final bucketOwnerAccess = this.bucketOwnerAccess;
    final encryptionDisabled = this.encryptionDisabled;
    final location = this.location;
    return {
      'status': status.toValue(),
      if (bucketOwnerAccess != null)
        'bucketOwnerAccess': bucketOwnerAccess.toValue(),
      if (encryptionDisabled != null) 'encryptionDisabled': encryptionDisabled,
      if (location != null) 'location': location,
    };
  }
}

/// Information about the S3 bucket where the raw data of a report are exported.
class S3ReportExportConfig {
  /// The name of the S3 bucket where the raw data of a report are exported.
  final String? bucket;

  /// The Amazon Web Services account identifier of the owner of the Amazon S3
  /// bucket. This allows report data to be exported to an Amazon S3 bucket that
  /// is owned by an account other than the account running the build.
  final String? bucketOwner;

  /// A boolean value that specifies if the results of a report are encrypted.
  final bool? encryptionDisabled;

  /// The encryption key for the report's encrypted raw data.
  final String? encryptionKey;

  /// The type of build output artifact to create. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: CodeBuild creates the raw data in the output bucket. This
  /// is the default if packaging is not specified.
  /// </li>
  /// <li>
  /// <code>ZIP</code>: CodeBuild creates a ZIP file with the raw data in the
  /// output bucket.
  /// </li>
  /// </ul>
  final ReportPackagingType? packaging;

  /// The path to the exported report's raw data results.
  final String? path;

  S3ReportExportConfig({
    this.bucket,
    this.bucketOwner,
    this.encryptionDisabled,
    this.encryptionKey,
    this.packaging,
    this.path,
  });

  factory S3ReportExportConfig.fromJson(Map<String, dynamic> json) {
    return S3ReportExportConfig(
      bucket: json['bucket'] as String?,
      bucketOwner: json['bucketOwner'] as String?,
      encryptionDisabled: json['encryptionDisabled'] as bool?,
      encryptionKey: json['encryptionKey'] as String?,
      packaging: (json['packaging'] as String?)?.toReportPackagingType(),
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final bucketOwner = this.bucketOwner;
    final encryptionDisabled = this.encryptionDisabled;
    final encryptionKey = this.encryptionKey;
    final packaging = this.packaging;
    final path = this.path;
    return {
      if (bucket != null) 'bucket': bucket,
      if (bucketOwner != null) 'bucketOwner': bucketOwner,
      if (encryptionDisabled != null) 'encryptionDisabled': encryptionDisabled,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (packaging != null) 'packaging': packaging.toValue(),
      if (path != null) 'path': path,
    };
  }
}

/// The scaling configuration input of a compute fleet.
class ScalingConfigurationInput {
  /// The maximum number of instances in the ﬂeet when auto-scaling.
  final int? maxCapacity;

  /// The scaling type for a compute fleet.
  final FleetScalingType? scalingType;

  /// A list of <code>TargetTrackingScalingConfiguration</code> objects.
  final List<TargetTrackingScalingConfiguration>? targetTrackingScalingConfigs;

  ScalingConfigurationInput({
    this.maxCapacity,
    this.scalingType,
    this.targetTrackingScalingConfigs,
  });

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final scalingType = this.scalingType;
    final targetTrackingScalingConfigs = this.targetTrackingScalingConfigs;
    return {
      if (maxCapacity != null) 'maxCapacity': maxCapacity,
      if (scalingType != null) 'scalingType': scalingType.toValue(),
      if (targetTrackingScalingConfigs != null)
        'targetTrackingScalingConfigs': targetTrackingScalingConfigs,
    };
  }
}

/// The scaling configuration output of a compute fleet.
class ScalingConfigurationOutput {
  /// The desired number of instances in the ﬂeet when auto-scaling.
  final int? desiredCapacity;

  /// The maximum number of instances in the ﬂeet when auto-scaling.
  final int? maxCapacity;

  /// The scaling type for a compute fleet.
  final FleetScalingType? scalingType;

  /// A list of <code>TargetTrackingScalingConfiguration</code> objects.
  final List<TargetTrackingScalingConfiguration>? targetTrackingScalingConfigs;

  ScalingConfigurationOutput({
    this.desiredCapacity,
    this.maxCapacity,
    this.scalingType,
    this.targetTrackingScalingConfigs,
  });

  factory ScalingConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return ScalingConfigurationOutput(
      desiredCapacity: json['desiredCapacity'] as int?,
      maxCapacity: json['maxCapacity'] as int?,
      scalingType: (json['scalingType'] as String?)?.toFleetScalingType(),
      targetTrackingScalingConfigs:
          (json['targetTrackingScalingConfigs'] as List?)
              ?.whereNotNull()
              .map((e) => TargetTrackingScalingConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final desiredCapacity = this.desiredCapacity;
    final maxCapacity = this.maxCapacity;
    final scalingType = this.scalingType;
    final targetTrackingScalingConfigs = this.targetTrackingScalingConfigs;
    return {
      if (desiredCapacity != null) 'desiredCapacity': desiredCapacity,
      if (maxCapacity != null) 'maxCapacity': maxCapacity,
      if (scalingType != null) 'scalingType': scalingType.toValue(),
      if (targetTrackingScalingConfigs != null)
        'targetTrackingScalingConfigs': targetTrackingScalingConfigs,
    };
  }
}

enum ServerType {
  github,
  bitbucket,
  githubEnterprise,
  gitlab,
  gitlabSelfManaged,
}

extension ServerTypeValueExtension on ServerType {
  String toValue() {
    switch (this) {
      case ServerType.github:
        return 'GITHUB';
      case ServerType.bitbucket:
        return 'BITBUCKET';
      case ServerType.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case ServerType.gitlab:
        return 'GITLAB';
      case ServerType.gitlabSelfManaged:
        return 'GITLAB_SELF_MANAGED';
    }
  }
}

extension ServerTypeFromString on String {
  ServerType toServerType() {
    switch (this) {
      case 'GITHUB':
        return ServerType.github;
      case 'BITBUCKET':
        return ServerType.bitbucket;
      case 'GITHUB_ENTERPRISE':
        return ServerType.githubEnterprise;
      case 'GITLAB':
        return ServerType.gitlab;
      case 'GITLAB_SELF_MANAGED':
        return ServerType.gitlabSelfManaged;
    }
    throw Exception('$this is not known in enum ServerType');
  }
}

enum SharedResourceSortByType {
  arn,
  modifiedTime,
}

extension SharedResourceSortByTypeValueExtension on SharedResourceSortByType {
  String toValue() {
    switch (this) {
      case SharedResourceSortByType.arn:
        return 'ARN';
      case SharedResourceSortByType.modifiedTime:
        return 'MODIFIED_TIME';
    }
  }
}

extension SharedResourceSortByTypeFromString on String {
  SharedResourceSortByType toSharedResourceSortByType() {
    switch (this) {
      case 'ARN':
        return SharedResourceSortByType.arn;
      case 'MODIFIED_TIME':
        return SharedResourceSortByType.modifiedTime;
    }
    throw Exception('$this is not known in enum SharedResourceSortByType');
  }
}

enum SortOrderType {
  ascending,
  descending,
}

extension SortOrderTypeValueExtension on SortOrderType {
  String toValue() {
    switch (this) {
      case SortOrderType.ascending:
        return 'ASCENDING';
      case SortOrderType.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderTypeFromString on String {
  SortOrderType toSortOrderType() {
    switch (this) {
      case 'ASCENDING':
        return SortOrderType.ascending;
      case 'DESCENDING':
        return SortOrderType.descending;
    }
    throw Exception('$this is not known in enum SortOrderType');
  }
}

/// Information about the authorization settings for CodeBuild to access the
/// source code to be built.
///
/// This information is for the CodeBuild console's use only. Your code should
/// not get or set this information directly.
class SourceAuth {
  /// The authorization type to use. Valid options are OAUTH or CODECONNECTIONS.
  final SourceAuthType type;

  /// The resource value that applies to the specified authorization type.
  final String? resource;

  SourceAuth({
    required this.type,
    this.resource,
  });

  factory SourceAuth.fromJson(Map<String, dynamic> json) {
    return SourceAuth(
      type: (json['type'] as String).toSourceAuthType(),
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final resource = this.resource;
    return {
      'type': type.toValue(),
      if (resource != null) 'resource': resource,
    };
  }
}

enum SourceAuthType {
  oauth,
  codeconnections,
}

extension SourceAuthTypeValueExtension on SourceAuthType {
  String toValue() {
    switch (this) {
      case SourceAuthType.oauth:
        return 'OAUTH';
      case SourceAuthType.codeconnections:
        return 'CODECONNECTIONS';
    }
  }
}

extension SourceAuthTypeFromString on String {
  SourceAuthType toSourceAuthType() {
    switch (this) {
      case 'OAUTH':
        return SourceAuthType.oauth;
      case 'CODECONNECTIONS':
        return SourceAuthType.codeconnections;
    }
    throw Exception('$this is not known in enum SourceAuthType');
  }
}

/// Information about the credentials for a GitHub, GitHub Enterprise, GitLab,
/// GitLab Self Managed, or Bitbucket repository.
class SourceCredentialsInfo {
  /// The Amazon Resource Name (ARN) of the token.
  final String? arn;

  /// The type of authentication used by the credentials. Valid options are OAUTH,
  /// BASIC_AUTH, PERSONAL_ACCESS_TOKEN, or CODECONNECTIONS.
  final AuthType? authType;

  /// The connection ARN if your serverType type is GITLAB or GITLAB_SELF_MANAGED
  /// and your authType is CODECONNECTIONS.
  final String? resource;

  /// The type of source provider. The valid options are GITHUB,
  /// GITHUB_ENTERPRISE, GITLAB, GITLAB_SELF_MANAGED, or BITBUCKET.
  final ServerType? serverType;

  SourceCredentialsInfo({
    this.arn,
    this.authType,
    this.resource,
    this.serverType,
  });

  factory SourceCredentialsInfo.fromJson(Map<String, dynamic> json) {
    return SourceCredentialsInfo(
      arn: json['arn'] as String?,
      authType: (json['authType'] as String?)?.toAuthType(),
      resource: json['resource'] as String?,
      serverType: (json['serverType'] as String?)?.toServerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authType = this.authType;
    final resource = this.resource;
    final serverType = this.serverType;
    return {
      if (arn != null) 'arn': arn,
      if (authType != null) 'authType': authType.toValue(),
      if (resource != null) 'resource': resource,
      if (serverType != null) 'serverType': serverType.toValue(),
    };
  }
}

enum SourceType {
  codecommit,
  codepipeline,
  github,
  gitlab,
  gitlabSelfManaged,
  s3,
  bitbucket,
  githubEnterprise,
  noSource,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.codecommit:
        return 'CODECOMMIT';
      case SourceType.codepipeline:
        return 'CODEPIPELINE';
      case SourceType.github:
        return 'GITHUB';
      case SourceType.gitlab:
        return 'GITLAB';
      case SourceType.gitlabSelfManaged:
        return 'GITLAB_SELF_MANAGED';
      case SourceType.s3:
        return 'S3';
      case SourceType.bitbucket:
        return 'BITBUCKET';
      case SourceType.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case SourceType.noSource:
        return 'NO_SOURCE';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'CODECOMMIT':
        return SourceType.codecommit;
      case 'CODEPIPELINE':
        return SourceType.codepipeline;
      case 'GITHUB':
        return SourceType.github;
      case 'GITLAB':
        return SourceType.gitlab;
      case 'GITLAB_SELF_MANAGED':
        return SourceType.gitlabSelfManaged;
      case 'S3':
        return SourceType.s3;
      case 'BITBUCKET':
        return SourceType.bitbucket;
      case 'GITHUB_ENTERPRISE':
        return SourceType.githubEnterprise;
      case 'NO_SOURCE':
        return SourceType.noSource;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartBuildBatchOutput {
  /// A <code>BuildBatch</code> object that contains information about the batch
  /// build.
  final BuildBatch? buildBatch;

  StartBuildBatchOutput({
    this.buildBatch,
  });

  factory StartBuildBatchOutput.fromJson(Map<String, dynamic> json) {
    return StartBuildBatchOutput(
      buildBatch: json['buildBatch'] != null
          ? BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final buildBatch = this.buildBatch;
    return {
      if (buildBatch != null) 'buildBatch': buildBatch,
    };
  }
}

class StartBuildOutput {
  /// Information about the build to be run.
  final Build? build;

  StartBuildOutput({
    this.build,
  });

  factory StartBuildOutput.fromJson(Map<String, dynamic> json) {
    return StartBuildOutput(
      build: json['build'] != null
          ? Build.fromJson(json['build'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    return {
      if (build != null) 'build': build,
    };
  }
}

enum StatusType {
  succeeded,
  failed,
  fault,
  timedOut,
  inProgress,
  stopped,
}

extension StatusTypeValueExtension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.succeeded:
        return 'SUCCEEDED';
      case StatusType.failed:
        return 'FAILED';
      case StatusType.fault:
        return 'FAULT';
      case StatusType.timedOut:
        return 'TIMED_OUT';
      case StatusType.inProgress:
        return 'IN_PROGRESS';
      case StatusType.stopped:
        return 'STOPPED';
    }
  }
}

extension StatusTypeFromString on String {
  StatusType toStatusType() {
    switch (this) {
      case 'SUCCEEDED':
        return StatusType.succeeded;
      case 'FAILED':
        return StatusType.failed;
      case 'FAULT':
        return StatusType.fault;
      case 'TIMED_OUT':
        return StatusType.timedOut;
      case 'IN_PROGRESS':
        return StatusType.inProgress;
      case 'STOPPED':
        return StatusType.stopped;
    }
    throw Exception('$this is not known in enum StatusType');
  }
}

class StopBuildBatchOutput {
  final BuildBatch? buildBatch;

  StopBuildBatchOutput({
    this.buildBatch,
  });

  factory StopBuildBatchOutput.fromJson(Map<String, dynamic> json) {
    return StopBuildBatchOutput(
      buildBatch: json['buildBatch'] != null
          ? BuildBatch.fromJson(json['buildBatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final buildBatch = this.buildBatch;
    return {
      if (buildBatch != null) 'buildBatch': buildBatch,
    };
  }
}

class StopBuildOutput {
  /// Information about the build.
  final Build? build;

  StopBuildOutput({
    this.build,
  });

  factory StopBuildOutput.fromJson(Map<String, dynamic> json) {
    return StopBuildOutput(
      build: json['build'] != null
          ? Build.fromJson(json['build'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final build = this.build;
    return {
      if (build != null) 'build': build,
    };
  }
}

/// A tag, consisting of a key and a value.
///
/// This tag is available for use by Amazon Web Services services that support
/// tags in CodeBuild.
class Tag {
  /// The tag's key.
  final String? key;

  /// The tag's value.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Defines when a new instance is auto-scaled into the compute fleet.
class TargetTrackingScalingConfiguration {
  /// The metric type to determine auto-scaling.
  final FleetScalingMetricType? metricType;

  /// The value of <code>metricType</code> when to start scaling.
  final double? targetValue;

  TargetTrackingScalingConfiguration({
    this.metricType,
    this.targetValue,
  });

  factory TargetTrackingScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TargetTrackingScalingConfiguration(
      metricType: (json['metricType'] as String?)?.toFleetScalingMetricType(),
      targetValue: json['targetValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricType = this.metricType;
    final targetValue = this.targetValue;
    return {
      if (metricType != null) 'metricType': metricType.toValue(),
      if (targetValue != null) 'targetValue': targetValue,
    };
  }
}

/// Information about a test case created using a framework such as NUnit or
/// Cucumber. A test case might be a unit test or a configuration test.
class TestCase {
  /// The number of nanoseconds it took to run this test case.
  final int? durationInNanoSeconds;

  /// The date and time a test case expires. A test case expires 30 days after it
  /// is created. An expired test case is not available to view in CodeBuild.
  final DateTime? expired;

  /// A message associated with a test case. For example, an error message or
  /// stack trace.
  final String? message;

  /// The name of the test case.
  final String? name;

  /// A string that is applied to a series of related test cases. CodeBuild
  /// generates the prefix. The prefix depends on the framework used to generate
  /// the tests.
  final String? prefix;

  /// The ARN of the report to which the test case belongs.
  final String? reportArn;

  /// The status returned by the test case after it was run. Valid statuses are
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, <code>ERROR</code>,
  /// <code>SKIPPED</code>, and <code>UNKNOWN</code>.
  final String? status;

  /// The path to the raw data file that contains the test result.
  final String? testRawDataPath;

  TestCase({
    this.durationInNanoSeconds,
    this.expired,
    this.message,
    this.name,
    this.prefix,
    this.reportArn,
    this.status,
    this.testRawDataPath,
  });

  factory TestCase.fromJson(Map<String, dynamic> json) {
    return TestCase(
      durationInNanoSeconds: json['durationInNanoSeconds'] as int?,
      expired: timeStampFromJson(json['expired']),
      message: json['message'] as String?,
      name: json['name'] as String?,
      prefix: json['prefix'] as String?,
      reportArn: json['reportArn'] as String?,
      status: json['status'] as String?,
      testRawDataPath: json['testRawDataPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInNanoSeconds = this.durationInNanoSeconds;
    final expired = this.expired;
    final message = this.message;
    final name = this.name;
    final prefix = this.prefix;
    final reportArn = this.reportArn;
    final status = this.status;
    final testRawDataPath = this.testRawDataPath;
    return {
      if (durationInNanoSeconds != null)
        'durationInNanoSeconds': durationInNanoSeconds,
      if (expired != null) 'expired': unixTimestampToJson(expired),
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (prefix != null) 'prefix': prefix,
      if (reportArn != null) 'reportArn': reportArn,
      if (status != null) 'status': status,
      if (testRawDataPath != null) 'testRawDataPath': testRawDataPath,
    };
  }
}

/// A filter used to return specific types of test cases. In order to pass the
/// filter, the report must meet all of the filter properties.
class TestCaseFilter {
  /// A keyword that is used to filter on the <code>name</code> or the
  /// <code>prefix</code> of the test cases. Only test cases where the keyword is
  /// a substring of the <code>name</code> or the <code>prefix</code> will be
  /// returned.
  final String? keyword;

  /// The status used to filter test cases. A <code>TestCaseFilter</code> can have
  /// one status. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code>
  /// </li>
  /// <li>
  /// <code>FAILED</code>
  /// </li>
  /// <li>
  /// <code>ERROR</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code>
  /// </li>
  /// </ul>
  final String? status;

  TestCaseFilter({
    this.keyword,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final status = this.status;
    return {
      if (keyword != null) 'keyword': keyword,
      if (status != null) 'status': status,
    };
  }
}

/// Information about a test report.
class TestReportSummary {
  /// The number of nanoseconds it took to run all of the test cases in this
  /// report.
  final int durationInNanoSeconds;

  /// A map that contains the number of each type of status returned by the test
  /// results in this <code>TestReportSummary</code>.
  final Map<String, int> statusCounts;

  /// The number of test cases in this <code>TestReportSummary</code>. The total
  /// includes truncated test cases.
  final int total;

  TestReportSummary({
    required this.durationInNanoSeconds,
    required this.statusCounts,
    required this.total,
  });

  factory TestReportSummary.fromJson(Map<String, dynamic> json) {
    return TestReportSummary(
      durationInNanoSeconds: json['durationInNanoSeconds'] as int,
      statusCounts: (json['statusCounts'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as int)),
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInNanoSeconds = this.durationInNanoSeconds;
    final statusCounts = this.statusCounts;
    final total = this.total;
    return {
      'durationInNanoSeconds': durationInNanoSeconds,
      'statusCounts': statusCounts,
      'total': total,
    };
  }
}

class UpdateFleetOutput {
  /// A <code>Fleet</code> object.
  final Fleet? fleet;

  UpdateFleetOutput({
    this.fleet,
  });

  factory UpdateFleetOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFleetOutput(
      fleet: json['fleet'] != null
          ? Fleet.fromJson(json['fleet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    return {
      if (fleet != null) 'fleet': fleet,
    };
  }
}

class UpdateProjectOutput {
  /// Information about the build project that was changed.
  final Project? project;

  UpdateProjectOutput({
    this.project,
  });

  factory UpdateProjectOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProjectOutput(
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      if (project != null) 'project': project,
    };
  }
}

class UpdateProjectVisibilityOutput {
  /// The Amazon Resource Name (ARN) of the build project.
  final String? projectArn;
  final ProjectVisibilityType? projectVisibility;

  /// Contains the project identifier used with the public build APIs.
  final String? publicProjectAlias;

  UpdateProjectVisibilityOutput({
    this.projectArn,
    this.projectVisibility,
    this.publicProjectAlias,
  });

  factory UpdateProjectVisibilityOutput.fromJson(Map<String, dynamic> json) {
    return UpdateProjectVisibilityOutput(
      projectArn: json['projectArn'] as String?,
      projectVisibility:
          (json['projectVisibility'] as String?)?.toProjectVisibilityType(),
      publicProjectAlias: json['publicProjectAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectVisibility = this.projectVisibility;
    final publicProjectAlias = this.publicProjectAlias;
    return {
      if (projectArn != null) 'projectArn': projectArn,
      if (projectVisibility != null)
        'projectVisibility': projectVisibility.toValue(),
      if (publicProjectAlias != null) 'publicProjectAlias': publicProjectAlias,
    };
  }
}

class UpdateReportGroupOutput {
  /// Information about the updated report group.
  final ReportGroup? reportGroup;

  UpdateReportGroupOutput({
    this.reportGroup,
  });

  factory UpdateReportGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateReportGroupOutput(
      reportGroup: json['reportGroup'] != null
          ? ReportGroup.fromJson(json['reportGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportGroup = this.reportGroup;
    return {
      if (reportGroup != null) 'reportGroup': reportGroup,
    };
  }
}

class UpdateWebhookOutput {
  /// Information about a repository's webhook that is associated with a project
  /// in CodeBuild.
  final Webhook? webhook;

  UpdateWebhookOutput({
    this.webhook,
  });

  factory UpdateWebhookOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWebhookOutput(
      webhook: json['webhook'] != null
          ? Webhook.fromJson(json['webhook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webhook = this.webhook;
    return {
      if (webhook != null) 'webhook': webhook,
    };
  }
}

/// Information about the VPC configuration that CodeBuild accesses.
class VpcConfig {
  /// A list of one or more security groups IDs in your Amazon VPC.
  final List<String>? securityGroupIds;

  /// A list of one or more subnet IDs in your Amazon VPC.
  final List<String>? subnets;

  /// The ID of the Amazon VPC.
  final String? vpcId;

  VpcConfig({
    this.securityGroupIds,
    this.subnets,
    this.vpcId,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnets != null) 'subnets': subnets,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Information about a webhook that connects repository events to a build
/// project in CodeBuild.
class Webhook {
  /// A regular expression used to determine which repository branches are built
  /// when a webhook is triggered. If the name of a branch matches the regular
  /// expression, then it is built. If <code>branchFilter</code> is empty, then
  /// all branches are built.
  /// <note>
  /// It is recommended that you use <code>filterGroups</code> instead of
  /// <code>branchFilter</code>.
  /// </note>
  final String? branchFilter;

  /// Specifies the type of build this webhook will trigger.
  final WebhookBuildType? buildType;

  /// An array of arrays of <code>WebhookFilter</code> objects used to determine
  /// which webhooks are triggered. At least one <code>WebhookFilter</code> in the
  /// array must specify <code>EVENT</code> as its <code>type</code>.
  ///
  /// For a build to be triggered, at least one filter group in the
  /// <code>filterGroups</code> array must pass. For a filter group to pass, each
  /// of its filters must pass.
  final List<List<WebhookFilter>>? filterGroups;

  /// A timestamp that indicates the last time a repository's secret token was
  /// modified.
  final DateTime? lastModifiedSecret;

  /// If manualCreation is true, CodeBuild doesn't create a webhook in GitHub and
  /// instead returns <code>payloadUrl</code> and <code>secret</code> values for
  /// the webhook. The <code>payloadUrl</code> and <code>secret</code> values in
  /// the output can be used to manually create a webhook within GitHub.
  /// <note>
  /// manualCreation is only available for GitHub webhooks.
  /// </note>
  final bool? manualCreation;

  /// The CodeBuild endpoint where webhook events are sent.
  final String? payloadUrl;

  /// The secret token of the associated repository.
  /// <note>
  /// A Bitbucket webhook does not support <code>secret</code>.
  /// </note>
  final String? secret;

  /// The URL to the webhook.
  final String? url;

  Webhook({
    this.branchFilter,
    this.buildType,
    this.filterGroups,
    this.lastModifiedSecret,
    this.manualCreation,
    this.payloadUrl,
    this.secret,
    this.url,
  });

  factory Webhook.fromJson(Map<String, dynamic> json) {
    return Webhook(
      branchFilter: json['branchFilter'] as String?,
      buildType: (json['buildType'] as String?)?.toWebhookBuildType(),
      filterGroups: (json['filterGroups'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => WebhookFilter.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      lastModifiedSecret: timeStampFromJson(json['lastModifiedSecret']),
      manualCreation: json['manualCreation'] as bool?,
      payloadUrl: json['payloadUrl'] as String?,
      secret: json['secret'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchFilter = this.branchFilter;
    final buildType = this.buildType;
    final filterGroups = this.filterGroups;
    final lastModifiedSecret = this.lastModifiedSecret;
    final manualCreation = this.manualCreation;
    final payloadUrl = this.payloadUrl;
    final secret = this.secret;
    final url = this.url;
    return {
      if (branchFilter != null) 'branchFilter': branchFilter,
      if (buildType != null) 'buildType': buildType.toValue(),
      if (filterGroups != null) 'filterGroups': filterGroups,
      if (lastModifiedSecret != null)
        'lastModifiedSecret': unixTimestampToJson(lastModifiedSecret),
      if (manualCreation != null) 'manualCreation': manualCreation,
      if (payloadUrl != null) 'payloadUrl': payloadUrl,
      if (secret != null) 'secret': secret,
      if (url != null) 'url': url,
    };
  }
}

enum WebhookBuildType {
  build,
  buildBatch,
}

extension WebhookBuildTypeValueExtension on WebhookBuildType {
  String toValue() {
    switch (this) {
      case WebhookBuildType.build:
        return 'BUILD';
      case WebhookBuildType.buildBatch:
        return 'BUILD_BATCH';
    }
  }
}

extension WebhookBuildTypeFromString on String {
  WebhookBuildType toWebhookBuildType() {
    switch (this) {
      case 'BUILD':
        return WebhookBuildType.build;
      case 'BUILD_BATCH':
        return WebhookBuildType.buildBatch;
    }
    throw Exception('$this is not known in enum WebhookBuildType');
  }
}

/// A filter used to determine which webhooks trigger a build.
class WebhookFilter {
  /// For a <code>WebHookFilter</code> that uses <code>EVENT</code> type, a
  /// comma-separated string that specifies one or more events. For example, the
  /// webhook filter <code>PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED</code>
  /// allows all push, pull request created, and pull request updated events to
  /// trigger a build.
  ///
  /// For a <code>WebHookFilter</code> that uses any of the other filter types, a
  /// regular expression pattern. For example, a <code>WebHookFilter</code> that
  /// uses <code>HEAD_REF</code> for its <code>type</code> and the pattern
  /// <code>^refs/heads/</code> triggers a build when the head reference is a
  /// branch with a reference name <code>refs/heads/branch-name</code>.
  final String pattern;

  /// The type of webhook filter. There are nine webhook filter types:
  /// <code>EVENT</code>, <code>ACTOR_ACCOUNT_ID</code>, <code>HEAD_REF</code>,
  /// <code>BASE_REF</code>, <code>FILE_PATH</code>, <code>COMMIT_MESSAGE</code>,
  /// <code>TAG_NAME</code>, <code>RELEASE_NAME</code>, and
  /// <code>WORKFLOW_NAME</code>.
  ///
  /// <ul>
  /// <li>
  /// EVENT
  ///
  /// <ul>
  /// <li>
  /// A webhook event triggers a build when the provided <code>pattern</code>
  /// matches one of nine event types: <code>PUSH</code>,
  /// <code>PULL_REQUEST_CREATED</code>, <code>PULL_REQUEST_UPDATED</code>,
  /// <code>PULL_REQUEST_CLOSED</code>, <code>PULL_REQUEST_REOPENED</code>,
  /// <code>PULL_REQUEST_MERGED</code>, <code>RELEASED</code>,
  /// <code>PRERELEASED</code>, and <code>WORKFLOW_JOB_QUEUED</code>. The
  /// <code>EVENT</code> patterns are specified as a comma-separated string. For
  /// example, <code>PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED</code>
  /// filters all push, pull request created, and pull request updated events.
  /// <note>
  /// Types <code>PULL_REQUEST_REOPENED</code> and
  /// <code>WORKFLOW_JOB_QUEUED</code> work with GitHub and GitHub Enterprise
  /// only. Types <code>RELEASED</code> and <code>PRERELEASED</code> work with
  /// GitHub only.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// ACTOR_ACCOUNT_ID
  ///
  /// <ul>
  /// <li>
  /// A webhook event triggers a build when a GitHub, GitHub Enterprise, or
  /// Bitbucket account ID matches the regular expression <code>pattern</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// HEAD_REF
  ///
  /// <ul>
  /// <li>
  /// A webhook event triggers a build when the head reference matches the regular
  /// expression <code>pattern</code>. For example,
  /// <code>refs/heads/branch-name</code> and <code>refs/tags/tag-name</code>.
  /// <note>
  /// Works with GitHub and GitHub Enterprise push, GitHub and GitHub Enterprise
  /// pull request, Bitbucket push, and Bitbucket pull request events.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// BASE_REF
  ///
  /// <ul>
  /// <li>
  /// A webhook event triggers a build when the base reference matches the regular
  /// expression <code>pattern</code>. For example,
  /// <code>refs/heads/branch-name</code>.
  /// <note>
  /// Works with pull request events only.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// FILE_PATH
  ///
  /// <ul>
  /// <li>
  /// A webhook triggers a build when the path of a changed file matches the
  /// regular expression <code>pattern</code>.
  /// <note>
  /// Works with GitHub and Bitbucket events push and pull requests events. Also
  /// works with GitHub Enterprise push events, but does not work with GitHub
  /// Enterprise pull request events.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// COMMIT_MESSAGE
  ///
  /// <ul>
  /// <li>
  /// A webhook triggers a build when the head commit message matches the regular
  /// expression <code>pattern</code>.
  /// <note>
  /// Works with GitHub and Bitbucket events push and pull requests events. Also
  /// works with GitHub Enterprise push events, but does not work with GitHub
  /// Enterprise pull request events.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// TAG_NAME
  ///
  /// <ul>
  /// <li>
  /// A webhook triggers a build when the tag name of the release matches the
  /// regular expression <code>pattern</code>.
  /// <note>
  /// Works with <code>RELEASED</code> and <code>PRERELEASED</code> events only.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// RELEASE_NAME
  ///
  /// <ul>
  /// <li>
  /// A webhook triggers a build when the release name matches the regular
  /// expression <code>pattern</code>.
  /// <note>
  /// Works with <code>RELEASED</code> and <code>PRERELEASED</code> events only.
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// WORKFLOW_NAME
  ///
  /// <ul>
  /// <li>
  /// A webhook triggers a build when the workflow name matches the regular
  /// expression <code>pattern</code>.
  /// <note>
  /// Works with <code>WORKFLOW_JOB_QUEUED</code> events only.
  /// </note> </li>
  /// </ul> </li>
  /// </ul>
  final WebhookFilterType type;

  /// Used to indicate that the <code>pattern</code> determines which webhook
  /// events do not trigger a build. If true, then a webhook event that does not
  /// match the <code>pattern</code> triggers a build. If false, then a webhook
  /// event that matches the <code>pattern</code> triggers a build.
  final bool? excludeMatchedPattern;

  WebhookFilter({
    required this.pattern,
    required this.type,
    this.excludeMatchedPattern,
  });

  factory WebhookFilter.fromJson(Map<String, dynamic> json) {
    return WebhookFilter(
      pattern: json['pattern'] as String,
      type: (json['type'] as String).toWebhookFilterType(),
      excludeMatchedPattern: json['excludeMatchedPattern'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final pattern = this.pattern;
    final type = this.type;
    final excludeMatchedPattern = this.excludeMatchedPattern;
    return {
      'pattern': pattern,
      'type': type.toValue(),
      if (excludeMatchedPattern != null)
        'excludeMatchedPattern': excludeMatchedPattern,
    };
  }
}

enum WebhookFilterType {
  event,
  baseRef,
  headRef,
  actorAccountId,
  filePath,
  commitMessage,
  workflowName,
  tagName,
  releaseName,
}

extension WebhookFilterTypeValueExtension on WebhookFilterType {
  String toValue() {
    switch (this) {
      case WebhookFilterType.event:
        return 'EVENT';
      case WebhookFilterType.baseRef:
        return 'BASE_REF';
      case WebhookFilterType.headRef:
        return 'HEAD_REF';
      case WebhookFilterType.actorAccountId:
        return 'ACTOR_ACCOUNT_ID';
      case WebhookFilterType.filePath:
        return 'FILE_PATH';
      case WebhookFilterType.commitMessage:
        return 'COMMIT_MESSAGE';
      case WebhookFilterType.workflowName:
        return 'WORKFLOW_NAME';
      case WebhookFilterType.tagName:
        return 'TAG_NAME';
      case WebhookFilterType.releaseName:
        return 'RELEASE_NAME';
    }
  }
}

extension WebhookFilterTypeFromString on String {
  WebhookFilterType toWebhookFilterType() {
    switch (this) {
      case 'EVENT':
        return WebhookFilterType.event;
      case 'BASE_REF':
        return WebhookFilterType.baseRef;
      case 'HEAD_REF':
        return WebhookFilterType.headRef;
      case 'ACTOR_ACCOUNT_ID':
        return WebhookFilterType.actorAccountId;
      case 'FILE_PATH':
        return WebhookFilterType.filePath;
      case 'COMMIT_MESSAGE':
        return WebhookFilterType.commitMessage;
      case 'WORKFLOW_NAME':
        return WebhookFilterType.workflowName;
      case 'TAG_NAME':
        return WebhookFilterType.tagName;
      case 'RELEASE_NAME':
        return WebhookFilterType.releaseName;
    }
    throw Exception('$this is not known in enum WebhookFilterType');
  }
}

class AccountLimitExceededException extends _s.GenericAwsException {
  AccountLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountLimitExceededException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class OAuthProviderException extends _s.GenericAwsException {
  OAuthProviderException({String? type, String? message})
      : super(type: type, code: 'OAuthProviderException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccountLimitExceededException': (type, message) =>
      AccountLimitExceededException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'OAuthProviderException': (type, message) =>
      OAuthProviderException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
