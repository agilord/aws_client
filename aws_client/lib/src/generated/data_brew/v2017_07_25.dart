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

/// Glue DataBrew is a visual, cloud-scale data-preparation service. DataBrew
/// simplifies data preparation tasks, targeting data issues that are hard to
/// spot and time-consuming to fix. DataBrew empowers users of all technical
/// levels to visualize the data and perform one-click data transformations,
/// with no coding required.
class GlueDataBrew {
  final _s.RestJsonProtocol _protocol;
  GlueDataBrew({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'databrew',
            signingName: 'databrew',
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

  /// Deletes one or more versions of a recipe at a time.
  ///
  /// The entire request will be rejected if:
  ///
  /// <ul>
  /// <li>
  /// The recipe does not exist.
  /// </li>
  /// <li>
  /// There is an invalid version identifier in the list of versions.
  /// </li>
  /// <li>
  /// The version list is empty.
  /// </li>
  /// <li>
  /// The version list size exceeds 50.
  /// </li>
  /// <li>
  /// The version list contains duplicate entries.
  /// </li>
  /// </ul>
  /// The request will complete successfully, but with partial failures, if:
  ///
  /// <ul>
  /// <li>
  /// A version does not exist.
  /// </li>
  /// <li>
  /// A version is being used by a job.
  /// </li>
  /// <li>
  /// You specify <code>LATEST_WORKING</code>, but it's being used by a project.
  /// </li>
  /// <li>
  /// The version fails to be deleted.
  /// </li>
  /// </ul>
  /// The <code>LATEST_WORKING</code> version will only be deleted if the recipe
  /// has no other versions. If you try to delete <code>LATEST_WORKING</code>
  /// while other versions exist (or if they can't be deleted), then
  /// <code>LATEST_WORKING</code> will be listed as partial failure in the
  /// response.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe whose versions are to be deleted.
  ///
  /// Parameter [recipeVersions] :
  /// An array of version identifiers, for the recipe versions to be deleted.
  /// You can specify numeric versions (<code>X.Y</code>) or
  /// <code>LATEST_WORKING</code>. <code>LATEST_PUBLISHED</code> is not
  /// supported.
  Future<BatchDeleteRecipeVersionResponse> batchDeleteRecipeVersion({
    required String name,
    required List<String> recipeVersions,
  }) async {
    final $payload = <String, dynamic>{
      'RecipeVersions': recipeVersions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/recipes/${Uri.encodeComponent(name)}/batchDeleteRecipeVersion',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteRecipeVersionResponse.fromJson(response);
  }

  /// Creates a new DataBrew dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be created. Valid characters are alphanumeric
  /// (A-Z, a-z, 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [format] :
  /// The file format of a dataset that is created from an Amazon S3 file or
  /// folder.
  ///
  /// Parameter [pathOptions] :
  /// A set of options that defines how DataBrew interprets an Amazon S3 path of
  /// the dataset.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this dataset.
  Future<CreateDatasetResponse> createDataset({
    required Input input,
    required String name,
    InputFormat? format,
    FormatOptions? formatOptions,
    PathOptions? pathOptions,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Input': input,
      'Name': name,
      if (format != null) 'Format': format.toValue(),
      if (formatOptions != null) 'FormatOptions': formatOptions,
      if (pathOptions != null) 'PathOptions': pathOptions,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatasetResponse.fromJson(response);
  }

  /// Creates a new job to analyze a dataset and create its data profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset that this job is to act upon.
  ///
  /// Parameter [name] :
  /// The name of the job to be created. Valid characters are alphanumeric (A-Z,
  /// a-z, 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be assumed when DataBrew runs the job.
  ///
  /// Parameter [configuration] :
  /// Configuration for profile jobs. Used to select columns, do evaluations,
  /// and override default parameters of evaluations. When configuration is
  /// null, the profile job will run with default settings.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of an encryption key that is used to
  /// protect the job.
  ///
  /// Parameter [encryptionMode] :
  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - <code>SSE-KMS</code> - Server-side encryption with
  /// KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [jobSample] :
  /// Sample configuration for profile jobs only. Determines the number of rows
  /// on which the profile job will be executed. If a JobSample value is not
  /// provided, the default value will be used. The default value is CUSTOM_ROWS
  /// for the mode parameter and 20000 for the size parameter.
  ///
  /// Parameter [logSubscription] :
  /// Enables or disables Amazon CloudWatch logging for the job. If logging is
  /// enabled, CloudWatch writes one log stream for each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can use when the job processes
  /// data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this job.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  ///
  /// Parameter [validationConfigurations] :
  /// List of validation configurations that are applied to the profile job.
  Future<CreateProfileJobResponse> createProfileJob({
    required String datasetName,
    required String name,
    required S3Location outputLocation,
    required String roleArn,
    ProfileConfiguration? configuration,
    String? encryptionKeyArn,
    EncryptionMode? encryptionMode,
    JobSample? jobSample,
    LogSubscription? logSubscription,
    int? maxCapacity,
    int? maxRetries,
    Map<String, String>? tags,
    int? timeout,
    List<ValidationConfiguration>? validationConfigurations,
  }) async {
    _s.validateNumRange(
      'maxRetries',
      maxRetries,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'DatasetName': datasetName,
      'Name': name,
      'OutputLocation': outputLocation,
      'RoleArn': roleArn,
      if (configuration != null) 'Configuration': configuration,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (jobSample != null) 'JobSample': jobSample,
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profileJobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProfileJobResponse.fromJson(response);
  }

  /// Creates a new DataBrew project.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of an existing dataset to associate this project with.
  ///
  /// Parameter [name] :
  /// A unique name for the new project. Valid characters are alphanumeric (A-Z,
  /// a-z, 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [recipeName] :
  /// The name of an existing recipe to associate with the project.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be assumed for this request.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this project.
  Future<CreateProjectResponse> createProject({
    required String datasetName,
    required String name,
    required String recipeName,
    required String roleArn,
    Sample? sample,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DatasetName': datasetName,
      'Name': name,
      'RecipeName': recipeName,
      'RoleArn': roleArn,
      if (sample != null) 'Sample': sample,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Creates a new DataBrew recipe.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A unique name for the recipe. Valid characters are alphanumeric (A-Z, a-z,
  /// 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [steps] :
  /// An array containing the steps to be performed by the recipe. Each recipe
  /// step consists of one recipe action and (optionally) an array of condition
  /// expressions.
  ///
  /// Parameter [description] :
  /// A description for the recipe.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this recipe.
  Future<CreateRecipeResponse> createRecipe({
    required String name,
    required List<RecipeStep> steps,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'Steps': steps,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recipes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecipeResponse.fromJson(response);
  }

  /// Creates a new job to transform input data, using steps defined in an
  /// existing Glue DataBrew recipe
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A unique name for the job. Valid characters are alphanumeric (A-Z, a-z,
  /// 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be assumed when DataBrew runs the job.
  ///
  /// Parameter [dataCatalogOutputs] :
  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  ///
  /// Parameter [databaseOutputs] :
  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write to.
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset that this job processes.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of an encryption key that is used to
  /// protect the job.
  ///
  /// Parameter [encryptionMode] :
  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with keys managed by KMS.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// Enables or disables Amazon CloudWatch logging for the job. If logging is
  /// enabled, CloudWatch writes one log stream for each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can consume when the job
  /// processes data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [outputs] :
  /// One or more artifacts that represent the output from running the job.
  ///
  /// Parameter [projectName] :
  /// Either the name of an existing project, or a combination of a recipe and a
  /// dataset to associate with the recipe.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this job.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  Future<CreateRecipeJobResponse> createRecipeJob({
    required String name,
    required String roleArn,
    List<DataCatalogOutput>? dataCatalogOutputs,
    List<DatabaseOutput>? databaseOutputs,
    String? datasetName,
    String? encryptionKeyArn,
    EncryptionMode? encryptionMode,
    LogSubscription? logSubscription,
    int? maxCapacity,
    int? maxRetries,
    List<Output>? outputs,
    String? projectName,
    RecipeReference? recipeReference,
    Map<String, String>? tags,
    int? timeout,
  }) async {
    _s.validateNumRange(
      'maxRetries',
      maxRetries,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'RoleArn': roleArn,
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (datasetName != null) 'DatasetName': datasetName,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (outputs != null) 'Outputs': outputs,
      if (projectName != null) 'ProjectName': projectName,
      if (recipeReference != null) 'RecipeReference': recipeReference,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recipeJobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecipeJobResponse.fromJson(response);
  }

  /// Creates a new ruleset that can be used in a profile job to validate the
  /// data quality of a dataset.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the ruleset to be created. Valid characters are alphanumeric
  /// (A-Z, a-z, 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [rules] :
  /// A list of rules that are defined with the ruleset. A rule includes one or
  /// more checks to be validated on a DataBrew dataset.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is
  /// associated with.
  ///
  /// Parameter [description] :
  /// The description of the ruleset.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to the ruleset.
  Future<CreateRulesetResponse> createRuleset({
    required String name,
    required List<Rule> rules,
    required String targetArn,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'Rules': rules,
      'TargetArn': targetArn,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rulesets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRulesetResponse.fromJson(response);
  }

  /// Creates a new schedule for one or more DataBrew jobs. Jobs can be run at a
  /// specific date and time, or at regular intervals.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cronExpression] :
  /// The date or dates and time or times when the jobs are to be run. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/jobs.cron.html">Cron
  /// expressions</a> in the <i>Glue DataBrew Developer Guide</i>.
  ///
  /// Parameter [name] :
  /// A unique name for the schedule. Valid characters are alphanumeric (A-Z,
  /// a-z, 0-9), hyphen (-), period (.), and space.
  ///
  /// Parameter [jobNames] :
  /// The name or names of one or more jobs to be run.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this schedule.
  Future<CreateScheduleResponse> createSchedule({
    required String cronExpression,
    required String name,
    List<String>? jobNames,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CronExpression': cronExpression,
      'Name': name,
      if (jobNames != null) 'JobNames': jobNames,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/schedules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScheduleResponse.fromJson(response);
  }

  /// Deletes a dataset from DataBrew.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be deleted.
  Future<DeleteDatasetResponse> deleteDataset({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatasetResponse.fromJson(response);
  }

  /// Deletes the specified DataBrew job.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be deleted.
  Future<DeleteJobResponse> deleteJob({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/jobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobResponse.fromJson(response);
  }

  /// Deletes an existing DataBrew project.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to be deleted.
  Future<DeleteProjectResponse> deleteProject({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResponse.fromJson(response);
  }

  /// Deletes a single version of a DataBrew recipe.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe.
  ///
  /// Parameter [recipeVersion] :
  /// The version of the recipe to be deleted. You can specify a numeric
  /// versions (<code>X.Y</code>) or <code>LATEST_WORKING</code>.
  /// <code>LATEST_PUBLISHED</code> is not supported.
  Future<DeleteRecipeVersionResponse> deleteRecipeVersion({
    required String name,
    required String recipeVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/recipes/${Uri.encodeComponent(name)}/recipeVersion/${Uri.encodeComponent(recipeVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRecipeVersionResponse.fromJson(response);
  }

  /// Deletes a ruleset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the ruleset to be deleted.
  Future<DeleteRulesetResponse> deleteRuleset({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/rulesets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRulesetResponse.fromJson(response);
  }

  /// Deletes the specified DataBrew schedule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to be deleted.
  Future<DeleteScheduleResponse> deleteSchedule({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteScheduleResponse.fromJson(response);
  }

  /// Returns the definition of a specific DataBrew dataset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be described.
  Future<DescribeDatasetResponse> describeDataset({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatasetResponse.fromJson(response);
  }

  /// Returns the definition of a specific DataBrew job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be described.
  Future<DescribeJobResponse> describeJob({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResponse.fromJson(response);
  }

  /// Represents one run of a DataBrew job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job being processed during this run.
  ///
  /// Parameter [runId] :
  /// The unique identifier of the job run.
  Future<DescribeJobRunResponse> describeJobRun({
    required String name,
    required String runId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/jobs/${Uri.encodeComponent(name)}/jobRun/${Uri.encodeComponent(runId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobRunResponse.fromJson(response);
  }

  /// Returns the definition of a specific DataBrew project.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to be described.
  Future<DescribeProjectResponse> describeProject({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Returns the definition of a specific DataBrew recipe corresponding to a
  /// particular version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be described.
  ///
  /// Parameter [recipeVersion] :
  /// The recipe version identifier. If this parameter isn't specified, then the
  /// latest published version is returned.
  Future<DescribeRecipeResponse> describeRecipe({
    required String name,
    String? recipeVersion,
  }) async {
    final $query = <String, List<String>>{
      if (recipeVersion != null) 'recipeVersion': [recipeVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recipes/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecipeResponse.fromJson(response);
  }

  /// Retrieves detailed information about the ruleset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the ruleset to be described.
  Future<DescribeRulesetResponse> describeRuleset({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rulesets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRulesetResponse.fromJson(response);
  }

  /// Returns the definition of a specific DataBrew schedule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to be described.
  Future<DescribeScheduleResponse> describeSchedule({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScheduleResponse.fromJson(response);
  }

  /// Lists all of the DataBrew datasets.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListDatasetsResponse> listDatasets({
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
      requestUri: '/datasets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetsResponse.fromJson(response);
  }

  /// Lists all of the previous runs of a particular DataBrew job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListJobRunsResponse> listJobRuns({
    required String name,
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
      requestUri: '/jobs/${Uri.encodeComponent(name)}/jobRuns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobRunsResponse.fromJson(response);
  }

  /// Lists all of the DataBrew jobs that are defined.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of a dataset. Using this parameter indicates to return only those
  /// jobs that act on the specified dataset.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by DataBrew that specifies where to continue pagination
  /// if a previous request was truncated. To get the next set of pages, pass in
  /// the NextToken value from the response object of the previous page call.
  ///
  /// Parameter [projectName] :
  /// The name of a project. Using this parameter indicates to return only those
  /// jobs that are associated with the specified project.
  Future<ListJobsResponse> listJobs({
    String? datasetName,
    int? maxResults,
    String? nextToken,
    String? projectName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (datasetName != null) 'datasetName': [datasetName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (projectName != null) 'projectName': [projectName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Lists all of the DataBrew projects that are defined.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListProjectsResponse> listProjects({
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
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Lists the versions of a particular DataBrew recipe, except for
  /// <code>LATEST_WORKING</code>.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe for which to return version information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListRecipeVersionsResponse> listRecipeVersions({
    required String name,
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
      'name': [name],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recipeVersions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecipeVersionsResponse.fromJson(response);
  }

  /// Lists all of the DataBrew recipes that are defined.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  ///
  /// Parameter [recipeVersion] :
  /// Return only those recipes with a version identifier of
  /// <code>LATEST_WORKING</code> or <code>LATEST_PUBLISHED</code>. If
  /// <code>RecipeVersion</code> is omitted, <code>ListRecipes</code> returns
  /// all of the <code>LATEST_PUBLISHED</code> recipe versions.
  ///
  /// Valid values: <code>LATEST_WORKING</code> | <code>LATEST_PUBLISHED</code>
  Future<ListRecipesResponse> listRecipes({
    int? maxResults,
    String? nextToken,
    String? recipeVersion,
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
      if (recipeVersion != null) 'recipeVersion': [recipeVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recipes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecipesResponse.fromJson(response);
  }

  /// List all rulesets available in the current account or rulesets associated
  /// with a specific resource (dataset).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by DataBrew that specifies where to continue pagination
  /// if a previous request was truncated. To get the next set of pages, pass in
  /// the NextToken value from the response object of the previous page call.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) of a resource (dataset). Using this
  /// parameter indicates to return only those rulesets that are associated with
  /// the specified resource.
  Future<ListRulesetsResponse> listRulesets({
    int? maxResults,
    String? nextToken,
    String? targetArn,
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
      if (targetArn != null) 'targetArn': [targetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rulesets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRulesetsResponse.fromJson(response);
  }

  /// Lists the DataBrew schedules that are defined.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [jobName] :
  /// The name of the job that these schedules apply to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListSchedulesResponse> listSchedules({
    String? jobName,
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
      if (jobName != null) 'jobName': [jobName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSchedulesResponse.fromJson(response);
  }

  /// Lists all the tags for a DataBrew resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// DataBrew resource.
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

  /// Publishes a new version of a DataBrew recipe.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be published.
  ///
  /// Parameter [description] :
  /// A description of the recipe to be published, for this version of the
  /// recipe.
  Future<PublishRecipeResponse> publishRecipe({
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recipes/${Uri.encodeComponent(name)}/publishRecipe',
      exceptionFnMap: _exceptionFns,
    );
    return PublishRecipeResponse.fromJson(response);
  }

  /// Performs a recipe step within an interactive DataBrew session that's
  /// currently open.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to apply the action to.
  ///
  /// Parameter [clientSessionId] :
  /// A unique identifier for an interactive session that's currently open and
  /// ready for work. The action will be performed on this session.
  ///
  /// Parameter [preview] :
  /// If true, the result of the recipe step will be returned, but not applied.
  ///
  /// Parameter [stepIndex] :
  /// The index from which to preview a step. This index is used to preview the
  /// result of steps that have already been applied, so that the resulting view
  /// frame is from earlier in the view frame stack.
  Future<SendProjectSessionActionResponse> sendProjectSessionAction({
    required String name,
    String? clientSessionId,
    bool? preview,
    RecipeStep? recipeStep,
    int? stepIndex,
    ViewFrame? viewFrame,
  }) async {
    _s.validateNumRange(
      'stepIndex',
      stepIndex,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (clientSessionId != null) 'ClientSessionId': clientSessionId,
      if (preview != null) 'Preview': preview,
      if (recipeStep != null) 'RecipeStep': recipeStep,
      if (stepIndex != null) 'StepIndex': stepIndex,
      if (viewFrame != null) 'ViewFrame': viewFrame,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/projects/${Uri.encodeComponent(name)}/sendProjectSessionAction',
      exceptionFnMap: _exceptionFns,
    );
    return SendProjectSessionActionResponse.fromJson(response);
  }

  /// Runs a DataBrew job.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be run.
  Future<StartJobRunResponse> startJobRun({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/jobs/${Uri.encodeComponent(name)}/startJobRun',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobRunResponse.fromJson(response);
  }

  /// Creates an interactive session, enabling you to manipulate data in a
  /// DataBrew project.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to act upon.
  ///
  /// Parameter [assumeControl] :
  /// A value that, if true, enables you to take control of a session, even if a
  /// different client is currently accessing the project.
  Future<StartProjectSessionResponse> startProjectSession({
    required String name,
    bool? assumeControl,
  }) async {
    final $payload = <String, dynamic>{
      if (assumeControl != null) 'AssumeControl': assumeControl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/projects/${Uri.encodeComponent(name)}/startProjectSession',
      exceptionFnMap: _exceptionFns,
    );
    return StartProjectSessionResponse.fromJson(response);
  }

  /// Stops a particular run of a job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be stopped.
  ///
  /// Parameter [runId] :
  /// The ID of the job run to be stopped.
  Future<StopJobRunResponse> stopJobRun({
    required String name,
    required String runId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/jobs/${Uri.encodeComponent(name)}/jobRun/${Uri.encodeComponent(runId)}/stopJobRun',
      exceptionFnMap: _exceptionFns,
    );
    return StopJobRunResponse.fromJson(response);
  }

  /// Adds metadata tags to a DataBrew resource, such as a dataset, project,
  /// recipe, job, or schedule.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The DataBrew resource to which tags should be added. The value for this
  /// parameter is an Amazon Resource Name (ARN). For DataBrew, you can tag a
  /// dataset, a job, a project, or a recipe.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes metadata tags from a DataBrew resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// A DataBrew resource from which you want to remove a tag or tags. The value
  /// for this parameter is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag keys (names) of one or more tags to be removed.
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

  /// Modifies the definition of an existing DataBrew dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be updated.
  ///
  /// Parameter [format] :
  /// The file format of a dataset that is created from an Amazon S3 file or
  /// folder.
  ///
  /// Parameter [pathOptions] :
  /// A set of options that defines how DataBrew interprets an Amazon S3 path of
  /// the dataset.
  Future<UpdateDatasetResponse> updateDataset({
    required Input input,
    required String name,
    InputFormat? format,
    FormatOptions? formatOptions,
    PathOptions? pathOptions,
  }) async {
    final $payload = <String, dynamic>{
      'Input': input,
      if (format != null) 'Format': format.toValue(),
      if (formatOptions != null) 'FormatOptions': formatOptions,
      if (pathOptions != null) 'PathOptions': pathOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDatasetResponse.fromJson(response);
  }

  /// Modifies the definition of an existing profile job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be updated.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be assumed when DataBrew runs the job.
  ///
  /// Parameter [configuration] :
  /// Configuration for profile jobs. Used to select columns, do evaluations,
  /// and override default parameters of evaluations. When configuration is
  /// null, the profile job will run with default settings.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of an encryption key that is used to
  /// protect the job.
  ///
  /// Parameter [encryptionMode] :
  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with keys managed by KMS.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [jobSample] :
  /// Sample configuration for Profile Jobs only. Determines the number of rows
  /// on which the Profile job will be executed. If a JobSample value is not
  /// provided for profile jobs, the default value will be used. The default
  /// value is CUSTOM_ROWS for the mode parameter and 20000 for the size
  /// parameter.
  ///
  /// Parameter [logSubscription] :
  /// Enables or disables Amazon CloudWatch logging for the job. If logging is
  /// enabled, CloudWatch writes one log stream for each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of compute nodes that DataBrew can use when the job
  /// processes data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  ///
  /// Parameter [validationConfigurations] :
  /// List of validation configurations that are applied to the profile job.
  Future<UpdateProfileJobResponse> updateProfileJob({
    required String name,
    required S3Location outputLocation,
    required String roleArn,
    ProfileConfiguration? configuration,
    String? encryptionKeyArn,
    EncryptionMode? encryptionMode,
    JobSample? jobSample,
    LogSubscription? logSubscription,
    int? maxCapacity,
    int? maxRetries,
    int? timeout,
    List<ValidationConfiguration>? validationConfigurations,
  }) async {
    _s.validateNumRange(
      'maxRetries',
      maxRetries,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'OutputLocation': outputLocation,
      'RoleArn': roleArn,
      if (configuration != null) 'Configuration': configuration,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (jobSample != null) 'JobSample': jobSample,
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (timeout != null) 'Timeout': timeout,
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/profileJobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProfileJobResponse.fromJson(response);
  }

  /// Modifies the definition of an existing DataBrew project.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to be updated.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to be assumed for this
  /// request.
  Future<UpdateProjectResponse> updateProject({
    required String name,
    required String roleArn,
    Sample? sample,
  }) async {
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
      if (sample != null) 'Sample': sample,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectResponse.fromJson(response);
  }

  /// Modifies the definition of the <code>LATEST_WORKING</code> version of a
  /// DataBrew recipe.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be updated.
  ///
  /// Parameter [description] :
  /// A description of the recipe.
  ///
  /// Parameter [steps] :
  /// One or more steps to be performed by the recipe. Each step consists of an
  /// action, and the conditions under which the action should succeed.
  Future<UpdateRecipeResponse> updateRecipe({
    required String name,
    String? description,
    List<RecipeStep>? steps,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (steps != null) 'Steps': steps,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/recipes/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecipeResponse.fromJson(response);
  }

  /// Modifies the definition of an existing DataBrew recipe job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to update.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the Identity and Access Management (IAM)
  /// role to be assumed when DataBrew runs the job.
  ///
  /// Parameter [dataCatalogOutputs] :
  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  ///
  /// Parameter [databaseOutputs] :
  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write into.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of an encryption key that is used to
  /// protect the job.
  ///
  /// Parameter [encryptionMode] :
  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with keys managed by KMS.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// Enables or disables Amazon CloudWatch logging for the job. If logging is
  /// enabled, CloudWatch writes one log stream for each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can consume when the job
  /// processes data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [outputs] :
  /// One or more artifacts that represent the output from running the job.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  Future<UpdateRecipeJobResponse> updateRecipeJob({
    required String name,
    required String roleArn,
    List<DataCatalogOutput>? dataCatalogOutputs,
    List<DatabaseOutput>? databaseOutputs,
    String? encryptionKeyArn,
    EncryptionMode? encryptionMode,
    LogSubscription? logSubscription,
    int? maxCapacity,
    int? maxRetries,
    List<Output>? outputs,
    int? timeout,
  }) async {
    _s.validateNumRange(
      'maxRetries',
      maxRetries,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (outputs != null) 'Outputs': outputs,
      if (timeout != null) 'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/recipeJobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecipeJobResponse.fromJson(response);
  }

  /// Updates specified ruleset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the ruleset to be updated.
  ///
  /// Parameter [rules] :
  /// A list of rules that are defined with the ruleset. A rule includes one or
  /// more checks to be validated on a DataBrew dataset.
  ///
  /// Parameter [description] :
  /// The description of the ruleset.
  Future<UpdateRulesetResponse> updateRuleset({
    required String name,
    required List<Rule> rules,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'Rules': rules,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/rulesets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRulesetResponse.fromJson(response);
  }

  /// Modifies the definition of an existing DataBrew schedule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cronExpression] :
  /// The date or dates and time or times when the jobs are to be run. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/jobs.cron.html">Cron
  /// expressions</a> in the <i>Glue DataBrew Developer Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the schedule to update.
  ///
  /// Parameter [jobNames] :
  /// The name or names of one or more jobs to be run for this schedule.
  Future<UpdateScheduleResponse> updateSchedule({
    required String cronExpression,
    required String name,
    List<String>? jobNames,
  }) async {
    final $payload = <String, dynamic>{
      'CronExpression': cronExpression,
      if (jobNames != null) 'JobNames': jobNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScheduleResponse.fromJson(response);
  }
}

/// Configuration of statistics that are allowed to be run on columns that
/// contain detected entities. When undefined, no statistics will be computed on
/// columns that contain detected entities.
class AllowedStatistics {
  /// One or more column statistics to allow for columns that contain detected
  /// entities.
  final List<String> statistics;

  AllowedStatistics({
    required this.statistics,
  });

  factory AllowedStatistics.fromJson(Map<String, dynamic> json) {
    return AllowedStatistics(
      statistics: (json['Statistics'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statistics = this.statistics;
    return {
      'Statistics': statistics,
    };
  }
}

enum AnalyticsMode {
  enable,
  disable,
}

extension AnalyticsModeValueExtension on AnalyticsMode {
  String toValue() {
    switch (this) {
      case AnalyticsMode.enable:
        return 'ENABLE';
      case AnalyticsMode.disable:
        return 'DISABLE';
    }
  }
}

extension AnalyticsModeFromString on String {
  AnalyticsMode toAnalyticsMode() {
    switch (this) {
      case 'ENABLE':
        return AnalyticsMode.enable;
      case 'DISABLE':
        return AnalyticsMode.disable;
    }
    throw Exception('$this is not known in enum AnalyticsMode');
  }
}

class BatchDeleteRecipeVersionResponse {
  /// The name of the recipe that was modified.
  final String name;

  /// Errors, if any, that occurred while attempting to delete the recipe
  /// versions.
  final List<RecipeVersionErrorDetail>? errors;

  BatchDeleteRecipeVersionResponse({
    required this.name,
    this.errors,
  });

  factory BatchDeleteRecipeVersionResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteRecipeVersionResponse(
      name: json['Name'] as String,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecipeVersionErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final errors = this.errors;
    return {
      'Name': name,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// Selector of a column from a dataset for profile job configuration. One
/// selector includes either a column name or a regular expression.
class ColumnSelector {
  /// The name of a column from a dataset.
  final String? name;

  /// A regular expression for selecting a column from a dataset.
  final String? regex;

  ColumnSelector({
    this.name,
    this.regex,
  });

  factory ColumnSelector.fromJson(Map<String, dynamic> json) {
    return ColumnSelector(
      name: json['Name'] as String?,
      regex: json['Regex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regex = this.regex;
    return {
      if (name != null) 'Name': name,
      if (regex != null) 'Regex': regex,
    };
  }
}

/// Configuration for column evaluations for a profile job.
/// ColumnStatisticsConfiguration can be used to select evaluations and override
/// parameters of evaluations for particular columns.
class ColumnStatisticsConfiguration {
  /// Configuration for evaluations. Statistics can be used to select evaluations
  /// and override parameters of evaluations.
  final StatisticsConfiguration statistics;

  /// List of column selectors. Selectors can be used to select columns from the
  /// dataset. When selectors are undefined, configuration will be applied to all
  /// supported columns.
  final List<ColumnSelector>? selectors;

  ColumnStatisticsConfiguration({
    required this.statistics,
    this.selectors,
  });

  factory ColumnStatisticsConfiguration.fromJson(Map<String, dynamic> json) {
    return ColumnStatisticsConfiguration(
      statistics: StatisticsConfiguration.fromJson(
          json['Statistics'] as Map<String, dynamic>),
      selectors: (json['Selectors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statistics = this.statistics;
    final selectors = this.selectors;
    return {
      'Statistics': statistics,
      if (selectors != null) 'Selectors': selectors,
    };
  }
}

enum CompressionFormat {
  gzip,
  lz4,
  snappy,
  bzip2,
  deflate,
  lzo,
  brotli,
  zstd,
  zlib,
}

extension CompressionFormatValueExtension on CompressionFormat {
  String toValue() {
    switch (this) {
      case CompressionFormat.gzip:
        return 'GZIP';
      case CompressionFormat.lz4:
        return 'LZ4';
      case CompressionFormat.snappy:
        return 'SNAPPY';
      case CompressionFormat.bzip2:
        return 'BZIP2';
      case CompressionFormat.deflate:
        return 'DEFLATE';
      case CompressionFormat.lzo:
        return 'LZO';
      case CompressionFormat.brotli:
        return 'BROTLI';
      case CompressionFormat.zstd:
        return 'ZSTD';
      case CompressionFormat.zlib:
        return 'ZLIB';
    }
  }
}

extension CompressionFormatFromString on String {
  CompressionFormat toCompressionFormat() {
    switch (this) {
      case 'GZIP':
        return CompressionFormat.gzip;
      case 'LZ4':
        return CompressionFormat.lz4;
      case 'SNAPPY':
        return CompressionFormat.snappy;
      case 'BZIP2':
        return CompressionFormat.bzip2;
      case 'DEFLATE':
        return CompressionFormat.deflate;
      case 'LZO':
        return CompressionFormat.lzo;
      case 'BROTLI':
        return CompressionFormat.brotli;
      case 'ZSTD':
        return CompressionFormat.zstd;
      case 'ZLIB':
        return CompressionFormat.zlib;
    }
    throw Exception('$this is not known in enum CompressionFormat');
  }
}

/// Represents an individual condition that evaluates to true or false.
///
/// Conditions are used with recipe actions. The action is only performed for
/// column values where the condition evaluates to true.
///
/// If a recipe requires more than one condition, then the recipe must specify
/// multiple <code>ConditionExpression</code> elements. Each condition is
/// applied to the rows in a dataset first, before the recipe action is
/// performed.
class ConditionExpression {
  /// A specific condition to apply to a recipe action. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/recipes.html#recipes.structure">Recipe
  /// structure</a> in the <i>Glue DataBrew Developer Guide</i>.
  final String condition;

  /// A column to apply this condition to.
  final String targetColumn;

  /// A value that the condition must evaluate to for the condition to succeed.
  final String? value;

  ConditionExpression({
    required this.condition,
    required this.targetColumn,
    this.value,
  });

  factory ConditionExpression.fromJson(Map<String, dynamic> json) {
    return ConditionExpression(
      condition: json['Condition'] as String,
      targetColumn: json['TargetColumn'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final targetColumn = this.targetColumn;
    final value = this.value;
    return {
      'Condition': condition,
      'TargetColumn': targetColumn,
      if (value != null) 'Value': value,
    };
  }
}

class CreateDatasetResponse {
  /// The name of the dataset that you created.
  final String name;

  CreateDatasetResponse({
    required this.name,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateProfileJobResponse {
  /// The name of the job that was created.
  final String name;

  CreateProfileJobResponse({
    required this.name,
  });

  factory CreateProfileJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileJobResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateProjectResponse {
  /// The name of the project that you created.
  final String name;

  CreateProjectResponse({
    required this.name,
  });

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateRecipeJobResponse {
  /// The name of the job that you created.
  final String name;

  CreateRecipeJobResponse({
    required this.name,
  });

  factory CreateRecipeJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecipeJobResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateRecipeResponse {
  /// The name of the recipe that you created.
  final String name;

  CreateRecipeResponse({
    required this.name,
  });

  factory CreateRecipeResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecipeResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateRulesetResponse {
  /// The unique name of the created ruleset.
  final String name;

  CreateRulesetResponse({
    required this.name,
  });

  factory CreateRulesetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRulesetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class CreateScheduleResponse {
  /// The name of the schedule that was created.
  final String name;

  CreateScheduleResponse({
    required this.name,
  });

  factory CreateScheduleResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduleResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Represents a set of options that define how DataBrew will read a
/// comma-separated value (CSV) file when creating a dataset from that file.
class CsvOptions {
  /// A single character that specifies the delimiter being used in the CSV file.
  final String? delimiter;

  /// A variable that specifies whether the first row in the file is parsed as the
  /// header. If this value is false, column names are auto-generated.
  final bool? headerRow;

  CsvOptions({
    this.delimiter,
    this.headerRow,
  });

  factory CsvOptions.fromJson(Map<String, dynamic> json) {
    return CsvOptions(
      delimiter: json['Delimiter'] as String?,
      headerRow: json['HeaderRow'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    final headerRow = this.headerRow;
    return {
      if (delimiter != null) 'Delimiter': delimiter,
      if (headerRow != null) 'HeaderRow': headerRow,
    };
  }
}

/// Represents a set of options that define how DataBrew will write a
/// comma-separated value (CSV) file.
class CsvOutputOptions {
  /// A single character that specifies the delimiter used to create CSV job
  /// output.
  final String? delimiter;

  CsvOutputOptions({
    this.delimiter,
  });

  factory CsvOutputOptions.fromJson(Map<String, dynamic> json) {
    return CsvOutputOptions(
      delimiter: json['Delimiter'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    return {
      if (delimiter != null) 'Delimiter': delimiter,
    };
  }
}

/// Represents how metadata stored in the Glue Data Catalog is defined in a
/// DataBrew dataset.
class DataCatalogInputDefinition {
  /// The name of a database in the Data Catalog.
  final String databaseName;

  /// The name of a database table in the Data Catalog. This table corresponds to
  /// a DataBrew dataset.
  final String tableName;

  /// The unique identifier of the Amazon Web Services account that holds the Data
  /// Catalog that stores the data.
  final String? catalogId;

  /// Represents an Amazon location where DataBrew can store intermediate results.
  final S3Location? tempDirectory;

  DataCatalogInputDefinition({
    required this.databaseName,
    required this.tableName,
    this.catalogId,
    this.tempDirectory,
  });

  factory DataCatalogInputDefinition.fromJson(Map<String, dynamic> json) {
    return DataCatalogInputDefinition(
      databaseName: json['DatabaseName'] as String,
      tableName: json['TableName'] as String,
      catalogId: json['CatalogId'] as String?,
      tempDirectory: json['TempDirectory'] != null
          ? S3Location.fromJson(json['TempDirectory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final catalogId = this.catalogId;
    final tempDirectory = this.tempDirectory;
    return {
      'DatabaseName': databaseName,
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (tempDirectory != null) 'TempDirectory': tempDirectory,
    };
  }
}

/// Represents options that specify how and where in the Glue Data Catalog
/// DataBrew writes the output generated by recipe jobs.
class DataCatalogOutput {
  /// The name of a database in the Data Catalog.
  final String databaseName;

  /// The name of a table in the Data Catalog.
  final String tableName;

  /// The unique identifier of the Amazon Web Services account that holds the Data
  /// Catalog that stores the data.
  final String? catalogId;

  /// Represents options that specify how and where DataBrew writes the database
  /// output generated by recipe jobs.
  final DatabaseTableOutputOptions? databaseOptions;

  /// A value that, if true, means that any data in the location specified for
  /// output is overwritten with new output. Not supported with DatabaseOptions.
  final bool? overwrite;

  /// Represents options that specify how and where DataBrew writes the Amazon S3
  /// output generated by recipe jobs.
  final S3TableOutputOptions? s3Options;

  DataCatalogOutput({
    required this.databaseName,
    required this.tableName,
    this.catalogId,
    this.databaseOptions,
    this.overwrite,
    this.s3Options,
  });

  factory DataCatalogOutput.fromJson(Map<String, dynamic> json) {
    return DataCatalogOutput(
      databaseName: json['DatabaseName'] as String,
      tableName: json['TableName'] as String,
      catalogId: json['CatalogId'] as String?,
      databaseOptions: json['DatabaseOptions'] != null
          ? DatabaseTableOutputOptions.fromJson(
              json['DatabaseOptions'] as Map<String, dynamic>)
          : null,
      overwrite: json['Overwrite'] as bool?,
      s3Options: json['S3Options'] != null
          ? S3TableOutputOptions.fromJson(
              json['S3Options'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final catalogId = this.catalogId;
    final databaseOptions = this.databaseOptions;
    final overwrite = this.overwrite;
    final s3Options = this.s3Options;
    return {
      'DatabaseName': databaseName,
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (databaseOptions != null) 'DatabaseOptions': databaseOptions,
      if (overwrite != null) 'Overwrite': overwrite,
      if (s3Options != null) 'S3Options': s3Options,
    };
  }
}

/// Connection information for dataset input files stored in a database.
class DatabaseInputDefinition {
  /// The Glue Connection that stores the connection information for the target
  /// database.
  final String glueConnectionName;

  /// The table within the target database.
  final String? databaseTableName;

  /// Custom SQL to run against the provided Glue connection. This SQL will be
  /// used as the input for DataBrew projects and jobs.
  final String? queryString;
  final S3Location? tempDirectory;

  DatabaseInputDefinition({
    required this.glueConnectionName,
    this.databaseTableName,
    this.queryString,
    this.tempDirectory,
  });

  factory DatabaseInputDefinition.fromJson(Map<String, dynamic> json) {
    return DatabaseInputDefinition(
      glueConnectionName: json['GlueConnectionName'] as String,
      databaseTableName: json['DatabaseTableName'] as String?,
      queryString: json['QueryString'] as String?,
      tempDirectory: json['TempDirectory'] != null
          ? S3Location.fromJson(json['TempDirectory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final glueConnectionName = this.glueConnectionName;
    final databaseTableName = this.databaseTableName;
    final queryString = this.queryString;
    final tempDirectory = this.tempDirectory;
    return {
      'GlueConnectionName': glueConnectionName,
      if (databaseTableName != null) 'DatabaseTableName': databaseTableName,
      if (queryString != null) 'QueryString': queryString,
      if (tempDirectory != null) 'TempDirectory': tempDirectory,
    };
  }
}

/// Represents a JDBC database output object which defines the output
/// destination for a DataBrew recipe job to write into.
class DatabaseOutput {
  /// Represents options that specify how and where DataBrew writes the database
  /// output generated by recipe jobs.
  final DatabaseTableOutputOptions databaseOptions;

  /// The Glue connection that stores the connection information for the target
  /// database.
  final String glueConnectionName;

  /// The output mode to write into the database. Currently supported option:
  /// NEW_TABLE.
  final DatabaseOutputMode? databaseOutputMode;

  DatabaseOutput({
    required this.databaseOptions,
    required this.glueConnectionName,
    this.databaseOutputMode,
  });

  factory DatabaseOutput.fromJson(Map<String, dynamic> json) {
    return DatabaseOutput(
      databaseOptions: DatabaseTableOutputOptions.fromJson(
          json['DatabaseOptions'] as Map<String, dynamic>),
      glueConnectionName: json['GlueConnectionName'] as String,
      databaseOutputMode:
          (json['DatabaseOutputMode'] as String?)?.toDatabaseOutputMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final databaseOptions = this.databaseOptions;
    final glueConnectionName = this.glueConnectionName;
    final databaseOutputMode = this.databaseOutputMode;
    return {
      'DatabaseOptions': databaseOptions,
      'GlueConnectionName': glueConnectionName,
      if (databaseOutputMode != null)
        'DatabaseOutputMode': databaseOutputMode.toValue(),
    };
  }
}

enum DatabaseOutputMode {
  newTable,
}

extension DatabaseOutputModeValueExtension on DatabaseOutputMode {
  String toValue() {
    switch (this) {
      case DatabaseOutputMode.newTable:
        return 'NEW_TABLE';
    }
  }
}

extension DatabaseOutputModeFromString on String {
  DatabaseOutputMode toDatabaseOutputMode() {
    switch (this) {
      case 'NEW_TABLE':
        return DatabaseOutputMode.newTable;
    }
    throw Exception('$this is not known in enum DatabaseOutputMode');
  }
}

/// Represents options that specify how and where DataBrew writes the database
/// output generated by recipe jobs.
class DatabaseTableOutputOptions {
  /// A prefix for the name of a table DataBrew will create in the database.
  final String tableName;

  /// Represents an Amazon S3 location (bucket name and object key) where DataBrew
  /// can store intermediate results.
  final S3Location? tempDirectory;

  DatabaseTableOutputOptions({
    required this.tableName,
    this.tempDirectory,
  });

  factory DatabaseTableOutputOptions.fromJson(Map<String, dynamic> json) {
    return DatabaseTableOutputOptions(
      tableName: json['TableName'] as String,
      tempDirectory: json['TempDirectory'] != null
          ? S3Location.fromJson(json['TempDirectory'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableName = this.tableName;
    final tempDirectory = this.tempDirectory;
    return {
      'TableName': tableName,
      if (tempDirectory != null) 'TempDirectory': tempDirectory,
    };
  }
}

/// Represents a dataset that can be processed by DataBrew.
class Dataset {
  /// Information on how DataBrew can find the dataset, in either the Glue Data
  /// Catalog or Amazon S3.
  final Input input;

  /// The unique name of the dataset.
  final String name;

  /// The ID of the Amazon Web Services account that owns the dataset.
  final String? accountId;

  /// The date and time that the dataset was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the dataset.
  final String? createdBy;

  /// The file format of a dataset that is created from an Amazon S3 file or
  /// folder.
  final InputFormat? format;

  /// A set of options that define how DataBrew interprets the data in the
  /// dataset.
  final FormatOptions? formatOptions;

  /// The Amazon Resource Name (ARN) of the user who last modified the dataset.
  final String? lastModifiedBy;

  /// The last modification date and time of the dataset.
  final DateTime? lastModifiedDate;

  /// A set of options that defines how DataBrew interprets an Amazon S3 path of
  /// the dataset.
  final PathOptions? pathOptions;

  /// The unique Amazon Resource Name (ARN) for the dataset.
  final String? resourceArn;

  /// The location of the data for the dataset, either Amazon S3 or the Glue Data
  /// Catalog.
  final Source? source;

  /// Metadata tags that have been applied to the dataset.
  final Map<String, String>? tags;

  Dataset({
    required this.input,
    required this.name,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.format,
    this.formatOptions,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.pathOptions,
    this.resourceArn,
    this.source,
    this.tags,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      input: Input.fromJson(json['Input'] as Map<String, dynamic>),
      name: json['Name'] as String,
      accountId: json['AccountId'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      format: (json['Format'] as String?)?.toInputFormat(),
      formatOptions: json['FormatOptions'] != null
          ? FormatOptions.fromJson(
              json['FormatOptions'] as Map<String, dynamic>)
          : null,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      pathOptions: json['PathOptions'] != null
          ? PathOptions.fromJson(json['PathOptions'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      source: (json['Source'] as String?)?.toSource(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final name = this.name;
    final accountId = this.accountId;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final format = this.format;
    final formatOptions = this.formatOptions;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final pathOptions = this.pathOptions;
    final resourceArn = this.resourceArn;
    final source = this.source;
    final tags = this.tags;
    return {
      'Input': input,
      'Name': name,
      if (accountId != null) 'AccountId': accountId,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (format != null) 'Format': format.toValue(),
      if (formatOptions != null) 'FormatOptions': formatOptions,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (pathOptions != null) 'PathOptions': pathOptions,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (source != null) 'Source': source.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents a dataset parameter that defines type and conditions for a
/// parameter in the Amazon S3 path of the dataset.
class DatasetParameter {
  /// The name of the parameter that is used in the dataset's Amazon S3 path.
  final String name;

  /// The type of the dataset parameter, can be one of a 'String', 'Number' or
  /// 'Datetime'.
  final ParameterType type;

  /// Optional boolean value that defines whether the captured value of this
  /// parameter should be used to create a new column in a dataset.
  final bool? createColumn;

  /// Additional parameter options such as a format and a timezone. Required for
  /// datetime parameters.
  final DatetimeOptions? datetimeOptions;

  /// The optional filter expression structure to apply additional matching
  /// criteria to the parameter.
  final FilterExpression? filter;

  DatasetParameter({
    required this.name,
    required this.type,
    this.createColumn,
    this.datetimeOptions,
    this.filter,
  });

  factory DatasetParameter.fromJson(Map<String, dynamic> json) {
    return DatasetParameter(
      name: json['Name'] as String,
      type: (json['Type'] as String).toParameterType(),
      createColumn: json['CreateColumn'] as bool?,
      datetimeOptions: json['DatetimeOptions'] != null
          ? DatetimeOptions.fromJson(
              json['DatetimeOptions'] as Map<String, dynamic>)
          : null,
      filter: json['Filter'] != null
          ? FilterExpression.fromJson(json['Filter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final createColumn = this.createColumn;
    final datetimeOptions = this.datetimeOptions;
    final filter = this.filter;
    return {
      'Name': name,
      'Type': type.toValue(),
      if (createColumn != null) 'CreateColumn': createColumn,
      if (datetimeOptions != null) 'DatetimeOptions': datetimeOptions,
      if (filter != null) 'Filter': filter,
    };
  }
}

/// Represents additional options for correct interpretation of datetime
/// parameters used in the Amazon S3 path of a dataset.
class DatetimeOptions {
  /// Required option, that defines the datetime format used for a date parameter
  /// in the Amazon S3 path. Should use only supported datetime specifiers and
  /// separation characters, all literal a-z or A-Z characters should be escaped
  /// with single quotes. E.g. "MM.dd.yyyy-'at'-HH:mm".
  final String format;

  /// Optional value for a non-US locale code, needed for correct interpretation
  /// of some date formats.
  final String? localeCode;

  /// Optional value for a timezone offset of the datetime parameter value in the
  /// Amazon S3 path. Shouldn't be used if Format for this parameter includes
  /// timezone fields. If no offset specified, UTC is assumed.
  final String? timezoneOffset;

  DatetimeOptions({
    required this.format,
    this.localeCode,
    this.timezoneOffset,
  });

  factory DatetimeOptions.fromJson(Map<String, dynamic> json) {
    return DatetimeOptions(
      format: json['Format'] as String,
      localeCode: json['LocaleCode'] as String?,
      timezoneOffset: json['TimezoneOffset'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final localeCode = this.localeCode;
    final timezoneOffset = this.timezoneOffset;
    return {
      'Format': format,
      if (localeCode != null) 'LocaleCode': localeCode,
      if (timezoneOffset != null) 'TimezoneOffset': timezoneOffset,
    };
  }
}

class DeleteDatasetResponse {
  /// The name of the dataset that you deleted.
  final String name;

  DeleteDatasetResponse({
    required this.name,
  });

  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDatasetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class DeleteJobResponse {
  /// The name of the job that you deleted.
  final String name;

  DeleteJobResponse({
    required this.name,
  });

  factory DeleteJobResponse.fromJson(Map<String, dynamic> json) {
    return DeleteJobResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class DeleteProjectResponse {
  /// The name of the project that you deleted.
  final String name;

  DeleteProjectResponse({
    required this.name,
  });

  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class DeleteRecipeVersionResponse {
  /// The name of the recipe that was deleted.
  final String name;

  /// The version of the recipe that was deleted.
  final String recipeVersion;

  DeleteRecipeVersionResponse({
    required this.name,
    required this.recipeVersion,
  });

  factory DeleteRecipeVersionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRecipeVersionResponse(
      name: json['Name'] as String,
      recipeVersion: json['RecipeVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recipeVersion = this.recipeVersion;
    return {
      'Name': name,
      'RecipeVersion': recipeVersion,
    };
  }
}

class DeleteRulesetResponse {
  /// The name of the deleted ruleset.
  final String name;

  DeleteRulesetResponse({
    required this.name,
  });

  factory DeleteRulesetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRulesetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class DeleteScheduleResponse {
  /// The name of the schedule that was deleted.
  final String name;

  DeleteScheduleResponse({
    required this.name,
  });

  factory DeleteScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DeleteScheduleResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class DescribeDatasetResponse {
  final Input input;

  /// The name of the dataset.
  final String name;

  /// The date and time that the dataset was created.
  final DateTime? createDate;

  /// The identifier (user name) of the user who created the dataset.
  final String? createdBy;

  /// The file format of a dataset that is created from an Amazon S3 file or
  /// folder.
  final InputFormat? format;
  final FormatOptions? formatOptions;

  /// The identifier (user name) of the user who last modified the dataset.
  final String? lastModifiedBy;

  /// The date and time that the dataset was last modified.
  final DateTime? lastModifiedDate;

  /// A set of options that defines how DataBrew interprets an Amazon S3 path of
  /// the dataset.
  final PathOptions? pathOptions;

  /// The Amazon Resource Name (ARN) of the dataset.
  final String? resourceArn;

  /// The location of the data for this dataset, Amazon S3 or the Glue Data
  /// Catalog.
  final Source? source;

  /// Metadata tags associated with this dataset.
  final Map<String, String>? tags;

  DescribeDatasetResponse({
    required this.input,
    required this.name,
    this.createDate,
    this.createdBy,
    this.format,
    this.formatOptions,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.pathOptions,
    this.resourceArn,
    this.source,
    this.tags,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      input: Input.fromJson(json['Input'] as Map<String, dynamic>),
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      format: (json['Format'] as String?)?.toInputFormat(),
      formatOptions: json['FormatOptions'] != null
          ? FormatOptions.fromJson(
              json['FormatOptions'] as Map<String, dynamic>)
          : null,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      pathOptions: json['PathOptions'] != null
          ? PathOptions.fromJson(json['PathOptions'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      source: (json['Source'] as String?)?.toSource(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final format = this.format;
    final formatOptions = this.formatOptions;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final pathOptions = this.pathOptions;
    final resourceArn = this.resourceArn;
    final source = this.source;
    final tags = this.tags;
    return {
      'Input': input,
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (format != null) 'Format': format.toValue(),
      if (formatOptions != null) 'FormatOptions': formatOptions,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (pathOptions != null) 'PathOptions': pathOptions,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (source != null) 'Source': source.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeJobResponse {
  /// The name of the job.
  final String name;

  /// The date and time that the job was created.
  final DateTime? createDate;

  /// The identifier (user name) of the user associated with the creation of the
  /// job.
  final String? createdBy;

  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  final List<DataCatalogOutput>? dataCatalogOutputs;

  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write into.
  final List<DatabaseOutput>? databaseOutputs;

  /// The dataset that the job acts upon.
  final String? datasetName;

  /// The Amazon Resource Name (ARN) of an encryption key that is used to protect
  /// the job.
  final String? encryptionKeyArn;

  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with keys managed by KMS.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon S3.
  /// </li>
  /// </ul>
  final EncryptionMode? encryptionMode;

  /// Sample configuration for profile jobs only. Determines the number of rows on
  /// which the profile job will be executed.
  final JobSample? jobSample;

  /// The identifier (user name) of the user who last modified the job.
  final String? lastModifiedBy;

  /// The date and time that the job was last modified.
  final DateTime? lastModifiedDate;

  /// Indicates whether Amazon CloudWatch logging is enabled for this job.
  final LogSubscription? logSubscription;

  /// The maximum number of compute nodes that DataBrew can consume when the job
  /// processes data.
  final int? maxCapacity;

  /// The maximum number of times to retry the job after a job run fails.
  final int? maxRetries;

  /// One or more artifacts that represent the output from running the job.
  final List<Output>? outputs;

  /// Configuration for profile jobs. Used to select columns, do evaluations, and
  /// override default parameters of evaluations. When configuration is null, the
  /// profile job will run with default settings.
  final ProfileConfiguration? profileConfiguration;

  /// The DataBrew project associated with this job.
  final String? projectName;
  final RecipeReference? recipeReference;

  /// The Amazon Resource Name (ARN) of the job.
  final String? resourceArn;

  /// The ARN of the Identity and Access Management (IAM) role to be assumed when
  /// DataBrew runs the job.
  final String? roleArn;

  /// Metadata tags associated with this job.
  final Map<String, String>? tags;

  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  final int? timeout;

  /// The job type, which must be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PROFILE</code> - The job analyzes the dataset to determine its size,
  /// data types, data distribution, and more.
  /// </li>
  /// <li>
  /// <code>RECIPE</code> - The job applies one or more transformations to a
  /// dataset.
  /// </li>
  /// </ul>
  final JobType? type;

  /// List of validation configurations that are applied to the profile job.
  final List<ValidationConfiguration>? validationConfigurations;

  DescribeJobResponse({
    required this.name,
    this.createDate,
    this.createdBy,
    this.dataCatalogOutputs,
    this.databaseOutputs,
    this.datasetName,
    this.encryptionKeyArn,
    this.encryptionMode,
    this.jobSample,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.logSubscription,
    this.maxCapacity,
    this.maxRetries,
    this.outputs,
    this.profileConfiguration,
    this.projectName,
    this.recipeReference,
    this.resourceArn,
    this.roleArn,
    this.tags,
    this.timeout,
    this.type,
    this.validationConfigurations,
  });

  factory DescribeJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobResponse(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      dataCatalogOutputs: (json['DataCatalogOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DataCatalogOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseOutputs: (json['DatabaseOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DatabaseOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasetName: json['DatasetName'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionMode: (json['EncryptionMode'] as String?)?.toEncryptionMode(),
      jobSample: json['JobSample'] != null
          ? JobSample.fromJson(json['JobSample'] as Map<String, dynamic>)
          : null,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      logSubscription:
          (json['LogSubscription'] as String?)?.toLogSubscription(),
      maxCapacity: json['MaxCapacity'] as int?,
      maxRetries: json['MaxRetries'] as int?,
      outputs: (json['Outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileConfiguration: json['ProfileConfiguration'] != null
          ? ProfileConfiguration.fromJson(
              json['ProfileConfiguration'] as Map<String, dynamic>)
          : null,
      projectName: json['ProjectName'] as String?,
      recipeReference: json['RecipeReference'] != null
          ? RecipeReference.fromJson(
              json['RecipeReference'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeout: json['Timeout'] as int?,
      type: (json['Type'] as String?)?.toJobType(),
      validationConfigurations: (json['ValidationConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final dataCatalogOutputs = this.dataCatalogOutputs;
    final databaseOutputs = this.databaseOutputs;
    final datasetName = this.datasetName;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionMode = this.encryptionMode;
    final jobSample = this.jobSample;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final logSubscription = this.logSubscription;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final outputs = this.outputs;
    final profileConfiguration = this.profileConfiguration;
    final projectName = this.projectName;
    final recipeReference = this.recipeReference;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    final tags = this.tags;
    final timeout = this.timeout;
    final type = this.type;
    final validationConfigurations = this.validationConfigurations;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (datasetName != null) 'DatasetName': datasetName,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (jobSample != null) 'JobSample': jobSample,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (outputs != null) 'Outputs': outputs,
      if (profileConfiguration != null)
        'ProfileConfiguration': profileConfiguration,
      if (projectName != null) 'ProjectName': projectName,
      if (recipeReference != null) 'RecipeReference': recipeReference,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
      if (type != null) 'Type': type.toValue(),
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
  }
}

class DescribeJobRunResponse {
  /// The name of the job being processed during this run.
  final String jobName;

  /// The number of times that DataBrew has attempted to run the job.
  final int? attempt;

  /// The date and time when the job completed processing.
  final DateTime? completedOn;

  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  final List<DataCatalogOutput>? dataCatalogOutputs;

  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write into.
  final List<DatabaseOutput>? databaseOutputs;

  /// The name of the dataset for the job to process.
  final String? datasetName;

  /// A message indicating an error (if any) that was encountered when the job
  /// ran.
  final String? errorMessage;

  /// The amount of time, in seconds, during which the job run consumed resources.
  final int? executionTime;

  /// Sample configuration for profile jobs only. Determines the number of rows on
  /// which the profile job will be executed. If a JobSample value is not
  /// provided, the default value will be used. The default value is CUSTOM_ROWS
  /// for the mode parameter and 20000 for the size parameter.
  final JobSample? jobSample;

  /// The name of an Amazon CloudWatch log group, where the job writes diagnostic
  /// messages when it runs.
  final String? logGroupName;

  /// The current status of Amazon CloudWatch logging for the job run.
  final LogSubscription? logSubscription;

  /// One or more output artifacts from a job run.
  final List<Output>? outputs;

  /// Configuration for profile jobs. Used to select columns, do evaluations, and
  /// override default parameters of evaluations. When configuration is null, the
  /// profile job will run with default settings.
  final ProfileConfiguration? profileConfiguration;
  final RecipeReference? recipeReference;

  /// The unique identifier of the job run.
  final String? runId;

  /// The Amazon Resource Name (ARN) of the user who started the job run.
  final String? startedBy;

  /// The date and time when the job run began.
  final DateTime? startedOn;

  /// The current state of the job run entity itself.
  final JobRunState? state;

  /// List of validation configurations that are applied to the profile job.
  final List<ValidationConfiguration>? validationConfigurations;

  DescribeJobRunResponse({
    required this.jobName,
    this.attempt,
    this.completedOn,
    this.dataCatalogOutputs,
    this.databaseOutputs,
    this.datasetName,
    this.errorMessage,
    this.executionTime,
    this.jobSample,
    this.logGroupName,
    this.logSubscription,
    this.outputs,
    this.profileConfiguration,
    this.recipeReference,
    this.runId,
    this.startedBy,
    this.startedOn,
    this.state,
    this.validationConfigurations,
  });

  factory DescribeJobRunResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobRunResponse(
      jobName: json['JobName'] as String,
      attempt: json['Attempt'] as int?,
      completedOn: timeStampFromJson(json['CompletedOn']),
      dataCatalogOutputs: (json['DataCatalogOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DataCatalogOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseOutputs: (json['DatabaseOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DatabaseOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasetName: json['DatasetName'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      executionTime: json['ExecutionTime'] as int?,
      jobSample: json['JobSample'] != null
          ? JobSample.fromJson(json['JobSample'] as Map<String, dynamic>)
          : null,
      logGroupName: json['LogGroupName'] as String?,
      logSubscription:
          (json['LogSubscription'] as String?)?.toLogSubscription(),
      outputs: (json['Outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileConfiguration: json['ProfileConfiguration'] != null
          ? ProfileConfiguration.fromJson(
              json['ProfileConfiguration'] as Map<String, dynamic>)
          : null,
      recipeReference: json['RecipeReference'] != null
          ? RecipeReference.fromJson(
              json['RecipeReference'] as Map<String, dynamic>)
          : null,
      runId: json['RunId'] as String?,
      startedBy: json['StartedBy'] as String?,
      startedOn: timeStampFromJson(json['StartedOn']),
      state: (json['State'] as String?)?.toJobRunState(),
      validationConfigurations: (json['ValidationConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final attempt = this.attempt;
    final completedOn = this.completedOn;
    final dataCatalogOutputs = this.dataCatalogOutputs;
    final databaseOutputs = this.databaseOutputs;
    final datasetName = this.datasetName;
    final errorMessage = this.errorMessage;
    final executionTime = this.executionTime;
    final jobSample = this.jobSample;
    final logGroupName = this.logGroupName;
    final logSubscription = this.logSubscription;
    final outputs = this.outputs;
    final profileConfiguration = this.profileConfiguration;
    final recipeReference = this.recipeReference;
    final runId = this.runId;
    final startedBy = this.startedBy;
    final startedOn = this.startedOn;
    final state = this.state;
    final validationConfigurations = this.validationConfigurations;
    return {
      'JobName': jobName,
      if (attempt != null) 'Attempt': attempt,
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (datasetName != null) 'DatasetName': datasetName,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (jobSample != null) 'JobSample': jobSample,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (outputs != null) 'Outputs': outputs,
      if (profileConfiguration != null)
        'ProfileConfiguration': profileConfiguration,
      if (recipeReference != null) 'RecipeReference': recipeReference,
      if (runId != null) 'RunId': runId,
      if (startedBy != null) 'StartedBy': startedBy,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (state != null) 'State': state.toValue(),
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
  }
}

class DescribeProjectResponse {
  /// The name of the project.
  final String name;

  /// The date and time that the project was created.
  final DateTime? createDate;

  /// The identifier (user name) of the user who created the project.
  final String? createdBy;

  /// The dataset associated with the project.
  final String? datasetName;

  /// The identifier (user name) of the user who last modified the project.
  final String? lastModifiedBy;

  /// The date and time that the project was last modified.
  final DateTime? lastModifiedDate;

  /// The date and time when the project was opened.
  final DateTime? openDate;

  /// The identifier (user name) of the user that opened the project for use.
  final String? openedBy;

  /// The recipe associated with this job.
  final String? recipeName;

  /// The Amazon Resource Name (ARN) of the project.
  final String? resourceArn;

  /// The ARN of the Identity and Access Management (IAM) role to be assumed when
  /// DataBrew runs the job.
  final String? roleArn;
  final Sample? sample;

  /// Describes the current state of the session:
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONING</code> - allocating resources for the session.
  /// </li>
  /// <li>
  /// <code>INITIALIZING</code> - getting the session ready for first use.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code> - the session is ready for use.
  /// </li>
  /// </ul>
  final SessionStatus? sessionStatus;

  /// Metadata tags associated with this project.
  final Map<String, String>? tags;

  DescribeProjectResponse({
    required this.name,
    this.createDate,
    this.createdBy,
    this.datasetName,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.openDate,
    this.openedBy,
    this.recipeName,
    this.resourceArn,
    this.roleArn,
    this.sample,
    this.sessionStatus,
    this.tags,
  });

  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResponse(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      datasetName: json['DatasetName'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      openDate: timeStampFromJson(json['OpenDate']),
      openedBy: json['OpenedBy'] as String?,
      recipeName: json['RecipeName'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      sample: json['Sample'] != null
          ? Sample.fromJson(json['Sample'] as Map<String, dynamic>)
          : null,
      sessionStatus: (json['SessionStatus'] as String?)?.toSessionStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final datasetName = this.datasetName;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final openDate = this.openDate;
    final openedBy = this.openedBy;
    final recipeName = this.recipeName;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    final sample = this.sample;
    final sessionStatus = this.sessionStatus;
    final tags = this.tags;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (datasetName != null) 'DatasetName': datasetName,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (openDate != null) 'OpenDate': unixTimestampToJson(openDate),
      if (openedBy != null) 'OpenedBy': openedBy,
      if (recipeName != null) 'RecipeName': recipeName,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sample != null) 'Sample': sample,
      if (sessionStatus != null) 'SessionStatus': sessionStatus.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeRecipeResponse {
  /// The name of the recipe.
  final String name;

  /// The date and time that the recipe was created.
  final DateTime? createDate;

  /// The identifier (user name) of the user who created the recipe.
  final String? createdBy;

  /// The description of the recipe.
  final String? description;

  /// The identifier (user name) of the user who last modified the recipe.
  final String? lastModifiedBy;

  /// The date and time that the recipe was last modified.
  final DateTime? lastModifiedDate;

  /// The name of the project associated with this recipe.
  final String? projectName;

  /// The identifier (user name) of the user who last published the recipe.
  final String? publishedBy;

  /// The date and time when the recipe was last published.
  final DateTime? publishedDate;

  /// The recipe version identifier.
  final String? recipeVersion;

  /// The ARN of the recipe.
  final String? resourceArn;

  /// One or more steps to be performed by the recipe. Each step consists of an
  /// action, and the conditions under which the action should succeed.
  final List<RecipeStep>? steps;

  /// Metadata tags associated with this project.
  final Map<String, String>? tags;

  DescribeRecipeResponse({
    required this.name,
    this.createDate,
    this.createdBy,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.projectName,
    this.publishedBy,
    this.publishedDate,
    this.recipeVersion,
    this.resourceArn,
    this.steps,
    this.tags,
  });

  factory DescribeRecipeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRecipeResponse(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      projectName: json['ProjectName'] as String?,
      publishedBy: json['PublishedBy'] as String?,
      publishedDate: timeStampFromJson(json['PublishedDate']),
      recipeVersion: json['RecipeVersion'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      steps: (json['Steps'] as List?)
          ?.whereNotNull()
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final description = this.description;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final projectName = this.projectName;
    final publishedBy = this.publishedBy;
    final publishedDate = this.publishedDate;
    final recipeVersion = this.recipeVersion;
    final resourceArn = this.resourceArn;
    final steps = this.steps;
    final tags = this.tags;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (projectName != null) 'ProjectName': projectName,
      if (publishedBy != null) 'PublishedBy': publishedBy,
      if (publishedDate != null)
        'PublishedDate': unixTimestampToJson(publishedDate),
      if (recipeVersion != null) 'RecipeVersion': recipeVersion,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (steps != null) 'Steps': steps,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeRulesetResponse {
  /// The name of the ruleset.
  final String name;

  /// The date and time that the ruleset was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the ruleset.
  final String? createdBy;

  /// The description of the ruleset.
  final String? description;

  /// The Amazon Resource Name (ARN) of the user who last modified the ruleset.
  final String? lastModifiedBy;

  /// The modification date and time of the ruleset.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) for the ruleset.
  final String? resourceArn;

  /// A list of rules that are defined with the ruleset. A rule includes one or
  /// more checks to be validated on a DataBrew dataset.
  final List<Rule>? rules;

  /// Metadata tags that have been applied to the ruleset.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is
  /// associated with.
  final String? targetArn;

  DescribeRulesetResponse({
    required this.name,
    this.createDate,
    this.createdBy,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.rules,
    this.tags,
    this.targetArn,
  });

  factory DescribeRulesetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRulesetResponse(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      resourceArn: json['ResourceArn'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final description = this.description;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final resourceArn = this.resourceArn;
    final rules = this.rules;
    final tags = this.tags;
    final targetArn = this.targetArn;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (rules != null) 'Rules': rules,
      if (tags != null) 'Tags': tags,
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

class DescribeScheduleResponse {
  /// The name of the schedule.
  final String name;

  /// The date and time that the schedule was created.
  final DateTime? createDate;

  /// The identifier (user name) of the user who created the schedule.
  final String? createdBy;

  /// The date or dates and time or times when the jobs are to be run for the
  /// schedule. For more information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/jobs.cron.html">Cron
  /// expressions</a> in the <i>Glue DataBrew Developer Guide</i>.
  final String? cronExpression;

  /// The name or names of one or more jobs to be run by using the schedule.
  final List<String>? jobNames;

  /// The identifier (user name) of the user who last modified the schedule.
  final String? lastModifiedBy;

  /// The date and time that the schedule was last modified.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the schedule.
  final String? resourceArn;

  /// Metadata tags associated with this schedule.
  final Map<String, String>? tags;

  DescribeScheduleResponse({
    required this.name,
    this.createDate,
    this.createdBy,
    this.cronExpression,
    this.jobNames,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.tags,
  });

  factory DescribeScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduleResponse(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      cronExpression: json['CronExpression'] as String?,
      jobNames: (json['JobNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final cronExpression = this.cronExpression;
    final jobNames = this.jobNames;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (cronExpression != null) 'CronExpression': cronExpression,
      if (jobNames != null) 'JobNames': jobNames,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum EncryptionMode {
  sseKms,
  sseS3,
}

extension EncryptionModeValueExtension on EncryptionMode {
  String toValue() {
    switch (this) {
      case EncryptionMode.sseKms:
        return 'SSE-KMS';
      case EncryptionMode.sseS3:
        return 'SSE-S3';
    }
  }
}

extension EncryptionModeFromString on String {
  EncryptionMode toEncryptionMode() {
    switch (this) {
      case 'SSE-KMS':
        return EncryptionMode.sseKms;
      case 'SSE-S3':
        return EncryptionMode.sseS3;
    }
    throw Exception('$this is not known in enum EncryptionMode');
  }
}

/// Configuration of entity detection for a profile job. When undefined, entity
/// detection is disabled.
class EntityDetectorConfiguration {
  /// Entity types to detect. Can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// USA_SSN
  /// </li>
  /// <li>
  /// EMAIL
  /// </li>
  /// <li>
  /// USA_ITIN
  /// </li>
  /// <li>
  /// USA_PASSPORT_NUMBER
  /// </li>
  /// <li>
  /// PHONE_NUMBER
  /// </li>
  /// <li>
  /// USA_DRIVING_LICENSE
  /// </li>
  /// <li>
  /// BANK_ACCOUNT
  /// </li>
  /// <li>
  /// CREDIT_CARD
  /// </li>
  /// <li>
  /// IP_ADDRESS
  /// </li>
  /// <li>
  /// MAC_ADDRESS
  /// </li>
  /// <li>
  /// USA_DEA_NUMBER
  /// </li>
  /// <li>
  /// USA_HCPCS_CODE
  /// </li>
  /// <li>
  /// USA_NATIONAL_PROVIDER_IDENTIFIER
  /// </li>
  /// <li>
  /// USA_NATIONAL_DRUG_CODE
  /// </li>
  /// <li>
  /// USA_HEALTH_INSURANCE_CLAIM_NUMBER
  /// </li>
  /// <li>
  /// USA_MEDICARE_BENEFICIARY_IDENTIFIER
  /// </li>
  /// <li>
  /// USA_CPT_CODE
  /// </li>
  /// <li>
  /// PERSON_NAME
  /// </li>
  /// <li>
  /// DATE
  /// </li>
  /// </ul>
  /// The Entity type group USA_ALL is also supported, and includes all of the
  /// above entity types except PERSON_NAME and DATE.
  final List<String> entityTypes;

  /// Configuration of statistics that are allowed to be run on columns that
  /// contain detected entities. When undefined, no statistics will be computed on
  /// columns that contain detected entities.
  final List<AllowedStatistics>? allowedStatistics;

  EntityDetectorConfiguration({
    required this.entityTypes,
    this.allowedStatistics,
  });

  factory EntityDetectorConfiguration.fromJson(Map<String, dynamic> json) {
    return EntityDetectorConfiguration(
      entityTypes: (json['EntityTypes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedStatistics: (json['AllowedStatistics'] as List?)
          ?.whereNotNull()
          .map((e) => AllowedStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityTypes = this.entityTypes;
    final allowedStatistics = this.allowedStatistics;
    return {
      'EntityTypes': entityTypes,
      if (allowedStatistics != null) 'AllowedStatistics': allowedStatistics,
    };
  }
}

/// Represents a set of options that define how DataBrew will interpret a
/// Microsoft Excel file when creating a dataset from that file.
class ExcelOptions {
  /// A variable that specifies whether the first row in the file is parsed as the
  /// header. If this value is false, column names are auto-generated.
  final bool? headerRow;

  /// One or more sheet numbers in the Excel file that will be included in the
  /// dataset.
  final List<int>? sheetIndexes;

  /// One or more named sheets in the Excel file that will be included in the
  /// dataset.
  final List<String>? sheetNames;

  ExcelOptions({
    this.headerRow,
    this.sheetIndexes,
    this.sheetNames,
  });

  factory ExcelOptions.fromJson(Map<String, dynamic> json) {
    return ExcelOptions(
      headerRow: json['HeaderRow'] as bool?,
      sheetIndexes: (json['SheetIndexes'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      sheetNames: (json['SheetNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final headerRow = this.headerRow;
    final sheetIndexes = this.sheetIndexes;
    final sheetNames = this.sheetNames;
    return {
      if (headerRow != null) 'HeaderRow': headerRow,
      if (sheetIndexes != null) 'SheetIndexes': sheetIndexes,
      if (sheetNames != null) 'SheetNames': sheetNames,
    };
  }
}

/// Represents a limit imposed on number of Amazon S3 files that should be
/// selected for a dataset from a connected Amazon S3 path.
class FilesLimit {
  /// The number of Amazon S3 files to select.
  final int maxFiles;

  /// A criteria to use for Amazon S3 files sorting before their selection. By
  /// default uses DESCENDING order, i.e. most recent files are selected first.
  /// Another possible value is ASCENDING.
  final Order? order;

  /// A criteria to use for Amazon S3 files sorting before their selection. By
  /// default uses LAST_MODIFIED_DATE as a sorting criteria. Currently it's the
  /// only allowed value.
  final OrderedBy? orderedBy;

  FilesLimit({
    required this.maxFiles,
    this.order,
    this.orderedBy,
  });

  factory FilesLimit.fromJson(Map<String, dynamic> json) {
    return FilesLimit(
      maxFiles: json['MaxFiles'] as int,
      order: (json['Order'] as String?)?.toOrder(),
      orderedBy: (json['OrderedBy'] as String?)?.toOrderedBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxFiles = this.maxFiles;
    final order = this.order;
    final orderedBy = this.orderedBy;
    return {
      'MaxFiles': maxFiles,
      if (order != null) 'Order': order.toValue(),
      if (orderedBy != null) 'OrderedBy': orderedBy.toValue(),
    };
  }
}

/// Represents a structure for defining parameter conditions. Supported
/// conditions are described here: <a
/// href="https://docs.aws.amazon.com/databrew/latest/dg/datasets.multiple-files.html#conditions.for.dynamic.datasets">Supported
/// conditions for dynamic datasets</a> in the <i>Glue DataBrew Developer
/// Guide</i>.
class FilterExpression {
  /// The expression which includes condition names followed by substitution
  /// variables, possibly grouped and combined with other conditions. For example,
  /// "(starts_with :prefix1 or starts_with :prefix2) and (ends_with :suffix1 or
  /// ends_with :suffix2)". Substitution variables should start with ':' symbol.
  final String expression;

  /// The map of substitution variable names to their values used in this filter
  /// expression.
  final Map<String, String> valuesMap;

  FilterExpression({
    required this.expression,
    required this.valuesMap,
  });

  factory FilterExpression.fromJson(Map<String, dynamic> json) {
    return FilterExpression(
      expression: json['Expression'] as String,
      valuesMap: (json['ValuesMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final valuesMap = this.valuesMap;
    return {
      'Expression': expression,
      'ValuesMap': valuesMap,
    };
  }
}

/// Represents a set of options that define the structure of either
/// comma-separated value (CSV), Excel, or JSON input.
class FormatOptions {
  /// Options that define how CSV input is to be interpreted by DataBrew.
  final CsvOptions? csv;

  /// Options that define how Excel input is to be interpreted by DataBrew.
  final ExcelOptions? excel;

  /// Options that define how JSON input is to be interpreted by DataBrew.
  final JsonOptions? json;

  FormatOptions({
    this.csv,
    this.excel,
    this.json,
  });

  factory FormatOptions.fromJson(Map<String, dynamic> json) {
    return FormatOptions(
      csv: json['Csv'] != null
          ? CsvOptions.fromJson(json['Csv'] as Map<String, dynamic>)
          : null,
      excel: json['Excel'] != null
          ? ExcelOptions.fromJson(json['Excel'] as Map<String, dynamic>)
          : null,
      json: json['Json'] != null
          ? JsonOptions.fromJson(json['Json'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csv = this.csv;
    final excel = this.excel;
    final json = this.json;
    return {
      if (csv != null) 'Csv': csv,
      if (excel != null) 'Excel': excel,
      if (json != null) 'Json': json,
    };
  }
}

/// Represents information on how DataBrew can find data, in either the Glue
/// Data Catalog or Amazon S3.
class Input {
  /// The Glue Data Catalog parameters for the data.
  final DataCatalogInputDefinition? dataCatalogInputDefinition;

  /// Connection information for dataset input files stored in a database.
  final DatabaseInputDefinition? databaseInputDefinition;

  /// Contains additional resource information needed for specific datasets.
  final Metadata? metadata;

  /// The Amazon S3 location where the data is stored.
  final S3Location? s3InputDefinition;

  Input({
    this.dataCatalogInputDefinition,
    this.databaseInputDefinition,
    this.metadata,
    this.s3InputDefinition,
  });

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      dataCatalogInputDefinition: json['DataCatalogInputDefinition'] != null
          ? DataCatalogInputDefinition.fromJson(
              json['DataCatalogInputDefinition'] as Map<String, dynamic>)
          : null,
      databaseInputDefinition: json['DatabaseInputDefinition'] != null
          ? DatabaseInputDefinition.fromJson(
              json['DatabaseInputDefinition'] as Map<String, dynamic>)
          : null,
      metadata: json['Metadata'] != null
          ? Metadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
      s3InputDefinition: json['S3InputDefinition'] != null
          ? S3Location.fromJson(
              json['S3InputDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCatalogInputDefinition = this.dataCatalogInputDefinition;
    final databaseInputDefinition = this.databaseInputDefinition;
    final metadata = this.metadata;
    final s3InputDefinition = this.s3InputDefinition;
    return {
      if (dataCatalogInputDefinition != null)
        'DataCatalogInputDefinition': dataCatalogInputDefinition,
      if (databaseInputDefinition != null)
        'DatabaseInputDefinition': databaseInputDefinition,
      if (metadata != null) 'Metadata': metadata,
      if (s3InputDefinition != null) 'S3InputDefinition': s3InputDefinition,
    };
  }
}

enum InputFormat {
  csv,
  json,
  parquet,
  excel,
  orc,
}

extension InputFormatValueExtension on InputFormat {
  String toValue() {
    switch (this) {
      case InputFormat.csv:
        return 'CSV';
      case InputFormat.json:
        return 'JSON';
      case InputFormat.parquet:
        return 'PARQUET';
      case InputFormat.excel:
        return 'EXCEL';
      case InputFormat.orc:
        return 'ORC';
    }
  }
}

extension InputFormatFromString on String {
  InputFormat toInputFormat() {
    switch (this) {
      case 'CSV':
        return InputFormat.csv;
      case 'JSON':
        return InputFormat.json;
      case 'PARQUET':
        return InputFormat.parquet;
      case 'EXCEL':
        return InputFormat.excel;
      case 'ORC':
        return InputFormat.orc;
    }
    throw Exception('$this is not known in enum InputFormat');
  }
}

/// Represents all of the attributes of a DataBrew job.
class Job {
  /// The unique name of the job.
  final String name;

  /// The ID of the Amazon Web Services account that owns the job.
  final String? accountId;

  /// The date and time that the job was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the job.
  final String? createdBy;

  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  final List<DataCatalogOutput>? dataCatalogOutputs;

  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write into.
  final List<DatabaseOutput>? databaseOutputs;

  /// A dataset that the job is to process.
  final String? datasetName;

  /// The Amazon Resource Name (ARN) of an encryption key that is used to protect
  /// the job output. For more information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/encryption-security-configuration.html">Encrypting
  /// data written by DataBrew jobs</a>
  final String? encryptionKeyArn;

  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with keys managed by KMS.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon S3.
  /// </li>
  /// </ul>
  final EncryptionMode? encryptionMode;

  /// A sample configuration for profile jobs only, which determines the number of
  /// rows on which the profile job is run. If a <code>JobSample</code> value
  /// isn't provided, the default value is used. The default value is CUSTOM_ROWS
  /// for the mode parameter and 20,000 for the size parameter.
  final JobSample? jobSample;

  /// The Amazon Resource Name (ARN) of the user who last modified the job.
  final String? lastModifiedBy;

  /// The modification date and time of the job.
  final DateTime? lastModifiedDate;

  /// The current status of Amazon CloudWatch logging for the job.
  final LogSubscription? logSubscription;

  /// The maximum number of nodes that can be consumed when the job processes
  /// data.
  final int? maxCapacity;

  /// The maximum number of times to retry the job after a job run fails.
  final int? maxRetries;

  /// One or more artifacts that represent output from running the job.
  final List<Output>? outputs;

  /// The name of the project that the job is associated with.
  final String? projectName;

  /// A set of steps that the job runs.
  final RecipeReference? recipeReference;

  /// The unique Amazon Resource Name (ARN) for the job.
  final String? resourceArn;

  /// The Amazon Resource Name (ARN) of the role to be assumed for this job.
  final String? roleArn;

  /// Metadata tags that have been applied to the job.
  final Map<String, String>? tags;

  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  final int? timeout;

  /// The job type of the job, which must be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PROFILE</code> - A job to analyze a dataset, to determine its size,
  /// data types, data distribution, and more.
  /// </li>
  /// <li>
  /// <code>RECIPE</code> - A job to apply one or more transformations to a
  /// dataset.
  /// </li>
  /// </ul>
  final JobType? type;

  /// List of validation configurations that are applied to the profile job.
  final List<ValidationConfiguration>? validationConfigurations;

  Job({
    required this.name,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.dataCatalogOutputs,
    this.databaseOutputs,
    this.datasetName,
    this.encryptionKeyArn,
    this.encryptionMode,
    this.jobSample,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.logSubscription,
    this.maxCapacity,
    this.maxRetries,
    this.outputs,
    this.projectName,
    this.recipeReference,
    this.resourceArn,
    this.roleArn,
    this.tags,
    this.timeout,
    this.type,
    this.validationConfigurations,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      name: json['Name'] as String,
      accountId: json['AccountId'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      dataCatalogOutputs: (json['DataCatalogOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DataCatalogOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseOutputs: (json['DatabaseOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DatabaseOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasetName: json['DatasetName'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionMode: (json['EncryptionMode'] as String?)?.toEncryptionMode(),
      jobSample: json['JobSample'] != null
          ? JobSample.fromJson(json['JobSample'] as Map<String, dynamic>)
          : null,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      logSubscription:
          (json['LogSubscription'] as String?)?.toLogSubscription(),
      maxCapacity: json['MaxCapacity'] as int?,
      maxRetries: json['MaxRetries'] as int?,
      outputs: (json['Outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectName: json['ProjectName'] as String?,
      recipeReference: json['RecipeReference'] != null
          ? RecipeReference.fromJson(
              json['RecipeReference'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeout: json['Timeout'] as int?,
      type: (json['Type'] as String?)?.toJobType(),
      validationConfigurations: (json['ValidationConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final accountId = this.accountId;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final dataCatalogOutputs = this.dataCatalogOutputs;
    final databaseOutputs = this.databaseOutputs;
    final datasetName = this.datasetName;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionMode = this.encryptionMode;
    final jobSample = this.jobSample;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final logSubscription = this.logSubscription;
    final maxCapacity = this.maxCapacity;
    final maxRetries = this.maxRetries;
    final outputs = this.outputs;
    final projectName = this.projectName;
    final recipeReference = this.recipeReference;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    final tags = this.tags;
    final timeout = this.timeout;
    final type = this.type;
    final validationConfigurations = this.validationConfigurations;
    return {
      'Name': name,
      if (accountId != null) 'AccountId': accountId,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (datasetName != null) 'DatasetName': datasetName,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (jobSample != null) 'JobSample': jobSample,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (outputs != null) 'Outputs': outputs,
      if (projectName != null) 'ProjectName': projectName,
      if (recipeReference != null) 'RecipeReference': recipeReference,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
      if (type != null) 'Type': type.toValue(),
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
  }
}

/// Represents one run of a DataBrew job.
class JobRun {
  /// The number of times that DataBrew has attempted to run the job.
  final int? attempt;

  /// The date and time when the job completed processing.
  final DateTime? completedOn;

  /// One or more artifacts that represent the Glue Data Catalog output from
  /// running the job.
  final List<DataCatalogOutput>? dataCatalogOutputs;

  /// Represents a list of JDBC database output objects which defines the output
  /// destination for a DataBrew recipe job to write into.
  final List<DatabaseOutput>? databaseOutputs;

  /// The name of the dataset for the job to process.
  final String? datasetName;

  /// A message indicating an error (if any) that was encountered when the job
  /// ran.
  final String? errorMessage;

  /// The amount of time, in seconds, during which a job run consumed resources.
  final int? executionTime;

  /// The name of the job being processed during this run.
  final String? jobName;

  /// A sample configuration for profile jobs only, which determines the number of
  /// rows on which the profile job is run. If a <code>JobSample</code> value
  /// isn't provided, the default is used. The default value is CUSTOM_ROWS for
  /// the mode parameter and 20,000 for the size parameter.
  final JobSample? jobSample;

  /// The name of an Amazon CloudWatch log group, where the job writes diagnostic
  /// messages when it runs.
  final String? logGroupName;

  /// The current status of Amazon CloudWatch logging for the job run.
  final LogSubscription? logSubscription;

  /// One or more output artifacts from a job run.
  final List<Output>? outputs;

  /// The set of steps processed by the job.
  final RecipeReference? recipeReference;

  /// The unique identifier of the job run.
  final String? runId;

  /// The Amazon Resource Name (ARN) of the user who initiated the job run.
  final String? startedBy;

  /// The date and time when the job run began.
  final DateTime? startedOn;

  /// The current state of the job run entity itself.
  final JobRunState? state;

  /// List of validation configurations that are applied to the profile job run.
  final List<ValidationConfiguration>? validationConfigurations;

  JobRun({
    this.attempt,
    this.completedOn,
    this.dataCatalogOutputs,
    this.databaseOutputs,
    this.datasetName,
    this.errorMessage,
    this.executionTime,
    this.jobName,
    this.jobSample,
    this.logGroupName,
    this.logSubscription,
    this.outputs,
    this.recipeReference,
    this.runId,
    this.startedBy,
    this.startedOn,
    this.state,
    this.validationConfigurations,
  });

  factory JobRun.fromJson(Map<String, dynamic> json) {
    return JobRun(
      attempt: json['Attempt'] as int?,
      completedOn: timeStampFromJson(json['CompletedOn']),
      dataCatalogOutputs: (json['DataCatalogOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DataCatalogOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseOutputs: (json['DatabaseOutputs'] as List?)
          ?.whereNotNull()
          .map((e) => DatabaseOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasetName: json['DatasetName'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      executionTime: json['ExecutionTime'] as int?,
      jobName: json['JobName'] as String?,
      jobSample: json['JobSample'] != null
          ? JobSample.fromJson(json['JobSample'] as Map<String, dynamic>)
          : null,
      logGroupName: json['LogGroupName'] as String?,
      logSubscription:
          (json['LogSubscription'] as String?)?.toLogSubscription(),
      outputs: (json['Outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipeReference: json['RecipeReference'] != null
          ? RecipeReference.fromJson(
              json['RecipeReference'] as Map<String, dynamic>)
          : null,
      runId: json['RunId'] as String?,
      startedBy: json['StartedBy'] as String?,
      startedOn: timeStampFromJson(json['StartedOn']),
      state: (json['State'] as String?)?.toJobRunState(),
      validationConfigurations: (json['ValidationConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attempt = this.attempt;
    final completedOn = this.completedOn;
    final dataCatalogOutputs = this.dataCatalogOutputs;
    final databaseOutputs = this.databaseOutputs;
    final datasetName = this.datasetName;
    final errorMessage = this.errorMessage;
    final executionTime = this.executionTime;
    final jobName = this.jobName;
    final jobSample = this.jobSample;
    final logGroupName = this.logGroupName;
    final logSubscription = this.logSubscription;
    final outputs = this.outputs;
    final recipeReference = this.recipeReference;
    final runId = this.runId;
    final startedBy = this.startedBy;
    final startedOn = this.startedOn;
    final state = this.state;
    final validationConfigurations = this.validationConfigurations;
    return {
      if (attempt != null) 'Attempt': attempt,
      if (completedOn != null) 'CompletedOn': unixTimestampToJson(completedOn),
      if (dataCatalogOutputs != null) 'DataCatalogOutputs': dataCatalogOutputs,
      if (databaseOutputs != null) 'DatabaseOutputs': databaseOutputs,
      if (datasetName != null) 'DatasetName': datasetName,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (executionTime != null) 'ExecutionTime': executionTime,
      if (jobName != null) 'JobName': jobName,
      if (jobSample != null) 'JobSample': jobSample,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (outputs != null) 'Outputs': outputs,
      if (recipeReference != null) 'RecipeReference': recipeReference,
      if (runId != null) 'RunId': runId,
      if (startedBy != null) 'StartedBy': startedBy,
      if (startedOn != null) 'StartedOn': unixTimestampToJson(startedOn),
      if (state != null) 'State': state.toValue(),
      if (validationConfigurations != null)
        'ValidationConfigurations': validationConfigurations,
    };
  }
}

enum JobRunState {
  starting,
  running,
  stopping,
  stopped,
  succeeded,
  failed,
  timeout,
}

extension JobRunStateValueExtension on JobRunState {
  String toValue() {
    switch (this) {
      case JobRunState.starting:
        return 'STARTING';
      case JobRunState.running:
        return 'RUNNING';
      case JobRunState.stopping:
        return 'STOPPING';
      case JobRunState.stopped:
        return 'STOPPED';
      case JobRunState.succeeded:
        return 'SUCCEEDED';
      case JobRunState.failed:
        return 'FAILED';
      case JobRunState.timeout:
        return 'TIMEOUT';
    }
  }
}

extension JobRunStateFromString on String {
  JobRunState toJobRunState() {
    switch (this) {
      case 'STARTING':
        return JobRunState.starting;
      case 'RUNNING':
        return JobRunState.running;
      case 'STOPPING':
        return JobRunState.stopping;
      case 'STOPPED':
        return JobRunState.stopped;
      case 'SUCCEEDED':
        return JobRunState.succeeded;
      case 'FAILED':
        return JobRunState.failed;
      case 'TIMEOUT':
        return JobRunState.timeout;
    }
    throw Exception('$this is not known in enum JobRunState');
  }
}

/// A sample configuration for profile jobs only, which determines the number of
/// rows on which the profile job is run. If a <code>JobSample</code> value
/// isn't provided, the default is used. The default value is CUSTOM_ROWS for
/// the mode parameter and 20,000 for the size parameter.
class JobSample {
  /// A value that determines whether the profile job is run on the entire dataset
  /// or a specified number of rows. This value must be one of the following:
  ///
  /// <ul>
  /// <li>
  /// FULL_DATASET - The profile job is run on the entire dataset.
  /// </li>
  /// <li>
  /// CUSTOM_ROWS - The profile job is run on the number of rows specified in the
  /// <code>Size</code> parameter.
  /// </li>
  /// </ul>
  final SampleMode? mode;

  /// The <code>Size</code> parameter is only required when the mode is
  /// CUSTOM_ROWS. The profile job is run on the specified number of rows. The
  /// maximum value for size is Long.MAX_VALUE.
  ///
  /// Long.MAX_VALUE = 9223372036854775807
  final int? size;

  JobSample({
    this.mode,
    this.size,
  });

  factory JobSample.fromJson(Map<String, dynamic> json) {
    return JobSample(
      mode: (json['Mode'] as String?)?.toSampleMode(),
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final size = this.size;
    return {
      if (mode != null) 'Mode': mode.toValue(),
      if (size != null) 'Size': size,
    };
  }
}

enum JobType {
  profile,
  recipe,
}

extension JobTypeValueExtension on JobType {
  String toValue() {
    switch (this) {
      case JobType.profile:
        return 'PROFILE';
      case JobType.recipe:
        return 'RECIPE';
    }
  }
}

extension JobTypeFromString on String {
  JobType toJobType() {
    switch (this) {
      case 'PROFILE':
        return JobType.profile;
      case 'RECIPE':
        return JobType.recipe;
    }
    throw Exception('$this is not known in enum JobType');
  }
}

/// Represents the JSON-specific options that define how input is to be
/// interpreted by Glue DataBrew.
class JsonOptions {
  /// A value that specifies whether JSON input contains embedded new line
  /// characters.
  final bool? multiLine;

  JsonOptions({
    this.multiLine,
  });

  factory JsonOptions.fromJson(Map<String, dynamic> json) {
    return JsonOptions(
      multiLine: json['MultiLine'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiLine = this.multiLine;
    return {
      if (multiLine != null) 'MultiLine': multiLine,
    };
  }
}

class ListDatasetsResponse {
  /// A list of datasets that are defined.
  final List<Dataset> datasets;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListDatasetsResponse({
    required this.datasets,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasets: (json['Datasets'] as List)
          .whereNotNull()
          .map((e) => Dataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      'Datasets': datasets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobRunsResponse {
  /// A list of job runs that have occurred for the specified job.
  final List<JobRun> jobRuns;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListJobRunsResponse({
    required this.jobRuns,
    this.nextToken,
  });

  factory ListJobRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobRunsResponse(
      jobRuns: (json['JobRuns'] as List)
          .whereNotNull()
          .map((e) => JobRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRuns = this.jobRuns;
    final nextToken = this.nextToken;
    return {
      'JobRuns': jobRuns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobsResponse {
  /// A list of jobs that are defined.
  final List<Job> jobs;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListJobsResponse({
    required this.jobs,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: (json['Jobs'] as List)
          .whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'Jobs': jobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProjectsResponse {
  /// A list of projects that are defined .
  final List<Project> projects;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListProjectsResponse({
    required this.projects,
    this.nextToken,
  });

  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      projects: (json['Projects'] as List)
          .whereNotNull()
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projects = this.projects;
    final nextToken = this.nextToken;
    return {
      'Projects': projects,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRecipeVersionsResponse {
  /// A list of versions for the specified recipe.
  final List<Recipe> recipes;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListRecipeVersionsResponse({
    required this.recipes,
    this.nextToken,
  });

  factory ListRecipeVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecipeVersionsResponse(
      recipes: (json['Recipes'] as List)
          .whereNotNull()
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recipes = this.recipes;
    final nextToken = this.nextToken;
    return {
      'Recipes': recipes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRecipesResponse {
  /// A list of recipes that are defined.
  final List<Recipe> recipes;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListRecipesResponse({
    required this.recipes,
    this.nextToken,
  });

  factory ListRecipesResponse.fromJson(Map<String, dynamic> json) {
    return ListRecipesResponse(
      recipes: (json['Recipes'] as List)
          .whereNotNull()
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recipes = this.recipes;
    final nextToken = this.nextToken;
    return {
      'Recipes': recipes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRulesetsResponse {
  /// A list of RulesetItem. RulesetItem contains meta data of a ruleset.
  final List<RulesetItem> rulesets;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListRulesetsResponse({
    required this.rulesets,
    this.nextToken,
  });

  factory ListRulesetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesetsResponse(
      rulesets: (json['Rulesets'] as List)
          .whereNotNull()
          .map((e) => RulesetItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rulesets = this.rulesets;
    final nextToken = this.nextToken;
    return {
      'Rulesets': rulesets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSchedulesResponse {
  /// A list of schedules that are defined.
  final List<Schedule> schedules;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListSchedulesResponse({
    required this.schedules,
    this.nextToken,
  });

  factory ListSchedulesResponse.fromJson(Map<String, dynamic> json) {
    return ListSchedulesResponse(
      schedules: (json['Schedules'] as List)
          .whereNotNull()
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schedules = this.schedules;
    final nextToken = this.nextToken;
    return {
      'Schedules': schedules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags associated with the DataBrew resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum LogSubscription {
  enable,
  disable,
}

extension LogSubscriptionValueExtension on LogSubscription {
  String toValue() {
    switch (this) {
      case LogSubscription.enable:
        return 'ENABLE';
      case LogSubscription.disable:
        return 'DISABLE';
    }
  }
}

extension LogSubscriptionFromString on String {
  LogSubscription toLogSubscription() {
    switch (this) {
      case 'ENABLE':
        return LogSubscription.enable;
      case 'DISABLE':
        return LogSubscription.disable;
    }
    throw Exception('$this is not known in enum LogSubscription');
  }
}

/// Contains additional resource information needed for specific datasets.
class Metadata {
  /// The Amazon Resource Name (ARN) associated with the dataset. Currently,
  /// DataBrew only supports ARNs from Amazon AppFlow.
  final String? sourceArn;

  Metadata({
    this.sourceArn,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      sourceArn: json['SourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceArn = this.sourceArn;
    return {
      if (sourceArn != null) 'SourceArn': sourceArn,
    };
  }
}

enum Order {
  descending,
  ascending,
}

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.descending:
        return 'DESCENDING';
      case Order.ascending:
        return 'ASCENDING';
    }
  }
}

extension OrderFromString on String {
  Order toOrder() {
    switch (this) {
      case 'DESCENDING':
        return Order.descending;
      case 'ASCENDING':
        return Order.ascending;
    }
    throw Exception('$this is not known in enum Order');
  }
}

enum OrderedBy {
  lastModifiedDate,
}

extension OrderedByValueExtension on OrderedBy {
  String toValue() {
    switch (this) {
      case OrderedBy.lastModifiedDate:
        return 'LAST_MODIFIED_DATE';
    }
  }
}

extension OrderedByFromString on String {
  OrderedBy toOrderedBy() {
    switch (this) {
      case 'LAST_MODIFIED_DATE':
        return OrderedBy.lastModifiedDate;
    }
    throw Exception('$this is not known in enum OrderedBy');
  }
}

/// Represents options that specify how and where in Amazon S3 DataBrew writes
/// the output generated by recipe jobs or profile jobs.
class Output {
  /// The location in Amazon S3 where the job writes its output.
  final S3Location location;

  /// The compression algorithm used to compress the output text of the job.
  final CompressionFormat? compressionFormat;

  /// The data format of the output of the job.
  final OutputFormat? format;

  /// Represents options that define how DataBrew formats job output files.
  final OutputFormatOptions? formatOptions;

  /// Maximum number of files to be generated by the job and written to the output
  /// folder. For output partitioned by column(s), the MaxOutputFiles value is the
  /// maximum number of files per partition.
  final int? maxOutputFiles;

  /// A value that, if true, means that any data in the location specified for
  /// output is overwritten with new output.
  final bool? overwrite;

  /// The names of one or more partition columns for the output of the job.
  final List<String>? partitionColumns;

  Output({
    required this.location,
    this.compressionFormat,
    this.format,
    this.formatOptions,
    this.maxOutputFiles,
    this.overwrite,
    this.partitionColumns,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      location: S3Location.fromJson(json['Location'] as Map<String, dynamic>),
      compressionFormat:
          (json['CompressionFormat'] as String?)?.toCompressionFormat(),
      format: (json['Format'] as String?)?.toOutputFormat(),
      formatOptions: json['FormatOptions'] != null
          ? OutputFormatOptions.fromJson(
              json['FormatOptions'] as Map<String, dynamic>)
          : null,
      maxOutputFiles: json['MaxOutputFiles'] as int?,
      overwrite: json['Overwrite'] as bool?,
      partitionColumns: (json['PartitionColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final compressionFormat = this.compressionFormat;
    final format = this.format;
    final formatOptions = this.formatOptions;
    final maxOutputFiles = this.maxOutputFiles;
    final overwrite = this.overwrite;
    final partitionColumns = this.partitionColumns;
    return {
      'Location': location,
      if (compressionFormat != null)
        'CompressionFormat': compressionFormat.toValue(),
      if (format != null) 'Format': format.toValue(),
      if (formatOptions != null) 'FormatOptions': formatOptions,
      if (maxOutputFiles != null) 'MaxOutputFiles': maxOutputFiles,
      if (overwrite != null) 'Overwrite': overwrite,
      if (partitionColumns != null) 'PartitionColumns': partitionColumns,
    };
  }
}

enum OutputFormat {
  csv,
  json,
  parquet,
  glueparquet,
  avro,
  orc,
  xml,
  tableauhyper,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.csv:
        return 'CSV';
      case OutputFormat.json:
        return 'JSON';
      case OutputFormat.parquet:
        return 'PARQUET';
      case OutputFormat.glueparquet:
        return 'GLUEPARQUET';
      case OutputFormat.avro:
        return 'AVRO';
      case OutputFormat.orc:
        return 'ORC';
      case OutputFormat.xml:
        return 'XML';
      case OutputFormat.tableauhyper:
        return 'TABLEAUHYPER';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'CSV':
        return OutputFormat.csv;
      case 'JSON':
        return OutputFormat.json;
      case 'PARQUET':
        return OutputFormat.parquet;
      case 'GLUEPARQUET':
        return OutputFormat.glueparquet;
      case 'AVRO':
        return OutputFormat.avro;
      case 'ORC':
        return OutputFormat.orc;
      case 'XML':
        return OutputFormat.xml;
      case 'TABLEAUHYPER':
        return OutputFormat.tableauhyper;
    }
    throw Exception('$this is not known in enum OutputFormat');
  }
}

/// Represents a set of options that define the structure of comma-separated
/// (CSV) job output.
class OutputFormatOptions {
  /// Represents a set of options that define the structure of comma-separated
  /// value (CSV) job output.
  final CsvOutputOptions? csv;

  OutputFormatOptions({
    this.csv,
  });

  factory OutputFormatOptions.fromJson(Map<String, dynamic> json) {
    return OutputFormatOptions(
      csv: json['Csv'] != null
          ? CsvOutputOptions.fromJson(json['Csv'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csv = this.csv;
    return {
      if (csv != null) 'Csv': csv,
    };
  }
}

enum ParameterType {
  datetime,
  number,
  string,
}

extension ParameterTypeValueExtension on ParameterType {
  String toValue() {
    switch (this) {
      case ParameterType.datetime:
        return 'Datetime';
      case ParameterType.number:
        return 'Number';
      case ParameterType.string:
        return 'String';
    }
  }
}

extension ParameterTypeFromString on String {
  ParameterType toParameterType() {
    switch (this) {
      case 'Datetime':
        return ParameterType.datetime;
      case 'Number':
        return ParameterType.number;
      case 'String':
        return ParameterType.string;
    }
    throw Exception('$this is not known in enum ParameterType');
  }
}

/// Represents a set of options that define how DataBrew selects files for a
/// given Amazon S3 path in a dataset.
class PathOptions {
  /// If provided, this structure imposes a limit on a number of files that should
  /// be selected.
  final FilesLimit? filesLimit;

  /// If provided, this structure defines a date range for matching Amazon S3
  /// objects based on their LastModifiedDate attribute in Amazon S3.
  final FilterExpression? lastModifiedDateCondition;

  /// A structure that maps names of parameters used in the Amazon S3 path of a
  /// dataset to their definitions.
  final Map<String, DatasetParameter>? parameters;

  PathOptions({
    this.filesLimit,
    this.lastModifiedDateCondition,
    this.parameters,
  });

  factory PathOptions.fromJson(Map<String, dynamic> json) {
    return PathOptions(
      filesLimit: json['FilesLimit'] != null
          ? FilesLimit.fromJson(json['FilesLimit'] as Map<String, dynamic>)
          : null,
      lastModifiedDateCondition: json['LastModifiedDateCondition'] != null
          ? FilterExpression.fromJson(
              json['LastModifiedDateCondition'] as Map<String, dynamic>)
          : null,
      parameters: (json['Parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, DatasetParameter.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final filesLimit = this.filesLimit;
    final lastModifiedDateCondition = this.lastModifiedDateCondition;
    final parameters = this.parameters;
    return {
      if (filesLimit != null) 'FilesLimit': filesLimit,
      if (lastModifiedDateCondition != null)
        'LastModifiedDateCondition': lastModifiedDateCondition,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Configuration for profile jobs. Configuration can be used to select columns,
/// do evaluations, and override default parameters of evaluations. When
/// configuration is undefined, the profile job will apply default settings to
/// all supported columns.
class ProfileConfiguration {
  /// List of configurations for column evaluations.
  /// ColumnStatisticsConfigurations are used to select evaluations and override
  /// parameters of evaluations for particular columns. When
  /// ColumnStatisticsConfigurations is undefined, the profile job will profile
  /// all supported columns and run all supported evaluations.
  final List<ColumnStatisticsConfiguration>? columnStatisticsConfigurations;

  /// Configuration for inter-column evaluations. Configuration can be used to
  /// select evaluations and override parameters of evaluations. When
  /// configuration is undefined, the profile job will run all supported
  /// inter-column evaluations.
  final StatisticsConfiguration? datasetStatisticsConfiguration;

  /// Configuration of entity detection for a profile job. When undefined, entity
  /// detection is disabled.
  final EntityDetectorConfiguration? entityDetectorConfiguration;

  /// List of column selectors. ProfileColumns can be used to select columns from
  /// the dataset. When ProfileColumns is undefined, the profile job will profile
  /// all supported columns.
  final List<ColumnSelector>? profileColumns;

  ProfileConfiguration({
    this.columnStatisticsConfigurations,
    this.datasetStatisticsConfiguration,
    this.entityDetectorConfiguration,
    this.profileColumns,
  });

  factory ProfileConfiguration.fromJson(Map<String, dynamic> json) {
    return ProfileConfiguration(
      columnStatisticsConfigurations: (json['ColumnStatisticsConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ColumnStatisticsConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasetStatisticsConfiguration: json['DatasetStatisticsConfiguration'] !=
              null
          ? StatisticsConfiguration.fromJson(
              json['DatasetStatisticsConfiguration'] as Map<String, dynamic>)
          : null,
      entityDetectorConfiguration: json['EntityDetectorConfiguration'] != null
          ? EntityDetectorConfiguration.fromJson(
              json['EntityDetectorConfiguration'] as Map<String, dynamic>)
          : null,
      profileColumns: (json['ProfileColumns'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnStatisticsConfigurations = this.columnStatisticsConfigurations;
    final datasetStatisticsConfiguration = this.datasetStatisticsConfiguration;
    final entityDetectorConfiguration = this.entityDetectorConfiguration;
    final profileColumns = this.profileColumns;
    return {
      if (columnStatisticsConfigurations != null)
        'ColumnStatisticsConfigurations': columnStatisticsConfigurations,
      if (datasetStatisticsConfiguration != null)
        'DatasetStatisticsConfiguration': datasetStatisticsConfiguration,
      if (entityDetectorConfiguration != null)
        'EntityDetectorConfiguration': entityDetectorConfiguration,
      if (profileColumns != null) 'ProfileColumns': profileColumns,
    };
  }
}

/// Represents all of the attributes of a DataBrew project.
class Project {
  /// The unique name of a project.
  final String name;

  /// The name of a recipe that will be developed during a project session.
  final String recipeName;

  /// The ID of the Amazon Web Services account that owns the project.
  final String? accountId;

  /// The date and time that the project was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who crated the project.
  final String? createdBy;

  /// The dataset that the project is to act upon.
  final String? datasetName;

  /// The Amazon Resource Name (ARN) of the user who last modified the project.
  final String? lastModifiedBy;

  /// The last modification date and time for the project.
  final DateTime? lastModifiedDate;

  /// The date and time when the project was opened.
  final DateTime? openDate;

  /// The Amazon Resource Name (ARN) of the user that opened the project for use.
  final String? openedBy;

  /// The Amazon Resource Name (ARN) for the project.
  final String? resourceArn;

  /// The Amazon Resource Name (ARN) of the role that will be assumed for this
  /// project.
  final String? roleArn;

  /// The sample size and sampling type to apply to the data. If this parameter
  /// isn't specified, then the sample consists of the first 500 rows from the
  /// dataset.
  final Sample? sample;

  /// Metadata tags that have been applied to the project.
  final Map<String, String>? tags;

  Project({
    required this.name,
    required this.recipeName,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.datasetName,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.openDate,
    this.openedBy,
    this.resourceArn,
    this.roleArn,
    this.sample,
    this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['Name'] as String,
      recipeName: json['RecipeName'] as String,
      accountId: json['AccountId'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      datasetName: json['DatasetName'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      openDate: timeStampFromJson(json['OpenDate']),
      openedBy: json['OpenedBy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      sample: json['Sample'] != null
          ? Sample.fromJson(json['Sample'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recipeName = this.recipeName;
    final accountId = this.accountId;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final datasetName = this.datasetName;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final openDate = this.openDate;
    final openedBy = this.openedBy;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    final sample = this.sample;
    final tags = this.tags;
    return {
      'Name': name,
      'RecipeName': recipeName,
      if (accountId != null) 'AccountId': accountId,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (datasetName != null) 'DatasetName': datasetName,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (openDate != null) 'OpenDate': unixTimestampToJson(openDate),
      if (openedBy != null) 'OpenedBy': openedBy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sample != null) 'Sample': sample,
      if (tags != null) 'Tags': tags,
    };
  }
}

class PublishRecipeResponse {
  /// The name of the recipe that you published.
  final String name;

  PublishRecipeResponse({
    required this.name,
  });

  factory PublishRecipeResponse.fromJson(Map<String, dynamic> json) {
    return PublishRecipeResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Represents one or more actions to be performed on a DataBrew dataset.
class Recipe {
  /// The unique name for the recipe.
  final String name;

  /// The date and time that the recipe was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the recipe.
  final String? createdBy;

  /// The description of the recipe.
  final String? description;

  /// The Amazon Resource Name (ARN) of the user who last modified the recipe.
  final String? lastModifiedBy;

  /// The last modification date and time of the recipe.
  final DateTime? lastModifiedDate;

  /// The name of the project that the recipe is associated with.
  final String? projectName;

  /// The Amazon Resource Name (ARN) of the user who published the recipe.
  final String? publishedBy;

  /// The date and time when the recipe was published.
  final DateTime? publishedDate;

  /// The identifier for the version for the recipe. Must be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Numeric version (<code>X.Y</code>) - <code>X</code> and <code>Y</code> stand
  /// for major and minor version numbers. The maximum length of each is 6 digits,
  /// and neither can be negative values. Both <code>X</code> and <code>Y</code>
  /// are required, and "0.0" isn't a valid version.
  /// </li>
  /// <li>
  /// <code>LATEST_WORKING</code> - the most recent valid version being developed
  /// in a DataBrew project.
  /// </li>
  /// <li>
  /// <code>LATEST_PUBLISHED</code> - the most recent published version.
  /// </li>
  /// </ul>
  final String? recipeVersion;

  /// The Amazon Resource Name (ARN) for the recipe.
  final String? resourceArn;

  /// A list of steps that are defined by the recipe.
  final List<RecipeStep>? steps;

  /// Metadata tags that have been applied to the recipe.
  final Map<String, String>? tags;

  Recipe({
    required this.name,
    this.createDate,
    this.createdBy,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.projectName,
    this.publishedBy,
    this.publishedDate,
    this.recipeVersion,
    this.resourceArn,
    this.steps,
    this.tags,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['Name'] as String,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      projectName: json['ProjectName'] as String?,
      publishedBy: json['PublishedBy'] as String?,
      publishedDate: timeStampFromJson(json['PublishedDate']),
      recipeVersion: json['RecipeVersion'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      steps: (json['Steps'] as List?)
          ?.whereNotNull()
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final description = this.description;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final projectName = this.projectName;
    final publishedBy = this.publishedBy;
    final publishedDate = this.publishedDate;
    final recipeVersion = this.recipeVersion;
    final resourceArn = this.resourceArn;
    final steps = this.steps;
    final tags = this.tags;
    return {
      'Name': name,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (projectName != null) 'ProjectName': projectName,
      if (publishedBy != null) 'PublishedBy': publishedBy,
      if (publishedDate != null)
        'PublishedDate': unixTimestampToJson(publishedDate),
      if (recipeVersion != null) 'RecipeVersion': recipeVersion,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (steps != null) 'Steps': steps,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents a transformation and associated parameters that are used to apply
/// a change to a DataBrew dataset. For more information, see <a
/// href="https://docs.aws.amazon.com/databrew/latest/dg/recipe-actions-reference.html">Recipe
/// actions reference</a>.
class RecipeAction {
  /// The name of a valid DataBrew transformation to be performed on the data.
  final String operation;

  /// Contextual parameters for the transformation.
  final Map<String, String>? parameters;

  RecipeAction({
    required this.operation,
    this.parameters,
  });

  factory RecipeAction.fromJson(Map<String, dynamic> json) {
    return RecipeAction(
      operation: json['Operation'] as String,
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final parameters = this.parameters;
    return {
      'Operation': operation,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Represents the name and version of a DataBrew recipe.
class RecipeReference {
  /// The name of the recipe.
  final String name;

  /// The identifier for the version for the recipe.
  final String? recipeVersion;

  RecipeReference({
    required this.name,
    this.recipeVersion,
  });

  factory RecipeReference.fromJson(Map<String, dynamic> json) {
    return RecipeReference(
      name: json['Name'] as String,
      recipeVersion: json['RecipeVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recipeVersion = this.recipeVersion;
    return {
      'Name': name,
      if (recipeVersion != null) 'RecipeVersion': recipeVersion,
    };
  }
}

/// Represents a single step from a DataBrew recipe to be performed.
class RecipeStep {
  /// The particular action to be performed in the recipe step.
  final RecipeAction action;

  /// One or more conditions that must be met for the recipe step to succeed.
  /// <note>
  /// All of the conditions in the array must be met. In other words, all of the
  /// conditions must be combined using a logical AND operation.
  /// </note>
  final List<ConditionExpression>? conditionExpressions;

  RecipeStep({
    required this.action,
    this.conditionExpressions,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      action: RecipeAction.fromJson(json['Action'] as Map<String, dynamic>),
      conditionExpressions: (json['ConditionExpressions'] as List?)
          ?.whereNotNull()
          .map((e) => ConditionExpression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final conditionExpressions = this.conditionExpressions;
    return {
      'Action': action,
      if (conditionExpressions != null)
        'ConditionExpressions': conditionExpressions,
    };
  }
}

/// Represents any errors encountered when attempting to delete multiple recipe
/// versions.
class RecipeVersionErrorDetail {
  /// The HTTP status code for the error.
  final String? errorCode;

  /// The text of the error message.
  final String? errorMessage;

  /// The identifier for the recipe version associated with this error.
  final String? recipeVersion;

  RecipeVersionErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.recipeVersion,
  });

  factory RecipeVersionErrorDetail.fromJson(Map<String, dynamic> json) {
    return RecipeVersionErrorDetail(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      recipeVersion: json['RecipeVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final recipeVersion = this.recipeVersion;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (recipeVersion != null) 'RecipeVersion': recipeVersion,
    };
  }
}

/// Represents a single data quality requirement that should be validated in the
/// scope of this dataset.
class Rule {
  /// The expression which includes column references, condition names followed by
  /// variable references, possibly grouped and combined with other conditions.
  /// For example, <code>(:col1 starts_with :prefix1 or :col1 starts_with
  /// :prefix2) and (:col1 ends_with :suffix1 or :col1 ends_with :suffix2)</code>.
  /// Column and value references are substitution variables that should start
  /// with the ':' symbol. Depending on the context, substitution variables'
  /// values can be either an actual value or a column name. These values are
  /// defined in the SubstitutionMap. If a CheckExpression starts with a column
  /// reference, then ColumnSelectors in the rule should be null. If
  /// ColumnSelectors has been defined, then there should be no column reference
  /// in the left side of a condition, for example, <code>is_between :val1 and
  /// :val2</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/profile.data-quality-available-checks.html">Available
  /// checks</a>
  final String checkExpression;

  /// The name of the rule.
  final String name;

  /// List of column selectors. Selectors can be used to select columns using a
  /// name or regular expression from the dataset. Rule will be applied to
  /// selected columns.
  final List<ColumnSelector>? columnSelectors;

  /// A value that specifies whether the rule is disabled. Once a rule is
  /// disabled, a profile job will not validate it during a job run. Default value
  /// is false.
  final bool? disabled;

  /// The map of substitution variable names to their values used in a check
  /// expression. Variable names should start with a ':' (colon). Variable values
  /// can either be actual values or column names. To differentiate between the
  /// two, column names should be enclosed in backticks, for example,
  /// <code>":col1": "`Column A`".</code>
  final Map<String, String>? substitutionMap;

  /// The threshold used with a non-aggregate check expression. Non-aggregate
  /// check expressions will be applied to each row in a specific column, and the
  /// threshold will be used to determine whether the validation succeeds.
  final Threshold? threshold;

  Rule({
    required this.checkExpression,
    required this.name,
    this.columnSelectors,
    this.disabled,
    this.substitutionMap,
    this.threshold,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      checkExpression: json['CheckExpression'] as String,
      name: json['Name'] as String,
      columnSelectors: (json['ColumnSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      disabled: json['Disabled'] as bool?,
      substitutionMap: (json['SubstitutionMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      threshold: json['Threshold'] != null
          ? Threshold.fromJson(json['Threshold'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final checkExpression = this.checkExpression;
    final name = this.name;
    final columnSelectors = this.columnSelectors;
    final disabled = this.disabled;
    final substitutionMap = this.substitutionMap;
    final threshold = this.threshold;
    return {
      'CheckExpression': checkExpression,
      'Name': name,
      if (columnSelectors != null) 'ColumnSelectors': columnSelectors,
      if (disabled != null) 'Disabled': disabled,
      if (substitutionMap != null) 'SubstitutionMap': substitutionMap,
      if (threshold != null) 'Threshold': threshold,
    };
  }
}

/// Contains metadata about the ruleset.
class RulesetItem {
  /// The name of the ruleset.
  final String name;

  /// The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is
  /// associated with.
  final String targetArn;

  /// The ID of the Amazon Web Services account that owns the ruleset.
  final String? accountId;

  /// The date and time that the ruleset was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the ruleset.
  final String? createdBy;

  /// The description of the ruleset.
  final String? description;

  /// The Amazon Resource Name (ARN) of the user who last modified the ruleset.
  final String? lastModifiedBy;

  /// The modification date and time of the ruleset.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) for the ruleset.
  final String? resourceArn;

  /// The number of rules that are defined in the ruleset.
  final int? ruleCount;

  /// Metadata tags that have been applied to the ruleset.
  final Map<String, String>? tags;

  RulesetItem({
    required this.name,
    required this.targetArn,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.ruleCount,
    this.tags,
  });

  factory RulesetItem.fromJson(Map<String, dynamic> json) {
    return RulesetItem(
      name: json['Name'] as String,
      targetArn: json['TargetArn'] as String,
      accountId: json['AccountId'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      description: json['Description'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      resourceArn: json['ResourceArn'] as String?,
      ruleCount: json['RuleCount'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final targetArn = this.targetArn;
    final accountId = this.accountId;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final description = this.description;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final resourceArn = this.resourceArn;
    final ruleCount = this.ruleCount;
    final tags = this.tags;
    return {
      'Name': name,
      'TargetArn': targetArn,
      if (accountId != null) 'AccountId': accountId,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (description != null) 'Description': description,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (ruleCount != null) 'RuleCount': ruleCount,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents an Amazon S3 location (bucket name, bucket owner, and object key)
/// where DataBrew can read input data, or write output from a job.
class S3Location {
  /// The Amazon S3 bucket name.
  final String bucket;

  /// The Amazon Web Services account ID of the bucket owner.
  final String? bucketOwner;

  /// The unique name of the object in the bucket.
  final String? key;

  S3Location({
    required this.bucket,
    this.bucketOwner,
    this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['Bucket'] as String,
      bucketOwner: json['BucketOwner'] as String?,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final bucketOwner = this.bucketOwner;
    final key = this.key;
    return {
      'Bucket': bucket,
      if (bucketOwner != null) 'BucketOwner': bucketOwner,
      if (key != null) 'Key': key,
    };
  }
}

/// Represents options that specify how and where DataBrew writes the Amazon S3
/// output generated by recipe jobs.
class S3TableOutputOptions {
  /// Represents an Amazon S3 location (bucket name and object key) where DataBrew
  /// can write output from a job.
  final S3Location location;

  S3TableOutputOptions({
    required this.location,
  });

  factory S3TableOutputOptions.fromJson(Map<String, dynamic> json) {
    return S3TableOutputOptions(
      location: S3Location.fromJson(json['Location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    return {
      'Location': location,
    };
  }
}

/// Represents the sample size and sampling type for DataBrew to use for
/// interactive data analysis.
class Sample {
  /// The way in which DataBrew obtains rows from a dataset.
  final SampleType type;

  /// The number of rows in the sample.
  final int? size;

  Sample({
    required this.type,
    this.size,
  });

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      type: (json['Type'] as String).toSampleType(),
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final size = this.size;
    return {
      'Type': type.toValue(),
      if (size != null) 'Size': size,
    };
  }
}

enum SampleMode {
  fullDataset,
  customRows,
}

extension SampleModeValueExtension on SampleMode {
  String toValue() {
    switch (this) {
      case SampleMode.fullDataset:
        return 'FULL_DATASET';
      case SampleMode.customRows:
        return 'CUSTOM_ROWS';
    }
  }
}

extension SampleModeFromString on String {
  SampleMode toSampleMode() {
    switch (this) {
      case 'FULL_DATASET':
        return SampleMode.fullDataset;
      case 'CUSTOM_ROWS':
        return SampleMode.customRows;
    }
    throw Exception('$this is not known in enum SampleMode');
  }
}

enum SampleType {
  firstN,
  lastN,
  random,
}

extension SampleTypeValueExtension on SampleType {
  String toValue() {
    switch (this) {
      case SampleType.firstN:
        return 'FIRST_N';
      case SampleType.lastN:
        return 'LAST_N';
      case SampleType.random:
        return 'RANDOM';
    }
  }
}

extension SampleTypeFromString on String {
  SampleType toSampleType() {
    switch (this) {
      case 'FIRST_N':
        return SampleType.firstN;
      case 'LAST_N':
        return SampleType.lastN;
      case 'RANDOM':
        return SampleType.random;
    }
    throw Exception('$this is not known in enum SampleType');
  }
}

/// Represents one or more dates and times when a job is to run.
class Schedule {
  /// The name of the schedule.
  final String name;

  /// The ID of the Amazon Web Services account that owns the schedule.
  final String? accountId;

  /// The date and time that the schedule was created.
  final DateTime? createDate;

  /// The Amazon Resource Name (ARN) of the user who created the schedule.
  final String? createdBy;

  /// The dates and times when the job is to run. For more information, see <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/jobs.cron.html">Cron
  /// expressions</a> in the <i>Glue DataBrew Developer Guide</i>.
  final String? cronExpression;

  /// A list of jobs to be run, according to the schedule.
  final List<String>? jobNames;

  /// The Amazon Resource Name (ARN) of the user who last modified the schedule.
  final String? lastModifiedBy;

  /// The date and time when the schedule was last modified.
  final DateTime? lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the schedule.
  final String? resourceArn;

  /// Metadata tags that have been applied to the schedule.
  final Map<String, String>? tags;

  Schedule({
    required this.name,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.cronExpression,
    this.jobNames,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.tags,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      name: json['Name'] as String,
      accountId: json['AccountId'] as String?,
      createDate: timeStampFromJson(json['CreateDate']),
      createdBy: json['CreatedBy'] as String?,
      cronExpression: json['CronExpression'] as String?,
      jobNames: (json['JobNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final accountId = this.accountId;
    final createDate = this.createDate;
    final createdBy = this.createdBy;
    final cronExpression = this.cronExpression;
    final jobNames = this.jobNames;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'Name': name,
      if (accountId != null) 'AccountId': accountId,
      if (createDate != null) 'CreateDate': unixTimestampToJson(createDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (cronExpression != null) 'CronExpression': cronExpression,
      if (jobNames != null) 'JobNames': jobNames,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class SendProjectSessionActionResponse {
  /// The name of the project that was affected by the action.
  final String name;

  /// A unique identifier for the action that was performed.
  final int? actionId;

  /// A message indicating the result of performing the action.
  final String? result;

  SendProjectSessionActionResponse({
    required this.name,
    this.actionId,
    this.result,
  });

  factory SendProjectSessionActionResponse.fromJson(Map<String, dynamic> json) {
    return SendProjectSessionActionResponse(
      name: json['Name'] as String,
      actionId: json['ActionId'] as int?,
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final actionId = this.actionId;
    final result = this.result;
    return {
      'Name': name,
      if (actionId != null) 'ActionId': actionId,
      if (result != null) 'Result': result,
    };
  }
}

enum SessionStatus {
  assigned,
  failed,
  initializing,
  provisioning,
  ready,
  recycling,
  rotating,
  terminated,
  terminating,
  updating,
}

extension SessionStatusValueExtension on SessionStatus {
  String toValue() {
    switch (this) {
      case SessionStatus.assigned:
        return 'ASSIGNED';
      case SessionStatus.failed:
        return 'FAILED';
      case SessionStatus.initializing:
        return 'INITIALIZING';
      case SessionStatus.provisioning:
        return 'PROVISIONING';
      case SessionStatus.ready:
        return 'READY';
      case SessionStatus.recycling:
        return 'RECYCLING';
      case SessionStatus.rotating:
        return 'ROTATING';
      case SessionStatus.terminated:
        return 'TERMINATED';
      case SessionStatus.terminating:
        return 'TERMINATING';
      case SessionStatus.updating:
        return 'UPDATING';
    }
  }
}

extension SessionStatusFromString on String {
  SessionStatus toSessionStatus() {
    switch (this) {
      case 'ASSIGNED':
        return SessionStatus.assigned;
      case 'FAILED':
        return SessionStatus.failed;
      case 'INITIALIZING':
        return SessionStatus.initializing;
      case 'PROVISIONING':
        return SessionStatus.provisioning;
      case 'READY':
        return SessionStatus.ready;
      case 'RECYCLING':
        return SessionStatus.recycling;
      case 'ROTATING':
        return SessionStatus.rotating;
      case 'TERMINATED':
        return SessionStatus.terminated;
      case 'TERMINATING':
        return SessionStatus.terminating;
      case 'UPDATING':
        return SessionStatus.updating;
    }
    throw Exception('$this is not known in enum SessionStatus');
  }
}

enum Source {
  s3,
  dataCatalog,
  database,
}

extension SourceValueExtension on Source {
  String toValue() {
    switch (this) {
      case Source.s3:
        return 'S3';
      case Source.dataCatalog:
        return 'DATA-CATALOG';
      case Source.database:
        return 'DATABASE';
    }
  }
}

extension SourceFromString on String {
  Source toSource() {
    switch (this) {
      case 'S3':
        return Source.s3;
      case 'DATA-CATALOG':
        return Source.dataCatalog;
      case 'DATABASE':
        return Source.database;
    }
    throw Exception('$this is not known in enum Source');
  }
}

class StartJobRunResponse {
  /// A system-generated identifier for this particular job run.
  final String runId;

  StartJobRunResponse({
    required this.runId,
  });

  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) {
    return StartJobRunResponse(
      runId: json['RunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    return {
      'RunId': runId,
    };
  }
}

class StartProjectSessionResponse {
  /// The name of the project to be acted upon.
  final String name;

  /// A system-generated identifier for the session.
  final String? clientSessionId;

  StartProjectSessionResponse({
    required this.name,
    this.clientSessionId,
  });

  factory StartProjectSessionResponse.fromJson(Map<String, dynamic> json) {
    return StartProjectSessionResponse(
      name: json['Name'] as String,
      clientSessionId: json['ClientSessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final clientSessionId = this.clientSessionId;
    return {
      'Name': name,
      if (clientSessionId != null) 'ClientSessionId': clientSessionId,
    };
  }
}

/// Override of a particular evaluation for a profile job.
class StatisticOverride {
  /// A map that includes overrides of an evaluation’s parameters.
  final Map<String, String> parameters;

  /// The name of an evaluation
  final String statistic;

  StatisticOverride({
    required this.parameters,
    required this.statistic,
  });

  factory StatisticOverride.fromJson(Map<String, dynamic> json) {
    return StatisticOverride(
      parameters: (json['Parameters'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      statistic: json['Statistic'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final statistic = this.statistic;
    return {
      'Parameters': parameters,
      'Statistic': statistic,
    };
  }
}

/// Configuration of evaluations for a profile job. This configuration can be
/// used to select evaluations and override the parameters of selected
/// evaluations.
class StatisticsConfiguration {
  /// List of included evaluations. When the list is undefined, all supported
  /// evaluations will be included.
  final List<String>? includedStatistics;

  /// List of overrides for evaluations.
  final List<StatisticOverride>? overrides;

  StatisticsConfiguration({
    this.includedStatistics,
    this.overrides,
  });

  factory StatisticsConfiguration.fromJson(Map<String, dynamic> json) {
    return StatisticsConfiguration(
      includedStatistics: (json['IncludedStatistics'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      overrides: (json['Overrides'] as List?)
          ?.whereNotNull()
          .map((e) => StatisticOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final includedStatistics = this.includedStatistics;
    final overrides = this.overrides;
    return {
      if (includedStatistics != null) 'IncludedStatistics': includedStatistics,
      if (overrides != null) 'Overrides': overrides,
    };
  }
}

class StopJobRunResponse {
  /// The ID of the job run that you stopped.
  final String runId;

  StopJobRunResponse({
    required this.runId,
  });

  factory StopJobRunResponse.fromJson(Map<String, dynamic> json) {
    return StopJobRunResponse(
      runId: json['RunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    return {
      'RunId': runId,
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

/// The threshold used with a non-aggregate check expression. The non-aggregate
/// check expression will be applied to each row in a specific column. Then the
/// threshold will be used to determine whether the validation succeeds.
class Threshold {
  /// The value of a threshold.
  final double value;

  /// The type of a threshold. Used for comparison of an actual count of rows that
  /// satisfy the rule to the threshold value.
  final ThresholdType? type;

  /// Unit of threshold value. Can be either a COUNT or PERCENTAGE of the full
  /// sample size used for validation.
  final ThresholdUnit? unit;

  Threshold({
    required this.value,
    this.type,
    this.unit,
  });

  factory Threshold.fromJson(Map<String, dynamic> json) {
    return Threshold(
      value: json['Value'] as double,
      type: (json['Type'] as String?)?.toThresholdType(),
      unit: (json['Unit'] as String?)?.toThresholdUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final type = this.type;
    final unit = this.unit;
    return {
      'Value': value,
      if (type != null) 'Type': type.toValue(),
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

enum ThresholdType {
  greaterThanOrEqual,
  lessThanOrEqual,
  greaterThan,
  lessThan,
}

extension ThresholdTypeValueExtension on ThresholdType {
  String toValue() {
    switch (this) {
      case ThresholdType.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
      case ThresholdType.lessThanOrEqual:
        return 'LESS_THAN_OR_EQUAL';
      case ThresholdType.greaterThan:
        return 'GREATER_THAN';
      case ThresholdType.lessThan:
        return 'LESS_THAN';
    }
  }
}

extension ThresholdTypeFromString on String {
  ThresholdType toThresholdType() {
    switch (this) {
      case 'GREATER_THAN_OR_EQUAL':
        return ThresholdType.greaterThanOrEqual;
      case 'LESS_THAN_OR_EQUAL':
        return ThresholdType.lessThanOrEqual;
      case 'GREATER_THAN':
        return ThresholdType.greaterThan;
      case 'LESS_THAN':
        return ThresholdType.lessThan;
    }
    throw Exception('$this is not known in enum ThresholdType');
  }
}

enum ThresholdUnit {
  count,
  percentage,
}

extension ThresholdUnitValueExtension on ThresholdUnit {
  String toValue() {
    switch (this) {
      case ThresholdUnit.count:
        return 'COUNT';
      case ThresholdUnit.percentage:
        return 'PERCENTAGE';
    }
  }
}

extension ThresholdUnitFromString on String {
  ThresholdUnit toThresholdUnit() {
    switch (this) {
      case 'COUNT':
        return ThresholdUnit.count;
      case 'PERCENTAGE':
        return ThresholdUnit.percentage;
    }
    throw Exception('$this is not known in enum ThresholdUnit');
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

class UpdateDatasetResponse {
  /// The name of the dataset that you updated.
  final String name;

  UpdateDatasetResponse({
    required this.name,
  });

  factory UpdateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDatasetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class UpdateProfileJobResponse {
  /// The name of the job that was updated.
  final String name;

  UpdateProfileJobResponse({
    required this.name,
  });

  factory UpdateProfileJobResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileJobResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class UpdateProjectResponse {
  /// The name of the project that you updated.
  final String name;

  /// The date and time that the project was last modified.
  final DateTime? lastModifiedDate;

  UpdateProjectResponse({
    required this.name,
    this.lastModifiedDate,
  });

  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProjectResponse(
      name: json['Name'] as String,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      'Name': name,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
    };
  }
}

class UpdateRecipeJobResponse {
  /// The name of the job that you updated.
  final String name;

  UpdateRecipeJobResponse({
    required this.name,
  });

  factory UpdateRecipeJobResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecipeJobResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class UpdateRecipeResponse {
  /// The name of the recipe that was updated.
  final String name;

  UpdateRecipeResponse({
    required this.name,
  });

  factory UpdateRecipeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecipeResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class UpdateRulesetResponse {
  /// The name of the updated ruleset.
  final String name;

  UpdateRulesetResponse({
    required this.name,
  });

  factory UpdateRulesetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRulesetResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

class UpdateScheduleResponse {
  /// The name of the schedule that was updated.
  final String name;

  UpdateScheduleResponse({
    required this.name,
  });

  factory UpdateScheduleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduleResponse(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Configuration for data quality validation. Used to select the Rulesets and
/// Validation Mode to be used in the profile job. When ValidationConfiguration
/// is null, the profile job will run without data quality validation.
class ValidationConfiguration {
  /// The Amazon Resource Name (ARN) for the ruleset to be validated in the
  /// profile job. The TargetArn of the selected ruleset should be the same as the
  /// Amazon Resource Name (ARN) of the dataset that is associated with the
  /// profile job.
  final String rulesetArn;

  /// Mode of data quality validation. Default mode is “CHECK_ALL” which verifies
  /// all rules defined in the selected ruleset.
  final ValidationMode? validationMode;

  ValidationConfiguration({
    required this.rulesetArn,
    this.validationMode,
  });

  factory ValidationConfiguration.fromJson(Map<String, dynamic> json) {
    return ValidationConfiguration(
      rulesetArn: json['RulesetArn'] as String,
      validationMode: (json['ValidationMode'] as String?)?.toValidationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final rulesetArn = this.rulesetArn;
    final validationMode = this.validationMode;
    return {
      'RulesetArn': rulesetArn,
      if (validationMode != null) 'ValidationMode': validationMode.toValue(),
    };
  }
}

enum ValidationMode {
  checkAll,
}

extension ValidationModeValueExtension on ValidationMode {
  String toValue() {
    switch (this) {
      case ValidationMode.checkAll:
        return 'CHECK_ALL';
    }
  }
}

extension ValidationModeFromString on String {
  ValidationMode toValidationMode() {
    switch (this) {
      case 'CHECK_ALL':
        return ValidationMode.checkAll;
    }
    throw Exception('$this is not known in enum ValidationMode');
  }
}

/// Represents the data being transformed during an action.
class ViewFrame {
  /// The starting index for the range of columns to return in the view frame.
  final int startColumnIndex;

  /// Controls if analytics computation is enabled or disabled. Enabled by
  /// default.
  final AnalyticsMode? analytics;

  /// The number of columns to include in the view frame, beginning with the
  /// <code>StartColumnIndex</code> value and ignoring any columns in the
  /// <code>HiddenColumns</code> list.
  final int? columnRange;

  /// A list of columns to hide in the view frame.
  final List<String>? hiddenColumns;

  /// The number of rows to include in the view frame, beginning with the
  /// <code>StartRowIndex</code> value.
  final int? rowRange;

  /// The starting index for the range of rows to return in the view frame.
  final int? startRowIndex;

  ViewFrame({
    required this.startColumnIndex,
    this.analytics,
    this.columnRange,
    this.hiddenColumns,
    this.rowRange,
    this.startRowIndex,
  });

  Map<String, dynamic> toJson() {
    final startColumnIndex = this.startColumnIndex;
    final analytics = this.analytics;
    final columnRange = this.columnRange;
    final hiddenColumns = this.hiddenColumns;
    final rowRange = this.rowRange;
    final startRowIndex = this.startRowIndex;
    return {
      'StartColumnIndex': startColumnIndex,
      if (analytics != null) 'Analytics': analytics.toValue(),
      if (columnRange != null) 'ColumnRange': columnRange,
      if (hiddenColumns != null) 'HiddenColumns': hiddenColumns,
      if (rowRange != null) 'RowRange': rowRange,
      if (startRowIndex != null) 'StartRowIndex': startRowIndex,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
