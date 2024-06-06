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

/// Fault Injection Service is a managed service that enables you to perform
/// fault injection experiments on your Amazon Web Services workloads. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/fis/latest/userguide/">Fault Injection
/// Service User Guide</a>.
class Fis {
  final _s.RestJsonProtocol _protocol;
  Fis({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'fis',
            signingName: 'fis',
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

  /// Creates an experiment template.
  ///
  /// An experiment template includes the following components:
  ///
  /// <ul>
  /// <li>
  /// <b>Targets</b>: A target can be a specific resource in your Amazon Web
  /// Services environment, or one or more resources that match criteria that
  /// you specify, for example, resources that have specific tags.
  /// </li>
  /// <li>
  /// <b>Actions</b>: The actions to carry out on the target. You can specify
  /// multiple actions, the duration of each action, and when to start each
  /// action during an experiment.
  /// </li>
  /// <li>
  /// <b>Stop conditions</b>: If a stop condition is triggered while an
  /// experiment is running, the experiment is automatically stopped. You can
  /// define a stop condition as a CloudWatch alarm.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fis/latest/userguide/experiment-templates.html">experiment
  /// templates</a> in the <i>Fault Injection Service User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [actions] :
  /// The actions for the experiment.
  ///
  /// Parameter [description] :
  /// A description for the experiment template.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that grants the FIS service
  /// permission to perform service actions on your behalf.
  ///
  /// Parameter [stopConditions] :
  /// The stop conditions.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [experimentOptions] :
  /// The experiment options for the experiment template.
  ///
  /// Parameter [logConfiguration] :
  /// The configuration for experiment logging.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the experiment template.
  ///
  /// Parameter [targets] :
  /// The targets for the experiment.
  Future<CreateExperimentTemplateResponse> createExperimentTemplate({
    required Map<String, CreateExperimentTemplateActionInput> actions,
    required String description,
    required String roleArn,
    required List<CreateExperimentTemplateStopConditionInput> stopConditions,
    String? clientToken,
    CreateExperimentTemplateExperimentOptionsInput? experimentOptions,
    CreateExperimentTemplateLogConfigurationInput? logConfiguration,
    Map<String, String>? tags,
    Map<String, CreateExperimentTemplateTargetInput>? targets,
  }) async {
    final $payload = <String, dynamic>{
      'actions': actions,
      'description': description,
      'roleArn': roleArn,
      'stopConditions': stopConditions,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/experimentTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateExperimentTemplateResponse.fromJson(response);
  }

  /// Creates a target account configuration for the experiment template. A
  /// target account configuration is required when
  /// <code>accountTargeting</code> of <code>experimentOptions</code> is set to
  /// <code>multi-account</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fis/latest/userguide/experiment-options.html">experiment
  /// options</a> in the <i>Fault Injection Service User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the target account.
  ///
  /// Parameter [experimentTemplateId] :
  /// The experiment template ID.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the target account.
  Future<CreateTargetAccountConfigurationResponse>
      createTargetAccountConfiguration({
    required String accountId,
    required String experimentTemplateId,
    required String roleArn,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/experimentTemplates/${Uri.encodeComponent(experimentTemplateId)}/targetAccountConfigurations/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTargetAccountConfigurationResponse.fromJson(response);
  }

  /// Deletes the specified experiment template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the experiment template.
  Future<DeleteExperimentTemplateResponse> deleteExperimentTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/experimentTemplates/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteExperimentTemplateResponse.fromJson(response);
  }

  /// Deletes the specified target account configuration of the experiment
  /// template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the target account.
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  Future<DeleteTargetAccountConfigurationResponse>
      deleteTargetAccountConfiguration({
    required String accountId,
    required String experimentTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/experimentTemplates/${Uri.encodeComponent(experimentTemplateId)}/targetAccountConfigurations/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTargetAccountConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified FIS action.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the action.
  Future<GetActionResponse> getAction({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/actions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetActionResponse.fromJson(response);
  }

  /// Gets information about the specified experiment.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the experiment.
  Future<GetExperimentResponse> getExperiment({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/experiments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExperimentResponse.fromJson(response);
  }

  /// Gets information about the specified target account configuration of the
  /// experiment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the target account.
  ///
  /// Parameter [experimentId] :
  /// The ID of the experiment.
  Future<GetExperimentTargetAccountConfigurationResponse>
      getExperimentTargetAccountConfiguration({
    required String accountId,
    required String experimentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/experiments/${Uri.encodeComponent(experimentId)}/targetAccountConfigurations/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExperimentTargetAccountConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified experiment template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the experiment template.
  Future<GetExperimentTemplateResponse> getExperimentTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/experimentTemplates/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExperimentTemplateResponse.fromJson(response);
  }

  /// Gets information about the specified target account configuration of the
  /// experiment template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the target account.
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  Future<GetTargetAccountConfigurationResponse> getTargetAccountConfiguration({
    required String accountId,
    required String experimentTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/experimentTemplates/${Uri.encodeComponent(experimentTemplateId)}/targetAccountConfigurations/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTargetAccountConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified resource type.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  Future<GetTargetResourceTypeResponse> getTargetResourceType({
    required String resourceType,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/targetResourceTypes/${Uri.encodeComponent(resourceType)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTargetResourceTypeResponse.fromJson(response);
  }

  /// Lists the available FIS actions.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListActionsResponse> listActions({
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
      requestUri: '/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListActionsResponse.fromJson(response);
  }

  /// Lists the resolved targets information of the specified experiment.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [experimentId] :
  /// The ID of the experiment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [targetName] :
  /// The name of the target.
  Future<ListExperimentResolvedTargetsResponse> listExperimentResolvedTargets({
    required String experimentId,
    int? maxResults,
    String? nextToken,
    String? targetName,
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
      if (targetName != null) 'targetName': [targetName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/experiments/${Uri.encodeComponent(experimentId)}/resolvedTargets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExperimentResolvedTargetsResponse.fromJson(response);
  }

  /// Lists the target account configurations of the specified experiment.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [experimentId] :
  /// The ID of the experiment.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListExperimentTargetAccountConfigurationsResponse>
      listExperimentTargetAccountConfigurations({
    required String experimentId,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/experiments/${Uri.encodeComponent(experimentId)}/targetAccountConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExperimentTargetAccountConfigurationsResponse.fromJson(response);
  }

  /// Lists your experiment templates.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListExperimentTemplatesResponse> listExperimentTemplates({
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
      requestUri: '/experimentTemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExperimentTemplatesResponse.fromJson(response);
  }

  /// Lists your experiments.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListExperimentsResponse> listExperiments({
    String? experimentTemplateId,
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
      if (experimentTemplateId != null)
        'experimentTemplateId': [experimentTemplateId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/experiments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExperimentsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Lists the target account configurations of the specified experiment
  /// template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListTargetAccountConfigurationsResponse>
      listTargetAccountConfigurations({
    required String experimentTemplateId,
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
          '/experimentTemplates/${Uri.encodeComponent(experimentTemplateId)}/targetAccountConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetAccountConfigurationsResponse.fromJson(response);
  }

  /// Lists the target resource types.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListTargetResourceTypesResponse> listTargetResourceTypes({
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
      requestUri: '/targetResourceTypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetResourceTypesResponse.fromJson(response);
  }

  /// Starts running an experiment from the specified experiment template.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [experimentOptions] :
  /// The experiment options for running the experiment.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the experiment.
  Future<StartExperimentResponse> startExperiment({
    required String experimentTemplateId,
    String? clientToken,
    StartExperimentExperimentOptionsInput? experimentOptions,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'experimentTemplateId': experimentTemplateId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/experiments',
      exceptionFnMap: _exceptionFns,
    );
    return StartExperimentResponse.fromJson(response);
  }

  /// Stops the specified experiment.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the experiment.
  Future<StopExperimentResponse> stopExperiment({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/experiments/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopExperimentResponse.fromJson(response);
  }

  /// Applies the specified tags to the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags for the resource.
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

  /// Removes the specified tags from the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove.
  Future<void> untagResource({
    required String resourceArn,
    List<String>? tagKeys,
  }) async {
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
  }

  /// Updates the specified experiment template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [id] :
  /// The ID of the experiment template.
  ///
  /// Parameter [actions] :
  /// The actions for the experiment.
  ///
  /// Parameter [description] :
  /// A description for the template.
  ///
  /// Parameter [experimentOptions] :
  /// The experiment options for the experiment template.
  ///
  /// Parameter [logConfiguration] :
  /// The configuration for experiment logging.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that grants the FIS service
  /// permission to perform service actions on your behalf.
  ///
  /// Parameter [stopConditions] :
  /// The stop conditions for the experiment.
  ///
  /// Parameter [targets] :
  /// The targets for the experiment.
  Future<UpdateExperimentTemplateResponse> updateExperimentTemplate({
    required String id,
    Map<String, UpdateExperimentTemplateActionInputItem>? actions,
    String? description,
    UpdateExperimentTemplateExperimentOptionsInput? experimentOptions,
    UpdateExperimentTemplateLogConfigurationInput? logConfiguration,
    String? roleArn,
    List<UpdateExperimentTemplateStopConditionInput>? stopConditions,
    Map<String, UpdateExperimentTemplateTargetInput>? targets,
  }) async {
    final $payload = <String, dynamic>{
      if (actions != null) 'actions': actions,
      if (description != null) 'description': description,
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (stopConditions != null) 'stopConditions': stopConditions,
      if (targets != null) 'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/experimentTemplates/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateExperimentTemplateResponse.fromJson(response);
  }

  /// Updates the target account configuration for the specified experiment
  /// template.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the target account.
  ///
  /// Parameter [experimentTemplateId] :
  /// The ID of the experiment template.
  ///
  /// Parameter [description] :
  /// The description of the target account.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  Future<UpdateTargetAccountConfigurationResponse>
      updateTargetAccountConfiguration({
    required String accountId,
    required String experimentTemplateId,
    String? description,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/experimentTemplates/${Uri.encodeComponent(experimentTemplateId)}/targetAccountConfigurations/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTargetAccountConfigurationResponse.fromJson(response);
  }
}

enum AccountTargeting {
  singleAccount,
  multiAccount,
}

extension AccountTargetingValueExtension on AccountTargeting {
  String toValue() {
    switch (this) {
      case AccountTargeting.singleAccount:
        return 'single-account';
      case AccountTargeting.multiAccount:
        return 'multi-account';
    }
  }
}

extension AccountTargetingFromString on String {
  AccountTargeting toAccountTargeting() {
    switch (this) {
      case 'single-account':
        return AccountTargeting.singleAccount;
      case 'multi-account':
        return AccountTargeting.multiAccount;
    }
    throw Exception('$this is not known in enum AccountTargeting');
  }
}

/// Describes an action. For more information, see <a
/// href="https://docs.aws.amazon.com/fis/latest/userguide/fis-actions-reference.html">FIS
/// actions</a> in the <i>Fault Injection Service User Guide</i>.
class Action {
  /// The Amazon Resource Name (ARN) of the action.
  final String? arn;

  /// The description for the action.
  final String? description;

  /// The ID of the action.
  final String? id;

  /// The action parameters, if applicable.
  final Map<String, ActionParameter>? parameters;

  /// The tags for the action.
  final Map<String, String>? tags;

  /// The supported targets for the action.
  final Map<String, ActionTarget>? targets;

  Action({
    this.arn,
    this.description,
    this.id,
    this.parameters,
    this.tags,
    this.targets,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ActionParameter.fromJson(e as Map<String, dynamic>))),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets: (json['targets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ActionTarget.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final parameters = this.parameters;
    final tags = this.tags;
    final targets = this.targets;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (parameters != null) 'parameters': parameters,
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes a parameter for an action.
class ActionParameter {
  /// The parameter description.
  final String? description;

  /// Indicates whether the parameter is required.
  final bool? required;

  ActionParameter({
    this.description,
    this.required,
  });

  factory ActionParameter.fromJson(Map<String, dynamic> json) {
    return ActionParameter(
      description: json['description'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final required = this.required;
    return {
      if (description != null) 'description': description,
      if (required != null) 'required': required,
    };
  }
}

/// Provides a summary of an action.
class ActionSummary {
  /// The Amazon Resource Name (ARN) of the action.
  final String? arn;

  /// The description for the action.
  final String? description;

  /// The ID of the action.
  final String? id;

  /// The tags for the action.
  final Map<String, String>? tags;

  /// The targets for the action.
  final Map<String, ActionTarget>? targets;

  ActionSummary({
    this.arn,
    this.description,
    this.id,
    this.tags,
    this.targets,
  });

  factory ActionSummary.fromJson(Map<String, dynamic> json) {
    return ActionSummary(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets: (json['targets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ActionTarget.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final tags = this.tags;
    final targets = this.targets;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes a target for an action.
class ActionTarget {
  /// The resource type of the target.
  final String? resourceType;

  ActionTarget({
    this.resourceType,
  });

  factory ActionTarget.fromJson(Map<String, dynamic> json) {
    return ActionTarget(
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    return {
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

enum ActionsMode {
  skipAll,
  runAll,
}

extension ActionsModeValueExtension on ActionsMode {
  String toValue() {
    switch (this) {
      case ActionsMode.skipAll:
        return 'skip-all';
      case ActionsMode.runAll:
        return 'run-all';
    }
  }
}

extension ActionsModeFromString on String {
  ActionsMode toActionsMode() {
    switch (this) {
      case 'skip-all':
        return ActionsMode.skipAll;
      case 'run-all':
        return ActionsMode.runAll;
    }
    throw Exception('$this is not known in enum ActionsMode');
  }
}

/// Specifies an action for an experiment template.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/fis/latest/userguide/actions.html">Actions</a>
/// in the <i>Fault Injection Service User Guide</i>.
class CreateExperimentTemplateActionInput {
  /// The ID of the action. The format of the action ID is:
  /// aws:<i>service-name</i>:<i>action-type</i>.
  final String actionId;

  /// A description for the action.
  final String? description;

  /// The parameters for the action, if applicable.
  final Map<String, String>? parameters;

  /// The name of the action that must be completed before the current action
  /// starts. Omit this parameter to run the action at the start of the
  /// experiment.
  final List<String>? startAfter;

  /// The targets for the action.
  final Map<String, String>? targets;

  CreateExperimentTemplateActionInput({
    required this.actionId,
    this.description,
    this.parameters,
    this.startAfter,
    this.targets,
  });

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final description = this.description;
    final parameters = this.parameters;
    final startAfter = this.startAfter;
    final targets = this.targets;
    return {
      'actionId': actionId,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
      if (startAfter != null) 'startAfter': startAfter,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Specifies experiment options for an experiment template.
class CreateExperimentTemplateExperimentOptionsInput {
  /// Specifies the account targeting setting for experiment options.
  final AccountTargeting? accountTargeting;

  /// Specifies the empty target resolution mode for experiment options.
  final EmptyTargetResolutionMode? emptyTargetResolutionMode;

  CreateExperimentTemplateExperimentOptionsInput({
    this.accountTargeting,
    this.emptyTargetResolutionMode,
  });

  Map<String, dynamic> toJson() {
    final accountTargeting = this.accountTargeting;
    final emptyTargetResolutionMode = this.emptyTargetResolutionMode;
    return {
      if (accountTargeting != null)
        'accountTargeting': accountTargeting.toValue(),
      if (emptyTargetResolutionMode != null)
        'emptyTargetResolutionMode': emptyTargetResolutionMode.toValue(),
    };
  }
}

/// Specifies the configuration for experiment logging.
class CreateExperimentTemplateLogConfigurationInput {
  /// The schema version.
  final int logSchemaVersion;

  /// The configuration for experiment logging to Amazon CloudWatch Logs.
  final ExperimentTemplateCloudWatchLogsLogConfigurationInput?
      cloudWatchLogsConfiguration;

  /// The configuration for experiment logging to Amazon S3.
  final ExperimentTemplateS3LogConfigurationInput? s3Configuration;

  CreateExperimentTemplateLogConfigurationInput({
    required this.logSchemaVersion,
    this.cloudWatchLogsConfiguration,
    this.s3Configuration,
  });

  Map<String, dynamic> toJson() {
    final logSchemaVersion = this.logSchemaVersion;
    final cloudWatchLogsConfiguration = this.cloudWatchLogsConfiguration;
    final s3Configuration = this.s3Configuration;
    return {
      'logSchemaVersion': logSchemaVersion,
      if (cloudWatchLogsConfiguration != null)
        'cloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

class CreateExperimentTemplateResponse {
  /// Information about the experiment template.
  final ExperimentTemplate? experimentTemplate;

  CreateExperimentTemplateResponse({
    this.experimentTemplate,
  });

  factory CreateExperimentTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateExperimentTemplateResponse(
      experimentTemplate: json['experimentTemplate'] != null
          ? ExperimentTemplate.fromJson(
              json['experimentTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experimentTemplate = this.experimentTemplate;
    return {
      if (experimentTemplate != null) 'experimentTemplate': experimentTemplate,
    };
  }
}

/// Specifies a stop condition for an experiment template.
class CreateExperimentTemplateStopConditionInput {
  /// The source for the stop condition. Specify <code>aws:cloudwatch:alarm</code>
  /// if the stop condition is defined by a CloudWatch alarm. Specify
  /// <code>none</code> if there is no stop condition.
  final String source;

  /// The Amazon Resource Name (ARN) of the CloudWatch alarm. This is required if
  /// the source is a CloudWatch alarm.
  final String? value;

  CreateExperimentTemplateStopConditionInput({
    required this.source,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    final value = this.value;
    return {
      'source': source,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies a target for an experiment. You must specify at least one Amazon
/// Resource Name (ARN) or at least one resource tag. You cannot specify both
/// ARNs and tags.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/fis/latest/userguide/targets.html">Targets</a>
/// in the <i>Fault Injection Service User Guide</i>.
class CreateExperimentTemplateTargetInput {
  /// The resource type. The resource type must be supported for the specified
  /// action.
  final String resourceType;

  /// Scopes the identified resources to a specific count of the resources at
  /// random, or a percentage of the resources. All identified resources are
  /// included in the target.
  ///
  /// <ul>
  /// <li>
  /// ALL - Run the action on all identified targets. This is the default.
  /// </li>
  /// <li>
  /// COUNT(n) - Run the action on the specified number of targets, chosen from
  /// the identified targets at random. For example, COUNT(1) selects one of the
  /// targets.
  /// </li>
  /// <li>
  /// PERCENT(n) - Run the action on the specified percentage of targets, chosen
  /// from the identified targets at random. For example, PERCENT(25) selects 25%
  /// of the targets.
  /// </li>
  /// </ul>
  final String selectionMode;

  /// The filters to apply to identify target resources using specific attributes.
  final List<ExperimentTemplateTargetInputFilter>? filters;

  /// The resource type parameters.
  final Map<String, String>? parameters;

  /// The Amazon Resource Names (ARNs) of the resources.
  final List<String>? resourceArns;

  /// The tags for the target resources.
  final Map<String, String>? resourceTags;

  CreateExperimentTemplateTargetInput({
    required this.resourceType,
    required this.selectionMode,
    this.filters,
    this.parameters,
    this.resourceArns,
    this.resourceTags,
  });

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final selectionMode = this.selectionMode;
    final filters = this.filters;
    final parameters = this.parameters;
    final resourceArns = this.resourceArns;
    final resourceTags = this.resourceTags;
    return {
      'resourceType': resourceType,
      'selectionMode': selectionMode,
      if (filters != null) 'filters': filters,
      if (parameters != null) 'parameters': parameters,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
  }
}

class CreateTargetAccountConfigurationResponse {
  /// Information about the target account configuration.
  final TargetAccountConfiguration? targetAccountConfiguration;

  CreateTargetAccountConfigurationResponse({
    this.targetAccountConfiguration,
  });

  factory CreateTargetAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTargetAccountConfigurationResponse(
      targetAccountConfiguration: json['targetAccountConfiguration'] != null
          ? TargetAccountConfiguration.fromJson(
              json['targetAccountConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccountConfiguration = this.targetAccountConfiguration;
    return {
      if (targetAccountConfiguration != null)
        'targetAccountConfiguration': targetAccountConfiguration,
    };
  }
}

class DeleteExperimentTemplateResponse {
  /// Information about the experiment template.
  final ExperimentTemplate? experimentTemplate;

  DeleteExperimentTemplateResponse({
    this.experimentTemplate,
  });

  factory DeleteExperimentTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DeleteExperimentTemplateResponse(
      experimentTemplate: json['experimentTemplate'] != null
          ? ExperimentTemplate.fromJson(
              json['experimentTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experimentTemplate = this.experimentTemplate;
    return {
      if (experimentTemplate != null) 'experimentTemplate': experimentTemplate,
    };
  }
}

class DeleteTargetAccountConfigurationResponse {
  /// Information about the target account configuration.
  final TargetAccountConfiguration? targetAccountConfiguration;

  DeleteTargetAccountConfigurationResponse({
    this.targetAccountConfiguration,
  });

  factory DeleteTargetAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteTargetAccountConfigurationResponse(
      targetAccountConfiguration: json['targetAccountConfiguration'] != null
          ? TargetAccountConfiguration.fromJson(
              json['targetAccountConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccountConfiguration = this.targetAccountConfiguration;
    return {
      if (targetAccountConfiguration != null)
        'targetAccountConfiguration': targetAccountConfiguration,
    };
  }
}

enum EmptyTargetResolutionMode {
  fail,
  skip,
}

extension EmptyTargetResolutionModeValueExtension on EmptyTargetResolutionMode {
  String toValue() {
    switch (this) {
      case EmptyTargetResolutionMode.fail:
        return 'fail';
      case EmptyTargetResolutionMode.skip:
        return 'skip';
    }
  }
}

extension EmptyTargetResolutionModeFromString on String {
  EmptyTargetResolutionMode toEmptyTargetResolutionMode() {
    switch (this) {
      case 'fail':
        return EmptyTargetResolutionMode.fail;
      case 'skip':
        return EmptyTargetResolutionMode.skip;
    }
    throw Exception('$this is not known in enum EmptyTargetResolutionMode');
  }
}

/// Describes an experiment.
class Experiment {
  /// The actions for the experiment.
  final Map<String, ExperimentAction>? actions;

  /// The Amazon Resource Name (ARN) of the experiment.
  final String? arn;

  /// The time that the experiment was created.
  final DateTime? creationTime;

  /// The time that the experiment ended.
  final DateTime? endTime;

  /// The experiment options for the experiment.
  final ExperimentOptions? experimentOptions;

  /// The ID of the experiment template.
  final String? experimentTemplateId;

  /// The ID of the experiment.
  final String? id;

  /// The configuration for experiment logging.
  final ExperimentLogConfiguration? logConfiguration;

  /// The Amazon Resource Name (ARN) of an IAM role that grants the FIS service
  /// permission to perform service actions on your behalf.
  final String? roleArn;

  /// The time that the experiment started.
  final DateTime? startTime;

  /// The state of the experiment.
  final ExperimentState? state;

  /// The stop conditions for the experiment.
  final List<ExperimentStopCondition>? stopConditions;

  /// The tags for the experiment.
  final Map<String, String>? tags;

  /// The count of target account configurations for the experiment.
  final int? targetAccountConfigurationsCount;

  /// The targets for the experiment.
  final Map<String, ExperimentTarget>? targets;

  Experiment({
    this.actions,
    this.arn,
    this.creationTime,
    this.endTime,
    this.experimentOptions,
    this.experimentTemplateId,
    this.id,
    this.logConfiguration,
    this.roleArn,
    this.startTime,
    this.state,
    this.stopConditions,
    this.tags,
    this.targetAccountConfigurationsCount,
    this.targets,
  });

  factory Experiment.fromJson(Map<String, dynamic> json) {
    return Experiment(
      actions: (json['actions'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ExperimentAction.fromJson(e as Map<String, dynamic>))),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      endTime: timeStampFromJson(json['endTime']),
      experimentOptions: json['experimentOptions'] != null
          ? ExperimentOptions.fromJson(
              json['experimentOptions'] as Map<String, dynamic>)
          : null,
      experimentTemplateId: json['experimentTemplateId'] as String?,
      id: json['id'] as String?,
      logConfiguration: json['logConfiguration'] != null
          ? ExperimentLogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      state: json['state'] != null
          ? ExperimentState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      stopConditions: (json['stopConditions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExperimentStopCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetAccountConfigurationsCount:
          json['targetAccountConfigurationsCount'] as int?,
      targets: (json['targets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ExperimentTarget.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final endTime = this.endTime;
    final experimentOptions = this.experimentOptions;
    final experimentTemplateId = this.experimentTemplateId;
    final id = this.id;
    final logConfiguration = this.logConfiguration;
    final roleArn = this.roleArn;
    final startTime = this.startTime;
    final state = this.state;
    final stopConditions = this.stopConditions;
    final tags = this.tags;
    final targetAccountConfigurationsCount =
        this.targetAccountConfigurationsCount;
    final targets = this.targets;
    return {
      if (actions != null) 'actions': actions,
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (experimentTemplateId != null)
        'experimentTemplateId': experimentTemplateId,
      if (id != null) 'id': id,
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (state != null) 'state': state,
      if (stopConditions != null) 'stopConditions': stopConditions,
      if (tags != null) 'tags': tags,
      if (targetAccountConfigurationsCount != null)
        'targetAccountConfigurationsCount': targetAccountConfigurationsCount,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes the action for an experiment.
class ExperimentAction {
  /// The ID of the action.
  final String? actionId;

  /// The description for the action.
  final String? description;

  /// The time that the action ended.
  final DateTime? endTime;

  /// The parameters for the action.
  final Map<String, String>? parameters;

  /// The name of the action that must be completed before this action starts.
  final List<String>? startAfter;

  /// The time that the action started.
  final DateTime? startTime;

  /// The state of the action.
  final ExperimentActionState? state;

  /// The targets for the action.
  final Map<String, String>? targets;

  ExperimentAction({
    this.actionId,
    this.description,
    this.endTime,
    this.parameters,
    this.startAfter,
    this.startTime,
    this.state,
    this.targets,
  });

  factory ExperimentAction.fromJson(Map<String, dynamic> json) {
    return ExperimentAction(
      actionId: json['actionId'] as String?,
      description: json['description'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      startAfter: (json['startAfter'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTime: timeStampFromJson(json['startTime']),
      state: json['state'] != null
          ? ExperimentActionState.fromJson(
              json['state'] as Map<String, dynamic>)
          : null,
      targets: (json['targets'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final description = this.description;
    final endTime = this.endTime;
    final parameters = this.parameters;
    final startAfter = this.startAfter;
    final startTime = this.startTime;
    final state = this.state;
    final targets = this.targets;
    return {
      if (actionId != null) 'actionId': actionId,
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (parameters != null) 'parameters': parameters,
      if (startAfter != null) 'startAfter': startAfter,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (state != null) 'state': state,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes the state of an action.
class ExperimentActionState {
  /// The reason for the state.
  final String? reason;

  /// The state of the action.
  final ExperimentActionStatus? status;

  ExperimentActionState({
    this.reason,
    this.status,
  });

  factory ExperimentActionState.fromJson(Map<String, dynamic> json) {
    return ExperimentActionState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toExperimentActionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ExperimentActionStatus {
  pending,
  initiating,
  running,
  completed,
  cancelled,
  stopping,
  stopped,
  failed,
  skipped,
}

extension ExperimentActionStatusValueExtension on ExperimentActionStatus {
  String toValue() {
    switch (this) {
      case ExperimentActionStatus.pending:
        return 'pending';
      case ExperimentActionStatus.initiating:
        return 'initiating';
      case ExperimentActionStatus.running:
        return 'running';
      case ExperimentActionStatus.completed:
        return 'completed';
      case ExperimentActionStatus.cancelled:
        return 'cancelled';
      case ExperimentActionStatus.stopping:
        return 'stopping';
      case ExperimentActionStatus.stopped:
        return 'stopped';
      case ExperimentActionStatus.failed:
        return 'failed';
      case ExperimentActionStatus.skipped:
        return 'skipped';
    }
  }
}

extension ExperimentActionStatusFromString on String {
  ExperimentActionStatus toExperimentActionStatus() {
    switch (this) {
      case 'pending':
        return ExperimentActionStatus.pending;
      case 'initiating':
        return ExperimentActionStatus.initiating;
      case 'running':
        return ExperimentActionStatus.running;
      case 'completed':
        return ExperimentActionStatus.completed;
      case 'cancelled':
        return ExperimentActionStatus.cancelled;
      case 'stopping':
        return ExperimentActionStatus.stopping;
      case 'stopped':
        return ExperimentActionStatus.stopped;
      case 'failed':
        return ExperimentActionStatus.failed;
      case 'skipped':
        return ExperimentActionStatus.skipped;
    }
    throw Exception('$this is not known in enum ExperimentActionStatus');
  }
}

/// Describes the configuration for experiment logging to Amazon CloudWatch
/// Logs.
class ExperimentCloudWatchLogsLogConfiguration {
  /// The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log
  /// group.
  final String? logGroupArn;

  ExperimentCloudWatchLogsLogConfiguration({
    this.logGroupArn,
  });

  factory ExperimentCloudWatchLogsLogConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExperimentCloudWatchLogsLogConfiguration(
      logGroupArn: json['logGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
    };
  }
}

/// Describes the configuration for experiment logging.
class ExperimentLogConfiguration {
  /// The configuration for experiment logging to Amazon CloudWatch Logs.
  final ExperimentCloudWatchLogsLogConfiguration? cloudWatchLogsConfiguration;

  /// The schema version.
  final int? logSchemaVersion;

  /// The configuration for experiment logging to Amazon S3.
  final ExperimentS3LogConfiguration? s3Configuration;

  ExperimentLogConfiguration({
    this.cloudWatchLogsConfiguration,
    this.logSchemaVersion,
    this.s3Configuration,
  });

  factory ExperimentLogConfiguration.fromJson(Map<String, dynamic> json) {
    return ExperimentLogConfiguration(
      cloudWatchLogsConfiguration: json['cloudWatchLogsConfiguration'] != null
          ? ExperimentCloudWatchLogsLogConfiguration.fromJson(
              json['cloudWatchLogsConfiguration'] as Map<String, dynamic>)
          : null,
      logSchemaVersion: json['logSchemaVersion'] as int?,
      s3Configuration: json['s3Configuration'] != null
          ? ExperimentS3LogConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsConfiguration = this.cloudWatchLogsConfiguration;
    final logSchemaVersion = this.logSchemaVersion;
    final s3Configuration = this.s3Configuration;
    return {
      if (cloudWatchLogsConfiguration != null)
        'cloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
      if (logSchemaVersion != null) 'logSchemaVersion': logSchemaVersion,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

/// Describes the options for an experiment.
class ExperimentOptions {
  /// The account targeting setting for an experiment.
  final AccountTargeting? accountTargeting;

  /// The actions mode of the experiment that is set from the StartExperiment API
  /// command.
  final ActionsMode? actionsMode;

  /// The empty target resolution mode for an experiment.
  final EmptyTargetResolutionMode? emptyTargetResolutionMode;

  ExperimentOptions({
    this.accountTargeting,
    this.actionsMode,
    this.emptyTargetResolutionMode,
  });

  factory ExperimentOptions.fromJson(Map<String, dynamic> json) {
    return ExperimentOptions(
      accountTargeting:
          (json['accountTargeting'] as String?)?.toAccountTargeting(),
      actionsMode: (json['actionsMode'] as String?)?.toActionsMode(),
      emptyTargetResolutionMode: (json['emptyTargetResolutionMode'] as String?)
          ?.toEmptyTargetResolutionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountTargeting = this.accountTargeting;
    final actionsMode = this.actionsMode;
    final emptyTargetResolutionMode = this.emptyTargetResolutionMode;
    return {
      if (accountTargeting != null)
        'accountTargeting': accountTargeting.toValue(),
      if (actionsMode != null) 'actionsMode': actionsMode.toValue(),
      if (emptyTargetResolutionMode != null)
        'emptyTargetResolutionMode': emptyTargetResolutionMode.toValue(),
    };
  }
}

/// Describes the configuration for experiment logging to Amazon S3.
class ExperimentS3LogConfiguration {
  /// The name of the destination bucket.
  final String? bucketName;

  /// The bucket prefix.
  final String? prefix;

  ExperimentS3LogConfiguration({
    this.bucketName,
    this.prefix,
  });

  factory ExperimentS3LogConfiguration.fromJson(Map<String, dynamic> json) {
    return ExperimentS3LogConfiguration(
      bucketName: json['bucketName'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Describes the state of an experiment.
class ExperimentState {
  /// The reason for the state.
  final String? reason;

  /// The state of the experiment.
  final ExperimentStatus? status;

  ExperimentState({
    this.reason,
    this.status,
  });

  factory ExperimentState.fromJson(Map<String, dynamic> json) {
    return ExperimentState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toExperimentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ExperimentStatus {
  pending,
  initiating,
  running,
  completed,
  stopping,
  stopped,
  failed,
}

extension ExperimentStatusValueExtension on ExperimentStatus {
  String toValue() {
    switch (this) {
      case ExperimentStatus.pending:
        return 'pending';
      case ExperimentStatus.initiating:
        return 'initiating';
      case ExperimentStatus.running:
        return 'running';
      case ExperimentStatus.completed:
        return 'completed';
      case ExperimentStatus.stopping:
        return 'stopping';
      case ExperimentStatus.stopped:
        return 'stopped';
      case ExperimentStatus.failed:
        return 'failed';
    }
  }
}

extension ExperimentStatusFromString on String {
  ExperimentStatus toExperimentStatus() {
    switch (this) {
      case 'pending':
        return ExperimentStatus.pending;
      case 'initiating':
        return ExperimentStatus.initiating;
      case 'running':
        return ExperimentStatus.running;
      case 'completed':
        return ExperimentStatus.completed;
      case 'stopping':
        return ExperimentStatus.stopping;
      case 'stopped':
        return ExperimentStatus.stopped;
      case 'failed':
        return ExperimentStatus.failed;
    }
    throw Exception('$this is not known in enum ExperimentStatus');
  }
}

/// Describes the stop condition for an experiment.
class ExperimentStopCondition {
  /// The source for the stop condition.
  final String? source;

  /// The Amazon Resource Name (ARN) of the CloudWatch alarm, if applicable.
  final String? value;

  ExperimentStopCondition({
    this.source,
    this.value,
  });

  factory ExperimentStopCondition.fromJson(Map<String, dynamic> json) {
    return ExperimentStopCondition(
      source: json['source'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final value = this.value;
    return {
      if (source != null) 'source': source,
      if (value != null) 'value': value,
    };
  }
}

/// Provides a summary of an experiment.
class ExperimentSummary {
  /// The Amazon Resource Name (ARN) of the experiment.
  final String? arn;

  /// The time that the experiment was created.
  final DateTime? creationTime;

  /// The experiment options for the experiment.
  final ExperimentOptions? experimentOptions;

  /// The ID of the experiment template.
  final String? experimentTemplateId;

  /// The ID of the experiment.
  final String? id;

  /// The state of the experiment.
  final ExperimentState? state;

  /// The tags for the experiment.
  final Map<String, String>? tags;

  ExperimentSummary({
    this.arn,
    this.creationTime,
    this.experimentOptions,
    this.experimentTemplateId,
    this.id,
    this.state,
    this.tags,
  });

  factory ExperimentSummary.fromJson(Map<String, dynamic> json) {
    return ExperimentSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      experimentOptions: json['experimentOptions'] != null
          ? ExperimentOptions.fromJson(
              json['experimentOptions'] as Map<String, dynamic>)
          : null,
      experimentTemplateId: json['experimentTemplateId'] as String?,
      id: json['id'] as String?,
      state: json['state'] != null
          ? ExperimentState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final experimentOptions = this.experimentOptions;
    final experimentTemplateId = this.experimentTemplateId;
    final id = this.id;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (experimentTemplateId != null)
        'experimentTemplateId': experimentTemplateId,
      if (id != null) 'id': id,
      if (state != null) 'state': state,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a target for an experiment.
class ExperimentTarget {
  /// The filters to apply to identify target resources using specific attributes.
  final List<ExperimentTargetFilter>? filters;

  /// The resource type parameters.
  final Map<String, String>? parameters;

  /// The Amazon Resource Names (ARNs) of the resources.
  final List<String>? resourceArns;

  /// The tags for the target resources.
  final Map<String, String>? resourceTags;

  /// The resource type.
  final String? resourceType;

  /// Scopes the identified resources to a specific count or percentage.
  final String? selectionMode;

  ExperimentTarget({
    this.filters,
    this.parameters,
    this.resourceArns,
    this.resourceTags,
    this.resourceType,
    this.selectionMode,
  });

  factory ExperimentTarget.fromJson(Map<String, dynamic> json) {
    return ExperimentTarget(
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ExperimentTargetFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceArns: (json['resourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceTags: (json['resourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceType: json['resourceType'] as String?,
      selectionMode: json['selectionMode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final parameters = this.parameters;
    final resourceArns = this.resourceArns;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final selectionMode = this.selectionMode;
    return {
      if (filters != null) 'filters': filters,
      if (parameters != null) 'parameters': parameters,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (resourceType != null) 'resourceType': resourceType,
      if (selectionMode != null) 'selectionMode': selectionMode,
    };
  }
}

/// Describes a target account configuration for an experiment.
class ExperimentTargetAccountConfiguration {
  /// The Amazon Web Services account ID of the target account.
  final String? accountId;

  /// The description of the target account.
  final String? description;

  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  final String? roleArn;

  ExperimentTargetAccountConfiguration({
    this.accountId,
    this.description,
    this.roleArn,
  });

  factory ExperimentTargetAccountConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTargetAccountConfiguration(
      accountId: json['accountId'] as String?,
      description: json['description'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final roleArn = this.roleArn;
    return {
      if (accountId != null) 'accountId': accountId,
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Provides a summary of a target account configuration.
class ExperimentTargetAccountConfigurationSummary {
  /// The Amazon Web Services account ID of the target account.
  final String? accountId;

  /// The description of the target account.
  final String? description;

  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  final String? roleArn;

  ExperimentTargetAccountConfigurationSummary({
    this.accountId,
    this.description,
    this.roleArn,
  });

  factory ExperimentTargetAccountConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTargetAccountConfigurationSummary(
      accountId: json['accountId'] as String?,
      description: json['description'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final roleArn = this.roleArn;
    return {
      if (accountId != null) 'accountId': accountId,
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Describes a filter used for the target resources in an experiment.
class ExperimentTargetFilter {
  /// The attribute path for the filter.
  final String? path;

  /// The attribute values for the filter.
  final List<String>? values;

  ExperimentTargetFilter({
    this.path,
    this.values,
  });

  factory ExperimentTargetFilter.fromJson(Map<String, dynamic> json) {
    return ExperimentTargetFilter(
      path: json['path'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final values = this.values;
    return {
      if (path != null) 'path': path,
      if (values != null) 'values': values,
    };
  }
}

/// Describes an experiment template.
class ExperimentTemplate {
  /// The actions for the experiment.
  final Map<String, ExperimentTemplateAction>? actions;

  /// The Amazon Resource Name (ARN) of the experiment template.
  final String? arn;

  /// The time the experiment template was created.
  final DateTime? creationTime;

  /// The description for the experiment template.
  final String? description;

  /// The experiment options for an experiment template.
  final ExperimentTemplateExperimentOptions? experimentOptions;

  /// The ID of the experiment template.
  final String? id;

  /// The time the experiment template was last updated.
  final DateTime? lastUpdateTime;

  /// The configuration for experiment logging.
  final ExperimentTemplateLogConfiguration? logConfiguration;

  /// The Amazon Resource Name (ARN) of an IAM role.
  final String? roleArn;

  /// The stop conditions for the experiment.
  final List<ExperimentTemplateStopCondition>? stopConditions;

  /// The tags for the experiment template.
  final Map<String, String>? tags;

  /// The count of target account configurations for the experiment template.
  final int? targetAccountConfigurationsCount;

  /// The targets for the experiment.
  final Map<String, ExperimentTemplateTarget>? targets;

  ExperimentTemplate({
    this.actions,
    this.arn,
    this.creationTime,
    this.description,
    this.experimentOptions,
    this.id,
    this.lastUpdateTime,
    this.logConfiguration,
    this.roleArn,
    this.stopConditions,
    this.tags,
    this.targetAccountConfigurationsCount,
    this.targets,
  });

  factory ExperimentTemplate.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplate(
      actions: (json['actions'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ExperimentTemplateAction.fromJson(e as Map<String, dynamic>))),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      experimentOptions: json['experimentOptions'] != null
          ? ExperimentTemplateExperimentOptions.fromJson(
              json['experimentOptions'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      logConfiguration: json['logConfiguration'] != null
          ? ExperimentTemplateLogConfiguration.fromJson(
              json['logConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      stopConditions: (json['stopConditions'] as List?)
          ?.whereNotNull()
          .map((e) => ExperimentTemplateStopCondition.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetAccountConfigurationsCount:
          json['targetAccountConfigurationsCount'] as int?,
      targets: (json['targets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, ExperimentTemplateTarget.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final experimentOptions = this.experimentOptions;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final logConfiguration = this.logConfiguration;
    final roleArn = this.roleArn;
    final stopConditions = this.stopConditions;
    final tags = this.tags;
    final targetAccountConfigurationsCount =
        this.targetAccountConfigurationsCount;
    final targets = this.targets;
    return {
      if (actions != null) 'actions': actions,
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (experimentOptions != null) 'experimentOptions': experimentOptions,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (logConfiguration != null) 'logConfiguration': logConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
      if (stopConditions != null) 'stopConditions': stopConditions,
      if (tags != null) 'tags': tags,
      if (targetAccountConfigurationsCount != null)
        'targetAccountConfigurationsCount': targetAccountConfigurationsCount,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes an action for an experiment template.
class ExperimentTemplateAction {
  /// The ID of the action.
  final String? actionId;

  /// A description for the action.
  final String? description;

  /// The parameters for the action.
  final Map<String, String>? parameters;

  /// The name of the action that must be completed before the current action
  /// starts.
  final List<String>? startAfter;

  /// The targets for the action.
  final Map<String, String>? targets;

  ExperimentTemplateAction({
    this.actionId,
    this.description,
    this.parameters,
    this.startAfter,
    this.targets,
  });

  factory ExperimentTemplateAction.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplateAction(
      actionId: json['actionId'] as String?,
      description: json['description'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      startAfter: (json['startAfter'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      targets: (json['targets'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final description = this.description;
    final parameters = this.parameters;
    final startAfter = this.startAfter;
    final targets = this.targets;
    return {
      if (actionId != null) 'actionId': actionId,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
      if (startAfter != null) 'startAfter': startAfter,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Describes the configuration for experiment logging to Amazon CloudWatch
/// Logs.
class ExperimentTemplateCloudWatchLogsLogConfiguration {
  /// The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log
  /// group.
  final String? logGroupArn;

  ExperimentTemplateCloudWatchLogsLogConfiguration({
    this.logGroupArn,
  });

  factory ExperimentTemplateCloudWatchLogsLogConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTemplateCloudWatchLogsLogConfiguration(
      logGroupArn: json['logGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
    };
  }
}

/// Specifies the configuration for experiment logging to Amazon CloudWatch
/// Logs.
class ExperimentTemplateCloudWatchLogsLogConfigurationInput {
  /// The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log
  /// group.
  final String logGroupArn;

  ExperimentTemplateCloudWatchLogsLogConfigurationInput({
    required this.logGroupArn,
  });

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      'logGroupArn': logGroupArn,
    };
  }
}

/// Describes the experiment options for an experiment template.
class ExperimentTemplateExperimentOptions {
  /// The account targeting setting for an experiment template.
  final AccountTargeting? accountTargeting;

  /// The empty target resolution mode for an experiment template.
  final EmptyTargetResolutionMode? emptyTargetResolutionMode;

  ExperimentTemplateExperimentOptions({
    this.accountTargeting,
    this.emptyTargetResolutionMode,
  });

  factory ExperimentTemplateExperimentOptions.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTemplateExperimentOptions(
      accountTargeting:
          (json['accountTargeting'] as String?)?.toAccountTargeting(),
      emptyTargetResolutionMode: (json['emptyTargetResolutionMode'] as String?)
          ?.toEmptyTargetResolutionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountTargeting = this.accountTargeting;
    final emptyTargetResolutionMode = this.emptyTargetResolutionMode;
    return {
      if (accountTargeting != null)
        'accountTargeting': accountTargeting.toValue(),
      if (emptyTargetResolutionMode != null)
        'emptyTargetResolutionMode': emptyTargetResolutionMode.toValue(),
    };
  }
}

/// Describes the configuration for experiment logging.
class ExperimentTemplateLogConfiguration {
  /// The configuration for experiment logging to Amazon CloudWatch Logs.
  final ExperimentTemplateCloudWatchLogsLogConfiguration?
      cloudWatchLogsConfiguration;

  /// The schema version.
  final int? logSchemaVersion;

  /// The configuration for experiment logging to Amazon S3.
  final ExperimentTemplateS3LogConfiguration? s3Configuration;

  ExperimentTemplateLogConfiguration({
    this.cloudWatchLogsConfiguration,
    this.logSchemaVersion,
    this.s3Configuration,
  });

  factory ExperimentTemplateLogConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTemplateLogConfiguration(
      cloudWatchLogsConfiguration: json['cloudWatchLogsConfiguration'] != null
          ? ExperimentTemplateCloudWatchLogsLogConfiguration.fromJson(
              json['cloudWatchLogsConfiguration'] as Map<String, dynamic>)
          : null,
      logSchemaVersion: json['logSchemaVersion'] as int?,
      s3Configuration: json['s3Configuration'] != null
          ? ExperimentTemplateS3LogConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsConfiguration = this.cloudWatchLogsConfiguration;
    final logSchemaVersion = this.logSchemaVersion;
    final s3Configuration = this.s3Configuration;
    return {
      if (cloudWatchLogsConfiguration != null)
        'cloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
      if (logSchemaVersion != null) 'logSchemaVersion': logSchemaVersion,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

/// Describes the configuration for experiment logging to Amazon S3.
class ExperimentTemplateS3LogConfiguration {
  /// The name of the destination bucket.
  final String? bucketName;

  /// The bucket prefix.
  final String? prefix;

  ExperimentTemplateS3LogConfiguration({
    this.bucketName,
    this.prefix,
  });

  factory ExperimentTemplateS3LogConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExperimentTemplateS3LogConfiguration(
      bucketName: json['bucketName'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Specifies the configuration for experiment logging to Amazon S3.
class ExperimentTemplateS3LogConfigurationInput {
  /// The name of the destination bucket.
  final String bucketName;

  /// The bucket prefix.
  final String? prefix;

  ExperimentTemplateS3LogConfigurationInput({
    required this.bucketName,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Describes a stop condition for an experiment template.
class ExperimentTemplateStopCondition {
  /// The source for the stop condition.
  final String? source;

  /// The Amazon Resource Name (ARN) of the CloudWatch alarm, if applicable.
  final String? value;

  ExperimentTemplateStopCondition({
    this.source,
    this.value,
  });

  factory ExperimentTemplateStopCondition.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplateStopCondition(
      source: json['source'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final value = this.value;
    return {
      if (source != null) 'source': source,
      if (value != null) 'value': value,
    };
  }
}

/// Provides a summary of an experiment template.
class ExperimentTemplateSummary {
  /// The Amazon Resource Name (ARN) of the experiment template.
  final String? arn;

  /// The time that the experiment template was created.
  final DateTime? creationTime;

  /// The description of the experiment template.
  final String? description;

  /// The ID of the experiment template.
  final String? id;

  /// The time that the experiment template was last updated.
  final DateTime? lastUpdateTime;

  /// The tags for the experiment template.
  final Map<String, String>? tags;

  ExperimentTemplateSummary({
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastUpdateTime,
    this.tags,
  });

  factory ExperimentTemplateSummary.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplateSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastUpdateTime = this.lastUpdateTime;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a target for an experiment template.
class ExperimentTemplateTarget {
  /// The filters to apply to identify target resources using specific attributes.
  final List<ExperimentTemplateTargetFilter>? filters;

  /// The resource type parameters.
  final Map<String, String>? parameters;

  /// The Amazon Resource Names (ARNs) of the targets.
  final List<String>? resourceArns;

  /// The tags for the target resources.
  final Map<String, String>? resourceTags;

  /// The resource type.
  final String? resourceType;

  /// Scopes the identified resources to a specific count or percentage.
  final String? selectionMode;

  ExperimentTemplateTarget({
    this.filters,
    this.parameters,
    this.resourceArns,
    this.resourceTags,
    this.resourceType,
    this.selectionMode,
  });

  factory ExperimentTemplateTarget.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplateTarget(
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map((e) => ExperimentTemplateTargetFilter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceArns: (json['resourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceTags: (json['resourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceType: json['resourceType'] as String?,
      selectionMode: json['selectionMode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final parameters = this.parameters;
    final resourceArns = this.resourceArns;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final selectionMode = this.selectionMode;
    return {
      if (filters != null) 'filters': filters,
      if (parameters != null) 'parameters': parameters,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (resourceType != null) 'resourceType': resourceType,
      if (selectionMode != null) 'selectionMode': selectionMode,
    };
  }
}

/// Describes a filter used for the target resources in an experiment template.
class ExperimentTemplateTargetFilter {
  /// The attribute path for the filter.
  final String? path;

  /// The attribute values for the filter.
  final List<String>? values;

  ExperimentTemplateTargetFilter({
    this.path,
    this.values,
  });

  factory ExperimentTemplateTargetFilter.fromJson(Map<String, dynamic> json) {
    return ExperimentTemplateTargetFilter(
      path: json['path'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final values = this.values;
    return {
      if (path != null) 'path': path,
      if (values != null) 'values': values,
    };
  }
}

/// Specifies a filter used for the target resource input in an experiment
/// template.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/fis/latest/userguide/targets.html#target-filters">Resource
/// filters</a> in the <i>Fault Injection Service User Guide</i>.
class ExperimentTemplateTargetInputFilter {
  /// The attribute path for the filter.
  final String path;

  /// The attribute values for the filter.
  final List<String> values;

  ExperimentTemplateTargetInputFilter({
    required this.path,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final path = this.path;
    final values = this.values;
    return {
      'path': path,
      'values': values,
    };
  }
}

class GetActionResponse {
  /// Information about the action.
  final Action? action;

  GetActionResponse({
    this.action,
  });

  factory GetActionResponse.fromJson(Map<String, dynamic> json) {
    return GetActionResponse(
      action: json['action'] != null
          ? Action.fromJson(json['action'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      if (action != null) 'action': action,
    };
  }
}

class GetExperimentResponse {
  /// Information about the experiment.
  final Experiment? experiment;

  GetExperimentResponse({
    this.experiment,
  });

  factory GetExperimentResponse.fromJson(Map<String, dynamic> json) {
    return GetExperimentResponse(
      experiment: json['experiment'] != null
          ? Experiment.fromJson(json['experiment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      if (experiment != null) 'experiment': experiment,
    };
  }
}

class GetExperimentTargetAccountConfigurationResponse {
  /// Information about the target account configuration.
  final ExperimentTargetAccountConfiguration? targetAccountConfiguration;

  GetExperimentTargetAccountConfigurationResponse({
    this.targetAccountConfiguration,
  });

  factory GetExperimentTargetAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetExperimentTargetAccountConfigurationResponse(
      targetAccountConfiguration: json['targetAccountConfiguration'] != null
          ? ExperimentTargetAccountConfiguration.fromJson(
              json['targetAccountConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccountConfiguration = this.targetAccountConfiguration;
    return {
      if (targetAccountConfiguration != null)
        'targetAccountConfiguration': targetAccountConfiguration,
    };
  }
}

class GetExperimentTemplateResponse {
  /// Information about the experiment template.
  final ExperimentTemplate? experimentTemplate;

  GetExperimentTemplateResponse({
    this.experimentTemplate,
  });

  factory GetExperimentTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetExperimentTemplateResponse(
      experimentTemplate: json['experimentTemplate'] != null
          ? ExperimentTemplate.fromJson(
              json['experimentTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experimentTemplate = this.experimentTemplate;
    return {
      if (experimentTemplate != null) 'experimentTemplate': experimentTemplate,
    };
  }
}

class GetTargetAccountConfigurationResponse {
  /// Information about the target account configuration.
  final TargetAccountConfiguration? targetAccountConfiguration;

  GetTargetAccountConfigurationResponse({
    this.targetAccountConfiguration,
  });

  factory GetTargetAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTargetAccountConfigurationResponse(
      targetAccountConfiguration: json['targetAccountConfiguration'] != null
          ? TargetAccountConfiguration.fromJson(
              json['targetAccountConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccountConfiguration = this.targetAccountConfiguration;
    return {
      if (targetAccountConfiguration != null)
        'targetAccountConfiguration': targetAccountConfiguration,
    };
  }
}

class GetTargetResourceTypeResponse {
  /// Information about the resource type.
  final TargetResourceType? targetResourceType;

  GetTargetResourceTypeResponse({
    this.targetResourceType,
  });

  factory GetTargetResourceTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetTargetResourceTypeResponse(
      targetResourceType: json['targetResourceType'] != null
          ? TargetResourceType.fromJson(
              json['targetResourceType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetResourceType = this.targetResourceType;
    return {
      if (targetResourceType != null) 'targetResourceType': targetResourceType,
    };
  }
}

class ListActionsResponse {
  /// The actions.
  final List<ActionSummary>? actions;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListActionsResponse({
    this.actions,
    this.nextToken,
  });

  factory ListActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListActionsResponse(
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => ActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final nextToken = this.nextToken;
    return {
      if (actions != null) 'actions': actions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListExperimentResolvedTargetsResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The resolved targets.
  final List<ResolvedTarget>? resolvedTargets;

  ListExperimentResolvedTargetsResponse({
    this.nextToken,
    this.resolvedTargets,
  });

  factory ListExperimentResolvedTargetsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListExperimentResolvedTargetsResponse(
      nextToken: json['nextToken'] as String?,
      resolvedTargets: (json['resolvedTargets'] as List?)
          ?.whereNotNull()
          .map((e) => ResolvedTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolvedTargets = this.resolvedTargets;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resolvedTargets != null) 'resolvedTargets': resolvedTargets,
    };
  }
}

class ListExperimentTargetAccountConfigurationsResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The target account configurations.
  final List<ExperimentTargetAccountConfigurationSummary>?
      targetAccountConfigurations;

  ListExperimentTargetAccountConfigurationsResponse({
    this.nextToken,
    this.targetAccountConfigurations,
  });

  factory ListExperimentTargetAccountConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListExperimentTargetAccountConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      targetAccountConfigurations:
          (json['targetAccountConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ExperimentTargetAccountConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetAccountConfigurations = this.targetAccountConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetAccountConfigurations != null)
        'targetAccountConfigurations': targetAccountConfigurations,
    };
  }
}

class ListExperimentTemplatesResponse {
  /// The experiment templates.
  final List<ExperimentTemplateSummary>? experimentTemplates;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListExperimentTemplatesResponse({
    this.experimentTemplates,
    this.nextToken,
  });

  factory ListExperimentTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListExperimentTemplatesResponse(
      experimentTemplates: (json['experimentTemplates'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExperimentTemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final experimentTemplates = this.experimentTemplates;
    final nextToken = this.nextToken;
    return {
      if (experimentTemplates != null)
        'experimentTemplates': experimentTemplates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListExperimentsResponse {
  /// The experiments.
  final List<ExperimentSummary>? experiments;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListExperimentsResponse({
    this.experiments,
    this.nextToken,
  });

  factory ListExperimentsResponse.fromJson(Map<String, dynamic> json) {
    return ListExperimentsResponse(
      experiments: (json['experiments'] as List?)
          ?.whereNotNull()
          .map((e) => ExperimentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final experiments = this.experiments;
    final nextToken = this.nextToken;
    return {
      if (experiments != null) 'experiments': experiments,
      if (nextToken != null) 'nextToken': nextToken,
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

class ListTargetAccountConfigurationsResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The target account configurations.
  final List<TargetAccountConfigurationSummary>? targetAccountConfigurations;

  ListTargetAccountConfigurationsResponse({
    this.nextToken,
    this.targetAccountConfigurations,
  });

  factory ListTargetAccountConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTargetAccountConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      targetAccountConfigurations:
          (json['targetAccountConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => TargetAccountConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetAccountConfigurations = this.targetAccountConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetAccountConfigurations != null)
        'targetAccountConfigurations': targetAccountConfigurations,
    };
  }
}

class ListTargetResourceTypesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The target resource types.
  final List<TargetResourceTypeSummary>? targetResourceTypes;

  ListTargetResourceTypesResponse({
    this.nextToken,
    this.targetResourceTypes,
  });

  factory ListTargetResourceTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListTargetResourceTypesResponse(
      nextToken: json['nextToken'] as String?,
      targetResourceTypes: (json['targetResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetResourceTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetResourceTypes = this.targetResourceTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetResourceTypes != null)
        'targetResourceTypes': targetResourceTypes,
    };
  }
}

/// Describes a resolved target.
class ResolvedTarget {
  /// The resource type of the target.
  final String? resourceType;

  /// Information about the target.
  final Map<String, String>? targetInformation;

  /// The name of the target.
  final String? targetName;

  ResolvedTarget({
    this.resourceType,
    this.targetInformation,
    this.targetName,
  });

  factory ResolvedTarget.fromJson(Map<String, dynamic> json) {
    return ResolvedTarget(
      resourceType: json['resourceType'] as String?,
      targetInformation: (json['targetInformation'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetName: json['targetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final targetInformation = this.targetInformation;
    final targetName = this.targetName;
    return {
      if (resourceType != null) 'resourceType': resourceType,
      if (targetInformation != null) 'targetInformation': targetInformation,
      if (targetName != null) 'targetName': targetName,
    };
  }
}

/// Specifies experiment options for running an experiment.
class StartExperimentExperimentOptionsInput {
  /// Specifies the actions mode for experiment options.
  final ActionsMode? actionsMode;

  StartExperimentExperimentOptionsInput({
    this.actionsMode,
  });

  Map<String, dynamic> toJson() {
    final actionsMode = this.actionsMode;
    return {
      if (actionsMode != null) 'actionsMode': actionsMode.toValue(),
    };
  }
}

class StartExperimentResponse {
  /// Information about the experiment.
  final Experiment? experiment;

  StartExperimentResponse({
    this.experiment,
  });

  factory StartExperimentResponse.fromJson(Map<String, dynamic> json) {
    return StartExperimentResponse(
      experiment: json['experiment'] != null
          ? Experiment.fromJson(json['experiment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      if (experiment != null) 'experiment': experiment,
    };
  }
}

class StopExperimentResponse {
  /// Information about the experiment.
  final Experiment? experiment;

  StopExperimentResponse({
    this.experiment,
  });

  factory StopExperimentResponse.fromJson(Map<String, dynamic> json) {
    return StopExperimentResponse(
      experiment: json['experiment'] != null
          ? Experiment.fromJson(json['experiment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experiment = this.experiment;
    return {
      if (experiment != null) 'experiment': experiment,
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

/// Describes a target account configuration.
class TargetAccountConfiguration {
  /// The Amazon Web Services account ID of the target account.
  final String? accountId;

  /// The description of the target account.
  final String? description;

  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  final String? roleArn;

  TargetAccountConfiguration({
    this.accountId,
    this.description,
    this.roleArn,
  });

  factory TargetAccountConfiguration.fromJson(Map<String, dynamic> json) {
    return TargetAccountConfiguration(
      accountId: json['accountId'] as String?,
      description: json['description'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final roleArn = this.roleArn;
    return {
      if (accountId != null) 'accountId': accountId,
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Provides a summary of a target account configuration.
class TargetAccountConfigurationSummary {
  /// The Amazon Web Services account ID of the target account.
  final String? accountId;

  /// The description of the target account.
  final String? description;

  /// The Amazon Resource Name (ARN) of an IAM role for the target account.
  final String? roleArn;

  TargetAccountConfigurationSummary({
    this.accountId,
    this.description,
    this.roleArn,
  });

  factory TargetAccountConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return TargetAccountConfigurationSummary(
      accountId: json['accountId'] as String?,
      description: json['description'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final roleArn = this.roleArn;
    return {
      if (accountId != null) 'accountId': accountId,
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Describes a resource type.
class TargetResourceType {
  /// A description of the resource type.
  final String? description;

  /// The parameters for the resource type.
  final Map<String, TargetResourceTypeParameter>? parameters;

  /// The resource type.
  final String? resourceType;

  TargetResourceType({
    this.description,
    this.parameters,
    this.resourceType,
  });

  factory TargetResourceType.fromJson(Map<String, dynamic> json) {
    return TargetResourceType(
      description: json['description'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              TargetResourceTypeParameter.fromJson(e as Map<String, dynamic>))),
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final parameters = this.parameters;
    final resourceType = this.resourceType;
    return {
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

/// Describes the parameters for a resource type. Use parameters to determine
/// which tasks are identified during target resolution.
class TargetResourceTypeParameter {
  /// A description of the parameter.
  final String? description;

  /// Indicates whether the parameter is required.
  final bool? required;

  TargetResourceTypeParameter({
    this.description,
    this.required,
  });

  factory TargetResourceTypeParameter.fromJson(Map<String, dynamic> json) {
    return TargetResourceTypeParameter(
      description: json['description'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final required = this.required;
    return {
      if (description != null) 'description': description,
      if (required != null) 'required': required,
    };
  }
}

/// Describes a resource type.
class TargetResourceTypeSummary {
  /// A description of the resource type.
  final String? description;

  /// The resource type.
  final String? resourceType;

  TargetResourceTypeSummary({
    this.description,
    this.resourceType,
  });

  factory TargetResourceTypeSummary.fromJson(Map<String, dynamic> json) {
    return TargetResourceTypeSummary(
      description: json['description'] as String?,
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final resourceType = this.resourceType;
    return {
      if (description != null) 'description': description,
      if (resourceType != null) 'resourceType': resourceType,
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

/// Specifies an action for an experiment template.
class UpdateExperimentTemplateActionInputItem {
  /// The ID of the action.
  final String? actionId;

  /// A description for the action.
  final String? description;

  /// The parameters for the action, if applicable.
  final Map<String, String>? parameters;

  /// The name of the action that must be completed before the current action
  /// starts. Omit this parameter to run the action at the start of the
  /// experiment.
  final List<String>? startAfter;

  /// The targets for the action.
  final Map<String, String>? targets;

  UpdateExperimentTemplateActionInputItem({
    this.actionId,
    this.description,
    this.parameters,
    this.startAfter,
    this.targets,
  });

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final description = this.description;
    final parameters = this.parameters;
    final startAfter = this.startAfter;
    final targets = this.targets;
    return {
      if (actionId != null) 'actionId': actionId,
      if (description != null) 'description': description,
      if (parameters != null) 'parameters': parameters,
      if (startAfter != null) 'startAfter': startAfter,
      if (targets != null) 'targets': targets,
    };
  }
}

/// Specifies an experiment option for an experiment template.
class UpdateExperimentTemplateExperimentOptionsInput {
  /// The empty target resolution mode of the experiment template.
  final EmptyTargetResolutionMode? emptyTargetResolutionMode;

  UpdateExperimentTemplateExperimentOptionsInput({
    this.emptyTargetResolutionMode,
  });

  Map<String, dynamic> toJson() {
    final emptyTargetResolutionMode = this.emptyTargetResolutionMode;
    return {
      if (emptyTargetResolutionMode != null)
        'emptyTargetResolutionMode': emptyTargetResolutionMode.toValue(),
    };
  }
}

/// Specifies the configuration for experiment logging.
class UpdateExperimentTemplateLogConfigurationInput {
  /// The configuration for experiment logging to Amazon CloudWatch Logs.
  final ExperimentTemplateCloudWatchLogsLogConfigurationInput?
      cloudWatchLogsConfiguration;

  /// The schema version.
  final int? logSchemaVersion;

  /// The configuration for experiment logging to Amazon S3.
  final ExperimentTemplateS3LogConfigurationInput? s3Configuration;

  UpdateExperimentTemplateLogConfigurationInput({
    this.cloudWatchLogsConfiguration,
    this.logSchemaVersion,
    this.s3Configuration,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLogsConfiguration = this.cloudWatchLogsConfiguration;
    final logSchemaVersion = this.logSchemaVersion;
    final s3Configuration = this.s3Configuration;
    return {
      if (cloudWatchLogsConfiguration != null)
        'cloudWatchLogsConfiguration': cloudWatchLogsConfiguration,
      if (logSchemaVersion != null) 'logSchemaVersion': logSchemaVersion,
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

class UpdateExperimentTemplateResponse {
  /// Information about the experiment template.
  final ExperimentTemplate? experimentTemplate;

  UpdateExperimentTemplateResponse({
    this.experimentTemplate,
  });

  factory UpdateExperimentTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateExperimentTemplateResponse(
      experimentTemplate: json['experimentTemplate'] != null
          ? ExperimentTemplate.fromJson(
              json['experimentTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final experimentTemplate = this.experimentTemplate;
    return {
      if (experimentTemplate != null) 'experimentTemplate': experimentTemplate,
    };
  }
}

/// Specifies a stop condition for an experiment. You can define a stop
/// condition as a CloudWatch alarm.
class UpdateExperimentTemplateStopConditionInput {
  /// The source for the stop condition. Specify <code>aws:cloudwatch:alarm</code>
  /// if the stop condition is defined by a CloudWatch alarm. Specify
  /// <code>none</code> if there is no stop condition.
  final String source;

  /// The Amazon Resource Name (ARN) of the CloudWatch alarm.
  final String? value;

  UpdateExperimentTemplateStopConditionInput({
    required this.source,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    final value = this.value;
    return {
      'source': source,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies a target for an experiment. You must specify at least one Amazon
/// Resource Name (ARN) or at least one resource tag. You cannot specify both.
class UpdateExperimentTemplateTargetInput {
  /// The resource type. The resource type must be supported for the specified
  /// action.
  final String resourceType;

  /// Scopes the identified resources to a specific count or percentage.
  final String selectionMode;

  /// The filters to apply to identify target resources using specific attributes.
  final List<ExperimentTemplateTargetInputFilter>? filters;

  /// The resource type parameters.
  final Map<String, String>? parameters;

  /// The Amazon Resource Names (ARNs) of the targets.
  final List<String>? resourceArns;

  /// The tags for the target resources.
  final Map<String, String>? resourceTags;

  UpdateExperimentTemplateTargetInput({
    required this.resourceType,
    required this.selectionMode,
    this.filters,
    this.parameters,
    this.resourceArns,
    this.resourceTags,
  });

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final selectionMode = this.selectionMode;
    final filters = this.filters;
    final parameters = this.parameters;
    final resourceArns = this.resourceArns;
    final resourceTags = this.resourceTags;
    return {
      'resourceType': resourceType,
      'selectionMode': selectionMode,
      if (filters != null) 'filters': filters,
      if (parameters != null) 'parameters': parameters,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
  }
}

class UpdateTargetAccountConfigurationResponse {
  /// Information about the target account configuration.
  final TargetAccountConfiguration? targetAccountConfiguration;

  UpdateTargetAccountConfigurationResponse({
    this.targetAccountConfiguration,
  });

  factory UpdateTargetAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateTargetAccountConfigurationResponse(
      targetAccountConfiguration: json['targetAccountConfiguration'] != null
          ? TargetAccountConfiguration.fromJson(
              json['targetAccountConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccountConfiguration = this.targetAccountConfiguration;
    return {
      if (targetAccountConfiguration != null)
        'targetAccountConfiguration': targetAccountConfiguration,
    };
  }
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
