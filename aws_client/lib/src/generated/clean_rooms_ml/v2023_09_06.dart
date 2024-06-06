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

/// Welcome to the <i>Amazon Web Services Clean Rooms ML API Reference</i>.
///
/// Amazon Web Services Clean Rooms ML provides a privacy-enhancing method for
/// two parties to identify similar users in their data without the need to
/// share their data with each other. The first party brings the training data
/// to Clean Rooms so that they can create and configure an audience model
/// (lookalike model) and associate it with a collaboration. The second party
/// then brings their seed data to Clean Rooms and generates an audience
/// (lookalike segment) that resembles the training data.
///
/// To learn more about Amazon Web Services Clean Rooms ML concepts, procedures,
/// and best practices, see the <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/userguide/machine-learning.html">Clean
/// Rooms User Guide</a>.
///
/// To learn more about SQL commands, functions, and conditions supported in
/// Clean Rooms, see the <a
/// href="https://docs.aws.amazon.com/clean-rooms/latest/sql-reference/sql-reference.html">Clean
/// Rooms SQL Reference</a>.
class CleanRoomsML {
  final _s.RestJsonProtocol _protocol;
  CleanRoomsML({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cleanrooms-ml',
            signingName: 'cleanrooms-ml',
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

  /// Defines the information necessary to create an audience model. An audience
  /// model is a machine learning model that Clean Rooms ML trains to measure
  /// similarity between users. Clean Rooms ML manages training and storing the
  /// audience model. The audience model can be used in multiple calls to the
  /// <a>StartAudienceGenerationJob</a> API.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name of the audience model resource.
  ///
  /// Parameter [trainingDatasetArn] :
  /// The Amazon Resource Name (ARN) of the training dataset for this audience
  /// model.
  ///
  /// Parameter [description] :
  /// The description of the audience model.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the trained ML model and the associated
  /// data.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the resource to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete
  /// tag keys with this prefix. Values can have this prefix. If a tag value has
  /// aws as its prefix but the key does not, then Clean Rooms ML considers it
  /// to be a user tag and will count against the limit of 50 tags. Tags with
  /// only the key prefix of aws do not count against your tags per resource
  /// limit.
  /// </li>
  /// </ul>
  ///
  /// Parameter [trainingDataEndTime] :
  /// The end date and time of the training window.
  ///
  /// Parameter [trainingDataStartTime] :
  /// The start date and time of the training window.
  Future<CreateAudienceModelResponse> createAudienceModel({
    required String name,
    required String trainingDatasetArn,
    String? description,
    String? kmsKeyArn,
    Map<String, String>? tags,
    DateTime? trainingDataEndTime,
    DateTime? trainingDataStartTime,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'trainingDatasetArn': trainingDatasetArn,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (trainingDataEndTime != null)
        'trainingDataEndTime': iso8601ToJson(trainingDataEndTime),
      if (trainingDataStartTime != null)
        'trainingDataStartTime': iso8601ToJson(trainingDataStartTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audience-model',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAudienceModelResponse.fromJson(response);
  }

  /// Defines the information necessary to create a configured audience model.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [audienceModelArn] :
  /// The Amazon Resource Name (ARN) of the audience model to use for the
  /// configured audience model.
  ///
  /// Parameter [name] :
  /// The name of the configured audience model.
  ///
  /// Parameter [outputConfig] :
  /// Configure the Amazon S3 location and IAM Role for audiences created using
  /// this configured audience model. Each audience will have a unique location.
  /// The IAM Role must have <code>s3:PutObject</code> permission on the
  /// destination Amazon S3 location. If the destination is protected with
  /// Amazon S3 KMS-SSE, then the Role must also have the required KMS
  /// permissions.
  ///
  /// Parameter [sharedAudienceMetrics] :
  /// Whether audience metrics are shared.
  ///
  /// Parameter [audienceSizeConfig] :
  /// Configure the list of output sizes of audiences that can be created using
  /// this configured audience model. A request to
  /// <a>StartAudienceGenerationJob</a> that uses this configured audience model
  /// must have an <code>audienceSize</code> selected from this list. You can
  /// use the <code>ABSOLUTE</code> <a>AudienceSize</a> to configure out
  /// audience sizes using the count of identifiers in the output. You can use
  /// the <code>Percentage</code> <a>AudienceSize</a> to configure sizes in the
  /// range 1-100 percent.
  ///
  /// Parameter [childResourceTagOnCreatePolicy] :
  /// Configure how the service tags audience generation jobs created using this
  /// configured audience model. If you specify <code>NONE</code>, the tags from
  /// the <a>StartAudienceGenerationJob</a> request determine the tags of the
  /// audience generation job. If you specify <code>FROM_PARENT_RESOURCE</code>,
  /// the audience generation job inherits the tags from the configured audience
  /// model, by default. Tags in the <a>StartAudienceGenerationJob</a> will
  /// override the default.
  ///
  /// When the client is in a different account than the configured audience
  /// model, the tags from the client are never applied to a resource in the
  /// caller's account.
  ///
  /// Parameter [description] :
  /// The description of the configured audience model.
  ///
  /// Parameter [minMatchingSeedSize] :
  /// The minimum number of users from the seed audience that must match with
  /// users in the training data of the audience model. The default value is
  /// 500.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the resource to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete
  /// tag keys with this prefix. Values can have this prefix. If a tag value has
  /// aws as its prefix but the key does not, then Clean Rooms ML considers it
  /// to be a user tag and will count against the limit of 50 tags. Tags with
  /// only the key prefix of aws do not count against your tags per resource
  /// limit.
  /// </li>
  /// </ul>
  Future<CreateConfiguredAudienceModelResponse> createConfiguredAudienceModel({
    required String audienceModelArn,
    required String name,
    required ConfiguredAudienceModelOutputConfig outputConfig,
    required List<SharedAudienceMetrics> sharedAudienceMetrics,
    AudienceSizeConfig? audienceSizeConfig,
    TagOnCreatePolicy? childResourceTagOnCreatePolicy,
    String? description,
    int? minMatchingSeedSize,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'minMatchingSeedSize',
      minMatchingSeedSize,
      25,
      500000,
    );
    final $payload = <String, dynamic>{
      'audienceModelArn': audienceModelArn,
      'name': name,
      'outputConfig': outputConfig,
      'sharedAudienceMetrics':
          sharedAudienceMetrics.map((e) => e.toValue()).toList(),
      if (audienceSizeConfig != null) 'audienceSizeConfig': audienceSizeConfig,
      if (childResourceTagOnCreatePolicy != null)
        'childResourceTagOnCreatePolicy':
            childResourceTagOnCreatePolicy.toValue(),
      if (description != null) 'description': description,
      if (minMatchingSeedSize != null)
        'minMatchingSeedSize': minMatchingSeedSize,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configured-audience-model',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredAudienceModelResponse.fromJson(response);
  }

  /// Defines the information necessary to create a training dataset. In Clean
  /// Rooms ML, the <code>TrainingDataset</code> is metadata that points to a
  /// Glue table, which is read only during <code>AudienceModel</code> creation.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the training dataset. This name must be unique in your account
  /// and region.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that Clean Rooms ML can assume to read the data
  /// referred to in the <code>dataSource</code> field of each dataset.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>AccessDeniedException</code>
  /// error.
  ///
  /// Parameter [trainingData] :
  /// An array of information that lists the Dataset objects, which specifies
  /// the dataset type and details on its location and schema. You must provide
  /// a role that has read access to these tables.
  ///
  /// Parameter [description] :
  /// The description of the training dataset.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the resource to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete
  /// tag keys with this prefix. Values can have this prefix. If a tag value has
  /// aws as its prefix but the key does not, then Clean Rooms ML considers it
  /// to be a user tag and will count against the limit of 50 tags. Tags with
  /// only the key prefix of aws do not count against your tags per resource
  /// limit.
  /// </li>
  /// </ul>
  Future<CreateTrainingDatasetResponse> createTrainingDataset({
    required String name,
    required String roleArn,
    required List<Dataset> trainingData,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'roleArn': roleArn,
      'trainingData': trainingData,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/training-dataset',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTrainingDatasetResponse.fromJson(response);
  }

  /// Deletes the specified audience generation job, and removes all data
  /// associated with the job.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [audienceGenerationJobArn] :
  /// The Amazon Resource Name (ARN) of the audience generation job that you
  /// want to delete.
  Future<void> deleteAudienceGenerationJob({
    required String audienceGenerationJobArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/audience-generation-job/${Uri.encodeComponent(audienceGenerationJobArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specifies an audience model that you want to delete. You can't delete an
  /// audience model if there are any configured audience models that depend on
  /// the audience model.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [audienceModelArn] :
  /// The Amazon Resource Name (ARN) of the audience model that you want to
  /// delete.
  Future<void> deleteAudienceModel({
    required String audienceModelArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/audience-model/${Uri.encodeComponent(audienceModelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified configured audience model. You can't delete a
  /// configured audience model if there are any lookalike models that use the
  /// configured audience model. If you delete a configured audience model, it
  /// will be removed from any collaborations that it is associated to.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that you
  /// want to delete.
  Future<void> deleteConfiguredAudienceModel({
    required String configuredAudienceModelArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified configured audience model policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model policy
  /// that you want to delete.
  Future<void> deleteConfiguredAudienceModelPolicy({
    required String configuredAudienceModelArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specifies a training dataset that you want to delete. You can't delete a
  /// training dataset if there are any audience models that depend on the
  /// training dataset. In Clean Rooms ML, the <code>TrainingDataset</code> is
  /// metadata that points to a Glue table, which is read only during
  /// <code>AudienceModel</code> creation. This action deletes the metadata.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [trainingDatasetArn] :
  /// The Amazon Resource Name (ARN) of the training dataset that you want to
  /// delete.
  Future<void> deleteTrainingDataset({
    required String trainingDatasetArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/training-dataset/${Uri.encodeComponent(trainingDatasetArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about an audience generation job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [audienceGenerationJobArn] :
  /// The Amazon Resource Name (ARN) of the audience generation job that you are
  /// interested in.
  Future<GetAudienceGenerationJobResponse> getAudienceGenerationJob({
    required String audienceGenerationJobArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/audience-generation-job/${Uri.encodeComponent(audienceGenerationJobArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAudienceGenerationJobResponse.fromJson(response);
  }

  /// Returns information about an audience model
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [audienceModelArn] :
  /// The Amazon Resource Name (ARN) of the audience model that you are
  /// interested in.
  Future<GetAudienceModelResponse> getAudienceModel({
    required String audienceModelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audience-model/${Uri.encodeComponent(audienceModelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAudienceModelResponse.fromJson(response);
  }

  /// Returns information about a specified configured audience model.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that you
  /// are interested in.
  Future<GetConfiguredAudienceModelResponse> getConfiguredAudienceModel({
    required String configuredAudienceModelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredAudienceModelResponse.fromJson(response);
  }

  /// Returns information about a configured audience model policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that you
  /// are interested in.
  Future<GetConfiguredAudienceModelPolicyResponse>
      getConfiguredAudienceModelPolicy({
    required String configuredAudienceModelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredAudienceModelPolicyResponse.fromJson(response);
  }

  /// Returns information about a training dataset.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [trainingDatasetArn] :
  /// The Amazon Resource Name (ARN) of the training dataset that you are
  /// interested in.
  Future<GetTrainingDatasetResponse> getTrainingDataset({
    required String trainingDatasetArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/training-dataset/${Uri.encodeComponent(trainingDatasetArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrainingDatasetResponse.fromJson(response);
  }

  /// Returns a list of the audience export jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [audienceGenerationJobArn] :
  /// The Amazon Resource Name (ARN) of the audience generation job that you are
  /// interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListAudienceExportJobsResponse> listAudienceExportJobs({
    String? audienceGenerationJobArn,
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
      if (audienceGenerationJobArn != null)
        'audienceGenerationJobArn': [audienceGenerationJobArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audience-export-job',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAudienceExportJobsResponse.fromJson(response);
  }

  /// Returns a list of audience generation jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [collaborationId] :
  /// The identifier of the collaboration that contains the audience generation
  /// jobs that you are interested in.
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that was
  /// used for the audience generation jobs that you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListAudienceGenerationJobsResponse> listAudienceGenerationJobs({
    String? collaborationId,
    String? configuredAudienceModelArn,
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
      if (collaborationId != null) 'collaborationId': [collaborationId],
      if (configuredAudienceModelArn != null)
        'configuredAudienceModelArn': [configuredAudienceModelArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audience-generation-job',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAudienceGenerationJobsResponse.fromJson(response);
  }

  /// Returns a list of audience models.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListAudienceModelsResponse> listAudienceModels({
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
      requestUri: '/audience-model',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAudienceModelsResponse.fromJson(response);
  }

  /// Returns a list of the configured audience models.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListConfiguredAudienceModelsResponse> listConfiguredAudienceModels({
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
      requestUri: '/configured-audience-model',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredAudienceModelsResponse.fromJson(response);
  }

  /// Returns a list of tags for a provided resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you are interested in.
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

  /// Returns a list of training datasets.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListTrainingDatasetsResponse> listTrainingDatasets({
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
      requestUri: '/training-dataset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrainingDatasetsResponse.fromJson(response);
  }

  /// Create or update the resource policy for a configured audience model.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that the
  /// resource policy will govern.
  ///
  /// Parameter [configuredAudienceModelPolicy] :
  /// The IAM resource policy.
  ///
  /// Parameter [policyExistenceCondition] :
  /// Use this to prevent unexpected concurrent modification of the policy.
  ///
  /// Parameter [previousPolicyHash] :
  /// A cryptographic hash of the contents of the policy used to prevent
  /// unexpected concurrent modification of the policy.
  Future<PutConfiguredAudienceModelPolicyResponse>
      putConfiguredAudienceModelPolicy({
    required String configuredAudienceModelArn,
    required String configuredAudienceModelPolicy,
    PolicyExistenceCondition? policyExistenceCondition,
    String? previousPolicyHash,
  }) async {
    final $payload = <String, dynamic>{
      'configuredAudienceModelPolicy': configuredAudienceModelPolicy,
      if (policyExistenceCondition != null)
        'policyExistenceCondition': policyExistenceCondition.toValue(),
      if (previousPolicyHash != null) 'previousPolicyHash': previousPolicyHash,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutConfiguredAudienceModelPolicyResponse.fromJson(response);
  }

  /// Export an audience of a specified size after you have generated an
  /// audience.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [audienceGenerationJobArn] :
  /// The Amazon Resource Name (ARN) of the audience generation job that you
  /// want to export.
  ///
  /// Parameter [name] :
  /// The name of the audience export job.
  ///
  /// Parameter [description] :
  /// The description of the audience export job.
  Future<void> startAudienceExportJob({
    required String audienceGenerationJobArn,
    required AudienceSize audienceSize,
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'audienceGenerationJobArn': audienceGenerationJobArn,
      'audienceSize': audienceSize,
      'name': name,
      if (description != null) 'description': description,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audience-export-job',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Information necessary to start the audience generation job.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that is
  /// used for this audience generation job.
  ///
  /// Parameter [name] :
  /// The name of the audience generation job.
  ///
  /// Parameter [seedAudience] :
  /// The seed audience that is used to generate the audience.
  ///
  /// Parameter [collaborationId] :
  /// The identifier of the collaboration that contains the audience generation
  /// job.
  ///
  /// Parameter [description] :
  /// The description of the audience generation job.
  ///
  /// Parameter [includeSeedInOutput] :
  /// Whether the seed audience is included in the audience generation output.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the resource to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete
  /// tag keys with this prefix. Values can have this prefix. If a tag value has
  /// aws as its prefix but the key does not, then Clean Rooms ML considers it
  /// to be a user tag and will count against the limit of 50 tags. Tags with
  /// only the key prefix of aws do not count against your tags per resource
  /// limit.
  /// </li>
  /// </ul>
  Future<StartAudienceGenerationJobResponse> startAudienceGenerationJob({
    required String configuredAudienceModelArn,
    required String name,
    required AudienceGenerationJobDataSource seedAudience,
    String? collaborationId,
    String? description,
    bool? includeSeedInOutput,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'name': name,
      'seedAudience': seedAudience,
      if (collaborationId != null) 'collaborationId': collaborationId,
      if (description != null) 'description': description,
      if (includeSeedInOutput != null)
        'includeSeedInOutput': includeSeedInOutput,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audience-generation-job',
      exceptionFnMap: _exceptionFns,
    );
    return StartAudienceGenerationJobResponse.fromJson(response);
  }

  /// Adds metadata tags to a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to assign
  /// tags.
  ///
  /// Parameter [tags] :
  /// The optional metadata that you apply to the resource to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per resource - 50.
  /// </li>
  /// <li>
  /// For each resource, each tag key must be unique, and each tag key can have
  /// only one value.
  /// </li>
  /// <li>
  /// Maximum key length - 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length - 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// If your tagging schema is used across multiple services and resources,
  /// remember that other services may have restrictions on allowed characters.
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete
  /// tag keys with this prefix. Values can have this prefix. If a tag value has
  /// aws as its prefix but the key does not, then Clean Rooms considers it to
  /// be a user tag and will count against the limit of 50 tags. Tags with only
  /// the key prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
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

  /// Removes metadata tags from a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The key values of tags that you want to remove.
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

  /// Provides the information necessary to update a configured audience model.
  /// Updates that impact audience generation jobs take effect when a new job
  /// starts, but do not impact currently running jobs.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [configuredAudienceModelArn] :
  /// The Amazon Resource Name (ARN) of the configured audience model that you
  /// want to update.
  ///
  /// Parameter [audienceModelArn] :
  /// The Amazon Resource Name (ARN) of the new audience model that you want to
  /// use.
  ///
  /// Parameter [audienceSizeConfig] :
  /// The new audience size configuration.
  ///
  /// Parameter [description] :
  /// The new description of the configured audience model.
  ///
  /// Parameter [minMatchingSeedSize] :
  /// The minimum number of users from the seed audience that must match with
  /// users in the training data of the audience model.
  ///
  /// Parameter [outputConfig] :
  /// The new output configuration.
  ///
  /// Parameter [sharedAudienceMetrics] :
  /// The new value for whether to share audience metrics.
  Future<UpdateConfiguredAudienceModelResponse> updateConfiguredAudienceModel({
    required String configuredAudienceModelArn,
    String? audienceModelArn,
    AudienceSizeConfig? audienceSizeConfig,
    String? description,
    int? minMatchingSeedSize,
    ConfiguredAudienceModelOutputConfig? outputConfig,
    List<SharedAudienceMetrics>? sharedAudienceMetrics,
  }) async {
    _s.validateNumRange(
      'minMatchingSeedSize',
      minMatchingSeedSize,
      25,
      500000,
    );
    final $payload = <String, dynamic>{
      if (audienceModelArn != null) 'audienceModelArn': audienceModelArn,
      if (audienceSizeConfig != null) 'audienceSizeConfig': audienceSizeConfig,
      if (description != null) 'description': description,
      if (minMatchingSeedSize != null)
        'minMatchingSeedSize': minMatchingSeedSize,
      if (outputConfig != null) 'outputConfig': outputConfig,
      if (sharedAudienceMetrics != null)
        'sharedAudienceMetrics':
            sharedAudienceMetrics.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/configured-audience-model/${Uri.encodeComponent(configuredAudienceModelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfiguredAudienceModelResponse.fromJson(response);
  }
}

/// Defines the Amazon S3 bucket where the configured audience is stored.
class AudienceDestination {
  /// The Amazon S3 bucket and path for the configured audience.
  final S3ConfigMap s3Destination;

  AudienceDestination({
    required this.s3Destination,
  });

  factory AudienceDestination.fromJson(Map<String, dynamic> json) {
    return AudienceDestination(
      s3Destination:
          S3ConfigMap.fromJson(json['s3Destination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      's3Destination': s3Destination,
    };
  }
}

enum AudienceExportJobStatus {
  createPending,
  createInProgress,
  createFailed,
  active,
}

extension AudienceExportJobStatusValueExtension on AudienceExportJobStatus {
  String toValue() {
    switch (this) {
      case AudienceExportJobStatus.createPending:
        return 'CREATE_PENDING';
      case AudienceExportJobStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case AudienceExportJobStatus.createFailed:
        return 'CREATE_FAILED';
      case AudienceExportJobStatus.active:
        return 'ACTIVE';
    }
  }
}

extension AudienceExportJobStatusFromString on String {
  AudienceExportJobStatus toAudienceExportJobStatus() {
    switch (this) {
      case 'CREATE_PENDING':
        return AudienceExportJobStatus.createPending;
      case 'CREATE_IN_PROGRESS':
        return AudienceExportJobStatus.createInProgress;
      case 'CREATE_FAILED':
        return AudienceExportJobStatus.createFailed;
      case 'ACTIVE':
        return AudienceExportJobStatus.active;
    }
    throw Exception('$this is not known in enum AudienceExportJobStatus');
  }
}

/// Provides information about the audience export job.
class AudienceExportJobSummary {
  /// The Amazon Resource Name (ARN) of the audience generation job that was
  /// exported.
  final String audienceGenerationJobArn;
  final AudienceSize audienceSize;

  /// The time at which the audience export job was created.
  final DateTime createTime;

  /// The name of the audience export job.
  final String name;

  /// The status of the audience export job.
  final AudienceExportJobStatus status;

  /// The most recent time at which the audience export job was updated.
  final DateTime updateTime;

  /// The description of the audience export job.
  final String? description;

  /// The Amazon S3 bucket where the audience export is stored.
  final String? outputLocation;
  final StatusDetails? statusDetails;

  AudienceExportJobSummary({
    required this.audienceGenerationJobArn,
    required this.audienceSize,
    required this.createTime,
    required this.name,
    required this.status,
    required this.updateTime,
    this.description,
    this.outputLocation,
    this.statusDetails,
  });

  factory AudienceExportJobSummary.fromJson(Map<String, dynamic> json) {
    return AudienceExportJobSummary(
      audienceGenerationJobArn: json['audienceGenerationJobArn'] as String,
      audienceSize:
          AudienceSize.fromJson(json['audienceSize'] as Map<String, dynamic>),
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAudienceExportJobStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
      outputLocation: json['outputLocation'] as String?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobArn = this.audienceGenerationJobArn;
    final audienceSize = this.audienceSize;
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    final outputLocation = this.outputLocation;
    final statusDetails = this.statusDetails;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
      'audienceSize': audienceSize,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// Defines the Amazon S3 bucket where the seed audience for the generating
/// audience is stored.
class AudienceGenerationJobDataSource {
  /// Defines the Amazon S3 bucket where the seed audience for the generating
  /// audience is stored. A valid data source is a JSON line file in the following
  /// format:
  ///
  /// <code>{"user_id": "111111"}</code>
  ///
  /// <code>{"user_id": "222222"}</code>
  ///
  /// <code>...</code>
  final S3ConfigMap dataSource;

  /// The ARN of the IAM role that can read the Amazon S3 bucket where the
  /// training data is stored.
  final String roleArn;

  AudienceGenerationJobDataSource({
    required this.dataSource,
    required this.roleArn,
  });

  factory AudienceGenerationJobDataSource.fromJson(Map<String, dynamic> json) {
    return AudienceGenerationJobDataSource(
      dataSource:
          S3ConfigMap.fromJson(json['dataSource'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final roleArn = this.roleArn;
    return {
      'dataSource': dataSource,
      'roleArn': roleArn,
    };
  }
}

enum AudienceGenerationJobStatus {
  createPending,
  createInProgress,
  createFailed,
  active,
  deletePending,
  deleteInProgress,
  deleteFailed,
}

extension AudienceGenerationJobStatusValueExtension
    on AudienceGenerationJobStatus {
  String toValue() {
    switch (this) {
      case AudienceGenerationJobStatus.createPending:
        return 'CREATE_PENDING';
      case AudienceGenerationJobStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case AudienceGenerationJobStatus.createFailed:
        return 'CREATE_FAILED';
      case AudienceGenerationJobStatus.active:
        return 'ACTIVE';
      case AudienceGenerationJobStatus.deletePending:
        return 'DELETE_PENDING';
      case AudienceGenerationJobStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case AudienceGenerationJobStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension AudienceGenerationJobStatusFromString on String {
  AudienceGenerationJobStatus toAudienceGenerationJobStatus() {
    switch (this) {
      case 'CREATE_PENDING':
        return AudienceGenerationJobStatus.createPending;
      case 'CREATE_IN_PROGRESS':
        return AudienceGenerationJobStatus.createInProgress;
      case 'CREATE_FAILED':
        return AudienceGenerationJobStatus.createFailed;
      case 'ACTIVE':
        return AudienceGenerationJobStatus.active;
      case 'DELETE_PENDING':
        return AudienceGenerationJobStatus.deletePending;
      case 'DELETE_IN_PROGRESS':
        return AudienceGenerationJobStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return AudienceGenerationJobStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum AudienceGenerationJobStatus');
  }
}

/// Provides information about the configured audience generation job.
class AudienceGenerationJobSummary {
  /// The Amazon Resource Name (ARN) of the audience generation job.
  final String audienceGenerationJobArn;

  /// The Amazon Resource Name (ARN) of the configured audience model that was
  /// used for this audience generation job.
  final String configuredAudienceModelArn;

  /// The time at which the audience generation job was created.
  final DateTime createTime;

  /// The name of the audience generation job.
  final String name;

  /// The status of the audience generation job.
  final AudienceGenerationJobStatus status;

  /// The most recent time at which the audience generation job was updated.
  final DateTime updateTime;

  /// The identifier of the collaboration that contains this audience generation
  /// job.
  final String? collaborationId;

  /// The description of the audience generation job.
  final String? description;

  /// The AWS Account that submitted the job.
  final String? startedBy;

  AudienceGenerationJobSummary({
    required this.audienceGenerationJobArn,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.name,
    required this.status,
    required this.updateTime,
    this.collaborationId,
    this.description,
    this.startedBy,
  });

  factory AudienceGenerationJobSummary.fromJson(Map<String, dynamic> json) {
    return AudienceGenerationJobSummary(
      audienceGenerationJobArn: json['audienceGenerationJobArn'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAudienceGenerationJobStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      collaborationId: json['collaborationId'] as String?,
      description: json['description'] as String?,
      startedBy: json['startedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobArn = this.audienceGenerationJobArn;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    final collaborationId = this.collaborationId;
    final description = this.description;
    final startedBy = this.startedBy;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (collaborationId != null) 'collaborationId': collaborationId,
      if (description != null) 'description': description,
      if (startedBy != null) 'startedBy': startedBy,
    };
  }
}

enum AudienceModelStatus {
  createPending,
  createInProgress,
  createFailed,
  active,
  deletePending,
  deleteInProgress,
  deleteFailed,
}

extension AudienceModelStatusValueExtension on AudienceModelStatus {
  String toValue() {
    switch (this) {
      case AudienceModelStatus.createPending:
        return 'CREATE_PENDING';
      case AudienceModelStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case AudienceModelStatus.createFailed:
        return 'CREATE_FAILED';
      case AudienceModelStatus.active:
        return 'ACTIVE';
      case AudienceModelStatus.deletePending:
        return 'DELETE_PENDING';
      case AudienceModelStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case AudienceModelStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension AudienceModelStatusFromString on String {
  AudienceModelStatus toAudienceModelStatus() {
    switch (this) {
      case 'CREATE_PENDING':
        return AudienceModelStatus.createPending;
      case 'CREATE_IN_PROGRESS':
        return AudienceModelStatus.createInProgress;
      case 'CREATE_FAILED':
        return AudienceModelStatus.createFailed;
      case 'ACTIVE':
        return AudienceModelStatus.active;
      case 'DELETE_PENDING':
        return AudienceModelStatus.deletePending;
      case 'DELETE_IN_PROGRESS':
        return AudienceModelStatus.deleteInProgress;
      case 'DELETE_FAILED':
        return AudienceModelStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum AudienceModelStatus');
  }
}

/// Information about the audience model.
class AudienceModelSummary {
  /// The Amazon Resource Name (ARN) of the audience model.
  final String audienceModelArn;

  /// The time at which the audience model was created.
  final DateTime createTime;

  /// The name of the audience model.
  final String name;

  /// The status of the audience model.
  final AudienceModelStatus status;

  /// The Amazon Resource Name (ARN) of the training dataset that was used for the
  /// audience model.
  final String trainingDatasetArn;

  /// The most recent time at which the audience model was updated.
  final DateTime updateTime;

  /// The description of the audience model.
  final String? description;

  AudienceModelSummary({
    required this.audienceModelArn,
    required this.createTime,
    required this.name,
    required this.status,
    required this.trainingDatasetArn,
    required this.updateTime,
    this.description,
  });

  factory AudienceModelSummary.fromJson(Map<String, dynamic> json) {
    return AudienceModelSummary(
      audienceModelArn: json['audienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAudienceModelStatus(),
      trainingDatasetArn: json['trainingDatasetArn'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final trainingDatasetArn = this.trainingDatasetArn;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'audienceModelArn': audienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Metrics that describe the quality of the generated audience.
class AudienceQualityMetrics {
  /// The relevance scores of the generated audience.
  final List<RelevanceMetric> relevanceMetrics;

  /// The recall score of the generated audience. Recall is the percentage of the
  /// most similar users (by default, the most similar 20%) from a sample of the
  /// training data that are included in the seed audience by the audience
  /// generation job. Values range from 0-1, larger values indicate a better
  /// audience. A recall value approximately equal to the maximum bin size
  /// indicates that the audience model is equivalent to random selection.
  final double? recallMetric;

  AudienceQualityMetrics({
    required this.relevanceMetrics,
    this.recallMetric,
  });

  factory AudienceQualityMetrics.fromJson(Map<String, dynamic> json) {
    return AudienceQualityMetrics(
      relevanceMetrics: (json['relevanceMetrics'] as List)
          .whereNotNull()
          .map((e) => RelevanceMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      recallMetric: json['recallMetric'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final relevanceMetrics = this.relevanceMetrics;
    final recallMetric = this.recallMetric;
    return {
      'relevanceMetrics': relevanceMetrics,
      if (recallMetric != null) 'recallMetric': recallMetric,
    };
  }
}

/// The size of the generated audience. Must match one of the sizes in the
/// configured audience model.
class AudienceSize {
  /// Whether the audience size is defined in absolute terms or as a percentage.
  /// You can use the <code>ABSOLUTE</code> <a>AudienceSize</a> to configure out
  /// audience sizes using the count of identifiers in the output. You can use the
  /// <code>Percentage</code> <a>AudienceSize</a> to configure sizes in the range
  /// 1-100 percent.
  final AudienceSizeType type;

  /// Specify an audience size value.
  final int value;

  AudienceSize({
    required this.type,
    required this.value,
  });

  factory AudienceSize.fromJson(Map<String, dynamic> json) {
    return AudienceSize(
      type: (json['type'] as String).toAudienceSizeType(),
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.toValue(),
      'value': value,
    };
  }
}

/// Configure the list of audience output sizes that can be created. A request
/// to <a>StartAudienceGenerationJob</a> that uses this configured audience
/// model must have an <code>audienceSize</code> selected from this list. You
/// can use the <code>ABSOLUTE</code> <a>AudienceSize</a> to configure out
/// audience sizes using the count of identifiers in the output. You can use the
/// <code>Percentage</code> <a>AudienceSize</a> to configure sizes in the range
/// 1-100 percent.
class AudienceSizeConfig {
  /// An array of the different audience output sizes.
  final List<int> audienceSizeBins;

  /// Whether the audience output sizes are defined as an absolute number or a
  /// percentage.
  final AudienceSizeType audienceSizeType;

  AudienceSizeConfig({
    required this.audienceSizeBins,
    required this.audienceSizeType,
  });

  factory AudienceSizeConfig.fromJson(Map<String, dynamic> json) {
    return AudienceSizeConfig(
      audienceSizeBins: (json['audienceSizeBins'] as List)
          .whereNotNull()
          .map((e) => e as int)
          .toList(),
      audienceSizeType:
          (json['audienceSizeType'] as String).toAudienceSizeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final audienceSizeBins = this.audienceSizeBins;
    final audienceSizeType = this.audienceSizeType;
    return {
      'audienceSizeBins': audienceSizeBins,
      'audienceSizeType': audienceSizeType.toValue(),
    };
  }
}

enum AudienceSizeType {
  absolute,
  percentage,
}

extension AudienceSizeTypeValueExtension on AudienceSizeType {
  String toValue() {
    switch (this) {
      case AudienceSizeType.absolute:
        return 'ABSOLUTE';
      case AudienceSizeType.percentage:
        return 'PERCENTAGE';
    }
  }
}

extension AudienceSizeTypeFromString on String {
  AudienceSizeType toAudienceSizeType() {
    switch (this) {
      case 'ABSOLUTE':
        return AudienceSizeType.absolute;
      case 'PERCENTAGE':
        return AudienceSizeType.percentage;
    }
    throw Exception('$this is not known in enum AudienceSizeType');
  }
}

/// Metadata for a column.
class ColumnSchema {
  /// The name of a column.
  final String columnName;

  /// The data type of column.
  final List<ColumnType> columnTypes;

  ColumnSchema({
    required this.columnName,
    required this.columnTypes,
  });

  factory ColumnSchema.fromJson(Map<String, dynamic> json) {
    return ColumnSchema(
      columnName: json['columnName'] as String,
      columnTypes: (json['columnTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toColumnType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnTypes = this.columnTypes;
    return {
      'columnName': columnName,
      'columnTypes': columnTypes.map((e) => e.toValue()).toList(),
    };
  }
}

enum ColumnType {
  userId,
  itemId,
  timestamp,
  categoricalFeature,
  numericalFeature,
}

extension ColumnTypeValueExtension on ColumnType {
  String toValue() {
    switch (this) {
      case ColumnType.userId:
        return 'USER_ID';
      case ColumnType.itemId:
        return 'ITEM_ID';
      case ColumnType.timestamp:
        return 'TIMESTAMP';
      case ColumnType.categoricalFeature:
        return 'CATEGORICAL_FEATURE';
      case ColumnType.numericalFeature:
        return 'NUMERICAL_FEATURE';
    }
  }
}

extension ColumnTypeFromString on String {
  ColumnType toColumnType() {
    switch (this) {
      case 'USER_ID':
        return ColumnType.userId;
      case 'ITEM_ID':
        return ColumnType.itemId;
      case 'TIMESTAMP':
        return ColumnType.timestamp;
      case 'CATEGORICAL_FEATURE':
        return ColumnType.categoricalFeature;
      case 'NUMERICAL_FEATURE':
        return ColumnType.numericalFeature;
    }
    throw Exception('$this is not known in enum ColumnType');
  }
}

/// Configuration information necessary for the configure audience model output.
class ConfiguredAudienceModelOutputConfig {
  final AudienceDestination destination;

  /// The ARN of the IAM role that can write the Amazon S3 bucket.
  final String roleArn;

  ConfiguredAudienceModelOutputConfig({
    required this.destination,
    required this.roleArn,
  });

  factory ConfiguredAudienceModelOutputConfig.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredAudienceModelOutputConfig(
      destination: AudienceDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final roleArn = this.roleArn;
    return {
      'destination': destination,
      'roleArn': roleArn,
    };
  }
}

enum ConfiguredAudienceModelStatus {
  active,
}

extension ConfiguredAudienceModelStatusValueExtension
    on ConfiguredAudienceModelStatus {
  String toValue() {
    switch (this) {
      case ConfiguredAudienceModelStatus.active:
        return 'ACTIVE';
    }
  }
}

extension ConfiguredAudienceModelStatusFromString on String {
  ConfiguredAudienceModelStatus toConfiguredAudienceModelStatus() {
    switch (this) {
      case 'ACTIVE':
        return ConfiguredAudienceModelStatus.active;
    }
    throw Exception('$this is not known in enum ConfiguredAudienceModelStatus');
  }
}

/// Information about the configured audience model.
class ConfiguredAudienceModelSummary {
  /// The Amazon Resource Name (ARN) of the audience model that was used to create
  /// the configured audience model.
  final String audienceModelArn;

  /// The Amazon Resource Name (ARN) of the configured audience model that you are
  /// interested in.
  final String configuredAudienceModelArn;

  /// The time at which the configured audience model was created.
  final DateTime createTime;

  /// The name of the configured audience model.
  final String name;

  /// The output configuration of the configured audience model.
  final ConfiguredAudienceModelOutputConfig outputConfig;

  /// The status of the configured audience model.
  final ConfiguredAudienceModelStatus status;

  /// The most recent time at which the configured audience model was updated.
  final DateTime updateTime;

  /// The description of the configured audience model.
  final String? description;

  ConfiguredAudienceModelSummary({
    required this.audienceModelArn,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.name,
    required this.outputConfig,
    required this.status,
    required this.updateTime,
    this.description,
  });

  factory ConfiguredAudienceModelSummary.fromJson(Map<String, dynamic> json) {
    return ConfiguredAudienceModelSummary(
      audienceModelArn: json['audienceModelArn'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      outputConfig: ConfiguredAudienceModelOutputConfig.fromJson(
          json['outputConfig'] as Map<String, dynamic>),
      status: (json['status'] as String).toConfiguredAudienceModelStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'audienceModelArn': audienceModelArn,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'outputConfig': outputConfig,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

class CreateAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the audience model.
  final String audienceModelArn;

  CreateAudienceModelResponse({
    required this.audienceModelArn,
  });

  factory CreateAudienceModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateAudienceModelResponse(
      audienceModelArn: json['audienceModelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    return {
      'audienceModelArn': audienceModelArn,
    };
  }
}

class CreateConfiguredAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the configured audience model.
  final String configuredAudienceModelArn;

  CreateConfiguredAudienceModelResponse({
    required this.configuredAudienceModelArn,
  });

  factory CreateConfiguredAudienceModelResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredAudienceModelResponse(
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    return {
      'configuredAudienceModelArn': configuredAudienceModelArn,
    };
  }
}

class CreateTrainingDatasetResponse {
  /// The Amazon Resource Name (ARN) of the training dataset resource.
  final String trainingDatasetArn;

  CreateTrainingDatasetResponse({
    required this.trainingDatasetArn,
  });

  factory CreateTrainingDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrainingDatasetResponse(
      trainingDatasetArn: json['trainingDatasetArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final trainingDatasetArn = this.trainingDatasetArn;
    return {
      'trainingDatasetArn': trainingDatasetArn,
    };
  }
}

/// Defines information about the Glue data source that contains the training
/// data.
class DataSource {
  /// A GlueDataSource object that defines the catalog ID, database name, and
  /// table name for the training data.
  final GlueDataSource glueDataSource;

  DataSource({
    required this.glueDataSource,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      glueDataSource: GlueDataSource.fromJson(
          json['glueDataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final glueDataSource = this.glueDataSource;
    return {
      'glueDataSource': glueDataSource,
    };
  }
}

/// Defines where the training dataset is located, what type of data it
/// contains, and how to access the data.
class Dataset {
  /// A DatasetInputConfig object that defines the data source and schema mapping.
  final DatasetInputConfig inputConfig;

  /// What type of information is found in the dataset.
  final DatasetType type;

  Dataset({
    required this.inputConfig,
    required this.type,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      inputConfig: DatasetInputConfig.fromJson(
          json['inputConfig'] as Map<String, dynamic>),
      type: (json['type'] as String).toDatasetType(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputConfig = this.inputConfig;
    final type = this.type;
    return {
      'inputConfig': inputConfig,
      'type': type.toValue(),
    };
  }
}

/// Defines the Glue data source and schema mapping information.
class DatasetInputConfig {
  /// A DataSource object that specifies the Glue data source for the training
  /// data.
  final DataSource dataSource;

  /// The schema information for the training data.
  final List<ColumnSchema> schema;

  DatasetInputConfig({
    required this.dataSource,
    required this.schema,
  });

  factory DatasetInputConfig.fromJson(Map<String, dynamic> json) {
    return DatasetInputConfig(
      dataSource:
          DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
      schema: (json['schema'] as List)
          .whereNotNull()
          .map((e) => ColumnSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final schema = this.schema;
    return {
      'dataSource': dataSource,
      'schema': schema,
    };
  }
}

enum DatasetType {
  interactions,
}

extension DatasetTypeValueExtension on DatasetType {
  String toValue() {
    switch (this) {
      case DatasetType.interactions:
        return 'INTERACTIONS';
    }
  }
}

extension DatasetTypeFromString on String {
  DatasetType toDatasetType() {
    switch (this) {
      case 'INTERACTIONS':
        return DatasetType.interactions;
    }
    throw Exception('$this is not known in enum DatasetType');
  }
}

class GetAudienceGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the audience generation job.
  final String audienceGenerationJobArn;

  /// The Amazon Resource Name (ARN) of the configured audience model used for
  /// this audience generation job.
  final String configuredAudienceModelArn;

  /// The time at which the audience generation job was created.
  final DateTime createTime;

  /// The name of the audience generation job.
  final String name;

  /// The status of the audience generation job.
  final AudienceGenerationJobStatus status;

  /// The most recent time at which the audience generation job was updated.
  final DateTime updateTime;

  /// The identifier of the collaboration that this audience generation job is
  /// associated with.
  final String? collaborationId;

  /// The description of the audience generation job.
  final String? description;

  /// Configure whether the seed users are included in the output audience. By
  /// default, Clean Rooms ML removes seed users from the output audience. If you
  /// specify <code>TRUE</code>, the seed users will appear first in the output.
  /// Clean Rooms ML does not explicitly reveal whether a user was in the seed,
  /// but the recipient of the audience will know that the first
  /// <code>minimumSeedSize</code> count of users are from the seed.
  final bool? includeSeedInOutput;

  /// The relevance scores for different audience sizes and the recall score of
  /// the generated audience.
  final AudienceQualityMetrics? metrics;

  /// The seed audience that was used for this audience generation job. This field
  /// will be null if the account calling the API is the account that started this
  /// audience generation job.
  final AudienceGenerationJobDataSource? seedAudience;

  /// The AWS account that started this audience generation job.
  final String? startedBy;

  /// Details about the status of the audience generation job.
  final StatusDetails? statusDetails;

  /// The tags that are associated to this audience generation job.
  final Map<String, String>? tags;

  GetAudienceGenerationJobResponse({
    required this.audienceGenerationJobArn,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.name,
    required this.status,
    required this.updateTime,
    this.collaborationId,
    this.description,
    this.includeSeedInOutput,
    this.metrics,
    this.seedAudience,
    this.startedBy,
    this.statusDetails,
    this.tags,
  });

  factory GetAudienceGenerationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetAudienceGenerationJobResponse(
      audienceGenerationJobArn: json['audienceGenerationJobArn'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAudienceGenerationJobStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      collaborationId: json['collaborationId'] as String?,
      description: json['description'] as String?,
      includeSeedInOutput: json['includeSeedInOutput'] as bool?,
      metrics: json['metrics'] != null
          ? AudienceQualityMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      seedAudience: json['seedAudience'] != null
          ? AudienceGenerationJobDataSource.fromJson(
              json['seedAudience'] as Map<String, dynamic>)
          : null,
      startedBy: json['startedBy'] as String?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobArn = this.audienceGenerationJobArn;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    final collaborationId = this.collaborationId;
    final description = this.description;
    final includeSeedInOutput = this.includeSeedInOutput;
    final metrics = this.metrics;
    final seedAudience = this.seedAudience;
    final startedBy = this.startedBy;
    final statusDetails = this.statusDetails;
    final tags = this.tags;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (collaborationId != null) 'collaborationId': collaborationId,
      if (description != null) 'description': description,
      if (includeSeedInOutput != null)
        'includeSeedInOutput': includeSeedInOutput,
      if (metrics != null) 'metrics': metrics,
      if (seedAudience != null) 'seedAudience': seedAudience,
      if (startedBy != null) 'startedBy': startedBy,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the audience model.
  final String audienceModelArn;

  /// The time at which the audience model was created.
  final DateTime createTime;

  /// The name of the audience model.
  final String name;

  /// The status of the audience model.
  final AudienceModelStatus status;

  /// The Amazon Resource Name (ARN) of the training dataset that was used for
  /// this audience model.
  final String trainingDatasetArn;

  /// The most recent time at which the audience model was updated.
  final DateTime updateTime;

  /// The description of the audience model.
  final String? description;

  /// The KMS key ARN used for the audience model.
  final String? kmsKeyArn;

  /// Details about the status of the audience model.
  final StatusDetails? statusDetails;

  /// The tags that are assigned to the audience model.
  final Map<String, String>? tags;

  /// The end date specified for the training window.
  final DateTime? trainingDataEndTime;

  /// The start date specified for the training window.
  final DateTime? trainingDataStartTime;

  GetAudienceModelResponse({
    required this.audienceModelArn,
    required this.createTime,
    required this.name,
    required this.status,
    required this.trainingDatasetArn,
    required this.updateTime,
    this.description,
    this.kmsKeyArn,
    this.statusDetails,
    this.tags,
    this.trainingDataEndTime,
    this.trainingDataStartTime,
  });

  factory GetAudienceModelResponse.fromJson(Map<String, dynamic> json) {
    return GetAudienceModelResponse(
      audienceModelArn: json['audienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAudienceModelStatus(),
      trainingDatasetArn: json['trainingDatasetArn'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trainingDataEndTime: timeStampFromJson(json['trainingDataEndTime']),
      trainingDataStartTime: timeStampFromJson(json['trainingDataStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final trainingDatasetArn = this.trainingDatasetArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final statusDetails = this.statusDetails;
    final tags = this.tags;
    final trainingDataEndTime = this.trainingDataEndTime;
    final trainingDataStartTime = this.trainingDataStartTime;
    return {
      'audienceModelArn': audienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (tags != null) 'tags': tags,
      if (trainingDataEndTime != null)
        'trainingDataEndTime': iso8601ToJson(trainingDataEndTime),
      if (trainingDataStartTime != null)
        'trainingDataStartTime': iso8601ToJson(trainingDataStartTime),
    };
  }
}

class GetConfiguredAudienceModelPolicyResponse {
  /// The Amazon Resource Name (ARN) of the configured audience model.
  final String configuredAudienceModelArn;

  /// The configured audience model policy. This is a JSON IAM resource policy.
  final String configuredAudienceModelPolicy;

  /// A cryptographic hash of the contents of the policy used to prevent
  /// unexpected concurrent modification of the policy.
  final String policyHash;

  GetConfiguredAudienceModelPolicyResponse({
    required this.configuredAudienceModelArn,
    required this.configuredAudienceModelPolicy,
    required this.policyHash,
  });

  factory GetConfiguredAudienceModelPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredAudienceModelPolicyResponse(
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      configuredAudienceModelPolicy:
          json['configuredAudienceModelPolicy'] as String,
      policyHash: json['policyHash'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final configuredAudienceModelPolicy = this.configuredAudienceModelPolicy;
    final policyHash = this.policyHash;
    return {
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'configuredAudienceModelPolicy': configuredAudienceModelPolicy,
      'policyHash': policyHash,
    };
  }
}

class GetConfiguredAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the audience model used for this
  /// configured audience model.
  final String audienceModelArn;

  /// The Amazon Resource Name (ARN) of the configured audience model.
  final String configuredAudienceModelArn;

  /// The time at which the configured audience model was created.
  final DateTime createTime;

  /// The name of the configured audience model.
  final String name;

  /// The output configuration of the configured audience model
  final ConfiguredAudienceModelOutputConfig outputConfig;

  /// Whether audience metrics are shared.
  final List<SharedAudienceMetrics> sharedAudienceMetrics;

  /// The status of the configured audience model.
  final ConfiguredAudienceModelStatus status;

  /// The most recent time at which the configured audience model was updated.
  final DateTime updateTime;

  /// The list of output sizes of audiences that can be created using this
  /// configured audience model. A request to <a>StartAudienceGenerationJob</a>
  /// that uses this configured audience model must have an
  /// <code>audienceSize</code> selected from this list. You can use the
  /// <code>ABSOLUTE</code> <a>AudienceSize</a> to configure out audience sizes
  /// using the count of identifiers in the output. You can use the
  /// <code>Percentage</code> <a>AudienceSize</a> to configure sizes in the range
  /// 1-100 percent.
  final AudienceSizeConfig? audienceSizeConfig;

  /// Provides the <code>childResourceTagOnCreatePolicy</code> that was used for
  /// this configured audience model.
  final TagOnCreatePolicy? childResourceTagOnCreatePolicy;

  /// The description of the configured audience model.
  final String? description;

  /// The minimum number of users from the seed audience that must match with
  /// users in the training data of the audience model.
  final int? minMatchingSeedSize;

  /// The tags that are associated to this configured audience model.
  final Map<String, String>? tags;

  GetConfiguredAudienceModelResponse({
    required this.audienceModelArn,
    required this.configuredAudienceModelArn,
    required this.createTime,
    required this.name,
    required this.outputConfig,
    required this.sharedAudienceMetrics,
    required this.status,
    required this.updateTime,
    this.audienceSizeConfig,
    this.childResourceTagOnCreatePolicy,
    this.description,
    this.minMatchingSeedSize,
    this.tags,
  });

  factory GetConfiguredAudienceModelResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredAudienceModelResponse(
      audienceModelArn: json['audienceModelArn'] as String,
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      outputConfig: ConfiguredAudienceModelOutputConfig.fromJson(
          json['outputConfig'] as Map<String, dynamic>),
      sharedAudienceMetrics: (json['sharedAudienceMetrics'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSharedAudienceMetrics())
          .toList(),
      status: (json['status'] as String).toConfiguredAudienceModelStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      audienceSizeConfig: json['audienceSizeConfig'] != null
          ? AudienceSizeConfig.fromJson(
              json['audienceSizeConfig'] as Map<String, dynamic>)
          : null,
      childResourceTagOnCreatePolicy:
          (json['childResourceTagOnCreatePolicy'] as String?)
              ?.toTagOnCreatePolicy(),
      description: json['description'] as String?,
      minMatchingSeedSize: json['minMatchingSeedSize'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    final createTime = this.createTime;
    final name = this.name;
    final outputConfig = this.outputConfig;
    final sharedAudienceMetrics = this.sharedAudienceMetrics;
    final status = this.status;
    final updateTime = this.updateTime;
    final audienceSizeConfig = this.audienceSizeConfig;
    final childResourceTagOnCreatePolicy = this.childResourceTagOnCreatePolicy;
    final description = this.description;
    final minMatchingSeedSize = this.minMatchingSeedSize;
    final tags = this.tags;
    return {
      'audienceModelArn': audienceModelArn,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'outputConfig': outputConfig,
      'sharedAudienceMetrics':
          sharedAudienceMetrics.map((e) => e.toValue()).toList(),
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (audienceSizeConfig != null) 'audienceSizeConfig': audienceSizeConfig,
      if (childResourceTagOnCreatePolicy != null)
        'childResourceTagOnCreatePolicy':
            childResourceTagOnCreatePolicy.toValue(),
      if (description != null) 'description': description,
      if (minMatchingSeedSize != null)
        'minMatchingSeedSize': minMatchingSeedSize,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetTrainingDatasetResponse {
  /// The time at which the training dataset was created.
  final DateTime createTime;

  /// The name of the training dataset.
  final String name;

  /// The IAM role used to read the training data.
  final String roleArn;

  /// The status of the training dataset.
  final TrainingDatasetStatus status;

  /// Metadata about the requested training data.
  final List<Dataset> trainingData;

  /// The Amazon Resource Name (ARN) of the training dataset.
  final String trainingDatasetArn;

  /// The most recent time at which the training dataset was updated.
  final DateTime updateTime;

  /// The description of the training dataset.
  final String? description;

  /// The tags that are assigned to this training dataset.
  final Map<String, String>? tags;

  GetTrainingDatasetResponse({
    required this.createTime,
    required this.name,
    required this.roleArn,
    required this.status,
    required this.trainingData,
    required this.trainingDatasetArn,
    required this.updateTime,
    this.description,
    this.tags,
  });

  factory GetTrainingDatasetResponse.fromJson(Map<String, dynamic> json) {
    return GetTrainingDatasetResponse(
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toTrainingDatasetStatus(),
      trainingData: (json['trainingData'] as List)
          .whereNotNull()
          .map((e) => Dataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainingDatasetArn: json['trainingDatasetArn'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final name = this.name;
    final roleArn = this.roleArn;
    final status = this.status;
    final trainingData = this.trainingData;
    final trainingDatasetArn = this.trainingDatasetArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final tags = this.tags;
    return {
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'roleArn': roleArn,
      'status': status.toValue(),
      'trainingData': trainingData,
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Defines the Glue data source that contains the training data.
class GlueDataSource {
  /// The Glue database that contains the training data.
  final String databaseName;

  /// The Glue table that contains the training data.
  final String tableName;

  /// The Glue catalog that contains the training data.
  final String? catalogId;

  GlueDataSource({
    required this.databaseName,
    required this.tableName,
    this.catalogId,
  });

  factory GlueDataSource.fromJson(Map<String, dynamic> json) {
    return GlueDataSource(
      databaseName: json['databaseName'] as String,
      tableName: json['tableName'] as String,
      catalogId: json['catalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final tableName = this.tableName;
    final catalogId = this.catalogId;
    return {
      'databaseName': databaseName,
      'tableName': tableName,
      if (catalogId != null) 'catalogId': catalogId,
    };
  }
}

class ListAudienceExportJobsResponse {
  /// The audience export jobs that match the request.
  final List<AudienceExportJobSummary> audienceExportJobs;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListAudienceExportJobsResponse({
    required this.audienceExportJobs,
    this.nextToken,
  });

  factory ListAudienceExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListAudienceExportJobsResponse(
      audienceExportJobs: (json['audienceExportJobs'] as List)
          .whereNotNull()
          .map((e) =>
              AudienceExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceExportJobs = this.audienceExportJobs;
    final nextToken = this.nextToken;
    return {
      'audienceExportJobs': audienceExportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAudienceGenerationJobsResponse {
  /// The audience generation jobs that match the request.
  final List<AudienceGenerationJobSummary> audienceGenerationJobs;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListAudienceGenerationJobsResponse({
    required this.audienceGenerationJobs,
    this.nextToken,
  });

  factory ListAudienceGenerationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAudienceGenerationJobsResponse(
      audienceGenerationJobs: (json['audienceGenerationJobs'] as List)
          .whereNotNull()
          .map((e) =>
              AudienceGenerationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobs = this.audienceGenerationJobs;
    final nextToken = this.nextToken;
    return {
      'audienceGenerationJobs': audienceGenerationJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAudienceModelsResponse {
  /// The audience models that match the request.
  final List<AudienceModelSummary> audienceModels;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListAudienceModelsResponse({
    required this.audienceModels,
    this.nextToken,
  });

  factory ListAudienceModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListAudienceModelsResponse(
      audienceModels: (json['audienceModels'] as List)
          .whereNotNull()
          .map((e) => AudienceModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModels = this.audienceModels;
    final nextToken = this.nextToken;
    return {
      'audienceModels': audienceModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListConfiguredAudienceModelsResponse {
  /// The configured audience models.
  final List<ConfiguredAudienceModelSummary> configuredAudienceModels;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListConfiguredAudienceModelsResponse({
    required this.configuredAudienceModels,
    this.nextToken,
  });

  factory ListConfiguredAudienceModelsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredAudienceModelsResponse(
      configuredAudienceModels: (json['configuredAudienceModels'] as List)
          .whereNotNull()
          .map((e) => ConfiguredAudienceModelSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModels = this.configuredAudienceModels;
    final nextToken = this.nextToken;
    return {
      'configuredAudienceModels': configuredAudienceModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags that are associated with the resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class ListTrainingDatasetsResponse {
  /// The training datasets that match the request.
  final List<TrainingDatasetSummary> trainingDatasets;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListTrainingDatasetsResponse({
    required this.trainingDatasets,
    this.nextToken,
  });

  factory ListTrainingDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrainingDatasetsResponse(
      trainingDatasets: (json['trainingDatasets'] as List)
          .whereNotNull()
          .map(
              (e) => TrainingDatasetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainingDatasets = this.trainingDatasets;
    final nextToken = this.nextToken;
    return {
      'trainingDatasets': trainingDatasets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum PolicyExistenceCondition {
  policyMustExist,
  policyMustNotExist,
}

extension PolicyExistenceConditionValueExtension on PolicyExistenceCondition {
  String toValue() {
    switch (this) {
      case PolicyExistenceCondition.policyMustExist:
        return 'POLICY_MUST_EXIST';
      case PolicyExistenceCondition.policyMustNotExist:
        return 'POLICY_MUST_NOT_EXIST';
    }
  }
}

extension PolicyExistenceConditionFromString on String {
  PolicyExistenceCondition toPolicyExistenceCondition() {
    switch (this) {
      case 'POLICY_MUST_EXIST':
        return PolicyExistenceCondition.policyMustExist;
      case 'POLICY_MUST_NOT_EXIST':
        return PolicyExistenceCondition.policyMustNotExist;
    }
    throw Exception('$this is not known in enum PolicyExistenceCondition');
  }
}

class PutConfiguredAudienceModelPolicyResponse {
  /// The IAM resource policy.
  final String configuredAudienceModelPolicy;

  /// A cryptographic hash of the contents of the policy used to prevent
  /// unexpected concurrent modification of the policy.
  final String policyHash;

  PutConfiguredAudienceModelPolicyResponse({
    required this.configuredAudienceModelPolicy,
    required this.policyHash,
  });

  factory PutConfiguredAudienceModelPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PutConfiguredAudienceModelPolicyResponse(
      configuredAudienceModelPolicy:
          json['configuredAudienceModelPolicy'] as String,
      policyHash: json['policyHash'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelPolicy = this.configuredAudienceModelPolicy;
    final policyHash = this.policyHash;
    return {
      'configuredAudienceModelPolicy': configuredAudienceModelPolicy,
      'policyHash': policyHash,
    };
  }
}

/// The relevance score of a generated audience.
class RelevanceMetric {
  final AudienceSize audienceSize;

  /// The relevance score of the generated audience.
  final double? score;

  RelevanceMetric({
    required this.audienceSize,
    this.score,
  });

  factory RelevanceMetric.fromJson(Map<String, dynamic> json) {
    return RelevanceMetric(
      audienceSize:
          AudienceSize.fromJson(json['audienceSize'] as Map<String, dynamic>),
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceSize = this.audienceSize;
    final score = this.score;
    return {
      'audienceSize': audienceSize,
      if (score != null) 'score': score,
    };
  }
}

/// Provides information about an Amazon S3 bucket and path.
class S3ConfigMap {
  /// The Amazon S3 location URI.
  final String s3Uri;

  S3ConfigMap({
    required this.s3Uri,
  });

  factory S3ConfigMap.fromJson(Map<String, dynamic> json) {
    return S3ConfigMap(
      s3Uri: json['s3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

enum SharedAudienceMetrics {
  all,
  none,
}

extension SharedAudienceMetricsValueExtension on SharedAudienceMetrics {
  String toValue() {
    switch (this) {
      case SharedAudienceMetrics.all:
        return 'ALL';
      case SharedAudienceMetrics.none:
        return 'NONE';
    }
  }
}

extension SharedAudienceMetricsFromString on String {
  SharedAudienceMetrics toSharedAudienceMetrics() {
    switch (this) {
      case 'ALL':
        return SharedAudienceMetrics.all;
      case 'NONE':
        return SharedAudienceMetrics.none;
    }
    throw Exception('$this is not known in enum SharedAudienceMetrics');
  }
}

class StartAudienceGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the audience generation job.
  final String audienceGenerationJobArn;

  StartAudienceGenerationJobResponse({
    required this.audienceGenerationJobArn,
  });

  factory StartAudienceGenerationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAudienceGenerationJobResponse(
      audienceGenerationJobArn: json['audienceGenerationJobArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobArn = this.audienceGenerationJobArn;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
    };
  }
}

/// Details about the status of a resource.
class StatusDetails {
  /// The error message that was returned. The message is intended for human
  /// consumption and can change at any time. Use the <code>statusCode</code> for
  /// programmatic error handling.
  final String? message;

  /// The status code that was returned. The status code is intended for
  /// programmatic error handling. Clean Rooms ML will not change the status code
  /// for existing error conditions.
  final String? statusCode;

  StatusDetails({
    this.message,
    this.statusCode,
  });

  factory StatusDetails.fromJson(Map<String, dynamic> json) {
    return StatusDetails(
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

enum TagOnCreatePolicy {
  fromParentResource,
  none,
}

extension TagOnCreatePolicyValueExtension on TagOnCreatePolicy {
  String toValue() {
    switch (this) {
      case TagOnCreatePolicy.fromParentResource:
        return 'FROM_PARENT_RESOURCE';
      case TagOnCreatePolicy.none:
        return 'NONE';
    }
  }
}

extension TagOnCreatePolicyFromString on String {
  TagOnCreatePolicy toTagOnCreatePolicy() {
    switch (this) {
      case 'FROM_PARENT_RESOURCE':
        return TagOnCreatePolicy.fromParentResource;
      case 'NONE':
        return TagOnCreatePolicy.none;
    }
    throw Exception('$this is not known in enum TagOnCreatePolicy');
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

enum TrainingDatasetStatus {
  active,
}

extension TrainingDatasetStatusValueExtension on TrainingDatasetStatus {
  String toValue() {
    switch (this) {
      case TrainingDatasetStatus.active:
        return 'ACTIVE';
    }
  }
}

extension TrainingDatasetStatusFromString on String {
  TrainingDatasetStatus toTrainingDatasetStatus() {
    switch (this) {
      case 'ACTIVE':
        return TrainingDatasetStatus.active;
    }
    throw Exception('$this is not known in enum TrainingDatasetStatus');
  }
}

/// Provides information about the training dataset.
class TrainingDatasetSummary {
  /// The time at which the training dataset was created.
  final DateTime createTime;

  /// The name of the training dataset.
  final String name;

  /// The status of the training dataset.
  final TrainingDatasetStatus status;

  /// The Amazon Resource Name (ARN) of the training dataset.
  final String trainingDatasetArn;

  /// The most recent time at which the training dataset was updated.
  final DateTime updateTime;

  /// The description of the training dataset.
  final String? description;

  TrainingDatasetSummary({
    required this.createTime,
    required this.name,
    required this.status,
    required this.trainingDatasetArn,
    required this.updateTime,
    this.description,
  });

  factory TrainingDatasetSummary.fromJson(Map<String, dynamic> json) {
    return TrainingDatasetSummary(
      createTime: nonNullableTimeStampFromJson(json['createTime'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toTrainingDatasetStatus(),
      trainingDatasetArn: json['trainingDatasetArn'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final name = this.name;
    final status = this.status;
    final trainingDatasetArn = this.trainingDatasetArn;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.toValue(),
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
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

class UpdateConfiguredAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the configured audience model that was
  /// updated.
  final String configuredAudienceModelArn;

  UpdateConfiguredAudienceModelResponse({
    required this.configuredAudienceModelArn,
  });

  factory UpdateConfiguredAudienceModelResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateConfiguredAudienceModelResponse(
      configuredAudienceModelArn: json['configuredAudienceModelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    return {
      'configuredAudienceModelArn': configuredAudienceModelArn,
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
