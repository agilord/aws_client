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

/// This is the CodePipeline API Reference. This guide provides descriptions of
/// the actions and data types for CodePipeline. Some functionality for your
/// pipeline can only be configured through the API. For more information, see
/// the <a
/// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html">CodePipeline
/// User Guide</a>.
class CodePipeline {
  final _s.JsonProtocol _protocol;
  CodePipeline({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codepipeline',
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

  /// Returns information about a specified job and whether that job has been
  /// received by the job worker. Used for custom actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNonceException].
  /// May throw [JobNotFoundException].
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID of the job for which you want to confirm
  /// receipt.
  ///
  /// Parameter [nonce] :
  /// A system-generated random number that CodePipeline uses to ensure that the
  /// job is being worked on by only one job worker. Get this number from the
  /// response of the <a>PollForJobs</a> request that returned this job.
  Future<AcknowledgeJobOutput> acknowledgeJob({
    required String jobId,
    required String nonce,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.AcknowledgeJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobId': jobId,
        'nonce': nonce,
      },
    );

    return AcknowledgeJobOutput.fromJson(jsonResponse.body);
  }

  /// Confirms a job worker has received the specified job. Used for partner
  /// actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNonceException].
  /// May throw [JobNotFoundException].
  /// May throw [InvalidClientTokenException].
  ///
  /// Parameter [clientToken] :
  /// The clientToken portion of the clientId and clientToken pair used to
  /// verify that the calling entity is allowed access to the job and its
  /// details.
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID of the job.
  ///
  /// Parameter [nonce] :
  /// A system-generated random number that CodePipeline uses to ensure that the
  /// job is being worked on by only one job worker. Get this number from the
  /// response to a <a>GetThirdPartyJobDetails</a> request.
  Future<AcknowledgeThirdPartyJobOutput> acknowledgeThirdPartyJob({
    required String clientToken,
    required String jobId,
    required String nonce,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.AcknowledgeThirdPartyJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clientToken': clientToken,
        'jobId': jobId,
        'nonce': nonce,
      },
    );

    return AcknowledgeThirdPartyJobOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new custom action that can be used in all pipelines associated
  /// with the Amazon Web Services account. Only used for custom actions.
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [category] :
  /// The category of the custom action, such as a build action or a test
  /// action.
  ///
  /// Parameter [inputArtifactDetails] :
  /// The details of the input artifact for the action, such as its commit ID.
  ///
  /// Parameter [outputArtifactDetails] :
  /// The details of the output artifact of the action, such as its commit ID.
  ///
  /// Parameter [provider] :
  /// The provider of the service used in the custom action, such as CodeDeploy.
  ///
  /// Parameter [version] :
  /// The version identifier of the custom action.
  ///
  /// Parameter [configurationProperties] :
  /// The configuration properties for the custom action.
  /// <note>
  /// You can refer to a name in the configuration properties of the custom
  /// action within the URL templates by following the format of {Config:name},
  /// as long as the configuration property is both required and not secret. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/how-to-create-custom-action.html">Create
  /// a Custom Action for a Pipeline</a>.
  /// </note>
  ///
  /// Parameter [settings] :
  /// URLs that provide users information about this custom action.
  ///
  /// Parameter [tags] :
  /// The tags for the custom action.
  Future<CreateCustomActionTypeOutput> createCustomActionType({
    required ActionCategory category,
    required ArtifactDetails inputArtifactDetails,
    required ArtifactDetails outputArtifactDetails,
    required String provider,
    required String version,
    List<ActionConfigurationProperty>? configurationProperties,
    ActionTypeSettings? settings,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.CreateCustomActionType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'category': category.toValue(),
        'inputArtifactDetails': inputArtifactDetails,
        'outputArtifactDetails': outputArtifactDetails,
        'provider': provider,
        'version': version,
        if (configurationProperties != null)
          'configurationProperties': configurationProperties,
        if (settings != null) 'settings': settings,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCustomActionTypeOutput.fromJson(jsonResponse.body);
  }

  /// Creates a pipeline.
  /// <note>
  /// In the pipeline structure, you must include either
  /// <code>artifactStore</code> or <code>artifactStores</code> in your
  /// pipeline, but you cannot use both. If you create a cross-region action in
  /// your pipeline, you must use <code>artifactStores</code>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNameInUseException].
  /// May throw [InvalidStageDeclarationException].
  /// May throw [InvalidActionDeclarationException].
  /// May throw [InvalidBlockerDeclarationException].
  /// May throw [InvalidStructureException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [pipeline] :
  /// Represents the structure of actions and stages to be performed in the
  /// pipeline.
  ///
  /// Parameter [tags] :
  /// The tags for the pipeline.
  Future<CreatePipelineOutput> createPipeline({
    required PipelineDeclaration pipeline,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.CreatePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipeline': pipeline,
        if (tags != null) 'tags': tags,
      },
    );

    return CreatePipelineOutput.fromJson(jsonResponse.body);
  }

  /// Marks a custom action as deleted. <code>PollForJobs</code> for the custom
  /// action fails after the action is marked for deletion. Used for custom
  /// actions only.
  /// <important>
  /// To re-create a custom action after it has been deleted you must use a
  /// string in the version field that has never been used before. This string
  /// can be an incremented version number, for example. To restore a deleted
  /// custom action, use a JSON file that is identical to the deleted action,
  /// including the original string in the version field.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [category] :
  /// The category of the custom action that you want to delete, such as source
  /// or deploy.
  ///
  /// Parameter [provider] :
  /// The provider of the service used in the custom action, such as CodeDeploy.
  ///
  /// Parameter [version] :
  /// The version of the custom action to delete.
  Future<void> deleteCustomActionType({
    required ActionCategory category,
    required String provider,
    required String version,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.DeleteCustomActionType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'category': category.toValue(),
        'provider': provider,
        'version': version,
      },
    );
  }

  /// Deletes the specified pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the pipeline to be deleted.
  Future<void> deletePipeline({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.DeletePipeline'
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

  /// Deletes a previously created webhook by name. Deleting the webhook stops
  /// CodePipeline from starting a pipeline every time an external event occurs.
  /// The API returns successfully when trying to delete a webhook that is
  /// already deleted. If a deleted webhook is re-created by calling PutWebhook
  /// with the same name, it will have a different URL.
  ///
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [name] :
  /// The name of the webhook you want to delete.
  Future<void> deleteWebhook({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.DeleteWebhook'
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

  /// Removes the connection between the webhook that was created by
  /// CodePipeline and the external tool with events to be detected. Currently
  /// supported only for webhooks that target an action type of GitHub.
  ///
  /// May throw [ValidationException].
  /// May throw [WebhookNotFoundException].
  ///
  /// Parameter [webhookName] :
  /// The name of the webhook you want to deregister.
  Future<void> deregisterWebhookWithThirdParty({
    String? webhookName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.DeregisterWebhookWithThirdParty'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (webhookName != null) 'webhookName': webhookName,
      },
    );
  }

  /// Prevents artifacts in a pipeline from transitioning to the next stage in
  /// the pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [StageNotFoundException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline in which you want to disable the flow of
  /// artifacts from one stage to another.
  ///
  /// Parameter [reason] :
  /// The reason given to the user that a stage is disabled, such as waiting for
  /// manual approval or manual tests. This message is displayed in the pipeline
  /// console UI.
  ///
  /// Parameter [stageName] :
  /// The name of the stage where you want to disable the inbound or outbound
  /// transition of artifacts.
  ///
  /// Parameter [transitionType] :
  /// Specifies whether artifacts are prevented from transitioning into the
  /// stage and being processed by the actions in that stage (inbound), or
  /// prevented from transitioning from the stage after they have been processed
  /// by the actions in that stage (outbound).
  Future<void> disableStageTransition({
    required String pipelineName,
    required String reason,
    required String stageName,
    required StageTransitionType transitionType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.DisableStageTransition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineName': pipelineName,
        'reason': reason,
        'stageName': stageName,
        'transitionType': transitionType.toValue(),
      },
    );
  }

  /// Enables artifacts in a pipeline to transition to a stage in a pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [StageNotFoundException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline in which you want to enable the flow of artifacts
  /// from one stage to another.
  ///
  /// Parameter [stageName] :
  /// The name of the stage where you want to enable the transition of
  /// artifacts, either into the stage (inbound) or from that stage to the next
  /// stage (outbound).
  ///
  /// Parameter [transitionType] :
  /// Specifies whether artifacts are allowed to enter the stage and be
  /// processed by the actions in that stage (inbound) or whether already
  /// processed artifacts are allowed to transition to the next stage
  /// (outbound).
  Future<void> enableStageTransition({
    required String pipelineName,
    required String stageName,
    required StageTransitionType transitionType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.EnableStageTransition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineName': pipelineName,
        'stageName': stageName,
        'transitionType': transitionType.toValue(),
      },
    );
  }

  /// Returns information about an action type created for an external provider,
  /// where the action is to be used by customers of the external provider. The
  /// action can be created with any supported integration model.
  ///
  /// May throw [ActionTypeNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [category] :
  /// Defines what kind of action can be taken in the stage. The following are
  /// the valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>Source</code>
  /// </li>
  /// <li>
  /// <code>Build</code>
  /// </li>
  /// <li>
  /// <code>Test</code>
  /// </li>
  /// <li>
  /// <code>Deploy</code>
  /// </li>
  /// <li>
  /// <code>Approval</code>
  /// </li>
  /// <li>
  /// <code>Invoke</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [owner] :
  /// The creator of an action type that was created with any supported
  /// integration model. There are two valid values: <code>AWS</code> and
  /// <code>ThirdParty</code>.
  ///
  /// Parameter [provider] :
  /// The provider of the action type being called. The provider name is
  /// specified when the action type is created.
  ///
  /// Parameter [version] :
  /// A string that describes the action type version.
  Future<GetActionTypeOutput> getActionType({
    required ActionCategory category,
    required String owner,
    required String provider,
    required String version,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetActionType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'category': category.toValue(),
        'owner': owner,
        'provider': provider,
        'version': version,
      },
    );

    return GetActionTypeOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a job. Used for custom actions only.
  /// <important>
  /// When this API is called, CodePipeline returns temporary credentials for
  /// the S3 bucket used to store artifacts for the pipeline, if the action
  /// requires access to that S3 bucket for input or output artifacts. This API
  /// also returns any secret values defined for the action.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [JobNotFoundException].
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID for the job.
  Future<GetJobDetailsOutput> getJobDetails({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetJobDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobId': jobId,
      },
    );

    return GetJobDetailsOutput.fromJson(jsonResponse.body);
  }

  /// Returns the metadata, structure, stages, and actions of a pipeline. Can be
  /// used to return the entire structure of a pipeline in JSON format, which
  /// can then be modified and used to update the pipeline structure with
  /// <a>UpdatePipeline</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineVersionNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the pipeline for which you want to get information. Pipeline
  /// names must be unique in an Amazon Web Services account.
  ///
  /// Parameter [version] :
  /// The version number of the pipeline. If you do not specify a version,
  /// defaults to the current version.
  Future<GetPipelineOutput> getPipeline({
    required String name,
    int? version,
  }) async {
    _s.validateNumRange(
      'version',
      version,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetPipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (version != null) 'version': version,
      },
    );

    return GetPipelineOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about an execution of a pipeline, including details
  /// about artifacts, the pipeline execution ID, and the name, version, and
  /// status of the pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineExecutionNotFoundException].
  ///
  /// Parameter [pipelineExecutionId] :
  /// The ID of the pipeline execution about which you want to get execution
  /// details.
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline about which you want to get execution details.
  Future<GetPipelineExecutionOutput> getPipelineExecution({
    required String pipelineExecutionId,
    required String pipelineName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetPipelineExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineExecutionId': pipelineExecutionId,
        'pipelineName': pipelineName,
      },
    );

    return GetPipelineExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the state of a pipeline, including the stages
  /// and actions.
  /// <note>
  /// Values returned in the <code>revisionId</code> and
  /// <code>revisionUrl</code> fields indicate the source revision information,
  /// such as the commit ID, for the current state.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the pipeline about which you want to get information.
  Future<GetPipelineStateOutput> getPipelineState({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetPipelineState'
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

    return GetPipelineStateOutput.fromJson(jsonResponse.body);
  }

  /// Requests the details of a job for a third party action. Used for partner
  /// actions only.
  /// <important>
  /// When this API is called, CodePipeline returns temporary credentials for
  /// the S3 bucket used to store artifacts for the pipeline, if the action
  /// requires access to that S3 bucket for input or output artifacts. This API
  /// also returns any secret values defined for the action.
  /// </important>
  ///
  /// May throw [JobNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidJobException].
  ///
  /// Parameter [clientToken] :
  /// The clientToken portion of the clientId and clientToken pair used to
  /// verify that the calling entity is allowed access to the job and its
  /// details.
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID used for identifying the job.
  Future<GetThirdPartyJobDetailsOutput> getThirdPartyJobDetails({
    required String clientToken,
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.GetThirdPartyJobDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clientToken': clientToken,
        'jobId': jobId,
      },
    );

    return GetThirdPartyJobDetailsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the action executions that have occurred in a pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [PipelineExecutionNotFoundException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline for which you want to list action execution
  /// history.
  ///
  /// Parameter [filter] :
  /// Input information used to filter action execution history.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned nextToken value.
  /// Action execution history is retained for up to 12 months, based on action
  /// execution start times. Default value is 100.
  /// <note>
  /// Detailed execution history is available for executions run on or after
  /// February 21, 2019.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous
  /// <code>ListActionExecutions</code> call, which can be used to return the
  /// next set of action executions in the list.
  Future<ListActionExecutionsOutput> listActionExecutions({
    required String pipelineName,
    ActionExecutionFilter? filter,
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
      'X-Amz-Target': 'CodePipeline_20150709.ListActionExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineName': pipelineName,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListActionExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a summary of all CodePipeline action types associated with your
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [actionOwnerFilter] :
  /// Filters the list of action types to those created by a specified entity.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous list action types call,
  /// which can be used to return the next set of action types in the list.
  ///
  /// Parameter [regionFilter] :
  /// The Region to filter on for the list of action types.
  Future<ListActionTypesOutput> listActionTypes({
    ActionOwner? actionOwnerFilter,
    String? nextToken,
    String? regionFilter,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.ListActionTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (actionOwnerFilter != null)
          'actionOwnerFilter': actionOwnerFilter.toValue(),
        if (nextToken != null) 'nextToken': nextToken,
        if (regionFilter != null) 'regionFilter': regionFilter,
      },
    );

    return ListActionTypesOutput.fromJson(jsonResponse.body);
  }

  /// Gets a summary of the most recent executions for a pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [PipelineNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline for which you want to get execution summary
  /// information.
  ///
  /// Parameter [filter] :
  /// The pipeline execution to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned nextToken value.
  /// Pipeline history is limited to the most recent 12 months, based on
  /// pipeline execution start times. Default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous
  /// <code>ListPipelineExecutions</code> call, which can be used to return the
  /// next set of pipeline executions in the list.
  Future<ListPipelineExecutionsOutput> listPipelineExecutions({
    required String pipelineName,
    PipelineExecutionFilter? filter,
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
      'X-Amz-Target': 'CodePipeline_20150709.ListPipelineExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineName': pipelineName,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListPipelineExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Gets a summary of all of the pipelines associated with your account.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pipelines to return in a single call. To retrieve
  /// the remaining pipelines, make another call with the returned nextToken
  /// value. The minimum value you can specify is 1. The maximum accepted value
  /// is 1000.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous list pipelines call. It
  /// can be used to return the next set of pipelines in the list.
  Future<ListPipelinesOutput> listPipelines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.ListPipelines'
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
      },
    );

    return ListPipelinesOutput.fromJson(jsonResponse.body);
  }

  /// Gets the set of key-value pairs (metadata) that are used to manage the
  /// resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to get tags for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous API call, which would be
  /// used to return the next page of the list. The ListTagsforResource call
  /// lists all available tags in one call and does not use pagination.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
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
      'X-Amz-Target': 'CodePipeline_20150709.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Gets a listing of all the webhooks in this Amazon Web Services Region for
  /// this account. The output lists all webhooks and includes the webhook URL
  /// and ARN and the configuration for each webhook.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned nextToken value.
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous ListWebhooks call, which can
  /// be used to return the next set of webhooks in the list.
  Future<ListWebhooksOutput> listWebhooks({
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
      'X-Amz-Target': 'CodePipeline_20150709.ListWebhooks'
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
      },
    );

    return ListWebhooksOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about any jobs for CodePipeline to act on.
  /// <code>PollForJobs</code> is valid only for action types with "Custom" in
  /// the owner field. If the action type contains <code>AWS</code> or
  /// <code>ThirdParty</code> in the owner field, the <code>PollForJobs</code>
  /// action returns an error.
  /// <important>
  /// When this API is called, CodePipeline returns temporary credentials for
  /// the S3 bucket used to store artifacts for the pipeline, if the action
  /// requires access to that S3 bucket for input or output artifacts. This API
  /// also returns any secret values defined for the action.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ActionTypeNotFoundException].
  ///
  /// Parameter [actionTypeId] :
  /// Represents information about an action type.
  ///
  /// Parameter [maxBatchSize] :
  /// The maximum number of jobs to return in a poll for jobs call.
  ///
  /// Parameter [queryParam] :
  /// A map of property names and values. For an action type with no queryable
  /// properties, this value must be null or an empty map. For an action type
  /// with a queryable property, you must supply that property as a key in the
  /// map. Only jobs whose action configuration matches the mapped value are
  /// returned.
  Future<PollForJobsOutput> pollForJobs({
    required ActionTypeId actionTypeId,
    int? maxBatchSize,
    Map<String, String>? queryParam,
  }) async {
    _s.validateNumRange(
      'maxBatchSize',
      maxBatchSize,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PollForJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionTypeId': actionTypeId,
        if (maxBatchSize != null) 'maxBatchSize': maxBatchSize,
        if (queryParam != null) 'queryParam': queryParam,
      },
    );

    return PollForJobsOutput.fromJson(jsonResponse.body);
  }

  /// Determines whether there are any third party jobs for a job worker to act
  /// on. Used for partner actions only.
  /// <important>
  /// When this API is called, CodePipeline returns temporary credentials for
  /// the S3 bucket used to store artifacts for the pipeline, if the action
  /// requires access to that S3 bucket for input or output artifacts.
  /// </important>
  ///
  /// May throw [ActionTypeNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionTypeId] :
  /// Represents information about an action type.
  ///
  /// Parameter [maxBatchSize] :
  /// The maximum number of jobs to return in a poll for jobs call.
  Future<PollForThirdPartyJobsOutput> pollForThirdPartyJobs({
    required ActionTypeId actionTypeId,
    int? maxBatchSize,
  }) async {
    _s.validateNumRange(
      'maxBatchSize',
      maxBatchSize,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PollForThirdPartyJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionTypeId': actionTypeId,
        if (maxBatchSize != null) 'maxBatchSize': maxBatchSize,
      },
    );

    return PollForThirdPartyJobsOutput.fromJson(jsonResponse.body);
  }

  /// Provides information to CodePipeline about new revisions to a source.
  ///
  /// May throw [PipelineNotFoundException].
  /// May throw [StageNotFoundException].
  /// May throw [ActionNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionName] :
  /// The name of the action that processes the revision.
  ///
  /// Parameter [actionRevision] :
  /// Represents information about the version (or revision) of an action.
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline that starts processing the revision to the
  /// source.
  ///
  /// Parameter [stageName] :
  /// The name of the stage that contains the action that acts on the revision.
  Future<PutActionRevisionOutput> putActionRevision({
    required String actionName,
    required ActionRevision actionRevision,
    required String pipelineName,
    required String stageName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutActionRevision'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionName': actionName,
        'actionRevision': actionRevision,
        'pipelineName': pipelineName,
        'stageName': stageName,
      },
    );

