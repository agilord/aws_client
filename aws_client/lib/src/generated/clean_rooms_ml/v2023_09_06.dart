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
/// <p/>
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

  /// Returns a list of the configured model algorithm associations in a
  /// collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the configured
  /// model algorithm associations that you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListCollaborationConfiguredModelAlgorithmAssociationsResponse>
      listCollaborationConfiguredModelAlgorithmAssociations({
    required String collaborationIdentifier,
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
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/configured-model-algorithm-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationConfiguredModelAlgorithmAssociationsResponse
        .fromJson(response);
  }

  /// Returns a list of the ML input channels in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the ML input
  /// channels that you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListCollaborationMLInputChannelsResponse>
      listCollaborationMLInputChannels({
    required String collaborationIdentifier,
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
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/ml-input-channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationMLInputChannelsResponse.fromJson(response);
  }

  /// Returns a list of the export jobs for a trained model in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the trained model
  /// export jobs that you are interested in.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that was used to
  /// create the export jobs that you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [trainedModelVersionIdentifier] :
  /// The version identifier of the trained model to filter export jobs by. When
  /// specified, only export jobs for this specific version of the trained model
  /// are returned.
  Future<ListCollaborationTrainedModelExportJobsResponse>
      listCollaborationTrainedModelExportJobs({
    required String collaborationIdentifier,
    required String trainedModelArn,
    int? maxResults,
    String? nextToken,
    String? trainedModelVersionIdentifier,
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
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': [trainedModelVersionIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}/export-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationTrainedModelExportJobsResponse.fromJson(response);
  }

  /// Returns a list of trained model inference jobs in a specified
  /// collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the trained model
  /// inference jobs that you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that was used to
  /// create the trained model inference jobs that you are interested in.
  ///
  /// Parameter [trainedModelVersionIdentifier] :
  /// The version identifier of the trained model to filter inference jobs by.
  /// When specified, only inference jobs that used this specific version of the
  /// trained model are returned.
  Future<ListCollaborationTrainedModelInferenceJobsResponse>
      listCollaborationTrainedModelInferenceJobs({
    required String collaborationIdentifier,
    int? maxResults,
    String? nextToken,
    String? trainedModelArn,
    String? trainedModelVersionIdentifier,
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
      if (trainedModelArn != null) 'trainedModelArn': [trainedModelArn],
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': [trainedModelVersionIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/trained-model-inference-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationTrainedModelInferenceJobsResponse.fromJson(
        response);
  }

  /// Returns a list of the trained models in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the trained models
  /// you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListCollaborationTrainedModelsResponse>
      listCollaborationTrainedModels({
    required String collaborationIdentifier,
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
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/trained-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollaborationTrainedModelsResponse.fromJson(response);
  }

  /// Returns a list of tags for a provided resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Adds metadata tags to a specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Export an audience of a specified size after you have generated an
  /// audience.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Returns a list of the audience export jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Information necessary to start the audience generation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns information about an audience generation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Deletes the specified audience generation job, and removes all data
  /// associated with the job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns a list of audience generation jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Defines the information necessary to create an audience model. An audience
  /// model is a machine learning model that Clean Rooms ML trains to measure
  /// similarity between users. Clean Rooms ML manages training and storing the
  /// audience model. The audience model can be used in multiple calls to the
  /// <a>StartAudienceGenerationJob</a> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Returns information about an audience model
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Specifies an audience model that you want to delete. You can't delete an
  /// audience model if there are any configured audience models that depend on
  /// the audience model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns a list of audience models.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Defines the information necessary to create a configured audience model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
          sharedAudienceMetrics.map((e) => e.value).toList(),
      if (audienceSizeConfig != null) 'audienceSizeConfig': audienceSizeConfig,
      if (childResourceTagOnCreatePolicy != null)
        'childResourceTagOnCreatePolicy': childResourceTagOnCreatePolicy.value,
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

  /// Returns information about a specified configured audience model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Provides the information necessary to update a configured audience model.
  /// Updates that impact audience generation jobs take effect when a new job
  /// starts, but do not impact currently running jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
            sharedAudienceMetrics.map((e) => e.value).toList(),
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

  /// Deletes the specified configured audience model. You can't delete a
  /// configured audience model if there are any lookalike models that use the
  /// configured audience model. If you delete a configured audience model, it
  /// will be removed from any collaborations that it is associated to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns a list of the configured audience models.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Create or update the resource policy for a configured audience model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
        'policyExistenceCondition': policyExistenceCondition.value,
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

  /// Returns information about a configured audience model policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Deletes the specified configured audience model policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Creates a configured model algorithm using a container image stored in an
  /// ECR repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the configured model algorithm.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role that is used to access the
  /// repository.
  ///
  /// Parameter [description] :
  /// The description of the configured model algorithm.
  ///
  /// Parameter [inferenceContainerConfig] :
  /// Configuration information for the inference container that is used when
  /// you run an inference job on a configured model algorithm.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the configured ML model algorithm and
  /// associated data.
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
  /// Parameter [trainingContainerConfig] :
  /// Configuration information for the training container, including
  /// entrypoints and arguments.
  Future<CreateConfiguredModelAlgorithmResponse>
      createConfiguredModelAlgorithm({
    required String name,
    required String roleArn,
    String? description,
    InferenceContainerConfig? inferenceContainerConfig,
    String? kmsKeyArn,
    Map<String, String>? tags,
    ContainerConfig? trainingContainerConfig,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (inferenceContainerConfig != null)
        'inferenceContainerConfig': inferenceContainerConfig,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (trainingContainerConfig != null)
        'trainingContainerConfig': trainingContainerConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configured-model-algorithms',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredModelAlgorithmResponse.fromJson(response);
  }

  /// Returns information about a configured model algorithm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm that you
  /// want to return information about.
  Future<GetConfiguredModelAlgorithmResponse> getConfiguredModelAlgorithm({
    required String configuredModelAlgorithmArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/configured-model-algorithms/${Uri.encodeComponent(configuredModelAlgorithmArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredModelAlgorithmResponse.fromJson(response);
  }

  /// Deletes a configured model algorithm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm that you
  /// want to delete.
  Future<void> deleteConfiguredModelAlgorithm({
    required String configuredModelAlgorithmArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/configured-model-algorithms/${Uri.encodeComponent(configuredModelAlgorithmArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of configured model algorithms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListConfiguredModelAlgorithmsResponse> listConfiguredModelAlgorithms({
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
      requestUri: '/configured-model-algorithms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredModelAlgorithmsResponse.fromJson(response);
  }

  /// Associates a configured model algorithm to a collaboration for use by any
  /// member of the collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm that you
  /// want to associate.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member who is associating this configured model
  /// algorithm.
  ///
  /// Parameter [name] :
  /// The name of the configured model algorithm association.
  ///
  /// Parameter [description] :
  /// The description of the configured model algorithm association.
  ///
  /// Parameter [privacyConfiguration] :
  /// Specifies the privacy configuration information for the configured model
  /// algorithm association. This information includes the maximum data size
  /// that can be exported.
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
  Future<CreateConfiguredModelAlgorithmAssociationResponse>
      createConfiguredModelAlgorithmAssociation({
    required String configuredModelAlgorithmArn,
    required String membershipIdentifier,
    required String name,
    String? description,
    PrivacyConfiguration? privacyConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'name': name,
      if (description != null) 'description': description,
      if (privacyConfiguration != null)
        'privacyConfiguration': privacyConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configured-model-algorithm-associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfiguredModelAlgorithmAssociationResponse.fromJson(response);
  }

  /// Returns information about a configured model algorithm association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmAssociationArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association that you want to return information about.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that created the configured model
  /// algorithm association.
  Future<GetConfiguredModelAlgorithmAssociationResponse>
      getConfiguredModelAlgorithmAssociation({
    required String configuredModelAlgorithmAssociationArn,
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configured-model-algorithm-associations/${Uri.encodeComponent(configuredModelAlgorithmAssociationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfiguredModelAlgorithmAssociationResponse.fromJson(response);
  }

  /// Deletes a configured model algorithm association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmAssociationArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association that you want to delete.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is deleting the configured model
  /// algorithm association.
  Future<void> deleteConfiguredModelAlgorithmAssociation({
    required String configuredModelAlgorithmAssociationArn,
    required String membershipIdentifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configured-model-algorithm-associations/${Uri.encodeComponent(configuredModelAlgorithmAssociationArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of configured model algorithm associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that created the configured model
  /// algorithm associations you are interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListConfiguredModelAlgorithmAssociationsResponse>
      listConfiguredModelAlgorithmAssociations({
    required String membershipIdentifier,
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
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/configured-model-algorithm-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfiguredModelAlgorithmAssociationsResponse.fromJson(response);
  }

  /// Returns information about the configured model algorithm association in a
  /// collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID for the collaboration that contains the configured
  /// model algorithm association that you want to return information about.
  ///
  /// Parameter [configuredModelAlgorithmAssociationArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association that you want to return information about.
  Future<GetCollaborationConfiguredModelAlgorithmAssociationResponse>
      getCollaborationConfiguredModelAlgorithmAssociation({
    required String collaborationIdentifier,
    required String configuredModelAlgorithmAssociationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/configured-model-algorithm-associations/${Uri.encodeComponent(configuredModelAlgorithmAssociationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationConfiguredModelAlgorithmAssociationResponse.fromJson(
        response);
  }

  /// Assigns information about an ML configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [defaultOutputLocation] :
  /// The default Amazon S3 location where ML output is stored for the specified
  /// member.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is being configured.
  Future<void> putMLConfiguration({
    required MLOutputConfiguration defaultOutputLocation,
    required String membershipIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'defaultOutputLocation': defaultOutputLocation,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-configurations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a specific ML configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that owns the ML configuration you want to
  /// return information about.
  Future<GetMLConfigurationResponse> getMLConfiguration({
    required String membershipIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return GetMLConfigurationResponse.fromJson(response);
  }

  /// Deletes a ML modeling configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the of the member that is deleting the ML modeling
  /// configuration.
  Future<void> deleteMLConfiguration({
    required String membershipIdentifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-configurations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Provides the information to create an ML input channel. An ML input
  /// channel is the result of a query that can be used for ML modeling.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmAssociations] :
  /// The associated configured model algorithms that are necessary to create
  /// this ML input channel.
  ///
  /// Parameter [inputChannel] :
  /// The input data that is used to create this ML input channel.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is creating the ML input channel.
  ///
  /// Parameter [name] :
  /// The name of the ML input channel.
  ///
  /// Parameter [retentionInDays] :
  /// The number of days that the data in the ML input channel is retained.
  ///
  /// Parameter [description] :
  /// The description of the ML input channel.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key that is used to access the
  /// input channel.
  ///
  /// Parameter [payerConfiguration] :
  /// The payer configuration for the ML input channel. Determines which member
  /// account pays for compute and synthetic data costs.
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
  Future<CreateMLInputChannelResponse> createMLInputChannel({
    required List<String> configuredModelAlgorithmAssociations,
    required InputChannel inputChannel,
    required String membershipIdentifier,
    required String name,
    required int retentionInDays,
    String? description,
    String? kmsKeyArn,
    PayerConfiguration? payerConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      'inputChannel': inputChannel,
      'name': name,
      'retentionInDays': retentionInDays,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (payerConfiguration != null) 'payerConfiguration': payerConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-input-channels',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMLInputChannelResponse.fromJson(response);
  }

  /// Returns information about an ML input channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the membership that contains the ML input channel
  /// that you want to get.
  ///
  /// Parameter [mlInputChannelArn] :
  /// The Amazon Resource Name (ARN) of the ML input channel that you want to
  /// get.
  Future<GetMLInputChannelResponse> getMLInputChannel({
    required String membershipIdentifier,
    required String mlInputChannelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-input-channels/${Uri.encodeComponent(mlInputChannelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMLInputChannelResponse.fromJson(response);
  }

  /// Provides the information necessary to delete an ML input channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the membership that contains the ML input channel you
  /// want to delete.
  ///
  /// Parameter [mlInputChannelArn] :
  /// The Amazon Resource Name (ARN) of the ML input channel that you want to
  /// delete.
  Future<void> deleteMLInputChannelData({
    required String membershipIdentifier,
    required String mlInputChannelArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-input-channels/${Uri.encodeComponent(mlInputChannelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of ML input channels.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the membership that contains the ML input channels
  /// that you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of ML input channels to return.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListMLInputChannelsResponse> listMLInputChannels({
    required String membershipIdentifier,
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
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/ml-input-channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMLInputChannelsResponse.fromJson(response);
  }

  /// Returns information about a specific ML input channel in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID of the collaboration that contains the ML input
  /// channel that you want to get.
  ///
  /// Parameter [mlInputChannelArn] :
  /// The Amazon Resource Name (ARN) of the ML input channel that you want to
  /// get.
  Future<GetCollaborationMLInputChannelResponse>
      getCollaborationMLInputChannel({
    required String collaborationIdentifier,
    required String mlInputChannelArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/ml-input-channels/${Uri.encodeComponent(mlInputChannelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationMLInputChannelResponse.fromJson(response);
  }

  /// Creates a trained model from an associated configured model algorithm
  /// using data from any member of the collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuredModelAlgorithmAssociationArn] :
  /// The associated configured model algorithm used to train this model.
  ///
  /// Parameter [dataChannels] :
  /// Defines the data channels that are used as input for the trained model
  /// request.
  ///
  /// Limit: Maximum of 20 channels total (including both
  /// <code>dataChannels</code> and
  /// <code>incrementalTrainingDataChannels</code>).
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is creating the trained model.
  ///
  /// Parameter [name] :
  /// The name of the trained model.
  ///
  /// Parameter [resourceConfig] :
  /// Information about the EC2 resources that are used to train this model.
  ///
  /// Parameter [description] :
  /// The description of the trained model.
  ///
  /// Parameter [environment] :
  /// The environment variables to set in the Docker container.
  ///
  /// Parameter [hyperparameters] :
  /// Algorithm-specific parameters that influence the quality of the model. You
  /// set hyperparameters before you start the learning process.
  ///
  /// Parameter [incrementalTrainingDataChannels] :
  /// Specifies the incremental training data channels for the trained model.
  ///
  /// Incremental training allows you to create a new trained model with updates
  /// without retraining from scratch. You can specify up to one incremental
  /// training data channel that references a previously trained model and its
  /// version.
  ///
  /// Limit: Maximum of 20 channels total (including both
  /// <code>incrementalTrainingDataChannels</code> and
  /// <code>dataChannels</code>).
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the trained ML model and the associated
  /// data.
  ///
  /// Parameter [mlModelTrainingPayerAccountId] :
  /// The account ID of the member that is responsible for paying for model
  /// training costs.
  ///
  /// Parameter [stoppingCondition] :
  /// The criteria that is used to stop model training.
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
  /// Parameter [trainingInputMode] :
  /// The input mode for accessing the training data. This parameter determines
  /// how the training data is made available to the training algorithm. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>File</code> - The training data is downloaded to the training
  /// instance and made available as files.
  /// </li>
  /// <li>
  /// <code>FastFile</code> - The training data is streamed directly from Amazon
  /// S3 to the training algorithm, providing faster access for large datasets.
  /// </li>
  /// <li>
  /// <code>Pipe</code> - The training data is streamed to the training
  /// algorithm using named pipes, which can improve performance for certain
  /// algorithms.
  /// </li>
  /// </ul>
  Future<CreateTrainedModelResponse> createTrainedModel({
    required String configuredModelAlgorithmAssociationArn,
    required List<ModelTrainingDataChannel> dataChannels,
    required String membershipIdentifier,
    required String name,
    required ResourceConfig resourceConfig,
    String? description,
    Map<String, String>? environment,
    Map<String, String>? hyperparameters,
    List<IncrementalTrainingDataChannel>? incrementalTrainingDataChannels,
    String? kmsKeyArn,
    String? mlModelTrainingPayerAccountId,
    StoppingCondition? stoppingCondition,
    Map<String, String>? tags,
    TrainingInputMode? trainingInputMode,
  }) async {
    final $payload = <String, dynamic>{
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'dataChannels': dataChannels,
      'name': name,
      'resourceConfig': resourceConfig,
      if (description != null) 'description': description,
      if (environment != null) 'environment': environment,
      if (hyperparameters != null) 'hyperparameters': hyperparameters,
      if (incrementalTrainingDataChannels != null)
        'incrementalTrainingDataChannels': incrementalTrainingDataChannels,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (mlModelTrainingPayerAccountId != null)
        'mlModelTrainingPayerAccountId': mlModelTrainingPayerAccountId,
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
      if (trainingInputMode != null)
        'trainingInputMode': trainingInputMode.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTrainedModelResponse.fromJson(response);
  }

  /// Returns information about a trained model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that created the trained model that you
  /// are interested in.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that you are
  /// interested in.
  ///
  /// Parameter [versionIdentifier] :
  /// The version identifier of the trained model to retrieve. If not specified,
  /// the operation returns information about the latest version of the trained
  /// model.
  Future<GetTrainedModelResponse> getTrainedModel({
    required String membershipIdentifier,
    required String trainedModelArn,
    String? versionIdentifier,
  }) async {
    final $query = <String, List<String>>{
      if (versionIdentifier != null) 'versionIdentifier': [versionIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTrainedModelResponse.fromJson(response);
  }

  /// Deletes the model artifacts stored by the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is deleting the trained model output.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model whose output you want
  /// to delete.
  ///
  /// Parameter [versionIdentifier] :
  /// The version identifier of the trained model to delete. If not specified,
  /// the operation will delete the base version of the trained model. When
  /// specified, only the particular version will be deleted.
  Future<void> deleteTrainedModelOutput({
    required String membershipIdentifier,
    required String trainedModelArn,
    String? versionIdentifier,
  }) async {
    final $query = <String, List<String>>{
      if (versionIdentifier != null) 'versionIdentifier': [versionIdentifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of trained models.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that created the trained models you are
  /// interested in.
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListTrainedModelsResponse> listTrainedModels({
    required String membershipIdentifier,
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
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrainedModelsResponse.fromJson(response);
  }

  /// Submits a request to cancel the trained model job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the trained model job that you want to cancel.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model job that you want to
  /// cancel.
  ///
  /// Parameter [versionIdentifier] :
  /// The version identifier of the trained model to cancel. This parameter
  /// allows you to specify which version of the trained model you want to
  /// cancel when multiple versions exist.
  ///
  /// If <code>versionIdentifier</code> is not specified, the base model will be
  /// cancelled.
  Future<void> cancelTrainedModel({
    required String membershipIdentifier,
    required String trainedModelArn,
    String? versionIdentifier,
  }) async {
    final $query = <String, List<String>>{
      if (versionIdentifier != null) 'versionIdentifier': [versionIdentifier],
    };
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a trained model in a collaboration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collaborationIdentifier] :
  /// The collaboration ID that contains the trained model that you want to
  /// return information about.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that you want to
  /// return information about.
  ///
  /// Parameter [versionIdentifier] :
  /// The version identifier of the trained model to retrieve. If not specified,
  /// the operation returns information about the latest version of the trained
  /// model.
  Future<GetCollaborationTrainedModelResponse> getCollaborationTrainedModel({
    required String collaborationIdentifier,
    required String trainedModelArn,
    String? versionIdentifier,
  }) async {
    final $query = <String, List<String>>{
      if (versionIdentifier != null) 'versionIdentifier': [versionIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/collaborations/${Uri.encodeComponent(collaborationIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCollaborationTrainedModelResponse.fromJson(response);
  }

  /// Returns a list of trained model versions for a specified trained model.
  /// This operation allows you to view all versions of a trained model,
  /// including information about their status and creation details. You can use
  /// this to track the evolution of your trained models and select specific
  /// versions for inference or further training.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership identifier for the collaboration that contains the trained
  /// model.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model for which to list
  /// versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of trained model versions to return in a single page.
  /// The default value is 10, and the maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous <code>ListTrainedModelVersions</code>
  /// request. Use this token to retrieve the next page of results.
  ///
  /// Parameter [status] :
  /// Filter the results to only include trained model versions with the
  /// specified status. Valid values include <code>CREATE_PENDING</code>,
  /// <code>CREATE_IN_PROGRESS</code>, <code>ACTIVE</code>,
  /// <code>CREATE_FAILED</code>, and others.
  Future<ListTrainedModelVersionsResponse> listTrainedModelVersions({
    required String membershipIdentifier,
    required String trainedModelArn,
    int? maxResults,
    String? nextToken,
    TrainedModelStatus? status,
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
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrainedModelVersionsResponse.fromJson(response);
  }

  /// Provides the information necessary to start a trained model export job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the member that is receiving the exported trained
  /// model artifacts.
  ///
  /// Parameter [name] :
  /// The name of the trained model export job.
  ///
  /// Parameter [outputConfiguration] :
  /// The output configuration information for the trained model export job.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that you want to
  /// export.
  ///
  /// Parameter [description] :
  /// The description of the trained model export job.
  ///
  /// Parameter [trainedModelVersionIdentifier] :
  /// The version identifier of the trained model to export. This specifies
  /// which version of the trained model should be exported to the specified
  /// destination.
  Future<void> startTrainedModelExportJob({
    required String membershipIdentifier,
    required String name,
    required TrainedModelExportOutputConfiguration outputConfiguration,
    required String trainedModelArn,
    String? description,
    String? trainedModelVersionIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'outputConfiguration': outputConfiguration,
      if (description != null) 'description': description,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-models/${Uri.encodeComponent(trainedModelArn)}/export-jobs',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Defines the information necessary to begin a trained model inference job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSource] :
  /// Defines the data source that is used for the trained model inference job.
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the membership that contains the trained model
  /// inference job.
  ///
  /// Parameter [name] :
  /// The name of the trained model inference job.
  ///
  /// Parameter [outputConfiguration] :
  /// Defines the output configuration information for the trained model
  /// inference job.
  ///
  /// Parameter [resourceConfig] :
  /// Defines the resource configuration for the trained model inference job.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of the trained model that is used for this
  /// trained model inference job.
  ///
  /// Parameter [configuredModelAlgorithmAssociationArn] :
  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association that is used for this trained model inference job.
  ///
  /// Parameter [containerExecutionParameters] :
  /// The execution parameters for the container.
  ///
  /// Parameter [description] :
  /// The description of the trained model inference job.
  ///
  /// Parameter [environment] :
  /// The environment variables to set in the Docker container.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the ML inference job and associated
  /// data.
  ///
  /// Parameter [mlModelInferencePayerAccountId] :
  /// The account ID of the member that is responsible for paying for model
  /// inference costs.
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
  /// Parameter [trainedModelVersionIdentifier] :
  /// The version identifier of the trained model to use for inference. This
  /// specifies which version of the trained model should be used to generate
  /// predictions on the input data.
  Future<StartTrainedModelInferenceJobResponse> startTrainedModelInferenceJob({
    required ModelInferenceDataSource dataSource,
    required String membershipIdentifier,
    required String name,
    required InferenceOutputConfiguration outputConfiguration,
    required InferenceResourceConfig resourceConfig,
    required String trainedModelArn,
    String? configuredModelAlgorithmAssociationArn,
    InferenceContainerExecutionParameters? containerExecutionParameters,
    String? description,
    Map<String, String>? environment,
    String? kmsKeyArn,
    String? mlModelInferencePayerAccountId,
    Map<String, String>? tags,
    String? trainedModelVersionIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'dataSource': dataSource,
      'name': name,
      'outputConfiguration': outputConfiguration,
      'resourceConfig': resourceConfig,
      'trainedModelArn': trainedModelArn,
      if (configuredModelAlgorithmAssociationArn != null)
        'configuredModelAlgorithmAssociationArn':
            configuredModelAlgorithmAssociationArn,
      if (containerExecutionParameters != null)
        'containerExecutionParameters': containerExecutionParameters,
      if (description != null) 'description': description,
      if (environment != null) 'environment': environment,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (mlModelInferencePayerAccountId != null)
        'mlModelInferencePayerAccountId': mlModelInferencePayerAccountId,
      if (tags != null) 'tags': tags,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-model-inference-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartTrainedModelInferenceJobResponse.fromJson(response);
  }

  /// Returns information about a trained model inference job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// Provides the membership ID of the membership that contains the trained
  /// model inference job that you are interested in.
  ///
  /// Parameter [trainedModelInferenceJobArn] :
  /// Provides the Amazon Resource Name (ARN) of the trained model inference job
  /// that you are interested in.
  Future<GetTrainedModelInferenceJobResponse> getTrainedModelInferenceJob({
    required String membershipIdentifier,
    required String trainedModelInferenceJobArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-model-inference-jobs/${Uri.encodeComponent(trainedModelInferenceJobArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTrainedModelInferenceJobResponse.fromJson(response);
  }

  /// Returns a list of trained model inference jobs that match the request
  /// parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the results that is returned per call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [trainedModelArn] :
  /// The Amazon Resource Name (ARN) of a trained model that was used to create
  /// the trained model inference jobs that you are interested in.
  ///
  /// Parameter [trainedModelVersionIdentifier] :
  /// The version identifier of the trained model to filter inference jobs by.
  /// When specified, only inference jobs that used this specific version of the
  /// trained model are returned.
  Future<ListTrainedModelInferenceJobsResponse> listTrainedModelInferenceJobs({
    required String membershipIdentifier,
    int? maxResults,
    String? nextToken,
    String? trainedModelArn,
    String? trainedModelVersionIdentifier,
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
      if (trainedModelArn != null) 'trainedModelArn': [trainedModelArn],
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': [trainedModelVersionIdentifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-model-inference-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTrainedModelInferenceJobsResponse.fromJson(response);
  }

  /// Submits a request to cancel a trained model inference job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [membershipIdentifier] :
  /// The membership ID of the trained model inference job that you want to
  /// cancel.
  ///
  /// Parameter [trainedModelInferenceJobArn] :
  /// The Amazon Resource Name (ARN) of the trained model inference job that you
  /// want to cancel.
  Future<void> cancelTrainedModelInferenceJob({
    required String membershipIdentifier,
    required String trainedModelInferenceJobArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/memberships/${Uri.encodeComponent(membershipIdentifier)}/trained-model-inference-jobs/${Uri.encodeComponent(trainedModelInferenceJobArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Defines the information necessary to create a training dataset. In Clean
  /// Rooms ML, the <code>TrainingDataset</code> is metadata that points to a
  /// Glue table, which is read only during <code>AudienceModel</code> creation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
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

  /// Returns information about a training dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Specifies a training dataset that you want to delete. You can't delete a
  /// training dataset if there are any audience models that depend on the
  /// training dataset. In Clean Rooms ML, the <code>TrainingDataset</code> is
  /// metadata that points to a Glue table, which is read only during
  /// <code>AudienceModel</code> creation. This action deletes the metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns a list of training datasets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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
}

/// @nodoc
class ListCollaborationConfiguredModelAlgorithmAssociationsResponse {
  /// The configured model algorithm associations that belong to this
  /// collaboration.
  final List<CollaborationConfiguredModelAlgorithmAssociationSummary>
      collaborationConfiguredModelAlgorithmAssociations;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListCollaborationConfiguredModelAlgorithmAssociationsResponse({
    required this.collaborationConfiguredModelAlgorithmAssociations,
    this.nextToken,
  });

  factory ListCollaborationConfiguredModelAlgorithmAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationConfiguredModelAlgorithmAssociationsResponse(
      collaborationConfiguredModelAlgorithmAssociations:
          ((json['collaborationConfiguredModelAlgorithmAssociations']
                      as List?) ??
                  const [])
              .nonNulls
              .map((e) =>
                  CollaborationConfiguredModelAlgorithmAssociationSummary
                      .fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationConfiguredModelAlgorithmAssociations =
        this.collaborationConfiguredModelAlgorithmAssociations;
    final nextToken = this.nextToken;
    return {
      'collaborationConfiguredModelAlgorithmAssociations':
          collaborationConfiguredModelAlgorithmAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationMLInputChannelsResponse {
  /// The list of ML input channels that you wanted.
  final List<CollaborationMLInputChannelSummary>
      collaborationMLInputChannelsList;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListCollaborationMLInputChannelsResponse({
    required this.collaborationMLInputChannelsList,
    this.nextToken,
  });

  factory ListCollaborationMLInputChannelsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationMLInputChannelsResponse(
      collaborationMLInputChannelsList:
          ((json['collaborationMLInputChannelsList'] as List?) ?? const [])
              .nonNulls
              .map((e) => CollaborationMLInputChannelSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationMLInputChannelsList =
        this.collaborationMLInputChannelsList;
    final nextToken = this.nextToken;
    return {
      'collaborationMLInputChannelsList': collaborationMLInputChannelsList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationTrainedModelExportJobsResponse {
  /// The exports jobs that exist for the requested trained model in the requested
  /// collaboration.
  final List<CollaborationTrainedModelExportJobSummary>
      collaborationTrainedModelExportJobs;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListCollaborationTrainedModelExportJobsResponse({
    required this.collaborationTrainedModelExportJobs,
    this.nextToken,
  });

  factory ListCollaborationTrainedModelExportJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationTrainedModelExportJobsResponse(
      collaborationTrainedModelExportJobs:
          ((json['collaborationTrainedModelExportJobs'] as List?) ?? const [])
              .nonNulls
              .map((e) => CollaborationTrainedModelExportJobSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationTrainedModelExportJobs =
        this.collaborationTrainedModelExportJobs;
    final nextToken = this.nextToken;
    return {
      'collaborationTrainedModelExportJobs':
          collaborationTrainedModelExportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationTrainedModelInferenceJobsResponse {
  /// The trained model inference jobs that you are interested in.
  final List<CollaborationTrainedModelInferenceJobSummary>
      collaborationTrainedModelInferenceJobs;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListCollaborationTrainedModelInferenceJobsResponse({
    required this.collaborationTrainedModelInferenceJobs,
    this.nextToken,
  });

  factory ListCollaborationTrainedModelInferenceJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationTrainedModelInferenceJobsResponse(
      collaborationTrainedModelInferenceJobs:
          ((json['collaborationTrainedModelInferenceJobs'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => CollaborationTrainedModelInferenceJobSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationTrainedModelInferenceJobs =
        this.collaborationTrainedModelInferenceJobs;
    final nextToken = this.nextToken;
    return {
      'collaborationTrainedModelInferenceJobs':
          collaborationTrainedModelInferenceJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCollaborationTrainedModelsResponse {
  /// The trained models in the collaboration that you requested.
  final List<CollaborationTrainedModelSummary> collaborationTrainedModels;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListCollaborationTrainedModelsResponse({
    required this.collaborationTrainedModels,
    this.nextToken,
  });

  factory ListCollaborationTrainedModelsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCollaborationTrainedModelsResponse(
      collaborationTrainedModels:
          ((json['collaborationTrainedModels'] as List?) ?? const [])
              .nonNulls
              .map((e) => CollaborationTrainedModelSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationTrainedModels = this.collaborationTrainedModels;
    final nextToken = this.nextToken;
    return {
      'collaborationTrainedModels': collaborationTrainedModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags that are associated with the resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
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
class ListAudienceExportJobsResponse {
  /// The audience export jobs that match the request.
  final List<AudienceExportJobSummary> audienceExportJobs;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListAudienceExportJobsResponse({
    required this.audienceExportJobs,
    this.nextToken,
  });

  factory ListAudienceExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListAudienceExportJobsResponse(
      audienceExportJobs: ((json['audienceExportJobs'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
class StartAudienceGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the audience generation job.
  final String audienceGenerationJobArn;

  StartAudienceGenerationJobResponse({
    required this.audienceGenerationJobArn,
  });

  factory StartAudienceGenerationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAudienceGenerationJobResponse(
      audienceGenerationJobArn:
          (json['audienceGenerationJobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final audienceGenerationJobArn = this.audienceGenerationJobArn;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
    };
  }
}

/// @nodoc
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

  /// The unique identifier of the protected query for this audience generation
  /// job.
  final String? protectedQueryIdentifier;

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
    this.protectedQueryIdentifier,
    this.seedAudience,
    this.startedBy,
    this.statusDetails,
    this.tags,
  });

  factory GetAudienceGenerationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetAudienceGenerationJobResponse(
      audienceGenerationJobArn:
          (json['audienceGenerationJobArn'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: AudienceGenerationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      collaborationId: json['collaborationId'] as String?,
      description: json['description'] as String?,
      includeSeedInOutput: json['includeSeedInOutput'] as bool?,
      metrics: json['metrics'] != null
          ? AudienceQualityMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
      protectedQueryIdentifier: json['protectedQueryIdentifier'] as String?,
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
    final protectedQueryIdentifier = this.protectedQueryIdentifier;
    final seedAudience = this.seedAudience;
    final startedBy = this.startedBy;
    final statusDetails = this.statusDetails;
    final tags = this.tags;
    return {
      'audienceGenerationJobArn': audienceGenerationJobArn,
      'configuredAudienceModelArn': configuredAudienceModelArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (collaborationId != null) 'collaborationId': collaborationId,
      if (description != null) 'description': description,
      if (includeSeedInOutput != null)
        'includeSeedInOutput': includeSeedInOutput,
      if (metrics != null) 'metrics': metrics,
      if (protectedQueryIdentifier != null)
        'protectedQueryIdentifier': protectedQueryIdentifier,
      if (seedAudience != null) 'seedAudience': seedAudience,
      if (startedBy != null) 'startedBy': startedBy,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListAudienceGenerationJobsResponse {
  /// The audience generation jobs that match the request.
  final List<AudienceGenerationJobSummary> audienceGenerationJobs;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListAudienceGenerationJobsResponse({
    required this.audienceGenerationJobs,
    this.nextToken,
  });

  factory ListAudienceGenerationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAudienceGenerationJobsResponse(
      audienceGenerationJobs: ((json['audienceGenerationJobs'] as List?) ??
              const [])
          .nonNulls
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

/// @nodoc
class CreateAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the audience model.
  final String audienceModelArn;

  CreateAudienceModelResponse({
    required this.audienceModelArn,
  });

  factory CreateAudienceModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateAudienceModelResponse(
      audienceModelArn: (json['audienceModelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final audienceModelArn = this.audienceModelArn;
    return {
      'audienceModelArn': audienceModelArn,
    };
  }
}

/// @nodoc
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
      audienceModelArn: (json['audienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: AudienceModelStatus.fromString((json['status'] as String?) ?? ''),
      trainingDatasetArn: (json['trainingDatasetArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
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

/// @nodoc
class ListAudienceModelsResponse {
  /// The audience models that match the request.
  final List<AudienceModelSummary> audienceModels;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListAudienceModelsResponse({
    required this.audienceModels,
    this.nextToken,
  });

  factory ListAudienceModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListAudienceModelsResponse(
      audienceModels: ((json['audienceModels'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
class CreateConfiguredAudienceModelResponse {
  /// The Amazon Resource Name (ARN) of the configured audience model.
  final String configuredAudienceModelArn;

  CreateConfiguredAudienceModelResponse({
    required this.configuredAudienceModelArn,
  });

  factory CreateConfiguredAudienceModelResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredAudienceModelResponse(
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    return {
      'configuredAudienceModelArn': configuredAudienceModelArn,
    };
  }
}

/// @nodoc
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
      audienceModelArn: (json['audienceModelArn'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      outputConfig: ConfiguredAudienceModelOutputConfig.fromJson(
          (json['outputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sharedAudienceMetrics:
          ((json['sharedAudienceMetrics'] as List?) ?? const [])
              .nonNulls
              .map((e) => SharedAudienceMetrics.fromString((e as String)))
              .toList(),
      status: ConfiguredAudienceModelStatus.fromString(
          (json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      audienceSizeConfig: json['audienceSizeConfig'] != null
          ? AudienceSizeConfig.fromJson(
              json['audienceSizeConfig'] as Map<String, dynamic>)
          : null,
      childResourceTagOnCreatePolicy:
          (json['childResourceTagOnCreatePolicy'] as String?)
              ?.let(TagOnCreatePolicy.fromString),
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
          sharedAudienceMetrics.map((e) => e.value).toList(),
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (audienceSizeConfig != null) 'audienceSizeConfig': audienceSizeConfig,
      if (childResourceTagOnCreatePolicy != null)
        'childResourceTagOnCreatePolicy': childResourceTagOnCreatePolicy.value,
      if (description != null) 'description': description,
      if (minMatchingSeedSize != null)
        'minMatchingSeedSize': minMatchingSeedSize,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
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
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuredAudienceModelArn = this.configuredAudienceModelArn;
    return {
      'configuredAudienceModelArn': configuredAudienceModelArn,
    };
  }
}

/// @nodoc
class ListConfiguredAudienceModelsResponse {
  /// The configured audience models.
  final List<ConfiguredAudienceModelSummary> configuredAudienceModels;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListConfiguredAudienceModelsResponse({
    required this.configuredAudienceModels,
    this.nextToken,
  });

  factory ListConfiguredAudienceModelsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredAudienceModelsResponse(
      configuredAudienceModels:
          ((json['configuredAudienceModels'] as List?) ?? const [])
              .nonNulls
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

/// @nodoc
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
          (json['configuredAudienceModelPolicy'] as String?) ?? '',
      policyHash: (json['policyHash'] as String?) ?? '',
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

/// @nodoc
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
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      configuredAudienceModelPolicy:
          (json['configuredAudienceModelPolicy'] as String?) ?? '',
      policyHash: (json['policyHash'] as String?) ?? '',
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

/// @nodoc
class CreateConfiguredModelAlgorithmResponse {
  /// The Amazon Resource Name (ARN) of the configured model algorithm.
  final String configuredModelAlgorithmArn;

  CreateConfiguredModelAlgorithmResponse({
    required this.configuredModelAlgorithmArn,
  });

  factory CreateConfiguredModelAlgorithmResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredModelAlgorithmResponse(
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    return {
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
    };
  }
}

/// @nodoc
class GetConfiguredModelAlgorithmResponse {
  /// The Amazon Resource Name (ARN) of the configured model algorithm.
  final String configuredModelAlgorithmArn;

  /// The time at which the configured model algorithm was created.
  final DateTime createTime;

  /// The name of the configured model algorithm.
  final String name;

  /// The Amazon Resource Name (ARN) of the service role that was used to create
  /// the configured model algorithm.
  final String roleArn;

  /// The most recent time at which the configured model algorithm was updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm.
  final String? description;

  /// Configuration information for the inference container.
  final InferenceContainerConfig? inferenceContainerConfig;

  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the configured ML model and associated
  /// data.
  final String? kmsKeyArn;

  /// The optional metadata that you applied to the resource to help you
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
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete tag
  /// keys with this prefix. Values can have this prefix. If a tag value has aws
  /// as its prefix but the key does not, then Clean Rooms ML considers it to be a
  /// user tag and will count against the limit of 50 tags. Tags with only the key
  /// prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  /// The configuration information of the training container for the configured
  /// model algorithm.
  final ContainerConfig? trainingContainerConfig;

  GetConfiguredModelAlgorithmResponse({
    required this.configuredModelAlgorithmArn,
    required this.createTime,
    required this.name,
    required this.roleArn,
    required this.updateTime,
    this.description,
    this.inferenceContainerConfig,
    this.kmsKeyArn,
    this.tags,
    this.trainingContainerConfig,
  });

  factory GetConfiguredModelAlgorithmResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredModelAlgorithmResponse(
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      inferenceContainerConfig: json['inferenceContainerConfig'] != null
          ? InferenceContainerConfig.fromJson(
              json['inferenceContainerConfig'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trainingContainerConfig: json['trainingContainerConfig'] != null
          ? ContainerConfig.fromJson(
              json['trainingContainerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final createTime = this.createTime;
    final name = this.name;
    final roleArn = this.roleArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final inferenceContainerConfig = this.inferenceContainerConfig;
    final kmsKeyArn = this.kmsKeyArn;
    final tags = this.tags;
    final trainingContainerConfig = this.trainingContainerConfig;
    return {
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'roleArn': roleArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (inferenceContainerConfig != null)
        'inferenceContainerConfig': inferenceContainerConfig,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (trainingContainerConfig != null)
        'trainingContainerConfig': trainingContainerConfig,
    };
  }
}

/// @nodoc
class ListConfiguredModelAlgorithmsResponse {
  /// The list of configured model algorithms.
  final List<ConfiguredModelAlgorithmSummary> configuredModelAlgorithms;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListConfiguredModelAlgorithmsResponse({
    required this.configuredModelAlgorithms,
    this.nextToken,
  });

  factory ListConfiguredModelAlgorithmsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredModelAlgorithmsResponse(
      configuredModelAlgorithms:
          ((json['configuredModelAlgorithms'] as List?) ?? const [])
              .nonNulls
              .map((e) => ConfiguredModelAlgorithmSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithms = this.configuredModelAlgorithms;
    final nextToken = this.nextToken;
    return {
      'configuredModelAlgorithms': configuredModelAlgorithms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateConfiguredModelAlgorithmAssociationResponse {
  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmAssociationArn;

  CreateConfiguredModelAlgorithmAssociationResponse({
    required this.configuredModelAlgorithmAssociationArn,
  });

  factory CreateConfiguredModelAlgorithmAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateConfiguredModelAlgorithmAssociationResponse(
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    return {
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
    };
  }
}

/// @nodoc
class GetConfiguredModelAlgorithmAssociationResponse {
  /// The collaboration ID of the collaboration that contains the configured model
  /// algorithm association.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm that was
  /// associated to the collaboration.
  final String configuredModelAlgorithmArn;

  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the configured model algorithm association was created.
  final DateTime createTime;

  /// The membership ID of the member that created the configured model algorithm
  /// association.
  final String membershipIdentifier;

  /// The name of the configured model algorithm association.
  final String name;

  /// The most recent time at which the configured model algorithm association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm association.
  final String? description;

  /// The privacy configuration information for the configured model algorithm
  /// association.
  final PrivacyConfiguration? privacyConfiguration;

  /// The optional metadata that you applied to the resource to help you
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
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete tag
  /// keys with this prefix. Values can have this prefix. If a tag value has aws
  /// as its prefix but the key does not, then Clean Rooms ML considers it to be a
  /// user tag and will count against the limit of 50 tags. Tags with only the key
  /// prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  GetConfiguredModelAlgorithmAssociationResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmArn,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.membershipIdentifier,
    required this.name,
    required this.updateTime,
    this.description,
    this.privacyConfiguration,
    this.tags,
  });

  factory GetConfiguredModelAlgorithmAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfiguredModelAlgorithmAssociationResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      privacyConfiguration: json['privacyConfiguration'] != null
          ? PrivacyConfiguration.fromJson(
              json['privacyConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final privacyConfiguration = this.privacyConfiguration;
    final tags = this.tags;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (privacyConfiguration != null)
        'privacyConfiguration': privacyConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListConfiguredModelAlgorithmAssociationsResponse {
  /// The list of configured model algorithm associations.
  final List<ConfiguredModelAlgorithmAssociationSummary>
      configuredModelAlgorithmAssociations;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListConfiguredModelAlgorithmAssociationsResponse({
    required this.configuredModelAlgorithmAssociations,
    this.nextToken,
  });

  factory ListConfiguredModelAlgorithmAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConfiguredModelAlgorithmAssociationsResponse(
      configuredModelAlgorithmAssociations:
          ((json['configuredModelAlgorithmAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => ConfiguredModelAlgorithmAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithmAssociations =
        this.configuredModelAlgorithmAssociations;
    final nextToken = this.nextToken;
    return {
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetCollaborationConfiguredModelAlgorithmAssociationResponse {
  /// The collaboration ID of the collaboration that contains the configured model
  /// algorithm association.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmArn;

  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the configured model algorithm association was created.
  final DateTime createTime;

  /// The account ID of the member that created the configured model algorithm
  /// association.
  final String creatorAccountId;

  /// The membership ID of the member that created the configured model algorithm
  /// association.
  final String membershipIdentifier;

  /// The name of the configured model algorithm association.
  final String name;

  /// The most recent time at which the configured model algorithm association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm association.
  final String? description;
  final PrivacyConfiguration? privacyConfiguration;

  GetCollaborationConfiguredModelAlgorithmAssociationResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmArn,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.updateTime,
    this.description,
    this.privacyConfiguration,
  });

  factory GetCollaborationConfiguredModelAlgorithmAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationConfiguredModelAlgorithmAssociationResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      privacyConfiguration: json['privacyConfiguration'] != null
          ? PrivacyConfiguration.fromJson(
              json['privacyConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    final privacyConfiguration = this.privacyConfiguration;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (privacyConfiguration != null)
        'privacyConfiguration': privacyConfiguration,
    };
  }
}

/// @nodoc
class GetMLConfigurationResponse {
  /// The time at which the ML configuration was created.
  final DateTime createTime;

  /// The Amazon S3 location where ML model output is stored.
  final MLOutputConfiguration defaultOutputLocation;

  /// The membership ID of the member that owns the ML configuration you
  /// requested.
  final String membershipIdentifier;

  /// The most recent time at which the ML configuration was updated.
  final DateTime updateTime;

  GetMLConfigurationResponse({
    required this.createTime,
    required this.defaultOutputLocation,
    required this.membershipIdentifier,
    required this.updateTime,
  });

  factory GetMLConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetMLConfigurationResponse(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      defaultOutputLocation: MLOutputConfiguration.fromJson(
          (json['defaultOutputLocation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final defaultOutputLocation = this.defaultOutputLocation;
    final membershipIdentifier = this.membershipIdentifier;
    final updateTime = this.updateTime;
    return {
      'createTime': iso8601ToJson(createTime),
      'defaultOutputLocation': defaultOutputLocation,
      'membershipIdentifier': membershipIdentifier,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class CreateMLInputChannelResponse {
  /// The Amazon Resource Name (ARN) of the ML input channel.
  final String mlInputChannelArn;

  CreateMLInputChannelResponse({
    required this.mlInputChannelArn,
  });

  factory CreateMLInputChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateMLInputChannelResponse(
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mlInputChannelArn = this.mlInputChannelArn;
    return {
      'mlInputChannelArn': mlInputChannelArn,
    };
  }
}

/// @nodoc
class GetMLInputChannelResponse {
  /// The collaboration ID of the collaboration that contains the ML input
  /// channel.
  final String collaborationIdentifier;

  /// The configured model algorithm associations that were used to create the ML
  /// input channel.
  final List<String> configuredModelAlgorithmAssociations;

  /// The time at which the ML input channel was created.
  final DateTime createTime;

  /// The input channel that was used to create the ML input channel.
  final InputChannel inputChannel;

  /// The membership ID of the membership that contains the ML input channel.
  final String membershipIdentifier;

  /// The Amazon Resource Name (ARN) of the ML input channel.
  final String mlInputChannelArn;

  /// The name of the ML input channel.
  final String name;

  /// The number of days to keep the data in the ML input channel.
  final int retentionInDays;

  /// The status of the ML input channel.
  final MLInputChannelStatus status;

  /// The most recent time at which the ML input channel was updated.
  final DateTime updateTime;

  /// The description of the ML input channel.
  final String? description;

  /// The Amazon Resource Name (ARN) of the KMS key that was used to create the ML
  /// input channel.
  final String? kmsKeyArn;

  /// The number of files in the ML input channel.
  final double? numberOfFiles;

  /// The number of records in the ML input channel.
  final int? numberOfRecords;

  /// The payer configuration for the ML input channel.
  final PayerConfiguration? payerConfiguration;

  /// Returns the privacy budgets that control access to this Clean Rooms ML input
  /// channel. Use these budgets to monitor and limit resource consumption over
  /// specified time periods.
  final PrivacyBudgets? privacyBudgets;

  /// The ID of the protected query that was used to create the ML input channel.
  final String? protectedQueryIdentifier;

  /// The size, in GB, of the ML input channel.
  final double? sizeInGb;
  final StatusDetails? statusDetails;

  /// The synthetic data configuration for this ML input channel, including
  /// parameters for generating privacy-preserving synthetic data and evaluation
  /// scores for measuring the privacy of the generated data.
  final SyntheticDataConfiguration? syntheticDataConfiguration;

  /// The optional metadata that you applied to the resource to help you
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
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete tag
  /// keys with this prefix. Values can have this prefix. If a tag value has aws
  /// as its prefix but the key does not, then Clean Rooms ML considers it to be a
  /// user tag and will count against the limit of 50 tags. Tags with only the key
  /// prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  GetMLInputChannelResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociations,
    required this.createTime,
    required this.inputChannel,
    required this.membershipIdentifier,
    required this.mlInputChannelArn,
    required this.name,
    required this.retentionInDays,
    required this.status,
    required this.updateTime,
    this.description,
    this.kmsKeyArn,
    this.numberOfFiles,
    this.numberOfRecords,
    this.payerConfiguration,
    this.privacyBudgets,
    this.protectedQueryIdentifier,
    this.sizeInGb,
    this.statusDetails,
    this.syntheticDataConfiguration,
    this.tags,
  });

  factory GetMLInputChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetMLInputChannelResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociations:
          ((json['configuredModelAlgorithmAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      inputChannel: InputChannel.fromJson(
          (json['inputChannel'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      retentionInDays: (json['retentionInDays'] as int?) ?? 0,
      status:
          MLInputChannelStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      numberOfFiles: json['numberOfFiles'] as double?,
      numberOfRecords: json['numberOfRecords'] as int?,
      payerConfiguration: json['payerConfiguration'] != null
          ? PayerConfiguration.fromJson(
              json['payerConfiguration'] as Map<String, dynamic>)
          : null,
      privacyBudgets: json['privacyBudgets'] != null
          ? PrivacyBudgets.fromJson(
              json['privacyBudgets'] as Map<String, dynamic>)
          : null,
      protectedQueryIdentifier: json['protectedQueryIdentifier'] as String?,
      sizeInGb: json['sizeInGb'] as double?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      syntheticDataConfiguration: json['syntheticDataConfiguration'] != null
          ? SyntheticDataConfiguration.fromJson(
              json['syntheticDataConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociations =
        this.configuredModelAlgorithmAssociations;
    final createTime = this.createTime;
    final inputChannel = this.inputChannel;
    final membershipIdentifier = this.membershipIdentifier;
    final mlInputChannelArn = this.mlInputChannelArn;
    final name = this.name;
    final retentionInDays = this.retentionInDays;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final numberOfFiles = this.numberOfFiles;
    final numberOfRecords = this.numberOfRecords;
    final payerConfiguration = this.payerConfiguration;
    final privacyBudgets = this.privacyBudgets;
    final protectedQueryIdentifier = this.protectedQueryIdentifier;
    final sizeInGb = this.sizeInGb;
    final statusDetails = this.statusDetails;
    final syntheticDataConfiguration = this.syntheticDataConfiguration;
    final tags = this.tags;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      'createTime': iso8601ToJson(createTime),
      'inputChannel': inputChannel,
      'membershipIdentifier': membershipIdentifier,
      'mlInputChannelArn': mlInputChannelArn,
      'name': name,
      'retentionInDays': retentionInDays,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (numberOfFiles != null) 'numberOfFiles': numberOfFiles,
      if (numberOfRecords != null) 'numberOfRecords': numberOfRecords,
      if (payerConfiguration != null) 'payerConfiguration': payerConfiguration,
      if (privacyBudgets != null) 'privacyBudgets': privacyBudgets,
      if (protectedQueryIdentifier != null)
        'protectedQueryIdentifier': protectedQueryIdentifier,
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (syntheticDataConfiguration != null)
        'syntheticDataConfiguration': syntheticDataConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListMLInputChannelsResponse {
  /// The list of ML input channels that you wanted.
  final List<MLInputChannelSummary> mlInputChannelsList;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListMLInputChannelsResponse({
    required this.mlInputChannelsList,
    this.nextToken,
  });

  factory ListMLInputChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListMLInputChannelsResponse(
      mlInputChannelsList: ((json['mlInputChannelsList'] as List?) ?? const [])
          .nonNulls
          .map((e) => MLInputChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mlInputChannelsList = this.mlInputChannelsList;
    final nextToken = this.nextToken;
    return {
      'mlInputChannelsList': mlInputChannelsList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetCollaborationMLInputChannelResponse {
  /// The collaboration ID of the collaboration that contains the ML input
  /// channel.
  final String collaborationIdentifier;

  /// The configured model algorithm associations that were used to create the ML
  /// input channel.
  final List<String> configuredModelAlgorithmAssociations;

  /// The time at which the ML input channel was created.
  final DateTime createTime;

  /// The account ID of the member who created the ML input channel.
  final String creatorAccountId;

  /// The membership ID of the membership that contains the ML input channel.
  final String membershipIdentifier;

  /// The Amazon Resource Name (ARN) of the ML input channel.
  final String mlInputChannelArn;

  /// The name of the ML input channel.
  final String name;

  /// The number of days to retain the data for the ML input channel.
  final int retentionInDays;

  /// The status of the ML input channel.
  final MLInputChannelStatus status;

  /// The most recent time at which the ML input channel was updated.
  final DateTime updateTime;

  /// The description of the ML input channel.
  final String? description;

  /// The number of records in the ML input channel.
  final int? numberOfRecords;

  /// The payer configuration for the ML input channel.
  final PayerConfiguration? payerConfiguration;

  /// Returns the privacy budgets that control access to this Clean Rooms ML input
  /// channel. Use these budgets to monitor and limit resource consumption over
  /// specified time periods.
  final PrivacyBudgets? privacyBudgets;
  final StatusDetails? statusDetails;

  /// The synthetic data configuration for this ML input channel, including
  /// parameters for generating privacy-preserving synthetic data and evaluation
  /// scores for measuring the privacy of the generated data.
  final SyntheticDataConfiguration? syntheticDataConfiguration;

  GetCollaborationMLInputChannelResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociations,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.mlInputChannelArn,
    required this.name,
    required this.retentionInDays,
    required this.status,
    required this.updateTime,
    this.description,
    this.numberOfRecords,
    this.payerConfiguration,
    this.privacyBudgets,
    this.statusDetails,
    this.syntheticDataConfiguration,
  });

  factory GetCollaborationMLInputChannelResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationMLInputChannelResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociations:
          ((json['configuredModelAlgorithmAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      retentionInDays: (json['retentionInDays'] as int?) ?? 0,
      status:
          MLInputChannelStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      numberOfRecords: json['numberOfRecords'] as int?,
      payerConfiguration: json['payerConfiguration'] != null
          ? PayerConfiguration.fromJson(
              json['payerConfiguration'] as Map<String, dynamic>)
          : null,
      privacyBudgets: json['privacyBudgets'] != null
          ? PrivacyBudgets.fromJson(
              json['privacyBudgets'] as Map<String, dynamic>)
          : null,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      syntheticDataConfiguration: json['syntheticDataConfiguration'] != null
          ? SyntheticDataConfiguration.fromJson(
              json['syntheticDataConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociations =
        this.configuredModelAlgorithmAssociations;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final mlInputChannelArn = this.mlInputChannelArn;
    final name = this.name;
    final retentionInDays = this.retentionInDays;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    final numberOfRecords = this.numberOfRecords;
    final payerConfiguration = this.payerConfiguration;
    final privacyBudgets = this.privacyBudgets;
    final statusDetails = this.statusDetails;
    final syntheticDataConfiguration = this.syntheticDataConfiguration;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'mlInputChannelArn': mlInputChannelArn,
      'name': name,
      'retentionInDays': retentionInDays,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (numberOfRecords != null) 'numberOfRecords': numberOfRecords,
      if (payerConfiguration != null) 'payerConfiguration': payerConfiguration,
      if (privacyBudgets != null) 'privacyBudgets': privacyBudgets,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (syntheticDataConfiguration != null)
        'syntheticDataConfiguration': syntheticDataConfiguration,
    };
  }
}

/// @nodoc
class CreateTrainedModelResponse {
  /// The Amazon Resource Name (ARN) of the trained model.
  final String trainedModelArn;

  /// The unique version identifier assigned to the newly created trained model.
  /// This identifier can be used to reference this specific version of the
  /// trained model in subsequent operations such as inference jobs or incremental
  /// training.
  ///
  /// The initial version identifier for the base version of the trained model is
  /// "NULL".
  final String? versionIdentifier;

  CreateTrainedModelResponse({
    required this.trainedModelArn,
    this.versionIdentifier,
  });

  factory CreateTrainedModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrainedModelResponse(
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModelArn = this.trainedModelArn;
    final versionIdentifier = this.versionIdentifier;
    return {
      'trainedModelArn': trainedModelArn,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// @nodoc
class GetTrainedModelResponse {
  /// The collaboration ID of the collaboration that contains the trained model.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that was used to create the trained model.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the trained model was created.
  final DateTime createTime;

  /// The data channels that were used for the trained model.
  final List<ModelTrainingDataChannel> dataChannels;

  /// The membership ID of the member that created the trained model.
  final String membershipIdentifier;

  /// The name of the trained model.
  final String name;

  /// The status of the trained model.
  final TrainedModelStatus status;

  /// The Amazon Resource Name (ARN) of the trained model.
  final String trainedModelArn;

  /// The most recent time at which the trained model was updated.
  final DateTime updateTime;

  /// The description of the trained model.
  final String? description;

  /// The EC2 environment that was used to create the trained model.
  final Map<String, String>? environment;

  /// The hyperparameters that were used to create the trained model.
  final Map<String, String>? hyperparameters;

  /// Information about the incremental training data channels used to create this
  /// version of the trained model. This includes details about the base model
  /// that was used for incremental training and the channel configuration.
  final List<IncrementalTrainingDataChannelOutput>?
      incrementalTrainingDataChannels;

  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the trained ML model and associated data.
  final String? kmsKeyArn;

  /// The logs status for the trained model.
  final LogsStatus? logsStatus;

  /// Details about the logs status for the trained model.
  final String? logsStatusDetails;

  /// The status of the model metrics.
  final MetricsStatus? metricsStatus;

  /// Details about the metrics status for the trained model.
  final String? metricsStatusDetails;

  /// The account ID of the member that is responsible for paying for model
  /// training costs.
  final String? mlModelTrainingPayerAccountId;

  /// The EC2 resource configuration that was used to create the trained model.
  final ResourceConfig? resourceConfig;
  final StatusDetails? statusDetails;

  /// The stopping condition that was used to terminate model training.
  final StoppingCondition? stoppingCondition;

  /// The optional metadata that you applied to the resource to help you
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
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete tag
  /// keys with this prefix. Values can have this prefix. If a tag value has aws
  /// as its prefix but the key does not, then Clean Rooms ML considers it to be a
  /// user tag and will count against the limit of 50 tags. Tags with only the key
  /// prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  /// Information about the training image container.
  final String? trainingContainerImageDigest;

  /// The input mode that was used for accessing the training data when this
  /// trained model was created. This indicates how the training data was made
  /// available to the training algorithm.
  final TrainingInputMode? trainingInputMode;

  /// The version identifier of the trained model. This unique identifier
  /// distinguishes this version from other versions of the same trained model.
  final String? versionIdentifier;

  GetTrainedModelResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.dataChannels,
    required this.membershipIdentifier,
    required this.name,
    required this.status,
    required this.trainedModelArn,
    required this.updateTime,
    this.description,
    this.environment,
    this.hyperparameters,
    this.incrementalTrainingDataChannels,
    this.kmsKeyArn,
    this.logsStatus,
    this.logsStatusDetails,
    this.metricsStatus,
    this.metricsStatusDetails,
    this.mlModelTrainingPayerAccountId,
    this.resourceConfig,
    this.statusDetails,
    this.stoppingCondition,
    this.tags,
    this.trainingContainerImageDigest,
    this.trainingInputMode,
    this.versionIdentifier,
  });

  factory GetTrainedModelResponse.fromJson(Map<String, dynamic> json) {
    return GetTrainedModelResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      dataChannels: ((json['dataChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ModelTrainingDataChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: TrainedModelStatus.fromString((json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      environment: (json['environment'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      hyperparameters: (json['hyperparameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      incrementalTrainingDataChannels:
          (json['incrementalTrainingDataChannels'] as List?)
              ?.nonNulls
              .map((e) => IncrementalTrainingDataChannelOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
      logsStatus: (json['logsStatus'] as String?)?.let(LogsStatus.fromString),
      logsStatusDetails: json['logsStatusDetails'] as String?,
      metricsStatus:
          (json['metricsStatus'] as String?)?.let(MetricsStatus.fromString),
      metricsStatusDetails: json['metricsStatusDetails'] as String?,
      mlModelTrainingPayerAccountId:
          json['mlModelTrainingPayerAccountId'] as String?,
      resourceConfig: json['resourceConfig'] != null
          ? ResourceConfig.fromJson(
              json['resourceConfig'] as Map<String, dynamic>)
          : null,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      stoppingCondition: json['stoppingCondition'] != null
          ? StoppingCondition.fromJson(
              json['stoppingCondition'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trainingContainerImageDigest:
          json['trainingContainerImageDigest'] as String?,
      trainingInputMode: (json['trainingInputMode'] as String?)
          ?.let(TrainingInputMode.fromString),
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final dataChannels = this.dataChannels;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final environment = this.environment;
    final hyperparameters = this.hyperparameters;
    final incrementalTrainingDataChannels =
        this.incrementalTrainingDataChannels;
    final kmsKeyArn = this.kmsKeyArn;
    final logsStatus = this.logsStatus;
    final logsStatusDetails = this.logsStatusDetails;
    final metricsStatus = this.metricsStatus;
    final metricsStatusDetails = this.metricsStatusDetails;
    final mlModelTrainingPayerAccountId = this.mlModelTrainingPayerAccountId;
    final resourceConfig = this.resourceConfig;
    final statusDetails = this.statusDetails;
    final stoppingCondition = this.stoppingCondition;
    final tags = this.tags;
    final trainingContainerImageDigest = this.trainingContainerImageDigest;
    final trainingInputMode = this.trainingInputMode;
    final versionIdentifier = this.versionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'dataChannels': dataChannels,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (environment != null) 'environment': environment,
      if (hyperparameters != null) 'hyperparameters': hyperparameters,
      if (incrementalTrainingDataChannels != null)
        'incrementalTrainingDataChannels': incrementalTrainingDataChannels,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (logsStatus != null) 'logsStatus': logsStatus.value,
      if (logsStatusDetails != null) 'logsStatusDetails': logsStatusDetails,
      if (metricsStatus != null) 'metricsStatus': metricsStatus.value,
      if (metricsStatusDetails != null)
        'metricsStatusDetails': metricsStatusDetails,
      if (mlModelTrainingPayerAccountId != null)
        'mlModelTrainingPayerAccountId': mlModelTrainingPayerAccountId,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (tags != null) 'tags': tags,
      if (trainingContainerImageDigest != null)
        'trainingContainerImageDigest': trainingContainerImageDigest,
      if (trainingInputMode != null)
        'trainingInputMode': trainingInputMode.value,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// @nodoc
class ListTrainedModelsResponse {
  /// The list of trained models.
  final List<TrainedModelSummary> trainedModels;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListTrainedModelsResponse({
    required this.trainedModels,
    this.nextToken,
  });

  factory ListTrainedModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrainedModelsResponse(
      trainedModels: ((json['trainedModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => TrainedModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModels = this.trainedModels;
    final nextToken = this.nextToken;
    return {
      'trainedModels': trainedModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetCollaborationTrainedModelResponse {
  /// The collaboration ID of the collaboration that contains the trained model.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that was used to create this trained model.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the trained model was created.
  final DateTime createTime;

  /// The account ID of the member that created the trained model.
  final String creatorAccountId;

  /// The membership ID of the member that created the trained model.
  final String membershipIdentifier;

  /// The name of the trained model.
  final String name;

  /// The status of the trained model.
  final TrainedModelStatus status;

  /// The Amazon Resource Name (ARN) of the trained model.
  final String trainedModelArn;

  /// The most recent time at which the trained model was updated.
  final DateTime updateTime;

  /// The description of the trained model.
  final String? description;

  /// Information about the incremental training data channels used to create this
  /// version of the trained model. This includes details about the base model
  /// that was used for incremental training and the channel configuration.
  final List<IncrementalTrainingDataChannelOutput>?
      incrementalTrainingDataChannels;

  /// Status information for the logs.
  final LogsStatus? logsStatus;

  /// Details about the status information for the logs.
  final String? logsStatusDetails;

  /// The status of the model metrics.
  final MetricsStatus? metricsStatus;

  /// Details about the status information for the model metrics.
  final String? metricsStatusDetails;

  /// The account ID of the member that is responsible for paying for model
  /// training costs.
  final String? mlModelTrainingPayerAccountId;

  /// The EC2 resource configuration that was used to train this model.
  final ResourceConfig? resourceConfig;
  final StatusDetails? statusDetails;

  /// The stopping condition that determined when model training ended.
  final StoppingCondition? stoppingCondition;

  /// Information about the training container image.
  final String? trainingContainerImageDigest;

  /// The input mode that was used for accessing the training data when this
  /// trained model was created. This indicates how the training data was made
  /// available to the training algorithm.
  final TrainingInputMode? trainingInputMode;

  /// The version identifier of the trained model. This unique identifier
  /// distinguishes this version from other versions of the same trained model.
  final String? versionIdentifier;

  GetCollaborationTrainedModelResponse({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.status,
    required this.trainedModelArn,
    required this.updateTime,
    this.description,
    this.incrementalTrainingDataChannels,
    this.logsStatus,
    this.logsStatusDetails,
    this.metricsStatus,
    this.metricsStatusDetails,
    this.mlModelTrainingPayerAccountId,
    this.resourceConfig,
    this.statusDetails,
    this.stoppingCondition,
    this.trainingContainerImageDigest,
    this.trainingInputMode,
    this.versionIdentifier,
  });

  factory GetCollaborationTrainedModelResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCollaborationTrainedModelResponse(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: TrainedModelStatus.fromString((json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      incrementalTrainingDataChannels:
          (json['incrementalTrainingDataChannels'] as List?)
              ?.nonNulls
              .map((e) => IncrementalTrainingDataChannelOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      logsStatus: (json['logsStatus'] as String?)?.let(LogsStatus.fromString),
      logsStatusDetails: json['logsStatusDetails'] as String?,
      metricsStatus:
          (json['metricsStatus'] as String?)?.let(MetricsStatus.fromString),
      metricsStatusDetails: json['metricsStatusDetails'] as String?,
      mlModelTrainingPayerAccountId:
          json['mlModelTrainingPayerAccountId'] as String?,
      resourceConfig: json['resourceConfig'] != null
          ? ResourceConfig.fromJson(
              json['resourceConfig'] as Map<String, dynamic>)
          : null,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      stoppingCondition: json['stoppingCondition'] != null
          ? StoppingCondition.fromJson(
              json['stoppingCondition'] as Map<String, dynamic>)
          : null,
      trainingContainerImageDigest:
          json['trainingContainerImageDigest'] as String?,
      trainingInputMode: (json['trainingInputMode'] as String?)
          ?.let(TrainingInputMode.fromString),
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final incrementalTrainingDataChannels =
        this.incrementalTrainingDataChannels;
    final logsStatus = this.logsStatus;
    final logsStatusDetails = this.logsStatusDetails;
    final metricsStatus = this.metricsStatus;
    final metricsStatusDetails = this.metricsStatusDetails;
    final mlModelTrainingPayerAccountId = this.mlModelTrainingPayerAccountId;
    final resourceConfig = this.resourceConfig;
    final statusDetails = this.statusDetails;
    final stoppingCondition = this.stoppingCondition;
    final trainingContainerImageDigest = this.trainingContainerImageDigest;
    final trainingInputMode = this.trainingInputMode;
    final versionIdentifier = this.versionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (incrementalTrainingDataChannels != null)
        'incrementalTrainingDataChannels': incrementalTrainingDataChannels,
      if (logsStatus != null) 'logsStatus': logsStatus.value,
      if (logsStatusDetails != null) 'logsStatusDetails': logsStatusDetails,
      if (metricsStatus != null) 'metricsStatus': metricsStatus.value,
      if (metricsStatusDetails != null)
        'metricsStatusDetails': metricsStatusDetails,
      if (mlModelTrainingPayerAccountId != null)
        'mlModelTrainingPayerAccountId': mlModelTrainingPayerAccountId,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stoppingCondition != null) 'stoppingCondition': stoppingCondition,
      if (trainingContainerImageDigest != null)
        'trainingContainerImageDigest': trainingContainerImageDigest,
      if (trainingInputMode != null)
        'trainingInputMode': trainingInputMode.value,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// @nodoc
class ListTrainedModelVersionsResponse {
  /// A list of trained model versions that match the specified criteria. Each
  /// entry contains summary information about a trained model version, including
  /// its version identifier, status, and creation details.
  final List<TrainedModelSummary> trainedModels;

  /// The pagination token to use in a subsequent
  /// <code>ListTrainedModelVersions</code> request to retrieve the next page of
  /// results. This value is null when there are no more results to return.
  final String? nextToken;

  ListTrainedModelVersionsResponse({
    required this.trainedModels,
    this.nextToken,
  });

  factory ListTrainedModelVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrainedModelVersionsResponse(
      trainedModels: ((json['trainedModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => TrainedModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModels = this.trainedModels;
    final nextToken = this.nextToken;
    return {
      'trainedModels': trainedModels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartTrainedModelInferenceJobResponse {
  /// The Amazon Resource Name (ARN) of the trained model inference job.
  final String trainedModelInferenceJobArn;

  StartTrainedModelInferenceJobResponse({
    required this.trainedModelInferenceJobArn,
  });

  factory StartTrainedModelInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartTrainedModelInferenceJobResponse(
      trainedModelInferenceJobArn:
          (json['trainedModelInferenceJobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModelInferenceJobArn = this.trainedModelInferenceJobArn;
    return {
      'trainedModelInferenceJobArn': trainedModelInferenceJobArn,
    };
  }
}

/// @nodoc
class GetTrainedModelInferenceJobResponse {
  /// The time at which the trained model inference job was created.
  final DateTime createTime;

  /// The data source that was used for the trained model inference job.
  final ModelInferenceDataSource dataSource;

  /// The membership ID of the membership that contains the trained model
  /// inference job.
  final String membershipIdentifier;

  /// The name of the trained model inference job.
  final String name;

  /// The output configuration information for the trained model inference job.
  final InferenceOutputConfiguration outputConfiguration;

  /// The resource configuration information for the trained model inference job.
  final InferenceResourceConfig resourceConfig;

  /// The status of the trained model inference job.
  final TrainedModelInferenceJobStatus status;

  /// The Amazon Resource Name (ARN) for the trained model that was used for the
  /// trained model inference job.
  final String trainedModelArn;

  /// The Amazon Resource Name (ARN) of the trained model inference job.
  final String trainedModelInferenceJobArn;

  /// The most recent time at which the trained model inference job was updated.
  final DateTime updateTime;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that was used for the trained model inference job.
  final String? configuredModelAlgorithmAssociationArn;

  /// The execution parameters for the model inference job container.
  final InferenceContainerExecutionParameters? containerExecutionParameters;

  /// The description of the trained model inference job.
  final String? description;

  /// The environment variables to set in the Docker container.
  final Map<String, String>? environment;

  /// Information about the training container image.
  final String? inferenceContainerImageDigest;

  /// The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt
  /// and decrypt customer-owned data in the ML inference job and associated data.
  final String? kmsKeyArn;

  /// The logs status for the trained model inference job.
  final LogsStatus? logsStatus;

  /// Details about the logs status for the trained model inference job.
  final String? logsStatusDetails;

  /// The metrics status for the trained model inference job.
  final MetricsStatus? metricsStatus;

  /// Details about the metrics status for the trained model inference job.
  final String? metricsStatusDetails;

  /// The account ID of the member that is responsible for paying for model
  /// inference costs.
  final String? mlModelInferencePayerAccountId;
  final StatusDetails? statusDetails;

  /// The optional metadata that you applied to the resource to help you
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
  /// Generally allowed characters are: letters, numbers, and spaces representable
  /// in UTF-8, and the following characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use aws:, AWS:, or any upper or lowercase combination of such as a
  /// prefix for keys as it is reserved for AWS use. You cannot edit or delete tag
  /// keys with this prefix. Values can have this prefix. If a tag value has aws
  /// as its prefix but the key does not, then Clean Rooms ML considers it to be a
  /// user tag and will count against the limit of 50 tags. Tags with only the key
  /// prefix of aws do not count against your tags per resource limit.
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  /// The version identifier of the trained model used for this inference job.
  /// This identifies the specific version of the trained model that was used to
  /// generate the inference results.
  final String? trainedModelVersionIdentifier;

  GetTrainedModelInferenceJobResponse({
    required this.createTime,
    required this.dataSource,
    required this.membershipIdentifier,
    required this.name,
    required this.outputConfiguration,
    required this.resourceConfig,
    required this.status,
    required this.trainedModelArn,
    required this.trainedModelInferenceJobArn,
    required this.updateTime,
    this.configuredModelAlgorithmAssociationArn,
    this.containerExecutionParameters,
    this.description,
    this.environment,
    this.inferenceContainerImageDigest,
    this.kmsKeyArn,
    this.logsStatus,
    this.logsStatusDetails,
    this.metricsStatus,
    this.metricsStatusDetails,
    this.mlModelInferencePayerAccountId,
    this.statusDetails,
    this.tags,
    this.trainedModelVersionIdentifier,
  });

  factory GetTrainedModelInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTrainedModelInferenceJobResponse(
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      dataSource: ModelInferenceDataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputConfiguration: InferenceOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resourceConfig: InferenceResourceConfig.fromJson(
          (json['resourceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: TrainedModelInferenceJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      trainedModelInferenceJobArn:
          (json['trainedModelInferenceJobArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      configuredModelAlgorithmAssociationArn:
          json['configuredModelAlgorithmAssociationArn'] as String?,
      containerExecutionParameters: json['containerExecutionParameters'] != null
          ? InferenceContainerExecutionParameters.fromJson(
              json['containerExecutionParameters'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      environment: (json['environment'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inferenceContainerImageDigest:
          json['inferenceContainerImageDigest'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      logsStatus: (json['logsStatus'] as String?)?.let(LogsStatus.fromString),
      logsStatusDetails: json['logsStatusDetails'] as String?,
      metricsStatus:
          (json['metricsStatus'] as String?)?.let(MetricsStatus.fromString),
      metricsStatusDetails: json['metricsStatusDetails'] as String?,
      mlModelInferencePayerAccountId:
          json['mlModelInferencePayerAccountId'] as String?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trainedModelVersionIdentifier:
          json['trainedModelVersionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final outputConfiguration = this.outputConfiguration;
    final resourceConfig = this.resourceConfig;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final trainedModelInferenceJobArn = this.trainedModelInferenceJobArn;
    final updateTime = this.updateTime;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final containerExecutionParameters = this.containerExecutionParameters;
    final description = this.description;
    final environment = this.environment;
    final inferenceContainerImageDigest = this.inferenceContainerImageDigest;
    final kmsKeyArn = this.kmsKeyArn;
    final logsStatus = this.logsStatus;
    final logsStatusDetails = this.logsStatusDetails;
    final metricsStatus = this.metricsStatus;
    final metricsStatusDetails = this.metricsStatusDetails;
    final mlModelInferencePayerAccountId = this.mlModelInferencePayerAccountId;
    final statusDetails = this.statusDetails;
    final tags = this.tags;
    final trainedModelVersionIdentifier = this.trainedModelVersionIdentifier;
    return {
      'createTime': iso8601ToJson(createTime),
      'dataSource': dataSource,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'outputConfiguration': outputConfiguration,
      'resourceConfig': resourceConfig,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'trainedModelInferenceJobArn': trainedModelInferenceJobArn,
      'updateTime': iso8601ToJson(updateTime),
      if (configuredModelAlgorithmAssociationArn != null)
        'configuredModelAlgorithmAssociationArn':
            configuredModelAlgorithmAssociationArn,
      if (containerExecutionParameters != null)
        'containerExecutionParameters': containerExecutionParameters,
      if (description != null) 'description': description,
      if (environment != null) 'environment': environment,
      if (inferenceContainerImageDigest != null)
        'inferenceContainerImageDigest': inferenceContainerImageDigest,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (logsStatus != null) 'logsStatus': logsStatus.value,
      if (logsStatusDetails != null) 'logsStatusDetails': logsStatusDetails,
      if (metricsStatus != null) 'metricsStatus': metricsStatus.value,
      if (metricsStatusDetails != null)
        'metricsStatusDetails': metricsStatusDetails,
      if (mlModelInferencePayerAccountId != null)
        'mlModelInferencePayerAccountId': mlModelInferencePayerAccountId,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (tags != null) 'tags': tags,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
  }
}

/// @nodoc
class ListTrainedModelInferenceJobsResponse {
  /// Returns the requested trained model inference jobs.
  final List<TrainedModelInferenceJobSummary> trainedModelInferenceJobs;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListTrainedModelInferenceJobsResponse({
    required this.trainedModelInferenceJobs,
    this.nextToken,
  });

  factory ListTrainedModelInferenceJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTrainedModelInferenceJobsResponse(
      trainedModelInferenceJobs:
          ((json['trainedModelInferenceJobs'] as List?) ?? const [])
              .nonNulls
              .map((e) => TrainedModelInferenceJobSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModelInferenceJobs = this.trainedModelInferenceJobs;
    final nextToken = this.nextToken;
    return {
      'trainedModelInferenceJobs': trainedModelInferenceJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateTrainingDatasetResponse {
  /// The Amazon Resource Name (ARN) of the training dataset resource.
  final String trainingDatasetArn;

  CreateTrainingDatasetResponse({
    required this.trainingDatasetArn,
  });

  factory CreateTrainingDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrainingDatasetResponse(
      trainingDatasetArn: (json['trainingDatasetArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final trainingDatasetArn = this.trainingDatasetArn;
    return {
      'trainingDatasetArn': trainingDatasetArn,
    };
  }
}

/// @nodoc
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
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status:
          TrainingDatasetStatus.fromString((json['status'] as String?) ?? ''),
      trainingData: ((json['trainingData'] as List?) ?? const [])
          .nonNulls
          .map((e) => Dataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainingDatasetArn: (json['trainingDatasetArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'trainingData': trainingData,
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListTrainingDatasetsResponse {
  /// The training datasets that match the request.
  final List<TrainingDatasetSummary> trainingDatasets;

  /// The token value used to access the next page of results.
  final String? nextToken;

  ListTrainingDatasetsResponse({
    required this.trainingDatasets,
    this.nextToken,
  });

  factory ListTrainingDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListTrainingDatasetsResponse(
      trainingDatasets: ((json['trainingDatasets'] as List?) ?? const [])
          .nonNulls
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

/// Provides information about the training dataset.
///
/// @nodoc
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
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status:
          TrainingDatasetStatus.fromString((json['status'] as String?) ?? ''),
      trainingDatasetArn: (json['trainingDatasetArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class TrainingDatasetStatus {
  static const active = TrainingDatasetStatus._('ACTIVE');

  final String value;

  const TrainingDatasetStatus._(this.value);

  static const values = [active];

  static TrainingDatasetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainingDatasetStatus._(value));

  @override
  bool operator ==(other) =>
      other is TrainingDatasetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines where the training dataset is located, what type of data it
/// contains, and how to access the data.
///
/// @nodoc
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
          (json['inputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      type: DatasetType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final inputConfig = this.inputConfig;
    final type = this.type;
    return {
      'inputConfig': inputConfig,
      'type': type.value,
    };
  }
}

/// @nodoc
class DatasetType {
  static const interactions = DatasetType._('INTERACTIONS');

  final String value;

  const DatasetType._(this.value);

  static const values = [interactions];

  static DatasetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DatasetType._(value));

  @override
  bool operator ==(other) => other is DatasetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the Glue data source and schema mapping information.
///
/// @nodoc
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
      dataSource: DataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      schema: ((json['schema'] as List?) ?? const [])
          .nonNulls
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

/// Defines information about the Glue data source that contains the training
/// data.
///
/// @nodoc
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
          (json['glueDataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final glueDataSource = this.glueDataSource;
    return {
      'glueDataSource': glueDataSource,
    };
  }
}

/// Defines the Glue data source that contains the training data.
///
/// @nodoc
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
      databaseName: (json['databaseName'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
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

/// Metadata for a column.
///
/// @nodoc
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
      columnName: (json['columnName'] as String?) ?? '',
      columnTypes: ((json['columnTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ColumnType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnTypes = this.columnTypes;
    return {
      'columnName': columnName,
      'columnTypes': columnTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ColumnType {
  static const userId = ColumnType._('USER_ID');
  static const itemId = ColumnType._('ITEM_ID');
  static const timestamp = ColumnType._('TIMESTAMP');
  static const categoricalFeature = ColumnType._('CATEGORICAL_FEATURE');
  static const numericalFeature = ColumnType._('NUMERICAL_FEATURE');

  final String value;

  const ColumnType._(this.value);

  static const values = [
    userId,
    itemId,
    timestamp,
    categoricalFeature,
    numericalFeature
  ];

  static ColumnType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ColumnType._(value));

  @override
  bool operator ==(other) => other is ColumnType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the trained model inference job.
///
/// @nodoc
class TrainedModelInferenceJobSummary {
  /// The collaboration ID of the collaboration that contains the trained model
  /// inference job.
  final String collaborationIdentifier;

  /// The time at which the trained model inference job was created.
  final DateTime createTime;

  /// The membership ID of the membership that contains the trained model
  /// inference job.
  final String membershipIdentifier;

  /// The name of the trained model inference job.
  final String name;

  /// The output configuration information of the trained model job.
  final InferenceOutputConfiguration outputConfiguration;

  /// The status of the trained model inference job.
  final TrainedModelInferenceJobStatus status;

  /// The Amazon Resource Name (ARN) of the trained model that is used for the
  /// trained model inference job.
  final String trainedModelArn;

  /// The Amazon Resource Name (ARN) of the trained model inference job.
  final String trainedModelInferenceJobArn;

  /// The most recent time at which the trained model inference job was updated.
  final DateTime updateTime;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that is used for the trained model inference job.
  final String? configuredModelAlgorithmAssociationArn;

  /// The description of the trained model inference job.
  final String? description;

  /// The log status of the trained model inference job.
  final LogsStatus? logsStatus;

  /// Details about the log status for the trained model inference job.
  final String? logsStatusDetails;

  /// The metric status of the trained model inference job.
  final MetricsStatus? metricsStatus;

  /// Details about the metrics status for the trained model inference job.
  final String? metricsStatusDetails;

  /// The account ID of the member that is responsible for paying for model
  /// inference costs.
  final String? mlModelInferencePayerAccountId;

  /// The version identifier of the trained model that was used for inference in
  /// this job.
  final String? trainedModelVersionIdentifier;

  TrainedModelInferenceJobSummary({
    required this.collaborationIdentifier,
    required this.createTime,
    required this.membershipIdentifier,
    required this.name,
    required this.outputConfiguration,
    required this.status,
    required this.trainedModelArn,
    required this.trainedModelInferenceJobArn,
    required this.updateTime,
    this.configuredModelAlgorithmAssociationArn,
    this.description,
    this.logsStatus,
    this.logsStatusDetails,
    this.metricsStatus,
    this.metricsStatusDetails,
    this.mlModelInferencePayerAccountId,
    this.trainedModelVersionIdentifier,
  });

  factory TrainedModelInferenceJobSummary.fromJson(Map<String, dynamic> json) {
    return TrainedModelInferenceJobSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputConfiguration: InferenceOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: TrainedModelInferenceJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      trainedModelInferenceJobArn:
          (json['trainedModelInferenceJobArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      configuredModelAlgorithmAssociationArn:
          json['configuredModelAlgorithmAssociationArn'] as String?,
      description: json['description'] as String?,
      logsStatus: (json['logsStatus'] as String?)?.let(LogsStatus.fromString),
      logsStatusDetails: json['logsStatusDetails'] as String?,
      metricsStatus:
          (json['metricsStatus'] as String?)?.let(MetricsStatus.fromString),
      metricsStatusDetails: json['metricsStatusDetails'] as String?,
      mlModelInferencePayerAccountId:
          json['mlModelInferencePayerAccountId'] as String?,
      trainedModelVersionIdentifier:
          json['trainedModelVersionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final outputConfiguration = this.outputConfiguration;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final trainedModelInferenceJobArn = this.trainedModelInferenceJobArn;
    final updateTime = this.updateTime;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final description = this.description;
    final logsStatus = this.logsStatus;
    final logsStatusDetails = this.logsStatusDetails;
    final metricsStatus = this.metricsStatus;
    final metricsStatusDetails = this.metricsStatusDetails;
    final mlModelInferencePayerAccountId = this.mlModelInferencePayerAccountId;
    final trainedModelVersionIdentifier = this.trainedModelVersionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'createTime': iso8601ToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'outputConfiguration': outputConfiguration,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'trainedModelInferenceJobArn': trainedModelInferenceJobArn,
      'updateTime': iso8601ToJson(updateTime),
      if (configuredModelAlgorithmAssociationArn != null)
        'configuredModelAlgorithmAssociationArn':
            configuredModelAlgorithmAssociationArn,
      if (description != null) 'description': description,
      if (logsStatus != null) 'logsStatus': logsStatus.value,
      if (logsStatusDetails != null) 'logsStatusDetails': logsStatusDetails,
      if (metricsStatus != null) 'metricsStatus': metricsStatus.value,
      if (metricsStatusDetails != null)
        'metricsStatusDetails': metricsStatusDetails,
      if (mlModelInferencePayerAccountId != null)
        'mlModelInferencePayerAccountId': mlModelInferencePayerAccountId,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
  }
}

/// @nodoc
class TrainedModelInferenceJobStatus {
  static const createPending =
      TrainedModelInferenceJobStatus._('CREATE_PENDING');
  static const createInProgress =
      TrainedModelInferenceJobStatus._('CREATE_IN_PROGRESS');
  static const createFailed = TrainedModelInferenceJobStatus._('CREATE_FAILED');
  static const active = TrainedModelInferenceJobStatus._('ACTIVE');
  static const cancelPending =
      TrainedModelInferenceJobStatus._('CANCEL_PENDING');
  static const cancelInProgress =
      TrainedModelInferenceJobStatus._('CANCEL_IN_PROGRESS');
  static const cancelFailed = TrainedModelInferenceJobStatus._('CANCEL_FAILED');
  static const inactive = TrainedModelInferenceJobStatus._('INACTIVE');

  final String value;

  const TrainedModelInferenceJobStatus._(this.value);

  static const values = [
    createPending,
    createInProgress,
    createFailed,
    active,
    cancelPending,
    cancelInProgress,
    cancelFailed,
    inactive
  ];

  static TrainedModelInferenceJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelInferenceJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelInferenceJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information about how the inference output is stored.
///
/// @nodoc
class InferenceOutputConfiguration {
  /// Defines the members that can receive inference output.
  final List<InferenceReceiverMember> members;

  /// The MIME type used to specify the output data.
  final String? accept;

  InferenceOutputConfiguration({
    required this.members,
    this.accept,
  });

  factory InferenceOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceOutputConfiguration(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              InferenceReceiverMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      accept: json['accept'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final accept = this.accept;
    return {
      'members': members,
      if (accept != null) 'accept': accept,
    };
  }
}

/// @nodoc
class MetricsStatus {
  static const publishSucceeded = MetricsStatus._('PUBLISH_SUCCEEDED');
  static const publishFailed = MetricsStatus._('PUBLISH_FAILED');

  final String value;

  const MetricsStatus._(this.value);

  static const values = [publishSucceeded, publishFailed];

  static MetricsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetricsStatus._(value));

  @override
  bool operator ==(other) => other is MetricsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogsStatus {
  static const publishSucceeded = LogsStatus._('PUBLISH_SUCCEEDED');
  static const publishFailed = LogsStatus._('PUBLISH_FAILED');

  final String value;

  const LogsStatus._(this.value);

  static const values = [publishSucceeded, publishFailed];

  static LogsStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogsStatus._(value));

  @override
  bool operator ==(other) => other is LogsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines who will receive inference results.
///
/// @nodoc
class InferenceReceiverMember {
  /// The account ID of the member that can receive inference results.
  final String accountId;

  InferenceReceiverMember({
    required this.accountId,
  });

  factory InferenceReceiverMember.fromJson(Map<String, dynamic> json) {
    return InferenceReceiverMember(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Defines the resources used to perform model inference.
///
/// @nodoc
class InferenceResourceConfig {
  /// The type of instance that is used to perform model inference.
  final InferenceInstanceType instanceType;

  /// The number of instances to use.
  final int? instanceCount;

  InferenceResourceConfig({
    required this.instanceType,
    this.instanceCount,
  });

  factory InferenceResourceConfig.fromJson(Map<String, dynamic> json) {
    return InferenceResourceConfig(
      instanceType: InferenceInstanceType.fromString(
          (json['instanceType'] as String?) ?? ''),
      instanceCount: json['instanceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final instanceCount = this.instanceCount;
    return {
      'instanceType': instanceType.value,
      if (instanceCount != null) 'instanceCount': instanceCount,
    };
  }
}

/// Defines information about the data source used for model inference.
///
/// @nodoc
class ModelInferenceDataSource {
  /// The Amazon Resource Name (ARN) of the ML input channel for this model
  /// inference data source.
  final String mlInputChannelArn;

  ModelInferenceDataSource({
    required this.mlInputChannelArn,
  });

  factory ModelInferenceDataSource.fromJson(Map<String, dynamic> json) {
    return ModelInferenceDataSource(
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final mlInputChannelArn = this.mlInputChannelArn;
    return {
      'mlInputChannelArn': mlInputChannelArn,
    };
  }
}

/// Provides execution parameters for the inference container.
///
/// @nodoc
class InferenceContainerExecutionParameters {
  /// The maximum size of the inference container payload, specified in MB.
  final int? maxPayloadInMB;

  InferenceContainerExecutionParameters({
    this.maxPayloadInMB,
  });

  factory InferenceContainerExecutionParameters.fromJson(
      Map<String, dynamic> json) {
    return InferenceContainerExecutionParameters(
      maxPayloadInMB: json['maxPayloadInMB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxPayloadInMB = this.maxPayloadInMB;
    return {
      if (maxPayloadInMB != null) 'maxPayloadInMB': maxPayloadInMB,
    };
  }
}

/// Details about the status of a resource.
///
/// @nodoc
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

/// @nodoc
class InferenceInstanceType {
  static const mlR7i_48xlarge = InferenceInstanceType._('ml.r7i.48xlarge');
  static const mlR6i_16xlarge = InferenceInstanceType._('ml.r6i.16xlarge');
  static const mlM6iXlarge = InferenceInstanceType._('ml.m6i.xlarge');
  static const mlM5_4xlarge = InferenceInstanceType._('ml.m5.4xlarge');
  static const mlP2Xlarge = InferenceInstanceType._('ml.p2.xlarge');
  static const mlM4_16xlarge = InferenceInstanceType._('ml.m4.16xlarge');
  static const mlR7i_16xlarge = InferenceInstanceType._('ml.r7i.16xlarge');
  static const mlM7iXlarge = InferenceInstanceType._('ml.m7i.xlarge');
  static const mlM6i_12xlarge = InferenceInstanceType._('ml.m6i.12xlarge');
  static const mlR7i_8xlarge = InferenceInstanceType._('ml.r7i.8xlarge');
  static const mlR7iLarge = InferenceInstanceType._('ml.r7i.large');
  static const mlM7i_12xlarge = InferenceInstanceType._('ml.m7i.12xlarge');
  static const mlM6i_24xlarge = InferenceInstanceType._('ml.m6i.24xlarge');
  static const mlM7i_24xlarge = InferenceInstanceType._('ml.m7i.24xlarge');
  static const mlR6i_8xlarge = InferenceInstanceType._('ml.r6i.8xlarge');
  static const mlR6iLarge = InferenceInstanceType._('ml.r6i.large');
  static const mlG5_2xlarge = InferenceInstanceType._('ml.g5.2xlarge');
  static const mlM5Large = InferenceInstanceType._('ml.m5.large');
  static const mlM7i_48xlarge = InferenceInstanceType._('ml.m7i.48xlarge');
  static const mlM6i_16xlarge = InferenceInstanceType._('ml.m6i.16xlarge');
  static const mlP2_16xlarge = InferenceInstanceType._('ml.p2.16xlarge');
  static const mlG5_4xlarge = InferenceInstanceType._('ml.g5.4xlarge');
  static const mlM7i_16xlarge = InferenceInstanceType._('ml.m7i.16xlarge');
  static const mlC4_2xlarge = InferenceInstanceType._('ml.c4.2xlarge');
  static const mlC5_2xlarge = InferenceInstanceType._('ml.c5.2xlarge');
  static const mlC6i_32xlarge = InferenceInstanceType._('ml.c6i.32xlarge');
  static const mlC4_4xlarge = InferenceInstanceType._('ml.c4.4xlarge');
  static const mlG5_8xlarge = InferenceInstanceType._('ml.g5.8xlarge');
  static const mlC6iXlarge = InferenceInstanceType._('ml.c6i.xlarge');
  static const mlC5_4xlarge = InferenceInstanceType._('ml.c5.4xlarge');
  static const mlG4dnXlarge = InferenceInstanceType._('ml.g4dn.xlarge');
  static const mlC7iXlarge = InferenceInstanceType._('ml.c7i.xlarge');
  static const mlC6i_12xlarge = InferenceInstanceType._('ml.c6i.12xlarge');
  static const mlG4dn_12xlarge = InferenceInstanceType._('ml.g4dn.12xlarge');
  static const mlC7i_12xlarge = InferenceInstanceType._('ml.c7i.12xlarge');
  static const mlC6i_24xlarge = InferenceInstanceType._('ml.c6i.24xlarge');
  static const mlG4dn_2xlarge = InferenceInstanceType._('ml.g4dn.2xlarge');
  static const mlC7i_24xlarge = InferenceInstanceType._('ml.c7i.24xlarge');
  static const mlC7i_2xlarge = InferenceInstanceType._('ml.c7i.2xlarge');
  static const mlC4_8xlarge = InferenceInstanceType._('ml.c4.8xlarge');
  static const mlC6i_2xlarge = InferenceInstanceType._('ml.c6i.2xlarge');
  static const mlG4dn_4xlarge = InferenceInstanceType._('ml.g4dn.4xlarge');
  static const mlC7i_48xlarge = InferenceInstanceType._('ml.c7i.48xlarge');
  static const mlC7i_4xlarge = InferenceInstanceType._('ml.c7i.4xlarge');
  static const mlC6i_16xlarge = InferenceInstanceType._('ml.c6i.16xlarge');
  static const mlC5_9xlarge = InferenceInstanceType._('ml.c5.9xlarge');
  static const mlG4dn_16xlarge = InferenceInstanceType._('ml.g4dn.16xlarge');
  static const mlC7i_16xlarge = InferenceInstanceType._('ml.c7i.16xlarge');
  static const mlC6i_4xlarge = InferenceInstanceType._('ml.c6i.4xlarge');
  static const mlC5Xlarge = InferenceInstanceType._('ml.c5.xlarge');
  static const mlC4Xlarge = InferenceInstanceType._('ml.c4.xlarge');
  static const mlG4dn_8xlarge = InferenceInstanceType._('ml.g4dn.8xlarge');
  static const mlC7i_8xlarge = InferenceInstanceType._('ml.c7i.8xlarge');
  static const mlC7iLarge = InferenceInstanceType._('ml.c7i.large');
  static const mlG5Xlarge = InferenceInstanceType._('ml.g5.xlarge');
  static const mlC6i_8xlarge = InferenceInstanceType._('ml.c6i.8xlarge');
  static const mlC6iLarge = InferenceInstanceType._('ml.c6i.large');
  static const mlG5_12xlarge = InferenceInstanceType._('ml.g5.12xlarge');
  static const mlG5_24xlarge = InferenceInstanceType._('ml.g5.24xlarge');
  static const mlM7i_2xlarge = InferenceInstanceType._('ml.m7i.2xlarge');
  static const mlC5_18xlarge = InferenceInstanceType._('ml.c5.18xlarge');
  static const mlG5_48xlarge = InferenceInstanceType._('ml.g5.48xlarge');
  static const mlM6i_2xlarge = InferenceInstanceType._('ml.m6i.2xlarge');
  static const mlG5_16xlarge = InferenceInstanceType._('ml.g5.16xlarge');
  static const mlM7i_4xlarge = InferenceInstanceType._('ml.m7i.4xlarge');
  static const mlR6i_32xlarge = InferenceInstanceType._('ml.r6i.32xlarge');
  static const mlM6i_4xlarge = InferenceInstanceType._('ml.m6i.4xlarge');
  static const mlM5Xlarge = InferenceInstanceType._('ml.m5.xlarge');
  static const mlM4_10xlarge = InferenceInstanceType._('ml.m4.10xlarge');
  static const mlR6iXlarge = InferenceInstanceType._('ml.r6i.xlarge');
  static const mlM5_12xlarge = InferenceInstanceType._('ml.m5.12xlarge');
  static const mlM4Xlarge = InferenceInstanceType._('ml.m4.xlarge');
  static const mlR7i_2xlarge = InferenceInstanceType._('ml.r7i.2xlarge');
  static const mlR7iXlarge = InferenceInstanceType._('ml.r7i.xlarge');
  static const mlR6i_12xlarge = InferenceInstanceType._('ml.r6i.12xlarge');
  static const mlM5_24xlarge = InferenceInstanceType._('ml.m5.24xlarge');
  static const mlR7i_12xlarge = InferenceInstanceType._('ml.r7i.12xlarge');
  static const mlM7i_8xlarge = InferenceInstanceType._('ml.m7i.8xlarge');
  static const mlM7iLarge = InferenceInstanceType._('ml.m7i.large');
  static const mlR6i_24xlarge = InferenceInstanceType._('ml.r6i.24xlarge');
  static const mlR6i_2xlarge = InferenceInstanceType._('ml.r6i.2xlarge');
  static const mlM4_2xlarge = InferenceInstanceType._('ml.m4.2xlarge');
  static const mlR7i_24xlarge = InferenceInstanceType._('ml.r7i.24xlarge');
  static const mlR7i_4xlarge = InferenceInstanceType._('ml.r7i.4xlarge');
  static const mlM6i_8xlarge = InferenceInstanceType._('ml.m6i.8xlarge');
  static const mlM6iLarge = InferenceInstanceType._('ml.m6i.large');
  static const mlM5_2xlarge = InferenceInstanceType._('ml.m5.2xlarge');
  static const mlP2_8xlarge = InferenceInstanceType._('ml.p2.8xlarge');
  static const mlR6i_4xlarge = InferenceInstanceType._('ml.r6i.4xlarge');
  static const mlM6i_32xlarge = InferenceInstanceType._('ml.m6i.32xlarge');
  static const mlM4_4xlarge = InferenceInstanceType._('ml.m4.4xlarge');
  static const mlP3_16xlarge = InferenceInstanceType._('ml.p3.16xlarge');
  static const mlP3_2xlarge = InferenceInstanceType._('ml.p3.2xlarge');
  static const mlP3_8xlarge = InferenceInstanceType._('ml.p3.8xlarge');

  final String value;

  const InferenceInstanceType._(this.value);

  static const values = [
    mlR7i_48xlarge,
    mlR6i_16xlarge,
    mlM6iXlarge,
    mlM5_4xlarge,
    mlP2Xlarge,
    mlM4_16xlarge,
    mlR7i_16xlarge,
    mlM7iXlarge,
    mlM6i_12xlarge,
    mlR7i_8xlarge,
    mlR7iLarge,
    mlM7i_12xlarge,
    mlM6i_24xlarge,
    mlM7i_24xlarge,
    mlR6i_8xlarge,
    mlR6iLarge,
    mlG5_2xlarge,
    mlM5Large,
    mlM7i_48xlarge,
    mlM6i_16xlarge,
    mlP2_16xlarge,
    mlG5_4xlarge,
    mlM7i_16xlarge,
    mlC4_2xlarge,
    mlC5_2xlarge,
    mlC6i_32xlarge,
    mlC4_4xlarge,
    mlG5_8xlarge,
    mlC6iXlarge,
    mlC5_4xlarge,
    mlG4dnXlarge,
    mlC7iXlarge,
    mlC6i_12xlarge,
    mlG4dn_12xlarge,
    mlC7i_12xlarge,
    mlC6i_24xlarge,
    mlG4dn_2xlarge,
    mlC7i_24xlarge,
    mlC7i_2xlarge,
    mlC4_8xlarge,
    mlC6i_2xlarge,
    mlG4dn_4xlarge,
    mlC7i_48xlarge,
    mlC7i_4xlarge,
    mlC6i_16xlarge,
    mlC5_9xlarge,
    mlG4dn_16xlarge,
    mlC7i_16xlarge,
    mlC6i_4xlarge,
    mlC5Xlarge,
    mlC4Xlarge,
    mlG4dn_8xlarge,
    mlC7i_8xlarge,
    mlC7iLarge,
    mlG5Xlarge,
    mlC6i_8xlarge,
    mlC6iLarge,
    mlG5_12xlarge,
    mlG5_24xlarge,
    mlM7i_2xlarge,
    mlC5_18xlarge,
    mlG5_48xlarge,
    mlM6i_2xlarge,
    mlG5_16xlarge,
    mlM7i_4xlarge,
    mlR6i_32xlarge,
    mlM6i_4xlarge,
    mlM5Xlarge,
    mlM4_10xlarge,
    mlR6iXlarge,
    mlM5_12xlarge,
    mlM4Xlarge,
    mlR7i_2xlarge,
    mlR7iXlarge,
    mlR6i_12xlarge,
    mlM5_24xlarge,
    mlR7i_12xlarge,
    mlM7i_8xlarge,
    mlM7iLarge,
    mlR6i_24xlarge,
    mlR6i_2xlarge,
    mlM4_2xlarge,
    mlR7i_24xlarge,
    mlR7i_4xlarge,
    mlM6i_8xlarge,
    mlM6iLarge,
    mlM5_2xlarge,
    mlP2_8xlarge,
    mlR6i_4xlarge,
    mlM6i_32xlarge,
    mlM4_4xlarge,
    mlP3_16xlarge,
    mlP3_2xlarge,
    mlP3_8xlarge
  ];

  static InferenceInstanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InferenceInstanceType._(value));

  @override
  bool operator ==(other) =>
      other is InferenceInstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the output of the trained model export job.
///
/// @nodoc
class TrainedModelExportOutputConfiguration {
  /// The members that will received the exported trained model output.
  final List<TrainedModelExportReceiverMember> members;

  TrainedModelExportOutputConfiguration({
    required this.members,
  });

  factory TrainedModelExportOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TrainedModelExportOutputConfiguration(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) => TrainedModelExportReceiverMember.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    return {
      'members': members,
    };
  }
}

/// Provides information about the member who will receive trained model
/// exports.
///
/// @nodoc
class TrainedModelExportReceiverMember {
  /// The account ID of the member who will receive trained model exports.
  final String accountId;

  TrainedModelExportReceiverMember({
    required this.accountId,
  });

  factory TrainedModelExportReceiverMember.fromJson(Map<String, dynamic> json) {
    return TrainedModelExportReceiverMember(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Summary information about the trained model.
///
/// @nodoc
class TrainedModelSummary {
  /// The collaboration ID of the collaboration that contains the trained model.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that was used to create this trained model.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the trained model was created.
  final DateTime createTime;

  /// The membership ID of the member that created the trained model.
  final String membershipIdentifier;

  /// The name of the trained model.
  final String name;

  /// The status of the trained model.
  final TrainedModelStatus status;

  /// The Amazon Resource Name (ARN) of the trained model.
  final String trainedModelArn;

  /// The most recent time at which the trained model was updated.
  final DateTime updateTime;

  /// The description of the trained model.
  final String? description;

  /// Information about the incremental training data channels used to create this
  /// version of the trained model.
  final List<IncrementalTrainingDataChannelOutput>?
      incrementalTrainingDataChannels;

  /// The account ID of the member that is responsible for paying for model
  /// training costs.
  final String? mlModelTrainingPayerAccountId;

  /// The version identifier of this trained model version.
  final String? versionIdentifier;

  TrainedModelSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.membershipIdentifier,
    required this.name,
    required this.status,
    required this.trainedModelArn,
    required this.updateTime,
    this.description,
    this.incrementalTrainingDataChannels,
    this.mlModelTrainingPayerAccountId,
    this.versionIdentifier,
  });

  factory TrainedModelSummary.fromJson(Map<String, dynamic> json) {
    return TrainedModelSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: TrainedModelStatus.fromString((json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      incrementalTrainingDataChannels:
          (json['incrementalTrainingDataChannels'] as List?)
              ?.nonNulls
              .map((e) => IncrementalTrainingDataChannelOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      mlModelTrainingPayerAccountId:
          json['mlModelTrainingPayerAccountId'] as String?,
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final incrementalTrainingDataChannels =
        this.incrementalTrainingDataChannels;
    final mlModelTrainingPayerAccountId = this.mlModelTrainingPayerAccountId;
    final versionIdentifier = this.versionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (incrementalTrainingDataChannels != null)
        'incrementalTrainingDataChannels': incrementalTrainingDataChannels,
      if (mlModelTrainingPayerAccountId != null)
        'mlModelTrainingPayerAccountId': mlModelTrainingPayerAccountId,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// @nodoc
class TrainedModelStatus {
  static const createPending = TrainedModelStatus._('CREATE_PENDING');
  static const createInProgress = TrainedModelStatus._('CREATE_IN_PROGRESS');
  static const createFailed = TrainedModelStatus._('CREATE_FAILED');
  static const active = TrainedModelStatus._('ACTIVE');
  static const deletePending = TrainedModelStatus._('DELETE_PENDING');
  static const deleteInProgress = TrainedModelStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = TrainedModelStatus._('DELETE_FAILED');
  static const inactive = TrainedModelStatus._('INACTIVE');
  static const cancelPending = TrainedModelStatus._('CANCEL_PENDING');
  static const cancelInProgress = TrainedModelStatus._('CANCEL_IN_PROGRESS');
  static const cancelFailed = TrainedModelStatus._('CANCEL_FAILED');

  final String value;

  const TrainedModelStatus._(this.value);

  static const values = [
    createPending,
    createInProgress,
    createFailed,
    active,
    deletePending,
    deleteInProgress,
    deleteFailed,
    inactive,
    cancelPending,
    cancelInProgress,
    cancelFailed
  ];

  static TrainedModelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelStatus._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an incremental training data channel that was
/// used to create a trained model. This structure provides details about the
/// base model and channel configuration used during incremental training.
///
/// @nodoc
class IncrementalTrainingDataChannelOutput {
  /// The name of the incremental training data channel that was used.
  final String channelName;

  /// The name of the base trained model that was used for incremental training.
  final String modelName;

  /// The version identifier of the trained model that was used for incremental
  /// training.
  final String? versionIdentifier;

  IncrementalTrainingDataChannelOutput({
    required this.channelName,
    required this.modelName,
    this.versionIdentifier,
  });

  factory IncrementalTrainingDataChannelOutput.fromJson(
      Map<String, dynamic> json) {
    return IncrementalTrainingDataChannelOutput(
      channelName: (json['channelName'] as String?) ?? '',
      modelName: (json['modelName'] as String?) ?? '',
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final modelName = this.modelName;
    final versionIdentifier = this.versionIdentifier;
    return {
      'channelName': channelName,
      'modelName': modelName,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// Information about the EC2 resources that are used to train the model.
///
/// @nodoc
class ResourceConfig {
  /// The instance type that is used to train the model.
  final InstanceType instanceType;

  /// The volume size of the instance that is used to train the model. Please see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-store-volumes.html">EC2
  /// volume limit</a> for volume size limitations on different instance types.
  final int volumeSizeInGB;

  /// The number of resources that are used to train the model.
  final int? instanceCount;

  ResourceConfig({
    required this.instanceType,
    required this.volumeSizeInGB,
    this.instanceCount,
  });

  factory ResourceConfig.fromJson(Map<String, dynamic> json) {
    return ResourceConfig(
      instanceType:
          InstanceType.fromString((json['instanceType'] as String?) ?? ''),
      volumeSizeInGB: (json['volumeSizeInGB'] as int?) ?? 0,
      instanceCount: json['instanceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final volumeSizeInGB = this.volumeSizeInGB;
    final instanceCount = this.instanceCount;
    return {
      'instanceType': instanceType.value,
      'volumeSizeInGB': volumeSizeInGB,
      if (instanceCount != null) 'instanceCount': instanceCount,
    };
  }
}

/// @nodoc
class TrainingInputMode {
  static const file = TrainingInputMode._('File');
  static const fastFile = TrainingInputMode._('FastFile');
  static const pipe = TrainingInputMode._('Pipe');

  final String value;

  const TrainingInputMode._(this.value);

  static const values = [file, fastFile, pipe];

  static TrainingInputMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainingInputMode._(value));

  @override
  bool operator ==(other) => other is TrainingInputMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The criteria used to stop model training.
///
/// @nodoc
class StoppingCondition {
  /// The maximum amount of time, in seconds, that model training can run before
  /// it is terminated.
  final int? maxRuntimeInSeconds;

  StoppingCondition({
    this.maxRuntimeInSeconds,
  });

  factory StoppingCondition.fromJson(Map<String, dynamic> json) {
    return StoppingCondition(
      maxRuntimeInSeconds: json['maxRuntimeInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRuntimeInSeconds = this.maxRuntimeInSeconds;
    return {
      if (maxRuntimeInSeconds != null)
        'maxRuntimeInSeconds': maxRuntimeInSeconds,
    };
  }
}

/// @nodoc
class InstanceType {
  static const mlM4Xlarge = InstanceType._('ml.m4.xlarge');
  static const mlM4_2xlarge = InstanceType._('ml.m4.2xlarge');
  static const mlM4_4xlarge = InstanceType._('ml.m4.4xlarge');
  static const mlM4_10xlarge = InstanceType._('ml.m4.10xlarge');
  static const mlM4_16xlarge = InstanceType._('ml.m4.16xlarge');
  static const mlG4dnXlarge = InstanceType._('ml.g4dn.xlarge');
  static const mlG4dn_2xlarge = InstanceType._('ml.g4dn.2xlarge');
  static const mlG4dn_4xlarge = InstanceType._('ml.g4dn.4xlarge');
  static const mlG4dn_8xlarge = InstanceType._('ml.g4dn.8xlarge');
  static const mlG4dn_12xlarge = InstanceType._('ml.g4dn.12xlarge');
  static const mlG4dn_16xlarge = InstanceType._('ml.g4dn.16xlarge');
  static const mlM5Large = InstanceType._('ml.m5.large');
  static const mlM5Xlarge = InstanceType._('ml.m5.xlarge');
  static const mlM5_2xlarge = InstanceType._('ml.m5.2xlarge');
  static const mlM5_4xlarge = InstanceType._('ml.m5.4xlarge');
  static const mlM5_12xlarge = InstanceType._('ml.m5.12xlarge');
  static const mlM5_24xlarge = InstanceType._('ml.m5.24xlarge');
  static const mlC4Xlarge = InstanceType._('ml.c4.xlarge');
  static const mlC4_2xlarge = InstanceType._('ml.c4.2xlarge');
  static const mlC4_4xlarge = InstanceType._('ml.c4.4xlarge');
  static const mlC4_8xlarge = InstanceType._('ml.c4.8xlarge');
  static const mlP2Xlarge = InstanceType._('ml.p2.xlarge');
  static const mlP2_8xlarge = InstanceType._('ml.p2.8xlarge');
  static const mlP2_16xlarge = InstanceType._('ml.p2.16xlarge');
  static const mlP4d_24xlarge = InstanceType._('ml.p4d.24xlarge');
  static const mlP4de_24xlarge = InstanceType._('ml.p4de.24xlarge');
  static const mlP5_48xlarge = InstanceType._('ml.p5.48xlarge');
  static const mlC5Xlarge = InstanceType._('ml.c5.xlarge');
  static const mlC5_2xlarge = InstanceType._('ml.c5.2xlarge');
  static const mlC5_4xlarge = InstanceType._('ml.c5.4xlarge');
  static const mlC5_9xlarge = InstanceType._('ml.c5.9xlarge');
  static const mlC5_18xlarge = InstanceType._('ml.c5.18xlarge');
  static const mlC5nXlarge = InstanceType._('ml.c5n.xlarge');
  static const mlC5n_2xlarge = InstanceType._('ml.c5n.2xlarge');
  static const mlC5n_4xlarge = InstanceType._('ml.c5n.4xlarge');
  static const mlC5n_9xlarge = InstanceType._('ml.c5n.9xlarge');
  static const mlC5n_18xlarge = InstanceType._('ml.c5n.18xlarge');
  static const mlG5Xlarge = InstanceType._('ml.g5.xlarge');
  static const mlG5_2xlarge = InstanceType._('ml.g5.2xlarge');
  static const mlG5_4xlarge = InstanceType._('ml.g5.4xlarge');
  static const mlG5_8xlarge = InstanceType._('ml.g5.8xlarge');
  static const mlG5_16xlarge = InstanceType._('ml.g5.16xlarge');
  static const mlG5_12xlarge = InstanceType._('ml.g5.12xlarge');
  static const mlG5_24xlarge = InstanceType._('ml.g5.24xlarge');
  static const mlG5_48xlarge = InstanceType._('ml.g5.48xlarge');
  static const mlTrn1_2xlarge = InstanceType._('ml.trn1.2xlarge');
  static const mlTrn1_32xlarge = InstanceType._('ml.trn1.32xlarge');
  static const mlTrn1n_32xlarge = InstanceType._('ml.trn1n.32xlarge');
  static const mlM6iLarge = InstanceType._('ml.m6i.large');
  static const mlM6iXlarge = InstanceType._('ml.m6i.xlarge');
  static const mlM6i_2xlarge = InstanceType._('ml.m6i.2xlarge');
  static const mlM6i_4xlarge = InstanceType._('ml.m6i.4xlarge');
  static const mlM6i_8xlarge = InstanceType._('ml.m6i.8xlarge');
  static const mlM6i_12xlarge = InstanceType._('ml.m6i.12xlarge');
  static const mlM6i_16xlarge = InstanceType._('ml.m6i.16xlarge');
  static const mlM6i_24xlarge = InstanceType._('ml.m6i.24xlarge');
  static const mlM6i_32xlarge = InstanceType._('ml.m6i.32xlarge');
  static const mlC6iXlarge = InstanceType._('ml.c6i.xlarge');
  static const mlC6i_2xlarge = InstanceType._('ml.c6i.2xlarge');
  static const mlC6i_8xlarge = InstanceType._('ml.c6i.8xlarge');
  static const mlC6i_4xlarge = InstanceType._('ml.c6i.4xlarge');
  static const mlC6i_12xlarge = InstanceType._('ml.c6i.12xlarge');
  static const mlC6i_16xlarge = InstanceType._('ml.c6i.16xlarge');
  static const mlC6i_24xlarge = InstanceType._('ml.c6i.24xlarge');
  static const mlC6i_32xlarge = InstanceType._('ml.c6i.32xlarge');
  static const mlR5dLarge = InstanceType._('ml.r5d.large');
  static const mlR5dXlarge = InstanceType._('ml.r5d.xlarge');
  static const mlR5d_2xlarge = InstanceType._('ml.r5d.2xlarge');
  static const mlR5d_4xlarge = InstanceType._('ml.r5d.4xlarge');
  static const mlR5d_8xlarge = InstanceType._('ml.r5d.8xlarge');
  static const mlR5d_12xlarge = InstanceType._('ml.r5d.12xlarge');
  static const mlR5d_16xlarge = InstanceType._('ml.r5d.16xlarge');
  static const mlR5d_24xlarge = InstanceType._('ml.r5d.24xlarge');
  static const mlT3Medium = InstanceType._('ml.t3.medium');
  static const mlT3Large = InstanceType._('ml.t3.large');
  static const mlT3Xlarge = InstanceType._('ml.t3.xlarge');
  static const mlT3_2xlarge = InstanceType._('ml.t3.2xlarge');
  static const mlR5Large = InstanceType._('ml.r5.large');
  static const mlR5Xlarge = InstanceType._('ml.r5.xlarge');
  static const mlR5_2xlarge = InstanceType._('ml.r5.2xlarge');
  static const mlR5_4xlarge = InstanceType._('ml.r5.4xlarge');
  static const mlR5_8xlarge = InstanceType._('ml.r5.8xlarge');
  static const mlR5_12xlarge = InstanceType._('ml.r5.12xlarge');
  static const mlR5_16xlarge = InstanceType._('ml.r5.16xlarge');
  static const mlR5_24xlarge = InstanceType._('ml.r5.24xlarge');
  static const mlC7iLarge = InstanceType._('ml.c7i.large');
  static const mlC7iXlarge = InstanceType._('ml.c7i.xlarge');
  static const mlC7i_2xlarge = InstanceType._('ml.c7i.2xlarge');
  static const mlC7i_4xlarge = InstanceType._('ml.c7i.4xlarge');
  static const mlC7i_8xlarge = InstanceType._('ml.c7i.8xlarge');
  static const mlC7i_12xlarge = InstanceType._('ml.c7i.12xlarge');
  static const mlC7i_16xlarge = InstanceType._('ml.c7i.16xlarge');
  static const mlC7i_24xlarge = InstanceType._('ml.c7i.24xlarge');
  static const mlC7i_48xlarge = InstanceType._('ml.c7i.48xlarge');
  static const mlM7iLarge = InstanceType._('ml.m7i.large');
  static const mlM7iXlarge = InstanceType._('ml.m7i.xlarge');
  static const mlM7i_2xlarge = InstanceType._('ml.m7i.2xlarge');
  static const mlM7i_4xlarge = InstanceType._('ml.m7i.4xlarge');
  static const mlM7i_8xlarge = InstanceType._('ml.m7i.8xlarge');
  static const mlM7i_12xlarge = InstanceType._('ml.m7i.12xlarge');
  static const mlM7i_16xlarge = InstanceType._('ml.m7i.16xlarge');
  static const mlM7i_24xlarge = InstanceType._('ml.m7i.24xlarge');
  static const mlM7i_48xlarge = InstanceType._('ml.m7i.48xlarge');
  static const mlR7iLarge = InstanceType._('ml.r7i.large');
  static const mlR7iXlarge = InstanceType._('ml.r7i.xlarge');
  static const mlR7i_2xlarge = InstanceType._('ml.r7i.2xlarge');
  static const mlR7i_4xlarge = InstanceType._('ml.r7i.4xlarge');
  static const mlR7i_8xlarge = InstanceType._('ml.r7i.8xlarge');
  static const mlR7i_12xlarge = InstanceType._('ml.r7i.12xlarge');
  static const mlR7i_16xlarge = InstanceType._('ml.r7i.16xlarge');
  static const mlR7i_24xlarge = InstanceType._('ml.r7i.24xlarge');
  static const mlR7i_48xlarge = InstanceType._('ml.r7i.48xlarge');
  static const mlG6Xlarge = InstanceType._('ml.g6.xlarge');
  static const mlG6_2xlarge = InstanceType._('ml.g6.2xlarge');
  static const mlG6_4xlarge = InstanceType._('ml.g6.4xlarge');
  static const mlG6_8xlarge = InstanceType._('ml.g6.8xlarge');
  static const mlG6_12xlarge = InstanceType._('ml.g6.12xlarge');
  static const mlG6_16xlarge = InstanceType._('ml.g6.16xlarge');
  static const mlG6_24xlarge = InstanceType._('ml.g6.24xlarge');
  static const mlG6_48xlarge = InstanceType._('ml.g6.48xlarge');
  static const mlG6eXlarge = InstanceType._('ml.g6e.xlarge');
  static const mlG6e_2xlarge = InstanceType._('ml.g6e.2xlarge');
  static const mlG6e_4xlarge = InstanceType._('ml.g6e.4xlarge');
  static const mlG6e_8xlarge = InstanceType._('ml.g6e.8xlarge');
  static const mlG6e_12xlarge = InstanceType._('ml.g6e.12xlarge');
  static const mlG6e_16xlarge = InstanceType._('ml.g6e.16xlarge');
  static const mlG6e_24xlarge = InstanceType._('ml.g6e.24xlarge');
  static const mlG6e_48xlarge = InstanceType._('ml.g6e.48xlarge');
  static const mlP5en_48xlarge = InstanceType._('ml.p5en.48xlarge');
  static const mlP3_2xlarge = InstanceType._('ml.p3.2xlarge');
  static const mlP3_8xlarge = InstanceType._('ml.p3.8xlarge');
  static const mlP3_16xlarge = InstanceType._('ml.p3.16xlarge');
  static const mlP3dn_24xlarge = InstanceType._('ml.p3dn.24xlarge');

  final String value;

  const InstanceType._(this.value);

  static const values = [
    mlM4Xlarge,
    mlM4_2xlarge,
    mlM4_4xlarge,
    mlM4_10xlarge,
    mlM4_16xlarge,
    mlG4dnXlarge,
    mlG4dn_2xlarge,
    mlG4dn_4xlarge,
    mlG4dn_8xlarge,
    mlG4dn_12xlarge,
    mlG4dn_16xlarge,
    mlM5Large,
    mlM5Xlarge,
    mlM5_2xlarge,
    mlM5_4xlarge,
    mlM5_12xlarge,
    mlM5_24xlarge,
    mlC4Xlarge,
    mlC4_2xlarge,
    mlC4_4xlarge,
    mlC4_8xlarge,
    mlP2Xlarge,
    mlP2_8xlarge,
    mlP2_16xlarge,
    mlP4d_24xlarge,
    mlP4de_24xlarge,
    mlP5_48xlarge,
    mlC5Xlarge,
    mlC5_2xlarge,
    mlC5_4xlarge,
    mlC5_9xlarge,
    mlC5_18xlarge,
    mlC5nXlarge,
    mlC5n_2xlarge,
    mlC5n_4xlarge,
    mlC5n_9xlarge,
    mlC5n_18xlarge,
    mlG5Xlarge,
    mlG5_2xlarge,
    mlG5_4xlarge,
    mlG5_8xlarge,
    mlG5_16xlarge,
    mlG5_12xlarge,
    mlG5_24xlarge,
    mlG5_48xlarge,
    mlTrn1_2xlarge,
    mlTrn1_32xlarge,
    mlTrn1n_32xlarge,
    mlM6iLarge,
    mlM6iXlarge,
    mlM6i_2xlarge,
    mlM6i_4xlarge,
    mlM6i_8xlarge,
    mlM6i_12xlarge,
    mlM6i_16xlarge,
    mlM6i_24xlarge,
    mlM6i_32xlarge,
    mlC6iXlarge,
    mlC6i_2xlarge,
    mlC6i_8xlarge,
    mlC6i_4xlarge,
    mlC6i_12xlarge,
    mlC6i_16xlarge,
    mlC6i_24xlarge,
    mlC6i_32xlarge,
    mlR5dLarge,
    mlR5dXlarge,
    mlR5d_2xlarge,
    mlR5d_4xlarge,
    mlR5d_8xlarge,
    mlR5d_12xlarge,
    mlR5d_16xlarge,
    mlR5d_24xlarge,
    mlT3Medium,
    mlT3Large,
    mlT3Xlarge,
    mlT3_2xlarge,
    mlR5Large,
    mlR5Xlarge,
    mlR5_2xlarge,
    mlR5_4xlarge,
    mlR5_8xlarge,
    mlR5_12xlarge,
    mlR5_16xlarge,
    mlR5_24xlarge,
    mlC7iLarge,
    mlC7iXlarge,
    mlC7i_2xlarge,
    mlC7i_4xlarge,
    mlC7i_8xlarge,
    mlC7i_12xlarge,
    mlC7i_16xlarge,
    mlC7i_24xlarge,
    mlC7i_48xlarge,
    mlM7iLarge,
    mlM7iXlarge,
    mlM7i_2xlarge,
    mlM7i_4xlarge,
    mlM7i_8xlarge,
    mlM7i_12xlarge,
    mlM7i_16xlarge,
    mlM7i_24xlarge,
    mlM7i_48xlarge,
    mlR7iLarge,
    mlR7iXlarge,
    mlR7i_2xlarge,
    mlR7i_4xlarge,
    mlR7i_8xlarge,
    mlR7i_12xlarge,
    mlR7i_16xlarge,
    mlR7i_24xlarge,
    mlR7i_48xlarge,
    mlG6Xlarge,
    mlG6_2xlarge,
    mlG6_4xlarge,
    mlG6_8xlarge,
    mlG6_12xlarge,
    mlG6_16xlarge,
    mlG6_24xlarge,
    mlG6_48xlarge,
    mlG6eXlarge,
    mlG6e_2xlarge,
    mlG6e_4xlarge,
    mlG6e_8xlarge,
    mlG6e_12xlarge,
    mlG6e_16xlarge,
    mlG6e_24xlarge,
    mlG6e_48xlarge,
    mlP5en_48xlarge,
    mlP3_2xlarge,
    mlP3_8xlarge,
    mlP3_16xlarge,
    mlP3dn_24xlarge
  ];

  static InstanceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InstanceType._(value));

  @override
  bool operator ==(other) => other is InstanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the model training data channel. A training data channel
/// is a named data source that the training algorithms can consume.
///
/// @nodoc
class ModelTrainingDataChannel {
  /// The name of the training data channel.
  final String channelName;

  /// The Amazon Resource Name (ARN) of the ML input channel for this model
  /// training data channel.
  final String mlInputChannelArn;

  /// Specifies how the training data stored in Amazon S3 should be distributed to
  /// training instances. This parameter controls the data distribution strategy
  /// for the training job:
  ///
  /// <ul>
  /// <li>
  /// <code>FullyReplicated</code> - The entire dataset is replicated on each
  /// training instance. This is suitable for smaller datasets and algorithms that
  /// require access to the complete dataset.
  /// </li>
  /// <li>
  /// <code>ShardedByS3Key</code> - The dataset is distributed across training
  /// instances based on Amazon S3 key names. This is suitable for larger datasets
  /// and distributed training scenarios where each instance processes a subset of
  /// the data.
  /// </li>
  /// </ul>
  final S3DataDistributionType? s3DataDistributionType;

  ModelTrainingDataChannel({
    required this.channelName,
    required this.mlInputChannelArn,
    this.s3DataDistributionType,
  });

  factory ModelTrainingDataChannel.fromJson(Map<String, dynamic> json) {
    return ModelTrainingDataChannel(
      channelName: (json['channelName'] as String?) ?? '',
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
      s3DataDistributionType: (json['s3DataDistributionType'] as String?)
          ?.let(S3DataDistributionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final mlInputChannelArn = this.mlInputChannelArn;
    final s3DataDistributionType = this.s3DataDistributionType;
    return {
      'channelName': channelName,
      'mlInputChannelArn': mlInputChannelArn,
      if (s3DataDistributionType != null)
        's3DataDistributionType': s3DataDistributionType.value,
    };
  }
}

/// @nodoc
class S3DataDistributionType {
  static const fullyReplicated = S3DataDistributionType._('FullyReplicated');
  static const shardedByS3Key = S3DataDistributionType._('ShardedByS3Key');

  final String value;

  const S3DataDistributionType._(this.value);

  static const values = [fullyReplicated, shardedByS3Key];

  static S3DataDistributionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3DataDistributionType._(value));

  @override
  bool operator ==(other) =>
      other is S3DataDistributionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines an incremental training data channel that references a previously
/// trained model. Incremental training allows you to update an existing trained
/// model with new data, building upon the knowledge from a base model rather
/// than training from scratch. This can significantly reduce training time and
/// computational costs while improving model performance with additional data.
///
/// @nodoc
class IncrementalTrainingDataChannel {
  /// The name of the incremental training data channel. This name is used to
  /// identify the channel during the training process and must be unique within
  /// the training job.
  final String channelName;

  /// The Amazon Resource Name (ARN) of the base trained model to use for
  /// incremental training. This model serves as the starting point for the
  /// incremental training process.
  final String trainedModelArn;

  /// The version identifier of the base trained model to use for incremental
  /// training. If not specified, the latest version of the trained model is used.
  final String? versionIdentifier;

  IncrementalTrainingDataChannel({
    required this.channelName,
    required this.trainedModelArn,
    this.versionIdentifier,
  });

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final trainedModelArn = this.trainedModelArn;
    final versionIdentifier = this.versionIdentifier;
    return {
      'channelName': channelName,
      'trainedModelArn': trainedModelArn,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// @nodoc
class MLInputChannelStatus {
  static const createPending = MLInputChannelStatus._('CREATE_PENDING');
  static const createInProgress = MLInputChannelStatus._('CREATE_IN_PROGRESS');
  static const createFailed = MLInputChannelStatus._('CREATE_FAILED');
  static const active = MLInputChannelStatus._('ACTIVE');
  static const deletePending = MLInputChannelStatus._('DELETE_PENDING');
  static const deleteInProgress = MLInputChannelStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = MLInputChannelStatus._('DELETE_FAILED');
  static const inactive = MLInputChannelStatus._('INACTIVE');

  final String value;

  const MLInputChannelStatus._(this.value);

  static const values = [
    createPending,
    createInProgress,
    createFailed,
    active,
    deletePending,
    deleteInProgress,
    deleteFailed,
    inactive
  ];

  static MLInputChannelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MLInputChannelStatus._(value));

  @override
  bool operator ==(other) =>
      other is MLInputChannelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The privacy budget information that controls access to Clean Rooms ML input
/// channels.
///
/// @nodoc
class PrivacyBudgets {
  /// A list of access budgets that apply to resources associated with this Clean
  /// Rooms ML input channel.
  final List<AccessBudget>? accessBudgets;

  PrivacyBudgets({
    this.accessBudgets,
  });

  factory PrivacyBudgets.fromJson(Map<String, dynamic> json) {
    return PrivacyBudgets(
      accessBudgets: (json['accessBudgets'] as List?)
          ?.nonNulls
          .map((e) => AccessBudget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessBudgets = this.accessBudgets;
    return {
      if (accessBudgets != null) 'accessBudgets': accessBudgets,
    };
  }
}

/// Configuration settings for synthetic data generation, including the
/// parameters that control data synthesis and the evaluation scores that
/// measure the quality and privacy characteristics of the generated synthetic
/// data.
///
/// @nodoc
class SyntheticDataConfiguration {
  /// The parameters that control how synthetic data is generated, including
  /// privacy settings, column classifications, and other configuration options
  /// that affect the data synthesis process.
  final MLSyntheticDataParameters syntheticDataParameters;

  /// Evaluation scores that assess the quality and privacy characteristics of the
  /// generated synthetic data, providing metrics on data utility and privacy
  /// preservation.
  final SyntheticDataEvaluationScores? syntheticDataEvaluationScores;

  SyntheticDataConfiguration({
    required this.syntheticDataParameters,
    this.syntheticDataEvaluationScores,
  });

  factory SyntheticDataConfiguration.fromJson(Map<String, dynamic> json) {
    return SyntheticDataConfiguration(
      syntheticDataParameters: MLSyntheticDataParameters.fromJson(
          (json['syntheticDataParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      syntheticDataEvaluationScores:
          json['syntheticDataEvaluationScores'] != null
              ? SyntheticDataEvaluationScores.fromJson(
                  json['syntheticDataEvaluationScores'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final syntheticDataParameters = this.syntheticDataParameters;
    final syntheticDataEvaluationScores = this.syntheticDataEvaluationScores;
    return {
      'syntheticDataParameters': syntheticDataParameters,
      if (syntheticDataEvaluationScores != null)
        'syntheticDataEvaluationScores': syntheticDataEvaluationScores,
    };
  }
}

/// Specifies which member accounts are responsible for paying for compute and
/// synthetic data generation costs in a Clean Rooms ML collaboration.
///
/// @nodoc
class PayerConfiguration {
  /// The account ID of the member that is responsible for paying compute costs.
  final String? computePayerAccountId;

  /// The account ID of the member that is responsible for paying synthetic data
  /// generation costs.
  final String? syntheticDataPayerAccountId;

  PayerConfiguration({
    this.computePayerAccountId,
    this.syntheticDataPayerAccountId,
  });

  factory PayerConfiguration.fromJson(Map<String, dynamic> json) {
    return PayerConfiguration(
      computePayerAccountId: json['computePayerAccountId'] as String?,
      syntheticDataPayerAccountId:
          json['syntheticDataPayerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computePayerAccountId = this.computePayerAccountId;
    final syntheticDataPayerAccountId = this.syntheticDataPayerAccountId;
    return {
      if (computePayerAccountId != null)
        'computePayerAccountId': computePayerAccountId,
      if (syntheticDataPayerAccountId != null)
        'syntheticDataPayerAccountId': syntheticDataPayerAccountId,
    };
  }
}

/// Parameters that control the generation of synthetic data for custom model
/// training, including privacy settings and column classification details.
///
/// @nodoc
class MLSyntheticDataParameters {
  /// The epsilon value for differential privacy, which controls the
  /// privacy-utility tradeoff in synthetic data generation. Lower values provide
  /// stronger privacy guarantees but may reduce data utility.
  final double epsilon;

  /// The maximum acceptable score for membership inference attack vulnerability.
  /// Synthetic data generation fails if the score for the resulting data exceeds
  /// this threshold.
  final double maxMembershipInferenceAttackScore;

  /// Classification details for data columns that specify how each column should
  /// be treated during synthetic data generation.
  final ColumnClassificationDetails? columnClassification;

  MLSyntheticDataParameters({
    required this.epsilon,
    required this.maxMembershipInferenceAttackScore,
    this.columnClassification,
  });

  factory MLSyntheticDataParameters.fromJson(Map<String, dynamic> json) {
    return MLSyntheticDataParameters(
      epsilon: (json['epsilon'] as double?) ?? 0,
      maxMembershipInferenceAttackScore:
          (json['maxMembershipInferenceAttackScore'] as double?) ?? 0,
      columnClassification: json['columnClassification'] != null
          ? ColumnClassificationDetails.fromJson(
              json['columnClassification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final epsilon = this.epsilon;
    final maxMembershipInferenceAttackScore =
        this.maxMembershipInferenceAttackScore;
    final columnClassification = this.columnClassification;
    return {
      'epsilon': epsilon,
      'maxMembershipInferenceAttackScore': maxMembershipInferenceAttackScore,
      if (columnClassification != null)
        'columnClassification': columnClassification,
    };
  }
}

/// Comprehensive evaluation metrics for synthetic data that assess both the
/// utility of the generated data for machine learning tasks and its privacy
/// preservation characteristics.
///
/// @nodoc
class SyntheticDataEvaluationScores {
  /// Privacy-specific evaluation scores that measure how well the synthetic data
  /// protects individual privacy, including assessments of potential privacy
  /// risks such as membership inference attacks.
  final DataPrivacyScores dataPrivacyScores;

  SyntheticDataEvaluationScores({
    required this.dataPrivacyScores,
  });

  factory SyntheticDataEvaluationScores.fromJson(Map<String, dynamic> json) {
    return SyntheticDataEvaluationScores(
      dataPrivacyScores: DataPrivacyScores.fromJson(
          (json['dataPrivacyScores'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dataPrivacyScores = this.dataPrivacyScores;
    return {
      'dataPrivacyScores': dataPrivacyScores,
    };
  }
}

/// Privacy evaluation scores that measure the privacy characteristics of the
/// generated synthetic data, including assessments of potential privacy risks
/// such as membership inference attacks.
///
/// @nodoc
class DataPrivacyScores {
  /// Scores that evaluate the vulnerability of the synthetic data to membership
  /// inference attacks, which attempt to determine whether a specific individual
  /// was a member of the original dataset.
  final List<MembershipInferenceAttackScore> membershipInferenceAttackScores;

  DataPrivacyScores({
    required this.membershipInferenceAttackScores,
  });

  factory DataPrivacyScores.fromJson(Map<String, dynamic> json) {
    return DataPrivacyScores(
      membershipInferenceAttackScores:
          ((json['membershipInferenceAttackScores'] as List?) ?? const [])
              .nonNulls
              .map((e) => MembershipInferenceAttackScore.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final membershipInferenceAttackScores =
        this.membershipInferenceAttackScores;
    return {
      'membershipInferenceAttackScores': membershipInferenceAttackScores,
    };
  }
}

/// A score that measures the vulnerability of synthetic data to membership
/// inference attacks and provides both the numerical score and the version of
/// the attack methodology used for evaluation.
///
/// @nodoc
class MembershipInferenceAttackScore {
  /// The version of the membership inference attack, which consists of the attack
  /// type and its version number, used to generate this privacy score.
  final MembershipInferenceAttackVersion attackVersion;

  /// The numerical score representing the vulnerability to membership inference
  /// attacks.
  final double score;

  MembershipInferenceAttackScore({
    required this.attackVersion,
    required this.score,
  });

  factory MembershipInferenceAttackScore.fromJson(Map<String, dynamic> json) {
    return MembershipInferenceAttackScore(
      attackVersion: MembershipInferenceAttackVersion.fromString(
          (json['attackVersion'] as String?) ?? ''),
      score: (json['score'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final attackVersion = this.attackVersion;
    final score = this.score;
    return {
      'attackVersion': attackVersion.value,
      'score': score,
    };
  }
}

/// @nodoc
class MembershipInferenceAttackVersion {
  static const distanceToClosestRecordV1 =
      MembershipInferenceAttackVersion._('DISTANCE_TO_CLOSEST_RECORD_V1');

  final String value;

  const MembershipInferenceAttackVersion._(this.value);

  static const values = [distanceToClosestRecordV1];

  static MembershipInferenceAttackVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipInferenceAttackVersion._(value));

  @override
  bool operator ==(other) =>
      other is MembershipInferenceAttackVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains classification information for data columns, including mappings
/// that specify how columns should be handled during synthetic data generation
/// and privacy analysis.
///
/// @nodoc
class ColumnClassificationDetails {
  /// A mapping that defines the classification of data columns for synthetic data
  /// generation and specifies how each column should be handled during the
  /// privacy-preserving data synthesis process.
  final List<SyntheticDataColumnProperties> columnMapping;

  ColumnClassificationDetails({
    required this.columnMapping,
  });

  factory ColumnClassificationDetails.fromJson(Map<String, dynamic> json) {
    return ColumnClassificationDetails(
      columnMapping: ((json['columnMapping'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SyntheticDataColumnProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnMapping = this.columnMapping;
    return {
      'columnMapping': columnMapping,
    };
  }
}

/// Properties that define how a specific data column should be handled during
/// synthetic data generation, including its name, type, and role in predictive
/// modeling.
///
/// @nodoc
class SyntheticDataColumnProperties {
  /// The name of the data column as it appears in the dataset.
  final String columnName;

  /// The data type of the column, which determines how the synthetic data
  /// generation algorithm processes and synthesizes values for this column.
  final SyntheticDataColumnType columnType;

  /// Indicates if this column contains predictive values that should be treated
  /// as target variables in machine learning models. This affects how the
  /// synthetic data generation preserves statistical relationships.
  final bool isPredictiveValue;

  SyntheticDataColumnProperties({
    required this.columnName,
    required this.columnType,
    required this.isPredictiveValue,
  });

  factory SyntheticDataColumnProperties.fromJson(Map<String, dynamic> json) {
    return SyntheticDataColumnProperties(
      columnName: (json['columnName'] as String?) ?? '',
      columnType: SyntheticDataColumnType.fromString(
          (json['columnType'] as String?) ?? ''),
      isPredictiveValue: (json['isPredictiveValue'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final columnType = this.columnType;
    final isPredictiveValue = this.isPredictiveValue;
    return {
      'columnName': columnName,
      'columnType': columnType.value,
      'isPredictiveValue': isPredictiveValue,
    };
  }
}

/// @nodoc
class SyntheticDataColumnType {
  static const categorical = SyntheticDataColumnType._('CATEGORICAL');
  static const numerical = SyntheticDataColumnType._('NUMERICAL');

  final String value;

  const SyntheticDataColumnType._(this.value);

  static const values = [categorical, numerical];

  static SyntheticDataColumnType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SyntheticDataColumnType._(value));

  @override
  bool operator ==(other) =>
      other is SyntheticDataColumnType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An access budget that defines consumption limits for a specific resource
/// within defined time periods.
///
/// @nodoc
class AccessBudget {
  /// The total remaining budget across all active budget periods for this
  /// resource.
  final int aggregateRemainingBudget;

  /// A list of budget details for this resource. Contains active budget periods
  /// that apply to the resource.
  final List<AccessBudgetDetails> details;

  /// The Amazon Resource Name (ARN) of the resource that this access budget
  /// applies to.
  final String resourceArn;

  AccessBudget({
    required this.aggregateRemainingBudget,
    required this.details,
    required this.resourceArn,
  });

  factory AccessBudget.fromJson(Map<String, dynamic> json) {
    return AccessBudget(
      aggregateRemainingBudget: (json['aggregateRemainingBudget'] as int?) ?? 0,
      details: ((json['details'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccessBudgetDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateRemainingBudget = this.aggregateRemainingBudget;
    final details = this.details;
    final resourceArn = this.resourceArn;
    return {
      'aggregateRemainingBudget': aggregateRemainingBudget,
      'details': details,
      'resourceArn': resourceArn,
    };
  }
}

/// The detailed information for a specific budget period, including time
/// boundaries and budget amounts.
///
/// @nodoc
class AccessBudgetDetails {
  /// The total budget amount allocated for this period.
  final int budget;

  /// The type of budget period. Calendar-based types reset automatically at
  /// regular intervals, while LIFETIME budgets never reset.
  final AccessBudgetType budgetType;

  /// The amount of budget remaining in this period.
  final int remainingBudget;

  /// The start time of this budget period.
  final DateTime startTime;

  /// Specifies whether this budget automatically refreshes when the current
  /// period ends.
  final AutoRefreshMode? autoRefresh;

  /// The end time of this budget period. If not specified, the budget period
  /// continues indefinitely.
  final DateTime? endTime;

  AccessBudgetDetails({
    required this.budget,
    required this.budgetType,
    required this.remainingBudget,
    required this.startTime,
    this.autoRefresh,
    this.endTime,
  });

  factory AccessBudgetDetails.fromJson(Map<String, dynamic> json) {
    return AccessBudgetDetails(
      budget: (json['budget'] as int?) ?? 0,
      budgetType:
          AccessBudgetType.fromString((json['budgetType'] as String?) ?? ''),
      remainingBudget: (json['remainingBudget'] as int?) ?? 0,
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      autoRefresh:
          (json['autoRefresh'] as String?)?.let(AutoRefreshMode.fromString),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    final budgetType = this.budgetType;
    final remainingBudget = this.remainingBudget;
    final startTime = this.startTime;
    final autoRefresh = this.autoRefresh;
    final endTime = this.endTime;
    return {
      'budget': budget,
      'budgetType': budgetType.value,
      'remainingBudget': remainingBudget,
      'startTime': iso8601ToJson(startTime),
      if (autoRefresh != null) 'autoRefresh': autoRefresh.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
    };
  }
}

/// @nodoc
class AccessBudgetType {
  static const calendarDay = AccessBudgetType._('CALENDAR_DAY');
  static const calendarMonth = AccessBudgetType._('CALENDAR_MONTH');
  static const calendarWeek = AccessBudgetType._('CALENDAR_WEEK');
  static const lifetime = AccessBudgetType._('LIFETIME');

  final String value;

  const AccessBudgetType._(this.value);

  static const values = [calendarDay, calendarMonth, calendarWeek, lifetime];

  static AccessBudgetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccessBudgetType._(value));

  @override
  bool operator ==(other) => other is AccessBudgetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutoRefreshMode {
  static const enabled = AutoRefreshMode._('ENABLED');
  static const disabled = AutoRefreshMode._('DISABLED');

  final String value;

  const AutoRefreshMode._(this.value);

  static const values = [enabled, disabled];

  static AutoRefreshMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoRefreshMode._(value));

  @override
  bool operator ==(other) => other is AutoRefreshMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides summary information about the ML input channel.
///
/// @nodoc
class MLInputChannelSummary {
  /// The collaboration ID of the collaboration that contains the ML input
  /// channel.
  final String collaborationIdentifier;

  /// The associated configured model algorithms used to create the ML input
  /// channel.
  final List<String> configuredModelAlgorithmAssociations;

  /// The time at which the ML input channel was created.
  final DateTime createTime;

  /// The membership ID of the membership that contains the ML input channel.
  final String membershipIdentifier;

  /// The Amazon Resource Name (ARN) of the ML input channel.
  final String mlInputChannelArn;

  /// The name of the ML input channel.
  final String name;

  /// The status of the ML input channel.
  final MLInputChannelStatus status;

  /// The most recent time at which the ML input channel was updated.
  final DateTime updateTime;

  /// The description of the ML input channel.
  final String? description;

  /// The payer configuration for the ML input channel.
  final PayerConfiguration? payerConfiguration;

  /// The ID of the protected query that was used to create the ML input channel.
  final String? protectedQueryIdentifier;

  MLInputChannelSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociations,
    required this.createTime,
    required this.membershipIdentifier,
    required this.mlInputChannelArn,
    required this.name,
    required this.status,
    required this.updateTime,
    this.description,
    this.payerConfiguration,
    this.protectedQueryIdentifier,
  });

  factory MLInputChannelSummary.fromJson(Map<String, dynamic> json) {
    return MLInputChannelSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociations:
          ((json['configuredModelAlgorithmAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          MLInputChannelStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      payerConfiguration: json['payerConfiguration'] != null
          ? PayerConfiguration.fromJson(
              json['payerConfiguration'] as Map<String, dynamic>)
          : null,
      protectedQueryIdentifier: json['protectedQueryIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociations =
        this.configuredModelAlgorithmAssociations;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final mlInputChannelArn = this.mlInputChannelArn;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    final payerConfiguration = this.payerConfiguration;
    final protectedQueryIdentifier = this.protectedQueryIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      'createTime': iso8601ToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'mlInputChannelArn': mlInputChannelArn,
      'name': name,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (payerConfiguration != null) 'payerConfiguration': payerConfiguration,
      if (protectedQueryIdentifier != null)
        'protectedQueryIdentifier': protectedQueryIdentifier,
    };
  }
}

/// Provides information about the data source that is used to create an ML
/// input channel.
///
/// @nodoc
class InputChannel {
  /// The data source that is used to create the ML input channel.
  final InputChannelDataSource dataSource;

  /// The Amazon Resource Name (ARN) of the role used to run the query specified
  /// in the <code>dataSource</code> field of the input channel.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>AccessDeniedException</code> error.
  final String roleArn;

  InputChannel({
    required this.dataSource,
    required this.roleArn,
  });

  factory InputChannel.fromJson(Map<String, dynamic> json) {
    return InputChannel(
      dataSource: InputChannelDataSource.fromJson(
          (json['dataSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
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

/// Provides the data source that is used to define an input channel.
///
/// @nodoc
class InputChannelDataSource {
  final ProtectedQueryInputParameters? protectedQueryInputParameters;

  InputChannelDataSource({
    this.protectedQueryInputParameters,
  });

  factory InputChannelDataSource.fromJson(Map<String, dynamic> json) {
    return InputChannelDataSource(
      protectedQueryInputParameters:
          json['protectedQueryInputParameters'] != null
              ? ProtectedQueryInputParameters.fromJson(
                  json['protectedQueryInputParameters'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final protectedQueryInputParameters = this.protectedQueryInputParameters;
    return {
      if (protectedQueryInputParameters != null)
        'protectedQueryInputParameters': protectedQueryInputParameters,
    };
  }
}

/// Provides information necessary to perform the protected query.
///
/// @nodoc
class ProtectedQueryInputParameters {
  final ProtectedQuerySQLParameters sqlParameters;

  /// Provides configuration information for the workers that will perform the
  /// protected query.
  final ComputeConfiguration? computeConfiguration;

  /// The format in which the query results should be returned. If not specified,
  /// defaults to <code>CSV</code>.
  final ResultFormat? resultFormat;

  ProtectedQueryInputParameters({
    required this.sqlParameters,
    this.computeConfiguration,
    this.resultFormat,
  });

  factory ProtectedQueryInputParameters.fromJson(Map<String, dynamic> json) {
    return ProtectedQueryInputParameters(
      sqlParameters: ProtectedQuerySQLParameters.fromJson(
          (json['sqlParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      computeConfiguration: json['computeConfiguration'] != null
          ? ComputeConfiguration.fromJson(
              json['computeConfiguration'] as Map<String, dynamic>)
          : null,
      resultFormat:
          (json['resultFormat'] as String?)?.let(ResultFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final sqlParameters = this.sqlParameters;
    final computeConfiguration = this.computeConfiguration;
    final resultFormat = this.resultFormat;
    return {
      'sqlParameters': sqlParameters,
      if (computeConfiguration != null)
        'computeConfiguration': computeConfiguration,
      if (resultFormat != null) 'resultFormat': resultFormat.value,
    };
  }
}

/// The parameters for the SQL type Protected Query.
///
/// @nodoc
class ProtectedQuerySQLParameters {
  /// The Amazon Resource Name (ARN) associated with the analysis template within
  /// a collaboration.
  final String? analysisTemplateArn;

  /// The protected query SQL parameters.
  final Map<String, String>? parameters;

  /// The query string to be submitted.
  final String? queryString;

  ProtectedQuerySQLParameters({
    this.analysisTemplateArn,
    this.parameters,
    this.queryString,
  });

  factory ProtectedQuerySQLParameters.fromJson(Map<String, dynamic> json) {
    return ProtectedQuerySQLParameters(
      analysisTemplateArn: json['analysisTemplateArn'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisTemplateArn = this.analysisTemplateArn;
    final parameters = this.parameters;
    final queryString = this.queryString;
    return {
      if (analysisTemplateArn != null)
        'analysisTemplateArn': analysisTemplateArn,
      if (parameters != null) 'parameters': parameters,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// Provides configuration information for the instances that will perform the
/// compute work.
///
/// @nodoc
class ComputeConfiguration {
  /// The worker instances that will perform the compute work.
  final WorkerComputeConfiguration? worker;

  ComputeConfiguration({
    this.worker,
  });

  factory ComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeConfiguration(
      worker: json['worker'] != null
          ? WorkerComputeConfiguration.fromJson(
              json['worker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final worker = this.worker;
    return {
      if (worker != null) 'worker': worker,
    };
  }
}

/// File format of the returned data.
///
/// @nodoc
class ResultFormat {
  static const csv = ResultFormat._('CSV');
  static const parquet = ResultFormat._('PARQUET');

  final String value;

  const ResultFormat._(this.value);

  static const values = [csv, parquet];

  static ResultFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResultFormat._(value));

  @override
  bool operator ==(other) => other is ResultFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information about the compute workers that perform the
/// transform job.
///
/// @nodoc
class WorkerComputeConfiguration {
  /// The number of compute workers that are used.
  final int? number;
  final WorkerComputeConfigurationProperties? properties;

  /// The instance type of the compute workers that are used.
  final WorkerComputeType? type;

  WorkerComputeConfiguration({
    this.number,
    this.properties,
    this.type,
  });

  factory WorkerComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkerComputeConfiguration(
      number: json['number'] as int?,
      properties: json['properties'] != null
          ? WorkerComputeConfigurationProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(WorkerComputeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    final properties = this.properties;
    final type = this.type;
    return {
      if (number != null) 'number': number,
      if (properties != null) 'properties': properties,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class WorkerComputeType {
  static const cr_1x = WorkerComputeType._('CR.1X');
  static const cr_4x = WorkerComputeType._('CR.4X');

  final String value;

  const WorkerComputeType._(this.value);

  static const values = [cr_1x, cr_4x];

  static WorkerComputeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkerComputeType._(value));

  @override
  bool operator ==(other) => other is WorkerComputeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration properties for the worker compute environment. These
/// properties allow you to customize the compute settings for your Clean Rooms
/// workloads.
///
/// @nodoc
class WorkerComputeConfigurationProperties {
  /// The Spark configuration properties for SQL workloads. This map contains
  /// key-value pairs that configure Apache Spark settings to optimize performance
  /// for your data processing jobs. You can specify up to 50 Spark properties,
  /// with each key being 1-200 characters and each value being 0-500 characters.
  /// These properties allow you to adjust compute capacity for large datasets and
  /// complex workloads.
  final Map<String, String>? spark;

  WorkerComputeConfigurationProperties({
    this.spark,
  });

  factory WorkerComputeConfigurationProperties.fromJson(
      Map<String, dynamic> json) {
    return WorkerComputeConfigurationProperties(
      spark: (json['spark'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final spark = this.spark;
    return {
      if (spark != null) 'spark': spark,
    };
  }
}

/// Configuration information about how the exported model artifacts are stored.
///
/// @nodoc
class MLOutputConfiguration {
  /// The Amazon Resource Name (ARN) of the service access role that is used to
  /// store the model artifacts.
  final String roleArn;

  /// The Amazon S3 location where exported model artifacts are stored.
  final Destination? destination;

  MLOutputConfiguration({
    required this.roleArn,
    this.destination,
  });

  factory MLOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return MLOutputConfiguration(
      roleArn: (json['roleArn'] as String?) ?? '',
      destination: json['destination'] != null
          ? Destination.fromJson(json['destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final destination = this.destination;
    return {
      'roleArn': roleArn,
      if (destination != null) 'destination': destination,
    };
  }
}

/// The Amazon S3 location where the exported model artifacts are stored.
///
/// @nodoc
class Destination {
  final S3ConfigMap s3Destination;

  Destination({
    required this.s3Destination,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      s3Destination: S3ConfigMap.fromJson(
          (json['s3Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      's3Destination': s3Destination,
    };
  }
}

/// Provides information about an Amazon S3 bucket and path.
///
/// @nodoc
class S3ConfigMap {
  /// The Amazon S3 location URI.
  final String s3Uri;

  S3ConfigMap({
    required this.s3Uri,
  });

  factory S3ConfigMap.fromJson(Map<String, dynamic> json) {
    return S3ConfigMap(
      s3Uri: (json['s3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

/// Information about the privacy configuration for a configured model algorithm
/// association.
///
/// @nodoc
class PrivacyConfiguration {
  /// The privacy configuration policies for a configured model algorithm
  /// association.
  final PrivacyConfigurationPolicies policies;

  PrivacyConfiguration({
    required this.policies,
  });

  factory PrivacyConfiguration.fromJson(Map<String, dynamic> json) {
    return PrivacyConfiguration(
      policies: PrivacyConfigurationPolicies.fromJson(
          (json['policies'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    return {
      'policies': policies,
    };
  }
}

/// Information about the privacy configuration policies for a configured model
/// algorithm association.
///
/// @nodoc
class PrivacyConfigurationPolicies {
  /// Specifies who will receive the trained model export.
  final TrainedModelExportsConfigurationPolicy? trainedModelExports;

  /// Specifies who will receive the trained model inference jobs.
  final TrainedModelInferenceJobsConfigurationPolicy? trainedModelInferenceJobs;

  /// Specifies who will receive the trained models.
  final TrainedModelsConfigurationPolicy? trainedModels;

  PrivacyConfigurationPolicies({
    this.trainedModelExports,
    this.trainedModelInferenceJobs,
    this.trainedModels,
  });

  factory PrivacyConfigurationPolicies.fromJson(Map<String, dynamic> json) {
    return PrivacyConfigurationPolicies(
      trainedModelExports: json['trainedModelExports'] != null
          ? TrainedModelExportsConfigurationPolicy.fromJson(
              json['trainedModelExports'] as Map<String, dynamic>)
          : null,
      trainedModelInferenceJobs: json['trainedModelInferenceJobs'] != null
          ? TrainedModelInferenceJobsConfigurationPolicy.fromJson(
              json['trainedModelInferenceJobs'] as Map<String, dynamic>)
          : null,
      trainedModels: json['trainedModels'] != null
          ? TrainedModelsConfigurationPolicy.fromJson(
              json['trainedModels'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trainedModelExports = this.trainedModelExports;
    final trainedModelInferenceJobs = this.trainedModelInferenceJobs;
    final trainedModels = this.trainedModels;
    return {
      if (trainedModelExports != null)
        'trainedModelExports': trainedModelExports,
      if (trainedModelInferenceJobs != null)
        'trainedModelInferenceJobs': trainedModelInferenceJobs,
      if (trainedModels != null) 'trainedModels': trainedModels,
    };
  }
}

/// The configuration policy for the trained models.
///
/// @nodoc
class TrainedModelsConfigurationPolicy {
  /// The container for the logs of the trained model.
  final List<LogsConfigurationPolicy>? containerLogs;

  /// The container for the metrics of the trained model.
  final MetricsConfigurationPolicy? containerMetrics;

  /// The maximum size limit for trained model artifacts as defined in the
  /// configuration policy. This setting helps enforce consistent size limits
  /// across trained models in the collaboration.
  final TrainedModelArtifactMaxSize? maxArtifactSize;

  TrainedModelsConfigurationPolicy({
    this.containerLogs,
    this.containerMetrics,
    this.maxArtifactSize,
  });

  factory TrainedModelsConfigurationPolicy.fromJson(Map<String, dynamic> json) {
    return TrainedModelsConfigurationPolicy(
      containerLogs: (json['containerLogs'] as List?)
          ?.nonNulls
          .map((e) =>
              LogsConfigurationPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      containerMetrics: json['containerMetrics'] != null
          ? MetricsConfigurationPolicy.fromJson(
              json['containerMetrics'] as Map<String, dynamic>)
          : null,
      maxArtifactSize: json['maxArtifactSize'] != null
          ? TrainedModelArtifactMaxSize.fromJson(
              json['maxArtifactSize'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerLogs = this.containerLogs;
    final containerMetrics = this.containerMetrics;
    final maxArtifactSize = this.maxArtifactSize;
    return {
      if (containerLogs != null) 'containerLogs': containerLogs,
      if (containerMetrics != null) 'containerMetrics': containerMetrics,
      if (maxArtifactSize != null) 'maxArtifactSize': maxArtifactSize,
    };
  }
}

/// Information about how the trained model exports are configured.
///
/// @nodoc
class TrainedModelExportsConfigurationPolicy {
  /// The files that are exported during the trained model export job.
  final List<TrainedModelExportFileType> filesToExport;

  /// The maximum size of the data that can be exported.
  final TrainedModelExportsMaxSize maxSize;

  TrainedModelExportsConfigurationPolicy({
    required this.filesToExport,
    required this.maxSize,
  });

  factory TrainedModelExportsConfigurationPolicy.fromJson(
      Map<String, dynamic> json) {
    return TrainedModelExportsConfigurationPolicy(
      filesToExport: ((json['filesToExport'] as List?) ?? const [])
          .nonNulls
          .map((e) => TrainedModelExportFileType.fromString((e as String)))
          .toList(),
      maxSize: TrainedModelExportsMaxSize.fromJson(
          (json['maxSize'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final filesToExport = this.filesToExport;
    final maxSize = this.maxSize;
    return {
      'filesToExport': filesToExport.map((e) => e.value).toList(),
      'maxSize': maxSize,
    };
  }
}

/// Provides configuration information for the trained model inference job.
///
/// @nodoc
class TrainedModelInferenceJobsConfigurationPolicy {
  /// The logs container for the trained model inference job.
  final List<LogsConfigurationPolicy>? containerLogs;

  /// The maximum allowed size of the output of the trained model inference job.
  final TrainedModelInferenceMaxOutputSize? maxOutputSize;

  TrainedModelInferenceJobsConfigurationPolicy({
    this.containerLogs,
    this.maxOutputSize,
  });

  factory TrainedModelInferenceJobsConfigurationPolicy.fromJson(
      Map<String, dynamic> json) {
    return TrainedModelInferenceJobsConfigurationPolicy(
      containerLogs: (json['containerLogs'] as List?)
          ?.nonNulls
          .map((e) =>
              LogsConfigurationPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxOutputSize: json['maxOutputSize'] != null
          ? TrainedModelInferenceMaxOutputSize.fromJson(
              json['maxOutputSize'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerLogs = this.containerLogs;
    final maxOutputSize = this.maxOutputSize;
    return {
      if (containerLogs != null) 'containerLogs': containerLogs,
      if (maxOutputSize != null) 'maxOutputSize': maxOutputSize,
    };
  }
}

/// Information about the maximum output size for a trained model inference job.
///
/// @nodoc
class TrainedModelInferenceMaxOutputSize {
  /// The measurement unit to use.
  final TrainedModelInferenceMaxOutputSizeUnitType unit;

  /// The maximum output size value.
  final double value;

  TrainedModelInferenceMaxOutputSize({
    required this.unit,
    required this.value,
  });

  factory TrainedModelInferenceMaxOutputSize.fromJson(
      Map<String, dynamic> json) {
    return TrainedModelInferenceMaxOutputSize(
      unit: TrainedModelInferenceMaxOutputSizeUnitType.fromString(
          (json['unit'] as String?) ?? ''),
      value: (json['value'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit.value,
      'value': value,
    };
  }
}

/// @nodoc
class TrainedModelInferenceMaxOutputSizeUnitType {
  static const gb = TrainedModelInferenceMaxOutputSizeUnitType._('GB');

  final String value;

  const TrainedModelInferenceMaxOutputSizeUnitType._(this.value);

  static const values = [gb];

  static TrainedModelInferenceMaxOutputSizeUnitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelInferenceMaxOutputSizeUnitType._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelInferenceMaxOutputSizeUnitType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the information necessary for a user to access the logs.
///
/// @nodoc
class LogsConfigurationPolicy {
  /// A list of account IDs that are allowed to access the logs.
  final List<String> allowedAccountIds;

  /// A regular expression pattern that is used to parse the logs and return
  /// information that matches the pattern.
  final String? filterPattern;

  /// Specifies the log redaction configuration for this policy.
  final LogRedactionConfiguration? logRedactionConfiguration;

  /// Specifies the type of log this policy applies to. The currently supported
  /// policies are ALL or ERROR_SUMMARY.
  final LogType? logType;

  LogsConfigurationPolicy({
    required this.allowedAccountIds,
    this.filterPattern,
    this.logRedactionConfiguration,
    this.logType,
  });

  factory LogsConfigurationPolicy.fromJson(Map<String, dynamic> json) {
    return LogsConfigurationPolicy(
      allowedAccountIds: ((json['allowedAccountIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      filterPattern: json['filterPattern'] as String?,
      logRedactionConfiguration: json['logRedactionConfiguration'] != null
          ? LogRedactionConfiguration.fromJson(
              json['logRedactionConfiguration'] as Map<String, dynamic>)
          : null,
      logType: (json['logType'] as String?)?.let(LogType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAccountIds = this.allowedAccountIds;
    final filterPattern = this.filterPattern;
    final logRedactionConfiguration = this.logRedactionConfiguration;
    final logType = this.logType;
    return {
      'allowedAccountIds': allowedAccountIds,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (logRedactionConfiguration != null)
        'logRedactionConfiguration': logRedactionConfiguration,
      if (logType != null) 'logType': logType.value,
    };
  }
}

/// @nodoc
class LogType {
  static const all = LogType._('ALL');
  static const errorSummary = LogType._('ERROR_SUMMARY');

  final String value;

  const LogType._(this.value);

  static const values = [all, errorSummary];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for log redaction.
///
/// @nodoc
class LogRedactionConfiguration {
  /// Specifies the entities to be redacted from logs. Entities to redact are
  /// "ALL_PERSONALLY_IDENTIFIABLE_INFORMATION", "NUMBERS","CUSTOM". If CUSTOM is
  /// supplied or configured, custom patterns (customDataIdentifiers) should be
  /// provided, and the patterns will be redacted in logs or error messages.
  final List<EntityType> entitiesToRedact;

  /// Specifies the configuration for custom entities in the context of log
  /// redaction.
  final CustomEntityConfig? customEntityConfig;

  LogRedactionConfiguration({
    required this.entitiesToRedact,
    this.customEntityConfig,
  });

  factory LogRedactionConfiguration.fromJson(Map<String, dynamic> json) {
    return LogRedactionConfiguration(
      entitiesToRedact: ((json['entitiesToRedact'] as List?) ?? const [])
          .nonNulls
          .map((e) => EntityType.fromString((e as String)))
          .toList(),
      customEntityConfig: json['customEntityConfig'] != null
          ? CustomEntityConfig.fromJson(
              json['customEntityConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entitiesToRedact = this.entitiesToRedact;
    final customEntityConfig = this.customEntityConfig;
    return {
      'entitiesToRedact': entitiesToRedact.map((e) => e.value).toList(),
      if (customEntityConfig != null) 'customEntityConfig': customEntityConfig,
    };
  }
}

/// The configuration for defining custom patterns to be redacted from logs and
/// error messages. This is for the CUSTOM config under entitiesToRedact. Both
/// CustomEntityConfig and entitiesToRedact need to be present or not present.
///
/// @nodoc
class CustomEntityConfig {
  /// Defines data identifiers for the custom entity configuration. Provide this
  /// only if CUSTOM redaction is configured.
  final List<String> customDataIdentifiers;

  CustomEntityConfig({
    required this.customDataIdentifiers,
  });

  factory CustomEntityConfig.fromJson(Map<String, dynamic> json) {
    return CustomEntityConfig(
      customDataIdentifiers:
          ((json['customDataIdentifiers'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customDataIdentifiers = this.customDataIdentifiers;
    return {
      'customDataIdentifiers': customDataIdentifiers,
    };
  }
}

/// @nodoc
class EntityType {
  static const allPersonallyIdentifiableInformation =
      EntityType._('ALL_PERSONALLY_IDENTIFIABLE_INFORMATION');
  static const numbers = EntityType._('NUMBERS');
  static const custom = EntityType._('CUSTOM');

  final String value;

  const EntityType._(this.value);

  static const values = [allPersonallyIdentifiableInformation, numbers, custom];

  static EntityType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EntityType._(value));

  @override
  bool operator ==(other) => other is EntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The maximum size of the trained model metrics that can be exported. If the
/// trained model metrics dataset is larger than this value, it will not be
/// exported.
///
/// @nodoc
class TrainedModelExportsMaxSize {
  /// The unit of measurement for the data size.
  final TrainedModelExportsMaxSizeUnitType unit;

  /// The maximum size of the dataset to export.
  final double value;

  TrainedModelExportsMaxSize({
    required this.unit,
    required this.value,
  });

  factory TrainedModelExportsMaxSize.fromJson(Map<String, dynamic> json) {
    return TrainedModelExportsMaxSize(
      unit: TrainedModelExportsMaxSizeUnitType.fromString(
          (json['unit'] as String?) ?? ''),
      value: (json['value'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit.value,
      'value': value,
    };
  }
}

/// @nodoc
class TrainedModelExportFileType {
  static const model = TrainedModelExportFileType._('MODEL');
  static const output = TrainedModelExportFileType._('OUTPUT');

  final String value;

  const TrainedModelExportFileType._(this.value);

  static const values = [model, output];

  static TrainedModelExportFileType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelExportFileType._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelExportFileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TrainedModelExportsMaxSizeUnitType {
  static const gb = TrainedModelExportsMaxSizeUnitType._('GB');

  final String value;

  const TrainedModelExportsMaxSizeUnitType._(this.value);

  static const values = [gb];

  static TrainedModelExportsMaxSizeUnitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelExportsMaxSizeUnitType._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelExportsMaxSizeUnitType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the configuration policy for metrics generation.
///
/// @nodoc
class MetricsConfigurationPolicy {
  /// The noise level for the generated metrics.
  final NoiseLevelType noiseLevel;

  MetricsConfigurationPolicy({
    required this.noiseLevel,
  });

  factory MetricsConfigurationPolicy.fromJson(Map<String, dynamic> json) {
    return MetricsConfigurationPolicy(
      noiseLevel:
          NoiseLevelType.fromString((json['noiseLevel'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final noiseLevel = this.noiseLevel;
    return {
      'noiseLevel': noiseLevel.value,
    };
  }
}

/// Specifies the maximum size limit for trained model artifacts. This
/// configuration helps control storage costs and ensures that trained models
/// don't exceed specified size constraints. The size limit applies to the total
/// size of all artifacts produced by the training job.
///
/// @nodoc
class TrainedModelArtifactMaxSize {
  /// The unit of measurement for the maximum artifact size. Valid values include
  /// common storage units such as bytes, kilobytes, megabytes, gigabytes, and
  /// terabytes.
  final TrainedModelArtifactMaxSizeUnitType unit;

  /// The numerical value for the maximum artifact size limit. This value is
  /// interpreted according to the specified unit.
  final double value;

  TrainedModelArtifactMaxSize({
    required this.unit,
    required this.value,
  });

  factory TrainedModelArtifactMaxSize.fromJson(Map<String, dynamic> json) {
    return TrainedModelArtifactMaxSize(
      unit: TrainedModelArtifactMaxSizeUnitType.fromString(
          (json['unit'] as String?) ?? ''),
      value: (json['value'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit.value,
      'value': value,
    };
  }
}

/// @nodoc
class TrainedModelArtifactMaxSizeUnitType {
  static const gb = TrainedModelArtifactMaxSizeUnitType._('GB');

  final String value;

  const TrainedModelArtifactMaxSizeUnitType._(this.value);

  static const values = [gb];

  static TrainedModelArtifactMaxSizeUnitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelArtifactMaxSizeUnitType._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelArtifactMaxSizeUnitType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NoiseLevelType {
  static const high = NoiseLevelType._('HIGH');
  static const medium = NoiseLevelType._('MEDIUM');
  static const low = NoiseLevelType._('LOW');
  static const none = NoiseLevelType._('NONE');

  final String value;

  const NoiseLevelType._(this.value);

  static const values = [high, medium, low, none];

  static NoiseLevelType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NoiseLevelType._(value));

  @override
  bool operator ==(other) => other is NoiseLevelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides summary information about the configured model algorithm
/// association.
///
/// @nodoc
class ConfiguredModelAlgorithmAssociationSummary {
  /// The collaboration ID of the collaboration that contains the configured model
  /// algorithm association.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm that is
  /// being associated.
  final String configuredModelAlgorithmArn;

  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the configured model algorithm association was created.
  final DateTime createTime;

  /// The membership ID of the member that created the configured model algorithm
  /// association.
  final String membershipIdentifier;

  /// The name of the configured model algorithm association.
  final String name;

  /// The most recent time at which the configured model algorithm association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm association.
  final String? description;

  ConfiguredModelAlgorithmAssociationSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmArn,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.membershipIdentifier,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory ConfiguredModelAlgorithmAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return ConfiguredModelAlgorithmAssociationSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Provides summary information about a configured model algorithm.
///
/// @nodoc
class ConfiguredModelAlgorithmSummary {
  /// The Amazon Resource Name (ARN) of the configured model algorithm.
  final String configuredModelAlgorithmArn;

  /// The time at which the configured model algorithm was created.
  final DateTime createTime;

  /// The name of the configured model algorithm.
  final String name;

  /// The most recent time at which the configured model algorithm was updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm.
  final String? description;

  ConfiguredModelAlgorithmSummary({
    required this.configuredModelAlgorithmArn,
    required this.createTime,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory ConfiguredModelAlgorithmSummary.fromJson(Map<String, dynamic> json) {
    return ConfiguredModelAlgorithmSummary(
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final createTime = this.createTime;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'createTime': iso8601ToJson(createTime),
      'name': name,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Provides configuration information for the dockerized container where the
/// model algorithm is stored.
///
/// @nodoc
class ContainerConfig {
  /// The registry path of the docker image that contains the algorithm. Clean
  /// Rooms ML currently only supports the
  /// <code>registry/repository\[:tag\]</code> image path format. For more
  /// information about using images in Clean Rooms ML, see the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_AlgorithmSpecification.html#sagemaker-Type-AlgorithmSpecification-TrainingImage">Sagemaker
  /// API reference</a>.
  final String imageUri;

  /// The arguments for a container used to run a training job. See How Amazon
  /// SageMaker Runs Your Training Image for additional information. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-training-algo-dockerfile.html">How
  /// Sagemaker runs your training image</a>.
  final List<String>? arguments;

  /// The entrypoint script for a Docker container used to run a training job.
  /// This script takes precedence over the default train processing instructions.
  /// See How Amazon SageMaker Runs Your Training Image for additional
  /// information. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-training-algo-dockerfile.html">How
  /// Sagemaker runs your training image</a>.
  final List<String>? entrypoint;

  /// A list of metric definition objects. Each object specifies the metric name
  /// and regular expressions used to parse algorithm logs. Amazon Web Services
  /// Clean Rooms ML publishes each metric to all members' Amazon CloudWatch using
  /// IAM role configured in <a>PutMLConfiguration</a>.
  final List<MetricDefinition>? metricDefinitions;

  ContainerConfig({
    required this.imageUri,
    this.arguments,
    this.entrypoint,
    this.metricDefinitions,
  });

  factory ContainerConfig.fromJson(Map<String, dynamic> json) {
    return ContainerConfig(
      imageUri: (json['imageUri'] as String?) ?? '',
      arguments: (json['arguments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      entrypoint: (json['entrypoint'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      metricDefinitions: (json['metricDefinitions'] as List?)
          ?.nonNulls
          .map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final arguments = this.arguments;
    final entrypoint = this.entrypoint;
    final metricDefinitions = this.metricDefinitions;
    return {
      'imageUri': imageUri,
      if (arguments != null) 'arguments': arguments,
      if (entrypoint != null) 'entrypoint': entrypoint,
      if (metricDefinitions != null) 'metricDefinitions': metricDefinitions,
    };
  }
}

/// Provides configuration information for the inference container.
///
/// @nodoc
class InferenceContainerConfig {
  /// The registry path of the docker image that contains the inference algorithm.
  /// Clean Rooms ML currently only supports the
  /// <code>registry/repository\[:tag\]</code> image path format. For more
  /// information about using images in Clean Rooms ML, see the <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_AlgorithmSpecification.html#sagemaker-Type-AlgorithmSpecification-TrainingImage">Sagemaker
  /// API reference</a>.
  final String imageUri;

  InferenceContainerConfig({
    required this.imageUri,
  });

  factory InferenceContainerConfig.fromJson(Map<String, dynamic> json) {
    return InferenceContainerConfig(
      imageUri: (json['imageUri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    return {
      'imageUri': imageUri,
    };
  }
}

/// Information about the model metric that is reported for a trained model.
///
/// @nodoc
class MetricDefinition {
  /// The name of the model metric.
  final String name;

  /// The regular expression statement that defines how the model metric is
  /// reported.
  final String regex;

  MetricDefinition({
    required this.name,
    required this.regex,
  });

  factory MetricDefinition.fromJson(Map<String, dynamic> json) {
    return MetricDefinition(
      name: (json['name'] as String?) ?? '',
      regex: (json['regex'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final regex = this.regex;
    return {
      'name': name,
      'regex': regex,
    };
  }
}

/// @nodoc
class PolicyExistenceCondition {
  static const policyMustExist =
      PolicyExistenceCondition._('POLICY_MUST_EXIST');
  static const policyMustNotExist =
      PolicyExistenceCondition._('POLICY_MUST_NOT_EXIST');

  final String value;

  const PolicyExistenceCondition._(this.value);

  static const values = [policyMustExist, policyMustNotExist];

  static PolicyExistenceCondition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PolicyExistenceCondition._(value));

  @override
  bool operator ==(other) =>
      other is PolicyExistenceCondition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the configured audience model.
///
/// @nodoc
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
      audienceModelArn: (json['audienceModelArn'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      outputConfig: ConfiguredAudienceModelOutputConfig.fromJson(
          (json['outputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: ConfiguredAudienceModelStatus.fromString(
          (json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// Configuration information necessary for the configure audience model output.
///
/// @nodoc
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
          (json['destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
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

/// @nodoc
class ConfiguredAudienceModelStatus {
  static const active = ConfiguredAudienceModelStatus._('ACTIVE');

  final String value;

  const ConfiguredAudienceModelStatus._(this.value);

  static const values = [active];

  static ConfiguredAudienceModelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfiguredAudienceModelStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConfiguredAudienceModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the Amazon S3 bucket where the configured audience is stored.
///
/// @nodoc
class AudienceDestination {
  /// The Amazon S3 bucket and path for the configured audience.
  final S3ConfigMap s3Destination;

  AudienceDestination({
    required this.s3Destination,
  });

  factory AudienceDestination.fromJson(Map<String, dynamic> json) {
    return AudienceDestination(
      s3Destination: S3ConfigMap.fromJson(
          (json['s3Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      's3Destination': s3Destination,
    };
  }
}

/// Returns the relevance scores at these audience sizes when used in the
/// <a>GetAudienceGenerationJob</a> for a specified audience generation job and
/// configured audience model.
///
/// Specifies the list of allowed <code>audienceSize</code> values when used in
/// the <a>StartAudienceExportJob</a> for an audience generation job. You can
/// use the <code>ABSOLUTE</code> <a>AudienceSize</a> to configure out audience
/// sizes using the count of identifiers in the output. You can use the
/// <code>Percentage</code> <a>AudienceSize</a> to configure sizes in the range
/// 1-100 percent.
///
/// @nodoc
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
      audienceSizeBins: ((json['audienceSizeBins'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
      audienceSizeType: AudienceSizeType.fromString(
          (json['audienceSizeType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final audienceSizeBins = this.audienceSizeBins;
    final audienceSizeType = this.audienceSizeType;
    return {
      'audienceSizeBins': audienceSizeBins,
      'audienceSizeType': audienceSizeType.value,
    };
  }
}

/// @nodoc
class AudienceSizeType {
  static const absolute = AudienceSizeType._('ABSOLUTE');
  static const percentage = AudienceSizeType._('PERCENTAGE');

  final String value;

  const AudienceSizeType._(this.value);

  static const values = [absolute, percentage];

  static AudienceSizeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudienceSizeType._(value));

  @override
  bool operator ==(other) => other is AudienceSizeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SharedAudienceMetrics {
  static const all = SharedAudienceMetrics._('ALL');
  static const none = SharedAudienceMetrics._('NONE');

  final String value;

  const SharedAudienceMetrics._(this.value);

  static const values = [all, none];

  static SharedAudienceMetrics fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SharedAudienceMetrics._(value));

  @override
  bool operator ==(other) =>
      other is SharedAudienceMetrics && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TagOnCreatePolicy {
  static const fromParentResource = TagOnCreatePolicy._('FROM_PARENT_RESOURCE');
  static const none = TagOnCreatePolicy._('NONE');

  final String value;

  const TagOnCreatePolicy._(this.value);

  static const values = [fromParentResource, none];

  static TagOnCreatePolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TagOnCreatePolicy._(value));

  @override
  bool operator ==(other) => other is TagOnCreatePolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the audience model.
///
/// @nodoc
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
      audienceModelArn: (json['audienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: AudienceModelStatus.fromString((json['status'] as String?) ?? ''),
      trainingDatasetArn: (json['trainingDatasetArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'trainingDatasetArn': trainingDatasetArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class AudienceModelStatus {
  static const createPending = AudienceModelStatus._('CREATE_PENDING');
  static const createInProgress = AudienceModelStatus._('CREATE_IN_PROGRESS');
  static const createFailed = AudienceModelStatus._('CREATE_FAILED');
  static const active = AudienceModelStatus._('ACTIVE');
  static const deletePending = AudienceModelStatus._('DELETE_PENDING');
  static const deleteInProgress = AudienceModelStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = AudienceModelStatus._('DELETE_FAILED');

  final String value;

  const AudienceModelStatus._(this.value);

  static const values = [
    createPending,
    createInProgress,
    createFailed,
    active,
    deletePending,
    deleteInProgress,
    deleteFailed
  ];

  static AudienceModelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudienceModelStatus._(value));

  @override
  bool operator ==(other) =>
      other is AudienceModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the configured audience generation job.
///
/// @nodoc
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
      audienceGenerationJobArn:
          (json['audienceGenerationJobArn'] as String?) ?? '',
      configuredAudienceModelArn:
          (json['configuredAudienceModelArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: AudienceGenerationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (collaborationId != null) 'collaborationId': collaborationId,
      if (description != null) 'description': description,
      if (startedBy != null) 'startedBy': startedBy,
    };
  }
}

/// @nodoc
class AudienceGenerationJobStatus {
  static const createPending = AudienceGenerationJobStatus._('CREATE_PENDING');
  static const createInProgress =
      AudienceGenerationJobStatus._('CREATE_IN_PROGRESS');
  static const createFailed = AudienceGenerationJobStatus._('CREATE_FAILED');
  static const active = AudienceGenerationJobStatus._('ACTIVE');
  static const deletePending = AudienceGenerationJobStatus._('DELETE_PENDING');
  static const deleteInProgress =
      AudienceGenerationJobStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = AudienceGenerationJobStatus._('DELETE_FAILED');

  final String value;

  const AudienceGenerationJobStatus._(this.value);

  static const values = [
    createPending,
    createInProgress,
    createFailed,
    active,
    deletePending,
    deleteInProgress,
    deleteFailed
  ];

  static AudienceGenerationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudienceGenerationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is AudienceGenerationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the Amazon S3 bucket where the seed audience for the generating
/// audience is stored.
///
/// @nodoc
class AudienceGenerationJobDataSource {
  /// The ARN of the IAM role that can read the Amazon S3 bucket where the seed
  /// audience is stored.
  final String roleArn;

  /// Defines the Amazon S3 bucket where the seed audience for the generating
  /// audience is stored. A valid data source is a JSON line file in the following
  /// format:
  ///
  /// <code>{"user_id": "111111"}</code>
  ///
  /// <code>{"user_id": "222222"}</code>
  ///
  /// <code>...</code>
  final S3ConfigMap? dataSource;
  final ComputeConfiguration? sqlComputeConfiguration;

  /// The protected SQL query parameters.
  final ProtectedQuerySQLParameters? sqlParameters;

  AudienceGenerationJobDataSource({
    required this.roleArn,
    this.dataSource,
    this.sqlComputeConfiguration,
    this.sqlParameters,
  });

  factory AudienceGenerationJobDataSource.fromJson(Map<String, dynamic> json) {
    return AudienceGenerationJobDataSource(
      roleArn: (json['roleArn'] as String?) ?? '',
      dataSource: json['dataSource'] != null
          ? S3ConfigMap.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
      sqlComputeConfiguration: json['sqlComputeConfiguration'] != null
          ? ComputeConfiguration.fromJson(
              json['sqlComputeConfiguration'] as Map<String, dynamic>)
          : null,
      sqlParameters: json['sqlParameters'] != null
          ? ProtectedQuerySQLParameters.fromJson(
              json['sqlParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final dataSource = this.dataSource;
    final sqlComputeConfiguration = this.sqlComputeConfiguration;
    final sqlParameters = this.sqlParameters;
    return {
      'roleArn': roleArn,
      if (dataSource != null) 'dataSource': dataSource,
      if (sqlComputeConfiguration != null)
        'sqlComputeConfiguration': sqlComputeConfiguration,
      if (sqlParameters != null) 'sqlParameters': sqlParameters,
    };
  }
}

/// Metrics that describe the quality of the generated audience.
///
/// @nodoc
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
      relevanceMetrics: ((json['relevanceMetrics'] as List?) ?? const [])
          .nonNulls
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

/// The relevance score of a generated audience.
///
/// @nodoc
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
      audienceSize: AudienceSize.fromJson(
          (json['audienceSize'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// The size of the generated audience. Must match one of the sizes in the
/// configured audience model.
///
/// @nodoc
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
      type: AudienceSizeType.fromString((json['type'] as String?) ?? ''),
      value: (json['value'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.value,
      'value': value,
    };
  }
}

/// Provides information about the audience export job.
///
/// @nodoc
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
      audienceGenerationJobArn:
          (json['audienceGenerationJobArn'] as String?) ?? '',
      audienceSize: AudienceSize.fromJson(
          (json['audienceSize'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status:
          AudienceExportJobStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// @nodoc
class AudienceExportJobStatus {
  static const createPending = AudienceExportJobStatus._('CREATE_PENDING');
  static const createInProgress =
      AudienceExportJobStatus._('CREATE_IN_PROGRESS');
  static const createFailed = AudienceExportJobStatus._('CREATE_FAILED');
  static const active = AudienceExportJobStatus._('ACTIVE');

  final String value;

  const AudienceExportJobStatus._(this.value);

  static const values = [createPending, createInProgress, createFailed, active];

  static AudienceExportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudienceExportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is AudienceExportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides summary information about a trained model in a collaboration.
///
/// @nodoc
class CollaborationTrainedModelSummary {
  /// The collaboration ID of the collaboration that contains the trained model.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that is used for this trained model.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the trained model was created.
  final DateTime createTime;

  /// The account ID of the member that created the trained model.
  final String creatorAccountId;

  /// The membership ID of the member that created the trained model.
  final String membershipIdentifier;

  /// The name of the trained model.
  final String name;

  /// The status of the trained model.
  final TrainedModelStatus status;

  /// The Amazon Resource Name (ARN) of the trained model.
  final String trainedModelArn;

  /// The most recent time at which the trained model was updated.
  final DateTime updateTime;

  /// The description of the trained model.
  final String? description;

  /// Information about the incremental training data channels used to create this
  /// version of the trained model.
  final List<IncrementalTrainingDataChannelOutput>?
      incrementalTrainingDataChannels;

  /// The account ID of the member that is responsible for paying for model
  /// training costs.
  final String? mlModelTrainingPayerAccountId;

  /// The version identifier of this trained model version.
  final String? versionIdentifier;

  CollaborationTrainedModelSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.status,
    required this.trainedModelArn,
    required this.updateTime,
    this.description,
    this.incrementalTrainingDataChannels,
    this.mlModelTrainingPayerAccountId,
    this.versionIdentifier,
  });

  factory CollaborationTrainedModelSummary.fromJson(Map<String, dynamic> json) {
    return CollaborationTrainedModelSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: TrainedModelStatus.fromString((json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      incrementalTrainingDataChannels:
          (json['incrementalTrainingDataChannels'] as List?)
              ?.nonNulls
              .map((e) => IncrementalTrainingDataChannelOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      mlModelTrainingPayerAccountId:
          json['mlModelTrainingPayerAccountId'] as String?,
      versionIdentifier: json['versionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final incrementalTrainingDataChannels =
        this.incrementalTrainingDataChannels;
    final mlModelTrainingPayerAccountId = this.mlModelTrainingPayerAccountId;
    final versionIdentifier = this.versionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (incrementalTrainingDataChannels != null)
        'incrementalTrainingDataChannels': incrementalTrainingDataChannels,
      if (mlModelTrainingPayerAccountId != null)
        'mlModelTrainingPayerAccountId': mlModelTrainingPayerAccountId,
      if (versionIdentifier != null) 'versionIdentifier': versionIdentifier,
    };
  }
}

/// Provides summary information about a trained model inference job in a
/// collaboration.
///
/// @nodoc
class CollaborationTrainedModelInferenceJobSummary {
  /// The collaboration ID of the collaboration that contains the trained model
  /// inference job.
  final String collaborationIdentifier;

  /// The time at which the trained model inference job was created.
  final DateTime createTime;

  /// The account ID that created the trained model inference job.
  final String creatorAccountId;

  /// The membership ID of the membership that contains the trained model
  /// inference job.
  final String membershipIdentifier;

  /// The name of the trained model inference job.
  final String name;

  /// Returns output configuration information for the trained model inference
  /// job.
  final InferenceOutputConfiguration outputConfiguration;

  /// The status of the trained model inference job.
  final TrainedModelInferenceJobStatus status;

  /// The Amazon Resource Name (ARN) of the trained model that is used for the
  /// trained model inference job.
  final String trainedModelArn;

  /// The Amazon Resource Name (ARN) of the trained model inference job.
  final String trainedModelInferenceJobArn;

  /// The most recent time at which the trained model inference job was updated.
  final DateTime updateTime;

  /// The Amazon Resource Name (ARN) of the configured model algorithm association
  /// that is used for the trained model inference job.
  final String? configuredModelAlgorithmAssociationArn;

  /// The description of the trained model inference job.
  final String? description;

  /// The trained model inference job logs status.
  final LogsStatus? logsStatus;

  /// Details about the logs status for the trained model inference job.
  final String? logsStatusDetails;

  /// the trained model inference job metrics status.
  final MetricsStatus? metricsStatus;

  /// Details about the metrics status for trained model inference job.
  final String? metricsStatusDetails;

  /// The account ID of the member that is responsible for paying for model
  /// inference costs.
  final String? mlModelInferencePayerAccountId;

  /// The version identifier of the trained model that was used for inference in
  /// this job.
  final String? trainedModelVersionIdentifier;

  CollaborationTrainedModelInferenceJobSummary({
    required this.collaborationIdentifier,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.outputConfiguration,
    required this.status,
    required this.trainedModelArn,
    required this.trainedModelInferenceJobArn,
    required this.updateTime,
    this.configuredModelAlgorithmAssociationArn,
    this.description,
    this.logsStatus,
    this.logsStatusDetails,
    this.metricsStatus,
    this.metricsStatusDetails,
    this.mlModelInferencePayerAccountId,
    this.trainedModelVersionIdentifier,
  });

  factory CollaborationTrainedModelInferenceJobSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationTrainedModelInferenceJobSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputConfiguration: InferenceOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: TrainedModelInferenceJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      trainedModelInferenceJobArn:
          (json['trainedModelInferenceJobArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      configuredModelAlgorithmAssociationArn:
          json['configuredModelAlgorithmAssociationArn'] as String?,
      description: json['description'] as String?,
      logsStatus: (json['logsStatus'] as String?)?.let(LogsStatus.fromString),
      logsStatusDetails: json['logsStatusDetails'] as String?,
      metricsStatus:
          (json['metricsStatus'] as String?)?.let(MetricsStatus.fromString),
      metricsStatusDetails: json['metricsStatusDetails'] as String?,
      mlModelInferencePayerAccountId:
          json['mlModelInferencePayerAccountId'] as String?,
      trainedModelVersionIdentifier:
          json['trainedModelVersionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final outputConfiguration = this.outputConfiguration;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final trainedModelInferenceJobArn = this.trainedModelInferenceJobArn;
    final updateTime = this.updateTime;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final description = this.description;
    final logsStatus = this.logsStatus;
    final logsStatusDetails = this.logsStatusDetails;
    final metricsStatus = this.metricsStatus;
    final metricsStatusDetails = this.metricsStatusDetails;
    final mlModelInferencePayerAccountId = this.mlModelInferencePayerAccountId;
    final trainedModelVersionIdentifier = this.trainedModelVersionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'outputConfiguration': outputConfiguration,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'trainedModelInferenceJobArn': trainedModelInferenceJobArn,
      'updateTime': iso8601ToJson(updateTime),
      if (configuredModelAlgorithmAssociationArn != null)
        'configuredModelAlgorithmAssociationArn':
            configuredModelAlgorithmAssociationArn,
      if (description != null) 'description': description,
      if (logsStatus != null) 'logsStatus': logsStatus.value,
      if (logsStatusDetails != null) 'logsStatusDetails': logsStatusDetails,
      if (metricsStatus != null) 'metricsStatus': metricsStatus.value,
      if (metricsStatusDetails != null)
        'metricsStatusDetails': metricsStatusDetails,
      if (mlModelInferencePayerAccountId != null)
        'mlModelInferencePayerAccountId': mlModelInferencePayerAccountId,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
  }
}

/// Provides summary information about a trained model export job in a
/// collaboration.
///
/// @nodoc
class CollaborationTrainedModelExportJobSummary {
  /// The collaboration ID of the collaboration that contains the trained model
  /// export job.
  final String collaborationIdentifier;

  /// The time at which the trained model export job was created.
  final DateTime createTime;

  /// The account ID of the member that created the trained model.
  final String creatorAccountId;

  /// The membership ID of the member that created the trained model export job.
  final String membershipIdentifier;

  /// The name of the trained model export job.
  final String name;
  final TrainedModelExportOutputConfiguration outputConfiguration;

  /// The status of the trained model.
  final TrainedModelExportJobStatus status;

  /// The Amazon Resource Name (ARN) of the trained model that is being exported.
  final String trainedModelArn;

  /// The most recent time at which the trained model export job was updated.
  final DateTime updateTime;

  /// The description of the trained model.
  final String? description;
  final StatusDetails? statusDetails;

  /// The version identifier of the trained model that was exported in this job.
  final String? trainedModelVersionIdentifier;

  CollaborationTrainedModelExportJobSummary({
    required this.collaborationIdentifier,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.outputConfiguration,
    required this.status,
    required this.trainedModelArn,
    required this.updateTime,
    this.description,
    this.statusDetails,
    this.trainedModelVersionIdentifier,
  });

  factory CollaborationTrainedModelExportJobSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationTrainedModelExportJobSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputConfiguration: TrainedModelExportOutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: TrainedModelExportJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      trainedModelArn: (json['trainedModelArn'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      trainedModelVersionIdentifier:
          json['trainedModelVersionIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final outputConfiguration = this.outputConfiguration;
    final status = this.status;
    final trainedModelArn = this.trainedModelArn;
    final updateTime = this.updateTime;
    final description = this.description;
    final statusDetails = this.statusDetails;
    final trainedModelVersionIdentifier = this.trainedModelVersionIdentifier;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'outputConfiguration': outputConfiguration,
      'status': status.value,
      'trainedModelArn': trainedModelArn,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (trainedModelVersionIdentifier != null)
        'trainedModelVersionIdentifier': trainedModelVersionIdentifier,
    };
  }
}

/// @nodoc
class TrainedModelExportJobStatus {
  static const createPending = TrainedModelExportJobStatus._('CREATE_PENDING');
  static const createInProgress =
      TrainedModelExportJobStatus._('CREATE_IN_PROGRESS');
  static const createFailed = TrainedModelExportJobStatus._('CREATE_FAILED');
  static const active = TrainedModelExportJobStatus._('ACTIVE');

  final String value;

  const TrainedModelExportJobStatus._(this.value);

  static const values = [createPending, createInProgress, createFailed, active];

  static TrainedModelExportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainedModelExportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TrainedModelExportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides summary information about an ML input channel in a collaboration.
///
/// @nodoc
class CollaborationMLInputChannelSummary {
  /// The collaboration ID of the collaboration that contains the ML input
  /// channel.
  final String collaborationIdentifier;

  /// The associated configured model algorithms used to create the ML input
  /// channel.
  final List<String> configuredModelAlgorithmAssociations;

  /// The time at which the ML input channel was created.
  final DateTime createTime;

  /// The account ID of the member who created the ML input channel.
  final String creatorAccountId;

  /// The membership ID of the membership that contains the ML input channel.
  final String membershipIdentifier;

  /// The Amazon Resource Name (ARN) of the ML input channel.
  final String mlInputChannelArn;

  /// The name of the ML input channel.
  final String name;

  /// The status of the ML input channel.
  final MLInputChannelStatus status;

  /// The most recent time at which the ML input channel was updated.
  final DateTime updateTime;

  /// The description of the ML input channel.
  final String? description;

  /// The payer configuration for the ML input channel.
  final PayerConfiguration? payerConfiguration;

  CollaborationMLInputChannelSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmAssociations,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.mlInputChannelArn,
    required this.name,
    required this.status,
    required this.updateTime,
    this.description,
    this.payerConfiguration,
  });

  factory CollaborationMLInputChannelSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationMLInputChannelSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmAssociations:
          ((json['configuredModelAlgorithmAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      mlInputChannelArn: (json['mlInputChannelArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status:
          MLInputChannelStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      payerConfiguration: json['payerConfiguration'] != null
          ? PayerConfiguration.fromJson(
              json['payerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmAssociations =
        this.configuredModelAlgorithmAssociations;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final mlInputChannelArn = this.mlInputChannelArn;
    final name = this.name;
    final status = this.status;
    final updateTime = this.updateTime;
    final description = this.description;
    final payerConfiguration = this.payerConfiguration;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmAssociations':
          configuredModelAlgorithmAssociations,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'mlInputChannelArn': mlInputChannelArn,
      'name': name,
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (payerConfiguration != null) 'payerConfiguration': payerConfiguration,
    };
  }
}

/// Provides summary information about a configured model algorithm in a
/// collaboration.
///
/// @nodoc
class CollaborationConfiguredModelAlgorithmAssociationSummary {
  /// The collaboration ID of the collaboration that contains the configured model
  /// algorithm association.
  final String collaborationIdentifier;

  /// The Amazon Resource Name (ARN) of the configured model algorithm that is
  /// associated to the collaboration.
  final String configuredModelAlgorithmArn;

  /// The Amazon Resource Name (ARN) of the configured model algorithm
  /// association.
  final String configuredModelAlgorithmAssociationArn;

  /// The time at which the configured model algorithm association was created.
  final DateTime createTime;

  /// The account ID of the member that created the configured model algorithm
  /// association.
  final String creatorAccountId;

  /// The membership ID of the member that created the configured model algorithm
  /// association.
  final String membershipIdentifier;

  /// The name of the configured model algorithm association.
  final String name;

  /// The most recent time at which the configured model algorithm association was
  /// updated.
  final DateTime updateTime;

  /// The description of the configured model algorithm association.
  final String? description;

  CollaborationConfiguredModelAlgorithmAssociationSummary({
    required this.collaborationIdentifier,
    required this.configuredModelAlgorithmArn,
    required this.configuredModelAlgorithmAssociationArn,
    required this.createTime,
    required this.creatorAccountId,
    required this.membershipIdentifier,
    required this.name,
    required this.updateTime,
    this.description,
  });

  factory CollaborationConfiguredModelAlgorithmAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return CollaborationConfiguredModelAlgorithmAssociationSummary(
      collaborationIdentifier:
          (json['collaborationIdentifier'] as String?) ?? '',
      configuredModelAlgorithmArn:
          (json['configuredModelAlgorithmArn'] as String?) ?? '',
      configuredModelAlgorithmAssociationArn:
          (json['configuredModelAlgorithmAssociationArn'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['createTime'] ?? 0),
      creatorAccountId: (json['creatorAccountId'] as String?) ?? '',
      membershipIdentifier: (json['membershipIdentifier'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collaborationIdentifier = this.collaborationIdentifier;
    final configuredModelAlgorithmArn = this.configuredModelAlgorithmArn;
    final configuredModelAlgorithmAssociationArn =
        this.configuredModelAlgorithmAssociationArn;
    final createTime = this.createTime;
    final creatorAccountId = this.creatorAccountId;
    final membershipIdentifier = this.membershipIdentifier;
    final name = this.name;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'collaborationIdentifier': collaborationIdentifier,
      'configuredModelAlgorithmArn': configuredModelAlgorithmArn,
      'configuredModelAlgorithmAssociationArn':
          configuredModelAlgorithmAssociationArn,
      'createTime': iso8601ToJson(createTime),
      'creatorAccountId': creatorAccountId,
      'membershipIdentifier': membershipIdentifier,
      'name': name,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
