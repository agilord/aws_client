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

part '2017-07-25.g.dart';

/// AWS Glue DataBrew is a visual, cloud-scale data-preparation service.
/// DataBrew simplifies data preparation tasks, targeting data issues that are
/// hard to spot and time-consuming to fix. DataBrew empowers users of all
/// technical levels to visualize the data and perform one-click data
/// transformations, with no coding required.
class GlueDataBrew {
  final _s.RestJsonProtocol _protocol;
  GlueDataBrew({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'databrew',
            signingName: 'databrew',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes one or more versions of a recipe at a time.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be modified.
  ///
  /// Parameter [recipeVersions] :
  /// An array of version identifiers to be deleted.
  Future<BatchDeleteRecipeVersionResponse> batchDeleteRecipeVersion({
    @_s.required String name,
    @_s.required List<String> recipeVersions,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(recipeVersions, 'recipeVersions');
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

  /// Creates a new AWS Glue DataBrew dataset for this AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be created.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this dataset.
  Future<CreateDatasetResponse> createDataset({
    @_s.required Input input,
    @_s.required String name,
    FormatOptions formatOptions,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(input, 'input');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Input': input,
      'Name': name,
      if (formatOptions != null) 'FormatOptions': formatOptions,
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

  /// Creates a new job to profile an AWS Glue DataBrew dataset that exists in
  /// the current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset that this job is to act upon.
  ///
  /// Parameter [name] :
  /// The name of the job to be created.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role to be assumed for this request.
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
  /// <code>SSE-KMS</code> - para&gt;<code>SSE-KMS</code> - server-side
  /// encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// A value that enables or disables Amazon CloudWatch logging for the current
  /// AWS account. If logging is enabled, CloudWatch writes one log stream for
  /// each job run.
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
  Future<CreateProfileJobResponse> createProfileJob({
    @_s.required String datasetName,
    @_s.required String name,
    @_s.required S3Location outputLocation,
    @_s.required String roleArn,
    String encryptionKeyArn,
    EncryptionMode encryptionMode,
    LogSubscription logSubscription,
    int maxCapacity,
    int maxRetries,
    Map<String, String> tags,
    int timeout,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputLocation, 'outputLocation');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKeyArn',
      encryptionKeyArn,
      20,
      2048,
    );
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
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profileJobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProfileJobResponse.fromJson(response);
  }

  /// Creates a new AWS Glue DataBrew project in the current AWS account.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to associate this project with.
  ///
  /// Parameter [name] :
  /// A unique name for the new project.
  ///
  /// Parameter [recipeName] :
  /// The name of an existing recipe to associate with the project.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role to be assumed for this request.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this project.
  Future<CreateProjectResponse> createProject({
    @_s.required String datasetName,
    @_s.required String name,
    @_s.required String recipeName,
    @_s.required String roleArn,
    Sample sample,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(recipeName, 'recipeName');
    _s.validateStringLength(
      'recipeName',
      recipeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
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

  /// Creates a new AWS Glue DataBrew recipe for the current AWS account.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A unique name for the recipe.
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
    @_s.required String name,
    @_s.required List<RecipeStep> steps,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(steps, 'steps');
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Creates a new job for an existing AWS Glue DataBrew recipe in the current
  /// AWS account. You can create a standalone job using either a project, or a
  /// combination of a recipe and a dataset.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A unique name for the job.
  ///
  /// Parameter [outputs] :
  /// One or more artifacts that represent the output from running the job.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role to be assumed for this request.
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
  /// <code>SSE-KMS</code> - Server-side encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// A value that enables or disables Amazon CloudWatch logging for the current
  /// AWS account. If logging is enabled, CloudWatch writes one log stream for
  /// each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can consume when the job
  /// processes data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [projectName] :
  /// Either the name of an existing project, or a combination of a recipe and a
  /// dataset to associate with the recipe.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this job dataset.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  Future<CreateRecipeJobResponse> createRecipeJob({
    @_s.required String name,
    @_s.required List<Output> outputs,
    @_s.required String roleArn,
    String datasetName,
    String encryptionKeyArn,
    EncryptionMode encryptionMode,
    LogSubscription logSubscription,
    int maxCapacity,
    int maxRetries,
    String projectName,
    RecipeReference recipeReference,
    Map<String, String> tags,
    int timeout,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputs, 'outputs');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      255,
    );
    _s.validateStringLength(
      'encryptionKeyArn',
      encryptionKeyArn,
      20,
      2048,
    );
    _s.validateNumRange(
      'maxRetries',
      maxRetries,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'Outputs': outputs,
      'RoleArn': roleArn,
      if (datasetName != null) 'DatasetName': datasetName,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
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

  /// Creates a new schedule for one or more AWS Glue DataBrew jobs. Jobs can be
  /// run at a specific date and time, or at regular intervals.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [cronExpression] :
  /// The date or dates and time or times, in <code>cron</code> format, when the
  /// jobs are to be run.
  ///
  /// Parameter [name] :
  /// A unique name for the schedule.
  ///
  /// Parameter [jobNames] :
  /// The name or names of one or more jobs to be run.
  ///
  /// Parameter [tags] :
  /// Metadata tags to apply to this schedule.
  Future<CreateScheduleResponse> createSchedule({
    @_s.required String cronExpression,
    @_s.required String name,
    List<String> jobNames,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(cronExpression, 'cronExpression');
    _s.validateStringLength(
      'cronExpression',
      cronExpression,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
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

  /// Deletes a dataset from AWS Glue DataBrew.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be deleted.
  Future<DeleteDatasetResponse> deleteDataset({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatasetResponse.fromJson(response);
  }

  /// Deletes the specified AWS Glue DataBrew job from the current AWS account.
  /// The job can be for a recipe or for a profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be deleted.
  Future<DeleteJobResponse> deleteJob({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/jobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobResponse.fromJson(response);
  }

  /// Deletes an existing AWS Glue DataBrew project from the current AWS
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to be deleted.
  Future<DeleteProjectResponse> deleteProject({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResponse.fromJson(response);
  }

  /// Deletes a single version of an AWS Glue DataBrew recipe.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be deleted.
  ///
  /// Parameter [recipeVersion] :
  /// The version of the recipe to be deleted.
  Future<DeleteRecipeVersionResponse> deleteRecipeVersion({
    @_s.required String name,
    @_s.required String recipeVersion,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(recipeVersion, 'recipeVersion');
    _s.validateStringLength(
      'recipeVersion',
      recipeVersion,
      1,
      16,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/recipes/${Uri.encodeComponent(name)}/recipeVersion/${Uri.encodeComponent(recipeVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRecipeVersionResponse.fromJson(response);
  }

  /// Deletes the specified AWS Glue DataBrew schedule from the current AWS
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to be deleted.
  Future<DeleteScheduleResponse> deleteSchedule({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteScheduleResponse.fromJson(response);
  }

  /// Returns the definition of a specific AWS Glue DataBrew dataset that is in
  /// the current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be described.
  Future<DescribeDatasetResponse> describeDataset({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatasetResponse.fromJson(response);
  }

  /// Returns the definition of a specific AWS Glue DataBrew job that is in the
  /// current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be described.
  Future<DescribeJobResponse> describeJob({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResponse.fromJson(response);
  }

  /// Returns the definition of a specific AWS Glue DataBrew project that is in
  /// the current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to be described.
  Future<DescribeProjectResponse> describeProject({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Returns the definition of a specific AWS Glue DataBrew recipe that is in
  /// the current AWS account.
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
    @_s.required String name,
    String recipeVersion,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'recipeVersion',
      recipeVersion,
      1,
      16,
    );
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

  /// Returns the definition of a specific AWS Glue DataBrew schedule that is in
  /// the current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to be described.
  Future<DescribeScheduleResponse> describeSchedule({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScheduleResponse.fromJson(response);
  }

  /// Lists all of the AWS Glue DataBrew datasets for the current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by DataBrew that specifies where to continue pagination
  /// if a previous request was truncated. To get the next set of pages, pass in
  /// the NextToken value from the response object of the previous page call.
  Future<ListDatasetsResponse> listDatasets({
    int maxResults,
    String nextToken,
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
      2000,
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

  /// Lists all of the previous runs of a particular AWS Glue DataBrew job in
  /// the current AWS account.
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
  /// A token generated by AWS Glue DataBrew that specifies where to continue
  /// pagination if a previous request was truncated. To get the next set of
  /// pages, pass in the NextToken value from the response object of the
  /// previous page call.
  Future<ListJobRunsResponse> listJobRuns({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
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
      2000,
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

  /// Lists the AWS Glue DataBrew jobs in the current AWS account.
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
    String datasetName,
    int maxResults,
    String nextToken,
    String projectName,
  }) async {
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      255,
    );
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
      2000,
    );
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      255,
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

  /// Lists all of the DataBrew projects in the current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListProjectsResponse> listProjects({
    int maxResults,
    String nextToken,
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
      2000,
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

  /// Lists all of the versions of a particular AWS Glue DataBrew recipe in the
  /// current AWS account.
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
  /// A pagination token that can be used in a subsequent request.
  Future<ListRecipeVersionsResponse> listRecipeVersions({
    @_s.required String name,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
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
      2000,
    );
    final $query = <String, List<String>>{
      if (name != null) 'name': [name],
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

  /// Lists all of the AWS Glue DataBrew recipes in the current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  ///
  /// Parameter [recipeVersion] :
  /// A version identifier. Using this parameter indicates to return only those
  /// recipes that have this version identifier.
  Future<ListRecipesResponse> listRecipes({
    int maxResults,
    String nextToken,
    String recipeVersion,
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
      2000,
    );
    _s.validateStringLength(
      'recipeVersion',
      recipeVersion,
      1,
      16,
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

  /// Lists the AWS Glue DataBrew schedules in the current AWS account.
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
  /// A pagination token that can be used in a subsequent request.
  Future<ListSchedulesResponse> listSchedules({
    String jobName,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      240,
    );
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
      2000,
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

  /// Lists all the tags for an AWS Glue DataBrew resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// DataBrew resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Publishes a new major version of an AWS Glue DataBrew recipe that exists
  /// in the current AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the recipe to be published.
  ///
  /// Parameter [description] :
  /// A description of the recipe to be published, for this version of the
  /// recipe.
  Future<PublishRecipeResponse> publishRecipe({
    @_s.required String name,
    String description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Performs a recipe step within an interactive AWS Glue DataBrew session
  /// that's currently open.
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
  /// Returns the result of the recipe step, without applying it. The result
  /// isn't added to the view frame stack.
  ///
  /// Parameter [stepIndex] :
  /// The index from which to preview a step. This index is used to preview the
  /// result of steps that have already been applied, so that the resulting view
  /// frame is from earlier in the view frame stack.
  Future<SendProjectSessionActionResponse> sendProjectSessionAction({
    @_s.required String name,
    String clientSessionId,
    bool preview,
    RecipeStep recipeStep,
    int stepIndex,
    ViewFrame viewFrame,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientSessionId',
      clientSessionId,
      1,
      255,
    );
    _s.validateStringPattern(
      'clientSessionId',
      clientSessionId,
      r'''^[a-zA-Z0-9][a-zA-Z0-9-]*$''',
    );
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

  /// Runs an AWS Glue DataBrew job that exists in the current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be run.
  Future<StartJobRunResponse> startJobRun({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/jobs/${Uri.encodeComponent(name)}/startJobRun',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobRunResponse.fromJson(response);
  }

  /// Creates an interactive session, enabling you to manipulate an AWS Glue
  /// DataBrew project.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the project to act upon.
  ///
  /// Parameter [assumeControl] :
  /// A value that, if true, enables you to take control of a session, even if a
  /// different client is currently accessing the project.
  Future<StartProjectSessionResponse> startProjectSession({
    @_s.required String name,
    bool assumeControl,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
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

  /// Stops the specified job from running in the current AWS account.
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
    @_s.required String name,
    @_s.required String runId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(runId, 'runId');
    _s.validateStringLength(
      'runId',
      runId,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/jobs/${Uri.encodeComponent(name)}/jobRun/${Uri.encodeComponent(runId)}/stopJobRun',
      exceptionFnMap: _exceptionFns,
    );
    return StopJobRunResponse.fromJson(response);
  }

  /// Adds metadata tags to an AWS Glue DataBrew resource, such as a dataset,
  /// job, project, or recipe.
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes metadata tags from an AWS Glue DataBrew resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// An DataBrew resource from which you want to remove a tag or tags. The
  /// value for this parameter is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag keys (names) of one or more tags to be removed.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Modifies the definition of an existing AWS Glue DataBrew dataset in the
  /// current AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dataset to be updated.
  Future<UpdateDatasetResponse> updateDataset({
    @_s.required Input input,
    @_s.required String name,
    FormatOptions formatOptions,
  }) async {
    ArgumentError.checkNotNull(input, 'input');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Input': input,
      if (formatOptions != null) 'FormatOptions': formatOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/datasets/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDatasetResponse.fromJson(response);
  }

  /// Modifies the definition of an existing AWS Glue DataBrew job in the
  /// current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to be updated.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role to be assumed for this request.
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
  /// <code>SSE-KMS</code> - Server-side encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// A value that enables or disables Amazon CloudWatch logging for the current
  /// AWS account. If logging is enabled, CloudWatch writes one log stream for
  /// each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can use when the job processes
  /// data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  Future<UpdateProfileJobResponse> updateProfileJob({
    @_s.required String name,
    @_s.required S3Location outputLocation,
    @_s.required String roleArn,
    String encryptionKeyArn,
    EncryptionMode encryptionMode,
    LogSubscription logSubscription,
    int maxCapacity,
    int maxRetries,
    int timeout,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputLocation, 'outputLocation');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKeyArn',
      encryptionKeyArn,
      20,
      2048,
    );
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
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
      if (timeout != null) 'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/profileJobs/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProfileJobResponse.fromJson(response);
  }

  /// Modifies the definition of an existing AWS Glue DataBrew project in the
  /// current AWS account.
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
    @_s.required String name,
    @_s.required String roleArn,
    Sample sample,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
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

  /// Modifies the definition of the latest working version of an AWS Glue
  /// DataBrew recipe in the current AWS account.
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
    @_s.required String name,
    String description,
    List<RecipeStep> steps,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1024,
    );
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

  /// Modifies the definition of an existing AWS Glue DataBrew recipe job in the
  /// current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the job to update.
  ///
  /// Parameter [outputs] :
  /// One or more artifacts that represent the output from running the job.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role to be assumed for this request.
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
  /// <code>SSE-KMS</code> - Server-side encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon
  /// S3.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logSubscription] :
  /// A value that enables or disables Amazon CloudWatch logging for the current
  /// AWS account. If logging is enabled, CloudWatch writes one log stream for
  /// each job run.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum number of nodes that DataBrew can consume when the job
  /// processes data.
  ///
  /// Parameter [maxRetries] :
  /// The maximum number of times to retry the job after a job run fails.
  ///
  /// Parameter [timeout] :
  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  Future<UpdateRecipeJobResponse> updateRecipeJob({
    @_s.required String name,
    @_s.required List<Output> outputs,
    @_s.required String roleArn,
    String encryptionKeyArn,
    EncryptionMode encryptionMode,
    LogSubscription logSubscription,
    int maxCapacity,
    int maxRetries,
    int timeout,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputs, 'outputs');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKeyArn',
      encryptionKeyArn,
      20,
      2048,
    );
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
      'Outputs': outputs,
      'RoleArn': roleArn,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionMode != null) 'EncryptionMode': encryptionMode.toValue(),
      if (logSubscription != null) 'LogSubscription': logSubscription.toValue(),
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (maxRetries != null) 'MaxRetries': maxRetries,
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

  /// Modifies the definition of an existing AWS Glue DataBrew schedule in the
  /// current AWS account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [cronExpression] :
  /// The date or dates and time or times, in <code>cron</code> format, when the
  /// jobs are to be run.
  ///
  /// Parameter [name] :
  /// The name of the schedule to update.
  ///
  /// Parameter [jobNames] :
  /// The name or names of one or more jobs to be run for this schedule.
  Future<UpdateScheduleResponse> updateSchedule({
    @_s.required String cronExpression,
    @_s.required String name,
    List<String> jobNames,
  }) async {
    ArgumentError.checkNotNull(cronExpression, 'cronExpression');
    _s.validateStringLength(
      'cronExpression',
      cronExpression,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteRecipeVersionResponse {
  /// The name of the recipe that was modified.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Errors, if any, that were encountered when deleting the recipe versions.
  @_s.JsonKey(name: 'Errors')
  final List<RecipeVersionErrorDetail> errors;

  BatchDeleteRecipeVersionResponse({
    @_s.required this.name,
    this.errors,
  });
  factory BatchDeleteRecipeVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDeleteRecipeVersionResponseFromJson(json);
}

enum CompressionFormat {
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('LZ4')
  lz4,
  @_s.JsonValue('SNAPPY')
  snappy,
  @_s.JsonValue('BZIP2')
  bzip2,
  @_s.JsonValue('DEFLATE')
  deflate,
  @_s.JsonValue('LZO')
  lzo,
  @_s.JsonValue('BROTLI')
  brotli,
  @_s.JsonValue('ZSTD')
  zstd,
  @_s.JsonValue('ZLIB')
  zlib,
}

/// Represents an individual condition that evaluates to true or false.
///
/// Conditions are used with recipe actions: The action is only performed for
/// column values where the condition evaluates to true.
///
/// If a recipe requires more than one condition, then the recipe must specify
/// multiple <code>ConditionExpression</code> elements. Each condition is
/// applied to the rows in a dataset first, before the recipe action is
/// performed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConditionExpression {
  /// A specific condition to apply to a recipe action. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/databrew/latest/dg/recipe-structure.html">Recipe
  /// structure</a> in the <i>AWS Glue DataBrew Developer Guide</i>.
  @_s.JsonKey(name: 'Condition')
  final String condition;

  /// A column to apply this condition to, within an AWS Glue DataBrew dataset.
  @_s.JsonKey(name: 'TargetColumn')
  final String targetColumn;

  /// A value that the condition must evaluate to for the condition to succeed.
  @_s.JsonKey(name: 'Value')
  final String value;

  ConditionExpression({
    @_s.required this.condition,
    @_s.required this.targetColumn,
    this.value,
  });
  factory ConditionExpression.fromJson(Map<String, dynamic> json) =>
      _$ConditionExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionExpressionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetResponse {
  /// The name of the dataset that you created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateDatasetResponse({
    @_s.required this.name,
  });
  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProfileJobResponse {
  /// The name of the job that was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateProfileJobResponse({
    @_s.required this.name,
  });
  factory CreateProfileJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResponse {
  /// The name of the project that you created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateProjectResponse({
    @_s.required this.name,
  });
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRecipeJobResponse {
  /// The name of the job that you created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateRecipeJobResponse({
    @_s.required this.name,
  });
  factory CreateRecipeJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRecipeJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRecipeResponse {
  /// The name of the recipe that you created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateRecipeResponse({
    @_s.required this.name,
  });
  factory CreateRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateScheduleResponse {
  /// The name of the schedule that was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateScheduleResponse({
    @_s.required this.name,
  });
  factory CreateScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleResponseFromJson(json);
}

/// Represents how metadata stored in the AWS Glue Data Catalog is defined in an
/// AWS Glue DataBrew dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataCatalogInputDefinition {
  /// The name of a database in the Data Catalog.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of a database table in the Data Catalog. This table corresponds to
  /// a DataBrew dataset.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The unique identifier of the AWS account that holds the Data Catalog that
  /// stores the data.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// An Amazon location that AWS Glue Data Catalog can use as a temporary
  /// directory.
  @_s.JsonKey(name: 'TempDirectory')
  final S3Location tempDirectory;

  DataCatalogInputDefinition({
    @_s.required this.databaseName,
    @_s.required this.tableName,
    this.catalogId,
    this.tempDirectory,
  });
  factory DataCatalogInputDefinition.fromJson(Map<String, dynamic> json) =>
      _$DataCatalogInputDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DataCatalogInputDefinitionToJson(this);
}

/// Represents a dataset that can be processed by AWS Glue DataBrew.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dataset {
  /// Information on how DataBrew can find the dataset, in either the AWS Glue
  /// Data Catalog or Amazon S3.
  @_s.JsonKey(name: 'Input')
  final Input input;

  /// The unique name of the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the AWS account that owns the dataset.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The date and time that the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (the user name) of the user who created the dataset.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// Options that define how DataBrew interprets the data in the dataset.
  @_s.JsonKey(name: 'FormatOptions')
  final FormatOptions formatOptions;

  /// The identifier (the user name) of the user who last modified the dataset.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The last modification date and time of the dataset.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The unique Amazon Resource Name (ARN) for the dataset.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The location of the data for the dataset, either Amazon S3 or the AWS Glue
  /// Data Catalog.
  @_s.JsonKey(name: 'Source')
  final Source source;

  /// Metadata tags that have been applied to the dataset.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Dataset({
    @_s.required this.input,
    @_s.required this.name,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.formatOptions,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.source,
    this.tags,
  });
  factory Dataset.fromJson(Map<String, dynamic> json) =>
      _$DatasetFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDatasetResponse {
  /// The name of the dataset that you deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteDatasetResponse({
    @_s.required this.name,
  });
  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJobResponse {
  /// The name of the job that you deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteJobResponse({
    @_s.required this.name,
  });
  factory DeleteJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResponse {
  /// The name of the project that you deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteProjectResponse({
    @_s.required this.name,
  });
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRecipeVersionResponse {
  /// The name of the recipe that was deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The version of the recipe that was deleted.
  @_s.JsonKey(name: 'RecipeVersion')
  final String recipeVersion;

  DeleteRecipeVersionResponse({
    @_s.required this.name,
    @_s.required this.recipeVersion,
  });
  factory DeleteRecipeVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRecipeVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScheduleResponse {
  /// The name of the schedule that was deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteScheduleResponse({
    @_s.required this.name,
  });
  factory DeleteScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetResponse {
  @_s.JsonKey(name: 'Input')
  final Input input;

  /// The name of the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (user name) of the user who created the dataset.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;
  @_s.JsonKey(name: 'FormatOptions')
  final FormatOptions formatOptions;

  /// The identifier (user name) of the user who last modified the dataset.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time that the dataset was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The location of the data for this dataset, Amazon S3 or the AWS Glue Data
  /// Catalog.
  @_s.JsonKey(name: 'Source')
  final Source source;

  /// Metadata tags associated with this dataset.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DescribeDatasetResponse({
    @_s.required this.input,
    @_s.required this.name,
    this.createDate,
    this.createdBy,
    this.formatOptions,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.source,
    this.tags,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobResponse {
  /// The name of the job.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (user name) of the user associated with the creation of the
  /// job.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The dataset that the job acts upon.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The Amazon Resource Name (ARN) of an encryption key that is used to protect
  /// the job.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon S3.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EncryptionMode')
  final EncryptionMode encryptionMode;

  /// The identifier (user name) of the user who last modified the job.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time that the job was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// A value that indicates whether Amazon CloudWatch logging is enabled for this
  /// job.
  @_s.JsonKey(name: 'LogSubscription')
  final LogSubscription logSubscription;

  /// The maximum number of nodes that AWS Glue DataBrew can consume when the job
  /// processes data.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The maximum number of times to retry the job after a job run fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// One or more artifacts that represent the output from running the job.
  @_s.JsonKey(name: 'Outputs')
  final List<Output> outputs;

  /// The DataBrew project associated with this job.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;
  @_s.JsonKey(name: 'RecipeReference')
  final RecipeReference recipeReference;

  /// The Amazon Resource Name (ARN) of the job.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The ARN of the AWS Identity and Access Management (IAM) role that was
  /// assumed for this request.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Metadata tags associated with this job.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

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
  @_s.JsonKey(name: 'Type')
  final JobType type;

  DescribeJobResponse({
    @_s.required this.name,
    this.createDate,
    this.createdBy,
    this.datasetName,
    this.encryptionKeyArn,
    this.encryptionMode,
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
  });
  factory DescribeJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResponse {
  /// The name of the project.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (user name) of the user who created the project.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The dataset associated with the project.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The identifier (user name) of the user who last modified the project.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time that the project was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The date and time when the project was opened.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OpenDate')
  final DateTime openDate;

  /// The identifier (user name) of the user that opened the project for use.
  @_s.JsonKey(name: 'OpenedBy')
  final String openedBy;

  /// The recipe associated with this job.
  @_s.JsonKey(name: 'RecipeName')
  final String recipeName;

  /// The Amazon Resource Name (ARN) of the project.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The ARN of the AWS Identity and Access Management (IAM) role that was
  /// assumed for this request.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;
  @_s.JsonKey(name: 'Sample')
  final Sample sample;

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
  @_s.JsonKey(name: 'SessionStatus')
  final SessionStatus sessionStatus;

  /// Metadata tags associated with this project.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DescribeProjectResponse({
    @_s.required this.name,
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
  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRecipeResponse {
  /// The name of the recipe.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the recipe was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (user name) of the user who created the recipe.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The description of the recipe.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier (user name) of the user who last modified the recipe.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time that the recipe was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The name of the project associated with this recipe.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  /// The identifier (user name) of the user who last published the recipe.
  @_s.JsonKey(name: 'PublishedBy')
  final String publishedBy;

  /// The date and time when the recipe was last published.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PublishedDate')
  final DateTime publishedDate;

  /// The recipe version identifier.
  @_s.JsonKey(name: 'RecipeVersion')
  final String recipeVersion;

  /// The ARN of the recipe.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// One or more steps to be performed by the recipe. Each step consists of an
  /// action, and the conditions under which the action should succeed.
  @_s.JsonKey(name: 'Steps')
  final List<RecipeStep> steps;

  /// Metadata tags associated with this project.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DescribeRecipeResponse({
    @_s.required this.name,
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
  factory DescribeRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScheduleResponse {
  /// The name of the schedule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the schedule was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (user name) of the user who created the schedule.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date or dates and time or times, in <code>cron</code> format, when the
  /// jobs are to be run for the schedule.
  @_s.JsonKey(name: 'CronExpression')
  final String cronExpression;

  /// The name or names of one or more jobs to be run by using the schedule.
  @_s.JsonKey(name: 'JobNames')
  final List<String> jobNames;

  /// The identifier (user name) of the user who last modified the schedule.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time that the schedule was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the schedule.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// Metadata tags associated with this schedule.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  DescribeScheduleResponse({
    @_s.required this.name,
    this.createDate,
    this.createdBy,
    this.cronExpression,
    this.jobNames,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.resourceArn,
    this.tags,
  });
  factory DescribeScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScheduleResponseFromJson(json);
}

enum EncryptionMode {
  @_s.JsonValue('SSE-KMS')
  sseKms,
  @_s.JsonValue('SSE-S3')
  sseS3,
}

extension on EncryptionMode {
  String toValue() {
    switch (this) {
      case EncryptionMode.sseKms:
        return 'SSE-KMS';
      case EncryptionMode.sseS3:
        return 'SSE-S3';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Options that define how DataBrew will interpret a Microsoft Excel file, when
/// creating a dataset from that file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExcelOptions {
  /// Specifies one or more sheet numbers in the Excel file, which will be
  /// included in the dataset.
  @_s.JsonKey(name: 'SheetIndexes')
  final List<int> sheetIndexes;

  /// Specifies one or more named sheets in the Excel file, which will be included
  /// in the dataset.
  @_s.JsonKey(name: 'SheetNames')
  final List<String> sheetNames;

  ExcelOptions({
    this.sheetIndexes,
    this.sheetNames,
  });
  factory ExcelOptions.fromJson(Map<String, dynamic> json) =>
      _$ExcelOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ExcelOptionsToJson(this);
}

/// Options that define how Microsoft Excel input is to be interpreted by
/// DataBrew.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FormatOptions {
  /// Options that define how Excel input is to be interpreted by DataBrew.
  @_s.JsonKey(name: 'Excel')
  final ExcelOptions excel;

  /// Options that define how JSON input is to be interpreted by DataBrew.
  @_s.JsonKey(name: 'Json')
  final JsonOptions json;

  FormatOptions({
    this.excel,
    this.json,
  });
  factory FormatOptions.fromJson(Map<String, dynamic> json) =>
      _$FormatOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$FormatOptionsToJson(this);
}

/// Information on how AWS Glue DataBrew can find data, in either the AWS Glue
/// Data Catalog or Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Input {
  /// The AWS Glue Data Catalog parameters for the data.
  @_s.JsonKey(name: 'DataCatalogInputDefinition')
  final DataCatalogInputDefinition dataCatalogInputDefinition;

  /// The Amazon S3 location where the data is stored.
  @_s.JsonKey(name: 'S3InputDefinition')
  final S3Location s3InputDefinition;

  Input({
    this.dataCatalogInputDefinition,
    this.s3InputDefinition,
  });
  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  Map<String, dynamic> toJson() => _$InputToJson(this);
}

/// Represents all of the attributes of an AWS Glue DataBrew job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// The unique name of the job.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the AWS account that owns the job.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The date and time that the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (the user name) of the user who created the job.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// A dataset that the job is to process.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The Amazon Resource Name (ARN) of an encryption key that is used to protect
  /// a job.
  @_s.JsonKey(name: 'EncryptionKeyArn')
  final String encryptionKeyArn;

  /// The encryption mode for the job, which can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>SSE-KMS</code> - Server-side encryption with AWS KMS-managed keys.
  /// </li>
  /// <li>
  /// <code>SSE-S3</code> - Server-side encryption with keys managed by Amazon S3.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EncryptionMode')
  final EncryptionMode encryptionMode;

  /// The identifier (the user name) of the user who last modified the job.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The modification date and time of the job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The current status of Amazon CloudWatch logging for the job.
  @_s.JsonKey(name: 'LogSubscription')
  final LogSubscription logSubscription;

  /// The maximum number of nodes that can be consumed when the job processes
  /// data.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The maximum number of times to retry the job after a job run fails.
  @_s.JsonKey(name: 'MaxRetries')
  final int maxRetries;

  /// One or more artifacts that represent output from running the job.
  @_s.JsonKey(name: 'Outputs')
  final List<Output> outputs;

  /// The name of the project that the job is associated with.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  /// A set of steps that the job runs.
  @_s.JsonKey(name: 'RecipeReference')
  final RecipeReference recipeReference;

  /// The unique Amazon Resource Name (ARN) for the job.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The Amazon Resource Name (ARN) of the role that will be assumed for this
  /// job.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Metadata tags that have been applied to the job.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The job's timeout in minutes. A job that attempts to run longer than this
  /// timeout period ends with a status of <code>TIMEOUT</code>.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

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
  @_s.JsonKey(name: 'Type')
  final JobType type;

  Job({
    @_s.required this.name,
    this.accountId,
    this.createDate,
    this.createdBy,
    this.datasetName,
    this.encryptionKeyArn,
    this.encryptionMode,
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
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// Represents one run of an AWS Glue DataBrew job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobRun {
  /// The number of times that DataBrew has attempted to run the job.
  @_s.JsonKey(name: 'Attempt')
  final int attempt;

  /// The date and time when the job completed processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletedOn')
  final DateTime completedOn;

  /// The name of the dataset for the job to process.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// A message indicating an error (if any) that was encountered when the job
  /// ran.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The amount of time, in seconds, during which a job run consumed resources.
  @_s.JsonKey(name: 'ExecutionTime')
  final int executionTime;

  /// The name of the job being processed during this run.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The name of an Amazon CloudWatch log group, where the job writes diagnostic
  /// messages when it runs.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The current status of Amazon CloudWatch logging for the job run.
  @_s.JsonKey(name: 'LogSubscription')
  final LogSubscription logSubscription;

  /// One or more output artifacts from a job run.
  @_s.JsonKey(name: 'Outputs')
  final List<Output> outputs;

  /// The set of steps processed by the job.
  @_s.JsonKey(name: 'RecipeReference')
  final RecipeReference recipeReference;

  /// The unique identifier of the job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  /// The identifier (the user name) of the user who initiated the job run.
  @_s.JsonKey(name: 'StartedBy')
  final String startedBy;

  /// The date and time when the job run began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedOn')
  final DateTime startedOn;

  /// The current state of the job run entity itself.
  @_s.JsonKey(name: 'State')
  final JobRunState state;

  JobRun({
    this.attempt,
    this.completedOn,
    this.datasetName,
    this.errorMessage,
    this.executionTime,
    this.jobName,
    this.logGroupName,
    this.logSubscription,
    this.outputs,
    this.recipeReference,
    this.runId,
    this.startedBy,
    this.startedOn,
    this.state,
  });
  factory JobRun.fromJson(Map<String, dynamic> json) => _$JobRunFromJson(json);
}

enum JobRunState {
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMEOUT')
  timeout,
}

enum JobType {
  @_s.JsonValue('PROFILE')
  profile,
  @_s.JsonValue('RECIPE')
  recipe,
}

/// Represents the JSON-specific options that define how input is to be
/// interpreted by AWS Glue DataBrew.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JsonOptions {
  /// A value that specifies whether JSON input contains embedded new line
  /// characters.
  @_s.JsonKey(name: 'MultiLine')
  final bool multiLine;

  JsonOptions({
    this.multiLine,
  });
  factory JsonOptions.fromJson(Map<String, dynamic> json) =>
      _$JsonOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$JsonOptionsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetsResponse {
  /// A list of datasets that are defined in the current AWS account.
  @_s.JsonKey(name: 'Datasets')
  final List<Dataset> datasets;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To obtain the next set of pages, pass in
  /// the NextToken from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDatasetsResponse({
    @_s.required this.datasets,
    this.nextToken,
  });
  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobRunsResponse {
  /// A list of job runs that have occurred for the specified job.
  @_s.JsonKey(name: 'JobRuns')
  final List<JobRun> jobRuns;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To obtain the next set of pages, pass in
  /// the NextToken from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJobRunsResponse({
    @_s.required this.jobRuns,
    this.nextToken,
  });
  factory ListJobRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// A list of jobs that are defined in the current AWS account.
  @_s.JsonKey(name: 'Jobs')
  final List<Job> jobs;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To obtain the next set of pages, pass in
  /// the NextToken from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJobsResponse({
    @_s.required this.jobs,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResponse {
  /// A list of projects that are defined in the current AWS account.
  @_s.JsonKey(name: 'Projects')
  final List<Project> projects;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To get the next set of pages, pass in the
  /// NextToken value from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProjectsResponse({
    @_s.required this.projects,
    this.nextToken,
  });
  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecipeVersionsResponse {
  /// A list of versions for the specified recipe.
  @_s.JsonKey(name: 'Recipes')
  final List<Recipe> recipes;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To get the next set of pages, pass in the
  /// NextToken value from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRecipeVersionsResponse({
    @_s.required this.recipes,
    this.nextToken,
  });
  factory ListRecipeVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecipeVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecipesResponse {
  /// A list of recipes that are defined in the current AWS account.
  @_s.JsonKey(name: 'Recipes')
  final List<Recipe> recipes;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To get the next set of pages, pass in the
  /// NextToken value from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRecipesResponse({
    @_s.required this.recipes,
    this.nextToken,
  });
  factory ListRecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecipesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSchedulesResponse {
  /// A list of schedules in the current AWS account.
  @_s.JsonKey(name: 'Schedules')
  final List<Schedule> schedules;

  /// A token generated by DataBrew that specifies where to continue pagination if
  /// a previous request was truncated. To get the next set of pages, pass in the
  /// NextToken value from the response object of the previous page call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSchedulesResponse({
    @_s.required this.schedules,
    this.nextToken,
  });
  factory ListSchedulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSchedulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tags associated with the DataBrew resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LogSubscription {
  @_s.JsonValue('ENABLE')
  enable,
  @_s.JsonValue('DISABLE')
  disable,
}

extension on LogSubscription {
  String toValue() {
    switch (this) {
      case LogSubscription.enable:
        return 'ENABLE';
      case LogSubscription.disable:
        return 'DISABLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents individual output from a particular job run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Output {
  /// The location in Amazon S3 where the job writes its output.
  @_s.JsonKey(name: 'Location')
  final S3Location location;

  /// The compression algorithm used to compress the output text of the job.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The data format of the output of the job.
  @_s.JsonKey(name: 'Format')
  final OutputFormat format;

  /// A value that, if true, means that any data in the location specified for
  /// output is overwritten with new output.
  @_s.JsonKey(name: 'Overwrite')
  final bool overwrite;

  /// The names of one or more partition columns for the output of the job.
  @_s.JsonKey(name: 'PartitionColumns')
  final List<String> partitionColumns;

  Output({
    @_s.required this.location,
    this.compressionFormat,
    this.format,
    this.overwrite,
    this.partitionColumns,
  });
  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);

  Map<String, dynamic> toJson() => _$OutputToJson(this);
}

enum OutputFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('PARQUET')
  parquet,
  @_s.JsonValue('GLUEPARQUET')
  glueparquet,
  @_s.JsonValue('AVRO')
  avro,
  @_s.JsonValue('ORC')
  orc,
  @_s.JsonValue('XML')
  xml,
}

/// Represents all of the attributes of an AWS Glue DataBrew project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Project {
  /// The unique name of a project.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of a recipe that will be developed during a project session.
  @_s.JsonKey(name: 'RecipeName')
  final String recipeName;

  /// The ID of the AWS account that owns the project.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The date and time that the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (the user name) of the user who crated the project.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The dataset that the project is to act upon.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The identifier (user name) of the user who last modified the project.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The last modification date and time for the project.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The date and time when the project was opened.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'OpenDate')
  final DateTime openDate;

  /// The identifier (the user name) of the user that opened the project for use.
  @_s.JsonKey(name: 'OpenedBy')
  final String openedBy;

  /// The Amazon Resource Name (ARN) for the project.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The Amazon Resource Name (ARN) of the role that will be assumed for this
  /// project.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The sample size and sampling type to apply to the data. If this parameter
  /// isn't specified, then the sample will consiste of the first 500 rows from
  /// the dataset.
  @_s.JsonKey(name: 'Sample')
  final Sample sample;

  /// Metadata tags that have been applied to the project.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Project({
    @_s.required this.name,
    @_s.required this.recipeName,
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
  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PublishRecipeResponse {
  /// The name of the recipe that you published.
  @_s.JsonKey(name: 'Name')
  final String name;

  PublishRecipeResponse({
    @_s.required this.name,
  });
  factory PublishRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$PublishRecipeResponseFromJson(json);
}

/// Represents one or more actions to be performed on an AWS Glue DataBrew
/// dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Recipe {
  /// The unique name for the recipe.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the recipe was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (the user name) of the user who created the recipe.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The description of the recipe.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier (user name) of the user who last modified the recipe.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The last modification date and time of the recipe.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The name of the project that the recipe is associated with.
  @_s.JsonKey(name: 'ProjectName')
  final String projectName;

  /// The identifier (the user name) of the user who published the recipe.
  @_s.JsonKey(name: 'PublishedBy')
  final String publishedBy;

  /// The date and time when the recipe was published.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'PublishedDate')
  final DateTime publishedDate;

  /// The identifier for the version for the recipe.
  @_s.JsonKey(name: 'RecipeVersion')
  final String recipeVersion;

  /// The Amazon Resource Name (ARN) for the recipe.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// A list of steps that are defined by the recipe.
  @_s.JsonKey(name: 'Steps')
  final List<RecipeStep> steps;

  /// Metadata tags that have been applied to the recipe.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Recipe({
    @_s.required this.name,
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
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

/// Represents a transformation and associated parameters that are used to apply
/// a change to an AWS Glue DataBrew dataset. For more information, see <a
/// href="https://docs.aws.amazon.com/databrew/latest/dg/recipe-structure.html">Recipe
/// structure</a> and <a
/// href="https://docs.aws.amazon.com/databrew/latest/dg/recipe-actions-reference.html">ecipe
/// actions reference</a> .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecipeAction {
  /// The name of a valid DataBrew transformation to be performed on the data.
  @_s.JsonKey(name: 'Operation')
  final String operation;

  /// Contextual parameters for the transformation.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, String> parameters;

  RecipeAction({
    @_s.required this.operation,
    this.parameters,
  });
  factory RecipeAction.fromJson(Map<String, dynamic> json) =>
      _$RecipeActionFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeActionToJson(this);
}

/// Represents all of the attributes of an AWS Glue DataBrew recipe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecipeReference {
  /// The name of the recipe.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The identifier for the version for the recipe.
  @_s.JsonKey(name: 'RecipeVersion')
  final String recipeVersion;

  RecipeReference({
    @_s.required this.name,
    this.recipeVersion,
  });
  factory RecipeReference.fromJson(Map<String, dynamic> json) =>
      _$RecipeReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeReferenceToJson(this);
}

/// Represents a single step to be performed in an AWS Glue DataBrew recipe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecipeStep {
  /// The particular action to be performed in the recipe step.
  @_s.JsonKey(name: 'Action')
  final RecipeAction action;

  /// One or more conditions that must be met, in order for the recipe step to
  /// succeed.
  /// <note>
  /// All of the conditions in the array must be met. In other words, all of the
  /// conditions must be combined using a logical AND operation.
  /// </note>
  @_s.JsonKey(name: 'ConditionExpressions')
  final List<ConditionExpression> conditionExpressions;

  RecipeStep({
    @_s.required this.action,
    this.conditionExpressions,
  });
  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
}

/// Represents any errors encountered when attempting to delete multiple recipe
/// versions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecipeVersionErrorDetail {
  /// The HTTP status code for the error.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The text of the error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier for the recipe version associated with this error.
  @_s.JsonKey(name: 'RecipeVersion')
  final String recipeVersion;

  RecipeVersionErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.recipeVersion,
  });
  factory RecipeVersionErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$RecipeVersionErrorDetailFromJson(json);
}

/// An Amazon S3 location (bucket name an object key) where DataBrew can read
/// input data, or write output from a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// The S3 bucket name.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The unique name of the object in the bucket.
  @_s.JsonKey(name: 'Key')
  final String key;

  S3Location({
    @_s.required this.bucket,
    this.key,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

/// Represents the sample size and sampling type for AWS Glue DataBrew to use
/// for interactive data analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Sample {
  /// The way in which DataBrew obtains rows from a dataset.
  @_s.JsonKey(name: 'Type')
  final SampleType type;

  /// The number of rows in the sample.
  @_s.JsonKey(name: 'Size')
  final int size;

  Sample({
    @_s.required this.type,
    this.size,
  });
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);

  Map<String, dynamic> toJson() => _$SampleToJson(this);
}

enum SampleType {
  @_s.JsonValue('FIRST_N')
  firstN,
  @_s.JsonValue('LAST_N')
  lastN,
  @_s.JsonValue('RANDOM')
  random,
}

/// Represents one or more dates and times when a job is to run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Schedule {
  /// The name of the schedule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the AWS account that owns the schedule.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The date and time that the schedule was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateDate')
  final DateTime createDate;

  /// The identifier (the user name) of the user who created the schedule.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date(s) and time(s), in <code>cron</code> format, when the job will run.
  @_s.JsonKey(name: 'CronExpression')
  final String cronExpression;

  /// A list of jobs to be run, according to the schedule.
  @_s.JsonKey(name: 'JobNames')
  final List<String> jobNames;

  /// The identifier (the user name) of the user who last modified the schedule.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the schedule was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the schedule.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// Metadata tags that have been applied to the schedule.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Schedule({
    @_s.required this.name,
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
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendProjectSessionActionResponse {
  /// The name of the project that was affected by the action.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A unique identifier for the action that was performed.
  @_s.JsonKey(name: 'ActionId')
  final int actionId;

  /// A message indicating the result of performing the action.
  @_s.JsonKey(name: 'Result')
  final String result;

  SendProjectSessionActionResponse({
    @_s.required this.name,
    this.actionId,
    this.result,
  });
  factory SendProjectSessionActionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SendProjectSessionActionResponseFromJson(json);
}

enum SessionStatus {
  @_s.JsonValue('ASSIGNED')
  assigned,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INITIALIZING')
  initializing,
  @_s.JsonValue('PROVISIONING')
  provisioning,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('RECYCLING')
  recycling,
  @_s.JsonValue('ROTATING')
  rotating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('UPDATING')
  updating,
}

enum Source {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('DATA-CATALOG')
  dataCatalog,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobRunResponse {
  /// A system-generated identifier for this particular job run.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  StartJobRunResponse({
    @_s.required this.runId,
  });
  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StartJobRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartProjectSessionResponse {
  /// The name of the project to be acted upon.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A system-generated identifier for the session.
  @_s.JsonKey(name: 'ClientSessionId')
  final String clientSessionId;

  StartProjectSessionResponse({
    @_s.required this.name,
    this.clientSessionId,
  });
  factory StartProjectSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartProjectSessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopJobRunResponse {
  /// The ID of the job run that you stopped.
  @_s.JsonKey(name: 'RunId')
  final String runId;

  StopJobRunResponse({
    @_s.required this.runId,
  });
  factory StopJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StopJobRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDatasetResponse {
  /// The name of the dataset that you updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateDatasetResponse({
    @_s.required this.name,
  });
  factory UpdateDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProfileJobResponse {
  /// The name of the job that was updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateProfileJobResponse({
    @_s.required this.name,
  });
  factory UpdateProfileJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResponse {
  /// The name of the project that you updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The date and time that the project was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  UpdateProjectResponse({
    @_s.required this.name,
    this.lastModifiedDate,
  });
  factory UpdateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRecipeJobResponse {
  /// The name of the job that you updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateRecipeJobResponse({
    @_s.required this.name,
  });
  factory UpdateRecipeJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecipeJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRecipeResponse {
  /// The name of the recipe that was updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateRecipeResponse({
    @_s.required this.name,
  });
  factory UpdateRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateScheduleResponse {
  /// The name of the schedule that was updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateScheduleResponse({
    @_s.required this.name,
  });
  factory UpdateScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateScheduleResponseFromJson(json);
}

/// Represents the data being being transformed during an AWS Glue DataBrew
/// project session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ViewFrame {
  /// The starting index for the range of columns to return in the view frame.
  @_s.JsonKey(name: 'StartColumnIndex')
  final int startColumnIndex;

  /// The number of columns to include in the view frame, beginning with the
  /// <code>StartColumnIndex</code> value and ignoring any columns in the
  /// <code>HiddenColumns</code> list.
  @_s.JsonKey(name: 'ColumnRange')
  final int columnRange;

  /// A list of columns to hide in the view frame.
  @_s.JsonKey(name: 'HiddenColumns')
  final List<String> hiddenColumns;

  ViewFrame({
    @_s.required this.startColumnIndex,
    this.columnRange,
    this.hiddenColumns,
  });
  Map<String, dynamic> toJson() => _$ViewFrameToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