    return PutActionRevisionOutput.fromJson(jsonResponse.body);
  }

  /// Provides the response to a manual approval request to CodePipeline. Valid
  /// responses include Approved and Rejected.
  ///
  /// May throw [InvalidApprovalTokenException].
  /// May throw [ApprovalAlreadyCompletedException].
  /// May throw [PipelineNotFoundException].
  /// May throw [StageNotFoundException].
  /// May throw [ActionNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionName] :
  /// The name of the action for which approval is requested.
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline that contains the action.
  ///
  /// Parameter [result] :
  /// Represents information about the result of the approval request.
  ///
  /// Parameter [stageName] :
  /// The name of the stage that contains the action.
  ///
  /// Parameter [token] :
  /// The system-generated token used to identify a unique approval request. The
  /// token for each open approval request can be obtained using the
  /// <a>GetPipelineState</a> action. It is used to validate that the approval
  /// request corresponding to this token is still valid.
  Future<PutApprovalResultOutput> putApprovalResult({
    required String actionName,
    required String pipelineName,
    required ApprovalResult result,
    required String stageName,
    required String token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutApprovalResult'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionName': actionName,
        'pipelineName': pipelineName,
        'result': result,
        'stageName': stageName,
        'token': token,
      },
    );

    return PutApprovalResultOutput.fromJson(jsonResponse.body);
  }

  /// Represents the failure of a job as returned to the pipeline by a job
  /// worker. Used for custom actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [JobNotFoundException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [failureDetails] :
  /// The details about the failure of a job.
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID of the job that failed. This is the same ID
  /// returned from <code>PollForJobs</code>.
  Future<void> putJobFailureResult({
    required FailureDetails failureDetails,
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutJobFailureResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'failureDetails': failureDetails,
        'jobId': jobId,
      },
    );
  }

  /// Represents the success of a job as returned to the pipeline by a job
  /// worker. Used for custom actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [JobNotFoundException].
  /// May throw [InvalidJobStateException].
  /// May throw [OutputVariablesSizeExceededException].
  ///
  /// Parameter [jobId] :
  /// The unique system-generated ID of the job that succeeded. This is the same
  /// ID returned from <code>PollForJobs</code>.
  ///
  /// Parameter [continuationToken] :
  /// A token generated by a job worker, such as a CodeDeploy deployment ID,
  /// that a successful job provides to identify a custom action in progress.
  /// Future jobs use this token to identify the running instance of the action.
  /// It can be reused to return more information about the progress of the
  /// custom action. When the action is complete, no continuation token should
  /// be supplied.
  ///
  /// Parameter [currentRevision] :
  /// The ID of the current revision of the artifact successfully worked on by
  /// the job.
  ///
  /// Parameter [executionDetails] :
  /// The execution details of the successful job, such as the actions taken by
  /// the job worker.
  ///
  /// Parameter [outputVariables] :
  /// Key-value pairs produced as output by a job worker that can be made
  /// available to a downstream action configuration.
  /// <code>outputVariables</code> can be included only when there is no
  /// continuation token on the request.
  Future<void> putJobSuccessResult({
    required String jobId,
    String? continuationToken,
    CurrentRevision? currentRevision,
    ExecutionDetails? executionDetails,
    Map<String, String>? outputVariables,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutJobSuccessResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobId': jobId,
        if (continuationToken != null) 'continuationToken': continuationToken,
        if (currentRevision != null) 'currentRevision': currentRevision,
        if (executionDetails != null) 'executionDetails': executionDetails,
        if (outputVariables != null) 'outputVariables': outputVariables,
      },
    );
  }

  /// Represents the failure of a third party job as returned to the pipeline by
  /// a job worker. Used for partner actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [JobNotFoundException].
  /// May throw [InvalidJobStateException].
  /// May throw [InvalidClientTokenException].
  ///
  /// Parameter [clientToken] :
  /// The clientToken portion of the clientId and clientToken pair used to
  /// verify that the calling entity is allowed access to the job and its
  /// details.
  ///
  /// Parameter [failureDetails] :
  /// Represents information about failure details.
  ///
  /// Parameter [jobId] :
  /// The ID of the job that failed. This is the same ID returned from
  /// <code>PollForThirdPartyJobs</code>.
  Future<void> putThirdPartyJobFailureResult({
    required String clientToken,
    required FailureDetails failureDetails,
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutThirdPartyJobFailureResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clientToken': clientToken,
        'failureDetails': failureDetails,
        'jobId': jobId,
      },
    );
  }

  /// Represents the success of a third party job as returned to the pipeline by
  /// a job worker. Used for partner actions only.
  ///
  /// May throw [ValidationException].
  /// May throw [JobNotFoundException].
  /// May throw [InvalidJobStateException].
  /// May throw [InvalidClientTokenException].
  ///
  /// Parameter [clientToken] :
  /// The clientToken portion of the clientId and clientToken pair used to
  /// verify that the calling entity is allowed access to the job and its
  /// details.
  ///
  /// Parameter [jobId] :
  /// The ID of the job that successfully completed. This is the same ID
  /// returned from <code>PollForThirdPartyJobs</code>.
  ///
  /// Parameter [continuationToken] :
  /// A token generated by a job worker, such as a CodeDeploy deployment ID,
  /// that a successful job provides to identify a partner action in progress.
  /// Future jobs use this token to identify the running instance of the action.
  /// It can be reused to return more information about the progress of the
  /// partner action. When the action is complete, no continuation token should
  /// be supplied.
  ///
  /// Parameter [currentRevision] :
  /// Represents information about a current revision.
  ///
  /// Parameter [executionDetails] :
  /// The details of the actions taken and results produced on an artifact as it
  /// passes through stages in the pipeline.
  Future<void> putThirdPartyJobSuccessResult({
    required String clientToken,
    required String jobId,
    String? continuationToken,
    CurrentRevision? currentRevision,
    ExecutionDetails? executionDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutThirdPartyJobSuccessResult'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'clientToken': clientToken,
        'jobId': jobId,
        if (continuationToken != null) 'continuationToken': continuationToken,
        if (currentRevision != null) 'currentRevision': currentRevision,
        if (executionDetails != null) 'executionDetails': executionDetails,
      },
    );
  }

  /// Defines a webhook and returns a unique webhook URL generated by
  /// CodePipeline. This URL can be supplied to third party source hosting
  /// providers to call every time there's a code change. When CodePipeline
  /// receives a POST request on this URL, the pipeline defined in the webhook
  /// is started as long as the POST request satisfied the authentication and
  /// filtering requirements supplied when defining the webhook.
  /// RegisterWebhookWithThirdParty and DeregisterWebhookWithThirdParty APIs can
  /// be used to automatically configure supported third parties to call the
  /// generated webhook URL.
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidWebhookFilterPatternException].
  /// May throw [InvalidWebhookAuthenticationParametersException].
  /// May throw [PipelineNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [webhook] :
  /// The detail provided in an input file to create the webhook, such as the
  /// webhook name, the pipeline name, and the action name. Give the webhook a
  /// unique name that helps you identify it. You might name the webhook after
  /// the pipeline and action it targets so that you can easily recognize what
  /// it's used for later.
  ///
  /// Parameter [tags] :
  /// The tags for the webhook.
  Future<PutWebhookOutput> putWebhook({
    required WebhookDefinition webhook,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.PutWebhook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'webhook': webhook,
        if (tags != null) 'tags': tags,
      },
    );

    return PutWebhookOutput.fromJson(jsonResponse.body);
  }

  /// Configures a connection between the webhook that was created and the
  /// external tool with events to be detected.
  ///
  /// May throw [ValidationException].
  /// May throw [WebhookNotFoundException].
  ///
  /// Parameter [webhookName] :
  /// The name of an existing webhook created with PutWebhook to register with a
  /// supported third party.
  Future<void> registerWebhookWithThirdParty({
    String? webhookName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.RegisterWebhookWithThirdParty'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (webhookName != null) 'webhookName': webhookName,
      },
    );
  }

  /// You can retry a stage that has failed without having to run a pipeline
  /// again from the beginning. You do this by either retrying the failed
  /// actions in a stage or by retrying all actions in the stage starting from
  /// the first action in the stage. When you retry the failed actions in a
  /// stage, all actions that are still in progress continue working, and failed
  /// actions are triggered again. When you retry a failed stage from the first
  /// action in the stage, the stage cannot have any actions in progress. Before
  /// a stage can be retried, it must either have all actions failed or some
  /// actions failed and some succeeded.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PipelineNotFoundException].
  /// May throw [StageNotFoundException].
  /// May throw [StageNotRetryableException].
  /// May throw [NotLatestPipelineExecutionException].
  ///
  /// Parameter [pipelineExecutionId] :
  /// The ID of the pipeline execution in the failed stage to be retried. Use
  /// the <a>GetPipelineState</a> action to retrieve the current
  /// pipelineExecutionId of the failed stage
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline that contains the failed stage.
  ///
  /// Parameter [retryMode] :
  /// The scope of the retry attempt.
  ///
  /// Parameter [stageName] :
  /// The name of the failed stage to be retried.
  Future<RetryStageExecutionOutput> retryStageExecution({
    required String pipelineExecutionId,
    required String pipelineName,
    required StageRetryMode retryMode,
    required String stageName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.RetryStageExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineExecutionId': pipelineExecutionId,
        'pipelineName': pipelineName,
        'retryMode': retryMode.toValue(),
        'stageName': stageName,
      },
    );

    return RetryStageExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Rolls back a stage execution.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineExecutionNotFoundException].
  /// May throw [PipelineExecutionOutdatedException].
  /// May throw [StageNotFoundException].
  /// May throw [UnableToRollbackStageException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline for which the stage will be rolled back.
  ///
  /// Parameter [stageName] :
  /// The name of the stage in the pipeline to be rolled back.
  ///
  /// Parameter [targetPipelineExecutionId] :
  /// The pipeline execution ID for the stage to be rolled back to.
  Future<RollbackStageOutput> rollbackStage({
    required String pipelineName,
    required String stageName,
    required String targetPipelineExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.RollbackStage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineName': pipelineName,
        'stageName': stageName,
        'targetPipelineExecutionId': targetPipelineExecutionId,
      },
    );

    return RollbackStageOutput.fromJson(jsonResponse.body);
  }

  /// Starts the specified pipeline. Specifically, it begins processing the
  /// latest commit to the source location specified as part of the pipeline.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PipelineNotFoundException].
  /// May throw [ConcurrentPipelineExecutionsLimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the pipeline to start.
  ///
  /// Parameter [clientRequestToken] :
  /// The system-generated unique ID used to identify a unique execution
  /// request.
  ///
  /// Parameter [sourceRevisions] :
  /// A list that allows you to specify, or override, the source revision for a
  /// pipeline execution that's being started. A source revision is the version
  /// with all the changes to your application code, or source artifact, for the
  /// pipeline execution.
  ///
  /// Parameter [variables] :
  /// A list that overrides pipeline variables for a pipeline execution that's
  /// being started. Variable names must match <code>[A-Za-z0-9@\-_]+</code>,
  /// and the values can be anything except an empty string.
  Future<StartPipelineExecutionOutput> startPipelineExecution({
    required String name,
    String? clientRequestToken,
    List<SourceRevisionOverride>? sourceRevisions,
    List<PipelineVariable>? variables,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.StartPipelineExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'clientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (sourceRevisions != null) 'sourceRevisions': sourceRevisions,
        if (variables != null) 'variables': variables,
      },
    );

    return StartPipelineExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Stops the specified pipeline execution. You choose to either stop the
  /// pipeline execution by completing in-progress actions without starting
  /// subsequent actions, or by abandoning in-progress actions. While completing
  /// or abandoning in-progress actions, the pipeline execution is in a
  /// <code>Stopping</code> state. After all in-progress actions are completed
  /// or abandoned, the pipeline execution is in a <code>Stopped</code> state.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [PipelineNotFoundException].
  /// May throw [PipelineExecutionNotStoppableException].
  /// May throw [DuplicatedStopRequestException].
  ///
  /// Parameter [pipelineExecutionId] :
  /// The ID of the pipeline execution to be stopped in the current stage. Use
  /// the <code>GetPipelineState</code> action to retrieve the current
  /// pipelineExecutionId.
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to stop.
  ///
  /// Parameter [abandon] :
  /// Use this option to stop the pipeline execution by abandoning, rather than
  /// finishing, in-progress actions.
  /// <note>
  /// This option can lead to failed or out-of-sequence tasks.
  /// </note>
  ///
  /// Parameter [reason] :
  /// Use this option to enter comments, such as the reason the pipeline was
  /// stopped.
  Future<StopPipelineExecutionOutput> stopPipelineExecution({
    required String pipelineExecutionId,
    required String pipelineName,
    bool? abandon,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.StopPipelineExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipelineExecutionId': pipelineExecutionId,
        'pipelineName': pipelineName,
        if (abandon != null) 'abandon': abandon,
        if (reason != null) 'reason': reason,
      },
    );

    return StopPipelineExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  ///
  /// Parameter [tags] :
  /// The tags you want to modify or add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes tags from an Amazon Web Services resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of keys for the tags to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates an action type that was created with any supported integration
  /// model, where the action type is to be used by customers of the action type
  /// provider. Use a JSON file with the action definition and
  /// <code>UpdateActionType</code> to provide the full structure.
  ///
  /// May throw [RequestFailedException].
  /// May throw [ValidationException].
  /// May throw [ActionTypeNotFoundException].
  ///
  /// Parameter [actionType] :
  /// The action type definition for the action type to be updated.
  Future<void> updateActionType({
    required ActionTypeDeclaration actionType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.UpdateActionType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionType': actionType,
      },
    );
  }

  /// Updates a specified pipeline with edits or changes to its structure. Use a
  /// JSON file with the pipeline structure and <code>UpdatePipeline</code> to
  /// provide the full structure of the pipeline. Updating the pipeline
  /// increases the version number of the pipeline by 1.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidStageDeclarationException].
  /// May throw [InvalidActionDeclarationException].
  /// May throw [InvalidBlockerDeclarationException].
  /// May throw [InvalidStructureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [pipeline] :
  /// The name of the pipeline to be updated.
  Future<UpdatePipelineOutput> updatePipeline({
    required PipelineDeclaration pipeline,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CodePipeline_20150709.UpdatePipeline'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'pipeline': pipeline,
      },
    );

    return UpdatePipelineOutput.fromJson(jsonResponse.body);
  }
}

/// Represents an Amazon Web Services session credentials object. These
/// credentials are temporary credentials that are issued by Amazon Web Services
/// Secure Token Service (STS). They can be used to access input and output
/// artifacts in the S3 bucket used to store artifact for the pipeline in
/// CodePipeline.
class AWSSessionCredentials {
  /// The access key for the session.
  final String accessKeyId;

  /// The secret access key for the session.
  final String secretAccessKey;

  /// The token for the session.
  final String sessionToken;

  AWSSessionCredentials({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.sessionToken,
  });

  factory AWSSessionCredentials.fromJson(Map<String, dynamic> json) {
    return AWSSessionCredentials(
      accessKeyId: json['accessKeyId'] as String,
      secretAccessKey: json['secretAccessKey'] as String,
      sessionToken: json['sessionToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      'accessKeyId': accessKeyId,
      'secretAccessKey': secretAccessKey,
      'sessionToken': sessionToken,
    };
  }
}

/// Represents the output of an AcknowledgeJob action.
class AcknowledgeJobOutput {
  /// Whether the job worker has received the specified job.
  final JobStatus? status;

  AcknowledgeJobOutput({
    this.status,
  });

