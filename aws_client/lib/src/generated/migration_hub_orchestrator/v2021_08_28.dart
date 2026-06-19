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

/// This API reference provides descriptions, syntax, and other details about
/// each of the actions and data types for AWS Migration Hub Orchestrator. The
/// topic for each action shows the API request parameters and responses.
/// Alternatively, you can use one of the AWS SDKs to access an API that is
/// tailored to the programming language or platform that you're using.
class MigrationHubOrchestrator {
  final _s.RestJsonProtocol _protocol;
  MigrationHubOrchestrator({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'migrationhub-orchestrator',
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

  /// List the tags added to a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Tag a resource by specifying its Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to add
  /// tags.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key:value pairs, that apply to this
  /// resource.
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

  /// Deletes the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which you want to
  /// remove tags.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Specify only the tag keys, not the tag values.
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

  /// Create a workflow to orchestrate your migrations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputParameters] :
  /// The input parameters required to create a migration workflow.
  ///
  /// Parameter [name] :
  /// The name of the migration workflow.
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  ///
  /// Parameter [applicationConfigurationId] :
  /// The configuration ID of the application configured in Application
  /// Discovery Service.
  ///
  /// Parameter [description] :
  /// The description of the migration workflow.
  ///
  /// Parameter [stepTargets] :
  /// The servers on which a step will be run.
  ///
  /// Parameter [tags] :
  /// The tags to add on a migration workflow.
  Future<CreateMigrationWorkflowResponse> createWorkflow({
    required Map<String, StepInput> inputParameters,
    required String name,
    required String templateId,
    String? applicationConfigurationId,
    String? description,
    List<String>? stepTargets,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputParameters': inputParameters,
      'name': name,
      'templateId': templateId,
      if (applicationConfigurationId != null)
        'applicationConfigurationId': applicationConfigurationId,
      if (description != null) 'description': description,
      if (stepTargets != null) 'stepTargets': stepTargets,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/migrationworkflow/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMigrationWorkflowResponse.fromJson(response);
  }

  /// Get migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the migration workflow.
  Future<GetMigrationWorkflowResponse> getWorkflow({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrationworkflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMigrationWorkflowResponse.fromJson(response);
  }

  /// Update a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [description] :
  /// The description of the migration workflow.
  ///
  /// Parameter [inputParameters] :
  /// The input parameters required to update a migration workflow.
  ///
  /// Parameter [name] :
  /// The name of the migration workflow.
  ///
  /// Parameter [stepTargets] :
  /// The servers on which a step will be run.
  Future<UpdateMigrationWorkflowResponse> updateWorkflow({
    required String id,
    String? description,
    Map<String, StepInput>? inputParameters,
    String? name,
    List<String>? stepTargets,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (inputParameters != null) 'inputParameters': inputParameters,
      if (name != null) 'name': name,
      if (stepTargets != null) 'stepTargets': stepTargets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/migrationworkflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMigrationWorkflowResponse.fromJson(response);
  }

  /// Delete a migration workflow. You must pause a running workflow in
  /// Migration Hub Orchestrator console to delete it.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the migration workflow you want to delete.
  Future<DeleteMigrationWorkflowResponse> deleteWorkflow({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/migrationworkflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMigrationWorkflowResponse.fromJson(response);
  }

  /// List the migration workflows.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [adsApplicationConfigurationName] :
  /// The name of the application configured in Application Discovery Service.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [name] :
  /// The name of the migration workflow.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  ///
  /// Parameter [status] :
  /// The status of the migration workflow.
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  Future<ListMigrationWorkflowsResponse> listWorkflows({
    String? adsApplicationConfigurationName,
    int? maxResults,
    String? name,
    String? nextToken,
    MigrationWorkflowStatusEnum? status,
    String? templateId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (adsApplicationConfigurationName != null)
        'adsApplicationConfigurationName': [adsApplicationConfigurationName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
      if (templateId != null) 'templateId': [templateId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrationworkflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMigrationWorkflowsResponse.fromJson(response);
  }

  /// Start a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the migration workflow.
  Future<StartMigrationWorkflowResponse> startWorkflow({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/migrationworkflow/${Uri.encodeComponent(id)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMigrationWorkflowResponse.fromJson(response);
  }

  /// Stop an ongoing migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the migration workflow.
  Future<StopMigrationWorkflowResponse> stopWorkflow({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/migrationworkflow/${Uri.encodeComponent(id)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopMigrationWorkflowResponse.fromJson(response);
  }

  /// Creates a migration workflow template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [templateName] :
  /// The name of the migration workflow template.
  ///
  /// Parameter [templateSource] :
  /// The source of the migration workflow template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://smithy.io/2.0/spec/behavior-traits.html#idempotencytoken-trait">Idempotency</a>
  /// in the Smithy documentation.
  ///
  /// Parameter [tags] :
  /// The tags to add to the migration workflow template.
  ///
  /// Parameter [templateDescription] :
  /// A description of the migration workflow template.
  Future<CreateTemplateResponse> createTemplate({
    required String templateName,
    required TemplateSource templateSource,
    String? clientToken,
    Map<String, String>? tags,
    String? templateDescription,
  }) async {
    final $payload = <String, dynamic>{
      'templateName': templateName,
      'templateSource': templateSource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
      if (templateDescription != null)
        'templateDescription': templateDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/template',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateResponse.fromJson(response);
  }

  /// Get the template you want to use for creating a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the template.
  Future<GetMigrationWorkflowTemplateResponse> getTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrationworkflowtemplate/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMigrationWorkflowTemplateResponse.fromJson(response);
  }

  /// Updates a migration workflow template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the request to update a migration workflow template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [templateDescription] :
  /// The description of the migration workflow template to update.
  ///
  /// Parameter [templateName] :
  /// The name of the migration workflow template to update.
  Future<UpdateTemplateResponse> updateTemplate({
    required String id,
    String? clientToken,
    String? templateDescription,
    String? templateName,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (templateDescription != null)
        'templateDescription': templateDescription,
      if (templateName != null) 'templateName': templateName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/template/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTemplateResponse.fromJson(response);
  }

  /// Deletes a migration workflow template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the request to delete a migration workflow template.
  Future<void> deleteTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/template/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List the templates available in Migration Hub Orchestrator to create a
  /// migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [name] :
  /// The name of the template.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListMigrationWorkflowTemplatesResponse> listTemplates({
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/migrationworkflowtemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMigrationWorkflowTemplatesResponse.fromJson(response);
  }

  /// List AWS Migration Hub Orchestrator plugins.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of plugins that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListPluginsResponse> listPlugins({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/plugins',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPluginsResponse.fromJson(response);
  }

  /// Get a specific step in a template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  Future<GetTemplateStepResponse> getTemplateStep({
    required String id,
    required String stepGroupId,
    required String templateId,
  }) async {
    final $query = <String, List<String>>{
      'stepGroupId': [stepGroupId],
      'templateId': [templateId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templatestep/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTemplateStepResponse.fromJson(response);
  }

  /// List the steps in a template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListTemplateStepsResponse> listTemplateSteps({
    required String stepGroupId,
    required String templateId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      'stepGroupId': [stepGroupId],
      'templateId': [templateId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templatesteps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateStepsResponse.fromJson(response);
  }

  /// Get a step group in a template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step group.
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  Future<GetTemplateStepGroupResponse> getTemplateStepGroup({
    required String id,
    required String templateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/templates/${Uri.encodeComponent(templateId)}/stepgroups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemplateStepGroupResponse.fromJson(response);
  }

  /// List the step groups in a template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [templateId] :
  /// The ID of the template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListTemplateStepGroupsResponse> listTemplateStepGroups({
    required String templateId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templatestepgroups/${Uri.encodeComponent(templateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateStepGroupsResponse.fromJson(response);
  }

  /// Create a step in the migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the step.
  ///
  /// Parameter [stepActionType] :
  /// The action type of the step. You must run and update the status of a
  /// manual step for the workflow to continue after the completion of the step.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [description] :
  /// The description of the step.
  ///
  /// Parameter [next] :
  /// The next step.
  ///
  /// Parameter [outputs] :
  /// The key value pairs added for the expected output.
  ///
  /// Parameter [previous] :
  /// The previous step.
  ///
  /// Parameter [stepTarget] :
  /// The servers on which a step will be run.
  ///
  /// Parameter [workflowStepAutomationConfiguration] :
  /// The custom script to run tests on source or target environments.
  Future<CreateWorkflowStepResponse> createWorkflowStep({
    required String name,
    required StepActionType stepActionType,
    required String stepGroupId,
    required String workflowId,
    String? description,
    List<String>? next,
    List<WorkflowStepOutput>? outputs,
    List<String>? previous,
    List<String>? stepTarget,
    WorkflowStepAutomationConfiguration? workflowStepAutomationConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'stepActionType': stepActionType.value,
      'stepGroupId': stepGroupId,
      'workflowId': workflowId,
      if (description != null) 'description': description,
      if (next != null) 'next': next,
      if (outputs != null) 'outputs': outputs,
      if (previous != null) 'previous': previous,
      if (stepTarget != null) 'stepTarget': stepTarget,
      if (workflowStepAutomationConfiguration != null)
        'workflowStepAutomationConfiguration':
            workflowStepAutomationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflowstep',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowStepResponse.fromJson(response);
  }

  /// Get a step in the migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the step.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  Future<GetWorkflowStepResponse> getWorkflowStep({
    required String id,
    required String stepGroupId,
    required String workflowId,
  }) async {
    final $query = <String, List<String>>{
      'stepGroupId': [stepGroupId],
      'workflowId': [workflowId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflowstep/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowStepResponse.fromJson(response);
  }

  /// Update a step in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [description] :
  /// The description of the step.
  ///
  /// Parameter [name] :
  /// The name of the step.
  ///
  /// Parameter [next] :
  /// The next step.
  ///
  /// Parameter [outputs] :
  /// The outputs of a step.
  ///
  /// Parameter [previous] :
  /// The previous step.
  ///
  /// Parameter [status] :
  /// The status of the step.
  ///
  /// Parameter [stepActionType] :
  /// The action type of the step. You must run and update the status of a
  /// manual step for the workflow to continue after the completion of the step.
  ///
  /// Parameter [stepTarget] :
  /// The servers on which a step will be run.
  ///
  /// Parameter [workflowStepAutomationConfiguration] :
  /// The custom script to run tests on the source and target environments.
  Future<UpdateWorkflowStepResponse> updateWorkflowStep({
    required String id,
    required String stepGroupId,
    required String workflowId,
    String? description,
    String? name,
    List<String>? next,
    List<WorkflowStepOutput>? outputs,
    List<String>? previous,
    StepStatus? status,
    StepActionType? stepActionType,
    List<String>? stepTarget,
    WorkflowStepAutomationConfiguration? workflowStepAutomationConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'stepGroupId': stepGroupId,
      'workflowId': workflowId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (outputs != null) 'outputs': outputs,
      if (previous != null) 'previous': previous,
      if (status != null) 'status': status.value,
      if (stepActionType != null) 'stepActionType': stepActionType.value,
      if (stepTarget != null) 'stepTarget': stepTarget,
      if (workflowStepAutomationConfiguration != null)
        'workflowStepAutomationConfiguration':
            workflowStepAutomationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflowstep/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkflowStepResponse.fromJson(response);
  }

  /// Delete a step in a migration workflow. Pause the workflow to delete a
  /// running step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step you want to delete.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group that contains the step you want to delete.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  Future<void> deleteWorkflowStep({
    required String id,
    required String stepGroupId,
    required String workflowId,
  }) async {
    final $query = <String, List<String>>{
      'stepGroupId': [stepGroupId],
      'workflowId': [workflowId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workflowstep/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List the steps in a workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListWorkflowStepsResponse> listWorkflowSteps({
    required String stepGroupId,
    required String workflowId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
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
          '/workflow/${Uri.encodeComponent(workflowId)}/workflowstepgroups/${Uri.encodeComponent(stepGroupId)}/workflowsteps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowStepsResponse.fromJson(response);
  }

  /// Retry a failed step in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the step.
  ///
  /// Parameter [stepGroupId] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  Future<RetryWorkflowStepResponse> retryWorkflowStep({
    required String id,
    required String stepGroupId,
    required String workflowId,
  }) async {
    final $query = <String, List<String>>{
      'stepGroupId': [stepGroupId],
      'workflowId': [workflowId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/retryworkflowstep/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RetryWorkflowStepResponse.fromJson(response);
  }

  /// Create a step group in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow that will contain the step group.
  ///
  /// Parameter [description] :
  /// The description of the step group.
  ///
  /// Parameter [next] :
  /// The next step group.
  ///
  /// Parameter [previous] :
  /// The previous step group.
  Future<CreateWorkflowStepGroupResponse> createWorkflowStepGroup({
    required String name,
    required String workflowId,
    String? description,
    List<String>? next,
    List<String>? previous,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'workflowId': workflowId,
      if (description != null) 'description': description,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflowstepgroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowStepGroupResponse.fromJson(response);
  }

  /// Get the step group of a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  Future<GetWorkflowStepGroupResponse> getWorkflowStepGroup({
    required String id,
    required String workflowId,
  }) async {
    final $query = <String, List<String>>{
      'workflowId': [workflowId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflowstepgroup/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowStepGroupResponse.fromJson(response);
  }

  /// Update the step group in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step group.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [description] :
  /// The description of the step group.
  ///
  /// Parameter [name] :
  /// The name of the step group.
  ///
  /// Parameter [next] :
  /// The next step group.
  ///
  /// Parameter [previous] :
  /// The previous step group.
  Future<UpdateWorkflowStepGroupResponse> updateWorkflowStepGroup({
    required String id,
    required String workflowId,
    String? description,
    String? name,
    List<String>? next,
    List<String>? previous,
  }) async {
    final $query = <String, List<String>>{
      'workflowId': [workflowId],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflowstepgroup/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkflowStepGroupResponse.fromJson(response);
  }

  /// Delete a step group in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the step group you want to delete.
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  Future<void> deleteWorkflowStepGroup({
    required String id,
    required String workflowId,
  }) async {
    final $query = <String, List<String>>{
      'workflowId': [workflowId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workflowstepgroup/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List the step groups in a migration workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowId] :
  /// The ID of the migration workflow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token.
  Future<ListWorkflowStepGroupsResponse> listWorkflowStepGroups({
    required String workflowId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      'workflowId': [workflowId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflowstepgroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowStepGroupsResponse.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags added to a resource.
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
class CreateMigrationWorkflowResponse {
  /// The configuration ID of the application configured in Application Discovery
  /// Service.
  final String? adsApplicationConfigurationId;

  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// The time at which the migration workflow was created.
  final DateTime? creationTime;

  /// The description of the migration workflow.
  final String? description;

  /// The ID of the migration workflow.
  final String? id;

  /// The name of the migration workflow.
  final String? name;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The servers on which a step will be run.
  final List<String>? stepTargets;

  /// The tags to add on a migration workflow.
  final Map<String, String>? tags;

  /// The ID of the template.
  final String? templateId;

  /// The inputs for creating a migration workflow.
  final Map<String, StepInput>? workflowInputs;

  CreateMigrationWorkflowResponse({
    this.adsApplicationConfigurationId,
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.status,
    this.stepTargets,
    this.tags,
    this.templateId,
    this.workflowInputs,
  });

  factory CreateMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateMigrationWorkflowResponse(
      adsApplicationConfigurationId:
          json['adsApplicationConfigurationId'] as String?,
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      stepTargets: (json['stepTargets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateId: json['templateId'] as String?,
      workflowInputs: (json['workflowInputs'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, StepInput.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final adsApplicationConfigurationId = this.adsApplicationConfigurationId;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final stepTargets = this.stepTargets;
    final tags = this.tags;
    final templateId = this.templateId;
    final workflowInputs = this.workflowInputs;
    return {
      if (adsApplicationConfigurationId != null)
        'adsApplicationConfigurationId': adsApplicationConfigurationId,
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (stepTargets != null) 'stepTargets': stepTargets,
      if (tags != null) 'tags': tags,
      if (templateId != null) 'templateId': templateId,
      if (workflowInputs != null) 'workflowInputs': workflowInputs,
    };
  }
}

/// @nodoc
class GetMigrationWorkflowResponse {
  /// The configuration ID of the application configured in Application Discovery
  /// Service.
  final String? adsApplicationConfigurationId;

  /// The name of the application configured in Application Discovery Service.
  final String? adsApplicationName;

  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// Get a list of completed steps in the migration workflow.
  final int? completedSteps;

  /// The time at which the migration workflow was created.
  final DateTime? creationTime;

  /// The description of the migration workflow.
  final String? description;

  /// The time at which the migration workflow ended.
  final DateTime? endTime;

  /// The ID of the migration workflow.
  final String? id;

  /// The time at which the migration workflow was last modified.
  final DateTime? lastModifiedTime;

  /// The time at which the migration workflow was last started.
  final DateTime? lastStartTime;

  /// The time at which the migration workflow was last stopped.
  final DateTime? lastStopTime;

  /// The name of the migration workflow.
  final String? name;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  /// The tags added to the migration workflow.
  final Map<String, String>? tags;

  /// The ID of the template.
  final String? templateId;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  /// The total number of steps in the migration workflow.
  final int? totalSteps;

  /// The Amazon S3 bucket where the migration logs are stored.
  final String? workflowBucket;

  /// The inputs required for creating the migration workflow.
  final Map<String, StepInput>? workflowInputs;

  GetMigrationWorkflowResponse({
    this.adsApplicationConfigurationId,
    this.adsApplicationName,
    this.arn,
    this.completedSteps,
    this.creationTime,
    this.description,
    this.endTime,
    this.id,
    this.lastModifiedTime,
    this.lastStartTime,
    this.lastStopTime,
    this.name,
    this.status,
    this.statusMessage,
    this.tags,
    this.templateId,
    this.tools,
    this.totalSteps,
    this.workflowBucket,
    this.workflowInputs,
  });

  factory GetMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetMigrationWorkflowResponse(
      adsApplicationConfigurationId:
          json['adsApplicationConfigurationId'] as String?,
      adsApplicationName: json['adsApplicationName'] as String?,
      arn: json['arn'] as String?,
      completedSteps: json['completedSteps'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      id: json['id'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      lastStopTime: timeStampFromJson(json['lastStopTime']),
      name: json['name'] as String?,
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateId: json['templateId'] as String?,
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSteps: json['totalSteps'] as int?,
      workflowBucket: json['workflowBucket'] as String?,
      workflowInputs: (json['workflowInputs'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, StepInput.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final adsApplicationConfigurationId = this.adsApplicationConfigurationId;
    final adsApplicationName = this.adsApplicationName;
    final arn = this.arn;
    final completedSteps = this.completedSteps;
    final creationTime = this.creationTime;
    final description = this.description;
    final endTime = this.endTime;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final lastStartTime = this.lastStartTime;
    final lastStopTime = this.lastStopTime;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    final templateId = this.templateId;
    final tools = this.tools;
    final totalSteps = this.totalSteps;
    final workflowBucket = this.workflowBucket;
    final workflowInputs = this.workflowInputs;
    return {
      if (adsApplicationConfigurationId != null)
        'adsApplicationConfigurationId': adsApplicationConfigurationId,
      if (adsApplicationName != null) 'adsApplicationName': adsApplicationName,
      if (arn != null) 'arn': arn,
      if (completedSteps != null) 'completedSteps': completedSteps,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (id != null) 'id': id,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (lastStopTime != null)
        'lastStopTime': unixTimestampToJson(lastStopTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
      if (templateId != null) 'templateId': templateId,
      if (tools != null) 'tools': tools,
      if (totalSteps != null) 'totalSteps': totalSteps,
      if (workflowBucket != null) 'workflowBucket': workflowBucket,
      if (workflowInputs != null) 'workflowInputs': workflowInputs,
    };
  }
}

/// @nodoc
class UpdateMigrationWorkflowResponse {
  /// The ID of the application configured in Application Discovery Service.
  final String? adsApplicationConfigurationId;

  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// The time at which the migration workflow was created.
  final DateTime? creationTime;

  /// The description of the migration workflow.
  final String? description;

  /// The ID of the migration workflow.
  final String? id;

  /// The time at which the migration workflow was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the migration workflow.
  final String? name;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The servers on which a step will be run.
  final List<String>? stepTargets;

  /// The tags added to the migration workflow.
  final Map<String, String>? tags;

  /// The ID of the template.
  final String? templateId;

  /// The inputs required to update a migration workflow.
  final Map<String, StepInput>? workflowInputs;

  UpdateMigrationWorkflowResponse({
    this.adsApplicationConfigurationId,
    this.arn,
    this.creationTime,
    this.description,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.status,
    this.stepTargets,
    this.tags,
    this.templateId,
    this.workflowInputs,
  });

  factory UpdateMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMigrationWorkflowResponse(
      adsApplicationConfigurationId:
          json['adsApplicationConfigurationId'] as String?,
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      name: json['name'] as String?,
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      stepTargets: (json['stepTargets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateId: json['templateId'] as String?,
      workflowInputs: (json['workflowInputs'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, StepInput.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final adsApplicationConfigurationId = this.adsApplicationConfigurationId;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final status = this.status;
    final stepTargets = this.stepTargets;
    final tags = this.tags;
    final templateId = this.templateId;
    final workflowInputs = this.workflowInputs;
    return {
      if (adsApplicationConfigurationId != null)
        'adsApplicationConfigurationId': adsApplicationConfigurationId,
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (stepTargets != null) 'stepTargets': stepTargets,
      if (tags != null) 'tags': tags,
      if (templateId != null) 'templateId': templateId,
      if (workflowInputs != null) 'workflowInputs': workflowInputs,
    };
  }
}

/// @nodoc
class DeleteMigrationWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// The ID of the migration workflow.
  final String? id;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  DeleteMigrationWorkflowResponse({
    this.arn,
    this.id,
    this.status,
  });

  factory DeleteMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMigrationWorkflowResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ListMigrationWorkflowsResponse {
  /// The summary of the migration workflow.
  final List<MigrationWorkflowSummary> migrationWorkflowSummary;

  /// The pagination token.
  final String? nextToken;

  ListMigrationWorkflowsResponse({
    required this.migrationWorkflowSummary,
    this.nextToken,
  });

  factory ListMigrationWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListMigrationWorkflowsResponse(
      migrationWorkflowSummary:
          ((json['migrationWorkflowSummary'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  MigrationWorkflowSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final migrationWorkflowSummary = this.migrationWorkflowSummary;
    final nextToken = this.nextToken;
    return {
      'migrationWorkflowSummary': migrationWorkflowSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartMigrationWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// The ID of the migration workflow.
  final String? id;

  /// The time at which the migration workflow was last started.
  final DateTime? lastStartTime;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  StartMigrationWorkflowResponse({
    this.arn,
    this.id,
    this.lastStartTime,
    this.status,
    this.statusMessage,
  });

  factory StartMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return StartMigrationWorkflowResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final lastStartTime = this.lastStartTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class StopMigrationWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the migration workflow.
  final String? arn;

  /// The ID of the migration workflow.
  final String? id;

  /// The time at which the migration workflow was stopped.
  final DateTime? lastStopTime;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  StopMigrationWorkflowResponse({
    this.arn,
    this.id,
    this.lastStopTime,
    this.status,
    this.statusMessage,
  });

  factory StopMigrationWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return StopMigrationWorkflowResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      lastStopTime: timeStampFromJson(json['lastStopTime']),
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final lastStopTime = this.lastStopTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (lastStopTime != null)
        'lastStopTime': unixTimestampToJson(lastStopTime),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class CreateTemplateResponse {
  /// The tags added to the migration workflow template.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (ARN) of the migration workflow template. The
  /// format for an Migration Hub Orchestrator template ARN is
  /// <code>arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? templateArn;

  /// The ID of the migration workflow template.
  final String? templateId;

  CreateTemplateResponse({
    this.tags,
    this.templateArn,
    this.templateId,
  });

  factory CreateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateTemplateResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateArn: json['templateArn'] as String?,
      templateId: json['templateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      if (tags != null) 'tags': tags,
      if (templateArn != null) 'templateArn': templateArn,
      if (templateId != null) 'templateId': templateId,
    };
  }
}

/// @nodoc
class GetMigrationWorkflowTemplateResponse {
  /// The time at which the template was last created.
  final DateTime? creationTime;

  /// The time at which the template was last created.
  final String? description;

  /// The ID of the template.
  final String? id;

  /// The inputs provided for the creation of the migration workflow.
  final List<TemplateInput>? inputs;

  /// The name of the template.
  final String? name;

  /// The owner of the migration workflow template.
  final String? owner;

  /// The status of the template.
  final TemplateStatus? status;

  /// The status message of retrieving migration workflow templates.
  final String? statusMessage;

  /// The tags added to the migration workflow template.
  final Map<String, String>? tags;

  /// &gt;The Amazon Resource Name (ARN) of the migration workflow template. The
  /// format for an Migration Hub Orchestrator template ARN is
  /// <code>arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? templateArn;

  /// The class of the migration workflow template. The available template classes
  /// are:
  ///
  /// <ul>
  /// <li>
  /// A2C
  /// </li>
  /// <li>
  /// MGN
  /// </li>
  /// <li>
  /// SAP_MULTI
  /// </li>
  /// <li>
  /// SQL_EC2
  /// </li>
  /// <li>
  /// SQL_RDS
  /// </li>
  /// <li>
  /// VMIE
  /// </li>
  /// </ul>
  final String? templateClass;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  GetMigrationWorkflowTemplateResponse({
    this.creationTime,
    this.description,
    this.id,
    this.inputs,
    this.name,
    this.owner,
    this.status,
    this.statusMessage,
    this.tags,
    this.templateArn,
    this.templateClass,
    this.tools,
  });

  factory GetMigrationWorkflowTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMigrationWorkflowTemplateResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      inputs: (json['inputs'] as List?)
          ?.nonNulls
          .map((e) => TemplateInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      status: (json['status'] as String?)?.let(TemplateStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateArn: json['templateArn'] as String?,
      templateClass: json['templateClass'] as String?,
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final inputs = this.inputs;
    final name = this.name;
    final owner = this.owner;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    final templateArn = this.templateArn;
    final templateClass = this.templateClass;
    final tools = this.tools;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (inputs != null) 'inputs': inputs,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
      if (templateArn != null) 'templateArn': templateArn,
      if (templateClass != null) 'templateClass': templateClass,
      if (tools != null) 'tools': tools,
    };
  }
}

/// @nodoc
class UpdateTemplateResponse {
  /// The tags added to the migration workflow template.
  final Map<String, String>? tags;

  /// The ARN of the migration workflow template being updated. The format for an
  /// Migration Hub Orchestrator template ARN is
  /// <code>arn:aws:migrationhub-orchestrator:region:account:template/template-abcd1234</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? templateArn;

  /// The ID of the migration workflow template being updated.
  final String? templateId;

  UpdateTemplateResponse({
    this.tags,
    this.templateArn,
    this.templateId,
  });

  factory UpdateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTemplateResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateArn: json['templateArn'] as String?,
      templateId: json['templateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      if (tags != null) 'tags': tags,
      if (templateArn != null) 'templateArn': templateArn,
      if (templateId != null) 'templateId': templateId,
    };
  }
}

/// @nodoc
class DeleteTemplateResponse {
  DeleteTemplateResponse();

  factory DeleteTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMigrationWorkflowTemplatesResponse {
  /// The summary of the template.
  final List<TemplateSummary> templateSummary;

  /// The pagination token.
  final String? nextToken;

  ListMigrationWorkflowTemplatesResponse({
    required this.templateSummary,
    this.nextToken,
  });

  factory ListMigrationWorkflowTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMigrationWorkflowTemplatesResponse(
      templateSummary: ((json['templateSummary'] as List?) ?? const [])
          .nonNulls
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateSummary = this.templateSummary;
    final nextToken = this.nextToken;
    return {
      'templateSummary': templateSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPluginsResponse {
  /// The pagination token.
  final String? nextToken;

  /// Migration Hub Orchestrator plugins.
  final List<PluginSummary>? plugins;

  ListPluginsResponse({
    this.nextToken,
    this.plugins,
  });

  factory ListPluginsResponse.fromJson(Map<String, dynamic> json) {
    return ListPluginsResponse(
      nextToken: json['nextToken'] as String?,
      plugins: (json['plugins'] as List?)
          ?.nonNulls
          .map((e) => PluginSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final plugins = this.plugins;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (plugins != null) 'plugins': plugins,
    };
  }
}

/// @nodoc
class GetTemplateStepResponse {
  /// The time at which the step was created.
  final String? creationTime;

  /// The description of the step.
  final String? description;

  /// The ID of the step.
  final String? id;

  /// The name of the step.
  final String? name;

  /// The next step.
  final List<String>? next;

  /// The outputs of the step.
  final List<StepOutput>? outputs;

  /// The previous step.
  final List<String>? previous;

  /// The action type of the step. You must run and update the status of a manual
  /// step for the workflow to continue after the completion of the step.
  final StepActionType? stepActionType;

  /// The custom script to run tests on source or target environments.
  final StepAutomationConfiguration? stepAutomationConfiguration;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The ID of the template.
  final String? templateId;

  GetTemplateStepResponse({
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.next,
    this.outputs,
    this.previous,
    this.stepActionType,
    this.stepAutomationConfiguration,
    this.stepGroupId,
    this.templateId,
  });

  factory GetTemplateStepResponse.fromJson(Map<String, dynamic> json) {
    return GetTemplateStepResponse(
      creationTime: json['creationTime'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      outputs: (json['outputs'] as List?)
          ?.nonNulls
          .map((e) => StepOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stepActionType:
          (json['stepActionType'] as String?)?.let(StepActionType.fromString),
      stepAutomationConfiguration: json['stepAutomationConfiguration'] != null
          ? StepAutomationConfiguration.fromJson(
              json['stepAutomationConfiguration'] as Map<String, dynamic>)
          : null,
      stepGroupId: json['stepGroupId'] as String?,
      templateId: json['templateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final next = this.next;
    final outputs = this.outputs;
    final previous = this.previous;
    final stepActionType = this.stepActionType;
    final stepAutomationConfiguration = this.stepAutomationConfiguration;
    final stepGroupId = this.stepGroupId;
    final templateId = this.templateId;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (outputs != null) 'outputs': outputs,
      if (previous != null) 'previous': previous,
      if (stepActionType != null) 'stepActionType': stepActionType.value,
      if (stepAutomationConfiguration != null)
        'stepAutomationConfiguration': stepAutomationConfiguration,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (templateId != null) 'templateId': templateId,
    };
  }
}

/// @nodoc
class ListTemplateStepsResponse {
  /// The pagination token.
  final String? nextToken;

  /// The list of summaries of steps in a template.
  final List<TemplateStepSummary>? templateStepSummaryList;

  ListTemplateStepsResponse({
    this.nextToken,
    this.templateStepSummaryList,
  });

  factory ListTemplateStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateStepsResponse(
      nextToken: json['nextToken'] as String?,
      templateStepSummaryList: (json['templateStepSummaryList'] as List?)
          ?.nonNulls
          .map((e) => TemplateStepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templateStepSummaryList = this.templateStepSummaryList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (templateStepSummaryList != null)
        'templateStepSummaryList': templateStepSummaryList,
    };
  }
}

/// @nodoc
class GetTemplateStepGroupResponse {
  /// The time at which the step group was created.
  final DateTime? creationTime;

  /// The description of the step group.
  final String? description;

  /// The ID of the step group.
  final String? id;

  /// The time at which the step group was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The previous step group.
  final List<String>? previous;

  /// The status of the step group.
  final StepGroupStatus? status;

  /// The ID of the template.
  final String? templateId;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  GetTemplateStepGroupResponse({
    this.creationTime,
    this.description,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.next,
    this.previous,
    this.status,
    this.templateId,
    this.tools,
  });

  factory GetTemplateStepGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetTemplateStepGroupResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(StepGroupStatus.fromString),
      templateId: json['templateId'] as String?,
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final next = this.next;
    final previous = this.previous;
    final status = this.status;
    final templateId = this.templateId;
    final tools = this.tools;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
      if (status != null) 'status': status.value,
      if (templateId != null) 'templateId': templateId,
      if (tools != null) 'tools': tools,
    };
  }
}

/// @nodoc
class ListTemplateStepGroupsResponse {
  /// The summary of the step group in the template.
  final List<TemplateStepGroupSummary> templateStepGroupSummary;

  /// The pagination token.
  final String? nextToken;

  ListTemplateStepGroupsResponse({
    required this.templateStepGroupSummary,
    this.nextToken,
  });

  factory ListTemplateStepGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateStepGroupsResponse(
      templateStepGroupSummary:
          ((json['templateStepGroupSummary'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  TemplateStepGroupSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateStepGroupSummary = this.templateStepGroupSummary;
    final nextToken = this.nextToken;
    return {
      'templateStepGroupSummary': templateStepGroupSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateWorkflowStepResponse {
  /// The ID of the step.
  final String? id;

  /// The name of the step.
  final String? name;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The ID of the migration workflow.
  final String? workflowId;

  CreateWorkflowStepResponse({
    this.id,
    this.name,
    this.stepGroupId,
    this.workflowId,
  });

  factory CreateWorkflowStepResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowStepResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      stepGroupId: json['stepGroupId'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final stepGroupId = this.stepGroupId;
    final workflowId = this.workflowId;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class GetWorkflowStepResponse {
  /// The time at which the step was created.
  final DateTime? creationTime;

  /// The description of the step.
  final String? description;

  /// The time at which the step ended.
  final DateTime? endTime;

  /// The time at which the workflow was last started.
  final DateTime? lastStartTime;

  /// The name of the step.
  final String? name;

  /// The next step.
  final List<String>? next;

  /// The number of servers that have been migrated.
  final int? noOfSrvCompleted;

  /// The number of servers that have failed to migrate.
  final int? noOfSrvFailed;

  /// The outputs of the step.
  final List<WorkflowStepOutput>? outputs;

  /// The owner of the step.
  final Owner? owner;

  /// The previous step.
  final List<String>? previous;

  /// The output location of the script.
  final String? scriptOutputLocation;

  /// The status of the step.
  final StepStatus? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  /// The action type of the step. You must run and update the status of a manual
  /// step for the workflow to continue after the completion of the step.
  final StepActionType? stepActionType;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The ID of the step.
  final String? stepId;

  /// The servers on which a step will be run.
  final List<String>? stepTarget;

  /// The total number of servers that have been migrated.
  final int? totalNoOfSrv;

  /// The ID of the migration workflow.
  final String? workflowId;

  /// The custom script to run tests on source or target environments.
  final WorkflowStepAutomationConfiguration?
      workflowStepAutomationConfiguration;

  GetWorkflowStepResponse({
    this.creationTime,
    this.description,
    this.endTime,
    this.lastStartTime,
    this.name,
    this.next,
    this.noOfSrvCompleted,
    this.noOfSrvFailed,
    this.outputs,
    this.owner,
    this.previous,
    this.scriptOutputLocation,
    this.status,
    this.statusMessage,
    this.stepActionType,
    this.stepGroupId,
    this.stepId,
    this.stepTarget,
    this.totalNoOfSrv,
    this.workflowId,
    this.workflowStepAutomationConfiguration,
  });

  factory GetWorkflowStepResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowStepResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      noOfSrvCompleted: json['noOfSrvCompleted'] as int?,
      noOfSrvFailed: json['noOfSrvFailed'] as int?,
      outputs: (json['outputs'] as List?)
          ?.nonNulls
          .map((e) => WorkflowStepOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      owner: (json['owner'] as String?)?.let(Owner.fromString),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      scriptOutputLocation: json['scriptOutputLocation'] as String?,
      status: (json['status'] as String?)?.let(StepStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      stepActionType:
          (json['stepActionType'] as String?)?.let(StepActionType.fromString),
      stepGroupId: json['stepGroupId'] as String?,
      stepId: json['stepId'] as String?,
      stepTarget: (json['stepTarget'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      totalNoOfSrv: json['totalNoOfSrv'] as int?,
      workflowId: json['workflowId'] as String?,
      workflowStepAutomationConfiguration:
          json['workflowStepAutomationConfiguration'] != null
              ? WorkflowStepAutomationConfiguration.fromJson(
                  json['workflowStepAutomationConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final endTime = this.endTime;
    final lastStartTime = this.lastStartTime;
    final name = this.name;
    final next = this.next;
    final noOfSrvCompleted = this.noOfSrvCompleted;
    final noOfSrvFailed = this.noOfSrvFailed;
    final outputs = this.outputs;
    final owner = this.owner;
    final previous = this.previous;
    final scriptOutputLocation = this.scriptOutputLocation;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final stepActionType = this.stepActionType;
    final stepGroupId = this.stepGroupId;
    final stepId = this.stepId;
    final stepTarget = this.stepTarget;
    final totalNoOfSrv = this.totalNoOfSrv;
    final workflowId = this.workflowId;
    final workflowStepAutomationConfiguration =
        this.workflowStepAutomationConfiguration;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (noOfSrvCompleted != null) 'noOfSrvCompleted': noOfSrvCompleted,
      if (noOfSrvFailed != null) 'noOfSrvFailed': noOfSrvFailed,
      if (outputs != null) 'outputs': outputs,
      if (owner != null) 'owner': owner.value,
      if (previous != null) 'previous': previous,
      if (scriptOutputLocation != null)
        'scriptOutputLocation': scriptOutputLocation,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stepActionType != null) 'stepActionType': stepActionType.value,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (stepId != null) 'stepId': stepId,
      if (stepTarget != null) 'stepTarget': stepTarget,
      if (totalNoOfSrv != null) 'totalNoOfSrv': totalNoOfSrv,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowStepAutomationConfiguration != null)
        'workflowStepAutomationConfiguration':
            workflowStepAutomationConfiguration,
    };
  }
}

/// @nodoc
class UpdateWorkflowStepResponse {
  /// The ID of the step.
  final String? id;

  /// The name of the step.
  final String? name;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The ID of the migration workflow.
  final String? workflowId;

  UpdateWorkflowStepResponse({
    this.id,
    this.name,
    this.stepGroupId,
    this.workflowId,
  });

  factory UpdateWorkflowStepResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkflowStepResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      stepGroupId: json['stepGroupId'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final stepGroupId = this.stepGroupId;
    final workflowId = this.workflowId;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class DeleteWorkflowStepResponse {
  DeleteWorkflowStepResponse();

  factory DeleteWorkflowStepResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkflowStepResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListWorkflowStepsResponse {
  /// The summary of steps in a migration workflow.
  final List<WorkflowStepSummary> workflowStepsSummary;

  /// The pagination token.
  final String? nextToken;

  ListWorkflowStepsResponse({
    required this.workflowStepsSummary,
    this.nextToken,
  });

  factory ListWorkflowStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowStepsResponse(
      workflowStepsSummary: ((json['workflowStepsSummary'] as List?) ??
              const [])
          .nonNulls
          .map((e) => WorkflowStepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowStepsSummary = this.workflowStepsSummary;
    final nextToken = this.nextToken;
    return {
      'workflowStepsSummary': workflowStepsSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RetryWorkflowStepResponse {
  /// The ID of the step.
  final String? id;

  /// The status of the step.
  final StepStatus? status;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The ID of the migration workflow.
  final String? workflowId;

  RetryWorkflowStepResponse({
    this.id,
    this.status,
    this.stepGroupId,
    this.workflowId,
  });

  factory RetryWorkflowStepResponse.fromJson(Map<String, dynamic> json) {
    return RetryWorkflowStepResponse(
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(StepStatus.fromString),
      stepGroupId: json['stepGroupId'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    final stepGroupId = this.stepGroupId;
    final workflowId = this.workflowId;
    return {
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class CreateWorkflowStepGroupResponse {
  /// The time at which the step group is created.
  final DateTime? creationTime;

  /// The description of the step group.
  final String? description;

  /// The ID of the step group.
  final String? id;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The previous step group.
  final List<String>? previous;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  /// The ID of the migration workflow that contains the step group.
  final String? workflowId;

  CreateWorkflowStepGroupResponse({
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.next,
    this.previous,
    this.tools,
    this.workflowId,
  });

  factory CreateWorkflowStepGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowStepGroupResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final next = this.next;
    final previous = this.previous;
    final tools = this.tools;
    final workflowId = this.workflowId;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
      if (tools != null) 'tools': tools,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class GetWorkflowStepGroupResponse {
  /// The time at which the step group was created.
  final DateTime? creationTime;

  /// The description of the step group.
  final String? description;

  /// The time at which the step group ended.
  final DateTime? endTime;

  /// The ID of the step group.
  final String? id;

  /// The time at which the step group was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The owner of the step group.
  final Owner? owner;

  /// The previous step group.
  final List<String>? previous;

  /// The status of the step group.
  final StepGroupStatus? status;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  /// The ID of the migration workflow.
  final String? workflowId;

  GetWorkflowStepGroupResponse({
    this.creationTime,
    this.description,
    this.endTime,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.next,
    this.owner,
    this.previous,
    this.status,
    this.tools,
    this.workflowId,
  });

  factory GetWorkflowStepGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowStepGroupResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      id: json['id'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      owner: (json['owner'] as String?)?.let(Owner.fromString),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(StepGroupStatus.fromString),
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final endTime = this.endTime;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final next = this.next;
    final owner = this.owner;
    final previous = this.previous;
    final status = this.status;
    final tools = this.tools;
    final workflowId = this.workflowId;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (id != null) 'id': id,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (owner != null) 'owner': owner.value,
      if (previous != null) 'previous': previous,
      if (status != null) 'status': status.value,
      if (tools != null) 'tools': tools,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class UpdateWorkflowStepGroupResponse {
  /// The description of the step group.
  final String? description;

  /// The ID of the step group.
  final String? id;

  /// The time at which the step group was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The previous step group.
  final List<String>? previous;

  /// List of AWS services utilized in a migration workflow.
  final List<Tool>? tools;

  /// The ID of the migration workflow.
  final String? workflowId;

  UpdateWorkflowStepGroupResponse({
    this.description,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.next,
    this.previous,
    this.tools,
    this.workflowId,
  });

  factory UpdateWorkflowStepGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkflowStepGroupResponse(
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tools: (json['tools'] as List?)
          ?.nonNulls
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final next = this.next;
    final previous = this.previous;
    final tools = this.tools;
    final workflowId = this.workflowId;
    return {
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedTime != null)
        'lastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
      if (tools != null) 'tools': tools,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class DeleteWorkflowStepGroupResponse {
  DeleteWorkflowStepGroupResponse();

  factory DeleteWorkflowStepGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkflowStepGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListWorkflowStepGroupsResponse {
  /// The summary of step groups in a migration workflow.
  final List<WorkflowStepGroupSummary> workflowStepGroupsSummary;

  /// The pagination token.
  final String? nextToken;

  ListWorkflowStepGroupsResponse({
    required this.workflowStepGroupsSummary,
    this.nextToken,
  });

  factory ListWorkflowStepGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowStepGroupsResponse(
      workflowStepGroupsSummary:
          ((json['workflowStepGroupsSummary'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  WorkflowStepGroupSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowStepGroupsSummary = this.workflowStepGroupsSummary;
    final nextToken = this.nextToken;
    return {
      'workflowStepGroupsSummary': workflowStepGroupsSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The summary of a step group in a workflow.
///
/// @nodoc
class WorkflowStepGroupSummary {
  /// The ID of the step group.
  final String? id;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The owner of the step group.
  final Owner? owner;

  /// The previous step group.
  final List<String>? previous;

  /// The status of the step group.
  final StepGroupStatus? status;

  WorkflowStepGroupSummary({
    this.id,
    this.name,
    this.next,
    this.owner,
    this.previous,
    this.status,
  });

  factory WorkflowStepGroupSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowStepGroupSummary(
      id: json['id'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      owner: (json['owner'] as String?)?.let(Owner.fromString),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.let(StepGroupStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final next = this.next;
    final owner = this.owner;
    final previous = this.previous;
    final status = this.status;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (owner != null) 'owner': owner.value,
      if (previous != null) 'previous': previous,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class Owner {
  static const awsManaged = Owner._('AWS_MANAGED');
  static const custom = Owner._('CUSTOM');

  final String value;

  const Owner._(this.value);

  static const values = [awsManaged, custom];

  static Owner fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Owner._(value));

  @override
  bool operator ==(other) => other is Owner && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StepGroupStatus {
  static const awaitingDependencies =
      StepGroupStatus._('AWAITING_DEPENDENCIES');
  static const ready = StepGroupStatus._('READY');
  static const inProgress = StepGroupStatus._('IN_PROGRESS');
  static const completed = StepGroupStatus._('COMPLETED');
  static const failed = StepGroupStatus._('FAILED');
  static const paused = StepGroupStatus._('PAUSED');
  static const pausing = StepGroupStatus._('PAUSING');
  static const userAttentionRequired =
      StepGroupStatus._('USER_ATTENTION_REQUIRED');

  final String value;

  const StepGroupStatus._(this.value);

  static const values = [
    awaitingDependencies,
    ready,
    inProgress,
    completed,
    failed,
    paused,
    pausing,
    userAttentionRequired
  ];

  static StepGroupStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepGroupStatus._(value));

  @override
  bool operator ==(other) => other is StepGroupStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// List of AWS services utilized in a migration workflow.
///
/// @nodoc
class Tool {
  /// The name of an AWS service.
  final String? name;

  /// The URL of an AWS service.
  final String? url;

  Tool({
    this.name,
    this.url,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      if (name != null) 'name': name,
      if (url != null) 'url': url,
    };
  }
}

/// @nodoc
class StepStatus {
  static const awaitingDependencies = StepStatus._('AWAITING_DEPENDENCIES');
  static const skipped = StepStatus._('SKIPPED');
  static const ready = StepStatus._('READY');
  static const inProgress = StepStatus._('IN_PROGRESS');
  static const completed = StepStatus._('COMPLETED');
  static const failed = StepStatus._('FAILED');
  static const paused = StepStatus._('PAUSED');
  static const userAttentionRequired = StepStatus._('USER_ATTENTION_REQUIRED');

  final String value;

  const StepStatus._(this.value);

  static const values = [
    awaitingDependencies,
    skipped,
    ready,
    inProgress,
    completed,
    failed,
    paused,
    userAttentionRequired
  ];

  static StepStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepStatus._(value));

  @override
  bool operator ==(other) => other is StepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the step in a migration workflow.
///
/// @nodoc
class WorkflowStepSummary {
  /// The description of the step.
  final String? description;

  /// The name of the step.
  final String? name;

  /// The next step.
  final List<String>? next;

  /// The number of servers that have been migrated.
  final int? noOfSrvCompleted;

  /// The number of servers that have failed to migrate.
  final int? noOfSrvFailed;

  /// The owner of the step.
  final Owner? owner;

  /// The previous step.
  final List<String>? previous;

  /// The location of the script.
  final String? scriptLocation;

  /// The status of the step.
  final StepStatus? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  /// The action type of the step. You must run and update the status of a manual
  /// step for the workflow to continue after the completion of the step.
  final StepActionType? stepActionType;

  /// The ID of the step.
  final String? stepId;

  /// The total number of servers that have been migrated.
  final int? totalNoOfSrv;

  WorkflowStepSummary({
    this.description,
    this.name,
    this.next,
    this.noOfSrvCompleted,
    this.noOfSrvFailed,
    this.owner,
    this.previous,
    this.scriptLocation,
    this.status,
    this.statusMessage,
    this.stepActionType,
    this.stepId,
    this.totalNoOfSrv,
  });

  factory WorkflowStepSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowStepSummary(
      description: json['description'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      noOfSrvCompleted: json['noOfSrvCompleted'] as int?,
      noOfSrvFailed: json['noOfSrvFailed'] as int?,
      owner: (json['owner'] as String?)?.let(Owner.fromString),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      scriptLocation: json['scriptLocation'] as String?,
      status: (json['status'] as String?)?.let(StepStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      stepActionType:
          (json['stepActionType'] as String?)?.let(StepActionType.fromString),
      stepId: json['stepId'] as String?,
      totalNoOfSrv: json['totalNoOfSrv'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final next = this.next;
    final noOfSrvCompleted = this.noOfSrvCompleted;
    final noOfSrvFailed = this.noOfSrvFailed;
    final owner = this.owner;
    final previous = this.previous;
    final scriptLocation = this.scriptLocation;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final stepActionType = this.stepActionType;
    final stepId = this.stepId;
    final totalNoOfSrv = this.totalNoOfSrv;
    return {
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (noOfSrvCompleted != null) 'noOfSrvCompleted': noOfSrvCompleted,
      if (noOfSrvFailed != null) 'noOfSrvFailed': noOfSrvFailed,
      if (owner != null) 'owner': owner.value,
      if (previous != null) 'previous': previous,
      if (scriptLocation != null) 'scriptLocation': scriptLocation,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stepActionType != null) 'stepActionType': stepActionType.value,
      if (stepId != null) 'stepId': stepId,
      if (totalNoOfSrv != null) 'totalNoOfSrv': totalNoOfSrv,
    };
  }
}

/// @nodoc
class StepActionType {
  static const manual = StepActionType._('MANUAL');
  static const automated = StepActionType._('AUTOMATED');

  final String value;

  const StepActionType._(this.value);

  static const values = [manual, automated];

  static StepActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepActionType._(value));

  @override
  bool operator ==(other) => other is StepActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The custom script to run tests on source or target environments.
///
/// @nodoc
class WorkflowStepAutomationConfiguration {
  /// The command required to run the script.
  final PlatformCommand? command;

  /// The source or target environment.
  final RunEnvironment? runEnvironment;

  /// The Amazon S3 bucket where the script is located.
  final String? scriptLocationS3Bucket;

  /// The Amazon S3 key for the script location.
  final PlatformScriptKey? scriptLocationS3Key;

  /// The servers on which to run the script.
  final TargetType? targetType;

  WorkflowStepAutomationConfiguration({
    this.command,
    this.runEnvironment,
    this.scriptLocationS3Bucket,
    this.scriptLocationS3Key,
    this.targetType,
  });

  factory WorkflowStepAutomationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return WorkflowStepAutomationConfiguration(
      command: json['command'] != null
          ? PlatformCommand.fromJson(json['command'] as Map<String, dynamic>)
          : null,
      runEnvironment:
          (json['runEnvironment'] as String?)?.let(RunEnvironment.fromString),
      scriptLocationS3Bucket: json['scriptLocationS3Bucket'] as String?,
      scriptLocationS3Key: json['scriptLocationS3Key'] != null
          ? PlatformScriptKey.fromJson(
              json['scriptLocationS3Key'] as Map<String, dynamic>)
          : null,
      targetType: (json['targetType'] as String?)?.let(TargetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final runEnvironment = this.runEnvironment;
    final scriptLocationS3Bucket = this.scriptLocationS3Bucket;
    final scriptLocationS3Key = this.scriptLocationS3Key;
    final targetType = this.targetType;
    return {
      if (command != null) 'command': command,
      if (runEnvironment != null) 'runEnvironment': runEnvironment.value,
      if (scriptLocationS3Bucket != null)
        'scriptLocationS3Bucket': scriptLocationS3Bucket,
      if (scriptLocationS3Key != null)
        'scriptLocationS3Key': scriptLocationS3Key,
      if (targetType != null) 'targetType': targetType.value,
    };
  }
}

/// The output of a step.
///
/// @nodoc
class WorkflowStepOutput {
  /// The data type of the output.
  final DataType? dataType;

  /// The name of the step.
  final String? name;

  /// Determine if an output is required from a step.
  final bool? required;

  /// The value of the output.
  final WorkflowStepOutputUnion? value;

  WorkflowStepOutput({
    this.dataType,
    this.name,
    this.required,
    this.value,
  });

  factory WorkflowStepOutput.fromJson(Map<String, dynamic> json) {
    return WorkflowStepOutput(
      dataType: (json['dataType'] as String?)?.let(DataType.fromString),
      name: json['name'] as String?,
      required: json['required'] as bool?,
      value: json['value'] != null
          ? WorkflowStepOutputUnion.fromJson(
              json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final required = this.required;
    final value = this.value;
    return {
      if (dataType != null) 'dataType': dataType.value,
      if (name != null) 'name': name,
      if (required != null) 'required': required,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class DataType {
  static const string = DataType._('STRING');
  static const integer = DataType._('INTEGER');
  static const stringlist = DataType._('STRINGLIST');
  static const stringmap = DataType._('STRINGMAP');

  final String value;

  const DataType._(this.value);

  static const values = [string, integer, stringlist, stringmap];

  static DataType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DataType._(value));

  @override
  bool operator ==(other) => other is DataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure to hold multiple values of an output.
///
/// @nodoc
class WorkflowStepOutputUnion {
  /// The integer value.
  final int? integerValue;

  /// The list of string value.
  final List<String>? listOfStringValue;

  /// The string value.
  final String? stringValue;

  WorkflowStepOutputUnion({
    this.integerValue,
    this.listOfStringValue,
    this.stringValue,
  });

  factory WorkflowStepOutputUnion.fromJson(Map<String, dynamic> json) {
    return WorkflowStepOutputUnion(
      integerValue: json['integerValue'] as int?,
      listOfStringValue: (json['listOfStringValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integerValue = this.integerValue;
    final listOfStringValue = this.listOfStringValue;
    final stringValue = this.stringValue;
    return {
      if (integerValue != null) 'integerValue': integerValue,
      if (listOfStringValue != null) 'listOfStringValue': listOfStringValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// The script location for a particular operating system.
///
/// @nodoc
class PlatformScriptKey {
  /// The script location for Linux.
  final String? linux;

  /// The script location for Windows.
  final String? windows;

  PlatformScriptKey({
    this.linux,
    this.windows,
  });

  factory PlatformScriptKey.fromJson(Map<String, dynamic> json) {
    return PlatformScriptKey(
      linux: json['linux'] as String?,
      windows: json['windows'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linux = this.linux;
    final windows = this.windows;
    return {
      if (linux != null) 'linux': linux,
      if (windows != null) 'windows': windows,
    };
  }
}

/// Command to be run on a particular operating system.
///
/// @nodoc
class PlatformCommand {
  /// Command for Linux.
  final String? linux;

  /// Command for Windows.
  final String? windows;

  PlatformCommand({
    this.linux,
    this.windows,
  });

  factory PlatformCommand.fromJson(Map<String, dynamic> json) {
    return PlatformCommand(
      linux: json['linux'] as String?,
      windows: json['windows'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linux = this.linux;
    final windows = this.windows;
    return {
      if (linux != null) 'linux': linux,
      if (windows != null) 'windows': windows,
    };
  }
}

/// @nodoc
class RunEnvironment {
  static const aws = RunEnvironment._('AWS');
  static const onpremise = RunEnvironment._('ONPREMISE');

  final String value;

  const RunEnvironment._(this.value);

  static const values = [aws, onpremise];

  static RunEnvironment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RunEnvironment._(value));

  @override
  bool operator ==(other) => other is RunEnvironment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TargetType {
  static const single = TargetType._('SINGLE');
  static const all = TargetType._('ALL');
  static const none = TargetType._('NONE');

  final String value;

  const TargetType._(this.value);

  static const values = [single, all, none];

  static TargetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetType._(value));

  @override
  bool operator ==(other) => other is TargetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the step group in the template.
///
/// @nodoc
class TemplateStepGroupSummary {
  /// The ID of the step group.
  final String? id;

  /// The name of the step group.
  final String? name;

  /// The next step group.
  final List<String>? next;

  /// The previous step group.
  final List<String>? previous;

  TemplateStepGroupSummary({
    this.id,
    this.name,
    this.next,
    this.previous,
  });

  factory TemplateStepGroupSummary.fromJson(Map<String, dynamic> json) {
    return TemplateStepGroupSummary(
      id: json['id'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final next = this.next;
    final previous = this.previous;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
    };
  }
}

/// The summary of the step.
///
/// @nodoc
class TemplateStepSummary {
  /// The ID of the step.
  final String? id;

  /// The name of the step.
  final String? name;

  /// The next step.
  final List<String>? next;

  /// The owner of the step.
  final Owner? owner;

  /// The previous step.
  final List<String>? previous;

  /// The action type of the step. You must run and update the status of a manual
  /// step for the workflow to continue after the completion of the step.
  final StepActionType? stepActionType;

  /// The ID of the step group.
  final String? stepGroupId;

  /// The servers on which to run the script.
  final TargetType? targetType;

  /// The ID of the template.
  final String? templateId;

  TemplateStepSummary({
    this.id,
    this.name,
    this.next,
    this.owner,
    this.previous,
    this.stepActionType,
    this.stepGroupId,
    this.targetType,
    this.templateId,
  });

  factory TemplateStepSummary.fromJson(Map<String, dynamic> json) {
    return TemplateStepSummary(
      id: json['id'] as String?,
      name: json['name'] as String?,
      next: (json['next'] as List?)?.nonNulls.map((e) => e as String).toList(),
      owner: (json['owner'] as String?)?.let(Owner.fromString),
      previous: (json['previous'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stepActionType:
          (json['stepActionType'] as String?)?.let(StepActionType.fromString),
      stepGroupId: json['stepGroupId'] as String?,
      targetType: (json['targetType'] as String?)?.let(TargetType.fromString),
      templateId: json['templateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final next = this.next;
    final owner = this.owner;
    final previous = this.previous;
    final stepActionType = this.stepActionType;
    final stepGroupId = this.stepGroupId;
    final targetType = this.targetType;
    final templateId = this.templateId;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (next != null) 'next': next,
      if (owner != null) 'owner': owner.value,
      if (previous != null) 'previous': previous,
      if (stepActionType != null) 'stepActionType': stepActionType.value,
      if (stepGroupId != null) 'stepGroupId': stepGroupId,
      if (targetType != null) 'targetType': targetType.value,
      if (templateId != null) 'templateId': templateId,
    };
  }
}

/// The custom script to run tests on source or target environments.
///
/// @nodoc
class StepAutomationConfiguration {
  /// The command to run the script.
  final PlatformCommand? command;

  /// The source or target environment.
  final RunEnvironment? runEnvironment;

  /// The Amazon S3 bucket where the script is located.
  final String? scriptLocationS3Bucket;

  /// The Amazon S3 key for the script location.
  final PlatformScriptKey? scriptLocationS3Key;

  /// The servers on which to run the script.
  final TargetType? targetType;

  StepAutomationConfiguration({
    this.command,
    this.runEnvironment,
    this.scriptLocationS3Bucket,
    this.scriptLocationS3Key,
    this.targetType,
  });

  factory StepAutomationConfiguration.fromJson(Map<String, dynamic> json) {
    return StepAutomationConfiguration(
      command: json['command'] != null
          ? PlatformCommand.fromJson(json['command'] as Map<String, dynamic>)
          : null,
      runEnvironment:
          (json['runEnvironment'] as String?)?.let(RunEnvironment.fromString),
      scriptLocationS3Bucket: json['scriptLocationS3Bucket'] as String?,
      scriptLocationS3Key: json['scriptLocationS3Key'] != null
          ? PlatformScriptKey.fromJson(
              json['scriptLocationS3Key'] as Map<String, dynamic>)
          : null,
      targetType: (json['targetType'] as String?)?.let(TargetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final runEnvironment = this.runEnvironment;
    final scriptLocationS3Bucket = this.scriptLocationS3Bucket;
    final scriptLocationS3Key = this.scriptLocationS3Key;
    final targetType = this.targetType;
    return {
      if (command != null) 'command': command,
      if (runEnvironment != null) 'runEnvironment': runEnvironment.value,
      if (scriptLocationS3Bucket != null)
        'scriptLocationS3Bucket': scriptLocationS3Bucket,
      if (scriptLocationS3Key != null)
        'scriptLocationS3Key': scriptLocationS3Key,
      if (targetType != null) 'targetType': targetType.value,
    };
  }
}

/// The output of the step.
///
/// @nodoc
class StepOutput {
  /// The data type of the step output.
  final DataType? dataType;

  /// The name of the step.
  final String? name;

  /// Determine if an output is required from a step.
  final bool? required;

  StepOutput({
    this.dataType,
    this.name,
    this.required,
  });

  factory StepOutput.fromJson(Map<String, dynamic> json) {
    return StepOutput(
      dataType: (json['dataType'] as String?)?.let(DataType.fromString),
      name: json['name'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final required = this.required;
    return {
      if (dataType != null) 'dataType': dataType.value,
      if (name != null) 'name': name,
      if (required != null) 'required': required,
    };
  }
}

/// The summary of the Migration Hub Orchestrator plugin.
///
/// @nodoc
class PluginSummary {
  /// The name of the host.
  final String? hostname;

  /// The IP address at which the plugin is located.
  final String? ipAddress;

  /// The ID of the plugin.
  final String? pluginId;

  /// The time at which the plugin was registered.
  final String? registeredTime;

  /// The status of the plugin.
  final PluginHealth? status;

  /// The version of the plugin.
  final String? version;

  PluginSummary({
    this.hostname,
    this.ipAddress,
    this.pluginId,
    this.registeredTime,
    this.status,
    this.version,
  });

  factory PluginSummary.fromJson(Map<String, dynamic> json) {
    return PluginSummary(
      hostname: json['hostname'] as String?,
      ipAddress: json['ipAddress'] as String?,
      pluginId: json['pluginId'] as String?,
      registeredTime: json['registeredTime'] as String?,
      status: (json['status'] as String?)?.let(PluginHealth.fromString),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final ipAddress = this.ipAddress;
    final pluginId = this.pluginId;
    final registeredTime = this.registeredTime;
    final status = this.status;
    final version = this.version;
    return {
      if (hostname != null) 'hostname': hostname,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (pluginId != null) 'pluginId': pluginId,
      if (registeredTime != null) 'registeredTime': registeredTime,
      if (status != null) 'status': status.value,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class PluginHealth {
  static const healthy = PluginHealth._('HEALTHY');
  static const unhealthy = PluginHealth._('UNHEALTHY');

  final String value;

  const PluginHealth._(this.value);

  static const values = [healthy, unhealthy];

  static PluginHealth fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PluginHealth._(value));

  @override
  bool operator ==(other) => other is PluginHealth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the template.
///
/// @nodoc
class TemplateSummary {
  /// The Amazon Resource Name (ARN) of the template.
  final String? arn;

  /// The description of the template.
  final String? description;

  /// The ID of the template.
  final String? id;

  /// The name of the template.
  final String? name;

  TemplateSummary({
    this.arn,
    this.description,
    this.id,
    this.name,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class TemplateStatus {
  static const created = TemplateStatus._('CREATED');
  static const ready = TemplateStatus._('READY');
  static const pendingCreation = TemplateStatus._('PENDING_CREATION');
  static const creating = TemplateStatus._('CREATING');
  static const creationFailed = TemplateStatus._('CREATION_FAILED');

  final String value;

  const TemplateStatus._(this.value);

  static const values = [
    created,
    ready,
    pendingCreation,
    creating,
    creationFailed
  ];

  static TemplateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TemplateStatus._(value));

  @override
  bool operator ==(other) => other is TemplateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The input parameters of a template.
///
/// @nodoc
class TemplateInput {
  /// The data type of the template input.
  final DataType? dataType;

  /// The name of the template.
  final String? inputName;

  /// Determine if an input is required from the template.
  final bool? required;

  TemplateInput({
    this.dataType,
    this.inputName,
    this.required,
  });

  factory TemplateInput.fromJson(Map<String, dynamic> json) {
    return TemplateInput(
      dataType: (json['dataType'] as String?)?.let(DataType.fromString),
      inputName: json['inputName'] as String?,
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final inputName = this.inputName;
    final required = this.required;
    return {
      if (dataType != null) 'dataType': dataType.value,
      if (inputName != null) 'inputName': inputName,
      if (required != null) 'required': required,
    };
  }
}

/// The migration workflow template used as the source for the new template.
///
/// @nodoc
class TemplateSource {
  /// The ID of the workflow from the source migration workflow template.
  final String? workflowId;

  TemplateSource({
    this.workflowId,
  });

  Map<String, dynamic> toJson() {
    final workflowId = this.workflowId;
    return {
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class MigrationWorkflowStatusEnum {
  static const creating = MigrationWorkflowStatusEnum._('CREATING');
  static const notStarted = MigrationWorkflowStatusEnum._('NOT_STARTED');
  static const creationFailed =
      MigrationWorkflowStatusEnum._('CREATION_FAILED');
  static const starting = MigrationWorkflowStatusEnum._('STARTING');
  static const inProgress = MigrationWorkflowStatusEnum._('IN_PROGRESS');
  static const workflowFailed =
      MigrationWorkflowStatusEnum._('WORKFLOW_FAILED');
  static const paused = MigrationWorkflowStatusEnum._('PAUSED');
  static const pausing = MigrationWorkflowStatusEnum._('PAUSING');
  static const pausingFailed = MigrationWorkflowStatusEnum._('PAUSING_FAILED');
  static const userAttentionRequired =
      MigrationWorkflowStatusEnum._('USER_ATTENTION_REQUIRED');
  static const deleting = MigrationWorkflowStatusEnum._('DELETING');
  static const deletionFailed =
      MigrationWorkflowStatusEnum._('DELETION_FAILED');
  static const deleted = MigrationWorkflowStatusEnum._('DELETED');
  static const completed = MigrationWorkflowStatusEnum._('COMPLETED');

  final String value;

  const MigrationWorkflowStatusEnum._(this.value);

  static const values = [
    creating,
    notStarted,
    creationFailed,
    starting,
    inProgress,
    workflowFailed,
    paused,
    pausing,
    pausingFailed,
    userAttentionRequired,
    deleting,
    deletionFailed,
    deleted,
    completed
  ];

  static MigrationWorkflowStatusEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MigrationWorkflowStatusEnum._(value));

  @override
  bool operator ==(other) =>
      other is MigrationWorkflowStatusEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of a migration workflow.
///
/// @nodoc
class MigrationWorkflowSummary {
  /// The name of the application configured in Application Discovery Service.
  final String? adsApplicationConfigurationName;

  /// The steps completed in the migration workflow.
  final int? completedSteps;

  /// The time at which the migration workflow was created.
  final DateTime? creationTime;

  /// The time at which the migration workflow ended.
  final DateTime? endTime;

  /// The ID of the migration workflow.
  final String? id;

  /// The name of the migration workflow.
  final String? name;

  /// The status of the migration workflow.
  final MigrationWorkflowStatusEnum? status;

  /// The status message of the migration workflow.
  final String? statusMessage;

  /// The ID of the template.
  final String? templateId;

  /// All the steps in a migration workflow.
  final int? totalSteps;

  MigrationWorkflowSummary({
    this.adsApplicationConfigurationName,
    this.completedSteps,
    this.creationTime,
    this.endTime,
    this.id,
    this.name,
    this.status,
    this.statusMessage,
    this.templateId,
    this.totalSteps,
  });

  factory MigrationWorkflowSummary.fromJson(Map<String, dynamic> json) {
    return MigrationWorkflowSummary(
      adsApplicationConfigurationName:
          json['adsApplicationConfigurationName'] as String?,
      completedSteps: json['completedSteps'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      endTime: timeStampFromJson(json['endTime']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)
          ?.let(MigrationWorkflowStatusEnum.fromString),
      statusMessage: json['statusMessage'] as String?,
      templateId: json['templateId'] as String?,
      totalSteps: json['totalSteps'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adsApplicationConfigurationName =
        this.adsApplicationConfigurationName;
    final completedSteps = this.completedSteps;
    final creationTime = this.creationTime;
    final endTime = this.endTime;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final templateId = this.templateId;
    final totalSteps = this.totalSteps;
    return {
      if (adsApplicationConfigurationName != null)
        'adsApplicationConfigurationName': adsApplicationConfigurationName,
      if (completedSteps != null) 'completedSteps': completedSteps,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (templateId != null) 'templateId': templateId,
      if (totalSteps != null) 'totalSteps': totalSteps,
    };
  }
}

/// A map of key value pairs that is generated when you create a migration
/// workflow. The key value pairs will differ based on your selection of the
/// template.
///
/// @nodoc
class StepInput {
  /// The value of the integer.
  final int? integerValue;

  /// List of string values.
  final List<String>? listOfStringsValue;

  /// Map of string values.
  final Map<String, String>? mapOfStringValue;

  /// String value.
  final String? stringValue;

  StepInput({
    this.integerValue,
    this.listOfStringsValue,
    this.mapOfStringValue,
    this.stringValue,
  });

  factory StepInput.fromJson(Map<String, dynamic> json) {
    return StepInput(
      integerValue: json['integerValue'] as int?,
      listOfStringsValue: (json['listOfStringsValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      mapOfStringValue: (json['mapOfStringValue'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integerValue = this.integerValue;
    final listOfStringsValue = this.listOfStringsValue;
    final mapOfStringValue = this.mapOfStringValue;
    final stringValue = this.stringValue;
    return {
      if (integerValue != null) 'integerValue': integerValue,
      if (listOfStringsValue != null) 'listOfStringsValue': listOfStringsValue,
      if (mapOfStringValue != null) 'mapOfStringValue': mapOfStringValue,
      if (stringValue != null) 'stringValue': stringValue,
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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
