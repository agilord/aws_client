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

part '2016-10-06.g.dart';

/// AWS CodeBuild is a fully managed build service in the cloud. AWS CodeBuild
/// compiles your source code, runs unit tests, and produces artifacts that are
/// ready to deploy. AWS CodeBuild eliminates the need to provision, manage, and
/// scale your own build servers. It provides prepackaged build environments for
/// the most popular programming languages and build tools, such as Apache
/// Maven, Gradle, and more. You can also fully customize build environments in
/// AWS CodeBuild to use your own build tools. AWS CodeBuild scales
/// automatically to meet peak build requests. You pay only for the build time
/// you consume. For more information about AWS CodeBuild, see the <i> <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html">AWS
/// CodeBuild User Guide</a>.</i>
class CodeBuild {
  final _s.JsonProtocol _protocol;
  CodeBuild({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codebuild',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes one or more builds.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [ids] :
  /// The IDs of the builds to delete.
  Future<BatchDeleteBuildsOutput> batchDeleteBuilds({
    @_s.required List<String> ids,
  }) async {
    ArgumentError.checkNotNull(ids, 'ids');
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
    @_s.required List<String> ids,
  }) async {
    ArgumentError.checkNotNull(ids, 'ids');
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
    @_s.required List<String> ids,
  }) async {
    ArgumentError.checkNotNull(ids, 'ids');
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

  /// Gets information about one or more build projects.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [names] :
  /// The names or ARNs of the build projects. To get information about a
  /// project shared with your AWS account, its ARN must be specified. You
  /// cannot specify a shared project using its name.
  Future<BatchGetProjectsOutput> batchGetProjects({
    @_s.required List<String> names,
  }) async {
    ArgumentError.checkNotNull(names, 'names');
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
    @_s.required List<String> reportGroupArns,
  }) async {
    ArgumentError.checkNotNull(reportGroupArns, 'reportGroupArns');
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
    @_s.required List<String> reportArns,
  }) async {
    ArgumentError.checkNotNull(reportArns, 'reportArns');
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
  /// The ARN of the AWS Identity and Access Management (IAM) role that enables
  /// AWS CodeBuild to interact with dependent AWS services on behalf of the AWS
  /// account.
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
  /// Parameter [description] :
  /// A description that makes the build project easy to identify.
  ///
  /// Parameter [encryptionKey] :
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
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
  /// Information about logs for the build project. These can be logs in Amazon
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
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs associated with this build project.
  ///
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild build project tags.
  ///
  /// Parameter [timeoutInMinutes] :
  /// How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// before it times out any build that has not been marked as completed. The
  /// default is 60 minutes.
  ///
  /// Parameter [vpcConfig] :
  /// VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.
  Future<CreateProjectOutput> createProject({
    @_s.required ProjectArtifacts artifacts,
    @_s.required ProjectEnvironment environment,
    @_s.required String name,
    @_s.required String serviceRole,
    @_s.required ProjectSource source,
    bool badgeEnabled,
    ProjectBuildBatchConfig buildBatchConfig,
    ProjectCache cache,
    String description,
    String encryptionKey,
    List<ProjectFileSystemLocation> fileSystemLocations,
    LogsConfig logsConfig,
    int queuedTimeoutInMinutes,
    List<ProjectArtifacts> secondaryArtifacts,
    List<ProjectSourceVersion> secondarySourceVersions,
    List<ProjectSource> secondarySources,
    String sourceVersion,
    List<Tag> tags,
    int timeoutInMinutes,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(artifacts, 'artifacts');
    ArgumentError.checkNotNull(environment, 'environment');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[A-Za-z0-9][A-Za-z0-9\-_]{1,254}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceRole, 'serviceRole');
    _s.validateStringLength(
      'serviceRole',
      serviceRole,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(source, 'source');
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
    );
    _s.validateStringLength(
      'encryptionKey',
      encryptionKey,
      1,
      1152921504606846976,
    );
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
      480,
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
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild report group tags.
  Future<CreateReportGroupOutput> createReportGroup({
    @_s.required ReportExportConfig exportConfig,
    @_s.required String name,
    @_s.required ReportType type,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(exportConfig, 'exportConfig');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
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
        'type': type?.toValue() ?? '',
        if (tags != null) 'tags': tags,
      },
    );

    return CreateReportGroupOutput.fromJson(jsonResponse.body);
  }

  /// For an existing AWS CodeBuild build project that has its source code
  /// stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start
  /// rebuilding the source code every time a code change is pushed to the
  /// repository.
  /// <important>
  /// If you enable webhooks for an AWS CodeBuild project, and the project is
  /// used as a build step in AWS CodePipeline, then two identical builds are
  /// created for each commit. One build is triggered through webhooks, and one
  /// through AWS CodePipeline. Because billing is on a per-build basis, you are
  /// billed for both builds. Therefore, if you are using AWS CodePipeline, we
  /// recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild
  /// console, clear the Webhook box. For more information, see step 5 in <a
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
  /// The name of the AWS CodeBuild project.
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
  Future<CreateWebhookOutput> createWebhook({
    @_s.required String projectName,
    String branchFilter,
    WebhookBuildType buildType,
    List<List<WebhookFilter>> filterGroups,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      2,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[A-Za-z0-9][A-Za-z0-9\-_]{1,254}''',
      isRequired: true,
    );
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// Deletes a build project. When you delete a project, its builds are not
  /// deleted.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [name] :
  /// The name of the build project.
  Future<void> deleteProject({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteProject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DeleteProjectOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a report.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the report to delete.
  Future<void> deleteReport({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteReport'
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

    return DeleteReportOutput.fromJson(jsonResponse.body);
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
    @_s.required String arn,
    bool deleteReports,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteReportGroup'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteReportGroupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a resource policy that is identified by its resource ARN.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that is associated with the resource policy.
  Future<void> deleteResourcePolicy({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteResourcePolicy'
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

    return DeleteResourcePolicyOutput.fromJson(jsonResponse.body);
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// For an existing AWS CodeBuild build project that has its source code
  /// stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from
  /// rebuilding the source code every time a code change is pushed to the
  /// repository.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OAuthProviderException].
  ///
  /// Parameter [projectName] :
  /// The name of the AWS CodeBuild project.
  Future<void> deleteWebhook({
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      2,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[A-Za-z0-9][A-Za-z0-9\-_]{1,254}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.DeleteWebhook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
      },
    );

    return DeleteWebhookOutput.fromJson(jsonResponse.body);
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
    @_s.required String reportArn,
    double maxLineCoveragePercentage,
    int maxResults,
    double minLineCoveragePercentage,
    String nextToken,
    ReportCodeCoverageSortByType sortBy,
    SortOrderType sortOrder,
  }) async {
    ArgumentError.checkNotNull(reportArn, 'reportArn');
    _s.validateStringLength(
      'reportArn',
      reportArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    @_s.required String reportArn,
    TestCaseFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(reportArn, 'reportArn');
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

  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  Future<GetReportGroupTrendOutput> getReportGroupTrend({
    @_s.required String reportGroupArn,
    @_s.required ReportGroupTrendFieldType trendField,
    int numOfReports,
  }) async {
    ArgumentError.checkNotNull(reportGroupArn, 'reportGroupArn');
    _s.validateStringLength(
      'reportGroupArn',
      reportGroupArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(trendField, 'trendField');
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
        'trendField': trendField?.toValue() ?? '',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// Imports the source repository credentials for an AWS CodeBuild project
  /// that has its source code stored in a GitHub, GitHub Enterprise, or
  /// Bitbucket repository.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AccountLimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [authType] :
  /// The type of authentication used to connect to a GitHub, GitHub Enterprise,
  /// or Bitbucket repository. An OAUTH connection is not supported by the API
  /// and must be created using the AWS CodeBuild console.
  ///
  /// Parameter [serverType] :
  /// The source provider used for this project.
  ///
  /// Parameter [token] :
  /// For GitHub or GitHub Enterprise, this is the personal access token. For
  /// Bitbucket, this is the app password.
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
    @_s.required AuthType authType,
    @_s.required ServerType serverType,
    @_s.required String token,
    bool shouldOverwrite,
    String username,
  }) async {
    ArgumentError.checkNotNull(authType, 'authType');
    ArgumentError.checkNotNull(serverType, 'serverType');
    ArgumentError.checkNotNull(token, 'token');
    _s.validateStringLength(
      'token',
      token,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'username',
      username,
      1,
      1152921504606846976,
    );
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
        'authType': authType?.toValue() ?? '',
        'serverType': serverType?.toValue() ?? '',
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
  /// The name of the AWS CodeBuild build project that the cache is reset for.
  Future<void> invalidateProjectCache({
    @_s.required String projectName,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodeBuild_20161006.InvalidateProjectCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'projectName': projectName,
      },
    );

    return InvalidateProjectCacheOutput.fromJson(jsonResponse.body);
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
    BuildBatchFilter filter,
    int maxResults,
    String nextToken,
    SortOrderType sortOrder,
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
    BuildBatchFilter filter,
    int maxResults,
    String nextToken,
    String projectName,
    SortOrderType sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      1152921504606846976,
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
    String nextToken,
    SortOrderType sortOrder,
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

  /// Gets a list of build IDs for the specified build project, with each build
  /// ID representing a single build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [projectName] :
  /// The name of the AWS CodeBuild project.
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
  Future<ListBuildsForProjectOutput> listBuildsForProject({
    @_s.required String projectName,
    String nextToken,
    SortOrderType sortOrder,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// Gets information about Docker images that are managed by AWS CodeBuild.
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
    String nextToken,
    ProjectSortByType sortBy,
    SortOrderType sortOrder,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
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

  /// Gets a list ARNs for the report groups in the current AWS account.
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
    int maxResults,
    String nextToken,
    ReportGroupSortByType sortBy,
    SortOrderType sortOrder,
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

  /// Returns a list of ARNs for the reports in the current AWS account.
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
    ReportFilter filter,
    int maxResults,
    String nextToken,
    SortOrderType sortOrder,
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
    @_s.required String reportGroupArn,
    ReportFilter filter,
    int maxResults,
    String nextToken,
    SortOrderType sortOrder,
  }) async {
    ArgumentError.checkNotNull(reportGroupArn, 'reportGroupArn');
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

  /// Gets a list of projects that are shared with other AWS accounts or users.
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
  /// AWS account or user. Valid values include:
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
    int maxResults,
    String nextToken,
    SharedResourceSortByType sortBy,
    SortOrderType sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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

  /// Gets a list of report groups that are shared with other AWS accounts or
  /// users.
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
  /// The criterion to be used to list report groups shared with the current AWS
  /// account or user. Valid values include:
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
    int maxResults,
    String nextToken,
    SharedResourceSortByType sortBy,
    SortOrderType sortOrder,
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
  /// a Report Group</a> in the <i>AWS CodeBuild User Guide</i>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the <code>Project</code> or <code>ReportGroup</code> resource
  /// you want to associate with a resource policy.
  Future<PutResourcePolicyOutput> putResourcePolicy({
    @_s.required String policy,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// a parameter, AWS CodeBuild returns a parameter mismatch error.
  Future<RetryBuildOutput> retryBuild({
    String id,
    String idempotencyToken,
  }) async {
    _s.validateStringLength(
      'id',
      id,
      1,
      1152921504606846976,
    );
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
  /// change a parameter, AWS CodeBuild returns a parameter mismatch error.
  ///
  /// Parameter [retryType] :
  /// Specifies the type of retry to perform.
  Future<RetryBuildBatchOutput> retryBuildBatch({
    String id,
    String idempotencyToken,
    RetryBuildBatchType retryType,
  }) async {
    _s.validateStringLength(
      'id',
      id,
      1,
      1152921504606846976,
    );
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

  /// Starts running a build.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccountLimitExceededException].
  ///
  /// Parameter [projectName] :
  /// The name of the AWS CodeBuild build project to start running a build.
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
  /// A buildspec file declaration that overrides, for this build only, the
  /// latest one already defined in the build project.
  ///
  /// If this value is set, it can be either an inline buildspec definition, the
  /// path to an alternate buildspec file relative to the value of the built-in
  /// <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3
  /// bucket. The bucket must be in the same AWS Region as the build project.
  /// Specify the buildspec file using its ARN (for example,
  /// <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this
  /// value is not provided or is set to an empty string, the source code must
  /// contain a buildspec file in its root directory. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec
  /// File Name and Storage Location</a>.
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
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) that
  /// overrides the one specified in the build project. The CMK key encrypts the
  /// build output artifacts.
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
  /// Parameter [gitCloneDepthOverride] :
  /// The user-defined depth of history, with a minimum value of 0, that
  /// overrides, for this build only, any previous depth of history defined in
  /// the build project.
  ///
  /// Parameter [gitSubmodulesConfigOverride] :
  /// Information about the Git submodules configuration for this build of an
  /// AWS CodeBuild build project.
  ///
  /// Parameter [idempotencyToken] :
  /// A unique, case sensitive identifier you provide to ensure the idempotency
  /// of the StartBuild request. The token is included in the StartBuild request
  /// and is valid for 5 minutes. If you repeat the StartBuild request with the
  /// same token, but change a parameter, AWS CodeBuild returns a parameter
  /// mismatch error.
  ///
  /// Parameter [imageOverride] :
  /// The name of an image for this build that overrides the one specified in
  /// the build project.
  ///
  /// Parameter [imagePullCredentialsTypeOverride] :
  /// The type of credentials AWS CodeBuild uses to pull images in your build.
  /// There are two valid values:
  /// <dl> <dt>CODEBUILD</dt> <dd>
  /// Specifies that AWS CodeBuild uses its own credentials. This requires that
  /// you modify your ECR repository policy to trust AWS CodeBuild's service
  /// principal.
  /// </dd> <dt>SERVICE_ROLE</dt> <dd>
  /// Specifies that AWS CodeBuild uses your build project's service role.
  /// </dd> </dl>
  /// When using a cross-account or private registry image, you must use
  /// <code>SERVICE_ROLE</code> credentials. When using an AWS CodeBuild curated
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
  /// than GitHub, GitHub Enterprise, or Bitbucket, an invalidInputException is
  /// thrown.
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
  /// BitBucket or GitHub.
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
  /// <dl> <dt>AWS CodeCommit</dt> <dd>
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
  /// </dd> <dt>Amazon Simple Storage Service (Amazon S3)</dt> <dd>
  /// The version ID of the object that represents the build input ZIP file to
  /// use.
  /// </dd> </dl>
  /// If <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  ///
  /// Parameter [timeoutInMinutesOverride] :
  /// The number of build timeout minutes, from 5 to 480 (8 hours), that
  /// overrides, for this build only, the latest setting already defined in the
  /// build project.
  Future<StartBuildOutput> startBuild({
    @_s.required String projectName,
    ProjectArtifacts artifactsOverride,
    BuildStatusConfig buildStatusConfigOverride,
    String buildspecOverride,
    ProjectCache cacheOverride,
    String certificateOverride,
    ComputeType computeTypeOverride,
    bool debugSessionEnabled,
    String encryptionKeyOverride,
    EnvironmentType environmentTypeOverride,
    List<EnvironmentVariable> environmentVariablesOverride,
    int gitCloneDepthOverride,
    GitSubmodulesConfig gitSubmodulesConfigOverride,
    String idempotencyToken,
    String imageOverride,
    ImagePullCredentialsType imagePullCredentialsTypeOverride,
    bool insecureSslOverride,
    LogsConfig logsConfigOverride,
    bool privilegedModeOverride,
    int queuedTimeoutInMinutesOverride,
    RegistryCredential registryCredentialOverride,
    bool reportBuildStatusOverride,
    List<ProjectArtifacts> secondaryArtifactsOverride,
    List<ProjectSource> secondarySourcesOverride,
    List<ProjectSourceVersion> secondarySourcesVersionOverride,
    String serviceRoleOverride,
    SourceAuth sourceAuthOverride,
    String sourceLocationOverride,
    SourceType sourceTypeOverride,
    String sourceVersion,
    int timeoutInMinutesOverride,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKeyOverride',
      encryptionKeyOverride,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'gitCloneDepthOverride',
      gitCloneDepthOverride,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'imageOverride',
      imageOverride,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'queuedTimeoutInMinutesOverride',
      queuedTimeoutInMinutesOverride,
      5,
      480,
    );
    _s.validateStringLength(
      'serviceRoleOverride',
      serviceRoleOverride,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeoutInMinutesOverride',
      timeoutInMinutesOverride,
      5,
      480,
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
  /// bucket. The bucket must be in the same AWS Region as the build project.
  /// Specify the buildspec file using its ARN (for example,
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
  /// Parameter [encryptionKeyOverride] :
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) that
  /// overrides the one specified in the batch build project. The CMK key
  /// encrypts the build output artifacts.
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
  /// change a parameter, AWS CodeBuild returns a parameter mismatch error.
  ///
  /// Parameter [imageOverride] :
  /// The name of an image for this batch build that overrides the one specified
  /// in the batch build project.
  ///
  /// Parameter [imagePullCredentialsTypeOverride] :
  /// The type of credentials AWS CodeBuild uses to pull images in your batch
  /// build. There are two valid values:
  /// <dl> <dt>CODEBUILD</dt> <dd>
  /// Specifies that AWS CodeBuild uses its own credentials. This requires that
  /// you modify your ECR repository policy to trust AWS CodeBuild's service
  /// principal.
  /// </dd> <dt>SERVICE_ROLE</dt> <dd>
  /// Specifies that AWS CodeBuild uses your build project's service role.
  /// </dd> </dl>
  /// When using a cross-account or private registry image, you must use
  /// <code>SERVICE_ROLE</code> credentials. When using an AWS CodeBuild curated
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
  /// <dl> <dt>AWS CodeCommit</dt> <dd>
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
  /// </dd> <dt>Amazon Simple Storage Service (Amazon S3)</dt> <dd>
  /// The version ID of the object that represents the build input ZIP file to
  /// use.
  /// </dd> </dl>
  /// If <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  Future<StartBuildBatchOutput> startBuildBatch({
    @_s.required String projectName,
    ProjectArtifacts artifactsOverride,
    ProjectBuildBatchConfig buildBatchConfigOverride,
    int buildTimeoutInMinutesOverride,
    String buildspecOverride,
    ProjectCache cacheOverride,
    String certificateOverride,
    ComputeType computeTypeOverride,
    String encryptionKeyOverride,
    EnvironmentType environmentTypeOverride,
    List<EnvironmentVariable> environmentVariablesOverride,
    int gitCloneDepthOverride,
    GitSubmodulesConfig gitSubmodulesConfigOverride,
    String idempotencyToken,
    String imageOverride,
    ImagePullCredentialsType imagePullCredentialsTypeOverride,
    bool insecureSslOverride,
    LogsConfig logsConfigOverride,
    bool privilegedModeOverride,
    int queuedTimeoutInMinutesOverride,
    RegistryCredential registryCredentialOverride,
    bool reportBuildBatchStatusOverride,
    List<ProjectArtifacts> secondaryArtifactsOverride,
    List<ProjectSource> secondarySourcesOverride,
    List<ProjectSourceVersion> secondarySourcesVersionOverride,
    String serviceRoleOverride,
    SourceAuth sourceAuthOverride,
    String sourceLocationOverride,
    SourceType sourceTypeOverride,
    String sourceVersion,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'buildTimeoutInMinutesOverride',
      buildTimeoutInMinutesOverride,
      5,
      480,
    );
    _s.validateStringLength(
      'encryptionKeyOverride',
      encryptionKeyOverride,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'gitCloneDepthOverride',
      gitCloneDepthOverride,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'imageOverride',
      imageOverride,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'queuedTimeoutInMinutesOverride',
      queuedTimeoutInMinutesOverride,
      5,
      480,
    );
    _s.validateStringLength(
      'serviceRoleOverride',
      serviceRoleOverride,
      1,
      1152921504606846976,
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// Parameter [description] :
  /// A new or replacement description of the build project.
  ///
  /// Parameter [encryptionKey] :
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
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
  /// Amazon CloudWatch Logs, logs in an S3 bucket, or both.
  ///
  /// Parameter [queuedTimeoutInMinutes] :
  /// The number of minutes a build is allowed to be queued before it times out.
  ///
  /// Parameter [secondaryArtifacts] :
  /// An array of <code>ProjectSource</code> objects.
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
  /// The replacement ARN of the AWS Identity and Access Management (IAM) role
  /// that enables AWS CodeBuild to interact with dependent AWS services on
  /// behalf of the AWS account.
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
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  ///
  /// Parameter [tags] :
  /// An updated list of tag key and value pairs associated with this build
  /// project.
  ///
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild build project tags.
  ///
  /// Parameter [timeoutInMinutes] :
  /// The replacement value in minutes, from 5 to 480 (8 hours), for AWS
  /// CodeBuild to wait before timing out any related build that did not get
  /// marked as completed.
  ///
  /// Parameter [vpcConfig] :
  /// VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.
  Future<UpdateProjectOutput> updateProject({
    @_s.required String name,
    ProjectArtifacts artifacts,
    bool badgeEnabled,
    ProjectBuildBatchConfig buildBatchConfig,
    ProjectCache cache,
    String description,
    String encryptionKey,
    ProjectEnvironment environment,
    List<ProjectFileSystemLocation> fileSystemLocations,
    LogsConfig logsConfig,
    int queuedTimeoutInMinutes,
    List<ProjectArtifacts> secondaryArtifacts,
    List<ProjectSourceVersion> secondarySourceVersions,
    List<ProjectSource> secondarySources,
    String serviceRole,
    ProjectSource source,
    String sourceVersion,
    List<Tag> tags,
    int timeoutInMinutes,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
    );
    _s.validateStringLength(
      'encryptionKey',
      encryptionKey,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'queuedTimeoutInMinutes',
      queuedTimeoutInMinutes,
      5,
      480,
    );
    _s.validateStringLength(
      'serviceRole',
      serviceRole,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeoutInMinutes',
      timeoutInMinutes,
      5,
      480,
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
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild report group tags.
  Future<UpdateReportGroupOutput> updateReportGroup({
    @_s.required String arn,
    ReportExportConfig exportConfig,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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

  /// Updates the webhook associated with an AWS CodeBuild build project.
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
  /// The name of the AWS CodeBuild project.
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
    @_s.required String projectName,
    String branchFilter,
    WebhookBuildType buildType,
    List<List<WebhookFilter>> filterGroups,
    bool rotateSecret,
  }) async {
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      2,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'projectName',
      projectName,
      r'''[A-Za-z0-9][A-Za-z0-9\-_]{1,254}''',
      isRequired: true,
    );
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
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('BUILD_ID')
  buildId,
}

enum ArtifactPackaging {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ZIP')
  zip,
}

enum ArtifactsType {
  @_s.JsonValue('CODEPIPELINE')
  codepipeline,
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('NO_ARTIFACTS')
  noArtifacts,
}

enum AuthType {
  @_s.JsonValue('OAUTH')
  oauth,
  @_s.JsonValue('BASIC_AUTH')
  basicAuth,
  @_s.JsonValue('PERSONAL_ACCESS_TOKEN')
  personalAccessToken,
}

extension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.oauth:
        return 'OAUTH';
      case AuthType.basicAuth:
        return 'BASIC_AUTH';
      case AuthType.personalAccessToken:
        return 'PERSONAL_ACCESS_TOKEN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteBuildsOutput {
  /// The IDs of the builds that were successfully deleted.
  @_s.JsonKey(name: 'buildsDeleted')
  final List<String> buildsDeleted;

  /// Information about any builds that could not be successfully deleted.
  @_s.JsonKey(name: 'buildsNotDeleted')
  final List<BuildNotDeleted> buildsNotDeleted;

  BatchDeleteBuildsOutput({
    this.buildsDeleted,
    this.buildsNotDeleted,
  });
  factory BatchDeleteBuildsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteBuildsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetBuildBatchesOutput {
  /// An array of <code>BuildBatch</code> objects that represent the retrieved
  /// batch builds.
  @_s.JsonKey(name: 'buildBatches')
  final List<BuildBatch> buildBatches;

  /// An array that contains the identifiers of any batch builds that are not
  /// found.
  @_s.JsonKey(name: 'buildBatchesNotFound')
  final List<String> buildBatchesNotFound;

  BatchGetBuildBatchesOutput({
    this.buildBatches,
    this.buildBatchesNotFound,
  });
  factory BatchGetBuildBatchesOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetBuildBatchesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetBuildsOutput {
  /// Information about the requested builds.
  @_s.JsonKey(name: 'builds')
  final List<Build> builds;

  /// The IDs of builds for which information could not be found.
  @_s.JsonKey(name: 'buildsNotFound')
  final List<String> buildsNotFound;

  BatchGetBuildsOutput({
    this.builds,
    this.buildsNotFound,
  });
  factory BatchGetBuildsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetBuildsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetProjectsOutput {
  /// Information about the requested build projects.
  @_s.JsonKey(name: 'projects')
  final List<Project> projects;

  /// The names of build projects for which information could not be found.
  @_s.JsonKey(name: 'projectsNotFound')
  final List<String> projectsNotFound;

  BatchGetProjectsOutput({
    this.projects,
    this.projectsNotFound,
  });
  factory BatchGetProjectsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetProjectsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetReportGroupsOutput {
  /// The array of report groups returned by <code>BatchGetReportGroups</code>.
  @_s.JsonKey(name: 'reportGroups')
  final List<ReportGroup> reportGroups;

  /// An array of ARNs passed to <code>BatchGetReportGroups</code> that are not
  /// associated with a <code>ReportGroup</code>.
  @_s.JsonKey(name: 'reportGroupsNotFound')
  final List<String> reportGroupsNotFound;

  BatchGetReportGroupsOutput({
    this.reportGroups,
    this.reportGroupsNotFound,
  });
  factory BatchGetReportGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetReportGroupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetReportsOutput {
  /// The array of <code>Report</code> objects returned by
  /// <code>BatchGetReports</code>.
  @_s.JsonKey(name: 'reports')
  final List<Report> reports;

  /// An array of ARNs passed to <code>BatchGetReportGroups</code> that are not
  /// associated with a <code>Report</code>.
  @_s.JsonKey(name: 'reportsNotFound')
  final List<String> reportsNotFound;

  BatchGetReportsOutput({
    this.reports,
    this.reportsNotFound,
  });
  factory BatchGetReportsOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetReportsOutputFromJson(json);
}

/// Specifies restrictions for the batch build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchRestrictions {
  /// An array of strings that specify the compute types that are allowed for the
  /// batch build. See <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build
  /// environment compute types</a> in the <i>AWS CodeBuild User Guide</i> for
  /// these values.
  @_s.JsonKey(name: 'computeTypesAllowed')
  final List<String> computeTypesAllowed;

  /// Specifies the maximum number of builds allowed.
  @_s.JsonKey(name: 'maximumBuildsAllowed')
  final int maximumBuildsAllowed;

  BatchRestrictions({
    this.computeTypesAllowed,
    this.maximumBuildsAllowed,
  });
  factory BatchRestrictions.fromJson(Map<String, dynamic> json) =>
      _$BatchRestrictionsFromJson(json);

  Map<String, dynamic> toJson() => _$BatchRestrictionsToJson(this);
}

/// Information about a build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Build {
  /// The Amazon Resource Name (ARN) of the build.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Information about the output artifacts for the build.
  @_s.JsonKey(name: 'artifacts')
  final BuildArtifacts artifacts;

  /// The ARN of the batch build that this build is a member of, if applicable.
  @_s.JsonKey(name: 'buildBatchArn')
  final String buildBatchArn;

  /// Whether the build is complete. True if complete; otherwise, false.
  @_s.JsonKey(name: 'buildComplete')
  final bool buildComplete;

  /// The number of the build. For each project, the <code>buildNumber</code> of
  /// its first build is <code>1</code>. The <code>buildNumber</code> of each
  /// subsequent build is incremented by <code>1</code>. If a build is deleted,
  /// the <code>buildNumber</code> of other builds does not change.
  @_s.JsonKey(name: 'buildNumber')
  final int buildNumber;

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
  @_s.JsonKey(name: 'buildStatus')
  final StatusType buildStatus;

  /// Information about the cache for the build.
  @_s.JsonKey(name: 'cache')
  final ProjectCache cache;

  /// The current build phase.
  @_s.JsonKey(name: 'currentPhase')
  final String currentPhase;

  /// Contains information about the debug session for this build.
  @_s.JsonKey(name: 'debugSession')
  final DebugSession debugSession;

  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  @_s.JsonKey(name: 'encryptionKey')
  final String encryptionKey;

  /// When the build process ended, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Information about the build environment for this build.
  @_s.JsonKey(name: 'environment')
  final ProjectEnvironment environment;

  /// A list of exported environment variables for this build.
  @_s.JsonKey(name: 'exportedEnvironmentVariables')
  final List<ExportedEnvironmentVariable> exportedEnvironmentVariables;

  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  @_s.JsonKey(name: 'fileSystemLocations')
  final List<ProjectFileSystemLocation> fileSystemLocations;

  /// The unique ID for the build.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The entity that started the build. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// If AWS CodePipeline started the build, the pipeline's name (for example,
  /// <code>codepipeline/my-demo-pipeline</code>).
  /// </li>
  /// <li>
  /// If an AWS Identity and Access Management (IAM) user started the build, the
  /// user's name (for example, <code>MyUserName</code>).
  /// </li>
  /// <li>
  /// If the Jenkins plugin for AWS CodeBuild started the build, the string
  /// <code>CodeBuild-Jenkins-Plugin</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'initiator')
  final String initiator;

  /// Information about the build's logs in Amazon CloudWatch Logs.
  @_s.JsonKey(name: 'logs')
  final LogsLocation logs;

  /// Describes a network interface.
  @_s.JsonKey(name: 'networkInterface')
  final NetworkInterface networkInterface;

  /// Information about all previous build phases that are complete and
  /// information about any current build phase that is not yet complete.
  @_s.JsonKey(name: 'phases')
  final List<BuildPhase> phases;

  /// The name of the AWS CodeBuild project.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// The number of minutes a build is allowed to be queued before it times out.
  @_s.JsonKey(name: 'queuedTimeoutInMinutes')
  final int queuedTimeoutInMinutes;

  /// An array of the ARNs associated with this build's reports.
  @_s.JsonKey(name: 'reportArns')
  final List<String> reportArns;

  /// An identifier for the version of this build's source code.
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID.
  /// </li>
  /// <li>
  /// For AWS CodePipeline, the source revision provided by AWS CodePipeline.
  /// </li>
  /// <li>
  /// For Amazon Simple Storage Service (Amazon S3), this does not apply.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'resolvedSourceVersion')
  final String resolvedSourceVersion;

  /// An array of <code>ProjectArtifacts</code> objects.
  @_s.JsonKey(name: 'secondaryArtifacts')
  final List<BuildArtifacts> secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. Each
  /// <code>ProjectSourceVersion</code> must be one of:
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the object
  /// that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'secondarySourceVersions')
  final List<ProjectSourceVersion> secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects.
  @_s.JsonKey(name: 'secondarySources')
  final List<ProjectSource> secondarySources;

  /// The name of a service role used for this build.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// Information about the source code to be built.
  @_s.JsonKey(name: 'source')
  final ProjectSource source;

  /// Any version identifier for the version of the source code to be built. If
  /// <code>sourceVersion</code> is specified at the project level, then this
  /// <code>sourceVersion</code> (at the build level) takes precedence.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  @_s.JsonKey(name: 'sourceVersion')
  final String sourceVersion;

  /// When the build process started, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// How long, in minutes, for AWS CodeBuild to wait before timing out this build
  /// if it does not get marked as completed.
  @_s.JsonKey(name: 'timeoutInMinutes')
  final int timeoutInMinutes;

  /// If your AWS CodeBuild project accesses resources in an Amazon VPC, you
  /// provide this parameter that identifies the VPC ID and the list of security
  /// group IDs and subnet IDs. The security groups and subnets must belong to the
  /// same VPC. You must provide at least one security group and one subnet ID.
  @_s.JsonKey(name: 'vpcConfig')
  final VpcConfig vpcConfig;

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
  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);
}

/// Information about build output artifacts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildArtifacts {
  /// An identifier for this artifact definition.
  @_s.JsonKey(name: 'artifactIdentifier')
  final String artifactIdentifier;

  /// Information that tells you if encryption for build artifacts is disabled.
  @_s.JsonKey(name: 'encryptionDisabled')
  final bool encryptionDisabled;

  /// Information about the location of the build artifacts.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The MD5 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  /// <note>
  /// This value is available only if the build project's <code>packaging</code>
  /// value is set to <code>ZIP</code>.
  /// </note>
  @_s.JsonKey(name: 'md5sum')
  final String md5sum;

  /// If this flag is set, a name specified in the buildspec file overrides the
  /// artifact name. The name specified in a buildspec file is calculated at build
  /// time and uses the Shell Command Language. For example, you can append a date
  /// and time to your artifact name so that it is always unique.
  @_s.JsonKey(name: 'overrideArtifactName')
  final bool overrideArtifactName;

  /// The SHA-256 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  /// <note>
  /// This value is available only if the build project's <code>packaging</code>
  /// value is set to <code>ZIP</code>.
  /// </note>
  @_s.JsonKey(name: 'sha256sum')
  final String sha256sum;

  BuildArtifacts({
    this.artifactIdentifier,
    this.encryptionDisabled,
    this.location,
    this.md5sum,
    this.overrideArtifactName,
    this.sha256sum,
  });
  factory BuildArtifacts.fromJson(Map<String, dynamic> json) =>
      _$BuildArtifactsFromJson(json);
}

/// Contains information about a batch build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildBatch {
  /// The ARN of the batch build.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A <code>BuildArtifacts</code> object the defines the build artifacts for
  /// this batch build.
  @_s.JsonKey(name: 'artifacts')
  final BuildArtifacts artifacts;
  @_s.JsonKey(name: 'buildBatchConfig')
  final ProjectBuildBatchConfig buildBatchConfig;

  /// The number of the batch build. For each project, the
  /// <code>buildBatchNumber</code> of its first batch build is <code>1</code>.
  /// The <code>buildBatchNumber</code> of each subsequent batch build is
  /// incremented by <code>1</code>. If a batch build is deleted, the
  /// <code>buildBatchNumber</code> of other batch builds does not change.
  @_s.JsonKey(name: 'buildBatchNumber')
  final int buildBatchNumber;

  /// The status of the batch build.
  @_s.JsonKey(name: 'buildBatchStatus')
  final StatusType buildBatchStatus;

  /// An array of <code>BuildGroup</code> objects that define the build groups for
  /// the batch build.
  @_s.JsonKey(name: 'buildGroups')
  final List<BuildGroup> buildGroups;

  /// Specifies the maximum amount of time, in minutes, that the build in a batch
  /// must be completed in.
  @_s.JsonKey(name: 'buildTimeoutInMinutes')
  final int buildTimeoutInMinutes;
  @_s.JsonKey(name: 'cache')
  final ProjectCache cache;

  /// Indicates if the batch build is complete.
  @_s.JsonKey(name: 'complete')
  final bool complete;

  /// The current phase of the batch build.
  @_s.JsonKey(name: 'currentPhase')
  final String currentPhase;

  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the batch build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  @_s.JsonKey(name: 'encryptionKey')
  final String encryptionKey;

  /// The date and time that the batch build ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;
  @_s.JsonKey(name: 'environment')
  final ProjectEnvironment environment;

  /// An array of <code>ProjectFileSystemLocation</code> objects for the batch
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  @_s.JsonKey(name: 'fileSystemLocations')
  final List<ProjectFileSystemLocation> fileSystemLocations;

  /// The identifier of the batch build.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The entity that started the batch build. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// If AWS CodePipeline started the build, the pipeline's name (for example,
  /// <code>codepipeline/my-demo-pipeline</code>).
  /// </li>
  /// <li>
  /// If an AWS Identity and Access Management (IAM) user started the build, the
  /// user's name.
  /// </li>
  /// <li>
  /// If the Jenkins plugin for AWS CodeBuild started the build, the string
  /// <code>CodeBuild-Jenkins-Plugin</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'initiator')
  final String initiator;
  @_s.JsonKey(name: 'logConfig')
  final LogsConfig logConfig;

  /// An array of <code>BuildBatchPhase</code> objects the specify the phases of
  /// the batch build.
  @_s.JsonKey(name: 'phases')
  final List<BuildBatchPhase> phases;

  /// The name of the batch build project.
  @_s.JsonKey(name: 'projectName')
  final String projectName;

  /// Specifies the amount of time, in minutes, that the batch build is allowed to
  /// be queued before it times out.
  @_s.JsonKey(name: 'queuedTimeoutInMinutes')
  final int queuedTimeoutInMinutes;

  /// The identifier of the resolved version of this batch build's source code.
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID.
  /// </li>
  /// <li>
  /// For AWS CodePipeline, the source revision provided by AWS CodePipeline.
  /// </li>
  /// <li>
  /// For Amazon Simple Storage Service (Amazon S3), this does not apply.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'resolvedSourceVersion')
  final String resolvedSourceVersion;

  /// An array of <code>BuildArtifacts</code> objects the define the build
  /// artifacts for this batch build.
  @_s.JsonKey(name: 'secondaryArtifacts')
  final List<BuildArtifacts> secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. Each
  /// <code>ProjectSourceVersion</code> must be one of:
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the object
  /// that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'secondarySourceVersions')
  final List<ProjectSourceVersion> secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects that define the sources for
  /// the batch build.
  @_s.JsonKey(name: 'secondarySources')
  final List<ProjectSource> secondarySources;

  /// The name of a service role used for builds in the batch.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;
  @_s.JsonKey(name: 'source')
  final ProjectSource source;

  /// The identifier of the version of the source code to be built.
  @_s.JsonKey(name: 'sourceVersion')
  final String sourceVersion;

  /// The date and time that the batch build started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;
  @_s.JsonKey(name: 'vpcConfig')
  final VpcConfig vpcConfig;

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
  factory BuildBatch.fromJson(Map<String, dynamic> json) =>
      _$BuildBatchFromJson(json);
}

/// Specifies filters when retrieving batch builds.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BuildBatchFilter {
  /// The status of the batch builds to retrieve. Only batch builds that have this
  /// status will be retrieved.
  @_s.JsonKey(name: 'status')
  final StatusType status;

  BuildBatchFilter({
    this.status,
  });
  Map<String, dynamic> toJson() => _$BuildBatchFilterToJson(this);
}

/// Contains information about a stage for a batch build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildBatchPhase {
  /// Additional information about the batch build phase. Especially to help
  /// troubleshoot a failed btach build.
  @_s.JsonKey(name: 'contexts')
  final List<PhaseContext> contexts;

  /// How long, in seconds, between the starting and ending times of the batch
  /// build's phase.
  @_s.JsonKey(name: 'durationInSeconds')
  final int durationInSeconds;

  /// When the batch build phase ended, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The current status of the batch build phase. Valid values include:
  /// <dl> <dt>FAILED</dt> <dd>
  /// The build phase failed.
  /// </dd> <dt>FAULT</dt> <dd>
  /// The build phase faulted.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The build phase is still in progress.
  /// </dd> <dt>QUEUED</dt> <dd>
  /// The build has been submitted and is queued behind other submitted builds.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The build phase stopped.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The build phase succeeded.
  /// </dd> <dt>TIMED_OUT</dt> <dd>
  /// The build phase timed out.
  /// </dd> </dl>
  @_s.JsonKey(name: 'phaseStatus')
  final StatusType phaseStatus;

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
  @_s.JsonKey(name: 'phaseType')
  final BuildBatchPhaseType phaseType;

  /// When the batch build phase started, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  BuildBatchPhase({
    this.contexts,
    this.durationInSeconds,
    this.endTime,
    this.phaseStatus,
    this.phaseType,
    this.startTime,
  });
  factory BuildBatchPhase.fromJson(Map<String, dynamic> json) =>
      _$BuildBatchPhaseFromJson(json);
}

enum BuildBatchPhaseType {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('DOWNLOAD_BATCHSPEC')
  downloadBatchspec,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMBINE_ARTIFACTS')
  combineArtifacts,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOPPED')
  stopped,
}

/// Contains information about a batch build build group. Build groups are used
/// to combine builds that can run in parallel, while still being able to set
/// dependencies on other build groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildGroup {
  /// A <code>BuildSummary</code> object that contains a summary of the current
  /// build group.
  @_s.JsonKey(name: 'currentBuildSummary')
  final BuildSummary currentBuildSummary;

  /// An array of strings that contain the identifiers of the build groups that
  /// this build group depends on.
  @_s.JsonKey(name: 'dependsOn')
  final List<String> dependsOn;

  /// Contains the identifier of the build group.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// Specifies if failures in this build group can be ignored.
  @_s.JsonKey(name: 'ignoreFailure')
  final bool ignoreFailure;

  /// An array of <code>BuildSummary</code> objects that contain summaries of
  /// previous build groups.
  @_s.JsonKey(name: 'priorBuildSummaryList')
  final List<BuildSummary> priorBuildSummaryList;

  BuildGroup({
    this.currentBuildSummary,
    this.dependsOn,
    this.identifier,
    this.ignoreFailure,
    this.priorBuildSummaryList,
  });
  factory BuildGroup.fromJson(Map<String, dynamic> json) =>
      _$BuildGroupFromJson(json);
}

/// Information about a build that could not be successfully deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildNotDeleted {
  /// The ID of the build that could not be successfully deleted.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Additional information about the build that could not be successfully
  /// deleted.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  BuildNotDeleted({
    this.id,
    this.statusCode,
  });
  factory BuildNotDeleted.fromJson(Map<String, dynamic> json) =>
      _$BuildNotDeletedFromJson(json);
}

/// Information about a stage for a build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildPhase {
  /// Additional information about a build phase, especially to help troubleshoot
  /// a failed build.
  @_s.JsonKey(name: 'contexts')
  final List<PhaseContext> contexts;

  /// How long, in seconds, between the starting and ending times of the build's
  /// phase.
  @_s.JsonKey(name: 'durationInSeconds')
  final int durationInSeconds;

  /// When the build phase ended, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The current status of the build phase. Valid values include:
  /// <dl> <dt>FAILED</dt> <dd>
  /// The build phase failed.
  /// </dd> <dt>FAULT</dt> <dd>
  /// The build phase faulted.
  /// </dd> <dt>IN_PROGRESS</dt> <dd>
  /// The build phase is still in progress.
  /// </dd> <dt>QUEUED</dt> <dd>
  /// The build has been submitted and is queued behind other submitted builds.
  /// </dd> <dt>STOPPED</dt> <dd>
  /// The build phase stopped.
  /// </dd> <dt>SUCCEEDED</dt> <dd>
  /// The build phase succeeded.
  /// </dd> <dt>TIMED_OUT</dt> <dd>
  /// The build phase timed out.
  /// </dd> </dl>
  @_s.JsonKey(name: 'phaseStatus')
  final StatusType phaseStatus;

  /// The name of the build phase. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BUILD</code>: Core build activities typically occur in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>: The build has been completed.
  /// </li>
  /// <li>
  /// <code>DOWNLOAD_SOURCE</code>: Source code is being downloaded in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>FINALIZING</code>: The build process is completing in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>INSTALL</code>: Installation activities typically occur in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>POST_BUILD</code>: Post-build activities typically occur in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>PRE_BUILD</code>: Pre-build activities typically occur in this build
  /// phase.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: The build environment is being set up.
  /// </li>
  /// <li>
  /// <code>QUEUED</code>: The build has been submitted and is queued behind other
  /// submitted builds.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: The build has been submitted.
  /// </li>
  /// <li>
  /// <code>UPLOAD_ARTIFACTS</code>: Build output artifacts are being uploaded to
  /// the output location.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'phaseType')
  final BuildPhaseType phaseType;

  /// When the build phase started, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  BuildPhase({
    this.contexts,
    this.durationInSeconds,
    this.endTime,
    this.phaseStatus,
    this.phaseType,
    this.startTime,
  });
  factory BuildPhase.fromJson(Map<String, dynamic> json) =>
      _$BuildPhaseFromJson(json);
}

enum BuildPhaseType {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('DOWNLOAD_SOURCE')
  downloadSource,
  @_s.JsonValue('INSTALL')
  install,
  @_s.JsonValue('PRE_BUILD')
  preBuild,
  @_s.JsonValue('BUILD')
  build,
  @_s.JsonValue('POST_BUILD')
  postBuild,
  @_s.JsonValue('UPLOAD_ARTIFACTS')
  uploadArtifacts,
  @_s.JsonValue('FINALIZING')
  finalizing,
  @_s.JsonValue('COMPLETED')
  completed,
}

/// Contains information that defines how the AWS CodeBuild build project
/// reports the build status to the source provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'context')
  final String context;

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
  @_s.JsonKey(name: 'targetUrl')
  final String targetUrl;

  BuildStatusConfig({
    this.context,
    this.targetUrl,
  });
  factory BuildStatusConfig.fromJson(Map<String, dynamic> json) =>
      _$BuildStatusConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BuildStatusConfigToJson(this);
}

/// Contains summary information about a batch build group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BuildSummary {
  /// The batch build ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

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
  @_s.JsonKey(name: 'buildStatus')
  final StatusType buildStatus;

  /// A <code>ResolvedArtifact</code> object that represents the primary build
  /// artifacts for the build group.
  @_s.JsonKey(name: 'primaryArtifact')
  final ResolvedArtifact primaryArtifact;

  /// When the build was started, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'requestedOn')
  final DateTime requestedOn;

  /// An array of <code>ResolvedArtifact</code> objects that represents the
  /// secondary build artifacts for the build group.
  @_s.JsonKey(name: 'secondaryArtifacts')
  final List<ResolvedArtifact> secondaryArtifacts;

  BuildSummary({
    this.arn,
    this.buildStatus,
    this.primaryArtifact,
    this.requestedOn,
    this.secondaryArtifacts,
  });
  factory BuildSummary.fromJson(Map<String, dynamic> json) =>
      _$BuildSummaryFromJson(json);
}

enum CacheMode {
  @_s.JsonValue('LOCAL_DOCKER_LAYER_CACHE')
  localDockerLayerCache,
  @_s.JsonValue('LOCAL_SOURCE_CACHE')
  localSourceCache,
  @_s.JsonValue('LOCAL_CUSTOM_CACHE')
  localCustomCache,
}

enum CacheType {
  @_s.JsonValue('NO_CACHE')
  noCache,
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('LOCAL')
  local,
}

/// Information about Amazon CloudWatch Logs for a build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLogsConfig {
  /// The current status of the logs in Amazon CloudWatch Logs for a build
  /// project. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code>: Amazon CloudWatch Logs are enabled for this build
  /// project.
  /// </li>
  /// <li>
  /// <code>DISABLED</code>: Amazon CloudWatch Logs are not enabled for this build
  /// project.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final LogsConfigStatusType status;

  /// The group name of the logs in Amazon CloudWatch Logs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with Log Groups and Log Streams</a>.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  /// The prefix of the stream name of the Amazon CloudWatch Logs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working
  /// with Log Groups and Log Streams</a>.
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  CloudWatchLogsConfig({
    @_s.required this.status,
    this.groupName,
    this.streamName,
  });
  factory CloudWatchLogsConfig.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLogsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLogsConfigToJson(this);
}

/// Contains code coverage report information.
///
/// Line coverage measures how many statements your tests cover. A statement is
/// a single instruction, not including comments, conditionals, etc.
///
/// Branch coverage determines if your tests cover every possible branch of a
/// control structure, such as an <code>if</code> or <code>case</code>
/// statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeCoverage {
  /// The percentage of branches that are covered by your tests.
  @_s.JsonKey(name: 'branchCoveragePercentage')
  final double branchCoveragePercentage;

  /// The number of conditional branches that are covered by your tests.
  @_s.JsonKey(name: 'branchesCovered')
  final int branchesCovered;

  /// The number of conditional branches that are not covered by your tests.
  @_s.JsonKey(name: 'branchesMissed')
  final int branchesMissed;

  /// The date and time that the tests were run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expired')
  final DateTime expired;

  /// The path of the test report file.
  @_s.JsonKey(name: 'filePath')
  final String filePath;

  /// The identifier of the code coverage report.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The percentage of lines that are covered by your tests.
  @_s.JsonKey(name: 'lineCoveragePercentage')
  final double lineCoveragePercentage;

  /// The number of lines that are covered by your tests.
  @_s.JsonKey(name: 'linesCovered')
  final int linesCovered;

  /// The number of lines that are not covered by your tests.
  @_s.JsonKey(name: 'linesMissed')
  final int linesMissed;

  /// The ARN of the report.
  @_s.JsonKey(name: 'reportARN')
  final String reportARN;

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
  factory CodeCoverage.fromJson(Map<String, dynamic> json) =>
      _$CodeCoverageFromJson(json);
}

/// Contains a summary of a code coverage report.
///
/// Line coverage measures how many statements your tests cover. A statement is
/// a single instruction, not including comments, conditionals, etc.
///
/// Branch coverage determines if your tests cover every possible branch of a
/// control structure, such as an <code>if</code> or <code>case</code>
/// statement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeCoverageReportSummary {
  /// The percentage of branches that are covered by your tests.
  @_s.JsonKey(name: 'branchCoveragePercentage')
  final double branchCoveragePercentage;

  /// The number of conditional branches that are covered by your tests.
  @_s.JsonKey(name: 'branchesCovered')
  final int branchesCovered;

  /// The number of conditional branches that are not covered by your tests.
  @_s.JsonKey(name: 'branchesMissed')
  final int branchesMissed;

  /// The percentage of lines that are covered by your tests.
  @_s.JsonKey(name: 'lineCoveragePercentage')
  final double lineCoveragePercentage;

  /// The number of lines that are covered by your tests.
  @_s.JsonKey(name: 'linesCovered')
  final int linesCovered;

  /// The number of lines that are not covered by your tests.
  @_s.JsonKey(name: 'linesMissed')
  final int linesMissed;

  CodeCoverageReportSummary({
    this.branchCoveragePercentage,
    this.branchesCovered,
    this.branchesMissed,
    this.lineCoveragePercentage,
    this.linesCovered,
    this.linesMissed,
  });
  factory CodeCoverageReportSummary.fromJson(Map<String, dynamic> json) =>
      _$CodeCoverageReportSummaryFromJson(json);
}

enum ComputeType {
  @_s.JsonValue('BUILD_GENERAL1_SMALL')
  buildGeneral1Small,
  @_s.JsonValue('BUILD_GENERAL1_MEDIUM')
  buildGeneral1Medium,
  @_s.JsonValue('BUILD_GENERAL1_LARGE')
  buildGeneral1Large,
  @_s.JsonValue('BUILD_GENERAL1_2XLARGE')
  buildGeneral1_2xlarge,
}

extension on ComputeType {
  String toValue() {
    switch (this) {
      case ComputeType.buildGeneral1Small:
        return 'BUILD_GENERAL1_SMALL';
      case ComputeType.buildGeneral1Medium:
        return 'BUILD_GENERAL1_MEDIUM';
      case ComputeType.buildGeneral1Large:
        return 'BUILD_GENERAL1_LARGE';
      case ComputeType.buildGeneral1_2xlarge:
        return 'BUILD_GENERAL1_2XLARGE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectOutput {
  /// Information about the build project that was created.
  @_s.JsonKey(name: 'project')
  final Project project;

  CreateProjectOutput({
    this.project,
  });
  factory CreateProjectOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReportGroupOutput {
  /// Information about the report group that was created.
  @_s.JsonKey(name: 'reportGroup')
  final ReportGroup reportGroup;

  CreateReportGroupOutput({
    this.reportGroup,
  });
  factory CreateReportGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateReportGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWebhookOutput {
  /// Information about a webhook that connects repository events to a build
  /// project in AWS CodeBuild.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  CreateWebhookOutput({
    this.webhook,
  });
  factory CreateWebhookOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateWebhookOutputFromJson(json);
}

enum CredentialProviderType {
  @_s.JsonValue('SECRETS_MANAGER')
  secretsManager,
}

/// Contains information about the debug session for a build. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/codebuild/latest/userguide/session-manager.html">Viewing
/// a running build in Session Manager</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DebugSession {
  /// Specifies if session debugging is enabled for this build.
  @_s.JsonKey(name: 'sessionEnabled')
  final bool sessionEnabled;

  /// Contains the identifier of the Session Manager session used for the build.
  /// To work with the paused build, you open this session to examine, control,
  /// and resume the build.
  @_s.JsonKey(name: 'sessionTarget')
  final String sessionTarget;

  DebugSession({
    this.sessionEnabled,
    this.sessionTarget,
  });
  factory DebugSession.fromJson(Map<String, dynamic> json) =>
      _$DebugSessionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBuildBatchOutput {
  /// An array of strings that contain the identifiers of the builds that were
  /// deleted.
  @_s.JsonKey(name: 'buildsDeleted')
  final List<String> buildsDeleted;

  /// An array of <code>BuildNotDeleted</code> objects that specify the builds
  /// that could not be deleted.
  @_s.JsonKey(name: 'buildsNotDeleted')
  final List<BuildNotDeleted> buildsNotDeleted;

  /// The status code.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  DeleteBuildBatchOutput({
    this.buildsDeleted,
    this.buildsNotDeleted,
    this.statusCode,
  });
  factory DeleteBuildBatchOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBuildBatchOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectOutput {
  DeleteProjectOutput();
  factory DeleteProjectOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReportGroupOutput {
  DeleteReportGroupOutput();
  factory DeleteReportGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteReportGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReportOutput {
  DeleteReportOutput();
  factory DeleteReportOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteReportOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourcePolicyOutput {
  DeleteResourcePolicyOutput();
  factory DeleteResourcePolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSourceCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the token.
  @_s.JsonKey(name: 'arn')
  final String arn;

  DeleteSourceCredentialsOutput({
    this.arn,
  });
  factory DeleteSourceCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteSourceCredentialsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWebhookOutput {
  DeleteWebhookOutput();
  factory DeleteWebhookOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteWebhookOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCodeCoveragesOutput {
  /// An array of <code>CodeCoverage</code> objects that contain the results.
  @_s.JsonKey(name: 'codeCoverages')
  final List<CodeCoverage> codeCoverages;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>DescribeCodeCoverages</code> to retrieve the next
  /// set of items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeCodeCoveragesOutput({
    this.codeCoverages,
    this.nextToken,
  });
  factory DescribeCodeCoveragesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeCodeCoveragesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTestCasesOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The returned list of test cases.
  @_s.JsonKey(name: 'testCases')
  final List<TestCase> testCases;

  DescribeTestCasesOutput({
    this.nextToken,
    this.testCases,
  });
  factory DescribeTestCasesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTestCasesOutputFromJson(json);
}

/// Information about a Docker image that is managed by AWS CodeBuild.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentImage {
  /// The description of the Docker image.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the Docker image.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of environment image versions.
  @_s.JsonKey(name: 'versions')
  final List<String> versions;

  EnvironmentImage({
    this.description,
    this.name,
    this.versions,
  });
  factory EnvironmentImage.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentImageFromJson(json);
}

/// A set of Docker images that are related by programming language and are
/// managed by AWS CodeBuild.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentLanguage {
  /// The list of Docker images that are related by the specified programming
  /// language.
  @_s.JsonKey(name: 'images')
  final List<EnvironmentImage> images;

  /// The programming language for the Docker images.
  @_s.JsonKey(name: 'language')
  final LanguageType language;

  EnvironmentLanguage({
    this.images,
    this.language,
  });
  factory EnvironmentLanguage.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentLanguageFromJson(json);
}

/// A set of Docker images that are related by platform and are managed by AWS
/// CodeBuild.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentPlatform {
  /// The list of programming languages that are available for the specified
  /// platform.
  @_s.JsonKey(name: 'languages')
  final List<EnvironmentLanguage> languages;

  /// The platform's name.
  @_s.JsonKey(name: 'platform')
  final PlatformType platform;

  EnvironmentPlatform({
    this.languages,
    this.platform,
  });
  factory EnvironmentPlatform.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentPlatformFromJson(json);
}

enum EnvironmentType {
  @_s.JsonValue('WINDOWS_CONTAINER')
  windowsContainer,
  @_s.JsonValue('LINUX_CONTAINER')
  linuxContainer,
  @_s.JsonValue('LINUX_GPU_CONTAINER')
  linuxGpuContainer,
  @_s.JsonValue('ARM_CONTAINER')
  armContainer,
  @_s.JsonValue('WINDOWS_SERVER_2019_CONTAINER')
  windowsServer_2019Container,
}

extension on EnvironmentType {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an environment variable for a build project or a build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EnvironmentVariable {
  /// The name or key of the environment variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value of the environment variable.
  /// <important>
  /// We strongly discourage the use of <code>PLAINTEXT</code> environment
  /// variables to store sensitive values, especially AWS secret key IDs and
  /// secret access keys. <code>PLAINTEXT</code> environment variables can be
  /// displayed in plain text using the AWS CodeBuild console and the AWS Command
  /// Line Interface (AWS CLI). For sensitive values, we recommend you use an
  /// environment variable of type <code>PARAMETER_STORE</code> or
  /// <code>SECRETS_MANAGER</code>.
  /// </important>
  @_s.JsonKey(name: 'value')
  final String value;

  /// The type of environment variable. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>PARAMETER_STORE</code>: An environment variable stored in Amazon EC2
  /// Systems Manager Parameter Store. To learn how to specify a parameter store
  /// environment variable, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.parameter-store">env/parameter-store</a>
  /// in the <i>AWS CodeBuild User Guide</i>.
  /// </li>
  /// <li>
  /// <code>PLAINTEXT</code>: An environment variable in plain text format. This
  /// is the default value.
  /// </li>
  /// <li>
  /// <code>SECRETS_MANAGER</code>: An environment variable stored in AWS Secrets
  /// Manager. To learn how to specify a secrets manager environment variable, see
  /// <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.env.secrets-manager">env/secrets-manager</a>
  /// in the <i>AWS CodeBuild User Guide</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final EnvironmentVariableType type;

  EnvironmentVariable({
    @_s.required this.name,
    @_s.required this.value,
    this.type,
  });
  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentVariableFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentVariableToJson(this);
}

enum EnvironmentVariableType {
  @_s.JsonValue('PLAINTEXT')
  plaintext,
  @_s.JsonValue('PARAMETER_STORE')
  parameterStore,
  @_s.JsonValue('SECRETS_MANAGER')
  secretsManager,
}

/// Information about an exported environment variable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportedEnvironmentVariable {
  /// The name of this exported environment variable.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value assigned to this exported environment variable.
  /// <note>
  /// During a build, the value of a variable is available starting with the
  /// <code>install</code> phase. It can be updated between the start of the
  /// <code>install</code> phase and the end of the <code>post_build</code> phase.
  /// After the <code>post_build</code> phase ends, the value of exported
  /// variables cannot change.
  /// </note>
  @_s.JsonKey(name: 'value')
  final String value;

  ExportedEnvironmentVariable({
    this.name,
    this.value,
  });
  factory ExportedEnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      _$ExportedEnvironmentVariableFromJson(json);
}

enum FileSystemType {
  @_s.JsonValue('EFS')
  efs,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReportGroupTrendOutput {
  @_s.JsonKey(name: 'rawData')
  final List<ReportWithRawData> rawData;
  @_s.JsonKey(name: 'stats')
  final ReportGroupTrendStats stats;

  GetReportGroupTrendOutput({
    this.rawData,
    this.stats,
  });
  factory GetReportGroupTrendOutput.fromJson(Map<String, dynamic> json) =>
      _$GetReportGroupTrendOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourcePolicyOutput {
  /// The resource policy for the resource identified by the input ARN parameter.
  @_s.JsonKey(name: 'policy')
  final String policy;

  GetResourcePolicyOutput({
    this.policy,
  });
  factory GetResourcePolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyOutputFromJson(json);
}

/// Information about the Git submodules configuration for an AWS CodeBuild
/// build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GitSubmodulesConfig {
  /// Set to true to fetch Git submodules for your AWS CodeBuild build project.
  @_s.JsonKey(name: 'fetchSubmodules')
  final bool fetchSubmodules;

  GitSubmodulesConfig({
    @_s.required this.fetchSubmodules,
  });
  factory GitSubmodulesConfig.fromJson(Map<String, dynamic> json) =>
      _$GitSubmodulesConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GitSubmodulesConfigToJson(this);
}

enum ImagePullCredentialsType {
  @_s.JsonValue('CODEBUILD')
  codebuild,
  @_s.JsonValue('SERVICE_ROLE')
  serviceRole,
}

extension on ImagePullCredentialsType {
  String toValue() {
    switch (this) {
      case ImagePullCredentialsType.codebuild:
        return 'CODEBUILD';
      case ImagePullCredentialsType.serviceRole:
        return 'SERVICE_ROLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportSourceCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the token.
  @_s.JsonKey(name: 'arn')
  final String arn;

  ImportSourceCredentialsOutput({
    this.arn,
  });
  factory ImportSourceCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$ImportSourceCredentialsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidateProjectCacheOutput {
  InvalidateProjectCacheOutput();
  factory InvalidateProjectCacheOutput.fromJson(Map<String, dynamic> json) =>
      _$InvalidateProjectCacheOutputFromJson(json);
}

enum LanguageType {
  @_s.JsonValue('JAVA')
  java,
  @_s.JsonValue('PYTHON')
  python,
  @_s.JsonValue('NODE_JS')
  nodeJs,
  @_s.JsonValue('RUBY')
  ruby,
  @_s.JsonValue('GOLANG')
  golang,
  @_s.JsonValue('DOCKER')
  docker,
  @_s.JsonValue('ANDROID')
  android,
  @_s.JsonValue('DOTNET')
  dotnet,
  @_s.JsonValue('BASE')
  base,
  @_s.JsonValue('PHP')
  php,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBuildBatchesForProjectOutput {
  /// An array of strings that contains the batch build identifiers.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>ListBuildBatchesForProject</code> to retrieve the
  /// next set of items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBuildBatchesForProjectOutput({
    this.ids,
    this.nextToken,
  });
  factory ListBuildBatchesForProjectOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListBuildBatchesForProjectOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBuildBatchesOutput {
  /// An array of strings that contains the batch build identifiers.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to <code>ListBuildBatches</code> to retrieve the next set of
  /// items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBuildBatchesOutput({
    this.ids,
    this.nextToken,
  });
  factory ListBuildBatchesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBuildBatchesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBuildsForProjectOutput {
  /// A list of build IDs for the specified build project, with each build ID
  /// representing a single build.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBuildsForProjectOutput({
    this.ids,
    this.nextToken,
  });
  factory ListBuildsForProjectOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBuildsForProjectOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBuildsOutput {
  /// A list of build IDs, with each build ID representing a single build.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBuildsOutput({
    this.ids,
    this.nextToken,
  });
  factory ListBuildsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBuildsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCuratedEnvironmentImagesOutput {
  /// Information about supported platforms for Docker images that are managed by
  /// AWS CodeBuild.
  @_s.JsonKey(name: 'platforms')
  final List<EnvironmentPlatform> platforms;

  ListCuratedEnvironmentImagesOutput({
    this.platforms,
  });
  factory ListCuratedEnvironmentImagesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListCuratedEnvironmentImagesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsOutput {
  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a <i>nextToken</i>. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of build project names, with each build project name representing a
  /// single build project.
  @_s.JsonKey(name: 'projects')
  final List<String> projects;

  ListProjectsOutput({
    this.nextToken,
    this.projects,
  });
  factory ListProjectsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReportGroupsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of ARNs for the report groups in the current AWS account.
  @_s.JsonKey(name: 'reportGroups')
  final List<String> reportGroups;

  ListReportGroupsOutput({
    this.nextToken,
    this.reportGroups,
  });
  factory ListReportGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListReportGroupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReportsForReportGroupOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of report ARNs.
  @_s.JsonKey(name: 'reports')
  final List<String> reports;

  ListReportsForReportGroupOutput({
    this.nextToken,
    this.reports,
  });
  factory ListReportsForReportGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$ListReportsForReportGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReportsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of returned ARNs for the reports in the current AWS account.
  @_s.JsonKey(name: 'reports')
  final List<String> reports;

  ListReportsOutput({
    this.nextToken,
    this.reports,
  });
  factory ListReportsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListReportsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSharedProjectsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of ARNs for the build projects shared with the current AWS account
  /// or user.
  @_s.JsonKey(name: 'projects')
  final List<String> projects;

  ListSharedProjectsOutput({
    this.nextToken,
    this.projects,
  });
  factory ListSharedProjectsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSharedProjectsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSharedReportGroupsOutput {
  /// During a previous call, the maximum number of items that can be returned is
  /// the value specified in <code>maxResults</code>. If there more items in the
  /// list, then a unique string called a <i>nextToken</i> is returned. To get the
  /// next batch of items in the list, call this operation again, adding the next
  /// token to the call. To get all of the items in the list, keep calling this
  /// operation with each subsequent next token that is returned, until no more
  /// next tokens are returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of ARNs for the report groups shared with the current AWS account
  /// or user.
  @_s.JsonKey(name: 'reportGroups')
  final List<String> reportGroups;

  ListSharedReportGroupsOutput({
    this.nextToken,
    this.reportGroups,
  });
  factory ListSharedReportGroupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSharedReportGroupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSourceCredentialsOutput {
  /// A list of <code>SourceCredentialsInfo</code> objects. Each
  /// <code>SourceCredentialsInfo</code> object includes the authentication type,
  /// token ARN, and type of source provider for one set of credentials.
  @_s.JsonKey(name: 'sourceCredentialsInfos')
  final List<SourceCredentialsInfo> sourceCredentialsInfos;

  ListSourceCredentialsOutput({
    this.sourceCredentialsInfos,
  });
  factory ListSourceCredentialsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSourceCredentialsOutputFromJson(json);
}

/// Information about logs for a build project. These can be logs in Amazon
/// CloudWatch Logs, built in a specified S3 bucket, or both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogsConfig {
  /// Information about Amazon CloudWatch Logs for a build project. Amazon
  /// CloudWatch Logs are enabled by default.
  @_s.JsonKey(name: 'cloudWatchLogs')
  final CloudWatchLogsConfig cloudWatchLogs;

  /// Information about logs built to an S3 bucket for a build project. S3 logs
  /// are not enabled by default.
  @_s.JsonKey(name: 's3Logs')
  final S3LogsConfig s3Logs;

  LogsConfig({
    this.cloudWatchLogs,
    this.s3Logs,
  });
  factory LogsConfig.fromJson(Map<String, dynamic> json) =>
      _$LogsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LogsConfigToJson(this);
}

enum LogsConfigStatusType {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Information about build logs in Amazon CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogsLocation {
  /// Information about Amazon CloudWatch Logs for a build project.
  @_s.JsonKey(name: 'cloudWatchLogs')
  final CloudWatchLogsConfig cloudWatchLogs;

  /// The ARN of Amazon CloudWatch Logs for a build project. Its format is
  /// <code>arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:${LogStreamName}</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatchlogs.html#amazoncloudwatchlogs-resources-for-iam-policies">Resources
  /// Defined by Amazon CloudWatch Logs</a>.
  @_s.JsonKey(name: 'cloudWatchLogsArn')
  final String cloudWatchLogsArn;

  /// The URL to an individual build log in Amazon CloudWatch Logs.
  @_s.JsonKey(name: 'deepLink')
  final String deepLink;

  /// The name of the Amazon CloudWatch Logs group for the build logs.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  /// The URL to a build log in an S3 bucket.
  @_s.JsonKey(name: 's3DeepLink')
  final String s3DeepLink;

  /// Information about S3 logs for a build project.
  @_s.JsonKey(name: 's3Logs')
  final S3LogsConfig s3Logs;

  /// The ARN of S3 logs for a build project. Its format is
  /// <code>arn:${Partition}:s3:::${BucketName}/${ObjectName}</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html#amazons3-resources-for-iam-policies">Resources
  /// Defined by Amazon S3</a>.
  @_s.JsonKey(name: 's3LogsArn')
  final String s3LogsArn;

  /// The name of the Amazon CloudWatch Logs stream for the build logs.
  @_s.JsonKey(name: 'streamName')
  final String streamName;

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
  factory LogsLocation.fromJson(Map<String, dynamic> json) =>
      _$LogsLocationFromJson(json);
}

/// Describes a network interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// The ID of the network interface.
  @_s.JsonKey(name: 'networkInterfaceId')
  final String networkInterfaceId;

  /// The ID of the subnet.
  @_s.JsonKey(name: 'subnetId')
  final String subnetId;

  NetworkInterface({
    this.networkInterfaceId,
    this.subnetId,
  });
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

/// Additional information about a build phase that has an error. You can use
/// this information for troubleshooting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhaseContext {
  /// An explanation of the build phase's context. This might include a command ID
  /// and an exit code.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The status code for the context of the build phase.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  PhaseContext({
    this.message,
    this.statusCode,
  });
  factory PhaseContext.fromJson(Map<String, dynamic> json) =>
      _$PhaseContextFromJson(json);
}

enum PlatformType {
  @_s.JsonValue('DEBIAN')
  debian,
  @_s.JsonValue('AMAZON_LINUX')
  amazonLinux,
  @_s.JsonValue('UBUNTU')
  ubuntu,
  @_s.JsonValue('WINDOWS_SERVER')
  windowsServer,
}

/// Information about a build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Project {
  /// The Amazon Resource Name (ARN) of the build project.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Information about the build output artifacts for the build project.
  @_s.JsonKey(name: 'artifacts')
  final ProjectArtifacts artifacts;

  /// Information about the build badge for the build project.
  @_s.JsonKey(name: 'badge')
  final ProjectBadge badge;

  /// A <a>ProjectBuildBatchConfig</a> object that defines the batch build options
  /// for the project.
  @_s.JsonKey(name: 'buildBatchConfig')
  final ProjectBuildBatchConfig buildBatchConfig;

  /// Information about the cache for the build project.
  @_s.JsonKey(name: 'cache')
  final ProjectCache cache;

  /// When the build project was created, expressed in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// A description that makes the build project easy to identify.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
  /// <note>
  /// You can use a cross-account KMS key to encrypt the build output artifacts if
  /// your service role has permission to that key.
  /// </note>
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format
  /// <code>alias/&lt;alias-name&gt;</code>).
  @_s.JsonKey(name: 'encryptionKey')
  final String encryptionKey;

  /// Information about the build environment for this build project.
  @_s.JsonKey(name: 'environment')
  final ProjectEnvironment environment;

  /// An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild
  /// build project. A <code>ProjectFileSystemLocation</code> object specifies the
  /// <code>identifier</code>, <code>location</code>, <code>mountOptions</code>,
  /// <code>mountPoint</code>, and <code>type</code> of a file system created
  /// using Amazon Elastic File System.
  @_s.JsonKey(name: 'fileSystemLocations')
  final List<ProjectFileSystemLocation> fileSystemLocations;

  /// When the build project's settings were last modified, expressed in Unix time
  /// format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModified')
  final DateTime lastModified;

  /// Information about logs for the build project. A project can create logs in
  /// Amazon CloudWatch Logs, an S3 bucket, or both.
  @_s.JsonKey(name: 'logsConfig')
  final LogsConfig logsConfig;

  /// The name of the build project.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of minutes a build is allowed to be queued before it times out.
  @_s.JsonKey(name: 'queuedTimeoutInMinutes')
  final int queuedTimeoutInMinutes;

  /// An array of <code>ProjectArtifacts</code> objects.
  @_s.JsonKey(name: 'secondaryArtifacts')
  final List<ProjectArtifacts> secondaryArtifacts;

  /// An array of <code>ProjectSourceVersion</code> objects. If
  /// <code>secondarySourceVersions</code> is specified at the build level, then
  /// they take over these <code>secondarySourceVersions</code> (at the project
  /// level).
  @_s.JsonKey(name: 'secondarySourceVersions')
  final List<ProjectSourceVersion> secondarySourceVersions;

  /// An array of <code>ProjectSource</code> objects.
  @_s.JsonKey(name: 'secondarySources')
  final List<ProjectSource> secondarySources;

  /// The ARN of the AWS Identity and Access Management (IAM) role that enables
  /// AWS CodeBuild to interact with dependent AWS services on behalf of the AWS
  /// account.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// Information about the build input source code for this build project.
  @_s.JsonKey(name: 'source')
  final ProjectSource source;

  /// A version of the build input to be built for this project. If not specified,
  /// the latest version is used. If specified, it must be one of:
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Bitbucket: the commit ID, branch name, or tag name that corresponds to
  /// the version of the source code you want to build. If a branch name is
  /// specified, the branch's HEAD commit ID is used. If not specified, the
  /// default branch's HEAD commit ID is used.
  /// </li>
  /// <li>
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the object
  /// that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  /// If <code>sourceVersion</code> is specified at the build level, then that
  /// version takes precedence over this <code>sourceVersion</code> (at the
  /// project level).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  @_s.JsonKey(name: 'sourceVersion')
  final String sourceVersion;

  /// A list of tag key and value pairs associated with this build project.
  ///
  /// These tags are available for use by AWS services that support AWS CodeBuild
  /// build project tags.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// before timing out any related build that did not get marked as completed.
  /// The default is 60 minutes.
  @_s.JsonKey(name: 'timeoutInMinutes')
  final int timeoutInMinutes;

  /// Information about the VPC configuration that AWS CodeBuild accesses.
  @_s.JsonKey(name: 'vpcConfig')
  final VpcConfig vpcConfig;

  /// Information about a webhook that connects repository events to a build
  /// project in AWS CodeBuild.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  Project({
    this.arn,
    this.artifacts,
    this.badge,
    this.buildBatchConfig,
    this.cache,
    this.created,
    this.description,
    this.encryptionKey,
    this.environment,
    this.fileSystemLocations,
    this.lastModified,
    this.logsConfig,
    this.name,
    this.queuedTimeoutInMinutes,
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
  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

/// Information about the build output artifacts for the build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectArtifacts {
  /// The type of build output artifact. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CODEPIPELINE</code>: The build project has build output generated
  /// through AWS CodePipeline.
  /// <note>
  /// The <code>CODEPIPELINE</code> type is not supported for
  /// <code>secondaryArtifacts</code>.
  /// </note> </li>
  /// <li>
  /// <code>NO_ARTIFACTS</code>: The build project does not produce any build
  /// output.
  /// </li>
  /// <li>
  /// <code>S3</code>: The build project stores build output in Amazon Simple
  /// Storage Service (Amazon S3).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final ArtifactsType type;

  /// An identifier for this artifact definition.
  @_s.JsonKey(name: 'artifactIdentifier')
  final String artifactIdentifier;

  /// Set to true if you do not want your output artifacts encrypted. This option
  /// is valid only if your artifacts type is Amazon Simple Storage Service
  /// (Amazon S3). If this is set with another artifacts type, an
  /// invalidInputException is thrown.
  @_s.JsonKey(name: 'encryptionDisabled')
  final bool encryptionDisabled;

  /// Information about the build output artifact location:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline
  /// ignores this value if specified. This is because AWS CodePipeline manages
  /// its build output locations instead of AWS CodeBuild.
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
  @_s.JsonKey(name: 'location')
  final String location;

  /// Along with <code>path</code> and <code>namespaceType</code>, the pattern
  /// that AWS CodeBuild uses to name and store the output artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline
  /// ignores this value if specified. This is because AWS CodePipeline manages
  /// its build output names instead of AWS CodeBuild.
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
  @_s.JsonKey(name: 'name')
  final String name;

  /// Along with <code>path</code> and <code>name</code>, the pattern that AWS
  /// CodeBuild uses to determine the name and location to store the output
  /// artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline
  /// ignores this value if specified. This is because AWS CodePipeline manages
  /// its build output names instead of AWS CodeBuild.
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
  @_s.JsonKey(name: 'namespaceType')
  final ArtifactNamespace namespaceType;

  /// If this flag is set, a name specified in the buildspec file overrides the
  /// artifact name. The name specified in a buildspec file is calculated at build
  /// time and uses the Shell Command Language. For example, you can append a date
  /// and time to your artifact name so that it is always unique.
  @_s.JsonKey(name: 'overrideArtifactName')
  final bool overrideArtifactName;

  /// The type of build output artifact to create:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline
  /// ignores this value if specified. This is because AWS CodePipeline manages
  /// its build output artifacts instead of AWS CodeBuild.
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
  /// <code>NONE</code>: AWS CodeBuild creates in the output bucket a folder that
  /// contains the build output. This is the default if <code>packaging</code> is
  /// not specified.
  /// </li>
  /// <li>
  /// <code>ZIP</code>: AWS CodeBuild creates in the output bucket a ZIP file that
  /// contains the build output.
  /// </li>
  /// </ul> </li>
  /// </ul>
  @_s.JsonKey(name: 'packaging')
  final ArtifactPackaging packaging;

  /// Along with <code>namespaceType</code> and <code>name</code>, the pattern
  /// that AWS CodeBuild uses to name and store the output artifact:
  ///
  /// <ul>
  /// <li>
  /// If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline
  /// ignores this value if specified. This is because AWS CodePipeline manages
  /// its build output names instead of AWS CodeBuild.
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
  @_s.JsonKey(name: 'path')
  final String path;

  ProjectArtifacts({
    @_s.required this.type,
    this.artifactIdentifier,
    this.encryptionDisabled,
    this.location,
    this.name,
    this.namespaceType,
    this.overrideArtifactName,
    this.packaging,
    this.path,
  });
  factory ProjectArtifacts.fromJson(Map<String, dynamic> json) =>
      _$ProjectArtifactsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectArtifactsToJson(this);
}

/// Information about the build badge for the build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectBadge {
  /// Set this to true to generate a publicly accessible URL for your project's
  /// build badge.
  @_s.JsonKey(name: 'badgeEnabled')
  final bool badgeEnabled;

  /// The publicly-accessible URL through which you can access the build badge for
  /// your project.
  ///
  /// The publicly accessible URL through which you can access the build badge for
  /// your project.
  @_s.JsonKey(name: 'badgeRequestUrl')
  final String badgeRequestUrl;

  ProjectBadge({
    this.badgeEnabled,
    this.badgeRequestUrl,
  });
  factory ProjectBadge.fromJson(Map<String, dynamic> json) =>
      _$ProjectBadgeFromJson(json);
}

/// Contains configuration information about a batch build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectBuildBatchConfig {
  /// Specifies if the build artifacts for the batch build should be combined into
  /// a single artifact location.
  @_s.JsonKey(name: 'combineArtifacts')
  final bool combineArtifacts;

  /// A <code>BatchRestrictions</code> object that specifies the restrictions for
  /// the batch build.
  @_s.JsonKey(name: 'restrictions')
  final BatchRestrictions restrictions;

  /// Specifies the service role ARN for the batch build project.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// Specifies the maximum amount of time, in minutes, that the batch build must
  /// be completed in.
  @_s.JsonKey(name: 'timeoutInMins')
  final int timeoutInMins;

  ProjectBuildBatchConfig({
    this.combineArtifacts,
    this.restrictions,
    this.serviceRole,
    this.timeoutInMins,
  });
  factory ProjectBuildBatchConfig.fromJson(Map<String, dynamic> json) =>
      _$ProjectBuildBatchConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectBuildBatchConfigToJson(this);
}

/// Information about the cache for the build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'type')
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
  @_s.JsonKey(name: 'location')
  final String location;

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
  @_s.JsonKey(name: 'modes')
  final List<CacheMode> modes;

  ProjectCache({
    @_s.required this.type,
    this.location,
    this.modes,
  });
  factory ProjectCache.fromJson(Map<String, dynamic> json) =>
      _$ProjectCacheFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCacheToJson(this);
}

/// Information about the build environment of the build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  /// <code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs, and
  /// 824 GB of SSD storage for builds. This compute type supports Docker images
  /// up to 100 GB uncompressed.
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
  /// Environment Compute Types</a> in the <i>AWS CodeBuild User Guide.</i>
  @_s.JsonKey(name: 'computeType')
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
  @_s.JsonKey(name: 'image')
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
  /// The environment type <code>LINUX_CONTAINER</code> with compute type
  /// <code>build.general1.2xlarge</code> is available only in regions US East (N.
  /// Virginia), US East (Ohio), US West (Oregon), Canada (Central), EU (Ireland),
  /// EU (London), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul),
  /// Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing), and China
  /// (Ningxia).
  /// </li>
  /// <li>
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (Ohio), US West (Oregon), Canada
  /// (Central), EU (Ireland), EU (London), EU (Frankfurt), Asia Pacific (Tokyo),
  /// Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney) ,
  /// China (Beijing), and China (Ningxia).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final EnvironmentType type;

  /// The ARN of the Amazon Simple Storage Service (Amazon S3) bucket, path
  /// prefix, and object key that contains the PEM-encoded certificate for the
  /// build project. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/create-project-cli.html#cli.environment.certificate">certificate</a>
  /// in the <i>AWS CodeBuild User Guide</i>.
  @_s.JsonKey(name: 'certificate')
  final String certificate;

  /// A set of environment variables to make available to builds for this build
  /// project.
  @_s.JsonKey(name: 'environmentVariables')
  final List<EnvironmentVariable> environmentVariables;

  /// The type of credentials AWS CodeBuild uses to pull images in your build.
  /// There are two valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CODEBUILD</code> specifies that AWS CodeBuild uses its own
  /// credentials. This requires that you modify your ECR repository policy to
  /// trust AWS CodeBuild's service principal.
  /// </li>
  /// <li>
  /// <code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build
  /// project's service role.
  /// </li>
  /// </ul>
  /// When you use a cross-account or private registry image, you must use
  /// SERVICE_ROLE credentials. When you use an AWS CodeBuild curated image, you
  /// must use CODEBUILD credentials.
  @_s.JsonKey(name: 'imagePullCredentialsType')
  final ImagePullCredentialsType imagePullCredentialsType;

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
  @_s.JsonKey(name: 'privilegedMode')
  final bool privilegedMode;

  /// The credentials for access to a private registry.
  @_s.JsonKey(name: 'registryCredential')
  final RegistryCredential registryCredential;

  ProjectEnvironment({
    @_s.required this.computeType,
    @_s.required this.image,
    @_s.required this.type,
    this.certificate,
    this.environmentVariables,
    this.imagePullCredentialsType,
    this.privilegedMode,
    this.registryCredential,
  });
  factory ProjectEnvironment.fromJson(Map<String, dynamic> json) =>
      _$ProjectEnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectEnvironmentToJson(this);
}

/// Information about a file system created by Amazon Elastic File System (EFS).
/// For more information, see <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html">What Is
/// Amazon Elastic File System?</a>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectFileSystemLocation {
  /// The name used to access a file system created by Amazon EFS. CodeBuild
  /// creates an environment variable by appending the <code>identifier</code> in
  /// all capital letters to <code>CODEBUILD_</code>. For example, if you specify
  /// <code>my_efs</code> for <code>identifier</code>, a new environment variable
  /// is create named <code>CODEBUILD_MY_EFS</code>.
  ///
  /// The <code>identifier</code> is used to mount your file system.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// A string that specifies the location of the file system created by Amazon
  /// EFS. Its format is <code>efs-dns-name:/directory-path</code>. You can find
  /// the DNS name of file system when you view it in the AWS EFS console. The
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
  @_s.JsonKey(name: 'location')
  final String location;

  /// The mount options for a file system created by AWS EFS. The default mount
  /// options used by CodeBuild are
  /// <code>nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-nfs-mount-settings.html">Recommended
  /// NFS Mount Options</a>.
  @_s.JsonKey(name: 'mountOptions')
  final String mountOptions;

  /// The location in the container where you mount the file system.
  @_s.JsonKey(name: 'mountPoint')
  final String mountPoint;

  /// The type of the file system. The one supported type is <code>EFS</code>.
  @_s.JsonKey(name: 'type')
  final FileSystemType type;

  ProjectFileSystemLocation({
    this.identifier,
    this.location,
    this.mountOptions,
    this.mountPoint,
    this.type,
  });
  factory ProjectFileSystemLocation.fromJson(Map<String, dynamic> json) =>
      _$ProjectFileSystemLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectFileSystemLocationToJson(this);
}

enum ProjectSortByType {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('CREATED_TIME')
  createdTime,
  @_s.JsonValue('LAST_MODIFIED_TIME')
  lastModifiedTime,
}

extension on ProjectSortByType {
  String toValue() {
    switch (this) {
      case ProjectSortByType.name:
        return 'NAME';
      case ProjectSortByType.createdTime:
        return 'CREATED_TIME';
      case ProjectSortByType.lastModifiedTime:
        return 'LAST_MODIFIED_TIME';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the build input source code for the build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectSource {
  /// The type of repository that contains the source code to be built. Valid
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BITBUCKET</code>: The source code is in a Bitbucket repository.
  /// </li>
  /// <li>
  /// <code>CODECOMMIT</code>: The source code is in an AWS CodeCommit repository.
  /// </li>
  /// <li>
  /// <code>CODEPIPELINE</code>: The source code settings are specified in the
  /// source action of a pipeline in AWS CodePipeline.
  /// </li>
  /// <li>
  /// <code>GITHUB</code>: The source code is in a GitHub or GitHub Enterprise
  /// Cloud repository.
  /// </li>
  /// <li>
  /// <code>GITHUB_ENTERPRISE</code>: The source code is in a GitHub Enterprise
  /// Server repository.
  /// </li>
  /// <li>
  /// <code>NO_SOURCE</code>: The project does not have input source code.
  /// </li>
  /// <li>
  /// <code>S3</code>: The source code is in an Amazon Simple Storage Service
  /// (Amazon S3) input bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final SourceType type;

  /// Information about the authorization settings for AWS CodeBuild to access the
  /// source code to be built.
  ///
  /// This information is for the AWS CodeBuild console's use only. Your code
  /// should not get or set this information directly.
  @_s.JsonKey(name: 'auth')
  final SourceAuth auth;

  /// Contains information that defines how the build project reports the build
  /// status to the source provider. This option is only used when the source
  /// provider is <code>GITHUB</code>, <code>GITHUB_ENTERPRISE</code>, or
  /// <code>BITBUCKET</code>.
  @_s.JsonKey(name: 'buildStatusConfig')
  final BuildStatusConfig buildStatusConfig;

  /// The buildspec file declaration to use for the builds in this build project.
  ///
  /// If this value is set, it can be either an inline buildspec definition, the
  /// path to an alternate buildspec file relative to the value of the built-in
  /// <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3
  /// bucket. The bucket must be in the same AWS Region as the build project.
  /// Specify the buildspec file using its ARN (for example,
  /// <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this value
  /// is not provided or is set to an empty string, the source code must contain a
  /// buildspec file in its root directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec
  /// File Name and Storage Location</a>.
  @_s.JsonKey(name: 'buildspec')
  final String buildspec;

  /// Information about the Git clone depth for the build project.
  @_s.JsonKey(name: 'gitCloneDepth')
  final int gitCloneDepth;

  /// Information about the Git submodules configuration for the build project.
  @_s.JsonKey(name: 'gitSubmodulesConfig')
  final GitSubmodulesConfig gitSubmodulesConfig;

  /// Enable this flag to ignore SSL warnings while connecting to the project
  /// source code.
  @_s.JsonKey(name: 'insecureSsl')
  final bool insecureSsl;

  /// Information about the location of the source code to be built. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// For source code settings that are specified in the source action of a
  /// pipeline in AWS CodePipeline, <code>location</code> should not be specified.
  /// If it is specified, AWS CodePipeline ignores it. This is because AWS
  /// CodePipeline uses the settings in a pipeline's source action instead of this
  /// value.
  /// </li>
  /// <li>
  /// For source code in an AWS CodeCommit repository, the HTTPS clone URL to the
  /// repository that contains the source code and the buildspec file (for
  /// example,
  /// <code>https://git-codecommit.&lt;region-ID&gt;.amazonaws.com/v1/repos/&lt;repo-name&gt;</code>).
  /// </li>
  /// <li>
  /// For source code in an Amazon Simple Storage Service (Amazon S3) input
  /// bucket, one of the following.
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
  /// your AWS account to your GitHub account. Use the AWS CodeBuild console to
  /// start creating a build project. When you use the console to connect (or
  /// reconnect) with GitHub, on the GitHub <b>Authorize application</b> page, for
  /// <b>Organization access</b>, choose <b>Request access</b> next to each
  /// repository you want to allow AWS CodeBuild to have access to, and then
  /// choose <b>Authorize application</b>. (After you have connected to your
  /// GitHub account, you do not need to finish creating the build project. You
  /// can leave the AWS CodeBuild console.) To instruct AWS CodeBuild to use this
  /// connection, in the <code>source</code> object, set the <code>auth</code>
  /// object's <code>type</code> value to <code>OAUTH</code>.
  /// </li>
  /// <li>
  /// For source code in a Bitbucket repository, the HTTPS clone URL to the
  /// repository that contains the source and the buildspec file. You must connect
  /// your AWS account to your Bitbucket account. Use the AWS CodeBuild console to
  /// start creating a build project. When you use the console to connect (or
  /// reconnect) with Bitbucket, on the Bitbucket <b>Confirm access to your
  /// account</b> page, choose <b>Grant access</b>. (After you have connected to
  /// your Bitbucket account, you do not need to finish creating the build
  /// project. You can leave the AWS CodeBuild console.) To instruct AWS CodeBuild
  /// to use this connection, in the <code>source</code> object, set the
  /// <code>auth</code> object's <code>type</code> value to <code>OAUTH</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'location')
  final String location;

  /// Set to true to report the status of a build's start and finish to your
  /// source provider. This option is valid only when your source provider is
  /// GitHub, GitHub Enterprise, or Bitbucket. If this is set and you use a
  /// different source provider, an invalidInputException is thrown.
  /// <note>
  /// The status of a build triggered by a webhook is always reported to your
  /// source provider.
  /// </note>
  @_s.JsonKey(name: 'reportBuildStatus')
  final bool reportBuildStatus;

  /// An identifier for this project source.
  @_s.JsonKey(name: 'sourceIdentifier')
  final String sourceIdentifier;

  ProjectSource({
    @_s.required this.type,
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
  factory ProjectSource.fromJson(Map<String, dynamic> json) =>
      _$ProjectSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSourceToJson(this);
}

/// A source identifier and its corresponding version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectSourceVersion {
  /// An identifier for a source in the build project.
  @_s.JsonKey(name: 'sourceIdentifier')
  final String sourceIdentifier;

  /// The source version for the corresponding source identifier. If specified,
  /// must be one of:
  ///
  /// <ul>
  /// <li>
  /// For AWS CodeCommit: the commit ID, branch, or Git tag to use.
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
  /// For Amazon Simple Storage Service (Amazon S3): the version ID of the object
  /// that represents the build input ZIP file to use.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source
  /// Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>.
  @_s.JsonKey(name: 'sourceVersion')
  final String sourceVersion;

  ProjectSourceVersion({
    @_s.required this.sourceIdentifier,
    @_s.required this.sourceVersion,
  });
  factory ProjectSourceVersion.fromJson(Map<String, dynamic> json) =>
      _$ProjectSourceVersionFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSourceVersionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourcePolicyOutput {
  /// The ARN of the <code>Project</code> or <code>ReportGroup</code> resource
  /// that is associated with a resource policy.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  PutResourcePolicyOutput({
    this.resourceArn,
  });
  factory PutResourcePolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyOutputFromJson(json);
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
/// Registry with AWS Secrets Manager Sample for AWS CodeBuild</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RegistryCredential {
  /// The Amazon Resource Name (ARN) or name of credentials created using AWS
  /// Secrets Manager.
  /// <note>
  /// The <code>credential</code> can use the name of the credentials only if they
  /// exist in your current AWS Region.
  /// </note>
  @_s.JsonKey(name: 'credential')
  final String credential;

  /// The service that created the credentials to access a private Docker
  /// registry. The valid value, SECRETS_MANAGER, is for AWS Secrets Manager.
  @_s.JsonKey(name: 'credentialProvider')
  final CredentialProviderType credentialProvider;

  RegistryCredential({
    @_s.required this.credential,
    @_s.required this.credentialProvider,
  });
  factory RegistryCredential.fromJson(Map<String, dynamic> json) =>
      _$RegistryCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$RegistryCredentialToJson(this);
}

/// Information about the results from running a series of test cases during the
/// run of a build project. The test cases are specified in the buildspec for
/// the build project using one or more paths to the test case files. You can
/// specify any type of tests you want, such as unit tests, integration tests,
/// and functional tests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Report {
  /// The ARN of the report run.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A <code>CodeCoverageReportSummary</code> object that contains a code
  /// coverage summary for this report.
  @_s.JsonKey(name: 'codeCoverageSummary')
  final CodeCoverageReportSummary codeCoverageSummary;

  /// The date and time this report run occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// The ARN of the build run that generated this report.
  @_s.JsonKey(name: 'executionId')
  final String executionId;

  /// The date and time a report expires. A report expires 30 days after it is
  /// created. An expired report is not available to view in CodeBuild.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expired')
  final DateTime expired;

  /// Information about where the raw data used to generate this report was
  /// exported.
  @_s.JsonKey(name: 'exportConfig')
  final ReportExportConfig exportConfig;

  /// The name of the report that was run.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the report group associated with this report.
  @_s.JsonKey(name: 'reportGroupArn')
  final String reportGroupArn;

  /// The status of this report.
  @_s.JsonKey(name: 'status')
  final ReportStatusType status;

  /// A <code>TestReportSummary</code> object that contains information about this
  /// test report.
  @_s.JsonKey(name: 'testSummary')
  final TestReportSummary testSummary;

  /// A boolean that specifies if this report run is truncated. The list of test
  /// cases is truncated after the maximum number of test cases is reached.
  @_s.JsonKey(name: 'truncated')
  final bool truncated;

  /// The type of the report that was run.
  /// <dl> <dt>CODE_COVERAGE</dt> <dd>
  /// A code coverage report.
  /// </dd> <dt>TEST</dt> <dd>
  /// A test report.
  /// </dd> </dl>
  @_s.JsonKey(name: 'type')
  final ReportType type;

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
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

enum ReportCodeCoverageSortByType {
  @_s.JsonValue('LINE_COVERAGE_PERCENTAGE')
  lineCoveragePercentage,
  @_s.JsonValue('FILE_PATH')
  filePath,
}

extension on ReportCodeCoverageSortByType {
  String toValue() {
    switch (this) {
      case ReportCodeCoverageSortByType.lineCoveragePercentage:
        return 'LINE_COVERAGE_PERCENTAGE';
      case ReportCodeCoverageSortByType.filePath:
        return 'FILE_PATH';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the location where the run of a report is exported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'exportConfigType')
  final ReportExportConfigType exportConfigType;

  /// A <code>S3ReportExportConfig</code> object that contains information about
  /// the S3 bucket where the run of a report is exported.
  @_s.JsonKey(name: 's3Destination')
  final S3ReportExportConfig s3Destination;

  ReportExportConfig({
    this.exportConfigType,
    this.s3Destination,
  });
  factory ReportExportConfig.fromJson(Map<String, dynamic> json) =>
      _$ReportExportConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ReportExportConfigToJson(this);
}

enum ReportExportConfigType {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('NO_EXPORT')
  noExport,
}

/// A filter used to return reports with the status specified by the input
/// <code>status</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReportFilter {
  /// The status used to filter reports. You can filter using one status only.
  @_s.JsonKey(name: 'status')
  final ReportStatusType status;

  ReportFilter({
    this.status,
  });
  Map<String, dynamic> toJson() => _$ReportFilterToJson(this);
}

/// A series of reports. Each report contains information about the results from
/// running a series of test cases. You specify the test cases for a report
/// group in the buildspec for a build project using one or more paths to the
/// test case files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportGroup {
  /// The ARN of a <code>ReportGroup</code>.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time this <code>ReportGroup</code> was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'created')
  final DateTime created;

  /// Information about the destination where the raw data of this
  /// <code>ReportGroup</code> is exported.
  @_s.JsonKey(name: 'exportConfig')
  final ReportExportConfig exportConfig;

  /// The date and time this <code>ReportGroup</code> was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModified')
  final DateTime lastModified;

  /// The name of a <code>ReportGroup</code>.
  @_s.JsonKey(name: 'name')
  final String name;
  @_s.JsonKey(name: 'status')
  final ReportGroupStatusType status;

  /// A list of tag key and value pairs associated with this report group.
  ///
  /// These tags are available for use by AWS services that support AWS CodeBuild
  /// report group tags.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The type of the <code>ReportGroup</code>. The one valid value is
  /// <code>TEST</code>.
  @_s.JsonKey(name: 'type')
  final ReportType type;

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
  factory ReportGroup.fromJson(Map<String, dynamic> json) =>
      _$ReportGroupFromJson(json);
}

enum ReportGroupSortByType {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('CREATED_TIME')
  createdTime,
  @_s.JsonValue('LAST_MODIFIED_TIME')
  lastModifiedTime,
}

extension on ReportGroupSortByType {
  String toValue() {
    switch (this) {
      case ReportGroupSortByType.name:
        return 'NAME';
      case ReportGroupSortByType.createdTime:
        return 'CREATED_TIME';
      case ReportGroupSortByType.lastModifiedTime:
        return 'LAST_MODIFIED_TIME';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReportGroupStatusType {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

enum ReportGroupTrendFieldType {
  @_s.JsonValue('PASS_RATE')
  passRate,
  @_s.JsonValue('DURATION')
  duration,
  @_s.JsonValue('TOTAL')
  total,
  @_s.JsonValue('LINE_COVERAGE')
  lineCoverage,
  @_s.JsonValue('LINES_COVERED')
  linesCovered,
  @_s.JsonValue('LINES_MISSED')
  linesMissed,
  @_s.JsonValue('BRANCH_COVERAGE')
  branchCoverage,
  @_s.JsonValue('BRANCHES_COVERED')
  branchesCovered,
  @_s.JsonValue('BRANCHES_MISSED')
  branchesMissed,
}

extension on ReportGroupTrendFieldType {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportGroupTrendStats {
  @_s.JsonKey(name: 'average')
  final String average;
  @_s.JsonKey(name: 'max')
  final String max;
  @_s.JsonKey(name: 'min')
  final String min;

  ReportGroupTrendStats({
    this.average,
    this.max,
    this.min,
  });
  factory ReportGroupTrendStats.fromJson(Map<String, dynamic> json) =>
      _$ReportGroupTrendStatsFromJson(json);
}

enum ReportPackagingType {
  @_s.JsonValue('ZIP')
  zip,
  @_s.JsonValue('NONE')
  none,
}

enum ReportStatusType {
  @_s.JsonValue('GENERATING')
  generating,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INCOMPLETE')
  incomplete,
  @_s.JsonValue('DELETING')
  deleting,
}

enum ReportType {
  @_s.JsonValue('TEST')
  test,
  @_s.JsonValue('CODE_COVERAGE')
  codeCoverage,
}

extension on ReportType {
  String toValue() {
    switch (this) {
      case ReportType.test:
        return 'TEST';
      case ReportType.codeCoverage:
        return 'CODE_COVERAGE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReportWithRawData {
  @_s.JsonKey(name: 'data')
  final String data;
  @_s.JsonKey(name: 'reportArn')
  final String reportArn;

  ReportWithRawData({
    this.data,
    this.reportArn,
  });
  factory ReportWithRawData.fromJson(Map<String, dynamic> json) =>
      _$ReportWithRawDataFromJson(json);
}

/// Represents a resolved build artifact. A resolve artifact is an artifact that
/// is built and deployed to the destination, such as Amazon Simple Storage
/// Service (Amazon S3).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolvedArtifact {
  /// The identifier of the artifact.
  @_s.JsonKey(name: 'identifier')
  final String identifier;

  /// The location of the artifact.
  @_s.JsonKey(name: 'location')
  final String location;

  /// Specifies the type of artifact.
  @_s.JsonKey(name: 'type')
  final ArtifactsType type;

  ResolvedArtifact({
    this.identifier,
    this.location,
    this.type,
  });
  factory ResolvedArtifact.fromJson(Map<String, dynamic> json) =>
      _$ResolvedArtifactFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetryBuildBatchOutput {
  @_s.JsonKey(name: 'buildBatch')
  final BuildBatch buildBatch;

  RetryBuildBatchOutput({
    this.buildBatch,
  });
  factory RetryBuildBatchOutput.fromJson(Map<String, dynamic> json) =>
      _$RetryBuildBatchOutputFromJson(json);
}

enum RetryBuildBatchType {
  @_s.JsonValue('RETRY_ALL_BUILDS')
  retryAllBuilds,
  @_s.JsonValue('RETRY_FAILED_BUILDS')
  retryFailedBuilds,
}

extension on RetryBuildBatchType {
  String toValue() {
    switch (this) {
      case RetryBuildBatchType.retryAllBuilds:
        return 'RETRY_ALL_BUILDS';
      case RetryBuildBatchType.retryFailedBuilds:
        return 'RETRY_FAILED_BUILDS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetryBuildOutput {
  @_s.JsonKey(name: 'build')
  final Build build;

  RetryBuildOutput({
    this.build,
  });
  factory RetryBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$RetryBuildOutputFromJson(json);
}

/// Information about S3 logs for a build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'status')
  final LogsConfigStatusType status;

  /// Set to true if you do not want your S3 build log output encrypted. By
  /// default S3 build logs are encrypted.
  @_s.JsonKey(name: 'encryptionDisabled')
  final bool encryptionDisabled;

  /// The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon S3
  /// bucket name is <code>my-bucket</code>, and your path prefix is
  /// <code>build-log</code>, then acceptable formats are
  /// <code>my-bucket/build-log</code> or
  /// <code>arn:aws:s3:::my-bucket/build-log</code>.
  @_s.JsonKey(name: 'location')
  final String location;

  S3LogsConfig({
    @_s.required this.status,
    this.encryptionDisabled,
    this.location,
  });
  factory S3LogsConfig.fromJson(Map<String, dynamic> json) =>
      _$S3LogsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3LogsConfigToJson(this);
}

/// Information about the S3 bucket where the raw data of a report are exported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3ReportExportConfig {
  /// The name of the S3 bucket where the raw data of a report are exported.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// A boolean value that specifies if the results of a report are encrypted.
  @_s.JsonKey(name: 'encryptionDisabled')
  final bool encryptionDisabled;

  /// The encryption key for the report's encrypted raw data.
  @_s.JsonKey(name: 'encryptionKey')
  final String encryptionKey;

  /// The type of build output artifact to create. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: AWS CodeBuild creates the raw data in the output bucket.
  /// This is the default if packaging is not specified.
  /// </li>
  /// <li>
  /// <code>ZIP</code>: AWS CodeBuild creates a ZIP file with the raw data in the
  /// output bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'packaging')
  final ReportPackagingType packaging;

  /// The path to the exported report's raw data results.
  @_s.JsonKey(name: 'path')
  final String path;

  S3ReportExportConfig({
    this.bucket,
    this.encryptionDisabled,
    this.encryptionKey,
    this.packaging,
    this.path,
  });
  factory S3ReportExportConfig.fromJson(Map<String, dynamic> json) =>
      _$S3ReportExportConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3ReportExportConfigToJson(this);
}

enum ServerType {
  @_s.JsonValue('GITHUB')
  github,
  @_s.JsonValue('BITBUCKET')
  bitbucket,
  @_s.JsonValue('GITHUB_ENTERPRISE')
  githubEnterprise,
}

extension on ServerType {
  String toValue() {
    switch (this) {
      case ServerType.github:
        return 'GITHUB';
      case ServerType.bitbucket:
        return 'BITBUCKET';
      case ServerType.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SharedResourceSortByType {
  @_s.JsonValue('ARN')
  arn,
  @_s.JsonValue('MODIFIED_TIME')
  modifiedTime,
}

extension on SharedResourceSortByType {
  String toValue() {
    switch (this) {
      case SharedResourceSortByType.arn:
        return 'ARN';
      case SharedResourceSortByType.modifiedTime:
        return 'MODIFIED_TIME';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SortOrderType {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on SortOrderType {
  String toValue() {
    switch (this) {
      case SortOrderType.ascending:
        return 'ASCENDING';
      case SortOrderType.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the authorization settings for AWS CodeBuild to access the
/// source code to be built.
///
/// This information is for the AWS CodeBuild console's use only. Your code
/// should not get or set this information directly.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceAuth {
  /// <note>
  /// This data type is deprecated and is no longer accurate or used.
  /// </note>
  /// The authorization type to use. The only valid value is <code>OAUTH</code>,
  /// which represents the OAuth authorization type.
  @_s.JsonKey(name: 'type')
  final SourceAuthType type;

  /// The resource value that applies to the specified authorization type.
  @_s.JsonKey(name: 'resource')
  final String resource;

  SourceAuth({
    @_s.required this.type,
    this.resource,
  });
  factory SourceAuth.fromJson(Map<String, dynamic> json) =>
      _$SourceAuthFromJson(json);

  Map<String, dynamic> toJson() => _$SourceAuthToJson(this);
}

enum SourceAuthType {
  @_s.JsonValue('OAUTH')
  oauth,
}

/// Information about the credentials for a GitHub, GitHub Enterprise, or
/// Bitbucket repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceCredentialsInfo {
  /// The Amazon Resource Name (ARN) of the token.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The type of authentication used by the credentials. Valid options are OAUTH,
  /// BASIC_AUTH, or PERSONAL_ACCESS_TOKEN.
  @_s.JsonKey(name: 'authType')
  final AuthType authType;

  /// The type of source provider. The valid options are GITHUB,
  /// GITHUB_ENTERPRISE, or BITBUCKET.
  @_s.JsonKey(name: 'serverType')
  final ServerType serverType;

  SourceCredentialsInfo({
    this.arn,
    this.authType,
    this.serverType,
  });
  factory SourceCredentialsInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceCredentialsInfoFromJson(json);
}

enum SourceType {
  @_s.JsonValue('CODECOMMIT')
  codecommit,
  @_s.JsonValue('CODEPIPELINE')
  codepipeline,
  @_s.JsonValue('GITHUB')
  github,
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('BITBUCKET')
  bitbucket,
  @_s.JsonValue('GITHUB_ENTERPRISE')
  githubEnterprise,
  @_s.JsonValue('NO_SOURCE')
  noSource,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.codecommit:
        return 'CODECOMMIT';
      case SourceType.codepipeline:
        return 'CODEPIPELINE';
      case SourceType.github:
        return 'GITHUB';
      case SourceType.s3:
        return 'S3';
      case SourceType.bitbucket:
        return 'BITBUCKET';
      case SourceType.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case SourceType.noSource:
        return 'NO_SOURCE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartBuildBatchOutput {
  /// A <code>BuildBatch</code> object that contains information about the batch
  /// build.
  @_s.JsonKey(name: 'buildBatch')
  final BuildBatch buildBatch;

  StartBuildBatchOutput({
    this.buildBatch,
  });
  factory StartBuildBatchOutput.fromJson(Map<String, dynamic> json) =>
      _$StartBuildBatchOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartBuildOutput {
  /// Information about the build to be run.
  @_s.JsonKey(name: 'build')
  final Build build;

  StartBuildOutput({
    this.build,
  });
  factory StartBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$StartBuildOutputFromJson(json);
}

enum StatusType {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('FAULT')
  fault,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('STOPPED')
  stopped,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopBuildBatchOutput {
  @_s.JsonKey(name: 'buildBatch')
  final BuildBatch buildBatch;

  StopBuildBatchOutput({
    this.buildBatch,
  });
  factory StopBuildBatchOutput.fromJson(Map<String, dynamic> json) =>
      _$StopBuildBatchOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopBuildOutput {
  /// Information about the build.
  @_s.JsonKey(name: 'build')
  final Build build;

  StopBuildOutput({
    this.build,
  });
  factory StopBuildOutput.fromJson(Map<String, dynamic> json) =>
      _$StopBuildOutputFromJson(json);
}

/// A tag, consisting of a key and a value.
///
/// This tag is available for use by AWS services that support tags in AWS
/// CodeBuild.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Information about a test case created using a framework such as NUnit or
/// Cucumber. A test case might be a unit test or a configuration test.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCase {
  /// The number of nanoseconds it took to run this test case.
  @_s.JsonKey(name: 'durationInNanoSeconds')
  final int durationInNanoSeconds;

  /// The date and time a test case expires. A test case expires 30 days after it
  /// is created. An expired test case is not available to view in CodeBuild.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expired')
  final DateTime expired;

  /// A message associated with a test case. For example, an error message or
  /// stack trace.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The name of the test case.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A string that is applied to a series of related test cases. CodeBuild
  /// generates the prefix. The prefix depends on the framework used to generate
  /// the tests.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  /// The ARN of the report to which the test case belongs.
  @_s.JsonKey(name: 'reportArn')
  final String reportArn;

  /// The status returned by the test case after it was run. Valid statuses are
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, <code>ERROR</code>,
  /// <code>SKIPPED</code>, and <code>UNKNOWN</code>.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The path to the raw data file that contains the test result.
  @_s.JsonKey(name: 'testRawDataPath')
  final String testRawDataPath;

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
  factory TestCase.fromJson(Map<String, dynamic> json) =>
      _$TestCaseFromJson(json);
}

/// A filter used to return specific types of test cases. In order to pass the
/// filter, the report must meet all of the filter properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TestCaseFilter {
  /// A keyword that is used to filter on the <code>name</code> or the
  /// <code>prefix</code> of the test cases. Only test cases where the keyword is
  /// a substring of the <code>name</code> or the <code>prefix</code> will be
  /// returned.
  @_s.JsonKey(name: 'keyword')
  final String keyword;

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
  @_s.JsonKey(name: 'status')
  final String status;

  TestCaseFilter({
    this.keyword,
    this.status,
  });
  Map<String, dynamic> toJson() => _$TestCaseFilterToJson(this);
}

/// Information about a test report.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestReportSummary {
  /// The number of nanoseconds it took to run all of the test cases in this
  /// report.
  @_s.JsonKey(name: 'durationInNanoSeconds')
  final int durationInNanoSeconds;

  /// A map that contains the number of each type of status returned by the test
  /// results in this <code>TestReportSummary</code>.
  @_s.JsonKey(name: 'statusCounts')
  final Map<String, int> statusCounts;

  /// The number of test cases in this <code>TestReportSummary</code>. The total
  /// includes truncated test cases.
  @_s.JsonKey(name: 'total')
  final int total;

  TestReportSummary({
    @_s.required this.durationInNanoSeconds,
    @_s.required this.statusCounts,
    @_s.required this.total,
  });
  factory TestReportSummary.fromJson(Map<String, dynamic> json) =>
      _$TestReportSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectOutput {
  /// Information about the build project that was changed.
  @_s.JsonKey(name: 'project')
  final Project project;

  UpdateProjectOutput({
    this.project,
  });
  factory UpdateProjectOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateReportGroupOutput {
  /// Information about the updated report group.
  @_s.JsonKey(name: 'reportGroup')
  final ReportGroup reportGroup;

  UpdateReportGroupOutput({
    this.reportGroup,
  });
  factory UpdateReportGroupOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportGroupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWebhookOutput {
  /// Information about a repository's webhook that is associated with a project
  /// in AWS CodeBuild.
  @_s.JsonKey(name: 'webhook')
  final Webhook webhook;

  UpdateWebhookOutput({
    this.webhook,
  });
  factory UpdateWebhookOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateWebhookOutputFromJson(json);
}

/// Information about the VPC configuration that AWS CodeBuild accesses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VpcConfig {
  /// A list of one or more security groups IDs in your Amazon VPC.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of one or more subnet IDs in your Amazon VPC.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// The ID of the Amazon VPC.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  VpcConfig({
    this.securityGroupIds,
    this.subnets,
    this.vpcId,
  });
  factory VpcConfig.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConfigToJson(this);
}

/// Information about a webhook that connects repository events to a build
/// project in AWS CodeBuild.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Webhook {
  /// A regular expression used to determine which repository branches are built
  /// when a webhook is triggered. If the name of a branch matches the regular
  /// expression, then it is built. If <code>branchFilter</code> is empty, then
  /// all branches are built.
  /// <note>
  /// It is recommended that you use <code>filterGroups</code> instead of
  /// <code>branchFilter</code>.
  /// </note>
  @_s.JsonKey(name: 'branchFilter')
  final String branchFilter;

  /// Specifies the type of build this webhook will trigger.
  @_s.JsonKey(name: 'buildType')
  final WebhookBuildType buildType;

  /// An array of arrays of <code>WebhookFilter</code> objects used to determine
  /// which webhooks are triggered. At least one <code>WebhookFilter</code> in the
  /// array must specify <code>EVENT</code> as its <code>type</code>.
  ///
  /// For a build to be triggered, at least one filter group in the
  /// <code>filterGroups</code> array must pass. For a filter group to pass, each
  /// of its filters must pass.
  @_s.JsonKey(name: 'filterGroups')
  final List<List<WebhookFilter>> filterGroups;

  /// A timestamp that indicates the last time a repository's secret token was
  /// modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedSecret')
  final DateTime lastModifiedSecret;

  /// The AWS CodeBuild endpoint where webhook events are sent.
  @_s.JsonKey(name: 'payloadUrl')
  final String payloadUrl;

  /// The secret token of the associated repository.
  /// <note>
  /// A Bitbucket webhook does not support <code>secret</code>.
  /// </note>
  @_s.JsonKey(name: 'secret')
  final String secret;

  /// The URL to the webhook.
  @_s.JsonKey(name: 'url')
  final String url;

  Webhook({
    this.branchFilter,
    this.buildType,
    this.filterGroups,
    this.lastModifiedSecret,
    this.payloadUrl,
    this.secret,
    this.url,
  });
  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);
}

enum WebhookBuildType {
  @_s.JsonValue('BUILD')
  build,
  @_s.JsonValue('BUILD_BATCH')
  buildBatch,
}

extension on WebhookBuildType {
  String toValue() {
    switch (this) {
      case WebhookBuildType.build:
        return 'BUILD';
      case WebhookBuildType.buildBatch:
        return 'BUILD_BATCH';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A filter used to determine which webhooks trigger a build.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'pattern')
  final String pattern;

  /// The type of webhook filter. There are six webhook filter types:
  /// <code>EVENT</code>, <code>ACTOR_ACCOUNT_ID</code>, <code>HEAD_REF</code>,
  /// <code>BASE_REF</code>, <code>FILE_PATH</code>, and
  /// <code>COMMIT_MESSAGE</code>.
  /// <dl> <dt> EVENT </dt> <dd>
  /// A webhook event triggers a build when the provided <code>pattern</code>
  /// matches one of five event types: <code>PUSH</code>,
  /// <code>PULL_REQUEST_CREATED</code>, <code>PULL_REQUEST_UPDATED</code>,
  /// <code>PULL_REQUEST_REOPENED</code>, and <code>PULL_REQUEST_MERGED</code>.
  /// The <code>EVENT</code> patterns are specified as a comma-separated string.
  /// For example, <code>PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED</code>
  /// filters all push, pull request created, and pull request updated events.
  /// <note>
  /// The <code>PULL_REQUEST_REOPENED</code> works with GitHub and GitHub
  /// Enterprise only.
  /// </note> </dd> <dt> ACTOR_ACCOUNT_ID </dt> <dd>
  /// A webhook event triggers a build when a GitHub, GitHub Enterprise, or
  /// Bitbucket account ID matches the regular expression <code>pattern</code>.
  /// </dd> <dt> HEAD_REF </dt> <dd>
  /// A webhook event triggers a build when the head reference matches the regular
  /// expression <code>pattern</code>. For example,
  /// <code>refs/heads/branch-name</code> and <code>refs/tags/tag-name</code>.
  ///
  /// Works with GitHub and GitHub Enterprise push, GitHub and GitHub Enterprise
  /// pull request, Bitbucket push, and Bitbucket pull request events.
  /// </dd> <dt> BASE_REF </dt> <dd>
  /// A webhook event triggers a build when the base reference matches the regular
  /// expression <code>pattern</code>. For example,
  /// <code>refs/heads/branch-name</code>.
  /// <note>
  /// Works with pull request events only.
  /// </note> </dd> <dt> FILE_PATH </dt> <dd>
  /// A webhook triggers a build when the path of a changed file matches the
  /// regular expression <code>pattern</code>.
  /// <note>
  /// Works with GitHub and Bitbucket events push and pull requests events. Also
  /// works with GitHub Enterprise push events, but does not work with GitHub
  /// Enterprise pull request events.
  /// </note> </dd> <dt>COMMIT_MESSAGE</dt> <dd>
  /// A webhook triggers a build when the head commit message matches the regular
  /// expression <code>pattern</code>.
  /// <note>
  /// Works with GitHub and Bitbucket events push and pull requests events. Also
  /// works with GitHub Enterprise push events, but does not work with GitHub
  /// Enterprise pull request events.
  /// </note> </dd> </dl>
  @_s.JsonKey(name: 'type')
  final WebhookFilterType type;

  /// Used to indicate that the <code>pattern</code> determines which webhook
  /// events do not trigger a build. If true, then a webhook event that does not
  /// match the <code>pattern</code> triggers a build. If false, then a webhook
  /// event that matches the <code>pattern</code> triggers a build.
  @_s.JsonKey(name: 'excludeMatchedPattern')
  final bool excludeMatchedPattern;

  WebhookFilter({
    @_s.required this.pattern,
    @_s.required this.type,
    this.excludeMatchedPattern,
  });
  factory WebhookFilter.fromJson(Map<String, dynamic> json) =>
      _$WebhookFilterFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookFilterToJson(this);
}

enum WebhookFilterType {
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('BASE_REF')
  baseRef,
  @_s.JsonValue('HEAD_REF')
  headRef,
  @_s.JsonValue('ACTOR_ACCOUNT_ID')
  actorAccountId,
  @_s.JsonValue('FILE_PATH')
  filePath,
  @_s.JsonValue('COMMIT_MESSAGE')
  commitMessage,
}

class AccountLimitExceededException extends _s.GenericAwsException {
  AccountLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'AccountLimitExceededException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class OAuthProviderException extends _s.GenericAwsException {
  OAuthProviderException({String type, String message})
      : super(type: type, code: 'OAuthProviderException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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