  factory AcknowledgeJobOutput.fromJson(Map<String, dynamic> json) {
    return AcknowledgeJobOutput(
      status: (json['status'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Represents the output of an AcknowledgeThirdPartyJob action.
class AcknowledgeThirdPartyJobOutput {
  /// The status information for the third party job, if any.
  final JobStatus? status;

  AcknowledgeThirdPartyJobOutput({
    this.status,
  });

  factory AcknowledgeThirdPartyJobOutput.fromJson(Map<String, dynamic> json) {
    return AcknowledgeThirdPartyJobOutput(
      status: (json['status'] as String?)?.toJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ActionCategory {
  source,
  build,
  deploy,
  test,
  invoke,
  approval,
}

extension ActionCategoryValueExtension on ActionCategory {
  String toValue() {
    switch (this) {
      case ActionCategory.source:
        return 'Source';
      case ActionCategory.build:
        return 'Build';
      case ActionCategory.deploy:
        return 'Deploy';
      case ActionCategory.test:
        return 'Test';
      case ActionCategory.invoke:
        return 'Invoke';
      case ActionCategory.approval:
        return 'Approval';
    }
  }
}

extension ActionCategoryFromString on String {
  ActionCategory toActionCategory() {
    switch (this) {
      case 'Source':
        return ActionCategory.source;
      case 'Build':
        return ActionCategory.build;
      case 'Deploy':
        return ActionCategory.deploy;
      case 'Test':
        return ActionCategory.test;
      case 'Invoke':
        return ActionCategory.invoke;
      case 'Approval':
        return ActionCategory.approval;
    }
    throw Exception('$this is not known in enum ActionCategory');
  }
}

/// Represents information about an action configuration.
class ActionConfiguration {
  /// The configuration data for the action.
  final Map<String, String>? configuration;

  ActionConfiguration({
    this.configuration,
  });

  factory ActionConfiguration.fromJson(Map<String, dynamic> json) {
    return ActionConfiguration(
      configuration: (json['configuration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// Represents information about an action configuration property.
class ActionConfigurationProperty {
  /// Whether the configuration property is a key.
  final bool key;

  /// The name of the action configuration property.
  final String name;

  /// Whether the configuration property is a required value.
  final bool required;

  /// Whether the configuration property is secret. Secrets are hidden from all
  /// calls except for <code>GetJobDetails</code>,
  /// <code>GetThirdPartyJobDetails</code>, <code>PollForJobs</code>, and
  /// <code>PollForThirdPartyJobs</code>.
  ///
  /// When updating a pipeline, passing * * * * * without changing any other
  /// values of the action preserves the previous value of the secret.
  final bool secret;

  /// The description of the action configuration property that is displayed to
  /// users.
  final String? description;

  /// Indicates that the property is used with <code>PollForJobs</code>. When
  /// creating a custom action, an action can have up to one queryable property.
  /// If it has one, that property must be both required and not secret.
  ///
  /// If you create a pipeline with a custom action type, and that custom action
  /// contains a queryable property, the value for that configuration property is
  /// subject to other restrictions. The value must be less than or equal to
  /// twenty (20) characters. The value can contain only alphanumeric characters,
  /// underscores, and hyphens.
  final bool? queryable;

  /// The type of the configuration property.
  final ActionConfigurationPropertyType? type;

  ActionConfigurationProperty({
    required this.key,
    required this.name,
    required this.required,
    required this.secret,
    this.description,
    this.queryable,
    this.type,
  });

  factory ActionConfigurationProperty.fromJson(Map<String, dynamic> json) {
    return ActionConfigurationProperty(
      key: json['key'] as bool,
      name: json['name'] as String,
      required: json['required'] as bool,
      secret: json['secret'] as bool,
      description: json['description'] as String?,
      queryable: json['queryable'] as bool?,
      type: (json['type'] as String?)?.toActionConfigurationPropertyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final name = this.name;
    final required = this.required;
    final secret = this.secret;
    final description = this.description;
    final queryable = this.queryable;
    final type = this.type;
    return {
      'key': key,
      'name': name,
      'required': required,
      'secret': secret,
      if (description != null) 'description': description,
      if (queryable != null) 'queryable': queryable,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ActionConfigurationPropertyType {
  string,
  number,
  boolean,
}

extension ActionConfigurationPropertyTypeValueExtension
    on ActionConfigurationPropertyType {
  String toValue() {
    switch (this) {
      case ActionConfigurationPropertyType.string:
        return 'String';
      case ActionConfigurationPropertyType.number:
        return 'Number';
      case ActionConfigurationPropertyType.boolean:
        return 'Boolean';
    }
  }
}

extension ActionConfigurationPropertyTypeFromString on String {
  ActionConfigurationPropertyType toActionConfigurationPropertyType() {
    switch (this) {
      case 'String':
        return ActionConfigurationPropertyType.string;
      case 'Number':
        return ActionConfigurationPropertyType.number;
      case 'Boolean':
        return ActionConfigurationPropertyType.boolean;
    }
    throw Exception(
        '$this is not known in enum ActionConfigurationPropertyType');
  }
}

/// Represents the context of an action in the stage of a pipeline to a job
/// worker.
class ActionContext {
  /// The system-generated unique ID that corresponds to an action's execution.
  final String? actionExecutionId;

  /// The name of the action in the context of a job.
  final String? name;

  ActionContext({
    this.actionExecutionId,
    this.name,
  });

  factory ActionContext.fromJson(Map<String, dynamic> json) {
    return ActionContext(
      actionExecutionId: json['actionExecutionId'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionExecutionId = this.actionExecutionId;
    final name = this.name;
    return {
      if (actionExecutionId != null) 'actionExecutionId': actionExecutionId,
      if (name != null) 'name': name,
    };
  }
}

/// Represents information about an action declaration.
class ActionDeclaration {
  /// Specifies the action type and the provider of the action.
  final ActionTypeId actionTypeId;

  /// The action declaration's name.
  final String name;

  /// The action's configuration. These are key-value pairs that specify input
  /// values for an action. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements">Action
  /// Structure Requirements in CodePipeline</a>. For the list of configuration
  /// properties for the CloudFormation action type in CodePipeline, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-action-reference.html">Configuration
  /// Properties Reference</a> in the <i>CloudFormation User Guide</i>. For
  /// template snippets with examples, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-parameter-override-functions.html">Using
  /// Parameter Override Functions with CodePipeline Pipelines</a> in the
  /// <i>CloudFormation User Guide</i>.
  ///
  /// The values can be represented in either JSON or YAML format. For example,
  /// the JSON configuration item format is as follows:
  ///
  /// <i>JSON:</i>
  ///
  /// <code>"Configuration" : { Key : Value },</code>
  final Map<String, String>? configuration;

  /// The name or ID of the artifact consumed by the action, such as a test or
  /// build artifact.
  final List<InputArtifact>? inputArtifacts;

  /// The variable namespace associated with the action. All variables produced as
  /// output by this action fall under this namespace.
  final String? namespace;

  /// The name or ID of the result of the action declaration, such as a test or
  /// build artifact.
  final List<OutputArtifact>? outputArtifacts;

  /// The action declaration's Amazon Web Services Region, such as us-east-1.
  final String? region;

  /// The ARN of the IAM service role that performs the declared action. This is
  /// assumed through the roleArn for the pipeline.
  final String? roleArn;

  /// The order in which actions are run.
  final int? runOrder;

  /// A timeout duration in minutes that can be applied against the ActionType’s
  /// default timeout value specified in <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/limits.html">Quotas
  /// for CodePipeline </a>. This attribute is available only to the manual
  /// approval ActionType.
  final int? timeoutInMinutes;

  ActionDeclaration({
    required this.actionTypeId,
    required this.name,
    this.configuration,
    this.inputArtifacts,
    this.namespace,
    this.outputArtifacts,
    this.region,
    this.roleArn,
    this.runOrder,
    this.timeoutInMinutes,
  });

  factory ActionDeclaration.fromJson(Map<String, dynamic> json) {
    return ActionDeclaration(
      actionTypeId:
          ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>),
      name: json['name'] as String,
      configuration: (json['configuration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inputArtifacts: (json['inputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => InputArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['namespace'] as String?,
      outputArtifacts: (json['outputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => OutputArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['region'] as String?,
      roleArn: json['roleArn'] as String?,
      runOrder: json['runOrder'] as int?,
      timeoutInMinutes: json['timeoutInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTypeId = this.actionTypeId;
    final name = this.name;
    final configuration = this.configuration;
    final inputArtifacts = this.inputArtifacts;
    final namespace = this.namespace;
    final outputArtifacts = this.outputArtifacts;
    final region = this.region;
    final roleArn = this.roleArn;
    final runOrder = this.runOrder;
    final timeoutInMinutes = this.timeoutInMinutes;
    return {
      'actionTypeId': actionTypeId,
      'name': name,
      if (configuration != null) 'configuration': configuration,
      if (inputArtifacts != null) 'inputArtifacts': inputArtifacts,
      if (namespace != null) 'namespace': namespace,
      if (outputArtifacts != null) 'outputArtifacts': outputArtifacts,
      if (region != null) 'region': region,
      if (roleArn != null) 'roleArn': roleArn,
      if (runOrder != null) 'runOrder': runOrder,
      if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
    };
  }
}

/// Represents information about the run of an action.
class ActionExecution {
  /// ID of the workflow action execution in the current stage. Use the
  /// <a>GetPipelineState</a> action to retrieve the current action execution
  /// details of the current stage.
  /// <note>
  /// For older executions, this field might be empty. The action execution ID is
  /// available for executions run on or after March 2020.
  /// </note>
  final String? actionExecutionId;

  /// The details of an error returned by a URL external to Amazon Web Services.
  final ErrorDetails? errorDetails;

  /// The external ID of the run of the action.
  final String? externalExecutionId;

  /// The URL of a resource external to Amazon Web Services that is used when
  /// running the action (for example, an external repository URL).
  final String? externalExecutionUrl;

  /// The last status change of the action.
  final DateTime? lastStatusChange;

  /// The ARN of the user who last changed the pipeline.
  final String? lastUpdatedBy;

  /// A percentage of completeness of the action as it runs.
  final int? percentComplete;

  /// The status of the action, or for a completed action, the last status of the
  /// action.
  final ActionExecutionStatus? status;

  /// A summary of the run of the action.
  final String? summary;

  /// The system-generated token used to identify a unique approval request. The
  /// token for each open approval request can be obtained using the
  /// <code>GetPipelineState</code> command. It is used to validate that the
  /// approval request corresponding to this token is still valid.
  final String? token;

  ActionExecution({
    this.actionExecutionId,
    this.errorDetails,
    this.externalExecutionId,
    this.externalExecutionUrl,
    this.lastStatusChange,
    this.lastUpdatedBy,
    this.percentComplete,
    this.status,
    this.summary,
    this.token,
  });

  factory ActionExecution.fromJson(Map<String, dynamic> json) {
    return ActionExecution(
      actionExecutionId: json['actionExecutionId'] as String?,
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      externalExecutionId: json['externalExecutionId'] as String?,
      externalExecutionUrl: json['externalExecutionUrl'] as String?,
      lastStatusChange: timeStampFromJson(json['lastStatusChange']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      percentComplete: json['percentComplete'] as int?,
      status: (json['status'] as String?)?.toActionExecutionStatus(),
      summary: json['summary'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionExecutionId = this.actionExecutionId;
    final errorDetails = this.errorDetails;
    final externalExecutionId = this.externalExecutionId;
    final externalExecutionUrl = this.externalExecutionUrl;
    final lastStatusChange = this.lastStatusChange;
    final lastUpdatedBy = this.lastUpdatedBy;
    final percentComplete = this.percentComplete;
    final status = this.status;
    final summary = this.summary;
    final token = this.token;
    return {
      if (actionExecutionId != null) 'actionExecutionId': actionExecutionId,
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (externalExecutionId != null)
        'externalExecutionId': externalExecutionId,
      if (externalExecutionUrl != null)
        'externalExecutionUrl': externalExecutionUrl,
      if (lastStatusChange != null)
        'lastStatusChange': unixTimestampToJson(lastStatusChange),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (percentComplete != null) 'percentComplete': percentComplete,
      if (status != null) 'status': status.toValue(),
      if (summary != null) 'summary': summary,
      if (token != null) 'token': token,
    };
  }
}

/// Returns information about an execution of an action, including the action
/// execution ID, and the name, version, and timing of the action.
class ActionExecutionDetail {
  /// The action execution ID.
  final String? actionExecutionId;

  /// The name of the action.
  final String? actionName;

  /// Input details for the action execution, such as role ARN, Region, and input
  /// artifacts.
  final ActionExecutionInput? input;

  /// The last update time of the action execution.
  final DateTime? lastUpdateTime;

  /// Output details for the action execution, such as the action execution
  /// result.
  final ActionExecutionOutput? output;

  /// The pipeline execution ID for the action execution.
  final String? pipelineExecutionId;

  /// The version of the pipeline where the action was run.
  final int? pipelineVersion;

  /// The name of the stage that contains the action.
  final String? stageName;

  /// The start time of the action execution.
  final DateTime? startTime;

  /// The status of the action execution. Status categories are
  /// <code>InProgress</code>, <code>Succeeded</code>, and <code>Failed</code>.
  final ActionExecutionStatus? status;

  /// The ARN of the user who changed the pipeline execution details.
  final String? updatedBy;

  ActionExecutionDetail({
    this.actionExecutionId,
    this.actionName,
    this.input,
    this.lastUpdateTime,
    this.output,
    this.pipelineExecutionId,
    this.pipelineVersion,
    this.stageName,
    this.startTime,
    this.status,
    this.updatedBy,
  });

  factory ActionExecutionDetail.fromJson(Map<String, dynamic> json) {
    return ActionExecutionDetail(
      actionExecutionId: json['actionExecutionId'] as String?,
      actionName: json['actionName'] as String?,
      input: json['input'] != null
          ? ActionExecutionInput.fromJson(json['input'] as Map<String, dynamic>)
          : null,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      output: json['output'] != null
          ? ActionExecutionOutput.fromJson(
              json['output'] as Map<String, dynamic>)
          : null,
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
      pipelineVersion: json['pipelineVersion'] as int?,
      stageName: json['stageName'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toActionExecutionStatus(),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionExecutionId = this.actionExecutionId;
    final actionName = this.actionName;
    final input = this.input;
    final lastUpdateTime = this.lastUpdateTime;
    final output = this.output;
    final pipelineExecutionId = this.pipelineExecutionId;
    final pipelineVersion = this.pipelineVersion;
    final stageName = this.stageName;
    final startTime = this.startTime;
    final status = this.status;
    final updatedBy = this.updatedBy;
    return {
      if (actionExecutionId != null) 'actionExecutionId': actionExecutionId,
      if (actionName != null) 'actionName': actionName,
      if (input != null) 'input': input,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (output != null) 'output': output,
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
      if (pipelineVersion != null) 'pipelineVersion': pipelineVersion,
      if (stageName != null) 'stageName': stageName,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Filter values for the action execution.
class ActionExecutionFilter {
  /// The latest execution in the pipeline.
  /// <note>
  /// Filtering on the latest execution is available for executions run on or
  /// after February 08, 2024.
  /// </note>
  final LatestInPipelineExecutionFilter? latestInPipelineExecution;

  /// The pipeline execution ID used to filter action execution history.
  final String? pipelineExecutionId;

  ActionExecutionFilter({
    this.latestInPipelineExecution,
    this.pipelineExecutionId,
  });

  Map<String, dynamic> toJson() {
    final latestInPipelineExecution = this.latestInPipelineExecution;
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      if (latestInPipelineExecution != null)
        'latestInPipelineExecution': latestInPipelineExecution,
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

/// Input information used for an action execution.
class ActionExecutionInput {
  final ActionTypeId? actionTypeId;

  /// Configuration data for an action execution.
  final Map<String, String>? configuration;

  /// Details of input artifacts of the action that correspond to the action
  /// execution.
  final List<ArtifactDetail>? inputArtifacts;

  /// The variable namespace associated with the action. All variables produced as
  /// output by this action fall under this namespace.
  final String? namespace;

  /// The Amazon Web Services Region for the action, such as us-east-1.
  final String? region;

  /// Configuration data for an action execution with all variable references
  /// replaced with their real values for the execution.
  final Map<String, String>? resolvedConfiguration;

  /// The ARN of the IAM service role that performs the declared action. This is
  /// assumed through the roleArn for the pipeline.
  final String? roleArn;

  ActionExecutionInput({
    this.actionTypeId,
    this.configuration,
    this.inputArtifacts,
    this.namespace,
    this.region,
    this.resolvedConfiguration,
    this.roleArn,
  });

  factory ActionExecutionInput.fromJson(Map<String, dynamic> json) {
    return ActionExecutionInput(
      actionTypeId: json['actionTypeId'] != null
          ? ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>)
          : null,
      configuration: (json['configuration'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      inputArtifacts: (json['inputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ArtifactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['namespace'] as String?,
      region: json['region'] as String?,
      resolvedConfiguration:
          (json['resolvedConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTypeId = this.actionTypeId;
    final configuration = this.configuration;
    final inputArtifacts = this.inputArtifacts;
    final namespace = this.namespace;
    final region = this.region;
    final resolvedConfiguration = this.resolvedConfiguration;
    final roleArn = this.roleArn;
    return {
      if (actionTypeId != null) 'actionTypeId': actionTypeId,
      if (configuration != null) 'configuration': configuration,
      if (inputArtifacts != null) 'inputArtifacts': inputArtifacts,
      if (namespace != null) 'namespace': namespace,
      if (region != null) 'region': region,
      if (resolvedConfiguration != null)
        'resolvedConfiguration': resolvedConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// Output details listed for an action execution, such as the action execution
/// result.
class ActionExecutionOutput {
  /// Execution result information listed in the output details for an action
  /// execution.
  final ActionExecutionResult? executionResult;

  /// Details of output artifacts of the action that correspond to the action
  /// execution.
  final List<ArtifactDetail>? outputArtifacts;

  /// The outputVariables field shows the key-value pairs that were output as part
  /// of that execution.
  final Map<String, String>? outputVariables;

  ActionExecutionOutput({
    this.executionResult,
    this.outputArtifacts,
    this.outputVariables,
  });

  factory ActionExecutionOutput.fromJson(Map<String, dynamic> json) {
    return ActionExecutionOutput(
      executionResult: json['executionResult'] != null
          ? ActionExecutionResult.fromJson(
              json['executionResult'] as Map<String, dynamic>)
          : null,
      outputArtifacts: (json['outputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => ArtifactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputVariables: (json['outputVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final executionResult = this.executionResult;
    final outputArtifacts = this.outputArtifacts;
    final outputVariables = this.outputVariables;
    return {
      if (executionResult != null) 'executionResult': executionResult,
      if (outputArtifacts != null) 'outputArtifacts': outputArtifacts,
      if (outputVariables != null) 'outputVariables': outputVariables,
    };
  }
}

/// Execution result information, such as the external execution ID.
class ActionExecutionResult {
  final ErrorDetails? errorDetails;

  /// The action provider's external ID for the action execution.
  final String? externalExecutionId;

  /// The action provider's summary for the action execution.
  final String? externalExecutionSummary;

  /// The deepest external link to the external resource (for example, a
  /// repository URL or deployment endpoint) that is used when running the action.
  final String? externalExecutionUrl;

  ActionExecutionResult({
    this.errorDetails,
    this.externalExecutionId,
    this.externalExecutionSummary,
    this.externalExecutionUrl,
  });

  factory ActionExecutionResult.fromJson(Map<String, dynamic> json) {
    return ActionExecutionResult(
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'] as Map<String, dynamic>)
          : null,
      externalExecutionId: json['externalExecutionId'] as String?,
      externalExecutionSummary: json['externalExecutionSummary'] as String?,
      externalExecutionUrl: json['externalExecutionUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorDetails = this.errorDetails;
    final externalExecutionId = this.externalExecutionId;
    final externalExecutionSummary = this.externalExecutionSummary;
    final externalExecutionUrl = this.externalExecutionUrl;
    return {
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (externalExecutionId != null)
        'externalExecutionId': externalExecutionId,
      if (externalExecutionSummary != null)
        'externalExecutionSummary': externalExecutionSummary,
      if (externalExecutionUrl != null)
        'externalExecutionUrl': externalExecutionUrl,
    };
  }
}

enum ActionExecutionStatus {
  inProgress,
  abandoned,
  succeeded,
  failed,
}

extension ActionExecutionStatusValueExtension on ActionExecutionStatus {
  String toValue() {
    switch (this) {
      case ActionExecutionStatus.inProgress:
        return 'InProgress';
      case ActionExecutionStatus.abandoned:
        return 'Abandoned';
      case ActionExecutionStatus.succeeded:
        return 'Succeeded';
      case ActionExecutionStatus.failed:
        return 'Failed';
    }
  }
}

extension ActionExecutionStatusFromString on String {
  ActionExecutionStatus toActionExecutionStatus() {
    switch (this) {
      case 'InProgress':
        return ActionExecutionStatus.inProgress;
      case 'Abandoned':
        return ActionExecutionStatus.abandoned;
      case 'Succeeded':
        return ActionExecutionStatus.succeeded;
      case 'Failed':
        return ActionExecutionStatus.failed;
    }
    throw Exception('$this is not known in enum ActionExecutionStatus');
  }
}

enum ActionOwner {
  aws,
  thirdParty,
  custom,
}

extension ActionOwnerValueExtension on ActionOwner {
  String toValue() {
    switch (this) {
      case ActionOwner.aws:
        return 'AWS';
      case ActionOwner.thirdParty:
        return 'ThirdParty';
      case ActionOwner.custom:
        return 'Custom';
    }
  }
}

extension ActionOwnerFromString on String {
  ActionOwner toActionOwner() {
    switch (this) {
      case 'AWS':
        return ActionOwner.aws;
      case 'ThirdParty':
        return ActionOwner.thirdParty;
      case 'Custom':
        return ActionOwner.custom;
    }
    throw Exception('$this is not known in enum ActionOwner');
  }
}

/// Represents information about the version (or revision) of an action.
class ActionRevision {
  /// The date and time when the most recent version of the action was created, in
  /// timestamp format.
  final DateTime created;

  /// The unique identifier of the change that set the state to this revision (for
  /// example, a deployment ID or timestamp).
  final String revisionChangeId;

  /// The system-generated unique ID that identifies the revision number of the
  /// action.
  final String revisionId;

  ActionRevision({
    required this.created,
    required this.revisionChangeId,
    required this.revisionId,
  });

  factory ActionRevision.fromJson(Map<String, dynamic> json) {
    return ActionRevision(
      created: nonNullableTimeStampFromJson(json['created'] as Object),
      revisionChangeId: json['revisionChangeId'] as String,
      revisionId: json['revisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final revisionChangeId = this.revisionChangeId;
    final revisionId = this.revisionId;
    return {
      'created': unixTimestampToJson(created),
      'revisionChangeId': revisionChangeId,
      'revisionId': revisionId,
    };
  }
}

/// Represents information about the state of an action.
class ActionState {
  /// The name of the action.
  final String? actionName;

  /// Represents information about the version (or revision) of an action.
  final ActionRevision? currentRevision;

  /// A URL link for more information about the state of the action, such as a
  /// deployment group details page.
  final String? entityUrl;

  /// Represents information about the run of an action.
  final ActionExecution? latestExecution;

  /// A URL link for more information about the revision, such as a commit details
  /// page.
  final String? revisionUrl;

  ActionState({
    this.actionName,
    this.currentRevision,
    this.entityUrl,
    this.latestExecution,
    this.revisionUrl,
  });

  factory ActionState.fromJson(Map<String, dynamic> json) {
    return ActionState(
      actionName: json['actionName'] as String?,
      currentRevision: json['currentRevision'] != null
          ? ActionRevision.fromJson(
              json['currentRevision'] as Map<String, dynamic>)
          : null,
      entityUrl: json['entityUrl'] as String?,
      latestExecution: json['latestExecution'] != null
          ? ActionExecution.fromJson(
              json['latestExecution'] as Map<String, dynamic>)
          : null,
      revisionUrl: json['revisionUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final currentRevision = this.currentRevision;
    final entityUrl = this.entityUrl;
    final latestExecution = this.latestExecution;
    final revisionUrl = this.revisionUrl;
    return {
      if (actionName != null) 'actionName': actionName,
      if (currentRevision != null) 'currentRevision': currentRevision,
      if (entityUrl != null) 'entityUrl': entityUrl,
      if (latestExecution != null) 'latestExecution': latestExecution,
      if (revisionUrl != null) 'revisionUrl': revisionUrl,
    };
  }
}

/// Returns information about the details of an action type.
class ActionType {
  /// Represents information about an action type.
  final ActionTypeId id;

  /// The details of the input artifact for the action, such as its commit ID.
  final ArtifactDetails inputArtifactDetails;

  /// The details of the output artifact of the action, such as its commit ID.
  final ArtifactDetails outputArtifactDetails;

  /// The configuration properties for the action type.
  final List<ActionConfigurationProperty>? actionConfigurationProperties;

  /// The settings for the action type.
  final ActionTypeSettings? settings;

  ActionType({
    required this.id,
    required this.inputArtifactDetails,
    required this.outputArtifactDetails,
    this.actionConfigurationProperties,
    this.settings,
  });

  factory ActionType.fromJson(Map<String, dynamic> json) {
    return ActionType(
      id: ActionTypeId.fromJson(json['id'] as Map<String, dynamic>),
      inputArtifactDetails: ArtifactDetails.fromJson(
          json['inputArtifactDetails'] as Map<String, dynamic>),
      outputArtifactDetails: ArtifactDetails.fromJson(
          json['outputArtifactDetails'] as Map<String, dynamic>),
      actionConfigurationProperties: (json['actionConfigurationProperties']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ActionConfigurationProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] != null
          ? ActionTypeSettings.fromJson(
              json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final inputArtifactDetails = this.inputArtifactDetails;
    final outputArtifactDetails = this.outputArtifactDetails;
    final actionConfigurationProperties = this.actionConfigurationProperties;
    final settings = this.settings;
    return {
      'id': id,
      'inputArtifactDetails': inputArtifactDetails,
      'outputArtifactDetails': outputArtifactDetails,
      if (actionConfigurationProperties != null)
        'actionConfigurationProperties': actionConfigurationProperties,
      if (settings != null) 'settings': settings,
    };
  }
}

/// Information about parameters for artifacts associated with the action type,
/// such as the minimum and maximum artifacts allowed.
class ActionTypeArtifactDetails {
  /// The maximum number of artifacts that can be used with the actiontype. For
  /// example, you should specify a minimum and maximum of zero input artifacts
  /// for an action type with a category of <code>source</code>.
  final int maximumCount;

  /// The minimum number of artifacts that can be used with the action type. For
  /// example, you should specify a minimum and maximum of zero input artifacts
  /// for an action type with a category of <code>source</code>.
  final int minimumCount;

  ActionTypeArtifactDetails({
    required this.maximumCount,
    required this.minimumCount,
  });

  factory ActionTypeArtifactDetails.fromJson(Map<String, dynamic> json) {
    return ActionTypeArtifactDetails(
      maximumCount: json['maximumCount'] as int,
      minimumCount: json['minimumCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumCount = this.maximumCount;
    final minimumCount = this.minimumCount;
    return {
      'maximumCount': maximumCount,
      'minimumCount': minimumCount,
    };
  }
}

/// The parameters for the action type definition that are provided when the
/// action type is created or updated.
class ActionTypeDeclaration {
  /// Information about the executor for an action type that was created with any
  /// supported integration model.
  final ActionTypeExecutor executor;

  /// The action category, owner, provider, and version of the action type to be
  /// updated.
  final ActionTypeIdentifier id;

  /// Details for the artifacts, such as application files, to be worked on by the
  /// action. For example, the minimum and maximum number of input artifacts
  /// allowed.
  final ActionTypeArtifactDetails inputArtifactDetails;

  /// Details for the output artifacts, such as a built application, that are the
  /// result of the action. For example, the minimum and maximum number of output
  /// artifacts allowed.
  final ActionTypeArtifactDetails outputArtifactDetails;

  /// The description for the action type to be updated.
  final String? description;

  /// Details identifying the accounts with permissions to use the action type.
  final ActionTypePermissions? permissions;

  /// The properties of the action type to be updated.
  final List<ActionTypeProperty>? properties;

  /// The links associated with the action type to be updated.
  final ActionTypeUrls? urls;

  ActionTypeDeclaration({
    required this.executor,
    required this.id,
    required this.inputArtifactDetails,
    required this.outputArtifactDetails,
    this.description,
    this.permissions,
    this.properties,
    this.urls,
  });

  factory ActionTypeDeclaration.fromJson(Map<String, dynamic> json) {
    return ActionTypeDeclaration(
      executor:
          ActionTypeExecutor.fromJson(json['executor'] as Map<String, dynamic>),
      id: ActionTypeIdentifier.fromJson(json['id'] as Map<String, dynamic>),
      inputArtifactDetails: ActionTypeArtifactDetails.fromJson(
          json['inputArtifactDetails'] as Map<String, dynamic>),
      outputArtifactDetails: ActionTypeArtifactDetails.fromJson(
          json['outputArtifactDetails'] as Map<String, dynamic>),
      description: json['description'] as String?,
      permissions: json['permissions'] != null
          ? ActionTypePermissions.fromJson(
              json['permissions'] as Map<String, dynamic>)
          : null,
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) => ActionTypeProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      urls: json['urls'] != null
          ? ActionTypeUrls.fromJson(json['urls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executor = this.executor;
    final id = this.id;
    final inputArtifactDetails = this.inputArtifactDetails;
    final outputArtifactDetails = this.outputArtifactDetails;
    final description = this.description;
    final permissions = this.permissions;
    final properties = this.properties;
    final urls = this.urls;
    return {
      'executor': executor,
      'id': id,
      'inputArtifactDetails': inputArtifactDetails,
      'outputArtifactDetails': outputArtifactDetails,
      if (description != null) 'description': description,
      if (permissions != null) 'permissions': permissions,
      if (properties != null) 'properties': properties,
      if (urls != null) 'urls': urls,
    };
  }
}

/// The action engine, or executor, for an action type created for a provider,
/// where the action is to be used by customers of the provider. The action
/// engine is associated with the model used to create and update the action,
/// such as the Lambda integration model.
class ActionTypeExecutor {
  /// The action configuration properties for the action type. These properties
  /// are specified in the action definition when the action type is created.
  final ExecutorConfiguration configuration;

  /// The integration model used to create and update the action type,
  /// <code>Lambda</code> or <code>JobWorker</code>.
  final ExecutorType type;

  /// The timeout in seconds for the job. An action execution can have multiple
  /// jobs. This is the timeout for a single job, not the entire action execution.
  final int? jobTimeout;

  /// The policy statement that specifies the permissions in the CodePipeline
  /// customer account that are needed to successfully run an action.
  ///
  /// To grant permission to another account, specify the account ID as the
  /// Principal, a domain-style identifier defined by the service, for example
  /// <code>codepipeline.amazonaws.com</code>.
  /// <note>
  /// The size of the passed JSON policy document cannot exceed 2048 characters.
  /// </note>
  final String? policyStatementsTemplate;

  ActionTypeExecutor({
    required this.configuration,
    required this.type,
    this.jobTimeout,
    this.policyStatementsTemplate,
  });

  factory ActionTypeExecutor.fromJson(Map<String, dynamic> json) {
    return ActionTypeExecutor(
      configuration: ExecutorConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      type: (json['type'] as String).toExecutorType(),
      jobTimeout: json['jobTimeout'] as int?,
      policyStatementsTemplate: json['policyStatementsTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final type = this.type;
    final jobTimeout = this.jobTimeout;
    final policyStatementsTemplate = this.policyStatementsTemplate;
    return {
      'configuration': configuration,
      'type': type.toValue(),
      if (jobTimeout != null) 'jobTimeout': jobTimeout,
      if (policyStatementsTemplate != null)
        'policyStatementsTemplate': policyStatementsTemplate,
    };
  }
}

/// Represents information about an action type.
class ActionTypeId {
  /// A category defines what kind of action can be taken in the stage, and
  /// constrains the provider type for the action. Valid categories are limited to
  /// one of the following values.
  ///
  /// <ul>
  /// <li>
  /// Source
  /// </li>
  /// <li>
  /// Build
  /// </li>
  /// <li>
  /// Test
  /// </li>
  /// <li>
  /// Deploy
  /// </li>
  /// <li>
  /// Invoke
  /// </li>
  /// <li>
  /// Approval
  /// </li>
  /// </ul>
  final ActionCategory category;

  /// The creator of the action being called. There are three valid values for the
  /// <code>Owner</code> field in the action category section within your pipeline
  /// structure: <code>AWS</code>, <code>ThirdParty</code>, and
  /// <code>Custom</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#actions-valid-providers">Valid
  /// Action Types and Providers in CodePipeline</a>.
  final ActionOwner owner;

  /// The provider of the service being called by the action. Valid providers are
  /// determined by the action category. For example, an action in the Deploy
  /// category type might have a provider of CodeDeploy, which would be specified
  /// as <code>CodeDeploy</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#actions-valid-providers">Valid
  /// Action Types and Providers in CodePipeline</a>.
  final String provider;

  /// A string that describes the action version.
  final String version;

  ActionTypeId({
    required this.category,
    required this.owner,
    required this.provider,
    required this.version,
  });

  factory ActionTypeId.fromJson(Map<String, dynamic> json) {
    return ActionTypeId(
      category: (json['category'] as String).toActionCategory(),
      owner: (json['owner'] as String).toActionOwner(),
      provider: json['provider'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final owner = this.owner;
    final provider = this.provider;
    final version = this.version;
    return {
      'category': category.toValue(),
      'owner': owner.toValue(),
      'provider': provider,
      'version': version,
    };
  }
}

/// Specifies the category, owner, provider, and version of the action type.
class ActionTypeIdentifier {
  /// Defines what kind of action can be taken in the stage, one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Source</code>
  /// </li>
  /// <li>
  /// <code>Build</code>
  /// </li>
  /// <li>
  /// <code>Test</code>
  /// </li>
  /// <li>
  /// <code>Deploy</code>
  /// </li>
  /// <li>
  /// <code>Approval</code>
  /// </li>
  /// <li>
  /// <code>Invoke</code>
  /// </li>
  /// </ul>
  final ActionCategory category;

  /// The creator of the action type being called: <code>AWS</code> or
  /// <code>ThirdParty</code>.
  final String owner;

  /// The provider of the action type being called. The provider name is supplied
  /// when the action type is created.
  final String provider;

  /// A string that describes the action type version.
  final String version;

  ActionTypeIdentifier({
    required this.category,
    required this.owner,
    required this.provider,
    required this.version,
  });

  factory ActionTypeIdentifier.fromJson(Map<String, dynamic> json) {
    return ActionTypeIdentifier(
      category: (json['category'] as String).toActionCategory(),
      owner: json['owner'] as String,
      provider: json['provider'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final owner = this.owner;
    final provider = this.provider;
    final version = this.version;
    return {
      'category': category.toValue(),
      'owner': owner,
      'provider': provider,
      'version': version,
    };
  }
}

/// Details identifying the users with permissions to use the action type.
class ActionTypePermissions {
  /// A list of Amazon Web Services account IDs with access to use the action type
  /// in their pipelines.
  final List<String> allowedAccounts;

  ActionTypePermissions({
    required this.allowedAccounts,
  });

  factory ActionTypePermissions.fromJson(Map<String, dynamic> json) {
    return ActionTypePermissions(
      allowedAccounts: (json['allowedAccounts'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedAccounts = this.allowedAccounts;
    return {
      'allowedAccounts': allowedAccounts,
    };
  }
}

/// Represents information about each property specified in the action
/// configuration, such as the description and key name that display for the
/// customer using the action type.
class ActionTypeProperty {
  /// Whether the configuration property is a key.
  final bool key;

  /// The property name that is displayed to users.
  final String name;

  /// Whether to omit the field value entered by the customer in the log. If
  /// <code>true</code>, the value is not saved in CloudTrail logs for the action
  /// execution.
  final bool noEcho;

  /// Whether the configuration property is an optional value.
  final bool optional;

  /// The description of the property that is displayed to users.
  final String? description;

  /// Indicates that the property is used with polling. An action type can have up
  /// to one queryable property. If it has one, that property must be both
  /// required and not secret.
  final bool? queryable;

  ActionTypeProperty({
    required this.key,
    required this.name,
    required this.noEcho,
    required this.optional,
    this.description,
    this.queryable,
  });

  factory ActionTypeProperty.fromJson(Map<String, dynamic> json) {
    return ActionTypeProperty(
      key: json['key'] as bool,
      name: json['name'] as String,
      noEcho: json['noEcho'] as bool,
      optional: json['optional'] as bool,
      description: json['description'] as String?,
      queryable: json['queryable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final name = this.name;
    final noEcho = this.noEcho;
    final optional = this.optional;
    final description = this.description;
    final queryable = this.queryable;
    return {
      'key': key,
      'name': name,
      'noEcho': noEcho,
      'optional': optional,
      if (description != null) 'description': description,
      if (queryable != null) 'queryable': queryable,
    };
  }
}

/// Returns information about the settings for an action type.
class ActionTypeSettings {
  /// The URL returned to the CodePipeline console that provides a deep link to
  /// the resources of the external system, such as the configuration page for a
  /// CodeDeploy deployment group. This link is provided as part of the action
  /// display in the pipeline.
  final String? entityUrlTemplate;

  /// The URL returned to the CodePipeline console that contains a link to the
  /// top-level landing page for the external system, such as the console page for
  /// CodeDeploy. This link is shown on the pipeline view page in the CodePipeline
  /// console and provides a link to the execution entity of the external action.
  final String? executionUrlTemplate;

  /// The URL returned to the CodePipeline console that contains a link to the
  /// page where customers can update or change the configuration of the external
  /// action.
  final String? revisionUrlTemplate;

  /// The URL of a sign-up page where users can sign up for an external service
  /// and perform initial configuration of the action provided by that service.
  final String? thirdPartyConfigurationUrl;

  ActionTypeSettings({
    this.entityUrlTemplate,
    this.executionUrlTemplate,
    this.revisionUrlTemplate,
    this.thirdPartyConfigurationUrl,
  });

  factory ActionTypeSettings.fromJson(Map<String, dynamic> json) {
    return ActionTypeSettings(
      entityUrlTemplate: json['entityUrlTemplate'] as String?,
      executionUrlTemplate: json['executionUrlTemplate'] as String?,
      revisionUrlTemplate: json['revisionUrlTemplate'] as String?,
      thirdPartyConfigurationUrl: json['thirdPartyConfigurationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityUrlTemplate = this.entityUrlTemplate;
    final executionUrlTemplate = this.executionUrlTemplate;
    final revisionUrlTemplate = this.revisionUrlTemplate;
    final thirdPartyConfigurationUrl = this.thirdPartyConfigurationUrl;
    return {
      if (entityUrlTemplate != null) 'entityUrlTemplate': entityUrlTemplate,
      if (executionUrlTemplate != null)
        'executionUrlTemplate': executionUrlTemplate,
      if (revisionUrlTemplate != null)
        'revisionUrlTemplate': revisionUrlTemplate,
      if (thirdPartyConfigurationUrl != null)
        'thirdPartyConfigurationUrl': thirdPartyConfigurationUrl,
    };
  }
}

/// Returns information about URLs for web pages that display to customers as
/// links on the pipeline view, such as an external configuration page for the
/// action type.
class ActionTypeUrls {
  /// The URL returned to the CodePipeline console that contains a link to the
  /// page where customers can configure the external action.
  final String? configurationUrl;

  /// The URL returned to the CodePipeline console that provides a deep link to
  /// the resources of the external system, such as a status page. This link is
  /// provided as part of the action display in the pipeline.
  final String? entityUrlTemplate;

  /// The link to an execution page for the action type in progress. For example,
  /// for a CodeDeploy action, this link is shown on the pipeline view page in the
  /// CodePipeline console, and it links to a CodeDeploy status page.
  final String? executionUrlTemplate;

  /// The URL returned to the CodePipeline console that contains a link to the
  /// page where customers can update or change the configuration of the external
  /// action.
  final String? revisionUrlTemplate;

  ActionTypeUrls({
    this.configurationUrl,
    this.entityUrlTemplate,
    this.executionUrlTemplate,
    this.revisionUrlTemplate,
  });

  factory ActionTypeUrls.fromJson(Map<String, dynamic> json) {
    return ActionTypeUrls(
      configurationUrl: json['configurationUrl'] as String?,
      entityUrlTemplate: json['entityUrlTemplate'] as String?,
      executionUrlTemplate: json['executionUrlTemplate'] as String?,
      revisionUrlTemplate: json['revisionUrlTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationUrl = this.configurationUrl;
    final entityUrlTemplate = this.entityUrlTemplate;
    final executionUrlTemplate = this.executionUrlTemplate;
    final revisionUrlTemplate = this.revisionUrlTemplate;
    return {
      if (configurationUrl != null) 'configurationUrl': configurationUrl,
      if (entityUrlTemplate != null) 'entityUrlTemplate': entityUrlTemplate,
      if (executionUrlTemplate != null)
        'executionUrlTemplate': executionUrlTemplate,
      if (revisionUrlTemplate != null)
        'revisionUrlTemplate': revisionUrlTemplate,
    };
  }
}

/// Represents information about the result of an approval request.
class ApprovalResult {
  /// The response submitted by a reviewer assigned to an approval action request.
  final ApprovalStatus status;

  /// The summary of the current status of the approval request.
  final String summary;

  ApprovalResult({
    required this.status,
    required this.summary,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final summary = this.summary;
    return {
      'status': status.toValue(),
      'summary': summary,
    };
  }
}

enum ApprovalStatus {
  approved,
  rejected,
}

extension ApprovalStatusValueExtension on ApprovalStatus {
  String toValue() {
    switch (this) {
      case ApprovalStatus.approved:
        return 'Approved';
      case ApprovalStatus.rejected:
        return 'Rejected';
    }
  }
}

extension ApprovalStatusFromString on String {
  ApprovalStatus toApprovalStatus() {
    switch (this) {
      case 'Approved':
        return ApprovalStatus.approved;
      case 'Rejected':
        return ApprovalStatus.rejected;
    }
    throw Exception('$this is not known in enum ApprovalStatus');
  }
}

/// Artifacts are the files that are worked on by actions in the pipeline. See
/// the action configuration for each action for details about artifact
/// parameters. For example, the S3 source action artifact is a file name (or
/// file path), and the files are generally provided as a ZIP file. Example
/// artifact name: SampleApp_Windows.zip
class Artifact {
  /// The location of an artifact.
  final ArtifactLocation? location;

  /// The artifact's name.
  final String? name;

  /// The artifact's revision ID. Depending on the type of object, this could be a
  /// commit ID (GitHub) or a revision ID (Amazon S3).
  final String? revision;

  Artifact({
    this.location,
    this.name,
    this.revision,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      location: json['location'] != null
          ? ArtifactLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      revision: json['revision'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final name = this.name;
    final revision = this.revision;
    return {
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (revision != null) 'revision': revision,
    };
  }
}

/// Artifact details for the action execution, such as the artifact location.
class ArtifactDetail {
  /// The artifact object name for the action execution.
  final String? name;

  /// The Amazon S3 artifact location for the action execution.
  final S3Location? s3location;

  ArtifactDetail({
    this.name,
    this.s3location,
  });

  factory ArtifactDetail.fromJson(Map<String, dynamic> json) {
    return ArtifactDetail(
      name: json['name'] as String?,
      s3location: json['s3location'] != null
          ? S3Location.fromJson(json['s3location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final s3location = this.s3location;
    return {
      if (name != null) 'name': name,
      if (s3location != null) 's3location': s3location,
    };
  }
}

/// Returns information about the details of an artifact.
class ArtifactDetails {
  /// The maximum number of artifacts allowed for the action type.
  final int maximumCount;

  /// The minimum number of artifacts allowed for the action type.
  final int minimumCount;

  ArtifactDetails({
    required this.maximumCount,
    required this.minimumCount,
  });

  factory ArtifactDetails.fromJson(Map<String, dynamic> json) {
    return ArtifactDetails(
      maximumCount: json['maximumCount'] as int,
      minimumCount: json['minimumCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumCount = this.maximumCount;
    final minimumCount = this.minimumCount;
    return {
      'maximumCount': maximumCount,
      'minimumCount': minimumCount,
    };
  }
}

/// Represents information about the location of an artifact.
class ArtifactLocation {
  /// The S3 bucket that contains the artifact.
  final S3ArtifactLocation? s3Location;

  /// The type of artifact in the location.
  final ArtifactLocationType? type;

  ArtifactLocation({
    this.s3Location,
    this.type,
  });

  factory ArtifactLocation.fromJson(Map<String, dynamic> json) {
    return ArtifactLocation(
      s3Location: json['s3Location'] != null
          ? S3ArtifactLocation.fromJson(
              json['s3Location'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toArtifactLocationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    final type = this.type;
    return {
      if (s3Location != null) 's3Location': s3Location,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ArtifactLocationType {
  s3,
}

extension ArtifactLocationTypeValueExtension on ArtifactLocationType {
  String toValue() {
    switch (this) {
      case ArtifactLocationType.s3:
        return 'S3';
    }
  }
}

extension ArtifactLocationTypeFromString on String {
  ArtifactLocationType toArtifactLocationType() {
    switch (this) {
      case 'S3':
        return ArtifactLocationType.s3;
    }
    throw Exception('$this is not known in enum ArtifactLocationType');
  }
}

/// Represents revision details of an artifact.
class ArtifactRevision {
  /// The date and time when the most recent revision of the artifact was created,
  /// in timestamp format.
  final DateTime? created;

  /// The name of an artifact. This name might be system-generated, such as
  /// "MyApp", or defined by the user when an action is created.
  final String? name;

  /// An additional identifier for a revision, such as a commit date or, for
  /// artifacts stored in Amazon S3 buckets, the ETag value.
  final String? revisionChangeIdentifier;

  /// The revision ID of the artifact.
  final String? revisionId;

  /// Summary information about the most recent revision of the artifact. For
  /// GitHub and CodeCommit repositories, the commit message. For Amazon S3
  /// buckets or actions, the user-provided content of a
  /// <code>codepipeline-artifact-revision-summary</code> key specified in the
  /// object metadata.
  final String? revisionSummary;

  /// The commit ID for the artifact revision. For artifacts stored in GitHub or
  /// CodeCommit repositories, the commit ID is linked to a commit details page.
  final String? revisionUrl;

  ArtifactRevision({
    this.created,
    this.name,
    this.revisionChangeIdentifier,
    this.revisionId,
    this.revisionSummary,
    this.revisionUrl,
  });

  factory ArtifactRevision.fromJson(Map<String, dynamic> json) {
    return ArtifactRevision(
      created: timeStampFromJson(json['created']),
      name: json['name'] as String?,
      revisionChangeIdentifier: json['revisionChangeIdentifier'] as String?,
      revisionId: json['revisionId'] as String?,
      revisionSummary: json['revisionSummary'] as String?,
      revisionUrl: json['revisionUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final name = this.name;
    final revisionChangeIdentifier = this.revisionChangeIdentifier;
    final revisionId = this.revisionId;
    final revisionSummary = this.revisionSummary;
    final revisionUrl = this.revisionUrl;
    return {
      if (created != null) 'created': unixTimestampToJson(created),
      if (name != null) 'name': name,
      if (revisionChangeIdentifier != null)
        'revisionChangeIdentifier': revisionChangeIdentifier,
      if (revisionId != null) 'revisionId': revisionId,
      if (revisionSummary != null) 'revisionSummary': revisionSummary,
      if (revisionUrl != null) 'revisionUrl': revisionUrl,
    };
  }
}

/// The S3 bucket where artifacts for the pipeline are stored.
/// <note>
/// You must include either <code>artifactStore</code> or
/// <code>artifactStores</code> in your pipeline, but you cannot use both. If
/// you create a cross-region action in your pipeline, you must use
/// <code>artifactStores</code>.
/// </note>
class ArtifactStore {
  /// The S3 bucket used for storing the artifacts for a pipeline. You can specify
  /// the name of an S3 bucket but not a folder in the bucket. A folder to contain
  /// the pipeline artifacts is created for you based on the name of the pipeline.
  /// You can use any S3 bucket in the same Amazon Web Services Region as the
  /// pipeline to store your pipeline artifacts.
  final String location;

  /// The type of the artifact store, such as S3.
  final ArtifactStoreType type;

  /// The encryption key used to encrypt the data in the artifact store, such as
  /// an Amazon Web Services Key Management Service key. If this is undefined, the
  /// default key for Amazon S3 is used.
  final EncryptionKey? encryptionKey;

  ArtifactStore({
    required this.location,
    required this.type,
    this.encryptionKey,
  });

  factory ArtifactStore.fromJson(Map<String, dynamic> json) {
    return ArtifactStore(
      location: json['location'] as String,
      type: (json['type'] as String).toArtifactStoreType(),
      encryptionKey: json['encryptionKey'] != null
          ? EncryptionKey.fromJson(
              json['encryptionKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final type = this.type;
    final encryptionKey = this.encryptionKey;
    return {
      'location': location,
      'type': type.toValue(),
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
    };
  }
}

enum ArtifactStoreType {
  s3,
}

extension ArtifactStoreTypeValueExtension on ArtifactStoreType {
  String toValue() {
    switch (this) {
      case ArtifactStoreType.s3:
        return 'S3';
    }
  }
}

extension ArtifactStoreTypeFromString on String {
  ArtifactStoreType toArtifactStoreType() {
    switch (this) {
      case 'S3':
        return ArtifactStoreType.s3;
    }
    throw Exception('$this is not known in enum ArtifactStoreType');
  }
}

/// Reserved for future use.
class BlockerDeclaration {
  /// Reserved for future use.
  final String name;

  /// Reserved for future use.
  final BlockerType type;

  BlockerDeclaration({
    required this.name,
    required this.type,
  });

  factory BlockerDeclaration.fromJson(Map<String, dynamic> json) {
    return BlockerDeclaration(
      name: json['name'] as String,
      type: (json['type'] as String).toBlockerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type.toValue(),
    };
  }
}

enum BlockerType {
  schedule,
}

extension BlockerTypeValueExtension on BlockerType {
  String toValue() {
    switch (this) {
      case BlockerType.schedule:
        return 'Schedule';
    }
  }
}

extension BlockerTypeFromString on String {
  BlockerType toBlockerType() {
    switch (this) {
      case 'Schedule':
        return BlockerType.schedule;
    }
    throw Exception('$this is not known in enum BlockerType');
  }
}

/// Represents the output of a <code>CreateCustomActionType</code> operation.
class CreateCustomActionTypeOutput {
  /// Returns information about the details of an action type.
  final ActionType actionType;

  /// Specifies the tags applied to the custom action.
  final List<Tag>? tags;

  CreateCustomActionTypeOutput({
    required this.actionType,
    this.tags,
  });

  factory CreateCustomActionTypeOutput.fromJson(Map<String, dynamic> json) {
    return CreateCustomActionTypeOutput(
      actionType:
          ActionType.fromJson(json['actionType'] as Map<String, dynamic>),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final tags = this.tags;
    return {
      'actionType': actionType,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the output of a <code>CreatePipeline</code> action.
class CreatePipelineOutput {
  /// Represents the structure of actions and stages to be performed in the
  /// pipeline.
  final PipelineDeclaration? pipeline;

  /// Specifies the tags applied to the pipeline.
  final List<Tag>? tags;

  CreatePipelineOutput({
    this.pipeline,
    this.tags,
  });

  factory CreatePipelineOutput.fromJson(Map<String, dynamic> json) {
    return CreatePipelineOutput(
      pipeline: json['pipeline'] != null
          ? PipelineDeclaration.fromJson(
              json['pipeline'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    final tags = this.tags;
    return {
      if (pipeline != null) 'pipeline': pipeline,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents information about a current revision.
class CurrentRevision {
  /// The change identifier for the current revision.
  final String changeIdentifier;

  /// The revision ID of the current version of an artifact.
  final String revision;

  /// The date and time when the most recent revision of the artifact was created,
  /// in timestamp format.
  final DateTime? created;

  /// The summary of the most recent revision of the artifact.
  final String? revisionSummary;

  CurrentRevision({
    required this.changeIdentifier,
    required this.revision,
    this.created,
    this.revisionSummary,
  });

  Map<String, dynamic> toJson() {
    final changeIdentifier = this.changeIdentifier;
    final revision = this.revision;
    final created = this.created;
    final revisionSummary = this.revisionSummary;
    return {
      'changeIdentifier': changeIdentifier,
      'revision': revision,
      if (created != null) 'created': unixTimestampToJson(created),
      if (revisionSummary != null) 'revisionSummary': revisionSummary,
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

class DeregisterWebhookWithThirdPartyOutput {
  DeregisterWebhookWithThirdPartyOutput();

  factory DeregisterWebhookWithThirdPartyOutput.fromJson(
      Map<String, dynamic> _) {
    return DeregisterWebhookWithThirdPartyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents information about the key used to encrypt data in the artifact
/// store, such as an Amazon Web Services Key Management Service (Key Management
/// Service) key.
class EncryptionKey {
  /// The ID used to identify the key. For an Amazon Web Services KMS key, you can
  /// use the key ID, the key ARN, or the alias ARN.
  /// <note>
  /// Aliases are recognized only in the account that created the KMS key. For
  /// cross-account actions, you can only use the key ID or key ARN to identify
  /// the key. Cross-account actions involve using the role from the other account
  /// (AccountB), so specifying the key ID will use the key from the other account
  /// (AccountB).
  /// </note>
  final String id;

  /// The type of encryption key, such as an Amazon Web Services KMS key. When
  /// creating or updating a pipeline, the value must be set to 'KMS'.
  final EncryptionKeyType type;

  EncryptionKey({
    required this.id,
    required this.type,
  });

  factory EncryptionKey.fromJson(Map<String, dynamic> json) {
    return EncryptionKey(
      id: json['id'] as String,
      type: (json['type'] as String).toEncryptionKeyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.toValue(),
    };
  }
}

enum EncryptionKeyType {
  kms,
}

extension EncryptionKeyTypeValueExtension on EncryptionKeyType {
  String toValue() {
    switch (this) {
      case EncryptionKeyType.kms:
        return 'KMS';
    }
  }
}

extension EncryptionKeyTypeFromString on String {
  EncryptionKeyType toEncryptionKeyType() {
    switch (this) {
      case 'KMS':
        return EncryptionKeyType.kms;
    }
    throw Exception('$this is not known in enum EncryptionKeyType');
  }
}

/// Represents information about an error in CodePipeline.
class ErrorDetails {
  /// The system ID or number code of the error.
  final String? code;

  /// The text of the error message.
  final String? message;

  ErrorDetails({
    this.code,
    this.message,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// The details of the actions taken and results produced on an artifact as it
/// passes through stages in the pipeline.
class ExecutionDetails {
  /// The system-generated unique ID of this action used to identify this job
  /// worker in any external systems, such as CodeDeploy.
  final String? externalExecutionId;

  /// The percentage of work completed on the action, represented on a scale of 0
  /// to 100 percent.
  final int? percentComplete;

  /// The summary of the current status of the actions.
  final String? summary;

  ExecutionDetails({
    this.externalExecutionId,
    this.percentComplete,
    this.summary,
  });

  Map<String, dynamic> toJson() {
    final externalExecutionId = this.externalExecutionId;
    final percentComplete = this.percentComplete;
    final summary = this.summary;
    return {
      if (externalExecutionId != null)
        'externalExecutionId': externalExecutionId,
      if (percentComplete != null) 'percentComplete': percentComplete,
      if (summary != null) 'summary': summary,
    };
  }
}

enum ExecutionMode {
  queued,
  superseded,
  parallel,
}

extension ExecutionModeValueExtension on ExecutionMode {
  String toValue() {
    switch (this) {
      case ExecutionMode.queued:
        return 'QUEUED';
      case ExecutionMode.superseded:
        return 'SUPERSEDED';
      case ExecutionMode.parallel:
        return 'PARALLEL';
    }
  }
}

extension ExecutionModeFromString on String {
  ExecutionMode toExecutionMode() {
    switch (this) {
      case 'QUEUED':
        return ExecutionMode.queued;
      case 'SUPERSEDED':
        return ExecutionMode.superseded;
      case 'PARALLEL':
        return ExecutionMode.parallel;
    }
    throw Exception('$this is not known in enum ExecutionMode');
  }
}

/// The interaction or event that started a pipeline execution.
class ExecutionTrigger {
  /// Detail related to the event that started a pipeline execution, such as the
  /// webhook ARN of the webhook that triggered the pipeline execution or the user
  /// ARN for a user-initiated <code>start-pipeline-execution</code> CLI command.
  final String? triggerDetail;

  /// The type of change-detection method, command, or user interaction that
  /// started a pipeline execution.
  final TriggerType? triggerType;

  ExecutionTrigger({
    this.triggerDetail,
    this.triggerType,
  });

  factory ExecutionTrigger.fromJson(Map<String, dynamic> json) {
    return ExecutionTrigger(
      triggerDetail: json['triggerDetail'] as String?,
      triggerType: (json['triggerType'] as String?)?.toTriggerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final triggerDetail = this.triggerDetail;
    final triggerType = this.triggerType;
    return {
      if (triggerDetail != null) 'triggerDetail': triggerDetail,
      if (triggerType != null) 'triggerType': triggerType.toValue(),
    };
  }
}

enum ExecutionType {
  standard,
  rollback,
}

extension ExecutionTypeValueExtension on ExecutionType {
  String toValue() {
    switch (this) {
      case ExecutionType.standard:
        return 'STANDARD';
      case ExecutionType.rollback:
        return 'ROLLBACK';
    }
  }
}

extension ExecutionTypeFromString on String {
  ExecutionType toExecutionType() {
    switch (this) {
      case 'STANDARD':
        return ExecutionType.standard;
      case 'ROLLBACK':
        return ExecutionType.rollback;
    }
    throw Exception('$this is not known in enum ExecutionType');
  }
}

/// The action engine, or executor, related to the supported integration model
/// used to create and update the action type. The available executor types are
/// <code>Lambda</code> and <code>JobWorker</code>.
class ExecutorConfiguration {
  /// Details about the <code>JobWorker</code> executor of the action type.
  final JobWorkerExecutorConfiguration? jobWorkerExecutorConfiguration;

  /// Details about the <code>Lambda</code> executor of the action type.
  final LambdaExecutorConfiguration? lambdaExecutorConfiguration;

  ExecutorConfiguration({
    this.jobWorkerExecutorConfiguration,
    this.lambdaExecutorConfiguration,
  });

  factory ExecutorConfiguration.fromJson(Map<String, dynamic> json) {
    return ExecutorConfiguration(
      jobWorkerExecutorConfiguration: json['jobWorkerExecutorConfiguration'] !=
              null
          ? JobWorkerExecutorConfiguration.fromJson(
              json['jobWorkerExecutorConfiguration'] as Map<String, dynamic>)
          : null,
      lambdaExecutorConfiguration: json['lambdaExecutorConfiguration'] != null
          ? LambdaExecutorConfiguration.fromJson(
              json['lambdaExecutorConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobWorkerExecutorConfiguration = this.jobWorkerExecutorConfiguration;
    final lambdaExecutorConfiguration = this.lambdaExecutorConfiguration;
    return {
      if (jobWorkerExecutorConfiguration != null)
        'jobWorkerExecutorConfiguration': jobWorkerExecutorConfiguration,
      if (lambdaExecutorConfiguration != null)
        'lambdaExecutorConfiguration': lambdaExecutorConfiguration,
    };
  }
}

enum ExecutorType {
  jobWorker,
  lambda,
}

extension ExecutorTypeValueExtension on ExecutorType {
  String toValue() {
    switch (this) {
      case ExecutorType.jobWorker:
        return 'JobWorker';
      case ExecutorType.lambda:
        return 'Lambda';
    }
  }
}

extension ExecutorTypeFromString on String {
  ExecutorType toExecutorType() {
    switch (this) {
      case 'JobWorker':
        return ExecutorType.jobWorker;
      case 'Lambda':
        return ExecutorType.lambda;
    }
    throw Exception('$this is not known in enum ExecutorType');
  }
}

/// The configuration that specifies the result, such as rollback, to occur upon
/// stage failure.
class FailureConditions {
  /// The specified result for when the failure conditions are met, such as
  /// rolling back the stage.
  final Result? result;

  FailureConditions({
    this.result,
  });

  factory FailureConditions.fromJson(Map<String, dynamic> json) {
    return FailureConditions(
      result: (json['result'] as String?)?.toResult(),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'result': result.toValue(),
    };
  }
}

/// Represents information about failure details.
class FailureDetails {
  /// The message about the failure.
  final String message;

  /// The type of the failure.
  final FailureType type;

  /// The external ID of the run of the action that failed.
  final String? externalExecutionId;

  FailureDetails({
    required this.message,
    required this.type,
    this.externalExecutionId,
  });

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    final externalExecutionId = this.externalExecutionId;
    return {
      'message': message,
      'type': type.toValue(),
      if (externalExecutionId != null)
        'externalExecutionId': externalExecutionId,
    };
  }
}

enum FailureType {
  jobFailed,
  configurationError,
  permissionError,
  revisionOutOfSync,
  revisionUnavailable,
  systemUnavailable,
}

extension FailureTypeValueExtension on FailureType {
  String toValue() {
    switch (this) {
      case FailureType.jobFailed:
        return 'JobFailed';
      case FailureType.configurationError:
        return 'ConfigurationError';
      case FailureType.permissionError:
        return 'PermissionError';
      case FailureType.revisionOutOfSync:
        return 'RevisionOutOfSync';
      case FailureType.revisionUnavailable:
        return 'RevisionUnavailable';
      case FailureType.systemUnavailable:
        return 'SystemUnavailable';
    }
  }
}

extension FailureTypeFromString on String {
  FailureType toFailureType() {
    switch (this) {
      case 'JobFailed':
        return FailureType.jobFailed;
      case 'ConfigurationError':
        return FailureType.configurationError;
      case 'PermissionError':
        return FailureType.permissionError;
      case 'RevisionOutOfSync':
        return FailureType.revisionOutOfSync;
      case 'RevisionUnavailable':
        return FailureType.revisionUnavailable;
      case 'SystemUnavailable':
        return FailureType.systemUnavailable;
    }
    throw Exception('$this is not known in enum FailureType');
  }
}

class GetActionTypeOutput {
  /// The action type information for the requested action type, such as the
  /// action type ID.
  final ActionTypeDeclaration? actionType;

  GetActionTypeOutput({
    this.actionType,
  });

  factory GetActionTypeOutput.fromJson(Map<String, dynamic> json) {
    return GetActionTypeOutput(
      actionType: json['actionType'] != null
          ? ActionTypeDeclaration.fromJson(
              json['actionType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    return {
      if (actionType != null) 'actionType': actionType,
    };
  }
}

/// Represents the output of a <code>GetJobDetails</code> action.
class GetJobDetailsOutput {
  /// The details of the job.
  /// <note>
  /// If AWSSessionCredentials is used, a long-running job can call
  /// <code>GetJobDetails</code> again to obtain new credentials.
  /// </note>
  final JobDetails? jobDetails;

  GetJobDetailsOutput({
    this.jobDetails,
  });

  factory GetJobDetailsOutput.fromJson(Map<String, dynamic> json) {
    return GetJobDetailsOutput(
      jobDetails: json['jobDetails'] != null
          ? JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDetails = this.jobDetails;
    return {
      if (jobDetails != null) 'jobDetails': jobDetails,
    };
  }
}

/// Represents the output of a <code>GetPipelineExecution</code> action.
class GetPipelineExecutionOutput {
  /// Represents information about the execution of a pipeline.
  final PipelineExecution? pipelineExecution;

  GetPipelineExecutionOutput({
    this.pipelineExecution,
  });

  factory GetPipelineExecutionOutput.fromJson(Map<String, dynamic> json) {
    return GetPipelineExecutionOutput(
      pipelineExecution: json['pipelineExecution'] != null
          ? PipelineExecution.fromJson(
              json['pipelineExecution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecution = this.pipelineExecution;
    return {
      if (pipelineExecution != null) 'pipelineExecution': pipelineExecution,
    };
  }
}

/// Represents the output of a <code>GetPipeline</code> action.
class GetPipelineOutput {
  /// Represents the pipeline metadata information returned as part of the output
  /// of a <code>GetPipeline</code> action.
  final PipelineMetadata? metadata;

  /// Represents the structure of actions and stages to be performed in the
  /// pipeline.
  final PipelineDeclaration? pipeline;

  GetPipelineOutput({
    this.metadata,
    this.pipeline,
  });

  factory GetPipelineOutput.fromJson(Map<String, dynamic> json) {
    return GetPipelineOutput(
      metadata: json['metadata'] != null
          ? PipelineMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      pipeline: json['pipeline'] != null
          ? PipelineDeclaration.fromJson(
              json['pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final pipeline = this.pipeline;
    return {
      if (metadata != null) 'metadata': metadata,
      if (pipeline != null) 'pipeline': pipeline,
    };
  }
}

/// Represents the output of a <code>GetPipelineState</code> action.
class GetPipelineStateOutput {
  /// The date and time the pipeline was created, in timestamp format.
  final DateTime? created;

  /// The name of the pipeline for which you want to get the state.
  final String? pipelineName;

  /// The version number of the pipeline.
  /// <note>
  /// A newly created pipeline is always assigned a version number of
  /// <code>1</code>.
  /// </note>
  final int? pipelineVersion;

  /// A list of the pipeline stage output information, including stage name,
  /// state, most recent run details, whether the stage is disabled, and other
  /// data.
  final List<StageState>? stageStates;

  /// The date and time the pipeline was last updated, in timestamp format.
  final DateTime? updated;

  GetPipelineStateOutput({
    this.created,
    this.pipelineName,
    this.pipelineVersion,
    this.stageStates,
    this.updated,
  });

  factory GetPipelineStateOutput.fromJson(Map<String, dynamic> json) {
    return GetPipelineStateOutput(
      created: timeStampFromJson(json['created']),
      pipelineName: json['pipelineName'] as String?,
      pipelineVersion: json['pipelineVersion'] as int?,
      stageStates: (json['stageStates'] as List?)
          ?.whereNotNull()
          .map((e) => StageState.fromJson(e as Map<String, dynamic>))
          .toList(),
      updated: timeStampFromJson(json['updated']),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final pipelineName = this.pipelineName;
    final pipelineVersion = this.pipelineVersion;
    final stageStates = this.stageStates;
    final updated = this.updated;
    return {
      if (created != null) 'created': unixTimestampToJson(created),
      if (pipelineName != null) 'pipelineName': pipelineName,
      if (pipelineVersion != null) 'pipelineVersion': pipelineVersion,
      if (stageStates != null) 'stageStates': stageStates,
      if (updated != null) 'updated': unixTimestampToJson(updated),
    };
  }
}

/// Represents the output of a <code>GetThirdPartyJobDetails</code> action.
class GetThirdPartyJobDetailsOutput {
  /// The details of the job, including any protected values defined for the job.
  final ThirdPartyJobDetails? jobDetails;

  GetThirdPartyJobDetailsOutput({
    this.jobDetails,
  });

  factory GetThirdPartyJobDetailsOutput.fromJson(Map<String, dynamic> json) {
    return GetThirdPartyJobDetailsOutput(
      jobDetails: json['jobDetails'] != null
          ? ThirdPartyJobDetails.fromJson(
              json['jobDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobDetails = this.jobDetails;
    return {
      if (jobDetails != null) 'jobDetails': jobDetails,
    };
  }
}

/// The Git repository branches specified as filter criteria to start the
/// pipeline.
class GitBranchFilterCriteria {
  /// The list of patterns of Git branches that, when a commit is pushed, are to
  /// be excluded from starting the pipeline.
  final List<String>? excludes;

  /// The list of patterns of Git branches that, when a commit is pushed, are to
  /// be included as criteria that starts the pipeline.
  final List<String>? includes;

  GitBranchFilterCriteria({
    this.excludes,
    this.includes,
  });

  factory GitBranchFilterCriteria.fromJson(Map<String, dynamic> json) {
    return GitBranchFilterCriteria(
      excludes: (json['excludes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includes: (json['includes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// A type of trigger configuration for Git-based source actions.
/// <note>
/// You can specify the Git configuration trigger type for all third-party
/// Git-based source actions that are supported by the
/// <code>CodeStarSourceConnection</code> action type.
/// </note>
class GitConfiguration {
  /// The name of the pipeline source action where the trigger configuration, such
  /// as Git tags, is specified. The trigger configuration will start the pipeline
  /// upon the specified change only.
  /// <note>
  /// You can only specify one trigger configuration per source action.
  /// </note>
  final String sourceActionName;

  /// The field where the repository event that will start the pipeline is
  /// specified as pull requests.
  final List<GitPullRequestFilter>? pullRequest;

  /// The field where the repository event that will start the pipeline, such as
  /// pushing Git tags, is specified with details.
  final List<GitPushFilter>? push;

  GitConfiguration({
    required this.sourceActionName,
    this.pullRequest,
    this.push,
  });

  factory GitConfiguration.fromJson(Map<String, dynamic> json) {
    return GitConfiguration(
      sourceActionName: json['sourceActionName'] as String,
      pullRequest: (json['pullRequest'] as List?)
          ?.whereNotNull()
          .map((e) => GitPullRequestFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      push: (json['push'] as List?)
          ?.whereNotNull()
          .map((e) => GitPushFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceActionName = this.sourceActionName;
    final pullRequest = this.pullRequest;
    final push = this.push;
    return {
      'sourceActionName': sourceActionName,
      if (pullRequest != null) 'pullRequest': pullRequest,
      if (push != null) 'push': push,
    };
  }
}

/// The Git repository file paths specified as filter criteria to start the
/// pipeline.
class GitFilePathFilterCriteria {
  /// The list of patterns of Git repository file paths that, when a commit is
  /// pushed, are to be excluded from starting the pipeline.
  final List<String>? excludes;

  /// The list of patterns of Git repository file paths that, when a commit is
  /// pushed, are to be included as criteria that starts the pipeline.
  final List<String>? includes;

  GitFilePathFilterCriteria({
    this.excludes,
    this.includes,
  });

  factory GitFilePathFilterCriteria.fromJson(Map<String, dynamic> json) {
    return GitFilePathFilterCriteria(
      excludes: (json['excludes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includes: (json['includes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

enum GitPullRequestEventType {
  open,
  updated,
  closed,
}

extension GitPullRequestEventTypeValueExtension on GitPullRequestEventType {
  String toValue() {
    switch (this) {
      case GitPullRequestEventType.open:
        return 'OPEN';
      case GitPullRequestEventType.updated:
        return 'UPDATED';
      case GitPullRequestEventType.closed:
        return 'CLOSED';
    }
  }
}

extension GitPullRequestEventTypeFromString on String {
  GitPullRequestEventType toGitPullRequestEventType() {
    switch (this) {
      case 'OPEN':
        return GitPullRequestEventType.open;
      case 'UPDATED':
        return GitPullRequestEventType.updated;
      case 'CLOSED':
        return GitPullRequestEventType.closed;
    }
    throw Exception('$this is not known in enum GitPullRequestEventType');
  }
}

/// The event criteria for the pull request trigger configuration, such as the
/// lists of branches or file paths to include and exclude.
class GitPullRequestFilter {
  /// The field that specifies to filter on branches for the pull request trigger
  /// configuration.
  final GitBranchFilterCriteria? branches;

  /// The field that specifies which pull request events to filter on (opened,
  /// updated, closed) for the trigger configuration.
  final List<GitPullRequestEventType>? events;

  /// The field that specifies to filter on file paths for the pull request
  /// trigger configuration.
  final GitFilePathFilterCriteria? filePaths;

  GitPullRequestFilter({
    this.branches,
    this.events,
    this.filePaths,
  });

  factory GitPullRequestFilter.fromJson(Map<String, dynamic> json) {
    return GitPullRequestFilter(
      branches: json['branches'] != null
          ? GitBranchFilterCriteria.fromJson(
              json['branches'] as Map<String, dynamic>)
          : null,
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toGitPullRequestEventType())
          .toList(),
      filePaths: json['filePaths'] != null
          ? GitFilePathFilterCriteria.fromJson(
              json['filePaths'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    final events = this.events;
    final filePaths = this.filePaths;
    return {
      if (branches != null) 'branches': branches,
      if (events != null) 'events': events.map((e) => e.toValue()).toList(),
      if (filePaths != null) 'filePaths': filePaths,
    };
  }
}

/// The event criteria that specify when a specified repository event will start
/// the pipeline for the specified trigger configuration, such as the lists of
/// Git tags to include and exclude.
class GitPushFilter {
  /// The field that specifies to filter on branches for the push trigger
  /// configuration.
  final GitBranchFilterCriteria? branches;

  /// The field that specifies to filter on file paths for the push trigger
  /// configuration.
  final GitFilePathFilterCriteria? filePaths;

  /// The field that contains the details for the Git tags trigger configuration.
  final GitTagFilterCriteria? tags;

  GitPushFilter({
    this.branches,
    this.filePaths,
    this.tags,
  });

  factory GitPushFilter.fromJson(Map<String, dynamic> json) {
    return GitPushFilter(
      branches: json['branches'] != null
          ? GitBranchFilterCriteria.fromJson(
              json['branches'] as Map<String, dynamic>)
          : null,
      filePaths: json['filePaths'] != null
          ? GitFilePathFilterCriteria.fromJson(
              json['filePaths'] as Map<String, dynamic>)
          : null,
      tags: json['tags'] != null
          ? GitTagFilterCriteria.fromJson(json['tags'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    final filePaths = this.filePaths;
    final tags = this.tags;
    return {
      if (branches != null) 'branches': branches,
      if (filePaths != null) 'filePaths': filePaths,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The Git tags specified as filter criteria for whether a Git tag repository
/// event will start the pipeline.
class GitTagFilterCriteria {
  /// The list of patterns of Git tags that, when pushed, are to be excluded from
  /// starting the pipeline.
  final List<String>? excludes;

  /// The list of patterns of Git tags that, when pushed, are to be included as
  /// criteria that starts the pipeline.
  final List<String>? includes;

  GitTagFilterCriteria({
    this.excludes,
    this.includes,
  });

  factory GitTagFilterCriteria.fromJson(Map<String, dynamic> json) {
    return GitTagFilterCriteria(
      excludes: (json['excludes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includes: (json['includes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// Represents information about an artifact to be worked on, such as a test or
/// build artifact.
class InputArtifact {
  /// The name of the artifact to be worked on (for example, "My App").
  ///
  /// Artifacts are the files that are worked on by actions in the pipeline. See
  /// the action configuration for each action for details about artifact
  /// parameters. For example, the S3 source action input artifact is a file name
  /// (or file path), and the files are generally provided as a ZIP file. Example
  /// artifact name: SampleApp_Windows.zip
  ///
  /// The input artifact of an action must exactly match the output artifact
  /// declared in a preceding action, but the input artifact does not have to be
  /// the next action in strict sequence from the action that provided the output
  /// artifact. Actions in parallel can declare different output artifacts, which
  /// are in turn consumed by different following actions.
  final String name;

  InputArtifact({
    required this.name,
  });

  factory InputArtifact.fromJson(Map<String, dynamic> json) {
    return InputArtifact(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Represents information about a job.
class Job {
  /// The ID of the Amazon Web Services account to use when performing the job.
  final String? accountId;

  /// Other data about a job.
  final JobData? data;

  /// The unique system-generated ID of the job.
  final String? id;

  /// A system-generated random number that CodePipeline uses to ensure that the
  /// job is being worked on by only one job worker. Use this number in an
  /// <a>AcknowledgeJob</a> request.
  final String? nonce;

  Job({
    this.accountId,
    this.data,
    this.id,
    this.nonce,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      accountId: json['accountId'] as String?,
      data: json['data'] != null
          ? JobData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      nonce: json['nonce'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final data = this.data;
    final id = this.id;
    final nonce = this.nonce;
    return {
      if (accountId != null) 'accountId': accountId,
      if (data != null) 'data': data,
      if (id != null) 'id': id,
      if (nonce != null) 'nonce': nonce,
    };
  }
}

/// Represents other information about a job required for a job worker to
/// complete the job.
class JobData {
  /// Represents information about an action configuration.
  final ActionConfiguration? actionConfiguration;

  /// Represents information about an action type.
  final ActionTypeId? actionTypeId;

  /// Represents an Amazon Web Services session credentials object. These
  /// credentials are temporary credentials that are issued by Amazon Web Services
  /// Secure Token Service (STS). They can be used to access input and output
  /// artifacts in the S3 bucket used to store artifacts for the pipeline in
  /// CodePipeline.
  final AWSSessionCredentials? artifactCredentials;

  /// A system-generated token, such as a deployment ID, required by a job to
  /// continue the job asynchronously.
  final String? continuationToken;

  /// Represents information about the key used to encrypt data in the artifact
  /// store, such as an KMS key.
  final EncryptionKey? encryptionKey;

  /// The artifact supplied to the job.
  final List<Artifact>? inputArtifacts;

  /// The output of the job.
  final List<Artifact>? outputArtifacts;

  /// Represents information about a pipeline to a job worker.
  /// <note>
  /// Includes <code>pipelineArn</code> and <code>pipelineExecutionId</code> for
  /// custom jobs.
  /// </note>
  final PipelineContext? pipelineContext;

  JobData({
    this.actionConfiguration,
    this.actionTypeId,
    this.artifactCredentials,
    this.continuationToken,
    this.encryptionKey,
    this.inputArtifacts,
    this.outputArtifacts,
    this.pipelineContext,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      actionConfiguration: json['actionConfiguration'] != null
          ? ActionConfiguration.fromJson(
              json['actionConfiguration'] as Map<String, dynamic>)
          : null,
      actionTypeId: json['actionTypeId'] != null
          ? ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>)
          : null,
      artifactCredentials: json['artifactCredentials'] != null
          ? AWSSessionCredentials.fromJson(
              json['artifactCredentials'] as Map<String, dynamic>)
          : null,
      continuationToken: json['continuationToken'] as String?,
      encryptionKey: json['encryptionKey'] != null
          ? EncryptionKey.fromJson(
              json['encryptionKey'] as Map<String, dynamic>)
          : null,
      inputArtifacts: (json['inputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputArtifacts: (json['outputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelineContext: json['pipelineContext'] != null
          ? PipelineContext.fromJson(
              json['pipelineContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionConfiguration = this.actionConfiguration;
    final actionTypeId = this.actionTypeId;
    final artifactCredentials = this.artifactCredentials;
    final continuationToken = this.continuationToken;
    final encryptionKey = this.encryptionKey;
    final inputArtifacts = this.inputArtifacts;
    final outputArtifacts = this.outputArtifacts;
    final pipelineContext = this.pipelineContext;
    return {
      if (actionConfiguration != null)
        'actionConfiguration': actionConfiguration,
      if (actionTypeId != null) 'actionTypeId': actionTypeId,
      if (artifactCredentials != null)
        'artifactCredentials': artifactCredentials,
      if (continuationToken != null) 'continuationToken': continuationToken,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (inputArtifacts != null) 'inputArtifacts': inputArtifacts,
      if (outputArtifacts != null) 'outputArtifacts': outputArtifacts,
      if (pipelineContext != null) 'pipelineContext': pipelineContext,
    };
  }
}

/// Represents information about the details of a job.
class JobDetails {
  /// The Amazon Web Services account ID associated with the job.
  final String? accountId;

  /// Represents other information about a job required for a job worker to
  /// complete the job.
  final JobData? data;

  /// The unique system-generated ID of the job.
  final String? id;

  JobDetails({
    this.accountId,
    this.data,
    this.id,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      accountId: json['accountId'] as String?,
      data: json['data'] != null
          ? JobData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final data = this.data;
    final id = this.id;
    return {
      if (accountId != null) 'accountId': accountId,
      if (data != null) 'data': data,
      if (id != null) 'id': id,
    };
  }
}

enum JobStatus {
  created,
  queued,
  dispatched,
  inProgress,
  timedOut,
  succeeded,
  failed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.created:
        return 'Created';
      case JobStatus.queued:
        return 'Queued';
      case JobStatus.dispatched:
        return 'Dispatched';
      case JobStatus.inProgress:
        return 'InProgress';
      case JobStatus.timedOut:
        return 'TimedOut';
      case JobStatus.succeeded:
        return 'Succeeded';
      case JobStatus.failed:
        return 'Failed';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'Created':
        return JobStatus.created;
      case 'Queued':
        return JobStatus.queued;
      case 'Dispatched':
        return JobStatus.dispatched;
      case 'InProgress':
        return JobStatus.inProgress;
      case 'TimedOut':
        return JobStatus.timedOut;
      case 'Succeeded':
        return JobStatus.succeeded;
      case 'Failed':
        return JobStatus.failed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Details about the polling configuration for the <code>JobWorker</code>
/// action engine, or executor.
class JobWorkerExecutorConfiguration {
  /// The accounts in which the job worker is configured and might poll for jobs
  /// as part of the action execution.
  final List<String>? pollingAccounts;

  /// The service Principals in which the job worker is configured and might poll
  /// for jobs as part of the action execution.
  final List<String>? pollingServicePrincipals;

  JobWorkerExecutorConfiguration({
    this.pollingAccounts,
    this.pollingServicePrincipals,
  });

  factory JobWorkerExecutorConfiguration.fromJson(Map<String, dynamic> json) {
    return JobWorkerExecutorConfiguration(
      pollingAccounts: (json['pollingAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pollingServicePrincipals: (json['pollingServicePrincipals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pollingAccounts = this.pollingAccounts;
    final pollingServicePrincipals = this.pollingServicePrincipals;
    return {
      if (pollingAccounts != null) 'pollingAccounts': pollingAccounts,
      if (pollingServicePrincipals != null)
        'pollingServicePrincipals': pollingServicePrincipals,
    };
  }
}

/// Details about the configuration for the <code>Lambda</code> action engine,
/// or executor.
class LambdaExecutorConfiguration {
  /// The ARN of the Lambda function used by the action engine.
  final String lambdaFunctionArn;

  LambdaExecutorConfiguration({
    required this.lambdaFunctionArn,
  });

  factory LambdaExecutorConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaExecutorConfiguration(
      lambdaFunctionArn: json['lambdaFunctionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaFunctionArn = this.lambdaFunctionArn;
    return {
      'lambdaFunctionArn': lambdaFunctionArn,
    };
  }
}

/// The field that specifies to filter on the latest execution in the pipeline.
/// <note>
/// Filtering on the latest execution is available for executions run on or
/// after February 08, 2024.
/// </note>
class LatestInPipelineExecutionFilter {
  /// The execution ID for the latest execution in the pipeline.
  final String pipelineExecutionId;

  /// The start time to filter on for the latest execution in the pipeline. Valid
  /// options:
  ///
  /// <ul>
  /// <li>
  /// All
  /// </li>
  /// <li>
  /// Latest
  /// </li>
  /// </ul>
  final StartTimeRange startTimeRange;

  LatestInPipelineExecutionFilter({
    required this.pipelineExecutionId,
    required this.startTimeRange,
  });

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    final startTimeRange = this.startTimeRange;
    return {
      'pipelineExecutionId': pipelineExecutionId,
      'startTimeRange': startTimeRange.toValue(),
    };
  }
}

class ListActionExecutionsOutput {
  /// The details for a list of recent executions, such as action execution ID.
  final List<ActionExecutionDetail>? actionExecutionDetails;

  /// If the amount of returned information is significantly large, an identifier
  /// is also returned and can be used in a subsequent
  /// <code>ListActionExecutions</code> call to return the next set of action
  /// executions in the list.
  final String? nextToken;

  ListActionExecutionsOutput({
    this.actionExecutionDetails,
    this.nextToken,
  });

  factory ListActionExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListActionExecutionsOutput(
      actionExecutionDetails: (json['actionExecutionDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ActionExecutionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionExecutionDetails = this.actionExecutionDetails;
    final nextToken = this.nextToken;
    return {
      if (actionExecutionDetails != null)
        'actionExecutionDetails': actionExecutionDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListActionTypes</code> action.
class ListActionTypesOutput {
  /// Provides details of the action types.
  final List<ActionType> actionTypes;

  /// If the amount of returned information is significantly large, an identifier
  /// is also returned. It can be used in a subsequent list action types call to
  /// return the next set of action types in the list.
  final String? nextToken;

  ListActionTypesOutput({
    required this.actionTypes,
    this.nextToken,
  });

  factory ListActionTypesOutput.fromJson(Map<String, dynamic> json) {
    return ListActionTypesOutput(
      actionTypes: (json['actionTypes'] as List)
          .whereNotNull()
          .map((e) => ActionType.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionTypes = this.actionTypes;
    final nextToken = this.nextToken;
    return {
      'actionTypes': actionTypes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the output of a <code>ListPipelineExecutions</code> action.
class ListPipelineExecutionsOutput {
  /// A token that can be used in the next <code>ListPipelineExecutions</code>
  /// call. To view all items in the list, continue to call this operation with
  /// each subsequent token until no more nextToken values are returned.
  final String? nextToken;

  /// A list of executions in the history of a pipeline.
  final List<PipelineExecutionSummary>? pipelineExecutionSummaries;

  ListPipelineExecutionsOutput({
    this.nextToken,
    this.pipelineExecutionSummaries,
  });

  factory ListPipelineExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListPipelineExecutionsOutput(
      nextToken: json['nextToken'] as String?,
      pipelineExecutionSummaries: (json['pipelineExecutionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PipelineExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelineExecutionSummaries = this.pipelineExecutionSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pipelineExecutionSummaries != null)
        'pipelineExecutionSummaries': pipelineExecutionSummaries,
    };
  }
}

/// Represents the output of a <code>ListPipelines</code> action.
class ListPipelinesOutput {
  /// If the amount of returned information is significantly large, an identifier
  /// is also returned. It can be used in a subsequent list pipelines call to
  /// return the next set of pipelines in the list.
  final String? nextToken;

  /// The list of pipelines.
  final List<PipelineSummary>? pipelines;

  ListPipelinesOutput({
    this.nextToken,
    this.pipelines,
  });

  factory ListPipelinesOutput.fromJson(Map<String, dynamic> json) {
    return ListPipelinesOutput(
      nextToken: json['nextToken'] as String?,
      pipelines: (json['pipelines'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelines = this.pipelines;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pipelines != null) 'pipelines': pipelines,
    };
  }
}

class ListTagsForResourceOutput {
  /// If the amount of returned information is significantly large, an identifier
  /// is also returned and can be used in a subsequent API call to return the next
  /// page of the list. The ListTagsforResource call lists all available tags in
  /// one call and does not use pagination.
  final String? nextToken;

  /// The tags for the resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      nextToken: json['nextToken'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The detail returned for each webhook after listing webhooks, such as the
/// webhook URL, the webhook name, and the webhook ARN.
class ListWebhookItem {
  /// The detail returned for each webhook, such as the webhook authentication
  /// type and filter rules.
  final WebhookDefinition definition;

  /// A unique URL generated by CodePipeline. When a POST request is made to this
  /// URL, the defined pipeline is started as long as the body of the post request
  /// satisfies the defined authentication and filtering conditions. Deleting and
  /// re-creating a webhook makes the old URL invalid and generates a new one.
  final String url;

  /// The Amazon Resource Name (ARN) of the webhook.
  final String? arn;

  /// The number code of the error.
  final String? errorCode;

  /// The text of the error message about the webhook.
  final String? errorMessage;

  /// The date and time a webhook was last successfully triggered, in timestamp
  /// format.
  final DateTime? lastTriggered;

  /// Specifies the tags applied to the webhook.
  final List<Tag>? tags;

  ListWebhookItem({
    required this.definition,
    required this.url,
    this.arn,
    this.errorCode,
    this.errorMessage,
    this.lastTriggered,
    this.tags,
  });

  factory ListWebhookItem.fromJson(Map<String, dynamic> json) {
    return ListWebhookItem(
      definition: WebhookDefinition.fromJson(
          json['definition'] as Map<String, dynamic>),
      url: json['url'] as String,
      arn: json['arn'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      lastTriggered: timeStampFromJson(json['lastTriggered']),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final url = this.url;
    final arn = this.arn;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastTriggered = this.lastTriggered;
    final tags = this.tags;
    return {
      'definition': definition,
      'url': url,
      if (arn != null) 'arn': arn,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastTriggered != null)
        'lastTriggered': unixTimestampToJson(lastTriggered),
      if (tags != null) 'tags': tags,
    };
  }
}

class ListWebhooksOutput {
  /// If the amount of returned information is significantly large, an identifier
  /// is also returned and can be used in a subsequent ListWebhooks call to return
  /// the next set of webhooks in the list.
  final String? nextToken;

  /// The JSON detail returned for each webhook in the list output for the
  /// ListWebhooks call.
  final List<ListWebhookItem>? webhooks;

  ListWebhooksOutput({
    this.nextToken,
    this.webhooks,
  });

  factory ListWebhooksOutput.fromJson(Map<String, dynamic> json) {
    return ListWebhooksOutput(
      nextToken: json['NextToken'] as String?,
      webhooks: (json['webhooks'] as List?)
          ?.whereNotNull()
          .map((e) => ListWebhookItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final webhooks = this.webhooks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (webhooks != null) 'webhooks': webhooks,
    };
  }
}

/// Represents information about the output of an action.
class OutputArtifact {
  /// The name of the output of an artifact, such as "My App".
  ///
  /// The input artifact of an action must exactly match the output artifact
  /// declared in a preceding action, but the input artifact does not have to be
  /// the next action in strict sequence from the action that provided the output
  /// artifact. Actions in parallel can declare different output artifacts, which
  /// are in turn consumed by different following actions.
  ///
  /// Output artifact names must be unique within a pipeline.
  final String name;

  OutputArtifact({
    required this.name,
  });

  factory OutputArtifact.fromJson(Map<String, dynamic> json) {
    return OutputArtifact(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Represents information about a pipeline to a job worker.
/// <note>
/// PipelineContext contains <code>pipelineArn</code> and
/// <code>pipelineExecutionId</code> for custom action jobs. The
/// <code>pipelineArn</code> and <code>pipelineExecutionId</code> fields are not
/// populated for ThirdParty action jobs.
/// </note>
class PipelineContext {
  /// The context of an action to a job worker in the stage of a pipeline.
  final ActionContext? action;

  /// The Amazon Resource Name (ARN) of the pipeline.
  final String? pipelineArn;

  /// The execution ID of the pipeline.
  final String? pipelineExecutionId;

  /// The name of the pipeline. This is a user-specified value. Pipeline names
  /// must be unique across all pipeline names under an Amazon Web Services
  /// account.
  final String? pipelineName;

  /// The stage of the pipeline.
  final StageContext? stage;

  PipelineContext({
    this.action,
    this.pipelineArn,
    this.pipelineExecutionId,
    this.pipelineName,
    this.stage,
  });

  factory PipelineContext.fromJson(Map<String, dynamic> json) {
    return PipelineContext(
      action: json['action'] != null
          ? ActionContext.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      pipelineArn: json['pipelineArn'] as String?,
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
      pipelineName: json['pipelineName'] as String?,
      stage: json['stage'] != null
          ? StageContext.fromJson(json['stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final pipelineArn = this.pipelineArn;
    final pipelineExecutionId = this.pipelineExecutionId;
    final pipelineName = this.pipelineName;
    final stage = this.stage;
    return {
      if (action != null) 'action': action,
      if (pipelineArn != null) 'pipelineArn': pipelineArn,
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
      if (pipelineName != null) 'pipelineName': pipelineName,
      if (stage != null) 'stage': stage,
    };
  }
}

/// Represents the structure of actions and stages to be performed in the
/// pipeline.
class PipelineDeclaration {
  /// The name of the pipeline.
  final String name;

  /// The Amazon Resource Name (ARN) for CodePipeline to use to either perform
  /// actions with no <code>actionRoleArn</code>, or to use to assume roles for
  /// actions with an <code>actionRoleArn</code>.
  final String roleArn;

  /// The stage in which to perform the action.
  final List<StageDeclaration> stages;

  /// Represents information about the S3 bucket where artifacts are stored for
  /// the pipeline.
  /// <note>
  /// You must include either <code>artifactStore</code> or
  /// <code>artifactStores</code> in your pipeline, but you cannot use both. If
  /// you create a cross-region action in your pipeline, you must use
  /// <code>artifactStores</code>.
  /// </note>
  final ArtifactStore? artifactStore;

  /// A mapping of <code>artifactStore</code> objects and their corresponding
  /// Amazon Web Services Regions. There must be an artifact store for the
  /// pipeline Region and for each cross-region action in the pipeline.
  /// <note>
  /// You must include either <code>artifactStore</code> or
  /// <code>artifactStores</code> in your pipeline, but you cannot use both. If
  /// you create a cross-region action in your pipeline, you must use
  /// <code>artifactStores</code>.
  /// </note>
  final Map<String, ArtifactStore>? artifactStores;

  /// The method that the pipeline will use to handle multiple executions. The
  /// default mode is SUPERSEDED.
  final ExecutionMode? executionMode;

  /// CodePipeline provides the following pipeline types, which differ in
  /// characteristics and price, so that you can tailor your pipeline features and
  /// cost to the needs of your applications.
  ///
  /// <ul>
  /// <li>
  /// V1 type pipelines have a JSON structure that contains standard pipeline,
  /// stage, and action-level parameters.
  /// </li>
  /// <li>
  /// V2 type pipelines have the same structure as a V1 type, along with
  /// additional parameters for release safety and trigger configuration.
  /// </li>
  /// </ul> <important>
  /// Including V2 parameters, such as triggers on Git tags, in the pipeline JSON
  /// when creating or updating a pipeline will result in the pipeline having the
  /// V2 type of pipeline and the associated costs.
  /// </important>
  /// For information about pricing for CodePipeline, see <a
  /// href="http://aws.amazon.com/codepipeline/pricing/">Pricing</a>.
  ///
  /// For information about which type of pipeline to choose, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-types-planning.html">What
  /// type of pipeline is right for me?</a>.
  final PipelineType? pipelineType;

  /// The trigger configuration specifying a type of event, such as Git tags, that
  /// starts the pipeline.
  /// <note>
  /// When a trigger configuration is specified, default change detection for
  /// repository and branch commits is disabled.
  /// </note>
  final List<PipelineTriggerDeclaration>? triggers;

  /// A list that defines the pipeline variables for a pipeline resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match <code>[A-Za-z0-9@\-_]+</code>.
  final List<PipelineVariableDeclaration>? variables;

  /// The version number of the pipeline. A new pipeline always has a version
  /// number of 1. This number is incremented when a pipeline is updated.
  final int? version;

  PipelineDeclaration({
    required this.name,
    required this.roleArn,
    required this.stages,
    this.artifactStore,
    this.artifactStores,
    this.executionMode,
    this.pipelineType,
    this.triggers,
    this.variables,
    this.version,
  });

  factory PipelineDeclaration.fromJson(Map<String, dynamic> json) {
    return PipelineDeclaration(
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      stages: (json['stages'] as List)
          .whereNotNull()
          .map((e) => StageDeclaration.fromJson(e as Map<String, dynamic>))
          .toList(),
      artifactStore: json['artifactStore'] != null
          ? ArtifactStore.fromJson(
              json['artifactStore'] as Map<String, dynamic>)
          : null,
      artifactStores: (json['artifactStores'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, ArtifactStore.fromJson(e as Map<String, dynamic>))),
      executionMode: (json['executionMode'] as String?)?.toExecutionMode(),
      pipelineType: (json['pipelineType'] as String?)?.toPipelineType(),
      triggers: (json['triggers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PipelineTriggerDeclaration.fromJson(e as Map<String, dynamic>))
          .toList(),
      variables: (json['variables'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PipelineVariableDeclaration.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final roleArn = this.roleArn;
    final stages = this.stages;
    final artifactStore = this.artifactStore;
    final artifactStores = this.artifactStores;
    final executionMode = this.executionMode;
    final pipelineType = this.pipelineType;
    final triggers = this.triggers;
    final variables = this.variables;
    final version = this.version;
    return {
      'name': name,
      'roleArn': roleArn,
      'stages': stages,
      if (artifactStore != null) 'artifactStore': artifactStore,
      if (artifactStores != null) 'artifactStores': artifactStores,
      if (executionMode != null) 'executionMode': executionMode.toValue(),
      if (pipelineType != null) 'pipelineType': pipelineType.toValue(),
      if (triggers != null) 'triggers': triggers,
      if (variables != null) 'variables': variables,
      if (version != null) 'version': version,
    };
  }
}

/// Represents information about an execution of a pipeline.
class PipelineExecution {
  /// A list of <code>ArtifactRevision</code> objects included in a pipeline
  /// execution.
  final List<ArtifactRevision>? artifactRevisions;

  /// The method that the pipeline will use to handle multiple executions. The
  /// default mode is SUPERSEDED.
  final ExecutionMode? executionMode;

  /// The type of the pipeline execution.
  final ExecutionType? executionType;

  /// The ID of the pipeline execution.
  final String? pipelineExecutionId;

  /// The name of the pipeline with the specified pipeline execution.
  final String? pipelineName;

  /// The version number of the pipeline with the specified pipeline execution.
  final int? pipelineVersion;

  /// The metadata about the execution pertaining to stage rollback.
  final PipelineRollbackMetadata? rollbackMetadata;

  /// The status of the pipeline execution.
  ///
  /// <ul>
  /// <li>
  /// Cancelled: The pipeline’s definition was updated before the pipeline
  /// execution could be completed.
  /// </li>
  /// <li>
  /// InProgress: The pipeline execution is currently running.
  /// </li>
  /// <li>
  /// Stopped: The pipeline execution was manually stopped. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped">Stopped
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Stopping: The pipeline execution received a request to be manually stopped.
  /// Depending on the selected stop mode, the execution is either completing or
  /// abandoning in-progress actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped">Stopped
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Succeeded: The pipeline execution was completed successfully.
  /// </li>
  /// <li>
  /// Superseded: While this pipeline execution was waiting for the next stage to
  /// be completed, a newer pipeline execution advanced and continued through the
  /// pipeline instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-superseded">Superseded
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Failed: The pipeline execution was not completed successfully.
  /// </li>
  /// </ul>
  final PipelineExecutionStatus? status;

  /// A summary that contains a description of the pipeline execution status.
  final String? statusSummary;
  final ExecutionTrigger? trigger;

  /// A list of pipeline variables used for the pipeline execution.
  final List<ResolvedPipelineVariable>? variables;

  PipelineExecution({
    this.artifactRevisions,
    this.executionMode,
    this.executionType,
    this.pipelineExecutionId,
    this.pipelineName,
    this.pipelineVersion,
    this.rollbackMetadata,
    this.status,
    this.statusSummary,
    this.trigger,
    this.variables,
  });

  factory PipelineExecution.fromJson(Map<String, dynamic> json) {
    return PipelineExecution(
      artifactRevisions: (json['artifactRevisions'] as List?)
          ?.whereNotNull()
          .map((e) => ArtifactRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
      executionMode: (json['executionMode'] as String?)?.toExecutionMode(),
      executionType: (json['executionType'] as String?)?.toExecutionType(),
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
      pipelineName: json['pipelineName'] as String?,
      pipelineVersion: json['pipelineVersion'] as int?,
      rollbackMetadata: json['rollbackMetadata'] != null
          ? PipelineRollbackMetadata.fromJson(
              json['rollbackMetadata'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toPipelineExecutionStatus(),
      statusSummary: json['statusSummary'] as String?,
      trigger: json['trigger'] != null
          ? ExecutionTrigger.fromJson(json['trigger'] as Map<String, dynamic>)
          : null,
      variables: (json['variables'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResolvedPipelineVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final artifactRevisions = this.artifactRevisions;
    final executionMode = this.executionMode;
    final executionType = this.executionType;
    final pipelineExecutionId = this.pipelineExecutionId;
    final pipelineName = this.pipelineName;
    final pipelineVersion = this.pipelineVersion;
    final rollbackMetadata = this.rollbackMetadata;
    final status = this.status;
    final statusSummary = this.statusSummary;
    final trigger = this.trigger;
    final variables = this.variables;
    return {
      if (artifactRevisions != null) 'artifactRevisions': artifactRevisions,
      if (executionMode != null) 'executionMode': executionMode.toValue(),
      if (executionType != null) 'executionType': executionType.toValue(),
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
      if (pipelineName != null) 'pipelineName': pipelineName,
      if (pipelineVersion != null) 'pipelineVersion': pipelineVersion,
      if (rollbackMetadata != null) 'rollbackMetadata': rollbackMetadata,
      if (status != null) 'status': status.toValue(),
      if (statusSummary != null) 'statusSummary': statusSummary,
      if (trigger != null) 'trigger': trigger,
      if (variables != null) 'variables': variables,
    };
  }
}

/// The pipeline execution to filter on.
class PipelineExecutionFilter {
  /// Filter for pipeline executions where the stage was successful in the current
  /// pipeline version.
  final SucceededInStageFilter? succeededInStage;

  PipelineExecutionFilter({
    this.succeededInStage,
  });

  Map<String, dynamic> toJson() {
    final succeededInStage = this.succeededInStage;
    return {
      if (succeededInStage != null) 'succeededInStage': succeededInStage,
    };
  }
}

enum PipelineExecutionStatus {
  cancelled,
  inProgress,
  stopped,
  stopping,
  succeeded,
  superseded,
  failed,
}

extension PipelineExecutionStatusValueExtension on PipelineExecutionStatus {
  String toValue() {
    switch (this) {
      case PipelineExecutionStatus.cancelled:
        return 'Cancelled';
      case PipelineExecutionStatus.inProgress:
        return 'InProgress';
      case PipelineExecutionStatus.stopped:
        return 'Stopped';
      case PipelineExecutionStatus.stopping:
        return 'Stopping';
      case PipelineExecutionStatus.succeeded:
        return 'Succeeded';
      case PipelineExecutionStatus.superseded:
        return 'Superseded';
      case PipelineExecutionStatus.failed:
        return 'Failed';
    }
  }
}

extension PipelineExecutionStatusFromString on String {
  PipelineExecutionStatus toPipelineExecutionStatus() {
    switch (this) {
      case 'Cancelled':
        return PipelineExecutionStatus.cancelled;
      case 'InProgress':
        return PipelineExecutionStatus.inProgress;
      case 'Stopped':
        return PipelineExecutionStatus.stopped;
      case 'Stopping':
        return PipelineExecutionStatus.stopping;
      case 'Succeeded':
        return PipelineExecutionStatus.succeeded;
      case 'Superseded':
        return PipelineExecutionStatus.superseded;
      case 'Failed':
        return PipelineExecutionStatus.failed;
    }
    throw Exception('$this is not known in enum PipelineExecutionStatus');
  }
}

/// Summary information about a pipeline execution.
class PipelineExecutionSummary {
  /// The method that the pipeline will use to handle multiple executions. The
  /// default mode is SUPERSEDED.
  final ExecutionMode? executionMode;

  /// Type of the pipeline execution.
  final ExecutionType? executionType;

  /// The date and time of the last change to the pipeline execution, in timestamp
  /// format.
  final DateTime? lastUpdateTime;

  /// The ID of the pipeline execution.
  final String? pipelineExecutionId;

  /// The metadata for the stage execution to be rolled back.
  final PipelineRollbackMetadata? rollbackMetadata;

  /// A list of the source artifact revisions that initiated a pipeline execution.
  final List<SourceRevision>? sourceRevisions;

  /// The date and time when the pipeline execution began, in timestamp format.
  final DateTime? startTime;

  /// The status of the pipeline execution.
  ///
  /// <ul>
  /// <li>
  /// InProgress: The pipeline execution is currently running.
  /// </li>
  /// <li>
  /// Stopped: The pipeline execution was manually stopped. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped">Stopped
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Stopping: The pipeline execution received a request to be manually stopped.
  /// Depending on the selected stop mode, the execution is either completing or
  /// abandoning in-progress actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-executions-stopped">Stopped
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Succeeded: The pipeline execution was completed successfully.
  /// </li>
  /// <li>
  /// Superseded: While this pipeline execution was waiting for the next stage to
  /// be completed, a newer pipeline execution advanced and continued through the
  /// pipeline instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts.html#concepts-superseded">Superseded
  /// Executions</a>.
  /// </li>
  /// <li>
  /// Failed: The pipeline execution was not completed successfully.
  /// </li>
  /// </ul>
  final PipelineExecutionStatus? status;

  /// Status summary for the pipeline.
  final String? statusSummary;

  /// The interaction that stopped a pipeline execution.
  final StopExecutionTrigger? stopTrigger;

  /// The interaction or event that started a pipeline execution, such as
  /// automated change detection or a <code>StartPipelineExecution</code> API
  /// call.
  final ExecutionTrigger? trigger;

  PipelineExecutionSummary({
    this.executionMode,
    this.executionType,
    this.lastUpdateTime,
    this.pipelineExecutionId,
    this.rollbackMetadata,
    this.sourceRevisions,
    this.startTime,
    this.status,
    this.statusSummary,
    this.stopTrigger,
    this.trigger,
  });

  factory PipelineExecutionSummary.fromJson(Map<String, dynamic> json) {
    return PipelineExecutionSummary(
      executionMode: (json['executionMode'] as String?)?.toExecutionMode(),
      executionType: (json['executionType'] as String?)?.toExecutionType(),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
      rollbackMetadata: json['rollbackMetadata'] != null
          ? PipelineRollbackMetadata.fromJson(
              json['rollbackMetadata'] as Map<String, dynamic>)
          : null,
      sourceRevisions: (json['sourceRevisions'] as List?)
          ?.whereNotNull()
          .map((e) => SourceRevision.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toPipelineExecutionStatus(),
      statusSummary: json['statusSummary'] as String?,
      stopTrigger: json['stopTrigger'] != null
          ? StopExecutionTrigger.fromJson(
              json['stopTrigger'] as Map<String, dynamic>)
          : null,
      trigger: json['trigger'] != null
          ? ExecutionTrigger.fromJson(json['trigger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionMode = this.executionMode;
    final executionType = this.executionType;
    final lastUpdateTime = this.lastUpdateTime;
    final pipelineExecutionId = this.pipelineExecutionId;
    final rollbackMetadata = this.rollbackMetadata;
    final sourceRevisions = this.sourceRevisions;
    final startTime = this.startTime;
    final status = this.status;
    final statusSummary = this.statusSummary;
    final stopTrigger = this.stopTrigger;
    final trigger = this.trigger;
    return {
      if (executionMode != null) 'executionMode': executionMode.toValue(),
      if (executionType != null) 'executionType': executionType.toValue(),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
      if (rollbackMetadata != null) 'rollbackMetadata': rollbackMetadata,
      if (sourceRevisions != null) 'sourceRevisions': sourceRevisions,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusSummary != null) 'statusSummary': statusSummary,
      if (stopTrigger != null) 'stopTrigger': stopTrigger,
      if (trigger != null) 'trigger': trigger,
    };
  }
}

/// Information about a pipeline.
class PipelineMetadata {
  /// The date and time the pipeline was created, in timestamp format.
  final DateTime? created;

  /// The Amazon Resource Name (ARN) of the pipeline.
  final String? pipelineArn;

  /// The date and time that polling for source changes (periodic checks) was
  /// stopped for the pipeline, in timestamp format. You can migrate (update) a
  /// polling pipeline to use event-based change detection. For example, for a
  /// pipeline with a CodeCommit source, we recommend you migrate (update) your
  /// pipeline to use CloudWatch Events. To learn more, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/update-change-detection.html">Migrate
  /// polling pipelines to use event-based change detection</a> in the
  /// CodePipeline User Guide.
  final DateTime? pollingDisabledAt;

  /// The date and time the pipeline was last updated, in timestamp format.
  final DateTime? updated;

  PipelineMetadata({
    this.created,
    this.pipelineArn,
    this.pollingDisabledAt,
    this.updated,
  });

  factory PipelineMetadata.fromJson(Map<String, dynamic> json) {
    return PipelineMetadata(
      created: timeStampFromJson(json['created']),
      pipelineArn: json['pipelineArn'] as String?,
      pollingDisabledAt: timeStampFromJson(json['pollingDisabledAt']),
      updated: timeStampFromJson(json['updated']),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final pipelineArn = this.pipelineArn;
    final pollingDisabledAt = this.pollingDisabledAt;
    final updated = this.updated;
    return {
      if (created != null) 'created': unixTimestampToJson(created),
      if (pipelineArn != null) 'pipelineArn': pipelineArn,
      if (pollingDisabledAt != null)
        'pollingDisabledAt': unixTimestampToJson(pollingDisabledAt),
      if (updated != null) 'updated': unixTimestampToJson(updated),
    };
  }
}

/// The metadata for the stage execution to be rolled back.
class PipelineRollbackMetadata {
  /// The pipeline execution ID to which the stage will be rolled back.
  final String? rollbackTargetPipelineExecutionId;

  PipelineRollbackMetadata({
    this.rollbackTargetPipelineExecutionId,
  });

  factory PipelineRollbackMetadata.fromJson(Map<String, dynamic> json) {
    return PipelineRollbackMetadata(
      rollbackTargetPipelineExecutionId:
          json['rollbackTargetPipelineExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rollbackTargetPipelineExecutionId =
        this.rollbackTargetPipelineExecutionId;
    return {
      if (rollbackTargetPipelineExecutionId != null)
        'rollbackTargetPipelineExecutionId': rollbackTargetPipelineExecutionId,
    };
  }
}

/// Returns a summary of a pipeline.
class PipelineSummary {
  /// The date and time the pipeline was created, in timestamp format.
  final DateTime? created;

  /// The method that the pipeline will use to handle multiple executions. The
  /// default mode is SUPERSEDED.
  final ExecutionMode? executionMode;

  /// The name of the pipeline.
  final String? name;

  /// CodePipeline provides the following pipeline types, which differ in
  /// characteristics and price, so that you can tailor your pipeline features and
  /// cost to the needs of your applications.
  ///
  /// <ul>
  /// <li>
  /// V1 type pipelines have a JSON structure that contains standard pipeline,
  /// stage, and action-level parameters.
  /// </li>
  /// <li>
  /// V2 type pipelines have the same structure as a V1 type, along with
  /// additional parameters for release safety and trigger configuration.
  /// </li>
  /// </ul> <important>
  /// Including V2 parameters, such as triggers on Git tags, in the pipeline JSON
  /// when creating or updating a pipeline will result in the pipeline having the
  /// V2 type of pipeline and the associated costs.
  /// </important>
  /// For information about pricing for CodePipeline, see <a
  /// href="http://aws.amazon.com/codepipeline/pricing/">Pricing</a>.
  ///
  /// For information about which type of pipeline to choose, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-types-planning.html">What
  /// type of pipeline is right for me?</a>.
  final PipelineType? pipelineType;

  /// The date and time of the last update to the pipeline, in timestamp format.
  final DateTime? updated;

  /// The version number of the pipeline.
  final int? version;

  PipelineSummary({
    this.created,
    this.executionMode,
    this.name,
    this.pipelineType,
    this.updated,
    this.version,
  });

  factory PipelineSummary.fromJson(Map<String, dynamic> json) {
    return PipelineSummary(
      created: timeStampFromJson(json['created']),
      executionMode: (json['executionMode'] as String?)?.toExecutionMode(),
      name: json['name'] as String?,
      pipelineType: (json['pipelineType'] as String?)?.toPipelineType(),
      updated: timeStampFromJson(json['updated']),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final executionMode = this.executionMode;
    final name = this.name;
    final pipelineType = this.pipelineType;
    final updated = this.updated;
    final version = this.version;
    return {
      if (created != null) 'created': unixTimestampToJson(created),
      if (executionMode != null) 'executionMode': executionMode.toValue(),
      if (name != null) 'name': name,
      if (pipelineType != null) 'pipelineType': pipelineType.toValue(),
      if (updated != null) 'updated': unixTimestampToJson(updated),
      if (version != null) 'version': version,
    };
  }
}

/// Represents information about the specified trigger configuration, such as
/// the filter criteria and the source stage for the action that contains the
/// trigger.
/// <note>
/// This is only supported for the <code>CodeStarSourceConnection</code> action
/// type.
/// </note> <note>
/// When a trigger configuration is specified, default change detection for
/// repository and branch commits is disabled.
/// </note>
class PipelineTriggerDeclaration {
  /// Provides the filter criteria and the source stage for the repository event
  /// that starts the pipeline, such as Git tags.
  final GitConfiguration gitConfiguration;

  /// The source provider for the event, such as connections configured for a
  /// repository with Git tags, for the specified trigger configuration.
  final PipelineTriggerProviderType providerType;

  PipelineTriggerDeclaration({
    required this.gitConfiguration,
    required this.providerType,
  });

  factory PipelineTriggerDeclaration.fromJson(Map<String, dynamic> json) {
    return PipelineTriggerDeclaration(
      gitConfiguration: GitConfiguration.fromJson(
          json['gitConfiguration'] as Map<String, dynamic>),
      providerType:
          (json['providerType'] as String).toPipelineTriggerProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final gitConfiguration = this.gitConfiguration;
    final providerType = this.providerType;
    return {
      'gitConfiguration': gitConfiguration,
      'providerType': providerType.toValue(),
    };
  }
}

enum PipelineTriggerProviderType {
  codeStarSourceConnection,
}

extension PipelineTriggerProviderTypeValueExtension
    on PipelineTriggerProviderType {
  String toValue() {
    switch (this) {
      case PipelineTriggerProviderType.codeStarSourceConnection:
        return 'CodeStarSourceConnection';
    }
  }
}

extension PipelineTriggerProviderTypeFromString on String {
  PipelineTriggerProviderType toPipelineTriggerProviderType() {
    switch (this) {
      case 'CodeStarSourceConnection':
        return PipelineTriggerProviderType.codeStarSourceConnection;
    }
    throw Exception('$this is not known in enum PipelineTriggerProviderType');
  }
}

enum PipelineType {
  v1,
  v2,
}

extension PipelineTypeValueExtension on PipelineType {
  String toValue() {
    switch (this) {
      case PipelineType.v1:
        return 'V1';
      case PipelineType.v2:
        return 'V2';
    }
  }
}

extension PipelineTypeFromString on String {
  PipelineType toPipelineType() {
    switch (this) {
      case 'V1':
        return PipelineType.v1;
      case 'V2':
        return PipelineType.v2;
    }
    throw Exception('$this is not known in enum PipelineType');
  }
}

/// A pipeline-level variable used for a pipeline execution.
class PipelineVariable {
  /// The name of a pipeline-level variable.
  final String name;

  /// The value of a pipeline-level variable.
  final String value;

  PipelineVariable({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// A variable declared at the pipeline level.
class PipelineVariableDeclaration {
  /// The name of a pipeline-level variable.
  final String name;

  /// The value of a pipeline-level variable.
  final String? defaultValue;

  /// The description of a pipeline-level variable. It's used to add additional
  /// context about the variable, and not being used at time when pipeline
  /// executes.
  final String? description;

  PipelineVariableDeclaration({
    required this.name,
    this.defaultValue,
    this.description,
  });

  factory PipelineVariableDeclaration.fromJson(Map<String, dynamic> json) {
    return PipelineVariableDeclaration(
      name: json['name'] as String,
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final defaultValue = this.defaultValue;
    final description = this.description;
    return {
      'name': name,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
    };
  }
}

/// Represents the output of a <code>PollForJobs</code> action.
class PollForJobsOutput {
  /// Information about the jobs to take action on.
  final List<Job>? jobs;

  PollForJobsOutput({
    this.jobs,
  });

  factory PollForJobsOutput.fromJson(Map<String, dynamic> json) {
    return PollForJobsOutput(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    return {
      if (jobs != null) 'jobs': jobs,
    };
  }
}

/// Represents the output of a <code>PollForThirdPartyJobs</code> action.
class PollForThirdPartyJobsOutput {
  /// Information about the jobs to take action on.
  final List<ThirdPartyJob>? jobs;

  PollForThirdPartyJobsOutput({
    this.jobs,
  });

  factory PollForThirdPartyJobsOutput.fromJson(Map<String, dynamic> json) {
    return PollForThirdPartyJobsOutput(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => ThirdPartyJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    return {
      if (jobs != null) 'jobs': jobs,
    };
  }
}

/// Represents the output of a <code>PutActionRevision</code> action.
class PutActionRevisionOutput {
  /// Indicates whether the artifact revision was previously used in an execution
  /// of the specified pipeline.
  final bool? newRevision;

  /// The ID of the current workflow state of the pipeline.
  final String? pipelineExecutionId;

  PutActionRevisionOutput({
    this.newRevision,
    this.pipelineExecutionId,
  });

  factory PutActionRevisionOutput.fromJson(Map<String, dynamic> json) {
    return PutActionRevisionOutput(
      newRevision: json['newRevision'] as bool?,
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final newRevision = this.newRevision;
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      if (newRevision != null) 'newRevision': newRevision,
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

/// Represents the output of a <code>PutApprovalResult</code> action.
class PutApprovalResultOutput {
  /// The timestamp showing when the approval or rejection was submitted.
  final DateTime? approvedAt;

  PutApprovalResultOutput({
    this.approvedAt,
  });

  factory PutApprovalResultOutput.fromJson(Map<String, dynamic> json) {
    return PutApprovalResultOutput(
      approvedAt: timeStampFromJson(json['approvedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final approvedAt = this.approvedAt;
    return {
      if (approvedAt != null) 'approvedAt': unixTimestampToJson(approvedAt),
    };
  }
}

class PutWebhookOutput {
  /// The detail returned from creating the webhook, such as the webhook name,
  /// webhook URL, and webhook ARN.
  final ListWebhookItem? webhook;

  PutWebhookOutput({
    this.webhook,
  });

  factory PutWebhookOutput.fromJson(Map<String, dynamic> json) {
    return PutWebhookOutput(
      webhook: json['webhook'] != null
          ? ListWebhookItem.fromJson(json['webhook'] as Map<String, dynamic>)
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

class RegisterWebhookWithThirdPartyOutput {
  RegisterWebhookWithThirdPartyOutput();

  factory RegisterWebhookWithThirdPartyOutput.fromJson(Map<String, dynamic> _) {
    return RegisterWebhookWithThirdPartyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A pipeline-level variable used for a pipeline execution.
class ResolvedPipelineVariable {
  /// The name of a pipeline-level variable.
  final String? name;

  /// The resolved value of a pipeline-level variable.
  final String? resolvedValue;

  ResolvedPipelineVariable({
    this.name,
    this.resolvedValue,
  });

  factory ResolvedPipelineVariable.fromJson(Map<String, dynamic> json) {
    return ResolvedPipelineVariable(
      name: json['name'] as String?,
      resolvedValue: json['resolvedValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final resolvedValue = this.resolvedValue;
    return {
      if (name != null) 'name': name,
      if (resolvedValue != null) 'resolvedValue': resolvedValue,
    };
  }
}

enum Result {
  rollback,
}

extension ResultValueExtension on Result {
  String toValue() {
    switch (this) {
      case Result.rollback:
        return 'ROLLBACK';
    }
  }
}

extension ResultFromString on String {
  Result toResult() {
    switch (this) {
      case 'ROLLBACK':
        return Result.rollback;
    }
    throw Exception('$this is not known in enum Result');
  }
}

/// Represents the output of a <code>RetryStageExecution</code> action.
class RetryStageExecutionOutput {
  /// The ID of the current workflow execution in the failed stage.
  final String? pipelineExecutionId;

  RetryStageExecutionOutput({
    this.pipelineExecutionId,
  });

  factory RetryStageExecutionOutput.fromJson(Map<String, dynamic> json) {
    return RetryStageExecutionOutput(
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

class RollbackStageOutput {
  /// The execution ID of the pipeline execution for the stage that has been
  /// rolled back.
  final String pipelineExecutionId;

  RollbackStageOutput({
    required this.pipelineExecutionId,
  });

  factory RollbackStageOutput.fromJson(Map<String, dynamic> json) {
    return RollbackStageOutput(
      pipelineExecutionId: json['pipelineExecutionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

/// The location of the S3 bucket that contains a revision.
class S3ArtifactLocation {
  /// The name of the S3 bucket.
  final String bucketName;

  /// The key of the object in the S3 bucket, which uniquely identifies the object
  /// in the bucket.
  final String objectKey;

  S3ArtifactLocation({
    required this.bucketName,
    required this.objectKey,
  });

  factory S3ArtifactLocation.fromJson(Map<String, dynamic> json) {
    return S3ArtifactLocation(
      bucketName: json['bucketName'] as String,
      objectKey: json['objectKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    return {
      'bucketName': bucketName,
      'objectKey': objectKey,
    };
  }
}

/// The Amazon S3 artifact location for an action's artifacts.
class S3Location {
  /// The Amazon S3 artifact bucket for an action's artifacts.
  final String? bucket;

  /// The artifact name.
  final String? key;

  S3Location({
    this.bucket,
    this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'bucket': bucket,
      if (key != null) 'key': key,
    };
  }
}

/// Information about the version (or revision) of a source artifact that
/// initiated a pipeline execution.
class SourceRevision {
  /// The name of the action that processed the revision to the source artifact.
  final String actionName;

  /// The system-generated unique ID that identifies the revision number of the
  /// artifact.
  final String? revisionId;

  /// Summary information about the most recent revision of the artifact. For
  /// GitHub and CodeCommit repositories, the commit message. For Amazon S3
  /// buckets or actions, the user-provided content of a
  /// <code>codepipeline-artifact-revision-summary</code> key specified in the
  /// object metadata.
  final String? revisionSummary;

  /// The commit ID for the artifact revision. For artifacts stored in GitHub or
  /// CodeCommit repositories, the commit ID is linked to a commit details page.
  final String? revisionUrl;

  SourceRevision({
    required this.actionName,
    this.revisionId,
    this.revisionSummary,
    this.revisionUrl,
  });

  factory SourceRevision.fromJson(Map<String, dynamic> json) {
    return SourceRevision(
      actionName: json['actionName'] as String,
      revisionId: json['revisionId'] as String?,
      revisionSummary: json['revisionSummary'] as String?,
      revisionUrl: json['revisionUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final revisionId = this.revisionId;
    final revisionSummary = this.revisionSummary;
    final revisionUrl = this.revisionUrl;
    return {
      'actionName': actionName,
      if (revisionId != null) 'revisionId': revisionId,
      if (revisionSummary != null) 'revisionSummary': revisionSummary,
      if (revisionUrl != null) 'revisionUrl': revisionUrl,
    };
  }
}

/// A list that allows you to specify, or override, the source revision for a
/// pipeline execution that's being started. A source revision is the version
/// with all the changes to your application code, or source artifact, for the
/// pipeline execution.
class SourceRevisionOverride {
  /// The name of the action where the override will be applied.
  final String actionName;

  /// The type of source revision, based on the source provider. For example, the
  /// revision type for the CodeCommit action provider is the commit ID.
  final SourceRevisionType revisionType;

  /// The source revision, or version of your source artifact, with the changes
  /// that you want to run in the pipeline execution.
  final String revisionValue;

  SourceRevisionOverride({
    required this.actionName,
    required this.revisionType,
    required this.revisionValue,
  });

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final revisionType = this.revisionType;
    final revisionValue = this.revisionValue;
    return {
      'actionName': actionName,
      'revisionType': revisionType.toValue(),
      'revisionValue': revisionValue,
    };
  }
}

enum SourceRevisionType {
  commitId,
  imageDigest,
  s3ObjectVersionId,
}

extension SourceRevisionTypeValueExtension on SourceRevisionType {
  String toValue() {
    switch (this) {
      case SourceRevisionType.commitId:
        return 'COMMIT_ID';
      case SourceRevisionType.imageDigest:
        return 'IMAGE_DIGEST';
      case SourceRevisionType.s3ObjectVersionId:
        return 'S3_OBJECT_VERSION_ID';
    }
  }
}

extension SourceRevisionTypeFromString on String {
  SourceRevisionType toSourceRevisionType() {
    switch (this) {
      case 'COMMIT_ID':
        return SourceRevisionType.commitId;
      case 'IMAGE_DIGEST':
        return SourceRevisionType.imageDigest;
      case 'S3_OBJECT_VERSION_ID':
        return SourceRevisionType.s3ObjectVersionId;
    }
    throw Exception('$this is not known in enum SourceRevisionType');
  }
}

/// Represents information about a stage to a job worker.
class StageContext {
  /// The name of the stage.
  final String? name;

  StageContext({
    this.name,
  });

  factory StageContext.fromJson(Map<String, dynamic> json) {
    return StageContext(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Represents information about a stage and its definition.
class StageDeclaration {
  /// The actions included in a stage.
  final List<ActionDeclaration> actions;

  /// The name of the stage.
  final String name;

  /// Reserved for future use.
  final List<BlockerDeclaration>? blockers;

  /// The method to use when a stage has not completed successfully. For example,
  /// configuring this field for rollback will roll back a failed stage
  /// automatically to the last successful pipeline execution in the stage.
  final FailureConditions? onFailure;

  StageDeclaration({
    required this.actions,
    required this.name,
    this.blockers,
    this.onFailure,
  });

  factory StageDeclaration.fromJson(Map<String, dynamic> json) {
    return StageDeclaration(
      actions: (json['actions'] as List)
          .whereNotNull()
          .map((e) => ActionDeclaration.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      blockers: (json['blockers'] as List?)
          ?.whereNotNull()
          .map((e) => BlockerDeclaration.fromJson(e as Map<String, dynamic>))
          .toList(),
      onFailure: json['onFailure'] != null
          ? FailureConditions.fromJson(
              json['onFailure'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final name = this.name;
    final blockers = this.blockers;
    final onFailure = this.onFailure;
    return {
      'actions': actions,
      'name': name,
      if (blockers != null) 'blockers': blockers,
      if (onFailure != null) 'onFailure': onFailure,
    };
  }
}

/// Represents information about the run of a stage.
class StageExecution {
  /// The ID of the pipeline execution associated with the stage.
  final String pipelineExecutionId;

  /// The status of the stage, or for a completed stage, the last status of the
  /// stage.
  /// <note>
  /// A status of cancelled means that the pipeline’s definition was updated
  /// before the stage execution could be completed.
  /// </note>
  final StageExecutionStatus status;

  /// The type of pipeline execution for the stage, such as a rollback pipeline
  /// execution.
  final ExecutionType? type;

  StageExecution({
    required this.pipelineExecutionId,
    required this.status,
    this.type,
  });

  factory StageExecution.fromJson(Map<String, dynamic> json) {
    return StageExecution(
      pipelineExecutionId: json['pipelineExecutionId'] as String,
      status: (json['status'] as String).toStageExecutionStatus(),
      type: (json['type'] as String?)?.toExecutionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    final status = this.status;
    final type = this.type;
    return {
      'pipelineExecutionId': pipelineExecutionId,
      'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum StageExecutionStatus {
  cancelled,
  inProgress,
  failed,
  stopped,
  stopping,
  succeeded,
}

extension StageExecutionStatusValueExtension on StageExecutionStatus {
  String toValue() {
    switch (this) {
      case StageExecutionStatus.cancelled:
        return 'Cancelled';
      case StageExecutionStatus.inProgress:
        return 'InProgress';
      case StageExecutionStatus.failed:
        return 'Failed';
      case StageExecutionStatus.stopped:
        return 'Stopped';
      case StageExecutionStatus.stopping:
        return 'Stopping';
      case StageExecutionStatus.succeeded:
        return 'Succeeded';
    }
  }
}

extension StageExecutionStatusFromString on String {
  StageExecutionStatus toStageExecutionStatus() {
    switch (this) {
      case 'Cancelled':
        return StageExecutionStatus.cancelled;
      case 'InProgress':
        return StageExecutionStatus.inProgress;
      case 'Failed':
        return StageExecutionStatus.failed;
      case 'Stopped':
        return StageExecutionStatus.stopped;
      case 'Stopping':
        return StageExecutionStatus.stopping;
      case 'Succeeded':
        return StageExecutionStatus.succeeded;
    }
    throw Exception('$this is not known in enum StageExecutionStatus');
  }
}

enum StageRetryMode {
  failedActions,
  allActions,
}

extension StageRetryModeValueExtension on StageRetryMode {
  String toValue() {
    switch (this) {
      case StageRetryMode.failedActions:
        return 'FAILED_ACTIONS';
      case StageRetryMode.allActions:
        return 'ALL_ACTIONS';
    }
  }
}

extension StageRetryModeFromString on String {
  StageRetryMode toStageRetryMode() {
    switch (this) {
      case 'FAILED_ACTIONS':
        return StageRetryMode.failedActions;
      case 'ALL_ACTIONS':
        return StageRetryMode.allActions;
    }
    throw Exception('$this is not known in enum StageRetryMode');
  }
}

/// Represents information about the state of the stage.
class StageState {
  /// The state of the stage.
  final List<ActionState>? actionStates;
  final StageExecution? inboundExecution;

  /// The inbound executions for a stage.
  final List<StageExecution>? inboundExecutions;

  /// The state of the inbound transition, which is either enabled or disabled.
  final TransitionState? inboundTransitionState;

  /// Information about the latest execution in the stage, including its ID and
  /// status.
  final StageExecution? latestExecution;

  /// The name of the stage.
  final String? stageName;

  StageState({
    this.actionStates,
    this.inboundExecution,
    this.inboundExecutions,
    this.inboundTransitionState,
    this.latestExecution,
    this.stageName,
  });

  factory StageState.fromJson(Map<String, dynamic> json) {
    return StageState(
      actionStates: (json['actionStates'] as List?)
          ?.whereNotNull()
          .map((e) => ActionState.fromJson(e as Map<String, dynamic>))
          .toList(),
      inboundExecution: json['inboundExecution'] != null
          ? StageExecution.fromJson(
              json['inboundExecution'] as Map<String, dynamic>)
          : null,
      inboundExecutions: (json['inboundExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => StageExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      inboundTransitionState: json['inboundTransitionState'] != null
          ? TransitionState.fromJson(
              json['inboundTransitionState'] as Map<String, dynamic>)
          : null,
      latestExecution: json['latestExecution'] != null
          ? StageExecution.fromJson(
              json['latestExecution'] as Map<String, dynamic>)
          : null,
      stageName: json['stageName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionStates = this.actionStates;
    final inboundExecution = this.inboundExecution;
    final inboundExecutions = this.inboundExecutions;
    final inboundTransitionState = this.inboundTransitionState;
    final latestExecution = this.latestExecution;
    final stageName = this.stageName;
    return {
      if (actionStates != null) 'actionStates': actionStates,
      if (inboundExecution != null) 'inboundExecution': inboundExecution,
      if (inboundExecutions != null) 'inboundExecutions': inboundExecutions,
      if (inboundTransitionState != null)
        'inboundTransitionState': inboundTransitionState,
      if (latestExecution != null) 'latestExecution': latestExecution,
      if (stageName != null) 'stageName': stageName,
    };
  }
}

enum StageTransitionType {
  inbound,
  outbound,
}

extension StageTransitionTypeValueExtension on StageTransitionType {
  String toValue() {
    switch (this) {
      case StageTransitionType.inbound:
        return 'Inbound';
      case StageTransitionType.outbound:
        return 'Outbound';
    }
  }
}

extension StageTransitionTypeFromString on String {
  StageTransitionType toStageTransitionType() {
    switch (this) {
      case 'Inbound':
        return StageTransitionType.inbound;
      case 'Outbound':
        return StageTransitionType.outbound;
    }
    throw Exception('$this is not known in enum StageTransitionType');
  }
}

/// Represents the output of a <code>StartPipelineExecution</code> action.
class StartPipelineExecutionOutput {
  /// The unique system-generated ID of the pipeline execution that was started.
  final String? pipelineExecutionId;

  StartPipelineExecutionOutput({
    this.pipelineExecutionId,
  });

  factory StartPipelineExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StartPipelineExecutionOutput(
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

enum StartTimeRange {
  latest,
  all,
}

extension StartTimeRangeValueExtension on StartTimeRange {
  String toValue() {
    switch (this) {
      case StartTimeRange.latest:
        return 'Latest';
      case StartTimeRange.all:
        return 'All';
    }
  }
}

extension StartTimeRangeFromString on String {
  StartTimeRange toStartTimeRange() {
    switch (this) {
      case 'Latest':
        return StartTimeRange.latest;
      case 'All':
        return StartTimeRange.all;
    }
    throw Exception('$this is not known in enum StartTimeRange');
  }
}

/// The interaction that stopped a pipeline execution.
class StopExecutionTrigger {
  /// The user-specified reason the pipeline was stopped.
  final String? reason;

  StopExecutionTrigger({
    this.reason,
  });

  factory StopExecutionTrigger.fromJson(Map<String, dynamic> json) {
    return StopExecutionTrigger(
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    return {
      if (reason != null) 'reason': reason,
    };
  }
}

class StopPipelineExecutionOutput {
  /// The unique system-generated ID of the pipeline execution that was stopped.
  final String? pipelineExecutionId;

  StopPipelineExecutionOutput({
    this.pipelineExecutionId,
  });

  factory StopPipelineExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StopPipelineExecutionOutput(
      pipelineExecutionId: json['pipelineExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionId = this.pipelineExecutionId;
    return {
      if (pipelineExecutionId != null)
        'pipelineExecutionId': pipelineExecutionId,
    };
  }
}

/// Filter for pipeline executions that have successfully completed the stage in
/// the current pipeline version.
class SucceededInStageFilter {
  /// The name of the stage for filtering for pipeline executions where the stage
  /// was successful in the current pipeline version.
  final String? stageName;

  SucceededInStageFilter({
    this.stageName,
  });

  Map<String, dynamic> toJson() {
    final stageName = this.stageName;
    return {
      if (stageName != null) 'stageName': stageName,
    };
  }
}

/// A tag is a key-value pair that is used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A response to a <code>PollForThirdPartyJobs</code> request returned by
/// CodePipeline when there is a job to be worked on by a partner action.
class ThirdPartyJob {
  /// The <code>clientToken</code> portion of the <code>clientId</code> and
  /// <code>clientToken</code> pair used to verify that the calling entity is
  /// allowed access to the job and its details.
  final String? clientId;

  /// The identifier used to identify the job in CodePipeline.
  final String? jobId;

  ThirdPartyJob({
    this.clientId,
    this.jobId,
  });

  factory ThirdPartyJob.fromJson(Map<String, dynamic> json) {
    return ThirdPartyJob(
      clientId: json['clientId'] as String?,
      jobId: json['jobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final jobId = this.jobId;
    return {
      if (clientId != null) 'clientId': clientId,
      if (jobId != null) 'jobId': jobId,
    };
  }
}

/// Represents information about the job data for a partner action.
class ThirdPartyJobData {
  /// Represents information about an action configuration.
  final ActionConfiguration? actionConfiguration;

  /// Represents information about an action type.
  final ActionTypeId? actionTypeId;

  /// Represents an Amazon Web Services session credentials object. These
  /// credentials are temporary credentials that are issued by Amazon Web Services
  /// Secure Token Service (STS). They can be used to access input and output
  /// artifacts in the S3 bucket used to store artifact for the pipeline in
  /// CodePipeline.
  final AWSSessionCredentials? artifactCredentials;

  /// A system-generated token, such as a CodeDeploy deployment ID, that a job
  /// requires to continue the job asynchronously.
  final String? continuationToken;

  /// The encryption key used to encrypt and decrypt data in the artifact store
  /// for the pipeline, such as an Amazon Web Services Key Management Service
  /// (Amazon Web Services KMS) key. This is optional and might not be present.
  final EncryptionKey? encryptionKey;

  /// The name of the artifact that is worked on by the action, if any. This name
  /// might be system-generated, such as "MyApp", or it might be defined by the
  /// user when the action is created. The input artifact name must match the name
  /// of an output artifact generated by an action in an earlier action or stage
  /// of the pipeline.
  final List<Artifact>? inputArtifacts;

  /// The name of the artifact that is the result of the action, if any. This name
  /// might be system-generated, such as "MyBuiltApp", or it might be defined by
  /// the user when the action is created.
  final List<Artifact>? outputArtifacts;

  /// Represents information about a pipeline to a job worker.
  /// <note>
  /// Does not include <code>pipelineArn</code> and
  /// <code>pipelineExecutionId</code> for ThirdParty jobs.
  /// </note>
  final PipelineContext? pipelineContext;

  ThirdPartyJobData({
    this.actionConfiguration,
    this.actionTypeId,
    this.artifactCredentials,
    this.continuationToken,
    this.encryptionKey,
    this.inputArtifacts,
    this.outputArtifacts,
    this.pipelineContext,
  });

  factory ThirdPartyJobData.fromJson(Map<String, dynamic> json) {
    return ThirdPartyJobData(
      actionConfiguration: json['actionConfiguration'] != null
          ? ActionConfiguration.fromJson(
              json['actionConfiguration'] as Map<String, dynamic>)
          : null,
      actionTypeId: json['actionTypeId'] != null
          ? ActionTypeId.fromJson(json['actionTypeId'] as Map<String, dynamic>)
          : null,
      artifactCredentials: json['artifactCredentials'] != null
          ? AWSSessionCredentials.fromJson(
              json['artifactCredentials'] as Map<String, dynamic>)
          : null,
      continuationToken: json['continuationToken'] as String?,
      encryptionKey: json['encryptionKey'] != null
          ? EncryptionKey.fromJson(
              json['encryptionKey'] as Map<String, dynamic>)
          : null,
      inputArtifacts: (json['inputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputArtifacts: (json['outputArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelineContext: json['pipelineContext'] != null
          ? PipelineContext.fromJson(
              json['pipelineContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionConfiguration = this.actionConfiguration;
    final actionTypeId = this.actionTypeId;
    final artifactCredentials = this.artifactCredentials;
    final continuationToken = this.continuationToken;
    final encryptionKey = this.encryptionKey;
    final inputArtifacts = this.inputArtifacts;
    final outputArtifacts = this.outputArtifacts;
    final pipelineContext = this.pipelineContext;
    return {
      if (actionConfiguration != null)
        'actionConfiguration': actionConfiguration,
      if (actionTypeId != null) 'actionTypeId': actionTypeId,
      if (artifactCredentials != null)
        'artifactCredentials': artifactCredentials,
      if (continuationToken != null) 'continuationToken': continuationToken,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (inputArtifacts != null) 'inputArtifacts': inputArtifacts,
      if (outputArtifacts != null) 'outputArtifacts': outputArtifacts,
      if (pipelineContext != null) 'pipelineContext': pipelineContext,
    };
  }
}

/// The details of a job sent in response to a
/// <code>GetThirdPartyJobDetails</code> request.
class ThirdPartyJobDetails {
  /// The data to be returned by the third party job worker.
  final ThirdPartyJobData? data;

  /// The identifier used to identify the job details in CodePipeline.
  final String? id;

  /// A system-generated random number that CodePipeline uses to ensure that the
  /// job is being worked on by only one job worker. Use this number in an
  /// <a>AcknowledgeThirdPartyJob</a> request.
  final String? nonce;

  ThirdPartyJobDetails({
    this.data,
    this.id,
    this.nonce,
  });

  factory ThirdPartyJobDetails.fromJson(Map<String, dynamic> json) {
    return ThirdPartyJobDetails(
      data: json['data'] != null
          ? ThirdPartyJobData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      nonce: json['nonce'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final id = this.id;
    final nonce = this.nonce;
    return {
      if (data != null) 'data': data,
      if (id != null) 'id': id,
      if (nonce != null) 'nonce': nonce,
    };
  }
}

/// Represents information about the state of transitions between one stage and
/// another stage.
class TransitionState {
  /// The user-specified reason why the transition between two stages of a
  /// pipeline was disabled.
  final String? disabledReason;

  /// Whether the transition between stages is enabled (true) or disabled (false).
  final bool? enabled;

  /// The timestamp when the transition state was last changed.
  final DateTime? lastChangedAt;

  /// The ID of the user who last changed the transition state.
  final String? lastChangedBy;

  TransitionState({
    this.disabledReason,
    this.enabled,
    this.lastChangedAt,
    this.lastChangedBy,
  });

  factory TransitionState.fromJson(Map<String, dynamic> json) {
    return TransitionState(
      disabledReason: json['disabledReason'] as String?,
      enabled: json['enabled'] as bool?,
      lastChangedAt: timeStampFromJson(json['lastChangedAt']),
      lastChangedBy: json['lastChangedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disabledReason = this.disabledReason;
    final enabled = this.enabled;
    final lastChangedAt = this.lastChangedAt;
    final lastChangedBy = this.lastChangedBy;
    return {
      if (disabledReason != null) 'disabledReason': disabledReason,
      if (enabled != null) 'enabled': enabled,
      if (lastChangedAt != null)
        'lastChangedAt': unixTimestampToJson(lastChangedAt),
      if (lastChangedBy != null) 'lastChangedBy': lastChangedBy,
    };
  }
}

enum TriggerType {
  createPipeline,
  startPipelineExecution,
  pollForSourceChanges,
  webhook,
  cloudWatchEvent,
  putActionRevision,
  webhookV2,
  manualRollback,
  automatedRollback,
}

extension TriggerTypeValueExtension on TriggerType {
  String toValue() {
    switch (this) {
      case TriggerType.createPipeline:
        return 'CreatePipeline';
      case TriggerType.startPipelineExecution:
        return 'StartPipelineExecution';
      case TriggerType.pollForSourceChanges:
        return 'PollForSourceChanges';
      case TriggerType.webhook:
        return 'Webhook';
      case TriggerType.cloudWatchEvent:
        return 'CloudWatchEvent';
      case TriggerType.putActionRevision:
        return 'PutActionRevision';
      case TriggerType.webhookV2:
        return 'WebhookV2';
      case TriggerType.manualRollback:
        return 'ManualRollback';
      case TriggerType.automatedRollback:
        return 'AutomatedRollback';
    }
  }
}

extension TriggerTypeFromString on String {
  TriggerType toTriggerType() {
    switch (this) {
      case 'CreatePipeline':
        return TriggerType.createPipeline;
      case 'StartPipelineExecution':
        return TriggerType.startPipelineExecution;
      case 'PollForSourceChanges':
        return TriggerType.pollForSourceChanges;
      case 'Webhook':
        return TriggerType.webhook;
      case 'CloudWatchEvent':
        return TriggerType.cloudWatchEvent;
      case 'PutActionRevision':
        return TriggerType.putActionRevision;
      case 'WebhookV2':
        return TriggerType.webhookV2;
      case 'ManualRollback':
        return TriggerType.manualRollback;
      case 'AutomatedRollback':
        return TriggerType.automatedRollback;
    }
    throw Exception('$this is not known in enum TriggerType');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of an <code>UpdatePipeline</code> action.
class UpdatePipelineOutput {
  /// The structure of the updated pipeline.
  final PipelineDeclaration? pipeline;

  UpdatePipelineOutput({
    this.pipeline,
  });

  factory UpdatePipelineOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePipelineOutput(
      pipeline: json['pipeline'] != null
          ? PipelineDeclaration.fromJson(
              json['pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'pipeline': pipeline,
    };
  }
}

/// The authentication applied to incoming webhook trigger requests.
class WebhookAuthConfiguration {
  /// The property used to configure acceptance of webhooks in an IP address
  /// range. For IP, only the <code>AllowedIPRange</code> property must be set.
  /// This property must be set to a valid CIDR range.
  final String? allowedIPRange;

  /// The property used to configure GitHub authentication. For GITHUB_HMAC, only
  /// the <code>SecretToken</code> property must be set.
  final String? secretToken;

  WebhookAuthConfiguration({
    this.allowedIPRange,
    this.secretToken,
  });

  factory WebhookAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return WebhookAuthConfiguration(
      allowedIPRange: json['AllowedIPRange'] as String?,
      secretToken: json['SecretToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedIPRange = this.allowedIPRange;
    final secretToken = this.secretToken;
    return {
      if (allowedIPRange != null) 'AllowedIPRange': allowedIPRange,
      if (secretToken != null) 'SecretToken': secretToken,
    };
  }
}

enum WebhookAuthenticationType {
  githubHmac,
  ip,
  unauthenticated,
}

extension WebhookAuthenticationTypeValueExtension on WebhookAuthenticationType {
  String toValue() {
    switch (this) {
      case WebhookAuthenticationType.githubHmac:
        return 'GITHUB_HMAC';
      case WebhookAuthenticationType.ip:
        return 'IP';
      case WebhookAuthenticationType.unauthenticated:
        return 'UNAUTHENTICATED';
    }
  }
}

extension WebhookAuthenticationTypeFromString on String {
  WebhookAuthenticationType toWebhookAuthenticationType() {
    switch (this) {
      case 'GITHUB_HMAC':
        return WebhookAuthenticationType.githubHmac;
      case 'IP':
        return WebhookAuthenticationType.ip;
      case 'UNAUTHENTICATED':
        return WebhookAuthenticationType.unauthenticated;
    }
    throw Exception('$this is not known in enum WebhookAuthenticationType');
  }
}

/// Represents information about a webhook and its definition.
class WebhookDefinition {
  /// Supported options are GITHUB_HMAC, IP, and UNAUTHENTICATED.
  ///
  /// <ul>
  /// <li>
  /// For information about the authentication scheme implemented by GITHUB_HMAC,
  /// see <a href="https://developer.github.com/webhooks/securing/">Securing your
  /// webhooks</a> on the GitHub Developer website.
  /// </li>
  /// <li>
  /// IP rejects webhooks trigger requests unless they originate from an IP
  /// address in the IP range whitelisted in the authentication configuration.
  /// </li>
  /// <li>
  /// UNAUTHENTICATED accepts all webhook trigger requests regardless of origin.
  /// </li>
  /// </ul>
  final WebhookAuthenticationType authentication;

  /// Properties that configure the authentication applied to incoming webhook
  /// trigger requests. The required properties depend on the authentication type.
  /// For GITHUB_HMAC, only the <code>SecretToken </code>property must be set. For
  /// IP, only the <code>AllowedIPRange </code>property must be set to a valid
  /// CIDR range. For UNAUTHENTICATED, no properties can be set.
  final WebhookAuthConfiguration authenticationConfiguration;

  /// A list of rules applied to the body/payload sent in the POST request to a
  /// webhook URL. All defined rules must pass for the request to be accepted and
  /// the pipeline started.
  final List<WebhookFilterRule> filters;

  /// The name of the webhook.
  final String name;

  /// The name of the action in a pipeline you want to connect to the webhook. The
  /// action must be from the source (first) stage of the pipeline.
  final String targetAction;

  /// The name of the pipeline you want to connect to the webhook.
  final String targetPipeline;

  WebhookDefinition({
    required this.authentication,
    required this.authenticationConfiguration,
    required this.filters,
    required this.name,
    required this.targetAction,
    required this.targetPipeline,
  });

  factory WebhookDefinition.fromJson(Map<String, dynamic> json) {
    return WebhookDefinition(
      authentication:
          (json['authentication'] as String).toWebhookAuthenticationType(),
      authenticationConfiguration: WebhookAuthConfiguration.fromJson(
          json['authenticationConfiguration'] as Map<String, dynamic>),
      filters: (json['filters'] as List)
          .whereNotNull()
          .map((e) => WebhookFilterRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      targetAction: json['targetAction'] as String,
      targetPipeline: json['targetPipeline'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final authenticationConfiguration = this.authenticationConfiguration;
    final filters = this.filters;
    final name = this.name;
    final targetAction = this.targetAction;
    final targetPipeline = this.targetPipeline;
    return {
      'authentication': authentication.toValue(),
      'authenticationConfiguration': authenticationConfiguration,
      'filters': filters,
      'name': name,
      'targetAction': targetAction,
      'targetPipeline': targetPipeline,
    };
  }
}

/// The event criteria that specify when a webhook notification is sent to your
/// URL.
class WebhookFilterRule {
  /// A JsonPath expression that is applied to the body/payload of the webhook.
  /// The value selected by the JsonPath expression must match the value specified
  /// in the <code>MatchEquals</code> field. Otherwise, the request is ignored.
  /// For more information, see <a
  /// href="https://github.com/json-path/JsonPath">Java JsonPath
  /// implementation</a> in GitHub.
  final String jsonPath;

  /// The value selected by the <code>JsonPath</code> expression must match what
  /// is supplied in the <code>MatchEquals</code> field. Otherwise, the request is
  /// ignored. Properties from the target action configuration can be included as
  /// placeholders in this value by surrounding the action configuration key with
  /// curly brackets. For example, if the value supplied here is
  /// "refs/heads/{Branch}" and the target action has an action configuration
  /// property called "Branch" with a value of "main", the
  /// <code>MatchEquals</code> value is evaluated as "refs/heads/main". For a list
  /// of action configuration properties for built-in action types, see <a
  /// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements">Pipeline
  /// Structure Reference Action Requirements</a>.
  final String? matchEquals;

  WebhookFilterRule({
    required this.jsonPath,
    this.matchEquals,
  });

  factory WebhookFilterRule.fromJson(Map<String, dynamic> json) {
    return WebhookFilterRule(
      jsonPath: json['jsonPath'] as String,
      matchEquals: json['matchEquals'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final matchEquals = this.matchEquals;
    return {
      'jsonPath': jsonPath,
      if (matchEquals != null) 'matchEquals': matchEquals,
    };
  }
}

class ActionNotFoundException extends _s.GenericAwsException {
  ActionNotFoundException({String? type, String? message})
      : super(type: type, code: 'ActionNotFoundException', message: message);
}

class ActionTypeNotFoundException extends _s.GenericAwsException {
  ActionTypeNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'ActionTypeNotFoundException', message: message);
}

class ApprovalAlreadyCompletedException extends _s.GenericAwsException {
  ApprovalAlreadyCompletedException({String? type, String? message})
      : super(
            type: type,
            code: 'ApprovalAlreadyCompletedException',
            message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConcurrentPipelineExecutionsLimitExceededException
    extends _s.GenericAwsException {
  ConcurrentPipelineExecutionsLimitExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentPipelineExecutionsLimitExceededException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DuplicatedStopRequestException extends _s.GenericAwsException {
  DuplicatedStopRequestException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicatedStopRequestException',
            message: message);
}

class InvalidActionDeclarationException extends _s.GenericAwsException {
  InvalidActionDeclarationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidActionDeclarationException',
            message: message);
}

class InvalidApprovalTokenException extends _s.GenericAwsException {
  InvalidApprovalTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApprovalTokenException',
            message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidBlockerDeclarationException extends _s.GenericAwsException {
  InvalidBlockerDeclarationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidBlockerDeclarationException',
            message: message);
}

class InvalidClientTokenException extends _s.GenericAwsException {
  InvalidClientTokenException({String? type, String? message})
      : super(
            type: type, code: 'InvalidClientTokenException', message: message);
}

class InvalidJobException extends _s.GenericAwsException {
  InvalidJobException({String? type, String? message})
      : super(type: type, code: 'InvalidJobException', message: message);
}

class InvalidJobStateException extends _s.GenericAwsException {
  InvalidJobStateException({String? type, String? message})
      : super(type: type, code: 'InvalidJobStateException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidNonceException extends _s.GenericAwsException {
  InvalidNonceException({String? type, String? message})
      : super(type: type, code: 'InvalidNonceException', message: message);
}

class InvalidStageDeclarationException extends _s.GenericAwsException {
  InvalidStageDeclarationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStageDeclarationException',
            message: message);
}

class InvalidStructureException extends _s.GenericAwsException {
  InvalidStructureException({String? type, String? message})
      : super(type: type, code: 'InvalidStructureException', message: message);
}

class InvalidTagsException extends _s.GenericAwsException {
  InvalidTagsException({String? type, String? message})
      : super(type: type, code: 'InvalidTagsException', message: message);
}

class InvalidWebhookAuthenticationParametersException
    extends _s.GenericAwsException {
  InvalidWebhookAuthenticationParametersException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'InvalidWebhookAuthenticationParametersException',
            message: message);
}

class InvalidWebhookFilterPatternException extends _s.GenericAwsException {
  InvalidWebhookFilterPatternException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidWebhookFilterPatternException',
            message: message);
}

class JobNotFoundException extends _s.GenericAwsException {
  JobNotFoundException({String? type, String? message})
      : super(type: type, code: 'JobNotFoundException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotLatestPipelineExecutionException extends _s.GenericAwsException {
  NotLatestPipelineExecutionException({String? type, String? message})
      : super(
            type: type,
            code: 'NotLatestPipelineExecutionException',
            message: message);
}

class OutputVariablesSizeExceededException extends _s.GenericAwsException {
  OutputVariablesSizeExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'OutputVariablesSizeExceededException',
            message: message);
}

class PipelineExecutionNotFoundException extends _s.GenericAwsException {
  PipelineExecutionNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'PipelineExecutionNotFoundException',
            message: message);
}

class PipelineExecutionNotStoppableException extends _s.GenericAwsException {
  PipelineExecutionNotStoppableException({String? type, String? message})
      : super(
            type: type,
            code: 'PipelineExecutionNotStoppableException',
            message: message);
}

class PipelineExecutionOutdatedException extends _s.GenericAwsException {
  PipelineExecutionOutdatedException({String? type, String? message})
      : super(
            type: type,
            code: 'PipelineExecutionOutdatedException',
            message: message);
}

class PipelineNameInUseException extends _s.GenericAwsException {
  PipelineNameInUseException({String? type, String? message})
      : super(type: type, code: 'PipelineNameInUseException', message: message);
}

class PipelineNotFoundException extends _s.GenericAwsException {
  PipelineNotFoundException({String? type, String? message})
      : super(type: type, code: 'PipelineNotFoundException', message: message);
}

class PipelineVersionNotFoundException extends _s.GenericAwsException {
  PipelineVersionNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'PipelineVersionNotFoundException',
            message: message);
}

class RequestFailedException extends _s.GenericAwsException {
  RequestFailedException({String? type, String? message})
      : super(type: type, code: 'RequestFailedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class StageNotFoundException extends _s.GenericAwsException {
  StageNotFoundException({String? type, String? message})
      : super(type: type, code: 'StageNotFoundException', message: message);
}

class StageNotRetryableException extends _s.GenericAwsException {
  StageNotRetryableException({String? type, String? message})
      : super(type: type, code: 'StageNotRetryableException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnableToRollbackStageException extends _s.GenericAwsException {
  UnableToRollbackStageException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToRollbackStageException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

class WebhookNotFoundException extends _s.GenericAwsException {
  WebhookNotFoundException({String? type, String? message})
      : super(type: type, code: 'WebhookNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActionNotFoundException': (type, message) =>
      ActionNotFoundException(type: type, message: message),
  'ActionTypeNotFoundException': (type, message) =>
      ActionTypeNotFoundException(type: type, message: message),
  'ApprovalAlreadyCompletedException': (type, message) =>
      ApprovalAlreadyCompletedException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConcurrentPipelineExecutionsLimitExceededException': (type, message) =>
      ConcurrentPipelineExecutionsLimitExceededException(
          type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DuplicatedStopRequestException': (type, message) =>
      DuplicatedStopRequestException(type: type, message: message),
  'InvalidActionDeclarationException': (type, message) =>
      InvalidActionDeclarationException(type: type, message: message),
  'InvalidApprovalTokenException': (type, message) =>
      InvalidApprovalTokenException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidBlockerDeclarationException': (type, message) =>
      InvalidBlockerDeclarationException(type: type, message: message),
  'InvalidClientTokenException': (type, message) =>
      InvalidClientTokenException(type: type, message: message),
  'InvalidJobException': (type, message) =>
      InvalidJobException(type: type, message: message),
  'InvalidJobStateException': (type, message) =>
      InvalidJobStateException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidNonceException': (type, message) =>
      InvalidNonceException(type: type, message: message),
  'InvalidStageDeclarationException': (type, message) =>
      InvalidStageDeclarationException(type: type, message: message),
  'InvalidStructureException': (type, message) =>
      InvalidStructureException(type: type, message: message),
  'InvalidTagsException': (type, message) =>
      InvalidTagsException(type: type, message: message),
  'InvalidWebhookAuthenticationParametersException': (type, message) =>
      InvalidWebhookAuthenticationParametersException(
          type: type, message: message),
  'InvalidWebhookFilterPatternException': (type, message) =>
      InvalidWebhookFilterPatternException(type: type, message: message),
  'JobNotFoundException': (type, message) =>
      JobNotFoundException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotLatestPipelineExecutionException': (type, message) =>
      NotLatestPipelineExecutionException(type: type, message: message),
  'OutputVariablesSizeExceededException': (type, message) =>
      OutputVariablesSizeExceededException(type: type, message: message),
  'PipelineExecutionNotFoundException': (type, message) =>
      PipelineExecutionNotFoundException(type: type, message: message),
  'PipelineExecutionNotStoppableException': (type, message) =>
      PipelineExecutionNotStoppableException(type: type, message: message),
  'PipelineExecutionOutdatedException': (type, message) =>
      PipelineExecutionOutdatedException(type: type, message: message),
  'PipelineNameInUseException': (type, message) =>
      PipelineNameInUseException(type: type, message: message),
  'PipelineNotFoundException': (type, message) =>
      PipelineNotFoundException(type: type, message: message),
  'PipelineVersionNotFoundException': (type, message) =>
      PipelineVersionNotFoundException(type: type, message: message),
  'RequestFailedException': (type, message) =>
      RequestFailedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'StageNotFoundException': (type, message) =>
      StageNotFoundException(type: type, message: message),
  'StageNotRetryableException': (type, message) =>
      StageNotRetryableException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnableToRollbackStageException': (type, message) =>
      UnableToRollbackStageException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'WebhookNotFoundException': (type, message) =>
      WebhookNotFoundException(type: type, message: message),
};
